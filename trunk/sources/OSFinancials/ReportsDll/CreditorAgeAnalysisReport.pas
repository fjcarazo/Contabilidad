(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CreditorAgeAnalysisReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrCreditorAgeAnalysisReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblCurrent: TQRLabel;
    lbl30: TQRLabel;
    lbl60: TQRLabel;
    lbl90: TQRLabel;
    QRLabel3: TQRLabel;
    QRGroup1: TQRGroup;
    Detail1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrlCurrentAmnt: TQRLabel;
    qrl30Amnt: TQRLabel;
    qrl60Amnt: TQRLabel;
    qrl90Amnt: TQRLabel;
    qrlFAmount: TQRDBText;
    Foot1: TQRBand;
    qrlTotal: TQRLabel;
    qrlCurrent: TQRLabel;
    qrl30days: TQRLabel;
    qrl60days: TQRLabel;
    qrl90days: TQRLabel;
    QRBand2: TQRBand;
    qrlTotalTotal: TQRLabel;
    qrlTotalCurrent: TQRLabel;
    qrlTotal30: TQRLabel;
    qrlTotal60: TQRLabel;
    qrlTotal90: TQRLabel;
    QRLabel7: TQRLabel;
    qrlAccount: TQRLabel;
    QRDBText5: TQRDBText;
    qrlTotalg: TQRLabel;
    qrlCurrentg: TQRLabel;
    qrl30daysg: TQRLabel;
    qrl60daysg: TQRLabel;
    qrl90daysg: TQRLabel;
    QRLabel6: TQRLabel;
    AccTel: TQRLabel;
    AccFax: TQRLabel;
    AccEmail: TQRLabel;
    AccCrLimit: TQRLabel;
    qrOpenItenLoopBand: TQRLoopBand;
    qrlnkTotalAmt: TQRLabel;
    qrlnkCurrent: TQRLabel;
    qrlnk30: TQRLabel;
    qrlnk60: TQRLabel;
    qrlnk90: TQRLabel;
    qrOiDescript: TQRLabel;
    qrOiReference: TQRLabel;
    qrOiDate: TQRLabel;
    qrContact: TQRLabel;
    procedure qrCreditorAgeAnalysisReportBeforePrint(
      Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Foot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Detail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlFAmountPrint(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure qrOpenItenLoopBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private


  public
     LanguageText_CreditorAgeAnalysis ,
     LanguageText_To : String ;
     Procedure EvalAllDays;
  end;

var
  qrCreditorAgeAnalysisReport: TqrCreditorAgeAnalysisReport;
  TotalTotal,
  TotalCurrent,
  Total30, Total60,
  Total90            : Real;
  CurrentTotal,
  _30daysTotal,
  _60daysTotal,
  _90daysTotal   : Real;
  ShowTransac :Boolean;
implementation

uses Database, GlobalFunctions, CreditorAgeAnalysisOptions, DatabaseAccess;

{$R *.DFM}

Procedure TqrCreditorAgeAnalysisReport.EvalAllDays;
// Added/Modified by Sylvain 14/01/2000
Var
  OiBool:Boolean;
  Date1,Date2,Date3,Date4:TDate;
  _AccountID:integer;
begin
  Date1:=fmCreditorAgeAnalysisOptions.wwDBDateTimePickerAgeDate.Date;
  Date2:=fmCreditorAgeAnalysisOptions.wwDBDateTimePicker30Days.Date;
  Date3:=fmCreditorAgeAnalysisOptions.wwDBDateTimePicker60Days.Date;
  Date4:=fmCreditorAgeAnalysisOptions.wwDBDateTimePicker90Days.Date;
  OiBool:=fmCreditorAgeAnalysisOptions.dbcbOpenItem.Checked;
  _AccountID:=dmDatabase.qryCreditAgeWAccountID.Value;
//  dmDatabase.tblCreditor.Locate('WAccountID',_AccountID,[]);
//  if dmDatabase.tblCreditorBOpenItem.Value then else OiBool:=False;
  //
//  CalcAgeing(_AccountID,False,OiBool,Date1,Date2,Date3,Date4,CurrentTotal, _30daysTotal, _60daysTotal, _90daysTotal);
  //
  dmDatabase.tblTmpAgeAnal.Locate('WaccountID',_AccountID,[]);
  CurrentTotal := dmDatabase.tblTmpAgeAnalFCurrent.Value;
  _30daysTotal := dmDatabase.tblTmpAgeAnalF30Days.Value;
  _60daysTotal := dmDatabase.tblTmpAgeAnalF60Days.Value;
  _90daysTotal := dmDatabase.tblTmpAgeAnalF90Days.Value;
end;

procedure TqrCreditorAgeAnalysisReport.qrCreditorAgeAnalysisReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  ShowTransac:=(dmDatabase.tblReportingOptions.FieldByName('BCreditorAgeShowTransac').Asinteger = 1);
  Detail1.Enabled :=ShowTransac;
  Foot1.Enabled:=ShowTransac;
  QRLabel2.Enabled:=ShowTransac;
  QRLabel4.Enabled:=ShowTransac;  
  TotalTotal := 0;
  TotalCurrent := 0;
  Total30 := 0;
  Total60 := 0;
  Total90 := 0;
end;

procedure TqrCreditorAgeAnalysisReport.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  dmdatabase.tblSysVars.Open;
  QRLabel1.Caption := LanguageText_CreditorAgeAnalysis +' ' +
                      dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit1').AsString;

  lblCurrent.Caption := dmDatabase.tblReportingOptions.FieldByName('SCreditorAgeRangeName0').AsString +
                        ' '+LanguageText_To +' ' +
                        dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit1').AsString;
  lbl30.Caption := dmDatabase.tblReportingOptions.FieldByName('SCreditorAgeRangeName1').AsString +
                   ' '+LanguageText_To +' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsString;
  lbl60.Caption := dmDatabase.tblReportingOptions.FieldByName('SCreditorAgeRangeName2').AsString +
                   ' '+LanguageText_To +' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit3').AsString;
  lbl90.Caption := dmDatabase.tblReportingOptions.FieldByName('SCreditorAgeRangeName3').AsString +
                   ' '+LanguageText_To +' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit4').AsString;

  if (dmDatabase.tblReportingOptions.FieldByName('BCreditorAgeAccountDetail').Asinteger = 1) then
     QRGroup1.Height:=50
  else
     QRGroup1.Height:=20;
//    AccountDetails.Enabled
end;

procedure TqrCreditorAgeAnalysisReport.Foot1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);

