unit UNewDocdetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Uni, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, ExtCtrls, StdCtrls, Buttons,
  cxMemo, cxImageComboBox, cxButtonEdit, ComCtrls, cxEditRepositoryItems,
  cxLabel,UDocRefLinks,tcashclasses,NewLookup,UPluginsSharedUnit,UDMCoreDocData,
  CustomizeDlg,VirtualTable,InvoicePayment,UDocSelectOptions,Debtor,ULocBatSerInput,UOSFVIsuals,UosfResources,UStockLinkDetail,TCVARIABLES,
  Menus, ToolWin;

type
  TfmDocdetails = class(TForm)
    UniDoclines: TUniQuery;
    UniDoclinesWDOCLINEID: TIntegerField;
    UniDoclinesWDOCID: TIntegerField;
    UniDoclinesWSTOCKID: TIntegerField;
    UniDoclinesWLINETYPEID: TIntegerField;
    UniDoclinesWDESCRIPTIONID: TIntegerField;
    UniDoclinesFQTYORDERED: TFloatField;
    UniDoclinesFQTYSHIPPED: TFloatField;
    UniDoclinesFSELLINGPRICE: TFloatField;
    UniDoclinesFITEMDISCOUNT: TFloatField;
    UniDoclinesWTAXID: TIntegerField;
    UniDoclinesFEXCLUSIVEAMT: TFloatField;
    UniDoclinesFINCLUSIVEAMT: TFloatField;
    UniDoclinesFTAXAMOUNT: TFloatField;
    UniDoclinesDSYSDATE: TDateTimeField;
    UniDoclinesSUNIT: TStringField;
    UniDoclinesSSTOCKCODE: TStringField;
    UniDoclinesWPROFILEID: TIntegerField;
    UniDoclinesWSERIALNOID: TIntegerField;
    UniDoclinesWSORTNO: TIntegerField;
    UniDoclinesWREPORTINGGROUP1ID: TIntegerField;
    UniDoclinesWREPORTINGGROUP2ID: TIntegerField;
    UniDoclinesWACCOUNTID: TIntegerField;
    dsUniDoclines: TDataSource;
    dsUnidochead: TDataSource;
    UniDochead: TUniQuery;
    UniDocheadWDOCID: TIntegerField;
    UniDocheadSDOCNO: TStringField;
    UniDocheadWTYPEID: TIntegerField;
    UniDocheadDDATE: TDateTimeField;
    UniDocheadDALLOCATEDDATE: TDateTimeField;
    UniDocheadWACCOUNTID: TIntegerField;
    UniDocheadWPAYMENTTYPEID: TIntegerField;
    UniDocheadWPOSTAL1ID: TIntegerField;
    UniDocheadWPOSTAL2ID: TIntegerField;
    UniDocheadWPOSTAL3ID: TIntegerField;
    UniDocheadWPOSCOUNTRIES_ID: TIntegerField;
    UniDocheadWPOSTALCODEID: TIntegerField;
    UniDocheadWMESSAGE1ID: TIntegerField;
    UniDocheadWMESSAGE2ID: TIntegerField;
    UniDocheadWMESSAGE3ID: TIntegerField;
    UniDocheadFINVOICEDISCOUNT: TFloatField;
    UniDocheadWSALESMANID: TIntegerField;
    UniDocheadSREFERENCE: TStringField;
    UniDocheadWDELADDRESS1ID: TIntegerField;
    UniDocheadWDELADDRESS2ID: TIntegerField;
    UniDocheadWDELADDRESS3ID: TIntegerField;
    UniDocheadWDELCOUNTRIES_ID: TIntegerField;
    UniDocheadWDELCODEID: TIntegerField;
    UniDocheadBPRINTED: TSmallintField;
    UniDocheadBPOSTED: TSmallintField;
    UniDocheadWREPORTINGGROUP1ID: TIntegerField;
    UniDocheadWREPORTINGGROUP2ID: TIntegerField;
    UniDocheadWPAYMENTGROUPID: TIntegerField;
    UniDocheadBEXCLUSIVE: TSmallintField;
    UniDocheadWCURRENCYID: TIntegerField;
    UniDocheadFDOCAMOUNT: TFloatField;
    UniDocheadFTAXAMOUNT: TFloatField;
    UniDocheadBREPEATING: TSmallintField;
    UniDocheadDSYSDATE: TDateTimeField;
    UniDocheadWSOURCETYPEID: TIntegerField;
    UniDocheadWPROFILEID: TIntegerField;
    UniDocheadWTERMS: TIntegerField;
    UniDocheadWJOBCODEID: TIntegerField;
    UniDocheadDDUEDATE: TDateTimeField;
    UniDocheadWUSERID: TIntegerField;
    UniDocheadSEXTERNALID: TStringField;
    UniDocheadWPOSTALNAME: TIntegerField;
    UniDocheadWPOSTALCONTACT: TIntegerField;
    UniDocheadWDELNAME: TIntegerField;
    UniDocheadWDELCONTACT: TIntegerField;
    UniDocheadWTAXNUMBER: TIntegerField;
    UniDocheadWCONTRAACCOUNT: TIntegerField;
    UniDocheadWOPENITEMTRANSACTID: TIntegerField;
    UniDocheadFPAYMENTDISCOUNT: TFloatField;
    UniDocheadFCURRENCYRATE: TFloatField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WDOCLINEID: TcxGridDBColumn;
    cxGrid1DBTableView1WDOCID: TcxGridDBColumn;
    cxGrid1DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid1DBTableView1WLINETYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1WDESCRIPTIONID: TcxGridDBColumn;
    cxGrid1DBTableView1FQTYORDERED: TcxGridDBColumn;
    cxGrid1DBTableView1FQTYSHIPPED: TcxGridDBColumn;
    cxGrid1DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid1DBTableView1FITEMDISCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1WTAXID: TcxGridDBColumn;
    cxGrid1DBTableView1FEXCLUSIVEAMT: TcxGridDBColumn;
    cxGrid1DBTableView1FINCLUSIVEAMT: TcxGridDBColumn;
    cxGrid1DBTableView1FTAXAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1SUNIT: TcxGridDBColumn;
    cxGrid1DBTableView1SSTOCKCODE: TcxGridDBColumn;
    cxGrid1DBTableView1WPROFILEID: TcxGridDBColumn;
    cxGrid1DBTableView1WSERIALNOID: TcxGridDBColumn;
    cxGrid1DBTableView1WSORTNO: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    PMAinData: TPanel;
    PnlDocHeader: TPanel;
    Label14: TcxLabel;
    Label15: TcxLabel;
    Label19: TcxLabel;
    Image3: TImage;
    Image2: TImage;
    LAddress1: TcxLabel;
    LAddress2: TcxLabel;
    LAddress3: TcxLabel;
    LPostal: TcxLabel;
    LCountry: TcxLabel;
    LCompany: TcxLabel;
    LContact: TcxLabel;
    LtaxRef: TcxLabel;
    Bevel1: TBevel;
    PExtra: TPanel;
    Lpaydiscount: TcxLabel;
    Lshipment: TcxLabel;
    lshipmentAmt: TcxLabel;
    Panel9: TPanel;
    Label13: TcxLabel;
    Label12: TcxLabel;
    lblRep1: TcxLabel;
    lblRep2: TcxLabel;
    Label3i: TcxLabel;
    Label21: TcxLabel;
    LProject: TcxLabel;
    lstate: TcxLabel;
    BPutOnAccount: TBitBtn;
    pCurrency: TPanel;
    Label27: TcxLabel;
    Label28: TcxLabel;
    edtOrderNumber: TcxDBTextEdit;
    cbSalesman: TcxDBImageComboBox;
    CbxRepGroup1: TcxDBImageComboBox;
    CbxRepGroup2: TcxDBImageComboBox;
    cbProject: TcxDBImageComboBox;
    cbCurrency: TcxDBImageComboBox;
    cbPosted: TcxDBImageComboBox;
    cbRate: TcxDBTextEdit;
    CBCountry: TcxDBImageComboBox;
    EContact: TcxDBComboBox;
    EDelContact: TcxDBComboBox;
    CBDelCountry: TcxDBImageComboBox;
    ECompany: TcxDBTextEdit;
    EPostal1: TcxDBTextEdit;
    EPostal2: TcxDBTextEdit;
    EPostal3: TcxDBTextEdit;
    EDelCompany: TcxDBTextEdit;
    Eshipment: TcxDBTextEdit;
    EDelAdr1: TcxDBTextEdit;
    EDelAdr2: TcxDBTextEdit;
    EPostalCode: TcxDBTextEdit;
    EDelAdr3: TcxDBTextEdit;
    EDelPostal: TcxDBTextEdit;
    EMessage1: TcxDBTextEdit;
    EPaymentDiscount: TcxDBTextEdit;
    cbShipments: TcxDBImageComboBox;
    EMessage2: TcxDBTextEdit;
    EMessage3: TcxDBTextEdit;
    ETaxCode: TcxDBTextEdit;
    EDocEmailAddress: TcxDBTextEdit;
    ESExtraDesc: TcxDBTextEdit;
    dtpDuedate: TcxDBDateEdit;
    dtpDate: TcxDBDateEdit;
    Panel10: TPanel;
    Label22: TcxLabel;
    LFastlookup: TcxLabel;
    BtnOkPrint: TBitBtn;
    BtnClose: TBitBtn;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label2: TcxLabel;
    Label4: TcxLabel;
    Label1: TcxLabel;
    Label5: TcxLabel;
    Label1i: TcxLabel;
    Label17: TcxLabel;
    Label18: TcxLabel;
    Label16: TcxLabel;
    LGross: TcxLabel;
    LNetto: TcxLabel;
    LStdDiscount: TcxLabel;
    LEndTotal: TcxLabel;
    Label10: TcxLabel;
    Label23: TcxLabel;
    lblInvAmt: TStaticText;
    lblCredLimit: TStaticText;
    lblAvailable: TStaticText;
    lblPostBal: TStaticText;
    LNettoWeigth: TStaticText;
    LGrossWeigth: TStaticText;
    LblDiscount: TStaticText;
    LPaymentTotal: TStaticText;
    lbDiscountperc: TStaticText;
    EndTotal: TStaticText;
    stgrosscost: TStaticText;
    stGrossProfit: TStaticText;
    LLPaymentTotal: TButton;
    LblExcl: TStaticText;
    LblTax: TStaticText;
    EFastbarcodelookup: TEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBButtonEdit1: TcxDBButtonEdit;
    PopupMenu1: TPopupMenu;
    Entertotal1: TMenuItem;
    Up1: TMenuItem;
    Down1: TMenuItem;
    N1: TMenuItem;
    Sortonstockcode1: TMenuItem;
    Link1: TMenuItem;
    PEditPrice: TPanel;
    MOptions: TMemo;
    PEditPriceInner: TPanel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    LEPricePurchase: TLabel;
    BSavePriceChange: TBitBtn;
    EPrice3: TEdit;
    EPrice2: TEdit;
    EPrice1: TEdit;
    btnEnterIncExc: TBitBtn;
    ENewDescription: TEdit;
    cbDefsupp: TCheckBox;
    EPricePurchase: TEdit;
    bStockPlugins: TBitBtn;
    PEXtraData: TPanel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Lsale30: TLabel;
    Lsale60: TLabel;
    Lsale90: TLabel;
    EEdiTrigg: TEdit;
    EEdtMIN: TEdit;
    EedtReord: TEdit;
    PnlComment: TPanel;
    Label6: TLabel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    EdComment: TMemo;
    BRemFinder: TBitBtn;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    tbPlugins: TToolButton;
    Thideshowitems: TToolButton;
    tlbtnDelete: TToolButton;
    tlbtnInsert: TToolButton;
    tlbtnExclIncl: TToolButton;
    tlbtnIncl: TToolButton;
    tlbtnDisc: TToolButton;
    tlbtnComment: TToolButton;
    tlbtnDeleteInv: TToolButton;
    TlbtnCopy: TToolButton;
    tbBackorder: TToolButton;
    PNewTotal: TPanel;
    LEnternewtotal: TLabel;
    ENewTotal: TEdit;
    pnlDiscount: TPanel;
    Label3: TLabel;
    edtDiscount: TEdit;
    UniDoclinesFUNITQTY: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure UniDocheadAfterInsert(DataSet: TDataSet);
    procedure UniDoclinesAfterInsert(DataSet: TDataSet);
    procedure UniDoclinesWSTOCKIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure UniDoclinesWDESCRIPTIONIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure UniDoclinesWDESCRIPTIONIDSetText(Sender: TField;
      const Text: String);
    procedure UniDocheadWACCOUNTIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BtnOkPrintClick(Sender: TObject);
    procedure UniDoclinesCalcFields(DataSet: TDataSet);
    procedure UniDoclinesBeforeOpen(DataSet: TDataSet);
    procedure UniDocheadBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tlbtnInsertClick(Sender: TObject);
    procedure tlbtnDeleteClick(Sender: TObject);
    procedure tlbtnCommentClick(Sender: TObject);
    procedure cxGrid1DBTableView1WSTOCKIDPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBTableView1WDESCRIPTIONIDGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
  private      
     fmDocLinks: TfmDocLinks;
    LinkToList :TStringList ;
    BForceSpecialRecalc,BISSavePRocess : Boolean ;
    CustomGetSuppCodeSql : String ;
    aPayDiscountItem ,
    aPayDiscountItemCred ,
    aShipcostunittype : Integer ;
    BBelgiumStyleDiscount : Boolean ;
    ctrlDown, ShowSpecialAccount ,UseUnitQty ,UseUnitQtyForSale,LoadingGridData : Boolean ;
    EditStockPrices , UsePricePlugin : Boolean ;
    UseMuliplier : Integer ;
    CheckStockTypesSet : Set of byte ;
    fmDebtor: TfmDebtor;
    fmInvocePayment: TfmInvocePayment;
    fmStockLinkDetail : TStockLinkDetail ;
    LastShift : TShiftState ;
    GridActiveLineDocid : Integer ;
    ShowHintForLine : Boolean ;
    FieldChgd , GoToStockQty,CannotEditDesc,CannotEditPrice: Boolean;
    AccID,ListOrderBy:Integer;
    HasBeenInitialized ,BPurVis : Boolean ;
    BDirection,IsComment,NewRecord,InMoveColum : Boolean ;
    aLedgerPeriodeCollection : TLedgerPeriodeCollection ;
