(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockEntry;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
   Menus,DatabaseAccess,
   DBAccess , Uni, UOSFVisuals,UDMCoreDocData, DB,UPluginsSharedUnit,
  ExtDlgs, DBCtrls,ComObj, BackOrdersOutstanding, dbcgrids,TcashClasses,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxImageComboBox, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxButtonEdit, cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxEditRepositoryItems, cxContainer, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxLabel, cxSplitter ;

type

twf_TfmStockEntry  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;
 twf_TfmStockEntryPlugins  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;
 // Tmemo = class(TosFMemo);
  // TDBMemo= class(TosfDBMemo);

 
  TfmStockEntry = class(TForm)
    DSBom: TDataSource;
    tblStockAd: TuniQuery;
    tblStockAdWSTOCKID: TIntegerField;
    tblStockAdSSTOCKCODE: TStringField;
    tblStockAdSBARCODENUMBER: TStringField;
    tblStockAdSDESCRIPTION: TStringField;
    tblStockAdWREPORTINGGROUP1ID: TIntegerField;
    tblStockAdWREPORTINGGROUP2ID: TIntegerField;
    tblStockAdWCOSTACCOUNTID: TIntegerField;
    tblStockAdWINPUTTAXID: TIntegerField;
    tblStockAdWOUTPUTTAXID: TIntegerField;
    tblStockAdFOPENINGAVECOST: TFloatField;
    tblStockAdFQTYONHAND: TFloatField;
    tblStockAdFOPENINGQTY: TFloatField;
    tblStockAdFINVQTYONHAND: TFloatField;
    tblStockAdFREORDERQTY: TFloatField;
    tblStockAdWSALESACCOUNTID: TIntegerField;
    tblStockAdBAPPLYINVOICEDISCOUNT: TSmallintField;
    tblStockAdWSTOCKACCOUNTID: TIntegerField;
    tblStockAdFSELLINGPRICE1: TFloatField;
    tblStockAdFSELLINGPRICE2: TFloatField;
    tblStockAdFSELLINGPRICE3: TFloatField;
    tblStockAdFUNITAVECOST: TFloatField;
    tblStockAdFUNITCOST: TFloatField;
    tblStockAdWUNITID: TIntegerField;
    tblStockAdDSYSDATE: TDateTimeField;
    tblStockAdBAPPLYTAX: TSmallintField;
    tblStockAdWINPUTTAX2ID: TIntegerField;
    tblStockAdBTAXABLE: TSmallintField;
    tblStockAdWSUPPLIER1ID: TIntegerField;
    tblStockAdWSUPPLIER2ID: TIntegerField;
    tblStockAdWSTOCKTYPEID: TIntegerField;
    tblStockAdWOUTPUTTAX2ID: TIntegerField;
    tblStockAdWPROFILEID: TIntegerField;
    tblStockAdBDISABLED: TSmallintField;
    tblStockAdWPERENTID: TIntegerField;
    tblStockAdWLOCATIONID: TIntegerField;
    tblStockAdWFILENAMEID: TIntegerField;
    tblStockAdSEXTRADESC: TStringField;
    tblStockAdSInputTax: TStringField;
    tblStockAdSOutPutTax: TStringField;
    tblStockAdSCostAccount: TStringField;
    tblStockAdSSaleSACCOUNT: TStringField;
    tblStockAdSStockAccount: TStringField;
    QBOM: TuniQuery;
    QBOMWBOMID: TIntegerField;
    QBOMWSTOCKID: TIntegerField;
    QBOMWLINKEDSTOCKID: TIntegerField;
    QBOMFQTY: TFloatField;
    QBOMSSTOCKCODE: TStringField;
    QBOMSDESCRIPTION: TStringField;
    USQLBom: TUniUpdateSql;
    USQLStock: TUniUpdateSql;
    dsStock: TDataSource;
    ZQStockTrans: TuniQuery;
    ZQDocs: TuniQuery;
    dsStockTrans: TDataSource;
    dsDocs: TDataSource;
    ZQStockTransWSTOCKTRANSACTIONID: TIntegerField;
    ZQStockTransWSTOCKID: TIntegerField;
    ZQStockTransDDATE: TDateTimeField;
    ZQStockTransWSALESMANID: TIntegerField;
    ZQStockTransWDOCID: TIntegerField;
    ZQStockTransWDOCTYPEID: TIntegerField;
    ZQStockTransFQTY: TFloatField;
    ZQStockTransFCOSTPRICE: TFloatField;
    ZQStockTransFSELLINGPRICE: TFloatField;
    ZQStockTransWACCOUNTID: TIntegerField;
    ZQStockTransDSYSDATE: TDateTimeField;
    tblStockAdSEXTERNALID: TStringField;
    pmExtraActions: TPopupMenu;
    Printsingleitem1: TMenuItem;
    tblStockAdFNETTOWEIGHT: TFloatField;
    tblStockAdFGROSSWEIGHT: TFloatField;
    OpenDialog1: TOpenPictureDialog;
    tblStockAdFREORDERQTYTRIG: TFloatField;
    tblStockAdSMANUFACTURER: TStringField;
    QBOMFPERCENTAGEOFSALE: TFloatField;
    QBOMFUNITAVECOST: TFloatField;
    ZQDefoptions: TuniQuery;
    ZQStockoptions: TuniQuery;
    ZQDefoptionsWSTOCKID: TIntegerField;
    ZQDefoptionsWITEMOPTION1ID: TIntegerField;
    ZQDefoptionsWITEMOPTION2ID: TIntegerField;
    ZQDefoptionsWITEMOPTION3ID: TIntegerField;
    ZQDefoptionsWITEMOPTION4ID: TIntegerField;
    ZQDefoptionsWITEMOPTION5ID: TIntegerField;
    ZUSQLDefoptions: TUniUpdateSql;
    ZUSQLStockoptions: TUniUpdateSql;
    ZQStockoptionsWSTOCKOPTIONSID: TIntegerField;
    ZQStockoptionsWSTOCKID: TIntegerField;
    ZQStockoptionsWITEMOPTIONVALUE1ID: TIntegerField;
    ZQStockoptionsWITEMOPTIONVALUE2ID: TIntegerField;
    ZQStockoptionsWITEMOPTIONVALUE3ID: TIntegerField;
    ZQStockoptionsWITEMOPTIONVALUE4ID: TIntegerField;
    ZQStockoptionsWITEMOPTIONVALUE5ID: TIntegerField;
    ZQStockoptionsFEXTRAPRICE: TFloatField;
    ZQStockoptionsFQTYONHAND: TFloatField;
    ZQStockoptionsSBARCODE: TStringField;
    ZQStockoptionsSREFERENCE: TStringField;
    ZQStockoptionsFUNITCOST: TFloatField;
    ZQStockoptionsFUNITAVECOST: TFloatField;
    dsZQDefoptions: TDataSource;
    ZQOptions: TuniQuery;
    ZQOptionsWITEMOPTIONID: TIntegerField;
    ZQOptionsSDESCRIPTION: TStringField;
    dsZqoptions: TDataSource;
    dsZQStockoptions: TDataSource;
    ZQStockoptionsFREORDERQTY: TFloatField;
    ZQStockoptionsFREORDERQTYTRIG: TFloatField;
    ZQDefoptionsWLEVEL: TIntegerField;
    ZQDefoptionsWLOOKUPTYPE: TIntegerField;
    tblStockAdFMINIMUMQTY: TFloatField;
    ScrollBox1: TScrollBox;
    PCStock: TPageControl;
    TSList: TTabSheet;
    Splitter1: TcxSplitter;
    AdvancedPanel: TPanel;
    pbPanel: TPanel;
    lblMessages: TLabel;
    pb: TProgressBar;
    PnlAdjust: TPanel;
    Bevel1: TBevel;
    PCAdvanced: TPageControl;
    TSAdvImpExp: TTabSheet;
    edtFileName: TEdit;
    btnTo: TBitBtn;
    cbFileFormat: TComboBox;
    bImport: TBitBtn;
    BExport: TBitBtn;
    TSExpAdjust: TTabSheet;
    lblDateTrn: TLabel;
    Label16: TLabel;
    edtPercent: TEdit;
    CheckBox1: TCheckBox;
    TransDte: TDateTimePicker;
    cbUsePercent: TCheckBox;
    BtnOk: TBitBtn;
    TsAdvSetup: TTabSheet;
    BSetupstock: TBitBtn;
    BSetupGroups: TBitBtn;
    PSearch: TPanel;
    TSDetail: TTabSheet;
    pcDetails: TPageControl;
    TSAccounting: TTabSheet;
    tsBom: TTabSheet;
    PBom: TPanel;
    TSInvoices: TTabSheet;
    TSMovements: TTabSheet;
    tsExtra: TTabSheet;
    Image1: TImage;
    TSOptions: TTabSheet;
    ScrollBox2: TScrollBox;
    StandardPanel: TPanel;
    PChangeCode: TPanel;
    LNewStockCode: TLabel;
    ENewStockCode: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PEditButtons: TPanel;
    BNew: TBitBtn;
    BDelete: TBitBtn;
    BEdit: TBitBtn;
    BSave: TBitBtn;
    BCancel: TBitBtn;
    BAdvanced: TBitBtn;
    BCopy: TBitBtn;
    CBReport: TComboBox;
    BReport: TBitBtn;
    cbBarcode: TCheckBox;
    tstranslations: TTabSheet;
    ZQDescriptions: TuniQuery;
    ZUSQLDescriptions: TUniUpdateSql;
    DSDescriptions: TDataSource;
    ZQDescriptionsWSTOCKID: TIntegerField;
    ZQDescriptionsWLANGUAGEID: TIntegerField;
    ZQDescriptionsSDESCRIPTION: TStringField;
    ZQDescriptionsSEXTRADESCRIPTION: TBlobField;
    ZQlookup: TuniQuery;
    ZQDescriptionsLangLookup: TStringField;
    ZQStockMultigroup: TuniQuery;
    ZQStockMultigroupWSTOCKID: TIntegerField;
    ZQStockMultigroupWGROUPID: TIntegerField;
    ZQStockMultigroupIMP_SOURCEID: TIntegerField;
    ZUSQLMultigroup: TUniUpdateSql;
    TSGroups: TTabSheet;
    dsMultiGroup: TDataSource;
    ZUSQLStockTrans: TUniUpdateSql;
    ZQStockTransWLINEID: TIntegerField;
    ZQStockTransSDOCNO: TStringField;
    ZQDocsWDOCID: TIntegerField;
    ZQDocsFQTYSHIPPED: TFloatField;
    ZQDocsSDOCNO: TStringField;
    ZQDocsDDATE: TDateTimeField;
    ZQDocsSDESCRIPTION: TStringField;
    ZQDocsFSELLINGPRICE: TFloatField;
    ZQDocsFITEMDISCOUNT: TFloatField;
    ZQDocsFEXCLUSIVEAMT: TFloatField;
    ZQDocsFINCLUSIVEAMT: TFloatField;
    ZQDocsPRICEPERITEM: TFloatField;
    Group1: TMenuItem;
    Group2: TMenuItem;
    tblStockAdSSTOCKCODESUP1: TStringField;
    tblStockAdSSTOCKCODESUP2: TStringField;
    PopupMenu1: TPopupMenu;
    Next1: TMenuItem;
    Prev1: TMenuItem;
    N1: TMenuItem;
    Postandnext1: TMenuItem;
    Postandprev1: TMenuItem;
    QBOMFUNITCOST: TFloatField;
    QBOMFQTYONHAND: TFloatField;
    BAssemble: TMenuItem;
    BDissemble: TMenuItem;
    LStockIncUnposted: TLabel;
    EUnposted: TEdit;
    BSetSelPRiceTo: TBitBtn;
    LSetprice: TLabel;
    EsetPrice1: TEdit;
    EsetPrice2: TEdit;
    EsetPrice3: TEdit;
    cbEditExsit: TCheckBox;
    tsBackorder: TTabSheet;
    ZQGen: TuniQuery;
    Openinbrowserfromimplink1: TMenuItem;
    PluginsCopyfrom1: TMenuItem;
    Pluginscopyto1: TMenuItem;
    PluginsAction11: TMenuItem;
    Pluginsaction21: TMenuItem;
    GenCopyFrom: TMenuItem;
    GenCopyto: TMenuItem;
    Copy1: TMenuItem;
    N3: TMenuItem;
    ZQDescriptionsWSTOCKDESCID: TIntegerField;
    QBOMLSTOCKCODE: TStringField;
    QBOMLSTOCKDESC: TStringField;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Copy2: TMenuItem;
    Paste1: TMenuItem;
    Cut1: TMenuItem;
    Selectall1: TMenuItem;
    ZQStockoptionsEXPECTED: TFloatField;
    QBOMFSELLINGPRICE2: TFloatField;
    CopyItem: TMenuItem;
    urlencode1: TMenuItem;
    urldecode1: TMenuItem;
    ZQStockTransSREFERENCE: TStringField;
    ZQStockTransSUSERNAME: TStringField;
    LopenQty: TLabel;
    tblStockAdSWSUPPLIER1ID: TStringField;
    tblStockAdSWSUPPLIER2ID: TStringField;
    ZQDocsFUNITQTY: TFloatField;
    ZQDocsUNITDESC: TStringField;
    tsFullList: TTabSheet;
    ScrollBox3: TScrollBox;
    PTranslations: TPanel;
    PLangText: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    LLangDescription: TLabel;
    LLangText: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    LLanguage: TLabel;
    Label4: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Blangfreefields: TBitBtn;
    cbCurLang: TComboBox;
    cbDescqtyShow: TComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    DBNavigator2: TDBNavigator;
    Panel4: TPanel;
    cbGotoInput: TComboBox;
    tsSubdetail: TTabSheet;
    Panel5: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    LExtraDesc: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    Lmanufacturer: TLabel;
    edtBar: TEdit;
    MlongDesc: TMemo;
    CBStockType: TComboBox;
    cbSize: TComboBox;
    Emanufacturer: TEdit;
    Label1: TLabel;
    edtStockCode: TEdit;
    SPChangeCode: TSpeedButton;
    edtDescription: TEdit;
    Label2: TLabel;
    GroupBox5: TGroupBox;
    lblRep2: TLabel;
    lblRep1: TLabel;
    CbxRepGroup2: TComboBox;
    CbxRepGroup1: TComboBox;
    LPrefSup1: TLabel;
    LPrefSup2: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    ESupp1: TEdit;
    BSuppLier1: TBitBtn;
    ESupp2: TEdit;
    BSuppLier2: TBitBtn;
    ESup1stockCode: TEdit;
    ESup2stockCode: TEdit;
    LCDDisabled: TLabel;
    CDDisabled: TCheckBox;
    LcboxInvDiscount: TLabel;
    cboxInvDiscount: TCheckBox;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    edtSales: TEdit;
    edtCOS: TEdit;
    edtStockControl: TEdit;
    edtLastInvoice: TEdit;
    BBSales: TBitBtn;
    BBCOS: TBitBtn;
    BBStockControl: TBitBtn;
    gbSellingprices: TGroupBox;
    LExcl: TLabel;
    lblPrice1: TLabel;
    lblPrice2: TLabel;
    lblPrice3: TLabel;
    LIncl: TLabel;
    edtSellingPrice1: TEdit;
    edtSellingPrice2: TEdit;
    edtSellingPrice3: TEdit;
    edtSellingPrice3Inc: TEdit;
    edtSellingPrice2Inc: TEdit;
    edtSellingPrice1Inc: TEdit;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtInput: TEdit;
    BBInput: TBitBtn;
    edtOutput: TEdit;
    BBOutput: TBitBtn;
    GroupBox1: TGroupBox;
    LNettoWeigth: TLabel;
    LGrossWeight: TLabel;
    ENettoWeigth: TEdit;
    EGrossWeigth: TEdit;
    GroupBox6: TGroupBox;
    LAvgCost: TLabel;
    LTotalCost: TLabel;
    LQtyOnhand: TLabel;
    LLatestCost: TLabel;
    LCostpr: TLabel;
    Label8: TLabel;
    LReorderat: TLabel;
    LMinimum: TLabel;
    edtAveCost: TEdit;
    edtTotalCost: TEdit;
    edtQtyonHand: TEdit;
    edtLatestCost: TEdit;
    EPrice: TEdit;
    edtReorder: TEdit;
    EReorderAt: TEdit;
    EMinimum: TEdit;
    Masscheck1: TMenuItem;
    addgroup1: TMenuItem;
    LUpdatetype: TLabel;
    cbUpdateType: TComboBox;
    tsLinksale: TTabSheet;
    ZQLinkSale: TuniQuery;
    ZQLinkSaleWSTOCKLINKSALEID: TIntegerField;
    ZQLinkSaleWSTOCKID: TIntegerField;
    ZQLinkSaleWGROUPID: TIntegerField;
    ZQLinkSaleWGROUPITEMID: TIntegerField;
    ZQLinkSaleFEXTRAPRICE: TFloatField;
    ZQLinkSaleWPRICETYPE: TSmallintField;
    ZQLinkSaleWSORTID: TIntegerField;
    ZUSQLinkSale: TUniUpdateSql;
    dsLinkSale: TDataSource;
    ZQLinkSaleWLINKSTOCKID: TIntegerField;
    panel7: TPanel;
    DBNavigator1: TDBNavigator;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    Label20: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    DBEdit6: TDBEdit;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    ZQLinkmaingroup: TuniQuery;
    ZQLinksubGroup: TuniQuery;
    ZQLinkmaingroupWGROUPID: TIntegerField;
    ZQLinkmaingroupWGROUPTYPEID: TIntegerField;
    ZQLinkmaingroupSDESCRIPTION: TStringField;
    ZQLinkmaingroupWPARENTGROUP2ID: TIntegerField;
    ZQLinkmaingroupWPARENTGROUP1ID: TIntegerField;
    ZQLinkmaingroupDSYSDATE: TDateTimeField;
    ZQLinkmaingroupWSORTNO: TIntegerField;
    ZQLinkmaingroupBDISABLE: TSmallintField;
    ZQLinkmaingroupWCOLOR: TIntegerField;
    ZQLinkmaingroupWTEXTCOLOR: TIntegerField;
    DSlinkmaingroup: TDataSource;
    ZQLinksubGroupWGROUPID: TIntegerField;
    ZQLinksubGroupWGROUPTYPEID: TIntegerField;
    ZQLinksubGroupSDESCRIPTION: TStringField;
    ZQLinksubGroupWPARENTGROUP2ID: TIntegerField;
    ZQLinksubGroupWPARENTGROUP1ID: TIntegerField;
    ZQLinksubGroupDSYSDATE: TDateTimeField;
    ZQLinksubGroupWSORTNO: TIntegerField;
    ZQLinksubGroupBDISABLE: TSmallintField;
    ZQLinksubGroupWCOLOR: TIntegerField;
    ZQLinksubGroupWTEXTCOLOR: TIntegerField;
    DSLinkSubgroup: TDataSource;
    DBLookupComboBox8: TDBLookupComboBox;
    Blookuplinkstock: TBitBtn;
    BitBtn3: TBitBtn;
    tblStockAdWDEFAULTCOSTGROUP1ID: TIntegerField;
    Label28: TLabel;
    cbDeFaultcostgroup: TComboBox;
    Ltaxclass: TLabel;
    cbTaxclass: TComboBox;
    ZQDocsSACCOUNTCODE: TStringField;
    ZQDocsACCDESC: TStringField;
    ZQDocsWTYPEID: TIntegerField;
    ZQDocsBPOSTED: TSmallintField;
    ZQStockTransBPOSTED: TSmallintField;
    ZQStockTransWTYPEID: TIntegerField;
    PEditOneLang: TPanel;
    LLangText2: TLabel;
    DBEdit2: TDBEdit;
    LLangDescription2: TLabel;
    DBText2: TDBText;
    cbManufacturer: TComboBox;
    cbEnterIsNextRecord: TCheckBox;
    ImTumb: TImage;
    TshowTumb: TTimer;
    cbAutoDetailononerecord: TCheckBox;
    OpenDialog2: TOpenDialog;
    ZQStockTransCUMMTOT: TFloatField;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1WSTOCKID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSTOCKCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBARCODENUMBER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FQTYONHAND: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FREORDERQTY: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BAPPLYINVOICEDISCOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FSELLINGPRICE1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FSELLINGPRICE2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FSELLINGPRICE3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FUNITAVECOST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FUNITCOST: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WUNITID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WINPUTTAX2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WSTOCKTYPEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BDISABLED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SEXTRADESC: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SInputTax: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SOutPutTax: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCostAccount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSaleSACCOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SStockAccount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FNETTOWEIGHT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FGROSSWEIGHT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FREORDERQTYTRIG: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SMANUFACTURER: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FMINIMUMQTY: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSTOCKCODESUP1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSTOCKCODESUP2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SWSUPPLIER1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SWSUPPLIER2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID: TcxGridDBBandedColumn;
    cxGrid1Level2: TcxGridLevel;
    cxEditRepository1: TcxEditRepository;
    osfStockGroup1: TcxEditRepositoryImageComboBoxItem;
    osfStockGroup2: TcxEditRepositoryImageComboBoxItem;
    cxEditRepository1ImageComboBoxItem1: TcxEditRepositoryImageComboBoxItem;
    cxMultiGroupGrid: TcxGridDBTableView;
    cxGridmmgroupLevel1: TcxGridLevel;
    cxGridmmgroup: TcxGrid;
    cxMultiGroupGridWGROUPID: TcxGridDBColumn;
    cxMultiGroupGridWSTOCKID: TcxGridDBColumn;
    cxMultiGroupGridIMP_SOURCEID: TcxGridDBColumn;
    LimitRows: TcxSpinEdit;
    lLimitRows: TcxLabel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1WDOCID: TcxGridDBColumn;
    cxGrid2DBTableView1FQTYSHIPPED: TcxGridDBColumn;
    cxGrid2DBTableView1SDOCNO: TcxGridDBColumn;
    cxGrid2DBTableView1DDATE: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid2DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid2DBTableView1FITEMDISCOUNT: TcxGridDBColumn;
    cxGrid2DBTableView1FEXCLUSIVEAMT: TcxGridDBColumn;
    cxGrid2DBTableView1FINCLUSIVEAMT: TcxGridDBColumn;
    cxGrid2DBTableView1PRICEPERITEM: TcxGridDBColumn;
    cxGrid2DBTableView1FUNITQTY: TcxGridDBColumn;
    cxGrid2DBTableView1UNITDESC: TcxGridDBColumn;
    cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid2DBTableView1ACCDESC: TcxGridDBColumn;
    cxGrid2DBTableView1WTYPEID: TcxGridDBColumn;
    cxGrid2DBTableView1BPOSTED: TcxGridDBColumn;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1WSTOCKTRANSACTIONID: TcxGridDBColumn;
    cxGrid3DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid3DBTableView1DDATE: TcxGridDBColumn;
    cxGrid3DBTableView1WSALESMANID: TcxGridDBColumn;
    cxGrid3DBTableView1WDOCID: TcxGridDBColumn;
    cxGrid3DBTableView1WDOCTYPEID: TcxGridDBColumn;
    cxGrid3DBTableView1FQTY: TcxGridDBColumn;
    cxGrid3DBTableView1FCOSTPRICE: TcxGridDBColumn;
    cxGrid3DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid3DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid3DBTableView1WLINEID: TcxGridDBColumn;
    cxGrid3DBTableView1SDOCNO: TcxGridDBColumn;
    cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid3DBTableView1SUSERNAME: TcxGridDBColumn;
    cxGrid3DBTableView1BPOSTED: TcxGridDBColumn;
    cxGrid3DBTableView1WTYPEID: TcxGridDBColumn;
    cxGrid3DBTableView1CUMMTOT: TcxGridDBColumn;
    cxGrid1DBBandedTableView1DSYSDATE: TcxGridDBBandedColumn;
    ZQStockoptionsFEXTRAPRICE2: TFloatField;
    ZQStockoptionsFEXTRAPRICE3: TFloatField;
    Panel8: TPanel;
    LLinkedOptions: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    BGenOptions: TBitBtn;
    cBViewAsTree: TDBCheckBox;
    BRemoveOptions: TBitBtn;
    cxGrid4: TcxGrid;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4DBTableView1WSTOCKOPTIONSID: TcxGridDBColumn;
    cxGrid4DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid4DBTableView1WITEMOPTIONVALUE2ID: TcxGridDBColumn;
    cxGrid4DBTableView1WITEMOPTIONVALUE3ID: TcxGridDBColumn;
    cxGrid4DBTableView1WITEMOPTIONVALUE4ID: TcxGridDBColumn;
    cxGrid4DBTableView1WITEMOPTIONVALUE5ID: TcxGridDBColumn;
    cxGrid4DBTableView1FEXTRAPRICE: TcxGridDBColumn;
    cxGrid4DBTableView1FEXTRAPRICE2: TcxGridDBColumn;
    cxGrid4DBTableView1FEXTRAPRICE3: TcxGridDBColumn;
    cxGrid4DBTableView1WITEMOPTIONVALUE1ID: TcxGridDBColumn;
    cxGrid4DBTableView1FQTYONHAND: TcxGridDBColumn;
    cxGrid4DBTableView1SBARCODE: TcxGridDBColumn;
    cxGrid4DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid4DBTableView1FUNITCOST: TcxGridDBColumn;
    cxGrid4DBTableView1FUNITAVECOST: TcxGridDBColumn;
    cxGrid4DBTableView1FREORDERQTY: TcxGridDBColumn;
    cxGrid4DBTableView1FREORDERQTYTRIG: TcxGridDBColumn;
    cxGrid4DBTableView1EXPECTED: TcxGridDBColumn;
    cxGrid4Level1: TcxGridLevel;
    Panel9: TPanel;
    LBomList: TLabel;
    LTotalCostPrice: TLabel;
    LTotalPrice: TLabel;
    Button1: TBitBtn;
    Button2: TBitBtn;
    BRecalcpercent: TBitBtn;
    rgRecalcBase: TRadioGroup;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5Level1: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGrid5DBTableView1WBOMID: TcxGridDBColumn;
    cxGrid5DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid5DBTableView1WLINKEDSTOCKID: TcxGridDBColumn;
    cxGrid5DBTableView1FQTY: TcxGridDBColumn;
    cxGrid5DBTableView1SSTOCKCODE: TcxGridDBColumn;
    cxGrid5DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid5DBTableView1FPERCENTAGEOFSALE: TcxGridDBColumn;
    cxGrid5DBTableView1FUNITAVECOST: TcxGridDBColumn;
    cxGrid5DBTableView1FUNITCOST: TcxGridDBColumn;
    cxGrid5DBTableView1FQTYONHAND: TcxGridDBColumn;
    cxGrid5DBTableView1LSTOCKCODE: TcxGridDBColumn;
    cxGrid5DBTableView1LSTOCKDESC: TcxGridDBColumn;
    cxGrid5DBTableView1FSELLINGPRICE2: TcxGridDBColumn;
    cxGrid6DBTableView1: TcxGridDBTableView;
    cxGrid6Level1: TcxGridLevel;
    cxGrid6: TcxGrid;
    cxGrid6DBTableView1WGROUPID: TcxGridDBColumn;
    cxGrid6DBTableView1WGROUPITEMID: TcxGridDBColumn;
    cxGrid6DBTableView1FEXTRAPRICE: TcxGridDBColumn;
    cxGrid6DBTableView1WPRICETYPE: TcxGridDBColumn;
    cxGrid6DBTableView1WSORTID: TcxGridDBColumn;
    cxGrid6DBTableView1WLINKSTOCKID: TcxGridDBColumn;
    cbSimplelayout: TCheckBox;
    Splitter33: TcxSplitter;
    Splitter2: TcxSplitter;
    cbNoCalcFields: TCheckBox;
    Panel10: TPanel;
    BSelectImage: TBitBtn;
    BDeleteimage: TBitBtn;
    ZQStockoptionsBENABLED: TSmallintField;
    ZQStockoptionsWBOXSIZE: TIntegerField;
    cxGrid4DBTableView1BENABLED: TcxGridDBColumn;
    cxGrid4DBTableView1WBOXSIZE: TcxGridDBColumn;
    pmlinesactive: TPopupMenu;
    Active1: TMenuItem;
    Inactive1: TMenuItem;
    poptfreefields: TPanel;
    cxSplitter1: TcxSplitter;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtStockCodeExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAveCostExit(Sender: TObject);
    procedure edtTotalCostExit(Sender: TObject);
    procedure edtQtyonHandExit(Sender: TObject);
    procedure edtPercentExit(Sender: TObject);
    procedure TransDteExit(Sender: TObject);
    procedure CbxRepGroup1DropDown(Sender: TObject);
    procedure dbgAdStockEditKeyPress(Sender: TObject; var Key: Char);
    procedure btnToClick(Sender: TObject);
    procedure SPChangeCodeClick(Sender: TObject);
    procedure edtSellingPrice1IncExit(Sender: TObject);
    procedure edtSellingPrice1Exit(Sender: TObject);
    procedure edtSellingPrice2IncExit(Sender: TObject);
    procedure edtSellingPrice2Exit(Sender: TObject);
    procedure edtSellingPrice3IncExit(Sender: TObject);
    procedure edtSellingPrice3Exit(Sender: TObject);
    procedure CBStockTypeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BBInputClick(Sender: TObject);
    procedure BBOutputClick(Sender: TObject);
    procedure BBSalesClick(Sender: TObject);
    procedure BBCOSClick(Sender: TObject);
    procedure BBStockControlClick(Sender: TObject);
    procedure PChangeCodeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure AdvancedPanelExit(Sender: TObject);
    procedure BSuppLier1Click(Sender: TObject);
    procedure BSuppLier2Click(Sender: TObject);
    procedure tblStockAdAfterInsert(DataSet: TDataSet);
    procedure tblStockAdCalcFields(DataSet: TDataSet);
    procedure tblStockAdBeforeOpen(DataSet: TDataSet);
    procedure QBOMAfterInsert(DataSet: TDataSet);
    procedure QBOMAfterDelete(DataSet: TDataSet);
    procedure SearchClick(Sender: TObject);
    procedure CheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BEditClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure dbgAdStockEditDblClick(Sender: TObject);
    procedure BAdvancedClick(Sender: TObject);
    procedure cbUpdateTypeChange(Sender: TObject);
    procedure BCopyClick(Sender: TObject);
    procedure bImportClick(Sender: TObject);
    procedure BExportClick(Sender: TObject);
    procedure tblStockAdAfterEdit(DataSet: TDataSet);
    procedure tblStockAdAfterPost(DataSet: TDataSet);
    procedure tblStockAdAfterDelete(DataSet: TDataSet);
    procedure BReportClick(Sender: TObject);
    procedure BSetupstockClick(Sender: TObject);
    procedure BSetupGroupsClick(Sender: TObject);
    procedure Printsingleitem1Click(Sender: TObject);
    procedure BSelectImageClick(Sender: TObject);
    procedure BDeleteimageClick(Sender: TObject);
    procedure edtBarDblClick(Sender: TObject);
    procedure DBGDocumentsDblClick(Sender: TObject);
    procedure BGenOptionsClick(Sender: TObject);
    procedure ZQDefoptionsAfterInsert(DataSet: TDataSet);
    procedure ZQStockoptionsAfterInsert(DataSet: TDataSet);
    procedure ZQStockoptionsWITEMOPTIONVALUE1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblStockAdAfterCancel(DataSet: TDataSet);
    procedure BRemoveOptionsClick(Sender: TObject);
    procedure CbxRepGroup1CloseUp(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ZQDescriptionsBeforeOpen(DataSet: TDataSet);
    procedure ZQStockMultigroupWGROUPIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ZQStockMultigroupAfterInsert(DataSet: TDataSet);
    procedure ZQStockTransBeforeEdit(DataSet: TDataSet);
    procedure ZQStockTransBeforeInsert(DataSet: TDataSet);
    procedure DBMemo1DblClick(Sender: TObject);
    procedure DBLookupComboBox2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQDescriptionsAfterInsert(DataSet: TDataSet);
    procedure DBGBomDblClick(Sender: TObject);
    procedure ZQDocsCalcFields(DataSet: TDataSet);
    procedure cbCurLangChange(Sender: TObject);
    procedure BRecalcpercentClick(Sender: TObject);
    procedure Next1Click(Sender: TObject);
    procedure Prev1Click(Sender: TObject);
    procedure Postandnext1Click(Sender: TObject);
    procedure Postandprev1Click(Sender: TObject);
    procedure CalcBomCostPrice ;
    procedure BDissembleClick(Sender: TObject);
    procedure BAssembleClick(Sender: TObject);
    procedure QBOMBeforeInsert(DataSet: TDataSet);
    procedure pmExtraActionsPopup(Sender: TObject);
    procedure CBReportDropDown(Sender: TObject);
    procedure BSetSelPRiceToClick(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure dbgAdStockEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EUnpostedDblClick(Sender: TObject);
    procedure OnMenuCopy(Sender: TObject);
    procedure OnMenuPast(Sender: TObject);
    procedure GenMenuCopy(Sender: TObject);
    procedure GenMenuPast(Sender: TObject);

    procedure OnMenuPluginAct1(Sender: TObject);
    procedure OnMenuPluginAct2(Sender: TObject);
    procedure ZQStockoptionsBeforePost(DataSet: TDataSet);
    procedure ZQDescriptionsBeforePost(DataSet: TDataSet);
    procedure BlangfreefieldsClick(Sender: TObject);
    procedure HideTransfields ;
    procedure QBOMCalcFields(DataSet: TDataSet);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy2Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure ZQStockoptionsCalcFields(DataSet: TDataSet);
    procedure urlencode1Click(Sender: TObject);
    procedure urldecode1Click(Sender: TObject);
    procedure ZQStockTransBeforeOpen(DataSet: TDataSet);
    procedure tblStockAdBeforePost(DataSet: TDataSet);
    procedure cbDescqtyShowChange(Sender: TObject);
    procedure cbGotoInputChange(Sender: TObject);
    procedure Masscheck1Click(Sender: TObject);
    procedure edtDescriptionExit(Sender: TObject);
    procedure edtSellingPrice1DblClick(Sender: TObject);
    procedure edtDescriptionClick(Sender: TObject);
    procedure ZQLinkSaleAfterInsert(DataSet: TDataSet);
    procedure ZQLinkSaleWGROUPIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQLinkSaleWLINKSTOCKIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure ZQLinkSaleAfterScroll(DataSet: TDataSet);
    procedure BlookuplinkstockClick(Sender: TObject);
    procedure ZQLinkSaleWPRICETYPEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQLinkSaleWPRICETYPESetText(Sender: TField;
      const Text: String);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbTaxclassChange(Sender: TObject);
    procedure ZQDocsWTYPEIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQDescriptionsAfterScroll(DataSet: TDataSet);
    procedure MEditLangEnter(Sender: TObject);
    procedure TshowTumbTimer(Sender: TObject);
    procedure tblStockAdAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure cbSimplelayoutClick(Sender: TObject);
    procedure Active1Click(Sender: TObject);
    procedure Inactive1Click(Sender: TObject);
    procedure ZQStockoptionsAfterScroll(DataSet: TDataSet);
    procedure ZQStockoptionsBeforeScroll(DataSet: TDataSet);

  private
    { Private declarations }
    // 0 = default 1  = wharehouse
    TotalCummCount : Double ;
    AStockLinksList : TStringList ;
    LastControlForCopy : TCustomEdit ;
    APanelTreeView : TPanelTreeView ;
    AccessType : Integer ;
    AveCost, QteHand,
    LastCost,LastTotalBomCost : Double;
    bPosting ,ctrlDown: Boolean;
    LookupWasShow, NeedsSearchRefresh : Boolean ;
    CopyData : Variant ;
    aDMCoreDocData : TDMCoreDocData ;
    ARemeberAccountList : TOSFLedgerCalculationClass ;
    AGroupColorList,AGroupTextColorList,ACalculatedFields : TStringlist ;
    MyBackord : TfmBackOrdersOutstanding ;
    AFreeformArray  : array of TEditPanel ;
    aOptFreeFields : TEditPanel ;
    MEditLang : TosFMemo ;
    Procedure RunAdjust;
    Procedure ClearScreen;
    procedure LoadStockToGui(NoDesc : Boolean = false) ;
    procedure SetEUpostedText ;
//    Procedure updateTab;
//    Procedure AdjustWith123;
    Procedure SetColIndex(S:String);
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;

    procedure SetButtons;
    procedure LoadReports;
    procedure LoadPluginsStock ;
    procedure InitPluginsOnPagecontrol ;
    procedure SendMessageToPlugin(AMessage : String);
    procedure Openinbrowserfromimplink1Click(Sender: TObject);
    procedure pcDetailsListExpClick(Sender: TObject);
  public
    APluginList : TStringlist ;
    APluginsFormsList : TStringlist ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    aSearchPanel : TSearchPanel ;
    AddNewStockItem,StockName,StockBarcode,StockManufacturer : String ;
    AddNewStockType : Integer ; // 0 = Stockcode , 1 = Description , 2 = Barcode
    GoToID : Integer ;
    CopyFromStockID : Integer ;
    DebugMsg : String ;
    { Public declarations }
    InMassCheck,USeHtmlkEditor : Boolean ;
    procedure  CreateStockMovement ;
    procedure RefreshData ;
    function GetAccountCode(AAccount : Integer) : String ;
    procedure RebuildMenu ;
    procedure OnMenuClickGroup1(Sender : Tobject) ;
    procedure OnMenuClickGroup2(Sender : Tobject) ;
    procedure OnHandelProgress(Var Stop :Boolean ; AText : String ; AMax , APostition : Integer;aTransId : Integer ) ;
  end;

var
  fmStockEntry: TfmStockEntry;
  i : Integer;
  s : String;
implementation

uses  Database, GlobalFunctions, Lookup,  HTMLHelpAPI,
 Read123, TcVariables, LedgerRoutines,XRoutines,
  StockInfo,  ExchangeTCData,OSFGeneralRoutines,
  UDMTCCoreLink, UImportCheck, FreeReportsUnit, Groups,
  osfLookup,shellapi, UStockLinkDetail, UReportManager, UDmQuantumGridDefs,
  cxGridDBDataDefinitions;

{$R *.DFM}


Const
 SSelectFromStockTrn  = 'select  1.0000 CUMMTOT,stocktrn.*,dochead.SDocno,dochead.sreference,users.SUSername,dochead.Bposted,dochead.Wtypeid from stocktrn left join dochead on stocktrn.WDOCID = dochead.WDOCID left join users on dochead.WUSerid = users.WUserid' ;


procedure TfmStockEntry.Openinbrowserfromimplink1Click(Sender: TObject);
var
 aString : String ;
begin
  aString := AStockLinksList[TComponent(Sender).tag] ;
  ShellExecute(0,'OPEN',pchar(aString),'','',SW_SHOW) ;
end;

Function CheckStockTrans(WStockID:Integer):boolean;
begin
  result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from stocktrn where WStockID = ' + IntToStr(WStockID))) <> '0';
end;


Procedure DisableCtrl(CtrlObj:Tobject);
begin
  With CtrlObj as TEdit do
  begin
    ReadOnly:=True;
    TabStop:=False;
    Color:=clBtnFace;
  end;
end;

Procedure EnableCtrl(CtrlObj:Tobject);
begin
  With CtrlObj as TEdit do
  begin
    ReadOnly:=False;
    TabStop:=True;

    Color:=clWindow;
  end;
end;



procedure TfmStockEntry.FormShow(Sender: TObject);
var
 CopyFrom : Integer ;
 i : Integer ;
 ForceDetail : Boolean ;
begin
  if  DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE' then
    begin
       pcDetails.ActivePage := TSAccounting ;
        try
       tsFullList.TabVisible := false ;
        except
        end;

       pcDetails.ActivePage := TSAccounting ;
       Panel5.Align := alNone ;
       Panel5.Top := 76 ;
       Panel5.Height := 230 ;
       Panel5.Width := Panel5.Width - 15 ;
       Panel5.Parent := ScrollBox2 ;
       tsSubdetail.TabVisible := False ;
       ScrollBox2.Height := 310 ;
    end else
   pcDetails.ActivePageIndex := 0 ;

   DMTCCoreLink.LoadImage(Bexport.Glyph, 'Export');
   DMTCCoreLink.LoadImage(BImport.Glyph, 'Import');

  EPrice.Visible := DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGINC',false) ;
  LCostpr.Visible :=EPrice.Visible  ;
  TSList.TabVisible := false ;
  TSDetail.TabVisible := false ;

//  DMTCCoreLink.LoadImage(bImport.Glyph,'Ok');
//  DMTCCoreLink.LoadImage(BExport.Glyph,'Ok');


  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Cancel');

  Openinbrowserfromimplink1.Caption := DMTCCoreLink.gettextlang(3182);

  AccessType := DMTCCoreLink.ReadSysParam('cbAccessType',0,CurrentUser) ;
  if AccessType = 1 then
     begin
      WriteNwReportOp('StockExportMode',BoolToStr(False,true)) ;
      // BReport.Visible :=   AccessType = 0 ;
     end;

  BAdvanced.Visible := AccessType = 0 ;
 // cbBarcode.Visible :=   AccessType = 0 ;
  TSAccounting.Enabled :=   AccessType = 0 ;
  GroupBox4.Enabled :=   AccessType = 0 ;
  edtDescription.Enabled :=   AccessType = 0 ;
  gbSellingprices.Enabled :=   AccessType = 0 ;
  gbSellingprices.Enabled :=   AccessType = 0 ;
  CDDisabled.Enabled :=   AccessType = 0 ;
  cboxInvDiscount.Enabled :=   AccessType = 0 ;
  GroupBox5.Enabled :=   AccessType = 0 ;
  MlongDesc.Enabled :=   AccessType = 0 ;
  edtReorder.Enabled :=   AccessType = 0 ;
  SPChangeCode.Visible :=   AccessType = 0 ;
  BNew.Visible :=   AccessType = 0 ;
  BCopy.Visible :=   AccessType = 0 ;
  BDelete.Visible :=   AccessType = 0 ;
  cbManufacturer.Visible := AccessType = 0 ;
  Emanufacturer.Visible :=   AccessType = 0 ;
  if  AccessType = 0 then
  begin
  cbManufacturer.Visible :=  FillStringsWithReportingGroups(cbManufacturer.Items,121);
  Emanufacturer.Visible :=  not cbManufacturer.Visible ;
   end;
  cbUpdateType.Items[0] :=  DMTCCoreLink.GetTextLangNoAmp(1098);// All
  cbUpdateType.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1768);// Ave && Latest Cost
  cbUpdateType.Items[2]:= DMTCCoreLink.GetTextLangNoAmp(1769);// Qty && Ave Cost
  cbUpdateType.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1992);// Qty && Latest Cost
  cbUpdateType.Items[4] := DMTCCoreLink.GetTextLangNoAmp(1770);// Selling Prices
  cbUpdateType.Items[5] := DMTCCoreLink.GetTextLangNoAmp(1771);// Stock Take-on
  cbUpdateType.Items[6] := DMTCCoreLink.GetTextLangNoAmp(990);
  cbUpdateType.Items[7] := DMTCCoreLink.GetTextLangNoAmp(1708);
  cbUpdateType.Items[8] := DMTCCoreLink.GetTextLangNoAmp(3357);
  lLimitRows.Caption := DMTCCoreLink.GetTextLangNoAmp(3562);
  LSetprice.Caption :=  DMTCCoreLink.GetTextLangNoAmp(906011);
  Copy1.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3293);
  BSetSelPRiceTo.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3325);
  CopyItem.Caption :=   DMTCCoreLink.GetTextLangNoAmp(37);
  cbEditExsit.Caption :=   DMTCCoreLink.GetTextLangNoAmp(3324);
  bImport.Caption :=   DMTCCoreLink.GetTextLangNoAmp(2014);
  BExport.Caption :=   DMTCCoreLink.GetTextLangNoAmp(2013);

  cbUpdateType.ItemIndex  := DMTCCoreLink.ReadNwReportOp('STOCKUPDTYPE',0) ;
  cbUpdateTypeChange(self);

  BReport.Caption := DMTCCoreLink.GetTextLangNoAmp(1754);
  TSAdvImpExp.Caption := DMTCCoreLink.gettextlang(2014) + ' / ' + DMTCCoreLink.gettextlang(2013);
  TSExpAdjust.Caption := DMTCCoreLink.gettextlang(42) ;
  TsAdvSetup.Caption := DMTCCoreLink.gettextlang(1368) ;
  TSAccounting.Caption := DMTCCoreLink.gettextlang(1372) ;
  tsBom.Caption := DMTCCoreLink.gettextlang(2920) ;
  TSInvoices.Caption := DMTCCoreLink.gettextlang(1837) ;
  TSMovements.Caption := DMTCCoreLink.gettextlang(20069) ;
  tsFullList.Caption :=  DMTCCoreLink.gettextlang(1296) ;
  cbBarcode.Caption := DMTCCoreLink.gettextlang(3088) ;

  tsExtra.Caption := DMTCCoreLink.gettextlang(3186) ;


  Ltaxclass.Caption := DMTCCoreLink.gettextlang(3466) ;


  BEdit.Caption := DMTCCoreLink.gettextlang(121);
  BCancel.Caption := DMTCCoreLink.GetTextLangNoAmp(168);
  navBtns(BNew,BDelete,BDelete,BSave);
  Caption :=  GetTextLang(257);//Header 257
  Label1.Caption := GetTextLang(213);//Stock Code 213
  Label2.Caption := GetTextLang(178);//Description 178
  lblRep1.Caption :=  TDataBaseRoutines.GetTypeDescription( 26);//Rep Group 1 179
  lblRep2.Caption := TDataBaseRoutines.GetTypeDescription( 27) ;//Rep group 2 180
  Label3.Caption := GetTextLang(214);//Unit Size 214
  LLatestCost.Caption := GetTextLang(215);//Latest Cost 215
  lblPrice1.Caption := GetTextLang(216);//Selling Price 1 216
  lblPrice2.Caption := GetTextLang(217);//Selling Price2 217
  lblPrice3.Caption := GetTextLang(218);//Selling Price3 218
  Label6.Caption := GetTextLang(219);//Input Tax 219
  Label7.Caption := GetTextLang(220);//Output Tax 220
  Label8.Caption := GetTextLang(221);//Reorder Level 221
  lcboxInvDiscount.Caption := GetTextLang(222);//Apply Invoice Discount 222
  Label9.Caption := GetTextLang(223);//Sales Account 223
  Label10.Caption := GetTextLang(224);//Cost of Sales 224
  Label11.Caption := GetTextLang(225);//Stock Control 225
  LAvgCost.Caption := GetTextLang(226);//Average Cost 226
  LQtyOnhand.Caption := GetTextLang(227);//Quantity on hand 227
  LTotalCost.Caption := GetTextLang(228);//Total Cost 228
  Label15.Caption := GetTextLang(229);//Last invoice 229
  btnOK.Caption := GetTextLang(167);//OK 167
  // btnCancel.Caption := GetTextLang(168);//Cancel 168
  LTotalPrice.Caption := GetTextLang(20065);
  LTotalCostPrice.Caption := DMTCCoreLink.GetTextLangNoAmp(414) ;

  BRecalcpercent.Caption := GetTextLang(3288);
  rgRecalcBase.Caption := GetTextLang(3285);
  rgRecalcBase.Items[0] :=  GetTextLang(3286);
  rgRecalcBase.Items[1] :=  GetTextLang(3287);

  LookupWasShow := fmLookup.IsShowForm ;
  fmLookup.IsShowForm := false ;
  // done : Pieter Can never forget to put it back
  PCStock.ActivePage := TSList  ;

 
 

  cbDeFaultcostgroup.Enabled:=FillStringsWithReportingGroups(cbDeFaultcostgroup.Items,1002);
  TDataBaseStringRoutines.FillStringListWithSelect(cbTaxclass.Items,'select WSTOCKCLASSTAXID,Sname from STOCKTAXCLASS order by WSTOCKCLASSTAXID');
 TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WINPUTTAX2ID.Properties).Items.Clear ;
 for i := 0 to  cbTaxclass.Items.count -1 do
  with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WINPUTTAX2ID.Properties).Items.Add do
   begin
      Value := integer(cbTaxclass.Items.objects[i]) ;
      Description :=  cbTaxclass.Items[i] ;
   end;

  // done :Pieter account needs to be open before Stockadd for the lookup of the accounts in the stock table
  //dmDatabase.tblAccount.open ;
  tblStockAd.Close;
  tblStockAd.sql.text := 'Select * from stock where Wstockid = 0 '  ;
  tblStockAd.Open;

   


 // dmDatabase.tblAccount.Open;
