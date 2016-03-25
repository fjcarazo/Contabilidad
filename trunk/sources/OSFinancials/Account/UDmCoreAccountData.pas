(*
  Id: UDmCoreAccountData.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UDmCoreAccountData;

interface

uses
  SysUtils, Classes,  DB,  
  DBAccess , Uni,TcashClasses, MemDS;

type
  TDMCoreAccountData = class(TDataModule)
    ZQDebtor: TuniQuery;
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
    ZQDebtorDREMITTANCE: TDateTimeField;
    ZQDebtorWPOSTCOUNTRIES_ID: TIntegerField;
    ZQDebtorWDELCOUNTRIES_ID: TIntegerField;
    ZQDebtorSCOMPANYREGNO: TStringField;
    ZQDebtorSFREEFIELD1: TStringField;
    ZQDebtorSFREEFIELD2: TStringField;
    ZQDebtorSFREEFIELD3: TStringField;
    ZQAccount: TuniQuery;
    ZQCreditor: TuniQuery;
    ZQTax: TuniQuery;
    ZQTaxWACCOUNTID: TIntegerField;
    ZQTaxSDESCRIPTION: TStringField;
    ZQTaxDSTARTDATE: TDateTimeField;
    ZQTaxDENDDATE: TDateTimeField;
    ZQTaxFRATE: TFloatField;
    ZQTaxDSYSDATE: TDateTimeField;
    ZQTaxWLINKTAXID: TIntegerField;
    ZQTaxBLINKCONTRA: TSmallintField;
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
    ZQAccountBOPENITEM: TSmallintField;
    ZQAccountBINACTIVE: TSmallintField;
    ZQAccountDSYSDATE: TDateTimeField;
    ZQAccountWPROFILEID: TIntegerField;
    ZQAccountWLINKACCOUNT: TIntegerField;
    ZQCreditorWACCOUNTID: TIntegerField;
    ZQCreditorSCODE: TStringField;
    ZQCreditorWCONTACTID: TIntegerField;
    ZQCreditorSPASSWORD: TStringField;
    ZQCreditorSPOSTAL1: TStringField;
    ZQCreditorSPOSTAL2: TStringField;
    ZQCreditorSPOSTAL3: TStringField;
    ZQCreditorSPOSTALCODE: TStringField;
    ZQCreditorWPOSTCOUNTRIES_ID: TIntegerField;
    ZQCreditorSDELIVERY1: TStringField;
    ZQCreditorSDELIVERY2: TStringField;
    ZQCreditorSDELIVERY3: TStringField;
    ZQCreditorWDELCOUNTRIES_ID: TIntegerField;
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
    ZQCreditorSCOMPANYREGNO: TStringField;
    ZQCreditorSFREEFIELD1: TStringField;
    ZQCreditorSFREEFIELD2: TStringField;
    ZQCreditorSFREEFIELD3: TStringField;
    ZQBank: TuniQuery;
    ZQBatTypes: TuniQuery;
    ZQTotals: TuniQuery;
    ZQTotalsWACCOUNTID: TIntegerField;
    ZQTotalsWPERIODID: TIntegerField;
    ZQTotalsWYEARID: TIntegerField;
    ZQTotalsBACTUAL: TSmallintField;
    ZQTotalsFAMOUNT: TFloatField;
    ZQTotalsDSYSDATE: TDateTimeField;
    ZQBatTypesWBATCHTYPEID: TIntegerField;
    ZQBatTypesSDESCRIPTION: TStringField;
    ZQBatTypesBCASHBOOK: TSmallintField;
    ZQBatTypesWCONTRAACCOUNTID: TIntegerField;
    ZQBatTypesBCONTRAPERLINE: TSmallintField;
    ZQBatTypesBINCREMENTREFNO: TSmallintField;
    ZQBatTypesBREPEATDETAILS: TSmallintField;
    ZQBatTypesBCONSOLIDATEBALANCING: TSmallintField;
    ZQBatTypesWDEBITCREDIT: TIntegerField;
    ZQBatTypesWPAYMENTGROUPID: TIntegerField;
    ZQBatTypesWDEFAULTTAXID: TIntegerField;
    ZQBatTypesBVIEWEXCLUSIVE: TSmallintField;
    ZQBatTypesBLINKOI: TSmallintField;
    ZQBatTypesBINCLUSIVEMODE: TSmallintField;
    ZQBatTypesDSYSDATE: TDateTimeField;
    ZQBankWACCOUNTID: TIntegerField;
    ZQBankWCONTACTID: TIntegerField;
    ZQBankWRECEIPTSID: TIntegerField;
    ZQBankWPAYMENTSID: TIntegerField;
    ZQBankWCURRENCYID: TIntegerField;
    ZQBankDSYSDATE: TDateTimeField;
    ZUSQLTotals: TUniUpdateSql;
    ZUSQLBatTypes: TUniUpdateSql;
    ZUSQLBank: TUniUpdateSql;
    ZUSQLTax: TUniUpdateSql;
    ZUSQLAccount: TUniUpdateSql;
    ZUSQLDebtor: TUniUpdateSql;
    ZUSQLCreditor: TUniUpdateSql;
    ZQAccountWTAXACCOUNT: TIntegerField;
    ZQGen: TuniQuery;
    ZQTaxSHOWTYPE: TIntegerField;
    procedure InitOnAccountid(DataSet: TDataSet);
    procedure ZQGenAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SaveAccount(ALedgerItem : TOSFLedgerItem;UpdateSubs:Boolean);
    procedure DeleteAccount(ALedgerItem : TOSFLedgerItem);
    procedure OpenAccountSubTypes ;
    procedure LoadAcountList(ALedgerCalculationClass : TOSFLedgerCalculationClass);
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines,variants;

{$R *.dfm}

procedure TDMCoreAccountData.InitOnAccountid(DataSet: TDataSet);
var
 Sql : String ;
begin
if DataSet = ZQBank then
  sql := 'Select * from bank where  WAccountid is null'
  else
if DataSet = ZQBatTypes   then
  sql := 'Select * from BatTypes where WBATCHTYPEID is null '
  else
if DataSet = ZQTax   then
  sql := 'Select * from Tax where  WAccountid is null '
  else
if DataSet = ZQAccount then
  sql := 'Select * from Account where  WAccountid is null '
  else
if DataSet = ZQDebtor  then
  sql := 'Select * from Debtor where  WAccountid is null '
  else
if DataSet = ZQCreditor then
  sql := 'Select * from Creditor where  WAccountid is null ' ;
if Sql <> '' then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,sql);

