(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Groups;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus,  ComCtrls,
       Buttons, Grids, DBGrids,db,
    DBAccess , Uni, Mask, DBCtrls, UPluginsSharedUnit,UOSFVisuals,UGenSearch,
  dbcgrids, MemDS,   cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPC, cxContainer, cxEdit,
  cxTreeView ;

type
twf_TTfmGroups  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;
 twf_TfmPluginGroups  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;
  TfmGroups = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    BtnOk: TBitBtn;
    PopupMenu1: TPopupMenu;
    Editname1: TMenuItem;
    ZQType: TuniQuery;
    LinkImage1: TMenuItem;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    ZQGroupDesc: TuniQuery;
    ranslations1: TMenuItem;
    ZQLangs: TuniQuery;
    ZQLangsWGROUPID: TIntegerField;
    ZQLangsWGROUPTYPEID: TIntegerField;
    ZQLangsSDESCRIPTION: TStringField;
    ZQLangsWPARENTGROUP2ID: TIntegerField;
    ZQLangsWPARENTGROUP1ID: TIntegerField;
    ZQLangsDSYSDATE: TDateTimeField;
    ZQLangsWSORTNO: TIntegerField;
    ZQLangsBDISABLE: TSmallintField;
    ZQLangsWCOLOR: TIntegerField;
    ZQLangsWTEXTCOLOR: TIntegerField;
    ZQGroupDescWGROUPID: TIntegerField;
    ZQGroupDescWLANGUAGEID: TIntegerField;
    ZQGroupDescSDESCRIPTION: TStringField;
    ZQGroupDescLookuplang: TStringField;
    dsGroupDesc: TDataSource;
    ZUSQLGroupDesc: TUniUpdateSql;
    Doall1: TMenuItem;
    Clearimage1: TMenuItem;
    ZQGroupDescWGROUPDESCID: TIntegerField;
    pcmain: TPageControl;
    tstreeview: TTabSheet;
    tsListview: TTabSheet;
    Panel1: TPanel;
    TVGroups: TcxTreeView;
    Panel2: TPanel;
    LEditGroup: TLabel;
    DBNavigator1: TDBNavigator;
    btokdesc: TBitBtn;
    btcanceldesc: TBitBtn;
    Panel3: TPanel;
    cbEnabled: TCheckBox;
    Image1: TImage;
    PBackColor: TPanel;
    BBackColor: TSpeedButton;
    PFontColor: TPanel;
    bFontColor: TSpeedButton;
    Pexample: TPanel;
    pcnewsearch: TPageControl;
    tsSearch: TTabSheet;
    tsDetail: TTabSheet;
    Panel4: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel5: TPanel;
    Button3: TButton;
    bCancelDetail: TButton;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Button5: TButton;
    PageControl1: TPageControl;
    Panel6: TPanel;
    Shape2: TShape;
    edtGroupName: TEdit;
    Label2: TLabel;
    Panel7: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    LDesc: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    LLang: TLabel;
    PgrActions: TPanel;
    bgrnew: TBitBtn;
    bgredit: TBitBtn;
    bgrdelete: TBitBtn;
    bgrMoveUp: TBitBtn;
    bGrMoveDown: TBitBtn;
    GroupControl: TcxPageControl;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbDeleteRepGroup2Click(Sender: TObject);
    procedure edtRepGroup1KeyPress(Sender: TObject; var Key: Char);
    procedure edtRepGroup2KeyPress(Sender: TObject; var Key: Char);
    procedure edtRepGroup10KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtAccRepGroup2KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtDebtorRepGroup2KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCreditorRepGroup2KeyPress(Sender: TObject;
      var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGroupNameExit(Sender: TObject);
    procedure edtGroupNameKeyPress(Sender: TObject; var Key: Char);
    procedure TVGroupsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVGroupsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TVGroupsEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure BtnPrintClick(Sender: TObject);
      procedure   CheckDelete ;
    procedure TVGroupsEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TVGroupsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
 
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure Editname1Click(Sender: TObject);
 
    procedure TVGroupsChange(Sender: TObject; Node: TTreeNode);
    procedure LinkImage1Click(Sender: TObject);
    procedure cbEnabledClick(Sender: TObject);
    procedure BBackColorClick(Sender: TObject);
    procedure bFontColorClick(Sender: TObject);
    procedure Translations1Click(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure btcanceldescClick(Sender: TObject);
    procedure btokdescClick(Sender: TObject);
    procedure ZQGroupDescBeforeOpen(DataSet: TDataSet);
    procedure TVGroupsClick(Sender: TObject);
    procedure TVGroupsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Doall1Click(Sender: TObject);
    procedure Clearimage1Click(Sender: TObject);
    procedure ZQGroupDescAfterScroll(DataSet: TDataSet);
    procedure ZQGroupDescAfterInsert(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bCancelDetailClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bgrnewClick(Sender: TObject);
    procedure bgreditClick(Sender: TObject);
    procedure bgrdeleteClick(Sender: TObject);
    procedure bgrMoveUpClick(Sender: TObject);
    procedure bGrMoveDownClick(Sender: TObject);
    procedure GroupControlChange(Sender: TObject);
  private
    { Private declarations }
    Procedure SwapeRepGrp(SourceID,TargetID:integer);
    Procedure MoveUpDown(Up:Boolean);
    Procedure LoadTreeGroups;
    Procedure CheckGrpAndLoad;
    procedure Griddbclick(Sender: TObject);

    Function  GetGrpTypeID:Integer;
    Function  InvalideNode:Boolean;

    Procedure ValidateSortNo;
    procedure RecurceTree(ANode: TTreeNode);
    procedure UpdateExample ;
    procedure LoadPluginsGroups;
    procedure PluginPopupClick(Sender: TObject);
    procedure PluginPopupListClick(Sender: TObject);

    procedure PluginPopup2Click(Sender: TObject);
    procedure SetAccessDetail(Isdetail: Boolean);
  public
    AFreeformArray  : array of TEditPanel ;
    AFreeFormIndex : Array of integer ;
    APluginList : TStringlist ;
    APluginsFormsList : TStringlist ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    DEFLAYOUT : String ;
    Agensearch : TgenSearch ;
    ForceGroup : Integer ;
    isNewGoup : Boolean ;
    { Public declarations }
  end;


var
  fmGroups: TfmGroups;
  aInt : Integer;
  sSelect:String;
implementation

uses  Database, HtmlHelpAPI,  GlobalFunctions,DatabaseAccess,
 OSFGeneralRoutines, UDMTCCoreLink,variants, Main, UReportManager;

{$R *.DFM}

{Rewriten load treegoup}
procedure TfmGroups.LoadPluginsGroups;
var
 ArrayImageIndex : Array [0..9] of integer ;
 procedure Init;
    var
     i  :  Integer ;
     AForm: TForm ;

    begin
      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormPluginRecordArray[i].aMessageGetDisplayText <> nil) then

          begin

             AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'');
             AFormPluginRecordArray[i].aForm := AForm ;
             APluginsFormsList.AddObject(aform.Name,AForm);
          end;
    end;

var
 i , IncArr,Ins : Integer ;
  ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  IsEnable := false ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 9 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToGroupsRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('GROUPS',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
              end;
             if IsEnable then
               begin


               inc(IncArr) ;
               end else
            begin
              @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil ;
              @AFormPluginRecordArray[IncArr].aMessageFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil ;
              @AFormPluginRecordArray[IncArr].aPluginEnabled   := nil ;
            end;
        end;
    end;
 init ;
end;



Procedure TfmGroups.RecurceTree(ANode : TTreeNode ) ;
Var

  vNode:TTreeNode;

  aStr,ExtraSql:String;


  GroupID:Integer;
  AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.create(nil) ;
   try
    AQuery.Connection := dmDatabase.ZmainConnection ;
    // if its root its 0 but we need to include the parent id is null
    ExtraSql := '' ;
    if Integer(ANode.data) = 0 then ExtraSql := ' or WParentGroup2ID is null ';
    // back cast to integer( if its root it wil be 0);
    AQuery.sql.Text := format('Select * From Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo ',[IntToStr(GetGrpTypeID),IntToStr(Integer(ANode.data)),ExtraSql]);
    AQuery.open ;
    while not AQuery.Eof do
      begin
       GroupID := AQuery.FieldByName('WGroupID').AsInteger;
       aStr := AQuery.FieldByName('SDescription').AsString;
       vNode := TVGroups.Items.AddChild(ANode,aStr);
       //  done : Pieter Just remeber the ID in the data property by casting it to Tobject
       vNode.Data := TObject(GroupID);
       if AQuery.FieldByName('BDisable').AsInteger = 1 then
        begin
        vNode.ImageIndex := 42 ;
        vNode.SelectedIndex := 42 ;
        end
       else
        begin
        vNode.ImageIndex := -1 ;
        vNode.SelectedIndex := -1 ;
        end;
       // recursion
       RecurceTree(vNode);
       AQuery.next ;
      end;
   finally
     AQuery.free ;
   end;
end;

{Load Group Tree}
Procedure TfmGroups.LoadTreeGroups;
Var
  Root:TTreeNode;

  aStr:String;
  i : Integer ;



  // done : Pieter I see what your doing here but i think it beter with recursion
  // that way theres no dept limit to the treeview.

begin


  TVGroups.items.BeginUpdate;
  try
  TVGroups.Items.Clear;
  aStr:= GetTextLang(1847);
  Root := TVGroups.Items.Add(Nil,aStr);
  Root.Data := Pointer(0) ;
  Root.SelectedIndex := -1 ;
  Root.ImageIndex := -1 ;
  aStr :='REINIT=GROUPS' + IntToStr(GetGrpTypeID);

  for i := 0 to APluginsFormsList.Count -1 do
    begin
      try
       AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(aStr));
      except
      on e:Exception do
       ShowMessage(e.Message);
    end;
    end;
  ZQLangs.open ;
  ZQLangs.First ;
   i := 0 ;
   while not ZQLangs.Eof do
      begin
        SetLength(AFreeformArray,i+1);
        SetLength(AFreeFormIndex,i+1);
        AFreeFormIndex[i] := ZQLangsWGROUPID.AsInteger ;
        AFreeformArray[i] := TEditPanel.Create(self) ;
        AFreeformArray[i].Parent := panel3 ;
        AFreeformArray[i].SetEditType('GROUPLANGS'+IntToStr(GetGrpTypeID),'',False)  ;
        AFreeformArray[i].ScaleBy(screen.PixelsPerInch,96);
        AFreeformArray[i].Align := alClient ;
        AFreeformArray[i].Visible:= false ;
        inc(i);
        ZQLangs.next ;
      end;

   if  (copy(GroupControl.ActivePage.Caption,1,1) =' ' ) then
     begin
        Root.Selected := True ;
        pcmain.ActivePage := tsListview ;
        Agensearch.Init(Trim(UpperCase(GroupControl.ActivePage.Caption)));

     end else
     begin
       pcmain.ActivePage := tstreeview ;
       RecurceTree(Root);
     end;
  finally
  TVGroups.items.EndUpdate;
  end;
  TVGroups.FullExpand;
end;

procedure TfmGroups.FormShow(Sender: TObject);
var
 i : Integer ;
begin
  
  DMTCCoreLink.LoadImage(BtnClose.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Printer');


  DMTCCoreLink.LoadImage(btokdesc.Glyph,'Ok');
  DMTCCoreLink.LoadImage(btcanceldesc.Glyph,'Cancel');

  btokdesc.Caption := DMTCCoreLink.GetTextLangNoAmp(167) ;
  btcanceldesc.Caption := DMTCCoreLink.GetTextLangNoAmp(168) ;
  LLang.Caption := GetTextLang(3135) ;

  LDesc.Caption := GetTextLang(1708) ;
  cbEnabled.Caption := GetTextLang(304) ;
  sSelect:='';


  dmDatabase.tblGroups.Open;


   if ForceGroup = 0 then
    begin
     GroupControl.ActivePageIndex := 0 ;
     GroupControlChange(self);
   end;


  TVGroups.Images := DMTCCoreLink.ImageList1 ;
  TVGroups.StateImages := DMTCCoreLink.ImageList1 ;

  for i := 0 to GroupControl.PageCount-1 do
   begin
    if  GroupControl.Pages[i].Caption = ' ' + DEFLAYOUT then
         begin
          GroupControl.ActivePageIndex := i ;
          GroupControlChange(self);
        end;
    if ForceGroup <> 0 then
       if GroupControl.Pages[i].Tag = ForceGroup then
         begin
          GroupControl.ActivePageIndex := i ;
          GroupControlChange(self);
        end;
    end;

  CheckGrpAndLoad;
  if dmDatabase.tblGroups.RecordCount>dmDatabase.tblGroups.RecordCount then
    aInt := dmDatabase.tblGroups.RecordCount
  else
    aInt := dmDatabase.tblGroups.RecordCount  ;
   // translations
 {  GroupTabs.ButtonItems[0].Button.Caption := GetTextLang(1833) ;
   GroupTabs.ButtonItems[1].Button.Caption := GetTextLang(1834) ;
   GroupTabs.ButtonItems[2].Button.Caption := GetTextLang(1835) ;
   GroupTabs.ButtonItems[3].Button.Caption := GetTextLang(1836) ;
   GroupTabs.ButtonItems[4].Button.Caption := GetTextLang(1837) ;}
 //  btnGroup1.Caption := GetTextLang(1838) ;
  // btnGroup2.Caption := GetTextLang(1839) ;

  { fcOutlookBar1OutlookList2.Items[0].Text := GetTextLang(1840) ;
   fcOutlookBar1OutlookList2.Items[1].Text := GetTextLang(1841) ;
   fcOutlookBar1OutlookList2.Items[2].Text := GetTextLang(1842) ;
   fcOutlookBar1OutlookList2.Items[3].Text := GetTextLang(1843) ;
   fcOutlookBar1OutlookList2.Items[4].Text := GetTextLang(1844) ;   }

   bgrnew.Caption := GetTextLang(1840) ;
   bgredit.Caption := GetTextLang(1841) ;
   bgrdelete.Caption := GetTextLang(1842) ;
   bgrMoveUp.Caption := GetTextLang(1843) ;
   bGrMoveDown.Caption := GetTextLang(1844) ;

   Label2.Caption := GetTextLang(1845) ;
   self.Caption := GetTextLang(1846) ;
   BtnOk.Caption := DMTCCoreLink.GetTextLangNoAmp(52) ;
   BtnClose.Caption := DMTCCoreLink.GetTextLangNoAmp(167) ;

    BBackColor.Caption := GetTextLang( 3337 ) ;
    bFontColor.Caption := GetTextLang( 3338 ) ;
    Pexample.Caption := GetTextLang(  2966 ) ;
    Editname1.Caption := GetTextLang(  1013 ) ;
    LinkImage1.Caption := GetTextLang(  3339 ) ;
    ranslations1.Caption := GetTextLang( 3134 ) ;
    Doall1.Caption := GetTextLang(   3341 ) ;
    Clearimage1.Caption := GetTextLang( 3340) ;
end;

procedure TfmGroups.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter:='';
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  DMTCCoreLink.GroupsObject.clear ;
end;

procedure TfmGroups.sbDeleteRepGroup2Click(Sender: TObject);
begin
  Try
    if dmDatabase.tblGroups.RecordCount>0 then
    dmDatabase.tblGroups.Delete;
  except end;
end;

procedure TfmGroups.edtRepGroup1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
  end;
end;

procedure TfmGroups.edtRepGroup2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
  end;
end;

procedure TfmGroups.edtRepGroup10KeyPress(Sender: TObject; var Key: Char);
begin
end;
//Allow the user to change the name of the Reporting Groups

//Account page

procedure TfmGroups.dbedtAccRepGroup2KeyPress(Sender: TObject;
  var Key: Char);
begin
end;

//Debtor page

procedure TfmGroups.dbedtDebtorRepGroup2KeyPress(Sender: TObject;
  var Key: Char);
begin
end;

//Creditor page

procedure TfmGroups.dbedtCreditorRepGroup2KeyPress(Sender: TObject;
  var Key: Char);
begin
end;

//Stock page

procedure TfmGroups.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);



begin
     if Key = 112 then
        begin
             HtmlShowTopic(229);
             key := 0;

        end;
end;

Procedure TfmGroups.CheckGrpAndLoad;
begin

   LoadTreeGroups;
end;

procedure TfmGroups.edtGroupNameExit(Sender: TObject);
begin


  edtGroupName.Text := Trim(edtGroupName.Text) ;
  if Trim(edtGroupName.Text)='' then
    Exit;


  dmDatabase.tblSysVars.Edit;
  Case GroupControl.ActivePage.Tag of
  22,23:  {Debtors}
    Begin
      if GroupControl.ActivePage.Tag=22 then
        dmDatabase.tblSysVarsSdebtorReportName1.Value := edtGroupName.Text
      else
        dmDatabase.tblSysVarsSdebtorReportName2.Value := edtGroupName.Text;
    end;
  24,25: {Creditors}
    Begin
      if GroupControl.ActivePage.Tag=24 then
        dmDatabase.tblSysVarsSCreditorReportName1.Value := edtGroupName.Text
      else
        dmDatabase.tblSysVarsSCreditorReportName2.Value := edtGroupName.Text;
    end;
  26,27:  {Stock}
    begin
      if GroupControl.ActivePage.Tag=26 then
        dmDatabase.tblSysVarsSStockReportName1.Value := edtGroupName.Text
      else
        dmDatabase.tblSysVarsSStockReportName2.Value := edtGroupName.Text;
    end;
  28,29: {Documents}
   begin
      if GroupControl.ActivePage.Tag=28 then
        dmDatabase.tblSysVarsSDocumentReportName1.Value := edtGroupName.Text
      else
        dmDatabase.tblSysVarsSDocumentReportName2.Value := edtGroupName.Text;
   end;
  20,21:   {GL Accounts}
   begin

      if GroupControl.ActivePage.Tag=20 then
        dmDatabase.tblSysVarsSACCOUNTReportName1.Value :=  edtGroupName.Text
      else
        dmDatabase.tblSysVarsSACCOUNTReportName2.Value := edtGroupName.Text
   end;
  end;
  dmDatabase.tblSysVars.Post;
  TDataBaseRoutines.SetTypeDescription(GroupControl.ActivePage.Tag,Trim(edtGroupName.Text));
 // lblGroupName.Caption := edtGroupName.Text;
  GroupControl.ActivePage.Caption :=  TDataBaseRoutines.GetTypeDescription(GroupControl.ActivePage.Tag) ;
end;

procedure TfmGroups.edtGroupNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edtGroupNameExit(Sender);
    Key := #0;
  end;
end;


procedure TfmGroups.TVGroupsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  TargetNode, SourceNode: TTreeNode;
  ParentID:integer;
begin
  TargetNode := TVGroups.GetNodeAt (X, Y);
  if TargetNode <> nil then
  begin
    SourceNode := TVGroups.Selected;
    SourceNode.MoveTo (TargetNode, naAddChildFirst);
    TargetNode.Expand (False);
    TVGroups.Selected := TargetNode;
    {Update table Parents Links}
    ParentID := Integer(TargetNode.Data);
    if (TargetNode = TVGroups.Selected ) And dmDatabase.tblGroups.Locate('WGroupID',Integer(SourceNode.Data),[LoCaseInsensitive]) then
    begin
      dmDatabase.tblGroups.Edit;
      dmDatabase.tblGroups.FieldByName('WParentGroup2iD').AsInteger:=ParentID;
      dmDatabase.tblGroups.Post;
    end;
  end;
end;

procedure TfmGroups.TVGroupsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  TargetNode, SourceNode: TTreeNode;
begin
  TargetNode := TVGroups.GetNodeAt (X, Y);
  // accept dragging from itself
  if (Source = Sender) and (TargetNode <> nil) then
  begin
    Accept := True;
    // determines source and target
    SourceNode := TVGroups.Selected;
    // look up the target parent chain
    while (TargetNode.Parent <> nil) and
        (TargetNode <> SourceNode) do
      TargetNode := TargetNode.Parent;
    // if source is found
    if TargetNode = SourceNode then
      // do not allow dragging over a child
      Accept := False;
  end
  else
    Accept := False;
end;

procedure TfmGroups.TVGroupsEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
//  if (TVGroups.Selected.Text='REPORTING GROUP ROOT') then
  if (Node.Text= GetTextLang(1847) ) then
  begin
    AllowEdit:=False;
    Exit;
  end;
end;

procedure TfmGroups.BtnPrintClick(Sender: TObject);
const
  TabChar = '     ';
Var
  i: Integer;
  NodeStr: string;
  ANode: TTreeNode;
begin
 BtnOk.Enabled := false ;
  try
   ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\documents\groups.rep','GROUPTYPEID=' + IntToStr(GetGrpTypeID) );
  finally
   BtnOk.Enabled := True ;
  end;
  dmDatabase.tblSysVars.Open;
end;

procedure TfmGroups.TVGroupsEdited(Sender: TObject; Node: TTreeNode;
  var S: String);

begin
  if dmDatabase.tblGroups.Locate('WGroupID',Integer(Node.Data),[LoCaseinsensitive])   then
  begin
    dmDatabase.tblGroups.Edit;
    dmDatabase.tblGroups.FieldByName('SDescription').AsString := s;
    dmDatabase.tblGroups.post;
 // make Node reflect caped text (If text is longer then 35 )
 s  :=  dmDatabase.tblGroups.FieldByName('SDescription').AsString ;
 ZQGroupDesc.close ;
 ZQGroupDesc.params[0].AsInteger := Integer(TVGroups.Selected.Data);
 ZQGroupDesc.Open ;
 ZQGroupDesc.DisableControls ;
 try
       while not ZQGroupDesc.eof do
         begin
             if (ZQGroupDescSDESCRIPTION.AsString = '') or (ZQGroupDescSDESCRIPTION.AsString = Node.Text ) then
              begin
               ZQGroupDesc.Edit ;
               ZQGroupDescSDESCRIPTION.AsString:= s ;
               ZQGroupDesc.Post ;
              end;
             ZQGroupDesc.Next ;
         end ;

 finally
    ZQGroupDesc.EnableControls ;
 end;
 if isNewGoup  then
   begin
   isNewGoup := False ;
  if Node.Parent <> nil then
   Node.Parent.Selected := True ;
   end;
  end;
end;


Function TfmGroups.GetGrpTypeID:Integer;
begin
  result :=  GroupControl.ActivePage.Tag ;

end;

procedure TfmGroups.TVGroupsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=113) ANd (Not InvalideNode) then
  begin

  end;
end;

Function TfmGroups.InvalideNode:Boolean;
begin
   // Assume false
   result := false ;
   // non selected
   if TVGroups.Selected=Nil then
   result := true
   // root selected
   else if TVGroups.Selected.Parent = nil then
   result := true ;

end;




Procedure TfmGroups.MoveUpDown(Up:Boolean);
Var
  TargetNode:TTreeNode;

  TargetID,SourceID:Integer;
  tmp:string;
begin
  if TVGroups.Selected<>Nil then
  begin
    if up then
      TargetNode := TVGroups.Selected.getPrevSibling
    else
      TargetNode := TVGroups.Selected.getNextSibling;
    if TargetNode<>nil then
    begin
      TargetID := Integer(TargetNode.Data);
      SourceID := Integer(TVGroups.Selected.Data);

      SwapeRepGrp(SourceID,TargetID);
      tmp:=TargetNode.Text;
      TargetNode.Text := TVGroups.Selected.Text;
      TargetNode.data := Pointer(SourceID);
      TVGroups.Selected.Text := tmp;
      TVGroups.Selected.data := pointer(TargetID);
      TVGroups.Selected.DeleteChildren ;
      RecurceTree(TVGroups.Selected);
      TargetNode.DeleteChildren ;
      RecurceTree(TargetNode);

      TargetNode.Selected:=True;

    end;
  end;

end;


 


Procedure TfmGroups.SwapeRepGrp(SourceID,TargetID:integer);
Var
  a,b:integer;
begin
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Locate('WGroupID',SourceID,[]);
  a:=dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger;
  if a=0 then a:= dmDatabase.tblGroups.FieldByName('WGroupID').AsInteger;
  dmDatabase.tblGroups.Locate('WGroupID',TargetID,[]);
  b:=dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger;
  if b=0 then b:= dmDatabase.tblGroups.FieldByName('WGroupID').AsInteger;
  dmDatabase.tblGroups.Edit;
  dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger:=a;
  dmDatabase.tblGroups.Post;
  dmDatabase.tblGroups.Locate('WGroupID',SourceID,[]);
  dmDatabase.tblGroups.Edit;
  dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger:=b;
  dmDatabase.tblGroups.Post;
end;

procedure TfmGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

Procedure TfmGroups.ValidateSortNo;
begin

  dmDatabase.tblGroups.DisableControls;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='WSortNo Is Null';
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.First;
  While not dmDatabase.tblGroups.Eof do
  begin
    if (dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger<>0) OR
       (dmDatabase.tblGroups.FieldByName('WGroupID').AsInteger=0) then
    begin
      dmDatabase.tblGroups.Next;
      Continue;
    end;
    dmDatabase.tblGroups.edit;
    dmDatabase.tblGroups.FieldByName('WSortNo').AsInteger := dmDatabase.tblGroups.FieldByName('WGroupID').AsInteger;
    dmDatabase.tblGroups.Post;
    //dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.EnableControls;
 // dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='';
end;

procedure TfmGroups.PluginPopupClick(Sender: TObject);
var
 AMessage : String ;
begin
 If TVGroups.Selected = nil  then exit ;
 If TVGroups.Selected.data = nil  then exit ;

 AMessage := 'CONTEXT=' + IntToStr(Integer(TVGroups.Selected.data)) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
end;


procedure TfmGroups.FormCreate(Sender: TObject);
var
 i , ImageIndex : Integer ;

 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 aTabsheet : TcxTabSheet ;
begin

ForceGroup := 0 ;
 uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
 tsListview.TabVisible := False ;
 tstreeview.TabVisible := False ;
 tsSearch.TabVisible := False ;
 tsDetail.TabVisible := False ;
 pcnewsearch.ActivePage := tsSearch ;
Agensearch := TGenSearch.Create(tsSearch );
Agensearch.Parent := tsSearch ;
Agensearch.Align := alClient ;
Agensearch.BorderStyle := bsNone ;
Agensearch.DBGrid1.OnDblClick := Griddbclick ;
Agensearch.Panel1.Visible := false ;
Agensearch.Show ;
Agensearch.AutoFieldCols := True ;
 APluginList := TStringlist.create ;
  APluginsFormsList := TStringlist.create ;
LoadPluginsGroups ;
// done : Pieter Default so no strange things happen
  dmDatabase.tblSysVars.Open;

if DMTCCoreLink.SimpleMode =0 then
dmDatabase.qGen.SQL.Text := 'select WTYPEID, SDESCRIPTION,WTYPEPARENT from V_TYPES  TYPES where WTYPEPARENT in(2,10) and WTYPEID <> 2 order by WTYPEID'
  else
  if DMTCCoreLink.SimpleMode =1 then
   dmDatabase.qGen.SQL.Text := 'select WTYPEID, SDESCRIPTION,WTYPEPARENT from V_TYPES  TYPES where WTYPEPARENT in(2,10) and WTYPEID not in (1004,26,27,28,29,30,31) order by WTYPEID'
   else
  dmDatabase.qGen.SQL.Text := 'select WTYPEID, SDESCRIPTION,WTYPEPARENT from V_TYPES  TYPES where WTYPEPARENT in(2,10) and WTYPEID not in (1004,26,27,28,29,30,31) order by WTYPEID';
  dmDatabase.qGen.open ;


  // add context
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
      begin
         if  @AFormPluginRecordArray[i].aContextmenuEnabled <> nil then
           if AFormPluginRecordArray[i].aForm <> nil then
            begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[i].aContextmenuEnabled('GROUPS',APChar,ImageIndex);
                 if APChar <> '' then
                 begin
                 if PopupMenu1.FindComponent(APChar) = nil then
                   begin
                     PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
                     PopupMenu1.Items[PopupMenu1.Items.Count-1].Name :=  APChar ;
                     PopupMenu1.Items[PopupMenu1.Items.Count-1].Caption :=  TForm(AFormPluginRecordArray[i].aForm).Caption ;
                     PopupMenu1.Items[PopupMenu1.Items.Count-1].Tag := i ;
                     PopupMenu1.Items[PopupMenu1.Items.Count-1].OnClick := PluginPopupClick ;

                   end;

                 end;
            end;
      end;



while not dmDatabase.qGen.eof do
  begin
   if  not dmtccorelink.ReadSysParam('GRACC'+'_'+ dmDatabase.qGen.fields[0].asstring ,True,dmtccorelink.Currentuser) then
      begin
         dmDatabase.qGen.next ;
         Continue ;
      end;

       aTabsheet := TcxTabSheet.Create(GroupControl);

          aTabsheet.Caption := trim(dmDatabase.qGen.fields[1].asstring) ;
          aTabsheet.tag := dmDatabase.qGen.fields[0].asinteger ;
          if  dmDatabase.qGen.fields[2].AsInteger = 10 then
            aTabsheet.Caption := ' ' + aTabsheet.Caption ;
        aTabsheet.PageControl := GroupControl ;
     dmDatabase.qGen.next ;
  end;

end;

procedure TfmGroups.Editname1Click(Sender: TObject);
begin
 if  TVGroups.Selected <> nil then
 TVGroups.Selected.EditText;

end;

 

procedure TfmGroups.TVGroupsChange(Sender: TObject; Node: TTreeNode);
var
 i : Integer ;
 Aimg : String ;
begin
 PFontColor.Color := clBtnFace ;
 PBackColor.Color := clBtnFace ;
 Image1.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\groups.ico');
 UpdateExample ;





if Node = nil then exit ;
 if Integer(Node.Data) <> 0 then
    begin
      Aimg :=  DMTCCoreLink.GroupsObject.GetGroupImgName(Integer(Node.Data)) ;
       if FileExists(Aimg ) then
          Image1.Picture.LoadFromFile(Aimg);

       cbEnabled.OnClick := nil ;
       if Node.ImageIndex = -1 then
          cbEnabled.Checked := false else
          cbEnabled.Checked := true ;
       cbEnabled.OnClick := cbEnabledClick ;
         if dmDatabase.tblGroups.Locate('WGroupID',Integer(Node.Data),[LoCaseinsensitive])   then
            begin
              if  dmDatabase.tblGroupsWCOLOR.AsInteger <>0 then
                 begin
                  PBackColor.Color := dmDatabase.tblGroupsWCOLOR.AsInteger  ;
                  PFontColor.Color := dmDatabase.tblGroupsWTEXTCOLOR.AsInteger  ;
                 end;
              UpdateExample ;          
            end;
    end;

end;

procedure TfmGroups.LinkImage1Click(Sender: TObject);
var
 AExt : String ;
begin
 if TVGroups.Selected = nil then exit ;
 if integer(TVGroups.Selected) =0 then exit ;
 if OpenDialog1.Execute then
     begin
     AExt := LowerCase(ExtractFileExt(OpenDialog1.FileName));
      ForceDirectories(DMTCCoreLink.GetLocalSaveDir + 'images\');
       if  (AExt= '.bmp') or (AExt = '.jpg') or (AExt = '.png') or (AExt = '.gif') then
         begin
           Image1.Picture.LoadFromFile(OpenDialog1.FileName);
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.jpg' ) then
              DeleteFile (DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.jpg');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.bmp' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.bmp');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.gif' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.gif');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.png' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.png');
           Image1.Picture.SaveToFile(DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+ AExt);
         end;
     end;
end;

procedure TfmGroups.cbEnabledClick(Sender: TObject);
procedure HandelNodes(ANode : TTreeNode)  ;
var
 i : Integer ;
begin
     for i := 0 to ANode.Count -1 do
         HandelNodes(ANode.Item[i]);
if Integer(ANode.Data) <> 0 then
    begin
     if dmDatabase.tblGroups.Locate('WGroupID',Integer(ANode.Data),[])   then
      begin
        if dmDatabase.tblGroups.FieldByName('BDisable').AsInteger <> ord(cbEnabled.Checked) then
        begin
        dmDatabase.tblGroups.Edit;
        dmDatabase.tblGroups.FieldByName('BDisable').AsInteger := ord(cbEnabled.Checked);
        dmDatabase.tblGroups.post;
        end;
       if dmDatabase.tblGroups.FieldByName('BDisable').AsInteger = 1 then
        begin
        ANode.ImageIndex := 42 ;
        ANode.SelectedIndex := 42 ;

        end
       else
        begin
        ANode.ImageIndex := -1 ;
        ANode.SelectedIndex := -1 ;
        end;

      end;
    end;
end;

begin
 if TVGroups.Selected <> nil then
 begin
   HandelNodes(TVGroups.Selected) ;
   TVGroups.Repaint ;
 end;
end;

procedure TfmGroups.BBackColorClick(Sender: TObject);
begin

 if TVGroups.Selected = nil then exit ;
 if Integer(TVGroups.Selected.Data) = 0 then exit ;

         if dmDatabase.tblGroups.Locate('WGroupID',Integer(TVGroups.Selected.Data),[])   then
            begin
              ColorDialog1.Color := dmDatabase.tblGroupsWCOLOR.AsInteger ;
              if ColorDialog1.Execute then
                 begin
                   dmDatabase.tblGroups.edit ;
                   dmDatabase.tblGroupsWCOLOR.AsInteger := ColorDialog1.Color ;
                   dmDatabase.tblGroups.post ;
                   PBackColor.Color := ColorDialog1.Color ;
                   UpdateExample ;      
                 end;
            end;

end;

procedure TfmGroups.bFontColorClick(Sender: TObject);
begin
 if TVGroups.Selected = nil then exit ;
 if Integer(TVGroups.Selected.Data) = 0 then exit ;

         if dmDatabase.tblGroups.Locate('WGroupID',Integer(TVGroups.Selected.Data),[])   then
            begin
              ColorDialog1.Color := dmDatabase.tblGroupsWTEXTCOLOR.AsInteger ;
              if ColorDialog1.Execute then
                 begin
                   dmDatabase.tblGroups.edit ;
                   dmDatabase.tblGroupsWTEXTCOLOR.AsInteger := ColorDialog1.Color ;
                   dmDatabase.tblGroups.post ;
                   PFontColor.Color := ColorDialog1.Color ;
                   UpdateExample ;      
                 end;
            end;
end;

procedure TfmGroups.UpdateExample;
begin
Pexample.Color := PBackColor.Color ;
Pexample.Font.Color := PFontColor.Color ;

end;

procedure TfmGroups.Translations1Click(Sender: TObject);
var
 i : Integer ;
begin
 if TVGroups.Selected = nil then exit ;
 if TVGroups.Selected.Data = nil then exit ;
 ZQGroupDesc.close ;
 ZQGroupDesc.params[0].AsInteger := Integer(TVGroups.Selected.Data);
 ZQGroupDesc.Open ;
 LEditGroup.Caption := TDataBaseRoutines.GetNesteldNameFromGroupID( Integer(TVGroups.Selected.Data),0);


 if Sender <> nil then
 Panel2.Visible := true;
 ZQLangs.open ;
 ZQGroupDesc.DisableControls ;
 try
  ZQLangs.First ;
  while not ZQLangs.Eof do
    begin
       if not ZQGroupDesc.Locate('WLANGUAGEID',ZQLangsWGROUPID.AsInteger,[]) then
         begin
             ZQGroupDesc.Append ;
             ZQGroupDescWGROUPID.AsInteger:= Integer(TVGroups.Selected.Data) ;
             ZQGroupDescSDESCRIPTION.AsString:= TVGroups.Selected.Text ;
             ZQGroupDescWLANGUAGEID.AsInteger := ZQLangsWGROUPID.AsInteger ;
             ZQGroupDesc.Post ;
         end ;

       ZQLangs.next ;
    end;
 for i := low(AFreeFormIndex) to high(AFreeFormIndex) do
    begin
      if ZQGroupDesc.Locate('WLANGUAGEID',AFreeFormIndex[i],[]) then
      AFreeformArray[i].EditFormCollection.Load(ZQGroupDescWGROUPDESCID.AsInteger) ;
    end;
    ZQGroupDesc.First ;    
 finally
    ZQGroupDesc.EnableControls ;
 end;


end;

procedure TfmGroups.Panel2Exit(Sender: TObject);
begin
 Panel2.Visible := false ;
end;

procedure TfmGroups.btcanceldescClick(Sender: TObject);
begin
If ZQGroupDesc.State <> dsBrowse then
    ZQGroupDesc.Cancel ;
  Panel2.Visible := false ;  
end;

procedure TfmGroups.btokdescClick(Sender: TObject);
var
 i : Integer ;
begin
 If ZQGroupDesc.State <> dsBrowse then
    ZQGroupDesc.post ;
 Panel2.Visible := false ;
  for i := low(AFreeFormIndex) to high(AFreeFormIndex) do
    begin
      if ZQGroupDesc.Locate('WLANGUAGEID',AFreeFormIndex[i],[]) then
      AFreeformArray[i].EditFormCollection.Save(ZQGroupDescWGROUPDESCID.AsInteger) ;
    end;

end;

procedure TfmGroups.ZQGroupDescBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(ZQGroupDesc,'SELECT * FROM GROUPS_DESCRIPTIONS a where a.WGROUPID is null');
end;

procedure TfmGroups.TVGroupsClick(Sender: TObject);
//var
// ANode :TTreeNode ;
begin
 {ANode := TVGroups.GetNodeAt(TVGroups.ScreenToClient(mouse.CursorPos).X,TVGroups.ScreenToClient(mouse.CursorPos).Y) ;

if  ANode <> nil then
   ANode.Selected := true ; }
end;

procedure TfmGroups.TVGroupsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if Button = mbRight then
    begin
      if TVGroups.GetNodeAt(x,y) <> nil then
         TVGroups.GetNodeAt(x,y).Selected := true ;
    end;
end;



procedure TfmGroups.FormDestroy(Sender: TObject);
var
  i : Integer ;
begin
 for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].free;

  for i := 0 to APluginsFormsList.Count -1 do
    begin
       AFormPluginRecordArray[i].aUnLoadFormPlugin(TForm(APluginsFormsList.Objects[i]));
    end;
 APluginList.free ;
 APluginsFormsList.free ;
end;

procedure TfmGroups.Doall1Click(Sender: TObject);
var
 I : Integer ;
begin
 for i := 0 to TVGroups.Items.Count -1 do
  if TVGroups.Items[i].Data <> nil then
    begin
       TVGroups.Items[i].Selected := true ;
       Translations1Click(nil);
    end;

end;

procedure TfmGroups.CheckDelete;


 Procedure HandelContinue(ATable , AField , APrimary: String) ;
 var
 Count : Integer ;
 begin
  Count := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count('+APrimary+') from '+ATable+' where '+AField+' = '+ IntToStr(dmDatabase.tblGroupsWGROUPID.AsInteger) )),0);
   if Count <> 0 then
    begin
     if OSFMessageDlg('Groups are still linked clear links ?',mtConfirmation,[mbyes,mbno],0) = mrno then
        raise Exception.Create('Delete aborted!');
    DMTCCoreLink.ExecSql('Update '+ATable+' set ' + AField + ' = 0 where ' + AField +' = '+  IntToStr(dmDatabase.tblGroupsWGROUPID.AsInteger) );
    end;



 end;

begin
 HandelContinue('Account','WReportingGroup1Id','WAccountid');
 HandelContinue('Account','WReportingGroup2Id','WAccountid');

 HandelContinue('Dochead','WReportingGroup1Id','Wdocid');
 HandelContinue('Dochead','WReportingGroup2Id','Wdocid');

 HandelContinue('Docline','WReportingGroup1Id','Wdocid');
 HandelContinue('Docline','WReportingGroup2Id','Wdocid');
 HandelContinue('Stock','WReportingGroup1Id','WStockid');
 HandelContinue('Stock','WReportingGroup2Id','WStockid');



end;

procedure TfmGroups.Clearimage1Click(Sender: TObject);
begin
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.jpg' ) then
              DeleteFile (DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.jpg');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.bmp' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.bmp');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.gif' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.gif');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.png' ) then
              FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(TVGroups.Selected.Data))+'.png');