//  dmDatabase.tblStock.Close ;
//  dmDatabase.tblStock.Open ;
  // done : Pieter translation

  BCopy.Caption := GetTextLang(2924);{Copy from item}

  LUpdatetype.Caption := GetTextLang(3090);
  BSetupstock.Caption := GetTextLang(3091);
  BSetupGroups.Caption := GetTextLang(3092);

 



   
  cxGrid2DBTableView1DDATE.Caption := DMTCCoreLink.GetTextLang(1802);// date
  cxGrid2DBTableView1FQTYSHIPPED.Caption := DMTCCoreLink.GetTextLang(2052);// Qty
  cxGrid2DBTableView1SDOCNO.Caption := DMTCCoreLink.GetTextLang(1120);// Docno
  cxGrid2DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(1708);// Description

    cxGrid2DBTableView1FSELLINGPRICE.Caption := DMTCCoreLink.GetTextLang(1709);// sel
   cxGrid2DBTableView1FITEMDISCOUNT.Caption := DMTCCoreLink.GetTextLang(1786);// disc

   cxGrid2DBTableView1FEXCLUSIVEAMT.Caption := DMTCCoreLink.GetTextLang(684);// exc
    cxGrid2DBTableView1FINCLUSIVEAMT.Caption := DMTCCoreLink.GetTextLang(906011);// exc
    cxGrid2DBTableView1PRICEPERITEM.Caption := DMTCCoreLink.GetTextLang(906012);// inc

    cxGrid2DBTableView1FUNITQTY.Caption := DMTCCoreLink.GetTextLang(214);// qty
    cxGrid2DBTableView1UNITDESC.Caption := DMTCCoreLink.GetTextLang(178);// unit

    cxGrid2DBTableView1SACCOUNTCODE.Caption := DMTCCoreLink.GetTextLang(2046);// unit
   cxGrid2DBTableView1ACCDESC.Caption := DMTCCoreLink.GetTextLang(185);// unit

    cxGrid2DBTableView1WTYPEID.Caption := DMTCCoreLink.GetTextLang(1869);// doctype
    cxGrid2DBTableView1BPOSTED.Caption := DMTCCoreLink.GetTextLang(961);// posted

  cxGrid3DBTableView1DDATE.Caption := DMTCCoreLink.GetTextLang(1802);// date

  cxGrid3DBTableView1FQTY.Caption := DMTCCoreLink.GetTextLang(2052);// Qty
  cxGrid3DBTableView1FCOSTPRICE.Caption := DMTCCoreLink.GetTextLang(414);// costprice
  cxGrid3DBTableView1FSELLINGPRICE.Caption := DMTCCoreLink.GetTextLang(416);// Sellign price
  cxGrid3DBTableView1WLINEID.Caption := DMTCCoreLink.GetTextLang(3048);// line

  cxGrid3DBTableView1SDOCNO.Caption := DMTCCoreLink.GetTextLang(1120);// doc

  cxGrid3DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(1974);

  cxGrid3DBTableView1SUSERNAME.Caption := DMTCCoreLink.GetTextLang(1072);

  cxGrid3DBTableView1CUMMTOT.Caption := DMTCCoreLink.GetTextLang(906007);
  cxGrid3DBTableView1WTYPEID.Caption := DMTCCoreLink.GetTextLang(1869);// doctype
  cxGrid3DBTableView1BPOSTED.Caption := DMTCCoreLink.GetTextLang(961);// posted


   cxGrid1DBBandedTableView1DSYSDATE.Caption  := DMTCCoreLink.GetTextLang(3434);


  LPrefSup1.Caption := DMTCCoreLink.GetTextLang(3094);
  LPrefSup2.Caption := DMTCCoreLink.GetTextLang(3095);
  LStockIncUnposted.Caption := DMTCCoreLink.GetTextLang(3140);
  GroupBox3.Caption :=  GetTextLang(103);
  tsSubdetail.Caption :=  GetTextLang(103);
  GroupBox6.Caption :=  GetTextLang(2871);
  gbSellingprices.Caption :=  GetTextLang(1770);
  LExcl.Caption :=  GetTextLang(650);
  LIncl.Caption :=  GetTextLang(651);
  Button1.Caption :=  GetTextLang(292);
  Button2.Caption :=  GetTextLang(2248);

  TSOptions.Caption :=    GetTextLang(3144);
  BGenOptions.Caption :=    GetTextLang(3145);

  LNettoWeigth.Caption :=    GetTextLang(3127   );
  LGrossWeight.Caption :=    GetTextLang(3128 );

  BRemoveOptions.Caption :=    GetTextLang(3149  );
  cBViewAsTree.Caption :=    GetTextLang(3147);

  cxGrid4DBTableView1FEXTRAPRICE.Caption :=  GetTextLang(3150) +' 1';
  cxGrid4DBTableView1FEXTRAPRICE2.Caption :=  GetTextLang(3150) +' 2';
  cxGrid4DBTableView1FEXTRAPRICE3.Caption :=  GetTextLang(3150) +' 3';
  cxGrid4DBTableView1WITEMOPTIONVALUE1ID.Caption :=  GetTextLang(3148);

  cxGrid4DBTableView1FQTYONHAND.Caption :=  GetTextLang(227);
  cxGrid4DBTableView1SBARCODE.Caption :=  GetTextLang(990);
  cxGrid4DBTableView1SREFERENCE.Caption :=  GetTextLang(1719);
  cxGrid4DBTableView1FUNITCOST.Caption :=  GetTextLang(1784);
  cxGrid4DBTableView1FUNITAVECOST.Caption :=  GetTextLang(215);

  cxGrid4DBTableView1FREORDERQTY.Caption :=  GetTextLang(221);
  cxGrid4DBTableView1FREORDERQTYTRIG.Caption :=  GetTextLang(3129);

 


  BSelectImage.Caption :=  GetTextLang(3137);

  BDeleteimage.Caption :=  GetTextLang(3138);

LReorderat.Caption :=  GetTextLang(3129 );
LMinimum.Caption :=  GetTextLang(3130 );

edtReorder.Hint :=  GetTextLang(3131 );
EReorderAt.Hint :=  GetTextLang(3132 );
EMinimum.Hint   :=  GetTextLang(3133 );
  lblPrice1.Caption := DMTCCoreLink.ReadSysVar('SSellingPriceName1');
  lblPrice2.Caption := DMTCCoreLink.ReadSysVar('SSellingPriceName2');
  lblPrice3.Caption :=  DMTCCoreLink.ReadSysVar('SSellingPriceName3');

  {DBGBom.Columns[0].Title.Caption :=  GetTextLang(213);
  DBGBom.Columns[1].Title.Caption :=  GetTextLang(1708);
  DBGBom.Columns[2].Title.Caption :=  GetTextLang(2052);

   DBGBom.Columns[3].Title.Caption :=  GetTextLang(3265);
   DBGBom.Columns[4].Title.Caption :=    GetTextLang(226) ;
   DBGBom.Columns[5].Title.Caption :=  GetTextLang(215) ;
   DBGBom.Columns[6].Title.Caption :=  GetTextLang(227);
    }

  cxGrid5DBTableView1LSTOCKCODE.Caption :=  GetTextLang(213);
  cxGrid5DBTableView1LSTOCKDESC.Caption :=  GetTextLang(1708);
  cxGrid5DBTableView1FQTY.Caption :=  GetTextLang(2052);

   cxGrid5DBTableView1FPERCENTAGEOFSALE.Caption :=  GetTextLang(3265);
   cxGrid5DBTableView1FUNITAVECOST.Caption :=    GetTextLang(226) ;
   cxGrid5DBTableView1FUNITCOST.Caption :=  GetTextLang(215) ;
  cxGrid5DBTableView1FQTYONHAND.Caption :=  GetTextLang(227);
  cxGrid5DBTableView1FSELLINGPRICE2.Caption :=  lblPrice2.Caption  ;

   BAssemble.Caption :=  GetTextLang(3270);
   BDissemble.Caption :=  GetTextLang(3271);

   Label18.Caption :=  GetTextLang(3267);
   Label19.Caption :=  GetTextLang(3267);
   LPrefSup1.Caption :=  GetTextLang(3268) +' 1';
   LPrefSup2.Caption :=  GetTextLang(3268) +' 2';



   Next1.Caption :=  GetTextLang(729)  ;
   Prev1.Caption :=  GetTextLang(728)  ;
   Postandnext1.Caption := GetTextLang(726) +' +  ' + GetTextLang(729)  ;
   Postandprev1.Caption := GetTextLang(726) +' +  ' + GetTextLang(728)  ;

  GroupBox2.Caption :=  GetTextLang(1372){Ledger};
  GroupBox5.Caption :=  GetTextLang(123){Reporting};
  GroupBox4.Caption :=  GetTextLang(1863){Tax};
  Label17.Caption :=  GetTextLang(1079);
  LBomList.Caption :=  GetTextLang(2923){Bom list};
  LExtraDesc.Caption := gettextlang(2919);
  LCostpr.Caption := gettextlang(3269);
  CBStockType.Items[0] := GetTextLang(1341){STANDARD};
  CBStockType.Items[1] := GetTextLang(2920){BOM};
  CBStockType.Items[2] := GetTextLang(1792){Sales};
  CBStockType.Items[3] := GetTextLang(302){Purchase};
  CBStockType.Items[4] := GetTextLang(2921) {Sales (No stock)};
  CBStockType.Items[5] := GetTextLang(2922) {Purchase (No stock)};

  CBStockType.Items[6] := GetTextLang(3151) ;
  CBStockType.Items[7] := GetTextLang(3142 ) ;
  CBStockType.Items[8] := GetTextLang(3143 ) ;
  CBStockType.Items[9] := GetTextLang(3266 ) ;

 { wwDBComboBox1.Items[0] :=   GetTextLang(1341)+ #9 +'0'  ;
  wwDBComboBox1.Items[1] := GetTextLang(2920)+ #9 + '1'  ;
  wwDBComboBox1.Items[2] :=  GetTextLang(1792)+ #9 + '2' ;
  wwDBComboBox1.Items[3] :=  GetTextLang(302)+ #9 + '3' ;
  wwDBComboBox1.Items[4] :=  GetTextLang(2921) + #9 + '4' ;
  wwDBComboBox1.Items[5] :=  GetTextLang(2922)+ #9 +  '5' ;

  wwDBComboBox1.Items[6] :=  GetTextLang(3151)+ #9 + '6' ;
  wwDBComboBox1.Items[7] :=  GetTextLang(3142 )+ #9 + '7' ;
  wwDBComboBox1.Items[8] :=  GetTextLang(3143 )+ #9 +'8'  ;
  wwDBComboBox1.Items[9] :=  GetTextLang(3266 )+ #9 +'9'  ; }

 TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Clear ;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 0 ;
      Description :=  GetTextLang(1341) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 1 ;
      Description :=  GetTextLang(2920) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 2 ;
      Description :=  GetTextLang(1792) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 3 ;
      Description :=  GetTextLang(302) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 4 ;
      Description :=  GetTextLang(2921) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 5 ;
      Description :=  GetTextLang(2922) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 6 ;
      Description :=  GetTextLang(3151) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 7 ;
      Description :=  GetTextLang(3142) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 8 ;
      Description :=  GetTextLang(3143) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 9 ;
      Description :=  GetTextLang(3266) ;
   end;
 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WSTOCKTYPEID.Properties).Items.Add do
   begin
      Value := 10 ;
      Description :=  'Linked items' ;
   end;


  tstranslations.Caption := GetTextLang(3134 ) ;
  TSGroups.Caption := GetTextLang(3136 ) ;



  LNewStockCode.Caption :=  GetTextLang(213){NEw stock code};
  BitBtn1.Caption :=  GetTextLang(2395);
  BitBtn2.Caption :=  GetTextLang(2396);



  GroupBox1.Caption :=  GetTextLang(3152);
  DBMemo1.Hint :=  GetTextLang(3153);

  LLinkedOptions.Caption :=  GetTextLang(3146);


  Label5.Caption :=  GetTextLang(1774);{barcode}
 // cbUse123.Caption :=  GetTextLang(1797); //Use SpreadSheet File
  CheckBox1.Caption :=  GetTextLang(1798); //Generate Transactions
  cbUsePercent.Caption :=  GetTextLang(1799); //Use Percentage
 // cbToAll.Caption :=  GetTextLang(1800); // To all items
  lblDateTrn.Caption :=  GetTextLang(1802); // Date
  LIncl.Caption := GetTextLang(1866);
  LExcl.Caption := GetTextLang(1864);

  // end translation
  TransDte.DateTime := Date;

 
    PnlAdjust.Enabled:=False ;
    PnlAdjust.Height:=0;






  edtAveCost.Color:=clBtnFace;
  edtQtyonHand.Color:=clBtnFace;
  edtTotalCost.Color:=clBtnFace;
  edtLastInvoice.Color:=clBtnFace;

//  ButtonPanel.Color := fmMain.ControlPanel.Color;
  CbxRepGroup1.Sorted := False ;
  CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,26);
  CbxRepGroup1.Sorted := true ;

  TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(osfStockGroup1.Properties),26);
  TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(osfStockGroup2.Properties),27);
  TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID.Properties),1002);
  cxGrid1DBBandedTableView1WINPUTTAX2ID.Caption :=  DMTCCoreLink.gettextlang(3466) ;

  CbxRepGroup2.Sorted := False ;
  CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,27);
  CbxRepGroup2.Sorted := true ;
  RebuildMenu ;
  lblRep1.Caption :=TDataBaseRoutines.GetTypeDescription( 26);
  lblRep2.Caption := TDataBaseRoutines.GetTypeDescription( 27);

  // ZQStockMultigroupWGROUPID.DisplayLabel := lblRep1.Caption ;
  // DBGrid2.Columns[0].DisplayLabel := lblRep1.Caption ;
  LLanguage.Caption := gettextlang(3135);
  LLangDescription.Caption := gettextlang( 2047);
  LLangText.Caption := gettextlang(1708);
  LLangDescription2.Caption := gettextlang( 2047);
  LLangText2.Caption := gettextlang(1708);
  Lmanufacturer.Caption := gettextlang(3141);


  if DMTCCoreLink.ReadSysVar('BCreateCostOfSales')  = '1' then
    Enable(edtCOS)
  else
    Disable(edtCOS);
  BBCOS.Enabled := edtCOS.Enabled ;



  label28.Caption := GetTextLang(3319);
  cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID.Caption := GetTextLang(3319);

  cxGrid1DBBandedTableView1SSTOCKCODE.Caption := GetTextLang(1772);// Stockcode
  cxGrid1DBBandedTableView1SDescription.Caption := GetTextLang(1773);// Description
  cxGrid1DBBandedTableView1SBarCodeNumber.Caption := GetTextLang(1774);// BarCode
  cxGrid1DBBandedTableView1WUNITID.Caption := GetTextLang(214) ;
  cxGrid1DBBandedTableView1FQtyOnHand.Caption := GetTextLang(1777);// On Hand
  cxGrid1DBBandedTableView1FReorderQty.Caption := GetTextLang(1778);// Reorder
  cxGrid1DBBandedTableView1SEXTRADESC.Caption := GetTextLang(2919);// EXTRADESC
  cxGrid1DBBandedTableView1FUnitAveCost.Caption := GetTextLang(1784);// Avg Cost
  cxGrid1DBBandedTableView1FUnitCost.Caption := GetTextLang(1785);// Unit Cost
  cxGrid1DBBandedTableView1BApplyInvoiceDiscount.Caption := GetTextLang(1786);// Discount
  cxGrid1DBBandedTableView1SInputTax.Caption := GetTextLang(1787);// Input
  cxGrid1DBBandedTableView1SOutputTax.Caption := GetTextLang(1788);// Output
  cxGrid1DBBandedTableView1SCostAccount.Caption := GetTextLang(1791);// Cost
  cxGrid1DBBandedTableView1SSaleSACCOUNT.Caption := GetTextLang(1792);// Sales
  cxGrid1DBBandedTableView1SStockAccount.Caption := GetTextLang(1793);// Stock
  cxGrid1DBBandedTableView1WStockTypeid.Caption :=  GetTextLang(1079); // stocktype

  cxGrid1DBBandedTableView1SSTOCKCODESUP1.Caption :=  GetTextLang(3267) + ' 1';
  cxGrid1DBBandedTableView1SSTOCKCODESUP2.Caption :=  GetTextLang(3267) + ' 2';

  cxGrid1DBBandedTableView1SWSUPPLIER1ID.Caption :=  GetTextLang(3094) ;
  cxGrid1DBBandedTableView1SWSUPPLIER2ID.Caption :=  GetTextLang(3095)  ;

  cxGrid1DBBandedTableView1FSellingPrice1.Caption := lblPrice1.Caption ;
  cxGrid1DBBandedTableView1FSellingPrice2.Caption := lblPrice2.Caption ;
  cxGrid1DBBandedTableView1FSellingPrice3.Caption := lblPrice3.Caption ;
  cxGrid1DBBandedTableView1WReportingGroup1ID.Caption := lblRep1.Caption ;
  cxGrid1DBBandedTableView1WReportingGroup2ID.Caption := lblRep2.Caption ;

  cxGrid1DBBandedTableView1FREORDERQTYTRIG.Caption := GetTextLang(3129 );



  cxGrid1DBBandedTableView1SMANUFACTURER.Caption := gettextlang(3141);

  cxGrid1DBBandedTableView1FNETTOWEIGHT.Caption := gettextlang(3127);
  cxGrid1DBBandedTableView1FGROSSWEIGHT.Caption := gettextlang(3128);


  cxGrid1DBBandedTableView1FMINIMUMQTY.Caption := GetTextLang(3130 );
  cxGrid1DBBandedTableView1BDisabled.Caption := GetTextLang(304);//Disabled

   tsBackorder.Caption :=  DMTCCoreLink.GetTextLangNoAmp(844) ;

 // dbgAdStockEdit.Columns[FindIndexOfName('WReportingGroup1ID')].DisplayLabel := GetTextLang(1795);//Reporting Group2
 // dbgAdStockEdit.Columns[FindIndexOfName('WReportingGroup2ID')].DisplayLabel := GetTextLang(1796);//Reporting Group

  lCDDisabled.Caption := GetTextLang(304);//Disabled
  dmDatabase.tblUnit.Open;
  dmDatabase.tblUnit.First;
 
  cbSize.Items.clear ;
  TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WUNITID.Properties).Items.Clear ;

  while not dmDatabase.tblUnit.EOF do
  begin


 with TcxImageComboBoxProperties(cxGrid1DBBandedTableView1WUNITID.Properties).Items.Add do
   begin
      Value := dmDatabase.tblUnitWUNITID.AsInteger ;
      Description :=  dmDatabase.tblUnitSDescription.value ;
   end;
    cbSize.Items.AddObject(dmDatabase.tblUnitSDescription.Value,TObject(dmDatabase.tblUnitWUNITID.AsInteger));
    dmDatabase.tblUnit.Next;
  end;


  dmDatabase.tblUnit.Close;
  ForceDetail := False ;

  LoadReoprtOp;
