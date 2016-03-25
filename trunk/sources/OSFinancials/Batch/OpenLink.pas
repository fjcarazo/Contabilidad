
   (*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Mixed Unit (TC and changes osF)
  Released under the GNU General Public License
*)
unit OpenLink;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids,   DB, Menus,
  ComCtrls, Math,TcVariables,
  DatabaseAccess,   DBAccess , Uni,
  DBGrids, CheckLst, TcashClasses,UosfResources,UpluginsSharedUnit,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxCheckBox, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,  cxCalendar,
  ToolWin, cxLabel, cxSpinEdit;

type
 twf_TfmOpenLink  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;

  TfmOpenLink = class(TForm)
    PopupMenu1: TPopupMenu;
    UnlinkTransaction1: TMenuItem;
    RPymt: TMenuItem;
    DsStmtMain: TDataSource;
    DsLinkedDoc: TDataSource;
    Reprinttransactions1: TMenuItem;
    pcMain: TPageControl;
    tsDetail: TTabSheet;
    pnlTop: TPanel;
    PnlBar: TPanel;
    ToolBar: TToolBar;
    BtnClear: TToolButton;
    BtnBBF: TToolButton;
    BtnUnlink: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    tbnStatmt: TToolButton;
    PnlStatement: TPanel;
    Panel3: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    edtCurDate: TcxDateEdit;
    edtSince: TcxDateEdit;
    Panel4: TPanel;
    Label3: TLabel;
    lbl90: TLabel;
    Label6: TLabel;
    lbl60: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    lbl30: TLabel;
    Label10: TLabel;
    lblCur: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label9: TLabel;
    lblDue: TLabel;
    PnlPlain: TPanel;
    Splitter1: TSplitter;
    pnlLeft: TPanel;
    Panel1: TPanel;
    pnlRight: TPanel;
    Panel2: TPanel;
    PanelUnlink: TPanel;
    Bevel1: TBevel;
    lblFrDt: TLabel;
    Label4: TLabel;
    edtDateFrom: TcxDateEdit;
    BitBtnOk: TBitBtn;
    BitBtnClose: TBitBtn;
    MyCaptionBar: TStaticText;
    cbDDebit: TCheckBox;
    cbDCredit: TCheckBox;
    cbAllLinks: TCheckBox;
    cbBBFDate: TCheckBox;
    edtDateTo: TcxDateEdit;
    CBUseRef: TCheckBox;
    cbGenBFOnAllAccount: TCheckBox;
    ButtonPanel: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    lblLedger: TLabel;
    lblOut: TLabel;
    lblAmt: TLabel;
    lblMs1: TLabel;
    lblMs3: TLabel;
    lblMs5: TLabel;
    lblMs2: TLabel;
    lblDiffAmt: TLabel;
    lblDiffOut: TLabel;
    lblMs4: TLabel;
    SearchPanel: TPanel;
    edtAmtRef: TEdit;
    btnApply: TBitBtn;
    tsList: TTabSheet;
    ZQAccountList: TuniQuery;
    dsZAccountList: TDataSource;
    ZQAccountListTOTALTRANS: TFloatField;
    ZQAccountListTOTALOPEN: TFloatField;
    ZQAccountListWACCOUNTTYPEID: TIntegerField;
    ZQAccountListSACCOUNTCODE: TStringField;
    ZQAccountListSDESCRIPTION: TStringField;
    ZQAccountListWACCOUNTID: TIntegerField;
    ToolButton4: TToolButton;
    Panel5: TPanel;
    Shape3: TShape;
    lblAccountDesc: TLabel;
    Label1: TLabel;
    edtAccount: TEdit;
    zQHasTrans: TuniQuery;
    ZQTranslist: TuniQuery;
    dsTransList: TDataSource;
    pcLijst: TPageControl;
    tsTotals: TTabSheet;
    tsTransactions: TTabSheet;
    PSearch: TPanel;
    LField: TLabel;
    LFilterValue: TLabel;
    CBFindColumn: TComboBox;
    CBOperatot: TComboBox;
    EFilterValue: TEdit;
    BFilter: TButton;
    BClear: TButton;
    cbAccountType: TCheckListBox;
    cbShowColors: TCheckBox;
    Panel6: TPanel;
    LFieldTrans: TLabel;
    LFilterValueTrans: TLabel;
    CBFindColumnTrans: TComboBox;
    CBOperatotTrans: TComboBox;
    EFilterValueTrans: TEdit;
    BFilterTrans: TButton;
    BClearTrans: TButton;
    cbAccountTypeTrans: TCheckListBox;
    ZQTranslistSACCOUNTCODE: TStringField;
    ZQTranslistSACCOUNTDESCRIPTION: TStringField;
    ZQTranslistSREFERENCE: TStringField;
    ZQTranslistSDESCRIPTION: TStringField;
    ZQTranslistTOTALTRANS: TFloatField;
    ZQTranslistTOTALOPEN: TFloatField;
    ZQTranslistDPAYMENTDATE: TDateField;
    ZQTranslistDDATE: TDateField;
    ZQTranslistWACCOUNTTYPEID: TIntegerField;
    ZQTranslistWACCOUNTID: TIntegerField;
    ZQTranslistWTRANSACTIONID: TIntegerField;
    cbOpenOnly: TCheckBox;
    BitBtn1: TBitBtn;
    zQMasterHist: TuniQuery;
    zQDetailHist: TuniQuery;
    dsMasterhist: TDataSource;
    dsDetailHist: TDataSource;
    zQDetailHistDDATE: TDateTimeField;
    zQDetailHistSREFERENCE: TStringField;
    zQDetailHistFAMOUNT: TFloatField;
    zQDetailHistWACCOUNTID: TIntegerField;
    zQDetailHistBRECONCILED: TSmallintField;
    zQDetailHistFOUTSTANDINGAMOUNT: TFloatField;
    zQDetailHistWTRANSACTIONID: TIntegerField;
    zQDetailHistWDESCRIPTIONID: TIntegerField;
    zQDetailHistSALIAS: TStringField;
    zQDetailHistSDESCRIPTION: TStringField;
    zQMasterHistDDATE: TDateTimeField;
    zQMasterHistSREFERENCE: TStringField;
    zQMasterHistFAMOUNT: TFloatField;
    zQMasterHistWACCOUNTID: TIntegerField;
    zQMasterHistBRECONCILED: TSmallintField;
    zQMasterHistFOUTSTANDINGAMOUNT: TFloatField;
    zQMasterHistWTRANSACTIONID: TIntegerField;
    zQMasterHistWDESCRIPTIONID: TIntegerField;
    zQMasterHistSALIAS: TStringField;
    zQMasterHistSDESCRIPTION: TStringField;
    ZQAccountListCHECKSTATUS: TIntegerField;
    cbFindInvalide: TCheckBox;
    BExporttrans: TButton;
    BExportTotal: TButton;
    SaveDialog1: TSaveDialog;
    cbFindInvalideDetail: TComboBox;
    wwqryOpenDebits: TuniQuery;
    wwqryOpenDebitsWTRANSACTIONID: TIntegerField;
    wwqryOpenDebitsSREFERENCE: TStringField;
    wwqryOpenDebitsDDATE: TDateTimeField;
    wwqryOpenDebitsFAMOUNT: TFloatField;
    wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenDebitsSDESCRIPTION: TStringField;
    wwqryOpenDebitsBUNUSED: TSmallintField;
    wwqryOpenDebitsISLINKED: TIntegerField;
    wwqryOpenCredits: TuniQuery;
    wwqryOpenCreditsWTRANSACTIONID: TIntegerField;
    wwqryOpenCreditsSREFERENCE: TStringField;
    wwqryOpenCreditsDDATE: TDateTimeField;
    wwqryOpenCreditsFAMOUNT: TFloatField;
    wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenCreditsSDESCRIPTION: TStringField;
    wwqryOpenCreditsBUNUSED: TSmallintField;
    wwqryOpenCreditsISLINKED: TIntegerField;
    dswwqryOpenCredits: TDataSource;
    dswwqryOpenDebits: TDataSource;
    CtUpdate: TUniUpdateSql;
    DtUpdate: TUniUpdateSql;
    cbFilter: TCheckBox;
    Checkselected1: TMenuItem;
    Uncheckselected1: TMenuItem;
    btnRemoveFaults: TBitBtn;
    TUpdate: TTimer;
    PopupMenu2: TPopupMenu;
    Adjustpaymentdate1: TMenuItem;
    cbJustExactAmounts: TCheckBox;
    Recievepayment1: TMenuItem;
    Undolastlink1: TMenuItem;
    PopupMenu3: TPopupMenu;
    Autoreversetillvalide1: TMenuItem;
    Automatchexactamounts1: TMenuItem;
    Unlinktilvalide1: TMenuItem;
    Linkdebto1or2cred1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Autolinkcredto13deb: TMenuItem;
    Debitpercentmatch1: TMenuItem;
    Autolink1debXcreds1: TMenuItem;
    N3: TMenuItem;
    Automatch1debittoXcreditslow1: TMenuItem;
    Autoreversetillvalideslow1: TMenuItem;
    LExtraData: TLabel;
    ZQAccountData: TuniQuery;
    ZQAccountDataSDELIVERY1: TStringField;
    ZQAccountDataSDELIVERY2: TStringField;
    ZQAccountDataSDELIVERY3: TStringField;
    ZQAccountDataSDELIVERYCODE: TStringField;
    ZQAccountDataDELCOUNTRY: TStringField;
    ZQAccountDataPOSCOUNTRY: TStringField;
    ZQAccountDataSDESCRIPTION: TStringField;
    ZQAccountDataSACCOUNTCODE: TStringField;
    ZQAccountDataSPOSTAL1: TStringField;
    ZQAccountDataSPOSTAL2: TStringField;
    ZQAccountDataSPOSTAL3: TStringField;
    ZQAccountDataSPOSTALCODE: TStringField;
    ZQAccountDataSTELEPHONE1: TStringField;
    ZQAccountDataSTELEPHONE2: TStringField;
    ZQAccountDataSFAX: TStringField;
    ZQAccountDataSEMAIL: TStringField;
    ZQAccountDataSBRANCHCODE: TStringField;
    ZQAccountDataSBANKACCOUNTNUMBER: TStringField;
    ZQAccountDataDLASTACTIVITY: TDateTimeField;
    ZQAccountDataSREFERENCE: TStringField;
    ZQAccountDataWDUEDAYS: TIntegerField;
    ZQAccountDataWACCOUNTID: TIntegerField;
    ZQAccountDataFIRSTNAME: TStringField;
    ZQAccountDataLASTNAME: TStringField;
    ZQAccountDataGROUPDESC1: TStringField;
    ZQAccountDataGROUPSORT1: TIntegerField;
    ZQAccountDataGROUPDESC2: TStringField;
    ZQAccountDataGROUPSORT2: TIntegerField;
    ZQAccountDataWCOLOR: TIntegerField;
    ZQAccountDataWTEXTCOLOR: TIntegerField;
    ZQAccountDataWREPORTINGGROUP2ID: TIntegerField;
    tsTempLinkedoff: TTabSheet;
    ZQUnprocessedLinks: TuniQuery;
    ZQUnprocessedLinksWTRANSACTIONID: TIntegerField;
    ZQUnprocessedLinksWBATCHID: TIntegerField;
    ZQUnprocessedLinksWBATCHTYPEID: TIntegerField;
    ZQUnprocessedLinksWLINEID: TIntegerField;
    ZQUnprocessedLinksBCARRIEDFORWARD: TSmallintField;
    ZQUnprocessedLinksBLASTYEAR: TSmallintField;
    ZQUnprocessedLinksBLINKSUSED: TSmallintField;
    ZQUnprocessedLinksBMULTIPLEITEMS: TSmallintField;
    ZQUnprocessedLinksWACCOUNTID: TIntegerField;
    ZQUnprocessedLinksDDATE: TDateTimeField;
    ZQUnprocessedLinksWPERIODID: TIntegerField;
    ZQUnprocessedLinksWYEARID: TIntegerField;
    ZQUnprocessedLinksSREFERENCE: TStringField;
    ZQUnprocessedLinksFTAXRATE: TFloatField;
    ZQUnprocessedLinksWTAXACCOUNTID: TIntegerField;
    ZQUnprocessedLinksFAMOUNT: TFloatField;
    ZQUnprocessedLinksFTAXAMOUNT: TFloatField;
    ZQUnprocessedLinksFOUTSTANDINGAMOUNT: TFloatField;
    ZQUnprocessedLinksBRECONCILED: TSmallintField;
    ZQUnprocessedLinksWBALANCINGACCOUNTID: TIntegerField;
    ZQUnprocessedLinksWDESCRIPTIONID: TIntegerField;
    ZQUnprocessedLinksWCURRENCYID: TIntegerField;
    ZQUnprocessedLinksFFOREXAMOUNT: TFloatField;
    ZQUnprocessedLinksWUSERID: TIntegerField;
    ZQUnprocessedLinksUNUSED: TIntegerField;
    ZQUnprocessedLinksDSYSDATE: TDateTimeField;
    ZQUnprocessedLinksBUNUSED: TSmallintField;
    ZQUnprocessedLinksWTAX2ID: TIntegerField;
    ZQUnprocessedLinksFCURRENCYRATE2: TFloatField;
    ZQUnprocessedLinksFTAXRATE2: TFloatField;
    ZQUnprocessedLinksFTAX2AMOUNT: TFloatField;
    ZQUnprocessedLinksWJOBCODEID: TIntegerField;
    ZQUnprocessedLinksWPROFILEID: TIntegerField;
    ZQUnprocessedLinksBEXCLUSIVE: TSmallintField;
    ZQUnprocessedLinksWLINKEDID: TIntegerField;
    ZQUnprocessedLinksWREPORTINGGROUP1ID: TIntegerField;
    ZQUnprocessedLinksWREPORTINGGROUP2ID: TIntegerField;
    ZQUnprocessedLinksWDOCID: TIntegerField;
    ZQUnprocessedLinksDPAYMENTDATE: TDateTimeField;
    ZQUnprocessedLinksWREMITTANCECOUNT: TIntegerField;
    ZQUnprocessedLinksWPAYMENTTYPE: TIntegerField;
    ZQUnprocessedLinksWBATCHID_1: TIntegerField;
    ZQUnprocessedLinksWLINEID_1: TIntegerField;
    ZQUnprocessedLinksWBATCHTYPEID_1: TIntegerField;
    ZQUnprocessedLinksWTRANSACTIONID_1: TIntegerField;
    ZQUnprocessedLinksFAMOUNT_1: TFloatField;
    ZQUnprocessedLinksWMESSAGEID: TIntegerField;
    ZQUnprocessedLinksSDESCRIPTION: TStringField;
    ZQUnprocessedLinksSEXTRADESCRIPTION: TStringField;
    dsUnprocessedLinks: TDataSource;
    ZQUnprocessedLinksWBATCHID_2: TIntegerField;
    ZQUnprocessedLinksWUSERID_1: TIntegerField;
    ZQUnprocessedLinksWBATCHTYPEID_2: TIntegerField;
    ZQUnprocessedLinksSBATCHNUMBER: TStringField;
    ZQUnprocessedLinksBPOSTED: TSmallintField;
    ZQUnprocessedLinksBIMPORTED: TSmallintField;
    ZQUnprocessedLinksBDOCSOURCE: TSmallintField;
    ZQUnprocessedLinksWLINECOUNT: TIntegerField;
    ZQUnprocessedLinksSFILENAME: TStringField;
    ZQUnprocessedLinksWDOCID_1: TIntegerField;
    ZQUnprocessedLinksDSYSDATE_1: TDateTimeField;
    ZQUnprocessedLinksWINITBATID: TIntegerField;
    ZQUnprocessedLinksSALIAS: TStringField;
    ZQUnprocessedLinksSUNIQUEID: TStringField;
    ZQUnprocessedLinksSACCOUNTCODE: TStringField;
    ZQUnprocessedLinksSDESCRIPTION_1: TStringField;
    ZQUnprocessedLinksWACCOUNTTYPEID: TIntegerField;
    PopupMenu4: TPopupMenu;
    Delete1: TMenuItem;
    BtnExportDetails: TToolButton;
    Autopaymentdebitsforpercentageofgross1: TMenuItem;
    cxTotalsDBTableView1: TcxGridDBTableView;
    cxTotalsLevel1: TcxGridLevel;
    cxTotals: TcxGrid;
    cxTotalsDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxTotalsDBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxTotalsDBTableView1WACCOUNTTYPEID: TcxGridDBColumn;
    cxTotalsDBTableView1TOTALTRANS: TcxGridDBColumn;
    cxTotalsDBTableView1TOTALOPEN: TcxGridDBColumn;
    cxTotalsDBTableView1WACCOUNTID: TcxGridDBColumn;
    cxTotalsDBTableView1CHECKSTATUS: TcxGridDBColumn;
    cxTrans: TcxGrid;
    cxTransDBTableView: TcxGridDBTableView;
    cxTransLevel1: TcxGridLevel;
    cxTransDBTableViewSACCOUNTCODE: TcxGridDBColumn;
    cxTransDBTableViewSACCOUNTDESCRIPTION: TcxGridDBColumn;
    cxTransDBTableViewSREFERENCE: TcxGridDBColumn;
    cxTransDBTableViewSDESCRIPTION: TcxGridDBColumn;
    cxTransDBTableViewTOTALTRANS: TcxGridDBColumn;
    cxTransDBTableViewTOTALOPEN: TcxGridDBColumn;
    cxTransDBTableViewDPAYMENTDATE: TcxGridDBColumn;
    cxTransDBTableViewDDATE: TcxGridDBColumn;
    cxTransDBTableViewWACCOUNTTYPEID: TcxGridDBColumn;
    cxTransDBTableViewWACCOUNTID: TcxGridDBColumn;
    cxTransDBTableViewWTRANSACTIONID: TcxGridDBColumn;
    cxUnposted: TcxGrid;
    cxUnpostedLevel1: TcxGridLevel;
    cxUnpostedDBBandedTableView1: TcxGridDBBandedTableView;
    cxUnpostedDBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1DPAYMENTDATE: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1FAMOUNT_1: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1SALIAS: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1SDESCRIPTION_1: TcxGridDBBandedColumn;
    cxUnpostedDBBandedTableView1WACCOUNTTYPEID: TcxGridDBBandedColumn;
    cxDebitsLevel1: TcxGridLevel;
    cxDebits: TcxGrid;
    cxDebitsDBBandedTableView1: TcxGridDBBandedTableView;
    cxDebitsDBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1BUNUSED: TcxGridDBBandedColumn;
    cxDebitsDBBandedTableView1ISLINKED: TcxGridDBBandedColumn;
    cxCredits: TcxGrid;
    cxCreditsDBBandedTableView1: TcxGridDBBandedTableView;
    cxCreditsLevel1: TcxGridLevel;
    cxCreditsDBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1BUNUSED: TcxGridDBBandedColumn;
    cxCreditsDBBandedTableView1ISLINKED: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BRECONCILED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDESCRIPTIONID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SALIAS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBBandedTableView2: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView2DDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2SREFERENCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2FAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2WACCOUNTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2BRECONCILED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2WTRANSACTIONID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2WDESCRIPTIONID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2SALIAS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView2SDESCRIPTION: TcxGridDBBandedColumn;
    zQDetailHistLINKTRN: TIntegerField;
    ZQTransAction: TUniQuery;
    ZQTransActionWTRANSACTIONID: TIntegerField;
    ZQTransActionWBATCHID: TIntegerField;
    ZQTransActionWBATCHTYPEID: TIntegerField;
    ZQTransActionWLINEID: TIntegerField;
    ZQTransActionBCARRIEDFORWARD: TSmallintField;
    ZQTransActionBLASTYEAR: TSmallintField;
    ZQTransActionBLINKSUSED: TSmallintField;
    ZQTransActionBMULTIPLEITEMS: TSmallintField;
    ZQTransActionWACCOUNTID: TIntegerField;
    ZQTransActionDDATE: TDateTimeField;
    ZQTransActionWPERIODID: TIntegerField;
    ZQTransActionSREFERENCE: TStringField;
    ZQTransActionFTAXRATE: TFloatField;
    ZQTransActionWTAXACCOUNTID: TIntegerField;
    ZQTransActionFAMOUNT: TFloatField;
    ZQTransActionFTAXAMOUNT: TFloatField;
    ZQTransActionFOUTSTANDINGAMOUNT: TFloatField;
    ZQTransActionBRECONCILED: TSmallintField;
    ZQTransActionWBALANCINGACCOUNTID: TIntegerField;
    ZQTransActionWDESCRIPTIONID: TIntegerField;
    ZQTransActionWCURRENCYID: TIntegerField;
    ZQTransActionFFOREXAMOUNT: TFloatField;
    ZQTransActionWUSERID: TIntegerField;
    ZQTransActionUNUSED: TIntegerField;
    ZQTransActionDSYSDATE: TDateTimeField;
    ZQTransActionBUNUSED: TSmallintField;
    ZQTransActionWTAX2ID: TIntegerField;
    ZQTransActionFCURRENCYRATE2: TFloatField;
    ZQTransActionFTAXRATE2: TFloatField;
    ZQTransActionFTAX2AMOUNT: TFloatField;
    ZQTransActionWJOBCODEID: TIntegerField;
    ZQTransActionWPROFILEID: TIntegerField;
    ZQTransActionBEXCLUSIVE: TSmallintField;
    ZQTransActionWREPORTINGGROUP1ID: TIntegerField;
    ZQTransActionWREPORTINGGROUP2ID: TIntegerField;
    ZQTransActionWLINKEDID: TIntegerField;
    ZQTransActionWYEARID: TIntegerField;
    ZQTransActionWDOCID: TIntegerField;
    ZUSQLTransAction: TUniUpdateSQL;
    qGen: TUniQuery;
    ZUSQLOIlinks: TUniUpdateSQL;
    ZQOILinks: TUniQuery;
    ZQOILinksWOILINKSID: TIntegerField;
    ZQOILinksDDOCDATE: TDateTimeField;
    ZQOILinksSREFERENCE: TStringField;
    ZQOILinksSLINKEDREFERENCE: TStringField;
    ZQOILinksWFULLAMOUNT: TFloatField;
    ZQOILinksWOUTSTANDINGAMOUNT: TFloatField;
    ZQOILinksWLINKEDAMOUNT: TFloatField;
    ZQOILinksDDATE: TDateTimeField;
    ZQOILinksUNUSED1: TIntegerField;
    ZQOILinksWAMOUNTTRANSACTIONID: TIntegerField;
    ZQOILinksWLINKTRANSACTIONID: TIntegerField;
    ZQOILinksWUSERID: TIntegerField;
    ZQOILinksUNUSED2: TIntegerField;
    ZQOILinksWBATCHID: TIntegerField;
    ZQOILinksWACCOUNTID: TIntegerField;
    ZQOILinksWTAXID: TIntegerField;
    ZQOILinksDSYSDATE: TDateTimeField;
    ZQOILinksSDESCRIPTION: TStringField;
    tblBankDnl: TUniQuery;
    tblBankDnlSTRANSID: TStringField;
    tblBankDnlWLINETYPEID: TIntegerField;
    tblBankDnlWSOURCEID: TIntegerField;
    tblBankDnlWBANKID: TIntegerField;
    tblBankDnlWTRANSTYPEID: TIntegerField;
    tblBankDnlSACCOUNTCODE: TStringField;
    tblBankDnlDTRANSDATE: TDateTimeField;
    tblBankDnlDPOSTEDDATE: TDateTimeField;
    tblBankDnlFAMOUNT: TFloatField;
    tblBankDnlSMEMO: TStringField;
    tblBankDnlSREFERENCE: TStringField;
    tblBankDnlBRECONCILED: TSmallintField;
    tblBankDnlSDESCRIPTION: TStringField;
    tblBankDnlWCURRENCYID: TIntegerField;
    tblBankDnlWACCOUNTID: TIntegerField;
    tblBankDnlWLINEID: TIntegerField;
    tblBankDnlWTCTRANSID: TIntegerField;
    tblBankDnlWPROFILEID: TIntegerField;
    tblBankDnlWAUTOMATCHID: TIntegerField;
    tblBankDnlBUSEFORBATCH: TIntegerField;
    tblBankDnlDSYSDATE: TDateTimeField;
    tblBankDnlWAMTSGN: TIntegerField;
    tblBankDnlSEXTRADESCRIPTION: TStringField;
    PopupMenu5: TPopupMenu;
    Button1: TButton;
    Month1: TMenuItem;
    Fromtoday1: TMenuItem;
    Bydate1: TMenuItem;
    Byyear1: TMenuItem;
    LimitRowst: TcxSpinEdit;
    lLimitRowst: TcxLabel;
    lLimitRows: TcxLabel;
    LimitRows: TcxSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwdbgDebitsKeyPress(Sender: TObject; var Key: Char);
    procedure wwdbgCreditsKeyPress(Sender: TObject; var Key: Char);
    procedure btnBBFClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnUnlinkClick(Sender: TObject);
    procedure wwdbgDebitsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnApplyClick(Sender: TObject);
    procedure edtDateKeyPress(Sender: TObject; var Key: Char);
    procedure rgAccountTypeClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure PanelUnlinkExit(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure MyCaptionBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbAllLinksClick(Sender: TObject);
    procedure cbBBFDateClick(Sender: TObject);
    procedure RPymtClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure tbnStatmtClick(Sender: TObject);
    procedure UpdateAccountInfo ;
    procedure edtAccountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAccountKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SetButtons ;
    procedure BFilterClick(Sender: TObject);
    procedure DBGSearchDblClick(Sender: TObject);
    procedure DBGSearchTitleClick(Column: TColumn);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbShowColorsClick(Sender: TObject);
    procedure ZQAccountListBeforeOpen(DataSet: TDataSet);
    procedure BFilterTransClick(Sender: TObject);
    procedure ZQTranslistBeforeOpen(DataSet: TDataSet);
    procedure DBGSearchTransTitleClick(Column: TColumn);
    procedure DBGSearchTransDblClick(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure ZQAccountListCalcFields(DataSet: TDataSet);
    procedure ZQAccountListFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure UnlinkTransaction1Click(Sender: TObject);
    function CreditGridHasFocus : Boolean ;
    procedure wwdbgDebitsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwdbgCreditsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BClearClick(Sender: TObject);
    procedure gdStmtMainTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure BClearTransClick(Sender: TObject);
    procedure BExportTotalClick(Sender: TObject);
    procedure BExporttransClick(Sender: TObject);
    procedure cbFindInvalideDetailClick(Sender: TObject);
    procedure SearchPanelDblClick(Sender: TObject);
    procedure wwqryOpenDebitsCalcFields(DataSet: TDataSet);
    procedure wwqryOpenCreditsCalcFields(DataSet: TDataSet);
    procedure wwqryOpenCreditsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure wwqryOpenDebitsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cbFilterClick(Sender: TObject);
    procedure Checkselected1Click(Sender: TObject);
    procedure Uncheckselected1Click(Sender: TObject);
    procedure edtAmtRefChange(Sender: TObject);
    procedure btnRemoveFaultsClick(Sender: TObject);
    procedure TUpdateTimer(Sender: TObject);
    procedure wwqryOpenCreditsAfterScroll(DataSet: TDataSet);
    procedure wwqryOpenDebitsAfterScroll(DataSet: TDataSet);
    procedure wwqryOpenCreditsBeforeOpen(DataSet: TDataSet);
    procedure wwqryOpenDebitsBeforeOpen(DataSet: TDataSet);
    procedure Adjustpaymentdate1Click(Sender: TObject);
    procedure EFilterValueTransKeyPress(Sender: TObject; var Key: Char);
    procedure EFilterValueKeyPress(Sender: TObject; var Key: Char);
    procedure Recievepayment1Click(Sender: TObject);
    procedure Undolastlink1Click(Sender: TObject);
    procedure Autoreversetillvalide1Click(Sender: TObject);
    procedure Automatchexactamounts1Click(Sender: TObject);
    procedure Unlinktilvalide1Click(Sender: TObject);
    procedure Finddebin3amts1Click(Sender: TObject);
    procedure Findcrin2amts1Click(Sender: TObject);
    procedure Finddebin2crforalldeb1Click(Sender: TObject);
    procedure Debitpercentmatch1Click(Sender: TObject);
    procedure Autolink1debXcreds1Click(Sender: TObject);
    procedure Automatch1debittoXcreditslow1Click(Sender: TObject);
    procedure Autoreversetillvalideslow1Click(Sender: TObject);
    procedure pcLijstChange(Sender: TObject);
    procedure DBGridunpostedTitleClick(Column: TColumn);
    procedure Delete1Click(Sender: TObject);
    procedure BtnExportDetailsClick(Sender: TObject);
    procedure cbFindInvalideClick(Sender: TObject);
    procedure edtAmtRefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Autopaymentdebitsforpercentageofgross1Click(Sender: TObject);
    procedure cxTotalsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxTransDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxDebitsDBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCreditsDBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxDebitsDBBandedTableView1DragDrop(Sender, Source: TObject;
      X, Y: Integer);
    procedure cxDebitsDBBandedTableView1DragOver(Sender, Source: TObject;
      X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure cxDebitsDBBandedTableView1BUNUSEDPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxCreditsDBBandedTableView1BUNUSEDPropertiesEditValueChanged(
      Sender: TObject);
    procedure edtSincePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Month1Click(Sender: TObject);
    procedure Fromtoday1Click(Sender: TObject);
    procedure Bydate1Click(Sender: TObject);
    procedure Byyear1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ZQOILinksAfterInsert(DataSet: TDataSet);
  private
    BdoBBF,
    CrQuery:Boolean;
    dtOutAmt,CtOutAmt:real;
    dtAmt,CtAmt,dtSelAmt,ctSelAmt:real;
    LikeSeach : Boolean ;

    procedure SetDebCreditSelected ;
    procedure UnselectDebCredit;
    procedure ChangeQueries(Sender: TObject);
    Procedure LinkAcc(Sender: TObject;Amount:real;xShow:boolean);
    Procedure SetLinkAmount;

 

    Procedure ChangeDTuniQuery;
    Procedure ChangeCTuniQuery;
    Procedure SetSortBy(aField:String;Dt:Boolean);
    Procedure CalSmtAge;
    procedure BFOnAllAccounts;
    procedure CalcSel;
    procedure MatchDebOnPercent(APercent: Double);
    procedure FinddebinXamts(Sender: TObject);


    { Private declarations }
  public
    aAccInfo:TAccountRec;
    ShiftDown : Boolean ;
    statementDown,unlinkdown,unlinkDeb  :Boolean ;
    AutoMaticPost : Boolean ;
    SortIndexTotal : Integer ;
    SortDirectionTotal : Boolean ;
    SortIndexTrans : Integer ;
    SortDirectionTrans : Boolean ;
    aslookup : boolean ;
    bInAutoProcess : Boolean ;
    bFromBatch : Boolean ;
    GotoAccount : Integer ;
    LinkOfTrn : Integer ;
    LinkOffAmount : Double ;
    Saveprefix : String ;
    procedure CalledAsLookup ;
    { Public declarations }
  end;

TMyDayaSet = class (TDataSet)
public
  procedure MyUpdateCalcFields ;
end;


  Colour = array[0..1] of Integer;

var
  fmOpenLink  : TfmOpenLink;
  LinkAmount  : Real;
  LinkMode    : Boolean;
  _AccountID  : Integer;
implementation

uses shellapi,  GlobalFunctions, EnterLinkAmount, HTMLHelpAPI,
  LanguageChoice, TransfertTrans, XRoutines, LedgerRoutines,
  UDMTCCoreLink, OSFGeneralRoutines,  UFromToDates,
  UReportManager, NewProgress, UDmQuantumGridDefs, cxGridDBDataDefinitions;

{$R *.DFM}

procedure TMyDayaSet.MyUpdateCalcFields;
  begin
    if State <> dsSetKey then
    begin
      if InternalCalcFields  then
        RefreshInternalCalcFields(ActiveBuffer)
      else if (CalcFieldsSize <> 0) and AutoCalcFields then
        CalculateFields(ActiveBuffer);

  end;
end;
Procedure SetIdxField(Value:String);
begin
  if fmOpenLink.CrQuery then
    FieldBy2:=Value
  else
    FieldBy1:=Value;
end;

Procedure TfmOpenLink.SetSortBy(aField:String;Dt:Boolean);
Var
  Hold:Boolean;
  OldId : Integer ;
begin
  if dt then
  begin
    if BDesc1 then
      StrOrderBy1 :=' ORDER BY '+aField+' Desc;'
    else
      StrOrderBy1 :=' ORDER BY '+aField+';';

     if wwqryOpenDebits.Active then
     oldid :=  wwqryOpenDebitsWTRANSACTIONID.AsInteger else oldid := 0 ;

    Hold:=wwqryOpenDebits.Active;
    ChangeDTuniQuery;

    wwqryOpenDebits.Active:=Hold;
    if wwqryOpenDebits.Active then
       wwqryOpenDebits.Locate('WTRANSACTIONID',OldId,[]);
    Application.ProcessMessages;
    BDesc1:=Not BDesc1;
  end
  else
  begin
    if BDesc2 then
      StrOrderBy2 :=' ORDER BY '+aField+' Desc;'
    else
      StrOrderBy2 :=' ORDER BY '+aField+';';
    Hold:=wwqryOpenCredits.Active;
     if wwqryOpenCredits.Active then
     oldid :=  wwqryOpenCreditsWTRANSACTIONID.AsInteger else oldid := 0 ;
    ChangeCTuniQuery;

    wwqryOpenCredits.Active:=Hold;
        if wwqryOpenCredits.Active then
       wwqryOpenDebits.Locate('WTRANSACTIONID',OldId,[]);
    Application.ProcessMessages;
    BDesc2:=Not BDesc2;
  end;
 Screen.Cursor := crDefault ;
end;


Procedure TfmOpenLink.LinkAcc(Sender: TObject;Amount:real;xShow:boolean);

var
  FrDate :TDate;
  AcctID,

  TaxID   : Integer;
  FromRef,
  ToRef    : String;
  BalLinkAmt,
  FromFullAmt ,
  ToOutAmt,
  ToFullAmt  : Real;
  CtrCpte     : Integer;
  procedure SaveDoLink(Aside: Integer;AAmount : Double);
  begin
     if Aside=0 then
      begin
         if ZQTransActionFAmount.AsFloat > 0 then
            ZQTransActionFOutstandingAmount.Value := ZQTransActionFOutstandingAmount.Value - abs(AAmount)
            else
            ZQTransActionFOutstandingAmount.Value := ZQTransActionFOutstandingAmount.Value + abs(AAmount)

      end else
      begin
          if ZQTransActionFAmount.AsFloat > 0 then
            ZQTransActionFOutstandingAmount.Value := ZQTransActionFOutstandingAmount.Value - abs(AAmount)
            else
            ZQTransActionFOutstandingAmount.Value := ZQTransActionFOutstandingAmount.Value + abs(AAmount)
      end;
  end;
begin
  CtrCpte := 0;
  AcctID := 0 ;
  if (cxDebitsDBBandedTableView1.Controller.SelectedRecordCount>1) then
  begin
   AcctID:=cxDebitsDBBandedTableView1.Controller.SelectedRecordCount;
   cxDebitsDBBandedTableView1.Controller.SelectedRecords[0].Focused :=True ;
  end;
  if (cxCreditsDBBandedTableView1.Controller.SelectedRecordCount>1) then
  begin
   CtrCpte:=cxCreditsDBBandedTableView1.Controller.SelectedRecordCount;
   cxCreditsDBBandedTableView1.Controller.SelectedRecords[0].Focused :=True ;
  end;
  if AcctID>CtrCpte then CtrCpte:=AcctID;
  if xShow then
      SetLinkAmount
   else
     LinkAmount:= Amount;
  if LinkAmount=0 then
    exit;
  BalLinkAmt:=0;
  repeat
    BalLinkAmt:=  BalLinkAmt + LinkAmount;
    FromID := wwqryOpenCreditsWTransactionID.Value;
    ToID   := wwqryOpenDebitsWTransactionID.Value;
    ZQTransAction.SQL.Text :=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_TransactOnTransactID') ;
    ZQTransAction.ParamByName('WTransactionID').AsInteger := ToID ;
    ZQTransAction.Open;
    ZQTransAction.Edit;
     if LinkMode Then
      SaveDoLink(0,LinkAmount)
    else
      SaveDoLink(1,LinkAmount);

    ZQTransActionBUnused.value:=0;
    ZQTransAction.Post;
    FrDate := ZQTransActionDDate.Value;
    ToOutAmt:=ZQTransActionFOutstandingAmount.Value;
    ToRef:=ZQTransActionSreference.Value;
    ZQTransAction.close ;
    ZQTransAction.ParamByName('WTransactionID').AsInteger := FromID ;
    ZQTransAction.Open;
    ZQTransAction.Edit;
     if LinkMode Then
      SaveDoLink(0,LinkAmount)
    else
      SaveDoLink(1,LinkAmount);
    {Clear Selection}
    ZQTransActionBUnused.value:=0;
    ZQTransAction.Post;
    FromRef:=ZQTransActionSreference.Value;
    AcctID:=ZQTransActionWAccountID.Value;
    TaxID:=ZQTransActionWTaxAccountID.Value;
    // Allocate Open Item
    ZQOILinks.DisableControls;
    try
    ZQOILinks.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_OILinksOnAccLinkedandBatchTrans');
    ZQOILinks.ParamByName('WAccountID').AsInteger := AcctID ;
    ZQOILinks.ParamByName('WAmountTransactionID').AsInteger :=  FromID ;
    ZQOILinks.ParamByName('WLinkTransactionID').AsInteger :=   ToID ;
    ZQOILinks.Open;
    if LinkMode then
    begin
      while not ZQOILinks.IsEmpty do
        ZQOILinks.Delete ;

       ZQOILinks.Append;
      ZQOILinksDDate.Value := ZQTransActionDDate.Value;
      ZQOILinksDDocDate.Value := FrDate;
      ZQOILinksWOutStandingAmount.Value := ToOutAmt;
      ZQOILinksWlinkedAmount.Value :=   LinkAmount;
      ZQOILinksWFULLAMOUNT.Value :=  ZQTransActionFAMOUNT.AsFloat ;

      ZQOILinksWLinkTransactionID.Value := ToID;
      ZQOILinksWAmountTransactionID.Value := FromID;
      ZQOILinksSReference.Value := FromRef;
      ZQOILinksSlinkedReference.Value := ToRef;
      ZQOILinksWAccountID.Value := AcctID;
      ZQOILinksWTaxID.value := TaxID;
      ZQOILinksWBATCHID.value := -1;
      ZQOILinks.Post;
    end
    else
      if not ZQOILinks.IsEmpty then
        ZQOILinks.Delete;
    ZQOILinks.Close;
    finally
    ZQOILinks.EnableControls;
    end;

    Dec(CtrCpte);
    if CtrCpte>=1 then
    begin
      if(cxCreditsDBBandedTableView1.Controller.SelectedRecordCount=1) then
      begin
        if LinkMode Then
          ToFullAmt := Abs(FixAmount(wwqryOpenCredits.FieldByName('FAmount').AsFloat + BalLinkAmt))
        else
          ToFullAmt := Abs(FixAmount(wwqryOpenCredits.FieldByName('FAmount').AsFloat - BalLinkAmt,2));

         cxDebitsDBBandedTableView1.Controller.SelectedRecords[cxDebitsDBBandedTableView1.Controller.SelectedRecordCount-CtrCpte].Focused := True ;
        FromFullAmt := Abs(FixAmount(wwqryOpenDebits.FieldByName('FAmount').AsFloat,2));
      end
      else
      begin
         if LinkMode Then
           ToFullAmt := Abs(FixAmount(wwqryOpenDebits.FieldByName('FAmount').AsFloat - BalLinkAmt,2))
         else
           ToFullAmt := Abs(FixAmount(wwqryOpenDebits.FieldByName('FAmount').AsFloat + BalLinkAmt,2));
          cxCreditsDBBandedTableView1.Controller.SelectedRecords[cxCreditsDBBandedTableView1.Controller.SelectedRecordCount-CtrCpte].Focused := True ;

         FromFullAmt :=Abs(FixAmount(wwqryOpenCredits.FieldByName('FAmount').AsFloat,2));
      end;
      LinkAmount :=  Abs(Min(ToFullAmt,FromFullAmt));
    end;
  until (CtrCpte<1) Or ((cxCreditsDBBandedTableView1.Controller.SelectedRecordCount<=1) And(cxDebitsDBBandedTableView1.Controller.SelectedRecordCount<=1)) ;
  wwqryOpenDebits.Close;
  wwqryOpenCredits.Close;
  ZQTransAction.Close;
 
  wwqryOpenDebits.Open;
  wwqryOpenCredits.Open;

end;

procedure TfmOpenLink.ChangeQueries(Sender: TObject);
begin
  ChangeDTuniQuery;
  ChangeCTuniQuery;

end;

procedure TfmOpenLink.ChangeDTuniQuery;
begin
  With wwqryOpenDebits do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingAmount, ');
    SQL.Add(' Messages.SDescription , BUnused');
    SQL.Add(' FROM Transact left join Messages on (Transact.WDescriptionID=Messages.WMessageID)'+
    ' WHERE (WAccountID = :Account)');
    if LinkMode Then
      SQL.Add(' AND (FOutstandingAmount  > 0) ')
    else
      SQL.Add(' AND (FAmount  > 0) AND (FOutstandingAmount  <> FAmount)');
    SQL.Add(StrOrderBy1);
    ParamByName('Account'). Value := aAccInfo.WAccountID;
  end;
end;

procedure TfmOpenLink.ChangeCTuniQuery;
begin

  With wwqryOpenCredits do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingAmount, ');
    SQL.Add(' Messages.SDescription, BUnused');
    SQL.Add(' FROM Transact left join Messages on (Transact.WDescriptionID=Messages.WMessageID)'+
    '  WHERE (WAccountID = :Account)');
    if LinkMode Then
      SQL.Add(' AND (FOutstandingAmount< 0.00)  ')
    else
      SQL.Add(' AND (FAmount  < 0) AND (FOutstandingAmount  <> FAmount) ');
    SQL.Add(StrOrderBy2);
    ParamByName('Account'). Value := aAccInfo.WAccountID;
  end;
end;


procedure TfmOpenLink.FormShow(Sender: TObject);
begin
    cxDebitsDBBandedTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(607);
    cxDebitsDBBandedTableView1DDATE.Caption:=DMTCCoreLink.GetTextLang(238);
    cxDebitsDBBandedTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(178);
    cxDebitsDBBandedTableView1FAMOUNT.Caption:=DMTCCoreLink.GetTextLang(946);
    cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT.Caption:=DMTCCoreLink.GetTextLang(947);
    cxDebitsDBBandedTableView1BUNUSED.Caption:=DMTCCoreLink.GetTextLang(1881);
    cxCreditsDBBandedTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(607);
    cxCreditsDBBandedTableView1DDATE.Caption:=DMTCCoreLink.GetTextLang(238);
    cxCreditsDBBandedTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(178);
    cxCreditsDBBandedTableView1FAMOUNT.Caption:=DMTCCoreLink.GetTextLang(946);
    cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT.Caption:=DMTCCoreLink.GetTextLang(947);
    cxCreditsDBBandedTableView1BUNUSED.Caption:=DMTCCoreLink.GetTextLang(1881);
tsDetail.TabVisible := false ;
tsList.TabVisible := false ;
pcMain.ActivePage := tsList ;
cbOpenOnly.Caption := DMTCCoreLink.GetTextLang(3353);
btnRemoveFaults.Caption := DMTCCoreLink.GetTextLang(3354);
BExportTotal.Caption := DMTCCoreLink.GetTextLang(20063);
BExporttrans.Caption := DMTCCoreLink.GetTextLang(20063);
BtnExportDetails.Caption := DMTCCoreLink.GetTextLang(20063);
 DMTCCoreLink.LoadImage(BitBtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtnClose.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(btnApply.Glyph,'Ok');
   Adjustpaymentdate1.Caption := DMTCCoreLink.GetTextLang(3344);
    cbShowColors.Caption := DMTCCoreLink.GetTextLang(3342);
    cbFindInvalide.Caption := DMTCCoreLink.GetTextLang(3343);
     pcMain.top := 19 ;
     pcMain.Left := 0 ;
     pcMain.Width := self.ClientWidth;
     pcMain.Height := self.ClientHeight - 19;
     ToolButton4.Caption :=  DMTCCoreLink.GetTextLang(828);
     BitBtn1.Caption :=  DMTCCoreLink.GetTextLang(828);
     tsTotals.Caption :=  DMTCCoreLink.GetTextLang(1360);
     tsTransactions.Caption :=  DMTCCoreLink.GetTextLang(20069);
     Undolastlink1.Caption :=  DMTCCoreLink.GetTextLang(2958) + ' ' +     DMTCCoreLink.GetTextLang(901011);
     CBFindColumn.Items[1] := DMTCCoreLink.GetTextLang(1876);
     CBFindColumn.Items[2] := DMTCCoreLink.GetTextLang(178);
     CBFindColumn.Items[3] := DMTCCoreLink.GetTextLang(1935);
     CBFindColumn.Items[4] := DMTCCoreLink.GetTextLang(1702);
     CBFindColumn.Items[5] := DMTCCoreLink.GetTextLang(936);
     cxTotalsDBTableView1SACCOUNTCODE.Caption := DMTCCoreLink.GetTextLang(1876);
     cxTotalsDBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(178);
     cxTotalsDBTableView1WACCOUNTTYPEID.Caption := DMTCCoreLink.GetTextLang(1935);
     cxTotalsDBTableView1TOTALTRANS.Caption := DMTCCoreLink.GetTextLang(1702);
     cxTotalsDBTableView1TOTALOPEN.Caption := DMTCCoreLink.GetTextLang(936);
     LField.Caption :=         DMTCCoreLink.GetTextLang(944);
     LFieldTrans.Caption :=         DMTCCoreLink.GetTextLang(944);
     CBOperatot.Items[0] :=    DMTCCoreLink.GetTextLang(20025);
     CBOperatotTrans.Items[0] :=    DMTCCoreLink.GetTextLang(20025);
     LFilterValue.Caption :=   DMTCCoreLink.GetTextLang(2871);
     LFilterValueTrans.Caption :=   DMTCCoreLink.GetTextLang(2871);
     BFilterTrans.Caption :=        DMTCCoreLink.GetTextLang(20097);
     BFilter.Caption :=        DMTCCoreLink.GetTextLang(20097);
     BClearTrans.Caption :=         DMTCCoreLink.GetTextLang(1016);
     BClear.Caption :=         DMTCCoreLink.GetTextLang(1016);
     cbAccountTypeTrans.Items[0] := DMTCCoreLink.GetTextLang(1372);
     cbAccountTypeTrans.Items[1] := DMTCCoreLink.GetTextLang(31);
     cbAccountTypeTrans.Items[2] := DMTCCoreLink.GetTextLang(30);
     cbAccountType.Items[0] := DMTCCoreLink.GetTextLang(1372);
     cbAccountType.Items[1] := DMTCCoreLink.GetTextLang(31);
     cbAccountType.Items[2] := DMTCCoreLink.GetTextLang(30);
     CBFindColumnTrans.Items[1] := DMTCCoreLink.GetTextLang(1876);
     CBFindColumnTrans.Items[2] := DMTCCoreLink.GetTextLang(178);
     CBFindColumnTrans.Items[3] := DMTCCoreLink.GetTextLang(1719);
     CBFindColumnTrans.Items[4] := DMTCCoreLink.GetTextLang(366);
     CBFindColumnTrans.Items[5] := DMTCCoreLink.GetTextLang(1702);
     CBFindColumnTrans.Items[6] := DMTCCoreLink.GetTextLang(1885);
     CBFindColumnTrans.Items[7] := DMTCCoreLink.GetTextLang(2222);
     CBFindColumnTrans.Items[8] := DMTCCoreLink.GetTextLang(238);
     CBFindColumnTrans.Items[9] := DMTCCoreLink.GetTextLang(1935);
     cxTransDBTableViewSACCOUNTCODE.Caption := DMTCCoreLink.GetTextLang(1876);
     cxTransDBTableViewSACCOUNTDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(178);
     cxTransDBTableViewSREFERENCE.Caption := DMTCCoreLink.GetTextLang(1719);
     cxTransDBTableViewSDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(366);
     cxTransDBTableViewTOTALTRANS.Caption := DMTCCoreLink.GetTextLang(1702);
     cxTransDBTableViewTOTALOPEN.Caption := DMTCCoreLink.GetTextLang(1885);
     cxTransDBTableViewDPAYMENTDATE.Caption := DMTCCoreLink.GetTextLang(2222);
     cxTransDBTableViewDDATE.Caption := DMTCCoreLink.GetTextLang(238);
     cxTransDBTableViewWACCOUNTTYPEID.Caption := DMTCCoreLink.GetTextLang(1935);
     tsTempLinkedoff.Caption := DMTCCoreLink.GetTextLang(532);
     Delete1.Caption := DMTCCoreLink.GetTextLang(3149);
     cxUnpostedDBBandedTableView1SACCOUNTCODE.Caption := DMTCCoreLink.GetTextLang(1876);
     cxUnpostedDBBandedTableView1SDESCRIPTION_1.Caption  := DMTCCoreLink.GetTextLang(178);
     cxUnpostedDBBandedTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(1719);
     cxUnpostedDBBandedTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(366);
     cxUnpostedDBBandedTableView1FAMOUNT.Caption := DMTCCoreLink.GetTextLang(1702);
     cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT.Caption := DMTCCoreLink.GetTextLang(1885);
     cxUnpostedDBBandedTableView1DPAYMENTDATE.Caption := DMTCCoreLink.GetTextLang(2222);
     cxUnpostedDBBandedTableView1DDATE.Caption := DMTCCoreLink.GetTextLang(238);
     cxUnpostedDBBandedTableView1WACCOUNTTYPEID.Caption := DMTCCoreLink.GetTextLang(1935);
     cxUnpostedDBBandedTableView1FAMOUNT_1.Caption := DMTCCoreLink.GetTextLang(627);
     cxUnpostedDBBandedTableView1SALIAS.Caption := DMTCCoreLink.GetTextLang(1867);
     lblLedger.Caption := FloatToStr(0);
     lblAccountDesc.Caption := '' ;
     Caption := DMTCCoreLink.GetTextLang(360);//Header 360
     Label1.Caption := DMTCCoreLink.GetTextLang(34);//Account 34
     Panel1.Caption := DMTCCoreLink.GetTextLang(211);//Debits 211
     Panel2.Caption := DMTCCoreLink.GetTextLang(212);//Credits 212
     BtnClear.Caption :=DMTCCoreLink.GetTextLang(932);//Clear Links 932
     BtnBBF.Caption :=DMTCCoreLink.GetTextLang(933);//Gen BBF 933
     Btnunlink.Caption :=DMTCCoreLink.GetTextLang(934);//Unlink 934
     cbAccountType.Items[1] := DMTCCoreLink.GetTextLang(160);//Debtors 160
     cbAccountType.Items[2] := DMTCCoreLink.GetTextLang(161);//Creditors161
     lblMs1.Caption :=DMTCCoreLink.GetTextLang(935);//Messages
     lblMs2.Caption :=DMTCCoreLink.GetTextLang(936);//Messages
     lblMs3.Caption :=DMTCCoreLink.GetTextLang(937);//Messages
     lblMs4.Caption :=DMTCCoreLink.GetTextLang(938);//Messages
  lblMs5.Caption :=DMTCCoreLink.GetTextLang(939);//Messages
  MyCaptionBar.Caption :=DMTCCoreLink.GetTextLang(940);//Clear links options 940
  cbAllLinks.Caption :=DMTCCoreLink.GetTextLang(941);// Clear All Links 941
  lblFrDt.Caption :=DMTCCoreLink.GetTextLang(286);// From Date
  Label4.Caption :=DMTCCoreLink.GetTextLang(287);// To Date
  cbBBFDate.Caption :=DMTCCoreLink.GetTextLang(942);// Use Start Date 942
  cbDCredit.Caption :=DMTCCoreLink.GetTextLang(943);//By Credit Dates 943
  BitBtnClose.Caption :=DMTCCoreLink.GetTextLang(169);// Close  935
  BitBtnOk.Caption :=DMTCCoreLink.GetTextLang(167);// Ok
  // Label2.Caption :=DMTCCoreLink.GetTextLang(944);// Serach
  // lblSearch.Caption :=DMTCCoreLink.GetTextLang(607);// Reference
  btnApply.Caption :=DMTCCoreLink.GetTextLang(1760);// is search
  pcLijst.ActivePageIndex := 0 ;
  edtCurDate.Date := Date;
  edtSince.Date:= IncMonth(date,-1);
  PnlStatement.SendToBack;
  ToolButton3.Caption := DMTCCoreLink.GetTextLang(1882);
  tbnStatmt.Caption := DMTCCoreLink.GetTextLang(1883);
  PnlPlain.Align := alclient ;
  Label3.Caption :=  DMTCCoreLink.GetTextLang(1884);
  Label6.Caption := DMTCCoreLink.GetTextLang(1858);
  Label8.Caption := DMTCCoreLink.GetTextLang(1857);
  Label10.Caption := DMTCCoreLink.GetTextLang(1856);
  Label9.Caption := DMTCCoreLink.GetTextLang(1885);
  CBUseRef.Caption := DMTCCoreLink.GetTextLang(2171);
  cbDDebit.Caption := DMTCCoreLink.GetTextLang(2174);
  Label7.Caption := DMTCCoreLink.GetTextLang(2175);
  Label5.Caption := DMTCCoreLink.GetTextLang(2176);
  PnlStatement.Align := alclient ;
  UnlinkTransaction1.Caption := DMTCCoreLink.GetTextLang(2958);//Unlink Transaction
  RPymt.Caption := DMTCCoreLink.GetTextLang(2959);//Receive Payment
  Recievepayment1.Caption := DMTCCoreLink.GetTextLang(2959);//Receive Payment
  Reprinttransactions1.Caption := DMTCCoreLink.GetTextLang(2960);//Reprint transactions
  // refresh Querys
  LinkMode:=true;
  unlinkdown := true ;
  BtnUnlinkClick(self);
  CBFindColumn.ItemIndex := DMTCCoreLink.ReadSysParam('OPENITEM_TOTFIND',0,CurrentUser);
  CBOperatot.ItemIndex := DMTCCoreLink.ReadSysParam('OPENITEM_TOTOPER',0,CurrentUser);
  EFilterValue.Text := DMTCCoreLink.ReadSysParam('OPENITEM_TOTFILT','',CurrentUser);

  CBFindColumnTrans.ItemIndex := DMTCCoreLink.ReadSysParam('OPENITEM_TRNFIND',0,CurrentUser);
  CBOperatotTrans.ItemIndex := DMTCCoreLink.ReadSysParam('OPENITEM_TRNOPER',0,CurrentUser);
  EFilterValueTrans.Text := DMTCCoreLink.ReadSysParam('OPENITEM_TRNFILT','',CurrentUser);
  cbAccountTypeTrans.Checked[0] := DMTCCoreLink.ReadSysParam('OPENITEM_TRNACC0',false,CurrentUser);
  cbAccountTypeTrans.Checked[1] := DMTCCoreLink.ReadSysParam('OPENITEM_TRNACC1',True,CurrentUser);
  cbAccountTypeTrans.Checked[2] := DMTCCoreLink.ReadSysParam('OPENITEM_TRNACC2',false,CurrentUser);

  cbAccountType.Checked[0] := DMTCCoreLink.ReadSysParam('OPENITEM_TOTACC0',false,CurrentUser);
  cbAccountType.Checked[1] := DMTCCoreLink.ReadSysParam('OPENITEM_TOTACC1',True,CurrentUser);
  cbAccountType.Checked[2] := DMTCCoreLink.ReadSysParam('OPENITEM_TOTACC2',false,CurrentUser);

  SortIndexTrans := 8 ;
  SortDirectionTrans := true ;

  cbShowColors.Checked := DMTCCoreLink.ReadSysParam('OPENITEM_TOTSHCOL',True,CurrentUser);
  if aslookup then
  begin
    pcMain.ActivePageIndex := 0 ;
    FormResize(self);
  end
  else
  begin
  pcLijst.ActivePageIndex := 0 ;
  // BFilterTransClick(self);
  end;

if bFromBatch then
   begin
      tsTransactions.TabVisible := False ;
      if GotoAccount <> 0 then
        begin
        tsList.TabVisible := False ;
        ZQAccountList.SQL.Text := 'Select b.SAccountCode ,b.SDescription,b.WAccountTypeId, sum(a.FAmount) TotalTrans,Sum(a.FOutstandingAmount) TotalOpen,b.WAccountId from Account b join Transact a on b.waccountid = a.Waccountid where  a.Waccountid = ' + IntToStr(GotoAccount)  +
                  ' group by b.SAccountCode ,b.SDescription,b.WAccountTypeId,b.WAccountId ' ;
        ZQAccountList.open ;
        DBGSearchDblClick(nil);
        if LinkOffAmount <> 0 then
         if AutoMaticPost then
             RPymtClick(nil)   else
             RPymtClick(self) ;

        end;


   end;

end;

procedure TfmOpenLink.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wwqryOpenDebits.Close;
  wwqryOpenCredits.Close;
   
  DMTCCoreLink.WriteSysParam('OPENITEM_TOTFIND',CBFindColumn.ItemIndex,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TOTOPER',CBOperatot.ItemIndex,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TOTFILT',EFilterValue.Text ,CurrentUser);

  DMTCCoreLink.WriteSysParam('OPENITEM_TRNFIND',CBFindColumnTrans.ItemIndex,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TRNOPER',CBOperatotTrans.ItemIndex,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TRNFILT',EFilterValueTrans.Text ,CurrentUser);

  DMTCCoreLink.WriteSysParam('OPENITEM_TRNACC0',BoolToStr(cbAccountTypeTrans.Checked[0],true) ,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TRNACC1',BoolToStr(cbAccountTypeTrans.Checked[1],true) ,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TRNACC2',BoolToStr(cbAccountTypeTrans.Checked[2],true) ,CurrentUser);

  DMTCCoreLink.WriteSysParam('OPENITEM_TOTACC0',BoolToStr(cbAccountType.Checked[0],true) ,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TOTACC1',BoolToStr(cbAccountType.Checked[1],true) ,CurrentUser);
  DMTCCoreLink.WriteSysParam('OPENITEM_TOTACC2',BoolToStr(cbAccountType.Checked[2],true) ,CurrentUser);

  DMTCCoreLink.WriteSysParam('OPENITEM_TOTSHCOL',BoolToStr(cbShowColors.Checked,true) ,CurrentUser);
end;

procedure TfmOpenLink.wwdbgDebitsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    LinkAcc(Sender,0,True);
    Key := #0;
  end;  
end;

procedure TfmOpenLink.wwdbgCreditsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    LinkAcc(Sender,0,True);
    Key := #0;
  end;
end;

procedure TfmOpenLink.btnBBFClick(Sender: TObject);
begin
  if (PanelUnlink.Visible) Or (trim(edtAccount.Text)='')   then
    exit;
  cbGenBFOnAllAccount.Visible := True ;
  BdoBBF := True;
  MyCaptionBar.Caption :=DMTCCoreLink.GetTextLang(2172);
//  cbDDebit.Visible:=False;
//  cbDCredit.Visible:=False;
  if OSFMessageDlg(DMTCCoreLink.GetTextLang(722){'Warning, if you click yes you will lose all your current links for this account.'}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    cbJustExactAmounts.Visible := True ;
    cbAllLinks.Checked:=False;
    CBUseRef.Visible := true ;
    PanelUnlink.Visible:=True;
    PanelUnlink.BringToFront;
    edtDateFrom.Date := Date;
    edtDateFrom.Enabled := False;
    lblFrDt.Enabled:=edtDateFrom.Enabled;
    edtDateTo.Enabled := True;
    edtDateTo.Date := Date;
    PanelUnlink.Visible:=True;
    edtDateTo.SetFocus;
    cbBBFDate.Visible:=True;
    cbBBFDate.Checked:=False;
  end;
end;

procedure TfmOpenLink.BtnClearClick(Sender: TObject);
begin
  CBUseRef.Visible := false ;
 // cbDDebit.Visible := true ;
//  cbDCredit.Visible := true ;
  cbGenBFOnAllAccount.Visible := False ;
  if PanelUnlink.Visible or (trim(edtAccount.Text)='') then
  begin
    BtnClear.Down := False;
    exit;
  end;
  BdoBBF:=False;
  MyCaptionBar.Caption :=DMTCCoreLink.GetTextLang(2173){'Clear links options'};

  if OSFMessageDlg(DMTCCoreLink.GetTextLang(722){'Warning, if you click yes you will lose all your current links for this account.'}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    cbJustExactAmounts.Visible := False ;
    cbAllLinks.Checked:=False;
    edtDateFrom.Date := Date;
    edtDateTo.Date := Date;
    PanelUnlink.Visible:=True;
    PanelUnlink.BringToFront;
    try
    edtDateFrom.SetFocus;
    except
    end;
    cbBBFDate.Visible := False;
  end
  else
    BtnClear.Down := False;
end;

procedure TfmOpenLink.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(148);
   key := 0;
  end;
  if Key = 27 then
  begin
   if PanelUnlink.Visible then

   else
     Close;
   key := 0;
  end;
end;

procedure TfmOpenLink.FormResize(Sender: TObject);
begin
if pcMain.ActivePage = tsDetail then
   pnlRight.Height := PnlPlain.Height div 2 ;
end;

procedure TfmOpenLink.BtnUnlinkClick(Sender: TObject);
begin

  if statementDown then
     begin
      statementDown := false ;
      unlinkdown := True ;
      LinkMode := False ;
      PnlStatement.SendToBack;
     end;
   CrQuery:=False;

  if not unlinkdown then
    begin
     LinkMode:=False;
     cxDebitsDBBandedTableView1.Styles.ContentEven := dmQuantumGridDefs.cxFooter ;
     cxDebitsDBBandedTableView1.Styles.ContentOdd  := dmQuantumGridDefs.cxFooter ;
     cxCreditsDBBandedTableView1.Styles.ContentEven := dmQuantumGridDefs.cxFooter ;
     cxCreditsDBBandedTableView1.Styles.ContentOdd  := dmQuantumGridDefs.cxFooter ;
     unlinkdown := true ;
     statementDown := false ;

    // unlinkDeb := not unlinkDeb;
    end else
    begin
     LinkMode:=True;
     cxDebitsDBBandedTableView1.Styles.ContentEven  := dmQuantumGridDefs.cxContentEven ;
     cxDebitsDBBandedTableView1.Styles.ContentOdd  := dmQuantumGridDefs.cxContentOdd ;
     cxCreditsDBBandedTableView1.Styles.ContentEven := dmQuantumGridDefs.cxContentEven ;
     cxCreditsDBBandedTableView1.Styles.ContentOdd  := dmQuantumGridDefs.cxContentOdd ;
     unlinkdown := false ;
     statementDown := false ;

    end;
  SetButtons ;
  
  ChangeQueries(Sender);
 
  wwqryOpenDebits.Open;
  wwqryOpenCredits.Open;
 

end;

procedure TfmOpenLink.wwdbgDebitsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=117 then
  begin
    key:=0;
    BtnClear.Down:=True;
    BtnClearClick(Sender);

  end;
  if key=118 then
  begin
    key:=0;
    btnBBFClick(Sender);
  end;
  if key=119 then
  begin
    key:=0;
    btnUnlink.Down:=Not btnUnlink.Down;
    btnUnlinkClick(Sender);
  end;

end;

procedure TfmOpenLink.btnApplyClick(Sender: TObject);
  var
   i : integer ;
   FromTop : Boolean ;
   Found : Boolean ;
begin
   if wwqryOpenDebits.eof then
      begin
       wwqryOpenDebits.first ;
      end;
   FromTop := wwqryOpenDebits.Bof ;
   Found := false ;
    while not wwqryOpenDebits.eof and not Found do
      begin
         for i := 0 to wwqryOpenDebits.FieldCount -1 do
          if wwqryOpenDebits.fields[i].Visible then
           begin
             if pos(edtAmtRef.Text,upperCase(wwqryOpenDebits.fields[i].AsString)) > 0   then
              begin
                Found := true ;
                cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
                cxDebitsDBBandedTableView1.Controller.FocusedRow.MakeVisible  ;
                break ;
              end;
           end ;
         if not found then
          begin
            wwqryOpenDebits.Next ;
            if not FromTop and (wwqryOpenDebits.eof) then
              begin
               wwqryOpenDebits.first ;
               FromTop := True;
              end;
          end;
      end;
   Found := false ;
   if wwqryOpenCredits.eof then
      begin
       wwqryOpenCredits.first ;
      end;
   FromTop := wwqryOpenCredits.Bof ;

   while not wwqryOpenCredits.eof and not Found do
      begin
         for i := 0 to wwqryOpenCredits.FieldCount -1 do
          if wwqryOpenCredits.fields[i].Visible then
           begin
             if pos(edtAmtRef.Text,upperCase(wwqryOpenCredits.fields[i].AsString)) > 0  then
               begin
                Found := true ;
                cxCreditsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
                cxCreditsDBBandedTableView1.Controller.FocusedRow.MakeVisible   ;
               end;
           end ;
         if not found then
         begin
           wwqryOpenCredits.Next ;
            if not FromTop and (wwqryOpenCredits.eof) then
              begin
               wwqryOpenCredits.first ;
               FromTop := True;
              end;
         end;
      end;
end;

procedure TfmOpenLink.edtDateKeyPress(Sender: TObject; var Key: Char);
begin
  Case key of
  #13:begin
        btnApplyClick(Sender);
        Key:=#0;
      end;
  end;
end;

procedure TfmOpenLink.rgAccountTypeClick(Sender: TObject);
begin
  SelectNext(Screen.ActiveControl,true,true);
end;

Procedure TfmOpenLink.SetLinkAmount;
Var
  DFAmt,DOuAmt,
  CFAmt,COuAmt,
  Tmp,AccMin:Real;

begin
  LinkAmount:= 0;
  CFAmt :=  FixAmt(wwqryOpenCreditsFAmount.Value,2);
  COuAmt := FixAmt(wwqryOpenCreditsFOutstandingAmount.Value,2);
  DFAmt :=  FixAmt(wwqryOpenDebitsFAmount.Value,2);
  DOuAmt := FixAmt(wwqryOpenDebitsFOutstandingAmount.Value,2);
  if LinkMode Then
    LinkAmount:=Min(Abs(DOuAmt),Abs(COuAmt))
  else
  begin
    AccMin:=Abs(DFAmt)-Abs(DOuAmt);
    Tmp:=Abs(CFAmt)-Abs(COuAmt);
    LinkAmount:=Min(Tmp,AccMin);
  end;
  if (cxDebitsDBBandedTableView1.Controller.SelectedRecordCount=1) And (cxCreditsDBBandedTableView1.Controller.SelectedRecordCount=1) then
  begin
       if not bInAutoProcess then

     begin
    fmEnterLinkAmount := TfmEnterLinkAmount.Create(self);
    try
    SetUpForm(fmEnterLinkAmount);
      fmEnterLinkAmount.AOpenDebitAmount :=  wwqryOpenDebitsFOutstandingAmount.AsFloat ;
     fmEnterLinkAmount.AOpenCreditAmount :=  wwqryOpenCreditsFOutstandingAmount.AsFloat ;
       fmEnterLinkAmount.ADebitAmount :=  wwqryOpenDebitsFAmount.AsFloat ;
     fmEnterLinkAmount.ACreditAmount :=  wwqryOpenCreditsFAmount.AsFloat ;

      fmEnterLinkAmount.ShowModal;
    finally
    fmEnterLinkAmount.Free;
    end;
    end;
  end;

end;

procedure TfmOpenLink.BitBtnCloseClick(Sender: TObject);
begin
  PanelUnlink.Visible:=False;
  try
    cxDebits.SetFocus;
  except
    ToolBar.SetFocus;
  end;    
end;

procedure TfmOpenLink.PanelUnlinkExit(Sender: TObject);
begin
   PanelUnlink.Visible := False;
   BtnClear.Down := False;
   PanelUnlink.SendToBack;
end;


procedure TfmOpenLink.BFOnAllAccounts;
Var
  Side:Byte;
  AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
   AQuery.Connection := DMTCCoreLink.TheZConnection;
    if cbAllLinks.Checked then
     Side := 50
    else
    if (cbDCredit.Checked=cbDDebit.Checked) then
      Side := 0
    else if cbDCredit.Checked then
      Side := 2
    else
      Side := 1;

    AQuery.SQL.Text := 'Select WaccountId from Account where WaccountTypeId = ' + IntToStr( aAccInfo.WAccountTypeID) + ' and WAccountid in (select distinct(transact.waccountid) from transact where transact.WAccountid = account.Waccountid) ' ;
    AQuery.open ;
    while not AQuery.Eof do
    begin

    ClearLinks(AQuery.fields[0].asInteger,edtDateFrom.Date,edtDateTo.Date,Side);
    Try
      if BdoBBF then
       begin
       if not CBUseRef.Checked then
        CreateBBFLinks(AQuery.fields[0].asInteger,edtDateFrom.Date,edtDateTo.Date,cbBBFDate.Checked,cbJustExactAmounts.Checked)
       else
        CreateBBFLinksOnRef(AQuery.fields[0].asInteger);

       end;
    Except
    end;
    AQuery.next;
    end ;// end not EOF

    wwqryOpenDebits.Close;
    wwqryOpenCredits.Close;
 
    wwqryOpenCredits.Open;
    wwqryOpenDebits.Open;
 
    BitBtnCloseClick(nil);

      // UPDATE LINK DATE
     AQuery.SQL.Text := 'update OILINKS SET ddate = (SELECT MAX(ddate) FROM TRANSACT WHERE TRANSACT.WTRANSACTIONID = oilinks.WAMOUNTTRANSACTIONID OR TRANSACT.WTRANSACTIONID = OILINKS.WLINKTRANSACTIONID) WHERE ' +
     ' ddATE IS NULL ' ;
     AQuery.ExecSQL;
     finally
     AQuery.free  ;
  end;
end;


procedure TfmOpenLink.BitBtnOkClick(Sender: TObject);
Var
  Side:Byte;
begin
 if cbGenBFOnAllAccount.Checked then
   begin
     BFOnAllAccounts ;
     exit ;
   end;
    if cbAllLinks.Checked then
     begin
     Side := 50 ;
     edtDateTo.Date := Date + 100 ;
     cbBBFDate.Checked := false ;
     end
    else
    if (cbDCredit.Checked=cbDDebit.Checked) then
      Side := 0
    else if cbDCredit.Checked then
      Side := 2
    else
      Side := 1;
    if (cbDCredit.Checked=cbDDebit.Checked) and (cbDCredit.Checked) then
      ClearLinks(aAccInfo.WAccountID,edtDateFrom.Date,edtDateTo.Date,Side);
    Try
      if BdoBBF then
       begin

       if not CBUseRef.Checked then
        CreateBBFLinks(aAccInfo.WAccountID,edtDateFrom.Date,edtDateTo.Date,cbBBFDate.Checked,cbJustExactAmounts.Checked)
       else
        CreateBBFLinksOnRef(aAccInfo.WAccountID);

       end;
    Except
    end;
    wwqryOpenDebits.Close;
    wwqryOpenCredits.Close;
 
    wwqryOpenCredits.Open;
    wwqryOpenDebits.Open;
 
    BitBtnCloseClick(Sender);


end;

procedure TfmOpenLink.MyCaptionBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Const
  SC_DragMove = $F012;  { a magic number }
begin
  ReleaseCapture;
  PanelUnlink.perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TfmOpenLink.cbAllLinksClick(Sender: TObject);
begin
  if BdoBBF then
  begin
    if cbAllLinks.Checked then
    begin
      cbBBFDate.Enabled:=True;
      cbBBFDateClick(Sender);
    end
    else
    begin
      cbBBFDate.Enabled:=False;
      edtDateFrom.Enabled := True;
      lblFrDt.Enabled:=edtDateFrom.Enabled;
    end;
  end
  else
  begin
    if cbAllLinks.Checked then
    begin
      edtDateFrom.Enabled:=False;
      lblFrDt.Enabled:=edtDateFrom.Enabled;
      edtDateTo.Enabled:=False;
      cbDDebit.Enabled:=False;
      cbDCredit.Enabled:=False;
    end
    else
    begin
      edtDateFrom.Enabled:=true;
      lblFrDt.Enabled:=edtDateFrom.Enabled;      
      edtDateTo.Enabled:=True;
      cbDDebit.Enabled:=True;
      cbDCredit.Enabled:=True;
    end;
  end;
end;

procedure TfmOpenLink.cbBBFDateClick(Sender: TObject);
begin
  if Not BdoBBF then
  begin
    cbBBFDate.Visible:=False;
    exit;
  end;
  if cbBBFDate.Checked then
    edtDateFrom.Enabled := True
  else
    edtDateFrom.Enabled := False;
  lblFrDt.Enabled:=edtDateFrom.Enabled;
end;


Procedure  TfmOpenLink.CalcSel;
 var
  ABookmark : {$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
Begin
  ctSelAmt := 0 ;
  dtSelAmt := 0 ;
  if not wwqryOpenDebits.IsEmpty then
  begin
  wwqryOpenDebits.DisableControls ;
  try
    ABookmark := wwqryOpenDebits.Bookmark ;

    wwqryOpenDebits.First ;
    while not wwqryOpenDebits.eof do
      begin
         if wwqryOpenDebitsBUNUSED.AsInteger =1 then
          begin
            if LinkMode then
             dtSelAmt := dtSelAmt + wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat  else
            dtSelAmt := dtSelAmt + wwqryOpenDebitsFAMOUNT.AsFloat - wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat  ;
            end;


        wwqryOpenDebits.next ;
      end;
    wwqryOpenDebits.Bookmark  := ABookmark ;
  finally
   wwqryOpenDebits.EnableControls ;
  end;
 end;
 if not wwqryOpenCredits.IsEmpty then
  begin
  wwqryOpenCredits.DisableControls ;
  try
    ABookmark := wwqryOpenCredits.Bookmark ;

    wwqryOpenCredits.First ;
    while not wwqryOpenCredits.eof do
      begin
         if wwqryOpenCreditsBUNUSED.AsInteger =1 then
            begin
            if LinkMode then
            ctSelAmt := ctSelAmt + wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat  else
            ctSelAmt := ctSelAmt + wwqryOpenCreditsFAMOUNT.AsFloat - wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat  ;
            end;
        wwqryOpenCredits.next ;
      end;

         wwqryOpenCredits.Bookmark  := ABookmark ;
  finally
   wwqryOpenCredits.EnableControls ;
  end;
 end;
end;


 


procedure TfmOpenLink.RPymtClick(Sender: TObject);
Var
  SrcTrans,DestTrans:integer;
  xAmount,yAmount:Real;
  i : Integer ;
  KeyArray  :Array of integer ;
  VariantArray,VarPayKey : Variant ;
  FilterText : String ;
begin
 SrcTrans := 0 ;
if LinkOfTrn <> 0 then
 begin
   cxDebitsDBBandedTableView1.Controller.ClearSelection ;
   cxCreditsDBBandedTableView1.Controller.ClearSelection ;
  if wwqryOpenDebits.Locate('WTRANSACTIONID',LinkOfTrn,[]) then
    begin
     PopupMenu1.PopupComponent :=   cxDebitsDBBandedTableView1  ;

    end;
  if wwqryOpenCredits.Locate('WTRANSACTIONID',LinkOfTrn,[]) then
     begin
     PopupMenu1.PopupComponent :=   cxCreditsDBBandedTableView1  ;

     end;
 end;

 SetDebCreditSelected ;
 xAmount := 0 ;
 SetLength(KeyArray,1);
  VarPayKey := VarArrayCreate([0,1],varInteger);

    
 if not CreditGridHasFocus then
 begin

 SetLength(KeyArray,cxDebitsDBBandedTableView1.Controller.SelectedRecordCount);
 VariantArray := VarArrayCreate([0,cxDebitsDBBandedTableView1.Controller.SelectedRecordCount],varInteger);
 
 for  i := 0 to cxDebitsDBBandedTableView1.Controller.SelectedRecordCount  -1 do
  begin
   cxDebitsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
   SrcTrans  := wwqryOpenDebits.FieldByName('WTransactionID').AsInteger ;
   KeyArray[i] := wwqryOpenDebits.FieldByName('WTransactionID').AsInteger ;
   VariantArray[i] := wwqryOpenDebits.FieldByName('WTransactionID').AsInteger ;
   xAmount := xAmount+ wwqryOpenDebits.FieldByName('FoutStandingAmount').AsFloat;

 end ;

  if LinkOffAmount <> 0 then
     begin
       xAmount := LinkOffAmount ;
       SrcTrans := LinkOfTrn ;
     end;
  DestTrans := AutoReceivePymt(aAccInfo,SrcTrans,wwqryOpenDebits.FieldByName('SReference').AsString,xAmount,Sender = nil,Saveprefix);
  wwqryOpenDebits.Close;
  Application.ProcessMessages;
  wwqryOpenDebits.Open;
  wwqryOpenDebits.Filtered := false ;
  {Link it Now Select}
  lblLedger.Caption := FloatToStrF(FixAmount(GetAccountTotal(aAccInfo.WAccountID,27,3)),ffFixed,18,2);
  if wwqryOpenDebits.Locate('WTRANSACTIONID', DestTrans,[]) then
  begin
    cxDebitsDBBandedTableView1.Controller.ClearSelection ;
    cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;


  FilterText := '' ;
 for  i := low(KeyArray) to high(KeyArray) do
  begin
   if wwqryOpenDebits.Locate('WTRANSACTIONID', DestTrans,[]) and wwqryOpenCredits.Locate('WTRANSACTIONID', KeyArray[i],[]) then
   begin
    IF  xAmount -  wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat < 0 THEN
      yAmount :=  xAmount
      else
      yAmount := wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat ;
    xAmount := xAmount - yAmount ;
     cxDebitsDBBandedTableView1.Controller.ClearSelection ;
     cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
     cxCreditsDBBandedTableView1.Controller.ClearSelection ;
     cxCreditsDBBandedTableView1.Controller.FocusedRow.Selected := True ;


    LinkAcc(self,yAmount,False);
    if FilterText <> '' then
      FilterText := FilterText + ' or ' ;
    FilterText := FilterText + ' WTransactionID=' + inttoStr(KeyArray[i])
    end;
  end ;
   // check for the report
  end  ;
   if FileExists(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep') then

   begin
       if Printreciept and (DestTrans <> -1) then
         begin
            VarPayKey[0] := DestTrans ;
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(VarPayKey,True,2);
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(VariantArray,false);
            ExecReport(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep', 'paymethode=' +  gl_lastpaymethode +
             #13+#10+ 'transdesc='+gl_transdec + #13+#10+ 'reference='+ gl_reference + #13+#10 + 'amount='  +  TDatabaseTableRoutines.GetFirebirdsSqlForFloat(gl_amounttrans) );

         end;
  end;
  end else
    begin
    if  cxCreditsDBBandedTableView1.Controller.SelectedRecordCount > 1 then
    begin
    SetLength(KeyArray,cxCreditsDBBandedTableView1.Controller.SelectedRecordCount);
     VariantArray := VarArrayCreate([0,cxCreditsDBBandedTableView1.Controller.SelectedRecordCount],varInteger);
    for  i := 0 to cxCreditsDBBandedTableView1.Controller.SelectedRecordCount -1 do
    begin

     cxCreditsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
     SrcTrans:= wwqryOpenCredits.FieldByName('WTransactionID').AsInteger;
     KeyArray[i] := wwqryOpenCredits.FieldByName('WTransactionID').AsInteger ;
     VariantArray[i] := wwqryOpenCredits.FieldByName('WTransactionID').AsInteger ;
     xAmount := xAmount+ wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat;
    end ;
    end  else
    begin
      SrcTrans:= wwqryOpenCredits.FieldByName('WTransactionID').AsInteger;
      KeyArray[0] := SrcTrans ;

      VariantArray := VarArrayCreate([0,1],varInteger);
      VariantArray[0] := SrcTrans ;
      if wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat <> 0  then
         xAmount := wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat
         else
         xAmount := wwqryOpenDebits.FieldByName('FoutStandingAmount').AsFloat ;

    end;
    DestTrans := AutoReceivePymt(aAccInfo,SrcTrans,wwqryOpenCredits.FieldByName('SReference').AsString,xAmount);
    wwqryOpenDebits.Close;
    wwqryOpenDebits.Filtered := false ;
    Application.ProcessMessages;
    wwqryOpenDebits.Open;
    {Link it Now Select}
    lblLedger.Caption := FloatToStrF(FixAmount(GetAccountTotal(aAccInfo.WAccountID,27,3)),ffFixed,18,2);
    if wwqryOpenDebits.Locate('WTRANSACTIONID', DestTrans,[]) then
    begin
      cxDebitsDBBandedTableView1.Controller.ClearSelection ;
      cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
 
    FilterText := '' ;
    for  i := low(KeyArray) to high(KeyArray) do
    begin
     if wwqryOpenDebits.Locate('WTRANSACTIONID', DestTrans,[]) and wwqryOpenCredits.Locate('WTRANSACTIONID', KeyArray[i],[]) then
     begin
      IF  xAmount - wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat > 0 THEN
        yAmount :=  xAmount
        else
        yAmount := wwqryOpenCredits.FieldByName('FoutStandingAmount').AsFloat ;
      xAmount := xAmount - yAmount ;
     // wwdbgCredits.UnselectAll;
    //  wwdbgCredits.SelectRecord;
    //  wwdbgDebits.UnselectAll;
    //  wwdbgDebits.SelectRecord;
      LinkAcc(self,abs(yAmount),False);
      {if FilterText <> '' then
        FilterText := FilterText + ' or ' ;
      FilterText := FilterText + ' WTransactionID=' + inttoStr(KeyArray[i])   }
      end;
    end ;
    end;
   // showmessage(wwqryOpenDebits.fieldByNAme('WTransactionID').AsString);
     if FileExists(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep') then
       if Printreciept and (DestTrans <> -1) then
         begin
            VarPayKey[0] := DestTrans ;
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(VarPayKey,True,2);
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(VariantArray,false);
            ExecReport(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep','paymethode=' +  gl_lastpaymethode +
             #13+#10+ 'transdesc='+gl_transdec + #13+#10+ 'reference='+ gl_reference + #13+#10 + 'amount='  +  TDatabaseTableRoutines.GetFirebirdsSqlForFloat(gl_amounttrans) );

         end;

    end ;
  UnselectDebCredit ;
       ChangeQueries(Sender);
     wwqryOpenDebits.Filtered := False ;
     wwqryOpenDebits.Open;
     wwqryOpenCredits.Filtered := False ;
     wwqryOpenCredits.Open;
      if LinkOffAmount <> 0 then
       ModalResult:= mrok ;

end;

procedure TfmOpenLink.PopupMenu1Popup(Sender: TObject);
begin
 //   UnlinkTransaction1.Visible := BtnUnlink.Down ;
  RPymt.Visible := (not BtnUnlink.Down) ;
  Reprinttransactions1.Visible := BtnUnlink.Down ;
end;



procedure TfmOpenLink.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0 ;
  DMTCCoreLink.AssignConnectionToChilds(self);
  LikeSeach := ReadSysParam('LikeSearchForStrings',false,CurrentUser).AsBoolean ;
  SetSortBy('Transact.DDate',true);
  SetSortBy('Transact.DDate',false);
  FieldBy1:='DDATE';
  FieldBy2:='DDATE';
  statementDown  := false ;
  unlinkdown   := false ;
  cbAccountType.Checked[0] := False ;
  cbAccountType.Checked[1] := true ;
  cbAccountType.Checked[2] := true ;

  cbAccountTypeTrans.Checked[0] := False ;
  cbAccountTypeTrans.Checked[1] := true ;
  cbAccountTypeTrans.Checked[2] := true ;
  DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TfmOpenLink.ToolButton3Click(Sender: TObject);
begin
 if unlinkdown then
 begin
     UnlinkTransaction1Click(self);
     exit ;
 end;

  SetDebCreditSelected ;
  try
    LinkAcc(Sender,0,True);
  finally
   UnselectDebCredit ;
  end;
end;
procedure TfmOpenLink.SetDebCreditSelected;
begin
  {Set all clicked as Selected}
  if PopupMenu1.PopupComponent = nil then
  begin
  if not wwqryOpenDebits.IsEmpty then
      begin
       wwqryOpenDebits.Edit ;
       wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
     end ;


  if not wwqryOpenCredits.IsEmpty then
      begin
       wwqryOpenCredits.Edit ;
       wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
     end ;


 end else
 begin
    if not (PopupMenu1.PopupComponent =  cxDebitsDBBandedTableView1) then
     begin
         if not wwqryOpenDebits.IsEmpty then
      begin
       wwqryOpenDebits.Edit ;
       wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
     end ;

     end else
     begin
         if not wwqryOpenCredits.IsEmpty then
      begin
       wwqryOpenCredits.Edit ;
       wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
     end ;
     end;
 end;



  if wwqryOpenDebits.State = dsedit then
     wwqryOpenDebits.post ;
  if wwqryOpenCredits.State = dsedit then
     wwqryOpenCredits.post ;

    wwqryOpenDebits.Filtered:=False;
    wwqryOpenDebits.Filter:='Bunused=1';
    wwqryOpenDebits.Filtered:=True;
    cxDebitsDBBandedTableView1.Controller.ClearSelection ;
    cxCreditsDBBandedTableView1.Controller.ClearSelection ;
    cxDebitsDBBandedTableView1.Controller.SelectAll ;
    wwqryOpenCredits.Filtered:=False;
    wwqryOpenCredits.Filter:='Bunused=1';
    wwqryOpenCredits.Filtered:=True;
    cxCreditsDBBandedTableView1.Controller.ClearSelection ;
    cxCreditsDBBandedTableView1.Controller.SelectAll ;


   if (cxCreditsDBBandedTableView1.Controller.SelectedRecordCount > 1) and (cxDebitsDBBandedTableView1.Controller.SelectedRecordCount > 1) then
      begin
        if cxCreditsDBBandedTableView1.Controller.SelectedRecordCount <  cxDebitsDBBandedTableView1.Controller.SelectedRecordCount then
         begin
             cxCreditsDBBandedTableView1.Controller.ClearSelection ;
             cxCreditsDBBandedTableView1.Controller.FocusedRow.Selected := True ;

         end else
         begin
             cxDebitsDBBandedTableView1.Controller.ClearSelection ;
             cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;

         end;
      end;
end;

procedure TfmOpenLink.UnselectDebCredit;
begin
    wwqryOpenDebits.DisableControls;
    wwqryOpenCredits.DisableControls;
    try
    wwqryOpenDebits.Close;
    wwqryOpenCredits.Close;

    wwqryOpenDebits.Filtered:=False;
    wwqryOpenDebits.Filter:='';
    wwqryOpenCredits.Filtered:=False;
    wwqryOpenCredits.Filter:='';
    cxDebitsDBBandedTableView1.Controller.ClearSelection ;
    cxCreditsDBBandedTableView1.Controller.ClearSelection ;
    wwqryOpenDebits.Open;
    wwqryOpenCredits.Open;
    finally
    wwqryOpenDebits.EnableControls;
    wwqryOpenCredits.EnableControls;
    end;
end;

procedure TfmOpenLink.tbnStatmtClick(Sender: TObject);
begin

 if not statementDown then
 begin
  if unlinkdown then
   begin
     BtnUnlinkClick(Self);
   end;
   PnlStatement.BringToFront;
   Self.Refresh;
   Application.ProcessMessages;
   CalSmtAge;
  statementDown  := true ;
  unlinkdown   := false ;
 end else
 begin
   unlinkdown := True ;
   LinkMode := False ;
   BtnUnlinkClick(Self);
 end;
 SetButtons ;
end;


Procedure TfmOpenLink.CalSmtAge;
begin
 if aAccInfo.WAccountID = 0 then exit ;

 zQDetailHist.close ;
 zQDetailHist.ParamByName('DtStart').AsDate := edtSince.Date ;
 zQDetailHist.ParamByName('dtEndDate').AsDate := edtCurDate.Date ;
 zQDetailHist.ParamByName('WAccountid').AsInteger := aAccInfo.WAccountID ;
 zQDetailHist.ParamByName('DtStart2').AsDate := edtSince.Date ;
 zQDetailHist.ParamByName('dtEndDate2').AsDate := edtCurDate.Date ;
 zQDetailHist.ParamByName('WAccountid1').AsInteger := aAccInfo.WAccountID ;
 zQDetailHist.ParamByName('WAccountid2').AsInteger := aAccInfo.WAccountID ;
 zQDetailHist.ParamByName('WAccountid3').AsInteger := aAccInfo.WAccountID ;
 zQDetailHist.open ;

 zQMasterHist.Close ;
 zQMasterHist.ParamByName('DtStart').AsDate := edtSince.Date ;
 zQMasterHist.ParamByName('dtEndDate').AsDate := edtCurDate.Date ;
 zQMasterHist.ParamByName('WAccountid').AsInteger := aAccInfo.WAccountID ;
 zQMasterHist.Open;



 // FillTmpAgeTable(TDataBaseRoutines.GetAccountType(aAccInfo.WAccountID) = 1,IncMonth(edtCurDate.Date,-3),IncMonth(edtCurDate.Date,-2), IncMonth(edtCurDate.Date,-1) ,edtCurDate.Date,true);
  LblCur.Caption := FloatToStrT(StrToFloatDef(VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FAmount) from TRANSACT where DDate <= ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date))+
  ' and WAccountid = ' + IntToStr(aAccInfo.WAccountID))),0), ffFixed, 18, 2);

  Lbl30.Caption := FloatToStrT(StrToFloatDef(VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FAmount) from TRANSACT where DDate <= ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date))+
  ' and DDate > ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date-30))+
  ' and WAccountid = ' + IntToStr(aAccInfo.WAccountID))),0), ffFixed, 18, 2);

  Lbl60.Caption := FloatToStrT(StrToFloatDef(VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FAmount) from TRANSACT where DDate <= ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date-30))+
  ' and DDate > ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date-60))+
  ' and WAccountid = ' + IntToStr(aAccInfo.WAccountID))),0), ffFixed, 18, 2);

  Lbl90.Caption := FloatToStrT(StrToFloatDef(VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FAmount) from TRANSACT where DDate <= ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date-90))+
  ' and WAccountid = ' + IntToStr(aAccInfo.WAccountID))),0), ffFixed, 18, 2);

  lblDue.Caption := FloatToStrT(StrToFloatDef(VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select sum(FOUTSTANDINGAMOUNT) from TRANSACT where DDate <= ' + QuotedStr(formatDateTime('yyyy/mm/dd',edtCurDate.Date))+
  ' and WAccountid = ' + IntToStr(aAccInfo.WAccountID))),0), ffFixed, 18, 2);

  Application.ProcessMessages;
 


