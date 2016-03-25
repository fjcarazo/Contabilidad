unit UDMCoreDocData;

interface

uses
  SysUtils, Classes,  DB, 
  DBAccess , Uni, MemDS;

type
  TDMCoreDocData = class(TDataModule)
    ZQDocHead: TuniQuery;
    ZUSQLDocHead: TUniUpdateSql;
    ZQDocLine: TuniQuery;
    ZSQLDocLine: TUniUpdateSql;
    ZQStock: TuniQuery;
    ZSQLStock: TUniUpdateSql;
    ZQStockTrans: TuniQuery;
    ZUSQLStockTrans: TUniUpdateSql;
    ZQBom: TuniQuery;
    ZQAccount: TuniQuery;
    ZQDebtor: TuniQuery;
    ZQCreditor: TuniQuery;
    ZQBatch: TuniQuery;
    ZUSQLBatch: TUniUpdateSql;
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
    ZQBatchAggregate: TuniQuery;
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
    ZQAccountWACCOUNTID: TIntegerField;
    ZQAccountSACCOUNTCODE: TStringField;
    ZQAccountSMAINACCOUNTCODE: TStringField;
    ZQAccountSSUBACCOUNTCODE: TStringField;
    ZQAccountSDESCRIPTION: TStringField;
    ZQAccountWACCOUNTTYPEID: TIntegerField;
    ZQAccountWREPORTINGGROUP1ID: TIntegerField;
    ZQAccountWREPORTINGGROUP2ID: TIntegerField;
    ZQAccountBSUBACCOUNTS: TSmallintField;
    ZQAccountBINCOMEEXPENSE: TSmallintField;
    ZQAccountDSYSDATE: TDateTimeField;
    ZQAccountWPROFILEID: TIntegerField;
    ZQDebtorWACCOUNTID: TIntegerField;
    ZQDebtorWCONTACTID: TIntegerField;
    ZQDebtorSPASSWORD: TStringField;
    ZQDebtorSPOSTAL1: TStringField;
    ZQDebtorSPOSTAL2: TStringField;
    ZQDebtorSPOSTAL3: TStringField;
    ZQDebtorSPOSTALCODE: TStringField;
    ZQDebtorSDELIVERY1: TStringField;
    ZQDebtorSDELIVERY2: TStringField;
    ZQDebtorSDELIVERY3: TStringField;
    ZQDebtorSDELIVERYCODE: TStringField;
    ZQDebtorSTELEPHONE1: TStringField;
    ZQDebtorSTELEPHONE2: TStringField;
    ZQDebtorSFAX: TStringField;
    ZQDebtorSEMAIL: TStringField;
    ZQDebtorSBANKNAME: TStringField;
    ZQDebtorSBRANCHCODE: TStringField;
    ZQDebtorSBANKACCOUNTNUMBER: TStringField;
    ZQDebtorSBANKACCOUNTNAME: TStringField;
    ZQDebtorSCREDITCARDNUMBER: TStringField;
    ZQDebtorDEXPIRYDATE: TDateTimeField;
    ZQDebtorSCREDITCARDTYPE: TStringField;
    ZQDebtorSCREDITCARDHOLDER: TStringField;
    ZQDebtorFCREDITLIMIT: TFloatField;
    ZQDebtorFCHARGEAMOUNT: TFloatField;
    ZQDebtorFDISCOUNT: TFloatField;
    ZQDebtorFINTEREST: TFloatField;
    ZQDebtorWBANKID: TIntegerField;
    ZQDebtorWSALESMANID: TIntegerField;
    ZQDebtorBOPENITEM: TSmallintField;
    ZQDebtorBPOSTBBF: TSmallintField;
    ZQDebtorBDISABLED: TSmallintField;
    ZQDebtorSMESSAGE: TStringField;
    ZQDebtorWDEFAULTPRICETYPEID: TIntegerField;
    ZQDebtorDLASTACTIVITY: TDateTimeField;
    ZQDebtorWCURRENCYID: TIntegerField;
    ZQDebtorWFOREXACCOUNTID: TIntegerField;
    ZQDebtorSREFERENCE: TStringField;
    ZQDebtorDSYSDATE: TDateTimeField;
    ZQDebtorWDUEDAYS: TIntegerField;
    ZQDebtorWDEFAULTACCOUNT: TIntegerField;
    ZQDebtorWDEFAULTTAX: TIntegerField;
    ZQCreditorWACCOUNTID: TIntegerField;
    ZQCreditorSCODE: TStringField;
    ZQCreditorWCONTACTID: TIntegerField;
    ZQCreditorSPASSWORD: TStringField;
    ZQCreditorSPOSTAL1: TStringField;
    ZQCreditorSPOSTAL2: TStringField;
    ZQCreditorSPOSTAL3: TStringField;
    ZQCreditorSPOSTALCODE: TStringField;
    ZQCreditorSDELIVERY1: TStringField;
    ZQCreditorSDELIVERY2: TStringField;
    ZQCreditorSDELIVERY3: TStringField;
    ZQCreditorSTELEPHONE1: TStringField;
    ZQCreditorSTELEPHONE2: TStringField;
    ZQCreditorSFAX: TStringField;
    ZQCreditorSEMAIL: TStringField;
    ZQCreditorWBANKNAME: TStringField;
    ZQCreditorSBRANCHCODE: TStringField;
    ZQCreditorSBANKACCOUNTNUMBER: TStringField;
    ZQCreditorSBANKACCOUNTNAME: TStringField;
    ZQCreditorFCREDITLIMIT: TFloatField;
    ZQCreditorFCHARGEAMOUNT: TFloatField;
    ZQCreditorBOPENITEM: TSmallintField;
    ZQCreditorBPOSTBBF: TSmallintField;
    ZQCreditorDLASTACTIVITY: TDateTimeField;
    ZQCreditorWCURRENCYID: TIntegerField;
    ZQCreditorWFOREXACCOUNTID: TIntegerField;
    ZQCreditorSMESSAGE: TStringField;
    ZQCreditorSREFERENCE: TStringField;
    ZQCreditorFDISCOUNT: TFloatField;
    ZQCreditorWDEFAULTPRICETYPEID: TIntegerField;
    ZQCreditorDSYSDATE: TDateTimeField;
    ZQCreditorWDUEDAYS: TIntegerField;
    ZQCreditorWDEFAULTACCOUNT: TIntegerField;
    ZQCreditorWDEFAULTTAX: TIntegerField;
    ZQBomWBOMID: TIntegerField;
    ZQBomWSTOCKID: TIntegerField;
    ZQBomWLINKEDSTOCKID: TIntegerField;
    ZQBomFQTY: TFloatField;
    ZQBatchWLINEID: TIntegerField;
    ZQBatchSREFERENCE: TStringField;
    ZQBatchSACCOUNT: TStringField;
    ZQBatchSDESCRIPTION: TStringField;
    ZQBatchFDEBIT: TFloatField;
    ZQBatchFAMOUNT: TFloatField;
    ZQBatchSTAX: TStringField;
    ZQBatchDDATE: TDateTimeField;
    ZQBatchFCREDIT: TFloatField;
    ZQBatchSCONTRAACCOUNT: TStringField;
    ZQBatchFTAXAMOUNT: TFloatField;
    ZQBatchDALLOCATEDDATE: TDateTimeField;
    ZQBatchBRECONCILED: TIntegerField;
    ZQBatchBEXCLUSIVE: TIntegerField;
    ZQBatchWACCOUNTID: TIntegerField;
    ZQBatchFQTY: TFloatField;
    ZQBatchWPROFILEID: TIntegerField;
    ZQBatchWTAX2ID: TIntegerField;
    ZQBatchNOTUSED: TFloatField;
    ZQBatchSPROFILE: TStringField;
    ZQBatchSJOBCODE: TStringField;
    ZQBatchSTAX2: TStringField;
    ZQBatchDSYSDATE: TDateTimeField;
    ZQBatchFTAX2AMOUNT: TFloatField;
    ZQTax: TuniQuery;
    ZQTaxWACCOUNTID: TIntegerField;
    ZQTaxSACCOUNTCODE: TStringField;
    ZQTaxSMAINACCOUNTCODE: TStringField;
    ZQTaxSSUBACCOUNTCODE: TStringField;
    ZQTaxSDESCRIPTION: TStringField;
    ZQTaxWACCOUNTTYPEID: TIntegerField;
    ZQTaxWREPORTINGGROUP1ID: TIntegerField;
    ZQTaxWREPORTINGGROUP2ID: TIntegerField;
    ZQTaxBSUBACCOUNTS: TSmallintField;
    ZQTaxBINCOMEEXPENSE: TSmallintField;
    ZQTaxDSYSDATE: TDateTimeField;
    ZQTaxWPROFILEID: TIntegerField;
    ZQTaxWACCOUNTID_1: TIntegerField;
    ZQTaxSDESCRIPTION_1: TStringField;
    ZQTaxDSTARTDATE: TDateTimeField;
    ZQTaxDENDDATE: TDateTimeField;
    ZQTaxFRATE: TFloatField;
    ZQTaxDSYSDATE_1: TDateTimeField;
    ZQContraAccount: TuniQuery;
    ZQContraAccountWACCOUNTID: TIntegerField;
    ZQContraAccountSACCOUNTCODE: TStringField;
    ZQContraAccountSMAINACCOUNTCODE: TStringField;
    ZQContraAccountSSUBACCOUNTCODE: TStringField;
    ZQContraAccountSDESCRIPTION: TStringField;
    ZQContraAccountWACCOUNTTYPEID: TIntegerField;
    ZQContraAccountWREPORTINGGROUP1ID: TIntegerField;
    ZQContraAccountWREPORTINGGROUP2ID: TIntegerField;
    ZQContraAccountBSUBACCOUNTS: TSmallintField;
    ZQContraAccountBINCOMEEXPENSE: TSmallintField;
    ZQContraAccountDSYSDATE: TDateTimeField;
    ZQContraAccountWPROFILEID: TIntegerField;
    ZUSQLBackOrder: TUniUpdateSql;
    ZQBackOrder: TuniQuery;
    ZQBackOrderWBACKORDERID: TIntegerField;
    ZQBackOrderWACCOUNTID: TIntegerField;
    ZQBackOrderWSTOCKID: TIntegerField;
    ZQBackOrderFQTY: TFloatField;
    ZQBackOrderFSELLINGPRICE: TFloatField;
    ZQBackOrderBSELECTED: TSmallintField;
    ZQBackOrderDSYSDATE: TDateTimeField;
    ZQDebtorDREMITTANCE: TDateTimeField;
    ZQAccountBOPENITEM: TSmallintField;
    ZQAccountBINACTIVE: TSmallintField;
    ZQAccountWLINKACCOUNT: TIntegerField;
    ZQBatchWTAXID: TIntegerField;
    ZQBatchWCONTRAACCOUNTID: TIntegerField;
    ZQBatchBLINKED: TIntegerField;
    ZQBatchWLINKEDID: TIntegerField;
    ZQBatchWREPORTINGGROUP1ID: TIntegerField;
    ZQBatchWREPORTINGGROUP2ID: TIntegerField;
    ZQDebtorWPOSTCOUNTRIES_ID: TIntegerField;
    ZQDebtorWDELCOUNTRIES_ID: TIntegerField;
    ZQDebtorSCOMPANYREGNO: TStringField;
    ZQDebtorSFREEFIELD1: TStringField;
    ZQDebtorSFREEFIELD2: TStringField;
    ZQDebtorSFREEFIELD3: TStringField;
    ZQCreditorWPOSTCOUNTRIES_ID: TIntegerField;
    ZQCreditorWDELCOUNTRIES_ID: TIntegerField;
    ZQCreditorSCOMPANYREGNO: TStringField;
    ZQCreditorSFREEFIELD1: TStringField;
    ZQCreditorSFREEFIELD2: TStringField;
    ZQCreditorSFREEFIELD3: TStringField;
    ZQBatchDPAYMENTDATE: TDateTimeField;
    ZQBatchWDOCID: TIntegerField;
    ZQDocLineWSORTNO: TIntegerField;
    ZQDocLineWREPORTINGGROUP1ID: TIntegerField;
    ZQDocLineWREPORTINGGROUP2ID: TIntegerField;
    ZQDocHeadWPOSCOUNTRIES_ID: TIntegerField;
    ZQDocHeadWDELCOUNTRIES_ID: TIntegerField;
    ZQDocHeadSEXTERNALID: TStringField;
    ZQStockSEXTERNALID: TStringField;
    ZQStockFNETTOWEIGHT: TFloatField;
    ZQStockFGROSSWEIGHT: TFloatField;
    ZQStockFREORDERQTYTRIG: TFloatField;
    ZQStockSMANUFACTURER: TStringField;
    ZQCreditorSLANGUAGE: TStringField;
    ZQCreditorSDELIVERYCODE: TStringField;
    ZQDebtorSLANGUAGE: TStringField;
    ZQCreditorSLAYOUTINVOICE: TStringField;
    ZQCreditorSLAYOUTCREDITNOTE: TStringField;
    ZQCreditorSLAYOUTQUOTE: TStringField;
    ZQDebtorSLAYOUTINVOICE: TStringField;
    ZQDebtorSLAYOUTCREDITNOTE: TStringField;
    ZQDebtorSLAYOUTQUOTE: TStringField;
    ZQDocHeadWPOSTALNAME: TIntegerField;
    ZQDocHeadWPOSTALCONTACT: TIntegerField;
    ZQDocHeadWDELNAME: TIntegerField;
    ZQDocHeadWDELCONTACT: TIntegerField;
    ZQDocHeadWTAXNUMBER: TIntegerField;
    ZQDocHeadWCONTRAACCOUNT: TIntegerField;
    ZQBomFPERCENTAGEOFSALE: TFloatField;
    ZQDocLineWACCOUNTID: TIntegerField;
    ZQDoclineOptions: TuniQuery;
    ZUSQLDoclineOptions: TUniUpdateSql;
    ZQStockOptions: TuniQuery;
    ZUSQLStockOptions: TUniUpdateSql;
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
    ZQDoclineOptionsWDOCLINEOPTIONSID: TIntegerField;
    ZQDoclineOptionsWDOCID: TIntegerField;
    ZQDoclineOptionsWLINEID: TIntegerField;
    ZQDoclineOptionsWITEMOPTIONVALUE1ID: TIntegerField;
    ZQDoclineOptionsWITEMOPTIONVALUE2ID: TIntegerField;
    ZQDoclineOptionsWITEMOPTIONVALUE3ID: TIntegerField;
    ZQDoclineOptionsWITEMOPTIONVALUE4ID: TIntegerField;
    ZQDoclineOptionsWITEMOPTIONVALUE5ID: TIntegerField;
    ZQDoclineOptionsFEXTRAPRICE: TFloatField;
    ZQDoclineOptionsFQTY: TFloatField;
    ZQDoclineOptionsWDESCRIPTIONID: TIntegerField;
    ZQStockTransWLINEID: TIntegerField;
    ZQStockFMINIMUMQTY: TFloatField;
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
    ZQDocHeadWOPENITEMTRANSACTID: TIntegerField;
    ZQBackOrderSSOURCE: TStringField;
    ZQBackOrderFDISCOUNT: TFloatField;
    ZQBackOrderFPRICE: TFloatField;
    ZQStockSSTOCKCODESUP1: TStringField;
    ZQStockSSTOCKCODESUP2: TStringField;
    ZQBackOrderWUNITID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZQStockTransAfterInsert(DataSet: TDataSet);
    procedure ZQBackOrderAfterInsert(DataSet: TDataSet);
    procedure ZQBatchAfterInsert(DataSet: TDataSet);
    procedure InitFieldsWithAndORWhere(DataSet: TDataSet);
    procedure InitFieldsWithWhereClause(DataSet: TDataSet);
    procedure ZQBatchAggregateBeforeOpen(DataSet: TDataSet);
    procedure ZQDocHeadAfterInsert(DataSet: TDataSet);
    procedure ZQDocHeadBeforeOpen(DataSet: TDataSet);
    procedure ZQStockBeforeOpen(DataSet: TDataSet);
    procedure InitFieldsWithWAccountId(DataSet: TDataSet);
    procedure InitFieldsFromTax(DataSet: TDataSet);
    procedure ZQDocLineBeforeOpen(DataSet: TDataSet);
    procedure ZQStockOptionsAfterInsert(DataSet: TDataSet);
    procedure ZQDoclineOptionsAfterInsert(DataSet: TDataSet);
    procedure ZQDoclineOptionsBeforeOpen(DataSet: TDataSet);
    procedure ZQStockOptionsBeforeOpen(DataSet: TDataSet);
  private
    FBatchName: String;
    procedure SetBatchName(const Value: String);
    { Private declarations }
  public
    FGlobalBatchid : Integer ;
    DoNotChangePurchasePrice : Boolean ;
    Property BatchName : String  read FBatchName write SetBatchName;
    procedure SaveUBL20Invoice(ADocid : Integer ;AFilename : String );
    procedure CloseAll ;
    { Public declarations }
  end;


