unit UComport;

interface

Uses SysUtils,Classes,windows, StrUtils,TypInfo;
  const
  version = '1.5';
   // useful constants
  NUL           = #0; SOH = #1; STX = #2; ETX = #3; EOT = #4; ENQ = #5; ACK = #6; BEL = #7; BS = #8;
  TAB           = #9; LF = #10; VT = #11; FF = #12; CR = #13; SO = #14; SI = #15; DLE = #16;
  DC1           = #17; DC2 = #18; DC3 = #19; DC4 = #20; NAK = #21; SYN = #22; ETB = #23; CAN = #24;
  EM            = #25; SUB = #26; ESC = #27; FS = #28; GS = #29; RS = #30; US = #31;

   // default receive terminator for receivemode rmTERM
  DefaultTerminator = #13#10;
type

  EComError = class( Exception );
{$M+}
  TParity = ( ptNONE, ptODD, ptEVEN, ptMARK, ptSPACE );
  TStopBit = ( sbONE, sbONE5, snTWO );
  TReceiveMode = ( rmRAW, rmTERM );
{$M-}

  //
  TCommThread = class;
  // callback templates
  TReceiveNotify = procedure( CharsReceived: DWORD ) of object;
  TLineEventNotify = procedure( EventWord: DWORD; ModemStatus: DWORD ) of object;
  TReceiveProc = procedure( Data: Ansistring ) of object;
  TStatusChanged = procedure( Status: boolean ) of object;
  //
  TComPort = class( TComponent )
  private
    { Private declarations }
    FPortID: Ansistring;
    FBaud: DWORD;
    FDataBits: byte;
    FParity: TParity;
    FStopBits: TStopBit;
    FReceiveMode: TReceiveMode;
    ComThread: TCommThread; // see below
    FOpen: boolean;
    FReceiveCallBack: TReceiveProc;
    FOnCTSChanged,
      FOnDSRChanged,
      FOnRingChanged,
      FOnRLSDChanged: TStatusChanged;
    FOnError,
      FOnPortOpen,
      FOnPortClose: TNotifyEvent;
    FWinQSizeIn,
      FWinQSizeOut: DWORD;
    FTerminator: Ansistring;
    RxBuf: Ansistring;
    procedure ReceiveNotify( NReceived: DWORD );
    procedure EventNotify( EventMask, ModemStatus: DWORD );
    procedure SetTerminator( TermStr: Ansistring );
    function GetTerminator: Ansistring;

  protected
    { Protected declarations }

  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure Send( Data: Ansistring );
    procedure SetDTR( Status: boolean );
    procedure SetRTS( Status: boolean );
    function NextToken( var s: Ansistring; Separator: Ansichar ): Ansistring;
    function StrToParity( sParity: Ansistring ): TParity;
    function ParityToStr( ParityMember: TParity ): Ansistring;
    function StopbToStr( Stopmember: TStopBit ): Ansistring;
    function StrToStopb( sStopBit: Ansistring ): TStopBit;

  published
    { Published declarations }
    property IsOpen : boolean Read Fopen ;
    property Port: Ansistring read FPortID write FPortID;
    property Baud: DWORD read FBaud write FBaud;
    property DataBits: byte read FDatabits write FDataBits;
    property Parity: TParity read FParity write FParity;
    property StopBits: TStopBit read FStopBits write FStopBits;
    property WinQSizeIn: DWORD read FWinQSizeIn write FWinQSizeIn;
    property WinQSizeOut: DWORD read FWinQSizeOut write FWinQSizeOut;
    property ReceiveMode: TReceiveMode read FReceiveMode write FReceiveMode;
    property Terminator: Ansistring read GetTerminator write SetTerminator;
    // events
    property OnPortOpen: TNotifyEvent read FOnPortOpen write FOnPortOpen;
    property OnPortClose: TNotifyEvent read FOnPortClose write FOnPortClose;
    property ReceiveCallBack: TReceiveProc read FReceiveCallBack
    write FReceiveCallBack;
    property OnCTSChanged: TStatusChanged read FOnCTSChanged
    write FOnCTSChanged;
    property OnDSRChanged: TStatusChanged read FOnDSRChanged
    write FOnDSRChanged;
    property OnRingChanged: TStatusChanged read FOnRingChanged
    write FOnRingChanged;
    property OnRLSDChanged: TStatusChanged read FOnRLSDChanged
    write FOnRLSDChanged;
    property OnError: TNotifyEvent read FonError write FOnError;
  end;

  //
  TCommThread = class( TThread )
  private
    DCB: TDCB;
    hCloseEvent: THandle;
    RXOvLap,
      TXOverLap: TOverLapped;
    FEventMask: DWORD;
    FModemStatus: DWORD;

  protected
    hCom: THandle;
    FOnReceive: TReceiveNotify;
    FLineEvent: TLineEventNotify;
    ErrorMask: DWORD;
    procedure Execute; override;
    procedure EventHandler;

  public
    constructor Create( APort: AnsiString );
    destructor Destroy; override;

    procedure SetCommPars( ABaudRate: DWORD;
      AByteSize: byte;
      AParity: DWORD;
      NStopBits: TStopBit );
    function HandleValid: boolean;
    function WriteComm( var buf; ByteCount: integer ): DWORD;
    procedure ReadComm( var buf; CharsToRead: DWORD );
    procedure SignalTerminate;
    procedure ClearComm;
  end;

