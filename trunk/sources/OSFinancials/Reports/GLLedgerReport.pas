(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit GLLedgerReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrLedger = class(TQuickRep)
    QRBand1: TQRBand;
    qrlbReportType: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Detail1: TQRBand;
    Foot1: TQRBand;
    QRLabel11: TQRLabel;
    EndDate: TQRLabel;
    EndCredit: TQRLabel;
    EndDebit: TQRLabel;
    Dates: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    qrBdPeriod: TQRGroup;
    qrBdPeriodFoot: TQRBand;
    qrPrEndDate: TQRLabel;
    qrPerBeginDate: TQRLabel;
    qrPrEndDebit: TQRLabel;
    qrPrEndCredit: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    PerBeginDebit: TQRLabel;
    PerBeginCredit: TQRLabel;
    qrBottPage: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    qrBotPage: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    PeriodDescription: TQRLabel;
    BatchName: TQRLabel;
    QRDBText6: TQRDBText;
    Description: TQRLabel;
    Debit: TQRLabel;
    Credit: TQRLabel;
    qrDetCumul: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    AccumulToTal: TQRLabel;
    grBatch: TQRGroup;
    BatchFoot: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    BeginDate: TQRLabel;
    BeginDebit: TQRLabel;
    BeginCredit: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Foot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure BeginDatePrint(sender: TObject; var Value: String);
    procedure qrBdPeriodBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBdPeriodFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure grBatchBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BatchFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure WinControlForm_4Create(Sender: TObject);
  private
    AccStartBal,
    AccEndBal,
    CumulBatch,
    CumulTotal,
    CumulBal:Double;
    Reporttotal : Double ;
    FromDate,ToDate:Tdate;
    EDate,SDate         :TDate;
  public
    PrintDocReference ,PrintLastband: Boolean ;
    DebtorsControl
     ,CreditorsControl : Integer ;
  end;

var
  SkipBand :Boolean;
  qrLedger: TqrLedger;
  TmpDDate:TDate;
  //FromID, ToID,
  MvtID,
  LegerTypeID          : Integer;

implementation

Uses
  GlobalFunctions, Database, GLLedgerOptions, Main, TcVariables,DatabaseAccess,LedgerRoutines,
  DB, UDMTCCoreLink,variants;

{$R *.DFM}



procedure TqrLedger.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate         :TDate;
  tmpDescPeriod : String;
begin
  PrintDocReference := ReadNwReportOp('ACCMOVEPRINTDOCREF',False).AsBoolean;

  DmDatabase.tblSysVars.Open;
  QRLabel12.Caption:=DmDatabase.tblSysVarsSCompanyName.Value;
  DmDatabase.tblSysVars.Close;
  Reporttotal := 0 ;
  // added by syl
  Case LegerTypeID of
  1:Begin
      qrlbReportType.Caption:=GetTextLang(1281);//'Debtors Transactions ';
    end;
  2:Begin
      qrlbReportType.Caption:=GetTextLang(1283);//'Creditor Transactions ';
    end;
  else
      qrlbReportType.Caption:=GetTextLang(1282);//'Detailed Ledger  ';
    end;
  //
  if fmGLLedgerOptions.CheckGrp in [0,1] then
    qrlbReportType.Caption := qrlbReportType.Caption + ' - ' + fmGLLedgerOptions.cbGroup.Text;
end;

procedure TqrLedger.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintLastband := PrintBand ;
 AccStartBal := 0;
 AccEndBal  :=0;

  MvtID:=FromID;
  SkipBand := false;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  BeginDate.Caption :=FormatDateTime('dd/mm/yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  if dmDatabase.tblAccountBINCOMEEXPENSE.AsInteger = 0 then
  begin
  if dmDatabase.tblPeriodsWPeriodID.Value >= 14 then
  begin
    AccStartBal := GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, FromID-1, 3);
    AccEndBal := GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, ToID, 3);
  end
  else
  begin
    AccStartBal := GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, FromID-1, 4);
    AccEndBal := GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, ToID, 4);
  end;
  end;
  dmDatabase.qryTransActionReport.Filtered:=False;

  if  dmDatabase.tblAccountWAccountID.AsInteger in [DebtorsControl,CreditorsControl] then
    begin
     if dmDatabase.tblAccountWAccountID.AsInteger = DebtorsControl then
     dmDatabase.qryTransActionReport.Filter:='WAccountTypeID=1' else
     dmDatabase.qryTransActionReport.Filter:='WAccountTypeID=2';
    end else
  dmDatabase.qryTransActionReport.Filter:='WAccountID='+dmDatabase.tblAccountWAccountID.ASString;
  dmDatabase.qryTransActionReport.Filtered:=True;
  if (not fmGLLedgerOptions.dbcboxNilBal.Checked)
    AND  (dmDatabase.qryTransActionReport.RecordCount=0)
     AND (AccEndBal=0) AND (AccStartBal=0)then
  begin
    PrintBand := False;
    SkipBand := True;
     PrintLastband := PrintBand ;
    Exit;
  end;
  CumulBal:=AccStartBal;
  if CumulBal >= 0 then
  begin
    BeginDebit.Caption := FormatFloat(getviewmask(0),CumulBal  );
    BeginCredit.Caption := '';
  end
  else
  begin
    BeginDebit.Caption := '';
    BeginCredit.Caption := FormatFloat(getviewmask(0),-CumulBal  );
  end;
  QRLabel6.Enabled:= not qrBdPeriod.Enabled;
  BeginDate.Enabled:= not qrBdPeriod.Enabled;
  BeginDebit.Enabled:= not qrBdPeriod.Enabled;
  BeginCredit.Enabled:= not qrBdPeriod.Enabled;
