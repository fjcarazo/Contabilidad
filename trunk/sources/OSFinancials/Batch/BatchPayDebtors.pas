(*
  Id: BatchPayDebtors.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchPayDebtors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, StdCtrls,
    Menus, Buttons, ExtCtrls,
   DBAccess , Uni, DBCtrls,UosfVisuals, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, DBClient;

type
  TfrBatchPayDebtors = class(TForm)
    CDOpenstaandePosten: TClientDataSet;
    QSelectOpenDebtorItems: TuniQuery;
    SaveDialog1: TSaveDialog;
    DataSource1: TDataSource;
    tblSysVars: TuniTable;
    CDOpenstaandePostenCode: TStringField;
    CDOpenstaandePostenSDescription: TStringField;
    CDOpenstaandePostenWReportingGroup1ID: TIntegerField;
    CDOpenstaandePostenWReportingGroup2ID: TIntegerField;
    CDOpenstaandePostenWAccountID: TIntegerField;
    CDOpenstaandePostenSCode: TStringField;
    CDOpenstaandePostenWContactID: TIntegerField;
    CDOpenstaandePostenSPassword: TStringField;
    CDOpenstaandePostenSPostal1: TStringField;
    CDOpenstaandePostenSPostal2: TStringField;
    CDOpenstaandePostenSPostal3: TStringField;
    CDOpenstaandePostenSPostalCode: TStringField;
    CDOpenstaandePostenSDelivery1: TStringField;
    CDOpenstaandePostenSDelivery2: TStringField;
    CDOpenstaandePostenSDelivery3: TStringField;
    CDOpenstaandePostenSDeliveryCode: TStringField;
    CDOpenstaandePostenSTelephone1: TStringField;
    CDOpenstaandePostenSTelephone2: TStringField;
    CDOpenstaandePostenSFax: TStringField;
    CDOpenstaandePostenSEmail: TStringField;
    CDOpenstaandePostenSBankName: TStringField;
    CDOpenstaandePostenSBranchCode: TStringField;
    CDOpenstaandePostenSBankAccountNumber: TStringField;
    CDOpenstaandePostenSBankAccountName: TStringField;
    CDOpenstaandePostenSCreditCardNumber: TStringField;
    CDOpenstaandePostenDDueDate: TDateField;
    CDOpenstaandePostenSCreditCardType: TStringField;
    CDOpenstaandePostenSCreditCardHolder: TStringField;
    CDOpenstaandePostenFCREDITLimit: TFloatField;
    CDOpenstaandePostenFChargeAmount: TFloatField;
    CDOpenstaandePostenFDiscount: TFloatField;
    CDOpenstaandePostenFInterest: TFloatField;
    CDOpenstaandePostenWBankID: TIntegerField;
    CDOpenstaandePostenWSalesmanID: TIntegerField;
    CDOpenstaandePostenBOpenItem: TIntegerField;
    CDOpenstaandePostenBPostBBF: TIntegerField;
    CDOpenstaandePostenBDisabled: TIntegerField;
    CDOpenstaandePostenSMessage: TStringField;
    CDOpenstaandePostenWDefaultPriceTypeID: TIntegerField;
    CDOpenstaandePostenDLastActivity: TDateField;
    CDOpenstaandePostenWCurrencyID: TIntegerField;
    CDOpenstaandePostenWForexAccountID: TIntegerField;
    CDOpenstaandePostenDSysDate: TDateTimeField;
    CDOpenstaandePostenWDueDays: TIntegerField;
    CDOpenstaandePostenWDefaultAccount: TIntegerField;
    CDOpenstaandePostenOutstanding: TFloatField;
    CDOpenstaandePostenCountOutstanding: TIntegerField;
    CDOpenstaandePostenReportingGroup1: TStringField;
    CDOpenstaandePostenReportingGroup2: TStringField;
    CDOpenstaandePostenEXPORT: TIntegerField;
    QGoups: TuniQuery;
    CDOpenstaandePostenTotalAmount: TFloatField;
    PopupMenu1: TPopupMenu;
    Uncheckall1: TMenuItem;
    Uncheckselected1: TMenuItem;
    Checkselected1: TMenuItem;
    CDOpenstaandePostenSReference: TStringField;
    QSelectQuotes: TuniQuery;
    CDOpenstaandePostenType: TStringField;
    CDOpenstaandePostenWTransactionID: TIntegerField;
    CDOpenstaandePostenDDate: TDateField;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BtnPrint: TBitBtn;
    QGoupsWGROUPID: TIntegerField;
    QGoupsWGROUPTYPEID: TIntegerField;
    QGoupsSDESCRIPTION: TStringField;
    QGoupsWPARENTGROUP2ID: TIntegerField;
    QGoupsWPARENTGROUP1ID: TIntegerField;
    QGoupsDSYSDATE: TDateTimeField;
    QGoupsWSORTNO: TIntegerField;
    QSelectOpenDebtorItemsCODE: TStringField;
    QSelectOpenDebtorItemsSDESCRIPTION: TStringField;
    QSelectOpenDebtorItemsWREPORTINGGROUP1ID: TIntegerField;
    QSelectOpenDebtorItemsWREPORTINGGROUP2ID: TIntegerField;
    QSelectOpenDebtorItemsWACCOUNTID: TIntegerField;
    QSelectOpenDebtorItemsSREFERENCE: TStringField;
    QSelectOpenDebtorItemsWCONTACTID: TIntegerField;
    QSelectOpenDebtorItemsSPASSWORD: TStringField;
    QSelectOpenDebtorItemsSPOSTAL1: TStringField;
    QSelectOpenDebtorItemsSPOSTAL2: TStringField;
    QSelectOpenDebtorItemsSPOSTAL3: TStringField;
    QSelectOpenDebtorItemsSPOSTALCODE: TStringField;
    QSelectOpenDebtorItemsSDELIVERY1: TStringField;
    QSelectOpenDebtorItemsSDELIVERY2: TStringField;
    QSelectOpenDebtorItemsSDELIVERY3: TStringField;
    QSelectOpenDebtorItemsSDELIVERYCODE: TStringField;
    QSelectOpenDebtorItemsSTELEPHONE1: TStringField;
    QSelectOpenDebtorItemsSTELEPHONE2: TStringField;
    QSelectOpenDebtorItemsSFAX: TStringField;
    QSelectOpenDebtorItemsSEMAIL: TStringField;
    QSelectOpenDebtorItemsSBANKNAME: TStringField;
    QSelectOpenDebtorItemsSBRANCHCODE: TStringField;
    QSelectOpenDebtorItemsSBANKACCOUNTNUMBER: TStringField;
    QSelectOpenDebtorItemsSBANKACCOUNTNAME: TStringField;
    QSelectOpenDebtorItemsSCREDITCARDNUMBER: TStringField;
    QSelectOpenDebtorItemsDEXPIRYDATE: TDateTimeField;
    QSelectOpenDebtorItemsSCREDITCARDTYPE: TStringField;
    QSelectOpenDebtorItemsSCREDITCARDHOLDER: TStringField;
    QSelectOpenDebtorItemsFCREDITLIMIT: TFloatField;
    QSelectOpenDebtorItemsFCHARGEAMOUNT: TFloatField;
    QSelectOpenDebtorItemsFDISCOUNT: TFloatField;
    QSelectOpenDebtorItemsFINTEREST: TFloatField;
    QSelectOpenDebtorItemsWBANKID: TIntegerField;
    QSelectOpenDebtorItemsWSALESMANID: TIntegerField;
    QSelectOpenDebtorItemsBOPENITEM: TSmallintField;
    QSelectOpenDebtorItemsBPOSTBBF: TSmallintField;
    QSelectOpenDebtorItemsBDISABLED: TSmallintField;
    QSelectOpenDebtorItemsSMESSAGE: TStringField;
    QSelectOpenDebtorItemsWDEFAULTPRICETYPEID: TIntegerField;
    QSelectOpenDebtorItemsDLASTACTIVITY: TDateTimeField;
    QSelectOpenDebtorItemsWCURRENCYID: TIntegerField;
    QSelectOpenDebtorItemsWFOREXACCOUNTID: TIntegerField;
    QSelectOpenDebtorItemsSREFERENCE_1: TStringField;
    QSelectOpenDebtorItemsDSYSDATE: TDateTimeField;
    QSelectOpenDebtorItemsWDUEDAYS: TIntegerField;
    QSelectOpenDebtorItemsWDEFAULTACCOUNT: TIntegerField;
    QSelectOpenDebtorItemsWTRANSACTIONID: TIntegerField;
    QSelectOpenDebtorItemsDDATE: TDateTimeField;
    QSelectOpenDebtorItemsTOTALAMOUNT: TFloatField;
    QSelectOpenDebtorItemsOUTSTANDING: TFloatField;
    QSelectOpenDebtorItemsCOUNTOUTSTANDING: TIntegerField;
    QSelectQuotesCODE: TStringField;
    QSelectQuotesSDESCRIPTION: TStringField;
    QSelectQuotesWREPORTINGGROUP1ID: TIntegerField;
    QSelectQuotesWREPORTINGGROUP2ID: TIntegerField;
    QSelectQuotesWACCOUNTID: TIntegerField;
    QSelectQuotesSREFERENCE: TStringField;
    QSelectQuotesWCONTACTID: TIntegerField;
    QSelectQuotesSPASSWORD: TStringField;
    QSelectQuotesSPOSTAL1: TStringField;
    QSelectQuotesSPOSTAL2: TStringField;
    QSelectQuotesSPOSTAL3: TStringField;
    QSelectQuotesSPOSTALCODE: TStringField;
    QSelectQuotesSDELIVERY1: TStringField;
    QSelectQuotesSDELIVERY2: TStringField;
    QSelectQuotesSDELIVERY3: TStringField;
    QSelectQuotesSDELIVERYCODE: TStringField;
    QSelectQuotesSTELEPHONE1: TStringField;
    QSelectQuotesSTELEPHONE2: TStringField;
    QSelectQuotesSFAX: TStringField;
    QSelectQuotesSEMAIL: TStringField;
    QSelectQuotesSBANKNAME: TStringField;
    QSelectQuotesSBRANCHCODE: TStringField;
    QSelectQuotesSBANKACCOUNTNUMBER: TStringField;
    QSelectQuotesSBANKACCOUNTNAME: TStringField;
    QSelectQuotesSCREDITCARDNUMBER: TStringField;
    QSelectQuotesDEXPIRYDATE: TDateTimeField;
    QSelectQuotesSCREDITCARDTYPE: TStringField;
    QSelectQuotesSCREDITCARDHOLDER: TStringField;
    QSelectQuotesFCREDITLIMIT: TFloatField;
    QSelectQuotesFCHARGEAMOUNT: TFloatField;
    QSelectQuotesFDISCOUNT: TFloatField;
    QSelectQuotesFINTEREST: TFloatField;
    QSelectQuotesWBANKID: TIntegerField;
    QSelectQuotesWSALESMANID: TIntegerField;
    QSelectQuotesBOPENITEM: TSmallintField;
    QSelectQuotesBPOSTBBF: TSmallintField;
    QSelectQuotesBDISABLED: TSmallintField;
    QSelectQuotesSMESSAGE: TStringField;
    QSelectQuotesWDEFAULTPRICETYPEID: TIntegerField;
    QSelectQuotesDLASTACTIVITY: TDateTimeField;
    QSelectQuotesWCURRENCYID: TIntegerField;
    QSelectQuotesWFOREXACCOUNTID: TIntegerField;
    QSelectQuotesSDOCNO: TStringField;
    QSelectQuotesDSYSDATE: TDateTimeField;
    QSelectQuotesWDUEDAYS: TIntegerField;
    QSelectQuotesWDEFAULTACCOUNT: TIntegerField;
    QSelectQuotesOUTSTANDING: TFloatField;
    QSelectQuotesTOTALAMOUNT: TFloatField;
    QSelectQuotesCOUNTOUTSTANDING: TIntegerField;
    tblSysVarsSCOMPANYNAME: TStringField;
    tblSysVarsSCOMPANYREGNO: TStringField;
    tblSysVarsWEMAILSERVERADDRESS: TStringField;
    tblSysVarsWFAXSERVERID: TIntegerField;
    tblSysVarsBLOBLOGO: TBlobField;
    tblSysVarsSADDRESS1: TStringField;
    tblSysVarsSADDRESS2: TStringField;
    tblSysVarsSADDRESS3: TStringField;
    tblSysVarsSPOSTCODE: TStringField;
    tblSysVarsSPHONENUMBER: TStringField;
    tblSysVarsSFAXNUMBER: TStringField;
    tblSysVarsWRETAINEDINCOMEID: TIntegerField;
    tblSysVarsWDEBTORSCONTROLID: TIntegerField;
    tblSysVarsWCREDITORSCONTROLID: TIntegerField;
    tblSysVarsSBACKUPPATH: TStringField;
    tblSysVarsWCOSTOFSALESTYPEID: TIntegerField;
    tblSysVarsWCREDITNOTEBATCHTYPEID: TIntegerField;
    tblSysVarsSCREDITNOTEMESSAGE1: TStringField;
    tblSysVarsSCREDITNOTEMESSAGE2: TStringField;
    tblSysVarsSCREDITNOTEMESSAGE3: TStringField;
    tblSysVarsWPURCHASESBATCHID: TIntegerField;
    tblSysVarsSPURCHASESMESSAGE1: TStringField;
    tblSysVarsSPURCHASESMESSAGE2: TStringField;
    tblSysVarsSPURCHASESMESSAGE3: TStringField;
    tblSysVarsWGOODSRETURNEDBATCHID: TIntegerField;
    tblSysVarsSGOODSRETURNEDMESSAGE1: TStringField;
    tblSysVarsSGOODSRETURNEDMESSAGE2: TStringField;
    tblSysVarsSGOODSRETURNEDMESSAGE3: TStringField;
    tblSysVarsWINVOICESBATCHID: TIntegerField;
    tblSysVarsSINVOICESMESSAGE1: TStringField;
    tblSysVarsSINVOICESMESSAGE2: TStringField;
    tblSysVarsSINVOICESMESSAGE3: TStringField;
    tblSysVarsWDISPLAYAMOUNT: TIntegerField;
    tblSysVarsBACCOUNTSOPEN: TSmallintField;
    tblSysVarsBBATCHTYPES: TSmallintField;
    tblSysVarsBGROUPS: TSmallintField;
    tblSysVarsBNOTCLOSED: TSmallintField;
    tblSysVarsBPERIODCHANGE: TSmallintField;
    tblSysVarsBSALESMANEXIST: TSmallintField;
    tblSysVarsBUNITSEXIST: TSmallintField;
    tblSysVarsFLASTYEARPL: TFloatField;
    tblSysVarsWNOOFPERIODS: TIntegerField;
    tblSysVarsWINVOICEPAPERID: TIntegerField;
    tblSysVarsWCREDITNOTEPAPERID: TIntegerField;
    tblSysVarsWPURCHASEPAPERID: TIntegerField;
    tblSysVarsWGOODSRETURNEDPAPERID: TIntegerField;
    tblSysVarsWQUOTEPAPERID: TIntegerField;
    tblSysVarsWORDERPAPERID: TIntegerField;
    tblSysVarsWSTATEMENTPAPERID: TIntegerField;
    tblSysVarsWREMITTANCEPAPERID: TIntegerField;
    tblSysVarsFRECONCILEDBANKBALANCE: TFloatField;
    tblSysVarsWRECONCILEDBANKID: TIntegerField;
    tblSysVarsDRECONCILEDLASTDATE: TDateTimeField;
    tblSysVarsSSTATEMENTMESSAGE1: TStringField;
    tblSysVarsSSTATEMENTMESSAGE2: TStringField;
    tblSysVarsSSTATEMENTMESSAGE3: TStringField;
    tblSysVarsBCREATEBALANCELINK: TSmallintField;
    tblSysVarsWTAXDUEACCOUNTID: TIntegerField;
    tblSysVarsBTAXINVOICEBASED: TSmallintField;
    tblSysVarsBCREATECOSTOFSALES: TSmallintField;
    tblSysVarsWCURRENTUSERID: TIntegerField;
    tblSysVarsSINVOICEHEADING: TStringField;
    tblSysVarsSCREDITNOTEHEADING: TStringField;
    tblSysVarsSPURCHASEHEADING: TStringField;
    tblSysVarsSGOODSRETURNEDHEADING: TStringField;
    tblSysVarsSQUOTEHEADING: TStringField;
    tblSysVarsSQUOTEMESSAGE1: TStringField;
    tblSysVarsSQUOTEMESSAGE2: TStringField;
    tblSysVarsSQUOTEMESSAGE3: TStringField;
    tblSysVarsSORDERHEADING: TStringField;
    tblSysVarsSORDERMESSAGE1: TStringField;
    tblSysVarsSORDERMESSAGE2: TStringField;
    tblSysVarsSORDERMESSAGE3: TStringField;
    tblSysVarsBPOSTTOLASTYEAR: TSmallintField;
    tblSysVarsWBASECURRENCYID: TIntegerField;
    tblSysVarsBMULTICURRENCY: TSmallintField;
    tblSysVarsSTAXREGNO: TStringField;
    tblSysVarsBPAYMENTSBASED: TSmallintField;
    tblSysVarsWDUEACCOUNTID: TIntegerField;
    tblSysVarsWLANGUAGEID: TIntegerField;
    tblSysVarsBONLINE: TSmallintField;
    tblSysVarsBREMOTE: TSmallintField;
    tblSysVarsWCOLOURID: TIntegerField;
    tblSysVarsSACCOUNTREPORTNAME1: TStringField;
    tblSysVarsSACCOUNTREPORTNAME2: TStringField;
    tblSysVarsSDEBTORREPORTNAME1: TStringField;
    tblSysVarsSDEBTORREPORTNAME2: TStringField;
    tblSysVarsSCREDITORREPORTNAME1: TStringField;
    tblSysVarsSCREDITORREPORTNAME2: TStringField;
    tblSysVarsSSTOCKREPORTNAME1: TStringField;
    tblSysVarsSSTOCKREPORTNAME2: TStringField;
    tblSysVarsSDOCUMENTREPORTNAME1: TStringField;
    tblSysVarsSDOCUMENTREPORTNAME2: TStringField;
    tblSysVarsSSELLINGPRICENAME1: TStringField;
    tblSysVarsSSELLINGPRICENAME2: TStringField;
    tblSysVarsSSELLINGPRICENAME3: TStringField;
    tblSysVarsWVERSION: TIntegerField;
    tblSysVarsSREPORTFONTSNAME: TStringField;
    tblSysVarsBUSEAVGCOST: TSmallintField;
    tblSysVarsBPRNSTATEMENTLOGO: TSmallintField;
    tblSysVarsDTLASTUSETIME: TDateTimeField;
    tblSysVarsBSHOWTIPS: TSmallintField;
    tblSysVarsWAUTOSAVETIME: TIntegerField;
    tblSysVarsBSHOWREMINDER: TSmallintField;
    tblSysVarsBSERVICEPREPRINTED: TSmallintField;
    tblSysVarsWDEFAULTOUTPUTID: TIntegerField;
    tblSysVarsWDEFAULTZOOM: TIntegerField;
    tblSysVarsBUSEOUTLOOKEXP: TSmallintField;
    tblSysVarsSEMAILADDRESS: TStringField;
    QSelectQuotesWTYPEID: TIntegerField;
    ickall1: TMenuItem;
    QSelectOpenDebtorItemsDDUEDATE: TDateTimeField;
    QSelectQuotesDDUEDATE: TDateTimeField;
    CDOpenstaandePostenSLINEDESC: TStringField;
    QSelectOpenDebtorItemsSLINEDESC: TStringField;
    QSelectQuotesSLINEDESC: TStringField;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LBankAccount: TLabel;
    LPaymentDate: TLabel;
    LContraAccount: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BRefresh: TButton;
    EPaymentBankAccount: TEdit;
    DTPaymentDate: TDateTimePicker;
    BitBtn4: TBitBtn;
    EContraAccount: TEdit;
    CBUseInvoiceRef: TCheckBox;
    EMessage1: TEdit;
    EMessage2: TEdit;
    EMessage3: TEdit;
    cbIncQuotes: TCheckBox;
    PFilter: TPanel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1EXPORT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Code: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDescription: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Type: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SReference: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1TotalAmount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Outstanding: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDuedate: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDueDays: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DLastActivity: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FChargeAmount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FCREDITLimit: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FDiscount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FInterest: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ReportingGroup1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1ReportingGroup2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBankAccountNumber: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBranchCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostal3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPostalCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STelephone1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SLINEDESC: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDate: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BDisabled: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BOpenItem: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BPostBBF: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CountOutstanding: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DSysDate: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBankAccountName: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SBankName: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCreditCardHolder: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCreditCardNumber: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCreditCardType: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDelivery1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDelivery2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDelivery3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDeliveryCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SEmail: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SFax: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SMessage: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPassword: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STelephone2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WAccountID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WBankID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WContactID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WCurrencyID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDefaultAccount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDefaultPriceTypeID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WForexAccountID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WReportingGroup1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WReportingGroup2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WSalesmanID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTransactionID: TcxGridDBBandedColumn;
    QSelectQuotesWACCOUNTTYPEID: TIntegerField;
    QSelectOpenDebtorItemsWACCOUNTTYPEID: TIntegerField;
    cbExportType: TComboBox;
    Label6: TLabel;
    CDOpenstaandePostenDEXPIRYDATE: TDateTimeField;
    QSelectOpenDebtorItemsSCOMPANYREGNO: TStringField;
    CDOpenstaandePostenSCOMPANYREGNO: TStringField;
    procedure BRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure Uncheckall1Click(Sender: TObject);
    procedure Uncheckselected1Click(Sender: TObject);
    procedure Checkselected1Click(Sender: TObject);
    procedure BExporteerClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
     procedure CreatePain008(AList: TStringList);

    procedure BtnPrintClick(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure ickall1Click(Sender: TObject);
    procedure QSelectOpenDebtorItemsBeforeOpen(DataSet: TDataSet);
    procedure QSelectQuotesBeforeOpen(DataSet: TDataSet);
    procedure CBCreateClieopClick(Sender: TObject);
    procedure EPaymentBankAccountExit(Sender: TObject);
    procedure cbExportTypeChange(Sender: TObject);
  private
    FLastBatchRun: Integer;
    procedure CreateClieop(AList: TStringList);
    procedure SetLastBatchRun(const Value: Integer);
    procedure FillDebtorsOpenItem;
    function SortClientDataSet(ClientDataSet: TClientDataSet;
      FieldName: String; var AscIdx: Boolean): Boolean;
    procedure SearchClick(Sender: TObject);
    { Private declarations }
  public
    //IniFile : TStringList ;
     AsearchPanel : TSearchPanel ;
    BDesc : Boolean ;
    RepParams : String ;
    property LastBatchRun : Integer  read FLastBatchRun write SetLastBatchRun;
    { Public declarations }
  end;

var
  frBatchPayDebtors: TfrBatchPayDebtors;

implementation

uses strutils, Database, Lookup, GlobalFunctions, XRoutines, DatabaseAccess,
  TcVariables , UDMTCCoreLink, NewProgress, OSFGeneralRoutines,
  FreeReportsUnit, UDmQuantumGridDefs;
{$R *.dfm}

Function Str2Float(S:String):Real;
 Var i : Integer ;
begin
 // done : Pieter Lets strip anny non numeric characters before conversion
 for i := length(S) downto 1 do
    if not (s[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator,'-']) then
       delete(s,i,1);

 Str2Float:=0;
 if (Trim(S)='') then exit;
 try
   str2Float:=StrToFloat(s);
 except
   Str2Float:=0;
 end;
end;


procedure TfrBatchPayDebtors.CreateClieop(AList: TStringList);
var
 ALine : String[50] ;
 ALine35 : String[35] ;
 ALine10 : String[10] ;
 ATotalOfAccounts,TotalAmount,ABankAccount : Int64 ;
 NumberOfEntrys : Integer ;
Const
 AFillLine = '                                                   ';
begin      // example line
  // header
  ATotalOfAccounts := 0 ;
  TotalAmount := 0 ;
  NumberOfEntrys := 0 ;
  Inc(FLastBatchRun);
  LastBatchRun := (LastBatchRun mod 999) ;
          //'0001A050105CLIEOP03HB34A05011'
  ALine := '0001A' + formatdatetime('ddmmyy',date) +'CLIEOP03' + 'TC01A05011' + AFillLine ;
  AList.add(ALine);
  // header
//0010B0005448021440001EUR
  // batch trailer
  ALine := '0010B10' + FormatFloat('0000000000', Str2Float(EPaymentBankAccount.text)) + FormatFloat('0000',LastBatchRun) + 'EUR' + AFillLine ;
  AList.add(ALine);
 // batch trailer
 // Desc record
  if trim(EMessage1.Text) <> '' then
  ALine := '0020A' + EMessage1.Text + AFillLine ;
  AList.add(ALine);
  if trim(EMessage2.Text) <> '' then
  ALine := '0020A' + EMessage2.Text + AFillLine ;
  AList.add(ALine);
  if trim(EMessage3.Text) <> '' then
  ALine := '0020A' + EMessage3.Text + AFillLine ;
  AList.add(ALine);

 // Desc record
 // Sender record
  tblSysVars.Open ;
  ALine35 := tblSysVarsSCompanyName.AsString + AFillLine ;
  tblSysVars.Close ;
  ALine := '0030B1' + FormatDateTime('ddmmyy',DTPaymentDate.Date) + ALine35 + 'P  ' ;
  AList.add(ALine);
 // Sender record
  // Main loop
  CDOpenstaandePosten.DisableControls ;
  try
  CDOpenstaandePosten.First ;
   while not CDOpenstaandePosten.eof do
    begin
      if CDOpenstaandePostenEXPORT.AsString ='1' then
        begin
          if (StrToIntDef( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSBankAccountNumber.AsString),0) = 0) then
             begin
                 OSFMessageDlg('No bank account for ' + CDOpenstaandePostenCode.AsString + ' ' + CDOpenstaandePostenSDescription.AsString+#13+#10 + 'Skiping record!',mtError,[mbok],0) ;
                 CDOpenstaandePosten.Next ;
                 Continue ;
             end;

           // pure payment
           if CDOpenstaandePostenSBranchCode.AsString = '@' then
           begin
             ALine := '0100A1001' ;
           end else
           // unpure payment
           begin
              ALine := '0100A1002' ;
           end;
          inc(NumberOfEntrys);
          TotalAmount := TotalAmount + ABS(round(CDOpenstaandePostenOutstanding.AsFloat*100)) ;
          ABankAccount :=   StrToInt( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSBankAccountNumber.AsString));
          ATotalOfAccounts := ATotalOfAccounts +  ABankAccount ;
          ABankAccount := StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text));
          ATotalOfAccounts := ATotalOfAccounts +  ABankAccount ;
          ALine := ALine + formatfloat('000000000000',ABS(round(CDOpenstaandePostenOutstanding.AsFloat*100)))  +formatfloat('0000000000',StrToInt( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSBankAccountNumber.AsString))) + FormatFloat('0000000000', StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text))) + AFillLine ;
          AList.add(ALine);
          // examlple 0160A=1302 50002
          if CDOpenstaandePostenSBranchCode.AsString <> '@' then
          begin
           ALine := '0110B' + CDOpenstaandePostenSDescription.AsString + AFillLine ;
           AList.add(ALine);
           ALine := '0113B' + CDOpenstaandePostenSPostal2.AsString + AFillLine ;
           AList.add(ALine);
          end;
          ALine := '0160A' + CDOpenstaandePostenSReference.AsString + AFillLine  ;
          AList.add(ALine);
        end;
      CDOpenstaandePosten.Next ;
    end;
  finally
  CDOpenstaandePosten.EnableControls ;
  end;
    ALine10 :=  RightStr(formatfloat('0000000000',ATotalOfAccounts),10) ;

 // Batch close record 9990A00000000000231970036301659350000015
    ALine := '9990A'  + formatfloat('000000000000000000',TotalAmount)  + ALine10 + formatfloat('0000000',NumberOfEntrys) + AFillLine ;
    RepParams := 'TOTALROWS=' + intToStr(NumberOfEntrys) + #13+#10 +
   'TOTALAMOUNT2=' + FormatFloat('0.00',TotalAmount / 100) + #13+#10 +
   'CHECKSUMBANK=' + intToStr(ATotalOfAccounts) + #13+#10 +
   'BATCHNR=' + intToStr(LastBatchRun) ;

   { frVariables.Clear ;
    frVariables.Variable['Totalrows'] := NumberOfEntrys ;
    frVariables.Variable['TotalAmount2'] := FormatFloat('0.00',TotalAmount / 100) ;
    frVariables.Variable['CheckSumBank'] := ATotalOfAccounts ;
    frVariables.Variable['BATCHNR'] := LastBatchRun ;  }

    AList.add(ALine);
  // footer
    ALine := '9999A'  + AFillLine ;
    AList.add(ALine);
  // footer
