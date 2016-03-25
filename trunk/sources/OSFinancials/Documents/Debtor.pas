(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Mixed Unit (TC and changes osF)
  Released under the GNU General Public License
*)
unit Debtor;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB, Mask, ComCtrls, Buttons,
  DBAccess , Uni,   UpluginsSharedUnit, Menus,BackOrdersOutstanding,UOSFVIsuals,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, cxDBEdit, cxSplitter, cxCalendar;

type
 TButtonListType  =(bfcNew,bfcSearch,bfcEdit,bfcSave,bfcCancel,bfcDelete,bfcReport,bfcImport,bfcExport);
 twf_TfmDebtor  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;
 twf_TfmPluginDebtor  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;

 TfmDebtor = class(TForm)
    DSContactLink: TDataSource;
    Notebook1: TNotebook;
    pgconDebtor: TPageControl;
    tsStatement: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    edtDelAddress1: TcxTextEdit;
    edtDelAddress2: TcxTextEdit;
    edtDelAddress3: TcxTextEdit;
    edtStateMessage: TcxTextEdit;
    tSACCOUNT: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    LBankAccountNR: TLabel;
    LBankAccountType: TLabel;
    LcbOpenItem: TLabel;
    LcbDisabled: TLabel;
    LDueDays: TLabel;
    LEUseDefaultAccount: TLabel;
    LCBUseDefaultAccount: TLabel;
    cbDisabled: TCheckBox;
    cbOpenItem: TCheckBox;
    edtDiscount: TcxTextEdit;
    edtInterest: TcxTextEdit;
    cbSellingPriceChoice: TComboBox;
    EBankAccountNr: TcxTextEdit;
    CBAccountType: TComboBox;
    EDueDays: TcxTextEdit;
    EUseDefaultAccount: TcxTextEdit;
    CBUseDefaultAccount: TCheckBox;
    TSContacts: TTabSheet;
    QDebtorCreditor: TuniQuery;
    DSDebtorCreditor: TDataSource;
    PBtn2: TPanel;
    ButtonPanel: TPanel;
    PRightBtn: TPanel;
    BTBOk: TBitBtn;
    BtnCancel: TBitBtn;
    PRgtBtn2: TPanel;
    btnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    PEditButtons: TPanel;
    BNew: TBitBtn;
    BDelete: TBitBtn;
    BEdit: TBitBtn;
    BSave: TBitBtn;
    QDebtorCreditorSDescription: TStringField;
    QDebtorCreditorSACCOUNTCODE: TStringField;
    QDebtorCreditorSPostal1: TStringField;
    QDebtorCreditorSPostal2: TStringField;
    QDebtorCreditorSPostal3: TStringField;
    QDebtorCreditorSPostalCode: TStringField;
    QDebtorCreditorSTelephone1: TStringField;
    QDebtorCreditorSTelephone2: TStringField;
    QDebtorCreditorSFax: TStringField;
    QDebtorCreditorSEmail: TStringField;
    QDebtorCreditorSBranchCode: TStringField;
    QDebtorCreditorSBankAccountNumber: TStringField;
    QDebtorCreditorSReference: TStringField;
    QDebtorCreditorWDueDays: TIntegerField;
    QDebtorCreditorWAccountID: TIntegerField;
    QDebtorCreditorLastName: TStringField;
    QDebtorCreditorGroupDesc1: TStringField;
    QDebtorCreditorGroupSort1: TIntegerField;
    QDebtorCreditorGroupDesc2: TStringField;
    QDebtorCreditorGroupSort2: TIntegerField;
    BCancel: TBitBtn;
    TSAppointments: TTabSheet;
    TSInvoicesQuotes: TTabSheet;
    DSAppointments: TDataSource;
    DSDocuments: TDataSource;
    TSTransactions: TTabSheet;
    Panel4: TPanel;
    BClearFilter: TBitBtn;
    BFilter2: TBitBtn;
    EFilterValue: TcxTextEdit;
    Value: TLabel;
    CBOperatot: TComboBox;
    CBFindColumn: TComboBox;
    Filter: TLabel;
    LCBUseDefaultTax: TLabel;
    CBUseDefaultTax: TCheckBox;
    LEUseDefaultTax: TLabel;
    EUseDefaultTax: TcxTextEdit;
    CBDelCountry: TComboBox;
    Label3: TLabel;
    tblAccount: TuniQuery;
    tblCreditor: TuniQuery;
    tblDebtor: TuniQuery;
    QadressPerAccount: TuniQuery;
    QadressPerAccountRECORDID: TIntegerField;
    QadressPerAccountRESOURCEID: TIntegerField;
    QadressPerAccountFIRSTNAME: TStringField;
    QadressPerAccountLASTNAME: TStringField;
    QadressPerAccountBIRTHDATE: TDateTimeField;
    QadressPerAccountANNIVERSARY: TDateTimeField;
    QadressPerAccountGENDER: TStringField;
    QadressPerAccountTITLE: TStringField;
    QadressPerAccountCOMPANY: TStringField;
    QadressPerAccountJOB_POSITION: TStringField;
    QadressPerAccountADDRESS: TStringField;
    QadressPerAccountCITY: TStringField;
    QadressPerAccountSTATE: TStringField;
    QadressPerAccountZIP: TStringField;
    QadressPerAccountCOUNTRY: TStringField;
    QadressPerAccountNOTE: TStringField;
    QadressPerAccountPHONE1: TStringField;
    QadressPerAccountPHONE2: TStringField;
    QadressPerAccountPHONE3: TStringField;
    QadressPerAccountPHONE4: TStringField;
    QadressPerAccountPHONE5: TStringField;
    QadressPerAccountPHONETYPE1: TIntegerField;
    QadressPerAccountPHONETYPE2: TIntegerField;
    QadressPerAccountPHONETYPE3: TIntegerField;
    QadressPerAccountPHONETYPE4: TIntegerField;
    QadressPerAccountPHONETYPE5: TIntegerField;
    QadressPerAccountCATEGORY: TIntegerField;
    QadressPerAccountEMAIL: TStringField;
    QadressPerAccountCUSTOM1: TStringField;
    QadressPerAccountCUSTOM2: TStringField;
    QadressPerAccountCUSTOM3: TStringField;
    QadressPerAccountCUSTOM4: TStringField;
    QadressPerAccountUSERFIELD0: TStringField;
    QadressPerAccountUSERFIELD1: TStringField;
    QadressPerAccountUSERFIELD2: TStringField;
    QadressPerAccountUSERFIELD3: TStringField;
    QadressPerAccountUSERFIELD4: TStringField;
    QadressPerAccountUSERFIELD5: TStringField;
    QadressPerAccountUSERFIELD6: TStringField;
    QadressPerAccountUSERFIELD7: TStringField;
    QadressPerAccountUSERFIELD8: TStringField;
    QadressPerAccountUSERFIELD9: TStringField;
    QadressPerAccountDSYSDATE: TDateTimeField;
    QadressPerAccountWADDRESSPERACCOUNTID: TIntegerField;
    QadressPerAccountWACCOUNTID: TIntegerField;
    QadressPerAccountWCONTACTID: TIntegerField;
    tblDebtorWACCOUNTID: TIntegerField;
    tblDebtorWCONTACTID: TIntegerField;
    tblDebtorSPASSWORD: TStringField;
    tblDebtorSPOSTAL1: TStringField;
    tblDebtorSPOSTAL2: TStringField;
    tblDebtorSPOSTAL3: TStringField;
    tblDebtorWPOSTCOUNTRIES_ID: TIntegerField;
    tblDebtorSPOSTALCODE: TStringField;
    tblDebtorSDELIVERY1: TStringField;
    tblDebtorSDELIVERY2: TStringField;
    tblDebtorSDELIVERY3: TStringField;
    tblDebtorWDELCOUNTRIES_ID: TIntegerField;
    tblDebtorSDELIVERYCODE: TStringField;
    tblDebtorSTELEPHONE1: TStringField;
    tblDebtorSTELEPHONE2: TStringField;
    tblDebtorSFAX: TStringField;
    tblDebtorSEMAIL: TStringField;
    tblDebtorSBANKNAME: TStringField;
    tblDebtorSBRANCHCODE: TStringField;
    tblDebtorSBANKACCOUNTNUMBER: TStringField;
    tblDebtorSBANKACCOUNTNAME: TStringField;
    tblDebtorSCREDITCARDNUMBER: TStringField;
    tblDebtorDEXPIRYDATE: TDateTimeField;
    tblDebtorSCREDITCARDTYPE: TStringField;
    tblDebtorSCREDITCARDHOLDER: TStringField;
    tblDebtorFCREDITLIMIT: TFloatField;
    tblDebtorFCHARGEAMOUNT: TFloatField;
    tblDebtorFDISCOUNT: TFloatField;
    tblDebtorFINTEREST: TFloatField;
    tblDebtorWBANKID: TIntegerField;
    tblDebtorWSALESMANID: TIntegerField;
    tblDebtorBOPENITEM: TSmallintField;
    tblDebtorBPOSTBBF: TSmallintField;
    tblDebtorBDISABLED: TSmallintField;
    tblDebtorSMESSAGE: TStringField;
    tblDebtorWDEFAULTPRICETYPEID: TIntegerField;
    tblDebtorDLASTACTIVITY: TDateTimeField;
    tblDebtorWCURRENCYID: TIntegerField;
    tblDebtorWFOREXACCOUNTID: TIntegerField;
    tblDebtorSREFERENCE: TStringField;
    tblDebtorDSYSDATE: TDateTimeField;
    tblDebtorWDUEDAYS: TIntegerField;
    tblDebtorWDEFAULTACCOUNT: TIntegerField;
    tblDebtorWDEFAULTTAX: TIntegerField;
    tblCreditorWACCOUNTID: TIntegerField;
    tblCreditorSCODE: TStringField;
    tblCreditorWCONTACTID: TIntegerField;
    tblCreditorSPASSWORD: TStringField;
    tblCreditorSPOSTAL1: TStringField;
    tblCreditorSPOSTAL2: TStringField;
    tblCreditorSPOSTAL3: TStringField;
    tblCreditorSPOSTALCODE: TStringField;
    tblCreditorWPOSTCOUNTRIES_ID: TIntegerField;
    tblCreditorSDELIVERY1: TStringField;
    tblCreditorSDELIVERY2: TStringField;
    tblCreditorSDELIVERY3: TStringField;
    tblCreditorWDELCOUNTRIES_ID: TIntegerField;
    tblCreditorSTELEPHONE1: TStringField;
    tblCreditorSTELEPHONE2: TStringField;
    tblCreditorSFAX: TStringField;
    tblCreditorSEMAIL: TStringField;
    tblCreditorWBANKNAME: TStringField;
    tblCreditorSBRANCHCODE: TStringField;
    tblCreditorSBANKACCOUNTNUMBER: TStringField;
    tblCreditorSBANKACCOUNTNAME: TStringField;
    tblCreditorFCREDITLIMIT: TFloatField;
    tblCreditorFCHARGEAMOUNT: TFloatField;
    tblCreditorBOPENITEM: TSmallintField;
    tblCreditorBPOSTBBF: TSmallintField;
    tblCreditorDLASTACTIVITY: TDateTimeField;
    tblCreditorWCURRENCYID: TIntegerField;
    tblCreditorWFOREXACCOUNTID: TIntegerField;
    tblCreditorSMESSAGE: TStringField;
    tblCreditorSREFERENCE: TStringField;
    tblCreditorFDISCOUNT: TFloatField;
    tblCreditorWDEFAULTPRICETYPEID: TIntegerField;
    tblCreditorDSYSDATE: TDateTimeField;
    tblCreditorWDUEDAYS: TIntegerField;
    tblCreditorWDEFAULTACCOUNT: TIntegerField;
    tblCreditorWDEFAULTTAX: TIntegerField;
    tblAccountWACCOUNTID: TIntegerField;
    tblAccountSACCOUNTCODE: TStringField;
    tblAccountSMAINACCOUNTCODE: TStringField;
    tblAccountSSUBACCOUNTCODE: TStringField;
    tblAccountSDESCRIPTION: TStringField;
    tblAccountWACCOUNTTYPEID: TIntegerField;
    tblAccountWREPORTINGGROUP1ID: TIntegerField;
    tblAccountWREPORTINGGROUP2ID: TIntegerField;
    tblAccountBSUBACCOUNTS: TSmallintField;
    tblAccountBINCOMEEXPENSE: TSmallintField;
    tblAccountBOPENITEM: TSmallintField;
    tblAccountBINACTIVE: TSmallintField;
    tblAccountDSYSDATE: TDateTimeField;
    tblAccountWPROFILEID: TIntegerField;
    tblAccountWLINKACCOUNT: TIntegerField;
    ZUSQLAccount: TUniUpdateSql;
    ZUSQLCreditor: TUniUpdateSql;
    ZUSQLDebtor: TUniUpdateSql;
    ZUSQLAdressPerAccount: TUniUpdateSql;
    LBankName: TLabel;
    EBankname: TcxTextEdit;
    Panel5: TPanel;
    LAccountCode: TLabel;
    edtAccountNumber: TcxTextEdit;
    Label2: TLabel;
    edtName: TcxTextEdit;
    LAdress: TLabel;
    edtAddress1: TcxTextEdit;
    Label4: TLabel;
    edtPCode: TcxTextEdit;
    LCity: TLabel;
    edtAddress2: TcxTextEdit;
    LState: TLabel;
    edtAddress3: TcxTextEdit;
    LCountry: TLabel;
    CBCountry: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtFax: TcxTextEdit;
    edtPhone2: TcxTextEdit;
    edtPhone1: TcxTextEdit;
    Label8: TLabel;
    edtEmail: TcxTextEdit;
    edtContact: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    edtSalesPerson: TComboBox;
    Label21: TLabel;
    CbxRepGroup1: TComboBox;
    CbxRepGroup2: TComboBox;
    Label22: TLabel;
    Label15: TLabel;
    edtReference: TcxTextEdit;
    ECompanyRegnr: TcxTextEdit;
    LECompanyRegnr: TLabel;
    LEFreeField1: TLabel;
    EFreeField1: TcxTextEdit;
    LEFreeField2: TLabel;
    EFreeField2: TcxTextEdit;
    EFreeField3: TcxTextEdit;
    LEFreeField3: TLabel;
    tblDebtorSCOMPANYREGNO: TStringField;
    tblDebtorSFREEFIELD1: TStringField;
    tblDebtorSFREEFIELD2: TStringField;
    tblDebtorSFREEFIELD3: TStringField;
    tblCreditorSCOMPANYREGNO: TStringField;
    tblCreditorSFREEFIELD1: TStringField;
    tblCreditorSFREEFIELD2: TStringField;
    tblCreditorSFREEFIELD3: TStringField;
    Shape2: TShape;
    Shape1: TShape;
    eDelCode: TcxTextEdit;
    LMEssage: TLabel;
    BtnOpen: TBitBtn;
    EBankname2: TcxTextEdit;
    tsBankAccounts: TTabSheet;
    ZQAccountRef: TuniQuery;
    ZUSQLAccountRef: TUniUpdateSql;
    ZQAccountRefWACCOUNTREFID: TIntegerField;
    ZQAccountRefSREFERENCE: TStringField;
    ZQAccountRefWACCOUNTID: TIntegerField;
    DSAccountRef: TDataSource;
    LLanguage: TLabel;
    cbOsfLanguage: TComboBox;
    tblDebtorSLANGUAGE: TStringField;
    tblCreditorSLANGUAGE: TStringField;
    tblCreditorSDELIVERYCODE: TStringField;
    LInvLayout: TLabel;
    LCreditLayout: TLabel;
    LQuoteLayout: TLabel;
    CBdocLayoutInv: TComboBox;
    CBdocLayoutCreditNote: TComboBox;
    CBdocLayoutQuote: TComboBox;
    tblDebtorSLAYOUTINVOICE: TStringField;
    tblDebtorSLAYOUTCREDITNOTE: TStringField;
    tblDebtorSLAYOUTQUOTE: TStringField;
    tblDebtorDREMITTANCE: TDateTimeField;
    tblCreditorSLAYOUTINVOICE: TStringField;
    tblCreditorSLAYOUTCREDITNOTE: TStringField;
    tblCreditorSLAYOUTQUOTE: TStringField;
    LMEssage2: TLabel;
    edtStateMessage2: TcxTextEdit;
    SCrollbox1 : TScrollbox ;
    LDCity: TLabel;
    LDState: TLabel;
    pmDocument: TPopupMenu;
    Invoice1: TMenuItem;
    Creditnote1: TMenuItem;
    Quote1: TMenuItem;
    Reports1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    LCredit: TLabel;
    Panel6: TPanel;
    LDebit: TLabel;
    QDebtorCreditorWCOLOR: TIntegerField;
    QDebtorCreditorWTEXTCOLOR: TIntegerField;
    Openinbrowserfromimplink1: TMenuItem;
    ZQGen: TuniQuery;
    BLookupPostal: TBitBtn;
    Pluginscopyfrom1: TMenuItem;
    Pluginscopyto1: TMenuItem;
    PluginsAction11: TMenuItem;
    PluginsAction21: TMenuItem;
    qryDocHead: TuniQuery;
    qryDocHeadWDOCID: TIntegerField;
    qryDocHeadSDOCNO: TStringField;
    qryDocHeadWTYPEID: TIntegerField;
    qryDocHeadDDATE: TDateTimeField;
    qryDocHeadDALLOCATEDDATE: TDateTimeField;
    qryDocHeadWACCOUNTID: TIntegerField;
    qryDocHeadWPAYMENTTYPEID: TIntegerField;
    qryDocHeadWPOSTAL1ID: TIntegerField;
    qryDocHeadWPOSTAL2ID: TIntegerField;
    qryDocHeadWPOSTAL3ID: TIntegerField;
    qryDocHeadWPOSCOUNTRIES_ID: TIntegerField;
    qryDocHeadWPOSTALCODEID: TIntegerField;
    qryDocHeadWMESSAGE1ID: TIntegerField;
    qryDocHeadWMESSAGE2ID: TIntegerField;
    qryDocHeadWMESSAGE3ID: TIntegerField;
    qryDocHeadFINVOICEDISCOUNT: TFloatField;
    qryDocHeadWSALESMANID: TIntegerField;
    qryDocHeadSREFERENCE: TStringField;
    qryDocHeadWDELADDRESS1ID: TIntegerField;
    qryDocHeadWDELADDRESS2ID: TIntegerField;
    qryDocHeadWDELADDRESS3ID: TIntegerField;
    qryDocHeadWDELCOUNTRIES_ID: TIntegerField;
    qryDocHeadWDELCODEID: TIntegerField;
    qryDocHeadBPRINTED: TSmallintField;
    qryDocHeadBPOSTED: TSmallintField;
    qryDocHeadWREPORTINGGROUP1ID: TIntegerField;
    qryDocHeadWREPORTINGGROUP2ID: TIntegerField;
    qryDocHeadWPAYMENTGROUPID: TIntegerField;
    qryDocHeadBEXCLUSIVE: TSmallintField;
    qryDocHeadWCURRENCYID: TIntegerField;
    qryDocHeadFDOCAMOUNT: TFloatField;
    qryDocHeadFTAXAMOUNT: TFloatField;
    qryDocHeadBREPEATING: TSmallintField;
    qryDocHeadDSYSDATE: TDateTimeField;
    qryDocHeadWSOURCETYPEID: TIntegerField;
    qryDocHeadWPROFILEID: TIntegerField;
    qryDocHeadWTERMS: TIntegerField;
    qryDocHeadWJOBCODEID: TIntegerField;
    qryDocHeadDDUEDATE: TDateTimeField;
    qryDocHeadWUSERID: TIntegerField;
    qryDocHeadSEXTERNALID: TStringField;
    qryDocHeadWPOSTALNAME: TIntegerField;
    qryDocHeadWPOSTALCONTACT: TIntegerField;
    qryDocHeadWDELNAME: TIntegerField;
    qryDocHeadWDELCONTACT: TIntegerField;
    qryDocHeadWTAXNUMBER: TIntegerField;
    qryDocHeadWCONTRAACCOUNT: TIntegerField;
    qryDocHeadWOPENITEMTRANSACTID: TIntegerField;
    QDebtorCreditorSDELIVERY1: TStringField;
    QDebtorCreditorSDELIVERY2: TStringField;
    QDebtorCreditorSDELIVERY3: TStringField;
    QDebtorCreditorSDELIVERYCODE: TStringField;
    QDebtorCreditorDELCOUNTRY: TStringField;
    QDebtorCreditorPOSCOUNTRY: TStringField;
    tblCreditorSWEBSITE: TStringField;
    tblDebtorSWEBSITE: TStringField;
    EWebsite: TcxTextEdit;
    lwebsite: TLabel;
    QEvents: TuniQuery;
    QEventsRECORDID: TIntegerField;
    QEventsSTARTTIME: TDateTimeField;
    QEventsENDTIME: TDateTimeField;
    QEventsRESOURCEID: TIntegerField;
    QEventsWCONTACTID: TIntegerField;
    QEventsWACCOUNTID: TIntegerField;
    QEventsDESCRIPTION: TStringField;
    QEventsNOTES: TStringField;
    QEventsCATEGORY: TIntegerField;
    QEventsALLDAYEVENT: TSmallintField;
    QEventsDINGPATH: TStringField;
    QEventsALARMSET: TSmallintField;
    QEventsALARMADVANCE: TIntegerField;
    QEventsALARMADVANCETYPE: TIntegerField;
    QEventsSNOOZETIME: TDateTimeField;
    QEventsREPEATCODE: TIntegerField;
    QEventsREPEATRANGEEND: TDateTimeField;
    QEventsCUSTOMINTERVAL: TIntegerField;
    QEventsUSERFIELD0: TStringField;
    QEventsUSERFIELD1: TStringField;
    QEventsUSERFIELD2: TStringField;
    QEventsUSERFIELD3: TStringField;
    QEventsUSERFIELD4: TStringField;
    QEventsUSERFIELD5: TStringField;
    QEventsUSERFIELD6: TStringField;
    QEventsUSERFIELD7: TStringField;
    QEventsUSERFIELD8: TStringField;
    QEventsUSERFIELD9: TStringField;
    tsBackorder: TTabSheet;
    QDebtorCreditorFIRSTNAME: TStringField;
    QDebtorCreditorWREPORTINGGROUP2ID: TIntegerField;
    bShowTrans: TBitBtn;
    N1: TMenuItem;
    Setreportinggroup1: TMenuItem;
    Setreportinggroup2: TMenuItem;
    tsStock: TTabSheet;
    ZQDocs: TuniQuery;
    dsDocs: TDataSource;
    ZQDocsSSTOCKCODE: TStringField;
    ZQDocsSTOCKDESC: TStringField;
    ZQDocsWDOCID: TIntegerField;
    ZQDocsFQTYSHIPPED: TFloatField;
    ZQDocsSDOCNO: TStringField;
    ZQDocsDDATE: TDateTimeField;
    ZQDocsSDESCRIPTION: TStringField;
    ZQDocsFSELLINGPRICE: TFloatField;
    ZQDocsFITEMDISCOUNT: TFloatField;
    ZQDocsFEXCLUSIVEAMT: TFloatField;
    ZQDocsFINCLUSIVEAMT: TFloatField;
    ZQDocsFUNITQTY: TFloatField;
    ZQDocsUNITDESC: TStringField;
    ZQDocsWTYPEID: TIntegerField;
    ZQDocsBPOSTED: TSmallintField;
    lLook: TLabel;
    BExport: TBitBtn;
    SaveDialog1: TSaveDialog;
    dmToonTransact: TPopupMenu;
    Showtransact1: TMenuItem;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1SDescription: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostalCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STelephone1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STelephone2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SFax: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SEmail: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBranchCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBankAccountNumber: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DLastActivity: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SReference: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDueDays: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WAccountID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1LastName: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1GroupDesc1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1GroupSort1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1GroupDesc2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1GroupSort2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WCOLOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTEXTCOLOR: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDELIVERY1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDELIVERY2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDELIVERY3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDELIVERYCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DELCOUNTRY: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1POSCOUNTRY: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FIRSTNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn;
    QDebtorCreditorDLASTACTIVITY: TDateTimeField;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1STARTTIME: TcxGridDBColumn;
    cxGrid2DBTableView1ENDTIME: TcxGridDBColumn;
    cxGrid2DBTableView1DESCRIPTION: TcxGridDBColumn;
    cxGrid2DBTableView1NOTES: TcxGridDBColumn;
    cxGrid2DBTableView1USERFIELD0: TcxGridDBColumn;
    cxGrid2DBTableView1USERFIELD5: TcxGridDBColumn;
    cxGrid2DBTableView1CATEGORY: TcxGridDBColumn;
    Panel7: TPanel;
    lblCopies: TLabel;
    DestLbl: TLabel;
    lblPrnType: TLabel;
    UpDown1: TUpDown;
    edtCount: TcxTextEdit;
    cbDestination: TComboBox;
    CBDocLayout: TComboBox;
    BPrint: TBitBtn;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1SDOCNO: TcxGridDBColumn;
    cxGrid3DBTableView1DDATE: TcxGridDBColumn;
    cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid3DBTableView1BPRINTED: TcxGridDBColumn;
    cxGrid3DBTableView1FDOCAMOUNT: TcxGridDBColumn;
    cxGrid3DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGrid4DBTableView1SSTOCKCODE: TcxGridDBColumn;
    cxGrid4DBTableView1STOCKDESC: TcxGridDBColumn;
    cxGrid4DBTableView1FQTYSHIPPED: TcxGridDBColumn;
    cxGrid4DBTableView1SDOCNO: TcxGridDBColumn;
    cxGrid4DBTableView1DDATE: TcxGridDBColumn;
    cxGrid4DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid4DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid4DBTableView1FITEMDISCOUNT: TcxGridDBColumn;
    cxGrid4DBTableView1FEXCLUSIVEAMT: TcxGridDBColumn;
    cxGrid4DBTableView1FINCLUSIVEAMT: TcxGridDBColumn;
    cxGrid4DBTableView1FUNITQTY: TcxGridDBColumn;
    cxGrid4DBTableView1UNITDESC: TcxGridDBColumn;
    cxGrid4DBTableView1WTYPEID: TcxGridDBColumn;
    cxGrid4DBTableView1BPOSTED: TcxGridDBColumn;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5Level1: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGrid6DBTableView1: TcxGridDBTableView;
    cxGrid6Level1: TcxGridLevel;
    cxGrid6: TcxGrid;
    wwqryOpenDebits: TUniQuery;
    wwqryOpenDebitsWTRANSACTIONID: TIntegerField;
    wwqryOpenDebitsSREFERENCE: TStringField;
    wwqryOpenDebitsDDATE: TDateTimeField;
    wwqryOpenDebitsFAMOUNT: TFloatField;
    wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenDebitsSDESCRIPTION: TStringField;
    wwqryOpenDebitsBUNUSED: TSmallintField;
    wwqryOpenDebitsISLINKED: TIntegerField;
    wwdsOpenDebits: TDataSource;
    wwqryOpenCredits: TUniQuery;
    wwqryOpenCreditsWTRANSACTIONID: TIntegerField;
    wwqryOpenCreditsSREFERENCE: TStringField;
    wwqryOpenCreditsDDATE: TDateTimeField;
    wwqryOpenCreditsFAMOUNT: TFloatField;
    wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenCreditsSDESCRIPTION: TStringField;
    wwqryOpenCreditsBUNUSED: TSmallintField;
    wwqryOpenCreditsISLINKED: TIntegerField;
    cxGrid6DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid6DBTableView1DDATE: TcxGridDBColumn;
    cxGrid6DBTableView1FAMOUNT: TcxGridDBColumn;
    cxGrid6DBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn;
    cxGrid6DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid5DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid5DBTableView1DDATE: TcxGridDBColumn;
    cxGrid5DBTableView1FAMOUNT: TcxGridDBColumn;
    cxGrid5DBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn;
    cxGrid5DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cbAlltrans: TCheckBox;
    cxGrid7DBTableView1: TcxGridDBTableView;
    cxGrid7Level1: TcxGridLevel;
    cxGrid7: TcxGrid;
    cxGrid7DBTableView1FIRSTNAME: TcxGridDBColumn;
    cxGrid7DBTableView1LASTNAME: TcxGridDBColumn;
    cxGrid7DBTableView1TITLE: TcxGridDBColumn;
    cxGrid7DBTableView1ADDRESS: TcxGridDBColumn;
    cxGrid7DBTableView1CITY: TcxGridDBColumn;
    cxGrid7DBTableView1STATE: TcxGridDBColumn;
    cxGrid7DBTableView1PHONE1: TcxGridDBColumn;
    cxGrid7DBTableView1PHONE2: TcxGridDBColumn;
    cxGrid7DBTableView1PHONE3: TcxGridDBColumn;
    cxGrid7DBTableView1EMAIL: TcxGridDBColumn;
    Panel8: TPanel;
    BCAdd: TBitBtn;
    BCEdit: TBitBtn;
    BCDelete: TBitBtn;
    BCFind: TBitBtn;
    CBAutoCopyContactInfo: TCheckBox;
    Panel9: TPanel;
    bBankDelete: TBitBtn;
    BBankAdd: TBitBtn;
    cxGrid8DBTableView1: TcxGridDBTableView;
    cxGrid8Level1: TcxGridLevel;
    cxGrid8: TcxGrid;
    cxGrid8DBTableView1WACCOUNTREFID: TcxGridDBColumn;
    cxGrid8DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid8DBTableView1WACCOUNTID: TcxGridDBColumn;
    edtCredLimit: TcxCalcEdit;
    edtChargeAmount: TcxCalcEdit;
    wwdsOpenCredits: TDataSource;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    cbTransmissionType: TComboBox;
    Label1: TLabel;
    tblCreditorWTRANSMISSIONTYPE: TIntegerField;
    tblDebtorWTRANSMISSIONTYPE: TIntegerField;
    Label23: TLabel;
    edSBANKACCOUNTNAME: TcxTextEdit;
    Label25: TLabel;
    tblCreditorSCREDITCARDNUMBER: TStringField;
    tblCreditorSCREDITCARDHOLDER: TStringField;
    tblCreditorSBANKNAME: TStringField;
    tblCreditorDEXPIRYDATE: TDateTimeField;
    Label24: TLabel;
    Label26: TLabel;
    sigtext: TcxTextEdit;
    Label27: TLabel;
    sigdate: TcxDateEdit;
    cbShowInactive: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure AddRepgroupmenuitems ;
    procedure OnGenSearchClick(Sender: TObject);

    procedure CheckAccountCode(Sender: TObject);
    function CheckCreateAccount(Sender : TObject) : Boolean;

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSalespersonKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtContactKeyPress(Sender: TObject; var Key: Char);
    procedure CbxRepGroup1DropDown(Sender: TObject);
    procedure edtDiscountExit(Sender: TObject);
    procedure edtInterestExit(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tsGeneralShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure edtNameEnter(Sender: TObject);
    procedure EBankAccountNrExit(Sender: TObject);
    procedure EUseDefaultAccountEnter(Sender: TObject);
    procedure CBUseDefaultAccountClick(Sender: TObject);
    procedure BCAddClick(Sender: TObject);
    procedure BCDeleteClick(Sender: TObject);
    procedure BCEditClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure pgconDebtorChange(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure BClearFilterClick(Sender: TObject);
    procedure BTBOkClick(Sender: TObject);
    procedure edtAccountNumberExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGSearchColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BtnOpenClick(Sender: TObject);
    procedure EUseDefaultTaxEnter(Sender: TObject);
    procedure CBUseDefaultTaxClick(Sender: TObject);
    procedure tblAccountAfterInsert(DataSet: TDataSet);
    procedure CreditorOkClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure tblCreditorBeforeOpen(DataSet: TDataSet);
    procedure QDebtorCreditorBeforeOpen(DataSet: TDataSet);
    procedure BBankAddClick(Sender: TObject);
    procedure bBankDeleteClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDelAddress1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pmDocumentPopup(Sender: TObject);
    procedure Invoice1Click(Sender: TObject);
    procedure Creditnote1Click(Sender: TObject);
    procedure Quote1Click(Sender: TObject);
    procedure tblAccountBeforeOpen(DataSet: TDataSet);
    procedure Openinbrowserfromimplink1Click(Sender: TObject);
    procedure BLookupPostalClick(Sender: TObject);
    procedure DBGSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryDocHeadBeforeOpen(DataSet: TDataSet);
    procedure EWebsiteDblClick(Sender: TObject);
    procedure BFilter2Click(Sender: TObject);
    procedure BFilterClick(Sender: TObject);
    procedure bShowTransClick(Sender: TObject);
    procedure ZQDocsWTYPEIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGSearchKeyPress(Sender: TObject; var Key: Char);
    procedure BExportClick(Sender: TObject);
    procedure Showtransact1Click(Sender: TObject);
    procedure QadressPerAccountAfterInsert(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure QEventsUSERFIELD5GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cxGrid2DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cbAlltransClick(Sender: TObject);
    procedure CbxRepGroup1CloseUp(Sender: TObject);
    procedure edtEmailDblClick(Sender: TObject);
  private
    FUseCreditor,ctrlDown: Boolean;
    LimitSql : String ;
    procedure check11proof;
    procedure InitPlugins;
    procedure InitPluginsOnPagecontrol;
    procedure SendMessageToPlugin(AMessage: String);
    procedure SetUseCreditor(const Value: Boolean);
    procedure GenReports1Click(Sender: TObject);
    procedure OnMenuCopy(Sender: TObject);
    procedure OnMenuPast(Sender: TObject);
    procedure OnMenuPluginAct1(Sender: TObject);
    procedure OnMenuPluginAct2(Sender: TObject);
    procedure OpenDocSql(aFilter, Order: String);
    procedure HandelChangeGroup1Click(Sender: TObject);
    procedure HandelChangeGroup2Click(Sender: TObject);

  public
     AReportList : TStringList ;
     ALinksList : TStringList ;
      ASearchPanel : TSearchPanel ;
     LastShift: TShiftState ;
     SortIndex ,CopyFromID: Integer ;
     SortDirection,SortDirectionDoc : Boolean ;
     BIsFindScreen,LikeSeach : Boolean ;
     GenSqlCreditor,
     GenSqlDebtor, StrEvalCondition,StrEvalFontCol,StrEvalBackCol : String;
     GoToId : Integer ;
     LocateId : Integer ;
     MyBackord : TfmBackOrdersOutstanding ;
    APluginList : TStringlist ;
    APostCodePlugin : Integer ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    property UseCreditor : Boolean  read FUseCreditor write SetUseCreditor;
    procedure LoadDebtorInfo;
    procedure LoadCreditorInfo;
    Procedure LoadContacs(AAcountId : Integer);
    Procedure ClsScreen;
    procedure SetButtons(AButton : TButtonListType) ;
    procedure AsFindScreen(IsFind : Boolean) ;
    function  FilterFrefix : String ;
  end;
 

var
 
  isShowing:Boolean=true;

implementation

uses GlobalFunctions, Lookup, HtmlHelpAPI,
  LanguageChoice, TcVariables, DatabaseAccess,LedgerRoutines, XRoutines,
  ContactListing,   Main, DosTextReports,
  FreeReportsUnit,OSFGeneralRoutines,tcashclasses, UDMTCCoreLink, database,InvoiceEntryGrid,
  UReportManager,shellapi, TAccountView, DateUtils, ReverseBatch,
  UDmQuantumGridDefs;

{$R *.DFM}

Var
  UCSID:Integer;

Procedure TfmDebtor.OpenDocSql(aFilter,Order:String);
 Procedure ChargeDocSql;
begin
   if qryDocHead.Active then dmDatabase.qryDocHead.Close;
   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := 'select * from  DocHead ';
end;
begin
  with qryDocHead do begin
   ChargeDocSql;
   if aFilter<>'' then
   SQL.Add(' WHERE ' + aFilter);
   Order:=Trim(Order);
   SQL.Add('order by ');
   if (Order<>'') then
      SQL.Add(Order)
   else
     SQL.Add(' DocHead.SDocNo ');
   Open;
   end;
end;

Procedure TfmDebtor.LoadContacs(AAcountId: Integer);
var
 i : Integer ;
var
AFormat : String ;
begin
      AFormat := DMTCCoreLink.ReadLongSysparam('CONTACTFORMAT',0) ;
      if AFormat = '' then AFormat := '<@SHORTNAME@>' ;

  i := -1 ;
  if edtContact.ItemIndex <> -1 then
    i := Integer(edtContact.Items.Objects[edtContact.ItemIndex]) ;
// add Contact
   TDataBaseStringRoutines.FillStringListWithFormatSelect(edtContact.Items,'SELECT RECORDID aUID, trim(trim(trim(COALESCE(TITLE,'+QuotedStr('') + ')) ||'+QuotedStr(' ') + ' || COALESCE(FIRSTNAME,'+QuotedStr('') + ')) || '+QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,'+QuotedStr('') + '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in(select WContactID from ADDRESSPERACCOUNT where WAccountid = '+IntToStr(AAcountId)+')',Aformat,0);





    

  {  edtContact.Items.Clear;    }

    QadressPerAccount.Close; 
     edtContact.Items.AddObject('',TObject(0));
    QadressPerAccount.sql.text := 'Select * from contacts,AddressPerAccount where Contacts.RecordID = AddressPerAccount.WContactId and  AddressPerAccount.WaccountId = ' + IntToStr(AAcountId);

    QadressPerAccount.Open;
    QadressPerAccount.Filtered:=False;
    QadressPerAccount.Filter:='';
    QadressPerAccount.First;
 {   while not  QadressPerAccount.Eof do begin

      edtContact.Items.AddObject(QadressPerAccount.FieldByName('LastName').AsString,TObject(QadressPerAccount.FieldByName('RecordID').AsInteger));
      QadressPerAccount.Next;
    end;   }
   edtContact.ItemIndex := edtContact.Items.IndexOfObject(TObject(i));
   if edtContact.ItemIndex = -1 then edtContact.ItemIndex := 0 ;
end;

procedure TfmDebtor.LoadDebtorInfo;
begin
  LoadContacs(tblAccountWAccountID.Value);
  //get the debtor's name
  edtName.Text := tblAccountSDescription.Value;
  edtName.Properties.MaxLength :=  tblAccountSDescription.Size;
  //get the address details
  tblDebtor.Close;
  tblDebtor.ParamByName('WAccountID').AsInteger := tblAccountWAccountID.AsInteger ;
  tblDebtor.Open;

  edtAddress1.Text := tblDebtorSPostal1.Value;
  edtAddress1.Properties.MaxLength := tblDebtorSPostal1.Size ;
  edtAddress2.Text := tblDebtorSPostal2.Value;
  edtAddress2.Properties.MaxLength := tblDebtorSPostal2.Size ;
  edtAddress3.Text := tblDebtorSPostal3.Value;
  edtAddress3.Properties.MaxLength := tblDebtorSPostal3.Size ;
  edtPCode.Text := tblDebtorSPostalCode.Value;
  edtPCode.Properties.MaxLength:= tblDebtorSPostalCode.Size ;
  edtReference.Properties.MaxLength:= tblDebtorSREFERENCE.Size ;
   if Pos('TRN_',tblDebtorSLAYOUTINVOICE.AsString) = 1 then
    cBdocLayoutInv.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblDebtorSLAYOUTINVOICE.AsString,5,20),''),0)))
   else
  CBdocLayoutInv.ItemIndex :=   CBdocLayoutInv.Items.IndexOf(tblDebtorSLAYOUTINVOICE.AsString)  ;

   if Pos('TRN_',tblDebtorSLAYOUTCREDITNOTE.AsString) = 1 then
    CBdocLayoutCreditNote.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblDebtorSLAYOUTCREDITNOTE.AsString,5,20),''),0)))
   else

  CBdocLayoutCreditNote.ItemIndex :=   CBdocLayoutCreditNote.Items.IndexOf(tblDebtorSLAYOUTCREDITNOTE.AsString)  ;

   if Pos('TRN_',tblDebtorSLAYOUTQUOTE.AsString) = 1 then
    CBdocLayoutQuote.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblDebtorSLAYOUTQUOTE.AsString,5,20),''),0))) 
   else
  CBdocLayoutQuote.ItemIndex :=   CBdocLayoutQuote.Items.IndexOf(tblDebtorSLAYOUTQUOTE.AsString)  ;


  edtDelAddress1.Text := tblDebtorSDelivery1.Value;
  edtDelAddress2.Text := tblDebtorSDelivery2.Value;
  edtDelAddress3.Text := tblDebtorSDelivery3.Value;
