unit Uworkflowsetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  DB, uni,DBaccess,
  DBCtrls, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls,UWorkFlowDatamodule,
  Mask, Menus,UosfResources, ActnList, XPStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, StdStyleActnCtrls,  DAScript, UniScript, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxRichEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, cxListView;

type

  TWorkFlowPanel =class(TPanel)
  private
    FWorkFlowComponent: TWorkFlowComponent;
    procedure SetWorkFlowComponent(const Value: TWorkFlowComponent);

  published

    ABitmap : TBitmap ;
    property WorkFlowComponent : TWorkFlowComponent  read FWorkFlowComponent write FWorkFlowComponent;
  public
    MakeFromTrans : TWorkflowStepsItem ;
    MakeToTrans : TWorkflowStepsItem ;
  
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  protected
    procedure Paint; override;
  end;
  TfmWorkflow = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dsWorkflow: TDataSource;
    ScrollBox1: TScrollBox;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Save: TButton;
    bCancelStep: TButton;
    PageControl2: TPageControl;
    tsStepData: TTabSheet;
    Estatusname: TEdit;
    lStatus: TLabel;
    EDurationinterval: TEdit;
    Linterval: TLabel;
    tsExtras: TTabSheet;
    Mparams: TMemo;
    Label1: TLabel;
    tsTransitions: TTabSheet;
    lvTrans: TcxListView;
    bAddTransition: TButton;
    bDeleteTrans: TButton;
    mStatusText: TMemo;
    MsqlStepback: TMemo;
    Label10: TLabel;
    mSqlstep: TMemo;
    Label9: TLabel;
    lStatusText: TLabel;
    lRemark: TLabel;
    TabSheet7: TTabSheet;
    LTostep: TLabel;
    trToStep: TComboBox;
    trParams: TMemo;
    Lcondition: TLabel;
    trname: TEdit;
    lTransFrom: TLabel;
    trFromstep: TComboBox;
    lTransName: TLabel;
    bSaveTrans: TButton;
    bCancelTrans: TButton;
    BEditTrans: TButton;
    cbToType: TComboBox;
    lTransTo: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    rgMaxDuration: TRadioGroup;
    TabSheet8: TTabSheet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    dsRights: TDataSource;
    BtnRiightsOk: TBitBtn;
    BitBtn3: TBitBtn;
    Eparamname: TEdit;
    PopupMenu1: TPopupMenu;
    Default1: TMenuItem;
    Label7: TLabel;
    mDescription: TMemo;
    ActionManager1: TActionManager;
    aAddStep: TAction;
    aDelStep: TAction;
    aEditStep: TAction;
    aTransition: TAction;
    aSaveTodb: TAction;
    aCanceldb: TAction;
    aSaveToFile: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    bmakeThisStepDefForDocs: TButton;
    EDocType: TEdit;
    ZSQLProcessor1: TUniScript;
    bDropTrigger: TButton;
    aEditWorkFlow: TAction;
    aWorkflowLoad: TAction;
    AworkflowSaveToFile: TAction;
    aWorkFLowRights: TAction;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    ToolBar2: TToolBar;
    ToolButton13: TToolButton;
    bLoad: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    EoffsetLeft: TEdit;
    EoffsetTop: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    EoffsetLeftend: TEdit;
    EoffsetTopEnd: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Panel4: TPanel;
    Estepname: TEdit;
    lStepname: TLabel;
    LscreenType: TLabel;
    cbSetupTypes: TComboBox;
    cbUsers: TComboBox;
    LUser: TLabel;
    Label20: TLabel;
    MRemark: TRichEdit;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1WWORKFLOWTYPEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SWORFLOWNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BDISABLE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STARTSTEP: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1GUID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WGROUPID: TcxGridDBBandedColumn;
    procedure FormCreate(Sender: TObject);
    procedure bAddStepClick(Sender: TObject);
    procedure BSavestepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ReadWorkflow(Sender: TObject);
    procedure clearVisuals ;
    procedure PageControl1Change(Sender: TObject);
    procedure BDeletNodeClick(Sender: TObject);
    procedure bEditStepClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure lvTransEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure bAddTransitionClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Bcancelts1Click(Sender: TObject);
    procedure bCancelStepClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bDeleteTransClick(Sender: TObject);
    procedure cbSetupTypesChange(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure lvTransDblClick(Sender: TObject);
    procedure InitTranspage ;
    procedure bSaveTransClick(Sender: TObject);
    procedure bCancelTransClick(Sender: TObject);
    procedure cbToTypeDropDown(Sender: TObject);
    procedure cbToTypeChange(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure BLoadClick(Sender: TObject);
    procedure BrightsClick(Sender: TObject);
    procedure BtnRiightsOkClick(Sender: TObject);
    procedure MparamsClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtransitionClick(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bSaveToFileClick(Sender: TObject);
      procedure MyMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GenRightKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GenRightKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Default1Click(Sender: TObject);
    procedure bmakeThisStepDefForDocsClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure ZSQLProcessor1Error(Sender: TObject; E: Exception;
      SQL: String; var Action: TErrorAction);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    FCurrentTrans : TWorkFlowTransitionItem ;
    ComesFrom : integer ;
    BInMakeTrans : Boolean ;

    FMyActiveControl: TControl;
    procedure SetButtons(Visible: Boolean);
    procedure SetMyActiveControl(const Value: TControl);
    procedure ContorlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ControlEnter(Sender: TObject);
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    { Private declarations }
  public
    aWorkFlowComponent : TWorkFlowComponent ;
    BTopleft,BTopRight,BBottomLeft,BBottomRight,BMiddle : TButton ;
    LastRect : TRect ;
    LastPoint,LastTopLeft : Tpoint ;
    MousePoint : TPoint ;
    MouseIsDown : Boolean ;
    FoundIndex : Integer ;
    ControlDown : TControl ;
    pvisual: TWorkFlowPanel;
    WhereAmIId,WhereAmIStep:Integer ;
    WorkflowWorkId : Integer ;
    property MyActiveControl : TControl  read FMyActiveControl write SetMyActiveControl;
    { Public declarations }
  end;

var
  fmWorkflow: TfmWorkflow;

implementation

uses UDMTCCoreLink, UMsgBox, UPluginsSharedUnit, UGenSearch, UOSFVisuals,
  DateUtils, StrUtils, OSFGeneralRoutines, UDmQuantumGridDefs,
  TcashClasses;

{$R *.dfm}


procedure TfmWorkflow.ControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ControlDown := Sender as TControl ;
  LastRect.Left := MyActiveControl.Left ;
  LastRect.Right := MyActiveControl.Left + MyActiveControl.Width ;
  LastRect.Top := MyActiveControl.Top ;
  LastRect.Bottom := MyActiveControl.Height + MyActiveControl.Top ;
  GetCursorPos(LastPoint);





    MousePoint.X := x + (TControl(sender).left - MyActiveControl.Left);
    MousePoint.y := y + (TControl(sender).Top  - MyActiveControl.Top);

 // MousePoint := (sender as TControl).ScreenToClient(MousePoint) ;
  MouseIsDown := True ;
end;

procedure TfmWorkflow.ContorlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
  var
   APoint : Tpoint ;
   NewPoint : Tpoint ;
begin
  if not (MouseIsDown and (MyActiveControl <> nil)) then Exit ;


   GetCursorPos(NewPoint);
  if Sender = BTopleft then
     begin

        MyActiveControl.Left := LastRect.Left - ( LastPoint.X - NewPoint.x );
        MyActiveControl.Top := LastRect.Top - (LastPoint.y - NewPoint.Y) ;
        MyActiveControl.Width := (LastRect.Right - LastRect.Left ) + (LastPoint.X - NewPoint.x) ;
        MyActiveControl.Height := (LastRect.Bottom - LastRect.top) + ( LastPoint.y - NewPoint.Y) ;
        SetButtons(True);
     end else
  if Sender = BTopRight then
     begin
      //  MyActiveControl.Left := LastRect.Left ;
        MyActiveControl.Top := LastRect.Top - (LastPoint.y - NewPoint.Y) ;
        MyActiveControl.Width := (LastRect.Right - MyActiveControl.Left ) - (LastPoint.X - NewPoint.x) ;
        MyActiveControl.Height := (LastRect.Bottom - LastRect.top) + ( LastPoint.y - NewPoint.Y) ;
        SetButtons(True);
     end else
  if Sender = BBottomLeft then
     begin
      MyActiveControl.Left := LastRect.Left - ( LastPoint.X - NewPoint.x );
      //  MyActiveControl.Top := LastRect.Top + (LastPoint.y - mouse.CursorPos.Y) ;
      //  MyActiveControl.Width := (LastRect.Top - LastRect.Right) + (LastPoint.X - mouse.CursorPos.x) ;
        MyActiveControl.Width := (LastRect.Right - LastRect.Left ) + (LastPoint.X - NewPoint.x) ;
        MyActiveControl.Height := (LastRect.Bottom - LastRect.top) - ( LastPoint.y - NewPoint.Y) ;
        SetButtons(True);
     end else
  if ControlDown = BBottomRight then
     begin
     //   MyActiveControl.Left := LastRect.Left + (LastPoint.X - mouse.CursorPos.x  ) ;
      //  MyActiveControl.Top := LastRect.Top + (LastPoint.y - mouse.CursorPos.Y) ;
        MyActiveControl.Width := (LastRect.Right - LastRect.Left ) - (LastPoint.X - NewPoint.x) ;
        MyActiveControl.Height := (LastRect.Bottom - LastRect.top) - ( LastPoint.y - NewPoint.Y) ;
      //  MyActiveControl.Height := (LastRect.Left - LastRect.Bottom) + ( LastPoint.y - mouse.CursorPos.Y) ;
        SetButtons(True);
     end else
     begin
       APoint := (sender as tcontrol).ClientToScreen(point(x,y));
       APoint := MyActiveControl.Parent.ScreenToClient(APoint);
      // APoint := point(x,y);
       MyActiveControl.Top := APoint.y - MousePoint.y ;
       MyActiveControl.Left := APoint.x - MousePoint.x ;
       SetButtons(true);
     end;
     if MyActiveControl.Tag <> 0 then
        begin
          TWorkflowStepsItem(MyActiveControl.Tag).WYPOS := MyActiveControl.Top ;
          TWorkflowStepsItem(MyActiveControl.Tag).WXPOS := MyActiveControl.Left ;
          TWorkflowStepsItem(MyActiveControl.Tag).WHEIGHT := MyActiveControl.Height ;
          TWorkflowStepsItem(MyActiveControl.Tag).WWIDTH := MyActiveControl.Width ;
        end;
     pvisual.Repaint ;     
end;

procedure TfmWorkflow.ControlMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if MouseIsDown then
  if myActiveControl <> nil then
    begin
       SetButtons(True) ;
    end ;
 ControlDown := Nil ;   
 MouseIsDown := False ;
 pvisual.Repaint ;
end;



procedure TfmWorkflow.ControlEnter(Sender: TObject);

begin
  if MyActiveControl <> nil then
     begin
      if MyActiveControl.Tag <> 0 then
        begin
          TWorkflowStepsItem(MyActiveControl.Tag).WYPOS := MyActiveControl.Top ;
          TWorkflowStepsItem(MyActiveControl.Tag).WXPOS := MyActiveControl.Left ;
          TWorkflowStepsItem(MyActiveControl.Tag).WHEIGHT := MyActiveControl.Height ;
          TWorkflowStepsItem(MyActiveControl.Tag).WWIDTH := MyActiveControl.Width ;
        end;
     end;



  MyActiveControl :=  Sender as Tcontrol ;

  if assigned(MyActiveControl) then
   if BInMakeTrans then
    begin
      if assigned(pvisual.MakeFromTrans) then
         pvisual.MakeToTrans := TWorkflowStepsItem(MyActiveControl.Tag)
       else
         pvisual.MakeFromTrans := TWorkflowStepsItem(MyActiveControl.Tag) ;
      pvisual.Repaint ;
    end;

  BTopleft.Parent := pvisual ;
  BTopRight.Parent := pvisual ;
  BBottomLeft.Parent := pvisual ;
  BBottomRight.Parent := pvisual ;
  BMiddle.Parent := pvisual ;

  BTopleft.BringToFront ;
  BTopRight.BringToFront ;
  BBottomLeft.BringToFront ;
  BBottomRight.BringToFront ;
  BMiddle.BringToFront ;
  Setbuttons(true) ;


end;


procedure TfmWorkflow.SetButtons(Visible : Boolean);
begin

  if not Visible then
    begin
      BTopleft.Parent := nil ;
      BTopRight.Parent := nil ;
      BBottomLeft.Parent := nil ;
      BBottomRight.Parent := nil ;
      BMiddle.Parent := nil ;

      BTopleft.Visible := False ;
      BTopRight.Visible := False ;
      BBottomLeft.Visible := False ;
      BBottomRight.Visible := False ;
      BMiddle.Visible := False ;
      exit ;
    end ;

  if MyActiveControl =  nil then exit ;
  BTopleft.Visible := true ;
  BTopRight.Visible := true ;
  BBottomLeft.Visible := true ;
  BBottomRight.Visible := true ;
  BMiddle.Visible := true ;


  BTopleft.Top := MyActiveControl.Top ;
  BTopRight.Top := MyActiveControl.Top ;
  BBottomLeft.Top := MyActiveControl.Top + (MyActiveControl.Height -BBottomLeft.Height );
  BBottomRight.Top := MyActiveControl.Top + (MyActiveControl.Height -BBottomLeft.Height);
  BMiddle.Top := MyActiveControl.Top + ((MyActiveControl.Height -BBottomLeft.Height) div 2);

  BTopleft.Left := MyActiveControl.Left ;
  BTopRight.Left := MyActiveControl.Left + (MyActiveControl.Width -BBottomLeft.Width) ;
  BBottomLeft.Left := MyActiveControl.Left ;
  BBottomRight.Left := MyActiveControl.Left + (MyActiveControl.Width -BBottomLeft.Width) ;
  BMiddle.Left := MyActiveControl.Left + ((MyActiveControl.Width -BBottomLeft.Width) div 2) ;
end;

procedure TfmWorkflow.FormCreate(Sender: TObject);

 Const SqareSize = 10 ;
 var
 i  : Integer ;
begin
   ChangeDBNavigatorIcons(DBNavigator1);
   ChangeDBNavigatorIcons(DBNavigator2);
  DMTCCoreLink.AssignConnectionToChilds(self);
  PageControl2.ActivePageIndex:=0 ;

  cbSetupTypes.clear ;
  for i := 0 to WF_WorkFlowList.count -1 do
    begin
      cbSetupTypes.AddItem(TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Displayname,WF_WorkFlowList.Objects[i]);
    end;



  pvisual:= TWorkFlowPanel.create(self);
  pvisual.Parent := ScrollBox1 ;
  pvisual.Top := 0 ;
  pvisual.Left := 0 ;
  pvisual.Width := 2000 ;
  pvisual.Height := 2000 ;
  pvisual.OnClick := ScrollBox1Click ;
  pvisual.DoubleBuffered := True ;
  ScrollBox1.DoubleBuffered := True ;
  TabSheet2.DoubleBuffered := True ;
  PageControl1.DoubleBuffered := True ;

  for i := 0 to PageControl1.PageCount -1 do
    PageControl1.Pages[i].TabVisible := False ; 

PageControl1.ActivePageIndex:=0 ;

BTopleft := TButton.create(self) ;
BTopRight := TButton.create(self) ;
BBottomLeft := TButton.create(self) ;
BBottomRight := TButton.create(self) ;
BMiddle := TButton.create(self) ;

BTopleft.Width  := SqareSize ;
BTopRight.Width  := SqareSize ;
BBottomLeft.Width  := SqareSize ;
BBottomRight.Width  := SqareSize ;
BMiddle.Width  := SqareSize ;

BTopleft.Height  := SqareSize ;
BTopRight.Height  := SqareSize ;
BBottomLeft.Height  := SqareSize ;
BBottomRight.Height  := SqareSize ;
BMiddle.Height  := SqareSize ;
   BTopleft.OnMouseDown := ControlMouseDown;
    BTopRight.OnMouseDown := ControlMouseDown;
    BBottomLeft.OnMouseDown := ControlMouseDown;
    BBottomRight.OnMouseDown := ControlMouseDown;
    BMiddle.OnMouseDown := ControlMouseDown;

    BTopleft.OnMouseMove := ContorlMouseMove;
    BTopRight.OnMouseMove := ContorlMouseMove;
    BBottomLeft.OnMouseMove := ContorlMouseMove;
    BBottomRight.OnMouseMove := ContorlMouseMove;
    BMiddle.OnMouseMove := ContorlMouseMove;

    BTopleft.OnMouseUp := ControlMouseUp;
    BTopRight.OnMouseUp := ControlMouseUp;
    BBottomLeft.OnMouseUp := ControlMouseUp;
    BBottomRight.OnMouseUp := ControlMouseUp;
    BMiddle.OnMouseUp := ControlMouseUp;
    aWorkFlowComponent := TWorkFlowComponent.Create(nil) ;
end;

procedure TfmWorkflow.bAddStepClick(Sender: TObject);
var
 aBtn : TPanel ;
 AMemo : TMemo ;
 aEditBtn : TSpeedButton ;
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

   
 aBtn := TPanel.Create(pvisual) ;
 with aBtn  do
   begin
      parent := pvisual ;
      ParentBackground := False ;
      Color := clLtGray ;

      Left := 10 ;
      Top := 10 ;
      tag := Integer(aWorkFlowComponent.Steps.Add);
      TWorkflowStepsItem(Tag).WWORKFLOWSTEPID :=  DMTCCoreLink.GetNewIdStr('GEN_WF_STEP') ;
      TWorkflowStepsItem(Tag).SSTEPNAME := 'step' + IntToStr(TWorkflowStepsItem(Tag).WWORKFLOWSTEPID) ;
      TWorkflowStepsItem(Tag).WSTEPTYPEID := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;


                aEditBtn :=TSpeedButton.Create(aBtn);
                aEditBtn.Parent := aBtn ;
                aEditBtn.Top :=  20 ;
                aEditBtn.left :=  0 ;
                aEditBtn.Width := 10 ;
                aEditBtn.Height := 10 ;
                aEditBtn.Caption := '*+' ;
                aEditBtn.OnClick := bEditStepClick ;
      AMemo := TMemo.Create(aBtn);
       ;
      BorderWidth  := 5 ;
      AMemo.Parent := aBtn ;
      AMemo.Align := alClient ;
      AMemo.ReadOnly := True ;
      if aWorkFlowComponent.Steps.Count = 1 then
         begin
         ParentFont := False ;
         Font.Style := [fsBold] ;
         end;
      AMemo.lines.Text := TWorkflowStepsItem(Tag).SSTEPNAME ;
      
      OnEnter := ControlEnter;
      OnMouseDown := ControlMouseDown;
      OnMouseUp := ControlMouseUp;
      OnMouseMove := ContorlMouseMove ;
      if  dmWorkflowData.ZQWorkflowSTARTSTEP.AsInteger  = 0 then
         begin
          dmWorkflowData.ZQWorkflow.edit ;
          dmWorkflowData.ZQWorkflowSTARTSTEP.AsInteger := TWorkflowStepsItem(Tag).WWORKFLOWSTEPID ;
          dmWorkflowData.ZQWorkflow.Post ;
         end;
   end;
end;


procedure TfmWorkflow.SetMyActiveControl(const Value: TControl);
begin
  FMyActiveControl := Value;
end;

procedure TfmWorkflow.BSavestepClick(Sender: TObject);
 Const FreeGuidsStr = '{3A67E7D9-602F-4B90-BE49-CE0C7D0CFEB8},{2C25245E-A9BA-45EF-97A6-66228F4CB4C4},{6944ED90-9C2C-4DD7-984F-8BD1C9D553A5}' ;
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

   
if not DMTCCoreLink.IsRegistered('{22423B3E-237D-4A70-A47B-D307C1CAC250}') then
   if pos(dmWorkflowData.ZQWorkflowGUID.AsString,FreeGuidsStr) < 1 then
      if not DMTCCoreLink.IsRegistered(dmWorkflowData.ZQWorkflowGUID.AsString) then
          raise exception.Create('Not a registerd component please ask for a trial version http://www.osfshop.com !');

 if (dmWorkflowData.ZQWorkflow.State in [dsedit,dsInsert]) then
 dmWorkflowData.ZQWorkflow.post ;
 dmWorkflowData.SaveComponentToDatabase(aWorkFlowComponent) ;
 PageControl1.ActivePageIndex := 0 ;
end;

procedure TfmWorkflow.FormShow(Sender: TObject);

begin
 DMTCCoreLink.LoadImage(BtnClose.Glyph,'Close');

dmWorkflowData.ZQWorkflow.close ;
dmWorkflowData.ZQWorkflow.SQL.text := 'select * from WORKFLOWTYPES  '  ;
dmWorkflowData.ZQWorkflow.Open ;
dsWorkflow.DataSet := dmWorkflowData.ZQWorkflow ;
dsRights.DataSet :=  dmWorkflowData.ZQRights ;


dmWorkflowData.ZqUsers.close ;
dmWorkflowData.ZqUsers.Open ;
cbUsers.Clear ;
cbUsers.AddItem('All',nil);
while not dmWorkflowData.ZqUsers.Eof do
   begin
     cbUsers.AddItem(dmWorkflowData.ZqUsersSUSERNAME.AsString,TObject(dmWorkflowData.ZqUsersWUSERID.AsInteger));
     dmWorkflowData.ZqUsers.next ;
   end;
  if WhereAmIStep <> 0 then
     begin
       WhereAmIId := StrToIntDef(varToStr( DMTCCoreLink.OpenSqlReturnFirstColumn('select WSTEPTYPEID FROM WORKFLOWSTEPS where WWORKFLOWSTEPID = ' + IntToStr(WhereAmIStep))),0) ;
       if dmWorkflowData.ZQWorkflow.Locate(dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.FieldName,WhereAmIId,[]) then
          begin
             Panel1.Visible := False;
             DBGrid1DblClick(cxGrid1DBBandedTableView1);
          end;
     end;
    BtnClose.Caption := DMTCCoreLink.GetTextLangNoAmp(828);
 if Panel1.Visible then
    begin
    bAddTransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3500);
    lTransName.Caption := DMTCCoreLink.GetTextLangNoAmp(185);
    Lcondition.Caption := DMTCCoreLink.GetTextLangNoAmp(3501);
    lTransFrom.Caption := DMTCCoreLink.GetTextLangNoAmp(2010);
    LTostep.Caption := DMTCCoreLink.GetTextLangNoAmp(1932);
    cxGrid1DBBandedTableView1WWORKFLOWTYPEID.Caption := DMTCCoreLink.GetTextLangNoAmp(1706);
    cxGrid1DBBandedTableView1WGROUPID.Caption := DMTCCoreLink.GetTextLangNoAmp(345);
    cxGrid1DBBandedTableView1SWORFLOWNAME.Caption := DMTCCoreLink.GetTextLangNoAmp(185);
    cxGrid1DBBandedTableView1BDISABLE.Caption := DMTCCoreLink.GetTextLangNoAmp(304);
    aAddStep.Caption := DMTCCoreLink.GetTextLangNoAmp(3488);
    aDelStep.Caption := DMTCCoreLink.GetTextLangNoAmp(3490);
    aEditStep.Caption := DMTCCoreLink.GetTextLangNoAmp(3489);
    aTransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
    BtnRiightsOk.Caption := DMTCCoreLink.GetTextLangNoAmp(828);
    aSaveTodb.Caption := DMTCCoreLink.GetTextLangNoAmp(726);
    aCanceldb.Caption := DMTCCoreLink.GetTextLangNoAmp(168);
    aSaveToFile.Caption := DMTCCoreLink.GetTextLangNoAmp(2217);
    aEditWorkFlow.Caption := DMTCCoreLink.GetTextLangNoAmp(356);
    aWorkflowLoad.Caption := DMTCCoreLink.GetTextLangNoAmp(1014);
    AworkflowSaveToFile.Caption := DMTCCoreLink.GetTextLangNoAmp(903010);
    aWorkFLowRights.Caption := DMTCCoreLink.GetTextLangNoAmp(3487);
    Save.Caption := DMTCCoreLink.GetTextLangNoAmp(726);
    bCancelStep.Caption := DMTCCoreLink.GetTextLangNoAmp(168);
    bSaveTrans.Caption := DMTCCoreLink.GetTextLangNoAmp(726);
    bCancelTrans.Caption := DMTCCoreLink.GetTextLangNoAmp(168);
    BEditTrans.Caption := DMTCCoreLink.GetTextLangNoAmp(356);
    lStepname.Caption := DMTCCoreLink.GetTextLangNoAmp(3497);
    LscreenType.Caption := DMTCCoreLink.GetTextLangNoAmp(3496);
    LUser.Caption := DMTCCoreLink.GetTextLangNoAmp(1072);
     tsStepData.Caption := DMTCCoreLink.GetTextLangNoAmp(3498);
     tsExtras.Caption := DMTCCoreLink.GetTextLangNoAmp(906149);
     tsTransitions.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
     rgMaxDuration.Items[0] := DMTCCoreLink.GetTextLangNoAmp(1057);
     bDeleteTrans.Caption := DMTCCoreLink.GetTextLangNoAmp(24);
     rgMaxDuration.Caption := DMTCCoreLink.GetTextLangNoAmp(3493);
     rgMaxDuration.Items[1] := DMTCCoreLink.GetTextLangNoAmp(2329);
     rgMaxDuration.Items[2] := DMTCCoreLink.GetTextLangNoAmp(2330);
     rgMaxDuration.Items[3] := DMTCCoreLink.GetTextLangNoAmp(2331 );
     rgMaxDuration.Items[4] := DMTCCoreLink.GetTextLangNoAmp(3313);
     rgMaxDuration.Items[5] := DMTCCoreLink.GetTextLangNoAmp(3494);
     lvTrans.Columns[0].Caption := DMTCCoreLink.GetTextLangNoAmp(185);
     lvTrans.Columns[1].Caption := DMTCCoreLink.GetTextLangNoAmp(2010);
     lvTrans.Columns[2].Caption := DMTCCoreLink.GetTextLangNoAmp(1932);
     lvTrans.Columns[3].Caption := DMTCCoreLink.GetTextLangNoAmp(3501);
     Linterval.Caption := DMTCCoreLink.GetTextLangNoAmp(901008);
     lRemark.Caption := DMTCCoreLink.GetTextLangNoAmp(2050);
     lStatusText.Caption := DMTCCoreLink.GetTextLangNoAmp(3495);
    end;
end;

procedure TfmWorkflow.ReadWorkflow(Sender: TObject);
var
 i : Integer ;
 aEditBtn : TSpeedButton ;
 aBtn : TPanel ;
 AMemo,AMemoToFocus : TcxRichEdit ;
 ATextStr ,APlaintext: String ;
begin

aEditBtn := Nil ;
if sender <> Bload then
begin
ClearVisuals;
dmWorkflowData.LoadComponentFromDatabase(aWorkFlowComponent);
end;
  for i := 0 to aWorkFlowComponent.Steps.count -1 do
  begin
     with aWorkFlowComponent.Steps.steps[i] as TWorkflowStepsItem do
       begin
       ATextStr := '' ;
       aBtn :=TPanel.Create(pvisual) ;
         with aBtn do
             begin
                 AMemo := TcxRichEdit.Create(aBtn);
                 AMemo.Properties.ReadOnly := True ;
                 BorderWidth  := 5 ;
                 AMemo.Parent := aBtn ;
                 AMemo.Align := alClient ;
                tag := Integer(aWorkFlowComponent.Steps.steps[i]);
                ParentBackground := False ;
                Color := clLtGray ;
                parent := pvisual ;
                left   :=  WXPOS;
                Top  := WYPOS;
                WIDTH  := WWIDTH;
                HEIGHT  :=  WHEIGHT ;
                if Panel1.Visible then
                begin
                aEditBtn :=TSpeedButton.Create(aBtn);
                aEditBtn.Parent := aBtn ;
                aEditBtn.Top := 20 ;
                aEditBtn.left := 0 ;
                aEditBtn.Width := 10 ;
                aEditBtn.Height := 10 ;
                aEditBtn.Caption := '*+' ;
                aEditBtn.tag := Integer(aBtn);
                aEditBtn.OnClick := bEditStepClick ;
                 AMemo.Lines.Text :=   aWorkFlowComponent.Steps.steps[i].SREMARK  ;
                APlaintext  :=  AMemo.Lines.Text ;

                OnEnter := ControlEnter;
                OnMouseDown := ControlMouseDown;
                OnMouseUp := ControlMouseUp;
                OnMouseMove := ContorlMouseMove ;
                  AMemo.Lines.Text := TWorkflowStepsItem(Tag).SSTEPNAME ;
                end else
                if  not  (aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID = WhereAmIStep) then
                begin
                  ATextStr := '' ;
                  AMemo.Enabled := False ;
                  if WorkflowWorkId <> 0 then
                     begin

                      ATextStr := TDatabaseTableRoutines.OpenSqlReturnAsVarOrString('SELECT first 10 ' + QuotedStr(DMTCCoreLink.GetTextLangNoAmp(238) +  ':') + 'a,a.DDATEACTION, ' + QuotedStr(DMTCCoreLink.GetTextLangNoAmp(1072) +  ':') +
                      'b,b.SUSERNAME from WORKFLOWWORKHIS a left join users b on a.WUSERID = b.WUSERID where a.WWORKFLOWWORKID =  ' + IntToStr(WorkflowWorkId) +' and  a.WWORKFLOWSTEPID =  '+ IntToStr(aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID) + ' order by a.DDATEACTION desc');
                    if ATextStr <> '' then
                       begin
                        Color := clNavy ;
                        Hint := ATextStr + #13+#10 ;
                       end;
                      // WWORKFLOWSTEPID, a.WLINKID, a.DDATEACTION, a.PARAMS
                     end;
                       AMemo.Lines.Text := aWorkFlowComponent.Steps.steps[i].SSTEPNAME ;

                       if ATextStr <> '' then
                         AMemo.Lines.Text := ATextStr + #13+#10 + AMemo.Lines.Text ;

                end else
                begin
                OnDblClick := BtnCloseClick ;
                AMemo.OnDblClick := BtnCloseClick ;
                Color := clGreen ;
                AMemoToFocus  := AMemo ;
                  AMemo.Lines.Text := aWorkFlowComponent.Steps.steps[i].SSTEPNAME ;
                end;

                AMemo.Hint := APlaintext ;
                AMemo.ShowHint := True ;
                aBtn.Hint := AMemo.Hint ;
                aBtn.ShowHint := True ;
                //OnClick := bEditStepClick ;
               // Style := bsWin31 ;
                if dmWorkflowData.ZQWorkflowSTARTSTEP.AsInteger = WWORKFLOWSTEPID then
                  begin
                  // Brush.Color := clGreen ;
                  // Font.Color := clwhite ;
                  if color <> clnavy then
                   Color := clBtnShadow ;
                   ParentFont := False ;
                   //Font.Style := [fsBold] ;
                  end;
             end;
       end;
  end;
if not Panel1.Visible then
if AMemoToFocus <> nil then
  begin

    ScrollBox1.HorzScrollBar.Position := (TPanel(AMemoToFocus.Parent).Left + (TPanel(AMemoToFocus.Parent).Width div 2)) - (self.ClientWidth div 2);
    ScrollBox1.VertScrollBar.Position := TPanel(AMemoToFocus.Parent).top + (TPanel(AMemoToFocus.Parent).Height div 2) - (self.ClientHeight div 2) ;

    AMemoToFocus.SetFocus ;
  end;
pvisual.WorkFlowComponent := aWorkFlowComponent ;
end;

procedure TfmWorkflow.clearVisuals;
var
 i : Integer ;
begin
 pvisual.WorkFlowComponent := nil ;
 MyActiveControl := nil ;
 SetButtons(false);
 aWorkFlowComponent.Steps.Clear ;
 aWorkFlowComponent.transitions.Clear ;
 for i := pvisual.ComponentCount -1 downto 0 do
      pvisual.Components[i].Free ;

end;

procedure TfmWorkflow.PageControl1Change(Sender: TObject);
begin
if PageControl1.ActivePageIndex = 1 then
 begin
 if dmWorkflowData.ZQWorkflow.IsEmpty then
    begin
     PageControl1.ActivePageIndex := 0 ;
     exit ;
    end;
   dmWorkflowData.ZQSteps.close ;
   dmWorkflowData.ZQTransisions.Close ;
   dmWorkflowData.ZQTransisions.Params[0].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   dmWorkflowData.ZQTransisions.Params[1].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   dmWorkflowData.ZQSteps.Params[0].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   ReadWorkflow(self);
  end;
end;

procedure TfmWorkflow.BDeletNodeClick(Sender: TObject);
var
 LocalControl : TControl ;
 i : Integer ;
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

 if (MyActiveControl <> nil) then
   begin
     LocalControl := MyActiveControl ;
     MyActiveControl := nil ;
     TWorkflowStepsItem(LocalControl.Tag).Delete := True ;
     for i := 0 to aWorkFlowComponent.transitions.Count -1 do
       if   (aWorkFlowComponent.transitions.transitions[i].WFROMWORKFLOWSTEPID =  TWorkflowStepsItem(LocalControl.Tag).WWORKFLOWSTEPID)
          or (aWorkFlowComponent.transitions.transitions[i].WTOWORKFLOWSTEPID =  TWorkflowStepsItem(LocalControl.Tag).WWORKFLOWSTEPID) then
           aWorkFlowComponent.transitions.transitions[i].Delete := True;

     LocalControl.free ;
   end;
   pvisual.Repaint ;  
end;

{ TWorkFlowPanel }

constructor TWorkFlowPanel.Create(AOwner: TComponent);
 
begin
  inherited;
  DoubleBuffered := False  ;
  ParentBackground := False ;

  ABitmap := TBitmap.Create ;

  ABitmap.Width := 2000 ;
  ABitmap.Height := 2000 ;
  ABitmap.PixelFormat := pf24bit ;



end;

destructor TWorkFlowPanel.Destroy;
begin
  ABitmap.Free ;
  inherited;
end;


PROCEDURE DrawArrow(CONST Canvas:  TCanvas;
                      CONST x1,y1, x2,y2:  INTEGER;
                      CONST HeadLength:  INTEGER;
                      CONST HeadFill:  BOOLEAN;
                      CONST color:  TColor;bAltDraw : Boolean );
    VAR
      Triangle        :  ARRAY[0..2] OF TPoint;
      xbase           :  INTEGER;
      xLineDelta      :  INTEGER;
      xLineUnitDelta  :  Double;
      xMiddle         :  INTEGER;
      xNormalDelta    :  INTEGER;
      xNormalUnitDelta:  Double;
      ybase           :  INTEGER;
      yLineDelta      :  INTEGER;
      yLineUnitDelta  :  Double;
      yMiddle         :  INTEGER;
      yNormalDelta    :  INTEGER;
      yNormalUnitDelta:  Double;

  BEGIN
    Canvas.Pen.Color := color;
    Canvas.Brush.Style := bsSolid;

    Canvas.MoveTo(x1,y1);
    if bAltDraw then
    begin
    Canvas.LineTo(x1,y1 + ((y2-y1)div 2));
 //   Canvas.LineTo(x2,y1 + ((y2-y1)div 2));
    Canvas.LineTo(x2,y2);
    xLineDelta := x2 - x1 ;
    yLineDelta := y2 - y1 + ((y2-y1)div 2) ;

    end else
    begin
      Canvas.LineTo(x2,y2);
      xLineDelta := x2 - x1 ;
      yLineDelta := y2 - y1 ;
    end;

    xLineUnitDelta := xLineDelta / SQRT( SQR(xLineDelta) + SQR(yLineDelta) );
    yLineUnitDelta := yLineDelta / SQRt( SQR(xLineDelta) + SQR(yLineDelta) );

    // (xBase,yBase) is where arrow line is perpendicular to base of triangle.
    xBase := x2 - ROUND(HeadLength * xLineUnitDelta);
    yBase := y2 - ROUND(HeadLength * yLineUnitDelta);

    xNormalDelta :=  yLineDelta;
    yNormalDelta := -xLineDelta;
    xNormalUnitDelta := xNormalDelta / SQRT( SQR(xNormalDelta) + SQR(yNormalDelta) );
    yNormalUnitDelta := yNormalDelta / SQRt( SQR(xNormalDelta) + SQR(yNormalDelta) );


    Triangle[0] := Point(x2,y2);
    Triangle[1] := Point(xBase + ROUND(HeadLength*xNormalUnitDelta),
                         yBase + ROUND(HeadLength*yNormalUnitDelta));
    Triangle[2] := Point(xBase - ROUND(HeadLength*xNormalUnitDelta),
                          yBase - ROUND(HeadLength*yNormalUnitDelta));

    // Draw the arrow tip
    Canvas.Polygon(Triangle);

    // Floodfill from "middle" of triangle head
    IF   HeadFill
    THEN BEGIN
      xMiddle := (Triangle[0].x + Triangle[1].x + Triangle[2].x) DIV 3;
      yMiddle := (Triangle[0].y + Triangle[1].y + Triangle[2].y) DIV 3;
      Canvas.Brush.Color := color;  // Canvas.Pixels[xMiddle, yMiddle];
      Canvas.FloodFill(xMiddle,yMiddle,
         color,
         fsBorder);
    END

  END {DrawArrow};

procedure TWorkFlowPanel.Paint;
var
i,XFrom,Xto,counter ,YFrom,Yto,XMiddle,YMiddle  : Integer ;
AFromStep,AToStep : TWorkflowStepsItem ;
LocalBitmap : TBitmap ;
AFromDirection,AToDirection :   TwfDirection    ;
procedure GetStepXY(var lx,ly : Integer; lStep :TWorkflowStepsItem; lDirection :   TwfDirection);
begin
  case lDirection of
    wfdNorth : begin
                 lx := lStep.WXPOS + (lStep.WWIDTH div 2)  ;
                 ly := lStep.WYPOS ;
               end;
    wfdNorthEast : begin
                 lx := lStep.WXPOS + (lStep.WWIDTH )  ;
                 ly := lStep.WYPOS ;
               end;
    wfdEast : begin
                 lx := lStep.WXPOS + (lStep.WWIDTH )  ;
                 ly := lStep.WYPOS +(lStep.WHEIGHT div 2) ;
               end;
    wfdEastSouth : begin
                 lx := lStep.WXPOS + (lStep.WWIDTH )  ;
                 ly := lStep.WYPOS +(lStep.WHEIGHT );
               end;
    wfdSouth : begin
                 lx := lStep.WXPOS + (lStep.WWIDTH div 2)  ;
                 ly := lStep.WYPOS +(lStep.WHEIGHT ) ;
               end;
    wfdSouthWest : begin
                 lx := lStep.WXPOS    ;
                 ly := lStep.WYPOS +(lStep.WHEIGHT )  ;
               end;
    wfdWest : begin
                 lx := lStep.WXPOS    ;
                 ly := lStep.WYPOS +(lStep.WHEIGHT div 2);
               end;
    wfdWestNorth : begin
                 lx := lStep.WXPOS  ;
                 ly := lStep.WYPOS ;
               end;
   end;

  counter := 0 ;
  while (counter < 10) and(LocalBitmap.Canvas.Pixels[lx   ,ly] = clblack) do
                 begin
                  case  lDirection of
                  wfdNorth   :  inc( lx,10);
                  wfdNorthEast : begin
                                dec( lx,10);

                               end;
                  wfdEast  : inc( ly,10);
                  wfdEastSouth  : begin
                                dec( lx,10);

                               end;
                  wfdSouth   : dec( lx,10);
                  wfdSouthWest  : begin

                                inc( lx,10);
                               end;
                  wfdWest   : dec( lx,10);
                  wfdWestNorth  : begin
                                inc( lx,10);
                                
                               end;
                    end ;
                 inc(counter);
                 end;

end;
procedure HandelFromToStep(ATransname : String;AColor :TColor) ;
var
  APaintColor : TColor ;
begin
        if (AFromStep <> nil) and (AToStep <> nil) then
          begin
             XFrom := AFromStep.WXPOS + (AFromStep.WWIDTH div 2);
             Xto := AToStep.WXPOS + (AToStep.WWIDTH div 2);
             YFrom := AFromStep.WYPOS + (AFromStep.WHEIGHT div 2);
             Yto   := AToStep.WYPOS  + (AToStep.WHEIGHT div 2);



             if (XFrom = XTo)   and (YFrom > Yto) then
                begin
                 AToDirection := wfdSouth ;
                 AFromDirection := wfdNorth ;
                end  else   if (XFrom < XTo)   and (YFrom < Yto) then
              begin
                AFromDirection := wfdEastSouth ;
                AToDirection := wfdWestNorth ;
              end else if (XFrom = XTo)   and (YFrom < Yto) then
                begin
                 AToDirection := wfdNorth ;
                 AFromDirection := wfdSouth ;
                end
             else if (XFrom > XTo)   and (YFrom > Yto) then
                 begin
                AFromDirection := wfdWestNorth ;
                AToDirection := wfdEastSouth ;
                end    else if (XFrom > XTo)   and (YFrom < Yto) then
                 begin
                AFromDirection := wfdSouthWest ;
                AToDirection := wfdNorthEast ;
                end   else if (XFrom < XTo)   and (YFrom > Yto) then
                 begin
                 AToDirection :=  wfdSouthWest;
                 AFromDirection :=wfdNorthEast  ;

                end
                 else if (XFrom < XTo)   and (YFrom = Yto) then
                  begin
                    AFromDirection := wfdEast ;
                    AToDirection := wfdWest ;
                  end else if (XFrom < XTo)   and (YFrom = Yto) then
                  begin
                    AFromDirection := wfdWest ;
                    AToDirection := wfdEast ;
                  end ;

               if (XFrom < XTo)  and (YFrom > Yto) and ((AFromStep.WXPOS + AFromStep.WWIDTH) > AToStep.WXPOS ) then
                  begin
                    AFromDirection :=wfdNorth  ;
                    AToDirection :=  wfdSouth;
                  end else
               if (XFrom > XTo)  and (YFrom > Yto) and ((AToStep.WXPOS + AToStep.WWIDTH) > AFromStep.WXPOS ) then
                  begin
                    AFromDirection :=  wfdNorth;
                    AToDirection := wfdSouth ;
                  end else
               if (XFrom < XTo)  and (YFrom < Yto) and ((AFromStep.WXPOS + AFromStep.WWIDTH) > AToStep.WXPOS ) then
                  begin
                    AFromDirection :=wfdSouth  ;
                    AToDirection := wfdNorth ;
                  end else
               if (XFrom > XTo)  and (YFrom < Yto) and ((AToStep.WXPOS + AToStep.WWIDTH) > AFromStep.WXPOS ) then
                  begin
                    AFromDirection := wfdSouth ;
                    AToDirection := wfdNorth ;
                  end else     // horizntal
                     if (XFrom < XTo)  and (YFrom > Yto) and ((AToStep.WYPOS + AToStep.WHEIGHT) > AFromStep.WYPOS ) then
                  begin
                    AFromDirection :=wfdEast  ;
                    AToDirection :=  wfdWest;
                  end else
               if (XFrom > XTo)  and (YFrom > Yto) and ((AToStep.WYPOS + AToStep.WHEIGHT) > AFromStep.WYPOS ) then
                  begin
                    AFromDirection := wfdWest   ;
                    AToDirection := wfdEast ;
                  end else
                  if (XFrom < XTo)  and (YFrom < Yto) and ((AFromStep.WYPOS + AFromStep.WHEIGHT) > AToStep.WYPOS ) then
                  begin
                    AFromDirection :=wfdEast  ;
                    AToDirection :=  wfdWest;
                  end else
               if (XFrom > XTo)  and (YFrom < Yto) and ((AFromStep.WYPOS + AFromStep.WHEIGHT) > AToStep.WYPOS ) then
                  begin
                    AFromDirection := wfdWest   ;
                    AToDirection := wfdEast ;
                  end  ;

               GetStepXY(XFrom,YFrom,AFromStep,AFromDirection);
               GetStepXY(XTo,Yto,AToStep,AToDirection);
          end else
          if (AFromStep <> nil) then
          begin
             XFrom := AFromStep.WXPOS + AFromStep.WWIDTH  ;
             Xto := AFromStep.WXPOS + AFromStep.WWIDTH + 40 ;
             YFrom := AFromStep.WYPOS ;
             Yto   := AFromStep.WYPOS ;
             AToDirection := wfdNorthEast ;
          end else
          if (AToStep <> nil) then
            begin
             XFrom := AToStep.WXPOS    ;
             Xto := AToStep.WXPOS   - 40 ;
             YFrom := AToStep.WYPOS ;
             Yto   := AToStep.WYPOS ;
             AToDirection := wfdWestNorth ;
            end;
        if XFrom <> -100 then
          begin



            if (AFromStep <> nil) and(AToStep <> nil) then
              APaintColor :=   clBlack
             else
             if (AFromStep <> nil) and(AToStep = nil) then
              APaintColor :=  clRed
                   else
              APaintColor := clBlue ;
             if AColor <> 0 then
             APaintColor := AColor ;
             if ATransname <> 'X' then
             begin
             XFrom := XFrom + FWorkFlowComponent.transitions.transitions[i].WLEFTMARK ;
             YFrom := YFrom + FWorkFlowComponent.transitions.transitions[i].WTOPMARK ;
             Xto := Xto + FWorkFlowComponent.transitions.transitions[i].WLEFTENDMARK ;
             Yto := Yto + FWorkFlowComponent.transitions.transitions[i].WTOPENDMARK ;
             end;

             if (AFromStep <> nil) and(AToStep <> nil) then
             DrawArrow(LocalBitmap.Canvas,XFrom   ,YFrom,Xto ,YTo,5,True,APaintColor,copy(ATransname,1,1)=' ')
             else
             if (AFromStep <> nil) and(AToStep = nil) then
             DrawArrow(LocalBitmap.Canvas,XFrom   ,YFrom,Xto ,YTo,5,True,APaintColor,copy(ATransname,1,1)=' ')
             else
             DrawArrow(LocalBitmap.Canvas,XFrom   ,YFrom,Xto ,YTo,5,True,APaintColor,copy(ATransname,1,1)=' ');



             if XFrom < Xto then
                begin
                 XMiddle := (XFrom + ((Xto - XFrom) div 2)) ;

                 end  else
                 begin
                 XMiddle := (Xto + ((XFrom - Xto ) div 2)) ;

                 end;
                XMiddle :=  XMiddle - (LocalBitmap.Canvas.TextWidth(ATransname) div 2);
               if YFrom < Yto then
                begin
                 YMiddle := (YFrom + ((Yto - YFrom) div 2)) ;

                 end  else
                 begin
                 YMiddle := (Yto + ((YFrom - Yto ) div 2)) ;

                 end;

              LocalBitmap.Canvas.Brush.Color := clWhite ;
              LocalBitmap.Canvas.Brush.Style := bsClear ;
              LocalBitmap.Canvas.TextOut(XMiddle,YMiddle,ATransname);
          end;
end;
  var
   OldFont :  TFont ;
begin
  inherited;
  OldFont :=  TFont.Create ;
  try
  OldFont.Assign( self.Canvas.Font);
 

  if not Assigned(FWorkFlowComponent) then exit ;
   LocalBitmap := ABitmap ;
   LocalBitmap.Canvas.Brush.Color := clWhite ;
    LocalBitmap.Canvas.FillRect(Rect(0,0,LocalBitmap.Width,LocalBitmap.Height));
    LocalBitmap.Canvas.Brush.Color := clBlack ;


    for i := 0 to FWorkFlowComponent.transitions.Count -1 do
     if not FWorkFlowComponent.transitions.transitions[i].Delete then
      begin
       Xfrom := -100 ;
       AFromStep := FWorkFlowComponent.Steps.GetStepOnId(FWorkFlowComponent.transitions.transitions[i].WFROMWORKFLOWSTEPID);
       AToStep   := FWorkFlowComponent.Steps.GetStepOnId(FWorkFlowComponent.transitions.transitions[i].WTOWORKFLOWSTEPID);
        HandelFromToStep(FWorkFlowComponent.transitions.transitions[i].STRANSNAME,0) ;
      end;

    AFromStep := MakeFromTrans ;
    AToStep   := MakeToTrans ;
    if AFromStep <> nil then
           HandelFromToStep('X',clDkGray) ;
    self.Canvas.Draw(0,0,LocalBitmap);
    finally
      self.Canvas.Font.Assign(OldFont);
      OldFont.Free ; 
    end;
end;

procedure TWorkFlowPanel.SetWorkFlowComponent(
  const Value: TWorkFlowComponent);
begin
  MakeFromTrans := nil ;
  MakeToTrans := nil ;
  FWorkFlowComponent := Value;
  if FWorkFlowComponent <> nil then
    Paint ;
end;

procedure TfmWorkflow.bEditStepClick(Sender: TObject);
var
 i :  Integer ;
 Alistviewitem : TListItem ;
 Astringstream : TStringStream ;
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

   if (sender is TSpeedButton) then
       begin
         MyActiveControl := TCOntrol((sender as TSpeedButton).Tag) ;
         SetButtons(True);
       end;


if Assigned(MyActiveControl) then
   begin



      PageControl1.ActivePageIndex := 2 ;

      rgMaxDuration.ItemIndex  := TWorkflowStepsItem(MyActiveControl.tag).WDURATIONTYPE ;
      EDurationinterval.Text := IntToStr( TWorkflowStepsItem(MyActiveControl.tag).WDURATIONINTERVAL) ;
      Estatusname.Text := IntToStr( TWorkflowStepsItem(MyActiveControl.tag).WSTATUSID) ;
      Estepname.Text := TWorkflowStepsItem(MyActiveControl.tag).SSTEPNAME ;
      Mparams.Text :=  TWorkflowStepsItem(MyActiveControl.tag).SPARAMS ;
      Astringstream := TStringStream.Create(TWorkflowStepsItem(MyActiveControl.tag).SREMARK) ;
       try
        Astringstream.Position := 0 ;
      MRemark.lines.LoadFromStream(Astringstream);
       finally
          Astringstream.Free ;
       end;
      mSqlstep.Text :=  TWorkflowStepsItem(MyActiveControl.tag).SSQLSTEP;
      MsqlStepback.Text :=  TWorkflowStepsItem(MyActiveControl.tag).SSQLBACK;
      mStatusText.Text:=    TWorkflowStepsItem(MyActiveControl.tag).STATUSTEXT;
      cbUsers.ItemIndex := cbUsers.Items.IndexOfObject(Tobject( TWorkflowStepsItem(MyActiveControl.tag).WUSERID)) ;

      cbSetupTypes.ItemIndex :=  cbSetupTypes.Items.IndexOf(Mparams.Lines.Values['TYPE']);
      cbSetupTypesChange(nil);
      lvTrans.Items.Clear ;
      for i := 0 to aWorkFlowComponent.transitions.Count -1 do
         begin
         Alistviewitem := nil ;
           if aWorkFlowComponent.transitions.transitions[i].WFROMWORKFLOWSTEPID = TWorkflowStepsItem(MyActiveControl.tag).WWORKFLOWSTEPID then
            if not aWorkFlowComponent.transitions.transitions[i].Delete then
             begin
             Alistviewitem := lvTrans.Items.Add ;
             Alistviewitem.Data :=aWorkFlowComponent.transitions.transitions[i] ;
             end;
           if aWorkFlowComponent.transitions.transitions[i].WTOWORKFLOWSTEPID = TWorkflowStepsItem(MyActiveControl.tag).WWORKFLOWSTEPID then
            if not aWorkFlowComponent.transitions.transitions[i].Delete then
             begin
             Alistviewitem :=   lvTrans.Items.Add ;
             Alistviewitem.Data :=aWorkFlowComponent.transitions.transitions[i] ;
             end;
            if Alistviewitem <> nil then
               begin
                  Alistviewitem.Caption := TWorkFlowTransitionItem(Alistviewitem.Data).STRANSNAME ;
                  Alistviewitem.SubItems.Add(aWorkFlowComponent.Steps.GetStepName(TWorkFlowTransitionItem(Alistviewitem.Data).WFROMWORKFLOWSTEPID)) ;
                  Alistviewitem.SubItems.Add(aWorkFlowComponent.Steps.GetStepName(TWorkFlowTransitionItem(Alistviewitem.Data).WTOWORKFLOWSTEPID)) ;
                  Alistviewitem.SubItems.Add(TWorkFlowTransitionItem(Alistviewitem.Data).SCONDITION) ;
               end;
         end;
   end;
end;

procedure TfmWorkflow.SaveClick(Sender: TObject);
var
 i : Integer ;
 AStream : TStringStream ;
begin
if Assigned(MyActiveControl) then
   begin
    TWorkflowStepsItem(MyActiveControl.tag).WDURATIONTYPE  :=   rgMaxDuration.ItemIndex  ;

       if (mStatusText.Text ='') or(mStatusText.Text = 'select ' + QuotedStr(TWorkflowStepsItem(MyActiveControl.tag).SSTEPNAME) +' from rdb$database') then
            mStatusText.Text := 'select ' + QuotedStr(Estepname.Text) +' from rdb$database' ;

    TWorkflowStepsItem(MyActiveControl.tag).WDURATIONINTERVAL  := StrToIntDef( EDurationinterval.Text,0 ) ;
    TWorkflowStepsItem(MyActiveControl.tag).WSTATUSID  := StrToIntDef( Estatusname.Text,0 ) ;
    TWorkflowStepsItem(MyActiveControl.tag).SSTEPNAME :=  Estepname.Text  ;
    TWorkflowStepsItem(MyActiveControl.tag).SPARAMS :=   Mparams.Text ;

       AStream := TStringStream.Create('');
       try
         MRemark.Lines.SaveToStream(AStream);
      TWorkflowStepsItem(MyActiveControl.tag).SREMARK :=  AStream.DataString ;
       finally
        AStream.free ;
       end;
  
    TWorkflowStepsItem(MyActiveControl.tag).SSQLSTEP :=   mSqlstep.Text ;
    TWorkflowStepsItem(MyActiveControl.tag).SSQLBACK :=   MsqlStepback.Text ;




    TWorkflowStepsItem(MyActiveControl.tag).STATUSTEXT :=   mStatusText.Text ;
    if cbUsers.ItemIndex  > -1 then
    TWorkflowStepsItem(MyActiveControl.tag).WUSERID :=   Integer(cbUsers.Items.Objects[cbUsers.ItemIndex]) ;
    for i := 0 to TPanel(MyActiveControl).ComponentCount -1 do
      if TPanel(MyActiveControl).Components[i] is Tmemo then
    Tmemo(TPanel(MyActiveControl).Components[i]).Lines.Text := Estepname.Text ;
    TPanel(MyActiveControl).Hint := MRemark.Text ;
    TPanel(MyActiveControl).ShowHint := True ;

   end;
  PageControl1.ActivePageIndex := 1 ;
  lvTrans.Clear ;
end;

procedure TfmWorkflow.lvTransEdited(Sender: TObject; Item: TListItem;
  var S: String);
begin
 if Item.Data <> nil then
    TWorkFlowTransitionItem(Item.Data).STRANSNAME := s ;
end;

procedure TfmWorkflow.bAddTransitionClick(Sender: TObject);
var
 i :  Integer ;
 Alistviewitem : TListItem ;
begin
if Assigned(MyActiveControl) then
   begin

      with aWorkFlowComponent.transitions.Add as TWorkFlowTransitionItem do
         begin
             Alistviewitem :=   lvTrans.Items.Add ;
             Alistviewitem.Data :=aWorkFlowComponent.transitions.transitions[ aWorkFlowComponent.transitions.count-1] ;
             TWorkFlowTransitionItem(Alistviewitem.Data).WWORKFLOWTRANSID := DMTCCoreLink.GetNewIdStr('GEN_WF_TRANS');
             TWorkFlowTransitionItem(Alistviewitem.Data).WFROMWORKFLOWSTEPID := TWorkflowStepsItem(MyActiveControl.tag).WWORKFLOWSTEPID ;
             Alistviewitem.Caption := TWorkFlowTransitionItem(Alistviewitem.Data).STRANSNAME ;
             Alistviewitem.SubItems.Add(IntTostr(TWorkFlowTransitionItem(Alistviewitem.Data).WFROMWORKFLOWSTEPID)) ;
             Alistviewitem.SubItems.Add(IntTostr(TWorkFlowTransitionItem(Alistviewitem.Data).WTOWORKFLOWSTEPID)) ;
             Alistviewitem.SubItems.Add(TWorkFlowTransitionItem(Alistviewitem.Data).SCONDITION) ;
             Alistviewitem.Selected := True ;
         end;
   end;
end;
procedure TfmWorkflow.DBGrid1DblClick(Sender: TObject);
begin
 if (dmWorkflowData.ZQWorkflow.State in [dsedit,dsInsert]) then
 dmWorkflowData.ZQWorkflow.post ;
  if dmWorkflowData.ZQWorkflow.IsEmpty then exit ;
  PageControl1.ActivePageIndex := 1 ;
  PageControl1Change(self);
end;

procedure TfmWorkflow.Bcancelts1Click(Sender: TObject);
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

 if (dmWorkflowData.ZQWorkflow.State in [dsInsert]) then
 dmWorkflowData.ZQWorkflow.Cancel ;
PageControl1.ActivePageIndex := 0 ;
end;

procedure TfmWorkflow.bCancelStepClick(Sender: TObject);
begin
lvTrans.Clear ;
PageControl1.ActivePageIndex := 1 ;
end;

procedure TfmWorkflow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if not (PageControl1.ActivePageIndex = 0) then
  if Panel1.Visible then
    begin
       CanClose := False ;
       if PageControl1.ActivePage = TabSheet8 then
         PageControl1.ActivePage := TabSheet1 
        else
       OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(3499),mtError,[mbok],0);
    end;
end;

procedure TfmWorkflow.bDeleteTransClick(Sender: TObject);
var
 ATrans : TWorkFlowTransitionItem ;
begin
  if (lvTrans.Selected <> nil)  and (lvTrans.Selected.Data <> nil) then
      begin
        ATrans  := TWorkFlowTransitionItem(lvTrans.Selected.Data) ;
        lvTrans.DeleteSelected ;
       ATrans.delete := True ;
     end;
end;

procedure TfmWorkflow.cbSetupTypesChange(Sender: TObject);
var
 i : Integer ;
begin
if cbSetupTypes.ItemIndex <> -1 then
  begin
    mDescription.Text := TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Description ;
    if  Sender = nil then exit ;
    for i :=0 to TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Inparams.Count -1 do
     begin
        Mparams.Lines.Values['TYPE'] := TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Displayname ;
        if Mparams.Lines.Values[TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Inparams[i].Name] = '' then
         if Mparams.Lines.IndexOf(TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Inparams[i].Name+'=') = -1 then
           Mparams.Lines.Add(TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Inparams[i].Name+'='+VarToStr(TWorkFlowImplementBase(cbSetupTypes.items.Objects[cbSetupTypes.ItemIndex]).Inparams[i].Value));
     end;
  end;
end;

procedure TfmWorkflow.BtnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfmWorkflow.lvTransDblClick(Sender: TObject);
begin
FCurrentTrans := nil ;

if (lvTrans.Selected <> nil) and (lvTrans.Selected.Data <> nil ) then
  FCurrentTrans := TWorkFlowTransitionItem(lvTrans.Selected.Data) ;
  if FCurrentTrans <> nil then
  begin
  ComesFrom := 2 ;
  PageControl1.ActivePageIndex := 3 ;
  InitTranspage ;
  end;
end;

procedure TfmWorkflow.InitTranspage;
var
 I : Integer ;
begin
  if Assigned(FCurrentTrans) then
     begin
     Label20.Caption :=  lStepname.Caption + ' : ' + Estepname.Text ;

      trFromstep.Items.Clear ;
      trToStep.Items.Clear ;
      for i := 0 to aWorkFlowComponent.Steps.Count -1 do
         begin
           if not  TWorkflowStepsItem(MyActiveControl.tag).Delete then
             begin
               trFromstep.Items.AddObject(aWorkFlowComponent.Steps.steps[i].SSTEPNAME,TObject(aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID));
               trToStep.Items.AddObject(aWorkFlowComponent.Steps.steps[i].SSTEPNAME,TObject(aWorkFlowComponent.Steps.steps[i].WWORKFLOWSTEPID))  ;
             end;
         end;
       trname.Text := FCurrentTrans.STRANSNAME ;
       trParams.Text := FCurrentTrans.SCONDITION ;
       EoffsetLeft.Text := IntToStr(FCurrentTrans.WLEFTMARK);
       EoffsetTop.Text := IntToStr(FCurrentTrans.WTOPMARK);
       EoffsetLeftend.Text := IntToStr(FCurrentTrans.WLEFTENDMARK);
       EoffsetTopEnd.Text := IntToStr(FCurrentTrans.WTOPENDMARK);


       trFromstep.ItemIndex := trFromstep.Items.IndexOfObject(TObject(FCurrentTrans.WFROMWORKFLOWSTEPID));
       trToStep.ItemIndex := trFromstep.Items.IndexOfObject(TObject(FCurrentTrans.WTOWORKFLOWSTEPID));
      PageControl1.ActivePageIndex := 3 ;
     end;
end;

procedure TfmWorkflow.bSaveTransClick(Sender: TObject);
var
 i :  Integer ;
 Alistviewitem : TListItem ;
begin
 FCurrentTrans.STRANSNAME := trname.Text ;
 FCurrentTrans.SCONDITION  :=trParams.Text ;
 FCurrentTrans.WLEFTMARK := StrToIntDef(EoffsetLeft.Text,0);
 FCurrentTrans.WTOPMARK := StrToIntDef(EoffsetTop.Text,0);
 FCurrentTrans.WLEFTENDMARK := StrToIntDef(EoffsetLeftend.Text,0);
 FCurrentTrans.WTOPENDMARK := StrToIntDef(EoffsetTopEnd.Text,0);

 if trFromstep.ItemIndex <> -1 then
 FCurrentTrans.WFROMWORKFLOWSTEPID := Integer(trFromstep.Items.Objects[trFromstep.ItemIndex]);
 if trToStep.ItemIndex <> -1 then
 FCurrentTrans.WTOWORKFLOWSTEPID := Integer(trToStep.Items.Objects[trToStep.ItemIndex]);

   PageControl1.ActivePageIndex := ComesFrom ;
   if ComesFrom = 2 then
      begin
        lvTrans.Items.Clear ;
      for i := 0 to aWorkFlowComponent.transitions.Count -1 do
         begin
         Alistviewitem := nil ;
           if aWorkFlowComponent.transitions.transitions[i].WFROMWORKFLOWSTEPID = TWorkflowStepsItem(MyActiveControl.tag).WWORKFLOWSTEPID then
             begin
             Alistviewitem := lvTrans.Items.Add ;
             Alistviewitem.Data :=aWorkFlowComponent.transitions.transitions[i] ;
             end;
           if aWorkFlowComponent.transitions.transitions[i].WTOWORKFLOWSTEPID = TWorkflowStepsItem(MyActiveControl.tag).WWORKFLOWSTEPID then
             begin
             Alistviewitem :=   lvTrans.Items.Add ;
             Alistviewitem.Data :=aWorkFlowComponent.transitions.transitions[i] ;
             end;
            if Alistviewitem <> nil then
               begin
                  Alistviewitem.Caption := TWorkFlowTransitionItem(Alistviewitem.Data).STRANSNAME ;
                  Alistviewitem.SubItems.Add(aWorkFlowComponent.Steps.GetStepName(TWorkFlowTransitionItem(Alistviewitem.Data).WFROMWORKFLOWSTEPID)) ;
                  Alistviewitem.SubItems.Add(aWorkFlowComponent.Steps.GetStepName(TWorkFlowTransitionItem(Alistviewitem.Data).WTOWORKFLOWSTEPID)) ;
                  Alistviewitem.SubItems.Add(TWorkFlowTransitionItem(Alistviewitem.Data).SCONDITION) ;
               end;
         end;
      end;
end;

procedure TfmWorkflow.bCancelTransClick(Sender: TObject);
begin
   PageControl1.ActivePageIndex := ComesFrom ;
end;

procedure TfmWorkflow.cbToTypeDropDown(Sender: TObject);
var
 i :  Integer ;
 aQuery : TUniQuery;
begin
 cbToType.items.Clear ;
 aQuery := TUniQuery.create(nil);
 try
  aQuery.Connection := DMTCCoreLink.TheZConnection ;
  aQuery.sql.text := 'select WWORKFLOWTYPEID,SWORFLOWNAME from  WORKFLOWTYPES where (BDISABLE = 0 or BDISABLE is null)' ;
  aQuery.open ;
  while not aQuery.eof do
     begin
       cbToType.items.AddObject(aQuery.fieldByName('SWORFLOWNAME').asstring,Tobject(aQuery.fieldByName('WWORKFLOWTYPEID').AsInteger));
       aQuery.next ;
     end;


 finally
   aQuery.free ;
 end;
end;

procedure TfmWorkflow.cbToTypeChange(Sender: TObject);
var
 i :  Integer ;
 aQuery : TUniQuery;
begin
 cbToType.items.Clear ;
 aQuery := TUniQuery.create(nil);
 try
  aQuery.Connection := DMTCCoreLink.TheZConnection ;
  aQuery.sql.text := 'select WWORKFLOWSTEPID,SSTEPNAME from  WORKFLOWSTEPS where WSTEPTYPEID=:WSTEPTYPEID' ;
  aQuery.params[0].AsInteger := 0 ;
  if cbToType.ItemIndex <> -1 then
    aQuery.params[0].AsInteger := Integer(cbToType.Items.objects[cbToType.ItemIndex]);

  aQuery.open ;
  while not aQuery.eof do
     begin
       trToStep.items.AddObject(aQuery.fieldByName('SSTEPNAME').asstring,Tobject(aQuery.fieldByName('WWORKFLOWSTEPID').AsInteger));
       aQuery.next ;
     end;


 finally
   aQuery.free ;
 end;
end;

procedure TfmWorkflow.BsaveClick(Sender: TObject);
begin
 if (dmWorkflowData.ZQWorkflow.State in [dsedit,dsInsert]) then
 dmWorkflowData.ZQWorkflow.post ;
  if dmWorkflowData.ZQWorkflow.IsEmpty then exit ;
 if not SaveDialog1.Execute then exit ;

   dmWorkflowData.ZQSteps.close ;
   dmWorkflowData.ZQTransisions.Close ;
   dmWorkflowData.ZQTransisions.Params[0].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   dmWorkflowData.ZQTransisions.Params[1].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   dmWorkflowData.ZQSteps.Params[0].AsInteger := dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
   ReadWorkflow(self);
   dmWorkflowData.SaveComponent(SaveDialog1.FileName,aWorkFlowComponent);
end;

procedure TfmWorkflow.BLoadClick(Sender: TObject);
var
 i : Integer ;
begin
  if (dmWorkflowData.ZQWorkflow.State in [dsedit,dsInsert]) then
 dmWorkflowData.ZQWorkflow.post ;
 if not OpenDialog1.Execute then exit ;

 pvisual.WorkFlowComponent := nil ;
 MyActiveControl := nil ;
 SetButtons(false);
 for i := pvisual.ComponentCount -1 downto 0 do
      pvisual.Components[i].Free ;


 dmWorkflowData.LoadComponent(OpenDialog1.FileName,aWorkFlowComponent);


 PageControl1.ActivePageIndex := 1 ;
 ReadWorkflow(BLoad) ;
end;

procedure TfmWorkflow.BrightsClick(Sender: TObject);
begin
  dmWorkflowData.ZqUsers.Open ;
  dmWorkflowData.ZQRights.close ;
  dmWorkflowData.ZQRights.Params[0].AsInteger :=  dmWorkflowData.ZQWorkflowWWORKFLOWTYPEID.AsInteger ;
  dmWorkflowData.ZQRights.Open ;
  PageControl1.ActivePage := TabSheet8 ;
end;

procedure TfmWorkflow.BtnRiightsOkClick(Sender: TObject);
begin
 if (dmWorkflowData.ZQRights.State in [dsEdit,Dsinsert]) then
   dmWorkflowData.ZQRights.post ;
 PageControl1.ActivePageIndex := 0 ;
end;

procedure TfmWorkflow.MparamsClick(Sender: TObject);
begin
  EParamname.text :=  Mparams.Lines.Names[Mparams.CaretPos.Y];
end;

procedure TfmWorkflow.BitBtn3Click(Sender: TObject);
var
 i : Integer ;
 aOwner,Bowner :Tcomponent;
 AForm : TForm ;
 AWorkflowitem : TWorkFlowImplementBase ;
begin
if Eparamname.Text = 'BATCHID' then
    begin
      with TGenSearch.Create(self) do
         begin
            AutoFieldCols := True ;
            Init('');
            aSearchPanel.DefSql := 'Select * from battypes order by SDescription'  ;
            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'SDESCRIPTION' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 10 ;
                  WColumnTranslation := 1708 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
               end;
            aSearchPanel.BuildGui ;
            ForceSearch := True ;
            if ShowModal = mrok then
              if not ZQGenSearch.IsEmpty then
                begin
                   Mparams.Lines.Values[Eparamname.Text] := ZQGenSearch.Fields[0].AsString ;
                end;
             free ;
         end;
    end else
 if Eparamname.Text = 'STEPID' then
    begin
      with TGenSearch.Create(self) do
         begin
            AutoFieldCols := True ;
            Init('');
            aSearchPanel.DefSql := 'SELECT a.WWORKFLOWSTEPID, b.SWORFLOWNAME,  a.SSTEPNAME, cast(substring(a.SREMARK from 1 for 255) as char(255)) SREMARK FROM WORKFLOWSTEPS a join WORKFLOWTYPES b on a.WSTEPTYPEID = b.WWORKFLOWTYPEID'  ;

            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'b.SWORFLOWNAME' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 10 ;
                  WColumnTranslation := 185 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
               end;
            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'b.SSTEPNAME' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 40 ;
                  WColumnTranslation := 3435 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
               end;
            aSearchPanel.BuildGui ;
            ForceSearch := True ;
            if ShowModal = mrok then
              if not ZQGenSearch.IsEmpty then
                begin
                   Mparams.Lines.Values[Eparamname.Text] := ZQGenSearch.Fields[0].AsString ;
                end;
             free ;
         end;
    end else
if Eparamname.Text = 'PLUGIN' then
    begin
      with TGenSearch.Create(self) do
         begin
            AutoFieldCols := True ;
            Init('');
            aSearchPanel.DefSql := '';
            for i := 0 to LoadedPluginList.Count -1 do
               begin
               if aSearchPanel.DefSql <> '' then
                aSearchPanel.DefSql := aSearchPanel.DefSql + #13+#10 + 'union ' ;
               aSearchPanel.DefSql := aSearchPanel.DefSql + 'Select '+ QuotedStr(ChangeFileExt(ExtractFileName(LoadedPluginList[i]),'')) +' as SDESCRIPTION from rdb$database'  ;
               end;
            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'SDESCRIPTION' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 10 ;
                  WColumnTranslation := 1708 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
               end;
            aSearchPanel.BuildGui ;
            ForceSearch := True ;

            if ShowModal = mrok then
              if not ZQGenSearch.IsEmpty then
                begin
                   Mparams.Lines.Values[Eparamname.Text] := ZQGenSearch.Fields[0].AsString ;
                end;
           free ;
         end;
    end else
if Eparamname.Text = 'LIMITCONTROL' then
    begin
    AWorkflowitem := WF_GetWorkflowImplentOnName(cbSetupTypes.Text);
    if AWorkflowitem = nil then raise Exception.Create('Workflow object = nil');
    AWorkflowitem.StringToParams(AWorkflowitem.Inparams,Mparams.Lines.text,True);
    aOwner := TForm.Create(self) ;
    try
    TForm( aOwner).Hide ;
    AWorkflowitem.Parent := TForm(aOwner) ;

    AForm := AWorkflowitem.WorkFlowStart ;
      with aOwner as TForm do
         begin
            With TMemo.Create(aOwner) do
               begin
                 Parent := TForm(aOwner);
                 Align := alTop ;
                 Height := 60 ;
                 name := 'localmemo';
                 Text := StringReplace(Mparams.Lines.Values[Eparamname.Text],'#@#',#13+#10,[rfReplaceAll]) ;
               end;
             Bowner := TPanel.Create(aOwner) ;
             with Bowner as tpanel do
               begin
                  name := 'localpanel';
                  Parent := TForm(aOwner);
                  Align := alClient ;
                  Tag :=  Integer(AForm) ;
               end;
               if AForm.Parent <> nil then
               begin
               AForm.Parent :=  Bowner as tpanel ;
               AForm.Align := alClient ;

               AForm.BorderStyle := bsNone ;
               end;
               WindowState := wsMaximized ;
               show ;
               if not AForm.Visible then
                   AForm.Show ;
               AForm.Enabled := False ;
               AForm.SendToBack ;
               hide ;
             With TShape.Create(self) do
                begin
                    Parent :=  Bowner as tpanel ;
                    Top := 0 ;
                    left := 0 ;
                    Width := (Bowner as tpanel).ClientWidth ;
                    Height := (Bowner as tpanel).ClientHeight ;
                    Anchors := [akLeft,akTop,akRight,akBottom] ;
                    OnMouseUp :=  MyMouseUp ;
                    Tag :=  Integer(AForm) ;
                    Pen.Mode := pmMerge ;
                    BringToFront ;
                end;
               KeyPreview := True;
               OnKeyDown :=  GenRightKeyDown ;
               OnKeyUp:=  GenRightKeyUp ;
               showmodal ;
                Mparams.Lines.Values[Eparamname.Text] := StringReplace(TMemo(aOwner.FindComponent('localmemo')).Text,#13+#10,'#@#',[rfReplaceAll]) ;

         end;
         finally

            AWorkflowitem.WorkflowEnd(AForm);
             aOwner.free ;
         end;
    end else


    if copy(ReverseString(Eparamname.Text),1,pos('_',ReverseString(Eparamname.Text))) = 'ROLOC' then
    begin

    end ;
end;

procedure TfmWorkflow.BtransitionClick(Sender: TObject);
begin
 ToolBar1.SetFocus ;
 if not BInMakeTrans then
  begin
    BInMakeTrans := True ;
    pvisual.MakeFromTrans := nil ;
    pvisual.MakeToTrans := nil ;
    aTransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3492);
    aTransition.ImageIndex := 72 ;

  end else
  begin
     BInMakeTrans := False;
     aTransition.ImageIndex := 70 ;
     aTransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
    if Assigned(pvisual.MakeFromTrans) and Assigned(pvisual.MakeToTrans) then
       begin
          with aWorkFlowComponent.transitions.Add as TWorkFlowTransitionItem do
             begin
                WWORKFLOWTRANSID := DMTCCoreLink.GetNewIdStr('GEN_WF_TRANS');
                STRANSNAME := 'X' ;
                WFROMWORKFLOWSTEPID := pvisual.MakeFromTrans.WWORKFLOWSTEPID ;
                WTOWORKFLOWSTEPID := pvisual.MakeToTrans.WWORKFLOWSTEPID ;
             end;
         pvisual.MakeFromTrans := nil ;
         pvisual.MakeToTrans := nil ;
         pvisual.Paint ;
       end;

  end;
end;

procedure TfmWorkflow.ScrollBox1Click(Sender: TObject);
begin

   pvisual.MakeFromTrans := nil ;
   pvisual.MakeToTrans := nil ;
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;

   SetButtons(false);
   pvisual.Paint ;

end;

procedure TfmWorkflow.FormDestroy(Sender: TObject);
begin
  if assigned(aWorkFlowComponent) then
  FreeAndNil(aWorkFlowComponent);
end;

procedure TfmWorkflow.bSaveToFileClick(Sender: TObject);
begin
   BInMakeTrans := False;
   atransition.Caption := DMTCCoreLink.GetTextLangNoAmp(3491);
   atransition.ImageIndex := 72 ;


  if SaveDialog1.Execute then
 dmWorkflowData.SaveComponent(SaveDialog1.FileName,aWorkFlowComponent) ;
end;

procedure TfmWorkflow.MyMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
  AControl : TWinControl ;
  aPoint : TPoint ;
  atext : String ;
  function GetOrgName(AControl : TControl) : String ;
  var
   nestControl : TControl ;
  begin
    result := AControl.name ;
    nestControl := AControl ;
     while (nestControl.Owner <> nil)  and not ( nestControl.Owner is TForm)  do
      begin
       result := nestControl.Owner.name + '.' + result ;
       nestControl := nestControl.Owner as TControl ;
      end;

  end;
   function GetOrgParentsName(AControl : TControl) : String ;
  var
   nestControl : TControl ;
  begin
    result := AControl.name ;
    nestControl := AControl ;
     while (nestControl.Parent <> nil) {and not ( nestControl.Parent is TForm)} do
      begin
       result := nestControl.Parent.name + '.' + result ;
       nestControl := nestControl.Parent  ;
      end;

  end;
begin
   // ShowMessage(TComponent(Sender).Name);
   AControl := nil ;
   aPoint := TWinControl(Sender).ClientToScreen(Point(x,y));

   if TForm(TComponent(Sender).tag).ControlAtPos(Point(x,y),True,True) is TwinControl then
     AControl := TForm(TComponent(Sender).tag).ControlAtPos(Point(x,y),True,True)as TWincontrol ;


   if (AControl <> nil) then
    begin
     while (AControl is Twincontrol) do
       begin
        if AControl.ControlAtPos( AControl.ScreenToClient(aPoint ),True,True) is TwinControl then
          begin
            AControl := AControl.ControlAtPos(AControl.ScreenToClient(aPoint ),True,True) as TWincontrol  ;
          end else
          break ;
       end;
    end;
   if (AControl <> nil) then
    begin

    if AControl.ControlAtPos( AControl.ScreenToClient(aPoint ),True,True) <> nil then
      begin
       atext :=  GetOrgName(AControl.ControlAtPos( AControl.ScreenToClient(aPoint ),True,True) ) ;
      end else
     begin
       atext :=   GetOrgName(AControl ) ;
     end;
    if (Trim(atext) = '') or (Trim(atext) = '.') then
      exit ;

     if OSFMessageDlg('Add "'+atext+'"to controls ' +#13+#10 + GetOrgParentsName(AControl) ,mtConfirmation,[mbyes,mbno],0,True) = mryes then
       Tmemo(TWinControl(Sender).Parent.Parent.FindComponent('localmemo')).Lines.add(atext+'.Visible=False') ;
    end;

end;

procedure TfmWorkflow.GenRightKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   AControl : TControl ;
begin
   if (ssCtrl in Shift) then
      begin
         AControl := Tcontrol(Sender) ;
        while (AControl.Owner <>  nil) and not(AControl is  TForm) do
           begin
             AControl := AControl.Owner as TControl ;
           end;
        if AControl.FindComponent('localpanel') <> nil then
           TForm(AControl.FindComponent('localpanel').Tag).Enabled := True ;
      end;
end;

procedure TfmWorkflow.GenRightKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
   AControl : TControl ;
begin
  if not (ssCtrl in Shift) then
      begin
         AControl := Tcontrol(Sender) ;
         while (AControl.Owner <>  nil) and not(AControl is  TForm) do
           begin
             AControl := AControl.Owner as TControl ;
           end;
        if AControl.FindComponent('localpanel') <> nil then
            TForm(AControl.FindComponent('localpanel').Tag).Enabled := False ;
      end;
end;

procedure TfmWorkflow.Default1Click(Sender: TObject);
begin
 mStatusText.Text := 'select ' + QuotedStr(Estepname.Text) +' from rdb$database' ;
end;

procedure TfmWorkflow.bmakeThisStepDefForDocsClick(Sender: TObject);
begin
ZSQLProcessor1.SQL.Text := 'Drop Trigger DOCHEAD_WORKFLOW' + EDocType.Text ;
ZSQLProcessor1.Execute ;
if sender = bDropTrigger then exit ;

ZSQLProcessor1.SQL.Text := 'SET TERM ^ ;  CREATE TRIGGER DOCHEAD_WORKFLOW'+EDocType.Text+' FOR DOCHEAD ACTIVE ' +
 ' BEFORE INSERT POSITION 0 AS  BEGIN   if (inserting) then '+
 '    if (new.WTYPEID = '+EDocType.Text+') then    begin    Insert into WORKFLOWWORK(WWORKFLOWWORKID, '+
 '    WUSERID,WSTATUS,WWORKFLOWSTEPID,    WLINKID,DDATEACTION,PARAMS) Values( gen_ID(GEN_WF_WORK,1) '+
 ' , (Select first 1 WUSERID  from LOGGEDIN  where  LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION) ' +
 ' , 0  , '+dmWorkflowData.ZQWorkflowSTARTSTEP.AsString+' , new.WDOCID , current_timestamp , null );    end ' +
 ' END^ SET TERM ; ^ ' ;
ZSQLProcessor1.Execute ;
end;

procedure TfmWorkflow.DBGrid1TitleClick(Column: TColumn);
begin
 if (Column.Field <> nil ) and ((Column.Field.DataSet is  TUniQuery )) then
    begin
       if  TUniQuery(Column.Field.DataSet).IndexFieldNames <> Column.Field.FieldName  then
       TUniQuery(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName
       else
       begin
          TUniQuery(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName + '  DESC' ;
       end;
    end;
end;

procedure TfmWorkflow.DBGrid2TitleClick(Column: TColumn);
begin
 if (Column.Field <> nil ) and ((Column.Field.DataSet is  TUniQuery )) then
    begin
       if  TUniQuery(Column.Field.DataSet).IndexFieldNames <> Column.Field.FieldName  then
       TUniQuery(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName
       else
       begin
         TUniQuery(Column.Field.DataSet).IndexFieldNames := Column.Field.FieldName + '  DESC' ;
       end;
    end;
end;

procedure TfmWorkflow.ZSQLProcessor1Error(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
Action := eaContinue ;
end;

procedure TfmWorkflow.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   aGroupRec :TGroupRecPointer ;
   avalue :String ;
begin
        avalue := VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WGROUPID.Index]) ;
         DMTCCoreLink.GroupsObject.getGroup(aGroupRec,StrToIntDef(avalue,0)) ;
         if aGroupRec.Wbackcol <> 0 then
         begin
         if (AViewInfo.Selected ) or (AViewInfo.Focused ) then
                  begin

                   if (aGroupRec^.Wfontcol <> 0) then
                      ACanvas.Brush.Color := aGroupRec^.Wfontcol ;
                   if (aGroupRec^.Wbackcol <> 0) then
                      ACanvas.Font.Color :=  aGroupRec^.Wbackcol ;
                  end else
                  begin

                   if (aGroupRec^.Wbackcol <> 0) then
                      ACanvas.Brush.Color := aGroupRec^.Wbackcol ;
                   if (aGroupRec^.Wfontcol <> 0) then
                      ACanvas.Font.Color :=  aGroupRec^.Wfontcol ;
                  end;
         end;
end;

end.

