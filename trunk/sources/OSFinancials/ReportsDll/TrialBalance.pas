(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TrialBalance;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs,TcVariables, DB, 
  ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni;

type
  TqrTrialBalance = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Dates: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    Debit1: TQRLabel;
    Credit1: TQRLabel;
    IncExpAcc: TQRLabel;
    Debit2: TQRLabel;
    Credit2: TQRLabel;
    Debit3: TQRLabel;
    Credit3: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    DiffLabel: TQRLabel;
    NetProfDt: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape2: TQRShape;
    lblGrandDebitTotal: TQRLabel;
    lblGrandCreditTotal: TQRLabel;
    lblGrandLYDebitTotal: TQRLabel;
    lblGrandLYCreditTotal: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    NetProfCr: TQRLabel;
    LblGrandBgDebitTotal: TQRLabel;
    LblGrandBgCreditTotal: TQRLabel;
    BgNetProfDt: TQRLabel;
    BgNetProfCr: TQRLabel;
    NetProf: TQRLabel;
    BgNetProf: TQRLabel;
    LYNetProf: TQRLabel;
    LYNetProfDt: TQRLabel;
    LYNetProfCr: TQRLabel;
    qrGroupName: TQRLabel;
    qrGroupsTotalThDt: TQRLabel;
    qrGroupsTotalThCr: TQRLabel;
    qrGroupsTotalBgDt: TQRLabel;
    qrGroupsTotalBgCr: TQRLabel;
    qrGroupsTotalLsDt: TQRLabel;
    qrGroupsTotalLsCr: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QThisYear: TuniQuery;
    QLastyear: TuniQuery;
    QBuget: TuniQuery;
    QThisYearBuget: TFloatField;
    QThisYearLastyear: TFloatField;
    QLastyearWACCOUNTID: TIntegerField;
    QLastyearTOTAL: TFloatField;
    QBugetWACCOUNTID: TIntegerField;
    QBugetTOTAL: TFloatField;
    QThisYearWACCOUNTID: TIntegerField;
    QThisYearSACCOUNTCODE: TStringField;
    QThisYearSSUBACCOUNTCODE: TStringField;
    QThisYearBSUBACCOUNTS: TSmallintField;
    QThisYearSDESCRIPTION: TStringField;
    QThisYearWACCOUNTTYPEID: TIntegerField;
    QThisYearBINCOMEEXPENSE: TSmallintField;
    QThisYearWSORTNO: TIntegerField;
    QThisYearWSORTNO_1: TIntegerField;
    QThisYearWREPORTINGGROUP1ID: TIntegerField;
    QThisYearWREPORTINGGROUP2ID: TIntegerField;
    QThisYearTOTAL: TFloatField;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure qrGroupNamePrint(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure ShowDiff;
  public

    LedgerCalculationClass : TLedgerCalculationClass ;
    IncludeOpeningBals : boolean;
    Viewmask0 : String ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
function   qrTrialBalance        : TqrTrialBalance;
var

  GrandBgDebitTotal,
  GrandBgCreditTotal,
  GrandDebitTotal,
  GrandCreditTotal,
  GrandLYDebitTotal,
  GrandLYCreditTotal,
  GrandLYTotal,
  GrandBgTotal,
  GrandPLTotal ,
  GroupThTotal,
  GroupBgTotal,
  GroupLsTotal  : Real;
  flGroupsID          : Integer;
  bLyOnly:Boolean;
implementation

uses TrialBalanceOptions, Database, GlobalFunctions, DatabaseAccess,main,LedgerRoutines;

{$R *.DFM}
var
aqrTrialBalance        : TqrTrialBalance;

function   qrTrialBalance        : TqrTrialBalance;
begin
   if not assigned(aqrTrialBalance) then
   aqrTrialBalance:= TqrTrialBalance.Create(Application);
   result := aqrTrialBalance ;
end;

procedure TqrTrialBalance.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  BudgetTotal,
  Total,LYTotal : Real;
  x: Integer ;
  Debit,Credit : Double ;
begin
  if QThisYearWAccountID.Value = 0 then begin
   Printband := false;
   exit;
  end;
  with dmDatabase do
  begin
    Debit1.Caption := '';
    Credit1.Caption := '';
    Debit2.Caption := '';
    Credit2.Caption := '';
    Debit3.Caption := '';
    Credit3.Caption := '';
    //initialise
    Total := 0;
    LYTotal := 0;
    BudgetTotal := 0;
    //this year
     Total := Total + QThisYeartotal.AsFloat ;
     if fmTrialBalanceOptions.CBBeforePosting.Checked then
       begin
        if fmTrialBalanceOptions.CBUpostedonly.Checked then
        Total := 0 ;
        if QThisYearWAccountID.Value = tblSysVarsWDebtorsControlID.Value then
           begin
            // add periodes and sum
            for x :=  0 to LedgerCalculationClass.Count -1 do
              begin
                if LedgerCalculationClass[x].LedgerType = ltDebtor then
                   begin
                     LedgerCalculationClass[x].GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger,Debit,Credit);
                     Total := Total + (debit - credit);
                   end;
              end
           end;
        if QThisYearWAccountID.Value = tblSysVarsWCreditorsControlID.Value then
           begin
            // add periodes and sum
            for x :=  0 to LedgerCalculationClass.Count -1 do
              begin
                if LedgerCalculationClass[x].LedgerType = ltCreditor then
                   begin
                     LedgerCalculationClass[x].GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger,Debit,Credit);
                     Total := Total + (debit - credit);
                   end;
              end
          end else
          // todo : do the sub accounts
          begin
             if LedgerCalculationClass.HasItemOnAccountId(QThisYearWAccountID.AsInteger) then
             begin
             LedgerCalculationClass.GetItemOnAccountId(QThisYearWAccountID.AsInteger).GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger,Debit,Credit) ;
             Total := Total + (debit - credit);
             end;
          end
         end;    // end if trailbalance with uposted batches
    // QGen.close ;


    if ((QThisYearSSUBACCOUNTCODE.Value = '000') and
       (QThisYearWAccountID.Value <> tblSysVarsWDebtorsControlID.Value) and (QThisYearWAccountID.Value <> tblSysVarsWCreditorsControlID.Value) and
       (QThisYearWAccountID.Value <> tblSysVarsWRetainedIncomeID.Value) and (QThisYearBSubAccounts.AsInteger = 1)) or (Total = 0) then
    begin
      //this is a main account
      if  not (tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsInteger = 1) then
         if Total > 0 then
          begin
            Debit1.Caption := FormatFloat(Viewmask0,Total );
            Credit1.Caption := '';
          end else
          if Total < 0 then
          begin
            Debit1.Caption := '';
            Credit1.Caption := FormatFloat(Viewmask0,Total * -1 );
          end;
    end
    else
    begin
      // Total for reporting Groups
      GroupThTotal := GroupThTotal + Total;
      //
      if Total > 0 then
      begin
        Debit1.Caption := FormatFloat(Viewmask0,Total );
        Credit1.Caption := '';
        GrandDebitTotal := GrandDebitTotal + Total;
      end else
      if Total < 0 then
      begin
        Debit1.Caption := '';
        Credit1.Caption := FormatFloat(Viewmask0,Total * -1 );
        GrandCreditTotal := GrandCreditTotal + Total;
      end;
    end;
    //Budgets



    BudgetTotal := BudgetTotal +  QThisYearBuget.AsFloat;
    if (QThisYearSSUBACCOUNTCODE.Value = '000')  and
       (QThisYearWAccountID.Value <> dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) and (QThisYearWAccountID.Value <> dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount) and
       (QThisYearWAccountID.Value <> dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings) and (QThisYearBSubAccounts.AsInteger = 1) or (BudgetTotal = 0) then
    begin
      //this is a main account

      if not (tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsInteger = 1) then
        if BudgetTotal > 0 then
        begin
          Debit2.Caption := FormatFloat(Viewmask0,BudgetTotal );
          Credit2.Caption := '';
        end;
        if BudgetTotal < 0 then
        begin
          Debit2.Caption := '';
          Credit2.Caption := FormatFloat(Viewmask0,BudgetTotal * -1 );
        end;
    end
    else
    begin
      // Total for reporting Groups
      GroupBGTotal := GroupBGTotal + BudgetTotal;
      //
      if BudgetTotal > 0 then
      begin
        Debit2.Caption := FormatFloat(Viewmask0,BudgetTotal );
        Credit2.Caption := '';
        GrandbgDebitTotal := GrandbgDebitTotal + BudgetTotal;
      end;
      if BudgetTotal < 0 then
      begin
        Debit2.Caption := '';
        Credit2.Caption := FormatFloat(Viewmask0,BudgetTotal * -1 );
        GrandbgCreditTotal := GrandbgCreditTotal + BudgetTotal;
      end;
    end;
    //last year

    LYTotal := LYTotal + QThisYearLastyear.AsFloat;

     if fmTrialBalanceOptions.CBBeforePosting.Checked then
       begin
        if fmTrialBalanceOptions.CBUpostedonly.Checked then
        LYTotal := 0 ;
        if QThisYearWAccountID.Value = tblSysVarsWDebtorsControlID.Value then
           begin
            // add periodes and sum
            for x :=  0 to LedgerCalculationClass.Count -1 do
              begin
                if LedgerCalculationClass[x].LedgerType = ltDebtor then
                   begin
                     LedgerCalculationClass[x].GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger-13,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger-13,Debit,Credit);
                     LYTotal := LYTotal + (debit - credit);
                   end;
              end
           end;
        if QThisYearWAccountID.Value = tblSysVarsWCreditorsControlID.Value then
           begin
            // add periodes and sum
            for x :=  0 to LedgerCalculationClass.Count -1 do
              begin
                if LedgerCalculationClass[x].LedgerType = ltCreditor then
                   begin
                     LedgerCalculationClass[x].GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger-13,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger-13,Debit,Credit);
                     LYTotal := LYTotal + (debit - credit);
                   end;
              end
          end else
          // todo : do the sub accounts
          begin
             if LedgerCalculationClass.HasItemOnAccountId(QThisYearWAccountID.Value) then
             begin
             LedgerCalculationClass.GetItemOnAccountId(QThisYearWAccountID.Value).GetTotalsFromPeriodes(dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger-13,dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').asinteger-13,Debit,Credit) ;
             LYTotal := LYTotal + (debit - credit);
             end;
          end
         end;    // end if trailbalance with uposted batches

    // adjust last year's opening balance by subtracting total transaction amounts
    // for the year.
    // todo : Pieter Last year should calculate the opening balance of the accounts
    if ((IncludeOpeningBals) and (QThisYearBIncomeExpense.AsInteger = 0)) then begin
      if QThisYearWAccountID.Value = dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings
       then LYTotal := LYTotal + GetLastYearsOpeningBalance(QThisYearWAccountID.AsInteger)
       else LYTotal := LYTotal + GetLastYearsOpeningBalance(QThisYearWAccountID.AsInteger);
    end;

    if (QThisYearSSUBACCOUNTCODE.Asstring = '000'){ and (tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsBoolean)} and
       (QThisYearWAccountID.Asinteger <> dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount) and (QThisYearWAccountID.Asinteger <> dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount) and
       (QThisYearWAccountID.Asinteger <> dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings) and (QThisYearBSubAccounts.AsInteger =1) or (LYTotal = 0) then
    begin
      //this is a main account
      if not (tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsInteger = 1) then
        if LYTotal > 0 then
        begin
          Debit3.Caption := FormatFloat(Viewmask0,LYTotal );
          Credit3.Caption := '';
        end else
        if LYTotal < 0 then
        begin
          Debit3.Caption := '';
          Credit3.Caption :=  FormatFloat(Viewmask0,LYTotal * -1 );
        end;
    end
    else
    begin
      // Total for reporting Groups
      GroupLsTotal := GroupLsTotal + LyTotal;
      //
      if LYTotal > 0 then
      begin
        Debit3.Caption := FormatFloat(Viewmask0,LYTotal );
        Credit3.Caption := '';
        GrandLYDebitTotal := GrandLYDebitTotal + LYTotal;
      end else
      if LYTotal < 0 then
      begin
        Debit3.Caption := '';
        Credit3.Caption :=  FormatFloat(Viewmask0,LYTotal * -1 );
        GrandLYCreditTotal := GrandLYCreditTotal + LYTotal;
      end;
    end;
    tblTotals.Filtered := False;
    tblTotals.Filter := '';
    tblTotals.Close;
    if (QThisYearBIncomeExpense.Value = 0) then
      IncExpAcc.Caption := ''
    else
      IncExpAcc.Caption := '*';
    //PL
    if (QThisYearSSUBACCOUNTCODE.Asstring = '000') {and (tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsBoolean)} and
       (QThisYearWAccountID.AsInteger <> tblSysVarsWDebtorsControlID.AsInteger) and (QThisYearWAccountID.AsInteger <> tblSysVarsWCreditorsControlID.AsInteger) and
       (QThisYearWAccountID.AsInteger <> tblSysVarsWRetainedIncomeID.AsInteger) and ((QThisYearBSubAccounts.AsInteger = 1))
       or (not (QThisYearBIncomeExpense.AsInteger = 1))  then
      //this is a main account
      begin
      end
    else
    begin
      GrandPLTotal := GrandPLTotal + Total;
      GrandBgTotal := GrandBgTotal + BudgetTotal;
      GrandLYTotal := GrandLYTotal + LYTotal;
    end;
    if (Total=0) and (LYTotal=0)and (BudgetTotal=0) AND
      (fmTrialBalanceOptions.dbcboxIncNilBal.Checked <> True) then
      PrintBand:=False;
  end;
  if BLyOnly then
  begin
    Debit1.Caption := Debit3.Caption;
    Credit1.Caption := Credit3.Caption;
  end;
 if (not (dmDatabase.tblReportingOptions.FieldByName('BTrialBalDisplaySubAcc').AsInteger = 1)) and (QThisYearSSUBACCOUNTCODE.Asstring <> '000') and (not (QThisYearBSubAccounts.AsInteger = 1))then
      PrintBand:=False;
end;

procedure TqrTrialBalance.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblGrandDebitTotal.Caption := FormatFloat(Viewmask0,GrandDebitTotal );
  lblGrandCreditTotal.Caption := FormatFloat(Viewmask0,GrandCreditTotal * -1 );
  lblGrandLYDebitTotal.Caption := FormatFloat(Viewmask0,GrandLYDebitTotal );
  lblGrandLYCreditTotal.Caption := FormatFloat(Viewmask0,GrandLYCreditTotal * -1 );
  lblGrandBgDebitTotal.Caption := FormatFloat(Viewmask0,GrandBgDebitTotal  );
  lblGrandBgCreditTotal.Caption := FormatFloat(Viewmask0,-GrandBgCreditTotal  );
  ShowDiff;
  // This Year L/P
  if GrandPLTotal <= 0 then
  begin
    NetProf.Caption:=GetTextLang(1023){'Net Profit: '};
    NetProfDt.Caption:='';
    NetProfCr.Caption := FormatFloat(Viewmask0,GrandPLTotal * -1 );
    NetProf.left:=NetProfCr.Left;
  end
  else
  begin
    NetProf.Caption:=GetTextLang(1025){'Net Loss: '};
    NetProfCr.Caption:='';
    NetProfDt.Caption :=FormatFloat(Viewmask0,GrandPLTotal );
    NetProf.left:=NetProfDt.Left;
  end;
  if FixAmount(GrandPLTotal)=0 then
    NetProf.caption:='';
  // Budget L/P
  if GrandBgTotal <= 0 then
  begin
    BgNetProf.Caption:=GetTextLang(1023){'Net Profit: '};
    BgNetProfDt.Caption:='';
    BgNetProfCr.Caption := FormatFloat(Viewmask0,GrandBgTotal * -1 );
    BgNetProf.left:=BgNetProfCr.Left;
  end
  else
  begin
    BgNetProf.Caption:=GetTextLang(1025){'Net Loss: '};
    BgNetProfCr.Caption:='';
    BgNetProfDt.Caption :=FormatFloat(Viewmask0,GrandBgTotal );
    BgNetProf.left:=BgNetProfDt.Left;
  end;
  if FixAmount(GrandBgTotal)=0 then
    BgNetProf.Caption:='';
  // Last Year L/P
  if GrandLYTotal <= 0 then
  begin
    LYNetProf.Caption:=GetTextLang(1023){'Net Profit: '};
    LYNetProfDt.Caption:='';
    LYNetProfCr.Caption := FormatFloat(Viewmask0,GrandLYTotal * -1 );
    LYNetProf.left:=LYNetProfCr.Left;
  end
  else
  begin
    LYNetProf.Caption:=GetTextLang(1025){'Net Loss: '};
    LYNetProfCr.Caption:='';
    LYNetProfDt.Caption :=FormatFloat(Viewmask0,GrandLYTotal );
    LYNetProf.left:=LYNetProfDt.Left;
  end;
  if FixAmount(GrandLYTotal)=0 then
    LYNetProf.caption:='';
  if BlyOnly then
  begin
    lblGrandDebitTotal.Caption := lblGrandLYDebitTotal.Caption ;
    lblGrandCreditTotal.Caption := lblGrandLYCreditTotal.Caption ;
    NetProf.Caption := LYNetProf.Caption;
    NetProfDt.Caption := LYNetProfDt.Caption;
    NetProfCr.Caption := LYNetProfCr.Caption;
  end;
end;

procedure TqrTrialBalance.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate         :TDate;
  GapDateID:Byte;
begin
  if BLyOnly then
  begin
    qrlabel9.Caption:=qrLabel13.Caption;  
    GapDateID:=13
  end
  else
  begin
    GapDateID:=0;
  end;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger-GapDateID, []);
  SDate:= dmDatabase.tblPeriodsDStartDate.AsDateTime;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').AsInteger-GapDateID, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
  dmDatabase.tblPeriods.Close;

  GrandDebitTotal    := 0;
  GrandCreditTotal   := 0;
  GrandPLTotal       := 0;
  GrandBgTotal       := 0;
  GrandLYTotal       := 0;
  GrandLYDebitTotal  := 0;
  GrandLYCreditTotal := 0;
  GrandBgDebitTotal    := 0;
  GrandBgCreditTotal   := 0;
