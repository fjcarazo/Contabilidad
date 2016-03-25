(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalespersonByProductReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalespersonByProduct = class(TQuickRep)
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
    qrlSalesperson: TQRLabel;
    Dates: TQRLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrSalespersonByProduct: TqrSalespersonByProduct;
  CostTotal,
  SalesTotal,
  GPTotal,
  GrandCost,
  GrandSales,
  GrandGP          : Real;  

implementation
uses Database, GlobalFunctions;
{$R *.DFM}

procedure TqrSalespersonByProduct.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesPersByProdFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesPersByProdToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrSalespersonByProduct.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
end;

procedure TqrSalespersonByProduct.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSales.Caption := FloatToStrT(dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qrySalesPersonByProductFCostPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1), ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT((dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1)) - (dmDatabase.qrySalesPersonByProductFCostPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1)), ffFixed, 18, 2);
  if dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1) <> 0 then
    qrlGPP.Caption := FloatToStrT(((((dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1)) - (dmDatabase.qrySalesPersonByProductFCostPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1))) / (dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1)) * 100)), ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
  SalesTotal := SalesTotal + dmDatabase.qrySalesPersonByProductFSellingPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1);
  CostTotal := CostTotal + dmDatabase.qrySalesPersonByProductFCostPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1);
  GPTotal := GPTotal + (dmDatabase.qrySalesPersonByProductFSellingPrice.Value * ((dmDatabase.qrySalesPersonByProductFQty.Value * -1)) - (dmDatabase.qrySalesPersonByProductFCostPrice.Value * (dmDatabase.qrySalesPersonByProductFQty.Value * -1)));

  with dmDatabase.qGen do begin
   if Active then Close;
   SQL.Clear;
   SQL.Add('select SDescription from groups');
   SQL.Add('where WGroupID = ' + IntToStr(dmDatabase.qrySalesPersonByProduct.FieldByName('WSalesmanID').AsInteger) );
   Open;
   qrlSalesperson.Caption := FieldByName('SDescription').AsString;
   Close;
  end;
end;

procedure TqrSalespersonByProduct.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
end;

procedure TqrSalespersonByProduct.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;

procedure TqrSalespersonByProduct.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

end.
