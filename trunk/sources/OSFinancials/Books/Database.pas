(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Database;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient,TCVariables,StdCtrls,TCashClasses,
  OSFGeneralRoutines,rpeval,rpalias, DAScript, UniScript,
  DBAccess, Uni, MemDS, DASQLMonitor, UniSQLMonitor, MySQLUniProvider,
  InterBaseUniProvider, OracleUniProvider, UniProvider,
  SQLServerUniProvider, DADump, UniDump,MEmdata;

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
    tblDocLine: TuniQuery;
    dsTransaction: TDataSource;
    tblTransaction: TuniTable;
    qryTransactionReport: TuniQuery;
    wwqryOpenDebits: TuniQuery;
    wwdsOpenDebits: TDataSource;
    wwqryOpenCredits: TuniQuery;
    wwdsOpenCredits: TDataSource;
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
    qGenMast: TuniQuery;
    dsGenMast: TDataSource;
    qGenDet: TuniQuery;
    dsGenDet: TDataSource;
    qGen: TuniQuery;
    qGenII: TuniQuery;
    Temp_1: TuniTable;
    qrySalespersonByProduct: TuniQuery;
    qBatPeriodTotals: TuniQuery;                
    DsBatPeriodTotals: TDataSource;
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
    tblDocHeader: TuniQuery;
    qrPrnDocLines: TuniQuery;
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
    tblSysParams: TuniQuery;
    tblBOMHead: TuniTable;
    tblBOMLines: TuniTable;
    tblProfiles: TuniTable;
    tblEmpMas: TuniTable;
    tblEmpSource: TuniTable;
    tblPayCon: TuniTable;
    tblPayTransact: TuniTable;
    tblBankDnl: TuniQuery;
    tblLocations: TuniTable;
    tblAssetMas: TuniTable;
    qryGroups: TuniQuery;
    DtUpdate: TUniUpdateSql;
    CtUpdate: TUniUpdateSql;
    tblJobProject: TuniTable;
    tblKeysCont: TuniTable;
    qryBatchTypesList: TuniQuery;
    CdsBankDnl: TClientDataSet;
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
    tblKeysContWKEYVALUE: TIntegerField;
    tblKeysContSKEYNAME: TStringField;
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
    tblBackOrderSDescription: TStringField;
    tblStockAdSInputTax: TStringField;
    tblStockAdSOutPutTax: TStringField;
    tblStockAdSCostAccount: TStringField;
    tblStockAdSSaleSACCOUNT: TStringField;
    tblStockAdSStockAccount: TStringField;
    ZCalTotals: TuniQuery;
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
    ZQGenBatches: TuniQuery;
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
    ZQDocLineSACCOUNTCODE: TStringField;
    ZQDocLineSMAINACCOUNTCODE: TStringField;
    ZQDocLineSSUBACCOUNTCODE: TStringField;
    ZQDocLineSDESCRIPTION: TStringField;
    ZQDocLineWACCOUNTTYPEID: TIntegerField;
    ZQDocLineWREPORTINGGROUP1ID: TIntegerField;
    ZQDocLineWREPORTINGGROUP2ID: TIntegerField;
    ZQDocLineBSUBACCOUNTS: TSmallintField;
    ZQDocLineBINCOMEEXPENSE: TSmallintField;
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
    tblGlobalw: TuniTable;
    tblGlobalwWNEWACCOUNTID: TIntegerField;
    tblGlobalwWNEWBACKORDERID: TIntegerField;
    tblGlobalwWNEWCONTACTID: TIntegerField;
    tblGlobalwWNEWBATCHTYPEID: TIntegerField;
    tblGlobalwWNEWBATCHID: TIntegerField;
    tblGlobalwWNEWGROUPID: TIntegerField;
    tblGlobalwWNEWCURRENCYID: TIntegerField;
    tblGlobalwWNEWDOCID: TIntegerField;
    tblGlobalwWNEWLABSPECSID: TIntegerField;
    tblGlobalwWNEWREPORTID: TIntegerField;
    tblGlobalwWNEWTRANSACTIONID: TIntegerField;
    tblGlobalwWNEWSTOCKID: TIntegerField;
    tblGlobalwWNEWUNITID: TIntegerField;
    tblGlobalwWNEWUSERID: TIntegerField;
    tblGlobalwWNEWMESSAGEID: TIntegerField;
    tblGlobalwWNEWSTOCKTRANSID: TIntegerField;
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
    ZUDummySql: TUniUpdateSql;
    ZQOILinksSDESCRIPTION: TStringField;
    ZUSQLtblBankDnl: TUniUpdateSql;
    tblBankDnlSEXTRADESCRIPTION: TStringField;
    tblDebtorWPOSTCOUNTRIES_ID: TIntegerField;
    tblDebtorWDELCOUNTRIES_ID: TIntegerField;
    tblCreditorWPOSTCOUNTRIES_ID: TIntegerField;
    tblCreditorWDELCOUNTRIES_ID: TIntegerField;
    tblSysVarsSBANKNAME1: TStringField;
    tblSysVarsSBANKNAME2: TStringField;
    tblSysVarsSBANKNUMBER2: TStringField;
    tblSysVarsSBANKNUMBER1: TStringField;
    tblDebtorSCOMPANYREGNO: TStringField;
    tblDebtorSFREEFIELD1: TStringField;
    tblDebtorSFREEFIELD2: TStringField;
    tblDebtorSFREEFIELD3: TStringField;
    tblCreditorSCOMPANYREGNO: TStringField;
    tblCreditorSFREEFIELD1: TStringField;
    tblCreditorSFREEFIELD2: TStringField;
    tblCreditorSFREEFIELD3: TStringField;
    tblSysVarsSBANKSWIFT1: TStringField;
    tblSysVarsSBANKIBAN1: TStringField;
    tblSysVarsSBANKSWIFT2: TStringField;
    tblSysVarsSBANKIBAN2: TStringField;
    tblSysVarsSBANKACCOUNTNAME1: TStringField;
    tblSysVarsSBANKACCOUNTNAME2: TStringField;
    ZQStockTrans: TuniQuery;
    ZUSQLStockTrans: TUniUpdateSql;
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
    ZSQLProc: TUniScript;
    ZQStockSEXTERNALID: TStringField;
    tblStockSEXTERNALID: TStringField;
    qryTransactionReportWDOCID: TIntegerField;
    tblBatchDPAYMENTDATE: TDateTimeField;
    tblBatchWDOCID: TIntegerField;
    tblBatchRefTotalsDPAYMENTDATE: TDateTimeField;
    tblBatchRefTotalsWDOCID: TIntegerField;
    tblTransactionDPAYMENTDATE: TDateTimeField;
    tblAccountWTAXACCOUNT: TIntegerField;
    tblTransactionWREMITTANCECOUNT: TIntegerField;
    tblStockFNETTOWEIGHT: TFloatField;
    tblStockFGROSSWEIGHT: TFloatField;
    ZQStockFNETTOWEIGHT: TFloatField;
    ZQStockFGROSSWEIGHT: TFloatField;
    tblDocLineWSORTNO: TIntegerField;
    TblReconBankWTAXID: TIntegerField;
    TblReconBankWCONTRAACCOUNTID: TIntegerField;
    TblReconBankWLINKEDID: TIntegerField;
    TblReconBankWREPORTINGGROUP1ID: TIntegerField;
    TblReconBankWREPORTINGGROUP2ID: TIntegerField;
    TblReconBankDPAYMENTDATE: TDateTimeField;
    TblReconBankWDOCID: TIntegerField;
    tblGroupsBDISABLE: TSmallintField;
    ZQGroupsBDISABLE: TSmallintField;
    ZQDocLineWSORTNO: TIntegerField;
    ZQDocLineBOPENITEM: TSmallintField;
    ZQDocLineBINACTIVE: TSmallintField;
    ZQDocLineWLINKACCOUNT: TIntegerField;
    ZQDocLineWTAXACCOUNT: TIntegerField;
    tblDocLineWREPORTINGGROUP1ID: TIntegerField;
    tblDocLineWREPORTINGGROUP2ID: TIntegerField;
    tblDocHeaderSEXTERNALID: TStringField;
    tblStockFREORDERQTYTRIG: TFloatField;
    tblStockSMANUFACTURER: TStringField;
    ZQStockFREORDERQTYTRIG: TFloatField;
    ZQStockSMANUFACTURER: TStringField;
    tblStockAdSEXTERNALID: TStringField;
    tblStockAdFNETTOWEIGHT: TFloatField;
    tblStockAdFGROSSWEIGHT: TFloatField;
    tblStockAdFREORDERQTYTRIG: TFloatField;
    tblStockAdSMANUFACTURER: TStringField;
    tblDebtorSLANGUAGE: TStringField;
    tblCreditorSLANGUAGE: TStringField;
    tblCreditorSDELIVERYCODE: TStringField;
    tblDebtorDREMITTANCE: TDateTimeField;
    tblDebtorSLAYOUTINVOICE: TStringField;
    tblDebtorSLAYOUTCREDITNOTE: TStringField;
    tblDebtorSLAYOUTQUOTE: TStringField;
    tblSysVarsWSYSVARSID: TIntegerField;
    qryDocHeadWPOSTALNAME: TIntegerField;
    qryDocHeadWPOSTALCONTACT: TIntegerField;
    qryDocHeadWDELNAME: TIntegerField;
    qryDocHeadWDELCONTACT: TIntegerField;
    qryDocHeadWTAXNUMBER: TIntegerField;
    tblDocHeaderWPOSTALNAME: TIntegerField;
    tblDocHeaderWPOSTALCONTACT: TIntegerField;
    tblDocHeaderWDELNAME: TIntegerField;
    tblDocHeaderWDELCONTACT: TIntegerField;
    tblDocHeaderWTAXNUMBER: TIntegerField;
    ZQDocHeadWPOSCOUNTRIES_ID: TIntegerField;
    ZQDocHeadWDELCOUNTRIES_ID: TIntegerField;
    ZQDocHeadSEXTERNALID: TStringField;
    ZQDocHeadWPOSTALNAME: TIntegerField;
    ZQDocHeadWPOSTALCONTACT: TIntegerField;
    ZQDocHeadWDELNAME: TIntegerField;
    ZQDocHeadWDELCONTACT: TIntegerField;
    ZQDocHeadWTAXNUMBER: TIntegerField;
    tblDocHeaderWCONTRAACCOUNT: TIntegerField;
    ZQDocHeadWCONTRAACCOUNT: TIntegerField;
    wwqryOpenDebitsISLINKED: TIntegerField;
    wwqryOpenCreditsISLINKED: TIntegerField;
    CdsBankDnlSEXTRADESCRIPTION: TStringField;
    ZUSQLReconBank: TUniUpdateSql;
    tblDocLineWACCOUNTID: TIntegerField;
    ZQDocLineWACCOUNTID: TIntegerField;
    qrySalesBySalespersonWSTOCKTYPEID: TIntegerField;
    tblStockFMINIMUMQTY: TFloatField;
    tblStockAdFMINIMUMQTY: TFloatField;
    ZQStockFMINIMUMQTY: TFloatField;
    tblGroupsWCOLOR: TIntegerField;
    tblGroupsWTEXTCOLOR: TIntegerField;
    tblStockSSTOCKCODESUP1: TStringField;
    tblStockSSTOCKCODESUP2: TStringField;
    ZQStockSSTOCKCODESUP1: TStringField;
    ZQStockSSTOCKCODESUP2: TStringField;
    ZQStockWLOCBATSERTYPEID: TIntegerField;
    ZQStockDesc: TuniQuery;
    ZUSQLStockDesc: TUniUpdateSql;
    ZQStockDescWSTOCKID: TIntegerField;
    ZQStockDescWLANGUAGEID: TIntegerField;
    ZQStockDescSDESCRIPTION: TStringField;
    ZQStockDescSEXTRADESCRIPTION: TBlobField;
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
    ZUSQLStockOptions: TUniUpdateSql;
    ZQDefoptions: TuniQuery;
    ZQDefoptionsWSTOCKID: TIntegerField;
    ZQDefoptionsWITEMOPTION1ID: TIntegerField;
    ZQDefoptionsWITEMOPTION2ID: TIntegerField;
    ZQDefoptionsWITEMOPTION3ID: TIntegerField;
    ZQDefoptionsWITEMOPTION4ID: TIntegerField;
    ZQDefoptionsWITEMOPTION5ID: TIntegerField;
    ZQDefoptionsWLEVEL: TIntegerField;
    ZQDefoptionsWLOOKUPTYPE: TIntegerField;
    ZUSQLDefoptions: TUniUpdateSql;
    tblDocHeaderWOPENITEMTRANSACTID: TIntegerField;
    tblUnitFUNITQTY: TFloatField;
    ZQStockWDEFAULTCOSTGROUP1ID: TIntegerField;
    tblDocHeaderFCURRENCYRATE: TFloatField;
    tblAbreviationsCKEY: TStringField;
    SQLServerUniProvider1: TSQLServerUniProvider;
    OracleUniProvider1: TOracleUniProvider;
    InterBaseUniProvider1: TInterBaseUniProvider;
    MySQLUniProvider1: TMySQLUniProvider;
    QryPosSalesReport: TUniQuery;
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
    qrBalSheetAccount: TUniQuery;
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
    UniTransaction1: TUniTransaction;
    ZQStockOptionsFEXTRAPRICE2: TFloatField;
    ZQStockOptionsFEXTRAPRICE3: TFloatField;
    UniSQLMonitor1: TUniSQLMonitor;
    tblSysVarsSBANKBIC1: TStringField;
    tblSysVarsSBANKBIC2: TStringField;
    procedure tblUserAfterInsert(DataSet: TDataSet);
    procedure tblAccountAfterInsert(DataSet: TDataSet);
    procedure tblBackOrderAfterInsert(DataSet: TDataSet);
    procedure tblBatchTypesAfterInsert(DataSet: TDataSet);
    procedure tblBatchControlAfterInsert(DataSet: TDataSet);
    procedure tblGroupsAfterInsert(DataSet: TDataSet);
    procedure tblCurrencyAfterInsert(DataSet: TDataSet);
    procedure tblDocHeaderAfterInsert(DataSet: TDataSet);
    procedure tblLabSpecsAfterInsert(DataSet: TDataSet);
    procedure tblTransactionAfterInsert(DataSet: TDataSet);
    procedure tblStockAfterInsert(DataSet: TDataSet);
    procedure tblUnitAfterInsert(DataSet: TDataSet);
    procedure tblBatchAfterInsert(DataSet: TDataSet);
    procedure tblStockTransAfterInsert(DataSet: TDataSet);
    procedure tblRepHeadAfterInsert(DataSet: TDataSet);
    procedure qryDocHeadBkCalcFields(DataSet: TDataSet);
    procedure tblBatchBeforePost(DataSet: TDataSet);
    procedure tblRepLineAfterInsert(DataSet: TDataSet);
    procedure tblAccountSMAINACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblAccountSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryInvDetailSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblBackOrderCalcFields(DataSet: TDataSet);
    procedure qrBalSheetAccountCalcFields(DataSet: TDataSet);
    procedure qGenAfterClose(DataSet: TDataSet);
    procedure tblStockAdAfterInsert(DataSet: TDataSet);
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
    procedure tblAssetMasAfterInsert(DataSet: TDataSet);
    procedure ADjSysDate(DataSet: TDataSet);
    procedure tblJobProjectAfterInsert(DataSet: TDataSet);
    procedure QryTAccountCrCalcFields(DataSet: TDataSet);
    procedure UnzipperFilePercentDone(Sender: TObject; Percent: Integer);
    procedure GetTheFieldsRight(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    function ExexSql(connectionname,sql:String) : variant ;
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
    procedure DataModuleDestroy(Sender: TObject);
    procedure QBOMAfterPost(DataSet: TDataSet);
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
    procedure ZQBatControlAfterInsert(DataSet: TDataSet);
    procedure ZQTransActionAfterInsert(DataSet: TDataSet);
    procedure tblStockAdCalcFields(DataSet: TDataSet);
    procedure tblTotalsBeforePost(DataSet: TDataSet);
    procedure tblTransactionBeforePost(DataSet: TDataSet);
    procedure ZQTransActionBeforePost(DataSet: TDataSet);
    procedure TblContactsAfterInsert(DataSet: TDataSet);
    procedure QContactsAfterInsert(DataSet: TDataSet);
    procedure QBOMAfterInsert(DataSet: TDataSet);
    procedure QadressPerAccountAfterInsert(DataSet: TDataSet);
    procedure ZQOILinksAfterInsert(DataSet: TDataSet);
    procedure QryTAccountCrWDESCRIPTIONIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure InitFieldsBeforeOpenDataset(DataSet: TDataSet);
    procedure InitQueryWithWhereStatement(DataSet: TDataSet);
    procedure tblSysParamsAfterInsert(DataSet: TDataSet);
    procedure ZQStockTransAfterInsert(DataSet: TDataSet);
    procedure ZQStockAfterInsert(DataSet: TDataSet);
    procedure ZQDocHeadAfterInsert(DataSet: TDataSet);
    procedure ZMainconnectionAfterConnect(Sender: TObject);
    procedure tblRepLineBeforeOpen(DataSet: TDataSet);
    procedure TblReconBankFAMOUNTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblBatchRefTotalsWREPORTINGGROUP1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblBatchSJOBCODEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblSysVarsAfterInsert(DataSet: TDataSet);
    procedure tblBatchBeforeOpen(DataSet: TDataSet);
    procedure TblReconBankBeforeOpen(DataSet: TDataSet);
    procedure qrySalesBySalespersonBeforeOpen(DataSet: TDataSet);
    procedure tblSysVarsBeforeOpen(DataSet: TDataSet);
    procedure QContactsBeforeOpen(DataSet: TDataSet);
    procedure TblContactsBeforeOpen(DataSet: TDataSet);
    procedure tblDocHeaderBeforeOpen(DataSet: TDataSet);
    procedure wwqryOpenDebitsBeforeOpen(DataSet: TDataSet);
    procedure wwqryOpenCreditsBeforeOpen(DataSet: TDataSet);
    procedure ZQStockOptionsAfterInsert(DataSet: TDataSet);
    procedure QEventsBeforePost(DataSet: TDataSet);
    procedure QTasksBeforePost(DataSet: TDataSet);
    procedure QContactsBeforePost(DataSet: TDataSet);
    procedure QResourcesBeforePost(DataSet: TDataSet);
    procedure ZQStockDescBeforeOpen(DataSet: TDataSet);
    procedure tblDocLineBeforeOpen(DataSet: TDataSet);
    procedure ZQDocLineBeforeOpen(DataSet: TDataSet);
    procedure tblBatchBeforeInsert(DataSet: TDataSet);
    procedure ZSQLGenProccessorError(Sender: TObject; E: Exception;
      SQL: String; var Action: TErrorAction);
    procedure ZSQLMonitor1SQL(Sender: TObject; Text: String;
      Flag: TDATraceFlag);
    procedure ZMainconnectionConnectionLost(Sender: TObject;
      Component: TComponent; ConnLostCause: TConnLostCause;
      var RetryMode: TRetryMode);

  private
    FExcOldValue: Double;
    FSetOfBooksPropertys: TSetOfBooksPropertys;


    procedure SetExcOldValue(const Value: Double);
    function GetExcOldValue: Double;
    procedure SetSetOfBooksPropertys(const Value: TSetOfBooksPropertys);
    function GetSQLList : TSqlList ;
    { Private declarations }
  public
   aeval:TRpEvaluator;
   rpalias :TRpAlias ;
   DefCostGroup1 : Integer ;
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
  BatchType     : Integer;
  DoAutoInc  : Boolean ;

  TmpBatFileNames ,RConBankTableName: String;

    Procedure CreateBatch(AName : String);
    Procedure CreateNewBatchRec(aBatchType:Integer);
    Function GetAccountCodeLength : integer ;
    Function GetFieldLength(ATabel,AField : String ;Default : Integer ) : integer ;
    property ExcOldValue : Double  read GetExcOldValue write SetExcOldValue;
    property SetOfBooksPropertys : TSetOfBooksPropertys  read FSetOfBooksPropertys write SetSetOfBooksPropertys;

    property SQLList : TSQLList  read GetSQLList ;
    procedure ConnectToBooks (ABooksItem : TBooksCollectionItem);
    function AppendBatchControlId(AUserID, aCurrentUser, ABatchTypeID,
      BPosted, BImported: Integer): Integer;
    function GetLocalSaveDir: String;
    procedure OnMessage(AMessage : String ) ;
    { Public declarations }
  end;

 {TMyZLoggingEvent = class(TZLoggingEvent)
     public
      procedure SetMessage (Astring : String ) ;
  end;  }

function  _IncrementString(Number : String;Increment:Integer = 1) : String;

Function  AddDashInStdAccCode(AccCode:String):String;
function  _CnvAccType(_AccountTypeID:Integer):Char;
Function  _ReadDescription(MessageID:Integer):String;
function  GetDescriptionFromTransaction(ATransactionId : Integer ) : String ;
Function  AddMessage(StrMessage : String;Unique:Boolean = false):Integer;
procedure UpdateMessage(MessageID:Integer ; StrMessage : String);
procedure DoCloseSetOfBooks(KeepUser:Boolean=False);stdCall;
procedure InitSetOfBooksPropertys ;
Function  SetBookStatus(Status:integer;StatType,State:Byte):Integer;
Function  DoOpenSetofBooks(ABookItem : TBooksCollectionItem):Integer;
Procedure ChangeQryTAcc(Dr:Boolean;aFilter,aSort:String;DStart,DEnd:Tdate);

function  FillStringsWithUnitDesc(AList:TStrings):Boolean;
function  FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;
function  GetNesteldNameFromGroupID(AGroupID : Integer ;var level : Integer) : String ;
function  SortClientDataSet(ClientDataSet: TClientDataSet; FieldName: String;Var AscIdx:Boolean): Boolean;
Procedure ShowErrMsg(errCode:Integer);
Function  GetErrMsg(errCode:Integer):String;
Function  GetThisBooksPath(BooksName:String):String;
function CheckMulty : Boolean ;


var
  dmDatabase: TdmDatabase;



implementation

uses DatabaseAccess, Password, ConvTOX,
  LedgerRoutines, Progress,globalfunctions,Variants, XRoutines, StrUtils,
  UDMTCCoreLink, UPluginsSharedUnit, DateUtils ;

{$R *.DFM}

function CheckMulty : Boolean ;
var
 LibID : Cardinal ;
 sFilename : String ;
 aOSFMultiUser : TOSFMultiUser ;
begin
 result := true ;
 sFilename :=  ExtractFilePath(Application.ExeName) +'RegMulti.dll' ;
 if FileExists(sFilename) then
    begin
      LibID := LoadLibrary(pchar(sFilename)) ;
      if LibID <> 0 then
         begin
            @aOSFMultiUser := GetProcAddress(LibID,'OSFMultiUser');
            if Assigned( aOSFMultiUser) then
               begin
                  result := aOSFMultiUser(Application.Handle,Application,dmDatabase.ZMainconnection);
               end;
            FreeLibrary(LibID);
         end;

    end else
    begin
      result := False ;
      showmessage('Removing reg multi.dll is not a nice way to use osF in production please suppport our product!')
    end;

end;
function TdmDatabase.GetLocalSaveDir: String;
begin
 result := DMTCCoreLink.GetLocalSaveDir ;
end;


procedure TdmDatabase.ConnectToBooks(ABooksItem: TBooksCollectionItem);
begin
  SetCurrentUser( -1) ;
  ZMainconnection.LoginPrompt := false ;
  DoCloseSetOfBooks;
  ZMainconnection.Database :=  ABooksItem.Database ;
  ZMainconnection.Username :=  ABooksItem.UserName ;
  DMTCCoreLink.ExtraOptions.Values['ORACLE'] := lowercase(TDatabaseRegistyRoutines.ReadOsfIni('DBTYPE','ORACLE','False'));
  if DMTCCoreLink.ExtraOptions.Values['ORACLE'] = 'true' then
   ZMainconnection.ProviderName := 'Oracle' else

    ZMainconnection.ProviderName := 'Interbase' ;
     if DMTCCoreLink.ExtraOptions.Values['ORACLE'] <> 'true' then
     begin
      ZMainconnection.SpecificOptions.Clear ;
      if pos (':',ABooksItem.UserName) > 1 then
        begin
          ZMainconnection.Username := copy(ABooksItem.UserName,1,pos (':',ABooksItem.UserName)-1) ;
          ZMainconnection.SpecificOptions.add('ROLENAME=' + copy(ABooksItem.UserName,pos (':',ABooksItem.UserName)+1,length(ABooksItem.UserName)));
       end;
    end;

  ZMainconnection.Password :=  ABooksItem.Password ;
  ZMainconnection.Server :=  ABooksItem.Server ;
  try
    ZMainconnection.Connect ;
  except
    PwdLoginWin ;
    tblUser.close ;
  end;
  if not ZMainconnection.Connected then exit ;
   if StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*) from users')),0) < 2 then
     SetCurrentUser( 0) ;

  ConvertToX(OSFDatabaseversion,ScriptErrorList,OnMessage);

  DocReferenceLength :=  GetFieldLength('DocHead','SReference',15);
  MainAccountLength := GetAccountCodeLength ;
  GetTheFieldsRight(nil) ;

  InitSetOfBooksPropertys ;
    if (TDatabaseRegistyRoutines.ReadOsfIni('DBTYPE','ORACLE','False') = 'True') then
        ShowMessage('Books props!');
  ReadAppConfig ;


 // ZSQLMonitor1.Options. := GetLocalSaveDir + 'SqlLogfile.txt';
 // ZSQLMonitor1.Active := ReadT3IniFile('INFO','DEBUGSQL','0') = '1' ;
end;

Function InctblKey(KeyName:String):Integer;
begin
  dmDatabase.tblKeysCont.Open;
  if dmDatabase.tblKeysCont.Locate('SKeyName',KeyName,[LoCaseInsensitive])= false then
  begin
    dmDatabase.tblKeysCont.Append;
    dmDatabase.tblKeysContSKeyName.Value := KeyName;
    Result := 1;
    dmDatabase.tblKeysContWKeyValue.Value := Result;
    dmDatabase.tblKeysCont.Post;
  end
  else
    Result := dmDatabase.tblKeysContWKeyValue.Value;
  dmDatabase.tblKeysCont.Edit;
  dmDatabase.tblKeysContWKeyValue.Value:=dmDatabase.tblKeysContWKeyValue.Value+1;
  dmDatabase.tblKeysCont.Post;
  dmDatabase.tblKeysCont.Close;
end;


procedure UpdateMessage(MessageID:Integer ; StrMessage : String);
begin
  DMTCCoreLink.UpdateDescription(MessageID,StrMessage);
end;

Function AddMessage(StrMessage : String;Unique:Boolean = false):Integer;

begin
  result := DMTCCoreLink.GetAddDescription(StrMessage,Unique) ;
end;


function  GetDescriptionFromTransaction(ATransactionId : Integer ) : String ;
var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.SQL.Text := 'select MEssages.SDescription from  transact join messages on (transact.WDescriptionId = Messages.WMessageId) where transact.WTransactionID =' + IntToStr(ATransactionId);
   AQuery.open ;
   result := AQuery.fields[0].AsString ;
 finally
  AQuery.free ;
 end;
end;

Function _ReadDescription(MessageID:Integer):String;
{Read Description From Message.db}
begin
  result := DMTCCoreLink.ReadDescription(MessageID);
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
begin
  result := TDataBaseStringRoutines.IncrementString(Number ,Increment);
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

procedure TdmDatabase.tblUserAfterInsert(DataSet: TDataSet);

begin
  tblUserWUserID.Value := DMTCCoreLink.GetNewId(tcidNEWUSERID);
  tblUserBDisabled.Value := 0;
  tblUserBAccounts.Value := 1;
  tblUserBStock.Value := 1;
  tblUserBBatchEntry.Value := 1;
  tblUserBCreditNote.Value := 1;
  tblUserBInvoices.Value := 1;
  tblUserBPurchases.Value := 1;
  tblUserBStockReturns.Value := 1;
  tblUserBReconciliation.Value := 1;
  tblUserBCreditorReports.Value := 1;
  tblUserBDebtorReports.Value := 1;
  tblUserBLedgerReports.Value := 1;
  tblUserBStockReports.Value := 1;
  tblUserBUserReports.Value := 1;
  tblUserBPosting.Value := 1;
  tblUserBGlobalProcesses.Value := 1;
  tblUserBSystemSetup.Value := 1;
end;

procedure TdmDatabase.tblAccountAfterInsert(DataSet: TDataSet);
begin
  tblAccountWAccountID.Value :=  DMTCCoreLink.GetNewId(tcidNEWACCOUNTID);
  tblAccountWREPORTINGGROUP1ID.Asinteger := 0 ;
  tblAccountWREPORTINGGROUP2ID.Asinteger := 0 ;
  tblAccountBSUBACCOUNTS.Asinteger := 0 ;
  tblAccountBINCOMEEXPENSE.Asinteger := 0 ;
  tblAccountDSysDate.AsDateTime:=Now;
end;

procedure TdmDatabase.tblBackOrderAfterInsert(DataSet: TDataSet);
begin
   tblBackOrderWBackOrderID.Value := DMTCCoreLink.GetNewId(tcidNEWBACKORDERID);
end;

procedure TdmDatabase.tblBatchTypesAfterInsert(DataSet: TDataSet);
begin
  tblBatchTypesWBatchTypeID.Value := DMTCCoreLink.GetNewId(tcidNEWBATCHTYPEID);
  tblBatchTypesBCashBook.Value := 0;
  tblBatchTypesBContraPerLine.Value := 0;
  tblBatchTypesBIncrementRefNo.Value := 0;
  tblBatchTypesBRepeatDetails.Value := 0;
  tblBatchTypesBConsolidateBalancing.Value := 0;
  tblBatchTypesBViewExclusive.Value := 1;
  tblBatchTypesWDebitCredit.Value := 0;
  tblBatchTypesWDefaultTaxID.Value := 0;
end;

procedure TdmDatabase.tblBatchControlAfterInsert(DataSet: TDataSet);

begin
  tblBatchControlWBatchID.Value := DMTCCoreLink.GetNewId(tcidNEWBATCHID);
  tblBatchControl.FieldByName('WInitBatID').AsInteger := tblBatchControlWBatchID.AsInteger;
end;

procedure TdmDatabase.tblGroupsAfterInsert(DataSet: TDataSet);

begin
  tblGroupsWGroupID.Value := DMTCCoreLink.GetNewId(tcidNEWGROUPID);
end;

procedure TdmDatabase.tblCurrencyAfterInsert(DataSet: TDataSet);
begin
  tblCurrencyWCurrencyID.Value := DMTCCoreLink.GetNewId(tcidNEWCURRENCYID);
end;

procedure TdmDatabase.tblDocHeaderAfterInsert(DataSet: TDataSet);
begin
 tblDocHeaderWDocID.Value := DMTCCoreLink.GetNewId(tcidNEWDOCID);
end;

procedure TdmDatabase.tblLabSpecsAfterInsert(DataSet: TDataSet);

begin
 tblLabSpecsWLabSpecsID.Value := DMTCCoreLink.GetNewId(tcidNEWLABSPECSID);
end;

procedure TdmDatabase.tblTransactionAfterInsert(DataSet: TDataSet);

begin
  tblTransactionWTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWTRANSACTIONID);