// utility to enumerate available ports
procedure EnumPorts( PortList: TStrings );






implementation





//=============================================
procedure EnumPorts( PortList: TStrings );
var
  MaxPorts      : integer;
  hPort         : THandle;
  PortNumber    : integer;
  PortName      : string;
begin
  if PortList = nil then EXIT;

  { where are we running on? }
  case Win32PlatForm of
    VER_PLATFORM_WIN32_NT: MaxPorts := 256;
    VER_PLATFORM_WIN32_WINDOWS: MaxPorts := 9;
    else MaxPorts := 0;
  end;

  for PortNumber := 1 to MaxPorts do
  begin
    if PortNumber > 9 then
      PortName := '\\.\COM' + IntToStr( PortNumber ) // ask Microsoft why...
    else
      PortName := 'COM' + IntToStr( PortNumber );

    hPort := CreateFile( PChar( PortName ),
      GENERIC_READ or GENERIC_WRITE,
      0,
      nil,
      OPEN_EXISTING,
      0,
      0 );

   // note that ports already in use by other apps
   // will *NOT* be detected here
    if not ( hPort = INVALID_HANDLE_VALUE ) then
      PortList.Add( PortName );
    CloseHandle( hPort );
  end;
end;

//==============================================
function TComPort.ParityToStr( Paritymember: TParity ): Ansistring;
begin
  Result := GetEnumName( TypeInfo( TParity ), integer( ParityMember ) );
end;

//==========================================
function TComPort.StrToParity( sParity: Ansistring ): TParity;
begin
  Result := TParity( GetEnumValue( TypeInfo( TParity ), sParity ) );
end;

//==============================================
function TComPort.StopbToStr( Stopmember: TStopBit ): Ansistring;
begin
  Result := GetEnumName( TypeInfo( TStopBit ), integer( StopMember ) );
end;

//==========================================
function TComPort.StrToStopb( sStopBit: Ansistring ): TStopBit;
begin
  Result := TStopBit( GetEnumValue( TypeInfo( TStopBit ), sStopBit ) );
end;

//==============================================
constructor TComPort.Create( AOwner: TComponent ); //override;
begin
  inherited Create( AOwner );
  // set reasonable defaults
  FOpen := false;
  FPortID := 'COM1';
  FBaud := 9600;
  FParity := ptNONE;
  FDataBits := 8;
  FOpen := false;
  FWinQSizeIn := 8192;
  FWinQSizeOut := 8192;
  FReceiveMode := rmTERM;
  FTerminator := DefaultTerminator;
  RxBuf := '';
end;

//==========================
destructor TComPort.Destroy; //override;
begin
  if FOpen then
    Close;
  inherited Destroy;