end;

procedure TfrBatchPayDebtors.CreatePain008(AList: TStringList);
  function CalculateForMessage(AString : String ): String;
   var
    i : Integer ;
    AtempString : String ;
    Aresult : Int64 ;
  begin
    AtempString := copy(AString,8,length(AString)) + copy(AString,1,4);
    for i := 10 to 35 do
      AtempString :=  StringReplace(AtempString,Char(ord('A') + (i-10)), IntToStr(i),[rfReplaceAll] ) ;

   Aresult := StrToInt64(AtempString) mod 97 ;
   // Aresult := StrToInt64(AtempString) - Aresult ;
   Aresult :=  97-Aresult  ;
   result :=   copy(AString,1,2)+ FormatFloat('00',Aresult) + copy(AString,5,length(AString));


  end;
var
 ALine : String ;
 ATotalOfAccounts,TotalAmount,ABankAccount : Int64 ;
 NumberOfEntrys : Integer ;
 Aformat : TFormatSettings ;
 AAccnr,LastLandCode : String ;
begin      // example line
  Aformat.DecimalSeparator := '.' ;
  Aformat.ShortDateFormat := 'yyyy-mm-dd' ;
  Aformat.ShortTimeFormat := 'Thh:nn:ss';
  ATotalOfAccounts := 0 ;
  TotalAmount := 0 ;
  NumberOfEntrys := 0 ;
  ALine := '' ;
  Inc(FLastBatchRun);
  CDOpenstaandePosten.DisableControls ;
  try
  CDOpenstaandePosten.First ;
   while not CDOpenstaandePosten.eof do
    begin
      if CDOpenstaandePostenEXPORT.AsString ='1' then
        begin
          if (StrToIntDef( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSCreditCardNumber.AsString),0) = 0) then
             begin
                 OSFMessageDlg('No IBAN bank account for ' + CDOpenstaandePostenCode.AsString + ' ' + CDOpenstaandePostenSDescription.AsString+#13+#10 + 'Skiping record!',mtError,[mbok],0) ;
                 CDOpenstaandePosten.Next ;
                 Continue ;
             end;

          inc(NumberOfEntrys);
          TotalAmount := TotalAmount + ABS(round(CDOpenstaandePostenOutstanding.AsFloat)) ;
          ABankAccount :=   StrToInt( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSBankAccountNumber.AsString));
          ABankAccount := StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text));
          ALine := ALine + '<DrctDbtTxInf>' ;
          ALine := ALine + '<PmtId>' ;
          ALine := ALine + '<InstrId>'+CDOpenstaandePostenSReference.AsString+'</InstrId>' ;
          ALine := ALine + '<EndToEndId>'+CDOpenstaandePostenSCode.AsString+'</EndToEndId>' ;
        ALine := ALine + '</PmtId>' ;
        ALine := ALine + '<InstdAmt Ccy="EUR">'+FormatFloat('0.00',CDOpenstaandePostenOutstanding.AsFloat,Aformat) + '</InstdAmt>' ;
        ALine := ALine + '<DrctDbtTx>' ;
          ALine := ALine + '<MndtRltdInf>' ;
            ALine := ALine + '<MndtId>'+CDOpenstaandePostenSCreditCardHolder.AsString+'</MndtId>' ;
            ALine := ALine + '<DtOfSgntr>'+DateToStr(CDOpenstaandePostenDEXPIRYDATE.AsDateTime,Aformat)+'</DtOfSgntr>' ;
          ALine := ALine + '</MndtRltdInf>' ;
          ALine := ALine + '<CdtrSchmeId>' ;
            ALine := ALine + '<Id>' ;
              ALine := ALine + '<PrvtId>' ;
                ALine := ALine + '<Othr>' ;

         AAccnr :=  VarToStr(OpenSqlAndGetFirtsColumnValue('SELECT a.COUNTRIES_ISO_CODE_2 FROM COUNTRIES a join debtor  b on '
         + ' a.COUNTRIES_ID = b.WPOSTCOUNTRIES_ID where b.WACCOUNTID = ' + CDOpenstaandePostenWAccountID.AsString)) ;
         if AAccnr = '' then
         AAccnr :=  VarTOStr(OpenSqlAndGetFirtsColumnValue('SELECT a.COUNTRIES_ISO_CODE_2 FROM COUNTRIES a join creditor  b on '
         + ' a.COUNTRIES_ID = b.WPOSTCOUNTRIES_ID where b.WACCOUNTID = ' + CDOpenstaandePostenWAccountID.AsString)) ;
         if AAccnr = '' then
           AAccnr := 'NL' ;
          LastLandCode :=  AAccnr ;

                AAccnr := CDOpenstaandePostenSCOMPANYREGNO.AsString ;
                if length(AAccnr) < 8 then

                    begin
                     AAccnr := RightStr('00000000'+  AAccnr,8) ;
                    end;
                   if length(AAccnr) <= 8 then
                     AAccnr := AAccnr + '0000'  ;
                     AAccnr :=LastLandCode + '00ZZZ'+ AAccnr ;

                  ALine := ALine + '<Id>'+CalculateForMessage(AAccnr)+'</Id>' ;
                 ALine := ALine + '<SchmeNm>' ;
                    ALine := ALine + '<Prtry>SEPA</Prtry>' ;
                  ALine := ALine + '</SchmeNm>' ;
                ALine := ALine + '</Othr>' ;
              ALine := ALine + '</PrvtId>' ;
            ALine := ALine + '</Id>' ;
          ALine := ALine + '</CdtrSchmeId>' ;
        ALine := ALine + '</DrctDbtTx>' ;
       ALine := ALine + ' <DbtrAgt>' ;
         ALine := ALine + ' <FinInstnId>' ;
           ALine := ALine + ' <BIC>'+CDOpenstaandePostenSBankName.AsString+'</BIC>' ;
          ALine := ALine + '</FinInstnId>' ;
        ALine := ALine + '</DbtrAgt>' ;
       ALine := ALine + ' <Dbtr>' ;
         ALine := ALine + ' <Nm>'+CDOpenstaandePostenSDescription.AsString+'</Nm>' ;
         ALine := ALine + ' <PstlAdr>' ;


           ALine := ALine + ' <Ctry>'+LastLandCode+'</Ctry>' ;
           ALine := ALine + ' <AdrLine>'+CDOpenstaandePostenSPostal1.AsString +  '</AdrLine>' ;
          ALine := ALine + '</PstlAdr>' ;
        ALine := ALine + '</Dbtr>' ;
       ALine := ALine + ' <DbtrAcct>' ;
         ALine := ALine + ' <Id>' ;
           AAccnr := CDOpenstaandePostenSCreditCardNumber.AsString ;
                if pos('00ZZZ',AAccnr) = 0 then
                    begin
                     AAccnr := copy(AAccnr,1,2) + '00ZZZ' + Copy(AAccnr,3,Length(AAccnr)) ;
                    end;

           ALine := ALine + ' <IBAN>'+CalculateForMessage(AAccnr)+'</IBAN>';
          ALine := ALine + '</Id>' ;
        ALine := ALine + '</DbtrAcct>' ;
       ALine := ALine + ' <RmtInf>' ;
         ALine := ALine + ' <Ustrd>'+CDOpenstaandePostenSLINEDESC.AsString +  '</Ustrd>' ;
        ALine := ALine + '</RmtInf>' ;
      ALine := ALine + '</DrctDbtTxInf>' ;





        //   ALine := ALine + formatfloat('000000000000',ABS(round(CDOpenstaandePostenOutstanding.AsFloat*100)))  +formatfloat('0000000000',StrToInt( TDataBaseStringRoutines.StripNotInt(CDOpenstaandePostenSBankAccountNumber.AsString))) + FormatFloat('0000000000', StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text))) + AFillLine ;

        end;
      CDOpenstaandePosten.Next ;
    end;
  finally
  CDOpenstaandePosten.EnableControls ;
  end;


 // header
 AList.add('<?xml version="1.0" encoding="utf-8"?>');
 AList.add('<Document xmlns="urn:iso:std:iso:20022:tech:xsd:pain.008.001.02" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');
 AList.add('<CstmrDrctDbtInitn>');
 AList.add('<GrpHdr>');
 AList.add('<MsgId>'+ formatfloat('0000000000',LastBatchRun)+'</MsgId>');
 AList.add('<CreDtTm>'+DateTimeToStr(now,Aformat)+'</CreDtTm>');
 AList.add('<NbOfTxs>'+intToStr(NumberOfEntrys)+'</NbOfTxs>');
 AList.add('<CtrlSum>'+ FormatFloat('0.00',TotalAmount,Aformat)+'</CtrlSum>');
 AList.add('<InitgPty>');
 AList.add('<Nm>Sepadam</Nm>');
 AList.add('</InitgPty>');
 AList.add('</GrpHdr>');
 AList.add('<PmtInf>');
 AList.add('<PmtInfId>'+ FormatDateTime('YYMMDD',Date) + IntToStr(LastBatchRun)+'</PmtInfId>');
 AList.add('<PmtMtd>DD</PmtMtd>');
 AList.add('<BtchBookg>true</BtchBookg>');
 AList.add('<NbOfTxs>'+intToStr(NumberOfEntrys)+'</NbOfTxs>');
 AList.add('<CtrlSum>'+ FormatFloat('0.00',TotalAmount,Aformat)+'</CtrlSum>');
 AList.add('<PmtTpInf>');
 AList.add('<SvcLvl>');
 AList.add('<Cd>SEPA</Cd>');
 AList.add('</SvcLvl>');
 AList.add('<LclInstrm>');
 AList.add('<Cd>CORE</Cd>'); // B2B|CORE
 AList.add('</LclInstrm>');
 AList.add('<SeqTp>FRST</SeqTp>'); //FRST first in series RCUR next io series FNAL final OOFF once
 AList.add('</PmtTpInf>');
 AList.add('<ReqdColltnDt>'+  DateTimeToStr(Date,Aformat)+'</ReqdColltnDt>');
 AList.add('<Cdtr>');
 AList.add('<Nm>Sepadam</Nm>');
 AList.add('<PstlAdr>');
 if DMTCCoreLink.ReadSysVar('SADDRESS3') = ''  then
 AList.add('<Ctry>NL</Ctry>') else
 AList.add('<Ctry>'+ TDataBaseRoutines.GetCountryISO2(TDataBaseRoutines.GetAddCountryId(DMTCCoreLink.ReadSysVar('SADDRESS3')) ) +'NL</Ctry>');
 AList.add('<AdrLine>'+DMTCCoreLink.ReadSysVar('SADDRESS1')+'</AdrLine>');
 AList.add('<AdrLine>'+DMTCCoreLink.ReadSysVar('SPOSTCODE')+' '+DMTCCoreLink.ReadSysVar('SADDRESS2')+'</AdrLine>');
 AList.add('</PstlAdr>');
 AList.add('</Cdtr>');
 AList.add('<CdtrAcct>');
 AList.add('<Id>');
 AList.add('<IBAN>'+ CalculateForMessage(EPaymentBankAccount.Text)+'</IBAN> ');
 AList.add('</Id>');
 AList.add('</CdtrAcct>');
 AList.add('<CdtrAgt>');
 AList.add('<FinInstnId>');
 AList.add('<BIC>'+DMTCCoreLink.ReadSysVar('SBANKBIC1')+'</BIC>');
 AList.add('</FinInstnId>');
 AList.add('</CdtrAgt>');
 AList.add('<ChrgBr>SLEV</ChrgBr>');
 AList.add(ALine);
 AList.add('</PmtInf>');
 AList.add('</CstmrDrctDbtInitn>' +
           '</Document>');
