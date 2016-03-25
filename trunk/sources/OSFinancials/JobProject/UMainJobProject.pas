unit UMainJobProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,   DBAccess , Uni, 
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Mask,
   UOSFVisuals,InvoiceEntryGrid, Buttons,
  ComCtrls,UPluginsSharedUnit, Menus, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit,    cxImageComboBox;

type
twf_TJobProject  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;

  TJobProject = class(TForm)
    ZQJobProject: TuniQuery;
    DSJobProject: TDataSource;
    ZUsqlJobProject: TUniUpdateSql;
    PEditButtons: TPanel;
    BNew: TButton;
    BDelete: TButton;
    BEdit: TButton;
    BSave: TButton;
    BCancel: TButton;
    BReport: TButton;
    CBReport: TComboBox;
    ScrollBox1: TScrollBox;
    PageControl2: TPageControl;
    tsList: TTabSheet;
    DBGrid1: TDBGrid;
    PSearch: TPanel;
    tsDetail: TTabSheet;
    PageControl1: TPageControl;
    tsDocuments: TTabSheet;
    Panel1: TPanel;
    LCode: TLabel;
    LDescription: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LEnabled: TLabel;
    LStatus: TLabel;
    DBECode: TDBEdit;
    DBEDesc: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    tsTransactions: TTabSheet;
    wwqryOpenCredits: TuniQuery;
    wwqryOpenCreditsWTRANSACTIONID: TIntegerField;
    wwqryOpenCreditsSREFERENCE: TStringField;
    wwqryOpenCreditsDDATE: TDateTimeField;
    wwqryOpenCreditsFAMOUNT: TFloatField;
    wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenCreditsSDESCRIPTION: TStringField;
    wwqryOpenCreditsBUNUSED: TSmallintField;
    wwqryOpenCreditsISLINKED: TIntegerField;
    wwqryOpenDebits: TuniQuery;
    wwqryOpenDebitsWTRANSACTIONID: TIntegerField;
    wwqryOpenDebitsSREFERENCE: TStringField;
    wwqryOpenDebitsDDATE: TDateTimeField;
    wwqryOpenDebitsFAMOUNT: TFloatField;
    wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenDebitsSDESCRIPTION: TStringField;
    wwqryOpenDebitsBUNUSED: TSmallintField;
    wwqryOpenDebitsISLINKED: TIntegerField;
    dswwqryOpenDebits: TDataSource;
    dswwqryOpenCredits: TDataSource;
    PnlPlain: TPanel;
    Splitter1: TSplitter;
    pnlLeft: TPanel;
    wwdbgDebits: TDBGrid;
    Panel2: TPanel;
    pnlRight: TPanel;
    Panel3: TPanel;
    wwqryOpenCreditsSACCOUNTCODE: TStringField;
    wwqryOpenCreditsSACCDESCRIPTION: TStringField;
    wwqryOpenDebitsSACCOUNTCODE: TStringField;
    wwqryOpenDebitsSACCDESCRIPTION: TStringField;
    PopupMenu1: TPopupMenu;
    Deletefromproject1: TMenuItem;
    Addtoproject1: TMenuItem;
    wwdbgCredits: TDBGrid;
    tsProjectQuote2: TTabSheet;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    Splitter2: TSplitter;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BQadd: TButton;
    ZQQuotes: TuniQuery;
    dsQuotes: TDataSource;
    BqEdit: TButton;
    Panel5: TPanel;
    bDocAdd: TButton;
    BDocEdit: TButton;
    DBGrid3: TDBGrid;
    ZQDocs: TuniQuery;
    dsDocs: TDataSource;
    cbType: TComboBox;
    lType: TLabel;
    dbeEndDate: TcxDBDateEdit;
    dbeStartDate: TcxDBDateEdit;
    CbJobcode2: TcxDBImageComboBox;
    procedure FormShow(Sender: TObject);
    procedure ZQJobProjectAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BReportClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ZQJobProjectBeforeOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Deletefromproject1Click(Sender: TObject);
    procedure Addtoproject1Click(Sender: TObject);
    procedure wwdbgDebitsTitleClick(Column: TColumn);
    procedure wwdbgCreditsTitleClick(Column: TColumn);
    procedure ZQJobProjectAfterScroll(DataSet: TDataSet);
    procedure ZQJobProjectWDEFAULTACCOUNTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure EditAccClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ZQJobProjectAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BQaddClick(Sender: TObject);
    procedure BqEditClick(Sender: TObject);
    procedure ZQQuotesAfterOpen(DataSet: TDataSet);
    procedure bDocAddClick(Sender: TObject);
    procedure BDocEditClick(Sender: TObject);
    procedure ZQDocsAfterOpen(DataSet: TDataSet);
    procedure DBGrid3DblClick(Sender: TObject);
protected
    Procedure CreateParams(var Params :TCreateParams); override;
  private
    aSearchPanel : TSearchPanel ;
    AFormPluginRecordArray : array [0..9] of TFormPluginRecord ;
    procedure SearchClick(Sender: TObject);
    procedure SetButtons;
    procedure initPlugins;
    procedure SendMessageToPlugin(AMessage: String);

    { Private declarations }
  public
    { Public declarations }
    APluginsFormsList : TStringlist ;
 

    // aprojectEntryGrid : TfmInvoiceEntryGrid ;
    OrderBy : Integer ;
    Direction : Boolean ;
    procedure LoadReports;
    procedure LoadReportOp ;
    procedure SaveReportOp ;
  end;