//  edtStockCode.SetFocus;
  SPChangeCode.Caption := gettextlang(2119);

  //CBUpdAll.Caption := gettextlang(2125);
  ClearScreen ;
  if AddNewStockItem <> '' then
    begin

     // copy from
     CopyFrom := DMTCCoreLink.ReadNwReportOp('STOCKDEFAULTCOPYFROM',0);
     if CopyFrom <> 0 then
       begin
       tblStockAd.SQL.Text := 'Select * from stock where WStockid = ' + IntToStr(CopyFrom) ;
       tblStockAd.open ;
       BCopyClick(self);
       end else
       begin
         tblStockAd.SQL.Text := 'Select * from stock where WStockid = -1' ;
         tblStockAd.open ;
         BNewClick(self);
       end;
     Case  AddNewStockType of
         0 : begin
               edtStockCode.Text := AddNewStockItem ;
             if StockName <> '' then
                 begin
                  edtDescription.Text :=StockName ;
                  StockName := '' ;
                 end;
             if StockBarcode <> '' then
                 begin
                  edtDescription.Text :=StockBarcode ;
                  StockBarcode := '' ;
                 end;
             if StockManufacturer <> '' then
                 begin
                  if Emanufacturer.Visible then
                     Emanufacturer.Text :=StockManufacturer else
                     cbManufacturer.ItemIndex :=cbManufacturer.Items.IndexOf(StockManufacturer) ;
                  StockManufacturer := '' ;
                 end;
             end;
         1 : edtDescription.Text := AddNewStockItem ;
         2 : begin
              edtBar.Text := AddNewStockItem ;
              edtStockCode.Text := AddNewStockItem ;
             end;
     end; // end case

  //   AddNewStockItem
  //   AddNewStockType
    end else
    if GoToID <> 0 then
      begin
       if aSearchPanel.DefSql <> '' then
             tblStockAd.SQL.Text := aSearchPanel.DefSql
          else
             tblStockAd.SQL.Text :=  'Select * from stock ' ;

        tblStockAd.SQL.Add('where stock.wStockid = ' + intToStr(GoToID));
        tblStockAd.open ;
        GoToID := 0 ;
        BEditClick(self);
      end else
   SearchClick(SELF);

   cxGrid1DBBandedTableView1.RestoreFromRegistry('Software\osfinancials\grids\STOCKGRID',false);


  if  not (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') then
    begin

     pcDetails.PopupMenu := nil ;
     pcDetailsChange(self);
   end;
   try
  cbDescqtyShow.ItemIndex := cbDescqtyShow.Items.IndexOf(VarToStr(DMTCCoreLink.ReadNwReportOp('STOCK_QTYDECSHOW','2')));
  except
  end;
  if cbDescqtyShow.ItemIndex = -1 then cbDescqtyShow.ItemIndex := 1 ;
  cbDescqtyShowChange(cbDescqtyShow);


  if DMTCCoreLink.SimpleMode = 2 then
     begin
       GroupBox2.Visible := False ;
       GroupBox4.Visible := False ;
        tsBackorder.TabVisible := False ;
        BAdvanced.Visible := False ;
     end;
end;

procedure TfmStockEntry.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmStockEntry.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) AND (Not cxGrid1.Focused) then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if PCStock.ActivePage <> TSList then
       begin
        BCancelClick(nil) ;
        Key := #0;
       end;
  end;
  if (Screen.ActiveControl = edtReorder) or(Screen.ActiveControl = edtSellingPrice1) or (Screen.ActiveControl = EReorderAt) or (Screen.ActiveControl = edtSellingPrice2) or (Screen.ActiveControl = edtSellingPrice3)
     or (Screen.ActiveControl = edtSellingPrice1Inc) or (Screen.ActiveControl = edtSellingPrice2Inc) or (Screen.ActiveControl = edtSellingPrice3Inc) or
      (Screen.ActiveControl = edtTotalCost)  or (Screen.ActiveControl = edtQtyonHand)  or
      (Screen.ActiveControl = edtAveCost)  or (Screen.ActiveControl = edtLatestCost)  or (Screen.ActiveControl = EMinimum) or (Screen.ActiveControl =ENettoWeigth)  or (Screen.ActiveControl =EGrossWeigth)  or (Screen.ActiveControl =EMinimum) then
      if key ='.' then key :=DecimalSeparator ;



end;

procedure TfmStockEntry.btnOkClick(Sender: TObject);
begin
 SaveReoprtOp;
 RunAdjust;
 RefreshData ;
end;

procedure TfmStockEntry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearScreen;
  QBOM.close ;
  fmLookup.IsShowForm := LookupWasShow  ;
  SaveReoprtOp ;
end;

procedure TfmStockEntry.edtStockCodeExit(Sender: TObject);
   var
    AControl : TControl ;
    aPoint : TPoint ;
begin
 // No action if the users wants to cancel.
 aPoint :=  PEditButtons.ScreenToClient(Mouse.CursorPos) ;
 AControl := PEditButtons.ControlAtPos(aPoint,false,true)  ;
 if AControl = BCancel then exit ;

  if tblStockAd.State = dsinsert then
    begin
      // See if stockcode exist.
      if TDataBaseStockRoutines.GetStockID(edtStockCode.Text) <> 0 then
        begin
        OSFMessageDlg(DMTCCoreLink.GetTextLang(3086){'Code exists!'},mtError,[mbok],0) ;
        edtStockCode.SetFocus ;
        ABORT ;
        end;
    end;
end;

procedure TfmStockEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
         //Result := (HTMLHelpShowHelp <> 0);
         if not PnlAdjust.Visible  then
             HtmlShowTopic(126)
            else
             HtmlShowTopic(138) ;
             key := 0;
        end;
end;

procedure TfmStockEntry.edtAveCostExit(Sender: TObject);
begin
  edtTotalCost.Text:=FloatToSTr(StrToFloatDef(edtQtyonHand.Text,0)*StrToFloatDef(edtAveCost.Text,0))  ;
  if StrToFloatDef(edtLatestCost.Text,0) = 0 then
    begin
        edtLatestCost.Text := edtAveCost.Text ;
    end;
end;

procedure TfmStockEntry.edtTotalCostExit(Sender: TObject);
begin
  if not edtAveCost.ReadOnly then
     if StrToFloatDef(edtQtyonHand.Text,0) <> 0 then
        edtAveCost.Text:=FloatToSTr(StrToFloatDef(edtTotalCost.Text,0)/StrToFloatDef(edtQtyonHand.Text,0));
  if not edtQtyonHand.ReadOnly then
      if StrToFloatDef(edtAveCost.Text,0) <> 0 then
       edtQtyonHand.Text:=FloatToSTr(StrToFloatDef(edtTotalCost.Text,0)/StrToFloatDef(edtAveCost.Text,0));
end;

procedure TfmStockEntry.edtQtyonHandExit(Sender: TObject);
begin
 edtTotalCost.text:=FloatToSTr(StrToFloatDef(edtQtyonHand.Text,0)*StrToFloatDef(edtAveCost.Text,0))
end;

Procedure TfmStockEntry.ClearScreen;
begin
    CBStockType.Enabled := true ;
    CBStockType.ItemIndex := 0 ;
    cbTaxclass.ItemIndex := -1 ;
    GroupBox4.Enabled := True ;
    GroupBox2.Enabled := True ;
    MlongDesc.Text := '' ;
    edtPercent.text:='';
    edtStockCode.Text := '';
    edtDescription.Text:='';
    edtSellingPrice1.Text:='';
    edtSellingPrice2.Text:='';
    edtSellingPrice3.Text:='';
    edtSellingPrice1Inc.Text:='';
    edtSellingPrice2Inc.Text:='';
    edtSellingPrice3Inc.Text:='';
    edtSellingPrice3Inc.Text:='';
    Emanufacturer.Text:='';
    cbManufacturer.ItemIndex := -1 ;
    EPrice.Text := formatfloat('0.00',0);
    edtReOrder.Text := formatfloat('0.00',0);
    EReorderAt.Text := formatfloat('0.00',0);
    EMinimum.Text := formatfloat('0.00',0);
    edtInput.Tag:= 0;
    edtOutput.Tag:= 0;
    edtSales.Tag:= 0;
    edtCOS.Tag:= 0;
    edtStockControl.Tag:= 0;
    edtInput.Text:='';
    edtOutput.Text:='';
    edtSales.Text:='';
    edtCOS.Text:='';
    edtStockControl.Text:='';
    EUnposted.Text:='';
    EdtQtyOnHand.Text:='0';
    EdtTotalCost.Text:='0';
    EdtAveCost.Text:='0';
    EdtLastInvoice.Text:='';
    CbxRepGroup1.Text := '';
    CbxRepGroup2.Text := '';
    edtLatestCost.Text:='0';
    ESup1stockCode.Text:='';
    ESup2stockCode.Text:='';
    cbSize.Text:= '';
    CDDisabled.Checked :=  false ;
    edtBar.Text:='';
    CBStockType.ItemIndex := 0 ;
    cboxInvDiscount.Checked := true ;
    ESupp1.Text:='';
    ESupp2.Text:='';
    ESupp1.Tag:=0;
    ESupp2.Tag:=0;
    ENettoWeigth.Text :='0';
    EGrossWeigth.Text :='0';
    CBStockTypeChange(self);
    ZQDescriptions.Close ;
    ZQDescriptions.Params[0].AsInteger := 0 ;
    ZQDescriptions.Open ;
    QBOM.close ;
    QBOM.SQL.Text := 'Select BOM.*,Stock.SSTOCKCODE,Stock.SDescription,Stock.FUnitAveCost, Stock.FUnitCost,Stock.FQtyOnhand,Stock.FSellingprice2  from BOM,Stock where BOM.WLinkedStockID = Stock.WStockID'+
                    ' and BOM.WStockId =:id order by Stock.SSTOCKCODE' ;
    QBOM.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
    QBOM.open ;


  ZQStockMultigroup.Close ;
  ZQStockMultigroup.Params[0].AsInteger := 0 ;
  ZQStockMultigroup.Open ;
  cxMultiGroupGridWGROUPID.Caption := lblRep1.Caption ;
  Image1.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\stock.ico');
  ZQStockTrans.SQL.Text := SSelectFromStockTrn +  '  where  stocktrn.WStockID = -1' ;
  ZQStockTrans.Open ;
  ZQDocs.close ;
  ZQDocs.Params[0].AsInteger := 0 ;
  ZQDocs.Params[1].AsInteger := 0 ;
  ZQDocs.open ;

end;


procedure TfmStockEntry.edtPercentExit(Sender: TObject);
begin
  if (Str2Float(edtPercent.Text)>=200) then
    edtPercent.Text:=formatfloat('0.00',200);
//  if (Str2Float(edtPercent.Text)<0) then
//    edtPercent.Text:='00.00';
end;


procedure TfmStockEntry.CreateStockMovement ;
var
  tmpInt:Integer;
  ADescription : String ;
  KnownTotal : Variant ;
begin
    if not CheckStockTrans(tblStockAdWSTOCKID.AsInteger) then
      begin
       if tblStockAd.State = dsedit then
           begin
              if (tblStockAd.FindField('FQtyOnHand') <> nil) and (tblStockAd.FindField('FOPENINGQTY') <> nil) then
                  tblStockAd.FindField('FOPENINGQTY').AsFloat := tblStockAd.FindField('FQtyOnHand').AsFloat ;
           end;
        exit ;
      end;
     if (tblStockAdWSTOCKTYPEID.AsInteger in [0,2,3,9]) then
     begin
     if not InMassCheck then
     ADescription := InputBox(DMTCCoreLink.GetTextLang( 3362),DMTCCoreLink.GetTextLang( 3363),'');
     if ADescription = '' then raise Exception.Create(DMTCCoreLink.GetTextLang( 3364));
     end else
     begin
       ADescription :=  DMTCCoreLink.GetTextLang(3366) ;
     end;
     // Create Doc and Post it with DocType=16
     // Create  1 line in Doc Header
     aDMCoreDocData.ZQDocHead.sql.Text := 'select * from dochead where 1 = 0' ;
     aDMCoreDocData.ZQDocHead.Open;
     aDMCoreDocData.ZQDocHead.Append;
     aDMCoreDocData.ZQDocHeadWUserID.Value := CurrentUser;
     tmpInt:=aDMCoreDocData.ZQDocHeadWDocID.Value;
     aDMCoreDocData.ZQDocHeadWTypeID.Value :=16;
     aDMCoreDocData.ZQDocHeadDDate.Value := TransDte.Date;
     aDMCoreDocData.ZQDocHeadBPosted.Value :=1;
     aDMCoreDocData.ZQDocHeadBPrinted.AsInteger := aDMCoreDocData.ZQDocHeadBPrinted.AsInteger + 1;
     // naming is wrong but the system must know users. ince its type = 16 i gess it should be ok for now.
     // but we need to change this.
     aDMCoreDocData.ZQDocHeadWSalesmanID.Value :=CurrentUser;
     aDMCoreDocData.ZQDocHeadWUSERID.Value :=CurrentUser;
     aDMCoreDocData.ZQDocHeadSREFERENCE.AsString := copy(ADescription,1,aDMCoreDocData.ZQDocHeadSREFERENCE.Size);
     aDMCoreDocData.ZQDocHeadSDocNo.Value := TDataBaseDocumentRoutines.GetDocNextNum(16) ;
     // post to 0 account
     aDMCoreDocData.ZQDocHeadWACCOUNTID.AsInteger := 0 ;
     aDMCoreDocData.ZQDocHead.Post;
     aDMCoreDocData.ZQDocHead.Close;
     aDMCoreDocData.ZQDocLine.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectdoclineondocid') ;
     aDMCoreDocData.ZQDocLine.ParamByName('WdocId').AsInteger :=  tmpInt ;
     aDMCoreDocData.ZQDocLine.open ;
     aDMCoreDocData.ZQDocLine.Insert ;
     aDMCoreDocData.ZQDocLineWDOCID.AsInteger := tmpInt ;
     aDMCoreDocData.ZQDocLineWDOCLINEID.AsInteger := 1 ;
     aDMCoreDocData.ZQDocLineWSORTNO.AsInteger := 1 ;
     aDMCoreDocData.ZQDocLineWSTOCKID.AsInteger := tblStockAdWStockID.AsInteger ;
     aDMCoreDocData.ZQDocLineWLINETYPEID.AsInteger := 90 ;
     aDMCoreDocData.ZQDocLineWDESCRIPTIONID.AsInteger := DMTCCoreLink.GetAddDescription(ADescription,false) ;
     if VarToStr(tblStockAd.fieldbyname('FQTYONHAND').OldValue) <> '' then
        begin
         KnownTotal := DMTCCoreLink.OpenSqlReturnFirstColumn('select sum(fqty) from stocktrn where wstockid = ' + tblStockAdWStockID.AsString );
         if VarToStr(KnownTotal) <> '' then
         begin
         KnownTotal := KnownTotal + tblStockAd.fieldbyname('FOPENINGQTY').AsFloat ;
         KnownTotal := KnownTotal - (tblStockAd.fieldbyname('FQTYONHAND').AsFloat ) ;
         if (tblStockAd.fieldbyname('FQTYONHAND').OldValue - (tblStockAd.fieldbyname('FQTYONHAND').AsFloat )) <> (KnownTotal) then
          begin
          if not InMassCheck then
            OSFMessageDlg('Transact totals and current item qty do not match for '+ tblStockAdSSTOCKCODE.AsString + ' Auto adjusting!',mtInformation,[mbok],0)
            else DebugMsg := DebugMsg + 'Transact totals and current item qty do not match for '+ tblStockAdSSTOCKCODE.AsString + ' Auto adjusting!' +#13+#10 ;
          end;
           aDMCoreDocData.ZQDocLineFQTYORDERED.AsFloat := - KnownTotal ;
           aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat := aDMCoreDocData.ZQDocLineFQTYORDERED.AsFloat ;
         end;
         // tblStockAdFOPENINGQTY.AsFloat:= 0;
        end;
     if VarToStr(tblStockAd.fieldbyname('FUnitAveCost').OldValue) <> '' then
            aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat := tblStockAd.fieldbyname('FUnitAveCost').AsFloat - tblStockAd.fieldbyname('FUnitAveCost').OldValue ;
     aDMCoreDocData.ZQDocLineFQTYORDERED.AsFloat := - aDMCoreDocData.ZQDocLineFQTYORDERED.AsFloat ;
     aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat := aDMCoreDocData.ZQDocLineFQTYORDERED.AsFloat ;
     // Create Stock Transactions
     aDMCoreDocData.ZQStockTrans.SQL.Text := 'select * from stocktrn where WSTOCKTRANSACTIONID = -1 ' ;
     aDMCoreDocData.ZQStockTrans.Open;
     aDMCoreDocData.ZQStockTrans.Append;
     aDMCoreDocData.ZQStockTransWAccountID.AsInteger := 0;
     aDMCoreDocData.ZQStockTransDDate.AsDateTime := TransDte.Date;
     aDMCoreDocData.ZQStockTransWSalesmanID.AsInteger := CurrentUser;
     aDMCoreDocData.ZQStockTransWDocID.AsInteger := tmpInt;
     aDMCoreDocData.ZQStockTransWLINEID.AsInteger := 1 ;
     aDMCoreDocData.ZQStockTransWDocTypeID.AsInteger := 16;
     aDMCoreDocData.ZQStockTransWStockID.AsInteger :=  tblStockAdWSTOCKID.AsInteger;
     aDMCoreDocData.ZQStockTransFQty.AsFloat  :=   - aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ;
     aDMCoreDocData.ZQStockTransFSellingPrice.AsFloat :=  tblStockAdFUNITCOST.AsFloat ;
     aDMCoreDocData.ZQStockTransFCostPrice.AsFloat := aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat;
     aDMCoreDocData.ZQDocLine.post ;
     aDMCoreDocData.ZQDocLine.close ;
     aDMCoreDocData.ZQStockTrans.Post;
     aDMCoreDocData.ZQStockTrans.Close;
end;

procedure TfmStockEntry.TransDteExit(Sender: TObject);
Var
  BDate,EDate:Tdate;
begin
  if IsDateNotInPeriod(TransDte.Date,BDate,EDate) then
  begin
    OSFMessageDlg(GetTextLang(889){'Date is out of the current year. It must be between '} + ' '+ DateToStr(TransDte.Date) , mterror, [mbok], 0);
    TransDte.SetFocus;
  end
end;

procedure TfmStockEntry.CbxRepGroup1DropDown(Sender: TObject);
begin
  (Sender As TComboBox).Color:=ClInfoBk;
end;


Procedure TfmStockEntry.SetColIndex(S:String);
Var

  I  :Integer;
begin

    for i := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
    if   CompareText(s,Copy(cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName ,1,Length(s)))=0 then
      begin
        cxGrid1DBBandedTableView1.Columns[i].Position.BandIndex := 1 ;
        cxGrid1DBBandedTableView1.Columns[i].Position.ColIndex := 0 ;
        Break;
    end;

end;


Procedure TfmStockEntry.RunAdjust;
var
 i : Integer ;
begin
 lblMessages.Caption:= '0 of '+IntToStr(tblStockAd.RecordCount);
 pb.Position:=0;
 pb.Max :=tblStockAd.RecordCount;
 pb.Visible := true ;
 pb.BringToFront ;
 pbPanel.Repaint;

 for i := 0 to cxGrid1DBBandedTableView1.ViewData.RowCount -1 do
   if cxGrid1DBBandedTableView1.ViewData.Rows[i].Visible then

    //While Not tblStockAd.Eof do
    begin
      cxGrid1DBBandedTableView1.ViewData.Rows[i].Focused := true ;
      tblStockAd.Edit;
      tblStockAdFSellingPrice1.Value:= tblStockAdFSellingPrice1.Value * (1 + Str2Float(edtPercent.Text)/100);
      tblStockAdFSellingPrice2.Value:= tblStockAdFSellingPrice2.Value * (1 + Str2Float(edtPercent.Text)/100);
      tblStockAdFSellingPrice3.Value:= tblStockAdFSellingPrice3.Value * (1 + Str2Float(edtPercent.Text)/100);
      tblStockAd.Post;
      lblMessages.Caption:= IntToStr(tblStockAd.RecNo)+ ' '+gettextlang(3005){of}+' '+IntToStr(tblStockAd.RecordCount);
      pb.Position := tblStockAd.RecNo;
      pbPanel.Repaint;
      //tblStockAd.Next;
    end;

  lblMessages.Caption:= '';
  pb.Position := 0;
  pbPanel.Visible:=False;
end;

procedure TfmStockEntry.dbgAdStockEditKeyPress(Sender: TObject;
  var Key: Char);
  procedure MovetoNextRec;

  begin
    if cxGrid1DBBandedTableView1.Controller.FocusedRecord <> nil then
     cxGrid1DBBandedTableView1.Controller.FocusedRecord.Selected := False ;

    cxGrid1DBBandedTableView1.Controller.FocusNextRecord(cxGrid1DBBandedTableView1.Controller.FocusedRecordIndex,true,True,true,true) ;
    cxGrid1DBBandedTableView1.Controller.FocusedRecord.Selected := True ;
    if not cbEnterIsNextRecord.Checked then
    begin
    if cbUpdateType.ItemIndex in [1,4,5] then
    cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 2
    else
      cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 2
    end ;
  end;
begin
  if (PCStock.ActivePage = TSList) then
  begin
     Case Key of
    #9:begin
          MovetoNextRec;
          Key:=#0;
        end;
    #13 : begin
          if cbEnterIsNextRecord.Checked then
             begin
               MovetoNextRec;
               Key:=#0;
             end else
             begin
               if cxGrid1DBBandedTableView1.ColumnCount > (cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex+2) then
                  cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex  +1
                 else
                   MovetoNextRec;
             end ;
         end;
    end;
 end;

end;



procedure TfmStockEntry.btnToClick(Sender: TObject);
begin
  With OpenDialog2 do
  begin
    Title:=GetTextLang(1063);
    FileName:=edtFileName.Text;
    DefaultExt:='.txt';
    Filter:='Tab delimited|*.txt|Lotus SpreadSheet (*.Wk1)|*.Wk1|All files|*.*|Comma Seperated Value|*.csv' ;
    InitialDir:=ApplicationPath;
    if Execute then
    begin
      edtFileName.Text := FileName;
    end;
  end;
end;

Procedure TfmStockEntry.LoadReoprtOp;
begin
 cbSimplelayout.Checked :=ReadReportOp('SimpleRowsStock',1).AsInteger = 1 ;
 cbNoCalcFields.Checked :=ReadReportOp('NoCalcFieldsStock',1).AsInteger = 1 ;
 cbSimplelayoutClick(self);
 LimitRows.Value := ReadReportOp('LimitRowsStock',50000).AsInteger ;
 cbFileFormat.ItemIndex := ReadReportOp('StockImpFileFormat',5).AsInteger;
 CBReport.ItemIndex :=  DMTCCoreLink.ReadNwReportOp('StockSelectedReport',0) ;
 edtFileName.Text := ReadLongReportOp('SStockAdjLotusFile') ;
 PnlAdjust.Visible := ReadReportOp('StockExportMode',False).AsBoolean;
 PSearch.Height :=  ReadReportOp('StockSearchHight',PSearch.Height).Asinteger;
 if PSearch.Height < 10 then
    PSearch.Height := 10 ;
  BAdvancedClick(nil);
end;


Procedure TfmStockEntry.SaveReoprtOp;
begin
  WriteReportOp('LimitRowsStock',IntToStr(LimitRows.Value));

  if cbNoCalcFields.checked then

     WriteReportOp('NoCalcFieldsStock',IntToStr(1)) else
     WriteReportOp('NoCalcFieldsStock',IntToStr(0)) ;


  if cbSimplelayout.checked then

     WriteReportOp('SimpleRowsStock',IntToStr(1)) else
     WriteReportOp('SimpleRowsStock',IntToStr(0)) ;



  DMTCCoreLink.WriteNwReportOp('STOCKUPDTYPE',IntToStr(cbUpdateType.ItemIndex)) ;
  WriteReportOp('StockSelectedReport',IntToStr(CBReport.ItemIndex));
  WriteReportOp('StockImpFileFormat',IntToStr(cbFileFormat.ItemIndex));
  WriteLongReportOp('SStockAdjLotusFile',edtFileName.Text);
  WriteReportOp('StockExportMode',Bool2Str(PnlAdjust.Visible));
  WriteReportOp('StockSearchHight',IntToStr(PSearch.Height));
  WriteSysParam('STOCKGODETAIL',BoolToStr(cbAutoDetailononerecord.Checked ,True),CurrentUser);
end;

