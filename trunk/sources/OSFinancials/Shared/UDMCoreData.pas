unit UDMCoreData;

interface

uses
  SysUtils, Classes, DB,
  DBAccess , Uni,   DAScript, UniScript, MemDS;

type
  TDMCoreData = class(TDataModule)
    ZQAccount: TuniQuery;
    ZQTotals: TuniQuery;
    ZQTransaction: TuniQuery;
    ZUSQLTransact: TUniUpdateSql;
    ZUSQLTotals: TUniUpdateSql;
    ZUSQLAccount: TUniUpdateSql;
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
    ZQTotalsWACCOUNTID: TIntegerField;
    ZQTotalsWPERIODID: TIntegerField;
    ZQTotalsBACTUAL: TSmallintField;
    ZQTotalsFAMOUNT: TFloatField;
    ZQTotalsDSYSDATE: TDateTimeField;
    ZQTransactionWTRANSACTIONID: TIntegerField;
    ZQTransactionWBATCHID: TIntegerField;
    ZQTransactionWBATCHTYPEID: TIntegerField;
    ZQTransactionWLINEID: TIntegerField;
    ZQTransactionBCARRIEDFORWARD: TSmallintField;
    ZQTransactionBLASTYEAR: TSmallintField;
    ZQTransactionBLINKSUSED: TSmallintField;
    ZQTransactionBMULTIPLEITEMS: TSmallintField;
    ZQTransactionWACCOUNTID: TIntegerField;
    ZQTransactionDDATE: TDateTimeField;
    ZQTransactionWPERIODID: TIntegerField;
    ZQTransactionSREFERENCE: TStringField;
    ZQTransactionFTAXRATE: TFloatField;
    ZQTransactionWTAXACCOUNTID: TIntegerField;
    ZQTransactionFAMOUNT: TFloatField;
    ZQTransactionFTAXAMOUNT: TFloatField;
    ZQTransactionFOUTSTANDINGAMOUNT: TFloatField;
    ZQTransactionBRECONCILED: TSmallintField;
    ZQTransactionWBALANCINGACCOUNTID: TIntegerField;
    ZQTransactionWDESCRIPTIONID: TIntegerField;
    ZQTransactionWCURRENCYID: TIntegerField;
    ZQTransactionFFOREXAMOUNT: TFloatField;
    ZQTransactionWUSERID: TIntegerField;
    ZQTransactionUNUSED: TIntegerField;
    ZQTransactionDSYSDATE: TDateTimeField;
    ZQTransactionBUNUSED: TSmallintField;
    ZQTransactionWTAX2ID: TIntegerField;
    ZQTransactionFCURRENCYRATE2: TFloatField;
    ZQTransactionFTAXRATE2: TFloatField;
    ZQTransactionFTAX2AMOUNT: TFloatField;
    ZQTransactionWJOBCODEID: TIntegerField;
    ZQTransactionWPROFILEID: TIntegerField;
    ZQDebtor: TuniQuery;
    ZQCreditor: TuniQuery;
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
    ZQMainAccount: TuniQuery;
    ZQTaxAccount: TuniQuery;
    ZQMainAccountWACCOUNTID: TIntegerField;
    ZQMainAccountSACCOUNTCODE: TStringField;
    ZQMainAccountSMAINACCOUNTCODE: TStringField;
    ZQMainAccountSSUBACCOUNTCODE: TStringField;
    ZQMainAccountSDESCRIPTION: TStringField;
    ZQMainAccountWACCOUNTTYPEID: TIntegerField;
    ZQMainAccountWREPORTINGGROUP1ID: TIntegerField;
    ZQMainAccountWREPORTINGGROUP2ID: TIntegerField;
    ZQMainAccountBSUBACCOUNTS: TSmallintField;
    ZQMainAccountBINCOMEEXPENSE: TSmallintField;
    ZQMainAccountDSYSDATE: TDateTimeField;
    ZQMainAccountWPROFILEID: TIntegerField;
    ZQTaxAccountWACCOUNTID: TIntegerField;
    ZQTaxAccountSACCOUNTCODE: TStringField;
    ZQTaxAccountSMAINACCOUNTCODE: TStringField;
    ZQTaxAccountSSUBACCOUNTCODE: TStringField;
    ZQTaxAccountSDESCRIPTION: TStringField;
    ZQTaxAccountWACCOUNTTYPEID: TIntegerField;
    ZQTaxAccountWREPORTINGGROUP1ID: TIntegerField;
    ZQTaxAccountWREPORTINGGROUP2ID: TIntegerField;
    ZQTaxAccountBSUBACCOUNTS: TSmallintField;
    ZQTaxAccountBINCOMEEXPENSE: TSmallintField;
    ZQTaxAccountDSYSDATE: TDateTimeField;
    ZQTaxAccountWPROFILEID: TIntegerField;
    ZQTaxAccountWACCOUNTID_1: TIntegerField;
    ZQTaxAccountSDESCRIPTION_1: TStringField;
    ZQTaxAccountDSTARTDATE: TDateTimeField;
    ZQTaxAccountDENDDATE: TDateTimeField;
    ZQTaxAccountFRATE: TFloatField;
    ZQTaxAccountDSYSDATE_1: TDateTimeField;
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
    ZQBatchControl: TuniQuery;
    ZUSQLBatcon: TUniUpdateSql;
    ZQBatchControlWBATCHID: TIntegerField;
    ZQBatchControlWUSERID: TIntegerField;
    ZQBatchControlWBATCHTYPEID: TIntegerField;
    ZQBatchControlSBATCHNUMBER: TStringField;
    ZQBatchControlBPOSTED: TSmallintField;
    ZQBatchControlBIMPORTED: TSmallintField;
    ZQBatchControlBDOCSOURCE: TSmallintField;
    ZQBatchControlWLINECOUNT: TIntegerField;
    ZQBatchControlSFILENAME: TStringField;
    ZQBatchControlWDOCID: TIntegerField;
    ZQBatchControlDSYSDATE: TDateTimeField;
    ZQBatchControlWINITBATID: TIntegerField;
    ZQBatchControlSALIAS: TStringField;
    ZQBatchControlSUNIQUEID: TStringField;
    ZUSQLOILinks: TUniUpdateSql;
    ZQOILinks: TuniQuery;
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
    ZQTaxOnId: TuniQuery;
    ZQTaxOnIdWACCOUNTID: TIntegerField;
    ZQTaxOnIdSACCOUNTCODE: TStringField;
    ZQTaxOnIdSMAINACCOUNTCODE: TStringField;
    ZQTaxOnIdSSUBACCOUNTCODE: TStringField;
    ZQTaxOnIdSDESCRIPTION: TStringField;
    ZQTaxOnIdWACCOUNTTYPEID: TIntegerField;
    ZQTaxOnIdWREPORTINGGROUP1ID: TIntegerField;
    ZQTaxOnIdWREPORTINGGROUP2ID: TIntegerField;
    ZQTaxOnIdBSUBACCOUNTS: TSmallintField;
    ZQTaxOnIdBINCOMEEXPENSE: TSmallintField;
    ZQTaxOnIdDSYSDATE: TDateTimeField;
    ZQTaxOnIdWPROFILEID: TIntegerField;
    ZQTaxOnIdWACCOUNTID_1: TIntegerField;
    ZQTaxOnIdSDESCRIPTION_1: TStringField;
    ZQTaxOnIdDSTARTDATE: TDateTimeField;
    ZQTaxOnIdDENDDATE: TDateTimeField;
    ZQTaxOnIdFRATE: TFloatField;
    ZQTaxOnIdDSYSDATE_1: TDateTimeField;
    ZQAccountBOPENITEM: TSmallintField;
    ZQAccountBINACTIVE: TSmallintField;
    ZQAccountWLINKACCOUNT: TIntegerField;
    ZQMainAccountBOPENITEM: TSmallintField;
    ZQMainAccountBINACTIVE: TSmallintField;
    ZQMainAccountWLINKACCOUNT: TIntegerField;
    ZQContraAccountBOPENITEM: TSmallintField;
    ZQContraAccountBINACTIVE: TSmallintField;
    ZQContraAccountWLINKACCOUNT: TIntegerField;
    ZQTaxAccountBOPENITEM: TSmallintField;
    ZQTaxAccountBINACTIVE: TSmallintField;
    ZQTaxAccountWLINKACCOUNT: TIntegerField;
    ZQTaxOnIdBOPENITEM: TSmallintField;
    ZQTaxOnIdBINACTIVE: TSmallintField;
    ZQTaxOnIdWLINKACCOUNT: TIntegerField;
    ZQTransactionBEXCLUSIVE: TSmallintField;
    ZQTransactionWREPORTINGGROUP1ID: TIntegerField;
    ZQTransactionWREPORTINGGROUP2ID: TIntegerField;
    ZQTransactionWLINKEDID: TIntegerField;
    ZQOILinksWOILINKSID: TIntegerField;
    ZQTotalsWYEARID: TIntegerField;
    ZQTransactionWYEARID: TIntegerField;
    ZQRTaxRates: TuniQuery;
    ZQRTaxRatesWACCOUNTID: TIntegerField;
    ZQRTaxRatesFRATE: TFloatField;
    ZQRTaxRatesBLINKCONTRA: TSmallintField;
    ZQTransactionWDOCID: TIntegerField;
    ZQBatchTypes: TuniQuery;
    ZQDebtorWPOSTCOUNTRIES_ID: TIntegerField;
    ZQDebtorWDELCOUNTRIES_ID: TIntegerField;
    ZQDebtorDREMITTANCE: TDateTimeField;
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
    ZUSQLBatchTypes: TUniUpdateSql;
    ZQBatchTypesWBATCHTYPEID: TIntegerField;
    ZQBatchTypesSDESCRIPTION: TStringField;
    ZQBatchTypesBCASHBOOK: TSmallintField;
    ZQBatchTypesWCONTRAACCOUNTID: TIntegerField;
    ZQBatchTypesBCONTRAPERLINE: TSmallintField;
    ZQBatchTypesBINCREMENTREFNO: TSmallintField;
    ZQBatchTypesBREPEATDETAILS: TSmallintField;
    ZQBatchTypesBCONSOLIDATEBALANCING: TSmallintField;
    ZQBatchTypesWDEBITCREDIT: TIntegerField;
    ZQBatchTypesWPAYMENTGROUPID: TIntegerField;
    ZQBatchTypesWDEFAULTTAXID: TIntegerField;
    ZQBatchTypesBVIEWEXCLUSIVE: TSmallintField;
    ZQBatchTypesBLINKOI: TSmallintField;
    ZQBatchTypesBINCLUSIVEMODE: TSmallintField;
    ZQBatchTypesDSYSDATE: TDateTimeField;
    ZQBatch: TuniQuery;
    ZUSQLBatch: TUniUpdateSql;
    ZSQLProc: TUniScript;
    ZSQLGenProccessor: TUniScript;
    tblUser: TuniTable;
    ZQGen: TuniQuery;
    ZQTransactionDPAYMENTDATE: TDateTimeField;
    ZQAccountWTAXACCOUNT: TIntegerField;
    ZQTransactionWREMITTANCECOUNT: TIntegerField;
    ZQOILINKSPRE: TuniQuery;
    ZQOILINKSPREWBATCHID: TIntegerField;
    ZQOILINKSPREWLINEID: TIntegerField;
    ZQOILINKSPREWBATCHTYPEID: TIntegerField;
    ZQOILINKSPREWTRANSACTIONID: TIntegerField;
    ZQOILINKSPREFAMOUNT: TFloatField;
    ZUSQLLinksPre: TUniUpdateSql;
    procedure ZQTransactionAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ZQBatchControlAfterInsert(DataSet: TDataSet);
    procedure ZQTotalsBeforePost(DataSet: TDataSet);
    procedure ZQTransactionBeforePost(DataSet: TDataSet);
    procedure ZQOILinksAfterInsert(DataSet: TDataSet);
    procedure ZQGenQueryBeforeOpen(DataSet: TDataSet);
    procedure InitOn1Is0(DataSet: TDataSet);
    procedure InitOnAccountid(DataSet: TDataSet);
    procedure InitBatControl(DataSet: TDataSet);
    procedure InitIoLinks(DataSet: TDataSet);
    procedure InitOnTransId(DataSet: TDataSet);
    procedure InitOnTaxtid(DataSet: TDataSet);
    procedure ZSQLGenProccessorError(Sender: TObject; E: Exception;
      SQL: String; var Action: TErrorAction);
    procedure ZSQLProcError(Sender: TObject; E: Exception; SQL: String;
      var Action: TErrorAction);
  private
    FBatchname: String;
    procedure SetBatchName(const Value: String);


    { Private declarations }
  public
    ScriptErrorList : String ;
    procedure CloseAll;
    Function AppendBatchControlId(AUserID,aCurrentUser,ABatchTypeID,BPosted,BImported:Integer) : Integer;
    property Batchname : String  read FBatchname write SetBatchname;
    { Public declarations }
  end;