end;

procedure TdmDatabase.tblStockAfterInsert(DataSet: TDataSet);
begin
  tblStockWStockID.Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKID);
end;

procedure TdmDatabase.tblUnitAfterInsert(DataSet: TDataSet);

begin
  tblUnitWUnitID.Value := DMTCCoreLink.GetNewId(tcidNEWUNITID);
  tblUnitFUNITQTY.AsFloat := 1 ;

end;

procedure TdmDatabase.tblBatchAfterInsert(DataSet: TDataSet);
Var
  HoldAccountActive:Boolean;

begin
 // Why not atleast always set the date.
  if  tblBatchWLineID.IsNull then
  begin
  qGenBatchId.SQL.Text := 'select max(WLineID)  from ' + tblBatch.TableName ;
  qGenBatchId.open ;
  tblBatchWLineID.AsInteger := qGenBatchId.fields[0].asinteger   + 1 ;
  tblBatchWLINKEDID.AsInteger := tblBatchWLINEID.AsInteger;
  qGenBatchId.close ;
  end;


  tblBatchDDate.Value := Date ;
  tblBatchWREPORTINGGROUP1ID.AsInteger := DefCostGroup1 ;
  tblBatchWREPORTINGGROUP2ID.AsInteger := 0 ;
  tblBatchBEXCLUSIVE.AsInteger := 1 ;

  tblBatchWLINKEDID.AsInteger := tblBatchWLineID.AsInteger ;
  if Not CalledFromBatch then  exit;
  // done : Pieter getting a not in editmode error catching it
  CalledFromBatch := false ;
  TblBatch.DisableControls;
  try
  tblBatchFamount.AsString:='';
  tblBatchFTaxamount.AsString:='';
  tblBatchSTAX.Value:=DefaultTax;
  tblBatchRefTotals.Close;
  tblBatchRefTotals.TableName:=tblBatch.TableName;
  tblBatchRefTotals.Open;
  tblBatchTypes.Open;
  tblAccount.Filtered:=False;
  tblBatchRefTotals.Last;
  tblBatchTypes.Locate('WBatchTypeID', IntToStr(BatchType), []);
  HoldAccountActive:=tblAccount.Active;
  if not HoldAccountActive then tblAccount.Open;
  tblAccount.Locate('WAccountID', tblBatchTypesWContraAccountID.Value, []);
  tblBatchBExclusive.AsInteger:= ord(Not(tblBatchTypesBInclusiveMode.AsInteger =1));
  if tblBatchTypesBRepeatDetails.Value = 1 then
  Begin
    tblBatchSDescription.Value := tblBatchRefTotalsSDescription.Value;
    if not DoAutoInc then
     begin
    if tblBatchTypesBIncrementRefNo.Value = 1 then
      tblBatchSReference.Value := _IncrementString(tblBatchRefTotalsSReference.Value)
    else
      tblBatchSReference.Value := tblBatchRefTotalsSReference.Value;
     end;
      if tblBatchSReference.Value = '********' then
        tblBatchSReference.Value := '';

    if tblBatchRefTotals.RecordCount = 0 then begin
      tblBatchDDate.Value := Date;
      tblBatchDAllocatedDate.Value := Date;

      tblBatchSCONTRAACCOUNT.Value := tblAccountSMAINACCOUNTCODE.Value + '-' + tblAccountSSUBACCOUNTCODE.Value;
      tblBatchWCONTRAACCOUNTID.AsInteger := tblAccountWACCOUNTID.AsInteger ;


    end
    else begin
         tblBatchDDate.Value := tblBatchRefTotalsDDate.Value;
         tblBatchDAllocatedDate.Value := tblBatchRefTotalsDDate.Value;
         tblBatchSCONTRAACCOUNT.Value:=tblBatchRefTotalsSCONTRAACCOUNT.Value;
         tblBatchWCONTRAACCOUNTID.Value:=tblBatchRefTotalsWCONTRAACCOUNTID.Value;
       end;
    tblBatchSACCOUNT.Value:=tblBatchRefTotalsSACCOUNT.Value;
    tblBatchSTAX.Value:=tblBatchRefTotalsSTAX.Value ;
    tblBatchWACCOUNTID.Value:=tblBatchRefTotalsWACCOUNTID.Value;
    tblBatchWTAXID.Value:=tblBatchRefTotalsWTAXID.Value
  end
  else
  begin
  if not DoAutoInc then
  begin
  if tblBatchTypesBIncrementRefNo.Value = 1 then
      tblBatchSReference.Value := _IncrementString(tblBatchRefTotalsSReference.Value)
    else

      tblBatchSReference.Value := tblBatchRefTotalsSReference.Value;
   end;
  if tblBatch.RecordCount = 0 then
      tblBatchDDate.Value := Date
  else
      tblBatchDDate.Value := tblBatchRefTotalsDDate.Value;
    tblBatchDAllocatedDate.Value := tblBatchDDate.Value;
    tblBatchSCONTRAACCOUNT.Value := tblAccountSMAINACCOUNTCODE.Value + '-' + tblAccountSSUBACCOUNTCODE.Value;
    tblBatchWCONTRAACCOUNTID.AsInteger := tblAccountWACCOUNTID.AsInteger ;
    tblBatchBReconciled.Value := 0;
  end;
  {The VAriable BatchID should be In Sync}
 // dmDatabase.tblBatchWlineID.Value := IncBatchLine(BatchCtrlID);
  tblAccount.Active:=HoldAccountActive;
  tblBatchRefTotals.Close;
  tblbatch.Post;
  tblbatch.Edit;
  finally
    // if passes here then CalledFromBatch = true see exit on top;
    CalledFromBatch := true ;
    TblBatch.EnableControls;
  end;