end;

procedure TDMCoreAccountData.ZQGenAfterInsert(DataSet: TDataSet);
begin
if DataSet = ZQBank then
  ZQBankWACCOUNTID.AsInteger := ZQAccountWACCOUNTID.AsInteger
  else
if DataSet = ZQBatTypes  then
  ZQBatTypesWBATCHTYPEID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWBATCHTYPEID)
  else
if DataSet = ZQTax  then
  ZQTaxWACCOUNTID.AsInteger := ZQAccountWACCOUNTID.AsInteger
  else
if DataSet = ZQAccount then
      ZQAccountWACCOUNTID.AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWACCOUNTID)
  else
if DataSet = ZQDebtor then
  ZQDebtorWACCOUNTID.AsInteger := ZQAccountWACCOUNTID.AsInteger
  else
if DataSet = ZQCreditor  then
  ZQCreditorWACCOUNTID.AsInteger := ZQAccountWACCOUNTID.AsInteger
 else
if DataSet = ZQTotals  then
  ZQTotalsWACCOUNTID.AsInteger := ZQAccountWACCOUNTID.AsInteger ;
end;

procedure TDMCoreAccountData.DataModuleCreate(Sender: TObject);
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TDMCoreAccountData.SaveAccount(ALedgerItem: TOSFLedgerItem;UpdateSubs:Boolean );
var
 IsInsert : Boolean ;
 AId , i ,AutoAdd : Integer ;
 DoUpdateSubs1,DoUpdateSubs2 ,DutchBanks: Boolean ;
 TempTotal : Variant ;