implementation

uses OSFGeneralRoutines,TCashClasses,
  UDMTCCoreLink;

{$R *.dfm}

procedure TDMCoreDocData.DataModuleCreate(Sender: TObject);
begin
  FGlobalBatchid := 0 ;
  DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TDMCoreDocData.SetBatchName(const Value: String);
begin
  DMTCCoreLink.SQLList.ParamsList.values['BATCHNAME'] :=  Value ;
  FBatchName := Value;
  ZQBatch.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_select') ;
  ZUSQLBatch.DeleteSQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Delete') ;
  ZUSQLBatch.InsertSQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Insert') ;
  ZUSQLBatch.ModifySQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Edit') ;

end;

procedure TDMCoreDocData.ZQStockTransAfterInsert(DataSet: TDataSet);

begin
  ZQStockTransWStockTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWSTOCKTRANSID);
end;

procedure TDMCoreDocData.ZQBackOrderAfterInsert(DataSet: TDataSet);

begin
   ZQBackOrderWBackOrderID.Value := DMTCCoreLink.GetNewId(tcidNEWBACKORDERID);
end;

procedure TDMCoreDocData.ZQBatchAfterInsert(DataSet: TDataSet);
begin
 inc(FGlobalBatchid);
 ZQBatchWLINEID.asinteger :=  FGlobalBatchid ;
 ZQBatchWLINKEDID.asinteger :=  FGlobalBatchid ;
