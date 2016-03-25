(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DocSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, Buttons, DB,
    DBAccess , Uni, MemDS;

type
  TfmDocumentSetup = class(TForm)
    ButtonPanel: TPanel;
    PageControl1: TPageControl;
    tsInvoices: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    tsCreditNotes: TTabSheet;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Bevel2: TBevel;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    tsPurchases: TTabSheet;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Bevel3: TBevel;
    tsOrders: TTabSheet;
    Bevel4: TBevel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    Label20: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    tsQuotes: TTabSheet;
    Label18: TLabel;
    DBEdit21: TDBEdit;
    Bevel5: TBevel;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    tsGoodsReturned: TTabSheet;
    Bevel6: TBevel;
    DBEdit26: TDBEdit;
    Label25: TLabel;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label29: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Bitprn1: TBitBtn;
    LInvLayout: TLabel;
    CBdocLayoutInv: TComboBox;
    LCredLayout: TLabel;
    CBdocLayoutCreditNote: TComboBox;
    LPurchaseLayout: TLabel;
    CBdocLayoutPurchases: TComboBox;
    LGoodsReturndLayout: TLabel;
    CBdocLayoutGoodsreturnd: TComboBox;
    LOrdersLayout: TLabel;
    CBdocLayoutOrder: TComboBox;
    LQuoteslayout: TLabel;
    CBdocLayoutQuote: TComboBox;
    CBdocLayoutInv2: TComboBox;
    LInvLayout2: TLabel;
    LCredLayout2: TLabel;
    CBdocLayoutCreditNote2: TComboBox;
    LPurchaseLayout2: TLabel;
    CBdocLayoutPurchases2: TComboBox;
    LGoodsReturndLayout2: TLabel;
    CBdocLayoutGoodsreturnd2: TComboBox;
    CBdocLayoutOrder2: TComboBox;
    LOrdersLayout2: TLabel;
    CBdocLayoutQuote2: TComboBox;
    LQuoteslayout2: TLabel;
    qryBatchTypesList: TuniQuery;
    qryBatchTypesListWBATCHTYPEID: TIntegerField;
    qryBatchTypesListBCASHBOOK: TSmallintField;
    qryBatchTypesListSDESCRIPTION: TStringField;
    qryBatchTypesListWCONTRAACCOUNTID: TIntegerField;
    qryBatchTypesListBCONTRAPERLINE: TSmallintField;
    qryBatchTypesListDSYSDATE: TDateTimeField;
    qryBatchTypesListSCONTRANAME: TStringField;
    qryBatchTypesListWACCOUNTID: TIntegerField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label3: TLabel;
    Lnextbatchnr: TLabel;
    DBCheckBox1: TDBCheckBox;
    docLayout: TComboBox;
    CBUseOneNumbering: TCheckBox;
    CBUserGeneralNumber: TComboBox;
    CBAutoPostDocuments: TCheckBox;
    DBEdit31: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBEdit26Enter(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit21Enter(Sender: TObject);
    procedure CBUseOneNumberingClick(Sender: TObject);
    procedure CBUserGeneralNumberChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    OldNbr:string;

//    OnChg:Boolean;
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    Procedure LoadDocLayouts;
    procedure Translate ;
  public
    currentuser : Integer ;
    { Public declarations }
  end;

var
  fmDocumentSetup: TfmDocumentSetup;

implementation

uses Main, Database, HtmlHelpAPI, LanguageChoice, GlobalFunctions,
   DatabaseAccess, TcVariables,XRoutines, UDMTCCoreLink,variants;

{$R *.DFM}

procedure TfmDocumentSetup.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  Translate ;
  dmDatabase.tblSysVars.open ;
  OldNbr:='';

  dmDatabase.tblSysVars.Close;
  dmDatabase.tblSysVars.Open;
  qryBatchTypesList.Open;
  dmDatabase.tblType.filter := 'WTypeParent=5';
  dmDatabase.tblType.filtered := True ;


  dmDatabase.tblType.open ;

  dmDatabase.tblUser.Open;
  dmDatabase.tblUser.First ;
  while not dmDatabase.tblUser.eof do
    begin
       CBUserGeneralNumber.AddItem(dmDatabase.tblUserSUserName.AsString,TObject(dmDatabase.tblUserWUserID.AsInteger));
       dmDatabase.tblUser.next ;
    end;
  if dmDatabase.tblUser.RecordCount < 2 then
  begin
    CBUseOneNumbering.Visible := false ;
    CBUseOneNumbering.Tag := 1 ;
  end;

  dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);


  LoadDocLayouts;
  LoadReoprtOp;
  PageControl1.ActivePage := tsInvoices;
  if DBEdit1.CanFocus then
  DBEdit1.SetFocus;
end;

procedure TfmDocumentSetup.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(445){Do you want to save these changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmDocumentSetup.btnOKClick(Sender: TObject);
begin
  dmDatabase.tblSysVars.Edit;
  dmDatabase.tblSysVars.Post;
  dmDatabase.tblUser.Edit;
  dmDatabase.tblUser.Post;

  SaveReoprtOp;
  Close;
end;

procedure TfmDocumentSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDocumentSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
  CBUseOneNumbering.SetFocus ;
  except

  end;
  dmDatabase.tblSysVars.Close;
  qryBatchTypesList.Close;
  dmDatabase.tblUser.Close;
  dmDatabase.tblType.Close;
  dmDatabase.tblType.filter := '';
  dmDatabase.tblType.filtered := false ;
end;

procedure TfmDocumentSetup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(227);
             key := 0;

        end;
end;

procedure TfmDocumentSetup.DBEdit1Exit(Sender: TObject);
Var
 OKFocus : Boolean ;
begin
 OKFocus := BtnOk.Focused ;
 if BtnCancel.Focused then
   exit;
 if (Trim(DBEdit1.Text)='') then
  begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 10 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit1.Field.DataSet.Edit ;
   DBEdit1.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit1.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit1.Text) then
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(234){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   begin
      DBEdit1.DataSource.DataSet.FieldByName('SInvoiceNextNumber').asString:=OldNbr;
      DBEdit1.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(10)=False then begin
   OSFMessageDlg(GetTextLang(234){'Invoice number'}+'  '+DBEdit1.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSInvoiceNextNumber.Value:='';
   DBEdit1.SetFocus;
 end;
 if  OKFocus then btnOKClick(self);
  dmDatabase.tblSysVars.Edit;
  dmDatabase.tblUser.Edit;
end;

procedure TfmDocumentSetup.DBEdit6Exit(Sender: TObject);
Var
 OKFocus : Boolean ;
begin
 OKFocus := BtnOk.Focused ;
 if BtnCancel.Focused then exit;
 if (Trim(DBEdit6.Text)='') then
 begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 11 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit6.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit6.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit6.Text) then
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(758){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   begin
      DBEdit6.DataSource.DataSet.FieldByName('SCreditNoteNextNumber').asString:=OldNbr;
      DBEdit6.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(11)=False then begin
   OSFMessageDlg(GetTextLang(758){'Credit note number'}+'  '+DBEdit6.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSCreditNoteNextNumber.Value:='';
 end;
 if  OKFocus then btnOKClick(self); 
end;

procedure TfmDocumentSetup.DBEdit10Exit(Sender: TObject);
Var
 OKFocus : Boolean ;
begin
 OKFocus := BtnOk.Focused ;
 if BtnCancel.Focused then exit;
 if (Trim(DBEdit10.Text)='') then
 begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 12 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit10.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit10.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit10.Text) then
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(759){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   Begin
      DBEdit10.DataSource.DataSet.FieldByName('SPurchaseNextNumber').asString:=OldNbr;
      DBEdit10.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(12)=False then begin
   OSFMessageDlg(GetTextLang(759){'Credit note number'}+'  '+DBEdit10.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSPurchaseNextNumber.Value:='';
 end;
 if  OKFocus then btnOKClick(self); 
end;

procedure TfmDocumentSetup.DBEdit26Exit(Sender: TObject);
Var
 OKFocus : Boolean ;
begin
 OKFocus := BtnOk.Focused ;
 if BtnCancel.Focused then exit;
 if (Trim(DBEdit26.Text)='') then
  begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 13 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit26.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit26.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit26.Text) then 
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(752){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   begin
      DBEdit26.DataSource.DataSet.FieldByName('SGoodsReturnedNextNumber').asString:=OldNbr;
      DBEdit26.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(13)=False then begin
   OSFMessageDlg(GetTextLang(752){'Credit note number'}+'  '+DBEdit26.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSGoodsReturnedNextNumber.Value:='';
 end;
 if  OKFocus then btnOKClick(self); 
end;

procedure TfmDocumentSetup.DBEdit16Exit(Sender: TObject);
begin
 if BtnCancel.Focused then exit;
 if (Trim(DBEdit16.Text)='') then
 begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 14 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit16.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit16.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit16.Text) then
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(762){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   begin
      DBEdit16.DataSource.DataSet.FieldByName('SOrderNextNumber').asString:=OldNbr;
      DBEdit16.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(15)=False then begin
   OSFMessageDlg(GetTextLang(762){'Credit note number'}+'  '+DBEdit16.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSOrderNextNumber.Value:='';
 end;
end;

procedure TfmDocumentSetup.DBEdit21Exit(Sender: TObject);
begin
 if BtnCancel.Focused then exit;
 if (Trim(DBEdit21.Text)='') then
 begin
   OSFMessageDlg(GetTextLang(783){'Illegal Document Number'},mtError,[mbok],0);
   dmDatabase.qGen.SQL.Text := 'select SDocno from dochead where WTypeId = 15 order by SDocNo desc' ;
   dmDatabase.qGen.open ;
   DBEdit21.Field.AsString := _IncrementString(dmDatabase.qGen.fields[0].AsString) ;
   dmDatabase.qGen.close ;
   DBEdit21.SetFocus;
   exit;
 end;
// if OnChg then
 if OldNbr<>Trim(DBEdit21.Text) then
   if OSFMessageDlg(GetTextLang(806)+GetTextLang(751){Are You sure you want to changes the Next ... Number ?}, mtconfirmation, [mbyes,mbno], 0) = mrNo then
   begin
      DBEdit21.DataSource.DataSet.FieldByName('SQuoteNextNumber').asString:=OldNbr;
      DBEdit21.SetFocus;
      exit;
   end;
// OnChg:=False;
 if NextDocNbrOk(14)=False then begin
   OSFMessageDlg(GetTextLang(751){'Credit note number'}+'  '+DBEdit21.text+ '  '+GetTextLang(782){' exits alredy !'},mtError,[mbok],0);
   dmDatabase.tblUser.Edit;
   dmDatabase.tblUserSQuoteNextNumber.Value:='';
 end;
end;

procedure TfmDocumentSetup.DBEdit1Change(Sender: TObject);
begin
//  OnChg:=True;
end;

procedure TfmDocumentSetup.DBEdit1Enter(Sender: TObject);
begin
  OldNbr:=DBEdit1.Text;
  
//  OnChg:=False;
end;

procedure TfmDocumentSetup.DBEdit6Enter(Sender: TObject);
begin
  OldNbr:=DBEdit6.Text;
//  OnChg:=False;
end;

procedure TfmDocumentSetup.DBEdit10Enter(Sender: TObject);
begin
  OldNbr:=DBEdit10.Text;
//  OnChg:=False;
end;

procedure TfmDocumentSetup.DBEdit26Enter(Sender: TObject);
begin
  OldNbr:=DBEdit26.Text;
//  OnChg:=False;
end;

procedure TfmDocumentSetup.DBEdit16Enter(Sender: TObject);
begin
  OldNbr:=DBEdit16.Text;
//  OnChg:=False;
end;

procedure TfmDocumentSetup.DBEdit21Enter(Sender: TObject);
begin
  OldNbr:=DBEdit21.Text;
//  OnChg:=False;
end;

Procedure TfmDocumentSetup.LoadReoprtOp;
var
 Id:Variant ;
 OpStr : String ;
begin
//  cbFrames.Checked := ReadReportOp('BDocPrntFrames',True).AsBoolean;
  CBAutoPostDocuments.Checked := ReadReportOp('CBAutoPostDocuments',false).AsBoolean;
  OpStr := ReadReportOp('SDocLayoutName','DefaultA4').AsString;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  docLayout.Text:=  OpStr ;
  docLayout.ItemIndex := docLayout.Items.IndexOf(docLayout.Text);

  OpStr := ReadReportOp('SDocLayoutNameInv',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutInv.ItemIndex := CBdocLayoutInv.Items.IndexOf(OpStr);

  OpStr := ReadReportOp('SDocLayoutNameInv2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutInv2.ItemIndex := CBdocLayoutInv2.Items.IndexOf(OpStr);

  OpStr := ReadReportOp('SDocLayoutNameCreditNote',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutCreditNote.ItemIndex := CBdocLayoutCreditNote.Items.IndexOf(OpStr);

    OpStr := ReadReportOp('SDocLayoutNameCreditNote2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;

  CBdocLayoutCreditNote2.ItemIndex := CBdocLayoutCreditNote2.Items.IndexOf(OpStr);

    OpStr := ReadReportOp('SDocLayoutNamePurchases',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutPurchases.ItemIndex := CBdocLayoutPurchases.Items.IndexOf(OpStr);

    OpStr :=ReadReportOp('SDocLayoutNamePurchases2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;

  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutPurchases2.ItemIndex := CBdocLayoutPurchases2.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameGret',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutGoodsreturnd.ItemIndex := CBdocLayoutGoodsreturnd.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameGret2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutGoodsreturnd2.ItemIndex := CBdocLayoutGoodsreturnd2.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameOrder',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutOrder.ItemIndex := CBdocLayoutOrder.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameOrder2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutOrder2.ItemIndex := CBdocLayoutOrder2.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameQuote',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutQuote.ItemIndex := CBdocLayoutQuote.Items.IndexOf(OpStr);

      OpStr := ReadReportOp('SDocLayoutNameQuote2',ReadReportOp('SDocLayoutName2','').AsString).AsString ;
  if POS('TRN_',OpStr) = 1 then
     OpStr := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(OpStr,5,20),''),0)) ;
  CBdocLayoutQuote2.ItemIndex := CBdocLayoutQuote2.Items.IndexOf(OpStr);

  CBUseOneNumbering.Checked := ReadReportOp('BUseGeneralNumber','false').Asboolean ;

  try
  if CBUseOneNumbering.Checked then
   begin
     CBUserGeneralNumber.ItemIndex := CBUserGeneralNumber.Items.IndexOfObject(TObject(StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)))));
     Id := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0) ;
     dmDatabase.tblUser.Locate('WUserID',Id, []);
     CBUserGeneralNumber.Enabled := CBUserGeneralNumber.ItemIndex = CBUserGeneralNumber.Items.IndexOfObject(TObject(currentUser)) ;
     CBUseOneNumbering.Enabled := CBUserGeneralNumber.ItemIndex = CBUserGeneralNumber.Items.IndexOfObject(TObject(currentUser)) ;
     dmDatabase.tblSysVars.Edit ;
     dmDatabase.tblSysVarsWINVOICESBATCHID.AsInteger := DMTCCoreLink.ReadSysParam('IInvbatch',dmDatabase.tblSysVarsWINVOICESBATCHID.AsInteger , Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex] ));
     dmDatabase.tblSysVarsWCREDITNOTEBATCHTYPEID.AsInteger := DMTCCoreLink.ReadSysParam('ICreditBatch',dmDatabase.tblSysVarsWCREDITNOTEBATCHTYPEID.AsInteger , Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex] ));
     dmDatabase.tblSysVarsWPURCHASESBATCHID.AsInteger := DMTCCoreLink.ReadSysParam('IPurchasBatch',dmDatabase.tblSysVarsWPURCHASESBATCHID.AsInteger , Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex] ));
     dmDatabase.tblSysVarsWGOODSRETURNEDBATCHID.AsInteger := DMTCCoreLink.ReadSysParam('IReturnBatch',dmDatabase.tblSysVarsWGOODSRETURNEDBATCHID.AsInteger , Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex] ));
    end;
  except

  end;
  if (CBUseOneNumbering.Tag = 1) then CBUseOneNumbering.Checked := false ;
  CBUseOneNumberingClick(self);