end;

//======================
procedure TComPort.Open;
begin
  if not FOpen then
  begin

   // create the background thread
    ComThread := TCommThread.Create( FPortID );

   // we cannot open already occupied or nonexistent ports
    if not comThread.HandleValid then
      raise EComError.Create( 'TCOMPORT : cannot open ' + FPortID + #13
        + SysErrorMessage( GetLastError ) );

   // hook up callbacks from thread
    ComThread.FOnReceive := Self.ReceiveNotify;
    ComThread.FLineEvent := Self.EventNotify;
   // set communication parameters
    ComThread.SetCommPars( Fbaud, FDataBits, DWORD( FParity ), FStopBits );
   // set buffersizes of Windows' driver
    SetUpComm( ComThread.hCom, FWinQSizeIn, FWinQSizeOut );
   // go...
    FOpen := true;
    ComThread.Resume;
    if Assigned( FOnPortOpen ) then
      FOnPortOpen( Self );
  end;
end;

//=======================
procedure TComPort.Close;
begin
  if FOpen then
  begin
    FOpen := false;
   // kill callbacks
    ComThread.FOnReceive := nil;
    ComThread.FLineEvent := nil;
   // signal thread
    ComThread.SignalTerminate;
   // wait for standstill...
    ComThread.WaitFor;
    if Assigned( FOnPortClose ) then
      FOnPortClose( Self );
  end;
end;

//==========================================
// set DTR line
procedure TComPort.SetDTR( Status: boolean );
begin
  if FOPen then
    case Status of
      true: EscapeCommFunction( ComThread.hCom, Windows.SETDTR );
      false: EscapeCommFunction( ComThread.hCom, Windows.CLRDTR );
    end;
end;

//==========================================
// set RTS line
procedure TComPort.SetRTS( Status: boolean );
begin
  if FOpen then
    case Status of
      true: EscapeCommFunction( ComThread.hCom, Windows.SETRTS );
      false: EscapeCommFunction( ComThread.hCom, Windows.CLRRTS );
    end;
end;

//============================================================
// gets called from thread when line/modem events occur
procedure TComPort.EventNotify( EventMask, ModemStatus: DWORD );
begin

  // check for each possible event,
  // and fire callback (if assigned)
  if ( EventMask and EV_CTS ) > 0 then
    if Assigned( FOnCTSChanged ) then
      FOnCTSChanged( ( ModemStatus and MS_CTS_ON ) = 0 );
  //
  if ( EventMask and EV_DSR ) > 0 then
    if Assigned( FOnDSRChanged ) then
      FOnDSRChanged( ( ModemStatus and MS_DSR_ON ) = 0 );
  //
  if ( EventMask and EV_RLSD ) > 0 then
    if Assigned( FOnRLSDChanged ) then
      FOnRLSDChanged( ( ModemStatus and MS_RLSD_ON ) = 0 );
  //
  if ( EventMask and EV_RING ) > 0 then
    if Assigned( FOnRingChanged ) then
      FOnRingChanged( ( ModemStatus and MS_RING_ON ) = 0 );
  //
  if ( EventMask and EV_ERR ) > 0 then
    if Assigned( FOnError ) then
      FOnError( Self );
end;

//=======================================================
// gets called from thread when characters were received
// note that Windows will typically report incoming
// characters in blocks of 8 or more characters
// depending on FreceiveMode, these chunks are either
// directly reported to the application ( rmRAW ),
// or accumulated in a buffer until a given terminator string
// was received ( rmTERM )
procedure TComPort.ReceiveNotify( NReceived: DWORD );
var
  TempBuf       : Ansistring;
  TermPos       : integer;
