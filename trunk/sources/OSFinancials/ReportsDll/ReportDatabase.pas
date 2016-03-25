(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReportDatabase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, VCLUnZip, DBClient, ZSqlUpdate, DBAccess , Uni,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, USqlList,TCVariables,StdCtrls,TCashClasses,
  ZSqlMonitor, ZSequence, ZSqlProcessor;

type

  TdmDatabase = class(TDataModule)
    dsAbreviations: TDataSource;
    tblAbreviations: TuniTable;
    dSACCOUNT: TDataSource;
    tblAccount: TuniTable;
    dsBackOrder: TDataSource;
    tblBackOrder: TuniTable;
    dsBatchTypes: TDataSource;
    tblBatchTypes: TuniTable;
    dsBatchControl: TDataSource;
    tblBatchControl: TuniTable;
    dsCreditor: TDataSource;
    tblCreditor: TuniTable;
    dsCurrency: TDataSource;
    tblCurrency: TuniTable;
    dsDebtor: TDataSource;
    tblDebtor: TuniTable;
    dsGroups: TDataSource;
    tblGroups: TuniTable;
    dsPeriods: TDataSource;
    tblPeriods: TuniTable;
    dsRepeatingDocs: TDataSource;
    tblRepeatingDocs: TuniTable;
    dsStock: TDataSource;
    tblStock: TuniTable;
    dsStockPublishing: TDataSource;
    tblStockPublishing: TuniTable;
    dsStockTrans: TDataSource;
    tblStockTrans: TuniTable;
    dsSysVars: TDataSource;
    tblSysVars: TuniTable;
    dsUnit: TDataSource;
    tblUnit: TuniTable;
    dsUser: TDataSource;
    tblUser: TuniTable;
    dsRepeatingBatch: TDataSource;
    tblRepeatingBatch: TuniTable;
    dsLabSpecs: TDataSource;
    tblLabSpecs: TuniTable;
    dsTotals: TDataSource;
    tblTotals: TuniTable;
    dsGlobal: TDataSource;
    dsBatch: TDataSource;
    tblBatch: TuniTable;
    dsBatchRefTotals: TDataSource;
    tblBatchRefTotals: TuniTable;
    dsSelectUser: TDataSource;
    tblSelectUser: TuniTable;
    dsReportingOptions: TDataSource;
    tblReportingOptions: TuniTable;
    dsDocHeader: TDataSource;
    dsDocLine: TDataSource;
    tblDocLine: TuniTable;
    dsTransaction: TDataSource;
    tblTransaction: TuniTable;
    dsMessage: TDataSource;
    qryDebtAge: TuniQuery;
    qryTransactionReport: TuniQuery;
    wwqryOpenDebits: TuniQuery;
    wwdsOpenDebits: TDataSource;
    wwqryOpenCredits: TuniQuery;
    wwdsOpenCredits: TDataSource;
    qrySalesByCustomer: TuniQuery;
    qrySalesByProduct: TuniQuery;
    qrySalesBySalesperson: TuniQuery;
    qryInvDetail: TuniQuery;
    qryReconReport: TuniQuery;
    qrySalesByGroup: TuniQuery;
    qryDebtStatement: TuniQuery;
    qryStockMovement: TuniQuery;
    dsRepHead: TDataSource;
    tblRepHead: TuniTable;
    dsRepLine: TDataSource;
    tblRepLine: TuniTable;
    dsRepCols: TDataSource;
    tblRepCols: TuniTable;
    dsType: TDataSource;
    tblType: TuniQuery;
    qryProductByCustomer: TuniQuery;
    qryCustomerBySalesperson: TuniQuery;
    qGenMast: TuniQuery;
    dsGenMast: TDataSource;
    qGenDet: TuniQuery;
    dsGenDet: TDataSource;
    qGen: TuniQuery;
    qGenII: TuniQuery;
    Temp_1: TuniTable;
    qrySalesPersonByCustomer: TuniQuery;
    qrySalespersonByProduct: TuniQuery;
    qBatPeriodTotals: TuniQuery;
    DsBatPeriodTotals: TDataSource;
    qryProductBySalesperson: TuniQuery;
    qryCustomerByProduct: TuniQuery;
    qryCreditAge: TuniQuery;
    DsRecon: TDataSource;
    dsDocHead: TDataSource;
    tblTax: TuniTable;
    dSTAX: TDataSource;
    dsBank: TDataSource;
    tblBank: TuniTable;
    qryDocHead: TuniQuery;
    tblRepCells: TuniTable;
    dsRepCells: TDataSource;
    tblDocHeader: TuniTable;
    qrPrnDocLines: TuniQuery;
    qrBalSheetAccount: TuniQuery;
    dsOItemsLinks: TDataSource;
    tblOpReport: TuniQuery;
    dsOpReport: TDataSource;
    tblTmpAgeAnal: TuniTable;
    qryUpdateBatch: TuniQuery;
    dsUpdateBatch: TDataSource;
    tblStockAd: TuniTable;
    daStockAd: TDataSource;
    tblOILinks: TuniTable;
    tblCashFlow: TuniTable;
    tblMessage: TuniTable;
    tblSysParams: TuniQuery;
    tblBOMHead: TuniTable;
    tblBOMLines: TuniTable;
    tblProfiles: TuniTable;
    tblEmpMas: TuniTable;
    tblEmpSource: TuniTable;
    tblPayCon: TuniTable;
    tblPayTransact: TuniTable;
    tblBankDnl: TuniTable;
    tblLocations: TuniTable;
    tblAssetMas: TuniTable;
    qryGroups: TuniQuery;
    DtUpdate: TUniUpdateSql;
    CtUpdate: TUniUpdateSql;
    tblJobProject: TuniTable;
    qryBatchTypesList: TuniQuery;
    CdsBankDnl: TClientDataSet;
    QryPosSalesReport: TuniQuery;
    Unzipper: TVCLUnZip;
    QryAccountList: TuniQuery;
    QBOM: TuniQuery;
    USQLBom: TUniUpdateSql;
    SQLCreateTables: TUniUpdateSql;
    QTasks: TuniQuery;
    USQLTasks: TUniUpdateSql;
    USQLContacts: TUniUpdateSql;
    QContacts: TuniQuery;
    QEvents: TuniQuery;
    USQLEvents: TUniUpdateSql;
    USQLResource: TUniUpdateSql;
    QResources: TuniQuery;
    TblContacts: TuniTable;
    TblEvents: TuniTable;
    TblTasks: TuniTable;
    TblResources: TuniTable;
    USQLadressPerAccount: TUniUpdateSql;
    QadressPerAccount: TuniQuery;
    QTaskAction: TuniQuery;
    USQLTaskAction: TUniUpdateSql;
    ZMainconnection: TUniconnection;
    tblTransactionWTRANSACTIONID: TIntegerField;
    tblTransactionWBATCHID: TIntegerField;
    tblTransactionWBATCHTYPEID: TIntegerField;
    tblTransactionWLINEID: TIntegerField;
    tblTransactionBCARRIEDFORWARD: TSmallintField;
    tblTransactionBLASTYEAR: TSmallintField;
    tblTransactionBLINKSUSED: TSmallintField;
    tblTransactionBMULTIPLEITEMS: TSmallintField;
    tblTransactionWACCOUNTID: TIntegerField;
    tblTransactionDDATE: TDateTimeField;
    tblTransactionWPERIODID: TIntegerField;
    tblTransactionSREFERENCE: TStringField;
    tblTransactionFTAXRATE: TFloatField;
    tblTransactionWTAXACCOUNTID: TIntegerField;
    tblTransactionFAMOUNT: TFloatField;
    tblTransactionFTAXAMOUNT: TFloatField;
    tblTransactionFOUTSTANDINGAMOUNT: TFloatField;
    tblTransactionBRECONCILED: TSmallintField;
    tblTransactionWBALANCINGACCOUNTID: TIntegerField;
    tblTransactionWDESCRIPTIONID: TIntegerField;
    tblTransactionWCURRENCYID: TIntegerField;
    tblTransactionFFOREXAMOUNT: TFloatField;
    tblTransactionWUSERID: TIntegerField;
    tblTransactionUNUSED: TIntegerField;
    tblTransactionDSYSDATE: TDateTimeField;
    tblTransactionBUNUSED: TSmallintField;
    tblTransactionWTAX2ID: TIntegerField;
    tblTransactionFCURRENCYRATE2: TFloatField;
    tblTransactionFTAXRATE2: TFloatField;
    tblTransactionFTAX2AMOUNT: TFloatField;
    tblTransactionWJOBCODEID: TIntegerField;
    tblTransactionWPROFILEID: TIntegerField;
    tblBankWACCOUNTID: TIntegerField;
    tblBankWCONTACTID: TIntegerField;
    tblBankWRECEIPTSID: TIntegerField;
    tblBankWPAYMENTSID: TIntegerField;
    tblBankWCURRENCYID: TIntegerField;
    tblBankDSYSDATE: TDateTimeField;
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
    tblReportingOptionsSACCOUNTLISTINGSEQUENCE: TStringField;
    tblReportingOptionsSACCOUNTLISTINGFROMACC: TStringField;
    tblReportingOptionsSACCOUNTLISTINGTOACC: TStringField;
    tblReportingOptionsBACCOUNTLISTINGSHOWSUB: TSmallintField;
    tblReportingOptionsWTRIALBALFROMDATEID: TIntegerField;
    tblReportingOptionsWTRIALBALODATEID: TIntegerField;
    tblReportingOptionsBTRIALBALDISPLAYSUBACC: TSmallintField;
    tblReportingOptionsBTRIALBALNILBALANCES: TSmallintField;
    tblReportingOptionsSTRIALBALSSEQUENCE: TStringField;
    tblReportingOptionsSBUDGETPERFSEQUENCE: TStringField;
    tblReportingOptionsSBUDGETPERFFROMACC: TStringField;
    tblReportingOptionsSBUDGETPERFTOACC: TStringField;
    tblReportingOptionsBBUDGETPERFSHOWSUB: TSmallintField;
    tblReportingOptionsBBUDGETPERFNILBAL: TSmallintField;
    tblReportingOptionsWBATCHTYPETYPE: TIntegerField;
    tblReportingOptionsSBATCHTYPEWHICHYEAR: TStringField;
    tblReportingOptionsWBATCHTYPEFROMDATEID: TIntegerField;
    tblReportingOptionsWBATCHTYPETODATEID: TIntegerField;
    tblReportingOptionsBBATCHTYPESHOWPERIOD: TSmallintField;
    tblReportingOptionsBBATCHTYPESHOWBAL: TSmallintField;
    tblReportingOptionsSCREDITORLISTINGSEQUENCE: TStringField;
    tblReportingOptionsSCREDLISTINGFROMACCOUNT: TStringField;
    tblReportingOptionsSCREDLISTINGTOACCOUNT: TStringField;
    tblReportingOptionsSCREDMOVEMENTSSEQUENCE: TStringField;
    tblReportingOptionsSCREDMOVEMENTSFROMACCOUNT: TStringField;
    tblReportingOptionsSCREDMOVEMENTSTOACCOUNT: TStringField;
    tblReportingOptionsBCREDMOVEMENTSBNIBAL: TSmallintField;
    tblReportingOptionsSDEBTORLISTINGSEQUENCE: TStringField;
    tblReportingOptionsSDEBTORLISTINGFROMACCOUNT: TStringField;
    tblReportingOptionsSDEBTORLISTINGTOACCOUNT: TStringField;
    tblReportingOptionsBDEBTORLISTINGSHOWDETAIL: TSmallintField;
    tblReportingOptionsSDEBTORMOVEMENTSEQUENCE: TStringField;
    tblReportingOptionsSDEBTORMOVEMENTFROMACC: TStringField;
    tblReportingOptionsSDEBTORMOVEMENTTOACC: TStringField;
    tblReportingOptionsBDEBTORMOVEMENTBNILBAL: TSmallintField;
    tblReportingOptionsWDOCLISTTYPEID: TIntegerField;
    tblReportingOptionsSDOCLISTSEQUENCE: TStringField;
    tblReportingOptionsSDOCLISTFROMNUMBER: TStringField;
    tblReportingOptionsSDOCLISTTONUMBER: TStringField;
    tblReportingOptionsDDOCLISTFROMDATE: TDateTimeField;
    tblReportingOptionsDDOCLISTTODATE: TDateTimeField;
    tblReportingOptionsSDEBTORAGEFROM: TStringField;
    tblReportingOptionsSDEBTORAGETO: TStringField;
    tblReportingOptionsDDEBTORAGECURRENTDATE: TDateTimeField;
    tblReportingOptionsDDEBTORAGEDATELIMIT1: TDateTimeField;
    tblReportingOptionsDDEBTORAGEDATELIMIT2: TDateTimeField;
    tblReportingOptionsDDEBTORAGEDATELIMIT3: TDateTimeField;
    tblReportingOptionsDDEBTORAGEDATELIMIT4: TDateTimeField;
    tblReportingOptionsSDEBTORAGERANGENAME0: TStringField;
    tblReportingOptionsSDEBTORAGERANGENAME1: TStringField;
    tblReportingOptionsSDEBTORAGERANGENAME2: TStringField;
    tblReportingOptionsSDEBTORAGERANGENAME3: TStringField;
    tblReportingOptionsFDEBTORAGEMINIMUMAMOUNT: TFloatField;
    tblReportingOptionsWDEBTORAGEMONTH1: TIntegerField;
    tblReportingOptionsWDEBTORAGEMONTH2: TIntegerField;
    tblReportingOptionsWDEBTORAGEMONTH3: TIntegerField;
    tblReportingOptionsBDEBTORAGESORT: TSmallintField;
    tblReportingOptionsBDEBTORAGEACCOUNTDETAIL: TSmallintField;
    tblReportingOptionsBDEBTORAGESHOWTRANSAC: TSmallintField;
    tblReportingOptionsBDEBTORAGESHOWOPENITEM: TSmallintField;
    tblReportingOptionsBDEBTORAGEIGNOREZEROBAL: TSmallintField;
    tblReportingOptionsSCREDITORAGEFROM: TStringField;
    tblReportingOptionsSCREDITORAGETO: TStringField;
    tblReportingOptionsDCREDITORAGECURRENTDATE: TDateTimeField;
    tblReportingOptionsDCREDITORAGEDATELIMIT1: TDateTimeField;
    tblReportingOptionsDCREDITORAGEDATELIMIT2: TDateTimeField;
    tblReportingOptionsDCREDITORAGEDATELIMIT3: TDateTimeField;
    tblReportingOptionsDCREDITORAGEDATELIMIT4: TDateTimeField;
    tblReportingOptionsSCREDITORAGERANGENAME0: TStringField;
    tblReportingOptionsSCREDITORAGERANGENAME1: TStringField;
    tblReportingOptionsSCREDITORAGERANGENAME2: TStringField;
    tblReportingOptionsSCREDITORAGERANGENAME3: TStringField;
    tblReportingOptionsFCREDITORAGEMINIMUMAMOUNT: TFloatField;
    tblReportingOptionsWCREDITORAGEMONTH1: TIntegerField;
    tblReportingOptionsWCREDITORAGEMONTH2: TIntegerField;
    tblReportingOptionsWCREDITORAGEMONTH3: TIntegerField;
    tblReportingOptionsBCREDITORAGESORT: TSmallintField;
    tblReportingOptionsBCREDITORAGEACCOUNTDETAIL: TSmallintField;
    tblReportingOptionsBCREDITORAGESHOWTRANSAC: TSmallintField;
    tblReportingOptionsBCREDITORAGESHOWOPENITEM: TSmallintField;
    tblReportingOptionsBCREDITORAGEIGNOREZEROBAL: TSmallintField;
    tblReportingOptionsSRECONBANKACCOUNT: TStringField;
    tblReportingOptionsDRECONUNTIL: TDateTimeField;
    tblReportingOptionsFRECONBANKBALANCE: TFloatField;
    tblReportingOptionsSRECONREPORTBANKACCOUNT: TStringField;
    tblReportingOptionsDRECONREPORTUNTIL: TDateTimeField;
    tblReportingOptionsFRECONREPORTBALANCE: TFloatField;
    tblReportingOptionsBCREDTRANSINCNILBAL: TSmallintField;
    tblReportingOptionsSCREDTRANSSEQUENCE: TStringField;
    tblReportingOptionsSCREDTRANSWHICHYEAR: TStringField;
    tblReportingOptionsSCREDTRANSFROMACCOUNT: TStringField;
    tblReportingOptionsSCREDTRANSTOACCOUNT: TStringField;
    tblReportingOptionsWCREDTRANSFROMDATE: TIntegerField;
    tblReportingOptionsWCREDTRANSTODATE: TIntegerField;
    tblReportingOptionsBCREDTRANSEACHPERIOD: TSmallintField;
    tblReportingOptionsBCREDTRANSNEWPAGE: TSmallintField;
    tblReportingOptionsBDEBTRANSINCNILBAL: TSmallintField;
    tblReportingOptionsSDEBTRANSSEQUENCE: TStringField;
    tblReportingOptionsSDEBTRANSWHICHYEAR: TStringField;
    tblReportingOptionsSDEBTRANSFROMACCOUNT: TStringField;
    tblReportingOptionsSDEBTRANSTOACCOUNT: TStringField;
    tblReportingOptionsWDEBTRANSFROMDATE: TIntegerField;
    tblReportingOptionsWDEBTRANSTODATE: TIntegerField;
    tblReportingOptionsBDEBTRANSEACHPERIOD: TSmallintField;
    tblReportingOptionsBDEBTRANSNEWPAGE: TSmallintField;
    tblReportingOptionsSSTOCKACTIVITYFROMCODE: TStringField;
    tblReportingOptionsSSTOCKACTIVITYTOCODE: TStringField;
    tblReportingOptionsSSTOCKACTIVITYSEQUENCE: TStringField;
    tblReportingOptionsSSTOCKLISTSEQUENCE: TStringField;
    tblReportingOptionsSSTOCKLISTFROMCODE: TStringField;
    tblReportingOptionsSSTOCKLISTTOCODE: TStringField;
    tblReportingOptionsBSTOCKLISTQTYONHAND: TSmallintField;
    tblReportingOptionsBSTOCKLISTCOSTPRICE: TSmallintField;
    tblReportingOptionsBSTOCKLISTSELLINGPRICE: TSmallintField;
    tblReportingOptionsBSTOCKLISTSTOCKCOUNT: TSmallintField;
    tblReportingOptionsBSTOCKLISTSTOCKVALUE: TSmallintField;
    tblReportingOptionsSSTOCKMOVEMENTSEQUENCE: TStringField;
    tblReportingOptionsSSTOCKMOVEMENTFROMCODE: TStringField;
    tblReportingOptionsSSTOCKMOVEMENTTOCODE: TStringField;
    tblReportingOptionsDSTOCKMOVEMENTFROMDATE: TDateTimeField;
    tblReportingOptionsDSTOCKMOVEMENTTODATE: TDateTimeField;
    tblReportingOptionsBSTOCKMOVEMENTSHOWDETAIL: TSmallintField;
    tblReportingOptionsBSTOCKMOVEMENTNEWPAGE: TSmallintField;
    tblReportingOptionsSSTOCKREORDERSEQUENCE: TStringField;
    tblReportingOptionsSSTOCKREORDERFROMCODE: TStringField;
    tblReportingOptionsSSTOCKREORDERTOCODE: TStringField;
    tblReportingOptionsBGLLEDGERNILBALANCES: TSmallintField;
    tblReportingOptionsSGLLEDGERSEQUENCE: TStringField;
    tblReportingOptionsSGLLEDGERWHICHYEAR: TStringField;
    tblReportingOptionsSGLLEDGERFROMACCOUNT: TStringField;
    tblReportingOptionsSGLLEDGERTOACCOUNT: TStringField;
    tblReportingOptionsWGLLEDGERFROMDATE: TIntegerField;
    tblReportingOptionsWGLLEDGERTODATE: TIntegerField;
    tblReportingOptionsBGLLEDGEREACHPERIOD: TSmallintField;
    tblReportingOptionsBGLLEDGERNEWPAGE: TSmallintField;
    tblReportingOptionsSGLMOVEMENTSEQUENCE: TStringField;
    tblReportingOptionsSGLMOVEMENTFROMACCOUNT: TStringField;
    tblReportingOptionsSGLMOVEMENTTOACCOUNT: TStringField;
    tblReportingOptionsBGLMOVEMENTBINCLNILBAL: TSmallintField;
    tblReportingOptionsSSALESBYCUSTSEQUENCE: TStringField;
    tblReportingOptionsSSALESBYCUSTFROMCUST: TStringField;
    tblReportingOptionsSSALESBYCUSTTOCUST: TStringField;
    tblReportingOptionsDSALESBYCUSTFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESBYCUSTTODATE: TDateTimeField;
    tblReportingOptionsSPURCHBYSUPPSEQUENCE: TStringField;
    tblReportingOptionsSPURCHBYSUPPFROMSUPP: TStringField;
    tblReportingOptionsSPURCHBYSUPPTOSUPP: TStringField;
    tblReportingOptionsDPURCHBYSUPPFROMDATE: TDateTimeField;
    tblReportingOptionsDPURCHBYSUPPTODATE: TDateTimeField;
    tblReportingOptionsSSALESBYPRODSEQUENCE: TStringField;
    tblReportingOptionsSSALESBYPRODFROMPROD: TStringField;
    tblReportingOptionsSSALESBYPRODTOPROD: TStringField;
    tblReportingOptionsDSALESBYPRODFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESBYPRODTODATE: TDateTimeField;
    tblReportingOptionsSPURCHBYPRODSEQUENCE: TStringField;
    tblReportingOptionsSPURCHBYPRODFROMPROD: TStringField;
    tblReportingOptionsSPURCHBYPRODTOPROD: TStringField;
    tblReportingOptionsDPURCHBYPRODFROMDATE: TDateTimeField;
    tblReportingOptionsDPURCHBYPRODTODATE: TDateTimeField;
    tblReportingOptionsSCUSTBYPRODSEQUENCE: TStringField;
    tblReportingOptionsSCUSTBYPRODFROMPROD: TStringField;
    tblReportingOptionsSCUSTBYPRODTOPROD: TStringField;
    tblReportingOptionsDCUSTBYPRODFROMDATE: TDateTimeField;
    tblReportingOptionsDCUSTBYPRODTODATE: TDateTimeField;
    tblReportingOptionsSSALESPERSBYPRODSEQUENCE: TStringField;
    tblReportingOptionsSSALESPERSBYPRODFROMPROD: TStringField;
    tblReportingOptionsSSALESPERSBYPRODTOPROD: TStringField;
    tblReportingOptionsDSALESPERSBYPRODFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESPERSBYPRODTODATE: TDateTimeField;
    tblReportingOptionsSPRODBYCUSTSEQUENCE: TStringField;
    tblReportingOptionsSPRODBYCUSTFROMPROD: TStringField;
    tblReportingOptionsSPRODBYCUSTTOPROD: TStringField;
    tblReportingOptionsDPRODBYCUSTFROMDATE: TDateTimeField;
    tblReportingOptionsDPRODBYCUSTTODATE: TDateTimeField;
    tblReportingOptionsSCUSTBYSPERSONSPERSON: TStringField;
    tblReportingOptionsDCUSTBYSPERSONFROMDATE: TDateTimeField;
    tblReportingOptionsDCUSTBYSPERSONTODATE: TDateTimeField;
    tblReportingOptionsSSALESBYSPSALESPERSON: TStringField;
    tblReportingOptionsDSALESBYSPFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESBYSPTODATE: TDateTimeField;
    tblReportingOptionsSPRODBYSPSALESPERSON: TStringField;
    tblReportingOptionsDPRODBYSPFROMDATE: TDateTimeField;
    tblReportingOptionsDPRODBYSPTODATE: TDateTimeField;
    tblReportingOptionsSSALESBYGROUPFROMGROUP: TStringField;
    tblReportingOptionsSSALESBYGROUPTOGROUP: TStringField;
    tblReportingOptionsDSALESBYGROUPFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESBYGROUPTODATE: TDateTimeField;
    tblReportingOptionsSINVOICEDETAILWHICHYEAR: TStringField;
    tblReportingOptionsWINVOICEDETAILFROMDATE: TIntegerField;
    tblReportingOptionsWINVOICEDETAILTODATE: TIntegerField;
    tblReportingOptionsSINVOICEDETAILSTAXACCOUNT: TStringField;
    tblReportingOptionsBINVOICEDETAILSHOWDETAIL: TSmallintField;
    tblReportingOptionsSDEBTSTATEMENTFROMACC: TStringField;
    tblReportingOptionsSDEBTSTATEMENTTOACC: TStringField;
    tblReportingOptionsFDEBTSTATEMENTMINAMOUNT: TFloatField;
    tblReportingOptionsDDEBTSTATEMENTCURRENTDATE: TDateTimeField;
    tblReportingOptionsDDEBTSTATEMENTDATELIMIT1: TDateTimeField;
    tblReportingOptionsDDEBTSTATEMENTDATELIMIT2: TDateTimeField;
    tblReportingOptionsDDEBTSTATEMENTDATELIMIT3: TDateTimeField;
    tblReportingOptionsDDEBTSTATEMENTDATELIMIT4: TDateTimeField;
    tblReportingOptionsSDEBTSTATEMENTAGENAME0: TStringField;
    tblReportingOptionsSDEBTSTATEMENTAGENAME1: TStringField;
    tblReportingOptionsSDEBTSTATEMENTAGENAME2: TStringField;
    tblReportingOptionsSDEBTSTATEMENTAGENAME3: TStringField;
    tblReportingOptionsWDEBTSTATEMENTMONTH1: TIntegerField;
    tblReportingOptionsWDEBTSTATEMENTMONTH2: TIntegerField;
    tblReportingOptionsWDEBTSTATEMENTMONTH3: TIntegerField;
    tblReportingOptionsBDEBTSTATEMENTTAXSEPERATE: TSmallintField;
    tblReportingOptionsBDEBTSTATEMENTTAXTRANSACT: TSmallintField;
    tblReportingOptionsBDEBTSTATEMENTOPENITEM: TSmallintField;
    tblReportingOptionsWINCOMESTMNTFROMDATEID: TIntegerField;
    tblReportingOptionsWINCOMESTMNTTODATEID: TIntegerField;
    tblReportingOptionsBINCOMESTMNTDISPLAYSUBACC: TSmallintField;
    tblReportingOptionsBINCOMESTMNTNILBALANCES: TSmallintField;
    tblReportingOptionsSINCOMESTMNTSSEQUENCE: TStringField;
    tblReportingOptionsSREMITTANCEFROMACC: TStringField;
    tblReportingOptionsSREMITTANCETOACC: TStringField;
    tblReportingOptionsFREMITTANCEMINAMOUNT: TFloatField;
    tblReportingOptionsDREMITTANCEDATELIMIT1: TDateTimeField;
    tblReportingOptionsDREMITTANCEDATELIMIT2: TDateTimeField;
    tblReportingOptionsDREMITTANCEDATELIMIT3: TDateTimeField;
    tblReportingOptionsDREMITTANCEDATELIMIT4: TDateTimeField;
    tblReportingOptionsSREMITTANCEAGENAME0: TStringField;
    tblReportingOptionsSREMITTANCEAGENAME1: TStringField;
    tblReportingOptionsSREMITTANCEAGENAME2: TStringField;
    tblReportingOptionsSREMITTANCEAGENAME3: TStringField;
    tblReportingOptionsWREMITTANCEMONTH1: TIntegerField;
    tblReportingOptionsWREMITTANCEMONTH2: TIntegerField;
    tblReportingOptionsWREMITTANCEMONTH3: TIntegerField;
    tblReportingOptionsBREMITTANCETAXSEPERATE: TSmallintField;
    tblReportingOptionsBREMITTANCETAXTRANSACT: TSmallintField;
    tblReportingOptionsBREMITTANCEOPENITEM: TSmallintField;
    tblReportingOptionsWREMITTANCEFROMDATEID: TIntegerField;
    tblReportingOptionsWREMITTANCETODATEID: TIntegerField;
    tblReportingOptionsBREMITTANCEDISPLAYSUBACC: TSmallintField;
    tblReportingOptionsBREMITTANCENILBALANCES: TSmallintField;
    tblReportingOptionsSREMITTANCESSEQUENCE: TStringField;
    tblReportingOptionsWBALSHEETFROMDATEID: TIntegerField;
    tblReportingOptionsWBALSHEETTODATEID: TIntegerField;
    tblReportingOptionsBBALSHEETDISPLAYSUBACCS: TSmallintField;
    tblReportingOptionsBBALSHEETNILBALANCES: TSmallintField;
    tblReportingOptionsSBALSHEETSSEQUENCE: TStringField;
    tblReportingOptionsSSALESPERSBYCUSTSEQUENCE: TStringField;
    tblReportingOptionsSSALESPERSBYCUSTFROMCUST: TStringField;
    tblReportingOptionsSSALESPERSBYCUSTTOCUST: TStringField;
    tblReportingOptionsDSALESPERSBYCUSTFROMDATE: TDateTimeField;
    tblReportingOptionsDSALESPERSBYCUSTTODATE: TDateTimeField;
    tblReportingOptionsWDATAENTRYDRCRFORMAT: TIntegerField;
    tblReportingOptionsWDECIMAL: TIntegerField;
    tblReportingOptionsSLABELFROMACC: TStringField;
    tblReportingOptionsSLABELTOACC: TStringField;
    tblReportingOptionsSLABELSSEQUENCE: TStringField;
    tblReportingOptionsSLABELSFILE: TStringField;
    tblDocLineWDOCLINEID: TIntegerField;
    tblDocLineWDOCID: TIntegerField;
    tblDocLineWSTOCKID: TIntegerField;
    tblDocLineWLINETYPEID: TIntegerField;
    tblDocLineWDESCRIPTIONID: TIntegerField;
    tblDocLineFQTYORDERED: TFloatField;
    tblDocLineFQTYSHIPPED: TFloatField;
    tblDocLineFSELLINGPRICE: TFloatField;
    tblDocLineFITEMDISCOUNT: TFloatField;
    tblDocLineWTAXID: TIntegerField;
    tblDocLineFEXCLUSIVEAMT: TFloatField;
    tblDocLineFINCLUSIVEAMT: TFloatField;
    tblDocLineFTAXAMOUNT: TFloatField;
    tblDocLineDSYSDATE: TDateTimeField;
    tblDocLineSUNIT: TStringField;
    tblDocLineSSTOCKCODE: TStringField;
    tblDocLineWPROFILEID: TIntegerField;
    tblDocLineWSERIALNOID: TIntegerField;
    QBOMWBOMID: TIntegerField;
    QBOMWSTOCKID: TIntegerField;
    QBOMWLINKEDSTOCKID: TIntegerField;
    QBOMFQTY: TFloatField;
    QBOMSSTOCKCODE: TStringField;
    QBOMSDESCRIPTION: TStringField;
    tblBOMHeadWMFCDOCID: TIntegerField;
    tblBOMHeadWMFCTYPEID: TIntegerField;
    tblBOMHeadSMFCCODE: TStringField;
    tblBOMHeadWPARENTID: TIntegerField;
    tblBOMHeadSPICTURE: TStringField;
    tblBOMHeadBDISABLED: TSmallintField;
    tblBOMHeadSDESCRIPTION: TStringField;
    tblBOMHeadWLOCATIONID: TIntegerField;
    tblBOMHeadWFINISHEDSTOCKID: TIntegerField;
    tblBOMHeadFPRICE1: TFloatField;
    tblBOMHeadFPRICE2: TFloatField;
    tblBOMHeadFPRICE3: TFloatField;
    tblBOMHeadFUNUSED: TFloatField;
    tblBOMHeadWPROFILEID: TIntegerField;
    tblBOMHeadDSYSDATE: TDateTimeField;
    tblBOMLinesWMFCDOCID: TIntegerField;
    tblBOMLinesWLINEID: TIntegerField;
    tblBOMLinesWLINETYPEID: TIntegerField;
    tblBOMLinesSSTOCKCODE: TStringField;
    tblBOMLinesSDESCRIPTION: TStringField;
    tblBOMLinesWLOCATIONID: TIntegerField;
    tblBOMLinesFQTY: TFloatField;
    tblBOMLinesFVALUE: TFloatField;
    tblBOMLinesWPROFILEID: TIntegerField;
    tblBOMLinesDSYSDATE: TDateTimeField;
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
    tblLocationsWLOCATIONID: TIntegerField;
    tblLocationsSDESCRIPTION: TStringField;
    tblLocationsSLOCCODE: TStringField;
    tblLocationsWLOCATIONTYPEID: TIntegerField;
    tblLocationsWPARENTID: TIntegerField;
    tblLocationsDSYSDATE: TDateTimeField;
    tblLocationsWSORTNO: TIntegerField;
    tblBatchControlWBATCHID: TIntegerField;
    tblBatchControlWUSERID: TIntegerField;
    tblBatchControlWBATCHTYPEID: TIntegerField;
    tblBatchControlSBATCHNUMBER: TStringField;
    tblBatchControlBPOSTED: TSmallintField;
    tblBatchControlBIMPORTED: TSmallintField;
    tblBatchControlBDOCSOURCE: TSmallintField;
    tblBatchControlWLINECOUNT: TIntegerField;
    tblBatchControlSFILENAME: TStringField;
    tblBatchControlWDOCID: TIntegerField;
    tblBatchControlDSYSDATE: TDateTimeField;
    tblBatchControlWINITBATID: TIntegerField;
    tblBatchControlSALIAS: TStringField;
    tblBatchControlSUNIQUEID: TStringField;
    tblAssetMasWASSETID: TIntegerField;
    tblAssetMasSDESRIPTION: TStringField;
    tblAssetMasWLOCATIONID: TIntegerField;
    tblAssetMasWGROUP1ID: TIntegerField;
    tblAssetMasWGROUP2ID: TIntegerField;
    tblAssetMasSASSETCODE: TStringField;
    tblAssetMasSSUBASSETCODE: TStringField;
    tblAssetMasSSERIALNO: TStringField;
    tblAssetMasDDEPSTART: TDateTimeField;
    tblAssetMasDDEPEND: TDateTimeField;
    tblAssetMasDBUY: TDateTimeField;
    tblAssetMasDASSETOUT: TDateTimeField;
    tblAssetMasWDEPTYPEID: TIntegerField;
    tblAssetMasFDEPRATE: TFloatField;
    tblAssetMasFTAXRATE: TFloatField;
    tblAssetMasWTAXTYPE: TIntegerField;
    tblAssetMasWTAXID: TIntegerField;
    tblAssetMasWSUPPLIERID: TIntegerField;
    tblAssetMasBDISABLED: TSmallintField;
    tblAssetMasFCOSTPRICE: TFloatField;
    tblAssetMasFPURPRICE: TFloatField;
    tblAssetMasFCAPTAXAMT: TFloatField;
    tblAssetMasFMARKETVALUE: TFloatField;
    tblAssetMasFBOOKVALUE: TFloatField;
    tblAssetMasFUNSED1: TFloatField;
    tblAssetMasFUNSED2: TFloatField;
    tblAssetMasDSYSDATE: TDateTimeField;
    tblAssetMasWACCOUNTID: TIntegerField;
    qryUpdateBatchWBATCHID: TIntegerField;
    qryUpdateBatchWUSERID: TIntegerField;
    qryUpdateBatchBPOSTED: TSmallintField;
    qryUpdateBatchWBATCHTYPEID: TIntegerField;
    qryUpdateBatchSDESCRIPTION: TStringField;
    qryUpdateBatchSUSERNAME: TStringField;
    qryUpdateBatchBONLINE: TSmallintField;
    tblMessageWMESSAGEID: TIntegerField;
    tblMessageSDESCRIPTION: TStringField;
    tblMessageSEXTRADESCRIPTION: TStringField;
    tblCashFlowWACCOUNTID: TIntegerField;
    tblCashFlowWBATCHID: TIntegerField;
    tblCashFlowSDESCRIPTION: TStringField;
    tblCashFlowWPERIODID: TIntegerField;
    tblCashFlowSCODE: TStringField;
    tblCashFlowFAMOUNT1: TFloatField;
    tblCashFlowFAMOUNT2: TFloatField;
    tblCashFlowFAMOUNT3: TFloatField;
    tblCashFlowFAMOUNT4: TFloatField;
    tblCashFlowFAMOUNT5: TFloatField;
    tblCashFlowFAMOUNT6: TFloatField;
    qryInvDetailSDESCRIPTION: TStringField;
    qryInvDetailDDATE: TDateTimeField;
    qryInvDetailSREFERENCE: TStringField;
    qryInvDetailSDESCRIPTION_1: TStringField;
    qryInvDetailSMAINACCOUNTCODE: TStringField;
    qryInvDetailSSUBACCOUNTCODE: TStringField;
    qryInvDetailFAMOUNT: TFloatField;
    qryInvDetailFTAXAMOUNT: TFloatField;
    qryInvDetailWTAXACCOUNTID: TIntegerField;
    qryInvDetailBCASHBOOK: TSmallintField;
    qryInvDetailWPERIODID: TIntegerField;
    qryInvDetailSACCOUNTCODE: TStringField;
    qryInvDetailWACCOUNTTYPEID: TIntegerField;
    qryInvDetailFTAXRATE: TFloatField;
    qryInvDetailWACCOUNTID: TIntegerField;
    tblPayTransactWPAYROLLID: TIntegerField;
    tblPayTransactWEMPLOYEEID: TIntegerField;
    tblPayTransactWSOURCEID: TIntegerField;
    tblPayTransactWPERIODID: TIntegerField;
    tblPayTransactFAMOUNT: TFloatField;
    tblPayTransactFUNITS: TFloatField;
    tblPayTransactWUSERID: TIntegerField;
    tblPayTransactWPROFILEID: TIntegerField;
    tblPayTransactDSYSDATE: TDateTimeField;
    tblTotalsWACCOUNTID: TIntegerField;
    tblTotalsWPERIODID: TIntegerField;
    tblTotalsBACTUAL: TSmallintField;
    tblTotalsFAMOUNT: TFloatField;
    tblTotalsDSYSDATE: TDateTimeField;
    tblBatchTypesWBATCHTYPEID: TIntegerField;
    tblBatchTypesSDESCRIPTION: TStringField;
    tblBatchTypesBCASHBOOK: TSmallintField;
    tblBatchTypesWCONTRAACCOUNTID: TIntegerField;
    tblBatchTypesBCONTRAPERLINE: TSmallintField;
    tblBatchTypesBINCREMENTREFNO: TSmallintField;
    tblBatchTypesBREPEATDETAILS: TSmallintField;
    tblBatchTypesBCONSOLIDATEBALANCING: TSmallintField;
    tblBatchTypesWDEBITCREDIT: TIntegerField;
    tblBatchTypesWPAYMENTGROUPID: TIntegerField;
    tblBatchTypesWDEFAULTTAXID: TIntegerField;
    tblBatchTypesBVIEWEXCLUSIVE: TSmallintField;
    tblBatchTypesBLINKOI: TSmallintField;
    tblBatchTypesBINCLUSIVEMODE: TSmallintField;
    tblBatchTypesDSYSDATE: TDateTimeField;
    tblRepLineWREPORTID: TIntegerField;
    tblRepLineWROWID: TIntegerField;
    tblRepLineWROWTYPEID: TIntegerField;
    tblRepLineWROWITEMID: TIntegerField;
    tblRepLineSITEMNAME: TStringField;
    tblRepLineSROWDESCRIPTION: TStringField;
    tblRepLineBMAINACCOUNT: TSmallintField;
    tblRepLineBSUPRESSPRINT: TSmallintField;
    tblRepLineSDESCRIPTION: TStringField;
    tblRepLineSCOLUMN1: TStringField;
    tblRepLineSCOLUMN2: TStringField;
    tblRepLineSCOLUMN3: TStringField;
    tblRepLineSCOLUMN4: TStringField;
    tblRepLineSCOLUMN5: TStringField;
    tblRepLineSCOLUMN6: TStringField;
    tblRepLineSCOLUMN7: TStringField;
    tblRepLineSCOLUMN8: TStringField;
    tblRepLineSCOLUMN9: TStringField;
    tblRepLineSCOLUMN10: TStringField;
    tblRepLineSCOLUMN11: TStringField;
    tblRepLineSCOLUMN12: TStringField;
    tblRepLineSCOLUMN13: TStringField;
    tblRepLineSCOLUMN14: TStringField;
    tblRepLineSCOLUMN15: TStringField;
    tblRepLineDSYSDATE: TDateTimeField;
    tblCurrencyWCURRENCYID: TIntegerField;
    tblCurrencySDESCRIPTION: TStringField;
    tblCurrencySSYMBOL: TStringField;
    tblCurrencyFRATE1: TFloatField;
    tblCurrencyFRATE2: TFloatField;
    tblCurrencyFRETE3: TFloatField;
    tblCurrencyFRATE4: TFloatField;
    tblCurrencyFRATE5: TFloatField;
    tblCurrencyFRATE6: TFloatField;
    tblCurrencyFRATE7: TFloatField;
    tblCurrencyFRATE8: TFloatField;
    tblCurrencyFRATE9: TFloatField;
    tblCurrencyFRATE10: TFloatField;
    tblCurrencyFRATE11: TFloatField;
    tblCurrencyFRATE12: TFloatField;
    tblCurrencyFRATE13: TFloatField;
    tblCurrencyFRATE14: TFloatField;
    tblCurrencyFRATE15: TFloatField;
    tblCurrencyFRATE16: TFloatField;
    tblCurrencyFRATE17: TFloatField;
    tblCurrencyFRATE18: TFloatField;
    tblCurrencyFRATE19: TFloatField;
    tblCurrencyFRATE20: TFloatField;
    tblCurrencyFRATE21: TFloatField;
    tblCurrencyFRATE22: TFloatField;
    tblCurrencyFRATE23: TFloatField;
    tblCurrencyFRATE24: TFloatField;
    tblCurrencyFRATE25: TFloatField;
    tblCurrencyFRATE26: TFloatField;
    tblCurrencyWCONTRYID: TIntegerField;
    tblCurrencyWVARIANCEACCOUNTID: TIntegerField;
    tblCurrencyWNOOFDECIMALS: TIntegerField;
    tblGroupsWGROUPID: TIntegerField;
    tblGroupsWGROUPTYPEID: TIntegerField;
    tblGroupsSDESCRIPTION: TStringField;
    tblGroupsWPARENTGROUP2ID: TIntegerField;
    tblGroupsWPARENTGROUP1ID: TIntegerField;
    tblGroupsDSYSDATE: TDateTimeField;
    tblGroupsWSORTNO: TIntegerField;
    tblUnitWUNITID: TIntegerField;
    tblUnitSDESCRIPTION: TStringField;
    tblUnitDSYSDATE: TDateTimeField;
    tblProfilesWPROFILEID: TIntegerField;
    tblProfilesWPROFILETYPEID: TIntegerField;
    tblProfilesWPARENTID: TIntegerField;
    tblProfilesWSOURCEID: TIntegerField;
    tblProfilesWSOURCETYPEID: TIntegerField;
    tblProfilesSDESCRIPTION: TStringField;
    tblProfilesBACTIVE: TSmallintField;
    tblProfilesDSYSDATE: TDateTimeField;
    tblProfilesWSORTNO: TIntegerField;
    tblProfilesWSTATUS: TIntegerField;
    tblSelectUserWUSERID: TIntegerField;
    tblSelectUserSPASSWORD: TStringField;
    tblSelectUserSUSERNAME: TStringField;
    tblSelectUserSCREDITNOTENEXTNUMBER: TStringField;
    tblSelectUserSINVOICENEXTNUMBER: TStringField;
    tblSelectUserSPURCHASENEXTNUMBER: TStringField;
    tblSelectUserSGOODSRETURNEDNEXTNUMBER: TStringField;
    tblSelectUserSRECEIPTNEXTNUMBER: TStringField;
    tblSelectUserSQUOTENEXTNUMBER: TStringField;
    tblSelectUserSORDERNEXTNUMBER: TStringField;
    tblSelectUserSNEXTBATCHNUMBER: TStringField;
    tblSelectUserBDISABLED: TSmallintField;
    tblSelectUserBACCOUNTS: TSmallintField;
    tblSelectUserBSTOCK: TSmallintField;
    tblSelectUserBBATCHENTRY: TSmallintField;
    tblSelectUserBCREDITNOTE: TSmallintField;
    tblSelectUserBINVOICES: TSmallintField;
    tblSelectUserBPURCHASES: TSmallintField;
    tblSelectUserBSTOCKRETURNS: TSmallintField;
    tblSelectUserBRECONCILIATION: TSmallintField;
    tblSelectUserBCREDITORREPORTS: TSmallintField;
    tblSelectUserBDEBTORREPORTS: TSmallintField;
    tblSelectUserBLEDGERREPORTS: TSmallintField;
    tblSelectUserBSTOCKREPORTS: TSmallintField;
    tblSelectUserBUSERREPORTS: TSmallintField;
    tblSelectUserBPOSTING: TSmallintField;
    tblSelectUserBGLOBALPROCESSES: TSmallintField;
    tblSelectUserBSYSTEMSETUP: TSmallintField;
    tblSelectUserUSEREMAIL: TStringField;
    tblSelectUserBONLINE: TSmallintField;
    tblSelectUserSPCIPADDRESS: TStringField;
    tblSelectUserDSYSDATE: TDateTimeField;
    tblSelectUserBEDITPRICES: TSmallintField;
    tblSelectUserBGLOBALSEQ: TSmallintField;
    tblSelectUserBCASHBOOK: TSmallintField;
    tblSelectUserBONLYPOS: TSmallintField;
    tblSelectUserBPOSSUPER: TSmallintField;
    tblSelectUserBSEARCH: TSmallintField;
    tblSelectUserBEMAIL: TSmallintField;
    tblSelectUserBNOTUSED1: TSmallintField;
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
    tblJobProjectWJOBPROJECTID: TIntegerField;
    tblJobProjectSJOBPROJECTCODE: TStringField;
    tblJobProjectSDESCRIPTION: TStringField;
    tblJobProjectDSTARTDATE: TDateTimeField;
    tblJobProjectDENDDATE: TDateTimeField;
    tblJobProjectWPARENTID: TIntegerField;
    tblJobProjectWNOTEFILEID: TIntegerField;
    tblJobProjectBENABLED: TSmallintField;
    tblJobProjectWSTATUSID: TIntegerField;
    tblJobProjectWINBUDGETACCID: TIntegerField;
    tblJobProjectWEXBUDGETACCID: TIntegerField;
    tblJobProjectWPROFILEID: TIntegerField;
    tblJobProjectWINFOSID: TIntegerField;
    tblJobProjectWGROUP1ID: TIntegerField;
    tblJobProjectDSYSDATE: TDateTimeField;
    tblJobProjectWUSERID: TIntegerField;
    tblJobProjectWGROUP2ID: TIntegerField;
    tblJobProjectWPROFBUDGETID: TIntegerField;
    tblOILinksDDOCDATE: TDateTimeField;
    tblOILinksSREFERENCE: TStringField;
    tblOILinksSLINKEDREFERENCE: TStringField;
    tblOILinksWFULLAMOUNT: TFloatField;
    tblOILinksWOUTSTANDINGAMOUNT: TFloatField;
    tblOILinksWLINKEDAMOUNT: TFloatField;
    tblOILinksDDATE: TDateTimeField;
    tblOILinksUNUSED1: TIntegerField;
    tblOILinksWAMOUNTTRANSACTIONID: TIntegerField;
    tblOILinksWLINKTRANSACTIONID: TIntegerField;
    tblOILinksWUSERID: TIntegerField;
    tblOILinksUNUSED2: TIntegerField;
    tblOILinksWBATCHID: TIntegerField;
    tblOILinksWACCOUNTID: TIntegerField;
    tblOILinksWTAXID: TIntegerField;
    tblOILinksDSYSDATE: TDateTimeField;
    tblTypeWTYPEID: TIntegerField;
    tblTypeSDESCRIPTION: TStringField;
    tblTypeWTYPEPARENT: TIntegerField;
    tblStockTransWSTOCKTRANSACTIONID: TIntegerField;
    tblStockTransWSTOCKID: TIntegerField;
    tblStockTransDDATE: TDateTimeField;
    tblStockTransWSALESMANID: TIntegerField;
    tblStockTransWDOCID: TIntegerField;
    tblStockTransWDOCTYPEID: TIntegerField;
    tblStockTransFQTY: TFloatField;
    tblStockTransFCOSTPRICE: TFloatField;
    tblStockTransFSELLINGPRICE: TFloatField;
    tblStockTransWACCOUNTID: TIntegerField;
    tblStockTransDSYSDATE: TDateTimeField;
    tblStockPublishingWSTOCKID: TIntegerField;
    tblStockPublishingWPRICEID: TIntegerField;
    tblStockPublishingBLOBPICTURE: TBlobField;
    tblStockPublishingDSYSDATE: TDateTimeField;
    qrySalesPersonByCustomerSMAINACCOUNTCODE: TStringField;
    qrySalesPersonByCustomerSSUBACCOUNTCODE: TStringField;
    qrySalesPersonByCustomerSDESCRIPTION: TStringField;
    qrySalesPersonByCustomerWSTOCKTRANSACTIONID: TIntegerField;
    qrySalesPersonByCustomerSDOCNO: TStringField;
    qrySalesPersonByCustomerDDATE: TDateTimeField;
    qrySalesPersonByCustomerWDOCTYPEID: TIntegerField;
    qrySalesPersonByCustomerWSALESMANID: TIntegerField;
    qrySalesPersonByCustomerFSELLINGPRICE: TFloatField;
    qrySalesPersonByCustomerFCOSTPRICE: TFloatField;
    qrySalesPersonByCustomerFQTY: TFloatField;
    tblRepeatingBatchWTRANSACTIONID: TIntegerField;
    tblRepeatingBatchWUSERID: TIntegerField;
    tblRepeatingBatchWBATCHTYPEID: TIntegerField;
    tblRepeatingBatchSREFERENCE: TStringField;
    tblRepeatingBatchDDATE: TDateTimeField;
    tblRepeatingBatchSDESCRIPTION: TStringField;
    tblRepeatingBatchWTAXID: TIntegerField;
    tblRepeatingBatchWACCOUNTID: TIntegerField;
    tblRepeatingBatchWCONTRAID: TIntegerField;
    tblRepeatingBatchFAMOUNT: TFloatField;
    tblOpReportWOPTIONID: TIntegerField;
    tblOpReportSTROPTION: TStringField;
    tblOpReportSOPTIONVALUE: TStringField;
    tblOpReportWOPTIONTYPEID: TIntegerField;
    tblPeriodsWPERIODID: TIntegerField;
    tblPeriodsDSTARTDATE: TDateTimeField;
    tblPeriodsDENDDATE: TDateTimeField;
    tblPeriodsSDESCRIPTION: TStringField;
    tblPeriodsBSHUTDOWN: TSmallintField;
    tblPeriodsBCONTAINSTRANSACTIONS: TSmallintField;
    tblUserWUSERID: TIntegerField;
    tblUserSPASSWORD: TStringField;
    tblUserSUSERNAME: TStringField;
    tblUserSCREDITNOTENEXTNUMBER: TStringField;
    tblUserSINVOICENEXTNUMBER: TStringField;
    tblUserSPURCHASENEXTNUMBER: TStringField;
    tblUserSGOODSRETURNEDNEXTNUMBER: TStringField;
    tblUserSRECEIPTNEXTNUMBER: TStringField;
    tblUserSQUOTENEXTNUMBER: TStringField;
    tblUserSORDERNEXTNUMBER: TStringField;
    tblUserSNEXTBATCHNUMBER: TStringField;
    tblUserBDISABLED: TSmallintField;
    tblUserBACCOUNTS: TSmallintField;
    tblUserBSTOCK: TSmallintField;
    tblUserBBATCHENTRY: TSmallintField;
    tblUserBCREDITNOTE: TSmallintField;
    tblUserBINVOICES: TSmallintField;
    tblUserBPURCHASES: TSmallintField;
    tblUserBSTOCKRETURNS: TSmallintField;
    tblUserBRECONCILIATION: TSmallintField;
    tblUserBCREDITORREPORTS: TSmallintField;
    tblUserBDEBTORREPORTS: TSmallintField;
    tblUserBLEDGERREPORTS: TSmallintField;
    tblUserBSTOCKREPORTS: TSmallintField;
    tblUserBUSERREPORTS: TSmallintField;
    tblUserBPOSTING: TSmallintField;
    tblUserBGLOBALPROCESSES: TSmallintField;
    tblUserBSYSTEMSETUP: TSmallintField;
    tblUserUSEREMAIL: TStringField;
    tblUserBONLINE: TSmallintField;
    tblUserSPCIPADDRESS: TStringField;
    tblUserDSYSDATE: TDateTimeField;
    tblUserBEDITPRICES: TSmallintField;
    tblUserBGLOBALSEQ: TSmallintField;
    tblUserBCASHBOOK: TSmallintField;
    tblUserBONLYPOS: TSmallintField;
    tblUserBPOSSUPER: TSmallintField;
    tblUserBSEARCH: TSmallintField;
    tblUserBEMAIL: TSmallintField;
    tblUserBNOTUSED1: TSmallintField;
    qryReconReportSDESCRIPTION: TStringField;
    qryReconReportSREFERENCE: TStringField;
    qryReconReportDDATE: TDateTimeField;
    qryReconReportSDESCRIPTION_1: TStringField;
    qryReconReportFAMOUNT: TFloatField;
    tblEmpMasWEMPLOYEEID: TIntegerField;
    tblEmpMasSEMPLOYEENUMBER: TStringField;
    tblEmpMasSFIRSTNAME: TStringField;
    tblEmpMasSSURNAME: TStringField;
    tblEmpMasSADDRESS1: TStringField;
    tblEmpMasSADDRESS2: TStringField;
    tblEmpMasSADDRESS3: TStringField;
    tblEmpMasSPOSTCODE: TStringField;
    tblEmpMasSIDNUMBER: TStringField;
    tblEmpMasSPASSPORTNUMBER: TStringField;
    tblEmpMasSINCOMETAXREFNUMBER: TStringField;
    tblEmpMasSDIRECTIVENUMBER: TStringField;
    tblEmpMasSBRANCH: TStringField;
    tblEmpMasDSTARTDATE: TDateTimeField;
    tblEmpMasDTERMINATIONDATE: TDateTimeField;
    tblEmpMasBACTIVE: TSmallintField;
    tblEmpMasDBIRTHDATE: TDateTimeField;
    tblEmpMasWIRPTYPE: TIntegerField;
    tblEmpMasSREASON: TStringField;
    tblEmpMasWREPORTINGGROUP1: TIntegerField;
    tblEmpMasWREPORTINGGROUP2: TIntegerField;
    tblEmpMasWACCOUNTID: TIntegerField;
    tblEmpMasWPAYMENTMETHODID: TIntegerField;
    tblEmpMasSBANKNAME: TStringField;
    tblEmpMasSBANKACCOUNTNUMBER: TStringField;
    tblEmpMasSBANKBRANCH: TStringField;
    tblEmpMasFLEAVEALLOCATED: TFloatField;
    tblEmpMasFLEAVETAKEN: TFloatField;
    tblEmpMasSDATA1: TStringField;
    tblEmpMasSDATA2: TStringField;
    tblEmpMasSDATA3: TStringField;
    tblEmpMasWPROFILEID: TIntegerField;
    tblEmpMasDSYSDATE: TDateTimeField;
    tblAbreviationsCKEY: TStringField;
    tblAbreviationsSABREVIATION: TStringField;
    tblBackOrderWBACKORDERID: TIntegerField;
    tblBackOrderWACCOUNTID: TIntegerField;
    tblBackOrderWSTOCKID: TIntegerField;
    tblBackOrderFQTY: TFloatField;
    tblBackOrderFSELLINGPRICE: TFloatField;
    tblBackOrderBSELECTED: TSmallintField;
    tblBackOrderDSYSDATE: TDateTimeField;
    tblSysParamsWUSERID: TIntegerField;
    tblSysParamsSPARAMNAME: TStringField;
    tblSysParamsSPARAMVALUE: TStringField;
    tblSysParamsWTYPEID: TIntegerField;
    tblSysParamsWSOURCEID: TIntegerField;
    tblSysParamsWSOURCETYPEID: TIntegerField;
    tblSysParamsDSYSDATE: TDateTimeField;
    tblSysParamsWPARENTID: TIntegerField;
    tblSysParamsWPARENTTYPEID: TIntegerField;
    tblSysParamsBACTIVE: TSmallintField;
    tblSysParamsWPARAMID: TIntegerField;
    tblTaxWACCOUNTID: TIntegerField;
    tblTaxSDESCRIPTION: TStringField;
    tblTaxDSTARTDATE: TDateTimeField;
    tblTaxDENDDATE: TDateTimeField;
    tblTaxFRATE: TFloatField;
    tblTaxDSYSDATE: TDateTimeField;
    qryGroupsWGROUPID: TIntegerField;
    qryGroupsWGROUPTYPEID: TIntegerField;
    qryGroupsSDESCRIPTION: TStringField;
    qryGroupsWPARENTGROUP2ID: TIntegerField;
    qryGroupsWPARENTGROUP1ID: TIntegerField;
    qryGroupsDSYSDATE: TDateTimeField;
    qryGroupsWSORTNO: TIntegerField;
    qGenDetWACCOUNTID: TIntegerField;
    qGenDetSMAINACCOUNTCODE: TStringField;
    qGenDetSSUBACCOUNTCODE: TStringField;
    qGenDetWACCOUNTTYPEID: TIntegerField;
    qGenDetSDESCRIPTION: TStringField;
    qGenDetWREPORTINGGROUP1ID: TIntegerField;
    qGenDetWREPORTINGGROUP2ID: TIntegerField;
    qGenDetBSUBACCOUNTS: TSmallintField;
    qGenDetBINCOMEEXPENSE: TSmallintField;
    qGenDetSACCOUNTCODE: TStringField;
    qGenDetDSYSDATE: TDateTimeField;
    qGenDetWPROFILEID: TIntegerField;
    tblStockWSTOCKID: TIntegerField;
    tblStockSSTOCKCODE: TStringField;
    tblStockSBARCODENUMBER: TStringField;
    tblStockSDESCRIPTION: TStringField;
    tblStockWREPORTINGGROUP1ID: TIntegerField;
    tblStockWREPORTINGGROUP2ID: TIntegerField;
    tblStockWCOSTACCOUNTID: TIntegerField;
    tblStockWINPUTTAXID: TIntegerField;
    tblStockWOUTPUTTAXID: TIntegerField;
    tblStockFOPENINGAVECOST: TFloatField;
    tblStockFQTYONHAND: TFloatField;
    tblStockFOPENINGQTY: TFloatField;
    tblStockFINVQTYONHAND: TFloatField;
    tblStockFREORDERQTY: TFloatField;
    tblStockWSALESACCOUNTID: TIntegerField;
    tblStockBAPPLYINVOICEDISCOUNT: TSmallintField;
    tblStockWSTOCKACCOUNTID: TIntegerField;
    tblStockFSELLINGPRICE1: TFloatField;
    tblStockFSELLINGPRICE2: TFloatField;
    tblStockFSELLINGPRICE3: TFloatField;
    tblStockFUNITAVECOST: TFloatField;
    tblStockFUNITCOST: TFloatField;
    tblStockWUNITID: TIntegerField;
    tblStockDSYSDATE: TDateTimeField;
    tblStockBAPPLYTAX: TSmallintField;
    tblStockWINPUTTAX2ID: TIntegerField;
    tblStockBTAXABLE: TSmallintField;
    tblStockWSUPPLIER1ID: TIntegerField;
    tblStockWSUPPLIER2ID: TIntegerField;
    tblStockWSTOCKTYPEID: TIntegerField;
    tblStockWOUTPUTTAX2ID: TIntegerField;
    tblStockWPROFILEID: TIntegerField;
    tblStockBDISABLED: TSmallintField;
    tblStockWPERENTID: TIntegerField;
    tblStockWLOCATIONID: TIntegerField;
    tblStockWFILENAMEID: TIntegerField;
    tblStockSEXTRADESC: TStringField;
    tblRepColsWREPORTID: TIntegerField;
    tblRepColsWCOLUMNID: TIntegerField;
    tblRepColsSHEADING1: TStringField;
    tblRepColsSHEADING2: TStringField;
    tblRepColsWCOLUMNTYPEID: TIntegerField;
    tblRepColsWPERIODSTART: TIntegerField;
    tblRepColsWPERIODEND: TIntegerField;
    tblRepColsSFORMULA: TStringField;
    tblRepColsDSYSDATE: TDateTimeField;
    tblLabSpecsWLABSPECSID: TIntegerField;
    tblLabSpecsSDESCRIPTION: TStringField;
    tblLabSpecsFTOPMARGIN: TFloatField;
    tblLabSpecsFBOTTOMMARGIN: TFloatField;
    tblLabSpecsFLEFTMARGIN: TFloatField;
    tblLabSpecsFRIGHTMARGIN: TFloatField;
    tblLabSpecsBPORTRAIT: TSmallintField;
    tblLabSpecsFHEIGHT: TFloatField;
    tblLabSpecsFWIDTH: TFloatField;
    tblLabSpecsWACCROSS: TIntegerField;
    tblLabSpecsWDOWN: TIntegerField;
    tblLabSpecsFHGAP: TFloatField;
    tblLabSpecsFVGAP: TFloatField;
    tblLabSpecsFUNPRINTABLETOP: TFloatField;
    tblLabSpecsFUNPRINTABLELEFT: TFloatField;
    tblLabSpecsFPAGEHEIGHT: TFloatField;
    tblLabSpecsFPAGEWIDTH: TFloatField;
    tblLabSpecsDSYSDATE: TDateTimeField;
    tblLabSpecsWFONTSIZE: TIntegerField;
    TblEventsRECORDID: TIntegerField;
    TblEventsSTARTTIME: TDateTimeField;
    TblEventsENDTIME: TDateTimeField;
    TblEventsRESOURCEID: TIntegerField;
    TblEventsWCONTACTID: TIntegerField;
    TblEventsWACCOUNTID: TIntegerField;
    TblEventsDESCRIPTION: TStringField;
    TblEventsNOTES: TStringField;
    TblEventsCATEGORY: TIntegerField;
    TblEventsALLDAYEVENT: TSmallintField;
    TblEventsDINGPATH: TStringField;
    TblEventsALARMSET: TSmallintField;
    TblEventsALARMADVANCE: TIntegerField;
    TblEventsALARMADVANCETYPE: TIntegerField;
    TblEventsSNOOZETIME: TDateTimeField;
    TblEventsREPEATCODE: TIntegerField;
    TblEventsREPEATRANGEEND: TDateTimeField;
    TblEventsCUSTOMINTERVAL: TIntegerField;
    TblEventsUSERFIELD0: TStringField;
    TblEventsUSERFIELD1: TStringField;
    TblEventsUSERFIELD2: TStringField;
    TblEventsUSERFIELD3: TStringField;
    TblEventsUSERFIELD4: TStringField;
    TblEventsUSERFIELD5: TStringField;
    TblEventsUSERFIELD6: TStringField;
    TblEventsUSERFIELD7: TStringField;
    TblEventsUSERFIELD8: TStringField;
    TblEventsUSERFIELD9: TStringField;
    tblCreditorWACCOUNTID: TIntegerField;
    tblCreditorWCONTACTID: TIntegerField;
    tblCreditorSPASSWORD: TStringField;
    tblCreditorSPOSTAL1: TStringField;
    tblCreditorSPOSTAL2: TStringField;
    tblCreditorSPOSTAL3: TStringField;
    tblCreditorSPOSTALCODE: TStringField;
    tblCreditorSDELIVERY1: TStringField;
    tblCreditorSDELIVERY2: TStringField;
    tblCreditorSDELIVERY3: TStringField;
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
    tblCreditorSCODE: TStringField;
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
    tblDebtorWACCOUNTID: TIntegerField;
    tblDebtorWCONTACTID: TIntegerField;
    tblDebtorSPASSWORD: TStringField;
    tblDebtorSPOSTAL1: TStringField;
    tblDebtorSPOSTAL2: TStringField;
    tblDebtorSPOSTAL3: TStringField;
    tblDebtorSPOSTALCODE: TStringField;
    tblDebtorSDELIVERY1: TStringField;
    tblDebtorSDELIVERY2: TStringField;
    tblDebtorSDELIVERY3: TStringField;
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
    TblResourcesRESOURCEID: TIntegerField;
    TblResourcesDESCRIPTION: TStringField;
    TblResourcesNOTES: TStringField;
    TblResourcesIMAGEINDEX: TIntegerField;
    TblResourcesRESOURCEACTIVE: TSmallintField;
    TblResourcesUSERFIELD0: TStringField;
    TblResourcesUSERFIELD1: TStringField;
    TblResourcesUSERFIELD2: TStringField;
    TblResourcesUSERFIELD3: TStringField;
    TblResourcesUSERFIELD4: TStringField;
    TblResourcesUSERFIELD5: TStringField;
    TblResourcesUSERFIELD6: TStringField;
    TblResourcesUSERFIELD7: TStringField;
    TblResourcesUSERFIELD8: TStringField;
    TblResourcesUSERFIELD9: TStringField;
    QTasksRECORDID: TIntegerField;
    QTasksRESOURCEID: TIntegerField;
    QTasksCOMPLETE: TSmallintField;
    QTasksDESCRIPTION: TStringField;
    QTasksDETAILS: TBlobField;
    QTasksCREATEDON: TDateTimeField;
    QTasksCOMPLETEDON: TDateTimeField;
    QTasksPRIORITY: TIntegerField;
    QTasksCATEGORY: TIntegerField;
    QTasksDUEDATE: TDateTimeField;
    QTasksUSERFIELD0: TStringField;
    QTasksUSERFIELD1: TStringField;
    QTasksUSERFIELD2: TStringField;
    QTasksUSERFIELD3: TStringField;
    QTasksUSERFIELD4: TStringField;
    QTasksUSERFIELD5: TStringField;
    QTasksUSERFIELD6: TStringField;
    QTasksUSERFIELD7: TStringField;
    QTasksUSERFIELD8: TStringField;
    QTasksUSERFIELD9: TStringField;
    QContactsRECORDID: TIntegerField;
    QContactsRESOURCEID: TIntegerField;
    QContactsFIRSTNAME: TStringField;
    QContactsLASTNAME: TStringField;
    QContactsBIRTHDATE: TDateTimeField;
    QContactsANNIVERSARY: TDateTimeField;
    QContactsGENDER: TStringField;
    QContactsTITLE: TStringField;
    QContactsCOMPANY: TStringField;
    QContactsJOB_POSITION: TStringField;
    QContactsADDRESS: TStringField;
    QContactsCITY: TStringField;
    QContactsSTATE: TStringField;
    QContactsZIP: TStringField;
    QContactsCOUNTRY: TStringField;
    QContactsNOTE: TStringField;
    QContactsPHONE1: TStringField;
    QContactsPHONE2: TStringField;
    QContactsPHONE3: TStringField;
    QContactsPHONE4: TStringField;
    QContactsPHONE5: TStringField;
    QContactsPHONETYPE1: TIntegerField;
    QContactsPHONETYPE2: TIntegerField;
    QContactsPHONETYPE3: TIntegerField;
    QContactsPHONETYPE4: TIntegerField;
    QContactsPHONETYPE5: TIntegerField;
    QContactsCATEGORY: TIntegerField;
    QContactsEMAIL: TStringField;
    QContactsCUSTOM1: TStringField;
    QContactsCUSTOM2: TStringField;
    QContactsCUSTOM3: TStringField;
    QContactsCUSTOM4: TStringField;
    QContactsUSERFIELD0: TStringField;
    QContactsUSERFIELD1: TStringField;
    QContactsUSERFIELD2: TStringField;
    QContactsUSERFIELD3: TStringField;
    QContactsUSERFIELD4: TStringField;
    QContactsUSERFIELD5: TStringField;
    QContactsUSERFIELD6: TStringField;
    QContactsUSERFIELD7: TStringField;
    QContactsUSERFIELD8: TStringField;
    QContactsUSERFIELD9: TStringField;
    QContactsDSYSDATE: TDateTimeField;
    wwqryOpenCreditsWTRANSACTIONID: TIntegerField;
    wwqryOpenCreditsSREFERENCE: TStringField;
    wwqryOpenCreditsDDATE: TDateTimeField;
    wwqryOpenCreditsFAMOUNT: TFloatField;
    wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenCreditsSDESCRIPTION: TStringField;
    wwqryOpenCreditsBUNUSED: TSmallintField;
    qryDocHeadWDOCID: TIntegerField;
    qryDocHeadSDOCNO: TStringField;
    qryDocHeadDDATE: TDateTimeField;
    qryDocHeadBREPEATING: TSmallintField;
    qryDocHeadSMAINACCOUNTCODE: TStringField;
    qryDocHeadSSUBACCOUNTCODE: TStringField;
    qryDocHeadSACCOUNTCODE: TStringField;
    qryDocHeadSDESCRIPTION: TStringField;
    qryDocHeadWMESSAGE1ID: TIntegerField;
    qryDocHeadWMESSAGE2ID: TIntegerField;
    qryDocHeadWMESSAGE3ID: TIntegerField;
    qryDocHeadFINVOICEDISCOUNT: TFloatField;
    qryDocHeadWDELADDRESS1ID: TIntegerField;
    qryDocHeadWDELADDRESS2ID: TIntegerField;
    qryDocHeadWDELADDRESS3ID: TIntegerField;
    qryDocHeadWPOSTAL1ID: TIntegerField;
    qryDocHeadWPOSTAL2ID: TIntegerField;
    qryDocHeadWPOSTAL3ID: TIntegerField;
    qryDocHeadWPOSTALCODEID: TIntegerField;
    qryDocHeadWDELCODEID: TIntegerField;
    qryDocHeadWACCOUNTID: TIntegerField;
    qryDocHeadWSALESMANID: TIntegerField;
    qryDocHeadWCURRENCYID: TIntegerField;
    qryDocHeadWPAYMENTTYPEID: TIntegerField;
    qryDocHeadBPOSTED: TSmallintField;
    qryDocHeadBPRINTED: TSmallintField;
    qryDocHeadWUSERID: TIntegerField;
    qryDocHeadSREFERENCE: TStringField;
    qryDocHeadDDUEDATE: TDateTimeField;
    qryDocHeadWREPORTINGGROUP1ID: TIntegerField;
    qryDocHeadWREPORTINGGROUP2ID: TIntegerField;
    qryDocHeadWTERMS: TIntegerField;
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
    QResourcesRESOURCEID: TIntegerField;
    QResourcesDESCRIPTION: TStringField;
    QResourcesNOTES: TStringField;
    QResourcesIMAGEINDEX: TIntegerField;
    QResourcesRESOURCEACTIVE: TSmallintField;
    QResourcesUSERFIELD0: TStringField;
    QResourcesUSERFIELD1: TStringField;
    QResourcesUSERFIELD2: TStringField;
    QResourcesUSERFIELD3: TStringField;
    QResourcesUSERFIELD4: TStringField;
    QResourcesUSERFIELD5: TStringField;
    QResourcesUSERFIELD6: TStringField;
    QResourcesUSERFIELD7: TStringField;
    QResourcesUSERFIELD8: TStringField;
    QResourcesUSERFIELD9: TStringField;
    TblContactsRECORDID: TIntegerField;
    TblContactsRESOURCEID: TIntegerField;
    TblContactsFIRSTNAME: TStringField;
    TblContactsLASTNAME: TStringField;
    TblContactsBIRTHDATE: TDateTimeField;
    TblContactsANNIVERSARY: TDateTimeField;
    TblContactsGENDER: TStringField;
    TblContactsTITLE: TStringField;
    TblContactsCOMPANY: TStringField;
    TblContactsJOB_POSITION: TStringField;
    TblContactsADDRESS: TStringField;
    TblContactsCITY: TStringField;
    TblContactsSTATE: TStringField;
    TblContactsZIP: TStringField;
    TblContactsCOUNTRY: TStringField;
    TblContactsNOTE: TStringField;
    TblContactsPHONE1: TStringField;
    TblContactsPHONE2: TStringField;
    TblContactsPHONE3: TStringField;
    TblContactsPHONE4: TStringField;
    TblContactsPHONE5: TStringField;
    TblContactsPHONETYPE1: TIntegerField;
    TblContactsPHONETYPE2: TIntegerField;
    TblContactsPHONETYPE3: TIntegerField;
    TblContactsPHONETYPE4: TIntegerField;
    TblContactsPHONETYPE5: TIntegerField;
    TblContactsCATEGORY: TIntegerField;
    TblContactsEMAIL: TStringField;
    TblContactsCUSTOM1: TStringField;
    TblContactsCUSTOM2: TStringField;
    TblContactsCUSTOM3: TStringField;
    TblContactsCUSTOM4: TStringField;
    TblContactsUSERFIELD0: TStringField;
    TblContactsUSERFIELD1: TStringField;
    TblContactsUSERFIELD2: TStringField;
    TblContactsUSERFIELD3: TStringField;
    TblContactsUSERFIELD4: TStringField;
    TblContactsUSERFIELD5: TStringField;
    TblContactsUSERFIELD6: TStringField;
    TblContactsUSERFIELD7: TStringField;
    TblContactsUSERFIELD8: TStringField;
    TblContactsUSERFIELD9: TStringField;
    TblContactsDSYSDATE: TDateTimeField;
    TblTasksRECORDID: TIntegerField;
    TblTasksRESOURCEID: TIntegerField;
    TblTasksCOMPLETE: TSmallintField;
    TblTasksDESCRIPTION: TStringField;
    TblTasksDETAILS: TBlobField;
    TblTasksCREATEDON: TDateTimeField;
    TblTasksCOMPLETEDON: TDateTimeField;
    TblTasksPRIORITY: TIntegerField;
    TblTasksCATEGORY: TIntegerField;
    TblTasksDUEDATE: TDateTimeField;
    TblTasksUSERFIELD0: TStringField;
    TblTasksUSERFIELD1: TStringField;
    TblTasksUSERFIELD2: TStringField;
    TblTasksUSERFIELD3: TStringField;
    TblTasksUSERFIELD4: TStringField;
    TblTasksUSERFIELD5: TStringField;
    TblTasksUSERFIELD6: TStringField;
    TblTasksUSERFIELD7: TStringField;
    TblTasksUSERFIELD8: TStringField;
    TblTasksUSERFIELD9: TStringField;
    tblRepeatingDocsWDOCID: TIntegerField;
    tblRepeatingDocsWGROUPID: TIntegerField;
    qrySalesByGroupWSTOCKTRANSACTIONID: TIntegerField;
    qrySalesByGroupWGROUPID: TIntegerField;
    qrySalesByGroupWGROUPTYPEID: TIntegerField;
    qrySalesByGroupSDESCRIPTION: TStringField;
    qrySalesByGroupSDOCNO: TStringField;
    qrySalesByGroupDDATE: TDateTimeField;
    qrySalesByGroupFSELLINGPRICE: TFloatField;
    qrySalesByGroupFCOSTPRICE: TFloatField;
    qrySalesByGroupFQTY: TFloatField;
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
    tblPayConWPAYROLLID: TIntegerField;
    tblPayConDDATE: TDateTimeField;
    tblPayConSDESCRIPTION: TStringField;
    tblPayConBACTIVE: TSmallintField;
    tblPayConBCURRENTYEAR: TSmallintField;
    tblPayConWPROFILEID: TIntegerField;
    tblPayConDSYSDATE: TDateTimeField;
    wwqryOpenDebitsWTRANSACTIONID: TIntegerField;
    wwqryOpenDebitsSREFERENCE: TStringField;
    wwqryOpenDebitsDDATE: TDateTimeField;
    wwqryOpenDebitsFAMOUNT: TFloatField;
    wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField;
    wwqryOpenDebitsSDESCRIPTION: TStringField;
    wwqryOpenDebitsBUNUSED: TSmallintField;
    tblTmpAgeAnalWACCOUNTID: TIntegerField;
    tblTmpAgeAnalWACCOUNTTYPEID: TIntegerField;
    tblTmpAgeAnalSACCOUNTCODE: TStringField;
    tblTmpAgeAnalSDESCRIPTION: TStringField;
    tblTmpAgeAnalFCURRENT: TFloatField;
    tblTmpAgeAnalF30DAYS: TFloatField;
    tblTmpAgeAnalF60DAYS: TFloatField;
    tblTmpAgeAnalF90DAYS: TFloatField;
    tblTmpAgeAnalFBBF: TFloatField;
    qrySalesByProductSSTOCKCODE: TStringField;
    qrySalesByProductDDATE: TDateTimeField;
    qrySalesByProductWSTOCKTRANSACTIONID: TIntegerField;
    qrySalesByProductSDESCRIPTION: TStringField;
    qrySalesByProductSDOCNO: TStringField;
    qrySalesByProductFSELLINGPRICE: TFloatField;
    qrySalesByProductFCOSTPRICE: TFloatField;
    qrySalesByProductFQTY: TFloatField;
    qrySalesByProductWTYPEID: TIntegerField;
    qryProductBySalespersonWSTOCKTRANSACTIONID: TIntegerField;
    qryProductBySalespersonWGROUPID: TIntegerField;
    qryProductBySalespersonWGROUPTYPEID: TIntegerField;
    qryProductBySalespersonSDESCRIPTION: TStringField;
    qryProductBySalespersonSDOCNO: TStringField;
    qryProductBySalespersonDDATE: TDateTimeField;
    qryProductBySalespersonFSELLINGPRICE: TFloatField;
    qryProductBySalespersonFCOSTPRICE: TFloatField;
    qryProductBySalespersonFQTY: TFloatField;
    qryProductBySalespersonSDESCRIPTION_1: TStringField;
    qryProductBySalespersonWSTOCKID: TIntegerField;
    qrySalespersonByProductSSTOCKCODE: TStringField;
    qrySalespersonByProductDDATE: TDateTimeField;
    qrySalespersonByProductWSTOCKTRANSACTIONID: TIntegerField;
    qrySalespersonByProductWSALESMANID: TIntegerField;
    qrySalespersonByProductSDESCRIPTION: TStringField;
    qrySalespersonByProductSDOCNO: TStringField;
    qrySalespersonByProductFSELLINGPRICE: TFloatField;
    qrySalespersonByProductFCOSTPRICE: TFloatField;
    qrySalespersonByProductFQTY: TFloatField;
    qrySalesBySalespersonWSTOCKTRANSACTIONID: TIntegerField;
    qrySalesBySalespersonWGROUPID: TIntegerField;
    qrySalesBySalespersonSDESCRIPTION: TStringField;
    qrySalesBySalespersonSDOCNO: TStringField;
    qrySalesBySalespersonDDATE: TDateTimeField;
    qrySalesBySalespersonFSELLINGPRICE: TFloatField;
    qrySalesBySalespersonFCOSTPRICE: TFloatField;
    qrySalesBySalespersonFQTY: TFloatField;
    qrySalesBySalespersonSSTOCKCODE: TStringField;
    qrySalesBySalespersonWDOCTYPEID: TIntegerField;
    qrySalesBySalespersonSACCOUNTCODE: TStringField;
    qrySalesBySalespersonWREPORTINGGROUP1ID: TIntegerField;
    qrySalesBySalespersonWREPORTINGGROUP2ID: TIntegerField;
    tblEmpSourceWSOURCEID: TIntegerField;
    tblEmpSourceWUNITID: TIntegerField;
    tblEmpSourceSDESCRIPTION: TStringField;
    tblEmpSourceWACCOUNTID: TIntegerField;
    tblEmpSourceWSOURCETYPEID: TIntegerField;
    tblEmpSourceBTAXABLE: TSmallintField;
    tblEmpSourceBACTIVE: TSmallintField;
    tblEmpSourceWPARENTSOURCEID: TIntegerField;
    tblEmpSourceSFORMULA: TStringField;
    tblEmpSourceWPROFILEID: TIntegerField;
    tblEmpSourceBFORINFO: TIntegerField;
    tblEmpSourceWDRACCOUNTID: TIntegerField;
    tblEmpSourceWCRACCOUNTID: TIntegerField;
    tblEmpSourceDSYSDATE: TDateTimeField;
    tblRepCellsWREPORTID: TIntegerField;
    tblRepCellsWCOLUMNID: TIntegerField;
    tblRepCellsWROWID: TIntegerField;
    tblRepCellsSVALUE: TStringField;
    tblRepCellsDSYSDATE: TDateTimeField;
    QryPosSalesReportSDESCRIPTION: TStringField;
    QryPosSalesReportSDOCNO: TStringField;
    QryPosSalesReportDDATE: TDateTimeField;
    QryPosSalesReportFSELLINGPRICE: TFloatField;
    QryPosSalesReportFQTYSHIPPED: TFloatField;
    QryPosSalesReportSDESCRIPTION_1: TStringField;
    QryPosSalesReportSSTOCKCODE: TStringField;
    QryPosSalesReportWTYPEID: TIntegerField;
    QryPosSalesReportSACCOUNTCODE: TStringField;
    QryPosSalesReportWREPORTINGGROUP1ID: TIntegerField;
    QryPosSalesReportWREPORTINGGROUP2ID: TIntegerField;
    QryPosSalesReportFINCLUSIVEAMT: TFloatField;
    QryPosSalesReportFEXCLUSIVEAMT: TFloatField;
    Temp_1SMAINACCOUNTCODE: TStringField;
    Temp_1SSUBACCOUNTCODE: TStringField;
    Temp_1WDOCTYPEID: TIntegerField;
    Temp_1SDESCRIPTION: TStringField;
    Temp_1WSTOCKTRANSACTIONID: TIntegerField;
    Temp_1WGROUPID: TIntegerField;
    Temp_1SDOCNO: TStringField;
    Temp_1DDATE: TDateTimeField;
    Temp_1WSALESPERSONID: TIntegerField;
    Temp_1SSTOCKCODE: TStringField;
    Temp_1FSELLINGPRICE: TFloatField;
    Temp_1FCOSTPRICE: TFloatField;
    Temp_1FQTY: TFloatField;
    QryAccountListWACCOUNTID: TIntegerField;
    QryAccountListSMAINACCOUNTCODE: TStringField;
    QryAccountListSSUBACCOUNTCODE: TStringField;
    QryAccountListWACCOUNTTYPEID: TIntegerField;
    QryAccountListSDESCRIPTION: TStringField;
    QryAccountListWREPORTINGGROUP1ID: TIntegerField;
    QryAccountListWREPORTINGGROUP2ID: TIntegerField;
    QryAccountListBSUBACCOUNTS: TSmallintField;
    QryAccountListBINCOMEEXPENSE: TSmallintField;
    QryAccountListSACCOUNTCODE: TStringField;
    QryAccountListDSYSDATE: TDateTimeField;
    QryAccountListWPROFILEID: TIntegerField;
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
    qryBatchTypesListWBATCHTYPEID: TIntegerField;
    qryBatchTypesListBCASHBOOK: TSmallintField;
    qryBatchTypesListSDESCRIPTION: TStringField;
    qryBatchTypesListWCONTRAACCOUNTID: TIntegerField;
    qryBatchTypesListBCONTRAPERLINE: TSmallintField;
    qryBatchTypesListDSYSDATE: TDateTimeField;
    qryBatchTypesListSCONTRANAME: TStringField;
    qryBatchTypesListWACCOUNTID: TIntegerField;
    qryTransactionReportWACCOUNTID: TIntegerField;
    qryTransactionReportSMAINACCOUNTCODE: TStringField;
    qryTransactionReportSSUBACCOUNTCODE: TStringField;
    qryTransactionReportSDESCRIPTION: TStringField;
    qryTransactionReportWACCOUNTTYPEID: TIntegerField;
    qryTransactionReportDDATE: TDateTimeField;
    qryTransactionReportWPERIODID: TIntegerField;
    qryTransactionReportWBATCHTYPEID: TIntegerField;
    qryTransactionReportSREFERENCE: TStringField;
    qryTransactionReportWDESCRIPTIONID: TIntegerField;
    qryTransactionReportFAMOUNT: TFloatField;
    qryTransactionReportSACCOUNTCODE: TStringField;
    qryTransactionReportWTRANSACTIONID: TIntegerField;
    qryTransactionReportFTAXRATE: TFloatField;
    qryTransactionReportWJOBCODEID: TIntegerField;
    qryStockMovementSSTOCKCODE: TStringField;
    qryStockMovementLDESCRIPTION: TStringField;
    qryStockMovementDDATE: TDateTimeField;
    qryStockMovementSDESCRIPTION: TStringField;
    qryStockMovementSDESCRIPTION_1: TStringField;
    qryStockMovementSDOCNO: TStringField;
    qryStockMovementWDOCTYPEID: TIntegerField;
    qryStockMovementWSTOCKID: TIntegerField;
    qryStockMovementFQTY: TFloatField;
    qryStockMovementFCOSTPRICE: TFloatField;
    qryStockMovementFOPENINGQTY: TFloatField;
    qryStockMovementFSELLINGPRICE: TFloatField;
    qryStockMovementWSALESMANID: TIntegerField;
    qrySalesByCustomerSMAINACCOUNTCODE: TStringField;
    qrySalesByCustomerSSUBACCOUNTCODE: TStringField;
    qrySalesByCustomerSDESCRIPTION: TStringField;
    qrySalesByCustomerWSTOCKTRANSACTIONID: TIntegerField;
    qrySalesByCustomerSDOCNO: TStringField;
    qrySalesByCustomerDDATE: TDateTimeField;
    qrySalesByCustomerWDOCTYPEID: TIntegerField;
    qrySalesByCustomerFSELLINGPRICE: TFloatField;
    qrySalesByCustomerFCOSTPRICE: TFloatField;
    qrySalesByCustomerFQTY: TFloatField;
    qrySalesByCustomerSACCOUNTCODE: TStringField;
    qrySalesByCustomerWACCOUNTTYPEID: TIntegerField;
    qrySalesByCustomerBEXCLUSIVE: TSmallintField;
    QTaskActionTASKACTIONID: TIntegerField;
    QTaskActionEVENTID: TIntegerField;
    QTaskActionINVOICEID: TIntegerField;
    QTaskActionACCOUNTID: TIntegerField;
    QTaskActionWGROUPID: TIntegerField;
    QTaskActionWTYPEID: TIntegerField;
    QTaskActionSDESCRIPTION: TStringField;
    QTaskActionSDOCNO: TStringField;
    QTaskActionFDOCAMOUNT: TFloatField;
    QTaskActionSREFERENCE: TStringField;
    QTaskActionWGROUPTYPEID: TIntegerField;
    QTaskActionSDESCRIPTION_1: TStringField;
    QTaskActionSACCOUNTCODE: TStringField;
    qrPrnDocLinesWSTOCKID: TIntegerField;
    qrPrnDocLinesSSTOCKCODE: TStringField;
    qrPrnDocLinesSBARCODENUMBER: TStringField;
    qrPrnDocLinesSDESCRIPTION: TStringField;
    qrPrnDocLinesWREPORTINGGROUP1ID: TIntegerField;
    qrPrnDocLinesWREPORTINGGROUP2ID: TIntegerField;
    qrPrnDocLinesWCOSTACCOUNTID: TIntegerField;
    qrPrnDocLinesWINPUTTAXID: TIntegerField;
    qrPrnDocLinesWOUTPUTTAXID: TIntegerField;
    qrPrnDocLinesFOPENINGAVECOST: TFloatField;
    qrPrnDocLinesFQTYONHAND: TFloatField;
    qrPrnDocLinesFOPENINGQTY: TFloatField;
    qrPrnDocLinesFINVQTYONHAND: TFloatField;
    qrPrnDocLinesFREORDERQTY: TFloatField;
    qrPrnDocLinesWSALESACCOUNTID: TIntegerField;
    qrPrnDocLinesBAPPLYINVOICEDISCOUNT: TSmallintField;
    qrPrnDocLinesWSTOCKACCOUNTID: TIntegerField;
    qrPrnDocLinesFSELLINGPRICE1: TFloatField;
    qrPrnDocLinesFSELLINGPRICE2: TFloatField;
    qrPrnDocLinesFSELLINGPRICE3: TFloatField;
    qrPrnDocLinesFUNITAVECOST: TFloatField;
    qrPrnDocLinesFUNITCOST: TFloatField;
    qrPrnDocLinesWUNITID: TIntegerField;
    qrPrnDocLinesDSYSDATE: TDateTimeField;
    qrPrnDocLinesBAPPLYTAX: TSmallintField;
    qrPrnDocLinesWINPUTTAX2ID: TIntegerField;
    qrPrnDocLinesBTAXABLE: TSmallintField;
    qrPrnDocLinesWSUPPLIER1ID: TIntegerField;
    qrPrnDocLinesWSUPPLIER2ID: TIntegerField;
    qrPrnDocLinesWSTOCKTYPEID: TIntegerField;
    qrPrnDocLinesWOUTPUTTAX2ID: TIntegerField;
    qrPrnDocLinesWPROFILEID: TIntegerField;
    qrPrnDocLinesBDISABLED: TSmallintField;
    qrPrnDocLinesWPERENTID: TIntegerField;
    qrPrnDocLinesWLOCATIONID: TIntegerField;
    qrPrnDocLinesWFILENAMEID: TIntegerField;
    qrPrnDocLinesSEXTRADESC: TStringField;
    qrPrnDocLinesWDOCLINEID: TIntegerField;
    qrPrnDocLinesWDOCID: TIntegerField;
    qrPrnDocLinesWSTOCKID_1: TIntegerField;
    qrPrnDocLinesWLINETYPEID: TIntegerField;
    qrPrnDocLinesWDESCRIPTIONID: TIntegerField;
    qrPrnDocLinesFQTYORDERED: TFloatField;
    qrPrnDocLinesFQTYSHIPPED: TFloatField;
    qrPrnDocLinesFSELLINGPRICE: TFloatField;
    qrPrnDocLinesFITEMDISCOUNT: TFloatField;
    qrPrnDocLinesWTAXID: TIntegerField;
    qrPrnDocLinesFEXCLUSIVEAMT: TFloatField;
    qrPrnDocLinesFINCLUSIVEAMT: TFloatField;
    qrPrnDocLinesFTAXAMOUNT: TFloatField;
    qrPrnDocLinesDSYSDATE_1: TDateTimeField;
    qrPrnDocLinesSUNIT: TStringField;
    qrPrnDocLinesSSTOCKCODE_1: TStringField;
    qrPrnDocLinesWPROFILEID_1: TIntegerField;
    qrPrnDocLinesWSERIALNOID: TIntegerField;
    TblReconBank: TuniQuery;
    TblReconBankSREFERENCE: TStringField;
    TblReconBankSACCOUNT: TStringField;
    TblReconBankSDESCRIPTION: TStringField;
    TblReconBankFDEBIT: TFloatField;
    TblReconBankFAMOUNT: TFloatField;
    TblReconBankSTAX: TStringField;
    TblReconBankDDATE: TDateTimeField;
    TblReconBankFCREDIT: TFloatField;
    TblReconBankSCONTRAACCOUNT: TStringField;
    TblReconBankFTAXAMOUNT: TFloatField;
    TblReconBankDALLOCATEDDATE: TDateTimeField;
    TblReconBankBRECONCILED: TSmallintField;
    TblReconBankBEXCLUSIVE: TSmallintField;
    TblReconBankWACCOUNTID: TIntegerField;
    TblReconBankWLINEID: TIntegerField;
    TblReconBankFQTY: TFloatField;
    TblReconBankWPROFILEID: TIntegerField;
    TblReconBankWTAX2ID: TIntegerField;
    TblReconBankNOTUSED: TFloatField;
    TblReconBankSPROFILE: TStringField;
    TblReconBankSJOBCODE: TStringField;
    TblReconBankSTAX2: TStringField;
    TblReconBankBLINKED: TSmallintField;
    TblReconBankDSYSDATE: TDateTimeField;
    TblReconBankFTAX2AMOUNT: TFloatField;
    qryDebtAgeWACCOUNTID: TIntegerField;
    qryDebtAgeSDESCRIPTION: TStringField;
    qryDebtAgeSACCOUNTCODE: TStringField;
    qryDebtAgeWTRANSACTIONID: TIntegerField;
    qryDebtAgeFOUTSTANDINGAMOUNT: TFloatField;
    qryDebtAgeDDATE: TDateTimeField;
    qryDebtAgeSDESCRIPTION_1: TStringField;
    qryDebtAgeSREFERENCE: TStringField;
    qryDebtAgeFAMOUNT: TFloatField;
    qryDebtAgeWREPORTINGGROUP1ID: TIntegerField;
    qryDebtAgeWREPORTINGGROUP2ID: TIntegerField;
    qryDebtAgeSREFERENCE_1: TStringField;
    qryDebtAgeFAMOUNT_1: TFloatField;
    qryCreditAgeWACCOUNTID: TIntegerField;
    qryCreditAgeSDESCRIPTION: TStringField;
    qryCreditAgeSACCOUNTCODE: TStringField;
    qryCreditAgeWTRANSACTIONID: TIntegerField;
    qryCreditAgeFOUTSTANDINGAMOUNT: TFloatField;
    qryCreditAgeDDATE: TDateTimeField;
    qryCreditAgeSDESCRIPTION_1: TStringField;
    qryCreditAgeSREFERENCE: TStringField;
    qryCreditAgeFAMOUNT: TFloatField;
    qryCreditAgeWREPORTINGGROUP1ID: TIntegerField;
    qryCreditAgeWREPORTINGGROUP2ID: TIntegerField;
    qryCreditAgeSREFERENCE_1: TStringField;
    qryCreditAgeFAMOUNT_1: TFloatField;
    tblRepHeadWREPORTID: TIntegerField;
    tblRepHeadSREPORTNAME: TStringField;
    tblRepHeadSTITLE1: TStringField;
    tblRepHeadSTITLE2: TStringField;
    tblRepHeadBDISPLAYDECIMAL: TSmallintField;
    tblRepHeadBCOMPRESSPRINT: TSmallintField;
    tblRepHeadWNOOFCOLUMNS: TIntegerField;
    tblRepHeadWREPORTTYPEID: TIntegerField;
    tblRepHeadDSYSDATE: TDateTimeField;
    qryCustomerByProductSSTOCKCODE: TStringField;
    qryCustomerByProductDDATE: TDateTimeField;
    qryCustomerByProductWSTOCKTRANSACTIONID: TIntegerField;
    qryCustomerByProductSDESCRIPTION: TStringField;
    qryCustomerByProductSDOCNO: TStringField;
    qryCustomerByProductFSELLINGPRICE: TFloatField;
    qryCustomerByProductFCOSTPRICE: TFloatField;
    qryCustomerByProductFQTY: TFloatField;
    qryCustomerByProductWACCOUNTID: TIntegerField;
    qryCustomerByProductSACCOUNTCODE: TStringField;
    qryCustomerByProductACCSDESCRIPTION: TStringField;
    qryCustomerBySalespersonSMAINACCOUNTCODE: TStringField;
    qryCustomerBySalespersonSSUBACCOUNTCODE: TStringField;
    qryCustomerBySalespersonSDESCRIPTION: TStringField;
    qryCustomerBySalespersonWSALESMANID: TIntegerField;
    qryCustomerBySalespersonWACCOUNTID: TIntegerField;
    qryCustomerBySalespersonDDATE: TDateTimeField;
    qryCustomerBySalespersonSUMQTY: TFloatField;
    qryCustomerBySalespersonTOTALNETTSALES: TFloatField;
    qryCustomerBySalespersonTOTALNETTCOST: TFloatField;
    qryCustomerBySalespersonWGROUPID: TIntegerField;
    qryCustomerBySalespersonSDESCRIPTION_1: TStringField;
    qryProductByCustomerSMAINACCOUNTCODE: TStringField;
    qryProductByCustomerSSUBACCOUNTCODE: TStringField;
    qryProductByCustomerSDESCRIPTION: TStringField;
    qryProductByCustomerWSTOCKID: TIntegerField;
    qryProductByCustomerWACCOUNTID: TIntegerField;
    qryProductByCustomerDDATE: TDateTimeField;
    qryProductByCustomerSUMQTY: TFloatField;
    qryProductByCustomerSUMNETTSALES: TFloatField;
    qryProductByCustomerSUMNETTCOST: TFloatField;
    qryProductByCustomerSSTOCKCODE: TStringField;
    qryProductByCustomerSDESCRIPTION_1: TStringField;
    qrBalSheetAccountWACCOUNTID: TIntegerField;
    qrBalSheetAccountSMAINACCOUNTCODE: TStringField;
    qrBalSheetAccountSSUBACCOUNTCODE: TStringField;
    qrBalSheetAccountWACCOUNTTYPEID: TIntegerField;
    qrBalSheetAccountSDESCRIPTION: TStringField;
    qrBalSheetAccountWREPORTINGGROUP1ID: TIntegerField;
    qrBalSheetAccountWREPORTINGGROUP2ID: TIntegerField;
    qrBalSheetAccountBSUBACCOUNTS: TSmallintField;
    qrBalSheetAccountBINCOMEEXPENSE: TSmallintField;
    qrBalSheetAccountSACCOUNTCODE: TStringField;
    qrBalSheetAccountWPARENTGROUP1ID: TIntegerField;
    qrBalSheetAccountWPARENTGROUP2ID: TIntegerField;
    qrBalSheetAccountWSORTNO: TIntegerField;
    tblBackOrderSDescription: TStringField;
    tblStockAdSInputTax: TStringField;
    tblStockAdSOutPutTax: TStringField;
    tblStockAdSCostAccount: TStringField;
    tblStockAdSSaleSACCOUNT: TStringField;
    tblStockAdSStockAccount: TStringField;
    ZCalTotals: TuniQuery;
    ZSQLMonitor1: TUniSQLMonitor;
    ZQReportOpNextNum: TuniQuery;
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
    tblTmpAgeAnalFTOTAL: TFloatField;
    ZSqContacts: TZSequence;
    ZSqEvents: TZSequence;
    ZSqResource: TZSequence;
    ZSqTaskAction: TZSequence;
    ZSqTasks: TZSequence;
    ZQGenBatches: TuniQuery;
    ZSequence1: TZSequence;
    ZSqSYSPARAMS: TZSequence;
    CdsBankDnlSTransID: TStringField;
    CdsBankDnlWLineTypeID: TIntegerField;
    CdsBankDnlWSourceID: TIntegerField;
    CdsBankDnlWBankID: TIntegerField;
    CdsBankDnlWTransTypeID: TIntegerField;
    CdsBankDnlSACCOUNTCODE: TStringField;
    CdsBankDnlFAmount: TFloatField;
    CdsBankDnlSMemo: TStringField;
    CdsBankDnlSReference: TStringField;
    CdsBankDnlBReconciled: TSmallintField;
    CdsBankDnlSDescription: TStringField;
    CdsBankDnlWCurrencyID: TIntegerField;
    CdsBankDnlWAccountID: TIntegerField;
    CdsBankDnlWLineID: TIntegerField;
    CdsBankDnlWTcTransID: TIntegerField;
    CdsBankDnlWProfileID: TIntegerField;
    CdsBankDnlWAutoMatchID: TIntegerField;
    CdsBankDnlBUseForBatch: TSmallintField;
    CdsBankDnlDSysDate: TDateTimeField;
    CdsBankDnlWAmtSgn: TIntegerField;
    CdsBankDnlDTransDate: TDateTimeField;
    CdsBankDnlDPostedDate: TDateTimeField;
    ZSAddressPerAccount: TZSequence;
    ZQMessage: TuniQuery;
    ZUSQLMessage: TUniUpdateSql;
    ZQMessageWMESSAGEID: TIntegerField;
    ZQMessageSDESCRIPTION: TStringField;
    ZQMessageSEXTRADESCRIPTION: TStringField;
    ZQStock: TuniQuery;
    ZUSQLStock: TUniUpdateSql;
    ZQStockWSTOCKID: TIntegerField;
    ZQStockSSTOCKCODE: TStringField;
    ZQStockSBARCODENUMBER: TStringField;
    ZQStockSDESCRIPTION: TStringField;
    ZQStockWREPORTINGGROUP1ID: TIntegerField;
    ZQStockWREPORTINGGROUP2ID: TIntegerField;
    ZQStockWCOSTACCOUNTID: TIntegerField;
    ZQStockWINPUTTAXID: TIntegerField;
    ZQStockWOUTPUTTAXID: TIntegerField;
    ZQStockFOPENINGAVECOST: TFloatField;
    ZQStockFQTYONHAND: TFloatField;
    ZQStockFOPENINGQTY: TFloatField;
    ZQStockFINVQTYONHAND: TFloatField;
    ZQStockFREORDERQTY: TFloatField;
    ZQStockWSALESACCOUNTID: TIntegerField;
    ZQStockBAPPLYINVOICEDISCOUNT: TSmallintField;
    ZQStockWSTOCKACCOUNTID: TIntegerField;
    ZQStockFSELLINGPRICE1: TFloatField;
    ZQStockFSELLINGPRICE2: TFloatField;
    ZQStockFSELLINGPRICE3: TFloatField;
    ZQStockFUNITAVECOST: TFloatField;
    ZQStockFUNITCOST: TFloatField;
    ZQStockWUNITID: TIntegerField;
    ZQStockDSYSDATE: TDateTimeField;
    ZQStockBAPPLYTAX: TSmallintField;
    ZQStockWINPUTTAX2ID: TIntegerField;
    ZQStockBTAXABLE: TSmallintField;
    ZQStockWSUPPLIER1ID: TIntegerField;
    ZQStockWSUPPLIER2ID: TIntegerField;
    ZQStockWSTOCKTYPEID: TIntegerField;
    ZQStockWOUTPUTTAX2ID: TIntegerField;
    ZQStockWPROFILEID: TIntegerField;
    ZQStockBDISABLED: TSmallintField;
    ZQStockWPERENTID: TIntegerField;
    ZQStockWLOCATIONID: TIntegerField;
    ZQStockWFILENAMEID: TIntegerField;
    ZQStockSEXTRADESC: TStringField;
    ZQStockINTAXCODE: TStringField;
    ZQStockINTAXDESC: TStringField;
    ZQStockINTAXRATE: TFloatField;
    ZQStockOUTTAXCODE: TStringField;
    ZQStockOUTTAXDESC: TStringField;
    ZQStockOUTTAXRATE: TFloatField;
    ZQStockCOSACCCODE: TStringField;
    ZQStockCOSACCDESC: TStringField;
    ZQStockSALESACCCODE: TStringField;
    ZQStockSALESACCDESC: TStringField;
    ZQStockSTOCKACCCODE: TStringField;
    ZQStockSTOCKACCDESC: TStringField;
    ZQDocLine: TuniQuery;
    ZSQLDocLine: TUniUpdateSql;
    ZQDocLineWDOCLINEID: TIntegerField;
    ZQDocLineWDOCID: TIntegerField;
    ZQDocLineWSTOCKID: TIntegerField;
    ZQDocLineWLINETYPEID: TIntegerField;
    ZQDocLineWDESCRIPTIONID: TIntegerField;
    ZQDocLineFQTYORDERED: TFloatField;
    ZQDocLineFQTYSHIPPED: TFloatField;
    ZQDocLineFSELLINGPRICE: TFloatField;
    ZQDocLineFITEMDISCOUNT: TFloatField;
    ZQDocLineWTAXID: TIntegerField;
    ZQDocLineFEXCLUSIVEAMT: TFloatField;
    ZQDocLineFINCLUSIVEAMT: TFloatField;
    ZQDocLineFTAXAMOUNT: TFloatField;
    ZQDocLineDSYSDATE: TDateTimeField;
    ZQDocLineSUNIT: TStringField;
    ZQDocLineSSTOCKCODE: TStringField;
    ZQDocLineWPROFILEID: TIntegerField;
    ZQDocLineWSERIALNOID: TIntegerField;
    ZQDocLineWACCOUNTID: TIntegerField;
    ZQDocLineSACCOUNTCODE: TStringField;
    ZQDocLineSMAINACCOUNTCODE: TStringField;
    ZQDocLineSSUBACCOUNTCODE: TStringField;
    ZQDocLineSDESCRIPTION: TStringField;
    ZQDocLineWACCOUNTTYPEID: TIntegerField;
    ZQDocLineWREPORTINGGROUP1ID: TIntegerField;
    ZQDocLineWREPORTINGGROUP2ID: TIntegerField;
    ZQDocLineBSUBACCOUNTS: TSmallintField;
    ZQDocLineBINCOMEEXPENSE: TSmallintField;
    ZQDocLineDSYSDATE_1: TDateTimeField;
    ZQDocLineWPROFILEID_1: TIntegerField;
    qryDebtStatementWACCOUNTID: TIntegerField;
    qryDebtStatementSDESCRIPTION: TStringField;
    qryDebtStatementWTRANSACTIONID: TIntegerField;
    qryDebtStatementFAMOUNT: TFloatField;
    qryDebtStatementDDATE: TDateTimeField;
    qryDebtStatementFOUTSTANDINGAMOUNT: TFloatField;
    qryDebtStatementSDESCRIPTION_1: TStringField;
    qryDebtStatementSREFERENCE: TStringField;
    qryDebtStatementSPOSTAL1: TStringField;
    qryDebtStatementSPOSTAL2: TStringField;
    qryDebtStatementSPOSTAL3: TStringField;
    qryDebtStatementSPOSTALCODE: TStringField;
    qryDebtStatementWACCOUNTTYPEID: TIntegerField;
    qryDebtStatementWDESCRIPTIONID: TIntegerField;
    qryDebtStatementSACCOUNTCODE: TStringField;
    qryDebtStatementFTAXRATE: TFloatField;
    qryDebtStatementWTAXACCOUNTID: TIntegerField;
    qryDebtStatementSMESSAGE: TStringField;
    qryDebtStatementWCONTACTID: TIntegerField;
    tblGlobal: TuniTable;
    tblGlobalWNEWACCOUNTID: TIntegerField;
    tblGlobalWNEWBACKORDERID: TIntegerField;
    tblGlobalWNEWCONTACTID: TIntegerField;
    tblGlobalWNEWBATCHTYPEID: TIntegerField;
    tblGlobalWNEWBATCHID: TIntegerField;
    tblGlobalWNEWGROUPID: TIntegerField;
    tblGlobalWNEWCURRENCYID: TIntegerField;
    tblGlobalWNEWDOCID: TIntegerField;
    tblGlobalWNEWLABSPECSID: TIntegerField;
    tblGlobalWNEWREPORTID: TIntegerField;
    tblGlobalWNEWTRANSACTIONID: TIntegerField;
    tblGlobalWNEWSTOCKID: TIntegerField;
    tblGlobalWNEWUNITID: TIntegerField;
    tblGlobalWNEWUSERID: TIntegerField;
    tblGlobalWNEWMESSAGEID: TIntegerField;
    tblGlobalWNEWSTOCKTRANSID: TIntegerField;
    ZQBatControl: TuniQuery;
    ZUSQLBatCon: TUniUpdateSql;
    ZQBatControlWBATCHID: TIntegerField;
    ZQBatControlWUSERID: TIntegerField;
    ZQBatControlWBATCHTYPEID: TIntegerField;
    ZQBatControlSBATCHNUMBER: TStringField;
    ZQBatControlBPOSTED: TSmallintField;
    ZQBatControlBIMPORTED: TSmallintField;
    ZQBatControlBDOCSOURCE: TSmallintField;
    ZQBatControlWLINECOUNT: TIntegerField;
    ZQBatControlSFILENAME: TStringField;
    ZQBatControlWDOCID: TIntegerField;
    ZQBatControlDSYSDATE: TDateTimeField;
    ZQBatControlWINITBATID: TIntegerField;
    ZQBatControlSALIAS: TStringField;
    ZQBatControlSUNIQUEID: TStringField;
    ZQDocHead: TuniQuery;
    ZUSQLDocHead: TUniUpdateSql;
    ZQDocHeadWDOCID: TIntegerField;
    ZQDocHeadSDOCNO: TStringField;
    ZQDocHeadWTYPEID: TIntegerField;
    ZQDocHeadDDATE: TDateTimeField;
    ZQDocHeadDALLOCATEDDATE: TDateTimeField;
    ZQDocHeadWACCOUNTID: TIntegerField;
    ZQDocHeadWPAYMENTTYPEID: TIntegerField;
    ZQDocHeadWPOSTAL1ID: TIntegerField;
    ZQDocHeadWPOSTAL2ID: TIntegerField;
    ZQDocHeadWPOSTAL3ID: TIntegerField;
    ZQDocHeadWPOSTALCODEID: TIntegerField;
    ZQDocHeadWMESSAGE1ID: TIntegerField;
    ZQDocHeadWMESSAGE2ID: TIntegerField;
    ZQDocHeadWMESSAGE3ID: TIntegerField;
    ZQDocHeadFINVOICEDISCOUNT: TFloatField;
    ZQDocHeadWSALESMANID: TIntegerField;
    ZQDocHeadSREFERENCE: TStringField;
    ZQDocHeadWDELADDRESS1ID: TIntegerField;
    ZQDocHeadWDELADDRESS2ID: TIntegerField;
    ZQDocHeadWDELADDRESS3ID: TIntegerField;
    ZQDocHeadWDELCODEID: TIntegerField;
    ZQDocHeadBPRINTED: TSmallintField;
    ZQDocHeadBPOSTED: TSmallintField;
    ZQDocHeadWREPORTINGGROUP1ID: TIntegerField;
    ZQDocHeadWREPORTINGGROUP2ID: TIntegerField;
    ZQDocHeadWPAYMENTGROUPID: TIntegerField;
    ZQDocHeadBEXCLUSIVE: TSmallintField;
    ZQDocHeadWCURRENCYID: TIntegerField;
    ZQDocHeadFDOCAMOUNT: TFloatField;
    ZQDocHeadFTAXAMOUNT: TFloatField;
    ZQDocHeadBREPEATING: TSmallintField;
    ZQDocHeadDSYSDATE: TDateTimeField;
    ZQDocHeadWSOURCETYPEID: TIntegerField;
    ZQDocHeadWPROFILEID: TIntegerField;
    ZQDocHeadWTERMS: TIntegerField;
    ZQDocHeadWJOBCODEID: TIntegerField;
    ZQDocHeadDDUEDATE: TDateTimeField;
    ZQDocHeadWUSERID: TIntegerField;
    ZUSQLTransAction: TUniUpdateSql;
    ZQTransAction: TuniQuery;
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
    ZQOILinks: TuniQuery;
    ZUSQLOIlinks: TUniUpdateSql;
    ZSQLGenProccessor: TUniScript;
    tblTransactionBEXCLUSIVE: TSmallintField;
    tblTransactionWREPORTINGGROUP1ID: TIntegerField;
    tblTransactionWREPORTINGGROUP2ID: TIntegerField;
    ZQTransActionBEXCLUSIVE: TSmallintField;
    ZQTransActionWREPORTINGGROUP1ID: TIntegerField;
    ZQTransActionWREPORTINGGROUP2ID: TIntegerField;
    tblBatchWTAXID: TIntegerField;
    tblBatchWCONTRAACCOUNTID: TIntegerField;
    tblBatchWREPORTINGGROUP1ID: TIntegerField;
    tblBatchWREPORTINGGROUP2ID: TIntegerField;
    tblBatchWLINKEDID: TIntegerField;
    tblBatchRefTotalsWTAXID: TIntegerField;
    tblBatchRefTotalsWCONTRAACCOUNTID: TIntegerField;
    tblBatchRefTotalsWLINKEDID: TIntegerField;
    tblBatchRefTotalsWREPORTINGGROUP1ID: TIntegerField;
    tblBatchRefTotalsWREPORTINGGROUP2ID: TIntegerField;
    ZQTransActionWLINKEDID: TIntegerField;
    tblTransactionWLINKEDID: TIntegerField;
    qGenBatchId: TuniQuery;
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
    tblOILinksWOILINKSID: TIntegerField;
    ZSeqIOLinks: TZSequence;
    tblPeriodsWYEARID: TIntegerField;
    QryTAccountDr: TuniQuery;
    QryTAccountDrDDATE: TDateTimeField;
    QryTAccountDrSREFERENCE: TStringField;
    QryTAccountDrFAMOUNT: TFloatField;
    QryTAccountDrWACCOUNTID: TIntegerField;
    QryTAccountDrBRECONCILED: TSmallintField;
    QryTAccountDrFOUTSTANDINGAMOUNT: TFloatField;
    QryTAccountDrWTRANSACTIONID: TIntegerField;
    QryTAccountDrWDESCRIPTIONID: TIntegerField;
    QryTAccountCr: TuniQuery;
    QryTAccountCrDDATE: TDateTimeField;
    QryTAccountCrSREFERENCE: TStringField;
    QryTAccountCrFAMOUNT: TFloatField;
    QryTAccountCrWACCOUNTID: TIntegerField;
    QryTAccountCrBRECONCILED: TSmallintField;
    QryTAccountCrFOUTSTANDINGAMOUNT: TFloatField;
    QryTAccountCrWTRANSACTIONID: TIntegerField;
    QryTAccountCrWDESCRIPTIONID: TIntegerField;
    tblTotalsWYEARID: TIntegerField;
    ZQTransActionWYEARID: TIntegerField;
    tblTransactionWYEARID: TIntegerField;
    tblTaxWLINKTAXID: TIntegerField;
    tblTaxBLINKCONTRA: TSmallintField;
    ZUQTotals: TUniUpdateSql;
    ZQTotals: TuniQuery;
    ZQTotalsWACCOUNTID: TIntegerField;
    ZQTotalsWPERIODID: TIntegerField;
    ZQTotalsWYEARID: TIntegerField;
    ZQTotalsBACTUAL: TSmallintField;
    ZQTotalsFAMOUNT: TFloatField;
    ZQTotalsDSYSDATE: TDateTimeField;
    QryAccountListBSelected: TIntegerField;
    tblTransactionWDOCID: TIntegerField;
    ZQTransActionWDOCID: TIntegerField;
    ZQGroups: TuniQuery;
    ZUSQLGroups: TUniUpdateSql;
    ZQGroupsWGROUPID: TIntegerField;
    ZQGroupsWGROUPTYPEID: TIntegerField;
    ZQGroupsSDESCRIPTION: TStringField;
    ZQGroupsWPARENTGROUP2ID: TIntegerField;
    ZQGroupsWPARENTGROUP1ID: TIntegerField;
    ZQGroupsDSYSDATE: TDateTimeField;
    ZQGroupsWSORTNO: TIntegerField;
    ZUSQLOpReport: TUniUpdateSql;
    ZUSQLSysparams: TUniUpdateSql;
    ZUSQLTypes: TUniUpdateSql;
    tblDocHeaderWDOCID: TIntegerField;
    tblDocHeaderSDOCNO: TStringField;
    tblDocHeaderWTYPEID: TIntegerField;
    tblDocHeaderDDATE: TDateTimeField;
    tblDocHeaderDALLOCATEDDATE: TDateTimeField;
    tblDocHeaderWACCOUNTID: TIntegerField;
    tblDocHeaderWPAYMENTTYPEID: TIntegerField;
    tblDocHeaderWPOSTAL1ID: TIntegerField;
    tblDocHeaderWPOSTAL2ID: TIntegerField;
    tblDocHeaderWPOSTAL3ID: TIntegerField;
    tblDocHeaderWPOSCOUNTRIES_ID: TIntegerField;
    tblDocHeaderWPOSTALCODEID: TIntegerField;
    tblDocHeaderWMESSAGE1ID: TIntegerField;
    tblDocHeaderWMESSAGE2ID: TIntegerField;
    tblDocHeaderWMESSAGE3ID: TIntegerField;
    tblDocHeaderFINVOICEDISCOUNT: TFloatField;
    tblDocHeaderWSALESMANID: TIntegerField;
    tblDocHeaderSREFERENCE: TStringField;
    tblDocHeaderWDELADDRESS1ID: TIntegerField;
    tblDocHeaderWDELADDRESS2ID: TIntegerField;
    tblDocHeaderWDELADDRESS3ID: TIntegerField;
    tblDocHeaderWDELCOUNTRIES_ID: TIntegerField;
    tblDocHeaderWDELCODEID: TIntegerField;
    tblDocHeaderBPRINTED: TSmallintField;
    tblDocHeaderBPOSTED: TSmallintField;
    tblDocHeaderWREPORTINGGROUP1ID: TIntegerField;
    tblDocHeaderWREPORTINGGROUP2ID: TIntegerField;
    tblDocHeaderWPAYMENTGROUPID: TIntegerField;
    tblDocHeaderBEXCLUSIVE: TSmallintField;
    tblDocHeaderWCURRENCYID: TIntegerField;
    tblDocHeaderFDOCAMOUNT: TFloatField;
    tblDocHeaderFTAXAMOUNT: TFloatField;
    tblDocHeaderBREPEATING: TSmallintField;
    tblDocHeaderDSYSDATE: TDateTimeField;
    tblDocHeaderWSOURCETYPEID: TIntegerField;
    tblDocHeaderWPROFILEID: TIntegerField;
    tblDocHeaderWTERMS: TIntegerField;
    tblDocHeaderWJOBCODEID: TIntegerField;
    tblDocHeaderDDUEDATE: TDateTimeField;
    tblDocHeaderWUSERID: TIntegerField;
    procedure qryDocHeadBkCalcFields(DataSet: TDataSet);
    procedure tblAccountSMAINACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblAccountSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryInvDetailSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblBackOrderCalcFields(DataSet: TDataSet);
    procedure qrBalSheetAccountCalcFields(DataSet: TDataSet);
    procedure qGenAfterClose(DataSet: TDataSet);
    procedure tblStockAdSInputTaxGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblStockAdSOutputTaxGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblStockAdSCostAccountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblStockAdSSaleSACCOUNTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblStockAdSStockAccountGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QryTAccountCrCalcFields(DataSet: TDataSet);
    procedure UnzipperFilePercentDone(Sender: TObject; Percent: Integer);
    procedure GetTheFieldsRight(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure tblBatchSCONTRAACCOUNTGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryGroupsBeforePost(DataSet: TDataSet);
    procedure tblBatchAfterEdit(DataSet: TDataSet);
    procedure qrPrnDocLinesSSTOCKCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblBatchAfterScroll(DataSet: TDataSet);
    procedure tblBatchAfterOpen(DataSet: TDataSet);
    procedure tblReportingOptionsFReconBankBalanceSetText(Sender: TField;
      const Text: String);
    procedure tblStockAfterClose(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QBOMAfterPost(DataSet: TDataSet);
    procedure tblStockAfterScroll(DataSet: TDataSet);
    procedure qGenSQLPostDelete(DataSet: TDataSet);
    procedure QTaskActionWTypeIdGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QContactsLastNameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblBatchControlBeforePost(DataSet: TDataSet);
    procedure tblOpReportAfterInsert(DataSet: TDataSet);
    procedure tblBatchRefTotalsBeforePost(DataSet: TDataSet);
    procedure tblBatchRefTotalsAfterPost(DataSet: TDataSet);
    procedure tblGlobalAfterPost(DataSet: TDataSet);
    procedure ZQMessageAfterInsert(DataSet: TDataSet);
    procedure tblGlobalAfterOpen(DataSet: TDataSet);
    procedure tblGlobalAfterClose(DataSet: TDataSet);
    procedure ZQBatControlAfterInsert(DataSet: TDataSet);
    procedure ZQTransActionAfterInsert(DataSet: TDataSet);
    procedure tblStockAdCalcFields(DataSet: TDataSet);
    procedure tblTotalsBeforePost(DataSet: TDataSet);
    procedure tblTransactionBeforePost(DataSet: TDataSet);
    procedure ZQTransActionBeforePost(DataSet: TDataSet);
    procedure ZSQLGenProccessorError(Processor: TUniScript;
      StatementIndex: Integer; E: Exception;
      var ErrorHandleAction: TZErrorHandleAction);
    procedure TblContactsAfterInsert(DataSet: TDataSet);
    procedure QContactsAfterInsert(DataSet: TDataSet);
    procedure QBOMAfterInsert(DataSet: TDataSet);

  private
    FExcOldValue: Double;
    FSetOfBooksPropertys: TSetOfBooksPropertys;
    fSymplisticLocklist : TSymplisticLockList ;
    UseLockList  :Boolean ;
    FSQLList: TSQLList;
    procedure SetExcOldValue(const Value: Double);
    function GetExcOldValue: Double;
    procedure SetSetOfBooksPropertys(const Value: TSetOfBooksPropertys);
    function GetTempDir: string;
    procedure SetSQLList(const Value: TSQLList);



    { Private declarations }

  public
     // done Making them part of the eobject is mutch beter
   // We can turn them in to propertys if we need to debug giving us the power of accessors.
  ScriptErrorList : String ;

  CalledFromBatch,IsBalPost,
  RetExcOldValue:boolean;
  aSessionName,
  DefaultTax,
  SetOfBooksPath,
  NmBatchType    :String;
  FieldInMod:Byte;
  OpenItemRequest,
  flGroupsID  ,
  BatchType      : Integer;
  TmpBatFileNames ,RConBankTableName: String;

    Procedure CreateBatch(AName : String);
    procedure LoadSqlList ;
    Function AddLock(ALockname : String) : Boolean ;
    procedure ReleaseLock(ALockName:String);
    Procedure CreateNewBatchRec(aBatchType:Integer);
    Function GetAccountCodeLength : integer ;
    Function GetFieldLength(ATabel,AField : String ;Default : Integer ) : integer ;
    property ExcOldValue : Double  read GetExcOldValue write SetExcOldValue;
    property SetOfBooksPropertys : TSetOfBooksPropertys  read FSetOfBooksPropertys write SetSetOfBooksPropertys;
    procedure ExecCreatePlanintSQL ;
    property SQLList : TSQLList  read FSQLList write SetSQLList;
    procedure ConnectToBooks (ABooksItem : TBooksCollectionItem);
    function AppendBatchControlId(AUserID, aCurrentUser, ABatchTypeID,
      BPosted, BImported: Integer): Integer;
    function GetLocalSaveDir: String;
    { Public declarations }
  end;


function _IncrementString(Number : String;Increment:Integer = 1) : String;
Function _AddDashInAccCode(AccCode:String;ShortCode:Boolean=False):String;
// This function just works on account code so not with type af front.
Function AddDashInStdAccCode(AccCode:String):String;

function _CnvAccType(_AccountTypeID:Integer):Char;
Function _ReadDescription(MessageID:Integer):String;
Function  AddMessage(StrMessage : String;Unique:Boolean = false):Integer;
procedure UpdateMessage(MessageID:Integer ; StrMessage : String);
//Function  SetBooksPath(BooksPathName:String):Integer;stdCall;
//Function  GetBooksPath:String;stdCall;
procedure DoCloseSetOfBooks(KeepUser:Boolean=False);stdCall;
//Procedure ChangeSetofBooks(swFolder:String);
procedure InitSetOfBooksPropertys ;
//Function  GetFirstBatchFileNames:string;
//Function  GetNextBatchFileNames:string;
Function  SetBookStatus(Status:integer;StatType,State:Byte):Integer;
Function  DoOpenSetofBooks(ABookItem : TBooksCollectionItem):Integer;
Procedure ChangeQryTAcc(Dr:Boolean;aFilter,aSort:String;DStart,DEnd:Tdate);
Function  CheckDatabaseVer:Integer;
function FillStringsWithUnitDesc(AList:TStrings):Boolean;
// done : Pieter this way the dropdowns can have a text = valueFunction  FillReportingGroups(CbxBox:TwwDBComboBox;TpGroupID:integer;AsLookup : Boolean = false):Boolean;
//Function FillReportingGroupsCbBox(CbxBox:TComboBox;TpGroupID:integer):Boolean;
function FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;
function  GetNesteldNameFromGroupID(AGroupID : Integer ;var level : Integer) : String ;
function  SortClientDataSet(ClientDataSet: TClientDataSet;
   FieldName: String;Var AscIdx:Boolean): Boolean;
Procedure ShowErrMsg(errCode:Integer);
Function  GetErrMsg(errCode:Integer):String;
Function  GetThisBooksPath(BooksName:String):String;


var
  dmDatabase: TdmDatabase;



implementation

{$R *.DFM}

uses DatabaseAccess, Password, ConvTOX,
  LedgerRoutines, Progress,globalfunctions,Variants, XRoutines, StrUtils;


function TdmDatabase.GetLocalSaveDir: String;
begin
 result := ExtractFilePath(Application.ExeName );
 if TheGlobalDataObject.Books.ActiveBooks = nil then exit ;
 if ZMainconnection.HostName <> '' then
    begin
      result := ExtractFileDir(ZMainconnection.Database);
      ExcludeTrailingPathDelimiter(Result);
      Result :=   ExtractFileName(Result) ;
      If result = '' then result := TheGlobalDataObject.Books.ActiveBooks.Name ;
      result := ExtractFilePath(Application.ExeName)+'localfiles\'+ result ;
    end
    else result := ExtractFilePath(ZMainconnection.Database);
 Result := IncludeTrailingPathDelimiter(result) ;
 if not DirectoryExists(Result) then
    ForceDirectories(result);
end;


procedure TdmDatabase.ConnectToBooks(ABooksItem: TBooksCollectionItem);
begin
  ZMainconnection.LoginPrompt := false ;
  DoCloseSetOfBooks;
  ZMainconnection.Database :=  ABooksItem.Database ;
  ZMainconnection.User :=  ABooksItem.UserName ;
  ZMainconnection.Password :=  ABooksItem.Password ;
  ZMainconnection.HostName :=  ABooksItem.Server ;
  try
    ZMainconnection.Connect ;
  except
     ZMainconnection.LoginPrompt := True ;
     ZMainconnection.Connect ;
  end;

  if not ZMainconnection.Connected then exit ;
  if GetBooksVersion < TCDatabaseversion then
     begin
       ConvertToX(TCDatabaseversion);
     end;

  DocReferenceLength :=  dmDatabase.GetFieldLength('DocHead','SReference',15);
  MainAccountLength := GetAccountCodeLength ;
  GetTheFieldsRight(nil) ;
  InitSetOfBooksPropertys ;

 ZSQLMonitor1.FileName := GetLocalSaveDir + 'SqlLogfile.txt';
 ZSQLMonitor1.Active := ReadT3IniFile('INFO','DEBUGSQL','0') = '1' ;
end;




Function _ReadDescription(MessageID:Integer):String;
{Read Description From Message.db}
begin
  Result :='';
  dmDatabase.ZQMessage.Active := false ;
  dmDatabase.ZQMessage.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectmessageonid') ;
  dmDatabase.ZQMessage.ParamByName('WMessageID').AsInteger := MessageID ;
  dmDatabase.ZQMessage.Open;
  Result := dmDatabase.ZQMessageSDescription.Value + dmDatabase.ZQMessageSExtraDescription.AsString;
  dmDatabase.ZQMessage.Active := false ;
end;

Function _AddDashInAccCode(AccCode:String;ShortCode:Boolean=False):String;
begin
  Result:=AccCode;
  If Length(Result)<MainAccountLength then
    exit;
  If Result[1] in ['0'..'9'] then
    if Length(AccCode)>1+MainAccountLength then

      Insert('-',Result,1+MainAccountLength)
     else
     else
  // Code with Account type in front thats the one longer than MainAccountLength +3
  if Length(AccCode)> MainAccountLength +3 then
       Insert('-',Result,2+MainAccountLength)
       else   // sometimes the subaccountcode is not there apperently
    if Length(AccCode)>MainAccountLength then
      Insert('-',Result,2+MainAccountLength);
  if result ='-' then
    result := '' ;
end;

// This function just works on account code so not with type af front.
Function AddDashInStdAccCode(AccCode:String):String;
begin
  Result:=AccCode;
  if Length(AccCode)>MainAccountLength then
      Insert('-',Result,1+MainAccountLength) ;

 if Length(Result)> (MainAccountLength + 4) then
      SetLength(Result,4+MainAccountLength);
end;


function _IncrementString(Number : String;Increment:Integer = 1) : String;
var
  StringPart,StringPartright,//TmpNumPart,
  NumPart,EndNumberString     : String;
  Count, Num  : Integer;
begin
  // this routines has some troubles with numers and signs like 01-01
  // the next inc will be -0102 lets let the routine onley look at the digest from rigth to left.
  // The first non diget found it will stop and use the rest to inc. so prefix an postfix can also be used.

  Result :='';
  if Number = '' then
    exit ;
  NumPart := '';
  StringPart := '';
  StringPartright := '' ;

 for Count := Length(Number) downto 1 do
    begin
     if (Number[Count] in ['0','1','2','3','4','5','6','7','8','9'])then
         NumPart := Number[Count] + Numpart
         else if NumPart = '' then
            StringPartright := Number[Count] + StringPartright
            else
            break ;
    end;
  if count < Length(Number) then
     StringPart := copy(Number,1,count);
   // i gess the limit is just stringbound and should be restarted
   count :=  Length(NumPart) ;
   if NumPart <> '' then
   EndNumberString := IntToStr((strtoint(NumPart)+Increment) mod maxint) ;

   while length(EndNumberString) < count do
         EndNumberString := '0'+ EndNumberString ;

   result := StringPart + EndNumberString + StringPartright ;
end;

function  _CnvAccType(_AccountTypeID:Integer):Char;
// Added By Sylvain
// This function will replace completly
// EncodeAccount and GetEncodeAccount
// And it will be used in Dmdatabase to Set
// GetText of AccountCode field.
begin
  Case _AccountTypeID of
  1:Result:='D';
  2:Result:='C';
  3:Result:='B';
  4:Result:='T';
  else
    Result:='G';
  end;
end;

procedure TdmDatabase.qryDocHeadBkCalcFields(DataSet: TDataSet);
begin
 with qryDocHead do begin
  if FieldByName('SSUBACCOUNTCODE').AsString = '' then
   FieldByName('SMainSubAccCalc').AsString := FieldByName('SMAINACCOUNTCODE').AsString else
   FieldByName('SMainSubAccCalc').AsString := FieldByName('SMAINACCOUNTCODE').AsString + '-' +
                                              FieldByName('SSUBACCOUNTCODE').AsString;
 end;
end;

procedure TdmDatabase.tblAccountSMAINACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case tblAccountWAccountTypeID.Value of
  1:Text:='D'+tblAccountSMAINACCOUNTCODE.Value;
  2:Text:='C'+tblAccountSMAINACCOUNTCODE.Value;
  3:Text:='B'+tblAccountSMAINACCOUNTCODE.Value;
  4:Text:='T'+tblAccountSMAINACCOUNTCODE.Value;
  else
    Text:='G'+tblAccountSMAINACCOUNTCODE.Value;
  end;
  DisplayText:=true;

end;

procedure TdmDatabase.tblAccountSACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
Var
 MyAcc:String;
begin
  if tblAccountBSubAccounts.Value = 1 then
    MyAcc:=Copy(tblAccountSACCOUNTCODE.Value,1,MainAccountLength)
  else
    MyAcc:=tblAccountSACCOUNTCODE.Value;
  Case tblAccountWAccountTypeID.Value of
  1:Text:='D'+MyAcc;
  2:Text:='C'+MyAcc;
  3:Text:='B'+MyAcc;
  4:Text:='T'+MyAcc;
  else
    Text:='G'+MyAcc;
  end;
  DisplayText:=true;
end;

procedure TdmDatabase.qryInvDetailSACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text:=_CnvAccType(qryInvDetailWAccountTypeID.Value)+qryInvDetailSACCOUNTCODE.Value;
  DisplayText:=true;
end;

procedure TdmDatabase.tblBackOrderCalcFields(DataSet: TDataSet);
Var
  AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
    AQuery.Connection := dmdatabase.ZMainConnection ;
    AQuery.sql.text := 'select SDescription from Stock where WStockId = ' + IntToStr(tblBackOrderWStockID.Asinteger);

    AQuery.Open ;
    tblBackOrderSDescription.asstring := AQuery.fields[0].asstring ;
  finally
    AQuery.free ;
  end;

end;

procedure TdmDatabase.qrBalSheetAccountCalcFields(DataSet: TDataSet);
begin
  if tblGroups.active=false then
    tblGroups.Open;
  qrBalSheetAccount.FieldByName('WParentGroupID').AsString := '0';
  if flGroupsID=2 then
  begin
   if tblGroups.Locate('WGroupID',qrBalSheetAccountWreportingGroup2ID.Value,[]) then
    if tblGroupsWParentGroup2ID.Value =60 then
      qrBalSheetAccount.FieldByName('WParentGroupID').AsString := '1'
  end
  else
  begin
   if tblGroups.Locate('WGroupID',qrBalSheetAccountWreportingGroup1ID.Value,[]) then
    if tblGroupsWParentGroup1ID.Value =60 then
      qrBalSheetAccount.FieldByName('WParentGroupID').AsString := '1';
  end;
end;

procedure TdmDatabase.qGenAfterClose(DataSet: TDataSet);
begin
  qGen.Filtered :=False;
  qGen.Filter := '';
end;

procedure TdmDatabase.tblStockAdSInputTaxGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := _AddDashInAccCode(tblStockAdSInputTax.Value);
  DisplayText := True;
end;

procedure TdmDatabase.tblStockAdSOutputTaxGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := _AddDashInAccCode(tblStockAdSOutputTax.Value);
  DisplayText := True;
end;

procedure TdmDatabase.tblStockAdSCostAccountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := _AddDashInAccCode(tblStockAdSCostAccount.Value);
  DisplayText := True;
end;

procedure TdmDatabase.tblStockAdSSaleSACCOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := _AddDashInAccCode(tblStockAdSSaleSACCOUNT.Value);
  DisplayText := True;
end;

procedure TdmDatabase.tblStockAdSStockAccountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := _AddDashInAccCode(tblStockAdSStockAccount.Value);
  DisplayText := True;
end;

Function GetThisBooksPath(BooksName:String):String;
begin
  result := '' ;
  if TheGlobalDataObject.Books.FindBooksByName(BooksName) <> nil then
     result := TheGlobalDataObject.Books.FindBooksByName(BooksName).Database ;
end;

Function  DoOpenSetofBooks(ABookItem : TBooksCollectionItem):Integer;
{Just to be consistant with names}
Var
  // done : Pieter sorry that H needed a rewrite

  BooksWasActive :Boolean;
begin
  Result := 0;
  CurrentUser:=0;
   dmdatabase.ConnectToBooks(ABookItem);
  // done : pieter Must be before temp table create's

   if not DirectoryExists(ApplicationPath+'DataTmp') then
      MkDir(ApplicationPath+'DataTmp');
   Converted := CheckDatabaseVer ;
   if Not (Converted in [0,255]) then
   begin
     {No need To Set Result as Error}
     Result := 2101;
     exit;
   end;
//    if not CheckDatabaseVer then exit;
   with dmDatabase do
   begin
      tblUser.Open;
      if not tblUser.Locate('WUserID', 0, []) then
      begin
        { fmPassword.Showmodal; Changed to the next line}
        Result := PwdLoginWin;
        if Result <> 0 then
        begin
          // Result := 2102;
           DoCloseSetOfBooks ;
           // ChangeSetofBooks('');
           exit;
        end;
        RealUser := CurrentUser;
        if CurrentUser=0 then
        begin
          if not tblUser.Locate('BSystemSetup','True',[]) then
          begin
            tblUser.First;
            tblUser.Edit;
            tblUserBSystemSetup.Value := 1;
            tblUser.Post;
          end;
          tblUser.EnableControls;
          CurrentUser:= tblUserWUserID.Value;
          RealUser:=-1;
        end
      end;
   end;

end;
procedure initSetOfBooksPropertys ;
begin
    // lets iniialize the data object to prevent reads from DB.
    // and have the info at your fingertips :-)
    dmDatabase.tblSysVars.Open ;
    if dmDatabase.tblSysVarsBTaxInvoiceBased.AsInteger = 1 then
    dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased := tbPayments
    else
    dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased :=  tbInvoice ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount := dmDatabase.tblSysVarsWDebtorsControlID.AsInteger ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount := dmDatabase.tblSysVarsWCreditorsControlID.AsInteger ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings := dmDatabase.tblSysVarsWRetainedIncomeID.AsInteger ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.CreateCostOfSales := dmDatabase.tblSysVarsBCreateCostOfSales.AsInteger = 1 ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.EMailAddress := dmDatabase.tblSysVarsSEmailAddress.AsString ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.CompanyName :=  dmDatabase.tblSysVarsSCompanyName.AsString ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.RegNumber :=  dmDatabase.tblSysVarsSCompanyName.AsString ;

    dmDatabase.tblSysVars.close ;
    ReadLedgerPeriodes(dmDatabase.SetOfBooksPropertys.LedgerPeriodes);

if ReadNwReportOp('WDataEntryDecQty').isNull then
    dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty := 2
  else
    dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty:= StrToIntDef(ReadNwReportOp('WDataEntryDecQty').AsString ,2);
  if ReadNwReportOp('WDataEntryNbrQty').isNull then
    dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty  := 2
  else
  dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty  :=  StrToIntDef(ReadNwReportOp('WDataEntryNbrQty').AsString,2);

  dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals := ReadReportOp('WDocRowDecimals',8).AsInteger;
  dmDatabase.SetOfBooksPropertys.DataParameter.BDataEntryReal  := ReadNwReportOp('BDataEntryReal').AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.SEdtDigSymb :=  ReadNwReportOp('SEdtDigSymb').AsString;
  dmDatabase.SetOfBooksPropertys.DataParameter.SedtDecSymb :=  ReadNwReportOp('SedtDecSymb').AsString;
  dmDatabase.SetOfBooksPropertys.DataParameter.BUseCurSign :=  ReadNwReportOp('BUseCurSign',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState :=  ReadNwReportOp('CBViewAllBankState',true).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBNoCalcBatch :=  ReadNwReportOp('CBNoCalcBatch',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBUseCurrentDateForReports := ReadNwReportOp('CBUseCurrentDateForRep',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.cbContraISRef := ReadNwReportOp('cbContraISRef',false).AsBoolean ;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan := ReadNwReportOp('CBDONotUseReportMan',true).AsBoolean ;
  dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask := GetViewMask(0) ;
  dmDatabase.SetOfBooksPropertys.DataParameter.NOWarningUnposted :=  ReadNwReportOp('CBNOWarningUnposted',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.NoPrintMessage := ReadNwReportOp('CBNoPrintMessage',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CheckDocReferenceUsed := ReadNwReportOp('STKCheckReferenceUsed',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.DoNotCreateItems := ReadNwReportOp('STKDoNotCreateItems',false).AsBoolean ;
  dmDatabase.tblReportingOptions.Open ;
  dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals := dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsInteger ;
  dmDatabase.tblReportingOptions.Close ;

end;



procedure DoCloseSetOfBooks(KeepUser:Boolean=False);
{
  Closes the current set of books.

}
begin
  //Close all the tables
  with dmDatabase do
  begin
    if Not KeepUser then
    begin
    SavePass :='';
    CurrentUserName :='';
    end;
    if DmDatabase.ZMainConnection.Connected then
       IsProperlyClosed;
    DmDatabase.ZMainConnection.Connected := False ;
    dmDatabase.CdsBankDnl.Close ;
   end;
end;

Procedure ChangeQryTAcc(Dr:Boolean;aFilter,aSort:String;DStart,DEnd:Tdate);
Var
  s:string;
begin
  s:=' Select transact.DDate,transact.SReference,' +
  IfThen(dr,'FAmount','-FAmount FAmount')


  +',WAccountID,'+
     ' BReconciled, FOutStandingAmount, transact.WtransactionID,transact.WDescriptionID,BatCon.SAlias'+
     ' From TRANSACT left join Batcon on (Batcon.WbatchID= transact.WBatchId)'+
     ' Where DDate>=:DtStart And DDate<=:DtEnd';
  if dr then
    s:=s+' AND (FAmount>=0)'
  else
    s:=s+' AND (FAmount<0)';
  if trim(aFilter)<>'' then
  s:= s +' AND (' +aFilter+')';
  if Trim(aSort)='' then
    S:=S + ' Order by DDate,SReference'
  else
    s:=S + aSort;
  if Dr then
  begin
    dmDatabase.QryTAccountdr.ParamByName('DtStart').AsDate:= DStart;
    dmDatabase.QryTAccountdr.ParamByName('DtEnd').AsDate:= DEnd;
    dmDatabase.QryTAccountdr.DisableControls;
    dmDatabase.QryTAccountdr.Close;
    dmDatabase.QryTAccountdr.SQL.Text:=s;
    dmDatabase.QryTAccountdr.EnableControls;
  end
  else
  begin
    dmDatabase.QryTAccountCr.ParamByName('DtStart').AsDate:= DStart;
    dmDatabase.QryTAccountCr.ParamByName('DtEnd').AsDate:= DEnd;
    dmDatabase.QryTAccountCr.DisableControls;
    dmDatabase.QryTAccountCr.Close;
    dmDatabase.QryTAccountCr.SQL.Text:=s;
    dmDatabase.QryTAccountCr.EnableControls;
  end;

end;

procedure TdmDatabase.QryTAccountCrCalcFields(DataSet: TDataSet);
begin
  Try
    Dataset.FieldByName('Sdescription').AsString :=  _ReadDescription(dataset.fieldbyname('WDescriptionID').ASInteger);
  except end;
end;

Function TdmDatabase.GetAccountCodeLength : integer ;
Var
  vTable:TuniQuery;
begin
  vTable:=TuniQuery.create(Nil);
  Result:=3;
  try
  Try
    vTable.Connection :=dmDatabase.ZMainconnection ;
    vTable.SQL.Text:='SELECT SMAINACCOUNTCODE FROM Account where 1 = 0';
    vTable.Open;
    Result:= vTable.Fields[0].Size ;
    vTable.Close;

  Finally
    vTable.Free;
  end;
  except ;
   // return default.
  end;
end;

Function CheckDatabaseVer:Integer;
// Test and Change T3 Database;
Var
  BooksVersion, i :Integer;
  Ok:Boolean;
begin
  Result:=0;
  BooksVersion:= GetBooksVersion ;
  LoadBooksVars;
end;


function GetNesteldNameFromGroupID(AGroupID : Integer;var level : Integer ) : String ;
var
  LocalName : String ;
  ParentID : Integer ;

begin
  // prevent recursion loop
  If level = 10 then exit ;
  inc(level);
  result := '' ;
  dmDatabase.ZQGroups.sql.Text := ' Select * FROM Groups where WGROUPID = :WGroupId' ;
  dmDatabase.ZQGroups.Params[0].AsInteger := AGroupID ;
  dmDatabase.ZQGroups.open ;
  ParentID := dmDatabase.ZQGroupsWPARENTGROUP2ID.AsInteger ;
  LocalName := dmDatabase.ZQGroupsSDESCRIPTION.AsString ;
  dmDatabase.ZQGroups.close ;
  if  ParentID <> 0 then
  result := GetNesteldNameFromGroupID(ParentID,level) ;
  if result = '' then
     result :=  LocalName else
     result := result + '@' + LocalName ;
  dec(level);
end;



function FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;
  var
    Level : Integer ;
begin
  Result:=False;
  AList.Clear;
  dmDatabase.qGen.SQL.Text := 'Select * from groups where WGroupTypeID=' + IntToStr(TpGroupID) +' order by WSortNo';
  dmDatabase.qGen.open ;

  while not dmDatabase.qGen.Eof do
  begin

    if dmDatabase.qGen.FieldByName('SDescription').AsString <>'' then
     if not AsLookup then
       begin
         Level := 0 ;
         AList.AddObject(GetNesteldNameFromGroupID(dmDatabase.qGen.FieldByName('WGroupID').AsInteger,Level),TObject(dmDatabase.qGen.FieldByName('WGroupID').AsInteger))
        // AList.AddObject(dmDatabase.qGen.FieldByName('SDescription').AsString,TObject(dmDatabase.qGen.FieldByName('WGroupID').AsInteger))

       end else
       begin
          Level := 0 ;
          AList.AddObject(GetNesteldNameFromGroupID(dmDatabase.qGen.FieldByName('WGroupID').AsInteger,Level)+#9+dmDatabase.qGen.FieldByName('WGroupID').AsString,TObject(dmDatabase.qGen.FieldByName('WGroupID').AsInteger));
         //AList.AddObject(dmDatabase.qGen.FieldByName('SDescription').AsString+#9+dmDatabase.qGen.FieldByName('WGroupID').AsString,TObject(dmDatabase.qGen.FieldByName('WGroupID').AsInteger));
       end;
    dmDatabase.qGen.Next;
  end;
  dmDatabase.qGen.Close;
  Result:= AList.Count>0;
  if result then
   AList.Insert(0,GetTextLang(20046));
end;


function FillStringsWithUnitDesc(AList:TStrings):Boolean;
begin
  AList.Clear;
  dmDatabase.qGen.SQL.Text := 'Select * from unit ';
  dmDatabase.qGen.open ;
  while not dmDatabase.qGen.Eof do
  begin
    if dmDatabase.qGen.FieldByName('SDescription').AsString <>'' then
      AList.AddObject(dmDatabase.qGen.FieldByName('SDescription').AsString,TObject(dmDatabase.qGen.FieldByName('WUnitID').AsInteger));
    dmDatabase.qGen.Next;
  end;

  dmDatabase.qGen.Close;
  Result:= AList.Count>0;
end;
 
function SortClientDataSet(ClientDataSet: TClientDataSet;
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





procedure TdmDatabase.UnzipperFilePercentDone(Sender: TObject;
  Percent: Integer);
begin
  _SetProgress('',Percent);
end;


Function GetErrMsg(errCode:Integer):String;
Var
  Extra:String;
begin
  Result :='';
  Extra:= SMsgErr;
  SMsgErr:='';
  if errCode=0 then  exit;
  if Extra<>'' then
    Extra:=#13#10+Extra;
  Case errCode of
       1 : begin
             Extra := LastErrMsg;
             LastErrMsg:='';
             if Extra = '' then Extra := 'File not found!'
           end;
    2001 : Extra := GetTextLang(711){'Run Setup and select Contra Account fo this batch'} + Extra;
    2002 : Extra := GetTextLang(590)+ Extra;
    2003 : Extra := GetTextLang(822)+ Extra;
    2004 : Extra := GetTextLang(816){'May not have a Tax type for a Debtor or                            Creditor in the receipts based system.'} + Extra;
    2005 : Extra := 'File out of sequence';

    2010 : Extra := GetTextLang(590) + Extra ;
    2012 :  ;//'Posting To Last Year Denied';
    2011 : Extra := GetTextLang(439){Batch is not in balance} + Extra ;
    2020 :  ;

    2030 : Extra := 'Invalide Xml File format';
    2031 : Extra := 'Invalide txf File format';
    2032 : Extra := 'Conversion Error ' + Extra;
    2033 : Extra := 'Cannot Edit Batch ' +  Extra;
    2034 : Extra := 'Cannot Load Batch ' +  Extra;
    2040 :  ; // Stock Item not set up properly
    2041 :  ; // Tax Amount Found but Tax Account Delete

    2042 :  ; // Last Year is Closed for posting
    2043 :  ; // This period is Closed for posting
    2044 :  ;  // Date not in fin year
    2045 :  ; // This is not a an error but a warning ;Error 2045 Batch out of sequence
    2046 :  ;  // ' Error Cannot Edit Batch'; Invalid user name
    2047 :  ;  // other errors While Recording Account Information for
    2048 :  ;  // Can not create this Sub account



    2100 : Extra := GetTextLang(741) + Extra;
    2101 : ;
    2102 : ;
    2103 : Extra :=  GetTextLang(1897) + Extra ;
    2104 : ; // Not an Error
  Else
     Extra := 'Error '+ IntToStr(errCode)+ LastErrMsg ;
  end;
  LastErrMsg := Trim(Extra);
  Result := LastErrMsg;
end;

Procedure ShowErrMsg(errCode:Integer);
begin
  if errCode=0 then exit;
  OSFMessageDlg(GetErrMsg(errCode) , mterror, [mbok], 0);
end;


procedure TdmDatabase.GetTheFieldsRight(Sender: TObject);
 var
  i : Integer ;
  ValutaFormat : String ;
begin
  // done : pieter moved to 6 digets
  // see create remeber all sizes in tag
 for i := 0 to ComponentCount -1 do     begin
        if  (Components[i] is TStringField) then
          begin
          if   ((Components[i] as TStringField).FieldName = 'SMAINACCOUNTCODE') then
            begin
            (Components[i] as TStringField).Size := MainAccountLength ;
            (Components[i] as TStringField).DisplayWidth := 3+MainAccountLength ;
            end;

          if   (Components[i] as TStringField).FieldName = 'SACCOUNTCODE' then
            begin
            (Components[i] as TStringField).Size := 3+MainAccountLength ;
            (Components[i] as TStringField).DisplayWidth := 12 ;
            end;
          if  (Components[i] as TStringField).FieldName = 'SACCOUNT' then
            begin
            (Components[i] as TStringField).Size := 4+MainAccountLength ;
            (Components[i] as TStringField).DisplayWidth := 6+MainAccountLength ;
            end;
          if  (Components[i] as TStringField).FieldName = 'STAX' then
            begin
            (Components[i] as TStringField).Size := 4+MainAccountLength ;
            (Components[i] as TStringField).DisplayWidth := 6+MainAccountLength ;
            end;
          if  (Components[i] as TStringField).FieldName = 'SCONTRAACCOUNT' then
            begin
            (Components[i] as TStringField).Size := 4+MainAccountLength ;
            (Components[i] as TStringField).DisplayWidth := 6+MainAccountLength ;
            end;
          end;

     end;

  // done : Pieter lets assume float fields are money fields.
  // and discart anny that are not.
  ValutaFormat :=  GetViewMask(0) ;
  for i := 0 to ComponentCount -1 do
     begin
        if  (Components[i] is TFloatField) then
           (Components[i] as TFloatField).DisplayFormat := ValutaFormat ;

     end;
  // discard these
  tblSysVarsSEmailAddress.Size := GetFieldLength('SysVars','SEmailAddress',60);
  tblTmpAgeAnalSACCOUNTCODE.size := MainAccountLength + 4 ;
                     
  tblReportingOptionsSGLLEDGERFROMACCOUNT.size := MainAccountLength + 4 ;
  tblReportingOptionsSGLLEDGERTOACCOUNT.size := MainAccountLength + 4 ;
  tblCashFlowSCode.size := MainAccountLength + 4  ;
  ValutaFormat := GetViewMask(7) ;
   tblStockFQtyOnHand.DisplayFormat := ValutaFormat ;
   tblLabSpecsFTopMargin.DisplayFormat := ValutaFormat ;
   tblLabSpecsFBottomMargin.DisplayFormat := ValutaFormat ;
   tblLabSpecsFLeftMargin.DisplayFormat := ValutaFormat ;
   tblLabSpecsFRightMargin.DisplayFormat := ValutaFormat ;
   tblLabSpecsFHeight.DisplayFormat := ValutaFormat ;
   tblLabSpecsFWidth.DisplayFormat := ValutaFormat ;
   tblLabSpecsFHGap.DisplayFormat := ValutaFormat ;
   tblLabSpecsFVGap.DisplayFormat := ValutaFormat ;
   tblLabSpecsFPageHeight.DisplayFormat := ValutaFormat ;
   tblLabSpecsFPageWidth.DisplayFormat := ValutaFormat ;
   tblLabSpecsFUnprintableTop.DisplayFormat := ValutaFormat ;
   tblLabSpecsFUnprintableLeft.DisplayFormat := ValutaFormat ;
   tblDocLineFQtyOrdered.DisplayFormat := ValutaFormat ;
   tblDocLineFQtyShipped.DisplayFormat := ValutaFormat ;
   tblStockAdFQtyOnHand.DisplayFormat := ValutaFormat ;
   tblStockAdFOpeningQty.DisplayFormat := ValutaFormat ;
   tblStockAdFReorderQty.DisplayFormat := ValutaFormat ;


   tblDocLineFItemDiscount.DisplayFormat := GetViewMask(6) ;

   // Database chages get checked here.
   // This change is minimal to users not having this version.
   // But i need it to ba able to get the payments for creditord right.
   // And the payments for debtors to. so im adding a field IDueDays

   tblDocHeaderSReference.Size := DocReferenceLength ;
   // Allow the setting of the reference length by the Database.
   // So manny problems with this length can be solved (External references)
   qryDocHeadSReference.Size := DocReferenceLength ;
   QTaskActionSReference.Size := DocReferenceLength ;
   QTaskActionSACCOUNTCODE.Size := MainAccountLength+3 ;
  // qrDocHeadSDescription.Size := DocReferenceLength ;

  // Set the fields of the SQL replacements here
  FSQLList.ParamsList.Values['ACCOUNTCODELONG'] :=  IntToStr(MainAccountLength + 3) ;
  FSQLList.ParamsList.Values['MAINACCOUNTCODELONG'] :=  IntToStr(MainAccountLength ) ;
  FSQLList.ParamsList.Values['SUBACCOUNTCODE'] :=  IntToStr( 3);
  FSQLList.ParamsList.Values['ACCOUNTCODELONG'] :=  IntToStr(MainAccountLength + 4) ;
end;

function TdmDatabase.GetTempDir: string;
var
  Buffer: array[0..MAX_PATH] of char;
  aFile: string;
begin
  Randomize ;
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  SetString(aFile, Buffer, StrLen(Buffer));
  result := IncludeTrailingPathDelimiter(aFile)+'Turbocashtemp' ;
  if ReadT3IniFile('BDE','UNIQUEPRIVATEDIR','FALSE')='TRUE' then
    result := result + formatfloat('00000',random(99999)) ;

  If not DirectoryExists(result) then
    CreateDir(result) ;
end;


procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
 i : Integer ;
begin
  FSetOfBooksPropertys := TSetOfBooksPropertys.create(self);
  // done : pieter moved to anny digets
  // in create remeber all sizes in tag for stringfield
  for i := 0 to ComponentCount -1 do
     begin
        if  (Components[i] is TStringField) then
             Components[i].Tag := (Components[i] as TStringField).Size ;
     end;

  // Load the SQl
  LoadSQLList ;
end;

procedure TdmDatabase.tblBatchSCONTRAACCOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // Done : Pieter Dont show contra for the auto balance bookings
  if tblBatchSReference.AsString <> '********' then
    Text := Sender.asstring ;
end;

procedure TdmDatabase.qryGroupsBeforePost(DataSet: TDataSet);
var
  i : Integer ;
  TryAgain : Boolean ;
begin
 if qryGroups.State = dsinsert then
 begin

  TryAgain := true ;
  i := 0 ;
  While TryAgain do
  begin
      try
      TryAgain := false ;
      tblGlobal.close;
      tblGlobal.Open;
      tblGlobal.Edit;

      except
        inc(i);
        if i < 5 then
        TryAgain := true else
        raise exception.Create(gettextlang(2059));
        sleep(100);
      end;
  end;
  // done : Pieter Locking case (after edit = lock)
  DataSet.FieldByName('WGroupID').AsInteger:= tblGlobalWNewGroupID.Value;
  tblGlobalWNewGroupID.Value := tblGlobalWNewGroupID.Value + 1;
  tblGlobal.Post;
  tblGlobal.Close;
  end;
end;

procedure TdmDatabase.tblBatchAfterEdit(DataSet: TDataSet);
begin
// done : Pieter lets remeber the current Totals ?.
       if (dmDatabase.TblBatchFCREDIT.Value>0) then
        begin
          ExcOldValue:=dmDatabase.TblBatchFCREDIT.AsFloat ;
        end;
      if (dmDatabase.TblBatchFDEBIT.Value>0) then
        begin
          ExcOldValue:=dmDatabase.TblBatchFDEBIT.Asfloat;
        end;

end;

procedure TdmDatabase.SetExcOldValue(const Value: Double);
begin
  FExcOldValue := Value;
end;

function TdmDatabase.GetExcOldValue: Double;
begin
 result := FExcOldValue ;
end;



procedure TdmDatabase.qrPrnDocLinesSSTOCKCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qrPrnDocLinesWLineTypeID.AsInteger = 91 then
     Text := '' else
     text := sender.asstring ;

end;

procedure TdmDatabase.tblBatchAfterScroll(DataSet: TDataSet);
begin
   // done : Mind the fact that this routines get filled and nilled by InvoiceEntryGrid
  // im also proposing to use then in the Batch screen to handel next record better


end;

procedure TdmDatabase.tblBatchAfterOpen(DataSet: TDataSet);
begin
   // done : Mind the fact that this routines get filled and nilled by InvoiceEntryGrid
   // im also proposing to use then in the Batch screen to handel next record better
end;

procedure TdmDatabase.tblReportingOptionsFReconBankBalanceSetText(
  Sender: TField; const Text: String);
begin
  sender.AsFloat := Str2Float(Text);
end;

procedure TdmDatabase.tblStockAfterClose(DataSet: TDataSet);
begin
 // todo : Afterclose event for debuggin puproses.
 if date > date + 1 then
    begin
       flGroupsID := 0 ;
    end;
end;

function TdmDatabase.GetFieldLength(ATabel, AField: String;Default : Integer ): integer;
Var
  vTable:TuniQuery;
begin
  vTable:=TuniQuery.create(Nil);
  Result:=Default;
  try
  Try
    vTable.Connection:=dmDatabase.ZMainconnection;
    vTable.SQL.Text:='SELECT '+ AField + ' FROM ' + ATabel + ' where 1 = 0 ' ;
    vTable.Open;
    Result := vTable.Fields[0].Size ;
    vTable.Close;
  Finally
    vTable.Free;
  end;
  except ;
   // return default.
  end;
end;




procedure TdmDatabase.SetSetOfBooksPropertys(
  const Value: TSetOfBooksPropertys);
begin
  FSetOfBooksPropertys := Value;
end;

procedure TdmDatabase.DataModuleDestroy(Sender: TObject);
begin
 FSetOfBooksPropertys.free ;
 fSymplisticLocklist.free ;
 FSQLList.free ;
end;

procedure TdmDatabase.QBOMAfterPost(DataSet: TDataSet);
begin
 TuniQuery(DataSet).ApplyUpdates ;
end;

procedure TdmDatabase.tblStockAfterScroll(DataSet: TDataSet);
begin
 if DataSet = tblStock then
    if DataSet = tblAccount then
       tblAccount.post ;
end;

procedure TdmDatabase.ExecCreatePlanintSQL;
var
 All,Sql : String ;
begin
  All := SQLCreateTables.DeleteSQL.text ;
  while pos(';',All) <> 0 do
    begin
      Sql := copy(All,1,pos(';',All));
      Delete(All,1,pos(';',All)+1);
       QGen.SQL.Text := Sql ;
       try
       QGen.ExecSQL ;
       except
         // do nothing for now.
       end;
    end;
 if trim(All) <> '' then
    begin
       QGen.SQL.Text := All ;
        try
       QGen.ExecSQL ;
       except

       end;
    end;
 QGen.SQL.Text := 'Alter Table Contacts Add WOldRef Integer ';
 QGen.ExecSQL ;
 QGen.SQL.Text := 'Select * from contact';
 QGen.Open ;
 While not QGen.Eof do
   begin
    qGenII.SQL.Text := 'insert into contacts (ResourceID, LastName, Phone1, Phone2, Phone3,EMail,DSysdate,WOldRef) ' +
     ' values (:ResourceID, :LastName, :Phone1, :Phone2, :Phone3,:EMail,:DSysdate,:WOldRef)';

    qGenII.Params[0].AsInteger := 1 ;

    qGenII.Params[1].AsString := QGen.fieldbyname('SContactName').ASstring ;
    qGenII.Params[2].AsString := QGen.fieldbyname('STelephone1').ASstring ;
    qGenII.Params[3].AsString := QGen.fieldbyname('STelephone2').ASstring ;
    qGenII.Params[4].AsString := QGen.fieldbyname('SFax').ASstring ;
    qGenII.Params[5].AsString := QGen.fieldbyname('SEmail').ASstring ;
    qGenII.Params[6].AsdateTime := QGen.fieldbyname('DSysDate').AsdateTime ;
    qGenII.Params[7].AsInteger := QGen.fieldbyname('WContactID').AsInteger ;
    qGenII.ExecSQL ;

     QGen.Next ;
   end;
 QGen.Close ;
 QGen.SQL.Text := 'Select * from Contacts';
 QGen.Open ;
 tblDebtor.Open ;
 QadressPerAccount.Open ;
 While not tblDebtor.Eof do
 begin
   if QGen.Locate('WOldRef',tblDebtorWContactID.AsInteger,[]) then
     begin
      tblDebtor.edit ;
      tblDebtorWContactID.AsInteger := QGen.FieldByName('RecordID').AsInteger;
      tblDebtor.post ;
      QadressPerAccount.Insert ;
      QadressPerAccountWAccountId.AsInteger := tblDebtorWAccountID.AsInteger ;
      QadressPerAccountWContactID.AsInteger :=  tblDebtorWContactID.AsInteger ;
      QadressPerAccount.Post ;
     end;
   tblDebtor.Next ;
 end;
 QadressPerAccount.Close ;
 tblDebtor.Close ;
 QGen.SQL.Text := 'Alter Table Contacts drop column WOldRef';
 QGen.ExecSQL ;
end;

procedure TdmDatabase.qGenSQLPostDelete(DataSet: TDataSet);
begin
if TuniQuery(DataSet).UpdatesPending then
 TuniQuery(DataSet).ApplyUpdates ;

end;

procedure TdmDatabase.QTaskActionWTypeIdGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if QTaskAction.IsEmpty then exit ;
  case QTaskActionWTypeId.asinteger of
   0 : Text :=  'Copy invoice to debtor' ;
   1 : Text := 'Copy invoice to group1' ;
   end;
end;

procedure TdmDatabase.QContactsLastNameGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text :=   QContactsLastName.AsString +' ' +QContactsFirstName.AsString ;
end;



function TdmDatabase.AddLock(ALockname: String): Boolean;
begin
 result := true ;
 if not UseLockList then exit ;
 // todo : SETLOCK
 // result := fSymplisticLocklist.AddLock(ALockname,Session.NetFileDir) ;
end;

procedure TdmDatabase.ReleaseLock(ALockName: String);
begin
 exit ;
// fSymplisticLocklist.releaselock(ALockName);
end;

procedure TdmDatabase.tblBatchControlBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('DSysDate').AsDateTime:=Now;
end;

procedure TdmDatabase.SetSQLList(const Value: TSQLList);
begin
  FSQLList := Value;
end;

procedure TdmDatabase.LoadSqlList;
Var
 ASearchRec : TSearchRec ;
begin
// todo load All needed SQL

    if FindFirst(ApplicationPath+'Bin\SQL\FIREBIRD\*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        with FSQLList.SQLCollection.add  do
        begin
       // ShowMessage(ASearchRec.name);
        //   if FileExists(ApplicationPath+'Bin\SQL\FIREBIRD\'+ASearchRec.name) then
            SQL.LoadFromFile(ApplicationPath+'Bin\SQL\FIREBIRD\'+ASearchRec.name);
            Name := ChangeFileExt(ASearchRec.name,'');

        end;

      until FindNext(ASearchRec) <> 0;
      FindClose(ASearchRec);
    end;



end;

procedure TdmDatabase.CreateBatch(AName: String);
var
 AQuery : TuniQuery ;
begin
 try
 if TableExist(AName) then exit ;
 AQuery := TuniQuery.Create(nil) ;
  try

    AQuery.connection := ZMainConnection ;

    FSQLList.ParamsList.values['BATCHNAME'] :=  AName ;
    AQuery.sql.text := FSQLList.GetFormatedSQLByName('createBatch');
    AQuery.ExecSql ;
    ZMainConnection.DbcConnection.GetMetadata.ClearCache ;
{the philosophy of the ZeosDBOs is that the resultset is kept (also while executing updates) until it is retrieved again. This is also the behaviour of JDBC on which the ZeosDBOs are based (see: ZDBC-acticle in the knowledge base). And this is implemented in ZeosDBOs for any DB that it supports. Your request will result in a new feature of ZeosDSOs and we have to look how it can be implemented.
 To achieve hard commits for Firebird you just have to disconnect from database and then connect again. This is the only way how "hard" commits will be executed.
 }


  //  ZMainConnection.Connected := false ;
  //  ZMainConnection.Connected := True ;
  //  makes querys close this is never good :-(

   finally
      AQuery.Free ;
   end;
   except
       // todo : Tabel exist but w need a way to know its alreay there Table exist does not work verry stange.
       // It must be transation isolation i willl find it one day but for now just catch
   end;
end;



procedure TdmDatabase.tblOpReportAfterInsert(DataSet: TDataSet);
begin
  ZQReportOpNextNum.Close ;
  ZQReportOpNextNum.SQL.Text := FSQLList.GetFormatedSQLByName('Database_NextNum_OpReport');
  ZQReportOpNextNum.open ;
  tblOpReportWOPTIONID.AsInteger :=  ZQReportOpNextNum.fields[0].asInteger ;
  ZQReportOpNextNum.close ;
end;

procedure TdmDatabase.tblBatchRefTotalsBeforePost(DataSet: TDataSet);
begin
 if dmDatabase.tblBatchRefTotalsWLineID.IsNull then
 begin
 dmDatabase.qGen.SQL.Text := 'select 1 + max(WLineID)  from ' + dmDatabase.tblBatchRefTotals.TableName ;
 dmDatabase.qGen.open ;
 dmDatabase.tblBatchRefTotalsWLineID.AsInteger := dmDatabase.qGen.fields[0].asinteger   ;
 dmDatabase.qGen.close ;
 end;
end;

procedure TdmDatabase.tblBatchRefTotalsAfterPost(DataSet: TDataSet);
begin
 if tblBatchRefTotals.UpdatesPending then
    begin
      tblBatchRefTotals.ApplyUpdates;
      tblBatchRefTotals.CommitUpdates;
    end;
end;

procedure TdmDatabase.tblGlobalAfterPost(DataSet: TDataSet);
begin
  if TuniQuery(DataSet).UpdatesPending then
     begin
      TuniQuery(DataSet).ApplyUpdates ;
      TuniQuery(DataSet).CommitUpdates ;

     end;
end;

procedure TdmDatabase.ZQMessageAfterInsert(DataSet: TDataSet);
var
  i : Integer ;
  TryAgain : Boolean ;
begin

  TryAgain := true ;
  i := 0 ;
  While TryAgain do
  begin
      try
      TryAgain := false ;
      tblGlobal.close;
      tblGlobal.Open;
      tblGlobal.Edit;

      except
        inc(i);
        if i < 5 then
        TryAgain := true else
        raise exception.Create(gettextlang(2059));
        sleep(100);
      end;
  end;
  // done : Pieter Locking case (after edit = lock)
  ZQMessageWMessageID.Value := tblGlobalWNewMessageID.Value;
  tblGlobalWNewMessageID.Value := tblGlobalWNewMessageID.Value + 1;
  tblGlobal.Post;
  tblGlobal.Close;
end;

procedure TdmDatabase.tblGlobalAfterOpen(DataSet: TDataSet);
begin
 //ShowMessage('open');
end;

procedure TdmDatabase.tblGlobalAfterClose(DataSet: TDataSet);
begin
 //ShowMessage('close');
end;

procedure TdmDatabase.ZQBatControlAfterInsert(DataSet: TDataSet);
var
  i : Integer ;
  TryAgain : Boolean ;
begin

  TryAgain := true ;
  i := 0 ;
  While TryAgain do
  begin
      try
      TryAgain := false ;
      tblGlobal.close;
      tblGlobal.Open;
      tblGlobal.Edit;

      except
        inc(i);
        if i < 5 then
        TryAgain := true else
        raise exception.Create(gettextlang(2059));
        sleep(100);
      end;
  end;
  // done : Pieter Locking case (after edit = lock)
  ZQBatControlWBatchID.Value := tblGlobalWNewBatchID.Value;
  ZQBatControlWInitBatID.AsInteger := ZQBatControlWBatchID.AsInteger;
  tblGlobalWNewBatchID.Value := tblGlobalWNewBatchID.Value + 1;
  tblGlobal.Post;
  tblGlobal.Close;
end;

procedure TdmDatabase.ZQTransActionAfterInsert(DataSet: TDataSet);
var
  i : Integer ;
  TryAgain : Boolean ;
begin

  TryAgain := true ;
  i := 0 ;
  While TryAgain do
  begin
      try
      TryAgain := false ;
      tblGlobal.close;
      tblGlobal.Open;
      tblGlobal.Edit;

      except
        inc(i);
        if i < 5 then
        TryAgain := true else
        raise exception.Create(gettextlang(2059));
        sleep(100);
      end;
  end;
  // done : Pieter Locking case (after edit = lock)
  ZQTransActionWTransactionID.Value := tblGlobalWNewTransactionID.Value;
  tblGlobalWNewTransactionID.Value := tblGlobalWNewTransactionID.Value + 1;
  tblGlobal.Post;
  tblGlobal.Close;
end;

procedure TdmDatabase.tblStockAdCalcFields(DataSet: TDataSet);
begin
tblStockAdSInputTax.AsString := GetAccountCode(tblStockAdWINPUTTAXID.AsInteger);
tblStockAdSOutPutTax.AsString := GetAccountCode(tblStockAdWOUTPUTTAXID.AsInteger);
tblStockAdSCostAccount.AsString := GetAccountCode(tblStockAdWCOSTACCOUNTID.AsInteger);
tblStockAdSSaleSACCOUNT.AsString := GetAccountCode(tblStockAdWSALESACCOUNTID.AsInteger);
tblStockAdSStockAccount.AsString := GetAccountCode(tblStockAdWSTOCKACCOUNTID.AsInteger);
end;

procedure TdmDatabase.tblTotalsBeforePost(DataSet: TDataSet);
begin
    if tblTotalsWYEARID.IsNull then
      tbltotalsWYEARID.AsInteger := (tblTotalsWPERIODID.AsInteger div 14) + 1 ;
end;

procedure TdmDatabase.tblTransactionBeforePost(DataSet: TDataSet);
begin
     if tblTransactionWYEARID.IsNull then
      tblTransactionWYEARID.AsInteger := (tblTransactionWPERIODID.AsInteger div 14) + 1 ;
end;

procedure TdmDatabase.ZQTransActionBeforePost(DataSet: TDataSet);
begin
     if ZQTransActionWYEARID.IsNull then
      ZQTransActionWYEARID.AsInteger := (ZQTransActionWPERIODID.AsInteger div 14) + 1 ;
end;

procedure TdmDatabase.ZSQLGenProccessorError(Processor: TUniScript;
  StatementIndex: Integer; E: Exception;
  var ErrorHandleAction: TZErrorHandleAction);
begin
  ErrorHandleAction := eaSkip ;
  if not ZSQLMonitor1.Active then exit ;

  if ScriptErrorList = '' then
  ScriptErrorList := E.Message 
  else
  ScriptErrorList := ScriptErrorList + #13+#10+'-----------------------------'+ #13+#10 + E.Message ;

end;

procedure TdmDatabase.TblContactsAfterInsert(DataSet: TDataSet);
begin
 TblContactsRESOURCEID.AsInteger := 1 ;
end;

procedure TdmDatabase.QContactsAfterInsert(DataSet: TDataSet);
begin
 QContactsRESOURCEID.AsInteger := 1 ;
end;

procedure TdmDatabase.QBOMAfterInsert(DataSet: TDataSet);

begin
 QBOMWBOMID.AsInteger := 1 +  StrToIntDef(VarToStr(OpenSqlAndGetFirtsColumnValue('select max(WBOMID) from Bom')),0) ;
end;

end.



