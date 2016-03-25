{
  I have decided to use a batch table for the invoices.
  Basically I use the same table, but the fields are used
  for different things.

  Batch               Invoice
  SREFERENCE          SStockID (Lookup to SSTOCKCODE)
  DDate               Not used
  SDescription        WDescriptionID (Lookup to message table)
  SACCOUNT            FQtyOrdered
  STAX                WTaxID (Lookup to SDescription)
  FDEBIT              FSellingPrice (or unit excl in 203)
  FCREDIT             FExclusiveAmt or FInclusiveAmt, depending on display mode
  DAllocatedDate      Not used
  SCONTRAACCOUNT      FQtyShipped
  FTAXAMOUNT          FItemDiscount
  WAccountID          WDescriptionID (Lookup to message table for Comment Line Only)
  // Sylvain
  BReconciled         '90 Stock item' if False or  '91 Comment ' if True

  Unfortunately the units column will have to go.


}
// Comment from Pieter :Im still wondering who you are
// couse this is a verry bad idee and we will need to replace it someday
unit InvoiceEntryGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  ExtCtrls, Buttons, StdCtrls, ComCtrls, ToolWin, DB, Mask, DBCtrls, ImgList,
  Menus,
  ValEdit, ActnList, ActnMan, TcVariables, databaseAccess,
  DBAccess, Uni,
  tcashclasses, NewLookup, UPluginsSharedUnit, UDMCoreDocData,
  CustomizeDlg, VirtualTable, InvoicePayment, UDocSelectOptions, Debtor,
  ULocBatSerInput, UOSFVIsuals, UosfResources, UStockLinkDetail, UDocRefLinks,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxImageComboBox, cxContainer, cxLabel,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxCalendar, Grids,
  cxSplitter, cxButtonEdit, cxDBLookupComboBox, cxMemo, cxCurrencyEdit;

type

  twf_TfmDocument = class(TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published

    function WorkFlowStart: TForm; override;
    procedure WorkflowEnd(AForm: TForm); override;
  end;

  twf_TfmPluginDocument = class(TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function WorkFlowStart: TForm; override;
    procedure WorkflowEnd(AForm: TForm); override;
  end;

  TfmInvoiceEntryGrid = class(TForm)
    PopupMenu1: TPopupMenu;
    Entertotal1: TMenuItem;
    QDocHead: TuniQuery;
    DSDocHead: TDataSource;
    PopupMenu2: TPopupMenu;
    ConverttoInvoice1: TMenuItem;
    PMNextPrev: TPopupMenu;
    CancelNext1: TMenuItem;
    CancelPrev1: TMenuItem;
    Changeaccount1: TMenuItem;
    pmPasteFromClip: TPopupMenu;
    Pastefromclipboard1: TMenuItem;
    Printbarcodes1: TMenuItem;
    Printlabel1: TMenuItem;
    Openitem1: TMenuItem;
    Setreportinggroup1: TMenuItem;
    Setreportinggroup2: TMenuItem;
    openOSCommerceorderinbrowser1: TMenuItem;
    OpenOSCOmmercecustomerinbrowser1: TMenuItem;
    Convertinvoicetopurchase1: TMenuItem;
    Copydocument1: TMenuItem;
    tblBatch: TuniTable;
    tblBatchWLINEID: TIntegerField;
    tblBatchSREFERENCE: TStringField;
    tblBatchSACCOUNT: TStringField;
    tblBatchSDESCRIPTION: TStringField;
    tblBatchFDEBIT: TFloatField;
    tblBatchFAMOUNT: TFloatField;
    tblBatchSTAX: TStringField;
    tblBatchDDATE: TDateTimeField;
    tblBatchFCREDIT: TFloatField;
    tblBatchSCONTRAACCOUNT: TStringField;
    tblBatchFTAXAMOUNT: TFloatField;
    tblBatchDALLOCATEDDATE: TDateTimeField;
    tblBatchBRECONCILED: TIntegerField;
    tblBatchBEXCLUSIVE: TIntegerField;
    tblBatchWACCOUNTID: TIntegerField;
    tblBatchFQTY: TFloatField;
    tblBatchWPROFILEID: TIntegerField;
    tblBatchWTAX2ID: TIntegerField;
    tblBatchNOTUSED: TFloatField;
    tblBatchSPROFILE: TStringField;
    tblBatchSJOBCODE: TStringField;
    tblBatchSTAX2: TStringField;
    tblBatchBLINKED: TIntegerField;
    tblBatchDSYSDATE: TDateTimeField;
    tblBatchFTAX2AMOUNT: TFloatField;
    tblBatchWTAXID: TIntegerField;
    tblBatchWCONTRAACCOUNTID: TIntegerField;
    tblBatchWREPORTINGGROUP1ID: TIntegerField;
    tblBatchWREPORTINGGROUP2ID: TIntegerField;
    tblBatchWLINKEDID: TIntegerField;
    dsBatch: TDataSource;
    tblBatchRefTotals: TuniTable;
    tblBatchRefTotalsSREFERENCE: TStringField;
    tblBatchRefTotalsSACCOUNT: TStringField;
    tblBatchRefTotalsSDESCRIPTION: TStringField;
    tblBatchRefTotalsFDEBIT: TFloatField;
    tblBatchRefTotalsFAMOUNT: TFloatField;
    tblBatchRefTotalsSTAX: TStringField;
    tblBatchRefTotalsDDATE: TDateTimeField;
    tblBatchRefTotalsFCREDIT: TFloatField;
    tblBatchRefTotalsSCONTRAACCOUNT: TStringField;
    tblBatchRefTotalsFTAXAMOUNT: TFloatField;
    tblBatchRefTotalsDALLOCATEDDATE: TDateTimeField;
    tblBatchRefTotalsBRECONCILED: TSmallintField;
    tblBatchRefTotalsBEXCLUSIVE: TSmallintField;
    tblBatchRefTotalsWACCOUNTID: TIntegerField;
    tblBatchRefTotalsWLINEID: TIntegerField;
    tblBatchRefTotalsFQTY: TFloatField;
    tblBatchRefTotalsWPROFILEID: TIntegerField;
    tblBatchRefTotalsWTAX2ID: TIntegerField;
    tblBatchRefTotalsNOTUSED: TFloatField;
    tblBatchRefTotalsSPROFILE: TStringField;
    tblBatchRefTotalsSJOBCODE: TStringField;
    tblBatchRefTotalsSTAX2: TStringField;
    tblBatchRefTotalsBLINKED: TSmallintField;
    tblBatchRefTotalsDSYSDATE: TDateTimeField;
    tblBatchRefTotalsFTAX2AMOUNT: TFloatField;
    tblBatchRefTotalsWTAXID: TIntegerField;
    tblBatchRefTotalsWCONTRAACCOUNTID: TIntegerField;
    tblBatchRefTotalsWLINKEDID: TIntegerField;
    tblBatchRefTotalsWREPORTINGGROUP1ID: TIntegerField;
    tblBatchRefTotalsWREPORTINGGROUP2ID: TIntegerField;
    RecalcStockAvail: TMenuItem;
    Convertdocumentstosingledocument1: TMenuItem;
    Createpurchaseondefaultsupplier11: TMenuItem;
    Showinfo1: TMenuItem;
    ConverttoCreditnote1: TMenuItem;
    Setdate1: TMenuItem;
    QDocHeadWDOCID: TIntegerField;
    QDocHeadSDOCNO: TStringField;
    QDocHeadDDATE: TDateField;
    QDocHeadDDUEDATE: TDateField;
    QDocHeadDALLOCATEDDATE: TDateTimeField;
    QDocHeadWACCOUNTID: TIntegerField;
    QDocHeadWPAYMENTTYPEID: TIntegerField;
    QDocHeadFINVOICEDISCOUNT: TFloatField;
    QDocHeadBPRINTED: TSmallintField;
    QDocHeadBEXCLUSIVE: TSmallintField;
    QDocHeadFDOCAMOUNT: TFloatField;
    QDocHeadFTAXAMOUNT: TFloatField;
    QDocHeadSREFERENCE: TStringField;
    QDocHeadWSOURCETYPEID: TIntegerField;
    QDocHeadSGROUP1DESC: TStringField;
    QDocHeadSGROUP2DESC: TStringField;
    QDocHeadSACCOUNTCODE: TStringField;
    QDocHeadSACCOUNTDESCRIPTION: TStringField;
    QDocHeadSSALESMANDESCRIPTION: TStringField;
    QDocHeadEXCAMOUNT: TFloatField;
    QDocHeadOPENAMOUNT: TFloatField;
    ZQCostGroup2: TuniQuery;
    ZQCostGroup2WGROUPID: TIntegerField;
    ZQCostGroup2SFULLDESC: TStringField;
    ZQCostgroup1: TuniQuery;
    ZQCostgroup1WGROUPID: TIntegerField;
    ZQCostgroup1SFULLDESC: TStringField;
    dsCostGroup1: TDataSource;
    dsCostGroup2: TDataSource;
    tblBatchDPAYMENTDATE: TDateTimeField;
    tblBatchWDOCID: TIntegerField;
    Export1: TMenuItem;
    Import1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Importfromtabfile1: TMenuItem;
    OpenDialog2: TOpenDialog;
    EditAccount1: TMenuItem;
    NBDocuments: TNotebook;
    Panel5: TPanel;
    Image1: TImage;
    BitBtnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    Panel8: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    lblPrnType: TLabel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    Label20: TLabel;
    BNew: TBitBtn;
    BEdit: TBitBtn;
    BPrint: TBitBtn;
    CBDocLayout2: TComboBox;
    cbDestination: TComboBox;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BitSetPrint: TBitBtn;
    BProcess: TBitBtn;
    BDelete: TBitBtn;
    CBDocLayout: TComboBox;
    BtnClose2: TBitBtn;
    Panel7: TPanel;
    Panel6: TPanel;
    LField: TLabel;
    LFilterValue: TLabel;
    CBFindColumn: TComboBox;
    CBOperatot: TComboBox;
    EFilterValue: TEdit;
    BFilter: TBitBtn;
    BClear: TBitBtn;
    cbViewUnPosted2: TComboBox;
    pnlDocLines: TPanel;
    Panel3: TPanel;
    PriceList: TValueListEditor;
    PNewTotal: TPanel;
    LEnternewtotal: TLabel;
    ENewTotal: TEdit;
    ToolBar1: TToolBar;
    tlbtnDelete: TToolButton;
    tlbtnInsert: TToolButton;
    tlbtnExclIncl: TToolButton;
    tlbtnIncl: TToolButton;
    tlbtnDisc: TToolButton;
    tlbtnComment: TToolButton;
    tlbtnDeleteInv: TToolButton;
    TlbtnCopy: TToolButton;
    Panel10: TPanel;
    BtnOkPrint: TBitBtn;
    BtnClose: TBitBtn;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label1i: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    LGross: TLabel;
    LNetto: TLabel;
    lblInvAmt: TStaticText;
    cbInvoiceNumber: TComboBox;
    edtAccountNumber: TEdit;
    lblCredLimit: TStaticText;
    lblAvailable: TStaticText;
    lblPostBal: TStaticText;
    PMAinData: TPanel;
    PnlDocHeader: TPanel;
    Panel9: TPanel;
    Label13: TLabel;
    Label12: TLabel;
    lblRep1: TLabel;
    lblRep2: TLabel;
    Label3i: TLabel;
    Label21: TLabel;
    LProject: TLabel;
    edtOrderNumber: TEdit;
    cbSalesman: TComboBox;
    CbxRepGroup2: TComboBox;
    CbxRepGroup1: TComboBox;
    cbProject: TComboBox;
    BPutOnAccount: TBitBtn;
    pnlDiscount: TPanel;
    Label3: TLabel;
    edtDiscount: TEdit;
    TUpdateDocuments: TTimer;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Image3: TImage;
    Image2: TImage;
    LAddress1: TLabel;
    LAddress2: TLabel;
    LAddress3: TLabel;
    LPostal: TLabel;
    LCountry: TLabel;
    LCompany: TLabel;
    LContact: TLabel;
    LtaxRef: TLabel;
    EDelCompany: TEdit;
    EDelContact: TComboBox;
    ECompany: TEdit;
    EContact: TComboBox;
    EDelAdr1: TEdit;
    EDelAdr2: TEdit;
    EDelAdr3: TEdit;
    EDelPostal: TEdit;
    CBDelCountry: TComboBox;
    EPostal1: TEdit;
    EPostal2: TEdit;
    EPostal3: TEdit;
    EPostalCode: TEdit;
    EMessage3: TEdit;
    EMessage2: TEdit;
    EMessage1: TEdit;
    CBCountry: TComboBox;
    ESExtraDesc: TEdit;
    ETaxCode: TEdit;
    Bevel1: TBevel;
    ScrollBox1: TScrollbox;
    LNettoWeigth: TStaticText;
    LGrossWeigth: TStaticText;
    LblDiscount: TStaticText;
    LblExcl: TStaticText;
    LblTax: TStaticText;
    pmPlugins: TPopupMenu;
    LPaymentTotal: TStaticText;
    ZQStockOptions: TuniQuery;
    ZQStockOptionsWSTOCKOPTIONSID: TIntegerField;
    ZQStockOptionsWSTOCKID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE1ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE2ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE3ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE4ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE5ID: TIntegerField;
    ZQStockOptionsFEXTRAPRICE: TFloatField;
    ZQStockOptionsFQTYONHAND: TFloatField;
    ZQStockOptionsSBARCODE: TStringField;
    ZQStockOptionsSREFERENCE: TStringField;
    ZQStockOptionsFUNITCOST: TFloatField;
    ZQStockOptionsFUNITAVECOST: TFloatField;
    ZQStockOptionsFREORDERQTY: TFloatField;
    ZQStockOptionsFREORDERQTYTRIG: TFloatField;
    QDocHeadWGROUP1COLOR: TIntegerField;
    QDocHeadWGROUP1TEXTCOLOR: TIntegerField;
    EDocEmailAddress: TEdit;
    lbDiscountperc: TStaticText;
    LStdDiscount: TLabel;
    ReaplayITemsDicounts: TMenuItem;
    EFastbarcodelookup: TEdit;
    Label22: TLabel;
    LFastlookup: TLabel;
    Label2i: TLabel;
    cbDoc1group: TComboBox;
    PEditPrice: TPanel;
    Totals1: TMenuItem;
    Up1: TMenuItem;
    Down1: TMenuItem;
    tbBackorder: TToolButton;
    MOptions: TMemo;
    PEditPriceInner: TPanel;
    BSavePriceChange: TBitBtn;
    EPrice3: TEdit;
    Label26: TLabel;
    Label25: TLabel;
    EPrice2: TEdit;
    EPrice1: TEdit;
    Label24: TLabel;
    Documents1: TMenuItem;
    Print1: TMenuItem;
    Extras1: TMenuItem;
    Plugins1: TMenuItem;
    Massaction1: TMenuItem;
    Salesman1: TMenuItem;
    QDocHeadCALOPENAMOUNT: TFloatField;
    QDocHeadBPOSTED: TSmallintField;
    Createbackorderstodeliver1: TMenuItem;
    Thideshowitems: TToolButton;
    Invoicetoorderondefsupp11: TMenuItem;
    QDocHeadWACCOUNTTYPEID: TIntegerField;
    PExtra: TPanel;
    EPaymentDiscount: TEdit;
    Lpaydiscount: TLabel;
    cbShipments: TComboBox;
    Eshipment: TEdit;
    Lshipment: TLabel;
    lshipmentAmt: TLabel;
    EndTotal: TStaticText;
    LEndTotal: TLabel;
    Label10: TLabel;
    stgrosscost: TStaticText;
    Label23: TLabel;
    stGrossProfit: TStaticText;
    tblBatchFUNITQTY: TFloatField;
    tblBatchWUNITID: TIntegerField;
    ZQUnit: TuniQuery;
    ZQUnitWUNITID: TIntegerField;
    ZQUnitSDESCRIPTION: TStringField;
    ZQUnitDSYSDATE: TDateTimeField;
    ZQUnitFUNITQTY: TFloatField;
    dsUnit: TDataSource;
    btnEnterIncExc: TBitBtn;
    tbPlugins: TToolButton;
    PopupMenu5: TPopupMenu;
    PnlCopy: TPanel;
    BtnCopyCancel: TBitBtn;
    BtnCopyOk: TBitBtn;
    ECopyFilter: TEdit;
    BCopyFilter: TBitBtn;
    CBOnlyThisDebtor: TCheckBox;
    CBAllDocuments: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    tblBatchLONGTEXT: TStringField;
    ENewDescription: TEdit;
    cbDefsupp: TCheckBox;
    LEPricePurchase: TLabel;
    EPricePurchase: TEdit;
    pmStockPlugins: TPopupMenu;
    bStockPlugins: TBitBtn;
    ZQFreeLookup: TuniQuery;
    dsFreeLookup: TDataSource;
    DBFreeLookup: TDBLookupComboBox;
    ZQFreeLookupWGROUPID: TIntegerField;
    ZQFreeLookupSFULLDESC: TStringField;
    N1: TMenuItem;
    Sortonstockcode1: TMenuItem;
    CopyDocTo1: TMenuItem;
    ctOrder: TMenuItem;
    ctPurchase: TMenuItem;
    ctReturnnote: TMenuItem;
    ctQuote: TMenuItem;
    ctInvoice: TMenuItem;
    ctCreditnote: TMenuItem;
    ctStockin: TMenuItem;
    ctStockout: TMenuItem;
    pCurrency: TPanel;
    cbCurrency: TComboBox;
    cbRate: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    PEXtraData: TPanel;
    EEdiTrigg: TEdit;
    Label31: TLabel;
    Label30: TLabel;
    EEdtMIN: TEdit;
    EedtReord: TEdit;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Lsale30: TLabel;
    Lsale60: TLabel;
    Lsale90: TLabel;
    Bexport: TBitBtn;
    LLPaymentTotal: TButton;
    cbPosted: TComboBox;
    lstate: TLabel;
    URLPayment1: TMenuItem;
    Link1: TMenuItem;
    Links1: TMenuItem;
    cxlistLevel1: TcxGridLevel;
    cxlist: TcxGrid;
    cxlistDBTable: TcxGridDBBandedTableView;
    cxlistDBTableWDOCID: TcxGridDBBandedColumn;
    cxlistDBTableSDOCNO: TcxGridDBBandedColumn;
    cxlistDBTableDDATE: TcxGridDBBandedColumn;
    cxlistDBTableDDUEDATE: TcxGridDBBandedColumn;
    cxlistDBTableDALLOCATEDDATE: TcxGridDBBandedColumn;
    cxlistDBTableWACCOUNTID: TcxGridDBBandedColumn;
    cxlistDBTableWPAYMENTTYPEID: TcxGridDBBandedColumn;
    cxlistDBTableFINVOICEDISCOUNT: TcxGridDBBandedColumn;
    cxlistDBTableBPRINTED: TcxGridDBBandedColumn;
    cxlistDBTableBEXCLUSIVE: TcxGridDBBandedColumn;
    cxlistDBTableFDOCAMOUNT: TcxGridDBBandedColumn;
    cxlistDBTableFTAXAMOUNT: TcxGridDBBandedColumn;
    cxlistDBTableSREFERENCE: TcxGridDBBandedColumn;
    cxlistDBTableWSOURCETYPEID: TcxGridDBBandedColumn;
    cxlistDBTableSGROUP1DESC: TcxGridDBBandedColumn;
    cxlistDBTableSGROUP2DESC: TcxGridDBBandedColumn;
    cxlistDBTableSACCOUNTCODE: TcxGridDBBandedColumn;
    cxlistDBTableSACCOUNTDESCRIPTION: TcxGridDBBandedColumn;
    cxlistDBTableSSALESMANDESCRIPTION: TcxGridDBBandedColumn;
    cxlistDBTableEXCAMOUNT: TcxGridDBBandedColumn;
    cxlistDBTableOPENAMOUNT: TcxGridDBBandedColumn;
    cxlistDBTableWGROUP1COLOR: TcxGridDBBandedColumn;
    cxlistDBTableWGROUP1TEXTCOLOR: TcxGridDBBandedColumn;
    cxlistDBTableCALOPENAMOUNT: TcxGridDBBandedColumn;
    cxlistDBTableBPOSTED: TcxGridDBBandedColumn;
    cxlistDBTableWACCOUNTTYPEID: TcxGridDBBandedColumn;
    QDocHeadWREPORTINGGROUP2ID: TIntegerField;
    cxlistDBTableWREPORTINGGROUP2ID: TcxGridDBBandedColumn;
    QDocHeadDUMMMYEXPRES: TSmallintField;
    LimitRows: TcxSpinEdit;
    lLimitRows: TcxLabel;
    dtpDate: TcxDateEdit;
    dtpDuedate: TcxDateEdit;
    cxSplitter1: TcxSplitter;
    cbSimplelayout: TCheckBox;
    Panel11: TPanel;
    Label7: TLabel;
    cbDocTypenew: TComboBox;
    newdoctest1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WLINEID: TcxGridDBColumn;
    cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid1DBTableView1SACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1FDEBIT: TcxGridDBColumn;
    cxGrid1DBTableView1FAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1STAX: TcxGridDBColumn;
    cxGrid1DBTableView1FCREDIT: TcxGridDBColumn;
    cxGrid1DBTableView1SCONTRAACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1FTAXAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1BRECONCILED: TcxGridDBColumn;
    cxGrid1DBTableView1BEXCLUSIVE: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid1DBTableView1FQTY: TcxGridDBColumn;
    cxGrid1DBTableView1WPROFILEID: TcxGridDBColumn;
    cxGrid1DBTableView1WTAX2ID: TcxGridDBColumn;
    cxGrid1DBTableView1SPROFILE: TcxGridDBColumn;
    cxGrid1DBTableView1SJOBCODE: TcxGridDBColumn;
    cxGrid1DBTableView1STAX2: TcxGridDBColumn;
    cxGrid1DBTableView1BLINKED: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1FTAX2AMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1WTAXID: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WLINKEDID: TcxGridDBColumn;
    cxGrid1DBTableView1DPAYMENTDATE: TcxGridDBColumn;
    cxGrid1DBTableView1WDOCID: TcxGridDBColumn;
    cxGrid1DBTableView1FUNITQTY: TcxGridDBColumn;
    cxGrid1DBTableView1WUNITID: TcxGridDBColumn;
    cxGrid1DBTableView1LONGTEXT: TcxGridDBColumn;
    grdCopyDBTableView1: TcxGridDBTableView;
    grdCopyLevel1: TcxGridLevel;
    grdCopy: TcxGrid;
    grdCopyDBTableView1WDOCID: TcxGridDBColumn;
    grdCopyDBTableView1SDOCNO: TcxGridDBColumn;
    grdCopyDBTableView1DDATE: TcxGridDBColumn;
    grdCopyDBTableView1DDUEDATE: TcxGridDBColumn;
    grdCopyDBTableView1DALLOCATEDDATE: TcxGridDBColumn;
    grdCopyDBTableView1WACCOUNTID: TcxGridDBColumn;
    grdCopyDBTableView1WPAYMENTTYPEID: TcxGridDBColumn;
    grdCopyDBTableView1FINVOICEDISCOUNT: TcxGridDBColumn;
    grdCopyDBTableView1BPRINTED: TcxGridDBColumn;
    grdCopyDBTableView1BEXCLUSIVE: TcxGridDBColumn;
    grdCopyDBTableView1FDOCAMOUNT: TcxGridDBColumn;
    grdCopyDBTableView1FTAXAMOUNT: TcxGridDBColumn;
    grdCopyDBTableView1SREFERENCE: TcxGridDBColumn;
    grdCopyDBTableView1WSOURCETYPEID: TcxGridDBColumn;
    grdCopyDBTableView1SGROUP1DESC: TcxGridDBColumn;
    grdCopyDBTableView1SGROUP2DESC: TcxGridDBColumn;
    grdCopyDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    grdCopyDBTableView1SACCOUNTDESCRIPTION: TcxGridDBColumn;
    grdCopyDBTableView1SSALESMANDESCRIPTION: TcxGridDBColumn;
    grdCopyDBTableView1EXCAMOUNT: TcxGridDBColumn;
    grdCopyDBTableView1OPENAMOUNT: TcxGridDBColumn;
    grdCopyDBTableView1WGROUP1COLOR: TcxGridDBColumn;
    grdCopyDBTableView1WGROUP1TEXTCOLOR: TcxGridDBColumn;
    grdCopyDBTableView1CALOPENAMOUNT: TcxGridDBColumn;
    grdCopyDBTableView1BPOSTED: TcxGridDBColumn;
    grdCopyDBTableView1WACCOUNTTYPEID: TcxGridDBColumn;
    grdCopyDBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    grdCopyDBTableView1DUMMMYEXPRES: TcxGridDBColumn;
    PnlComment: TPanel;
    Label6: TLabel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    EdComment: TMemo;
    BRemFinder: TBitBtn;
    tbAddToBackorder: TToolButton;
    EditLineTimer: TTimer;
    TAddNew: TTimer;
    bLabelPrint: TButton;
    procedure HandelChangeGroup1Click(Sender: TObject);
    procedure HandelChangeSalesmanClick(Sender: TObject);
    procedure HandelChangeGroup2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DoDropDownLookup;
    procedure tlbtnDeleteClick(Sender: TObject);
    procedure tlbtnInsertClick(Sender: TObject);
    procedure dbgridInvoiceKeyPress(Sender: TObject; var Key: Char);
    procedure tlbtnDeleteInvClick(Sender: TObject);
    procedure tlbtnDiscClick(Sender: TObject);
    procedure edtDiscountKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridInvoiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgridInvoiceRowChanged(Sender: TObject);
    procedure tlbtnCommentClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure PnlCommentEnter(Sender: TObject);
    procedure EdCommentKeyPress(Sender: TObject; var Key: Char);
    procedure PnlDtEnter(Sender: TObject);
    procedure PnlGEnter(Sender: TObject);
    procedure tlbtnExclInclClick(Sender: TObject);
    procedure TlbtnCopyClick(Sender: TObject);
    procedure BtnCopyCancelClick(Sender: TObject);
    procedure BtnCopyOkClick(Sender: TObject);
    procedure PnlCopyExit(Sender: TObject);
    procedure grdCopyDblClick(Sender: TObject);

    procedure PriceListxClick(Sender: TObject);

    procedure FormDestroy(Sender: TObject);
    procedure btnSwapClick(Sender: TObject);
    procedure Panel4Enter(Sender: TObject);
    procedure JumpCtrlEnter(Sender: TObject);
    procedure cbInvoiceNumberExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbSalesmanEnter(Sender: TObject);
    procedure dtpDateExit(Sender: TObject);
    procedure FillScrDetails(Sender: TObject);
    procedure PriceListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PriceListKeyPress(Sender: TObject; var Key: Char);
    procedure cbDocTypenewChange(Sender: TObject);
    procedure PriceListDblClick(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitSetPrintClick(Sender: TObject);
    procedure BtnOkPrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PriceListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDiscountExit(Sender: TObject);
    procedure dbgridInvoiceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnlDocLinesExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure ENewTotalExit(Sender: TObject);
    procedure Entertotal1Click(Sender: TObject);
    procedure dbgridInvoiceDblClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure dbgridInvoiceEnter(Sender: TObject);
    procedure PriceListExit(Sender: TObject);
    procedure BFilterClick(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure dtpDateCalcBoldDay(Sender: TObject; ADate: TDate;
      Month, Day, Year: Integer; var Accept: Boolean);
    procedure EFilterValueKeyPress(Sender: TObject; var Key: Char);
    procedure ConverttoInvoice1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure GoToDocFromTagOfSender(Sender: TObject);

    procedure PnlCommentExit(Sender: TObject);
    procedure CancelNext1Click(Sender: TObject);
    procedure CancelPrev1Click(Sender: TObject);
    procedure BProcessClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure Changeaccount1Click(Sender: TObject);
    procedure EMessage3Exit(Sender: TObject);
    procedure Pastefromclipboard1Click(Sender: TObject);
    procedure dtpDuedateExit(Sender: TObject);
    procedure cbViewUnPostedClick(Sender: TObject);
    procedure DBGSearchKeyPress(Sender: TObject; var Key: Char);
    procedure Printbarcodes1Click(Sender: TObject);
    procedure Printlabel1Click(Sender: TObject);
    procedure edtOrderNumberExit(Sender: TObject);
    procedure dbgridInvoiceExit(Sender: TObject);
    procedure BtnCloseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnOkPrintMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnClose2Click(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure BCopyFilterClick(Sender: TObject);
    procedure DBGSearchColumnMoved(Sender: TObject;
      FromIndex, ToIndex: Integer);
    procedure QDocHeadOPENAMOUNTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Openitem1Click(Sender: TObject);
    procedure openOSCommerceorderinbrowser1Click(Sender: TObject);
    procedure OpenOSCOmmercecustomerinbrowser1Click(Sender: TObject);
    procedure TUpdateDocumentsTimer(Sender: TObject);
    procedure Convertinvoicetopurchase1Click(Sender: TObject);
    procedure Copydocument1Click(Sender: TObject);
    procedure tblBatchBeforePost(DataSet: TDataSet);
    procedure tblBatchBeforeOpen(DataSet: TDataSet);
    procedure RecalcStockAvailClick(Sender: TObject);
    procedure Convertdocumentstosingledocument1Click(Sender: TObject);
    procedure Createpurchaseondefaultsupplier11Click(Sender: TObject);

    procedure Showinfo1Click(Sender: TObject);
    procedure QDocHeadAfterScroll(DataSet: TDataSet);
    procedure PluginFieldGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ConverttoCreditnote1Click(Sender: TObject);
    procedure Setdate1Click(Sender: TObject);
    procedure TPluginClick(Sender: TObject);
    procedure ZQCostGroup2CalcFields(DataSet: TDataSet);
    procedure ZQCostgroup1CalcFields(DataSet: TDataSet);
    procedure DBLCBCostgroup2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBCostgroup1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBCostgroup1Exit(Sender: TObject);
    procedure tblBatchWREPORTINGGROUP1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormResize(Sender: TObject);
    procedure PluginPopupClick(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Import1Click(Sender: TObject);
    procedure Importfromtabfile1Click(Sender: TObject);
    procedure pmPasteFromClipPopup(Sender: TObject);
    procedure edtOrderNumberDblClick(Sender: TObject);
    procedure EditAccount1Click(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure BPutOnAccountClick(Sender: TObject);
    procedure tblBatchSREFERENCEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure LPaymentTotalDblClick(Sender: TObject);
    procedure QDocHeadAfterOpen(DataSet: TDataSet);
    procedure EContactChange(Sender: TObject);
    procedure Image2DblClick(Sender: TObject);
    procedure ReaplayITemsDicountsClick(Sender: TObject);
    procedure EFastbarcodelookupKeyPress(Sender: TObject; var Key: Char);
    procedure EContactDblClick(Sender: TObject);
    procedure EDelContactDblClick(Sender: TObject);
    procedure EDelContactChange(Sender: TObject);
    procedure CBDocLayoutDropDown(Sender: TObject);
    procedure CBDocLayout2DropDown(Sender: TObject);
    procedure BSavePriceChangeClick(Sender: TObject);
    procedure Panel3Exit(Sender: TObject);
    procedure Totals1Click(Sender: TObject);
    procedure dbgridInvoiceCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBGSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Up1Click(Sender: TObject);
    procedure Down1Click(Sender: TObject);
    procedure tbBackorderClick(Sender: TObject);
    procedure tblBatchAfterScroll(DataSet: TDataSet);
    procedure tblBatchSTAXGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QDocHeadCalcFields(DataSet: TDataSet);
    procedure tblBatchWCONTRAACCOUNTIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Createbackorderstodeliver1Click(Sender: TObject);
    procedure ThideshowitemsClick(Sender: TObject);
    procedure OnSearch(Sender: TObject);
    procedure cbRemoveFromdocClick(Sender: TObject);
    procedure Invoicetoorderondefsupp11Click(Sender: TObject);
    procedure QDocHeadSACCOUNTCODEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure EshipmentExit(Sender: TObject);
    procedure cbShipmentsDblClick(Sender: TObject);
    procedure cbShipmentsChange(Sender: TObject);
    procedure tblBatchCalcFields(DataSet: TDataSet);
    procedure tblBatchWUNITIDChange(Sender: TField);
    procedure tblBatchDatesChange(Sender: TField);

    procedure tblBatchSCONTRAACCOUNTChange(Sender: TField);
    procedure EPrice1KeyPress(Sender: TObject; var Key: Char);
    procedure btnEnterIncExcClick(Sender: TObject);
    procedure tbPluginsClick(Sender: TObject);
    procedure tblBatchSDESCRIPTIONGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblBatchBeforeInsert(DataSet: TDataSet);
    procedure bStockPluginsClick(Sender: TObject);
    procedure pmStockPluginsPopup(Sender: TObject);
    procedure ZQFreeLookupCalcFields(DataSet: TDataSet);
    procedure Sortonstockcode1Click(Sender: TObject);
    procedure tblBatchWUNITIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CreateStockinfromdocuments1Click(Sender: TObject);
    procedure cbCurrencyChange(Sender: TObject);
    procedure BexportClick(Sender: TObject);
    procedure BRemFinderClick(Sender: TObject);
    procedure LblTaxDblClick(Sender: TObject);
    procedure URLPayment1Click(Sender: TObject);
    procedure Link1Click(Sender: TObject);
    procedure dbgridInvoiceColExit(Sender: TObject);
    procedure cxlistDBTableCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbSimplelayoutClick(Sender: TObject);
    procedure newdoctest1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGrid1DBTableView1FocusedRecordChanged
      (Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBTableView1FocusedItemChanged
      (Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure cxGrid1DBTableView1SACCOUNTPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1STAXPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrid1DBTableView1FDEBITPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrid1DBTableView1SACCOUNTGetProperties
      (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AProperties: TcxCustomEditProperties);
    procedure cxGrid1DBTableView1SDESCRIPTIONGetCellHint
      (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
      var AHintText: TCaption; var AIsHintMultiLine: Boolean;
      var AHintTextRect: TRect);
    procedure cxGrid1DBTableView1EditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
    procedure tbAddToBackorderClick(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure tblBatchAfterInsert(DataSet: TDataSet);
    procedure EditStockTimer(Sender: TObject);
    procedure TAddNewTimer(Sender: TObject);
    procedure ENewTotalKeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1FTAXAMOUNTPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure bLabelPrintClick(Sender: TObject);
    procedure cbProjectDropDown(Sender: TObject);

  private

    fmDocLinks: TfmDocLinks;
    LinkToList: TStringList;
    BForceSpecialRecalc, BISSavePRocess: Boolean;
    CustomGetSuppCodeSql,LimitLayouts: String;
    aPayDiscountItem, aPayDiscountItemCred, aShipcostunittype: Integer;
    BBelgiumStyleDiscount: Boolean;
    ctrlDown, ShowSpecialAccount, UseUnitQty, UseUnitQtyForSale,
      LoadingGridData: Boolean;
    EditStockPrices, UsePricePlugin: Boolean;
    UseMuliplier: Integer;
    CheckStockTypesSet: Set of byte;
    fmDebtor: TfmDebtor;
    fmInvocePayment: TfmInvocePayment;
    fmStockLinkDetail: TStockLinkDetail;
    LastShift: TShiftState;
    GridActiveLineDocid: Integer;
    ShowHintForLine: Boolean;
    FieldChgd, GoToStockQty, GoToStockQtyReturnAuto, CannotEditDesc,
      CannotEditPrice: Boolean;
    AccID, ListOrderBy: Integer;
    HasBeenInitialized, BPurVis: Boolean;
    BDirection, IsComment, NewRecord, InMoveColum: Boolean;
    aLedgerPeriodeCollection: TLedgerPeriodeCollection;
    // InvTaxRefOff,
    DisableItemsList: String;
    FirstTime: Boolean;

    MyLocBatSerInput: TLocBatSerInput;
    NoOutOfStockMsg, OutOfStockDrawColors: Boolean;
    ATempStockList: TStockRecList;
    aAccountRecList: TAccountRecList;
    AAccRec: TAccountRecPointer;
    astockrecpointer: TStockRecPointer;
    BPriceAgreeUseOrgPrice, BuseMarginRule: Boolean;
    anewlocallook: TfmPosLookup;
    FOnModalResultEvent: TNotifyEvent;
    Procedure UpdateTotalsLbls;
    Procedure UpDateThemes;
    Procedure UpDateLabels;
    Procedure ShowPriceList(aRect: TRect);
    procedure updatepricelist;
    Procedure DeleteDocLine;
    Procedure LoadDebtors;
    Procedure LoadCreditors;
    Procedure BringToFrontDocLines;
    Procedure SetupGridLayout;
    procedure CheckPlugins(SExtraMessage: String);
    Procedure ShowDebtorSetings;
    Procedure UpDateDocHeader;
    procedure DecrementDocNumber;
    procedure RefreshAccountType;
    procedure ExitDocLinesScr(Sender: TObject);
    procedure EnterDocLinesScr(Sender: TObject);
    Procedure SetOldPanel2(Value: Boolean);
    procedure DoclineTranslate;
    procedure RefreschDocumentList(GoToID: Integer = 0;
      JustGoTo: Boolean = false);
    procedure OnGenSearchClick(Sender: TObject);
    procedure UpdateAccountInfo;
    procedure loadCurrentItem(LoadOnly: Boolean = false);

    procedure SetStockEditPrice;
    procedure SelectStockItem(JustAdd: Boolean = false);
    procedure ApplyStockCodeToCurrentRecord(UseOrgPrice: Boolean = false);
    function SelfCheckStockCode: Boolean;

    procedure CalcAmountsFromDiscount(MultiPlier: Double);
    procedure OpenCopySql;
    function FindIndexOfName(aName: String): Integer;
    Function GetPluginLineString(IsLine: Boolean = true): String;
    procedure SendMessageToPlugin(AMessage: String);
    function UpdateStockRecWithPriceForplugin(var AStockRec: TStockRec;
      AMultiplier: Double): Boolean;
    procedure SendMessagePriceMessagePlugin(AMessage: String;
      Var price1, price2, price3, Sellingprice, Discount: Double);
    procedure SetProjectId(const Value: Integer);
    procedure PluginPopupClick2(Sender: TObject);
    procedure CheckStockAvailClick(AIdList: TStringList; ErrorText: String);
    procedure SetOnModalResultEvent(const Value: TNotifyEvent);
    procedure StockPluginsActionClick(Sender: TObject);
    procedure cxGrid1DBTableView1FUNITQTYValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

  protected

    procedure LoadFilter;
    procedure SaveFilter;
    procedure initPlugins;

    procedure SetToolBarVisible(ISVisible: Boolean);
  public
    // AGridstream : TmemoryStream ;
    FProjectId: Integer;
    ForceDocType: Integer;
    LocalDocType: Integer;
    Gridinpatch: Boolean;
    PaymentDetails: TVirtualTable;
    ASearchPanel: TSearchPanel;
    DocSelectOptions: TDocSelectOptions;
    AFormPluginRecordArray: array [0 .. 9] of TFormPluginRecord;
    ASaveList: TSaveClientDatasetCallList;
    DefaultPrice, CreditLimit, ToTalAccount: real;
    CanSetupGridLayout,
    // TaxRefOff,
    BCalcInProg, WClose, ForceCol0, InGrid, FirstGridFocus: Boolean;
    LastDocHeaderId, DefaultTaxId: Integer;
    NEWName, LastActiveStockCode: String;
    STKNoBackOrder: Boolean;
    LastStock: TStockRec;
    DummyLastStock: TStockRec;
    LastBatchLineId: Integer;
    LastDocPosted: Boolean;
    ListIsReadOnly, ShowStkGrosscost, ShowGrossAsCostprice: Boolean;
    LookupFrom, AddInvoiceForAccount, AddProjectForAccount: Integer;
    MessageNewInvoice: String;
    LookupAmount: Double;
    GoToDocId, GoToLineID: Integer;
    CopyOrderCol: Integer;
    CopyOrderDirection: Boolean;
    DocHeadQuery, OSCommerceLinkDocURL, OSCommerceLinkCustURL,
      LimitDocSql: String;
    LikeSeach: Boolean;

    OldStockValue, DebtDiscount, GlobalDiscount, TempQtyOnHand: real;
    ColInMod, IntSellingPrice, LastPnlX, LastPnlY: Integer;
    AllOk, ExclMode: Boolean;
    TmpCaption: String;
    { }
    edtWAccountID, LookAccType: Integer;
    Diff, TotalAcc, TotalLimit: Double;
    isbtnSwap: Boolean;
    AExternalForm: TForm;
    AExternalSendString: String;
    AfmStockEntry: TForm;
    AExternalMForm: TForm;
    AExternalMSendString: String;
    ExtraColorCondition: String;
    ExtraColorBg, ExtraColorFont: Tcolor;
    APluginsFormsList: TStringList;
    aDMCoreDocData: TDMCoreDocData;
    LastDate: TDatetime;
    procedure CalcAmounts;
    procedure GetUserDiscount;
    Function IsHeaderScr: Boolean;
    Procedure ShowDocForm;
    Procedure SetHideDetails;
    Procedure SetIncExclBtn;
    function GetSaveListPRefix: String;
    procedure GetInvoiceTotals(var AExcTotal, AIncTotal, ADiscountTotal,
      aNettoWeight, aGrossWeight: Double);
    property ProjectId: Integer read FProjectId write SetProjectId;
    property OnModalResultEvent: TNotifyEvent read FOnModalResultEvent
      write SetOnModalResultEvent;
  end;

var

  ForceAccountid: Integer;

implementation

uses Main, Database,
  LanguageChoice,
  BackOrdersOutstanding, XRoutines,
  GlobalFunctions, DosTextReports, FreeReportsUnit, LedgerRoutines, Lookup,
  UpdateInvoice, Clipbrd, PosRoutines,
  StockEntry, Math, OpenLink, shellapi, OSFGeneralRoutines,
  UDMTCCoreLink, NewProgress, ExportTcData, ExchangeTCData, TCDayPlanner,
  osfLookup, StrUtils, UGenSearch, UDmQuantumGridDefs, UNewDocdetails,
  UReportManager;

{$R *.DFM}

Procedure TfmInvoiceEntryGrid.GetInvoiceTotals(var AExcTotal, AIncTotal,
  ADiscountTotal, aNettoWeight, aGrossWeight: Double);
var
  TaxRate: real;
  AGrossCost: Double;

  AStockRec: TStockRecPointer;
  i: Integer;
begin
  AExcTotal := 0;
  AIncTotal := 0;
  AGrossCost := 0;
  ADiscountTotal := 0;
  aNettoWeight := 0;
  aGrossWeight := 0;

  for i := 0 to cxGrid1DBTableView1.ViewData.RecordCount - 1 do
    if VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
      [cxGrid1DBTableView1BRECONCILED.Index]) <> '1' then
    begin
      DMTCCoreLink.stockObject.getStock(AStockRec,
        VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1SREFERENCE.Index]));

      TaxRate := gettaxrateonId
        (StrToIntDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1WTAXID.Index]), 0), true);
      If ExclMode and (TaxRate <> 0) and (TaxRate <> 2) then
      begin
        AIncTotal := AIncTotal +
          FixAmount(StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records
          [i].Values[cxGrid1DBTableView1FCREDIT.Index]), 0) * TaxRate,
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        AExcTotal := AExcTotal +
          FixAmount(StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records
          [i].Values[cxGrid1DBTableView1FCREDIT.Index]), 0),
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      end
      else
      begin
        If (TaxRate <> 2) then
          AExcTotal := AExcTotal +
            FixAmount(StrToFloatDef
            (VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
            [cxGrid1DBTableView1FCREDIT.Index]), 0) / TaxRate,
            dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        // else AExcTotal := AExcTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        AIncTotal := AIncTotal +
          FixAmount(StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records
          [i].Values[cxGrid1DBTableView1FCREDIT.Index]), 0),
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      end;

      if StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1FTAXAMOUNT.Index]), 0) <> 0 then
      begin
        ADiscountTotal := ADiscountTotal +
          FixAmount(
          ((StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i]
          .Values[cxGrid1DBTableView1FTAXAMOUNT.Index]), 0) / 100) *
          (StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
          [cxGrid1DBTableView1FDEBIT.Index]),
          0) * StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i]
          .Values[cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0))),
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      end;
      aNettoWeight := aNettoWeight +
        StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0) * AStockRec.FNettoWeigth;
      aGrossWeight := aGrossWeight +
        StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0) * AStockRec.FGrossWeigth;

      AGrossCost := AGrossCost +
        (StrToFloatDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0) * AStockRec.FAvgUnitCost
        * TDataBaseStockRoutines.GetUnitQty
        (StrToIntDef(VarToStr(cxGrid1DBTableView1.ViewData.Records[i].Values
        [cxGrid1DBTableView1WUNITID.Index]), 0)));

    end;

  // if NBDocuments.PageIndex <> 1 then exit ;
  { AQuery := TuniQuery.Create(nil);
    try
    AQuery.Connection := dmDatabase.ZMainconnection ;
    AQuery.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('invoiceEntry_Taxttotal');
    AQuery.open ;
    AExcTotal := 0;
    AIncTotal := 0;
    AGrossCost := 0 ;
    ADiscountTotal := 0;
    aNettoWeight := 0 ;
    aGrossWeight := 0 ;
    while not AQuery.eof do
    begin

    TaxRate := gettaxrateonId(AQuery.fieldbyName('WTaxId').AsInteger,true);
    If ExclMode and (TaxRate<>0) and (TaxRate<>2)  then
    begin
    AIncTotal := AIncTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat*TaxRate,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    AExcTotal := AExcTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    end
    else
    begin
    If (TaxRate<>2) then
    AExcTotal := AExcTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat /TaxRate,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    // else AExcTotal := AExcTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    AIncTotal := AIncTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    end;
    if AQuery.FieldByName('FTAXAMOUNT').AsFloat<>0 then
    begin
    ADiscountTotal := ADiscountTotal + FixAmount(((AQuery.FieldByName('FTAXAMOUNT').AsFloat/ 100) * (AQuery.FieldByName('FDebit').AsFloat * AQuery.FieldByName('SCONTRAACCOUNT').AsFloat )) ,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    end;
    aNettoWeight :=  aNettoWeight + StrToFloatDef(AQuery.FieldByName('SCONTRAACCOUNT').AsString,0) * AQuery.FieldByName('FNETTOWEIGHT').asfloat ;
    aGrossWeight :=  aGrossWeight + StrToFloatDef(AQuery.FieldByName('SCONTRAACCOUNT').AsString,0) * AQuery.FieldByName('FGROSSWEIGHT').asfloat ;
    if AQuery.FindField('FUNITAVECOST') <> nil then
    AGrossCost    :=  AGrossCost + (StrToFloatDef(AQuery.FieldByName('SCONTRAACCOUNT').AsString,0) * AQuery.FieldByName('FUNITAVECOST').asfloat * TDataBaseStockRoutines.GetUnitQty(AQuery.FieldByName('WUNITID').AsInteger) ) ;

    AQuery.Next;
    end;
    finally
    AQuery.Free ;
    end;
  }
  if not fmStockLinkDetail.ZQDoclineLink.IsEmpty then
  begin
    fmStockLinkDetail.ZQDoclineLink.first;
    while not fmStockLinkDetail.ZQDoclineLink.Eof do
    begin
      DMTCCoreLink.stockObject.getStockOnid(AStockRec,
        fmStockLinkDetail.ZQDoclineLinkWSTOCKID.AsInteger);
      aNettoWeight := aNettoWeight + fmStockLinkDetail.ZQDoclineLinkFQTYSHIPPED.
        AsFloat * AStockRec^.FNettoWeigth;
      aGrossWeight := aGrossWeight + fmStockLinkDetail.ZQDoclineLinkFQTYSHIPPED.
        AsFloat * AStockRec^.FGrossWeigth;

      AIncTotal := AIncTotal +
        FixAmount(fmStockLinkDetail.ZQDoclineLinkFINCLUSIVEAMT.AsFloat,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      AExcTotal := AExcTotal +
        FixAmount(fmStockLinkDetail.ZQDoclineLinkFEXCLUSIVEAMT.AsFloat,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      AGrossCost := AGrossCost +
        (fmStockLinkDetail.ZQDoclineLinkFQTYSHIPPED.AsFloat *
        AStockRec^.FUnitCost);
      fmStockLinkDetail.ZQDoclineLink.next;
    end;
  end;

  if stgrosscost.Visible then
  begin
    stgrosscost.caption :=
      FloatToStrF(FixAmount(AGrossCost,
      dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
      dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals);
    Label10.caption := GetTextLang(228);
    stGrossProfit.caption := FloatToStrF(FixAmount(AExcTotal - AGrossCost,
      dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
      dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals);
    Label23.caption := GetTextLang(1188);
  end;
end;

Procedure TfmInvoiceEntryGrid.UpdateTotalsLbls;
var
  ExclTotal, InvTotal, DiscTotal, NettoWeigth, GrossWeigth: Double;
begin
  FieldChgd := false;
  GetInvoiceTotals(ExclTotal, InvTotal, DiscTotal, NettoWeigth, GrossWeigth);
  ExclTotal := FixAmount(ExclTotal, 2);
  UpDateLabels;
  Label2.caption := GetTextLang(645);
  LNettoWeigth.caption := formatfloat('0.00', NettoWeigth);
  LGrossWeigth.caption := formatfloat('0.00', GrossWeigth);
  LblExcl.caption := FloatToStrF(FixAmount(ExclTotal,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
  Label5.caption := GetTextLang(609);
  LblTax.caption := FloatToStrF(FixAmount(InvTotal - ExclTotal,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
  Label4.caption := GetTextLang(646);
  lblInvAmt.caption := FloatToStrF(FixAmount(InvTotal,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
  Label1.caption := GetTextLang(647);
  LblDiscount.caption := FloatToStrF(DiscTotal, ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
  lblPostBal.caption := FloatToStrF(TotalAcc + InvTotal, ffFixed, 18, 2) + ' ';
  lblAvailable.caption := FloatToStrF(TotalLimit - (TotalAcc + InvTotal),
    ffFixed, 18, 2) + ' ';
  PaymentDetails.first;
  ExclTotal := 0;
  while not PaymentDetails.Eof do
  begin
    ExclTotal := ExclTotal + PaymentDetails.Fields[0].AsFloat;
    PaymentDetails.next;
  end;
  LPaymentTotal.caption :=
    FloatToStrF(FixAmount(ExclTotal,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
  // if not  Gridinpatch then
  // updatepricelist ;
  MOptions.Lines.Text := '';
  if tblBatchSREFERENCE.AsString <> '' then
  begin
    MOptions.Lines.Text := DocSelectOptions.GetLineText
      (tblBatchWLINEID.AsInteger);
  end;
  if not PEditPriceInner.Visible then
  begin
    PEditPrice.Visible := MOptions.Lines.Text <> '';
    MOptions.Visible := MOptions.Lines.Text <> '';
  end;
  EshipmentExit(self);
end;

Procedure TfmInvoiceEntryGrid.UpDateLabels;
begin
  if FindIndexOfName(tblBatchFDEBIT.FieldName) = -1 then
    exit;
  if ExclMode then
  begin
    cxGrid1DBTableView1FDEBIT.caption := GetTextLang(648);
    cxGrid1DBTableView1.Columns[FindIndexOfName(tblBatchFCREDIT.FieldName)
      ].caption := GetTextLang(650);
  end
  else
  begin
    cxGrid1DBTableView1.Columns[FindIndexOfName(tblBatchFDEBIT.FieldName)
      ].caption := GetTextLang(649);
    cxGrid1DBTableView1.Columns[FindIndexOfName(tblBatchFCREDIT.FieldName)
      ].caption := GetTextLang(651);
  end;
  SetIncExclBtn;
end;

Procedure TfmInvoiceEntryGrid.UpDateThemes;
begin

  LoadT3image(Image1, ThemePath + 'backGround2.Jpg');
end;

procedure TfmInvoiceEntryGrid.GetUserDiscount;
Var
  Disc: real;
begin
  if FixAmount(tblBatchFDEBIT.Value *
    Str2Float(tblBatchSCONTRAACCOUNT.AsString)) = 0 then
    exit;
  Disc := ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) -
    tblBatchFCREDIT.Value);
  if Disc = 0 then
  begin
    if tblBatchFTAXAMOUNT.Value <> 0 then
      tblBatch.Edit;
    tblBatchFTAXAMOUNT.Value := 0;
    exit;
  end;
  Disc := (Disc / ((tblBatchFDEBIT.Value *
    Str2Float(tblBatchSCONTRAACCOUNT.AsString))) * 100);
  tblBatch.Edit;
  tblBatchFTAXAMOUNT.Value := Disc;
end;

procedure TfmInvoiceEntryGrid.CalcAmounts;
Var
  xfactor: Double;
begin
  BCalcInProg := true;
  // done : pieter dont update for the amount column
  if cxGrid1DBTableView1.Controller.FocusedColumn =
    cxGrid1DBTableView1FCREDIT then
    exit;
  if DMTCCoreLink.ExtraOptions.Values['BUSEDATEFFROMMLTP'] = 'TRUE' then
    xfactor := tblBatchFUNITQTY.AsFloat
  else
    xfactor := 1;
  if UseMuliplier = 1 then
    xfactor := tblBatchFUNITQTY.AsFloat;
  if UseMuliplier = 2 then
  begin
    if tblBatchFUNITQTY.AsFloat <> 0 then
      xfactor := 1 / tblBatchFUNITQTY.AsFloat
    else
      xfactor := 1;
  end;
  tblBatch.Edit;
  if (tblBatchFTAXAMOUNT.Value > 0) and
    (tblBatchSCONTRAACCOUNT.Value <> '') then
    tblBatchFCREDIT.Value := xfactor *
      (FixAmount(tblBatchFDEBIT.Value *
      (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
      dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
      ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
      (tblBatchFTAXAMOUNT.Value / 100)))
  else
    tblBatchFCREDIT.Value := xfactor *
      (FixAmount(Str2Float(tblBatchFDEBIT.AsString) *
      (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
      dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
  if (GlobalDiscount > 0) and (LastStock.BApplyDiscount) then
  begin
    if tblBatchFCREDIT.AsFloat <> 0 then
      if tblBatchFTAXAMOUNT.AsFloat = 0 then
      begin
        if (cxGrid1DBTableView1.Controller.FocusedColumn <>
          cxGrid1DBTableView1FTAXAMOUNT) then
          tblBatchFTAXAMOUNT.AsFloat := GlobalDiscount;
        tblBatchFCREDIT.Value :=
          FixAmount(tblBatchFDEBIT.Value *
          (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
          ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
          (tblBatchFTAXAMOUNT.Value / 100))
      end;
  end;

  BCalcInProg := false;

    UpdateTotalsLbls;
end;

procedure TfmInvoiceEntryGrid.CalcAmountsFromDiscount(MultiPlier: Double);
begin
  BCalcInProg := true;

  if (tblBatchFTAXAMOUNT.Value > 0) and
    (tblBatchSCONTRAACCOUNT.Value <> '') then
    tblBatchFCREDIT.Value :=
      FixAmount(tblBatchFDEBIT.Value * (Str2Float(tblBatchSCONTRAACCOUNT.Value)
      ), dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
      ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
      (tblBatchFTAXAMOUNT.Value / 100))
  else
    tblBatchFCREDIT.Value := FixAmount(Str2Float(tblBatchFDEBIT.AsString) *
      (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
      dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
      ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
      (tblBatchFTAXAMOUNT.Value / 100));
  BCalcInProg := false;
end;

procedure TfmInvoiceEntryGrid.FormShow(Sender: TObject);
Var
  i, X: Integer;
  AItem: TcxGridDBBandedColumn;
  ColFound: Boolean;
  ADutchStyle: Boolean;
  procedure DoMenuCheckForType(AmenuItem: TMenuItem);
  begin
    if cbDocTypenew.Items.IndexOfObject(TObject(AmenuItem.Tag)) = -1 then
      AmenuItem.Visible := false
    else
    begin
      AmenuItem.caption := cbDocTypenew.Items
        [cbDocTypenew.Items.IndexOfObject(TObject(AmenuItem.Tag))];
    end;
  end;

  procedure CtrlSwap(AControl, BControl: TControl);
  var
    OldPoint: TPoint;
    OldTab: Integer;
  begin
    OldTab := 0;
    OldPoint.Y := AControl.Top;
    if (AControl is TEdit) then
      OldTab := TEdit(AControl).TabOrder;
    AControl.Top := BControl.Top;
    if (AControl is TEdit) then
    begin
      OldTab := TEdit(AControl).TabOrder;
      TEdit(AControl).TabOrder := TEdit(BControl).TabOrder;
    end;
    BControl.Top := OldPoint.Y;
    if (AControl is TEdit) then
      TEdit(BControl).TabOrder := OldTab;
  end;

begin
  if idDocType < 10 then
  begin
    idDocType := 10;

  end;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  lLimitRows.caption := DMTCCoreLink.GetTextLangNoAmp(3562);

  if not HasBeenInitialized then
  begin
    HasBeenInitialized := true;
    BPurVis := DMTCCoreLink.ReadNwReportOp('EDITSTKPRHIDCOL', true);

    Up1.caption := DMTCCoreLink.GetTextLang(1843);
    Down1.caption := DMTCCoreLink.GetTextLang(1844);
    Invoicetoorderondefsupp11.caption := DMTCCoreLink.GetTextLang(3311);
    ExtraColorCondition := DMTCCoreLink.ReadLongSysparam('INVCOLORCOND',
      DMTCCoreLink.currentuser, 0);
    ExtraColorBg := DMTCCoreLink.ReadSysParam('INVCOLORBG', clRed,
      DMTCCoreLink.currentuser);
    ExtraColorFont := DMTCCoreLink.ReadSysParam('INVCOLORFONT', clWhite,
      DMTCCoreLink.currentuser);
    Bexport.caption := DMTCCoreLink.GetTextLang(20063);
    if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1' then
    begin
      // switch postal code
      ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT', false, 0);
    end
    else
    begin
      ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT', true, 0);
    end;

    if ADutchStyle then
    begin
      CtrlSwap(LPostal, LAddress3);
      CtrlSwap(LPostal, LAddress2);
      CtrlSwap(EPostalCode, EPostal3);
      CtrlSwap(EPostalCode, EPostal2);
      CtrlSwap(EDelPostal, EDelAdr3);
      CtrlSwap(EDelPostal, EDelAdr2);
    end;
    DMTCCoreLink.LoadImage(BitSetPrint.Glyph, 'Printer');
    DMTCCoreLink.LoadImage(BitBtn1.Glyph, 'Ok');
    DMTCCoreLink.LoadImage(BitBtnCancel.Glyph, 'Cancel');
    DMTCCoreLink.LoadImage(Bexport.Glyph, 'Export');

    BitBtn1.caption := GetTextLang(167);
    BitBtnCancel.caption := GetTextLang(168);
    Thideshowitems.caption := DMTCCoreLink.GetTextLang(3309);
    DMTCCoreLink.LoadImage(BtnCopyOk.Glyph, 'Ok');
    DMTCCoreLink.LoadImage(BtnCopyCancel.Glyph, 'Cancel');

    DMTCCoreLink.LoadImage(BtnOkPrint.Glyph, 'Ok');
    DMTCCoreLink.LoadImage(BtnClose.Glyph, 'Cancel');

    EditAccount1.caption := DMTCCoreLink.GetTextLang(3180);
    ConverttoCreditnote1.caption := DMTCCoreLink.GetTextLang(3181);
    Totals1.caption := DMTCCoreLink.GetTextLang(1360);
    LEnternewtotal.caption := DMTCCoreLink.GetTextLang(3322);

    Createbackorderstodeliver1.caption := DMTCCoreLink.GetTextLang(3323);

    OpenOSCOmmercecustomerinbrowser1.caption := DMTCCoreLink.GetTextLang(3182);
    openOSCommerceorderinbrowser1.caption := DMTCCoreLink.GetTextLang(3183);
    ReaplayITemsDicounts.caption := DMTCCoreLink.GetTextLangNoAmp(3264);
    Convertdocumentstosingledocument1.caption := DMTCCoreLink.GetTextLang(3184);

    Createpurchaseondefaultsupplier11.caption := DMTCCoreLink.GetTextLang(3185);

    LtaxRef.caption := DMTCCoreLink.GetTextLangNoAmp(202);
    lstate.caption := DMTCCoreLink.GetTextLangNoAmp(1293);
    cbPosted.Items[0] := DMTCCoreLink.GetTextLangNoAmp(163);
    cbPosted.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1877);
    cbPosted.Items[2] := DMTCCoreLink.GetTextLangNoAmp(961);
    BtnCopyOk.caption := GetTextLang(167);
    BtnCopyCancel.caption := GetTextLang(168);

    DMTCCoreLink.LoadImage(BtnOk.Glyph, 'Ok');
    DMTCCoreLink.LoadImage(BtnCancel.Glyph, 'Cancel');

    LLPaymentTotal.caption := DMTCCoreLink.GetTextLang(2232);

    Export1.caption := DMTCCoreLink.GetTextLangNoAmp(20063);
    Import1.caption := DMTCCoreLink.GetTextLangNoAmp(2014);

    CopyDocTo1.caption := DMTCCoreLink.GetTextLangNoAmp(3423);
    DisableItemsList := ReadLongSysparam('DISABLEITEMSDOC', currentuser);

    LProject.caption := DMTCCoreLink.GetTextLang(3099);
    LNetto.caption := DMTCCoreLink.GetTextLang(3127);
    LGross.caption := DMTCCoreLink.GetTextLang(3128);
    dmDatabase.ZQMessage.SQL.Text :=
      'select * from messages where WmessageId = -1';
    dmDatabase.ZQMessage.Open;
    // set field length.
    EdComment.MaxLength := dmDatabase.ZQMessageSDESCRIPTION.Size +
      dmDatabase.ZQMessageSEXTRADESCRIPTION.Size;
    dmDatabase.ZQMessage.close;

    QDocHead.close;
    Setdate1.Visible := DMTCCoreLink.ReadSysParam('INV_USESETDATE', false, 0);
    RecalcStockAvail.Visible := DMTCCoreLink.ReadSysParam('STO_USEINVGRSORT',
      false, 0);
    CannotEditDesc := DMTCCoreLink.ReadNwReportOp('STKNoEditDesc', false);

    cbViewUnPosted2.Items[0] := DMTCCoreLink.GetTextLangNoAmp(961);
    cbViewUnPosted2.Items[1] := DMTCCoreLink.GetTextLangNoAmp(962);
    cbViewUnPosted2.Items[2] := DMTCCoreLink.GetTextLangNoAmp(1098);
    cbViewUnPosted2.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1877);

    TcxImageComboBoxProperties(cxlistDBTableBPOSTED.Properties).Items.clear;

    with TcxImageComboBoxProperties(cxlistDBTableBPOSTED.Properties)
      .Items.Add do
    begin
      Value := 1;
      Description := DMTCCoreLink.GetTextLangNoAmp(961);
    end;
    with TcxImageComboBoxProperties(cxlistDBTableBPOSTED.Properties)
      .Items.Add do
    begin
      Value := 0;
      Description := DMTCCoreLink.GetTextLangNoAmp(962);
    end;
    with TcxImageComboBoxProperties(cxlistDBTableBPOSTED.Properties)
      .Items.Add do
    begin
      Value := -1;
      Description := DMTCCoreLink.GetTextLangNoAmp(1877);
    end;

    cbViewUnPosted2.ItemIndex := 0;
    LContact.caption := DMTCCoreLink.GetTextLangNoAmp(2415);
    LPostal.caption := DMTCCoreLink.GetTextLangNoAmp(190);
    LAddress1.caption := DMTCCoreLink.GetTextLangNoAmp(2220);
    LAddress2.caption := DMTCCoreLink.GetTextLangNoAmp(2206);
    LAddress3.caption := DMTCCoreLink.GetTextLangNoAmp(2420);
    LCompany.caption := DMTCCoreLink.GetTextLangNoAmp(2279);
    LCountry.caption := DMTCCoreLink.GetTextLangNoAmp(2207);
    // cbPosted.Caption :=  DMTCCoreLink.GetTextLangNoAmp(961);

    GoToStockQty := DMTCCoreLink.ReadNwReportOp('STKGotoQty', false);
    GoToStockQtyReturnAuto := DMTCCoreLink.ReadNwReportOp('STKGotoQty2', false);

    CannotEditPrice := DMTCCoreLink.ReadNwReportOp('STKNoEditPrice', false);
    // tblBatch.Open;
    tblBatchFDEBIT.DisplayFormat := GetViewMask(8);
    tblBatchFDEBIT.EditFormat := '0.00#######';
    tblBatchFCREDIT.DisplayFormat := GetViewMask(8);
    tblBatchFCREDIT.EditFormat := '0.00#######';

    FillStringListWithSelect(CBCountry.Items,
      'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
    FillStringListWithSelect(cbProject.Items,
      'SELECT WJOBPROJECTID, trim(SJOBPROJECTCODE) || '+ QuotedStr(' ') +'||SDESCRIPTION SJOBPROJECTCODE  FROM JOBPROJECT where BENABLED =1');
    FillStringListWithSelect(CBDelCountry.Items,
      'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
    OSCommerceLinkDocURL := ReadLongReportOp('OSCOMMERCEINVOICELINK');
    OSCommerceLinkCustURL := ReadLongReportOp('OSCOMMERCECUSTOMERLINK');
    LimitDocSql := ReadLongSysparam('LIMITDOCSQL', currentuser);
    openOSCommerceorderinbrowser1.Visible := OSCommerceLinkDocURL <> '';
    OpenOSCOmmercecustomerinbrowser1.Visible := OSCommerceLinkCustURL <> '';
    // tblBatch.IndexFieldNames := 'WlineId' ;

    STKNoBackOrder := ReadReportOp('STKNoBackOrder', false).AsBoolean;
    // QDocHeadSACCOUNTCODE.Size := MainAccountLength ;
    QDocHeadSACCOUNTCODE.Size := MainAccountLength + 3;
    BProcess.Visible := ReadSysParam('CBDOCPosting', false, currentuser)
      .AsBoolean;
    BDelete.Visible := ReadSysParam('CBDOCPosting', false, currentuser)
      .AsBoolean;
    Openitem1.caption := GetTextLang(360); // openitem

    cxlistDBTableSACCOUNTCODE.caption := GetTextLang(176 { AccountCode } );
    cxlistDBTableSACCOUNTDESCRIPTION.caption :=
      GetTextLang(606 { Account desc } );
    cxlistDBTableSDOCNO.caption := GetTextLang(1120 { DocNo } );
    cxlistDBTableSREFERENCE.caption := GetTextLang(607 { Reference } );
    cxlistDBTableFDOCAMOUNT.caption := GetTextLang(651 { Doc amount } );
    cxlistDBTableEXCAMOUNT.caption := GetTextLang(650 { Exc amount } );
    cxlistDBTableFTAXAMOUNT.caption := GetTextLang(1138);

    cxlistDBTableDDATE.caption := GetTextLang(238);
    cxlistDBTableSGROUP1DESC.caption := GetGroupDisplayName(rgtdoc1);
    cxlistDBTableSGROUP2DESC.caption := GetGroupDisplayName(rgtdoc2);
    cxlistDBTableBPRINTED.caption := GetTextLang(2964);
    cxlistDBTableBPOSTED.caption := GetTextLang(1293);
    cxlistDBTableSSALESMANDESCRIPTION.caption := GetTextLang(198);
    cxlistDBTableCALOPENAMOUNT.caption := GetTextLang(1885);
    cxlistDBTableDDUEDATE.caption := GetTextLang(2222);

    // need to be "printed" as text
    // DBGSearch.Columns[11].Title.Caption := gettextlang(238);
    ShowHintForLine := false;
    Showinfo1.caption := GetTextLang(392);

    BProcess.caption := GetTextLang(310);
    BDelete.caption := GetTextLang(24);
    Label21.caption := GetTextLang(2222);

    LField.caption := GetTextLang(944);
    CBOperatot.Items[0] := GetTextLang(20025);
    LFilterValue.caption := GetTextLang(2871);
    BFilter.caption := GetTextLang(20097);
    BClear.caption := GetTextLang(1016);
    BPrint.caption := GetTextLang(52);
    BtnClose2.caption := GetTextLang(828);
    CBOperatot.Items[0] := GetTextLang(20025);
    tlbtnExclIncl.caption := GetTextLang(371);
    tlbtnIncl.caption := GetTextLang(664);
    tlbtnExclIncl.ImageIndex := 4;
    tlbtnIncl.ImageIndex := 8;
    cbSimplelayout.caption := DMTCCoreLink.GetTextLangNoAmp(3032);
    // TDatabaseRegistyRoutines.ReadFormPos(self,GetSaveListPRefix);

    // init fields
    if FProjectId <> 0 then
      begin
       LProject.Visible := False ;
       cbProject.Visible := False ;
      end;

    QDocHead.close;
    QDocHead.SQL.Text :=
      format(dmDatabase.SQLList.GetFormatedSQLByName
      ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['']) +
      ' and dochead.WDocid is null';
    TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(QDocHead, '');
    For i := 0 to QDocHead.FieldCount - 1 do
    begin
      QDocHead.Fields[i].Origin := 'dochead.' + QDocHead.Fields[i].FieldName;
    end;

    if dmDatabase.SQLList.SQLCollection.GetItemByName('DocOrg') <> nil then
      with dmDatabase.SQLList.SQLCollection.GetItemByName('DocOrg').SQL do
      begin
        for i := 0 to Count - 1 do
        begin
          if QDocHead.FindField(Names[i]) <> nil then
            QDocHead.FindField(Names[i]).Origin := ValueFromIndex[i];
        end;
      end;

    cxlistDBTable.DataController.GridView.BeginUpdate;
    cxlistDBTable.DataController.BeginUpdateFields;
    try
      for i := 0 to QDocHead.FieldCount - 1 do
      begin
        ColFound := false;
        for X := 0 to cxlistDBTable.ColumnCount - 1 do
        begin
          if cxlistDBTable.Columns[X].DataBinding.FieldName = QDocHead.Fields[i]
            .FieldName then
          begin
            ColFound := true;
            break;
          end;
        end;

        if not ColFound and ((POS('TRN_', QDocHead.Fields[i].FieldName) = 1) or
          (POS('FT_', QDocHead.Fields[i].FieldName) = 1)) then
        begin

          AItem := TcxGridDBBandedColumn
            (cxlistDBTable.DataController.GridView.CreateItem);
          AItem.Position.BandIndex := 1;
          AItem.DataBinding.FieldName := QDocHead.Fields[i].FieldName;

        end;
      end;

    finally
      cxlistDBTable.DataController.EndUpdateFields;
      cxlistDBTable.DataController.GridView.EndUpdate;
    end;

    QDocHeadEXCAMOUNT.Origin := '(dochead.FDocAmount - dochead.FTaxAmount)';
    QDocHeadSGROUP1DESC.Origin := 'Group1.SDescription';
    QDocHeadSGROUP2DESC.Origin := 'Group2.SDescription';
    QDocHeadSACCOUNTDESCRIPTION.Origin := 'Account.SDescription';
    QDocHeadSACCOUNTCODE.Origin := 'Account.SAccountCode';
    QDocHeadSSALESMANDESCRIPTION.Origin := 'Salesman.SDescription';
    QDocHeadOPENAMOUNT.Origin := 'transact.FOutstandingAmount';
    QDocHeadCALOPENAMOUNT.Origin := 'transact.FOutstandingAmount';

    LoadFilter;

    if self.parent = nil then
      TDatabaseRegistyRoutines.ReadFormPos(self, GetSaveListPRefix);

    DoDropDownLookup;

    CBFindColumn.ItemIndex := 1;
    LoadFilter;
    cbDoc1group.Visible := TDataBaseRoutines.FillStringsWithReportingGroups
      (cbDoc1group.Items, 28, false);
    if cbDoc1group.Visible then
    begin
      cbDoc1group.Items.Insert(0, DMTCCoreLink.GetTextLangNoAmp(1084));
    end;

    try
      if EFilterValue.CanFocus then
        EFilterValue.SetFocus;
    except
    end;
    // ListOrderBy := LastIndex +1 ;

    // ListOrderBy := DBGSearch.Columns[0].Field.Index +1 ;

    // BDirection := false ;
    FirstTime := false;

    NEWName := StringReplace(UPPERCASE(GetTextLang(983)), '&', '',
      [rfreplaceall]);
    if NEWName = '' then
      NEWName := 'NEW';

    isbtnSwap := false;
    CanSetupGridLayout := true;
    FillScrDetails(Sender);
    WinFormID := 'DOCS';
    WClose := false;
    ForceCol0 := false;
    ColInMod := -1;
    IntSellingPrice := 1;
    LoadPrintOutModes(cbDestination);
    cbDestinationChange(self);
    if ForceDocType = 0 then
    begin
      TDataBaseDocumentRoutines.LoadDocTypes(cbDocTypenew.Items, false, true);
      DoMenuCheckForType(ctOrder);
      DoMenuCheckForType(ctPurchase);
      DoMenuCheckForType(ctReturnnote);
      DoMenuCheckForType(ctQuote);
      DoMenuCheckForType(ctInvoice);
      DoMenuCheckForType(ctCreditnote);
      DoMenuCheckForType(ctStockin);
      DoMenuCheckForType(ctStockout);
      cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
        (TObject(LocalDocType));
    end
    else
    begin
      cbDocTypenew.Items.clear;
      cbDocTypenew.Items.AddObject('X', TObject(ForceDocType));
      LocalDocType := ForceDocType;
      if ForceDocType > 18 then
      begin
        LocalDocType := 14 + (ForceDocType mod 2);
        cbDocTypenew.Items.AddObject('X', TObject(ForceDocType));
      end;
      cbDocTypenew.ItemIndex := 0;
      cbDocTypenew.Visible := false;
      Label7.Visible := false;
    end;

    cbDocTypenewChange(nil);
    // cbDocType.Items.DelimitedText:= LoadDocTypes(15);
    Label7.caption := GetTextLang(38);
    Label1i.caption := GetTextLang(30);

    edtCount.Text := IntToStr(PrnVars.NumCopies);
    dmDatabase.tblSysVars.Open;
    // Add Selling Prices Name
    PriceList.TitleCaptions.DelimitedText := GetTextLang(1122);
    for i := 0 to 2 do
      PriceList.Strings[i] := dmDatabase.tblSysVars.FieldByName
        ('SSellingPriceName' + IntToStr(i + 1)).AsString + '=0.00';

    dmDatabase.tblSysVars.close;

    Label2.caption := GetTextLang(645);
    LblExcl.caption := formatfloat('0.00', 0);

    LNettoWeigth.caption := formatfloat('0.00', 0);
    LGrossWeigth.caption := formatfloat('0.00', 0);

    Label5.caption := GetTextLang(609);
    LblTax.caption := formatfloat('0.00', 0);
    Label4.caption := GetTextLang(646);
    lblInvAmt.caption := formatfloat('0.00', 0);
    Label1.caption := GetTextLang(647);
    LblDiscount.caption := formatfloat('0.00', 0);
    UpDateThemes;

    dmDatabase.CalledFromBatch := false;
    self.caption := GetTextLang(928); // 'Document Entry';
    StatusBar.Panels[1].Text := self.caption;
    FieldChgd := false;

    Label3.caption := GetTextLang(2151);
    BNew.caption := GetTextLang(2888);
    BEdit.caption := GetTextLang(2889);

    Printlabel1.caption := GetTextLang(68); // print labels
    Printbarcodes1.caption := GetTextLang(2953); // Print bacodes
    Changeaccount1.caption := GetTextLang(2954); // Change account
    ConverttoInvoice1.caption := GetTextLang(1874); // Confirm Quotes and Orders
    BCopyFilter.caption := GetTextLang(20097);
    CBOnlyThisDebtor.caption := GetTextLang(3007);
    CBAllDocuments.caption := GetTextLang(3011);

    Convertinvoicetopurchase1.caption := GetTextLang(3020);
    Copydocument1.caption := GetTextLang(3021);
    Setreportinggroup1.caption := GetTextLang(3022) + '    ';
    Setreportinggroup2.caption := GetTextLang(3023);
    Documents1.caption := GetTextLang(38);
    Print1.caption := GetTextLang(52);
    Plugins1.caption := GetTextLang(3282);
    Massaction1.caption := GetTextLang(3281);
    Extras1.caption := GetTextLang(1905);

    openOSCommerceorderinbrowser1.caption := GetTextLang(3024);
    OpenOSCOmmercecustomerinbrowser1.caption := GetTextLang(3025);
    if ListIsReadOnly then
      Panel4.Visible := false;
    try
      cxlist.SetFocus;
    except
    end;
    if ReadSysParam('AutoRefreschDoc', false, currentuser).AsBoolean then
      if not ListIsReadOnly then
      begin
        TUpdateDocuments.Interval := 1000 *
          StrToInt(ReadSysParam('AutoRefreshInterval', '60', currentuser)
          .AsString);
        TUpdateDocuments.Tag := 1;
        TUpdateDocuments.Enabled := true;
      end;
    QDocHeadFDOCAMOUNT.DisplayFormat :=
      dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask;
    QDocHeadFTAXAMOUNT.DisplayFormat :=
      dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask;
    QDocHeadEXCAMOUNT.DisplayFormat :=
      dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask;
    QDocHeadCALOPENAMOUNT.DisplayFormat :=
      dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask;
  end // end init
  else
    RefreschDocumentList();
  if DisableItemsList <> '' then
    HandelSpecialUserMenu(self, '', DisableItemsList);
  if AddInvoiceForAccount <> 0 then
    BNewClick(self);
  if not QDocHead.Active then
    RefreschDocumentList();
end;

Procedure TfmInvoiceEntryGrid.DeleteDocLine;
var
  StockCde: String;
  AExternalSendString: String;
begin
  if tblBatch.IsEmpty then
    exit;
  if AExternalForm <> nil then
  begin
    AExternalSendString := 'DELETELINE=' + IntToStr(LastDocHeaderId) + #13 + #10
      + GetPluginLineString;
    AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
      pchar(AExternalSendString));
  end;
  MyLocBatSerInput.DeleteLine(tblBatchWLINEID.AsInteger);
  DocSelectOptions.DeleteLine(tblBatchWLINEID.AsInteger);
  fmStockLinkDetail.DeleteLine(tblBatchWLINEID.AsInteger);
  StockCde := tblBatchSREFERENCE.AsString;
  tblBatch.Delete;
end;

procedure TfmInvoiceEntryGrid.tlbtnDeleteClick(Sender: TObject);

begin
  if (tblBatchSREFERENCE.AsString <> '') or (tblBatchBRECONCILED.Value = 1) then

    if OSFMessageDlg(format(DMTCCoreLink.GetTextLang(2881),
      [DMTCCoreLink.GetTextLang(592)]), mtConfirmation, [mbYes, mbNo], 0)
      = mrno then
      exit;

  cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
  DeleteDocLine;
  LastStock.SSTOCKCODE := '';
  LastStock.WStockID := -1;
  LastStock.WStockTypeId := 0;
  UpdateTotalsLbls;
  cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
end;

procedure TfmInvoiceEntryGrid.tlbtnInsertClick(Sender: TObject);
begin

  if cxGrid1DBTableView1.Controller.FocusedColumnindex <> 0 then
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
  if (Sender <> EFastbarcodelookup) then
    EFastbarcodelookup.Text := '';

  if (Sender = EFastbarcodelookup) and
    (Trim(EFastbarcodelookup.Text) <> '') then
  begin
    if (tblBatchBRECONCILED.Value = 0) and
      (tblBatchSREFERENCE.AsString = '') then
      tblBatch.Edit
    else
      tblBatch.Append;

  end
  else
    tblBatch.Insert;
  if (Sender = EFastbarcodelookup) then
    EditStockTimer(self);
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceKeyPress(Sender: TObject;
  var Key: Char);
var
  IndexSet: Set of byte;
  i: Integer;
begin
  If not(LastStock.WStockTypeId in [7]) then
  begin
    IndexSet := [];
    i := FindIndexOfName(tblBatchFCREDIT.FieldName);
    if i >= 0 then
      IndexSet := IndexSet + [i];

    i := FindIndexOfName(tblBatchFDEBIT.FieldName);
    if i >= 0 then
      IndexSet := IndexSet + [i];

    i := FindIndexOfName(tblBatchFTAXAMOUNT.FieldName);
    if i >= 0 then
      IndexSet := IndexSet + [i];

    i := FindIndexOfName(tblBatchSACCOUNT.FieldName);
    if i >= 0 then
      IndexSet := IndexSet + [i];

    i := FindIndexOfName(tblBatchSCONTRAACCOUNT.FieldName);
    if i >= 0 then
      IndexSet := IndexSet + [i];

    if (cxGrid1DBTableView1.Controller.FocusedColumn.Index in IndexSet) then
    begin
      if (Key = '.') then
        Key := DecimalSeparator
      else if POS(Key, '0123456789-' + DecimalSeparator + #8 + #13 + #17 + #16 +
        #3 + #22) = 0 then
        Key := #0;

    end;
  end;

  if Key = #4 then
  begin
    tlbtnDeleteClick(Sender);
    Key := #0;
  end;
  if Key = #14 then
  begin
    tlbtnInsertClick(Sender);
    Key := #0;
  end;
  // this way you cant type in to the comment field.
  // But tab is always next field
  if Key <> #9 then
    If tblBatchBRECONCILED.Value = 1 then
    begin
      dbgridInvoiceDblClick(self);
      Key := #0;
    end;

  if Key <> #9 then
    If (LastStock.WStockTypeId in [7, 8]) then
    begin
      if not((cxGrid1DBTableView1.Controller.FocusedColumn.
        Index = FindIndexOfName(tblBatchSDESCRIPTION.FieldName)) or
        (cxGrid1DBTableView1.Controller.FocusedColumn.
        Index = FindIndexOfName(tblBatchFTAXAMOUNT.FieldName)) or
        (cxGrid1DBTableView1.Controller.FocusedColumn.
        Index = FindIndexOfName(tblBatchSACCOUNT.FieldName)) or
        (cxGrid1DBTableView1.Controller.FocusedColumn.
        Index = FindIndexOfName(tblBatchFCREDIT.FieldName))) then
      begin
        dbgridInvoiceDblClick(self);
        Key := #0;
      end;
    end;
end;

function TfmInvoiceEntryGrid.FindIndexOfName(aName: String): Integer;
var
  i: Integer;
begin
  for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
  begin
    if UPPERCASE(TcxGridDBColumn(cxGrid1DBTableView1.Columns[i])
      .DataBinding.FieldName) = UPPERCASE(aName) then
      if TcxGridDBColumn(cxGrid1DBTableView1.Columns[i]).Visible then
      begin
        result := cxGrid1DBTableView1.Columns[i].Index;
        exit;
      end;
  end;
  result := -1;
end;

procedure TfmInvoiceEntryGrid.tlbtnDeleteInvClick(Sender: TObject);
begin
  if OSFMessageDlg(GetTextLang(508), mtConfirmation, [mbYes, mbNo], 0)
    = mryes then
  begin
    tblBatch.DisableControls;
    try
      tblBatch.first;
      While (not tblBatch.Eof) And (tblBatch.RecordCount > 0) do
        DeleteDocLine;
    finally
      tblBatch.EnableControls;
    end;
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
  end;
end;

procedure TfmInvoiceEntryGrid.tlbtnDiscClick(Sender: TObject);
begin
  cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
  edtDiscount.Text := FloatToStrF(GlobalDiscount, ffFixed, 18, 2);
  pnlDiscount.BringToFront;
  pnlDiscount.Visible := true;
  edtDiscount.SetFocus;
end;

procedure TfmInvoiceEntryGrid.edtDiscountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and (Sender = pnlDiscount) then
  begin
    cxGrid1.SetFocus;
    pnlDiscount.Visible := false;
    Key := #0;
  end;
  if (Key = '.') then
    Key := DecimalSeparator;
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if LastDocPosted then
  begin
    Key := 0;
    exit;
  end;
  FormKeyDown(Sender, Key, Shift);
  if (Key = 27) and (Sender <> EdComment) then
  begin
    if BtnClose.CanFocus then
    begin
      BtnClose.SetFocus;
      InGrid := false;
      BtnCloseClick(self);
      Key := 0;
    end;
  end;
  if (Key = 13) and (tblBatchBRECONCILED.Value = 1) then
  begin
    if (cxGrid1DBTableView1.Controller.FocusedColumnindex <
      cxGrid1DBTableView1.VisibleItemCount - 1) then
    begin
      AllOk := false;
      cxGrid1DBTableView1.Controller.FocusedColumnindex :=
        cxGrid1DBTableView1.VisibleItemCount - 1;
      AllOk := true;
      Key := 0;
      exit;
    end;
  end;
  { if key = VK_DOWN then
    if LastBatchLineId = tblBatchWLINEID.AsInteger then
    if (tblBatch.RecNo = tblBatch.RecordCount)  then
    begin
    tblBatch.Append ;
    SelectStockItem ;
    end; }

  // if cxGrid1DBTableView1.Controller.FocusedColumnindex = 0 then
  { if not(Key in [0, 16, 17, 18, 9, 37, 39, 27, 122, 121, 120, 119, 118, 115,
    4, 14, 38, 40]) then
    begin
    if Key = 13 then
    begin
    cxGrid1DBTableView1.Controller.FocusedColumnindex := cxGrid1DBTableView1.Controller.FocusedColumnindex + 1;
    end ;

    end;
  }
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceRowChanged(Sender: TObject);
begin
  if LastDocPosted or IsComment then
  begin
    exit;
  end;

  If not AllOk then
    exit;

  // Comment Button
  If tblBatchBRECONCILED.Value = 1 then
  begin
    // Lets do this on double click.
  end
  else
  begin
    tlbtnComment.Down := false;
    PnlComment.Visible := false;
  end;
  UpDateLabels;
  // Excl/Incl Button
  if tblBatch.State = DsInsert then
  begin
    If ExclMode then
      tblBatchBEXCLUSIVE.Value := 1
    else
      tblBatchBEXCLUSIVE.Value := 0;
    tblBatch.post;
    UpDateLabels;
    tblBatch.Edit;
    if (cxGrid1DBTableView1.Controller.FocusedColumn.Index <>
      FindIndexOfName(tblBatchFCREDIT.FieldName)) then
    begin
      if GoToStockQty then
        cxGrid1DBTableView1.Controller.FocusedColumnindex :=
          cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex
      else
        cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
    end;
  end;

  if (cxGrid1DBTableView1.Controller.FocusedColumnindex > 2) AND FieldChgd then
    UpdateTotalsLbls;
  FieldChgd := false;

end;

procedure TfmInvoiceEntryGrid.tlbtnCommentClick(Sender: TObject);
begin
  if not tblBatch.Active then
    exit;
  IsComment := true;
  try
    EdComment.clear;
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;

    tblBatch.next;
    LoadingGridData := true;
    try
      If tblBatch.Eof then
        tblBatch.Append
      else
        tblBatch.Insert;
    finally
      LoadingGridData := false;
    end;

    tblBatchSREFERENCE.AsString := '';
    tblBatchSACCOUNT.AsString := '';
    tblBatchWACCOUNTID.clear;
    tblBatchSTAX.ReadOnly := false;
    tblBatchSTAX.AsString := '';
    tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
    tblBatchFDEBIT.AsString := '';
    tblBatchFCREDIT.AsString := '';
    tblBatchDALLOCATEDDATE.AsString := '';
    tblBatchSCONTRAACCOUNT.Value := '';
    tblBatchFTAXAMOUNT.AsString := '';
    tblBatchBRECONCILED.Value := 1;
    // Tblbatch.Post;

    // cxGrid1DBTableView1.Controller.FocusedColumn.index := 2 ;
    PnlComment.Visible := true;
    PnlComment.BringToFront;
    tlbtnComment.Down := true;

    PnlComment.SetBounds(0, 80, BtnOkPrint.Width + BtnOkPrint.Left,
      pnlDocLines.Height - 80);
    PnlComment.SetFocus;

  finally
    IsComment := false;
  end;
end;

procedure TfmInvoiceEntryGrid.BtnOkClick(Sender: TObject);
begin

  if not LastDocPosted then
  begin

    if (tblBatchWACCOUNTID.Value <> 0) and
      (_ReadDescription(tblBatchWACCOUNTID.Value) <> '') then
    begin
      UpdateMessage(tblBatchWACCOUNTID.Value, EdComment.Text);
      tblBatch.Edit;
      tblBatchSDESCRIPTION.Value := EdComment.Text;
      tblBatch.post;
    end
    else
    begin
      tblBatch.Edit;
      tblBatchWACCOUNTID.Value := AddMessage(EdComment.Text, true);
      tblBatchSDESCRIPTION.Value := EdComment.Text;
      tblBatch.post;
    end;

  end;
  EdComment.Text := '';
  PnlComment.Visible := false;
  IsComment := true;
  try
    If cxGrid1.CanFocus then
      cxGrid1.SetFocus;
  finally
    IsComment := false;
  end;
end;

procedure TfmInvoiceEntryGrid.BtnCancelClick(Sender: TObject);
begin
  AllOk := false;
  if tblBatch.State = DsInsert then
    tblBatch.Cancel;

  BtnCancel.SetFocus;
  PnlComment.Visible := false;
  EdComment.Text := '';
  IsComment := true;
  try
    If cxGrid1.CanFocus then
      cxGrid1.SetFocus;
  finally
    IsComment := false;
  end;
end;

procedure TfmInvoiceEntryGrid.PnlCommentEnter(Sender: TObject);
begin
  // lets handel on the post.
  EdComment.Text := _ReadDescription(tblBatchWACCOUNTID.Value);
  if EdComment.Text = '' then
  begin
    EdComment.Text := tblBatchSDESCRIPTION.Value;
  end;
  if EdComment.CanFocus then
    EdComment.SetFocus;
end;

procedure TfmInvoiceEntryGrid.EdCommentKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    BtnCancelClick(Sender);
    Key := #0
  end;
end;

procedure TfmInvoiceEntryGrid.PnlDtEnter(Sender: TObject);
begin
  if EdComment.CanFocus then
    EdComment.SetFocus;
end;

procedure TfmInvoiceEntryGrid.PnlGEnter(Sender: TObject);
begin
  if PnlComment.Visible then
    BtnOk.SetFocus;
end;

procedure TfmInvoiceEntryGrid.tlbtnExclInclClick(Sender: TObject);
Var
  SavePlace: TBookmark;
  Rate: Extended;
  UseTaxid: Integer;
  aStock: TStockRecPointer;
begin

  PriceList.Visible := false;
  ExclMode := Not ExclMode;

  if (aShipcostunittype <> 0) and (cbShipments.ItemIndex > 0) then
    if StrToFloatDef(Eshipment.Text, 0) <> 0 then
    begin
      if DefaultTaxId <> 0 then
        UseTaxid := DefaultTaxId
      else
        UseTaxid := TDataBaseStockRoutines.GetOuputTaxId
          (Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]));
      if UseTaxid <> 0 then
        if ExclMode then

          Eshipment.Text := FloatToStr(StrToFloatDef(Eshipment.Text, 0) /
            TDataBaseRoutines.gettaxrateonId(UseTaxid))
        else
          Eshipment.Text := FloatToStr(StrToFloatDef(Eshipment.Text, 0) *
            TDataBaseRoutines.gettaxrateonId(UseTaxid));
    end;

  if tblBatch.State <> dsedit then
    tblBatch.Edit;
  SavePlace := tblBatch.GetBookmark;
  try
    // UpDate All Bacth
    tblBatch.first;
    tblBatch.DisableControls;
    try
      While not tblBatch.Eof do
      begin

        DMTCCoreLink.stockObject.getStock(aStock, tblBatchSREFERENCE.AsString);
        if (aStock^.WStockID = 0) or (aStock^.WStockTypeId = 10) then
        begin
          if aStock^.WStockTypeId = 10 then
          begin
            fmStockLinkDetail.InitFromStockDocLine(aStock^.WStockID,
              tblBatchWLINEID.AsInteger);
            tblBatch.Edit;
            tblBatchBEXCLUSIVE.Value := ord(ExclMode);
            if ExclMode then
            begin
              tblBatchFDEBIT.Value := fmStockLinkDetail.TotExcl /
                fmStockLinkDetail.GetLastTotalQty;
              tblBatchFCREDIT.Value := FixAmount(fmStockLinkDetail.TotExcl,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
            end
            else
            begin
              tblBatchFDEBIT.Value := fmStockLinkDetail.TotInc /
                fmStockLinkDetail.GetLastTotalQty;
              tblBatchFCREDIT.Value := FixAmount(fmStockLinkDetail.TotInc,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
            end;
            tblBatch.post;
          end;
          tblBatch.next;
          Continue;
        end;
        Rate := GetTaxrate(tblBatchSTAX.AsString, true);
        tblBatch.Edit;
        tblBatchBEXCLUSIVE.Value := ord(ExclMode);
        If not ExclMode then
        begin
          if Rate <> 2 then
          begin
            tblBatchFDEBIT.Value := tblBatchFDEBIT.Value * Rate;
            tblBatchFCREDIT.Value := FixAmount(tblBatchFCREDIT.Value * Rate,
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
          end;
        end
        else
        begin
          if Rate <> 2 then
          begin
            tblBatchFDEBIT.Value := tblBatchFDEBIT.Value / Rate;
            tblBatchFCREDIT.Value := FixAmount(tblBatchFCREDIT.Value / Rate,
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
          end;
        end;
        tblBatch.post;
        tblBatch.next;
      end;
    finally
      tblBatch.EnableControls;
    end;

    if tblBatch.BookmarkValid(SavePlace) then
      tblBatch.GotoBookmark(SavePlace);
  finally
    tblBatch.freebookmark(SavePlace);
  end;

  UpdateTotalsLbls;

end;

procedure TfmInvoiceEntryGrid.TlbtnCopyClick(Sender: TObject);
begin
  PnlCopy.SetBounds(0, 0, pnlDocLines.Width, pnlDocLines.Height);
  PnlCopy.BringToFront;
  PnlCopy.Visible := true;
  PnlCopy.SetFocus;
  grdCopyDBTableView1.DataController.DataSource := dmDatabase.DSDocHead;
  OpenCopySql;
  grdCopyDBTableView1.Columns[3].Visible := false;
  grdCopyDBTableView1.Columns[0].caption := GetTextLang(1120); // invoice nr
  grdCopyDBTableView1.Columns[1].caption := GetTextLang(238); // date
  grdCopyDBTableView1.Columns[2].caption := GetTextLang(1876); // debtor

  grdCopyDBTableView1.Columns[3].caption := GetTextLang(3430); // docid
  grdCopyDBTableView1.Columns[4].caption := GetTextLang(1974); // reference
  BtnCopyCancel.caption := GetTextLang(168); // debtor
  BtnCopyOk.caption := GetTextLang(167); // debtor
end;

procedure TfmInvoiceEntryGrid.BtnCopyCancelClick(Sender: TObject);
begin
  PnlCopy.Visible := false;
end;

procedure TfmInvoiceEntryGrid.BtnCopyOkClick(Sender: TObject);
Var
  ASaveList: TSaveClientDatasetCallList;
  MyStock: TStockRec;
begin
  LoadingGridData := true;
  ASaveList := TSaveClientDatasetCallList.Create;
  try
    ASaveList.AddclientObject(tblBatch, true);
    begin

      dmDatabase.tblDocLine.SQL.Text := 'select * from docline where WDocID=' +

        QDocHeadWDOCID.AsString;
      dmDatabase.tblDocLine.Open;

      while not dmDatabase.tblDocLine.Eof do
      begin
        tblBatch.Append;

        If (dmDatabase.tblDocLineWLineTypeID.Value <> 91) then
        begin
          tblBatchSDESCRIPTION.Value :=
            _ReadDescription(dmDatabase.tblDocLineWDescriptionID.Value);
          MyStock.WStockID := dmDatabase.tblDocLineWStockID.Value;
          LocateStockItem(MyStock);
          tblBatchSREFERENCE.Value := MyStock.SSTOCKCODE;
          tblBatchSACCOUNT.Value :=
            FloatToStrF(dmDatabase.tblDocLineFQtyOrdered.Value, ffFixed, 18,
            dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);
          tblBatchSCONTRAACCOUNT.Value :=
            FloatToStrF(dmDatabase.tblDocLineFQtyShipped.Value, ffFixed, 18,
            dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);
          tblBatchSTAX.ReadOnly := false;
          tblBatchSTAX.Value :=
            TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
            (dmDatabase.tblDocLineWTaxID.AsInteger);
          tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
          tblBatchWTAXID.AsInteger := dmDatabase.tblDocLineWTaxID.AsInteger;
          tblBatchFDEBIT.Value := dmDatabase.tblDocLineFSellingPrice.Value;
          tblBatchFTAXAMOUNT.Value :=
            FixAmount(dmDatabase.tblDocLineFItemDiscount.Value);
          tblBatchBRECONCILED.Value := 0;

          if (dmDatabase.tblDocLineWLineTypeID.Value = 94) then
          begin
            tblBatchFCREDIT.Value :=
              FixAmount(dmDatabase.tblDocLineFInclusiveAmt.Value,
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
            tblBatchBEXCLUSIVE.Value := 0;
          end
          else
          begin
            tblBatchBEXCLUSIVE.Value := 1;
            tblBatchFCREDIT.Value :=
              FixAmount(dmDatabase.tblDocLineFExclusiveAmt.Value,
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
          end;
        end
        else
        begin
          tblBatchBRECONCILED.Value := 1;
          tblBatchWACCOUNTID.AsInteger :=
            AddMessage
            (_ReadDescription(dmDatabase.tblDocLineWDescriptionID.Value), true);
          tblBatchSDESCRIPTION.Value :=
            _ReadDescription(tblBatchWACCOUNTID.AsInteger);
        end;
        tblBatch.post;
        dmDatabase.tblDocLine.next;

      end;
    end;
  finally
    LoadingGridData := false;
    ASaveList.free;
    PnlCopy.Visible := false;
    UpdateTotalsLbls;
  end;
end;

procedure TfmInvoiceEntryGrid.PnlCopyExit(Sender: TObject);
begin
  PnlCopy.Visible := false;
  dmDatabase.qryDocHead.close;
end;

procedure TfmInvoiceEntryGrid.grdCopyDblClick(Sender: TObject);
begin
  BtnCopyOkClick(Sender);
end;

procedure TfmInvoiceEntryGrid.PriceListxClick(Sender: TObject);
begin
  PriceList.Visible := false;
  cxGrid1.SetFocus;
end;

Procedure TfmInvoiceEntryGrid.ShowPriceList(aRect: TRect);
Var
  i: Integer;

begin
  Application.ProcessMessages;
  if (LastStock.WStockTypeId in [6, 7, 8]) then
    exit;
  if (IntSellingPrice <> 0) then
  begin
    if cxGrid1.Height < aRect.Bottom + PriceList.Height then
      PriceList.Top := aRect.Top - PriceList.Height
    else
      PriceList.Top := aRect.Bottom + 4;
    PriceList.Left := aRect.Left + 2;
    PriceList.Visible := true;
    updatepricelist;
    PriceList.SetFocus;

    if tblBatchFDEBIT.AsFloat <> 0 then
    begin
      for i := 0 to 2 do
        if PriceList.Strings.Values[PriceList.Strings.Names[i]] = formatfloat
          (',0.00', FixAmount(tblBatchFDEBIT.AsFloat)) then
          PriceList.Row := i + 1;
    end; // else
    // PriceList.Row :=IntSellingPrice;
  end;
end;

procedure TfmInvoiceEntryGrid.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
  begin
    if AFormPluginRecordArray[i].AForm <> nil then
    begin
      AFormPluginRecordArray[i].aUnLoadFormPlugin
        (AFormPluginRecordArray[i].AForm);
      AFormPluginRecordArray[i].AForm := nil;

    end;
  end;
  LinkToList.free;
  fmDocLinks.free;
  if Assigned(fmStockLinkDetail) then
    FreeAndNil(fmStockLinkDetail);
  if Assigned(MyLocBatSerInput) then
    FreeAndNil(MyLocBatSerInput);

  FreeAndNil(aDMCoreDocData);
  PaymentDetails.free;

  DocSelectOptions.free;
  if AExternalForm <> nil then
  begin
    AExternalEditAddItemToDocPlugin.aUnLoadFormPlugin(AExternalForm);
    AExternalForm := nil;
  end;

  aLedgerPeriodeCollection.free;
  WinFormID := '';
  FmLookup.IsShowForm := false;
  // done : Pieter set back taxammount format
  ASaveList.free;
  dmDatabase.tblStock.close;
  APluginsFormsList.free;
  ATempStockList.free;
  aAccountRecList.free;
end;

procedure TfmInvoiceEntryGrid.btnSwapClick(Sender: TObject);
begin
  // do this after opening the Dataset so lables get displayd
  // DoclineTranslate ;
  if isbtnSwap then
    exit;
  isbtnSwap := true;
  if IsHeaderScr then
    JumpCtrlEnter(Sender)
  else
  begin
    pnlDocLines.Visible := false;
  end;
  { Save Header }
  isbtnSwap := false;
end;

Function TfmInvoiceEntryGrid.IsHeaderScr: Boolean;
begin
  result := Not pnlDocLines.Visible;
end;

procedure TfmInvoiceEntryGrid.Panel4Enter(Sender: TObject);
begin
  if (cxGrid1DBTableView1.Focused and
    (tblBatch.RecNo <> tblBatch.RecordCount)) then
    exit;

  SetHideDetails;
end;

Procedure TfmInvoiceEntryGrid.ShowDocForm;
begin
  BitBtn1.Visible := false;
  BitBtnCancel.Visible := false;
  ShowModal;
end;

procedure TfmInvoiceEntryGrid.JumpCtrlEnter(Sender: TObject);
begin
  BringToFrontDocLines;
end;

procedure TfmInvoiceEntryGrid.RefreshAccountType;
begin
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  if idDocType < 10 then
    idDocType := 10;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if BtnClose.Focused then
    exit;
  BProcess.Enabled := true;
  cbSalesman.Enabled := true;

  Case idDocType of
    11, 16:
      begin
        // Title
        self.caption := GetTextLang(38);
        StatusBar.Panels[1].Text := GetTextLang(38);
        // Credit notes Number  758
        Label2i.caption := GetTextLang(758);
        LookAccType := 1;

        if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger
          <> 0 then
        begin
          cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
            (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser)
            .AsInteger));
          cbSalesman.Enabled := false;
        end;
        Label3i.Enabled := true;
      end;
    12, 17:
      begin
        // Title
        self.caption := GetTextLang(929); // 'Purchases';
        StatusBar.Panels[1].Text := GetTextLang(929); // 'Purchases';
        // Purchases Number  759
        Label2i.caption := GetTextLang(759);
        LookAccType := 2;

      end;
    13:
      begin
        // Title
        self.caption := GetTextLang(419); // 'Goods Returned';
        StatusBar.Panels[1].Text := GetTextLang(419); // 'Goods Returned';
        // Goods Returned Number  752
        Label2i.caption := GetTextLang(752);
        LookAccType := 2;

      end;
    14:
      begin
        // Title
        self.caption := GetTextLang(418); // 'Quote';
        StatusBar.Panels[1].Text := GetTextLang(418); // 'Quote';
        // Quote Number  751
        Label2i.caption := GetTextLang(751);
        LookAccType := 1;

        if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger
          <> 0 then
        begin
          cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
            (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser)
            .AsInteger));
          cbSalesman.Enabled := false;
        end;
        // BProcess.Enabled := false ;
      end;
    15:
      begin
        // Title
        self.caption := GetTextLang(798); // 'Order';
        StatusBar.Panels[1].Text := GetTextLang(798); // 'Order';
        // Order Number  762
        Label2i.caption := GetTextLang(762);
        LookAccType := 2;
        // BProcess.Enabled := false ;
      end;
  else
    begin
      // Title
      self.caption := GetTextLang(260);
      StatusBar.Panels[1].Text := GetTextLang(260);
      // Invoice Number 234
      Label2i.caption := GetTextLang(234);
      LookAccType := 1;

      if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger <> 0 then
      begin
        cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
          (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser)
          .AsInteger));
        cbSalesman.Enabled := false;
      end;

    end;
  end;
  if LookAccType = 2 then
    Label1i.caption := GetTextLang(30)
  else
    Label1i.caption := GetTextLang(31);
end;

procedure TfmInvoiceEntryGrid.UpdateAccountInfo;
var
  MySaveList: TSaveClientDatasetCallList;
begin
  TotalLimit := 0;
  TotalAcc := 0;
  DefaultTaxId := 0;
  MySaveList := TSaveClientDatasetCallList.Create;
  try
    aDMCoreDocData.ZQAccount.SQL.Text :=
      'Select * from account where WAccountid = ' + IntToStr(edtWAccountID);
    aDMCoreDocData.ZQAccount.Open;

    TmpCaption := edtAccountNumber.Text;
    if POS('-', edtAccountNumber.Text) > 0 then
      Delete(TmpCaption, POS('-', edtAccountNumber.Text), 1);
    TmpCaption := TmpCaption + '   ';
    if LastDocHeaderId <> -1 then
    begin
      TmpCaption := TmpCaption + cbDocTypenew.Text + ' ' +
        QDocHeadSDOCNO.AsString; //

    end
    else
    begin
      // This is caculated and not definitive if someone post his data first you will not have this number
      TmpCaption := TmpCaption + TDataBaseDocumentRoutines.GetDocNextNum
        (idDocType, true);
    end;

    TmpCaption := TmpCaption + '     ' +
      aDMCoreDocData.ZQAccountSDescription.Value;
    if LookAccType = 2 then
    begin
      aDMCoreDocData.ZQCreditor.SQL.Text :=
        'Select * from creditor where WAccountid = ' + IntToStr(edtWAccountID);
      aDMCoreDocData.ZQCreditor.Open;
      DefaultTaxId := aDMCoreDocData.ZQCreditorWDEFAULTTAX.AsInteger;
    end
    else
    begin
      aDMCoreDocData.ZQDebtor.SQL.Text :=
        'Select * from debtor where WAccountid = ' + IntToStr(edtWAccountID);
      aDMCoreDocData.ZQDebtor.Open;
      DefaultTaxId := aDMCoreDocData.ZQDebtorWDEFAULTTAX.AsInteger;
    end;
    TotalAcc := GetAccountTotal(aDMCoreDocData.ZQAccountWAccountID.Value,
      26 + 1, 3);
    if LookAccType = 2 then
      TotalAcc := -TotalAcc;
    // add unposted docs
    TotalAcc := TotalAcc + TDataBaseDocumentRoutines.GetTotalUnpostedDoc
      (aDMCoreDocData.ZQAccountWAccountID.AsInteger, LastDocHeaderId);
    // done : Pieter Lets show abs so when its creditor the ammount wont be -
    // Sylvain: if Credirnote posted before invoices, figures are confusing if the negative
    lblPostBal.caption := FloatToStrF(TotalAcc, ffFixed, 18, 2) + ' ';

    // done : Pieter Show credit limit for creditor
    if LookAccType = 2 then
    begin
      // bookings are negetive. the - wil make it positive
      lblCredLimit.caption :=
        FloatToStrF(aDMCoreDocData.ZQCreditorFCREDITLimit.Value, ffFixed,
        18, 2) + ' ';
      TotalLimit := aDMCoreDocData.ZQCreditorFCREDITLimit.Value;
      lbDiscountperc.caption :=
        FloatToStrF(aDMCoreDocData.ZQCreditorFDISCOUNT.Value, ffFixed,
        18, 2) + ' ';
      // bookings are negetive. so adding it wil substract
      Diff := aDMCoreDocData.ZQCreditorFCREDITLimit.Value + TotalAcc;
      // Sylvain:
      lblAvailable.caption := FloatToStrF(Diff, ffFixed, 18, 2) + ' ';
      // todo : We need a new message ?
      if (Diff < 0) AND (aDMCoreDocData.ZQCreditorFCREDITLimit.Value <> 0) then
        OSFMessageDlg(GetTextLang(765)
          { 'Debtor's Balance is over credit limit with } + #13#10 +
          FloatToStr(Abs(Diff)), mtinformation, [mbok], 0)
      else
        lblAvailable.caption := FloatToStrF(Diff, ffFixed, 18, 2) + ' ';
      Diff := aDMCoreDocData.ZQCreditorFCREDITLimit.Value; // Just to Store it
    end
    else
    begin
      lblCredLimit.caption :=
        FloatToStrF(aDMCoreDocData.ZQDebtorFCREDITLimit.Value, ffFixed,
        18, 2) + ' ';
      TotalLimit := aDMCoreDocData.ZQDebtorFCREDITLimit.Value;
      lbDiscountperc.caption :=
        FloatToStrF(aDMCoreDocData.ZQDebtorFDISCOUNT.Value, ffFixed,
        18, 2) + ' ';
      Diff := aDMCoreDocData.ZQDebtorFCREDITLimit.Value - TotalAcc;
      lblAvailable.caption := FloatToStrF(Diff, ffFixed, 18, 2) + ' ';
      Diff := aDMCoreDocData.ZQDebtorFCREDITLimit.Value; // Just to Store it
    end;
  finally
    MySaveList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.cbInvoiceNumberExit(Sender: TObject);
begin
  EDelAdr1.MaxLength := DMTCCoreLink.MessageLength;
  EDelAdr2.MaxLength := DMTCCoreLink.MessageLength;
  EDelAdr3.MaxLength := DMTCCoreLink.MessageLength;
  EDelPostal.MaxLength := DMTCCoreLink.MessageLength;
  EMessage1.MaxLength := DMTCCoreLink.MessageLength;
  EMessage2.MaxLength := DMTCCoreLink.MessageLength;
  EMessage3.MaxLength := DMTCCoreLink.MessageLength;
  EPostal1.MaxLength := DMTCCoreLink.MessageLength;
  EPostal2.MaxLength := DMTCCoreLink.MessageLength;
  EPostal3.MaxLength := DMTCCoreLink.MessageLength;
  EPostalCode.MaxLength := DMTCCoreLink.MessageLength;
  ECompany.MaxLength := DMTCCoreLink.MessageLength;
  EDelCompany.MaxLength := DMTCCoreLink.MessageLength;
  EContact.MaxLength := DMTCCoreLink.MessageLength;
  EDelContact.MaxLength := DMTCCoreLink.MessageLength;
  ETaxCode.MaxLength := DMTCCoreLink.MessageLength;

  EContact.Tag := 0;
  EDelContact.Tag := 0;

  LastDocPosted := false;
  PMAinData.Enabled := true;
  cxGrid1DBTableView1.OptionsData.Editing := true;
  SetToolBarVisible(true);
  BtnOkPrint.Visible := true;
  if dmDatabase.tblDocHeader.Tag = 0 then
  begin
    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where WDocID=0';
    dmDatabase.tblDocHeader.Open;
  end;
  dmDatabase.tblDocHeader.close;
  dmDatabase.tblDocHeaderSREFERENCE.Size := DocReferenceLength;
  EDocEmailAddress.Visible := dmDatabase.tblDocHeader.FindField
    ('X_CUSTOMERS_EMAIL_ADDRESS') <> nil;

  if LastDocHeaderId = -1 then
  begin
    try
      dtpDate.Date := Date;
      dtpDuedate.Date := dtpDate.Date + dtpDuedate.Tag;
    except
    end;
    cbInvoiceNumber.Text := TDataBaseDocumentRoutines.GetDocNextNum
      (idDocType, true);
    EDelContact.Text := '';
    EDelCompany.Text := '';
    ETaxCode.Text := '';
    EDelAdr1.Text := '';
    EDelAdr2.Text := '';
    EDelAdr3.Text := '';
    EDelPostal.Text := '';
    EContact.Text := '';
    EContact.Tag := 0;
    EDocEmailAddress.Text := '';
    ECompany.Text := '';
    EMessage1.Text := '';
    EMessage2.Text := '';
    EMessage3.Text := '';
    EPostal1.Text := '';
    EPostal2.Text := '';
    EPostal3.Text := '';
    EPostalCode.Text := '';
    cbPosted.Enabled := (LocalDocType in [14, 15]);
    cbPosted.ItemIndex := 0;
    // cbPosted.Checked := false ;

    if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger <> 0 then
    begin
      cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
        (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger));
    end;

    { Check If New Number Is Correct }
    if Trim(cbInvoiceNumber.Text) = '' then
    begin
      OSFMessageDlg(GetTextLang(696)
        { 'Invalid Next Number,Change it in Document Setup' } , mtError,
        [mbok], 0);
      close;
      exit;
    end;
    aDMCoreDocData.ZQAccount.SQL.Text :=
      'Select * from account where WAccountid =' + IntToStr(edtWAccountID);
    aDMCoreDocData.ZQAccount.Open;
    if aDMCoreDocData.ZQAccountWACCOUNTTYPEID.AsInteger = 1 then
      // pull up the defaults for the debtor
      LoadDebtors
    else
      // pull up the defaults for the Creditor
      LoadCreditors;

    dmDatabase.tblSysVars.Open;
    if LocalDocType < 16 then
    begin
      EMessage1.Text := dmDatabase.tblSysVars.FieldByName
        (DocFields[LocalDocType] + '1').AsString;
      EMessage2.Text := dmDatabase.tblSysVars.FieldByName
        (DocFields[LocalDocType] + '2').AsString;
      EMessage3.Text := dmDatabase.tblSysVars.FieldByName
        (DocFields[LocalDocType] + '3').AsString;
    end
    else
    begin
      EMessage1.Text := '';
      EMessage2.Text := '';
      EMessage3.Text := '';
    end;

    dmDatabase.tblSysVars.close;
    aDMCoreDocData.ZQAccount.close;

  end
  else
  // old record
  begin
    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where WDocID=' +
      IntToStr(LastDocHeaderId);
    dmDatabase.tblDocHeader.Open;
    if dmDatabase.tblDocHeader.IsEmpty then
    begin
      // todo : DO a message ? It should never happen.
      exit;
    end;

    CBCountry.ItemIndex := GetItemIndexFromId(CBCountry.Items,
      dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger);
    if FProjectId = 0 then
      cbProject.ItemIndex := GetItemIndexFromId(cbProject.Items,
        dmDatabase.tblDocHeaderWJOBCODEID.AsInteger);
    CBDelCountry.ItemIndex := GetItemIndexFromId(CBDelCountry.Items,
      dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger);

    cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
      (TObject(dmDatabase.tblDocHeaderWSalesmanID.AsInteger));
    edtOrderNumber.Text := dmDatabase.tblDocHeaderSREFERENCE.Value;
    edtOrderNumber.MaxLength := dmDatabase.tblDocHeaderSREFERENCE.Size;
    try
      dtpDate.Date := dmDatabase.tblDocHeaderDDate.Value;
      dtpDuedate.Date := dmDatabase.tblDocHeaderDDueDate.Value;
    except
    end;
    // TODO : SQL OPTIMIZE
    // Todo : Creditor ?
    aDMCoreDocData.ZQDebtor.SQL.Text :=
      'Select * from debtor where WAccountid = ' +
      IntToStr(dmDatabase.tblDocHeaderWAccountID.AsInteger);
    aDMCoreDocData.ZQDebtor.Open;
    ShowDebtorSetings;
    aDMCoreDocData.ZQDebtor.close;

    dmDatabase.ZQMessage.SQL.Text :=
      format(dmDatabase.SQLList.GetFormatedSQLByName
      ('database_selectmessagein'),
      [IntToStr(dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWDelCodeID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWMessage1ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWMessage2ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWMessage3ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPostal1ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPostal2ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPostal3ID.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWDELCONTACT.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWDELNAME.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWTAXNUMBER.AsInteger) + ',' +
      IntToStr(dmDatabase.tblDocHeaderWPostalCodeID.AsInteger)]);

    { ECompany.MaxLength := DMTCCoreLink.MessageLength ;
      EDelCompany.MaxLength := DMTCCoreLink.MessageLength ;

      EContact.MaxLength := DMTCCoreLink.MessageLength ;
      EDelContact.MaxLength := DMTCCoreLink.MessageLength ; }

    EDelContact.Text := '';
    EDelCompany.Text := '';
    ETaxCode.Text := '';
    EDelAdr1.Text := '';
    EDelAdr2.Text := '';
    EDelAdr3.Text := '';
    EDelPostal.Text := '';
    EContact.Text := '';
    EDocEmailAddress.Text := '';
    ECompany.Text := '';
    EMessage1.Text := '';
    EMessage2.Text := '';
    EMessage3.Text := '';
    EPostal1.Text := '';
    EPostal2.Text := '';
    EPostal3.Text := '';
    EPostalCode.Text := '';

    dmDatabase.ZQMessage.Open;

    { Delivery Adrr }
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDELCONTACT.Value, []) then
      EDelContact.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;

    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDELNAME.Value, []) then
      EDelCompany.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;

    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWTAXNUMBER.Value, []) then
      ETaxCode.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;

    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDelAddress1ID.Value, []) then
      EDelAdr1.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDelAddress2ID.Value, []) then
      EDelAdr2.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDelAddress3ID.Value, []) then
      EDelAdr3.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWDelCodeID.Value, []) then
      EDelPostal.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;

    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPOSTALCONTACT.Value, []) then
      EContact.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;

    if dmDatabase.tblDocHeader.FindField('X_CONTACTID') <> nil then
      EContact.Tag := dmDatabase.tblDocHeader.FindField('X_CONTACTID')
        .AsInteger;
    if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS')
      <> nil then
      EDocEmailAddress.Text := dmDatabase.tblDocHeader.FindField
        ('X_CUSTOMERS_EMAIL_ADDRESS').AsString;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPOSTALNAME.Value, []) then
      ECompany.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWMessage1ID.Value, []) then
      EMessage1.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWMessage2ID.Value, []) then
      EMessage2.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWMessage3ID.Value, []) then
      EMessage3.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    { Postal Adrr }
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPostal1ID.Value, []) then
      EPostal1.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPostal2ID.Value, []) then
      EPostal2.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPostal3ID.Value, []) then
      EPostal3.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    if dmDatabase.ZQMessage.Locate('WMessageID',
      dmDatabase.tblDocHeaderWPostalCodeID.Value, []) then
      EPostalCode.Text := dmDatabase.ZQMessageSDESCRIPTION.Value;
    dmDatabase.ZQMessage.close;
    LastDocPosted := (dmDatabase.tblDocHeaderBPosted.AsInteger = 1) and
      not(dmDatabase.tblDocHeaderWTYPEID.AsInteger in [14, 15]);
    EFastbarcodelookup.Enabled := not LastDocPosted;
    PMAinData.Enabled := not LastDocPosted;
    cxGrid1DBTableView1.OptionsData.Editing := not LastDocPosted;
    SetToolBarVisible(not LastDocPosted);
    BtnOkPrint.Visible := not LastDocPosted;
    if dmDatabase.tblDocHeaderBPosted.AsInteger = 1 then
      cbPosted.ItemIndex := 2
    else if dmDatabase.tblDocHeaderBPosted.AsInteger = 0 then
      cbPosted.ItemIndex := 0
    else
      cbPosted.ItemIndex := 1;

    // cbPosted.Checked := dmDatabase.tblDocHeaderBPosted.Asinteger = 1 ;
    cbPosted.Enabled := (LocalDocType in [14, 15]);

  end;

  if ((cbSalesman.ItemIndex < 0) Or (cbSalesman.Text = '')) AND
    (cbSalesman.Items.Count > 0) then
  begin
    if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger <> 0 then
    begin
      cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
        (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger));
    end;
  end;

end;

procedure TfmInvoiceEntryGrid.cbProjectDropDown(Sender: TObject);
begin
    FillStringListWithSelect(cbProject.Items,
      'SELECT WJOBPROJECTID, trim(SJOBPROJECTCODE) || '+ QuotedStr(' ') +'||SDESCRIPTION SJOBPROJECTCODE  FROM JOBPROJECT where BENABLED =1');

end;

procedure TfmInvoiceEntryGrid.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if cbDocTypenew.Focused then
    EFilterValue.SetFocus;
  // else
  // if DBGSearch.Focused then  if key = ' ' then BEditClick(self) ;

  if NBDocuments.PageIndex = 0 then
    exit;

  if ((Key = #13) and not(ssShift in LastShift)) then
  begin
    if cxGrid1DBTableView1.Focused then
      exit
    else if Assigned(anewlocallook) and
      ((anewlocallook.cxGrid1DBTableView1.Focused) or
      (anewlocallook.ECode.Focused)) then
      exit
    else if EdComment.Focused then
      exit
    else if (ActiveControl is TDBLookupComboBox) then
      exit
    else

    begin
      if Screen.ActiveControl <> EFastbarcodelookup then
      begin
        SelectNext(Screen.ActiveControl, true, true);
        Key := #0;
      end;
    end;
  end;
end;

Procedure TfmInvoiceEntryGrid.UpDateDocHeader;
begin
  { Postal Messages }

  dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger := BPutOnAccount.Tag;

  dmDatabase.tblDocHeaderWMessage1ID.Value := AddMessage(EMessage1.Text);
  dmDatabase.tblDocHeaderWMessage2ID.Value := AddMessage(EMessage2.Text);
  dmDatabase.tblDocHeaderWMessage3ID.Value := AddMessage(EMessage3.Text);
  { Postal ADdress }
  dmDatabase.tblDocHeaderWPostal1ID.Value := AddMessage(EPostal1.Text);
  dmDatabase.tblDocHeaderWPostal2ID.Value := AddMessage(EPostal2.Text);
  dmDatabase.tblDocHeaderWPostal3ID.Value := AddMessage(EPostal3.Text);
  dmDatabase.tblDocHeaderWPostalCodeID.Value := AddMessage(EPostalCode.Text);

  dmDatabase.tblDocHeaderWPOSTALCONTACT.Value := AddMessage(EContact.Text);

  if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
    dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS').AsString :=
      EDocEmailAddress.Text;

  if dmDatabase.tblDocHeader.FindField('X_CONTACTID') <> nil then
    dmDatabase.tblDocHeader.FindField('X_CONTACTID').AsInteger := EContact.Tag;

  if cbCurrency.ItemIndex > 0 then
  begin
    dmDatabase.tblDocHeaderWCURRENCYID.AsInteger :=
      Integer(cbCurrency.Items.Objects[cbCurrency.ItemIndex]);
    dmDatabase.tblDocHeaderFCURRENCYRATE.AsFloat :=
      StrToFloatDef(cbRate.Text, dmDatabase.tblDocHeaderFCURRENCYRATE.AsFloat);

  end
  else
  begin
    dmDatabase.tblDocHeaderWCURRENCYID.AsInteger := 0;
    dmDatabase.tblDocHeaderFCURRENCYRATE.AsInteger := 1;
  end;

  if dmDatabase.tblDocHeaderWCURRENCYID.AsInteger <> 0 then
  begin
    cbCurrency.ItemIndex := cbCurrency.Items.IndexOfObject
      (TObject(dmDatabase.tblDocHeaderWCURRENCYID.AsInteger));

    cbRate.Text := dmDatabase.tblDocHeaderFCURRENCYRATE.AsString;
  end;

  dmDatabase.tblDocHeaderWPOSTALNAME.Value := AddMessage(ECompany.Text);

  dmDatabase.tblDocHeaderWTAXNUMBER.Value := AddMessage(ETaxCode.Text);

  { Delivery Address }

  dmDatabase.tblDocHeaderWDELCONTACT.Value := AddMessage(EDelContact.Text);
  dmDatabase.tblDocHeaderWDELNAME.Value := AddMessage(EDelCompany.Text);

  dmDatabase.tblDocHeaderWDelAddress1ID.Value := AddMessage(EDelAdr1.Text);
  dmDatabase.tblDocHeaderWDelAddress2ID.Value := AddMessage(EDelAdr2.Text);
  dmDatabase.tblDocHeaderWDelAddress3ID.Value := AddMessage(EDelAdr3.Text);
  dmDatabase.tblDocHeaderWDelCodeID.Value := AddMessage(EDelPostal.Text);

  SetFieldWithIndexValue(dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID,
    CBCountry.Items, CBCountry.ItemIndex);
  if FProjectId = 0 then
    SetFieldWithIndexValue(dmDatabase.tblDocHeaderWJOBCODEID, cbProject.Items,
      cbProject.ItemIndex) else
      dmDatabase.tblDocHeaderWJOBCODEID.AsInteger := FProjectId ;

  SetFieldWithIndexValue(dmDatabase.tblDocHeaderWDELCOUNTRIES_ID,
    CBDelCountry.Items, CBDelCountry.ItemIndex);
  // dmDatabase.tblGroups.Open;
  { Salesman }
  if cbSalesman.ItemIndex <> -1 then
    dmDatabase.tblDocHeaderWSalesmanID.Value :=
      Integer(cbSalesman.Items.Objects[cbSalesman.ItemIndex])
    // := (TObject(dmDatabase.tblDocHeaderWSalesmanID.AsInteger)); dmDatabase.tblGroupsWGroupID.Value;
  else
    dmDatabase.tblDocHeaderWSalesmanID.Value := 0;
  { Reporting groups 1-2 }
  if CbxRepGroup1.ItemIndex <> -1 then
    dmDatabase.tblDocHeaderWReportingGroup1ID.AsInteger :=
      Integer(CbxRepGroup1.Items.Objects[CbxRepGroup1.ItemIndex])
  else
    dmDatabase.tblDocHeaderWReportingGroup1ID.AsInteger := 0;

  if CbxRepGroup2.ItemIndex <> -1 then
    dmDatabase.tblDocHeaderWReportingGroup2ID.AsInteger :=
      Integer(CbxRepGroup2.Items.Objects[CbxRepGroup2.ItemIndex])
  else
    dmDatabase.tblDocHeaderWReportingGroup2ID.AsInteger := 0;

  { ... }
  // dmDatabase.tblGroups.Close;
  dmDatabase.tblDocHeaderDDate.Value := dtpDate.Date;
  dmDatabase.tblDocHeaderDDueDate.Value := dtpDuedate.Date;
  dmDatabase.tblDocHeaderDAllocatedDate.Value := dtpDate.Date;
  dmDatabase.tblDocHeaderSREFERENCE.AsString := edtOrderNumber.Text;
  dmDatabase.tblDocHeaderDSysDate.AsDateTime := Now;
end;

Procedure TfmInvoiceEntryGrid.LoadDebtors;
var
  AFormat: String;
begin
  StatusBar.Panels[0].Text := TDatabaseDebtorCreditorRoutines.GetTelnr
    (edtWAccountID);
  aDMCoreDocData.ZQDebtor.SQL.Text := 'Select * from debtor where WAccountid = '
    + IntToStr(edtWAccountID);
  aDMCoreDocData.ZQDebtor.Open;
  // pull up the defaults for the debtor
  DebtDiscount := aDMCoreDocData.ZQDebtorFDISCOUNT.Value;
  if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger = 0 then
  begin
    cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
      (TObject(aDMCoreDocData.ZQDebtorWSalesmanID.AsInteger));
  end
  else
  begin
    cbSalesman.ItemIndex := cbSalesman.Items.IndexOfObject
      (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger));
    cbSalesman.Enabled := false;
  end;
  if ((cbSalesman.ItemIndex < 0) Or (cbSalesman.Text = '')) AND
    (cbSalesman.Items.Count > 0) then
    cbSalesman.ItemIndex := 0;
  { Postal Address }

  AFormat := DMTCCoreLink.ReadLongSysparam('CONTACTFORMAT', 0);
  if AFormat = '' then
    AFormat := '<@SHORTNAME@>';
  TDataBaseStringRoutines.FillStringListWithFormatSelect(EContact.Items,
    'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') + ')) ||'
    + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') + ')) || ' +
    QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('') +
    '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
    + IntToStr(edtWAccountID) + ')', AFormat, 0);
  EDelContact.Items := EContact.Items;

  ECompany.Text := TDataBaseRoutines.GetAccountDescription(edtWAccountID);
  EContact.Text := TDatabaseDebtorCreditorRoutines.GetContactName
    (edtWAccountID);
  EContact.Tag := aDMCoreDocData.ZQDebtorWCONTACTID.AsInteger;

  EDelContact.Tag := EContact.Tag;
  EDelContact.Text := EContact.Text;

  if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
  begin
    EDocEmailAddress.Text := TDatabaseDebtorCreditorRoutines.GetContactEmail
      (edtWAccountID);

    if EDocEmailAddress.Text = '' then
      EDocEmailAddress.Text := aDMCoreDocData.ZQDebtorSEMAIL.AsString;
  end;

  EDelCompany.Text := ECompany.Text;
  EDelContact.Text := EContact.Text;

  ETaxCode.Text := aDMCoreDocData.ZQDebtorSREFERENCE.AsString;

  EPostal1.Text := aDMCoreDocData.ZQDebtorSPostal1.AsString;
  EPostal2.Text := aDMCoreDocData.ZQDebtorSPostal2.AsString;
  EPostal3.Text := aDMCoreDocData.ZQDebtorSPostal3.AsString;
  EPostalCode.Text := aDMCoreDocData.ZQDebtorSPostalCode.AsString;
  BPutOnAccount.Tag := aDMCoreDocData.ZQDebtorWDEFAULTACCOUNT.AsInteger;
  BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
    DMTCCoreLink.GetTextLang(1990);
  if BPutOnAccount.Tag <> 0 then
    BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
      TDataBaseRoutines.GetAccountCode(BPutOnAccount.Tag);

  { Delivery Addres }
  EDelAdr1.Text := aDMCoreDocData.ZQDebtorSDelivery1.AsString;
  EDelAdr2.Text := aDMCoreDocData.ZQDebtorSDelivery2.AsString;
  EDelAdr3.Text := aDMCoreDocData.ZQDebtorSDelivery3.AsString;
  EDelPostal.Text := aDMCoreDocData.ZQDebtorSDeliveryCode.AsString;
  ESExtraDesc.Text := '';
  CBCountry.ItemIndex := GetItemIndexFromId(CBCountry.Items,
    aDMCoreDocData.ZQDebtorWPOSTCOUNTRIES_ID.AsInteger);
  CBDelCountry.ItemIndex := GetItemIndexFromId(CBDelCountry.Items,
    aDMCoreDocData.ZQDebtorWDELCOUNTRIES_ID.AsInteger);

  dtpDuedate.Tag := aDMCoreDocData.ZQDebtorWDueDays.AsInteger;
  DefaultTaxId := aDMCoreDocData.ZQDebtorWDEFAULTTAX.AsInteger;
  if DefaultTaxId = -1 then
    DefaultTaxId := 0;
  GlobalDiscount := aDMCoreDocData.ZQDebtorFDISCOUNT.AsFloat;
  IntSellingPrice :=
    Str2Int(aDMCoreDocData.ZQDebtorWDefaultPriceTypeID.AsString);
  if IntSellingPrice = 0 then
    IntSellingPrice := 1;
  aDMCoreDocData.ZQDebtor.close;
end;

Procedure TfmInvoiceEntryGrid.LoadCreditors;
VAR
  AFormat: string;
begin
  StatusBar.Panels[0].Text := TDatabaseDebtorCreditorRoutines.GetTelnr
    (edtWAccountID);
  aDMCoreDocData.ZQCreditor.SQL.Text :=
    'Select * from creditor where WAccountid = ' + IntToStr(edtWAccountID);
  aDMCoreDocData.ZQCreditor.Open;
  // pull up the defaults for the Creditor
  cbSalesman.ItemIndex := -1;
  ESExtraDesc.Text := '';
  CBCountry.ItemIndex := GetItemIndexFromId(CBCountry.Items,
    aDMCoreDocData.ZQCreditorWPOSTCOUNTRIES_ID.AsInteger);
  CBDelCountry.ItemIndex := GetItemIndexFromId(CBDelCountry.Items,
    aDMCoreDocData.ZQCreditorWDELCOUNTRIES_ID.AsInteger);
  { Postal Adddress }

  BPutOnAccount.Tag := aDMCoreDocData.ZQCreditorWDEFAULTACCOUNT.AsInteger;
  BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
    DMTCCoreLink.GetTextLang(1990);
  if BPutOnAccount.Tag <> 0 then
    BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
      TDataBaseRoutines.GetAccountCode(BPutOnAccount.Tag);

  AFormat := DMTCCoreLink.ReadLongSysparam('CONTACTFORMAT', 0);
  if AFormat = '' then
    AFormat := '<@SHORTNAME@>';
  TDataBaseStringRoutines.FillStringListWithFormatSelect(EContact.Items,
    'SELECT RECORDID aUID, trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
    ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
    ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('') +
    '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
    + IntToStr(edtWAccountID) + ')', AFormat, 0);
  EDelContact.Items := EContact.Items;

  ECompany.Text := TDataBaseRoutines.GetAccountDescription(edtWAccountID);
  EContact.Text := TDatabaseDebtorCreditorRoutines.GetContactName
    (edtWAccountID);
  EContact.Tag := aDMCoreDocData.ZQCreditorWCONTACTID.AsInteger;
  EDelContact.Tag := EContact.Tag;
  EDelContact.Text := EContact.Text;

  if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
  begin
    EDocEmailAddress.Text := TDatabaseDebtorCreditorRoutines.GetContactEmail
      (edtWAccountID);
    if EDocEmailAddress.Text = '' then
      EDocEmailAddress.Text := aDMCoreDocData.ZQCreditorSEMAIL.AsString;
  end;

  EDelCompany.Text := ECompany.Text;
  EDelContact.Text := EContact.Text;
  ETaxCode.Text := aDMCoreDocData.ZQCreditorSREFERENCE.AsString;

  EPostal1.Text := aDMCoreDocData.ZQCreditorSPostal1.Value;
  EPostal2.Text := aDMCoreDocData.ZQCreditorSPostal2.Value;
  EPostal3.Text := aDMCoreDocData.ZQCreditorSPostal3.Value;
  EPostalCode.Text := aDMCoreDocData.ZQCreditorSPostalCode.Value;
  dtpDuedate.Tag := aDMCoreDocData.ZQCreditorWDueDays.AsInteger;
  { Deliveri Address }
  EDelAdr1.Text := aDMCoreDocData.ZQCreditorSDelivery1.Value;
  EDelAdr2.Text := aDMCoreDocData.ZQCreditorSDelivery2.Value;
  EDelAdr3.Text := aDMCoreDocData.ZQCreditorSDelivery3.Value;
  EDelPostal.Text := aDMCoreDocData.ZQCreditorSDELIVERYCODE.AsString;
  GlobalDiscount := aDMCoreDocData.ZQCreditorFDISCOUNT.AsFloat;
  DefaultTaxId := aDMCoreDocData.ZQCreditorWDEFAULTTAX.AsInteger;
  if DefaultTaxId = -1 then
    DefaultTaxId := 0;
  aDMCoreDocData.ZQCreditor.close;
  IntSellingPrice := 0;
  if ((cbSalesman.ItemIndex < 0) Or (cbSalesman.Text = '')) AND
    (cbSalesman.Items.Count > 0) then
    cbSalesman.ItemIndex := 0;
end;

procedure TfmInvoiceEntryGrid.cbSalesmanEnter(Sender: TObject);
begin
  cbSalesman.DroppedDown := true;
end;

procedure TfmInvoiceEntryGrid.dtpDateExit(Sender: TObject);
begin
  if BtnClose.Focused then
    exit;
  { if  (dtpDate.Date > aLedgerPeriodeCollection.GetHighYear) then
    begin
    OSFMessageDlg(GetTextLang(503)  //'Date of invoice not in current year. It must be between '
    + DateToStr(aLedgerPeriodeCollection.GetLowYear) + ' '+GetTextLang(504) +' ' + DateToStr(aLedgerPeriodeCollection.GetHighYear), mterror, [mbok], 0);
    end
    else }
  if not aLedgerPeriodeCollection.IsValideDate(dtpDate.Date) then
  begin
    OSFMessageDlg(GetTextLang(889), mtError, [mbok], 0);
  end

end;

procedure TfmInvoiceEntryGrid.HandelChangeGroup1Click(Sender: TObject);
var
  i: Integer;
begin
  if QDocHead.IsEmpty then
    exit;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  // if DBGSearch.SelectedRows.Count <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;

      // QDocHead.Bookmark := DBGSearch.SelectedRows.Items[i];
      ExecSql('Update Dochead set WReportingGroup1ID =' +
        IntToStr(TComponent(Sender).Tag) + '  where WDocID=' +
        IntToStr(QDocHeadWDOCID.AsInteger));
    end;
  end
  else
    ExecSql('Update Dochead set WReportingGroup1ID =' +
      IntToStr(TComponent(Sender).Tag) + '  where WDocID=' +
      IntToStr(QDocHeadWDOCID.AsInteger));
  RefreschDocumentList(QDocHeadWDOCID.AsInteger);
end;

procedure TfmInvoiceEntryGrid.HandelChangeGroup2Click(Sender: TObject);
var
  i: Integer;
begin
  if QDocHead.IsEmpty then
    exit;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      ExecSql('Update Dochead set WReportingGroup2ID =' +
        IntToStr(TComponent(Sender).Tag) + '  where WDocID=' +
        IntToStr(QDocHeadWDOCID.AsInteger));
    end;
  end
  else
    ExecSql('Update Dochead set WReportingGroup2ID =' +
      IntToStr(TComponent(Sender).Tag) + '  where WDocID=' +
      IntToStr(QDocHeadWDOCID.AsInteger));
  RefreschDocumentList(QDocHeadWDOCID.AsInteger);
end;

procedure TfmInvoiceEntryGrid.FillScrDetails(Sender: TObject);
Var
  i: Integer;
  AmenuItem: TMenuItem;
  aGroupRec: TGroupRecPointer;
begin
  dmDatabase.tblSysVars.Open;
  lblRep1.caption := dmDatabase.tblSysVarsSDocumentReportName1.Value;
  lblRep2.caption := dmDatabase.tblSysVarsSDocumentReportName2.Value;
  // Add Selling Prices Name
  for i := 0 to 2 do
    PriceList.Strings[i] := dmDatabase.tblSysVars.FieldByName
      ('SSellingPriceName' + IntToStr(i + 1)).AsString + '=0.00';
  dmDatabase.tblSysVars.close;

  CbxRepGroup1.Enabled := FillStringsWithReportingGroups
    (CbxRepGroup1.Items, 28);
  CbxRepGroup2.Enabled := FillStringsWithReportingGroups
    (CbxRepGroup2.Items, 29);

  Setreportinggroup1.caption := lblRep1.caption;
  for i := Setreportinggroup1.Count - 1 downto 0 do
  begin
    Setreportinggroup1.Items[i].free;
  end;
  for i := 0 to CbxRepGroup1.Items.Count - 1 do
  begin
    AmenuItem := TMenuItem.Create(Setreportinggroup1);
    AmenuItem.caption := CbxRepGroup1.Items[i];
    AmenuItem.Tag := Integer(CbxRepGroup1.Items.Objects[i]);
    AmenuItem.OnClick := HandelChangeGroup1Click;
    DMTCCoreLink.GroupsObject.getGroup(aGroupRec, AmenuItem.Tag);
    if aGroupRec.Wfontcol <> 0 then
    begin
      AmenuItem.Bitmap.Width := 24;
      AmenuItem.Bitmap.Height := 24;
      AmenuItem.Bitmap.PixelFormat := pf32bit;

      AmenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wbackcol;
      AmenuItem.Bitmap.Canvas.FillRect(Rect(0, 0, 24, 24));
      AmenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wfontcol;
      AmenuItem.Bitmap.Canvas.FillRect(Rect(8, 8, 16, 16));
      AmenuItem.Bitmap.Canvas.Pixels[0, 0] := clNone;
      AmenuItem.Bitmap.Canvas.Pixels[0, AmenuItem.Bitmap.Height - 1] := clNone;
    end;
    Setreportinggroup1.Add(AmenuItem);
  end;

  Setreportinggroup2.caption := lblRep2.caption;
  for i := Setreportinggroup2.Count - 1 downto 0 do
  begin
    Setreportinggroup2.Items[i].free;
  end;
  for i := 0 to CbxRepGroup2.Items.Count - 1 do
  begin
    AmenuItem := TMenuItem.Create(Setreportinggroup2);
    AmenuItem.caption := CbxRepGroup2.Items[i];
    AmenuItem.Tag := Integer(CbxRepGroup2.Items.Objects[i]);
    AmenuItem.OnClick := HandelChangeGroup2Click;
    DMTCCoreLink.GroupsObject.getGroup(aGroupRec, AmenuItem.Tag);
    if aGroupRec.Wfontcol <> 0 then
    begin
      // DMTCCoreLink.LoadImage(AMenuItem.Bitmap,'GEN0',24);
      AmenuItem.Bitmap.Width := 24;
      AmenuItem.Bitmap.Height := 24;
      AmenuItem.Bitmap.PixelFormat := pf32bit;

      AmenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wbackcol;

      AmenuItem.Bitmap.Canvas.FillRect(Rect(0, 0, 24, 24));
      AmenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wfontcol;
      AmenuItem.Bitmap.Canvas.FillRect(Rect(8, 8, 16, 16));
      AmenuItem.Bitmap.Canvas.Pixels[0, 0] := clNone;
      AmenuItem.Bitmap.Canvas.Pixels[0, AmenuItem.Bitmap.Height - 1] := clNone;
    end;
    Setreportinggroup2.Add(AmenuItem);
  end;

  FillStringsWithReportingGroups(cbSalesman.Items, 31);

  Salesman1.caption := Label3i.caption;
  Salesman1.Enabled := cbSalesman.Enabled;

  for i := Salesman1.Count - 1 downto 0 do
  begin
    Salesman1.Items[i].free;
  end;
  for i := 0 to cbSalesman.Items.Count - 1 do
  begin
    AmenuItem := TMenuItem.Create(Salesman1);
    AmenuItem.caption := cbSalesman.Items[i];
    AmenuItem.Tag := Integer(cbSalesman.Items.Objects[i]);
    AmenuItem.OnClick := HandelChangeSalesmanClick;
    Salesman1.Add(AmenuItem);
  end;

  if ((cbSalesman.ItemIndex < 0) Or (cbSalesman.Text = '')) AND
    (cbSalesman.Items.Count > 0) then
  begin
    if cbSalesman.Items.Count <> 0 then
      cbSalesman.ItemIndex := 0;
  end;
end;

Procedure TfmInvoiceEntryGrid.BringToFrontDocLines;
begin
  pnlDocLines.Visible := true;
  SetOldPanel2(true);
  pnlDocLines.BringToFront;
  AllOk := true;
  cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
  cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
  DoclineTranslate;
  SetupGridLayout;
end;

procedure TfmInvoiceEntryGrid.ExitDocLinesScr(Sender: TObject);
var
  DocID, Sortno, MaxDocline, UseTaxid, i, IndexFound: Integer;
  InvoiceTotal: Double;
  TaxRate, SubTotalExc, SubTotalInc: Double;
  Ataxarray: array of Double;
  Ataxidarray: array of Integer;
  aInvTotal, DiscTot: Double;
  AProgress: TfmNewProgress;
begin
  LoadingGridData := true;
  try

    MaxDocline := 0;
    if BtnOkPrint.CanFocus then
      BtnOkPrint.SetFocus;

    // check to see if theres no unselected stockitem.

    { while not tblBatch.EOF do
      begin
      if (tblBatchWDOCID.AsInteger = 0) and (TblbatchBReconciled.AsInteger <> 1) then
      begin
      cxGrid1.SetFocus ;
      raise Exception.Create('Please select stockitem!');
      end;
      tblBatch.Next
      end; }
    AProgress := TfmNewProgress.Create(nil);
    try
      if not DMTCCoreLink.TheZConnection.InTransaction then
        DMTCCoreLink.TheZConnection.StartTransaction;
      try
        idDocType := Integer(cbDocTypenew.Items.Objects
          [cbDocTypenew.ItemIndex]);
        if idDocType < 10 then
          idDocType := 10;
        LocalDocType := idDocType;
        if LocalDocType > 18 then
          LocalDocType := 14 + (LocalDocType mod 2);

        dmDatabase.tblDocLine.close;
        dmDatabase.tblDocHeader.SQL.Text :=
          'select * from dochead where WDocID=' + IntToStr(LastDocHeaderId);
        dmDatabase.tblDocHeader.Open;
        dmDatabase.tblStock.filter := '';

        if dmDatabase.tblDocHeader.IsEmpty then
        begin
          dmDatabase.tblDocHeader.Append;
          dmDatabase.tblDocHeaderDSysDate.AsDateTime := Now;
          dmDatabase.tblDocHeaderWUserID.Value := currentuser;
          dmDatabase.tblDocHeaderWTYPEID.Value := idDocType; // DOc Type
          dmDatabase.tblDocHeaderWAccountID.Value := edtWAccountID;
          dmDatabase.tblDocHeaderWPaymentTypeID.Value := 0;
          dmDatabase.tblDocHeaderBPrinted.Value := 0;
          dmDatabase.tblDocHeaderBPosted.Value := 0;

          LastDate := dmDatabase.tblDocHeaderDSysDate.AsDateTime;
          dmDatabase.tblDocHeaderBRepeating.Value := 0;
          dmDatabase.tblDocHeaderWCURRENCYID.Value := 0;
          if FProjectId <> 0 then
            dmDatabase.tblDocHeaderWJOBCODEID.AsInteger := FProjectId;
          AccID := dmDatabase.tblDocHeaderWAccountID.Value;
          LastDocHeaderId := dmDatabase.tblDocHeaderWDocID.AsInteger;
          dmDatabase.tblDocHeaderSDocNo.Value :=
            TDataBaseDocumentRoutines.GetDocNextNum(idDocType);
          if cbInvoiceNumber.Items.IndexOf
            (dmDatabase.tblDocHeaderSDocNo.Value) = -1 then
            cbInvoiceNumber.Items.Add(dmDatabase.tblDocHeaderSDocNo.Value);
          dmDatabase.tblDocHeader.post;
        end
        else
        begin
          if dmDatabase.tblDocHeaderDSysDate.AsDateTime <> LastDate then
          begin
            if OSFMessageDlg(format(DMTCCoreLink.GetTextLang(3369),
              [TDatabaseUserRoutines.GetUsername(dmDatabase.tblDocHeaderWUserID.
              AsInteger)]), mtConfirmation, [mbYes, mbNo], 0) = mrno then
              raise Exception.Create(DMTCCoreLink.GetTextLang(3370));

          end;

        end;

        dmDatabase.tblDocHeader.Edit;

        if (LocalDocType in [14, 15]) then
        begin
          // dmDatabase.tblDocHeaderBPOSTED.AsInteger := ord(cbPosted.Checked) ;
          if cbPosted.ItemIndex = 0 then
            dmDatabase.tblDocHeaderBPosted.AsInteger := 0
          else if cbPosted.ItemIndex = 2 then
            dmDatabase.tblDocHeaderBPosted.AsInteger := 1
          else
            dmDatabase.tblDocHeaderBPosted.AsInteger := -1
        end;

        Sortno := 1;
        UpDateDocHeader;
        // go to the index 2 so theres no autoshow of the stocklist
        WClose := true;
        ForceCol0 := true;
        cxGrid1DBTableView1.Controller.FocusedColumnindex := 2;
        WClose := false;
        ForceCol0 := false;
        if (tblBatch.State in [dsedit, DsInsert]) then
          tblBatch.post;
        UpdateTotalsLbls;
        SetOldPanel2(false);
        InvoiceTotal := 0;

        tblBatchRefTotals.close;
        DocID := dmDatabase.tblDocHeaderWDocID.Value;
        dmDatabase.tblDocLine.SQL.Text :=
          'Select * from docline where WDocID = ' + IntToStr(DocID);
        dmDatabase.tblDocLine.Open;

        // Clear out the old invoice lines
        AProgress.initProgress('save data...', tblBatch.RecordCount);

        if tblBatch.State = dsedit then
          tblBatch.post;
        LoadingGridData := true;
        tblBatch.DisableControls;
        try
          // Add extra cost
          DiscTot := StrToFloatDef(LblExcl.caption, 0);
          if (aShipcostunittype <> 0) and (cbShipments.ItemIndex > 0) then
            if StrToFloatDef(Eshipment.Text, 0) <> 0 then
            begin
              dmDatabase.tblDocHeader.Edit;
              dmDatabase.tblDocHeader.FieldByName('WSHIPSTOCKID').AsInteger :=
                Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]);
              if dmDatabase.tblDocHeader.FieldByName('WSHIPSTOCKID')
                .AsInteger <> 0 then
              begin
                DMTCCoreLink.WriteSysParam('LASTSHIP' + IntToStr(edtWAccountID),
                  dmDatabase.tblDocHeader.FieldByName('WSHIPSTOCKID')
                  .AsString, 0, 22);
                DMTCCoreLink.WriteSysParam('LASTSAMT' + IntToStr(edtWAccountID),
                  Eshipment.Text, 0, 22);
              end;

              tblBatch.Append;
              tblBatchSCONTRAACCOUNT.AsString := '1';
              tblBatchSACCOUNT.AsString := '1';
              if DefaultTaxId <> 0 then
                UseTaxid := DefaultTaxId
              else
                UseTaxid := TDataBaseStockRoutines.GetOuputTaxId
                  (Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]));
              tblBatchSREFERENCE.AsString := TDataBaseStockRoutines.GetStockCode
                (Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]));
              tblBatchSDESCRIPTION.AsString :=
                TDataBaseStockRoutines.GetStockDescription
                (Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]));
              tblBatchWTAXID.AsInteger := UseTaxid;
              tblBatchSTAX.ReadOnly := false;
              tblBatchSTAX.AsString :=
                TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(UseTaxid);
              tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
              tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
              DiscTot := DiscTot + StrToFloatDef(Eshipment.Text, 0);
              tblBatchFDEBIT.Value := StrToFloatDef(Eshipment.Text, 0);
              if not ExclMode then
                tblBatchFDEBIT.Value := tblBatchFDEBIT.Value *
                  TDataBaseRoutines.gettaxrateonId(UseTaxid);
              tblBatchFCREDIT.Value :=
                FixAmount(StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 1) *
                tblBatchFDEBIT.Value,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
              tblBatchFTAXAMOUNT.Value := 0;
              tblBatch.post;
            end;

          if (LocalDocType in [10, 11, 14, 16]) then
          begin

            if aPayDiscountItem <> 0 then
              if StrToFloatDef(EPaymentDiscount.Text, 0) <> 0 then
              begin
                dmDatabase.tblDocHeader.Edit;
                dmDatabase.tblDocHeader.FieldByName('FPAYMENTDISCOUNT').AsFloat
                  := StrToFloatDef(EPaymentDiscount.Text, 0);
                if dmDatabase.tblDocHeader.FieldByName('FPAYMENTDISCOUNT')
                  .AsFloat <> 0 then
                  DMTCCoreLink.WriteSysParam
                    ('LASTDISC' + IntToStr(edtWAccountID),
                    EPaymentDiscount.Text, 0, 22);
                if BBelgiumStyleDiscount then
                begin
                  tblBatch.first;
                  while not tblBatch.Eof do
                  begin
                    if tblBatchWTAXID.AsInteger <> 0 then
                      if tblBatchBRECONCILED.AsInteger = 0 then
                        if tblBatchFCREDIT.AsFloat <> 0 then
                        begin
                          IndexFound := -1;
                          for i := low(Ataxidarray) to high(Ataxidarray) do
                            if Ataxidarray[i] = tblBatchWTAXID.AsInteger then
                            begin
                              IndexFound := i;
                            end;
                          if IndexFound = -1 then
                          begin
                            IndexFound := high(Ataxidarray) + 1;
                            SetLength(Ataxarray, high(Ataxidarray) + 2);
                            SetLength(Ataxidarray, high(Ataxidarray) + 2);
                            Ataxidarray[IndexFound] := tblBatchWTAXID.AsInteger;
                            Ataxarray[IndexFound] := 0;

                          end;
                          if not ExclMode then
                            Ataxarray[IndexFound] := Ataxarray[IndexFound] +
                              (tblBatchFCREDIT.AsFloat /
                              TDataBaseRoutines.gettaxrateonId
                              (tblBatchWTAXID.AsInteger, false))
                          else
                            Ataxarray[IndexFound] := Ataxarray[IndexFound] +
                              tblBatchFCREDIT.AsFloat;
                        end;

                    tblBatch.next;
                  end;
                  for i := low(Ataxarray) to high(Ataxarray) do
                    if Ataxarray[i] <> 0 then
                    begin
                      tblBatch.Append;
                      tblBatchSCONTRAACCOUNT.AsString := '-1';
                      tblBatchSACCOUNT.AsString := '-1';
                      tblBatchSREFERENCE.AsString :=
                        TDataBaseStockRoutines.GetStockCode(aPayDiscountItem);
                      tblBatchSDESCRIPTION.AsString :=
                        TDataBaseStockRoutines.GetStockDescription
                        (aPayDiscountItem);
                      tblBatchWTAXID.AsInteger := Ataxidarray[i];
                      tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                      tblBatchSTAX.ReadOnly := false;
                      tblBatchSTAX.AsString :=
                        TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                        (Ataxidarray[i]);
                      tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                      tblBatchFDEBIT.Value := Ataxarray[i] *
                        (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                      if not ExclMode then
                        tblBatchFDEBIT.Value := tblBatchFDEBIT.Value *
                          TDataBaseRoutines.gettaxrateonId(UseTaxid);
                      tblBatchFCREDIT.Value := -FixAmount(tblBatchFDEBIT.Value,
                        dmDatabase.SetOfBooksPropertys.DataParameter.
                        WDocRowDecimals);
                      tblBatchFTAXAMOUNT.Value := 0;
                      tblBatch.post;
                      tblBatch.Append;
                      tblBatchSCONTRAACCOUNT.AsString := '1';
                      tblBatchSACCOUNT.AsString := '1';
                      tblBatchSREFERENCE.AsString :=
                        TDataBaseStockRoutines.GetStockCode(aPayDiscountItem);
                      tblBatchSDESCRIPTION.AsString :=
                        TDataBaseStockRoutines.GetStockDescription
                        (aPayDiscountItem);
                      tblBatchWTAXID.AsInteger := 0;
                      tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                      tblBatchSTAX.ReadOnly := false;
                      tblBatchSTAX.AsString :=
                        TDataBaseRoutines.
                        GetAccountCodeWithDashFromAccountId(0);
                      tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                      tblBatchFDEBIT.Value := Ataxarray[i] *
                        (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                      tblBatchFCREDIT.Value := FixAmount(tblBatchFDEBIT.Value,
                        dmDatabase.SetOfBooksPropertys.DataParameter.
                        WDocRowDecimals);
                      tblBatchFTAXAMOUNT.Value := 0;
                      tblBatch.post;
                    end;

                end
                else
                begin
                  tblBatch.Append;
                  tblBatchSCONTRAACCOUNT.AsString := '-1';
                  tblBatchSACCOUNT.AsString := '-1';
                  if DefaultTaxId <> 0 then
                    UseTaxid := DefaultTaxId
                  else
                    UseTaxid := TDataBaseStockRoutines.GetOuputTaxId
                      (aPayDiscountItem);
                  tblBatchSREFERENCE.AsString :=
                    TDataBaseStockRoutines.GetStockCode(aPayDiscountItem);
                  tblBatchSDESCRIPTION.AsString :=
                    TDataBaseStockRoutines.GetStockDescription
                    (aPayDiscountItem);
                  tblBatchWTAXID.AsInteger := UseTaxid;
                  tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                  tblBatchSTAX.ReadOnly := false;
                  tblBatchSTAX.AsString :=
                    TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                    (UseTaxid);
                  tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                  tblBatchFDEBIT.Value := DiscTot *
                    (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                  if not ExclMode then
                    tblBatchFDEBIT.Value := tblBatchFDEBIT.Value *
                      TDataBaseRoutines.gettaxrateonId(UseTaxid);
                  tblBatchFCREDIT.Value :=
                    FixAmount(StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 1)
                    * tblBatchFDEBIT.Value,
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);
                  tblBatchFTAXAMOUNT.Value := 0;
                  tblBatch.post;
                end;
              end
          end
          else if aPayDiscountItemCred <> 0 then
            if StrToFloatDef(EPaymentDiscount.Text, 0) <> 0 then
            begin
              dmDatabase.tblDocHeader.Edit;
              dmDatabase.tblDocHeader.FieldByName('FPAYMENTDISCOUNT').AsFloat :=
                StrToFloatDef(EPaymentDiscount.Text, 0);
              if dmDatabase.tblDocHeader.FieldByName('FPAYMENTDISCOUNT')
                .AsFloat <> 0 then
                DMTCCoreLink.WriteSysParam('LASTDISC' + IntToStr(edtWAccountID),
                  EPaymentDiscount.Text, 0, 22);

              if BBelgiumStyleDiscount then
              begin
                tblBatch.first;
                while not tblBatch.Eof do
                begin
                  if tblBatchWTAXID.AsInteger <> 0 then
                    if tblBatchBRECONCILED.AsInteger = 0 then
                      if tblBatchFCREDIT.AsFloat <> 0 then
                      begin
                        IndexFound := -1;
                        for i := low(Ataxidarray) to high(Ataxidarray) do
                          if Ataxidarray[i] = tblBatchWTAXID.AsInteger then
                          begin
                            IndexFound := i;
                          end;
                        if IndexFound = -1 then
                        begin
                          IndexFound := high(Ataxidarray) + 1;
                          SetLength(Ataxarray, high(Ataxidarray) + 2);
                          SetLength(Ataxidarray, high(Ataxidarray) + 2);
                          Ataxarray[IndexFound] := tblBatchWTAXID.AsInteger;

                        end;
                        if not ExclMode then
                          Ataxarray[IndexFound] := Ataxarray[IndexFound] +
                            (tblBatchFCREDIT.AsFloat /
                            TDataBaseRoutines.gettaxrateonId
                            (tblBatchWTAXID.AsInteger, false))
                        else
                          Ataxarray[IndexFound] := Ataxarray[IndexFound] +
                            tblBatchFCREDIT.AsFloat;
                      end;

                  tblBatch.next;
                end;
                for i := low(Ataxarray) to high(Ataxarray) do
                  if Ataxarray[i] <> 0 then
                  begin
                    tblBatch.Append;
                    tblBatchSCONTRAACCOUNT.AsString := '-1';
                    tblBatchSACCOUNT.AsString := '-1';
                    tblBatchSREFERENCE.AsString :=
                      TDataBaseStockRoutines.GetStockCode(aPayDiscountItemCred);
                    tblBatchSDESCRIPTION.AsString :=
                      TDataBaseStockRoutines.GetStockDescription
                      (aPayDiscountItemCred);
                    tblBatchWTAXID.AsInteger := Ataxidarray[i];
                    tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                    tblBatchSTAX.ReadOnly := false;
                    tblBatchSTAX.AsString :=
                      TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                      (Ataxidarray[i]);
                    tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                    tblBatchFDEBIT.Value := Ataxarray[i] *
                      (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                    if not ExclMode then
                      tblBatchFDEBIT.Value := tblBatchFDEBIT.Value *
                        TDataBaseRoutines.gettaxrateonId(UseTaxid);
                    tblBatchFCREDIT.Value := -FixAmount(tblBatchFDEBIT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                    tblBatchFTAXAMOUNT.Value := 0;
                    tblBatch.post;
                    tblBatch.Append;
                    tblBatchSCONTRAACCOUNT.AsString := '1';
                    tblBatchSACCOUNT.AsString := '1';
                    tblBatchSREFERENCE.AsString :=
                      TDataBaseStockRoutines.GetStockCode(aPayDiscountItemCred);
                    tblBatchSDESCRIPTION.AsString :=
                      TDataBaseStockRoutines.GetStockDescription
                      (aPayDiscountItemCred);
                    tblBatchWTAXID.AsInteger := 0;
                    tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                    tblBatchSTAX.ReadOnly := false;
                    tblBatchSTAX.AsString :=
                      TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(0);
                    tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                    tblBatchFDEBIT.Value := Ataxarray[i] *
                      (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                    tblBatchFCREDIT.Value := FixAmount(tblBatchFDEBIT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                    tblBatchFTAXAMOUNT.Value := 0;
                    tblBatch.post;
                  end;

              end
              else
              begin
                tblBatch.Append;
                tblBatchSCONTRAACCOUNT.AsString := '-1';
                tblBatchSACCOUNT.AsString := '-1';
                if DefaultTaxId <> 0 then
                  UseTaxid := DefaultTaxId
                else
                  UseTaxid := TDataBaseStockRoutines.GetInputTaxId
                    (aPayDiscountItemCred);
                tblBatchSREFERENCE.AsString :=
                  TDataBaseStockRoutines.GetStockCode(aPayDiscountItemCred);
                tblBatchSDESCRIPTION.AsString :=
                  TDataBaseStockRoutines.GetStockDescription
                  (aPayDiscountItemCred);
                tblBatchWTAXID.AsInteger := UseTaxid;
                tblBatchBEXCLUSIVE.AsInteger := ord(ExclMode);
                tblBatchSTAX.ReadOnly := false;
                tblBatchSTAX.AsString :=
                  TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                  (UseTaxid);
                tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                tblBatchFDEBIT.Value := DiscTot *
                  (StrToFloatDef(EPaymentDiscount.Text, 0) / 100);
                if not ExclMode then
                  tblBatchFDEBIT.Value := tblBatchFDEBIT.Value *
                    TDataBaseRoutines.gettaxrateonId(UseTaxid);
                tblBatchFCREDIT.Value :=
                  FixAmount(StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 1) *
                  tblBatchFDEBIT.Value,
                  dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
                tblBatchFTAXAMOUNT.Value := 0;
                tblBatch.post;
              end;
            end;
          tblBatch.first;
          dmDatabase.tblDocLine.first;
          while not(dmDatabase.tblDocLine.Eof or
            dmDatabase.tblDocLine.IsEmpty) do
          begin
            if not tblBatch.Locate('WLINEID',
              dmDatabase.tblDocLineWDoclineid.AsInteger, []) then
              dmDatabase.tblDocLine.Delete
            else
              dmDatabase.tblDocLine.next
          end;

          cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
          tblBatch.first;
          dmDatabase.tblStock.Open;
          dmDatabase.tblTax.Open;
          while not tblBatch.Eof do
            if (tblBatchBRECONCILED.AsInteger = 0) and
              (tblBatchFDEBIT.AsFloat = 0) and (tblBatchFCREDIT.AsFloat = 0) AND
              (tblBatchSREFERENCE.AsString = '') AND
              (Str2Float(tblBatchSACCOUNT.AsString) = 0) AND
              (Str2Float(tblBatchSCONTRAACCOUNT.AsString) = 0) then
              tblBatch.Delete
            else
            Begin
              AProgress.SetProgress('', tblBatch.RecNo);
              if (tblBatchSREFERENCE.AsString = '') and
                (tblBatchBRECONCILED.Value <> 1) then
              begin
                DMTCCoreLink.TheZConnection.Rollback;
                OSFMessageDlg('Error in line ' + tblBatchWLINEID.AsString +
                  ' please check data!', mtConfirmation, [mbok], 0);

                exit;
              end;
              if not dmDatabase.tblDocLine.Locate('WDocLineID',
                tblBatchWLINEID.AsInteger, []) then
                dmDatabase.tblDocLine.Append
              else
                dmDatabase.tblDocLine.Edit;
              dmDatabase.tblDocLineWREPORTINGGROUP1ID.AsInteger :=
                tblBatchWREPORTINGGROUP1ID.AsInteger;
              dmDatabase.tblDocLineWREPORTINGGROUP2ID.AsInteger :=
                tblBatchWREPORTINGGROUP2ID.AsInteger;
              dmDatabase.tblDocLineWSORTNO.AsInteger := Sortno;
              inc(Sortno);

              dmDatabase.tblDocLineWDocID.Value := DocID;
              dmDatabase.tblDocLineWDoclineid.Value :=
                tblBatchWLINEID.AsInteger;
              if MaxDocline < tblBatchWLINEID.AsInteger then
                MaxDocline := tblBatchWLINEID.AsInteger;

              dmDatabase.ZQStock.SQL.Text :=
                dmDatabase.SQLList.GetFormatedSQLByName
                ('database_selectstockoncode');
              dmDatabase.ZQStock.ParamByName('SStockCode').AsString :=
                UPPERCASE(tblBatchSREFERENCE.AsString);
              dmDatabase.ZQStock.Open;
              if tblBatchBRECONCILED.AsInteger = 0 then
              begin
                if dmDatabase.ZQStock.IsEmpty then
                  raise Exception.Create
                    ('Stockitem ' + tblBatchSREFERENCE.AsString + ' not found');
                dmDatabase.tblDocLineWStockID.Value :=
                  dmDatabase.ZQStockWStockID.Value;
              end
              else
                dmDatabase.tblDocLineWStockID.clear;

              If tblBatchBRECONCILED.Value = 1 then
                dmDatabase.tblDocLineWLineTypeID.Value := 91 // Comment Line
              else If ExclMode then
                dmDatabase.tblDocLineWLineTypeID.Value := 90 // Stock Item
              else
                dmDatabase.tblDocLineWLineTypeID.Value := 94; // Inclusive Mode
              // end type document
              if tblBatchBRECONCILED.Value = 1 then
                dmDatabase.tblDocLineWDescriptionID.Value :=
                  tblBatchWACCOUNTID.Value
              else
                // done we need to trim it as database do not store spaces so im changing all the locates to include trim
                // todo  : We should change to get add description
                // or maby do like the comment insert the Desc and link it to tblBatchWAccountID
                dmDatabase.tblDocLineWDescriptionID.Value :=
                  AddMessage(tblBatchSDESCRIPTION.Value);
              if tblBatchSACCOUNT.Value <> '' then
                dmDatabase.tblDocLineFQtyOrdered.Value :=
                  Str2Float(tblBatchSACCOUNT.Value);
              if tblBatchSCONTRAACCOUNT.Value <> '' then
                dmDatabase.tblDocLineFQtyShipped.Value :=
                  Str2Float(tblBatchSCONTRAACCOUNT.Value);
              dmDatabase.tblDocLineFSellingPrice.Value := tblBatchFDEBIT.Value;
              if (UseMuliplier > 0) and
                (dmDatabase.tblDocLine.FindField('FUNITQTY') <> nil) then
                dmDatabase.tblDocLine.FindField('FUNITQTY').AsFloat :=
                  tblBatchFUNITQTY.AsFloat;

              if dmDatabase.tblDocLine.FindField('WFREETYPEID') <> nil then
                dmDatabase.tblDocLine.FindField('WFREETYPEID').Value :=
                  tblBatch.FieldByName('WFREETYPEID').Value;

              if dmDatabase.tblDocLine.FindField('DEXTRADATE1') <> nil then
                dmDatabase.tblDocLine.FindField('DEXTRADATE1').Value :=
                  tblBatch.FieldByName('DEXTRADATE1').Value;
              if dmDatabase.tblDocLine.FindField('DEXTRADATE2') <> nil then
                dmDatabase.tblDocLine.FindField('DEXTRADATE2').Value :=
                  tblBatch.FieldByName('DEXTRADATE2').Value;

              if dmDatabase.tblDocLine.FindField('BCHECKED') <> nil then
                dmDatabase.tblDocLine.FindField('BCHECKED').AsInteger :=
                  tblBatchNOTUSED.AsInteger;
              if dmDatabase.tblDocLine.FindField('DDELIVERDATE') <> nil then
              begin
                if tblBatchDDATE.IsNull then
                  dmDatabase.tblDocLine.FindField('DDELIVERDATE').clear
                else
                  dmDatabase.tblDocLine.FindField('DDELIVERDATE').Value :=
                    tblBatchDDATE.Value;
              end;

              if dmDatabase.tblDocLine.FindField('DDELIVERDATE2') <> nil then
              begin
                if tblBatchDALLOCATEDDATE.IsNull then
                  dmDatabase.tblDocLine.FindField('DDELIVERDATE2').clear
                else
                  dmDatabase.tblDocLine.FindField('DDELIVERDATE2').Value :=
                    tblBatchDALLOCATEDDATE.Value;
              end;

              dmDatabase.tblDocLineSUNIT.AsString := tblBatchWUNITID.AsString;

              dmDatabase.tblDocLineFItemDiscount.Value :=
                tblBatchFTAXAMOUNT.Value;
              if tblBatchBRECONCILED.Value <> 1 then
              begin
                if dmDatabase.ZQStockWSTOCKTYPEID.AsInteger = 10 then
                begin
                  fmStockLinkDetail.TotalFromStockDocLine
                    (dmDatabase.tblDocLineWDoclineid.AsInteger, SubTotalExc,
                    SubTotalInc);
                  // fmStockLinkDetail.InitFromStockDocLine(DmDatabase.ZQStockWSTOCKID.AsInteger,dmDatabase.tblDocLineWDOCLINEID.AsInteger);
                  dmDatabase.tblDocLineFInclusiveAmt.Value :=
                    FixAmount(SubTotalInc,
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);
                  dmDatabase.tblDocLineFExclusiveAmt.Value :=
                    FixAmount(SubTotalExc,
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);
                  dmDatabase.tblDocLineFTAXAMOUNT.Value :=
                    FixAmount((dmDatabase.tblDocLineFInclusiveAmt.Value -
                    dmDatabase.tblDocLineFExclusiveAmt.Value),
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);

                end
                else
                begin

                  dmDatabase.tblDocLineWTaxID.Value :=
                    GetAccountIdFromCodeAndType
                    (GetMainAccountCode(tblBatchSTAX.Value) +
                    GetSubAccountCode(tblBatchSTAX.Value), 4);
                  TaxRate :=
                    gettaxrateonId(dmDatabase.tblDocLineWTaxID.Value, true);
                  If ExclMode and (TaxRate <> 0) and (TaxRate <> 2) then
                  begin
                    dmDatabase.tblDocLineFInclusiveAmt.Value :=
                      FixAmount(tblBatchFCREDIT.Value * TaxRate,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                    dmDatabase.tblDocLineFExclusiveAmt.Value :=
                      FixAmount(tblBatchFCREDIT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                  end
                  else
                  begin

                    dmDatabase.tblDocLineFInclusiveAmt.Value :=
                      FixAmount(tblBatchFCREDIT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                    if (TaxRate <> 2) then
                      dmDatabase.tblDocLineFExclusiveAmt.Value :=
                        FixAmount(tblBatchFCREDIT.Value / TaxRate,
                        dmDatabase.SetOfBooksPropertys.DataParameter.
                        WDocRowDecimals)
                    else
                      dmDatabase.tblDocLineFExclusiveAmt.Value := 0;
                  end;
                  dmDatabase.tblDocLineFTAXAMOUNT.Value :=
                    FixAmount((dmDatabase.tblDocLineFInclusiveAmt.Value -
                    dmDatabase.tblDocLineFExclusiveAmt.Value),
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);

                  dmDatabase.tblDocLineWACCOUNTID.AsInteger :=
                    tblBatchWCONTRAACCOUNTID.AsInteger;
                end;
              end;

              if dmDatabase.tblDocLineWLineTypeID.Value = 91 then
              begin
                dmDatabase.tblDocLineFQtyOrdered.clear;
                dmDatabase.tblDocLineFQtyShipped.clear;
                dmDatabase.tblDocLineFSellingPrice.clear;
                dmDatabase.tblDocLineFItemDiscount.clear;
                dmDatabase.tblDocLineFExclusiveAmt.clear;
                dmDatabase.tblDocLineFInclusiveAmt.clear;
                dmDatabase.tblDocLineFTAXAMOUNT.clear;
              end;
              dmDatabase.tblDocLine.post;
              tblBatch.next;
            end;
        finally
          LoadingGridData := false;
          tblBatch.EnableControls;
        end;
        // add payments
        PaymentDetails.first;
        while not PaymentDetails.Eof do
        begin
          if PaymentDetails.Fields[0].AsFloat <> 0 then
          begin
            dmDatabase.tblDocLine.Append;
            dmDatabase.tblDocLineWSORTNO.AsInteger := Sortno;
            inc(Sortno);
            dmDatabase.tblDocLineWDocID.Value := DocID;
            inc(MaxDocline);
            dmDatabase.tblDocLineWDoclineid.Value := MaxDocline;
            dmDatabase.tblDocLineWStockID.clear;
            dmDatabase.tblDocLineWLineTypeID.Value := 93; // Fin entry
            dmDatabase.tblDocLineWDescriptionID.Value :=
              AddMessage(PaymentDetails.Fields[1].AsString);
            dmDatabase.tblDocLineFInclusiveAmt.Value := PaymentDetails.Fields
              [0].AsFloat;
            dmDatabase.tblDocLineFExclusiveAmt.Value := PaymentDetails.Fields
              [0].AsFloat;
            dmDatabase.tblDocLineWACCOUNTID.AsInteger := PaymentDetails.Fields
              [2].AsInteger;
            dmDatabase.tblDocLine.post;
          end;
          PaymentDetails.next;
        end;
        // save data
        DocSelectOptions.DoPost(dmDatabase.tblDocHeaderWDocID.AsInteger);

        // GetInvoiceTotals(aExclTotal,aInvTotal,aDiscTotal,ANettweight,AGrossWeigth);
        dmDatabase.tblDocHeader.Edit;
        dmDatabase.tblDocHeaderBExclusive.Value := ord(ExclMode);
        dmDatabase.tblDocHeaderFInvoiceDiscount.AsFloat := GlobalDiscount;
        dmDatabase.tblDocHeaderDSysDate.AsDateTime := Now;

        dmDatabase.tblDocHeaderSEXTERNALID.AsString := ESExtraDesc.Text;

        dmDatabase.tblDocHeader.post;
        TDataBaseDocumentRoutines.CleanupDochead
          (dmDatabase.tblDocHeaderWDocID.AsInteger);
        LastDocHeaderId := dmDatabase.tblDocHeaderWDocID.AsInteger;
        dmDatabase.tblDocHeader.SQL.Text :=
          'select * from dochead where WDocID=' + IntToStr(LastDocHeaderId);
        dmDatabase.tblDocHeader.Open;

        aInvTotal := dmDatabase.tblDocHeaderFDOCAMOUNT.AsFloat;
        if ((CreditLimit - (TotalAcc + aInvTotal)) < 0) And
          (CreditLimit <> 0) then
          if (LocalDocType in [10, 11, 14, 16]) then
            OSFMessageDlg(GetTextLang(765)
              { 'Debtor's Balance is over credit limit with } + #13#10 +
              FloatToStr(FixAmount(CreditLimit - TotalAcc - InvoiceTotal)),
              mtinformation, [mbok], 0)
          else
            OSFMessageDlg(StringReplace(GetTextLang(765), GetTextLang(31),
              GetTextLang(30), [rfreplaceall]) + #13#10 +
              FloatToStr(FixAmount(CreditLimit - TotalAcc - InvoiceTotal)),
              mtinformation, [mbok], 0);
        tblBatch.close;
        tblBatchRefTotals.close;

        if AExternalForm <> nil then
        begin
          AExternalSendString := 'SAVEDOC=' + IntToStr(LastDocHeaderId) + #13 +
            #10 + GetPluginLineString(false);
          AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
            pchar(AExternalSendString));
        end;
        MyLocBatSerInput.PostData(LastDocHeaderId);
        fmDocLinks.SaveData(LastDocHeaderId);

      finally
        if DMTCCoreLink.TheZConnection.InTransaction then
          DMTCCoreLink.TheZConnection.Commit;
      end;

      fmStockLinkDetail.SaveDoc(LastDocHeaderId);

      SendMessageToPlugin('POST=' + IntToStr(LastDocHeaderId));
      cleartable(tblBatch.TableName);
      pnlDocLines.Visible := false;
      SetOldPanel2(false);
      if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 4 then
      begin
        DMTCCoreLink.LogAction('DOCSAVE', LastDocHeaderId, 'Document saved!');
      end;
    finally
      AProgress.free;
    end;
  finally
    LoadingGridData := false;
  end;
end;

Procedure TfmInvoiceEntryGrid.EnterDocLinesScr(Sender: TObject);
var

  OK: Boolean;
  MyVar: Variant;
  AProgress: TfmNewProgress;

  ReorderLevel, i: Integer;
  procedure DeleteField(AField: String);
  var
    X: Integer;
  begin
    for X := cxGrid1DBTableView1.ColumnCount - 1 downto 0 do
      if AField = TcxGridDBColumn(cxGrid1DBTableView1.Columns[X])
        .DataBinding.FieldName then
      begin
        cxGrid1DBTableView1.Columns[X].free;
        exit;
      end;
  end;

begin
  FirstGridFocus := true;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  tbAddToBackorder.Visible := LocalDocType = 14;
  LoadingGridData := true;

  try
    DeleteField('FCOST');

    if not ZQCostGroup2.Active then
    begin
      ZQCostGroup2.Open;
      if (ZQCostGroup2.RecordCount < 2) or
        not ReadSysParam('cbCostcentersInDoc', false, currentuser)
        .AsBoolean then
      begin
        cxGrid1DBTableView1WREPORTINGGROUP2ID.Visible := false;
      end;
      ZQCostgroup1.close;
      ZQCostgroup1.Open;
      if (ZQCostgroup1.RecordCount < 2) or
        not ReadSysParam('cbCostcentersInDoc', false, currentuser)
        .AsBoolean then
      begin
        cxGrid1DBTableView1WREPORTINGGROUP1ID.Visible := false;
      end;
    end;

    if ShowStkGrosscost and not(LocalDocType in [12, 13, 15, 17]) then
      if not((ShowGrossAsCostprice) and (LocalDocType in [10])) then
      begin
        with cxGrid1DBTableView1.CreateColumn as TcxGridDBColumn do
        begin
          caption := DMTCCoreLink.GetTextLang(1188);
          DataBinding.FieldName := 'FCOST';
          Options.Editing := false;
        end;

      end;

    cxGrid1DBTableView1WUNITID.Visible := false;
    if (UseUnitQty and (LocalDocType in [12, 13, 15, 17])) or
      (UseUnitQtyForSale and (LocalDocType in [10, 11, 14, 16])) then
    begin
      ZQUnit.Open;
      cxGrid1DBTableView1WUNITID.Visible := true;
    end;

    cxGrid1DBTableView1SACCOUNT.caption := DMTCCoreLink.GetTextLang(1861);
    cxGrid1DBTableView1SACCOUNT.Visible := not STKNoBackOrder;

    if DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_HIDEORDERCOL') <> '' then
    begin
      if VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
        (TDatabaseTableRoutines.ReplaceParams
        (DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_HIDEORDERCOL'),
        'WACCOUNTID=' + IntToStr(edtWAccountID)))) = '1' then
        cxGrid1DBTableView1SACCOUNT.Visible := false;
    end;

    stgrosscost.Visible := (LocalDocType in [10, 11, 14, 16]) and
      ShowStkGrosscost;
    Label10.Visible := stgrosscost.Visible;
    Label23.Visible := stgrosscost.Visible;
    stGrossProfit.Visible := stgrosscost.Visible;
    // EContact.tag := 0 ;
    tbBackorder.Visible := false;
    LastStock.WStockID := 0;
    LastStock.WStockTypeId := 0;
    Eshipment.Text := '';
    LastStock.SSTOCKCODE := '';
    LastStock.SBARCODENUMBER := '';
    dmDatabase.CreateBatch('DOCBATCH_' + IntToStr(currentuser) + '_' +
      IntToStr(currentuser));
    tblBatch.close;
    tblBatchRefTotals.close;
    tblBatch.TableName := 'DOCBATCH_' + IntToStr(currentuser) + '_' +
      IntToStr(currentuser);

    if not TDatabaseTableRoutines.FieldExists(tblBatch.TableName,
      'WUNITID') then
    begin
      TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
        ' ADD FUNITQTY Numeric(12,8)');
      TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
        ' ADD WUNITID integer');
      tblBatch.Tag := 0;
    end;
    if TDatabaseTableRoutines.FieldExists('DOCLINE', 'DEXTRADATE1') then
      if not TDatabaseTableRoutines.FieldExists(tblBatch.TableName,
        'DEXTRADATE1') then
      begin
        TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
          ' ADD DEXTRADATE1 Timestamp');
        tblBatch.Tag := 0;
      end;
    if TDatabaseTableRoutines.FieldExists('DOCLINE', 'DEXTRADATE2') then
      if not TDatabaseTableRoutines.FieldExists(tblBatch.TableName,
        'DEXTRADATE2') then
      begin
        TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
          ' ADD DEXTRADATE2 Timestamp');
        tblBatch.Tag := 0;
      end;
    if TDatabaseTableRoutines.FieldExists('DOCLINE', 'WFREETYPEID') then
      if not TDatabaseTableRoutines.FieldExists(tblBatch.TableName,
        'WFREETYPEID') then
      begin
        TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
          ' ADD WFREETYPEID integer');
        tblBatch.Tag := 0;
      end;
    // check field lenght
    if DMTCCoreLink.GetFieldLength(tblBatch.TableName, 'SREFERENCE') <>
      DMTCCoreLink.GetFieldLength('STOCK', 'SSTOCKCODE') then
    begin
      TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
        ' ALTER SREFERENCE TYPE varChar(' +
        IntToStr(DMTCCoreLink.GetFieldLength('STOCK', 'SSTOCKCODE')) + '); ');
      tblBatch.Tag := 0;
    end;
    if DMTCCoreLink.GetFieldLength(tblBatch.TableName, 'SDESCRIPTION') <>
      DMTCCoreLink.MessageLength then
    begin
      TDataBaseRoutines.ExecSql('ALTER TABLE ' + tblBatch.TableName +
        ' ALTER SDESCRIPTION TYPE varChar(' +
        IntToStr(DMTCCoreLink.MessageLength) + '); ');
      tblBatch.Tag := 0;
    end;
    AProgress := TfmNewProgress.Create(nil);
    try

      if ShowHintForLine then
      begin
        self.ShowHint := false;
        Application.HintPause := 500;
      end;
      while not PaymentDetails.IsEmpty do
        PaymentDetails.Delete;

      cleartable(tblBatch.TableName);
      tblBatch.close;

      tblBatchRefTotals.close;
      tblBatchRefTotals.TableName := tblBatch.TableName;
      ExclMode := true;
      tblBatch.DisableControls;
      try
        tblBatchRefTotals.close;
        tblBatch.Connection := dmDatabase.ZMainconnection;
        tblBatchRefTotals.Connection := dmDatabase.ZMainconnection;
        dmDatabase.tblDocHeader.SQL.Text :=
          'select * from dochead where WDocID=' + IntToStr(LastDocHeaderId);
        dmDatabase.tblDocHeader.Open;
        tblBatch.Open;
        ENewDescription.MaxLength := tblBatchSDESCRIPTION.Size;

        LastDate := 0;
        if dmDatabase.tblDocHeader.IsEmpty then
          fmStockLinkDetail.LoadDoc(0);
        fmStockLinkDetail.DocType := LocalDocType;
        fmStockLinkDetail.CurrentAccount := edtWAccountID;
        fmStockLinkDetail.DefaultTax :=
          TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount
          (edtWAccountID);
        if (LocalDocType in [10, 11, 14, 16]) then
        begin
          Lpaydiscount.Visible := (aPayDiscountItem <> 0);
          EPaymentDiscount.Visible := (aPayDiscountItem <> 0);
        end
        else
        begin
          Lpaydiscount.Visible := (aPayDiscountItemCred <> 0);
          EPaymentDiscount.Visible := (aPayDiscountItemCred <> 0);
        end;
        Lshipment.Visible := aShipcostunittype <> 0;
        cbShipments.Visible := Lshipment.Visible;
        lshipmentAmt.Visible := Lshipment.Visible;
        Eshipment.Visible := Lshipment.Visible;

        if not dmDatabase.tblDocHeader.IsEmpty then
        begin
          fmStockLinkDetail.LoadDoc(dmDatabase.tblDocHeaderWDocID.AsInteger);

          LastDocHeaderId := dmDatabase.tblDocHeaderWDocID.AsInteger;
          DocSelectOptions.InitDoc(LastDocHeaderId, edtWAccountID,
            LocalDocType);
          AccID := dmDatabase.tblDocHeaderWAccountID.Value;
          LastDate := dmDatabase.tblDocHeaderDSysDate.AsDateTime;
          ESExtraDesc.Text := dmDatabase.tblDocHeaderSEXTERNALID.AsString;
          BPutOnAccount.Tag := dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger;
          BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
            DMTCCoreLink.GetTextLang(1990);
          if BPutOnAccount.Tag <> 0 then
            BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
              TDataBaseRoutines.GetAccountCode(BPutOnAccount.Tag);
          // Loading Existing Doc
          dmDatabase.tblDocLine.DisableControls;
          try
            dmDatabase.ZQDocLine.SQL.Text :=
              dmDatabase.SQLList.GetFormatedSQLByName
              ('database_selectdoclineondocid');
            dmDatabase.ZQDocLine.ParamByName('WdocId').AsInteger :=
              dmDatabase.tblDocHeaderWDocID.AsInteger;
            dmDatabase.ZQDocLine.Open;
            AProgress.initProgress('loading...',
              dmDatabase.ZQDocLine.RecordCount);
            if (aPayDiscountItem <> 0) or (aPayDiscountItemCred <> 0) then
              EPaymentDiscount.Text := dmDatabase.tblDocHeader.FieldByName
                ('FPAYMENTDISCOUNT').AsString;
            if aShipcostunittype <> 0 then
              cbShipments.ItemIndex := cbShipments.Items.IndexOfObject
                (TObject(dmDatabase.tblDocHeader.FieldByName('WSHIPSTOCKID')
                .AsInteger));

            while not dmDatabase.ZQDocLine.Eof do
            begin
              AProgress.SetProgress('', dmDatabase.ZQDocLine.RecNo);
              if (dmDatabase.ZQDocLineWLineTypeID.Value = 93) then
              begin
                PaymentDetails.Insert;
                PaymentDetails.Fields[0].AsFloat :=
                  dmDatabase.ZQDocLineFINCLUSIVEAMT.AsFloat;
                PaymentDetails.Fields[1].AsString :=
                  _ReadDescription(dmDatabase.ZQDocLineWDescriptionID.Value);
                PaymentDetails.Fields[2].AsInteger :=
                  dmDatabase.ZQDocLineWACCOUNTID.AsInteger;
                PaymentDetails.post;
                dmDatabase.ZQDocLine.next;
                Continue;
              end;

              if aPayDiscountItem <> 0 then
                if (dmDatabase.ZQDocLineWLineTypeID.AsInteger <> 91) and
                  (dmDatabase.ZQDocLineWSTOCKID.AsInteger =
                  aPayDiscountItem) then
                begin
                  dmDatabase.ZQDocLine.next;
                  Continue;
                end;

              if aPayDiscountItemCred <> 0 then
                if (dmDatabase.ZQDocLineWLineTypeID.AsInteger <> 91) and
                  (dmDatabase.ZQDocLineWSTOCKID.AsInteger =
                  aPayDiscountItemCred) then
                begin
                  dmDatabase.ZQDocLine.next;
                  Continue;
                end;

              if aShipcostunittype <> 0 then
                if (dmDatabase.ZQDocLineWLineTypeID.AsInteger <> 91) and
                  (dmDatabase.ZQDocLineWSTOCKID.AsInteger = dmDatabase.
                  tblDocHeader.FieldByName('WSHIPSTOCKID').AsInteger) then
                begin
                  Eshipment.Text := dmDatabase.ZQDocLineFEXCLUSIVEAMT.AsString;
                  dmDatabase.ZQDocLine.next;
                  Continue;
                end;
              tblBatch.Append;
              tblBatchSDESCRIPTION.Value :=
                _ReadDescription(dmDatabase.ZQDocLineWDescriptionID.Value);
              If (dmDatabase.ZQDocLineWLineTypeID.Value <> 91) then
              begin
                LastStock.WStockID := dmDatabase.ZQDocLineWSTOCKID.AsInteger;
                if ATempStockList.getStockOnid(astockrecpointer,
                  dmDatabase.ZQDocLineWSTOCKID.AsInteger) then
                begin
                  TDataBaseStockRoutines.SyncQty(astockrecpointer^,
                    LocalDocType, LastDocHeaderId);
                end;
                LastStock := astockrecpointer^;
                // StockLoadItem(LastStock) ;
                UpdateStockRecWithPriceForplugin(LastStock,
                  tblBatchFUNITQTY.AsFloat);
                if dmDatabase.ZQDocLine.RecNo = 1 then
                begin
                  if (LastStock.WStockTypeId in CheckStockTypesSet) and
                    (LocalDocType in [10, 12, 14, 15]) then
                  begin
                    ReorderLevel := Round(LastStock.FReorderQty);
                    if (LocalDocType in [10, 14]) then
                      TempQtyOnHand := LastStock.FQtyOnHand -
                        (LastStock.FUnpostedItems +
                        Str2Float(tblBatchSCONTRAACCOUNT.AsString))
                    else
                      TempQtyOnHand := LastStock.FQtyOnHand -
                        (LastStock.FUnpostedItems -
                        Str2Float(tblBatchSCONTRAACCOUNT.AsString));
                    if (ReorderLevel = -1) or
                      not(LastStock.WStockTypeId in CheckStockTypesSet) then
                      self.caption := TmpCaption
                    else
                      self.caption := TmpCaption + ',    ' +
                        FloatToStrF(TempQtyOnHand, ffFixed, 18, 2) + ' ' +
                        GetTextLang(507) + { on hand } '.';
                    StatusBar.Panels[1].Text := self.caption;
                  end;
                end;

                tblBatchWUNITID.AsInteger :=
                  StrToIntDef(dmDatabase.ZQDocLineSUNIT.AsString, 0);
                if (UseMuliplier > 0) and
                  (dmDatabase.ZQDocLine.FindField('FUNITQTY') <> nil) then
                  tblBatchFUNITQTY.AsFloat := dmDatabase.ZQDocLine.FindField
                    ('FUNITQTY').AsFloat
                else if (DMTCCoreLink.ExtraOptions.Values['BUSEDATEFFROMMLTP']
                  <> 'TRUE') then
                  tblBatchFUNITQTY.AsFloat := TDataBaseStockRoutines.GetUnitQty
                    (tblBatchWUNITID.AsInteger)
                else
                begin
                  if (dmDatabase.ZQDocLine.FindField('DDELIVERDATE2') <> nil)
                    and (dmDatabase.ZQDocLine.FindField('DDELIVERDATE') <>
                    nil) then
                  begin
                    if ((dmDatabase.ZQDocLine.FindField('DDELIVERDATE2')
                      .AsDateTime <> 0) and
                      (dmDatabase.ZQDocLine.FindField('DDELIVERDATE').AsDateTime
                      <> 0)) then
                      tblBatchFUNITQTY.AsFloat :=
                        1 + trunc(dmDatabase.ZQDocLine.FindField
                        ('DDELIVERDATE2').AsDateTime) -
                        trunc(dmDatabase.ZQDocLine.FindField('DDELIVERDATE')
                        .AsDateTime)
                    else
                      tblBatchFUNITQTY.AsFloat := 1;
                    tblBatchDDATE.OnChange := tblBatchDatesChange;
                    tblBatchDALLOCATEDDATE.OnChange := tblBatchDatesChange;
                  end;
                end;
                tblBatchSREFERENCE.Value := LastStock.SSTOCKCODE;
                tblBatchSACCOUNT.Value :=
                  FloatToStrF(dmDatabase.ZQDocLineFQtyOrdered.Value, ffFixed,
                  18, dmDatabase.SetOfBooksPropertys.DataParameter.
                  WDataEntryDecQty);
                tblBatchWLINEID.AsInteger :=
                  dmDatabase.ZQDocLineWDOCLINEID.AsInteger;
                tblBatchSCONTRAACCOUNT.Value :=
                  FloatToStrF(dmDatabase.ZQDocLineFQtyShipped.Value, ffFixed,
                  18, dmDatabase.SetOfBooksPropertys.DataParameter.
                  WDataEntryDecQty);
                tblBatchSTAX.ReadOnly := false;
                tblBatchSTAX.Value := dmDatabase.ZQDocLineSMAINACCOUNTCODE.Value
                  + '-' + dmDatabase.ZQDocLineSSUBACCOUNTCODE.Value;
                tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                tblBatchWTAXID.AsInteger :=
                  dmDatabase.ZQDocLineWTAXID.AsInteger;
                tblBatchFDEBIT.Value := dmDatabase.ZQDocLineFSellingPrice.Value;
                tblBatchFTAXAMOUNT.Value :=
                  FixAmount(dmDatabase.ZQDocLineFItemDiscount.Value);
                tblBatchWREPORTINGGROUP1ID.AsInteger :=
                  dmDatabase.ZQDocLineWREPORTINGGROUP1ID.AsInteger;
                tblBatchWREPORTINGGROUP2ID.AsInteger :=
                  dmDatabase.ZQDocLineWREPORTINGGROUP2ID.AsInteger;
                tblBatchWCONTRAACCOUNTID.AsInteger :=
                  dmDatabase.ZQDocLineWACCOUNTID.AsInteger;
                tblBatchWLINKEDID.AsInteger :=
                  dmDatabase.ZQDocLineWSORTNO.AsInteger;

                if dmDatabase.ZQDocLine.FindField('DEXTRADATE1') <> nil then
                  tblBatch.FieldByName('DEXTRADATE1').Value :=
                    dmDatabase.ZQDocLine.FindField('DEXTRADATE1').Value;
                if dmDatabase.ZQDocLine.FindField('DEXTRADATE2') <> nil then
                  tblBatch.FieldByName('DEXTRADATE2').Value :=
                    dmDatabase.ZQDocLine.FindField('DEXTRADATE2').Value;
                if dmDatabase.ZQDocLine.FindField('WFREETYPEID') <> nil then
                begin
                  tblBatch.FieldByName('WFREETYPEID').Value :=
                    dmDatabase.ZQDocLine.FindField('WFREETYPEID').Value;
                  DBFreeLookup.DataSource := dsBatch;
                  DBFreeLookup.DataField := 'WFREETYPEID';
                  tblBatch.FieldByName('WFREETYPEID').OnGetText :=
                    tblBatchWREPORTINGGROUP1IDGetText;
                end;

                if dmDatabase.ZQDocLine.FindField('BCHECKED') <> nil then
                  tblBatchNOTUSED.AsInteger := dmDatabase.ZQDocLine.FindField
                    ('BCHECKED').AsInteger;

                if dmDatabase.ZQDocLine.FindField('DDELIVERDATE') <> nil then
                  if not dmDatabase.ZQDocLine.FindField('DDELIVERDATE')
                    .IsNull then
                    tblBatchDDATE.Value := dmDatabase.ZQDocLine.FindField
                      ('DDELIVERDATE').Value;

                if dmDatabase.ZQDocLine.FindField('DDELIVERDATE2') <> nil then
                  if not dmDatabase.ZQDocLine.FindField('DDELIVERDATE2')
                    .IsNull then
                    tblBatchDALLOCATEDDATE.Value :=
                      dmDatabase.ZQDocLine.FindField('DDELIVERDATE2').Value;
                tblBatchBRECONCILED.Value := 0;
                if (dmDatabase.ZQDocLineWLineTypeID.Value = 94) then
                begin
                  ExclMode := false;
                  tblBatchFCREDIT.Value :=
                    FixAmount(dmDatabase.ZQDocLineFINCLUSIVEAMT.Value,
                    dmDatabase.SetOfBooksPropertys.DataParameter.
                    WDocRowDecimals);
                  tblBatchBEXCLUSIVE.Value := 0;
                end
                else
                begin
                  ExclMode := true;
                  tblBatchBEXCLUSIVE.Value := 1;
                  if TDataBaseRoutines.gettaxrateonId
                    (tblBatchWTAXID.AsInteger) = 2 then
                    tblBatchFCREDIT.Value :=
                      FixAmount(dmDatabase.ZQDocLineFINCLUSIVEAMT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals)
                  else
                    tblBatchFCREDIT.Value :=
                      FixAmount(dmDatabase.ZQDocLineFEXCLUSIVEAMT.Value,
                      dmDatabase.SetOfBooksPropertys.DataParameter.
                      WDocRowDecimals);
                end;
              end
              else // Case Comment Line
              begin
                tblBatchBRECONCILED.Value := 1;
                tblBatchWACCOUNTID.Value :=
                  dmDatabase.ZQDocLineWDescriptionID.Value;
                tblBatchWLINEID.AsInteger :=
                  dmDatabase.ZQDocLineWDOCLINEID.AsInteger;
                tblBatchWLINKEDID.AsInteger :=
                  dmDatabase.ZQDocLineWSORTNO.AsInteger;
              end;
              // tblBatchCalcFields(tblBatch) ;
              tblBatch.post;
              dmDatabase.ZQDocLine.next;
            end;
            SetIncExclBtn;
          finally
            dmDatabase.ZQDocLine.EnableControls;
          end;
          aDMCoreDocData.ZQAccount.close;
          tblBatch.first;
          dmDatabase.ZQDocLine.close;
        end
        else
        // create a new Document
        begin
          AccID := edtWAccountID;
          if PExtra.Visible then
          begin
            if EPaymentDiscount.Visible then
              EPaymentDiscount.Text := DMTCCoreLink.ReadSysParam
                ('LASTDISC' + IntToStr(edtWAccountID), '', 0, 22);
            if cbShipments.Visible then
            begin
              i := DMTCCoreLink.ReadSysParam
                ('LASTSHIP' + IntToStr(edtWAccountID), 0, 0, 22);
              cbShipments.ItemIndex := cbShipments.Items.IndexOfObject
                (TObject(i));
              Eshipment.Text := DMTCCoreLink.ReadSysParam
                ('LASTSAMT' + IntToStr(edtWAccountID), '', 0, 22);
            end;
          end;
          if MessageNewInvoice <> '' then
          begin
            EMessage1.Text := copy(MessageNewInvoice, 1, 35);
            Delete(MessageNewInvoice, 1, 35);
            EMessage2.Text := copy(MessageNewInvoice, 1, 35);
            Delete(MessageNewInvoice, 1, 35);
            EMessage3.Text := copy(MessageNewInvoice, 1, 35);
            Delete(MessageNewInvoice, 1, 35);
            MessageNewInvoice := '';
          end;
          LastDocHeaderId := 0;
          DocSelectOptions.InitDoc(LastDocHeaderId, edtWAccountID,
            LocalDocType);
        end;

        if (LocalDocType in [10, 14]) and
          (dmDatabase.tblDocHeaderBPosted.AsInteger = 0) and
          CheckBackOrder(AccID) then
        begin

          fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
          try
            fmBackOrdersOutstanding.vWAccountID := AccID;
            fmBackOrdersOutstanding.ZQBackorder.SQL.Text :=
              'Select * from BACKORD where WAccountID = :AccId';
            fmBackOrdersOutstanding.ZQBackorder.Params[0].AsInteger := AccID;
            fmBackOrdersOutstanding.ZQBackorder.Open;

            if (fmBackOrdersOutstanding.HasSomethingToDeliver) or
              (DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True') then
            begin
              AProgress.Hide;
              fmBackOrdersOutstanding.ShowModal;
              OK := fmBackOrdersOutstanding.MDResult;
              if OK then
                with fmBackOrdersOutstanding do
                begin // Generate BacOrder Items
                  tblBatchFDEBIT.ReadOnly := false;
                  tblBatchFCREDIT.ReadOnly := false;
                  ZQBackorder.Params[0].AsInteger := AccID;
                  ZQBackorder.Filtered := false;
                  ZQBackorder.filter := 'BSelected=1';
                  ZQBackorder.Filtered := true;
                  ZQBackorder.first;
                  while not ZQBackorder.Eof do
                  begin
                    if ZQBackorderSSOURCE.AsString <> '' then
                    begin
                      if EMessage1.Text = '' then
                        EMessage1.Text := ZQBackorderSSOURCE.AsString
                      else if EMessage1.Text <> ZQBackorderSSOURCE.AsString then
                      begin
                        if EMessage2.Text = '' then
                          EMessage2.Text := ZQBackorderSSOURCE.AsString
                        else if EMessage2.Text <>
                          ZQBackorderSSOURCE.AsString then
                        begin
                          EMessage3.Text := ZQBackorderSSOURCE.AsString
                        end;
                      end;
                    end;
                    LastStock.WStockID := ZQBackorderWStockID.Value;
                    StockLoadItem(LastStock);
                    UpdateStockRecWithPriceForplugin(LastStock, 1);
                    tblBatch.Append;
                    tblBatchWUNITID.AsInteger := ZQBackorderWUNITID.AsInteger;
                    tblBatchFUNITQTY.AsFloat :=
                      TDataBaseStockRoutines.GetUnitQty
                      (tblBatchWUNITID.AsInteger);
                    tblBatchSACCOUNT.AsString := ZQBackorderFQty.AsString;
                    tblBatchSCONTRAACCOUNT.AsString :=
                      tblBatchSACCOUNT.AsString;
                    tblBatchSREFERENCE.Value := LastStock.SSTOCKCODE;
                    tblBatchSDESCRIPTION.Value := LastStock.SDescription;
                      tblBatchFDEBIT.Value := FixAmount(ZQBackorderFSellingPrice.AsFloat ,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
              tblBatchFCREDIT.Value :=FixAmount(ZQBackorderFPRICE.AsFloat,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);

              tblBatchFTAXAMOUNT.Value :=
                FixAmount(ZQBackorderFDISCOUNT.AsFloat);


                    tblBatchFTAXAMOUNT.Value := ZQBackorderFDISCOUNT.AsFloat;
                    tblBatchWTAXID.AsInteger :=
                      TDatabaseDebtorCreditorRoutines.
                      GetDefaultTaxIDOnAccount(AccID);
                    if tblBatchWTAXID.AsInteger = 0 then
                      tblBatchWTAXID.AsInteger := LastStock.WOutputTaxID;
                    tblBatchSTAX.ReadOnly := false;
                    tblBatchSTAX.Value := AddDashInAccCodeNoPRefix
                      (TDataBaseRoutines.GetAccountCode
                      (tblBatchWTAXID.AsInteger));
                    tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                    // tblBatchCalcFields(tblBatch) ;
                    tblBatch.post;
                    ZQBackorder.next;
                  end;
                  ZQBackorder.first;
                  while not ZQBackorder.Eof do
                    ZQBackorder.Delete;

                  ZQBackorder.Filtered := false;
                  ZQBackorder.filter := '';
                  tbBackorder.Visible := not ZQBackorder.IsEmpty;
                  ZQBackorder.close;
                end;
            end;
          finally
            FreeAndNil(fmBackOrdersOutstanding);
          end;
        end;
        CreditLimit := Diff;
        ToTalAccount := TotalAcc;
        tblBatch.Open;
        if edtOrderNumber.CanFocus then
          edtOrderNumber.SetFocus;

        { Reporting groups 1-2 }
        CbxRepGroup1.ItemIndex := CbxRepGroup1.Items.IndexOfObject
          (TObject(dmDatabase.tblDocHeaderWReportingGroup1ID.AsInteger));
        CbxRepGroup2.ItemIndex := CbxRepGroup2.Items.IndexOfObject
          (TObject(dmDatabase.tblDocHeaderWReportingGroup2ID.AsInteger));
        cbCurrency.ItemIndex := 0;
        cbRate.Text := '1';
        if dmDatabase.tblDocHeaderWCURRENCYID.AsInteger <> 0 then
        begin
          cbCurrency.ItemIndex := cbCurrency.Items.IndexOfObject
            (TObject(dmDatabase.tblDocHeaderWCURRENCYID.AsInteger));

          cbRate.Text := dmDatabase.tblDocHeaderFCURRENCYRATE.AsString;
        end;

        dmDatabase.tblDocHeader.close;
        // done : Pieter Forcing translation
        SetupGridLayout;
        // done : Pieter labels do not update sometimes
      finally
        tblBatch.EnableControls;
      end;
      if AExternalForm <> nil then
      begin
        AExternalSendString := 'OPENDOC=' + IntToStr(LastDocHeaderId) + #13 +
          #10 + GetPluginLineString(false);
        AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
          pchar(AExternalSendString));
      end;
      MyLocBatSerInput.InitData(LastDocHeaderId, LocalDocType);
      CheckPlugins('INIT=' + IntToStr(LastDocHeaderId) + #10 + #13 +
        'ACCOUNTID=' + IntToStr(edtWAccountID) + #10 + #13 + 'TYPEID=' +
        IntToStr(LocalDocType));
      SendMessageToPlugin('INIT=' + IntToStr(LastDocHeaderId) + #10 + #13 +
        'ACCOUNTID=' + IntToStr(edtWAccountID) + #10 + #13 + 'TYPEID=' +
        IntToStr(LocalDocType));
      SendMessageToPlugin('EDIT=' + IntToStr(LastDocHeaderId));

      CbxRepGroup1.ShowHint := true;
      CbxRepGroup1.Hint := TDataBaseDocumentRoutines.GetGroupHistoryText(22,
        LastDocHeaderId);
      CbxRepGroup2.ShowHint := true;
      CbxRepGroup2.Hint := TDataBaseDocumentRoutines.GetGroupHistoryText(23,
        LastDocHeaderId);

      if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 5 then
      begin
        DMTCCoreLink.LogAction('DOCVIEW', LastDocHeaderId, 'Document view!');
      end;

    finally
      AProgress.free;
    end;
    tblBatch.Open;
    tblBatch.first;
  finally
    LoadingGridData := false;
    tblBatch.EnableControls;
  end;
  UpdateTotalsLbls;
  UpDateLabels;
  if EditStockPrices and (LocalDocType in [12, 13, 15, 17]) then
  begin
    SetStockEditPrice;
  end;
  Gridinpatch := false;

  fmDocLinks.DocID := LastDocHeaderId;

end;

procedure TfmInvoiceEntryGrid.PriceListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FormKeyDown(Sender, Key, Shift);
  Case Key of
    37:
      begin
        cxGrid1.SetFocus;
        Key := 0;
        cxGrid1DBTableView1.Controller.FocusedColumnindex :=
          cxGrid1DBTableView1.Controller.FocusedColumnindex - 1;
      end;
    39:
      begin
        cxGrid1.SetFocus;
        Key := 0;
        cxGrid1DBTableView1.Controller.FocusedColumnindex :=
          cxGrid1DBTableView1.Controller.FocusedColumnindex + 1;
      end;
    { 39, } 13:
      begin
        PriceListDblClick(Sender);
        Key := 0;
        cxGrid1DBTableView1.Controller.FocusedColumnindex :=
          cxGrid1DBTableView1.Controller.FocusedColumnindex + 1;
      end;
  else

  end;
end;

procedure TfmInvoiceEntryGrid.PriceListKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key >= '0') AND (Key <= '9')) or (Key = '-') then
  begin
    PriceList.Visible := false;
    cxGrid1.SetFocus;
    cxGrid1.Perform(Wm_Char, ord(Key), 1);
    Key := #0;
  end;

end;

Procedure TfmInvoiceEntryGrid.SetupGridLayout;
begin
  if not CanSetupGridLayout then
    exit;
  if FindIndexOfName(tblBatchSREFERENCE.FieldName) = -1 then
    exit;

  cxGrid1DBTableView1SREFERENCE.caption := GetTextLang(652);
  cxGrid1DBTableView1SDESCRIPTION.caption := GetTextLang(178);
  cxGrid1DBTableView1SACCOUNT.Options.Editing := true;
  if (LocalDocType <> 10) or (STKNoBackOrder) then
  begin
    cxGrid1DBTableView1SCONTRAACCOUNT.caption := GetTextLang(413);
    cxGrid1DBTableView1STAX.caption := GetTextLang(609);
    cxGrid1DBTableView1FDEBIT.caption := GetTextLang(648);
    cxGrid1DBTableView1FTAXAMOUNT.caption := GetTextLang(657);
    cxGrid1DBTableView1FCREDIT.caption := GetTextLang(650);
  end
  else
  begin
    cxGrid1DBTableView1SCONTRAACCOUNT.caption := GetTextLang(656);
    cxGrid1DBTableView1STAX.caption := GetTextLang(609);
    cxGrid1DBTableView1FDEBIT.caption := GetTextLang(648);
    cxGrid1DBTableView1FTAXAMOUNT.caption := GetTextLang(657);
    cxGrid1DBTableView1FCREDIT.caption := GetTextLang(650);
  end;
  if self.Visible then
  begin
    tblBatchRefTotals.Open;
    tblBatchFDEBIT.ReadOnly := false;
    tblBatchFCREDIT.ReadOnly := false;
  end;
  SetIncExclBtn;

end;

procedure TfmInvoiceEntryGrid.CheckPlugins(SExtraMessage: String);
var
  i, X: Integer;
  ReturnName: Array [0 .. 1025] of Char;
  ArrayImageIndex: array [0 .. 9] of Integer;
  strDoctype: String;
  APChar: pchar;
  IsEnable: Boolean;
  ImageIndex: Integer;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
  begin
    if Assigned(AFormPluginRecordArray[i].AForm) then
    begin
      APChar := ReturnName;
      strDoctype := 'DOCTYPE=' + IntToStr(LocalDocType);
      if SExtraMessage <> '' then
        strDoctype := strDoctype + #10 + #13 + SExtraMessage;
      AFormPluginRecordArray[i].aPluginEnabled(pchar(strDoctype), APChar,
        ImageIndex);
      IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
      ArrayImageIndex[i] := ImageIndex;
    end
    else
    begin
      IsEnable := true;
      ArrayImageIndex[i] := 25;
    end;
    for X := 0 to self.Componentcount - 1 do
      if self.components[X].Tag <> 0 then
        if (self.components[X].Tag = Integer(AFormPluginRecordArray[i]
          .AForm)) then
        begin
          if (self.components[X] is TMenuItem) then
          begin
            TMenuItem(self.components[X]).Visible := IsEnable;
            TMenuItem(self.components[X]).ImageIndex := ArrayImageIndex[i];
          end;
        end;
  end;
end;

procedure TfmInvoiceEntryGrid.cbDocTypenewChange(Sender: TObject);
var
  Sort: String;
begin
  if cbDocTypenew.Items.Count = 0 then
    exit;
  case Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]) of
    10:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditInvoice(currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    11:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditCreditNote(currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    12:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditPurchase(currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    13:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditStockReturns
          (currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    17:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditStockReturns
          (currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    16:
      begin
        if not TDatabaseUserRoutines.GetUserCanEditCreditNote(currentuser) then
        begin
          if cbDocTypenew.ItemIndex <> cbDocTypenew.Items.IndexOfObject
            (TObject(LocalDocType)) then
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(LocalDocType))
          else
            cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
              (TObject(14));
          raise Exception.Create(DMTCCoreLink.GetTextLang(3065)
            { 'No user rights!' } );
        end;
      end;
    1000:
      begin
        // 1000 = project quote
      end;
  end;
  if cbDocTypenew.ItemIndex <> -1 then
    DMTCCoreLink.LoadIconImage(self.Icon,
      'Button' + IntToStr(Integer(cbDocTypenew.Items.Objects
      [cbDocTypenew.ItemIndex])));
  SaveFilter;
  if cbDocTypenew.ItemIndex <> -1 then
    idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  if idDocType < 10 then
    idDocType := 10;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);
  LoadFilter;
  CheckPlugins('');
  CBDocLayout2.ItemIndex := CBDocLayout2.Items.IndexOf
    (TDataBaseRoutines.GetRepName(LocalDocType, false));
  // done : Pieter update captions
  RefreshAccountType;
  DoDropDownLookup;
  RefreschDocumentList(-1);
end;

procedure TfmInvoiceEntryGrid.PriceListDblClick(Sender: TObject);
begin
  PriceList.Visible := false;
  cxGrid1.SetFocus;
end;

procedure TfmInvoiceEntryGrid.cbDestinationChange(Sender: TObject);
begin
  if cbDestination.ItemIndex = 1 then
  begin
    lblCopies.Visible := true;
    edtCount.Visible := true;
    UpDown1.Visible := true;
  end
  else
  begin
    lblCopies.Visible := false;
    edtCount.Visible := false;
    UpDown1.Visible := false;
  end;
end;

procedure TfmInvoiceEntryGrid.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  edtCount.Text := IntToStr(UpDown1.Position);
  PrnVars.NumCopies := UpDown1.Position;
end;

procedure TfmInvoiceEntryGrid.BitSetPrintClick(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
  edtCount.Text := IntToStr(PrnVars.NumCopies);
end;

procedure TfmInvoiceEntryGrid.bLabelPrintClick(Sender: TObject);
var
 Docname,Clause,PrintQty : String ;
begin
   Docname := 'reports\reports\STOCK\barcode' ;
   if not FileExists(DMTCCoreLink.GetLocalPluginDir + Docname +'.rep' ) then
   Docname := 'reports\reports\STOCK\LANG_1774'    ;
   PrintQty := InputBox('Print quantity','Enter a print quantity','1' ) ;

   if FileExists(DMTCCoreLink.GetLocalPluginDir + Docname +'.rep' ) then
     Docname := DMTCCoreLink.GetLocalPluginDir + Docname else
     Docname :=  ExtractFilePath(Application.ExeName) + 'plug-ins\' + Docname ;
     Clause := 'stock.WStockid = ' + IntToStr(LastStock.WStockID) ;
     if FileExists(  Docname +'.rep' ) then
         PrintReport(Docname+'.rep','SQL=' +Clause+ #13+#10 + 'QTYTOPRINT='+IntToStr(StrToIntDef(PrintQty,1)));
end;

procedure TfmInvoiceEntryGrid.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, true, true);
    Key := #0;
  end;
end;

procedure TfmInvoiceEntryGrid.edtCountChange(Sender: TObject);
Var
  Nb: Integer;
begin
  Nb := Abs(StrToInt(edtCount.Text));
  if Nb < 0 then
    Nb := 1;
  UpDown1.Position := Nb;
  PrnVars.NumCopies := Nb;
end;

procedure TfmInvoiceEntryGrid.BtnOkPrintClick(Sender: TObject);
var
  OkToPrnt: Boolean;
begin
  BtnOkPrint.Enabled := false;
  try
    if Assigned(anewlocallook) and anewlocallook.Visible then
    begin
      PnlDocHeader.Visible := true;
      Panel9.Visible := true;
      anewlocallook.Hide;
      PMAinData.Height := 238;
      Thideshowitems.caption := DMTCCoreLink.GetTextLang(3309);
    end;

    if (InGrid = true) and (Sender <> nil) then
    begin
      InGrid := false;
      cxGrid1.SetFocus;
      exit;
    end;
    //
    if edtOrderNumber.CanFocus then
      edtOrderNumber.SetFocus;
    ATempStockList.clear;
    LastStock := DummyLastStock;
    // can raise silent abort.
    PnlComment.Visible := false;
    dtpDateExit(self);
    AllOk := false;
    FirstTime := false;
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
    OkToPrnt := false;
    // done : Pieter Debug can handel message
    if Sender <> nil then
    begin
      if not dmDatabase.SetOfBooksPropertys.DataParameter.NoPrintMessage then
        Case LocalDocType of
          11:
            if OSFMessageDlg(GetTextLang(673)
              { Do you wish to print this Credit Note now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
          12:
            if OSFMessageDlg(GetTextLang(709)
              { Do you wish to print this  now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
          13:
            if OSFMessageDlg(GetTextLang(708)
              { Do you wish to print this  now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
          14:
            if OSFMessageDlg(GetTextLang(710)
              { Do you wish to print this  now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
          15:
            if OSFMessageDlg(GetTextLang(707)
              { Do you wish to print this now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
          10:
            if OSFMessageDlg(GetTextLang(505)
              { Do you wish to print this invoice now ? } , mtConfirmation,
              [mbYes, mbNo], 0) = mryes then
              OkToPrnt := true;
        end;
    end;
    // we need to save the invoice first.
    ExitDocLinesScr(Sender);
    if BForceSpecialRecalc then
      if (LocalDocType in [10, 14]) then
        if OSFMessageDlg('Recalculate this document?', mtConfirmation,
          [mbYes, mbNo], 0) = mryes then
          ReaplayITemsDicountsClick(nil);
    NBDocuments.PageIndex := 0;
    if OkToPrnt then
    begin
      RefreschDocumentList(LastDocHeaderId, true);
      BPrintClick(self);
    end;
    if AddInvoiceForAccount <> 0 then
    begin
      ModalResult := mrok;
      AddInvoiceForAccount := 0;
      if Assigned(FOnModalResultEvent) then
        FOnModalResultEvent(self);
      exit;
    end;
    if not OkToPrnt then
      RefreschDocumentList(LastDocHeaderId);

    self.caption := GetTextLang(928);
    StatusBar.Panels[1].Text := GetTextLang(928);
    StatusBar.Panels[0].Text := '';
    if ShowHintForLine then
    begin
      self.ShowHint := true;
      Application.HintPause := 0;
      // Application.ShowHint := True;
      QDocHeadAfterScroll(QDocHead);
    end;
    FormResize(self);
  finally
    BtnOkPrint.Enabled := true;
  end;
end;

Procedure TfmInvoiceEntryGrid.ShowDebtorSetings;
{ Debtor table has to be opened }
begin
  DebtDiscount := aDMCoreDocData.ZQDebtorFDISCOUNT.Value;
  IntSellingPrice :=
    Str2Int(aDMCoreDocData.ZQDebtorWDefaultPriceTypeID.AsString);
  if IntSellingPrice = 0 then
    IntSellingPrice := 1;
  if DebtDiscount = 0 then
    StatusBar.Panels[1].Text := ''
  else
    StatusBar.Panels[1].Text := DMTCCoreLink.GetTextLangNoAmp(1711) + ' ' +
      FloatToStr(DebtDiscount) + '%';
  // StatusBar.Panels[0].text := PriceList.Strings.Names[IntSellingPrice-1];
  GlobalDiscount := dmDatabase.tblDocHeaderFInvoiceDiscount.Value;
end;

procedure TfmInvoiceEntryGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  NBDocuments.PageIndex := 0;
  MyLocBatSerInput.cancelPost;
  dmDatabase.tblStock.filter := '';
  dmDatabase.tblDocLine.close;
  dmDatabase.tblDocHeader.close;
  dmDatabase.tblDocHeader.Filtered := false;
  dmDatabase.tblDocHeader.filter := '';
  dmDatabase.tblDocLine.Filtered := false;
  dmDatabase.tblDocLine.filter := '';
  if self.parent = nil then
    TDatabaseRegistyRoutines.WriteFormPos(self, GetSaveListPRefix);

  // SaveGridToRegistry(DBGSearch,GetSaveListPRefix);
  SaveFilter;
end;

Procedure TfmInvoiceEntryGrid.SetHideDetails;
begin
  if not IsHeaderScr then
  begin
    // done : Pieter use global routine
    ExitDocLinesScr(self);
  end;
end;

Procedure TfmInvoiceEntryGrid.SetOldPanel2(Value: Boolean);
begin

end;

procedure TfmInvoiceEntryGrid.PriceListSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if tblBatch.Active and PriceList.Visible And (not tblBatch.IsEmpty) then
    if tblBatchFDEBIT.AsString <> PriceList.Cells[1, ARow] then
    begin
      tblBatch.Edit;
      tblBatchFDEBIT.AsString := PriceList.Cells[1, ARow];
      tblBatchFCREDIT.AsFloat :=
        (tblBatchFDEBIT.AsFloat * tblBatchSCONTRAACCOUNT.AsFloat) -
        ((tblBatchFDEBIT.AsFloat * tblBatchSCONTRAACCOUNT.AsFloat) *
        (tblBatchFTAXAMOUNT.AsFloat / 100));
      UpdateTotalsLbls;
    end;
end;

Procedure TfmInvoiceEntryGrid.SetIncExclBtn;
begin

  if ExclMode then
  begin
    tlbtnExclIncl.Down := true;
    tlbtnIncl.Down := false;
  end
  else
  begin
    tlbtnIncl.Down := true;
    tlbtnExclIncl.Down := false;
  end;
end;

procedure TfmInvoiceEntryGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LastShift := Shift;
  if NBDocuments.PageIndex = 1 then
  begin
    if Key = vk_right then
      if cxGrid1DBTableView1.Controller.FocusedColumnindex =
        cxGrid1DBTableView1.VisibleItemCount - 1 then
      begin
        tblBatch.next;
        cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
        Key := 0;
      end;
    if Key = vk_left then
      if cxGrid1DBTableView1.Controller.FocusedColumnindex = 0 then
      begin
        tblBatch.Prior;
        cxGrid1DBTableView1.Controller.FocusedColumnindex :=
          cxGrid1DBTableView1.VisibleItemCount - 1;
        Key := 0;
      end;
  end;
  if Key = 112 then
  begin
    Case LocalDocType of
      11:
        HtmlShowTopic(155);
      12:
        HtmlShowTopic(159);
      13:
        HtmlShowTopic(156);
      14:
        HtmlShowTopic(160);
      15:
        HtmlShowTopic(158);
    else
      HtmlShowTopic(157);
    end;
    Key := 0;
  end;
  if Key = 45 then
    if NBDocuments.PageIndex = 0 then
      BNewClick(self);
  // actions for esc
  if Key = 27 then
  begin
    if cbDocTypenew.Focused then
    begin
      if not Assigned(self.parent) then
        close
    end
    else if cxlist.Focused then
      BFilter.SetFocus
    else if BFilter.Focused then
      EFilterValue.SetFocus
    else if EFilterValue.Focused then
      cbDocTypenew.SetFocus
    else if NBDocuments.PageIndex = 0 then
      cxlist.SetFocus;
  end;
end;

procedure TfmInvoiceEntryGrid.edtDiscountExit(Sender: TObject);
Var
  ASaveCall: TSaveClientDatasetCall;
  MultiPlier: Double;
begin
  tblBatch.DisableControls ;
try


  if pnlDiscount.Visible then
  begin
    if StrToFloat(edtDiscount.Text) < 0 then
    begin
      OSFMessageDlg(GetTextLang(509), mtError, [mbok], 0);
      edtDiscount.SetFocus;
    end
    else
    begin
      if StrToFloat(edtDiscount.Text) > 100 then
        edtDiscount.Text := '100';
      GlobalDiscount := StrToFloat(edtDiscount.Text);

        tblBatch.first;
        while not tblBatch.Eof do
        begin
          if not(tblBatchBRECONCILED.AsInteger = 1) then
          begin
            LastStock.SSTOCKCODE := tblBatchSREFERENCE.AsString;
            StockLoadItemOnCode(LastStock);

            MultiPlier := tblBatchFUNITQTY.AsFloat;
            UpdateStockRecWithPriceForplugin(LastStock, MultiPlier);
            if (LastStock.FDiscount = 0) and (LastStock.BApplyDiscount) then
            begin
              tblBatch.Edit;
              tblBatchFCREDIT.Value :=
                FixAmount(((Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
                tblBatchFDEBIT.AsFloat) -
                ((Str2Float(tblBatchSCONTRAACCOUNT.AsString) *
                tblBatchFDEBIT.AsFloat) * (GlobalDiscount / 100)),
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
              tblBatchFTAXAMOUNT.AsFloat := GlobalDiscount;
              tblBatch.post;
            end;

          end;
          tblBatch.next;
        end;

      pnlDiscount.Visible := false;
    end;
  end;
  finally
   tblBatch.EnableControls ;
  end;
  cxGrid1DBTableView1.DataController.Refresh ;
  UpdateTotalsLbls;
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LastShift := Shift;
  if LastDocPosted then
  begin
    Key := 0;
    exit;
  end;

  if Key = 115 then
  begin
    fmMain.ToolsCalculatorClick(Sender);
    Key := 0;
  end;
  if Key = 118 then // F7
  begin
    tlbtnExclInclClick(Sender);
    Key := 0;
  end;
  if Key = 119 then // F8
  begin
    tlbtnDiscClick(Sender);
    Key := 0;
  end;
  if Key = 120 then // F9:
  begin
    tlbtnCommentClick(Sender);
    Key := 0;
  end;
  if Key = 121 then // F10
  begin
    tlbtnDeleteInvClick(Sender);
    Key := 0;
  end;
  if Key = 122 then // F11:
  begin
    TlbtnCopyClick(Sender);
    Key := 0;
  end;

end;

procedure TfmInvoiceEntryGrid.pnlDocLinesExit(Sender: TObject);
begin
  PriceList.Visible := false;
end;

procedure TfmInvoiceEntryGrid.DoclineTranslate;
begin
  if FindIndexOfName(tblBatchSREFERENCE.FieldName) = -1 then
    exit;
  cxGrid1DBTableView1SREFERENCE.caption := GetTextLang(1832); // Item No
  cxGrid1DBTableView1SDESCRIPTION.caption := GetTextLang(1860); // Description
  cxGrid1DBTableView1SACCOUNT.caption := GetTextLang(1861); // Order
  cxGrid1DBTableView1SCONTRAACCOUNT.caption := GetTextLang(1862); // Ship
  cxGrid1DBTableView1STAX.caption := GetTextLang(1863); // Tax
  cxGrid1DBTableView1FDEBIT.caption := GetTextLang(1864); // Excl Amt
  cxGrid1DBTableView1FTAXAMOUNT.caption := GetTextLang(1865); // Disc %
  cxGrid1DBTableView1FCREDIT.caption := GetTextLang(1864); // Incl Amt
  UpDateLabels;

  cxGrid1DBTableView1WREPORTINGGROUP1ID.caption :=
    TDataBaseRoutines.GetTypeDescription(1002); // type desc
  cxGrid1DBTableView1WREPORTINGGROUP2ID.caption :=
    TDataBaseRoutines.GetTypeDescription(1003); // type desc
  TcxLookupComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP1ID.Properties)
    .ListColumns[0].caption := cxGrid1DBTableView1WREPORTINGGROUP1ID.caption;
  TcxLookupComboBoxProperties(cxGrid1DBTableView1WREPORTINGGROUP2ID.Properties)
    .ListColumns[0].caption := cxGrid1DBTableView1WREPORTINGGROUP2ID.caption;

  cxGrid1DBTableView1WUNITID.caption := GetTextLang(214); // unit

end;

procedure TfmInvoiceEntryGrid.FormCreate(Sender: TObject);
var
  i: Integer;
  AFloatField: TFloatField;
begin
  cxlistDBTable.Styles.StyleSheet :=
    dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard;
  GoToLineID := -1;
  LProject.Visible := DMTCCoreLink.ReadNwReportOp('cbProjects', false);
  cbProject.Visible := LProject.Visible;
   LimitLayouts := ReadLongSysparam('LIMITLAYOUT',DMTCCoreLink.currentuser);
  LinkToList := TStringList.Create;
  { DMTCCoreLink.LoadImage(BNew.Glyph,'nbsinsert');
    DMTCCoreLink.LoadImage(BDelete.Glyph,'nbsdelete');
    DMTCCoreLink.LoadImage(BEdit.Glyph,'nbsedit'); }
  LocalDocType := idDocType;
  Link1.Visible := DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True';
  URLPayment1.Visible := DMTCCoreLink.ReadLongReportOp('URLPAYMENT') <> '';
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  PopupMenu2.Images := dmOsfResource.MenuImages;
  PopupMenu1.Images := dmOsfResource.MenuImages;
  fmStockLinkDetail := TStockLinkDetail.Create(Application);
  fmDocLinks := TfmDocLinks.Create(self);
  ASearchPanel := TSearchPanel.Create(self);

  TDataBaseStringRoutines.FillStringListWithSelect(cbCurrency.Items,
    'Select WCURRENCYID , SDESCRIPTION from CURRENCY order by WCURRENCYID', 0);

  if cbCurrency.Items.Count < 2 then
    pCurrency.Visible := false;
  CustomGetSuppCodeSql := DMTCCoreLink.SQLList.GetFormatedSQLByName
    ('CUST_GETSUPCODE');

  ATempStockList := TStockRecList.Create;
  aAccountRecList := TAccountRecList.Create;
  cxGrid1.Align := alNone;
  ShowSpecialAccount := DMTCCoreLink.ReadNwReportOp('OPENAPIPLUGIN', false);
  UsePricePlugin := DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN', false);
  BPriceAgreeUseOrgPrice := DMTCCoreLink.ReadSysParam('PRICEAGREE_CALCDISC',
    false, 0);
  EditStockPrices := DMTCCoreLink.ReadNwReportOp('EDITSTOCKPRICE', false);
  UseMuliplier := 0;

  BForceSpecialRecalc := DMTCCoreLink.ReadSysParam('FORCESPECIALRECALC',
    false, 0);

  if DMTCCoreLink.ReadNwReportOp('BUSEMUTLIPIER', false) then
    UseMuliplier := 1;
  if DMTCCoreLink.ReadNwReportOp('BUSEDIVIDER', false) then
    UseMuliplier := 2;

  ShowStkGrosscost := DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCT', false, 0);
  ShowStkGrosscost := DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCT',
    ShowStkGrosscost, currentuser);
  ShowGrossAsCostprice := DMTCCoreLink.ReadSysParam('INVDOCSHOWGROSSCP',
    false, 0);
  UseUnitQty := DMTCCoreLink.ReadSysParam('INVUNITQTY', false, 0);
  UseUnitQtyForSale := DMTCCoreLink.ReadSysParam('INVUNITQTYSALE', false, 0);
  BuseMarginRule := DMTCCoreLink.ReadSysParam('USEMARGINRULE', false, 0);
  tblBatch.TableName := 'DOCBATCH_' + IntToStr(currentuser) + '_' +
    IntToStr(currentuser);
  PEXtraData.Visible := DMTCCoreLink.ReadSysParam('INVPUR_EXTRA', false, 0);
  BRemFinder.Visible :=
    (DMTCCoreLink.SQLList.SQLCollection.GetItemByName
    ('CUST_FREEDESCLOOKUPRESULT') <> nil) and
    (DMTCCoreLink.SQLList.SQLCollection.GetItemByName
    ('CUST_FREEDESCLOOKUPTYPE') <> nil);
  BRemFinder.caption := DMTCCoreLink.GetTextLangNoAmp(854);
  if ShowStkGrosscost then
  begin
    AFloatField := TFloatField.Create(self);
    AFloatField.FieldKind := fkCalculated;
    AFloatField.FieldName := 'FCOST';
    AFloatField.DataSet := tblBatch;
    AFloatField.DisplayFormat := '0.00';

    AFloatField.Name := tblBatch.Name + AFloatField.FieldName;
    tblBatch.FieldDefs.UpDate;
  end;
  CheckStockTypesSet := [0, 7, 9];

  if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
    CheckStockTypesSet := CheckStockTypesSet + [1];

  MyLocBatSerInput := TLocBatSerInput.Create(self);
  cxGrid1DBTableView1STAX.Options.Editing := not DMTCCoreLink.ReadSysParam
    ('INV_TAXREADONLY', false, DMTCCoreLink.currentuser);

  if UPPERCASE(TDatabaseRegistyRoutines.ReadOsfIni('settings', 'smallicons', '')
    ) = 'TRUE' then
  begin
    for i := 0 to Panel4.ControlCount - 1 do
      Panel4.Controls[i].Width := 90;
    cbDocTypenew.Width := 90;
    Panel2.Width := 100;
  end;
  APluginsFormsList := TStringList.Create;
  PaymentDetails := TVirtualTable.Create(self);
  PaymentDetails.FieldDefs.Add('Amount', ftFloat);
  PaymentDetails.FieldDefs.Add('AccName', ftString, DMTCCoreLink.MessageLength);
  PaymentDetails.FieldDefs.Add('AccNr', ftInteger);
  PaymentDetails.Open;
  DocSelectOptions := TDocSelectOptions.Create(self);
  fmInvocePayment := TfmInvocePayment.Create(self);
  aDMCoreDocData := TDMCoreDocData.Create(self);

  LikeSeach := ReadSysParam('LikeSearchForStrings', false, currentuser)
    .AsBoolean;
  NBDocuments.PageIndex := 0;
  ASaveList := TSaveClientDatasetCallList.Create;
  ASaveList.AddclientObject(dmDatabase.tblStock, false);
  ASaveList.AddclientObject(dmDatabase.tblSysVars, false);
  ASaveList.AddclientObject(dmDatabase.tblDocLine, false);
  ASaveList.AddclientObject(dmDatabase.tblDocHeader, false);
  ASaveList.AddclientObject(dmDatabase.tblUser, false);
  ASaveList.AddclientObject(dmDatabase.tblSysParams, false);
  ASaveList.AddclientObject(dmDatabase.tblOpReport, false);
  FillFreeReportLayoutBox(CBDocLayout.Items);
  if LimitLayouts <> '' then

   for I := CBDocLayout.Items.Count -1 downto 0 do
      if not (pos(CBDocLayout.Items[i],LimitLayouts) > 0)  then
          CBDocLayout.Items.Delete(i);

  CBDocLayout2.Items.Assign( CBDocLayout.Items);
  QDocHeadSREFERENCE.Size := DocReferenceLength;
  CBDocLayout2.Items.Insert(0, '');
  CBDocLayout2.ItemIndex := 0;
  CBDocLayout.Items.Insert(0, GetTextLang(1341));
  CBDocLayout.ItemIndex := 0;
  aLedgerPeriodeCollection := TLedgerPeriodeCollection.Create(self,
    TLedgerPeriodeItem);
  ReadLedgerPeriodes(aLedgerPeriodeCollection);

  // done : Pieter set taxammount format to %
  tblBatchFTAXAMOUNT.DisplayFormat := '% ##0.####';
  // done : Pieter so we cansee the other controls at designtime but runtime its ok
  pnlDocLines.Align := alClient;
  QDocHead.Connection := dmDatabase.ZMainconnection;
  self.caption := GetTextLang(587); // Caption 587
  StatusBar.Panels[1].Text := self.caption;
  Thideshowitems.caption := GetTextLang(3282);
  tbPlugins.caption := GetTextLang(3282);

  tlbtnDelete.caption := GetTextLang(367); // Btn ^D Delete
  tlbtnInsert.caption := GetTextLang(368); // Btn ^N Insert
  tlbtnExclIncl.caption := GetTextLang(371); // Btn F7 ExclIncl
  tlbtnDisc.caption := GetTextLang(658); // Btn F8 Discount
  tlbtnComment.caption := GetTextLang(659); // Btn F9 Comment
  tlbtnDeleteInv.caption := GetTextLang(660); // Btn F10 Delete All
  TlbtnCopy.caption := GetTextLang(867); // Btn F11 Copy
  Label3.caption := GetTextLang(663); // Enter overall discount
  Label6.caption := GetTextLang(662); // &Comment Line Invoice
  BtnCancel.caption := GetTextLang(168); // Btn Cancel
  BtnOk.caption := GetTextLang(167); // Btn Ok
  // blPrnType.Caption := GetTextLang(323); //lblPrnType
  Label20.caption := GetTextLang(1910);
  lblPrnType.caption := GetTextLang(1910) + ' 2';
  lblRep1.caption := GetTextLang(179); // Rep Group1 179
  Label14.caption := GetTextLang(235); // Postal Address 235
  Label16.caption := GetTextLang(194); // Current Balance 194
  Label18.caption := GetTextLang(236); // Available 236
  Label17.caption := GetTextLang(192); // Credit Limit 192
  LStdDiscount.caption := GetTextLang(3429); //

  Label3i.caption := GetTextLang(198); // Salesman 198
  Label12.caption := GetTextLang(237); // Your Reference No 237
  Label13.caption := GetTextLang(238); // Date 238
  lblRep2.caption := GetTextLang(180); // Rep Group2 180
  Label15.caption := GetTextLang(199); // Delivery Address 199
  Label19.caption := GetTextLang(239); // Message 239
  BtnClose.caption := GetTextLang(168); //
  BtnOkPrint.caption := GetTextLang(167); // Print 52
  Massaction1.caption := GetTextLang(3281);

  BSavePriceChange.caption := GetTextLang(726);

  Plugins1.caption := GetTextLang(3282);
  LFastlookup.caption := GetTextLang(3283);
  Entertotal1.caption := GetTextLang(3284);
  ChangePrnLbls(DestLbl, lblCopies, BitSetPrint);
  // dmDatabase.tblStock.Open ;
  // External form
  AExternalForm := nil;
  if @TcVariables.AExternalEditAddItemToDocPlugin.aLoadFormPlugin <> nil then
  begin
    // load for this books?
    if DMTCCoreLink.ReadNwReportOp('USEDOCPLUGIN', false) then
      AExternalForm := TcVariables.AExternalEditAddItemToDocPlugin.
        aLoadFormPlugin(Application, 'INITFROMDOC');
  end;
  if AExternalForm <> nil then
  begin
    // Add button
    cxGrid1DBTableView1STAX.Visible := true;
    cxGrid1DBTableView1STAX.caption := 'X';
    tblBatchSTAX2.OnGetText := PluginFieldGetText;
  end;
  initPlugins;
  NoOutOfStockMsg := ReadReportOp('cbNoOutOfStockMsg', true).AsBoolean;
  OutOfStockDrawColors := ReadReportOp('cbOutOfStockDrawCol', false).AsBoolean;

  dmDatabase.tblDocLine.SQL.Text := 'Select * from docline where WDocid = 0';
  dmDatabase.tblDocLine.Open;
  if UseMuliplier > 0 then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := 'X';
      DataBinding.FieldName := 'FUNITQTY';
      PropertiesClass := TcxCurrencyEditProperties ;
      TcxCurrencyEditProperties(Properties).DisplayFormat := '0.## ; - 0.##' ;
      TcxCurrencyEditProperties(Properties).EditFormat := '0.#######' ;
      TcxCurrencyEditProperties(Properties).OnValidate := cxGrid1DBTableView1FUNITQTYValidate ;
    end;
  end;

  if dmDatabase.tblDocLine.FindField('BCHECKED') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(3280);
      DataBinding.FieldName := 'NOTUSED';
      RepositoryItem := dmQuantumGridDefs.osfDBCheckbox;
    end;
  end;
  if dmDatabase.tblDocLine.FindField('DDELIVERDATE') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(3279);
      DataBinding.FieldName := 'DDATE';
    end;
  end;

  if dmDatabase.tblDocLine.FindField('DDELIVERDATE2') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(3279) + ' 2';
      DataBinding.FieldName := 'DALLOCATEDDATE';
    end;
  end;

  if dmDatabase.tblDocLine.FindField('WFREETYPEID') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(1030);
      DataBinding.FieldName := 'WFREETYPEID';
    end;

  end;

  if dmDatabase.tblDocLine.FindField('DEXTRADATE1') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(3279) + ' 3';
      DataBinding.FieldName := 'DEXTRADATE1';
    end;

  end;

  if dmDatabase.tblDocLine.FindField('DEXTRADATE2') <> nil then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(3279) + ' 3';
      DataBinding.FieldName := 'DEXTRADATE2';
    end;

  end;
  if ShowSpecialAccount then
  begin
    with cxGrid1DBTableView1.CreateItem as TcxGridDBColumn do
    begin
      caption := DMTCCoreLink.GetTextLang(31);
      DataBinding.FieldName := 'WCONTRAACCOUNTID';
    end;
  end;
  dmDatabase.tblDocLine.close;
  aPayDiscountItem := 0;
  aPayDiscountItemCred := 0;
  aShipcostunittype := 0;
  BBelgiumStyleDiscount := false;

  if TDatabaseTableRoutines.FieldExists('DOCHEAD', 'FPAYMENTDISCOUNT') then
  begin
    aPayDiscountItem := ReadReportOp('STKDISCPAYMENTITEM', 0).AsInteger;
    aPayDiscountItemCred := ReadReportOp('STKDISCPAYMENTITEMCR', 0).AsInteger;
    PExtra.Visible := true;
    BBelgiumStyleDiscount := ReadReportOp('STKDISCBELGIUMSTYLE', false)
      .AsBoolean;

  end;
  if TDatabaseTableRoutines.FieldExists('DOCHEAD', 'WSHIPSTOCKID') then
  begin
    // WSHIPSTOCKID Integer
    PExtra.Visible := true;
    aShipcostunittype := ReadReportOp('STKSHIPUNITTYPE', 0).AsInteger;
    if aShipcostunittype <> 0 then
      TDataBaseStringRoutines.FillStringListWithSelect(cbShipments.Items,
        'Select WStockid,SStockCode || ' + QuotedStr(' ') +
        ' || SDescription Descrip from Stock where WUnitid =  ' +
        IntToStr(aShipcostunittype))
    else
    begin
      Lshipment.Visible := false;
      cbShipments.Visible := false;
      Eshipment.Visible := false;
      lshipmentAmt.Visible := false;
    end;
  end;

  LEndTotal.Visible := PExtra.Visible;
  EndTotal.Visible := PExtra.Visible;

  Link1.caption := DMTCCoreLink.GetTextLang(3484);
  Links1.caption := DMTCCoreLink.GetTextLang(3481);

end;

procedure TfmInvoiceEntryGrid.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := true;

  if NBDocuments.PageIndex = 1 then
  begin
    if self.parent <> nil then
    begin
      if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(3320)
        { 'Save unsaved document ?' } , mtConfirmation, [mbYes, mbNo], 0)
        = mryes then
      begin
        BtnOkPrintClick(self);
      end;
      exit;
    end;

    BtnClose.SetFocus;
    InGrid := false;
    if AddInvoiceForAccount <> 0 then
    begin
      AddInvoiceForAccount := 0;
      exit;
    end;

    CanClose := false;
    if LastDocPosted then
    begin
      MyLocBatSerInput.cancelPost;
      NBDocuments.PageIndex := 0;
      FormResize(self);
      exit;
    end;
    BtnCloseClick(self);
  end;
end;

procedure TfmInvoiceEntryGrid.ENewTotalExit(Sender: TObject);
var
  OldTotal, NewTotal, Percentage, NEwCredit: Double;
begin
  // todo : recalc new price here.
  PNewTotal.Visible := false;
 
  OldTotal := Str2Float(lblInvAmt.caption);
  NewTotal := Str2Float(ENewTotal.Text);
  Percentage := ((OldTotal - NewTotal) / (OldTotal / 100)) / 100;
  // update records
  tblBatch.DisableControls ;
  try
  tblBatch.first;
  while not tblBatch.Eof do
  begin
    tblBatch.Edit;
    if not BPriceAgreeUseOrgPrice then
      tblBatchFDEBIT.AsFloat := tblBatchFDEBIT.AsFloat -
        (tblBatchFDEBIT.AsFloat * Percentage);
    tblBatchFCREDIT.AsFloat := tblBatchFCREDIT.AsFloat -
      (tblBatchFCREDIT.AsFloat * Percentage);
    NEwCredit := tblBatchFCREDIT.AsFloat;
    if BPriceAgreeUseOrgPrice then
    begin
      tblBatchFTAXAMOUNT.Value :=
        ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString)) -
        tblBatchFCREDIT.Value);
      if tblBatchFTAXAMOUNT.Value <> 0 then
        tblBatchFTAXAMOUNT.Value :=
          (tblBatchFTAXAMOUNT.Value /
          ((tblBatchFDEBIT.Value *
          Str2Float(tblBatchSCONTRAACCOUNT.AsString))) * 100);
    end;
    tblBatchFCREDIT.AsFloat := NEwCredit;
    tblBatch.post;
    tblBatch.next;
  end;
  finally
   tblBatch.EnableControls ;
  end;
  cxGrid1DBTableView1.DataController.Refresh ;
  UpdateTotalsLbls;
end;

procedure TfmInvoiceEntryGrid.ENewTotalKeyPress(Sender: TObject; var Key: Char);
begin

 if key =#13 then PNewTotal.Visible := False ;


end;

procedure TfmInvoiceEntryGrid.Entertotal1Click(Sender: TObject);
begin
  // Exit if where looking at a posted one.
  if LastDocPosted then
  begin
    exit;
  end;
  PNewTotal.Visible := true;
  PNewTotal.BringToFront;
  ENewTotal.SetFocus;
  ENewTotal.Text := FloatToStr(Str2Float(lblInvAmt.caption));
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceDblClick(Sender: TObject);
var
  AExternalSendString: String;

begin
  if tblBatch.IsEmpty then
  begin
    tblBatch.Insert ;

    exit;
  end;
  if (LastStock.WStockTypeId = 10) and (tblBatchBRECONCILED.Value = 0) then
  begin

    fmStockLinkDetail.InitFromStockDocLine
      (DMTCCoreLink.stockObject.GetStockid(tblBatchSREFERENCE.AsString),
      tblBatchWLINEID.AsInteger);
    if fmStockLinkDetail.ShowModal = mrok then
    begin
      tblBatch.Edit;
      tblBatchSCONTRAACCOUNT.AsFloat := fmStockLinkDetail.GetLastTotalQty;
      tblBatchSACCOUNT.AsFloat := tblBatchSCONTRAACCOUNT.AsFloat;
      tblBatchFUNITQTY.AsFloat := 1;
      if ExclMode then
      begin
        tblBatchFDEBIT.Value := fmStockLinkDetail.TotExcl;
        tblBatchFCREDIT.Value := fmStockLinkDetail.TotExcl /
          fmStockLinkDetail.GetLastTotalQty;
      end
      else
      begin
        tblBatchFDEBIT.Value := fmStockLinkDetail.TotInc;
        tblBatchFCREDIT.Value := fmStockLinkDetail.TotInc /
          fmStockLinkDetail.GetLastTotalQty;
      end;

      tblBatchFTAXAMOUNT.Value := 0;
      tblBatchSTAX.clear;
      tblBatch.post;

      UpdateTotalsLbls;
    end;
    exit;
  end;

  if (AExternalForm <> nil) and
    (cxGrid1DBTableView1.Controller.FocusedColumn =
    cxGrid1DBTableView1STAX2) then
    if tblBatchBRECONCILED.Value = 0 then
    begin
      AExternalSendString := 'EDITLINE=' + IntToStr(LastDocHeaderId) + #13 + #10
        + GetPluginLineString;

      AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
        pchar(AExternalSendString));
      AExternalSendString := tblBatchWLINEID.AsString;
      tblBatch.close;
      tblBatch.Open;
      tblBatch.Locate('WLINEID', AExternalSendString, []);
      UpdateTotalsLbls;
    end;

  if EditStockPrices and (LocalDocType in [12, 13, 15, 17]) and
    (cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName('FDEBIT')) then
  begin
    SetStockEditPrice;
  end;

  if (LastStock.WStockTypeId = 0) and (LocalDocType in [10, 11, 12, 13, 16, 17])
    and (LastStock.wLocBatSerTypeid > 0) and
    (cxGrid1DBTableView1.Controller.FocusedColumn <> cxGrid1DBTableView1STAX2)
    and (TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn)
    .DataBinding.FieldName <> 'WCONTRAACCOUNTID') and
    (cxGrid1DBTableView1.Controller.FocusedColumn.Index <>
    FindIndexOfName('STAX')) then

  begin
    MyLocBatSerInput.GoToSerial := '';
    MyLocBatSerInput.LoadData(LastDocHeaderId, tblBatchWLINEID.AsInteger,
      LastStock.WStockID);
    tblBatch.Edit;
    tblBatchSCONTRAACCOUNT.AsFloat := MyLocBatSerInput.GetLastTotalQty;

    if tblBatch.State = dsBrowse then
      tblBatch.Edit;
    tblBatchSACCOUNT.AsFloat := tblBatchSCONTRAACCOUNT.AsFloat;

    UpdateStockRecWithPriceForplugin(LastStock, tblBatchFUNITQTY.AsFloat);
    ApplyStockCodeToCurrentRecord;

    cxGrid1DBTableView1.Controller.FocusedColumnindex :=
      cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex;
    CalcAmounts;
    tblBatch.post;
    UpdateTotalsLbls;
    // exit else tax will popup
    exit;
  end;
  If tblBatchBRECONCILED.Value = 1 then
  begin
    // lets do this on double click.
    If cxGrid1DBTableView1.Controller.FocusedColumnindex <> 1 then
      cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
    tlbtnComment.Down := true;
    PnlComment.Visible := true;
    PnlComment.SetBounds(0, 80, BtnOkPrint.Width + BtnOkPrint.Left,
      pnlDocLines.Height - 80);
    PnlComment.BringToFront;
    if EdComment.CanFocus then
      EdComment.SetFocus;
  end;
  if LastDocPosted then
  begin
    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName('NOTUSED')) and (not tblBatch.IsEmpty) then
    begin
      tblBatch.Edit;
      if tblBatchNOTUSED.AsInteger = 0 then
        tblBatchNOTUSED.AsInteger := 1
      else
        tblBatchNOTUSED.AsInteger := 0;
      tblBatch.post;
      DMTCCoreLink.ExecSql('Update docline set BCHECKED=' +
        IntToStr(tblBatchNOTUSED.AsInteger) + ' where WDocid = ' +
        IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
        tblBatchWLINEID.AsString);
    end;

    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName('DALLOCATEDDATE')) and (not tblBatch.IsEmpty) then
    begin

      AExternalSendString := InputBox('Edit date', 'Set date',
        tblBatchDALLOCATEDDATE.AsString);
      if (StrToDateDef(AExternalSendString, 0) <> 0) or
        (AExternalSendString <> '') then
      begin
        if AExternalSendString = '' then
        begin
          tblBatch.Edit;
          tblBatchDDATE.clear;
          tblBatch.post;
          DMTCCoreLink.ExecSql
            ('Update docline set DDELIVERDATE2= null where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);

        end
        else
        begin
          tblBatch.Edit;
          tblBatchDDATE.AsDateTime := StrToDateDef(AExternalSendString, 0);
          tblBatch.post;
          DMTCCoreLink.ExecSql('Update docline set DDELIVERDATE2=' +
            TDatabaseTableRoutines.GetFirebirdsSqlForDate
            (StrToDateDef(AExternalSendString, 0)) + ' where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end;
      end;
    end;

    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName('DDATE')) and (not tblBatch.IsEmpty) then
    begin

      AExternalSendString := InputBox('Edit date', 'Set date',
        tblBatchDDATE.AsString);
      if (StrToDateDef(AExternalSendString, 0) <> 0) or
        (AExternalSendString <> '') then
      begin
        if AExternalSendString = '' then
        begin
          tblBatch.Edit;
          tblBatchDDATE.clear;
          tblBatch.post;
          DMTCCoreLink.ExecSql
            ('Update docline set DDELIVERDATE= null where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);

        end
        else
        begin
          tblBatch.Edit;
          tblBatchDDATE.AsDateTime := StrToDateDef(AExternalSendString, 0);
          tblBatch.post;
          DMTCCoreLink.ExecSql('Update docline set DDELIVERDATE=' +
            TDatabaseTableRoutines.GetFirebirdsSqlForDate
            (StrToDateDef(AExternalSendString, 0)) + ' where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end;
      end;
    end;

    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName('DEXTRADATE1')) and (not tblBatch.IsEmpty) then
    begin

      AExternalSendString := InputBox('Edit date', 'Set date',
        tblBatch.FieldByName('DEXTRADATE1').AsString);
      if (StrToDateDef(AExternalSendString, 0) <> 0) or
        (AExternalSendString <> '') then
      begin
        if AExternalSendString = '' then
        begin
          tblBatch.Edit;
          tblBatchDDATE.clear;
          tblBatch.post;
          DMTCCoreLink.ExecSql
            ('Update docline set DEXTRADATE1= null where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end
        else
        begin
          tblBatch.Edit;
          tblBatchDDATE.AsDateTime := StrToDateDef(AExternalSendString, 0);
          tblBatch.post;
          DMTCCoreLink.ExecSql('Update docline set DEXTRADATE1=' +
            TDatabaseTableRoutines.GetFirebirdsSqlForDate
            (StrToDateDef(AExternalSendString, 0)) + ' where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end;
      end;
    end;
    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName('DEXTRADATE2')) and (not tblBatch.IsEmpty) then
    begin
      AExternalSendString := InputBox('Edit date', 'Set date',
        tblBatch.FieldByName('DEXTRADATE2').AsString);
      if (StrToDateDef(AExternalSendString, 0) <> 0) or
        (AExternalSendString <> '') then
      begin
        if AExternalSendString = '' then
        begin
          tblBatch.Edit;
          tblBatchDDATE.clear;
          tblBatch.post;
          DMTCCoreLink.ExecSql
            ('Update docline set DEXTRADATE2= null where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end
        else
        begin
          tblBatch.Edit;
          tblBatchDDATE.AsDateTime := StrToDateDef(AExternalSendString, 0);
          tblBatch.post;
          DMTCCoreLink.ExecSql('Update docline set DEXTRADATE2=' +
            TDatabaseTableRoutines.GetFirebirdsSqlForDate
            (StrToDateDef(AExternalSendString, 0)) + ' where WDocid = ' +
            IntToStr(LastDocHeaderId) + ' and WDoclineid=' +
            tblBatchWLINEID.AsString);
        end;
      end;
    end;
    exit;
  end;
  if cxGrid1DBTableView1.Controller.FocusedColumnindex = 0 then
    SelectStockItem
  else if (LastStock.WStockTypeId in [7, 8]) and
    (cxGrid1DBTableView1.Controller.FocusedColumnindex in [2, 3, 4]) then
  begin
    tblBatch.Edit;
    DocSelectOptions.lstQty := tblBatchSCONTRAACCOUNT.AsFloat;
    DocSelectOptions.lstTotal := tblBatchFCREDIT.AsFloat;
    if not ExclMode then
    begin
      if DocSelectOptions.lstTotal <> 0 then
        DocSelectOptions.lstTotal := DocSelectOptions.lstTotal /
          aAccountRecList.gettaxrateonId(tblBatchWTAXID.AsInteger);
    end;
    if (LocalDocType in [10, 11, 14, 16]) then
    begin
      if DefaultTaxId <> 0 then
        DocSelectOptions.InitForStock(LastStock.WStockID,
          tblBatchWLINEID.AsInteger, DefaultTaxId, not ExclMode, '')
      else
        DocSelectOptions.InitForStock(LastStock.WStockID,
          tblBatchWLINEID.AsInteger, tblBatchWTAXID.AsInteger, not ExclMode, '')
    end
    else
    begin
      if DefaultTaxId <> 0 then
        DocSelectOptions.InitForStock(LastStock.WStockID,
          tblBatchWLINEID.AsInteger, DefaultTaxId, not ExclMode, '')
      else
        DocSelectOptions.InitForStock(LastStock.WStockID,
          tblBatchWLINEID.AsInteger, tblBatchWTAXID.AsInteger,
          not ExclMode, '');
    end;
    tblBatchSCONTRAACCOUNT.AsFloat := DocSelectOptions.lstQty;
    tblBatchSACCOUNT.AsFloat := DocSelectOptions.lstQty;
    if DocSelectOptions.lstQty <> 0 then
      tblBatchFDEBIT.AsFloat := DocSelectOptions.lstTotal /
        DocSelectOptions.lstQty;
    tblBatchFCREDIT.AsFloat := DocSelectOptions.lstTotal;
    if not ExclMode then
    begin
      if tblBatchWTAXID.AsInteger <> 0 then
      begin
        tblBatchFCREDIT.AsFloat := tblBatchFCREDIT.AsFloat *
          aAccountRecList.gettaxrateonId(tblBatchWTAXID.AsInteger);
        tblBatchFDEBIT.AsFloat := tblBatchFDEBIT.AsFloat *
          aAccountRecList.gettaxrateonId(tblBatchWTAXID.AsInteger);
      end;
    end;
    tblBatch.post;
    UpdateTotalsLbls;
  end;

  if cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName('WCONTRAACCOUNTID') then
  begin

    CallLookup('', 3, tblBatchWCONTRAACCOUNTID.AsInteger,
      ' and BInActive = 0', true);
    if (ReturnLookup <> 'BACK') and (ReturnLookup <> 'ESC') And
      (tblBatchWCONTRAACCOUNTID.AsString <> ReturnLookup) then
    begin
      tblBatch.Edit;
      tblBatchWCONTRAACCOUNTID.AsInteger := ReturnID;
    end;
  end;
  if cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName('WUNITID') then
  begin

    CallLookup('', 3, tblBatchWUNITID.AsInteger, '', true);
    if (ReturnLookup <> 'BACK') and (ReturnLookup <> 'ESC') And
      (tblBatchWUNITID.AsString <> ReturnLookup) then
    begin
      tblBatch.Edit;
      tblBatchWCONTRAACCOUNTID.AsInteger := ReturnID;
    end;
  end;
  if cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName('STAX') then
  begin
    if not cxGrid1DBTableView1STAX.Options.Editing then
      exit;
    if (LocalDocType in [10, 11, 14, 16]) then
      CallLookup(tblBatchSTAX.AsString, 6, 0,
        ' and (BInActive = 0 and (showtype is null or showtype in (0,1))) or (account.Waccountid =0)',
        true)
    else
      CallLookup(tblBatchSTAX.AsString, 6, 0,
        ' and (BInActive = 0 and (showtype is null or showtype in (0,2))) or (account.Waccountid =0)',
        true);

    if cxGrid1.CanFocus then
      cxGrid1.SetFocus;

    if ReturnLookup <> 'BACK' then
    begin
      if (ReturnLookup <> 'ESC') And
        (tblBatchSTAX.AsString <> ReturnLookup) then
      begin
        tblBatch.Edit;
        tblBatchSTAX.AsString := ReturnLookup;
        tblBatchWTAXID.AsInteger := ReturnID;
        UpdateTotalsLbls;
      end;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.RefreschDocumentList(GoToID: Integer = 0;
  JustGoTo: Boolean = false);
var
  ExtraSql, Sort: String;
begin
  if cbDocTypenew.ItemIndex = -1 then
    if cbDocTypenew.Items.Count = 0 then
      Raise Exception.Create('No items!')
    else
      cbDocTypenew.ItemIndex := 0;
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if CBOperatot.ItemIndex = -1 then
    CBOperatot.ItemIndex := 0;
  StatusBar.Panels[0].Text := '';
  if GoToID = 0 then
    GoToID := QDocHeadWDOCID.AsInteger;

  QDocHead.close;
  QDocHead.SQL.clear;
  DocHeadQuery := StringReplace
    (UPPERCASE(format(dmDatabase.SQLList.GetFormatedSQLByName
    ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT OUTER'])), 'SELECT ',
    'Select first ' + IntToStr(LimitRows.Value) + ' ', []);

  case cbViewUnPosted2.ItemIndex of
    1:
      QDocHead.SQL.Add(DocHeadQuery +
        ' and (BPosted not in (1,-1)  and WTypeId = ' + IntToStr(idDocType));
    2:
      QDocHead.SQL.Add(DocHeadQuery + ' and (WTypeId = ' + IntToStr(idDocType));
    3:
      QDocHead.SQL.Add(DocHeadQuery + ' and (BPosted  = -1  and WTypeId = ' +
        IntToStr(idDocType));
  else
    QDocHead.SQL.Add(DocHeadQuery + ' and (BPosted = 1  and WTypeId = ' +
      IntToStr(idDocType));
  end;
  if ProjectId <> 0 then
  begin
    QDocHead.SQL.Add(' and dochead.WJOBCODEID = ' + IntToStr(ProjectId));
  end;

  if cbDoc1group.Visible and (cbDoc1group.ItemIndex > 0) then
  begin
    QDocHead.SQL.Add(' and dochead.WREPORTINGGROUP1ID = ' +
      IntToStr(Integer(cbDoc1group.Items.Objects[cbDoc1group.ItemIndex])));
  end;

  if LimitDocSql <> '' then
    QDocHead.SQL.Add(LimitDocSql);
  if JustGoTo then
  begin
    // get docid from openamount
    DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
      ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT OUTER']);
    QDocHead.SQL.clear;
    QDocHead.SQL.Add(DocHeadQuery);
    QDocHead.SQL.Add('and dochead.WDocid = ' + IntToStr(GoToID));
    QDocHead.SQL.Add(dmDatabase.SQLList.GetFormatedSQLByName
      ('InvoiceEntryGrid_DocHeadQryWithAmountGroupBy'));
    QDocHead.Open;
  end
  else
  begin

    if Trim(EFilterValue.Text) <> '' then
      if CBFindColumn.ItemIndex > 0 then
      begin
        if (CBFindColumn.ItemIndex > cxlistDBTable.ColumnCount) then
        begin
          ExtraSql := EFilterValue.Text;
          // plugin search
        end
        else
        begin

          case TcxGridDBBandedColumn
            (cxlistDBTable.Columns[Integer(CBFindColumn.Items.Objects
            [CBFindColumn.ItemIndex])]).DataBinding.Field.DataType of

            ftString, ftBoolean:
              begin
                ExtraSql := ' and upper(' + TcxGridDBBandedColumn
                  (cxlistDBTable.Columns
                  [Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])])
                  .DataBinding.Field.Origin + ')';
                case CBOperatot.ItemIndex of
                  0:
                    begin
                      if LikeSeach then
                        ExtraSql := ExtraSql + ' like ' +
                          QuotedStr('%' + EFilterValue.Text + '%')
                      else
                        ExtraSql := ExtraSql + ' like ' +
                          QuotedStr(EFilterValue.Text + '%');
                    end;
                  1:
                    ExtraSql := ExtraSql + ' = ' + QuotedStr(EFilterValue.Text);
                  2:
                    ExtraSql := ExtraSql + ' < ' + QuotedStr(EFilterValue.Text);
                  3:
                    ExtraSql := ExtraSql + ' > ' + QuotedStr(EFilterValue.Text);
                  4:
                    ExtraSql := ExtraSql + ' <= ' +
                      QuotedStr(EFilterValue.Text);
                  5:
                    ExtraSql := ExtraSql + ' >= ' +
                      QuotedStr(EFilterValue.Text);
                  6:
                    ExtraSql := ExtraSql + ' <> ' +
                      QuotedStr(EFilterValue.Text);
                end;
              end;

            ftDate, ftDateTime:
              begin
                ExtraSql := ' and cast(' + TcxGridDBBandedColumn
                  (cxlistDBTable.Columns
                  [Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])])
                  .DataBinding.Field.Origin + ' as date)';
                case CBOperatot.ItemIndex of
                  0:
                    ExtraSql := ExtraSql + ' = ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  1:
                    ExtraSql := ExtraSql + ' = ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  2:
                    ExtraSql := ExtraSql + ' < ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  3:
                    ExtraSql := ExtraSql + ' > ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  4:
                    ExtraSql := ExtraSql + ' <= ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  5:
                    ExtraSql := ExtraSql + ' >= ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                  6:
                    ExtraSql := ExtraSql + ' <> ' +
                      QuotedStr(FormatDateTime('yyyy-mm-dd',
                      StrToDate(EFilterValue.Text)));
                end;
              end;
          else
            begin
              ExtraSql := ' and cast(' + TcxGridDBBandedColumn
                (cxlistDBTable.Columns
                [Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])])
                .DataBinding.Field.Origin + ' as Numeric(12,2))';
              case CBOperatot.ItemIndex of
                0:
                  ExtraSql := ExtraSql + ' = ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                1:
                  ExtraSql := ExtraSql + ' = ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                2:
                  ExtraSql := ExtraSql + ' < ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                3:
                  ExtraSql := ExtraSql + ' > ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                4:
                  ExtraSql := ExtraSql + ' <= ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                5:
                  ExtraSql := ExtraSql + ' >= ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
                6:
                  ExtraSql := ExtraSql + ' <> ' +
                    StringReplace(StripNotNumericReturnZero(EFilterValue.Text),
                    DecimalSeparator, '.', [rfreplaceall]);
              end;
            end;
          end;
        end;

        QDocHead.SQL.Add(ExtraSql);
      end;
    if GoToID <> -1 then
      QDocHead.SQL.Add(' ) and dochead.WDocID<>' + IntToStr(GoToID))
    else
      QDocHead.SQL.Add(' ) ');

    if GoToID <> -1 then
    begin
      QDocHead.SQL.Add('Union');
      QDocHead.SQL.Add(DocHeadQuery + ' and dochead.WDocID =' + IntToStr(GoToID)
        + ' and WTypeId = ' + IntToStr(idDocType));
    end;

    QDocHead.SQL.Add(' order by 1 desc');

    QDocHead.SQL.Add(dmDatabase.SQLList.GetFormatedSQLByName
      ('InvoiceEntryGrid_DocHeadQryWithAmountGroupBy'));
    if LookupAmount <> 0 then
    begin
      DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
        ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['']);
      QDocHead.SQL.clear;
      QDocHead.SQL.Add(DocHeadQuery +
        ' and (dochead.Bposted = 1 and transact.FOutstandingAmount <>0 ) and ' +
        ' Exists (select  a.WDOCID,sum(FOUTSTANDINGAMOUNT)- coalesce( sum(b.FAMOUNT),0) a  '
        + '  from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID '
        + ' where  a.FoutStandingAmount <> 0 and dochead.WDOCID = a.WDOCID and dochead.WOPENITEMTRANSACTID = a.WTRANSACTIONID '
        + ' group by   a.Wdocid  having sum(FOUTSTANDINGAMOUNT)- coalesce( sum(b.FAMOUNT),0) = '
        + StringReplace(FloatToStr(LookupAmount), DecimalSeparator, '.',
        [rfreplaceall]) + '   )');
      QDocHead.SQL.Add(' and WTypeId = ' + IntToStr(idDocType));
      QDocHead.SQL.Add('UNION');
      DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
        ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT ']);
      QDocHead.SQL.Add(DocHeadQuery);
      QDocHead.SQL.Add('and (dochead.Bposted = 0 and dochead.FDocAmount = ' +
        StringReplace(FloatToStr(Abs(LookupAmount)), DecimalSeparator, '.',
        [rfreplaceall]) + ')');
      QDocHead.SQL.Add(' and WTypeId = ' + IntToStr(idDocType));
      // get docid from openamount
      LookupAmount := 0;
      QDocHead.SQL.Add(dmDatabase.SQLList.GetFormatedSQLByName
        ('InvoiceEntryGrid_DocHeadQryWithAmountGroupBy'));
      QDocHead.Open;
      BEdit.Enabled := not QDocHead.IsEmpty;
      BPrint.Enabled := not QDocHead.IsEmpty;
      BEdit.Enabled := not QDocHead.IsEmpty;
      BPrint.Enabled := not QDocHead.IsEmpty;
      exit;
    end;

    if GoToDocId <> 0 then
    begin
      // get docid from openamount
      DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
        ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT OUTER']);
      QDocHead.SQL.clear;
      QDocHead.SQL.Add(DocHeadQuery);
      QDocHead.SQL.Add('and dochead.WDocid = ' + IntToStr(GoToDocId));
      // set to type
      idDocType := TDataBaseDocumentRoutines.GetDocType(GoToDocId);
      LocalDocType := idDocType;
      if LocalDocType > 18 then
        LocalDocType := 14 + (LocalDocType mod 2);
      if ForceDocType = 0 then
      begin
        cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
          (TObject(LocalDocType));
      end
      else
      begin
        cbDocTypenew.Items.clear;
        cbDocTypenew.Items.AddObject('X', TObject(ForceDocType));
        LocalDocType := ForceDocType;
        if ForceDocType > 18 then
        begin
          LocalDocType := 14 + (ForceDocType mod 2);
          cbDocTypenew.Items.AddObject('X', TObject(ForceDocType));
        end;
        cbDocTypenew.ItemIndex := 0;
        cbDocTypenew.Visible := false;
        Label7.Visible := false;

      end;

      GoToDocId := 0;
      QDocHead.SQL.Add(' order by 1 desc');
    end;

    if ForceAccountid <> 0 then
    begin
      cbViewUnPosted2.ItemIndex := 2;
      DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
        ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT OUTER']);
      QDocHead.SQL.clear;
      QDocHead.SQL.Add(DocHeadQuery);
      QDocHead.SQL.Add(' and dochead.WAccountid = ' + IntToStr(ForceAccountid));
      QDocHead.SQL.Add(' and dochead.WTypeId = ' + IntToStr(idDocType) +
        ' order by dochead wdocid desc');
      ForceAccountid := 0;
    end;
    QDocHead.Open;

    if not QDocHead.Locate('WDocID', GoToID, []) then
      QDocHead.first;
  end;
  BEdit.Enabled := not QDocHead.IsEmpty;
  BPrint.Enabled := not QDocHead.IsEmpty;
  if not QDocHead.IsEmpty then
    if GoToLineID <> -1 then
    begin
      BEditClick(self);
      tblBatch.Locate(tblBatchWLINEID.FieldName, GoToLineID, []);
      GoToLineID := -1;
    end;

end;

procedure TfmInvoiceEntryGrid.BEditClick(Sender: TObject);
begin
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if QDocHead.IsEmpty then
    exit;
  if ListIsReadOnly then
  begin
    ModalResult := mrok;
    exit;
  end;
  edtAccountNumber.Text := AddDashInAccCodeNoPRefix
    (QDocHeadSACCOUNTCODE.AsString);
  edtWAccountID := QDocHeadWACCOUNTID.AsInteger;
  cbInvoiceNumber.Items.clear;
  cbInvoiceNumber.Items.Add(QDocHeadSDOCNO.AsString);
  cbInvoiceNumber.ItemIndex := 0;
  LastDocHeaderId := QDocHeadWDOCID.AsInteger;
  if LookAccType = 1 then
    // pull up the defaults for the debtor
    LoadDebtors
  else
    // pull up the defaults for the Creditor
    LoadCreditors;

  UpdateAccountInfo;
  cbInvoiceNumberExit(self);
  FormResize(Sender);
  pnlDocLines.Visible := true;
  self.caption := TmpCaption;
  StatusBar.Panels[1].Text := self.caption;

  EnterDocLinesScr(self);
  NBDocuments.PageIndex := 1;
  DoclineTranslate;
  FormResize(self);
  if edtOrderNumber.CanFocus then
    edtOrderNumber.SetFocus;

  AllOk := true;
  FirstTime := true;

end;

procedure TfmInvoiceEntryGrid.BNewClick(Sender: TObject);
var
  MyLookAtTypeAcc: Integer;
begin
  if LookAccType = 0 then
    if (Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex])
      in [10, 11, 14, 16, 18]) then
      LookAccType := 1
    else
      LookAccType := 2;

  MyLookAtTypeAcc := LookAccType;
  if (ssShift in LastShift) then
    if MyLookAtTypeAcc = 1 then
      MyLookAtTypeAcc := 2
    else if MyLookAtTypeAcc = 2 then
      MyLookAtTypeAcc := 1;
  try
    if cbDocTypenew.ItemIndex <> -1 then
      idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
    LocalDocType := idDocType;
    if LocalDocType > 18 then
      LocalDocType := 14 + (LocalDocType mod 2);

    cbViewUnPosted2.ItemIndex := 1;
    if MyLookAtTypeAcc = 1 then
    // pull up the defaults for the debtor
    begin
      if AddInvoiceForAccount = 0 then
      begin
        if Not Assigned(fmDebtor) then
          fmDebtor := TfmDebtor.Create(self);

        fmDebtor.UseCreditor := false;
        fmDebtor.AsFindScreen(true);
        SetUpForm(fmDebtor);
        if fmDebtor.ShowModal <> mrok then
          exit;
        if fmDebtor.QDebtorCreditor.IsEmpty then
          exit;

        edtAccountNumber.Text := AddDashInAccCodeNoPRefix
          (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);

        edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

        if AddProjectForAccount <> 0 then
        begin
          cbProject.ItemIndex := GetItemIndexFromId(cbProject.Items,
            AddProjectForAccount);
        end;
      end
      else
      begin
        edtAccountNumber.Text := AddDashInAccCodeNoPRefix
          (TDataBaseRoutines.GetAccountCode(AddInvoiceForAccount));
        edtWAccountID := AddInvoiceForAccount;

        if AddProjectForAccount <> 0 then
        begin
          cbProject.ItemIndex := GetItemIndexFromId(cbProject.Items,
            AddProjectForAccount);
        end;
      end;
      dmDatabase.tblDocHeader.close;
      LoadDebtors;
    end
    else
    // pull up the defaults for the Creditor
    begin
      if AddInvoiceForAccount = 0 then
      begin
        if Not Assigned(fmDebtor) then
          fmDebtor := TfmDebtor.Create(self);
        fmDebtor.UseCreditor := true;
        fmDebtor.AsFindScreen(true);
        SetUpForm(fmDebtor);
        if fmDebtor.ShowModal <> mrok then
          exit;
        if fmDebtor.QDebtorCreditor.IsEmpty then
          exit;
        edtAccountNumber.Text := AddDashInAccCodeNoPRefix
          (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);
        edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;
      end
      else
      begin
        edtAccountNumber.Text := AddDashInAccCodeNoPRefix
          (TDataBaseRoutines.GetAccountCode(AddInvoiceForAccount));
        edtWAccountID := AddInvoiceForAccount;
        if AddProjectForAccount <> 0 then
        begin
          cbProject.ItemIndex := GetItemIndexFromId(cbProject.Items,
            AddProjectForAccount);
        end;
      end;

      dmDatabase.tblDocHeader.close;
      LoadCreditors;

    end;
    LastDocHeaderId := -1;
    LastDocPosted := false;
    UpdateAccountInfo;
    try
      dtpDate.Date := Date;
    except

    end;
    cbInvoiceNumber.Items.clear;
    cbInvoiceNumber.Items.Add(NEWName);
    cbInvoiceNumber.Items.IndexOf(NEWName);
    cbInvoiceNumber.ItemIndex := 0;
    edtOrderNumber.Text := '';

    cbInvoiceNumberExit(self);
    // NBDocuments.PageIndex := 1 ;
    pnlDocLines.Visible := true;
    // edtOrderNumber.SetFocus ;
    EnterDocLinesScr(self);
    NBDocuments.PageIndex := 1;

    FormResize(self);

    DoclineTranslate;
    edtOrderNumber.SetFocus;

    AllOk := true;
    FirstTime := true;
    self.caption := TmpCaption;
    StatusBar.Panels[1].Text := self.caption;
    if LookAccType = 1 then
      ExclMode := not ReadReportOp('STKDefInc', false).AsBoolean
    else
      ExclMode := true;
    SetIncExclBtn;
  finally
    LastShift := [];
  end;
end;

procedure TfmInvoiceEntryGrid.BtnCloseClick(Sender: TObject);
begin

  if Assigned(anewlocallook) and anewlocallook.Visible then
  begin
    PnlDocHeader.Visible := true;
    Panel9.Visible := true;
    anewlocallook.Hide;
    PMAinData.Height := 238;
    Thideshowitems.caption := DMTCCoreLink.GetTextLang(3309);
  end;

  if InGrid = true then
  begin
    InGrid := false;
    cxGrid1.SetFocus;
    exit;
  end;

  if edtOrderNumber.CanFocus then
    edtOrderNumber.SetFocus;

  ATempStockList.clear;
  if LastDocPosted then
  begin
    NBDocuments.PageIndex := 0;
    self.caption := GetTextLang(928);
    StatusBar.Panels[1].Text := GetTextLang(928);

    StatusBar.Panels[0].Text := '';
    exit;
  end;
  if OSFMessageDlg(GetTextLang(1736), mtConfirmation, [mbYes, mbNo], 0)
    = mryes then
  begin
    MyLocBatSerInput.cancelPost;
    NBDocuments.PageIndex := 0;
    FormResize(self);
    FirstTime := false;
    AllOk := false;
    cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;

    if AddInvoiceForAccount <> 0 then
    begin
      ModalResult := mrCancel;
      AddInvoiceForAccount := 0;
      if Assigned(FOnModalResultEvent) then
        FOnModalResultEvent(self);

      exit;
    end;

    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where WDocId=' +
      IntToStr(LastDocHeaderId);
    dmDatabase.tblDocHeader.Open;
    if dmDatabase.tblDocHeaderSDocNo.AsString = '' then
    begin
      if not dmDatabase.tblDocHeader.IsEmpty then
        dmDatabase.tblDocHeader.Delete;
    end;
    dmDatabase.tblDocHeader.close;
    RefreschDocumentList;
  end;
  // Self.Caption:= GetTextLang(928) ;
  RefreshAccountType;
  if ShowHintForLine then
  begin
    self.ShowHint := true;
    Application.HintPause := 0;

    // Application.ShowHint := True;
    QDocHeadAfterScroll(QDocHead);
  end;
  self.caption := GetTextLang(928);
  StatusBar.Panels[1].Text := GetTextLang(928);

  StatusBar.Panels[0].Text := '';
  FormResize(self);
end;

procedure TfmInvoiceEntryGrid.BPrintClick(Sender: TObject);
var
  PostErr, Tmp, i: Integer;
  MySaveList: TSaveClientDatasetCallList;
  printList: TStringList;
  CustomLayout, Dolayout: String;
  AMessage: String;
  ISInitialized: Boolean;
  procedure DoEmailDocIfpluginExists;
  var

    z: Integer;
  begin

    for z := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
      if ExtractFileName(GetModuleName(AFormPluginRecordArray[z].aInst))
        = 'EmailInvoice.' + PluginsDLLName then
      begin

        AMessage := 'CONTEXTINIT2=TRUE';
        if not ISInitialized then
        begin
          AFormPluginRecordArray[z].aMessageFormPlugin
            (TForm(APluginsFormsList.Objects[z]), pchar(AMessage));
          ISInitialized := true;
        end;

        AMessage := 'CONTEXT2=' + dmDatabase.tblDocHeaderWDocID.AsString + #13 +
          #10 + 'TYPEID=' + IntToStr(LocalDocType) + #13 + #10 + 'ACCOUNTID=' +
          dmDatabase.tblDocHeaderWAccountID.AsString;
        AFormPluginRecordArray[z].aMessageFormPlugin
          (TForm(APluginsFormsList.Objects[z]), pchar(AMessage));

      end;
  end;

begin
  ISInitialized := false;
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  EmailList.clear;

  if QDocHead.IsEmpty then
    exit;

  printList := TStringList.Create;
  try
    if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
        printList.Add(IntToStr(QDocHeadWDOCID.AsInteger));
      end;
    end
    else
      printList.Add(IntToStr(QDocHeadWDOCID.AsInteger));

    dmDatabase.CreateBatch('POSTBATCH_' + IntToStr(currentuser) + '_' +
      IntToStr(currentuser));

    MySaveList := TSaveClientDatasetCallList.Create;
    try
      // TODO : SQL OPTIMIZE

      // MySaveList.AddclientObject(dmDatabase.tblStock,true);;
      // MySaveList.AddclientObject(dmDatabase.tblSysVars,true);
      // MySaveList.AddclientObject(dmdatabase.tblGroups,true);
      // MySaveList.AddclientObject(dmdatabase.qryDocHead,true);
      // MySaveList.AddclientObject(dmDatabase.qrPrnDocLines,true);
      // MySaveList.AddclientObject(dmDatabase.tblDocHeader,true);
      // dmDatabase.tblMessage.Open;

      dmDatabase.tblStock.Open;
      dmDatabase.tblSysVars.Open;
      // dmdatabase.tblGroups.Open;
      for i := 0 to printList.Count - 1 do
      begin
        dmDatabase.tblDocHeader.SQL.Text :=
          'select * from dochead where WDocId=' + printList[i];
        dmDatabase.tblDocHeader.Open;
        dmDatabase.tblDocHeader.Edit;
        dmDatabase.tblDocHeaderBPrinted.AsInteger :=
          dmDatabase.tblDocHeaderBPrinted.AsInteger + 1;
        dmDatabase.tblDocHeaderDSysDate.AsDateTime := Now;
        dmDatabase.tblDocHeader.post;
        RepNbr := NextEmailFileNo;
        if EmailList.IndexOf(IntToStr(LocalDocType) + ',' +
          dmDatabase.tblDocHeaderWDocID.AsString + ',' +
          dmDatabase.tblDocHeaderSDocNo.AsString + ',' +
          dmDatabase.tblDocHeaderWAccountID.AsString + ',' + IntToStr(RepNbr)
          ) = -1 then
          EmailList.Add(IntToStr(LocalDocType) + ',' +
            dmDatabase.tblDocHeaderWDocID.AsString + ',' +
            dmDatabase.tblDocHeaderSDocNo.AsString + ',' +
            dmDatabase.tblDocHeaderWAccountID.AsString + ',' +
            IntToStr(RepNbr));

        dmDatabase.tblDocHeader.SQL.Text :=
          'select * from dochead where WDocId=' + printList[i];
        dmDatabase.tblDocHeader.Open;
        OpenDocSql('WDocID=' + printList[i], '');
        // I seem to get a wrong doc
        dmDatabase.qryDocHead.Locate('WDocID', printList[i], []);
        // Preparing E-mail Process
        SetSQlLine(' AND WDocID=' + printList[i]);
        dmDatabase.qrPrnDocLines.Open;
        { Set to Print Options }
        // set layout per account

        CustomLayout := TDataBaseDocumentRoutines.GetDoclayoutOnAccountAndType
          (LocalDocType, dmDatabase.tblDocHeaderWAccountID.AsInteger);
        DocModel := GetDefaultDocPaperID(LocalDocType);
        if CBDocLayout.ItemIndex > 0 then
        begin
          CustomLayout := CBDocLayout.Text;
          if CBDocLayout.ItemIndex <> -1 then
            if CBDocLayout.Items.Objects[CBDocLayout.ItemIndex] <> nil then
              CustomLayout := 'TRN_' +
                IntToStr(Integer(CBDocLayout.Items.Objects
                [CBDocLayout.ItemIndex]));

          ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
            LocalDocType, CustomLayout, '', (i = printList.Count - 1), 0);
          Dolayout := '';
          if (CBDocLayout2.Text <> '') then
          begin
            Dolayout := CBDocLayout2.Text;
            if CBDocLayout2.ItemIndex <> -1 then
              if CBDocLayout2.Items.Objects[CBDocLayout2.ItemIndex] <> nil then
                Dolayout := 'TRN_' +
                  IntToStr(Integer(CBDocLayout2.Items.Objects
                  [CBDocLayout2.ItemIndex]));

            ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
              LocalDocType, Dolayout, '', (i = printList.Count - 1), 1)
          end;
        end
        else
        begin
          // if its on printer check for email etc
          // WTRANSMISSIONTYPE
          if cbDestination.ItemIndex = 1 then
          begin

            case TDatabaseDebtorCreditorRoutines.GetTransmissionType
              (TDataBaseDocumentRoutines.GetAccountOfDocid
              (dmDatabase.tblDocHeaderWDocID.AsInteger)) of
              0:
                ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
                  LocalDocType, CustomLayout, '', (i = printList.Count - 1), 0);
              1:
                begin
                  ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
                    LocalDocType, CustomLayout, '',
                    (i = printList.Count - 1), 0);
                  DoEmailDocIfpluginExists;
                end;
              2:
                DoEmailDocIfpluginExists;

            end;

          end
          else
          begin
            ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
              LocalDocType, CustomLayout, '', (i = printList.Count - 1), 0);
          end;
          if (CBDocLayout2.Text <> '') then
          begin
            Dolayout := CBDocLayout2.Text;
            if CBDocLayout2.ItemIndex <> -1 then
              if CBDocLayout2.Items.Objects[CBDocLayout2.ItemIndex] <> nil then
                Dolayout := 'TRN_' +
                  IntToStr(Integer(CBDocLayout2.Items.Objects
                  [CBDocLayout2.ItemIndex]));

            ShowFrReport(cbDestination.ItemIndex, 1, PrnVars.NumCopies,
              LocalDocType, Dolayout, '', (i = printList.Count - 1), 1)
          end;
          // to printer only
        end;

        if ReadReportOp('CBAutoPostDocuments', false).AsBoolean then
          if not(dmDatabase.tblDocHeaderWTYPEID.AsInteger in [14, 15]) and
            (dmDatabase.tblDocHeaderBPosted.AsInteger = 0) then
          begin
            tblBatch.DisableControls;
            try
              dmDatabase.tblDocLine.SQL.Text :=
                'Select * from docline where WDocID = ' + printList[i];
              dmDatabase.tblDocLine.Open;
              dmDatabase.ZMainconnection.StartTransaction;
              try
                PostErr := ConvertDocumentToBatch(Tmp,
                  dmDatabase.tblDocHeaderWDocID.AsInteger, false, nil,
                  nil, true);

              finally
                if dmDatabase.ZMainconnection.InTransaction then
                  dmDatabase.ZMainconnection.Rollback;
              end;
              if PostErr <> 0 then
              begin
                ShowErrMsg(PostErr);
              end;
            finally
              tblBatch.EnableControls;
            end;
          end;

      end; // end for i

      RefreschDocumentList(StrToInt(printList[0]));
    finally
      MySaveList.free;
    end;
  finally
    printList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceEnter(Sender: TObject);
begin
  if LastDocPosted then
  begin
    exit;
  end;
  if tblBatch.IsEmpty then
    if FirstGridFocus then
    begin
      FirstGridFocus := false;
      tblBatch.Insert;

    end;

end;

procedure TfmInvoiceEntryGrid.PriceListExit(Sender: TObject);
var
  agr: TGridRect;
begin
  agr.Left := 0;
  agr.Top := 0;
  agr.Right := 1;
  agr.Bottom := 1;
  PriceList.Visible := false;
  PriceList.Selection := agr;
end;

procedure TfmInvoiceEntryGrid.BFilterClick(Sender: TObject);
var
  SearchStr: Array [0 .. 4096] of Char;
  APChar: pchar;
begin
  if (CBFindColumn.ItemIndex > cxlistDBTable.ColumnCount) then
  begin
    EFilterValue.Text := '';
    SearchStr[0] := 'W';
    SearchStr[1] := 'D';
    SearchStr[2] := 'O';
    SearchStr[3] := 'C';
    SearchStr[4] := 'I';
    SearchStr[5] := 'D';
    SearchStr[6] := #0;
    // SearchStr := copy(EFilterValue.text,1,4096);
    APChar := SearchStr;
    AFormPluginRecordArray
      [Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])
      ].aDocSearch(APChar);
    EFilterValue.Text := SearchStr;
  end;
  RefreschDocumentList(-1);
end;

procedure TfmInvoiceEntryGrid.BClearClick(Sender: TObject);
begin
  EFilterValue.Text := '';
  CBFindColumn.ItemIndex := 0;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.dtpDateCalcBoldDay(Sender: TObject; ADate: TDate;
  Month, Day, Year: Integer; var Accept: Boolean);
begin
  // Accept := aLedgerPeriodeCollection.IsValideDate(ADate) ;
end;

procedure TfmInvoiceEntryGrid.EFilterValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    RefreschDocumentList(-1);
    cxlist.SetFocus;
  end;
end;

procedure TfmInvoiceEntryGrid.CheckStockAvailClick(AIdList: TStringList;
  ErrorText: String);
var
  DocGroupStockAvail, DocGroupStockNot, i: Integer;
  StockInHouse: Boolean;
  AProgress: TfmNewProgress;
  StockQty: Double;
  ErrorList: String;
  LocalSet: set of byte;
begin
  LocalSet := CheckStockTypesSet - [7];
  ErrorList := '';
  AProgress := TfmNewProgress.Create(nil);
  try

    DocGroupStockAvail := DMTCCoreLink.ReadSysParam('STO_STOCKAVAIL', 0, 0);
    DocGroupStockNot := DMTCCoreLink.ReadSysParam('STO_STOCKNOTAVAIL', 0, 0);
    AProgress.initProgress('Processing invoices', AIdList.Count);

    for i := 0 to AIdList.Count - 1 do

    begin
      StockInHouse := true;
      dmDatabase.ZQDocLine.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName
        ('database_selectdoclineondocid');
      dmDatabase.ZQDocLine.ParamByName('WdocId').AsInteger :=
        StrToIntDef(AIdList[i], 0);
      dmDatabase.ZQDocLine.Open;
      while not dmDatabase.ZQDocLine.Eof do
      begin

        If (dmDatabase.ZQDocLineWLineTypeID.Value <> 91) then
        If (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat >0 ) then
        begin
          LastStock.WStockID := dmDatabase.ZQDocLineWSTOCKID.AsInteger;
          StockLoadItem(LastStock);
          UpdateStockRecWithPriceForplugin(LastStock,
            TDataBaseStockRoutines.GetUnitQty(tblBatchWUNITID.AsInteger));

          if (LastStock.WStockTypeId in LocalSet) then
          begin

            StockQty :=
              (LastStock.FQtyOnHand -
              TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases
              (LastStock.WStockID, -1, dmDatabase.ZQDocLineWDocID.AsInteger));
            if StockQty < 0 then
            begin
              StockInHouse := false;
              if ErrorList <> '' then
                ErrorList := ErrorList + #13 + #10;
              ErrorList := ErrorList + 'Stock ' + LastStock.SSTOCKCODE + ' = ' +
                FloatToStr(StockQty);

            end;
          end;
        end;
        dmDatabase.ZQDocLine.next;
      end;

      if (DocGroupStockAvail <> 0) or (DocGroupStockNot <> 0) then
      begin
        dmDatabase.ZQDocHead.SQL.Text :=
          ' Select * from dochead where WDocId = ' + AIdList[i];
        dmDatabase.ZQDocHead.Open;
        dmDatabase.ZQDocHead.Edit;

        if StockInHouse then
        begin
          if DocGroupStockAvail <> 0 then
            dmDatabase.ZQDocHeadWREPORTINGGROUP2ID.AsInteger :=
              DocGroupStockAvail
        end
        else
        begin
          if DocGroupStockNot <> 0 then
            dmDatabase.ZQDocHeadWREPORTINGGROUP2ID.AsInteger :=
              DocGroupStockNot;
        end;
        dmDatabase.ZQDocHead.post;
        dmDatabase.ZQDocHead.close;
      end;
      AProgress.SetProgress('Processing invoices', i + 1);
    end;

    if ErrorList <> '' then
      ErrorList := format(DMTCCoreLink.GetTextLang(901504), ['']) + #13 + #10 +
        ErrorList + #13 + #10;

    ErrorList := ErrorList + ErrorText;

    if ErrorList <> '' then
      OSFMessageDlg(ErrorList, mtinformation, [mbYes], 0, true);

  finally
    AProgress.free;
  end;
end;

procedure TfmInvoiceEntryGrid.ConverttoInvoice1Click(Sender: TObject);
var
  DoDelete: Boolean;
  i, NewDocId: Integer;
  AExternalSendString: String;
  CreatedText: String;
  ModResult: TModalResult;
  AList: TStringList;
begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(642), mtConfirmation,
    [mbYes, mbNo], 0) = mrno then
    exit;

  CreatedText := DMTCCoreLink.GetTextLang(2894);

  if QDocHead.IsEmpty then
    exit;
  AList := TStringList.Create;
  try
    if DMTCCoreLink.ReadSysParam('ASKDELETECONVERT', 1, 0) = 0 then
    begin
      DoDelete := false;
    end
    else
    begin
      ModResult := OSFMessageDlg(format(GetTextLang(2881),
        [Trim(cbDocTypenew.Text)]), mtConfirmation, [mbYes, mbNo], 0);
      DoDelete := ModResult = mryes;
      if not(ModResult in [mryes, mrno]) then
        exit;
    end;

    if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
        if BForceSpecialRecalc then
          ReaplayITemsDicountsClick(nil);

        case LocalDocType of
          14:
            begin

              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 0, DoDelete, nil, Date, false,
                NewDocId);

              AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 +
                #10 + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 +
                'USERID=' + IntToStr(currentuser);;
              if (AExternalForm <> nil) then
              begin

                AExternalEditAddItemToDocPlugin.aMessageFormPlugin
                  (AExternalForm, pchar(AExternalSendString));
              end;
              SendMessageToPlugin(AExternalSendString);
              AList.Add(IntToStr(NewDocId));
              CreatedText := CreatedText + #13 + #10 +
                TDataBaseDocumentRoutines.GetDocumentLineText(NewDocId);
            end;
          15:
            begin

              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 1, DoDelete, nil, Date, false,
                NewDocId);

              AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 +
                #10 + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 +
                'USERID=' + IntToStr(currentuser);;
              if (AExternalForm <> nil) then
              begin
                AExternalEditAddItemToDocPlugin.aMessageFormPlugin
                  (AExternalForm, pchar(AExternalSendString));
              end;
              SendMessageToPlugin(AExternalSendString);
            end;
        end;

      end;
    end
    else
    begin
      case LocalDocType of
        14:
          begin
            if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE') and
              not(DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES']
              = 'TRUE') then
              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 7, DoDelete, nil, Date,
                false, NewDocId)
            else
              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 0, DoDelete, nil, Date, false,
                NewDocId);

            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            if (AExternalForm <> nil) then
            begin

              AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
                pchar(AExternalSendString));
            end;
            SendMessageToPlugin(AExternalSendString);
            AList.Add(IntToStr(NewDocId));
            CreatedText := CreatedText + #13 + #10 +
              TDataBaseDocumentRoutines.GetDocumentLineText(NewDocId);
          end;
        15:
          begin
            if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE') and
              not(DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES']
              = 'TRUE') then
              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 8, DoDelete, nil, Date,
                false, NewDocId)
            else
              CopyDocument(QDocHeadWDOCID.AsInteger,
                QDocHeadWACCOUNTID.AsInteger, 1, DoDelete, nil, Date, false,
                NewDocId);

            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            if (AExternalForm <> nil) then
            begin

              AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
                pchar(AExternalSendString));
            end;
            SendMessageToPlugin(AExternalSendString);
          end;
      end;
    end;
    CreatedText := CreatedText + #13 + #10;
    if LocalDocType = 14 then
      CheckStockAvailClick(AList, CreatedText);
  finally
    AList.free;

  end;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.PopupMenu2Popup(Sender: TObject);
var
  i: Integer;
  Amenu: TMenuItem;
  aQuery: TuniQuery;
begin
  ConverttoInvoice1.Visible := (LocalDocType in [14, 15]);
  Convertinvoicetopurchase1.Visible := (LocalDocType in [10, 14]);
  Changeaccount1.Visible := ((QDocHeadBPOSTED.AsInteger = 0) and
    (not ListIsReadOnly)) or (LocalDocType in [14, 15]);

  ReaplayITemsDicounts.Visible := (LocalDocType in [10, 14]);
  Invoicetoorderondefsupp11.Visible := (LocalDocType in [10, 14]);
  Copydocument1.Visible := (LocalDocType in [10, 11, 12, 13, 14, 15, 16, 17]);
  Convertdocumentstosingledocument1.Visible :=
    (LocalDocType in [12, 13, 14, 15, 16, 17]);
  Createpurchaseondefaultsupplier11.Visible := (LocalDocType in [15]);
  ConverttoCreditnote1.Visible := (LocalDocType in [10, 12]);
  Export1.Visible := DMTCCoreLink.ReadNwReportOp('PLEXPIMP_ON', false);
  if DisableItemsList <> '' then
    HandelSpecialUserMenu(self, '', DisableItemsList);

  Createbackorderstodeliver1.Visible := (LocalDocType in [10, 14, 16]);
  if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' then
  begin
    LinkToList.clear;
    for i := Links1.Componentcount - 1 downto 0 do
      Links1.components[i].free;
    aQuery := TuniQuery.Create(nil);
    try
      aQuery.Connection := DMTCCoreLink.TheZConnection;
      aQuery.SQL.Text := 'Select b.wdocid,trim( b.SDocno) || ' + QuotedStr(' ')
        + ' || trim(s.Sdescription) a ,0 b,a.Wdoclineid from docline a  join dochead b on a.wdocid = b.wdocid '
        + 'join stock s on a.WstockId = S.Wstockid ' +
        ' join DOC_LINK ad on a.WDOCID = ad.WFROMDOCID and a.WDOCLINEID = ad.WFROMDOCLINEID '
        + ' and ad.WTODOCID = ' + IntToStr(QDocHeadWDOCID.AsInteger) + ' union '
        + ' Select b.wdocid,trim( b.SDocno) || ' + QuotedStr(' ') +
        ' || trim(s.Sdescription) a ,1 b,a.Wdoclineid  ' +
        ' from docline a join dochead b on a.wdocid = b.wdocid join stock s on a.WstockId = S.Wstockid '
        + ' join DOC_LINK ad on a.WDOCID = ad.WTODOCID and a.WDOCLINEID = ad.WTODOCLINEID '
        + ' and ad.WFROMDOCID = ' + IntToStr(QDocHeadWDOCID.AsInteger) +
        ' order by 3,2';
      aQuery.Open;
      while not aQuery.Eof do
      begin
        Amenu := TMenuItem.Create(Links1);
        Amenu.caption := aQuery.Fields[1].AsString;
        Amenu.Tag := aQuery.Fields[0].AsInteger;
        LinkToList.Values[aQuery.Fields[0].AsString] :=
          aQuery.Fields[3].AsString;
        Amenu.OnClick := GoToDocFromTagOfSender;
        Links1.Add(Amenu);
        aQuery.next;
      end;
      Links1.Visible := not aQuery.IsEmpty;
    finally
      aQuery.free;
    end;
  end;

end;

procedure TfmInvoiceEntryGrid.PnlCommentExit(Sender: TObject);
begin
  if PnlComment.Visible then
    if not BtnCancel.Focused then
      BtnOkClick(self);
end;

procedure TfmInvoiceEntryGrid.CancelNext1Click(Sender: TObject);
begin
  if edtOrderNumber.CanFocus then
    edtOrderNumber.SetFocus;
  QDocHead.next;
  BEditClick(self);
end;

procedure TfmInvoiceEntryGrid.CancelPrev1Click(Sender: TObject);
begin
  if edtOrderNumber.CanFocus then
    edtOrderNumber.SetFocus;
  QDocHead.Prior;
  BEditClick(self);
end;

procedure TfmInvoiceEntryGrid.BProcessClick(Sender: TObject);
Var
  GotoDoc: String;
  i: Integer;
begin
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if (LocalDocType in [14, 15]) then
  begin
    ConverttoInvoice1Click(self);
    exit;
  end;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    GotoDoc := '';
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      if i = 0 then
        GotoDoc := QDocHeadSDOCNO.AsString
      else
        GotoDoc := GotoDoc + #13 + QDocHeadSDOCNO.AsString;
    end;
  end
  else
    GotoDoc := QDocHeadSDOCNO.AsString;
  QDocHead.close;
  tblBatch.close;
  tblBatchRefTotals.close;
  IsDeleteMode := false;
  fmUpdateInvoice := TfmUpdateInvoice.Create(self);
  try
    SetUpForm(fmUpdateInvoice);
    fmUpdateInvoice.GoToDocument := GotoDoc;
    fmUpdateInvoice.ShowModal;
  finally
    FreeAndNil(fmUpdateInvoice);
  end;
  RefreschDocumentList(-1);

  cbDocTypenewChange(self);
end;

procedure TfmInvoiceEntryGrid.BDeleteClick(Sender: TObject);

var
  i: Integer;
begin
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);
  if QDocHead.IsEmpty then
    exit;
  if not(OSFMessageDlg(GetTextLang(725) { 'Do want to Delete' } , mtinformation,
    [mbYes, mbNo], 0) = mryes) then
    exit;
  tblBatch.close;
  tblBatchRefTotals.close;
  try
    if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
        if (TDataBaseDocumentRoutines.GetDocType(QDocHeadWDOCID.AsInteger)
          in [14, 15]) or
          (TDataBaseDocumentRoutines.getDocPosted(QDocHeadWDOCID.AsInteger)
          = 0) then
        begin
          MyLocBatSerInput.DeleteDoc(QDocHeadWDOCID.AsInteger);
          ExecSql('delete from docline where WDocid =' +
            QDocHeadWDOCID.AsString);
          ExecSql('delete from dochead where WDocid =' +
            QDocHeadWDOCID.AsString);
        end;
      end;
    end
    else
    begin
      if (TDataBaseDocumentRoutines.GetDocType(QDocHeadWDOCID.AsInteger)
        in [14, 15]) or
        (TDataBaseDocumentRoutines.getDocPosted(QDocHeadWDOCID.AsInteger)
        = 0) then
      begin
        ExecSql('delete from docline where WDocid =' + QDocHeadWDOCID.AsString);
        ExecSql('delete from dochead where WDocid =' + QDocHeadWDOCID.AsString);
      end;
    end;
    DecrementDocNumber;
  finally
    RefreschDocumentList(-1);
  end;
end;

procedure TfmInvoiceEntryGrid.Changeaccount1Click(Sender: TObject);
begin
  // Exit if where looking at a posted one.
  if not(QDocHeadBPOSTED.AsInteger = 0) and not(LocalDocType in [15, 14]) then
  begin
    exit;
  end;
  if QDocHead.IsEmpty then
    exit;
  if LookAccType = 1 then
  // pull up the defaults for the debtor
  begin
    if Not Assigned(fmDebtor) then
      fmDebtor := TfmDebtor.Create(self);

    fmDebtor.UseCreditor := false;
    fmDebtor.AsFindScreen(true);
    fmDebtor.LocateId := QDocHeadWACCOUNTID.AsInteger;
    if fmDebtor.ShowModal <> mrok then
      exit;
    if fmDebtor.QDebtorCreditor.IsEmpty then
      exit;
    edtAccountNumber.Text := AddDashInAccCodeNoPRefix
      (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);
    edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

  end
  else
  // pull up the defaults for the Creditor
  begin
    if Not Assigned(fmDebtor) then
      fmDebtor := TfmDebtor.Create(self);

    fmDebtor.AsFindScreen(true);
    fmDebtor.UseCreditor := true;
    fmDebtor.LocateId := QDocHeadWACCOUNTID.AsInteger;
    if fmDebtor.ShowModal <> mrok then
      exit;
    if fmDebtor.QDebtorCreditor.IsEmpty then
      exit;
    edtAccountNumber.Text := AddDashInAccCodeNoPRefix
      (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);
    edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

  end;
  dmDatabase.tblDocHeader.SQL.Text := 'Select * from dochead where WDocid=' +
    QDocHeadWDOCID.AsString;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocHeader.Edit;
  dmDatabase.tblDocHeaderWAccountID.AsInteger := edtWAccountID;
  FillAccountInfoInDocHead(edtWAccountID, true);
  dmDatabase.tblDocHeader.post;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.EMessage3Exit(Sender: TObject);
Var
  S: String;
begin
  S := TEdit(Sender).Text;
  if GetAbreviation(S) then
  begin
    TEdit(Sender).Text := S;
  end;
end;

procedure TfmInvoiceEntryGrid.Pastefromclipboard1Click(Sender: TObject);
var
  Text, Sub: String;
  AList: TStringList;
  i: Integer;
begin
  // Exit if where looking at a posted one.
  if LastDocPosted then
  begin
    exit;
  end;

  EDelCompany.Text := '';
  EDelContact.Text := '';
  Text := Clipboard.AsText;
  if Text <> '' then;
  begin
    AList := TStringList.Create;

    AList.Text := Text;
    try

      if AList.Count = 5 then
      begin
        if AList.Count > 0 then
          ECompany.Text := AList[0];
        if AList.Count > 1 then
          EContact.Text := AList[1];

        if AList.Count > 2 then
          EPostal1.Text := AList[2];

        if AList.Count > 3 then
          EPostalCode.Text := AList[3];
        if AList.Count > 4 then
          CBCountry.ItemIndex := CBCountry.Items.IndexOf(AList[4]);
      end
      else
      begin
        if AList.Count > 0 then
          ECompany.Text := AList[0];
        if AList.Count > 1 then
          EPostal1.Text := AList[1];
        // if AList.Count > 2 then
        // EPostal3.Text :=  AList[2] ;
        if AList.Count > 2 then
          EPostalCode.Text := AList[2];
        if AList.Count > 3 then
          CBCountry.ItemIndex := CBCountry.Items.IndexOf(AList[3]);
      end;
      if POS(' ', EPostalCode.Text) > 0 then
      begin
        IF (CBCountry.Text = 'Netherlands') or
          (CBCountry.Text = 'Nederland') then

        begin
          Text := EPostalCode.Text;
          Sub := '';
          for i := 1 to Length(Text) do
          begin
            if Text[i] <> ' ' then
              Sub := Sub + Text[i];
            if Length(Sub) = 6 then
            begin
              Delete(Text, 1, i + 1);
              break;
            end;
          end;
          EPostal2.Text := Trim(Text);
          EPostalCode.Text := Trim(Sub);
        end
        else
        begin
          EPostal2.Text :=
            Trim(copy(EPostalCode.Text, POS(' ', EPostalCode.Text) + 1, 255));
          EPostalCode.Text :=
            Trim(copy(EPostalCode.Text, 1, POS(' ', EPostalCode.Text) - 1));
        end;
      end;

    finally
      AList.free;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.loadCurrentItem(LoadOnly: Boolean = false);

begin
  self.caption := TmpCaption;
  StatusBar.Panels[1].Text := self.caption;
  if tblBatchBRECONCILED.Value = 1 then
    exit;
  if tblBatchSREFERENCE.AsString = '' then
    exit;

  LastBatchLineId := tblBatchWLINEID.AsInteger;
  if not tblBatch.IsEmpty then
  begin
    if LastStock.SSTOCKCODE <> '' then
      LastActiveStockCode := LastStock.SSTOCKCODE;
    LastStock.SSTOCKCODE := tblBatchSREFERENCE.AsString;
    if ATempStockList.getStock(astockrecpointer,
      tblBatchSREFERENCE.AsString) then
    begin
      TDataBaseStockRoutines.SyncQty(astockrecpointer^, LocalDocType,
        LastDocHeaderId);
    end;
    LastStock := astockrecpointer^;
    // StockLoadItemOnCode(LastStock);
    if tblBatchSREFERENCE.AsString <> '' then
    begin
      if EditStockPrices and (LocalDocType in [12, 13, 15, 17]) then
      begin
        SetStockEditPrice;
      end;
      UpdateStockRecWithPriceForplugin(LastStock, tblBatchFUNITQTY.AsFloat);
    end;

    if LastStock.SSTOCKCODE = '' then
    begin
      if not LoadOnly then
      begin
        if tblBatchSREFERENCE.AsString = '' then
          SelectStockItem;
        if GoToStockQty then
          cxGrid1DBTableView1.Controller.FocusedColumnindex :=
            cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex
        else
          cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
      end;
    end;

    if (LastStock.FReorderQty <> -1) and (LocalDocType in [10, 12, 14, 15]) and
      (LastStock.WStockTypeId in CheckStockTypesSet) then
      if (LocalDocType in [10, 14]) then
        self.caption := TmpCaption + ',    ' +
          FloatToStrF(LastStock.FQtyOnHand - (LastStock.FUnpostedItems +
          Str2Float(tblBatchSCONTRAACCOUNT.AsString)), ffFixed, 18, 2) + ' ' +
          GetTextLang(507) + { on hand } '.'
      else
        self.caption := TmpCaption + ',    ' +
          FloatToStrF(LastStock.FQtyOnHand - (LastStock.FUnpostedItems -
          Str2Float(tblBatchSCONTRAACCOUNT.AsString)), ffFixed, 18, 2) + ' ' +
          GetTextLang(507) + { on hand } '.';

    if (LastStock.WStockTypeId in CheckStockTypesSet) and
      (LocalDocType in [10, 14]) then
      if (LastStock.FQtyOnHand - (LastStock.FUnpostedItems +
        Str2Float(tblBatchSCONTRAACCOUNT.AsString))) < 0 then
      begin
        if (LastStock.FReorderQty <> -1) and (LastStock.WStockID <> 0) and
          not(LocalDocType in [11, 12, 13, 15]) then
        begin
          if not NoOutOfStockMsg and not OutOfStockDrawColors then
            OSFMessageDlg(GetTextLang(506) + FloatToStrF(LastStock.FQtyOnHand -
              (LastStock.FUnpostedItems), ffFixed, 18, 2) + ' ' +
              GetTextLang(2150) + { items on hand } '.', mtinformation,
              [mbok], 0);
        end;
      end;
  end;
  StatusBar.Panels[1].Text := self.caption;
end;

procedure TfmInvoiceEntryGrid.SelectStockItem(JustAdd: Boolean = false);
var
  LocateCode, Freesqlname: String;
  aQuery: TuniQuery;
begin
  EditLineTimer.Enabled := false;
  if LoadingGridData then
    exit;
  if NBDocuments.PageIndex = 0 then
    exit;
  // reload current stock
  if (LastDocPosted) then
    exit;
  // loadCurrentItem(true) ;

  if (tblBatchBRECONCILED.AsInteger = 1) then
    exit;
  if IsComment then
    exit;
  if not JustAdd then
  begin
    ReturnLookup := '';
    repeat
      BBarCode := false;
      // 16 = sale 15 = purchase
      if (anewlocallook <> nil) and (anewlocallook.ECode.Tag = 1) then
      begin
        anewlocallook.ECode.Tag := 0;
      end
      else

        if not(EFastbarcodelookup.Focused) or
        (Trim(EFastbarcodelookup.Text) = '') then
      begin
        case LocalDocType of
          10, 11, 14, 16:
            begin
              if tblBatchSREFERENCE.Value <> '' then
                CallLookup(tblBatchSREFERENCE.Value, 16, 0, '', false)
              else
                CallLookup(LastActiveStockCode, 16, 0, '', false);
              Application.ProcessMessages;

            end;
          12, 13, 15, 17:
            begin
              if tblBatchSREFERENCE.Value <> '' then
                CallLookup(tblBatchSREFERENCE.Value, 17, 0, '', false)
              else
                CallLookup(LastActiveStockCode, 17, 0, '', false, nil,
                  edtWAccountID);
              Application.ProcessMessages;
            end;
        end;
      end
      else
      begin
        LocateCode := '';
        ReturnID := 0;

        if (LocalDocType in [10, 11, 14, 16]) then
          Freesqlname := 'FREESTOCKLOOKUP'
        else
          Freesqlname := 'FREESTOCKLOOKUPCR';

        if DMTCCoreLink.SQLList.GetFormatedSQLByName(Freesqlname) <> '' then
        begin
          aQuery := TuniQuery.Create(self);
          try
            aQuery.Connection := DMTCCoreLink.TheZConnection;
            aQuery.SQL.Text := TDatabaseTableRoutines.ReplaceParams
              (DMTCCoreLink.SQLList.GetFormatedSQLByName(Freesqlname),
              'ID=' + Trim(EFastbarcodelookup.Text) + #13 + #10 + 'WACCOUNTID='
              + IntToStr(edtWAccountID));
            aQuery.Open;
            if aQuery.RecordCount > 1 then
            begin
              while not aQuery.Eof do
              begin
                if LocateCode <> '' then
                  LocateCode := LocateCode + ',';
                LocateCode := LocateCode + aQuery.Fields[0].AsString;
                aQuery.next;
              end;
            end
            else
              ReturnID := aQuery.Fields[0].AsInteger;
          finally
            aQuery.free;
          end;
          if LocateCode <> '' then
          begin
            case LocalDocType of
              10, 11, 14, 16:
                begin
                  CallLookup('', 16, 0, '@ where WStockid in (' + LocateCode +
                    ')', false);

                end;
              12, 13, 15, 17:
                begin
                  CallLookup('', 17, 0, '@ where WStockid in (' + LocateCode +
                    ')', false);

                end;
            end;
          end;
        end;

        if ReturnID = 0 then

          ReturnID := TDataBaseStockRoutines.FindStockOnBarCode
            (Trim(EFastbarcodelookup.Text));
        if ReturnID = 0 then
          ReturnID := TDataBaseStockRoutines.FindStockOnSerial
            (Trim(EFastbarcodelookup.Text));
        if ReturnID = 0 then
          ReturnID := TDataBaseStockRoutines.GetStockid
            (Trim(EFastbarcodelookup.Text));
        if ReturnID = 0 then
          ReturnID := TDataBaseStockRoutines.FindStockOnSupCode
            (Trim(EFastbarcodelookup.Text));

        if ReturnID = 0 then
        begin
          if tblBatch.State = DsInsert then
            tblBatch.Cancel
          else
            tblBatch.Delete;
          SysUtils.Abort;
        end;
        ReturnLookup := TDataBaseStockRoutines.GetStockCode(ReturnID);
        // see if the line exsis

      end;
      if ReturnLookup = 'ESC' then
      begin
        if tblBatch.State = DsInsert then
        begin
          tblBatch.Cancel;

        end;
        exit;
      end;

      if ((ReturnLookup = '')) and (tblBatchSREFERENCE.AsString = '') then
      begin
        if tblBatch.State <> DsInsert then
        begin
          // Looks like its making a ite
          // showmessage('Select stockitem '+ReturnLookup);
          // showmessage(IntToStr(ReturnID));
          StatusBar.Panels[1].Text := 'Select stockitem ' + ReturnLookup + ' ' +
            IntToStr(ReturnID);
          if TDatabaseUserRoutines.GetUserCanEditStock(currentuser) then
          begin
            if not Assigned(AfmStockEntry) then

              AfmStockEntry := TfmStockEntry.Create(self);
            try

              (AfmStockEntry as TfmStockEntry).AddNewStockItem :=
                fmPosLookup.ECode.Text;
              (AfmStockEntry as TfmStockEntry).AddNewStockType :=
                fmPosLookup.CBField.ItemIndex;
              (AfmStockEntry as TfmStockEntry).ShowModal;
              ReturnLookup := (AfmStockEntry as TfmStockEntry)
                .tblStockAdSSTOCKCODE.AsString;
            finally
            end;
          end;
        end;
      end;
      If ReturnLookup = 'NEW' then
      begin
        if TDatabaseUserRoutines.GetUserCanEditStock(currentuser) then
        begin
          if not Assigned(AfmStockEntry) then
            AfmStockEntry := TfmStockEntry.Create(self);
          try
            StatusBar.Panels[1].Text := 'Select stockitem2 ' + ReturnLookup +
              ' ' + IntToStr(ReturnID);
            (AfmStockEntry as TfmStockEntry).AddNewStockItem :=
              fmPosLookup.ECode.Text;
            (AfmStockEntry as TfmStockEntry).AddNewStockType :=
              fmPosLookup.CBField.ItemIndex;
            (AfmStockEntry as TfmStockEntry).ShowModal;
            ReturnLookup := (AfmStockEntry as TfmStockEntry)
              .tblStockAdSSTOCKCODE.AsString;
          finally
          end;
        end;
        // gets set to a account by lookingup in stock.
        // ReturnLookup := 'NEW';
      end;
    Until (ReturnLookup <> 'BACK') AND (ReturnLookup <> 'NEW');

    if (ReturnLookup <> '') then
      if ReturnLookup[1] = '^' then // Comment Line
      begin
        Delete(ReturnLookup, 1, 1);
        Case StrToInt(ReturnLookup) of
          120: // F9
            begin
              tlbtnCommentClick(nil);
              exit;
            end;
        end;
      end;

  end; // end just add

  if ((ReturnLookup <> 'ESC') and (ReturnLookup <> '')) then
  begin
    // tblBatch.DisableControls;
    try
      tblBatch.Edit;
      if tblBatchSREFERENCE.AsString = '' then
        NewRecord := true;
      tblBatchSREFERENCE.Value := ReturnLookup;
      LastStock.SSTOCKCODE := ReturnLookup;
      if ATempStockList.getStock(astockrecpointer, ReturnLookup) then
      begin
        TDataBaseStockRoutines.SyncQty(astockrecpointer^, LocalDocType,
          LastDocHeaderId);
      end;
      LastStock := astockrecpointer^;
      ApplyStockCodeToCurrentRecord;

      // ATempStockList.getStock(AStockPointer,ReturnLookup)
      // LastStock.WStockID := ReturnID ;
      if ATempStockList.getStock(astockrecpointer, ReturnLookup) then
      begin
        TDataBaseStockRoutines.SyncQty(astockrecpointer^, LocalDocType,
          LastDocHeaderId);
      end;
      LastStock := astockrecpointer^;
      // StockLoadItem(LastStock);

      if EditStockPrices and (LocalDocType in [12, 13, 15, 17]) then
      begin
        SetStockEditPrice;
      end;
    finally
      // tblBatch.EnableControls;
    end;

    if (LastStock.WStockTypeId = 10) then
    begin
      fmStockLinkDetail.InitFromStockDocLine(LastStock.WStockID,
        tblBatchWLINEID.AsInteger);
      fmStockLinkDetail.InitCheckStart;
      tblBatch.Edit;
      tblBatchSDESCRIPTION.AsString := LastStock.SDescription;
      tblBatchSCONTRAACCOUNT.AsFloat := fmStockLinkDetail.GetLastTotalQty;
      tblBatchSACCOUNT.AsFloat := tblBatchSCONTRAACCOUNT.AsFloat;
      tblBatch.post;
      ApplyStockCodeToCurrentRecord;

      UpdateTotalsLbls;
      exit;
    end;

    self.caption := TmpCaption;

    if (LastStock.FReorderQty <> -1) and
      (LastStock.WStockTypeId in CheckStockTypesSet) and
      (LocalDocType in [10, 12, 14, 15, 16]) then
      if (LocalDocType in [10, 14]) then
        self.caption := TmpCaption + ',    ' +
          FloatToStrF(LastStock.FQtyOnHand - (LastStock.FUnpostedItems +
          Str2Float(tblBatchSCONTRAACCOUNT.AsString)), ffFixed, 18, 2) + ' ' +
          GetTextLang(507) + { on hand } '.'
      else
        self.caption := TmpCaption + ',    ' +
          FloatToStrF(LastStock.FQtyOnHand - (LastStock.FUnpostedItems -
          Str2Float(tblBatchSCONTRAACCOUNT.AsString)), ffFixed, 18, 2) + ' ' +
          GetTextLang(507) + { on hand } '.';

    if (LastStock.FQtyOnHand - (LastStock.FUnpostedItems +
      Str2Float(tblBatchSCONTRAACCOUNT.AsString)) < 0) and
      (LocalDocType in [10, 12, 14, 15]) then
    begin

      if (LastStock.FReorderQty <> -1) and (LastStock.WStockID <> 0) and
        (LocalDocType in [10, 14, 16]) then
        if not(LastStock.WStockTypeId in [1, 2, 3, 4, 5, 6, 7, 8]) then
        begin
          if not NoOutOfStockMsg and not OutOfStockDrawColors then
            OSFMessageDlg(GetTextLang(506) + FloatToStrF(LastStock.FQtyOnHand -
              (LastStock.FUnpostedItems), ffFixed, 18, 2) + ' ' +
              GetTextLang(2150) + { items on hand } '.', mtinformation,
              [mbok], 0);
        end;

    end;
    StatusBar.Panels[1].Text := self.caption;

    // see if its options
    if (LastStock.WStockTypeId in [7, 8]) then
    begin
      LocateCode := '';
      if (EFastbarcodelookup.Focused) and
        (Trim(EFastbarcodelookup.Text) <> '') then
        LocateCode := EFastbarcodelookup.Text;

      ApplyStockCodeToCurrentRecord;
      DocSelectOptions.lstQty :=
        StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 0);
      DocSelectOptions.lstTotal := tblBatchFCREDIT.AsFloat;

      if (LocalDocType in [10, 11, 14, 16]) then
      begin
        if DefaultTaxId <> 0 then
          DocSelectOptions.InitForStock(LastStock.WStockID,
            tblBatchWLINEID.AsInteger, DefaultTaxId, not ExclMode, LocateCode)
        else
          DocSelectOptions.InitForStock(LastStock.WStockID,
            tblBatchWLINEID.AsInteger, LastStock.WOutputTaxID, not ExclMode,
            LocateCode)
      end
      else
      begin
        if DefaultTaxId <> 0 then
          DocSelectOptions.InitForStock(LastStock.WStockID,
            tblBatchWLINEID.AsInteger, DefaultTaxId, not ExclMode, LocateCode)
        else
          DocSelectOptions.InitForStock(LastStock.WStockID,
            tblBatchWLINEID.AsInteger, LastStock.WInputTaxID, not ExclMode,
            LocateCode);
      end;

      tblBatch.Edit;
      tblBatchSCONTRAACCOUNT.AsFloat := DocSelectOptions.lstQty;
      tblBatchSACCOUNT.AsFloat := DocSelectOptions.lstQty;
      if DocSelectOptions.lstQty <> 0 then
        tblBatchFDEBIT.AsFloat := DocSelectOptions.lstTotal /
          DocSelectOptions.lstQty;
      tblBatchFCREDIT.AsFloat := DocSelectOptions.lstTotal;
      tblBatchSDESCRIPTION.Value := LastStock.SDescription;
      if not ExclMode then
      begin
        if tblBatchWTAXID.AsInteger <> 0 then
        begin
          tblBatchFCREDIT.AsFloat := tblBatchFCREDIT.AsFloat *
            aAccountRecList.gettaxrateonId(tblBatchWTAXID.AsInteger);
          tblBatchFDEBIT.AsFloat := tblBatchFDEBIT.AsFloat *
            aAccountRecList.gettaxrateonId(tblBatchWTAXID.AsInteger);
        end;
      end;
      UpdateTotalsLbls;
    end
    else
    // see if its financial.
      if LastStock.WStockTypeId = 6 then
    begin

      CallLookup(tblBatchSREFERENCE.AsString, 0,
        tblBatchWCONTRAACCOUNTID.AsInteger, LastStock.sExtraDesc);
      tblBatch.Edit;
      tblBatchSDESCRIPTION.AsString := TDataBaseRoutines.GetAccountDescription
        (ReturnID);
      tblBatchWCONTRAACCOUNTID.AsInteger := ReturnID;
    end
    else
    begin

      // if not (LastStock.WStockTypeId in [7,8]) then
      UpdateStockRecWithPriceForplugin(LastStock, tblBatchFUNITQTY.AsFloat);
      LastStock.FUnpostedItems :=
        TDataBaseStockRoutines.GetUnpostedStockItemCount(LastStock.WStockID,
        LastDocHeaderId);
      if LocalDocType = 14 then
      begin
        LastStock.FUnpostedItems := LastStock.FUnpostedItems +
          LastStock.FminimumQty;
        LastStock.FUnpostedItems := LastStock.FUnpostedItems +
          TDataBaseStockRoutines.GetUnpostedStockITemCountFromType
          (LastStock.WStockID, 14, LastDocHeaderId);
      end;

      tblBatch.Edit;
      if tblBatchSCONTRAACCOUNT.AsString = '' then
        tblBatchSCONTRAACCOUNT.AsString := '1';
      if tblBatchSACCOUNT.AsString = '' then
        tblBatchSACCOUNT.AsString := '1';

      tblBatchSDESCRIPTION.Value := LastStock.SDescription;
      tblBatchWCONTRAACCOUNTID.AsInteger := 0;

      if tblBatchFTAXAMOUNT.AsFloat = 0 then
        tblBatchFTAXAMOUNT.AsFloat := GlobalDiscount;
    end;
    if not(LastStock.WStockTypeId in [7, 8]) then
      ApplyStockCodeToCurrentRecord;
    { end else
      begin
      tblBatch.edit ;
      tblBatchSREFERENCE.Value := LastStock.SSTOCKCODE; }
  end;
  if AExternalForm <> nil then
  begin
    AExternalSendString := 'EDITLINE=' + IntToStr(LastDocHeaderId) + #13 + #10 +
      GetPluginLineString;
    AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
      pchar(AExternalSendString));
    AExternalSendString := tblBatchWLINEID.AsString;
    tblBatch.close;
    tblBatch.Open;
    tblBatch.Locate('WLINEID', AExternalSendString, []);
    UpdateTotalsLbls;
  end;

  if (LastStock.WStockTypeId = 0) and
    (LocalDocType in [10, 11, 12, 13, 16, 17]) then
  begin
    if EFastbarcodelookup.Focused and (Trim(EFastbarcodelookup.Text) <> '') then
      MyLocBatSerInput.GoToSerial := EFastbarcodelookup.Text
    else
      MyLocBatSerInput.GoToSerial := '';

    MyLocBatSerInput.LoadData(LastDocHeaderId, tblBatchWLINEID.AsInteger,
      LastStock.WStockID);
    if MyLocBatSerInput.ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger > 0 then
    begin
      tblBatch.Edit;
      tblBatchSCONTRAACCOUNT.AsFloat := MyLocBatSerInput.GetLastTotalQty;
      tblBatchSACCOUNT.Value := tblBatchSCONTRAACCOUNT.Value;
      UpdateStockRecWithPriceForplugin(LastStock, tblBatchFUNITQTY.AsFloat);
      ApplyStockCodeToCurrentRecord;

      cxGrid1DBTableView1.Controller.FocusedColumnindex :=
        cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex ;
      CalcAmounts;
      UpdateTotalsLbls;
    end;

  end;

end;

procedure TfmInvoiceEntryGrid.ApplyStockCodeToCurrentRecord
  (UseOrgPrice: Boolean = false);
var
  ReorderLevel: Integer;

  Unitid: String;
  ADiscount: Double;
begin
  if (LastDocPosted) then
    exit;
  if (tblBatchBRECONCILED.AsInteger = 1) then
    exit;
  tblBatch.Edit;
  if tblBatchSCONTRAACCOUNT.AsString = '' then
    tblBatchSCONTRAACCOUNT.AsString := '1';
  if tblBatchSACCOUNT.AsString = '' then
    tblBatchSACCOUNT.AsString := '1';

  tblBatchWREPORTINGGROUP1ID.AsInteger := LastStock.WDefaultLinegroup1id;
  if LastStock.WStockTypeId = 10 then
  begin
    tblBatchFUNITQTY.AsFloat := 1;
    if ExclMode then
    begin
      tblBatchFDEBIT.Value := fmStockLinkDetail.TotExcl;
      tblBatchFCREDIT.Value := fmStockLinkDetail.TotExcl /
        fmStockLinkDetail.GetLastTotalQty;
    end
    else
    begin
      tblBatchFDEBIT.Value := fmStockLinkDetail.TotInc;
      tblBatchFCREDIT.Value := fmStockLinkDetail.TotInc /
        fmStockLinkDetail.GetLastTotalQty;
    end;

    tblBatchFTAXAMOUNT.Value := 0;
    tblBatchSTAX.ReadOnly := false;
    tblBatchSTAX.clear;
    tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;

    exit;
  end;

  // tblBatch.DisableControls;
  try
    case IntSellingPrice of
      0, 1:
        DefaultPrice := LastStock.FPrice1;
      2:
        DefaultPrice := LastStock.FPrice2;
      3:
        DefaultPrice := LastStock.FPrice3;
    end;

    if (LastStock.FDiscount <> 0) then
    begin
      DefaultPrice := FixAmount(LastStock.FSellingPrice,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
    end;
    tblBatch.DisableControls;
    try

      if DMTCCoreLink.SQLList.SQLCollection.GetItemByName
        ('CUST_SELECTUNITONCRED') <> nil then
      begin
        Unitid := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
          (TDatabaseTableRoutines.ReplaceParams
          (DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTUNITONCRED'),
          'WACCOUNTID=' + IntToStr(edtWAccountID) + #13 + #10 + 'WSTOCKID=' +
          IntToStr(LastStock.WStockID))));
        tblBatchWUNITID.AsInteger := StrToIntDef(Unitid, 0);
      end
      else
      begin
        if tblBatchWUNITID.AsInteger = 0 then
          tblBatchWUNITID.AsInteger := LastStock.WUnitId;
      end;

      if DMTCCoreLink.ExtraOptions.Values['BUSEDATEFFROMMLTP'] <> 'TRUE' then
        tblBatchFUNITQTY.AsFloat := TDataBaseStockRoutines.GetUnitQty
          (tblBatchWUNITID.AsInteger)
      else
        tblBatchFUNITQTY.AsFloat := 1;
    finally
      tblBatch.EnableControls;
    end;
    if LocalDocType in [12, 13, 15, 17] then
    begin
      DefaultPrice := LastStock.FUnitCost;
      // if not UseOrgPrice then
      tblBatchFDEBIT.Value := DefaultPrice * tblBatchFUNITQTY.AsFloat;
      tblBatchFCREDIT.Value :=
        FixAmount((StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 1)) *
        tblBatchFDEBIT.Value, dmDatabase.SetOfBooksPropertys.DataParameter.
        WDocRowDecimals);
      if DMTCCoreLink.SQLList.SQLCollection.GetItemByName
        ('CUST_SELECTDISCOUNTSTOCKCRED') <> nil then
      begin
        ADiscount := StrToFloatDef
          (VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
          (TDatabaseTableRoutines.ReplaceParams
          (DMTCCoreLink.SQLList.GetFormatedSQLByName
          ('CUST_SELECTDISCOUNTSTOCKCRED'),
          'WACCOUNTID=' + IntToStr(edtWAccountID) + #13 + #10 + 'WSTOCKID=' +
          IntToStr(LastStock.WStockID)))), 0);
        tblBatch.DisableControls;
        try
          tblBatchWUNITID.AsInteger := StrToIntDef(Unitid, 0);
        finally
          tblBatch.EnableControls;
        end;

        // tblBatchFCREDIT.Value :=FixAmount((StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString,1)  ) * tblBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
        tblBatchFTAXAMOUNT.Value := ADiscount;
        if tblBatchFTAXAMOUNT.Value <> 0 then
          tblBatchFCREDIT.Value := tblBatchFUNITQTY.AsFloat *
            (FixAmount(tblBatchFDEBIT.Value *
            (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
            dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
            ((tblBatchFDEBIT.Value * Str2Float(tblBatchSCONTRAACCOUNT.AsString))
            * (tblBatchFTAXAMOUNT.Value / 100)))
      end
      else

        if BPriceAgreeUseOrgPrice then
      begin

        tblBatchFDEBIT.Value := TDataBaseStockRoutines.getLastStockCost
          (LastStock.WStockID) * tblBatchFUNITQTY.AsFloat;
        tblBatchFTAXAMOUNT.Value :=
          ((tblBatchFDEBIT.Value * (Str2Float(tblBatchSCONTRAACCOUNT.AsString)))
          - tblBatchFCREDIT.Value);
        if tblBatchFTAXAMOUNT.Value <> 0 then
          if tblBatchFDEBIT.Value <> 0 then
            tblBatchFTAXAMOUNT.Value :=
              (tblBatchFTAXAMOUNT.Value /
              ((tblBatchFDEBIT.Value *
              (Str2Float(tblBatchSCONTRAACCOUNT.AsString)))) * 100)
          else
            tblBatchFTAXAMOUNT.Value := 0;
      end;

    end
    else
    begin
      if not ExclMode then
        DefaultPrice := DefaultPrice * LastStock.FOutputRate;

      if (not UseOrgPrice) or (not BPriceAgreeUseOrgPrice) then
        tblBatchFDEBIT.Value := DefaultPrice * tblBatchFUNITQTY.AsFloat;

      tblBatchFCREDIT.Value :=
        FixAmount((StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 1)) *
        tblBatchFDEBIT.Value, dmDatabase.SetOfBooksPropertys.DataParameter.
        WDocRowDecimals);
      if LastStock.BApplyDiscount then
      begin
        // if not UseOrgPrice then
        if UseOrgPrice then
        begin
          if (tblBatchFDEBIT.Value <> 0) then
            tblBatchFTAXAMOUNT.Value := FixAmount(GlobalDiscount);
        end
        else
          tblBatchFTAXAMOUNT.Value := FixAmount(GlobalDiscount);

        if LastStock.FDiscount <> 0 then
        begin
          // if not UseOrgPrice then
          if UseOrgPrice then
          begin
            if (tblBatchFDEBIT.Value <> 0) then

              tblBatchFTAXAMOUNT.Value := FixAmount(LastStock.FDiscount, 2)
          end
          else
            tblBatchFTAXAMOUNT.Value := FixAmount(LastStock.FDiscount, 2);
          case IntSellingPrice of
            0, 1:
              DefaultPrice := LastStock.FPrice1;
            2:
              DefaultPrice := LastStock.FPrice2;
          else
            DefaultPrice := LastStock.FPrice3;
          end;
          if not UseOrgPrice then
            tblBatchFDEBIT.Value := DefaultPrice;
        end
        else
        begin
          if (tblBatchFTAXAMOUNT.Value > 0) and
            (tblBatchSCONTRAACCOUNT.Value <> '') then
            tblBatchFCREDIT.Value :=
              FixAmount(tblBatchFDEBIT.Value *
              (Str2Float(tblBatchSCONTRAACCOUNT.Value)),
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals) -
              ((tblBatchFDEBIT.Value * (Str2Float(tblBatchSCONTRAACCOUNT.Value))
              ) * (tblBatchFTAXAMOUNT.Value / 100))
          else
            tblBatchFCREDIT.Value :=
              FixAmount(Str2Float(tblBatchFDEBIT.AsString) *
              (Str2Float(tblBatchSCONTRAACCOUNT.AsString)),
              dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        end;
      end
      else
        tblBatchFTAXAMOUNT.Value := 0;
    end; // End Geting Prices.
  finally
    // tblBatch.EnableControls;
  end;
  if not(tblBatch.State in [dsedit, DsInsert]) then
    tblBatch.Edit;
  tblBatchSTAX.ReadOnly := false;

  if DefaultTaxId <> 0 then
  begin

    tblBatchSTAX.AsString := AddDashInAccCodeNoPRefix
      (GetAccountCode(DefaultTaxId));
    tblBatchWTAXID.AsInteger := DefaultTaxId;
  end
  else
  begin
    if LocalDocType in [12, 13, 15] then
    begin
      tblBatchSTAX.Value := AddDashInAccCodeNoPRefix(LastStock.SInTax);
      tblBatchWTAXID.AsInteger := LastStock.WInputTaxID;
    end
    else
    begin
      tblBatchWTAXID.AsInteger := LastStock.WOutputTaxID;
      tblBatchSTAX.Value := AddDashInAccCodeNoPRefix(LastStock.SOutTax);
    end;
  end;
  tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
  if SelfCheckStockCode then
    OSFMessageDlg(LastStock.SDescription + #13#10 + GetTextLang(965), mtWarning,
      [mbok], 0);
  UpdateTotalsLbls;

  if (LastStock.WStockTypeId in CheckStockTypesSet) then
  begin
    ReorderLevel := Round(LastStock.FReorderQty);
    if (LocalDocType in [10, 14]) then
      TempQtyOnHand := LastStock.FQtyOnHand -
        (LastStock.FUnpostedItems + (Str2Float(tblBatchSCONTRAACCOUNT.AsString)
        * tblBatchFUNITQTY.AsFloat))
    else
      TempQtyOnHand := LastStock.FQtyOnHand -
        (LastStock.FUnpostedItems - (Str2Float(tblBatchSCONTRAACCOUNT.AsString)
        * tblBatchFUNITQTY.AsFloat));

    if ((ReorderLevel = -1) or not(LastStock.WStockTypeId in CheckStockTypesSet)
      ) or not(LocalDocType in [10, 12, 14, 15]) then
      self.caption := TmpCaption
    else
    begin
      self.caption := TmpCaption + ',    ' + FloatToStrF(TempQtyOnHand, ffFixed,
        18, 2) + ' ' + GetTextLang(507) + { on hand } '.';
    end;
    StatusBar.Panels[1].Text := self.caption;
  end;
  { if not tblBatch.IsEmpty then
    begin
    ABookmark := tblBatch.Bookmark ;
    tblBatch.First ;
    tblBatch.Bookmark := ABookmark ;
    end; }
end;

function TfmInvoiceEntryGrid.SelfCheckStockCode: Boolean;
begin
  case TStockTypes(LastStock.WStockTypeId) of
    stAccountin, StLinkedItems:
      result := false;

    stBOM, stSales, stSalesNoStock, stOptionsNoStock, stBomProd:
      begin
        result := (LastStock.WSaleSACCOUNTId = 0)
      end;
    stPurchaes, stPurchaesNoStock:
      begin
        result := (LastStock.WStockAccountId = 0)
      end;

  else
    begin
      if dmDatabase.SetOfBooksPropertys.CompanyInfo.CreateCostOfSales then
        result := (LastStock.WConstOfSaleSACCOUNTId = 0) or
          (LastStock.WStockAccountId = 0) or (LastStock.WSaleSACCOUNTId = 0)
      else
        result := (LastStock.WStockAccountId = 0) or
          (LastStock.WSaleSACCOUNTId = 0)
    end;
  end;

end;

procedure TfmInvoiceEntryGrid.dtpDuedateExit(Sender: TObject);
begin
  if (dtpDate.Date) > dtpDuedate.Date then
  begin
    OSFMessageDlg(GetTextLang(2895), mtWarning, [mbok], 0);
    try
      // dtpDuedate.Date := dtpDate.Date ;
    except
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.cbViewUnPostedClick(Sender: TObject);
begin
  // allow loading without refresh
  if cbViewUnPosted2.Tag = 0 then
    RefreschDocumentList(-1);

end;

function TfmInvoiceEntryGrid.GetSaveListPRefix: String;
begin
  If currentuser = 0 then
  begin
    if ListIsReadOnly then
      result := 'LR_'
    else
      result := '';
  end
  else
  begin
    if ListIsReadOnly then
      result := IntToStr(currentuser) + 'LR_'
    else
      result := IntToStr(currentuser) + '_';
  end;
  if LookupFrom <> 0 then
    result := IntToStr(LookupFrom) + result;
end;

procedure TfmInvoiceEntryGrid.DBGSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if NBDocuments.PageIndex = 0 then
    if Key = ' ' then
    begin
      if BNew.Enabled then
        BNew.Click;
    end
    else if Key = #13 then
      BEditClick(self);

end;

procedure TfmInvoiceEntryGrid.Printbarcodes1Click(Sender: TObject);
var
  AList: TStringList;
  i: Integer;
begin
  if QDocHead.IsEmpty then
    exit;
  LastDocHeaderId := QDocHeadWDOCID.AsInteger;

  AList := TStringList.Create;
  try
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin

      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      AList.Add(QDocHeadWDOCID.AsString);
    end;

    if AList.Count = 0 then
      exit;

    if CheckReportMan(cbDestination.ItemIndex, 0, PrnVars.NumCopies, 0,
      'OSFPRINTER=2'#10#13'TCVAR_DocID=' + AList[0], 'barcodes', 'GENERAL') then
    begin
      for i := 1 to AList.Count - 1 do
      begin
        CheckReportMan(cbDestination.ItemIndex, 0, PrnVars.NumCopies, 0,
          'OSFPRINTER=2'#10#13'TCVAR_DocID=' + AList[i], 'barcodes', 'GENERAL');
      end;
      exit;
    end;
  finally
    AList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.Printlabel1Click(Sender: TObject);
var
  AList: TStringList;
  i: Integer;
begin

  if QDocHead.IsEmpty then
    exit;
  LastDocHeaderId := QDocHeadWDOCID.AsInteger;
  AList := TStringList.Create;

  try
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin

      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      AList.Add(QDocHeadWDOCID.AsString);
    end;

    if AList.Count = 0 then
      exit;

    if CheckReportMan(cbDestination.ItemIndex, 0, PrnVars.NumCopies, 0,
      'OSFPRINTER=3'#10#13'TCVAR_DocID=' + IntToStr(LastDocHeaderId), 'labels',
      'GENERAL') then
    begin

      for i := 1 to AList.Count - 1 do
      begin
        CheckReportMan(cbDestination.ItemIndex, 0, PrnVars.NumCopies, 0,
          'OSFPRINTER=3'#10#13'TCVAR_DocID=' + AList[i], 'labels', 'GENERAL');
      end;
      exit;
    end;

  finally
    AList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.edtOrderNumberExit(Sender: TObject);
begin
  if dmDatabase.SetOfBooksPropertys.DataParameter.CheckDocReferenceUsed then
    if Trim(edtOrderNumber.Text) <> '' then
    begin
      dmDatabase.qGen.SQL.Text :=
        'select * from dochead where upper(SREFERENCE) =:Ref and WTypeID =:Type and WDocId <> '
        + IntToStr(LastDocHeaderId) + ' and  WAccountid = ' +
        IntToStr(edtWAccountID);
      dmDatabase.qGen.Params[0].AsString :=
        UPPERCASE(Trim(edtOrderNumber.Text));
      dmDatabase.qGen.Params[1].AsInteger := LocalDocType;
      dmDatabase.qGen.Open;
      if not dmDatabase.qGen.IsEmpty then
      begin
        OSFMessageDlg(GetTextLang(3010)
          { 'The reference has been used in a other document please check your input for doubles' } ,
          mtWarning, [mbok], 0);
      end;
    end;
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceExit(Sender: TObject);
begin
  // Fixed focus change from grid.
  InGrid := true;

end;

procedure TfmInvoiceEntryGrid.BtnCloseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  InGrid := false;
end;

procedure TfmInvoiceEntryGrid.BtnOkPrintMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  InGrid := false;
end;

procedure TfmInvoiceEntryGrid.BtnClose2Click(Sender: TObject);
begin
  close;
end;

procedure TfmInvoiceEntryGrid.dtpDateChange(Sender: TObject);
begin

  try

    dtpDuedate.Date := StrToDateDef(dtpDate.Text, dtpDate.Date) +
      dtpDuedate.Tag;
  except
  end;

end;

procedure TfmInvoiceEntryGrid.DecrementDocNumber;
var
  i: Integer;
  TryAgain: Boolean;
begin
  TryAgain := true;
  i := 0;
  While TryAgain do
  begin
    try
      TryAgain := false;
      dmDatabase.tblUser.close;
      dmDatabase.tblUser.Open;
      // done : Pieter This makes a global numbering posible
      if ReadReportOp('BUseGeneralNumber', 'false').AsBoolean then
        dmDatabase.tblUser.Locate('WUserID',
          DMTCCoreLink.ReadSysParam('IUserGeneralNumber',
          StrToInt(VarToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber', 0)
          )), DMTCCoreLink.currentuser, 0), [])
      else
        dmDatabase.tblUser.Locate('WUserID', currentuser, []);
      dmDatabase.tblUser.Edit;
    except
      inc(i);
      if i < 5 then
        TryAgain := true
      else
        raise Exception.Create(GetTextLang(2059));
      sleep(100);
    end;
  end;
  // done : Pieter Locking case (after edit = lock)

  // done : Pieter multy user precoursion this way the number is unique.
  Case LocalDocType of
    11:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSCreditNoteNextNumber.
          Value, -1)))) = '' then
          dmDatabase.tblUserSCreditNoteNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSCreditNoteNextNumber.Value, -1);
      end;
    12:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSPurchaseNextNumber.
          Value, -1)))) = '' then
          dmDatabase.tblUserSPurchaseNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSPurchaseNextNumber.Value, -1);
      end;
    13:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSGoodsReturnedNextNumber.
          Value, -1)))) = '' then
          dmDatabase.tblUserSGoodsReturnedNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSGoodsReturnedNextNumber.
            Value, -1);
      end;
    14:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSQuoteNextNumber.Value,
          -1)))) = '' then
          dmDatabase.tblUserSQuoteNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSQuoteNextNumber.Value, -1);
      end;
    15:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSOrderNextNumber.Value,
          -1)))) = '' then
          dmDatabase.tblUserSOrderNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSOrderNextNumber.Value, -1);
      end;
    10:
      begin
        if VarToStr(OpenSqlAndGetFirtsColumnValue
          ('select SDocNo from docHEad where WTypeid = ' +
          IntToStr(LocalDocType) + ' and SDocNo =' +
          QuotedStr(_IncrementString(dmDatabase.tblUserSInvoiceNextNumber.Value,
          -1)))) = '' then
          dmDatabase.tblUserSInvoiceNextNumber.Value :=
            _IncrementString(dmDatabase.tblUserSInvoiceNextNumber.Value, -1);
      end;
  end;
  dmDatabase.tblUser.post;
  dmDatabase.tblUser.close;
end;

procedure TfmInvoiceEntryGrid.OpenCopySql;
Var
  SQLString, OrderByString: String;
begin
  if not CBAllDocuments.Checked then
  begin
    case LocalDocType of
      11, 14, 10, 16:
        begin
          SQLString :=
            'DocHead.WTypeID in (11,14,10,16)  and DocHead.SDocNo <> ' +
            QuotedStr('') + ' and DocHead.WDocId <> ' +
            IntToStr(LastDocHeaderId);
        end;
    else
      begin
        SQLString := 'DocHead.WTypeID in (12,13,15,17)  and DocHead.SDocNo <> '
          + QuotedStr('') + ' and DocHead.WDocId <> ' +
          IntToStr(LastDocHeaderId);
      end;
    end
  end
  else
    SQLString := 'DocHead.SDocNo <> ' + QuotedStr('') +
      ' and DocHead.WDocId <> ' + IntToStr(LastDocHeaderId);

  if CBOnlyThisDebtor.Checked then
    SQLString := SQLString + ' and DocHead.WAccountId=' +
      IntToStr(edtWAccountID);

  if Trim(ECopyFilter.Text) <> '' then
    SQLString := SQLString + ' and SDocNo like' +
      QuotedStr('%' + ECopyFilter.Text + '%');

  if CopyOrderDirection then
    OrderByString := IntToStr(CopyOrderCol + 1)
  else
    OrderByString := IntToStr(CopyOrderCol + 1) + ' desc';
  OpenDocSql(SQLString, OrderByString);
end;

procedure TfmInvoiceEntryGrid.BCopyFilterClick(Sender: TObject);
begin
  OpenCopySql;
end;

procedure TfmInvoiceEntryGrid.DBGSearchColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  LastIndex: Integer;
begin
  LastIndex := CBFindColumn.ItemIndex;
  DoDropDownLookup;
  if LastIndex < CBFindColumn.Items.Count then
    CBFindColumn.ItemIndex := LastIndex;
end;

procedure TfmInvoiceEntryGrid.QDocHeadOPENAMOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
Var
  AString: String;
  aValue: Extended;
begin

  aValue := 0;
  // make the amount the doc amount for unposed and order / quotes
  if DisplayText then
    if ((QDocHeadBPOSTED.AsInteger = 0) or (LocalDocType in [14, 15])) then
    begin
      if QDocHeadFDOCAMOUNT.AsFloat <> 0 then
      begin
        if fmInvocePayment.ZQGetPaymentTypes.IsEmpty then
        begin
          Text := formatfloat(QDocHeadFDOCAMOUNT.DisplayFormat,
            QDocHeadFDOCAMOUNT.AsFloat);
        end
        else
        begin
          AString := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
            ('Select sum(FINCLUSIVEAMT) from docline where WLINETYPEID = 93 and Wdocid = '
            + IntToStr(QDocHeadWDOCID.AsInteger)));
          Text := formatfloat(QDocHeadFDOCAMOUNT.DisplayFormat,
            QDocHeadFDOCAMOUNT.AsFloat + StrToFloatDef(AString, aValue));
        end;
      end;
    end
    else
    begin
      if QDocHeadOPENAMOUNT.AsFloat <> 0 then
        Text := formatfloat(QDocHeadFDOCAMOUNT.DisplayFormat,
          Abs(QDocHeadOPENAMOUNT.AsFloat));
    end;

end;

procedure TfmInvoiceEntryGrid.Openitem1Click(Sender: TObject);
begin
  if QDocHeadWACCOUNTID.AsInteger = 0 then
    exit;
  fmOpenLink := TfmOpenLink.Create(self);
  try
    fmOpenLink.aAccInfo.WAccountID := QDocHeadWACCOUNTID.AsInteger;
    fmOpenLink.CalledAsLookup;
    fmOpenLink.UpdateAccountInfo;

    fmOpenLink.ShowModal;
    RefreschDocumentList(fmOpenLink.aAccInfo.WAccountID);
  finally

    FreeAndNil(fmOpenLink);
  end;
end;

procedure TfmInvoiceEntryGrid.openOSCommerceorderinbrowser1Click
  (Sender: TObject);
Var
  AOpenText, Url: String;
begin
  if QDocHead.IsEmpty then
    exit;
  // try to load default
  Url := copy(QDocHeadSREFERENCE.AsString, 1, 2);
  Url := ReadLongReportOp(Url + 'OSCOMMERCEINVOICELINK');
  if Url = '' then
    Url := OSCommerceLinkDocURL;

  AOpenText := StringReplace(Url, '<@ID@>',
    IntToStr(StrToInt(StripNotNumericReturnZero(QDocHeadSREFERENCE.AsString))),
    [rfreplaceall]);
  ShellExecute(0, 'OPEN', pchar(AOpenText), '', '', SW_SHOW);
end;

procedure TfmInvoiceEntryGrid.OpenOSCOmmercecustomerinbrowser1Click
  (Sender: TObject);
Var
  AOpenText, Url: String;
begin
  if QDocHead.IsEmpty then
    exit;

  // try to load default
  Url := copy(QDocHeadSACCOUNTCODE.AsString, 1, 2);
  Url := ReadLongReportOp(Url + 'OSCOMMERCECUSTOMERLINK');
  if Url = '' then
    Url := OSCommerceLinkCustURL;

  AOpenText := StringReplace(Url, '<@ID@>',
    IntToStr(StrToInt(StripNotNumericReturnZero(QDocHeadSACCOUNTCODE.AsString))
    ), [rfreplaceall]);
  ShellExecute(0, 'OPEN', pchar(AOpenText), '', '', SW_SHOW);
end;

procedure TfmInvoiceEntryGrid.TUpdateDocumentsTimer(Sender: TObject);
begin
  TUpdateDocuments.Enabled := false;
  try
    // never in docedit
    if not(NBDocuments.ActivePage = 'ListDoc') then
      exit;
    // never when multy selecting
    if cxlistDBTable.Controller.SelectedRecordCount > 1 then
      exit;

    RefreschDocumentList(0);

  finally
    TUpdateDocuments.Enabled := true;
  end;
end;

procedure TfmInvoiceEntryGrid.Convertinvoicetopurchase1Click(Sender: TObject);
var
  i, NewDocId, aAccountID, DefTaxID: Integer;
  AStockRec: TStockRec;
  TaxRate, AmtInc, AmtExc: Double;
  Merge: Boolean;

  procedure RedoDoc;
  begin
    ExecSql('Update DOCHEAD set BExclusive = 1 where WDocID =' +
      IntToStr(NewDocId));
    // set the items to last price from stock table ;
    dmDatabase.ZQDocLine.SQL.Text :=
      'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where WLineTypeId in (90,94) and WDocid = '
      + IntToStr(NewDocId);
    dmDatabase.ZQDocLine.Open;
    AmtInc := 0;
    AmtExc := 0;
    DefTaxID := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount
      (aAccountID);
    while not dmDatabase.ZQDocLine.Eof do
    begin
      AStockRec.WStockID := dmDatabase.ZQDocLineWSTOCKID.AsInteger;
      StockLoadItem(AStockRec);

      UpdateStockRecWithPriceForplugin(LastStock,
        TDataBaseStockRoutines.GetUnitQty
        (StrToIntDef(dmDatabase.ZQDocLineSUNIT.AsString, 0)));
      dmDatabase.ZQDocLine.Edit;
      dmDatabase.ZQDocLineWLineTypeID.AsInteger := 90;

      if DefTaxID <> 0 then
        dmDatabase.ZQDocLineWTAXID.AsInteger := DefTaxID
      else
        dmDatabase.ZQDocLineWTAXID.AsInteger := AStockRec.WInputTaxID;

      dmDatabase.ZQDocLineFSellingPrice.AsFloat := AStockRec.FUnitCost * TDataBaseStockRoutines.GetUnitQty(StrToIntDef(dmDatabase.ZQDocLineSUNIT.AsString,-1));

      TaxRate := gettaxrateonId(dmDatabase.ZQDocLineWTAXID.AsInteger, true);
      dmDatabase.ZQDocLineFINCLUSIVEAMT.Value :=
        FixAmount((dmDatabase.ZQDocLineFSellingPrice.Value *
        dmDatabase.ZQDocLineFQtyShipped.AsFloat) * TaxRate,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      dmDatabase.ZQDocLineFEXCLUSIVEAMT.Value :=
        FixAmount((dmDatabase.ZQDocLineFSellingPrice.Value *
        dmDatabase.ZQDocLineFQtyShipped.AsFloat),
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
      AmtInc := AmtInc + dmDatabase.ZQDocLineFINCLUSIVEAMT.Value;
      AmtExc := AmtExc + dmDatabase.ZQDocLineFEXCLUSIVEAMT.Value;
      dmDatabase.ZQDocLineFTAXAMOUNT.Value :=
        FixAmount((dmDatabase.ZQDocLineFINCLUSIVEAMT.Value -
        dmDatabase.ZQDocLineFEXCLUSIVEAMT.Value),
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);

      dmDatabase.ZQDocLine.post;
      dmDatabase.ZQDocLine.next;
    end;

    dmDatabase.ZQDocHead.SQL.Text := ' Select * from dochead where WDocId = ' +
      IntToStr(NewDocId);
    dmDatabase.ZQDocHead.Open;
    dmDatabase.ZQDocHead.Edit;
    dmDatabase.ZQDocHeadFDOCAMOUNT.AsFloat :=
      FixAmount(AmtInc, dmDatabase.SetOfBooksPropertys.DataParameter.
      WDataEntryNbrQty);
    dmDatabase.ZQDocHeadFTAXAMOUNT.AsFloat :=
      FixAmount(dmDatabase.ZQDocHeadFDOCAMOUNT.AsFloat - AmtExc,
      dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty);
    if (not Merge) then
    begin
      dmDatabase.qGenII.SQL.Text := 'Select * from dochead where Wdocid =' +
        IntToStr(QDocHeadWDOCID.AsInteger);
      dmDatabase.qGenII.Open;
      dmDatabase.ZQDocHeadWDELNAME.AsInteger := dmDatabase.qGenII.FieldByName
        ('WDELNAME').AsInteger;
      dmDatabase.ZQDocHeadWDELADDRESS1ID.AsInteger :=
        dmDatabase.qGenII.FieldByName('WDELADDRESS1ID').AsInteger;
      dmDatabase.ZQDocHeadWDELADDRESS2ID.AsInteger :=
        dmDatabase.qGenII.FieldByName('WDELADDRESS2ID').AsInteger;
      dmDatabase.ZQDocHeadWDELADDRESS3ID.AsInteger :=
        dmDatabase.qGenII.FieldByName('WDELADDRESS3ID').AsInteger;
      dmDatabase.ZQDocHeadWDELCOUNTRIES_ID.AsInteger :=
        dmDatabase.qGenII.FieldByName('WDELCOUNTRIES_ID').AsInteger;
      dmDatabase.ZQDocHeadWDELCODEID.AsInteger := dmDatabase.qGenII.FieldByName
        ('WDELCODEID').AsInteger;
      dmDatabase.ZQDocHeadWDELCONTACT.AsInteger := dmDatabase.qGenII.FieldByName
        ('WDELCONTACT').AsInteger;

    end;
    dmDatabase.ZQDocHead.post;
    dmDatabase.ZQDocHead.close;

  end;

begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(642), mtConfirmation,
    [mbYes, mbNo], 0) = mrno then
    exit;

  Merge := ReadReportOp('STKMergInvToOrd', false).AsBoolean;
  try

    if QDocHead.IsEmpty then
      exit;

    if Not Assigned(fmDebtor) then
      fmDebtor := TfmDebtor.Create(self);

    fmDebtor.UseCreditor := true;
    fmDebtor.AsFindScreen(true);
    SetUpForm(fmDebtor);
    if fmDebtor.ShowModal <> mrok then
      exit;
    if fmDebtor.QDebtorCreditor.IsEmpty then
      exit;
    aAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;
    AccID := aAccountID;
    if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
        if (i = 0) or (not Merge) then
        begin
          CopyDocument(QDocHeadWDOCID.AsInteger, aAccountID, 2, false, nil,
            Date, false, NewDocId, '', '', '', '', true, false);
          RedoDoc;
          if (AExternalForm <> nil) then
          begin
            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
              pchar(AExternalSendString));
          end;
        end
        else
        begin
          CopyToDocument(QDocHeadWDOCID.AsInteger, NewDocId, false);
          RedoDoc;
          if (AExternalForm <> nil) then
          begin
            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
              pchar(AExternalSendString));
          end;
        end;

      end;

    end
    else
    begin
      CopyDocument(QDocHeadWDOCID.AsInteger, aAccountID, 2, false, nil, Date,
        false, NewDocId, '', '', '', '', true, false);
      if (AExternalForm <> nil) then
      begin
        AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10 +
          'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
          IntToStr(currentuser);;
        AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
          pchar(AExternalSendString));
      end;
    end;
    RedoDoc;
    // purchase is exclusive.
    if Merge then
    begin
      dmDatabase.qGen.SQL.Text :=
        'update docline set FQtyORdered =:FQtyShipped, FQtyShipped =:FQtyShipped , FEXCLUSIVEAMT = :FEXCLUSIVEAMT,FTAXAMOUNT =:FTAXAMOUNT ,FINCLUSIVEAMT = :FINCLUSIVEAMT where WDocid =:WDocid and WDOCLINEID =:WDOCLINEID';
      dmDatabase.qGenII.SQL.Text :=
        'Select max(WDoclineid) WDOCLINEID , WSTockid, sum(FQtyShipped) FQtyShipped, Sum(docline.FEXCLUSIVEAMT) FEXCLUSIVEAMT,Sum(docline.FTAXAMOUNT) FTAXAMOUNT, Sum(docline.FINCLUSIVEAMT) FINCLUSIVEAMT from docline  where Wdocid ='
        + IntToStr(NewDocId) +
        ' and WLINETYPEID <> 91 group by WSTockid order by WStockid';

      dmDatabase.qGenII.Open;

      while not dmDatabase.qGenII.Eof do
      begin
        ExecSql('Delete from docline where WDocid =' + IntToStr(NewDocId) +
          ' and WStockid = ' + IntToStr(dmDatabase.qGenII.FieldByName
          ('WSTOCKID').AsInteger) + ' and WDoclineid <> ' +
          IntToStr(dmDatabase.qGenII.FieldByName('WDOCLINEID').AsInteger));
        dmDatabase.qGen.ParamByName('FQtyShipped').AsFloat :=
          dmDatabase.qGenII.FieldByName('FQtyShipped').AsFloat;
        dmDatabase.qGen.ParamByName('FEXCLUSIVEAMT').AsFloat :=
          dmDatabase.qGenII.FieldByName('FEXCLUSIVEAMT').AsFloat;
        dmDatabase.qGen.ParamByName('FTAXAMOUNT').AsFloat :=
          dmDatabase.qGenII.FieldByName('FTAXAMOUNT').AsFloat;
        dmDatabase.qGen.ParamByName('FINCLUSIVEAMT').AsFloat :=
          dmDatabase.qGenII.FieldByName('FINCLUSIVEAMT').AsFloat;
        dmDatabase.qGen.ParamByName('WDoclineid').AsFloat :=
          dmDatabase.qGenII.FieldByName('WDoclineid').AsFloat;
        dmDatabase.qGen.ParamByName('WDocid').AsFloat := NewDocId;
        dmDatabase.qGen.ExecSql;
        dmDatabase.qGenII.next;
      end;
      // sync doubles ;
    end;

  except
    // no handel of except
  end;

  cbViewUnPosted2.ItemIndex := 1;
  cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject(TObject(15));
  RefreschDocumentList;

end;

procedure TfmInvoiceEntryGrid.Copydocument1Click(Sender: TObject);
var
  i, NewDocId, DocType: Integer;
  AExternalSendString: String;
begin
  DocType := 0;
  if QDocHead.IsEmpty then
    exit;
  case LocalDocType of
    10:
      DocType := 0;
    11:
      DocType := 4;
    13:
      DocType := 5;
    12:
      DocType := 1;
    14:
      DocType := 3;
    15:
      DocType := 2;
    16:
      DocType := 7;
    17:
      DocType := 8;
  end;

  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
        DocType, false, nil, Date, false, NewDocId, '', '', '', '',
        false, false);
      AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10 +
        'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
        IntToStr(currentuser);;
      if (AExternalForm <> nil) then
      begin
        AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
          pchar(AExternalSendString));
      end;
      SendMessageToPlugin(AExternalSendString);
    end;
  end
  else
  begin
    CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
      DocType, false, nil, Date, false, NewDocId, '', '', '', '', false, false);
    if (AExternalForm <> nil) then
    begin
      AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10 +
        'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
        IntToStr(currentuser);
      AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
        pchar(AExternalSendString));
    end;
    SendMessageToPlugin(AExternalSendString);
  end;
  cbViewUnPosted2.ItemIndex := 1;
  // LastDocHeaderId := NewDocId ;
  RefreschDocumentList(NewDocId);
end;

procedure TfmInvoiceEntryGrid.updatepricelist;
var
  i: Integer;
Begin
  if LastStock.SSTOCKCODE <> tblBatchSREFERENCE.AsString then
  begin
    loadCurrentItem;
  end;
  if cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName('FDEBIT') then
  begin
    if UpdateStockRecWithPriceForplugin(LastStock,
      tblBatchFUNITQTY.AsFloat) then
    begin

      if not tblBatch.IsEmpty then
      begin
        if tblBatch.State = dsBrowse then
          tblBatch.Edit;

        ApplyStockCodeToCurrentRecord;
      end;
    end;
    // price change
  end;

  // todo : Use tax from docline. (or default)
  // done : Pieter Make te price inclusive

  if ExclMode then
  begin
    // Plugin price
    // select purchases or sales doc type
    if (LocalDocType in [10, 11, 14]) then
    begin
      dmDatabase.tblSysVars.Open;
      for i := 0 to 2 do
        PriceList.Strings[i] := dmDatabase.tblSysVars.FieldByName
          ('SSellingPriceName' + IntToStr(i + 1)).AsString + '=0.00';

      dmDatabase.tblSysVars.close;

      PriceList.Strings[0] := PriceList.Strings.Names[0] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice1,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
      PriceList.Strings[1] := PriceList.Strings.Names[1] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice2,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
      PriceList.Strings[2] := PriceList.Strings.Names[2] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice3,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));

    end
    else
    begin
      PriceList.Strings[0] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
      PriceList.Strings[1] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
      PriceList.Strings[2] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost,
        dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals));
    end;
  end
  else
  begin
    if (LocalDocType in [10, 11, 14]) then
    begin
      dmDatabase.tblSysVars.Open;
      for i := 0 to 2 do
        PriceList.Strings[i] := dmDatabase.tblSysVars.FieldByName
          ('SSellingPriceName' + IntToStr(i + 1)).AsString + '=0.00';

      dmDatabase.tblSysVars.close;

      PriceList.Strings[0] := PriceList.Strings.Names[0] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice1 * LastStock.FOutputRate));
      PriceList.Strings[1] := PriceList.Strings.Names[1] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice2 * LastStock.FOutputRate));
      PriceList.Strings[2] := PriceList.Strings.Names[2] + '=' +
        FloatToStr(FixAmount(LastStock.FPrice3 * LastStock.FOutputRate));

    end
    else
    begin
      PriceList.Strings[0] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost * LastStock.FInputRate));
      PriceList.Strings[1] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost * LastStock.FInputRate));
      PriceList.Strings[2] := GetTextLang(302) + '=' +
        FloatToStr(FixAmount(LastStock.FUnitCost * LastStock.FInputRate));
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.tblBatchBeforePost(DataSet: TDataSet);
var
  Stockid: Integer;
  NEwAmt: Double;
begin
  if tblBatch.State = DsInsert then
  begin
    if tblBatchWLINEID.IsNull then
    begin
      tblBatchWLINEID.AsInteger :=
        StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
        ('select 1 + max(WLineID)  from ' + tblBatch.TableName)), 1);
      if tblBatchWLINKEDID.IsNull then
        tblBatchWLINKEDID.AsInteger := tblBatchWLINEID.AsInteger;
    end;
  end;
  // if tblBatchDALLOCATEDDATE.IsNull then tblBatchDALLOCATEDDATE.AsDateTime  := date ;
  if not BISSavePRocess then
    if DMTCCoreLink.SQLList.SQLCollection.GetItemByName
      ('CUST_PURCHASEAFTERSAVE') <> nil then
      if NBDocuments.PageIndex <> 0 then
        if (LocalDocType in [12, 13, 15, 17]) then
          if not(cbPosted.ItemIndex = 2) then
            if tblBatchFCREDIT.AsFloat > 0 then
              if tblBatchNOTUSED.AsInteger <> 1 then
              begin
                Stockid := TDataBaseStockRoutines.GetStockid
                  (tblBatchSREFERENCE.AsString);
                if tblBatchBRECONCILED.AsInteger = 0 then
                  if Stockid <> 0 then
                  begin

                    if ExclMode then
                      NEwAmt := tblBatchFCREDIT.AsFloat /
                        (Str2Float(tblBatchSCONTRAACCOUNT.AsString) *
                        tblBatchFUNITQTY.AsFloat)
                    else
                      NEwAmt := (tblBatchFCREDIT.AsFloat /
                        TDataBaseRoutines.gettaxrateonId
                        (tblBatchWTAXID.AsInteger)) /
                        (Str2Float(tblBatchSCONTRAACCOUNT.AsString) *
                        tblBatchFUNITQTY.AsFloat);
                    if NEwAmt > 0 then
                      DMTCCoreLink.ExecSql
                        (TDatabaseTableRoutines.ReplaceParams
                        (DMTCCoreLink.SQLList.GetFormatedSQLByName
                        ('CUST_PURCHASEAFTERSAVE'),
                        'WSTOCKID=' + IntToStr(Stockid) + #13 + #10 +
                        'WACCOUNTID=' + IntToStr(edtWAccountID) + #13 + #10 +
                        'FPRICE=' +
                        TDatabaseTableRoutines.GetFirebirdsSqlForFloat(NEwAmt) +
                        #13 + #10 + 'FDISCOUNT=' +
                        TDatabaseTableRoutines.GetFirebirdsSqlForFloat
                        (tblBatchFTAXAMOUNT.AsFloat) + #13 + #10 + 'WUNITID=' +
                        tblBatchWUNITID.AsString));
                  end;
              end;

end;

procedure TfmInvoiceEntryGrid.tblBatchBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet is TuniTable) then
    TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,
      'select * from ' + (DataSet as TuniTable).TableName + ' where 1 = 0')
  else if (DataSet is TuniQuery) then
    TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,
      (DataSet as TuniQuery).SQL.Text + ' and 1 = 0');
end;

procedure TfmInvoiceEntryGrid.RecalcStockAvailClick(Sender: TObject);
var
  AList: TStringList;
begin

  if LocalDocType <> 10 then
    exit;
  AList := TStringList.Create;
  try

    QDocHead.first;
    while not QDocHead.Eof do
    begin
      AList.Add(QDocHeadWDOCID.AsString);
      QDocHead.next;

    end;
    CheckStockAvailClick(AList, '');
    RefreschDocumentList(-1);
  finally
    AList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.LoadFilter;
begin
  if LocalDocType = 0 then
    exit;
  cbDoc1group.ItemIndex := DMTCCoreLink.ReadSysParam
    (GetSaveListPRefix + IntToStr(LocalDocType) + 'DOC_LSTGRP', 0, currentuser);

  LimitRows.Value := ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) +
    'LimitRows', 5000).AsInteger;

  EFilterValue.Text := ReadLongReportOp(GetSaveListPRefix +
    IntToStr(LocalDocType) + 'DOCDFilterValue');
  CBFindColumn.ItemIndex :=
    ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCFilterIndex',
    0).AsInteger;
  CBOperatot.ItemIndex := ReadReportOp(GetSaveListPRefix +
    IntToStr(LocalDocType) + 'DOCOperatorIndex', 0).AsInteger;
  ListOrderBy := ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) +
    'DOCOrderby', 1).AsInteger;
  BDirection := ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) +
    'DOCOrderbyDir', 0).AsInteger = 1;

  cbSimplelayout.Checked :=
    ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'SIMPLELAYOUT', 1)
    .AsInteger = 1;
  cbSimplelayoutClick(self);

  QDocHead.IndexFieldNames := '';
  cbViewUnPosted2.Tag := 1;
  cbViewUnPosted2.ItemIndex :=
    ReadReportOp(GetSaveListPRefix + IntToStr(LocalDocType) +
    'DOCViewUnPosted2', 1).AsInteger;
  cbViewUnPosted2.Tag := 0;
  try
    cxlistDBTable.RestoreFromRegistry('Software\osfinancials\grids\' +
      GetSaveListPRefix + IntToStr(LocalDocType) + 'cols', false, false);
  except
    cxlistDBTable.RestoreDefaults;
  end;

end;

procedure TfmInvoiceEntryGrid.SaveFilter;
begin
  if LocalDocType = 0 then
    exit;
  DMTCCoreLink.WriteSysParam(GetSaveListPRefix + IntToStr(LocalDocType) +
    'DOC_LSTGRP', cbDoc1group.ItemIndex, currentuser);

  if cbSimplelayout.Checked then
    WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'SIMPLELAYOUT',
      IntToStr(1))
  else
    WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'SIMPLELAYOUT',
      IntToStr(0));

  WriteLongReportOp(GetSaveListPRefix + IntToStr(LocalDocType) +
    'DOCDFilterValue', EFilterValue.Text);
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCFilterIndex',
    IntToStr(CBFindColumn.ItemIndex));
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCOrderby',
    IntToStr(ListOrderBy));
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCOrderbyDir',
    IntToStr(ord(BDirection)));
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCOperatorIndex',
    IntToStr(CBOperatot.ItemIndex));
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'DOCViewUnPosted2',
    IntToStr(cbViewUnPosted2.ItemIndex));
  cxlistDBTable.StoreToRegistry('Software\osfinancials\grids\' +
    GetSaveListPRefix + IntToStr(LocalDocType) + 'cols');
  WriteReportOp(GetSaveListPRefix + IntToStr(LocalDocType) + 'LimitRows',
    IntToStr(LimitRows.Value));
  // SaveGridToRegistry(DBGSearch,GetSaveListPRefix+IntToStr(LocalDocType)+'cols');
end;

procedure TfmInvoiceEntryGrid.Convertdocumentstosingledocument1Click
  (Sender: TObject);
var
  i, NewDocId, aAccountID, DocType: Integer;
  DoDelete: Boolean;
begin
  if QDocHead.IsEmpty then
    exit;
  DoDelete := OSFMessageDlg(format(GetTextLang(2881), [cbDocTypenew.Text]),
    mtConfirmation, [mbYes, mbNo], 0) = mryes;

  DocType := 0;
  case LocalDocType of
    10:
      DocType := 0;
    12:
      DocType := 1;
    14:
      DocType := 3;
    15:
      DocType := 2;
  end;

  if QDocHead.IsEmpty then
    exit;

  if Not Assigned(fmDebtor) then
    fmDebtor := TfmDebtor.Create(self);

  if (LocalDocType in [10, 11, 14]) then
    fmDebtor.UseCreditor := false
  else
    fmDebtor.UseCreditor := true;
  fmDebtor.AsFindScreen(true);
  SetUpForm(fmDebtor);
  WriteReportOp(fmDebtor.FilterFrefix + 'CANDFilterValue', '');
  fmDebtor.LocateId := QDocHeadWACCOUNTID.AsInteger;
  if fmDebtor.ShowModal <> mrok then
    exit;
  if fmDebtor.QDebtorCreditor.IsEmpty then
    exit;
  aAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      if i = 0 then
        CopyDocument(QDocHeadWDOCID.AsInteger, aAccountID, DocType, DoDelete,
          nil, Date, false, NewDocId, '', '', '', '', true, false)
      else
        CopyToDocument(QDocHeadWDOCID.AsInteger, NewDocId, DoDelete);
    end;
  end
  else
  begin
    CopyDocument(QDocHeadWDOCID.AsInteger, aAccountID, DocType, DoDelete, nil,
      Date, false, NewDocId, '', '', '', '', true, false);
  end;
  TDataBaseDocumentRoutines.CleanupDochead(NewDocId);
  RefreschDocumentList(NewDocId);
end;

procedure TfmInvoiceEntryGrid.Createpurchaseondefaultsupplier11Click
  (Sender: TObject);
var
  AProgress: TfmNewProgress;
  StockQty, TrigQty, fTotal, fQty: Double;
  ACreditorList: TStringList;
  AStockQuery: TuniQuery;
  NewDocId, i, SelectedCreditor, aLineID: Integer;
  CurrentCredId, WUnitId: Integer;
  BestPrice, Thisprice: Double;
begin
  SelectedCreditor := 0;

  AProgress := TfmNewProgress.Create(nil);
  try
    if LocalDocType <> 15 then
      exit;
    if OSFMessageDlg('Do you want to run this process for 1 creditor?',
      mtConfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      ReturnID := 0;
      Lookup.FmLookup.IsShowForm := false;
      Lookup.FmLookup.SelectLookup(nil, 'Creditor', 'CRED', 'ACCOUNT', 0);
      SelectedCreditor := ReturnID;
      if (ReturnLookup = 'Close') or (ReturnLookup = 'ESC') or
        (SelectedCreditor = 0) then
        exit;

    end;
    AProgress.initProgress('Loading...', 1);

    ACreditorList := TStringList.Create;
    AStockQuery := TuniQuery.Create(nil);
    try
      AStockQuery.Connection := DMTCCoreLink.TheZConnection;
      AStockQuery.SQL.Text :=
        'select * from stock where FReorderQty <> -1 and WSupplier1ID <> 0';
      AStockQuery.SQL.Add
        (' and Bdisabled = 0 and WStockTypeID not in (1,2,4,6,8) ');
      if SelectedCreditor <> 0 then
        AStockQuery.SQL.Add(' and WSupplier1ID = ' +
          IntToStr(SelectedCreditor));
      AStockQuery.SQL.Add(' order by sstockcode ');
      if SelectedCreditor > 0 then
      begin
        if DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTREORDSUP')
          <> '' then
          AStockQuery.SQL.Text := TDatabaseTableRoutines.ReplaceParams
            (DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTREORDSUP'),
            'ACC=' + IntToStr(SelectedCreditor) + #13 + #10 + 'WACCOUNTID=' +
            IntToStr(SelectedCreditor));

      end
      else if DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTREORD')
        <> '' then
        AStockQuery.SQL.Text := TDatabaseTableRoutines.ReplaceParams
          (DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTREORD'), '');

      AStockQuery.Open;
      AProgress.BtnStop.Visible := true;
      aDMCoreDocData.ZQDoclineOptions.Open;
      try
        AProgress.initProgress('Processing Stock', AStockQuery.RecordCount);
        While not AStockQuery.Eof do
        begin
          if AProgress.bStop then
            raise Exception.Create('User stop!');
          if AStockQuery.FieldByName('WSTOCKTYPEID').AsInteger = 7 then
          begin
            ZQStockOptions.close;
            ZQStockOptions.Params[0].AsInteger :=
              AStockQuery.FieldByName('WSTOCKID').AsInteger;
            ZQStockOptions.Open;
            AProgress.InitSubProgress('Processing Stock item',
              ZQStockOptions.RecordCount);
            aLineID := -1;
            fTotal := 0;
            fQty := 0;
            while not ZQStockOptions.Eof do
            begin

              // todo : handel this.
              StockQty :=
                TDataBaseStockRoutines.
                GetUnpostedStockItemCountIncPurchasesAndOrdersforreorderOptions
                (AStockQuery.FieldByName('WSTOCKID').AsInteger, -1,
                ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,
                ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger,
                ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger,
                ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger,
                ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger, 0);
              StockQty := (ZQStockOptions.FieldByName('FQTYONHAND').AsFloat -
                StockQty);
              if ZQStockOptions.FieldByName('FREORDERQTYTRIG').AsFloat <> 0 then
                TrigQty := StockQty -
                  (ZQStockOptions.FieldByName('FREORDERQTYTRIG').AsFloat + 1)
              else
                TrigQty := StockQty -
                  (ZQStockOptions.FieldByName('FREORDERQTY').AsFloat);
              StockQty := StockQty - ZQStockOptions.FieldByName
                ('FREORDERQTY').AsFloat;
              if ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID')
                .AsString) = -1 then
              begin
                if (TrigQty < 0) and
                  (AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
                begin
                  CreateDocument(AStockQuery.FieldByName('WSUPPLIER1ID')
                    .AsInteger, 2, NewDocId);
                  ACreditorList.AddObject
                    (AStockQuery.FieldByName('WSUPPLIER1ID').AsString,
                    TObject(NewDocId));
                  if aLineID = -1 then
                    AddPurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID')
                      .AsInteger, NewDocId, AStockQuery.FieldByName('WSTOCKID')
                      .AsInteger, -StockQty, aLineID);
                  // add option
                  aDMCoreDocData.ZQDoclineOptions.Insert;
                  aDMCoreDocData.ZQDoclineOptionsWDOCID.AsInteger :=
                    Integer(ACreditorList.Objects
                    [ACreditorList.IndexOf(AStockQuery.FieldByName
                    ('WSUPPLIER1ID').AsString)]);
                  aDMCoreDocData.ZQDoclineOptionsWLINEID.AsInteger := aLineID;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE1ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE2ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE3ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE4ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE5ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat :=
                    ZQStockOptionsFUNITCOST.AsFloat;
                  aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat := -StockQty;
                  aDMCoreDocData.ZQDoclineOptions.post;
                  fTotal := fTotal + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat
                    * ZQStockOptionsFUNITCOST.AsFloat;
                  fQty := fQty + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat;
                end;
              end
              else
              begin
                if (TrigQty < 0) and
                  (AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
                begin
                  if aLineID = -1 then
                    AddPurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID')
                      .AsInteger,
                      Integer(ACreditorList.Objects
                      [ACreditorList.IndexOf(AStockQuery.FieldByName
                      ('WSUPPLIER1ID').AsString)]),
                      AStockQuery.FieldByName('WSTOCKID').AsInteger,
                      -StockQty, aLineID);
                  aDMCoreDocData.ZQDoclineOptions.Insert;
                  aDMCoreDocData.ZQDoclineOptionsWDOCID.AsInteger :=
                    Integer(ACreditorList.Objects
                    [ACreditorList.IndexOf(AStockQuery.FieldByName
                    ('WSUPPLIER1ID').AsString)]);
                  aDMCoreDocData.ZQDoclineOptionsWLINEID.AsInteger := aLineID;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE1ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE2ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE3ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE4ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsVariant
                    := ZQStockOptionsWITEMOPTIONVALUE5ID.AsVariant;
                  aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat :=
                    ZQStockOptionsFUNITCOST.AsFloat;
                  aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat := -StockQty;
                  aDMCoreDocData.ZQDoclineOptions.post;
                  fTotal := fTotal + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat
                    * ZQStockOptionsFUNITCOST.AsFloat;
                  fQty := fQty + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat;
                end;
              end;
              ZQStockOptions.next;
            end;
            // update price
            if (aLineID <> -1) and (fQty <> 0) then
            begin
              UpdatePurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID')
                .AsInteger,
                Integer(ACreditorList.Objects
                [ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID')
                .AsString)]), aLineID, fQty, (fTotal) / (fQty));
            end;
          end
          else
          begin
            { if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
              begin
              StockQty := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(AStockQuery.FieldByName('WSTOCKID').AsInteger,10,-1,0) ;
              StockQty := StockQty - TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(AStockQuery.FieldByName('WSTOCKID').AsInteger,15,-1,0) ;
              StockQty := StockQty - TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(AStockQuery.FieldByName('WSTOCKID').AsInteger,17,-1,0)  ;
              StockQty := StockQty + TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(AStockQuery.FieldByName('WSTOCKID').AsInteger,16,-1,0) ;
              //StockQty := TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrders(AStockQuery.FieldByName('WSTOCKID').AsInteger ,-1,0)
              end   else }
            StockQty := TDataBaseStockRoutines.
              GetUnpostedStockItemCountIncPurchasesAndOrders
              (AStockQuery.FieldByName('WSTOCKID').AsInteger, -1, 0);

            StockQty := StockQty -
              TDataBaseStockRoutines.GetUnpostedStockITemCountFromType
              (AStockQuery.FieldByName('WSTOCKID').AsInteger, 15, 0, 0, 0, '');

            StockQty := (AStockQuery.FieldByName('FQTYONHAND').AsFloat -
              StockQty);
            WUnitId := AStockQuery.FieldByName('WUNITID').AsInteger;
            if AStockQuery.FieldByName('FREORDERQTYTRIG').AsFloat <> 0 then
              TrigQty := StockQty - (AStockQuery.FieldByName('FREORDERQTYTRIG')
                .AsFloat + 1)
            else
              TrigQty := StockQty -
                (AStockQuery.FieldByName('FREORDERQTY').AsFloat);
            StockQty := StockQty -
              (AStockQuery.FieldByName('FREORDERQTY').AsFloat);

            CurrentCredId := AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger;
            if (DMTCCoreLink.SQLList.GetFormatedSQLByName
              ('CUST_SELECTREORDBEST') <> '') and (StockQty <> 0) then
            begin

              dmDatabase.qGen.SQL.Text := TDatabaseTableRoutines.ReplaceParams
                (DMTCCoreLink.SQLList.GetFormatedSQLByName
                ('CUST_SELECTREORDBEST'),
                'WSTOCKID=' + AStockQuery.FieldByName('WSTOCKID').AsString);
              dmDatabase.qGen.Open;
              BestPrice := 0;
              while not dmDatabase.qGen.Eof do
              begin
                Thisprice := TDataBaseStockRoutines.getStockPrice
                  (dmDatabase.qGen.FieldByName('WACCOUNTID').AsInteger,
                  AStockQuery.FieldByName('WSTOCKID').AsInteger, -StockQty);
                if Thisprice <> 0 then
                  if (BestPrice = 0) or (Thisprice < BestPrice) then
                  begin

                    BestPrice := Thisprice;
                    WUnitId := dmDatabase.qGen.FieldByName('WUNITID').AsInteger;
                    CurrentCredId := dmDatabase.qGen.FieldByName('WACCOUNTID')
                      .AsInteger;

                  end;
                dmDatabase.qGen.next;
              end;
            end;
            if (StockQty = 0) or (SelectedCreditor > 0) and
              (SelectedCreditor <> CurrentCredId) or
              (TDataBaseRoutines.GetAccountCode(CurrentCredId) = '') then
            begin
              AStockQuery.next;
              AProgress.SetProgress('', AStockQuery.RecNo);
              Continue;
            end;
            if (DMTCCoreLink.SQLList.GetFormatedSQLByName
              ('CUST_SELECTREORDBEST') <> '') and (StockQty <> 0) then
              if AStockQuery.FieldByName('FREORDERQTYTRIG').AsFloat <> 0 then
                StockQty := StockQty - 1;

            if ACreditorList.IndexOf(IntToStr(CurrentCredId)) = -1 then
            begin
              if (TrigQty < 0) and (CurrentCredId > 0) then
              begin
                if StockQty <> 0 then
                begin
                  NewDocId := TDataBaseDocumentRoutines.AddDocument(15,
                    CurrentCredId, 'Auto order');

                  // CreateDocument(CurrentCredId,2,NewDocID);
                  ACreditorList.AddObject(IntToStr(CurrentCredId),
                    TObject(NewDocId));
                  // minimum unit
                  if TDataBaseStockRoutines.GetUnitQty(WUnitId) <> 1 then
                  begin
                    StockQty :=
                      ceil(StockQty / TDataBaseStockRoutines.GetUnitQty
                      (WUnitId));

                  end;
                  AddPurchaseStockLine(CurrentCredId, NewDocId,
                    AStockQuery.FieldByName('WSTOCKID').AsInteger, -StockQty,
                    aLineID, BPriceAgreeUseOrgPrice, -1, -1, -1, WUnitId);
                end;
              end;
            end
            else
            begin
              if (TrigQty < 0) and (CurrentCredId > 0) then
              begin
                if StockQty <> 0 then
                begin
                  // minimum unit
                  if TDataBaseStockRoutines.GetUnitQty(WUnitId) <> 1 then
                  begin
                    StockQty :=
                      ceil(StockQty / TDataBaseStockRoutines.GetUnitQty
                      (WUnitId));

                  end;

                  AddPurchaseStockLine(CurrentCredId,
                    Integer(ACreditorList.Objects
                    [ACreditorList.IndexOf(IntToStr(CurrentCredId))]),
                    AStockQuery.FieldByName('WSTOCKID').AsInteger, -StockQty,
                    aLineID, BPriceAgreeUseOrgPrice, -1, -1, -1, WUnitId);
                end;
              end;
            end;
          end;
          AStockQuery.next;
          AProgress.SetProgress('', AStockQuery.RecNo);
        end;
      finally
        AProgress.bStop := false;
        AProgress.initProgress('Update document', ACreditorList.Count);
        for i := 0 to ACreditorList.Count - 1 do
        begin
          AProgress.SetProgress('', i + 1);
          if AProgress.bStop then
            raise Exception.Create('User stop!');
          TDataBaseDocumentRoutines.CleanupDochead
            (Integer(ACreditorList.Objects[i]));
        end;
        RefreschDocumentList(-1);
      end;
    finally
      ACreditorList.free;
      AStockQuery.free;
    end;
  finally
    AProgress.free;
  end;
end;

procedure TfmInvoiceEntryGrid.Showinfo1Click(Sender: TObject);

begin
  ShowHintForLine := not ShowHintForLine;
  if ShowHintForLine then
  begin
    Showinfo1.caption := GetTextLang(2994);
    self.ShowHint := true;
    Application.HintPause := 0;
    QDocHeadAfterScroll(QDocHead);
  end
  else
  begin
    Showinfo1.caption := GetTextLang(392);
    self.ShowHint := false;
    Application.HintPause := 500;
  end;
end;

procedure TfmInvoiceEntryGrid.QDocHeadAfterScroll(DataSet: TDataSet);
var
  HintText: String;
begin
  BDelete.Enabled := (QDocHeadBPOSTED.AsInteger = 0) or
    (LocalDocType in [14, 15]);
  GridActiveLineDocid := QDocHeadWDOCID.AsInteger;
  if ShowHintForLine then
  begin
    if QDocHead.IsEmpty then
    begin
      self.Hint := '';
      exit;
    end;
    HintText := QDocHeadSACCOUNTDESCRIPTION.AsString + ' / ' +
      QDocHeadSDOCNO.AsString + #13#10;

    dmDatabase.ZQDocLine.SQL.Text :=
      'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where WDocid = :WDocId  order by docline.WSORTNO';
    dmDatabase.ZQDocLine.Params[0].AsInteger := QDocHeadWDOCID.AsInteger;
    dmDatabase.ZQDocLine.Open;
    while not dmDatabase.ZQDocLine.Eof do
    begin
      if dmDatabase.ZQDocLineWLineTypeID.AsInteger <> 91 then
        HintText := HintText + DMTCCoreLink.ReadDescription
          (dmDatabase.ZQDocLineWDescriptionID.AsInteger) + ' / ' +
          dmDatabase.ZQDocLineFQtyShipped.AsString + ' / ' +
          formatfloat('####0.00', dmDatabase.ZQDocLineFINCLUSIVEAMT.AsFloat)
      else
        HintText := HintText + DMTCCoreLink.ReadDescription
          (dmDatabase.ZQDocLineWDescriptionID.AsInteger);

      dmDatabase.ZQDocLine.next;
      if not dmDatabase.ZQDocLine.Eof then
        HintText := HintText + #13 + #10;
    end;
    self.Hint := HintText;
  end;
end;

function TfmInvoiceEntryGrid.GetPluginLineString
  (IsLine: Boolean = true): String;
begin
  result := '';
  if IsLine then
  begin
    result := 'LINE=' + tblBatchWLINEID.AsString + #13 + #10 + 'STOCKCODE=' +
      tblBatchSREFERENCE.AsString + #13 + #10;
  end;
  result := result + 'BATCH=' + tblBatch.TableName + #13 + #10 + 'USERID=' +
    IntToStr(currentuser) + #13 + #10 + 'INCEXL=' + IntToStr(ord(ExclMode)) +
    #13 + #10 + 'WACCOUNTID=' + IntToStr(edtWAccountID) + #13 + #10 + 'DDATE=' +
    IntToStr(Round(dtpDate.Date)) + #13 + #10 + 'DOCTYPE=' +
    IntToStr(LocalDocType) + #13 + #10 + 'BPOSTED=' +
    IntToStr(ord(LastDocPosted));
end;

procedure TfmInvoiceEntryGrid.PluginFieldGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  AExternalSendString: String;
  AArray: array [0 .. 1025] of Char;
  APChar: pchar;
begin
  Text := '';
  AArray[0] := 'P';
  AArray[1] := #0;

  if tblBatch.IsEmpty then
    exit;
  APChar := AArray;
  if AExternalForm <> nil then
  begin
    AExternalSendString := 'DELETELINE=' + IntToStr(LastDocHeaderId) + #13 + #10
      + GetPluginLineString;
    AExternalEditAddItemToDocPlugin.aMessageGetDisplayText(AExternalForm,
      pchar(AExternalSendString), pchar(APChar));
    Text := copy(APChar, 1, 1024);
  end;
end;

procedure TfmInvoiceEntryGrid.ConverttoCreditnote1Click(Sender: TObject);
var
  DoDelete: Boolean;
  i, NewDocId: Integer;
  AExternalSendString: String;
begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(642), mtConfirmation,
    [mbYes, mbNo], 0) = mrno then
    exit;

  DoDelete := false;
  if QDocHead.IsEmpty then
    exit;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      case LocalDocType of
        10:
          begin
            CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
              4, DoDelete, nil, Date, false, NewDocId, '', '', '', '',
              false, false);
            if (AExternalForm <> nil) then
            begin
              AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 +
                #10 + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 +
                'USERID=' + IntToStr(currentuser);;
              AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
                pchar(AExternalSendString));
            end;

          end;
        12:
          begin
            CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
              5, DoDelete, nil, Date, false, NewDocId, '', '', '', '',
              false, false);
            if (AExternalForm <> nil) then
            begin
              AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 +
                #10 + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 +
                'USERID=' + IntToStr(currentuser);;
              AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
                pchar(AExternalSendString));
            end;
          end;
      end;

    end;
  end
  else
  begin
    case LocalDocType of
      10:
        begin
          CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
            4, DoDelete, nil, Date, false, NewDocId, '', '', '', '',
            false, false);
          if (AExternalForm <> nil) then
          begin
            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
              pchar(AExternalSendString));
          end;
        end;
      12:
        begin
          CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
            5, DoDelete, nil, Date, false, NewDocId, '', '', '', '',
            false, false);
          if (AExternalForm <> nil) then
          begin
            AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10
              + 'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
              IntToStr(currentuser);;
            AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
              pchar(AExternalSendString));
          end;
        end;
    end;
  end;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.Setdate1Click(Sender: TObject);
var
  i: Integer;

  MyQuery: TuniQuery;
  MyNewDate: TDatetime;
begin
  MyQuery := TuniQuery.Create(nil);
  try
    MyNewDate := StrToDate(InputBox('New date', 'Enter a new date',
      DateToStr(QDocHeadDDATE.AsDateTime)));

    MyQuery.Connection := DMTCCoreLink.TheZConnection;
    if QDocHead.IsEmpty then
      exit;
    if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
        MyQuery.SQL.Text := 'update dochead set ddate =:ddate where wdocid =' +
          IntToStr(QDocHeadWDOCID.AsInteger);
        MyQuery.Params[0].AsDate := MyNewDate;
        MyQuery.ExecSql;
      end;
    end
    else
    begin
      MyQuery.SQL.Text := 'update dochead set ddate =:ddate where wdocid =' +
        IntToStr(QDocHeadWDOCID.AsInteger);
      MyQuery.Params[0].AsDate := MyNewDate;
      MyQuery.ExecSql;
    end;
  finally
    MyQuery.free;
  end;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.initPlugins;
var
  ArrayImageIndex: Array [0 .. 9] of Integer;
  procedure Init;
  var
    i: Integer;
    AForm: TForm;
    APage: TMenuItem;
    ReturnString: Array [0 .. 1025] of Char;
    APChar: pchar;

  begin
    for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
      if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and
        (@AFormPluginRecordArray[i].aMessageGetDisplayText <> nil) then

      begin

        APChar := ReturnString;
        AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application, '');
        AFormPluginRecordArray[i].AForm := AForm;
        if ArrayImageIndex[i] > -1 then
        begin
          APage := TMenuItem.Create(self);
          pmPlugins.Items.Insert(0, APage);
          // APage.Parent := ToolBar1;
          APage.ImageIndex := ArrayImageIndex[i];
          // APage.set
          // ToolBar1.ButtonCount -1 ;

          AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,
            'PLUGINNAME', APChar);
          APage.caption := ReturnString;
          APage.Tag := Integer(AForm);
          APage.OnClick := TPluginClick;
        end;
        APluginsFormsList.AddObject(AForm.Name, AForm);
      end;
    tbPlugins.Visible := pmPlugins.Items.Count <> 0;
    if pmPlugins.Items.Count = 1 then
    begin
      tbPlugins.caption := pmPlugins.Items[0].caption;
      tbPlugins.ImageIndex := pmPlugins.Items[0].ImageIndex;
    end;

  end;

var
  i, IncArr, Ins, ImageIndex: Integer;
  IsEnable: Boolean;
  ReturnName: Array [0 .. 1024] of Char;
  APChar: pchar;
begin
  IncArr := 0;
  for i := 0 to LoadedPluginList.Count - 1 do
  begin
    if IncArr > 9 then
      exit;
    Ins := Integer(LoadedPluginList.Objects[i]);
    IsEnable := true;
    try
      if Ins = TcVariables.AExternalEditAddItemToDocPlugin.aInst then
        Continue;

      @AFormPluginRecordArray[IncArr].aLoadFormPlugin :=
        GetProcAddress(Ins, OSFEditAddItemToMainDocRoutineName);
      if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
      begin

        AFormPluginRecordArray[IncArr].aInst := Ins;
        @AFormPluginRecordArray[IncArr].aMessageFormPlugin :=
          GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
        @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin :=
          GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
        @AFormPluginRecordArray[IncArr].aMessageGetDisplayText :=
          GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
        @AFormPluginRecordArray[IncArr].aPluginEnabled :=
          GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
        @AFormPluginRecordArray[IncArr].aContextmenuEnabled :=
          GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);

        @AFormPluginRecordArray[IncArr].aGetPriceFormPlugin :=
          GetProcAddress(Ins, OSFGetPriceForDocRoutineName);
        @AFormPluginRecordArray[IncArr].aDocSearch :=
          GetProcAddress(Ins, OSFDOCSEARCHRoutineName);

        ArrayImageIndex[IncArr] := 25;
        if Assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
        begin
          APChar := ReturnName;
          AFormPluginRecordArray[IncArr].aPluginEnabled('DOC', APChar,
            ImageIndex);
          IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
          ArrayImageIndex[IncArr] := ImageIndex;
        end;

        if IsEnable then
        begin
          inc(IncArr);
        end
        else
        begin
          @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil;
          @AFormPluginRecordArray[IncArr].aMessageFormPlugin := nil;
          @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := nil;
          @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil;
          @AFormPluginRecordArray[IncArr].aPluginEnabled := nil;
          @AFormPluginRecordArray[IncArr].aContextmenuEnabled := nil;
          AFormPluginRecordArray[IncArr].AForm := nil;
        end;
      end;
    except
      on e: Exception do
      begin
        showmessage(GetModuleName(Ins) + ' : ' + e.Message);
        @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil;
        @AFormPluginRecordArray[IncArr].aMessageFormPlugin := nil;
        @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := nil;
        @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil;
        @AFormPluginRecordArray[IncArr].aPluginEnabled := nil;
        @AFormPluginRecordArray[IncArr].aContextmenuEnabled := nil;
        AFormPluginRecordArray[IncArr].AForm := nil;
      end;
    end;
  end;
  Init;
end;

procedure TfmInvoiceEntryGrid.SendMessageToPlugin(AMessage: String);
var
  i: Integer;
begin
  for i := 0 to APluginsFormsList.Count - 1 do
  begin
    try
      AFormPluginRecordArray[i].aMessageFormPlugin
        (TForm(APluginsFormsList.Objects[i]), pchar(AMessage));

    Except
      on e: Exception do
      begin
        OSFMessageDlg('Error in plugin ' + GetModuleName(AFormPluginRecordArray
          [i].aInst) + ' : ' + e.Message, mtError, [mbok], 0);
      end;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.TPluginClick(Sender: TObject);
begin
  TForm(TComponent(Sender).Tag).ShowModal;
end;

procedure TfmInvoiceEntryGrid.SetProjectId(const Value: Integer);
begin
  if FProjectId <> Value then
  begin
    LProject.Visible := false;
    cbProject.Visible := false;
    FProjectId := Value;
    RefreschDocumentList(-1);
  end;

end;

procedure TfmInvoiceEntryGrid.ZQCostgroup1CalcFields(DataSet: TDataSet);
var
  Level: Integer;
begin
  Level := 0;
  ZQCostgroup1SFULLDESC.AsString := TDataBaseRoutines.GetNesteldNameFromGroupID
    (ZQCostgroup1WGROUPID.AsInteger, Level);
end;

procedure TfmInvoiceEntryGrid.ZQCostGroup2CalcFields(DataSet: TDataSet);

var
  Level: Integer;
begin
  Level := 0;
  ZQCostGroup2SFULLDESC.AsString := TDataBaseRoutines.GetNesteldNameFromGroupID
    (ZQCostGroup2WGROUPID.AsInteger, Level);
end;

procedure TfmInvoiceEntryGrid.DBLCBCostgroup2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    cxGrid1.SetFocus;
  end;
end;

procedure TfmInvoiceEntryGrid.DBLCBCostgroup1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_right then
    cxGrid1.SetFocus;

  if Key = vk_left then
    cxGrid1.SetFocus;
end;

procedure TfmInvoiceEntryGrid.DBLCBCostgroup1Exit(Sender: TObject);
begin
  (Sender as TControl).Visible := false;
end;

procedure TfmInvoiceEntryGrid.tblBatchWREPORTINGGROUP1IDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  Level: Integer;
begin
  Text := '';
  if Sender.AsInteger <> 0 then
  begin
    Level := 0;
    Text := TDataBaseRoutines.GetNesteldNameFromGroupID
      (Sender.AsInteger, Level);
  end;

end;

procedure TfmInvoiceEntryGrid.FormResize(Sender: TObject);
var
  aLeft, TotalSpace, i, CheckWidth: Integer;
begin
  if not Assigned(ScrollBox1) then
    exit;

  aLeft := 740;
  if self.Width < 740 then
  begin
    aLeft := self.Width;
  end;

  BtnOkPrint.Left := aLeft - 104;
  BtnClose.Left := aLeft - 262;

  if NBDocuments.PageIndex = 0 then
  begin
    ScrollBox1.HorzScrollBar.Range := 0;
  end
  else
  begin
    CheckWidth := (tbBackorder.Left + 50);
    TotalSpace := 0;
    if PEditPrice.Visible then
    begin
      for i := 0 to cxGrid1DBTableView1.ColumnCount - 1 do
        if cxGrid1DBTableView1.Columns[i].Visible then
        begin
          TotalSpace := TotalSpace + cxGrid1DBTableView1.Columns[i].Width;
        end;
      CheckWidth := TotalSpace + 200;
    end;

    if self.Width < CheckWidth then
    begin
      if (ScrollBox1.HorzScrollBar.Range <> tbBackorder.Left + 50) then
      begin
        ScrollBox1.HorzScrollBar.Range := tbBackorder.Left + 50;
        ScrollBox1.HorzScrollBar.Position := 0;
      end;
    end;
    cxGrid1.Left := 0;
    cxGrid1.Width := self.Width - 10;
    cxGrid1.Height := Panel3.Height - 10;
    cxGrid1.Top := 0;

    if PEditPrice.Visible then
    begin

      if (TotalSpace + 200) > Panel3.Width then
      begin
        PEditPrice.Width := 200
      end
      else
      begin
        PEditPrice.Width := Panel3.Width - (TotalSpace + 90);
      end;
      cxGrid1.Width := Panel3.Width - ((PEditPrice.Width) + 10);

    end;

  end;
  if self.Height < 537 then
  begin
    if ScrollBox1.VertScrollBar.Range <> 537 then
    begin
      ScrollBox1.VertScrollBar.Range := 537;
      ScrollBox1.VertScrollBar.Position := 0;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.SendMessagePriceMessagePlugin(AMessage: String;
  var price1, price2, price3, Sellingprice, Discount: Double);
var
  i: Integer;

begin
  for i := 0 to APluginsFormsList.Count - 1 do
  begin
    try
      if Assigned(AFormPluginRecordArray[i].aGetPriceFormPlugin) then
        AFormPluginRecordArray[i].aGetPriceFormPlugin
          (TForm(APluginsFormsList.Objects[i]), pchar(AMessage), price1, price2,
          price3, Sellingprice, Discount);
    except
      On e: Exception do
      begin

        showmessage(GetModuleName(AFormPluginRecordArray[i].aInst) + ': ' +
          e.Message);
      end;
    end;
  end;
end;

function TfmInvoiceEntryGrid.UpdateStockRecWithPriceForplugin
  (var AStockRec: TStockRec; AMultiplier: Double): Boolean;
var
  price1, price2, price3, Sellingprice, Discount: Double;
begin
  if AMultiplier = 0 then
    AMultiplier := 1;
  price1 := 0;
  price2 := 0;
  price3 := 0;
  Sellingprice := 0;
  Discount := 0;
  result := false;
  if (LocalDocType in [10, 11, 14, 16]) then
  begin
    price1 := AStockRec.FPrice1;
    price2 := AStockRec.FPrice2;
    price3 := AStockRec.FPrice3;
  end
  else
  begin
    price1 := AStockRec.FUnitCost;
    price2 := AStockRec.FUnitCost;
    price3 := AStockRec.FUnitCost;
  end;

  SendMessagePriceMessagePlugin('WLINEID=' + tblBatchWLINEID.AsString + #13 +
    #10 + 'WACCOUNTID=' + IntToStr(AccID) + #13 + #10 + 'WSTOCKID=' +
    IntToStr(AStockRec.WStockID) + #13 + #10 + 'FQTY=' +
    FloatToStr(StrToFloatDef(tblBatchSACCOUNT.AsString, 0) * AMultiplier),
    price1, price2, price3, Sellingprice, Discount);
  if (LocalDocType in [10, 11, 14]) then
  begin
    if AStockRec.FPrice1 <> price1 then
    begin
      AStockRec.FPrice1 := price1;
      result := true;
    end;
    if AStockRec.FPrice2 <> price2 then
    begin
      AStockRec.FPrice2 := price2;
      result := true;
    end;
    if AStockRec.FPrice3 <> price3 then
    begin
      AStockRec.FPrice3 := price3;
      result := true;
    end;
    if AStockRec.FSellingPrice <> Sellingprice then
    begin
      AStockRec.FSellingPrice := Sellingprice;
      result := true;
    end;
    if (AStockRec.FDiscount <> Discount) and (Sellingprice <> 0) then
    begin
      AStockRec.FDiscount := Discount;
      result := true;
    end;
  end
  else
  begin
    if LocalDocType <> 17 then
    begin
      if (AStockRec.FUnitCost <> Sellingprice) and (Sellingprice <> 0) then
      begin
        AStockRec.FUnitCost := Sellingprice;
        result := true;
      end;
    end
    else
    begin
      AStockRec.FSellingPrice := AStockRec.FUnitCost;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.PluginPopupClick(Sender: TObject);
var
  AMessage: String;
begin
  If QDocHead.IsEmpty then
    exit;

  AMessage := 'INIT=' + IntToStr(QDocHeadWDOCID.AsInteger) + #10 + #13 +
    'ACCOUNTID=' + IntToStr(QDocHeadWACCOUNTID.AsInteger) + #10 + #13 +
    'TYPEID=' + IntToStr(TDataBaseDocumentRoutines.GetDocType
    (QDocHeadWDOCID.AsInteger));
  AFormPluginRecordArray[(Sender as TComponent).Tag].aMessageFormPlugin
    (TForm(APluginsFormsList.Objects[(Sender as TComponent).Tag]),
    pchar(AMessage));
  AMessage := 'CONTEXT=' + QDocHeadWDOCID.AsString;
  AFormPluginRecordArray[(Sender as TComponent).Tag].aMessageFormPlugin
    (TForm(APluginsFormsList.Objects[(Sender as TComponent).Tag]),
    pchar(AMessage));
end;

procedure TfmInvoiceEntryGrid.PluginPopupClick2(Sender: TObject);
var
  AMessage: String;
  i: Integer;
begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLang(642), mtConfirmation, [mbYes, mbNo],
    0) <> mryes then
    exit;

  If QDocHead.IsEmpty then
    exit;
  AMessage := 'CONTEXTINIT2=TRUE';;
  AFormPluginRecordArray[(Sender as TComponent).Tag].aMessageFormPlugin
    (TForm(APluginsFormsList.Objects[(Sender as TComponent).Tag]),
    pchar(AMessage));
  if cxlistDBTable.Controller.SelectedRecordCount > 0 then
  begin

    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      AMessage := 'CONTEXT2=' + QDocHeadWDOCID.AsString + #13 + #10 + 'TYPEID='
        + IntToStr(LocalDocType) + #13 + #10 + 'ACCOUNTID=' +
        QDocHeadWACCOUNTID.AsString;
      AFormPluginRecordArray[(Sender as TComponent).Tag].aMessageFormPlugin
        (TForm(APluginsFormsList.Objects[(Sender as TComponent).Tag]),
        pchar(AMessage));
    end;
  end
  else
  begin
    AMessage := 'CONTEXT2=' + QDocHeadWDOCID.AsString + #13 + #10 + 'TYPEID=' +
      IntToStr(LocalDocType) + #13 + #10 + 'ACCOUNTID=' +
      QDocHeadWACCOUNTID.AsString;
    AFormPluginRecordArray[(Sender as TComponent).Tag].aMessageFormPlugin
      (TForm(APluginsFormsList.Objects[(Sender as TComponent).Tag]),
      pchar(AMessage));
  end;
end;

procedure TfmInvoiceEntryGrid.Export1Click(Sender: TObject);
var
  i: Integer;
  DocList: String;
begin
  if not SaveDialog1.Execute then
    exit;

  if QDocHead.IsEmpty then
    exit;
  DocList := '';
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      DocList := DocList + QDocHeadWDOCID.AsString;
      if (i <> cxlistDBTable.Controller.SelectedRecordCount - 1) then
        DocList := DocList + ',';
    end;
  end
  else
  begin
    DocList := QDocHeadWDOCID.AsString;
  end;
  if DocList <> '' then
    if UPPERCASE(ExtractFileExt(SaveDialog1.FileName)) = '.CSV' then
      ExportXmlDoc(Date, Date, SaveDialog1.FileName, '', '', false, 1, false,
        'select * from dochead where Wdocid in (' + DocList + ')')

    else
      ExportXmlDoc(Date, Date, SaveDialog1.FileName, '', '', false, 4, false,
        'select * from dochead where Wdocid in (' + DocList + ')');

end;

procedure TfmInvoiceEntryGrid.Import1Click(Sender: TObject);
var
  MaxId: Integer;
begin
  if not OpenDialog1.Execute then
    exit;
  ErrorLog := '';
  if UPPERCASE(ExtractFileExt(OpenDialog1.FileName)) = '.CSV' then
  begin
    ReadTxfFromFile(OpenDialog1.FileName, true, LocalDocType);
    MaxId := StrToIntDef
      (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select max(Wdocid) from dochead')), 0);
    RefreschDocumentList(MaxId);
    if ErrorLog <> '' then
      showmessage(ErrorLog);
    exit;
  end;

  ReadTxfFromFile(OpenDialog1.FileName, true, LocalDocType);
  MaxId := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
    ('Select max(Wdocid) from dochead')), 0);
  RefreschDocumentList(MaxId);
  if ErrorLog <> '' then
    showmessage(ErrorLog);
end;

procedure TfmInvoiceEntryGrid.Importfromtabfile1Click(Sender: TObject);
var
  ATabFile, ALines, AHeaders: TStringList;
  i, X, IndexStock, IndexQty, IndexBarcode, IndexPrice, IndexSubcode: Integer;
  MyStock: TStockRec;
  fQty, FPrice: Double;
  ALine: String;
  AProgress: TfmNewProgress;
  Function FindIndex(aName: String): Integer;
  var
    X: Integer;
  begin
    result := -1;
    for X := 0 to AHeaders.Count - 1 do
      if UPPERCASE(aName) = UPPERCASE(AHeaders[X]) then
        result := X;
  end;

begin
  if OpenDialog2.Execute then
  begin
    AProgress := TfmNewProgress.Create(self);
    try
      ATabFile := TStringList.Create;
      ALines := TStringList.Create;
      ALines.Delimiter := #9;
      AHeaders := TStringList.Create;
      AHeaders.Delimiter := #9;
      LoadingGridData := true;
      try
        ATabFile.LoadFromFile(OpenDialog2.FileName);
        AProgress.initProgress('Processing...', ATabFile.Count);
        if ATabFile.Count > 0 then
          AHeaders.DelimitedText := ATabFile[0];

        IndexStock := FindIndex('SSTOCKCODE');
        IndexQty := FindIndex('FQTY');
        IndexBarcode := FindIndex('SBARCODE');
        IndexSubcode := FindIndex('SSUPCODE');

        IndexPrice := FindIndex('FPRICE');
        MyStock.WStockID := -1;
        if ((IndexStock = -1) and (IndexBarcode = -1) and (IndexSubcode = -1))
          or (IndexQty = -1) or (IndexPrice = -1) then
          raise Exception.Create
            ('Missing columns you need SSTOCKCODE , FQTY, SBARCODE,FPRICE,SSUPCODE in a tab delimited file.');
        tblBatch.DisableControls;
        try
          if not tblBatch.IsEmpty and (tblBatchSREFERENCE.AsString = '') and
            (tblBatchBRECONCILED.AsInteger <> 1) then
            tblBatch.Delete;
          for i := 1 to ATabFile.Count - 1 do
          begin
            ALine := ATabFile[i];
            MyStock.WStockID := -1;
            for X := Length(ALine) downto 1 do
            begin
              if (ALine[X] > #127) { or (ALine[x] = ' ') } then
                Delete(ALine, X, 1);
            end;
            ALines.DelimitedText := ALine;
            AProgress.SetProgress(IntToStr(AProgress.Gauge1.Progress) + '/' +
              IntToStr(AProgress.Gauge1.MaxValue) + ' ' + ALines.Text, i);

            if IndexStock <> -1 then
            begin
              if ALines.Count > IndexStock then
              begin
                ALines[IndexStock] := Trim(ALines[IndexStock]);
                MyStock.WStockID :=
                  StrToIntDef
                  (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
                  ('Select WStockid from stock where sstockcode =' +
                  QuotedStr(Trim(UPPERCASE(ALines[IndexStock]))))), -1);
              end;
              if MyStock.WStockID <> -1 then
                TDataBaseStockRoutines.StockLoadItem(MyStock);
            end;
            if (IndexBarcode <> -1) and (MyStock.WStockID = -1) then
            begin
              if ALines.Count > IndexBarcode then
              begin
                ALines[IndexBarcode] := UPPERCASE(Trim(ALines[IndexBarcode]));
                MyStock.WStockID :=
                  StrToIntDef
                  (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
                  ('Select WStockid from stock where upper(sbarcodenumber) =' +
                  QuotedStr(Trim(ALines[IndexBarcode])))), -1);
              end;
              if MyStock.WStockID <> -1 then
                TDataBaseStockRoutines.StockLoadItem(MyStock);
              if MyStock.WStockID <> -1 then
                if ALines.Count > IndexBarcode then
                begin
                  ALines[IndexBarcode] := UPPERCASE(Trim(ALines[IndexBarcode]));
                  MyStock.WStockID :=
                    StrToIntDef
                    (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
                    ('Select WStockid from stock where Upper(SSTOCKCODESUP1) ='
                    + QuotedStr(Trim(ALines[IndexBarcode])))), -1);
                end;
              if MyStock.WStockID <> -1 then
                TDataBaseStockRoutines.StockLoadItem(MyStock);

            end;

            if (IndexSubcode <> -1) and (MyStock.WStockID = -1) then
            begin
              if ALines.Count > IndexSubcode then
              begin
                ALines[IndexSubcode] := UPPERCASE(Trim(ALines[IndexSubcode]));
                MyStock.WStockID :=
                  StrToIntDef
                  (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
                  ('Select WStockid from stock where Upper(SSTOCKCODESUP1) =' +
                  QuotedStr(Trim(ALines[IndexSubcode])))), -1);
              end;
              if MyStock.WStockID <> -1 then
                TDataBaseStockRoutines.StockLoadItem(MyStock);
              if MyStock.WStockID = -1 then
                if ALines.Count > IndexSubcode then
                begin
                  ALines[IndexSubcode] := UPPERCASE(Trim(ALines[IndexSubcode]));
                  MyStock.WStockID :=
                    StrToIntDef
                    (VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
                    ('Select WStockid from stock where Upper(SSTOCKCODESUP2) ='
                    + QuotedStr(Trim(ALines[IndexBarcode])))), -1);
                end;
              if MyStock.WStockID <> -1 then
                TDataBaseStockRoutines.StockLoadItem(MyStock);

            end;

            fQty := 0;
            FPrice := 0;
            if ALines.Count > IndexQty then
              fQty := StrToFloatDef(StringReplace(Trim(ALines[IndexQty]), '.',
                DecimalSeparator, [rfreplaceall]), 0);
            if ALines.Count > IndexPrice then
              FPrice := StrToFloatDef(StringReplace(Trim(ALines[IndexPrice]),
                '.', DecimalSeparator, [rfreplaceall]), 0);
            // if (LocalDocType in (10,11,

            if Trim(StringReplace(ALine, #9, '', [rfreplaceall])) <> '' then
            begin
              tblBatch.Append;

              If (MyStock.WStockID <> -1) and (fQty <> 0) then
              begin
                tblBatchSDESCRIPTION.Value := MyStock.SDescription;
                tblBatchSREFERENCE.Value := MyStock.SSTOCKCODE;
                tblBatchSACCOUNT.Value := FloatToStrF(fQty, ffFixed, 18,
                  dmDatabase.SetOfBooksPropertys.DataParameter.
                  WDataEntryDecQty);
                tblBatchSCONTRAACCOUNT.Value := FloatToStrF(fQty, ffFixed, 18,
                  dmDatabase.SetOfBooksPropertys.DataParameter.
                  WDataEntryDecQty);
                tblBatchSTAX.ReadOnly := false;
                if DefaultTaxId <> 0 then
                begin
                  tblBatchSTAX.Value :=
                    TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                    (DefaultTaxId);
                  tblBatchWTAXID.AsInteger := DefaultTaxId;
                end
                else
                begin
                  case LocalDocType of
                    10, 11, 14:
                      begin
                        tblBatchSTAX.Value :=
                          TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                          (MyStock.WOutputTaxID);
                        tblBatchWTAXID.AsInteger := MyStock.WOutputTaxID;
                      end;
                    12, 13, 15:
                      begin
                        tblBatchSTAX.Value :=
                          TDataBaseRoutines.GetAccountCodeWithDashFromAccountId
                          (MyStock.WInputTaxID);
                        tblBatchWTAXID.AsInteger := MyStock.WInputTaxID;
                      end;

                  end;
                end;
                tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
                tblBatchFDEBIT.Value := FPrice;
                tblBatchFCREDIT.Value := FixAmount(fQty * FPrice,
                  dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
                if FPrice = 0 then
                begin
                  case LocalDocType of
                    10, 11, 14:
                      begin
                        tblBatchFDEBIT.Value :=
                          TDataBaseStockRoutines.getStockPrice(edtWAccountID,
                          MyStock.WStockID, fQty);
                        tblBatchFCREDIT.Value :=
                          FixAmount(fQty * tblBatchFDEBIT.Value,
                          dmDatabase.SetOfBooksPropertys.DataParameter.
                          WDocRowDecimals);
                      end;
                  end;
                end;
                tblBatchBRECONCILED.Value := 0;
                tblBatchBEXCLUSIVE.Value := 1;
              end
              else
              begin
                tblBatchBRECONCILED.Value := 1;
                tblBatchWACCOUNTID.AsInteger := AddMessage(ALine);
                tblBatchSDESCRIPTION.Value :=
                  _ReadDescription(tblBatchWACCOUNTID.AsInteger);
              end;
              tblBatch.post;
            end; // trim ATabFile[i] <> ''
          end;
        finally
          // tblBatch.EnableControls;
          UpdateTotalsLbls;
        end;
      finally
        LoadingGridData := false;
        ATabFile.free;
        ALines.free;
        AHeaders.free;
      end;
    finally
      AProgress.free;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.pmPasteFromClipPopup(Sender: TObject);
begin
  Importfromtabfile1.Visible := DMTCCoreLink.ReadNwReportOp
    ('PLEXPIMP_ON', false);

end;

procedure TfmInvoiceEntryGrid.edtOrderNumberDblClick(Sender: TObject);
var
  NextNum: String;
begin
  if edtOrderNumber.Text = '' then
    if LocalDocType = 14 then
    begin
      NextNum := DMTCCoreLink.ReadSysParam('ORDERNEXTNUM', 'OR00001', 0);
      edtOrderNumber.Text := NextNum;
      DMTCCoreLink.WriteSysParam('ORDERNEXTNUM',
        TDataBaseStringRoutines.IncrementString(NextNum));
    end;
end;

procedure TfmInvoiceEntryGrid.EditAccount1Click(Sender: TObject);
begin
  // Exit if where looking at a posted one.
  if not(QDocHeadBPOSTED.AsInteger = 0) and not(LocalDocType in [15, 14]) then
  begin
    exit;
  end;
  if QDocHead.IsEmpty then
    exit;
  if LookAccType = 1 then
  // pull up the defaults for the debtor
  begin
    if Not Assigned(fmDebtor) then
      fmDebtor := TfmDebtor.Create(self);

    fmDebtor.UseCreditor := false;
    fmDebtor.AsFindScreen(true);
    fmDebtor.GoToID := QDocHeadWACCOUNTID.AsInteger;
    if fmDebtor.ShowModal <> mrok then
    begin

      fmDebtor.GoToID := 0;
      exit;
    end;
    fmDebtor.GoToID := 0;
    if fmDebtor.QDebtorCreditor.IsEmpty then
      exit;
    edtAccountNumber.Text := AddDashInAccCodeNoPRefix
      (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);
    edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

  end
  else
  // pull up the defaults for the Creditor
  begin

    if Not Assigned(fmDebtor) then
      fmDebtor := TfmDebtor.Create(self);

    fmDebtor.AsFindScreen(true);
    fmDebtor.UseCreditor := true;
    fmDebtor.GoToID := QDocHeadWACCOUNTID.AsInteger;
    if fmDebtor.ShowModal <> mrok then
    begin

      fmDebtor.GoToID := 0;
      exit;
    end;
    fmDebtor.GoToID := 0;
    if fmDebtor.QDebtorCreditor.IsEmpty then
      exit;
    edtAccountNumber.Text := AddDashInAccCodeNoPRefix
      (fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString);
    edtWAccountID := fmDebtor.QDebtorCreditorWAccountID.AsInteger;

  end;
  dmDatabase.tblDocHeader.SQL.Text := 'Select * from dochead where WDocid=' +
    QDocHeadWDOCID.AsString;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocHeader.Edit;
  dmDatabase.tblDocHeaderWAccountID.AsInteger := edtWAccountID;
  FillAccountInfoInDocHead(edtWAccountID, true);
  dmDatabase.tblDocHeader.post;
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.EditStockTimer(Sender: TObject);
begin
  if LastDocPosted then
  begin
    exit;
  end;
  SelectStockItem;
  if (tblBatchBRECONCILED.Value = 1) then
    exit;
  if LastStock.WStockTypeId = 10 then
    exit;
  if (tblBatch.State in [DsInsert]) then
    if GoToStockQty then
    begin
      cxGrid1.SetFocus;
      cxGrid1DBTableView1.Controller.FocusedColumnindex :=
        cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex;

    end;
end;

procedure TfmInvoiceEntryGrid.Image3DblClick(Sender: TObject);
begin
  if (LastDocPosted) then
  begin
    exit;
  end;
  // if QDocHead.IsEmpty then exit ;
  if Not Assigned(fmDebtor) then
    fmDebtor := TfmDebtor.Create(self);

  fmDebtor.UseCreditor := false;

  fmDebtor.AsFindScreen(true);
  if fmDebtor.ShowModal <> mrok then
    exit;
  if fmDebtor.QDebtorCreditor.IsEmpty then
    exit;

  fmDebtor.tblDebtor.close;
  fmDebtor.tblDebtor.Params[0].AsInteger :=
    fmDebtor.QDebtorCreditorWAccountID.AsInteger;
  fmDebtor.tblDebtor.Open;
  fmDebtor.tblCreditor.close;
  fmDebtor.tblCreditor.Params[0].AsInteger :=
    fmDebtor.QDebtorCreditorWAccountID.AsInteger;
  fmDebtor.tblCreditor.Open;

  if fmDebtor.tblDebtorSDELIVERY1.AsString <> '' then
  begin
    EDelCompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EDelAdr1.Text := fmDebtor.tblDebtorSDELIVERY1.AsString;
    EDelAdr2.Text := fmDebtor.tblDebtorSDELIVERY2.AsString;
    EDelAdr3.Text := fmDebtor.tblDebtorSDELIVERY3.AsString;
    EDelPostal.Text := fmDebtor.tblDebtorSDELIVERYCODE.AsString;
    CBDelCountry.ItemIndex := CBDelCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblDebtorWDELCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithSelect(EDelContact.Items,
      'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) name FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger) + ')');
    EDelContact.Text := fmDebtor.QDebtorCreditorLastName.AsString;
    EDelContact.Tag := fmDebtor.tblDebtorWCONTACTID.AsInteger;
  end
  else if fmDebtor.tblCreditorSDELIVERY1.AsString <> '' then
  begin
    EDelCompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EDelAdr1.Text := fmDebtor.tblCreditorSDELIVERY1.AsString;
    EDelAdr2.Text := fmDebtor.tblCreditorSDELIVERY2.AsString;
    EDelAdr3.Text := fmDebtor.tblCreditorSDELIVERY3.AsString;
    EDelPostal.Text := fmDebtor.tblCreditorSDELIVERYCODE.AsString;
    CBDelCountry.ItemIndex := CBDelCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblCreditorWDELCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithSelect(EDelContact.Items,
      'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) name FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger) + ')');
    EDelContact.Text := fmDebtor.QDebtorCreditorLastName.AsString;
    EDelContact.Tag := fmDebtor.tblCreditorWCONTACTID.AsInteger;
  end
  else if fmDebtor.tblDebtorSPOSTAL1.AsString <> '' then
  begin
    EDelCompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EDelAdr1.Text := fmDebtor.tblDebtorSPOSTAL1.AsString;
    EDelAdr2.Text := fmDebtor.tblDebtorSPOSTAL2.AsString;
    EDelAdr3.Text := fmDebtor.tblDebtorSPOSTAL3.AsString;
    EDelPostal.Text := fmDebtor.tblDebtorSPOSTALCODE.AsString;
    CBDelCountry.ItemIndex := CBDelCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblDebtorWPOSTCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithSelect(EDelContact.Items,
      'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) name FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger) + ')');
    EDelContact.Text := fmDebtor.QDebtorCreditorLastName.AsString;
    EDelContact.Tag := fmDebtor.tblDebtorWCONTACTID.AsInteger;
  end
  else if fmDebtor.tblCreditorSPOSTAL1.AsString <> '' then
  begin
    EDelCompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EDelAdr1.Text := fmDebtor.tblCreditorSPOSTAL1.AsString;
    EDelAdr2.Text := fmDebtor.tblCreditorSPOSTAL2.AsString;
    EDelAdr3.Text := fmDebtor.tblCreditorSPOSTAL3.AsString;
    EDelPostal.Text := fmDebtor.tblCreditorSPOSTALCODE.AsString;
    CBDelCountry.ItemIndex := CBDelCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblCreditorWPOSTCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithSelect(EDelContact.Items,
      'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) name FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger) + ')');
    EDelContact.Text := fmDebtor.QDebtorCreditorLastName.AsString;
    EDelContact.Tag := fmDebtor.tblCreditorWCONTACTID.AsInteger;
  end;
  // CBDelCountry.ItemIndex :=  fmDebtor.QDebtorCreditorSPostalCode.AsString ;

end;

procedure TfmInvoiceEntryGrid.BPutOnAccountClick(Sender: TObject);
var
  aReturn: String;
  AReturnId: Integer;
begin
  AReturnId := BPutOnAccount.Tag;
  osfLookup.OSFGetLookupValue(aReturn, AReturnId, 'Select account', 'INVACC',
    tcstGLTHREE, tcltAccount, AReturnId, 0);

  BPutOnAccount.Tag := AReturnId;
  if BPutOnAccount.Tag = -1 then
    BPutOnAccount.Tag := 0;
  BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
    DMTCCoreLink.GetTextLang(1990);
  if BPutOnAccount.Tag <> 0 then
    BPutOnAccount.caption := DMTCCoreLink.GetTextLang(1868) + ':' +
      TDataBaseRoutines.GetAccountCode(BPutOnAccount.Tag);

end;

procedure TfmInvoiceEntryGrid.tblBatchSREFERENCEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

  if (tblBatchWCONTRAACCOUNTID.AsInteger <> 0) and (DisplayText) and
    (tblBatchBRECONCILED.AsInteger = 0) then
  begin
    ATempStockList.getStock(astockrecpointer, tblBatchSREFERENCE.AsString);
    aAccountRecList.getAccountOnid(AAccRec, tblBatchWCONTRAACCOUNTID.AsInteger);
    Text := astockrecpointer^.SSTOCKCODE + ' ' + AAccRec.SACCOUNTCODE;
  end
  else
  begin
    if (DisplayText) and (tblBatchBRECONCILED.AsInteger = 0) and
      (LocalDocType in [13, 12, 15]) then

    begin
      ATempStockList.getStock(astockrecpointer, tblBatchSREFERENCE.AsString);
      if CustomGetSuppCodeSql <> '' then
      begin
        astockrecpointer^.SSTOCKCODESUP1 :=
          VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
          (TDatabaseTableRoutines.ReplaceParams(CustomGetSuppCodeSql,
          'WACCOUNTID=' + IntToStr(edtWAccountID) + #13 + #10 + 'WSTOCKID=' +
          IntToStr(astockrecpointer^.WStockID))));
      end;
      if astockrecpointer^.SSTOCKCODESUP1 <> '' then
        Text := astockrecpointer^.SSTOCKCODESUP1 + ' (' +
          astockrecpointer^.SSTOCKCODE + ')'
      else
        Text := tblBatchSREFERENCE.AsString;
    end
    else
      Text := tblBatchSREFERENCE.AsString;

  end;
end;

procedure TfmInvoiceEntryGrid.LPaymentTotalDblClick(Sender: TObject);

begin
  if fmInvocePayment.ZQGetPaymentTypes.IsEmpty then
    exit;

  fmInvocePayment.PaymentDetails := PaymentDetails;
  fmInvocePayment.Total := StrToFloatDef(lblInvAmt.caption, 0);
  fmInvocePayment.isReadonly := not cxGrid1DBTableView1.OptionsData.Editing;
  fmInvocePayment.BJusPayment := true;

  if fmInvocePayment.ShowModal = mrok then
    UpdateTotalsLbls;
end;

procedure TfmInvoiceEntryGrid.QDocHeadAfterOpen(DataSet: TDataSet);
begin
  BDelete.Enabled := ((QDocHeadBPOSTED.AsInteger = 0) or
    (LocalDocType in [14, 15])) and (not QDocHead.IsEmpty);
end;

procedure TfmInvoiceEntryGrid.EContactChange(Sender: TObject);
var
  ContactID: Integer;
begin
  if EContact.ItemIndex > -1 then
  begin
    ContactID := Integer(EContact.Items.Objects[EContact.ItemIndex]);
    EContact.Tag := ContactID;
    EDocEmailAddress.Text :=
      VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
      ('Select EMAIL from contacts where RECORDID =  ' + IntToStr(ContactID)));
  end;
end;

procedure TfmInvoiceEntryGrid.Image2DblClick(Sender: TObject);
var
  AFormat: String;
begin
  AFormat := DMTCCoreLink.ReadLongSysparam('CONTACTFORMAT', 0);
  if AFormat = '' then
    AFormat := '<@SHORTNAME@>';

  if (LastDocPosted) then
  begin
    exit;
  end;
  // if QDocHead.IsEmpty then exit ;
  if Not Assigned(fmDebtor) then
    fmDebtor := TfmDebtor.Create(self);

  fmDebtor.UseCreditor := (LocalDocType in [12, 13, 15]);

  fmDebtor.AsFindScreen(true);
  if fmDebtor.ShowModal <> mrok then
    exit;
  if fmDebtor.QDebtorCreditor.IsEmpty then
    exit;

  fmDebtor.tblDebtor.close;
  fmDebtor.tblDebtor.Params[0].AsInteger :=
    fmDebtor.QDebtorCreditorWAccountID.AsInteger;
  fmDebtor.tblDebtor.Open;
  fmDebtor.tblCreditor.close;
  fmDebtor.tblCreditor.Params[0].AsInteger :=
    fmDebtor.QDebtorCreditorWAccountID.AsInteger;
  fmDebtor.tblCreditor.Open;

  if fmDebtor.tblDebtorSPOSTAL1.AsString <> '' then
  begin
    ECompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EPostal1.Text := fmDebtor.QDebtorCreditorSPostal1.AsString;
    EPostal2.Text := fmDebtor.QDebtorCreditorSPostal2.AsString;
    EPostal3.Text := fmDebtor.QDebtorCreditorSPostal3.AsString;
    EPostalCode.Text := fmDebtor.QDebtorCreditorSPostalCode.AsString;
    CBCountry.ItemIndex := CBCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblDebtorWPOSTCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithFormatSelect(EContact.Items,
      'SELECT RECORDID aUID, trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(edtWAccountID) + ')', AFormat, 0);
    EContact.ItemIndex := EContact.Items.IndexOfObject
      (TObject(fmDebtor.tblDebtorWCONTACTID.AsInteger));
    EContact.Tag := fmDebtor.tblDebtorWCONTACTID.AsInteger;
  end;
  if fmDebtor.tblCreditorSPOSTAL1.AsString <> '' then
  begin
    ECompany.Text := fmDebtor.QDebtorCreditorSDescription.AsString;
    EPostal1.Text := fmDebtor.QDebtorCreditorSPostal1.AsString;
    EPostal2.Text := fmDebtor.QDebtorCreditorSPostal2.AsString;
    EPostal3.Text := fmDebtor.QDebtorCreditorSPostal3.AsString;
    EPostalCode.Text := fmDebtor.QDebtorCreditorSPostalCode.AsString;
    CBCountry.ItemIndex := CBCountry.Items.IndexOfObject
      (TObject(fmDebtor.tblCreditorWPOSTCOUNTRIES_ID.AsInteger));
    TDataBaseStringRoutines.FillStringListWithFormatSelect(EContact.Items,
      'SELECT RECORDID aUID, trim(trim(trim(COALESCE(TITLE,' + QuotedStr('') +
      ')) ||' + QuotedStr(' ') + ' || COALESCE(FIRSTNAME,' + QuotedStr('') +
      ')) || ' + QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,' + QuotedStr('')
      + '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '
      + IntToStr(edtWAccountID) + ')', AFormat, 0);
    EContact.ItemIndex := EContact.Items.IndexOfObject
      (TObject(fmDebtor.tblCreditorWCONTACTID.AsInteger));
    EContact.Tag := fmDebtor.tblCreditorWCONTACTID.AsInteger;
  end;
  // CBDelCountry.ItemIndex :=  fmDebtor.QDebtorCreditorSPostalCode.AsString ;

end;

procedure TfmInvoiceEntryGrid.ReaplayITemsDicountsClick(Sender: TObject);

var
  i, WExtraItemId: Integer;
  ExtraItemText, ExtraItemCode, lastitem: String;
  ExtraValue: Variant;
  ExtraQty: Double;
  ABookmark:
{$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
  procedure DoDocument;
  begin
    edtAccountNumber.Text := AddDashInAccCodeNoPRefix
      (QDocHeadSACCOUNTCODE.AsString);
    edtWAccountID := QDocHeadWACCOUNTID.AsInteger;
    cbInvoiceNumber.Items.clear;
    cbInvoiceNumber.Items.Add(QDocHeadSDOCNO.AsString);
    cbInvoiceNumber.ItemIndex := 0;
    LastDocHeaderId := QDocHeadWDOCID.AsInteger;
    if LookAccType = 1 then
      // pull up the defaults for the debtor
      LoadDebtors
    else
      // pull up the defaults for the Creditor
      LoadCreditors;

    UpdateAccountInfo;
    cbInvoiceNumberExit(self);
    pnlDocLines.Visible := true;

    EnterDocLinesScr(self);
    NBDocuments.PageIndex := 1;
    FormResize(self);
    if not LastDocPosted then
    begin
      if WExtraItemId <> 0 then
      begin
        tblBatch.first;
        While not tblBatch.Eof do
        begin
          if (tblBatchBRECONCILED.AsInteger <> 1) and
            (ExtraItemCode = tblBatchSREFERENCE.AsString) then
            tblBatch.Delete
          else
            tblBatch.next;
        end;
      end;

      tblBatch.first;
      GlobalDiscount := StrToFloatDef(lbDiscountperc.caption, 0);
      While not tblBatch.Eof do
      begin

        loadCurrentItem(true);
        ApplyStockCodeToCurrentRecord;
        if (LastStock.FDiscount = 0) and (LastStock.BApplyDiscount) and
          (GlobalDiscount <> 0) then
        begin
          tblBatch.Edit;
          tblBatchFCREDIT.Value :=
            FixAmount(((Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
            tblBatchFDEBIT.AsFloat) -
            (((Str2Float(tblBatchSCONTRAACCOUNT.AsString)) *
            tblBatchFDEBIT.AsFloat) * (GlobalDiscount / 100)),
            dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
          tblBatchFTAXAMOUNT.AsFloat := GlobalDiscount;
          tblBatch.post;
        end;

        tblBatch.next;
      end;
      if WExtraItemId <> 0 then
      begin
        tblBatch.DisableControls;
        try
          tblBatch.last;
          while not tblBatch.Bof do
          begin
            ExtraValue := DMTCCoreLink.OpenSqlReturnFirstColumn
              ('select flinkedamount from HORECAPOS_STOCK where WStockid = ' +
              IntToStr(TDataBaseStockRoutines.GetStockid
              (tblBatchSREFERENCE.AsString)));
            if VarToStr(ExtraValue) <> '' then
            begin
              ABookmark := tblBatch.Bookmark;
              ExtraQty := StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 0);
              lastitem := tblBatchSDESCRIPTION.AsString;
              tblBatch.Append;
              tblBatchSREFERENCE.AsString := ExtraItemCode;
              loadCurrentItem(true);
              ApplyStockCodeToCurrentRecord;

              tblBatch.Edit;
              tblBatchSACCOUNT.AsFloat := ExtraQty * tblBatchFUNITQTY.AsFloat;
              tblBatchSCONTRAACCOUNT.AsFloat := ExtraQty;
              tblBatchFDEBIT.AsFloat := ExtraValue;
              tblBatchFCREDIT.Value :=
                FixAmount((Str2Float(tblBatchSCONTRAACCOUNT.AsString) *
                tblBatchFDEBIT.AsFloat),
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
              tblBatchSDESCRIPTION.AsString :=
                Trim(ExtraItemText + ' ' + lastitem);
              tblBatchFTAXAMOUNT.AsFloat := 0;
              tblBatch.post;

              tblBatch.Bookmark := ABookmark;
            end;
            tblBatch.Prior;
          end;
        finally

          tblBatch.EnableControls;
        end;
      end;
      ExitDocLinesScr(self);
    end;
    NBDocuments.PageIndex := 0;
    FormResize(self);
  end;

begin
  WExtraItemId := DMTCCoreLink.ReadNwReportOp('RETAILEXTRAITEM', 0);
  ExtraItemText := TDataBaseStockRoutines.GetStockDescription(WExtraItemId);
  ExtraItemCode := TDataBaseStockRoutines.GetStockCode(WExtraItemId);
  lastitem := '';
  LoadingGridData := true;
  try
    if (cxlistDBTable.Controller.SelectedRecordCount <> 0) and
      (Sender <> nil) then
    begin
      for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
      begin
        cxlistDBTable.Controller.SelectedRecords[i].Focused := true;

        DoDocument;
      end;
    end
    else
    begin
      DoDocument;
    end;
    if Sender <> nil then
      RefreschDocumentList;
  finally
    LoadingGridData := false;
  end;
end;

procedure TfmInvoiceEntryGrid.EFastbarcodelookupKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    if Trim(EFastbarcodelookup.Text) <> '' then
    begin
      tlbtnInsertClick(EFastbarcodelookup);

      EFastbarcodelookup.SelectAll;
    end;
  if EditStockPrices and (LocalDocType in [12, 13, 15, 17]) then
  begin
    SetStockEditPrice;
  end;
end;

procedure TfmInvoiceEntryGrid.EContactDblClick(Sender: TObject);
Var
  aQuery: TuniQuery;

begin
  if EContact.Tag <> 0 then
  begin
    aQuery := TuniQuery.Create(nil);
    try
      aQuery.Connection := DMTCCoreLink.TheZConnection;
      aQuery.SQL.Text :=
        'SELECT  COMPANY,ADDRESS, CITY, STATE, ZIP, COUNTRY FROM CONTACTS where RECORDID ='
        + IntToStr(EContact.Tag);

      aQuery.Open;
      if not aQuery.IsEmpty then
      begin
        if aQuery.FieldByName('COMPANY').AsString <> '' then
          ECompany.Text := aQuery.FieldByName('COMPANY').AsString;

        if aQuery.FieldByName('ADDRESS').AsString <> '' then
          EPostal1.Text := aQuery.FieldByName('ADDRESS').AsString;
        if aQuery.FieldByName('CITY').AsString <> '' then
          EPostal2.Text := aQuery.FieldByName('CITY').AsString;
        if aQuery.FieldByName('STATE').AsString <> '' then
          EPostal3.Text := aQuery.FieldByName('STATE').AsString;
        if aQuery.FieldByName('ZIP').AsString <> '' then
          EPostalCode.Text := aQuery.FieldByName('ZIP').AsString;
        if aQuery.FieldByName('COUNTRY').AsString <> '' then
          CBCountry.ItemIndex := CBCountry.Items.IndexOf
            (aQuery.FieldByName('COUNTRY').AsString);

      end;
    finally
      aQuery.free;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.EDelContactDblClick(Sender: TObject);
Var
  aQuery: TuniQuery;

begin
  if EDelContact.Tag <> 0 then
  begin
    aQuery := TuniQuery.Create(nil);
    try
      aQuery.Connection := DMTCCoreLink.TheZConnection;
      aQuery.SQL.Text :=
        'SELECT  COMPANY,ADDRESS, CITY, STATE, ZIP, COUNTRY FROM CONTACTS where RECORDID ='
        + IntToStr(EDelContact.Tag);
      aQuery.Open;
      if not aQuery.IsEmpty then
      begin
        if aQuery.FieldByName('COMPANY').AsString <> '' then
          EDelCompany.Text := aQuery.FieldByName('COMPANY').AsString;

        if aQuery.FieldByName('ADDRESS').AsString <> '' then
          EDelAdr1.Text := aQuery.FieldByName('ADDRESS').AsString;
        if aQuery.FieldByName('CITY').AsString <> '' then
          EDelAdr2.Text := aQuery.FieldByName('CITY').AsString;
        if aQuery.FieldByName('STATE').AsString <> '' then
          EDelAdr3.Text := aQuery.FieldByName('STATE').AsString;
        if aQuery.FieldByName('ZIP').AsString <> '' then
          EDelPostal.Text := aQuery.FieldByName('ZIP').AsString;
        if aQuery.FieldByName('COUNTRY').AsString <> '' then
          CBDelCountry.ItemIndex := CBDelCountry.Items.IndexOf
            (aQuery.FieldByName('COUNTRY').AsString);

      end;
    finally
      aQuery.free;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.EDelContactChange(Sender: TObject);
var
  ContactID: Integer;
begin
  if EDelContact.ItemIndex > -1 then
  begin
    ContactID := Integer(EDelContact.Items.Objects[EDelContact.ItemIndex]);
    EDelContact.Tag := ContactID;

  end;
end;

procedure TfmInvoiceEntryGrid.CBDocLayoutDropDown(Sender: TObject);
begin
  CBDocLayout.Perform(CB_SETDROPPEDWIDTH, 250, 0);
end;

procedure TfmInvoiceEntryGrid.CBDocLayout2DropDown(Sender: TObject);
begin
  CBDocLayout2.Perform(CB_SETDROPPEDWIDTH, 250, 0);
end;

procedure TfmInvoiceEntryGrid.BSavePriceChangeClick(Sender: TObject);
begin
  if btnEnterIncExc.Tag = 0 then
  begin
    ExecSql('Update stock set FSellingprice1 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice1.Text, 0)),
      DecimalSeparator, '.', [rfreplaceall]) + ', FSellingprice2 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice2.Text, 0)),
      DecimalSeparator, '.', [rfreplaceall]) + ', FSellingprice3 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice3.Text, 0)),
      DecimalSeparator, '.', [rfreplaceall]) + ' where wstockid = ' +
      IntToStr(LastStock.WStockID));
  end
  else
  begin
    ExecSql('Update stock set FSellingprice1 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice1.Text,
      0) / TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID))),
      DecimalSeparator, '.', [rfreplaceall]) + ', FSellingprice2 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice2.Text,
      0) / TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID))),
      DecimalSeparator, '.', [rfreplaceall]) + ', FSellingprice3 = ' +
      StringReplace(FloatToStr(StrToFloatDef(EPrice3.Text,
      0) / TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID))),
      DecimalSeparator, '.', [rfreplaceall]) + ' where wstockid = ' +
      IntToStr(LastStock.WStockID));
  end;
  if EPricePurchase.Visible then
  begin
    if StrToFloatDef(EPricePurchase.Text, 0) <> 0 then
    begin
      ExecSql('Update stock set FUNITCOST = ' +
        TDatabaseTableRoutines.GetFirebirdsSqlForFloat
        (StrToFloatDef(EPricePurchase.Text, 0)) + ' where wstockid = ' +
        IntToStr(LastStock.WStockID));
      tblBatch.Edit;
      tblBatchFDEBIT.AsFloat := StrToFloatDef(EPricePurchase.Text, 0) *
        tblBatchFUNITQTY.AsFloat;
      tblBatch.post;
    end;
  end;
  ExecSql('Update stock set Sdescription = ' + QuotedStr(ENewDescription.Text) +
    ' where wstockid = ' + IntToStr(LastStock.WStockID));

  if PEXtraData.Visible then
  begin
    ExecSql('Update stock set FREORDERQTY = ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForFloat
      (StrToFloatDef(EedtReord.Text, 0)) + ' , FREORDERQTYTRIG = ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForFloat
      (StrToFloatDef(EEdiTrigg.Text, 0)) + ' , FMINIMUMQTY = ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForFloat
      (StrToFloatDef(EEdtMIN.Text, 0)) +

      ' where wstockid = ' + IntToStr(LastStock.WStockID));

  end;
  tblBatch.Edit;
  tblBatchSDESCRIPTION.AsString := ENewDescription.Text;
  tblBatch.post;
  if cbDefsupp.Checked then
    ExecSql('Update stock set WSUPPLIER1ID = ' + IntToStr(edtWAccountID) +
      ' where wstockid = ' + IntToStr(LastStock.WStockID))
  else if TDataBaseStockRoutines.GetDefSup1(LastStock.WStockID)
    = edtWAccountID then
    if OSFMessageDlg('Remove Supplier?', mtConfirmation, [mbYes, mbNo], 0)
      = mryes then
      ExecSql('Update stock set WSUPPLIER1ID = ' + IntToStr(0) +
        ' where wstockid = ' + IntToStr(LastStock.WStockID));

  ATempStockList.reinitStock(LastStock.SSTOCKCODE);
  loadCurrentItem(true);
end;

procedure TfmInvoiceEntryGrid.SetStockEditPrice;
begin
  PEditPrice.Visible := true;

  PEditPriceInner.Visible := true;

  if btnEnterIncExc.Tag = 0 then
  begin
    EPrice1.Text := FloatToStr(LastStock.FPrice1);
    EPrice2.Text := FloatToStr(LastStock.FPrice2);
    EPrice3.Text := FloatToStr(LastStock.FPrice3);
  end
  else
  begin
    EPrice1.Text := FloatToStr(LastStock.FPrice1 *
      TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID)));
    EPrice2.Text := FloatToStr(LastStock.FPrice2 *
      TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID)));
    EPrice3.Text := FloatToStr(LastStock.FPrice3 *
      TDataBaseRoutines.gettaxrateonId((LastStock.WOutputTaxID)));
  end;
  ENewDescription.Text := LastStock.SDescription;
  EPricePurchase.Text := FloatToStr(LastStock.FUnitCost);
  EPricePurchase.Visible := BPurVis and (LocalDocType in [12, 15, 16, 17]);
  LEPricePurchase.Visible := BPurVis and (LocalDocType in [12, 15, 16, 17]);
  if PEXtraData.Visible then
  begin
    EEdiTrigg.Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select FREORDERQTYTRIG from stock where WStockid = ' +
      IntToStr(LastStock.WStockID)));
    EEdtMIN.Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select FMINIMUMQTY from stock where WStockid = ' +
      IntToStr(LastStock.WStockID)));
    EedtReord.Text := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select FREORDERQTY from stock where WStockid = ' +
      IntToStr(LastStock.WStockID)));
    Lsale30.caption := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '
      + IntToStr(LastStock.WStockID) +
      ' and dochead.WTypeid = 10 and dochead.ddate between  ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date - 30) + ' and ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date)));
    Lsale60.caption := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '
      + IntToStr(LastStock.WStockID) +
      ' and dochead.WTypeid = 10 and dochead.ddate between  ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date - 60) + ' and ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date)));
    Lsale90.caption := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
      ('Select sum(FQTYSHIPPED) from docline join dochead on dochead.WDocid = Docline.Wdocid where WLINETYPEID <> 91 and WStockid = '
      + IntToStr(LastStock.WStockID) +
      ' and dochead.WTypeid = 10 and dochead.ddate between  ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date - 90) + ' and ' +
      TDatabaseTableRoutines.GetFirebirdsSqlForDate(Date)));

  end;

  cbDefsupp.Checked := TDataBaseStockRoutines.GetDefSup1(LastStock.WStockID)
    = edtWAccountID;

  MOptions.Visible := MOptions.Text <> '';
  if self.parent = nil then
    self.Invalidate;
end;

procedure TfmInvoiceEntryGrid.Panel3Exit(Sender: TObject);
begin
  // PEditPriceInner.Visible := false ;
end;

procedure TfmInvoiceEntryGrid.Totals1Click(Sender: TObject);

var
  i, Docs: Integer;
  TotalInc, TotalExcl, TotalOpen: Double;
  procedure AddToTotals;
  begin
    inc(Docs);
    TotalInc := TotalInc + QDocHeadFDOCAMOUNT.AsFloat;
    TotalExcl := TotalExcl + QDocHeadFDOCAMOUNT.AsFloat -
      QDocHeadFTAXAMOUNT.AsFloat;
    TotalOpen := TotalOpen + QDocHeadOPENAMOUNT.AsFloat;
  end;

begin
  TotalInc := 0;
  TotalExcl := 0;
  TotalOpen := 0;
  Docs := 0;
  QDocHead.first;
  if QDocHead.IsEmpty then
    exit;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      AddToTotals;
    end;
  end
  else
    while not QDocHead.Eof do
    begin
      AddToTotals;
      QDocHead.next;
    end;

  OSFMessageDlg('Total inc     ' + #9 + RightStr('                     ' +
    FloatToStr(TotalInc), 16) + #13 + #10 + 'Total excl    ' + #9 +
    RightStr('                     ' + FloatToStr(TotalExcl), 16) + #13 + #10 +
    'Total open    ' + #9 + RightStr('                     ' +
    FloatToStr(TotalOpen), 16) + #13 + #10 + 'Total records ' + #9 +
    RightStr('                     ' + FloatToStr(Docs), 16), mtinformation,
    [mbok], 0, true, 'Terminal');
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
  AStockRec: TStockRecPointer;
begin

  if OutOfStockDrawColors then
  begin
    if Field = tblBatchSCONTRAACCOUNT then
      if tblBatchBRECONCILED.AsInteger = 0 then
        if not(cbPosted.ItemIndex = 2) then
          if (LocalDocType in [10, 14]) then
          begin
            if ATempStockList.getStock(AStockRec,
              tblBatchSREFERENCE.AsString) then
            begin
              TDataBaseStockRoutines.SyncQty(AStockRec^, LocalDocType,
                LastDocHeaderId);
            end;
            // StockId := TDataBaseStockRoutines.GetStockID(tblBatchSREFERENCE.AsString);
            if (AStockRec^.WStockTypeId in [0, 1, 9]) then
            begin
              // TotalOnHand := TDataBaseStockRoutines.GetStockQty(StockId) - StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString,0)  ;
              // TotalOnHand := TotalOnHand - TDataBaseStockRoutines.GetUnpostedStockItemCount(StockId,LastDocHeaderId);

              if ((AStockRec^.FQtyOnHand - AStockRec^.FUnpostedItems) -
                StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 0)) < 0 then
              begin
                ABrush.Color := clRed;
                AFont.Color := clWhite;
                if ((AStockRec^.FQtyOnHand - AStockRec^.FUnpostedItems +
                  AStockRec^.FQtyInOrder) -
                  StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 0)) >= 0 then
                begin
                  ABrush.Color := $000078F0;
                  AFont.Color := clWhite;
                end;
              end;
            end;
          end;
  end;
end;

procedure TfmInvoiceEntryGrid.DBGSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  ctrlDown := (ssCtrl in Shift);
  if ((Key = ord('a')) or (Key = ord('A'))) and ctrlDown then
  begin
    cxlistDBTable.Controller.SelectAll;
  end;
end;

procedure TfmInvoiceEntryGrid.DBGSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ctrlDown := false;
end;

procedure TfmInvoiceEntryGrid.Up1Click(Sender: TObject);
var
  Old, New, Tmp: Integer;
  i: Integer;
begin
  cxGrid1DBTableView1.DataController.DataSource := nil;
  try
    tblBatch.IndexFieldNames := '';
    if (tblBatch.State in [dsedit, DsInsert]) then
      tblBatch.post;

    if tblBatch.IsEmpty then
      exit;
    tblBatch.DisableControls;
    try

      Old := tblBatchWLINEID.AsInteger;

      tblBatch.first;
      i := 0;
      while not tblBatch.Eof do
      begin

        tblBatch.Edit;
        tblBatchWLINKEDID.AsInteger := i;
        inc(i);
        tblBatch.post;
        tblBatch.next;
      end;
      tblBatch.IndexFieldNames := 'WLINKEDID';
      tblBatch.Refresh;

      tblBatch.Locate('WLINEID', Old, []);

      New := tblBatchWLINKEDID.AsInteger;
      tblBatch.Prior;

      Tmp := tblBatchWLINKEDID.AsInteger;
      tblBatch.Edit;
      tblBatchWLINKEDID.AsInteger := New;
      tblBatch.post;
      tblBatch.Locate('WLINEID', Old, []);
      tblBatch.Edit;
      tblBatchWLINKEDID.AsInteger := Tmp;
      tblBatch.post;
      tblBatch.Refresh;
      tblBatch.Locate('WLINEID', Old, []);
      tblBatch.IndexFieldNames := '';
    finally
      tblBatch.EnableControls;
    end;
  finally
    cxGrid1DBTableView1.DataController.DataSource := dsBatch;

    // dbgridInvoice.RedrawGrid ;

  end;
end;

procedure TfmInvoiceEntryGrid.Down1Click(Sender: TObject);
var
  Old, New, Tmp, i: Integer;

begin
  tblBatch.IndexFieldNames := '';
  if (tblBatch.State in [dsedit, DsInsert]) then
    tblBatch.post;

  if tblBatch.IsEmpty then
    exit;

  tblBatch.DisableControls;
  try
    Old := tblBatchWLINEID.AsInteger;

    tblBatch.first;
    i := 0;
    while not tblBatch.Eof do
    begin

      tblBatch.Edit;
      tblBatchWLINKEDID.AsInteger := i;
      inc(i);
      tblBatch.post;
      tblBatch.next;
    end;
    tblBatch.IndexFieldNames := 'WLINKEDID';
    tblBatch.Refresh;
    tblBatch.Locate('WLINEID', Old, []);

    New := tblBatchWLINKEDID.AsInteger;
    tblBatch.next;

    Tmp := tblBatchWLINKEDID.AsInteger;
    tblBatch.Edit;
    tblBatchWLINKEDID.AsInteger := New;
    tblBatch.post;
    tblBatch.Locate('WLINEID', Old, []);
    tblBatch.Edit;
    tblBatchWLINKEDID.AsInteger := Tmp;
    tblBatch.post;
    tblBatch.Refresh;
    tblBatch.Locate('WLINEID', Old, []);
    tblBatch.IndexFieldNames := '';

  finally
    tblBatch.EnableControls;
  end;
end;

procedure TfmInvoiceEntryGrid.tbAddToBackorderClick(Sender: TObject);
var
  aDiv: Double;

begin
  if (LastDocHeaderId=-1) or ( LastDocHeaderId = 0)  then
  begin
  LastDocHeaderId := TDataBaseDocumentRoutines.AddDocument(idDocType,AccID,'') ;
  dmDatabase.tblDocHeader.SQL.Text :=
       'select * from dochead where WDocID=' + IntToStr(LastDocHeaderId);
   dmDatabase.tblDocHeader.Open;
   LastDate :=  dmDatabase.tblDocHeaderDSYSDATE.AsDateTime ;
  end;


  fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
  try
    fmBackOrdersOutstanding.ZQBackorder.SQL.Text :=
      'Select * from backord where WAccountid =:WAccountid';
    fmBackOrdersOutstanding.ZQBackorder.Params[0].AsInteger := AccID;
    fmBackOrdersOutstanding.ZQBackorder.Open;
    tblBatch.first;
    if cxGrid1DBTableView1SCONTRAACCOUNT.Visible then
      while not tblBatch.Eof do
      begin
        if tblBatchBRECONCILED.AsInteger = 0 then
          if (Str2Float(tblBatchSACCOUNT.AsString) <
            Str2Float(tblBatchSCONTRAACCOUNT.AsString)) then
            fmBackOrdersOutstanding.FormMode := 2;
        begin
          aDiv := Str2Float(tblBatchSCONTRAACCOUNT.AsString) -
            Str2Float(tblBatchSACCOUNT.AsString);

          if aDiv <> 0 then
          begin
            LastStock.WStockID := DMTCCoreLink.stockObject.GetStockid
              (tblBatchSREFERENCE.Value);
            StockLoadItem(LastStock);
            fmBackOrdersOutstanding.ZQBackorder.DisableControls ;
            try
            fmBackOrdersOutstanding.ZQBackorder.Insert;
            fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsInteger := AccID;
            fmBackOrdersOutstanding.ZQBackorderWStockID.AsInteger :=
              LastStock.WStockID;
            fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat := -aDiv;
            fmBackOrdersOutstanding.ZQBackorderFSellingPrice.AsFloat :=
              tblBatchFDEBIT.Value;
            fmBackOrdersOutstanding.ZQBackorderSSOURCE.AsString :=
              TDataBaseDocumentRoutines.GetDocNo(LastDocHeaderId);
            fmBackOrdersOutstanding.ZQBackorderFDISCOUNT.AsFloat :=
              tblBatchFTAXAMOUNT.Value;
              fmBackOrdersOutstanding.ZQBackorderFPRICE.AsFloat :=

            ((100 - fmBackOrdersOutstanding.ZQBackorderFDISCOUNT.AsFloat)/100) *
            fmBackOrdersOutstanding.ZQBackorderFSellingPrice.AsFloat *  fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat ;

            fmBackOrdersOutstanding.ZQBackorderWUNITID.AsInteger :=
              tblBatchWUNITID.AsInteger;
            fmBackOrdersOutstanding.ZQBackorder.post;
            finally
             fmBackOrdersOutstanding.ZQBackorder.EnableControls ;
            end;
            tblBatch.Edit;
            tblBatchSACCOUNT.AsString := tblBatchSCONTRAACCOUNT.AsString;
            tblBatch.post;
          end;
        end;
        tblBatch.next;
      end;
    fmBackOrdersOutstanding.PageControl1.ActivePage :=
      fmBackOrdersOutstanding.tslist;
    fmBackOrdersOutstanding.tslist.TabVisible := true;
    fmBackOrdersOutstanding.tsBackorder.TabVisible := true;
    fmBackOrdersOutstanding.ShowModal;
    if (LocalDocType in [10, 14]) and
      (dmDatabase.tblDocHeaderBPosted.AsInteger = 0) then
      tbBackorder.Visible := true;

  finally
    FreeAndNil(fmBackOrdersOutstanding);
  end;
end;

procedure TfmInvoiceEntryGrid.tbBackorderClick(Sender: TObject);
var
  OK: Boolean;

begin
  if (LocalDocType in [10, 14]) and
    (dmDatabase.tblDocHeaderBPosted.AsInteger = 0) and
    CheckBackOrder(AccID) then
  begin
    tblBatch.DisableControls;
    try
      fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
      LoadingGridData := true;
      try

        fmBackOrdersOutstanding.vWAccountID := AccID;
        fmBackOrdersOutstanding.ZQBackorder.SQL.Text :=
          'Select * from BACKORD where WAccountID = :AccId';

        fmBackOrdersOutstanding.ZQBackorder.Params[0].AsInteger := AccID;
        fmBackOrdersOutstanding.ZQBackorder.Open;

        tbBackorder.Visible := true;

        fmBackOrdersOutstanding.ShowModal;
        OK := fmBackOrdersOutstanding.MDResult;
        if OK then
          with fmBackOrdersOutstanding do
          begin // Generate BacOrder Items
            tblBatchFDEBIT.ReadOnly := false;
            tblBatchFCREDIT.ReadOnly := false;
            ZQBackorder.Params[0].AsInteger := AccID;
            ZQBackorder.Filtered := false;
            ZQBackorder.filter := 'BSelected=1';
            ZQBackorder.Filtered := true;
            ZQBackorder.first;
            while not ZQBackorder.Eof do
            begin
              if ZQBackorderSSOURCE.AsString <> '' then
              begin
                if EMessage1.Text = '' then
                  EMessage1.Text := ZQBackorderSSOURCE.AsString
                else if EMessage1.Text <> ZQBackorderSSOURCE.AsString then
                begin
                  if EMessage2.Text = '' then
                    EMessage2.Text := ZQBackorderSSOURCE.AsString
                  else if EMessage2.Text <> ZQBackorderSSOURCE.AsString then
                  begin
                    EMessage3.Text := ZQBackorderSSOURCE.AsString
                  end;
                end;
              end;

              LastStock.WStockID := ZQBackorderWStockID.Value;
              StockLoadItem(LastStock);
              UpdateStockRecWithPriceForplugin(LastStock, 1);

              tblBatch.Append;
              tblBatchSACCOUNT.AsString := ZQBackorderFQty.AsString;
              tblBatchSCONTRAACCOUNT.AsString := tblBatchSACCOUNT.AsString;
              tblBatch.DisableControls;
              try
                tblBatchWUNITID.AsInteger := ZQBackorderWUNITID.AsInteger;

              tblBatchFUNITQTY.AsFloat := TDataBaseStockRoutines.GetUnitQty
                (tblBatchWUNITID.AsInteger);
                if tblBatchFUNITQTY.AsFloat = 0 then
                  tblBatchFUNITQTY.AsFloat :=1 ;
              finally
                tblBatch.EnableControls;
              end;
              tblBatchSREFERENCE.Value := LastStock.SSTOCKCODE;
              tblBatchSDESCRIPTION.Value := LastStock.SDescription;
              tblBatchFDEBIT.Value := FixAmount(ZQBackorderFSellingPrice.AsFloat ,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
              tblBatchFCREDIT.Value :=FixAmount(ZQBackorderFPRICE.AsFloat,
                dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);

              tblBatchFTAXAMOUNT.Value :=
                FixAmount(ZQBackorderFDISCOUNT.AsFloat);
              // Add Discount info
              { if  LastStock.BApplyDiscount then
                tblBatchFTAXAMOUNT.Value := FixAmount(DebtDiscount)
                else
                tblBatchFTAXAMOUNT.Value := 0; }
              // GetUserDiscount ;
              tblBatchWTAXID.AsInteger :=
                TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(AccID);
              if tblBatchWTAXID.AsInteger = 0 then
                tblBatchWTAXID.AsInteger := LastStock.WOutputTaxID;

              tblBatchSTAX.ReadOnly := false;
              tblBatchSTAX.Value := AddDashInAccCodeNoPRefix
                (TDataBaseRoutines.GetAccountCode(tblBatchWTAXID.AsInteger));
              tblBatchSTAX.ReadOnly := tblBatchSTAX.Tag = 1;
              tblBatch.post;
              ZQBackorder.next;
            end;
            // Delete all selected items
            ZQBackorder.first;
            while not ZQBackorder.Eof do
              ZQBackorder.Delete;

            ZQBackorder.Filtered := false;
            ZQBackorder.filter := '';
            tbBackorder.Visible := not ZQBackorder.IsEmpty;
            ZQBackorder.close;
          end;

      finally
        FreeAndNil(fmBackOrdersOutstanding);
        LoadingGridData := false;

      end;
    finally
      tblBatch.EnableControls;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.tblBatchAfterInsert(DataSet: TDataSet);
begin
  tblBatchWLINEID.AsInteger :=
    StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn
    ('select 1 + max(WLineID)  from ' + tblBatch.TableName)), 1);
  if tblBatchWLINKEDID.IsNull then
    tblBatchWLINKEDID.AsInteger := tblBatchWLINEID.AsInteger;
  if not LoadingGridData then
  begin
    EditLineTimer.Enabled := false;
    EditLineTimer.Enabled := true;
  end;
end;

procedure TfmInvoiceEntryGrid.tblBatchAfterScroll(DataSet: TDataSet);
begin

  MOptions.Lines.Text := '';
  if tblBatchSREFERENCE.AsString <> '' then
  begin
    MOptions.Lines.Text := DocSelectOptions.GetLineText
      (tblBatchWLINEID.AsInteger);
    MOptions.Visible := (MOptions.Lines.Text <> '');
  end;
  PEditPrice.Visible := (MOptions.Lines.Text <> '') or
    (EditStockPrices and (LocalDocType in [12, 13, 15]));

end;

procedure TfmInvoiceEntryGrid.tblBatchSTAXGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);

begin

  if not tblBatch.IsEmpty then
    if (DisplayText) and (tblBatchWTAXID.AsInteger <> 0) then
    begin

      aAccountRecList.getAccountOnid(AAccRec, tblBatchWTAXID.AsInteger);
      Text := AAccRec.SDescription;
    end
    else
      Text := Sender.AsString;
end;

procedure TfmInvoiceEntryGrid.HandelChangeSalesmanClick(Sender: TObject);
var
  i: Integer;
begin
  if QDocHead.IsEmpty then
    exit;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      ExecSql('Update Dochead set WSalesmanid =' + IntToStr(TComponent(Sender)
        .Tag) + '  where WDocID=' + IntToStr(QDocHeadWDOCID.AsInteger));
    end;
  end
  else
    ExecSql('Update Dochead set WSalesmanid =' + IntToStr(TComponent(Sender)
      .Tag) + '  where WDocID=' + IntToStr(QDocHeadWDOCID.AsInteger));
  RefreschDocumentList(QDocHeadWDOCID.AsInteger);
end;

procedure TfmInvoiceEntryGrid.QDocHeadCalcFields(DataSet: TDataSet);

Var
  AString: String;
  aValue: Extended;
begin
  aValue := 0;
  QDocHeadCALOPENAMOUNT.AsFloat := 0;
  if QDocHeadBPOSTED.AsInteger = 0 then
  begin
    if QDocHeadFDOCAMOUNT.AsFloat <> 0 then
    begin
      if fmInvocePayment.ZQGetPaymentTypes.IsEmpty then
      begin
        QDocHeadCALOPENAMOUNT.AsFloat := QDocHeadFDOCAMOUNT.AsFloat;
      end
      else
      begin
        AString := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
          ('Select sum(FINCLUSIVEAMT) from docline where WLINETYPEID = 93 and Wdocid = '
          + IntToStr(QDocHeadWDOCID.AsInteger)));
        QDocHeadCALOPENAMOUNT.AsFloat := TDataBaseLedgerRoutines.RoundTo
          (QDocHeadFDOCAMOUNT.AsFloat + StrToFloatDef(AString, aValue), 2);

      end;
    end;
  end
  else
  begin
    QDocHeadCALOPENAMOUNT.AsFloat := QDocHeadOPENAMOUNT.AsFloat;
    if QDocHeadOPENAMOUNT.AsFloat <> 0 then
    begin
      AString := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue
        ('Select sum(a.FAMOUNT) from OILINKSPRE a join dochead b on a.WTRANSACTIONID= b.WOPENITEMTRANSACTID '
        + ' and b.WDOCID =  ' + IntToStr(QDocHeadWDOCID.AsInteger)));
      QDocHeadCALOPENAMOUNT.AsFloat := QDocHeadCALOPENAMOUNT.AsFloat -
        TDataBaseLedgerRoutines.RoundTo(StrToFloatDef(AString, aValue), 2);
    end;

    if QDocHeadCALOPENAMOUNT.AsFloat < 0 then
      QDocHeadCALOPENAMOUNT.AsFloat := -QDocHeadCALOPENAMOUNT.AsFloat;
  end;

end;

procedure TfmInvoiceEntryGrid.DoDropDownLookup;
var

  i: Integer;
  ImageIndex: Integer;
  ReturnName: Array [0 .. 1024] of Char;
  APChar: pchar;
  oldIndex: Integer;
begin
  oldIndex := CBFindColumn.ItemIndex;
  CBFindColumn.clear;
  CBFindColumn.AddItem(GetTextLang(2321), TObject(-1));

  if ASearchPanel.LookupExists('DOCTYPE' + IntToStr(LocalDocType)) then
  begin
    ASearchPanel.parent := Panel7;
    ASearchPanel.Align := altop;
    Panel6.Visible := false;
    ASearchPanel.Visible := true;
    ASearchPanel.OnSearch := OnGenSearchClick;
    ASearchPanel.SetLookupType('DOCTYPE' + IntToStr(LocalDocType));
    ASearchPanel.Height := 200;
  end
  else
  begin
    Panel6.Visible := true;
    ASearchPanel.Visible := false;
  end;
  for i := 0 to cxlistDBTable.ColumnCount - 1 do
    if cxlistDBTable.Columns[i].VisibleForCustomization then
    begin
      CBFindColumn.AddItem(cxlistDBTable.Columns[i].caption, TObject(i));
      { with ASearchPanel.aSearchCollection.Add as TSearchCollectionItem do
        begin
        Wosf_search_fields_id := 0 ;
        SColumnOrigen :=  DBGSearch.Columns[i].Field.Origin ;
        WColumnTranslation := DMTCCoreLink.GetTextNum(DBGSearch.Columns[i].Title.Caption) ;
        WControlX := 10  ;
        if ((i+1) mod 2) = 0 then
        WControlX := DBGSearch.Columns[i-1].Width + 20 ;
        WControly := 20 + ((i div 2) * 40 ) ;
        WControlWidth := DBGSearch.Columns[i].Width ;
        WControlHeigth := 21 ;
        Case  DBGSearch.Columns[i].Field.DataType of
        ftString,ftWideString,ftFixedChar :  SControlType := 'S' ;
        ftDate,ftDateTime,ftTimeStamp :  SControlType := 'D' ;
        ftSmallint :  SControlType := 'B' ;
        ftFloat,ftCurrency :  SControlType := 'F' ;
        end;
        WLength :=  DBGSearch.Columns[i].Field.Size ;
        end; }
    end;

  // add context
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
  begin
    if @AFormPluginRecordArray[i].aContextmenuEnabled <> nil then
      if AFormPluginRecordArray[i].AForm <> nil then
      begin
        APChar := ReturnName;
        AFormPluginRecordArray[i].aContextmenuEnabled('DOC', APChar,
          ImageIndex);
        if APChar <> '' then
        begin
          if Plugins1.FindComponent(APChar) = nil then
          begin
            Plugins1.Add(TMenuItem.Create(Plugins1));
            Plugins1.Items[Plugins1.Count - 1].Name := APChar;
            Plugins1.Items[Plugins1.Count - 1].caption :=
              TForm(AFormPluginRecordArray[i].AForm).caption;
            Plugins1.Items[Plugins1.Count - 1].Tag := i;
            Plugins1.Items[Plugins1.Count - 1].OnClick := PluginPopupClick;
          end;
        end;
        AFormPluginRecordArray[i].aContextmenuEnabled('DOC2', APChar,
          ImageIndex);
        if Trim(APChar) <> '' then
        begin
          if Massaction1.FindComponent(APChar + '2') = nil then
          begin
            Massaction1.Add(TMenuItem.Create(Massaction1));
            Massaction1.Items[Massaction1.Count - 1].Name := APChar + '2';
            Massaction1.Items[Massaction1.Count - 1].caption :=
              TForm(AFormPluginRecordArray[i].AForm).caption + ' 2';
            Massaction1.Items[Massaction1.Count - 1].Tag := i;
            Massaction1.Items[Massaction1.Count - 1].OnClick :=
              PluginPopupClick2;
          end;
        end;

      end;
  end;

  // add plugins
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
  begin
    if @AFormPluginRecordArray[i].aDocSearch <> nil then
    begin
      if AFormPluginRecordArray[i].AForm <> nil then
        CBFindColumn.AddItem(TForm(AFormPluginRecordArray[i].AForm).caption,
          TObject(i));
    end;
  end;

  if (oldIndex > -1) and (oldIndex < CBFindColumn.Items.Count) then
    CBFindColumn.ItemIndex := oldIndex;

end;

procedure TfmInvoiceEntryGrid.tblBatchWCONTRAACCOUNTIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsInteger <> 0 then
  begin
    if DisplayText then
      Text := TDataBaseRoutines.GetAccountFullDescription(Sender.AsInteger)
    else
      Text := Sender.AsString;
  end;
end;

procedure TfmInvoiceEntryGrid.Createbackorderstodeliver1Click(Sender: TObject);
var
  AProgress: TfmNewProgress;

  ACreditorList: TStringList;
  AStockQuery: TuniQuery;
  NewDocId, i, aLineID: Integer;

begin
  fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
  try

    fmBackOrdersOutstanding.vWAccountID := AccID;
    fmBackOrdersOutstanding.ZQBackorder.SQL.Text :=
      'Select * from BACKORD order by WAccountid';

    fmBackOrdersOutstanding.ZQBackorder.Open;
    tbBackorder.Visible := true;
    if (fmBackOrdersOutstanding.HasSomethingToDeliver) then
    begin
      // function already found first
      // fmBackOrdersOutstanding.ZQBackorder.first ;

      AProgress := TfmNewProgress.Create(nil);
      try
        if not(LocalDocType in [10, 14]) then
          exit;

        ACreditorList := TStringList.Create;
        AStockQuery := TuniQuery.Create(nil);
        try
          AStockQuery.Connection := DMTCCoreLink.TheZConnection;
          AStockQuery.SQL.Text :=
            'select * from stock where WStockid = :WStockid';
          // AStockQuery.SQL.Add(' and Bdisabled = 0 and WStockTypeID not in (1,2,4,6,8) ') ;

          aDMCoreDocData.ZQDoclineOptions.Open;
          fmBackOrdersOutstanding.ZQBackorder.last;
          fmBackOrdersOutstanding.ZQBackorder.first;
          AProgress.initProgress('Processing Backorder',
            fmBackOrdersOutstanding.ZQBackorder.RecordCount);
          While not fmBackOrdersOutstanding.ZQBackorder.Eof do
          begin
            if not(fmBackOrdersOutstanding.ZQBackorderQTYONHAND.AsFloat >=
              fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat) then
            begin

              fmBackOrdersOutstanding.ZQBackorder.next;
              AProgress.SetProgress('Processing backorder',
                fmBackOrdersOutstanding.ZQBackorder.RecNo);
              Continue;

            end;

            AStockQuery.close;
            AStockQuery.Params[0].AsInteger :=
              fmBackOrdersOutstanding.ZQBackorderWStockID.AsInteger;
            AStockQuery.Open;

            if (AStockQuery.FieldByName('WSTOCKTYPEID').AsInteger
              in [7, 8]) then
            begin
              fmBackOrdersOutstanding.ZQBackorder.next;
              AProgress.SetProgress('Processing backorder',
                fmBackOrdersOutstanding.ZQBackorder.RecNo);
              Continue;
            end
            else
            begin

              if ACreditorList.IndexOf
                (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsString)
                = -1 then
              begin
                if LocalDocType = 10 then
                  CreateDocument
                    (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsInteger,
                    0, NewDocId)
                else
                  CreateDocument
                    (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsInteger, 3,
                    NewDocId);

                if LocalDocType = 14 then
                    DMTCCoreLink.ExecSql('update dochead set Bposted = -1 where wdocid = ' + IntToStr(NewDocId));
                if LocalDocType = 14 then
                  if fmBackOrdersOutstanding.ZQBackorderSSOURCE.AsString
                    <> '' then
                  begin
                    DMTCCoreLink.ExecSql('update dochead set SDOCNO = ' +
                      QuotedStr(fmBackOrdersOutstanding.ZQBackorderSSOURCE.
                      AsString) + ' where wdocid = ' + IntToStr(NewDocId));
                  end;
                if LocalDocType = 10 then
                  if fmBackOrdersOutstanding.ZQBackorderSSOURCE.AsString
                    <> '' then
                  begin
                    DMTCCoreLink.ExecSql('update dochead set WMESSAGE1ID = ' +
                      IntToStr(DMTCCoreLink.GetAddDescription
                      (fmBackOrdersOutstanding.ZQBackorderSSOURCE.AsString)) +
                      ' where wdocid = ' + IntToStr(NewDocId));
                  end;
                ACreditorList.AddObject
                  (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsString,
                  TObject(NewDocId));
                AddPurchaseStockLine
                  (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsInteger,
                  NewDocId, AStockQuery.FieldByName('WSTOCKID').AsInteger,
                  fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat, aLineID,
                  BPriceAgreeUseOrgPrice,
                  fmBackOrdersOutstanding.ZQBackorderFPRICE.AsFloat / fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderFDISCOUNT.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderFSellingPrice.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderWUNITID.AsInteger);

              end
              else
              begin

                AddPurchaseStockLine
                  (fmBackOrdersOutstanding.ZQBackorderWACCOUNTID.AsInteger,
                  Integer(ACreditorList.Objects
                  [ACreditorList.IndexOf(fmBackOrdersOutstanding.
                  ZQBackorderWACCOUNTID.AsString)]),
                  AStockQuery.FieldByName('WSTOCKID').AsInteger,
                  fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat, aLineID,
                  BPriceAgreeUseOrgPrice,
                  fmBackOrdersOutstanding.ZQBackorderFPRICE.AsFloat / fmBackOrdersOutstanding.ZQBackorderFQty.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderFDISCOUNT.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderFSellingPrice.AsFloat,
                  fmBackOrdersOutstanding.ZQBackorderWUNITID.AsInteger);

              end;
            end;
            fmBackOrdersOutstanding.ZQBackorder.Delete;
            AProgress.SetProgress('Processing stock',
              fmBackOrdersOutstanding.ZQBackorder.RecNo);
          end;

          for i := 0 to ACreditorList.Count - 1 do
          begin
            TDataBaseDocumentRoutines.CleanupDochead
              (Integer(ACreditorList.Objects[i]));
          end;
          RefreschDocumentList(-1);
        finally
          ACreditorList.free;
          AStockQuery.free;
        end;
      finally
        AProgress.free;
      end;
    end; // something to deliver
  finally
    FreeAndNil(fmBackOrdersOutstanding);
  end;
end;

procedure TfmInvoiceEntryGrid.ThideshowitemsClick(Sender: TObject);
begin
  if (LastDocPosted) then
    exit;
  if not Assigned(anewlocallook) then
  begin
    anewlocallook := TfmPosLookup.Create(self);
    anewlocallook.parent := PMAinData;
    anewlocallook.Align := alClient;
    anewlocallook.BorderStyle := bsNone;
    anewlocallook.OnSelect := OnSearch;
    anewlocallook.IsEmbedded := true;
    anewlocallook.tbl := 'STOCK';

    anewlocallook.cxGrid1DBTableView1SSTOCKCODE.caption :=
      DMTCCoreLink.GetTextLangNoAmp(605); { 'Code'; }
    anewlocallook.cxGrid1DBTableView1SDESCRIPTION.caption :=
      DMTCCoreLink.GetTextLangNoAmp(178); { 'Description'; }
    anewlocallook.cxGrid1DBTableView1SBARCODENUMBER.caption :=
      DMTCCoreLink.GetTextLangNoAmp(1774); // Barcode
    anewlocallook.cxGrid1DBTableView1SEXTRADESC.caption :=
      DMTCCoreLink.GetTextLangNoAmp(2919); // {'Extra Description';}
    anewlocallook.cxGrid1DBTableView1SEXTRADESC.Width := 100;

    anewlocallook.cbAutogroup.Visible :=
      TDataBaseRoutines.FillStringsWithReportingGroups
      (anewlocallook.cbAutogroup.Items, 26);
    if anewlocallook.ListCreditor then
    begin
      TDataBaseStringRoutines.FillStringListWithSelect
        (anewlocallook.cbCreditor.Items,
        'select Waccountid,trim(coalesce(Sdescription,' + QuotedStr('') +
        '))|| ' + QuotedStr(' ') +
        ' || Saccountcode A from account where WaccountTypeid = 2 order by 2 ')
    end;

    anewlocallook.cxGrid1DBTableView1.RestoreFromRegistry
      ('Software\osfinancials\grids\lookupstock', false);

    if VarToStr(DMTCCoreLink.ReadNwReportOp('STOCKDISABLEHIDE', 1)) <> '1' then
      anewlocallook.ZQStock.SQL.Text :=
        DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +
        ' where 1 = 0 '
    else
      anewlocallook.ZQStock.SQL.Text :=
        DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +
        ' where (BDisabled = 0 or BDisabled is null)';

    if anewlocallook.LimitStockToCreditor then
      if (LocalDocType in [12, 13, 15, 17]) then
        if edtWAccountID <> 0 then
        begin
          anewlocallook.ZQStock.SQL.Add(' and (WSUPPLIER1ID = ' +
            IntToStr(edtWAccountID) + ' or WSUPPLIER2ID = ' +
            IntToStr(edtWAccountID) +
            ' or WSUPPLIER1ID = 0 or WSUPPLIER1ID is null)');
          anewlocallook.DefSupplier := edtWAccountID;
        end;
    anewlocallook.ZQStock.Open;

  end;
  if not anewlocallook.Visible then
  begin
    if (LocalDocType in [10, 11, 14]) then
    begin
      anewlocallook.DefSupplier := 0;
      anewlocallook.ZQStock.Filtered := false;
      anewlocallook.ZQStock.filter :=
        '(WStockTypeId <> 5) and   (WStockTypeId <> 3)';
      anewlocallook.ShowHideCredlist(false);
    end
    else
    begin
      anewlocallook.ZQStock.Filtered := false;
      anewlocallook.ZQStock.filter :=
        '(WStockTypeId <> 2) and   (WStockTypeId <> 4)';
      anewlocallook.ShowHideCredlist(true);
    end;
    if VarToStr(DMTCCoreLink.ReadNwReportOp('STOCKDISABLEHIDE', 1)) = '1' then
      anewlocallook.ZQStock.filter := anewlocallook.ZQStock.filter +
        ' and (BDisabled = 0 or  BDisabled is null)';
    anewlocallook.ExtraFilter := anewlocallook.ZQStock.filter;
    anewlocallook.ZQStock.Filtered := true;
    anewlocallook.Show;
    anewlocallook.BringToFront;
    Thideshowitems.caption := DMTCCoreLink.GetTextLang(3310);
    PnlDocHeader.Visible := false;
    Panel9.Visible := false;
    if PMAinData.Height = 238 then
      PMAinData.Height := NBDocuments.Height div 2;

  end
  else
  begin
    Thideshowitems.caption := DMTCCoreLink.GetTextLang(3309);
    PnlDocHeader.Visible := true;
    Panel9.Visible := true;
    anewlocallook.Hide;

    PMAinData.Height := 238;
  end;
end;

procedure TfmInvoiceEntryGrid.OnSearch(Sender: TObject);
begin
  if anewlocallook.ZQStockSSTOCKCODE.AsString = '' then
    exit;

  if (tblBatchBRECONCILED.Value = 0) and (tblBatchSREFERENCE.AsString = '') then
    tblBatch.Edit
  else
    tblBatch.Append;

  tblBatchSREFERENCE.Value := anewlocallook.ZQStockSSTOCKCODE.AsString;
  tblBatchSDESCRIPTION.Value := anewlocallook.ZQStockSDESCRIPTION.AsString;

  LastStock.SSTOCKCODE := anewlocallook.ZQStockSSTOCKCODE.AsString;
  if ATempStockList.getStock(astockrecpointer, ReturnLookup) then
  begin
    TDataBaseStockRoutines.SyncQty(astockrecpointer^, LocalDocType,
      LastDocHeaderId);
  end;
  LastStock := astockrecpointer^;
  ApplyStockCodeToCurrentRecord;

end;

procedure TfmInvoiceEntryGrid.cbRemoveFromdocClick(Sender: TObject);
begin
  OpenCopySql;
end;

procedure TfmInvoiceEntryGrid.Invoicetoorderondefsupp11Click(Sender: TObject);

var
  AProgress: TfmNewProgress;
  StockQty: Double;
  ACreditorList: TStringList;
  AStockQuery2: TuniQuery;
  NewDocId, i, aLineID: Integer;
  AMessage: String;
begin
  if QDocHead.IsEmpty then
    exit;

  AProgress := TfmNewProgress.Create(nil);
  try

    ACreditorList := TStringList.Create;
    AStockQuery2 := TuniQuery.Create(nil);
    try
      AStockQuery2.Connection := DMTCCoreLink.TheZConnection;
      AStockQuery2.SQL.Text :=
        'select stock.sstockcode,stock.WSTOCKID,sum(FQTYSHIPPED) FQTYSHIPPED,WSUPPLIER1ID,WSTOCKTYPEID,docline.SUNIT from stock join docline on docline.WStockid = stock.WStockid  ';
      AStockQuery2.SQL.Add(' where wdocid in ( ');
      if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
      begin
        for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
        begin
          cxlistDBTable.Controller.SelectedRecords[i].Focused := true;

          if i > 0 then
            AStockQuery2.SQL.Add(',' + QDocHeadWDOCID.AsString)
          else
            AStockQuery2.SQL.Add(QDocHeadWDOCID.AsString);
        end;
      end
      else
      begin
        AStockQuery2.SQL.Add(QDocHeadWDOCID.AsString);
      end;
      AStockQuery2.SQL.Add(' ) ');
      AStockQuery2.SQL.Add
        ('  group by stock.sstockcode,stock.WStockid,WSUPPLIER1ID,WSTOCKTYPEID,docline.SUNIT ');

      AStockQuery2.SQL.Add(' order by stock.sstockcode ');
      AStockQuery2.Open;
      AStockQuery2.filter := 'WSUPPLIER1ID = 0 or WSUPPLIER1ID is null';
      AStockQuery2.Filtered := true;
      AMessage := '';
      if not AStockQuery2.IsEmpty then
      begin
        AStockQuery2.first;
        while not AStockQuery2.Eof do
        begin
          AMessage := AMessage + TDataBaseStockRoutines.GetStockFullDescription
            (AStockQuery2.FieldByName('WSTOCKID').AsInteger) + #13 + #10;
          AStockQuery2.next;
        end;
        AMessage := AMessage + DMTCCoreLink.GetTextLang(3312);
        OSFMessageDlg(AMessage, mtError, [mbok], 0, true);
        exit;
      end;
      AStockQuery2.Filtered := false;
      AStockQuery2.first;
      aDMCoreDocData.ZQDoclineOptions.Open;
      AProgress.initProgress('Processing Stock', AStockQuery2.RecordCount);
      While not AStockQuery2.Eof do
      begin
        if AStockQuery2.FieldByName('WSTOCKTYPEID').AsInteger = 7 then
        begin
          { ZQStockOptions.Close ;
            ZQStockOptions.params[0].AsInteger := AStockQuery2.FieldByName('WSTOCKID').AsInteger;
            ZQStockOptions.Open ;
            AProgress.InitSubProgress('Processing Stock item',ZQStockOptions.RecordCount);
            aLineID := -1 ;
            fTotal := 0 ;
            fQty   := 0 ;

            while not ZQStockOptions.Eof do
            begin
            // todo : handel this.

            StockQty := TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersforreorderOptions(AStockQuery.FieldByName('WSTOCKID').AsInteger ,-1,
            ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger,
            ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger,0) ;

            StockQty := (ZQStockOptions.FieldByName('FQTYONHAND').AsFloat- StockQty) ;

            if ZQStockOptions.FieldByName('FREORDERQTYTRIG').AsFloat <> 0 then
            TrigQty := StockQty - (ZQStockOptions.FieldByName('FREORDERQTYTRIG').AsFloat +1)
            else
            TrigQty := StockQty - (ZQStockOptions.FieldByName('FREORDERQTY').AsFloat) ;

            StockQty := StockQty - ZQStockOptions.FieldByName('FREORDERQTY').AsFloat  ;
            if ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID').AsString) = -1 then
            begin
            if (TrigQty < 0) and (AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
            begin
            CreateDocument(AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger,2,NewDocID);
            ACreditorList.AddObject(AStockQuery.FieldByName('WSUPPLIER1ID').AsString,TObject(NewDocID));
            if aLineID = -1 then
            AddPurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger,NewDocID,AStockQuery.FieldByName('WSTOCKID').AsInteger,-StockQty,aLineID);
            // add option
            aDMCoreDocData.ZQDoclineOptions.Insert ;
            aDMCoreDocData.ZQDoclineOptionsWDOCID.AsInteger := Integer(ACreditorList.Objects[ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID').AsString)]) ;
            aDMCoreDocData.ZQDoclineOptionsWLINEID.AsInteger := aLineID ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE1ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE2ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE3ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE4ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE5ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat := ZQStockOptionsFUNITCOST.AsFloat ;
            aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat :=  -StockQty ;
            aDMCoreDocData.ZQDoclineOptions.post ;
            fTotal :=  fTotal + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * ZQStockOptionsFUNITCOST.AsFloat ;
            fQty :=  fQty + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat ;
            end;
            end else
            begin
            if (TrigQty < 0) and (AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
            begin
            if aLineID = -1 then
            AddPurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger,Integer(ACreditorList.Objects[ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID').AsString)]),AStockQuery.FieldByName('WSTOCKID').AsInteger,-StockQty,aLineID);
            aDMCoreDocData.ZQDoclineOptions.Insert ;
            aDMCoreDocData.ZQDoclineOptionsWDOCID.AsInteger := Integer(ACreditorList.Objects[ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID').AsString)]) ;
            aDMCoreDocData.ZQDoclineOptionsWLINEID.AsInteger := aLineID ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE1ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE2ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE3ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE4ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsVariant := ZQStockOptionsWITEMOPTIONVALUE5ID.AsVariant ;
            aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat := ZQStockOptionsFUNITCOST.AsFloat ;
            aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat :=  -StockQty ;
            aDMCoreDocData.ZQDoclineOptions.post ;
            fTotal :=  fTotal + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * ZQStockOptionsFUNITCOST.AsFloat ;
            fQty :=  fQty + aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat ;
            end;
            end;
            ZQStockOptions.next ;
            end;
            // update price
            if  (aLineID <> -1) and (fQty <> 0) then
            begin
            UpdatePurchaseStockLine(AStockQuery.FieldByName('WSUPPLIER1ID').AsInteger,Integer(ACreditorList.Objects[ACreditorList.IndexOf(AStockQuery.FieldByName('WSUPPLIER1ID').AsString)]),
            aLineID,fQty,(fTotal) / (FQty));

            end; }
        end
        else
        begin

          StockQty := AStockQuery2.FieldByName('FQTYSHIPPED').AsFloat;

          if ACreditorList.IndexOf(AStockQuery2.FieldByName('WSUPPLIER1ID')
            .AsString) = -1 then
          begin
            if (AStockQuery2.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
            begin
              if StockQty <> 0 then
              begin

                CreateDocument(AStockQuery2.FieldByName('WSUPPLIER1ID')
                  .AsInteger, 2, NewDocId);
                ACreditorList.AddObject(AStockQuery2.FieldByName('WSUPPLIER1ID')
                  .AsString, TObject(NewDocId));
                AddPurchaseStockLine(AStockQuery2.FieldByName('WSUPPLIER1ID')
                  .AsInteger, NewDocId, AStockQuery2.FieldByName('WSTOCKID')
                  .AsInteger, StockQty, aLineID, BPriceAgreeUseOrgPrice,-1,-1,-1,StrToIntDef(AStockQuery2.FieldByName('SUNIT').AsString,-1));
              end;
            end;
          end
          else
          begin
            if (AStockQuery2.FieldByName('WSUPPLIER1ID').AsInteger > 0) then
            begin
              if StockQty <> 0 then
              begin
                AddPurchaseStockLine(AStockQuery2.FieldByName('WSUPPLIER1ID')
                  .AsInteger,
                  Integer(ACreditorList.Objects
                  [ACreditorList.IndexOf(AStockQuery2.FieldByName
                  ('WSUPPLIER1ID').AsString)]),
                  AStockQuery2.FieldByName('WSTOCKID').AsInteger, StockQty,
                  aLineID, BPriceAgreeUseOrgPrice,-1,-1,-1,StrToIntDef(AStockQuery2.FieldByName('SUNIT').AsString,-1));
              end;
            end;
          end;
        end;
        AStockQuery2.next;
        AProgress.SetProgress('Processing stock', AStockQuery2.RecNo);
      end;

      for i := 0 to ACreditorList.Count - 1 do
      begin
        TDataBaseDocumentRoutines.CleanupDochead
          (Integer(ACreditorList.Objects[i]));
      end;
      RefreschDocumentList(-1);
    finally
      ACreditorList.free;
      AStockQuery2.free;
    end;
  finally
    AProgress.free;
  end;
end;

procedure TfmInvoiceEntryGrid.QDocHeadSACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not QDocHead.IsEmpty then
    Text := TDataBaseRoutines.AccTypeToChar
      (QDocHead.FieldByName('WAccountTypeID').AsInteger) + Sender.AsString;
end;

procedure TfmInvoiceEntryGrid.EshipmentExit(Sender: TObject);
var
  Total, Diverence, TotExc: Double;
  UseTaxid: Integer;
begin
  Total := Str2Float(lblInvAmt.caption);
  TotExc := Str2Float(LblExcl.caption);
  if (aShipcostunittype <> 0) and (cbShipments.ItemIndex > 0) then
    if StrToFloatDef(Eshipment.Text, 0) <> 0 then
    begin
      if DefaultTaxId <> 0 then
        UseTaxid := DefaultTaxId
      else
        UseTaxid := TDataBaseStockRoutines.GetOuputTaxId
          (Integer(cbShipments.Items.Objects[cbShipments.ItemIndex]));

      Diverence := StrToFloatDef(Eshipment.Text, 0);
      TotExc := TotExc + Diverence;

      if ExclMode then
        Diverence := (Diverence * TDataBaseRoutines.gettaxrateonId(UseTaxid));

      Total := Total + Diverence;
    end;

  if (LocalDocType in [10, 11, 14]) then
  begin
    if aPayDiscountItem <> 0 then
      if StrToFloatDef(EPaymentDiscount.Text, 0) <> 0 then
      begin
        if DefaultTaxId <> 0 then
          UseTaxid := DefaultTaxId
        else
          UseTaxid := TDataBaseStockRoutines.GetOuputTaxId(aPayDiscountItem);

        Diverence := (TotExc * (StrToFloatDef(EPaymentDiscount.Text, 0) / 100));
        if ExclMode then
          Diverence := (Diverence * TDataBaseRoutines.gettaxrateonId(UseTaxid));

        Total := Total - Diverence;

      end;
  end
  else

    if aPayDiscountItemCred <> 0 then
    if StrToFloatDef(EPaymentDiscount.Text, 0) <> 0 then
    begin
      if DefaultTaxId <> 0 then
        UseTaxid := DefaultTaxId
      else
        UseTaxid := TDataBaseStockRoutines.GetOuputTaxId(aPayDiscountItemCred);

      Diverence := (TotExc * (StrToFloatDef(EPaymentDiscount.Text, 0) / 100));
      if ExclMode then
        Diverence := (Diverence * TDataBaseRoutines.gettaxrateonId(UseTaxid));

      Total := Total - Diverence;
    end;

  Total := Total + Str2Float(LPaymentTotal.caption);
  EndTotal.caption :=
    FloatToStrF(FixAmount(Total,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed, 18,
    dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) + ' ';
end;

procedure TfmInvoiceEntryGrid.cbShipmentsDblClick(Sender: TObject);
begin
  if (aShipcostunittype <> 0) and (cbShipments.ItemIndex > 0) then
    Eshipment.Text := FloatToStr(TDataBaseStockRoutines.getStockPrice
      (edtWAccountID, Integer(cbShipments.Items.Objects
      [cbShipments.ItemIndex]), 1.0));

end;

procedure TfmInvoiceEntryGrid.cbShipmentsChange(Sender: TObject);
begin
  if (aShipcostunittype <> 0) and (cbShipments.ItemIndex > 0) then
    Eshipment.Text := FloatToStr(TDataBaseStockRoutines.getStockPrice
      (edtWAccountID, Integer(cbShipments.Items.Objects
      [cbShipments.ItemIndex]), 1.0));

end;

procedure TfmInvoiceEntryGrid.tblBatchCalcFields(DataSet: TDataSet);
var
  astockrecpointer: TStockRecPointer;
  MultiPlier, MultiPlier2: Double;
begin
  if FindIndexOfName('FCOST') <> -1 then
  begin
    if (tblBatchBRECONCILED.AsInteger = 0) and
      ((tblBatch.FieldByName('SREFERENCE').AsString = '') or
      (Str2Float(tblBatchSCONTRAACCOUNT.Value) = 0) or
      (tblBatchFCREDIT.AsFloat = 0)) then
    begin

      tblBatch.FieldByName('FCOST').AsFloat := 0;

      exit;
    end;
    if ShowStkGrosscost and (tblBatchBRECONCILED.AsInteger = 0) then
    begin
      MultiPlier2 := tblBatchFQTY.AsFloat;
      if MultiPlier2 = 0 then
        MultiPlier2 := 1;
      MultiPlier := tblBatchFUNITQTY.AsFloat;
      if MultiPlier = 0 then
        MultiPlier := 1;
      MultiPlier := MultiPlier * MultiPlier2;

      tblBatch.FieldByName('FCOST').AsFloat := 0;

      ATempStockList.getStock(astockrecpointer,
        tblBatch.FieldByName('SREFERENCE').AsString);
      if ShowGrossAsCostprice then
      begin

        if not(astockrecpointer^.FReorderQty = -1) then
        begin
          if ExclMode then
            tblBatch.FieldByName('FCOST').AsFloat :=
              ((Str2Float(tblBatchSCONTRAACCOUNT.Value) * MultiPlier) *
              astockrecpointer^.FAvgUnitCost)
          else
            tblBatch.FieldByName('FCOST').AsFloat :=
              ((Str2Float(tblBatchSCONTRAACCOUNT.Value) * MultiPlier) *
              astockrecpointer^.FAvgUnitCost);
        end;
      end
      else
      begin

        if ExclMode then
          tblBatch.FieldByName('FCOST').AsFloat := tblBatchFCREDIT.AsFloat -
            ((Str2Float(tblBatchSCONTRAACCOUNT.Value) * MultiPlier) *
            astockrecpointer^.FAvgUnitCost)
        else
          tblBatch.FieldByName('FCOST').AsFloat :=
            (tblBatchFCREDIT.AsFloat / TDataBaseRoutines.gettaxrateonId
            (tblBatchWTAXID.AsInteger)) -
            ((Str2Float(tblBatchSCONTRAACCOUNT.Value) * MultiPlier) *
            astockrecpointer^.FAvgUnitCost);
      end;

    end;
  end;
  if tblBatchBRECONCILED.AsInteger = 1 then
    tblBatchLONGTEXT.AsString := DMTCCoreLink.ReadDescription
      (tblBatchWACCOUNTID.AsInteger);

end;

procedure TfmInvoiceEntryGrid.OnGenSearchClick(Sender: TObject);

var
  ExtraSql: String;
begin
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if CBOperatot.ItemIndex = -1 then
    CBOperatot.ItemIndex := 0;
  StatusBar.Panels[0].Text := '';

  // GoToID :=  QDocHeadWDocID.AsInteger ;

  QDocHead.close;
  QDocHead.SQL.clear;
  DocHeadQuery := format(dmDatabase.SQLList.GetFormatedSQLByName
    ('InvoiceEntryGrid_DocHeadQryWithAmount'), ['LEFT OUTER']);

  QDocHead.SQL.Add(DocHeadQuery + ' and (  WTypeId = ' +
    IntToStr(LocalDocType));

  QDocHead.SQL.Add(' ) ');
  if cbDoc1group.Visible and (cbDoc1group.ItemIndex > 0) then
  begin
    QDocHead.SQL.Add(' and dochead.WREPORTINGGROUP1ID = ' +
      IntToStr(Integer(cbDoc1group.Items.Objects[cbDoc1group.ItemIndex])));
  end;

  if LimitDocSql <> '' then
    QDocHead.SQL.Add(LimitDocSql);
  ExtraSql := ASearchPanel.GetClause;
  if ExtraSql <> '' then
    QDocHead.SQL.Add(' and ' + ExtraSql);
  QDocHead.Open;

  BEdit.Enabled := not QDocHead.IsEmpty;
  BPrint.Enabled := not QDocHead.IsEmpty;
end;

procedure TfmInvoiceEntryGrid.tblBatchWUNITIDChange(Sender: TField);
var
  OldQty, NewQty: Double;
begin
  if not tblBatch.ControlsDisabled then
    if ZQUnit.Active then
     if ZQUnit.Locate('WUNITID', tblBatchWUNITID.AsInteger, []) then
    begin
      tblBatch.DisableControls;
      try
      OldQty := tblBatchFUNITQTY.AsFloat;
      if OldQty = 0 then
        OldQty := 1;
      tblBatchFUNITQTY.AsFloat := ZQUnitFUNITQTY.AsFloat;
      if tblBatchFUNITQTY.AsFloat = 0 then
        tblBatchFUNITQTY.AsFloat := 1;
      NewQty := Str2Float(tblBatchSCONTRAACCOUNT.AsString) * OldQty;
      tblBatchSCONTRAACCOUNT.AsFloat := NewQty / tblBatchFUNITQTY.AsFloat;
      NewQty := tblBatchFDEBIT.AsFloat / OldQty;
      tblBatchFDEBIT.AsFloat := NewQty * tblBatchFUNITQTY.AsFloat;

        tblBatchSACCOUNT.AsFloat := tblBatchSCONTRAACCOUNT.AsFloat;
      finally
        tblBatch.EnableControls ;
      end;
      CalcAmounts;
    end;
end;

procedure TfmInvoiceEntryGrid.tblBatchSCONTRAACCOUNTChange(Sender: TField);
begin
  if not tblBatch.ControlsDisabled then
  begin
    CalcAmounts;
  end;
end;

procedure TfmInvoiceEntryGrid.EPrice1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') then
    Key := DecimalSeparator;
  if (Key = #13) then
  begin
    SelectNext(Screen.ActiveControl, true, true);
    Key := #0;
  end;

end;

procedure TfmInvoiceEntryGrid.btnEnterIncExcClick(Sender: TObject);
begin
  if btnEnterIncExc.Tag = 0 then
    btnEnterIncExc.Tag := 1
  else
    btnEnterIncExc.Tag := 0;

  if btnEnterIncExc.Tag = 0 then
    btnEnterIncExc.caption := 'Excl'
  else
    btnEnterIncExc.caption := 'Inc';
  SetStockEditPrice;
end;

procedure TfmInvoiceEntryGrid.tbPluginsClick(Sender: TObject);
begin
  if pmPlugins.Items.Count = 1 then
    pmPlugins.Items[0].Click
  else
    pmPlugins.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfmInvoiceEntryGrid.tblBatchSDESCRIPTIONGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (tblBatchBRECONCILED.AsInteger = 1) then
    Text := tblBatchLONGTEXT.AsString
  else
    Text := Sender.AsString;

end;

procedure TfmInvoiceEntryGrid.tblBatchBeforeInsert(DataSet: TDataSet);
begin
  if not DataSet.ControlsDisabled then
    if (glLastMouseWeel > (GetTickCount - 500)) then
    begin
      glLastMouseWeel := 0;
      SysUtils.Abort;
    end;
end;

procedure TfmInvoiceEntryGrid.tblBatchDatesChange(Sender: TField);
begin
  if not tblBatch.ControlsDisabled then
    if (tblBatch.State in [dsedit, DsInsert]) then
    begin
      if (tblBatchDDATE.AsDateTime <> 0) and
        (tblBatchDALLOCATEDDATE.AsDateTime <> 0) then
        tblBatchFUNITQTY.AsFloat := 1 + trunc(tblBatchDALLOCATEDDATE.AsDateTime)
          - trunc(tblBatchDDATE.AsDateTime);
      if tblBatchFUNITQTY.AsFloat < 1 then
        tblBatchFUNITQTY.AsFloat := 1;
      CalcAmounts;
    end;

end;

procedure TfmInvoiceEntryGrid.bStockPluginsClick(Sender: TObject);
begin
  pmStockPlugins.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfmInvoiceEntryGrid.StockPluginsActionClick(Sender: TObject);
begin
  if (tblBatch.State in [dsedit, DsInsert]) then
    tblBatch.post;
  TMenuItem((Sender as TComponent).Tag)
    .OnClick(TMenuItem((Sender as TComponent).Tag));
  if (DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_PURCHASEAFTERSAVE')
    <> nil) and (LocalDocType in [12, 13]) then
  begin
    BISSavePRocess := true;
    ApplyStockCodeToCurrentRecord;
    BISSavePRocess := false;
  end;
end;

procedure TfmInvoiceEntryGrid.TAddNewTimer(Sender: TObject);
begin
  TAddNew.Enabled := false;
  BNewClick(self);
end;

procedure TfmInvoiceEntryGrid.pmStockPluginsPopup(Sender: TObject);
var
  i: Integer;
  Menuitem: TMenuItem;
begin
  if not Assigned(AfmStockEntry) then
  begin
    AfmStockEntry := TfmStockEntry.Create(self);
    AfmStockEntry.Hide;
  end;
  (AfmStockEntry as TfmStockEntry).tblStockAd.close;
  (AfmStockEntry as TfmStockEntry).tblStockAd.SQL.Text :=
    'select * from stock where WStockid=' + IntToStr(LastStock.WStockID);
  (AfmStockEntry as TfmStockEntry).tblStockAd.Open;
  if pmStockPlugins.Items.Count = 0 then
  begin
    for i := 0 to (AfmStockEntry as TfmStockEntry).PluginsAction11.Count - 1 do
    begin
      Menuitem := TMenuItem.Create(pmStockPlugins);
      Menuitem.caption := (AfmStockEntry as TfmStockEntry).PluginsAction11.Items
        [i].caption;
      Menuitem.Tag := Integer((AfmStockEntry as TfmStockEntry)
        .PluginsAction11.Items[i]);
      Menuitem.OnClick := StockPluginsActionClick;
      pmStockPlugins.Items.Add(Menuitem);
    end;
  end;

end;

procedure TfmInvoiceEntryGrid.ZQFreeLookupCalcFields(DataSet: TDataSet);
begin
  ZQFreeLookupSFULLDESC.AsString := TDataBaseRoutines.GetNesteldNameFromGroupID
    (ZQFreeLookupWGROUPID.AsInteger, 0);
end;

procedure TfmInvoiceEntryGrid.Sortonstockcode1Click(Sender: TObject);
var
  i: Integer;
begin
  tblBatch.DisableControls;
  try
    tblBatch.IndexFieldNames := tblBatchSREFERENCE.FieldName;
    tblBatch.Refresh;
    tblBatch.first;
    i := 1;
    While not tblBatch.Eof do
    begin
      tblBatch.Edit;
      tblBatchWLINKEDID.AsInteger := i;
      inc(i);
      tblBatch.post;
      tblBatch.next;

    end;
    tblBatch.IndexFieldNames := 'WLINKEDID';
    tblBatch.Refresh;
    tblBatch.IndexFieldNames := '';
  finally
    tblBatch.EnableControls;
  end;
end;

procedure TfmInvoiceEntryGrid.tblBatchWUNITIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := '';
  if Sender.AsInteger <> 0 then
  begin
    Text := TDataBaseStockRoutines.GetUnitDesc(Sender.AsInteger);
  end;
end;

procedure TfmInvoiceEntryGrid.CreateStockinfromdocuments1Click(Sender: TObject);

var
  i, NewDocId, DocType: Integer;
  AExternalSendString: String;
begin
  if OSFMessageDlg(format(DMTCCoreLink.GetTextLangNoAmp(3367),
    [DMTCCoreLink.GetTextLangNoAmp(3423) + ' ' + StringReplace(TMenuItem(Sender)
    .caption, '&', '', [rfreplaceall])]), mtConfirmation, [mbYes, mbNo], 0)
    = mrno then
    exit;

  DocType := 0;
  if QDocHead.IsEmpty then
    exit;
  case TComponent(Sender).Tag of
    10:
      DocType := 0;
    11:
      DocType := 4;
    13:
      DocType := 5;
    12:
      DocType := 1;
    14:
      DocType := 3;
    15:
      DocType := 2;
    16:
      DocType := 7;
    17:
      DocType := 8;
  end;
  if cxlistDBTable.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[i].Focused := true;
      CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
        DocType, false, nil, Date, false, NewDocId, '', '', '', '',
        false, false);
      AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10 +
        'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
        IntToStr(currentuser);;
      if (AExternalForm <> nil) then
      begin
        AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
          pchar(AExternalSendString));
      end;
      SendMessageToPlugin(AExternalSendString);
    end;
  end
  else
  begin
    CopyDocument(QDocHeadWDOCID.AsInteger, QDocHeadWACCOUNTID.AsInteger,
      DocType, false, nil, Date, false, NewDocId, '', '', '', '', false, false);
    if (AExternalForm <> nil) then
    begin
      AExternalSendString := 'COPYDOCTO=' + IntToStr(NewDocId) + #13 + #10 +
        'COPYDOC=' + QDocHeadWDOCID.AsString + #13 + #10 + 'USERID=' +
        IntToStr(currentuser);
      AExternalEditAddItemToDocPlugin.aMessageFormPlugin(AExternalForm,
        pchar(AExternalSendString));
    end;
    SendMessageToPlugin(AExternalSendString);
  end;
  cbViewUnPosted2.ItemIndex := 1;

  idDocType := TComponent(Sender).Tag;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + ord(LocalDocType mod 2);

  cbDocTypenew.ItemIndex := cbDocTypenew.Items.IndexOfObject
    (TObject(idDocType));
  RefreschDocumentList;
end;

procedure TfmInvoiceEntryGrid.SetToolBarVisible(ISVisible: Boolean);
var
  i: Integer;
begin
  for i := 1 to ToolBar1.ButtonCount - 1 do
    ToolBar1.Buttons[i].Visible := ISVisible;

end;

{ twf_TfmPluginDocument }

constructor twf_TfmPluginDocument.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'documents-plugins';
  Description :=
    'Document plugins  edit / add screen. You must have last id set by the screen before thisone!'
    + #13 + #10 + 'PLUGIN name of the plugin.';
  with Inparams.Add as TParam do
  begin
    Name := 'DOCTYPE';
    DataType := ftInteger;
    Value := 10;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'LASTID';
    DataType := ftInteger;
    Value := 0;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'PLUGIN';
    DataType := ftString;
    Size := 255;
    Value := '';
  end;
end;

procedure twf_TfmPluginDocument.WorkflowEnd(AForm: TForm);
var

  Ins, ImageIndex: Integer;
  aplugin: TFormPluginRecord;
  IsEnable: Boolean;
  ReturnName: Array [0 .. 1024] of Char;
  APChar: pchar;
  AMessage: String;
begin
  IsEnable := false;
  if LoadedPluginList.IndexOf(ExtractFilePath(Application.ExeName) + 'plug_ins'
    + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
    PluginsDLLName) <> -1 then
  begin

    Ins := Integer(LoadedPluginList.Objects
      [LoadedPluginList.IndexOf(ExtractFilePath(Application.ExeName) +
      'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
      PluginsDLLName)]);
    @aplugin.aLoadFormPlugin := GetProcAddress(Ins,
      OSFEditAddItemToDocRoutineName);
    if @aplugin.aLoadFormPlugin <> nil then
    begin
      aplugin.aInst := Ins;
      @aplugin.aMessageFormPlugin :=
        GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
      @aplugin.aUnLoadFormPlugin :=
        GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
      @aplugin.aMessageGetDisplayText :=
        GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
      @aplugin.aPluginEnabled := GetProcAddress(Ins,
        OSFPLUGINENABLEDRoutineName);
      @aplugin.aContextmenuEnabled :=
        GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
      if Assigned(aplugin.aPluginEnabled) then
      begin
        APChar := ReturnName;
        aplugin.aPluginEnabled('DOC', APChar, ImageIndex);
        IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
        if not IsEnable then
        begin

          APChar := ReturnName;
          AMessage := 'DOCTYPE=' + Inparams.ParamByName('DOCTYPE').AsString;
          aplugin.aPluginEnabled(pchar(AMessage), APChar, ImageIndex);
          IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
        end;
      end;
    end;
    if not IsEnable then
      raise Exception.Create('Plugin : ' + ExtractFilePath(Application.ExeName)
        + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.'
        + PluginsDLLName + ' not enabled.');

  end
  else
    raise Exception.Create('Plugin : ' + ExtractFilePath(Application.ExeName) +
      'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
      PluginsDLLName + ' not found or loaded.');
  AMessage := 'POST=' + Inparams.ParamByName('LASTID').AsString;
  aplugin.aMessageFormPlugin(AForm, pchar(AMessage));
  aplugin.aUnLoadFormPlugin(AForm);
end;

function twf_TfmPluginDocument.WorkFlowStart: TForm;
var

  Ins, ImageIndex: Integer;
  aplugin: TFormPluginRecord;
  IsEnable: Boolean;
  ReturnName: Array [0 .. 1024] of Char;
  APChar: pchar;
  AMessage: String;
begin
  IsEnable := false;
  if LoadedPluginList.IndexOf(ExtractFilePath(Application.ExeName) + 'plug_ins'
    + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
    PluginsDLLName) <> -1 then
  begin
    Ins := Integer(LoadedPluginList.Objects
      [LoadedPluginList.IndexOf(ExtractFilePath(Application.ExeName) +
      'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
      PluginsDLLName)]);
    @aplugin.aLoadFormPlugin := GetProcAddress(Ins,
      OSFEditAddItemToDocRoutineName);
    if @aplugin.aLoadFormPlugin <> nil then
    begin
      aplugin.aInst := Ins;
      @aplugin.aMessageFormPlugin :=
        GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
      @aplugin.aUnLoadFormPlugin :=
        GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
      @aplugin.aMessageGetDisplayText :=
        GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
      @aplugin.aPluginEnabled := GetProcAddress(Ins,
        OSFPLUGINENABLEDRoutineName);
      @aplugin.aContextmenuEnabled :=
        GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
      if Assigned(aplugin.aPluginEnabled) then
      begin
        APChar := ReturnName;
        AMessage := 'DOC';
        aplugin.aPluginEnabled(pchar(AMessage), APChar, ImageIndex);
        IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
        if not IsEnable then
        begin
          AMessage := 'DOCTYPE=' + Inparams.ParamByName('DOCTYPE').AsString;
          APChar := ReturnName;
          aplugin.aPluginEnabled(pchar(AMessage), APChar, ImageIndex);
          IsEnable := DMTCCoreLink.ReadNwReportOp(APChar, false);
        end;
      end;
    end;
    // if not IsEnable then
    // raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

  end
  else
    raise Exception.Create('Plugin : ' + ExtractFilePath(Application.ExeName) +
      'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString + '.' +
      PluginsDLLName + ' not found or loaded.');

  AMessage := 'DOCTYPE=' + Inparams.ParamByName('DOCTYPE').AsString;
  result := aplugin.aLoadFormPlugin(Application, pchar(AMessage));

  AMessage := 'EDIT=' + Inparams.ParamByName('LASTID').AsString;
  aplugin.aMessageFormPlugin(result, pchar(AMessage));

  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
  begin
    self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL')
      .AsString, '#@#', #13 + #10, [rfreplaceall]), result);
  end;

end;

{ twf_TfmDocument }

constructor twf_TfmDocument.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'documents';
  Description :=
    'Document add edit screen. Set doctype param for document type. Sub ' + #13
    + #10 + 'process SHOWMODAL will show the screen as modal.' + #13 + #10 +
    'process NEW will automaticly make a new document.';

  with Inparams.Add as TParam do
  begin
    Name := 'DOCTYPE';
    DataType := ftInteger;
    Value := 10;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'LASTID';
    DataType := ftInteger;
    Value := 0;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'LASTLINEID';
    DataType := ftInteger;
    Value := 0;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'SUBPROCESS';
    DataType := ftString;
    Size := 55;
    Value := 'NEW';
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'FORCEDOCTYPE';
    DataType := ftInteger;
    Value := 0;
  end;
  with Inparams.Add as TParam do
  begin
    Name := 'PROJECTID';
    DataType := ftInteger;
    Value := 0;
  end;

end;

procedure twf_TfmDocument.WorkflowEnd(AForm: TForm);
begin
  OutId := '0';
  OutSubid := '0';
  if not TfmInvoiceEntryGrid(AForm).QDocHead.IsEmpty then
    OutId := TfmInvoiceEntryGrid(AForm).QDocHeadWDOCID.AsString;
  AForm.free;

end;

function twf_TfmDocument.WorkFlowStart: TForm;
var
  ADocFrom: TfmInvoiceEntryGrid;
begin
  idDocType := Inparams.ParamByName('DOCTYPE').AsInteger;

  ADocFrom := TfmInvoiceEntryGrid.Create(self.parent);
  try
    if Inparams.ParamByName('SUBPROCESS').AsString = 'NEW' then
      ADocFrom.AddInvoiceForAccount := Inparams.ParamByName('LASTID').AsInteger
    else
      ADocFrom.AddInvoiceForAccount := 0;

    ADocFrom.ForceDocType := Inparams.ParamByName('FORCEDOCTYPE').AsInteger;
    ADocFrom.FProjectId := Inparams.ParamByName('PROJECTID').AsInteger;
    ADocFrom.cbProject.Enabled := ADocFrom.FProjectId <> 0;
    ADocFrom.LProject.Enabled := ADocFrom.FProjectId <> 0;

    if Inparams.ParamByName('SUBPROCESS').AsString = 'SHOWMODAL' then
    begin
      result := ADocFrom;
      ADocFrom.GoToDocId := Inparams.ParamByName('LASTID').AsInteger;
      ADocFrom.GoToLineID := Inparams.ParamByName('LASTLINEID').AsInteger;
      ADocFrom.ShowModal;
      exit;
    end;
    if Inparams.ParamByName('SUBPROCESS').AsString = 'SHOWMODALNEW' then
    begin
      result := ADocFrom;
      ADocFrom.AddInvoiceForAccount := Inparams.ParamByName('LASTID').AsInteger;
      ADocFrom.TAddNew.Enabled := true;
      ADocFrom.ShowModal;
      exit;
    end;

    if ADocFrom.parent = nil then
      ADocFrom.parent := self.parent;
    if Inparams.ParamByName('SUBPROCESS').AsString = 'NEW' then
      ADocFrom.OnModalResultEvent := OnInternalProgress
    else
      ADocFrom.OnModalResultEvent := nil;

    ADocFrom.BorderStyle := bsNone;
    if Inparams.ParamByName('SUBPROCESS').AsString = 'SHOW' then
      if Inparams.ParamByName('LASTID').AsInteger <> 0 then
      begin
        ADocFrom.GoToDocId := Inparams.ParamByName('LASTID').AsInteger;

      end;

    ADocFrom.Show;
    ADocFrom.Top := 0;
    ADocFrom.Left := 0;
    if self.parent <> nil then
    begin
      ADocFrom.Width := self.parent.Width - 1;
      ADocFrom.Height := self.parent.Height - 1;
    end;

    ADocFrom.BitBtnCancel.Visible := false;
    ADocFrom.BtnClose2.Visible := false;

    ADocFrom.Panel10.Height := 105;

    ADocFrom.BitBtn1.Visible := false;
    ADocFrom.StatusBar.parent := ADocFrom;
    ADocFrom.StatusBar.Align := altop;
    ADocFrom.StatusBar.Font.Size := 14;
    ADocFrom.StatusBar.Height := 25;
    ADocFrom.StatusBar.Repaint;

    ADocFrom.cbDocTypenew.ItemIndex := ADocFrom.cbDocTypenew.Items.IndexOfObject
      (TObject(Inparams.ParamByName('DOCTYPE').AsInteger));
    if ADocFrom.cbDocTypenew.ItemIndex = -1 then
      ADocFrom.cbDocTypenew.ItemIndex := 0;

    if Inparams.ParamByName('SUBPROCESS').AsString = 'SHOW' then
      if Inparams.ParamByName('LASTID').AsInteger <> 0 then
      begin
        ADocFrom.GoToDocId := Inparams.ParamByName('LASTID').AsInteger;

      end;

    ADocFrom.cbDocTypenewChange(self);
    if Inparams.ParamByName('SUBPROCESS').AsString = 'NEW' then
      ADocFrom.BNewClick(self);

    if Inparams.ParamByName('SUBPROCESS').AsString = 'SHOW' then
      if Inparams.ParamByName('LASTID').AsInteger <> 0 then
      begin
        ADocFrom.BEditClick(self);
      end;
    result := ADocFrom;

    if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
    begin
      self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL')
        .AsString, '#@#', #13 + #10, [rfreplaceall]), result);
    end;

  Except
    on e: Exception do
    begin
      ADocFrom.free;
      Raise Exception.Create('WF error :' + e.Message);
    end;

  end;
end;

procedure TfmInvoiceEntryGrid.SetOnModalResultEvent(const Value: TNotifyEvent);
begin
  FOnModalResultEvent := Value;
end;

procedure TfmInvoiceEntryGrid.cbCurrencyChange(Sender: TObject);
begin
  if cbCurrency.ItemIndex <> -1 then
  begin
    cbRate.Text := FloatToStr(TDataBaseDocumentRoutines.GetCurrencyRate
      (Integer(cbCurrency.Items.Objects[cbCurrency.ItemIndex])));
  end;
end;

procedure TfmInvoiceEntryGrid.BexportClick(Sender: TObject);
Var
  AStrings: TStringList;
  i, Recindex: Integer;
  AddLine, OpenWithApp, aFilename: String;
begin
  AddLine := '';
  for i := 0 to cxlistDBTable.ColumnCount - 1 do
    if cxlistDBTable.Columns[i].VisibleForCustomization then
    begin
      if i <> 0 then
        AddLine := AddLine + #9;
      AddLine := AddLine + cxlistDBTable.Columns[i].caption;
    end;
     if cxlistDBTable.Controller.SelectedRecordCount =0  then
       cxlistDBTable.Controller.SelectAll ;

  if not SaveDialog1.Execute then
    exit;
  AStrings := TStringList.Create;
  try
    AStrings.Add(AddLine);
    for Recindex := 0 to cxlistDBTable.Controller.SelectedRecordCount - 1 do
    begin
      cxlistDBTable.Controller.SelectedRecords[Recindex].Focused := true;
      AddLine := '';
      for i := 0 to cxlistDBTable.ColumnCount - 1 do
        if cxlistDBTable.Columns[i].VisibleForCustomization then
        begin
          if i <> 0 then
            AddLine := AddLine + #9;

          if QDocHead.FindField(cxlistDBTable.Columns[i].DataBinding.FieldName)
            <> nil then
            AddLine := AddLine + QDocHead.FindField
              (cxlistDBTable.Columns[i].DataBinding.FieldName).DisplayText;
        end;
      AStrings.Add(AddLine);
      QDocHead.next;
    end;
    AStrings.SaveToFile(ChangeFileExt(SaveDialog1.FileName, '.txt'));
    AddLine := ChangeFileExt(SaveDialog1.FileName, '.txt');
    OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv');
    if FileExists(OpenWithApp) then
    begin
      aFilename := AnsiQuotedStr(AddLine, '"');
      AddLine := OpenWithApp;
    end;
    ShellExecute(Handle, 'open', pchar(AddLine), pchar(aFilename), nil,
      SW_SHOW);

  finally
    AStrings.free;
  end;
end;

procedure TfmInvoiceEntryGrid.BRemFinderClick(Sender: TObject);
var
  afreelookup: TGenSearch;
  ALines: TStrings;
begin
  if (DMTCCoreLink.SQLList.SQLCollection.GetItemByName
    ('CUST_FREEDESCLOOKUPRESULT') = nil) or
    (DMTCCoreLink.SQLList.SQLCollection.GetItemByName('CUST_FREEDESCLOOKUPTYPE')
    = nil) then

    exit;

  afreelookup := TGenSearch.Create(self);
  try

    ALines := DMTCCoreLink.SQLList.SQLCollection.GetItemByName
      ('CUST_FREEDESCLOOKUPTYPE').SQL;
    afreelookup.Init(ALines.Values['lookup']);
    afreelookup.ASearchPanel.DefSql := ALines.Values['select'];
    afreelookup.AutoFieldCols := true;
    afreelookup.ASearchPanel.DefSql := TDatabaseTableRoutines.ReplaceParams
      (afreelookup.ASearchPanel.DefSql, 'ID=' + IntToStr(edtWAccountID));
    if afreelookup.ShowModal = mrok then
    begin
      EdComment.Lines.Add(TDatabaseTableRoutines.ReplaceParams
        (DMTCCoreLink.SQLList.SQLCollection.GetItemByName
        ('CUST_FREEDESCLOOKUPRESULT').SQL.Text,
        TDatabaseTableRoutines.GetDatasetAsParamString
        (afreelookup.ZQGenSearch, false)))
    end;

  finally
    afreelookup.free;
  end;
end;

procedure TfmInvoiceEntryGrid.LblTaxDblClick(Sender: TObject);
var
  StrTextOut: String;
  AList: TStringList;
  ATaxes: array of Double;
  TaxRate, AIncTotal, AExcTotal: Double;
  i: Integer;
  aQuery: TuniQuery;

begin
  // if NBDocuments.PageIndex <> 1 then exit ;
  AList := TStringList.Create;
  try
    aQuery := TuniQuery.Create(nil);

    try
      aQuery.Connection := dmDatabase.ZMainconnection;
      aQuery.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName
        ('invoiceEntry_Taxttotal');
      aQuery.Open;

      while not aQuery.Eof do
      begin

        TaxRate := gettaxrateonId(aQuery.FieldByName('WTaxId').AsInteger, true);

        if AList.IndexOf(IntToStr(aQuery.FieldByName('WTaxId').AsInteger))
          = -1 then
        begin
          AList.Add(IntToStr(aQuery.FieldByName('WTaxId').AsInteger));
          SetLength(ATaxes, AList.Count);
        end;

        If ExclMode and (TaxRate <> 0) and (TaxRate <> 2) then
        begin
          AIncTotal := FixAmount(aQuery.FieldByName('FCredit').AsFloat *
            TaxRate, dmDatabase.SetOfBooksPropertys.DataParameter.
            WDocRowDecimals);
          AExcTotal := FixAmount(aQuery.FieldByName('FCredit').AsFloat,
            dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        end
        else
        begin
          If (TaxRate <> 2) then
            AExcTotal := FixAmount(aQuery.FieldByName('FCredit').AsFloat /
              TaxRate, dmDatabase.SetOfBooksPropertys.DataParameter.
              WDocRowDecimals);
          // else AExcTotal := AExcTotal + FixAmount(AQuery.FieldByName('FCredit').AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
          AIncTotal := FixAmount(aQuery.FieldByName('FCredit').AsFloat,
            dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        end;
        ATaxes[AList.IndexOf(IntToStr(aQuery.FieldByName('WTaxId').AsInteger))]
          := ATaxes[AList.IndexOf(IntToStr(aQuery.FieldByName('WTaxId')
          .AsInteger))] + AIncTotal - AExcTotal;
        aQuery.next;
      end;
    finally
      aQuery.free;
    end;

    if not fmStockLinkDetail.ZQDoclineLink.IsEmpty then
    begin
      fmStockLinkDetail.ZQDoclineLink.first;
      while not fmStockLinkDetail.ZQDoclineLink.Eof do
      begin

        if AList.IndexOf
          (IntToStr(fmStockLinkDetail.ZQDoclineLinkWTAXID.AsInteger)) = -1 then
        begin
          AList.Add(IntToStr(fmStockLinkDetail.ZQDoclineLinkWTAXID.AsInteger));
          SetLength(ATaxes, AList.Count);
        end;
        AIncTotal :=
          FixAmount(fmStockLinkDetail.ZQDoclineLinkFINCLUSIVEAMT.AsFloat,
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        AExcTotal :=
          FixAmount(fmStockLinkDetail.ZQDoclineLinkFEXCLUSIVEAMT.AsFloat,
          dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ATaxes[AList.IndexOf(IntToStr(aQuery.FieldByName('WTaxId').AsInteger))]
          := ATaxes[AList.IndexOf(IntToStr(aQuery.FieldByName('WTaxId')
          .AsInteger))] + AIncTotal - AExcTotal;
        fmStockLinkDetail.ZQDoclineLink.next;
      end;
    end;
    StrTextOut := '';
    for i := 0 to AList.Count - 1 do
    begin
      if ATaxes[i] <> 0 then
      begin
        if StrTextOut <> '' then
          StrTextOut := StrTextOut + #13 + #10;
        StrTextOut := StrTextOut + TDataBaseRoutines.GetAccountFullDescription
          (StrToIntDef(AList[i], 0)) + ' ' +
          FloatToStrF(FixAmount(ATaxes[i],
          dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals), ffFixed,
          18, dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals);
      end;
    end;
    if StrTextOut <> '' then
      OSFMessageDlg(StrTextOut, mtinformation, [mbok], 0);
  finally
    AList.free;
  end;
end;

procedure TfmInvoiceEntryGrid.URLPayment1Click(Sender: TObject);
var
  AParams: String;
  AFormat: TFormatSettings;
begin
  AFormat.DecimalSeparator := '.';
  AFormat.ThousandSeparator := ',';
  if QDocHeadCALOPENAMOUNT.AsFloat <> 0 then

  begin
    AParams := 'AMT=' + formatfloat('0.00', QDocHeadCALOPENAMOUNT.AsFloat,
      AFormat) + #13 + #10 + 'DOCNO=' + QDocHeadSDOCNO.AsString;
    TDatabaseRegistyRoutines.OpenFile(TDatabaseTableRoutines.ReplaceParams
      (DMTCCoreLink.ReadLongReportOp('URLPAYMENT'), AParams))
  end;
end;

procedure TfmInvoiceEntryGrid.Link1Click(Sender: TObject);
begin
  if tblBatch.IsEmpty then
    exit;
  if tblBatchBRECONCILED.AsInteger = 1 then
    exit;
  cxGrid1DBTableView1.Controller.FocusedColumnindex := 0;
  Application.ProcessMessages;

  fmDocLinks.Stockid := TDataBaseStockRoutines.GetStockid
    (tblBatchSREFERENCE.AsString);
  fmDocLinks.Qty := StrToFloatDef(tblBatchSCONTRAACCOUNT.AsString, 0) *
    TDataBaseStockRoutines.GetUnitQty(tblBatchWUNITID.AsInteger);
  fmDocLinks.DocType := idDocType;

  fmDocLinks.DocLineID := tblBatchWLINEID.AsInteger;
  fmDocLinks.ShowModal;

end;

procedure TfmInvoiceEntryGrid.GoToDocFromTagOfSender(Sender: TObject);
begin
  GoToDocId := TComponent(Sender).Tag;
  BFilterClick(nil);
  if LinkToList.Values[IntToStr(TComponent(Sender).Tag)] <> '' then
  begin
    BEditClick(self);
    tblBatch.Locate(tblBatchWLINEID.FieldName,
      StrToIntDef(LinkToList.Values[IntToStr(TComponent(Sender).Tag)], 0), []);
  end;
end;

procedure TfmInvoiceEntryGrid.dbgridInvoiceColExit(Sender: TObject);
var
  Sub: String;
begin
  if (tblBatch.State in [dsedit, DsInsert]) then
    if (FindIndexOfName('SDescription') = cxGrid1DBTableView1.Controller.
      FocusedColumn.Index) then
      if Length(VarToStr(tblBatchSDESCRIPTION.Value)) < 11 then
      begin
        Sub := TDataBaseLedgerRoutines.GetAbreviat
          (VarToStr(tblBatchSDESCRIPTION.Value));
        if Sub <> '' then
          tblBatchSDESCRIPTION.Value := Sub;
      end;
end;

procedure TfmInvoiceEntryGrid.cxlistDBTableCustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  aGroupRec: TGroupRecPointer;
begin
  if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
    [cxlistDBTableWGROUP1COLOR.Index]), 0) <> 0) or
    (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
    [cxlistDBTableWGROUP1TEXTCOLOR.Index]), 0) <> 0) then
  begin

    if (AViewInfo.Selected) or (AViewInfo.Focused) then
    begin

      if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
        [cxlistDBTableWGROUP1TEXTCOLOR.Index]), 0) <> 0) then
        ACanvas.Brush.Color :=
          StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
          [cxlistDBTableWGROUP1TEXTCOLOR.Index]), 0);
      if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
        [cxlistDBTableWGROUP1COLOR.Index]), 0) <> 0) then
        ACanvas.Font.Color :=
          StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
          [cxlistDBTableWGROUP1COLOR.Index]), 0);

    end
    else
    begin

      if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
        [cxlistDBTableWGROUP1COLOR.Index]), 0) <> 0) then
        ACanvas.Brush.Color :=
          StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
          [cxlistDBTableWGROUP1COLOR.Index]), 0);
      if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
        [cxlistDBTableWGROUP1TEXTCOLOR.Index]), 0) <> 0) then
        ACanvas.Font.Color :=
          StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
          [cxlistDBTableWGROUP1TEXTCOLOR.Index]), 0);

    end;
  end;



  // always do the extra colors

  if ExtraColorCondition <> '' then
  begin
    if (POS('M.COLUMN=', ExtraColorCondition) > 1) then
    begin
      if (POS('M.COLUMN=' + QuotedStr(TcxGridDBBandedColumn(AViewInfo.Item)
        .DataBinding.FieldName), ExtraColorCondition) > 1) then
        if VarToStr(EvaluateText(ExtraColorCondition,
          'COLUMN=' + TcxGridDBBandedColumn(AViewInfo.Item)
          .DataBinding.FieldName + #13 + #10 + 'FOCUS=' +
          BoolToStr(AViewInfo.Focused, true) + #13 + #10 +
          dmQuantumGridDefs.getRecordValuesAsString(AViewInfo.GridRecord), nil))
          = 'True' then
        begin
          ACanvas.Brush.Color := ExtraColorBg;
          ACanvas.Font.Color := ExtraColorFont;
        end;
    end
    else if TcxGridDBBandedColumn(AViewInfo.Item)
      .DataBinding.FieldName = 'SDOCNO' then
    begin
      if VarToStr(EvaluateText(ExtraColorCondition,
        'COLUMN=' + TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName
        + #13 + #10 + 'FOCUS=' + BoolToStr(AViewInfo.Focused, true) + #13 + #10
        + dmQuantumGridDefs.getRecordValuesAsString(AViewInfo.GridRecord), nil))
        = 'True' then
      begin
        ACanvas.Brush.Color := ExtraColorBg;
        ACanvas.Font.Color := ExtraColorFont;
      end;
    end;
  end;
  if TcxGridDBBandedColumn(AViewInfo.Item)
    .DataBinding.FieldName = 'SGROUP2DESC' then
  begin
    DMTCCoreLink.GroupsObject.getGroup(aGroupRec,
      StrToIntDef(VarToStr(AViewInfo.GridRecord.Values
      [cxlistDBTableWREPORTINGGROUP2ID.Index]), 0));
    if (AViewInfo.Selected) or (AViewInfo.Focused) then
    begin
      // DBGSearch.Canvas.Font.Color := DBGSearch.Canvas.Brush.Color ;
      if (aGroupRec^.Wfontcol <> 0) then
        ACanvas.Brush.Color := aGroupRec^.Wfontcol;
      if (aGroupRec^.Wbackcol <> 0) then
        ACanvas.Font.Color := aGroupRec^.Wbackcol;

    end
    else
    begin
      // DBGSearch.Canvas.Font.Color := DBGSearch.Canvas.Brush.Color ;
      if (aGroupRec^.Wbackcol <> 0) then
        ACanvas.Brush.Color := aGroupRec^.Wbackcol;
      if (aGroupRec^.Wfontcol <> 0) then
        ACanvas.Font.Color := aGroupRec^.Wfontcol;
    end;
  end;
end;

procedure TfmInvoiceEntryGrid.cbSimplelayoutClick(Sender: TObject);
var
  i: Integer;
begin
  cxlistDBTable.OptionsView.GroupByBox := not cbSimplelayout.Checked;
  cxlistDBTable.OptionsView.Footer := true;

  if not cxlistDBTable.OptionsView.GroupByBox then
  begin
    for i := 0 to cxlistDBTable.ColumnCount - 1 do
    begin
      cxlistDBTable.Columns[i].Options.CellMerging := false;
    end;
  end
  else
  begin
    cxlistDBTableDDATE.Options.CellMerging := true;
    cxlistDBTableSGROUP1DESC.Options.CellMerging := true;
    cxlistDBTableSGROUP2DESC.Options.CellMerging := true;
    cxlistDBTableSSALESMANDESCRIPTION.Options.CellMerging := true;
  end;

end;

procedure TfmInvoiceEntryGrid.newdoctest1Click(Sender: TObject);
begin
  fmDocdetails := TfmDocdetails.Create(self);
  try
    fmDocdetails.WDocRowDecimals :=
      dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals;
    fmDocdetails.InitDoc(QDocHeadWDOCID.AsInteger, LocalDocType);
    fmDocdetails.ShowModal;
  finally
    fmDocdetails.free;
  end;

end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  AStockRec: TStockRecPointer;
begin
  if not AViewInfo.Selected then
  begin
    if not cxGrid1DBTableView1.OptionsData.Editing then
    begin
      ACanvas.Brush.Color := dmQuantumGridDefs.cxgroup.Color;
      ACanvas.Font.Color := dmQuantumGridDefs.cxgroup.TextColor;
    end
    else
    begin
      ACanvas.Brush.Color := dmQuantumGridDefs.cxContentEven.Color;
      ACanvas.Font.Color := dmQuantumGridDefs.cxContentEven.TextColor;
    end;
  end;
  if OutOfStockDrawColors then
  begin

    if AViewInfo.Item = cxGrid1DBTableView1SCONTRAACCOUNT then
      if VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1BRECONCILED.
        Index]) <> '1' then
        if not(cbPosted.ItemIndex = 2) then
          if (LocalDocType in [10, 14]) then
          begin
            if ATempStockList.getStock(AStockRec,
              VarToStr(AViewInfo.GridRecord.Values
              [cxGrid1DBTableView1SREFERENCE.Index])) then
            begin
              TDataBaseStockRoutines.SyncQty(AStockRec^, LocalDocType,
                LastDocHeaderId);
            end;

            if (AStockRec^.WStockTypeId in [0, 1, 9]) then
            begin

              if ((AStockRec^.FQtyOnHand - AStockRec^.FUnpostedItems) -
                StrToFloatDef(VarToStr(AViewInfo.GridRecord.Values
                [cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0)) < 0 then
              begin
                ACanvas.Brush.Color := clRed;
                ACanvas.Font.Color := clWhite;
                if ((AStockRec^.FQtyOnHand - AStockRec^.FUnpostedItems +
                  AStockRec^.FQtyInOrder) -
                  StrToFloatDef(VarToStr(AViewInfo.GridRecord.Values
                  [cxGrid1DBTableView1SCONTRAACCOUNT.Index]), 0)) >= 0 then
                begin
                  ACanvas.Brush.Color := $000078F0;
                  ACanvas.Font.Color := clWhite;
                end;
              end;
            end;
          end;
  end;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1EditKeyDown
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  dbgridInvoiceKeyDown(Sender, Key, Shift);

end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1EditKeyPress
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
  if AItem = cxGrid1DBTableView1FDEBIT then
    if Key = '.' then
      Key := formatsettings.DecimalSeparator;

  if AItem = cxGrid1DBTableView1FCREDIT then
    if Key = '.' then
      Key := formatsettings.DecimalSeparator;
  if AItem = cxGrid1DBTableView1FTAXAMOUNT then
    if Key = '.' then
      Key := formatsettings.DecimalSeparator;

  if AItem = cxGrid1DBTableView1SACCOUNT then
    if Key = '.' then
      Key := formatsettings.DecimalSeparator;

  if AItem = cxGrid1DBTableView1SCONTRAACCOUNT then
    if Key = '.' then
      Key := formatsettings.DecimalSeparator;

  dbgridInvoiceKeyPress(Sender, Key);
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1FocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if AFocusedRecord = nil then
    exit;
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  if idDocType < 10 then
    idDocType := 10;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);
  if AFocusedRecord <> nil then
    cxGrid1DBTableView1SDESCRIPTION.Options.Editing :=
      VarToStr(AFocusedRecord.Values[cxGrid1DBTableView1BRECONCILED.
      Index]) <> '1';
  // Load item if line is changed.
  if LastBatchLineId <> StrToIntDef
    (VarToStr(AFocusedRecord.Values[cxGrid1DBTableView1WLINEID.Index]), -1) then
  begin
    loadCurrentItem;
  end;
  // Exit if where looking at a posted one.
  if LastDocPosted then
  begin
    exit;
  end;
  BCalcInProg := false;
  If tblBatchBRECONCILED.Value = 1 then
  begin
    exit
  end;
  if LastStock.WStockTypeId = 10 then
  begin
    cxGrid1DBTableView1.Controller.FocusedColumn :=
      cxGrid1DBTableView1SREFERENCE;
    exit;
  end;
  If not AllOk then
    exit;
  if cxGrid1DBTableView1.Controller.FocusedColumn =
    cxGrid1DBTableView1SCONTRAACCOUNT then
  begin
    if tblBatchSCONTRAACCOUNT.IsNull then
      OldStockValue := 0
    else
      OldStockValue := Str2Float(tblBatchSCONTRAACCOUNT.AsString);
  end;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1FUNITQTYValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
if not (tblBatch.State in [DsEdit,DsInsert]) then
   tblBatch.edit ;
   tblBatchFUNITQTY.AsFloat := StrToFloatDef(DisplayValue,0);
CalcAmounts ;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1FTAXAMOUNTPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
if not (tblBatch.State in [DsEdit,DsInsert]) then
   tblBatch.edit ;
   tblBatchFTAXAMOUNT.AsFloat := StrToFloatDef(DisplayValue,0);
CalcAmounts ;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1FocusedItemChanged
  (Sender: TcxCustomGridTableView;
  APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
begin
  if cxGrid1DBTableView1.Controller.FocusedColumnindex <>
    cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex then
    if GoToStockQty and GoToStockQtyReturnAuto then
    begin
      try
        if EFastbarcodelookup.CanFocus then
          EFastbarcodelookup.SetFocus;
      except

      end;
    end;

  if (tblBatchSREFERENCE.Value <> '') and
    (tblBatchSREFERENCE.Value = LastStock.SSTOCKCODE) and
    (LastStock.WStockTypeId = 0) and ((LastStock.wLocBatSerTypeid > 0) and
    (LocalDocType in [10, 11, 12, 13, 16, 17])) and
    (cxGrid1DBTableView1.Controller.FocusedColumn.Index <>
    FindIndexOfName(tblBatchSREFERENCE.FieldName)) and
    (FindIndexOfName(tblBatchSCONTRAACCOUNT.FieldName)
    = cxGrid1DBTableView1.Controller.FocusedColumn.Index) then
  begin
    cxGrid1DBTableView1.Controller.FocusedColumnindex :=
      cxGrid1DBTableView1.Controller.FocusedColumnindex + 1;
    exit;
  end;
  if CannotEditDesc and (cxGrid1DBTableView1.Controller.FocusedColumn.
    Index = FindIndexOfName(tblBatchSDESCRIPTION.FieldName)) then
  begin
    cxGrid1DBTableView1.Controller.FocusedColumnindex :=
      cxGrid1DBTableView1.Controller.FocusedColumnindex + 1;
  end;
  if CannotEditPrice and (cxGrid1DBTableView1.Controller.FocusedColumn.Index
    in [FindIndexOfName(tblBatchFCREDIT.FieldName),
    FindIndexOfName(tblBatchFDEBIT.FieldName)]) then
  begin
    if cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName(tblBatchFCREDIT.FieldName) then
    begin
      cxGrid1DBTableView1.Controller.FocusedColumnindex :=
        cxGrid1DBTableView1STAX.VisibleIndex;
    end
    else
      cxGrid1DBTableView1.Controller.FocusedColumn.Index :=
        cxGrid1DBTableView1STAX.VisibleIndex
  end;
  if (tblBatchBRECONCILED.Value = 1) then
    exit;
  if LastStock.WStockTypeId = 10 then
    exit;
  if tblBatch.State = dsedit then
    if cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName(tblBatchSREFERENCE.FieldName) then
      if NewRecord then
      begin
        if GoToStockQty then
          cxGrid1DBTableView1.Controller.FocusedColumnindex :=
            cxGrid1DBTableView1SCONTRAACCOUNT.VisibleIndex
        else
          cxGrid1DBTableView1.Controller.FocusedColumnindex := 1;
        NewRecord := false;
      end;
  if LastDocPosted then
  begin
    exit;
  end;

  FmLookup.IsShowForm := false;

  try
    If not AllOk then
      exit;

    if (cxGrid1DBTableView1.Controller.FocusedColumn.
      Index = FindIndexOfName(tblBatchFCREDIT.FieldName)) then
      ColInMod := cxGrid1DBTableView1.Controller.FocusedColumn.Index;

  finally

  end;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1SACCOUNTPropertiesValidate
  (Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);

Var
  ReorderLevel: Integer;
  MyVar: Variant;

  Sub: String;
begin
  if cxGrid1DBTableView1.Controller.FocusedColumn <>
    cxGrid1DBTableView1WUNITID then

    TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn)
      .DataBinding.Field.Text := DisplayValue
  else
  begin
    if VarToStr(TcxLookupComboBox(Sender).EditValue) <> '' then
      TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn)
        .DataBinding.Field.Text :=
        VarToStr(TcxLookupComboBox(Sender).EditValue);
    // TcxComboBox(sender).Properties.Items.ValueFromIndex
  end;

  if (tblBatch.State in [dsedit, DsInsert]) then
    if (FindIndexOfName('SDescription') = cxGrid1DBTableView1.Controller.
      FocusedColumn.Index) then
      if Length(tblBatchSDESCRIPTION.Value) < 11 then
      begin
        Sub := TDataBaseLedgerRoutines.GetAbreviat(tblBatchSDESCRIPTION.Value);
        if Sub <> '' then
          tblBatchSDESCRIPTION.Value := Sub;
      end;
  idDocType := Integer(cbDocTypenew.Items.Objects[cbDocTypenew.ItemIndex]);
  if idDocType < 10 then
    idDocType := 10;
  LocalDocType := idDocType;
  if LocalDocType > 18 then
    LocalDocType := 14 + (LocalDocType mod 2);

  if LastDocPosted then
  begin
    exit;
  end;
  MyVar := Gridinpatch;
  if MyVar then
    exit;
  Gridinpatch := true;
  try
    if tblBatchSREFERENCE.AsString = '' then
    begin
      SelectStockItem;
      exit;
    end;
    FieldChgd := true;
    if (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1SCONTRAACCOUNT) and
      (LocalDocType in [10, 12, 14, 15, 16, 17]) then
    begin

      // qty shipped column
      // tblBatch.DisableControls;
      Try
        ReorderLevel := Round(LastStock.FReorderQty);
        if (LocalDocType in [10, 14, 16]) then
          TempQtyOnHand := LastStock.FQtyOnHand -
            (LastStock.FUnpostedItems +
            Str2Float(tblBatchSCONTRAACCOUNT.AsString))
        else
          TempQtyOnHand := LastStock.FQtyOnHand -
            (LastStock.FUnpostedItems -
            Str2Float(tblBatchSCONTRAACCOUNT.AsString));

        { if idDocType = 14 then
          TempQtyOnHand := TempQtyOnHand - LastStock.FminimumQty ; }
        if ((ReorderLevel = -1) or not(LastStock.WStockTypeId
          in CheckStockTypesSet)) or (LocalDocType in [11, 13, 17]) then
          self.caption := TmpCaption
        else
          self.caption := TmpCaption + ',    ' + FloatToStrF(TempQtyOnHand,
            ffFixed, 18, 2) + ' ' + GetTextLang(507) + { on hand } '.';

        StatusBar.Panels[1].Text := self.caption;
        if tblBatchSCONTRAACCOUNT.AsString <> '' then
        begin
          if (TempQtyOnHand < 0) and (LocalDocType in [10, 14, 16]) then
            // done : Pieter Debug does not like messages

            if (ReorderLevel <> -1) and
              not(LocalDocType in [11, 12, 13, 15, 17]) then
              if (LastStock.WStockTypeId in CheckStockTypesSet) then
              begin
                if not NoOutOfStockMsg then
                  OSFMessageDlg(GetTextLang(506) + FloatToStrF(TempQtyOnHand,
                    ffFixed, 18, 2) + ' ' + GetTextLang(2150) +
                    { items on hand } '.', mtinformation, [mbok], 0);
              end;

          if (Str2Float(tblBatchSCONTRAACCOUNT.AsString) >
            Str2Float(tblBatchSACCOUNT.AsString)) or (STKNoBackOrder) or
            (FindIndexOfName('SACCOUNT') = -1) then
            tblBatchSACCOUNT.Value := tblBatchSCONTRAACCOUNT.Value;
          if (Str2Float(tblBatchSCONTRAACCOUNT.AsString) <>
            Str2Float(tblBatchSACCOUNT.AsString)) and (STKNoBackOrder) then
            tblBatchSACCOUNT.Value := tblBatchSCONTRAACCOUNT.Value;

          if UsePricePlugin and (LastStock.SSTOCKCODE <> '') then
          begin
            if UpdateStockRecWithPriceForplugin(LastStock,
              tblBatchFUNITQTY.AsFloat) then
              ApplyStockCodeToCurrentRecord(true);
          end;
          CalcAmounts;
        end
        else
        begin
          if UsePricePlugin and (LastStock.SSTOCKCODE <> '') then
          begin
            UpdateStockRecWithPriceForplugin(LastStock,
              tblBatchFUNITQTY.AsFloat);
            ApplyStockCodeToCurrentRecord;
          end;
          CalcAmounts;
        end;
      Finally
        // tblBatch.EnableControls;
      end;
    end
    else
    begin
      if ((cxGrid1DBTableView1.Controller.FocusedColumn =
        cxGrid1DBTableView1SCONTRAACCOUNT) or
        (cxGrid1DBTableView1.Controller.FocusedColumn =
        cxGrid1DBTableView1SACCOUNT)) and UsePricePlugin and
        (LastStock.SSTOCKCODE <> '') then
      begin
        UpdateStockRecWithPriceForplugin(LastStock, tblBatchFUNITQTY.AsFloat);
        ApplyStockCodeToCurrentRecord(true);
      end;
      if not(cxGrid1DBTableView1.Controller.FocusedColumn =
        cxGrid1DBTableView1FTAXAMOUNT) then
        CalcAmounts;
    end;

    if (ColInMod > 0) And
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FCREDIT) then
    begin
      ColInMod := -1;
      GetUserDiscount;
      // done : Pieter Tom showed me that the discount does not get updated after the first line
      // thats becouse this CollInMod is set to -1 so i gess after the calling of this routine we set it to the selected index
      ColInMod := cxGrid1DBTableView1.Controller.FocusedColumn.Index;
    end;

    if (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FDEBIT) Or
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FTAXAMOUNT) then
    begin
      if cxGrid1DBTableView1.Controller.FocusedColumn =
        cxGrid1DBTableView1FTAXAMOUNT then
      begin
        CalcAmountsFromDiscount(tblBatchFUNITQTY.AsFloat);
      end
      else
      begin
        CalcAmounts;
      end;

      if (cxGrid1DBTableView1.Controller.FocusedColumn =
        cxGrid1DBTableView1FDEBIT) AND (LocalDocType = 10) then
      begin
        if (LastStock.FAvgUnitCost <> 0) And
          (tblBatchFDEBIT.Value < LastStock.FAvgUnitCost) then
          OSFMessageDlg(tblBatchFDEBIT.AsString + ' ' + GetTextLang(810) + ' ' +
            FloatToStrF(LastStock.FAvgUnitCost, ffFixed, 18, 2) + ' ' +
            GetTextLang(811), mtinformation, [mbok], 0);
      end;
    end;
    if (cxGrid1DBTableView1.Controller.FocusedColumn = cxGrid1DBTableView1STAX)
      Or (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FDEBIT) Or
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FTAXAMOUNT) Or
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1SCONTRAACCOUNT) Or
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FCREDIT) or
      (cxGrid1DBTableView1.Controller.FocusedColumn =
      cxGrid1DBTableView1FUNITQTY) then
    begin
      UpdateTotalsLbls;
    end;
  finally
    Gridinpatch := false;
  end;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1STAXPropertiesButtonClick
  (Sender: TObject; AButtonIndex: Integer);
begin
  dbgridInvoiceDblClick(self);
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1FDEBITPropertiesButtonClick
  (Sender: TObject; AButtonIndex: Integer);
var
  Apoint: TPoint;
begin
  Apoint := Panel3.ScreenToClient(Mouse.CursorPos);
  if tblBatchBRECONCILED.AsInteger <> 1 then
    if (LocalDocType in [10, 11, 14, 16]) then
      ShowPriceList(Rect(Apoint.X, Apoint.Y, Apoint.X, Apoint.Y));
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1SACCOUNTGetProperties
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.Alignment.Horz := taRightJustify;
end;

procedure TfmInvoiceEntryGrid.cxGrid1DBTableView1SDESCRIPTIONGetCellHint
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
begin

  if (cxGrid1.Canvas.TextWidth(VarToStr(ARecord.Values
    [cxGrid1DBTableView1SDESCRIPTION.Index])) > (ACellViewInfo.RealBounds.Right
    - ACellViewInfo.RealBounds.Left)) or
    (POS(#13, VarToStr(ARecord.Values[cxGrid1DBTableView1SDESCRIPTION.Index])
    ) > 0) then
  begin
    AHintText :=
      VarToStr(ARecord.Values[cxGrid1DBTableView1SDESCRIPTION.Index]);
    AIsHintMultiLine := true;
  end;
end;

initialization

twf_TfmDocument.Create(nil);
twf_TfmPluginDocument.Create(nil);

end.
