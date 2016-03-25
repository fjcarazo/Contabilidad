unit XRoutines;
interface

Uses SysUtils,Classes,Forms,windows,HtmlHelpAPI,TcVariables,ExtCtrls,StdCtrls,
     Controls,Registry,Graphics,StrUtils,typinfo,IniFiles,tcashclasses;
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
  TReceiveProc = procedure( Data: string ) of object;
  TStatusChanged = procedure( Status: boolean ) of object;
  //
  TComPort = class( TComponent )
  private
    { Private declarations }
    FPortID: string;
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
    FTerminator: string;
    RxBuf: string;
    procedure ReceiveNotify( NReceived: DWORD );
    procedure EventNotify( EventMask, ModemStatus: DWORD );
    procedure SetTerminator( TermStr: string );
    function GetTerminator: string;

  protected
    { Protected declarations }

  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure Send( Data: string );
    procedure SetDTR( Status: boolean );
    procedure SetRTS( Status: boolean );
    function NextToken( var s: string; Separator: char ): string;
    function StrToParity( sParity: string ): TParity;
    function ParityToStr( ParityMember: TParity ): string;
    function StopbToStr( Stopmember: TStopBit ): string;
    function StrToStopb( sStopBit: string ): TStopBit;

  published
    { Published declarations }
    property Port: string read FPortID write FPortID;
    property Baud: DWORD read FBaud write FBaud;
    property DataBits: byte read FDatabits write FDataBits;
    property Parity: TParity read FParity write FParity;
    property StopBits: TStopBit read FStopBits write FStopBits;
    property WinQSizeIn: DWORD read FWinQSizeIn write FWinQSizeIn;
    property WinQSizeOut: DWORD read FWinQSizeOut write FWinQSizeOut;
    property ReceiveMode: TReceiveMode read FReceiveMode write FReceiveMode;
    property Terminator: string read GetTerminator write SetTerminator;
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
    constructor Create( APort: string );
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

Procedure  DeleteAllFiles(sDirectory:String);
Function   GetBookStatus(Status:integer;StatType:Byte):Boolean;
Procedure  HtmlShowTopic(Index:Integer);
Function   StockRecToXml(aStock:TStockRec):String;
function   GetSubAccountCode(AccountNumber : String;AddDefaults : boolean = false;HasSeperator:Boolean = true) : String;
function   GetMainAccountCode(AccountNumber : String) : String;
function   GetMainAccountLongCode(AccountNumber : String) : String;
function   GetSubAccountLongCode(AccountNumber : String) : String;
Function   ZipAccountCode(AccountCode:string):String;
Function   Str2Int(S:String):Integer;
Function   Str2Char(S:String):Char;
Function   Str2Float(S:String):Extended;
Function   StrDb2DateTime(S:String):TDateTime;
Function   DateTime2DbStr(D:TDateTime):String;
Function   Date2DbStr(D:TDateTime):String;
Function   Datetime2Xmlstr(D:TDateTime):String;
procedure  cbEnable(cbObject : TComboBox);
procedure  cbDisable(cbObject : TComboBox);
procedure  Highlight(EditBox : TEdit);
procedure  BackNormal(EditBox : TEdit);
Function   NextEmailFileNo:Integer;
Function   Char2AccountType(aChar:Char):integer;
Function   GetArrowIdx(AscIndexOrder:Boolean):integer;
Function   FormatFileName(aDir,aFile,ext:String):String;
Function   Bool2Str(Value:Boolean):String;
//Function   CheckAccount(AccountCode:String;Var AccType:Integer):String;
Function   FctTrimInStr(vString:String):String;
Function   GettmpFolder:String;
Function   GetCommonDBPath:String;
Function   LocateRec(PboxSelect:TrSelect;ID:Integer):Integer;
Function   GetRec(PboxSelect:TrSelect;ID:Integer):Boolean;
Procedure  SetRec(PboxSelect:TrSelect;ID:integer;Value:Boolean);
Procedure  CopyAccSelected(PboxSelect:TrSelect;Var Value:TrSelect);
Function   CopyInt(S:String;Index, Count: Integer): Integer;
Function   Str2Bool(Value:String):Boolean;
Function   Addtag(aTag,Value:string):string; Overload;
Function   AddtagExt(aTag,Value:string):string;
Procedure  Addtag(Var DestStr:String;aTag,Value:string);Overload;
Function   CheckT3XFile(aStream:TStream;Var BooksName:String):Boolean;
Function   HalfTag(DestStr:String;aTag:String):String;
Function   FCode(Code:Integer=0):String;
Function   LTag(aTag:String):String;
Function   RTag(aTag:String):String;
Procedure  SplitStrNum(Var Source,NumPart:String);
procedure   PrintOnComPort(aDevice:tcashclasses.TComPort;aText:String);
Function   AccType2Char(aType:Integer):Char;
Function   Str2Date(S:String):TDate;
Function   ReadT3IniFile(SSection,SKey,sDefault:String):String;
Procedure  WriteT3IniFile(SSection,SKey,SValue:String);
Procedure ReadAppConfig;






