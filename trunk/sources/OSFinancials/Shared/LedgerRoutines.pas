(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit LedgerRoutines;

interface

Uses  Classes,Controls,Sysutils,Variants,TcVariables,DB,Windows,Forms,tcashclasses,UDMCoreDocData,UDMCoreData,OSFGeneralRoutines,dialogs;

function  GetAccountTotal (_WAccountID, _WPeriodID, Switch : Integer) : Real;

function  LrGetPeriod(Date : TDateTime) : Integer;
function  LrGetMainAccountCode(AccountNumber : String) : String;
function  LrGetSubAccountCode(AccountNumber : String) : String;
Function  LrAddDashInAccountCode(Account:String):String;
Function  LrPostNewBatch(aUser,BatchTypeID:Integer;TryAutoLink : Boolean;DocId : Integer;UseBatchCtrlID : Boolean = false):Integer;
function  LrPostBatchLine(aDMCoreData: TDMCoreData;BatchTypeID : Integer;Var TransID,BatchCtrlID:LongInt;DocId : Integer;isreverse : boolean = false;IsOpeningBal : Boolean = false ;DefCost1ID : Integer = 0 ) : Boolean;
function  LrGetControlAccountID(AccControlID: integer) : integer;
function  LrGetAccountTotal (Var aAccRec:TAccountRec; WPeriodID, Switch : Integer) : Real;
Function  LrPostInternalBatch(aUser,BatchTypeID:Integer;Bimported:Boolean;aAlias:String;Var aTransID:integer;DocId : Integer):integer;
//function GetAccountCodeWithDashFromAccountId(AAccountId : Integer):String ;
function GetAccountCodeWithTypePrefixFromAccountId(AAccountId : Integer):String ;
Procedure UnlinkLine(aBatLinkedID,aBatchCtrlID:integer);
Procedure UnlinkTransaction(AFromLink:integer);
Procedure linkTransaction(AFromLink,AToLink,AAccount:integer;LinkAmount : Double);
Procedure AutolinkTransaction(AFromLink,AToLink : Integer);

function  GetUnlinkTotalFromDoc(ADocID : Integer ) : Double ;
Function  LrBalanceBatch(Batchname : String ;aDMCoreData: TDMCoreData;BatchType:Integer;DefaultContraAccount:Integer=0;NoTax:Boolean = False):Integer;
Function  PostBatchNow(LyPost,MustPost:Boolean;IsReverse:Boolean = false;IsOpeningBal : Boolean = false ):integer;
Function  PrepareBatch(aBatTypName:String):Boolean;
function  IsPostLastYear : Boolean;
function  IsPostBankToBank(Var Atext: String ) : Boolean;
function  IsPostBankToStdLedgerWithTax(Var Atext: String ): Boolean;
function  IsPostOnAccount(AAccount : Integer) : Boolean;
Function  CanPostDoc(fDate:TDate;_WAccountID:integer):Integer;
Function CheckStockCode(bCheckCost:Boolean;StockId : Integer):Boolean;
procedure GetTransactLineFromDocumentId(aAccount,ADocID : Integer;Var ATransactLine: Integer; Var ATotalOpenAmount : Double ) ;
function  ConvertDocumentToBatch(Var WTrans:Integer;DocId : Integer;AutoLink:Boolean=False;MyADmCoreData : TDMCoreDocData =nil;MyADmCoreDataBatch : TDMCoreData=nil;DoCommit:Boolean = False) : Integer;
procedure HandelStockForDocLine(aDMCoreDocData:TDMCoreDocData;BAvgCos:Boolean ;StockID : Integer;PurchasePerItemPrice,FQtyShipped,FQtyOrdered : Double ;Level : Integer ; var CostPrice : Double);
procedure HandelStockTrans(aDMCoreDocData:TDMCoreDocData;FQtyShipped,FQtyOrdered,PurchasePerItemPrice : Double;BAvgCos:Boolean;StockID : Integer;Var CostPrice : Double ;level : Integer);
procedure FillCostOFSaleForStockItem(CostPrice : Double ;aDMCoreDocData:TDMCoreDocData;AddDocRef:String ;StockID : Integer;BAvgCos : Boolean ;FQtyShipped : Double; level : Integer) ;
procedure ReadLedgerObjectFromBatches(aLedgerCalculationClass : TLedgerCalculationClass;NoContra:boolean = false );
procedure ReadStockFromUnposted(aStockInvoicedCollection : TStockInvoicedCollection);
procedure ReadStockFromDocument(aStockInvoicedCollection : TStockInvoicedCollection;ADocID : Integer );
procedure ReadLedgerPeriodes(aLedgerPeriodeCollection : TLedgerPeriodeCollection);
procedure LedgerAddItemEvent ( const aLedgerItem : TLedgerItem );
function ValidateBatch(aDMCoreData : TDMCoreData) : Integer ;

Var
  LrErrorMsg:String;
  OnProgressBatchPost : TosFProgressEvent ;
  GlQtyMultiplier : Double ;
  // done : Pieter search the var mainaccount length for diget change
//  MainAccountLength : integer = 6 ;
// done : Sylvain ALL Global vars are in TcVariables
implementation

uses Database, DatabaseAccess, Progress, XRoutines, OpenItemSelection,globalFunctions,
    DBAccess , Uni,
  NewProgress,math, UDMTCCoreLink;




function FindMainAccount(MainAccountString: String): Boolean;
begin
  if not dmDatabase.tblAccount.Active then dmDatabase.tblAccount.Open;
  result := dmDatabase.tblAccount.Locate('SMAINACCOUNTCODE', VarArrayOf([LrGetMainAccountCode(MainAccountString)]), []) ;
end;

function FindFullAccountType(FullAccountString : String; aAccountType :Integer ) : boolean ;

begin
  if not dmDatabase.tblAccount.Active then dmDatabase.tblAccount.Open;
  result :=   dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',
                               VarArrayOf([LrGetMainAccountCode(FullAccountString) +  LrGetSubAccountCode(FullAccountString), 1{debtor}]), []);
end;

function FindMainAccountType(MainAccountString : String ; aAccountType :Integer ) : boolean ;
begin
  if not dmDatabase.tblAccount.Active then dmDatabase.tblAccount.Open;
  result := dmDatabase.tblAccount.Locate('SMAINACCOUNTCODE; WAccountTypeID', VarArrayOf([LrGetMainAccountCode(MainAccountString),aAccountType]), []) ;
end;




Function CheckStockCode(bCheckCost:Boolean;StockId : Integer):Boolean;
Var
  AQuery : TuniQuery ;

begin
   AQuery := TuniQuery.Create(nil) ;
   try
   AQuery.Connection := dmDatabase.ZMainconnection ;
   AQuery.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreDocData_SelectStockInfo');
   AQuery.ParamByName('WStockID').AsInteger:=  StockId ;
   AQuery.open ;
   Result:=True;
   if BCheckCOst and dmDatabase.SetOfBooksPropertys.CompanyInfo.CreateCostOfSales then
   begin
       if AQuery.FieldByName('COSOFSALESA').asinteger <> 0 then raise Exception.Create('Stock "' + TDataBaseStockRoutines.GetStockCode(StockId) + '" Cost of sales account has subaccounts!');

       Result := (AQuery.FieldByName('WCostAccountID').AsInteger <> 0) and (AQuery.FieldByName('COSOFSALESA').asinteger = 0) ;
   end;
   if AQuery.FieldByName('SALESSA').asinteger <> 0 then raise Exception.Create('Stock "' + TDataBaseStockRoutines.GetStockCode(StockId) + '" Stock account has subaccounts!');
   if AQuery.FieldByName('STOCKSA').asinteger <> 0 then raise Exception.Create('Stock "' + TDataBaseStockRoutines.GetStockCode(StockId) + '" Sales account has subaccounts!');


   case AQuery.FieldByName('WStockTypeID').AsInteger  of
     6 , 10:  Result := true ;
     1,2,4 : begin
             Result:= (AQuery.FieldByName('WSaleSACCOUNTID').asinteger <> 0)  ;
             end;
     3,5 : begin
             result := (AQuery.FieldByName('WStockAccountID').asinteger <> 0)  ;
           end;
     else
      begin
      Result:= Result and ((AQuery.FieldByName('WSaleSACCOUNTID').asinteger <> 0)) and
               ((AQuery.FieldByName('WStockAccountID').asinteger <> 0) ) ;
      end;
    end ;
   finally
      AQuery.free ;
   end;
end;



function GetAccountTotal (_WAccountID, _WPeriodID, Switch : Integer) : Real;
{

  Gets the total for an account.

  Switch gets passed either a 1 , 2 , 3 , 4 , 5 and

  1:
   Returns the total for just that period.

  2:
   Returns the Budget for that period.

  3:
   Returns the ytd for this year up until
   WPeriodID including last year's totals.

  4:
    added by Sylvain
    Returns the last Year Openning Balance for that Period

  5:
   Returns the ytd for last year up until
   WPeriodID.
  6:
   Returns the ytd for years before last year
   WPeriodID.
  7 : Returns Last years opening balance new style (using period -1 in totals)
}
var

  Total,Tmp : Real;

begin
  total := 0;
  case Switch of
  1:
  begin
     with dmDatabase.qGen do begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('select sum(FAMount) from totals');
      SQL.Add('where WAccountID = ' + IntToStr(_WaccountID));
      SQL.Add('and WPeriodID = ' + IntToStr(_WPeriodID));
      SQL.Add('and BActual= 1 and WYearid in (1,2)');
      Open;
      Total := Fields[0].AsFloat;
      Close;
     end;
  end;
  2:
  begin
     with dmDatabase.qGen do begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('select sum(FAMount) from totals');
      SQL.Add('where WAccountID = ' + IntToStr(_WaccountID));
      SQL.Add('and WPeriodID = ' + IntToStr(_WPeriodID));
      SQL.Add('and BActual= 0 and WYearid in (1,2)');
      Open;
      Total := Fields[0].AsFloat;
      Close;
    end;
  end;
  3:
  begin
    Total := TDataBaseRoutines.GetBalans(_WaccountID,TDataBaseRoutines.GetPeriodEndDate(_WPeriodID));
  end;
  4:
  begin
     Tmp:=0;

     with dmDatabase.qGen do begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('select FAmount,WperiodID from totals');
      SQL.Add('where WAccountID = ' + IntToStr(_WaccountID));
      SQL.Add('and BActual= 1 and WYearid in (1,2,-1)');
      Open;
      First;
      While not eof do
      begin
       if (Fields[1].AsInteger>=1) and (Fields[1].AsInteger<=_WPeriodID ) then
        tmp :=tmp+ Fields[0].AsFloat;
       // Added By Sylvain
       if (Fields[1].AsInteger = 0)  and (_WPeriodID > 13) then
         Total:=Total+Fields[0].AsFloat;

       if (Fields[1].AsInteger =-1)  and (_WPeriodID < 13) then
         Total:=Total+Fields[0].AsFloat;


      // if (Fields[1].AsInteger<14) And (Fields[1].AsInteger>=1) then
      //   Total:=Total-Fields[0].AsFloat;
       next;
      end;
      Total := Total + Tmp;
  //      Tmp:=Tmp+Total;

      if TDataBaseRoutines.IsIncomeExpense(dmDatabase.tblAccountWAccountID.Value) then
          Total := Tmp ;
     // this is the year before last year but wat about the year before that?
     // i think this is ment to get the year before last years total right ?

     if  (_WPeriodID > 13 ) and (LrGetControlAccountID(3)=_WAccountID) then
     begin   //retained earnings account
       dmDatabase.qGen.SQL.Clear;
       dmDatabase.qGen.SQL.Add('select sum(FAmount) from totals,account');
       dmDatabase.qGen.SQL.Add('where WPeriodID >= 1 and WPeriodID <= 13 and WYearid in (1,2)');
       dmDatabase.qGen.SQL.Add('and account.WAccountID = totals.WAccountID');
       dmDatabase.qGen.SQL.Add('and account.BIncomeExpense = 1');
       dmDatabase.qGen.SQL.Add('and account.SSUBACCOUNTCODE = ''000''');
       dmDatabase.qGen.Open;
       Total := Total - dmDatabase.qGen.Fields[0].AsFloat;
       dmDatabase.qGen.Close;
      end;
      // End of my Adding
//      Total:=Tmp;
      Close;
    end;
    end;
  5:
    begin
     Tmp:=0;
     with dmDatabase.qGen do begin
      if Active then Close;
      SQL.Clear;
      SQL.Add('select FAmount,WperiodID from totals');
      SQL.Add('where WAccountID = ' + IntToStr(_WaccountID));
      SQL.Add('and BActual= 1 and WYearid in (1,2)');
      Open;
      First;
      While not eof do
      begin
       if (Fields[1].AsInteger>=1) and (Fields[1].AsInteger<=_WPeriodID ) then
        tmp :=tmp+ Fields[0].AsFloat;
       next;
      end;
      Total:=Tmp;
      Close;
    end;
   end;
{6:
  begin
     Tmp:=0;
     if  LrGetControlAccountID(3)=_WAccountID then
     begin   //retained earnings account
       dmDatabase.qGen.SQL.Clear;
       dmDatabase.qGen.SQL.Add('select sum(FAmount) from transact,account');
       dmDatabase.qGen.SQL.Add('where WYearid not in (1,2)');
       dmDatabase.qGen.SQL.Add('and account.WAccountID = totals.WAccountID');
       dmDatabase.qGen.SQL.Add('and account.BIncomeExpense = 1');
       dmDatabase.qGen.SQL.Add('and account.SSUBACCOUNTCODE = ''000''');
       dmDatabase.qGen.Open;
       Total := Total - dmDatabase.qGen.Fields[0].AsFloat;
       dmDatabase.qGen.Close;
      end;
    end;

     }

  end;

 result:=Total;
end;

function LrGetPeriod(Date : TDateTime) : Integer;
{
  Gets the period a date is in and returns it. If
  it cant find a period it'll return a 1.
}


begin
 Result := -1;
 if dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemPeriodFromDate(Date)  = nil then
    begin
      if dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetLowYear -1  = Date then
        Result := -2 ;
      exit ;
    end;
 result := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemPeriodFromDate(Date).PeriodeId ;
end;


function LrGetMainAccountCode(AccountNumber : String) : String;
begin
 // done : pieter i think it should point to mainroutines not ??
 // i got a range check error on this one.
 // Sylvain : I Change these 2 functions Getmain and Get Sub
  Result := ZipAccountCode(Trim(AccountNumber));
  REsult := Copy(Result,1,MainAccountLength);
end;

Function  LrAddDashInAccountCode(Account:String):String;
begin
  result := Account ;
  if length(Account) > MainAccountLength  then
    Insert('-', result,MainAccountLength +1);
end;

function LrGetSubAccountCode(AccountNumber : String) : String;
begin
  {Changed by sylvain. This must give the correct sub account every time
   so these two lines can do it}
  Result := ZipAccountCode(AccountNumber);
  Delete(Result,1,MainAccountLength);
end;

function LrPostBatchLine(ADMCoreData :TDMCoreData ; BatchTypeID : Integer;Var TransID,BatchCtrlID:LongInt;DocId : Integer;isreverse : boolean = false ;IsOpeningBal : Boolean = false;DefCost1ID : Integer = 0 ) : Boolean;
{
  This function posts a line of the batch to the transaction
  file. Assumes that batch.db is open. Returns True if it goes
  through ok.
  Creates Open Item (Balance brought forward)Links
  as it posts if CreateLinks is true.
}
var
  Main, Sub : String;
  AcctID: integer;
  BDebOrCred: Boolean;
  Tmp  : real;
  LastLineTot,TempTotal : Double ;
  DecPlace:Integer;
  Cashbook : Integer ;
  Day1,day2,Month1,Month2,Year1,Year2 : Word ;
 