end;

procedure TdmDatabase.tblStockTransAfterInsert(DataSet: TDataSet);
begin
  tblStockTransWStockTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKTRANSID);
end;

procedure TdmDatabase.tblRepHeadAfterInsert(DataSet: TDataSet);

begin
  tblRepHeadWReportID.Value := DMTCCoreLink.GetNewId(tcidNEWREPORTID);
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

procedure TdmDatabase.tblBatchBeforePost(DataSet: TDataSet);

begin
 if tblBatch.State = dsinsert  then
  if tblBatchWLineID.IsNull then
  begin

  tblBatchWLineID.AsInteger := StrToIntDef(VartoStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select 1 + max(WLineID)  from ' + tblBatch.TableName)),1);
  if tblBatchWLINKEDID.IsNull then
    tblBatchWLINKEDID.AsInteger := tblBatchWLineID.AsInteger ;
  end;
 if tblBatchDALLOCATEDDATE.IsNull then tblBatchDALLOCATEDDATE.AsDateTime  := date ;

 tblBatchDDATE.AsDateTime := trunc(tblBatchDDATE.AsDateTime);



    If Not CalledFromBatch then Exit;
   if (Not CalledFromBatch) or IsBalPost then exit;
   if RetExcOldValue then begin
     TblBatch.DisableControls;
     try

     If TblBatchFCREDIT.Value>0 then begin
       FieldInMod:=6;
       
       TblBatchFCREDIT.Value:=ExcOldValue;
       FieldInMod:=0;
     end;
     If TblBatchFDEBIT.Value>0 then begin
       FieldInMod:=5;

       TblBatchFDEBIT.Value:=ExcOldValue;
       FieldInMod:=0;
     end;
     //showmessage(FloatToStr(TblBatchFDEBIT.Value+TblBatchFCREDIT.Value));
     finally
       TblBatch.EnableControls ;
     end;
    // TblBatch.EnableControls;
   end;

end;

procedure TdmDatabase.tblRepLineAfterInsert(DataSet: TDataSet);
var
  I:integer;
begin
  tblRepLineBSupressPrint.Value:=1;
  tblRepLineBMainAccount.Value:=0;
  tblRepLineWReportID.Value:=tblRepHeadWReportID.Value;
  For i:=1 to 13 do
   tblRepLine.FieldByName('SColumn'+IntToStr(i)).value:='';

  DmDatabase.tblRepLineWROWID.AsInteger :=  DmDatabase.tblRepLine.RecordCount +1;
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

end;

procedure TdmDatabase.qryInvDetailSACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text:=_CnvAccType(qryInvDetailWAccountTypeID.Value)+qryInvDetailSACCOUNTCODE.Value;

end;

procedure TdmDatabase.tblBackOrderCalcFields(DataSet: TDataSet);
Var
  AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
    AQuery.Connection := ZMainConnection ;
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

procedure TdmDatabase.tblStockAdAfterInsert(DataSet: TDataSet);

begin
  DataSet.fieldbyname('WStockID').Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKID);