implementation

uses tcashClasses,OSFGeneralRoutines,
  UDMTCCoreLink,variants;

{$R *.dfm}
procedure TDMCoreData.CloseAll;
var
 i : Integer ;
begin
  for i := 0 to Self.ComponentCount -1 do
    if (self.Components[i] is TuniQuery) then
      (self.Components[i] as TuniQuery).Close ;

end;

procedure TDMCoreData.SetBatchName(const Value: String);
begin
  DMTCCoreLink.SQLList.ParamsList.values['BATCHNAME'] :=  Value ;
  FBatchName := Value;
  ZQBatch.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_select') ;
  ZUSQLBatch.DeleteSQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Delete') ;
  ZUSQLBatch.InsertSQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Insert') ;
  ZUSQLBatch.ModifySQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Batch_Edit') ;

end;

procedure TDMCoreData.ZQTransactionAfterInsert(DataSet: TDataSet);
begin
  ZQTransactionWTransactionID.Value := DMTCCoreLink.GetNewId(tcidNEWTRANSACTIONID);
end;

procedure TDMCoreData.DataModuleCreate(Sender: TObject);
begin
 TDataBaseRoutines.SetDynamicFieldLengths(self);
 DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TDMCoreData.ZQBatchControlAfterInsert(DataSet: TDataSet);