end;

procedure TDMCoreDocData.InitFieldsWithAndORWhere(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin

 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' and 1 = 0')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' where 1 = 0');
 end;
end;

procedure TDMCoreDocData.InitFieldsWithWhereClause(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where 1 = 0');
 end;
end;

procedure TDMCoreDocData.ZQBatchAggregateBeforeOpen(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text +' where 1 = 0');

end;

procedure TDMCoreDocData.ZQDocHeadAfterInsert(DataSet: TDataSet);
begin
  ZQDocHeadWDocID.Value := DMTCCoreLink.GetNewId(tcidNEWDOCID);
end;

procedure TDMCoreDocData.ZQDocHeadBeforeOpen(DataSet: TDataSet);
begin
if DataSet.Tag <> 100 then
 begin
   TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from dochead where WDocId is null');
   TDatabaseTableRoutines.UpdateQuery(ZQDocHead,'DOCHEAD',['WDOCID']);
 end;
end;

procedure TDMCoreDocData.ZQStockBeforeOpen(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin

 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' and Wstockid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' where Wstockid is null');
 end;
end;


procedure TDMCoreDocData.InitFieldsWithWAccountId(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin

 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' and Waccountid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' where Waccountid is null');
 end;
end;

procedure TDMCoreDocData.InitFieldsFromTax(DataSet: TDataSet);
begin
 if (DataSet is TuniQuery) then
 begin

 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' and account.Waccountid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.DeleteOrderBy((DataSet as TuniQuery).SQL.Text) + ' where account.Waccountid is null');
 end;
end;

procedure TDMCoreDocData.CloseAll;
var
 i : Integer ;
begin
  for i := 0 to Self.ComponentCount -1 do
    if (self.Components[i] is TuniQuery) then
      (self.Components[i] as TuniQuery).Close ;

end;

procedure TDMCoreDocData.ZQDocLineBeforeOpen(DataSet: TDataSet);
begin
  TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from docline where WDocId is null');
end;

procedure TDMCoreDocData.ZQStockOptionsAfterInsert(DataSet: TDataSet);
begin
  ZQStockOptionsWSTOCKOPTIONSID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_STOCKOPTIONS');
end;

procedure TDMCoreDocData.ZQDoclineOptionsAfterInsert(DataSet: TDataSet);
begin
   ZQDoclineOptionsWDOCLINEOPTIONSID.AsInteger := DMTCCoreLink.GetNewIdStr('DOCLINEOPTIONS');
end;

procedure TDMCoreDocData.ZQDoclineOptionsBeforeOpen(DataSet: TDataSet);
begin
if DataSet.Tag <> 100 then
 begin
   TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from DOCLINEOPTIONS where WDOCLINEOPTIONSID is null');
   TDatabaseTableRoutines.UpdateQuery(ZQDoclineOptions,'DOCLINEOPTIONS',['WDOCLINEOPTIONSID']);
 end;
end;

procedure TDMCoreDocData.ZQStockOptionsBeforeOpen(DataSet: TDataSet);
begin
if DataSet.Tag <> 100 then
 begin
   TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(DataSet,'Select * from STOCKOPTIONS where WSTOCKOPTIONSID is null');
   TDatabaseTableRoutines.UpdateQuery(ZQStockOptions,'STOCKOPTIONS',['WSTOCKOPTIONSID']);
 end;
end;

procedure TDMCoreDocData.SaveUBL20Invoice(ADocid : Integer ;AFilename: String);
var
 AExport : TStringlist ;
 AUidd : TGUID ;
 AFormat : TFormatSettings ;
begin
ZQDocHead.close ;
ZQDocHead.Params[0].AsInteger := ADocid ;
ZQDocHead.Open ;
if ZQDocHead.IsEmpty then exit ;
ZQDocLine.close ;
ZQDocLine.Params[0].AsInteger := ADocid ;
ZQDocLine.Open ;
if ZQDocLine.IsEmpty then exit ;
AFormat.DateSeparator := '-' ;
AFormat.ShortDateFormat := 'yyyy-mm-dd' ;

AExport := TStringlist.Create  ;
  try
    AExport.add('<?xml version="1.0" encoding="UTF-8"?>');
    AExport.add('<Invoice xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:stat="urn:oasis:names:specification:ubl:schema:xsd:DocumentStatusCode-1.0"' +
    'xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:udt="urn:un:unece:uncefact:data:draft:UnqualifiedDataTypesSchemaModule:2"'+
    ' xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">');
    AExport.add('<cbc:UBLVersionID>2.0</cbc:UBLVersionID><cbc:CustomizationID>urn:oasis:names:specification:ubl:xpath:Invoice-2.0:sbs-1.0-draft</cbc:CustomizationID><cbc:ProfileID>bpid:urn:oasis:names:draft:bpss:ubl-2-sbs-invoice-notification-draft</cbc:ProfileID><cbc:ID>');
    CreateGUID(AUidd) ;

    AExport.add(ZQDocHeadSDOCNO.AsString + '</cbc:ID>	<cbc:CopyIndicator>false</cbc:CopyIndicator>	<cbc:UUID>' + GUIDToString(AUidd));

    AExport.add('</cbc:UUID><cbc:IssueDate>' + DateToStr(ZQDocHeadDDATE.AsDateTime,AFormat) );
    AExport.add('</cbc:IssueDate><cbc:InvoiceTypeCode>SalesInvoice</cbc:InvoiceTypeCode><cbc:Note>');
    AExport.add(DMTCCoreLink.ReadDescription( ZQDocHeadWMESSAGE1ID.AsInteger) + '</cbc:Note><cbc:TaxPointDate>'+ DateToStr(ZQDocHeadDDATE.AsDateTime,AFormat)+ '</cbc:TaxPointDate>');

  //  AExport.add('<cac:OrderReference><cbc:ID>'+ ZQDocHeadSREFERENCE.AsString +'</cbc:ID>cbc:SalesOrderID>CON0095678</cbc:SalesOrderID><cbc:UUID>' + GUIDToString(AUidd) + '</cbc:UUID><cbc:IssueDate>2005-06-20</cbc:IssueDate></cac:OrderReference>');



  finally
     AExport.free ;
  end;




{
  <?xml version="1.0" encoding="UTF-8"?>
<Invoice xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:stat="urn:oasis:names:specification:ubl:schema:xsd:DocumentStatusCode-1.0" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:udt="urn:un:unece:uncefact:data:draft:UnqualifiedDataTypesSchemaModule:2" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
	<cbc:UBLVersionID>2.0</cbc:UBLVersionID>
	<cbc:CustomizationID>urn:oasis:names:specification:ubl:xpath:Invoice-2.0:sbs-1.0-draft</cbc:CustomizationID>
	<cbc:ProfileID>bpid:urn:oasis:names:draft:bpss:ubl-2-sbs-invoice-notification-draft</cbc:ProfileID>
	<cbc:ID>A00095678</cbc:ID>
	<cbc:CopyIndicator>false</cbc:CopyIndicator>
	<cbc:UUID>849FBBCE-E081-40B4-906C-94C5FF9D1AC3</cbc:UUID>
	<cbc:IssueDate>2005-06-21</cbc:IssueDate>
	<cbc:InvoiceTypeCode>SalesInvoice</cbc:InvoiceTypeCode>
	<cbc:Note>sample</cbc:Note>
	<cbc:TaxPointDate>2005-06-21</cbc:TaxPointDate>
	<cac:OrderReference>
		<cbc:ID>AEG012345</cbc:ID>
		<cbc:SalesOrderID>CON0095678</cbc:SalesOrderID>
		<cbc:UUID>6E09886B-DC6E-439F-82D1-7CCAC7F4E3B1</cbc:UUID>
		<cbc:IssueDate>2005-06-20</cbc:IssueDate>
	</cac:OrderReference>
	<cac:AccountingSupplierParty>
		<cbc:CustomerAssignedAccountID>CO001</cbc:CustomerAssignedAccountID>
		<cac:Party>
			<cac:PartyName>
				<cbc:Name>Consortial</cbc:Name>
			</cac:PartyName>
			<cac:PostalAddress>
				<cbc:StreetName>Busy Street</cbc:StreetName>
				<cbc:BuildingName>Thereabouts</cbc:BuildingName>
				<cbc:BuildingNumber>56A</cbc:BuildingNumber>
				<cbc:CityName>Farthing</cbc:CityName>
				<cbc:PostalZone>AA99 1BB</cbc:PostalZone>
				<cbc:CountrySubentity>Heremouthshire</cbc:CountrySubentity>
				<cac:AddressLine>
					<cbc:Line>The Roundabout</cbc:Line>
				</cac:AddressLine>
				<cac:Country>
					<cbc:IdentificationCode>GB</cbc:IdentificationCode>
				</cac:Country>
			</cac:PostalAddress>
			<cac:PartyTaxScheme>
				<cbc:RegistrationName>Farthing Purchasing Consortia</cbc:RegistrationName>
				<cbc:CompanyID>175 269 2355</cbc:CompanyID>
				<cbc:ExemptionReason>N/A</cbc:ExemptionReason>
				<cac:TaxScheme>
					<cbc:ID>VAT</cbc:ID>
					<cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
				</cac:TaxScheme>
			</cac:PartyTaxScheme>
			<cac:Contact>
				<cbc:Name>Mrs Bouquet</cbc:Name>
				<cbc:Telephone>0158 1233714</cbc:Telephone>
				<cbc:Telefax>0158 1233856</cbc:Telefax>
				<cbc:ElectronicMail>bouquet@fpconsortial.co.uk</cbc:ElectronicMail>
			</cac:Contact>
		</cac:Party>
	</cac:AccountingSupplierParty>
	<cac:AccountingCustomerParty>
		<cbc:CustomerAssignedAccountID>XFB01</cbc:CustomerAssignedAccountID>
		<cbc:SupplierAssignedAccountID>GT00978567</cbc:SupplierAssignedAccountID>
		<cac:Party>
			<cac:PartyName>
				<cbc:Name>IYT Corporation</cbc:Name>
			</cac:PartyName>
			<cac:PostalAddress>
				<cbc:StreetName>Avon Way</cbc:StreetName>
				<cbc:BuildingName>Thereabouts</cbc:BuildingName>
				<cbc:BuildingNumber>56A</cbc:BuildingNumber>
				<cbc:CityName>Bridgtow</cbc:CityName>
				<cbc:PostalZone>ZZ99 1ZZ</cbc:PostalZone>
				<cbc:CountrySubentity>Avon</cbc:CountrySubentity>
				<cac:AddressLine>
					<cbc:Line>3rd Floor, Room 5</cbc:Line>
				</cac:AddressLine>
				<cac:Country>
					<cbc:IdentificationCode>GB</cbc:IdentificationCode>
				</cac:Country>
			</cac:PostalAddress>
			<cac:PartyTaxScheme>
				<cbc:RegistrationName>Bridgtow District Council</cbc:RegistrationName>
				<cbc:CompanyID>12356478</cbc:CompanyID>
				<cbc:ExemptionReason>Local Authority</cbc:ExemptionReason>
				<cac:TaxScheme>
					<cbc:ID>UK VAT</cbc:ID>
					<cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
				</cac:TaxScheme>
			</cac:PartyTaxScheme>
			<cac:Contact>
				<cbc:Name>Mr Fred Churchill</cbc:Name>
				<cbc:Telephone>0127 2653214</cbc:Telephone>
				<cbc:Telefax>0127 2653215</cbc:Telefax>
				<cbc:ElectronicMail>fred@iytcorporation.gov.uk</cbc:ElectronicMail>
			</cac:Contact>
		</cac:Party>
	</cac:AccountingCustomerParty>
	<cac:Delivery>
		<cbc:ActualDeliveryDate>2005-06-20</cbc:ActualDeliveryDate>
		<cbc:ActualDeliveryTime>11:30:00.0Z</cbc:ActualDeliveryTime>
		<cac:DeliveryAddress>
			<cbc:StreetName>Avon Way</cbc:StreetName>
			<cbc:BuildingName>Thereabouts</cbc:BuildingName>
			<cbc:BuildingNumber>56A</cbc:BuildingNumber>
			<cbc:CityName>Bridgtow</cbc:CityName>
			<cbc:PostalZone>ZZ99 1ZZ</cbc:PostalZone>
			<cbc:CountrySubentity>Avon</cbc:CountrySubentity>
			<cac:AddressLine>
				<cbc:Line>3rd Floor, Room 5</cbc:Line>
			</cac:AddressLine>
			<cac:Country>
				<cbc:IdentificationCode>GB</cbc:IdentificationCode>
			</cac:Country>
		</cac:DeliveryAddress>
	</cac:Delivery>
	<cac:PaymentMeans>
		<cbc:PaymentMeansCode>20</cbc:PaymentMeansCode>
		<cbc:PaymentDueDate>2005-07-21</cbc:PaymentDueDate>
		<cac:PayeeFinancialAccount>
			<cbc:ID>12345678</cbc:ID>
			<cbc:Name>Farthing Purchasing Consortia</cbc:Name>
			<cbc:AccountTypeCode>Current</cbc:AccountTypeCode>
			<cbc:CurrencyCode>GBP</cbc:CurrencyCode>
			<cac:FinancialInstitutionBranch>
				<cbc:ID>10-26-58</cbc:ID>
				<cbc:Name>Open Bank Ltd, Bridgstow Branch </cbc:Name>
				<cac:FinancialInstitution>
					<cbc:ID>10-26-58</cbc:ID>
					<cbc:Name>Open Bank Ltd</cbc:Name>
					<cac:Address>
						<cbc:StreetName>City Road</cbc:StreetName>
						<cbc:BuildingName>Banking House</cbc:BuildingName>
						<cbc:BuildingNumber>12</cbc:BuildingNumber>
						<cbc:CityName>London</cbc:CityName>
						<cbc:PostalZone>AQ1 6TH</cbc:PostalZone>
						<cbc:CountrySubentity>London
</cbc:CountrySubentity>
						<cac:AddressLine>
							<cbc:Line>5th Floor</cbc:Line>
						</cac:AddressLine>
						<cac:Country>
							<cbc:IdentificationCode>GB</cbc:IdentificationCode>
						</cac:Country>
					</cac:Address>
				</cac:FinancialInstitution>
				<cac:Address>
					<cbc:StreetName>Busy Street</cbc:StreetName>
					<cbc:BuildingName>The Mall</cbc:BuildingName>
					<cbc:BuildingNumber>152</cbc:BuildingNumber>
					<cbc:CityName>Farthing</cbc:CityName>
					<cbc:PostalZone>AA99 1BB</cbc:PostalZone>
					<cbc:CountrySubentity>Heremouthshire</cbc:CountrySubentity>
					<cac:AddressLine>
						<cbc:Line>West Wing</cbc:Line>
					</cac:AddressLine>
					<cac:Country>
						<cbc:IdentificationCode>GB</cbc:IdentificationCode>
					</cac:Country>
				</cac:Address>
			</cac:FinancialInstitutionBranch>
			<cac:Country>
				<cbc:IdentificationCode>GB</cbc:IdentificationCode>
			</cac:Country>
		</cac:PayeeFinancialAccount>
	</cac:PaymentMeans>
	<cac:PaymentTerms>
		<cbc:Note>Payable within 1 calendar month from the invoice date</cbc:Note>
	</cac:PaymentTerms>
	<cac:AllowanceCharge>
		<cbc:ChargeIndicator>false</cbc:ChargeIndicator>
		<cbc:AllowanceChargeReasonCode>17</cbc:AllowanceChargeReasonCode>
		<cbc:MultiplierFactorNumeric>0.10</cbc:MultiplierFactorNumeric>
		<cbc:Amount currencyID="GBP">10.00</cbc:Amount>
	</cac:AllowanceCharge>
	<cac:TaxTotal>
		<cbc:TaxAmount currencyID="GBP">17.50</cbc:TaxAmount>
		<cbc:TaxEvidenceIndicator>true</cbc:TaxEvidenceIndicator>
		<cac:TaxSubtotal>
			<cbc:TaxableAmount currencyID="GBP">100.00</cbc:TaxableAmount>
			<cbc:TaxAmount currencyID="GBP">17.50</cbc:TaxAmount>
			<cac:TaxCategory>
				<cbc:ID>A</cbc:ID>
				<cac:TaxScheme>
					<cbc:ID>UK VAT</cbc:ID>
					<cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
				</cac:TaxScheme>
			</cac:TaxCategory>
		</cac:TaxSubtotal>
	</cac:TaxTotal>
	<cac:LegalMonetaryTotal>
		<cbc:LineExtensionAmount currencyID="GBP">100.00</cbc:LineExtensionAmount>
		<cbc:TaxExclusiveAmount currencyID="GBP">90.00</cbc:TaxExclusiveAmount>
		<cbc:AllowanceTotalAmount currencyID="GBP">10.00</cbc:AllowanceTotalAmount>
		<cbc:PayableAmount currencyID="GBP">107.50</cbc:PayableAmount>
	</cac:LegalMonetaryTotal>
	<cac:InvoiceLine>
		<cbc:ID>A</cbc:ID>
		<cbc:InvoicedQuantity unitCode="KG">100</cbc:InvoicedQuantity>
		<cbc:LineExtensionAmount currencyID="GBP">100.00</cbc:LineExtensionAmount>
		<cac:OrderLineReference>
			<cbc:LineID>1</cbc:LineID>
			<cbc:SalesOrderLineID>A</cbc:SalesOrderLineID>
			<cbc:LineStatusCode>NoStatus</cbc:LineStatusCode>
			<cac:OrderReference>
				<cbc:ID>AEG012345</cbc:ID>
				<cbc:SalesOrderID>CON0095678</cbc:SalesOrderID>
				<cbc:UUID>6E09886B-DC6E-439F-82D1-7CCAC7F4E3B1</cbc:UUID>
				<cbc:IssueDate>2005-06-20</cbc:IssueDate>
			</cac:OrderReference>
		</cac:OrderLineReference>
		<cac:TaxTotal>
			<cbc:TaxAmount currencyID="GBP">17.50</cbc:TaxAmount>
			<cbc:TaxEvidenceIndicator>true</cbc:TaxEvidenceIndicator>
			<cac:TaxSubtotal>
				<cbc:TaxableAmount currencyID="GBP">100.00</cbc:TaxableAmount>
				<cbc:TaxAmount currencyID="GBP">17.50</cbc:TaxAmount>
				<cac:TaxCategory>
					<cbc:ID>A</cbc:ID>
					<cbc:Percent>17.5</cbc:Percent>
					<cac:TaxScheme>
						<cbc:ID>UK VAT</cbc:ID>
						<cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
					</cac:TaxScheme>
				</cac:TaxCategory>
			</cac:TaxSubtotal>
		</cac:TaxTotal>
		<cac:Item>
			<cbc:Description>Acme beeswax</cbc:Description>
			<cbc:Name>beeswax</cbc:Name>
			<cac:BuyersItemIdentification>
				<cbc:ID>6578489</cbc:ID>
			</cac:BuyersItemIdentification>
			<cac:SellersItemIdentification>
				<cbc:ID>17589683</cbc:ID>
			</cac:SellersItemIdentification>
			<cac:ItemInstance>
				<cac:LotIdentification>
					<cbc:LotNumberID>546378239</cbc:LotNumberID>
					<cbc:ExpiryDate>2010-01-01</cbc:ExpiryDate>
				</cac:LotIdentification>
			</cac:ItemInstance>
		</cac:Item>
		<cac:Price>
			<cbc:PriceAmount currencyID="GBP">1.00</cbc:PriceAmount>
			<cbc:BaseQuantity unitCode="KG">1</cbc:BaseQuantity>
		</cac:Price>
	</cac:InvoiceLine>
</Invoice>
}

end;

end.
