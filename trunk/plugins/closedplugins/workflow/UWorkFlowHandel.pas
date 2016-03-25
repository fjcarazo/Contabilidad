unit UWorkFlowHandel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  ActnList, ActnMan, StdCtrls,
   DB,   DBAccess , Uni, Grids,
  DBGrids, Buttons, ComCtrls,UosfResources, Menus,  ActnCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomView, cxClasses, cxGridLevel, cxGrid,
  XPStyleActnCtrls, ToolWin;

type
  TfmWorkFlowHandel = class(TForm)
    ActionManager1: TActionManager;
    Panel1: TPanel;
    Panel2: TPanel;
    dsTasks: TDataSource;
    Abnew: TAction;
    aProcess: TAction;
    aHistory: TAction;
    Aclosed: TAction;
    Aedit: TAction;
    PopupMenu1: TPopupMenu;
    New1: TMenuItem;
    Viewclosed1: TMenuItem;
    Edit1: TMenuItem;
    History1: TMenuItem;
    Process1: TMenuItem;
    PopupMenu2: TPopupMenu;
    User1: TMenuItem;
    tStartJob: TTimer;
    whereami1: TMenuItem;
    AwhereAmI: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1WWORKFLOWWORKID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WUSERID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WSTATUS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WWORKFLOWSTEPID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WLINKID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDATEACTION: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSTEPNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SWORFLOWNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1PARAMS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STATUSTEXT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DISPLAYTEXT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1USER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDURATIONTYPE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDURATIONINTERVAL: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WGROUPID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FPERCENTCOMP: TcxGridDBBandedColumn;
    pType: TPanel;
    LType: TLabel;
    cbNewWorkflow: TComboBox;
    pdate: TPanel;
    Label1: TLabel;
    dTimeLimit: TDateTimePicker;
    tbClose: TToolButton;
    procedure bNEwClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bPRocessClick(Sender: TObject);
    procedure BHistoryClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure bViewClosedClick(Sender: TObject);
    procedure dTimeLimitExit(Sender: TObject);
    procedure BeditClick(Sender: TObject);
    procedure dsTasksDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure User1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tStartJobTimer(Sender: TObject);
    procedure AwhereAmIExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tbCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    LimitSql : String ;
    isRegistered : Boolean ;
    { Public declarations }
  end;

var
  fmWorkFlowHandel: TfmWorkFlowHandel;

implementation

uses UDMTCCoreLink, UWorkFlowDatamodule, UWorkFlowExeCuteStep,
  UWorkFlowHistory, OSFGeneralRoutines, TcashClasses, USQLHolder, Main,
  Uworkflowsetup, UDmQuantumGridDefs;

{$R *.dfm}

procedure TfmWorkFlowHandel.bNEwClick(Sender: TObject);
var
  Aid : Integer ;
 Const FreeGuidsStr = '{3A67E7D9-602F-4B90-BE49-CE0C7D0CFEB8},{2C25245E-A9BA-45EF-97A6-66228F4CB4C4},{6944ED90-9C2C-4DD7-984F-8BD1C9D553A5}' ;
begin
 if cbNewWorkflow.ItemIndex = -1 then
  begin
    cbNewWorkflow.SetFocus ;
    exit ;
  end;
  if dmWorkflowData.ZQWorkflow.Locate('WWORKFLOWTYPEID',Integer(cbNewWorkflow.Items.Objects[cbNewWorkflow.ItemIndex]),[ ]) then
   begin
   if dmWorkflowData.ZQWorkflowSTARTSTEP.AsInteger = 0 then
      raise Exception.Create('No start step for this process set start stet first.');
   if not isRegistered then
     if pos(dmWorkflowData.ZQWorkflowGUID.AsString,FreeGuidsStr) < 1 then
        if not DMTCCoreLink.IsRegistered(dmWorkflowData.ZQWorkflowGUID.AsString) then
            raise exception.Create('Not a registerd component please ask for a trial version http://www.osfshop.com !');
    dmWorkflowData.ZQTasks.open ;
    dmWorkflowData.ZQTasks.Insert ;
    Aid := dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger ;
    dmWorkflowData.ZQTasksWUSERID.AsInteger := DMTCCoreLink.currentuser ;
    dmWorkflowData.ZQTasksWSTATUS.AsInteger := 0 ;
    dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger := dmWorkflowData.ZQWorkflowSTARTSTEP.AsInteger ;
    dmWorkflowData.ZQTasksDDATEACTION.AsDateTime := now ;
    dmWorkflowData.ZQTasks.post ;
    dmWorkflowData.ZQTaskList.close ;
    dmWorkflowData.ZQTaskList.open ;
    dmWorkflowData.ZQTaskList.Locate('WWORKFLOWWORKID',Aid,[]);
    bPRocessClick(self);
  end;