var
  JobProject: TJobProject;

implementation

uses UDMTCCoreLink,  DatabaseAccess, Main, Types, FreeReportsUnit,
  OSFGeneralRoutines, TcashClasses, DateUtils, TAccountView, osfLookup,
  UDmQuantumGridDefs;

{$R *.dfm}


procedure TJobProject.SendMessageToPlugin(AMessage: String);
var
 i : Integer ;
begin
  for i := 0 to  APluginsFormsList.Count -1 do
    begin
      AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage));
    end;
end;

procedure TJobProject.initPlugins;
var
 ArrayImageIndex : Array [0..9] of integer ;
 procedure Init;
    var
     i,ImageIndex  :  Integer ;
     AForm: TForm ;
     APage : TTabSheet ;
     ReturnString : Array [0..1025] of char ;
     APChar : PChar ;

    begin
      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormPluginRecordArray[i].aMessageGetDisplayText <> nil) then

          begin
             ImageIndex := 25 ;
             APChar := ReturnString ;
             AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'');
             AFormPluginRecordArray[i].aForm := AForm ;
              if ArrayImageIndex[i] > -1 then
              begin
                 APage :=  TTabSheet.Create(self) ;
                 APage.PageControl := PageControl1;
                // APage.ImageIndex := ArrayImageIndex[i] ;
                 // APage.set
                // ToolBar1.ButtonCount -1 ;

                 AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
                 APage.Caption :=  ReturnString ;
                 APage.Tag := Integer(AForm);
                 AForm.Parent := APage ;
                 AForm.Show ;
                 AForm.BorderStyle := bsNone ;
                 AForm.Align := alClient;
             end;
             APluginsFormsList.AddObject(aform.Name,AForm);
          end;
    end;

