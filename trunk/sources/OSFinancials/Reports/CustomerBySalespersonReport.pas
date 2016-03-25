(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CustomerBySalespersonReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrCustomerBySalesperson = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRBand5: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    qrlNettCost: TQRLabel;
    qrlNetSales: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    qrlNettCostTotal: TQRLabel;
    qrlSalesTotal: TQRLabel;
    qrlProfTotal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    qrlGrandCost: TQRLabel;
    qrlGrandNett: TQRLabel;
    qrlGrandGP: TQRLabel;
    QRDBText1: TQRDBText;
    Dates: TQRLabel;
    qrAllSelected: TQRLabel;
    QRShape1: TQRShape;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  qrCustomerBySalesperson: TqrCustomerBySalesperson;
  AccountCostTotal,
  AccountSellTotal,
  AccountGPTotal,
  GrandCostTotal,
  GrandSellTotal,
  GrandGPTotal       : Real;

implementation

uses Database, GlobalFunctions;

{$R *.DFM}

procedure TqrCustomerBySalesperson.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {Fixed by Sylvain 10/05/2001}
  qrlNetSales.Caption := FloatToStrT(dmDatabase.qryCustomerBySalespersonTotalNettSales.Value , ffFixed, 18, 2);
  qrlNettCost.Caption := FloatToStrT(dmDatabase.qryCustomerBySalespersonTotalNettCost.Value , ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT(dmDatabase.qryCustomerBySalespersonTotalNettSales.Value - dmDatabase.qryCustomerBySalespersonTotalNettCost.Value, ffFixed, 18, 2);
  if dmDatabase.qryCustomerBySalespersonSUMQty.Value = 0 then
       qrlGPP.Caption := 'QTY=0' ;
  if dmDatabase.qryCustomerBySalespersonTotalNettSales.Value = 0 then
       qrlGPP.Caption := 'SELL=0'
  else
  begin
    qrlGPP.Caption := FloatToStrT((dmDatabase.qryCustomerBySalespersonTotalNettSales.Value  -
                                 dmDatabase.qryCustomerBySalespersonTotalNettCost.Value ) /
                                 dmDatabase.qryCustomerBySalespersonTotalNettSales.Value ,
                                 ffFixed, 18, 2);
    AccountGPTotal  := AccountGPTotal + (dmDatabase.qryCustomerBySalespersonTotalNettSales.Value - dmDatabase.qryCustomerBySalespersonTotalNettCost.Value ) ;
  end;
  AccountSellTotal := AccountSellTotal + dmDatabase.qryCustomerBySalespersonTotalNettSales.Value ;
  AccountCostTotal:= AccountCostTotal + dmDatabase.qryCustomerBySalespersonTotalNettCost.Value ;
end;

procedure TqrCustomerBySalesperson.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AccountCostTotal := 0;
  AccountSellTotal := 0;
  AccountGPTotal  := 0;
end;

procedure TqrCustomerBySalesperson.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlNettCostTotal.Caption := FloatToStrT(AccountCostTotal, ffFixed, 18, 2);
  qrlSalesTotal.Caption := FloatToStrT(AccountSellTotal, ffFixed, 18, 2);
  qrlProfTotal.Caption := FloatToStrT(AccountGPTotal, ffFixed, 18, 2);
  GrandCostTotal := GrandCostTotal + AccountCostTotal;
  GrandSellTotal := GrandSellTotal + AccountSellTotal;
  GrandGPTotal := GrandGPTotal + AccountGPTotal;
end;

procedure TqrCustomerBySalesperson.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlGrandCost.Caption := FloatToStrT(GrandCostTotal, ffFixed, 18, 2);
  qrlGrandNett.Caption := FloatToStrT(GrandSellTotal, ffFixed, 18, 2);
  qrlGrandGP.Caption := FloatToStrT(GrandGPTotal, ffFixed, 18, 2);
end;


procedure TqrCustomerBySalesperson.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  GrandCostTotal := 0;
  GrandSellTotal := 0;
  GrandGPTotal := 0;
end;

procedure TqrCustomerBySalesperson.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  qrlabel2.Caption := 'Totals for '+ Value ;
end;

end.