end;

procedure TqrTrialBalance.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=TopReportDate(Value);
end;

procedure TqrTrialBalance.ShowDiff;
Var
  BTmp:Boolean;
Begin
  // this Year;
  if bLyOnly then
  begin
    Btmp:=fixAmount(GrandLyDebitTotal + GrandLyCreditTotal)<>0;
    DiffLabel.Caption := FormatFloat(Viewmask0,(GrandLyDebitTotal + GrandLyCreditTotal) );
  end
  else
  begin
    Btmp:=fixAmount(GrandDebitTotal + GrandCreditTotal)<>0;
    DiffLabel.Caption := FormatFloat(Viewmask0,(GrandDebitTotal + GrandCreditTotal) );
  end;
  QRShape1.Enabled:=Btmp;
  QRShape2.Enabled:=Btmp;
  QRShape3.Enabled:=Btmp;
  QRShape4.Enabled:=Btmp;
  QRShape5.Enabled:=Btmp;
  QRLabel7.Enabled:=Btmp;
End;
procedure TqrTrialBalance.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:=AddDashInAccCodeNoPRefix(Value);
end;

procedure TqrTrialBalance.qrGroupNamePrint(sender: TObject;
  var Value: String);
begin
  Value:='';
  if flGroupsID=20 then
  begin
    if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOF([QThisYearWReportingGroup1ID.value,20]),[]) then
      Value := GetTextLang(1026){' Total for '}+ dmDatabase.tblGroupsSDescription.value
  end
  else
  if flGroupsID=21 then
  begin
    if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOF([QThisYearWReportingGroup2ID.value,21]),[]) then
      Value := GetTextLang(1026){' Total for '}+ dmDatabase.tblGroupsSDescription.value
  end;

