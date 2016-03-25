(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BalanceSheet;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs;

type
  TqrBalanceSheet = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Dates: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    Debit1: TQRLabel;
    Debit2: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    TitleBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    qrGroupName: TQRLabel;
    qrGroupsTotalThDt: TQRLabel;
    qrGroupsTotalThCr: TQRLabel;
    QRGroup1: TQRGroup;
    qrGpAssets : TQRGroup;
    QRLabel5: TQRLabel;
    qrTotalCatGroup: TQRBand;
    QRLabel6: TQRLabel;
    qrGenCatTotal: TQRLabel;
    QRShape2: TQRShape;
    NetProf: TQRLabel;
    NetProfDt: TQRLabel;
    LyNetProf: TQRLabel;
    QRShape1: TQRShape;
    qrGenCatLyTotal: TQRLabel;

    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure qrGroupNamePrint(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure qrGpAssetsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrTotalCatGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
  
  public
    ShowDetails,
    lastyear,
    BIncExpAcc,
    CapLiabGroup : Boolean;
    sDigits : Byte;
    IncludeOpeningBals : boolean;
    BOutputReverse :Boolean ;
  end;
  function qrBalanceSheet : TqrBalanceSheet;
var

  GrandFinCatTotal,
  GrandFinCatLyTotal,
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
  GroupLyTotal  : Real;
//  flGroupsID          : Integer;
implementation

uses Database, GlobalFunctions,  DatabaseAccess;

{$R *.DFM}
var
 aqrBalanceSheet  : TqrBalanceSheet;
function qrBalanceSheet  : TqrBalanceSheet;
begin
   if not assigned(aqrBalanceSheet) then
   aqrBalanceSheet:= TqrBalanceSheet.Create(Application);
   result := aqrBalanceSheet ;
end;

procedure TqrBalanceSheet.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iCount : Byte;
  BudgetTotal,
  tmp,Total,LYTotal : Real;

begin
  if dmDatabase.qrBalSheetAccountWAccountID.AsInteger = 0 then
  begin
   Printband := false;
   exit;
  end;
  if dmDatabase.qrBalSheetAccountBIncomeExpense.AsInteger = 1 then
  begin
   Printband := false;
   exit;
  end;


  with dmDatabase do
  begin
    Total := GetRangeTotal(0,tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger,tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.AsInteger = 1));
    if lastyear then
    LYTotal := GetRangeTotal(0,tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger-13,tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger-13,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.AsInteger = 1))
    else
    LYTotal := GetRangeTotal(-1,tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger-13,tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger-13,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.AsInteger = 1));
    if sDigits = 100 then
       begin
       Total := RoundAmount(Total*100,3)/100 ;
       LYTotal := RoundAmount(LYTotal*100,3)/100 ;
       end;
    if ((qrBalSheetAccountSSUBACCOUNTCODE.AsString = '000') and ((tblReportingOptions.FieldByName('BBalSheetDisplaySubAccs').AsInteger = 1)) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWDebtorsControlID.AsInteger) and (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWCreditorsControlID.AsInteger) and
      { (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWRetainedIncomeID.AsInteger) and }(qrBalSheetAccountBSubAccounts.AsInteger = 1)) or ((Total = 0) AND (LYTotal=0)) then
    begin
      //this is a main account
        Debit1.Caption := '';
        Debit2.Caption := '';
    end
    else
    begin
      // Total for reporting Groups
      GroupThTotal := GroupThTotal + Total;
      GroupLYTotal := GroupLYTotal + LyTotal;
      //
      if Total > 0 then
        GrandDebitTotal := GrandDebitTotal + Total
      else
        GrandCreditTotal := GrandCreditTotal + Total;

     if dmDatabase.flGroupsID=21 then
       BOutputReverse := not (qrBalSheetAccountWParentGroup2ID.asinteger=69)
       else
       BOutputReverse := not (qrBalSheetAccountWParentGroup1ID.asinteger=69) ;


      Debit1.Caption := FloatToStrTd2c(Total , ffFixed, 18, sDigits,BOutputReverse);
      Debit2.Caption := FloatToStrTd2c(LyTotal , ffFixed, 18, sDigits,BOutputReverse);
    end;
     //PL
    if (qrBalSheetAccountSSUBACCOUNTCODE.AsString = '000') and (tblReportingOptions.FieldByName('BBalSheetDisplaySubAccs').AsInteger = 1) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWDebtorsControlID.AsInteger) and (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWCreditorsControlID.AsInteger) and
      { (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWRetainedIncomeID.AsInteger) and }(qrBalSheetAccountBSubAccounts.AsInteger = 1)
       or (qrBalSheetAccountBIncomeExpense.AsInteger = 0) or (Total = 0) then
      //this is a main account
      else
    begin
      GrandPLTotal := GrandPLTotal + Total;

    end;
    // LY
    if (qrBalSheetAccountSSUBACCOUNTCODE.Value = '000') and (tblReportingOptions.FieldByName('BBalSheetDisplaySubAccs').Value) and
       (qrBalSheetAccountWAccountID.Value <> tblSysVarsWDebtorsControlID.Value) and (qrBalSheetAccountWAccountID.Value <> tblSysVarsWCreditorsControlID.Value) and
      { (qrBalSheetAccountWAccountID.Value <> tblSysVarsWRetainedIncomeID.Value) and }(qrBalSheetAccountBSubAccounts.Value)
       or (qrBalSheetAccountBIncomeExpense.AsInteger = 0) or (LyTotal = 0) then
      //this is a main account
      else
    begin

      GrandLYTotal := GrandLYTotal + LyTotal;
    end;
    if (qrBalSheetAccountBIncomeExpense.AsInteger = 1) {or BIncExpAcc} then
    begin
        PrintBand:=False;
        {BIncExpAcc := True ;}
    end;

    if (Total=0) And (LYTotal=0) AND (not fmBalanceSheetOptions.dbcboxIncNilBal.Checked) then
      PrintBand:=False;

  end;
