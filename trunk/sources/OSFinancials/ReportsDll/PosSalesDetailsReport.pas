unit PosSalesDetailsReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQrPosSalesDetails = class(TQuickRep)
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    qrlNettSales: TQRLabel;
    QRPersB: TQRBand;
    QRLabel3: TQRLabel;
    qrPTotalSales: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText7: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrDates: TQRLabel;
    QRLabel5: TQRLabel;
    qrQty: TQRLabel;
    QRGroup2: TQRGroup;
    qrSTockFooter: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSTockFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPersBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QrPosSalesDetails: TQrPosSalesDetails;
  FQty,FSales,GrandFPesrSales,GrandFSales:Real;

implementation

uses Database, GlobalFunctions,DatabaseAccess;

{$R *.DFM}

procedure TQrPosSalesDetails.QRLabel5Print(sender: TObject;
  var Value: String);
begin
  Value := dmDatabase.QryPosSalesReportSDescription.Value;
end;

procedure TQrPosSalesDetails.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  FQty := FQty + dmDatabase.QryPosSalesReportFQtyShipped.Value;
  FSales := FSales + dmDatabase.QryPosSalesReportFInclusiveAmt.Value;
  qrQty.Caption := FloatToStrT(dmDatabase.QryPosSalesReportFQtyShipped.Value, ffFixed, 18, 2);
  qrlNettSales.Caption := FloatToStrT(dmDatabase.QryPosSalesReportFInclusiveAmt.Value, ffFixed, 18, 2);
end;

procedure TQrPosSalesDetails.qrSTockFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel7.Caption := FloatToStrT(FQty, ffFixed, 18, 2);
  QRLabel9.Caption := FloatToStrT(FSales, ffFixed, 18, 2);
  GrandFPesrSales := GrandFPesrSales + FSales;
  if QRLabel13.Enabled then
  begin
    QRLabel7.Frame.DrawBottom := True;
    QRLabel9.Frame.DrawBottom := True;
  end;
end;

procedure TQrPosSalesDetails.QRPersBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel3.Caption := 'Total for '+ dmDatabase.QryPosSalesReportSDescription.Value;
  qrPTotalSales.Caption := FloatToStrT(GrandFPesrSales, ffFixed, 18, 2);
  GrandFSales := GrandFSales +  GrandFPesrSales;
end;

procedure TQrPosSalesDetails.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    GrandFPesrSales:=0;
end;

procedure TQrPosSalesDetails.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  GrandFSales:=0;
  QRSysData2.Text := GetTextLang(1024); // Page
  QRLabel1.Caption := GetTextLang(1357); // POS Sales Analysis
  QRLabel11.Caption := GetTextLang(652); // Items Code
  QRLabel2.Caption := GetTextLang(1358);// Items Description
  QRLabel4.Caption := GetTextLang(413);//  Qty
  QRLabel6.Caption := GetTextLang(413);// Sales Amount
  QRLabel3.Caption := GetTextLang(1360);// Totals
  QRLabel10.Caption := GetTextLang(1360);// Totals

end;

procedure TQrPosSalesDetails.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel12.Caption := FloatToStrT(GrandFSales, ffFixed, 18, 2);
end;

procedure TQrPosSalesDetails.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  FQty:=0;
  FSales:=0;
end;

end.
