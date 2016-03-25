(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ContactListingReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQrContactListing = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    qrContNbr: TQRLabel;
    qrlblContactName: TQRLabel;
    qrlblContactFax: TQRLabel;
    qrlblContactTel1: TQRLabel;
    qrlblContactTel2: TQRLabel;
    qrlblContactEmail: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrContNbrPrint(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QrContactListing: TQrContactListing;
  ContNbr:LongInt;
implementation

uses Database, ContactListing;

{$R *.DFM}

procedure TQrContactListing.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  dmdatabase.QContacts.first ;
end;

procedure TQrContactListing.qrContNbrPrint(sender: TObject;
  var Value: String);
begin
  Value:=IntToStr(dmdatabase.QContactsRecordID.AsInteger);
end;

procedure TQrContactListing.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
       qrlblContactName.Caption:=  dmdatabase.QContactsLastName.asstring ;
       qrlblContactFax.Caption:=   dmdatabase.QContactsPhone3.asstring ;
       qrlblContactTel1.Caption:=  dmdatabase.QContactsPhone1.asstring ;
       qrlblContactTel2.Caption:=  dmdatabase.QContactsPhone2.asstring ;
       qrlblContactEmail.Caption:= dmdatabase.QContactsEmail.asstring ;
end;

end.