end;

procedure TfmGroups.PluginPopup2Click(Sender: TObject);
var
 AMessage : String ;
begin
 If TVGroups.Selected = nil  then exit ;
 If TVGroups.Selected.data = nil  then exit ;

 AMessage := 'CONTEXT=' + IntToStr(ZQGroupDescWGROUPDESCID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
end;

procedure TfmGroups.ZQGroupDescAfterScroll(DataSet: TDataSet);
begin
  if not ZQLangs.Locate('WGROUPID',ZQGroupDescWLANGUAGEID.AsInteger,[]) then exit ;
    AFreeformArray[ZQLangs.RecNo -1].Visible := true ;
    AFreeformArray[ZQLangs.RecNo -1].BringToFront ;
end;

procedure TfmGroups.ZQGroupDescAfterInsert(DataSet: TDataSet);
begin
  if ZQGroupDescWGROUPDESCID.AsInteger = 0 then
    ZQGroupDescWGROUPDESCID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_GROUPSDESC_ID');
end;

procedure TfmGroups.Griddbclick(Sender: TObject);
var
   i: Integer;
 AMessage : String ;
 ATabsheet : TTabSheet ;
begin
if (sender is TDBGrid) and Agensearch.DataSource1.DataSet.IsEmpty then exit ;
          
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) then
            begin
              TForm(AFormPluginRecordArray[i].aForm).Parent := nil ;
              TForm(AFormPluginRecordArray[i].aForm).Hide ;
            end;


 for i := PageControl1.ComponentCount -1 downto 0 do
       PageControl1.Components[i].Free ;
 if  (dmDatabase.tblGroups.State = dsinsert) or dmDatabase.tblGroups.Locate('WGROUPID',Agensearch.DataSource1.DataSet.fields[0].AsInteger,[]) then
  begin
    for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) then
            begin
              ATabsheet := TTabSheet.create(PageControl1) ;
              ATabsheet.PageControl := PageControl1 ;
              ATabsheet.Caption := TForm(AFormPluginRecordArray[i].aForm).Caption ;


              TForm(AFormPluginRecordArray[i].aForm).Parent := ATabsheet ;
              TForm(AFormPluginRecordArray[i].aForm).Align := alclient ;
              TForm(AFormPluginRecordArray[i].aForm).BorderStyle := bsNone ;
              TForm(AFormPluginRecordArray[i].aForm).Show ;
              AMessage := 'EDIT=' + IntToStr(dmDatabase.tblGroups.FieldByName('WgroupID').AsInteger) ;
              AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage));
           end;
  for i := low(AFreeformArray) to high(AFreeformArray) do
     AFreeformArray[i].EditFormCollection.Load(dmDatabase.tblGroups.FieldByName('WgroupID').AsInteger);
     SetAccessDetail(true);

 end;
