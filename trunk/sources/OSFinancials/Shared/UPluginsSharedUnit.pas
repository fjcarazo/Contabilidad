(*
  Id: UPluginsSharedUnit.pas by Pieter Valentijn
  Released under the GNU General Public License
*)

unit UPluginsSharedUnit;

interface
 uses sysutils,classes,forms,DBAccess , Uni,db,Controls,windows,tcashclasses;
type
  // Email plugin header
  TOSFEmailPlugin = function(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection;RepName,PreFix,htmlPath, FillSql,UpdateSql :PChar) : TModalresult ; stdcall ;
  TOSFMenuPlugin = function(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
  TOSFMultiUser = function(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection) : Boolean ; stdcall ;
  TOSFPosPlugin = procedure(AApplication: TApplication;OutputText : pchar) ; stdcall ;
  TOSFPinPlugin = procedure (AApplication: TApplication;aType : Integer ;InputText :PChar;Var OutputText : PChar {buffer init to 1536} ) ; stdcall ;
  TOSFLoginControlerPlugin = function (AApplication: TApplication;AConnection:TUniconnection) : Integer ; stdcall ;
  TOSFGetPluginInfo = procedure (Var TrnDescription,TrnGroup : Integer ; Var GUID1024 : PChar ) ; stdcall ;
  TLoadFormPlugin = function (AApplication: TApplication;InputText :PChar):TForm ; stdcall ;
  TMessageFormPlugin = procedure (AForm:TForm ; MessageText :PChar) ; stdcall ;
  TGetPriceMessageFormPlugin = procedure (AForm:TForm ; MessageText :PChar;Var Price1,Price2,Price3,Sellingprice,Discount :Double) ; stdcall ;
  TSearchPlugin = procedure (Var Return4096 : PChar) ; stdcall ;
  TMessageGetDisplayText = procedure (AForm:TForm ; MessageText :PChar; Var Return1024 : PChar) ; stdcall ;
  TPluginEnabled = procedure (Mode : PChar;Var ReturnRepOpName1024 : PChar  ; var ImageIndex : Integer ) ; stdcall ;
  TUnLoadFormPlugin = procedure (AForm:TForm ); stdcall ;

  // combinded record for var use.
  TFormPluginRecord = Record
  aLoadFormPlugin : TLoadFormPlugin ;
  aMessageFormPlugin : TMessageFormPlugin ;
  aGetPriceFormPlugin : TGetPriceMessageFormPlugin ;
  aUnLoadFormPlugin : TUnLoadFormPlugin ;
  aMessageGetDisplayText : TMessageGetDisplayText ;
  aDocSearch : TSearchPlugin ;
  aPluginEnabled : TPluginEnabled ;
  aContextmenuEnabled : TPluginEnabled ;
  aGuid : String[50] ;
  aOSFGetPluginInfo : TOSFGetPluginInfo ;
  aForm : Pointer ;
  aInst : Integer ;
  end;

   TWorkFlowImplementBase = class( TComponent)
  private
    FOutId: string;
    FOutSubid: string;
    FInparams: TParams;
    FDisplayname: String;
    FOutparams: Tparams;
    FParent: TWincontrol;
    FOnInternalProgress: TNotifyEvent;
    FDescription: String;

    procedure SetOutId(const Value: string);
    procedure SetOutSubid(const Value: string);
    procedure SetDisplayname(const Value: String);
    procedure SetParent(const Value: TWincontrol);
    procedure SetOnInternalProgress(const Value: TNotifyEvent);
    procedure SetDescription(const Value: String);

   public
    locWorkFlowDataset : Tdataset ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Getparams : String ;
    procedure StringToParams(Aparams : TParams ;paramsString:String;ReplaceEmpty :boolean);
    procedure HandelProperties(Alist : String ;AObject : TComponent);
   published
     function WorkFlowStart : TForm ; virtual ; abstract ;
     procedure WorkflowEnd (AForm : TForm )  ;virtual ; abstract;
     property Inparams : Tparams read FInparams ;
     property Outparams : Tparams read FOutparams ;
     property OutId : string  read FOutId write SetOutId;
     property OutSubid : string  read FOutSubid write SetOutSubid;
     property Displayname : String  read FDisplayname write SetDisplayname;
     property Description : String  read FDescription write SetDescription;
     property Parent : TWincontrol  read FParent write SetParent;
     property OnInternalProgress : TNotifyEvent  read FOnInternalProgress write SetOnInternalProgress;
   end;
 function WF_GetWorkflowImplentOnName(Aname : String ) : TWorkFlowImplementBase ;
 Procedure WF_GetWorkFlowList(AList : TStringlist) ;
const
  PluginsDLLName='of4' ;
  OSFOPENBOOKSPLUGINSRoutineName='OSFOpenBooksPlugin';
  TCPLUGINSRoutineName ='OSFMenuPlugin';
  TOSFEmailPluginName = 'OSFEmailPlugin'  ;
  OSFPOSDISPLAYRoutineName ='OSFPosPlugin';
  OSFCONTROLERLOGINRoutineName ='OSFLoginControlerPlugin';

  OSFPINRoutineName ='OSFPinPlugin';
  OSFPOSPOINTSPLUGIN = 'OSFPosPointsPlugin' ;
  OSFEditAddItemToDocRoutineName ='OSFAddEditItemToDocPlugin'; //TLoadFormPlugin Type but used for docs
  OSFMESSAGEFORMRoutineName ='OSFMESSAGEFORM' ;
  OSFUNLOADFORMRoutineName ='OSFUNLOADFORM' ;
  OSFDISPLAYTEXTRoutineName ='OSFDISPLAYTEXT' ;

  OSFEditAddItemToStockRoutineName ='OSFAddEditItemToStockPlugin'; //TLoadFormPlugin Type but used for docs
  OSFEditAddItemToMainDocRoutineName ='OSFAddEditItemToDocPlugin';
  OSFEditAddItemToMainProjectRoutineName ='OSFAddEditItemToProjectsPlugin';

  OSFEditAddItemToGroupsRoutineName ='OSFAddEditItemToGroupsPlugin';
  OSFEditAddItemToOptionsRoutineName ='OSFAddEditItemToOptionsPlugin';


  OSFGetPluginInfoName ='OSFGetPluginInfo';
  OSFEditAddItemToMainRoutineName ='OSFAddEditItemToGenOsf';


  OSFGetPriceForDocRoutineName ='OSFGetPriceForDocPlugin';


  OSFEditAddItemToDebCredRoutineName ='OSFAddEditItemToDebCredPlugin';

  OSFEditAddItemToAgendaRoutineName ='OSFAddEditItemToAgendaPlugin';
  OSFEditAddItemToBatchRoutineName ='OSFAddEditItemToBatchPlugin';


  OSFAddEditItemToDocProcess ='OSFAddEditItemToDocProcess';

  OSFDOCSEARCHRoutineName ='OSFDOCSEARCH' ;
  OSFDEBTORSEARCHRoutineName ='OSFDEBTORSEARCH' ;
  OSFCREDITORRSEARCHRoutineName ='OSFCREDITORRSEARCH' ;



  OSFPOSPROCESSMESSAGEFORMRoutineName ='OSFPOSPRCMESSAGEFORM' ;

  OSFSTOCKMESSAGEFORMRoutineName ='OSFSTOCKMESSAGEFORM' ;
  OSFSTOCKUNLOADFORMRoutineName ='OSFSTOCKUNLOADFORM' ;
  OSFSTOCKDISPLAYTEXTRoutineName ='OSFSTOCKDISPLAYTEXT' ;
  OSFPLUGINENABLEDRoutineName ='OSFPLUGINENABLED';
  OSFPLUGINCONTEXTRoutineName ='OSFPLUGINCONTEXT';

var
   LoadedPluginList : TStringList ;
   WF_WorkFlowList :  TStringList ;
   WF_listcount : Integer ;
function OSFPLUGINFindAlternateDll(AName: String): Boolean;
function OSFPLUGINFindAlternateReport(AName: String;Run : Boolean;IsFromUserReports:Boolean=false;currentlanguage : string='' ; CBDONotUseReportMan : boolean =false ): Boolean;
procedure OSFPLUGINRunPlugInsDLLProgram(AName,Params : String);
procedure unloadplugins ;
function ExecPluginInteractClass(InPar : String ) : String ;


implementation

uses UDMTCCoreLink, StrUtils, Variants, TypInfo;

function WF_GetWorkflowImplentOnName(Aname : String ) : TWorkFlowImplementBase ;
var
 i : Integer ;
begin
 result := nil ;
 for i := 0 to WF_WorkFlowList.Count -1 do
   begin
      if TWorkFlowImplementBase(WF_WorkFlowList.objects[i]).Displayname = Aname then
        begin
          Result := WF_WorkFlowList.objects[i] as TWorkFlowImplementBase;
          exit ;
        end;
   end;
end;


Procedure WF_GetWorkFlowList(AList : TStringlist) ;
var
 i : Integer ;
begin
 AList.Clear ;
 for i := 0 to WF_WorkFlowList.Count -1 do
   begin
      AList.AddObject(TWorkFlowImplementBase(WF_WorkFlowList.objects[i]).Displayname,WF_WorkFlowList.objects[i]);
   end;
end;

function ExecPluginInteractClass(InPar : String ) : String ;

var
 pmenu : Pointer ;
 Method : TMethod ;

begin
 result := '' ;
 if DMTCCoreLink.AApplication.FindComponent('fmMain') = nil then exit ;
 if DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass') = nil then exit ;
 TPluginIteractClass(DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass')).processstring := InPar ;
 pmenu := DMTCCoreLink.AApplication.FindComponent('fmMain').MethodAddress('CallPluginInteract');
  if (PMenu<>Nil) then
        begin
          Method.Code := PMenu;
          Method.Data := DMTCCoreLink.AApplication.FindComponent('fmMain');
          TNotifyEvent(Method)( DMTCCoreLink.AApplication.FindComponent('fmMain')) ;
        end;
  result := copy(TPluginIteractClass(DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass')).ResultString,1,
                 length(TPluginIteractClass(DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass')).ResultString)) ;

end;


procedure OSFPLUGINRunPlugInsDLLProgram(AName,Params : String);
var
 Ins: HINST;
 AOSFMenuPlugin : TOSFMenuPlugin ;
 MyAppName:String;
Begin
  MyAppName:= ExtractFileDir(Application.ExeName) + '\' + AName ;
  if not FileExists(MyAppName) then
    exit ;

 if LoadedPluginList.IndexOf(MyAppName) = -1 then
   begin
    Ins := LoadLibrary(PChar(MyAppName));
    LoadedPluginList.AddObject(MyAppName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(MyAppName)]);
   end;


  if Ins = 0 then
   raise Exception.Create('Error loading DLL from ' + MyAppName);
    try
      @AOSFMenuPlugin := GetProcAddress(Ins,TCPLUGINSRoutineName);
      if @AOSFMenuPlugin <> nil then
        AOSFMenuPlugin(Application.Handle,Application,DMTCCoreLink.TheZConnection,pchar(Params),'');
    except
    end;
end;


function OSFPLUGINFindAlternateDll(AName: String): Boolean;
type
  TShowInput = function(AApplication : HWnd;AApplicationPointer : Pointer) : TModalresult ; stdcall ;
  // inpocess could hold in params and outprocess can hold out params.
  // This way the main program can do actions after the plugin closes.
  TShowNewInput = function(Database , Username , password , server , port , InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
var
  AShowInput : TShowInput ;
  ANewShowInput : TShowNewInput ;
Function HasFunction(ALname : String ) : Boolean ;
 var
 Ins: HINST;
 DllName : String ;
begin



  try
 DllName :=ExtractFileDir(Application.ExeName) + '\plug_ins\Interface\'+ALname;
 if LoadedPluginList.IndexOf(DllName) = -1 then
   begin
    Ins := LoadLibrary(PChar(DllName));
    LoadedPluginList.AddObject(DllName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]);
   end;

  except
    raise Exception.Create('Error in ' + DllName  );
  end;
 if Ins = 0 then
   raise Exception.Create('Error loading DLL from ' + DllName);

  try
   AShowInput := nil ;
   @AShowInput := GetProcAddress(Ins, pchar(AName));
   result := @AShowInput <> nil ;
   if result then
      AShowInput(Application.Handle,Application);

   if not result then
      begin
     //  allow new class to connect. For now we fill database name but in the feture we mite want to support more types
       ANewShowInput := nil ;
       DllName :=    AName + 'New' ;
       @ANewShowInput := GetProcAddress(Ins, pchar(DllName));
       result := @AShowInput <> nil ;
       if result then
          begin
          DllName := DMTCCoreLink.TheZConnection.Database ;
          // Handle Connection details to DLL.
          ANewShowInput(pchar(DllName),'','','','','','');
          end;
     end;
  except

   result := false ;
  end;
end;

Var
  PlugIns_Path :String;
  F            :TSearchRec;
  Bool  : Integer ;
begin
  Result := false ;
  PlugIns_Path:= ExtractFileDir(Application.ExeName) +'\'  ;
  Bool := FindFirst(PlugIns_Path+'Interface\*.dll',faAnyFile,F);
  try
  While Bool = 0 do
  begin
    if  HasFunction(F.Name) then
    begin
       result := true ;
       break ;
    end ;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
  finally
   sysutils.FindClose(f);
  end ;
   try
    if DMTCCoreLink.ReadNwReportOp('cbLogLevel',0)  > 5 then
    begin
       DMTCCoreLink.LogAction('GENMES',0,AName);
    end;
   except
      // Escape  for no rights user
   end;
end;


function OSFPLUGINFindAlternateReport(AName: String;Run : Boolean;IsFromUserReports:Boolean=false;currentlanguage : string = '' ; CBDONotUseReportMan : boolean =false): Boolean;
type
  THasReport = function(Areportname,Language : PChar) : Integer ; stdcall ;
  TRunReport = function(ADatabase : TUniconnection;Areportname,Language : PChar;AApplication : HWnd;AApplicationPointer : TComponent) : TModalresult ; stdcall ;
  // inpocess could hold in params and outprocess can hold out params.
  // This way the main program can do actions after the plugin closes.
var
  AHaseReport : THasReport ;
  ARunReport : TRunReport ;
Function HasFunction(ALname : String ) : Boolean ;
 var
 Ins: HINST;
 DllName : String ;
begin
 DllName :=ExtractFileDir(Application.ExeName) + '\plug_ins\reports\'+ALname;
 if LoadedPluginList.IndexOf(DllName) = -1 then
   begin
    Ins := LoadLibrary(PChar(DllName));
    LoadedPluginList.AddObject(DllName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]);
   end;
 if Ins = 0 then
   raise Exception.Create('Error loading DLL from ' + DllName);


  try

   AHaseReport := nil ;
   @AHaseReport := GetProcAddress(Ins,'HASREPORT');
   result := @AHaseReport <> nil ;
   if result then
      begin

         result := AHaseReport(pchar(AName),pchar(currentlanguage)) <> 0;
         if not result then exit ;
         ARunReport := nil ;
         @ARunReport := GetProcAddress(Ins,'RUNREPORT');
         DllName := DMTCCoreLink.TheZConnection.Database ;
         result := @ARunReport <> nil ;
             if result then
              if run then

               ARunReport(DMTCCoreLink.TheZConnection, pchar(AName),pchar(currentlanguage),Application.Handle,Application) ;
      end;
  except
   result := false ;
  end;

end;

Var
  F            :TSearchRec;
  Bool  : Integer ;
begin

  Result := false ;

  if (CBDONotUseReportMan) and (not IsFromUserReports) then exit ;

  Bool := FindFirst(ExtractFileDir(Application.ExeName) + '\plug_ins\reports\*.dll',faAnyFile,F);
  try
  While Bool = 0 do
  begin
    if  HasFunction(F.Name) then
    begin
       result := true ;
       break ;
    end ;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
  finally
  sysutils.FindClose(f);
  end ;
end;

procedure unloadplugins ;
var
 i : integer ;
 Lib : Cardinal ;
 Aname : String ;
begin
  if LoadedPluginList <> nil then
  begin
  for i := LoadedPluginList.count -1 downto 0 do
    begin
      try
      Lib := Integer(LoadedPluginList.Objects[i]);
      Aname := GetModuleName(Lib);
      if Aname <> '' then
      FreeLibrary(Lib) else
      raise Exception.Create('No module');
      except

      end;
    end;
  LoadedPluginList.Clear ;
  end;
end;

{ TWorkFlowImplementBase }

constructor TWorkFlowImplementBase.Create(AOwner: TComponent);
begin
  inherited;
  FInparams := TParams.Create;
  FOutparams := TParams.Create;
   if not ModuleIsLib then
  WF_WorkFlowList.AddObject('',Self);
  with Inparams.Add as TParam do
     begin
        Name := 'LIMITCONTROL' ;
        DataType := ftMemo ;
         Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'MSGPOPUP' ;
        DataType := ftBoolean ;
         Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'HIDELASTBTN' ;
        DataType := ftBoolean ;
         Value := False ;
     end;
end;

destructor TWorkFlowImplementBase.Destroy;
begin
   if not ModuleIsLib then
  if WF_WorkFlowList.IndexOfObject(self) <> -1 then
     WF_WorkFlowList.Delete(WF_WorkFlowList.IndexOfObject(self));
  FInparams.Free ;
  FOutparams.Free ;
  inherited;
end;

function TWorkFlowImplementBase.Getparams: String;
var
 i : Integer ;
begin
 Result := '' ;
 for i := 0 to Outparams.Count -1 do
   begin
     if Result <> '' then
       Result := Result + #13+#10 ;
      Result := Result + Outparams[i].Name +'=' + VarToStr(Outparams[i].Value) ;
   end;
end;

procedure TWorkFlowImplementBase.HandelProperties(Alist: String;
  AObject: TComponent);
  procedure Recurse(aNestObject:TComponent; Aname,Avalue : String );
  var
    LocalName,NextName : String ;
  begin
    if pos('.',aname) > 0 then
      begin
        LocalName := copy(aName,1,pos('.',aname)-1) ;
        delete(aName,1,pos('.',aname));
        NextName := copy(aName,1,pos('.',aname)-1) ;
        if NextName ='' then NextName := Aname ;
        if aNestObject.FindComponent(LocalName) <> nil then
           Recurse(aNestObject.FindComponent(LocalName),NextName,Avalue) else
         SetPersistentProp(NextName,aNestObject,Avalue);
      end else
      begin
         SetPersistentProp(Aname,aNestObject,Avalue);
      end;

  end;
  var I :Integer ;
  AStringlist : TStringList ;
begin
  AStringlist := TStringList.create ;
  try
  AStringlist.Text := Alist ;
  for i:= 0 to AStringlist.Count -1 do
     begin
     Try
       Recurse(AObject,AStringlist.Names[i],AStringlist.ValueFromIndex[i]) ;
      except
         on e:Exception do
           AStringlist.ValueFromIndex[i] := e.message;
      end;
     end;

  finally
     AStringlist.free ;
  end;
end;

procedure TWorkFlowImplementBase.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TWorkFlowImplementBase.SetDisplayname(const Value: String);
begin
  FDisplayname := Value;
end;

procedure TWorkFlowImplementBase.SetOnInternalProgress(
  const Value: TNotifyEvent);
begin
  FOnInternalProgress := Value;
end;

procedure TWorkFlowImplementBase.SetOutId(const Value: string);
begin
  FOutId := Value;
end;

procedure TWorkFlowImplementBase.SetOutSubid(const Value: string);
begin
  FOutSubid := Value;
end;


procedure TWorkFlowImplementBase.SetParent(const Value: TWincontrol);
begin
  FParent := Value;
end;

procedure TWorkFlowImplementBase.StringToParams(Aparams : TParams ;paramsString: String;ReplaceEmpty :boolean);
var
 alist : TStringList ;
 i : Integer ;
begin
 alist := TStringList.Create ;
 try
  alist.Text := paramsString ;
  for i:=0 to Aparams.Count -1 do
   if ReplaceEmpty or (alist.Values[Aparams[i].Name] <> '') then
      Aparams[i].AsString := alist.Values[Aparams[i].Name] ;
 finally
    alist.free ;
 end;
end;

 

initialization
  LoadedPluginList := TStringList.create ;
  if not ModuleIsLib then
    WF_WorkFlowList := TStringList.create ;
finalization

// unloadplugins ;
 if assigned(LoadedPluginList) then
 FreeAndNil(LoadedPluginList) ;

  if assigned(WF_WorkFlowList) then
  begin
 for WF_listcount := WF_WorkFlowList.Count -1 downto 0 do
    begin
      WF_WorkFlowList.Objects[WF_listcount].Free ;
    end;

 FreeAndNil(WF_WorkFlowList) ;
 end;

end.