end;
procedure TfrBatchPayDebtors.FillDebtorsOpenItem;
var
 i : Integer ;
 AList : TStringList ;
 AProgress : TfmNewProgress ;

begin
AList := TStringList.Create ;
QSelectOpenDebtorItems.close ;
QSelectQuotes.close ;
QSelectOpenDebtorItemsCODE.Size := MainAccountLength + 3 ;
QSelectQuotesCODE.Size := MainAccountLength + 3 ;

QSelectOpenDebtorItems.Params[0].AsDateTime := DateTimePicker1.Date ;
QSelectOpenDebtorItems.Params[1].AsDateTime := DateTimePicker2.Date ;
QSelectOpenDebtorItems.Params[2].AsDateTime := DateTimePicker1.Date ;
QSelectOpenDebtorItems.Params[3].AsDateTime := DateTimePicker2.Date ;

QSelectOpenDebtorItems.open ;

try
for i := 0 to CDOpenstaandePosten.FieldCount - 1 do
  begin
     CDOpenstaandePosten.Fields[i].ReadOnly := false ;
  end;

 AProgress := TfmNewProgress.create(nil) ;
  try
QSelectOpenDebtorItems.open ;
 CDOpenstaandePosten.EmptyDataSet ;
 CDOpenstaandePosten.close ;
 CDOpenstaandePosten.IndexDefs.Clear ;
 CDOpenstaandePosten.IndexName := '' ;

 CDOpenstaandePosten.FieldDefs.Find('Code').Size := QSelectOpenDebtorItemsCODE.Size+1 ;
 CDOpenstaandePosten.FieldDefs.Find('SReference').Size := QSelectOpenDebtorItemsSReference.Size ;
 CDOpenstaandePosten.FieldDefs.Find('SBankAccountNumber').Size := QSelectOpenDebtorItemsSBankAccountNumber.Size ;

 CDOpenstaandePostenCode.Size := QSelectOpenDebtorItemsCODE.Size +2;
 CDOpenstaandePostenSReference.Size := QSelectOpenDebtorItemsSReference.Size ;
 CDOpenstaandePostenSBankAccountNumber.Size := QSelectOpenDebtorItemsSBankAccountNumber.Size ;


 CDOpenstaandePosten.CreateDataSet ;
 CDOpenstaandePosten.Open ;

 CDOpenstaandePosten.ControlsDisabled ;
 try
 AProgress.initProgress('Loading openitems',QSelectOpenDebtorItems.RecordCount);
 while not QSelectOpenDebtorItems.eof do
  begin
     AProgress.SetProgress('',QSelectOpenDebtorItems.RecNo);
     if cbExportType.ItemIndex = 1 then
      if QSelectOpenDebtorItemsOUTSTANDING.AsFloat < 0 then
       begin
          QSelectOpenDebtorItems.next ;
          Continue ;
       end;

     CDOpenstaandePosten.Insert ;
        for i := 0 to QSelectOpenDebtorItems.FieldCount - 1 do
          begin
            if QSelectOpenDebtorItems.Fields[i].FieldName ='CODE' then
                CDOpenstaandePostenCode.AsString := TDataBaseRoutines.AccTypeToChar(QSelectOpenDebtorItemsWACCOUNTTYPEID.AsInteger) + QSelectOpenDebtorItems.Fields[i].Value
              else
           if CDOpenstaandePosten.FindField(QSelectOpenDebtorItems.Fields[i].FieldName) <> nil then
            CDOpenstaandePosten.FindField(QSelectOpenDebtorItems.Fields[i].FieldName).Value := QSelectOpenDebtorItems.Fields[i].Value ;
          end;

     if AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup1ID.AsInteger)) = -1 then
       begin
          QGoups.Params[0].AsInteger := QSelectOpenDebtorItemsWReportingGroup1ID.AsInteger ;
          QGoups.open ;
          AList.AddObject(QGoupsSDescription.AsString,TObject(QGoupsWGroupID.AsInteger)) ;
          QGoups.close;
       end;
     if AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup2ID.AsInteger)) = -1 then
       begin
          QGoups.Params[0].AsInteger := QSelectOpenDebtorItemsWReportingGroup2ID.AsInteger ;
          QGoups.open ;
          AList.AddObject(QGoupsSDescription.AsString,TObject(QGoupsWGroupID.AsInteger)) ;
          QGoups.close;
       end;
    if AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup1ID.AsInteger)) <> -1 then
         CDOpenstaandePostenReportingGroup1.AsString := AList[AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup1ID.AsInteger))] ;
    if AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup2ID.AsInteger)) <> -1 then
         CDOpenstaandePostenReportingGroup2.AsString := AList[AList.IndexOfObject(TObject(QSelectOpenDebtorItemsWReportingGroup2ID.AsInteger))] ;
     if  QSelectOpenDebtorItemsWDueDays.AsInteger = -1 then
         CDOpenstaandePostenEXPORT.AsInteger := 1 else
         CDOpenstaandePostenEXPORT.AsInteger := 0 ;

     CDOpenstaandePostenType.AsString := DMTCCoreLink.GetTextLangNoAmp(1885);
     CDOpenstaandePosten.post ;
     QSelectOpenDebtorItems.Next ;
  end;
