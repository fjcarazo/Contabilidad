unit UWorkFlowDatamodule;

interface

uses
  SysUtils, Classes, DB,
    USQLHolder, UDMTCCoreLink, DAScript, UniScript, DBAccess, Uni, MemDS;

type
 TwfDirection = (wfdNorth,wfdNorthEast,wfdEast,wfdEastSouth,wfdSouth,wfdSouthWest,wfdWest,wfdWestNorth);
  TWorkflowStepsItem = class(TCollectionItem)
  private
    FWWORKFLOWSTEPID: Integer;
    FWDURATIONTYPE: Integer;
    FWUSERID: Integer;
    FWYPOS: Integer;
    FWSTATUSID: Integer;
    FWSTEPTYPEID: Integer;
    FWXPOS: Integer;
    FWDURATIONINTERVAL: Integer;
    FSSTEPNAME: String;
    FSPARAMS: String;
    FWHEIGHT: Integer;
    FWWIDTH: Integer;
    FSREMARK: String;
    FDelete: Boolean;
    FSTATUSTEXT: String;
    FSSQLSTEP: String;
    FSSQLBACK: String;
    procedure SetWDURATIONTYPE(const Value: Integer);
    procedure SetWWORKFLOWSTEPID(const Value: Integer);
    procedure SetSPARAMS(const Value: String);
    procedure SetSSTEPNAME(const Value: String);
    procedure SetWDURATIONINTERVAL(const Value: Integer);
    procedure SetWSTATUSID(const Value: Integer);
    procedure SetWSTEPTYPEID(const Value: Integer);
    procedure SetWUSERID(const Value: Integer);
    procedure SetWXPOS(const Value: Integer);
    procedure SetWYPOS(const Value: Integer);
    procedure SetWHEIGHT(const Value: Integer);
    procedure SetWWIDTH(const Value: Integer);
    procedure SetSREMARK(const Value: String);
    procedure SetDelete(const Value: Boolean);
    procedure SetSSQLBACK(const Value: String);
    procedure SetSSQLSTEP(const Value: String);
    procedure SetSTATUSTEXT(const Value: String);
    published
      property WWORKFLOWSTEPID : Integer  read FWWORKFLOWSTEPID write SetWWORKFLOWSTEPID;
      property WDURATIONTYPE : Integer  read FWDURATIONTYPE write SetWDURATIONTYPE;
      property SSTEPNAME    : String  read FSSTEPNAME write SetSSTEPNAME;
      property WSTEPTYPEID : Integer read FWSTEPTYPEID write SetWSTEPTYPEID;
      property SPARAMS     : String  read FSPARAMS write SetSPARAMS;
      property WSTATUSID    : Integer read FWSTATUSID write SetWSTATUSID;
      property WDURATIONINTERVAL : Integer  read FWDURATIONINTERVAL write SetWDURATIONINTERVAL;
      property WUSERID    : Integer   read FWUSERID write SetWUSERID;
      property WXPOS   : Integer   read FWXPOS write SetWXPOS;
      property WYPOS    : Integer  read FWYPOS write SetWYPOS;
      property WWIDTH   : Integer   read FWWIDTH write SetWWIDTH;
      property WHEIGHT   : Integer  read FWHEIGHT write SetWHEIGHT;
      property SREMARK : String  read FSREMARK write SetSREMARK;
      property SSQLSTEP : String  read FSSQLSTEP write SetSSQLSTEP;
      property SSQLBACK : String  read FSSQLBACK write SetSSQLBACK;
      property STATUSTEXT : String  read FSTATUSTEXT write SetSTATUSTEXT;
      property Delete : Boolean  read FDelete write SetDelete;
  end;
  TWorkFlowStepCollection = class(TOwnedCollection)
  private
    function Getsteps(index: integer): TWorkflowStepsItem;
    procedure Setsteps(index: integer; const Value: TWorkflowStepsItem);
     public
       property steps [index : integer] : TWorkflowStepsItem  read Getsteps write Setsteps;
       Function GetStepOnId(Aid : Integer ) : TWorkflowStepsItem ;
       function GetStepName (Aid : Integer) : String ;

  end;
  TWorkFlowTransitionItem = class(TCollectionItem)
  private
    FWFROMWORKFLOWSTEPID: Integer;
    FWTOWORKFLOWSTEPID: Integer;
    FWWORKFLOWTRANSID: Integer;
    FSCONDITION: String;
    FSTRANSNAME: String;
    FDelete: Boolean;
    FWLEFTMARK: Integer;
    FWTOPMARK: Integer;
    FWLEFTENDMARK: Integer;
    FWTOPENDMARK: Integer;
    procedure SetSCONDITION(const Value: String);
    procedure SetSTRANSNAME(const Value: String);
    procedure SetWFROMWORKFLOWSTEPID(const Value: Integer);
    procedure SetWTOWORKFLOWSTEPID(const Value: Integer);
    procedure SetWWORKFLOWTRANSID(const Value: Integer);
    procedure SetDelete(const Value: Boolean);
    function GetSTRANSNAME: String;
    procedure SetWLEFTMARK(const Value: Integer);
    procedure SetWTOPMARK(const Value: Integer);
    procedure SetWLEFTENDMARK(const Value: Integer);
    procedure SetWTOPENDMARK(const Value: Integer);

     published
     property   WWORKFLOWTRANSID : Integer  read FWWORKFLOWTRANSID write SetWWORKFLOWTRANSID;
     property   STRANSNAME    : String  read GetSTRANSNAME write SetSTRANSNAME;
     property   SCONDITION    : String  read FSCONDITION write SetSCONDITION;
     property   WFROMWORKFLOWSTEPID   : Integer  read FWFROMWORKFLOWSTEPID write SetWFROMWORKFLOWSTEPID;
     property   WTOWORKFLOWSTEPID   : Integer  read FWTOWORKFLOWSTEPID write SetWTOWORKFLOWSTEPID;
     property   WLEFTMARK   : Integer  read FWLEFTMARK write SetWLEFTMARK;
     property   WTOPMARK   : Integer  read FWTOPMARK write SetWTOPMARK;
     property   WLEFTENDMARK   : Integer   read FWLEFTENDMARK write SetWLEFTENDMARK;
     property   WTOPENDMARK   : Integer   read FWTOPENDMARK write SetWTOPENDMARK;

     property   Delete : Boolean  read FDelete write SetDelete;
  end;

  TWorkFlowTransitionCollection = class(TOwnedCollection)
  private
    function Gettransitions(index: integer): TWorkFlowTransitionItem;
    procedure Settransitions(index: integer;  const Value: TWorkFlowTransitionItem);
     public
       property transitions [index : integer] : TWorkFlowTransitionItem    read Gettransitions write Settransitions;

  end;

  TWorkFlowComponent = class (TComponent)
  private
    FSteps: TWorkFlowStepCollection;
    Ftransitions: TWorkFlowTransitionCollection;
    FGuid: String;
    FDisplayname: String;
    FStartstep: Integer;
    FGroupname: String;
    procedure SetSteps(const Value: TWorkFlowStepCollection);
    procedure Settransitions(const Value: TWorkFlowTransitionCollection);
    procedure SetDisplayname(const Value: String);
    procedure SetGuid(const Value: String);
    procedure SetStartstep(const Value: Integer);
    procedure SetGroupname(const Value: String);
    public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
    published
     property Displayname : String  read FDisplayname write SetDisplayname;
     property Guid : String  read FGuid write SetGuid;
     property Groupname : String  read FGroupname write SetGroupname;
     property Startstep : Integer  read FStartstep write SetStartstep;
     property Steps  : TWorkFlowStepCollection  read FSteps write SetSteps;
     property transitions : TWorkFlowTransitionCollection  read Ftransitions write Settransitions;

  end;
  TdmWorkflowData = class(TDataModule)
    ZQWorkflow: TuniQuery;
    ZQWorkflowWWORKFLOWTYPEID: TIntegerField;
    ZQWorkflowSWORFLOWNAME: TStringField;
    ZQWorkflowBDISABLE: TIntegerField;
    ZQWorkflowSTARTSTEP: TIntegerField;
    ZUSQLWorkflow: TUniUpdateSql;
    ZQSteps: TuniQuery;
    ZQStepsWWORKFLOWSTEPID: TIntegerField;
    ZQStepsSSTEPNAME: TStringField;
    ZQStepsWSTEPTYPEID: TIntegerField;
    ZQStepsSPARAMS: TBlobField;
    ZQStepsWSTATUSID: TSmallintField;
    ZQStepsWDURATIONTYPE: TIntegerField;
    ZQStepsWDURATIONINTERVAL: TIntegerField;
    ZQStepsWUSERID: TIntegerField;
    ZQStepsWXPOS: TIntegerField;
    ZQStepsWYPOS: TIntegerField;
    ZQStepsWWIDTH: TIntegerField;
    ZQStepsWHEIGHT: TIntegerField;
    ZQStepsSREMARK: TBlobField;
    ZUSQLSteps: TUniUpdateSql;
    ZQTransisions: TuniQuery;
    ZQTransisionsWWORKFLOWTRANSID: TIntegerField;
    ZQTransisionsSTRANSNAME: TStringField;
    ZQTransisionsSCONDITION: TBlobField;
    ZQTransisionsWFROMWORKFLOWSTEPID: TIntegerField;
    ZQTransisionsWTOWORKFLOWSTEPID: TIntegerField;
    ZUsqltransitions: TUniUpdateSql;
    ZQTasks: TuniQuery;
    ZQTasksWWORKFLOWWORKID: TIntegerField;
    ZQTasksWUSERID: TIntegerField;
    ZQTasksWSTATUS: TIntegerField;
    ZQTasksWWORKFLOWSTEPID: TIntegerField;
    ZQTasksWLINKID: TIntegerField;
    ZQTasksDDATEACTION: TDateTimeField;
    ZUSQLTask: TUniUpdateSql;
    ZQGetStep: TuniQuery;
    ZQGetStepWWORKFLOWSTEPID: TIntegerField;
    ZQGetStepSSTEPNAME: TStringField;
    ZQGetStepWSTEPTYPEID: TIntegerField;
    ZQGetStepSPARAMS: TBlobField;
    ZQGetStepWSTATUSID: TSmallintField;
    ZQGetStepWDURATIONTYPE: TIntegerField;
    ZQGetStepWDURATIONINTERVAL: TIntegerField;
    ZQGetStepWUSERID: TIntegerField;
    ZQGetStepWXPOS: TIntegerField;
    ZQGetStepWYPOS: TIntegerField;
    ZQGetStepWWIDTH: TIntegerField;
    ZQGetStepWHEIGHT: TIntegerField;
    ZQHist: TuniQuery;
    ZQHistWWORKFLOWWORKHISID: TIntegerField;
    ZQHistWWORKFLOWWORKID: TIntegerField;
    ZQHistWUSERID: TIntegerField;
    ZQHistWSTATUS: TIntegerField;
    ZQHistWWORKFLOWSTEPID: TIntegerField;
    ZQHistWLINKID: TIntegerField;
    ZQHistDDATEACTION: TDateTimeField;
    ZUSQLHist: TUniUpdateSql;
    ZQGetTransitions: TuniQuery;
    ZQGetTransitionsWWORKFLOWTRANSID: TIntegerField;
    ZQGetTransitionsSTRANSNAME: TStringField;
    ZQGetTransitionsSCONDITION: TBlobField;
    ZQGetTransitionsWFROMWORKFLOWSTEPID: TIntegerField;
    ZQGetTransitionsWTOWORKFLOWSTEPID: TIntegerField;
    ZQTaskList: TuniQuery;
    ZQTaskListWWORKFLOWWORKID: TIntegerField;
    ZQTaskListWUSERID: TIntegerField;
    ZQTaskListWSTATUS: TIntegerField;
    ZQTaskListWWORKFLOWSTEPID: TIntegerField;
    ZQTaskListWLINKID: TIntegerField;
    ZQTaskListDDATEACTION: TDateTimeField;
    ZQGetStepSREMARK: TBlobField;
    ZQTaskListSSTEPNAME: TStringField;
    ZQTaskListSWORFLOWNAME: TStringField;
    ZQStepsSSQLSTEP: TBlobField;
    ZQStepsSSQLBACK: TBlobField;
    ZQStepsSTATUSTEXT: TBlobField;
    ZQTasksPARAMS: TBlobField;
    ZQTaskListPARAMS: TBlobField;
    ZQGetStepSSQLSTEP: TBlobField;
    ZQGetStepSSQLBACK: TBlobField;
    ZQGetStepSTATUSTEXT: TBlobField;
    ZQTaskListSTATUSTEXT: TBlobField;
    ZQTaskListDISPLAYTEXT: TStringField;
    ZQTaskListUSER: TStringField;
    ZQTaskHist: TuniQuery;
    ZQTaskHistWWORKFLOWWORKID: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    ZQTaskHistWWORKFLOWSTEPID: TIntegerField;
    IntegerField5: TIntegerField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    BlobField1: TBlobField;
    BlobField2: TBlobField;
    StringField3: TStringField;
    StringField4: TStringField;
    ZQTaskHistWWORKFLOWWORKHISID: TIntegerField;
    ZQWorkflowGUID: TStringField;
    ZQTaskListWDURATIONTYPE: TIntegerField;
    ZQTaskListWDURATIONINTERVAL: TIntegerField;
    ZQWorkflowWGROUPID: TIntegerField;
    ZqUsers: TuniQuery;
    ZQRights: TuniQuery;
    ZUsqlRights: TUniUpdateSql;
    ZqUsersWUSERID: TIntegerField;
    ZqUsersSPASSWORD: TStringField;
    ZqUsersSUSERNAME: TStringField;
    ZqUsersSCREDITNOTENEXTNUMBER: TStringField;
    ZqUsersSINVOICENEXTNUMBER: TStringField;
    ZqUsersSPURCHASENEXTNUMBER: TStringField;
    ZqUsersSGOODSRETURNEDNEXTNUMBER: TStringField;
    ZqUsersSRECEIPTNEXTNUMBER: TStringField;
    ZqUsersSQUOTENEXTNUMBER: TStringField;
    ZqUsersSORDERNEXTNUMBER: TStringField;
    ZqUsersSNEXTBATCHNUMBER: TStringField;
    ZqUsersBDISABLED: TSmallintField;
    ZqUsersBACCOUNTS: TSmallintField;
    ZqUsersBSTOCK: TSmallintField;
    ZqUsersBBATCHENTRY: TSmallintField;
    ZqUsersBCREDITNOTE: TSmallintField;
    ZqUsersBINVOICES: TSmallintField;
    ZqUsersBPURCHASES: TSmallintField;
    ZqUsersBSTOCKRETURNS: TSmallintField;
    ZqUsersBRECONCILIATION: TSmallintField;
    ZqUsersBCREDITORREPORTS: TSmallintField;
    ZqUsersBDEBTORREPORTS: TSmallintField;
    ZqUsersBLEDGERREPORTS: TSmallintField;
    ZqUsersBSTOCKREPORTS: TSmallintField;
    ZqUsersBUSERREPORTS: TSmallintField;
    ZqUsersBPOSTING: TSmallintField;
    ZqUsersBGLOBALPROCESSES: TSmallintField;
    ZqUsersBSYSTEMSETUP: TSmallintField;
    ZqUsersUSEREMAIL: TStringField;
    ZqUsersBONLINE: TSmallintField;
    ZqUsersSPCIPADDRESS: TStringField;
    ZqUsersDSYSDATE: TDateTimeField;
    ZqUsersBEDITPRICES: TSmallintField;
    ZqUsersBGLOBALSEQ: TSmallintField;
    ZqUsersBCASHBOOK: TSmallintField;
    ZqUsersBONLYPOS: TSmallintField;
    ZqUsersBPOSSUPER: TSmallintField;
    ZqUsersBSEARCH: TSmallintField;
    ZqUsersBEMAIL: TSmallintField;
    ZqUsersBNOTUSED1: TSmallintField;
    ZQTaskListWGROUPID: TIntegerField;
    ZQTaskListFPERCENTCOMP: TFloatField;
    ZQRightsWWORKFLOWTYPEID: TIntegerField;
    ZQRightsWUSERID: TIntegerField;
    ZQRightsUSERLOOKUP: TStringField;
    sqlTasklist: TSQLHOLDER;
    ZQTaskHistFPERCENTAGECOMP: TFloatField;
    ZQTaskHistWGROUPID: TIntegerField;
    ZQTaskHistWDURATIONTYPE: TIntegerField;
    ZQTaskHistWDURATIONINTERVAL: TIntegerField;
    ZQTransisionsWLEFTMARK: TIntegerField;
    ZQTransisionsWTOPMARK: TIntegerField;
    ZQGetTransitionsWLEFTMARK: TIntegerField;
    ZQGetTransitionsWTOPMARK: TIntegerField;
    ZQTransisionsWLEFTENDMARK: TIntegerField;
    ZQTransisionsWTOPENDMARK: TIntegerField;
    ZSQLProcessor1: TUniScript;
    ZSQLProcessor2: TUniScript;
    ZSQLProcessor3: TUniScript;
    UniScript1: TUniScript;
    procedure InitForDatabase ;
    procedure ZQTasksAfterInsert(DataSet: TDataSet);
    procedure ZQHistAfterInsert(DataSet: TDataSet);
    procedure ZQWorkflowAfterInsert(DataSet: TDataSet);
    procedure ZQTaskListCalcFields(DataSet: TDataSet);
    procedure ZQWorkflowBeforePost(DataSet: TDataSet);
    procedure ZQWorkflowWGROUPIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQWorkflowWGROUPIDSetText(Sender: TField;
      const Text: String);
    procedure ZQRightsAfterInsert(DataSet: TDataSet);
    procedure ZQWorkflowBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure SaveComponentToDatabase(aWorkFlowComponent: TWorkFlowComponent);
    procedure LoadComponentFromDatabase(AWorkFlowComponent:TWorkFlowComponent);
    procedure SaveComponent (Afilename : String;aWorkFlowComponent: TWorkFlowComponent) ;
    procedure LoadComponent (Afilename : String;var aWorkFlowComponent: TWorkFlowComponent) ;
    { Public declarations }
  end;
  function dmWorkflowData :TdmWorkflowData;