cbTransmissionType.ItemIndex :=  tblDebtorWTRANSMISSIONTYPE.AsInteger ;
  edtDelAddress1.Properties.MaxLength := tblDebtorSDelivery1.Size;
  edtDelAddress2.Properties.MaxLength := tblDebtorSDelivery2.Size;
  edtDelAddress3.Properties.MaxLength := tblDebtorSDelivery3.Size;

  if cbOsfLanguage.Items.IndexOf(tblDebtorSLANGUAGE.AsString) <> -1 then
    cbOsfLanguage.ItemIndex :=   cbOsfLanguage.Items.IndexOf(tblDebtorSLANGUAGE.AsString)
    else
    cbOsfLanguage.ItemIndex :=   cbOsfLanguage.Items.IndexOf(DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage.Name) ;


  eDelCode.Properties.MaxLength := tblDebtorSDELIVERYCODE.Size;
  //get the other Debtor info
  edtPhone1.Properties.MaxLength := tblDebtorSTelephone1.Size;
  edtPhone2.Properties.MaxLength := tblDebtorSTelephone2.Size;
  edtFax.Properties.MaxLength := tblDebtorSFax.Size;
  edtEmail.Properties.MaxLength := tblDebtorSEmail.Size;
  ECompanyRegnr.Properties.MaxLength := tblDebtorSCOMPANYREGNO.Size;
  EFreeField1.Properties.MaxLength := tblDebtorSFREEFIELD1.Size;
  EFreeField2.Properties.MaxLength := tblDebtorSFREEFIELD2.Size;
  EFreeField3.Properties.MaxLength := tblDebtorSFREEFIELD3.Size;

  EWebsite.Properties.MaxLength := tblDebtorSWEBSITE.Size ;
  EWebsite.Text := tblDebtorSWEBSITE.AsString ;
  eDelCode.Text := tblDebtorSDELIVERYCODE.Value;
  //get the other Debtor info
  edtPhone1.Text := tblDebtorSTelephone1.Value;
  edtPhone2.Text := tblDebtorSTelephone2.Value;
  edtFax.Text := tblDebtorSFax.Value;
  edtEmail.Text := tblDebtorSEmail.Value;

  ECompanyRegnr.Text := tblDebtorSCOMPANYREGNO.AsString ;
  EFreeField1.Text := tblDebtorSFREEFIELD1.AsString ;
  EFreeField2.Text := tblDebtorSFREEFIELD2.AsString ;
  EFreeField3.Text := tblDebtorSFREEFIELD3.AsString ;
  //get the contact
  edtContact.ItemIndex := GetItemIndexFromId(edtContact.Items,tblDebtorWCONTACTID.AsInteger);
  CBCountry.ItemIndex := GetItemIndexFromId(CBCountry.Items,tblDebtorWPOSTCOUNTRIES_ID.AsInteger);
  CBDelCountry.ItemIndex := GetItemIndexFromId(CBDelCountry.Items,tblDebtorWDELCOUNTRIES_ID.AsInteger);

  
  //get the salesman

  edtSalesPerson.ItemIndex := edtSalesPerson.Items.IndexOfObject(TObject(tblDebtorWSalesmanID.Value));
  CbxRepGroup1.ItemIndex := CbxRepGroup1.Items.IndexOfObject(TObject(tblAccountWReportingGroup1ID.Value));
  CbxRepGroup2.ItemIndex := CbxRepGroup2.Items.IndexOfObject(TObject(tblAccountWReportingGroup2ID.Value));

  //get the other stuff
  edtStateMessage.Text := tblDebtorSMessage.Value;
   edtStateMessage.Properties.MaxLength := tblDebtorSMessage.Size;

  cbDisabled.Checked := tblAccountBINACTIVE.Value = 1;
  cbOpenItem.Checked := tblAccountBOPENITEM.Value = 1;
  edtCredLimit.Text :=  tblDebtorFCREDITLimit.AsString;
 
  edtChargeAmount.Text := tblDebtorFChargeAmount.AsString;

  edtReference.Text := tblDebtorSReference.Value;
  edtDiscount.Text := tblDebtorFDiscount.AsString;
  edtInterest.Text := tblDebtorFInterest.AsString;
  cbSellingPriceChoice.ItemIndex:=Str2Int(tblDebtorWDefaultPriceTypeID.AsString)-1;
  EBankAccountNr.Text :=   tblDebtorSBankAccountNumber.AsString ;
  EBankAccountNr.Properties.MaxLength := tblDebtorSBankAccountNumber.Size ;
  EBankname.Text := tblDebtorSBANKACCOUNTNAME.AsString  ;

  EBankAccountNr.Properties.MaxLength := tblDebtorSBANKNAME.Size ;
  EBankname2.Text := tblDebtorSBANKNAME.AsString  ;

  edSBANKACCOUNTNAME.Text := tblDebtorSCREDITCARDNUMBER.AsString  ;

  sigtext.Text := tblDebtorSCREDITCARDHOLDER.AsString  ;
   sigdate.Date := tblDebtorDEXPIRYDATE.AsDateTime  ;




  EBankAccountNr.Properties.MaxLength := tblDebtorSBANKNAME.Size ;

  CBAccountType.Text := tblDebtorSBranchCode.AsString ;
  if CBAccountType.Text = '' then
     CBAccountType.Text := CBAccountType.Items[1] ;
  if CBAccountType.Text = '@' then
     CBAccountType.Text := CBAccountType.Items[0] ;
  if  tblDebtorWDueDays.IsNull then
    begin
     EDueDays.Text := VarToStr(DMTCCoreLink.ReadSysParam('DEF_DUEDAYS',30,0));
   end
  else
  EDueDays.Text := inttoStr(tblDebtorWDueDays.AsInteger);

  CBUseDefaultAccount.Checked := (tblDebtorWDefaultAccount.AsInteger <> 0) and (tblDebtorWDefaultAccount.AsInteger <> -1) ;
  CBUseDefaultTax.Checked := (tblDebtorWDefaultTax.AsInteger <> 0) and (tblDebtorWDefaultTax.AsInteger <> -1) ;

  EUseDefaultAccount.Tag := tblDebtorWDefaultAccount.AsInteger ;
  EUseDefaultAccount.Text := AddDashInStdAccCode(GetAccountCode(EUseDefaultAccount.Tag));

  EUseDefaultTax.Tag := tblDebtorWDefaultTax.AsInteger ;
  EUseDefaultTax.Text := AddDashInStdAccCode(GetAccountCode(EUseDefaultTax.Tag));
  tblDebtor.Close;
end;

