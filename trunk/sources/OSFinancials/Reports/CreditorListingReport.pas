(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CreditorListingReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrCreditorListing = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    qrCount: TQRLabel;
    QRRepGroup: TQRGroup;
    QRDBgrID: TQRDBText;
    QRDBText15: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBgrIDPrint(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
  private

  public
     BUseDebtors:Boolean;
  end;

var
  qrCreditorListing: TqrCreditorListing;
  vCount : Integer;
implementation

Uses
  Database, GlobalFunctions,DatabaseAccess;

{$R *.DFM}


procedure TqrCreditorListing.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vCount:=0;
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel3.Caption:= GetTextLang(185); // Name
  QRLabel2.Caption:= GetTextLang(34); // Account
  QRLabel4.Caption:= GetTextLang(1319); // Telephone
  QRLabel7.Caption:= GetTextLang(189); // Fax
  QRLabel5.Caption:= GetTextLang(1254); // Email address

end;

procedure TqrCreditorListing.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(vCount);
  qrCount.Caption:=IntToStr(vCount)+'.';
end;

procedure TqrCreditorListing.QRDBgrIDPrint(sender: TObject;
  var Value: String);
begin
  if dmDatabase.tblGroups.Locate('WgroupID',Value,[]) then
    Value:= dmDatabase.tblGroupsSDescription.Value
  else
    Value :=GetTextLang(1317){ Unlocated '}
end;

procedure TqrCreditorListing.QRLabel1Print(sender: TObject;
  var Value: String);
begin
 if BUseDebtors then
   Value := GetTextLang(1316){'List of Debtor Accounts'}
 else
   Value := GetTextLang(1317) {'List of Creditor Accounts'};
end;

procedure TqrCreditorListing.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if Value='True' then
    Value:='*'
  else
    Value:='';
end;

procedure TqrCreditorListing.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  Value := ValidateEmail(Value);
end;

end.