var
  ldmWorkflowData: TdmWorkflowData;

implementation

uses variants, OSFGeneralRoutines,forms;

{$R *.dfm}

function dmWorkflowData :TdmWorkflowData;
begin
 if not assigned(ldmWorkflowData) then
       ldmWorkflowData:= TdmWorkflowData.Create(application);
  result :=   ldmWorkflowData ;

end;

{ TWorkflowStepsItem }

procedure TWorkflowStepsItem.SetDelete(const Value: Boolean);
begin
  FDelete := Value;
end;

procedure TWorkflowStepsItem.SetSPARAMS(const Value: String);
begin
  FSPARAMS := Value;
end;

procedure TWorkflowStepsItem.SetSREMARK(const Value: String);
begin
  FSREMARK := Value;
end;

procedure TWorkflowStepsItem.SetSSQLBACK(const Value: String);
begin
  FSSQLBACK := Value;
end;

procedure TWorkflowStepsItem.SetSSQLSTEP(const Value: String);
begin
  FSSQLSTEP := Value;
end;

procedure TWorkflowStepsItem.SetSSTEPNAME(const Value: String);
begin
  FSSTEPNAME := Value;
end;

procedure TWorkflowStepsItem.SetSTATUSTEXT(const Value: String);
begin
  FSTATUSTEXT := Value;
