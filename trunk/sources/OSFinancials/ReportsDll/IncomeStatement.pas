(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit IncomeStatement;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs, DB ;

type
  TqrIncomeStatement = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    Dates: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    Debit1: TQRLabel;
    Debit2: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    NetProfDt: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText1: TQRDBText;
    NetProfCr: TQRLabel;
    NetProf: TQRLabel;
    QRShape1: TQRShape;
    qrGroupName: TQRLabel;
    qrGroupsTotalThDt: TQRLabel;
    QRShape18: TQRShape;
    qrGroupsTotalLyCr: TQRLabel;
    QRLabel5: TQRLabel;
    qrVariance: TQRLabel;
    qrGroupsVar: TQRLabel;
    qrVarLp: TQRLabel;
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
  private

  public
    ShowDetails,
    IncludeOpeningBals : boolean;
    sDigits : Byte;
  end;
function  qrIncomeStatement : TqrIncomeStatement;
var

  GrandBgDebitTotal,
  GrandBgCreditTotal,
  GrandDebitTotal,
  GrandCreditTotal,
  GrandLYDebitTotal,
  GrandLYCreditTotal,
  GrandPLLyTotal,
  GrandBgTotal,
  GrandPLTyTotal ,
  GroupThTotal,
  GroupLYTotal,
  GroupBgTotal,
  GroupLsTotal ,
  CumulBal     : Real;
  WhichYear :  Integer;
//  flGroupsID          : Integer;
implementation

uses Database, GlobalFunctions, IncomeStatementOptions,DatabaseAccess;

{$R *.DFM}
var
 aqrIncomeStatement        : TqrIncomeStatement;
function  qrIncomeStatement : TqrIncomeStatement;
begin
   if not assigned(aqrIncomeStatement) then
   aqrIncomeStatement:= TqrIncomeStatement.Create(Application);
   result := aqrIncomeStatement ;
end;
procedure TqrIncomeStatement.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  BudgetTotal,
  tmp,Total,LYTotal : Real;
begin


  if dmDatabase.qrBalSheetAccountWAccountID.Value = 0 then begin
   Printband := false;
   exit;
  end;

  with dmDatabase do
  begin
    Total := 0;
    LYTotal := 0;
    BudgetTotal := 0;
    Total := GetRangeTotal(0,tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger   ,tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger   ,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.Asinteger = 1));
    LYTotal := GetRangeTotal(-1,tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger-13,tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger-13,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.Asinteger = 1));
    BudgetTotal := GetRangeTotal(1,tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger,tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger,qrBalSheetAccountWAccountID.AsInteger,IncludeOpeningBals,(qrBalSheetAccountBIncomeExpense.Asinteger = 1));
    if not fmIncomeStatementOptions.cbIncStatShowDec.Checked then
       begin
         Total :=  round(Total);
         LYTotal  :=  round(LYTotal);
         BudgetTotal  := round(BudgetTotal);
       end;
    if ((qrBalSheetAccountSSUBACCOUNTCODE.AsString = '000') and (tblReportingOptions.FieldByName('BIncomeStmntDisplaySubAcc').Asinteger = 1) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWDebtorsControlID.AsInteger) and (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWCreditorsControlID.AsInteger) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWRetainedIncomeID.AsInteger) and (qrBalSheetAccountBSubAccounts.Asinteger = 1)) or ((Total = 0) AND (LYTotal=0) and((BudgetTotal = 0) and (fmIncomeStatementOptions.cbBudget.Checked))) then
    begin
      //this is a main account
      Debit1.Caption := '';
      Debit2.Caption := '';
      if BudgetTotal <> 0 then
        begin
        if fmIncomeStatementOptions.cbBudget.Checked then
          begin
             Debit2.Caption := FloatToStrTd2c(BudgetTotal , ffFixed, 18, sDigits);
             GroupBgTotal := GroupBgTotal + BudgetTotal;
          end ;
        end;
      if LyTotal <> 0 then
        begin
         if fmIncomeStatementOptions.cbLastYear.Checked then
            begin
              Debit2.Caption := FloatToStrTd2c(LyTotal , ffFixed, 18, sDigits);
              GroupLYTotal := GroupLYTotal + LyTotal;
            end;
        end;

    end
    else
    begin
      // Total for reporting Groups
      GroupThTotal := GroupThTotal + Total;
      GroupLYTotal := GroupLYTotal + LyTotal;
      GroupBgTotal := GroupBgTotal + BudgetTotal;

      //
      GrandDebitTotal := GrandDebitTotal + Total;
      Debit1.Caption := FloatToStrTd2c(Total , ffFixed, 18, sDigits);
      if fmIncomeStatementOptions.cbBudget.Checked then
        Debit2.Caption := FloatToStrTd2c(BudgetTotal , ffFixed, 18, sDigits)
      else
        Debit2.Caption := FloatToStrTd2c(LyTotal , ffFixed, 18, sDigits);

    end;

    if fmIncomeStatementOptions.cbBudget.Checked then
      qrVariance.Caption := FloatToStrTd2c(Total - BudgetTotal , ffFixed, 18, sDigits)
    else
      qrVariance.Caption := FloatToStrTd2c(Total - LyTotal , ffFixed, 18, sDigits);

    //PL
    if (qrBalSheetAccountSSUBACCOUNTCODE.Value = '000') and (tblReportingOptions.FieldByName('BIncomeStmntDisplaySubAcc').Asinteger = 1) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWDebtorsControlID.AsInteger) and (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWCreditorsControlID.AsInteger) and
       (qrBalSheetAccountWAccountID.AsInteger <> tblSysVarsWRetainedIncomeID.AsInteger) and (qrBalSheetAccountBSubAccounts.Asinteger = 1)
       or (qrBalSheetAccountBIncomeExpense.Value = 0) then
      //this is a main account
      begin

      end
    else
    begin
      GrandPLTyTotal := GrandPLTyTotal + Total;
      GrandPLLyTotal := GrandPLLyTotal + LyTotal;
      GrandBgTotal := GrandBgTotal + BudgetTotal;
    end;

  if (Total=0) And (LYTotal=0)AND (not fmIncomeStatementOptions.dbcboxIncNilBal.Checked) then
      PrintBand:=False;

  end;