end;

procedure TfmOpenLink.edtAccountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
ShiftDown := (ssShift in Shift) ;
end;

procedure TfmOpenLink.edtAccountKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssShift in Shift) then
 ShiftDown := false ;
end;

procedure TfmOpenLink.SetButtons;
begin
 BtnUnlink.Down := unlinkdown ;

 if BtnUnlink.Down then
   begin
   BtnUnlink.Caption :=   DMTCCoreLink.GetTextLang(3565)  ;
   ToolButton3.Caption := DMTCCoreLink.GetTextLang(2248);
   BtnUnlink.ImageIndex :=   74;
   end
   else
   begin
   BtnUnlink.Caption := DMTCCoreLink.GetTextLang(934) ;
   ToolButton3.Caption := DMTCCoreLink.GetTextLang(1882);
   BtnUnlink.ImageIndex :=   75 ;
   end;

 tbnStatmt.Down := statementDown ;
end;



procedure TfmOpenLink.UpdateAccountInfo;
   var
    Code,Descr : String ;
begin
 if aslookup then
 begin
    TDataBaseRoutines.GetAccountCodeAndDescription(aAccInfo.WAccountID,Code,Descr);
    aAccInfo.SDescription := Descr;
    aAccInfo.SACCOUNTCODE := Code;
    aAccInfo.WAccountTypeID := TDataBaseRoutines.GetAccountType(aAccInfo.WAccountID);
 end else
 begin
   if pcLijst.ActivePageIndex = 0 then
   begin
     aAccInfo.SDescription := ZQAccountListSDESCRIPTION.AsString ;
     aAccInfo.SACCOUNTCODE := ZQAccountListSACCOUNTCODE.AsString ;
     aAccInfo.WAccountTypeID := ZQAccountListWACCOUNTTYPEID.AsInteger ;
   end else
   begin
     aAccInfo.SDescription := ZQTranslistSACCOUNTDESCRIPTION.AsString ;
     aAccInfo.SACCOUNTCODE := ZQTranslistSACCOUNTCODE.AsString ;
     aAccInfo.WAccountTypeID := ZQTranslistWACCOUNTTYPEID.AsInteger ;
   end;
 end;
 edtAccount.Text :=  aAccInfo.SACCOUNTCODE ;
 lblAccountDesc.Caption := aAccInfo.SDescription ;
 LExtraData.Caption := '' ;
 ZQAccountData.close ;
 ZQAccountData.Params[0].AsInteger := aAccInfo.WAccountID;
 ZQAccountData.Params[1].AsInteger := aAccInfo.WAccountID;
 ZQAccountData.open ;
 if (ZQAccountDataFIRSTNAME.AsString <> '') or (ZQAccountDataLASTNAME.AsString <> '') then
   LExtraData.Caption := Trim(LExtraData.Caption +  ' ' + DMTCCoreLink.GetTextLangNoAmp(197) +': ' + ZQAccountDataFIRSTNAME.AsString +' ' + ZQAccountDataLASTNAME.AsString) ;

 if (ZQAccountDataSPOSTAL1.AsString <> '')  then
   LExtraData.Caption := Trim(LExtraData.Caption +  ' ' + DMTCCoreLink.GetTextLangNoAmp(2220) +': ' + ZQAccountDataSPOSTAL1.AsString )  ;

 if (ZQAccountDataSPOSTAL2.AsString <> '')  then
   LExtraData.Caption := Trim(LExtraData.Caption +  ' ' + DMTCCoreLink.GetTextLangNoAmp(2206) +': ' + ZQAccountDataSPOSTAL2.AsString )  ;

 if (ZQAccountDataSTELEPHONE1.AsString <> '')  then
   LExtraData.Caption := Trim(LExtraData.Caption +  ' ' + DMTCCoreLink.GetTextLangNoAmp(187) +': ' + ZQAccountDataSTELEPHONE1.AsString )  ;

  if (ZQAccountDataSTELEPHONE2.AsString <> '')  then
   LExtraData.Caption := Trim(LExtraData.Caption +  ' ' + DMTCCoreLink.GetTextLangNoAmp(188) +': ' + ZQAccountDataSTELEPHONE2.AsString )  ;

 lblLedger.Caption := FloatToStrF(FixAmount(GetAccountTotal(aAccInfo.WAccountID,27,3)),ffFixed,18,2);
 BtnUnlink.Down := false ;
 unlinkdown := false ;