procedure TfmStockEntry.SPChangeCodeClick(Sender: TObject);
begin
 if OSFMessageDlg(gettextlang(2120)+ #13 + gettextlang(2121),mtConfirmation,[mbyes,mbno],0) <> mryes then
  exit ;
 if trim(edtStockCode.Text) <> '' then
    ENewStockCode.MaxLength := edtStockCode.MaxLength ;
 ENewStockCode.text  := trim(edtStockCode.Text) ;
 PChangeCode.Visible := true ;
 ENewStockCode.SetFocus ;
end;

procedure TfmStockEntry.edtSellingPrice1IncExit(Sender: TObject);
var
 TestString : String ;
 i: Integer ;
begin
 if not edtSellingPrice1Inc.Modified then exit ;
 edtSellingPrice1Inc.Modified := false ;
 TestString := edtSellingPrice1Inc.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice1.Text := formatfloat('##0.00######', StrToFloat(TestString) /  TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice1.Text := formatfloat('##0.00',0);
   edtSellingPrice1Inc.Text := TestString ;
end;

procedure TfmStockEntry.edtSellingPrice1Exit(Sender: TObject);
var
 TestString : String ;
 i : Integer ;
begin
 if not edtSellingPrice1.Modified then exit ;
 edtSellingPrice1.Modified := false ;
 edtSellingPrice1Inc.Modified := false ;
 TestString := edtSellingPrice1.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice1Inc.Text := formatfloat(dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty), StrToFloat(TestString) *  TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice1Inc.Text := formatfloat('##0.00',0);
    edtSellingPrice1.Text := TestString ;
end;

procedure TfmStockEntry.edtSellingPrice2IncExit(Sender: TObject);
var
 TestString: String;
 i: Integer;
begin
 // detactch and make the exc leading
 if not edtSellingPrice2Inc.Modified then exit ;
 edtSellingPrice2Inc.Modified := false ;
 TestString := edtSellingPrice2Inc.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice2.Text := formatfloat('##0.00######', StrToFloat(TestString) / TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice2.Text := formatfloat('##0.00',0);
   edtSellingPrice2Inc.Text := TestString ;
end;

procedure TfmStockEntry.edtSellingPrice2Exit(Sender: TObject);
var
 TestString : String ;
 i : Integer ;
begin
 if not edtSellingPrice2.Modified then exit ;
 edtSellingPrice2.Modified := false ;
 edtSellingPrice2Inc.Modified := false ;
 TestString := edtSellingPrice2.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice2Inc.Text := formatfloat(dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty), StrToFloat(TestString) * TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice2Inc.Text := formatfloat('##0.00',0);
   edtSellingPrice2.Text := TestString ;
end;

procedure TfmStockEntry.edtSellingPrice3IncExit(Sender: TObject);
var
 TestString: String ;
 i: Integer;
begin

 if not edtSellingPrice3Inc.Modified then exit ;
 edtSellingPrice3Inc.Modified := false ;
 TestString := edtSellingPrice3Inc.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice3.Text := formatfloat('##0.00######', StrToFloat(TestString) / TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice3.Text := formatfloat('##0.00',0);
   edtSellingPrice3Inc.Text := TestString ;
end;

procedure TfmStockEntry.edtSellingPrice3Exit(Sender: TObject);
var
 TestString : String ;
 i : Integer ;
begin
 if not edtSellingPrice3.Modified then exit ;
 edtSellingPrice3.Modified := false ;
 edtSellingPrice3Inc.Modified := false ;
 TestString := edtSellingPrice3.Text ;
 for i := Length(TestString) downto 1 do
   begin
      if not (TestString[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator]) then
         Delete(TestString,i,1);
   end;
  if TestString <> '' then
    begin
      edtSellingPrice3Inc.Text := formatfloat(dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty), StrToFloat(TestString) * TDataBaseRoutines.GetTaxRateOnId(edtOutput.tag)) ;
    end else
    edtSellingPrice3Inc.Text := formatfloat('##0.00',0);
    edtSellingPrice3.Text := TestString ;
end;

procedure TfmStockEntry.CBStockTypeChange(Sender: TObject);
begin
 ZQDefoptions.close ;
 ZQStockoptions.close ;
 TSOptions.TabVisible := (CBStockType.ItemIndex in [7,8]);
 tsLinksale.TabVisible := (CBStockType.ItemIndex in [10]);
 if tsLinksale.TabVisible then
    begin
      ZQLinkSale.Params[0].AsInteger :=  tblStockAdWSTOCKID.AsInteger;
      ZQLinkSale.open ;

       ZQLinkmaingroup.Close ;
       ZQLinkmaingroup.Open ;
       ZQLinksubGroup.open ;
    end;

 if TSOptions.TabVisible then
    begin
      ZQDefoptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
      ZQDefoptions.open ;
      ZQOptions.open ;
      ZQStockoptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
      ZQStockoptions.open ;
      BGenOptions.Visible := CBStockType.ItemIndex <>8 ;
       cxGrid4.Visible := CBStockType.ItemIndex <>8 ;
      BRemoveOptions.Visible := CBStockType.ItemIndex <>8;
      cBViewAsTree.Visible := CBStockType.ItemIndex <>8 ;
    end;
 PBom.Visible := (CBStockType.ItemIndex in [1,9]) ;
 tsBom.TabVisible := PBom.Visible  ;

 QBOM.close ;
 QBOM.SQL.Text := 'Select BOM.*,Stock.SSTOCKCODE,Stock.SDescription,Stock.FUnitAveCost, Stock.FUnitCost,Stock.FQtyOnhand,Stock.FSellingprice2  from BOM,Stock where BOM.WLinkedStockID = Stock.WStockID'+
                 ' and BOM.WStockId =:id order by Stock.SSTOCKCODE' ;
 QBOM.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
 QBOM.open ;
 QBOM.IndexFieldNames := 'SSTOCKCODE';
 if PBom.Visible then
 begin
   CalcBomCostPrice ;
 end;
  edtSales.Enabled := true ;
  Label9.Enabled := true ;
  Label7.Enabled := true ;
  edtOutput.Enabled := true ;
  Label11.Enabled := true ;
  edtStockControl.Enabled := true ;
  Label10.Enabled := true ;
  edtCOS.Enabled := DMTCCoreLink.ReadSysVar('BCreateCostOfSales')  = '1' ;
  Label7.Enabled := true ;
  edtOutput.Enabled := true ;
  Label8.Enabled := true ;
  edtReorder.Enabled := true ;
  LLatestCost.Enabled := true ;
  edtLatestCost.Enabled := true ;
  Label6.Enabled := true ;
  edtInput.Enabled := true ;
  BBInput.Enabled := true ;
  BBOutput.Enabled := true ;
  BBSales.Enabled := true ;
  BBCOS.Enabled := edtCOS.Enabled ;
  BBStockControl.Enabled := true ;
  gbSellingprices.Visible := true ;
 Case  CBStockType.ItemIndex of
 1,2,4 :  begin
          Label11.Enabled := false ;
          edtStockControl.Enabled := false ;
          BBStockControl.Enabled := false ;
          Label10.Enabled := false ;
          edtCOS.Enabled := false ;
          BBCOS.Enabled := false ;
          Label6.Enabled := false ;
          edtInput.Enabled := false ;
          BBInput.Enabled := false ;
        end;
    3,5  : Begin
            gbSellingprices.Visible := false ;
            edtSales.Enabled := false ;
            Label9.Enabled := false ;
            Label7.Enabled := false ;
            edtOutput.Enabled := false ;
            BBOutput.Enabled := false ;
            BBSales.Enabled := false ;
        end;
    6 : Begin
            edtSales.Enabled := false ;
            Label9.Enabled := false ;
            Label7.Enabled := false ;
            edtCOS.Enabled := false ;
            BBSales.Enabled := false ;
            BBCOS.Enabled := false ;
            BBStockControl.Enabled := false ;
        end;
     end ;// end case
end;

procedure TfmStockEntry.Button1Click(Sender: TObject);
begin


   CallLookup('',18,0,' (WStockTypeid <> 4) and (WStockTypeid <> 5) and (WStockTypeid <> 6) and (WStockTypeid <> 7) and (WStockTypeid <> 8)');
   //dmDatabase.tblStock.open ;
   if  TDataBaseStockRoutines.GetStockID(ReturnLookup) <> 0 then
    begin
       QBOM.DisableControls ;
       try
       QBOM.Insert ;
       // todo : Insert BOm id
       QBOM.FieldByName('WLinkedStockID').AsInteger :=  TDataBaseStockRoutines.GetStockID(ReturnLookup);
       QBOM.FieldByName('WStockId').AsInteger :=  tblStockAdWSTOCKID.AsInteger ;
       QBOM.FieldByName('FQty').AsInteger := 1  ;
       QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat := 1 ;
       QBOM.FieldByName('FUNITAVECOST').AsFloat := TDataBaseStockRoutines.getAvgStockCost(QBOM.FieldByName('WLinkedStockID').AsInteger) ;
       QBOM.post ;
       finally
         QBOM.EnableControls ;
       end;
    end;

end;

procedure TfmStockEntry.Button2Click(Sender: TObject);
begin
 if not QBOM.isempty then
    QBOM.Delete ;
 // CBStockTypeChange(self);
 BRecalcpercentClick(self);

end;

procedure TfmStockEntry.FormCreate(Sender: TObject);
Type
 MyFieldClass = class of TField ;
var
 i : Integer ;
 astrings : TStringList ;
 AField : TField ;
 AfieldClass : MyFieldClass ;


 p : String ;
 AItem: TcxCustomGridTableItem;
begin
 aOptFreeFields := TEditPanel.Create(self) ;
 aOptFreeFields.Parent := poptfreefields ;
 aOptFreeFields.Align := alClient ;
 aOptFreeFields.SetEditType('STOCKOPTIONS','');
    // TDatabaseTableRoutines.
 poptfreefields.Visible := aOptFreeFields.EditFormCollection.Count <> 0 ;
 cxSplitter1.Visible :=  poptfreefields.Visible  ;
 


  try
  p := ClassIDToProgID(sysutils.StringToGUID('{0EED7206-1661-11D7-84A3-00606744831D}')) ;
  except
   p := '' ;
  end;
  UseHtmlkEditor :=  p <> '' ;


{ DMTCCoreLink.LoadImage(BNew.Glyph,'nbsinsert');
 DMTCCoreLink.LoadImage(BDelete.Glyph,'nbsdelete');
 DMTCCoreLink.LoadImage(BEdit.Glyph,'nbsedit');
 DMTCCoreLink.LoadImage(BSave.Glyph,'nbssave');
 DMTCCoreLink.LoadImage(BCancel.Glyph,'nbscancel');  }

 DMTCCoreLink.LoadImage(BReport.Glyph,'Printer');
 if UseHtmlkEditor then
  begin
  MEditLang := TosFMemo.create(self) ;
  MEditLang.Parent := PEditOneLang ;
  MEditLang.Top := LLangText2.top + 25 ;
  MEditLang.Left := DBEdit2.Left ;
  MEditLang.Width := DBEdit2.Width ;
  MEditLang.Height  := PEditOneLang.Height -(LLangText2.top + 25)  ;
  MEditLang.OnEnter := MEditLangEnter;
  MEditLang.Anchors := [akLeft,akTop,akRight,akBottom];
   end;
  APanelTreeView := TPanelTreeView.create(Self,TPanelTreeViewItem) ;
  AStockLinksList := TStringList.create ;
  AGroupColorList := TStringList.Create ;
  AGroupTextColorList := TStringList.Create ;
  APluginList := TStringlist.create ;
  APluginsFormsList := TStringlist.create ;
  ZQlookup.Close ;
  ZQlookup.Open ;
  tstranslations.TabVisible := not ZQlookup.IsEmpty ;
  i := 0 ;
  Blangfreefields.Visible := false ;
    while not ZQlookup.Eof do
      begin
        SetLength(AFreeformArray,i+1);
        AFreeformArray[i] := TEditPanel.Create(self) ;
        AFreeformArray[i].Parent := PTranslations ;
        if  DMTCCoreLink.ReadNwReportOp('ONEFREEFIELDFORSTK',false) then
        AFreeformArray[i].SetEditType('STOCKLANGS','',False)
        else
        AFreeformArray[i].SetEditType('STOCKLANGS'+ZQlookup.Fields[0].AsString,'',False)  ;
        AFreeformArray[i].ScaleBy(screen.PixelsPerInch,96);
        AFreeformArray[i].Align := alClient ;
        AFreeformArray[i].Visible:= false ;
        Blangfreefields.Visible := Blangfreefields.Visible or (AFreeformArray[i].EditFormCollection.Count <> 0) ;
        inc(i);
        ZQlookup.next ;
      end;



  ARemeberAccountList := TOSFLedgerCalculationClass.create(self,TOSFLedgerItem) ;
  aDMCoreDocData := TDMCoreDocData.create(self) ;
    aSearchPanel := TSearchPanel.Create(self) ;
    aSearchPanel.Parent := PSearch;
    aSearchPanel.Align := alclient ;
    aSearchPanel.onSearch := SearchClick ;
    aSearchPanel.SetLookupType(DMTCCoreLink.ReadSysParam('STOCKLOOKUP','STOCKENTRY',CurrentUser));
    aSearchPanel.ScaleBy(screen.PixelsPerInch,96);
  LoadReports ;
  PCAdvanced.ActivePageIndex := 0 ;
  // load plugin;
  LoadPluginsStock ;
  edtStockCode.MaxLength := DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE') ;
  edtDescription.MaxLength := DMTCCoreLink.GetFieldLength('STOCK','SDescription') ;
  TSOptions.TabVisible := false ;
  tsBom.TabVisible := false ;
  cbAutoDetailononerecord.Checked := DMTCCoreLink.ReadSysParam('STOCKGODETAIL',BoolToStr(cbAutoDetailononerecord.Checked ,True),CurrentUser);
 if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','smallicons','')) = 'TRUE' then
    begin
       PEditButtons.Width := 110 ;
       BNew.Width := 70 ;
       BDelete.Width := 70 ;
       BEdit.Width := 70 ;
       BSave.Width := 70 ;
       BCancel.Width := 70 ;
       BCopy.Width := 70 ;
       BAdvanced.Width := 70 ;
       CBReport.Width := 70 ;
       BReport.Width := 70 ;
       cbBarcode.Width := 70 ;
    end;
   MyBackord := TfmBackOrdersOutstanding.Create(self) ;
   MyBackord.Parent := tsBackorder ;
   
   MyBackord.ButtonPanel.Parent := MyBackord.tsDetail ;
   MyBackord.ButtonPanel.Align := altop ;
   MyBackord.Label1.Top := MyBackord.Label2.Top ;
   MyBackord.DBEdit1.Top := MyBackord.DBEdit2.Top ;
   MyBackord.BitBtn1.Top := MyBackord.BitBtn2.Top ;
   MyBackord.PageControl1.ActivePage := MyBackord.tslist ;
   MyBackord.StatusBar1.Visible := false ;
   MyBackord.BorderStyle := bsNone ;
   MyBackord.FormMode := 1 ;
   MyBackord.Show ;
   MyBackord.Align := alClient ;
   MyBackord.ZQBackorder.SQL.Text := 'Select * from backord where WStockid =:WStockid' ;
   MyBackord.ZQBackorder.CachedUpdates := true ;
   ACalculatedFields := TStringList.create  ;
   if DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCK_CALCFIELDS') <> '' then
      begin


          ACalculatedFields.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCK_CALCFIELDS') ;
          i := 0 ;
          while ACalculatedFields.Values['FIELDNAME'+IntToStr(i)] <> '' do
            begin
              // see valide sql
              Try
               DMTCCoreLink.ExecSql(TDatabaseTableRoutines.ReplaceParams(ACalculatedFields.Values['FIELDSQL'+IntToStr(i)],'WSTOCKID=0'));
              Except
                inc(i);
                continue ;
              end;

              AfieldClass := TFieldClass(FindClass(ACalculatedFields.Values['FIELDTYPE'+IntToStr(i)]))  ;
              if AfieldClass = nil then
                 begin
                   inc(i);
                   continue ;
                 end;



              AField := AfieldClass.Create(tblStockAd);
              AField.Name := 'AUTOFIELD'+IntToStr(i) ;
              AField.FieldName :=   'AUTOFIELD'+IntToStr(i) ;
              AField.DisplayLabel := ACalculatedFields.Values['FIELDNAME'+IntToStr(i)]  ;
              AField.FieldKind := fkCalculated ;
              AField.Tag := 101 ;
              //AField.ReadOnly := true ;
              if ACalculatedFields.Values['FIELDSIZE'+IntToStr(i)] <> '' then
                 AField.Size := StrToIntDef(ACalculatedFields.Values['FIELDSIZE'+IntToStr(i)],0);
              AField.ProviderFlags := [];
              AField.DataSet := tblStockAd;
              cxGrid1DBBandedTableView1.DataController.GridView.BeginUpdate;
              cxGrid1DBBandedTableView1.DataController.BeginUpdateFields;
              try
                 AItem := cxGrid1DBBandedTableView1.DataController.GridView.CreateItem;
                 AItem.Name :=  'CXAUTOFIELD'+IntToStr(i) ;
                  TcxGridDBBandedColumn(AItem).Position.BandIndex := 2 ;
                        TcxGridDBBandedColumn(AItem).DataBinding.FieldName := 'AUTOFIELD'+IntToStr(i);
                         if ACalculatedFields.Values['FIELDCONTROL'+IntToStr(i)] = 'CheckBox' then
                         TcxGridDBBandedColumn(AItem).RepositoryItem := dmQuantumGridDefs.osfDBCheckbox  ;

              finally
                cxGrid1DBBandedTableView1.DataController.EndUpdateFields;
                cxGrid1DBBandedTableView1.DataController.GridView.EndUpdate;
              end;
            inc(i);
            end;
     end;


  for i := 0 to Componentcount - 1 do
   if Components[i] is TDBNavigator then
      ChangeDBNavigatorIcons(Components[i] as TDBNavigator);
  ZQStockTransFCOSTPRICE.DisplayFormat := GetViewMask(0) ;
  ZQStockTransFSELLINGPRICE.DisplayFormat := GetViewMask(0) ;
   cxGrid1DBBandedTableView1.Bands[0].Caption := DMTCCoreLink.GetTextLangNoAmp(1334) ;
   cxGrid1DBBandedTableView1.Bands[1].Caption := DMTCCoreLink.GetTextLangNoAmp(1296) ;
   cxGrid1DBBandedTableView1.Bands[2].Caption := DMTCCoreLink.GetTextLangNoAmp(1336) ;
   cbSimplelayout.Caption := DMTCCoreLink.GetTextLangNoAmp(3032)

end;

procedure TfmStockEntry.LoadReports;
Var
 ASearchRec : TSearchRec ;
 NumText : String  ;
begin
  CBReport.clear ;
    if FindFirst(DMTCCoreLink.GetLocalPluginDir + 'reports\REPORTS\STOCK\*.rep', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        if pos('LANG_',ASearchRec.name) = 1 then
          begin
            NumText := copy(ChangeFileExt(ASearchRec.name,''),6,20);
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


procedure TfmStockEntry.BBInputClick(Sender: TObject);
begin
 FmLookup.IsShowForm := false ;
//  if PnlAdjust.Visible then exit;
  edtInput.Color := clHighlight;
  CallLookup('', 6  , edtInput.Tag , ' and BInActive = 0 and (showtype is null or showtype in (0,2))');
   If ReturnLookup = 'ESC' then
     begin
     edtInput.Color := clWindow;

     exit ;
     end;

  edtInput.Tag := ReturnID ;
  edtInput.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
  edtInput.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockEntry.BBOutputClick(Sender: TObject);
begin
 FmLookup.IsShowForm := false ;
//  if PnlAdjust.Visible then exit;
  edtOutput.Color := clHighlight;

  if sender <> nil then
  begin
  CallLookup('', 6  , edtOutput.Tag , ' and BInActive = 0 and (showtype is null or showtype in (0,1))');
   If ReturnLookup = 'ESC' then
     begin
     edtOutput.Color := clWindow;

     exit ;
     end;
  edtOutput.Tag := ReturnID ;
  end;
  edtOutput.Color := clWindow;
  edtOutput.Text := TDataBaseRoutines.GetAccountFullDescription(edtOutput.Tag);
  if sender <> nil then
  SelectNext(Screen.ActiveControl, True, True);

  edtSellingPrice1.Modified := true ;
  edtSellingPrice2.Modified := true ;
  edtSellingPrice3.Modified := true ;
  edtSellingPrice1Exit(edtSellingPrice1);
  edtSellingPrice2Exit(edtSellingPrice2);
  edtSellingPrice3Exit(edtSellingPrice3);
end;

procedure TfmStockEntry.BBSalesClick(Sender: TObject);
var
  IncExp,
  HasSub : Boolean;
  OldText : String ;
begin



 FmLookup.IsShowForm := false ;
 // if PnlAdjust.Visible then exit;
  edtSales.Color := clHighlight;
  IncExp := False;
  HasSub := True;

  while (not IncExp) or (HasSub)  do
  begin
     CallLookup(edtSales.Text, 2);
    If ReturnLookup = 'ESC' then
     begin
     edtSales.Color := clWindow;

     exit ;
     end;
    edtSales.Tag := ReturnID ;
    edtSales.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
    IncExp := TDataBaseRoutines.IsIncomeExpense(ReturnID) or (CBStockType.ItemIndex in  [2,4,6]);
    HasSub :=  TDataBaseRoutines.IsSubAccount(ReturnID) ;
    // done : Pieter this closes the lookup for accounts
    // dmDatabase.tblAccount.Close;
    begin
    if not IncExp then OSFMessageDlg(GetTextLang(492), mterror, [mbok], 0);
    if HasSub then OSFMessageDlg(GetTextLang(493), mterror, [mbok], 0);
    end ;
  end;
  edtSales.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockEntry.BBCOSClick(Sender: TObject);
var
  HasSub : Boolean;
begin
 FmLookup.IsShowForm := false ;
 edtCOS.Font.Color := clWindowText ;
 // if  PnlAdjust.Visible Then exit;
  edtCOS.Color := clHighlight;
  HasSub := True;

  while HasSub do
  begin
     CallLookup(edtCOS.Text, 2);
     If ReturnLookup = 'ESC' then
     begin
     edtCOS.Color := clWindow;

     exit ;
     end;
    edtCOS.Tag := ReturnID ;
    edtCOS.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Locate('WACCOUNTID',ReturnID, []);
    HasSub := dmDatabase.tblAccountBSubAccounts.Value=1;
    // done : Pieter this closes the lookup for accounts 
    // dmDatabase.tblAccount.Close;
    if HasSub then OSFMessageDlg(GetTextLang(493), mterror, [mbok], 0);
  end;
  edtCOS.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockEntry.BBStockControlClick(Sender: TObject);
var
  HasSub : Boolean;
begin
 FmLookup.IsShowForm := false ;
 // if PnlAdjust.Visible then exit;
  edtStockControl.Color := clHighlight;
  HasSub := True;
  while HasSub do
  begin
    CallLookup(edtStockControl.Text, 2);
     If ReturnLookup = 'ESC' then
     begin
     edtStockControl.Color := clWindow;
     exit ;
     end;

    edtStockControl.Tag := ReturnID ;
    edtStockControl.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Locate('WACCOUNTID', ReturnID , []);
    HasSub := dmDatabase.tblAccountBSubAccounts.Value=1;
    // done : Pieter this closes the lookup for accounts
    // dmDatabase.tblAccount.Close;
    if HasSub then OSFMessageDlg(GetTextLang(493), mterror, [mbok], 0);
  end;
  edtStockControl.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockEntry.PChangeCodeExit(Sender: TObject);
begin
 PChangeCode.Visible := false ;
end;

procedure TfmStockEntry.BitBtn1Click(Sender: TObject);
begin
  // See if stockcode exist.
   if not(TDataBaseStockRoutines.GetStockID(UPPERCASE(ENewStockCode.Text)) in [tblStockAdWSTOCKID.AsInteger,0]) then
      begin
        OSFMessageDlg(DMTCCoreLink.GetTextLang(3086){'Code exists!'},mtError,[mbok],0) ;
        ENewStockCode.SetFocus ;
        ABORT ;
        end;
  edtStockCode.Text :=  trim(UPPERCASE(ENewStockCode.Text)) ;
  PChangeCode.Visible := false ;
end;

procedure TfmStockEntry.Active1Click(Sender: TObject);
var
 i : Integer ;
begin
   for i := 0 to cxGrid4DBTableView1.Controller.SelectedRowCount -1  do
    begin
        cxGrid4DBTableView1.Controller.SelectedRows[i].Focused := True ;
        ZQStockoptions.Edit ;
        ZQStockoptionsBENABLED.AsInteger := 1 ;
        ZQStockoptions.Post ;

    end;

end;

procedure TfmStockEntry.AdvancedPanelExit(Sender: TObject);
begin
  if tblStockAd.State = dsedit then
     tblStockAd.Post;
end;

procedure TfmStockEntry.BSuppLier1Click(Sender: TObject);

begin
  ESupp1.Color := clHighlight;
  if CallLookup(TDataBaseRoutines.GetAccountCode(ESupp1.Tag),4,0,' or WAccountid = 0 ' ) <> '' then
  begin
    If ReturnLookup = 'ESC' then
     begin
      ESupp1.Color := clWindow;
      //    ESupp1.Text := '';
      //   ESupp1.Tag := 0 ;
      exit ;
     end;

  ESupp1.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
  ESupp1.Tag := ReturnID ;
  end;

  ESupp1.Color := clWindow;

  SelectNext(Screen.ActiveControl, True, True);
end;


procedure TfmStockEntry.BSuppLier2Click(Sender: TObject);
begin
  ESupp2.Color := clHighlight;
  if CallLookup(TDataBaseRoutines.GetAccountCode(ESupp2.Tag),4,0,' or WAccountid = 0 ' )  <> '' then
  begin
   If ReturnLookup = 'ESC' then
     begin
       ESupp2.Color := clWindow;
     //  ESupp2.Text := '';
     //  ESupp2.Tag := 0 ;
       exit ;
     end;

  ESupp2.Text := TDataBaseRoutines.GetAccountFullDescription(ReturnID);
  ESupp2.Tag := ReturnID ;
  end;
  ESupp2.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmStockEntry.RefreshData;
begin
 if PCStock.ActivePage = TSList then
    SearchClick(self);
end;

procedure TfmStockEntry.tblStockAdAfterInsert(DataSet: TDataSet);
begin
  DataSet.fieldbyname('WStockID').Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKID);
  SetButtons ;
end;

procedure TfmStockEntry.tblStockAdCalcFields(DataSet: TDataSet);
var
i : Integer ;
Avalue : Variant ;
begin

tblStockAdSInputTax.AsString := TDataBaseRoutines.AddDashInAccCode(GetAccountCode(tblStockAdWINPUTTAXID.AsInteger));
tblStockAdSOutPutTax.AsString := TDataBaseRoutines.AddDashInAccCode(GetAccountCode(tblStockAdWOUTPUTTAXID.AsInteger));
tblStockAdSCostAccount.AsString := TDataBaseRoutines.AddDashInAccCode(GetAccountCode(tblStockAdWCOSTACCOUNTID.AsInteger));
tblStockAdSSaleSACCOUNT.AsString := TDataBaseRoutines.AddDashInAccCode(GetAccountCode(tblStockAdWSALESACCOUNTID.AsInteger));
tblStockAdSStockAccount.AsString := TDataBaseRoutines.AddDashInAccCode(GetAccountCode(tblStockAdWSTOCKACCOUNTID.AsInteger));

tblStockAdSWSUPPLIER1ID.AsString :=  GetAccountCode(tblStockAdWSUPPLIER1ID.AsInteger);
tblStockAdSWSUPPLIER2ID.AsString :=  GetAccountCode(tblStockAdWSUPPLIER2ID.AsInteger);

i := 0 ;
if cbNoCalcFields.Checked then exit ;

 while ACalculatedFields.Values['FIELDNAME'+IntToStr(i)] <> '' do
      begin
      if tblStockAd.FindField('AUTOFIELD'+IntToStr(i)) <> nil then
        begin
         Avalue := TDatabaseTableRoutines.OpenSqlReturnAsVarOrString(TDatabaseTableRoutines.ReplaceParams(ACalculatedFields.Values['FIELDSQL'+IntToStr(i)],'WSTOCKID=' + IntToStr(tblStockAdWSTOCKID.AsInteger) ));
         tblStockAd.FieldByName('AUTOFIELD'+IntToStr(i)).Value := Avalue ;
        end;
        inc(i);
      end;


end;

procedure TfmStockEntry.tblStockAdBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from stock where WStockid is null');
end;

procedure TfmStockEntry.QBOMAfterInsert(DataSet: TDataSet);
begin

 QBOMWBOMID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_BOMID') ;
end;

procedure TfmStockEntry.QBOMAfterDelete(DataSet: TDataSet);
begin
if not QBOM.ControlsDisabled then
 CalcBomCostPrice ;
end;

procedure TfmStockEntry.SearchClick(Sender: TObject);
var
 AClause : String ;
 var LastId : Integer ;
begin
 LastId := tblStockAdWSTOCKID.AsInteger ;
 AClause := aSearchPanel.GetClause  ;
 if aSearchPanel.DefSql <> '' then
 tblStockAd.SQL.Text := StringReplace(LowerCase( aSearchPanel.DefSql),'select ','Select first '+IntToStr(LimitRows.Value)+' ',[])
 else
 tblStockAd.SQL.Text :=  'Select first '+IntToStr(LimitRows.Value)+' * from stock' ;

 if AClause <> '' then
   tblStockAd.SQL.add('where ' + AClause );
 tblStockAd.open ;
 tblStockAd.Locate('WSTOCKID',LastId,[]);

 SetButtons ;
 aSearchPanel.SaveCollection ;
 if PSearch.Width < 5 then
    PSearch.Width := 5 ;

if cbAutoDetailononerecord.Checked then
  begin
    if tblStockAd.RecordCount = 1 then
      BEditClick(self);
  end else
  begin
    if not tblStockAd.IsEmpty then
        if cxGrid1.CanFocus then
           cxGrid1.SetFocus ;
   end;
end;

procedure TfmStockEntry.CheckBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then
    begin
      if TCheckBox(Sender).State = cbUnchecked then
       TCheckBox(Sender).State := cbChecked else
       if TCheckBox(Sender).State = cbChecked then
       TCheckBox(Sender).State := cbGrayed else
       TCheckBox(Sender).State := cbUnchecked ;
       abort ;
    end;
end;

procedure TfmStockEntry.BEditClick(Sender: TObject);
begin
 if tblStockAd.IsEmpty then exit ;

 LoadStockToGui ;
 Application.ProcessMessages ;
 SetButtons ;
end;

procedure TfmStockEntry.BCancelClick(Sender: TObject);
begin
 tblStockAd.Cancel ;
  if ZQDescriptions.UpdatesPending then
     ZQDescriptions.CancelUpdates ;
  if ZQStockMultigroup.UpdatesPending then
     ZQStockMultigroup.CancelUpdates ;

  if ZQStockTrans.UpdatesPending then
     ZQStockTrans.CancelUpdates ;

  if QBOM.UpdatesPending then
     QBOM.CancelUpdates ;

 PCStock.ActivePage := TSList ;




 SetButtons ;
 SendMessageToPlugin('CANCEL=' + tblStockAdWSTOCKID.AsString);
  aSearchPanel.SetLastFocus ;
end;

procedure TfmStockEntry.BNewClick(Sender: TObject);
var
 LastDesc,OldLang,i : Integer ;
 ANextStockid : String ;
begin
  LastDesc := 0 ;
  if ZQDescriptions.Active then
     LastDesc := ZQDescriptionsWLANGUAGEID.AsInteger ;

 edtStockCode.ReadOnly := False ;
 ClearScreen ;
 tblStockAd.Insert ;
  ZQLinkSale.Close ;
  ZQLinkSale.Params[0].AsInteger :=  tblStockAdWSTOCKID.AsInteger;
  ZQLinkSale.open ;
   
   ZQDescriptions.Close ;
  ZQDescriptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
  ZQDescriptions.DisableControls ;
  try
    ZQDescriptions.Open ;

    ZQlookup.First ; 
    if ZQlookup.IsEmpty then
      begin
        tstranslations.TabVisible := false ;
        PTranslations.Visible := False ;
      end else
      begin
         tstranslations.TabVisible := tstranslations.ControlCount = 1 ;
         PTranslations.Visible := True ;
         OldLang := cbCurLang.itemIndex ;
         cbCurLang.clear ;
          i := 0 ;
          while not ZQlookup.Eof do
             begin
               AFreeformArray[i].EditFormCollection.Load();
               inc(i);
               cbCurLang.Items.AddObject(ZQlookup.Fields[1].AsString,Tobject(ZQlookup.Fields[0].AsInteger)) ;
               if not ZQDescriptions.Locate('WLANGUAGEID',ZQlookup.Fields[0].AsInteger,[]) then
                   begin
                     ZQDescriptions.Insert ;
                     ZQDescriptionsWSTOCKID.AsInteger := 0 ;
                     ZQDescriptionsWLANGUAGEID.AsInteger := ZQlookup.Fields[0].AsInteger ;
                     ZQDescriptionsSDESCRIPTION.AsString := '' ;
                     ZQDescriptions.Post ;
                   end;
               ZQlookup.next ;
             end;
          ZQDescriptions.Locate('WLANGUAGEID',LastDesc,[]) ;
          if OldLang =-1 then
             cbCurLang.ItemIndex := cbCurLang.items.IndexOfObject(TObject(ZQDescriptionsWLANGUAGEID.AsInteger))
             else
             begin
                cbCurLang.ItemIndex := OldLang ;
                cbCurLangChange(self);

             end;

       end;
  finally
    ZQDescriptions.EnableControls ;
  end;
  ANextStockid := TDataBaseDocumentRoutines.GetAnnyNextNum('STK_NEXTNUM',1,'') ;
  if ANextStockid <> '' then
     edtStockCode.Text := ANextStockid ;

 PCStock.ActivePage := TSDetail ;
 SetButtons ;
 SendMessageToPlugin('NEW=' + IntToStr(0))

end;

procedure TfmStockEntry.SetButtons ;
begin
  //
  BNew.Enabled :=  PCStock.ActivePage = TSList ;
  BDelete.Enabled := (not tblStockAd.IsEmpty ) and (PCStock.ActivePage = TSList)  ;
  BEdit.Enabled := (not tblStockAd.IsEmpty and (tblStockAd.State = dsbrowse)) and (PCStock.ActivePage = TSList)  ;
  BSave.Enabled := (tblStockAd.State <> dsbrowse) or ( PCStock.ActivePage = TSDetail) ;
  BCancel.Enabled := (tblStockAd.State <> dsbrowse) or ( PCStock.ActivePage = TSDetail) ;
  BCopy.Enabled := (not tblStockAd.IsEmpty and (tblStockAd.State = dsbrowse)) and (PCStock.ActivePage = TSList)  ;
  BAdvanced.Enabled  :=  PCStock.ActivePage = TSList ;
   // Qty on Hand
   DisableCtrl(EdtQtyOnHand);
   // Total Cost
   DisableCtrl(EdtTotalCost);
   // Ave Cost
   DisableCtrl(EdtAveCost);

  if (tblStockAd.State = dsInsert) or ZQDocs.IsEmpty or PnlAdjust.Visible then
   Begin
      // Qty on Hand
      EnableCtrl(EdtQtyOnHand);
      // Total Cost
      EnableCtrl(EdtTotalCost);
      // Ave Cost
      EnableCtrl(EdtAveCost);
    end ;
end;

procedure TfmStockEntry.BSaveClick(Sender: TObject);
var
 AReturnString : String ;
 i : Integer ;
 Total :Double ;
 CostPrice,LastPrice : Double ;
begin



 CostPrice := 0 ;
 LastPrice := 0 ;
 if (tblStockAd.State in [dsinsert]) then
    TDataBaseDocumentRoutines.GetAnnyNextNum('STK_NEXTNUM',3,'')  ;


 if PCStock.ActivePage = TSList then
   begin

     if tblStockAd.State in [dsedit,dsinsert] then
        tblStockAd.post ;
     exit ;
   end else
   if not (tblStockAd.State in [dsedit,dsinsert]) then
     begin
    //  if (tblStockAdSSTOCKCODE.AsString = '') or (tblStockAdSSTOCKCODE.AsString = edtStockCode.Text ) then
          tblStockAd.Edit ;
     end;

     // check int114 sstockcode unique
     if tblStockAd.State in [dsinsert] then
        begin
          if TDataBaseStockRoutines.GetStockID(edtStockCode.Text) <> 0 then
           begin
           OSFMessageDlg(DMTCCoreLink.GetTextLang(3086){'Code exists!'},mtError,[mbok],0) ;
           tblStockAdSSTOCKCODE.AsString := TDataBaseDocumentRoutines.GetAnnyNextNum('STK_NEXTNUM',3,'') ;
           if TDataBaseStockRoutines.GetStockID(edtStockCode.Text) <> 0 then
              begin
              edtStockCode.SetFocus ;
              ABORT ;
              end;
          end;
        end;
  tblStockAdWStockTypeID.AsInteger := CBStockType.ItemIndex ;
  if trim(edtStockCode.Text) = '' then
    begin
     OSFMessageDlg(DMTCCoreLink.GetTextLang(3085){'Empty code!'},mtError,[mbok],0) ;
     edtStockCode.ReadOnly := false ;
     edtStockCode.SetFocus ;
     exit ;
    end;
    QBOM.DisableControls ;
    try
   if (QBOM.State in [dsedit,dsInsert]) then QBOM.post ;
  if  (tblStockAdWSTOCKTYPEID.AsInteger in [1,9]) then
    begin
    QBOM.First ;
    Total := 0 ;
     while not QBOM.Eof do
       begin
        if not QBOMFPERCENTAGEOFSALE.IsNull then
           Total := Total + QBOMFPERCENTAGEOFSALE.AsFloat else
           begin ;
           QBOM.edit ;
           QBOMFPERCENTAGEOFSALE.AsFloat :=0;
           QBOM.post ;
           end;
        CostPrice := CostPrice + (QBOMFUNITAVECOST.AsFloat * QBOMFQTY.AsFloat) ;
        LastPrice := LastPrice + (QBOMFUNITCOST.AsFloat * QBOMFQTY.AsFloat) ;
        QBOM.Next ;
       end;
      if Total <> 100 then
        begin
         pcDetails.ActivePage := tsBom ;
         OSFMessageDlg('Total of salespercentage BOM not 100% auto adjusting for ' +  FloatToStr(100-total) ,mtError,[mbok],0) ;
         QBOM.edit ;
         QBOMFPERCENTAGEOFSALE.AsFloat := QBOMFPERCENTAGEOFSALE.AsFloat   + (100-total);
         QBOM.Post ;
        end;

      end;

  if  (tblStockAdWSTOCKTYPEID.AsInteger in [1]) then
     edtAveCost.Text := FloatToStr(CostPrice);
    // edtLatestCost.Text := FloatToStr(LastPrice);
  

    finally
       QBOM.EnableControls ;
    end;
 tblStockAdSSTOCKCODE.AsString := trim(edtStockCode.Text) ;
 tblStockAdBAPPLYINVOICEDISCOUNT.Value := ord(cboxInvDiscount.Checked);
 tblStockAdSDescription.Value := edtDescription.Text;
 if Emanufacturer.Visible then
    tblStockAdSMANUFACTURER.AsString := Emanufacturer.Text
    else
    tblStockAdSMANUFACTURER.AsString := cbManufacturer.Text;

 if cbDeFaultcostgroup.ItemIndex > 0 then
  tblStockAdWDEFAULTCOSTGROUP1ID.AsInteger := Integer(cbDeFaultcostgroup.Items.Objects[cbDeFaultcostgroup.ItemIndex])
  else
  tblStockAdWDEFAULTCOSTGROUP1ID.AsInteger := 0 ;


  tblStockAdWINPUTTAX2ID.AsInteger := 0 ;
  if cbTaxclass.ItemIndex > 0 then
    tblStockAdWINPUTTAX2ID.AsInteger := Integer(cbTaxclass.Items.Objects[cbTaxclass.ItemIndex]) ;


 tblStockAdWReportingGroup1ID.AsInteger := TDataBaseRoutines.GetAddGroupNesteled(CbxRepGroup1.Text,26) ;
  if (CbxRepGroup1.Text <> '') and (CbxRepGroup1.Items.IndexOf(CbxRepGroup1.Text) = -1 ) then
     begin
      CbxRepGroup1.Items.AddObject(CbxRepGroup1.Text,TObject(tblStockAdWReportingGroup1ID.AsInteger));
      with osfStockGroup1.Properties.Items.Add do
        begin
          Value := tblStockAdWReportingGroup1ID.AsInteger ;
          Description := CbxRepGroup1.Text ;
         end;
      NeedsSearchRefresh := true ;
     end;
 tblStockAdWReportingGroup2ID.AsInteger := TDataBaseRoutines.GetAddGroupNesteled(CbxRepGroup2.Text,27) ;
  if (CbxRepGroup2.Text <> '') and (CbxRepGroup2.Items.IndexOf(CbxRepGroup2.Text) = -1 ) then
     begin
      CbxRepGroup2.Items.AddObject(CbxRepGroup2.Text,TObject(tblStockAdWReportingGroup2ID.AsInteger));
     with osfStockGroup2.Properties.Items.Add do
        begin
          Value := tblStockAdWReportingGroup2ID.AsInteger ;
          Description := CbxRepGroup2.Text ;
         end;
      NeedsSearchRefresh := true ;
     end;
 tblStockAdWUnitID.AsInteger := TDataBaseStockRoutines.GetAddUnitId(cbSize.Text,true) ;

  if (cbSize.Text <> '') and (cbSize.Items.IndexOf(cbSize.Text) = -1 ) then
     begin
      cbSize.Items.AddObject(cbSize.Text,TObject(tblStockAdWUnitID.AsInteger));

     end;

 tblStockAdFGROSSWEIGHT.AsFloat := StrToFloatDef(EGrossWeigth.Text,0) ;
 tblStockAdFNETTOWEIGHT.AsFloat := StrToFloatDef(ENettoWeigth.Text,0) ;

 tblStockAdBDisabled.AsInteger  := ord(CDDisabled.Checked)    ;
 // check stock is pocessed.
 AReturnString := VartoStr(OpenSqlAndGetFirtsColumnValue('Select  FQTYONHAND from stock where WStockid =' + tblStockAdWSTOCKID.AsString )) ;


 if (AReturnString <> FloatToSTr(StrToFloatDef(edtQtyonHand.Text,0))) and (AReturnString <> '') and CheckStockTrans(tblStockAdWSTOCKID.AsInteger) then
 begin
 if (not PnlAdjust.Visible) then
 begin
    tblStockAdFUnitCost.Value := OpenSqlAndGetFirtsColumnValue('Select FUnitCost from stock where WStockid =' + tblStockAdWSTOCKID.AsString );
    tblStockAdFQTYONHAND.Value := OpenSqlAndGetFirtsColumnValue('Select FQTYONHAND from stock where WStockid =' + tblStockAdWSTOCKID.AsString );
    tblStockAdFUnitAveCost.AsFloat := OpenSqlAndGetFirtsColumnValue('Select FUnitAveCost from stock where WStockid =' + tblStockAdWSTOCKID.AsString ) ;
 end else
 if (OSFMessageDlg(DMTCCoreLink.GetTextLang( 3365),mtConfirmation,[mbyes,mbno],0) = mryes) then
 begin
    tblStockAdFUnitCost.Value := OpenSqlAndGetFirtsColumnValue('Select FUnitCost from stock where WStockid =' + tblStockAdWSTOCKID.AsString );
    tblStockAdFQTYONHAND.Value := OpenSqlAndGetFirtsColumnValue('Select FQTYONHAND from stock where WStockid =' + tblStockAdWSTOCKID.AsString );
    tblStockAdFUnitAveCost.AsFloat := OpenSqlAndGetFirtsColumnValue('Select FUnitAveCost from stock where WStockid =' + tblStockAdWSTOCKID.AsString ) ;
 end else
 begin

 tblStockAdFUnitCost.Value := StrToFloatDef(edtLatestCost.Text,0);
 tblStockAdFQTYONHAND.Value := StrToFloatDef(edtQtyonHand.Text,0);
  if (tblStockAdFUnitAveCost.Value=0) And (StrToFloatDef(edtAveCost.text,0)=0)
    AND (StrToFloatDef(edtLatestCost.Text,0)<>0) then
    tblStockAdFUnitAveCost.AsFloat := StrToFloatDef(edtLatestCost.text,0)
  else
    tblStockAdFUnitAveCost.AsFloat := StrToFloatDef(edtAveCost.text,0);
  end;
  end else
  begin
 tblStockAdFUnitCost.Value := StrToFloatDef(edtLatestCost.Text,0);
 tblStockAdFQTYONHAND.Value := StrToFloatDef(edtQtyonHand.Text,0);
  if (tblStockAdFUnitAveCost.Value=0) And (StrToFloatDef(edtAveCost.text,0)=0)
    AND (StrToFloatDef(edtLatestCost.Text,0)<>0) then
    tblStockAdFUnitAveCost.AsFloat := StrToFloatDef(edtLatestCost.text,0)
  else
    tblStockAdFUnitAveCost.AsFloat := StrToFloatDef(edtAveCost.text,0);
  end;
  tblStockAdFSellingPrice1.AsFloat := StrToFloatDef(edtSellingPrice1.Text,0);
  tblStockAdFSellingPrice2.AsFloat := StrToFloatDef(edtSellingPrice2.Text,0);
  tblStockAdFSellingPrice3.AsFloat := StrToFloatDef(edtSellingPrice3.Text,0);
  tblStockAdFReorderQty.AsFloat := StrToFloatDef(edtReOrder.Text,0);
  tblStockAdFREORDERQTYTRIG.AsFloat := StrToFloatDef(EReorderAt.Text,0);
  tblStockAdFMINIMUMQTY.AsFloat := StrToFloatDef(EMinimum.Text,0);
  tblStockAdSSTOCKCODESUP1.AsString := ESup1stockCode.Text ;
  tblStockAdSSTOCKCODESUP2.AsString := ESup2stockCode.Text ;


  tblStockAdWInputTaxID.Value := edtInput.Tag;
  tblStockAdWOutputTaxID.Value := edtOutput.Tag;
  tblStockAdWSaleSACCOUNTID.Value := edtSales.Tag;
  tblStockAdWCostAccountID.Value := 0 ;



  if tblStockAdWSTOCKTYPEID.AsInteger = 7 then
  begin

   tblStockAdFQTYONHAND.Value := 0  ;
   tblStockAdFReorderQty.AsFloat := 0;
   tblStockAdFREORDERQTYTRIG.AsFloat :=  0 ;
   ZQStockoptions.First ;
   while not ZQStockoptions.Eof do
      begin
         tblStockAdFQTYONHAND.Value := tblStockAdFQTYONHAND.Value + ZQStockoptionsFQTYONHAND.Value ;
         tblStockAdFReorderQty.Value := tblStockAdFReorderQty.Value + ZQStockoptionsFREORDERQTY.Value ;
         tblStockAdFREORDERQTYTRIG.Value := tblStockAdFREORDERQTYTRIG.Value + ZQStockoptionsFREORDERQTYTRIG.Value ;
         ZQStockoptions.next ;
      end;
  end;
 

  if edtCOS.Enabled then
  begin
      tblStockAdWCostAccountID.AsInteger := edtCOS.Tag;
  end;
  tblStockAdWSUPPLIER1ID.AsInteger := ESupp1.Tag;
  tblStockAdWSUPPLIER2ID.AsInteger := ESupp2.Tag ;

  tblStockAdWStockAccountID.AsInteger := edtStockControl.Tag;

  tblStockAdSbarCodeNumber.value:=edtBar.Text;

  tblStockAdSEXTRADESC.AsString := MlongDesc.lines.text;
  if tblStockAd.State = dsedit then
     begin
      {  if (tblStockAd.fieldbyname('FQTYONHAND').Value <> tblStockAd.fieldbyname('FQTYONHAND').OldValue or
          tblStockAd.fieldbyname('FUnitAveCost').Value <> tblStockAd.fieldbyname('FUnitAveCost').OldValue) then

            CreateStockMovement  ;  }
     end ;
  tblStockAd.Post;
  if (dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 4) and (dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel <= 6) then
     begin
       DMTCCoreLink.LogAction('STOCK',tblStockAdWSTOCKID.AsInteger,'Stock update ' + tblStockAdSSTOCKCODE.AsString );

     end else
  if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 6 then
     begin
       DMTCCoreLink.LogAction('STOCK',tblStockAdWSTOCKID.AsInteger,'Stock update ' + tblStockAdSSTOCKCODE.AsString +' NW=' + tblStockAdFNETTOWEIGHT.AsString + ' ' + ENettoWeigth.Text +' GW=' + tblStockAdFGROSSWEIGHT.AsString + '->' + EGrossWeigth.Text+ ' BOMCOUNT=' + IntToStr(QBOM.RecordCount)  );

     end;
   if ZQStockoptions.UpdatesPending then
     ZQStockoptions.ApplyUpdates ;
  if (ZQDescriptions.State in [dsedit,dsInsert]) then ZQDescriptions.post ;
ZQDescriptions.DisableControls ;
  try

    ZQDescriptions.First ;
    while not ZQDescriptions.Eof do
       begin
         if ZQDescriptionsWSTOCKID.AsInteger <> tblStockAdWSTOCKID.AsInteger then
             begin
               ZQDescriptions.Edit ;
               ZQDescriptionsWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
               ZQDescriptions.Post ;
             end;
         ZQDescriptions.next ;
       end;
  finally
    ZQDescriptions.EnableControls ;
  end;


  if ZQDescriptions.UpdatesPending then
     ZQDescriptions.ApplyUpdates ;

  ZQlookup.First ;
  i := 0 ;
  while not ZQlookup.Eof do
   begin

   if  ZQDescriptions.Locate('WLANGUAGEID',ZQlookup.Fields[0].AsInteger,[]) then
       AFreeformArray[i].EditFormCollection.Save(ZQDescriptionsWSTOCKDESCID.AsInteger);
      inc(i) ;
      ZQlookup.next ;
   end;

ZQStockMultigroup.DisableControls ;
  try
    ZQStockMultigroup.First ;
    while not ZQStockMultigroup.Eof do
       begin
        if ZQStockMultigroupWGROUPID.AsInteger = 0 then
          ZQStockMultigroup.delete else
         begin
         if ZQStockMultigroupWSTOCKID.AsInteger = 0 then
             begin
               ZQStockMultigroup.Edit ;
               ZQStockMultigroupWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
               ZQStockMultigroup.Post ;
             end;
         ZQStockMultigroup.next ;
         end;
       end;
  finally
    ZQStockMultigroup.EnableControls ;
  end;

  if ZQStockMultigroup.UpdatesPending then
     ZQStockMultigroup.ApplyUpdates ;

  if ZQStockTrans.UpdatesPending then
     ZQStockTrans.ApplyUpdates ;

  if (QBOM.State in [dsedit,dsInsert]) then QBOM.post ;
  if  not(tblStockAdWSTOCKTYPEID.AsInteger in [1,9]) then
    begin
    QBOM.close ;
    QBOM.SQL.Text := 'Select BOM.*,Stock.SSTOCKCODE,Stock.SDescription,Stock.FUnitAveCost, Stock.FUnitCost,Stock.FQtyOnhand,Stock.FSellingprice2  from BOM,Stock where BOM.WLinkedStockID = Stock.WStockID'+
                    ' and BOM.WStockId =:id order by Stock.SSTOCKCODE' ;
    QBOM.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
    QBOM.open ;

     while not QBOM.IsEmpty do
      begin
        QBOM.Delete ;
      end;
    end;

  if QBOM.UpdatesPending then
     QBOM.ApplyUpdates ;

if MyBackord.ZQBackorder.Active then
begin
MyBackord.ZQBackorder.DisableControls ;
  try
    MyBackord.ZQBackorder.First ;
    while not MyBackord.ZQBackorder.Eof do
       begin

         if MyBackord.ZQBackorderWSTOCKID.AsInteger = 0 then
             begin
               MyBackord.ZQBackorder.Edit ;
               MyBackord.ZQBackorderWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
               MyBackord.ZQBackorder.Post ;
             end;
         MyBackord.ZQBackorder.next ;
       end;
  finally
    MyBackord.ZQBackorder.EnableControls ;
  end;

  if MyBackord.ZQBackorder.UpdatesPending then
     MyBackord.ZQBackorder.ApplyUpdates ;
 end;
  if ZQLinkSale.Active then
  begin
  if tblStockAdWSTOCKTYPEID.AsInteger = 10 then
  begin
   DMTCCoreLink.WriteSysParam('USETYPE10','True');
   DMTCCoreLink.ExtraOptions.Values['USETYPE10'] :='TRUE' ;

   ZQGen.SQL.Text := 'select  '
  end;
  ZQLinkSale.First ;

  while not ZQLinkSale.Eof do
    begin
       if ZQLinkSaleWSTOCKID.AsInteger <>  tblStockAdWSTOCKID.AsInteger then
         begin
           ZQLinkSale.edit ;
           ZQLinkSaleWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
           ZQLinkSale.post ;
         end;
      ZQLinkSale.next ;
    end;
 if (ZQLinkSale.State in [dsedit,dsInsert]) then ZQLinkSale.post ;
  if ZQLinkSale.UpdatesPending then
     ZQLinkSale.ApplyUpdates ;

  end;
  Application.ProcessMessages ;
  SendMessageToPlugin('POST=' + tblStockAdWSTOCKID.AsString);
  // See if qty changed
  if   tblStockAdFQTYONHAND.AsFloat <> TDataBaseStockRoutines.GetStockQty(tblStockAdWSTOCKID.AsInteger) then
     begin
       if not (tblStockAdWSTOCKTYPEID.AsInteger in [1,4,5,6,7,9,10]) then
         begin
           tblStockAd.edit ;
           tblStockAdFQTYONHAND.AsFloat := TDataBaseStockRoutines.GetStockQty(tblStockAdWSTOCKID.AsInteger) ;
           tblStockAd.Post ;
         end;
     end;

  if Sender = PopupMenu1 then exit ;
  PCStock.ActivePage := TSList;
  SetButtons ;
  aSearchPanel.SetLastFocus ;

  if AddNewStockItem <> '' then
     close else
     begin
     if NeedsSearchRefresh then
        begin
        Application.ProcessMessages ;
         NeedsSearchRefresh := false ;
         aSearchPanel.rebuild ;
         RebuildMenu ;
        end;
     aSearchPanel.SearchClick(self);
     end;
end;

procedure TfmStockEntry.BDeleteClick(Sender: TObject);
 var
  Outputline : String ;
 procedure HandelRecord ;
 begin
 ZQStockTrans.SQL.Text := SSelectFromStockTrn +  '  where WStockID = ' + IntToStr(tblStockAdWStockID.AsInteger) +' order by ddate ,dochead.SDocno ' ;
 ZQStockTrans.Open ;
 if ZQStockTrans.IsEmpty then
   begin
     ZQDocs.Close ;
     ZQDocs.Params[0].AsInteger := tblStockAdWStockID.AsInteger ;
     ZQDocs.Params[1].AsInteger := tblStockAdWStockID.AsInteger ;
     ZQDocs.Open ;
     if ZQDocs.IsEmpty then
     begin
       SendMessageToPlugin('DELETE=' + tblStockAdWSTOCKID.AsString);
       if Outputline <> '' then
         Outputline := Outputline + #13+#10;
          Outputline := Outputline + tblStockAdSSTOCKCODE.AsString +' ' +   DMTCCoreLink.GetTextLang(465) ;
        tblStockAd.Delete ;
     end else
     begin
       if Outputline <> '' then
         Outputline := Outputline + #13+#10;
         Outputline := Outputline + tblStockAdSSTOCKCODE.AsString +' ' +DMTCCoreLink.GetTextLang(463) +' ' + ZQDocsSDOCNO.AsString;

     end;
   end else
   begin
           if Outputline <> '' then
         Outputline := Outputline + #13+#10;
         Outputline := Outputline + tblStockAdSSTOCKCODE.AsString +' ' +DMTCCoreLink.GetTextLang(463)+' ' + ZQStockTransWSTOCKTRANSACTIONID.AsString +' ' + ZQStockTransSDOCNO.AsString;
   end;
  ZQStockTrans.Close ;
 end;
 var
  i : Integer ;
begin
 Outputline := '';
 if OSFMessageDlg(DMTCCoreLink.gettextlang(464){Are you sure you want to delete this stockitem ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
  if (PCStock.ActivePage = TSDetail) or (cxGrid1DBBandedTableView1.Controller.SelectedRowCount =0) then
    begin
       HandelRecord ;
    end else
    begin
       for i := cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 downto 0 do
         begin
             //
             cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True ;
             //       tblStockAd.GotoBookmark(dbgAdStockEdit.SelectedList[i]) ;
             HandelRecord ;
         end;
    end;
 // cxGrid1DBBandedTableView1.Controller.ClearSelection ;
 if Outputline <> '' then
  OSFMessageDlg(Outputline,mtInformation,[mbok],0,true);
  PCStock.ActivePage := TSList;
  SetButtons ;
 end;
end;

procedure TfmStockEntry.dbgAdStockEditDblClick(Sender: TObject);
begin
if (tblStockAd.State in [dsinsert,dsedit]) then
   BSaveClick(self);

if BEdit.Enabled and BEdit.CanFocus  then
 begin

  BEdit.SetFocus ;
  BEdit.Click ;
 end ;

      
end;

procedure TfmStockEntry.BAdvancedClick(Sender: TObject);
begin
  if sender <> nil then
  PnlAdjust.Visible := not PnlAdjust.Visible ;
  Splitter33.Visible := PnlAdjust.Visible ;
  if not PnlAdjust.Visible then
    BAdvanced.Caption := DMTCCoreLink.GetTextLangNoAmp( 3089) // Advanced mode
    else
    BAdvanced.Caption := DMTCCoreLink.GetTextLangNoAmp( 1341);  // normal
 

  if PnlAdjust.Visible then
  begin
    PnlAdjust.Enabled := True ;
    PnlAdjust.Height := 180 ;
    cxGrid1DBBandedTableView1SSTOCKCODE.Position.BandIndex := 0 ;
    cxGrid1DBBandedTableView1SDESCRIPTION.Position.BandIndex := 0 ;
    cxGrid1DBBandedTableView1SSTOCKCODE.Position.ColIndex := 0 ;
    cxGrid1DBBandedTableView1SDESCRIPTION.Position.ColIndex := 1 ;
    cxGrid1DBBandedTableView1.OptionsData.Editing := True ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Options.CellMerging := False ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Options.CellMerging := False ;
    cxGrid1DBBandedTableView1WUNITID.Options.CellMerging := False ;
    cxGrid1DBBandedTableView1WSTOCKTYPEID.Options.CellMerging := False ;
    cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID.Options.CellMerging := False ;


    //dbgAdStockEdit.FixedCols:=2;
    // dbgAdStockEdit.ReadOnly := false ;
  end
  else
  begin
    PnlAdjust.Enabled:=False ;
    PnlAdjust.Height:=0;

    cxGrid1DBBandedTableView1SSTOCKCODE.Position.BandIndex := 0 ;
    cxGrid1DBBandedTableView1SDESCRIPTION.Position.BandIndex := 1 ;
    cxGrid1DBBandedTableView1SSTOCKCODE.Position.ColIndex := 0 ;
    cxGrid1DBBandedTableView1SDESCRIPTION.Position.ColIndex := 0 ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Options.CellMerging := True ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Options.CellMerging := True ;
    cxGrid1DBBandedTableView1WUNITID.Options.CellMerging := True ;
    cxGrid1DBBandedTableView1WSTOCKTYPEID.Options.CellMerging := True ;
    cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID.Options.CellMerging := True ;

    cxGrid1DBBandedTableView1.OptionsData.Editing := false ;
  end;

end;

procedure TfmStockEntry.cbUpdateTypeChange(Sender: TObject);
  Procedure SetEnabled(Value:Boolean);
    begin
      if cbUsePercent.Enabled=Value Then Exit;
      cbUsePercent.Enabled:=Value;
      edtPercent.Enabled:=Value;
      Label16.Enabled:=Value;
 
    end;

begin

  SetEnabled(True);
  Case cbUpdateType.ItemIndex - 1 of
  0:begin
      SetColIndex('FUnitCost');
      SetColIndex('FUnitAveCost');
      //dbgAdStockEdit.ApplySelected;
    end;
  1:begin
      SetColIndex('FUnitCost');
      SetColIndex('FUnitAveCost');
      SetColIndex('FQtyOnHand');
      SetColIndex('FReorderQty');
      //dbgAdStockEdit.ApplySelected;
    end;
  2:begin
      SetColIndex('FUnitAveCost');
      SetColIndex('FUnitCost');
      SetColIndex('FQtyOnHand');
      SetColIndex('FReorderQty');
      //dbgAdStockEdit.ApplySelected;
    end;
  3:begin
      SetColIndex('FSellingPrice3');
      SetColIndex('FSellingPrice2');
      SetColIndex('FSellingPrice1');
      //dbgAdStockEdit.ApplySelected;
    end;
  4:Begin


      SetColIndex('WSTOCKTYPEID');
      SetColIndex('WUNITID');
      SetColIndex('BAPPLYINVOICEDISCOUNT');

      SetColIndex('FUnitAveCost');
      SetColIndex('FUnitCost');
      SetColIndex('FMINIMUMQTY');
      setColIndex('FREORDERQTYTRIG');
      SetColIndex('FReorderQty');
      SetColIndex('FQtyOnHand');
      //dbgAdStockEdit.ApplySelected;
      SetEnabled(False);
    end;

  5:Begin

      SetColIndex('SBarCodeNumber');
      SetColIndex('SEXTRADESC');
      //dbgAdStockEdit.ApplySelected;
      SetEnabled(False);
    end;
  6:Begin
     SetColIndex('SEXTRADESC');
     SetColIndex('SMANUFACTURER');


      //dbgAdStockEdit.ApplySelected;
      SetEnabled(False);
    end;
  7 : begin
        cxGrid1DBBandedTableView1.RestoreFromRegistry('Software\osfinancials\grids\STOCKGRID',false);

      end;
  end;
end;

procedure TfmStockEntry.BCopyClick(Sender: TObject);
  var
   ASql : TuniQuery ;
   i,AfromID : Integer ;
   ANextStockid : String ;
begin
   ASql := TuniQuery.create(nil) ;
    try
     AfromID :=  tblStockAdWSTOCKID.AsInteger ;
     ASql.Connection := dmDatabase.ZMainConnection ;
     ASql.SQL.Text := 'select * from stock where WStockId = ' + IntToStr(AfromID) ;
     tblStockAd.Insert ;
     ASql.open ;
     for i:= 0 to ASql.FieldCount -1 do
       begin
         if  (uppercase(ASql.Fields[i].FieldName) <> 'SSTOCKCODE') and
             (uppercase(ASql.Fields[i].FieldName) <> 'WSTOCKID') and
             (uppercase(ASql.Fields[i].FieldName) <> 'FQTYONHAND') and
             (uppercase(ASql.Fields[i].FieldName) <> 'FOPENINGQTY') and
             (uppercase(ASql.Fields[i].FieldName) <> 'FOPENINGAVECOST') and
             (uppercase(ASql.Fields[i].FieldName) <> 'FUNITAVECOST') and
             (uppercase(ASql.Fields[i].FieldName) <> 'WPERENTID') and
             (uppercase(ASql.Fields[i].FieldName) <> 'SEXTERNALID')  then
            if  tblStockAd.FindField(ASql.Fields[i].FieldName) <> nil then
                tblStockAd.FindField(ASql.Fields[i].FieldName).Value  := ASql.Fields[i].value ;
       end;

    QBOM.SQL.text := 'Select BOM.*,Stock.SSTOCKCODE,Stock.SDescription,Stock.FUnitAveCost, Stock.FUnitCost,Stock.FQtyOnhand,Stock.FSellingprice2  from BOM,Stock where BOM.WLinkedStockID = Stock.WStockID'+
                    ' and BOM.WStockId =:id' ;

    QBOM.params[0].AsInteger := tblStockAdWSTOCKID.AsInteger;

    ASql.SQL.Text := 'Select * from BOM  where WStockId = ' + IntToStr(AfromID) ;

    ASql.open ;
    QBOM.Open ;
       QBOM.DisableControls ;
       try

    while not ASql.Eof do
      begin
         QBOM.Insert ;
         QBOM.FieldByName('WLinkedStockID').AsInteger :=  ASql.FieldByName('WLinkedStockID').AsInteger;
         QBOM.FieldByName('WStockId').AsInteger :=  tblStockAdWSTOCKID.AsInteger;
         QBOM.FieldByName('FQty').Asfloat :=  ASql.FieldByName('FQty').Asfloat;
         QBOMFPERCENTAGEOFSALE.Asfloat :=  ASql.FieldByName('FPERCENTAGEOFSALE').Asfloat;

         QBOM.Post ;
         ASql.Next ;
      end ;

   finally
     QBOM.EnableControls ;
   end;

       PCStock.ActivePage := TSDetail ;
    LoadStockToGui(True) ;
    edtStockCode.SetFocus ;
    edtStockCode.ReadOnly := false ;
    SetButtons ;
 // copy options
       ASql.SQL.Text :=
       'SELECT WITEMOPTION1ID, WITEMOPTION2ID, WITEMOPTION3ID, '+
       ' WITEMOPTION4ID, WITEMOPTION5ID, WLEVEL FROM STOCKSETOPTIONS where WStockid = ' + IntToStr(AfromID);
       ASql.open ;
       ZQDefoptions.close ;
       ZQDefoptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;

       ZQDefoptions.open ;
       if not ASql.IsEmpty then
       begin

       ZQDefoptions.Insert ;
       ZQDefoptionsWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger;
       ZQDefoptionsWITEMOPTION1ID.AsVariant := ASql.fieldByName('WITEMOPTION1ID').AsVariant;
       ZQDefoptionsWITEMOPTION2ID.AsVariant := ASql.fieldByName('WITEMOPTION2ID').AsVariant;
       ZQDefoptionsWITEMOPTION3ID.AsVariant := ASql.fieldByName('WITEMOPTION3ID').AsVariant;
       ZQDefoptionsWITEMOPTION4ID.AsVariant := ASql.fieldByName('WITEMOPTION4ID').AsVariant;
       ZQDefoptionsWITEMOPTION5ID.AsVariant := ASql.fieldByName('WITEMOPTION5ID').AsVariant;
       ZQDefoptionsWLEVEL.AsInteger := ASql.fieldByName('WLEVEL').AsInteger;
       end;



       ASql.SQL.Text :=
       'select WITEMOPTIONVALUE1ID, WITEMOPTIONVALUE2ID, '+
       ' WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID, WITEMOPTIONVALUE5ID, FEXTRAPRICE, FEXTRAPRICE2,FEXTRAPRICE3,FQTYONHAND, SBARCODE, '+
       ' SREFERENCE, FUNITCOST, FUNITAVECOST, FREORDERQTY, FREORDERQTYTRIG FROM STOCKOPTIONS where WStockid = ' + IntToStr(AfromID);

       ASql.open ;
       ZQStockoptions.close ;
       ZQStockoptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
       ZQStockoptions.open ;

       ZQStockoptions.DisableControls ;
       try
       while not ASql.Eof do
       begin

       ZQStockoptions.Insert ;
       ZQStockoptionsWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger;
       ZQStockoptionsWITEMOPTIONVALUE1ID.AsVariant := ASql.fieldByName('WITEMOPTIONVALUE1ID').AsVariant;
       ZQStockoptionsWITEMOPTIONVALUE2ID.AsVariant := ASql.fieldByName('WITEMOPTIONVALUE2ID').AsVariant;
       ZQStockoptionsWITEMOPTIONVALUE3ID.AsVariant := ASql.fieldByName('WITEMOPTIONVALUE3ID').AsVariant;
       ZQStockoptionsWITEMOPTIONVALUE4ID.AsVariant := ASql.fieldByName('WITEMOPTIONVALUE4ID').AsVariant;
       ZQStockoptionsWITEMOPTIONVALUE5ID.AsVariant := ASql.fieldByName('WITEMOPTIONVALUE5ID').AsVariant;
       ZQStockoptionsFEXTRAPRICE.AsVariant := ASql.fieldByName('FEXTRAPRICE').AsVariant;
       ZQStockoptionsFEXTRAPRICE2.AsVariant := ASql.fieldByName('FEXTRAPRICE2').AsVariant;
       ZQStockoptionsFEXTRAPRICE3.AsVariant := ASql.fieldByName('FEXTRAPRICE3').AsVariant;
       ZQStockoptionsFREORDERQTY.AsFloat := ASql.fieldByName('FREORDERQTY').AsFloat;
       ZQStockoptionsFREORDERQTYTRIG.AsFloat := ASql.fieldByName('FREORDERQTYTRIG').AsFloat;
       ZQStockoptions.post ;
       ASql.next ;
       end;
       finally
         ZQStockoptions.EnableControls ;
       end;

       ZQDescriptions.Close ;
       ZQDescriptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
       ZQDescriptions.DisableControls ;
       try
       ZQDescriptions.Open ;

       ASql.SQL.Text := 'select * from STOCK_DESCRIPTIONS where WStockid = ' + IntToStr(AfromID)  ;
       ASql.OPEN ;
       i := 0 ;
       ZQlookup.First ;
       while not ZQlookup.Eof  do
        begin
          if ASql.Locate('WLANGUAGEID',ZQlookup.fieldByName('WGROUPID').AsInteger,[]) then
           if  trim(ASql.fieldByName('SDESCRIPTION').AsString) <> '' then
           begin
          ZQDescriptions.insert ;
          ZQDescriptionsWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
          ZQDescriptionsWLANGUAGEID.AsInteger :=ASql.fieldByName('WLANGUAGEID').AsInteger ;
          ZQDescriptionsSDESCRIPTION.AsString :=ASql.fieldByName('SDESCRIPTION').AsString ;
          ZQDescriptionsSEXTRADESCRIPTION.AsString :=ASql.fieldByName('SEXTRADESCRIPTION').AsString ;
          ZQDescriptions.post ;

          AFreeformArray[i].EditFormCollection.Copy(ASql.fieldByName('WSTOCKDESCID').AsInteger);
          end;
          Inc(i);
          ZQlookup.Next ;
        end;
        if   PEditOneLang.Visible then
           MEditLang.Text := ZQDescriptionsSEXTRADESCRIPTION.AsString;
      finally
        ZQDescriptions.EnableControls ;
      end;
        cbCurLang.ItemIndex := cbCurLang.items.IndexOfObject(TObject(ZQDescriptionsWLANGUAGEID.AsInteger));
      ZQStockMultigroup.Close ;
       ZQStockMultigroup.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
       ZQStockMultigroup.DisableControls ;
       try
       ZQStockMultigroup.Open ;

       ASql.SQL.Text := 'select * from STOCK_MULTIGROUP where WStockid = ' + IntToStr(AfromID) ;
       ASql.OPEN ;
       while not ASql.Eof do
        begin
          ZQStockMultigroup.insert ;
          ZQStockMultigroupWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
          ZQStockMultigroupWGROUPID.AsInteger :=ASql.fieldByName('WGROUPID').AsInteger ;
          ZQStockMultigroupIMP_SOURCEID.AsInteger :=ASql.fieldByName('IMP_SOURCEID').AsInteger ;
          ZQStockMultigroup.post ;
          ASql.Next ;
        end;
      finally
        ZQStockMultigroup.EnableControls ;
      end;




    SendMessageToPlugin('COPY=' + IntToStr(AfromID));



   ANextStockid := TDataBaseDocumentRoutines.GetAnnyNextNum('STK_NEXTNUM',1,'') ;
   if ANextStockid <> '' then
     edtStockCode.Text := ANextStockid ;
    
    finally
      ASql.free ;
    end;
end;

procedure TfmStockEntry.LoadStockToGui(NoDesc : Boolean = false);
var
 lvl , OldLang, i: Integer ;
 LastDesc : Integer ;
begin
  ClearScreen ;
  LastDesc := 0 ;
  ZQLinkSale.Close ;

  if  tblStockAdWSTOCKTYPEID.AsInteger = 10 then
  begin
  ZQLinkSale.Params[0].AsInteger :=  tblStockAdWSTOCKID.AsInteger;
  ZQLinkSale.open ;
  end;

  if ZQDescriptions.Active then
     LastDesc := ZQDescriptionsWLANGUAGEID.AsInteger ;
  ZQDescriptions.Close ;
  ZQDescriptions.Params[0].AsInteger := tblStockAdWSTOCKID.AsInteger ;
  ZQDescriptions.DisableControls ;
  try
    ZQDescriptions.Open ;

    ZQlookup.First ;
    if ZQlookup.IsEmpty then
      begin
        tstranslations.TabVisible := false ;
      end else
      begin
         i := 0 ;
         tstranslations.TabVisible := tstranslations.ControlCount = 1 ;
         OldLang := cbCurLang.ItemIndex ;
         cbCurLang.Items.Clear ;
          while not ZQlookup.Eof do
             begin
               cbCurLang.Items.AddObject(ZQlookup.Fields[1].AsString,Tobject(ZQlookup.Fields[0].AsInteger)) ;
               if not ZQDescriptions.Locate('WLANGUAGEID',ZQlookup.Fields[0].AsInteger,[]) then
                if not NoDesc then
                begin
                   begin
                     ZQDescriptions.Insert ;
                     ZQDescriptionsWSTOCKID.AsInteger := 0 ;
                     ZQDescriptionsWLANGUAGEID.AsInteger := ZQlookup.Fields[0].AsInteger ;
                     ZQDescriptionsSDESCRIPTION.AsString := edtDescription.Text ;
                     ZQDescriptions.Post ;
                   end;
               end;
               AFreeformArray[i].EditFormCollection.Load(ZQDescriptionsWSTOCKDESCID.AsInteger);
               inc(i);
               ZQlookup.next ;
             end;
          ZQDescriptions.Locate('WLANGUAGEID',LastDesc,[]) ;
           if OldLang =-1 then
             cbCurLang.ItemIndex := cbCurLang.items.IndexOfObject(TObject(ZQDescriptionsWLANGUAGEID.AsInteger))
             else
             begin
                cbCurLang.ItemIndex := OldLang ;
                cbCurLangChange(self);
             end;
       end;
  finally
    ZQDescriptions.EnableControls ;
  end;
  MyBackord.ZQBackorder.Close;
  MyBackord.FormLinkId := tblStockAdWSTOCKID.AsInteger ;
  MyBackord.ZQBackorder.Params[0].AsInteger :=  tblStockAdWSTOCKID.AsInteger ;
  if pcDetails.ActivePage = tsBackorder then
  MyBackord.ZQBackorder.Open;
  ZQStockMultigroup.close ;
  ZQStockMultigroup.Params[0].AsInteger :=  tblStockAdWSTOCKID.AsInteger ;
  ZQStockMultigroup.open ;
  cxMultiGroupGridWGROUPID.Caption := lblRep1.Caption ;
  edtStockCode.Text := tblStockAdSSTOCKCODE.AsString ;
  cbTaxclass.ItemIndex := cbTaxclass.Items.IndexOfObject(Tobject(tblStockAdWINPUTTAX2ID.AsInteger)) ;
   if cbTaxclass.ItemIndex > 0 then
    begin
      GroupBox4.Enabled := false ;
      GroupBox2.Enabled := false ;
    end;  
  edtStockCode.ReadOnly := true ;
  cboxInvDiscount.Checked :=  tblStockAdBApplyInvoiceDiscount.Value=1;
  edtDescription.Text := tblStockAdSDescription.Value;
  //Get rep group 1
  lvl := 0 ;
  CbxRepGroup1.Text := TDataBaseRoutines.GetNesteldNameFromGroupID(tblStockAdWReportingGroup1ID.AsInteger,lvl);
  lvl := 0 ;
  CbxRepGroup2.Text := TDataBaseRoutines.GetNesteldNameFromGroupID(tblStockAdWReportingGroup2ID.AsInteger,lvl);
  cbSize.Text := TDataBaseStockRoutines.GetUnitDesc(tblStockAdWUNITID.AsInteger);
  CDDisabled.Checked :=  (tblStockAdBDisabled.Asinteger = 1) ;
  edtLatestCost.Text := FloatToStrF(tblStockAdFUnitCost.Value, ffFixed, 18, 2);
  ESup1stockCode.Text := tblStockAdSSTOCKCODESUP1.AsString;
  ESup2stockCode.Text := tblStockAdSSTOCKCODESUP2.AsString;
  edtSellingPrice1.Text := tblStockAdFSellingPrice1.AsString ;//FloatToStrF(tblStockAdFSellingPrice1.Value, ffFixed, 18, 2);
  edtSellingPrice2.Text := tblStockAdFSellingPrice2.AsString ;//FloatToStrF(tblStockAdFSellingPrice2.Value, ffFixed, 18, 2);
  edtSellingPrice3.Text := tblStockAdFSellingPrice3.AsString ;//FloatToStrF(tblStockAdFSellingPrice3.Value, ffFixed, 18, 2);
  edtReOrder.Text := formatfloat('0.00##',tblStockAdFReorderQty.AsFloat);
  edtBar.Text:=tblStockAdSbarCodeNumber.value;
  LopenQty.Caption := 'Opening Qty : ' +  tblStockAdFOPENINGQTY.AsString ;
  edtCOS.Tag := 0 ;
  edtInput.Tag := 0 ;
  edtOutput.Tag := 0 ;
  edtSales.Tag := 0 ;
  edtCOS .Tag := 0 ;
  ESupp1.Tag := 0 ;
  edtStockControl.Tag := 0 ;
  ESupp2.Tag := 0 ;
  edtCOS.Text := '';
  edtInput.Text := '';
  edtOutput.Text := '';
  edtSales.Text := '';
  edtCOS.Text := '';
  ESupp1.Text := '';
  ESupp2.Text := '';
  edtStockControl.Text := '';
  edtInput.Text := TDataBaseRoutines.GetAccountFullDescription( tblStockAdWInputTaxID.AsInteger);
  edtInput.Tag := tblStockAdWInputTaxID.AsInteger ;
  edtOutput.Text :=  TDataBaseRoutines.GetAccountFullDescription( tblStockAdWOutputTaxID.AsInteger);
  edtOutput.Tag := tblStockAdWOutputTaxID.AsInteger ;
  edtSales.Text :=  TDataBaseRoutines.GetAccountFullDescription( tblStockAdWSaleSACCOUNTID.AsInteger);
  edtSales.Tag := tblStockAdWSaleSACCOUNTID.AsInteger ;
  edtCOS.Text :=  TDataBaseRoutines.GetAccountFullDescription(tblStockAdWCostAccountID.AsInteger);
  edtCOS.Tag := tblStockAdWCostAccountID.AsInteger ;
  edtStockControl.Text :=  TDataBaseRoutines.GetAccountFullDescription( tblStockAdWStockAccountID.AsInteger);
  edtStockControl.Tag := tblStockAdWStockAccountID.AsInteger ;
  ESupp1.Text := TDataBaseRoutines.GetAccountFullDescription(tblStockAdWSUPPLIER1ID.AsInteger);
  ESupp1.Tag := tblStockAdWSUPPLIER1ID.AsInteger ;
  ESupp2.Text := TDataBaseRoutines.GetAccountFullDescription(tblStockAdWSUPPLIER2ID.AsInteger);
  ESupp2.Tag := tblStockAdWSUPPLIER2ID.AsInteger ;
  EGrossWeigth.Text := FormatFloat('0.#######',tblStockAdFGROSSWEIGHT.asfloat);
  ENettoWeigth.Text := FormatFloat('0.#######',tblStockAdFNETTOWEIGHT.asfloat);
  // done : Pieter this closes the lookup for accounts
  // dmDatabase.tblAccount.Close;
  EdtAveCost.text :=  tblStockAdFUnitAveCost.Asstring ;
  EdtQtyOnHand.text :=  tblStockAdFQtyOnHand.Asstring ;
  SetEUpostedText ;
  EdtTotalCost.text := FloatToStrF(tblStockAdFUnitAveCost.Value * tblStockAdFQtyOnHand.Value, ffFixed, 18, dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty);
  // Added by sylvain
  AveCost := tblStockAdFUnitAveCost.Value;
  QteHand := tblStockAdFQtyOnHand.Value;
  LastCost := tblStockAdFUnitCost.Value;
  CBStockType.ItemIndex :=  tblStockAdWStockTypeID.AsInteger ;
  CBStockTypeChange(self);
  // load exc incl
  edtSellingPrice1.Modified := true ;
  edtSellingPrice1Exit(self);
  edtSellingPrice2.Modified := true ;
  edtSellingPrice2Exit(self);
  edtSellingPrice3.Modified := true ;
  edtSellingPrice3Exit(self);
   if EPrice.Visible then
    begin
      if (ESupp1.Tag = 0 )or (ESupp1.Tag = -1 ) then
       EPrice.Text := FloatToStr(TDataBaseStockRoutines.getStockPrice(-2,tblStockAdWSTOCKID.AsInteger,1))
      else
      EPrice.Text := FloatToStr(TDataBaseStockRoutines.getStockPrice(ESupp1.Tag,tblStockAdWSTOCKID.AsInteger,1)) ;
    end;


 // ZQStockTrans.last ;

  EdtLastInvoice.text := ZQStockTransDDate.AsString;
  // done : Onley allow edit for type if there are no transactions
  CBStockType.Enabled := ZQDocs.IsEmpty ;
  MlongDesc.lines.text := tblStockAdSEXTRADESC.AsString ;
  edtSellingPrice3.Modified := false ;
  edtSellingPrice3Inc.Modified := false ;
  edtSellingPrice2.Modified := false ;
  edtSellingPrice2Inc.Modified := false ;
  edtSellingPrice1.Modified := false ;
  edtSellingPrice1Inc.Modified := false ;
 if eManufacturer.Visible then
 Emanufacturer.Text := tblStockAdSMANUFACTURER.AsString
 else
 cbManufacturer.ItemIndex := cbManufacturer.Items.IndexOf(tblStockAdSMANUFACTURER.AsString) ;
 cbDeFaultcostgroup.ItemIndex := cbDeFaultcostgroup.Items.IndexOfObject(Tobject(tblStockAdWDEFAULTCOSTGROUP1ID.AsInteger)) ;
 Emanufacturer.MaxLength := tblStockAdSMANUFACTURER.Size ;
 EReorderAt.Text := formatfloat('0.00##',tblStockAdFREORDERQTYTRIG.AsFloat);
 EMinimum.Text := formatfloat('0.00##',tblStockAdFMINIMUMQTY.AsFloat);
 tblStockAd.edit ;
 PCStock.ActivePage := TSDetail ;
  if tblStockAdWSTOCKID.AsInteger <> 0 then
    begin
       Image1.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\stock.ico');
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg' ) then
          Image1.Picture.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg');
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp' ) then
          Image1.Picture.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp');
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif' ) then
          Image1.Picture.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif');
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png' ) then
          Image1.Picture.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png');
    end;
  pcDetailsChange(self);
  SendMessageToPlugin('EDIT=' + tblStockAdWSTOCKID.AsString);
end;

procedure TfmStockEntry.bImportClick(Sender: TObject);
begin
if cbfileformat.itemindex < 0 then
  begin
  if cbFileFormat.CanFocus then
  cbfileformat.SetFocus ;
  Raise Exception.Create('Select file type');
  end;

 if edtFileName.Text = '' then
  btnToClick(self);
 if edtFileName.Text = '' then
    exit ;
    
 SaveReoprtOp;
    ImportCheck  := TImportCheck.create(nil);
  try
    Case cbFileFormat.ItemIndex of

       1 : ImportXmlStock(edtFileName.text,'',not cbEditExsit.Checked,tstockimportEditType(cbUpdateType.ItemIndex));
       2 : ImportWkxSTock(edtFileName.text,'',not cbEditExsit.Checked,tstockimportEditType(cbUpdateType.ItemIndex));
       3 : ImportTextStock(edtFileName.text,'',',',not cbEditExsit.Checked,tstockimportEditType(cbUpdateType.ItemIndex));
       4 : ImportTextStock(edtFileName.text,'',ListSeparator,not cbEditExsit.Checked,tstockimportEditType(cbUpdateType.ItemIndex));
       5 : ImportTextStock(edtFileName.text,'',#9,not cbEditExsit.Checked,tstockimportEditType(cbUpdateType.ItemIndex));
 
       else
         ReadTxfFromFile(edtFileName.text,false);
       end;
    finally
       FreeAndNil(ImportCheck);
    end;
    SearchClick(self);
end;

procedure TfmStockEntry.BExportClick(Sender: TObject);
var
  sHead, sLog : String ;
begin
if cbfileformat.itemindex < 0 then
  begin
  if cbFileFormat.CanFocus then
  cbfileformat.SetFocus ;
  Raise Exception.Create('Select file type');
  end;
 if edtFileName.Text = '' then
  btnToClick(self);
 if edtFileName.Text = '' then
    exit ;
    sHead:= edtFileName.Text ;
    sLog := ChangeFileExt(edtFileName.Text,'.log');

 { TurboCASH Exchange File
    Xml Database
   Lotus SpreadSheet
Comma seperated values
Windows listseperator values
Tab delimited }

   sHead :=  ChangeFileExt(sHead,'.xml');
   ExportXmlStocks('','',sHead,sLog,false,tblStockAd) ;
    if cbFileFormat.ItemIndex=2 then
      begin
      SaveFileToWkx(sHead,sLog);
      end else
    if cbFileFormat.ItemIndex=3 then
      begin
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.csv'),sLog,',');
      end else
    if cbFileFormat.ItemIndex=4 then
      begin
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.csv'),sLog,ListSeparator);
      end else
    if cbFileFormat.ItemIndex=5 then
      begin
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
      end;
   if cbfileformat.itemindex <> 0 then
      begin
      sHead :=  ChangeFileExt(sHead,'.xml');
      DeleteFile(sHead);
      end;
end;

procedure TfmStockEntry.tblStockAdAfterEdit(DataSet: TDataSet);
begin
  SetButtons ;
end;

procedure TfmStockEntry.tblStockAdAfterPost(DataSet: TDataSet);
begin
  SetButtons ;

 if (ZQDefoptions.State in [dsedit,dsinsert]) then
     ZQDefoptions.Post ;
 if ZQDefoptions.UpdatesPending then
     ZQDefoptions.ApplyUpdates ;

 if (ZQStockoptions.State in [dsedit,dsinsert]) then
     ZQStockoptions.Post ;
 if ZQStockoptions.UpdatesPending then
     ZQStockoptions.ApplyUpdates ;

end;

procedure TfmStockEntry.tblStockAdAfterDelete(DataSet: TDataSet);
begin
  SetButtons ;
end;

procedure TfmStockEntry.BReportClick(Sender: TObject);
var
 Docname,Clause : String ;
 SelectedPinter : String ;
begin
if Integer(CBReport.Items.Objects[CBReport.ItemIndex]) = 0 then
   Docname := 'reports\reports\STOCK\' + CBReport.Items[CBReport.ItemIndex]
   else
   Docname := 'reports\reports\STOCK\LANG_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));

   if FileExists(DMTCCoreLink.GetLocalPluginDir + Docname +'.rep' ) then
     Docname := DMTCCoreLink.GetLocalPluginDir + Docname else
     Docname :=  ExtractFilePath(Application.ExeName) + 'plug-ins\' + Docname ;


Clause := aSearchPanel.GetClause ;
if Clause = '' then Clause := ' 1 = 1';

if cbBarcode.Checked then
   SelectedPinter := '2'
     else
   SelectedPinter := '0' ;
  ExecReport(Docname+'.rep','SQL=' +Clause);
//CheckReportMan(0,0,1,0,'OSFPRINTER=' + SelectedPinter + #13+#10+ 'SQL=' +Clause ,Docname,'REPORTS','plug_ins\reports');
end;

procedure TfmStockEntry.FormDestroy(Sender: TObject);
var
  i : Integer ;
  AField : TField ;
begin
 aOptFreeFields.Free ;
 APanelTreeView.ClearItems ;
 APanelTreeView.free;
 for i := tblStockAd.FieldCount -1 downto 0 do
   begin
     AField := tblStockAd.Fields[i] ;
     if AField.Tag = 101 then
       begin
        tblStockAd.Fields.Remove(AField);
        AField.Free ;
       end;


   end;

 AStockLinksList.free;


  for i := 0 to  APluginsFormsList.Count -1 do
    begin
      try
      AFormPluginRecordArray[i].aUnLoadFormPlugin(TForm(APluginsFormsList.Objects[i]));
      except
        on e:Exception do
          begin
             OSFMessageDlg('Error in plugin ' + TForm(APluginsFormsList.Objects[i]).Caption + ' : ' + #13+#10 + e.Message,mtWarning,[mbok],0);
          end;
      end;
    end;






 APluginList.free ;
 ARemeberAccountList.free ;
 aDMCoreDocData.free ;
 APluginsFormsList.free ;

 AGroupColorList.free ;
 AGroupTextColorList.free ;
 for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].free;
 ACalculatedFields.free ;
end;

procedure TfmStockEntry.BSetupstockClick(Sender: TObject);
begin
  fmStockInfo := TfmStockInfo.Create(self);
  try
    fmStockInfo.ShowModal ;
  finally
  FreeAndNil(fmStockInfo);
  end;
  initSetOfBooksPropertys ;
end;

procedure TfmStockEntry.BSetupGroupsClick(Sender: TObject);
begin
 fmGroups := TfmGroups.Create(self);
  try
  if fmGroups.GroupControl.TabCount = 0 then
    exit ;
  fmGroups.ShowModal;

  CbxRepGroup1.Sorted := False ;
  CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,26);
  CbxRepGroup1.Sorted := true ;
  CbxRepGroup2.Sorted := False ;
  CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,27);
  CbxRepGroup2.Sorted := true ;


  aSearchPanel.rebuild ;
  RebuildMenu ;
  finally
  FreeAndNil(fmGroups);
  end;
end;

procedure TfmStockEntry.Printsingleitem1Click(Sender: TObject);
var
 Docname,Clause : String ;
 SelectedPinter : String ;
 i : Integer ;
begin
for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
begin
cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
if Integer(CBReport.Items.Objects[CBReport.ItemIndex]) = 0 then
   Docname := 'reports\reports\STOCK\' + CBReport.Items[CBReport.ItemIndex]
   else
   Docname := 'reports\reports\STOCK\LANG_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));

   if FileExists(DMTCCoreLink.GetLocalPluginDir + Docname +'.rep' ) then
     Docname := DMTCCoreLink.GetLocalPluginDir + Docname else
     Docname :=  ExtractFilePath(Application.ExeName) + 'plug-ins\' + Docname ;
     Clause := 'stock.WStockid = ' + IntToStr(tblStockAdWSTOCKID.AsInteger) ;
     PrintReport(Docname+'.rep','SQL=' +Clause);
end;
  // CheckReportMan(0,0,1,0,'OSFPRINTER=' + SelectedPinter + #13+#10+ 'SQL=' +Clause ,Docname,'REPORTS','plug_ins\reports');
end;

function TfmStockEntry.GetAccountCode(AAccount: Integer): String;
var
 AItem : TOSFLedgerItem ;
begin
  AItem := ARemeberAccountList.GetItemOnAccountId(AAccount) ;
  if AItem = nil then
    begin
      AItem := ARemeberAccountList.add(nil) ;
      AItem.AccountID := AAccount ;
      AItem.Accountcode := TDataBaseRoutines.GetAccountCode(AAccount) ;
    end;
   result := AItem.Accountcode ;
end;

procedure TfmStockEntry.LoadPluginsStock;
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
       if IncArr > 15 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToStockRoutineName);
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
                 AFormPluginRecordArray[IncArr].aPluginEnabled('STOCK',APChar,ImageIndex);
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
   InitPluginsOnPagecontrol ;
end;

procedure TfmStockEntry.Inactive1Click(Sender: TObject);
var
 i : Integer ;
begin
   for i := 0 to cxGrid4DBTableView1.Controller.SelectedRowCount -1  do
    begin
        cxGrid4DBTableView1.Controller.SelectedRows[i].Focused := True ;
        ZQStockoptions.Edit ;
        ZQStockoptionsBENABLED.AsInteger := 0 ;
        ZQStockoptions.Post ;

    end;

end;

procedure TfmStockEntry.InitPluginsOnPagecontrol;
var
 i :  Integer ;
 AForm: TForm ;
 APage : TTabSheet ;
 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;
 AMenuitem : TMenuitem ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
         APage :=  TTabSheet.Create(self) ;
         try
         APage.PageControl := pcDetails;
         // ShowMessage(GetModuleName(AFormPluginRecordArray[i].aInst));
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'STOCK');

         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         APage.Caption :=  ReturnString ;
         AForm.Parent := APage ;
         AForm.Align := alClient ;
         AForm.BorderStyle := bsnone ;
         AForm.Show ;
         APluginsFormsList.AddObject(aform.Name,AForm);

         AMenuitem := TMenuitem.Create(PluginsCopyfrom1) ;
         PluginsCopyfrom1.Add(AMenuitem);
         AMenuitem.Caption := ReturnString ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := OnMenuCopy;

         AMenuitem := TMenuitem.Create(Pluginscopyto1) ;
         Pluginscopyto1.Add(AMenuitem);
         AMenuitem.Caption := ReturnString ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := OnMenuPast;
         AMenuitem.Enabled := false ;

         if Assigned(AFormPluginRecordArray[i].aContextmenuEnabled) then
            begin
         AMenuitem := TMenuitem.Create(PluginsAction11) ;
         PluginsAction11.Add(AMenuitem);
         AMenuitem.Caption := ReturnString ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := OnMenuPluginAct1;


         AMenuitem := TMenuitem.Create(Pluginsaction21) ;
         Pluginsaction21.Add(AMenuitem);
         AMenuitem.Caption := ReturnString ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := OnMenuPluginAct2;

            end;

         if AForm = nil then
         begin
            OSFMessageDlg(GetModuleName(AFormPluginRecordArray[i].aInst) + ' Error ! no Form found!' ,mtError,[mbok],0);
            APage.Caption := 'Error in plugin';
         end;

        except
           on e : Exception do
             begin
                OSFMessageDlg(GetModuleName(AFormPluginRecordArray[i].aInst) + ' Error ! ' + e.Message,mtError,[mbok],0);
                APage.Caption := 'Error in plugin';
             end;
        end;
      end;
  PluginsAction11.Caption := DMTCCoreLink.GetTextLang(3282);
  Pluginsaction21.Caption := DMTCCoreLink.GetTextLang(3281);
  PluginsCopyfrom1.Caption := DMTCCoreLink.GetTextLang(3289);
  Pluginscopyto1.Caption := DMTCCoreLink.GetTextLang(3290);

  PluginsCopyfrom1.Visible := PluginsCopyfrom1.Count <> 0 ;
  Pluginscopyto1.Visible := Pluginscopyto1.Count <> 0 ;
  PluginsAction11.Visible := PluginsAction11.Count <> 0 ;
  Pluginsaction21.Visible := Pluginsaction21.Count <> 0 ;
  i := 1 ;
  While (DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKCOPY' + IntToStr(i)) <> '')
  and (DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKPAST' + IntToStr(i)) <> '')
  and (DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKCOPYNAME' + IntToStr(i)) <> '')
  do
    begin
         AMenuitem := TMenuitem.Create(GenCopyFrom) ;
         GenCopyFrom.Add(AMenuitem);
         AMenuitem.Caption := trim(DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKCOPYNAME' + IntToStr(i))) ;
         if StrToIntDef(AMenuitem.Caption,0) <> 0 then
            AMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AMenuitem.Caption,0)) ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := GenMenuCopy;

         AMenuitem := TMenuitem.Create(GenCopyto) ;
         GenCopyto.Add(AMenuitem);
         AMenuitem.Caption := trim(DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKCOPYNAME' + IntToStr(i))) ;
         if StrToIntDef(AMenuitem.Caption,0) <> 0 then
            AMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AMenuitem.Caption,0)) ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := GenMenuPast;
      inc(i);
    end;

  GenCopyFrom.Caption := DMTCCoreLink.GetTextLang(3291);
  GenCopyto.Caption := DMTCCoreLink.GetTextLang(3292);

  GenCopyFrom.Visible := GenCopyFrom.Count <> 0 ;
  GenCopyto.Visible := GenCopyto.Count <> 0 ;

end;

procedure TfmStockEntry.SendMessageToPlugin(AMessage: String);
var
 i : Integer ;
begin
  for i := 0 to  APluginsFormsList.Count -1 do
    begin
      try
      AFormPluginRecordArray[i].aMessageFormPlugin(TForm(APluginsFormsList.Objects[i]),PChar(AMessage));
      except
        on e:Exception do
          begin
             OSFMessageDlg('Error in plugin ' + TForm(APluginsFormsList.Objects[i]).Caption + ' : ' + #13+#10 + e.Message,mtWarning,[mbok],0);
          end;
      end;
    end;


end;

procedure TfmStockEntry.BSelectImageClick(Sender: TObject);
begin
 if tblStockAd.IsEmpty then exit ;
 if tblStockAdWSTOCKID.AsInteger =0 then exit ;
 if OpenDialog1.Execute then
     begin
       ForceDirectories(DMTCCoreLink.GetLocalSaveDir + 'images\');
       if  (LowerCase(ExtractFileExt(OpenDialog1.FileName)) = '.bmp') or (LowerCase(ExtractFileExt(OpenDialog1.FileName)) = '.jpg') or (LowerCase(ExtractFileExt(OpenDialog1.FileName)) = '.png') or (LowerCase(ExtractFileExt(OpenDialog1.FileName)) = '.gif') then
         begin
           Image1.Picture.LoadFromFile(OpenDialog1.FileName);
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg' ) then
              DeleteFile (DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png');
           Image1.Picture.SaveToFile(DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+ ExtractFileExt(OpenDialog1.FileName));
         end;
     end;
end;

procedure TfmStockEntry.BDeleteimageClick(Sender: TObject);
begin
  if OSFMessageDlg(format(DMTCCoreLink.GetTextLangNoAmp(2881),['image']),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg' ) then
              DeleteFile (DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.jpg');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.bmp');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.gif');
           if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png' ) then
              DeleteFile( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(tblStockAdWSTOCKID.AsInteger)+'.png');
           Image1.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\stock.ico');
end;

procedure TfmStockEntry.edtBarDblClick(Sender: TObject);
var
  LastEanNumber : String ;
  ITop,IBotom,iCheckSum : Integer ;
begin
 if edtBar.Text = '' then
   begin
     LastEanNumber := DMTCCoreLink.ReadSysParam('STOCKEAN13','',0);
     if Length(LastEanNumber) = 12  then
        begin
          LastEanNumber := TDataBaseStringRoutines.IncrementString(LastEanNumber);
          DMTCCoreLink.WriteSysParam('STOCKEAN13',LastEanNumber,0);
          // calculate hash
          ITop := StrToInt(LastEanNumber[1]) ;
          IBotom := StrToInt(LastEanNumber[2]) ;
          ITop := ITop +StrToInt(LastEanNumber[3]) ;
          IBotom := IBotom  + StrToInt(LastEanNumber[4]) ;
          ITop := ITop +StrToInt(LastEanNumber[5]) ;
          IBotom := IBotom  + StrToInt(LastEanNumber[6]) ;
          ITop := ITop +StrToInt(LastEanNumber[7]) ;
          IBotom := IBotom  + StrToInt(LastEanNumber[8]) ;
          ITop := ITop +StrToInt(LastEanNumber[9]) ;
          IBotom := IBotom  + StrToInt(LastEanNumber[10]) ;
          ITop := ITop +StrToInt(LastEanNumber[11]) ;
          IBotom := IBotom  + StrToInt(LastEanNumber[12]) ;

           IBotom := IBotom * 3 ;
          iCheckSum := (((( ITop +  IBotom) div 10)+1) *10) -  (ITop +  IBotom) ;
          if iCheckSum = 10 then iCheckSum := 0 ;
          edtBar.Text :=  LastEanNumber + FormatFloat('0',iCheckSum);
        end;
     // EAN creation
   end;
end;

procedure TfmStockEntry.SetEUpostedText;
var
 Total , QtyOnHand,QtyOnHand2,QtyInout : Variant ;
 AString : String ;
begin
  Total := 0 ;
  QtyInout := 0 ;
  QtyOnHand := TDataBaseStockRoutines.GetStockQty(tblStockAdWSTOCKID.AsInteger) ;

  if varToStr(QtyOnHand) <> '' then
  Total := QtyOnHand ;
  if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
  begin
   QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,16,-1);
   if varToStr(QtyOnHand) <> '' then
  QtyInout := QtyInout - QtyOnHand ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,17,-1);
   if varToStr(QtyOnHand) <> '' then
  QtyInout := QtyInout + QtyOnHand ;
  end ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,10,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total - QtyOnHand ;

  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,14,-1,0,0,' and DocHead.BPosted = -1');
   if varToStr(QtyOnHand) <> '' then
  Total := Total - QtyOnHand ;

  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,11,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total + QtyOnHand ;
    if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] <> 'TRUE' then
    begin
     QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,12,-1);
     if varToStr(QtyOnHand) <> '' then
   Total := Total + QtyOnHand ;

     QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,15,-1,0,0,' and DocHead.BPosted = -1');
     if varToStr(QtyOnHand) <> '' then
     Total := Total + QtyOnHand ;


   QtyOnHand :=  TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,13,-1);
   if varToStr(QtyOnHand) <> '' then
   Total := Total - QtyOnHand ;
  end;
  if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
     begin
      AString := 'Cur : %s Quote : %s Order : %s InOut :%s Exp : %s ' ;
      QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,14,-1,0,0,' and DocHead.BPosted = 0');
      QtyOnHand2 := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,15,-1,0,0,'  and DocHead.BPosted = 0');
      AString := Format(AString,[
      FloatToStr(Total),
      FloatToStr(QtyOnHand),
      FloatToStr(QtyOnHand2),
      FloatToStr(QtyInout),
      FloatToStr(((Total-QtyOnHand)+QtyInout) + QtyOnHand2)])  ;
     end else
     begin

  AString := GetTextLang(3139);
  if AString = '' then
  AString := 'Cur : %s Quote : %s Order : %s Exp : %s' ;

  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,14,-1,0,0,' and DocHead.BPosted = 0');
  QtyOnHand2 := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(tblStockAdWSTOCKID.AsInteger,15,-1,0,0,' and DocHead.BPosted = 0');

  AString := Format(AString,[
  FloatToStr(Total),
   FloatToStr(QtyOnHand),
   FloatToStr(QtyOnHand2),
   FloatToStr((Total-QtyOnHand) + QtyOnHand2)])  ;
    end;
 EUnposted.text := AString ;
