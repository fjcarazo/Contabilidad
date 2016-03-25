(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DetailedDebtorListingReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrDetailedDebtorListing = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlRep2: TQRLabel;
    QRDBText7: TQRDBText;
    qrlStatus: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrlRep1: TQRLabel;
    qrlAging: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qrlSalesman: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    qrlContact: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText18Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    Procedure ChangeDs;
  public
    UseCreditor:Boolean;  

  end;

var
  qrDetailedDebtorListing: TqrDetailedDebtorListing;

implementation

Uses
  Database, DatabaseAccess;

{$R *.DFM}

Function GetGroups:String;
begin
  Result:='';
  if dmDatabase.tblGroupsWGroupID.Value>0 then
    Result:=dmDatabase.tblGroupsSDescription.Value;
end;

procedure TqrDetailedDebtorListing.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 // this is the main dataset dont do locate
 // Als the rest (bed or credit) is materdetailed linked to it.
 // dmDatabase.tblAccount.Locate('WAccountID', QRDBText5.DataSet.fieldByName('WAccountID').AsInteger, []);
  dmDatabase.tblGroups.Open;
  if dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup1ID.Value, []) then
    qrlRep1.Caption := GetGroups;
  if dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup2ID.Value, []) then
    qrlRep2.Caption := GetGroups;
  if UseCreditor<>True then
  if dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblDebtorWSalesmanID.Value, []) then
    qrlSalesman.Caption := GetGroups;

  qrlContact.Caption := getcontactname(QRDBText5.DataSet.fieldByName('WContactID').AsInteger);

  if (QRDBText5.DataSet.fieldByName('BOpenItem').Asinteger = 1) then
    qrlAging.Caption := GetTextLang(1320){'Open Item'}
  else
    qrlAging.Caption := GetTextLang(1321){'Balance B/F'};
  qrlStatus.Caption := GetTextLang(1322){'Enabled'};
  if UseCreditor<>True then
  if (QRDBText5.DataSet.fieldByName('BDisabled').Asinteger = 1) then
    qrlStatus.Caption := GetTextLang(304){'Disabled'};
  dmDatabase.tblGroups.Close;
end;

procedure TqrDetailedDebtorListing.QRDBText18Print(sender: TObject;
  var Value: String);
begin
  if Value='True' then
    Value:='*'
  else
    Value:='';
end;

Procedure TqrDetailedDebtorListing.ChangeDs;
begin
    if UseCreditor then
    begin
      QRDBText5.DataSet:=dmDatabase.tblCreditor;
      QRLabel1.Caption := GetTExtLang(1317){'List of Creditor Accounts'};
    end
    else
    begin
      QRDBText5.DataSet:=dmDatabase.tblDebtor;
      QRLabel1.Caption:=GetTExtLang(1316) {'List of Debtor Accounts'};
    end;
   QRLabel28.Enabled := UseCreditor<>True;
   QRLabel26.Enabled := UseCreditor<>True;
   QRLabel27.Enabled := UseCreditor<>True;
   QRDBText27.Enabled := UseCreditor<>True;
   QRDBText21.Enabled := UseCreditor<>True;
   qrlSalesman.Enabled := UseCreditor<>True;
    QRDBText8.DataSet:=QRDBText5.DataSet;
    QRDBText9.DataSet:=QRDBText5.DataSet;
    QRDBText10.DataSet:=QRDBText5.DataSet;
    QRDBText12.DataSet:=QRDBText5.DataSet;
    QRDBText7.DataSet:=QRDBText5.DataSet;
    QRDBText5.DataSet:=QRDBText5.DataSet;
    QRDBText6.DataSet:=QRDBText5.DataSet;
    QRDBText11.DataSet:=QRDBText5.DataSet;
    QRDBText13.DataSet:=QRDBText5.DataSet;
    QRDBText14.DataSet:=QRDBText5.DataSet;
    QRDBText15.DataSet:=QRDBText5.DataSet;
    QRDBText16.DataSet:=QRDBText5.DataSet;
    QRDBText21.DataSet:=QRDBText5.DataSet;
    QRDBText22.DataSet:=QRDBText5.DataSet;
    QRDBText27.DataSet:=QRDBText5.DataSet;
//    QRDBText17.DataSet:=QRDBText5.DataSet;
    QRDBText18.DataSet:=QRDBText5.DataSet;
end;

procedure TqrDetailedDebtorListing.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  ChangeDs;
  dmDatabase.tblAccount.First ;
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel3.Caption:= GetTextLang(185); // Name
  QRLabel2.Caption:= GetTextLang(34); // Account
  QRLabel3.Caption:= GetTextLang(186); // Address
  QRLabel14.Caption:= GetTextLang(1323); // Reporting Group 1
  QRLabel16.Caption:= GetTextLang(1324); // Age Type
  QRLabel15.Caption:= GetTextLang(192); // Credit Limit
  QRLabel4.Caption:= GetTextLang(1252); // Telephone 1
  QRLabel10.Caption:= GetTextLang(199); // Delivery Address
  QRLabel11.Caption:= GetTextLang(1325); // Reporting Group 2
  QRLabel12.Caption:= GetTextLang(1293); // Status
  QRLabel17.Caption:= GetTextLang(193); // Charge Amount
  QRLabel9.Caption:= GetTextLang(1253); // Telephone 2
  QRLabel26.Caption:= GetTextLang(1326); // Salesman
  QRLabel28.Caption:= GetTextLang(203); // Customer Discount
  QRLabel7.Caption:= GetTextLang(189); // Fax
  QRLabel27.Caption:= GetTextLang(1328); // Monthly Interest
end;

end.