end;

procedure TfmWorkFlowHandel.FormCreate(Sender: TObject);
var
 amenuitem : TMenuItem ;
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
 cxGrid1DBBandedTableView1.Styles.StyleSheet := dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard ;
 ActionManager1.Images :=  dmOsfResource.BatchEnabledButtons ;
 isRegistered :=  DMTCCoreLink.IsRegistered('{22423B3E-237D-4A70-A47B-D307C1CAC250}') ;
 dTimeLimit.DateTime := Date ;
  User1.OnClick := nil ;
 if DMTCCoreLink.currentuser <> 0 then
   if not TDatabaseUserRoutines.GetUserAccessGlobalProcess(DMTCCoreLink.currentuser) then
    begin
     dmWorkflowData.ZQWorkflow.SQL.text := 'select * from WORKFLOWTYPES  '  ;
     dmWorkflowData.ZQWorkflow.SQL.Add(' where exists(SELECT * FROM WORKFLOWRIGHTS x where x.WWORKFLOWTYPEID =  WORKFLOWTYPES.WWORKFLOWTYPEID and x.Wuserid = ' + IntToStr(DMTCCoreLink.currentuser) +' )' ) ;
    end;
 dmWorkflowData.ZQWorkflow.Open ;
 dmWorkflowData.ZQWorkflow.first ;
 while not dmWorkflowData.ZQWorkflow.Eof do
   begin
      if dmWorkflowData.ZQWorkflowWGROUPID.AsInteger <> 0 then
        cbNewWorkflow.AddItem(TDataBaseRoutines.GetNesteldNameFromGroupID(dmWorkflowData.ZQWorkflowWGROUPID.AsInteger ,0)+'-> '+ dmWorkflowData.ZQWorkflowSWORFLOWNAME.AsString,TObject( dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger))
      else
      cbNewWorkflow.AddItem(dmWorkflowData.ZQWorkflowSWORFLOWNAME.AsString,TObject( dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger));
      dmWorkflowData.ZQWorkflow.next ;
   end;
   if DMTCCoreLink.currentuser <> 0 then
    if not TDatabaseUserRoutines.GetUserAccessGlobalProcess(DMTCCoreLink.currentuser) then
     begin
       LimitSql := ' and (a.Wuserid = ' + IntToStr(DMTCCoreLink.currentuser) + ' or a.Wuserid is null )' ;
       dmWorkflowData.ZQTaskList.SQL.Add( LimitSql) ;
       Aedit.Visible := False ;
     end;
   dmWorkflowData.ZQTaskList.Open ;
   dmWorkflowData.ZqUsers.close ;
   dmWorkflowData.ZqUsers.open ;
   while not dmWorkflowData.ZqUsers.eof do
      begin
       if Trim(dmWorkflowData.ZqUsersSUSERNAME.AsString) <> '' then
        begin
         amenuitem := TMenuItem.Create(self) ;
         amenuitem.Tag := dmWorkflowData.ZqUsersWUSERID.AsInteger ;
         amenuitem.Caption := dmWorkflowData.ZqUsersSUSERNAME.AsString ;
         amenuitem.OnClick := User1Click ;
         User1.Add(amenuitem);
         end;
         dmWorkflowData.ZqUsers.next ;
      end;

      tbClose.Caption := DMTCCoreLink.GetTextLang(828);
end;

procedure TfmWorkFlowHandel.bPRocessClick(Sender: TObject);
var
 aexecute : TfmWorkflowExecuteStep ;
 Aid : Integer ;
begin
 Aid := dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger  ;
 dmWorkflowData.ZQTasks.close ;
 dmWorkflowData.ZQTasks.Params[0].AsInteger :=dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger ;
 dmWorkflowData.ZQTasks.Open ;
 if not dmWorkflowData.ZQTasks.IsEmpty then
  begin
   aexecute := TfmWorkflowExecuteStep.create(Application) ;
   try
     aexecute.ShowModal ;
   finally
    aexecute.free ;
   end;
   dmWorkflowData.ZQTaskList.close ;
   dmWorkflowData.ZQTaskList.open ;
   dmWorkflowData.ZQTaskList.Locate('WWORKFLOWWORKID',Aid,[]);

   if (cbNewWorkflow.Items.Count = 0) and (dmWorkflowData.ZQTaskList.RecordCount =1 ) and (VarToStr(DMTCCoreLink.ReadSysParam('BEditmode',0,DMTCCoreLink.CurrentUser))  = '3') then
     Application.Terminate  ;

 end;