var
 i , IncArr,Ins,ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 9 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       IsEnable := true ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToMainProjectRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);

            ArrayImageIndex[IncArr] := 25 ;
            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('PROJ',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 ArrayImageIndex[IncArr] := ImageIndex ;
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
              @AFormPluginRecordArray[IncArr].aContextmenuEnabled   := nil ;
              AFormPluginRecordArray[IncArr].aForm := nil ;
            end;
        end;
    end;
 init ;
end;


//Implementation of CreateParams Procedure
procedure TJobProject.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Params.ExStyle := Params.ExStyle OR WS_EX_APPWINDOW;
//  Params.WndParent := Application.Handle;
end;

procedure TJobProject.FormShow(Sender: TObject);
begin
 LoadReports ;
 LoadReportOp ;

 TDataBaseDocumentRoutines.LoadDocTypes(cbType.Items,False,True);
 cbType.ItemIndex := 0 ;
 Caption := DMTCCoreLink.gettextlang(3099);
 ZQJobProject.Connection := DMTCCoreLink.TheZConnection ;
 BEdit.Caption := DMTCCoreLink.gettextlang(121);
 BCancel.Caption := DMTCCoreLink.gettextlang(168);
 BNew.Caption := DMTCCoreLink.gettextlang(983);
 BDelete.Caption := DMTCCoreLink.gettextlang(984);
 BSave.Caption := DMTCCoreLink.gettextlang(726);
 TDatabaseTableRoutines.FillStringsWithReportingGroups(CbJobcode2.Properties,1000);
 SearchClick(nil);


 tsProjectQuote2.Caption :=  DMTCCoreLink.gettextlang(3556) + ' ' + DMTCCoreLink.gettextlang(3330) ;

  tsDocuments.Caption := DMTCCoreLink.gettextlang(38);
 tsTransactions.Caption := DMTCCoreLink.gettextlang(20069);

 wwdbgDebits.Columns[0].Title.Caption := DMTCCoreLink.gettextlang(605);
 wwdbgDebits.Columns[1].Title.Caption := DMTCCoreLink.gettextlang(34);
 wwdbgDebits.Columns[2].Title.Caption := DMTCCoreLink.gettextlang(607);
 wwdbgDebits.Columns[3].Title.Caption := DMTCCoreLink.gettextlang(1708);
 wwdbgDebits.Columns[4].Title.Caption := DMTCCoreLink.gettextlang(238);
 wwdbgDebits.Columns[5].Title.Caption := DMTCCoreLink.gettextlang(946);

 wwdbgCredits.Columns[0].Title.Caption := DMTCCoreLink.gettextlang(605);
 wwdbgCredits.Columns[1].Title.Caption := DMTCCoreLink.gettextlang(34);
 wwdbgCredits.Columns[2].Title.Caption := DMTCCoreLink.gettextlang(607);
 wwdbgCredits.Columns[3].Title.Caption := DMTCCoreLink.gettextlang(1708);
 wwdbgCredits.Columns[4].Title.Caption := DMTCCoreLink.gettextlang(238);
 wwdbgCredits.Columns[5].Title.Caption := DMTCCoreLink.gettextlang(946);


Panel2.Caption := DMTCCoreLink.gettextlang(211);
Panel3.Caption :=DMTCCoreLink.gettextlang(212);


LCode.Caption := DMTCCoreLink.gettextlang(605);
LEnabled.Caption:= DMTCCoreLink.gettextlang(1322);
LDescription.Caption := DMTCCoreLink.gettextlang(1708);
Label3.Caption := DMTCCoreLink.gettextlang(577);
Label4.Caption := DMTCCoreLink.gettextlang(901014);
LStatus.Caption := DMTCCoreLink.gettextlang(1293);


DBGrid2.Columns[0].Title.Caption := DMTCCoreLink.gettextlang(238);
DBGrid2.Columns[1].Title.Caption := DMTCCoreLink.gettextlang(1120);
DBGrid2.Columns[2].Title.Caption := DMTCCoreLink.gettextlang(607);
DBGrid2.Columns[3].Title.Caption := DMTCCoreLink.gettextlang(651);
DBGrid2.Columns[4].Title.Caption := DMTCCoreLink.gettextlang(650);
DBGrid2.Columns[5].Title.Caption := DMTCCoreLink.gettextlang(1138);


DBGrid3.Columns[0].Title.Caption := DMTCCoreLink.gettextlang(238);
DBGrid3.Columns[1].Title.Caption := DMTCCoreLink.gettextlang(1120);
DBGrid3.Columns[2].Title.Caption := DMTCCoreLink.gettextlang(607);
DBGrid3.Columns[3].Title.Caption := DMTCCoreLink.gettextlang(651);
DBGrid3.Columns[4].Title.Caption := DMTCCoreLink.gettextlang(650);
DBGrid3.Columns[5].Title.Caption := DMTCCoreLink.gettextlang(1138);
BQadd.Caption := DMTCCoreLink.gettextlang(983);
BqEdit.Caption := DMTCCoreLink.gettextlang(121);
bDocAdd.Caption := DMTCCoreLink.gettextlang(983);
BDocEdit.Caption := DMTCCoreLink.gettextlang(121);

end;

procedure TJobProject.ZQJobProjectAfterInsert(DataSet: TDataSet);
begin
  ZQJobProject.FieldByName('WJOBPROJECTID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNewJOBPROJECTID) ;
  ZQJobProject.FieldByName('BENABLED').AsInteger := 1 ;
  ZQJobProject.FieldByName('DStartdate').AsDateTime := Today ;

end;

procedure TJobProject.SearchClick(Sender: TObject);
var
 AClause : String ;
 i : Integer ;
begin
 AClause := aSearchPanel.GetClause  ;
 if  aSearchPanel.DefSql <> '' then
  ZQJobProject.SQL.Text :=aSearchPanel.DefSql else
  ZQJobProject.SQL.Text := 'Select p.*, p.SJOBPROJECTCODE TRN2123, p.SDESCRIPTION TRN178, '+
  ' DSTARTDATE TRN577, DENDDATE TRN579, BENABLED TRN1322 , s.SDESCRIPTION TRN1293  from JOBPROJECT p left join GROUPs s on p.WSTATUSID = s.WGROUPID' ;
  

 if AClause <> '' then
   ZQJobProject.SQL.add('where ' + AClause );
  if OrderBy <> 0 then
    begin
      if Direction then
      ZQJobProject.SQL.add('order by ' +IntToStr(OrderBy)  )
      else
      ZQJobProject.SQL.add('order by ' +IntToStr(OrderBy) +' desc' ) ;

    end;
 ZQJobProject.open ;
 for i := 0 to DBGrid1.Columns.Count -1 do
   begin
      if  pos(String('TRN'),String(DBGrid1.Columns[i].FieldName)) = 1 then
        begin
          DBGrid1.Columns[i].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(copy(DBGrid1.Columns[i].FieldName,4,length(DBGrid1.Columns[i].FieldName)),0));
        end else
        begin
           DBGrid1.Columns[i].Visible := false ;
        end;

   end;

 SetButtons ;
 aSearchPanel.SaveCollection ;
 if PSearch.Width < 5 then
    PSearch.Width := 5 ;
end;


procedure TJobProject.SetButtons ;
begin
  //
// afmInvoiceEntryGrid.Align := alClient ;
// afmInvoiceEntryGrid.BNew.Visible := DBCheckBox1.Checked ;

 // aprojectEntryGrid.Align := alClient ;
 // aprojectEntryGrid.BNew.Visible := DBCheckBox1.Checked ;

 CbJobcode2.Enabled :=  DBCheckBox1.Checked ;
 DBECode.Enabled :=  DBCheckBox1.Checked ;
 DBEDesc.Enabled :=  DBCheckBox1.Checked ;
 dbeStartDate.Enabled :=  DBCheckBox1.Checked ;
 dbeEndDate.Enabled :=  DBCheckBox1.Checked ;
  if PageControl2.ActivePageIndex = 1  then
   begin
    // afmInvoiceEntryGrid.BringToFront ;
    CbJobcode2.ShowHint := true ;
    CbJobcode2.Hint := TDataBaseDocumentRoutines.GetGroupHistoryText(1000,ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger);
    end else
    begin
     // afmInvoiceEntryGrid.SendToBack ;
   end;
  // pDocuments.Visible := nbJobproject.PageIndex = 1 ;
  BNew.Enabled :=  PageControl2.ActivePageIndex = 0 ;
  BDelete.Enabled := not ZQJobProject.IsEmpty ;
//  if BDelete.Enabled then
//     BDelete.Enabled := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from dochead where Wjobcodeid = '  + ZQJobProject.FieldByName('WJOBPROJECTID').AsString )) = '0';
  BEdit.Enabled := not ZQJobProject.IsEmpty and (ZQJobProject.State = dsbrowse) ;
  BSave.Enabled := ZQJobProject.State <> dsbrowse ;
  BCancel.Enabled := ZQJobProject.State <> dsbrowse ;
end;


procedure TJobProject.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
 APluginsFormsList := TStringlist.create ;
 aSearchPanel := TSearchPanel.Create(self) ;
 aSearchPanel.Parent := PSearch;
 aSearchPanel.Align := alclient ;
 aSearchPanel.onSearch := SearchClick ;
 aSearchPanel.ViewType :=  vtCompact ;
 aSearchPanel.SetLookupType(DMTCCoreLink.ReadSysParam('PROJECTLOOKUP','PROJECTS',DMTCCoreLink.CurrentUser));
 aSearchPanel.ScaleBy(screen.PixelsPerInch,96);
 //nbJobproject.PageIndex := 0 ;
 // afmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(Application);
 // afmInvoiceEntryGrid.name := 'DocProjects' ;
 // afmInvoiceEntryGrid.Parent := tsDocuments ; //pDocuments ;
{ afmInvoiceEntryGrid.show ;
 afmInvoiceEntryGrid.BorderStyle := bsNone ;
 afmInvoiceEntryGrid.StatusBar.Align := alTop ;
 afmInvoiceEntryGrid.StatusBar.Parent := afmInvoiceEntryGrid ;
 afmInvoiceEntryGrid.StatusBar.Font.Size := 14 ;
 afmInvoiceEntryGrid.BitBtnCancel.Visible := false ;
 afmInvoiceEntryGrid.BitBtn1.Visible := false ;
 afmInvoiceEntryGrid.BtnClose2.Visible := false ;

 afmInvoiceEntryGrid.SendToBack ;
       }
 {
 aprojectEntryGrid := TfmInvoiceEntryGrid.Create(Application);


 aprojectEntryGrid.ForceDocType := 1000 ;
 aprojectEntryGrid.Parent := tsProjectQuote ; //pDocuments ;
 aprojectEntryGrid.show ;
 aprojectEntryGrid.BorderStyle := bsNone ;
 aprojectEntryGrid.StatusBar.Align := alTop ;
 aprojectEntryGrid.StatusBar.Parent := aprojectEntryGrid ;
 aprojectEntryGrid.StatusBar.Font.Size := 14 ;
 aprojectEntryGrid.BitBtnCancel.Visible := false ;
 aprojectEntryGrid.BitBtn1.Visible := false ;
 aprojectEntryGrid.BtnClose2.Visible := false ;
 aprojectEntryGrid.SendToBack ;
                                }
  tsList.TabVisible := false ;
  tsDetail.TabVisible := false ;

  tsDocuments.Caption := DMTCCoreLink.GetTextLang(38) ;

 PageControl2.ActivePageIndex := 0 ;
 PageControl1.ActivePageIndex := 0 ;
 initPlugins ;


 
end;

procedure TJobProject.BEditClick(Sender: TObject);
begin
{ if  aprojectEntryGrid.NBDocuments.PageIndex = 1 then
     begin
        aprojectEntryGrid.InGrid :=False ;
        aprojectEntryGrid.BtnCloseClick(self);
     end;
     

 aprojectEntryGrid.BtnClose.Visible := False ;
 aprojectEntryGrid.BtnOkPrint.Visible := False ;
 aprojectEntryGrid.BtnClose.Enabled := False ;
 aprojectEntryGrid.BtnOkPrint.Enabled := False ;
                                     }
 tsProjectQuote2.TabVisible := ZQJobProject.FieldByName('WDEFAULTACCOUNT').AsInteger <> 0 ;
 if ZQJobProject.IsEmpty then exit ; 
 PageControl2.ActivePageIndex := 1 ;
 ZQJobProject.Edit ;


 SetButtons ;
 SendMessageToPlugin('EDIT='+InttoStr(ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger) );
 PageControl1Change(self);
end;

procedure TJobProject.BNewClick(Sender: TObject);
begin
  {
 if  aprojectEntryGrid.NBDocuments.PageIndex = 1 then
     begin
       aprojectEntryGrid.InGrid :=False ;
       aprojectEntryGrid.BtnCloseClick(self);
     end;                              }
 tsProjectQuote2.TabVisible := False ;    
 ZQJobProject.Insert ;
 PageControl2.ActivePageIndex := 1 ;
 ZQJobProject.FieldByName('SJOBPROJECTCODE').AsString := FormatFloat('00000000',ZQJobProject.FieldByName('WJOBPROJECTID').AsInteger);
 SetButtons ;
 SendMessageToPlugin('NEW=0' );
  PageControl1Change(self);
end;

procedure TJobProject.BDeleteClick(Sender: TObject);
begin
if StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from transact where WJobcodeid = '  +  ZQJobProject.FieldByName('WJOBPROJECTID').AsString )),0) <> 0 then
 begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(3349) ,mtError,[mbyes,mbno],0) = mrno then
     Exit ;
 end;
if StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from dochead where WJobcodeid = '  +  ZQJobProject.FieldByName('WJOBPROJECTID').AsString )),0) <> 0 then
 begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(3350) ,mtError,[mbyes,mbno],0) = mrno then
     Exit ;

 end;


if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(642),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

 ZQJobProject.Delete ;
 SetButtons ;
 BCancelClick(self);
end;

procedure TJobProject.BSaveClick(Sender: TObject);
begin
 // check to see if its closing..
 // see if its a opendoc
 {if  afmInvoiceEntryGrid.NBDocuments.PageIndex = 1 then
     begin
     afmInvoiceEntryGrid.InGrid :=False ;
      afmInvoiceEntryGrid.BtnOkPrintClick(nil);
      exit ;
     end;  }
 {if  aprojectEntryGrid.NBDocuments.PageIndex = 1 then
     begin
      aprojectEntryGrid.InGrid :=False ;
      aprojectEntryGrid.BtnOkPrintClick(nil);
   //   exit ;
     end; }





 If not DBCheckBox1.Checked then
    begin
       if StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from dochead where WJobcodeid = '  +  ZQJobProject.FieldByName('WJOBPROJECTID').AsString + 'and Bposted = 0 and WTypeid in (10,11,12,13)')),0) <> 0 then
        begin
         OSFMessageDlg(DMTCCoreLink.GetTextLang(3351),mtError,[mbok],0);
         Exit ;
        end;
       if ZQJobProject.FieldByName('DENDDATE').IsNull then
         ZQJobProject.FieldByName('DENDDATE').AsDateTime := Today ;
    end;
 ZQJobProject.Post ;
 SendMessageToPlugin('POST='+InttoStr(ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger) );
 PageControl2.ActivePageIndex := 0 ;
 SearchClick(self);