procedure TfmDebtor.LoadCreditorInfo;
begin
    LoadContacs(tblAccountWAccountID.Value);
  //get the creditor's name
  edtName.Text := tblAccountSDescription.Value;
  edtName.Properties.MaxLength := tblAccountSDescription.Size;
  //get the address details
  tblCreditor.Close ;
  tblCreditor.ParamByName('WAccountID').AsInteger := tblAccountWAccountID.AsInteger ;
  tblCreditor.Open;

  if Pos('TRN_',tblCreditorSLAYOUTINVOICE.AsString) = 1 then
    cBdocLayoutInv.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblCreditorSLAYOUTINVOICE.AsString,5,20),''),0)))
   else
  CBdocLayoutInv.ItemIndex :=   CBdocLayoutInv.Items.IndexOf(tblCreditorSLAYOUTINVOICE.AsString)  ;

   if Pos('TRN_',tblCreditorSLAYOUTCREDITNOTE.AsString) = 1 then
    CBdocLayoutCreditNote.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblCreditorSLAYOUTCREDITNOTE.AsString,5,20),''),0)))
   else

  CBdocLayoutCreditNote.ItemIndex :=   CBdocLayoutCreditNote.Items.IndexOf(tblCreditorSLAYOUTCREDITNOTE.AsString) ;

   if Pos('TRN_',tblCreditorSLAYOUTQUOTE.AsString) = 1 then
    CBdocLayoutQuote.ItemIndex :=  CBdocLayoutInv.Items.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(tblCreditorSLAYOUTQUOTE.AsString,5,20),''),0))) 
   else
  CBdocLayoutQuote.ItemIndex :=   CBdocLayoutQuote.Items.IndexOf(tblCreditorSLAYOUTQUOTE.AsString)  ;

 

  if cbOsfLanguage.Items.IndexOf(tblCreditorSLANGUAGE.AsString) <> -1 then
    cbOsfLanguage.ItemIndex :=   cbOsfLanguage.Items.IndexOf(tblCreditorSLANGUAGE.AsString)
    else
    cbOsfLanguage.ItemIndex :=   cbOsfLanguage.Items.IndexOf(DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage.Name) ;

  edtAddress1.Properties.MaxLength := tblCreditorSPostal1.Size;
  edtAddress2.Properties.MaxLength := tblCreditorSPostal2.Size;
  edtAddress3.Properties.MaxLength := tblCreditorSPostal3.Size;
  edtPCode.Properties.MaxLength := tblCreditorSPostalCode.Size;
  edtEmail.Properties.MaxLength := tblCreditorSEmail.Size;
  EWebsite.Properties.MaxLength := tblCreditorSWEBSITE.Size ;
  EWebsite.Text := tblCreditorSWEBSITE.AsString ;

  edtDelAddress1.Properties.MaxLength := tblCreditorSDelivery1.Size;
  edtDelAddress2.Properties.MaxLength := tblCreditorSDelivery2.Size;
  edtDelAddress3.Properties.MaxLength := tblCreditorSDelivery3.Size;
  eDelCode.Properties.MaxLength := tblCreditorSDELIVERYCODE.Size;
  edtPhone1.Properties.MaxLength := tblCreditorSTelephone1.Size;
  edtPhone2.Properties.MaxLength := tblCreditorSTelephone2.Size;
  edtFax.Properties.MaxLength := tblCreditorSFax.Size;
  ECompanyRegnr.Properties.MaxLength := tblCreditorSCOMPANYREGNO.Size;
  EFreeField1.Properties.MaxLength := tblCreditorSFREEFIELD1.Size;
  EFreeField2.Properties.MaxLength := tblCreditorSFREEFIELD2.Size;
  EFreeField3.Properties.MaxLength := tblCreditorSFREEFIELD3.Size;
  edtStateMessage2.Properties.MaxLength := tblCreditorSMessage.Size;
  edtReference.Properties.MaxLength := tblCreditorSReference.Size;
  edtCredLimit.Properties.MaxLength:=  tblCreditorFCREDITLimit.Size;
  edtChargeAmount.Properties.MaxLength := tblCreditorFChargeAmount.Size;
  edtDiscount.Properties.MaxLength := tblCreditorFDiscount.Size;
  EBankAccountNr.Properties.MaxLength :=   tblCreditorSBankAccountNumber.Size;
  EBankname.Properties.MaxLength := tblCreditorSBANKACCOUNTNAME.Size;
  EBankname2.Properties.MaxLength := tblCreditorWBANKNAME.Size;
 edSBANKACCOUNTNAME.Properties.MaxLength := tblCreditorSCREDITCARDNUMBER.Size;
  sigtext.Properties.MaxLength := tblDebtorSCREDITCARDHOLDER.Size  ;




  edtAddress1.Text := tblCreditorSPostal1.Value;
  edtAddress2.Text := tblCreditorSPostal2.Value;
  edtAddress3.Text := tblCreditorSPostal3.Value;
  edtPCode.Text := tblCreditorSPostalCode.Value;
  edtEmail.Text := tblCreditorSEmail.Value;
  edtDelAddress1.Text := tblCreditorSDelivery1.Value;
  edtDelAddress2.Text := tblCreditorSDelivery2.Value;
  edtDelAddress3.Text := tblCreditorSDelivery3.Value;
  eDelCode.Text := tblCreditorSDELIVERYCODE.Value;
  edtPhone1.Text := tblCreditorSTelephone1.Value;
  edtPhone2.Text := tblCreditorSTelephone2.Value;
  edtFax.Text := tblCreditorSFax.Value;
  ECompanyRegnr.Text := tblCreditorSCOMPANYREGNO.AsString ;
  EFreeField1.Text := tblCreditorSFREEFIELD1.AsString ;
  EFreeField2.Text := tblCreditorSFREEFIELD2.AsString ;
  EFreeField3.Text := tblCreditorSFREEFIELD3.AsString ;
  edtStateMessage2.Text := tblCreditorSMessage.Value;
  edtReference.Text := tblCreditorSReference.Value;
  edtCredLimit.Text :=  tblCreditorFCREDITLimit.AsString;
  edtChargeAmount.Text := tblCreditorFChargeAmount.AsString;
  edtDiscount.Text := tblCreditorFDiscount.AsString;
  EBankAccountNr.Text :=   tblCreditorSBankAccountNumber.AsString ;
  EBankname.Text := tblCreditorSBANKACCOUNTNAME.AsString  ;
  EBankname2.Text := tblCreditorWBANKNAME.AsString  ;
  edSBANKACCOUNTNAME.Text := tblCreditorSCREDITCARDNUMBER.AsString;

  sigtext.Text := tblDebtorSCREDITCARDHOLDER.AsString;
  sigdate.Date := tblDebtorDEXPIRYDATE.AsDateTime;





  cbTransmissionType.ItemIndex := tblCreditorWTRANSMISSIONTYPE.AsInteger ;

  //get the other stuff
  cbOpenItem.Checked := tblAccountBOPENITEM.Value = 1;
  cbDisabled.Checked := tblAccountBINACTIVE.Value = 1;

  edtContact.ItemIndex := edtContact.Items.IndexOfObject(TObject(tblCreditorWContactID.AsInteger));

  edtContact.ItemIndex := GetItemIndexFromId(edtContact.Items,tblCreditorWContactID.AsInteger);
  CBCountry.ItemIndex := GetItemIndexFromId(CBCountry.Items,tblCreditorWPOSTCOUNTRIES_ID.AsInteger);
  CBDelCountry.ItemIndex := GetItemIndexFromId(CBDelCountry.Items,tblCreditorWDELCOUNTRIES_ID.AsInteger);
  CbxRepGroup1.ItemIndex := CbxRepGroup1.Items.IndexOfObject(TObject(tblAccountWReportingGroup1ID.Value));
  CbxRepGroup2.ItemIndex := CbxRepGroup2.Items.IndexOfObject(TObject(tblAccountWReportingGroup2ID.Value));

  cbSellingPriceChoice.ItemIndex:=Str2Int(tblCreditorWDefaultPriceTypeID.AsString)-1;

  CBAccountType.Text := tblCreditorSBranchCode.AsString ;
  if CBAccountType.Text = '' then
     CBAccountType.Text := CBAccountType.Items[1] ;
  if CBAccountType.Text = '@' then
     CBAccountType.Text := CBAccountType.Items[0] ;

  if tblCreditorWDueDays.IsNull then
     EDueDays.Text := VarToStr(DMTCCoreLink.ReadSysParam('DEFC_DUEDAYS',30,0))
  else
   EDueDays.Text := inttoStr(tblCreditorWDueDays.AsInteger);

  CBUseDefaultAccount.Checked := (tblCreditorWDefaultAccount.AsInteger <> 0) and (tblCreditorWDefaultAccount.AsInteger <> -1) ;
  CBUseDefaultTax.Checked := (tblCreditorWDEFAULTTAX.AsInteger <> 0) and (tblCreditorWDEFAULTTAX.AsInteger <> -1) ;

  EUseDefaultAccount.Tag := tblCreditorWDefaultAccount.AsInteger ;
  EUseDefaultAccount.Text := AddDashInStdAccCode(GetAccountCode(EUseDefaultAccount.Tag));


  EUseDefaultTax.Tag := tblCreditorWDEFAULTTAX.AsInteger ;
  EUseDefaultTax.Text := AddDashInStdAccCode(GetAccountCode(EUseDefaultTax.Tag));

  tblCreditor.Close;
  tblCreditor.Filtered := false ;
end;




procedure TfmDebtor.FormShow(Sender: TObject);
var
 i : Integer ;


begin
  LimitSql := ReadLongSysparam('LIMITDEBCRED',DMTCCoreLink.currentuser);

   if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger
          <> 0 then
        begin
          edtSalesPerson.Enabled := false;
        end;


 Bexport.Caption := DMTCCoreLink.gettextlang(20063);
 DMTCCoreLink.LoadImage(Bexport.Glyph, 'Export');
 if ASearchPanel.LookupExists('ACCTYPE' +  BoolToStr(UseCreditor) ) then
 begin
   ASearchPanel.Parent := cxGrid1.Parent ;
   ASearchPanel.Align := altop ;
   Panel4.Visible := false ;
   ASearchPanel.Visible := true ;
   ASearchPanel.onSearch := OnGenSearchClick ;
   ASearchPanel.SetLookupType('ACCTYPE' +  BoolToStr(UseCreditor) ) ;
   ASearchPanel.Height := 200 ;
 end else
 begin
   Panel4.Visible := True ;
   ASearchPanel.Visible := False ;
 end;


  FillFreeReportLayoutBox(CBDocLayout.Items);
  CBDocLayout.Items.Insert(0,'');
  Openinbrowserfromimplink1.Caption := DMTCCoreLink.gettextlang(3183);

  CBdocLayoutInv.Items := CBDocLayout.Items ;
  CBdocLayoutCreditNote.Items := CBDocLayout.Items ;
  CBdocLayoutQuote.Items := CBDocLayout.Items ;
  lwebsite.Caption := DMTCCoreLink.gettextlang(3212);
  LoadPrintOutModes(cbDestination);
  if Self.Parent = nil then
  TDatabaseRegistyRoutines.ReadFormPos(self,IntToSTr(ord(UseCreditor)));


// RightsSystem
 if UseCreditor then
  begin
  PEditButtons.Visible := ReadSysParam('BEditCreditor',true,CurrentUser).AsBoolean ;
  edtStateMessage2.Visible := true ;
  edtStateMessage.Visible := false ;
  LMEssage2.Visible := True ;
  LMEssage.Visible := false ;
  tsBackorder.TabVisible := False ;

  DMTCCoreLink.LoadIconImage(self.Icon,'Creditors');

  end
 else
  begin
  edtStateMessage2.Visible := false ;
  edtStateMessage.Visible := True ;
  LMEssage2.Visible := false ;
  LMEssage.Visible := True ;
  PEditButtons.Visible := ReadSysParam('BEditDebtor',true,CurrentUser).AsBoolean;
  tsBackorder.TabVisible := True ;
  tsBackorder.Caption := DMTCCoreLink.GetTextLang(1191);
 
  DMTCCoreLink.LoadIconImage(self.Icon,'Debtors');
  end;

 CBAutoCopyContactInfo.Checked := ReadSysParam('CBAutoCopyContactInfo',true,CurrentUser).AsBoolean ;
 if not PEditButtons.Visible then
   begin
      Notebook1.Left := 0 ;
      Notebook1.Width := self.Width - 20 ;
   end;
// End rightSystem
  for i := 0 to QDebtorCreditor.FieldCount -1 do
    begin
      QDebtorCreditor.Fields[i].Origin := QDebtorCreditor.Fields[i].FieldName ;
    end ;
 QDebtorCreditorGroupDesc2.Origin := 'Groups2.SDescription' ;
 QDebtorCreditorGroupDesc1.Origin := 'Groups1.SDescription' ;
 QDebtorCreditorGroupSort1.Origin := 'Groups1.WSortNo' ;
 QDebtorCreditorGroupSort2.Origin := 'Groups2.WSortNo' ;
 QDebtorCreditorSDescription.Origin := 'Account.SDescription' ;
 QDebtorCreditorSACCOUNTCODE.Origin := 'Account.SACCOUNTCODE' ;

 QDebtorCreditorDELCOUNTRY.Origin := 'pc.COUNTRIES_NAME' ;
 QDebtorCreditorPOSCOUNTRY.Origin := 'dc.COUNTRIES_NAME' ;


 QDebtorCreditorSDescription.DisplayLabel := DMTCCoreLink.gettextlang(185);
 if UseCreditor then
 QDebtorCreditorSACCOUNTCODE.DisplayLabel := DMTCCoreLink.gettextlang(2219)
 else
 QDebtorCreditorSACCOUNTCODE.DisplayLabel := DMTCCoreLink.gettextlang(2218) ;
 QDebtorCreditorSPostal1.DisplayLabel := DMTCCoreLink.gettextlang(186);
 QDebtorCreditorSPostal2.DisplayLabel := DMTCCoreLink.gettextlang(2206);
 QDebtorCreditorSPostal3.DisplayLabel := DMTCCoreLink.gettextlang(2420);
 QDebtorCreditorSPostalCode.DisplayLabel := DMTCCoreLink.gettextlang(190);
 QDebtorCreditorPOSCOUNTRY.DisplayLabel := DMTCCoreLink.gettextlang(2049);
 QDebtorCreditorSTelephone1.DisplayLabel := DMTCCoreLink.gettextlang(1252);
 QDebtorCreditorSTelephone2.DisplayLabel := DMTCCoreLink.gettextlang(1253);
 QDebtorCreditorSFax.DisplayLabel := DMTCCoreLink.gettextlang(189);
 QDebtorCreditorSEmail.DisplayLabel := DMTCCoreLink.gettextlang(191);
 QDebtorCreditorSBranchCode.DisplayLabel := DMTCCoreLink.gettextlang(2210);
 QDebtorCreditorSBankAccountNumber.DisplayLabel := DMTCCoreLink.gettextlang(2211);
 QDebtorCreditorSReference.DisplayLabel := DMTCCoreLink.gettextlang(1719);
 QDebtorCreditorDLastActivity.DisplayLabel := DMTCCoreLink.gettextlang(229);
 QDebtorCreditorWDueDays.DisplayLabel := DMTCCoreLink.gettextlang(2241);
 QDebtorCreditorLastName.DisplayLabel := DMTCCoreLink.gettextlang(197);
 QDebtorCreditorFIRSTNAME.DisplayLabel := DMTCCoreLink.gettextlang(3029);

 QDebtorCreditorSDELIVERYCODE.DisplayLabel := DMTCCoreLink.gettextlang(2049) + ' ' + DMTCCoreLink.gettextlang(190);

 QDebtorCreditorDELCOUNTRY.DisplayLabel := DMTCCoreLink.gettextlang(2049) + ' ' + DMTCCoreLink.gettextlang(2207);
 QDebtorCreditorSDELIVERY1.DisplayLabel := DMTCCoreLink.gettextlang(2049) + ' ' + DMTCCoreLink.gettextlang(186);
 QDebtorCreditorSDELIVERY2.DisplayLabel := DMTCCoreLink.gettextlang(2049) + ' ' + DMTCCoreLink.gettextlang(2206);
 QDebtorCreditorSDELIVERY3.DisplayLabel := DMTCCoreLink.gettextlang(2049) + ' ' + DMTCCoreLink.gettextlang(2420);

 LState.Caption := DMTCCoreLink.gettextlang(2420);
 LDState.Caption := DMTCCoreLink.gettextlang(2420);
 cbShowInactive.Caption := DMTCCoreLink.gettextlang(3567);
 tsBankAccounts.Caption := DMTCCoreLink.gettextlang(3165);
 BBankAdd.Caption := DMTCCoreLink.gettextlang(1840);
 bBankDelete.Caption := DMTCCoreLink.gettextlang(3149);
 ZQAccountRefSREFERENCE.DisplayLabel :=  DMTCCoreLink.gettextlang(2211);


 if UseCreditor then
 begin
   QDebtorCreditorGroupDesc1.DisplayLabel := TDataBaseRoutines.GetTypeDescription(24);
   QDebtorCreditorGroupSort1.DisplayLabel := TDataBaseRoutines.GetTypeDescription(24) + ' ' + DMTCCoreLink.gettextlang(2242);
   QDebtorCreditorGroupDesc2.DisplayLabel := TDataBaseRoutines.GetTypeDescription(25);
   QDebtorCreditorGroupSort2.DisplayLabel := TDataBaseRoutines.GetTypeDescription(25) + ' ' + DMTCCoreLink.gettextlang(2242);
 end else
 begin
   QDebtorCreditorGroupDesc1.DisplayLabel := TDataBaseRoutines.GetTypeDescription(22);
   QDebtorCreditorGroupSort1.DisplayLabel := TDataBaseRoutines.GetTypeDescription(22) + ' ' + DMTCCoreLink.gettextlang(2242);
   QDebtorCreditorGroupDesc2.DisplayLabel :=TDataBaseRoutines.GetTypeDescription(23);
   QDebtorCreditorGroupSort2.DisplayLabel := TDataBaseRoutines.GetTypeDescription(23) + ' ' + DMTCCoreLink.gettextlang(2242);
 end;
 
 
 Filter.Caption := DMTCCoreLink.gettextlang(2870);
 Value.Caption := DMTCCoreLink.gettextlang(2871);
 BFilter2.Caption := DMTCCoreLink.gettextlang(20097);
 BClearFilter.Caption := DMTCCoreLink.gettextlang(1016);
 bShowTrans.Caption := DMTCCoreLink.GetTextLang(269);