begin
  DutchBanks := not DMTCCoreLink.ReadNwReportOp('CBViewAllBankState',false) ;
  DoUpdateSubs1 := false ;
  DoUpdateSubs2 := false ;
  IsInsert := false ;
  if ALedgerItem.AccountID <> 0 then
    begin
      ZQAccount.close ;
      ZQAccount.Params[0].AsInteger := ALedgerItem.AccountID ;
      ZQAccount.open ;
    end else
    begin

      if TDataBaseRoutines.GetAccountIDFromCode(TDataBaseRoutines.AccTypeToChar(ALedgerItem.LedgerType)+ALedgerItem.Accountcode)  <> -1 then
        raise Exception.Create(ALedgerItem.Accountcode + ' ' + DMTCCoreLink.GetTextLang(3078){'Accountcode already exist!'});
      ZQAccount.close ;
      ZQAccount.Params[0].AsInteger := -1 ;
      ZQAccount.open ;
    end;
  if ZQAccount.IsEmpty then
    begin
    ZQAccount.Insert ;
    ZQAccountWREPORTINGGROUP2ID.AsInteger := 0 ;
    ZQAccountWREPORTINGGROUP1ID.AsInteger := 0 ;
    IsInsert := true ;
    end else
    ZQAccount.Edit ;
    AId :=  TDataBaseRoutines.GetAccountIDFromCode(TDataBaseRoutines.AccTypeToChar(0)+ALedgerItem.Accountcode) ;
    if not((AId = ZQAccountWACCOUNTID.AsInteger) or (AId = -1)) then
        raise Exception.Create(ALedgerItem.Accountcode + ' ' + DMTCCoreLink.GetTextLang(3078){'Accountcode already exist!'});
    AId :=  TDataBaseRoutines.GetAccountIDFromCode(TDataBaseRoutines.AccTypeToChar(3)+ALedgerItem.Accountcode) ;
    if not((AId = ZQAccountWACCOUNTID.AsInteger) or (AId = -1)) then
       raise Exception.Create(ALedgerItem.Accountcode + ' ' + DMTCCoreLink.GetTextLang(3078){'Accountcode already exist!'});
    AId :=  TDataBaseRoutines.GetAccountIDFromCode(TDataBaseRoutines.AccTypeToChar(4)+ALedgerItem.Accountcode) ;
    if not((AId = ZQAccountWACCOUNTID.AsInteger) or (AId = -1)) then
       raise Exception.Create(ALedgerItem.Accountcode + ' ' + DMTCCoreLink.GetTextLang(3078){'Accountcode already exist!'});

       if ZQAccountWREPORTINGGROUP1ID.AsInteger <> ALedgerItem.Group1ID then
          begin
            ZQAccountWREPORTINGGROUP1ID.AsInteger := ALedgerItem.Group1ID ;
            DoUpdateSubs1 := true ;
          end;

    if ZQAccountWREPORTINGGROUP2ID.AsInteger <> ALedgerItem.Group2ID then
          begin
            ZQAccountWREPORTINGGROUP2ID.AsInteger := ALedgerItem.Group2ID ;
            DoUpdateSubs2 := true ;
          end;

    ALedgerItem.AccountID := ZQAccountWACCOUNTID.AsInteger ;
    ZQAccountSACCOUNTCODE.AsString := ALedgerItem.Accountcode ;
    ZQAccountSMAINACCOUNTCODE.AsString := copy(ALedgerItem.Accountcode,1,DMTCCoreLink.MainAccountLength) ;
    ZQAccountSSUBACCOUNTCODE.AsString := copy(ALedgerItem.Accountcode,DMTCCoreLink.MainAccountLength + 1,3) ;
    ZQAccountWACCOUNTTYPEID.AsInteger := ALedgerItem.LedgerType ;
    ZQAccountSDESCRIPTION.AsString := ALedgerItem.Name ;
    if (ALedgerItem.TaxAccountid = 0) or (ALedgerItem.LedgerType = 4) or (ALedgerItem.LedgerType = 3) then
      ZQAccountWTAXACCOUNT.Clear else
    ZQAccountWTAXACCOUNT.AsInteger := ALedgerItem.TaxAccountid ;

    ZQAccountBSUBACCOUNTS.AsInteger := ord(ALedgerItem.SubAccounts) ;
    ZQAccountBINCOMEEXPENSE.AsInteger := ord(ALedgerItem.IncomeExpence) ;
    ZQAccountBOPENITEM.AsInteger := ord(ALedgerItem.OpenItem) ;
    ZQAccountBINACTIVE.AsInteger := ord(ALedgerItem.Inactive) ;
    if ALedgerItem.LinkedAccountId = -1 then
        ALedgerItem.LinkedAccountId := ALedgerItem.AccountID;
    ZQAccountWLINKACCOUNT.AsInteger := ALedgerItem.LinkedAccountId ;
    // check if its a subaccount
    If ZQAccountSSUBACCOUNTCODE.AsString <> '000' then
       begin
          ZQAccountWLINKACCOUNT.AsInteger := StrToIntDef(VartoStr(TDataBaseRoutines.GetAccountIdFromCodeAndType(ZQAccountSMAINACCOUNTCODE.AsString  + '000',-1)),ALedgerItem.AccountID) ;
      // see if the main account is marked right
       if (ZQAccountWLINKACCOUNT.AsInteger > 0) then
            if ZQAccountWLINKACCOUNT.AsInteger <> ALedgerItem.AccountId then
              if TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select BSubaccounts from account where WAccountID = ' + IntToStr(ZQAccountWLINKACCOUNT.AsInteger )) = '0' then
                  TDataBaseRoutines.ExecSql('update account set BSubaccounts = 1 where WAccountID = ' + IntToStr(ZQAccountWLINKACCOUNT.AsInteger )) ;
          if ZQAccountWLINKACCOUNT.AsInteger = 0 then
             ZQAccountWLINKACCOUNT.AsInteger :=  ALedgerItem.LinkedAccountId ;
       end;

    ZQAccount.post ;
    ZQAccount.close ;
    if IsInsert then
      TDataBaseRoutines.CreateTotalsForAccount(ALedgerItem.AccountID);


   // handel tax
   if  ALedgerItem.LedgerType = 4 then
     begin
        ZQTax.close ;
        ZQTax.Params[0].AsInteger := ALedgerItem.AccountID ;
        ZQTax.open ;
        if ZQTax.IsEmpty then
           ZQTax.Insert else
           ZQTax.edit ;
        ZQTaxWACCOUNTID.AsInteger := ALedgerItem.AccountID ;
        ZQTaxWLINKTAXID.AsInteger := ALedgerItem.LinkTax ;
        if ZQTaxWLINKTAXID.AsInteger = 0 then
          ZQTaxBLINKCONTRA.AsInteger := 0
        else
          ZQTaxBLINKCONTRA.AsInteger := ord(ALedgerItem.UseContraTax) ;

        ZQTaxFRATE.AsFloat := ALedgerItem.TaxRate ;

        ZQTaxSHOWTYPE.AsInteger := ALedgerItem.TaxType ;
 


        ZQTax.post ;
        ZQTax.close ;
     end;
   // handel bank
   if  ALedgerItem.LedgerType = 3 then
     begin
        ZQBank.close ;
        ZQBank.Params[0].AsInteger := ALedgerItem.AccountID ;
        ZQBank.open ;
        if ZQBank.IsEmpty then
           ZQBank.Insert else
           ZQBank.edit ;

        ZQBankWACCOUNTID.AsInteger := ALedgerItem.AccountID ;
        ZQBatTypes.Open ;              
        if ALedgerItem.PaymentBatchName <> '' then
        begin
            if not ZQBatTypes.Locate('SDESCRIPTION',ALedgerItem.PaymentBatchName,[]) then
              begin
               ZQBatTypes.Insert ;
               ZQBatTypesSDESCRIPTION.AsString := ALedgerItem.PaymentBatchName ;
               end else
               begin
               {  AutoAdd := 0 ;
                 if ZQBatTypesWCONTRAACCOUNTID.AsInteger <> ALedgerItem.AccountID then
                    begin
                     while ZQBatTypes.Locate('SDESCRIPTION','AutoAdd' + IntToStr(AutoAdd),[]) do
                       inc(AutoAdd);
                     ALedgerItem.ReceiptsBatchName :=  'AutoAdd' + IntToStr(AutoAdd);
                     ZQBatTypes.Insert ;
                     ZQBatTypesSDESCRIPTION.AsString := ALedgerItem.PaymentBatchName ;
                    end else      }
                    ZQBatTypes.edit ;
                    if ZQBatTypesWCONTRAACCOUNTID.AsInteger <> 0 then
                      if ZQBatTypesWCONTRAACCOUNTID.AsInteger <> ALedgerItem.AccountID then
                        raise Exception.Create('Batch is linked to Other bank ' + TDataBaseRoutines.GetAccountFullDescription (ZQBatTypesWCONTRAACCOUNTID.AsInteger) + ' please enter a unique name') ;
               end;
            ZQBatTypesBCASHBOOK.AsInteger := 1 ;
            ZQBatTypesBINCLUSIVEMODE.AsInteger := 1 ;
            ZQBatTypesWCONTRAACCOUNTID.AsInteger := ALedgerItem.AccountID ;
            ZQBatTypes.post ;
            ZQBankWPAYMENTSID.AsInteger := ZQBatTypesWBATCHTYPEID.AsInteger ;
            // if dutch bank.
            if DutchBanks then
            ZQBankWRECEIPTSID.AsInteger := ZQBatTypesWBATCHTYPEID.AsInteger ;
        end else
        begin
          AutoAdd := 0 ;
          while ZQBatTypes.Locate('SDESCRIPTION','AutoAdd' + IntToStr(AutoAdd),[]) do
                 inc(AutoAdd);
          ALedgerItem.PaymentBatchName :=  'AutoAdd' + IntToStr(AutoAdd);
          ZQBatTypes.Insert ;
          ZQBatTypesSDESCRIPTION.AsString := ALedgerItem.PaymentBatchName ;
          ZQBatTypesBCASHBOOK.AsInteger := 1 ;
          ZQBatTypesBINCLUSIVEMODE.AsInteger := 1 ;
          ZQBatTypesWCONTRAACCOUNTID.AsInteger := ALedgerItem.AccountID ;
          ZQBatTypes.post ;
          ZQBankWPAYMENTSID.AsInteger := ZQBatTypesWBATCHTYPEID.AsInteger ;
            if DutchBanks then
            ZQBankWRECEIPTSID.AsInteger := ZQBatTypesWBATCHTYPEID.AsInteger ;
        end;
        if ALedgerItem.ReceiptsBatchName = '' then
           ALedgerItem.ReceiptsBatchName := ALedgerItem.PaymentBatchName ;

            if (ALedgerItem.ReceiptsBatchName <> '') and (not DutchBanks) then
            begin
            if not ZQBatTypes.Locate('SDESCRIPTION',ALedgerItem.ReceiptsBatchName,[]) then
               begin
               ZQBatTypes.Insert ;
               ZQBatTypesSDESCRIPTION.AsString := ALedgerItem.ReceiptsBatchName ;
               end else
               begin
               {  AutoAdd := 0 ;
                 if ZQBatTypesWCONTRAACCOUNTID.AsInteger <> ALedgerItem.AccountID then
                    begin
                     while ZQBatTypes.Locate('SDESCRIPTION','AutoAdd' + IntToStr(AutoAdd),[]) do
                       inc(AutoAdd);
                     ALedgerItem.PaymentBatchName :=  'AutoAdd' + IntToStr(AutoAdd);
                     ZQBatTypes.Insert ;
                     ZQBatTypesSDESCRIPTION.AsString := ALedgerItem.ReceiptsBatchName ;
                    end else       }
                    ZQBatTypes.edit ;
                    if ZQBatTypesWCONTRAACCOUNTID.AsInteger <> ALedgerItem.AccountID then
                      raise Exception.Create('Batch is linked to Other bank ' + TDataBaseRoutines.GetAccountFullDescription (ZQBatTypesWCONTRAACCOUNTID.AsInteger) + ' please enter a unique name') ;
               end;
            ZQBatTypesBCASHBOOK.AsInteger := 1 ;
            ZQBatTypesBINCLUSIVEMODE.AsInteger := 1 ;
            ZQBatTypesWCONTRAACCOUNTID.AsInteger := ALedgerItem.AccountID ;
            ZQBatTypes.post ;

            ZQBankWRECEIPTSID.AsInteger := ZQBatTypesWBATCHTYPEID.AsInteger ;
        end;    
        ZQBank.post ;
        ZQBatTypes.Close ;
        ZQBank.close ;
     end;

  // If this is a SubAccount make sure the budget is correct
  if ALedgerItem.AccountID <> ALedgerItem.LinkedAccountId then
     begin
       // Update Budgets
       ZQTotals.close ;
       ZQTotals.Params[0].AsInteger := ALedgerItem.LinkedAccountId ;
       ZQTotals.open ;
       while not ZQTotals.Eof do
          begin
            if ZQTotalsBACTUAL.AsInteger = 0 then
             begin
             TempTotal := DMTCCoreLink.OpenSqlReturnFirstColumn('select sum(a.FAmount) from totals a join ACCOUNT b '+
             ' on a.WAccountid = b.Waccountid where b.WLinkaccount = '+IntToStr(ALedgerItem.LinkedAccountId)+' and b.WLinkaccount <> b.WAccountid '+
             ' and a.BACTUAL = 0 and a.WPERIODID = '+ ZQTotalsWPERIODID.AsString) ;
             if VartoStr(TempTotal) <> '' then
             if TempTotal <> ZQTotalsFAMOUNT.AsFloat then
               begin
                 ZQTotals.edit ;
                 ZQTotalsFAMOUNT.AsFloat := TempTotal ;
                 ZQTotals.post ;
               end;
             end;  
             ZQTotals.next ;
          end;
     end;

  if DoUpdateSubs1 or DoUpdateSubs2 then
    begin
       for i := 0 to ALedgerItem.NesteldNodes.Count -1 do
         begin
            if DoUpdateSubs1 then
               ALedgerItem.NesteldNodes[i].Group1ID := ALedgerItem.Group1ID ;
            if DoUpdateSubs2 then
               ALedgerItem.NesteldNodes[i].Group2ID := ALedgerItem.Group2ID ;
           SaveAccount(ALedgerItem.NesteldNodes[i],false);
         end;
    end;