end;

procedure TWorkflowStepsItem.SetWDURATIONINTERVAL(const Value: Integer);
begin
  FWDURATIONINTERVAL := Value;
end;

procedure TWorkflowStepsItem.SetWDURATIONTYPE(const Value: Integer);
begin
  FWDURATIONTYPE := Value;
end;

procedure TWorkflowStepsItem.SetWHEIGHT(const Value: Integer);
begin
  FWHEIGHT := Value;
end;

procedure TWorkflowStepsItem.SetWSTATUSID(const Value: Integer);
begin
  FWSTATUSID := Value;
end;

procedure TWorkflowStepsItem.SetWSTEPTYPEID(const Value: Integer);
begin
  FWSTEPTYPEID := Value;
end;

procedure TWorkflowStepsItem.SetWUSERID(const Value: Integer);
begin
  FWUSERID := Value;
end;

procedure TWorkflowStepsItem.SetWWIDTH(const Value: Integer);
begin
  FWWIDTH := Value;
end;

procedure TWorkflowStepsItem.SetWWORKFLOWSTEPID(const Value: Integer);
begin
  FWWORKFLOWSTEPID := Value;
end;

procedure TWorkflowStepsItem.SetWXPOS(const Value: Integer);
begin
  FWXPOS := Value;
end;