end;

procedure TdmDatabase.tblStockAdSInputTaxGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := TDataBaseRoutines.AddDashInAccCode(tblStockAdSInputTax.Value);

end;

procedure TdmDatabase.tblStockAdSOutputTaxGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := TDataBaseRoutines.AddDashInAccCode(tblStockAdSOutputTax.Value);

end;

procedure TdmDatabase.tblStockAdSCostAccountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := TDataBaseRoutines.AddDashInAccCode(tblStockAdSCostAccount.Value);

end;

procedure TdmDatabase.tblStockAdSSaleSACCOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := TDataBaseRoutines.AddDashInAccCode(tblStockAdSSaleSACCOUNT.Value);

end;

procedure TdmDatabase.tblStockAdSStockAccountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := TDataBaseRoutines.AddDashInAccCode(tblStockAdSStockAccount.Value);

end;

Function GetThisBooksPath(BooksName:String):String;
begin
  result := '' ;
  if TheGlobalDataObject.Books.FindBooksByName(BooksName) <> nil then
     result := TheGlobalDataObject.Books.FindBooksByName(BooksName).Database ;
end;

Function  DoOpenSetofBooks(ABookItem : TBooksCollectionItem):Integer;
begin
  Result := 0;
  SetCurrentUser(0);




    ABookItem.Active := true ;

   dmdatabase.ConnectToBooks(ABookItem);

  // done : pieter Must be before temp table create's
   if not dmdatabase.ZMainconnection.Connected then exit ;




   if not DirectoryExists(ApplicationPath+'DataTmp') then
      MkDir(ApplicationPath+'DataTmp');
   // see if its allowed
   If not CheckMulty then
      begin
        CloseSetOfBooks ;
       dmdatabase.ZMainconnection.Connected := false ;
       dmdatabase.ZMainconnection.Database := '' ;
       dmdatabase.ZMainconnection.Server := '' ; 
       Abort ;
      end;