begin
  if Abs(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal)<0.001 then PrintBand:=False;
  qrlCurrent.Caption := FloatToStrT(CurrentTotal, ffFixed, 18, 2);
  qrl30days.Caption := FloatToStrT(_30daysTotal, ffFixed, 18, 2);
  qrl60days.Caption := FloatToStrT(_60daysTotal, ffFixed, 18, 2);
  qrl90days.Caption := FloatToStrT(_90daysTotal, ffFixed, 18, 2);
  qrlTotal.Caption := FloatToStrT(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal, ffFixed, 18, 2);
end;



procedure TqrCreditorAgeAnalysisReport.Detail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  TmpInt :LongInt;
  Temp:Real;
begin
  qrlCurrentAmnt.Caption := '';
  qrl30Amnt.Caption := '';
  qrl60Amnt.Caption := '';
  qrl90Amnt.Caption := '';
//  if (Abs(dmDatabase.qryCreditAge.FieldByName('FOutStandingAmount').AsFloat) < 0.0000001)  AND (Not ShowTransac)then begin
//    PrintBand := false;
//    exit;
//  end;
  if dmDatabase.qryCreditAgeWTransactionID.Isnull Then
    Exit;
  qrlCurrentAmnt.Caption := FloatToStrT(0, ffFixed, 18, 2);
  qrl30Amnt.Caption := FloatToStrT(0, ffFixed, 18, 2);
  qrl60Amnt.Caption := FloatToStrT(0, ffFixed, 18, 2);
  qrl90Amnt.Caption := FloatToStrT(0, ffFixed, 18, 2);
  if (fmCreditorAgeAnalysisOptions.dbcbOpenItem.Checked=False) AND (
     (dmDatabase.qryCreditAgeDDate.AsDateTime <= dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime) or
     (dmDatabase.qryCreditAgeDDate.AsDateTime > dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeCurrentDate').AsDateTime ) ) then
  begin
      PrintBand:=False;
       Exit;
  end;

//  if fmCreditorAgeAnalysisOptions.dbcbOpenItem.Checked=False then
//    temp:= dmDatabase.qryCreditAgeFAmount.Value
//  else
//    temp:= dmDatabase.qryCreditAgeFOutStandingAmount.Value;

// added 28/01/2001
  if fmCreditorAgeAnalysisOptions.dbcbOpenItem.Checked=False then
  begin
    temp:= dmDatabase.qryCreditAgeFAmount.Value
  end
  else
  begin
    if dmDatabase.qryCreditAgeFAmount.Value>0 then
      temp:= dmDatabase.qryCreditAgeFOutStandingAmount.Value
    else
      temp:= dmDatabase.qryCreditAgeFAmount.Value;
  end;

  if (dmDatabase.qryCreditAgeDDate.AsDateTime <=
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit1').AsDateTime) and
     (dmDatabase.qryCreditAgeDDate.AsDateTime >
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime) then
  begin
    qrlCurrentAmnt.Caption := FloatToStrT(Temp, ffFixed, 18, 2);
//    qrl30Amnt.Caption := '';
//    qrl60Amnt.Caption := '';
//    qrl90Amnt.Caption := '';
  end else
  if (dmDatabase.qryCreditAgeDDate.AsDateTime <=
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime) and
     (dmDatabase.qryCreditAgeDDate.AsDateTime >
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit3').AsDateTime) then
  begin
//    qrlCurrentAmnt.Caption := '';
    qrl30Amnt.Caption := FloatToStrT(Temp, ffFixed, 18, 2);
//    qrl60Amnt.Caption := '';
//    qrl90Amnt.Caption := '';
  end else
  if (dmDatabase.qryCreditAgeDDate.AsDateTime <=
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit3').AsDateTime) and
     (dmDatabase.qryCreditAgeDDate.AsDateTime >
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit4').AsDateTime) then
  begin
//    qrlCurrentAmnt.Caption := '';
//    qrl30Amnt.Caption := '';
    qrl60Amnt.Caption := FloatToStrT(Temp, ffFixed, 18, 2);
//    qrl90Amnt.Caption := '';
  end else
  if (dmDatabase.qryCreditAgeDDate.AsDateTime <=
     dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit4').AsDateTime) then
  begin
//    qrlCurrentAmnt.Caption := '';
//    qrl30Amnt.Caption := '';
//    qrl60Amnt.Caption := '';
    qrl90Amnt.Caption := FloatToStrT(Temp, ffFixed, 18, 2);
  end;
  dmDatabase.tblOilinks.Filtered:=False;
  dmDatabase.tblOilinks.Filter:='WAmountTransactionID='+dmDatabase.qryCreditAgeWTransactionID.AsString;
  dmDatabase.tblOilinks.Filtered:=True;
  TmpInt:=dmDatabase.tblOilinks.RecordCount;
  if (Tmpint>0) AND (fmCreditorAgeAnalysisOptions.dbcbOpenItem.Checked) Then  // Statment
//  or ((Tmpint<0) AND (idDocType = 2 )) then // remittance
  begin
    qrOpenItenLoopBand.PrintCount:=TmpInt;
    qrOpenItenLoopBand.Height:=16;
    dmDatabase.tblOilinks.First;
  end
  else
  begin
    qrOpenItenLoopBand.PrintCount:=0;
    qrOpenItenLoopBand.Height:=0;
  end;
end;

procedure TqrCreditorAgeAnalysisReport.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotalCurrent.Caption := FloatToStrT(TotalCurrent, ffFixed, 18, 2);
  qrlTotal30.Caption := FloatToStrT(Total30, ffFixed, 18, 2);
  qrlTotal60.Caption := FloatToStrT(Total60, ffFixed, 18, 2);
  qrlTotal90.Caption := FloatToStrT(Total90, ffFixed, 18, 2);
  qrlTotalTotal.Caption := FloatToStrT(TotalTotal, ffFixed, 18, 2);
end;

procedure TqrCreditorAgeAnalysisReport.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlCurrentg.Caption :='';
  qrl30daysg.Caption := '';
  qrl60daysg.Caption := '';
  qrl90daysg.Caption := '';
  qrlTotalg.Caption := '';
  with dmdatabase.qryCreditAge do
    qrlAccount.Caption :=FullAccountCode(FieldByName('SACCOUNTCODE').AsString,2);
  EvalAllDays;
  if ((Abs(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal)< Abs(dmDatabase.tblReportingOptions.FieldByName('FCREDITorAgeMinimumAmount').AsFloat)) AND (dmDatabase.tblReportingOptions.FieldByName('FCREDITorAgeMinimumAmount').AsFloat<>0))
     Or
     ((dmDatabase.tblReportingOptions.FieldByName('BCreditorAgeIgnoreZeroBal').Asinteger = 1) AND (FixAmount(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal)=0))
     then begin
   PrintBand:=False;
   exit;
  end;
  TotalTotal := TotalTotal + CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal;
  TotalCurrent := TotalCurrent + CurrentTotal;
  Total30 := Total30 + _30daysTotal;
  Total60 := Total60 + _60daysTotal;
  Total90 := Total90 + _90daysTotal;
  if ShowTransac then
  begin
   qrlCurrentg.Caption :='';
   qrl30daysg.Caption := '';
   qrl60daysg.Caption := '';
   qrl90daysg.Caption := '';
   qrlTotalg.Caption := '';
  end
  else
  begin
   qrlCurrentg.Caption := FloatToStrT(CurrentTotal, ffFixed, 18, 2);
   qrl30daysg.Caption := FloatToStrT(_30daysTotal, ffFixed, 18, 2);
   qrl60daysg.Caption := FloatToStrT(_60daysTotal, ffFixed, 18, 2);
   qrl90daysg.Caption := FloatToStrT(_90daysTotal, ffFixed, 18, 2);
   qrlTotalg.Caption := FloatToStrT(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal, ffFixed, 18, 2);
  end;
  if (dmDatabase.tblReportingOptions.FieldByName('BCreditorAgeAccountDetail').Asinteger = 1) then
  begin
    dmDatabase.tblCreditor.Locate('WAccountID',dmDatabase.qryCreditAgeWAccountID.AsString,[]);
    AccTel.Caption:='Tel : '+dmDatabase.tblCreditorSTelephone1.AsString;
    AccFax.Caption:='Fax : '+dmDatabase.tblCreditorSFax.AsString;
    AccCrLimit.Caption:='Credit Limit: '+dmDatabase.tblCreditorFCREDITLimit.AsString;
    AccEmail.Caption:='E-Mail : '+dmDatabase.tblCreditorSEmail.AsString;
    qrContact.Caption := 'Contact :'+ReadContactNAme(dmDatabase.tblCreditorWContactID.AsInteger);
  end
  else
  Begin
    AccTel.Caption:='';
    AccFax.Caption:='';
    AccCrLimit.Caption:='';
    AccEmail.Caption:='';
    qrContact.Caption:='';
  end;

end;

procedure TqrCreditorAgeAnalysisReport.qrlFAmountPrint(sender: TObject;
  var Value: String);
begin
  Value:=FloatToStrT(dmDatabase.qryCreditAgeFAmount.Value, ffFixed, 18, 2);
end;

procedure TqrCreditorAgeAnalysisReport.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mm/yyyy "at" hh:nn:ss ',StrToDateTime(Value));
end;

procedure TqrCreditorAgeAnalysisReport.qrOpenItenLoopBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  TmpFAmt:Real;
begin
  qrlnkTotalAmt.Caption:='';
  qrlnkCurrent.Caption:='';
  qrlnk30.Caption:='';
  qrlnk60.Caption:='';
  qrlnk90.Caption:='';
  qrOiDate.Caption:=dmDatabase.qryCreditAgeDDAte.AsString;
  qrOiReference.Caption:=dmDatabase.qryCreditAgeSReference.Value;
  qrOiDescript.Caption:=dmDatabase.qryCreditAgeSDescription_1.Value;
  TmpFAmt:= dmdatabase.tblOILinksWLinkedAmount.Value-dmdatabase.tblOILinksWOutstandingAmount.Value;
//    qrOiLinkedRef.Caption :='[' + dmdatabase.tblOILinksSReference.Value+']';
  dmDatabase.tblMessage.Open;
  dmDatabase.tblTransaction.Open;
  dmDatabase.tblTransaction.Locate('WTransactionID',dmdatabase.tblOILinksWLinkTransactionID.Value,[]);
  qrOiDate.Caption:=dmDatabase.tblTransactionDDate.AsString;
  qrOiReference.Caption:=dmDatabase.tblTransactionSReference.Value;
  if dmDatabase.tblMessage.locate('WMessageID',dmDatabase.tblTransactionWDescriptionID.Value,[]) then
    qrOiDescript.Caption:=dmDatabase.tblMessageSDescription.Value;
//    if ShowTaxTrans then
//    begin
//      TxRate := dmDatabase.tblTransactionFTaxRate.Value;
//      CalTaxTransactions;
//    end;
  if (Abs(GetPeriod(dmdatabase.tblOILinksDDocDate.Value) - GetPeriod(dmdatabase.tblOILinksDDate.Value))<=1)
     AND (dmDatabase.qryCreditAgeFAmount.Value<0) then
   begin
     Printband := False ;
  end;
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblMessage.Close;
  dmdatabase.tblOILinks.Next;
  qrlnkCurrent.Caption := FloatToStrTD2C(-TmpFAmt, ffFixed, 18, -1)
end;

end.