end;

procedure TfmStockEntry.DBGDocumentsDblClick(Sender: TObject);
var
 pmenu : Pointer ;
 Method : TMethod ;

begin
 if ZQDocs.IsEmpty then exit ;
 if DMTCCoreLink.AApplication.FindComponent('fmMain') <> nil then
  if DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass') <> nil then
    begin

  PMenu := DMTCCoreLink.AApplication.FindComponent('fmMain').MethodAddress('ShowDocumentFromPlugin');
  if (PMenu<>Nil) then
        begin
          Method.Code := PMenu;
          Method.Data := DMTCCoreLink.AApplication.FindComponent('fmMain');
          DMTCCoreLink.SetPersistentProp('PreviewDocId',DMTCCoreLink.AApplication.FindComponent('fmMain').FindComponent('PluginIteractClass'),ZQDocs.fieldByName('WDOCID').AsInteger);
          TNotifyEvent(Method)( DMTCCoreLink.AApplication.FindComponent('fmMain'))
        end;
     end;
end;


 

procedure TfmStockEntry.BGenOptionsClick(Sender: TObject);
var
 Dimension : Integer ;
 AListArray : Array of TStringlist ;
 i , i1,i2,i3,i4,i5: Integer ;
begin
ZQStockoptions.DisableControls ;
try
if ZQDefoptionsWITEMOPTION1ID.AsInteger <> 0 then
 begin
   Dimension := 1 ;
   if ZQDefoptionsWITEMOPTION2ID.AsInteger <> 0 then
     begin
      inc(Dimension) ;
      if ZQDefoptionsWITEMOPTION3ID.AsInteger <> 0 then
          begin
            inc(Dimension) ;
             if ZQDefoptionsWITEMOPTION4ID.AsInteger <> 0 then
                begin
                inc(Dimension) ;
                if ZQDefoptionsWITEMOPTION5ID.AsInteger <> 0 then
                   inc(Dimension) ;
                end;
          end;
     end;
  SetLength(AListArray,Dimension);
  for i := 0 to Dimension -1 do
     begin
        AListArray[i] := TStringList.Create ;
     end;
  // get all list

  for i := 0 to Dimension -1 do
     begin
        TDataBaseStringRoutines.FillStringListWithSelect(AListArray[i],'select WITEMOPTIONVALUEID,FEXTRAAMOUNT  from ITEMOPTIONSVALUES where WITEMOPTIONID = ' + IntToStr(ZQDefoptions.FindField('WITEMOPTION'+IntToStr(i+1)+'ID').AsInteger),0);
     end;
   // make all combinations
  if Dimension > 0 then
     begin
        for i1 := 0 to AListArray[0].Count -1 do
           begin
              if Dimension > 1 then
                 begin
                  for i2 := 0 to AListArray[1].Count -1 do
                             begin
                              if Dimension > 2 then
                                 begin
                                  for i3 := 0 to AListArray[2].Count -1 do
                                             begin
                                              if Dimension > 4 then
                                                 begin
                                                    for i4 := 0 to AListArray[3].Count -1 do
                                                             begin
                                                              if Dimension > 4 then
                                                                 begin
                                                                   for i5 := 0 to AListArray[4].Count -1 do
                                                                                 begin
                                                                                       if not ZQStockoptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',VarArrayOf([Integer(AListArray[0].Objects[i1]),Integer(AListArray[1].Objects[i2]),Integer(AListArray[2].Objects[i3]),Integer(AListArray[3].Objects[i4]),Integer(AListArray[4].Objects[i5])]),[]) then

                                                                                            begin
                                                                                             ZQStockoptions.Append ;
                                                                                             ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(AListArray[0].Objects[i1]) ;
                                                                                             ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger := Integer(AListArray[1].Objects[i2]) ;
                                                                                             ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger := Integer(AListArray[2].Objects[i3]) ;
                                                                                             ZQStockoptionsWITEMOPTIONVALUE4ID.AsInteger := Integer(AListArray[3].Objects[i4]) ;
                                                                                             ZQStockoptionsWITEMOPTIONVALUE5ID.AsInteger := Integer(AListArray[4].Objects[i5]) ;
                                                                                             ZQStockoptionsFEXTRAPRICE.AsFloat := StrToFloatDef(AListArray[0][i1],0) +
                                                                                                                                  StrToFloatDef(AListArray[1][i2],0) +
                                                                                                                                  StrToFloatDef(AListArray[2][i3],0) +
                                                                                                                                  StrToFloatDef(AListArray[3][i4],0) +
                                                                                                                                  StrToFloatDef(AListArray[4][i5],0) ;
                                                                                            end;
                                                                                end;


                                                                 end else
                                                                 begin
                                                                   if not ZQStockoptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID',VarArrayOf([Integer(AListArray[0].Objects[i1]),Integer(AListArray[1].Objects[i2]),Integer(AListArray[2].Objects[i3]),Integer(AListArray[3].Objects[i4])]),[]) then
                                                                        begin
                                                                         ZQStockoptions.Append ;
                                                                         ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(AListArray[0].Objects[i1]) ;
                                                                         ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger := Integer(AListArray[1].Objects[i2]) ;
                                                                         ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger := Integer(AListArray[2].Objects[i3]) ;
                                                                         ZQStockoptionsWITEMOPTIONVALUE4ID.AsInteger := Integer(AListArray[3].Objects[i4]) ;
                                                                         ZQStockoptionsFEXTRAPRICE.AsFloat := StrToFloatDef(AListArray[0][i1],0) +
                                                                                                                                  StrToFloatDef(AListArray[1][i2],0) +
                                                                                                                                  StrToFloatDef(AListArray[2][i3],0) +
                                                                                                                                  StrToFloatDef(AListArray[3][i4],0) ;
                                                                      end;
                                                                 end;
                                                           end;
                                                 end else
                                                 begin
                                                   if not ZQStockoptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID',VarArrayOf([Integer(AListArray[0].Objects[i1]),Integer(AListArray[1].Objects[i2]),Integer(AListArray[2].Objects[i3])]),[]) then
                                                      begin
                                                         ZQStockoptions.Append ;
                                                         ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(AListArray[0].Objects[i1]) ;
                                                         ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger := Integer(AListArray[1].Objects[i2]) ;
                                                         ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger := Integer(AListArray[2].Objects[i3]) ;
                                                         ZQStockoptionsFEXTRAPRICE.AsFloat := StrToFloatDef(AListArray[0][i1],0) +
                                                                                                                                  StrToFloatDef(AListArray[1][i2],0) +
                                                                                                                                  StrToFloatDef(AListArray[2][i3],0) ;
                                                      end;
                                                 end;
                                           end;
                                 end else
                                 begin
                                   if not ZQStockoptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID',VarArrayOf([Integer(AListArray[0].Objects[i1]),Integer(AListArray[1].Objects[i2])]),[]) then
                                      begin
                                         ZQStockoptions.Append ;
                                         ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(AListArray[0].Objects[i1]) ;
                                         ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger := Integer(AListArray[1].Objects[i2]) ;
                                         ZQStockoptionsFEXTRAPRICE.AsFloat := StrToFloatDef(AListArray[0][i1],0) +
                                                                                                            StrToFloatDef(AListArray[1][i2],0) ;
                                      end;
                                 end;
                           end;
                 end else
                 begin
                   if not ZQStockoptions.Locate('WITEMOPTIONVALUE1ID',Integer(AListArray[0].Objects[i1]),[]) then
                      begin
                         ZQStockoptions.Append ;
                         ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(AListArray[0].Objects[i1]) ;
                         ZQStockoptionsFEXTRAPRICE.AsFloat := StrToFloatDef(AListArray[0][i1],0) ;
                      end;
                 end;
           end;
           ZQStockoptionsFEXTRAPRICE2.AsFloat := ZQStockoptionsFEXTRAPRICE.AsFloat  ;
           ZQStockoptionsFEXTRAPRICE3.AsFloat := ZQStockoptionsFEXTRAPRICE.AsFloat  ;
           ZQStockoptions.post ;
     end;

  for i := 0 to Dimension -1 do
     begin
        AListArray[i].free ;

     end;
 end;
 finally
    ZQStockoptions.EnableControls ;
 end;