end;

procedure TDMCoreAccountData.DeleteAccount(ALedgerItem: TOSFLedgerItem);
begin
  if TDataBaseRoutines.GetAccountClassType(ALedgerItem.AccountID)  > 1 then
     raise Exception.Create('You cannot delete a control account!');
  if ALedgerItem.AccountID <> 0 then
    begin
      ZQAccount.close ;
      ZQAccount.Params[0].AsInteger := ALedgerItem.AccountID ;
      ZQAccount.open ;
    end ;
  if ZQAccount.IsEmpty then
       raise Exception.Create('Accountid '+IntToStr(ALedgerItem.AccountID) +'not found!');
 OpenAccountSubTypes;
 while not ZQBank.IsEmpty  do
    ZQBank.Delete ;
 while not ZQTax.IsEmpty  do
    ZQTax.Delete ;
 while not ZQDebtor.IsEmpty  do
    ZQDebtor.Delete ;
 while not ZQCreditor.IsEmpty  do
    ZQCreditor.Delete ;
 while not ZQTotals.IsEmpty  do
    ZQTotals.Delete ;
 while not ZQAccount.IsEmpty  do
    ZQAccount.Delete ;
 ZQBank.close ;
 ZQTax.close ;
 ZQDebtor.close ;
 ZQCreditor.close ;
 ZQTotals.close ;
 ZQAccount.close ;