if cbIncQuotes.Checked then
begin
QSelectQuotes.close ;
QSelectQuotes.Params[0].AsDateTime := DateTimePicker1.Date ;
QSelectQuotes.Params[1].AsDateTime := DateTimePicker2.Date ;
QSelectQuotes.open ;

 while not QSelectQuotes.eof do
  begin
     CDOpenstaandePosten.Insert ;
        for i := 0 to QSelectQuotes.FieldCount - 1 do
          begin
           if QSelectQuotes.Fields[i].FieldName ='CODE' then
                CDOpenstaandePostenCode.AsString := TDataBaseRoutines.AccTypeToChar(QSelectQuotesWACCOUNTTYPEID.AsInteger) + QSelectQuotes.Fields[i].Value
                else
           if CDOpenstaandePosten.FindField(QSelectQuotes.Fields[i].FieldName) <> nil then
            CDOpenstaandePosten.FindField(QSelectQuotes.Fields[i].FieldName).Value := QSelectQuotes.Fields[i].Value ;
          end;

     if AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup1ID.AsInteger)) = -1 then
       begin
          QGoups.Params[0].AsInteger := QSelectQuotesWReportingGroup1ID.AsInteger ;
          QGoups.open ;
          AList.AddObject(QGoupsSDescription.AsString,TObject(QGoupsWGroupID.AsInteger)) ;
          QGoups.close;
       end;
     if AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup2ID.AsInteger)) = -1 then
       begin
          QGoups.Params[0].AsInteger := QSelectQuotesWReportingGroup2ID.AsInteger ;
          QGoups.open ;
          AList.AddObject(QGoupsSDescription.AsString,TObject(QGoupsWGroupID.AsInteger)) ;
          QGoups.close;
       end;
    if AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup1ID.AsInteger)) <> -1 then
         CDOpenstaandePostenReportingGroup1.AsString := AList[AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup1ID.AsInteger))] ;
    if AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup2ID.AsInteger)) <> -1 then
         CDOpenstaandePostenReportingGroup2.AsString := AList[AList.IndexOfObject(TObject(QSelectQuotesWReportingGroup2ID.AsInteger))] ;
     if  QSelectQuotesWDueDays.AsInteger = -1 then
         CDOpenstaandePostenEXPORT.AsInteger := 1 else
         CDOpenstaandePostenEXPORT.AsInteger := 0;

     CDOpenstaandePostenType.AsString := GetTypeDesc(QSelectQuotesWTYPEID.AsInteger) ;

     CDOpenstaandePosten.post ;
     QSelectQuotes.Next ;
  end;
   QSelectQuotes.close ;
 end;
 finally
      CDOpenstaandePosten.EnableControls
 end;