// display used db etc.


//    if not CheckDatabaseVer then exit;
   with dmDatabase do
   begin
      tblUser.Open;
      tblUser.Filtered := false ;
    //  DMTCCoreLink.currentuser := 0 ;

      if not tblUser.Locate('WUserID', 0, []) then
      begin

        { fmPassword.Showmodal; Changed to the next line}
        if CurrentUser = -1 then
        begin
        if Assigned(ExternalLoginControlerPlugin) and DMTCCoreLink.ReadNwReportOp('CONTROLERLOGIN',false) and (UpperCase(TDatabaseRegistyRoutines.ReadRegValue('','CONTROLERLOGIN')) = 'TRUE' )then
            begin
             DMTCCoreLink.currentuser :=  ExternalLoginControlerPlugin(Application,dmDatabase.ZMainconnection);
             if CurrentUser > 0 then
             Result := 0 else
             Result := 2102 ;

            end else
           Result := PwdLoginWin
        end else
         result := 0 ;
      end;

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
          if tblUserBSYSTEMSETUP.AsInteger = 0 then
          begin
            tblUser.Edit;
            tblUserBSystemSetup.Value := 1;
            tblUserBONLINE.AsInteger := DMTCCoreLink.OpenSqlReturnFirstColumn('select CURRENT_CONNECTION from RDB$DATABASE') ;
            tblUser.Post;
          end;


          SetCurrentUser(tblUserWUserID.Value);
          RealUser:=-1;
        end ;
   end;

   DMTCCoreLink.AApplication := Application ;
   ReadAppConfig ;

end;

procedure initSetOfBooksPropertys ;
var
 MaxDecNum,AccountRecCount : Integer ;
 aDesc : String ;