end;

procedure TfmGroups.Button1Click(Sender: TObject);
var

  i: Integer;
 AMessage : String ;
begin
  for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].EditFormCollection.Load();
  dmDatabase.tblGroups.open ;
  while dmDatabase.tblGroups.Locate('SDescription',GetTextLang(1855)+IntToSTR(aInt),[LoCaseInsensitive]) do
    Inc(aInt);
  dmDatabase.tblGroups.Append;
  dmDatabase.tblGroups.FieldByName('SDescription').AsString := GetTextLang(1855)+IntToSTR(aInt);
  dmDatabase.tblGroups.FieldByName('WParentGroup2ID').ASInteger := 0;
  dmDatabase.tblGroups.FieldByName('WGroupTypeID').ASInteger := GetGrpTypeID;
  dmDatabase.tblGroups.FieldByName('WSortNo').ASInteger := dmDatabase.tblGroups.FieldByName('WgroupID').AsInteger;

  Griddbclick(self);
end;

procedure TfmGroups.Button3Click(Sender: TObject);
Var
  Node : TTreeNode;
  GroupID , i: Integer;
 AMessage : String ;
begin
if dmDatabase.tblGroups.State <> dsbrowse then
dmDatabase.tblGroups.Post ;
  for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].EditFormCollection.Save(dmDatabase.tblGroupsWGROUPID.AsInteger);
      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) then
            begin
              AMessage := 'POST=' + IntToStr(dmDatabase.tblGroupsWGROUPID.AsInteger) ;
              AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage));
           end;