procedure TWorkflowStepsItem.SetWYPOS(const Value: Integer);
begin
  FWYPOS := Value;
end;

{ TWorkFlowStepCollection }

function TWorkFlowStepCollection.GetStepName(Aid: Integer): String;
var
 astep : TWorkflowStepsItem ;
begin
 result := '' ;
 astep := GetStepOnId(Aid);
 if astep <> nil then
   Result := astep.FSSTEPNAME ;
end;

function TWorkFlowStepCollection.GetStepOnId(
  Aid: Integer): TWorkflowStepsItem;
  var i : Integer ;
begin
 result := nil ;
 for i := 0 to Count -1 do
   if steps[i].FWWORKFLOWSTEPID = Aid then
     begin
       result := steps[i] ;
       exit ;
     end;
end;

function TWorkFlowStepCollection.Getsteps(
  index: integer): TWorkflowStepsItem;
begin
result := items[index] as TWorkflowStepsItem ;
end;

procedure TWorkFlowStepCollection.Setsteps(index: integer;
  const Value: TWorkflowStepsItem);
begin
  items[index].Assign(Value);
end;

{ TWorkFlowTransitionItem }

function TWorkFlowTransitionItem.GetSTRANSNAME: String;
begin
 Result := FSTRANSNAME ;
 if Result = '' then Result := 'X' ; 
end;

procedure TWorkFlowTransitionItem.SetDelete(const Value: Boolean);
begin
  FDelete := Value;
end;

procedure TWorkFlowTransitionItem.SetSCONDITION(const Value: String);
begin
  FSCONDITION := Value;
end;

procedure TWorkFlowTransitionItem.SetSTRANSNAME(const Value: String);
begin
  FSTRANSNAME := Value;
end;

procedure TWorkFlowTransitionItem.SetWFROMWORKFLOWSTEPID(
  const Value: Integer);
begin
  FWFROMWORKFLOWSTEPID := Value;
end;