// BReport.Caption := DMTCCoreLink.gettextlang(1754);
// BImport.Caption := DMTCCoreLink.gettextlang(2014);
// BExport.Caption := DMTCCoreLink.gettextlang(2013);

 CBOperatot.items[0] := DMTCCoreLink.gettextlang(20025);

 TSTransactions.Caption := DMTCCoreLink.gettextlang(20069);
  LDebit.Caption := DMTCCoreLink.gettextlang(211);
  LCredit.Caption := DMTCCoreLink.gettextlang(212);
  cxGrid5DBTableView1SREFERENCE.Caption := DMTCCoreLink.gettextlang(607); {Reference}
  cxGrid5DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(1708); {Description}

  cxGrid5DBTableView1DDATE.Caption := DMTCCoreLink.gettextlang(238); {Date}
  cxGrid5DBTableView1FAMOUNT.Caption := DMTCCoreLink.gettextlang(1712); {Amount}
  cxGrid5DBTableView1FOUTSTANDINGAMOUNT.Caption := DMTCCoreLink.gettextlang(947); {Outstanding}

  cxGrid6DBTableView1SREFERENCE.Caption := DMTCCoreLink.gettextlang(607); {Reference}
  cxGrid6DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(1708); {Description}

  cxGrid6DBTableView1DDATE.Caption := DMTCCoreLink.gettextlang(238); {Date}
  cxGrid6DBTableView1FAMOUNT.Caption := DMTCCoreLink.gettextlang(1712); {Amount}
  cxGrid6DBTableView1FOUTSTANDINGAMOUNT.Caption := DMTCCoreLink.gettextlang(947); {Outstanding}

  tsStock.Caption := DMTCCoreLink.GetTextLangNoAmp(27);




    cxGrid4DBTableView1DDATE.Caption := DMTCCoreLink.GetTextLang(1802);// date
  cxGrid4DBTableView1FQTYSHIPPED.Caption := DMTCCoreLink.GetTextLang(2052);// Qty
  cxGrid4DBTableView1SDOCNO.Caption := DMTCCoreLink.GetTextLang(1120);// Docno
  cxGrid4DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(1708);// Description

    cxGrid4DBTableView1FSELLINGPRICE.Caption := DMTCCoreLink.GetTextLang(1709);// sel
    cxGrid4DBTableView1FITEMDISCOUNT.Caption := DMTCCoreLink.GetTextLang(1786);// disc

   // cxGrid4DBTableView1FEXCLUSIVEAMT.Caption := DMTCCoreLink.GetTextLang(684);// exc
    cxGrid4DBTableView1FEXCLUSIVEAMT.Caption := DMTCCoreLink.GetTextLang(906011);// exc
    cxGrid4DBTableView1FINCLUSIVEAMT.Caption := DMTCCoreLink.GetTextLang(906012);// inc

    cxGrid4DBTableView1FUNITQTY.Caption := DMTCCoreLink.GetTextLang(214);// qty
    cxGrid4DBTableView1UNITDESC.Caption := DMTCCoreLink.GetTextLang(178);// unit



    cxGrid4DBTableView1WTYPEID.Caption := DMTCCoreLink.GetTextLang(1869);// doctype
    cxGrid4DBTableView1BPOSTED.Caption := DMTCCoreLink.GetTextLang(961);// posted

    cxGrid4DBTableView1SSTOCKCODE.Caption := DMTCCoreLink.GetTextLang(213);// unit
    cxGrid4DBTableView1STOCKDESC.Caption := DMTCCoreLink.GetTextLang(1708);// unit


 CBAutoCopyContactInfo.Caption := DMTCCoreLink.gettextlang(2927); {Auto copy info}
 LCBUseDefaultAccount.Caption := DMTCCoreLink.gettextlang(2928); {Use default account}
 LEUseDefaultAccount.Caption := DMTCCoreLink.gettextlang(2929); {Default account}
 TSContacts.Caption := DMTCCoreLink.gettextlang(2876); {Contacts}
  edtAccountNumber.Properties.MaxLength :=  MainAccountLength + 3 ;
 

  GetTxfTypeSpec;
  UCSID:= GetT3UserID('UCS');
  isShowing:=True;
  ButtonPanel.Color := MainPanelColor;
  PRightBtn.Color :=  MainPanelColor;
  PBtn2.Color :=  MainPanelColor;
  PRgtBtn2.Color := MainPanelColor;
  pgconDebtor.ActivePageIndex := 0;
  
  cbOpenItem.Checked := True;


  if UseCreditor then
  begin
    Label21.Caption := TDataBaseRoutines.GetTypeDescription(24);
    Label22.Caption := TDataBaseRoutines.GetTypeDescription(25);
    // done : Pieter hide the disable ?
  //  cbDisabled.Visible := false;
    LAccountCode.Caption := DMTCCoreLink.gettextlang(2219) ;
    LMEssage2.Caption := DMTCCoreLink.gettextlang(2218) ;
  end
  else
  begin
    LMEssage.Caption := DMTCCoreLink.gettextlang(239) ;
    Label21.Caption := TDataBaseRoutines.GetTypeDescription(22);
    Label22.Caption := TDataBaseRoutines.GetTypeDescription(23);
    LAccountCode.Caption := DMTCCoreLink.gettextlang(2218);
  end;
  cbSellingPriceChoice.Clear;
  cbSellingPriceChoice.Items.Add(DMTCCoreLink.ReadSysVar('SSellingPriceName1'));
  cbSellingPriceChoice.Items.Add(DMTCCoreLink.ReadSysVar('SSellingPriceName2'));
  cbSellingPriceChoice.Items.Add(DMTCCoreLink.ReadSysVar('SSellingPriceName3'));

  //edtAccountNumber.SetFocus;
  tblAccount.filtered:=False;
  tblAccount.Filter:='';
  isShowing:=False;
  LCity.caption :=    DMTCCoreLink.gettextlang(2206) ;
  LDCity.caption :=    DMTCCoreLink.gettextlang(2206) ;
  LCountry.caption := DMTCCoreLink.gettextlang(2207) ;
  Label3.caption := DMTCCoreLink.gettextlang(2207) ;
  CBAccountType.Items[0] :=  DMTCCoreLink.gettextlang(2208) ;
  CBAccountType.Items[1] :=  DMTCCoreLink.gettextlang(2209) ;
  LBankAccountType.caption := DMTCCoreLink.gettextlang(2210) ;
  LBankAccountNR.caption := DMTCCoreLink.gettextlang(2211) ;
  LBankName.caption := DMTCCoreLink.gettextlang(3026) ;
  LCBUseDefaultTax.Caption := DMTCCoreLink.gettextlang(3027) ;
  LEUseDefaultTax.Caption := DMTCCoreLink.gettextlang(3028) ;
  DestLbl.Caption := DMTCCoreLink.gettextlang(240) ;

  lblPrnType.Caption := DMTCCoreLink.gettextlang(1910) ;
  BPrint.Caption := DMTCCoreLink.gettextlang(2398) ;
  lblCopies.Caption := DMTCCoreLink.gettextlang(866) ;


               //general information tag 352

              // tsGeneral.Caption :=  DMTCCoreLink.gettextlang(352);

               //accounting info tag 353
                tSACCOUNT.Caption :=  DMTCCoreLink.gettextlang(353);
               //Account Number 176
              //  Label1.Caption :=  DMTCCoreLink.gettextlang(176);
               //Name 185
                Label2.Caption :=  DMTCCoreLink.gettextlang(185);
               //Address 186
                LAdress.Caption :=  DMTCCoreLink.gettextlang(2220);
                //Post code 190
                Label4.Caption :=  DMTCCoreLink.gettextlang(190);
                //Phone 1 187
                Label5.Caption :=  DMTCCoreLink.gettextlang(187);
               //Phone 2 188
                Label6.Caption :=  DMTCCoreLink.gettextlang(188);
               //Fax 189
                Label7.Caption :=  DMTCCoreLink.gettextlang(189);
               //Email 191
                Label8.Caption :=  DMTCCoreLink.gettextlang(191);
               //Contact name 197
                Label11.Caption :=  DMTCCoreLink.gettextlang(197);
               //Sales person 198
                Label12.Caption :=  DMTCCoreLink.gettextlang(198);
               //Delivery Address 199
                Label9.Caption :=  DMTCCoreLink.gettextlang(199);
                //Account disabled 201
                LcbDisabled.Caption :=  DMTCCoreLink.gettextlang(201);
               //Open item account 184
                LcbOpenItem.Caption :=  DMTCCoreLink.gettextlang(184);
               //Credit limit 192
                Label13.Caption :=  DMTCCoreLink.gettextlang(192);
               //Charge amount 193
                Label14.Caption :=  DMTCCoreLink.gettextlang(193);
               //Tax reference 202
                Label15.Caption :=  DMTCCoreLink.gettextlang(202);
               //Customer discount 203
                Label16.Caption :=  DMTCCoreLink.gettextlang(203);
               //% 205
                Label17.Caption :=  DMTCCoreLink.gettextlang(205);
               //Monthly interest on overdue amounts 204
                Label18.Caption :=  DMTCCoreLink.gettextlang(204);
               //% 205
                Label19.Caption :=  DMTCCoreLink.gettextlang(205);
               // Selling Price
               Label20.Caption :=  DMTCCoreLink.gettextlang(416);
               //OK 167
                btnOK.Caption :=  DMTCCoreLink.gettextlang(167);
               //Cancel 168
               BitBtnCancel.Caption :=  DMTCCoreLink.gettextlang(168);
                // btnCancel.Caption :=  DMTCCoreLink.gettextlang(168);
                btnCancel.Caption :=  DMTCCoreLink.gettextlang(828);
               // cbPostBBF

               LDueDays.Caption :=  DMTCCoreLink.gettextlang(2221);
               // due days

               // navBtns(VpNavBar1.FolderCollection.Item[0],fcSearch,fcDelete,fcSave1);
                // no search BDelete get done again see navbtns.

 LInvLayout.Caption :=  DMTCCoreLink.gettextlang(3109);
 LCreditLayout.Caption :=  DMTCCoreLink.gettextlang(3110);
 LQuoteLayout.Caption :=  DMTCCoreLink.gettextlang(3111);
 LLanguage.Caption :=  DMTCCoreLink.gettextlang(3112);

 BEdit.Caption := DMTCCoreLink.gettextlang(121);
 BCancel.Caption := DMTCCoreLink.gettextlang(168);





 navBtns(BNew,BDelete,BDelete,BSave);

  edtSalesPerson.Items.Clear;

  lECompanyRegnr.Caption :=DMTCCoreLink.gettextlang( 316) ;
  lEFreeField1.Caption :=DMTCCoreLink.gettextlang( 200)+' 1'  ;
  lEFreeField2.Caption :=DMTCCoreLink.gettextlang( 200)+' 2'  ;
  lEFreeField3.Caption :=DMTCCoreLink.gettextlang( 200)+' 3'  ;

   Label10.Caption := DMTCCoreLink.gettextlang(190) ;
   {       //Free input
   DMTCCoreLink.gettextlang(681);
    //Statement message 200
   Label10.Caption :=DMTCCoreLink.gettextlang(200);  }


  if UseCreditor then
  begin
    CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,24);
    CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,25);
    Caption :=DMTCCoreLink.gettextlang(251);
    tsStatement.Caption :=DMTCCoreLink.gettextlang(199);

    Label12.Visible:=False;
    Label16.Visible:=False;
    Label17.Visible:=False;
    Label18.Visible:=False;
    Label19.Visible:=False;
    edtInterest.Visible:=False;
    edtSalesPerson.Visible:=False;
    edtDiscount.Visible:=False;
    // Selling Price
    Label20.Visible:=False;
    cbSellingPriceChoice.Visible:=False;
   // CallLookup(edtAccountNumber.Text, 4);
  end
  else
  begin
    CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,22);
    CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,23);
    edtSalesPerson.Enabled:=FillStringsWithReportingGroups(edtSalesPerson.Items,31);

     //Header 252 Debtor
    Caption :=DMTCCoreLink.gettextlang(252);
    //statements tag 354
    tsStatement.Caption :=DMTCCoreLink.gettextlang(199);

   // CallLookup(edtAccountNumber.Text, 3);
  end;
  AddRepgroupMenuitems ;
  SetButtons(bfcSearch) ;
  CBFindColumn.clear ;
  EditBtns(BCAdd,BCEdit,BCDelete);
  BCFind.Caption := DMTCCoreLink.gettextlang(952) ;
  cxGrid7DBTableView1FIRSTNAME.Caption := DMTCCoreLink.gettextlang(3029);
  cxGrid7DBTableView1LASTNAME.Caption := DMTCCoreLink.gettextlang(185);
  cxGrid7DBTableView1TITLE.Caption := DMTCCoreLink.gettextlang(2386);
  cxGrid7DBTableView1ADDRESS.Caption := DMTCCoreLink.gettextlang(186);
  cxGrid7DBTableView1CITY.Caption := DMTCCoreLink.gettextlang(2419);
  cxGrid7DBTableView1STATE.Caption := DMTCCoreLink.gettextlang(2420);
  cxGrid7DBTableView1PHONE1.Caption := DMTCCoreLink.gettextlang(187);
  cxGrid7DBTableView1PHONE2.Caption := DMTCCoreLink.gettextlang(188);
  cxGrid7DBTableView1PHONE3.Caption := DMTCCoreLink.gettextlang(189);
  cxGrid7DBTableView1EMAIL.Caption := DMTCCoreLink.gettextlang(191);

  TSAppointments.Caption := DMTCCoreLink.gettextlang(2404);


  cxGrid3DBTableView1SDOCNO.Caption := DMTCCoreLink.gettextlang(1120);
  cxGrid3DBTableView1DDATE.Caption := DMTCCoreLink.gettextlang(238);
  cxGrid3DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(178);
  cxGrid3DBTableView1BPRINTED.Caption := DMTCCoreLink.gettextlang(2964);
  cxGrid3DBTableView1FDOCAMOUNT.Caption := DMTCCoreLink.gettextlang(1137);
  cxGrid3DBTableView1SREFERENCE.Caption := DMTCCoreLink.gettextlang(607);


  TSInvoicesQuotes.Caption := DMTCCoreLink.gettextlang(38);

   cxGrid1DBBandedTableView1.RestoreFromRegistry('Software\osfinancials\gridsdeb\'+IntToStr(ord(UseCreditor))+ FilterFrefix+'cols',false);


 
  CBFindColumn.AddItem(DMTCCoreLink.gettextlang(2321),TObject(-1));

{   ASearchPanel.Parent := DBGSearch.Parent ;
   ASearchPanel.Align := altop ;
   Panel4.Visible := false ;
   ASearchPanel.Visible := true ;
   ASearchPanel.onSearch := OnGenSearchClick ;
   ASearchPanel.SetLookupType('ACCTYPE' +  BoolToStr(UseCreditor) ) ;
   ASearchPanel.Height := 200 ;
                                   }
    for i := 0 to  cxGrid1DBBandedTableView1.ColumnCount-1 do
     begin
      if cxGrid1DBBandedTableView1.Columns[i].Caption <> '' then
       begin
        CBFindColumn.AddItem(cxGrid1DBBandedTableView1.Columns[i].Caption,TObject(i));
       { if DBGSearch.Columns[i].Field <> nil then
         with ASearchPanel.aSearchCollection.Add as TSearchCollectionItem do
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

            

        end;   }

       end;

     end;
// ASearchPanel.SaveEditedToDatabase ;
 EFilterValue.Text :=  ReadReportOp( IntToStr(ord(UseCreditor))+FilterFrefix+'CANDFilterValue','').asString;
 CBFindColumn.ItemIndex := ReadReportOp( IntToStr(ord(UseCreditor))+FilterFrefix+'CANDFilterIndex',0).asinteger;
 CBOperatot.ItemIndex := ReadReportOp(IntToStr(ord(UseCreditor))+FilterFrefix+'CANDOperatorIndex',0).asinteger;
 // init data

  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
      begin
         if  @AFormPluginRecordArray[i].aDocSearch <> nil then
            begin
               if AFormPluginRecordArray[i].aForm <> nil then
                  CBFindColumn.AddItem(TForm(AFormPluginRecordArray[i].aForm).Caption,TObject(i));
            end;
      end;


if gotoid <> 0 then
  begin
      if  not UseCreditor then
      begin
      QDebtorCreditor.close ;
      QDebtorCreditor.SQL.clear ;
      QDebtorCreditor.SQL.Add(GenSqlDebtor);
      QDebtorCreditor.SQL.add(' and Account.WaccountId='+ IntToStr(gotoid));
      QDebtorCreditor.open ;
      BEditClick(self);
      end else
      begin
      QDebtorCreditor.close ;
      QDebtorCreditor.SQL.clear ;
      QDebtorCreditor.SQL.Add(GenSqlCreditor);
      QDebtorCreditor.SQL.add(' and Account.WaccountId='+ IntToStr(gotoid));
      QDebtorCreditor.open ;
      BEditClick(self);
      end;
  end else
  begin
     if  ASearchPanel.Visible then
        OnGenSearchClick(self)
     else
     begin
     BFilterClick(self);
     if CBFindColumn.ItemIndex <> 0 then
     EFilterValue.SetFocus ;
     end;
  end;
end;

procedure TfmDebtor.CheckAccountCode(Sender: TObject);
var
  MainTemp, SubTemp : String;
begin
  // make sure it does not contain spaces
  edtAccountNumber.Text := UpperCase(StringReplace(edtAccountNumber.Text,' ','',[rfReplaceAll]));
  if (edtAccountNumber.Text = '') OR ((AccountLock=1) AND (CurrentUser<>UCSID) And (Copy(edtAccountNumber.Text,1,1)='9')) then begin
    OSFMessageDlg(DMTCCoreLink.gettextlang(748){Illegal account Number?}, mterror, [mbOk], 0);
    edtAccountNumber.Text := '';
    edtAccountNumber.Setfocus;
    exit;
  end;
  if CheckAccountNumber(edtAccountNumber.Text) = True then
  begin
    //Split the account code
    if Length(edtAccountNumber.Text) >= MainAccountLength then
    begin
      MainTemp := trim(GetMainAccountCode(edtAccountNumber.Text ));
      SubTemp := GetSubAccountCode(edtAccountNumber.Text,false,false );
    end
    else
    begin
      MainTemp :=  trim(edtAccountNumber.Text);
      SubTemp := '';
    end;
    if UseCreditor then  // If is creditor
      begin
        tblAccount.Close ;
        tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 2);
        tblAccount.Open ;
        if tblAccount.isEmpty then
          if  not QDebtorCreditor.isempty then
           if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
              begin
                tblAccount.Close ;
                tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
                tblAccount.Open ;
                tblAccount.edit ;
                tblAccountSMAINACCOUNTCODE.AsString := Maintemp ;
                tblAccountSSUBACCOUNTCODE.AsString := SubTemp ;
                tblAccountSACCOUNTCODE.AsString := Maintemp + SubTemp ;
                tblAccount.post ;
              end;

        if tblAccount.isEmpty then
        begin
          if OSFMessageDlg(DMTCCoreLink.gettextlang(457){Do you want to create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mrYes then
          begin
           // why this ?
           // cbOpenItem.Checked:=False;
            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := MainTemp;
            tblAccountSSUBACCOUNTCODE.Value := SubTemp;
            tblAccountWAccountTypeID.Value := 2;//Creditor type
            tblAccountBOPENITEM.AsInteger := 1 ;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.Value := MainTemp+SubTemp;
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);
            tblCreditor.Open;
            tblCreditor.Insert;
            tblCreditorWAccountID.Value := tblAccountWAccountID.Value;
            tblCreditorSCode.Value := MainTemp + SubTemp;
            tblCreditor.Post;
            tblCreditor.Close;
            tblAccount.Close;
            edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
            if edtAccountNumber.Text <> _IncrementString(edtAccountNumber.Text) then
            WriteSysParam('NEWCREDNR',_IncrementString(edtAccountNumber.Text),0) else
             WriteSysParam('NEWCREDNR','@');
                         
            edtAccountNumber.Enabled := False ;
          end
          else
          begin
            tblAccount.Close;
          end;
        end
        else
        begin
          LoadCreditorInfo;
          edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
          tblAccount.Close;
         edtAccountNumber.Enabled := False ;
          //edtName.SetFocus;
        end;
      end
    else // if is Debitor
      begin
        tblAccount.Close ;
        tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 1);
        tblAccount.Open ;
      if tblAccount.isEmpty then
         if  not QDebtorCreditor.isempty then
           if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
              begin
                tblAccount.Close ;
                tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
                tblAccount.Open ;
                tblAccount.edit ;
                tblAccountSMAINACCOUNTCODE.AsString := Maintemp ;
                tblAccountSSUBACCOUNTCODE.AsString := SubTemp ;
                tblAccountSACCOUNTCODE.AsString := Maintemp + SubTemp ;
                tblAccount.post ;
              end;

        if tblAccount.isEmpty then
        begin
          if OSFMessageDlg(DMTCCoreLink.gettextlang(432){Do you want to create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mrYes then
          begin
            // why this ?
            // cbOpenItem.Checked:=False;
            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := MainTemp;
            tblAccountSSUBACCOUNTCODE.Value := SubTemp;
            tblAccountWAccountTypeID.Value := 1;//Debtor type
            tblAccountBOPENITEM.AsInteger := 1 ;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.Value := MainTemp+SubTemp;
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);
            tblDebtor.Open;
            tblDebtor.Insert;
            tblDebtorWAccountID.Value := tblAccountWAccountID.Value;
            tblDebtor.Post;
            tblDebtor.Close;
            tblAccount.Close;
            if edtAccountNumber.Text <> _IncrementString(edtAccountNumber.Text) then
              WriteSysParam('NEWDEBNR',_IncrementString(edtAccountNumber.Text),0)
            else
              WriteSysParam('NEWDEBNR','@');

            edtAccountNumber.Enabled := False ;
            edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
            //edtName.SetFocus;
          end
          else
          begin
            tblAccount.Close;
          end;
        end
        else
        begin
          LoadDebtorInfo;
          edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
          tblAccount.Close;
          edtAccountNumber.Enabled := False ;
        end;
      end;
    end
    else
    begin
      OSFMessageDlg(DMTCCoreLink.gettextlang(433){Invalid account number, the first letter must be a number}, mterror, [mbok], 0);
      edtAccountNumber.Text := '';
      if edtAccountNumber.canfocus then
      edtAccountNumber.SetFocus;
    end;
 //edtName.SetFocus;
end;

procedure TfmDebtor.btnOkClick(Sender: TObject);
var
  MainTemp, SubTemp : String;
begin
// if trim(edtAccountNumber.Text)='' then
 // pgconDebtor.ActivePageIndex:=0;
 try
  if not CheckCreateAccount(self) then
    exit ;
  if ZQAccountRef.UpdatesPending then
    begin
     ZQAccountRef.first ;
     while not ZQAccountRef.Eof do
       begin
          if (ZQAccountRefWACCOUNTID.AsInteger = 0) or (ZQAccountRefWACCOUNTREFID.AsInteger = 0) then
            begin
             ZQAccountRef.Edit ;
             ZQAccountRefWACCOUNTID.AsInteger :=  edtAccountNumber.tag ;
             if  ZQAccountRefWACCOUNTREFID.AsInteger = 0 then
                 ZQAccountRefWACCOUNTREFID.AsInteger := DMTCCoreLink.GetNewIdStr('gen_accountref_id');
             ZQAccountRef.Post ;
            end;
         ZQAccountRef.next ;
       end;
     ZQAccountRef.ApplyUpdates ;
    end;
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
               MyBackord.ZQBackorderWSTOCKID.AsInteger := edtAccountNumber.tag ;
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


  if UseCreditor then
  begin
    CreditorOkClick(Sender);

    exit;
  end;
  //Split the account code
  if Length(edtAccountNumber.Text) >= MainAccountLength then
  begin
    MainTemp := GetMainAccountCode(edtAccountNumber.Text );
    SubTemp := GetSubAccountCode(edtAccountNumber.Text,false,false );
  end
  else
  begin
    MainTemp := GetMainAccountCode(edtAccountNumber.Text );
    SubTemp := '';
  end;
  tblAccount.Close ;
  tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 1);
  tblAccount.Open ;
   if tblAccount.isEmpty then
      if  not QDebtorCreditor.isempty then
        if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
           begin
             tblAccount.Close ;
             tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
             tblAccount.Open ;
           end;

  tblAccount.Edit;
  tblAccountSDescription.Value := edtName.Text;
  tblAccountWReportingGroup1ID.Value := 0 ;
  if CbxRepGroup1.ItemIndex <> -1 then
  tblAccountWReportingGroup1ID.Value := Integer(CbxRepGroup1.Items.Objects[CbxRepGroup1.ItemIndex]);
  tblAccountWReportingGroup2ID.Value := 0 ;
  if CbxRepGroup2.ItemIndex <> -1 then
  tblAccountWReportingGroup2ID.Value := Integer(CbxRepGroup2.Items.Objects[CbxRepGroup2.ItemIndex]);
  // Save Reporting Groups



  tblAccountBOPENITEM.Value := ord(cbOpenItem.Checked);

  tblAccountBINACTIVE.Value := ord(cbDisabled.Checked);
  tblAccount.Post;


  tblDebtor.Close;
  tblDebtor.ParamByName('WAccountID').AsInteger := tblAccountWAccountID.AsInteger ;
  tblDebtor.Open;

  if tblDebtor.IsEmpty then
  begin
     tblDebtor.Insert ;
     tblDebtorWACCOUNTID.AsInteger := tblAccountWAccountID.AsInteger ;
  end else
  tblDebtor.Edit;
  //Save the Address details
  tblDebtorSPostal1.Value := edtAddress1.Text;
  tblDebtorSPostal2.Value := edtAddress2.Text;
  tblDebtorSPostal3.Value := edtAddress3.Text;
  tblDebtorSPostalCode.Value := edtPCode.Text;
  tblDebtorSDelivery1.Value := edtDelAddress1.Text;
  tblDebtorSDelivery2.Value := edtDelAddress2.Text;
  tblDebtorSDelivery3.Value := edtDelAddress3.Text;
  tblDebtorWTRANSMISSIONTYPE.AsInteger :=  cbTransmissionType.ItemIndex ;
  tblDebtorSDELIVERYCODE.AsString := eDelCode.Text;
  tblDebtorSLANGUAGE.AsString := cbOsfLanguage.Text ;
  tblDebtorSWEBSITE.AsString := EWebsite.Text ;
  if (CBdocLayoutInv.ItemIndex > -1) and (CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex] <> nil) then
   tblDebtorSLAYOUTINVOICE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex]))
   else
  tblDebtorSLAYOUTINVOICE.AsString := CBdocLayoutInv.Text  ;

  if (CBdocLayoutCreditNote.ItemIndex > -1) and (CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex] <> nil) then
   tblDebtorSLAYOUTCREDITNOTE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex]))
   else
  tblDebtorSLAYOUTCREDITNOTE.AsString := CBdocLayoutCreditNote.Text  ;

  if (CBdocLayoutQuote.ItemIndex > -1) and (CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex] <> nil) then
   tblDebtorSLAYOUTQUOTE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex]))
   else
  tblDebtorSLAYOUTQUOTE.AsString := CBdocLayoutQuote.Text  ;



  tblDebtorSCOMPANYREGNO.AsString := ECompanyRegnr.Text  ;
  tblDebtorSFREEFIELD1.AsString := EFreeField1.Text ;
  tblDebtorSFREEFIELD2.AsString := EFreeField2.Text ;
  tblDebtorSFREEFIELD3.AsString := EFreeField3.Text ;

  //save the other Debotr info
  tblDebtorSTelephone1.Value := edtPhone1.Text;
  tblDebtorSTelephone2.Value := edtPhone2.Text;
  tblDebtorSFax.Value := edtFax.Text;
  tblDebtorSEmail.Value := edtEmail.Text;

  //save the contact

  SetFieldWithIndexValue(tblDebtorWContactID,edtContact.Items,edtContact.ItemIndex) ;
  if tblDebtorWContactID.IsNull then
     tblDebtorWContactID.AsInteger := 0 ;

  SetFieldWithIndexValue(tblDebtorWPOSTCOUNTRIES_ID,CBCountry.Items,CBCountry.ItemIndex);
  SetFieldWithIndexValue(tblDebtorWDELCOUNTRIES_ID,CBDelCountry.Items,CBDelCountry.ItemIndex);

  //save the salesman
  SetFieldWithIndexValue(tblDebtorWSalesmanID,edtSalesperson.Items,edtSalesperson.ItemIndex);
  //Save the other stuff
  tblDebtorSMessage.Value := edtStateMessage.Text;
  tblDebtorWDefaultPriceTypeID.Value:=cbSellingPriceChoice.ItemIndex+1;
  tblDebtorFCREDITLimit.AsString := edtCredLimit.Text;
  tblDebtorFChargeAmount.AsString := edtChargeAmount.Text;
  tblDebtorSReference.Value := edtReference.Text;
  tblDebtorFDiscount.AsString := edtDiscount.Text;
  tblDebtorFInterest.AsString := edtInterest.Text;
  tblDebtorSBankAccountNumber.AsString  := EBankAccountNr.Text  ;
  tblDebtorSBANKACCOUNTNAME.AsString  := EBankname.Text ;
  tblDebtorSBANKNAME.AsString  := EBankname2.Text ;
  tblDebtorSCREDITCARDNUMBER.AsString  :=  edSBANKACCOUNTNAME.Text ;

   tblDebtorSCREDITCARDHOLDER.AsString := sigtext.Text  ;
   if sigdate.Date  > 0  then

   tblDebtorDEXPIRYDATE.AsDateTime := trunc(sigdate.Date)   ;


  if CBAccountType.Text =  CBAccountType.items[0] then
  tblDebtorSBranchCode.AsString  := '@'
  else
  tblDebtorSBranchCode.AsString  := CBAccountType.Text ;
    tblDebtorWDueDays.AsInteger :=  round(Str2Float(EDueDays.Text)) ;

  if CBUseDefaultAccount.Checked then
     tblDebtorWDefaultAccount.AsInteger := EUseDefaultAccount.Tag
  else
  tblDebtorWDefaultAccount.AsInteger := 0 ;

  if CBUseDefaultTax.Checked then
     tblDebtorWDefaultTax.AsInteger := EUseDefaultTax.Tag
  else
  tblDebtorWDefaultTax.AsInteger := 0 ;

  tblDebtor.Post;
 { QDebtorCreditor.close ;
  QDebtorCreditor.SQL.clear ;
  QDebtorCreditor.SQL.Add(GenSqlDebtor);
  QDebtorCreditor.SQL.add(' and Account.WaccountId='+ tblDebtorWAccountID.AsString);}


  if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 4 then
  begin
     DMTCCoreLink.LogAction('DEBSAVE',tblDebtorWAccountID.AsInteger,'Debtor saved!');
  end;

  SendMessageToPlugin('POST='+IntToStr(tblAccountWACCOUNTID.AsInteger));
  BFilterClick(self);

  QDebtorCreditor.Open ;
  QDebtorCreditor.Locate('WAccountID',edtAccountNumber.tag,[]);


  tblDebtor.Close;
  tblAccount.Close;
  except
     on e : Exception do
       begin
          // done : Im not sure why the exceptions do not raise annymore.
          // this way we see the exceptions so we now what action tot ake.
          OSFMessageDlg(e.Message,mtwarning,[mbyes],0);

       end;
  end;
  if sender <> nil then
  begin
 // pgconDebtor.ActivePageIndex:= 0;
  ClsScreen;
  Notebook1.PageIndex := 1 ;
 // BFilterClick(self);
  SetButtons(bfcSearch) ;
  end;
  if GoToId <> 0  then
   begin

     ModalResult := mrok ;
   end;