begin
  ZQBatchControlWBatchID.Value := DMTCCoreLink.GetNewId(tcidNEWBATCHID);
  ZQBatchControlWINITBATID.AsInteger := ZQBatchControlWBatchID.AsInteger;
  ZQBatchControlDSYSDATE.AsDateTime:=Now;
end;

Function TDMCoreData.AppendBatchControlId(AUserID,aCurrentUser,ABatchTypeID,BPosted,BImported:Integer) : Integer;
begin
   ZQBatchTypes.Close ;
  ZQBatchTypes.Open ;
  if not ZQBatchTypes.Locate('WBATCHTYPEID',ABatchTypeID,[]) then raise Exception.Create('Error in document setup Batch nr'+IntToStr(ABatchTypeID)+' not found!');
 //
  if not ZQBatchControl.Active then
     ZQBatchControl.open ;

     ZQBatchControl.Append;
     ZQBatchControlWUserID.Value := AUserID;
     ZQBatchControlWBatchTypeID.Value := ABatchTypeID;
     Result :=ZQBatchControlWBatchID.AsInteger ;
     tblUser.Open;
     if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber',false) then
        tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
        tblUser.Locate('WUserID', aCurrentUser, []);

      tblUser.Edit;

      ZQBatchControlSBatchNumber.Value := tblUser.fieldByName('SNextBatchNumber').Asstring;
      ZQBatchControlSUNIQUEID.Value := tblUser.fieldByName('SNextBatchNumber').Asstring;
      tblUser.fieldByName('SNextBatchNumber').Asstring := TDataBaseStringRoutines.IncrementString(tblUser.fieldByName('SNextBatchNumber').Asstring);
      tblUser.Post;
      ZQBatchControlBPosted.Value := BPosted;
      ZQBatchControlBImported.Value := BImported;
      ZQBatchControl.Post;