end;

procedure TqrBalanceSheet.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate         :TDate;
begin
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  Dates.Caption:=DateRange(EDate,EDate);
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

procedure TqrBalanceSheet.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:=AddDashInAccCodeNoPRefix(Value);
end;

procedure TqrBalanceSheet.qrGroupNamePrint(sender: TObject;
  var Value: String);
begin
  Value := GetTextLang(1056);//'unllocated';
  if dmDatabase.flGroupsID IN [20,21] then
  begin
    if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOF([dmDatabase.qrBalSheetAccount.FieldByName('WReportingGroup'+IntToStr(dmDatabase.flGroupsID-19 )+'ID').AsInteger,dmDatabase.flGroupsID ]),[]) then
      Value :=GetTextLang(1026)+' '{ ' Total for '}+ dmDatabase.tblGroupsSDescription.value;
  end;
    
end;

procedure TqrBalanceSheet.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  if BIncExpAcc then
  begin
    PrintBand := False;
    BIncExpAcc := False;
    exit;
  end;
  if not fmBalanceSheetOptions.dbcboxIncNilBal.Checked and (GroupThTotal = 0) and
    (GroupLYTotal = 0) then
    begin
     PrintBand := False;
     exit;
    end;
  GrandFinCatTotal := GrandFinCatTotal+ GroupThTotal;
  GrandFinCatLyTotal := GrandFinCatLyTotal+ GroupLYTotal;

  qrGroupsTotalThCr.Caption := FloatToStrTd2c(GroupLYTotal, ffFixed, 18, sDigits,BOutputReverse);
  qrGroupsTotalThDt.Caption := FloatToStrTd2c(GroupThTotal, ffFixed, 18, sDigits,BOutputReverse);
end;

procedure TqrBalanceSheet.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GroupThTotal := 0;
  GroupBgTotal := 0;
  GroupLYTotal := 0;
  BIncExpAcc := False;
end;

procedure TqrBalanceSheet.QRLabel5Print(sender: TObject;
  var Value: String);
Var
 Itemp:integer;
begin
    QRLabel6.Caption:='';
    Value:='';
    Itemp:= dmDatabase.qrBalSheetAccount.FieldByName('WParentGroup'+IntToStr(dmDatabase.flGroupsID-19)+'ID').AsInteger;
    if Itemp=69 then
    begin
      Value :=GetTextLang(1151);// 'Assets';
      QRLabel6.Caption :=GetTextLang(1152);// 'Total Assets';
      CapLiabGroup := False;
    end
    else if (Itemp in [65,68,58])  then
    begin
      Value := GetTextLang(1153);//'Capital And Liabilities';
      QRLabel6.Caption := GetTextLang(1154);//'Total Capital And Liabilities';
      CapLiabGroup := True;
    end
end;

procedure TqrBalanceSheet.qrGpAssetsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GrandFinCatTotal := 0;
  GrandFinCatLyTotal := 0;
end;

procedure TqrBalanceSheet.qrTotalCatGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  NetProf.Caption:='';
  NetProfDt.Caption:='';
  LyNetProf.Caption := '';
  if CapLiabGroup then
  begin
    GrandFinCatTotal:= GrandFinCatTotal + GrandPLTotal;
    GrandFinCatLyTotal:= GrandFinCatLyTotal + GrandLYTotal;

    GrandLYTotal := GetTotalProffitLoss(dmDatabase.tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger-13,dmDatabase.tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger-13)  ;
    GrandPLTotal := GetTotalProffitLoss(dmDatabase.tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger,dmDatabase.tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger);

    LyNetProf.Caption := FloatToStrTd2c(GrandLYTotal, ffFixed, 18, sDigits,true);
    NetProfDt.Caption :=FloatToStrTd2c(GrandPLTotal, ffFixed, 18, sDigits,true);
    // This Year L/P
    NetProf.Caption:=GetTextLang(1155);//'Total Net Profit/Loss ';
  end;
  qrGenCatTotal.Caption := FloatToStrTd2c(GrandFinCatTotal + GrandPLTotal, ffFixed, 18, sDigits,BOutputReverse);
  qrGenCatLyTotal.Caption := FloatToStrTd2c(GrandFinCatLyTotal + GrandLYTotal, ffFixed, 18, sDigits,BOutputReverse);
end;

procedure TqrBalanceSheet.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 GrandFinCatTotal := 0;
  GrandFinCatLyTotal := 0;
  GrandBgDebitTotal := 0;
  GrandBgCreditTotal := 0;
  GrandDebitTotal := 0;
  GrandCreditTotal := 0;
  GrandLYDebitTotal := 0;
  GrandLYCreditTotal := 0;
  GrandLYTotal := 0;
  GrandBgTotal := 0;
  GrandPLTotal := 0;
  GroupThTotal := 0;
  GroupBgTotal := 0;
  GroupLyTotal  := 0;
end;

end.
