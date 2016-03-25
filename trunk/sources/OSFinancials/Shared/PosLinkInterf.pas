unit PosLinkInterf;

interface

Uses Sysutils,windows;

Type

   TPOSControler = Class
   Private
     Procedure InstallEvent(EventName:String;Event:Pointer);
   Public
     ControlerPath    : String;
     LibHandle        : Integer;
     LibName          : String;
     MainFormMax      : Boolean;
     VcTopLeft:TPoint;
     VcBotRight:TPoint;
     Constructor Create;
     Destructor Destroy;Override;
     Function   LoadLib:Boolean;
     Procedure  UnloadPosLib;
     Function   LibLoaded:Boolean;
     Function   Login(ClerkID,Password: String; POSSwapHnd: Integer):Integer;
     Function   Logout:Integer;
     Function   DoConfRetSale(Dispenser: Integer; TransactionType: Integer;Conf:Boolean=True): Integer;
     Function   ConfirmSale(Dispenser: Integer; TransactionType: Integer): Integer;
     Function   UnConfirmSale(Dispenser: Integer; TransactionType: Integer): Integer;
     procedure  Dimensions;
   end;

   TPOSTransAvailable = Procedure  (Date: Integer; Time: Integer;
                        TransNum: Integer;
                        TransType: Integer;
                        Dispenser: Integer; Hose: Integer;
                        Grade: Integer; UnitPrice: Double;
                        Volume: Double; Amount: Double);

Var
  PostecControler:TPOSControler;
  DoPOSTransAvailable:TPOSTransAvailable=nil;

implementation

uses UDMTCCoreLink;

Constructor TPOSControler.Create;
begin
  Inherited;
  // todo : Refs to c ???? arrggg  why ? instancename
  ControlerPath    :=  '' ; // 'C:\tcash3\Plugins\' ;
  LibHandle        := 0;
  LibName          := 'postec2tc.dll';
  MainFormMax      := False;
end;

Function TPOSControler.LibLoaded:Boolean;
begin
  LibLoaded  := LibHandle <> 0 ;
end;


Destructor TPOSControler.Destroy;
begin
  UnloadPosLib;
  Inherited;
end;

Procedure POSTransAvailableLink(Date: Integer; Time: Integer;
                       TransNum: Integer;
                       TransType: Integer;
                       Dispenser: Integer; Hose: Integer;
                       Grade: Integer; UnitPrice: Double;
                       Volume: Double; Amount: Double);StdCall;
begin

  if Assigned(DoPOSTransAvailable) then
   DoPOSTransAvailable(Date,Time,TransNum,TransType,
                       Dispenser,Hose,Grade,UnitPrice,
                       Volume,Amount);
end;


Function TPOSControler.LoadLib:Boolean;
begin
  Result := LibLoaded;
  if Result or (Trim(LibName)='')Then exit;
  if sysUtils.FileExists(ControlerPath+LibName) then
    LibHandle  := LoadLibrary(PChar(ControlerPath+LibName));
  Result := LibLoaded;
  if Result then
  begin
    {Install events}
     InstallEvent('Vc_EventTransAvailable',@POSTransAvailableLink);

  end;
end;

Procedure TPOSControler.InstallEvent(EventName:String;Event:Pointer);
Type
  TVC_Proc = Function (ProAdd:POinter): Integer;stdcall;
Var
  Vc_Proc : TVC_Proc;
begin
  if Not LibLoaded then exit;
  @Vc_Proc := GetProcAddress(LibHandle,PChar(EventName));
  if @Vc_Proc <> nil then
      Vc_Proc(Event);
end;


Procedure TPOSControler.UnloadPosLib;
begin
  if LibLoaded or (LibHandle<>0) then
    FreeLibrary(LibHandle);
  LibHandle := 0;
end;

Function  TPOSControler.Login(ClerkID,Password: String;POSSwapHnd: Integer):Integer;
Type
  TVC_Proc = Function (ClerkID: Integer; Password: Integer; POSSwapHnd: Integer): Integer;stdcall;
Var
  Vc_Proc : TVC_Proc;
begin
  Result := 100;
  if Not LibLoaded then exit;
  @Vc_Proc := GetProcAddress(LibHandle, 'Vc_Login');
  if @Vc_Proc <> nil then
      Result := Vc_Proc(StrToIntDef(ClerkID,0),StrToIntDef(Password,0),POSSwapHnd);
  if Not LibLoaded then exit;
  Dimensions;
end;

Function  TPOSControler.DoConfRetSale(Dispenser: Integer; TransactionType: Integer;Conf:Boolean=True): Integer;
Type
  TVC_Proc = Function (Dispenser: Integer; TransactionType: Integer): Integer;stdcall;
Var
  Vc_Proc : TVC_Proc;
  s:String;
begin
  Result := 100;
  if Not LibLoaded then exit;
  s:= 'Vc_ConfirmSale';
  if not Conf then   s:= 'Vc_UnConfirmSale';
  @Vc_Proc := GetProcAddress(LibHandle,PChar(s));
  if @Vc_Proc <> nil then
      Result := Vc_Proc(Dispenser,TransactionType);
end;

Function TPOSControler.UnConfirmSale(Dispenser: Integer; TransactionType: Integer): Integer;
begin
  Result := DoConfRetSale(Dispenser,TransactionType,False);
end;

Function TPOSControler.ConfirmSale(Dispenser: Integer; TransactionType: Integer): Integer;
begin
  Result :=  DoConfRetSale(Dispenser,TransactionType,True);
end;


Function  TPOSControler.Logout;
Type
  TVC_Proc = Function  : Integer;stdcall;
Var
  Vc_Proc : TVC_Proc;
begin
  Result := 100;
  if Not LibLoaded then exit;
  @Vc_Proc := GetProcAddress(LibHandle, 'Vc_logout');
  if @Vc_Proc <> nil then
      Result := Vc_Proc;

end;

procedure TPOSControler.Dimensions;
Type
  TVC_Proc = Procedure (Var ConsoleLeft: Integer;Var ConsoleTop: Integer; Var ConsoleRight: Integer; Var ConsoleBottom: Integer);StdCall;
Var
  Vc_Proc : TVC_Proc;
begin
  if Not LibLoaded then exit;
  @Vc_Proc := GetProcAddress(LibHandle, 'Vc_Dimensions');
  if @Vc_Proc <> nil then
      Vc_Proc(VcTopLeft.x,VcTopLeft.y,VcBotRight.x,VcBotRight.y);
  if VcTopLeft.y<0 then VcTopLeft.y:=0;
  if VcTopLeft.x<0 then VcTopLeft.x:=0;

end;



Initialization
  PostecControler := TPOSControler.Create;

FInalization
  PostecControler.Free;

end.