end;

procedure TqrLedger.Foot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if SkipBand then
  begin
    PrintBand := False;
    SkipBand := False;
    exit;
  end;
  if (dmDatabase.tblAccountSSUBACCOUNTCODE.Value='000') AND (dmDatabase.tblAccountBSubAccounts.Value=1) then
    CumulBal:=GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, ToID, 3);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  EndDate.Caption := dmDatabase.tblPeriodsDEndDate.AsString ;
  if CumulBal>0 then
  begin
    EndDebit.Caption := FormatFloat(getviewmask(0),CumulBal );
    EndCredit.Caption := '';
  end
  else
  begin
    EndDebit.Caption := '';
    EndCredit.Caption := FloatToStrTD2C(-CumulBal, ffFixed,  18, 2);
  end;
  CumulToTal:=CumulToTal+CumulBal;
end;


procedure TqrLedger.QRLabel12Print(sender: TObject; var Value: String);
begin
 Value:=FormatFloat(getviewmask(0),CumulBal );
end;

procedure TqrLedger.QRSysData1Print(sender: TObject; var Value: String);
begin
  Value:= FormatDateTime('dd/mm/yyyy "at" hh:nn:ss ',StrToDateTime(Value));
end;

procedure TqrLedger.QRLabel6Print(sender: TObject; var Value: String);
begin
 if qrBdPeriod.Enabled then
   Value:='';
end;

procedure TqrLedger.BeginDatePrint(sender: TObject; var Value: String);
begin
 if qrBdPeriod.Enabled then
   Value:='';
end;

