unit InvoicedDetail;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrInvoicedDetail = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrlTotal: TQRLabel;
    qrlExcl: TQRLabel;
    qrlTax: TQRLabel;
    qrlExcl2: TQRLabel;
    QRDBText6: TQRDBText;
    qrGrTaxType: TQRGroup;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    qrlblTaxDesc: TQRLabel;
    qrBandTaxTypeFooter: TQRBand;
    QRBand4: TQRBand;
    qrTotalGen: TQRLabel;
    QRLabel2: TQRLabel;
    qrlGExcl: TQRLabel;
    qrlGTax: TQRLabel;
    qrTtExcl: TQRLabel;
    qrTtTax: TQRLabel;
    qrDescDate: TQRLabel;
    PeriodGroup: TQRBand;
    PlblExclDr: TQRLabel;
    QRLabel5: TQRLabel;
    PlblTaxDr: TQRLabel;
    PlblInclDr: TQRLabel;
    QRLabel22: TQRLabel;
    PlblInclCr: TQRLabel;
    PlblExclCr: TQRLabel;
    PlblTaxCr: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlIncl: TQRLabel;
    qrlGIncl: TQRLabel;
    qrlTtIncl: TQRLabel;
    Dates: TQRLabel;
    QRBand5: TQRBand;
    qrlblTaxAmount: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrTaxTypeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBandTaxTypeFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure PeriodGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure qrDescDatePrint(sender: TObject; var Value: String);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrInvoicedDetail: TqrInvoicedDetail;


implementation

Uses Database, GlobalFunctions, DatabaseAccess, XRoutines;

{$R *.DFM}
Var
  TotPeriodExclDr,
  TotPeriodTaxDr,
  TotPeriodExclCr,
  TotPeriodTaxCr,
  BatTaxTotal,BatExcTotal,
  TaxTotal,
  ExclTotal,
  GExcl,
  GTax            : Real;

procedure TqrInvoicedDetail.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotal.Caption := 'Total for ' + dmDatabase.qryInvDetailSDescription.Value;
  qrlExcl.Caption := FloatToStrT(BatExcTotal, ffFixed, 18, 2);
  qrlTax.Caption := FloatToStrT(BatTaxTotal, ffFixed, 18, 2);
  qrlIncl.Caption:='';
  if PeriodGroup.Enabled then
     qrlIncl.Caption:=FloatToStrT(BatExcTotal+BatTaxTotal, ffFixed, 18, 2);
end;

procedure TqrInvoicedDetail.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  BatTaxTotal := 0;
  BatExcTotal := 0;
 if dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger =0  then
 begin
  QRLabel13.Enabled:=False;
  QRLabel11.Enabled:=False;
  QRLabel12.Caption:='Inclusive Amount';
 end
end;

procedure TqrInvoicedDetail.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TxRate,tmpExcl,tmpTax:real;
begin
//  qrlExcl2.Caption := FloatToStrT(dmDatabase.qryInvDetailFAmount.Value - dmDatabase.qryInvDetailFTaxAmount.Value, ffFixed, 18, 2);

  if dmDatabase.qryInvDetailBcashBook.value  =1then begin
    tmpExcl:=FixAmount(dmDatabase.qryInvDetailFAmount.Value);
    tmpTax:=FixAmount(dmDatabase.qryInvDetailFTaxAmount.Value);
    // Fixing T 3.03 Bugs
    TxRate := dmDatabase.qryInvDetailFTaxRate.Value;
    IsAmtIncludeTax(tmpExcl,TxRate,tmpTax,True);
  end
  else begin
//    tmpExcl:=FixAmount(-dmDatabase.qryInvDetailFAmount.Value)+FixAmount(dmDatabase.qryInvDetailFTaxAmount.Value);
    tmpExcl:=FixAmount(-dmDatabase.qryInvDetailFAmount.Value);
    tmpTax:=FixAmount(-dmDatabase.qryInvDetailFTaxAmount.Value);
    // Fixing T 3.03 Bugs
    TxRate := dmDatabase.qryInvDetailFTaxRate.Value;
    IsAmtIncludeTax(tmpExcl,TxRate,tmpTax,False);
    tmpExcl:=FixAmount(tmpExcl-tmpTax);
  end;
  qrlExcl2.Caption := FloatToStrT(tmpExcl , ffFixed, 18, 2);
  qrlblTaxAmount.Caption := FloatToStrT(tmpTax , ffFixed, 18, 2);
  BatTaxTotal:=BatTaxTotal + tmpTax;
  BatExcTotal:=BatExcTotal+ tmpExcl;
  ExclTotal := ExclTotal + tmpExcl;
  TaxTotal := TaxTotal + tmpTax;
  GExcl := GExcl + tmpExcl;
  GTax := GTax + tmpTax;
  if tmpExcl>=0 then begin
    TotPeriodExclDr:=TotPeriodExclDr+tmpExcl;
    TotPeriodTaxDR:=TotPeriodTaxDr+tmpTax;
  end
  else begin
    TotPeriodExclCr:=TotPeriodExclCr+tmpExcl;
    TotPeriodTaxCr:=TotPeriodTaxCr+tmpTax;
  end;
  if dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger =1   then
    PeriodGroup.Enabled:=False
  else
    PrintBand:=False;
