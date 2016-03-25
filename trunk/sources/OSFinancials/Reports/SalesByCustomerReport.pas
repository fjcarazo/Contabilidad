(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByCustomerReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalesByCustomer = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlNettSales: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    QRLabel2: TQRLabel;
    qrlNettSalesTotalInv: TQRLabel;
    qrlNettCostTotalInv: TQRLabel;
    qrlGPTotalInv: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    qrlTotalSales: TQRLabel;
    qrlTotalCost: TQRLabel;
    qrlTotalGP: TQRLabel;
    qrlType: TQRLabel;
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
    QRLabel12: TQRLabel;
    qrlNettSalesTotalCrNote: TQRLabel;
    qrlNettCostTotalCrNote: TQRLabel;
    qrlGPTotalCrNote: TQRLabel;
    QRLabel16: TQRLabel;
    qrlNettSalesTotal: TQRLabel;
    qrlNettCostTotal: TQRLabel;
    qrlGPTotal: TQRLabel;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSalesByCustomerBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel13Print(sender: TObject; var Value: String);
  private

  public
    BUseCustomer : Boolean ;
  end;

var
  qrSalesByCustomer: TqrSalesByCustomer;
  CrNoteCostTotal ,
  CrNoteSalesTotal ,
  CrNoteGPTotal ,
  CostTotal,
  SalesTotal,
  GPTotal,
  GrandCost,
  GrandSales,
  GrandGP          : Real;

implementation

uses Database, GlobalFunctions,databaseaccess;

{$R *.DFM}


procedure TqrSalesByCustomer.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Case dmDatabase.Temp_1WDocTypeID.Value Of
  11 : qrlType.Caption := gettextlang(2152);
  12 : qrlType.Caption := gettextlang(2153);
  13 : qrlType.Caption := gettextlang(2154);
  Else
    qrlType.Caption := gettextlang(2155)
  end;

// Changed by Sylvain
// 17/07/00
  qrlNettSales.Caption := FloatToStrT(dmDatabase.temp_1FSellingPrice.Value , ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.temp_1FCostPrice.Value , ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT(dmDatabase.temp_1FSellingPrice.Value  - dmDatabase.temp_1FCostPrice.Value , ffFixed, 18, 2);
  if dmDatabase.temp_1FSellingPrice.Value  <> 0 then
    qrlGPP.Caption := FloatToStrT((((dmDatabase.temp_1FSellingPrice.Value  - dmDatabase.temp_1FCostPrice.Value ) / dmDatabase.temp_1FSellingPrice.Value  * 100)), ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
  if (dmDatabase.temp_1WDocTypeID.Value in [10,12]) then
  begin
    SalesTotal := SalesTotal + dmDatabase.temp_1FSellingPrice.Value ;
    CostTotal := CostTotal + dmDatabase.temp_1FCostPrice.Value ;
    GPTotal := GPTotal + (dmDatabase.temp_1FSellingPrice.Value  - dmDatabase.temp_1FCostPrice.Value );
  end
  else
  begin
    CrNoteSalesTotal := CrNoteSalesTotal + dmDatabase.temp_1FSellingPrice.Value ;
    CrNoteCostTotal := CrNoteCostTotal + dmDatabase.temp_1FCostPrice.Value ;
    CrNoteGPTotal := CrNoteGPTotal + (dmDatabase.temp_1FSellingPrice.Value  - dmDatabase.temp_1FCostPrice.Value );
  end;
end;

procedure TqrSalesByCustomer.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
  CrNoteCostTotal := 0;
  CrNoteSalesTotal := 0;
  CrNoteGPTotal := 0;
end;

procedure TqrSalesByCustomer.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Invoice Total}
  qrlNettSalesTotalInv.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotalInv.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotalInv.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  {Cr Note Total}
  qrlNettSalesTotalCrNote.Caption := FloatToStrT(CrNoteSalesTotal, ffFixed, 18, 2);
  qrlNettCostTotalCrNote.Caption := FloatToStrT(CrNoteCostTotal, ffFixed, 18, 2);
  qrlGPTotalCrNote.Caption := FloatToStrT(CrNoteGPTotal, ffFixed, 18, 2);
  {Customer Total}
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal - CrNoteSalesTotal , ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal - CrNoteCostTotal , ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal - CrNoteGPTotal, ffFixed, 18, 2);

  GrandSales := GrandSales + SalesTotal - CrNoteSalesTotal;
  GrandCost := GrandCost + CostTotal - CrNoteCostTotal;
  GrandGP := GrandGP + GPTotal - CrNoteGPTotal;
end;

procedure TqrSalesByCustomer.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;




procedure TqrSalesByCustomer.qrSalesByCustomerBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
  if BUseCustomer Then
  begin
    QRLabel2.Caption := gettextlang(2156){'Invoice Totals :'};
    QRLabel12.Caption := gettextlang(2157){'C/Note Totals :'};
    QRLabel16.Caption := gettextlang(2158){'Customer Totals :'};
    QRLabel1.Caption := gettextlang(2159){'Sales Analysis - Sales By Customer'};
  end
  else
  begin
    QRLabel2.Caption := gettextlang(2160){'Purchass Totals :'};
    QRLabel12.Caption := gettextlang(2161){'Gds/Returned Totals :'};
    QRLabel16.Caption := gettextlang(2162){'Supplier Totals :'};
    QRLabel1.Caption := gettextlang(2163){'Sales Analysis - Purchasses By Supplier'};
  end;
end;

procedure TqrSalesByCustomer.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesByCustFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesByCustToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrSalesByCustomer.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  Value :=  dmDatabase.temp_1SMAINACCOUNTCODE.AsString +
           dmDatabase.temp_1SSUBACCOUNTCODE.AsString + '  '+
           dmDatabase.temp_1SDescription.AsString ;
end;

end.