//    InvTaxRefOff,
    DisableItemsList : String ;
    FirstTime : Boolean;

    MyLocBatSerInput: TLocBatSerInput;
    NoOutOfStockMsg,OutOfStockDrawColors : Boolean ;
    ATempStockList : TStockRecList ;
    aAccountRecList : TAccountRecList ;
    AAccRec : TAccountRecPointer ;
    astockrecpointer : TStockRecPointer ;
    BPriceAgreeUseOrgPrice ,BuseMarginRule: Boolean ;
    anewlocallook : TfmPosLookup ;
    FOnModalResultEvent: TNotifyEvent;
    procedure ApplyStockCodeToCurrentRecord(UseOrgPrice: Boolean = false );
    procedure SelectStockItem(JustAdd: Boolean = False );
    procedure SetStockEditPrice;
    function UpdateStockRecWithPriceForplugin(var AStockRec: TStockRec;
      AMultiplier: Double): Boolean;
    procedure SendMessagePriceMessagePlugin(AMessage: String; var price1,
      price2, price3, Sellingprice, Discount: Double);
    function GetPluginLineString(IsLine : Boolean = true): String;
    { Private declarations }
  public
    nextLineId : Integer ;
    wDocRowDecimals : Integer ;
       // AGridstream : TmemoryStream ;
    FProjectId: Integer; 
     ForceDocType : Integer ;
     LocalDocType : Integer ;
     Gridinpatch : Boolean ;
     PaymentDetails : TVirtualTable ;
     ASearchPanel : TSearchPanel ;
     DocSelectOptions: TDocSelectOptions ;
     AFormPluginRecordArray : array [0..9] of TFormPluginRecord ;

     DefaultPrice,
     CreditLimit,
     ToTalAccount:real;
     CanSetupGridLayout,
//     TaxRefOff,
     BCalcInProg,
     WClose,
     ForceCol0,InGrid:Boolean;
     LastDocHeaderId ,DefaultTaxId: Integer ;
     NEWName,LastActiveStockCode : String ;
     STKNoBackOrder : Boolean ;
     LastStock : TStockRec ;
     DummyLastStock : TStockRec ;
     LastBatchLineId : Integer ;
     LastDocPosted : Boolean ;
     ListIsReadOnly, ShowStkGrosscost ,ShowGrossAsCostprice: Boolean ;
     LookupFrom,AddInvoiceForAccount,AddProjectForAccount : Integer ;
     MessageNewInvoice : String ;
     LookupAmount : Double ;
     GoToDocId,GoToLineID : Integer ;
     CopyOrderCol : Integer ;
     CopyOrderDirection : Boolean ;
     DocHeadQuery,OSCommerceLinkDocURL,OSCommerceLinkCustURL,LimitDocSql : String ;
     LikeSeach : Boolean ;

     OldStockValue,
      DebtDiscount,
      GlobalDiscount,
      TempQtyOnHand      : Real;
      ColInMod,
      IntSellingPrice,
      LastPnlX,LastPnlY:Integer;
      AllOk,ExclMode:Boolean;
      TmpCaption:String;
    {}
      edtWAccountID ,
      LookAccType    : Integer;
      Diff,
      TotalAcc,TotalLimit : Double;
      isbtnSwap:Boolean;
      AExternalForm : TForm ;
      AExternalSendString : String ;
      AfmStockEntry : TForm ;
      AExternalMForm : TForm ;
      AExternalMSendString : String ;
      ExtraColorCondition : String ;
      ExtraColorBg,ExtraColorFont : Tcolor ;
      APluginsFormsList : TStringlist ;
      aDMCoreDocData : TDMCoreDocData ;
      LastDate : TDatetime ;
    procedure InitDoc(ADocid,WdocTypeid : integer) ;

    { Public declarations }
  end;

var
  fmDocdetails: TfmDocdetails;

implementation

uses UDMTCCoreLink, UDmQuantumGridDefs, OSFGeneralRoutines,databaseaccess,
  StockEntry;

{$R *.dfm}

procedure TfmDocdetails.FormCreate(Sender: TObject);
var
 i : Integer;
 AFloatField : TFloatField ;
begin
 wDocRowDecimals := 2 ;
DMTCCoreLink.AssignConnectionToChilds(self);
  LProject.Visible := DMTCCoreLink.ReadNwReportOp('cbProjects',false) ;
  cbProject.Visible := LProject.Visible  ;

  LinkToList :=TStringList.Create ;

 LocalDocType := idDocType ;
 Link1.Visible := DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' ;
 
if LocalDocType > 18 then
  LocalDocType := 14 + (LocalDocType mod 2) ;
  
 
PopupMenu1.Images := dmOsfResource.MenuImages ;
fmStockLinkDetail := TStockLinkDetail.Create(Application);
  fmDocLinks :=  TfmDocLinks.Create(Self);
ASearchPanel := TSearchPanel.Create(self) ;