procedure TWorkFlowTransitionItem.SetWLEFTENDMARK(const Value: Integer);
begin
  FWLEFTENDMARK := Value;
end;

procedure TWorkFlowTransitionItem.SetWLEFTMARK(const Value: Integer);
begin
  FWLEFTMARK := Value;
end;

procedure TWorkFlowTransitionItem.SetWTOPENDMARK(const Value: Integer);
begin
  FWTOPENDMARK := Value;
end;

procedure TWorkFlowTransitionItem.SetWTOPMARK(const Value: Integer);
begin
  FWTOPMARK := Value;
end;

procedure TWorkFlowTransitionItem.SetWTOWORKFLOWSTEPID(
  const Value: Integer);
begin
  FWTOWORKFLOWSTEPID := Value;
end;

procedure TWorkFlowTransitionItem.SetWWORKFLOWTRANSID(
  const Value: Integer);
begin
  FWWORKFLOWTRANSID := Value;
end;

{ TWorkFlowTransitionCollection }

function TWorkFlowTransitionCollection.Gettransitions(
  index: integer): TWorkFlowTransitionItem;
begin
   result := items[index] as TWorkFlowTransitionItem ;
end;

procedure TWorkFlowTransitionCollection.Settransitions(index: integer;
  const Value: TWorkFlowTransitionItem);
begin
  items[index].Assign(Value);
end;

{ TWorkFlowComponent }

constructor TWorkFlowComponent.Create(AOwner: TComponent);
begin
  inherited;
  FSteps := TWorkFlowStepCollection.Create(self,TWorkflowStepsItem);
  Ftransitions := TWorkFlowTransitionCollection.Create(self,TWorkFlowTransitionItem);
end;

destructor TWorkFlowComponent.Destroy;
begin
  FreeAndNil( FSteps);
  FreeAndNil( Ftransitions );
  inherited;
end;

procedure TWorkFlowComponent.SetDisplayname(const Value: String);
begin
  FDisplayname := Value;
end;

procedure TWorkFlowComponent.SetGroupname(const Value: String);
begin
  FGroupname := Value;
end;

procedure TWorkFlowComponent.SetGuid(const Value: String);
begin
  FGuid := Value;
end;

procedure TWorkFlowComponent.SetStartstep(const Value: Integer);
begin
  FStartstep := Value;
end;

procedure TWorkFlowComponent.SetSteps(
  const Value: TWorkFlowStepCollection);
begin
  FSteps := Value;
end;

procedure TWorkFlowComponent.Settransitions(
  const Value: TWorkFlowTransitionCollection);
begin
  Ftransitions := Value;
end;

procedure TdmWorkflowData.ZQTasksAfterInsert(DataSet: TDataSet);
begin
 ZQTasksWWORKFLOWWORKID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_WF_WORK') ;
 ZQTasksWUSERID.AsInteger := DMTCCoreLink.currentuser ;
end;

procedure TdmWorkflowData.ZQHistAfterInsert(DataSet: TDataSet);
begin
ZQHistWWORKFLOWWORKHISID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_WF_HIST') ;
end;

procedure TdmWorkflowData.ZQWorkflowAfterInsert(DataSet: TDataSet);
begin
  ZQWorkflowWWORKFLOWTYPEID.AsInteger :=  1 + StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WWORKFLOWTYPEID) from WORKFLOWTYPES')),0);
  ZQWorkflowBDISABLE.AsInteger := 0 ;
end;

procedure TdmWorkflowData.SaveComponentToDatabase(  aWorkFlowComponent: TWorkFlowComponent);
var
 I :Integer ;
begin
ZQSteps.close ;
ZQSteps.open ;

for i := 0 to aWorkFlowComponent.Steps.Count -1 do
  begin
     if not ZQSteps.Locate('WWORKFLOWSTEPID',aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID,[]) then
       begin
         if not aWorkFlowComponent.Steps.steps[i].Delete then
         ZQSteps.Insert else  Continue ;
        end else
        begin
         if aWorkFlowComponent.Steps.steps[i].Delete then
          begin
             if ZQWorkflowSTARTSTEP.AsInteger = ZQStepsWWORKFLOWSTEPID.AsInteger then
                begin
                  ZQWorkflow.edit ;
                  ZQWorkflowSTARTSTEP.AsInteger := 0 ;
                  ZQWorkflow.Post ;
                end;
            ZQSteps.Delete ;
          end  else
             ZQSteps.Edit ;
        end;
     if (ZQSteps.State in[dsEdit,DsInsert]) then
         begin
             ZQStepsWWORKFLOWSTEPID.AsInteger := aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID ;
             ZQStepsSSTEPNAME.AsString := aWorkFlowComponent.Steps.steps[i].SSTEPNAME ;
             ZQStepsWSTEPTYPEID.AsInteger :=  ZQWorkflowWWORKFLOWTYPEID.AsInteger  ;
             ZQStepsSPARAMS.AsString := aWorkFlowComponent.Steps.steps[i].SPARAMS ;
             ZQStepsWSTATUSID.AsInteger := aWorkFlowComponent.Steps.steps[i].WSTATUSID ;
             ZQStepsWDURATIONTYPE.AsInteger := aWorkFlowComponent.Steps.steps[i].WDURATIONTYPE ;
             ZQStepsWDURATIONINTERVAL.AsInteger := aWorkFlowComponent.Steps.steps[i].WDURATIONINTERVAL ;
             ZQStepsWUSERID.AsInteger := aWorkFlowComponent.Steps.steps[i].WUSERID ;
             ZQStepsWXPOS.AsInteger := aWorkFlowComponent.Steps.steps[i].WXPOS ;
             ZQStepsWYPOS.AsInteger := aWorkFlowComponent.Steps.steps[i].WYPOS ;
             ZQStepsWWIDTH.AsInteger := aWorkFlowComponent.Steps.steps[i].WWIDTH ;
             ZQStepsWHEIGHT.AsInteger := aWorkFlowComponent.Steps.steps[i].WHEIGHT ;
             ZQStepsSREMARK.AsString := aWorkFlowComponent.Steps.steps[i].SREMARK ;
             ZQStepsSSQLSTEP.AsString := aWorkFlowComponent.Steps.steps[i].SSQLSTEP ;
             ZQStepsSSQLBACK.AsString := aWorkFlowComponent.Steps.steps[i].SSQLBACK ;
             ZQStepsSTATUSTEXT.AsString := aWorkFlowComponent.Steps.steps[i].STATUSTEXT ;
             ZQSteps.post ;
             if ZQWorkflowSTARTSTEP.AsInteger = 0 then
                begin
                  ZQWorkflow.edit ;
                  ZQWorkflowSTARTSTEP.AsInteger := ZQStepsWWORKFLOWSTEPID.AsInteger ;
                  ZQWorkflow.Post ;
                end;
           end;
  end;