begin
  // chars were received, so prepare a buffer
  SetLength( TempBuf, NReceived );
  // read port anyway, so Window's buffer does not overflow
  ComThread.ReadComm( TempBuf[1], NReceived );
  // if active, process & do callback
  if FOpen and Assigned( FReceiveCallBack ) then
    case FReceiveMode of

      rmRAW: FReceiveCallBack( TempBuf );

      rmTERM: begin
          RxBuf := RxBuf + TempBuf; // accumulate
          TermPos := Pos( FTerminator, RxBuf );
              // do we have a terminator in the buffer?
          if TermPos > 0 then
          begin
                // extract up to and including terminator
            TempBuf := Copy( RxBuf, 1, TermPos
              + length( FTerminator ) - 1 );
                // notify app.
            FReceiveCallBack( TempBuf );
                //we must preserve fragments of next message, if any
            Delete( RxBuf, 1, TermPos + length( FTerminator ) - 1 );
          end
        end;
    end;
end;

//======================================
procedure TComPort.Send( Data: Ansistring );
begin
  if FOpen then
    ComThread.WriteComm( Data[1], Length( Data ) );
end;

//===============================================
// in order to make control characters "readable",
// terminator strings entered from the Object Inspector
// or from code must be supplied in the form
// #<ascii code>#<ascii code>
// example : #13#10 for carriage return line feed
procedure TComPort.SetTerminator( TermStr: Ansistring );
var
  Temp          : string;
begin

  FTerminator := '';
  if Length( TermStr ) > 0 then
    Delete( TermStr, 1, 1 ); // delete leading '#'
  while length( TermStr ) > 0 do
  begin
    Temp := NextToken( TermStr, '#' );
    try
      FTerminator := FTerminator + Chr( StrToInt( Temp ) );
    except
      FTerminator := DefaultTerminator; // force sensible default
      raise EComError.Create( 'Illegal terminator string.' + #13
        + 'format : #<asciicode>#<asciicode>#<...>' + #13
        + 'example: #13#10' );
    end;
  end;
  if Length( FTerminator ) = 0 then
    raise EComError.Create( 'Terminator string cannot be empty!' );

end;

//==============================
// note that here the reverse is done:
// FTerminator internally contains the
// "true" character values, but here
// a "readable" string is returned,
// e.g. '#13#10' for carriage return/linefeed
function TComPort.GetTerminator: Ansistring;
var
  i             : integer;
begin
  Result := '';
  if Length( FTerminator ) > 0 then
    for i := 1 to Length( FTerminator ) do
      Result := Result + '#' + IntToStr( ord( FTerminator[i] ) )
end;

//=======================================================
function TComPort.NextToken( var s: Ansistring; Separator: Ansichar ): Ansistring;
var
  Sep_Pos       : byte;
begin
  Result := '';
  if length( s ) > 0 then begin
    Sep_Pos := pos( Separator, s );
    if Sep_Pos > 0 then begin
      Result := copy( s, 1, Pred( Sep_Pos ) );
      Delete( s, 1, Sep_Pos );
    end
    else begin
      Result := s; // no more separators, return whole string
      s := '';
    end;
  end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++TCommThread+++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//=========================================
constructor TCommThread.Create( APort: AnsiString );
var
 anwPort : String ;
begin
 anwPort := APort ;
  hCom := CreateFileA( PansiChar( APort ),
    GENERIC_READ or GENERIC_WRITE,
    0, // exclusive access
    nil, // no sec. attr.
    OPEN_EXISTING,
    FILE_FLAG_OVERLAPPED,
    0 );
  //
  if hCom = INVALID_HANDLE_VALUE then EXIT;
  // get current settings
  GetCommState( hCom, DCB );
  // set defaults
  with DCB do begin
    Baudrate := 9600;
    ByteSize := 8;
    Parity := EVENPARITY;
    StopBits := ONESTOPBIT;
    Flags := 1;
  end;
  SetUpComm( hCom, 512, 512 );
  SetCommState( hCom, DCB );
  SetCommMask( hCom, EV_RXCHAR
    or EV_CTS
    or EV_RLSD
    or EV_DSR
    or EV_RING
    or EV_ERR );
  ClearComm;
  inherited Create( true ); // create suspended
  Priority := tpHIGHER;
  FreeOnTerminate := true; // thread will automatically free itself
end;

//============================
destructor TCommThread.Destroy;
begin
  CloseHandle( hCom );
