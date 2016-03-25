unit InvoiceTaxDetail;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, DBAccess , Uni ;

type
  TqrInvoicedTaxDetail = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrGrTaxType: TQRGroup;
    qrlblTaxDesc: TQRLabel;
    qrBandTaxTypeFooter: TQRBand;
    QRBand4: TQRBand;
    qrTotalGen: TQRLabel;
    QRLabel2: TQRLabel;
    qrlGTax: TQRLabel;
    qrTtTax: TQRLabel;
    qrDescDate: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    Dates: TQRLabel;
    QRBand5: TQRBand;
    qrlblTaxAmount: TQRLabel;
    QGenTax: TuniQuery;
    PeriodGroup: TQRBand;
    QRLabel5: TQRLabel;
    PlblTaxDr: TQRLabel;
    QRLabel22: TQRLabel;
    PlblTaxCr: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    qrlTotal: TQRLabel;
    qrlTax: TQRLabel;
    QRShape1: TQRShape;
    QGenTaxSACCOUNTCODE: TStringField;
    QGenTaxSDESCRIPTION: TStringField;
    QGenTaxPERIOD: TStringField;
    QGenTaxDDATE: TDateTimeField;
    QGenTaxSREFERENCE: TStringField;
    QGenTaxTRANSACTDESC: TStringField;
    QGenTaxFAMOUNT: TFloatField;
    QGenTaxWACCOUNTID: TIntegerField;
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
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDescDatePrint(sender: TObject; var Value: String);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrInvoicedTaxDetail: TqrInvoicedTaxDetail;


implementation

Uses Database, GlobalFunctions, DatabaseAccess, XRoutines;

{$R *.DFM}
Var
  TotPeriodTaxDr,
  TotPeriodTaxCr,
  BatTaxTotal,
  TaxTotal,
  GTax            :
  Double ;

procedure TqrInvoicedTaxDetail.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTax.Caption := FloatToStrT(BatTaxTotal, ffFixed, 18, 2);
end;

procedure TqrInvoicedTaxDetail.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  BatTaxTotal := 0;
 if  dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger =0   then
 begin
  QRLabel13.Enabled:=False;
  QRLabel11.Enabled:=False;
 end
end;

procedure TqrInvoicedTaxDetail.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  tmpTax:real;
begin
//  qrlExcl2.Caption := FloatToStrT(dmDatabase.qryInvDetailFAmount.Value - dmDatabase.qryInvDetailFTaxAmount.Value, ffFixed, 18, 2);

  tmpTax := QGenTaxFAmount.AsFloat;
  qrlblTaxAmount.Caption := FloatToStrT(tmpTax , ffFixed, 18, 2);
  BatTaxTotal:=BatTaxTotal + tmpTax;
  TaxTotal := TaxTotal + tmpTax;
  GTax := GTax + tmpTax;
  if tmpTax>=0 then begin
    TotPeriodTaxDR:=TotPeriodTaxDr+tmpTax;
  end
  else begin
    TotPeriodTaxCr:=TotPeriodTaxCr+tmpTax;
  end;
  if dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger =1   then
    PeriodGroup.Enabled:=False
  else
    PrintBand:=False;
end;

procedure TqrInvoicedTaxDetail.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrTotalGen.Caption:='Total for Report ' ;
  qrTtTax.Caption := FloatToStrT(GTax, ffFixed, 18, 2);

end;

procedure TqrInvoicedTaxDetail.qrGrTaxTypeBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   dmDatabase.tblAccount.Locate('WaccountID', QGenTaxWAccountID.AsInteger,[]);
   qrlblTaxDesc.Caption:=dmDatabase.tblAccountSDescription.Value;
   TaxTotal:=0 ;
end;

procedure TqrInvoicedTaxDetail.qrBandTaxTypeFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel2.Caption := 'Total for ' + dmDatabase.tblAccountSDescription.Value;
  qrlGTax.Caption := FloatToStrT(TaxTotal, ffFixed, 18, 2);

end;

procedure TqrInvoicedTaxDetail.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value:=FloatToStrT(Str2Float(Value), ffFixed, 18, 2);
end;

procedure TqrInvoicedTaxDetail.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmmm  yyyy', QGenTaxDDate.AsDateTime);
end;

procedure TqrInvoicedTaxDetail.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotPeriodTaxDr:=0;
  TotPeriodTaxCr:=0;
end;

procedure TqrInvoicedTaxDetail.qrDescDatePrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('mmmm  yyyy', QGenTaxDDate.AsDateTime);
end;

procedure TqrInvoicedTaxDetail.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  GTax:=0;
end;

procedure TqrInvoicedTaxDetail.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

Var
  SDate,EDate:TDate;
begin
  QRLabel1.Caption := 'Invoiced Detail ' + dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailSTAXAccount').AsString;
  if  dmDatabase.tblReportingOptions.FieldByName('BInvoiceDetailShowDetail').AsInteger =0  then begin
    QRLabel10.Enabled:=False;
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