ZQTransisions.close ;
ZQTransisions.Open ;
for i := 0 to aWorkFlowComponent.transitions.Count -1 do
  begin
     if not ZQTransisions.Locate('WWORKFLOWTRANSID',aWorkFlowComponent.transitions.transitions[i].WWORKFLOWTRANSID,[]) then
       begin
         if not aWorkFlowComponent.transitions.transitions[i].Delete then
         ZQTransisions.Insert else
             Continue ;
      end else
      begin
          if aWorkFlowComponent.transitions.transitions[i].Delete then
              ZQTransisions.delete
          else ZQTransisions.Edit ;
       end;
     if (ZQTransisions.State in[dsEdit,DsInsert]) then
        begin
         ZQTransisionsWWORKFLOWTRANSID.AsInteger := aWorkFlowComponent.transitions.transitions[i].WWORKFLOWTRANSID ;
         ZQTransisionsWFROMWORKFLOWSTEPID.AsInteger := aWorkFlowComponent.transitions.transitions[i].WFROMWORKFLOWSTEPID ;
         ZQTransisionsWTOWORKFLOWSTEPID.AsInteger := aWorkFlowComponent.transitions.transitions[i].WTOWORKFLOWSTEPID ;
         ZQTransisionsSTRANSNAME.AsString := aWorkFlowComponent.transitions.transitions[i].STRANSNAME ;
         ZQTransisionsSCONDITION.AsString := aWorkFlowComponent.transitions.transitions[i].SCONDITION ;
         ZQTransisionsWLEFTMARK.AsInteger := aWorkFlowComponent.transitions.transitions[i].WLEFTMARK ;
         ZQTransisionsWTOPMARK.AsInteger := aWorkFlowComponent.transitions.transitions[i].WTOPMARK ;
         ZQTransisionsWLEFTENDMARK.AsInteger := aWorkFlowComponent.transitions.transitions[i].FWLEFTENDMARK ;
         ZQTransisionsWTOPENDMARK.AsInteger := aWorkFlowComponent.transitions.transitions[i].FWTOPENDMARK ;
         ZQTransisions.post ;
        end;
     end;
end;

procedure TdmWorkflowData.LoadComponentFromDatabase(
  AWorkFlowComponent: TWorkFlowComponent);
begin
ZQSteps.close ;
ZQSteps.open ;
while not ZQSteps.eof do
  begin
     with aWorkFlowComponent.Steps.Add as TWorkflowStepsItem do
       begin
         WWORKFLOWSTEPID :=  ZQStepsWWORKFLOWSTEPID.AsInteger ;
         SSTEPNAME := ZQStepsSSTEPNAME.AsString   ;
         WSTEPTYPEID := ZQStepsWSTEPTYPEID.AsInteger   ;
         SPARAMS  := TDatabaseTableRoutines.BlobFieldToString(ZQStepsSPARAMS) ;
         WSTATUSID := ZQStepsWSTATUSID.AsInteger  ;
         WDURATIONTYPE :=  ZQStepsWDURATIONTYPE.AsInteger  ;
         WDURATIONINTERVAL  := ZQStepsWDURATIONINTERVAL.AsInteger ;
         WUSERID   := ZQStepsWUSERID.AsInteger ;
         WXPOS   :=  ZQStepsWXPOS.AsInteger;
         WYPOS   := ZQStepsWYPOS.AsInteger;
         WWIDTH  := ZQStepsWWIDTH.AsInteger;
         WHEIGHT  :=  ZQStepsWHEIGHT.AsInteger ;
         SREMARK := TDatabaseTableRoutines.BlobFieldToString(ZQStepsSREMARK) ;
         SSQLSTEP  :=  TDatabaseTableRoutines.BlobFieldToString(ZQStepsSSQLSTEP)  ;
         SSQLBACK :=  TDatabaseTableRoutines.BlobFieldToString(ZQStepsSSQLBACK ) ;
         STATUSTEXT :=  TDatabaseTableRoutines.BlobFieldToString(ZQStepsSTATUSTEXT ) ;
       end;
    ZQSteps.next ;
  end;
ZQTransisions.close ;
ZQTransisions.open ;
while not ZQTransisions.eof do
   begin
      with aWorkFlowComponent.transitions.Add as TWorkFlowTransitionItem do
        begin
           WFROMWORKFLOWSTEPID := ZQTransisionsWFROMWORKFLOWSTEPID.AsInteger ;
           WTOWORKFLOWSTEPID   := ZQTransisionsWTOWORKFLOWSTEPID.AsInteger ;
           WWORKFLOWTRANSID := ZQTransisionsWWORKFLOWTRANSID.AsInteger ;
           SCONDITION :=   TDatabaseTableRoutines.BlobFieldToString(ZQTransisionsSCONDITION) ;
           STRANSNAME := ZQTransisionsSTRANSNAME.AsString ;
           FWLEFTMARK := ZQTransisionsWLEFTMARK.AsInteger ;
           FWTOPMARK := ZQTransisionsWTOPMARK.AsInteger ;

           FWLEFTENDMARK := ZQTransisionsWLEFTENDMARK.AsInteger ;
           FWTOPENDMARK := ZQTransisionsWTOPENDMARK.AsInteger ;
        end;
      ZQTransisions.next ;
   end;