end;

procedure TfmDebtor.FormKeyPress(Sender: TObject; var Key: Char);
begin
 // no spaces in the accountcode
 if   edtAccountNumber.Focused then
  if key = ' ' then
     key := #0 ;

 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.

   if key = '.' then
    if (Screen.ActiveControl = edtChargeAmount) or (Screen.ActiveControl = edtCredLimit) then
    key :=  DecimalSeparator ;
  if ((Key = #13) and not (ssShift in LastShift))  then
  begin
  if   EFreeField3.Focused then
     pgconDebtor.ActivePage := tSACCOUNT
   else
   if EFilterValue.Focused then
    begin  
     BFilterClick(BFilter2) ;
     cxGrid1.SetFocus ;
    end  else
   if  cxGrid1DBBandedTableView1.Focused then
     begin
      if BIsFindScreen then
         modalresult := mrok else
      BEditClick(self);

     end else
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
   if Notebook1.PageIndex = 0 then
    begin
    edtAccountNumber.Text:= Trim(edtAccountNumber.Text);
    if (edtAccountNumber.Text ='') or
      (OSFMessageDlg(DMTCCoreLink.gettextlang(435){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) <> mryes) then
      begin
      edtAccountNumber.OnExit := nil ;
      Notebook1.PageIndex := 1 ;
      EFilterValue.SetFocus ;
      BSearchClick(Sender);
      edtAccountNumber.OnExit := edtAccountNumberExit ;
      end 
    else
      btnOkClick(Sender);
    Key := #0;
    end else
    begin
       if cxGrid1DBBandedTableView1.Focused then
       EFilterValue.SetFocus ;
    end;
  end;

end;

procedure TfmDebtor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if self.Parent = nil then
 TDatabaseRegistyRoutines.WriteFormPos(self,IntToStr(ord(UseCreditor)));

 cxGrid1DBBandedTableView1.StoreToRegistry('Software\osfinancials\gridsdeb\'+IntToStr(ord(UseCreditor))+ FilterFrefix+'cols');
 WriteReportOp(IntToStr(ord(UseCreditor))+FilterFrefix+'CANDFilterValue',EFilterValue.Text);
 WriteReportOp(IntToStr(ord(UseCreditor))+FilterFrefix+'CANDFilterIndex',IntToStr(CBFindColumn.ItemIndex));
 WriteReportOp(IntToStr(ord(UseCreditor))+FilterFrefix+'CANDOperatorIndex',IntToStr(CBOperatot.ItemIndex));

 WriteReportOp('CBAutoCopyContactInfo',Bool2Str(CBAutoCopyContactInfo.Checked));
end;

procedure TfmDebtor.edtSalespersonKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    pgconDebtor.ActivePage := tsStatement;
    edtDelAddress1.SetFocus;
    Key := #0;
  end;
end;

procedure TfmDebtor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LastShift := Shift ;
  if Key = 112 then
  begin
    //Result := (HTMLHelpShowHelp <> 0);
    if UseCreditor then
      HtmlShowTopic(120)
    else
      HtmlShowTopic(121);
    key := 0;
  end;
end;


procedure TfmDebtor.CreditorOkClick(Sender: TObject);
var
  MainTemp, SubTemp : String;
begin

  //Split the account code
  if Length(edtAccountNumber.Text) >= MainAccountLength then
  begin
    MainTemp := GetMainAccountCode(edtAccountNumber.Text );
    SubTemp := GetSubAccountCode(edtAccountNumber.Text ,false,false );
  end
  else
  begin
    MainTemp := GetMainAccountCode(edtAccountNumber.Text );
    SubTemp := '';
  end;
  //Save the creditor description in the Account table
  tblAccount.Close ;
  tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 2);
  tblAccount.Open ;
   if tblAccount.isEmpty then
      if  not QDebtorCreditor.isempty then
        if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
           begin
             tblAccount.Close ;
             tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
             tblAccount.Open ;
             tblAccount.Edit; 
           end;

  tblAccount.Edit;
  tblAccountSDescription.Value := edtName.Text;
  // Save Reporting Groups
  tblAccountWReportingGroup1ID.Value := 0 ;
  if CbxRepGroup1.ItemIndex <> -1 then
  tblAccountWReportingGroup1ID.Value := Integer(CbxRepGroup1.Items.Objects[CbxRepGroup1.ItemIndex]);
  tblAccountWReportingGroup2ID.Value := 0 ;
  if CbxRepGroup2.ItemIndex <> -1 then
  tblAccountWReportingGroup2ID.Value := Integer(CbxRepGroup2.Items.Objects[CbxRepGroup2.ItemIndex]);
  tblAccountBOPENITEM.Value := ord(cbOpenItem.Checked);
  tblAccountBINACTIVE.Value := ord(cbDisabled.Checked);
  tblAccount.Post;
  tblCreditor.Close ;
  tblCreditor.ParamByName('WAccountID').AsInteger := tblAccountWAccountID.AsInteger ;
  tblCreditor.Open;
    if tblCreditor.IsEmpty then
  begin
     tblCreditor.Insert ;
     tblCreditorWACCOUNTID.AsInteger := tblAccountWAccountID.AsInteger ;
  end else
  tblCreditor.Edit;

  //save the address details
  tblCreditorSPostal1.Value := edtAddress1.Text;
  tblCreditorSPostal2.Value := edtAddress2.Text;
  tblCreditorSPostal3.Value := edtAddress3.Text;
  tblCreditorSPostalCode.Value := edtPCode.Text;
  tblCreditorSEmail.Value := edtEmail.Text;

  tblCreditorSLANGUAGE.AsString := cbOsfLanguage.Text ;
  if (CBdocLayoutInv.ItemIndex > -1) and (CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex] <> nil) then
   tblCreditorSLAYOUTINVOICE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutInv.Items.Objects[CBdocLayoutInv.ItemIndex]))
   else
  tblCreditorSLAYOUTINVOICE.AsString := CBdocLayoutInv.Text  ;

   if (CBdocLayoutCreditNote.ItemIndex > -1) and (CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex] <> nil) then
   tblCreditorSLAYOUTCREDITNOTE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutCreditNote.Items.Objects[CBdocLayoutCreditNote.ItemIndex]))
   else
  tblCreditorSLAYOUTCREDITNOTE.AsString := CBdocLayoutCreditNote.Text  ;

   if (CBdocLayoutQuote.ItemIndex > -1) and (CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex] <> nil) then
   tblCreditorSLAYOUTQUOTE.AsString := 'TRN_' + IntToStr(Integer(CBdocLayoutQuote.Items.Objects[CBdocLayoutQuote.ItemIndex]))
   else
  tblCreditorSLAYOUTQUOTE.AsString := CBdocLayoutQuote.Text  ;


  //save the other contact info
  tblCreditorSTelephone1.Value := edtPhone1.Text;
  tblCreditorSTelephone2.Value := edtPhone2.Text;
  tblCreditorSFax.Value := edtFax.Text;
  //save the contact
  SetFieldWithIndexValue(tblCreditorWContactID,edtContact.Items,edtContact.ItemIndex) ;
  if tblCreditorWContactID.IsNull then
     tblCreditorWContactID.AsInteger := 0 ;

  SetFieldWithIndexValue(tblCreditorWPOSTCOUNTRIES_ID,CBCountry.Items,CBCountry.ItemIndex);
  SetFieldWithIndexValue(tblCreditorWDELCOUNTRIES_ID,CBDelCountry.Items,CBDelCountry.ItemIndex);
  //save the other stuff
  tblCreditorSReference.Value := edtReference.Text;
  tblCreditorSMessage.Value := edtStateMessage2.Text;
  tblCreditorSWEBSITE.Value := EWebsite.Text;

  tblCreditorSCOMPANYREGNO.AsString  :=ECompanyRegnr.Text ;
  tblCreditorSFREEFIELD1.AsString :=  EFreeField1.Text;
  tblCreditorSFREEFIELD2.AsString := EFreeField2.Text;
  tblCreditorSFREEFIELD3.AsString :=  EFreeField3.Text ;

  tblCreditorFCREDITLimit.AsString := edtCredLimit.Text;
  tblCreditorFChargeAmount.AsString := edtChargeAmount.Text;
  tblCreditorFDiscount.AsString := edtDiscount.Text;
  tblCreditorSDelivery1.Value := edtDelAddress1.Text;
  tblCreditorSDelivery2.Value := edtDelAddress2.Text;
  tblCreditorSDelivery3.Value := edtDelAddress3.Text;
  tblCreditorSDELIVERYCODE.Value := eDelCode.Text ;

  tblCreditorWDefaultPriceTypeID.Value:=cbSellingPriceChoice.ItemIndex+1;
  tblCreditorSBankAccountNumber.AsString  := EBankAccountNr.Text  ;
  tblCreditorSBANKACCOUNTNAME.AsString  := EBankname.Text ;
  tblCreditorWBANKNAME.AsString  := EBankname2.Text ;
  tblCreditorSCREDITCARDNUMBER.AsString :=  edSBANKACCOUNTNAME.Text;

  tblCreditorSCREDITCARDHOLDER.AsString :=  sigtext.Text;
  if sigdate.Date  > 0  then
  tblCreditorDEXPIRYDATE.AsDateTime :=  Trunc(sigdate.Date) ;

  tblCreditorWTRANSMISSIONTYPE.AsInteger := cbTransmissionType.ItemIndex;

  if CBAccountType.Text =  CBAccountType.items[0] then
  tblCreditorSBranchCode.AsString  := '@'
  else
  tblCreditorSBranchCode.AsString  := CBAccountType.Text ;
  tblCreditorWDueDays.AsInteger :=  round(Str2Float(EDueDays.Text)) ;
  if CBUseDefaultAccount.Checked then
     tblCreditorWDefaultAccount.AsInteger := EUseDefaultAccount.Tag
  else
  tblCreditorWDefaultAccount.AsInteger := 0 ;

  if CBUseDefaultTax.Checked then
     tblCreditorWDefaultTax.AsInteger := EUseDefaultTax.Tag
  else
  tblCreditorWDefaultTax.AsInteger := 0 ;

  tblCreditor.Post;

 { QDebtorCreditor.close ;
  QDebtorCreditor.SQL.clear ;
  QDebtorCreditor.SQL.Add(GenSqlCreditor);
  QDebtorCreditor.SQL.add('and Account.WaccountId='+ tblCreditorWAccountID.AsString);
         }
  if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 4 then
  begin
     DMTCCoreLink.LogAction('CREDSAVE',tblCreditorWAccountID.AsInteger,'Creditor saved!');
  end;

  SendMessageToPlugin('POST='+tblAccountWAccountID.AsString);

  BFilterClick(self);
  QDebtorCreditor.Locate('WAccountID', tblAccountWAccountID.AsInteger,[]);
  tblCreditor.Close;
  tblAccount.Close;
  QDebtorCreditor.Open ;

  if sender <> nil then
  begin
   // pgconDebtor.ActivePageIndex:= 0;
    Notebook1.PageIndex := 1 ;
    ClsScreen;
    SetButtons(bfcSearch) ;
  end;
end;


procedure TfmDebtor.edtContactKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    if UseCreditor then
    begin
      pgconDebtor.ActivePage := tsStatement;
      edtDelAddress1.SetFocus;

    end
    else
      SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmDebtor.CbxRepGroup1DropDown(Sender: TObject);
begin
  (Sender As TComboBox).Color:=ClInfoBk;
end;

procedure TfmDebtor.edtDiscountExit(Sender: TObject);
Var
  Tmp:Real;
begin
   Tmp:= Str2Float(edtDiscount.Text);
   if (tmp<0) or (tmp>100) then
     OSFMessageDlg(DMTCCoreLink.gettextlang(808){'Discount must be in range 0% to 99.99%'}, mtError, [mbOk], 0);
   if tmp>100 then
     edtDiscount.Text:='100';
   if tmp<0 then
     edtDiscount.Text:='0';
end;

procedure TfmDebtor.edtInterestExit(Sender: TObject);
Var
  Tmp:Real;
begin
   Tmp:= Str2Float(edtInterest.Text);
   if (tmp<0) or (tmp>100) then
     OSFMessageDlg(DMTCCoreLink.gettextlang(809){'Discount must be in range 0% to 99.99%'}, mtError, [mbOk], 0);
   if tmp>100 then
     edtInterest.Text:='100';
   if tmp<0 then
     edtInterest.Text:='0';
end;

Procedure TfmDebtor.ClsScreen;
begin

    CBdocLayoutInv.ItemIndex := -1 ;
    CBdocLayoutCreditNote.ItemIndex := -1 ;
    CBdocLayoutQuote.ItemIndex := -1 ;
    EWebsite.Text := '' ;
    qryDocHead.Close;
    dmDatabase.QEvents.close ;
    QadressPerAccount.Close;
    wwqryOpenDebits.Close;
    wwqryOpenCredits.Close;

    edtAccountNumber.tag := 0 ;
    edtAccountNumber.Enabled := True ;
    edtContact.ItemIndex := -1 ;
    edtAccountNumber.Text :='';
    edtName.Text :='';
    edtAddress1.Text :='';
    edtAddress2.Text :='';
    edtAddress3.Text :='';
    edtPCode.Text :='';
    edtPhone1.Text :='';
    edtPhone2.Text :='';
    edtFax.Text :='';
    edtEmail.Text :='';
    edtDelAddress1.Text :='';
    edtDelAddress2.Text :='';
    edtDelAddress3.Text :='';
    edtStateMessage.Text :='';
    edtStateMessage2.text := '' ;
    EFreeField1.Text :='';
    EFreeField2.Text :='';
    EFreeField3.Text :='';
    eDelCode.Text :='';
    cbOsfLanguage.ItemIndex := cbOsfLanguage.Items.IndexOf(DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage.Name) ;
    CBCountry.ItemIndex := DMTCCoreLink.ReadSysParam('DEF_COUNTRY',0,0)  ;
    CBDelCountry.ItemIndex := DMTCCoreLink.ReadSysParam('DEF_COUNTRY',0,0)  ;
    cbDisabled.Checked := False;
    // lets set it default its working good now
    cbOpenItem.Checked := true;
    edtCredLimit.Text :='';
    edtChargeAmount.Text :='';
    edtReference.Text :='';
    edtDiscount.Text :='';
    edtInterest.Text :='';
    cbSellingPriceChoice.ItemIndex:= ReadReportOp('STKDefaultPrice',1).AsInteger ;
    edtSalesPerson.ItemIndex := -1;
    CbxRepGroup1.ItemIndex := -1 ;
    CbxRepGroup2.ItemIndex := -1 ;
    CBUseDefaultAccount.Checked := false ;
    CBUseDefaultTax.Checked := false ;
    EUseDefaultAccount.Tag := 0 ;
    EUseDefaultAccount.text := '' ;
    EDueDays.Text := VarToStr(DMTCCoreLink.ReadSysParam('DEF_DUEDAYS',30,0)) ;
    CBAccountType.ItemIndex := 1;
    EBankAccountNr.Text := '' ;
    EBankname.Text := '' ;
    EBankname2.Text := '' ;
    CBUseDefaultAccount.Checked := false ;
    CBUseDefaultTax.Checked := false ;
    EUseDefaultTax.Text := '' ;
    EUseDefaultAccount.Text := '' ;
    EUseDefaultTax.Tag := 0 ;
    EUseDefaultAccount.Tag := 0 ;
    ECompanyRegnr.Text := '' ;
   // CBUseDefaultAccountClick(self);
  //  CBUseDefaultTaxClick(self);
    ZQAccountRef.close ;
    ZQAccountRef.Open ;

end;

procedure TfmDebtor.BNewClick(Sender: TObject);
begin
  Notebook1.PageIndex := 0 ;
 // pgconDebtor.ActivePageIndex:=0;
  ClsScreen;
  Button1Click(self);
  edtAccountNumber.SetFocus;
  SetButtons(bfcNew) ;
  SendMessageToPlugin('NEW=0');
  pgconDebtorChange(self);
end;

procedure TfmDebtor.BSearchClick(Sender: TObject);
begin
  SendMessageToPlugin('CANCEL='+QDebtorCreditorWAccountID.AsString);
  edtAccountNumber.Enabled := False ;
  Notebook1.PageIndex := 1 ;
  ClsScreen;
  SetButtons(bfcSearch) ;
  if GoToId <> 0  then
     ModalResult := mrCancel ;
end;

procedure TfmDebtor.BDeleteClick(Sender: TObject);
var
 i : Integer ;
 ErrorMessage : String ;