end;

procedure TqrTrialBalance.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrGroupsTotalThCr.Caption:='';
  qrGroupsTotalThDt.Caption:='';
  qrGroupsTotalBgDt.Caption:='';
  qrGroupsTotalBgCr.Caption:='';
  qrGroupsTotalLsDt.Caption:='';
  qrGroupsTotalLsCr.Caption:='';
  if flGroupsID in [20,21] then
  begin
     // This year Groups
     if  GroupThTotal >=0 then
       qrGroupsTotalThDt.Caption:=FormatFloat(Viewmask0,GroupThTotal )
     else
       qrGroupsTotalThCr.Caption:=FormatFloat(Viewmask0,-GroupThTotal );
     // Budgets Groups
     if  GroupBGTotal >=0 then
       qrGroupsTotalBGDt.Caption:=FormatFloat(Viewmask0,GroupBGTotal )
     else
       qrGroupsTotalBGCr.Caption:=FormatFloat(Viewmask0,-GroupBGTotal );
     // Last Year Groups
     if GroupLsTotal >=0 then
       qrGroupsTotalLsDt.Caption:=FormatFloat(Viewmask0,GroupLsTotal )
     else
       qrGroupsTotalLsCr.Caption:=FormatFloat(Viewmask0,-GroupLsTotal );
  end;