end;

procedure TfmOpenLink.CalledAsLookup;
begin
 pcMain.ActivePageIndex := 0 ;
 FormResize(self);
 //BitBtn3.Visible := false ;
 edtAccount.ReadOnly := true ;
 aslookup := true ;
end;

procedure TfmOpenLink.BFilterClick(Sender: TObject);
 var
  ExtraSql,aQuery,AccountType : String ;
  OldId : integer ;
  Having : String ;
begin
  if SortIndexTotal < 1 then SortIndexTotal := 1 ;
  OldId := ZQAccountListWACCOUNTID.AsInteger ;


  ZQAccountList.close ;
  ZQAccountList.Filtered := false ;
  ZQAccountList.SQL.clear ;
  aQuery := 'Select first '+IntToStr(LimitRowst.Value)+' b.SAccountCode ,b.SDescription,b.WAccountTypeId, sum(a.FAmount) TotalTrans,Sum(a.FOutstandingAmount) TotalOpen,b.WAccountId from Account b join Transact a on b.waccountid = a.Waccountid where b.BOPENITEM = 1 and b.BINACTIVE = 0 %s' +
                  ' group by b.SAccountCode ,b.SDescription,b.WAccountTypeId,b.WAccountId %s order by ' + IntToStr(SortIndexTotal) ;
  if SortDirectionTotal then
    aQuery := aQuery + ' DESC' ;
 // ExtraSql := '' ;
  ExtraSql := 'and b.WaccountId in (Select c.WAccountId from Account c where ' ;
  AccountType := '' ;
  if cbAccountType.Checked[0] then
    begin
     AccountType := '0,3,4' ;
    end;
  if cbAccountType.Checked[1] then
    begin
      if AccountType <> '' then
        AccountType := AccountType + ',' ;
       AccountType := AccountType + '1' ;
    end;
  if cbAccountType.Checked[2] then
    begin
      if AccountType <> '' then
        AccountType := AccountType + ',' ;
       AccountType := AccountType +  '2' ;
    end;
  if AccountType = '' then AccountType := '10' ;
  ExtraSql := ExtraSql + ' c.WAccountTypeId in (' +  AccountType + '))' ;

    if trim(EFilterValue.Text) <> '' then
    if CBFindColumn.ItemIndex >0  then
    begin
        case CBFindColumn.ItemIndex of
        1,2,3 :
        begin
            ExtraSql := ExtraSql + ' and upper(' + cxTotalsDBTableView1.Columns[CBFindColumn.ItemIndex-1].DataBinding.Field.Origin + ')'  ;
            case CBOperatot.ItemIndex of
                0 :    begin
                        if LikeSeach then
                          ExtraSql := ExtraSql + ' like ' + QuotedStr('%'+EFilterValue.Text+'%')
                        else
                          ExtraSql := ExtraSql + ' like ' + QuotedStr(EFilterValue.Text+'%') ;
                       end;
                1 :    ExtraSql := ExtraSql + ' = ' + QuotedStr(EFilterValue.Text) ;
                2 :    ExtraSql := ExtraSql + ' < ' + QuotedStr(EFilterValue.Text) ;
                3 :    ExtraSql := ExtraSql + ' > ' + QuotedStr(EFilterValue.Text) ;
                4 :    ExtraSql := ExtraSql + ' <= ' + QuotedStr(EFilterValue.Text) ;
                5 :    ExtraSql := ExtraSql + ' >= ' + QuotedStr(EFilterValue.Text) ;
                6 :    ExtraSql := ExtraSql + ' <> ' + QuotedStr(EFilterValue.Text) ;
             end;

        end;

        {ftDate,ftDateTime :
        begin
           ExtraSql := ' and cast(' + DBGSearch.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].Field.Origin +' as date)' ;
           case CBOperatot.ItemIndex of
                0 :    ExtraSql := ExtraSql + ' = ' +  QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                1 :    ExtraSql := ExtraSql + ' = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                2 :    ExtraSql := ExtraSql + ' < ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                3 :    ExtraSql := ExtraSql + ' > ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                4 :    ExtraSql := ExtraSql + ' <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                5 :    ExtraSql := ExtraSql + ' >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
                6 :    ExtraSql := ExtraSql + ' <> ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValue.Text))) ;
            end;
        end;
        else }
        4,5 :
        begin
         Having  := cxTotalsDBTableView1.Columns[CBFindColumn.ItemIndex-1].DataBinding.Field.Origin  ;
          case CBOperatot.ItemIndex of
              0 :    Having  := Having  + ' = ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              1 :    Having  := Having  + ' = ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              2 :    Having  := Having  + ' < ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              3 :    Having  := Having  + ' > ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              4 :    Having  := Having  + ' <= ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              5 :    Having  := Having  + ' >= ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              6 :    Having  := Having  + ' <> ' + StringReplace(StripNotNumericReturnZero(EFilterValue.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
          end;
        end;

    end;

  end;


  if Having <> '' then  Having := ' having ' + Having ;
  ZQAccountList.SQL.Text := format(aQuery,[ExtraSql,Having]) ;
  ZQAccountList.open ;
  ZQAccountList.Locate('WACCOUNTID',OldId,[]);
  if cbFindInvalide.Checked then
    begin
     ZQAccountList.Last ;
     ZQAccountList.Filtered := true ;
    end;
end;

procedure TfmOpenLink.DBGSearchDblClick(Sender: TObject);
begin
  if (ZQAccountList.IsEmpty) and (GotoAccount = 0) then exit ;
  
 // LActivepage.Caption := 'Details' ;
  pcMain.ActivePageIndex := 0 ;
  FormResize(self);
  if GotoAccount <> 0 then
  aAccInfo.WAccountID := GotoAccount 
  else
  aAccInfo.WAccountID := ZQAccountListWACCOUNTID.AsInteger  ;
  unlinkdown := false ;
  LinkMode:=True;
  statementDown := false ;
  PnlStatement.SendToBack;
  SetButtons ;
  cxDebitsDBBandedTableView1.Styles.ContentEven.Color := dmQuantumGridDefs.cxContentEven.Color ;
   cxDebitsDBBandedTableView1.Styles.ContentOdd.Color := dmQuantumGridDefs.cxContentOdd.Color ;
  UpdateAccountInfo ;
  ChangeQueries(Sender);

  wwqryOpenDebits.Open;
  wwqryOpenCredits.Open;
 
  if  statementDown then
    begin
       CalSmtAge;
    end;
end;

procedure TfmOpenLink.DBGSearchTitleClick(Column: TColumn);
begin
 if SortIndexTotal <> (Column.Field.Index+1) then
 begin
 SortIndexTotal := (Column.Field.Index+1);
 end else
 SortDirectionTotal := not SortDirectionTotal ;
 BFilterClick(self);
end;

procedure TfmOpenLink.ToolButton4Click(Sender: TObject);
begin
 if bFromBatch then
   begin
     if GotoAccount <> 0 then
        Self.Close else
      if pcMain.ActivePageIndex = 1 then
        self.Close else
        pcMain.ActivePageIndex := 1 ;
     exit ;
   end;

 if aslookup then
   begin
     Self.Close ;
     exit ;
   end;

   case pcLijst.ActivePageIndex of
   0 : Begin
        if not cbFindInvalide.Checked then
        begin
        ZQAccountList.DisableControls ;
        try
        pcMain.ActivePageIndex := 1;
        BFilterClick(self);
        finally
          ZQAccountList.EnableControls  ;
        end;
        end else
        pcMain.ActivePageIndex := 1 ;
        TMyDayaSet(ZQAccountList).edit ;
        TMyDayaSet(ZQAccountList).MyUpdateCalcFields;
        TMyDayaSet(ZQAccountList).cancel ;
       end ;
   1 : Begin
        ZQTranslist.DisableControls ;
        try
        pcMain.ActivePageIndex := 1 ;
        BFilterTransClick(self);
        finally
          ZQTranslist.EnableControls  ;
        end;
       end ;
 end;
end;

procedure TfmOpenLink.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pcMain.ActivePageIndex = 0) and (not aslookup) and (not bFromBatch) then
    begin
      ToolButton4Click(self);
      CanClose := false ;
    end;
end;

procedure TfmOpenLink.cbShowColorsClick(Sender: TObject);
begin
if ZQAccountList.Active then
 ZQAccountList.Refresh ;
end;

procedure TfmOpenLink.ZQAccountListBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,ZQAccountList.SQL.Text);
end;