finally
   AProgress.free ;
end;
QSelectOpenDebtorItems.Close  ;
for i := 0 to CDOpenstaandePosten.FieldCount - 1 do
 if (CDOpenstaandePosten.Fields[i] <> CDOpenstaandePostenEXPORT) and
    (CDOpenstaandePosten.Fields[i] <> CDOpenstaandePostenOutstanding) then
  begin
     CDOpenstaandePosten.Fields[i].ReadOnly := true ;
  end;
  finally
     AList.free ;
  end;
end;

procedure TfrBatchPayDebtors.BRefreshClick(Sender: TObject);
begin
 SearchClick(self);

end;

procedure TfrBatchPayDebtors.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnPrint.Glyph,'Printer');

   Label3.Caption := GetTextLang(329) + ' 1' ;
   Label4.Caption := GetTextLang(329) + ' 2' ;
   Label5.Caption := GetTextLang(329) + ' 3' ;
   CBUseInvoiceRef.Caption := GetTextLang(2171);

  BRefresh.Caption :=  GetTextLang(3056);

 QSelectOpenDebtorItemsCode.Size := MainAccountLength + 2 ;
   SearchClick(self) ;
   Self.Caption := GetTextLang(2896);
   LContraAccount.Caption := GetTextLang(1868);
   Label1.Caption := GetTextLang(282);
   Label2.Caption := GetTextLang(208);
   LBankAccount.Caption :=  GetTextLang(176);
   LPaymentDate.Caption :=  GetTextLang(2213);
   BitBtn2.Caption :=  GetTextLang(358);
   BitBtn2.Caption :=  GetTextLang(358);


   cxGrid1DBBandedTableView1EXPORT.Caption := StringReplace( GetTextLang(2013),'&','',[]);
   cxGrid1DBBandedTableView1Code.Caption := GetTextLang(605) ;
   cxGrid1DBBandedTableView1SDescription.Caption := GetTextLang(31) ;
   cxGrid1DBBandedTableView1Type.Caption := GetTextLang(1079) ;
   cxGrid1DBBandedTableView1SReference.Caption := GetTextLang(1719) ;
   cxGrid1DBBandedTableView1TotalAmount.Caption := GetTextLang(935) ;
   cxGrid1DBBandedTableView1Outstanding.Caption := GetTextLang(947) ;
   cxGrid1DBBandedTableView1DDuedate.Caption := GetTextLang(2213) ;
   cxGrid1DBBandedTableView1WDueDays.Caption := GetTextLang(2221) ;
   cxGrid1DBBandedTableView1DLastActivity.Caption := GetTextLang(229) ;
   cxGrid1DBBandedTableView1FChargeAmount.Caption := GetTextLang(193) ;
   cxGrid1DBBandedTableView1FCREDITLimit.Caption := GetTextLang(192) ;
   cxGrid1DBBandedTableView1FDiscount.Caption := GetTextLang(1141) ;
   cxGrid1DBBandedTableView1FInterest.Caption := GetTextLang(1328) ;
   cxGrid1DBBandedTableView1ReportingGroup1.Caption := GetTextLang(179) ;
   cxGrid1DBBandedTableView1ReportingGroup2.Caption := GetTextLang(180) ;
   cxGrid1DBBandedTableView1SBankAccountNumber.Caption := GetTextLang(2211) ;
   cxGrid1DBBandedTableView1SBranchCode.Caption := GetTextLang(2210) ;
   cxGrid1DBBandedTableView1SPostal1.Caption := GetTextLang(2220) ;
  // wwDBGrid1.Columns[19].Caption := GetTextLang(2220) ;
   cxGrid1DBBandedTableView1SPostal2.Caption := GetTextLang(2206) ;
   cxGrid1DBBandedTableView1SPostal3.Caption := GetTextLang(2207) ;
   cxGrid1DBBandedTableView1SPostalCode.Caption := GetTextLang(190) ;
   cxGrid1DBBandedTableView1STelephone1.Caption := GetTextLang(974) ;
   Uncheckall1.Caption :=  GetTextLang(2223) ;
   Uncheckselected1.Caption :=  GetTextLang(2224) ;
   Checkselected1.Caption :=  GetTextLang(2225) ;
   BitBtn1.Caption :=  GetTextLang(168) ;
   BtnPrint.Caption :=  GetTextLang(2398) ;
   cbExportType.items[1] := GetTextLang(2214) ;
   BRefresh.Caption :=  GetTextLang(3056) ; 
