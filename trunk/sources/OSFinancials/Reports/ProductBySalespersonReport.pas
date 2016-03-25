(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ProductBySalespersonReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrProductBySalespersonReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
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
    qrlGPTotal: TQRLabel;
    qrlNettSalesTotal: TQRLabel;
    qrlNettCostTotal: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotalSales: TQRLabel;
    qrlTotalCost: TQRLabel;
    qrlTotalGP: TQRLabel;
    Dates: TQRLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrAllSelected: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    qrPrdFooter: TQRBand;
    QRShape3: TQRShape;
    QRLabel13: TQRLabel;
    QRShape4: TQRShape;
    qrlNettPrdSales: TQRLabel;
    qrlNettPrdCost: TQRLabel;
    qrlGPPrd: TQRLabel;
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
    procedure qrProductBySalespersonReportBeforePrint(
      Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrPrdFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrProductBySalespersonReport: TqrProductBySalespersonReport;
  CostTotal,
  SalesTotal,
  GPTotal,
  GrandCost,
  GrandSales,
  GrandGP             : Real;
  PrdCostTotal,
  PrdSalesTotal,
  PrdGPTotal :Real;


implementation

uses Database, GlobalFunctions;
{$R *.DFM}

procedure TqrProductBySalespersonReport.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var  
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DProdBySPFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DProdBySPToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrProductBySalespersonReport.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
end;

procedure TqrProductBySalespersonReport.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettSales.Caption := FloatToStrT(dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1), ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1), ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT((dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)) - (dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)), ffFixed, 18, 2);
  if dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1) <> 0 then
    qrlGPP.Caption := FloatToStrT(((((dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)) - (dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1))) / (dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)) * 100)), ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
  SalesTotal := SalesTotal + dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1);
  CostTotal := CostTotal + dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1);
  GPTotal := GPTotal + (dmDatabase.qryProductBySalespersonFSellingPrice.Value * ((dmDatabase.qryProductBySalespersonFQty.Value * -1)) - (dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)));


  PrdCostTotal := PrdCostTotal + dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1);
  PrdSalesTotal := PrdSalesTotal + dmDatabase.qryProductBySalespersonFSellingPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1);
  PrdGPTotal := PrdGPTotal + (dmDatabase.qryProductBySalespersonFSellingPrice.Value * ((dmDatabase.qryProductBySalespersonFQty.Value * -1)) - (dmDatabase.qryProductBySalespersonFCostPrice.Value * (dmDatabase.qryProductBySalespersonFQty.Value * -1)));

end;

procedure TqrProductBySalespersonReport.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
end;

procedure TqrProductBySalespersonReport.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;

procedure TqrProductBySalespersonReport.qrProductBySalespersonReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

procedure TqrProductBySalespersonReport.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  QRLabel13.Caption := 'Total for : ' + Value;
end;

procedure TqrProductBySalespersonReport.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  QRLabel2.Caption := 'Total for : ' + Value;
end;

procedure TqrProductBySalespersonReport.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrdCostTotal :=0;
  PrdSalesTotal := 0;
  PrdGPTotal :=0;
end;

procedure TqrProductBySalespersonReport.qrPrdFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettPrdSales.Caption := FloatToStrT(PrdSalesTotal, ffFixed, 18, 2);
  qrlNettPrdCost.Caption := FloatToStrT(PrdCostTotal, ffFixed, 18, 2);
  qrlGPPrd.Caption := FloatToStrT(PrdGPTotal, ffFixed, 18, 2);
end;

end.