end;

procedure TfmStockEntry.ZQDefoptionsAfterInsert(DataSet: TDataSet);
begin
  ZQDefoptionsWSTOCKID.AsInteger :=  tblStockAdWSTOCKID.AsInteger ;
end;

procedure TfmStockEntry.ZQStockoptionsAfterInsert(DataSet: TDataSet);
begin
 if not ZQStockoptions.ControlsDisabled then
    begin
     ZQStockoptions.Cancel ;
     exit ;

    end;
 ZQStockoptionsWSTOCKOPTIONSID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_STOCKOPTIONS') ;
 ZQStockoptionsWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
end;

procedure TfmStockEntry.ZQStockoptionsAfterScroll(DataSet: TDataSet);
begin
       if poptfreefields.Visible then
       begin
         if ( ZQStockoptions.UpdateStatus in[usUnmodified,usModified]) and (DataSet.FieldByName('WSTOCKOPTIONSID').AsInteger <> 0) then
         begin
           aOptFreeFields.Visible := True ;
           aOptFreeFields.EditFormCollection.Load(DataSet.FieldByName('WSTOCKOPTIONSID').AsInteger );
         end else
         aOptFreeFields.Visible := false ;
       end;
end;

procedure TfmStockEntry.ZQStockoptionsWITEMOPTIONVALUE1IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger)));
  if  ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger <> 0 then
  Text := Text + ' ' + VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger)));
  if  ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger <> 0 then
  Text := Text + ' ' + VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger)));
  if  ZQStockoptionsWITEMOPTIONVALUE4ID.AsInteger <> 0 then
  Text := Text + ' ' + VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(ZQStockoptionsWITEMOPTIONVALUE4ID.AsInteger)));
  if  ZQStockoptionsWITEMOPTIONVALUE5ID.AsInteger <> 0 then
  Text := Text + ' ' + VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(ZQStockoptionsWITEMOPTIONVALUE5ID.AsInteger)));