end;

procedure TfmWorkFlowHandel.BHistoryClick(Sender: TObject);
begin
    dmWorkflowData.ZQTaskHist.close ;
    dmWorkflowData.ZQTaskHist.Params[0].AsInteger := dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger ;

    dmWorkflowData.ZQTaskHist.open ;
    if dmWorkflowData.ZQTaskHist.IsEmpty then
      raise Exception.Create('No history found!') ;

   fmWorkFlowHistory := TfmWorkFlowHistory.Create(self);
   try
    fmWorkFlowHistory.ShowModal ;
   finally
     fmWorkFlowHistory.free ;
   end;
end;

procedure TfmWorkFlowHandel.DBGrid1TitleClick(Column: TColumn);
begin
if TuniQuery(Column.Grid.DataSource.DataSet).Active then
  if TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames <> Column.FieldName then
    begin
     TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames := Column.FieldName ;
    end else
    begin
       TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames := Column.FieldName +' desc';
    end;
end;

procedure TfmWorkFlowHandel.bViewClosedClick(Sender: TObject);
begin
  if Aclosed.Tag = 1 then
     begin
       dmWorkflowData.ZQTaskList.close ;
       dmWorkflowData.ZQTaskList.SQL.Text := 'select ' +  dmWorkflowData.sqlTasklist.SQL.Text ;
       dmWorkflowData.ZQTaskList.SQL.add(' where a.WSTATUS <> -1 '+ LimitSql ) ;
       dmWorkflowData.ZQTaskList.open ;
       Aclosed.Tag := 0 ;
       Aclosed.Caption := 'View closed';
       aPRocess.Enabled := true ;
       Abnew.Enabled := true ;
       pdate.Enabled := False ;
     end else
     begin
       dmWorkflowData.ZQTaskList.close ;
       dmWorkflowData.ZQTaskList.SQL.Text := 'select first 250 ' +  dmWorkflowData.sqlTasklist.SQL.Text ;
       dmWorkflowData.ZQTaskList.SQL.add(' where a.WSTATUS = -1 and ddateaction < :mydate '+ LimitSql +'  order by  1 desc ') ;
       dmWorkflowData.ZQTaskList.Params[0].AsDate :=  dTimeLimit.date+1 ;
       dmWorkflowData.ZQTaskList.open ;
       Aclosed.Tag := 1 ;
       Aclosed.Caption := 'View open';
       aPRocess.Enabled := False ;
       pdate.Enabled := True ;
       Abnew.Enabled := False ;
     end;
end;

procedure TfmWorkFlowHandel.dTimeLimitExit(Sender: TObject);
begin
       dmWorkflowData.ZQTaskList.close ;
       dmWorkflowData.ZQTaskList.SQL.Text := 'select first 250 ' +  dmWorkflowData.sqlTasklist.SQL.Text ;
       dmWorkflowData.ZQTaskList.SQL.add(' where a.WSTATUS = -1 and ddateaction < :mydate '+ LimitSql +'  order by  1 desc ') ;
       dmWorkflowData.ZQTaskList.Params[0].AsDate :=  dTimeLimit.date+1 ;
       dmWorkflowData.ZQTaskList.open  ;
end;

procedure TfmWorkFlowHandel.BeditClick(Sender: TObject);
begin
    fmMain.Workflowsetup1Click(self);
end;

procedure TfmWorkFlowHandel.dsTasksDataChange(Sender: TObject;
  Field: TField);
begin
 aProcess.Enabled :=  not dsTasks.DataSet.IsEmpty  ;
 aHistory.Enabled :=  not dsTasks.DataSet.IsEmpty  ;
end;

procedure TfmWorkFlowHandel.DBGrid1DblClick(Sender: TObject);
begin
 aProcess.Execute ;
end;

procedure TfmWorkFlowHandel.User1Click(Sender: TObject);
var
 i : Integer ;
