(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByGroupReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalesByGroup = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    PrepLabel: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    qrlNettSales: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    qrlGPTotal: TQRLabel;
    qrlNettSalesTotal: TQRLabel;
    qrlNettCostTotal: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotalSales: TQRLabel;
    qrlTotalCost: TQRLabel;
    qrlTotalGP: TQRLabel;
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
  private

  public

  end;

var
  qrSalesByGroup: TqrSalesByGroup;
  CostTotal,
  SalesTotal,
  GPTotal,
  GrandCost,
  GrandSales,
  GrandGP             : Real;

implementation

uses Database, GlobalFunctions,databaseAccess, TcVariables;

{$R *.DFM}


procedure TqrSalesByGroup.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

procedure TqrSalesByGroup.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSales.Caption := FormatFloat(getviewmask(0),dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1) );
  qrlNettCost.Caption := FormatFloat(getviewmask(0),dmDatabase.qrySalesByGroupFCostPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1) );
  qrlGP.Caption := FormatFloat(getviewmask(0),(dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1)) - (dmDatabase.qrySalesByGroupFCostPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1)) );
  if dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1) <> 0 then
    qrlGPP.Caption := FormatFloat(getviewmask(0),((((dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1)) - (dmDatabase.qrySalesByGroupFCostPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1))) / (dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1)) * 100)) )
  else
    qrlGPP.Caption := '';
  SalesTotal := SalesTotal + dmDatabase.qrySalesByGroupFSellingPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1);
  CostTotal := CostTotal + dmDatabase.qrySalesByGroupFCostPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1);
  GPTotal := GPTotal + (dmDatabase.qrySalesByGroupFSellingPrice.Value * ((dmDatabase.qrySalesByGroupFQty.Value * -1)) - (dmDatabase.qrySalesByGroupFCostPrice.Value * (dmDatabase.qrySalesByGroupFQty.Value * -1)));
end;

procedure TqrSalesByGroup.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
end;

procedure TqrSalesByGroup.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FormatFloat(getviewmask(0),SalesTotal );
  qrlNettCostTotal.Caption := FormatFloat(getviewmask(0),CostTotal );
  qrlGPTotal.Caption := FormatFloat(getviewmask(0),GPTotal );
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
end;

procedure TqrSalesByGroup.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FormatFloat(getviewmask(0),GrandSales );
  qrlTotalCost.Caption := FormatFloat(getviewmask(0),GrandCost );
  qrlTotalGP.Caption := FormatFloat(getviewmask(0),GrandGP );
end;

end.