end;

procedure TfmStockEntry.tblStockAdAfterCancel(DataSet: TDataSet);
begin
 if (ZQDefoptions.State in [dsedit,dsinsert]) then
     ZQDefoptions.Cancel ;
 if ZQDefoptions.UpdatesPending then
     ZQDefoptions.CancelUpdates ;

 if (ZQStockoptions.State in [dsedit,dsinsert]) then
     ZQStockoptions.Cancel ;
 if ZQStockoptions.UpdatesPending then
     ZQStockoptions.CancelUpdates ;
end;

procedure TfmStockEntry.BRemoveOptionsClick(Sender: TObject);
begin
if not ZQStockoptions.IsEmpty then
  ZQStockoptions.Delete ;
end;

procedure TfmStockEntry.CbxRepGroup1CloseUp(Sender: TObject);
begin
(Sender As TComboBox).Color:=ClWindow;
end;

procedure TfmStockEntry.FormResize(Sender: TObject);
begin
if not Assigned(ScrollBox1) then exit ;

  if ScrollBox1.Width < 700 then
     begin
       ScrollBox1.HorzScrollBar.Range := 800 ;
       ScrollBox1.HorzScrollBar.Visible := true ;
       ScrollBox1.Visible := true ;
     end ;
  if ScrollBox1.Height < 500 then
     begin
       ScrollBox1.VertScrollBar.Range := 500 ;
     end ;
end;

procedure TfmStockEntry.ZQDescriptionsBeforeOpen(DataSet: TDataSet);
begin
 DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from STOCK_DESCRIPTIONS where WStockid is null');
end;

procedure TfmStockEntry.ZQStockMultigroupWGROUPIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);

begin

  Text :=  '' ;
  if  ZQStockMultigroup.IsEmpty then exit ;
      Text := TDataBaseRoutines.GetNesteldNameFromGroupID(ZQStockMultigroupWGROUPID.AsInteger,0) ;

end;

procedure TfmStockEntry.ZQStockMultigroupAfterInsert(DataSet: TDataSet);
begin
  ZQStockMultigroupWSTOCKID.AsInteger := tblStockAdWSTOCKID.AsInteger ;
  ZQStockMultigroupIMP_SOURCEID.AsInteger := 0 ;
  ZQStockMultigroupWGROUPID.AsInteger := 0 ;

end;

procedure TfmStockEntry.ZQStockTransBeforeEdit(DataSet: TDataSet);
begin
 if PCStock.ActivePage = TSList then exit ;
 if not  PnlAdjust.Visible then
    Abort ;
 {if OSFMessageDlg(DMTCCoreLink.GetTextLang(641),mtConfirmation,[mbOK,mbCancel],0) = mrcancel then
    Abort ;}
end;

procedure TfmStockEntry.ZQStockTransBeforeInsert(DataSet: TDataSet);
begin
  Abort ;
end;

procedure TfmStockEntry.DBMemo1DblClick(Sender: TObject);

begin
  if (ZQDescriptions.State in [dsEdit,dsInsert]) then
      ZQDescriptions.Post ;
  ZQDescriptions.edit ;
  ZQDescriptionsSEXTRADESCRIPTION.AsString :=TDatabaseRegistyRoutines.EditWithOpenOffice(ZQDescriptionsSEXTRADESCRIPTION.AsString) ;
end;

procedure TfmStockEntry.DBLookupComboBox2KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key =  VK_BACK then
   begin
    if TDBLookupComboBox(Sender).Field.DataSet.IsEmpty then exit ;
    if TDBLookupComboBox(Sender).Field.DataSet.State = dsBrowse then
       TDBLookupComboBox(Sender).Field.DataSet.Edit ;
    TDBLookupComboBox(Sender).Field.Clear ;
   end;                       
end;

procedure TfmStockEntry.ZQDescriptionsAfterInsert(DataSet: TDataSet);
begin
  ZQDescriptionsWLANGUAGEID.AsInteger :=  0 ;
  ZQDescriptionsWSTOCKID.AsInteger := 0 ;
 if cbCurLang.ItemIndex <> -1 then
  begin

   ZQDescriptionsWLANGUAGEID.AsInteger :=  Integer(cbCurLang.Items.Objects[cbCurLang.ItemIndex]) ;

  end;
end;

procedure TfmStockEntry.DBGBomDblClick(Sender: TObject);
begin
   if QBOM.IsEmpty then exit ;
   CallLookup('',18,QBOM.FieldByName('WLinkedStockID').AsInteger);
   //dmDatabase.tblStock.open ;
   if  TDataBaseStockRoutines.GetStockID(ReturnLookup) <> 0 then
    begin
       QBOM.Edit ;
       QBOM.FieldByName('WLinkedStockID').AsInteger :=  TDataBaseStockRoutines.GetStockID(ReturnLookup);
       QBOMLSTOCKCODE.AsString := '' ;
       QBOM.post ;
    end;
 
end;


procedure TfmStockEntry.ZQDocsCalcFields(DataSet: TDataSet);
begin
  if ZQDocsFQTYSHIPPED.AsFloat <> 0 then
  begin
    ZQDocsPRICEPERITEM.AsFloat := ZQDocsFEXCLUSIVEAMT.AsFloat / ZQDocsFQTYSHIPPED.AsFloat ;
  end;
end;

procedure TfmStockEntry.cbCurLangChange(Sender: TObject);
begin
 if cbCurLang.ItemIndex <> -1 then
  begin
  if (ZQDescriptions.State in [dsEdit,DsInsert]) then
       ZQDescriptions.post ;

  if PEditOneLang.Visible then
    begin
    if PCStock.ActivePage = TSDetail then

     begin
         if not ZQDescriptions.ControlsDisabled then
        begin

       if not ZQDescriptions.Locate('WLANGUAGEID',Integer(cbCurLang.Items.Objects[cbCurLang.ItemIndex]),[]) then
      begin
       ZQDescriptions.Insert ;

      end else
      ZQDescriptions.Edit ;
      if ZQDescriptionsSDESCRIPTION.AsString = '' then
         ZQDescriptionsSDESCRIPTION.AsString := ' ' ;

      ZQDescriptions.Post ;
       HideTransfields ;
      end ;
    end;   
    end;
    if not ZQDescriptions.Locate('WLANGUAGEID',Integer(cbCurLang.Items.Objects[cbCurLang.ItemIndex]),[]) then
      begin
       if not ZQDescriptions.ControlsDisabled then
       ZQDescriptions.Insert ;
      end;
    HideTransfields ;
  end;
end;

procedure TfmStockEntry.RebuildMenu;
Procedure   RecurceTree(AItem : TMenuItem ;GroupType : Integer ) ;
Var
  AQuery : TuniQuery ;
  AMenuitem : TMenuItem ;
  ExtraSql : String ;
begin
  AQuery := TuniQuery.create(nil) ;
   try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    // if its root its 0 but we need to include the parent id is null
    ExtraSql := '' ;
    if AItem.Tag = 0 then ExtraSql := ' or WParentGroup2ID is null ';
    // back cast to integer( if its root it wil be 0);
    AQuery.sql.Text := format('Select * From v_groups Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo ',[IntToStr(GroupType),IntToStr(AItem.Tag),ExtraSql]);
    AQuery.open ;
    while not AQuery.Eof do
      begin
       //  done : Pieter Just remeber the ID in the data property by casting it to Tobject
       AMenuitem := TMenuItem.Create(AItem);
       AItem.Add(AMenuitem) ;
       AMenuitem.Caption := AQuery.FieldByName('SDescription').AsString;
       AMenuitem.Tag := AQuery.FieldByName('WGroupID').AsInteger;
       RecurceTree(AMenuitem,GroupType);
       if AMenuitem.Count = 0 then
        begin
       If GroupType = 26 then
       AMenuitem.OnClick := OnMenuClickGroup1
       else
       AMenuitem.OnClick := OnMenuClickGroup2 ;
         end;
       AQuery.next ;
      end;
   finally
     AQuery.free ;
   end;
end;
var
i : Integer  ;
begin
 for i := Group1.ComponentCount -1 downto 0 do
       Group1.Components[i].free ;

 for i := Group2.ComponentCount -1 downto 0 do
       Group2.Components[i].free ;
 Group1.Caption := lblRep1.Caption ;
 Group2.Caption := lblRep2.Caption ;
 RecurceTree(Group1,26) ;
 RecurceTree(Group2,27) ;

end;

procedure TfmStockEntry.OnMenuClickGroup2(Sender: Tobject);

 procedure HandelRecord ;
 begin
    tblStockAd.edit ;
    tblStockAdWREPORTINGGROUP2ID.AsInteger := Tcomponent(Sender).Tag ;
    tblStockAd.Post;
 end;
 var
  i : Integer ;
begin
 if OSFMessageDlg(DMTCCoreLink.gettextlang(3023){set reporting group ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
  if (PCStock.ActivePage = TSDetail) or (cxGrid1DBBandedTableView1.Controller.SelectedRowCount =0) then
    begin
       HandelRecord ;
    end else
    begin
       for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
         begin
             cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True ;
             HandelRecord ;
         end;
    end;
  SetButtons ;
 end;
end;

procedure TfmStockEntry.OnMenuClickGroup1(Sender: Tobject);

 procedure HandelRecord ;
 begin
    tblStockAd.edit ;
    tblStockAdWREPORTINGGROUP1ID.AsInteger := Tcomponent(Sender).Tag ;
    tblStockAd.Post;
 end;
 var
  i : Integer ;
begin
 if PCStock.ActivePage = TSList then
 begin
 if OSFMessageDlg(DMTCCoreLink.gettextlang(3022){set reporting group ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
  if (PCStock.ActivePage = TSDetail) or (cxGrid1DBBandedTableView1.Controller.SelectedRowCount =0) then
    begin
       HandelRecord ;
    end else
    begin
       for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
         begin
             cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True ;
             HandelRecord ;
         end;
    end;
  SetButtons ;
 end;
 end else
 begin

    if not ZQStockMultigroup.Locate('WGROUPID',Tcomponent(Sender).Tag,[]) then
      begin
       ZQStockMultigroup.Append ;
       ZQStockMultigroupWGROUPID.AsInteger := Tcomponent(Sender).Tag;
       ZQStockMultigroup.Post ;


      end;
 end;
end;

procedure TfmStockEntry.BRecalcpercentClick(Sender: TObject);
var
   Total,TotalValue,Temp1,CalulatedTotal : Double ;
begin
Total:=0 ;
TotalValue :=0 ;
QBOM.DisableControls ;
try
 QBOM.First ;
while not QBOM.eof do
 begin
   Total := Total + QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
   if rgRecalcBase.ItemIndex =0 then
      TotalValue := TotalValue + (QBOM.FieldByName('FQTY').AsFloat *  TDataBaseStockRoutines.getAvgStockCost(QBOM.FieldByName('WLINKEDSTOCKID').AsInteger))
      else
       TotalValue := TotalValue + (QBOM.FieldByName('FQTY').AsFloat *  TDataBaseStockRoutines.getStockPrice(0,QBOM.FieldByName('WLINKEDSTOCKID').AsInteger,1)) ;


   QBOM.next ;
 end;

     CalulatedTotal := 0 ;
     // not 100 so we make a redevide ;
     QBOM.First ;
      while not QBOM.eof do
         begin
           QBOM.Edit ;
           if TotalValue <> 0 then
            begin
            if rgRecalcBase.ItemIndex =0 then
            temp1 := TDataBaseStockRoutines.getAvgStockCost(QBOM.FieldByName('WLINKEDSTOCKID').AsInteger)
            else
            temp1 := TDataBaseStockRoutines.getStockPrice(0,QBOM.FieldByName('WLINKEDSTOCKID').AsInteger,1) ;

            temp1 := QBOM.FieldByName('FQTY').AsFloat * temp1 ;
            temp1 := (temp1 / TotalValue) * 100 ;
            QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat := TDataBaseLedgerRoutines.RoundToLow(temp1,10) ;
            CalulatedTotal := CalulatedTotal + QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
            end;

           QBOM.Post ;
           QBOM.next ;
           if (QBOM.Eof) and (CalulatedTotal <> 100.00 ) and (CalulatedTotal <> 0) then
             begin
              // lastone adds up.

              QBOM.Edit ;
              QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat := 100 - (CalulatedTotal- QBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat) ;
              QBOM.Post ;
              QBOM.next ;
            end;
         end;
  finally
   QBOM.EnableControls ;
  end;
end;

procedure TfmStockEntry.Next1Click(Sender: TObject);
begin
 cxGrid1DBBandedTableView1.Controller.FocusedRowIndex :=  cxGrid1DBBandedTableView1.Controller.FocusedRowIndex + 1 ;
 LoadStockToGui ;
end;

procedure TfmStockEntry.Prev1Click(Sender: TObject);
begin
 cxGrid1DBBandedTableView1.Controller.FocusedRowIndex :=  cxGrid1DBBandedTableView1.Controller.FocusedRowIndex - 1 ;
 LoadStockToGui ;
end;

procedure TfmStockEntry.Postandnext1Click(Sender: TObject);
begin
 BSaveClick(PopupMenu1);
 cxGrid1DBBandedTableView1.Controller.FocusedRowIndex :=  cxGrid1DBBandedTableView1.Controller.FocusedRowIndex + 1 ;
 LoadStockToGui ;
end;

procedure TfmStockEntry.Postandprev1Click(Sender: TObject);
begin
 BSaveClick(PopupMenu1);
 cxGrid1DBBandedTableView1.Controller.FocusedRowIndex :=  cxGrid1DBBandedTableView1.Controller.FocusedRowIndex - 1 ;
 LoadStockToGui ;
end;

procedure TfmStockEntry.CalcBomCostPrice;
var
 Total,TotalPrice : Double ;
 ABookmark : {$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
begin
 total := 0 ;
 TotalPrice := 0 ;
 if not QBOM.IsEmpty then
 begin

 ABookmark := QBOM.Bookmark ;
 QBOM.DisableControls ;
 try
 QBOM.first ;

 while not QBOM.eof do
   begin
      TotalPrice := TotalPrice + QBOMFSELLINGPRICE2.AsFloat * QBOMFQTY.AsFloat ;
      Total := Total + QBOMFUNITAVECOST.AsFloat * QBOMFQTY.AsFloat ;
      QBOM.Next ;
   end;
 QBOM.Bookmark := ABookmark ;
 finally
 QBOM.FreeBookmark(ABookmark);
 QBOM.EnableControls ;
 end;
 LTotalCostPrice.Caption := DMTCCoreLink.GetTextLangNoAmp(414) + ' ' + FormatFloat('0.0000',Total);
 LTotalPrice.Caption := DMTCCoreLink.GetTextLangNoAmp(20065) + ' ' + FormatFloat('0.0000',TotalPrice);


 end;
 LastTotalBomCost := Total ;
end;

procedure TfmStockEntry.BDissembleClick(Sender: TObject);

var
  tmpInt,TransId:Integer;
  aQtyStr : String ;
begin
   OnProgressBatchPost := OnHandelProgress;
   try


     aQtyStr :=  tblStockAdFQTYONHAND.AsString  ;
     if not InputQuery('Quantity','Enter quantity',aQtyStr) then
       begin
            exit ;
       end;
     aQtyStr := StringReplace(aQtyStr,'.', DecimalSeparator,[rfReplaceAll]);  
     DMTCCoreLink.TheZConnection.StartTransaction ;
     try
     // Create Doc and Post it with DocType=16
     // Create  1 line in Doc Header
     aDMCoreDocData.ZQDocHead.sql.Text := 'select * from dochead where 1 = 0' ;
     aDMCoreDocData.ZQDocHead.Open;
     aDMCoreDocData.ZQDocHead.Append;
     aDMCoreDocData.ZQDocHeadWUserID.Value := CurrentUser;
     tmpInt:=aDMCoreDocData.ZQDocHeadWDocID.Value;
     aDMCoreDocData.ZQDocHeadWTypeID.Value :=18;
     aDMCoreDocData.ZQDocHeadDDate.Value := now;
     aDMCoreDocData.ZQDocHeadBPosted.Value :=0;
     aDMCoreDocData.ZQDocHeadBPrinted.AsInteger :=  1;
     // naming is wrong but the system must know users. ince its type = 16 i gess it should be ok for now.
     // but we need to change this.
     aDMCoreDocData.ZQDocHeadWSalesmanID.Value :=CurrentUser;
     aDMCoreDocData.ZQDocHeadSDocNo.Value :=  TDataBaseDocumentRoutines.GetAnnyNextNum('SASTOCKADDJUST');
     // post to 0 account
     aDMCoreDocData.ZQDocHeadWACCOUNTID.AsInteger := 0 ;
     aDMCoreDocData.ZQDocHeadSREFERENCE.AsString := StringReplace(BDissemble.Caption,'&','',[rfReplaceAll]) + ' ' + tblStockAdSDESCRIPTION.AsString ;
     aDMCoreDocData.ZQDocHead.Post;
     aDMCoreDocData.ZQDocHead.Close;
     aDMCoreDocData.ZQDocLine.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectdoclineondocid') ;
     aDMCoreDocData.ZQDocLine.ParamByName('WdocId').AsInteger :=  tmpInt ;
     aDMCoreDocData.ZQDocLine.open ;
     aDMCoreDocData.ZQDocLine.Insert ;
     aDMCoreDocData.ZQDocLineWDOCID.AsInteger := tmpInt ;
     aDMCoreDocData.ZQDocLineWDOCLINEID.AsInteger := 1 ;
     aDMCoreDocData.ZQDocLineWSORTNO.AsInteger := 1 ;

     aDMCoreDocData.ZQDocLineWSTOCKID.AsInteger := tblStockAdWStockID.AsInteger ;
     aDMCoreDocData.ZQDocLineWLINETYPEID.AsInteger := 90 ;
     aDMCoreDocData.ZQDocLineWDESCRIPTIONID.AsInteger := DMTCCoreLink.GetAddDescription( StringReplace(BDissemble.Caption,'&','',[rfReplaceAll]) + ' ' + tblStockAdSDESCRIPTION.AsString ,false);
     aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat := StrToFloatDef(aQtyStr,0);
    { if (tblStockAdWSTOCKTYPEID.AsInteger in [1,9]) then
     begin
     CalcBomCostPrice ;
     aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat :=  LastTotalBomCost  ;
     aDMCoreDocData.ZQDocLineFEXCLUSIVEAMT.AsFloat := LastTotalBomCost * aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ;
     end else
     begin   }
        aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat := tblStockAdFUNITAVECOST.AsFloat   ;
        aDMCoreDocData.ZQDocLineFEXCLUSIVEAMT.AsFloat := tblStockAdFUNITAVECOST.AsFloat * aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ;
    // end;

     aDMCoreDocData.ZQDocLine.post ;

     TransId :=0 ;


     ConvertDocumentToBatch(TransId,tmpInt,false,nil,nil,false);
 
     DMTCCoreLink.TheZConnection.Commit ;
     finally
        if DMTCCoreLink.TheZConnection.InTransaction then
           DMTCCoreLink.TheZConnection.Rollback ;
     end;
     aDMCoreDocData.ZQDocLine.close ;
     aDMCoreDocData.ZQDocHead.close ;

   tmpInt := tblStockAdWSTOCKID.AsInteger ;
   tblStockAd.close ;
   tblStockAd.open ;
   tblStockAd.Locate('WSTOCKID',tmpInt,[]) ;
   pbPanel.Visible := false ;
   OSFMessageDlg(DebugMsg,mtConfirmation,[mbok],0,true);

  finally
     OnProgressBatchPost := nil ;
  end;
end;

procedure TfmStockEntry.BAssembleClick(Sender: TObject);
var
  tmpInt,TransId:Integer;
  aQtyStr, Temp : String ;
begin
   OnProgressBatchPost := OnHandelProgress;
   try     

    DebugMsg := '' ;

    Temp := DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] ;
    DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] := '-1' ;


     aQtyStr :=  FloatToStr(TDataBaseStockRoutines.GetStockQty(tblStockAdWSTOCKID.AsInteger)) ;
     DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] := Temp ;
     if not InputQuery('Quantity','Enter quantity',aQtyStr) then
       begin
            exit ;
       end;
     aQtyStr := StringReplace(aQtyStr,'.', DecimalSeparator,[rfReplaceAll]);
    DMTCCoreLink.TheZConnection.StartTransaction ;
    try
     // Create Doc and Post it with DocType=16
     // Create  1 line in Doc Header
     aDMCoreDocData.ZQDocHead.sql.Text := 'select * from dochead where 1 = 0' ;
     aDMCoreDocData.ZQDocHead.Open;
     aDMCoreDocData.ZQDocHead.Append;
     aDMCoreDocData.ZQDocHeadWUserID.Value := CurrentUser;
     tmpInt:=aDMCoreDocData.ZQDocHeadWDocID.Value;
     aDMCoreDocData.ZQDocHeadWTypeID.Value :=19;
     aDMCoreDocData.ZQDocHeadDDate.Value := now;
     aDMCoreDocData.ZQDocHeadBPosted.Value :=0;
     aDMCoreDocData.ZQDocHeadBPrinted.AsInteger :=  1;
     // naming is wrong but the system must know users. ince its type = 16 i gess it should be ok for now.
     // but we need to change this.
     aDMCoreDocData.ZQDocHeadWSalesmanID.Value :=CurrentUser;
     aDMCoreDocData.ZQDocHeadSDocNo.Value :=  TDataBaseDocumentRoutines.GetAnnyNextNum('SASTOCKADDJUST');
     aDMCoreDocData.ZQDocHeadSREFERENCE.AsString :=  StringReplace(BAssemble.Caption,'&','',[rfReplaceAll]) + ' ' + tblStockAdSDESCRIPTION.AsString  ;
     // post to 0 account
     aDMCoreDocData.ZQDocHeadWACCOUNTID.AsInteger := 0 ;

     aDMCoreDocData.ZQDocHead.Post;
     aDMCoreDocData.ZQDocHead.Close;
     aDMCoreDocData.ZQDocLine.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectdoclineondocid') ;
     aDMCoreDocData.ZQDocLine.ParamByName('WdocId').AsInteger :=  tmpInt ;
     aDMCoreDocData.ZQDocLine.open ;
     aDMCoreDocData.ZQDocLine.Insert ;
     aDMCoreDocData.ZQDocLineWDOCID.AsInteger := tmpInt ;
     aDMCoreDocData.ZQDocLineWDOCLINEID.AsInteger := 1 ;
     aDMCoreDocData.ZQDocLineWSORTNO.AsInteger := 1 ;

     aDMCoreDocData.ZQDocLineWSTOCKID.AsInteger := tblStockAdWStockID.AsInteger ;
     aDMCoreDocData.ZQDocLineWLINETYPEID.AsInteger := 90 ;
     aDMCoreDocData.ZQDocLineWDESCRIPTIONID.AsInteger := DMTCCoreLink.GetAddDescription( StringReplace(BAssemble.Caption,'&','',[rfReplaceAll]) + ' ' + tblStockAdSDESCRIPTION.AsString ,false);


     aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat := StrToFloatDef(aQtyStr,0);

     if (tblStockAdWSTOCKTYPEID.AsInteger in [1,9]) then
     begin
     CalcBomCostPrice ;
     aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat := LastTotalBomCost  ;
     aDMCoreDocData.ZQDocLineFEXCLUSIVEAMT.AsFloat := LastTotalBomCost * aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ;
     end else
     begin
        aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat := tblStockAdFUNITAVECOST.AsFloat  ;
        aDMCoreDocData.ZQDocLineFEXCLUSIVEAMT.AsFloat := tblStockAdFUNITAVECOST.AsFloat * aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ;
     end;
     aDMCoreDocData.ZQDocLine.post ;

     TransId :=0 ;
     ConvertDocumentToBatch(TransId,tmpInt,false,nil,nil,false);

     aDMCoreDocData.ZQDocLine.close ;
     aDMCoreDocData.ZQDocHead.close ;

     if DMTCCoreLink.TheZConnection.InTransaction then
        DMTCCoreLink.TheZConnection.Commit ;

    finally
     if DMTCCoreLink.TheZConnection.InTransaction then
        DMTCCoreLink.TheZConnection.Rollback ;
    end;

   tmpInt := tblStockAdWSTOCKID.AsInteger ;
   tblStockAd.close ;
   tblStockAd.open ;
   tblStockAd.Locate('WSTOCKID',tmpInt,[]) ;
    pbPanel.Visible := false ;
    OSFMessageDlg(DebugMsg,mtConfirmation,[mbok],0,true);
  finally
     OnProgressBatchPost := nil ;
  end;

end;

procedure TfmStockEntry.QBOMBeforeInsert(DataSet: TDataSet);
begin
 if not QBOM.ControlsDisabled then
    Abort ; 
end;

procedure TfmStockEntry.pmExtraActionsPopup(Sender: TObject);
var
 i : Integer ;
 aItem : TMenuItem ;
begin
 if Group1.Parent <>  pmExtraActions.Items then
            begin
             Group1.Parent.Remove(Group1);
             pmExtraActions.Items.Add(Group1);
            end;
BAssemble.Visible := tblStockAdWSTOCKTYPEID.AsInteger = 9;
BDissemble.Visible := tblStockAdWSTOCKTYPEID.AsInteger = 9;
Openinbrowserfromimplink1.Visible := false ;

  for i :=  Openinbrowserfromimplink1.Count -1 downto 0 do
   begin
    AItem  := Openinbrowserfromimplink1.Items[i] ;
    Openinbrowserfromimplink1.Delete(i) ;
    aItem.Free ;
   end;
 if tblStockAd.IsEmpty then exit ;


 ZQGen.SQL.Text := 'Select distinct a.imp_extid,b.imp_name,b.IMP_STOCKURL from imp_link a join IMP_SOURCE b ' +
   ' on a.IMP_SOURCEID = b.IMP_SOURCEID where WStockid= ' +  tblStockAdWSTOCKID.AsString +
   ' and b.IMP_STOCKURL <> ' + QuotedStr('') +  ' order by 2';
   ZQGen.Open ;
   AStockLinksList.Clear ;
   i := 0 ;
   while not ZQGen.Eof do
       begin
         if (ZQGen.FieldByName('IMP_STOCKURL').AsString = '') or (ZQGen.FieldByName('imp_extid').AsString = '') then
           begin
             ZQGen.Next ;
             Continue ;
           end;
         aItem := TMenuItem.Create(Openinbrowserfromimplink1) ;
         aItem.Caption := ZQGen.fields[1].AsString ;
         AStockLinksList.Add(TDatabaseTableRoutines.ReplaceParams(ZQGen.fields[2].AsString,'ID='+ZQGen.fields[0].AsString)) ;

         aItem.Tag := i ;
         inc(i);
         aItem.OnClick := Openinbrowserfromimplink1Click ;
         Openinbrowserfromimplink1.Add(aItem);
         ZQGen.next ;
       end;
   Openinbrowserfromimplink1.Visible := Openinbrowserfromimplink1.Count <>0 ;
end;

procedure TfmStockEntry.CBReportDropDown(Sender: TObject);
begin
 CBReport.Perform(CB_SETDROPPEDWIDTH, 250, 0);
end;

procedure TfmStockEntry.OnHandelProgress(var Stop: Boolean; AText: String;
  AMax, APostition, aTransId: Integer);
begin
 DebugMsg := DebugMsg + #13 + #10 + AText ;
 pbPanel.Visible := true ;
 lblMessages.Caption := AText ;
 if AMax <> 0 then
 begin
 pb.Max := AMax ;
 pb.Position := APostition ;
 end;
 pbPanel.Repaint ;
 Application.ProcessMessages ;

end;

procedure TfmStockEntry.BSetSelPRiceToClick(Sender: TObject);
 procedure HandelRecord ;
 begin
    tblStockAd.edit ;
    tblStockAdFSELLINGPRICE1.AsFloat := StrToFloatDef(EsetPrice1.Text,0) ;
    tblStockAdFSELLINGPRICE2.AsFloat := StrToFloatDef(EsetPrice2.Text,0) ;
    tblStockAdFSELLINGPRICE3.AsFloat := StrToFloatDef(EsetPrice3.Text,0) ;
    tblStockAd.Post;
 end;
 var
  i : Integer ;
begin
 if OSFMessageDlg(DMTCCoreLink.gettextlang(1362) +'?'{set reporting group ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
  if (PCStock.ActivePage = TSDetail) or (cxGrid1DBBandedTableView1.Controller.SelectedRowCount =0) then
    begin
       HandelRecord ;
    end else
    begin
       for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
         begin
             cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True ;
             HandelRecord ;
         end;
    end;
  SetButtons ;
 end;
end;

procedure TfmStockEntry.pcDetailsListExpClick(Sender: TObject);
begin

end;
procedure TfmStockEntry.pcDetailsChange(Sender: TObject);
var
 i :  integer ;
 
 ACaption : TStaticText ;
 aPanel,aPanel2 : Tpanel ;
 AExpButton : Tbutton ;
 TotalCummCount : Double ;
begin
  if pcDetails.ActivePage = TSMovements then
   begin
    cxGrid3DBTableView1.DataController.Filter.Clear ;
     while cxGrid3DBTableView1.SortedItemCount <> 0 do
      cxGrid3DBTableView1.SortedItems[0].SortOrder := soNone ;

  ZQStockTrans.SQL.Text := SSelectFromStockTrn +  ' where dochead.wtypeid is not null and  stocktrn.WStockID = ' + IntToStr(tblStockAdWStockID.AsInteger) +' order by ddate ,dochead.SDocno ' ;
  ZQStockTrans.Open ;
  ZQStockTrans.DisableControls ;
  try
  TotalCummCount := tblStockAdFOPENINGQTY.AsFloat ;
  while not ZQStockTrans.Eof do
   begin
     TotalCummCount := TotalCummCount + ZQStockTransFQTY.AsFloat ;
     ZQStockTrans.edit ;
     ZQStockTransCUMMTOT.Value :=   TotalCummCount ;
     ZQStockTrans.Post ;
     ZQStockTrans.Next ;
   end;
   finally
     ZQStockTrans.EnableControls ;
     edtQtyonHand.Text := FloatToStr(TotalCummCount );
   end;
  end else
  if pcDetails.ActivePage = TSInvoices then
   begin
    ZQDocs.Close ;
    ZQDocs.Params[0].AsInteger := tblStockAdWStockID.AsInteger ;
    ZQDocs.Params[1].AsInteger := tblStockAdWStockID.AsInteger ;
    ZQDocs.open ;
   end else
  if pcDetails.ActivePage = tsBackorder then
   begin
     MyBackord.ZQBackorder.Close;
     MyBackord.ZQBackorder.Open;
     MyBackord.PageControl1.ActivePage := MyBackord.tslist ;
   end else
   if pcDetails.ActivePage = tsFullList then

   begin
    if  APanelTreeView.Count <>  0 then exit ;

      for i :=  0 to pcDetails.PageCount -1 do
       if pcDetails.Pages[i].TabVisible then
        begin
          if pcDetails.Pages[i].ControlCount = 1 then
           begin
           if pcDetails.Pages[i].Controls[0] is TForm then
              begin
                 if pcDetails.Pages[i]  = tsBackorder then continue;
                with APanelTreeView.Add as  TPanelTreeViewItem do
                  begin
                     cbGotoInput.Items.AddObject(pcDetails.Pages[i].Caption,pcDetails.Pages[i].Controls[0]);
                     Control :=  pcDetails.Pages[i].Controls[0];
                     ItemName :=   pcDetails.Pages[i].Caption ;
                     Order := i ;
                  end;
                 pcDetails.Pages[i].TabVisible := false ;
               { aPanel := Tpanel.create(tsFullList) ;
                aPanel.Align := alTop ;
                aPanel.Caption := '' ;
                aPanel.Parent :=  ScrollBox3 ;
                aPanel.Height := 19 ;
                aPanel.Tag := 1 ;
                aPanel.Constraints.MinWidth := 400 ;
                



                ACaption := TStaticText.create(tsFullList) ;
                ACaption.Align := alTop ;
                ACaption.Caption := pcDetails.Pages[i].Caption + ' +' ;
                ACaption.Parent :=  aPanel ;
                ACaption.OnClick := pcDetailsListExpClick ;
                aPanel2  := Tpanel.create(tsFullList) ;
                aPanel2.Align := alLeft ;
                aPanel2.Caption := '' ;
                aPanel2.Width := 20 ;
                aPanel2.Parent :=  aPanel ;
                (pcDetails.Pages[i].Controls[0] as TForm).Align := alClient ;
                (pcDetails.Pages[i].Controls[0] as TForm).Parent := aPanel ;

                pcDetails.Pages[i].TabVisible := false ;

                cbFocusTab.items.InsertObject(0,ACaption.Caption,aPanel);  }
              end else
              if pcDetails.Pages[i].Controls[0] is TPanel then
              begin
               with APanelTreeView.Add as  TPanelTreeViewItem do
                  begin
                     cbGotoInput.Items.AddObject(pcDetails.Pages[i].Caption,pcDetails.Pages[i].Controls[0]);
                     Control :=  pcDetails.Pages[i].Controls[0];
                     ItemName :=   pcDetails.Pages[i].Caption ;
                     Order := i ;
                  end;
                pcDetails.Pages[i].TabVisible := false ;
              {  aPanel := Tpanel.create(tsFullList) ;
                aPanel.Align := alTop ;
                aPanel.Caption := '' ;
                aPanel.Height := 19 ;
                aPanel.Parent :=  ScrollBox3 ;
                aPanel.Tag := 1 ;
                aPanel.Constraints.MinWidth := 400 ;

                ACaption := TStaticText.create(tsFullList) ;
                ACaption.Align := alTop ;
                ACaption.Caption := pcDetails.Pages[i].Caption + ' +' ;
                ACaption.Parent :=  aPanel ;
                ACaption.OnClick := pcDetailsListExpClick ;
                aPanel2  := Tpanel.create(tsFullList) ;
                aPanel2.Align := alLeft ;
                aPanel2.Caption := '' ;
                aPanel2.Width := 20 ;
                aPanel2.Parent :=  aPanel ;


                (pcDetails.Pages[i].Controls[0] as TPanel).Align := alClient ;
                (pcDetails.Pages[i].Controls[0] as TPanel).Parent := aPanel ;


                pcDetails.Pages[i].TabVisible := false ;
                cbFocusTab.items.InsertObject(0,ACaption.Caption,aPanel); }
              end;
           end else
           begin

           end;
        end;
      APanelTreeView.Construct(ScrollBox3);
   end;
  if cbGotoInput.Items.Count <> 0 then
     cbGotoInput.ItemIndex := 0 ;
end;

procedure TfmStockEntry.dbgAdStockEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
ctrlDown := (ssCtrl in Shift);
 if ((key = ord('a')) or  (key = ord('A') )) and ctrlDown then
     begin
       cxGrid1DBBandedTableView1.Controller.SelectAll;
     end;
end;

procedure TfmStockEntry.EUnpostedDblClick(Sender: TObject);
var
 Total , QtyOnHand,QtyOnHand2 : Variant ;
 AString : String ;
begin

   if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
   begin
    AString := GetDocName(16) + #13+#10;
    AString := AString  + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,16,-1)
    + #13+#10;
    AString := AString  +  GetDocName(17)+ #13+#10;
    AString := AString + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,17,-1)
    + #13+#10;

   end ;
   AString := AString + GetDocName(10) + #13+#10;
  AString := AString  + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,10,-1)
  + #13+#10;
  AString := AString  +  GetDocName(11)+ #13+#10;
  AString := AString + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,11,-1)
  + #13+#10;

  AString := AString  +  GetDocName(12)+ #13+#10;
  AString := AString +  TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,12,-1)+ #13+#10;
  AString := AString  +  GetDocName(13)+ #13+#10;
  AString := AString +  TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,13,-1)+ #13+#10;
  AString := AString  +  GetDocName(14)+ #13+#10;
 
  AString := AString + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,14,-1)+ #13+#10;
  AString := AString  +  GetDocName(15)+ #13+#10;
  AString := AString + TDataBaseStockRoutines.GetUnpostedStockItemListFromType(tblStockAdWSTOCKID.AsInteger,15,-1);




 OSFMessageDlg(AString,mtInformation,[mbok],0,true) ;