end;

procedure TdmWorkflowData.ZQTaskListCalcFields(DataSet: TDataSet);
 var
   Startdate,EndDate : TDateTime ;
   TotalDuur,PartDone,PercentDone : Double ;
begin


  if not DataSet.FieldByName('STATUSTEXT').IsNull then
     begin
      if DataSet.FieldByName('DISPLAYTEXT').AsString = '' then
       begin
        DataSet.FieldByName('DISPLAYTEXT').AsString := VarToStr(
        TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(
        TDatabaseTableRoutines.ReplaceParams(
        DataSet.FieldByName('STATUSTEXT').AsString,'KEY=' + IntToStr(DataSet.FieldByName('WLINKID').AsInteger) + #13+#10 +'WORKID=' + IntToStr(DataSet.FieldByName('WWORKFLOWWORKID').AsInteger)
        + #13+#10 +'STEPID=' + IntToStr(DataSet.FieldByName('WWORKFLOWSTEPID').AsInteger)
        + #13+#10 +'USERID=' + IntToStr(DataSet.FieldByName('WUSERID').AsInteger)
        ) ) );
       end;
     end;
     if DataSet.FieldByName('USER').AsString = '' then
        DataSet.FieldByName('USER').AsString := TDatabaseUserRoutines.GetUsername(DataSet.FieldByName('WUSERID').AsInteger) ;
     if DataSet.FieldByName('FPERCENTCOMP').AsString = '' then
         begin

           PercentDone := 0 ;
            if  DataSet.FieldByName('WDURATIONTYPE').AsInteger <> 0 then
              begin
                EndDate := DataSet.FieldByName('DDATEACTION').AsDateTime ;
                Startdate :=EndDate ;
                case DataSet.FieldByName('WDURATIONTYPE').AsInteger of
                1 : EndDate := EndDate + EncodeTime(DataSet.FieldByName('WDURATIONINTERVAL').AsInteger div 60,DataSet.FieldByName('WDURATIONINTERVAL').AsInteger mod 60,0,0);
                2 : EndDate := EndDate + (DataSet.FieldByName('WDURATIONINTERVAL').AsInteger div 24)+ EncodeTime(DataSet.FieldByName('WDURATIONINTERVAL').AsInteger mod 24,0,0,0);
                3 : EndDate := EndDate + DataSet.FieldByName('WDURATIONINTERVAL').AsInteger;
                4 : EndDate := IncMonth(EndDate ,DataSet.FieldByName('WDURATIONINTERVAL').AsInteger);
                5 : EndDate := IncMonth(EndDate ,DataSet.FieldByName('WDURATIONINTERVAL').AsInteger * 12);
                end;// end case
                TotalDuur := EndDate - Startdate ;
                PartDone :=  Date - Startdate ;
                if  TotalDuur <> 0 then
                   PercentDone :=  (PartDone / TotalDuur) * 100 ;
             end;
            if PercentDone > 100 then
              PercentDone := 100 ;
            if PercentDone < 0 then
              PercentDone := 0 ;   
            DataSet.FieldByName('FPERCENTCOMP').AsFloat := PercentDone;
       end;
end;

procedure TdmWorkflowData.ZQWorkflowBeforePost(DataSet: TDataSet);
var
 aGuid : TGUID ;
begin
 if ZQWorkflowGUID.AsString = '' then
   begin
      CreateGUID(aGuid);
      ZQWorkflowGUID.AsString := GUIDToString(aGuid) ;

   end;
  {if DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*)  from WORKFLOWSTEPS where WSTEPTYPEID = '+ IntToStr(ZQWorkflowSTARTSTEP.AsInteger)) = '0' then
   ZQWorkflowSTARTSTEP.Clear ; }

end;

procedure TdmWorkflowData.InitForDatabase;
begin
  DMTCCoreLink.AssignConnectionToChilds(self);

  if not TDatabaseTableRoutines.FieldExists('WORKFLOWTRANSITIONS','WTOPENDMARK') then
  begin
   try
  if not TDatabaseTableRoutines.FieldExists('WORKFLOW_ENTITYLINK','WWORKFLOWWORKID') then
  begin

   if not TDatabaseTableRoutines.FieldExists('WORKFLOWTYPES','WWORKFLOWTYPEID') then
     ZSQLProcessor1.Execute ;
     if not TDatabaseTableRoutines.FieldExists('WORKFLOWRIGHTS','WWORKFLOWTYPEID') then
     ZSQLProcessor2.Execute ;


     ZSQLProcessor3.Execute ;
  end;
  UniScript1.Execute ;
   except

   end;
  end;


end;

procedure TdmWorkflowData.LoadComponent(Afilename: String;var aWorkFlowComponent: TWorkFlowComponent);
var
 aGuid : TGUID ;
 AStream : TFileStream ;
  i,Lastval : Integer ;
  aFromToList : TStringlist ;
  alocCompt: TComponent ;
var
  StrStream:TFileStream;
  BinStream: TMemoryStream;