begin
if dsTasks.DataSet.IsEmpty then exit ;
if Aclosed.Tag = 1 then exit ;
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount  -1 do
    begin
      cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
      DMTCCoreLink.ExecSql('update WORKFLOWWORK set Wuserid = ' +IntToStr(TComponent(sender).tag)+ ' where WWORKFLOWWORKID = '  +  QuotedStr(dsTasks.DataSet.FieldByName('WWORKFLOWWORKID').AsString) );
    end;
  dsTasks.DataSet.close ;
  dsTasks.DataSet.open ;
end;

procedure TfmWorkFlowHandel.FormShow(Sender: TObject);
begin
Abnew.Caption := DMTCCoreLink.GetTextLangNoAmp(983) ;
LType.Caption := DMTCCoreLink.GetTextLangNoAmp(1079) ;
aProcess.Caption := DMTCCoreLink.GetTextLangNoAmp(3433) ;
aHistory.Caption := DMTCCoreLink.GetTextLangNoAmp(3318) ;
Aclosed.Caption := DMTCCoreLink.GetTextLangNoAmp(3437) ;
Aedit.Caption := DMTCCoreLink.GetTextLangNoAmp(121) ;
AwhereAmI.Caption := DMTCCoreLink.GetTextLangNoAmp(3485) ;
User1.Caption := DMTCCoreLink.GetTextLangNoAmp(1072) ;
 cxGrid1DBBandedTableView1USER.Caption := DMTCCoreLink.GetTextLangNoAmp(1072) ;
 cxGrid1DBBandedTableView1WSTATUS.Caption := DMTCCoreLink.GetTextLangNoAmp(3432) ;
 cxGrid1DBBandedTableView1DDATEACTION.Caption := DMTCCoreLink.GetTextLangNoAmp(3434) ;
 cxGrid1DBBandedTableView1WGROUPID.Caption := DMTCCoreLink.GetTextLangNoAmp(345) ;
 cxGrid1DBBandedTableView1SWORFLOWNAME.Caption := DMTCCoreLink.GetTextLangNoAmp(3433) ;
 cxGrid1DBBandedTableView1SSTEPNAME.Caption := DMTCCoreLink.GetTextLangNoAmp(3435) ;
 cxGrid1DBBandedTableView1DISPLAYTEXT.Caption := DMTCCoreLink.GetTextLangNoAmp(1708) ;
 cxGrid1DBBandedTableView1FPERCENTCOMP.Caption := DMTCCoreLink.GetTextLangNoAmp(3436 ) ;
 dsTasks.DataSet := dmWorkflowData.ZQTaskList ;
end;

procedure TfmWorkFlowHandel.tbCloseClick(Sender: TObject);
begin
 self.Close ;
end;

procedure TfmWorkFlowHandel.tStartJobTimer(Sender: TObject);
begin
  tStartJob.Enabled := False ;
  bPRocessClick(self);
end;

procedure TfmWorkFlowHandel.AwhereAmIExecute(Sender: TObject);
var
 aLookonly : TfmWorkflow ;
begin
 if dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger = 0 then exit ;
 aLookonly := TfmWorkflow.create(self) ;
 try
   aLookonly.WhereAmIStep := dmWorkflowData.ZQTaskListWWORKFLOWSTEPID.AsInteger ;
   aLookonly.WorkflowWorkId := dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger ;
   aLookonly.ShowModal ;
 finally
  aLookonly.free ;
 end;
end;

procedure TfmWorkFlowHandel.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    var
   agroupRec : TGroupRecPointer ;
begin
  if  StrToFloatDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1FPERCENTCOMP.Index]),0)  <> 0 then
    begin
      if StrToFloatDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1FPERCENTCOMP.Index]),0) > 70 then
      ACanvas.Brush.Color := $0079BCFF ;
      if StrToFloatDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1FPERCENTCOMP.Index]),0) > 80 then
      ACanvas.Brush.Color := $00749FFA ;
      if StrToFloatDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1FPERCENTCOMP.Index]),0) > 90 then
      ACanvas.Brush.Color := $008D9DF5 ;
      if StrToFloatDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1FPERCENTCOMP.Index]),0) > 98 then
      ACanvas.Brush.Color := $007777FF ;
    end;
   DMTCCoreLink.GroupsObject.getGroup(agroupRec, StrToIntDef(VarTOStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WGROUPID.Index]),0)) ;
 if not (AViewInfo.Focused ) then
   if agroupRec^.Wfontcol <> 0 then
     begin
        ACanvas.Brush.Color := agroupRec^.Wbackcol ;
        ACanvas.Pen.Color := agroupRec^.Wfontcol ;
     end;
end;

end.
