(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Receipts;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrReceiptsReport = class(TQuickRep)
    QRLoopBand1: TQRLoopBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrReceiptNo: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    qrReceived: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrAmtText: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    procedure qrReceiptNoPrint(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure QRLabel20Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure qrAmtTextPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrReceiptsReport: TqrReceiptsReport;

implementation

uses EditReceipts, GlobalFunctions, Database,DatabaseAccess, XRoutines;

{$R *.DFM}

procedure TqrReceiptsReport.qrReceiptNoPrint(sender: TObject;
  var Value: String);
begin
  Value:=fmEditReceipts.lblReceiptNo.Caption;
end;

procedure TqrReceiptsReport.QRLabel18Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrT(Str2Float(fmEditReceipts.EdtAmount.Text), ffFixed, 18, 2);
end;

procedure TqrReceiptsReport.QRLabel20Print(sender: TObject;
  var Value: String);
begin
  Value := fmEditReceipts.cbxPymtMethod.Text;
end;

procedure TqrReceiptsReport.QRSysData1Print(sender: TObject;
  var Value: String);
begin
    Value:=TopReportDate(Value);
end;

procedure TqrReceiptsReport.QRLoopBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel10.Caption:= fmEditReceipts.lblAccountDesc.caption ;
  QRLabel11.Caption:='';
  QRLabel12.Caption:='';
  QRLabel13.Caption:='';
  QRLabel14.Caption:='';
  qrReceived.Caption := GetTextLang(1276);//; 'Received for';
  with dmDatabase do begin
    if HideWAccountID>0 then begin
     if HideWAccountTypeID=1 then
       qrReceived.Caption :=GetTextLang(1277);//; 'Received from';
       tblDebtor.Filtered:=False;
       tblDebtor.Open;
       tblDebtor.Locate('WAccountID',HideWAccountID,[]);
       QRLabel11.Caption:=tblDebtorSPostal1.Value;
       QRLabel12.Caption:=tblDebtorSPostal2.Value;
       QRLabel13.Caption:=tblDebtorSPostal3.Value;
       QRLabel14.Caption:=tblDebtorSPostalCode.Value;
       tblDebtor.Close;
    end
    else if HideWAccountTypeID=2 then begin
       qrReceived.Caption := GetTextLang(1277);//; 'Received from';
       // Just in Case
    end;

  end;
end;

procedure TqrReceiptsReport.QRLabel23Print(sender: TObject;
  var Value: String);
begin
  Value := fmEditReceipts.edtDescription.Text;
end;

procedure TqrReceiptsReport.qrAmtTextPrint(sender: TObject;
  var Value: String);
begin
  Value:=NumberToText(fmEditReceipts.EdtAmount.Text);
end;

procedure TqrReceiptsReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabel1.Caption:= GetTextLang(1100); // Receipt
  QRLabel2.Caption:= GetTextLang(1273)+' :'; // Receipt Number :
  QRLabel3.Caption:= GetTextLang(1274)+' :'; // Issued by :
  QRLabel15.Caption:= GetTextLang(178); //Description
  QRLabel17.Caption:= GetTextLang(946); // Amount
  QRLabel19.Caption:= GetTextLang(1275); // Payment Method
  QRLabel22.Caption:= GetTextLang(1134); //Signature
  QRLabel25.Caption:= GetTextLang(312);//Tel :
  QRLabel26.Caption:= GetTextLang(189);// Fax
  QRLabel27.Caption:= GetTextLang(191);// E-Mail
end;

end.