begin
  StrStream := TFileStream.Create(Afilename,fmOpenRead	);
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(StrStream, BinStream);
      BinStream.Seek(0, soFromBeginning);
      alocCompt := BinStream.ReadComponent(nil);

    finally
      BinStream.Free;
    end;
  finally
    StrStream.Free;
  end;

    aWorkFlowComponent.free;
    aWorkFlowComponent := alocCompt as TWorkFlowComponent ;
    if (ZQWorkflow.Locate('GUID',aWorkFlowComponent.Guid,[])) or (aWorkFlowComponent.Guid = '') then
       begin
        CreateGUID(aGuid);
        aWorkFlowComponent.Guid  := GUIDToString(aGuid) ;
       end;
     aFromToList := TStringList.Create ;
     try
    for i := 0 to aWorkFlowComponent.FSteps.Count -1 do
      begin
       Lastval :=  aWorkFlowComponent.FSteps.steps[i].FWWORKFLOWSTEPID ;
       aWorkFlowComponent.FSteps.steps[i].FWWORKFLOWSTEPID := DMTCCoreLink.GetNewIdStr('GEN_WF_STEP');
       aFromToList.Values[IntToStr( Lastval)] := IntToStr( aWorkFlowComponent.FSteps.steps[i].FWWORKFLOWSTEPID) ;

      end;
    aWorkFlowComponent.startstep := StrtoIntDef(aFromToList.Values[IntToStr(aWorkFlowComponent.startstep )],0);
    for i := 0 to aWorkFlowComponent.Ftransitions.Count -1 do
      begin
       Lastval :=  aWorkFlowComponent.Ftransitions.transitions[i].WWORKFLOWTRANSID ;
       aWorkFlowComponent.Ftransitions.transitions[i].FWWORKFLOWTRANSID := DMTCCoreLink.GetNewIdStr('GEN_WF_TRANS');
       aWorkFlowComponent.Ftransitions.transitions[i].FWFROMWORKFLOWSTEPID :=   StrtoIntDef(aFromToList.Values[IntToStr(aWorkFlowComponent.Ftransitions.transitions[i].FWFROMWORKFLOWSTEPID )],0);  ;
       aWorkFlowComponent.Ftransitions.transitions[i].FWTOWORKFLOWSTEPID :=   StrtoIntDef(aFromToList.Values[IntToStr(aWorkFlowComponent.Ftransitions.transitions[i].FWTOWORKFLOWSTEPID )],0);
      end;
    finally
       aFromToList.Free ;
    end;
    ZQWorkflow.Insert ;
    ZQWorkflowSWORFLOWNAME.AsString := aWorkFlowComponent.FDisplayname ;
    ZQWorkflowGUID.AsString :=  aWorkFlowComponent.Guid ;
    ZQWorkflowSTARTSTEP.AsInteger :=  aWorkFlowComponent.startstep ;
    ZQWorkflowWGROUPID.AsInteger := TDataBaseRoutines.GetAddGroupNesteled(aWorkFlowComponent.Groupname,120);
    ZQWorkflowBDISABLE.AsInteger := 0 ;

end;


procedure TdmWorkflowData.SaveComponent(Afilename: String;aWorkFlowComponent: TWorkFlowComponent);
var
 AStream : TFileStream ;

  BinStream:TMemoryStream;

begin
  BinStream := TMemoryStream.Create;
  try

  AStream := TFileStream.Create(Afilename,fmCreate) ;
  try
   if ZQWorkflowGUID.AsString <> '' then
    aWorkFlowComponent.Guid := ZQWorkflowGUID.AsString ;
    aWorkFlowComponent.Displayname := ZQWorkflowSWORFLOWNAME.AsString ;
    aWorkFlowComponent.Startstep := ZQWorkflowSTARTSTEP.AsInteger ;
    aWorkFlowComponent.Groupname := TDataBaseRoutines.GetNesteldNameFromGroupID(ZQWorkflowWGROUPID.AsInteger,0);
    BinStream.WriteComponent(aWorkFlowComponent);
    BinStream.Seek(0, soFromBeginning);
    ObjectBinaryToText(BinStream, AStream);
  finally
    AStream.free ;
  end;

//   StrStream := TStringStream.Create(s);
//    try
//      BinStream.WriteComponent(Component);
//      BinStream.Seek(0, soFromBeginning);
//      ObjectBinaryToText(BinStream, StrStream);
//      StrStream.Seek(0, soFromBeginning);
//      Result:= StrStream.DataString;
//    finally
//      StrStream.Free;

   // end;
  finally
    BinStream.Free
  end;
end;

procedure TdmWorkflowData.ZQWorkflowWGROUPIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := '' ;
 if Sender.AsInteger <> 0 then
    Text := TDataBaseRoutines.GetNesteldNameFromGroupID(Sender.AsInteger,0) ;

end;

procedure TdmWorkflowData.ZQWorkflowWGROUPIDSetText(Sender: TField;
  const Text: String);
begin
 sender.asinteger := TDataBaseRoutines.GetAddGroupNesteled(Text,120);
end;

procedure TdmWorkflowData.ZQRightsAfterInsert(DataSet: TDataSet);
begin
 ZQRightsWWORKFLOWTYPEID.AsInteger :=  ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
end;

procedure TdmWorkflowData.ZQWorkflowBeforeDelete(DataSet: TDataSet);
begin
  DMTCCoreLink.ExecSql('Delete from WORKFLOWWORKHIS where WWORKFLOWSTEPID  in (select WWORKFLOWSTEPID from WORKFLOWSTEPS where WORKFLOWSTEPS.WSTEPTYPEID = '+QuotedStr(ZQWorkflowWWORKFLOWTYPEID.AsString)+')');
  DMTCCoreLink.ExecSql('Delete from WORKFLOWWORK where WWORKFLOWSTEPID  in (select WWORKFLOWSTEPID from WORKFLOWSTEPS where WORKFLOWSTEPS.WSTEPTYPEID = '+QuotedStr(ZQWorkflowWWORKFLOWTYPEID.AsString)+')');
end;

initialization
RegisterClass(TWorkFlowComponent);

 

end.
