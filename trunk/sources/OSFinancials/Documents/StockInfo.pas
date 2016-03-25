(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockInfo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls,    Variants, DB,
   DBAccess , Uni, ComCtrls, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  DBCtrls, Mask;

type
  TfmStockInfo = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    dsSysvars: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LCBDefaultPrice: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CBDefaultPrice: TComboBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LDBCheckBox3: TLabel;
    DBCheckBox3: TDBCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    rbCostOfSales: TRadioButton;
    rbAveCost: TRadioButton;
    gbStocksettings: TGroupBox;
    LCBNoBackOrder: TLabel;
    LCBCantSellOutOfStock: TLabel;
    LCBNoPrintMessage: TLabel;
    LCBCheckReferenceUsed: TLabel;
    LCBDoNotCreateItems: TLabel;
    LcbGoToQty: TLabel;
    LcbCannotEditDescription: TLabel;
    LcbCannotEditPrice: TLabel;
    LDefincForDocs: TLabel;
    LButtonLookup: TLabel;
    LNoOutOfStockMsg: TLabel;
    LcbOutOfStockDrawCol: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LcbUseTabsInStock: TLabel;
    CBSqlOnlyForStockLookup: TCheckBox;
    cbMergeInvoiceToOrders: TCheckBox;
    cbMergeItemsOnLedger: TCheckBox;
    cbBomStock: TCheckBox;
    cbShowBackorders: TCheckBox;
    cbLimitForDefaulSupplier: TCheckBox;
    CBNoBackOrder: TCheckBox;
    CBCantSellOutOfStock: TCheckBox;
    CBNoPrintMessage: TCheckBox;
    CBCheckReferenceUsed: TCheckBox;
    CBDoNotCreateItems: TCheckBox;
    cbGoToQty: TCheckBox;
    cbCannotEditDescription: TCheckBox;
    cbCannotEditPrice: TCheckBox;
    cbDefInc: TCheckBox;
    cbButtonLookup: TCheckBox;
    cbNoOutOfStockMsg: TCheckBox;
    cbOutOfStockDrawCol: TCheckBox;
    BOptions: TBitBtn;
    cbShipcostunittype: TComboBox;
    EpaymetItem: TEdit;
    BBSales: TBitBtn;
    EpaymetItemCred: TEdit;
    BitBtn1: TBitBtn;
    cbUseTabsInStock: TCheckBox;
    ZQTaxclass: TuniQuery;
    ZUSQLTaxclass: TUniUpdateSql;
    ZQTaxclassWSTOCKCLASSTAXID: TIntegerField;
    ZQTaxclassSNAME: TStringField;
    ZQTaxclassWINPUTTAX: TIntegerField;
    ZQTaxclassWOUTPUTTAX: TIntegerField;
    ZQTaxclassWSALESACCOUNTID: TIntegerField;
    ZQTaxclassWSTOCKACCOUNTID: TIntegerField;
    ZQTaxclassWCOSTACCOUNTID: TIntegerField;
    dsTaxClass: TDataSource;
    Panel1: TPanel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    cbForceStockTypeCheck: TCheckBox;
    BitBtn7: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WUNITID: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1FUNITQTY: TcxGridDBColumn;
    Panel2: TPanel;
    sbAdd: TSpeedButton;
    sbDelete: TSpeedButton;
    edtNewUnit: TEdit;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1WSTOCKCLASSTAXID: TcxGridDBColumn;
    cxGrid2DBTableView1SNAME: TcxGridDBColumn;
    cxGrid2DBTableView1WINPUTTAX: TcxGridDBColumn;
    cxGrid2DBTableView1WOUTPUTTAX: TcxGridDBColumn;
    cxGrid2DBTableView1WSALESACCOUNTID: TcxGridDBColumn;
    cxGrid2DBTableView1WSTOCKACCOUNTID: TcxGridDBColumn;
    cxGrid2DBTableView1WCOSTACCOUNTID: TcxGridDBColumn;
    DataSource1: TDataSource;
    UniQUnit: TUniQuery;
    procedure FormShow(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure edtNewUnitKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtPrice1KeyPress(Sender: TObject; var Key: Char);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BOptionsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbShipcostunittypeEnter(Sender: TObject);
    procedure BBSalesClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ZQTaxclassBeforePost(DataSet: TDataSet);
    procedure ZQTaxclassWINPUTTAXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBEdit4DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure UniQUnitAfterInsert(DataSet: TDataSet);
  private
    btmpCost : Boolean;
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    procedure RefreshUnitlist ;
  public
    { Public declarations }
  end;

var
  fmStockInfo: TfmStockInfo;

implementation

Uses
  Database, Main, HtmlHelpAPI, GlobalFunctions, LanguageChoice, TcVariables,
  DatabaseAccess,XRoutines,  UDMTCCoreLink, UItemOptions,
  OSFGeneralRoutines, osfLookup, UDmQuantumGridDefs, TcashClasses;

{$R *.DFM}

procedure TfmStockInfo.FormShow(Sender: TObject);
Var
  LastIndex : Integer ;

begin
 PageControl1.ActivePageIndex := 0 ;
 ZQTaxclass.Open ;
 UniQUnit.Open ;
 if not dmDatabase.tblSysVars.Active then
  dmDatabase.tblSysVars.open ;
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
  cbShowBackorders.Caption := GetTextLang(630) + ' ' +  GetTextLang(1191);
  cbLimitForDefaulSupplier.Caption := DMTCCoreLink.GetTextLang(3302) ;

  gbStocksettings.Caption := DMTCCoreLink.GetTextLang(344) ;

  EpaymetItem.Visible :=   TDatabaseTableRoutines.FieldExists('DOCHEAD','FPAYMENTDISCOUNT') ;
  EpaymetItemCred.Visible := EpaymetItem.Visible ;
  Label6.Visible := EpaymetItem.Visible ;
  Label8.Visible := EpaymetItem.Visible ;
  BBSales.Visible := EpaymetItem.Visible ;
  BitBtn1.Visible := EpaymetItem.Visible ;
  cbShipcostunittype.Visible :=   TDatabaseTableRoutines.FieldExists('DOCHEAD','WSHIPSTOCKID') ;
  Label7.Visible := cbShipcostunittype.Visible ;
Label10.Caption := GetTextLang(219);//Input Tax 219
Label11.Caption := GetTextLang(220);//Output Tax 220
Label12.Caption := GetTextLang(223);//Sales Account 223
Label14.Caption := GetTextLang(224);//Cost of Sales 224
Label13.Caption := GetTextLang(225);//Stock Control 225
BitBtn7.Caption := GetTextLang(1893);

 


cxGrid2DBTableView1WSTOCKCLASSTAXID.Caption :=GetTextLang(1706);
cxGrid2DBTableView1SNAME.Caption :=GetTextLang(185);
cxGrid2DBTableView1WOUTPUTTAX.Caption :=GetTextLang(220);
cxGrid2DBTableView1WINPUTTAX.Caption :=GetTextLang(219);
cxGrid2DBTableView1WSALESACCOUNTID.Caption :=GetTextLang(223);
cxGrid2DBTableView1WSTOCKACCOUNTID.Caption :=GetTextLang(225);
cxGrid2DBTableView1WCOSTACCOUNTID.Caption :=GetTextLang(224);


TabSheet3.Caption :=  GetTextLang(3465);
cbForceStockTypeCheck.Caption :=  GetTextLang(3467);
Label9.Caption := GetTextLang(185); // name
 TabSheet2.Caption :=  GetTextLang(214);
 TabSheet1.Caption :=  GetTextLang(1341);
  lcbUseTabsInStock.Caption := GetTextLang(3421);


  dmDatabase.tblUnit.Open;
  RefreshUnitList ;
  LoadReoprtOp;

  rbAveCost.Checked := dmDatabase.tblSysVarsBUseAvgCost.Value=1;
  rbCostOfSales.Checked := Not rbAveCost.Checked;
  btmpCost := dmDatabase.tblSysVarsBCreateCostOfSales.Value=1;
  DBCheckBox3Click(Sender);
  DBLookupComboBox2.Enabled := dmDatabase.tblSysVarsBCreateCostOfSales.Value=1;

  dmDatabase.tblBatchTypes.Open;
  edtNewUnit.Text := '';
//  edtNewUnit.SetFocus;


   self.Caption := GetTextLang(350); //Header 350
   cxGrid1DBTableView1SDESCRIPTION.Caption := GetTextLang(355);  //Description 355
   GroupBox1.Caption :=  GetTextLang(497); //Units of stock 497
   GroupBox2.Caption :=  GetTextLang(498); //Selling price description 498
   GroupBox3.Caption :=  GetTextLang(499); //Cost of sales 499
   sbAdd.Caption :=  GetTextLang(292);//Add 292
   sbDelete.Caption  := GetTextLang(293); //Delete 293
   Label1.Caption :=  GetTextLang(216);//Selling price1 216
   Label2.Caption :=  GetTextLang(217);//Selling price2 217
   Label3.Caption :=  GetTextLang(218); //Selling price3 218
   lDBCheckBox3.Caption := GetTextLang(351);//Create cost of sales 351
   Label5.Caption:=GetTextLang(1080); //Use
   rbAveCost.Caption := GetTextLang(226);//Average Cost
 //  lblCostAccount.Caption := GetTextLang(1081);//lblCostAccount
   rbCostOfSales.Caption := GetTextLang(215);//rbCostOfSales
   Label4.Caption :=  GetTextLang(349);//Cost of Sales Batch 349
   Label5.Caption :=GetTextLang(1080);//Use
   btnOK.Caption := GetTextLang(167); //OK 167
   btnCancel.Caption :=  GetTextLang(169); //Cancel 168

  cbBomStock.Caption :=  GetTextLang(3301);
  lcbOutOfStockDrawCol.Caption :=  GetTextLang(3300);
  LNoOutOfStockMsg.Caption :=  GetTextLang(3299);

  LCBNoBackOrder.Caption :=  GetTextLang(2930);//No backorder
  LCBCantSellOutOfStock.Caption :=  GetTextLang(2931);//Can set out of stock
  LCBNoPrintMessage.Caption :=  GetTextLang(2932);//No print message
  LCBCheckReferenceUsed.Caption :=  GetTextLang(2933);//Check reference used
  LCBDoNotCreateItems.Caption :=  GetTextLang(2934); //Cant create items
  LCBDefaultPrice.Caption :=  GetTextLang(1341); //Default
  LastIndex := CBDefaultPrice.ItemIndex ;
  CBDefaultPrice.Items[0] :=  GetTextLang(1780); //Default
  CBDefaultPrice.Items[1] :=  GetTextLang(1781); //Default
  CBDefaultPrice.Items[2] :=  GetTextLang(1782); //Default
  CBDefaultPrice.ItemIndex := LastIndex ;

  CBSqlOnlyForStockLookup.Caption :=  GetTextLang(3158);
  cbMergeInvoiceToOrders.Caption :=  GetTextLang(3159);
  cbMergeItemsOnLedger.Caption :=  GetTextLang(3160);
  LDefincForDocs.Caption :=  GetTextLang(3157);
  LButtonLookup.Caption :=  GetTextLang(3161);
  BOptions.Caption :=  GetTextLang(3155);

  LcbCannotEditPrice.Caption :=  GetTextLang(3162);
  LcbCannotEditDescription.Caption :=  GetTextLang(3163);
  LcbGoToQty.Caption :=  GetTextLang(3164);
end;

procedure TfmStockInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblBatchTypes.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblUnit.Close;
end;

procedure TfmStockInfo.sbAddClick(Sender: TObject);
begin
  if edtNewUnit.Text <> '' then
  begin
    UniQUnit.Insert;
   UniQUnit.fieldbyname('SDescription').asstring := edtNewUnit.Text;
   UniQUnit.Post;
   cxGrid1DBTableView1.DataController.RefreshExternalData ;

    edtNewUnit.Text := '';
  end
  else
    edtNewUnit.SetFocus;
end;

procedure TfmStockInfo.sbDeleteClick(Sender: TObject);
begin
  UniQUnit.Delete;
  cxGrid1DBTableView1.DataController.RefreshExternalData ;
end;

procedure TfmStockInfo.UniQUnitAfterInsert(DataSet: TDataSet);
begin
  UniQUnit.FieldByName('WUnitID').Value := DMTCCoreLink.GetNewId(tcidNEWUNITID);
  UniQUnit.FieldByName('FUNITQTY').AsFloat := 1 ;
end;

procedure TfmStockInfo.edtNewUnitKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    sbAddClick(Sender);
    Key := #0;
  end;
  if Key = #27 then
  begin
    edtNewUnit.Text := '';
    Key := #0;
  end;
end;

procedure TfmStockInfo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmStockInfo.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfmStockInfo.edtPrice1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmStockInfo.DBCheckBox3Click(Sender: TObject);
begin
  DBLookupComboBox2.Enabled := DBCheckBox3.Checked;
//  lblLatest.Visible := DBCheckBox3.Checked And (DBCheckBox1.Checked=False);
  Label5.Enabled := DBCheckBox3.Checked;
  rbAveCost.Enabled := DBCheckBox3.Checked;
  rbCostOfSales.Enabled := DBCheckBox3.Checked;
 // lblCostAccount.Visible := DBCheckBox3.Checked;
 // edtCostAccount.Visible := DBCheckBox3.Checked;
  //if DBCheckBox3.Focused And edtCostAccount.Visible then
 //  edtCostAccount.SetFocus;

end;

procedure TfmStockInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(215);
             key := 0;

        end;
end;

procedure TfmStockInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if not dmDatabase.tblSysVars.Active then
 dmDatabase.tblSysVars.open ;
  dmDatabase.tblSysVars.Edit;
  dmDatabase.tblSysVarsBUseAvgCost.Value:= ord(rbAveCost.Checked);
  dmDatabase.tblSysVars.Post;
  SaveReoprtOp;
   if ZQTaxclass.State <> dsbrowse then
    ZQTaxclass.post ;
  CanClose := True;
end;


Procedure TfmStockInfo.LoadReoprtOp;
begin           //yyyy-mm-dd
 // Done : Pieter 2005-12-16 Thsi code does not get used annywhere.
 // edtCostAccount.Text :=  ReadReportOp('SStockInfoCostAcc').AsString;
 cbUseTabsInStock.Checked := ReadReportOp('BUSETABSINSTOCK',True).AsBoolean;
 cbShowBackorders.Checked := ReadReportOp('BWARNBACKORD',False).AsBoolean;
 cbLimitForDefaulSupplier.Checked := DMTCCoreLink.ReadNwReportOp('STKSTOCKLIMITCREDITOR',false) ;

 cbBomStock.Checked := ReadReportOp('BHANDELBOMCOUNT',true).AsBoolean;

 cbNoOutOfStockMsg.Checked := ReadReportOp('cbNoOutOfStockMsg',true).AsBoolean;
 cbOutOfStockDrawCol.Checked := ReadReportOp('cbOutOfStockDrawCol',False).AsBoolean;
 cbButtonLookup.Checked := DMTCCoreLink.readSysParam('LookupButtons',False,CurrentUser);

 CBCantSellOutOfStock.Checked   :=  ReadReportOp('STKCantSellOOS',false).AsBoolean;
 CBNoPrintMessage.Checked   :=  ReadReportOp('CBNoPrintMessage',false).AsBoolean;

 CBNoBackOrder.Checked   :=  ReadReportOp('STKNoBackOrder',false).AsBoolean;
 CBCheckReferenceUsed.Checked   :=  ReadReportOp('STKCheckReferenceUsed',false).AsBoolean;
 CBDoNotCreateItems.Checked   :=  ReadReportOp('STKDoNotCreateItems',false).AsBoolean;

 CBDefaultPrice.ItemIndex   :=  ReadReportOp('STKDefaultPrice',1).AsInteger;
 CBSqlOnlyForStockLookup.Checked   :=  ReadReportOp('STKSQLOnlyForLookup',false).AsBoolean;
 cbGoToQty.Checked   :=  ReadReportOp('STKGotoQty',false).AsBoolean;
 cbCannotEditDescription.Checked   :=  ReadReportOp('STKNoEditDesc',false).AsBoolean;
 cbCannotEditPrice.Checked   :=  ReadReportOp('STKNoEditPrice',false).AsBoolean;
 cbDefInc.Checked   :=  ReadReportOp('STKDefInc',false).AsBoolean;
 cbMergeInvoiceToOrders.Checked   :=  ReadReportOp('STKMergInvToOrd',false).AsBoolean;
 cbMergeItemsOnLedger.Checked   :=  ReadReportOp('STKMergItemsOnLed',false).AsBoolean;

 cbForceStockTypeCheck.Checked   :=  ReadReportOp('STKCHECKType',false).AsBoolean;

  try
  EpaymetItem.Tag := ReadReportOp('STKDISCPAYMENTITEM',0).AsInteger ;
  EpaymetItem.Text := TDataBaseStockRoutines.GetStockFullDescription(EpaymetItem.Tag );

  EpaymetItemCred.Tag := ReadReportOp('STKDISCPAYMENTITEMCR',0).AsInteger ;
  EpaymetItemCred.Text := TDataBaseStockRoutines.GetStockFullDescription(EpaymetItemCred.Tag);


  cbShipcostunittype.tag := cbShipcostunittype.Items.IndexOfObject(TObject(ReadReportOp('STKSHIPUNITTYPE',0).AsInteger));
  cbShipcostunittype.ItemIndex  := cbShipcostunittype.tag  ;
  except
  end;
end;


Procedure TfmStockInfo.SaveReoprtOp;
begin
  // Done : Pieter 2005-12-16 Thsi code does not get used annywhere.
  // WriteReportOp('SStockInfoCostAcc',edtCostAccount.Text  ) ;
  if TDatabaseTableRoutines.GetScale('BACKORD','FSELLINGPRICE') = 2 then
  try
  DMTCCoreLink.ExecSql('ALTER TABLE BACKORD ALTER FSELLINGPRICE TYPE Numeric(12,8)');
  except
     try
       DMTCCoreLink.ExecSql('ALTER TABLE BACKORD ALTER FSELLINGPRICE TYPE Numeric(12,6)');
     except
       try
         DMTCCoreLink.ExecSql('ALTER TABLE BACKORD ALTER FSELLINGPRICE TYPE Numeric(12,4)');
       except

       end;
     end;
  end;

  DMTCCoreLink.WriteSysParam('LookupButtons',Bool2Str(cbButtonLookup.Checked),CurrentUser);
  DMTCCoreLink.ExtraOptions.values['BHANDELBOM'] := BoolToStr(cbBomStock.Checked)  ;
  DMTCCoreLink.ExtraOptions.values['STKCHECKType'] := BoolToStr(cbForceStockTypeCheck.Checked)  ;
  DMTCCoreLink.WriteNwReportOp('STKCHECKType',BoolToStr(cbForceStockTypeCheck.Checked,true)) ;



  DMTCCoreLink.WriteNwReportOp('BHANDELBOMCOUNT',BoolToStr(cbBomStock.Checked,true)) ;
  DMTCCoreLink.WriteNwReportOp('STKSTOCKLIMITCREDITOR',BoolToStr(cbLimitForDefaulSupplier.Checked,true)) ;

  WriteReportOp('BUSETABSINSTOCK',BoolToStr(cbUseTabsInStock.Checked,true) ) ;
          if  cbUseTabsInStock.Checked then
           DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK']:= 'TRUE'  else
           DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] := 'FALSE' ;


  WriteReportOp('BWARNBACKORD',BoolToStr(cbShowBackorders.Checked,true) ) ;
  WriteReportOp('cbNoOutOfStockMsg',BoolToStr(cbNoOutOfStockMsg.Checked,true) ) ;
  WriteReportOp('cbOutOfStockDrawCol',BoolToStr(cbOutOfStockDrawCol.Checked,true) ) ;
  WriteReportOp('STKCantSellOOS',BoolToStr(CBCantSellOutOfStock.Checked,true) ) ;
  WriteReportOp('CBNoPrintMessage',BoolToStr(CBNoPrintMessage.Checked,true) ) ;
  WriteReportOp('STKNoBackOrder',BoolToStr(CBNoBackOrder.Checked,true) ) ;
  WriteReportOp('STKCheckReferenceUsed',BoolToStr(CBCheckReferenceUsed.Checked,true) ) ;
  WriteReportOp('STKDoNotCreateItems',BoolToStr(CBDoNotCreateItems.Checked,true) ) ;
  WriteReportOp('STKDefaultPrice',IntToStr(CBDefaultPrice.ItemIndex) ) ;
  WriteReportOp('STKSQLOnlyForLookup',BoolToStr(CBSqlOnlyForStockLookup.Checked ,true) ) ;
  WriteReportOp('STKGotoQty',BoolToStr(cbGoToQty.Checked ,true) ) ;
  WriteReportOp('STKNoEditDesc',BoolToStr(cbCannotEditDescription.Checked ,true) ) ;
  WriteReportOp('STKNoEditPrice',BoolToStr(cbCannotEditPrice.Checked ,true) ) ;
  WriteReportOp('STKDefInc',BoolToStr(cbDefInc.Checked ,true) ) ;
  WriteReportOp('STKMergInvToOrd',BoolToStr(cbMergeInvoiceToOrders.Checked ,true) ) ;
  WriteReportOp('STKMergItemsOnLed',BoolToStr(cbMergeItemsOnLedger.Checked ,true) ) ;
  WriteReportOp('STKDISCPAYMENTITEM',IntToStr( EpaymetItem.Tag) ) ;
  WriteReportOp('STKDISCPAYMENTITEMCR',IntToStr( EpaymetItemCred.Tag) ) ;


  if cbShipcostunittype.ItemIndex = -1 then
  WriteReportOp('STKSHIPUNITTYPE',IntToStr( 0) )
  else
  WriteReportOp('STKSHIPUNITTYPE',IntToStr(Integer(cbShipcostunittype.Items.Objects[cbShipcostunittype.ItemIndex])) ) ;

end;



procedure TfmStockInfo.BOptionsClick(Sender: TObject);
begin
 ItemOptions:= TItemOptions.create(self);
 try
    ItemOptions.ShowModal ;
 finally
   FreeAndNil(ItemOptions) ;
 end;
end;

procedure TfmStockInfo.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
 cxGrid1DBTableView1FUNITQTY.Visible :=  DMTCCoreLink.ReadSysParam('INVUNITQTY',false,0) ;
 cxGrid1DBTableView1FUNITQTY.VisibleForCustomization := cxGrid1DBTableView1FUNITQTY.Visible ;
 cxGrid1DBTableView1.DataController.DataSource := dmDatabase.dsUnit ;
 dsSysvars.DataSet := dmDatabase.tblSysVars;
 DBLookupComboBox2.ListSource := dmDatabase.dsBatchTypes ;

end;

procedure TfmStockInfo.RefreshUnitlist;
var
 Id ,SettoIndex: Integer ;
 ABookmark : {$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
begin
 id := -1 ;
 SettoIndex := -1 ;
 if cbShipcostunittype.ItemIndex <> -1 then
   id := Integer(cbShipcostunittype.Items.Objects[cbShipcostunittype.ItemIndex]) ;
 dmDatabase.tblUnit.DisableControls ;
 try
 ABookmark :=dmDatabase.tblUnit.Bookmark ;
 cbShipcostunittype.Clear ;
 cbShipcostunittype.AddItem('Disable',nil);
 dmDatabase.tblUnit.First ;
 while not dmDatabase.tblUnit.Eof do
   begin
     cbShipcostunittype.AddItem(dmDatabase.tblUnitSDESCRIPTION.AsString,Tobject(dmDatabase.tblUnitWUNITID.AsInteger));
     if  dmDatabase.tblUnitWUNITID.AsInteger = id then
         SettoIndex := cbShipcostunittype.Items.Count -1 ;
     dmDatabase.tblUnit.Next ;
   end ;

 dmDatabase.tblUnit.Bookmark := ABookmark ;
 finally
  dmDatabase.tblUnit.FreeBookmark(ABookmark);
  dmDatabase.tblUnit.EnableControls ;
 end;
 cbShipcostunittype.ItemIndex := SettoIndex ;
end;

procedure TfmStockInfo.cbShipcostunittypeEnter(Sender: TObject);
begin
RefreshUnitlist ;
end;

procedure TfmStockInfo.BBSalesClick(Sender: TObject);
var
 ReturnID : Integer ;
 ReturnStr : String ;

begin
  EpaymetItem.Color := clHighlight;
  osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Select stock','STKS',tcstALL,tcltStock,EpaymetItem.Tag,0,' and WStockTypeid = 4');
    If ReturnStr = 'ESC' then
     begin
     EpaymetItem.Color := clWindow;
     exit ;
     end;
  EpaymetItem.Tag := ReturnID ;
  EpaymetItem.Text := TDataBaseStockRoutines.GetStockFullDescription(ReturnID);
  EpaymetItem.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockInfo.BitBtn1Click(Sender: TObject);
var
 ReturnID : Integer ;
 ReturnStr : String ;

begin
  EpaymetItemCred.Color := clHighlight;
  osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Select stock','STKS',tcstALL,tcltStock,EpaymetItemCred.Tag,0,' and WStockTypeid = 5');
    If ReturnStr = 'ESC' then
     begin
     EpaymetItemCred.Color := clWindow;
     exit ;
     end;
  EpaymetItemCred.Tag := ReturnID ;
  EpaymetItemCred.Text := TDataBaseStockRoutines.GetStockFullDescription(ReturnID);
  EpaymetItemCred.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockInfo.ZQTaxclassBeforePost(DataSet: TDataSet);
begin
 if ZQTaxclassWSTOCKCLASSTAXID.AsInteger =0 then
    begin
     ZQTaxclassWSTOCKCLASSTAXID.AsInteger := 1 + StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WSTOCKCLASSTAXID) from stocktaxclass')),0);
    end else
    begin
       if TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select count(*) from stock where WINPUTTAX2ID ='+ ZQTaxclassWSTOCKCLASSTAXID.AsString) > 0 then
         begin
            ExecSql('update stock set WCOSTACCOUNTID =  '+ IntToStr(ZQTaxclassWCOSTACCOUNTID.AsInteger) +' ,  WINPUTTAXID= '+
             IntToStr(ZQTaxclassWINPUTTAX.AsInteger) +' ,  WOUTPUTTAXID=   '+
             IntToStr(ZQTaxclassWOUTPUTTAX.AsInteger) +' , WSALESACCOUNTID= '+
             IntToStr(ZQTaxclassWSALESACCOUNTID.AsInteger) +' ,WSTOCKACCOUNTID=  '+
             IntToStr(ZQTaxclassWSTOCKACCOUNTID.AsInteger) +' where WINPUTTAX2ID = ' + ZQTaxclassWSTOCKCLASSTAXID.AsString );
         end;
    end;
end;

procedure TfmStockInfo.ZQTaxclassWINPUTTAXGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
If Sender.AsInteger <> 0 then
  Text := TDataBaseRoutines.GetAccountFullDescription(Sender.AsInteger);
end;

procedure TfmStockInfo.DBEdit4DblClick(Sender: TObject);
 var
 ReturnID : Integer ;
 ReturnStr : String ;
begin
 if ZQTaxclass.IsEmpty then
  ZQTaxclass.Insert else
  ZQTaxclass.Edit ;

  TDBEdit(Sender).Color := clHighlight;
  try
  if (Sender = DBEdit6) then
    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Output','STKS',tcstTAX,tcltAccount,ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger,0,'');
  if (Sender = DBEdit5) then
    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Input','STKS',tcstTAX,tcltAccount,ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger,0,'');

  if (Sender = DBEdit8) then
    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Stock account','STKS',tcstGLTHREE,tcltAccount,ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger,0,'');

  if (Sender = DBEdit7) then
    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Sales account','STKS',tcstGLTHREE,tcltAccount,ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger,0,'');

  if (Sender = DBEdit9) then
    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Cost account','STKS',tcstGLTHREE,tcltAccount,ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger,0,'');


    If ReturnStr = 'ESC' then
     begin
      ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).Clear ;
      TDBEdit(Sender).Color := clWindow ;
      exit ;
     end;
    ZQTaxclass.fieldByName( TdbEdit(Sender).DataField).AsInteger := ReturnID ;
   finally
     TdbEdit(Sender).Color := clWindow;
   end;
end;



procedure TfmStockInfo.BitBtn2Click(Sender: TObject);
begin
DBEdit4DblClick(DBEdit6);
end;

procedure TfmStockInfo.BitBtn3Click(Sender: TObject);
begin
DBEdit4DblClick(DBEdit5);
end;

procedure TfmStockInfo.BitBtn4Click(Sender: TObject);
begin
DBEdit4DblClick(DBEdit8);
end;

procedure TfmStockInfo.BitBtn5Click(Sender: TObject);
begin
DBEdit4DblClick(DBEdit7);
end;

procedure TfmStockInfo.BitBtn6Click(Sender: TObject);
begin
DBEdit4DblClick(DBEdit9);
end;

procedure TfmStockInfo.BitBtn7Click(Sender: TObject);
begin
 ZQTaxclass.first ;
 while not ZQTaxclass.eof do
   begin
      ZQTaxclass.Edit ;
      ZQTaxclass.Post ;
      ZQTaxclass.next;
   end;

end;

end.