implementation

uses janStrings, UDMTCCoreLink, OSFGeneralRoutines;



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
function TComPort.ParityToStr( Paritymember: TParity ): string;
begin
  Result := GetEnumName( TypeInfo( TParity ), integer( ParityMember ) );
end;

//==========================================
function TComPort.StrToParity( sParity: string ): TParity;
begin
  Result := TParity( GetEnumValue( TypeInfo( TParity ), sParity ) );
end;

//==============================================
function TComPort.StopbToStr( Stopmember: TStopBit ): string;
begin
  Result := GetEnumName( TypeInfo( TStopBit ), integer( StopMember ) );
end;

//==========================================
function TComPort.StrToStopb( sStopBit: string ): TStopBit;
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
  TempBuf       : string;
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
procedure TComPort.Send( Data: string );
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
procedure TComPort.SetTerminator( TermStr: string );
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
function TComPort.GetTerminator: string;
var
  i             : integer;
begin
  Result := '';
  if Length( FTerminator ) > 0 then
    for i := 1 to Length( FTerminator ) do
      Result := Result + '#' + IntToStr( ord( FTerminator[i] ) )
end;

//=======================================================
function TComPort.NextToken( var s: string; Separator: char ): string;
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
constructor TCommThread.Create( APort: string );
begin
  hCom := CreateFile( PChar( APort ),
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

    EvSignal    : DWORD;
begin
  // set up a close event
  hCloseEvent := CreateEvent( nil, true, False, nil );
  // set up overlapped event
  FillChar( OvLap, sizeof( OvLap ), 0 );
  OvLap.hEvent := CreateEvent( nil, true, true, nil );

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
function TCommThread.WriteComm( var buf; ByteCount: integer ): DWORD;
begin
  FillChar( TXOverLap, SizeOf( TXOverLap ), 0 );
  WriteFile( hCom, Buf, ByteCount, Result, @TXOverLap );
end;

Procedure DeleteAllFiles(sDirectory:String);
// This will delete all file in the Directory
// And make it empty
// If the Directory dosen't exist it will create it
Var
  F:TSearchRec;
begin
  sDirectory := IncludeTrailingPathDelimiter(sDirectory) ;
  if DirectoryExists(sDirectory) then
  begin
    if FindFirst(sDirectory+'*.*',faAnyFile ,F)=0 then
    begin
           DeleteFile(PChar(sDirectory+f.NAme));
         // RecycleFile(sDirectory+f.NAme)
    while FindNext(F)=0 do begin
        DeleteFile(PChar(sDirectory+f.NAme));
    end;
         // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
    end;
  end
  else
    MkDir(sDirectory);
end;

Function  GetBookStatus(Status:integer;StatType:BYte):Boolean;
begin
 Case StatType of
 1: Begin {Set of books in use 0:not , 1:in use}
      Result := (Status AND 1 ) = 1
    end;
 2: Begin {last opened 0:not the last, 1:that last }
       Result := (Status AND 2) = 2
    end;
 else result := false;
 end;
end;



procedure PrintOnComPort(aDevice:tcashclasses.TComPort;aText:String);
Const
   RxBufferSize = 256;
   TxBufferSize = 256;
Var
   DCB: TDCB;
   Config : String;
   CommTimeouts : TCommTimeouts;
   DeviceName: Array[0..80] of Char;
   ComFile: THandle;
   BytesWritten: Cardinal;

   Function SafePortCall(Value:Boolean;PrtErrCode:Byte):Boolean;
   begin
     Result := False;
     if Not Value then
     begin
       case PrtErrCode of
       1: ;

       else

       end;
       CloseHandle(ComFile);
       Result := True;
     end;
   end;

begin
  StrPCopy(DeviceName,'COM'+aDevice.Name+':');
  ComFile := CreateFile(DeviceName, GENERIC_READ or GENERIC_WRITE, 0, Nil,
                                    OPEN_EXISTING,
                                    FILE_ATTRIBUTE_NORMAL, 0);
  Try
    Try
       if SafePortCall(Not(ComFile = INVALID_HANDLE_VALUE),0) then  exit;
       if SafePortCall(SetupComm(ComFile, RxBufferSize, TxBufferSize),1) then Exit;
       if SafePortCall(GetCommState(ComFile, DCB),2) then exit;
       Config := 'baud='+ IntToStr(aDevice.baud)+' parity='+aDevice.parity +
             ' Data='+ IntToStr(aDevice.data)+' stop='+IntToStr(aDevice.stop)+ #0;
       if SafePortCall(BuildCommDCB(@Config[1], DCB),6) then exit;
       if SafePortCall(SetCommState(ComFile, DCB),3) then exit;
       with CommTimeouts do
       begin
         ReadIntervalTimeout := 0;
         ReadTotalTimeoutMultiplier := 0;
         ReadTotalTimeoutConstant := 1000;
         WriteTotalTimeoutMultiplier := 0;
         WriteTotalTimeoutConstant := 1000;
       end;
       if SafePortCall(SetCommTimeouts(ComFile, CommTimeouts),4) then;
       if SafePortCall(WriteFile (ComFile, aText[1], Length(aText), BytesWritten, Nil),5) then;
     except
     end;
   Finally
     CloseHandle(ComFile);
   end;
end;


Procedure HtmlShowTopic(Index:Integer);
begin
  HtmlHelpShowContentID(Index);
end;

Function StockRecToXml(aStock:TStockRec):String;
begin
  // done : Pieter use the decimalsep
  Result := '<stockrecord ';
  Result := Result + ' WStockID="' + IntToStr(aStock.WStockID)+'" '
  + 'SDescription="' + aStock.SDescription+'" '
  + 'FPrice1="' + StringReplace(FloatToStr(aStock.FPrice1),DecimalSeparator,'.',[])+'" '
  + 'FPrice2="' + StringReplace(FloatToStr(aStock.FPrice2),DecimalSeparator,'.',[])+'" '
  + 'FPrice3="' + StringReplace(FloatToStr(aStock.FPrice3),DecimalSeparator,'.',[])+'" '
  + 'SSTOCKCODE="' + aStock.SSTOCKCODE+'" '
  + 'Smanufacturer="' + aStock.Smanufacturer+'" '
  + 'WInputTaxID="' + IntToStr(aStock.WInputTaxID)+'" '
  + 'WOutputTaxID="' + IntToStr(aStock.WOutputTaxID)+'" '
  + 'SInTax="'+ aStock.SInTax +'" '
  + 'SOutTax="'+ aStock.SOutTax +'" '
  + 'FInputRate="'+ StringReplace(FloatToStr(aStock.FInputRate),DecimalSeparator,'.',[]) +'" '
  + 'FOutputRate="'+ StringReplace(FloatToStr(aStock.FOutputRate),DecimalSeparator,'.',[])+'" '
  + '>';
end;

function GetSubAccountCode(AccountNumber : String;AddDefaults : boolean = false;HasSeperator:Boolean = true) : String;
var
  i    : Integer;
begin
  // done : Pieter simply get the caracters after 6 pos and stripout the '-' sign
  // new way makes spaces and - signs posible in some combinations
  if HasSeperator then
  AccountNumber := ZipAccountCode(AccountNumber);
  result := '' ;
  if  length(AccountNumber) > MainAccountLength then
    begin
       for i := 1+MainAccountLength to length(AccountNumber) do
        result := result + AccountNumber[i] ;
    end;
// result :=  StringReplace(result,'-','',[rfReplaceAll]);
 if AddDefaults then
    begin
       if Length(result) < 3 then
         begin
            for i := Length(result) to 2 do
              result := result + '0' ;
         end;
    end;
       if Length(result) > 3 then
          SetLength(result,3);
end;

function GetMainAccountCode(AccountNumber : String) : String;
begin
  Result:= AccountNumber ;
  if Result='' then exit;
  Result := ZipAccountCode(Result);
  if length(result) > MainAccountLength then
  setlength(Result,MainAccountLength);
  if length(result) > MainAccountLength then
    raise exception.create('');
end;
function   GetSubAccountLongCode(AccountNumber : String) : String;
begin
  	{Sylvain:This caused batch import to fail now fixed}
  Result:=copy( AccountNumber,2,length(AccountNumber)-1);
  if Result='' then exit;
  Result := GetSubAccountCode(result);
end;

function GetMainAccountLongCode(AccountNumber : String) : String;
begin
  Result:=copy( AccountNumber,2,length(result)-1);
  if Result='' then exit;
  Result := ZipAccountCode(Result);
  if length(result) > MainAccountLength then
  setlength(Result,MainAccountLength);
  if length(result) > MainAccountLength then
    raise exception.create('');
end;


Function ZipAccountCode(AccountCode:string):String;
begin
 result := AccountCode ;
  if  length(AccountCode) > MainAccountLength then
   begin
    if AccountCode[MainAccountLength+1] = '-' then
      delete(result,MainAccountLength+1,1);
    end else
    if  Length(AccountCode) > 0 then
    if AccountCode[Length(AccountCode)] = '-' then
       delete(result,Length(AccountCode),1);
   // make sure its the maximum
   if Length(result) > MainAccountLength + 3 then
      SetLength(result,MainAccountLength + 3);
  //Result:= StringReplace(AccountCode,'-','',[]);
end;

(*
Function Str2Float(S:String):Extended;
Begin
  Result := StrToFloatDef(S,0);
end;
*)

Function  Str2Int(S:String):Integer;
Begin
  Result := StrToIntDef(S,0);
end;

Function Str2Bool(Value:String):Boolean;
begin
  Result := SameText('True',Value) or (StrToIntDef(Value,0)<>0);
end;


procedure cbEnable(cbObject : TComboBox);
begin
  cbObject.Enabled := True;
  cbObject.Color := clWindow;
  cbObject.Font.Color := clWindowText;
end;

procedure cbDisable(cbObject : TComboBox);
begin
  cbObject.Color := clGray;
  cbObject.Font.Color := clWhite;
  cbObject.Enabled := False;
end;

procedure Highlight(EditBox : TEdit);
begin
  EditBox.Color := clHighlight;
  EditBox.Font.Color := clHighlightText;
end;

procedure BackNormal(EditBox : TEdit);
begin
  EditBox.Font.Color := clWindowText;
  EditBox.Color := clWindow;
end;

Function NextEmailFileNo:Integer;
Begin
  Result:=0;
  While FileExists(TDMTCCoreLink.GetLocalBaseDir+'tmp\Report'+IntToStr(Result)+'.Doc') do inc(Result);
  // We need to check PDF to so just to be sure.
  While FileExists(TDMTCCoreLink.GetLocalBaseDir+'tmp\Report'+IntToStr(Result)+'.pdf') do inc(Result);
end;

Function Char2AccountType(aChar:Char):integer;
begin
  Result := Pos(aChar,'DCBTE');
end;

Function AccType2Char(aType:Integer):Char;
begin
  case atype of
  1: Result := 'D';
  2: Result := 'C';
  3: Result := 'B';
  4: result := 'T';
  Else
    Result := 'G';
  end;
end;

Function GetArrowIdx(AscIndexOrder:Boolean):integer;
begin
  if AscIndexOrder then result:=11 else Result:=35;
end;

Function FormatFileName(aDir,aFile,ext:String):String;
begin
 Result := IncludeTrailingPathDelimiter(aDir)+aFile;
 Result := ChangeFileExt(Result,ext);
end;

Function Bool2Str(Value:Boolean):String;
begin
  Result:='False';
  if Value Then
    Result:='True';
end;



Function FctTrimInStr(vString:String):String;
begin
  Result:=vString;
  While (Pos(' ',Result)<>0) And (Length(Result)>0) do
   Delete(Result,Pos(' ',Result),1);
end;

Function  GetCommonDBPath:String;
begin
  Result := ExtractFilePath(ExtractFilePath(GetModuleName(HInstance))) ;
end;

Function Gett3tmpFolder:String;
begin
  Result := Trim(GetCommonDBPath);
  if result<>'' then
  begin
     Result :=includeTrailingpathDelimiter(Result)+'tmp\';
  end
    Else Result :='C:\tmp\';
  if Not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

Function GettmpFolder:String;
begin
  Result := 'c:\temp\';
  if Not DirectoryExists(Result) then
    Result :='C:\tmp\';
  if Not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

Function Str2Char(S:String):Char;
begin
  Result := #0;
  if S='' then exit;
  Result := s[1];
end;

Function LocateRec(PboxSelect:TrSelect;ID:Integer):Integer;
Var
  ic:Integer;
begin
  Result := -1;
  // done : Pieter For array use high not length
  For ic:=0 to  High(PboxSelect) do
  if PboxSelect[ic].ID =ID then
  begin
    ReSult := ic;
    Break;
  end;
end;

Function GetRec(PboxSelect:TrSelect;ID:Integer):Boolean;
begin
  Result := False;
  ID := LocateRec(PboxSelect,ID);
  if ID>=0 then
    Result := PboxSelect[iD].Value;
end;
Procedure SetRec(PboxSelect:TrSelect;ID:integer;Value:Boolean);
begin
  ID := LocateRec(PboxSelect,ID);
  if ID>=0  then
    PboxSelect[iD].Value := Value;
end;

Procedure CopyAccSelected(PboxSelect:TrSelect;Var Value:TrSelect);
  Function Add:Integer;
  begin
    // done : pieter for array use high not length
    SetLength(Value,high(Value)+2);
    result := high(Value);
  end;
  Var
    Ic:Integer;
begin
  SetLength(Value,0);
  For ic:=0 to high(PboxSelect) do
    if PboxSelect[ic].Value then
     Value[add]:=PboxSelect[ic];
end;

Function   AddtagExt(aTag,Value:string):string;
begin
  if Value='' then
    Result := Addtag(aTag,'');
  Result := HalfTag('',aTag);
  Result := Result + Value + HalfTag('','/'+aTag);
end;

Function Addtag(aTag,Value:string):string; Overload;
begin
     Value:=trim(value);
     if Value='' then
       Result := '<'+LowerCase(aTag)+'/>'+eline
     else
       Result := '<'+LowerCase(aTag)+'>'+ HTMLEncode(Value) +'</'+LowerCase(aTag)+'>'+eline;
end;

Function LTag(aTag:String):String;
begin
  Result := '<' + aTag +  '>';
end;

Function RTag(aTag:String):String;
begin
  Result := '</' + aTag +  '>'+eline;
end;


Function HalfTag(DestStr:String;aTag:String):String;
begin
  Result := DestStr + '<' + aTag +  '>' + eline;
end;

Procedure Addtag(Var DestStr:String;aTag,Value:string);Overload;
begin
  DestStr := DestStr + Addtag(aTag,Value);
end;

Function CheckT3XFile(aStream:TStream;Var BooksName:String):Boolean;
Var
  s:TStringStream;
  iCount:Integer;
  sc:String;
begin
  Result := False;
  BooksName :='@';
  if Not Assigned(aStream) then exit;
  astream.Position:=0;
  s:=TStringStream.Create('');
  try
    if aStream.Size>255 then
      s.CopyFrom(aStream,255)
    else
      s.CopyFrom(aStream,aStream.Size);
    sc := LowerCase(s.DataString);
//    s.DataString := LowerCase(s.DataString);
    iCount := Pos(LowerCase(TxfID),sc);
    Result:= iCount >=1;
    BooksName :='@@';
    if Result Then
    begin
     BooksName :='@@@';
      iCount:=Pos('<booksname>',sc);
      if iCount>0 then
      begin
        Delete(Sc,1,iCount+10);
        iCount := Pos('</',sc);
        BooksName := Copy (Sc,1,icount-1);
        Result:=True;
      end;
    end;
  finally
    s.Free;
  end;
  astream.Position:=0;
end;

Function FCode(Code:Integer=0):String;
begin
  Result := RightSTR('0000'+IntToStr(Code),4)+' ';
end;

Procedure  SplitStrNum(Var Source,NumPart:String);
Var
  ic:Integer;
begin
  Source := Trim(Source);
  NumPart := '';
  if Source='' then exit;
  Repeat
    ic:=Length(Source);
    if Source[ic] in ['0'..'9'] then
      NumPart := Source[ic] + NumPart
    else
      Break;
    Delete(Source,ic,1);
  Until Source='';
end;

Function Str2Float(S:String):Extended;
// done : Pieter lets strip all non numeric characters
 Var i : Integer ;
begin
 // done : Pieter Lets strip anny non numeric characters before conversion
 for i := length(S) downto 1 do
    if not (s[i] in ['1'..'9','0',DecimalSeparator,'-']) then
       delete(s,i,1);

 result :=0;
 if (Trim(S)='') then exit;
 try
   result:=StrToFloatDef(S,0);
 except
   result:=0;
 end;
end;

Function CopyInt(S:String;Index, Count: Integer): Integer;
begin
  Result := Str2Int(Copy(s,Index,Count));
end;

{Sylvain: Datatime will always be saved as this string so
 we get the correct format on read dates saved as strings.
 These 2 function should be used only on direct read and write
 to table to string fields as in sysparam table}
Function DateTime2DbStr(D:TDateTime):String;
begin
  Result := FormatDateTime('yyyy/mm/dd hh:nn:ss',D);
end;

Function Date2DbStr(D:TDateTime):String;
begin
  Result := FormatDateTime('yyyy/mm/dd',D);
end;

Function Datetime2Xmlstr(D:TDateTime):String;
begin
  Result := FormatDateTime('yyyymmdd hhnnss',D);
end;


Function StrDb2DateTime(S:String):TDateTime;
begin
  Result := Now;
  Try
    if (S='')OR (Length(S)<10) then exit;
    Result := EncodeDate(CopyInt(s,1,4),CopyInt(s,6,2),CopyInt(s,9,2));
    Result := Result + EncodeTime(CopyInt(s,12,2),CopyInt(s,15,2),CopyInt(s,18,2),00);
  Except end;
end;



Function Str2Date(S:String):TDate;
Var
  D,M,Y:Word;
  Function GetParts(Var st:String;Var Value:Word):Integer;
  begin
    Result := Length(st);
    if Length(st)=0 then exit;
    Result:=1;
    // this has a bounds error couse of the loop it does not check for outbounds
    While ((length(st) >= Result) and (st[Result] in ['0'..'9']) ) do Inc(Result);
    Value:=StrToInt(Copy(s,1,Result-1));
    System.Delete(st,1,Result);
  end;
begin
  result := 0 ;
  if trim(s) = '' then exit ;
  Try
    GetParts(s,D);
    GetParts(s,M);
    GetParts(s,Y);
    Result := EncodeDate(y,m,d);
  except
  end;
end;

Procedure WriteT3IniFile(SSection,SKey,SValue:String);

begin
 TDatabaseRegistyRoutines.WriteOsfIni(SSection,SKey,SValue);
end;


Function ReadT3IniFile(SSection,SKey,sDefault:String):String;
begin
 result := TDatabaseRegistyRoutines.ReadOsfIni(SSection,Skey,sDefault);
end;

Procedure ReadAppConfig;
Begin

  AppName := ReadT3IniFile('Appconfig','Appname','osFinancials')+' ' + TDatabaseRegistyRoutines.GetAppValue('FileVersion')+' '  ;

  AppWebName := ReadT3IniFile('Appconfig','AppWebName','www.osfinancials.org');
  AppCopyright := ReadT3IniFile('Appconfig','AppCopyright','GPL Licence');
  AppSupport := ReadT3IniFile('Appconfig','AppSupport','support.txt');
  AppSupportPage := ReadT3IniFile('Appconfig','AppSupportPage','http://www.osfinancials.org');
  CLassicColor   := ReadT3IniFile('Appconfig','CLassicColor','197,193,225');



end;




end.