end;

//==================================================
procedure TCommThread.SetCommPars( ABaudRate: DWORD;
  AByteSize: byte;
  AParity: DWORD;
  NStopBits: TStopBit );
begin
    // read current settings
  GetCommState( hCom, DCB );
    // Set new values
  with DCB do begin
    Baudrate := ABaudRate;
    ByteSize := AByteSize;
    Parity := AParity;
    StopBits := DWORD( NStopBits );
    Flags := 1;
  end;
    // write back
  SetCommState( hCom, DCB );
end;

//===========================================
function TCommThread.HandleValid: boolean;
begin
  Result := not ( hCom = INVALID_HANDLE_VALUE );
end;

//======================================
procedure TCommThread.EventHandler; { synchronize }
var
  ComStat       : TComStat;
  CharsToRead   : DWORD;
begin
  ClearCommError( hCom, ErrorMask, @ComStat );
   // anything received ?
  if ( FEventMask and EV_RXCHAR ) > 0 then
  begin
    CharsToRead := ComStat.cbInQue;
    if Assigned( FOnReceive ) then
      FOnReceive( CharsToRead );
     // event was handled, so clear this bit;
    FEventMask := FEventMask and not EV_RXCHAR;
  end;
   // any other events ?
  if ( FEventMask > 0 )
    and Assigned( FLineEvent ) then
    FLineEvent( FEventMask, FModemStatus );
end;

//==========================
procedure TCommTHread.ClearComm;
begin
  PurgeComm( hCom, PURGE_RXCLEAR
    or PURGE_TXCLEAR
    or PURGE_RXABORT
    or PURGE_TXABORT );
  EscapeCommFunction( hCom, Windows.CLRDTR );
  EscapeCommFunction( hCom, Windows.CLRRTS );
end;

//====================================
procedure TCommThread.SignalTerminate;
begin
  FonReceive := nil; // kill callbacks...
  SetEvent( hCloseEvent ); // signal thread to terminate
end;

//============================
// receive & event thread
procedure TCommThread.Execute;
var
  HandlesToWaitFor: array[0..2] of THandle;
  ovlap         : TOverLapped;
  EvHandle,
    EvSignal    : DWORD;
begin
  // set up a close event
  hCloseEvent := CreateEvent( nil, true, False, nil );
  // set up overlapped event
  FillChar( OvLap, sizeof( OvLap ), 0 );
  OvLap.hEvent := CreateEvent( nil, true, true, nil );
  EvHandle := ovLap.hEvent;
  // set up handle array
  HandlesToWaitFor[0] := hCloseEvent;
  HandlesToWaitFor[1] := OvLap.hEvent;

  // start spinning...
  repeat
    // wait for event
    WaitCommEvent( hCom, FEventMask, @ovlap );
    // get modem status
    GetCommModemStatus( hCom, FModemStatus );
    // see which event occurred
    evSignal := WaitForMultipleObjects( 2, @HandlesToWaitFor, False, INFINITE );
    case EvSignal of
      WAIT_OBJECT_0: begin
          Priority := tpLOWEST;
          SetCommMask( hCom, 0 ); // clear event mask
          Terminate;
        end;
      WAIT_OBJECT_0 + 1: Synchronize( EventHandler )
    end;
  until Terminated;
  // close handles
  CloseHandle( OvLap.hEvent );
  CloseHandle( hCloseEvent )
end;

//=========================================================
function TCommThread.WriteComm( var buf; ByteCount: integer ): DWORD;
begin
  FillChar( TXOverLap, SizeOf( TXOverLap ), 0 );
  WriteFile( hCom, Buf, ByteCount, Result, @TXOverLap );
end;


procedure TCommThread.ReadComm( var buf; CharsToRead: DWORD );
var
  ByteCount     : DWORD;
begin
  if CharsToRead > 0 then begin
    FillChar( RXOvLap, SizeOf( RXOvLap ), 0 );
    Readfile( hCom, Buf, CharsToRead, ByteCount, @RXOvLap )
  end
end;

{=========================================================}









end.