procedure TfmOpenLink.BFilterTransClick(Sender: TObject);
 
var
  ExtraSql,aQuery,AccountType : String ;
  OldId : integer ;
begin
  if SortIndexTrans < 1 then SortIndexTrans := 1 ;
  OldId := ZQTranslistWTRANSACTIONID.AsInteger ;
  ZQTranslist.close ;
 // ZQTranslist.SQL.clear ;
  aQuery := 'Select first '+IntToStr(LimitRows.Value)+'  b.SAccountCode ,b.SDescription SAccountDescription,a.SReference,c.Sdescription, a.FAmount TotalTrans, ' +
  ' a.FOutstandingAmount TotalOpen,cast(a.DPaymentDate as Date) DPaymentDate,cast(a.ddate as Date) DDate,b.WAccountTypeId,b.WAccountId ,WTRANSACTIONID '+
  ' from Account b join Transact a on b.waccountid = a.Waccountid '+
  ' join messages c on c.WMessageID = a.WDescriptionID  where b.BOPENITEM = 1 and b.BINACTIVE = 0 %s order by ' + IntToStr(SortIndexTrans) ;
  if SortDirectionTrans then
    aQuery := aQuery + ' DESC' ;
 // ExtraSql := '' ;
  ExtraSql := 'and b.WaccountId in (Select c.WAccountId from Account c where ' ;
  AccountType := '' ;
  if cbAccountTypeTrans.Checked[0] then
    begin
     AccountType := '0,3,4' ;
    end;
  if cbAccountTypeTrans.Checked[1] then
    begin
      if AccountType <> '' then
        AccountType := AccountType + ',' ;
       AccountType := AccountType + '1' ;
    end;
  if cbAccountTypeTrans.Checked[2] then
    begin
      if AccountType <> '' then
        AccountType := AccountType + ',' ;
       AccountType := AccountType +  '2' ;
    end;
  if AccountType = '' then AccountType := '10' ;
  ExtraSql := ExtraSql + ' c.WAccountTypeId in (' +  AccountType + '))' ;
  if cbOpenOnly.Checked then
    ExtraSql := ExtraSql + ' and a.FOutstandingAmount <> 0 ' ;
    
    if trim(EFilterValueTrans.Text) <> '' then
    if CBFindColumnTrans.ItemIndex >0  then
    begin
        case CBFindColumnTrans.ItemIndex of
        1,2,3,4 :
        begin
            ExtraSql := ExtraSql + ' and upper(' + cxTransDBTableView.Columns[CBFindColumnTrans.ItemIndex-1].DataBinding.Field.Origin + ')'  ;
            case CBOperatotTrans.ItemIndex of
                0 :    begin
                        if LikeSeach then
                          ExtraSql := ExtraSql + ' like ' + QuotedStr('%'+EFilterValueTrans.Text+'%')
                        else
                          ExtraSql := ExtraSql + ' like ' + QuotedStr(EFilterValueTrans.Text+'%') ;
                       end;
                1 :    ExtraSql := ExtraSql + ' = ' + QuotedStr(EFilterValueTrans.Text) ;
                2 :    ExtraSql := ExtraSql + ' < ' + QuotedStr(EFilterValueTrans.Text) ;
                3 :    ExtraSql := ExtraSql + ' > ' + QuotedStr(EFilterValueTrans.Text) ;
                4 :    ExtraSql := ExtraSql + ' <= ' + QuotedStr(EFilterValueTrans.Text) ;
                5 :    ExtraSql := ExtraSql + ' >= ' + QuotedStr(EFilterValueTrans.Text) ;
                6 :    ExtraSql := ExtraSql + ' <> ' + QuotedStr(EFilterValueTrans.Text) ;
             end;

        end;
        7,8 :

        begin
           ExtraSql := ExtraSql + ' and ' +  cxTransDBTableView.Columns[CBFindColumnTrans.ItemIndex-1].DataBinding.Field.Origin  ;
           case CBOperatotTrans.ItemIndex of
                0 :    ExtraSql := ExtraSql + ' = ' +  QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                1 :    ExtraSql := ExtraSql + ' = ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                2 :    ExtraSql := ExtraSql + ' < ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                3 :    ExtraSql := ExtraSql + ' > ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                4 :    ExtraSql := ExtraSql + ' <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                5 :    ExtraSql := ExtraSql + ' >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
                6 :    ExtraSql := ExtraSql + ' <> ' + QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDate(EFilterValueTrans.Text))) ;
            end;
        end;
        else
      //  5,6,9 :
        begin
         ExtraSql := ExtraSql  + ' and ' +  cxTransDBTableView.Columns[CBFindColumnTrans.ItemIndex-1].DataBinding.Field.Origin  ;
          case CBOperatotTrans.ItemIndex of
              0 :    ExtraSql := ExtraSql +   ' = ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              1 :    ExtraSql := ExtraSql  + ' = ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              2 :    ExtraSql := ExtraSql  + ' < ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              3 :    ExtraSql := ExtraSql  + ' > ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              4 :    ExtraSql := ExtraSql  + ' <= ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              5 :    ExtraSql := ExtraSql  + ' >= ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
              6 :    ExtraSql := ExtraSql  + ' <> ' + StringReplace(StripNotNumericReturnZero(EFilterValueTrans.Text),DecimalSeparator,'.',[rfReplaceAll]) ;
          end;
        end;
    end;
  end;
  ZQTranslist.SQL.Text := format(aQuery,[ExtraSql]) ;
  ZQTranslist.open ;
  ZQTranslist.Locate('WTRANSACTIONID',OldId,[]);