end;

procedure TfrBatchPayDebtors.FormCreate(Sender: TObject);
   var
    AStream : TFileStream ;
begin
  DMTCCoreLink.AssignConnectionToChilds(self);



  AsearchPanel := TSearchPanel.Create(self);
  AsearchPanel.Parent := PFilter ;
  AsearchPanel.Align := alClient ;
  AsearchPanel.DefSql :=  QSelectOpenDebtorItems.sql.text ;
  if FileExists(DMTCCoreLink.GetLocalPluginDir + 'debincsearch.dfm') then
    begin
    AStream := TFileStream.Create(DMTCCoreLink.GetLocalPluginDir + 'debincsearch.dfm',fmShareDenyNone) ;
       try
          AStream.ReadComponent(AsearchPanel);
       finally
          AStream.free ;
       end;
    end else
    begin
   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 0 ;
      WColumnTranslation :=  185 ;
      SColumnOrigen := 'Account.SDescription' ;
      SControlType := 'S' ;
      WControlX := 10 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;
   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      WControlX := 115 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
      Wosf_search_fields_id := 1 ;
      SColumnOrigen := 'Messages.Sdescription || coalesce(messages.SEXTRADESCRIPTION,'+ QuotedStr('')+') ' ;
      WColumnTranslation :=  1708 ;
      SControlType := 'S' ;

    end;
   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 2 ;
      SColumnOrigen := 'transact.DPAYMENTDATE' ;
      WColumnTranslation := 2213 ;
      SControlType := 'D' ;
      WControlX := 230 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;

   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 1 ;
      SColumnOrigen := 'transact.SReference' ;
      WColumnTranslation :=  1719 ;
      SControlType := 'S' ;
      WControlX := 10 ;
      WControlY := 50 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;

    end;
 AsearchPanel.BuildGui ;
 AsearchPanel.onSearch := SearchClick;

 
  
  DTPaymentDate.Date := date  ;
  DateTimePicker1.Date := date - 30 ;
  DateTimePicker2.Date := date  ;
  LastBatchRun :=  ReadNwReportOp('BPDLastBatch',0).AsInteger;
  DateTimePicker1.Date := Str2Date(ReadNwReportOp('BPDStartDate',FormatDateTime('dd-mm-yyyy',date)).asstring) ;
  DateTimePicker2.Date := Str2Date(ReadNwReportOp('BPDEndDate',FormatDateTime('dd-mm-yyyy',date)).asstring) ;
  EPaymentBankAccount.Text := ReadNwReportOp('BPDPayAccount','').AsString ;
  if EPaymentBankAccount.Text = '' then
    EPaymentBankAccount.Text := DMTCCoreLink.ReadSysVar('SBANKIBAN1');
  if cbExportType.ItemIndex = 2 then
  if EPaymentBankAccount.Text <> '' then
  if pos('00ZZZ',EPaymentBankAccount.Text) = 0 then
    begin
      EPaymentBankAccount.Text := copy(EPaymentBankAccount.Text,1,2) + '00ZZZ' + Copy(EPaymentBankAccount.Text,3,Length(EPaymentBankAccount.Text)) ;
    end;

  cbExportType.ItemIndex := ReadNwReportOp('BPDExpType',0).AsInteger ;
  cbExportType.Tag := cbExportType.ItemIndex ;
  CBUseInvoiceRef.Checked := ReadNwReportOp('BPDUseInvoiceRef',True).AsBoolean ;
  EContraAccount.Tag :=   ReadNwReportOp('BPDContraAccount',0).AsInteger ;
  EContraAccount.Text := AddDashInAccCodeNoPRefix(GetAccountCode(EContraAccount.Tag)) ;

  EMessage1.Text :=   ReadNwReportOp('BPDMessage1',dmDatabase.SetOfBooksPropertys.CompanyInfo.CompanyName).AsString ;
  EMessage2.Text :=   ReadNwReportOp('BPDMessage2','').AsString ;
  EMessage3.Text :=   ReadNwReportOp('BPDMessage3','').AsString ;

