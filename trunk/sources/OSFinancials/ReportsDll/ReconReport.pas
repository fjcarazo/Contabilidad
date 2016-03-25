(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReconReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,ReconOptions;

type
  TqrReconReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    Reference: TQRLabel;
    Detail1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    Foot1: TQRBand;
    lblBatchTotal: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    lblDifference: TQRLabel;
    QRLabel6: TQRLabel;
    qrLblDateref: TQRLabel;
    QRShape8: TQRShape;
    QRShape2: TQRShape;
    qrlblRecBal: TQRLabel;
    qrlblBankBal: TQRLabel;
    qrlblWarningMsg: TQRLabel;
    qrlblWarningBatch: TQRLabel;
    qrLblUnposted: TQRLabel;
    qrlblWarningBatch1: TQRLabel;
    qrBankDesc: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Detail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Foot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrLblUnpostedPrint(sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private
    FfmReconOptions: TfmReconOptions;
    procedure SetfmReconOptions(const Value: TfmReconOptions);

  public
     vAccountID:integer;
     ViewAllBanks : Boolean ;
     property fmReconOptions : TfmReconOptions  read FfmReconOptions write SetfmReconOptions;
   end;

var
  qrReconReport: TqrReconReport;
  BatchTotal,
  MainTotal    : Real;
implementation

Uses
  GlobalFunctions, Database, DatabaseAccess, XRoutines;

{$R *.DFM}
Var
  Unposted:Boolean;
  BatchN:String;
procedure TqrReconReport.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

//  BankTotal:=0;
  dmDatabase.tblAccount.Open;
  qrBankDesc.Caption:='';
  if dmDatabase.tblAccount.Locate('WAccountID',vAccountID,[]) then
  qrBankDesc.Caption:= dmDatabase.tblAccountSDescription.Value;
  dmDatabase.tblAccount.Close;
end;

procedure TqrReconReport.Detail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not (DmDatabase.TblReconBankSCONTRAACCOUNT.AsInteger = 1) then
    Unposted:=True;
  BatchTotal := BatchTotal - DmDatabase.TblReconBankFAmount.Value;
end;

procedure TqrReconReport.Foot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  MainTotal:=MainTotal+ BatchTotal;
  lblBatchTotal.Caption := FormatFloat(getviewmask(0),BatchTotal );
  BatchTotal := 0;
  if Unposted then
    if  qrlblWarningMsg.Caption='' then begin
      qrlblWarningMsg.Caption:='* Warning - This report contains unposted item in batches';
      qrlblWarningBatch.Caption:=BatchN;
    end  
    else
        qrlblWarningBatch1.Caption:=BatchN;
    
end;

procedure TqrReconReport.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat(getviewmask(0),-Str2Float(Value)  )
end;

procedure TqrReconReport.QRLabel3Print(sender: TObject; var Value: String);
var
  tmpId:String;
begin
  With DmDatabase do begin
    tmpId:=FloatToStr(Abs(tblReconBankFDEBIT.Value));
    tblBatchTypes.Active:=True;
    tblBatchTypes.locate('WBatchTypeId',tmpId,[]);
    BatchN:=tblBatchTypesSDescription.Value;
    Value:=BatchN;
    tblBatchTypes.Active:=False;
  end;
end;

procedure TqrReconReport.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TmpPeroid:Integer;
  BankTotal,
  RecBal:Real;
begin
  With DmDataBase do
  Begin
   if not dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState then
     RecBal:=StrToFloat(StringReplace(ReadReportOp(IntToStr(vAccountID)+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) 
     else
      RecBal:=MainTotal+StrToFloat(StringReplace(ReadReportOp(IntToStr(vAccountID)+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) ; {Str2Float(tblReportingOptions.FieldByName('FReconBankBalance').AsString);}
    qrlblRecBal.Caption:=FormatFloat(getviewmask(0),RecBal );
    qrLblDateref.Caption:=gettextlang(2147){'Bank balance at} +' '+DateToStr(fmReconOptions.dbdtUntilDate.Date)+ '  '+ gettextlang(2148){According to TurboCash:}+' ';
    TmpPeroid:=GetPeriod(tblReportingOptions.FieldByName('DReconUntil').AsDateTime);
    if TmpPeroid=0 then TmpPeroid:=26;
    BankTotal:=GetExactAccountTotal(vAccountID, TmpPeroid,tblReportingOptions.FieldByName('DReconUntil').AsDateTime);
    BankTotal:=BankTotal-vTotalUnposted;
  end;
  qrlblBankBal.Caption:= FormatFloat(getviewmask(0),BankTotal );
  lblDifference.Caption:=FormatFloat(getviewmask(0),BankTotal-RecBal );

end;

procedure TqrReconReport.qrLblUnpostedPrint(sender: TObject;
  var Value: String);
begin
  if DmDatabase.TblReconBankSCONTRAACCOUNT.Asinteger =1 then
     Value:=''
  else
     Value:='*';
end;

procedure TqrReconReport.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Unposted:=False;
  qrlblWarningBatch.Caption:='';
  qrlblWarningBatch1.Caption:='';
  qrlblWarningMsg.Caption:='';  
end;

procedure TqrReconReport.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value:= FormatFloat(getviewmask(0),-Str2Float(Value)  )
end;

procedure TqrReconReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  MainTotal:=0;
  Unposted:=False;
  qrlblWarningBatch.Caption:='';
  qrlblWarningBatch1.Caption:='';
  qrlblWarningMsg.Caption:='';
  qrLblUnposted.Caption:='';
  QRLabel2.Caption := GetTextLang(3013);// ,'Bank balance as per bank statement'
  Reference.caption := GetTextLang(1974); // Reference
  QRLabel8.caption := GetTextLang(1024);// page
  QRLabel1.caption := GetTextLang(3014);// Cash book report
  QRLabel6.caption := GetTextLang(3015);   //Reconciled Bank Balance
  qrLblDateref.caption := GetTextLang(3016); // Bank Balance at
  QRLabel4.caption := GetTextLang(3017); // diverence
  qrlblWarningMsg.caption := GetTextLang(3018); // Warning - This report contains unposted batches
end;

procedure TqrReconReport.SetfmReconOptions(const Value: TfmReconOptions);
begin
  FfmReconOptions := Value;
end;

procedure TqrReconReport.QRDBText6Print(sender: TObject;
  var Value: String);
begin
 // Value := Value + ':' +dmDatabase.TblReconBankWLineID.AsString ;
end;

end.



