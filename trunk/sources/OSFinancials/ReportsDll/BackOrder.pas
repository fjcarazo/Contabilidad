(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BackOrder;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrBackOrderItems = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRBand2: TQRBand;
    qrDebtName: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrBdStkCOde: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlblDtAcc: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel7Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    vTotal:real;
  public

  end;

var
  qrBackOrderItems: TqrBackOrderItems;

implementation

uses Database, GlobalFunctions,DatabaseAccess, XRoutines;

{$R *.DFM}

procedure TqrBackOrderItems.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 vTotal:=0;
end;

procedure TqrBackOrderItems.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   With dmDatabase do begin
    vTotal:=vTotal+tblBackOrderFQty.Value;
    if tblAccount.Locate('WAccountID',tblBackOrderWAccountID.Value,[]) then begin
      qrlblDtAcc.Caption:=tblAccountSACCOUNTCODE.Text;
      qrDebtName.Caption:=tblAccountSDescription.Value;
    end;
   end;
end;

procedure TqrBackOrderItems.QRLabel7Print(sender: TObject; var Value: String);
begin
  Value:=FloatToStrT(vTotal, ffFixed, 18, 2);
end;

procedure TqrBackOrderItems.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value:=FloatToStrT(Str2Float(Value), ffFixed, 18, 2);
end;

procedure TqrBackOrderItems.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel6.Caption:= GetTextLang(960); // Total
  QRLabel2.Caption:= GetTextLang(213); // Stock Code
  QRLabel3.Caption:= GetTextLang(34); // Account
  QRLabel1.Caption:= GetTextLang(1190); //Items on Back Order
  QRLabel4.Caption:= GetTextLang(413); //Quntity
  QRLabel5.Caption:= GetTextLang(216); // Selling Price

end;

end.