end;

procedure TDMCoreAccountData.OpenAccountSubTypes;
begin
 ZQBank.close ;
 ZQTax.close ;
 ZQDebtor.close ;
 ZQCreditor.close ;
 ZQTotals.close ;

 ZQBank.Params[0].AsInteger := ZQAccountWACCOUNTID.AsInteger ;
 ZQTax.Params[0].AsInteger := ZQAccountWACCOUNTID.AsInteger ;
 ZQDebtor.Params[0].AsInteger := ZQAccountWACCOUNTID.AsInteger ;
 ZQCreditor.Params[0].AsInteger := ZQAccountWACCOUNTID.AsInteger ;
 ZQTotals.Params[0].AsInteger := ZQAccountWACCOUNTID.AsInteger ;

 ZQBank.Open ;
 ZQTax.Open ;
 ZQDebtor.Open ;
 ZQCreditor.Open ;
 ZQTotals.Open ;
end;

procedure TDMCoreAccountData.LoadAcountList(
  ALedgerCalculationClass: TOSFLedgerCalculationClass);
  var
   ZqLocalAccount : TuniQuery ;
   ALedgerItem,AMainLedgerItem : TOSFLedgerItem ;
begin
 ALedgerCalculationClass.Clear ;
 ZqLocalAccount := TuniQuery.create(self) ;
 try
 ZqLocalAccount.Connection :=DMTCCoreLink.TheZConnection;
 ZqLocalAccount.SQL.Text := 'Select * from account where WAccountTypeId not in (1,2) ' ;
 ZqLocalAccount.Open ;

 AMainLedgerItem :=   ALedgerCalculationClass.Add(nil) ;
 AMainLedgerItem.Name := DMTCCoreLink.GetTextLang(1847) ;
 AMainLedgerItem.IsGroupNode := true ;
 AMainLedgerItem.Group1 := 0 ;

 While not ZqLocalAccount.eof do
 begin
   ALedgerItem :=  AMainLedgerItem.NesteldNodes.add(AMainLedgerItem) ;
   ALedgerItem.Group2id :=  ZqLocalAccount.fieldByName('WREPORTINGGROUP2ID').AsInteger ;
   ALedgerItem.Group1id  :=  ZqLocalAccount.fieldByName('WREPORTINGGROUP1ID').AsInteger ;
   ALedgerItem.Name := ZqLocalAccount.fieldByName('SDESCRIPTION').AsString ;
        ALedgerItem.Accountcode := ZqLocalAccount.fieldByName('SACCOUNTCODE').AsString ;
        ALedgerItem.AccountID := ZqLocalAccount.fieldByName('WACCOUNTID').AsInteger ;
        ALedgerItem.LedgerType :=  ZqLocalAccount.fieldByName('WACCOUNTTYPEID').AsInteger ;
        ALedgerItem.IncomeExpence :=  ZqLocalAccount.fieldByName('BINCOMEEXPENSE').AsInteger = 1 ;
        ALedgerItem.LinkedAccountId :=  ZqLocalAccount.fieldByName('WLINKACCOUNT').AsInteger ;
        ALedgerItem.SubAccounts  :=  ZqLocalAccount.fieldByName('BSUBACCOUNTS').AsInteger = 1 ;
        ALedgerItem.SubAccountCode  :=  Copy(ZqLocalAccount.fieldByName('SACCOUNTCODE').AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZqLocalAccount.fieldByName('BOPENITEM').AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZqLocalAccount.fieldByName('BINACTIVE').AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZqLocalAccount.fieldByName('DSYSDATE').AsDateTime ;
        ALedgerItem.Total          :=  0 ;
        ALedgerItem.TaxAccountid   :=   ZqLocalAccount.fieldByName('WTAXACCOUNT').AsInteger ;
        if ALedgerItem.IncomeExpence then
          ALedgerItem.ProffitLoss := ALedgerItem.Total  else
          ALedgerItem.Balans := ALedgerItem.Total ;
        if ALedgerItem.AccountID = DMTCCoreLink.DebtorsControlAccountid then
        ALedgerItem.ControlAccountType := 1 ;
        if ALedgerItem.AccountID = DMTCCoreLink.CreditorsControlAccountid then
        ALedgerItem.ControlAccountType := 2 ;
        if ALedgerItem.AccountID = DMTCCoreLink.RetaindIncomeControlAccountid then
        ALedgerItem.ControlAccountType := 3 ;
        //handel bank and tax
        // bank
        if ALedgerItem.LedgerType = 3 then
          begin
             ZQGen.SQL.Text := ' select bank.WReceiptsid,a.SDescription SReceiptDesc,bank.WPaymentsid,b.SDescription SPaymentDesc from ' +
                               ' BANK left join battypes a on (bank.WReceiptsid = a.WBatchTypeid) left join battypes b on (bank.WPaymentsid = b.WBatchTypeid) ' ;
             ZQGen.SQL.add('where bank.WAccountid =' + ZqLocalAccount.fieldByName('WACCOUNTID').AsString );
             ZQGen.open ;
             ALedgerItem.ReceiptsBatchName :=  ZQGen.fieldByName('SReceiptDesc').AsString ;
             ALedgerItem.ReceiptsBatchID :=  ZQGen.fieldByName('WReceiptsid').AsInteger ;
             ALedgerItem.PaymentBatchName :=  ZQGen.fieldByName('SPaymentDesc').AsString ;
             ALedgerItem.PaymentBatchID :=  ZQGen.fieldByName('WPaymentsid').AsInteger ;
             ZQGen.Close ;
          end;
         // tax
        if ALedgerItem.LedgerType = 4 then
          begin
             ZQGen.SQL.Text := ' select Frate,WLinkTaxid,BlinkContra from tax ' ;
             ZQGen.SQL.add('where tax.WAccountid =' + ZqLocalAccount.fieldByName('WACCOUNTID').AsString );
             ZQGen.open ;
             ALedgerItem.TaxRate :=  ZQGen.fieldByName('Frate').AsFloat ;
             ALedgerItem.LinkTax :=  ZQGen.fieldByName('WLinkTaxid').AsInteger ;
             ALedgerItem.UseContraTax :=  ZQGen.fieldByName('BlinkContra').AsInteger = 1 ;
             ZQGen.Close ;
          end;
     ZqLocalAccount.next ;     
 end;
 finally
    ZqLocalAccount.free ;
 end;
end;

end.

