(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CustomerByProductReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrCustomerByProductReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlNettSales: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    qrlNettSalesTotal: TQRLabel;
    qrlNettCostTotal: TQRLabel;
    qrlGPTotal: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotalSales: TQRLabel;
    qrlTotalCost: TQRLabel;
    qrlTotalGP: TQRLabel;
    QRBand5: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Dates: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrCustomer: TQRGroup;
    QRDBText2: TQRDBText;
    qrCustFoot: TQRBand;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    qrlCustNettSalesTotal: TQRLabel;
    qrlCustNettCostTotal: TQRLabel;
    qrlCustGPTotal: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrCustomerByProductReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure qrCustomerBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrCustFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrCustomerByProductReport: TqrCustomerByProductReport;
  CostTotal,
  SalesTotal,
  GPTotal,
  CustCostTotal,
  CustSalesTotal,
  CustGPTotal,
  GrandCost,
  GrandSales,
  GrandGP          : Real;  

implementation
uses Database, GlobalFunctions;
{$R *.DFM}

procedure TqrCustomerByProductReport.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DCustByProdFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DCustByProdToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrCustomerByProductReport.qrCustomerByProductReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

procedure TqrCustomerByProductReport.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
end;

procedure TqrCustomerByProductReport.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettSales.Caption := FloatToStrT(dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT((dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)) - (dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)), ffFixed, 18, 2);
  if dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1) <> 0 then
    qrlGPP.Caption := FloatToStrT(((((dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)) - (dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1))) / (dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)) * 100)), ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
//  SalesTotal := SalesTotal + dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1);
//  CostTotal := CostTotal + dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1);
//  GPTotal := GPTotal + (dmDatabase.qryCustomerByProductFSellingPrice.Value * ((dmDatabase.qryCustomerByProductFQty.Value * -1)) - (dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)));

  CustCostTotal := CustCostTotal + dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1);
  CustSalesTotal := CustSalesTotal + dmDatabase.qryCustomerByProductFSellingPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1) ;
  CustGPTotal := CustGPTotal + (dmDatabase.qryCustomerByProductFSellingPrice.Value * ((dmDatabase.qryCustomerByProductFQty.Value * -1)) - (dmDatabase.qryCustomerByProductFCostPrice.Value * (dmDatabase.qryCustomerByProductFQty.Value * -1)));
end;

procedure TqrCustomerByProductReport.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
end;

procedure TqrCustomerByProductReport.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;

procedure TqrCustomerByProductReport.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value := Value + dmDatabase.qryCustomerByProductAccSdescription.Value;
  QRLabel11.Caption :=dmDatabase.qryCustomerByProductAccSdescription.Value ;
end;

procedure TqrCustomerByProductReport.qrCustomerBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  CustCostTotal := 0;
  CustSalesTotal :=00;
  CustGPTotal := 0;
end;

procedure TqrCustomerByProductReport.qrCustFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

  qrlCustNettSalesTotal.Caption := FloatToStrT(CustSalesTotal, ffFixed, 18, 2);
  qrlCustNettCostTotal.Caption := FloatToStrT(CustCostTotal, ffFixed, 18, 2);
  qrlCustGPTotal.Caption := FloatToStrT(CustGPTotal, ffFixed, 18, 2);

  SalesTotal := SalesTotal + CustSalesTotal;
  CostTotal := CostTotal + CustCostTotal;
  GPTotal := GPTotal + CustGPTotal;
end;

end.
