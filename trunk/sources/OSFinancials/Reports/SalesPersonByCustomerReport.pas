(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesPersonByCustomerReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrSalesPersonByCustomer = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlNettSales: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    qrlType: TQRLabel;
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
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    Dates: TQRLabel;
    qrAccDescription: TQRLabel;
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
  qrSalesPersonByCustomer: TqrSalesPersonByCustomer;
  CostTotal,
  SalesTotal,
  GPTotal,
  GrandCost,
  GrandSales,
  GrandGP          : Real;  

implementation
uses database, globalfunctions;
{$R *.DFM}

procedure TqrSalesPersonByCustomer.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesPersByCustFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DSalesPersByCustToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
end;

procedure TqrSalesPersonByCustomer.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  CostTotal := 0;
  SalesTotal := 0;
  GPTotal := 0;
  qrAccDescription.Caption := dmDatabase.Temp_1SMAINACCOUNTCODE.Value +dmDatabase.Temp_1SSUBACCOUNTCODE.Value +'  '+
        dmDatabase.Temp_1SDescription.Value;
end;

procedure TqrSalesPersonByCustomer.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if dmDatabase.Temp_1WDocTypeID.Value = 10 then qrlType.Caption := 'Invoice' else qrlType.Caption := 'Credit Note';
  qrlNettSales.Caption := FloatToStrT(dmDatabase.temp_1FSellingPrice.Value , ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.temp_1FCostPrice.Value , ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT( dmDatabase.temp_1FSellingPrice.Value  -
                               dmDatabase.temp_1FCostPrice.Value , ffFixed, 18, 2);
  if dmDatabase.temp_1FSellingPrice.Value <> 0 then
    qrlGPP.Caption := FloatToStrT((dmDatabase.temp_1FSellingPrice.Value  -
                                     dmDatabase.temp_1FCostPrice.Value ) /
                                     dmDatabase.temp_1FSellingPrice.Value  * 100, ffFixed, 3, 2)
  else
    qrlGPP.Caption := '';
  SalesTotal := SalesTotal + dmDatabase.temp_1FSellingPrice.Value ;
  CostTotal := CostTotal + dmDatabase.temp_1FCostPrice.Value ;
  GPTotal := GPTotal + dmDatabase.temp_1FSellingPrice.Value - dmDatabase.temp_1FCostPrice.Value ;
  dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.temp_1.FieldByName('WSalespersonID').AsString,[]);
  qrlSalesperson.Caption := dmDatabase.tblGroups.FieldByName('SDescription').AsString;
  {
  with dmDatabase.qGen do begin
   if Active then Close;
   SQL.Clear;
   SQL.Add('select SDescription from groups');
   SQL.Add('where WGroupID = "' + dmDatabase.temp_1.FieldByName('WSalespersonID').AsString+'"');
   Open;
   qrlSalesperson.Caption := FieldByName('SDescription').AsString;
   Close;
  end;
  }
end;

procedure TqrSalesPersonByCustomer.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlNettSalesTotal.Caption := FloatToStrT(SalesTotal, ffFixed, 18, 2);
  qrlNettCostTotal.Caption := FloatToStrT(CostTotal, ffFixed, 18, 2);
  qrlGPTotal.Caption := FloatToStrT(GPTotal, ffFixed, 18, 2);
  GrandSales := GrandSales + SalesTotal;
  GrandCost := GrandCost + CostTotal;
  GrandGP := GrandGP + GPTotal;
end;

procedure TqrSalesPersonByCustomer.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTotalSales.Caption := FloatToStrT(GrandSales, ffFixed, 18, 2);
  qrlTotalCost.Caption := FloatToStrT(GrandCost, ffFixed, 18, 2);
  qrlTotalGP.Caption := FloatToStrT(GrandGP, ffFixed, 18, 2);
end;

procedure TqrSalesPersonByCustomer.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCost := 0;
  GrandSales := 0;
  GrandGP := 0;
end;

end.