TDatabaseTableRoutines.FillStringsWithSelect(TcxImageComboBoxProperties(cxGrid1DBTableView1WTAXID.Properties),'Select WAccountid  ,SAccountCode || ' +QuotedStr(' ')+'|| SDESCRIPTION from account where waccounttypeid = 4 order by 2');
cxGrid1DBTableView1WTAXID.Visible := TcxImageComboBoxProperties(cxGrid1DBTableView1WTAXID.Properties).Items.Count <> 0 ;
TDatabaseTableRoutines.FillStringsWithSelect(TcxImageComboBoxProperties(cxGrid1DBTableView1SUNIT.Properties),'SELECT WUNITID , SDESCRIPTION FROM UNIT   order by 2');
cxGrid1DBTableView1SUNIT.Visible := TcxImageComboBoxProperties(cxGrid1DBTableView1SUNIT.Properties).Items.Count <> 0 ;   
TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP1ID.Properties),1002);
cxGrid1DBTableView1WREPORTINGGROUP1ID.Visible := TcxImageComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP1ID.Properties).Items.Count <> 0 ;
TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP2ID.Properties),1003);
cxGrid1DBTableView1WREPORTINGGROUP2ID.Visible := TcxImageComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP2ID.Properties).Items.Count <> 0 ;
TDatabaseTableRoutines.FillStringsWithSelect(cbCurrency.Properties,'Select WCURRENCYID , SDESCRIPTION from CURRENCY order by WCURRENCYID');
if cbCurrency.Properties.Items.Count < 2 then
  pCurrency.Visible := False ;
CustomGetSuppCodeSql := DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_GETSUPCODE');


ATempStockList := TStockRecList.create ;
aAccountRecList := TAccountRecList.create ;

ShowSpecialAccount := DMTCCoreLink.ReadNwReportOp('OPENAPIPLUGIN',false) ;
UsePricePlugin :=  DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false) ;
BPriceAgreeUseOrgPrice :=  DMTCCoreLink.ReadSysParam('PRICEAGREE_CALCDISC',false,0);
EditStockPrices :=  DMTCCoreLink.ReadNwReportOp('EDITSTOCKPRICE',false) ;
UseMuliplier := 0;

BForceSpecialRecalc :=  DMTCCoreLink.ReadSysParam('FORCESPECIALRECALC',false,0);

if   DMTCCoreLink.ReadNwReportOp('BUSEMUTLIPIER',false) then
  UseMuliplier := 1 ;
if   DMTCCoreLink.ReadNwReportOp('BUSEDIVIDER',false) then
  UseMuliplier := 2 ;

ShowStkGrosscost :=  DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCT',false,0) ;
ShowStkGrosscost :=  DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCT',ShowStkGrosscost,CurrentUser) ;
ShowGrossAsCostprice  :=  DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCP',false,0) ;
UseUnitQty    :=  DMTCCoreLink.ReadSysParam('INVUNITQTY',false,0) ;
UseUnitQtyForSale    :=  DMTCCoreLink.ReadSysParam('INVUNITQTYSALE',false,0) ;
BuseMarginRule :=  DMTCCoreLink.ReadSysParam('USEMARGINRULE',false,0) ;

