(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AccountListingReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrAccountListing = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    TypeLabel: TQRLabel;
    RepGroup1: TQRLabel;
    RepGroup2: TQRLabel;
    qrAccount: TQRLabel;
    QRGroupBd: TQRGroup;
    qrAccGroupsLbl: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroupBdBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
    GroupID:Integer;
  end;

var
  qrAccountListing: TqrAccountListing;
  AccCount : Integer;
  StrTemp:String;
implementation

Uses Database, GlobalFunctions,DatabaseAccess, OSFGeneralRoutines;

{$R *.DFM}

procedure TqrAccountListing.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel4.Caption := '';
  QRLabel7.Caption := '';
  if GroupID<>1 then
    QRLabel4.Caption := dmDatabase.tblSysVarsSACCOUNTReportName1.Value;
  if GroupID<>2 then
    QRLabel7.Caption := dmDatabase.tblSysVarsSACCOUNTReportName2.Value;
end;

procedure TqrAccountListing.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepGroup1.Caption := '';
  RepGroup2.Caption := '';
  TypeLabel.Caption := '';
  AccCount := AccCount + 1;
  StrTemp:='';

  qrAccount.Caption:= TDataBaseRoutines.AccTypeToChar(dmDatabase.tblAccountWACCOUNTTYPEID.AsInteger) + dmDatabase.tblAccountSMAINACCOUNTCODE.AsString +'-' + dmDatabase.tblAccountSSUBACCOUNTCODE.AsString ;

  if dmDatabase.tblAccountBIncomeExpense.Value =1then
    TypeLabel.Caption := GetTextLang(1188)//'Inc / Exp'
  else
  if dmDatabase.tblAccountWAccountID.Value = dmDatabase.tblSysVarsWDebtorsControlID.Value then
    TypeLabel.Caption := GetTextLang(553);//'Debtors Control';
  if dmDatabase.tblAccountWAccountID.Value = dmDatabase.tblSysVarsWCreditorsControlID.Value then
    TypeLabel.Caption := GetTextLang(552);//'Creditors Control';
  if dmDatabase.tblAccountWAccountID.Value = dmDatabase.tblSysVarsWRetainedIncomeID.Value then
    TypeLabel.Caption := GetTextLang(1187);//'Retained Income';
  if (dmDatabase.tblAccountWAccountTypeID.Value = 3) And (GroupID<>3)  then
    TypeLabel.Caption := GetTextLang(29);// 'Bank Account';
  if (dmDatabase.tblAccountWAccountTypeID.Value = 4) And (GroupID<>3) then
    TypeLabel.Caption := GetTextLang(33);//'Tax Account';

  if (dmDatabase.tblAccountWReportingGroup1ID.Value<>0) And (GroupID<>1) AND
     dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup1ID.Value, []) then
    RepGroup1.Caption := dmDatabase.tblGroupsSDescription.Value ;

  if (dmDatabase.tblAccountWReportingGroup2ID.Value<>0) And (GroupID<>2) AND
     dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup2ID.Value, []) then
    RepGroup2.Caption := dmDatabase.tblGroupsSDescription.Value ;
end;

procedure TqrAccountListing.QRGroupBdBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AccCount:=0;
  qrAccGroupsLbl.Caption:='';
  if (GroupID=1) And  dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup1ID.Value, []) then
    qrAccGroupsLbl.Caption := dmDatabase.tblGroupsSDescription.Value
  else
  if (GroupID=2) And dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblAccountWReportingGroup2ID.Value, []) then
    qrAccGroupsLbl.Caption := dmDatabase.tblGroupsSDescription.Value
  else
  if (GroupID=3) then
   case dmDatabase.tblAccountWAccountTypeID.Value of
    0: qrAccGroupsLbl.Caption:= GetTextLang(32); //'General Ledger';
    1: qrAccGroupsLbl.Caption:= GetTextLang(553); //'Debtor';
    2: qrAccGroupsLbl.Caption:= GetTextLang(552); //'Creditor';
    3: qrAccGroupsLbl.Caption:= GetTextLang(29); //'Bank Account';
    4: qrAccGroupsLbl.Caption:= GetTextLang(33); //'Tax Account';
   end;

end;

procedure TqrAccountListing.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel3.Caption:= GetTextLang(178); // Description
  QRLabel2.Caption:= GetTextLang(34); // Account
  QRLabel1.Caption:= GetTextLang(1189); // List of Accounts

end;

end.