end;

procedure TqrInvoicedDetail.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalGen.Caption:='Total for Report ' ;
  qrTtExcl.Caption := FloatToStrT(GExcl, ffFixed, 18, 2);
  qrTtTax.Caption := FloatToStrT(GTax, ffFixed, 18, 2);
  qrlTtIncl.Caption:='';
  if PeriodGroup.Enabled then
     qrlTtIncl.Caption:=FloatToStrT(GExcl+GTax, ffFixed, 18, 2);
end;

procedure TqrInvoicedDetail.qrGrTaxTypeBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dmDatabase.tblAccount.Locate('WaccountID',dmDatabase.
   qryInvDetailWTaxAccountID.Value,[]);
   qrlblTaxDesc.Caption:=dmDatabase.tblAccountSDescription.Value;
   TaxTotal:=0 ;
   ExclTotal:=0;
end;

procedure TqrInvoicedDetail.qrBandTaxTypeFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel2.Caption := 'Total for ' + dmDatabase.tblAccountSDescription.Value;
  qrlGExcl.Caption := FloatToStrT(ExclTotal, ffFixed, 18, 2);
  qrlGTax.Caption := FloatToStrT(TaxTotal, ffFixed, 18, 2);
  qrlGIncl.Caption:='';
  if PeriodGroup.Enabled then
     qrlGIncl.Caption:=FloatToStrT(ExclTotal+TaxTotal, ffFixed, 18, 2);
end;

procedure TqrInvoicedDetail.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value:=FloatToStrT(Str2Float(Value), ffFixed, 18, 2);
end;

procedure TqrInvoicedDetail.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmmm  yyyy', dmDatabase.qryInvDetailDDate.Value);
end;

procedure TqrInvoicedDetail.PeriodGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PlblInclDr.Caption:= FloatToStrT(TotPeriodExclDr+TotPeriodTaxDr, ffFixed, 18, 2);
  PlblExclDr.Caption:= FloatToStrT(TotPeriodExclDr,ffFixed, 18, 2);
  PlblTaxDr.Caption:=  FloatToStrT(TotPeriodTaxDr, ffFixed, 18, 2);
  PlblInclCr.Caption:= FloatToStrT(TotPeriodExclCr+TotPeriodTaxCr, ffFixed, 18, 2);
  PlblExclCr.Caption:= FloatToStrT(TotPeriodExclCr,ffFixed, 18, 2);
  PlblTaxCr.Caption:=  FloatToStrT(TotPeriodTaxCr, ffFixed, 18, 2);
end;

procedure TqrInvoicedDetail.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotPeriodExclDr:=0;
  TotPeriodTaxDr:=0;
  TotPeriodExclCr:=0;
  TotPeriodTaxCr:=0;
end;

procedure TqrInvoicedDetail.QRDBText6Print(sender: TObject;
  var Value: String);
begin
//  Value:=EncodeAccount(dmDatabase.qryInvDetailSMAINACCOUNTCODE.Value,dmDatabase.qryInvDetailSSUBACCOUNTCODE.Value); 
end;

procedure TqrInvoicedDetail.qrDescDatePrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmmm  yyyy', dmDatabase.qryInvDetailDDate.Value);
end;

procedure TqrInvoicedDetail.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  GExcl:=0;
  GTax:=0;
end;

procedure TqrInvoicedDetail.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

Var
  SDate,EDate:TDate;
begin
  QRLabel1.Caption := 'Invoiced Detail ' + dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailSTAXAccount').AsString;
  if dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger = 0  then
  begin
    QRLabel10.Enabled:=False;
    QRLabel12.Caption:='Inclusive Amount';
    QRLabel13.Enabled:=False;
    QRLabel11.Enabled:=False;
  end;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailFromDate').AsInteger, []);
  SDate:= dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailToDate').AsInteger, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  Dates.Caption:=DateRange(SDate,EDate);
  dmDatabase.tblPeriods.Close;
end;

end.