PEXtraData.Visible :=    DMTCCoreLink.ReadSysParam('INVPUR_EXTRA',false,0) ;
BRemFinder.Visible := (DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_FREEDESCLOOKUPRESULT') <>nil)
and ( DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_FREEDESCLOOKUPTYPE') <>nil) ;
BRemFinder.Caption :=  DMTCCoreLink.GetTextLangNoAmp( 854);
if ShowStkGrosscost then
  begin
    AFloatField := TFloatField.Create(self);
    AFloatField.FieldKind := fkCalculated ;
    AFloatField.FieldName := 'FCOST' ;
    AFloatField.DataSet := UniDoclines ;
    AFloatField.DisplayFormat := '0.00' ;
    AFloatField.ReadOnly := False ;
    AFloatField.Name := UniDoclines.Name + AFloatField.FieldName;
    UniDoclines.FieldDefs.UpDate;
  end;
 CheckStockTypesSet := [0,7,9] ;

 if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
    CheckStockTypesSet := CheckStockTypesSet + [1] ;

 MyLocBatSerInput:= TLocBatSerInput.create(self);
 cxGrid1DBTableView1WTAXID.Options.Editing := not DMTCCoreLink.ReadSysParam('INV_TAXREADONLY',False,DMTCCoreLink.currentuser) ;


 APluginsFormsList := TStringlist.create ;
 PaymentDetails := TVirtualTable.create(self) ;
 PaymentDetails.FieldDefs.Add('Amount',ftFloat);
 PaymentDetails.FieldDefs.Add('AccName',ftString,DMTCCoreLink.MessageLength);
 PaymentDetails.FieldDefs.Add('AccNr',ftInteger);
 PaymentDetails.open ;
 DocSelectOptions := TDocSelectOptions.create(self) ;
 fmInvocePayment := TfmInvocePayment.create(self);
 aDMCoreDocData := TDMCoreDocData.create(self) ;
 LikeSeach := DMTCCoreLink.ReadSysParam('LikeSearchForStrings',false,CurrentUser) ;
 

  

Self.Caption := DMTCCoreLink.GetTextLang(587);//Caption 587

Thideshowitems.Caption := DMTCCoreLink.GetTextLang(3282);
tbPlugins.Caption := DMTCCoreLink.GetTextLang(3282);

tlbtnDelete.Caption := DMTCCoreLink.GetTextLang(367);//Btn ^D Delete
tlbtnInsert.Caption := DMTCCoreLink.GetTextLang(368);//Btn ^N Insert
tlbtnExclIncl.Caption := DMTCCoreLink.GetTextLang(371);//Btn F7 ExclIncl
tlbtnDisc.Caption := DMTCCoreLink.GetTextLang(658);//Btn F8 Discount
tlbtnComment.Caption := DMTCCoreLink.GetTextLang(659);//Btn F9 Comment
tlbtnDeleteInv.Caption := DMTCCoreLink.GetTextLang(660);//Btn F10 Delete All
TlbtnCopy.Caption := DMTCCoreLink.GetTextLang(867);//Btn F11 Copy
Label3.Caption := DMTCCoreLink.GetTextLang(663);//Enter overall discount
Label6.Caption := DMTCCoreLink.GetTextLang(662);//&Comment Line Invoice
BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);//Btn Cancel
BtnOk.Caption := DMTCCoreLink.GetTextLang(167);//Btn Ok
// blPrnType.Caption := DMTCCoreLink.GetTextLang(323); //lblPrnType

 
lblRep1.Caption := DMTCCoreLink.GetTextLang(179);//Rep Group1 179
Label14.Caption := DMTCCoreLink.GetTextLang(235);//Postal Address 235
Label16.Caption := DMTCCoreLink.GetTextLang(194);//Current Balance 194
Label18.Caption := DMTCCoreLink.GetTextLang(236);//Available 236
Label17.Caption := DMTCCoreLink.GetTextLang(192);//Credit Limit 192
LStdDiscount.Caption := DMTCCoreLink.GetTextLang(3429);//

Label3i.Caption := DMTCCoreLink.GetTextLang(198);//Salesman 198
Label12.Caption := DMTCCoreLink.GetTextLang(237);//Your Reference No 237
Label13.Caption := DMTCCoreLink.GetTextLang(238);//Date 238
lblRep2.Caption := DMTCCoreLink.GetTextLang(180);//Rep Group2 180
Label15.Caption := DMTCCoreLink.GetTextLang(199);//Delivery Address 199
Label19.Caption := DMTCCoreLink.GetTextLang(239);//Message 239
btnClose.Caption := DMTCCoreLink.GetTextLang(168);//
btnOkPrint.Caption := DMTCCoreLink.GetTextLang(167);//Print 52
BSavePriceChange.Caption := DMTCCoreLink.GetTextLang(726);

 
LFastlookup.Caption := DMTCCoreLink.GetTextLang(3283);
Entertotal1.Caption := DMTCCoreLink.GetTextLang(3284);
 
 
  NoOutOfStockMsg := DMTCCoreLink.ReadNwReportOp('cbNoOutOfStockMsg',true);
  OutOfStockDrawColors := DMTCCoreLink.ReadNwReportOp('cbOutOfStockDrawCol',false);
 UniDoclines.open ;

if UseMuliplier > 0 then
  begin
     with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := 'X' ;
          DataBinding.FieldName := 'FUNITQTY' ;
       end;

  end;
  
  if UniDoclines.findfield('BCHECKED') <> nil then
    begin
     with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(3280) ;
          DataBinding.FieldName := 'BCHECKED' ;
          RepositoryItem := dmQuantumGridDefs.osfDBCheckbox ;
       end;

    end;
  if UniDoclines.FindField('DDELIVERDATE') <> nil then
    begin
     with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(3279) + ' 1' ;
          DataBinding.FieldName := 'DDELIVERDATE' ;
       end;
    end;

  if UniDoclines.FindField('DDELIVERDATE2') <> nil then
    begin
     with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(3279)+ ' 2'  ;
          DataBinding.FieldName := 'DDELIVERDATE2' ;
       end;

    end;

  if UniDoclines.FindField('WFREETYPEID') <> nil then
    begin
         with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(1030) ;
          DataBinding.FieldName := 'WFREETYPEID' ;
       end;

    end;

  if UniDoclines.FindField('DEXTRADATE1') <> nil then
    begin
   with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(3279)+ ' 3'  ;
          DataBinding.FieldName := 'DEXTRADATE1' ;
       end;
    end;

  if UniDoclines.FindField('DEXTRADATE2') <> nil then
    begin
   with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
       begin
          Caption := DmtccoreLink.GetTextLang(3279) + ' 4' ;
          DataBinding.FieldName := 'DEXTRADATE2' ;
       end;
 
    end;



   cxGrid1DBTableView1WACCOUNTID.Visible := ShowSpecialAccount ;

  aPayDiscountItem := 0;
  aPayDiscountItemCred := 0 ;
  aShipcostunittype := 0;
  BBelgiumStyleDiscount := False ;

  if TDatabaseTableRoutines.FieldExists('DOCHEAD','FPAYMENTDISCOUNT') then
  begin
   aPayDiscountItem := DMTCCoreLink.ReadNwReportOp('STKDISCPAYMENTITEM',0) ;
   aPayDiscountItemCred := DMTCCoreLink.ReadNwReportOp('STKDISCPAYMENTITEMCR',0) ;
   PExtra.Visible := True ;
   BBelgiumStyleDiscount := DMTCCoreLink.ReadNwReportOp('STKDISCBELGIUMSTYLE',False);

  end;
  if TDatabaseTableRoutines.FieldExists('DOCHEAD','WSHIPSTOCKID') then
  begin
   //WSHIPSTOCKID Integer
   PExtra.Visible := True ;
   aShipcostunittype := DMTCCoreLink.ReadNwReportOp('STKSHIPUNITTYPE',0);
   if aShipcostunittype <> 0 then
     TDatabaseTableRoutines.FillStringsWithSelect(cbShipments.properties,'Select WStockid,SStockCode || '+ QuotedStr(' ') + ' || SDescription Descrip from Stock where WUnitid =  ' + IntToStr(aShipcostunittype))
    else
    begin
      Lshipment.Visible := false ;
      cbShipments.Visible := false ;
      Eshipment.Visible := false ;
      LshipmentAmt.Visible := false ;
    end;
  end;

  LEndTotal.Visible := PExtra.Visible ;
  EndTotal.Visible := PExtra.Visible ;

   Link1.Caption := DMTCCoreLink.GetTextLang(3484);
 

   cxGrid1DBTableView1WSTOCKID.Caption := DMTCCoreLink.GetTextLang(1832); // Item No
  cxGrid1DBTableView1WDESCRIPTIONID.Caption := DMTCCoreLink.GetTextLang(1860); // Description
  cxGrid1DBTableView1FQTYORDERED.Caption  := DMTCCoreLink.GetTextLang(1861); // Order
  cxGrid1DBTableView1FQTYSHIPPED.Caption  := DMTCCoreLink.GetTextLang(1862); // Ship
  cxGrid1DBTableView1WTAXID.Caption   := DMTCCoreLink.GetTextLang(1863); // Tax
  cxGrid1DBTableView1FSELLINGPRICE.Caption   := DMTCCoreLink.GetTextLang(1864); // Excl Amt
  cxGrid1DBTableView1FITEMDISCOUNT.Caption   := DMTCCoreLink.GetTextLang(1865); //Disc %
  cxGrid1DBTableView1FINCLUSIVEAMT.Caption   := DMTCCoreLink.GetTextLang(1864); //Incl Amt


  cxGrid1DBTableView1WREPORTINGGROUP1ID.Caption := TDataBaseRoutines.GetTypeDescription(1002); // type desc
  cxGrid1DBTableView1WREPORTINGGROUP2ID.Caption := TDataBaseRoutines.GetTypeDescription(1003); // type desc
  cxGrid1DBTableView1SUNIT.Caption := DMTCCoreLink.GetTextLang(214);





end;

procedure TfmDocdetails.InitDoc(ADocid, WdocTypeid: integer);
begin
   DMTCCoreLink.DescObject.Clear ;
   UniDochead.Close ;
   UniDochead.Params[0].AsInteger := ADocid ;
   UniDochead.Open ;
   if UniDochead.IsEmpty then
     begin
      UniDochead.Insert ;
     end ;
   UniDoclines.Close ;
   UniDoclines.Params[0].AsInteger := ADocid ;
   UniDoclines.Open ;
   nextLineId := 0 ;
   while not UniDoclines.eof do
     begin
        if  UniDoclinesWDOCLINEID.AsInteger > nextLineId then
            nextLineId := UniDoclinesWDOCLINEID.AsInteger ;
        UniDoclines.next ;
     end;
   inc(nextLineId) ;

end;

procedure TfmDocdetails.UniDocheadAfterInsert(DataSet: TDataSet);
begin
   UniDocheadWDOCID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_DOCID') ;
end;

procedure TfmDocdetails.UniDoclinesAfterInsert(DataSet: TDataSet);
begin
 UniDoclinesWDOCID.AsInteger := UniDocheadWDOCID.AsInteger;
 UniDoclinesWDOCLINEID.AsInteger :=  nextLineId ; 

 inc(nextLineId);

end;

procedure TfmDocdetails.UniDoclinesWSTOCKIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := DMTCCoreLink.stockObject.getStockCode(Sender.AsInteger);
end;

procedure TfmDocdetails.UniDoclinesWDESCRIPTIONIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := DMTCCoreLink.ReadDescription(sender.AsInteger) ;
end;

procedure TfmDocdetails.UniDoclinesWDESCRIPTIONIDSetText(Sender: TField;
  const Text: String);
begin
   sender.AsInteger := DMTCCoreLink.DescObject.GetAddDescription(Text,UniDoclinesWLINETYPEID.AsInteger =91)
end;

procedure TfmDocdetails.UniDocheadWACCOUNTIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := DMTCCoreLink.AccObject.getAccountFullDescription(Sender.AsInteger);
end;

procedure TfmDocdetails.BtnOkPrintClick(Sender: TObject);
begin
  if UniDochead.State <> dsbrowse then
   UniDochead.post ;
if UniDochead.UpdatesPending then
   UniDochead.CommitUpdates ;
if UniDoclines.State <> dsbrowse then
   UniDoclines.post ;
if UniDoclines.UpdatesPending then
   UniDoclines.CommitUpdates ;

  ModalResult := mrok ;
end;

procedure TfmDocdetails.UniDoclinesCalcFields(DataSet: TDataSet);
var
 astockrecpointer : TStockRecPointer ;
 MultiPlier,MultiPlier2 : Double;
begin
if UniDoclines.findfield('FCOST')  <> nil then
 begin
 if (UniDoclinesWLINETYPEID.AsInteger <> 91) and ((UniDoclinesWSTOCKID.AsInteger = 0 ) or (UniDoclinesFQTYSHIPPED.AsFloat=0) or (UniDoclinesFSELLINGPRICE.AsFloat=0)) then
  begin
     UniDoclines.findfield('FCOST').ReadOnly := false ;
     UniDoclines.findfield('FCOST').asFloat := 0 ;
     UniDoclines.findfield('FCOST').ReadOnly := True ;

   end else
 if ShowStkGrosscost and (UniDoclinesWLINETYPEID.AsInteger <> 91) then
    begin
   MultiPlier2 := UniDoclinesFQTYSHIPPED.AsFloat ;
   if MultiPlier2 = 0 then MultiPlier2 := 1 ;
     MultiPlier :=  UniDoclines.fieldByName('FUNITQTY').AsFloat ;
     if MultiPlier = 0 then MultiPlier := 1 ;
     MultiPlier := MultiPlier * MultiPlier2 ;
     UniDoclines.findfield('FCOST').ReadOnly := false ;
     UniDoclines.findfield('FCOST').asFloat := 0 ;
      UniDoclines.findfield('FCOST').ReadOnly := false ;
      ATempStockList.getStockOnid(astockrecpointer,UniDoclinesWSTOCKID.AsInteger)  ;
      if ShowGrossAsCostprice then
      begin
       UniDoclines.findfield('FCOST').ReadOnly := false ;
      if  not(astockrecpointer^.FReorderQty = -1) then
      begin
        if ExclMode then
         UniDoclines.findfield('FCOST').asFloat :=  ((UniDoclinesFQTYSHIPPED.AsFloat  * MultiPlier) *   astockrecpointer^.FAvgUnitCost)
        else
        UniDoclines.findfield('FCOST').asFloat := (( UniDoclinesFQTYSHIPPED.AsFloat *   MultiPlier)*   astockrecpointer^.FAvgUnitCost);
      end;
      end else
      begin
      UniDoclines.findfield('FCOST').ReadOnly := false ;
      UniDoclines.findfield('FCOST').asFloat := UniDoclinesFEXCLUSIVEAMT.AsFloat -  ((UniDoclinesFQTYSHIPPED.AsFloat  * MultiPlier) *   astockrecpointer^.FAvgUnitCost)
      end;
     UniDoclines.findfield('FCOST').ReadOnly := True ;
   end;
   end;
 

end;
procedure TfmDocdetails.UniDoclinesBeforeOpen(DataSet: TDataSet);
begin
   TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'SELECT first 1 * FROM DOCLINE');
end;

procedure TfmDocdetails.UniDocheadBeforeOpen(DataSet: TDataSet);
begin
 TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'SELECT first 1 * FROM DOCHEAD');
end;

procedure TfmDocdetails.FormDestroy(Sender: TObject);
var
 i : Integer ;
begin
 LinkToList.free ;
 fmDocLinks.free ;
 if Assigned(fmStockLinkDetail) then
  FreeAndNil(fmStockLinkDetail);
 if Assigned(MyLocBatSerInput) then
  FreeAndNil(MyLocBatSerInput);
  FreeAndNil(aDMCoreDocData) ;
  PaymentDetails.free ;
  DocSelectOptions.free ;
  if AExternalForm <> nil then
     begin
        AExternalEditAddItemToDocPlugin.aUnLoadFormPlugin(AExternalForm);
        AExternalForm := nil ;
     end;
  WinFormID :='';
  APluginsFormsList.free ;
  ATempStockList.free ;
  aAccountRecList.free ;
end;

procedure TfmDocdetails.FormShow(Sender: TObject);
Var
  i,x : Integer;

   ColFound : Boolean ;
 ADutchStyle : Boolean ;


 procedure CtrlSwap(AControl,BControl : TControl ) ;
 var
  OldPoint : TPoint ;
  OldTab : Integer ;
 begin
   OldTab := 0 ;
     OldPoint.Y := AControl.Top ;
     if (AControl is TEdit) then
        OldTab := TEDit(AControl).TabOrder ;
     AControl.top  := bControl.Top ;
     if (AControl is TEdit) then
         begin
           OldTab := TEDit(aControl).TabOrder ;
           TEDit(aControl).TabOrder := TEDit(bControl).TabOrder;
         end;
     bControl.Top :=  OldPoint.Y ;
     if (AControl is TEdit) then
        TEDit(bControl).TabOrder := OldTab;
 end;

begin
  if idDocType<10 then
    begin
     idDocType:=10;
  
    end;