end;

procedure TfrBatchPayDebtors.FormDestroy(Sender: TObject);
begin
  WriteNwReportOp('BPDLastBatch',IntToStr(LastBatchRun));
  WriteNwReportOp('BPDStartDate',FormatDateTime('dd-mm-yyyy',DateTimePicker1.Date))  ;
  WriteNwReportOp('BPDEndDate',FormatDateTime('dd-mm-yyyy',DateTimePicker2.Date)) ;
  WriteNwReportOp('BPDPayAccount',EPaymentBankAccount.Text)  ;
  WriteNwReportOp('BPDExpType',IntToStr( cbExportType.Tag ));
  WriteNwReportOp('BPDUseInvoiceRef',BoolToStr(CBUseInvoiceRef.Checked,true)) ;
  WriteNwReportOp('BPDContraAccount',IntToStr(EContraAccount.Tag));
  WriteNwReportOp('BPDMessage1',EMessage1.Text)  ;
  WriteNwReportOp('BPDMessage2',EMessage2.Text)  ;
  WriteNwReportOp('BPDMessage3',EMessage3.Text)  ;
end;

procedure TfrBatchPayDebtors.SetLastBatchRun(const Value: Integer);
begin
  FLastBatchRun := Value;
end;

procedure TfrBatchPayDebtors.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  SortClientDataSet(CDOpenstaandePosten,AFieldName,BDesc);
  BDesc := not BDesc ;
end;

function TfrBatchPayDebtors.SortClientDataSet(ClientDataSet: TClientDataSet;
  FieldName: String;Var AscIdx:Boolean): Boolean;
var
  NewIndexName: String;
  IndexOptions: TIndexOptions;
  Field: TField;