end;

procedure TqrTrialBalance.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GroupThTotal := 0;
  GroupBgTotal := 0;
  GroupLsTotal := 0;
end;

procedure TqrTrialBalance.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
procedure  PrepareBatch ;
begin
  dmDatabase.tblBatchTypes.Open;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID' ,dmDatabase.qryUpdateBatchWBatchTypeID.Value,[]);
//  fmBatchEntry.Caption := dmDatabase.tblBatchTypesSDescription.Value;
  BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
  if CanUserBatch(RealUser,dmDatabase.qryUpdateBatchWBatchTypeID.Value) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
  end;
end;

begin
  if fmTrialBalanceOptions.CBBeforePosting.Checked then
   begin
     dmDatabase.tblAccount.Open ;
     LedgerCalculationClass.Clear ;
     ReadLedgerObjectFromBatches( LedgerCalculationClass) ;
     dmDatabase.tblAccount.Close ;
   end;

  Viewmask0 := GetViewMask(0) ;
  QRLabel1.Caption:=GetTextLang(1021){Trial Bal};
  if fmTrialBalanceOptions.CBBeforePosting.Checked then
     QRLabel1.Caption:=GetTextLang(1021) +' ' + GetTextLang(2093){Trial Bal};
  QRLabel2.Caption:=GetTextLang(34){Account};
  QRLabel3.Caption:=GetTextLang(211){Debit};
  QRLabel4.Caption:=GetTextLang(212){Credit};
  QRLabel11.Caption:=GetTextLang(211){Debit};
  QRLabel12.Caption:=GetTextLang(212){Credit};
  QRLabel14.Caption:=GetTextLang(211){Debit};
  QRLabel15.Caption:=GetTextLang(212){Credit};
  QRLabel9.Caption:=GetTextLang(603){This Year};
  QRLabel13.Caption:=GetTextLang(604){Last Year};
  QRLabel10.Caption:=GetTextLang(1027){Budget};
  QRLabel7.Caption:=GetTextLang(955){Budget};
  {Dont Show This Year}
  QRLabel13.Enabled := Not bLyOnly;
  QRLabel14.Enabled :=  Not bLyOnly;
  QRLabel15.Enabled :=  Not bLyOnly;
  Debit3.Enabled :=  Not bLyOnly;
  Credit3.Enabled :=  Not bLyOnly;
  QRShape16.Enabled :=  Not bLyOnly;
  QRShape17.Enabled :=  Not bLyOnly;
  lblGrandLYDebitTotal.Enabled :=  Not bLyOnly;
  lblGrandLYCreditTotal.Enabled :=  Not bLyOnly;
  LYNetProf.Enabled :=  Not bLyOnly;
  LYNetProfDt.Enabled :=  Not bLyOnly;
  LYNetProfCr.Enabled :=  Not bLyOnly;

end;

constructor TqrTrialBalance.Create(AOwner: TComponent);
begin
  inherited;
  LedgerCalculationClass := TLedgerCalculationClass.Create(self,TLedgerItem) ;
end;

destructor TqrTrialBalance.Destroy;
begin
  LedgerCalculationClass.free ;
  inherited;
end;

end.