LocalDocType := idDocType ;
if LocalDocType > 18 then
  LocalDocType := 14 + (LocalDocType mod 2) ;

  BPurVis := DMTCCoreLink.ReadNwReportOp('EDITSTKPRHIDCOL',True) ;

     Up1.Caption := DMTCCoreLink.gettextlang(1843);
     Down1.Caption := DMTCCoreLink.gettextlang(1844);


 if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
   begin
     // switch postal code
    ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT',false,0) ;
   end else
   begin
    ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT',true,0) ;
   end;

 if  ADutchStyle then
   begin
      CtrlSwap(LPostal,LAddress3);
      CtrlSwap(LPostal,LAddress2);
      CtrlSwap(EPostalCode,EPostal3);
      CtrlSwap(EPostalCode,EPostal2);
      CtrlSwap(EDelPostal,EDelAdr3);
      CtrlSwap(EDelPostal,EDelAdr2);
   end;




  Thideshowitems.Caption := DMTCCoreLink.GetTextLang(3309);



  DMTCCoreLink.LoadImage(BtnOkPrint.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnClose.Glyph,'Cancel');

 

 
  LEnternewtotal.Caption := DMTCCoreLink.gettextlang(3322);

 
 

  LtaxRef.Caption := DMTCCoreLink.GetTextLangNoAmp(202);
  lstate.Caption := DMTCCoreLink.GetTextLangNoAmp(1293);
  cbPosted.Properties.Items[0].Description := DMTCCoreLink.GetTextLangNoAmp(163);
  cbPosted.Properties.Items[1].Description := DMTCCoreLink.GetTextLangNoAmp(1877);
  cbPosted.Properties.Items[2].Description := DMTCCoreLink.GetTextLangNoAmp(961);
 
 
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

  LLPaymentTotal.Caption := DMTCCoreLink.GetTextLang(2232);


 

 
 
  LProject.Caption :=  DMTCCoreLink.GetTextLang(3099);
  LNetto.Caption :=  DMTCCoreLink.GetTextLang(3127);
  LGross.Caption :=  DMTCCoreLink.GetTextLang(3128);

 
 
 
  CannotEditDesc :=  DMTCCoreLink.ReadNwReportOp('STKNoEditDesc',false);


 
  LContact.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2415);
  LPostal.Caption :=  DMTCCoreLink.GetTextLangNoAmp(190);
  LAddress1.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2220);
  LAddress2.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2206);
  LAddress3.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2420);
  LCompany.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2279);
  LCountry.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2207);


  GoToStockQty := DMTCCoreLink.ReadNwReportOp('STKGotoQty',false);
  CannotEditPrice :=  DMTCCoreLink.ReadNwReportOp('STKNoEditPrice',false);


  TDatabaseTableRoutines.FillStringsWithSelect(CBCountry.Properties,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
  TDatabaseTableRoutines.FillStringsWithSelect(cbProject.Properties,'SELECT WJOBPROJECTID, SJOBPROJECTCODE || SDESCRIPTION SJOBPROJECTCODE  FROM JOBPROJECT where BENABLED =1');
 TDatabaseTableRoutines.FillStringsWithSelect(CBDelCountry.Properties,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
  OSCommerceLinkDocURL := DMTCCoreLink.ReadLongReportOp('OSCOMMERCEINVOICELINK') ;
  OSCommerceLinkCustURL := DMTCCoreLink.ReadLongReportOp('OSCOMMERCECUSTOMERLINK') ;
  LimitDocSql :=  DMTCCoreLink.ReadLongSysparam('LIMITDOCSQL',CurrentUser) ;
 

  STKNoBackOrder := DMTCCoreLink.ReadNwReportOp('STKNoBackOrder',false);
 

 

 


 
  Label21.Caption := DMTCCoreLink.GetTextLang(2222);
   
  
  
   
  tlbtnExclIncl.Caption:=DMTCCoreLink.GetTextLang(371);
  tlbtnIncl.Caption:=DMTCCoreLink.GetTextLang(664);
  tlbtnExclIncl.ImageIndex := 4 ;
  tlbtnIncl.ImageIndex := 8 ;
 

 


  Label1i.Caption:=DMTCCoreLink.GetTextLang(30);

 

  Label2.Caption := DMTCCoreLink.GetTextLang(645);
  LblExcl.Caption:=formatfloat('0.00',0);

  LNettoWeigth.Caption:=formatfloat('0.00',0);
  LGrossWeigth.Caption:=formatfloat('0.00',0);

  Label5.Caption := DMTCCoreLink.GetTextLang(609);
  LblTax.Caption := formatfloat('0.00',0);
  Label4.Caption := DMTCCoreLink.GetTextLang(646);
  lblInvAmt.Caption:=formatfloat('0.00',0);
  Label1.Caption := DMTCCoreLink.GetTextLang(647);
  LblDiscount.Caption := formatfloat('0.00',0);

 
  Self.Caption:= DMTCCoreLink.GetTextLang(928) ; //'Document Entry';
  StatusBar.Panels[1].Text :=self.Caption ;
  FieldChgd:=False;

  Label3.Caption := DMTCCoreLink.GetTextLang(2151);

end;
procedure TfmDocdetails.tlbtnInsertClick(Sender: TObject);
begin
UniDoclines.Insert ;
SelectStockItem;
end;

procedure TfmDocdetails.tlbtnDeleteClick(Sender: TObject);
begin
UniDoclines.Delete ; 
end;

procedure TfmDocdetails.SetStockEditPrice;
begin
          PEditPrice.Visible := True ;

          PEditPriceInner.Visible := True ;
          
          if  btnEnterIncExc.tag = 0 then
          begin
           EPrice1.Text := FloatToStr(LastStock.FPrice1);
           EPrice2.Text := FloatToStr(LastStock.FPrice2);
           EPrice3.Text := FloatToStr(LastStock.FPrice3);
          end else
          begin
           EPrice1.Text := FloatToStr(LastStock.FPrice1 * TDataBaseRoutines.GetTaxRateOnId((LastStock.WOutputTaxID)));
           EPrice2.Text := FloatToStr(LastStock.FPrice2* TDataBaseRoutines.GetTaxRateOnId((LastStock.WOutputTaxID)));
           EPrice3.Text := FloatToStr(LastStock.FPrice3* TDataBaseRoutines.GetTaxRateOnId((LastStock.WOutputTaxID)));
          end;
          ENewDescription.Text := LastStock.SDescription ;
          EPricePurchase.Text :=  FloatToStr(LastStock.FUnitCost);
          EPricePurchase.Visible := BPurVis and  (LocalDocType in [12,15,16,17]);
          lEPricePurchase.Visible := BPurVis and  (LocalDocType in [12,15,16,17]);
          if PEXtraData.Visible then
             begin
                EEdiTrigg.Text :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select FREORDERQTYTRIG from stock where WStockid = '+ IntToStr(LastStock.WStockID)));
                EEdtMIN.Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select FMINIMUMQTY from stock where WStockid = '+ IntToStr(LastStock.WStockID)));
                EedtReord.Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select FREORDERQTY from stock where WStockid = '+ IntToStr(LastStock.WStockID)));
                Lsale30.Caption   :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '+ IntToStr(LastStock.WStockID) +' and dochead.WTypeid = 10 and dochead.ddate between  ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date-30) +' and ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date)));
                Lsale60.Caption   :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '+ IntToStr(LastStock.WStockID) +' and dochead.WTypeid = 10 and dochead.ddate between  ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date-60) +' and ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date)));
                Lsale90.Caption   :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '+ IntToStr(LastStock.WStockID) +' and dochead.WTypeid = 10 and dochead.ddate between  ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date-90) +' and ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(date)));

             end;




          cbDefsupp.Checked := TDataBaseStockRoutines.GetDefSup1(LastStock.WStockID) = edtWAccountID ;

          MOptions.Visible := MOptions.Text <>'' ;
          if self.Parent = nil then
          self.Invalidate ;
end;


procedure TfmDocdetails.SendMessagePriceMessagePlugin(
  AMessage: String; var price1, price2, price3,Sellingprice,Discount: Double);
var
 i : Integer ;

begin
  for i := 0 to  APluginsFormsList.Count -1 do
    begin
     try
     if assigned(AFormPluginRecordArray[i].aGetPriceFormPlugin) then
        AFormPluginRecordArray[i].aGetPriceFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage),price1,price2, price3,Sellingprice,Discount);
     except
       On e : Exception do
         begin

           ShowMessage(GetModuleName(AFormPluginRecordArray[i].aInst) + ': ' + e.Message);
         end;
     end;
    end;
end;

function TfmDocdetails.UpdateStockRecWithPriceForplugin(var
  AStockRec: TStockRec;AMultiplier : Double ) : Boolean ;
var
 Price1 , Price2,Price3,SellingPrice,Discount : Double ;
begin
   if AMultiplier = 0 then
    AMultiplier := 1 ;
   Price1:= 0 ; 
   Price2 := 0 ;
   Price3 := 0 ;
   SellingPrice := 0 ;
   Discount := 0 ;
     result := false ;
  if (LocalDocType in [10,11,14,16]) then
    begin
     Price1 := AStockRec.FPrice1 ;
     Price2 := AStockRec.FPrice2 ;
     Price3 := AStockRec.FPrice3 ;
    end else
    begin
     Price1 := AStockRec.FUnitCost ;
     Price2 := AStockRec.FUnitCost ;
     Price3 := AStockRec.FUnitCost ;
    end;


     SendMessagePriceMessagePlugin('WLINEID=' + UniDoclinesWDOCLINEID.AsString +#13+#10 + 'WACCOUNTID=' + inttostr(AccID)+
                                  #13+#10 + 'WSTOCKID=' + inttostr(AStockRec.WStockID) + #13+#10 + 'FQTY=' + FloatToStr(UniDoclinesFQTYORDERED.AsFloat *AMultiplier ),
                                  Price1,Price2,Price3,SellingPrice,Discount) ;
  if (LocalDocType in [10,11,14]) then
    begin
     if AStockRec.FPrice1 <> Price1 then
        begin
          AStockRec.FPrice1 := Price1;
          result := true ;
        end;
     if AStockRec.FPrice2 <> Price2 then
        begin
          AStockRec.FPrice2 := Price2;
          result := true ;
        end;
     if AStockRec.FPrice3 <> Price3 then
        begin
          AStockRec.FPrice3 := Price3;
          result := true ;
        end;
     if AStockRec.FSellingPrice <> SellingPrice then
        begin
          AStockRec.FSellingPrice := SellingPrice;
          result := true ;
        end;
     if (AStockRec.FDiscount <> Discount) and (SellingPrice <> 0) then
        begin
          AStockRec.FDiscount := Discount;
          result := true ;
        end;
    end else
    begin
    if LocalDocType <> 17 then
     begin
     if (AStockRec.FUnitCost <> SellingPrice) and (SellingPrice <> 0) then
        begin
          AStockRec.FUnitCost := SellingPrice;
          result := true ;
        end;
     end else
     begin
       AStockRec.FSellingPrice := AStockRec.FUnitCost;
     end;
    end;