end;

procedure TfmOpenLink.ZQTranslistBeforeOpen(DataSet: TDataSet);
begin

  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,TDatabaseTableRoutines.StripOrderBy(ZQTranslist.SQL.Text) +' and WtransactionID = 0 ');
end;

procedure TfmOpenLink.DBGSearchTransTitleClick(Column: TColumn);
begin
 if SortIndexTrans <> (Column.Field.Index+1) then
 begin
   SortIndexTrans := (Column.Field.Index+1) ;
 end else
 SortDirectionTrans := not SortDirectionTrans ;
 BFilterTransClick(self);
end;

procedure TfmOpenLink.DBGSearchTransDblClick(Sender: TObject);
begin
  if ZQTranslist.IsEmpty then exit ;

 // LActivepage.Caption := 'Details' ;
  pcMain.ActivePageIndex := 0 ;
  FormResize(self);
  aAccInfo.WAccountID := ZQTranslistWACCOUNTID.AsInteger  ;
  unlinkdown := false ;
  LinkMode := true ;
  statementDown := false ;
  PnlStatement.SendToBack;

  SetButtons ;
  cxDebitsDBBandedTableView1.Styles.ContentEven.Color := dmQuantumGridDefs.cxContentEven.Color ;
  cxDebitsDBBandedTableView1.Styles.ContentOdd.Color := dmQuantumGridDefs.cxContentOdd.Color ;
  cxCreditsDBBandedTableView1.Styles.ContentEven.Color := dmQuantumGridDefs.cxContentEven.Color ;
  cxCreditsDBBandedTableView1.Styles.ContentOdd.Color := dmQuantumGridDefs.cxContentOdd.Color ;

  UpdateAccountInfo ;
  ChangeQueries(Sender);

  wwqryOpenDebits.Open;
  wwqryOpenCredits.Open;

  if  statementDown then
    begin
       CalSmtAge;
    end;
end;

procedure TfmOpenLink.pcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 AllowChange := false ;
end;

procedure TfmOpenLink.ZQAccountListCalcFields(DataSet: TDataSet);
  var
   debcount : integer ;
   aTotal,aOpenTotal : Double ;
begin
 if cbShowColors.Checked then
   begin


        ZQAccountListCHECKSTATUS.AsInteger := 0 ;
        zQHasTrans.SQL.Text := 'Select sum(IIF(FOutstandingAmount=0,0,1)) fcount,Sum(FAmount) amt,sum(FOutstandingAmount) outstan from transact where WAccountid = ' + IntToStr(ZQAccountListWACCOUNTID.AsInteger) + ' and FAmount < 0' +
        ' union  Select sum(IIF(FOutstandingAmount=0,0,1)),Sum(FAmount) amt,sum(FOutstandingAmount) from transact where WAccountid = ' + IntToStr(ZQAccountListWACCOUNTID.AsInteger) + ' and FAmount > 0' ;
        zQHasTrans.open ;
        debcount := zQHasTrans.Fields[0].AsInteger ;
        aTotal :=  zQHasTrans.Fields[1].asFloat ;
        aOpenTotal :=  zQHasTrans.Fields[2].asFloat ;

        zQHasTrans.Next ;
        if zQHasTrans.RecordCount > 1 then
        begin
        aTotal :=  aTotal + zQHasTrans.Fields[1].asFloat ;
        aOpenTotal :=  aOpenTotal + zQHasTrans.Fields[2].asFloat ;
        end;
        if (Trunc((aTotal + 0.005) * 100) <> trunc((aOpenTotal + 0.005) * 100)) then
         begin
           ZQAccountListCHECKSTATUS.AsInteger := 1 ;
           // see if someone is working on this account ?
           zQHasTrans.SQL.Text := 'Select count(*) from OILINKS where WLINKTRANSACTIONID = 0 and WAMOUNTTRANSACTIONID in (Select a.WTransactionID from transact a where a.WAccountid = ' + IntToStr(ZQAccountListWACCOUNTID.AsInteger)+  ' )'  ;
           zQHasTrans.open ;
           if zQHasTrans.Fields[0].AsInteger <> 0 then
              ZQAccountListCHECKSTATUS.AsInteger := 3 ;

         end else
        if (debcount <> 0) and (zQHasTrans.Fields[0].AsInteger <> 0 ) then
         begin
           ZQAccountListCHECKSTATUS.AsInteger := 2 ;
         end;
      end;
 
end;

procedure TfmOpenLink.ZQAccountListFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
 var
   debcount : integer ;
begin
if cbFindInvalide.Checked then
 if cbShowColors.Checked then
   begin
    Accept := false ;
    if ZQAccountListTOTALTRANS.AsFloat <> ZQAccountListTOTALOPEN.AsFloat then
      begin
        Accept := true ;
      end else
      begin
        zQHasTrans.SQL.Text := 'Select count(*) from transact where WAccountid = ' + IntToStr(ZQAccountListWACCOUNTID.AsInteger) + ' and FOutstandingAmount < 0' +
        ' union  Select count(*) from transact where WAccountid = ' + IntToStr(ZQAccountListWACCOUNTID.AsInteger) + ' and FOutstandingAmount > 0' ;
        zQHasTrans.open ;
        debcount := zQHasTrans.Fields[0].AsInteger ;
        zQHasTrans.Next ;
        if (debcount <> 0) and (zQHasTrans.Fields[0].AsInteger <> 0 ) then
         begin
           Accept := true ;
         end;
      end;
   end;