SetAccessDetail(False);
 
end;

procedure TfmGroups.bCancelDetailClick(Sender: TObject);
begin
if dmDatabase.tblGroups.State <> dsbrowse then
dmDatabase.tblGroups.Cancel ;
SetAccessDetail(false);
end;

procedure TfmGroups.PluginPopupListClick(Sender: TObject);
var
 AMessage : String ;
begin
 if dmDatabase.tblGroups.IsEmpty then exit ;
 AMessage := 'CONTEXT=' + IntToStr(dmDatabase.tblGroupsWGROUPID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
end;

procedure TfmGroups.Button5Click(Sender: TObject);
begin
 if Agensearch.DataSource1.DataSet.IsEmpty then exit ;
 Griddbclick(self);
end;

procedure TfmGroups.SetAccessDetail(Isdetail : Boolean);
begin
dmDatabase.tblGroups.open ;
  if  Isdetail then
  begin
   pcnewsearch.ActivePage := tsDetail ;
    if  not(dmDatabase.tblGroups.State = dsinsert) then
        dmDatabase.tblGroups.Edit ;
    ButtonPanel.Visible := False ;
    Panel6.Visible := False ;
  end else
  begin

    pcnewsearch.ActivePage := tsSearch ;
    ButtonPanel.Visible := True ;
    Panel6.Visible := True ;
    Agensearch.aSearchPanel.SearchButton.Click;
  end;
end;

procedure TfmGroups.Button2Click(Sender: TObject);
begin
 if Agensearch.DataSource1.DataSet.IsEmpty then exit ;


 if dmDatabase.tblGroups.Locate('WGROUPID',Agensearch.DataSource1.DataSet.fields[0].AsInteger,[]) then
         begin

              dmDatabase.tblGroups.Delete;
              Agensearch.aSearchPanel.SearchButton.Click;
         end;
end;

procedure TfmGroups.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (pcmain.ActivePage = tsListview) and (pcnewsearch.ActivePage = tsDetail) then
    begin
      bCancelDetailClick(self);
    end;
end;

{ twf_TfmPluginGroups }

constructor twf_TfmPluginGroups.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'groups-plugins';
  Description := 'Edit plugins for groups screen.'+ #13+#10 +
  'grouptype holds the type value from types table.' + #13+#10 +
  'PLUGIN plugin name of the plugin to use.' + #13+#10 +
  'last id must contain a valide groupid (screen before this must be groups or a selection screen).';

  with Inparams.Add as TParam do
     begin
        Name := 'GROUPTYPE' ;
        DataType := ftinteger ;
        Value := 26 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PLUGIN' ;
        DataType := ftString ;
        Size := 255 ;
        Value := '' ;
     end;
end;

procedure twf_TfmPluginGroups.WorkflowEnd(AForm: TForm);
var

 Ins ,ImageIndex: Integer ;
 aplugin : TFormPluginRecord ;
  IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 AMessage : String ;
begin
 IsEnable := False ;
 if  LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName) <> -1 then
    begin

    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName)]);
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToGroupsRoutineName);
       if @aplugin.aLoadFormPlugin <> nil then
        begin
            aplugin.ainst := Ins ;
            @aplugin.aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @aplugin.aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @aplugin.aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @aplugin.aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @aplugin.aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if  assigned(aplugin.aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 aplugin.aPluginEnabled('GROUPS',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);

              end ;
         end;
             if not IsEnable then
                raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not found or loaded.' );
     AMessage := 'POST=' +  Inparams.ParamByName('LASTID').AsString  ;
     aplugin.aMessageFormPlugin(AForm,PChar(AMessage));
     aplugin.aUnLoadFormPlugin(AForm) ;
end;

function twf_TfmPluginGroups.WorkFlowStart: TForm;

 var

 Ins,ImageIndex : Integer ;
 aplugin : TFormPluginRecord ;
  IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 AMessage : String ;
begin
  IsEnable := false ;
 if  LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName) <> -1 then
    begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName)]);
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToDebCredRoutineName);
       if @aplugin.aLoadFormPlugin <> nil then
        begin
            aplugin.ainst := Ins ;
            @aplugin.aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @aplugin.aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @aplugin.aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @aplugin.aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @aplugin.aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if  assigned(aplugin.aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 aplugin.aPluginEnabled('GROUPS',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);

              end ;
          end;
          //   if not IsEnable then
         //       raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not found or loaded.' );

        Result := aplugin.aLoadFormPlugin(Application,'GROUPS') ;
        Result.Parent := self.Parent ;
        Result.BorderStyle := bsNone ;
        Result.align := alclient ;
        Result.Show ;


      AMessage := 'REINIT=GROUPS' +  Inparams.paramByName('GROUPTYPE').AsString  ;
      aplugin.aMessageFormPlugin(Result,PChar(AMessage));

      AMessage := 'EDIT=' +  Inparams.ParamByName('LASTID').AsString  ;
      aplugin.aMessageFormPlugin(Result,PChar(AMessage));

        if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;
end;
{ twf_TTfmGroups }

constructor twf_TTfmGroups.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'groups';
  Description := 'Edit groups screen. grouptype holds the type value from types table';
  with Inparams.Add as TParam do
     begin
        Name := 'GROUPTYPE' ;
        DataType := ftinteger ;
        Value := 26 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TTfmGroups.WorkflowEnd(AForm: TForm);
begin
  inherited;
  OutId := '0' ;
  OutSubid := '0' ;
  if TfmGroups(AForm).pcmain.ActivePageIndex = 0 then
    begin
      if  TfmGroups(AForm).TVGroups.Selected <> nil then
           OutId := IntToStr(Integer(TfmGroups(AForm).TVGroups.Selected.Data));
    end else
    begin
      if not TfmGroups(AForm).Agensearch.ZQGenSearch.IsEmpty then
           OutId := TfmGroups(AForm).Agensearch.ZQGenSearch.fieldByName('WGROUPID').AsString
    end;
 TfmGroups(AForm).close ;
 TfmGroups(AForm).free ;
end;

function twf_TTfmGroups.WorkFlowStart: TForm;
begin
   result := TfmGroups.Create(self);
   TfmGroups(result).Parent := self.Parent ;
   TfmGroups(result).BorderStyle := bsnone ;
   TfmGroups(result).Align := alClient ;
   TfmGroups(result).ForceGroup := Inparams.paramByName('GROUPTYPE').AsInteger;
   TfmGroups(result).Panel6.Visible := False ;
   TfmGroups(result).Show ;

    if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;

end;
procedure TfmGroups.bgrnewClick(Sender: TObject);
Var
  Node : TTreeNode;
  GroupID , i: Integer;
var
 AMessage : String ;
begin
  cbEnabled.SetFocus ;
  isNewGoup := True ;


  for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].EditFormCollection.Load();

  if  TVGroups.Selected = nil Then exit;

  while dmDatabase.tblGroups.Locate('SDescription',GetTextLang(1855)+IntToSTR(aInt),[LoCaseInsensitive]) do
    Inc(aInt);


  GroupID := Integer(TVGroups.Selected.Data) ;
  Node := TVGroups.Items.AddChild(TVGroups.Selected , GetTextLang(1855)+IntToSTR(aInt));
  Node.ImageIndex := -1 ;
  Node.SelectedIndex := -1 ;
  Node.Selected:=True;
  dmDatabase.tblGroups.Append;
  dmDatabase.tblGroups.FieldByName('SDescription').AsString := GetTextLang(1855)+IntToSTR(aInt);
  dmDatabase.tblGroups.FieldByName('WParentGroup2ID').ASInteger := GroupID;
  dmDatabase.tblGroups.FieldByName('WGroupTypeID').ASInteger := GetGrpTypeID;
  dmDatabase.tblGroups.FieldByName('WSortNo').ASInteger := dmDatabase.tblGroups.FieldByName('WgroupID').AsInteger;
  dmDatabase.tblGroups.Post;
  Node.Data :=  TObject(dmDatabase.tblGroups.FieldByName('WGroupID').AsInteger);

      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) then
            begin
              TForm(AFormPluginRecordArray[i].aForm).Show ;
              AMessage := 'EDIT=' + IntToStr(Integer(TVGroups.Selected.data)) ;

              AFormPluginRecordArray[i].aMessageFormPlugin(TForm(AFormPluginRecordArray[i].aForm),PChar(AMessage));
              AMessage := 'POST=' + IntToStr(Integer(TVGroups.Selected.data)) ;
              AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage));
              TForm(AFormPluginRecordArray[i].aForm).Hide ;
           end;





  Translations1Click(nil);
  if not TVGroups.Selected.Expanded then
    TVGroups.Selected.Expand(False);
  Node.EditText;