end;

Procedure TfmDocumentSetup.SaveReoprtOp;
begin

  //WriteReportOp('BDocPrntFrames',Bool2Str(cbFrames.Checked));
  if (docLayout.ItemIndex <> -1) and (docLayout.Items.Objects[docLayout.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutName','TRN_' + IntToStr(Integer(docLayout.Items.Objects[docLayout.ItemIndex])))
     else
  WriteReportOp('SDocLayoutName',docLayout.Text);

  if (CBdocLayoutInv.ItemIndex <> -1) and (CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameInv','TRN_' + IntToStr(Integer(CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex])))
  else
  WriteReportOp('SDocLayoutNameInv',CBdocLayoutInv.Text);


  if (CBdocLayoutCreditNote.ItemIndex <> -1) and (CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameCreditNote','TRN_' + IntToStr(Integer(CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameCreditNote',CBdocLayoutCreditNote.Text);

  if (CBdocLayoutPurchases.ItemIndex <> -1) and (CBdocLayoutPurchases.Items.Objects[CBdocLayoutPurchases.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNamePurchases','TRN_' + IntToStr(Integer(CBdocLayoutPurchases.Items.Objects[CBdocLayoutPurchases.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNamePurchases',CBdocLayoutPurchases.Text);

  if (CBdocLayoutGoodsreturnd.ItemIndex <> -1) and (CBdocLayoutGoodsreturnd.Items.Objects[CBdocLayoutGoodsreturnd.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameGret','TRN_' + IntToStr(Integer(CBdocLayoutGoodsreturnd.Items.Objects[CBdocLayoutGoodsreturnd.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameGret',CBdocLayoutGoodsreturnd.Text);

  if (CBdocLayoutOrder.ItemIndex <> -1) and (CBdocLayoutOrder.Items.Objects[CBdocLayoutOrder.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameOrder','TRN_' + IntToStr(Integer(CBdocLayoutOrder.Items.Objects[CBdocLayoutOrder.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameOrder',CBdocLayoutOrder.Text);

  if (CBdocLayoutQuote.ItemIndex <> -1) and (CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameQuote','TRN_' + IntToStr(Integer(CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameQuote',CBdocLayoutQuote.Text);


  if (CBdocLayoutInv2.ItemIndex <> -1) and (CBdocLayoutInv2.Items.Objects[CBdocLayoutInv2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameInv2','TRN_' + IntToStr(Integer(CBdocLayoutInv2.Items.Objects[CBdocLayoutInv2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameInv2',CBdocLayoutInv2.Text);

  if (CBdocLayoutCreditNote2.ItemIndex <> -1) and (CBdocLayoutCreditNote2.Items.Objects[CBdocLayoutCreditNote2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameCreditNote2','TRN_' + IntToStr(Integer(CBdocLayoutCreditNote2.Items.Objects[CBdocLayoutCreditNote2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameCreditNote2',CBdocLayoutCreditNote2.Text);

   if (CBdocLayoutPurchases2.ItemIndex <> -1) and (CBdocLayoutPurchases2.Items.Objects[CBdocLayoutPurchases2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNamePurchases2','TRN_' + IntToStr(Integer(CBdocLayoutPurchases2.Items.Objects[CBdocLayoutPurchases2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNamePurchases2',CBdocLayoutPurchases2.Text);

  if (CBdocLayoutGoodsreturnd2.ItemIndex <> -1) and (CBdocLayoutGoodsreturnd2.Items.Objects[CBdocLayoutGoodsreturnd2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameGret2','TRN_' + IntToStr(Integer(CBdocLayoutGoodsreturnd2.Items.Objects[CBdocLayoutGoodsreturnd2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameGret2',CBdocLayoutGoodsreturnd2.Text);

  if (CBdocLayoutOrder2.ItemIndex <> -1) and (CBdocLayoutOrder2.Items.Objects[CBdocLayoutOrder2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameOrder2','TRN_' + IntToStr(Integer(CBdocLayoutOrder2.Items.Objects[CBdocLayoutOrder2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameOrder2',CBdocLayoutOrder2.Text);

  if (CBdocLayoutQuote2.ItemIndex <> -1) and (CBdocLayoutQuote2.Items.Objects[CBdocLayoutQuote2.ItemIndex] <> nil) then
    WriteReportOp('SDocLayoutNameQuote2','TRN_' + IntToStr(Integer(CBdocLayoutQuote2.Items.Objects[CBdocLayoutQuote2.ItemIndex])))
     else
  WriteReportOp('SDocLayoutNameQuote2',CBdocLayoutQuote2.Text);

  WriteReportOp('BUseGeneralNumber',Bool2Str(CBUseOneNumbering.Checked));
  WriteReportOp('CBAutoPostDocuments',Bool2Str(CBAutoPostDocuments.Checked));
  if  CBUserGeneralNumber.ItemIndex <> -1 then
  begin
   WriteReportOp('IUserGeneralNumber',IntToStr(Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex])));
   WriteSysParam('IInvbatch',dmDatabase.tblSysVarsWINVOICESBATCHID.AsString ,Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]));
   WriteSysParam('ICreditBatch',dmDatabase.tblSysVarsWCREDITNOTEBATCHTYPEID.AsString,Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]));
   WriteSysParam('IPurchasBatch',dmDatabase.tblSysVarsWPURCHASESBATCHID.AsString,Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]));
   WriteSysParam('IReturnBatch',dmDatabase.tblSysVarsWGOODSRETURNEDBATCHID.AsString,Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]));

//   dmDatabase.tblUser.Open ;
//   dmDatabase.tblUser.First ;
 //  while not dmDatabase.tblUser.Eof do
 //     begin
   //    WriteSysParam('IUserGeneralNumber',IntToStr(Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex])),dmDatabase.tblUserWUSERID.AsInteger,0);
 //      dmDatabase.tblUser.next ;
 //     end;

  end;
end;

Procedure TfmDocumentSetup.LoadDocLayouts;
begin
 FillFreeReportLayoutBox(docLayout.Items);
    CBdocLayoutInv.Items := docLayout.Items ;
    CBdocLayoutCreditNote.Items := CBdocLayoutInv.Items ;
    CBdocLayoutPurchases.Items := CBdocLayoutInv.Items ;
    CBdocLayoutGoodsreturnd.Items := CBdocLayoutInv.Items ;
    CBdocLayoutOrder.Items := CBdocLayoutInv.Items ;
    CBdocLayoutQuote.Items := CBdocLayoutInv.Items ;

    CBdocLayoutInv2.Items := CBdocLayoutInv.Items ;
    CBdocLayoutInv2.Items.Insert(0,'');
    CBdocLayoutCreditNote2.Items := CBdocLayoutInv2.Items ;
    CBdocLayoutPurchases2.Items := CBdocLayoutInv2.Items ;
    CBdocLayoutGoodsreturnd2.Items := CBdocLayoutInv2.Items ;
    CBdocLayoutOrder2.Items := CBdocLayoutInv2.Items ;
    CBdocLayoutQuote2.Items := CBdocLayoutInv2.Items ;
end;

procedure TfmDocumentSetup.CBUseOneNumberingClick(Sender: TObject);
begin
PageControl1.Visible := true ;
CBUserGeneralNumber.Visible := CBUseOneNumbering.Checked ;
CBUserGeneralNumberChange(self);
end;

procedure TfmDocumentSetup.CBUserGeneralNumberChange(Sender: TObject);
var
 i,x : Integer ;
begin
 if CBUserGeneralNumber.Visible then
    begin
       if CBUserGeneralNumber.ItemIndex <> -1 then
         begin
           // PageControl1.Enabled := Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]) = CurrentUser ;
            for i := 0 to PageControl1.PageCount -1 do
             begin
                for x := 0 to PageControl1.Pages[i].ControlCount -1 do
                    if (PageControl1.Pages[i].Controls[x] is TWinControl) then
                       TCustomEdit(PageControl1.Pages[i].Controls[x] ).Enabled := Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]) = CurrentUser ;
                if not Integer(CBUserGeneralNumber.Items.Objects[CBUserGeneralNumber.ItemIndex]) = CurrentUser  then
                  PageControl1.Pages[i].Font.Color := clRed ;

              end;

         end;
    end;