end;

procedure TJobProject.BCancelClick(Sender: TObject);
begin
 {if  aprojectEntryGrid.NBDocuments.PageIndex = 1 then
     begin
       aprojectEntryGrid.InGrid :=False ;
       aprojectEntryGrid.BtnCloseClick(self);
     end; }
 ZQJobProject.Cancel ;
 PageControl2.ActivePageIndex := 0 ;
 SetButtons ;
end;

procedure TJobProject.FormDestroy(Sender: TObject);
var
 i : Integer ;
begin

 for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray)  do
    begin
      if AFormPluginRecordArray[i].aForm <> nil then
         AFormPluginRecordArray[i].aUnLoadFormPlugin(TForm(AFormPluginRecordArray[i].aForm));
    end;

 SaveReportOp ;

end;

procedure TJobProject.BReportClick(Sender: TObject);
var
 Docname,Clause : String ;
 SelectedPinter : String ;
begin

if Integer(CBReport.Items.Objects[CBReport.ItemIndex]) = 0 then
   Docname := '..\PROJECTS\' + CBReport.Items[CBReport.ItemIndex]
   else
   Docname := '..\PROJECTS\LANG_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));
Clause := aSearchPanel.GetClause ;
if Clause = '' then Clause := ' 1 = 1';

SelectedPinter := '0' ;
 if not FileExists(DMTCCoreLink.GetLocalBaseDir +  'plug_ins\reports\REPORTS\PROJECTS\'+ Docname +'.rep') then
   if not FileExists(ExtractFilePath(Application.ExeName ) +  'plug_ins\reports\REPORTS\PROJECTS\'+ Docname +'.rep') then
     Docname := '..\PROJECTS\TRN_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));


CheckReportMan(0,0,1,0,'OSFPRINTER=' + SelectedPinter + #13+#10+ 'SQL=' +Clause + #13+#10 + 'CURID=' + ZQJobProject.FieldByName('WJOBPROJECTID').AsString   ,Docname,'REPORTS','plug_ins\reports');
end;

procedure TJobProject.LoadReportOp;
begin
 CBReport.ItemIndex :=  DMTCCoreLink.ReadNwReportOp('ProjectSelectedReport',0) ;
end;

procedure TJobProject.SaveReportOp;
begin
  DMTCCoreLink.WriteNwReportOp('ProjectSelectedReport',IntToStr(CBReport.ItemIndex)) ;
end;

procedure TJobProject.LoadReports;
Var
 ASearchRec : TSearchRec ;
 NumText : String  ;
begin
  CBReport.clear ;

    if FindFirst(DMTCCoreLink.GetLocalPluginDir + 'reports\REPORTS\PROJECTS\*.rep', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        if pos('LANG_',ASearchRec.name) = 1 then
          begin
            NumText := copy(ChangeFileExt(ASearchRec.name,''),6,20);
            CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToInt(NumText)),TObject(StrToInt(NumText)));
          end else
        if pos('TRN_',ASearchRec.name) = 1 then
          begin
            NumText := copy(ChangeFileExt(ASearchRec.name,''),5,20);
            CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToInt(NumText)),TObject(StrToInt(NumText)));
          end else
          begin
             CBReport.Items.Add(ChangeFileExt(ASearchRec.name,''));
          end;
      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;
  if CBReport.Items.Count <> 0 then
   CBReport.ItemIndex := 0 ;
end;

procedure TJobProject.DBGrid1TitleClick(Column: TColumn);
begin
  if OrderBy <> Column.Field.Index +1 then
   begin
     OrderBy := Column.Field.Index +1 
   end else
   Direction := not direction ;
   SearchClick(self);
end;

procedure TJobProject.ZQJobProjectBeforeOpen(DataSet: TDataSet);
begin
//  DMTCCoreLink.InitFieldLengtsForDatasetfields(ZQJobProject,'Select * from JOBPROJECT where WJOBPROJECTID is null');
end;