begin


  AccountRecCount := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from account')),0) ;

   if not TDatabaseTableRoutines.FieldExists('SYSVARS','WSYSVARSID') then
                      begin
                        TDataBaseRoutines.ExecSql('ALTER TABLE SYSVARS ADD WSYSVARSID Integer NOT NULL') ;
                        TDataBaseRoutines.ExecSql('UPDATE SYSVARS SET WSYSVARSID = 1 WHERE WSYSVARSID IS NULL');
                      end;
         if   (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
        ShowMessage('Stap3');
    // lets iniialize the data object to prevent reads from DB.
    // and have the info at your fingertips :-)
    try
    dmDatabase.tblSysVars.Open ;
    except
       on e: Exception do
         ShowMessage(e.Message);
    end;
      if   (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
      ShowMessage('Stap 2-2');
    if dmDatabase.tblSysVarsBTaxInvoiceBased.AsInteger = 1 then
    dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased := tbPayments
    else
    dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased :=  tbInvoice ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount := dmDatabase.tblSysVarsWDebtorsControlID.AsInteger ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount := dmDatabase.tblSysVarsWCreditorsControlID.AsInteger ;
    dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings := dmDatabase.tblSysVarsWRetainedIncomeID.AsInteger ;
      if   (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
     ShowMessage('Stap 2-3');
    If (dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount = 0 ) or
       (dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount = 0) or
       (dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings = 0) then
       begin
         if  AccountRecCount > 1 then
         OSFMessageDlg('Your sysvar table has been corrupted. Please set the fields WDebtorsControlID,WCreditorsControlID,WRetainedIncomeID to a valide WaccountId before proceding!'+
         #13+#10 + IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) + ' ' + IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount)
         + ' ' + IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings)    ,mtError,[mbyes],0);
       end;
     // test to see is all accounts exist
     aDesc := TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) +  ' ' +
        TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount)+  ' ' +
        TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings)   ;

    If (TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) = '' ) or
       (TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount) = '' ) or
       (TDataBaseRoutines.GetAccountFullDescription(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings) = '' ) then
       begin
        if AccountRecCount > 1 then
         OSFMessageDlg('Your sysvar table has been corrupted. Please check to see if the accounts WDebtorsControlID,WCreditorsControlID,WRetainedIncomeID exsist in the account table!'+#13+#10+
         aDesc+ IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) + ' ' + IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount)
         + ' ' + IntToStr(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings)  ,mtError,[mbyes],0);
       end;

    // LOOK IF 0 ACCOUNT EXISTs else we get strange behavior in batches
         if   (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
        ShowMessage('Stap4');
     if AccountRecCount > 1 then
       if StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from account WHERE waCCOUNTID = 0')),0) <> 1 then
       DMTCCoreLink.ExecSql('Insert into ACCOUNT(WACCOUNTID,SACCOUNTCODE,SMAINACCOUNTCODE,SSUBACCOUNTCODE,SDESCRIPTION,WACCOUNTTYPEID, '+
                            'WREPORTINGGROUP1ID,WREPORTINGGROUP2ID,BSUBACCOUNTS,BINCOMEEXPENSE,BOPENITEM,BINACTIVE,DSYSDATE,WPROFILEID,' +
                            'WLINKACCOUNT,WTAXACCOUNT) Values( 0 ,null,null,null,' + QuotedStr('Empty') + ',4,0,0,0,0,0,0,null,null,0,null)');

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
   if not (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
  MaxDecNum := abs(StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT b.RDB$FIELD_SCALE FROM RDB$RELATION_FIELDS a '+
  ' join RDB$FIELDS b on (a.RDB$FIELD_SOURCE = b.RDB$FIELD_NAME ) where a.RDB$FIELD_NAME = ' + QuotedStr('FAMOUNT') +' and a.RDB$RELATION_NAME =' + QuotedStr('TRANSACT'))),2))
  else MaxDecNum := 2 ;
  if MaxDecNum < dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty then
     dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty := MaxDecNum ;



  dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals := ReadReportOp('WDocRowDecimals',8).AsInteger;
  dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimalsShow := ReadReportOp('WDocRowDecimalsShow',2).AsInteger;
  dmDatabase.SetOfBooksPropertys.DataParameter.BDataEntryReal  := ReadNwReportOp('BDataEntryReal').AsBoolean;
 // dmDatabase.SetOfBooksPropertys.DataParameter.SEdtDigSymb :=  ReadNwReportOp('SEdtDigSymb').AsString;
 // dmDatabase.SetOfBooksPropertys.DataParameter.SedtDecSymb :=  ReadNwReportOp('SedtDecSymb').AsString;
  dmDatabase.SetOfBooksPropertys.DataParameter.BUseCurSign :=  ReadNwReportOp('BUseCurSign',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState :=  ReadNwReportOp('CBViewAllBankState',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBNoCalcBatch :=  ReadNwReportOp('CBNoCalcBatch',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBUseCurrentDateForReports := ReadNwReportOp('CBUseCurrentDateForRep',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.cbContraISRef := ReadNwReportOp('cbContraISRef',false).AsBoolean ;
  dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan := ReadNwReportOp('CBDONotUseReportMan',true).AsBoolean ;
  dmDatabase.SetOfBooksPropertys.DataParameter.NOWarningUnposted :=  ReadNwReportOp('CBNOWarningUnposted',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.NoPrintMessage := ReadNwReportOp('CBNoPrintMessage',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.CheckDocReferenceUsed := ReadNwReportOp('STKCheckReferenceUsed',false).AsBoolean;
  dmDatabase.SetOfBooksPropertys.DataParameter.DoNotCreateItems := ReadNwReportOp('STKDoNotCreateItems',false).AsBoolean ;
  dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel := DMTCCoreLink.ReadNwReportOp('cbLogLevel',0);
  dmDatabase.tblReportingOptions.Open ;
  dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals := dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsInteger ;
  dmDatabase.tblReportingOptions.Close ;
  dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask := GetViewMask(0) ;
end;


procedure DoCloseSetOfBooks(KeepUser:Boolean=False);
{
  Closes the current set of books.

}
var
 i : Integer ;
begin
  // try and except just show message
  try
  //Close all the tables
  with dmDatabase do
  begin
    for i := 0 to dmDatabase.ComponentCount -1 do
       begin
         if (dmDatabase.Components[i] is TuniQuery) then
            dmDatabase.Components[i].tag := 0 ;

         if (dmDatabase.Components[i] is TuniTable) then
            dmDatabase.Components[i].tag := 0 ;
       end;
    if Not KeepUser then
    begin
    SavePass :='';
    CurrentUserName :='';
    end;
    if DmDatabase.ZMainConnection.Connected then
       IsProperlyClosed;
    DmDatabase.ZMainConnection.Connected := False ;
    DmDatabase.ZMainConnection.Database := '' ;
    DmDatabase.ZMainConnection.Server := '' ;
    dmDatabase.CdsBankDnl.Close ;
   end;
   except
     on e : Exception do
       begin
          OSFMessageDlg(e.message,mtError,[mbok],0);
       end;
   end;
end;

procedure TdmDatabase.tblAssetMasAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('WAssetID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWSTOCKID);
end;


Function TdmDatabase.AppendBatchControlId(AUserID,aCurrentUser,ABatchTypeID,BPosted,BImported:Integer) : Integer;
begin
     if not ZQBatControl.Active then
      ZQBatControl.Open ;

     ZQBatControl.Append;
     ZQBatControlWUserID.Value := AUserID;
     ZQBatControlWBatchTypeID.Value := ABatchTypeID;
     Result :=ZQBatControlWBatchID.AsInteger ;
     tblUser.Open;
     if ReadNwReportOp('BUseGeneralNumber','false').Asboolean then
         tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
     tblUser.Locate('WUserID', aCurrentUser, []);
     tblUser.Edit;
     ZQBatControlSBatchNumber.Value := tblUserSNextBatchNumber.Value;
     tblUsersNextBatchNumber.Value := _IncrementString(tblUsersNextBatchNumber.Value);
      tblUser.Post;
      ZQBatControlBPosted.Value := BPosted;
      ZQBatControlBImported.Value := BImported;
      ZQBatControl.Post;
end;


Procedure TdmDatabase.CreateNewBatchRec(aBatchType:Integer);
begin
  AppendBatchControlId(CurrentUser,CurrentUser,aBatchType,0,0);
  ZQBatControl.SQL.Text := SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl');
end;

procedure TdmDatabase.ADjSysDate(DataSet: TDataSet);
begin

end;
// done : Pieter Best to do on post so the new id wil not be canceld

Function  SetBookStatus(Status:integer;StatType,State:Byte):Integer;
begin
 result := 0 ;
 Case StatType of
 1: Begin {Set of books in use 0:not , 1:in use}
      Result := (Status AND not 1 ) OR State
    end;
 2: Begin {last opened 0:not the last, 1:that last }
       Result := (Status AND Not 2) OR (State*2);
     end;
 end;
end;


procedure TdmDatabase.tblJobProjectAfterInsert(DataSet: TDataSet);
begin
    DataSet.FieldByName('WJobProjectID').AsInteger:= InctblKey('WPrjCodeID')
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
    vTable.Connection :=ZMainconnection ;
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


function GetNesteldNameFromGroupID(AGroupID : Integer;var level : Integer ) : String ;
{var
  LocalName : String ;
  ParentID : Integer ;
   AQry : TuniQuery ;}
begin
  // prevent recursion loop
  result := DMTCCoreLink.GroupsObject.GetGroupNesteldName(AGroupID) ;
  {
  AQry := TuniQuery.create(nil);
  try
     AQry.Connection := DMTCCoreLink.TheZConnection ;
  If level = 10 then exit ;
  inc(level);
  result := '' ;
  AQry.sql.Text := ' Select * FROM Groups where WGROUPID = :WGroupId' ;
  AQry.Params[0].AsInteger := AGroupID ;
  AQry.open ;
  ParentID := AQry.fieldByName('WPARENTGROUP2ID').AsInteger ;
  LocalName := AQry.fieldByName('SDESCRIPTION').AsString ;
  AQry.close ;
  if  ParentID <> 0 then
  result := GetNesteldNameFromGroupID(ParentID,level) ;
  if result = '' then
     result :=  LocalName else
     result := result + '@' + LocalName ;
  dec(level);
  finally
   AQry.free ;
  end;}
end;



function FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;

begin
 result := TDataBaseRoutines.FillStringsWithReportingGroups(AList,TpGroupID,AsLookup) ;
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
  tblBankDnlSACCOUNTCODE.size := 15 ;              
  {tblReportingOptionsSGLLEDGERFROMACCOUNT.size := MainAccountLength + 4 ;
  tblReportingOptionsSGLLEDGERTOACCOUNT.size := MainAccountLength + 4 ;

  tblReportingOptionsSDEBTORLISTINGFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTORLISTINGTOACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTORMOVEMENTFROMACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTORMOVEMENTTOACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTORAGEFROM.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTORAGETO.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDITORAGEFROM.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDITORAGETO.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDLISTINGFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDLISTINGTOACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDMOVEMENTSFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDMOVEMENTSTOACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSACCOUNTLISTINGFROMACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSACCOUNTLISTINGTOACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSBUDGETPERFFROMACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSBUDGETPERFTOACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDTRANSFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSCREDTRANSTOACCOUNT.Size := MainAccountLength + 4 ;

  tblReportingOptionsSDEBTRANSFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTRANSTOACCOUNT.Size := MainAccountLength + 4 ;

  tblReportingOptionsSGLMOVEMENTFROMACCOUNT.Size := MainAccountLength + 4 ;
  tblReportingOptionsSGLMOVEMENTTOACCOUNT.Size := MainAccountLength + 4 ;

  tblReportingOptionsSDEBTSTATEMENTTOACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSDEBTSTATEMENTFROMACC.Size := MainAccountLength + 4 ;

  tblReportingOptionsSLABELFROMACC.Size := MainAccountLength + 4 ;
  tblReportingOptionsSLABELTOACC.Size := MainAccountLength + 4 ;

  tblReportingOptionsSSALESBYCUSTFROMCUST.Size := MainAccountLength + 4 ;
  tblReportingOptionsSSALESBYCUSTTOCUST.Size := MainAccountLength + 4 ;
  tblReportingOptionsSPurchBySuppFromSupp.Size := MainAccountLength + 4 ;
  tblReportingOptionsSPurchBySuppToSupp.Size := MainAccountLength + 4 ; }
  DMTCCoreLink.InitFieldLengtsForDatasetfields(tblReportingOptions,'Select * from ReportOp ');
  tblRepLineSITEMNAME.Size := DMTCCoreLink.GetFieldLength('REPLINE','SITEMNAME');


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

   ZQStockOUTTAXCODE.Size := MainAccountLength+3 ;
   ZQStockINTAXCODE.Size := MainAccountLength+3 ;


  // Set the fields of the SQL replacements here
  DMTCCoreLink.InitFieldLengths  ;

end;


procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
 i : Integer ;
begin
   ChangeCursor := False ;
  FSetOfBooksPropertys := TSetOfBooksPropertys.create(self);
  // done : pieter moved to anny digets
  // in create remeber all sizes in tag for stringfield
 if ZMainconnection.Connected then
   raise Exception.Create('Error designtime connection is open. Please recompile');
  ZMainconnection.Database := '' ;

  for i := 0 to ComponentCount -1 do
     begin
        if  (Components[i] is TStringField) then
             Components[i].Tag := (Components[i] as TStringField).Size ;
     end;

 aeval:=TRpEvaluator.Create(self);
 aeval.OnGetSQLValue :=  ExexSql ;
 rpalias :=TRpAlias.Create(self);

end;

procedure TdmDatabase.tblBatchSCONTRAACCOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // Done : Pieter Dont show contra for the auto balance bookings
  if tblBatchSReference.AsString <> '********' then
    Text := Sender.asstring ;
end;

procedure TdmDatabase.qryGroupsBeforePost(DataSet: TDataSet);
begin
 if qryGroups.State = dsinsert then
 begin
    DataSet.FieldByName('WGroupID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWGROUPID);
  end;
end;

procedure TdmDatabase.tblBatchAfterEdit(DataSet: TDataSet);
begin
// done : Pieter lets remeber the current Totals ?.
       if (TblBatchFCREDIT.Value>0) then
        begin
          ExcOldValue:=TblBatchFCREDIT.AsFloat ;
        end;
      if (TblBatchFDEBIT.Value>0) then
        begin
          ExcOldValue:=TblBatchFDEBIT.Asfloat;
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

function TdmDatabase.GetFieldLength(ATabel, AField: String;Default : Integer ): integer;

begin
   Result := DMTCCoreLink.GetFieldLength(ATabel, AField);
   if result < 1 then
   Result := Default ;
end;


procedure TdmDatabase.SetSetOfBooksPropertys(
  const Value: TSetOfBooksPropertys);
begin
  FSetOfBooksPropertys := Value;
end;

procedure TdmDatabase.DataModuleDestroy(Sender: TObject);
begin
 
 FSetOfBooksPropertys.free ;
 rpalias.free ;
 aeval.free;

end;

procedure TdmDatabase.QBOMAfterPost(DataSet: TDataSet);
begin
 TuniQuery(DataSet).ApplyUpdates ;
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


procedure TdmDatabase.tblBatchControlBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('DSysDate').AsDateTime:=Now;
end;

function TdmDatabase.GetSQLList : TSqlList ;
begin
  result := DMTCCoreLink.SQLList ;
end;



procedure TdmDatabase.CreateBatch(AName: String);
var
 AQuery : TuniQuery ;
begin
 try
 SQLList.ParamsList.values['BATCHNAME'] :=  AName ;



 if TDataBaseRoutines.TableExist(AName) then
     begin
      if not TDatabaseTableRoutines.FieldExists(AName,'WUNITID') then
     begin
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +AName +' ADD FUNITQTY Numeric(12,8)');
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +AName +' ADD WUNITID integer');
     end;
     exit ;
     end;
 AQuery := TuniQuery.Create(nil) ;
  try
    AQuery.connection := ZMainConnection ;
    AQuery.sql.text := SQLList.GetFormatedSQLByName('createBatch');
    AQuery.ExecSql ;
    // ZMainConnection.DbcConnection.GetMetadata.ClearCache ;
{the philosophy of the ZeosDBOs is that the resultset is kept (also while executing updates) until it is retrieved again. This is also the behaviour of JDBC on which the ZeosDBOs are based (see: ZDBC-acticle in the knowledge base). And this is implemented in ZeosDBOs for any DB that it supports. Your request will result in a new feature of ZeosDSOs and we have to look how it can be implemented.
 To achieve hard commits for Firebird you just have to disconnect from database and then connect again. This is the only way how "hard" commits will be executed.
 }


  //  ZMainConnection.Connected := false ;
  //  ZMainConnection.Connected := True ;
  //  makes querys close this is never good :-(

 if DMTCCoreLink.GetFieldLength(AName,'SDESCRIPTION') <>  DMTCCoreLink.MessageLength then
    begin
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +AName +' ALTER SDESCRIPTION TYPE varChar('+IntToStr(DMTCCoreLink.MessageLength)+'); ');
    end;
 
    
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
 // ZQReportOpNextNum.Close ;
 // ZQReportOpNextNum.SQL.Text := SQLList.GetFormatedSQLByName('Database_NextNum_OpReport');
 // ZQReportOpNextNum.open ;

  tblOpReportWOPTIONID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_OPREP_ID');
  //ZQReportOpNextNum.fields[0].asInteger ;
  // ZQReportOpNextNum.close ;
end;

procedure TdmDatabase.tblBatchRefTotalsBeforePost(DataSet: TDataSet);
begin
 if dmDatabase.tblBatchRefTotalsWLineID.IsNull then
 begin
 qGen.SQL.Text := 'select 1 + max(WLineID)  from ' + tblBatchRefTotals.TableName ;
 qGen.open ;
 tblBatchRefTotalsWLineID.AsInteger := qGen.fields[0].asinteger   ;
  qGen.close ;
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
begin
  ZQMessageWMessageID.Value := DMTCCoreLink.GetNewId(tcidNEWMESSAGEID);
end;

procedure TdmDatabase.ZQBatControlAfterInsert(DataSet: TDataSet);
begin
  ZQBatControlWBatchID.Value := DMTCCoreLink.GetNewId(tcidNEWBATCHID);
  ZQBatControlWInitBatID.AsInteger := ZQBatControlWBatchID.AsInteger;
end;

procedure TdmDatabase.ZQTransActionAfterInsert(DataSet: TDataSet);

begin
  ZQTransActionWTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWTRANSACTIONID);

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

procedure TdmDatabase.TblContactsAfterInsert(DataSet: TDataSet);
begin
 TblContactsRESOURCEID.AsInteger := 1 ;
end;

procedure TdmDatabase.QContactsAfterInsert(DataSet: TDataSet);
begin
 QContactsRESOURCEID.AsInteger := 1 ;
 QContactsRECORDID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWCONTACTID);
end;

procedure TdmDatabase.QBOMAfterInsert(DataSet: TDataSet);

begin
 QBOMWBOMID.AsInteger := 1 +  StrToIntDef(VarToStr(OpenSqlAndGetFirtsColumnValue('select max(WBOMID) from Bom')),0) ;
end;

procedure TdmDatabase.QadressPerAccountAfterInsert(DataSet: TDataSet);
begin
QadressPerAccountWADDRESSPERACCOUNTID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWADDRESSPERACCOUNT);
end;

procedure TdmDatabase.ZQOILinksAfterInsert(DataSet: TDataSet);
begin
  dataset.FieldByName('WOILINKSID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWOILINKS);
end;

procedure TdmDatabase.QryTAccountCrWDESCRIPTIONIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := _readDescription(sender.AsInteger);
end;

procedure TdmDatabase.InitFieldsBeforeOpenDataset(DataSet: TDataSet);
begin

 if (DataSet is TuniTable) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from '+ (DataSet as TuniTable).TableName +' where 1=0'  );
 if (DataSet is TuniQuery) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0');

end;

procedure TdmDatabase.InitQueryWithWhereStatement(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0')

 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where 1 = 0');
 end;
end;

procedure TdmDatabase.tblSysParamsAfterInsert(DataSet: TDataSet);
begin
 tblSysParamsWPARAMID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID');
end;

procedure TdmDatabase.ZQStockTransAfterInsert(DataSet: TDataSet);
begin
 ZQStockTransWStockTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKTRANSID);
end;

procedure TdmDatabase.ZQStockAfterInsert(DataSet: TDataSet);
begin
  ZQStockWStockID.Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKID);
end;

procedure TdmDatabase.ZQDocHeadAfterInsert(DataSet: TDataSet);
begin
 ZQDocHeadWDocID.Value := DMTCCoreLink.GetNewId(tcidNEWDOCID);
end;

procedure TdmDatabase.ZMainconnectionAfterConnect(Sender: TObject);
var
 AQuery : TuniQuery ;
 Firebird20 : Boolean ;
begin
  DMTCCoreLink.ExtraOptions.values['ORACLE'] := LowerCase(TDatabaseRegistyRoutines.ReadOsfIni('DBTYPE','ORACLE','False'))  ;
  Firebird20 := true ;
  AQuery := TuniQuery.create(nil) ;
  try
   AQuery.Connection := ZMainconnection ;

   AQuery.sql.Text := 'Select trim(RDB$DATABASE.RDB$DESCRIPTION) FROM RDB$DATABASE'  ;
   try
    if not (TDatabaseRegistyRoutines.ReadOsfIni('DBTYPE','ORACLE','False') = 'True') then
   AQuery.open ;
   except
     Firebird20 := false ;
   end;

  finally
    AQuery.free ;
  end;
  // check firebird 2.0
  if  not Firebird20 then
    OSFMessageDlg('Error firebird 2.1 is not installled, uninstall firebird 1.5 and download firebird 2.1+ at http://www.firebirdsql.org/',mtWarning,[mbok],0);
 DMTCCoreLink.GroupsObject.Clear ;
 //DMTCCoreLink.AApplication := Application ;
end;

procedure TdmDatabase.ZMainconnectionConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
RetryMode := rmReconnectExecute ;
end;

procedure TdmDatabase.OnMessage(AMessage: String);
begin
// if ZSQLMonitor1.active then
//  OSFMessageDlg(AMessage,mtInformation,[mbYes],0,true) ;
end;


{ TMyZLoggingEvent }

procedure TdmDatabase.tblRepLineBeforeOpen(DataSet: TDataSet);
begin
  tblRepLine.IndexFieldNames := 'WROWID';
end;

procedure TdmDatabase.TblReconBankFAMOUNTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  If DisplayText then
   begin
    if  TblReconBankSTAX.value = copy( GetTextLang(1099),1, TblReconBankSTAX.Size) then
        Text := FormatFloat('0.00',-sender.asfloat)
        else
        Text := FormatFloat('0.00',sender.asfloat) ;
   end;
end;

procedure TdmDatabase.tblBatchRefTotalsWREPORTINGGROUP1IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
  var
   Level : Integer ;
begin
 text := '' ;

// if (sender.AsInteger <> 0){ (and DisplayText) }then
//   begin
      Level := 0 ;
      text := DMTCCoreLink.GroupsObject.GetGroupNesteldName(sender.AsInteger);
//   end else  text :=  sender.AsString ;

end;

procedure TdmDatabase.tblBatchSJOBCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  // if DisplayText then
    Text := TDataBaseProjectRoutines.GetProjectCode(StrToIntDef(Sender.asstring,0));
end;

procedure TdmDatabase.tblSysVarsAfterInsert(DataSet: TDataSet);
begin
   tblSysVarsWSYSVARSID.AsInteger := 1 ;
end;

procedure TdmDatabase.tblBatchBeforeOpen(DataSet: TDataSet);
begin
 if DMTCCoreLink.GetFieldLength((DataSet as TuniTable).TableName,'SDESCRIPTION') <>  DMTCCoreLink.MessageLength then
    begin
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +(DataSet as TuniTable).TableName +' ALTER SDESCRIPTION TYPE varChar('+IntToStr(DMTCCoreLink.MessageLength)+'); ');
    end;
InitFieldsBeforeOpenDataset(DataSet);
end;

procedure TdmDatabase.TblReconBankBeforeOpen(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where 1 = 0');
 end;
 TDatabaseTableRoutines.UpdateQuery(TblReconBank,RConBankTableName,['WLINEID']);

end;

procedure TdmDatabase.qrySalesBySalespersonBeforeOpen(DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text );
end;

procedure TdmDatabase.tblSysVarsBeforeOpen(DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from sysvars where 1 = 0');
end;

procedure TdmDatabase.QContactsBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from contacts where RecordID is null');
end;

procedure TdmDatabase.TblContactsBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from contacts where RecordID is null');
end;

procedure TdmDatabase.tblDocHeaderBeforeOpen(DataSet: TDataSet);
begin
  if DataSet.Tag = 100 then exit ;
 TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from dochead where WDocid is null' );
 TDatabaseTableRoutines.UpdateQuery(dataset as TuniQuery,'DOCHEAD',['WDOCID']);

end;

procedure TdmDatabase.wwqryOpenDebitsBeforeOpen(DataSet: TDataSet);
begin
  wwqryOpenDebitsSDESCRIPTION.Size := DMTCCoreLink.MessageLength ;
end;

procedure TdmDatabase.wwqryOpenCreditsBeforeOpen(DataSet: TDataSet);
begin
  wwqryOpenCreditsSDESCRIPTION.Size := DMTCCoreLink.MessageLength ;
end;

procedure TdmDatabase.ZQStockOptionsAfterInsert(DataSet: TDataSet);
begin
   ZQStockOptionsWSTOCKOPTIONSID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_STOCKOPTIONS');
end;

procedure TdmDatabase.QEventsBeforePost(DataSet: TDataSet);
begin
  if QEventsRECORDID.AsInteger <= 0 then
     QEventsRECORDID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_EVENTS_ID');

end;

procedure TdmDatabase.QTasksBeforePost(DataSet: TDataSet);
begin
  if QTasksRECORDID.AsInteger <= 0 then
     QTasksRECORDID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_TASKS_ID');
end;

procedure TdmDatabase.QContactsBeforePost(DataSet: TDataSet);
begin
   if QContactsRECORDID.AsInteger <= 0 then
     QContactsRECORDID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_CONTACTS_ID');
end;

procedure TdmDatabase.QResourcesBeforePost(DataSet: TDataSet);
begin
   if QResourcesRESOURCEID.AsInteger <= 0 then
     QResourcesRESOURCEID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_RESOURCEID_ID');
end;

procedure TdmDatabase.ZQStockDescBeforeOpen(DataSet: TDataSet);
begin
 TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from stock_descriptions where WStockid is null' );


end;

procedure TdmDatabase.tblDocLineBeforeOpen(DataSet: TDataSet);
begin
   TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from docline where Wdocid is null' );
   TDatabaseTableRoutines.UpdateQuery(TuniQuery(DataSet),'docline',['Wdocid','wdoclineid']);
end;

procedure TdmDatabase.ZQDocLineBeforeOpen(DataSet: TDataSet);
begin
    TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from docline where Wdocid is null' );
    TDatabaseTableRoutines.UpdateQuery(TuniQuery(DataSet),'docline',['Wdocid','wdoclineid']);
end;

procedure TdmDatabase.tblBatchBeforeInsert(DataSet: TDataSet);
begin
// Stop insert on scroll if used from batch.
 if (Screen.ActiveForm <> nil) and ((Screen.ActiveForm.Name = 'fmBatchEntry') or(Screen.ActiveForm.Name = 'fmBatchEntryBank')) then
 if not dataset.ControlsDisabled then
  if (glLastMouseWeel > (GetTickCount - 500)) then
   begin
      glLastMouseWeel := 0 ;
      sysutils.Abort ;
   end;
end;

function TdmDatabase.ExexSql(connectionname, sql: String): variant;
begin
 result := DMTCCoreLink.OpenSqlReturnFirstColumn(Sql);
end;

procedure TdmDatabase.ZSQLGenProccessorError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
   Action := eaContinue ;
  //if not ZSQLMonitor1.Active then exit ;
  exit ;

  if ScriptErrorList = '' then
  ScriptErrorList := E.Message
  else
  ScriptErrorList := ScriptErrorList + #13+#10+'-----------------------------'+ #13+#10 + E.Message ;

end;

procedure TdmDatabase.ZSQLMonitor1SQL(Sender: TObject; Text: String;
  Flag: TDATraceFlag);

 var
  aForm : Tform ;
  aMemo : TMemo ;
begin
 if Application.FindComponent('LOGWINDOW') = nil then
    begin
      aForm := tform.Create(Application) ;
      aForm.name := 'LOGWINDOW' ;
      aForm.Top := 0 ;
      aForm.left := 0 ;
      aForm.Width := 400 ;
      aForm.Height := 200 ;
      aMemo := TMemo.Create(aForm);
      aMemo.Parent := aForm ;
      aMemo.ScrollBars := ssBoth ;
      aMemo.Align := alClient ;
      aMemo.Name := 'MEMO1' ;
      aForm.Show ;
    end;
  aForm := TForm(Application.FindComponent('LOGWINDOW'));

 (AForm.FindComponent('MEMO1') as TMemo).Lines.Add(Text) ;
 if not AForm.Visible then
 AForm.show ;
 if AForm.Parent <> Screen.ActiveForm then
    AForm.Parent := Screen.ActiveForm ;
  AForm.BringToFront ;
  (AForm.FindComponent('MEMO1') as TMemo).PopupMenu := nil ;

end;

end.



