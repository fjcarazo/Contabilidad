(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByProductReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalesByProduct = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlNettSales: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
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
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrDates: TQRLabel;
    qrQty: TQRLabel;
    qrlQtyTotal: TQRLabel;
    QRLabel11: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSalesByProductBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private
    {}
  public
    BUseCustomer : Boolean;
  end;

var
  qrSalesByProduct: TqrSalesByProduct;
  CostTotal,
  SalesTotal,
  GPTotal,
  QtyTotal,
  GrandCost,
  GrandSales,
  GrandQtyTotal,
  GrandGP          : Real;
  
implementation

uses Database, GlobalFunctions;

{$R *.DFM}


procedure TqrSalesByProduct.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesByProdFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesByProdToDate').AsDateTime;
  qrDates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrSalesByProduct.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSales.Caption := FloatToStrT(dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qrySalesByProductFCostPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT((dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1)) - (dmDatabase.qrySalesByProductFCostPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1)), ffFixed, 18, 2);
  qrQty.Caption := FloatToStrT(-dmDatabase.qrySalesByProductFQty.Value , ffFixed, 18, 2);
  if dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1) <> 0 then
    qrlGPP.Caption := FloatToStrT(((((dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1)) - (dmDatabase.qrySalesByProductFCostPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1))) / (dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1)) * 100)), ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
  SalesTotal := SalesTotal + dmDatabase.qrySalesByProductFSellingPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1);
  CostTotal := CostTotal + dmDatabase.qrySalesByProductFCostPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1);
  GPTotal := GPTotal + (dmDatabase.qrySalesByProductFSellingPrice.Value * ((dmDatabase.qrySalesByProductFQty.Value * -1)) - (dmDatabase.qrySalesByProductFCostPrice.Value * (dmDatabase.qrySalesByProductFQty.Value * -1)));
  QtyTotal := QtyTotal + (dmDatabase.qrySalesByProductFQty.Value * -1);
end;

procedure TqrSalesByProduct.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
  QtyTotal := 0;
end;

procedure TqrSalesByProduct.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  qrlQtyTotal.Caption := FloatToStrT(QtyTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
  GrandQtyTotal := GrandQtyTotal + qtyTotal;
end;

procedure TqrSalesByProduct.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;



procedure TqrSalesByProduct.qrSalesByProductBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
  GrandQtyTotal := 0;
  if BUseCustomer then
  begin
   QrLabel1.Caption := 'Sales Analysis - Sales By Product';
   QrLabel4.Caption := 'Invoice Number';
   QrLabel5.Caption := 'Invoice   Date';
   QrLabel6.Caption := 'Nett Sales Amount';
  end
  else
  begin
   QrLabel1.Caption := 'Sales Analysis - Purchases By Product';
   QrLabel4.Caption := 'Purchasse Number' ;
   QrLabel5.Caption := 'Purchasse Date';
   QrLabel6.Caption := 'Purchasse Amount';
  end;
end;

procedure TqrSalesByProduct.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  QRLabel2.Caption := 'Totals for '+ Value;
end;

end.