procedure TJobProject.FormResize(Sender: TObject);
begin

       if SCrollbox1.Width < 643 then
         begin
            SCrollbox1.HorzScrollBar.Range := 643;
         end;


       if SCrollbox1.Height < 384 then
         begin
            SCrollbox1.VertScrollBar.Range := 384;
         end;

end;

procedure TJobProject.PageControl1Change(Sender: TObject);
begin

 if PageControl1.ActivePage = tsDocuments then
 begin
    ZQDocs.close ;
    ZQDocs.Params[0].AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger  ;
    ZQDocs.open ;
  end else if PageControl1.ActivePage = tsProjectQuote2 then
 begin
    ZQQuotes.close ;
    ZQQuotes.Params[0].AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger  ;
    ZQQuotes.open ;
 end;
 {end else if PageControl1.ActivePage = tsProjectQuote then
 begin
  if aprojectEntryGrid.NBDocuments.PageIndex = 0 then
   begin
     aprojectEntryGrid.fProjectId := 0 ;
     aprojectEntryGrid.ProjectId := ZQJobProject.FieldByName('WJOBPROJECTID').AsInteger ;
     aprojectEntryGrid.AddInvoiceForAccount := ZQJobProject.FieldByName('WDEFAULTACCOUNT').AsInteger   ;

   if aprojectEntryGrid.QDocHead.IsEmpty then
    aprojectEntryGrid.BNewClick(self)
    else
    aprojectEntryGrid.BEditClick(self);
    aprojectEntryGrid.BtnClose.Visible := False ;
    aprojectEntryGrid.BtnOkPrint.Visible := False ;
    aprojectEntryGrid.BtnClose.Enabled := False ;
    aprojectEntryGrid.BtnOkPrint.Enabled := False ;


   end; 
 end;   }

 if PageControl1.ActivePage = tsTransactions then
   begin
    wwqryOpenCredits.close ;
    wwqryOpenCredits.Params[0].AsInteger := ZQJobProject.FieldByName('WJOBPROJECTID').AsInteger ;
    wwqryOpenCredits.Open ;
    wwqryOpenDebits.close ;
    wwqryOpenDebits.Params[0].AsInteger := ZQJobProject.FieldByName('WJOBPROJECTID').AsInteger ;
    wwqryOpenDebits.Open ;
   end;
end;

procedure TJobProject.Deletefromproject1Click(Sender: TObject);
var
   i : Integer ;
begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(642),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

  if PopupMenu1.PopupComponent = wwdbgDebits then
    if not wwqryOpenDebits.IsEmpty then
      begin
         if wwdbgDebits.SelectedRows.Count <> 0 then
           begin
             for i := 0 to wwdbgDebits.SelectedRows.Count -1 do
               begin
                wwqryOpenDebits.Bookmark := wwdbgDebits.SelectedRows[i] ;
                ExecSql('Update transact set WJOBCODEID = null where WTransactionId =' + wwqryOpenDebitsWTRANSACTIONID.AsString  ) ;
              end;
           end else
         ExecSql('Update transact set WJOBCODEID = null where WTransactionId =' + wwqryOpenDebitsWTRANSACTIONID.AsString  ) ;
      end;


  if PopupMenu1.PopupComponent = wwdbgCredits then
    if not wwqryOpenCredits.IsEmpty then
      begin
         if wwdbgCredits.SelectedRows.Count <> 0 then
           begin
             for i := 0 to wwdbgCredits.SelectedRows.Count -1 do
               begin
                wwqryOpenCredits.Bookmark := wwdbgCredits.SelectedRows[i] ;
                ExecSql('Update transact set WJOBCODEID = null where WTransactionId =' + wwqryOpenCreditsWTRANSACTIONID.AsString  ) ;
              end;
           end else
         ExecSql('Update transact set WJOBCODEID = null where WTransactionId =' + wwqryOpenCreditsWTRANSACTIONID.AsString  ) ;
      end;
 PageControl1Change(self);     
end;

procedure TJobProject.Addtoproject1Click(Sender: TObject);
var
 afmTAccountView : TfmTAccountView ;
 i : Integer ;
begin
afmTAccountView := TfmTAccountView.create(self) ;
try
 afmTAccountView.GoSubSql := '   (wjobcodeid is null) or (wjobcodeid =0) ' ;
 afmTAccountView.BtnOk.ModalResult := mrok ;
 afmTAccountView.BtnOk.OnClick := nil ;
 afmTAccountView.wwDBGrid1.Options := afmTAccountView.wwDBGrid1.Options + [dbgrids.dgMultiSelect] ;
 afmTAccountView.DtStart.DateTime := dbeStartDate.Date ;
 afmTAccountView.dtEndDate.DateTime := date ;
 if afmTAccountView.showmodal = mrOk then
     begin
       if not afmTAccountView.ADetailDataset.IsEmpty then
          begin
            if  afmTAccountView.wwDBGrid1.SelectedRows.Count <> 0 then
              begin
                For i := 0 to afmTAccountView.wwDBGrid1.SelectedRows.Count -1 do
                  begin
                     afmTAccountView.ADetailDataset.Bookmark := afmTAccountView.wwDBGrid1.SelectedRows[i] ;
                     ExecSql('Update transact set WJOBCODEID = ' + ZQJobProject.FieldByName('WJOBPROJECTID').AsString +  ' where WTransactionId =' + afmTAccountView.ADetailDataset.fieldByName('WTRANSACTIONID').AsString ) ;
                  end;
              end else
              begin
                ExecSql('Update transact set WJOBCODEID = ' + ZQJobProject.FieldByName('WJOBPROJECTID').AsString +  ' where WTransactionId =' + afmTAccountView.ADetailDataset.fieldByName('WTRANSACTIONID').AsString ) ;
              end;
          end;
     end;
