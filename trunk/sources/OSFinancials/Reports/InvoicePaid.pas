unit InvoicePaid;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrInvoicePaid = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    qrlblRange: TQRLabel;
    QRGroup1: TQRGroup;
    qrBatchName: TQRLabel;
    QRBand2: TQRBand;
    qrBatchDesc: TQRLabel;
    qrAccountDesc: TQRLabel;
    qrPaid: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrDateDesc: TQRLabel;
    qrSalesBand: TQRLoopBand;
    qrDDateDesc: TQRLabel;
    qrBatch: TQRLabel;
    qrTo: TQRLabel;
    qrOwing: TQRLabel;
    qrTaxName: TQRLabel;
    qrMessage: TQRLabel;
    qrRcptRef: TQRLabel;
    qrTotal: TQRLabel;
    qrDDate: TQRLabel;
    qrRef: TQRLabel;
    QrBatchFooter: TQRBand;
    QrlblTotal: TQRLabel;
    qrBatTotal: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSalesBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QrBatchFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    RcptRef : String;
    TotalAmt : Real;
  public

  end;

var
  qrInvoicePaid: TqrInvoicePaid;

implementation

uses Database, GlobalFunctions, Main, TcVariables,
  XRoutines, DatabaseAccess;

{$R *.DFM}

procedure TqrInvoicePaid.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  BeDate,EnDate:Tdate;
begin
  dmDatabase.tblPeriods.Active:=True;
  dmDatabase.tblPeriods.Locate('WPeriodID',FromID,[]);
  BeDate:=dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID',ToID,[]);
  EnDate:=dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Active:=False;
  qrlblRange.Caption:=DateRange(BeDate,EnDate);
end;

procedure TqrInvoicePaid.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrAccountDesc.Caption := '';
  qrDateDesc.Caption := GetPeriodDesc(dmDatabase.tblTransactionWPeriodID.Value);
  qrPaid.Caption :=FloatToStrT(-dmDatabase.tblTransactionFAmount.Value, ffFixed, 18, 2);
  dmDatabase.tblBatchtypes.Locate('WbatchtypeID',dmDatabase.tblTransactionWBatchTypeId.Value,[]);
  qrBatchDesc.Caption := dmDatabase.tblBatchtypesSDescription.Value;
  if dmDatabase.tblTransaction.RecordCount>0 then
  begin
    dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblTransactionWAccountID.AsString,[]);
    qrAccountDesc.Caption := dmDatabase.tblAccountSDescription.Value;
  end ;
  qrTaxName.Caption := '';
  qrSalesBand.PrintCount:=0;
  RcptRef := dmDatabase.tblTransactionSReference.Value ;
  if dmDatabase.tblOilinks.Locate('WLinkTransactionID',dmDatabase.tblTransactionWTransactionID.Value,[]) then
  begin
    qrSalesBand.PrintCount:=1;

  end;
end;

procedure TqrInvoicePaid.qrSalesBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TxAmount : Real;
begin
  qrRcptRef.Caption :=RcptRef;
  qrTaxName.Caption := '';
  qrDDate.Caption := '';
  qrDDateDesc.Caption := '';
  qrRef.Caption := '';
  qrBatch.Caption := '';
  TxAmount := 0;
  if dmDatabase.qryTransactionReport.locate('WTransactionID', dmDatabase.tblOilinksWAmountTransactionID.Value,[]) then
  begin
    qrDDate.Caption := dmDatabase.qryTransactionReportDDate.AsString;
    qrDDateDesc.Caption := GetPeriodDesc(dmDatabase.qryTransactionReportWPeriodID.Value);
    dmDatabase.tblBatchtypes.Locate('WbatchtypeID',dmDatabase.qryTransactionReportWBatchTypeID.Value,[]);
    qrBatch.Caption := dmDatabase.tblBatchtypesSDescription.Value;
    qrTo.Caption := FloatToStrT(dmDatabase.tblTransactionFAmount.Value, ffFixed, 18, 2);
    TxAmount := dmDatabase.tblTransactionFAmount.Value - (dmDatabase.tblTransactionFAmount.Value / (1+dmDatabase.qryTransactionReportFTaxRate.Value/100));
    qrOwing.Caption := FloatToStrT(TxAmount , ffFixed, 18, 2);
    dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblOilinksWTaxID.Value,[]);
    qrTaxName.Caption := dmDatabase.tblAccountSDescription.value;
    qrRef.Caption := dmDatabase.qryTransactionReportSReference.Value;
    qrTotal.Caption := qrOwing.Caption ;
  end;
  TotalAmt := TotalAmt + TxAmount;
end;

procedure TqrInvoicePaid.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalAmt := 0;
  dmDatabase.tblBatchtypes.Locate('WbatchtypeID',dmDatabase.tblTransactionWBatchTypeId.Value,[]);
  qrBatchName.Caption := dmDatabase.tblBatchtypesSDescription.Value;
  QrlblTotal.Caption := 'Total tax for '+ dmDatabase.tblBatchtypesSDescription.Value;
end;

procedure TqrInvoicePaid.QrBatchFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrBatTotal.Caption := FloatToStrT(TotalAmt , ffFixed, 18, 2);
end;

end.