begin
 DecPlace:=GetDecPalces;
    if (dmDatabase.tblBatchFDEBIT.Value=0) and (dmDatabase.tblBatchFCREDIT.Value=0) and (dmDatabase.tblBatchWTAXID.AsInteger = 0) then
    begin
     result:=True;
     exit;
    end;
   LastLineTot := FixAmt((FixAmt(dmDatabase.tblBatchFDEBIT.Value,DecPlace) - FixAmt(dmDatabase.tblBatchFCREDIT.Value,DecPlace)),DecPlace);


  // One thing we can have is posting to the main Debtor/ creditor account
  // Im checking here couse i saw some bookings and i need users to give me the batch where tis happens.
  if  (dmDatabase.tblBatchWAccountID.AsInteger in[dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount,dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount]) then
    Raise Exception.Create('You cant post to a control account!'+#13+#10+dmDatabase.tblBatchSREFERENCE.AsString + #9 + dmDatabase.tblBatchSDESCRIPTION.AsString + #9 +
    dmDatabase.tblBatchFAMOUNT.AsString + #9 +     dmDatabase.tblBatchRefTotalsSACCOUNT.AsString);
  if  (dmDatabase.tblBatchWAccountID.AsInteger = 0) then
    Raise Exception.Create('You cant post to the zero tax account!'
    +#13+#10+dmDatabase.tblBatchSREFERENCE.AsString + #9 + dmDatabase.tblBatchSDESCRIPTION.AsString + #9 +
    dmDatabase.tblBatchFDEBIT.AsString + #9 +  dmDatabase.tblBatchFCREDIT.AsString + #9 +   dmDatabase.tblBatchRefTotalsSACCOUNT.AsString );

  with dmDatabase do
  begin

    ADMCoreData.ZQAccount.Close ;

    tblSysVars.Open;
    ADMCoreData.ZQAccount.ParamByName('WAccountId').AsInteger := dmDatabase.tblBatchWAccountID.AsInteger ;
    ADMCoreData.ZQAccount.open ;
    if ADMCoreData.ZQAccount.IsEmpty then
      begin
       if dmDatabase.tblBatchFAMOUNT.IsNull then
         exit ;
       Raise Exception.Create('Account not found!'   +#13+#10+dmDatabase.tblBatchSREFERENCE.AsString + #9 + dmDatabase.tblBatchSDESCRIPTION.AsString + #9 +
          dmDatabase.tblBatchFAMOUNT.AsString + #9 +     dmDatabase.tblBatchSACCOUNT.AsString);
      end;

    Main := ADMCoreData.ZQAccountSMAINACCOUNTCODE.AsString;
    Sub  := ADMCoreData.ZQAccountSSUBACCOUNTCODE.AsString;
    if  ADMCoreData.ZQAccountBSUBACCOUNTS.AsInteger = 1 then
       Raise Exception.Create('You cant post a account With subaccounts! '   +#13+#10+dmDatabase.tblBatchSREFERENCE.AsString + #9 + dmDatabase.tblBatchSDESCRIPTION.AsString + #9 +
    dmDatabase.tblBatchFAMOUNT.AsString + #9 +     dmDatabase.tblBatchSACCOUNT.AsString);

   if DMTCCoreLink.ExtraOptions.Values['BHASBLOCK'] = 'TRUE' then
     if 0 <> DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*) from sysparams where WTypeID=7002 AND SParamName = ' + QuotedStr('B'+ ADMCoreData.ZQAccountWACCOUNTID.AsString ) +' and wUserID=' +IntToStr(DMTCCoreLink.currentuser )) then
        Raise Exception.Create('You cant post to the account ' + ADMCoreData.ZQAccountSACCOUNTCODE.AsString + ' You have no rights! Blocked account in access control.' );

    AcctID := dmDatabase.tblBatchWAccountID.AsInteger ;
    BDebOrCred:= False;
    if ADMCoreData.ZQAccountWAccountTypeID.Value in [1,2] then
    BDebOrCred:=True;
    //Update the account's entry in the totals table

    ADMCoreData.ZQTotals.Close;
    ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=   dmDatabase.tblBatchWAccountID.AsInteger ;
    ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
    ADMCoreData.ZQTotals.Filtered:=False;
    ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
    ADMCoreData.ZQTotals.Filtered:=True;
    ADMCoreData.ZQTotals.Open;
      if not IsOpeningBal or (lrGetPeriod(tblBatchDDate.Value) < 0) then
      begin
    if not ADMCoreData.ZQTotals.Locate('WPeriodID', lrGetPeriod(tblBatchDDate.Value), []) then
       begin
        ADMCoreData.ZQTotals.Insert ;
        ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
        ADMCoreData.ZQTotalsWPERIODID.AsInteger := lrGetPeriod(tblBatchDDate.Value) ;
        if ADMCoreData.ZQTotalsWPERIODID.AsInteger < 14 then
        ADMCoreData.ZQTotalsWYearid.AsInteger := 1 else
        ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
        ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
      end;

    ADMCoreData.ZQTotals.Edit;
    ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
    ADMCoreData.ZQTotals.Post;
    end;
//------ Post to last Year-- Sylvain 11/10
// update retained earnings or Period 0 for balance sheet
    If lrGetPeriod(tblBatchDDate.Value)<14 then
     begin
           if (ADMCoreData.ZQAccountBIncomeExpense.Value=1) then
           begin
            ADMCoreData.ZQTotals.Close;
            ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=   dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ;
            ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
            ADMCoreData.ZQTotals.Filtered:=False;
            ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
            ADMCoreData.ZQTotals.Filtered:=True;
            ADMCoreData.ZQTotals.Open;
            if not ADMCoreData.ZQTotals.Locate('WPeriodID', 0, []) then
               begin
                ADMCoreData.ZQTotals.Insert ;
                ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                ADMCoreData.ZQTotalsWPERIODID.AsInteger := 0 ;
                ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
                ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
               end;
             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
             ADMCoreData.ZQTotals.Post;
           end
           else
           begin
              ADMCoreData.ZQTotals.Close;
              ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=   dmDatabase.tblBatchWAccountID.AsInteger ;
              ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
              ADMCoreData.ZQTotals.Filtered:=False;
              ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
              ADMCoreData.ZQTotals.Filtered:=True;
              ADMCoreData.ZQTotals.Open;
            if not ADMCoreData.ZQTotals.Locate('WPeriodID', 0, []) then
               begin
                ADMCoreData.ZQTotals.Insert ;
                ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                ADMCoreData.ZQTotalsWPERIODID.AsInteger := 0 ;
                ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
                ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
               end;
             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
             ADMCoreData.ZQTotals.Post;
          end;
        // dome Pieter post to opening lastyear
         If lrGetPeriod(tblBatchDDate.Value)= -2 then
               begin
                     if (ADMCoreData.ZQAccountBIncomeExpense.Value=1) then
                     begin
                      ADMCoreData.ZQTotals.Close;
                      ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=   dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ;
                      ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
                      ADMCoreData.ZQTotals.Filtered:=False;
                      ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
                      ADMCoreData.ZQTotals.Filtered:=True;
                      ADMCoreData.ZQTotals.Open;
                      if not ADMCoreData.ZQTotals.Locate('WPeriodID', -1, []) then
                         begin
                          ADMCoreData.ZQTotals.Insert ;
                          ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                          ADMCoreData.ZQTotalsWPERIODID.AsInteger := -1 ;
                          ADMCoreData.ZQTotalsWYearid.AsInteger := 1 ;
                          ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                         end;
                       ADMCoreData.ZQTotals.Edit;
                        ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
                       ADMCoreData.ZQTotals.Post;
                     end
                     else
                     begin
                        ADMCoreData.ZQTotals.Close;
                        ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=   dmDatabase.tblBatchWAccountID.AsInteger ;
                        ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
                        ADMCoreData.ZQTotals.Filtered:=False;
                        ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
                        ADMCoreData.ZQTotals.Filtered:=True;
                        ADMCoreData.ZQTotals.Open;
                      if not ADMCoreData.ZQTotals.Locate('WPeriodID', -1, []) then
                         begin
                          ADMCoreData.ZQTotals.Insert ;
                          ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                          ADMCoreData.ZQTotalsWPERIODID.AsInteger := -1 ;
                          ADMCoreData.ZQTotalsWYearid.AsInteger := 1 ;
                          ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                         end;
                       ADMCoreData.ZQTotals.Edit;
                        ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  +  LastLineTot;
                       ADMCoreData.ZQTotals.Post;
                    end;
                end;
      end;
//-End--- Post to last Year-- Sylvain 11/10 --------------------------------
//update its control account
// if it is a debtor or creditor
    if ADMCoreData.ZQAccountWAccountTypeID.Value = 1 then
    begin

      ADMCoreData.ZQTotals.Close;
      ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=  dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount ;
      ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
      ADMCoreData.ZQTotals.Filtered:=False;
      ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
      ADMCoreData.ZQTotals.Filtered:=True;
      ADMCoreData.ZQTotals.Open;
      if not IsOpeningBal or (lrGetPeriod(tblBatchDDate.Value) <0) then
      begin
      if not ADMCoreData.ZQTotals.Locate('WPeriodID', lrGetPeriod(tblBatchDDate.Value), []) then
         begin
          ADMCoreData.ZQTotals.Insert ;
          ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
          ADMCoreData.ZQTotalsWPERIODID.AsInteger := lrGetPeriod(tblBatchDDate.Value) ;
          if ADMCoreData.ZQTotalsWPERIODID.AsInteger < 14 then
          ADMCoreData.ZQTotalsWYearid.AsInteger := 1 else
          ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
          ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
        end;
      ADMCoreData.ZQTotals.Edit;
      ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  +  LastLineTot ;
      ADMCoreData.ZQTotals.Post;
     end;
//------ Post to last Year-- Sylvain 11/10 (if it is a debtor or creditor)------------
         If lrGetPeriod(tblBatchDDate.Value)<14 then
          begin
          if not ADMCoreData.ZQTotals.Locate('WPeriodID', 0, []) then
             begin
              ADMCoreData.ZQTotals.Insert ;
              ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
              ADMCoreData.ZQTotalsWPERIODID.AsInteger := 0 ;
              ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
              ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
             end;
             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  +  LastLineTot;
             ADMCoreData.ZQTotals.Post;
                 //done Pieter opening last year
                   If lrGetPeriod(tblBatchDDate.Value) = -2 then
                    begin
                    if not ADMCoreData.ZQTotals.Locate('WPeriodID', -1, []) then
                       begin
                        ADMCoreData.ZQTotals.Insert ;
                        ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                        ADMCoreData.ZQTotalsWPERIODID.AsInteger := -1 ;
                        ADMCoreData.ZQTotalsWYearid.AsInteger := 1 ;
                        ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                       end;
                       ADMCoreData.ZQTotals.Edit;
                        ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  +  LastLineTot;
                       ADMCoreData.ZQTotals.Post;
                    end;
          end;
      end;
//-End--- Post to last Year-- Sylvain 11/10 --------------------------------

    if ADMCoreData.ZQAccountWAccountTypeID.Value = 2 then
    begin
      ADMCoreData.ZQTotals.Close;
      ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=  dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount ;
      ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
      ADMCoreData.ZQTotals.Filtered:=False;
      ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
      ADMCoreData.ZQTotals.Filtered:=True;
      ADMCoreData.ZQTotals.Open;


      if not IsOpeningBal or (lrGetPeriod(tblBatchDDate.Value) <0) then
      begin
      if not ADMCoreData.ZQTotals.Locate('WPeriodID', lrGetPeriod(tblBatchDDate.Value), []) then
         begin
          ADMCoreData.ZQTotals.Insert ;
          ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
          ADMCoreData.ZQTotalsWPERIODID.AsInteger := lrGetPeriod(tblBatchDDate.Value) ;
          ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
          if ADMCoreData.ZQTotalsWPERIODID.AsInteger < 14 then
          ADMCoreData.ZQTotalsWYearid.AsInteger := 1 else
          ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
        end;

      ADMCoreData.ZQTotals.Edit;
      ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
      ADMCoreData.ZQTotals.Post;
      end ;
//------ Post to last Year-- Sylvain 11/10 (if it is a debtor or creditor)------------
         If lrGetPeriod(tblBatchDDate.Value)<14 then
           begin
            if not ADMCoreData.ZQTotals.Locate('WPeriodID', 0, []) then
               begin
                ADMCoreData.ZQTotals.Insert ;
                ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                ADMCoreData.ZQTotalsWPERIODID.AsInteger := 0 ;
                ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
              end;

             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
             ADMCoreData.ZQTotals.Post;
               If lrGetPeriod(tblBatchDDate.Value) = -2 then
                 begin
                  if not ADMCoreData.ZQTotals.Locate('WPeriodID', -1, []) then
                     begin
                      ADMCoreData.ZQTotals.Insert ;
                      ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                      ADMCoreData.ZQTotalsWPERIODID.AsInteger := -1 ;
                      ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                      ADMCoreData.ZQTotalsWYearid.AsInteger := 1 ;
                    end;

                   ADMCoreData.ZQTotals.Edit;
                   ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
                   ADMCoreData.ZQTotals.Post;
                end;
          end;
      end;
//-End--- Post to last Year-- Sylvain 11/10 --------------------------------

    //if it is not a debtor or a creditor
    // Post to main Account
    if (ADMCoreData.ZQAccountWAccountTypeID.Value <> 1)
        and (ADMCoreData.ZQAccountWAccountTypeID.Value <> 2)
        and (ADMCoreData.ZQAccountWACCOUNTID.AsInteger <> ADMCoreData.ZQAccountWLINKACCOUNT.AsInteger) then
    begin
      ADMCoreData.ZQMainAccount.Close ;
      ADMCoreData.ZQMainAccount.ParamByName('Waccountid').AsInteger := ADMCoreData.ZQAccountWLINKACCOUNT.AsInteger  ;
      ADMCoreData.ZQMainAccount.open ;

      if not ADMCoreData.ZQMainAccount.IsEmpty then
      begin
      ADMCoreData.ZQTotals.Close;
      ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger :=  ADMCoreData.ZQMainAccountWAccountID.Asinteger ;
      ADMCoreData.ZQTotals.IndexFieldNames := 'WPeriodId';
      ADMCoreData.ZQTotals.Filtered:=False;
      ADMCoreData.ZQTotals.Filter := 'BActual =1'  ;
      ADMCoreData.ZQTotals.Filtered:=True;
      ADMCoreData.ZQTotals.Open;
      if not IsOpeningBal or (lrGetPeriod(tblBatchDDate.Value) < 0) then
      begin

      if not ADMCoreData.ZQTotals.Locate('WPeriodID', lrGetPeriod(tblBatchDDate.Value), []) then
         begin
          ADMCoreData.ZQTotals.Insert ;
          ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
          ADMCoreData.ZQTotalsWPERIODID.AsInteger := lrGetPeriod(tblBatchDDate.Value) ;
          ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
          if ADMCoreData.ZQTotalsWPERIODID.AsInteger < 14 then
          ADMCoreData.ZQTotalsWYearid.AsInteger := 1 else
          ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
        end;

        ADMCoreData.ZQTotals.Edit;
        ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
        ADMCoreData.ZQTotals.Post;
       end;
//------ Post to last Year-- Sylvain 11/10 (if it is not a debtor or a creditor)------------
         If lrGetPeriod(tblBatchDDate.Value)<14 then
         begin
           if not (ADMCoreData.ZQMainAccountBIncomeExpense.AsInteger = 1) then
           begin
            if not ADMCoreData.ZQTotals.Locate('WPeriodID', 0, []) then
               begin
                ADMCoreData.ZQTotals.Insert ;
                ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                ADMCoreData.ZQTotalsWPERIODID.AsInteger := 0 ;
                ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                ADMCoreData.ZQTotalsWYearid.AsInteger := 2 ;
              end;
             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
             ADMCoreData.ZQTotals.Post;
          end;
          // done pieter opening balans last year
         If lrGetPeriod(tblBatchDDate.Value)<14 then
         begin
           if not (ADMCoreData.ZQMainAccountBIncomeExpense.AsInteger = 1) then
           begin
            if not ADMCoreData.ZQTotals.Locate('WPeriodID', -1, []) then
               begin
                ADMCoreData.ZQTotals.Insert ;
                ADMCoreData.ZQTotalsWACCOUNTID.AsInteger := ADMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger ;
                ADMCoreData.ZQTotalsWPERIODID.AsInteger := -1 ;
                ADMCoreData.ZQTotalsBACTUAL.AsInteger := 1 ;
                ADMCoreData.ZQTotalsWYearid.AsInteger := 1 ;
              end;
             ADMCoreData.ZQTotals.Edit;
             ADMCoreData.ZQTotalsFAmount.Value := ADMCoreData.ZQTotalsFAmount.Value  + LastLineTot ;
             ADMCoreData.ZQTotals.Post;
          end;
       end;
       end;
//-End--- Post to last Year-- Sylvain 11/10 --------------------------------
 {    if not tblAccount.Locate('SACCOUNTCODE',Main+Sub,[]) then
        raise Exception.create('Cant find account' +Main+Sub);
     end;    }
    end;
   end;
    ADMCoreData.ZQTotals.Close;
    // TODO : BDEINDEX
    // tblBatchControl.IndexName:='';



    if (not ADMCoreData.ZQBatchControl.Active) or (ADMCoreData.ZQBatchControlWBATCHID.AsInteger <> BatchCtrlID) or (BatchCtrlID = 0) then
    begin
    ADMCoreData.ZQBatchControl.Close ;
    ADMCoreData.ZQBatchControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnBatcControlID');
    ADMCoreData.ZQBatchControl.ParamByName('WBatchID').AsInteger := BatchCtrlID ;
    ADMCoreData.ZQBatchControl.Open;
    end;
    if BatchCtrlID = 0 then
       begin
        BatchCtrlID :=ADMCoreData.AppendBatchControlId(CurrentUser,currentUser,BatchTypeID,1,0) ;
       end;
    if Not ADMCoreData.ZQBatchControlWBATCHID.asinteger = BatchCtrlID then
      raise Exception.Create('Batch control id not found!' + IntToStr(BatchCtrlID));
    ADMCoreData.ZQTransaction.Open;
    ADMCoreData.ZQTransaction.Append;
    ADMCoreData.ZQTransactionWBatchID.Value := ADMCoreData.ZQBatchControlWBatchID.Value;
    ADMCoreData.ZQTransactionWBatchTypeID.Value := BatchTypeID;
    ADMCoreData.ZQTransactionWLineID.Value := tblBatchWlineID.AsInteger;
    ADMCoreData.ZQTransactionBCarriedForward.AsInteger  := 0;
    ADMCoreData.ZQTransactionBLinksUsed.AsInteger  := 0;
    // use for tax base line tag
     ADMCoreData.ZQTransactionBMultipleItems.AsInteger := 1;

     ADMCoreData.ZQBatchTypes.Open ;
     if tblBatchWTAXID.AsInteger <> 0 then
       if ADMCoreData.ZQBatchTypes.Locate('WBATCHTYPEID',BatchTypeID,[]) then
        begin
         if ADMCoreData.ZQBatchTypesBCASHBOOK.AsInteger = 1 then
            begin
              if  tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger then
                ADMCoreData.ZQTransactionBMultipleItems.AsInteger := 2;
            end else
            begin
              if  tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger then
                ADMCoreData.ZQTransactionBMultipleItems.AsInteger := 2;
            end;
        end;




    ADMCoreData.ZQTransactionWAccountID.Value := ADMCoreData.ZQAccountWAccountID.Value;
    ADMCoreData.ZQTransactionDDate.Value := tblBatchDDate.Value;

    ADMCoreData.ZQTransactionWJOBCODEID.AsInteger := StrToIntDef(tblBatchSJOBCODE.AsString,0) ;
    if ADMCoreData.ZQTransactionWJOBCODEID.AsInteger = 0 then
       ADMCoreData.ZQTransactionWJOBCODEID.Clear ;
    ADMCoreData.ZQTransactionWREPORTINGGROUP1ID.AsInteger := tblBatchWREPORTINGGROUP1ID.AsInteger ;
    if ADMCoreData.ZQTransactionWREPORTINGGROUP1ID.AsInteger = 0 then
        ADMCoreData.ZQTransactionWREPORTINGGROUP1ID.AsInteger := DefCost1ID ;
    ADMCoreData.ZQTransactionWREPORTINGGROUP2ID.AsInteger := tblBatchWREPORTINGGROUP2ID.AsInteger ;
    ADMCoreData.ZQTransactionBEXCLUSIVE.AsInteger := tblBatchBEXCLUSIVE.AsInteger ;
    ADMCoreData.ZQTransactionWLINKEDID.AsInteger := tblBatchWLINKEDID.AsInteger ;
    if IsOpeningBal  then
       ADMCoreData.ZQTransactionBLASTYEAR.AsInteger := 1 ;
    if (not tblBatchDPAYMENTDATE.IsNull) AND (tblBatchDPAYMENTDATE.AsDateTime <> 0) then
    ADMCoreData.ZQTransactionDPAYMENTDATE.value := tblBatchDPAYMENTDATE.Value
    else
    ADMCoreData.ZQTransactionDPAYMENTDATE.AsDateTime := ADMCoreData.ZQTransactionDDATE.Value + 30;
    if DocId <> 0 then
    ADMCoreData.ZQTransactionWDOCID.AsInteger := DocId else
    ADMCoreData.ZQTransactionWDOCID.AsInteger :=  tblBatchWDOCID.AsInteger ;

   // ADMCoreData.ZQTransactionWLINKEDID.AsInteger := tblBatchWLINKEDID.AsInteger ;


    {Sylvain I prefert to drop Allocated Date}
//    tblTransactionWPeriodID.Value := GetPeriod(tblBatchDAllocatedDate.Value);
    ADMCoreData.ZQTransactionWPeriodID.Value := lrGetPeriod(tblBatchDDate.Value);
    if IsOpeningBal
       then ADMCoreData.ZQTransactionWPeriodID.Value := 0 ;
     if (lrGetPeriod(tblBatchDDate.Value) = -2)
       then ADMCoreData.ZQTransactionWPeriodID.Value := -1 ;

        // always alterdate of opening to max date
      if IsOpeningBal then
        begin
            DecodeDate(tblBatchDDate.Value,year1,Month1,Day1);
            DecodeDate(TDataBaseRoutines.GetPeriodEndDate(26),year2,Month2,Day2);
            ADMCoreData.ZQTransactionDDate.Value := EncodeDate(Year1,Month2,Day2);
        end;
  {  if ADMCoreData.ZQTransactionWPeriodID.Value = 0 then
      begin
         ADMCoreData.ZQTransactionDDate.Value := TDataBaseRoutines.GetPeriodStartDate(14) -1 ;
      end ;  }


    ADMCoreData.ZQTransactionSReference.Value := tblBatchSReference.Value;
    //Philip 4 Aug 99
    //make provision for notax
    if (trim(tblBatchSTAX.AsString) <> '') and (trim(tblBatchSTAX.AsString) <> '-')  then
    begin
      Main := lrGetMainAccountCode(tblBatchSTAX.AsString);
      Sub  := lrGetSubAccountCode(tblBatchSTAX.AsString);
      ADMCoreData.ZQTaxAccount.Close ;
      ADMCoreData.ZQTaxAccount.ParamByName('SAccountCode').AsString := Main + Sub ;
      ADMCoreData.ZQTaxAccount.open ;

      if not ADMCoreData.ZQTaxAccount.IsEmpty and not isreverse then
      begin
         // check tax on debtors creditors bank or other tax accounts not allowed.
           if  tblBatchFTAXAMOUNT.AsFloat <> 0 then
           begin
           Cashbook := DMTCCoreLink.OpenSqlReturnFirstColumn('Select Bcashbook from battypes where WBatchTypeId = '+IntToStr(BatchTypeID))  ;
           if Cashbook <> 0 then
           begin
           if (tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger) then
             if (ADMCoreData.ZQAccountWACCOUNTTYPEID.AsInteger in [1,2,3,4]) then
               Raise Exception.Create('Cashbook Line:' + tblBatchSREFERENCE.AsString +' Desc:' + tblBatchRefTotalsSDESCRIPTION.AsString + ' Cannot use '+tblBatchSTAX.AsString+' on a debtors creditors bank or other tax account!');
           end else
           begin
           if (tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger) then
             if (ADMCoreData.ZQAccountWACCOUNTTYPEID.AsInteger in [1,2,3,4]) then
               Raise Exception.Create('Line:' + tblBatchSREFERENCE.AsString +' Desc:' + tblBatchRefTotalsSDESCRIPTION.AsString + ' Cannot use '+tblBatchSTAX.AsString+' on a debtors creditors bank or other tax account!');
           end;
          end;

          ADMCoreData.ZQTransactionFTaxRate.Value := FixAmt(ADMCoreData.ZQTaxAccountFRATE.asfloat);
          ADMCoreData.ZQTransactionWTaxAccountID.Value := ADMCoreData.ZQTaxAccountWAccountID.Value;
      end
      else
      begin
       if not isreverse then
        begin
        // if this happens then theres something siriusly wrong (like no tax acccount entry in the tax table)
        // so i hav edecided to raise as that is mucth beter then to have a tax report that is incorrect (atleast unexpected).
        Raise Exception.Create('Tax account '+tblBatchSTAX.AsString+' not found in Tax table please check tax entry in the taxtable');

        ADMCoreData.ZQTransactionWTaxAccountID.AsInteger := 0;
        ADMCoreData.ZQTransactionFTaxRate.Value := 0;
        end;
      end;
    end
    else
    begin
      ADMCoreData.ZQTransactionFTaxRate.Value := 0;
      if (dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased = tbPayments) And BDebOrCred  then
        ADMCoreData.ZQTransactionWTaxAccountID.Value := tblSysVarsWDueAccountID.Value;
    end;

    ADMCoreData.ZQTransactionFAmount.Value := LastLineTot;
    ADMCoreData.ZQTransactionFOutstandingAmount.Value := ADMCoreData.ZQTransactionFAmount.Value;

    if fixAmt(ADMCoreData.ZQTransactionFAmount.Value,DecPlace) > 0 then
     ADMCoreData.ZQTransactionFTaxAmount.Value := abs(fixAmt(tblBatchFTaxAmount.Value,DecPlace))
    else
     ADMCoreData.ZQTransactionFTaxAmount.Value := - abs(fixAmt(tblBatchFTaxAmount.Value,DecPlace));

    if tblBatchWCONTRAACCOUNTID.AsInteger <> 0 then
    begin
      ADMCoreData.ZQTransactionWBalancingAccountID.Value := tblBatchWCONTRAACCOUNTID.AsInteger;
    end;
    ADMCoreData.ZQTransactionWDescriptionID.Value := AddMessage(tblBatchSDescription.Value);

    ADMCoreData.ZQTransactionWCurrencyID.Value := 0;
    ADMCoreData.ZQTransactionFForexAmount.Value := 1;
    ADMCoreData.ZQTransactionWUserID.Value := CurrentUser;
    ADMCoreData.ZQTransactionBReconciled.AsInteger := tblBatchBReconciled.AsInteger;
    ADMCoreData.ZQTransaction.Post;
    TransID:=ADMCoreData.ZQTransactionWTransactionID.Value;
    BatchCtrlID := ADMCoreData.ZQTransactionWBatchID.Value;

    ADMCoreData.ZQOILinks.SQL.Text := 'select * from OILinks where WBatchID= :WBatchID aND WLinkTransactionID = :WLinkTransactionID ' ;
    ADMCoreData.ZQOILinks.ParamByName('WBatchID').AsInteger := BatchCtrlID ;
    ADMCoreData.ZQOILinks.ParamByName('WLinkTransactionID').AsInteger := tblBatchWlineID.AsInteger ;
    ADMCoreData.ZQOILinks.open ;

  //  ShowMessage('Verwerken regel ' + tblBatchWlineID.AsString );
    if tblBatchBLINKED.AsInteger = 1 then
       begin
        ADMCoreData.ZQOILINKSPRE.close ;
        ADMCoreData.ZQOILINKSPRE.Params[0].AsInteger := BatchCtrlID ;
        ADMCoreData.ZQOILINKSPRE.Params[1].AsInteger := tblBatchWlineID.AsInteger ;
        ADMCoreData.ZQOILINKSPRE.open ;
        while not   ADMCoreData.ZQOILINKSPRE.IsEmpty do
             begin
             //  ShowMessage('Link  ' + FloatToStr(ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat) );


              DMTCCoreLink.ExecSql('update transact set  FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT - ' +  TDatabaseTableRoutines.GetFirebirdsSqlForFloat(ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat) +' where WTRANSACTIONID=' + IntToStr(ADMCoreData.ZQOILINKSPREWTRANSACTIONID.AsInteger) );


              ADMCoreData.ZQTransaction.Edit;
              ADMCoreData.ZQTransactionFOutStandingAmount.Value := fixAmt(ADMCoreData.ZQTransactionFOutStandingAmount.Value
               +  ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat,DecPlace) ;
              ADMCoreData.ZQTransaction.Post;




              if ADMCoreData.ZQOILinks.Locate('WAMOUNTTRANSACTIONID',ADMCoreData.ZQOILINKSPREWTRANSACTIONID.AsInteger,[]) then
              begin
                ADMCoreData.ZQOILinks.Edit;
                ADMCoreData.ZQOILinksWbatchID.Value:=-1;
                ADMCoreData.ZQOILinksWLinkTransactionID.Value := TransID;
                if ADMCoreData.ZQOILinksWLINKEDAMOUNT.AsFloat <> ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat then
                   ADMCoreData.ZQOILinksWLINKEDAMOUNT.AsFloat := ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat ;
                ADMCoreData.ZQOILinks.Post ;
              end;
              if not ADMCoreData.ZQOILINKSPRE.IsEmpty then
              ADMCoreData.ZQOILINKSPRE.delete ;
           end;
       end;
 if ADMCoreData.ZQOILinks.Active then
    ADMCoreData.ZQOILinks.first ;
    while not ADMCoreData.ZQOILinks.eof do
       begin
          if  ADMCoreData.ZQOILinksWBATCHID.AsInteger = -1  then
           ADMCoreData.ZQOILinks.next else
           ADMCoreData.ZQOILinks.Delete ;
       end;


    if ( dmDatabase.tblBatchWDOCID.AsInteger <>0) then
       begin
     if aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat <> 0 {= aDMCoreData.ZQTransactionFAMOUNT.AsFloat} then
          // look if its payment
       //   if LastLineTot <> 0 then
              begin
                TempTotal :=  - aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat ;
              // if LastLineTot < 0 then
             //  aDMCoreData.ZQTransaction.SQL.Text := 'Select * from transact join account on (Account.WAccountid = transact.Waccountid and WaccountTypeID in (1,2)) where transact.Waccountid = ' +IntToStr( TDataBaseDocumentRoutines.GetAccountOfDocid(tblBatchWDOCID.AsInteger)) + ' and FOUTSTANDINGAMOUNT = ' + FloatToSQLStr(-LastLineTot)
             //  else
               aDMCoreData.ZQTransaction.SQL.Text := 'Select * from transact join account on (Account.WAccountid = transact.Waccountid and WaccountTypeID in (1,2)) where transact.Waccountid = ' +IntToStr( TDataBaseDocumentRoutines.GetAccountOfDocid(tblBatchWDOCID.AsInteger)) + ' and WDOCID = ' + tblBatchWDOCID.asstring + ' and FOUTSTANDINGAMOUNT <> 0 and Wtransactionid <> ' + aDMCoreData.ZQTransactionWTRANSACTIONID.asstring  ;

               aDMCoreData.ZQTransaction.open ;
               if aDMCoreData.ZQTransaction.RecordCount = 1 then
               if (((aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat < 0) and (TempTotal < 0))
                   or ((aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat > 0) and (TempTotal > 0)) ) then
                  begin

                    aDMCoreData.ZQTransaction.Edit ;

                    aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat := aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat -TempTotal  ;
                    aDMCoreData.ZQTransaction.Post ; ;
                    ADMCoreData.ZQOILinks.Insert;
                    ADMCoreData.ZQOILinksWFULLAMOUNT.AsFloat := -TempTotal ;
                    ADMCoreData.ZQOILinksWLINKEDAMOUNT.AsFloat :=  TempTotal ;
                    ADMCoreData.ZQOILinksWACCOUNTID.AsInteger :=   tblBatchWACCOUNTID.AsInteger;
                    ADMCoreData.ZQOILinksWLINKTRANSACTIONID.AsInteger :=  TransID;
                    ADMCoreData.ZQOILinkswBatchid.AsInteger := -1 ;
                    ADMCoreData.ZQOILinksWAMOUNTTRANSACTIONID.AsInteger := aDMCoreData.ZQTransactionWTRANSACTIONID.AsInteger ;
                    ADMCoreData.ZQOILinks.post ;
                    aDMCoreData.ZQTransaction.SQL.Text := 'Select * from transact where WTRANSACTIONID = ' + IntToStr(TransID);
                    aDMCoreData.ZQTransaction.open ;
                     if not aDMCoreData.ZQTransaction.IsEmpty then
                    begin
                     aDMCoreData.ZQTransaction.Edit ;
                     aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat :=  aDMCoreData.ZQTransactionFOUTSTANDINGAMOUNT.AsFloat + TempTotal ;
                     aDMCoreData.ZQTransaction.Post ;
                    end;
                  end;
             end ;
       end;
    ADMCoreData.ZQOILinks.close ;
    //close the files
    ADMCoreData.ZQBatchControl.Close ;
    ADMCoreData.ZQTransaction.Close;
    lrPostBatchLine := True;
  end;
  // see if this is a doc id and link off if its open


  // link bank import
   // if TDataBaseRoutines.GetAccountType(AcctID) = 3 then
   if dmDatabase.tblBatchWLINEID.AsInteger = dmDatabase.tblBatchWLINKEDID.AsInteger then 
      begin

     dmDatabase.tblBankDnl.sql.text := 'Select * from  DNLBANKS where WBankID=' + IntToStr(TDataBaseRoutines.GetContraAccountFromBatchId(BatchTypeID)) + ' and  WTCTRANSID is null ' +
     ' and SReference = ' + QuotedStr(dmDatabase.tblBatchSReference.asstring)+ '  and WLineID =' + IntToStr(dmDatabase.tblBatchWLineID.asinteger) ;
     dmDatabase.tblBankDnl.open ;
     if not dmDatabase.tblBankDnl.IsEmpty then
       begin
         try
          dmDatabase.tblBankDnl.edit ;
          dmDatabase.tblBankDnlWTCTRANSID.AsInteger :=  TransID ;
          dmDatabase.tblBankDnl.post;
         except
          // Dont handel
         end;
       end;
     dmDatabase.tblBankDnl.close ;
   end;

end;

function GetAccountCodeWithTypePrefixFromAccountId(AAccountId : Integer):String ;
var
 AQuery : TuniQuery ;
begin
 result := '';
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := dmDatabase.ZMainconnection ;
     AQuery.SQL.Text := 'select WAccountTypeId,SMainAccountCode|| SSubAccountCode From Account where WAccountId =' + InttoStr(AAccountId);
     AQuery.open ;
     if not AQuery.IsEmpty then
     result := AccType2Char(AQuery.fields[0].AsInteger)+AQuery.fields[1].AsString ;

   finally
     AQuery.free ;
   end;
end;


Function  LrPostInternalBatch(aUser,BatchTypeID:Integer;Bimported:Boolean;aAlias:String;Var aTransID:integer;DocId : Integer):integer;
Var
  {This Create a new batch control and post it}
  Ok:Boolean;
  Tmp,tmp2:Integer;
  aSaveClientDatasetCallList : TSaveClientDatasetCallList ;
  ADMCoreData : TDMCoreData ;
begin
  ADMCoreData := TDMCoreData.Create(nil) ;
  try
  aSaveClientDatasetCallList := TSaveClientDatasetCallList.create ;
  try
  aSaveClientDatasetCallList.AddclientObject(dmDatabase.tblUser,true);

    Result:=0;{Posted Correctly}
    //if not DoesBatchBalance then
     // begin Result:=-2;Exit; End;
    With dmDatabase do
    begin
      //Write the new batch ID
      ADMCoreData.ZQBatchControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl') ;
      ADMCoreData.ZQBatchControl.Open;
      ADMCoreData.ZQBatchControl.Append;
      ADMCoreData.ZQBatchControlWUserID.Value := aUser;
      ADMCoreData.ZQBatchControlWBatchTypeID.Value := BatchTypeID;
      tmp2 := ADMCoreData.ZQBatchControlWBATCHID.AsInteger ;
      tblUser.Open;
      if ReadNwReportOp('BUseGeneralNumber','false').Asboolean then
         dmDatabase.tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
     dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);
     // tblUser.Locate('WUserID', aUser, []);
      tblUser.Edit;
      ADMCoreData.ZQBatchControlSBatchNumber.Value := dmDatabase.tblUserSNextBatchNumber.Value;
      tblUser.Edit;
      tblUsersNextBatchNumber.Value := _IncrementString(dmDatabase.tblUsersNextBatchNumber.Value);
      tblUser.Post;
      ADMCoreData.ZQBatchControlBPosted.Value := 1;
      ADMCoreData.ZQBatchControlBImported.Value := ord(Bimported);
      ADMCoreData.ZQBatchControlSAlias.Value := aAlias;
      ADMCoreData.ZQBatchControl.Post;
      //post the batch
      tblBatch.First;
      Ok:=true;
      aTransID:=-1;
      while (not tblBatch.EOF) And Ok do
      begin
        {I Must Check if some thing is wrong to Reverse and
          Keep Tb and Ledger in Balance ???}
        Ok := LrPostBatchLine(ADMCoreData,BatchTypeID,tmp,tmp2,DocId);
        if Not Ok then
          Result := 2;
        if aTransID<=0 then aTransID:=tmp;  
        tblBatch.Next;
      end;
      DMTCCoreLink.ExecSql('Delete from oilinks where (Unused1 = -2 or Unused1 = -1) and WBatchid =  ' + IntToStr(tmp2));
      // Update OILInks


      DMTCCoreLink.HandelCheckBatchDiv(tmp2);



    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 3 then
      begin
         DMTCCoreLink.LogAction('POSTBATIN',tmp2,'Post internal batch!');
      end;
    end;
   finally
      aSaveClientDatasetCallList.Free ;
   end;
  finally
     ADMCoreData.free ;
  end;
end;

Function LrPostNewBatch(aUser,BatchTypeID:Integer;TryAutoLink : Boolean;DocId : Integer;UseBatchCtrlID : Boolean = false ):Integer;
Var
  {This Create a new batch control and post the current batch dataset}
  Tmp,LastBatControl:Integer;
  aSaveClientDatasetCallList : TSaveClientDatasetCallList ;
  ADMCoreData : TDMCoreData ;
  DefCostId : Integer ;
begin
  DefCostId := DMTCCoreLink.ReadNwReportOp(IntToStr(BatchTypeID) + 'DefCostCen',0) ;
  tmp  := 0 ;
  ADMCoreData := TDMCoreData.Create(nil) ;
  try
  aSaveClientDatasetCallList := TSaveClientDatasetCallList.create ;
  try
  aSaveClientDatasetCallList.AddclientObject(dmDatabase.tblUser,true);
  // these are used in the post batch line so we hold them here
  aSaveClientDatasetCallList.AddclientObject(dmDatabase.tblTax,true);
    Result:=-1;{Posted Correctly}
    //if not DoesBatchBalance then
     // begin Result:=-2;Exit; End;
    With dmDatabase do
    begin
      //Write the new batch ID

      ADMCoreData.ZQBatchControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl') ;
      ADMCoreData.ZQBatchControl.Open;
      if not UseBatchCtrlID then
      LastBatControl := ADMCoreData.AppendBatchControlId(aUser,currentUser,BatchTypeID,1,0)
      else
      LastBatControl  := BatchCtrlID ;
      BatchCtrlID := LastBatControl ;
      //post the batch
      tblBatch.First;
      while not tblBatch.EOF do
      begin
        {I Must Check if some thing is wrong to Reverse and
          Keep Tb and Ledger in Balance ???}
        dmDatabase.qGenII.SQL.Text := 'update transact set FoutstandingAmount = :Amount where WTransactionID =:TransID';
        if TryAutoLink then
          if  dmDatabase.tblBatchWLINEID.AsInteger = dmDatabase.tblBatchWLINKEDID.AsInteger then
          begin
           dmDatabase.qGen.SQL.Text := 'Select transact.* FROM transact , account where Transact.WaccountID = Account.WAccountid and Account.WAccountTypeId in (1,2) ';
           dmDatabase.qGen.SQL.Add(' and Transact.FOutstandingAmount = ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(-dmDatabase.tblBatchFAmount.AsFloat) )  ;
           dmDatabase.qGen.SQL.Add(' and Transact.waccountid = ' +  IntToStr(dmDatabase.tblBatchWACCOUNTID.AsInteger));
           dmDatabase.qGen.SQL.Add(' order by ddate ');
           dmDatabase.qGen.open ;
             if dmDatabase.qGen.isempty then
           begin

            if tblBatchSReference.AsString <> '' then
             begin
           dmDatabase.qGen.SQL.Text := 'Select transact.* FROM transact , account where Transact.WaccountID = Account.WAccountid and Account.WAccountTypeId in (1,2) and Transact.SReference = ' + QuotedStr(tblBatchSReference.AsString) +' and Transact.FOutstandingAmount <> 0';
           if dmDatabase.tblBatchFAmount.AsFloat > 0 then
             dmDatabase.qGen.SQL.Add(' and famount < 0 ')
             else
             dmDatabase.qGen.SQL.Add(' and famount > 0 ') ;
              dmDatabase.qGen.SQL.Add(' and Transact.waccountid = ' +  IntToStr(dmDatabase.tblBatchWACCOUNTID.AsInteger));

             dmDatabase.qGen.open ;
            end;
           end;

 

           if not dmDatabase.qGen.isempty then
           if dmDatabase.qGen.FieldByName('FOutstandingAmount').AsFloat = - dmDatabase.tblBatchFAmount.AsFloat then
           begin
              UpDateOutStanding(dmDatabase.qGen.FieldByName('WtransactionID').AsInteger,dmDatabase.qGen.FieldByName('FOutstandingAmount').Asfloat  + dmDatabase.tblBatchFAmount.AsFloat);
              ADMCoreData.ZQOILinks.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyOILinks') ;
              dmDatabase.ZQOILinks.open  ;
              dmDatabase.ZQOILinks.Append;
              dmDatabase.ZQOILinksWAccountID.Value:= dmDatabase.tblBatchWaccountId.AsInteger;
              dmDatabase.ZQOILinksWAmountTransactionID.Value:= dmDatabase.qGen.FieldByName('WtransactionID').AsInteger ;
              dmDatabase.ZQOILinksWFullAmount.Value:= FixAmount(dmDatabase.qGen.FieldByName('FAmount').Asfloat);
              dmDatabase.ZQOILinksWOutStandingAmount.Value:=FixAmount(dmDatabase.qGen.FieldByName('FOutstandingAmount').Asfloat  + dmDatabase.tblBatchFAmount.AsFloat);
              dmDatabase.ZQOILinksDDate.Value:= dmDatabase.tblBatchDDate.AsdateTime ;
              dmDatabase.ZQOILinksDDocDate.Value := dmDatabase.tblBatchDDate.AsdateTime ;
              dmDatabase.ZQOILinksUnUsed1.Value :=-2;
              dmDatabase.ZQOILinksWUserID.Value := CurrentUser;
              dmDatabase.ZQOILinksWLinkedAmount.Value:= -dmDatabase.tblBatchFAmount.AsFloat;
              dmDatabase.ZQOILinksSReference.value :=dmDatabase.tblBatchSReference.AsString;
              dmDatabase.ZQOILinksSLinkedReference.value :=  dmDatabase.tblBatchSReference.AsString;
              dmDatabase.ZQOILinksWBatchID.value := LastBatControl;
              dmDatabase.ZQOILinksWTaxID.value := 0;
              dmDatabase.ZQOILinksWLinkTransactionID.Value := dmDatabase.tblBatchWLineID.AsInteger;
              dmDatabase.ZQOILinks.Post;
           end;
           dmDatabase.qGen.close ;
          end;
        LrPostBatchLine(ADMCoreData,BatchTypeID,tmp,LastBatControl,DocId,false,false,DefCostId);
        tblBatch.Next;
      end;

      DMTCCoreLink.HandelCheckBatchDiv(LastBatControl);


      DMTCCoreLink.ExecSql('Delete from oilinks where (Unused1 = -2 or Unused1 = -1) and WBatchid =  ' + IntToStr(LastBatControl));
     // tblSysVars.Close;


    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 3 then
      begin
         DMTCCoreLink.LogAction('POSTBATCH',LastBatControl,'Post batch!');
      end;

    end;
   finally
      aSaveClientDatasetCallList.Free ;
   end;
   finally
      ADMCoreData.free ;
   end;
end;


function  LrGetAccountTotal (Var aAccRec:TAccountRec; WPeriodID, Switch : Integer) : Real;
begin
  result := GetAccountTotal(aAccRec.WAccountID, WPeriodID, Switch);
end;

function LrGetControlAccountID(AccControlID: integer) : integer;
{Written by Philip}
{Added Moved in This Unit And Renamed By Sylvain}
{ This procedure will get the Control AccountID from the Sysvars file
0 returns an error unable to open Sysvars file
1 Debtors control Account
2 Creditors Control Account
3 retained Earnings Account   }

begin
  result := 0;
  if AccControlID = 1 then
    Result  := dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount ;
  if AccControlID = 2 then
    Result  := dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount ;
  if AccControlID = 3 then
    Result  := dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ;
end;

            



Procedure UnlinkTransaction(AFromLink:integer);
//var
//  aSaveClientDatasetCallList : TSaveClientDatasetCallList ;
begin
TDataBaseLedgerRoutines.ClearLink([AFromLink]);
  // todo : SQLOPTIMIZE
 { aSaveClientDatasetCallList := TSaveClientDatasetCallList.create ;
  try
  aSaveClientDatasetCallList.AddclientObject(dmDatabase.tblTransaction,true);
  aSaveClientDatasetCallList.AddclientObject(dmDatabase.tblOILinks,true);
  dmDatabase.tblTransaction.Filtered:=False;
  dmDatabase.tblTransaction.Open;
  dmDatabase.tblOILinks.DisableControls;
  dmDatabase.tblOILinks.Filtered:=False;
  dmDatabase.tblOILinks.Open;
  // Delete batch Line link if exists
  While dmDatabase.tblOILinks.Locate('WLinkTransactionID', AFromLink,[]) do
  begin
    if dmDatabase.tblTransaction.Locate('WTransactionID',dmDatabase.tblOILinksWAmountTransactionID.asinteger,[]) then
    begin
    // Clear link and Update OutStanding
       dmDatabase.tblTransaction.Edit;
       dmDatabase.tblTransactionFOutStandingAmount.Value := dmDatabase.tblTransactionFOutStandingAmount.Value + dmDatabase.tblOILinksWLinkedAmount.Value;
       // one thing we dont want is to out balanse the links (i have seen this)
       if dmDatabase.tblTransactionFAmount.AsFloat < 0 then
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end else
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < 0) and (dmDatabase.tblTransactionFAmount.AsFloat > 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > 0) and (dmDatabase.tblTransactionFAmount.AsFloat < 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       dmDatabase.tblTransaction.Post;
    end;
    if dmDatabase.tblTransaction.Locate('WTransactionID',AFromLink,[]) then
    begin
    // Clear link and Update OutStanding
       dmDatabase.tblTransaction.Edit;
       dmDatabase.tblTransactionFOutStandingAmount.Value := dmDatabase.tblTransactionFOutStandingAmount.Value + dmDatabase.tblOILinksWLinkedAmount.Value;
       // one thing we dont want is to out balanse the links (i have seen this)
       if dmDatabase.tblTransactionFAmount.AsFloat < 0 then
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end else
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < 0) and (dmDatabase.tblTransactionFAmount.AsFloat > 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > 0) and (dmDatabase.tblTransactionFAmount.AsFloat < 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       dmDatabase.tblTransaction.Post;
    end;
    // Delete this Link
    dmDatabase.tblOILinks.Delete;
  end;
  While dmDatabase.tblOILinks.Locate('WAmountTransactionID',AFromLink,[]) do
  begin
    if dmDatabase.tblTransaction.Locate('WTransactionID',dmDatabase.tblOILinksWLinkTransactionID.asinteger,[]) then
    begin
    // Clear link and Update OutStanding
       dmDatabase.tblTransaction.Edit;
       dmDatabase.tblTransactionFOutStandingAmount.Value := dmDatabase.tblTransactionFOutStandingAmount.Value + dmDatabase.tblOILinksWLinkedAmount.Value;
       // one thing we dont want is to out balanse the links (i have seen this)
       if dmDatabase.tblTransactionFAmount.AsFloat < 0 then
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end else
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end;
      if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < 0) and (dmDatabase.tblTransactionFAmount.AsFloat > 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > 0) and (dmDatabase.tblTransactionFAmount.AsFloat < 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       dmDatabase.tblTransaction.Post;
    end;
    if dmDatabase.tblTransaction.Locate('WTransactionID',AFromLink,[]) then
    begin
    // Clear link and Update OutStanding
       dmDatabase.tblTransaction.Edit;
       dmDatabase.tblTransactionFOutStandingAmount.Value := dmDatabase.tblTransactionFOutStandingAmount.Value + dmDatabase.tblOILinksWLinkedAmount.Value;
       // one thing we dont want is to out balanse the links (i have seen this)
       if dmDatabase.tblTransactionFAmount.AsFloat < 0 then
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end else
          begin
             if (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > dmDatabase.tblTransactionFAmount.AsFloat) then
                 dmDatabase.tblTransactionFOutStandingAmount.AsFloat := dmDatabase.tblTransactionFAmount.AsFloat ;
          end;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat < 0) and (dmDatabase.tblTransactionFAmount.AsFloat > 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       if  (dmDatabase.tblTransactionFOutStandingAmount.AsFloat > 0) and (dmDatabase.tblTransactionFAmount.AsFloat < 0) then
              dmDatabase.tblTransactionFOutStandingAmount.AsFloat := - dmDatabase.tblTransactionFOutStandingAmount.AsFloat ;
       dmDatabase.tblTransaction.Post;
    end;
    // Delete this Link
    dmDatabase.tblOILinks.Delete;
  end;
  finally
     aSaveClientDatasetCallList.free ;
  end;      }
end;

Procedure linkTransaction(AFromLink,AToLink,AAccount:integer;LinkAmount : Double);
  var
   aCount : Integer ;
begin
aCount := OpenSqlAndGetFirtsColumnValue('select count(*) from OILinks where WLinkTransactionID=' + IntToStr(AToLink) +' and ' + 'WAmountTransactionID='+ IntToStr(AFromLink) ) ;

if aCount = 0 then
   begin
       DMTCCoreLink.ExecSql('Insert into OiLinks (WOILINKSID,SReference,WAmountTransactionID,WLinkedAmount,WLinkTransactionID,DDATE,WACCOUNTID,Wbatchid  ) values( '+ DMTCCoreLink.GetGenUniSyntaxShort('GEN_OILINKS_ID')+','+
        QuotedStr('Link') +',' + IntToStr(AFromLink) + ','+ StringReplace(FormatFloat('######0.######',LinkAmount),DecimalSeparator,'.',[rfReplaceAll])+
        ',' + IntToStr(AToLink)+',CURRENT_TIMESTAMP,' + IntToStr(AAccount)+',-1)') ;
   end else if aCount =1 then
   begin
            ExecSql('update OiLinks set Wbatchid = -1, WLinkedAmount = ' + StringReplace(FormatFloat('######0.######',LinkAmount),DecimalSeparator,'.',[rfReplaceAll])+ ' where WLinkTransactionID=' + IntToStr(AToLink) +' and ' + 'WAmountTransactionID='+ IntToStr(AFromLink) ) ;

   end else
   begin
     DMTCCoreLink.ExecSql('delete from OILinks where WLinkTransactionID=' + IntToStr(AToLink) +' and ' + 'WAmountTransactionID='+ IntToStr(AFromLink) ) ;
     DMTCCoreLink.ExecSql('Insert into OiLinks (WOILINKSID,SReference,WAmountTransactionID,WLinkedAmount,WLinkTransactionID,DDATE,WACCOUNTID,Wbatchid  ) values( '+ DMTCCoreLink.GetGenUniSyntaxShort('GEN_OILINKS_ID')+','+
        QuotedStr('Link') +',' + IntToStr(AFromLink) + ','+ StringReplace(FormatFloat('######0.######',LinkAmount),DecimalSeparator,'.',[rfReplaceAll])+
        ',' + IntToStr(AToLink)+',CURRENT_TIMESTAMP,' + IntToStr(AAccount)+',-1)') ;
   end;
end;


Procedure AutolinkTransaction(AFromLink,AToLink : Integer);
var
  FrDate :TDate;
  AcctID,

  TaxID   : Integer;
  FromRef,
  ToRef    : String;

  ToOutAmt,
  LinkAmount  : Double;

begin



    FromID := AFromLink;
    ToID   := AToLink;

    dmDatabase.ZQTransAction.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('database_TransactOnTransactID') ;
    dmDatabase.ZQTransAction.ParamByName('WTransactionID').AsInteger := ToID ;
    dmDatabase.ZQTransAction.Open;
     LinkAmount:= dmDatabase.ZQTransActionFOutstandingAmount.Value;


    dmDatabase.ZQTransAction.Close;
    dmDatabase.ZQTransAction.ParamByName('WTransactionID').AsInteger := ToID ;
    dmDatabase.ZQTransAction.Open;
    dmDatabase.ZQTransAction.Edit;
    dmDatabase.ZQTransActionFOutstandingAmount.Value := FixAmount(dmDatabase.ZQTransActionFOutstandingAmount.Value - LinkAmount,2);
    dmDatabase.ZQTransActionBUnused.value:=0;
    dmDatabase.ZQTransAction.Post;

    FrDate := dmDatabase.ZQTransActionDDate.Value;
    ToOutAmt:=dmDatabase.ZQTransActionFOutstandingAmount.Value;

    ToRef:=dmDatabase.ZQTransActionSreference.Value;
    dmDatabase.ZQTransAction.close ;
    dmDatabase.ZQTransAction.ParamByName('WTransactionID').AsInteger := FromID ;
    dmDatabase.ZQTransAction.Open;

    dmDatabase.ZQTransAction.Edit;
    dmDatabase.ZQTransActionFOutstandingAmount.Value := FixAmount(dmDatabase.ZQTransActionFOutstandingAmount.Value + LinkAmount,2);
    {Clear Selection}
    dmDatabase.ZQTransActionBUnused.value:=0;
    dmDatabase.ZQTransAction.Post;

    FromRef:=dmDatabase.ZQTransActionSreference.Value;
    AcctID:=dmDatabase.ZQTransActionWAccountID.Value;
    TaxID:=dmDatabase.ZQTransActionWTaxAccountID.Value;
    // Allocate Open Item
    dmDatabase.ZQOILinks.DisableControls;
    try
    dmDatabase.ZQOILinks.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_OILinksOnAccLinkedandBatchTrans');
    dmDatabase.ZQOILinks.ParamByName('WAccountID').AsInteger := AcctID ;
    dmDatabase.ZQOILinks.ParamByName('WAmountTransactionID').AsInteger :=  FromID ;
    dmDatabase.ZQOILinks.ParamByName('WLinkTransactionID').AsInteger :=   ToID ;
    dmDatabase.ZQOILinks.Open;

      if not dmDatabase.ZQOILinks.IsEmpty then
        dmDatabase.ZQOILinks.Edit
      else
        dmDatabase.ZQOILinks.Append;
      dmDatabase.ZQOILinksDDate.Value := dmDatabase.ZQTransActionDDate.Value;
      dmDatabase.ZQOILinksDDocDate.Value := FrDate;
      dmDatabase.ZQOILinksWOutStandingAmount.Value := ToOutAmt;
      dmDatabase.ZQOILinksWlinkedAmount.Value := dmDatabase.ZQOILinksWlinkedAmount.Value + LinkAmount;

      dmDatabase.ZQOILinksWLinkTransactionID.Value := ToID;
      dmDatabase.ZQOILinksWAmountTransactionID.Value := FromID;
      dmDatabase.ZQOILinksWBATCHID.AsInteger :=  dmDatabase.ZQTransActionWBATCHID.AsInteger ;
      dmDatabase.ZQOILinksSReference.Value := FromRef;
      dmDatabase.ZQOILinksSlinkedReference.Value := ToRef;
      dmDatabase.ZQOILinksWAccountID.Value := AcctID;
      dmDatabase.ZQOILinksWTaxID.value := TaxID;
      dmDatabase.ZQOILinks.Post;
    dmDatabase.ZQOILinks.Close;
    finally
    dmDatabase.ZQOILinks.EnableControls;
    end;
end;

function  GetUnlinkTotalFromDoc(ADocID : Integer ) : Double ;
Var
 VarResult : Variant ;
begin
   dmDatabase.SQLList.ParamsList.Values['DOCID'] := IntToStr(ADocID) ;
   result  := 0 ;
   VarResult := OpenSqlAndGetFirtsColumnValue(dmDatabase.SQLList.GetFormatedSQLByName('database_OpenAmountOnDocId'));
   if not VarIsNull(VarResult) then

      result := RoundAmount(VarResult) ;
end;

Procedure UnlinkLine(aBatLinkedID,aBatchCtrlID:integer);
 var
  AProgress : TfmNewProgress ;
begin
   //
   // manual remove

  // todo : WORKINPROGRESS
   TDataBaseLedgerRoutines.Unlinkline(aBatLinkedID,aBatchCtrlID) ;
   exit ;

  AProgress := TfmNewProgress.create(nil) ;
  try

  dmDatabase.ZQTransAction.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_TransactOnTransactID');

  dmDatabase.ZQOILinks.Filter := '' ;
  dmDatabase.ZQOILinks.SQL.Text := 'Select OILinks.*,Messages.* from OILinks  join transact on OILinks.WAmountTransactionID = ' +
  ' transact.WtransactionID join messages on (transact.WDescriptionId = Messages.WMessageId)  ' +
  ' where OILinks.WBatchID = :WBatchID and '+
  ' OILinks.WLinkTransactionID =:WLinkTransactionID';

  dmDatabase.ZQOILinks.ParamByName('WBatchID').AsInteger :=     aBatchCtrlID ;
  dmDatabase.ZQOILinks.ParamByName('WLinkTransactionID').AsInteger := aBatLinkedID;
  dmDatabase.ZQOILinks.open ;
  dmDatabase.ZQOILinks.last ;
  dmDatabase.ZQOILinks.first ;
  AProgress.initProgress('Clearing link',dmDatabase.ZQOILinks.RecordCount);
  // Delete batch Line link if exists

  While not dmDatabase.ZQOILinks.IsEmpty do
  begin
    AProgress.SetProgress('',dmDatabase.ZQOILinks.RecNo);
    dmDatabase.ZQTransAction.Close ;
    dmDatabase.ZQTransAction.ParamByName('WTransactionID').AsInteger := dmDatabase.ZQOILinksWAmountTransactionID.AsInteger ;
    dmDatabase.ZQTransAction.open ;

    if not dmDatabase.ZQTransAction.IsEmpty then
    begin
    // Clear link and Update OutStanding
       dmDatabase.ZQTransAction.Edit;
       if dmDatabase.ZQTransactionFAmount.AsFloat > 0 then
       dmDatabase.ZQTransActionFOutStandingAmount.Value := dmDatabase.ZQTransActionFOutStandingAmount.Value + abs(dmDatabase.ZQOILinksWLinkedAmount.Value)
       else
       dmDatabase.ZQTransActionFOutStandingAmount.Value := dmDatabase.ZQTransActionFOutStandingAmount.Value - abs(dmDatabase.ZQOILinksWLinkedAmount.Value) ;

       dmDatabase.ZQTransaction.Post;
    end;
    // Delete this Link
    dmDatabase.ZQOILinks.Delete;
  end;
  finally
  AProgress.free ;
  end;
end;



function ValidateBatch(aDMCoreData : TDMCoreData) : Integer;
{
  Add By Sylvain
  This function Must be called only from Batch entry;
  Check to see that all the batch lines have
  the minimum required info for a transaction
  and that its within the right periods.

}
var
  StartDate,
  EndDate    : TDateTime;
  BCanNotPostToLastYear,
  Validate ,BIsCashBook,isOpeningbal  : Boolean;
  testPeriodID,
  tmpCount,i,AddDays ,WCashContra ,localBatchid :Integer;
  ckPeriod : Array[0..26] of Boolean;

begin
  result := 0;
  dmDatabase.tblBatch.open ;
  localBatchid:= TDataBaseRoutines.GetBatchIdFromPRocessId(BatchCtrlID) ;

  TDataBaseRoutines.GetBatchInfo(localBatchid, BIsCashBook,WCashContra);
   isOpeningbal :=  DMTCCoreLink.ReadNwReportOp(IntTostr(localBatchid) + 'BOpeningBal',false) ;


  // done : New class to save state of a database so its easy
//  aSaveClientDatasetCallList := TSaveClientDatasetCallList.Create ;

  Validate := True;
  with dmDatabase do
  begin
    //aSaveClientDatasetCallList.AddclientObject(tblBatch,true);
 //   aSaveClientDatasetCallList.AddclientObject(tblPeriods,true);
 //   aSaveClientDatasetCallList.AddclientObject(tblAccount,true);
 //   aSaveClientDatasetCallList.AddclientObject(tbltotals,true);
    tblBatch.Filtered := False;
    tblBatch.Filter := '';
    tblBatch.First;
    BCanNotPostToLastYear := Not CanPostToLastYear;
    While not tblBatch.Eof do
    begin
      if ((dmDatabase.tblBatchFDEBIT.IsNull) and (dmDatabase.tblBatchFCREDIT.IsNull)) or
         ((dmDatabase.tblBatchFDEBIT.value=0) and (dmDatabase.tblBatchFCREDIT.Value=0)) or
         (dmDatabase.tblBatchSACCOUNT.IsNull) or (dmDatabase.tblBatchSACCOUNT.value='') or
         (dmDatabase.tblBatchDDate.IsNull) then
         begin
          // lets not delete when there a amount as the would make input values disapear.
          if (tblBatchFDEBIT.AsFloat - tblBatchFCREDIT.AsFloat) <> 0 then
            begin
              Result:=103;
              SMsgErr := GetTextLang(592)+' ' + tblBatchSDescription.AsString + ' : ' + tblBatchSReference.Value ;
              exit ;
            end;


           // Only if theres no tax account
           if dmDatabase.tblBatchWTAXID.AsInteger = 0 then
             begin

           tmpCount:=tblBatchWlineID.AsInteger;
           // Delete Line Links if exists;
           try
             if StrTOFloatDef(dmDatabase.TblbatchWAccountID.AsString,0)<>0 then
             begin
               UnlinkLine(tmpCount,BatchCtrlID);
             end
           except end;

            tblBatch.Delete;
            end else
            tblBatch.Next;
         end
      else
         tblBatch.Next;
    end;
    tblBatch.Filtered := False;
    tblBatch.Filter := '';


    StartDate := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetLowYear -1 ;
    EndDate := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear ;
    for i:= 0 to dmDatabase.SetOfBooksPropertys.LedgerPeriodes.Count -1 do
    begin
      ckPeriod[dmDatabase.SetOfBooksPropertys.LedgerPeriodes[i].PeriodeId]:= dmDatabase.SetOfBooksPropertys.LedgerPeriodes[i].ShutDown;
    end;
    tblBatch.First;
    while not tblBatch.EOF do
    begin
      if Not Validate then Break;
      //check that the dates are in range
            if  tblBatchWlineID.AsInteger = tblBatchWLINKEDID.AsInteger then
              if (tblBatchWACCOUNTID.AsInteger = tblBatchWCONTRAACCOUNTID.AsInteger) then
            begin
            
             Result:=100;
             SMsgErr := 'Line ' +  tblBatchSREFERENCE.AsString +' ' + tblBatchSDESCRIPTION.AsString  + ' is on the same account as the contra!' ;
             Validate := False;
             Break;
            end;


      if  (dmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger = 0) and (Trim(ZipAccountCode(dmDatabase.tblBatchSCONTRAACCOUNT.AsString)) <> '' ) and (dmDatabase.tblBatchWLINEID.AsInteger = dmDatabase.tblBatchWLINKEDID.AsInteger) then
          begin
            Result:=100;
             SMsgErr := 'Contra accountid not found!'+dmDatabase.tblBatchSCONTRAACCOUNT.AsString +' ' + tblBatchSDescription.AsString + ' : ' + tblBatchSReference.Value ;
             Validate := False;
             Break;
          end;

      if  ((tblBatchDDate.Value < StartDate) and (BCanNotPostToLastYear)) or  (tblBatchDDate.Value > EndDate) then
      begin
        Result:=100;
        SMsgErr := GetTextLang(592)+' ' + IntToStr(tblBatch.RecNo) + ' '+GetTextLang(607)+' : '+ tblBatchSReference.Value + ') : The date specified does not fall into any of this or last year''s periods (' + DateToStr(StartDate) + ' - ' + DateToStr(EndDate) + ').';
        Validate := False;
        Break;
      end;
      {Check if Period opened for post}
      testPeriodID := LrGetPeriod(tblBatchDDate.Value);
      if testPeriodID =-2 then testPeriodID := 0  ;
      if ckPeriod[testPeriodID] then
      begin
        Result:=101;

        SMsgErr := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemFromPeriod(testPeriodID).Description + ' ' + GetTextLang(889)+#13#10+GetTextLang(890)+#13#10 {'This period is Closed for posting'} + tblBatchDDate.AsString;
        Validate := False;
        Break;
      end ;(*
      else
      if BCanNotPostToLastYear And (testPeriodID<=13) then
      begin
        Result:=102;
        SMsgErr := GetTextLang(888)+#13#10+GetTextLang(890)+#13#10 {'Last Year is Closed for posting'} + tblBatchDDate.AsString;
        Validate := False;
      end;  *)
      begin

    // On thing we can have is posting to the main Debtor/ creditor account
    // Im checking here couse i saw some bookings and i need users to give me the batch where tis happens.
    if  (dmDatabase.tblBatchWAccountID.AsInteger in[dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount,dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount]) then
      begin
         Result:=103;
         SMsgErr := 'You can post to a control account!' +' ' + IntToStr(tblBatch.RecNo) + ' '+GetTextLang(607)+' : ' + tblBatchSReference.Value  ;
         Validate := False;
         Break;
      end;


        //check if you're allowed to post to the account specified (this should never happen, due to an earlier check)
       aDMCoreData.ZQAccount.close ;
       aDMCoreData.ZQAccount.ParamByName('WAccountId').AsInteger :=  tblBatchWAccountID.AsInteger ;
       aDMCoreData.ZQAccount.Open;

       if isOpeningbal then
        if  aDMCoreData.ZQAccountBINCOMEEXPENSE.AsInteger = 1 then
          begin
             Result:=100;
             SMsgErr := 'opening balance cannot hold proffit loss accounts!'+dmDatabase.tblBatchSCONTRAACCOUNT.AsString +' ' + tblBatchSDescription.AsString + ' : ' + tblBatchSReference.Value ;
             Validate := False;
             Break;
          end;
        if (Trim(ZipAccountCode(tblBatchSACCOUNT.Value))='') OR (aDMCoreData.ZQAccount.IsEmpty) then
        begin
          Result:=103;
          SMsgErr := GetTextLang(592)+' ' + IntToStr(tblBatch.RecNo) + ' '+GetTextLang(607)+' : ' + tblBatchSReference.Value + ') : The account ' + tblBatchSACCOUNT.Value + ' has been deleted.';
          Validate := False;
          Break;
        end
        else
        begin
         if aDMCoreData.ZQAccountBINACTIVE.AsInteger = 1 then
            begin
             Result := 104 ;
             SMsgErr := GetTextLang(201) + #13+#10 + Trim(GetAccountCodeAndDescription(aDMCoreData.ZQAccountWACCOUNTID.AsInteger)) ;
             Validate := False;
             Break;
            end;
          if aDMCoreData.ZQAccountBSubAccounts.Value =1 then
          begin
            Result:=105;
            SMsgErr := GetTextLang(592)+' ' + IntToStr(tblBatch.RecNo) +' '+GetTextLang(607)+' : '+ tblBatchSReference.Value + ') : The account ' + tblBatchSACCOUNT.Value + ' has sub accounts.';
            Validate := False;
            Break;
          end;
          // Add remittance date
          if aDMCoreData.ZQAccountWACCOUNTTYPEID.AsInteger = 1 then
            begin
              tblBatch.Edit ;
              AddDays := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDueDays from Debtor where Waccountid = ' +  IntToStr(aDMCoreData.ZQAccountWACCOUNTId.Asinteger))),0);
              if AddDays > 0 then
              tblBatchDPAYMENTDATE.AsDateTime := tblBatchDDATE.AsDateTime + AddDays
              else
              tblBatchDPAYMENTDATE.AsDateTime := tblBatchDDATE.AsDateTime ;
              tblBatch.Post ;
            end;
          if aDMCoreData.ZQAccountWACCOUNTTYPEID.AsInteger = 2 then
            begin
              tblBatch.Edit ;
              AddDays := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDueDays from creditor where Waccountid = ' +  IntToStr(aDMCoreData.ZQAccountWACCOUNTId.Asinteger))),0);
              if AddDays > 0 then
              tblBatchDPAYMENTDATE.AsDateTime := tblBatchDDATE.AsDateTime + AddDays
              else
              tblBatchDPAYMENTDATE.AsDateTime := tblBatchDDATE.AsDateTime ;
              tblBatch.Post ;
            end;
          // check if the tax is correct
          if not aDMCoreData.ZQAccountWTAXACCOUNT.isNull then
           if aDMCoreData.ZQAccountWTAXACCOUNT.AsInteger <> tblBatchWTAXID.AsInteger then
            if ReadReportOp('cbStrictTaxRef',false).AsBoolean then
          begin
            Result:=105;
            SMsgErr := GetTextLang(592)+' ' + IntToStr(tblBatch.RecNo) +' '+GetTextLang(607)+' : '+ tblBatchSReference.Value + ') : The account ' + tblBatchSACCOUNT.Value + ' must have tax ' + TDataBaseRoutines.GetAccountCode(aDMCoreData.ZQAccountWTAXACCOUNT.AsInteger);
            Validate := False;
            Break;
          end;

         // Cashbook only accept cashbook and tax as contra.
         if BIsCashBook and (WCashContra <> 0) then
           if tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger then
             if aDMCoreData.ZQAccountWACCOUNTTYPEID.AsInteger <> 4 then
               if aDMCoreData.ZQAccountWACCOUNTID.AsInteger <> WCashContra then
            begin
              Result:=103;
              SMsgErr := IntToStr(tblBatch.RecNo) + ' '+GetTextLang(607)+' : ' + tblBatchSReference.Value + ') : The account ' + tblBatchSACCOUNT.Value + ' is not valide. Contra records can only be a tax account and ' + TDataBaseRoutines.GetAccountDescription(WCashContra) +'.';
              Validate := False;
            end;

      {   aDMCoreData.ZQtotals.Close;
         aDMCoreData.ZQTotals.ParamByName('WAccountId').AsInteger := aDMCoreData.ZQAccountWaccountID.AsInteger ;
         aDMCoreData.ZQtotals.Open;
         tmpCount:=aDMCoreData.ZQTotals.RecordCount;
         if tmpCount=0 then
          // Recreate All Entries in Total Table;
          TDataBaseRoutines.CreateTotalsForAccount(aDMCoreData.ZQAccountWAccountID.Value);}
        end;
      end;
      tblBatch.Next;
    end;
    if Validate then
      tblBatch.First;
   end;   
end;

Procedure RoundBatAmounts;
begin
  With DmDatabase do begin
        // make sure that values are saved with 2 digits.
        // we must save them in the data param format
        // e;se we get tax round errors
    if Not tblBatchFDEBIT.IsNull then // To avoid 0.00 in the batch grid
      tblBatchFDEBIT.Value := FixAmount(tblBatchFDEBIT.Value);
    if Not tblBatchFCREDIT.IsNull then  // To avoid 0.00 in the batch grid
      tblBatchFCREDIT.Value := FixAmount(tblBatchFCREDIT.Value);
    tblBatchFTaxAmount.Value := FixAmount(tblBatchFTaxAmount.Value);
    tblBatchFAmount.Value := FixAmount(tblBatchFAmount.Value);
  end;
end;

Function LrBalanceBatch(Batchname : String ; aDMCoreData: TDMCoreData;BatchType:Integer;DefaultContraAccount:Integer=0;NoTax:Boolean = False):Integer;
{
  Balances the batch (blatantly obvious ,isnt it ?)
}
var
  Total,OriginalTotal,
  Rate,SingleRate,ExcTotal,TaxTotal  : Double;
  Contra,
  Tax ,DefaultContraText    :String;
  TempTaxAccID,TempAccID,
  TempAccTypeID,
  DueAccountID,
  BatLinkedID,
  TmpIntVal ,LastTaxId,LastContraAccountId, LastLineId,LastGroup1id,LastGroup2Id  : Integer;
  MyTotalRecs,MyRecNo :LongInt;
  ComTemp     : TStringList;
  aDate        : TDateTime;
  PlTax       :Byte;
  TmpCr,TmpDb,
  BShowMessPymtsBased,
  Ok          : Boolean;
  OldPos      : LongInt;
  HighID,LastID,ProjectID : Integer ;
  SavePlace   : TBookMark;
  localBatchname:String;
  SaveDesc,ContraRef : String;
  AOldBeforePost : TDataSetNotifyEvent ;
  Exclusive : Boolean ;
  {I Should Read Consolidate inside this routine than passing as param}
  Consolidate : Boolean;
   aSaveClientDatasetCallList : TSaveClientDatasetCallList ;
   aProgress : TfmNewProgress ;
   Const
  PRef='######';

begin
  DueAccountID := 0 ;
  aProgress := TfmNewProgress.create(nil) ;
  try
  dmDatabase.tblBatch.open ;
  dmDatabase.tblBatch.disableControls ;
  try
  dmDatabase.tblBatch.IndexFieldNames := 'WLineID' ;
 if (dmDatabase.tblbatch.State in [dsedit,dsinsert]) then
     dmDatabase.tblbatch.post ;
   AOldBeforePost := dmDatabase.tblBatch.BeforePost ;
   try
   dmDatabase.tblBatch.BeforePost := nil ;

  if DefaultContraAccount <> 0  then
    begin
      DefaultContraText := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(DefaultContraAccount);
    end;

// added by sylvain
    BShowMessPymtsBased:=True;
    aDMCoreData.ZQBatchTypes.sql.text :=  'select * from battypes where  WBatchTypeID = ' + IntToStr(BatchType) ;
    aDMCoreData.ZQBatchTypes.open ;
    if aDMCoreData.ZQBatchTypes.IsEmpty then raise Exception.Create('Batchid:' +  IntToStr(BatchType) + ' Not found');

    localBatchName := aDMCoreData.ZQBatchTypesSdescription.AsString;
    Consolidate := aDMCoreData.ZQBatchTypesBConsolidateBalancing.AsInteger = 1;

    TmpCr:=dmDatabase.tblBatchFCREDIT.ReadOnly;
    TmpDb:=dmDatabase.tblBatchFDEBIT.ReadOnly;
    dmDatabase.tblBatchFCREDIT.ReadOnly:=False;
    dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
    aProgress.initProgress(gettextlang(1997),0);
    //first delete out the lines with **********
    dmDatabase.tblBatch.Filtered := False;
    dmDatabase.tblBatch.Filter := '';
    ContraRef := '********' ;
    DmDatabase.tblBatch.First ;

    While not DmDatabase.tblBatch.Eof do
    begin
      if DmDatabase.tblBatchWLINEID.AsInteger <> DmDatabase.tblBatchWLINKEDID.AsInteger then
         DmDatabase.tblBatch.Delete
      else
       begin

         if DefaultContraAccount <> 0 then
           begin
             DmDatabase.tblBatch.Edit ;
             DmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger := DefaultContraAccount ;
             DmDatabase.tblBatchSCONTRAACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode(DefaultContraAccount));
             DmDatabase.tblBatch.Post ;
           end;
         if NoTax  then
           begin
             DmDatabase.tblBatch.Edit ;
             DmDatabase.tblBatchWTAXID.AsInteger := 0 ;
             DmDatabase.tblBatchSTAX.AsString := '';
             DmDatabase.tblBatch.Post ;
           end;
         DmDatabase.tblBatch.Next;
       end;
    end;


  DmDatabase.tblBatch.Close ;
  ExecSql('update ' + DmDatabase.tblBatch.TableName + ' Set WlinkedId=WlineId');
  DmDatabase.tblBatch.Open ;
  if DmDatabase.tblBatch.IsEmpty then exit ;
  dmDatabase.tblBatch.Last;
  HighID := dmDatabase.tblBatchWLINEID.AsInteger ;

  dmDatabase.tblBatch.First;
  // Validates all input of the batch
  if ValidateBatch(aDMCoreData)<>0 then
  begin
    Result := 2002;
    Exit;
  end;

  with dmDatabase do
  begin
    begin
      if BPaymentsBased then
      begin
        tblSysVars.Open;
        DueAccountID := tblSysVarswDueAccountID.Value;
        tblSysVars.Close;
        TempTaxAccID:=0;
        aDMCoreData.ZQAccount.Close ;
        aDMCoreData.ZQAccount.ParamByName('WAccountId').AsInteger := DueAccountID ;
        aDMCoreData.ZQAccount.open ;
        if not aDMCoreData.ZQAccount.IsEmpty and (DueAccountID>0) then
          TempTaxAccID:=-1;
        if TempTaxAccID=0 then
        begin
          Result := 2003;
          exit;
        end;
      end;
      tblBatch.Filtered := False;
      tblBatch.Filter := '';
      Ok:=True;
      tblBatch.First;
      PlTax:=1;
      MyTotalRecs:=dmDatabase.tblBatch.RecordCount;
      aProgress.initProgress('',MyTotalRecs);
      //Generate balancing entries
       while (not tblBatch.Eof) and Ok And (tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger) do
        begin
          aProgress.SetProgress(gettextlang(2067)+' '+IntToStr(tblBatch.RecNo)+' / '+IntToStr(MyTotalRecs),tblBatch.RecNo);



          aDate := tblBatchDDate.Value;
          Contra := tblBatchSCONTRAACCOUNT.Value;
          if (Contra = '') and (DefaultContraAccount =0) then
             begin
              tblBatch.next ;
              continue ;
             end;
          if dmDatabase.SetOfBooksPropertys.DataParameter.cbContraISRef then
            ContraRef := tblBatchSREFERENCE.AsString ;

          LastContraAccountId := tblBatchWCONTRAACCOUNTID.AsInteger ;

          LastTaxId := tblBatchWTAXID.AsInteger ;
          LastLineId := tblBatchWLINEID.AsInteger ;
          LastGroup1id := tblBatchWREPORTINGGROUP1ID.AsInteger ;
          LastGroup2Id := tblBatchWREPORTINGGROUP2ID.AsInteger ;
          ProjectID  := StrToIntDef(tblBatchSJOBCODE.AsString,0) ;
          // Set Total amount
          Total:=tblBatchFAmount.Value;
          OriginalTotal := Total ;
          Tax := tblBatchSTAX.AsString;
          Exclusive := tblBatchBExclusive.Value =1;
          SaveDesc := tblBatchSDescription.Value;
          
          //Look up the tax rate

          if Exclusive then
             begin
             Rate := GetTaxRateOnId(LastTaxId,true) ;
             ExcTotal  := tblBatchFAMOUNT.AsFloat
             end
             else
             begin
             // done : Pieter wrong tax rate
             Rate := GetTaxRateOnId(LastTaxId,true) ;
             if Rate <> 2 then
             ExcTotal  := tblBatchFAMOUNT.AsFloat / Rate  else
             ExcTotal := 0 ; 


             end;



          TempAccTypeID := tblBatchWAccountID.Value;
          if (TempAccTypeID=0) then
            raise Exception.create(DMTCCoreLink.GetTextLang( 3068){'Error no account found'});

          TempAccTypeID := aDMCoreData.ZQAccountWaccountTypeID.value;
           // Check Peyment Basis Op
          BatLinkedID:=-1;
          If BPaymentsBased AND (IsCashBook<>0) And (TempAccTypeID in [1,2]) then
          begin
            BatLinkedID:=tblBatchWlineID.AsInteger;
            if BShowMessPymtsBased AND (Tax<>'')  then
            begin
              Result := 2004;
              BShowMessPymtsBased:=False;
            end;
            Tax:='';
          end;
          tempAccID:=0;
          if DefaultContraAccount = 0 then
          begin
           tempAccID := LastContraAccountId ;
           Contra :=    TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(LastContraAccountId) ;
          end;
          if DefaultContraAccount <> 0 then
               begin
                tempAccID := DefaultContraAccount ;
                Contra :=    DefaultContraText ;
                end;

         if Exclusive then
             Total:=  RoundAmount(Total * Rate);
          tblBatch.Edit;


          // Reset Tax Value For Payment Based Methode.
          tblBatchSTAX.Value:=Tax;
          tblBatchFCREDIT.AsString:='';
          tblBatchFDEBIT.AsString:='';
          //Im trying to retain the amount that was put in
          // Som im putting in code to act on the Exclusive
          // it a cashbook
          if(LastTaxId <> 0) AND (IsCashBook<>0) then
          begin
            // Done Calc balance from orignal amount
            if Total < 0 then
             begin
              if Exclusive then
                  tblBatchFCREDIT.AsFloat:=  -OriginalTotal
              else
                  tblBatchFCREDIT.AsFloat:= (-Total ) / Rate;
              end
            else
              begin
               if Exclusive then
                  tblBatchFDEBIT.AsFloat:=  OriginalTotal
              else
                tblBatchFDEBIT.AsFloat:= Total / Rate;

              end;
          end  // end its a cashbook
          else
          Begin
            if Total < 0 then
              tblBatchFCREDIT.AsFloat:= -Total
            else
              tblBatchFDEBIT.AsFloat:= Total;
          end;
          if Tax='' then
            begin
            tblBatchFTaxAmount.Value:= 0;
            end;

          RoundBatAmounts;
          tblBatch.Post;
          TaxTotal := 0 ;
          if tempAccID <> 0 then
          begin

          // Do Tax First.
          if LastTaxId<>0 then
          begin
          lastId := tblBatchWLINEID.AsInteger ;
          aDMCoreData.ZQRTaxRates.close;
          aDMCoreData.ZQRTaxRates.Params[0].AsInteger := LastTaxId ;
          aDMCoreData.ZQRTaxRates.Params[1].AsInteger := LastTaxId ;
          aDMCoreData.ZQRTaxRates.open;


        while not aDMCoreData.ZQRTaxRates.eof do
        begin

          Rate := GetTaxRateOnId(ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger,false);
          if Rate <> 1 then
           begin
            tblBatch.Append;
            tblBatchWLINKEDID.AsInteger := LastLineId ;
            tblBatchWREPORTINGGROUP1ID.AsInteger := LastGroup1id ;
            tblBatchWREPORTINGGROUP2ID.AsInteger := LastGroup2id ;
            tblBatchSJobcode.AsInteger := ProjectID ;
            tblBatchBEXCLUSIVE.AsInteger := 1 ;
            tblBatchSReference.Value := ContraRef;

            if Consolidate then
              tblBatchSDescription.Value := gettextlang(2126)+' ' + localBatchName
            else
              tblBatchSDescription.Value := SaveDesc;

            SaveDesc := tblBatchSDescription.Value;
            tblBatchWAccountID.Value:= ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger;
            tblBatchSACCOUNT.Value := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger) ;
            tblBatchSCONTRAACCOUNT.Value := tblBatchSACCOUNT.Value ;
            tblBatchDDate.Value := aDate;
            tblBatchDAllocatedDate.Value:=aDate;
            tblBatchWAccountID.Value:=ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger;
            If (IsCashBook<>0) then
            Begin
              if (ADmCoreData.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
                 begin
                    if (ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger = LastTaxId) then
                      begin
                      if (ExcTotal *(Rate-1 )) < 0 then
                          tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                         else
                          tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                      end else
                      begin
                      if (ExcTotal *(Rate-1 )) > 0 then
                         tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                         else
                         tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                      end;
                 end else
                 begin
                    if (ExcTotal *(Rate-1 )) > 0 then
                      tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                     else
                      tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                 end;
            end   // end is cashbook
            else
            begin
              if (ADmCoreData.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
                 begin
                    if (ADmCoreData.ZQRTaxRatesWACCOUNTID.AsInteger <> LastTaxId) then
                      begin
                      if (ExcTotal *(Rate-1 )) < 0 then
                          tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                         else
                          tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                      end else
                      begin
                      if (ExcTotal *(Rate-1 )) > 0 then
                         tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                         else
                         tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                      end;
                 end else
                 begin
                 // allow 100% tax
                   if  Rate = 2 then
                     begin
                      if Total < 0 then
                       tblBatchFDEBIT.Value := -Total
                        else
                       tblBatchFCREDIT.Value  := Total ;
                      end else
                      begin
                         if (ExcTotal *(Rate-1 )) < 0 then
                            tblBatchFDEBIT.Value := abs(ExcTotal) *(Rate-1 )
                           else
                            tblBatchFCREDIT.Value := abs(ExcTotal) *(Rate-1 );
                       end;
                 end;
            end; // end not cashbook
               tblBatchFAmount.Value:=tblBatchFDEBIT.Value-tblBatchFCREDIT.Value;
               tblBatchSTAX.Value:='';
               tblBatchWTAXID.AsInteger := 0 ;
               {Added to fix 0.01 diff on trial balance from Batch}
               RoundBatAmounts;
               TaxTotal :=  TaxTotal + tblBatchFDEBIT.Value-tblBatchFCREDIT.Value ;
               tblBatch.Post;
              end ; // end rate <> 1
             aDMCoreData.ZQRTaxRates.Next ;
            end;
            tblBatch.Locate('WLineId',lastId,[]);
          end;
          aDMCoreData.ZQRTaxRates.close;
          // Transfert Tax AMount to Due Account
          // End Redo line and remember variables
          lastId := tblBatchWLINEID.AsInteger ;

          Rate :=  GetTaxRateOnId(tblBatchWTAXID.AsInteger,true);
          SaveDesc := tblBatchSDescription.Value;
          tblBatch.Append;
          tblBatchWLINKEDID.AsInteger := LastLineId ;
          tblBatchWREPORTINGGROUP1ID.AsInteger := LastGroup1id ;
          tblBatchWREPORTINGGROUP2ID.AsInteger := LastGroup2id ;
          tblBatchSJobcode.AsInteger := ProjectID ;
          tblBatchBEXCLUSIVE.AsInteger := 1 ;

          tblBatchSReference.Value := ContraRef;
          tblBatchDDate.Value := aDate;
          tblBatchDAllocatedDate.Value:=aDate;
          if Consolidate then
            tblBatchSDescription.Value := gettextlang(2126)+' ' + LocalBatchName// + UpperCase(fmBatchEntry.Caption)
          else
            tblBatchSDescription.Value := SaveDesc;
          tblBatchSACCOUNT.Value := Contra;
          tblBatchSCONTRAACCOUNT.Value:=Contra;

          tblBatchWTAXID.AsInteger := LastTaxId ;
          tblBatchWAccountID.Value:=TempAccID;
          If (IsCashBook<>0) and (Tax<>'') then
           if Total < 0 then
             tblBatchFDEBIT.Value :=- Total
            else
             tblBatchFCREDIT.Value := Total
          else
          begin
           if  Rate = 2 then
               begin
                if Total < 0 then
                 tblBatchFDEBIT.Value := 0
                  else
                 tblBatchFCREDIT.Value  := 0 ;
                end else
                begin

             if Total < 0 then
                tblBatchFDEBIT.Value := (-Total) / Rate
             else
               tblBatchFCREDIT.Value  := Total / Rate;
             end;
          end;
          tblBatchFAmount.Value:=tblBatchFDEBIT.Value-tblBatchFCREDIT.Value;
          tblBatchSTAX.Value:='';
          if (IsCashBook = 0) then
            begin
               tblBatchWTAXID.AsInteger := LastTaxId ;
               tblBatchSTAX.AsString := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(tblBatchWTAXID.AsInteger) ;
               tblBatchFTAXAMOUNT.AsFloat := TaxTotal;

            end;
          RoundBatAmounts;

          tblBatch.Post;

          tblBatch.Locate('WLineId',lastId,[]);




          If BPaymentsBased AND (IsCashBook<>0) And (TempAccTypeID in [1,2]) then
          begin

            aDMCoreData.ZQOILinks.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectOILinksOnAccBatchLinkID.');
            aDMCoreData.ZQOILinks.ParamByName('WAccountID').AsInteger := tblBatchWaccountID.AsInteger ;
            aDMCoreData.ZQOILinks.ParamByName('WBatchID').AsInteger := BatchCtrlID ;
            aDMCoreData.ZQOILinks.ParamByName('WLinkTransactionID').AsInteger := BatLinkedID ;
            aDMCoreData.ZQOILinks.Open;
            lastId := tblBatchWLINEID.AsInteger ;
            SaveDesc := tblBatchSDescription.Value;

            While not aDMCoreData.ZQOILinks.Eof do
            begin
              if aDMCoreData.ZQOILinksWTAXID.Value>0 then
              begin
                for MyTotalRecs:=0 to 1 do
                begin
                  aDMCoreData.ZQTaxOnId.close ;
                  aDMCoreData.ZQTaxOnId.ParamByName('WAccountId').AsInteger := aDMCoreData.ZQOILinksWTaxID.Value ;
                  aDMCoreData.ZQTaxOnId.open ;
                  Rate := aDMCoreData.ZQTaxOnIdFRATE.AsFloat;
                  Total := aDMCoreData.ZQOILinksWLinkedAmount.Value;
                  tblBatch.Append;
                  tblBatchWLINKEDID.AsInteger := LastLineId ;
                  tblBatchWREPORTINGGROUP1ID.AsInteger := LastGroup1id ;
                  tblBatchWREPORTINGGROUP2ID.AsInteger := LastGroup2id ;
                  tblBatchSJobcode.AsInteger := ProjectID ;
                  tblBatchBEXCLUSIVE.AsInteger := 1 ;
                  tblBatchSReference.Value := ContraRef;
                  if Consolidate then
                   tblBatchSDescription.Value := gettextlang(2126)+' ' + LocalBatchName//+ UpperCase(fmBatchEntry.Caption)
                  else
                   tblBatchSDescription.Value := SaveDesc;
                  tblBatchSCONTRAACCOUNT.Value:=Contra;
                  tblBatchDDate.Value := aDate;
                  tblBatchDAllocatedDate.Value:=aDate;
                  if MyTotalRecs=0 then
                  begin
                    tblBatchSACCOUNT.Value := TDataBaseRoutines.AddDashInAccCode(aDMCoreData.ZQTaxOnIdsACCOUNTCODE.AsString);
                    tblBatchWAccountID.Value:=tblOILinksWTaxID.Value;
                    if Total < 0 then
                      tblBatchFCREDIT.Value := (Total * - 1) - RoundAmount((Total * - 1) / ( 1 + (Rate / 100)))
                    else
                      tblBatchFDEBIT.Value := Total - RoundAmount(Total / ( 1 + (Rate / 100)))
                  end
                  else
                  begin
                    aDMCoreData.ZQAccount.close ;
                    aDMCoreData.ZQAccount.ParamByName('WAccountId').AsInteger := DueAccountID;
                    aDMCoreData.ZQAccount.Open ;
                    tblBatchSACCOUNT.Value := TDataBaseRoutines.AddDashInAccCode(aDMCoreData.ZQAccountSACCOUNTCODE.Value);
                    tblBatchWAccountID.Value:=DueAccountID;
                    if TempAccTypeID=1 then
                      tblBatchFCREDIT.Value := Abs(Total - RoundAmount(Total / ( 1 + (Rate / 100))))
                    else
                      tblBatchFDEBIT.Value := Abs(Total - RoundAmount(Total / ( 1 + (Rate / 100))));
                  end;
                  tblBatchFAmount.Value:=tblBatchFDEBIT.Value-tblBatchFCREDIT.Value;
                  tblBatchSTAX.Value:='';
                  RoundBatAmounts;
                  tblBatch.Post;
                end;
                MyTotalRecs := 1 ;
              end;
              tblOilinks.next;
            end;
           tblBatch.Locate('WLineId',lastId,[]);
          end;
          end; // end contra <> 0
          tblBatch.Next;
         //  stop condition
         if (tblBatch.Eof) OR (tblBatchWLINEID.AsInteger > HighID) Then
              Ok:=False;
        end;
    end;



    if (tblBatch.RecordCount > 1)And (Consolidate)then
    begin
      tblBatch.Filtered := False;
      tblBatch.last;
      MyTotalRecs:=tblBatch.RecordCount;

      aProgress.initProgress('',MyTotalRecs);
      while not tblBatch.Bof do
      begin
        aProgress.SetProgress(gettextlang(2066)+' '+IntToStr(_GetProgress)+' / '+IntToStr(MyTotalRecs),MyTotalRecs+1-tblBatch.RecNo);

        if tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger then
        begin
          total:=tblBatchFDEBIT.AsFloat - tblBatchFCREDIT.AsFloat;
          TaxTotal :=tblBatchFTAXAMOUNT.AsFloat ;
          Contra:=tblBatchSACCOUNT.Value;
          TmpIntVal:=LrGetPeriod(tblBatchDDate.Value);
          LastTaxId := tblBatchWTAXID.AsInteger ;
          LastLineId := tblBatchWLINKEDID.AsInteger ;
          LastGroup1id := tblBatchWREPORTINGGROUP1ID.AsInteger ;
          LastGroup2Id := tblBatchWREPORTINGGROUP2ID.AsInteger ;
          ProjectID  := StrToIntDef(tblBatchSJOBCODE.AsString,0);

          aDate := tblBatchDDATE.AsDateTime ;
          tblBatch.Edit;
          tblBatchSReference.Value:=PRef;
          tblBatchSACCOUNT.Value:=PRef;
          tblBatchSTAX.Value := PRef;
          tblBatch.Post;
          if  total > 0 then
          tblBatch.Filter := 'WLINEID <> WLINKEDID AND SJOBCODE = ' +QuotedStr(IntToStr(ProjectID))+' AND WREPORTINGGROUP1ID = ' +IntToStr(LastGroup1id)+' AND WREPORTINGGROUP1ID = ' +IntToStr(LastGroup1id)+' AND WREPORTINGGROUP2ID = ' +IntToStr(LastGroup2id)+' and SACCOUNT = ''' + Contra + '''' + 'AND WTaxID = ' + IntToStr(LastTaxId) +' and FAmount > 0'
          else
          tblBatch.Filter := 'WLINEID <> WLINKEDID AND SJOBCODE = ' +QuotedStr(IntToStr(ProjectID))+' AND WREPORTINGGROUP2ID = ' +IntToStr(LastGroup2id)+' and SACCOUNT = ''' + Contra + '''' + 'AND WTaxID = ' + IntToStr(LastTaxId) +' and FAmount < 0';
          tblBatch.Filtered := True;
          if tblBatch.RecordCount >=1 then
          begin
            tblBatch.First;
            while not tblBatch.EOF do
            if TmpIntVal=LrGetPeriod(tblBatchDDate.Value) then begin
               // Sylvain There is a 0.01 difference when consolidating. I'm
               // The diverence is solved couse of the rounding of the amounts correctly.
               // This way the balance is always kept.
               // going to cut amounts to 2 digits when generating balances.
               // At this stage All Amount Should be rounded to 2 digits.
               // No lets keep the fomrat uses in roundamounts.,
               // Going to 2 digets can make diverences where you dont wat them.
              Total := Total + (tblBatchFDEBIT.Value - tblBatchFCREDIT.Value);
              TaxTotal := TaxTotal + tblBatchFTAXAMOUNT.AsFloat ;
              if  aDate < tblBatchDDATE.AsDateTime then
              aDate := tblBatchDDATE.AsDateTime ;
              tblBatch.Delete;
              MyTotalRecs:=MyTotalRecs-1;
            end
            else
              tblBatch.Next;
          end;
          tblBatch.Filtered := False;
          tblBatch.Filter :='';
          tblBatch.Locate('SREFERENCE;SACCOUNT;STAX',VarArrayOf([PRef,PRef,PRef]),[]);
          tblBatch.Edit;
          tblBatchSReference.Value:= '********' ;
          tblBatchDDATE.AsDateTime := aDate ;
          tblBatchSACCOUNT.Value:=Contra;
          tblBatchWREPORTINGGROUP1ID.AsInteger := LastGroup1id ;
          tblBatchWREPORTINGGROUP2ID.AsInteger := LastGroup2id ;
          tblBatchSTAX.Value :='';
          tblBatchFCREDIT.AsString:='';
          tblBatchFDEBIT.AsString:='';
          if Total < 0 then
            tblBatchFCREDIT.Value := Total * - 1
          else
            tblBatchFDEBIT.Value := Total;
          tblBatchFTAXAMOUNT.AsFloat := TaxTotal ;
          tblBatchFAmount.Value:=tblBatchFDEBIT.Value-tblBatchFCREDIT.Value;
          tblBatchWLINKEDID.AsInteger := LastLineId ;
          tblBatch.Post;
        end;
        tblBatch.prior;
      end;
    end;

  end;
  dmDatabase.tblBatchFCREDIT.ReadOnly:=TmpCr;
  dmDatabase.tblBatchFDEBIT.ReadOnly:=TmpDb;
  finally
      dmDatabase.tblBatch.BeforePost := AOldBeforePost ;
  end;
   finally
      dmDatabase.tblBatch.EnableControls ;
 
   end;
  finally
     AProgress.CloseProgress ;
     aProgress.free ;
  end;
end;


Function CheckUserCtrl(vAction:String;Msg:Boolean):Boolean;
var
  HoldActive:Boolean;
  vMess :String;
begin
  result:=true;
  if CurrentUser<=0 then
    exit;
  vAction:=UpperCase(vAction);
  HoldActive:=dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Active:=True;
  if vAction='POST' then
  begin
    dmDatabase.tblUser.Locate('WUserID',CurrentUser,[]);
    result:=dmDatabase.tblUserBPosting.Value=1;
    vMess:='Update Ledger';
  end;
  if vAction='BATCH' then
  begin
    dmDatabase.tblUser.Locate('WUserID',CurrentUser,[]);
    result:=dmDatabase.tblUserBBatchEntry.Value=1;
    vMess:='Batch Entry';
  end;
  dmDatabase.tblUser.Active := HoldActive;
  //if Msg And (not Result) then
//    OSFMessageDlg(vMess+#13#10+GetTextLang(829)+#13#10+GetTextLang(830), mterror, [mbok], 0);
end;

function  IsPostLastYear : Boolean;
Var

 AZQuery : TuniQuery ;
Begin
  result := false ;
    if dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemFromPeriod(14) = nil then exit ;
    AZQuery := TuniQuery.Create(nil) ;
    try
     AZQuery.Connection := dmDatabase.ZMainconnection ;
     AZQuery.SQL.Text := format(dmDatabase.SQLList.GetFormatedSQLByName('LedgerRoutines_BatchInLastYear'),[DmDatabase.TblBatch.TableName]);
     AZQuery.ParamByName('DDate').AsDateTime := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemFromPeriod(14).StartDate ;
     AZQuery.open ;
     result := AZQuery.Fields[0].AsInteger > 0 ;
   finally
      AZQuery.free ;
   end;
End;

function  IsPostBankToStdLedgerWithTax(Var Atext: String ): Boolean;
Var

 AZQuery : TuniQuery ;
Begin
    Atext := '' ;
    AZQuery := TuniQuery.Create(nil) ;
    try
     AZQuery.Connection := dmDatabase.ZMainconnection ;
     AZQuery.SQL.Text := 'Select Batch.*,a.SAccountCode ||'+ QuotedStr(' ')
     +' || a.SDescription Bankto from ' +  DmDatabase.TblBatch.TableName + ' batch join Account a on (a.WAccountid = batch.waccountid and a.WAccountTypeId = 0) where (batch.WTaxID > 0 ) and batch.WLineid = WLinkedid ';
     AZQuery.open ;
     result := not AZQuery.ISempty ;
     if result then
        Atext := 'Line : ' + AZQuery.fieldByName('sreference').AsString + ' ' + AZQuery.fieldByName('sDescription').AsString +
          ' ' +  trim(AZQuery.fieldByName('Bankto').AsString) ;
   finally
      AZQuery.free ;
   end;
End;


function  IsPostBankToBank(Var Atext: String ): Boolean;
Var

 AZQuery : TuniQuery ;
Begin
    Atext := '' ;
    AZQuery := TuniQuery.Create(nil) ;
    try
     AZQuery.Connection := dmDatabase.ZMainconnection ;
     AZQuery.SQL.Text := 'Select Batch.*,a.SAccountCode ||'+ QuotedStr(' ')
     +' || a.SDescription Bankto ,b.SAccountCode ||'+ QuotedStr(' ') +' ||b.SDescription Bankfrom  from ' +  DmDatabase.TblBatch.TableName + ' batch join Account a on (a.WAccountid = batch.waccountid and a.WAccountTypeId = 3) join account b on (b.waccountid  = batch.WCONTRAACCOUNTID and b.WAccountTypeId = 3) and WLineid = WLinkedid ';
     AZQuery.open ;
     result := not AZQuery.ISempty ;
     if result then
        Atext := 'Line : ' + AZQuery.fieldByName('sreference').AsString + ' ' + AZQuery.fieldByName('sDescription').AsString +
          ' ' + trim(AZQuery.fieldByName('BankFrom').AsString)  +' to ' +  trim(AZQuery.fieldByName('Bankto').AsString) ;
   finally
      AZQuery.free ;
   end;
End;

function  IsPostOnAccount(AAccount : Integer) : Boolean;
Var

 AZQuery : TuniQuery ;
Begin
  result := false ;
    if dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetItemFromPeriod(14) = nil then exit ;
    AZQuery := TuniQuery.Create(nil) ;
    try
     AZQuery.Connection := dmDatabase.ZMainconnection ;
     AZQuery.SQL.Text := format(dmDatabase.SQLList.GetFormatedSQLByName('LedgerRoutines_PostOnAccount'),[DmDatabase.TblBatch.TableName]);
     AZQuery.ParamByName('WAccountId').AsInteger := AAccount;
     AZQuery.open ;
     result := AZQuery.Fields[0].AsInteger > 0 ;
   finally
      AZQuery.free ;
   end;
End;

function DoesBatchBalance : Boolean;
var
  // had some strange bug with the real.
  Temp    : Double;
  Periods : array[1..26] of Real;
  count   : Integer;
  StartDate,EndDate : TDateTime ;
  Text : String ;
begin
  Temp := 0;
  with dmDatabase do
  begin
    StartDate :=  dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetLowYear-1;
    EndDate := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear;

    tblBatchRefTotals.Close;
    tblBatchRefTotals.TableName := tblBatch.TableName;
    tblBatchRefTotals.Open;
    tblBatchRefTotals.First;
    while not tblBatchRefTotals.EOF do
    begin
      // We check for cents annyway.
      // I have found a batch that balances but gives a error here.
      // This was the fix and its just as good as we had.
      // todo : translate
      if {(tblBatchRefTotalsDDate.AsDateTime < StartDate)or } (tblBatchRefTotalsDDate.AsDateTime > EndDate) then
      raise Exception.create(GetTextLang(592)+' ' + IntToStr(tblBatchRefTotals.RecNo) + ' '+GetTextLang(607)+' : '+ tblBatchRefTotalsSReference.Value + ') : The date specified does not fall into any of this or last year''s periods (' + DateToStr(StartDate) + ' - ' + DateToStr(EndDate) + ').');

      Temp := (Temp + round((tblBatchRefTotalsFDEBIT.AsFloat - tblBatchRefTotalsFCREDIT.AsFloat)*100));
      tblBatchRefTotals.Next;
      // IF you have a off date and you dont use auto balance it get realy strange.
      //  This way we can check the dates strait away.
    end;
    tblBatchRefTotals.Close;
    //there is a bit of a round off problem here *
    // not annymore.
    if (Temp >= -0.01) and (Temp <= 0.01) then
    begin
      //if the batch balances , check periods
      //initialise the array
      for count := 1 to 26 do
        Periods[count] := 0;
      tblBatchRefTotals.Open;
      tblBatchRefTotals.First;
      //fill the array
      while not tblBatchRefTotals.EOF do
      begin
        if lrGetPeriod(tblBatchRefTotalsDDate.Value) > 1 then
           Periods[lrGetPeriod(tblBatchRefTotalsDDate.Value)] := Periods[lrGetPeriod(tblBatchRefTotalsDDate.Value)] + round((tblBatchRefTotalsFDEBIT.Value - tblBatchRefTotalsFCREDIT.Value)*100);
           
        tblBatchRefTotals.Next;
      end;
      tblBatchRefTotals.Close;
      //check the array
      for count := 1 to 26 do
      begin
        //*and here.
        if (Periods[count] >= -0.01) and (Periods[count] <= 0.01) then
          DoesBatchBalance := True
        else
        begin
         // tblPeriods.Open;
        //  tblPeriods.Locate('WPeriodID', count, []);
          DoesBatchBalance := False;
          Text := gettextlang(439) + #13 + #10 +gettextlang(600) +' : ' + GetPeriodDesc(count) + #13 + #10 + gettextlang(955) +'=' + FloatToStrF(Periods[count]/100, ffFixed, 18, 2) ;
          Raise Exception.Create(Text);
          // OSFMessageDlg(Text,1,[mbok],0);
          //Result:=117;
          //OSFMessageDlg(tblPeriodsSDescription.Value + ' '+GetTextLang(591)+' ' + FloatToStrF(Periods[count], ffFixed, 18, 2) + '.', mterror, [mbok], 0);
         // tblPeriods.Close;
          Exit;
        end;
      end;
    end
    else
      DoesBatchBalance := False;
  end;
end;




Function PostBatchNow(LyPost,MustPost:Boolean;IsReverse : Boolean = false;IsOpeningBal : Boolean = false ):integer;
Var
  WTransID:Integer;
  StrPostingOf : String ;
  aDMCoreData : TDMCoreData ;
   DefCostId : Integer ;
  aProgress : TfmNewProgress ;

begin
  aProgress := TfmNewProgress.create(nil) ;
  try
  aDMCoreData := TDMCoreData.Create(nil) ;
  try
  Result:=0;
  if CheckUserCtrl('Post',True)=false then
  begin
     Result:=112;
     Exit;
  end;
  dmDatabase.IsBalPost:=True;
  If IsPostLastYear And Not LyPost then
  //And (OSFMessageDlg(GetTextLang(595)+#13#10+GetTextLang(594){Are you sure you wish to Post to Last Year?}, mtconfirmation, [mbyes, mbno], 0) = mrNo) then
  begin
    Result:= 2012;
    Exit;
  end;
  if DoesBatchBalance or MustPost then
  begin
  if not IsReverse and (ValidateBatch(aDMCoreData)<>0) then
  begin
      //OSFMessageDlg(GetTextLang(590), mterror, [mbok], 0);
      Result := 2010;
      Exit;
    end;
    dmDatabase.tblSysVars.Open;
    if dmDatabase.tblBatch.State=dsEdit then dmDatabase.tblBatch.Post;
    dmDatabase.tblBatch.DisableControls;
    try
    dmDatabase.tblBatch.Last;
    dmDatabase.tblBatch.First;
    TotCount:=dmDatabase.tblBatch.RecordCount;
    Count:=0;
    StrPostingOf := gettextlang(1993);
    aProgress.initProgress('',dmDatabase.tblBatch.RecordCount);


    DefCostId := DMTCCoreLink.ReadnwReportOp(IntToStr(dmDatabase.BatchType) + 'DefCostCen',0) ;

    while not dmDatabase.tblBatch.EOF do

    begin
      Inc(Count);
      aProgress.SetProgress(format(StrPostingOf,[IntToStr(Count),IntToStr(TotCount)]),Count);
      lrPostBatchLine(aDMCoreData,dmDatabase.BatchType,WTransID,BatchCtrlID,0,IsReverse,IsOpeningBal,DefCostId);
     dmDatabase.tblBatch.Next;
    end;
    DMTCCoreLink.HandelCheckBatchDiv(BatchCtrlID);
    DMTCCoreLink.ExecSql('Delete from oilinks where (Unused1 = -2 or Unused1 = -1) and WBatchid =  ' + IntToStr(BatchCtrlID));
    // delete from oilinks unlinked for this


    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 3 then
      begin
         DMTCCoreLink.LogAction('POSTBATCH',BatchCtrlID,'Post batch!');
      end;
    {
    if Not T3IsRegistered then
      AdjTransactions(TotCount,2);
    // For Test
    TotCount:=  AdjTransactions(TotCount,1);
    //
    }
    dmDatabase.tblSysVars.Close;
    dmDatabase.tblBatch.Close;
    clearTable(dmDatabase.tblBatch.TableName);

    finally
    dmDatabase.tblBatch.EnableControls;

    end ;

     // no delete files but standard drop table SQL
    ADMCoreData.ZQBatchControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnUSerTypePosted');
    //Update the Batch control info
    ADMCoreData.ZQBatchControl.ParamByName('WUserID').AsInteger := CurrentUser ;
    ADMCoreData.ZQBatchControl.ParamByName('WBatchTypeID').AsInteger := dmDatabase.BatchType ;
    ADMCoreData.ZQBatchControl.Open;



    ADMCoreData.ZQBatchControl.First;
    While not ADMCoreData.ZQBatchControl.Eof do
    begin

      ADMCoreData.ZQBatchControl.Edit;
      ADMCoreData.ZQBatchControlBPosted.Value := 1;
      ADMCoreData.ZQBatchControlDSYSDATE.AsDateTime := now ;
      ADMCoreData.ZQBatchControl.Post;
      // done : Pieter if its just 1 record why do this and if your going to do this atleast place a next if we ever have 2 records where nevereg etting out of here.
      ADMCoreData.ZQBatchControl.next ;
    end;
    ADMCoreData.ZQBatchControl.Close;

  end
  else
    //OSFMessageDlg(GetTextLang(439){Batch is not in balance}, mterror, [mbok], 0);
    Result := 2011;
  dmDatabase.IsBalPost:=False;
  finally
    aDMCoreData.free ;
  end;
  finally
    aProgress.free ;
  end;
  // update accounts on closed items
  if DMTCCoreLink.ReadSysParam('BSETACCOUNTACTIVE',false,0) then
     begin
        TDataBaseRoutines.ExecSql('update account set binactive = 1 where bInactive = 0 and WREPORTINGGROUP1ID = 0 and Waccountid in (select WAccountid from ACCOUNT x where x.WAccountTypeId = 1 and 0.00 = (Select sum(FAmount) from transact a where a.Waccountid = x.WAccountid))'
                                + ' and WAccountId not in (Select z.Waccountid from dochead z where z.bposted = 0 and account.Waccountid = z.WAccountid)') ;
     end;

end;

Function  PrepareBatch(aBatTypName:String):Boolean;
begin
  dmDatabase.CalledFromBatch := True;
//  IsRepeatingBat := False;
  dmDatabase.tblBatch.Close;
  dmDatabase.tblBatchTypes.Open;
//  dmDatabase.tblBatchTypes.Locate('WBatchTypeID' ,dmDatabase.qryUpdateBatchWBatchTypeID.Value,[]);
  result := dmDatabase.tblBatchTypes.Locate('SDescription' ,aBatTypName,[LocaseInsensitive]);
  if Not Result Then Exit;
  dmDatabase.BatchType := dmDatabase.tblBatchTypesWBatchTypeID.Value;
  // Contra Per Line
  IsContraPerLine:= dmDatabase.tblBatchTypesBContraPerLine.Value=1;
  // Get Cashbook ID
  IsCashBook:=0;
  if dmDatabase.tblBatchTypesBCashBook.Value =1then begin
    dmDatabase.tblBank.open;
    if dmDatabase.tblBank.Locate('WAccountID',dmDatabase.tblBatchTypesWContraAccountID.Value,[]) then begin
      if dmDatabase.tblBankWPaymentsID.Value=dmDatabase.tblBatchTypesWBatchTypeID.Value then
        IsCashBook:=1;
      if dmDatabase.tblBankWReceiptsID.Value=dmDatabase.tblBatchTypesWBatchTypeID.Value then
        IsCashBook:=2;
    end;
    dmDatabase.tblBank.Close;
    IsContraPerLine:=False;
  end;
  dmDatabase.NmBatchType := dmDatabase.tblBatchTypesSDescription.Value;
  Result:=True;
end;

Function CanPostDoc(fDate:TDate;_WAccountID:integer):Integer;
Var
  iPeriod:Integer;
begin
  iPeriod := LrGetPeriod(fDate);
 Result := 0;
    if iPeriod<=0 then
  begin
   if not CanPostToLastYear then
     begin
        SMsgErr := DateToStr(fDate) +#13#10+GetTextLang(589)+' (' + DateToStr(TmpDatesLimits[0]) + ' - ' + DateToStr(TmpDatesLimits[1]) + ')';
       Result := 2044; //3
     end else
    if OSFMessageDlg(DateToStr(fDate) +#13#10+GetTextLang(589)+' (' + DateToStr(TmpDatesLimits[0]) + ' - ' + DateToStr(TmpDatesLimits[1]) + ') Continue?',mtWarning	,[mbno,mbyes],0) = mrno then
      begin
        SMsgErr := DateToStr(fDate) +#13#10+GetTextLang(589)+' (' + DateToStr(TmpDatesLimits[0]) + ' - ' + DateToStr(TmpDatesLimits[1]) + ')';
       Result := 2044; //3
      end; 
  end
 { else
  if (iPeriod<=13) AND (Not CanPostToLastYear) then
  begin
    SMsgErr := DateToStr(fDate) +#13#10 + GetTextLang(888)+#13#10+GetTextLang(890)  //'Last Year is Closed for posting'  ;
    Result  := 2042; //1
  end  }
  else
  begin
    dmDatabase.tblPeriods.Open;
    if dmDatabase.tblPeriods.Locate('WPeriodID',iPeriod,[]) then
    begin
      if dmDatabase.tblPeriodsBShutDown.Value =1then
      begin
        SMsgErr :=  dmDatabase.tblPeriodsSDESCRIPTION.AsString + ' ' +  DateToStr(fDate) +#13#10+ getTextLang(889)+#13#10+GetTextLang(890) {'This period is Closed for posting'};
        Result := 2043; //2
      end ;


    end else
    begin
      SMsgErr := DateToStr(fDate) +#13#10+GetTextLang(589)+' (' + DateToStr(TmpDatesLimits[0]) + ' - ' + DateToStr(TmpDatesLimits[1]) + ')';
      Result := 2044; //3;
    end;
    dmDatabase.tblPeriods.Close;
    end;

  // check Account disabled.
     if OpenSqlAndGetFirtsColumnValue('select BInactive from account Where WAccountID =  ' + IntToStr(_WAccountID) ) = 1 then
        begin
          SMsgErr := GetTextLang(201) + #13+#10 + Trim(GetAccountCodeAndDescription(_WAccountID)) ;
          Result := 2045; //3;
        end;
end;

procedure FillCostOFSaleForStockItem(CostPrice : Double ; aDMCoreDocData:TDMCoreDocData; AddDocRef:String ;StockID : Integer;BAvgCos : Boolean ;FQtyShipped : Double; level : Integer ) ;
var
 aQBOM : TuniQuery ;
 Total,TempAmount : Double ;
 LinkId : Integer ;
  Stop:Boolean ;
begin
   if assigned(OnProgressBatchPost)  then
       OnProgressBatchPost(stop,'Processing costofsale:'  + FloatToStr(FQtyShipped) + '  ' + TDataBaseStockRoutines.GetStockFullDescription(StockID),0,0,0) ;


  if dmDatabase.tblSysVarsBCreateCostOfSales.AsInteger = 0 then exit ;
  with dmdatabase do
   begin
      // allow multy level BOM but escape level 10 couse of circular reference
      // no Exception is raised as it could harm the process.
      // Maby if theres transactions we can do it.
      if level = 10 then exit ;
      // escape missing items etc
      aDMCoreDocData.zqStock.close ;
      aDMCoreDocData.zqStock.ParamByName('WStockID').AsInteger := StockID ;
      aDMCoreDocData.zqStock.open ;

      if aDMCoreDocData.zqStock.IsEmpty  then exit ;
      if (aDMCoreDocData.zqStockWStockTypeID.AsInteger in [1]) or ((aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19]) and (aDMCoreDocData.zqStockWStockTypeID.AsInteger in [9]) and (level=0)) then
       begin
        // allow multy level BOM

              aQBOM := TuniQuery.create(nil) ;
              try
              aQBOM.SQL.text := 'select * from BOM where WStockId = :ID' ;
              aQBOM.Connection := QBOM.Connection ;
              aQBOM.Close ;
              aQBOM.Params[0].AsInteger := StockID ;
              aQBOM.open ;
              while not aQBOM.eof do
                begin

                  if assigned(OnProgressBatchPost) and (level = 0) then
                  OnProgressBatchPost(stop,'Processing costofsale:'  + FloatToStr(FQtyShipped) + '  ' + TDataBaseStockRoutines.GetStockFullDescription(StockID),aQBOM.RecordCount,aQBOM.RecNo,0) ;


                  TempAmount := CostPrice ;
                  TempAmount := TempAmount * (aQBOM.fieldbyname('FPERCENTAGEOFSALE').AsFloat / 100);


                  FillCostOFSaleForStockItem(TempAmount,aDMCoreDocData,AddDocRef,aQBOM.FieldByName('WLinkedStockID').AsInteger,BAvgCos,aQBOM.FieldByName('FQty').AsFloat*FQtyShipped,level+1);
                  aQBOM.next ;
                end;
              finally
                aQBOM.free;
              end;
        aDMCoreDocData.zqStock.close ;
        aDMCoreDocData.zqStock.ParamByName('WStockID').AsInteger := StockID ;
        aDMCoreDocData.ZQStock.open ;
        if (aDMCoreDocData.zqStockWStockTypeID.AsInteger in [1 ]) then
        exit
      end;
  // Only cost of sale for standard items  and purchase
  aDMCoreDocData.zqStock.close ;
  aDMCoreDocData.zqStock.ParamByName('WStockID').AsInteger := StockID ;
  aDMCoreDocData.ZQStock.open ;

  if aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [0,2,3,7,9] then
  begin
   aDMCoreDocData.ZQContraAccount.close ;
   aDMCoreDocData.ZQContraAccount.ParamByName('WAccountID').AsInteger := aDMCoreDocData.ZQStockWCostAccountID.AsInteger ;
   aDMCoreDocData.ZQContraAccount.open ;


   if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [10,11,16,18,19] then
     if aDMCoreDocData.ZQStockWCostAccountID.AsInteger <> 0 then
      if not aDMCoreDocData.ZQContraAccount.IsEmpty  then
      begin
        //Cost of Sales
        aDMCoreDocData.ZQBatch.Append;
        aDMCoreDocData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  aDMCoreDocData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        aDMCoreDocData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  aDMCoreDocData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        aDMCoreDocData.ZQBatchSJOBCODE.AsString :=  aDMCoreDocData.ZQDocHeadWJOBCODEID.AsString ;
        aDMCoreDocData.ZQBatchWLINKEDID.AsInteger := aDMCoreDocData.ZQBatchWLINEID.AsInteger ;
        aDMCoreDocData.ZQBatchSReference.Value := aDMCoreDocData.ZQDocHeadSDocNo.Value;
        aDMCoreDocData.ZQBatchDDate.Value := aDMCoreDocData.ZQDocHeadDDate.Value;

        aDMCoreDocData.ZQBatchDAllocatedDate.Value := aDMCoreDocData.ZQDocHeadDDate.Value;
        aDMCoreDocData.ZQBatchSDescription.Value := gettextlang(2178)+' '+AddDocRef;
        if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19] then
            aDMCoreDocData.ZQBatchSDescription.Value := AddDocRef+ ' ' + aDMCoreDocData.ZQStockSSTOCKCODE.AsString ;
          if level = 0 then
           aDMCoreDocData.ZQBatchSDescription.Value := '*' + aDMCoreDocData.ZQBatchSDescription.Value ;

        aDMCoreDocData.ZQBatchSACCOUNT.Value := aDMCoreDocData.ZQContraAccountSMAINACCOUNTCODE.Value + '-' + aDMCoreDocData.ZQContraAccountSSUBACCOUNTCODE.Value;
        aDMCoreDocData.ZQBatchWAccountID.Value := aDMCoreDocData.ZQContraAccountWAccountID.Value;
        aDMCoreDocData.ZQBatchSTAX.AsString := '' ;
        // Select Average Cost or Latset Cost Value;
        if BAvgCos then
          Total := aDMCoreDocData.ZQStockFUnitAveCost.Value
        else
          Total := aDMCoreDocData.ZQStockFUnitCost.Value;

     //  // if not (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [19])  then
     //   if (CostPrice <> 0)  then
     //      Total := CostPrice ;

        if (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [11,19,17]) then
          aDMCoreDocData.ZQBatchFCREDIT.Value :=  Total * FQtyShipped
        else
          aDMCoreDocData.ZQBatchFDEBIT.Value :=  Total * FQtyShipped ;

        if  (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [19,18]) and (level <> 0) then
          begin
            TempAmount := aDMCoreDocData.ZQBatchFDEBIT.AsFloat ;
            aDMCoreDocData.ZQBatchFDEBIT.AsFloat  := aDMCoreDocData.ZQBatchFCREDIT.Value ;
            aDMCoreDocData.ZQBatchFCREDIT.Value := TempAmount ;
          end;

        LinkId := aDMCoreDocData.ZQBatchWLINEID.AsInteger ;
        aDMCoreDocData.ZQBatch.Post;
        //Sales
        aDMCoreDocData.ZQContraAccount.close ;
        aDMCoreDocData.ZQContraAccount.ParamByName('WAccountID').AsInteger := aDMCoreDocData.ZQStockWStockAccountID.AsInteger ;
        aDMCoreDocData.ZQContraAccount.open ;

        aDMCoreDocData.ZQBatch.Append;
        aDMCoreDocData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  aDMCoreDocData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        aDMCoreDocData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  aDMCoreDocData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        aDMCoreDocData.ZQBatchWLINKEDID.AsInteger := LinkId  ;
        aDMCoreDocData.ZQBatchSReference.Value := aDMCoreDocData.ZQDocHeadSDocNo.Value;
        aDMCoreDocData.ZQBatchDDate.Value := aDMCoreDocData.ZQDocHeadDDate.Value;
        aDMCoreDocData.ZQBatchDAllocatedDate.Value := aDMCoreDocData.ZQDocHeadDDate.Value;
        aDMCoreDocData.ZQBatchSDescription.Value := GetTextLang(1994) +AddDocRef;
        if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19] then
           aDMCoreDocData.ZQBatchSDescription.Value := AddDocRef+ ' ' + aDMCoreDocData.ZQStockSSTOCKCODE.AsString ;
        if level = 0 then
           aDMCoreDocData.ZQBatchSDescription.Value := '*' + aDMCoreDocData.ZQBatchSDescription.Value ;

        aDMCoreDocData.ZQBatchSTAX.AsString := '' ;
        //02/8
        aDMCoreDocData.ZQBatchWAccountID.Value := aDMCoreDocData.ZQStockWStockAccountID.Value;
        aDMCoreDocData.ZQBatchSACCOUNT.Value := aDMCoreDocData.ZQContraAccountSMAINACCOUNTCODE.AsString + '-' + aDMCoreDocData.ZQContraAccountSSUBACCOUNTCODE.AsString;
        if (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [11,19,17]) then
          aDMCoreDocData.ZQBatchFDEBIT.Value :=  Total * FQtyShipped
        else
          aDMCoreDocData.ZQBatchFCREDIT.Value :=  Total * FQtyShipped ;

        if  (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [19,18]) and (level <> 0) then
          begin
            TempAmount := aDMCoreDocData.ZQBatchFDEBIT.AsFloat ;
            aDMCoreDocData.ZQBatchFDEBIT.AsFloat  := aDMCoreDocData.ZQBatchFCREDIT.Value ;
            aDMCoreDocData.ZQBatchFCREDIT.Value := TempAmount ;
          end;

        aDMCoreDocData.ZQBatch.Post;
     end;
   end;
   end;
end;
procedure HandelStockTrans(aDMCoreDocData:TDMCoreDocData;FQtyShipped,FQtyOrdered,PurchasePerItemPrice : Double;BAvgCos:Boolean;StockID : Integer;Var CostPrice : Double;level : Integer ) ;
var
 Stop : Boolean ;

begin
   if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCDECREORD'] = 'TRUE') then
     begin
       if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [12,13] then
        begin
            aDMCoreDocData.ZQStock.Edit ;
             aDMCoreDocData.ZQStockFREORDERQTY.AsFloat := aDMCoreDocData.ZQStockFREORDERQTY.AsFloat - FQtyShipped ;
            aDMCoreDocData.ZQStock.Post ;
        end;
       if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [17] then
        begin
            aDMCoreDocData.ZQStock.Edit ;
            aDMCoreDocData.ZQStockFREORDERQTY.AsFloat := aDMCoreDocData.ZQStockFREORDERQTY.AsFloat + FQtyShipped ;
            aDMCoreDocData.ZQStock.Post ;
        end;
     end;
   if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES'] = 'TRUE') then
    begin
      if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [12,13] then
        exit ;
    end else
   if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE') then
    begin
      if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [10,11,12,13] then
        exit ;
    end ;

     if assigned(OnProgressBatchPost) then
         OnProgressBatchPost(stop,'Processing trans qty:'  + FloatToStr(FQtyShipped) + '  ' + TDataBaseStockRoutines.GetStockFullDescription(StockID),1,1,0) ;



    // All items else reports dont show up.
    // ok but except this items then dont handel annything for them but let the reports come from reportman.
    if (aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [4,5,6,10]) then
        exit ;

        aDMCoreDocData.ZQStockTrans.open ;
        aDMCoreDocData.ZQStock.Edit ;
        aDMCoreDocData.ZQStockTrans.Append ;
        {30804/2002}

        if (aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [7]) then
           begin
             // handel detail.
              aDMCoreDocData.ZQDOCLINEOPTIONS.Filtered := false ;
              aDMCoreDocData.ZQDOCLINEOPTIONS.Filter  := 'WLINEID=' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString ;
              aDMCoreDocData.ZQDOCLINEOPTIONS.Filtered := True ;
              aDMCoreDocData.ZQDOCLINEOPTIONS.First ;
              CostPrice := 0 ;
              while not aDMCoreDocData.ZQDOCLINEOPTIONS.Eof do
                  begin
                     aDMCoreDocData.ZQStockOptions.close ;
                     aDMCoreDocData.ZQStockOptions.ParamByName('WSTOCKID').AsInteger := aDMCoreDocData.ZQDocLineWSTOCKID.AsInteger ;
                     aDMCoreDocData.ZQStockOptions.ParamByName('WITEMOPTIONVALUE1ID').AsInteger := aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsInteger ;
                     aDMCoreDocData.ZQStockOptions.Open ;
                     if aDMCoreDocData.ZQStockOptions.IsEmpty then
                        raise Exception.Create('Item not found ' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString );

                     if aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsInteger <> 0 then
                     begin
                     if not aDMCoreDocData.ZQStockOptions.Locate('WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',VarArrayOf([
                       aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.Value,aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.Value,aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.Value,
                       aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE5ID.Value]),[]) then
                         raise Exception.Create('Item not found ' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString );
                     end else

                     if aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsInteger <> 0 then
                     begin
                     if not aDMCoreDocData.ZQStockOptions.Locate('WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID',VarArrayOf([
                       aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.Value,aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.Value,
                          aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE4ID.Value]),[]) then
                         raise Exception.Create('Item not found ' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString );
                     end else

                     if aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsInteger <> 0 then
                     begin
                     if not aDMCoreDocData.ZQStockOptions.Locate('WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID',VarArrayOf([
                       aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.Value,aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE3ID.Value]),[]) then
                         raise Exception.Create('Item not found ' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString );
                     end else

                     if aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsInteger <> 0 then
                     begin
                     if not aDMCoreDocData.ZQStockOptions.Locate('WITEMOPTIONVALUE2ID',
                       aDMCoreDocData.ZQDoclineOptionsWITEMOPTIONVALUE2ID.Value,[]) then
                         raise Exception.Create('Item not found ' + aDMCoreDocData.ZQDocLineWDOCLINEID.AsString );
                     end;

                    aDMCoreDocData.ZQStockOptions.Edit ;

                    if BAvgCos then
                      aDMCoreDocData.ZQStockTransFCostPrice.Value := aDMCoreDocData.ZQStockOptionsFUNITAVECOST.AsFloat
                    else
                      aDMCoreDocData.ZQStockTransFCostPrice.Value :=  aDMCoreDocData.ZQStockOptionsFUnitCost.AsFloat;

                     CostPrice := CostPrice + aDMCoreDocData.ZQStockTransFCostPrice.AsFloat * (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier);

                  if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger>=12 then

                 if FQtyShipped <> 0 then
                begin
                  if Str2Float(aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsString)<=0 then

                   aDMCoreDocData.ZQStockOptionsFUnitAveCost.AsFloat := aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat
                  else
                   begin
                   // With -1 and 1 on hand it gets to a division by zero
                   if (max(aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat,0) + (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier)) <> 0 then
                   aDMCoreDocData.ZQStockOptionsFUnitAveCost.AsFloat:= abs(((aDMCoreDocData.ZQStockOptionsFUnitAveCost.AsFloat * max(aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat,0))
                                                 + (aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat * (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier)))
                                               /(max(aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat,0) + (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier)))
                                               else
                                           aDMCoreDocData.ZQStockOptionsFUnitAveCost.AsFloat:= aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat ;
                   end;
                end;
                if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [13,10,19,16]  then
                begin
                   aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat := aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat - (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier);
                end
                else
                begin

                   aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat := aDMCoreDocData.ZQStockOptionsFQtyOnHand.AsFloat + (aDMCoreDocData.ZQDoclineOptionsFQTY.AsFloat * GlQtyMultiplier);
                end;
                // Update Latest unit Cost if Purchasse
                if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger=12 then
                   if not aDMCoreDocData.DoNotChangePurchasePrice then
                aDMCoreDocData.ZQStockOptionsFUNITCOST.Value := aDMCoreDocData.ZQDoclineOptionsFEXTRAPRICE.AsFloat ;
                aDMCoreDocData.ZQStockOptions.Post ;

                aDMCoreDocData.ZQDOCLINEOPTIONS.next ;
           end;
        end;

          if BAvgCos then
            aDMCoreDocData.ZQStockTransFCostPrice.Value := aDMCoreDocData.ZQStockFUnitAveCost.AsFloat
          else
            aDMCoreDocData.ZQStockTransFCostPrice.Value :=  aDMCoreDocData.ZQStockFUnitCost.AsFloat;

        if (aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [4,5,8]) then
           aDMCoreDocData.ZQStockTransFCostPrice.Value :=  0 ;


        if (aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [1,9]) then
          begin
           if (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [19,18]) then
             if  CostPrice <> 0 then
              aDMCoreDocData.ZQStockTransFCostPrice.Value := CostPrice else
             CostPrice := (aDMCoreDocData.ZQStockTransFCostPrice.Value * FQtyShipped);

          end else
           if  (aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [7,8]) then
          begin
          if FQtyShipped <> 0 then
             aDMCoreDocData.ZQStockTransFCostPrice.Value := CostPrice / FQtyShipped ;
          end  else
          begin
             CostPrice := CostPrice + aDMCoreDocData.ZQStockTransFCostPrice.Value * FQtyShipped ;
          end;

        // Update Average Cost
        if aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger>=12 then
         // done : Pieter reported errors when setting ship to 0
         if FQtyShipped <> 0 then
        begin
          if Str2Float(aDMCoreDocData.ZQStockFQtyOnHand.AsString)<=0 then
          begin

          if not(aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [19,18]) then
             begin
                aDMCoreDocData.ZQStockFUnitAveCost.Value := PurchasePerItemPrice ;
             end else
             begin
                if (idDocType in [19]) and (FQtyShipped < 0) then
                   aDMCoreDocData.ZQStockFUnitAveCost.Value := PurchasePerItemPrice ;
                if (idDocType in [18]) and (FQtyShipped > 0) then
                   aDMCoreDocData.ZQStockFUnitAveCost.Value := PurchasePerItemPrice ;

             end;


          end else
           begin
           // With -1 and 1 on hand it gets to a division by zero
           if not(idDocType in [19,18] ) then
           begin
           if (max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0) + FQtyShipped) <> 0 then
            begin
             aDMCoreDocData.ZQStockFUnitAveCost.Value:= abs(((aDMCoreDocData.ZQStockFUnitAveCost.AsFloat * max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0))
                                         + (PurchasePerItemPrice * FQtyShipped))
                                       /(max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0) + FQtyShipped))

             end  else
               aDMCoreDocData.ZQStockFUnitAveCost.Value:= PurchasePerItemPrice ;
           end else
           begin
            if (FQtyShipped < 0)  and (idDocType in [19] ) then
              aDMCoreDocData.ZQStockFUnitAveCost.Value:= abs(((aDMCoreDocData.ZQStockFUnitAveCost.AsFloat * max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0))
                                         + (PurchasePerItemPrice * -FQtyShipped))
                                       /(max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0) - FQtyShipped))
            else                           
            if (FQtyShipped > 0)  and (idDocType in [18] ) then
              aDMCoreDocData.ZQStockFUnitAveCost.Value:= abs(((aDMCoreDocData.ZQStockFUnitAveCost.AsFloat * max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0))
                                         + (PurchasePerItemPrice * FQtyShipped))
                                       /(max(aDMCoreDocData.ZQStockFQtyOnHand.AsFloat,0) + FQtyShipped)) ;
           end;
          end;
        end;
        if idDocType in [13,10,16,19]  then
        begin
          // only standaard items deduct.
          // All items else reports dont show up.
          if (aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [0,2,3,7,8,9]) then
           begin
           aDMCoreDocData.ZQStockFQtyOnHand.Value := aDMCoreDocData.ZQStockFQtyOnHand.Value - FQtyShipped;

           end;
          aDMCoreDocData.ZQStockTransFQty.Value := - FQtyShipped;
        end
        else
        begin
         // only standaard items deduct.
        //   if tblStockWStockTypeID.AsInteger = 0 then
        // All items else reports dont show up.
        if (aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [0,2,3,7,8,9]) then
           begin
           // Error must handel negatives.
           aDMCoreDocData.ZQStockFQtyOnHand.Value := aDMCoreDocData.ZQStockFQtyOnHand.Value + FQtyShipped;
           // todo : Pieter Can we do this ? As long as te documents get posted all the time
           // please advice.
          // Field has been writen out.
          // tblStockFInvQtyOnHand.AsFloat := 0 ;

           end;
           aDMCoreDocData.ZQStockTransFQty.Value := FQtyShipped;
        end;
        // Update Latest unit Cost if Purchasse
      if ((idDocType=12)    ) then
       begin
        if not aDMCoreDocData.DoNotChangePurchasePrice then
           aDMCoreDocData.ZQStockFUnitCost.Value := PurchasePerItemPrice ;
            if  DMTCCoreLink.ExtraOptions.values['UPDLASTPRFROMGROSSPR'] <> '0' then
             if level = 0 then
              begin
              aDMCoreDocData.ZQStockFUnitCost.Value := aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat / TDataBaseStockRoutines.GetUnitQty(StrToIntDef(aDMCoreDocData.ZQDocLineSUNIT.AsString,0)) ;
                if aDMCoreDocData.ZQDocHeadBEXCLUSIVE.AsInteger = 0 then
                   aDMCoreDocData.ZQStockFUnitCost.Value := aDMCoreDocData.ZQStockFUnitCost.Value / TDataBaseRoutines.GetTaxRateOnId(aDMCoreDocData.ZQDocLineWTAXID.AsInteger) ;
              end;
       end;
        aDMCoreDocData.ZQStock.Post;
        //
        aDMCoreDocData.ZQStockTransWAccountID.Value := aDMCoreDocData.ZQDocHeadWAccountID.Value;
        aDMCoreDocData.ZQStockTransWStockID.Value := StockID ;
        aDMCoreDocData.ZQStockTransDDate.Value := aDMCoreDocData.ZQDocHeadDDate.Value;
        aDMCoreDocData.ZQStockTransWSalesmanID.Value := aDMCoreDocData.ZQDocHeadWSalesmanID.Value;
        aDMCoreDocData.ZQStockTransWDocID.Value := aDMCoreDocData.ZQDocHeadWDocID.Value;
        aDMCoreDocData.ZQStockTransWDocTypeID.Value := aDMCoreDocData.ZQDocHeadWTypeID.Value;
        aDMCoreDocData.ZQStockTransFSellingPrice.Value := PurchasePerItemPrice;
        aDMCoreDocData.ZQStockTransWLINEID.AsInteger := aDMCoreDocData.ZQDocLineWDOCLINEID.AsInteger ;
        aDMCoreDocData.ZQStockTrans.Post;
        // Added by Sylvain
        // Create Back-Order
        if (idDocType in[10,16]) and (FQtyOrdered > -0.0001) and (level = 0) then  begin
          if FQtyShipped<FQtyOrdered then
            begin
             aDMCoreDocData.ZQBackOrder.ParamByName('WAccountID').AsInteger := aDMCoreDocData.ZQDocHeadWACCOUNTID.AsInteger ;
             aDMCoreDocData.ZQBackOrder.ParamByName('WStockID').AsInteger := StockID ;
             aDMCoreDocData.ZQBackOrder.Open;
             aDMCoreDocData.ZQBackOrder.Append;
             aDMCoreDocData.ZQBackOrderWAccountID.Value:=aDMCoreDocData.ZQDocHeadWAccountID.Value;
             aDMCoreDocData.ZQBackOrderWStockID.Value:=aDMCoreDocData.ZQDocLineWStockID.Value;
             aDMCoreDocData.ZQBackOrderFQty.Value:=FQtyOrdered-FQtyShipped;
             aDMCoreDocData.ZQBackOrderFPRICE.AsFloat :=  aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat ;
             aDMCoreDocData.ZQBackOrderwunitid.asinteger := StrToIntDef(aDMCoreDocData.ZQDocLineSUNIT.AsString,0) ;
             aDMCoreDocData.ZQBackOrderFDISCOUNT.AsFloat :=  aDMCoreDocData.ZQDocLineFITEMDISCOUNT.AsFloat ;
             aDMCoreDocData.ZQBackOrderFSellingPrice.AsFloat := aDMCoreDocData.ZQDocLineFSELLINGPRICE.AsFloat  * (1 - (aDMCoreDocData.ZQDocLineFITEMDISCOUNT.AsFloat / 100) ) ;  //  TDataBaseStockRoutines.getStockPrice(aDMCoreDocData.ZQDocHeadWAccountID.AsInteger,StockID,FQtyOrdered);
             aDMCoreDocData.ZQBackOrderSSOURCE.AsString := trim(aDMCoreDocData.ZQDocHeadSDOCNO.AsString + ' ' +aDMCoreDocData.ZQDocHeadSREFERENCE.AsString) ;
             aDMCoreDocData.ZQBackOrder.Post;
             aDMCoreDocData.ZQBackOrder.Close;
            end;
        end;
end;

procedure HandelStockForDocLine(aDMCoreDocData:TDMCoreDocData;BAvgCos:Boolean ;StockID : Integer;PurchasePerItemPrice,FQtyShipped,FQtyOrdered : Double ;Level : Integer;Var CostPrice : Double);
var
 aQBOM : TuniQuery ;
 Sellprice,TotalCost ,TempCostPrice,QtyMulti : Double ;
 Stop : Boolean ;
begin
    QtyMulti :=  TDataBaseStockRoutines.GetUnitQty(StrToIntDef(aDMCoreDocData.ZQDocLineSUNIT.asstring,0));
    if QtyMulti = 0 then QtyMulti := 1 ;

     if assigned(OnProgressBatchPost) then
         OnProgressBatchPost(stop,'Processing lvl '  + IntToStr(Level) + '  ' + TDataBaseStockRoutines.GetStockFullDescription(StockID),1,1,0) ;


      // allow multy level BOM but escape level 10 couse of circular reference
      // no Exception is raised as it could harm the process.
      // Maby if theres transactions we can do it.
      if level = 10 then exit ;
      if aDMCoreDocData.ZQStock.ParamByName('WStockId').AsInteger <> StockID then
       begin
        aDMCoreDocData.ZQStock.close ;
        aDMCoreDocData.ZQStock.ParamByName('WStockId').AsInteger := StockID ;
       end; 
      aDMCoreDocData.ZQStock.open ;

      if aDMCoreDocData.ZQStock.IsEmpty then exit ;
      if aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [10] then exit ;


      if (aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [1]) or ((aDMCoreDocData.ZQStockWStockTypeID.AsInteger in [9]) and (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19]) and (Level=0 ) ) then
       begin
        // allow multy level BOM

              aQBOM := TuniQuery.create(nil) ;
              try
              aQBOM.SQL.text := 'select * from BOM where WStockId  = :ID' ;
              aQBOM.Connection := dmDatabase.QBOM.Connection ;
              aQBOM.Close ;
              aQBOM.Params[0].AsInteger := StockID ;
              aQBOM.open ;

               TotalCost := 0 ;

              while not aQBOM.eof do
                begin
                 // if aQBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat <> 0 then
                  begin
              //    if  aQBOM.FieldByName('FQty').AsFloat > 1 then
                Sellprice := 0 ;
                TempCostPrice := 0 ;
                 if aQBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat <> 0 then
                  begin
                   if  aQBOM.FieldByName('FQty').AsFloat <> 0 then
                   Sellprice := PurchasePerItemPrice * ((aQBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat / 100) / aQBOM.FieldByName('FQty').AsFloat)
                   else
                   Sellprice :=PurchasePerItemPrice ;
                  end;
              //    else
              //    Sellprice := PurchasePerItemPrice ;

               //   Sellprice := ((aQBOM.FieldByName('FPERCENTAGEOFSALE').AsFloat / 100) *  ( Sellprice )) ;


                  HandelStockForDocLine(aDMCoreDocData,BAvgCos,aQBOM.FieldByName('WLinkedStockID').AsInteger,Sellprice,aQBOM.FieldByName('FQty').AsFloat*FQtyShipped,aQBOM.FieldByName('FQty').AsFloat,Level + 1,TempCostPrice);
                     ;
                  TotalCost := TotalCost + TempCostPrice ;
                  end;
                  aQBOM.next ;
                end;
              finally
                aQBOM.free;
              end;
          if FQtyShipped <> 0 then
          begin
            CostPrice := TotalCost / FQtyShipped ;
            PurchasePerItemPrice := CostPrice / (FQtyShipped / aDMCoreDocData.ZQDocLineFQTYSHIPPED.AsFloat ) ;
          end;
        // exit ;
       end;


       if aDMCoreDocData.ZQStock.ParamByName('WStockID').AsInteger  <> StockID then
                begin
                aDMCoreDocData.ZQStock.close ;
                aDMCoreDocData.ZQStock.ParamByName('WStockID').AsInteger :=  StockID ;
                end;
       aDMCoreDocData.ZQStock.open ;
     {  if  ((aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [1,9])) then
           begin
              if FQtyShipped <> 0 then
              CostPrice := CostPrice / FQtyShipped;

           end; }
   {   if (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19]) then
        if  (aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [1])  and ((aDMCoreDocData.ZQStockWSTOCKTYPEID.AsInteger in [9]) and (level = 0)) then
           PurchasePerItemPrice := CostPrice ;  }

       if (Level = 0) and (aDMCoreDocData.ZQDocHeadWTYPEID.AsInteger in [18,19]) then
        HandelstockTrans(aDMCoreDocData,-FQtyShipped,-FQtyOrdered,PurchasePerItemPrice,BAvgCos,StockID,CostPrice,Level)
        else
        HandelstockTrans(aDMCoreDocData,FQtyShipped,FQtyOrdered,PurchasePerItemPrice,BAvgCos,StockID,CostPrice,Level);

end;

procedure GetTransactLineFromDocumentId(aAccount,ADocID : Integer;Var ATransactLine: Integer; Var ATotalOpenAmount : Double ) ;

begin
 dmDatabase.qGenII.SQL.Text := 'Select WTransactionID, FOutstandingAmount FROM BatCon , transact where Transact.WBatchID = BatCon.WBatchID and WAccountId ' + IntToStr(aAccount) +  ' and WDocId = '+ IntToStr(ADocID);
 dmDatabase.qGenII.Open ;
 ATransactLine :=  dmDatabase.qGenII.Fields[0].AsInteger ;
 ATotalOpenAmount := dmDatabase.qGenII.Fields[1].Asfloat ;
 dmDatabase.qGenII.close ;
end;

function  ConvertDocumentToBatch(Var WTrans:Integer;DocId : Integer;AutoLink:Boolean=False;MyADmCoreData : TDMCoreDocData =nil;MyADmCoreDataBatch : TDMCoreData=nil;DoCommit:Boolean=False) : Integer;
{

  Converts a Document to a batch and posts it.
  It assumes that tblDocHeader is open and
  the current record is the Document you wish
  to post.

}
 Var
  FirstProffLossLine,FirstDeblineid : Integer ;
  ADmCoreData : TDMCoreDocData ;
  ADmCoreDataBatch : TDMCoreData ;
  ASaveList : TSaveClientDatasetCallList ;
  DefaultAccountIdFromDebCred,ContraLineID : Integer ;
  BAvgCos,
  OK ,MergeItems,FinPaymentsAdded   : Boolean;
  FirstAcc,
  NextAcc,
  TaxAcc,LastStockTypeString: String;
  AdSellingPrice,
  TotalTax,
  Total ,AvgCostPerItem      : Double;
  SavePlace:TbookMark;
  FirstAccID,AccountID,
  NextAccID,BatLine,DebCreditLineId,ProjectID,
  BatchTypeID,CostOfSaleLevel,StockHandelLevel :Integer;
  LastTaxAcount , i : Integer  ;
  LastTaxAmount,LastTaxRate : Double ;
  tmp:LongInt;
  PaymentDate : TDate  ;
  MainAccountLinkedTaxId : Variant ;
  Label 1;
  Function AddDocRef:String;
  begin
    Result :='';
    if Trim(ADmCoreData.ZQDocHeadSReference.AsString)<>'' then
      Result :='/' + Trim(ADmCoreData.ZQDocHeadSReference.AsString)
      else
      Result :='/' + Trim(ADmCoreData.ZQDocHeadSDOCNO.AsString)
  end;
  Procedure FilterDocLine;
  begin
      ADmCoreData.zqDocLine.Filtered := False;
      ADmCoreData.zqDocLine.Filter := '(WLineTypeID<>91) and (WLineTypeID<>93)';
      ADmCoreData.zqDocLine.Filtered := True;
  end;
  Procedure DoExit;
  begin
    dmDatabase.tblBatch.Close;;
    ClearTable(dmDatabase.tblBatch.TableName);
  end;
  Procedure SetDebitCreditWithAmount(Amount,TaxAmount:Double ) ;
  begin
    if Amount > 0 then // (debit)
    begin
     ExecSql('Update ' +   ADmCoreData.BatchName +
     ' set FDEBIT = ' + StringReplace(FloatToStr(abs(Amount)),DecimalSeparator,'.',[]) +
     ' , FCREDIT = 0'    +
     ' , FTAXAMOUNT = '    +  StringReplace(FloatToStr(abs(TaxAmount)),DecimalSeparator,'.',[]) +
     ' , Stax = null '  +
     ' , WTaxId = null '  +
     ' , BEXCLUSIVE = 0'    +
     ' , WDOCID = ' + IntToStr(ADmCoreData.ZQDocHeadWDOCID.AsInteger)    +
     ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger))
    end else // (credit)
    begin
     ExecSql('Update ' +   ADmCoreData.BatchName +
     ' set FCREDIT = ' + StringReplace(FloatToStr(abs(Amount)),DecimalSeparator,'.',[]) +
     ' , FDEBIT = 0'    +
     ' , FAMOUNT = ' + StringReplace(FloatToStr(Amount),DecimalSeparator,'.',[]) +
     ' , FTAXAMOUNT = '    +  StringReplace(FloatToStr(abs(TaxAmount)),DecimalSeparator,'.',[]) +
     ' , BEXCLUSIVE = 0'    +
     ' , WDOCID = ' + IntToStr(ADmCoreData.ZQDocHeadWDOCID.AsInteger)    +
     ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger))
    end;
  end;
  procedure DoStockBatch ;
  begin
  ok := not ADmCoreData.ZQStock.IsEmpty ;
        if Not CheckStockCode(True,ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger) or (Not Ok) then
        begin
          SMsgErr := ADmCoreData.ZQStockSSTOCKCODE.AsString +  ADmCoreData.ZQStockSDescription.Value +#13#10+ GetTextLang(965);
          Result := 2040;
          exit;
        end;
        if ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger = 10 then exit ;
        if DMTCCoreLink.ExtraOptions.Values['STKCHECKType'] = '-1' then
        begin
        // check for types that should not post
        Case IdDocType of
          10,11 : if  (ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger in [3,5]) then raise Exception.Create('Wrong stocktype for document! '+ ADmCoreData.ZQStockSSTOCKCODE.AsString + ' in document '+  ADmCoreData.ZQDocHeadSDocNo.AsString );
          12,13 : if  (ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger in [2,4]) then raise Exception.Create('Wrong stocktype for document! '+ ADmCoreData.ZQStockSSTOCKCODE.AsString + ' in document '+  ADmCoreData.ZQDocHeadSDocNo.AsString );
          end;
        end;

        //add the debtors or Creditor entry
        ADmCoreData.ZQBatch.First;
        ADmCoreData.ZQBatch.Insert;
        Inc(BatLine);
        DebCreditLineId := BatLine ;
        if ProjectID <> 0 then
           ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;
        ADmCoreData.ZQBatchWLineID.AsInteger:= BatLine;
        ADmCoreData.ZQBatchWLINKEDID.AsInteger := BatLine;
        ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
        ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDPAYMENTDATE.AsDateTime := PaymentDate ;
        ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        ADmCoreData.ZQBatchWDOCID.AsInteger:= ADmCoreData.ZQDocLineWDOCID.AsInteger ;
        //2/8
        AccountID:=ADmCoreData.ZQDocHeadWAccountID.Value;
        ADmCoreData.ZQBatchWAccountID.value:=ADmCoreData.ZQDocHeadWACCOUNTID.Value;
        ADmCoreData.ZQBatchWDOCID.AsInteger := ADmCoreData.ZQDocHeadWDOCID.AsInteger ;

        LastTaxAcount := 0;
        LastTaxAmount := 0 ;
        TaxAcc := '';
        //tblAccount.Locate('WAccountID', tblDocHeaderWAccountID.Value, []);
        ADmCoreData.ZQTax.Close ;
        ADmCoreData.ZQBatchSACCOUNT.Value :=  ADmCoreData.ZQAccountSMAINACCOUNTCODE.AsString + '-' +
          ADmCoreData.ZQAccountSSUBACCOUNTCODE.AsString;
        ADmCoreData.ZQTax.ParamByName('WAccountId').AsInteger := ADmCoreData.ZQDocLineWTaxID.AsInteger ;
        ADmCoreData.ZQTax.open ;
        if not ADmCoreData.ZQTax.IsEmpty then
          begin
           ADmCoreData.ZQBatchSTAX.asstring := ADmCoreData.ZQTaxSMAINACCOUNTCODE.AsString + '-' +
           ADmCoreData.ZQTaxSSUBACCOUNTCODE.AsString;
            ADmCoreData.ZQBatchWTAXID.AsInteger :=  ADmCoreData.ZQDocLineWTaxID.AsInteger ;
            LastTaxAcount := ADmCoreData.ZQBatchWTAXID.AsInteger ;
            TaxAcc := ADmCoreData.ZQBatchSTAX.asstring ;
          end;

        if  ADmCoreData.ZQDocLineWLineTypeID.Value=94 then
           ADmCoreData.ZQBatchBExclusive.Value:=0
        else
           ADmCoreData.ZQBatchBExclusive.Value:=1;
        //add the tax amount to the debtor's entry
        // For Debit Amount
        ADmCoreData.ZQBatchFTaxAmount.asfloat := ADmCoreData.ZQDocLineFTaxAmount.Value;
        Case IdDocType of
        11:begin
             ADmCoreData.ZQBatchSDescription.Value := {'Credit note'} gettextlang(2152)+' '+AddDocRef;
             ADmCoreData.ZQBatchFCREDIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;//Credit Notes
             //add the tax amount to the debtor's entry
             // For Credit
            ADmCoreData.ZQBatchFTaxAmount.asfloat := - ADmCoreData.ZQDocLineFTaxAmount.Value;
           end;
        12:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Purchase'} gettextlang(2153)+' '+AddDocRef;
             ADmCoreData.ZQBatchFCREDIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;// Purcahses
             //add the tax amount to the debtor's entry
             // For Credit
            ADmCoreData.ZQBatchFTaxAmount.asfloat := - ADmCoreData.ZQDocLineFTaxAmount.Value;
           end;
        16,17:Begin
             ADmCoreData.ZQBatchSDescription.Value := 'Adjustment '+AddDocRef;
             ADmCoreData.ZQBatchFDEBIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Goods Ret
           end;

        13:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Goods Returned'} gettextlang(2154)+' '+AddDocRef;
             ADmCoreData.ZQBatchFDEBIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Goods Ret
           end;
        else
           begin
              ADmCoreData.ZQBatchSDescription.Value := {'Invoice'} gettextlang(2155)+' '+AddDocRef;
              ADmCoreData.ZQBatchFDEBIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Invoives
           end;
        end;
        ADmCoreData.ZQBatchFCREDIT.asfloat := FixAmt(ADmCoreData.ZQBatchFCREDIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFDEBIT.asfloat := FixAmt(ADmCoreData.ZQBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFTaxAmount.asfloat := FixAmt(ADmCoreData.ZQBatchFTaxAmount.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);


        LastTaxAmount := ADmCoreData.ZQBatchFTaxAmount.asfloat ;
        ADmCoreData.ZQBatch.Post;

        //Stock/Sales accounts
        ADmCoreData.ZQBatch.Append;
        Inc(BatLine);
        ADmCoreData.ZQBatchWLineID.Value:= BatLine;
        ContraLineID := BatLine ;
       if ProjectID <> 0 then
           ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;        
        ADmCoreData.ZQBatchWLINKEDID.AsInteger := DebCreditLineId ;
        ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
        ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        if MergeItems then
        ADmCoreData.ZQBatchSDescription.Value := ADmCoreData.ZQDocHeadSDocNo.AsString +'/' + ADmCoreData.ZQDocHeadSREFERENCE.AsString 
            else
        ADmCoreData.ZQBatchSDescription.Value := _ReadDescription(ADmCoreData.ZQDocLineWDescriptionID.Value) ;
        ADmCoreData.ZQContraAccount.close ;
        // Sylvain
        if IdDocType<12 then// Invoice and Credit notes
          begin
            // done : Pieternew Allow for account to come from debtor .
            IF (DefaultAccountIdFromDebCred <> 0 ) and (DefaultAccountIdFromDebCred <> -1 ) then
            ADmCoreData.ZQContraAccount.ParamByName('WAccountId').AsInteger := DefaultAccountIdFromDebCred
            else
            ADmCoreData.ZQContraAccount.ParamByName('WAccountId').AsInteger :=   ADmCoreData.ZQStockWSaleSACCOUNTID.AsInteger ;



          end
        else // Purchases and Goods Returned
          begin
           // done : Pieternew Allow for account to come from creditor.
            IF (DefaultAccountIdFromDebCred <> 0 ) and (DefaultAccountIdFromDebCred <> -1 ) then
            ADmCoreData.ZQContraAccount.ParamByName('WAccountId').AsInteger := DefaultAccountIdFromDebCred
             else
             ADmCoreData.ZQContraAccount.ParamByName('WAccountId').AsInteger :=   ADmCoreData.ZQStockWStockAccountID.AsInteger ;
          end;
        //02/8

       if ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger = 6 then
           ADmCoreData.ZQContraAccount.ParamByName('WAccountId').AsInteger := ADmCoreData.ZQDocLineWACCOUNTID.AsInteger ;

        ADmCoreData.ZQContraAccount.open ;

         if  ADmCoreData.ZQContraAccount.IsEmpty then
             Raise Exception.Create('Contra Account is not found for ' + ADmCoreData.ZQStockSDESCRIPTION.AsString );

        ADmCoreData.ZQBatchWAccountID.Value:= ADmCoreData.ZQContraAccountWACCOUNTID.Value;
        ADmCoreData.ZQBatchSACCOUNT.Value := ADmCoreData.ZQContraAccountSMAINACCOUNTCODE.Value + '-' + ADmCoreData.ZQContraAccountSSUBACCOUNTCODE.Value;
        Case IdDocType of
        11,12,16:Begin
             ADmCoreData.ZQBatchFDEBIT.Value := ADmCoreData.ZQDocLineFExclusiveAmt.Value; //Credit Notes , Purcahses
           end;
        else
          ADmCoreData.ZQBatchFCREDIT.Value := ADmCoreData.ZQDocLineFExclusiveAmt.Value;  //Invoives , Goods Ret
        end;
        ADmCoreData.ZQBatchFCREDIT.Value := FixAmt(ADmCoreData.ZQBatchFCREDIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFDEBIT.Value := FixAmt(ADmCoreData.ZQBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFTaxAmount.Value := FixAmt(-LastTaxAmount,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);

        ADmCoreData.ZQBatchWTAXID.AsInteger := LastTaxAcount;
        ADmCoreData.ZQBatchSTAX.AsString :=  TaxAcc ;
        // check account and tax
        MainAccountLinkedTaxId  := DMTCCoreLink.OpenSqlReturnFirstColumn('Select WTaxAccount from account where WAccountid=' + ADmCoreData.ZQBatchWAccountID.AsString ) ;

        if VarToStr(MainAccountLinkedTaxId) <> '' then
          begin
            if  ADmCoreData.ZQBatchWTAXID.AsInteger <> MainAccountLinkedTaxId then
             if ReadReportOp('cbStrictTaxRef',false).AsBoolean then
              raise Exception.create('Error processing ' + ADmCoreData.ZQDocHeadSDOCNO.AsString +' Item ' + ADmCoreData.ZQStockSSTOCKCODE.AsString + ' has incoorect tax setting! ' + #13+#10 + 'Expected tax account '  +  TDataBaseRoutines.GetAccountCode(MainAccountLinkedTaxId) +' actaul ' + TDataBaseRoutines.GetAccountCode(ADmCoreData.ZQBatchWTAXID.AsInteger));

          end;
        ADmCoreData.ZQBatch.Post;
        //Tax accounts
        // select a.FRate,a.BLinkContra,a.WLinkTaxID,b.FRate Tax2Rate from TAX a left join tax b on (a.WLinkTaxId = b.WaccountId)
        // Handel 2 taxrates if linked to tax

        if (ADmCoreData.ZQDocLineFTaxAmount.Value<>0) AND ((ADmCoreData.ZQDocLineWTaxID.AsInteger=0) or (ADmCoreData.ZQBatchSACCOUNT.AsString='')) then
        begin
          SMsgErr := gettextlang(2177);
          Result := 2041;
          DoExit;
          exit;
        end;
        ADmCoreDataBatch.ZQRTaxRates.Close;
        ADmCoreDataBatch.ZQRTaxRates.Params[0].AsInteger := ADmCoreData.ZQDocLineWTaxID.Value ;
        ADmCoreDataBatch.ZQRTaxRates.Params[1].AsInteger := ADmCoreData.ZQDocLineWTaxID.Value ;
        ADmCoreDataBatch.ZQRTaxRates.open;
        while not ADmCoreDataBatch.ZQRTaxRates.eof do

        begin
        if ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger =0  then
          begin
            ADmCoreDataBatch.ZQRTaxRates.next ;
            Continue ;
          end;

        ADmCoreData.ZQBatch.Append;
        Inc(BatLine);
        LastTaxRate := GetTaxRateOnId(ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger,false) - 1;
        ADmCoreData.ZQBatchWLineID.Value:= BatLine;
       if ProjectID <> 0 then
           ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;        
        ADmCoreData.ZQBatchWLINKEDID.AsInteger := ContraLineID ;
        ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
        ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        //

        //02/8
        ADmCoreData.ZQBatchWAccountID.Value:= ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger;
        ADmCoreData.ZQBatchSACCOUNT.Value :=TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger) ;

        Case IdDocType of
        18:Begin
             ADmCoreData.ZQBatchSDescription.Value := 'adjustment '+AddDocRef;
             if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
               begin
                  if (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                   ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                   else
                   ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate ;  //Credit Notes , Purcahses
               end else
                   ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate ;  //Credit Notes , Purcahses
           end;
        19:begin
             ADmCoreData.ZQBatchSDescription.Value :=   'Adjustment '+AddDocRef;
              if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
                begin
                  if (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                     ADmCoreData.ZQBatchFDebit.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                    else
                     ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  // Goods Ret
                end else
                ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  // Goods Ret
           end;
        11:Begin
             ADmCoreData.ZQBatchSDescription.Value := gettextlang(2152)+' '+AddDocRef;
             if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
               begin
                  if (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                   ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                   else
                   ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate ;  //Credit Notes , Purcahses
               end else
                   ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate ;  //Credit Notes , Purcahses
           end;
        12:Begin
              ADmCoreData.ZQBatchSDescription.Value := {'Purchase'}gettextlang(2153)+' '+AddDocRef;
             if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
               begin
                 if  (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                   ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                   else
                   ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  //Purcahses
               end
               else
               ADmCoreData.ZQBatchFDEBIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  //Purcahses
             end;
        13:begin
             ADmCoreData.ZQBatchSDescription.Value := {'Goods Returned'}gettextlang(2154)+' '+AddDocRef;
              if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1) then
                begin
                  if (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                     ADmCoreData.ZQBatchFDebit.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                    else
                     ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  // Goods Ret
                end else
                ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  // Goods Ret
           end;
        else
           Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Invoice'}gettextlang(2155)+' '+AddDocRef;
              if (ADmCoreDataBatch.ZQRTaxRatesBLINKCONTRA.AsInteger = 1)  then
                begin
                  if (ADmCoreDataBatch.ZQRTaxRatesWACCOUNTID.AsInteger = ADmCoreData.ZQDocLineWTaxID.AsInteger) then
                  ADmCoreData.ZQBatchFDebit.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate
                   else
                  ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  //Invoives
                end else
                 ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFEXCLUSIVEAMT.AsFloat *  LastTaxRate;  //Invoives
           end;
        end;
        if LastTaxRate = 1 then
          begin
           if (IdDocType in  [18,11,12]) then
            ADmCoreData.ZQBatchFDebit.AsFloat := ADmCoreData.ZQDocLineFINCLUSIVEAMT.AsFloat
              else
            ADmCoreData.ZQBatchFCREDIT.AsFloat := ADmCoreData.ZQDocLineFINCLUSIVEAMT.AsFloat ;
          end;
        ADmCoreData.ZQBatchFCREDIT.AsFloat := FixAmt(ADmCoreData.ZQBatchFCREDIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFDEBIT.AsFloat := FixAmt(ADmCoreData.ZQBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFTaxAmount.AsFloat := FixAmt(ADmCoreData.ZQBatchFTaxAmount.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatch.Post;
        TotalTax := totaltax + ADmCoreData.ZQBatchFDEBIT.AsFloat - ADmCoreData.ZQBatchFCREDIT.AsFloat;
        ADmCoreDataBatch.ZQRTaxRates.next ;
        end;
  end;   // end do Stockbatch
  Var LinkTrnList : TStringlist ;
      DefCostId : Integer ;
      DoCostOfSale : Boolean ;
      AStockPointer : TStockRecPointer ;
      AFoundDiv,AOrgTotal : Double ;

begin
 FinPaymentsAdded := false ;
 AFoundDiv := 0 ;
 SendMessageToPosDocPlugin('START=1'+#13+#10+'DOCID='+ IntToStr(DocId));
  LastStockTypeString := DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] ;
      LinkTrnList := TStringlist.create ;
      try

 // create table for use as after start transaction it can not bee seen.
 // please create this before the transaction
  MergeItems := ReadReportOp('STKMergItemsOnLed',false).AsBoolean;
  dmDatabase.CreateBatch('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) ;
  ClearTable('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser));
  if MyADmCoreDataBatch = nil then
  ADmCoreDataBatch := TDMCoreData.Create(nil)
    else
   ADmCoreDataBatch := MyADmCoreDataBatch ;
  try
  if MyADmCoreData  = nil then
  ADmCoreData := TDMCoreDocData.Create(nil) else
  ADmCoreData :=  MyADmCoreData ;
  try
  Randomize ;
  ADmCoreData.donotChangePurchasePrice := DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGINC',false) ;

  ASaveList := TSaveClientDatasetCallList.create ;
  try
   ASaveList.AddclientObject(dmDatabase.tblSysVars,true);
   ASaveList.AddclientObject(dmDatabase.tblUser,true);   

 ADmCoreData.ZQBOM.SQL.text := 'select * from BOM where WStockId = :ID' ;
 if DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE' then
   ADmCoreData.ZQDocLine.SQL.Text := ' Select 0 IDX,a.WDOCLINEID, a.WDOCID, a.WSTOCKID, a.WLINETYPEID, a.WDESCRIPTIONID, a.FQTYORDERED, a.FQTYSHIPPED, a.FSELLINGPRICE, a.FITEMDISCOUNT, a.WTAXID,'+
   '   a.FEXCLUSIVEAMT, a.FINCLUSIVEAMT, a.FTAXAMOUNT, a.DSYSDATE, a.SUNIT, a.SSTOCKCODE,   a.WPROFILEID, a.WSERIALNOID, a.WSORTNO, a.WREPORTINGGROUP1ID, a.WREPORTINGGROUP2ID, '+
   '     a.WACCOUNTID, FUNITQTY  from docline a where  a.Wdocid = :Wdocid union  select a.WDOCLINKED_ID,a.WDOCLINEID, a.WDOCID, a.WSTOCKID, a.WLINETYPEID, a.WDESCRIPTIONID, '+
   '  a.FQTYORDERED, a.FQTYSHIPPED, a.FSELLINGPRICE, a.FITEMDISCOUNT, a.WTAXID,   a.FEXCLUSIVEAMT, a.FINCLUSIVEAMT, a.FTAXAMOUNT, a.DSYSDATE, a.SUNIT, a.SSTOCKCODE, '+
   '    a.WPROFILEID, a.WSERIALNOID, a.WSORTNO, a.WREPORTINGGROUP1ID, a.WREPORTINGGROUP2ID,     a.WACCOUNTID, FUNITQTY   from DOCLINE_LINKED a where  a.Wdocid = :Wdocid2'  ;


 ADmCoreData.ZQDocLine.close ;
 ADmCoreData.ZQDocHead.close ;
 ADmCoreData.ZQDoclineOptions.close ;

 ADmCoreData.ZQDocHead.ParamByName('WDocId').AsInteger := DocId ;

 if DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE' then
  ADmCoreData.ZQDocLine.ParamByName('WDocId2').AsInteger := DocId ;

 ADmCoreData.ZQDocLine.ParamByName('WDocId').AsInteger := DocId ;
 ADmCoreData.ZQDoclineOptions.ParamByName('WDocId').AsInteger := DocId ;

 ADmCoreData.ZQDoclineOptions.open ;
 ADmCoreData.ZQDocHead.open ;
 // Do normal stock deduction things for pos process
 if ADmCoreData.ZQDocHeadWSOURCETYPEID.AsInteger <> 0 then
    DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] := 'False' ;

 ADmCoreData.ZQDocLine.open ;
 PaymentDate := ADmCoreData.ZQDocHeadDDUEDATE.AsDateTime ;
 // se if we canpost
 Result := CanPostDoc(ADmCoreData.ZQDocHeadDDate.Value,ADmCoreData.ZQDocHeadWAccountID.Value);
 if result <> 0 then exit ;
 // never post a posted doc.
 if ADmCoreData.ZQDocHeadBposted.AsInteger =1 then
    exit ;

 FilterDocLine ;


    // Posting Documents
   {Check Here if the Document can be posted}
   {Check    - if Account is Disabled}
   {         - if Date falls in a correct and open for post Period}
   // Compleet rewrite for SQL bases processing.
   // Pieter Valentijn
   // First part determain the batch name
  OK := True;
  TotalTax := 0 ;
  IdDocType := ADmCoreData.ZQDocHeadWTypeID.AsInteger;
   // todo : Why this low stuff ??
   // and not the normal way of creating a batch ?
   // ok i have seen a other way of creating a batch lets try to keep it default.
   ADmCoreData.ZQBatch.close ;

    try
    if TDataBaseRoutines.TableExist('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) then
    begin
      ADmCoreData.BatchName := 'POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser) ;
      ADmCoreData.ZQBatch.Open;
      ADmCoreData.ZQDocLine.First;
      // See what account this is and select its details
      ADmCoreData.ZQAccount.ParamByName('WAccountId').AsInteger := ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger ;
      ADmCoreData.ZQDebtor.ParamByName('WAccountId').AsInteger := ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger ;
      ADmCoreData.ZQCreditor.ParamByName('WAccountId').AsInteger := ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger ;
      ADmCoreData.ZQAccount.Open ;
      ADmCoreData.ZQDebtor.Open ;
      ADmCoreData.ZQCreditor.Open ;
      ProjectID := ADmCoreData.ZQDocHeadWJOBCODEID.AsInteger ;

    DefaultAccountIdFromDebCred := 0 ;
   if not ADmCoreData.ZQAccount.IsEmpty then
      begin
       case ADmCoreData.ZQAccountWAccountTypeID.AsInteger of
        1 : begin
             DefaultAccountIdFromDebCred :=   ADmCoreData.ZQDocHeadWCONTRAACCOUNT.AsInteger ;
             if DefaultAccountIdFromDebCred <> 0 then
             if TDataBaseRoutines.GetAccountType(DefaultAccountIdFromDebCred) <> 0 then
               raise Exception.Create('Contra account' + TDataBaseRoutines.GetAccountFullDescription(DefaultAccountIdFromDebCred) +' is a debtor, creditor, bank or tax account! This is not allowed!');
            end;
        2 : begin
             DefaultAccountIdFromDebCred := ADmCoreData.ZQDocHeadWCONTRAACCOUNT.AsInteger ;
             if DefaultAccountIdFromDebCred <> 0 then
             if TDataBaseRoutines.GetAccountType(DefaultAccountIdFromDebCred) <> 0 then
               raise Exception.Create('Contra account' + TDataBaseRoutines.GetAccountFullDescription(DefaultAccountIdFromDebCred) +' is a debtor, creditor, bank or tax account! This is not allowed!');
            end;
         end;
      end;

      // Sylvain
      BatLine:=0;
    if not (ADmCoreData.ZQDocHeadWTYPEID.AsInteger in [18,19,17,16]) then
    begin

      while not ADmCoreData.ZQDocLine.EOF do
      begin
        ADmCoreData.ZQStock.close ;
        ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger :=  ADmCoreData.ZQDocLineWSTOCKID.AsInteger ;
        ADmCoreData.ZQStock.open ;
        // look if its Bom


        DoStockBatch ;
        if result = 2040 then
           Raise Exception.Create(SMsgErr) ;
        ADmCoreData.ZQDocLine.Next;
      end;  // End while
      ADmCoreData.ZQDocLine.Filtered := False;
      ADmCoreData.ZQDocLine.Filter := '';


      //consolidate them
      dmDatabase.qGen.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('Batch_consolidate');
      dmDatabase.qGen.open ;
      dmDatabase.qGen.last ;
      // force get all records
      dmDatabase.qGen.First ;
      ADmCoreData.ZQBatch.close ;
      //exit ;
      ClearTable(ADmCoreData.BatchName);
      ADmCoreData.ZQBatch.Open ;
      BatLine := 0 ;
      while not dmDatabase.qGen.Eof do
        begin
           Inc(BatLine);
           ADmCoreData.ZQBatch.Insert ;
           for i := 0 to dmDatabase.qGen.FieldCount - 1 do
             if ADmCoreData.ZQBatch.FindField(dmDatabase.qGen.fields[i].FieldName) <> nil then
               begin
                if (ADmCoreData.ZQBatch.FindField(dmDatabase.qGen.fields[i].FieldName).DataType in [ftFloat]) then
                  begin
                   if not dmDatabase.qGen.fields[i].IsNull then
                   ADmCoreData.ZQBatch.FindField(dmDatabase.qGen.fields[i].FieldName).AsFloat := FixAmt(dmDatabase.qGen.fields[i].AsFloat,dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals) ;


                 end else
                 begin
                   ADmCoreData.ZQBatch.FindField(dmDatabase.qGen.fields[i].FieldName).Value := dmDatabase.qGen.fields[i].Value ;
                  end;

               end;
           ADmCoreData.ZQBatchWLINEID.AsInteger := BatLine ;
           if ADmCoreData.ZQBatchWACCOUNTID.AsInteger <>  ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger then
            if ADmCoreData.ZQBatchFTAXAMOUNT.AsFloat <> 0 then
              if  FirstProffLossLine = 0 then
                FirstProffLossLine := BatLine ;
           ADmCoreData.ZQBatch.Post ;
           dmDatabase.qGen.next ;
        end;


      //Write the new batch ID
      ADmCoreDataBatch.ZQBatchControl.sql.text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl');

      ADmCoreDataBatch.ZQBatchControl.Open;
      dmDatabase.tblSysVars.Open;

      if ReadReportOp('BUseGeneralNumber','false').Asboolean then
      begin
        Case idDocType of
      11:BatchTypeID:=    DMTCCoreLink.ReadSysParam('ICreditBatch',dmDatabase.tblSysVarsWCREDITNOTEBATCHTYPEID.AsInteger , StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0))) );
      12:BatchTypeID:= DMTCCoreLink.ReadSysParam('IPurchasBatch',dmDatabase.tblSysVarsWPURCHASESBATCHID.AsInteger , StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0))) );
      13:BatchTypeID:= DMTCCoreLink.ReadSysParam('IReturnBatch',dmDatabase.tblSysVarsWGOODSRETURNEDBATCHID.AsInteger , StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0))) );
      else
        BatchTypeID:= DMTCCoreLink.ReadSysParam('IInvbatch',dmDatabase.tblSysVarsWINVOICESBATCHID.AsInteger , StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0))) );
      end;

 


      end else
      begin
      Case idDocType of
      11:BatchTypeID:=   dmDatabase.tblSysVarsWCreditNoteBatchTypeID.Value;
      12:BatchTypeID:= dmDatabase.tblSysVarsWPurchasesBatchID.Value;
      13:BatchTypeID:= dmDatabase.tblSysVarsWGoodsReturnedBatchID.Value;
      else
        BatchTypeID:= dmDatabase.tblSysVarsWInvoicesBatchID.Value;
      end;
      end;
     ADmCoreDataBatch.AppendBatchControlId(CurrentUser,currentUser,BatchTypeID,1,0) ;
     ADmCoreDataBatch.ZQBatchControl.edit ;
     ADmCoreDataBatch.ZQBatchControlBDocSource.Value:=1;
     aDmCoreDataBatch.ZQBatchControlWDocID.value := ADmCoreData.ZQDocHeadWDocID.Value;
     ADmCoreDataBatch.ZQBatchControlSAlias.Value:= ADmCoreData.ZQDocHeadSDocNo.Value;
     ADmCoreDataBatch.ZQBatchControl.post ;

   // Totalize the total for debtor or creditor.
      // So if theres 2 taxes used the amounts on the debtor / creditor is just 1.
      // Pieter 2005 03 15

      AOrgTotal := ADmCoreData.ZQDocHeadFDOCAMOUNT.AsFloat ;
      if  (idDocType  in [11,12]) then
         AOrgTotal := - AOrgTotal ;
     if dmDatabase.SetOfBooksPropertys.CompanyInfo.TaxBased =  tbInvoice then
      begin
        ADmCoreData.ZQBatch.Filtered := False;
        ADmCoreData.ZQBatch.Filter := 'WAccountID = '+ IntToStr(ADmCoreData.ZQDocHeadWAccountID.Value);
        ADmCoreData.ZQBatch.Filtered := True;
        ADmCoreData.ZQBatch.first ;
        Total := 0 ;
        TotalTax := 0 ;
        if ADmCoreData.ZQBatch.RecordCount > 1 then
        begin
          while not  ADmCoreData.ZQBatch.eof do
            begin
            Total := Total + (ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value);
            TotalTax := TotalTax + ADmCoreData.ZQBatchFTAXAMOUNT.AsFloat ;
            ADmCoreData.ZQBatch.next ;
            end;
           // used for consolidation of the taxe transactions on the debtor or creditor account
           // delete all other lines.
           ExecSql(' delete from ' +   ADmCoreData.BatchName +
           ' where WAccountID=' + IntToStr(ADmCoreData.ZQDocHeadWAccountID.Value) +
           ' and WLineID <> ' + IntToStr(ADmCoreData.ZQBatchWLINEID.AsInteger));
           FirstDeblineid := ADmCoreData.ZQBatchWLINEID.AsInteger ;
           ADmCoreData.ZQBatch.close;
           ADmCoreData.ZQBatch.Open;
           if (AOrgTotal <>  (Total)) then
             begin
               AFoundDiv :=  (AOrgTotal -  (Total));
              // TotalTax :=TotalTax - AFoundDiv ;
               Total := Total + AFoundDiv ;
             end;
           SetDebitCreditWithAmount(Total,TotalTax);
            
        end else
        begin
          if (AOrgTotal <> abs(Total)) then
             begin
               AFoundDiv :=  (AOrgTotal -  abs(Total));
               TotalTax :=TotalTax + AFoundDiv ;
               Total := Total + AFoundDiv ;
             end;
          Total := (ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value);
          TotalTax := ADmCoreData.ZQBatchFTAXAMOUNT.AsFloat ;
          AFoundDiv := 0;
        end;


        ExecSql('update ' +   ADmCoreData.BatchName + ' set WLINKEDID ='  + IntToStr(ADmCoreData.ZQBatchWLINEID.AsInteger)  ) ;
        // count total with the total of the debtor as main point

        ADmCoreData.ZQBatch.Filtered := False;
        ADmCoreData.ZQBatch.Filter := 'WAccountID <> '+ IntToStr(ADmCoreData.ZQDocHeadWAccountID.Value);
        ADmCoreData.ZQBatch.Filtered := True;

        TotalTax := 0 ;
        While not ADmCoreData.ZQBatch.Eof do
           begin
               TotalTax  := TotalTax + (ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value) ;
               if AFoundDiv <> 0.00 then
                  begin
                   TotalTax  := TotalTax + AFoundDiv ;
                   if TotalTax < 0 then
                    begin
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set FCREDIT = FCREDIT + ' + StringReplace(FloatToStr(RoundAmount(-AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger));
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set  FTAXAMOUNT =  FTAXAMOUNT + ' + StringReplace(FloatToStr(RoundAmount(AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(FirstProffLossLine)) ;
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set  FTAXAMOUNT =  FTAXAMOUNT + ' + StringReplace(FloatToStr(RoundAmount(AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(FirstDeblineid)) ;
                    end  else
                    begin
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set FDEBIT = FDEBIT + ' + StringReplace(FloatToStr(RoundAmount(AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger)) ;
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set  FTAXAMOUNT =  FTAXAMOUNT + ' + StringReplace(FloatToStr(RoundAmount(-AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(FirstProffLossLine)) ;
                     ExecSql('Update ' +   ADmCoreData.BatchName + ' set  FTAXAMOUNT =  FTAXAMOUNT + ' + StringReplace(FloatToStr(RoundAmount(-AFoundDiv)),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(FirstDeblineid)) ;
                    end;
                   AFoundDiv := 0 ;
                 end;
               ADmCoreData.ZQBatch.next ;
           end;


      //  TotalTax := AOrgTotal ;
        if  TotalTax <> -Total then
           begin
             if   abs(Total) -  abs(TotalTax) > 2 then
              begin
              raise Exception.create('Fault in rounding please set your rounding margin document:' + ADmCoreData.ZQDocHeadSDocNo.AsString +' of ' + FloatToStr(abs(Total) -  abs(TotalTax))) ;
              end;

             Total := (Total) +  (TotalTax);

             if TotalTax < 0 then

               ExecSql('Update ' +   ADmCoreData.BatchName + ' set FCREDIT = FCREDIT + ' + StringReplace(FloatToStr(RoundAmount((Total))),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger))
             else
               ExecSql('Update ' +   ADmCoreData.BatchName + ' set FDEBIT = FDEBIT + ' + StringReplace(FloatToStr(RoundAmount((Total))),DecimalSeparator,'.',[]) + ' where WLineid = ' + InTToStr(ADmCoreData.ZQBatchWLINEID.AsInteger)) ;
           end;

        ADmCoreData.ZQBatch.Filtered := False;
        ADmCoreData.ZQBatch.Filter := '';
        ADmCoreData.ZQBatch.close ;
        ADmCoreData.ZQBatch.open ;
        ADmCoreData.ZQBatch.First;


      end ; // end Totalize the total for debtor or creditor.


        // Now Only Pop up For Credit-note and Goods Returned
        if idDocType in [10,11] then // Provide for all Documents
          FirstAccID := 1
        else
          FirstAccID := 2;
        // Check and Set Oitem Links
        if ADmCoreData.ZQBatch.Locate('WaccountID',ADmCoreData.ZQDocHeadWaccountID.Value,[]) then
        begin

          if BCheckOpenItem(ADmCoreData.ZQDocHeadWaccountID.Value)<>0 then
          begin
            // It's OItem Account
            //Total := Abs(ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value);
            Total := ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value;
            BatLinkedID := ADmCoreData.ZQBatchWlineID.AsInteger;
            if AutoLink then

            else
            if not ReadNwReportOp(IntToStr(BatchTypeID)  + 'BNoOpenItem',false).AsBoolean then
              CanRunOpenItem(dmDatabase.tblBatchSReference.AsString,dmDatabase.tblBatchDDATE.AsDateTime, dmDatabase.TblbatchWAccountID.asInteger,ADmCoreDataBatch.ZQBatchControlWBatchID.AsInteger,FirstAccID,ToTal,BatLinkedID,false,ADmCoreData.ZQBatchSDESCRIPTION.AsString);
          end;
        end;

      {Just Keep The Batch Control ID}
      FirstAccID:= ADmCoreDataBatch.ZQBatchControlWBatchID.Value;
      FinPaymentsAdded := false ;
      // Add financials (payments)
      ADmCoreData.zqDocLine.Filtered := False;
      ADmCoreData.zqDocLine.Filter := '(WLineTypeID=93)';
      ADmCoreData.zqDocLine.Filtered := True;
      ADmCoreData.zqDocLine.First ;

    while not ADmCoreData.ZQDocLine.EOF do
      begin
        // argfsdagsdfgfsdg
        DMTCCoreLink.stockObject.getStockOnid(AStockPointer,ADmCoreData.ZQDocLineWSTOCKID.AsInteger);
        if AStockPointer^.WStockTypeId = 10 then
          begin
           ADmCoreData.ZQDocLine.next ;
           Continue ;

          end;
        FinPaymentsAdded := true ;
        //add the debtors or Creditor entry
        ADmCoreData.ZQBatch.First;
        ADmCoreData.ZQBatch.Insert;
        Inc(BatLine);
        DebCreditLineId := BatLine ;
        if ProjectID <> 0 then
           ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;
        ADmCoreData.ZQBatchWLineID.AsInteger:= BatLine;
        ADmCoreData.ZQBatchWLINKEDID.AsInteger := BatLine;
        ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
        ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDPAYMENTDATE.AsDateTime := PaymentDate ;
        ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        //2/8
        AccountID:=  ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger;
        ADmCoreData.ZQBatchWAccountID.value:=AccountID;
        ADmCoreData.ZQBatchWCONTRAACCOUNTID.AsInteger := ADmCoreData.ZQDocLineWACCOUNTID.AsInteger ;

        ADmCoreData.ZQBatchBExclusive.Value:=1 ;
        Case IdDocType of
        11:begin
             ADmCoreData.ZQBatchSDescription.Value := {'Credit note'} gettextlang(2152)+' '+AddDocRef;
             ADmCoreData.ZQBatchFCREDIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;//Credit Notes
           end;
        12,17:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Purchase'} gettextlang(2153)+' '+AddDocRef;
             ADmCoreData.ZQBatchFCREDIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;// Purcahses
           end;
        13:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Goods Returned'} gettextlang(2154)+' '+AddDocRef;
             ADmCoreData.ZQBatchFDEBIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Goods Ret
           end;
        else
           begin
              ADmCoreData.ZQBatchSDescription.Value := {'Invoice'} gettextlang(2155)+' '+AddDocRef;
              ADmCoreData.ZQBatchFDEBIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Invoives
           end;
        end;
        ADmCoreData.ZQBatchFCREDIT.asfloat := FixAmt(ADmCoreData.ZQBatchFCREDIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFDEBIT.asfloat := FixAmt(ADmCoreData.ZQBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatch.Post;

        ADmCoreData.ZQBatch.Insert;
        Inc(BatLine);

        if ProjectID <> 0 then
           ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;
        ADmCoreData.ZQBatchWLineID.AsInteger:= BatLine;
        ADmCoreData.ZQBatchWLINKEDID.AsInteger := DebCreditLineId;
        ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
        ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
        ADmCoreData.ZQBatchDPAYMENTDATE.AsDateTime := PaymentDate ;
        ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
        ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
        //2/8
        AccountID:=  ADmCoreData.ZQDocLineWACCOUNTID.AsInteger;
        ADmCoreData.ZQBatchWAccountID.value:=AccountID;
        ADmCoreData.ZQBatchBExclusive.Value:=1  ;
        Case IdDocType of
        11:begin
             ADmCoreData.ZQBatchSDescription.Value := {'Credit note'} gettextlang(2152)+' '+AddDocRef;
             ADmCoreData.ZQBatchFDEBIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;//Credit Notes
           end;
        12,17:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Purchase'} gettextlang(2153)+' '+AddDocRef;
             ADmCoreData.ZQBatchFDEBIT.Value := ADmCoreData.ZQDocLineFinclusiveAmt.Value;// Purcahses
           end;
        13:Begin
             ADmCoreData.ZQBatchSDescription.Value := {'Goods Returned'} gettextlang(2154)+' '+AddDocRef;
             ADmCoreData.ZQBatchFCREDIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Goods Ret
           end;
        else
           begin
              ADmCoreData.ZQBatchSDescription.Value := {'Invoice'} gettextlang(2155)+' '+AddDocRef;
              ADmCoreData.ZQBatchFCREDIT.asfloat := ADmCoreData.ZQDocLineFinclusiveAmt.Value;  //Invoives
           end;
        end;
        ADmCoreData.ZQBatchFCREDIT.asfloat := FixAmt(ADmCoreData.ZQBatchFCREDIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatchFDEBIT.asfloat := FixAmt(ADmCoreData.ZQBatchFDEBIT.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals);
        ADmCoreData.ZQBatch.Post;

        ADmCoreData.ZQDocLine.Next;
      end;  // End while
      ADmCoreData.ZQDocLine.Filtered := False;
      ADmCoreData.ZQDocLine.Filter := '';
      // end financial transactions (payments)


      //post the batch
      AccountID := ADmCoreData.ZQDocHeadWACCOUNTID.AsInteger ;
      ADmCoreData.ZQBatch.Close;
      dmDatabase.tblBatch.TableName := ADmCoreData.BatchName ;
      dmDatabase.tblBatch.open ;
      dmDatabase.tblBatch.first;
      DefCostId := DMTCCoreLink.ReadNwReportOp(IntToStr(BatchTypeID) + 'DefCostCen',0) ;
      WTrans:=-1;

      while not dmDatabase.tblBatch.EOF do
      begin
         { if (dmDatabase.tblBatchWAccountID.Value= AccountID)and  (WTrans = -1) then
            begin

            end;    }
        LrPostBatchLine(ADmCoreDataBatch,BatchTypeID,Tmp,FirstAccID,ADmCoreData.ZQDocHeadWDOCID.AsInteger,false,false,DefCostId);
        if (dmDatabase.tblBatchWAccountID.Value= AccountID)and  (WTrans = -1) then
            begin
              if  ADmCoreData.ZQDocHeadWOPENITEMTRANSACTID.AsInteger > 0 then
                 begin
                    linkTransaction(Tmp,ADmCoreData.ZQDocHeadWOPENITEMTRANSACTID.AsInteger,dmDatabase.tblBatchWAccountID.Value, -(dmDatabase.tblBatchFDEBIT.Value - dmDatabase.tblBatchFCREDIT.Value));
                    TDataBaseRoutines.ExecSql('update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT  + ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(dmDatabase.tblBatchFDEBIT.Value - dmDatabase.tblBatchFCREDIT.Value) +' where wtransactionid in (' +   IntToStr(ADmCoreData.ZQDocHeadWOPENITEMTRANSACTID.AsInteger) + ')') ;
                    TDataBaseRoutines.ExecSql('update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT - ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat( dmDatabase.tblBatchFDEBIT.Value - dmDatabase.tblBatchFCREDIT.Value) +' where wtransactionid in (' +  IntToStr(Tmp)  + ')') ;
                 end;

               WTrans:=Tmp;
               ExecSql('Update dochead set WOPENITEMTRANSACTID = ' +IntToStr(Tmp)+ 'where WDocid =' + IntToStr(DocId)) ;
            end;


          // Update oilinks
          DMTCCoreLink.ExecSql('Delete from oilinks where (Unused1 = -2 or Unused1 = -1) and WBatchid =  ' + IntToStr(FirstAccID));
        if (dmDatabase.tblBatchWAccountID.Value = AccountID) then
           LinkTrnList.AddObject(FloatToStr(dmDatabase.tblBatchFDEBIT.AsFloat-dmDatabase.tblBatchFCREDIT.AsFloat),Tobject(Tmp)) ;

        dmDatabase.tblBatch.Next;
      end;
      DMTCCoreLink.HandelCheckBatchDiv(FirstAccID);


      end; // end doctype not 18,19
     DoCostOfSale := True ;
  //   if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
 //      if (ADmCoreData.ZQDocHeadWTYPEID.AsInteger in [10,11,12,13]) then
 //       if ADmCoreData.ZQDocHeadWSOURCETYPEID.AsInteger = 0 then
 //       DoCostOfSale := False ;



      if DoCostOfSale then
       begin
       dmDatabase.tblBatch.Close;
       ClearTable(dmDatabase.tblBatch.TableName);

       dmDatabase.tblSysVars.Open;

       BAvgCos := dmDatabase.tblSysVarsBUseAvgCost.Value=1;

       ADmCoreData.ZQBatch.Open ;
       // Stock transactions
       ADmCoreData.ZQDocLine.First ;
       FilterDocLine ;
        while not ADmCoreData.ZQDocLine.EOF do
        begin
        CostOfSaleLevel := 0 ;
        StockHandelLevel := 0;
        if ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger  <> ADmCoreData.ZQDocLineWSTOCKID.AsInteger then
            begin
            ADmCoreData.ZQStock.close ;
            ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger :=  ADmCoreData.ZQDocLineWSTOCKID.AsInteger ;

            end;
        ADmCoreData.ZQStock.open ;
        if ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger = 10 then
           begin
             ADmCoreData.ZQDocLine.next ;
             Continue ;
           end;

        GlQtyMultiplier :=  TDataBaseStockRoutines.GetUnitQty(StrToIntDef(ADmCoreData.ZQDocLineSUNIT.asstring,0));
        if GlQtyMultiplier = 0 then GlQtyMultiplier := 1 ;

        AdSellingPrice := ADmCoreData.ZQDocLineFExclusiveAmt.Asfloat ;
        if  ADmCoreData.ZQDocLineFQtyShipped.Asfloat <> 0 then
           AdSellingPrice := AdSellingPrice / (ADmCoreData.ZQDocLineFQtyShipped.Asfloat * GlQtyMultiplier)
          else  AdSellingPrice := 0 ;

          AvgCostPerItem := 0 ;


       HandelStockForDocLine(ADmCoreData,BAvgCos,ADmCoreData.ZQDocLineWStockID.AsInteger,AdSellingPrice,ADmCoreData.ZQDocLineFQtyShipped.Asfloat*GlQtyMultiplier,ADmCoreData.ZQDocLineFQtyOrdered.Asfloat,StockHandelLevel,AvgCostPerItem) ;

   if (dmdatabase.tblSysVarsBCreateCostOfSales.Value=1) and (IdDocType in [ 10,11,18,19,16] )then
         begin

        if ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger  <> ADmCoreData.ZQDocLineWSTOCKID.AsInteger then
            begin
            ADmCoreData.ZQStock.close ;
            ADmCoreData.ZQStock.ParamByName('WStockID').AsInteger :=  ADmCoreData.ZQDocLineWSTOCKID.AsInteger ;
            end;
          ADmCoreData.ZQStock.open ;
          if not(ADmCoreData.ZQStockWSTOCKTYPEID.AsInteger in [1,9]) then
              begin
                  FillCostOFSaleForStockItem(0, ADmCoreData, AddDocRef,ADmCoreData.ZQDocLineWStockID.Value,BAvgCos,ADmCoreData.ZQDocLineFQtyShipped.AsFloat*GlQtyMultiplier,CostOfSaleLevel) ;
              end else
              begin
                  FillCostOFSaleForStockItem(AvgCostPerItem, ADmCoreData, AddDocRef,ADmCoreData.ZQDocLineWStockID.Value,BAvgCos,ADmCoreData.ZQDocLineFQtyShipped.AsFloat*GlQtyMultiplier,CostOfSaleLevel) ;
              end;
            end;
          ADmCoreData.ZQDocLine.Next;
        end;
        ADmCoreData.ZQDocLine.Filtered := False;
        ADmCoreData.ZQDocLine.Filter := '';
        //consolidate
       // if not (idDocType in [19,18]) then
        begin
        ADmCoreData.ZQBatch.First;
        FirstAcc := ADmCoreData.ZQBatchSACCOUNT.Value;
        FirstAccID := ADmCoreData.ZQBatchWAccountID.Value;
        Total  := 0;
        ADmCoreData.ZQBatch.Filtered := False;
        ADmCoreData.ZQBatch.Filter := 'WAccountID = ' + IntToStr(FirstAccID);
        ADmCoreData.ZQBatch.Filtered := True;
        if ADmCoreData.ZQBatch.RecordCount > 1 then
        begin
          while not ADmCoreData.ZQBatch.EOF Do
          begin
            Total := Total + ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value;
            ADmCoreData.ZQBatch.Delete;
          end;
          ADmCoreData.ZQBatch.Append;
          Inc(BatLine);
          if ProjectID <> 0 then
            ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;
          ADmCoreData.ZQBatchWLineID.Value:= BatLine ;
          ADmCoreData.ZQBatchWLINKEDID.AsInteger := BatLine ;
          ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
          ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
          ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
         ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
         ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;

          ADmCoreData.ZQBatchSDescription.Value := GetTextLang(1994) +AddDocRef;
          ADmCoreData.ZQBatchSACCOUNT.Value := FirstAcc;
          ADmCoreData.ZQBatchWAccountID.Value := FirstAccID;
          if Total >= 0 then
            ADmCoreData.ZQBatchFDEBIT.Value := Total
          else
           ADmCoreData.ZQBatchFCREDIT.Value := -Total ;
          ADmCoreData.ZQBatch.Post;
        end;
        ADmCoreData.ZQBatch.Filtered := False;
        ADmCoreData.ZQBatch.Filter := '';
        ADmCoreData.ZQBatch.First;
        while (ADmCoreData.ZQBatchWAccountID.Value <> FirstAccID) and (not (ADmCoreData.ZQBatch.eof))  do
        begin
          NextAcc := ADmCoreData.ZQBatchSACCOUNT.Value;
          NextAccID := ADmCoreData.ZQBatchWAccountID.Value;
          SavePlace:=ADmCoreData.ZQBatch.GetBookmark;
          ADmCoreData.ZQBatch.Filtered := False;
          ADmCoreData.ZQBatch.Filter := 'WAccountID = ' + IntToStr(NextAccID);
          ADmCoreData.ZQBatch.Filtered := True;
          if ADmCoreData.ZQBatch.RecordCount > 1 then
          begin
            Total := 0;
            while not ADmCoreData.ZQBatch.EOF do
            begin
              Total := Total + ADmCoreData.ZQBatchFDEBIT.Value - ADmCoreData.ZQBatchFCREDIT.Value;
              ADmCoreData.ZQBatch.Delete;
            end;
            ADmCoreData.ZQBatch.Append;

            if ProjectID <> 0 then
               ADmCoreData.ZQBatchSJOBCODE.AsInteger := ProjectID ;
           // BatLine := ADmCoreData.ZQBatchWLineID.Value ;
            ADmCoreData.ZQBatchWLINKEDID.AsInteger := BatLine ;
            ADmCoreData.ZQBatchSReference.Value := ADmCoreData.ZQDocHeadSDocNo.Value;
            ADmCoreData.ZQBatchDDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
            ADmCoreData.ZQBatchDAllocatedDate.Value := ADmCoreData.ZQDocHeadDDate.Value;
            ADmCoreData.ZQBatchSDescription.Value := GetTextLang(1994) +AddDocRef;
            ADmCoreData.ZQBatchWREPORTINGGROUP1ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP1ID.AsInteger ;
            ADmCoreData.ZQBatchWREPORTINGGROUP2ID.AsInteger :=  ADmCoreData.ZQDocLineWREPORTINGGROUP2ID.AsInteger ;
            ADmCoreData.ZQBatchSACCOUNT.Value := NextAcc;
            ADmCoreData.ZQBatchWAccountID.Value := NextAccID;
            if Total >= 0 then
              ADmCoreData.ZQBatchFDEBIT.Value := Total
            else
              ADmCoreData.ZQBatchFCREDIT.Value := -Total ;
            ADmCoreData.ZQBatch.Post;
            // Added by Sylvain to Fix 3.3 bug
            ADmCoreData.ZQBatch.Filtered := False;
            ADmCoreData.ZQBatch.Filter := '';
          end
          else
          begin
            ADmCoreData.ZQBatch.Filtered := False;
            ADmCoreData.ZQBatch.Filter := '';
            if ADmCoreData.ZQBatch.BookmarkValid(SavePlace) then
            ADmCoreData.ZQBatch.GotoBookmark(SavePlace);
            ADmCoreData.ZQBatch.Next;
          end;
          if SavePlace <> nil then
            ADmCoreData.ZQBatch.FreeBookmark(SavePlace);
        end;

        end; // end not special doctype
        //Write the new batch ID
        IF not ADmCoreData.ZQBatch.IsEmpty then
        begin
        ADmCoreDataBatch.ZQBatchControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl') ;
        ADmCoreDataBatch.ZQBatchControl.Open;
        dmDatabase.tblSysVars.Open;
        BatchTypeID := dmDatabase.tblSysVarsWCostOfSalesTypeID.Value;
        if BatchTypeID = 0 then
           raise Exception.Create('cost of sales batch is not set up!');
        {Just Keep The Batch Control ID}
        FirstAccID := ADmCoreDataBatch.AppendBatchControlId(CurrentUser,currentUser,BatchTypeID,1,0) ;
        ADmCoreDataBatch.ZQBatchControl.edit ;
        ADmCoreDataBatch.ZQBatchControlBDocSource.Value := 1;
        ADmCoreDataBatch.ZQBatchControlsAlias.Value:= GetTextLang(1995);
        ADmCoreDataBatch.ZQBatchControlWDocID.Value:=ADmCoreData.ZQDocHeadWDocID.Value;
        ADmCoreDataBatch.ZQBatchControl.post ;

        ADmCoreData.ZQBatch.CLose;
        dmDatabase.tblBatch.TableName := ADmCoreData.BatchName ;
        dmDatabase.tblBatch.Open;

        //post the batch
        DefCostId := DMTCCoreLink.ReadNwReportOp(IntToStr(BatchTypeID) + 'DefCostCen',0) ;

        dmDatabase.tblBatch.First;
        while not dmDatabase.tblBatch.EOF do
        begin
          LrPostBatchLine(ADmCoreDataBatch,BatchTypeID,Tmp,FirstAccID,ADmCoreData.ZQDocHeadWDOCID.AsInteger,false,false,DefCostId);
          dmDatabase.tblBatch.Next;
        end;
        DMTCCoreLink.HandelCheckBatchDiv(FirstAccID);
      end;
      dmDatabase.tblSysVars.Close;
      end; // end if not batch empty
      end ; // end docostofsale
      finally
         DoExit;
      end;

      ExecSql(dmDatabase.SQLList.GetFormatedSQLByName('InvoiceEntryGrid_UpdateDoc')+ IntToStr(DocId)) ;

   // cleanup messy doc
   TDataBaseDocumentRoutines.CleanupDochead(DocId);




      result := 0;
      ClearTable(dmDatabase.tblBatch.TableName);

    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 3 then
      begin
         DMTCCoreLink.LogAction('POSTDOC',DocId,'Post document!');
      end;

   // end;
  finally
    ASaveList.free ;
  end;
  finally
    if MyADmCoreData = nil then
    ADmCoreData.free ;
  end ;
 finally
   if MyADmCoreDataBatch = nil then
    ADmCoreDataBatch.free ;
 end;

   // Try to find items to link of.
   if FinPaymentsAdded and (LinkTrnList.Count > 1) then
         begin

            for i := 0 to LinkTrnList.Count -2 do
               begin
                  AutolinkTransaction(Integer(LinkTrnList.Objects[0]),Integer(LinkTrnList.Objects[i+1]));
               end;
         end;

   // process to plugin
   SendMessageToPosDocPlugin('END=1'+#13+#10+'DOCID='+ IntToStr(DocId));

 if DoCommit then
    begin
      try
      if DMTCCoreLink.TheZConnection.InTransaction then
          DMTCCoreLink.TheZConnection.Commit ;
       except
        on e : Exception Do
          begin
                  Result := 2103 ;
                  SMsgErr := e.Message ;
          end;
       end;
    end;



       finally
         DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] := LastStockTypeString ;
          LinkTrnList.free ;
       end;

end;
procedure ReadLedgerPeriodes(aLedgerPeriodeCollection : TLedgerPeriodeCollection);
Var
 PeriodeQuery: TuniQuery ;
begin
    aLedgerPeriodeCollection.Clear ;
    PeriodeQuery := TuniQuery.Create(nil) ;
     try
     PeriodeQuery.Connection := dmDatabase.ZMainconnection ;
     PeriodeQuery.SQL.Text := 'select * from periods where WYearID in (1,2) order by WPeriodid';
     PeriodeQuery.open ;
     while not PeriodeQuery.eof do
       begin
         with aLedgerPeriodeCollection.Add as TLedgerPeriodeItem do
          begin
           StartDate := trunc (PeriodeQuery.fieldByName('DStartDate').AsDateTime) ;
           EndDate := trunc(PeriodeQuery.fieldByName('DEndDate').AsDateTime) ;
           PeriodeId := PeriodeQuery.fieldByName('WPeriodID').AsInteger ;
           Description := PeriodeQuery.fieldByName('SDescription').AsString ;
           ShutDown := PeriodeQuery.fieldByName('BShutDown').AsInteger = 1 ;
          end;
         PeriodeQuery.next ;
       end;
    finally
       PeriodeQuery.Free ;
    end;
end;


procedure ReadStockFromDocument(aStockInvoicedCollection : TStockInvoicedCollection;ADocID : Integer);
Var
 DocQuery,StockQuery: TuniQuery ;
 aStockInvoicedItem : TStockInvoicedItem ;
begin
StockQuery := TuniQuery.Create(nil) ;
 try
 StockQuery.Connection := dmDatabase.ZMainconnection;
 StockQuery.SQL.Text := 'select * from stock where wstockid =:id';

 DocQuery := TuniQuery.Create(nil) ;
  try
     DocQuery.Connection := dmDatabase.ZMainconnection ;
     DocQuery.SQL.Text := 'select dochead.wtypeid,dochead.wAccountid, docLine.* from docLine,dochead where docline.Wdocid = dochead.wdocid and dochead.wdocid = ' + IntTOStr(ADocID) + ' and (wLinetypeid = 90 or wLinetypeid = 94)' ;
     DocQuery.open ;
     while not  DocQuery.eof do
     begin
     aStockInvoicedItem := aStockInvoicedCollection.StockItemOnStockId(DocQuery.FieldByName('WStockID').AsInteger) ;
     if aStockInvoicedItem = nil then
        begin
          aStockInvoicedItem :=  TStockInvoicedItem(aStockInvoicedCollection.add) ;
          StockQuery.Params[0].AsInteger := DocQuery.FieldByName('WStockID').AsInteger ;
          StockQuery.Open ;
          aStockInvoicedItem.InvQtyOnHand          := StockQuery.FieldByName('FInvQtyOnHand').Asfloat ;
          aStockInvoicedItem.QtyOnHand             := StockQuery.FieldByName('FQtyOnHand').Asfloat ;
          aStockInvoicedItem.StockID               := StockQuery.FieldByName('WStockID').AsInteger ;
          aStockInvoicedItem.StockCode             := StockQuery.FieldByName('SSTOCKCODE').AsString ;
          aStockInvoicedItem.StockName             := StockQuery.FieldByName('SDescription').AsString ;
          aStockInvoicedItem.SaleSACCOUNTId        := StockQuery.FieldByName('WSaleSACCOUNTID').AsInteger ;
          aStockInvoicedItem.StockControlAccountId := StockQuery.FieldByName('WStockAccountID').AsInteger ;
          aStockInvoicedItem.InputTaxAccountId     := StockQuery.FieldByName('WInputTaxID').AsInteger ;;
          aStockInvoicedItem.OutputTaxAccountId     := StockQuery.FieldByName('WOutputTaxID').AsInteger ;
          StockQuery.Close ;
        end;

        // todo : Watch it here the -10 if for ord try to stay withing bounds.
     aStockInvoicedItem.AddDocumentEntry(TDocumentType(DocQuery.FieldByName('wtypeid').AsInteger-10),
                                         DocQuery.FieldByName('Wdocid').Asfloat,
                                         DocQuery.FieldByName('FQtyOrdered').Asfloat,
                                         DocQuery.FieldByName('FQtyShipped').Asfloat,
                                         DocQuery.FieldByName('FSellingPrice').Asfloat,
                                         DocQuery.FieldByName('FInclusiveAmt').Asfloat,
                                         DocQuery.FieldByName('FExclusiveAmt').Asfloat,
                                         DocQuery.FieldByName('FTaxAmount').Asfloat,
                                         DocQuery.FieldByName('wAccountid').Asfloat,
                                         ord(DocQuery.FieldByName('wLinetypeid').asinteger = 94));
     DocQuery.next ;
     end;
     DocQuery.close ;
  finally
     DocQuery.Free ;
  end;
finally
   StockQuery.Free ;
end;
end;

procedure ReadStockFromUnposted(aStockInvoicedCollection : TStockInvoicedCollection);
Var
 DocQuery,StockQuery: TuniQuery ;
 aStockInvoicedItem : TStockInvoicedItem ;
 i : Integer ;
begin
i := 0 ;
StockQuery := TuniQuery.Create(nil) ;
_SetProgress('Caculating',0);
 try
 StockQuery.Connection := dmDatabase.ZMainconnection ;
 StockQuery.SQL.Text := 'select * from stock where wstockid =:id';

 DocQuery := TuniQuery.Create(nil) ;
  try

     DocQuery.Connection := dmDatabase.ZMainconnection;
     DocQuery.SQL.Text := 'select dochead.wtypeid,dochead.wAccountid, docLine.* from docLine,dochead where docline.Wdocid = dochead.wdocid and dochead.bposted <> 1 and (wLinetypeid = 90 or wLinetypeid = 94)' ;
     DocQuery.open ;
     _SetProgress(DocQuery.RecordCount);
     while not  DocQuery.eof do
     begin
     inc(i);
     _SetProgress('',i) ;
     aStockInvoicedItem := aStockInvoicedCollection.StockItemOnStockId(DocQuery.FieldByName('WStockID').AsInteger) ;
     if aStockInvoicedItem = nil then
        begin
          aStockInvoicedItem :=  TStockInvoicedItem(aStockInvoicedCollection.add) ;
          StockQuery.Params[0].AsInteger := DocQuery.FieldByName('WStockID').AsInteger ;
          StockQuery.Open ;
          aStockInvoicedItem.InvQtyOnHand          := StockQuery.FieldByName('FInvQtyOnHand').Asfloat ;
          aStockInvoicedItem.QtyOnHand             := StockQuery.FieldByName('FQtyOnHand').Asfloat ;
          aStockInvoicedItem.StockID               := StockQuery.FieldByName('WStockID').AsInteger ;
          aStockInvoicedItem.StockCode             := StockQuery.FieldByName('SSTOCKCODE').AsString ;
          aStockInvoicedItem.StockName             := StockQuery.FieldByName('SDescription').AsString ;
          aStockInvoicedItem.SaleSACCOUNTId        := StockQuery.FieldByName('WSaleSACCOUNTID').AsInteger ;
          aStockInvoicedItem.StockControlAccountId := StockQuery.FieldByName('WStockAccountID').AsInteger ;
          aStockInvoicedItem.InputTaxAccountId     := StockQuery.FieldByName('WInputTaxID').AsInteger ;;
          aStockInvoicedItem.OutputTaxAccountId     := StockQuery.FieldByName('WOutputTaxID').AsInteger ;
          StockQuery.Close ;
        end;

        // todo : Watch it here the -10 if for ord try to stay withing bounds.
     aStockInvoicedItem.AddDocumentEntry(TDocumentType(DocQuery.FieldByName('wtypeid').AsInteger-10),
                                         DocQuery.FieldByName('Wdocid').Asfloat,
                                         DocQuery.FieldByName('FQtyOrdered').Asfloat,
                                         DocQuery.FieldByName('FQtyShipped').Asfloat,
                                         DocQuery.FieldByName('FSellingPrice').Asfloat,
                                         DocQuery.FieldByName('FInclusiveAmt').Asfloat,
                                         DocQuery.FieldByName('FExclusiveAmt').Asfloat,
                                         DocQuery.FieldByName('FTaxAmount').Asfloat,
                                         DocQuery.FieldByName('wAccountid').Asfloat,
                                         ord(DocQuery.FieldByName('wLinetypeid').asinteger = 94));
     DocQuery.next ;
     end;
     DocQuery.close ;
  finally
     DocQuery.Free ;
  end;
finally
   StockQuery.Free ;
   _SetProgress(-1);
end;
end;


procedure ReadLedgerObjectFromBatches(aLedgerCalculationClass : TLedgerCalculationClass;NoContra:boolean = false );

Var
  i ,TempPeriode : Integer ;
  ABatchList : TStringList ;
  AfistBatchFieldnames : TUniQuery ;
  AfieldsnamesList : String ;
begin
   ABatchList := TStringList.create ;
   AfistBatchFieldnames := TUniQuery.Create(nil) ;
    try
    AfistBatchFieldnames.Connection := DMTCCoreLink.TheZConnection ;
    AfieldsnamesList := '*' ;
    aLedgerCalculationClass.OnItemAdd := LedgerAddItemEvent ;
    GetBatchList(ABatchList);

    if ABatchList.Count >0 then
       begin
        dmDatabase.ZQGenBatches.SQL.Text := 'select 1 as WBATCHID,'+  ABatchList[0] + '.* from ' + ABatchList[0]  ;
        dmDatabase.ZQGenBatches.Open ;
        AfieldsnamesList := '' ;
        for i := 1 to dmDatabase.ZQGenBatches.Fields.Count -1 do
          begin
            if AfieldsnamesList <> ''  then
             AfieldsnamesList := AfieldsnamesList + ',' ;

           AfieldsnamesList := AfieldsnamesList + dmDatabase.ZQGenBatches.Fields[i].FieldName ;

          end;

       end;
    dmDatabase.ZQGenBatches.SQL.Text := '' ;
    for i := 0 to ABatchList.Count -1 do
      begin
         dmDatabase.ZQGenBatches.SQL.add('select '+IntToStr(Integer(ABatchList.objects[i]))+' as WBATCHID,'+ AfieldsnamesList + '  from ' + ABatchList[i] ) ;
         if NoContra then
            dmDatabase.ZQGenBatches.SQL.add(' where wlineid = wlinkedid');
          if i < (ABatchList.Count -1) then
          dmDatabase.ZQGenBatches.SQL.add('Union');
      end;
   if dmDatabase.ZQGenBatches.SQL.Text = ''  then exit ;
   try
   dmDatabase.ZQGenBatches.Open ;
   except
     // some errors with the union. just exit this routine
     exit ;
   end;

    while not dmDatabase.ZQGenBatches.eof do
    begin
        with aLedgerCalculationClass.GetItemOnAccountId(dmDatabase.ZQGenBatches.fieldByname('WAccountID').AsInteger) do
              begin
                TempPeriode :=LrGetPeriod(dmDatabase.ZQGenBatches.fieldByname('DDate').AsDateTime);
                AddValue(TempPeriode,dmDatabase.ZQGenBatches.fieldByname('WBatchID').AsInteger,dmDatabase.ZQGenBatches.fieldByname('FDEBIT').AsFloat,lapDebit);
                AddValue(TempPeriode,dmDatabase.ZQGenBatches.fieldByname('WBatchID').AsInteger,dmDatabase.ZQGenBatches.fieldByname('FCREDIT').AsFloat,lapCredit);
                TransactionCount[dmDatabase.ZQGenBatches.fieldByname('WBatchID').AsInteger] := TransactionCount[dmDatabase.ZQGenBatches.fieldByname('WBatchID').AsInteger] +1 ;
              end ;
        dmDatabase.ZQGenBatches.next ;
    end;
  finally
     ABatchList.free ;
     AfistBatchFieldnames.free ;
   end;

end;

procedure LedgerAddItemEvent ( const aLedgerItem : TLedgerItem );
Var
 AQuery : TuniQuery ;
begin
  if aLedgerItem.AccountID=0 then exit;
  AQuery := TuniQuery.create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.sql.text := 'select * from account where waccountid = ' +IntToStr(aLedgerItem.AccountID);

  if not AQuery.IsEmpty then
    begin
    aLedgerItem.Name := AQuery.fieldByName('SDescription').Value;
    aLedgerItem.LedgerType := TLedgerType(AQuery.fieldByName('WAccountTypeID').AsInteger);
    aLedgerItem.Accountcode := AQuery.fieldByName('SMAINACCOUNTCODE').Value;
    aLedgerItem.IncomeExpence := AQuery.fieldByName('BIncomeExpense').Value=1;
    aLedgerItem.SubAccounts := AQuery.fieldByName('BSubAccounts').Value=1;
    aLedgerItem.SubAccountCode := AQuery.fieldByName('SSUBACCOUNTCODE').Value;
    end;
  finally
    AQuery.free ;
  end;

end;


end.