end;

function TfmDocdetails.GetPluginLineString(IsLine : Boolean = true) : String ;
begin
 result := '' ;
 if IsLine then
    begin
     result := 'LINE='+UniDoclinesWDOCLINEID.AsString +#13+#10 +
      'STOCKCODE='+UniDoclinesSSTOCKCODE.AsString +#13+#10 ;
    end;
 result := result + 'BATCH=' +  '' + #13+#10 + 'USERID=' + IntToStr(CurrentUser)
           +#13+#10 +'INCEXL=' + IntToStr(ord(ExclMode))
           +#13+#10  + 'WACCOUNTID=' + IntToStr(edtWAccountID)
           +#13+#10  + 'DDATE=' + IntToStr(round(dtpDate.Date))
           +#13+#10  + 'DOCTYPE=' + IntToStr(LocalDocType)
           +#13+#10  + 'BPOSTED=' + IntToStr(ord(LastDocPosted)) ;
end;


procedure TfmDocdetails.SelectStockItem(JustAdd : Boolean = False ) ;
var
 LocateCode,Freesqlname : String ;
 aQuery : TuniQuery ;
begin

 if (LastDocPosted) then exit ;
 if  UniDoclinesWLINETYPEID.AsInteger = 91 then exit ;

 if not justadd then
  begin
   ReturnLookup := '' ;
    repeat
      BBarCode:=False;
      // 16 = sale 15 = purchase

        if not (EFastbarcodelookup.Focused) or (Trim(EFastbarcodelookup.Text) = '' ) then
        begin
        case LocalDocType of
       10 , 11, 14 , 16 :  begin
                       if UniDoclinesSSTOCKCODE.Value <> '' then
                       CallLookup(UniDoclinesSSTOCKCODE.AsString, 16,UniDoclinesWSTOCKID.AsInteger,'',false) else
                       CallLookup(LastActiveStockCode, 16,0,'',false) ;
                       Application.ProcessMessages ;

                      end;
       12,13,15 ,17   :  begin
                       if UniDoclinesSSTOCKCODE.Value <> '' then
                       CallLookup(UniDoclinesSSTOCKCODE.Value, 17,0,'',false) else
                       CallLookup(LastActiveStockCode, 17,0,'',false,nil,edtWAccountID)  ;
                       Application.ProcessMessages ;
                      end;
       end;
       end else
       begin
            LocateCode := '' ;
            ReturnID := 0 ;

            if (LocalDocType in [10 , 11, 14 , 16]) then
             Freesqlname := 'FREESTOCKLOOKUP' else
             Freesqlname := 'FREESTOCKLOOKUPCR' ;

            if DMTCCoreLink.SQLList.GetFormatedSQLByName(Freesqlname) <> '' then
             begin
              aQuery := TuniQuery.create(self) ;
              try
              aQuery.Connection := DMTCCoreLink.TheZConnection ;
              aQuery.SQL.Text :=  TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName(Freesqlname),'ID='+trim(EFastbarcodelookup.Text) +#13+#10 + 'WACCOUNTID=' + IntToStr(edtWAccountID)) ;
              aQuery.Open ;
              if aQuery.RecordCount > 1 then
                begin
                 while not aQuery.Eof do
                   begin
                      if LocateCode <> '' then
                       LocateCode := LocateCode + ',' ;
                      LocateCode := LocateCode + aQuery.fields[0].AsString  ;
                     aQuery.next ; 
                   end;
                end else
                  ReturnID := aQuery.fields[0].AsInteger ;
              finally
               aQuery.free ;
              end;
              if LocateCode <> '' then
                 begin
                    case LocalDocType of
                     10 , 11, 14 , 16 :  begin
                                     CallLookup('', 16,0,'@ where WStockid in (' + LocateCode +')' ,false) ;


                                    end;
                     12,13,15 ,17   :  begin
                                     CallLookup('', 17,0,'@ where WStockid in (' + LocateCode +')',false);

                                     
                                    end;
                     end;
                 end;
             end;

          if ReturnID = 0 then

          ReturnID := TDataBaseStockRoutines.FindStockOnBarCode(trim(EFastbarcodelookup.Text)) ;
          if ReturnID = 0 then
             ReturnID := TDataBaseStockRoutines.FindStockOnSerial(trim(EFastbarcodelookup.Text)) ;
          if ReturnID = 0 then
             ReturnID := TDataBaseStockRoutines.GetStockID(trim(EFastbarcodelookup.Text)) ;
          if ReturnID = 0 then
             ReturnID := TDataBaseStockRoutines.FindStockOnSupCode(trim(EFastbarcodelookup.Text)) ;

     
          if ReturnID = 0 then
            begin
             if UniDoclines.State = dsinsert then
                UniDoclines.Cancel else
             UniDoclines.Delete  ;
             sysutils.Abort ;
            end;
          ReturnLookup := TDataBaseStockRoutines.GetStockCode(ReturnID) ;
          // see if the line exsis
                       
       end;
      if ReturnLookup ='ESC' then
        begin
         if UniDoclines.State = dsinsert then
           begin

            UniDoclines.Cancel ;
            UniDoclines.edit ;
           end;
         exit ;
        end;

      if ((ReturnLookup='')) and (UniDoclinesSSTOCKCODE.Value='') then
      begin
       if UniDoclines.State <> dsinsert then
          begin
           // Looks like its making a ite
           // showmessage('Select stockitem '+ReturnLookup);
           // showmessage(IntToStr(ReturnID));
           StatusBar.Panels[1].Text := 'Select stockitem '+ReturnLookup  + ' '  +IntToStr(ReturnID) ;
           if TDatabaseUserRoutines.GetUserCanEditStock(CurrentUser) then
           begin
            if not Assigned(AfmStockEntry) then

            AfmStockEntry := TfmStockEntry.Create(self);
            try

            (AfmStockEntry as TfmStockEntry).AddNewStockItem := fmPosLookup.ECode.Text ;
            (AfmStockEntry as TfmStockEntry).AddNewStockType := fmPosLookup.CBField.ItemIndex ;
            (AfmStockEntry as TfmStockEntry).ShowModal;
            ReturnLookup :=  (AfmStockEntry as TfmStockEntry).tblStockAdSSTOCKCODE.AsString ;
            finally

            end;
           end;
          end;
          //if not tblBatch.IsEmpty then
          // dbgridInvoice.DataSource.DataSet.Delete ;
       // exit;
      end;
      If ReturnLookup='NEW' then
        begin
         if TDatabaseUserRoutines.GetUserCanEditStock(CurrentUser) then
           begin
            if not Assigned(AfmStockEntry) then

            AfmStockEntry := TfmStockEntry.Create(self);
           try
           // showmessage('Select stockitem 2'+ReturnLookup);
           // showmessage(IntToStr(ReturnID));
            StatusBar.Panels[1].Text := 'Select stockitem2 '+ReturnLookup  + ' '  +IntToStr(ReturnID) ;

            (AfmStockEntry as TfmStockEntry).AddNewStockItem := fmPosLookup.ECode.Text ;
            (AfmStockEntry as TfmStockEntry).AddNewStockType := fmPosLookup.CBField.ItemIndex ;
            (AfmStockEntry as TfmStockEntry).ShowModal;
            ReturnLookup :=  (AfmStockEntry as TfmStockEntry).tblStockAdSSTOCKCODE.AsString ;
            finally

            end;
          end;
           // gets set to a account by lookingup in stock.
          // ReturnLookup := 'NEW';
       end;
    Until (ReturnLookup<>'BACK') AND (ReturnLookup<>'NEW') ;

   if (ReturnLookup <> '') then
    if ReturnLookup[1]='^' then // Comment Line
    begin
       Delete(ReturnLookup,1,1);
       Case StrToInt(ReturnLookup) of
       120 : // F9
         begin
           tlbtnCommentClick(nil);
           exit;
         end;
       end;
    end ;

   end; // end just add

  if ((ReturnLookup<>'ESC') and (ReturnLookup<>'')) then
  begin
  UniDoclines.DisableControls;
  try
  UniDoclines.edit ;
  if UniDoclinesSSTOCKCODE.Value = ''  then
  NewRecord := true ;
  UniDoclinesSSTOCKCODE.Value := ReturnLookup;
 // ATempStockList.getStock(AStockPointer,ReturnLookup)
 // LastStock.WStockID := ReturnID ;
  if ATempStockList.getStock(astockrecpointer,ReturnLookup) then
     begin
       TDataBaseStockRoutines.SyncQty( astockrecpointer^,LocalDocType,LastDocHeaderId) ;
     end;
  LastStock := astockrecpointer^  ;