end;

procedure TqrIncomeStatement.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // This/Ly Year L/P
    NetProf.Caption:=GetTextLang(1160);//'Net Loss/Profit';
    NetProfDt.Caption := FloatToStrTd2c(GrandPLTyTotal , ffFixed, 18, sDigits) ;
    if fmIncomeStatementOptions.cbBudget.Checked then
    begin
      NetProfCr.Caption := FloatToStrTd2c(GrandBgTotal , ffFixed, 18, sDigits) ;
      qrVarLp.Caption := FloatToStrTd2c(GrandPLTyTotal-GrandBgTotal , ffFixed, 18, sDigits) ;
    end
    else
    begin
      NetProfCr.Caption := FloatToStrTd2c(GrandPLLyTotal , ffFixed, 18, sDigits)  ;
      qrVarLp.Caption :=  FloatToStrTd2c(GrandPLTyTotal-GrandPLLyTotal , ffFixed, 18, sDigits)  ;
    end;
end;

procedure TqrIncomeStatement.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate         :TDate;
begin
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger, []);
  SDate:= dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  Dates.Caption:=DateRange(SDate,EDate);
  dmDatabase.tblPeriods.Close;
  GrandDebitTotal    := 0;
  GrandCreditTotal   := 0;
  GrandPLTyTotal       := 0;
  GrandBgTotal       := 0;
  GrandPLLyTotal       := 0;
  GrandLYDebitTotal  := 0;  
  GrandLYCreditTotal := 0;
  GrandBgDebitTotal    := 0;
  GrandBgCreditTotal   := 0;
  CumulBal  :=0;
end;

procedure TqrIncomeStatement.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=TopReportDate(Value);
end;


procedure TqrIncomeStatement.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:=AddDashInAccCodeNoPRefix(Value);
end;

procedure TqrIncomeStatement.qrGroupNamePrint(sender: TObject;
  var Value: String);
begin
  Value:='';
  if dmDatabase.flGroupsID=20 then
  begin
    if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOF([dmDatabase.qrBalSheetAccountWReportingGroup1ID.value,20]),[]) then
      Value :=' '+GetTextLang(1026)+' '{' Total for '}+ dmDatabase.tblGroupsSDescription.value;
  end
  else
  if dmDatabase.flGroupsID=21 then
  begin
    if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOF([dmDatabase.qrBalSheetAccountWReportingGroup2ID.value,21]),[]) then
      Value :=' '+GetTextLang(1026)+' '{ ' Total for '}+ dmDatabase.tblGroupsSDescription.value;

  end;
end;

procedure TqrIncomeStatement.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (GroupThTotal <> 0 ) or (GroupBgTotal <> 0 ) or (GroupLyTotal <> 0 ) or (fmIncomeStatementOptions.dbcboxIncNilBal.Checked) ;
//  QRShape18.Enabled:=Not ShowDetails;
  qrGroupsTotalLyCr.Caption:='';
  qrGroupsTotalThDt.Caption:='';
//  qrGroupsTotalBgDt.Caption:='';
//  qrGroupsTotalBgCr.Caption:='';
//  qrGroupsTotalLsDt.Caption:='';
//  qrGroupsTotalLsCr.Caption:='';
  if dmDatabase.flGroupsID in [20,21] then
  begin
     CumulBal:=CumulBal+ GroupThTotal;
     // This year Groups
     qrGroupsTotalThDt.Caption:=FloatToStrTd2c(GroupThTotal, ffFixed, 18, sDigits);
     if  fmIncomeStatementOptions.cbBudget.Checked then
     begin
       qrGroupsTotalLYCr.Caption:=FloatToStrTd2c(GroupBgTotal, ffFixed, 18, sDigits);
       qrGroupsVar.Caption :=FloatToStrTd2c(GroupThTotal-GroupBgTotal, ffFixed, 18, sDigits);
     end
     else
     begin
       qrGroupsTotalLYCr.Caption:=FloatToStrTd2c(GroupLyTotal, ffFixed, 18, sDigits);
       qrGroupsVar.Caption :=FloatToStrTd2c(GroupThTotal-GroupLyTotal, ffFixed, 18, sDigits);
     end;
  end;
end;

procedure TqrIncomeStatement.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GroupThTotal := 0;
  GroupBgTotal := 0;
  GroupLsTotal := 0;
  GroupLyTotal := 0;

end;

end.
