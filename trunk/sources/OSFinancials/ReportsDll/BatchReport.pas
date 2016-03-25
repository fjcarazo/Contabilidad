(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchReport;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQrBatchReport = class(TQuickRep)
    QRBand1: TQRBand;
    QrLblBatType: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QrLblContra: TQRLabel;
    QrDbContra: TQRDBText;
    QrLblRecon: TQRLabel;
    qrDescription: TQRLabel;
    qrdbAccount: TQRLabel;
    QRDBText5: TQRDBText;
    qrBatchName: TQRLabel;
    procedure QrBatchReportStartPage(Sender: TCustomQuickRep);
    procedure QrDbContraPrint(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;
  function QrBatchReport: TQrBatchReport;

implementation

uses Database,BatchEntry,GlobalFunctions, TcVariables,DatabaseAccess,XRoutines;

{$R *.DFM}
var
  aQrBatchReport: TQrBatchReport;

function QrBatchReport: TQrBatchReport;
begin
   if not assigned(aQrBatchReport) then
   aQrBatchReport:= TQrBatchReport.Create(Application);
   result := aQrBatchReport ;
end;

procedure TQrBatchReport.QrBatchReportStartPage(Sender: TCustomQuickRep);
begin
 QrLblBatType.Caption:= GetTextLang(1194){'Batch entry details'}+' - '+ dmDatabase.NmBatchType;
 If (IsCashBook<>0) then
 begin
  QrLblContra.Caption:= GetTextLang(1195) +' ' + GetTextLang(946) ; //'Inclusive' + /'Amount';
  // QrLblAccount.Caption:= GetTextLang(946) ;/
     QrDbContra.Alignment := taRightJustify ;
     QrLblContra.Alignment := taRightJustify ;  
 end
 else
 begin
  QrLblRecon.Caption:='';
  QrLblContra.Caption := GetTextLang(1196) +' ' + GetTextLang(34) ; ;//'Contra';
 // QrLblAccount.Caption := //'Account';
  QrDbContra.DataField :='SCONTRAACCOUNT';
 end;
if ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BReverseCreditDebit',false).AsBoolean  then
   begin
     QRLabel9.Caption:=GetTextLang(211);
     QRLabel8.Caption:=GetTextLang(212);
   end;

end;

procedure TQrBatchReport.QrDbContraPrint(sender: TObject;
  var Value: String);
begin
   QrLblRecon.Caption:='';
   if (isCashBook=0) and (DmDataBase.TblBatchSReference.Value='********') then
     value:='';
   If (IsCashbook<>0) then
   begin
     if Not (DmDataBase.TblBatchBreconciled.AsInteger = 1)
       And (DmDataBase.TblBatchSReference.Value<>'********') then
      QrLblRecon.Caption:='#';
      if DmDataBase.TblBatchBExclusive.AsInteger = 1 then
        Value:=FloatToStrT(Str2Float(DmDataBase.TblBatchFAmount.AsString)+Str2Float(DmDataBase.TblBatchFtaxAmount.ASString), ffFixed, 18, 2)
      else
        Value:=FloatToStrT(Str2Float(DmDataBase.TblBatchFAmount.AsString), ffFixed, 18, 2)
   end
end;

procedure TQrBatchReport.QRDBText4Print(sender: TObject;
  var Value: String);
begin
 if Pos('***',fmBatchEntry.Caption)=1 then
   Value:='';
end;

procedure TQrBatchReport.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Main,Sub:String;
begin
  qrDescription.Caption:= GetTextLang(525) ;// 'ACCOUNT DELETED ';
  if Not dmDatabase.tblAccount.Active then dmDatabase.tblAccount.Open;
  Main:=GetMainAccountCode(Dmdatabase.tblBatchSACCOUNT.Value);
  Sub:=GetSubAccountCode(Dmdatabase.tblBatchSACCOUNT.Value);
  if  dmDatabase.tblAccount.Locate('SACCOUNTCODE',VarArrayOf([Main +Sub]),[])
    and (Main+Sub<>'')  then begin
   qrdbAccount.Caption:=GetEncodeAccount;
   qrDescription.Caption:=dmDatabase.tblAccountSDescription.value;
  end;
  // done : This is just confusing and a waste of paper so lets not show it.
  // Sylvain Not for every one. You have a choice to print or to view. and
  // You can print before you balance the batch
  // PrintBand := DmDataBase.TblBatchSReference.Value <> '********' ;
end;

procedure TQrBatchReport.QuickRepAfterPreview(Sender: TObject);
begin
   dmDatabase.tblAccount.Close;
end;

procedure TQrBatchReport.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  Value:=GetAccountDescription(0,Value);
end;

procedure TQrBatchReport.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mm/yyyy "at" hh:nn:ss ',StrToDateTime(Value));
end;

procedure TQrBatchReport.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrBatchName.Caption := fmBatchEntry.Caption;

end;

procedure TQrBatchReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRSysData2.Text:= GetTextLang(1024); // Page
  QrLblBatType.Caption:= GetTextLang(1194); // Batch entry details
  QRLabel1.Caption := GetTextLang(1719);// reference
  QRLabel10.Caption := GetTextLang(2106);// Number
  QRLabel3.Caption := GetTextLang(238);// Date
  QRLabel4.Caption := GetTextLang(20069);// transaction
  QRLabel11.Caption := GetTextLang(930);// detail
  QRLabel6.Caption := GetTextLang(34);// account
  QRLabel7.Caption := GetTextLang(609);// Tax
end;

end.