//  StockLoadItem(LastStock);


  if EditStockPrices and (LocalDocType in [12,13,15,17]) then
     begin
         SetStockEditPrice ;
     end;
  finally
     UniDoclines.EnableControls;
  end;

  if (LastStock.WStockTypeId = 10) then
    begin
     fmStockLinkDetail.InitFromStockDocLine(LastStock.WStockID,UniDoclinesWDOCLINEID.AsInteger);
     fmStockLinkDetail.InitCheckStart  ;
     UniDoclines.Edit ;
     UniDoclinesWDESCRIPTIONID.Text := LastStock.SDescription ;
     UniDoclinesFQTYSHIPPED.AsFloat := fmStockLinkDetail.GetLastTotalQty ;
     UniDoclinesFQTYORDERED.AsFloat := UniDoclinesFQTYSHIPPED.AsFloat ;
     UniDoclines.post ;
     ApplyStockCodeToCurrentRecord ;
 
     exit ;
    end ;

        
    Self.Caption :=TmpCaption ;

    if (LastStock.FReorderQty <> -1) and (LastStock.WStockTypeId in CheckStockTypesSet) and (LocalDocType in [10,12,14,15,16])  then
     if (LocalDocType in [10,14]) then
      Self.Caption :=TmpCaption+',    '+ FloatToStrF(LastStock.FQtyOnHand-(LastStock.FUnpostedItems+UniDoclinesFQTYSHIPPED.AsFloat), ffFixed, 18, 2) + ' ' + GetTextLang(507) + {on hand}'.'
      else
      Self.Caption :=TmpCaption+',    '+ FloatToStrF(LastStock.FQtyOnHand-(LastStock.FUnpostedItems-UniDoclinesFQTYSHIPPED.AsFloat), ffFixed, 18, 2) + ' ' + GetTextLang(507) + {on hand}'.';


    if (LastStock.FQtyOnHand-(LastStock.FUnpostedItems+UniDoclinesFQTYSHIPPED.AsFloat) < 0 ) and (LocalDocType in [10,12,14,15]) then
       begin

           if (LastStock.FReorderQty <> -1)  and (LastStock.WStockID <> 0) and (LocalDocType in [10,14,16])  then
            if not (LastStock.WStockTypeId in [1,2,3,4,5,6,7,8]) then
            begin
             if not NoOutOfStockMsg and  not OutOfStockDrawColors then
             OSFMessageDlg(GetTextLang(506) + FloatToStrF(LastStock.FQtyOnHand-(LastStock.FUnpostedItems), ffFixed, 18, 2) + ' ' + gettextlang(2150)+ {items on hand}'.', mtinformation, [mbok], 0);
            end;

       end;
    StatusBar.Panels[1].Text :=self.Caption ;


  // see if its options
  if (LastStock.WStockTypeId in [7,8]) then
     begin
       LocateCode := '' ;
        if (EFastbarcodelookup.Focused) and (Trim(EFastbarcodelookup.Text) <> '' ) then
          LocateCode := EFastbarcodelookup.text ;


      ApplyStockCodeToCurrentRecord ;
      DocSelectOptions.lstQty := UniDoclinesFQTYSHIPPED.AsFloat;
      DocSelectOptions.lstTotal := UniDoclinesFEXCLUSIVEAMT.AsFloat ;


     if (LocalDocType in [10,11,14,16]) then
     begin
     if DefaultTaxId <> 0 then
     DocSelectOptions.InitForStock(LastStock.WStockID, UniDoclinesWDOCLINEID.AsInteger,DefaultTaxId,not ExclMode,LocateCode)
     else
     DocSelectOptions.InitForStock(LastStock.WStockID,UniDoclinesWDOCLINEID.AsInteger,LastStock.WOutputTaxID,not ExclMode,LocateCode)
     end else
     begin
     if DefaultTaxId <> 0 then
     DocSelectOptions.InitForStock(LastStock.WStockID,UniDoclinesWDOCLINEID.AsInteger,DefaultTaxId,not ExclMode,LocateCode)
     else
     DocSelectOptions.InitForStock(LastStock.WStockID,UniDoclinesWDOCLINEID.AsInteger,LastStock.WInputTaxID,not ExclMode,LocateCode);
     end;


     UniDoclines.Edit ;
     UniDoclinesFQTYSHIPPED.AsFloat := DocSelectOptions.lstQty ;
     UniDoclinesFQTYORDERED.AsFloat := DocSelectOptions.lstQty ;
     if DocSelectOptions.lstQty <> 0 then
     UniDoclinesFSELLINGPRICE.asFloat := DocSelectOptions.lstTotal / DocSelectOptions.lstQty  ;

     UniDoclinesFEXCLUSIVEAMT.asFloat  := DocSelectOptions.lstTotal ;




     UniDoclinesWDESCRIPTIONID.Text := LastStock.SDescription;
          if  not ExclMode then
        begin
           if UniDoclinesWTAXID.AsInteger <> 0 then
              begin
                UniDoclinesFSELLINGPRICE.asFloat := UniDoclinesFSELLINGPRICE.asFloat * aAccountRecList.GetTaxRateOnId(UniDoclinesWTAXID.AsInteger) ;
                UniDoclinesFINCLUSIVEAMT.asFloat:= UniDoclinesFEXCLUSIVEAMT.asFloat * aAccountRecList.GetTaxRateOnId(UniDoclinesWTAXID.AsInteger) ;
              end;
        end;
  
     end else
  // see if its financial.
  if LastStock.WStockTypeId = 6 then
     begin

       CallLookup('',0,UniDoclinesWACCOUNTID.AsInteger,LastStock.sExtraDesc) ;
       UniDoclines.edit ;
       UniDoclinesWDESCRIPTIONID.Text := TDataBaseRoutines.GetAccountDescription(ReturnID) ;
       UniDoclinesWACCOUNTID.AsInteger := ReturnID ;
     end else
 begin

  // if not (LastStock.WStockTypeId in [7,8]) then
     UpdateStockRecWithPriceForplugin(LastStock,UniDoclines.FieldByName('FUNITQTY').AsFloat ) ;
  LastStock.FUnpostedItems := TDataBaseStockRoutines.GetUnpostedStockItemCount(LastStock.WStockID,LastDocHeaderId) ;
  if LocalDocType = 14 then
         begin
          LastStock.FUnpostedItems :=  LastStock.FUnpostedItems + LastStock.FminimumQty ;
          LastStock.FUnpostedItems :=  LastStock.FUnpostedItems +  TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(LastStock.WStockID,14,LastDocHeaderId);
         end;

  UniDoclines.edit ;
    if UniDoclinesFQTYORDERED.IsNull then
       UniDoclinesFQTYORDERED.AsFloat:= 1;
    if UniDoclinesFQTYSHIPPED.IsNull then
       UniDoclinesFQTYSHIPPED.AsFloat:= 1;


  UniDoclinesWDESCRIPTIONID.Text := LastStock.SDescription;


  if UniDoclinesFITEMDISCOUNT.AsFloat = 0 then
  UniDoclinesFITEMDISCOUNT.AsFloat := Globaldiscount ;
  end ;
   if not (LastStock.WStockTypeId in [7,8]) then
    ApplyStockCodeToCurrentRecord ;

  end;
  if AExternalForm <> nil then
     begin
        AExternalSendString := 'EDITLINE=' + InttoStr(LastDocHeaderId) +#13+#10 + GetPluginLineString;
        AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,pchar(AExternalSendString)) ;
        AExternalSendString := UniDoclinesWDOCLINEID.AsString ;
         UniDoclines.close ;
         UniDoclines.open ;
         UniDoclines.Locate('WLINEID',AExternalSendString,[]);

     end;


if (LastStock.WStockTypeId = 0)and (LocalDocType in [10,11,12,13,16,17]) then
begin
if EFastbarcodelookup.Focused and (Trim(EFastbarcodelookup.Text) <> '' ) then
   MyLocBatSerInput.gotoSerial := EFastbarcodelookup.text else
   MyLocBatSerInput.gotoSerial := '' ;


MyLocBatSerInput.LoadData(LastDocHeaderId,UniDoclinesWDOCLINEID.AsInteger,LastStock.WStockID);
if MyLocBatSerInput.ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger > 0 then
  begin
     UniDoclines.Edit ;
    UniDoclinesFQTYSHIPPED.AsFloat := MyLocBatSerInput.GetLastTotalQty ;
     UniDoclinesFQTYORDERED.AsFloat := UniDoclinesFQTYSHIPPED.AsFloat ;
    UpdateStockRecWithPriceForplugin(LastStock,UniDoclines.FieldByName('FUNITQTY').AsFloat);
    ApplyStockCodeToCurrentRecord ;
    cxGrid1DBTableView1.Controller.FocusedColumn := cxGrid1DBTableView1FQTYSHIPPED;
  end;

end;
 
end;
procedure TfmDocdetails.ApplyStockCodeToCurrentRecord(UseOrgPrice : Boolean = false ) ;
var
  ReorderLevel : Integer ;

  Unitid : String ;
  ADiscount : Double ;