end;


procedure TfmOpenLink.ZQOILinksAfterInsert(DataSet: TDataSet);
begin
     dataset.FieldByName('WOILINKSID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWOILINKS);
end;

procedure TfmOpenLink.UnlinkTransaction1Click(Sender: TObject);
Var
  SrcTrans:integer;

  i : Integer ;
  KeyArray  :Array of integer ;

 OldId,oldid2 : Integer ;

begin

// SetDebCreditSelected ;
 SetLength(KeyArray,1);
 if not CreditGridHasFocus then
 begin    
       SetLength(KeyArray,cxDebitsDBBandedTableView1.Controller.SelectedRecordCount);
       for  i := 0 to cxDebitsDBBandedTableView1.Controller.SelectedRecordCount -1 do
        begin
         cxDebitsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
         KeyArray[i] := wwqryOpenDebits.FieldByName('WTransactionID').AsInteger ;
        // xAmount := xAmount+ wwqryOpenDebits.FieldByName('FoutStandingAmount').AsFloat;
        end
  end else
  begin

      SetLength(KeyArray,cxCreditsDBBandedTableView1.Controller.SelectedRecordCount);
      for  i := 0 to cxCreditsDBBandedTableView1.Controller.SelectedRecordCount -1 do
      begin
        cxCreditsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
       KeyArray[i] := wwqryOpenCredits.FieldByName('WTransactionID').AsInteger ;

       end
  end;




 TDataBaseLedgerRoutines.ClearLink(KeyArray);
 //TDataBaseLedgerRoutines.ClearLink(KeyArray);
 UnselectDebCredit ;


  if wwqryOpenDebits.Active then
     oldid :=  wwqryOpenDebitsWTRANSACTIONID.AsInteger else oldid := 0 ;
  if wwqryOpenCredits.Active then
     oldid2 :=  wwqryOpenCreditsWTRANSACTIONID.AsInteger else oldid := 0 ;

     ChangeQueries(Sender);

     wwqryOpenDebits.Filtered := False ;
     wwqryOpenDebits.Open;
     wwqryOpenCredits.Filtered := False ;
     wwqryOpenCredits.Open;


  wwqryOpenDebits.Locate('WTRANSACTIONID',OldId,[]);


  wwqryOpenCredits.Locate('WTRANSACTIONID',OldId2,[]);


end;

procedure TfmOpenLink.wwdbgDebitsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   if wwqryOpenDebitsBUNUSED.AsInteger = 1 then
     AFont.Style := [fsBold] else
     AFont.Style := [];
     if cbFindInvalideDetail.ItemIndex > 0 then
        if  wwqryOpenDebitsISLINKED.AsInteger > 0 then
         begin
         if wwqryOpenDebitsISLINKED.AsInteger = 1 then
            ABrush.Color := clOlive
         else
         if wwqryOpenDebitsISLINKED.AsInteger = 3 then
            ABrush.Color := clLtGray
         else
         ABrush.Color := clRed ;
         end;

end;

procedure TfmOpenLink.wwdbgCreditsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   if wwqryOpenCreditsBUNUSED.AsInteger = 1 then
     AFont.Style := [fsBold] else
     AFont.Style := [];
     if cbFindInvalideDetail.ItemIndex > 0 then
        if  wwqryOpenCreditsISLINKED.AsInteger > 0 then
        begin
         if wwqryOpenCreditsISLINKED.AsInteger = 1 then
            ABrush.Color := clOlive
         else
         if wwqryOpenCreditsISLINKED.AsInteger = 3 then
            ABrush.Color := clLtGray
         else
         ABrush.Color := clRed ;
         end;


end;

procedure TfmOpenLink.BClearClick(Sender: TObject);
begin
  EFilterValue.Text := '' ;
end;

procedure TfmOpenLink.gdStmtMainTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  zQMasterHist.IndexFieldNames := AFieldName ;
end;

procedure TfmOpenLink.BClearTransClick(Sender: TObject);
begin
EFilterValueTrans.Text := '' ;
end;

procedure TfmOpenLink.BExportTotalClick(Sender: TObject);
Var
 AStrings : TStringList ;
 i  : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
begin
 if not SaveDialog1.Execute then exit ;
 if not ZQAccountList.Active then
   BFilterClick(self) ; 

  AStrings := TStringList.Create ;
       try
 // add header
 AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2431) +#9+DateTimeToStr(Now)) ;
 AStrings.Add(cbAccountType.Items[0]+#9+BoolToStr(cbAccountType.Checked[0],true)) ;
 AStrings.Add(cbAccountType.Items[1]+#9+BoolToStr(cbAccountType.Checked[1],true)) ;
 AStrings.Add(cbAccountType.Items[2]+#9+BoolToStr(cbAccountType.Checked[2],true)) ;
 AStrings.Add('') ;


   for i := 0 to cxTotalsDBTableView1.ColumnCount -1 do
    if cxTotalsDBTableView1.Columns[i].VisibleForCustomization then
     begin
      if ZQAccountList.FindField(cxTotalsDBTableView1.Columns[i].DataBinding.FieldName) <> nil then
          AddLine  := AddLine + cxTotalsDBTableView1.Columns[i].Caption ;


        if i < cxTotalsDBTableView1.ColumnCount -1 then
           AddLine  := AddLine + #9 ;
     end ;
    AddLine  := AddLine + #9 + DMTCCoreLink.GetTextLangNoAmp(197)   + #9 + DMTCCoreLink.GetTextLangNoAmp(2220)   + #9 + DMTCCoreLink.GetTextLangNoAmp(2206) + #9 + DMTCCoreLink.GetTextLangNoAmp(187) + #9 + DMTCCoreLink.GetTextLangNoAmp(188) ;
    AStrings.Add( AddLine);

  ZQAccountList.first ;

  while not ZQAccountList.eof do
        begin
        AddLine := '' ;
   for i := 0 to cxTotalsDBTableView1.ColumnCount -1 do
    if cxTotalsDBTableView1.Columns[i].VisibleForCustomization then
           begin
            if ZQAccountList.FindField(cxTotalsDBTableView1.Columns[i].DataBinding.FieldName) <> nil then
                 begin
                  if cxTotalsDBTableView1.Columns[i].DataBinding.Field  = ZQAccountListSACCOUNTCODE then
                   AddLine  := AddLine +  TDataBaseRoutines.AccTypeToChar(ZQAccountListWACCOUNTTYPEID.AsInteger) + ZQAccountList.FindField(cxTotalsDBTableView1.Columns[i].DataBinding.FieldName).AsString
                  else
                  AddLine  := AddLine + ZQAccountList.FindField(cxTotalsDBTableView1.Columns[i].DataBinding.FieldName).AsString ;
                 end;




              if i < cxTotalsDBTableView1.ColumnCount -1 then
                 AddLine  := AddLine + #9 ;
           end ;
            ZQAccountData.close ;
            ZQAccountData.Params[0].AsInteger := ZQAccountListWACCOUNTID.AsInteger ;
            ZQAccountData.Params[1].AsInteger := ZQAccountListWACCOUNTID.AsInteger ;
            ZQAccountData.open ;

            AddLine  := AddLine + #9 + ZQAccountDataFIRSTNAME.AsString + #9 +
            ZQAccountDataSPOSTAL1.AsString + #9 +
            ZQAccountDataSPOSTAL2.AsString + #9 +
            ZQAccountDataSTELEPHONE1.AsString + #9 +
            ZQAccountDataSTELEPHONE2.AsString    ;

          AStrings.Add( AddLine);
          ZQAccountList.next ;
        end;

      AStrings.SaveToFile(SaveDialog1.FileName);
      AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
      ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);
        finally
         AStrings.Free ;
        end;
end;

procedure TfmOpenLink.BExporttransClick(Sender: TObject);
Var
 AStrings : TStringList ;
 i  : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
begin
 if not SaveDialog1.Execute then exit ;


  AStrings := TStringList.Create ;
       try
 // add header
 AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2431) +#9+DateTimeToStr(Now)) ;
 AStrings.Add(cbAccountTypeTrans.Items[0]+#9+BoolToStr(cbAccountTypeTrans.Checked[0],true)) ;
 AStrings.Add(cbAccountTypeTrans.Items[1]+#9+BoolToStr(cbAccountTypeTrans.Checked[1],true)) ;
 AStrings.Add(cbAccountTypeTrans.Items[2]+#9+BoolToStr(cbAccountTypeTrans.Checked[2],true)) ;
 AStrings.Add('') ;


   for i := 0 to cxTransDBTableView.ColumnCount -1 do
    if cxTransDBTableView.Columns[i].VisibleForCustomization then
     begin
      if ZQTranslist.FindField(cxTransDBTableView.Columns[i].DataBinding.FieldName) <> nil then
          AddLine  := AddLine + cxTransDBTableView.Columns[i].Caption ;


        if i < cxTransDBTableView.ColumnCount -1 then
           AddLine  := AddLine + #9 ;
     end ;
     AddLine  := AddLine + #9 + DMTCCoreLink.GetTextLangNoAmp(197)   + #9 + DMTCCoreLink.GetTextLangNoAmp(2220)   + #9 + DMTCCoreLink.GetTextLangNoAmp(2206) + #9 + DMTCCoreLink.GetTextLangNoAmp(187) + #9 + DMTCCoreLink.GetTextLangNoAmp(188) ;






    AStrings.Add( AddLine);

  ZQTranslist.first ;

  while not ZQTranslist.eof do
        begin
        AddLine := '' ;
         for i := 0 to cxTransDBTableView.ColumnCount -1 do
           begin
            if ZQTranslist.FindField(cxTransDBTableView.Columns[i].DataBinding.FieldName) <> nil then
               begin
                if cxTransDBTableView.Columns[i].DataBinding.Field = ZQTranslistSACCOUNTCODE  then
                AddLine  := AddLine +  TDataBaseRoutines.AccTypeToChar(ZQTranslistWACCOUNTTYPEID.AsInteger) + ZQTranslist.FindField(cxTransDBTableView.Columns[i].DataBinding.FieldName).AsString
                else
                AddLine  := AddLine + ZQTranslist.FindField(cxTransDBTableView.Columns[i].DataBinding.FieldName).AsString ;
               end;


              if i < cxTransDBTableView.ColumnCount -1 then
                 AddLine  := AddLine + #9 ;
           end ;
            ZQAccountData.close ;
            ZQAccountData.Params[0].AsInteger := ZQTranslistWACCOUNTID.AsInteger ;
            ZQAccountData.Params[1].AsInteger := ZQTranslistWACCOUNTID.AsInteger ;
            ZQAccountData.open ;

            AddLine  := AddLine + #9 + ZQAccountDataFIRSTNAME.AsString + #9 +
            ZQAccountDataSPOSTAL1.AsString + #9 +
            ZQAccountDataSPOSTAL2.AsString + #9 +
            ZQAccountDataSTELEPHONE1.AsString + #9 +
            ZQAccountDataSTELEPHONE2.AsString    ;
          AStrings.Add( AddLine);
          ZQTranslist.next ;
        end;

      AStrings.SaveToFile(SaveDialog1.FileName);
      AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
      ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);
        finally
         AStrings.Free ;
        end;
end;

procedure TfmOpenLink.cbFindInvalideDetailClick(Sender: TObject);
begin
  ChangeQueries(self);
  wwqryOpenDebits.Filtered := true ;
  wwqryOpenDebits.Open;
  wwqryOpenCredits.Filtered := true ;
  wwqryOpenCredits.Open;
 
end;
                                                                                                                                                    
procedure TfmOpenLink.SearchPanelDblClick(Sender: TObject);
begin
  if cbFindInvalideDetail.ItemIndex > 0 then
     begin
       wwqryOpenDebits.First ;
       while not wwqryOpenDebits.eof do
          begin
            if wwqryOpenDebitsISLINKED.AsInteger > 0 then
               TDataBaseLedgerRoutines.ClearLink([wwqryOpenDebitsWTRANSACTIONID.AsInteger]);
            wwqryOpenDebits.next ;
          end;
       wwqryOpenCredits.First ;
       while not wwqryOpenCredits.eof do
          begin
            if wwqryOpenCreditsISLINKED.AsInteger > 0 then
               TDataBaseLedgerRoutines.ClearLink([wwqryOpenCreditsWTRANSACTIONID.AsInteger]);
            wwqryOpenCredits.next ;
          end;
      wwqryOpenDebits.Close;
      wwqryOpenCredits.Close;
      wwqryOpenDebits.Open;
      wwqryOpenCredits.Open;

     end;
end;

procedure TfmOpenLink.wwqryOpenDebitsCalcFields(DataSet: TDataSet);
begin
  if cbFindInvalideDetail.ItemIndex < 1 then exit ;

  if cbFindInvalideDetail.ItemIndex = 1 then
    begin
      wwqryOpenDebitsISLINKED.AsInteger := TDataBaseLedgerRoutines.LinkCheck(wwqryOpenDebitsWTRANSACTIONID.AsInteger);
    end else
 if cbFindInvalideDetail.ItemIndex = 2 then
    begin
      wwqryOpenDebitsISLINKED.AsInteger := TDataBaseLedgerRoutines.CountLink(wwqryOpenDebitsWTRANSACTIONID.AsInteger);
    end else
 if cbFindInvalideDetail.ItemIndex = 3 then
    begin
      wwqryOpenDebitsISLINKED.AsInteger := 1 +ord((wwqryOpenDebitsFAMOUNT.AsFloat < wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat) or (wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat < 0 ));
    end else
 if cbFindInvalideDetail.ItemIndex = 4 then
    begin
      wwqryOpenDebitsISLINKED.AsInteger :=  OpenSqlAndGetFirtsColumnValue('select count(*) from OILINKSPRE where  WTRANSACTIONID = ' + IntToStr(wwqryOpenDebitsWTRANSACTIONID.AsInteger)) ;
    end;
end;

procedure TfmOpenLink.wwqryOpenCreditsCalcFields(DataSet: TDataSet);
begin
  if cbFindInvalideDetail.ItemIndex < 1 then exit ;
 if cbFindInvalideDetail.ItemIndex = 1 then
    begin
      wwqryOpenCreditsISLINKED.AsInteger := TDataBaseLedgerRoutines.LinkCheck(wwqryOpenCreditsWTRANSACTIONID.AsInteger);
    end else
 if cbFindInvalideDetail.ItemIndex = 2 then
    begin
      wwqryOpenCreditsISLINKED.AsInteger := TDataBaseLedgerRoutines.CountLink(wwqryOpenCreditsWTRANSACTIONID.AsInteger);
    end else
  if cbFindInvalideDetail.ItemIndex = 3 then
    begin
      wwqryOpenCreditsISLINKED.AsInteger := 1 +  ord((wwqryOpenCreditsFAMOUNT.AsFloat > wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat) or (wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat > 0 ));
    end else
 if cbFindInvalideDetail.ItemIndex = 4 then
    begin
      wwqryOpenCreditsISLINKED.AsInteger :=  OpenSqlAndGetFirtsColumnValue('select count(*) from OILINKSPRE where  WTRANSACTIONID = ' + IntToStr(wwqryOpenCreditsWTRANSACTIONID.AsInteger)) ;
    end;




end;

procedure TfmOpenLink.wwqryOpenCreditsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
 var
  i:Integer ;
begin
 Accept := true ;
 if cbFilter.Checked then
  if trim(edtAmtRef.Text) <> '' then
    begin
      accept := false ;
      for i := 1 to wwqryOpenCredits.FieldCount -1 do
      begin
        accept := POS(trim(edtAmtRef.Text),uppercase(wwqryOpenCredits.fields[i].asstring)) > 0 ;
        if accept then break ;
      end ;
    end;

  if  cbFindInvalideDetail.ItemIndex > 0 then
    if cbFilter.Checked then
    begin
     if cbFindInvalideDetail.ItemIndex = 1 then
        begin
          Accept := TDataBaseLedgerRoutines.LinkCheck(wwqryOpenCreditsWTRANSACTIONID.AsInteger) > 0;
        end;
     if cbFindInvalideDetail.ItemIndex = 2 then
        begin
          Accept := TDataBaseLedgerRoutines.CountLink(wwqryOpenCreditsWTRANSACTIONID.AsInteger) > 0 ;
        end;
     if cbFindInvalideDetail.ItemIndex = 3 then
        begin
          Accept := (wwqryOpenCreditsFAMOUNT.AsFloat > wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat) or (wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat > 0 );
        end;
    end;
end;

procedure TfmOpenLink.wwqryOpenDebitsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
 var
  i:Integer ;
begin
 Accept := true ;
 if cbFilter.Checked then
  if trim(edtAmtRef.Text) <> '' then
    begin
      accept := false ;
      for i := 1 to wwqryOpenDebits.FieldCount -1 do
       begin
        accept := POS(trim(edtAmtRef.Text),uppercase(wwqryOpenDebits.fields[i].asstring)) > 0 ;
        if accept then break ;
       end; 
    end;

  if  cbFindInvalideDetail.ItemIndex > 0 then
      if cbFilter.Checked then
    begin
     if cbFindInvalideDetail.ItemIndex = 1 then
        begin
          Accept := TDataBaseLedgerRoutines.LinkCheck(wwqryOpenDebitsWTRANSACTIONID.AsInteger) > 0;
        end;
     if cbFindInvalideDetail.ItemIndex = 2 then
        begin
          Accept := TDataBaseLedgerRoutines.CountLink(wwqryOpenDebitsWTRANSACTIONID.AsInteger) > 0 ;
        end;
     if cbFindInvalideDetail.ItemIndex = 3 then
        begin
          Accept := (wwqryOpenDebitsFAMOUNT.AsFloat < wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat) or (wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat < 0 );
        end;
    end;
end;

procedure TfmOpenLink.cbFilterClick(Sender: TObject);
begin
  ChangeQueries(self);
  wwqryOpenDebits.Filtered := true ;
  wwqryOpenDebits.Open;
  wwqryOpenCredits.Filtered := true ;
  wwqryOpenCredits.Open;
 
end;

procedure TfmOpenLink.Checkselected1Click(Sender: TObject);
Var
  i : Integer ;
begin
 if not CreditGridHasFocus then
 begin
   for  i := 0 to cxDebitsDBBandedTableView1.Controller.SelectedRecordCount -1 do
    begin
      cxDebitsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;

      wwqryOpenDebits.Edit ;
      wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
      wwqryOpenDebits.Post ;
     end;
  end else
  begin
  for  i := 0 to cxCreditsDBBandedTableView1.Controller.SelectedRecordCount -1 do
    begin
     cxCreditsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
     wwqryOpenCredits.Edit ;
     wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
     wwqryOpenCredits.Post ;
    end
 end;
end;

procedure TfmOpenLink.Uncheckselected1Click(Sender: TObject);
Var
  i : Integer ;
begin
 if not CreditGridHasFocus then
 begin
   for  i := 0 to cxDebitsDBBandedTableView1.Controller.SelectedRecordCount -1 do
    begin
      cxDebitsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;

      wwqryOpenDebits.Edit ;
      wwqryOpenDebitsBUNUSED.AsInteger := 0 ;
      wwqryOpenDebits.Post ;
     end;
  end else
  begin
  for  i := 0 to cxCreditsDBBandedTableView1.Controller.SelectedRecordCount -1 do
    begin
     cxCreditsDBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
     wwqryOpenCredits.Edit ;
     wwqryOpenCreditsBUNUSED.AsInteger := 0 ;
     wwqryOpenCredits.Post ;
    end
 end;
end;


procedure TfmOpenLink.edtAmtRefChange(Sender: TObject);
begin
 if cbFilter.Checked then
    begin
      wwqryOpenCredits.Refresh ;
      wwqryOpenDebits.Refresh ;
    end;
end;

procedure TfmOpenLink.btnRemoveFaultsClick(Sender: TObject);
var
 Aprogres : TfmNewProgress ;
begin
 Aprogres := TfmNewProgress.Create(Self) ;
 try
 Aprogres.initProgress(btnRemoveFaults.Caption,ZQAccountList.RecordCount );
 Aprogres.BtnStop.Visible := True ;


 if cbShowColors.Checked then
   begin
     edtAmtRef.Text := '' ;
     cbFindInvalideDetail.ItemIndex := 1 ;
     cbFilter.Checked := True ;

    cbFindInvalideDetail.ItemIndex := 1 ;
    ZQAccountList.first ;
     While not  ZQAccountList.eof do
        begin
         Aprogres.SetProgress('',ZQAccountList.RecNo);
         if Aprogres.bStop then
          Raise Exception.Create(DMTCCoreLink.GetTextLang(3370));

           if  ZQAccountListCHECKSTATUS.AsInteger = 1 then
              begin
                 aAccInfo.WAccountID := ZQAccountListWACCOUNTID.AsInteger  ;
                 unlinkdown  := false ;
                 BtnUnlinkClick(self) ;
                 SearchPanelDblClick(self);
                 unlinkdown  := true ;
                 BtnUnlinkClick(self) ;
                 SearchPanelDblClick(self);
              end;
           ZQAccountList.next ;
        end;

     edtAmtRef.Text := '' ;
     cbFindInvalideDetail.ItemIndex := 0 ;
     cbFilter.Checked := False ;
   end;
  BFilterClick(self);




   finally
      Aprogres.free  ;
   end;
end;


procedure TfmOpenLink.TUpdateTimer(Sender: TObject);
Var
 Id :Integer ;
 ACap : String ;

begin
TUpdate.Enabled := false ;
     Panel1.Caption := DMTCCoreLink.GetTextLang(211);//Debits 211
     Panel2.Caption := DMTCCoreLink.GetTextLang(212);//Credits 212

     if not wwqryOpenDebits.IsEmpty then
     begin
     tblBankDnl.sql.text := 'Select * from  DNLBANKS where WTCTRANSID =  ' + IntToStr(wwqryOpenDebitsWTRANSACTIONID.asinteger) ;
     tblBankDnl.open ;
     if not tblBankDnl.IsEmpty then
       begin
          Panel1.Caption := TDataBaseStringRoutines.StripEnterLinefeed(tblBankDnlSDESCRIPTION.AsString + tblBankDnlSMEMO.AsString + tblBankDnlSEXTRADESCRIPTION.AsString);
       end else
       begin
         Id := TDataBaseDocumentRoutines.GetDocIdFromTransactId( wwqryOpenDebitsWTRANSACTIONID.AsInteger);
         if Id <> 0  then
            Panel1.Caption := TDataBaseDocumentRoutines.GetDocNo(Id) + ' ' + TDataBaseDocumentRoutines.GetDocExtReference(Id)  ;



       end;
     tblBankDnl.close ;
     end;

     if not wwqryOpenCredits.IsEmpty then
     begin

     tblBankDnl.sql.text := 'Select * from  DNLBANKS where WTCTRANSID =  ' + IntToStr(wwqryOpenCreditsWTRANSACTIONID.asinteger) ;
     tblBankDnl.open ;
     if not tblBankDnl.IsEmpty then
       begin
          Panel2.Caption := TDataBaseStringRoutines.StripEnterLinefeed(tblBankDnlSDESCRIPTION.AsString + tblBankDnlSMEMO.AsString + tblBankDnlSEXTRADESCRIPTION.AsString);
       end else
       begin
         Id := TDataBaseDocumentRoutines.GetDocIdFromTransactId( wwqryOpenCreditsWTRANSACTIONID.AsInteger);
         if Id <> 0  then
            Panel2.Caption := TDataBaseDocumentRoutines.GetDocNo(Id) + ' ' + TDataBaseDocumentRoutines.GetDocExtReference(Id)  ;
 
       end;
     tblBankDnl.close ;
    end;
end;

procedure TfmOpenLink.wwqryOpenCreditsAfterScroll(DataSet: TDataSet);
begin
  TUpdate.Enabled := false ;
  TUpdate.Enabled := True ;
end;

procedure TfmOpenLink.wwqryOpenDebitsAfterScroll(DataSet: TDataSet);
begin
  TUpdate.Enabled := false ;
  TUpdate.Enabled := True ;
end;

procedure TfmOpenLink.wwqryOpenCreditsBeforeOpen(DataSet: TDataSet);
begin
   wwqryOpenCreditsSDESCRIPTION.Size := DMTCCoreLink.MessageLength ;
   dtSelAmt := 0 ;

end;

procedure TfmOpenLink.wwqryOpenDebitsBeforeOpen(DataSet: TDataSet);
begin
  wwqryOpenDebitsSDESCRIPTION.Size := DMTCCoreLink.MessageLength ;
  ctSelAmt := 0 ;  
end;

procedure TfmOpenLink.Adjustpaymentdate1Click(Sender: TObject);
var
 AForm : TFormReportingDates ;
begin
 if not ZQTranslist.IsEmpty then
   begin
    AForm := TFormReportingDates.create(self) ;

    AForm.OnShow := nil ;
    AForm.BitBtn1.OnClick := nil ;
    AForm.EStockCode.Visible := false ;
    AForm.BitBtn1.ModalResult := mrOk ;
    AForm.Label1.Visible := false ;
    AForm.BBInput.Visible := false ;
    AForm.Caption := DMTCCoreLink.GetTextLang(3344);
    AForm.LFromdate.Caption := DMTCCoreLink.GetTextLang( 2010);
    AForm.LToDate.Caption :=  DMTCCoreLink.GetTextLang(1932);

    AForm.DTFromdate.DateTime := ZQTranslistDPAYMENTDATE.AsDateTime ;
    AForm.DTFromdate.Enabled := false ;
    AForm.DTToDate.DateTime := ZQTranslistDPAYMENTDATE.AsDateTime ;
    If AForm.ShowModal = mrok then
       begin
          ExecSql('Update transact set DPAYMENTDATE=' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(AForm.DTToDate.DateTime) +' where WtransactionID = ' + ZQTranslistWTRANSACTIONID.AsString );
          BFilterTransClick(self);
       end;
   end;
end;

procedure TfmOpenLink.EFilterValueTransKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
  BFilterTransClick(self);
end;

procedure TfmOpenLink.EFilterValueKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  BFilterClick(self);

end;

procedure TfmOpenLink.Recievepayment1Click(Sender: TObject);
Var
  SrcTrans,DestTrans:integer;
  xAmount,yAmount:Real;
  i : Integer ;
  KeyArray,KeyArrayPAy  : variant ;

  FilterText : String ;
begin
   SrcTrans := 0 ;
   xAmount := 0 ;
    KeyArray := VarArrayOf([9999999]) ;
    KeyArrayPAy := VarArrayOf([9999999]) ;
   SrcTrans:= ZQTranslist.FieldByName('WTransactionID').AsInteger;
   KeyArray[0] := SrcTrans ;
   aAccInfo.WAccountID := ZQTranslistWACCOUNTID.AsInteger ;
   aAccInfo.WAccountTypeID := ZQTranslistWACCOUNTTYPEID.AsInteger ;
   aAccInfo.SACCOUNTCODE := ZQTranslistSACCOUNTCODE.AsString ;
   aAccInfo.SDescription := ZQTranslistSACCOUNTDESCRIPTION.AsString ;
   xAmount := ZQTranslistTOTALOPEN.AsFloat;
   DestTrans := AutoReceivePymt(aAccInfo,SrcTrans,ZQTranslistSREFERENCE.AsString,xAmount);
   KeyArrayPAy[0] := DestTrans ;
      // check for the report
   if FileExists(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep') then

   begin
       if Printreciept and (DestTrans <> -1) then
         begin
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(KeyArrayPAy,True,2);
            TDatabaseTableRoutines.DumpToReportmanTransportOfarray(KeyArray,false);


            ExecReport(DMTCCoreLink.GetLocalPluginDir +'reports\GENERAL\documents\payments.rep');

         end;
   end  ;


   BFilterTransClick(self);
end;

procedure TfmOpenLink.Undolastlink1Click(Sender: TObject);
var
 transId : Integer ;
begin
  if sender <> nil then
   if OSFMessageDlg(DMTCCoreLink.GetTextLang(722){'Warning, if you click yes you will lose all your current links for this account.'}, mtconfirmation, [mbyes, mbno], 0) = mrno then
   exit ;
   // check to see if nny have no links and remove that
   qGen.SQL.Text := 'Select * from transact a where not exists(select * from OILINKS b where' +
   ' (a.WTRANSACTIONID = b.WAMOUNTTRANSACTIONID or a.WTRANSACTIONID = b.WLINKTRANSACTIONID) and b.WBATCHID =-1)' +
   ' and a.FAMOUNT <> a.FOUTSTANDINGAMOUNT and a.Waccountid = '+  IntToStr(aAccInfo.WAccountID)  ;
   qGen.Open ;
   if not qGen.IsEmpty then
      begin

         TDataBaseLedgerRoutines.ClearLink([qGen.FieldByName('WTRANSACTIONID').AsInteger]) ;
         qGen.next ;

      end;
   transId := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WOILINKSID) from OILINKS where WAccountid = ' + IntToStr(aAccInfo.WAccountID) )),0) ;
   transId := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WAMOUNTTRANSACTIONID) from OILINKS where WOILINKSID = ' + IntToStr(transId) )),0) ;
   if transId <> 0 then
   TDataBaseLedgerRoutines.ClearLink([transId])
   else
   TDataBaseLedgerRoutines.cleanupLink(aAccInfo.WAccountID) ;
   ChangeQueries(Sender);

   wwqryOpenDebits.Open;
   wwqryOpenCredits.Open;
 


end;

procedure TfmOpenLink.Autoreversetillvalide1Click(Sender: TObject);
var
 Aprogres : TfmNewProgress ;
begin
 Aprogres := TfmNewProgress.Create(Self) ;
 try
 Aprogres.initProgress(DMTCCoreLink.GetTextLang(1255),ZQAccountList.RecordCount );
 Aprogres.BtnStop.Visible := True ;
 ZQAccountList.First ;
  if ZQAccountList.IsEmpty then exit ;

  while not ZQAccountList.eof do
  begin
   Aprogres.SetProgress('',ZQAccountList.RecNo+1);
   if Aprogres.bStop then
    Raise Exception.Create(DMTCCoreLink.GetTextLang(3370));
   if (ZQAccountListCHECKSTATUS.AsInteger in [0,2,3]) then
      begin
        ZQAccountList.Next ;
        Continue ;
      end;
   DBGSearchDblClick(self);
   Undolastlink1Click(nil);

   //CreateBBFLinks( ZQAccountListWACCOUNTID.AsInteger,0,Date+300,false,True) ;
   ZQAccountList.next ;
  end;
  pcMain.ActivePageIndex := 1 ;
  BFilterClick(self);
   finally
      Aprogres.free  ;
   end;
end;


procedure TfmOpenLink.Automatchexactamounts1Click(Sender: TObject);
var
 Aprogres : TfmNewProgress ;
begin
 Aprogres := TfmNewProgress.Create(Self) ;
 try
 Aprogres.initProgress(DMTCCoreLink.GetTextLang(1255),ZQAccountList.RecordCount );
 Aprogres.BtnStop.Visible := True ;
 ZQAccountList.First ;
  if ZQAccountList.IsEmpty then exit ;

  while not ZQAccountList.eof do
  begin
   Aprogres.SetProgress('',ZQAccountList.RecNo+1);
   if Aprogres.bStop then
    Raise Exception.Create(DMTCCoreLink.GetTextLang(3370));
   if (ZQAccountListCHECKSTATUS.AsInteger in [0,1,3]) then
      begin
        ZQAccountList.Next ;
        Continue ;
      end;
   DBGSearchDblClick(self);
   Debitpercentmatch1Click(self);
   Finddebin2crforalldeb1Click(self);
   Finddebin2crforalldeb1Click(self);

   //CreateBBFLinks( ZQAccountListWACCOUNTID.AsInteger,0,Date+300,false,True) ;
   ZQAccountList.next ;
  end;
  pcMain.ActivePageIndex := 1 ;
  BFilterClick(self);
   finally
      Aprogres.free  ;
   end;
end;

procedure TfmOpenLink.Unlinktilvalide1Click(Sender: TObject);
begin
 if sender <> nil then
   if OSFMessageDlg(DMTCCoreLink.GetTextLang(722){'Warning, if you click yes you will lose all your current links for this account.'}, mtconfirmation, [mbyes, mbno], 0) = mrno then
   exit ;

if not unlinkdown then
  BtnUnlinkClick(self);
 while ((dtAmt - dtOutAmt) <> (-(CtAmt - CtOutAmt))) do
  begin
  Undolastlink1Click(nil);
  Application.ProcessMessages ;
  end;
end;

procedure TfmOpenLink.Finddebin3amts1Click(Sender: TObject);
Type
 TMyType = array[0..1] of double ;
var
 Aarray : array of TMyType ;
 i,x ,y,Foundi,Foundx,Foundy: Integer ;
begin

 if wwqryOpenCredits.IsEmpty then exit ;


 if wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat = 0 then exit ;

 wwqryOpenDebits.DisableControls;
 try
 wwqryOpenDebits.first ;
 SetLength( Aarray,wwqryOpenDebits.RecordCount+2);
 i := 0 ;
 while not wwqryOpenDebits.eof do
   begin
     Aarray[i][0] := wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
     Aarray[i][1] := wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat ;
     inc(i);
     if high(Aarray) < i then
       SetLength( Aarray,i+2);
     wwqryOpenDebits.next ;
   end;
   Foundi := -1 ;
   Foundx := -1 ;
   Foundy := -1 ;
   try
for i := 0 to high(Aarray) do
   begin
     for x := i+1 to high(Aarray) do
       begin
         for y := x+1 to high(Aarray) do
           begin
             if Round((Aarray[i][1] +  Aarray[x][1]  +  Aarray[y][1]) * 100) =  round(-wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat *100) then
               begin
                  Foundi := i ;
                  Foundx := x ;
                  Foundy := y ;
                  abort ;
               end;
           end;
      end;
   end;
  except

  end;
 if Foundi <> -1 then
   begin
    wwqryOpenCredits.edit ;
    wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
    wwqryOpenCredits.Post ;

    if wwqryOpenDebits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundi][0]),[] ) then
      begin
         wwqryOpenDebits.edit ;
         wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
         wwqryOpenDebits.Post ;

      end;
    if wwqryOpenDebits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundx][0]),[] ) then
      begin
         wwqryOpenDebits.edit ;
         wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
         wwqryOpenDebits.Post ;

      end;
    if wwqryOpenDebits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundy][0]),[] ) then
      begin
         wwqryOpenDebits.edit ;
         wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
         wwqryOpenDebits.Post ;
 
      end;
  end;
  finally
    wwqryOpenDebits.EnableControls ;
  end;