begin
  Result := False;
  FieldName:=LowerCase(FieldName);
  Field := ClientDataSet.Fields.FindField(FieldName);
  //If invalid field name, exit.
  if Field = nil then Exit;
  //if invalid field type, exit.
  if (Field is TObjectField) or (Field is TBlobField) or
    (Field is TAggregateField) or (Field is TVariantField)
     or (Field is TBinaryField) then Exit;
  //Get IndexDefs and IndexName using RTTI
  //Ensure IndexDefs is up-to-date
  ClientDataSet.IndexDefs.Update;
  // done : Pieter Using update
  ClientDataSet.IndexDefs.BeginUpdate;
  try
  //If an ascending index is already in use,
  //switch to a descending index
  if ClientDataSet.IndexName = FieldName + '__IdxA'
  then
    begin
      NewIndexName := FieldName + '__IdxD';
      IndexOptions := [ixDescending];
    end
  else
    begin
      NewIndexName := FieldName + '__IdxA';
      IndexOptions := [];
    end;
  //Look for existing index
  // done : pieter One liner.
  Result := ClientDataSet.IndexDefs.IndexOf(NewIndexName) <> -1 ;
  {for i := 0 to Pred(ClientDataSet.IndexDefs.Count) do
  begin
    if ClientDataSet.IndexDefs[i].Name = NewIndexName then
      begin
        Result := True;
        Break
      end;  //if
  end; // for }
  //If existing index not found, create one
  AscIdx:=Pos('__IdxA',NewIndexName)<>0;
  if not Result then
      begin
        ClientDataSet.AddIndex(NewIndexName,
          FieldName, IndexOptions);
        Result := True;
      end; // if not
  finally
     ClientDataSet.IndexDefs.EndUpdate;
  end;
  //Set the index
  ClientDataSet.IndexName := NewIndexName;
end;

procedure TfrBatchPayDebtors.Uncheckall1Click(Sender: TObject);
begin
 CDOpenstaandePosten.First ;
 while not CDOpenstaandePosten.Eof do
   begin
      CDOpenstaandePosten.edit ;
      CDOpenstaandePostenEXPORT.AsInteger := 0 ;
      CDOpenstaandePosten.Post ;

      CDOpenstaandePosten.Next ;
   end;
end;

procedure TfrBatchPayDebtors.Uncheckselected1Click(Sender: TObject);
 var
   i : Integer ;
begin
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
   begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
      CDOpenstaandePosten.edit ;
      CDOpenstaandePostenEXPORT.AsInteger := 0 ;
      CDOpenstaandePosten.Post ;
   end;

end;

procedure TfrBatchPayDebtors.Checkselected1Click(Sender: TObject);
 var
   i : Integer ;
begin
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
   begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
      CDOpenstaandePosten.edit ;
      CDOpenstaandePostenEXPORT.AsInteger := 1 ;
      CDOpenstaandePosten.Post ;

  end;

end;

procedure TfrBatchPayDebtors.BExporteerClick(Sender: TObject);
Var
   AList : TStringList ;
begin


 if EPaymentBankAccount.Text = '' then
   begin
     EPaymentBankAccount.SetFocus ;
     raise Exception.Create(DMTCCoreLink.GetTextLang(3071){'You need to enter a bank account number!'});
   end;
 SaveDialog1.FileName := 'clieop' +  formatDatetime('yymmdd',date) +'.dat';
 if not SaveDialog1.Execute then exit ;


      AList := TStringList.Create ;
      try
        CreateClieop(AList);
        if AList.Count > 0 then
          begin
          AList.SaveToFile(SaveDialog1.FileName);
          CDOpenstaandePosten.Filter := 'Export = true'  ;
          CDOpenstaandePosten.Filtered := true ;
        {  frReport1.FindObject('ReportSummary1').Visible := true ;
          frReport1.PrepareReport ;
          frReport1.ShowPreparedReport ; }
          CDOpenstaandePosten.Filtered := false ;
          end;
      finally
         AList.free ;
      end;   
  modalresult := mrok ;
end;



procedure TfrBatchPayDebtors.BitBtn4Click(Sender: TObject);
var
 id : Integer ;
begin
  id := EContraAccount.Tag ;

  fmlookup.SelectLookup(Sender,GetTextLang(1002),'ALL','ACCOUNT', id);
  EContraAccount.text := ReturnLookup ;
  EContraAccount.tag := ReturnId ;
  DTPaymentDate.SetFocus ;
  dmDatabase.tblAccount.close ;
end;

procedure TfrBatchPayDebtors.BitBtn2Click(Sender: TObject);
Var
   AList : TStringList ;
begin

if cbExportType.ItemIndex = 1 then
 begin
 if EPaymentBankAccount.Text = '' then
   begin
     EPaymentBankAccount.SetFocus ;
     raise Exception.Create(DMTCCoreLink.GetTextLang(3071){'U heeft geen bankrekening nummer ingevult.'});
   end;
 SaveDialog1.FileName := 'clieop_' +  formatfloat('000',FLastBatchRun+1) ;
 if not SaveDialog1.Execute then exit ;


      AList := TStringList.Create ;
      try
        QSelectOpenDebtorItems.Filter := 'EXPORT = 1' ;
        QSelectOpenDebtorItems.Filtered := true ;
        try
        CreateClieop(AList);
        finally
        QSelectOpenDebtorItems.Filter := '' ;
        QSelectOpenDebtorItems.Filtered := False ;
        end;
        if AList.Count > 0 then
          begin
          AList.SaveToFile(SaveDialog1.FileName);
          CDOpenstaandePosten.Filter := 'Export = 1'  ;
          CDOpenstaandePosten.Filtered := true ;
          try

          TDatabaseTableRoutines.DumpToReportmanTransport(CDOpenstaandePosten);
          CheckReportMan(0,0,1,0,RepParams,'paydebtor','GENERAL') ;
          finally
          CDOpenstaandePosten.Filtered := false ;
          end;
          end;
      finally
         AList.free ;
      end;
   end   else
   if cbExportType.ItemIndex = 2 then
 begin
 if not DMTCCoreLink.IsRegistered('{E5CCD96E-3B37-46DC-A429-BD3101CBC135}') then
   raise Exception.Create('Export type pain is a registered plugin please buy the plugin.');
 if EPaymentBankAccount.Text = '' then
   begin
     EPaymentBankAccount.SetFocus ;
     raise Exception.Create(DMTCCoreLink.GetTextLang(3071){'U heeft geen bankrekening nummer ingevult.'});
   end;
 SaveDialog1.FileName := 'pain_' +  formatfloat('000',FLastBatchRun+1) + '.xml' ;
 if not SaveDialog1.Execute then exit ;


      AList := TStringList.Create ;
      try
        QSelectOpenDebtorItems.Filter := 'EXPORT = 1' ;
        QSelectOpenDebtorItems.Filtered := true ;
        try
        CreatePain008(AList);
        finally
        QSelectOpenDebtorItems.Filter := '' ;
        QSelectOpenDebtorItems.Filtered := False ;
        end;
        if AList.Count > 0 then
          begin
          AList.SaveToFile(SaveDialog1.FileName);
          CDOpenstaandePosten.Filter := 'EXPORT = 1'  ;
          CDOpenstaandePosten.Filtered := true ;
          try

          TDatabaseTableRoutines.DumpToReportmanTransport(CDOpenstaandePosten);
          CheckReportMan(0,0,1,0,RepParams,'paydebtor','GENERAL') ;
          finally
          CDOpenstaandePosten.Filtered := false ;
          end;
          end;
      finally
         AList.free ;
      end;
   end;

  modalresult := mrok ;
end;


procedure TfrBatchPayDebtors.BtnPrintClick(Sender: TObject);
begin
CDOpenstaandePosten.Filter := 'Export = 1'  ;
CDOpenstaandePosten.Filtered := true ;
try

TDatabaseTableRoutines.DumpToReportmanTransport(CDOpenstaandePosten);
CheckReportMan(0,0,1,0,'','paydebtor','GENERAL') ;
finally
 CDOpenstaandePosten.Filtered := false ;
end;

// showmessage('Not implemented');
{
    CDOpenstaandePosten.Filter := 'Export = 1'  ;
    CDOpenstaandePosten.Filtered := true ;
    frReport1.FindObject('ReportSummary1').Visible := true ;
    frReport1.PrepareReport ;
    frReport1.ShowPreparedReport ;
    CDOpenstaandePosten.Filtered := false ;}
end;

procedure TfrBatchPayDebtors.DBCheckBox1Click(Sender: TObject);
begin
 if CDOpenstaandePosten.State = dsedit then
    CDOpenstaandePosten.Post ;
end;

procedure TfrBatchPayDebtors.EPaymentBankAccountExit(Sender: TObject);
begin
if cbExportType.ItemIndex = 2 then

if pos('00ZZZ',EPaymentBankAccount.Text) = 0 then
    begin
      EPaymentBankAccount.Text := copy(EPaymentBankAccount.Text,1,2) + '00ZZZ' + Copy(EPaymentBankAccount.Text,3,Length(EPaymentBankAccount.Text)) ;

    end;
end;

procedure TfrBatchPayDebtors.ickall1Click(Sender: TObject);
begin
 CDOpenstaandePosten.DisableControls ;
 try
 CDOpenstaandePosten.First ;
 while not CDOpenstaandePosten.Eof do
   begin
      CDOpenstaandePosten.edit ;
      CDOpenstaandePostenEXPORT.AsInteger := 1 ;
      CDOpenstaandePosten.Post ;
      CDOpenstaandePosten.Next ;
   end;
  finally
     CDOpenstaandePosten.EnableControls ;
  end;
end;

procedure TfrBatchPayDebtors.QSelectOpenDebtorItemsBeforeOpen(
  DataSet: TDataSet);
begin
 if QSelectOpenDebtorItems.Tag = 0 then
     begin
       QSelectOpenDebtorItemsCODE.Size := DMTCCoreLink.MainAccountLength +3 ;
       QSelectOpenDebtorItemsSREFERENCE.Size := GetFieldLength('TRANSACT','SREFERENCE');
       QSelectOpenDebtorItemsSREFERENCE_1.Size := GetFieldLength('DOCHEAD','SREFERENCE');
       QSelectOpenDebtorItemsSBankAccountNumber.Size := GetFieldLength('debtor','SBankAccountNumber');
       QSelectOpenDebtorItems.tag := 1 ;
     end;
end;

procedure TfrBatchPayDebtors.QSelectQuotesBeforeOpen(DataSet: TDataSet);
begin
 if QSelectQuotes.Tag = 0 then
     begin
       QSelectQuotesCODE.Size := DMTCCoreLink.MainAccountLength +3 ;
       QSelectQuotesSREFERENCE.Size := GetFieldLength('DOCHEAD','SREFERENCE');
       QSelectQuotesSBankAccountNumber.Size := GetFieldLength('debtor','SBankAccountNumber');
       QSelectQuotes.tag := 1 ;
     end;
end;

procedure TfrBatchPayDebtors.CBCreateClieopClick(Sender: TObject);
begin
  BRefreshClick(self);
end;


procedure TfrBatchPayDebtors.cbExportTypeChange(Sender: TObject);
begin
  cbExportType.Tag := cbExportType.ItemIndex ;
end;

procedure TfrBatchPayDebtors.SearchClick(Sender: TObject);
var
 Creteria : String ;
begin
  Creteria := AsearchPanel.GetClause ;
  if Creteria <> '' then Creteria := ' and ' + Creteria ;  
  QSelectOpenDebtorItems.SQL.Text := StringReplace(AsearchPanel.DefSql,'<@SQL@>',Creteria,[rfReplaceAll]) ;

  FillDebtorsOpenItem ;
end;


end.