end;

procedure TfmDocumentSetup.Translate;
begin
 Label3.Caption := GetTextLang(1910) + ' ' + LowerCase(GetTextLang(2200)) ;
 Bitprn1.Caption := GetTextLang(1911) ;
 CBUseOneNumbering.Caption := GetTextLang(2101) ;
 CBAutoPostDocuments.Caption := GetTextLang(2102) ;
 BtnCancel.Caption := GetTextLang(169) ;
 Caption := GetTextLang(344);//Header 344
 tsInvoices.Caption := GetTextLang(300);//Invoices caption 300
 Label1.Caption := GetTextLang(321);//next invoice no 321
 Label2.Caption := GetTextLang(322);//invoice batch 322
 Label6.Caption := GetTextLang(324);//invoice heading 324
 Label7.Caption := GetTextLang(325);//invoice message 325
 tsCreditNotes.Caption := GetTextLang(706);//Credit notes caption 706
 Label8.Caption := GetTextLang(326);//next cr note no 326
 Label9.Caption := GetTextLang(327);//credit note batch 327
 Label15.Caption := GetTextLang(328);//credit note heading 328
 Label10.Caption := GetTextLang(329);//credit note message 329
 tsPurchases.Caption := GetTextLang(302);//Purchases caption 302
 Label11.Caption := GetTextLang(330);//next purchase no 330
 Label14.Caption := GetTextLang(331);//purchase batch 331
 Label12.Caption := GetTextLang(332);//purchase heading 332
 Label13.Caption := GetTextLang(333);//purchase message 333
 tsGoodsReturned.Caption := GetTextLang(419);//Goods Returned caption 419
 Label25.Caption := GetTextLang(334);//next return no 334
 Label29.Caption := GetTextLang(335);//goods returned batch 335
 Label27.Caption := GetTextLang(336);//goods returned heading 336
 Label28.Caption := GetTextLang(337);//goods returned message 337
 Label17.Caption := GetTextLang(338);//next order no 338
 Label21.Caption := GetTextLang(339);//order heading 339
 Label20.Caption := GetTextLang(340);//order message 340
 tsOrders.Caption := GetTextLang(798);//Order Tab caption 798
 DBCheckBox1.Caption := GetTextLang(1020);//Print standard logo 1020
 tsQuotes.Caption := GetTextLang(418);//Quotes caption 418
 Label18.Caption := GetTextLang(341);//next quote no 341
 Label23.Caption := GetTextLang(342);//quote heading 342
 Label24.Caption := GetTextLang(343);//quote message 343
 btnOK.Caption := GetTextLang(167);//OK 167
 btnCancel.Caption := GetTextLang(168);//Cancel 168
 LInvLayout.Caption := GetTextLang(1910);
 LInvLayout2.Caption := GetTextLang(1910) +' 2';
 LCredLayout.Caption := GetTextLang(1910);
 LCredLayout2.Caption := GetTextLang(1910) +' 2';
 LPurchaseLayout.Caption := GetTextLang(1910);
 LPurchaseLayout2.Caption := GetTextLang(1910) +' 2';
 LGoodsReturndLayout.Caption := GetTextLang(1910);
 LGoodsReturndLayout2.Caption := GetTextLang(1910) +' 2';
 LOrdersLayout.Caption := GetTextLang(1910);
 LOrdersLayout2.Caption := GetTextLang(1910) +' 2';
 LQuoteslayout.Caption := GetTextLang(1910);
 LQuoteslayout2.Caption := GetTextLang(1910) +' 2';


 Lnextbatchnr.Caption := GetTextLang(3336)  ;

end;

procedure TfmDocumentSetup.FormCreate(Sender: TObject);
begin
DMTCCoreLink.AssignConnectionToChilds(self);
currentuser := DMTCCoreLink.currentuser ;
end;

end.