begin
 if (LastDocPosted) then exit ;
 If UniDoclinesWLINETYPEID.AsInteger = 91 then exit ;
    UniDoclines.edit ;

     UniDoclinesWSTOCKID.AsInteger :=  LastStock.WStockID ;
    if UniDoclinesFQTYORDERED.IsNull then
       UniDoclinesFQTYORDERED.AsFloat:= 1;
    if UniDoclinesFQTYSHIPPED.IsNull then
       UniDoclinesFQTYSHIPPED.AsFloat:= 1;

    UniDoclinesWREPORTINGGROUP1ID.AsInteger := LastStock.WDefaultLinegroup1id ;
   if LastStock.WStockTypeId = 10 then
      begin
         UniDoclines.FieldByName('FUNITQTY').AsFloat := 1 ;
        if ExclMode then
        begin
        UniDoclinesFEXCLUSIVEAMT.Value := fmStockLinkDetail.TotExcl ;
        UniDoclinesFINCLUSIVEAMT.Value := fmStockLinkDetail.TotInc ;
        UniDoclinesFSELLINGPRICE.Value := fmStockLinkDetail.TotExcl / fmStockLinkDetail.GetLastTotalQty ;
        end else
        begin
        UniDoclinesFINCLUSIVEAMT.Value := fmStockLinkDetail.TotInc ;
        UniDoclinesFEXCLUSIVEAMT.Value := fmStockLinkDetail.TotExcl ;
        UniDoclinesFSELLINGPRICE.Value := fmStockLinkDetail.TotExcl / fmStockLinkDetail.GetLastTotalQty ;
        end;
        UniDoclinesFTAXAMOUNT.Value := 0;
        UniDoclinesWTAXID.Clear ;
        exit ;
      end;

      UniDoclines.DisableControls;
      try
      case IntSellingPrice of
      0,1: DefaultPrice := LastStock.FPrice1 ;
      2 :  DefaultPrice := LastStock.FPrice2 ;
      3 :  DefaultPrice := LastStock.FPrice3 ;
      end ;

      if (LastStock.FDiscount <> 0)    then
         begin
            DefaultPrice := FixAmount(LastStock.FSellingPrice, wDocRowDecimals) ;
         end;
      if DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_SELECTUNITONCRED') <> nil then
      begin
        Unitid :=  VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTUNITONCRED'),
        'WACCOUNTID=' +  InTtoStr(  edtWAccountID) + #13+#10 + 'WSTOCKID=' +IntToStr(LastStock.WStockID)   ) ) )  ;
         UniDoclinesSUNIT.AsInteger := StrToIntDef(Unitid,0);
      end else
      begin
      if UniDoclinesSUNIT.IsNull then
      UniDoclinesSUNIT.AsInteger := LastStock.WUnitId ;
      end;



      if DMTCCoreLink.ExtraOptions.Values['BUSEDATEFFROMMLTP'] <> 'TRUE'  then
      UniDoclinesFUNITQTY.AsFloat := TDataBaseStockRoutines.GetUnitQty(UniDoclinesSUNIT.AsInteger) else
      UniDoclinesFUNITQTY.AsFloat := 1 ;

      if LocalDocType in [12,13,15,17] then
      begin
        DefaultPrice := LastStock.FUnitCost ;
       // if not UseOrgPrice then
        UniDoclinesFSELLINGPRICE.AsFloat := DefaultPrice * UniDoclinesFUNITQTY.AsFloat ;
         if ExclMode then
         UniDoclinesFEXCLUSIVEAMT.Value :=FixAmount((UniDoclinesFQTYSHIPPED.AsFloat  ) * UniDoclinesFSELLINGPRICE.AsFloat, wDocRowDecimals) else
         UniDoclinesFINCLUSIVEAMT.Value := FixAmount((UniDoclinesFQTYSHIPPED.AsFloat  ) * UniDoclinesFSELLINGPRICE.AsFloat, wDocRowDecimals) ;
         


       if DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_SELECTDISCOUNTSTOCKCRED') <> nil then
         begin
           ADiscount  :=  StrTOFloatDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTDISCOUNTSTOCKCRED'),
           'WACCOUNTID=' +  InTtoStr(  edtWAccountID) + #13+#10 + 'WSTOCKID=' +IntToStr(LastStock.WStockID)   ) ) ),0)  ;
            UniDoclinesSUNIT.AsInteger := StrToIntDef(Unitid,0);

           // tblBatchFCREDIT.Value :=FixAmount((StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString,1)  ) * tblBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
          UniDoclinesFITEMDISCOUNT.AsFloat  :=  ADiscount ;
          if UniDoclinesFITEMDISCOUNT.AsFloat <> 0 then
            UniDoclinesFEXCLUSIVEAMT.Value := UniDoclinesFUNITQTY.AsFloat * (FixAmount(UniDoclinesFSELLINGPRICE.AsFloat * (UniDoclinesFQTYSHIPPED.AsFloat ), wDocRowDecimals) - ((UniDoclinesFSELLINGPRICE.AsFloat * UniDoclinesFQTYSHIPPED.AsFloat) * (UniDoclinesFITEMDISCOUNT.AsFloat / 100)))
        end else

        if BPriceAgreeUseOrgPrice then
          begin

          UniDoclinesFEXCLUSIVEAMT.Value := TDataBaseStockRoutines.getLastStockCost(LastStock.WStockID) * UniDoclinesFUNITQTY.AsFloat ;
          UniDoclinesFITEMDISCOUNT.AsFloat := (( UniDoclinesFSELLINGPRICE.AsFloat * (UniDoclinesFQTYSHIPPED.AsFloat  )) -  UniDoclinesFEXCLUSIVEAMT.AsFloat) ;
          if UniDoclinesFITEMDISCOUNT.AsFloat <> 0 then
            if   UniDoclinesFSELLINGPRICE.Value  <> 0 then
            UniDoclinesFITEMDISCOUNT.AsFloat := (UniDoclinesFITEMDISCOUNT.AsFloat / ((UniDoclinesFSELLINGPRICE.Value * (UniDoclinesFQTYSHIPPED.AsFloat   ) ))*100)
            else UniDoclinesFITEMDISCOUNT.AsFloat := 0;
          end;


      end
      else
       begin
        if not ExclMode then
           DefaultPrice := DefaultPrice * LastStock.FOutputRate ;

       if (not UseOrgPrice) or (not BPriceAgreeUseOrgPrice) then
        UniDoclinesFSELLINGPRICE.Value := DefaultPrice * UniDoclinesFUNITQTY.AsFloat ;

         UniDoclinesFEXCLUSIVEAMT.Value :=  FixAmount((UniDoclinesFQTYSHIPPED.AsFloat  )* UniDoclinesFSELLINGPRICE.Value,wDocRowDecimals);
        if LastStock.BApplyDiscount then
           begin
         //   if not UseOrgPrice then
         if UseOrgPrice then
          begin
              if (UniDoclinesFSELLINGPRICE.Value <>0) then
             UniDoclinesFITEMDISCOUNT.Value :=   FixAmount(GlobalDiscount) ;
           end 

         else

            UniDoclinesFITEMDISCOUNT.Value := FixAmount(GlobalDiscount)  ;
            if  LastStock.FDiscount <> 0 then
                begin
             //   if not UseOrgPrice then
                      if UseOrgPrice then
                        begin
                         if (UniDoclinesFSELLINGPRICE.Value <>0) then

                            UniDoclinesFITEMDISCOUNT.Value :=    FixAmount(LastStock.FDiscount,2)
                        end
                 else
                UniDoclinesFITEMDISCOUNT.Value :=  FixAmount(LastStock.FDiscount,2) ;
                  case IntSellingPrice of
                         0,1: DefaultPrice := LastStock.FPrice1 ;
                         2 :  DefaultPrice := LastStock.FPrice2 ;
                         else  DefaultPrice := LastStock.FPrice3 ;
                 end ;
                   if not UseOrgPrice then
                      UniDoclinesFITEMDISCOUNT.Value := DefaultPrice ;
                end
                else
                begin
                  if (UniDoclinesFITEMDISCOUNT.Value > 0) and (UniDoclinesFQTYSHIPPED.AsFloat <> 0) then
                   UniDoclinesFEXCLUSIVEAMT.Value := FixAmount(UniDoclinesFSELLINGPRICE.Value * (UniDoclinesFQTYSHIPPED.AsFloat ),wDocRowDecimals) - ((UniDoclinesFSELLINGPRICE.Value * ( UniDoclinesFQTYSHIPPED.AsFloat  ) ) * (UniDoclinesFITEMDISCOUNT.Value / 100))
                  else
                   UniDoclinesFEXCLUSIVEAMT.Value := FixAmount(UniDoclinesFSELLINGPRICE.Value *(UniDoclinesFQTYSHIPPED.AsFloat ),wDocRowDecimals);
               end;
           end
        else
          UniDoclinesFITEMDISCOUNT.Value := 0;
      end;// End Geting Prices.
      finally
       UniDoclines.EnableControls;
      end;
      if not (  UniDoclines.State in [dsedit,dsinsert]) then
         UniDoclines.edit ;


       if DefaultTaxId <> 0 then
         begin
            

             UniDoclinesWTAXID.AsInteger := DefaultTaxId ;
         end else
         begin
          if LocalDocType in [12,13,15] then
            begin

            UniDoclinesWTAXID.AsInteger := LastStock.WInputTaxID ;
            end
          else
            begin
            UniDoclinesWTAXID.AsInteger := LastStock.WOutputTaxID ;

            end;
         end;
 //      if SelfCheckStockCode then
//        OSFMessageDlg(LastStock.SDescription +#13#10+ GetTextLang(965),mtWarning,[mbOk],0);
  if (LastStock.WStockTypeId in CheckStockTypesSet) then
  begin
  ReorderLevel :=  Round(LastStock.FReorderQty) ;
  if (LocalDocType in [10,14]) then
  TempQtyOnHand := LastStock.FQtyOnHand - (LastStock.FUnpostedItems + (UniDoclinesFQTYSHIPPED.AsFloat* UniDoclinesFUNITQTY.AsFloat))
  else
  TempQtyOnHand := LastStock.FQtyOnHand - (LastStock.FUnpostedItems - (UniDoclinesFQTYSHIPPED.AsFloat* UniDoclinesFUNITQTY.AsFloat));

  if ((ReorderLevel = -1) or not (LastStock.WStockTypeId in  CheckStockTypesSet)) or not (LocalDocType in [10,12,14,15]) then
  self.Caption :=TmpCaption else
  begin
    self.Caption :=TmpCaption+',    '+ FloatToStrF(TempQtyOnHand, ffFixed, 18, 2) + ' ' + GetTextLang(507) + {on hand}'.';
  end;
  StatusBar.Panels[1].Text :=self.Caption ;
  end;

end;


procedure TfmDocdetails.tlbtnCommentClick(Sender: TObject);
begin
   UniDoclines.Insert ;
   UniDoclinesWLINETYPEID.AsInteger := 91 ;


end;

procedure TfmDocdetails.cxGrid1DBTableView1WSTOCKIDPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  SelectStockItem();
end;

procedure TfmDocdetails.cxGrid1DBTableView1WDESCRIPTIONIDGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
 AProperties.Alignment.Horz := taLeftJustify ;
end;

end.