end;


procedure TfmOpenLink.FinddebinXamts(Sender: TObject);
Type
 TMyType = array[0..2] of double ;
var
 Aarray : array of TMyType ;
 i,x ,y,Foundi,Foundx,Foundy: Integer ;
 Oldproc : boolean ;
 Function GetTotalFromArray : Currency ;
 var Z : Integer ;
 begin
  result := 0 ;
   For z := low(Aarray) to high(Aarray) do
    if Aarray[z][2] <> 0 then
      result := result - Aarray[z][1] ;
 end;
  procedure unselect ;
 var Z : Integer ;
 begin

   For z := low(Aarray) to high(Aarray) do
    Aarray[z][2] := 0 ;
 end;
 procedure SetNextCheck ;
 var Z : Integer ;
  MaxITers,S,LS : Int64 ;
  ATotalResult,ASearchResult : Currency ;
 begin
  ASearchResult :=   wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat ;
   For z := low(Aarray) to high(Aarray)-1 do
    begin
       unselect ;
       Aarray[z][2] := 1 ;
       MaxITers := high(Aarray) -(z) ;

       MaxITers :=  round(Power(2,MaxITers)) -1  ;
       if
       MaxITers > 100000000 then
         MaxITers := 100000000 ;

       s := 0 ;
       while s <=  MaxITers do
         begin
           ls := z +1 ;
           if Aarray[ls][2] = 0 then
             Aarray[ls][2] := 1 else
             begin
              while Aarray[ls][2] = 1 do
                begin
                  Aarray[ls][2] := 0 ;
                  inc(ls) ;
                  if ls = high(Aarray) then
                  begin
                    break ;
                   end; 
                end;
              Aarray[ls][2] := 1 ;
             end;
           ATotalResult := GetTotalFromArray ;
          if Trunc((ATotalResult * 1000) / 10) = TRUNC((ASearchResult * 1000)/  10) then
           begin
            exit ;
            
           end;
          inc(s);
         end;

    end;
 end;

begin
 Oldproc := bInAutoProcess ;
 bInAutoProcess := true ;
 try
 if wwqryOpenDebits.IsEmpty then exit ;


 if wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat = 0 then exit ;

 wwqryOpenCredits.DisableControls;
 try
 wwqryOpenCredits.first ;
 SetLength( Aarray,wwqryOpenCredits.RecordCount+2);
 i := 0 ;
 while not wwqryOpenCredits.eof do
   begin

    if abs(wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat) >= ABS(wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat) then
     begin
     Aarray[i][0] := wwqryOpenCreditsWTRANSACTIONID.AsInteger ;
     Aarray[i][1] := wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat ;
     Aarray[i][2] := 0 ;
     inc(i);
     if high(Aarray) < i then
       SetLength( Aarray,i+2);
     end;
     wwqryOpenCredits.next ;
   end;

  SetLength( Aarray,i);
  SetNextCheck ;
  if Trunc((GetTotalFromArray * 1000) / 10) = TRUNC((wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat * 1000)/  10) then
   begin
    wwqryOpenDebits.edit ;
    wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
    wwqryOpenDebits.Post ;

    for i := low(Aarray) to high(Aarray) do
    if Aarray[i][2] = 1 then
    if wwqryOpenCredits.Locate('WTRANSACTIONID',Trunc(Aarray[i][0]),[] ) then
      begin
         wwqryOpenCredits.edit ;
         wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
         wwqryOpenCredits.Post ;
 
      end;
  end;
  finally
    wwqryOpenCredits.EnableControls ;
  end;
  finally
   bInAutoProcess := Oldproc ;
  end;
end;

procedure TfmOpenLink.Findcrin2amts1Click(Sender: TObject);
Type
 TMyType = array[0..1] of double ;
var
 Aarray : array of TMyType ;
 i,x ,y,Foundi,Foundx,Foundy: Integer ;
 Oldproc : boolean ;
begin
 Oldproc := bInAutoProcess ;
 bInAutoProcess := true ;
 try
 if wwqryOpenDebits.IsEmpty then exit ;


 if wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat = 0 then exit ;

 wwqryOpenCredits.DisableControls;
 try
 wwqryOpenCredits.first ;
 SetLength( Aarray,wwqryOpenCredits.RecordCount+2);
 i := 0 ;
 while not wwqryOpenCredits.eof do
   begin
     Aarray[i][0] := wwqryOpenCreditsWTRANSACTIONID.AsInteger ;
     Aarray[i][1] := wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat ;
     inc(i);
     if high(Aarray) < i then
       SetLength( Aarray,i+2);
     wwqryOpenCredits.next ;
   end;
   Foundi := -1 ;
   Foundx := -1 ;
   Foundy := -1 ; 
  try
for i := 0 to high(Aarray) do
   begin
     for x := i+1 to high(Aarray) do
       begin
         for y := x+1 to high(Aarray) do
           begin
             if Round((Aarray[i][1] +  Aarray[x][1]  +  Aarray[y][1]) * 100) =  round(-wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat *100) then
               begin
                  Foundi := i ;
                  Foundx := x ;
                  Foundy := y ;
                  Abort ;
               end;
           end;
      end;
   end;
   except

   end;

 if Foundi <> -1 then
   begin
    wwqryOpenDebits.edit ;
    wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
    wwqryOpenDebits.Post ;

    if wwqryOpenCredits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundi][0]),[] ) then
      begin
         wwqryOpenCredits.edit ;
         wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
         wwqryOpenCredits.Post ;

      end;
    if wwqryOpenCredits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundx][0]),[] ) then
      begin
         wwqryOpenCredits.edit ;
         wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
         wwqryOpenCredits.Post ;

      end;
    if wwqryOpenCredits.Locate('WTRANSACTIONID',Trunc(Aarray[Foundy][0]),[] ) then
      begin
         wwqryOpenCredits.edit ;
         wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
         wwqryOpenCredits.Post ;
 
      end;
  end;
  finally
    wwqryOpenCredits.EnableControls ;
  end;
  finally
   bInAutoProcess := Oldproc ;
  end;
end;

procedure TfmOpenLink.Finddebin2crforalldeb1Click(Sender: TObject);
Var
 Lastid : Integer ;
begin
bInAutoProcess := true ;
try
cbFindInvalideDetail.ItemIndex := 0 ;
UnselectDebCredit ;

  if sender = Autolinkcredto13deb then
   begin
      wwqryOpenCredits.IndexFieldNames := 'WTRANSACTIONID' ;
 wwqryOpenCredits.First ;
 while not wwqryOpenCredits.eof do
   begin

       Finddebin3amts1Click(self) ;

      Lastid := wwqryOpenCreditsWTRANSACTIONID.AsInteger ;
      if  wwqryOpenCreditsBUNUSED.AsInteger = 1 then
         begin
           SetDebCreditSelected ;
            try
              LinkAcc(Sender,0,True);
            finally
             UnselectDebCredit ;
            end;
            while (not wwqryOpenCredits.Eof) and(wwqryOpenCreditsWTRANSACTIONID.AsInteger <= Lastid) do
              wwqryOpenCredits.next ;

         end else
     wwqryOpenCredits.next ;
   end;
 wwqryOpenCredits.IndexFieldNames := '' ;
   end else
   begin
 wwqryOpenDebits.IndexFieldNames := 'WTRANSACTIONID' ;
 wwqryOpenDebits.First ;
 while not wwqryOpenDebits.eof do
   begin

      Findcrin2amts1Click(self);
      Lastid := wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
      if  wwqryOpenDebitsBUNUSED.AsInteger = 1 then
         begin
           SetDebCreditSelected ;
            try
              LinkAcc(Sender,0,True);
            finally
             UnselectDebCredit ;
            end;
            while (not wwqryOpenDebits.Eof) and(wwqryOpenDebitsWTRANSACTIONID.AsInteger <= Lastid) do
              wwqryOpenDebits.next ;

         end else
     wwqryOpenDebits.next ;
   end;
 wwqryOpenDebits.IndexFieldNames := '' ;
 end;
 finally
   bInAutoProcess := False ;
 end;
end;

procedure TfmOpenLink.Debitpercentmatch1Click(Sender: TObject);
var
 Percent : Double ;
 Lastid : Integer ;
begin
 bInAutoProcess := true ;
 try
 Percent := DMTCCoreLink.ReadSysParam(70,'OPENITEMMATCHPERC',0) ;
 wwqryOpenDebits.IndexFieldNames := 'WTRANSACTIONID' ;
 wwqryOpenDebits.First ;
 while not wwqryOpenDebits.eof do
   begin

      MatchDebOnPercent(Percent);
      Lastid := wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
      if  wwqryOpenDebitsBUNUSED.AsInteger = 1 then
         begin
           SetDebCreditSelected ;
            try
              LinkAcc(Sender,0,True);
            finally
             UnselectDebCredit ;
            end;
            while (not wwqryOpenDebits.Eof) and(wwqryOpenDebitsWTRANSACTIONID.AsInteger <= Lastid) do
              wwqryOpenDebits.next ;

         end else
     wwqryOpenDebits.next ;
   end;
 wwqryOpenDebits.IndexFieldNames := '' ;
 finally
   bInAutoProcess := False ;
 end;
end;


procedure TfmOpenLink.MatchDebOnPercent(APercent : Double);

begin

 if wwqryOpenDebits.IsEmpty then exit ;


 if wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat = 0 then exit ;

 wwqryOpenCredits.DisableControls;
 try
 wwqryOpenCredits.first ;
 while not wwqryOpenCredits.eof do
   begin
     if Round(wwqryOpenCreditsFOUTSTANDINGAMOUNT.AsFloat *100) =   round(-wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat * APercent) then
       begin
        wwqryOpenDebits.edit ;
        wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
        wwqryOpenDebits.Post ;
        wwqryOpenCredits.edit ;
        wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
        wwqryOpenCredits.Post ;

        break ;
       end ;
     wwqryOpenCredits.next ;
   end;
  finally
    wwqryOpenCredits.EnableControls ;
  end;
end;

{ twf_TfmOpenLink }

constructor twf_TfmOpenLink.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'openitem';
  Description := 'Openitem screen set boolean ISCREDITOR , ISDEBTOR , ISLEDGER for list type set ISTOTALS to determain Start Tab FILTERFIELDINDEX and FILTER allows you to set the filtering.';
  with Inparams.Add as TParam do
     begin
        Name := 'ISCREDITOR' ;
        DataType := ftBoolean ;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ISDEBTOR' ;
        DataType := ftBoolean ;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ASLOOKUP' ;
        DataType := ftBoolean;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FINDINVALIDE' ;
        DataType := ftBoolean;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ISLEDGER' ;
        DataType := ftBoolean ;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ISTOTALS' ;
        DataType := ftBoolean ;
        Value := false ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FILTERFIELDINDEX' ;
        DataType := ftinteger ;
        Size := 255 ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FILTER' ;
        DataType := ftstring ;
        Size := 255 ;
        Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TfmOpenLink.WorkflowEnd(AForm: TForm);
begin
  inherited;
  AForm.Free ;
end;