procedure TqrLedger.qrBdPeriodBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  if (not fmGLLedgerOptions.dbcboxNilBal.Checked) AND (CheckNilTotalBal(dmDatabase.qryTransactionReportWAccountID.Value,MvtID)) then
//  begin
//    PrintBand := False;
//    Exit;
//  end;
  dmDatabase.tblPeriods.Locate('WPeriodID', MvtID, []);
  qrPerBeginDate.Caption :=FormatDateTime('dd/mm/yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  if CumulBal >= 0 then
  begin
    PerBeginDebit.Caption := FormatFloat(getviewmask(0),CumulBal  );
    PerBeginCredit.Caption := '';
  end
  else
  begin
    PerBeginDebit.Caption := '';
    PerBeginCredit.Caption := FloatToStrTD2C(CumulBal * - 1 , ffFixed,  18, 2);
  end;
end;

procedure TqrLedger.qrBdPeriodFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (dmDatabase.tblAccountSSUBACCOUNTCODE.Value='000') AND (dmDatabase.tblAccountBSubAccounts.Value=1) then
    CumulBal:=GetAccountTotal(dmDatabase.tblAccountWAccountID.Value, ToID, 3);
  dmDatabase.tblPeriods.Locate('WPeriodID', MvtID, []);
  qrPrEndDate.Caption := dmDatabase.tblPeriodsDEndDate.AsString ;
  Inc(MvtID);

  Reporttotal := Reporttotal + CumulBal ;

  if CumulBal >= 0 then
  begin
    qrPrEndDebit.Caption := FormatFloat(getviewmask(0),CumulBal  );
    qrPrEndCredit.Caption := '';
  end
  else
  begin
    qrPrEndDebit.Caption := '';
    qrPrEndCredit.Caption := FloatToStrTD2C(-CumulBal  , ffFixed,  18, 2);
  end;
end;

procedure TqrLedger.QRDBText3Print(sender: TObject; var Value: String);
begin
  TmpDDate:=dmDatabase.qryTransActionReportDDate.Value;
end;

procedure TqrLedger.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//var
//  Day, Month, Year : Word;

begin
   // This should be done by filtering or re-executing qryTransaction
   // But the speed ???
   if ((dmDatabase.qryTransactionReportFAmount.ASString='')
     AND (dmDatabase.qryTransactionReporTDDate.AsString='')) Or
     (dmDatabase.qryTransactionReportWAccountID.AsString<>dmDatabase.tblAccountWAccountID.AsString) then
   begin
     PrintBand:=False;
     Exit;
   end;
  PeriodDescription.Caption:=FormatDateTime('mmm yyyy',dmDatabase.qryTransactionReporTDDate.Value);
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID', dmDatabase.qryTransactionReportWBatchTypeID.Value, []);
  BatchName.Caption := dmDatabase.tblBatchTypesSDescription.Value;
   if PrintDocReference then
      begin
        if dmDatabase.qryTransactionReportWDOCID.AsInteger <> 0 then
           begin
            Description.Caption := trim(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT b.SAccountCode || ' + QuotedStr('#') + ' ||a.SREFERENCE FROM DOCHEAD a join account b on a.waccountid = b.Waccountid where a.WDOCID = ' + IntToStr(dmDatabase.qryTransactionReportWDOCID.AsInteger))))
            + ' # ' +
            DMTCCoreLink.ReadDescription(dmDatabase.qryTransactionReportWDescriptionID.AsInteger)
          end else
           Description.Caption := DMTCCoreLink.ReadDescription(dmDatabase.qryTransactionReportWDescriptionID.AsInteger);
      end
   else
   Description.Caption := DMTCCoreLink.ReadDescription(dmDatabase.qryTransactionReportWDescriptionID.AsInteger);

  CumulBal:=CumulBal+dmDatabase.qryTransactionReportFAmount.Value;
  CumulBatch := CumulBatch + dmDatabase.qryTransactionReportFAmount.Value;
  // done : Pieter Mispell but should be translated.
  QrLabel15.caption := dmDatabase.tblBatchTypesSDescription.Value + ' Total';
  if dmDatabase.qryTransactionReportFAmount.Value >= 0 then
  begin
    Debit.Caption := FormatFloat(getviewmask(0),dmDatabase.qryTransactionReportFAmount.Value );
    Credit.Caption := '';
  end
  else
  begin
    Debit.Caption := '';
    Credit.Caption := FloatToStrTD2C(-dmDatabase.qryTransactionReportFAmount.Value, ffFixed, 18, 2);
  end;
  qrDetCumul.Caption:=FormatFloat(getviewmask(0),CumulBal );
end;

procedure TqrLedger.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  MvtID:=GetPeriod(TmpDDate);
  dmDatabase.tblPeriods.Open;
end;

procedure TqrLedger.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  CumulToTal:=0;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  SDate:= dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  Dates.Caption:=DateRange(SDate,EDate);
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel2.Caption:= GetTextLang(238); // Date
  QRLabel3.Caption:= GetTextLang(1284); //Report Range
  QRLabel4.Caption:= GetTextLang(241);// Batch Type
  QRLabel5.Caption:= GetTextLang(1285);//Reference No
  QRLabel7.Caption:= GetTextLang(930);// Detail
  QRLabel9.Caption:= GetTextLang(211);// Debit
  QRLabel13.Caption:= GetTextLang(212);// Credit
  QRLabel10.Caption:= GetTextLang(1286);// Cumulative Balance
  QRLabel6.Caption:=  GetTextLang(1287);// Balance at
  QRLabel11.Caption:= GetTextLang(1287);// Balance at
  QRLabel17.Caption:= GetTextLang(1288);// Opening Balance at
  QRLabel18.Caption:= GetTextLang(1289);// Closing Balance at
  QRLabel1.Caption:= GetTextLang(1290);// Accumulative Total:


end;

procedure TqrLedger.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AccumulToTal.Caption :=  FormatFloat(getviewmask(0),CumulToTal );
end;

procedure TqrLedger.grBatchBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CumulBatch:=0;
end;

procedure TqrLedger.BatchFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel14.caption := FormatFloat(getviewmask(0),CumulBatch )
end;

procedure TqrLedger.WinControlForm_4Create(Sender: TObject);
begin
    DebtorsControl := 0 ;
    CreditorsControl := 0 ; 
end;

end.
