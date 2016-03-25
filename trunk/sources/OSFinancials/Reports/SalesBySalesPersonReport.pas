(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesBySalesPersonReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalesBySalesPerson = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRTypeB: TQRBand;
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
    QRDBText1: TQRDBText;
    qrDRange: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRPersB: TQRBand;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    qrlTotalSales: TQRLabel;
    qrlTotalCost: TQRLabel;
    qrlTotalGP: TQRLabel;
    QRLabel12: TQRLabel;
    qrPTotalSales: TQRLabel;
    qrPTotalNettCost: TQRLabel;
    qrPTotalGP: TQRLabel;
    QRDBText7: TQRDBText;
    qrRepGroupHead: TQRGroup;
    qrRepGroupFoot: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    grpNettSales: TQRLabel;
    grpNettCost: TQRLabel;
    grpGrossProfit: TQRLabel;
    grpGrossProfitPP: TQRLabel;
    qrLblgrItem: TQRLabel;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrAllSelected: TQRLabel;
    QRLISBom: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRTypeBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRPersBBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrRepGroupFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrRepGroupHeadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrSalesBySalesPerson: TqrSalesBySalesPerson;
  GrpSalesTotal,
  GrpCostTotal,
  GrpGPTotal,
  CostTotal,
  SalesTotal,
  GPTotal,
  PersCostTotal,
  PersSalesTotal,
  PersGPTotal,
  GrandCost,
  GrandSales,
  GrandGP             : Real;

implementation

uses Database, GlobalFunctions, DatabaseAccess;

{$R *.DFM}


procedure TqrSalesBySalesPerson.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel1.Caption:='Sales Analysis - Sales By Salesperson';
  qrDRange.Caption:= DateRange(dmDatabase.tblReportingOptions.FieldByName('DSalesBySPFromDate').AsDateTime,
         dmDatabase.tblReportingOptions.FieldByName('DSalesBySPToDate').AsDateTime);

end;

procedure TqrSalesBySalesPerson.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 if dmDatabase.qrySalesBySalespersonWSTOCKTYPEID.AsInteger  <> 1 then
  QRLISBom.Caption := '' else QRLISBom.Caption := '*' ;

  qrlNettSales.Caption := FloatToStrT(dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1), ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1), ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT((dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)) - (dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)), ffFixed, 18, 2);
  if dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1) <> 0 then
    qrlGPP.Caption := FloatToStrT(((((dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)) - (dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1))) / (dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)) * 100)), ffFixed, 18, 2)
  else
    qrlGPP.Caption := '';

 if dmDatabase.qrySalesBySalespersonWSTOCKTYPEID.AsInteger  <> 1 then
  begin
    SalesTotal := SalesTotal + dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1);
    CostTotal := CostTotal + dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1);
    GPTotal := GPTotal + (dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * ((dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)) - (dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)));
    GrpSalesTotal := GrpSalesTotal + dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1);
    GrpCostTotal := GrpCostTotal + dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1);
    GrpGPTotal := GrpGPTotal + (dmDatabase.qrySalesBySalespersonFSellingPrice.AsFloat * ((dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)) - (dmDatabase.qrySalesBySalespersonFCostPrice.AsFloat * (dmDatabase.qrySalesBySalespersonFQty.AsFloat * -1)));
  end;
end;

procedure TqrSalesBySalesPerson.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PersCostTotal:=0;
  PersSalesTotal:=0;
  PersGPTotal:=0;
end;

procedure TqrSalesBySalesPerson.QRTypeBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  PersCostTotal:= PersCostTotal+CostTotal;
  PersSalesTotal:= PersSalesTotal+SalesTotal;
  PersGPTotal:= PersGPTotal+ GPTotal;
end;

procedure TqrSalesBySalesPerson.QRDBText3Print(sender: TObject;
  var Value: String);
begin
 if Value='10' then
   Value:='Invoices'
 else
   value:='Credit Notes';
 QrLabel2.Caption := Value + ' Totals:';  
end;

procedure TqrSalesBySalesPerson.QRPersBBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrpTotalSales.Caption := FloatToStrT(PersSalesTotal, ffFixed, 18, 2);
  qrpTotalNettCost.Caption := FloatToStrT(PersCostTotal, ffFixed, 18, 2);
  qrpTotalGP.Caption := FloatToStrT(PersGPTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + PersSalesTotal;
  GrandCost := GrandCost + PersCostTotal;
  GrandGP := GrandGP + PersGPTotal;
end;

procedure TqrSalesBySalesPerson.QRLabel3Print(sender: TObject;
  var Value: String);
begin
  Value:='Totals for '+dmDatabase.qrySalesBySalespersonSDescription.Value;
end;

procedure TqrSalesBySalesPerson.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;

procedure TqrSalesBySalesPerson.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
end;

procedure TqrSalesBySalesPerson.qrRepGroupFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  tmp:String;
begin
  tmp:='';
  if (dmDatabase.qrySalesBySalespersonWReportingGroup1ID.AsString<>'')
   AND dmdatabase.tblGroups.locate('WGroupID',dmDatabase.qrySalesBySalespersonWReportingGroup1ID.AsString,[]) then
   if dmdatabase.tblGroupsWGroupID.Value<>0 then
     tmp:=dmdatabase.tblGroupsSDescription.Value;
  if (dmDatabase.qrySalesBySalespersonWReportingGroup2ID.AsString<>'')
   AND dmdatabase.tblGroups.locate('WGroupID',dmDatabase.qrySalesBySalespersonWReportingGroup2ID.AsString,[]) then
   if tmp='' then
     tmp:=dmdatabase.tblGroupsSDescription.Value
   else
   if dmdatabase.tblGroupsWGroupID.Value<> 0 then
     tmp:=tmp+'/'+dmdatabase.tblGroupsSDescription.Value;
   qrLblgrItem.caption:=tmp;
   if FixAmount(GrpSalesTotal) <> 0 then
     grpGrossProfitPP.Caption := FloatToStrT(GrpGPTotal*100/GrpSalesTotal, ffFixed, 18, 2)
   else
     grpGrossProfitPP.Caption := '';
   grpNettSales.Caption := FloatToStrT(GrpSalesTotal, ffFixed, 18, 2);
   grpNettCost.Caption := FloatToStrT(GrpCostTotal, ffFixed, 18, 2);
   grpGrossProfit.Caption := FloatToStrT(GrpGPTotal, ffFixed, 18, 2);


end;

procedure TqrSalesBySalesPerson.qrRepGroupHeadBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  GrpSalesTotal := 0;
  GrpCostTotal := 0;
  GrpGPTotal := 0;
end;

procedure TqrSalesBySalesPerson.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

end.