finally
 afmTAccountView.free ;
end;

PageControl1Change(self);
end;

procedure TJobProject.wwdbgDebitsTitleClick(Column: TColumn);
begin
if wwqryOpenDebits.Active then
  if wwqryOpenDebits.IndexFieldNames <> Column.FieldName then
    begin
     wwqryOpenDebits.IndexFieldNames := Column.FieldName ;
    end else
    begin
        wwqryOpenDebits.IndexFieldNames := Column.FieldName +' desc';
    end;
end;

procedure TJobProject.wwdbgCreditsTitleClick(Column: TColumn);
begin
if wwqryOpenCredits.Active then
  if wwqryOpenCredits.IndexFieldNames <> Column.FieldName then
    begin
     wwqryOpenCredits.IndexFieldNames := Column.FieldName ;
    end else
    begin
       wwqryOpenCredits.IndexFieldNames := Column.FieldName+' desc';
    end;
end;

procedure TJobProject.ZQJobProjectAfterScroll(DataSet: TDataSet);
begin
 SetButtons ;
end;

{ twf_TJobProject }

constructor twf_TJobProject.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'projects';
  Description := 'Projects add edit screen.';
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TJobProject.WorkflowEnd(AForm: TForm);
begin

 OutId := '0' ;
  OutSubid := '0' ;
  if  not TJobProject(AForm).ZQJobProject.IsEmpty then
    OutId := TJobProject(AForm).ZQJobProject.FieldByname('WJOBPROJECTID').AsString ;
  aform.free ;
end;

function twf_TJobProject.WorkFlowStart: TForm;
var
 aform : TJobProject ;
begin
 try
  aform := TJobProject.create(nil) ;
  Result := aform ;
  Aform.parent := self.parent ;
  Aform.Show ;


  Aform.Align := alClient ;
  Aform.BorderStyle := bsNone ;

  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
      begin
         Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
      end;

 Except
   on e: Exception do
    begin
       aform.free ;
       raise Exception.Create('Workflow:'+ Displayname +'->' +  e.Message );
    end;
 end;
end;
procedure TJobProject.ZQJobProjectWDEFAULTACCOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if Sender.AsInteger <> 0 then
   Text := DMTCCoreLink.AccObject.getAccountFullDescription(Sender.AsInteger) ;
end;

procedure TJobProject.EditAccClick(Sender: TObject);
var
 ReturnID : Integer ;
 ReturnStr : String ;
begin
 if TDBEdit(Sender).DataSource.DataSet.IsEmpty then
  TDBEdit(Sender).DataSource.DataSet.Insert else
  TDBEdit(Sender).DataSource.DataSet.Edit ;

  TDBEdit(Sender).Color := clHighlight;
  try

    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Debtor','PRJDB',tcstDEB,tcltAccount,TdbEdit(Sender).Field.AsInteger,0,'');


    If ReturnStr = 'ESC' then
     begin
      TdbEdit(Sender).Field.Clear ;
      TDBEdit(Sender).Color := clWindow ;
      exit ;
     end;
    TdbEdit(Sender).Field.AsInteger := ReturnID ;
   finally
     TdbEdit(Sender).Color := clWindow;
   end;
end;


procedure TJobProject.BitBtn3Click(Sender: TObject);
begin
  ZQJobProject.FindField('WDEFAULTACCOUNT').ReadOnly := False ;
  EditAccClick(DBEdit2);
  ZQJobProject.FindField('WDEFAULTACCOUNT').ReadOnly := True ;
   tsProjectQuote2.TabVisible := ZQJobProject.FieldByName('WDEFAULTACCOUNT').AsInteger <> 0 ;
  
end;

procedure TJobProject.ZQJobProjectAfterOpen(DataSet: TDataSet);
begin
 if ZQJobProject.FindField('WDEFAULTACCOUNT')<> nil then
  begin
    ZQJobProject.FindField('WDEFAULTACCOUNT').OnGetText := ZQJobProjectWDEFAULTACCOUNTGetText;
    ZQJobProject.FindField('WDEFAULTACCOUNT').ReadOnly := True ;
    ZQJobProject.FindField('WDEFAULTACCOUNT').Alignment :=  taLeftJustify ;
  end;
 if ZQJobProject.FindField('WSTATUSID')<> nil then
  ZQJobProject.FindField('WSTATUSID').Alignment :=  taLeftJustify ;




end;

procedure TJobProject.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 //aprojectEntryGrid.Free ;
 Application.ProcessMessages ;
// afmInvoiceEntryGrid.free ;
 Application.ProcessMessages ;
end;

procedure TJobProject.BQaddClick(Sender: TObject);
var
 i : Integer ;
 Aform : Tform ;