end;

procedure TfmStockEntry.OnMenuCopy(Sender: TObject);
var
 i : Integer ;
begin

 CopyFromStockID := tblStockAdWSTOCKID.AsInteger ;
 for i := 0 to Pluginscopyto1.Count -1 do
    begin
      Pluginscopyto1.Items[i].Enabled := Pluginscopyto1.Items[i].Tag = TComponent(sender).Tag ;
    end;
end;

procedure TfmStockEntry.OnMenuPast(Sender: TObject);
    var
 AMessage : String ;

  i : Integer ;
begin
if OSFMessageDlg('Erase old data and copy for plugin '  +  Tmenuitem(sender).Caption + ' from item ' + TDataBaseStockRoutines.GetStockFullDescription(CopyFromStockID),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

cxGrid1DBBandedTableView1.Controller.FocusedRow.Selected :=  True;
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
  begin
  cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True;
  if  tblStockAdWSTOCKID.AsInteger <> CopyFromStockID then
  begin
 AMessage := 'DELETEX=' + IntToStr(tblStockAdWSTOCKID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
 AMessage := 'XCOPY=' + IntToStr(CopyFromStockID) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
 AMessage := 'POST=' + IntToStr(tblStockAdWSTOCKID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(APluginsFormsList.Objects[(Sender as tcomponent).tag]),PChar(AMessage));
 end;
 end;
end;

procedure TfmStockEntry.OnMenuPluginAct1(Sender: TObject);
var
 AMessage : String ;
  AForm : TForm ;

begin
 AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'') ;
 try

 AMessage := 'CONTEXT=' + IntToStr(tblStockAdWSTOCKID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;

procedure TfmStockEntry.OnMenuPluginAct2(Sender: TObject);
var
 AMessage : String ;
 AForm : TForm ;
  i : Integer ;
begin
if OSFMessageDlg('Continue this mass action?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

cxGrid1DBBandedTableView1.Controller.FocusedRow.Selected :=  True ;
 AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'') ;
 try
   AMessage := 'CONTEXTINIT2=TRUE' ;
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));

 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
  begin
  cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True;
   AMessage := 'CONTEXT2=' + IntToStr(tblStockAdWSTOCKID.AsInteger) ;
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 end;

 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;

procedure TfmStockEntry.ZQStockoptionsBeforePost(DataSet: TDataSet);
begin
  ZQStockoptionsSBARCODE.AsString := UpperCase(ZQStockoptionsSBARCODE.AsString) ;
end;

procedure TfmStockEntry.ZQStockoptionsBeforeScroll(DataSet: TDataSet);
begin



   if poptfreefields.Visible then


   if ( ZQStockoptions.UpdateStatus in[usUnmodified,usModified]) and (DataSet.FieldByName('WSTOCKOPTIONSID').AsInteger <> 0) then
       begin
       try
         aOptFreeFields.EditFormCollection.Save(DataSet.FieldByName('WSTOCKOPTIONSID').AsInteger );
       except

       end;
       end;
end;

procedure TfmStockEntry.GenMenuCopy(Sender: TObject);
var
 i : Integer ;
begin
 if tblStockAd.IsEmpty then exit ;

 CopyData := DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKCOPY'+ IntToStr(TComponent(sender).Tag)),'WSTOCKID='+ tblStockAdWSTOCKID.AsString   ))  ;

 for i := 0 to GenCopyto.Count -1 do
    begin
      GenCopyto.Items[i].Enabled := GenCopyto.Items[i].Tag = TComponent(sender).Tag ;
    end;
end;

procedure TfmStockEntry.GenMenuPast(Sender: TObject);
  var
  AMessage,SqlToExecute : String ;
  i,x : Integer ;
  AQuery : TuniQuery ;
begin
 if OSFMessageDlg('Replace old data for '  +  Tmenuitem(sender).Caption + '?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

  AQuery := TuniQuery.create(self) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
 cxGrid1DBBandedTableView1.Controller.FocusedRow.Selected :=  True ;
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRowCount -1 do
  begin
    cxGrid1DBBandedTableView1.Controller.SelectedRows[i].Focused := True;
    SqlToExecute := TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('STOCKPAST'+ IntToStr(TComponent(sender).Tag)),'DATA=' + VarToStr(CopyData) + #13 +#10 + 'WSTOCKID='+ tblStockAdWSTOCKID.AsString  )  ;
    if pos('@@GO@@',SqlToExecute) = 0 then
      SqlToExecute := SqlToExecute + '@@GO@@' ;

    while pos('@@GO@@',SqlToExecute) > 1 do
      begin
       AQuery.SQL.Text:= trim(copy(SqlToExecute,1,pos('@@GO@@',SqlToExecute)-1));
       Delete(SqlToExecute,1,pos('@@GO@@',SqlToExecute)+ 5);
         for  x := 0 to AQuery.Params.Count -1 do
            AQuery.Params[x].Value := CopyData;
            AQuery.ExecSQL ;

      end;


   end;
  finally
    AQuery.free ;
  end;
 RefreshData ;
end;

procedure TfmStockEntry.ZQDescriptionsBeforePost(DataSet: TDataSet);
begin
 if ZQDescriptionsWSTOCKDESCID.AsInteger = 0 then
    ZQDescriptionsWSTOCKDESCID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_STOCKDESC_ID');
if not ZQDescriptions.ControlsDisabled then
 if PEditOneLang.Visible then
    begin
     ZQDescriptionsSEXTRADESCRIPTION.AsString := MEditLang.Text ;

    end;
end;

procedure TfmStockEntry.BlangfreefieldsClick(Sender: TObject);
begin
  if cbCurLang.ItemIndex = -1 then exit ;
   if AFreeformArray[cbCurLang.ItemIndex].Visible then
    HideTransfields
    else
    AFreeformArray[cbCurLang.ItemIndex].Visible := true ;

    PLangText.Visible := not AFreeformArray[cbCurLang.ItemIndex].Visible ;





end;

procedure TfmStockEntry.HideTransfields;
var
 i : Integer ;
begin
 for i := low(AFreeformArray) to high(AFreeformArray) do
  AFreeformArray[i].Visible := false ;
PLangText.Visible := true ;
end;

procedure TfmStockEntry.QBOMCalcFields(DataSet: TDataSet);
begin
   QBOMLSTOCKCODE.AsString := TDataBaseStockRoutines.GetStockCode(QBOMWLINKEDSTOCKID.AsInteger) ;
   QBOMLSTOCKDESC.AsString := TDataBaseStockRoutines.GetStockDescription(QBOMWLINKEDSTOCKID.AsInteger) ;
end;


procedure TfmStockEntry.PopupMenu1Popup(Sender: TObject);
begin
  addgroup1.Visible := False ;
   LastControlForCopy := nil;
        Cut1.Visible := false;
        Paste1.Visible := false;
        Copy2.Visible := false;
        N6.Visible := false;
        Selectall1.Visible := false;
 if  Screen.ActiveControl  is TCustomEdit then
    begin
        LastControlForCopy := Screen.ActiveControl  as TCustomEdit ;
        N6.Visible := true;
        Cut1.Visible := true;
        Paste1.Visible := true;
        Copy2.Visible := true;
        Selectall1.Visible := true;
    end;
 if  Screen.ActiveControl  = cxGridmmgroup then
    begin
       addgroup1.Visible := True ;
       if addgroup1.Count = 0 then
          begin
             Group1.Parent.Remove(Group1);
             addgroup1.Add(Group1);
          end;
    end;
  urlencode1.Visible :=  Screen.ActiveControl  = DBMemo1 ;
  urldecode1.Visible :=  Screen.ActiveControl  = DBMemo1 ;
end;

procedure TfmStockEntry.Cut1Click(Sender: TObject);
begin

      LastControlForCopy.CutToClipboard ;

end;

procedure TfmStockEntry.Copy2Click(Sender: TObject);
begin
 LastControlForCopy.CopyToClipboard ;

end;

procedure TfmStockEntry.Paste1Click(Sender: TObject);
begin
 LastControlForCopy.PasteFromClipboard ;

end;

procedure TfmStockEntry.Selectall1Click(Sender: TObject);
begin
  LastControlForCopy.SelectAll ;
end;

procedure TfmStockEntry.ZQStockoptionsCalcFields(DataSet: TDataSet);
begin
  ZQStockoptionsEXPECTED.AsFloat := ZQStockoptionsFQTYONHAND.AsFloat - TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersOptions(ZQStockoptionsWSTOCKID.AsInteger, 0,ZQStockoptionsWITEMOPTIONVALUE1ID.AsInteger,
  ZQStockoptionsWITEMOPTIONVALUE2ID.AsInteger,
  ZQStockoptionsWITEMOPTIONVALUE3ID.AsInteger,
  ZQStockoptionsWITEMOPTIONVALUE4ID.AsInteger,
  ZQStockoptionsWITEMOPTIONVALUE5ID.AsInteger,0);
end;

procedure TfmStockEntry.urlencode1Click(Sender: TObject);

var
 i : Integer ;
 aString : String ;
begin
     DBMemo1.DataSource.DataSet.Edit ;
     aString := DBMemo1.Text;
   //  aString := StringReplace(aString,'%','%25',[rfReplaceAll] );
     aString := StringReplace(aString,'&','%26',[rfReplaceAll] );
     aString := StringReplace(aString,'+','%2B',[rfReplaceAll] );
     aString := StringReplace(aString,'?','%3F',[rfReplaceAll] );

     for i := 128 to 255 do
         begin

            aString := StringReplace(aString,char(i),'%'+ IntToHex(i,2) ,[rfReplaceAll] );
         end;
     DBMemo1.Text := aString ;

end;

procedure TfmStockEntry.urldecode1Click(Sender: TObject);
var
 i : Integer ;
 aString : String ;
begin
     DBMemo1.DataSource.DataSet.Edit ;
     aString := DBMemo1.Text;
     for i := 128 to 255 do
         begin

            aString := StringReplace(aString,'%'+ IntToHex(i,2),char(i),[rfReplaceAll] );
         end;

     aString := StringReplace(aString,'%26','&',[rfReplaceAll] );
     aString := StringReplace(aString,'%2B','+',[rfReplaceAll] );
     aString := StringReplace(aString,'%3F','?',[rfReplaceAll] );
 //    aString := StringReplace(aString,'%25','%',[rfReplaceAll] );
     DBMemo1.Text := aString ;

end;

procedure TfmStockEntry.ZQStockTransBeforeOpen(DataSet: TDataSet);
begin

 DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet, SSelectFromStockTrn +  '  where WStockID = 0');

end;


procedure TfmStockEntry.tblStockAdBeforePost(DataSet: TDataSet);
var
 Asql : TuniQuery ;
begin
if DataSet.State = dsinsert then
  begin
  if (DataSet.FindField('FQtyOnHand') <> nil) and (DataSet.FindField('FOPENINGQTY') <> nil) then
     DataSet.FindField('FOPENINGQTY').AsFloat := DataSet.FindField('FQtyOnHand').AsFloat ;
  exit ;
  end;
try
if (DataSet.FindField('FQtyOnHand') <> nil) and (DataSet.FindField('WStockID')  <> nil) then
 begin

  if VarToStr(DataSet.fieldByName('FQtyOnHand').OldValue) <> '' then
  begin
     if VarToStr(DataSet.fieldByName('FQtyOnHand').OldValue) <> VarToStr(DataSet.fieldByName('FQtyOnHand').Value) then
       begin
        dmDatabase.ZQStockTrans.SQL.Text := SSelectFromStockTrn +  '  where stocktrn.WStockID = ' + DataSet.fieldByName('WStockID').AsString  +' order by ddate desc,dochead.SDocno desc' ;
        dmDatabase.ZQStockTrans.Open;
        CreateStockMovement;
       end;
  end
  else
  if (VarToStr(DataSet.fieldByName('FUnitAveCost').OldValue) <> '') and (DataSet.fieldByName('WStockID').AsString <> '') then
  begin
     if VarToStr(DataSet.fieldByName('FUnitAveCost').OldValue) <> VarToStr(DataSet.fieldByName('FUnitAveCost').Value) then
       begin
         dmDatabase.ZQStockTrans.SQL.Text := SSelectFromStockTrn +  '  where stocktrn.WStockID = ' + DataSet.fieldByName('WStockID').AsString  +' order by ddate desc,dochead.SDocno desc' ;
         dmDatabase.ZQStockTrans.Open;
         CreateStockMovement;
       end;
  end ;
  end;
 except
   // no handel
 end;

 // Taxclass force
if (DataSet.FindField('WINPUTTAX2ID') <> nil) and (DataSet.FindField('WStockID')  <> nil) then
 if DataSet.FindField('WINPUTTAX2ID').asinteger <> 0 then
   begin
      Asql := TuniQuery.create(nil) ;
      try
        Asql.Connection := DMTCCoreLink.TheZConnection ;
        Asql.SQL.Text := 'Select * from STOCKTAXCLASS where WSTOCKCLASSTAXID = ' + IntToStr( DataSet.FindField('WINPUTTAX2ID').asinteger) ;
        Asql.Open ;
        if not Asql.IsEmpty then
           begin
             DataSet.FindField('WInputTaxID').asinteger := Asql.fieldbyname('WINPUTTAX').AsInteger ;
             DataSet.FindField('WOutputTaxID').asinteger := Asql.fieldbyname('WOUTPUTTAX').AsInteger ;
             DataSet.FindField('WSaleSACCOUNTID').asinteger := Asql.fieldbyname('WSALESACCOUNTID').AsInteger ;
             DataSet.FindField('WCostAccountID').asinteger := Asql.fieldbyname('WCOSTACCOUNTID').AsInteger ;
             DataSet.FindField('WStockAccountID').asinteger := Asql.fieldbyname('WSTOCKACCOUNTID').AsInteger ;
           end;
      finally
        Asql.free ;
      end;


   end;
end;

procedure TfmStockEntry.cbDescqtyShowChange(Sender: TObject);
begin
 DBCtrlGrid1.RowCount := StrToIntDef(cbDescqtyShow.Text,2);
 DMTCCoreLink.WriteNwReportOp('STOCK_QTYDECSHOW',IntToStr(DBCtrlGrid1.RowCount));
 if USeHtmlkEditor then
  begin
     if DBCtrlGrid1.RowCount = 1 then
        begin
          DBCtrlGrid1.Visible := False ;
          PEditOneLang.Visible := True ;
          PEditOneLang.Align := alClient;
        end else
        begin
          PEditOneLang.Visible := False ;
          DBCtrlGrid1.Visible := True ;
        end;
  end;
end;

procedure TfmStockEntry.cbGotoInputChange(Sender: TObject);
begin
  ScrollBox3.ScrollInView(
  TControl(TComboBox(Sender).Items.Objects[TComboBox(Sender).ItemIndex])) ;
end;

procedure TfmStockEntry.Masscheck1Click(Sender: TObject);
begin
   DebugMsg := '' ;
   InMassCheck := True ;
   try
    tblStockAd.First ;
    while not tblStockAd.Eof do
      begin
         BEditClick(self);
         BSaveClick(nil);
         tblStockAd.next ;
      end;
  finally
     InMassCheck := False ;
  end;
 OSFMessageDlg('Check finished: ' + #13+#10 + DebugMsg,mtConfirmation,[mbok],0,true) ;
end;

procedure TfmStockEntry.edtDescriptionExit(Sender: TObject);
var
 Abookmark : TBookmark ;
begin
 if tblStockAd.State = dsinsert then
   begin
     ZQDescriptions.DisableControls ;
     try
      Abookmark := ZQDescriptions.Bookmark ;
     ZQDescriptions.first ;
     while not ZQDescriptions.eof do
       begin
       if Trim(ZQDescriptionsSDESCRIPTION.AsString) = '' then
        begin
        ZQDescriptions.edit ;
        ZQDescriptionsSDESCRIPTION.AsString := edtDescription.Text ;
        ZQDescriptions.Post ;
        end;
        ZQDescriptions.next ;
       end;
     ZQDescriptions.Bookmark := Abookmark ;
     finally
       ZQDescriptions.FreeBookmark(Abookmark);
       ZQDescriptions.EnableControls ;
     end;
   end;
end;

procedure TfmStockEntry.edtSellingPrice1DblClick(Sender: TObject);
begin
 if StrToFloatDef(edtSellingPrice2.Text,0) = 0 then
  begin
   edtSellingPrice2.Text := edtSellingPrice1.Text ;
   edtSellingPrice2.Modified := True ;
   edtSellingPrice2Exit(edtSellingPrice2);
  end;
 if StrToFloatDef(edtSellingPrice3.Text,0) = 0 then
   begin
     edtSellingPrice3.Text := edtSellingPrice1.Text ;
      edtSellingPrice3.Modified := True ;
     edtSellingPrice3Exit(edtSellingPrice3);
   end;
end;

procedure TfmStockEntry.edtDescriptionClick(Sender: TObject);
begin
  if ZQDescriptions.IsEmpty then exit ;
  if edtDescription.Text = '' then exit ;
  if OSFMessageDlg('Set description for languages?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
     ZQDescriptions.first ;
    while not ZQDescriptions.eof do
       begin
        ZQDescriptions.edit ;
        ZQDescriptionsSDESCRIPTION.AsString := edtDescription.Text ;
        ZQDescriptionsSEXTRADESCRIPTION.AsString := edtDescription.Text ;
        ZQDescriptions.Post ;
        ZQDescriptions.next ;
       end;
  end;
procedure TfmStockEntry.ZQLinkSaleAfterInsert(DataSet: TDataSet);
begin
  ZQLinkSaleWSTOCKLINKSALEID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_STOCKLINKSALE') ;
  ZQLinkSaleWSTOCKID.AsInteger := 0 ;
  ZQLinkSaleWPRICETYPE.AsInteger := 2 ;
  ZQLinkSaleWSORTID.AsInteger := ZQLinkSale.RecordCount +1 ;
  ZQLinkSaleFEXTRAPRICE.AsFloat := 0 ;

end;

procedure TfmStockEntry.ZQLinkSaleWGROUPIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := DMTCCoreLink.GroupsObject.GetGroupName(sender.AsInteger);
end;

procedure TfmStockEntry.ZQLinkSaleWLINKSTOCKIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := DMTCCoreLink.stockObject.GetStockCodeAndDescription(sender.AsInteger);
end;

procedure TfmStockEntry.DBLookupComboBox7Exit(Sender: TObject);
begin
 ZQLinksubGroup.close ;
 ZQLinksubGroup.Params[0].AsInteger := ZQLinkSaleWGROUPID.AsInteger ;
 ZQLinksubGroup.open ;
end;

procedure TfmStockEntry.ZQLinkSaleAfterScroll(DataSet: TDataSet);
begin
 ZQLinksubGroup.close ;
 ZQLinksubGroup.Params[0].AsInteger := ZQLinkSaleWGROUPID.AsInteger ;
 ZQLinksubGroup.open ;

end;

procedure TfmStockEntry.BlookuplinkstockClick(Sender: TObject);
begin
   if ZQLinkSale.IsEmpty then
     ZQLinkSale.Insert else
     ZQLinkSale.edit ;


   CallLookup('',18,0,' (WStockTypeid <> 4) and (WStockTypeid <> 5) and (WStockTypeid <> 6) and (WStockTypeid <> 7) and (WStockTypeid <> 8)and (WStockTypeid <> 10)');
   //dmDatabase.tblStock.open ;
   if  TDataBaseStockRoutines.GetStockID(ReturnLookup) <> 0 then
    begin
       ZQLinkSaleWLINKSTOCKID.AsInteger :=   TDataBaseStockRoutines.GetStockID(ReturnLookup) ;
    end;

end;

procedure TfmStockEntry.ZQLinkSaleWPRICETYPEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if Sender.AsInteger =0 then
   Text := '+' else
 if Sender.AsInteger = 1 then
    Text := '-' else
      Text := '*' ;
end;

procedure TfmStockEntry.ZQLinkSaleWPRICETYPESetText(Sender: TField;
  const Text: String);
begin
    if Text = '+' then
  Sender.AsInteger := 0
  else  if Text = '-' then
  Sender.AsInteger := 1
   else Sender.AsInteger := 2 ;
end;

procedure TfmStockEntry.BitBtn3Click(Sender: TObject);
begin
 StockLinkDetail := TStockLinkDetail.Create(self);
 try
   StockLinkDetail.BaseQuery := ZQLinkSale ;
   StockLinkDetail.InitFromStock(0) ;
   StockLinkDetail.ShowModal ;
 finally
   FreeAndNil(StockLinkDetail);
 end;
end;

procedure TfmStockEntry.cbTaxclassChange(Sender: TObject);
var
 Asql : TuniQuery ;
begin
 if cbTaxclass.ItemIndex > 0 then
    begin
      GroupBox4.Enabled := false ;
      GroupBox2.Enabled := false ;
      Asql := TuniQuery.create(nil) ;
      try
        Asql.Connection := DMTCCoreLink.TheZConnection ;
        Asql.SQL.Text := 'Select * from STOCKTAXCLASS where WSTOCKCLASSTAXID = ' + IntToStr(Integer(  cbTaxclass.Items.Objects[cbTaxclass.ItemIndex])) ;
        Asql.Open ;
        if not Asql.IsEmpty then
           begin
                edtInput.Tag := Asql.fieldbyname('WINPUTTAX').AsInteger ;
                edtInput.Text := TDataBaseRoutines.GetAccountFullDescription(edtInput.Tag);
                edtOutput.Tag := Asql.fieldbyname('WOUTPUTTAX').AsInteger ;
               // edtOutput.Text := TDataBaseRoutines.GetAccountFullDescription(edtOutput.Tag);
                BBOutputClick(nil);

                edtSales.Tag := Asql.fieldbyname('WSALESACCOUNTID').AsInteger ;
                edtSales.Text := TDataBaseRoutines.GetAccountFullDescription(edtSales.Tag);


                edtCOS.Tag := Asql.fieldbyname('WCOSTACCOUNTID').AsInteger ;
                edtCOS.Text := TDataBaseRoutines.GetAccountFullDescription(edtCOS.Tag);
                edtStockControl.Tag := Asql.fieldbyname('WSTOCKACCOUNTID').AsInteger ;
                edtStockControl.Text := TDataBaseRoutines.GetAccountFullDescription(edtStockControl.Tag);
 

           end;
      finally
        Asql.free ;
      end;
    end else
    begin
      GroupBox4.Enabled := True ;
      GroupBox2.Enabled := True ;
    end;
end;

procedure TfmStockEntry.ZQDocsWTYPEIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case Sender.AsInteger of
   10 : Text := DMTCCoreLink.GetTextLangNoAmp(165) ;
   11 : Text := DMTCCoreLink.GetTextLangNoAmp(706) ;
   12 : Text := DMTCCoreLink.GetTextLangNoAmp(302) ;
   13 : Text := DMTCCoreLink.GetTextLangNoAmp(302) ;
   14 : Text := DMTCCoreLink.GetTextLangNoAmp(418) ;
   15 : Text := DMTCCoreLink.GetTextLangNoAmp(798) ;
   16 : Text := DMTCCoreLink.GetTextLangNoAmp(62) + '+' ;
   17 : Text := DMTCCoreLink.GetTextLangNoAmp(62) + '-' ;
   18 : Text := DMTCCoreLink.GetTextLangNoAmp(3271) ;
   19 : Text := DMTCCoreLink.GetTextLangNoAmp(3270) ;
   end;
end;

procedure TfmStockEntry.ZQDescriptionsAfterScroll(DataSet: TDataSet);
begin
  if PEditOneLang.Visible then
    begin
      MEditLang.Text := ZQDescriptionsSEXTRADESCRIPTION.AsString;

    end;
end;

procedure TfmStockEntry.MEditLangEnter(Sender: TObject);
begin
if not ZQDescriptions.IsEmpty then
  if ZQDescriptions.State = dsbrowse then
    ZQDescriptions.edit ;

end;

{ twf_TfmStockEntry }

constructor twf_TfmStockEntry.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'stock';
  Description := 'Stock edit / add screen';
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;

end;

procedure twf_TfmStockEntry.WorkflowEnd(AForm: TForm);
begin
  inherited;
 OutId := '0' ;
  OutSubid := '0' ;
  if  not TfmStockEntry(AForm).tblStockAd.IsEmpty then
    OutId := TfmStockEntry(AForm).tblStockAd.FieldByname('WSTOCKID').AsString ;
  aform.free ;
end;

function twf_TfmStockEntry.WorkFlowStart: TForm;
var
 aform : TfmStockEntry ;
begin
 try
  aform := TfmStockEntry.create(nil) ;
  Result := aform ;
  Aform.parent := self.parent ;
  Aform.Align := alClient ;
  Aform.BorderStyle := bsNone ;
  Aform.Show ;
 Except
   on e: Exception do
    begin
       aform.free ;
       raise Exception.Create('Workflow:'+ Displayname +'->' +  e.Message );
    end;
 end;
end;
{ twf_TfmStockEntryPlugins }

constructor twf_TfmStockEntryPlugins.Create(AOwner: TComponent);
begin
  inherited;
   Displayname := 'stock-plugins';
   Description := 'Stock plugins  edit / add screen. You must have last id set by the screen before thisone!'+#13+#10 +
   'PLUGIN hold the plugin name.';
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

procedure twf_TfmStockEntryPlugins.WorkflowEnd(AForm: TForm);
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
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToStockRoutineName);
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
                 aplugin.aPluginEnabled('STOCK',APChar,ImageIndex);
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

function twf_TfmStockEntryPlugins.WorkFlowStart: TForm;
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
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToStockRoutineName);
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
                 AMessage := 'STOCK' ;
                 aplugin.aPluginEnabled(PChar(AMessage),APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);

              end ;
          end;
             if not IsEnable then
                raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not found or loaded.' );
     Result := aplugin.aLoadFormPlugin(Application,pchar(AMessage)) ;
      AMessage := 'EDIT=' +  Inparams.ParamByName('LASTID').AsString  ;
      aplugin.aMessageFormPlugin(Result,PChar(AMessage));
end;

procedure TfmStockEntry.TshowTumbTimer(Sender: TObject);
var
 Afile : String ;
begin
 TshowTumb.Enabled := False ;
 Afile := TDataBaseStockRoutines.getImage(tblStockAdWSTOCKID.AsInteger) ;

 if FileExists(Afile) then
   begin
    try
     ImTumb.Picture.LoadFromFile(Afile)
    except
      ImTumb.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'Bin\themes\classic\Stock.ico') ;
    end;
   end  else
   ImTumb.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'Bin\themes\classic\Stock.ico')

end;

procedure TfmStockEntry.tblStockAdAfterScroll(DataSet: TDataSet);
begin
 TshowTumb.Enabled := False ;
 TshowTumb.Enabled := True ;
end;

procedure TfmStockEntry.cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  Var
 Lastcode,aFieldname,aRealFieldName : String ;
begin

  aFieldname  := '' ;
 if cxGrid1DBBandedTableView1.Controller.FocusedColumn = nil then exit ;
  aRealFieldName := TcxGridDBBandedColumn(cxGrid1DBBandedTableView1.Controller.FocusedColumn).DataBinding.FieldName ;
  aFieldname  := 'W'+copy(aRealFieldName,2,255) +'ID' ;

  Lastcode := tblStockAd.fieldByName(aRealFieldName).AsString ;

 fmLookup.IsShowForm := false ;
  if  (CompareText(aRealFieldName,'sinputtax')= 0)
    OR (CompareText(aRealFieldName,'soutputtax')= 0) then
      CallLookup(Lastcode , 6,tblStockAd.fieldByName(aFieldname).AsInteger);
  if (CompareText(aRealFieldName,'scostAccount')= 0)
    Or (CompareText(aRealFieldName,'sSaleSACCOUNT')= 0)
    Or (CompareText(aRealFieldName,'sStockAccount')= 0)  then
      CallLookup(Lastcode , 2,tblStockAd.fieldByName(aFieldname).AsInteger);

  if (CompareText(aRealFieldName,'SWSUPPLIER1ID')= 0) then
    begin
      CallLookup('' , 4,tblStockAd.FieldByName('WSUPPLIER1ID').AsInteger) ;
      if ReturnLookup = 'ESC' then exit ;
      tblStockAd.Edit;
      tblStockAd.FieldByName('WSUPPLIER1ID').AsInteger :=  ReturnID;
      exit ;
    end ;
  if (CompareText(aRealFieldName,'SWSUPPLIER2ID')= 0) then
    begin
      CallLookup('' , 4,tblStockAd.FieldByName('WSUPPLIER2ID').AsInteger) ;
      if ReturnLookup = 'ESC' then exit ;
      tblStockAd.Edit;
      tblStockAd.FieldByName('WSUPPLIER2ID').AsInteger :=  ReturnID;
      exit ;
    end ;

  if ReturnID>0 then
  begin
   tblStockAd.Edit;
   tblStockAd.FieldByName('W'+Copy(aRealFieldName,2,25)+'ID').AsInteger :=  ReturnID;
  end;

end;

procedure TfmStockEntry.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 TshowTumb.Enabled := False ;
 
 cxGrid1DBBandedTableView1.StoreToRegistry('Software\osfinancials\grids\STOCKGRID') ;
 cxGrid1DBBandedTableView1.DataController.DataSource := nil ;
end;

procedure TfmStockEntry.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
   aGroupRec :TGroupRecPointer ;
begin
    if  uppercase(TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName) = 'WREPORTINGGROUP2ID'then
       begin
         DMTCCoreLink.GroupsObject.getGroup(aGroupRec,StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Index]),0)) ;
         if aGroupRec.Wbackcol <> 0 then
         begin
         if (AViewInfo.Selected ) or (AViewInfo.Focused ) then
                  begin
                    ACanvas.Brush.Color :=  ACanvas.Font.Color ;
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
       end else
        begin
         DMTCCoreLink.GroupsObject.getGroup(aGroupRec,StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Index]),0)) ;
         if aGroupRec.Wbackcol <> 0 then
         begin
         if (AViewInfo.Selected ) or (AViewInfo.Focused ) then
                  begin
                      ACanvas.Brush.Color := aGroupRec^.Wfontcol ;
                      ACanvas.Font.Color :=  aGroupRec^.Wbackcol ;
                  end else
                  begin
                      ACanvas.Brush.Color := aGroupRec^.Wbackcol ;
                      ACanvas.Font.Color :=  aGroupRec^.Wfontcol ;
                  end;
         end;
       end ;

end;

procedure TfmStockEntry.cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
 AProperties.Alignment.Horz := taLeftJustify ;
end;

procedure TfmStockEntry.cbSimplelayoutClick(Sender: TObject);
var
 i : Integer ;
begin

 cxGrid1DBBandedTableView1.OptionsView.GroupByBox :=not cbSimplelayout.Checked   ;
  cxGrid1DBBandedTableView1.OptionsView.Footer := true ;
 cxGrid1DBBandedTableView1.Bands[2].Visible := cxGrid1DBBandedTableView1.OptionsView.GroupByBox ;

 if not cxGrid1DBBandedTableView1.OptionsView.GroupByBox then
 begin
 for i := 0 to cxGrid1DBBandedTableView1.ColumnCount - 1 do
   begin
    If cxGrid1DBBandedTableView1.Columns[i].Position.BandIndex =2 then
       cxGrid1DBBandedTableView1.Columns[i].Position.BandIndex :=1 ;
    end;
 end else
 begin
   if sender = cbSimplelayout then
    begin
 

    end;
 end;
end;

initialization
twf_TfmStockEntry.create(nil);
twf_TfmStockEntryPlugins.create(nil);
  RegisterClasses([TSmallIntField, TIntegerField,TStringField,TDateField,TMemoField]);


end.