end;

procedure TDMCoreData.ZQTotalsBeforePost(DataSet: TDataSet);
begin
     if ZQTotalsWYEARID.IsNull then
      ZQTotalsWYEARID.AsInteger := (ZQTotalsWPERIODID.AsInteger div 14) + 1 ;
end;

procedure TDMCoreData.ZQTransactionBeforePost(DataSet: TDataSet);
begin
     if ZQTransactionWYEARID.IsNull then
      ZQTransactionWYEARID.AsInteger := (ZQTransactionWPERIODID.AsInteger div 14) + 1 ;
end;

procedure TDMCoreData.ZQOILinksAfterInsert(DataSet: TDataSet);
begin
 ZQOILinksWOILINKSID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWOILINKS);
end;

procedure TDMCoreData.ZQGenQueryBeforeOpen(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where 1 = 0');
 end;
end;

procedure TDMCoreData.InitOn1Is0(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and 1 = 0')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where 1 = 0');
 end;
end;

procedure TDMCoreData.InitOnAccountid(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and waccountid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where waccountid is null');
 end;
end;

procedure TDMCoreData.InitBatControl(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and wbatchid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where wbatchid is null');
 end;
end;


procedure TDMCoreData.InitIoLinks(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and WOILINKSID is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where WOILINKSID is null');
 end;
end;

procedure TDMCoreData.InitOnTransId(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and WTRANSACTIONID is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where WTRANSACTIONID is null');
 end;
end;

procedure TDMCoreData.InitOnTaxtid(DataSet: TDataSet);
begin
if (DataSet is TuniQuery) then
 begin
 if pos('WHERE',uppercase((DataSet as TuniQuery).SQL.Text)) <> 0 then
   DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' and account.waccountid is null')
 else
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,(DataSet as TuniQuery).SQL.Text + ' where account.waccountid is null');
 end;
end;

procedure TDMCoreData.ZSQLGenProccessorError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
  Action := eaContinue ;
  if ScriptErrorList = '' then
  ScriptErrorList := E.Message
  else
  ScriptErrorList := ScriptErrorList + #13+#10+'-----------------------------'+ #13+#10 + E.Message ;

end;

procedure TDMCoreData.ZSQLProcError(Sender: TObject; E: Exception;
  SQL: String; var Action: TErrorAction);
begin
   Action := eaContinue ;
  if ScriptErrorList = '' then
  ScriptErrorList := E.Message
  else
  ScriptErrorList := ScriptErrorList + #13+#10+'-----------------------------'+ #13+#10 + E.Message ;
end;

end.