begin

 for i := 0 to WF_WorkFlowList.Count -1 do
  if TComponent(WF_WorkFlowList.Objects[i]).ClassName = 'twf_TfmDocument' then
     begin
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('DOCTYPE').AsInteger := 14 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('FORCEDOCTYPE').AsInteger := 1000 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('PROJECTID').AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger ;

         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('LASTID').AsInteger := ZQJobProject.fieldByName('WDEFAULTACCOUNT').AsInteger;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('SUBPROCESS').AsString := 'SHOWMODALNEW';
          TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Parent := self ;
         Aform := TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkFlowStart ;
         try
           //aform.parent := self ;


          {  if Aform.Visible then
              Aform.hide ;
             Aform.BorderStyle := bsDialog ;
            Aform.ShowModal ;    }
         finally
           TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkflowEnd(Aform)    ;
         end;
         break ;
     end;
  ZQQuotes.close ;
  ZQQuotes.open ;
end;

procedure TJobProject.BqEditClick(Sender: TObject);
var
 i : Integer ;
 Aform : Tform ;
begin
 if ZQQuotes.IsEmpty then exit ;
 for i := 0 to WF_WorkFlowList.Count -1 do
  if TComponent(WF_WorkFlowList.Objects[i]).ClassName = 'twf_TfmDocument' then
     begin
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('DOCTYPE').AsInteger := 14 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('FORCEDOCTYPE').AsInteger := 1000 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('PROJECTID').AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger ;

         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('LASTID').AsInteger := ZQQuotes.fieldByName('WDOCID').AsInteger;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('SUBPROCESS').AsString := 'SHOWMODAL';
          TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Parent := self ;
  
         Aform := TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkFlowStart ;
         try
         // Aform.Parent := self ;
          {if Aform.Visible then
              Aform.hide ;
          Aform.ShowModal ;}
         finally
           TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkflowEnd(Aform)    ;
         end;
         break ;
     end;
  ZQQuotes.close ;
  ZQQuotes.open ;
end;

procedure TJobProject.ZQQuotesAfterOpen(DataSet: TDataSet);
begin
   TFloatField(ZQQuotes.FieldByName('FDOCAMOUNT')).DisplayFormat := '0.00' ;
   TFloatField(ZQQuotes.FieldByName('FDOCEXLAMOUNT')).DisplayFormat := '0.00' ;
   TFloatField(ZQQuotes.FieldByName('FTAXAMOUNT')).DisplayFormat := '0.00' ;
end;

procedure TJobProject.bDocAddClick(Sender: TObject);
var
 i : Integer ;
 Aform : Tform ;
begin

 for i := 0 to WF_WorkFlowList.Count -1 do
  if TComponent(WF_WorkFlowList.Objects[i]).ClassName = 'twf_TfmDocument' then
     begin
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('DOCTYPE').AsInteger := Integer(cbType.Items.Objects[cbType.ItemIndex]) ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('FORCEDOCTYPE').AsInteger := 0 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('PROJECTID').AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger ;

         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('LASTID').AsInteger := ZQJobProject.fieldByName('WDEFAULTACCOUNT').AsInteger;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('SUBPROCESS').AsString := 'SHOWMODALNEW';
          TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Parent := self ;
         Aform := TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkFlowStart ;
         try
           //aform.parent := self ;


          {  if Aform.Visible then
              Aform.hide ;
             Aform.BorderStyle := bsDialog ;
            Aform.ShowModal ;  }
         finally
           TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkflowEnd(Aform)    ;
         end;
         break ;
     end;
  ZQDocs.close ;
  ZQDocs.open ;
end;

procedure TJobProject.BDocEditClick(Sender: TObject);
var
 i : Integer ;
 Aform : Tform ;
begin
 if ZQDocs.IsEmpty then exit ;
 for i := 0 to WF_WorkFlowList.Count -1 do
  if TComponent(WF_WorkFlowList.Objects[i]).ClassName = 'twf_TfmDocument' then
     begin
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('DOCTYPE').AsInteger := ZQDocs.fieldByName('WTYPEID').AsInteger ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('FORCEDOCTYPE').AsInteger := 0 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('PROJECTID').AsInteger := ZQJobProject.fieldByName('WJOBPROJECTID').AsInteger ;

         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('LASTID').AsInteger := ZQDocs.fieldByName('WDOCID').AsInteger;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('SUBPROCESS').AsString := 'SHOWMODAL';
          TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Parent := self ;
  
         Aform := TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkFlowStart ;
         try
         // Aform.Parent := self ;
          {if Aform.Visible then
              Aform.hide ;
          Aform.ShowModal ;}
         finally
           TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkflowEnd(Aform)    ;
         end;
         break ;
     end;
  ZQDocs.close ;
  ZQDocs.open ;
end;

procedure TJobProject.ZQDocsAfterOpen(DataSet: TDataSet);
begin
   TFloatField(ZQDocs.FieldByName('FDOCAMOUNT')).DisplayFormat := '0.00' ;
   TFloatField(ZQDocs.FieldByName('FDOCEXLAMOUNT')).DisplayFormat := '0.00' ;
   TFloatField(ZQDocs.FieldByName('FTAXAMOUNT')).DisplayFormat := '0.00' ;
end;

procedure TJobProject.DBGrid3DblClick(Sender: TObject);
begin
BDocEditClick(self);

end;

initialization
twf_TJobProject.create(nil);
end.
