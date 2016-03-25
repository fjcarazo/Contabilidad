(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ProductByCustomerReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrProductByCustomer = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand5: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    qrlQty: TQRLabel;
    qrlNetSales: TQRLabel;
    qrlGP: TQRLabel;
    qrlGPP: TQRLabel;
    qrlQtyTotal: TQRLabel;
    qrlSalesTotal: TQRLabel;
    qrlProfTotal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    qrlGrandQty: TQRLabel;
    qrlGrandNett: TQRLabel;
    qrlGrandGP: TQRLabel;
    Dates: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrAccName: TQRLabel;
    QRShape1: TQRShape;
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
  private

  public

  end;

var
  qrProductByCustomer: TqrProductByCustomer;
  AccountQtyTotal,
  AccountSellTotal,
  AccountGPTotal,
  GrandQtyTotal,
  GrandSellTotal,
  GrandGPTotal       : Real;

implementation

uses Database, GlobalFunctions;

{$R *.DFM}

procedure TqrProductByCustomer.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlQty.Caption := FloatToStrF(- dmDatabase.qryProductByCustomerSUMQty.Value , ffFixed, 18, 2);
  qrlNetSales.Caption := FloatToStrT(dmDatabase.qryProductByCustomerSUMNettSales.Value, ffFixed, 18, 2);
  qrlGP.Caption := FloatToStrT( (dmDatabase.qryProductByCustomerSUMNettSales.Value -
                    dmDatabase.qryProductByCustomerSUMNettCost.Value), ffFixed, 18, 2);
  try
   if dmDatabase.qryProductByCustomerSUMQty.Value = 0 then qrlGPP.Caption := 'QTY=0'
   else
   if dmDatabase.qryProductByCustomerSUMNettSales.Value = 0 then qrlGPP.Caption := 'SP=0'
   else
   qrlGPP.Caption := FloatToStrT((dmDatabase.qryProductByCustomerSUMNettSales.Value -
                     dmDatabase.qryProductByCustomerSUMNettCost.Value) /
                     dmDatabase.qryProductByCustomerSUMNettSales.Value, ffFixed, 18, 2);
  except
   if dmDatabase.qryProductByCustomerSUMQty.Value = 0 then qrlGPP.Caption := 'QTY=0'
   else if dmDatabase.qryProductByCustomerSUMNettSales.Value = 0 then qrlGPP.Caption := 'SP=0'
   else qrlGPP.Caption := '****';
  end;
  AccountQtyTotal := AccountQtyTotal + (-dmDatabase.qryProductByCustomerSUMQty.Value );
  AccountSellTotal := AccountSellTotal + dmDatabase.qryProductByCustomerSUMNettSales.value;
  AccountGPTotal  := AccountGPTotal + dmDatabase.qryProductByCustomerSUMNettSales.Value -
                       dmDatabase.qryProductByCustomerSUMNettCost.Value;
end;

procedure TqrProductByCustomer.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AccountQtyTotal := 0;
  AccountSellTotal:= 0;
  AccountGPTotal  := 0;
  qrAccName.Caption :=  dmDatabase.qryProductByCustomerSMAINACCOUNTCODE.Value +dmDatabase.qryProductByCustomerSSUBACCOUNTCODE.Value +'  '+
        dmDatabase.qryProductByCustomerSDescription.Value;
end;

procedure TqrProductByCustomer.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlQtyTotal.Caption := FloatToStrT(AccountQtyTotal, ffFixed, 18, 2);
  qrlSalesTotal.Caption := FloatToStrT(AccountSellTotal, ffFixed, 18, 2);
  qrlProfTotal.Caption := FloatToStrT(AccountGPTotal, ffFixed, 18, 2);
  GrandQtyTotal := GrandQtyTotal + AccountQtyTotal;
  GrandSellTotal := GrandSellTotal + AccountSellTotal;
  GrandGPTotal := GrandGPTotal + AccountGPTotal;
end;


procedure TqrProductByCustomer.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlGrandQty.Caption := FloatToStrT(GrandQtyTotal, ffFixed, 18, 2);
  qrlGrandNett.Caption := FloatToStrT(GrandSellTotal, ffFixed, 18, 2);
  qrlGrandGP.Caption := FloatToStrT(GrandGPTotal, ffFixed, 18, 2);
end;

procedure TqrProductByCustomer.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  EDate,SDate :TDate;
begin
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DProdByCustFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DProdByCustToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
  GrandQtyTotal := 0;
  GrandSellTotal := 0;
  GrandGPTotal := 0;  
end;

end.