function twf_TfmOpenLink.WorkFlowStart: TForm;
begin
 result := TfmOpenLink.Create(self);
  try
      with Result as TfmOpenLink do
    begin
        aslookup := Inparams.ParamByName('ASLOOKUP').AsBoolean ;
        parent := self.parent ;
        Align := alClient ;
        BorderStyle := bsNone ;
        Show ;
        if Inparams.ParamByName('ISTOTALS').AsBoolean  then
          begin
            pcLijst.ActivePage := tsTotals ;
            cbAccountType.Checked[0] := Inparams.ParamByName('ISLEDGER').AsBoolean ;
            cbAccountType.Checked[1] := Inparams.ParamByName('ISDEBTOR').AsBoolean ;
            cbAccountType.Checked[2] := Inparams.ParamByName('ISCREDITOR').AsBoolean ;
            cbFindInvalide.Checked := Inparams.ParamByName('FINDINVALIDE').AsBoolean ;
            CBFindColumn.ItemIndex :=  Inparams.ParamByName('FILTERFIELDINDEX').AsInteger ;
            EFilterValue.Text :=  Inparams.ParamByName('FILTER').AsString ;
            BFilterClick(self);
          end else
          begin
            pcLijst.ActivePage := tsTransactions ;
            cbAccountTypeTrans.Checked[0] := Inparams.ParamByName('ISLEDGER').AsBoolean ;
            cbAccountTypeTrans.Checked[1] := Inparams.ParamByName('ISDEBTOR').AsBoolean ;
            cbAccountTypeTrans.Checked[2] := Inparams.ParamByName('ISCREDITOR').AsBoolean ;
            CBFindColumnTrans.ItemIndex :=  Inparams.ParamByName('FILTERFIELDINDEX').AsInteger ;
            EFilterValueTrans.Text :=  Inparams.ParamByName('FILTER').AsString ;
            BFilterTransClick(self);
          end;
      end;


      if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;
               
  except

  end;
end;
procedure TfmOpenLink.Autolink1debXcreds1Click(Sender: TObject);
Var
 Lastid : Integer ;
begin
bInAutoProcess := true ;
try
cbFindInvalideDetail.ItemIndex := 0 ;
UnselectDebCredit ;



 wwqryOpenDebits.IndexFieldNames := 'WTRANSACTIONID' ;
 wwqryOpenDebits.First ;
 while not wwqryOpenDebits.eof do
   begin

      FinddebinXamts(self);
      Lastid := wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
      if  wwqryOpenDebitsBUNUSED.AsInteger = 1 then
         begin
           SetDebCreditSelected ;
            try
              LinkAcc(Sender,0,True);
            finally
             UnselectDebCredit ;
            end;
            while (not wwqryOpenDebits.Eof) and(wwqryOpenDebitsWTRANSACTIONID.AsInteger <= Lastid) do
              wwqryOpenDebits.next ;

         end else
     wwqryOpenDebits.next ;
   end;
 wwqryOpenDebits.IndexFieldNames := '' ;
 
 finally
   bInAutoProcess := False ;
 end;
end;




procedure TfmOpenLink.Automatch1debittoXcreditslow1Click(Sender: TObject);
var
 Aprogres : TfmNewProgress ;
begin
 Aprogres := TfmNewProgress.Create(Self) ;
 try
 Aprogres.initProgress(DMTCCoreLink.GetTextLang(1255),ZQAccountList.RecordCount );
 Aprogres.BtnStop.Visible := True ;
 ZQAccountList.First ;
  if ZQAccountList.IsEmpty then exit ;

  while not ZQAccountList.eof do
  begin
   Aprogres.SetProgress('',ZQAccountList.RecNo+1);
   if Aprogres.bStop then
    Raise Exception.Create(DMTCCoreLink.GetTextLang(3370));
   if (ZQAccountListCHECKSTATUS.AsInteger in [0,1,3]) then
      begin
        ZQAccountList.Next ;
        Continue ;
      end;
   DBGSearchDblClick(self);
   Autolink1debXcreds1Click(self);

   //CreateBBFLinks( ZQAccountListWACCOUNTID.AsInteger,0,Date+300,false,True) ;
   ZQAccountList.next ;
  end;
  pcMain.ActivePageIndex := 1 ;
  BFilterClick(self);
   finally
      Aprogres.free  ;
   end;
end;

procedure TfmOpenLink.Autoreversetillvalideslow1Click(Sender: TObject);
var
 Aprogres : TfmNewProgress ;
begin
 Aprogres := TfmNewProgress.Create(Self) ;
 try
 Aprogres.initProgress(DMTCCoreLink.GetTextLang(1255),ZQAccountList.RecordCount );
 Aprogres.BtnStop.Visible := True ;
 ZQAccountList.First ;
  if ZQAccountList.IsEmpty then exit ;

  while not ZQAccountList.eof do
  begin
   Aprogres.SetProgress('',ZQAccountList.RecNo+1);
   if Aprogres.bStop then
    Raise Exception.Create(DMTCCoreLink.GetTextLang(3370));
   if (ZQAccountListCHECKSTATUS.AsInteger in [0,2,3]) then
      begin
        ZQAccountList.Next ;
        Continue ;
      end;
   DBGSearchDblClick(self);
   Unlinktilvalide1Click(nil);

   //CreateBBFLinks( ZQAccountListWACCOUNTID.AsInteger,0,Date+300,false,True) ;
   ZQAccountList.next ;
  end;
  pcMain.ActivePageIndex := 1 ;
  BFilterClick(self);
   finally
      Aprogres.free  ;
   end;
end;

procedure TfmOpenLink.pcLijstChange(Sender: TObject);
begin
 if pcLijst.ActivePage = tsTempLinkedoff then
    begin
      ZQUnprocessedLinks.close ;
      ZQUnprocessedLinks.Open ;

    end;
end;

procedure TfmOpenLink.DBGridunpostedTitleClick(Column: TColumn);
begin
  if TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames <>  Column.FieldName then
    TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames :=  Column.FieldName
    else
    TuniQuery(Column.Grid.DataSource.DataSet).IndexFieldNames :=  Column.FieldName + ' desc' ;
end;

procedure TfmOpenLink.Delete1Click(Sender: TObject);
var
 ATable  : String ;
 i : Integer ;
begin
  if ZQUnprocessedLinks.IsEmpty then exit ;
  if OSFMessageDlg(Format(DMTCCoreLink.GetTextLangNoAmp(3367),[DMTCCoreLink.GetTextLangNoAmp(2958)]),mtConfirmation,[mbYes,mbNo],0) = mrno then exit ;




 for i := 0 to cxUnpostedDBBandedTableView1.Controller.SelectedRecordCount -1 do
  begin
    cxUnpostedDBBandedTableView1.Controller.SelectedRecords[i].Focused :=True;
    ATable := 'BAT' + ZQUnprocessedLinksWUSERID_1.AsString + 'T' + ZQUnprocessedLinksWBATCHTYPEID_2.AsString ;
    if TDatabaseTableRoutines.TableExists(ATable) then
      begin
         ExecSql('update  ' + ATable +' set blinked = 0 where wlineid = '  + IntToStr(ZQUnprocessedLinksWLINEID_1.AsInteger)) ;
      end;
    ExecSql('delete from OILINKSPRE where wbatchid = ' + IntToStr(ZQUnprocessedLinksWBATCHID_1.AsInteger)+ ' and wlineid = '  + IntToStr(ZQUnprocessedLinksWLINEID_1.AsInteger)) ;
    ExecSql('delete from OILINKS where wbatchid = ' + IntToStr(ZQUnprocessedLinksWBATCHID_1.AsInteger)+ ' and WLinkTransactionID = '  + IntToStr(ZQUnprocessedLinksWLINEID_1.AsInteger)) ;
  end;
 ZQUnprocessedLinks.close ;
 ZQUnprocessedLinks.Open ;

end;

procedure TfmOpenLink.BtnExportDetailsClick(Sender: TObject);
Var
 AStrings : TStringList ;
 i ,aAccType : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
begin
 if not SaveDialog1.Execute then exit ;


  AStrings := TStringList.Create ;
       try
 // add header
 AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2431) +#9+DateTimeToStr(Now)) ;
             ZQAccountData.close ;
            ZQAccountData.Params[0].AsInteger := aAccInfo.WAccountID ;
            ZQAccountData.Params[1].AsInteger := aAccInfo.WAccountID ;
            ZQAccountData.open ;

 aAccType := TDataBaseRoutines.GetAccountType(aAccInfo.WAccountID );
  if (aAccType in [0,1,2]) then

  AStrings.Add(cbAccountTypeTrans.Items[aAccType] +#9 + edtAccount.Text + ' '+ lblAccountDesc.Caption);
  AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(197)+ #9 + ZQAccountDataFIRSTNAME.AsString) ;
  AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2220)+ #9+ ZQAccountDataSPOSTAL1.AsString)  ;
  AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2206) + #9+  ZQAccountDataSPOSTAL2.AsString );
  AStrings.Add( DMTCCoreLink.GetTextLangNoAmp(187) + #9 + ZQAccountDataSTELEPHONE1.AsString);
  AStrings.Add( DMTCCoreLink.GetTextLangNoAmp(188)+ #9+ ZQAccountDataSTELEPHONE2.AsString);



   for i := 0 to cxDebitsDBBandedTableView1.ColumnCount -1 do
    if  cxDebitsDBBandedTableView1.Columns[i].VisibleForCustomization then
     begin
      if wwqryOpenDebits.FindField(cxDebitsDBBandedTableView1.Columns[i].DataBinding.FieldName) <> nil then
          AddLine  := AddLine + cxDebitsDBBandedTableView1.Columns[i].Caption ;
        if i < cxDebitsDBBandedTableView1.ColumnCount -1 then
           AddLine  := AddLine + #9 ;
     end ;
    AStrings.Add( AddLine);
    wwqryOpenDebits.first ;
    while not wwqryOpenDebits.eof do
        begin
        AddLine := '' ;
         for i := 0 to cxDebitsDBBandedTableView1.ColumnCount -1 do
             if  cxDebitsDBBandedTableView1.Columns[i].VisibleForCustomization then
           begin
               if wwqryOpenDebits.FindField(cxDebitsDBBandedTableView1.Columns[i].DataBinding.FieldName) <> nil then
                  AddLine  := AddLine + wwqryOpenDebits.FindField(cxDebitsDBBandedTableView1.Columns[i].DataBinding.FieldName).DisplayText ;
              if i < cxDebitsDBBandedTableView1.ColumnCount -1 then
                 AddLine  := AddLine + #9 ;
           end ;



          AStrings.Add( AddLine);
          wwqryOpenDebits.next ;
        end;

 wwqryOpenCredits.first ;

  while not wwqryOpenCredits.eof do
        begin
        AddLine := '' ;
         for i := 0 to cxCreditsDBBandedTableView1.ColumnCount -1 do
          if  cxCreditsDBBandedTableView1.Columns[i].VisibleForCustomization then
           begin
             if wwqryOpenCredits.FindField(cxCreditsDBBandedTableView1.Columns[i].DataBinding.FieldName) <> nil then
                   AddLine  := AddLine + wwqryOpenCredits.FindField(cxCreditsDBBandedTableView1.Columns[i].DataBinding.FieldName).DisplayText ;
              if i < cxCreditsDBBandedTableView1.ColumnCount  -1 then
                 AddLine  := AddLine + #9 ;
           end ;



          AStrings.Add( AddLine);
          wwqryOpenCredits.next ;
        end;


      AStrings.SaveToFile(SaveDialog1.FileName);
      AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
      ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);
        finally
         AStrings.Free ;
        end;
end;

procedure TfmOpenLink.cbFindInvalideClick(Sender: TObject);
begin
 btnRemoveFaults.Visible := cbFindInvalide.Checked ;
end;

procedure TfmOpenLink.edtAmtRefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and (ssctrl in Shift) then
     Autopaymentdebitsforpercentageofgross1.Visible := True ;
end;

procedure TfmOpenLink.Autopaymentdebitsforpercentageofgross1Click(
  Sender: TObject);
  var id:integer ;
begin
 wwqryOpenDebits.First ;
 while not wwqryOpenDebits.Eof do
   begin
      if wwqryOpenDebitsFOUTSTANDINGAMOUNT.AsFloat = wwqryOpenDebitsFAMOUNT.AsFloat then
        begin
           id :=  wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
           RPymtClick(nil);
           wwqryOpenDebits.Filtered := false ;
           wwqryOpenDebits.Locate('WTRANSACTIONID',id,[]);
        end;
      wwqryOpenDebits.next ;
   end;

end;

procedure TfmOpenLink.cxTotalsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

 var
  TempColor : Cardinal ;
begin
 if ZQAccountList.ControlsDisabled then exit ;
  if cbShowColors.Checked then
   begin
    if VarToStr(AViewInfo.GridRecord.Values[cxTotalsDBTableView1CHECKSTATUS.Index])  = '1' then
      begin
       ACanvas.Brush.Color := clRed ;
       ACanvas.Font.Color := clWhite ;
      end else
      begin
    if VarToStr(AViewInfo.GridRecord.Values[cxTotalsDBTableView1CHECKSTATUS.Index])  = '2' then
         begin
           ACanvas.Brush.Color := $000080FF ;
           ACanvas.Font.Color := clWhite ;
         end else
    if VarToStr(AViewInfo.GridRecord.Values[cxTotalsDBTableView1CHECKSTATUS.Index])  = '3' then
         begin
           ACanvas.Brush.Color := clNavy ;
           ACanvas.Font.Color := clWhite ;
         end;
      end;

      if (AViewInfo.Selected) and (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxTotalsDBTableView1CHECKSTATUS.Index]),0) > 0) then
        begin
           TempColor := ACanvas.Brush.Color ;
           ACanvas.Brush.Color := ACanvas.Font.Color ;
           ACanvas.Font.Color := TempColor ;

        end;
    end;
 
end;

procedure TfmOpenLink.cxTransDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
 var
   PaymentDate : TDate ;
   AddColor : Integer ;
   aVariant : variant ;
   aTotalOpen , ATotalTrans : Double ;
   AAccountTypeId : Integer ;
begin
 if ZQTranslist.ControlsDisabled then exit ;
 if not ZQTranslist.IsEmpty then
 begin
 aTotalOpen := 0 ;
 ATotalTrans := 0 ;
 AAccountTypeId:= 0 ;
 PaymentDate := date ;
 aVariant := AViewInfo.GridRecord.Values[cxTransDBTableViewDDATE.Index] ;
 if VarToStr(aVariant) <> '' then
    PaymentDate :=  aVariant ;
 aVariant := AViewInfo.GridRecord.Values[cxTransDBTableViewDPAYMENTDATE.Index] ;
 if VarToStr(aVariant) <> '' then
    PaymentDate :=  aVariant ;
 aVariant := AViewInfo.GridRecord.Values[cxTransDBTableViewTOTALOPEN.Index] ;
  if VarToStr(aVariant) <> '' then
    aTotalOpen := aVariant ;

     aVariant := AViewInfo.GridRecord.Values[cxTransDBTableViewWACCOUNTTYPEID.Index] ;
  if VarToStr(aVariant) <> '' then
    AAccountTypeId := aVariant ;


 if (PaymentDate < date) and (aTotalOpen <> 0) then
    begin
       AddColor := Round(date - PaymentDate) ;
       if AddColor > 60 then AddColor := 60 ;
       Case AAccountTypeId of
       1 : begin
           ACanvas.Brush.Color := (clRed ) - ((AddColor-1) * 3);
           ACanvas.Font.Color := clWhite ;
           end;
       2 : begin
           ACanvas.Brush.Color := (clRed ) - ((AddColor-1) * 3);
           ACanvas.Font.Color := clWhite ;
           end;
       0 : begin
           ACanvas.Brush.Color := (clRed ) - ((AddColor-1) * 3);
           ACanvas.Font.Color := clWhite ;
           end;
       end;

    end  ;
 end;

end;

procedure TfmOpenLink.cxDebitsDBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if varTostr(AViewInfo.GridRecord.Values[cxDebitsDBBandedTableView1BUNUSED.Index]) ='1'  then
     ACanvas.Font.Style := [fsBold] else
     ACanvas.Font.Style := [];
     if cbFindInvalideDetail.ItemIndex > 0 then
        if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxDebitsDBBandedTableView1ISLINKED.Index]),0) > 0 then
         begin
         if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxDebitsDBBandedTableView1ISLINKED.Index]),0) =1 then
           ACanvas.Brush.Color := clOlive
         else
          if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxDebitsDBBandedTableView1ISLINKED.Index]),0) =3 then
            begin
            ACanvas.Brush.Color := clLtGray
            end   else
         ACanvas.Brush.Color := clRed ;
         end;
end;

procedure TfmOpenLink.cxCreditsDBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if varTostr(AViewInfo.GridRecord.Values[cxCreditsDBBandedTableView1BUNUSED.Index]) ='1'  then
     ACanvas.Font.Style := [fsBold] else
     ACanvas.Font.Style := [];
     if cbFindInvalideDetail.ItemIndex > 0 then
        if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxCreditsDBBandedTableView1ISLINKED.Index]),0) > 0 then
         begin
         if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxCreditsDBBandedTableView1ISLINKED.Index]),0) =1 then
           ACanvas.Brush.Color := clOlive
         else
          if  StrTOIntDef(varTostr(AViewInfo.GridRecord.Values[cxCreditsDBBandedTableView1ISLINKED.Index]),0) =3 then
            ACanvas.Brush.Color := clLtGray
         else
         ACanvas.Brush.Color := clRed ;
         end;
end;

procedure TfmOpenLink.cxDebitsDBBandedTableView1DragDrop(Sender,
  Source: TObject; X, Y: Integer);

var
  ADroppedView: TcxCustomGridView;
begin
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
        begin
          ADroppedView := GridView;
          if ADroppedView = cxDebitsDBBandedTableView1 then
              PopupMenu1.PopupComponent := cxDebitsDBBandedTableView1 else
              PopupMenu1.PopupComponent := cxCreditsDBBandedTableView1;

          if not wwqryOpenDebits.IsEmpty then
            begin

               wwqryOpenDebits.Edit ;
               wwqryOpenDebitsBUNUSED.AsInteger := 1 ;
               wwqryOpenDebits.Post ;
               cxDebitsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
            end ;
          if not wwqryOpenCredits.IsEmpty then
            begin

               wwqryOpenCredits.Edit ;
               wwqryOpenCreditsBUNUSED.AsInteger := 1 ;
               wwqryOpenCredits.Post ;
               cxCreditsDBBandedTableView1.Controller.FocusedRow.Selected := True ;
            end ;

             if unlinkdown then
               begin
                  UnlinkTransaction1Click(ADroppedView);
               end else
                 LinkAcc(ADroppedView,0,True);
        end;
end;

procedure TfmOpenLink.cxDebitsDBBandedTableView1DragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
  if Source is TcxDragControlObject then
    with TcxDragControlObject(Source) do
      if Control is TcxGridSite then
        with TcxGridSite(Control) do
          begin


          if TcxGridSite(Sender).GridView  =  cxCreditsDBBandedTableView1 then
          Accept := (GridView.PatternGridView = cxDebitsDBBandedTableView1)
          else
          Accept := (GridView.PatternGridView = cxCreditsDBBandedTableView1) ;
          end;

end;

procedure TfmOpenLink.cxDebitsDBBandedTableView1BUNUSEDPropertiesEditValueChanged(
  Sender: TObject);

  var
    i : Integer ;
    Totalsum : Double ;
begin
 Totalsum := 0 ;
  for i := 0 to cxDebitsDBBandedTableView1.ViewData.RecordCount -1 do
     begin
        if VarToStr(cxDebitsDBBandedTableView1.ViewData.Records[i].Values[cxDebitsDBBandedTableView1BUNUSED.Index]) = '1' then
           begin
              Totalsum := Totalsum + StrToFloatDef(VarToStr(cxDebitsDBBandedTableView1.ViewData.Records[i].Values[cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT.Index]),0);
           end;
     end ;
   cxDebitsDBBandedTableView1.DataController.Summary.FooterSummaryValues[0] :=   FormatFloat('###,###,##0.00',Totalsum) ;

end;


procedure TfmOpenLink.cxCreditsDBBandedTableView1BUNUSEDPropertiesEditValueChanged(
  Sender: TObject);
  var
    i : Integer ;
    Totalsum : Double ;
begin
 Totalsum := 0 ;
  for i := 0 to cxCreditsDBBandedTableView1.ViewData.RecordCount -1 do
     begin
        if VarToStr(cxCreditsDBBandedTableView1.ViewData.Records[i].Values[cxCreditsDBBandedTableView1BUNUSED.Index]) = '1' then
           begin
              Totalsum := Totalsum + StrToFloatDef(VarToStr(cxCreditsDBBandedTableView1.ViewData.Records[i].Values[cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT.Index]),0);
           end;
     end ;
   cxCreditsDBBandedTableView1.DataController.Summary.FooterSummaryValues[0] :=   FormatFloat('###,###,##0.00',Totalsum) ;

end;

function TfmOpenLink.CreditGridHasFocus: Boolean;


begin
result := False ;
if (PopupMenu1.PopupComponent <> nil) and (PopupMenu1.PopupComponent is TcxGridSite) then
 begin
   if  (PopupMenu1.PopupComponent as TcxGridSite).GridView.Name = cxCreditsDBBandedTableView1.Name then
   begin
       result := true ;
   end else
   begin

      result := False ;
   end;
  end else
   if (PopupMenu1.PopupComponent <> nil) then
  begin
    result := PopupMenu1.PopupComponent = cxCreditsDBBandedTableView1 ;
  end else
  begin
     result := cxCredits.Focused  ;
  end;
end;

procedure TfmOpenLink.edtSincePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin

    CalSmtAge;

end;

procedure TfmOpenLink.Button1Click(Sender: TObject);
begin
 PopupMenu5.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfmOpenLink.Month1Click(Sender: TObject);
begin
 cxTransDBTableViewDPAYMENTDATE.DateTimeGrouping := dtgByMonth ;

 cxTransDBTableViewDPAYMENTDATE.GroupIndex := 0 ;
end;

procedure TfmOpenLink.Fromtoday1Click(Sender: TObject);
begin
 cxTransDBTableViewDPAYMENTDATE.DateTimeGrouping := dtgRelativeToToday ;

 cxTransDBTableViewDPAYMENTDATE.GroupIndex := 0 ;
end;

procedure TfmOpenLink.Bydate1Click(Sender: TObject);
begin
 cxTransDBTableViewDPAYMENTDATE.DateTimeGrouping := dtgByDate ;

 cxTransDBTableViewDPAYMENTDATE.GroupIndex := 0 ;
end;

procedure TfmOpenLink.Byyear1Click(Sender: TObject);
begin
 cxTransDBTableViewDPAYMENTDATE.DateTimeGrouping := dtgByYear ;

 cxTransDBTableViewDPAYMENTDATE.GroupIndex := 0 ;
end;

initialization
twf_TfmOpenLink.Create(nil);
end.