end;

procedure TfmGroups.bgreditClick(Sender: TObject);
begin
  if InvalideNode Then exit;
  if TVGroups.Selected<>nil then
    TVGroups.Selected.EditTExt;
end;

procedure TfmGroups.bgrdeleteClick(Sender: TObject);
  procedure RecurseChilds(ANode : TTreeNode );
  var
   i : Integer ;
  begin

     for i := ANode.Count -1 downto 0 do
       begin
          RecurseChilds(ANode.Item[i]);
       end;
       if dmDatabase.tblGroups.Locate('WGroupID',Integer(ANode.data),[]) then
         begin
              CheckDelete ;
              dmDatabase.tblGroups.Delete;
              ANode.Delete;
         end;
  end;
begin
  if InvalideNode Then exit;
  if OSFMessageDlg(Format(DMTCCoreLink.GetTextLang(2881),[edtGroupName.Text + ' :' + TVGroups.selected.Text]) ,mtConfirmation,[mbyes,mbno],0) = mryes then
     RecurseChilds(TVGroups.Selected) ;

end;

procedure TfmGroups.bgrMoveUpClick(Sender: TObject);
begin
 MoveUpDown(True);
end;

procedure TfmGroups.bGrMoveDownClick(Sender: TObject);
begin
 MoveUpDown(False);
end;

procedure TfmGroups.GroupControlChange(Sender: TObject);
begin

    CheckGrpAndLoad;

  try
  if edtGroupName.Focused then
    TVGroups.SetFocus ;
  except
  end;
  EdtGroupName.Text :=   trim(VarToStr(OpenSqlAndGetFirtsColumnValue('select SDescription from TYPES  where WTypeID =' + IntToStr(GroupControl.ActivePage.tag))));
  EdtGroupName.Visible:=True;

end;

initialization
 twf_TTfmGroups.create(nil);
 twf_TfmPluginGroups.create(nil);


end.