begin
 // pgconDebtor.ActivePageIndex:=0;

  if QDebtorCreditor.IsEmpty then
    exit;
  ErrorMessage := '' ;


  if OSFMessageDlg(DMTCCoreLink.gettextlang(460){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin

  for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
  begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
    
    Notebook1.PageIndex := 1 ;

    SendMessageToPlugin('DELETE='+QDebtorCreditorWAccountID.AsString);
    DeleteAccount(ErrorMessage,QDebtorCreditorWAccountID.AsInteger);

    SetButtons(bfcSearch);
  end;
    if ErrorMessage <> '' then
       OSFMessageDlg(ErrorMessage, mtError, [mbOk], 0)
       else
      OSFMessageDlg(GetTextLang(525){'Account deleted'}, mtinformation, [mbok], 0);
   BFilterClick(self);
  end;
end;

procedure TfmDebtor.FormCreate(Sender: TObject);
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
           TEDit(aControl).TabOrder := TEDit(bControl).TabOrder;
     bControl.Top :=  OldPoint.Y ;
     if (AControl is TEdit) then
        TEDit(bControl).TabOrder := OldTab;
 end;
 var i : Integer ;
      ADutchStyle : Boolean ;
      DllName : String ;
begin
DMTCCoreLink.AssignConnectionToChilds(self);
if DMTCCoreLink.SimpleMode =1   then
   begin
     TSInvoicesQuotes.TabVisible := False ;
     tsBackorder.TabVisible := False ;
     tsStock.TabVisible := False ;
     TSAppointments.TabVisible := False ;
   end else
   if DMTCCoreLink.SimpleMode =2   then
   begin
     tsBackorder.TabVisible := False ;
   end;

cxGrid1DBBandedTableView1.Styles.StyleSheet := dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard ;
StrEvalCondition  := DMTCCoreLink.ReadLongSysparam('DEBEVALCOND',DMTCCoreLink.currentuser) ;
StrEvalFontCol    := DMTCCoreLink.ReadLongSysparam('DEBEVALFONT',DMTCCoreLink.currentuser) ;
StrEvalBackCol    := DMTCCoreLink.ReadLongSysparam('DEBEVALBACK',DMTCCoreLink.currentuser) ;



 ASearchPanel := TSearchPanel.Create(self) ;
 APostCodePlugin :=0 ;
 if DMTCCoreLink.ReadNwReportOp('USEPOSTCODELUGIN',false) then
  begin
  for i := 0 to  LoadedPluginList.Count -1 do
     if UpperCase(LoadedPluginList[i]) = UpperCase(ExtractFilePath(Application.ExeName) +'plug_ins\Postcodelookup.'+ PluginsDLLName) then
        APostCodePlugin := Integer(LoadedPluginList.Objects[i]) ;
     if APostCodePlugin = 0 then
       if FileExists(ExtractFilePath(Application.ExeName) +'plug_ins\Postcodelookup.' + PluginsDLLName) then
          begin
            DllName := ExtractFilePath(Application.ExeName) +'plug_ins\Postcodelookup.' + PluginsDLLName ;
            APostCodePlugin := LoadLibrary(pchar(DllName)) ;
            LoadedPluginList.AddObject(ExtractFilePath(Application.ExeName) +'plug_ins\Postcodelookup.' + PluginsDLLName,TObject(APostCodePlugin));
          end;
   end ;
  BLookupPostal.Visible := APostCodePlugin <> 0 ;

 Quote1.Caption :=  DMTCCoreLink.GetTextLangNoAmp(174) + ' ' +  DMTCCoreLink.GetTextLangNoAmp(2169) ;
 Quote1.Enabled := fmMain.Quotations1.Enabled ;

 Invoice1.Caption := DMTCCoreLink.GetTextLangNoAmp(174) + ' ' + DMTCCoreLink.GetTextLangNoAmp(165) ;
 Invoice1.Enabled := fmMain.InputInvoices.Enabled ;

 Creditnote1.Caption := DMTCCoreLink.GetTextLangNoAmp(174) + ' ' +  DMTCCoreLink.GetTextLangNoAmp(706) ;
 Creditnote1.Enabled := fmMain.InputCreditNotes.Enabled ;

  FillStringListWithSelect(CBCountry.Items,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
  FillStringListWithSelect(CBDelCountry.Items,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');


   MyBackord := TfmBackOrdersOutstanding.Create(self) ;
   MyBackord.Parent := tsBackorder ;

   MyBackord.ButtonPanel.Parent := MyBackord.tsDetail ;
   MyBackord.ButtonPanel.Align := altop ;
   MyBackord.Label1.Top := MyBackord.Label2.Top ;
   MyBackord.BitBtn1.Top := MyBackord.BitBtn2.Top ;
   MyBackord.PageControl1.ActivePage := MyBackord.tslist ;
   MyBackord.StatusBar1.Visible := false ;
   MyBackord.BorderStyle := bsNone ;
   MyBackord.FormMode := 2 ;
   MyBackord.Show ;
   MyBackord.Align := alClient ;
   MyBackord.ZQBackorder.SQL.Text := 'Select * from backord where WAccountid =:WAccountid' ;
   MyBackord.ZQBackorder.CachedUpdates := true ;


 cbOsfLanguage.Items.Clear ;
 for i := 0 to DMTCCoreLink.TheGlobalDataObject.Languages.Count -1 do
    begin
      cbOsfLanguage.Items.Add(DMTCCoreLink.TheGlobalDataObject.Languages[i].Name);
    end;



 if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
   begin
     // switch postal code
    ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT',false,0) ;
   end else
   begin
    ADutchStyle := DMTCCoreLink.ReadSysParam('DUTCHADRLAYOUT',true,0) ;
   end;

 if not ADutchStyle then
   begin
      CtrlSwap(Label4,LCity);
      CtrlSwap(Label4,LState);
      CtrlSwap(edtPCode,edtAddress2);
      CtrlSwap(edtPCode,edtAddress3);

      CtrlSwap(Label10,LDCity);
      CtrlSwap(Label10,LDState);
      CtrlSwap(eDelCode,edtDelAddress2);
      CtrlSwap(eDelCode,edtDelAddress3);
   end;

 DMTCCoreLink.LoadImage(btnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

 if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','smallicons','')) = 'TRUE' then
    begin
       PEditButtons.Width := 110 ;
       BtnOpen.Width := 70 ;
       BNew.Width := 70 ;
       BDelete.Width := 70 ;
       BEdit.Width := 70 ;
       BSave.Width := 70 ;
       BCancel.Width := 70 ;
    end;

 AReportList := TStringlist.create ;
 ALinksList := TStringList.create ;
 APluginList := TStringlist.create ;
 Notebook1.PageIndex := 1 ;
 LikeSeach := ReadSysParam('LikeSearchForStrings',false,CurrentUser).AsBoolean ;
 TDataBaseRoutines.SetDynamicFieldLengths(self);
 GenSqlCreditor := DMTCCoreLink.SQLList.GetFormatedSQLByName('Debtor_GenSqlCreditor');
 genSqlDebtor   := DMTCCoreLink.SQLList.GetFormatedSQLByName('Debtor_GenSqlDebtor');
 QDebtorCreditor.Connection := DMTCCoreLink.TheZConnection ;
 QDebtorCreditorSACCOUNTCODE.Size := DMTCCoreLink.MainAccountLength + 3 ;
  cxGrid2DBTableView1STARTTIME.Caption := StringReplace(DMTCCoreLink.gettextlang(2407),':','',[]);
  cxGrid2DBTableView1ENDTIME.Caption := StringReplace(DMTCCoreLink.gettextlang(2408),':','',[]);
  cxGrid2DBTableView1DESCRIPTION.Caption := DMTCCoreLink.gettextlang(1860);
  cxGrid2DBTableView1NOTES.Caption := DMTCCoreLink.gettextlang(2390);

  cxGrid2DBTableView1USERFIELD5.Caption := DMTCCoreLink.GetTextLangNoAmp(37);
  cxGrid2DBTableView1USERFIELD0.Caption := DMTCCoreLink.GetTextLangNoAmp(1326);
  cxGrid8DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLangNoAmp(607);
end;

procedure TfmDebtor.tsGeneralShow(Sender: TObject);
begin
  edtAccountNumber.Properties.MaxLength := MainAccountLength + 3 ;
end;

procedure TfmDebtor.FormDestroy(Sender: TObject);
var
  i : Integer ;
begin
 AReportList.free ;
 ALinksList.Free ;
 for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    begin
      if AFormPluginRecordArray[i].aForm <> nil then
       AFormPluginRecordArray[i].aUnLoadFormPlugin(TForm(AFormPluginRecordArray[i].aForm));
    end;
    qryDocHead.Close;
    dmDatabase.QEvents.close ;
    dmDatabase.QadressPerAccount.Close;
    wwqryOpenDebits.Close;
    wwqryOpenCredits.Close;
 APluginList.free ;

end;

procedure TfmDebtor.edtEmailDblClick(Sender: TObject);
var
   ALink : String ;
begin
 if trim(edtEmail.Text) <> '' then
  begin
   ALink := trim(edtEmail.Text) ;
   ALink := 'mailto:' + ALink ;
   ShellExecute(self.Handle,'OPEN',pchar(alink),'','',1);
  end;
end;
procedure TfmDebtor.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
 FormKeyPress(Sender, Key)  ;
 
   if key = ',' then
    key :=  '.' ;
end;

procedure TfmDebtor.edtNameEnter(Sender: TObject);
begin
 // done : Pieter strange bug needs strange fix.
 // bug is when u make a new account and use your mouse to go to the name after entering the accountcode
 // then you can not type in to the field.
 {edtName.OnEnter := nil ;
 try
 edtAddress1.SetFocus;
 edtName.SetFocus;
 finally
 edtName.OnEnter := edtNameEnter ;
 end;}
end;

procedure TfmDebtor.check11proof ;
var
  tempStr: string;
  i, totaal, MultiPlier: Integer;
begin
    totaal := 0;
    MultiPlier := 9;

    tempStr := EBankAccountNr.text;
    tempStr := Trim(tempStr);
    tempStr := StringReplace(tempStr,'.','',[rfReplaceAll]);
    if length(tempStr) <> 9 then
    begin
       // todo : Translate
      OSFMessageDlg('A 11 proof bank account should be 9 digets',mtError,[mbok],0);
      exit ;
    end;
    for i := 1 to 9 + 3 do
    begin
      if (tempStr[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
      begin
        totaal := totaal + (MultiPlier * StrToInt(tempStr[i]));
        Dec(MultiPlier);
      end;
    end;
    if (totaal mod 11) <> 0 then
    begin
      OSFMessageDlg(format(DMTCCoreLink.GetTextLang(3087),[tempStr]){'Number ' + tempStr + ' is not a valide 11 proof number!'},mtError,[mbok],0);
      exit ;
    end;
end;

procedure TfmDebtor.EBankAccountNrExit(Sender: TObject);
begin
 // todo : Translate
 if  Uppercase(CBAccountType.Text) = uppercase(CBAccountType.Items[0]) then
    begin
      check11proof ;
    end;
end;

procedure TfmDebtor.EUseDefaultAccountEnter(Sender: TObject);
var
 oldSelect,oldReturnLookup : string ;
 oldReturnID : Integer ;

begin
  oldSelect := SSelect ;
  oldReturnLookup := ReturnLookup ;
  oldReturnID := ReturnID ;
  FmLookup.IsShowForm := false ;
 try

 EUseDefaultAccount.Text := CallLookup(EUseDefaultAccount.Text,2);
 while TDataBaseRoutines.GetAccountClassType(ReturnID)  <> 0 do
    begin
      if OSFMessageDlg('This account type cannot be used. Continue?',mtConfirmation,[mbyes,mbno],0) = mrNo then
        exit ;
      EUseDefaultAccount.Text := CallLookup(EUseDefaultAccount.Text,2);
    end;
 EUseDefaultAccount.Tag := ReturnID;
 finally

   SSelect := oldSelect ;
   ReturnLookup := oldReturnLookup ;
   ReturnID := oldReturnID ;
 end;
 CBUseDefaultAccount.SetFocus ;
end;

procedure TfmDebtor.CBUseDefaultAccountClick(Sender: TObject);
begin
 if CBUseDefaultAccount.Checked then
   begin
      EUseDefaultAccount.Visible := true ;
      LEUseDefaultAccount.Visible := true ;
      if CBUseDefaultAccount.Focused then
      if EUseDefaultAccount.CanFocus then
      EUseDefaultAccount.SetFocus ;
   end
   else
   begin
      EUseDefaultAccount.Visible := false ;
      LEUseDefaultAccount.Visible := false ;
      EUseDefaultAccount.tag := 0  ;
   end;
end;

procedure TfmDebtor.BCAddClick(Sender: TObject);
var
  fmContactListing: TfmContactListing;
  NewID : Integer ;
begin
  fmContactListing := TfmContactListing.Create(self);
  try
  SetUpForm(fmContactListing);
  fmContactListing.POkbutton.Visible := true ;
  if CBAutoCopyContactInfo.Checked then
  begin
  fmContactListing.DefaultName := edtName.Text ;
  fmContactListing.DefaultAdres1 := edtAddress1.Text ;
  fmContactListing.DefaultAdres2 := edtAddress2.Text ;
  fmContactListing.DefaultAdres3 := edtAddress3.Text ;
  fmContactListing.DefaultPostal := edtPCode.Text ;
  fmContactListing.DefaultTelephone := edtPhone1.Text ;
  fmContactListing.DefaultTelephone2 := edtPhone2.Text ;
  fmContactListing.DefaultEMail := edtEmail.Text ;
  fmContactListing.DefaultFax := edtFax.Text ;
  fmContactListing.DefaultCountry := CBCountry.Text ;
  end;
  // See the find is attached here to
  if sender = BCAdd then
     begin
     fmContactListing.AddNEw := True ;
     fmContactListing.ShowModal ;
     end else
     begin
     fmContactListing.PickSearch := true ;
     fmContactListing.LastResult := fmContactListing.ShowModal ;
     fmContactListing.EditId := dmDatabase.QContactsRECORDID.AsInteger ;
     end ;

  if  fmContactListing.LastResult =mrok then
    begin
    NewID :=  fmContactListing.EditId ;
   if not CheckCreateAccount(self) then exit ;
     // add link

     QadressPerAccount.open ;
     if not QadressPerAccount.Locate('WAccountId;WContactID',vararrayof([edtAccountNumber.Tag,NewID]),[]) then
     begin
     QadressPerAccount.Insert ;
     QadressPerAccountWAccountId.AsInteger := edtAccountNumber.Tag ;
     QadressPerAccountWContactID.AsInteger :=  NewID;
     QadressPerAccount.Post ;
     QadressPerAccount.close ;
     QadressPerAccount.open ;
     end;
     LoadContacs(edtAccountNumber.Tag );
     if edtContact.ItemIndex < 1 then
        edtContact.ItemIndex := 1 ;

    end;
  finally
  FreeAndNil(fmContactListing);
  end;
end;

procedure TfmDebtor.BCDeleteClick(Sender: TObject);
begin
 if not QadressPerAccount.IsEmpty then
    begin
    QadressPerAccount.Delete ;
    LoadContacs(edtAccountNumber.Tag );
    end;
end;

procedure TfmDebtor.BCEditClick(Sender: TObject);
var
  fmContactListing: TfmContactListing;
begin
 if  QadressPerAccount.IsEmpty then exit ;
  fmContactListing := TfmContactListing.Create(self);
  try
  SetUpForm(fmContactListing);
  fmContactListing.POkbutton.Visible := true ;
  fmContactListing.EditID := QadressPerAccountWContactID.AsInteger ;
  fmContactListing.ShowModal  ;
  dmDatabase.QadressPerAccount.close ;
  dmDatabase.QadressPerAccount.open ;
  LoadContacs(edtAccountNumber.Tag );
  finally
  FreeAndNil(fmContactListing);
  end;
end;
 

procedure TfmDebtor.BFilterClick(Sender: TObject);
var
 LastID : Integer ;
 ExtraSql : String ;
 SearchStr : Array [0..4096] of char ;
 APChar : PChar ;
begin
 if sender <> nil then
  if cxGrid1.Focused then exit ;
      if (CBFindColumn.ItemIndex >=  cxGrid1DBBandedTableView1.ColumnCount) then
        begin
          SearchStr[0]  := 'W';
          SearchStr[1]  := 'D';
          SearchStr[2]  := 'O';
          SearchStr[3]  := 'C';
          SearchStr[4]  := 'I';
          SearchStr[5]  := 'D';
          SearchStr[6]  := #0;
          // SearchStr := copy(EFilterValue.text,1,4096);
          APChar := SearchStr ;
          AFormPluginRecordArray[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].aDocSearch(APChar);
          EFilterValue.text := SearchStr;
        end;


  look := '' ;
  LastID := QDebtorCreditorWAccountID.AsInteger ;
  if LocateId <> 0 then
    begin


     //  QDebtorCreditor.open ;
     //  Exit ;


     LastID := LocateId ;
     LocateId := 0 ;
    end;


     if  UseCreditor then
          begin
           QDebtorCreditor.SQL.clear ;
           QDebtorCreditor.SQL.Add(GenSqlCreditor+LimitSql);
         end
       else
          begin
           QDebtorCreditor.SQL.clear ;
           QDebtorCreditor.SQL.Add(GenSqlDebtor+LimitSql);
          end;


    if not cbShowInactive.Checked then
       QDebtorCreditor.SQL.Add('and account.binactive = 0 ' );


    if trim(EFilterValue.Text) <> '' then     
    if CBFindColumn.ItemIndex >0  then
     begin
      if (CBFindColumn.ItemIndex >=  cxGrid1DBBandedTableView1.ColumnCount) then
        begin
         ExtraSql := EFilterValue.text ;
           // plugin search
        end else
        begin
       case cxGrid1DBBandedTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.DataType of
            ftString : begin
              ExtraSql := ' and upper(' + cxGrid1DBBandedTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.Origin + ')'  ;
              case CBOperatot.ItemIndex of
                  -1,0 :    begin
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
            else   begin
             ExtraSql := ' and ' + cxGrid1DBBandedTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.Origin  ;
              case CBOperatot.ItemIndex of
                  -1,0 :    ExtraSql := ExtraSql + ' = ' +  StripNotNumericReturnZero(EFilterValue.Text) ;
                  1 :    ExtraSql := ExtraSql + ' = ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  2 :    ExtraSql := ExtraSql + ' < ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  3 :    ExtraSql := ExtraSql + ' > ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  4 :    ExtraSql := ExtraSql + ' <= ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  5 :    ExtraSql := ExtraSql + ' >= ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  6 :    ExtraSql := ExtraSql + ' <> ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  end;
                       end;

        end;
      end;

      QDebtorCreditor.SQL.add(ExtraSql);
     end;

     if (LastID <> 0) and (BIsFindScreen) and (sender <> BFilter2)  then
       begin
       QDebtorCreditor.SQL.Add(' or account.Waccountid = ' + IntToStr(LastID)) ;
       QDebtorCreditor.open ;

       end;


    QDebtorCreditor.open ;
  if (sender <> BFilter2) then
   QDebtorCreditor.Locate('WAccountID',LastID,[]);
  //  DBGSearch.SelectedIndex := LastColumn;
   BDelete.Enabled := not QDebtorCreditor.IsEmpty ;
   BEdit.Enabled := not QDebtorCreditor.IsEmpty ;
end;

procedure TfmDebtor.BEditClick(Sender: TObject);
begin
 if not QDebtorCreditor.isempty then
 begin
   SendMessageToPlugin('EDIT='+QDebtorCreditorWAccountID.AsString);
   SetButtons(bfcEdit) ;
   Notebook1.PageIndex := 0 ;
   edtAccountNumber.Enabled := False ;
   edtAccountNumber.Text :=  QDebtorCreditorSACCOUNTCODE.AsString ;
   edtAccountNumber.tag := QDebtorCreditorWAccountID.AsInteger ;
   ZQAccountRef.close ;
   ZQAccountRef.Params[0].AsInteger := QDebtorCreditorWAccountID.AsInteger;
   ZQAccountRef.Open ;
   edtName.SetFocus ;
   CheckAccountCode(self);
   pgconDebtorChange(self);
 end;
end;

function TfmDebtor.CheckCreateAccount(Sender: TObject) : Boolean ;
var
  MainTemp, SubTemp : String;
begin
  result := true ;

  // make sure it does not contain spaces
  edtAccountNumber.Text := StringReplace(edtAccountNumber.Text,' ','',[rfReplaceAll]);
  if CheckAccountNumber(edtAccountNumber.Text) = True then
  begin
    //Split the account code
    if Length(edtAccountNumber.Text) >= MainAccountLength then
    begin
      MainTemp := trim(GetMainAccountCode(edtAccountNumber.Text ));
      SubTemp := GetSubAccountCode(edtAccountNumber.Text,false,false );
    end
    else
    begin
      MainTemp :=  trim(edtAccountNumber.Text);
      SubTemp := '';
    end;
    if UseCreditor then  // If is creditor
      begin
        tblAccount.Close ;
        tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 2);
        tblAccount.Open ;
      if tblAccount.isEmpty then
         if  not QDebtorCreditor.isempty then
           if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
              begin
                tblAccount.Close ;
                tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
                tblAccount.Open ;
              end;

        if tblAccount.IsEmpty then
        begin
          if OSFMessageDlg(DMTCCoreLink.gettextlang(457){Do you want to create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mrYes then
          begin
            tblAccount.Filtered := false ;
            tblAccount.Insert;

            tblAccountSMAINACCOUNTCODE.Value := MainTemp;
            tblAccountSSUBACCOUNTCODE.Value := SubTemp;
            tblAccountWAccountTypeID.Value := 2;//Creditor type
            tblAccountWReportingGroup1ID.Value := 0 ;
            tblAccountWReportingGroup2ID.Value := 0 ;
            tblAccountBINCOMEEXPENSE.AsInteger := 0 ;
            tblAccountBSUBACCOUNTS.AsInteger := 0 ;
            tblAccountSACCOUNTCODE.Value := MainTemp+SubTemp;
            tblAccount.Post;
            LocateId := tblAccountWAccountID.AsInteger ;
            CreateTotals(tblAccountWAccountID.Value);
            tblCreditor.Open;
            tblCreditor.Insert;
            tblCreditorWCONTACTID.AsInteger := 0 ;
            tblCreditorWAccountID.Value := tblAccountWAccountID.Value;
            tblCreditorSCode.Value := MainTemp + SubTemp;
            tblCreditor.Post;
            tblCreditor.Close;
            edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
            tblAccount.close;
            edtAccountNumber.Enabled := False ;
            LoadContacs(edtAccountNumber.tag);
            if edtAccountNumber.Text <> _IncrementString(edtAccountNumber.Text) then
            WriteSysParam('NEWCREDNR',_IncrementString(edtAccountNumber.Text),0) else
             WriteSysParam('NEWCREDNR','@');
          end
          else
          begin
           result := false ;
          end;
        end
        else
        begin
          edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
          tblAccount.Close;
          edtAccountNumber.Enabled := False ;
        end;
      end
    else // if is Debitor
      begin
        tblAccount.Filtered := false ;
        tblAccount.Close ;
        tblAccount.paramByName('WAccountId').ASinteger := GetAccountIdFromCodeAndType(Maintemp+SubTemp, 1);
        tblAccount.Open ;
        if tblAccount.isEmpty then
         if  not QDebtorCreditor.isempty then
           if  (Maintemp+SubTemp = uppercase(QDebtorCreditorSACCOUNTCODE.AsString)) then
              begin
                tblAccount.Close ;
                tblAccount.paramByName('WAccountId').ASinteger := QDebtorCreditorWAccountID.AsInteger;
                tblAccount.Open ;
              end;

        if tblAccount.IsEmpty then
        begin
          if OSFMessageDlg(DMTCCoreLink.gettextlang(432){Do you want to create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mrYes then
          begin
            tblAccount.Insert;

            tblAccountSMAINACCOUNTCODE.Value := MainTemp;
            tblAccountSSUBACCOUNTCODE.Value := SubTemp;
            tblAccountWAccountTypeID.Value := 1;//Debtor type
            tblAccountSACCOUNTCODE.Value := MainTemp+SubTemp;
            tblAccountWReportingGroup1ID.Value := 0 ;
            tblAccountWReportingGroup2ID.Value := 0 ;
            tblAccountBINCOMEEXPENSE.AsInteger := 0 ;
            tblAccountBSUBACCOUNTS.AsInteger := 0 ;            
            tblAccount.Post;
            LocateId := tblAccountWAccountID.AsInteger ; 
            CreateTotals(tblAccountWAccountID.Value);
            tblDebtor.Open;
            tblDebtor.Insert;
            tblDebtorWAccountID.Value := tblAccountWAccountID.Value;
            tblDebtorWCONTACTID.AsInteger := 0 ;
            tblDebtor.Post;
            edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
            edtAccountNumber.Enabled := False ;
            tblDebtor.Close;
            tblAccount.Close;
            LoadContacs(edtAccountNumber.tag);
            if edtAccountNumber.Text <> _IncrementString(edtAccountNumber.Text) then
              WriteSysParam('NEWDEBNR',_IncrementString(edtAccountNumber.Text),0)
            else
              WriteSysParam('NEWDEBNR','@');
          end
          else
          begin
            result := false ;
          end;
        end
        else
        begin
          edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
          tblAccount.Close;
          edtAccountNumber.Enabled := False ;
        end;
      end;
    end
    else
    begin
      OSFMessageDlg(DMTCCoreLink.gettextlang(433){Invalid account number, the first letter must be a number}, mterror, [mbok], 0);
      result := false ;
      edtAccountNumber.Text := '';
      if edtAccountNumber.canfocus then
      edtAccountNumber.SetFocus;
    end;

 //edtName.SetFocus;
end;

procedure TfmDebtor.SetButtons(AButton: TButtonListType);

begin
  BNew.Enabled := true ;
  //BSearch.Enabled := true ;
  BDelete.Enabled := true ;
  BEdit.Enabled := true ;
  BSave.Enabled := true ;
//  BReport.Enabled := true ;
//  BImport.Enabled := true ;
//  BExport.Enabled := true ;
  BCancel.Enabled := true ;
 case abutton of
  bfcNew : Begin
              BNew.Enabled := false ;

              BDelete.Enabled := false ;
              BEdit.Enabled := false ;
              BSave.Enabled := true ;
             // BReport.Enabled := false ;
             // BImport.Enabled := false ;
             // BExport.Enabled := false ;
            end;
  bfcSearch : Begin
              BSave.Enabled := false ;
              BCancel.Enabled := false ;
            //  pgconDebtor.ActivePageIndex := 0 ;
            end;
  bfcEdit : Begin
              BNew.Enabled := false ;
              BDelete.Enabled := false ;
               BEdit.Enabled := false ;
              BSave.Enabled := true ;
              BCancel.Enabled := true ;
            //  BReport.Enabled := false ;
            //  BImport.Enabled := false ;
           //   BExport.Enabled := false ;
            end;
  bfcSave : Begin

            end;
  bfcDelete : Begin

            end;
  bfcReport : Begin

            end;
  bfcImport,bfcExport : Begin

            end;
  end;

end;

procedure TfmDebtor.pgconDebtorChange(Sender: TObject);

begin
 dmDatabase.QEvents.close ;
 qryDocHead.close ;
 ZQDocs.close ;
 MyBackord.ZQBackorder.Close;
 MyBackord.FormLinkId := edtAccountNumber.tag ;
 MyBackord.ZQBackorder.Params[0].AsInteger :=  edtAccountNumber.tag ;

 if pgconDebtor.ActivePage =  tsStock then
   begin
     ZQDocs.Params[0].AsInteger := edtAccountNumber.tag ;
     ZQDocs.Params[1].AsInteger := edtAccountNumber.tag ;
     ZQDocs.Open;
   end;


 if pgconDebtor.ActivePage =  tsBackorder then
   begin
     MyBackord.ZQBackorder.Open;

     MyBackord.PageControl1.ActivePage := MyBackord.tslist ;
   end;

 if (pgconDebtor.ActivePage = TSContacts) and (Sender <> self) then
   begin
    if edtAccountNumber.tag = 0 then
       begin
         cxGrid7.Visible := false ;
        try
        btnOkClick(nil);
          if UseCreditor then
          edtAccountNumber.Tag := TDataBaseRoutines.GetAccountIdFromCodeAndType(edtAccountNumber.Text,2)
         else
         edtAccountNumber.Tag := TDataBaseRoutines.GetAccountIdFromCodeAndType(edtAccountNumber.Text,1) ;
        finally
           cxGrid7.Visible := true ;
        end;
       end;
   end;
 if pgconDebtor.ActivePage = TSInvoicesQuotes then
   begin
    if UseCreditor then
       OpenDocSql(' dochead.WAccountID =' + intToStr(edtAccountNumber.tag) ,' DDate,SDocNo')
       else
       OpenDocSql(' dochead.WAccountID =' + intToStr(edtAccountNumber.tag),' DDate,SDocNo') ;
   end else
 if pgconDebtor.ActivePage = TSAppointments then
   begin
     QEvents.Close ;
     QEvents.SQL.Text := 'Select * from events where Category in (2,3,4) and WAccountId = ' + intToStr(edtAccountNumber.tag) +' order by Starttime';
     QEvents.open ;
   end;
 if pgconDebtor.ActivePage = TSTransactions then
   begin
      With wwqryOpenDebits do
      begin
        filter := '' ;
        Active:=False;
        if cbAlltrans.Checked then
        SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Database_OpenDebitCredit'),[IntToStr(edtAccountNumber.tag),'>'])
        else
        SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Database_OpenDebitCredit'),[IntToStr(edtAccountNumber.tag) +'  and  FOUTSTANDINGAMOUNT <> 0 ','>']);
        Active:=True;
      end;
      With wwqryOpenCredits do
      begin
        filter := '' ;
        Active:=False;
        if cbAlltrans.Checked then
        SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Database_OpenDebitCredit'),[IntToStr(edtAccountNumber.tag),'<'])
        else
         SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Database_OpenDebitCredit'),[IntToStr(edtAccountNumber.tag) +'  and  FOUTSTANDINGAMOUNT <> 0 ','<']) ;
        Active:=True;
      end;


   end;
end;

procedure TfmDebtor.BPrintClick(Sender: TObject);
var
 ASaveList : TSaveClientDatasetCallList ;
 CustomLayout : String ;
begin


 if qryDocHead.IsEmpty then exit ;
 ASaveList := TSaveClientDatasetCallList.Create ;
 try
      ASaveList.AddclientObject(dmDatabase.tblUnit,true);
      ASaveList.AddclientObject(dmDatabase.tblStock,true);;
      ASaveList.AddclientObject(dmDatabase.tblSysVars,true);
      ASaveList.AddclientObject(dmdatabase.tblGroups,true);
      ASaveList.AddclientObject(qryDocHead,true);
      ASaveList.AddclientObject(dmDatabase.qrPrnDocLines,true);
      ASaveList.AddclientObject(dmDatabase.tblDocHeader,true);
      dmDatabase.tblUnit.Open;
      dmDatabase.tblStock.Open;
      dmDatabase.tblSysVars.Open;
      dmdatabase.tblGroups.Open;
      idDocType := GetDocTypeFromDocId(qryDocHeadWDocID.AsInteger) ;

      dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where WDocId='+qryDocHeadWDocID.AsString ;
      dmDatabase.tblDocHeader.Open ;
      // Preparing E-mail Process
      SetSQlLine(' AND WDocID='+qryDocHeadWDocID.AsString);
      dmDatabase.qrPrnDocLines.Open;
      CustomLayout := '' ;
      if CBDocLayout.ItemIndex <> -1 then
          if CBDocLayout.Items.Objects[CBDocLayout.ItemIndex] <> nil then
            CustomLayout := 'TRN_'  +  IntToStr(Integer(CBDocLayout.Items.Objects[CBDocLayout.ItemIndex]));


        if CBDocLayout.ItemIndex > 0 then
        begin
        if CustomLayout <>'' then
         ShowFrReport(cbDestination.ItemIndex,1,PrnVars.NumCopies,idDocType,CustomLayout,'',True)
         else
        ShowFrReport(cbDestination.ItemIndex,1,PrnVars.NumCopies,idDocType,CBDocLayout.Text,'',True);
        end
        else
        begin

        CustomLayout := TDataBaseDocumentRoutines.GetDoclayoutOnAccountAndType(idDocType, edtAccountNumber.tag);
        ShowFrReport(cbDestination.ItemIndex,1,PrnVars.NumCopies,idDocType,CustomLayout,'',True);
        // to printer only
        end;


      dmDatabase.tblDocHeader.sql.Text :='select * from dochead where WDocID=' +IntToStr(qryDocHeadWDocID.Asinteger);
      dmDatabase.tblDocHeader.open ;
      dmDatabase.tblDocHeader.Edit;
      dmDatabase.tblDocHeaderBPrinted.AsInteger  := dmDatabase.tblDocHeaderBPrinted.AsInteger + 1;
      dmDatabase.tblDocHeaderDSysDate.AsDateTime:=Now;
      dmDatabase.tblDocHeader.Post;
      // Preparing E-mail Process
      RepNbr:=NextEmailFileNo;
      if  EmailList.IndexOf(IntToStr(idDocType)+','+dmDatabase.tblDocHeaderWDocID.AsString + ','
            + dmDatabase.tblDocHeaderSDocno.AsString +','
            + dmDatabase.tblDocHeaderWAccountID.AsString +','
            + IntToStr(RepNbr)) = -1 then
      EmailList.Add(IntToStr(idDocType)+','+qryDocHeadWDocID.AsString + ','
            + qryDocHeadSDocno.AsString +','
            + qryDocHeadWAccountID.AsString +','
            + IntToStr(RepNbr));

      {CLean up Screen}
      finally
        ASaveList.Free ;
     end;
end; 

procedure TfmDebtor.AsFindScreen(IsFind : Boolean );
begin
  if IsFind then
   cxGrid1DBBandedTableView1.OnDblClick := BTBOkClick
   else
   cxGrid1DBBandedTableView1.OnDblClick := BEditClick ;




   BtnOpen.Visible := IsFind;
   BIsFindScreen := IsFind ;
   BTBOk.Visible := IsFind ;
end;

procedure TfmDebtor.BClearFilterClick(Sender: TObject);
begin
 EFilterValue.Text := '' ;
 CBFindColumn.ItemIndex := 0 ;
 BFilterClick(self);
end;

procedure TfmDebtor.BTBOkClick(Sender: TObject);
begin
 if OpenSqlAndGetFirtsColumnValue('select BInactive from account Where WAccountID =  ' + IntToStr(QDebtorCreditorWAccountID.AsInteger) ) = 1 then
    raise Exception.Create(DMTCCoreLink.gettextlang(201));


 ModalResult := mrok ;
end;

procedure TfmDebtor.edtAccountNumberExit(Sender: TObject);
var
 Acontrol : Tcontrol ;
 aPoint : Tpoint ;
begin
 if   Notebook1.PageIndex = 1  then exit ;
  if  not edtAccountNumber.Enabled  then exit ;

 aPoint := PEditButtons.ScreenToClient( mouse.CursorPos) ;
  Acontrol := PEditButtons.ControlAtPos(aPoint,false,true,true);
  // not if cancel is pressed !
  if Acontrol = BCancel then
    exit ;
  if PRgtBtn2.ControlAtPos(PRgtBtn2.ScreenToClient( mouse.CursorPos),false,true,true) = BitBtnCancel then
    exit ;

  // make sure it does not contain spaces
  edtAccountNumber.Text := StringReplace(edtAccountNumber.Text,' ','',[rfReplaceAll]);
  if (edtAccountNumber.Text = '') OR ((AccountLock=1) AND (CurrentUser<>UCSID) And (Copy(edtAccountNumber.Text,1,1)='9')) then begin
   begin
    if OSFMessageDlg(DMTCCoreLink.gettextlang(748){Illegal account Number?}, mterror, [mbOk,mbCancel], 0) = mrok then
     begin
      edtAccountNumber.Setfocus;
      exit;
     end else
     begin
       BSearchClick(nil);
       exit;
     end;
   end;
  end;
  if edtAccountNumber.Text <> '' then
  begin
      with dmDatabase do
      begin
       if UseCreditor then
        begin
        if  TDataBaseRoutines.GetAccountIdFromCodeAndType(edtAccountNumber.Text,2) <> -1 then
         begin
          edtAccountNumber.SetFocus ;
          raise Exception.Create(DMTCCoreLink.GetTextLangNoAmp(3078));
         end ;
        end else
      if  TDataBaseRoutines.GetAccountIdFromCodeAndType(edtAccountNumber.Text,1) <> -1 then
         begin
          edtAccountNumber.SetFocus ;
          raise Exception.Create(DMTCCoreLink.GetTextLangNoAmp(3078));
         end ;

        {
        if UseCreditor then
         tblAccount.filter := 'WAccountTypeID = 2  and SACCOUNTCODE = ' + QuotedStr(edtAccountNumber.Text)
        else
        tblAccount.filter := 'WAccountTypeID = 1  and SACCOUNTCODE = ' + QuotedStr(edtAccountNumber.Text);
        tblAccount.Filtered := true ;
        tblAccount.Open;
        if not tblAccount.IsEmpty then
          begin
                edtAccountNumber.Text :=  tblAccountSACCOUNTCODE.AsString ;
                edtAccountNumber.tag := tblAccountWAccountID.AsInteger ;
                CheckAccountCode(self);
          end;
        tblAccount.close;   }
      end;
   end else
   begin

    if OSFMessageDlg(DMTCCoreLink.gettextlang(748){Illegal account Number?}, mterror, [mbOk,mbCancel], 0) = mrok then
     begin
      edtAccountNumber.Setfocus;
      exit;
     end else
     begin
       BSearchClick(nil);
       exit;
     end;
   end;

end;

procedure TfmDebtor.Button1Click(Sender: TObject);
Var TempText,TempText2,orgtext : String ;
 I : integer ;
begin
 TempText :=  '00000000000000' ;
 orgtext := TempText ;
 SetLength(TempText,MainAccountLength + 2 );
 i := 0 ;

 if UseCreditor then
  begin
   TempText2 := ReadSysParam('NEWCREDNR','',0).AsString ;
   if TempText2 = '' then
    begin
     i :=  1 + OpenSqlAndGetFirtsColumnValue('Select count(WAccountId) from Account where WaccountTypeID = 2') ;
     TempText := formatfloat(orgtext,i) ;
     TempText := 'C' + TempText ;



    end else
    TempText := TempText2 ;

    while TDataBaseRoutines.GetAccountIdFromCodeAndType(TempText,2) <>-1 do
         begin
              inc(i) ;
              TempText := formatfloat(orgtext,i) ;
              TempText := 'C' + TempText ;
         end;

  end
  else
  begin
  TempText2 := ReadSysParam('NEWDEBNR','',0).AsString ;
   if TempText2 = '' then
    begin
     i :=  1 + OpenSqlAndGetFirtsColumnValue('Select count(WAccountId) from Account where WaccountTypeID = 1') ;
     TempText := formatfloat(TempText,1 + OpenSqlAndGetFirtsColumnValue('Select count(WAccountId) from Account where WaccountTypeID = 1')) ;
     TempText := 'D' + TempText ;
    end else
    TempText := TempText2 ;
     while TDataBaseRoutines.GetAccountIdFromCodeAndType(TempText,1) <>-1 do
         begin
              inc(i) ;
              TempText := formatfloat(orgtext,i) ;
              TempText := 'D' + TempText ;
         end;

  end;
  // allow no incnumbers)
 if  (TempText <> '') and (TempText <> '@') then
 edtAccountNumber.Text := TempText ;

   if ReadSysParam('WLOGINSALESMANLINK', 0, currentuser).AsInteger
          <> 0 then
        begin
          edtSalesPerson.ItemIndex := edtSalesPerson.Items.IndexOfObject
            (TObject(ReadSysParam('WLOGINSALESMANLINK', 0, currentuser)
            .AsInteger));
          edtSalesPerson.Enabled := false;
        end;
end;

function TfmDebtor.FilterFrefix: String;
begin
 if UseCreditor then
    result := 'C' else
    result := 'D' ;
  if Self.Parent = nil then
    result := result +'_L' ;
end;

procedure TfmDebtor.DBGSearchColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
  var
   LastField : String ;
   i : Integer ;
begin
 LastField := CBFindColumn.Text ;
 CBFindColumn.clear ;
 CBFindColumn.AddItem('None',TObject(-1));
 for i := 0 to  cxGrid1DBBandedTableView1.ColumnCount-1 do
   CBFindColumn.AddItem(cxGrid1DBBandedTableView1.Columns[i].Caption,TObject(i));
 CBFindColumn.ItemIndex := CBFindColumn.Items.IndexOf(LastField);
end;

procedure TfmDebtor.BtnOpenClick(Sender: TObject);
begin
  BTBOkClick(Sender);
end;

procedure TfmDebtor.EUseDefaultTaxEnter(Sender: TObject);
var
 oldSelect,oldReturnLookup : string ;
 oldReturnID : Integer ;

begin
  oldSelect := SSelect ;
  oldReturnLookup := ReturnLookup ;
  oldReturnID := ReturnID ;
  FmLookup.IsShowForm := false ;
 try

 EUseDefaultTax.Text := CallLookup(EUseDefaultTax.Text,6);

 EUseDefaultTax.Tag := ReturnID;
 finally

   SSelect := oldSelect ;
   ReturnLookup := oldReturnLookup ;
   ReturnID := oldReturnID ;
 end;
 CBUseDefaultTax.SetFocus ;
end;

procedure TfmDebtor.CBUseDefaultTaxClick(Sender: TObject);
begin
 if CBUseDefaultTax.Checked then
   begin
      EUseDefaultTax.Visible := true ;
      LEUseDefaultTax.Visible := true ;
      if CBUseDefaultTax.Focused then
      if EUseDefaultTax.CanFocus then
      EUseDefaultTax.SetFocus ;
   end
   else
   begin
      EUseDefaultTax.Visible := false ;
      LEUseDefaultTax.Visible := false ;
      EUseDefaultTax.tag := 0  ;
   end;
end;

procedure TfmDebtor.tblAccountAfterInsert(DataSet: TDataSet);

begin
  tblAccountWAccountID.Value := DMTCCoreLink.GetNewId(tcidNEWACCOUNTID);
  tblAccountWREPORTINGGROUP1ID.Asinteger := 0 ;
  tblAccountWREPORTINGGROUP2ID.Asinteger := 0 ;
  tblAccountBSUBACCOUNTS.Asinteger := 0 ;
  tblAccountBINCOMEEXPENSE.Asinteger := 0 ;
  tblAccountDSysDate.AsDateTime:=Now;
end;

procedure TfmDebtor.tblCreditorBeforeOpen(DataSet: TDataSet);
begin
 if (DataSet is TuniTable) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from '+ (DataSet as TuniTable).TableName + ' where 1 = 0 ');
 if (DataSet is TuniQuery) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text +' and 1 = 0');

end;

procedure TfmDebtor.QDebtorCreditorBeforeOpen(DataSet: TDataSet);
begin
  if not UseCreditor then
      begin
        DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,GenSqlDebtor  +' and account.Waccountid is null');
      end else
      begin
        DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,GenSqlCreditor  +' and account.Waccountid is null');
      end;   
end;

 
procedure TfmDebtor.InitPlugins;
var
 i , IncArr,Ins : Integer ;
 ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  IsEnable := false ;
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
   if AFormPluginRecordArray[i].aForm <> nil then
    begin
       AFormPluginRecordArray[i].aUnLoadFormPlugin(AFormPluginRecordArray[i].aForm);
       AFormPluginRecordArray[i].aInst := 0 ;
       AFormPluginRecordArray[i].aForm := nil ;
    end;
 


  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > high(AFormPluginRecordArray)  then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToDebCredRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if UseCreditor then
            @AFormPluginRecordArray[IncArr].aDocSearch := GetProcAddress(Ins, OSFCREDITORRSEARCHRoutineName)
            else
            @AFormPluginRecordArray[IncArr].aDocSearch := GetProcAddress(Ins, OSFDEBTORSEARCHRoutineName);


            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('DEDCRE',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 if not IsEnable then
                   begin
                     if UseCreditor then
                       begin
                         APChar := ReturnName ;
                         AFormPluginRecordArray[IncArr].aPluginEnabled('CREDITOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end else
                       begin
                         APChar := ReturnName ;
                         AFormPluginRecordArray[IncArr].aPluginEnabled('DEBTOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end;
                   end;
              end ;

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

procedure TfmDebtor.InitPluginsOnPagecontrol;
var
 i :  Integer ;
 AForm: TForm ;
 APage : TTabSheet ;
 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;
  AMenuitem : TMenuitem ;
begin

 for i := pgconDebtor.PageCount -1 downto 0 do
   begin
    if pgconDebtor.Pages[i].Tag = 9999 then
      pgconDebtor.Pages[i].free ;
  end;

  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
        if UseCreditor then
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'CREDITOR') else
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'DEBTOR');
         AFormPluginRecordArray[i].aForm := AForm ;
         APage :=  TTabSheet.Create(self) ;
         APage.PageControl := pgconDebtor;
         APage.name :='EXTRAPAGE_' + IntToStr(I) ;
         APage.Tag := 9999 ;
         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         APage.Caption :=  ReturnString ;
         AForm.Parent := APage ;
         AForm.Align := alClient ;
         AForm.BorderStyle := bsnone ;
         AForm.Show ;
         AddFormToSkin(AForm,Self);

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
            
      end;
   if UseCreditor then
     SendMessageToPlugin('TYPE=DEBTOR')
     else
     SendMessageToPlugin('TYPE=CREDITOR') ;
  Pluginscopyfrom1.Caption := DMTCCoreLink.GetTextLang(3289) ;
  Pluginscopyto1.Caption := DMTCCoreLink.GetTextLang(3290) ;

  PluginsAction11.Caption := DMTCCoreLink.GetTextLang(3282);
  Pluginsaction21.Caption := DMTCCoreLink.GetTextLang(3281);


  Pluginscopyfrom1.Visible := Pluginscopyfrom1.Count <> 0 ;
  Pluginscopyto1.Visible := Pluginscopyto1.Count <> 0 ;
  PluginsAction11.Visible := PluginsAction11.Count <> 0 ;
  Pluginsaction21.Visible := Pluginsaction21.Count <> 0 ;
end;

procedure TfmDebtor.SendMessageToPlugin(AMessage: String);
var
 i : Integer ;

begin
  for i := low(AFormPluginRecordArray) to  High(AFormPluginRecordArray) do
    begin
     if  AFormPluginRecordArray[i].aForm <> nil then
      begin
      try
      AFormPluginRecordArray[i].aMessageFormPlugin(TForm(AFormPluginRecordArray[i].aForm),PChar(AMessage));
      except
        On e: Exception do
          begin
            showmessage(GetModuleName(AFormPluginRecordArray[i].aInst) +' ' + e.Message);
          end;
      end;
      end;
    end;
end;


procedure TfmDebtor.BBankAddClick(Sender: TObject);
begin
 ZQAccountRef.Insert ;
end;

procedure TfmDebtor.bBankDeleteClick(Sender: TObject);
begin
 ZQAccountRef.Delete ;
end;

procedure TfmDebtor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 LastShift := shift ;
end;

procedure TfmDebtor.SetUseCreditor(const Value: Boolean);
begin
  FUseCreditor := Value;
   InitPlugins ;
end;

procedure TfmDebtor.edtDelAddress1DblClick(Sender: TObject);
begin
if (edtDelAddress1.Text = '') and (eDelCode.text = '') then
  begin
     eDelCode.text := edtPCode.text ;
     edtDelAddress1.Text   := edtAddress1.text ;
     edtDelAddress2.Text   := edtAddress2.text ;
     edtDelAddress3.Text   := edtAddress3.text ;
     CBDelCountry.ItemIndex   := CBCountry.ItemIndex ;
  end;
end;

procedure TfmDebtor.FormResize(Sender: TObject);
begin
  if not Assigned(SCrollbox1) then exit ;
    if SCrollbox1.Width < 800 then
         begin
            SCrollbox1.HorzScrollBar.Range := 800;
         end;
   if SCrollbox1.Height < 500 then
        begin
            SCrollbox1.VertScrollBar.Range := 500;
        end;
end;

procedure TfmDebtor.pmDocumentPopup(Sender: TObject);
var
 i : Integer ;
 aItem : TMenuItem ;
begin

   Reports1.Visible := false ;
   Openinbrowserfromimplink1.Visible := false ;

  for i :=  Openinbrowserfromimplink1.Count -1 downto 0 do
   begin
    AItem  := Openinbrowserfromimplink1.Items[i] ;
    Openinbrowserfromimplink1.Delete(i) ;
    aItem.Free ;
   end;


 Quote1.Visible := not (UseCreditor or  BIsFindScreen );
 Invoice1.Visible := not (UseCreditor or  BIsFindScreen );
 Creditnote1.Visible := not (UseCreditor or  BIsFindScreen );


  for i :=  Reports1.Count -1 downto 0 do
   begin
    AItem  := Reports1.Items[i] ;
    Reports1.Delete(i) ;
    aItem.Free ;
   end;
   if  QDebtorCreditor.IsEmpty then exit ;


   ZQGen.SQL.Text := 'Select a.imp_extid,b.imp_name,b.IMP_DEBTORURL,b.IMP_CREDITORURL from imp_link a join IMP_SOURCE b ' +
   ' on a.IMP_SOURCEID = b.IMP_SOURCEID where WAccountid = ' +  QDebtorCreditorWAccountID.AsString +
   ' and b.IMP_DEBTORURL <> '' and b.IMP_CREDITORURL <> '' order by 2';
   ZQGen.Open ;
   ALinksList.Clear ;
   i := 0 ;
   while not ZQGen.Eof do
       begin
         aItem := TMenuItem.Create(Openinbrowserfromimplink1) ;
         aItem.Caption := ZQGen.fields[1].AsString ;
          if UseCreditor then
            ALinksList.Add(TDatabaseTableRoutines.ReplaceParams(ZQGen.fields[3].AsString,'ID='+ZQGen.fields[0].AsString))
          else
         ALinksList.Add(TDatabaseTableRoutines.ReplaceParams(ZQGen.fields[2].AsString,'ID='+ZQGen.fields[0].AsString));
         aItem.Tag := i ;
         inc(i);
         aItem.OnClick := Openinbrowserfromimplink1Click ;
         Openinbrowserfromimplink1.Add(aItem);
         ZQGen.next ;
       end;
   Openinbrowserfromimplink1.Visible := Openinbrowserfromimplink1.Count <>0 ;


   if UseCreditor then
    TDataBaseDocumentRoutines.FillStringsWithReportsList(AReportList,DMTCCoreLink.GetLocalPluginDir+  'reports\reports\CREDITOR\reports')
   else
    TDataBaseDocumentRoutines.FillStringsWithReportsList(AReportList,DMTCCoreLink.GetLocalPluginDir+  'reports\reports\DEBTOR\reports');
   for i := 0 to AReportList.Count -1 do
     begin

       aItem := TMenuItem.Create(Reports1) ;
       aItem.Caption := AReportList[i] ;
       aItem.Tag := i ;
       aItem.OnClick := GenReports1Click ;
       Reports1.Add(aItem);

     end;
  Reports1.Visible := Reports1.Count <>0 ;
end;
procedure TfmDebtor.GenReports1Click(Sender: TObject);
var
 RepName : String ;
begin
 RepName := TDataBaseDocumentRoutines.GetListName(TComponent(Sender).Tag,AReportList,False) ;
 if RepName <> '' then
    begin
       if UseCreditor then
         begin
          if not FileExists(DMTCCoreLink.GetLocalPluginDir+  'reports\reports\CREDITOR\reports\' + RepName + '.rep') then
             RepName := DMTCCoreLink.GetLocalPluginDir+   'reports\reports\DEBTOR\reports\' +TDataBaseDocumentRoutines.GetListName(TComponent(Sender).Tag,AReportList,True)  + '.rep'
           else

          RepName := DMTCCoreLink.GetLocalPluginDir+  'reports\reports\CREDITOR\reports\' + RepName + '.rep'
         end
       else
         begin
         if not FileExists(DMTCCoreLink.GetLocalPluginDir+  'reports\reports\DEBTOR\reports\' + RepName + '.rep') then
             RepName := DMTCCoreLink.GetLocalPluginDir+   'reports\reports\DEBTOR\reports\' +TDataBaseDocumentRoutines.GetListName(TComponent(Sender).Tag,AReportList,True)  + '.rep'
           else
          RepName := DMTCCoreLink.GetLocalPluginDir+   'reports\reports\DEBTOR\reports\' + RepName + '.rep' ;
         end;

       if FileExists(RepName) then

       ExecReport(RepName,'WACCOUNTID='+QDebtorCreditorWAccountID.AsString);
    end;
end;


procedure TfmDebtor.Invoice1Click(Sender: TObject);
var
 AInvoice : TfmInvoiceEntryGrid ;
begin
 AInvoice := TfmInvoiceEntryGrid.create(self) ;
 try
    idDocType := 10 ;
    AInvoice.AddInvoiceForAccount := QDebtorCreditorWAccountID.AsInteger ;
    AInvoice.ShowModal ;
 finally
  AInvoice.free ;
 end;
end;

procedure TfmDebtor.Creditnote1Click(Sender: TObject);
var
 AInvoice : TfmInvoiceEntryGrid ;
begin
 AInvoice := TfmInvoiceEntryGrid.create(self) ;
 try
    idDocType := 11 ;
    AInvoice.AddInvoiceForAccount := QDebtorCreditorWAccountID.AsInteger ;
    AInvoice.ShowModal ;
 finally
  AInvoice.free ;
 end;
end;

procedure TfmDebtor.Quote1Click(Sender: TObject);
var
 AInvoice : TfmInvoiceEntryGrid ;
begin
 AInvoice := TfmInvoiceEntryGrid.create(self) ;
 try
    idDocType := 14 ;
    AInvoice.AddInvoiceForAccount := QDebtorCreditorWAccountID.AsInteger ;
    AInvoice.ShowModal ;
 finally
  AInvoice.free ;
 end;
end;

procedure TfmDebtor.tblAccountBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from account where WAccountID is null');
end;

procedure TfmDebtor.Openinbrowserfromimplink1Click(Sender: TObject);
var
 aString : String ;
begin
  aString := ALinksList[TComponent(Sender).tag] ;
  ShellExecute(0,'OPEN',pchar(aString),'','',SW_SHOW) ;
end;

procedure TfmDebtor.BLookupPostalClick(Sender: TObject);
Type
 TLookupPostcode = procedure  (AApplication: TApplication;AOldCode , AOldstreet : String ; Var OutVatnr,Outkvk,Outweb, OutComp, OutProv,OutCity, OutStreet, OutPostal, OutNumber : String) ; stdcall ;
var
 AlookupPostcode : TLookupPostcode ;
 outVatnr,Outkvk,Outweb, OutComp, OutProv,OutCity, OutStreet, OutPostal, OutNumber : String;
begin
 @AlookupPostcode := GetProcAddress(APostCodePlugin, 'LookupPostcode3');
 if @AlookupPostcode <> nil then
   begin
      Outkvk := ECompanyRegnr.Text ;
      outVatnr := edtReference.Text ;
      AlookupPostcode(Application,edtPCode.Text,edtAddress1.Text,outVatnr,Outkvk,Outweb, OutComp, OutProv,OutCity, OutStreet, OutPostal, OutNumber) ;
      if OutStreet <> '' then
        begin
           edtAddress1.Text :=  OutStreet + ' ' + OutNumber ;
           edtPCode.Text :=  OutPostal   ;
           edtAddress2.Text :=  OutCity   ;
           edtAddress3.Text :=  OutProv   ;
           if OutComp <> '' then
             edtName.Text := OutComp ;
           if Outweb <> '' then
             EWebsite.Text := Outweb ;
           if Outkvk <> '' then
             ECompanyRegnr.Text := Outkvk ;
           if outVatnr <> '' then
             edtReference.Text := outVatnr ;

            if CBCountry.Items.IndexOf('Nederland') <> -1 then
            CBCountry.ItemIndex := CBCountry.Items.IndexOf('Nederland')  ;

        end ;
   end;
end;

procedure TfmDebtor.DBGSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ctrlDown := (ssCtrl in Shift);
 if ((key = ord('a')) or  (key = ord('A')) ) and ctrlDown then
     begin
         cxGrid1DBBandedTableView1.Controller.SelectAll;
     end;
end;


procedure TfmDebtor.OnMenuCopy(Sender: TObject);
var
 i : Integer ;
begin

 CopyFromID := QDebtorCreditorWAccountID.AsInteger ;
 for i := 0 to Pluginscopyto1.Count -1 do
    begin
      Pluginscopyto1.Items[i].Enabled := Pluginscopyto1.Items[i].Tag = TComponent(sender).Tag ;
    end;
end;

procedure TfmDebtor.OnMenuPast(Sender: TObject);
    var
 AMessage : String ;

  i : Integer ;
begin
if OSFMessageDlg('Erase old data and copy for plugin '  +  Tmenuitem(sender).Caption + ' from account' + TDataBaseRoutines.GetAccountFullDescription(CopyFromID),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;



  for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
  begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
  
  if  QDebtorCreditorWAccountID.AsInteger <> CopyFromID then
  begin
 AMessage := 'DELETEX=' + IntToStr(QDebtorCreditorWAccountID.AsInteger) ;

 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(AFormPluginRecordArray[(Sender as tcomponent).tag ].aForm),PChar(AMessage));
 AMessage := 'XCOPY=' + IntToStr(CopyFromID) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(AFormPluginRecordArray[(Sender as tcomponent).tag ].aForm),PChar(AMessage));
 AMessage := 'POST=' + IntToStr(QDebtorCreditorWAccountID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(TForm(AFormPluginRecordArray[(Sender as tcomponent).tag ].aForm),PChar(AMessage));
 end;
 end;
end;

procedure TfmDebtor.OnMenuPluginAct1(Sender: TObject);
var
 AMessage : String ;
  AForm : TForm ;

begin
 if UseCreditor then
     AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'CREDITOR') else
    AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'DEBTOR') ;
 try

 AMessage := 'CONTEXT=' + IntToStr(QDebtorCreditorWAccountID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;

procedure TfmDebtor.OnMenuPluginAct2(Sender: TObject);
var
 AMessage : String ;
 AForm : TForm ;
  i : Integer ;
begin
if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount =0 then exit ;
if OSFMessageDlg('Continue this mass action?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;


 if UseCreditor then
     AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'CREDITOR') else
    AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'DEBTOR') ;

 try
   AMessage := 'CONTEXTINIT2=TRUE' ;
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));

 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
  begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := true ;
   AMessage := 'CONTEXT2=' + IntToStr(QDebtorCreditorWAccountID.AsInteger) ;
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
  end;

 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;


procedure TfmDebtor.qryDocHeadBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from dochead where Wdocid is null');
end;

procedure TfmDebtor.EWebsiteDblClick(Sender: TObject);
var
   ALink : String ;
begin
 if trim(EWebsite.Text) <> '' then
  begin
   ALink := trim(EWebsite.Text) ;

   if pos('HTTP',UpperCase(ALink)) < 1 then
     ALink := 'http://' + ALink ;
    ShellExecute(self.Handle,'OPEN',pchar(alink),'','',1);

  end;
end;

procedure TfmDebtor.BFilter2Click(Sender: TObject);
begin
 BFilterClick(BFilter2);


end;

procedure TfmDebtor.OnGenSearchClick(Sender: TObject);
var
 LastID,LastColumn : Integer ;
 ExtraSql : String ;

begin

  look := '' ;
  LastID := QDebtorCreditorWAccountID.AsInteger ;
  if LocateId <> 0 then
    begin
     LastID := LocateId ;
     LocateId := 0 ;
    end;

     
     if  UseCreditor then
          begin
           QDebtorCreditor.SQL.clear ;
           QDebtorCreditor.SQL.Add(GenSqlCreditor);
         end
       else
          begin
           QDebtorCreditor.SQL.clear ;
           QDebtorCreditor.SQL.Add(GenSqlDebtor);
          end;
      ExtraSql :=ASearchPanel.GetClause ;
      if ExtraSql <> '' then
      QDebtorCreditor.SQL.add('and '  + ExtraSql);

     if (LastID <> 0) and (BIsFindScreen) and (sender <> BFilter2)  then
       begin
       QDebtorCreditor.SQL.Add(' or account.Waccountid = ' + IntToStr(LastID)) ;
       QDebtorCreditor.open ;

       end;


    QDebtorCreditor.open ;

   QDebtorCreditor.Locate('WAccountID',LastID,[]);

   BDelete.Enabled := not QDebtorCreditor.IsEmpty ;
   BEdit.Enabled := not QDebtorCreditor.IsEmpty ;
end;

procedure TfmDebtor.bShowTransClick(Sender: TObject);
var
 fmTAccountView: TfmTAccountView;
begin
 fmTAccountView:= TfmTAccountView.Create(Self);
 try
  fmTAccountView.GoToId := QDebtorCreditorWAccountID.AsInteger ;
  fmTAccountView.ShowModal ;
     
 finally
   fmTAccountView.free ;
 end;
end;

procedure TfmDebtor.HandelChangeGroup1Click(Sender: TObject);
var
 i : Integer ;
begin
  if QDebtorCreditor.IsEmpty then exit ;
  if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
      begin
         cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := true ;
         ExecSql('Update account set WReportingGroup1ID =' + IntToStr(TComponent(Sender).tag) +'  where WAccountid=' + InttoStr(QDebtorCreditorWAccountID.AsInteger) ) ;
      end;
  end else
  ExecSql('Update account set WReportingGroup1ID =' + IntToStr(TComponent(Sender).tag) +'  where WAccountid=' + InttoStr(QDebtorCreditorWAccountID.AsInteger) ) ;
 BFilterClick(nil);
end;

procedure TfmDebtor.HandelChangeGroup2Click(Sender: TObject);
var
 i : Integer ;
begin
  if QDebtorCreditor.IsEmpty then exit ;
  if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount <> 0 then
  begin
    for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
      begin
          cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := true ;
         ExecSql('Update account set WReportingGroup2ID =' + IntToStr(TComponent(Sender).tag) +'  where WAccountid=' + InttoStr(QDebtorCreditorWAccountID.AsInteger) ) ;
      end;
  end else
  ExecSql('Update account set WReportingGroup2ID =' + IntToStr(TComponent(Sender).tag) +'  where WAccountid=' + InttoStr(QDebtorCreditorWAccountID.AsInteger) ) ;
 BFilterClick(nil);
end;

procedure TfmDebtor.AddRepgroupmenuitems;
var
 i : Integer ;
 AMenuItem : TMenuItem ;
   aGroupRec: TGroupRecPointer   ;
begin
  Setreportinggroup1.Caption := Label21.Caption  ;
  for i := Setreportinggroup1.Count -1 downto 0 do
    begin
      Setreportinggroup1.Items[i].free ;
    end;
  for i := 0 to CbxRepGroup1.Items.Count -1 do
     begin
       AMenuItem := TMenuItem.Create(Setreportinggroup1);
       AMenuItem.Caption := CbxRepGroup1.Items[i] ;
       AMenuItem.Tag :=  Integer(CbxRepGroup1.Items.Objects[i]);
       AMenuItem.OnClick := HandelChangeGroup1Click ;
        DMTCCoreLink.GroupsObject.getGroup(aGroupRec,AMenuItem.Tag) ;
        if aGroupRec.Wfontcol <> 0 then
         begin
           AMenuItem.Bitmap.Width := 24 ;
           AMenuItem.Bitmap.Height := 24 ;
           AMenuItem.Bitmap.PixelFormat  := pf32bit ;

           AMenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wbackcol ;
           AMenuItem.Bitmap.Canvas.FillRect(Rect(0,0,24,24));
           AMenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wfontcol ;
           AMenuItem.Bitmap.Canvas.FillRect(Rect(8,8,16,16));
           AMenuItem.Bitmap.Canvas.Pixels[0,0] := clNone ;
           AMenuItem.Bitmap.Canvas.Pixels[0,AMenuItem.Bitmap.Height-1] := clNone ;
         end;
       Setreportinggroup1.Add(AMenuItem);
     end;


  Setreportinggroup2.Caption := Label22.Caption  ;
  for i := Setreportinggroup2.Count -1 downto 0 do
    begin
      Setreportinggroup2.Items[i].free ;
    end;
  for i := 0 to CbxRepGroup2.Items.Count -1 do
     begin
       AMenuItem := TMenuItem.Create(Setreportinggroup2);
       AMenuItem.Caption := CbxRepGroup2.Items[i] ;
       AMenuItem.Tag :=  Integer(CbxRepGroup2.Items.Objects[i]);
       AMenuItem.OnClick := HandelChangeGroup2Click ;
        DMTCCoreLink.GroupsObject.getGroup(aGroupRec,AMenuItem.Tag) ;
        if aGroupRec.Wfontcol <> 0 then
         begin
           AMenuItem.Bitmap.Width := 24 ;
           AMenuItem.Bitmap.Height := 24 ;
           AMenuItem.Bitmap.PixelFormat  := pf32bit ;

           AMenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wbackcol ;
           AMenuItem.Bitmap.Canvas.FillRect(Rect(0,0,24,24));
           AMenuItem.Bitmap.Canvas.Brush.Color := aGroupRec.Wfontcol ;
           AMenuItem.Bitmap.Canvas.FillRect(Rect(8,8,16,16));
           AMenuItem.Bitmap.Canvas.Pixels[0,0] := clNone ;
           AMenuItem.Bitmap.Canvas.Pixels[0,AMenuItem.Bitmap.Height-1] := clNone ;
         end;
       Setreportinggroup2.Add(AMenuItem);
     end;
end;

procedure TfmDebtor.ZQDocsWTYPEIDGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
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
   18 : Text := DMTCCoreLink.GetTextLangNoAmp(3270) ;
   19 : Text := DMTCCoreLink.GetTextLangNoAmp(3271) ;
   end;
end;

procedure TfmDebtor.DBGSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and BIsFindScreen and (not panel4.Focused  )  then
    modalresult := mrok ;

end;

{ twf_TfmDebtor }

constructor twf_TfmDebtor.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'debtor-creditor';
  Description := 'Debtor creditor edit / add screen use iscreditor to set debtor creditor mode. use lookup sql to define custom lookup sql';
  with Inparams.Add as TParam do
     begin
        Name := 'ISCREDITOR' ;
        DataType := ftBoolean ;
        Value := false ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LOOKUPSQL' ;
        DataType := ftmemo ;
        Value := '' ;
     end;

end;

procedure twf_TfmDebtor.WorkflowEnd(AForm: TForm);
begin
  OutId := '0' ;
  OutSubid := '0' ;
  if  not TfmDebtor(AForm).QDebtorCreditor.IsEmpty then
    OutId := TfmDebtor(AForm).QDebtorCreditorWAccountID.AsString ;
  AForm.Free ;
end;

function twf_TfmDebtor.WorkFlowStart : TForm ;
var
 aform : TfmDebtor ;
begin
 try
 aform := TfmDebtor.create(nil) ;
 aform.UseCreditor := Inparams.ParamByName('ISCREDITOR').AsBoolean ;
 Result := aform ;
 Result.parent := self.parent ;
 Result.Align := alClient ;
  Result.BorderStyle := bsNone ;
  Result.Show ;
  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;

  if Inparams.ParamByName('LOOKUPSQL').AsString <> '' then
     begin
        TfmDebtor(aform).GenSqlCreditor := Inparams.ParamByName('LOOKUPSQL').AsString  ;
        TfmDebtor(aform).GenSqlDebtor := Inparams.ParamByName('LOOKUPSQL').AsString  ;


     end;
 Except
   on e: Exception do
    begin
       aform.free ;
       raise Exception.Create('Workflow:'+ Displayname +'->' +  e.Message );
    end;
 end;
end;

{ twf_TfmPluginDebtor }

constructor twf_TfmPluginDebtor.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'debtor-creditor-plugins';
  Description := 'Debtor creditor plugin screen use iscreditor to set debtor creditor mode. You must have last id set by the screen before thisone!';
  with Inparams.Add as TParam do
     begin
        Name := 'ISCREDITOR' ;
        DataType := ftBoolean ;
        Value := false ;
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

procedure twf_TfmPluginDebtor.WorkflowEnd(AForm: TForm);
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
                 aplugin.aPluginEnabled('DEDCRE',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 if not IsEnable then
                   begin
                     if Inparams.ParamByName('ISCREDITOR').AsBoolean then
                       begin
                         APChar := ReturnName ;
                         aplugin.aPluginEnabled('CREDITOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end else
                       begin
                         APChar := ReturnName ;
                         aplugin.aPluginEnabled('DEBTOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end;
                   end;
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

function twf_TfmPluginDebtor.WorkFlowStart: TForm;
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
                 aplugin.aPluginEnabled('DEDCRE',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 if not IsEnable then
                   begin
                     if Inparams.ParamByName('ISCREDITOR').AsBoolean then
                       begin
                         APChar := ReturnName ;
                         aplugin.aPluginEnabled('CREDITOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end else
                       begin
                         APChar := ReturnName ;
                         aplugin.aPluginEnabled('DEBTOR',APChar,ImageIndex);
                         IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                       end;
                   end;
              end ;
          end;
           //  if not IsEnable then
           //     raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not found or loaded.' );

     if Inparams.ParamByName('ISCREDITOR').AsBoolean then
         Result := aplugin.aLoadFormPlugin(Application,'CREDITOR') else
        Result := aplugin.aLoadFormPlugin(Application,'DEBTOR') ;

      AMessage := 'EDIT=' +  Inparams.ParamByName('LASTID').AsString  ;

        if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;

      aplugin.aMessageFormPlugin(Result,PChar(AMessage));
end;

procedure TfmDebtor.BExportClick(Sender: TObject);
Var
 AStrings : TStringList ;
 i,Recindex : Integer ;
 AddLine ,OpenWithApp,aFilename : String ;
begin
 AddLine := '' ;
 for i := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
  if cxGrid1DBBandedTableView1.Columns[i].VisibleForCustomization then
   begin
      if i <> 0  then AddLine := AddLine + #9 ;

      AddLine := AddLine + cxGrid1DBBandedTableView1.Columns[i].Caption  ;
   end;

 if not SaveDialog1.Execute then exit ;
 AStrings := TStringList.Create ;
 try
   AStrings.Add(AddLine);


   if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount = 0  then
      cxGrid1DBBandedTableView1.Controller.SelectAll ;

   for Recindex := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
     begin
       cxGrid1DBBandedTableView1.Controller.SelectedRecords[Recindex].Focused := True ;

       AddLine := '' ;
          for i := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
             if cxGrid1DBBandedTableView1.Columns[i].VisibleForCustomization then
         begin
            if i <> 0 then AddLine := AddLine + #9 ;

            if QDebtorCreditor.FindField(cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName) <> nil then
            AddLine := AddLine + QDebtorCreditor.FindField(cxGrid1DBBandedTableView1.Columns[i].DataBinding.FieldName).DisplayText ;
         end;
       AStrings.Add(AddLine);
       QDebtorCreditor.next ;
     end;
   AStrings.SaveToFile(ChangeFileExt(SaveDialog1.FileName,'.txt'));
      AddLine := ChangeFileExt(SaveDialog1.FileName,'.txt') ;
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

procedure TfmDebtor.Showtransact1Click(Sender: TObject);
var
 aFormReverseBatch : TFormReverseBatch ;
begin
 if pgconDebtor.ActivePage = TSInvoicesQuotes  then
  begin
   if qryDocHead.IsEmpty then
     exit ;
   aFormReverseBatch := TFormReverseBatch.create(self) ;
   try
     aFormReverseBatch.gotodocid := qryDocHeadWDOCID.AsInteger ;
     aFormReverseBatch.ShowModal;

   finally
      aFormReverseBatch.free ;
   end ;
  end else
  if (dmToonTransact.PopupComponent <> nil) and (dmToonTransact.PopupComponent is TcxGridSite) and ((dmToonTransact.PopupComponent as TcxGridSite).GridView.Name = cxGrid6DBTableView1.Name) then

  begin
     if wwqryOpenDebits.IsEmpty then
     exit ;
   aFormReverseBatch := TFormReverseBatch.create(self) ;
   try
     aFormReverseBatch.gototransactid := wwqryOpenDebitsWTRANSACTIONID.AsInteger ;
     aFormReverseBatch.ShowModal;

   finally
      aFormReverseBatch.free ;
   end ; 
  end  else
  if (dmToonTransact.PopupComponent <> nil) and (dmToonTransact.PopupComponent is TcxGridSite) and ((dmToonTransact.PopupComponent as TcxGridSite).GridView.Name = cxGrid5DBTableView1.Name) then
  begin
     if wwqryOpenCredits.IsEmpty then
     exit ;
   aFormReverseBatch := TFormReverseBatch.create(self) ;
   try
     aFormReverseBatch.gototransactid := wwqryOpenCreditsWTRANSACTIONID.AsInteger ;
     aFormReverseBatch.ShowModal;

   finally
      aFormReverseBatch.free ;
   end ;
  end;
end;

procedure TfmDebtor.QadressPerAccountAfterInsert(DataSet: TDataSet);
begin
  QadressPerAccountWADDRESSPERACCOUNTID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_ADDRESSPERACCOUNT_ID') ;
end;

procedure TfmDebtor.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
   aGroupRec :TGroupRecPointer ;
begin

  if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WCOLOR.Index]),0) <> 0) or (
  StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WTEXTCOLOR.Index]),0) <> 0) then
     begin

        if (AViewInfo.Selected) or (AViewInfo.Focused) then
          begin

           if ( StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WTEXTCOLOR.Index]),0) <> 0) then
              ACanvas.Brush.Color :=  StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WTEXTCOLOR.Index]),0) ;
           if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WCOLOR.Index]),0) <> 0) then
              ACanvas.Font.Color :=  StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WCOLOR.Index]),0) ;
          end else
          begin

           if (StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WCOLOR.Index]),0) <> 0) then
              ACanvas.Brush.Color :=  StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WCOLOR.Index]),0) ;
           if ( StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WTEXTCOLOR.Index]),0) <> 0) then
              ACanvas.Font.Color :=  StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WTEXTCOLOR.Index]),0) ;
          end;
     end;

    if  uppercase(TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName) = 'GROUPDESC2'then
       begin
         DMTCCoreLink.GroupsObject.getGroup(aGroupRec,StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Index]),0)) ;
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
                 //  StrEvalCondition,StrEvalFontCol,StrEvalBackCol
   // always do the extra colors
   if StrEvalCondition <> '' then
    if VarToStr(EvaluateText(StrEvalCondition,'COLUMN='+ TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName +#13+#10 + 'FOCUS=' + BoolToStr((AViewInfo.Focused  ),true)+#13+#10 + dmQuantumGridDefs.getRecordValuesAsString(AViewInfo.GridRecord) ,nil)) = 'True' then
      begin
               ACanvas.Brush.Color :=  StrToIntDef( VarToStr(EvaluateText(StrEvalBackCol,'COLUMN='+ TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName +#13+#10 + 'FOCUS=' + BoolToStr((AViewInfo.Focused ),true)+#13+#10 + dmQuantumGridDefs.getRecordValuesAsString(AViewInfo.GridRecord),nil)),ACanvas.Brush.Color)  ;
               ACanvas.Font.Color :=   StrToIntDef( VarToStr(EvaluateText(StrEvalFontCol,'COLUMN='+ TcxGridDBBandedColumn(AViewInfo.Item).DataBinding.FieldName +#13+#10 + 'FOCUS=' + BoolToStr((AViewInfo.Focused ),true)+#13+#10 + dmQuantumGridDefs.getRecordValuesAsString(AViewInfo.GridRecord),nil)),ACanvas.Font.Color)  ;
      end;
 
end;
procedure TfmDebtor.QEventsUSERFIELD5GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 text := DMTCCoreLink.stockObject.GetStockCodeAndDescription(StrToIntDef(Sender.AsString,0));
end;

procedure TfmDebtor.cxGrid2DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

    if VarTostr(AViewInfo.GridRecord.Values[cxGrid2DBTableView1CATEGORY.Index]) = '4' then
        ACanvas.Font.Style := [fsBold] ;
  //  dmDatabase.QEventsCATEGORY.AsInteger = 4 then
   //  DBGAppointments.Canvas.Font.Style := [fsBold] ;
end;

procedure TfmDebtor.cbAlltransClick(Sender: TObject);
begin
 pgconDebtorChange(self);
end;

procedure TfmDebtor.CbxRepGroup1CloseUp(Sender: TObject);
begin
 (Sender As TComboBox).Color:=ClWindow;
end;

initialization
twf_TfmPluginDebtor.Create(nil);
 twf_TfmDebtor.Create(nil);


end.
