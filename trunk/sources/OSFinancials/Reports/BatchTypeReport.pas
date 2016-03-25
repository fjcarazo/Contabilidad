(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchTypeReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DB, 
    DBAccess , Uni, MemDS;

type
  TqrBatchTypeReport = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    Details: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    AccountDes: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    TaxAccount: TQRLabel;
    IncAmount: TQRLabel;
    ExclAmount: TQRLabel;
    qrAccountCode: TQRLabel;
    qrlblRange: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    qrBatFoot: TQRBand;
    QRLabel10: TQRLabel;
    QRShape1: TQRShape;
    IncToTal: TQRLabel;
    qrgrpPeriod: TQRGroup;
    QrPerFoot: TQRBand;
    QRLabel11: TQRLabel;
    QTransactions: TuniQuery;
    QTransactionsWTRANSACTIONID: TIntegerField;
    QTransactionsWBATCHID: TIntegerField;
    QTransactionsWBATCHTYPEID: TIntegerField;
    QTransactionsWLINEID: TIntegerField;
    QTransactionsBCARRIEDFORWARD: TSmallintField;
    QTransactionsBLASTYEAR: TSmallintField;
    QTransactionsBLINKSUSED: TSmallintField;
    QTransactionsBMULTIPLEITEMS: TSmallintField;
    QTransactionsWACCOUNTID: TIntegerField;
    QTransactionsDDATE: TDateTimeField;
    QTransactionsWPERIODID: TIntegerField;
    QTransactionsSREFERENCE: TStringField;
    QTransactionsFTAXRATE: TFloatField;
    QTransactionsWTAXACCOUNTID: TIntegerField;
    QTransactionsFAMOUNT: TFloatField;
    QTransactionsFTAXAMOUNT: TFloatField;
    QTransactionsFOUTSTANDINGAMOUNT: TFloatField;
    QTransactionsBRECONCILED: TSmallintField;
    QTransactionsWBALANCINGACCOUNTID: TIntegerField;
    QTransactionsWDESCRIPTIONID: TIntegerField;
    QTransactionsWCURRENCYID: TIntegerField;
    QTransactionsFFOREXAMOUNT: TFloatField;
    QTransactionsWUSERID: TIntegerField;
    QTransactionsUNUSED: TIntegerField;
    QTransactionsDSYSDATE: TDateTimeField;
    QTransactionsBUNUSED: TSmallintField;
    QTransactionsWTAX2ID: TIntegerField;
    QTransactionsFCURRENCYRATE2: TFloatField;
    QTransactionsFTAXRATE2: TFloatField;
    QTransactionsFTAX2AMOUNT: TFloatField;
    QTransactionsWJOBCODEID: TIntegerField;
    QTransactionsWPROFILEID: TIntegerField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure qrBatFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel11Print(sender: TObject; var Value: String);
  private

  public
    MaskView : String ;
    ShowContraAccount : boolean ;
    function GetCheckedText : String ; 
  end;

var
  qrBatchTypeReport: TqrBatchTypeReport;
  IncMainTotal:Real;
implementation

Uses Database, BatchTypeReportOptions, GlobalFunctions, Main, TcVariables,DatabaseAccess,
  CheckLst, XRoutines, UDMTCCoreLink, OSFGeneralRoutines;

{$R *.DFM}

procedure TqrBatchTypeReport.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  BeDate,EnDate:Tdate;
begin
  dmDatabase.tblPeriods.Active:=True;
  dmDatabase.tblPeriods.Locate('WPeriodID',FromID,[]);
  BeDate:=dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID',ToID,[]);
  EnDate:=dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Active:=False;
  Details.Caption := GetCheckedText; 
  qrlblRange.Caption:=DateRange(BeDate,EnDate);
end;

procedure TqrBatchTypeReport.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  XRate:Real;
begin

  dmDatabase.tblAccount.Locate('WAccountID',  QTransactionsWAccountID.Value, []);
//   dmDatabase.tblAccountSMAINACCOUNTCODE.Value + '-' + dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
  qrAccountCode.Caption :=GetEncodeAccount;
  if ShowContraAccount then
    begin
      dmDatabase.tblAccount.Locate('WAccountID',  QTransactionsWBalancingAccountID.Value, []);
      AccountDes.Caption:= GetEncodeAccount;
     end
  else
  AccountDes.Caption:=dmDatabase.tblAccountSDescription.Value;

  TaxAccount.Caption:='';
  if dmDatabase.tblAccount.Locate('WAccountID', QTransactionsWTaxAccountID.Value, []) then
    if dmDatabase.tblAccountWAccountID.value>0 then
      TaxAccount.Caption := dmDatabase.tblAccountSDescription.Value;
//11/01/00
  dmDatabase.tblBatchTypes.locate('WBatchTypeID',QTransactionsWBatchTypeID.value,[]);
  XRate:=1+Str2Float(QTransactionsFTaxRate.AsString)/100;
  if dmDatabase.tblBatchTypesBCashBook.value =1then
  begin
    ExclAmount.Caption  := FormatFloat(MaskView,QTransactionsFAmount.Value);
    // done : Pieter Transact holds Taxvalue lets use that as this gives rounding errors
    // This was reported by a Dutch user Jurrian and he search the CSV for the problem
    // But sometime the TaxAmound holds strange values SO watch that

   // IncAmount.Caption := FormatFloat(MaskView,QTransactionsFAmount.Value*XRate);
   // IncMainTotal:=IncMainTotal+ QTransactionsFAmount.Value*XRate;
   // Sylvain: This is now reporting wrong Amount ?
    IncAmount.Caption := FormatFloat(MaskView,QTransactionsFAmount.Value + QTransactionsFTaxAmount.AsFloat);
   // IncMainTotal:= IncMainTotal+ QTransactionsFAmount.Value + QTransactionsFTaxAmount.AsFloat ;
    if GetAccountType(QTransactionsWAccountID.ASInteger)<> 4 then
      IncMainTotal:= IncMainTotal + QTransactionsFAmount.Value + QTransactionsFTaxAmount.AsFloat;
  end
  else
  begin
    // done : see above solution i gess htis would applay for this lines to
    IncAmount.Caption  := FormatFloat(MaskView,QTransactionsFAmount.Value );
    // ExclAmount.Caption := FormatFloat(MaskView,QTransactionsFAmount.Value/XRate);
    ExclAmount.Caption := FormatFloat(MaskView,QTransactionsFAmount.Value - QTransactionsFTaxAmount.AsFloat);
    IncMainTotal:=IncMainTotal+ QTransactionsFAmount.Value;
  end;
end;


procedure TqrBatchTypeReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  MaskView :=  getviewmask(0) ;
  IncMainTotal:=0;
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel1.Caption:= GetTextLang(1199); // Batch entry details
  QRLabel6.Caption:= GetTextLang(238); // Date
  QRLabel2.Caption:= GetTextLang(34);//Account
  QRLabel9.Caption:= GetTextLang(607);//Reference
  QRLabel3.Caption:= GetTextLang(178);//Description
  QRLabel4.Caption:= GetTextLang(609);//Tax
  QRLabel5.Caption:= GetTextLang(1200);//Excl. Amt
  QRLabel7.Caption:= GetTextLang(1201);//Incl. Amt
  QRLabel10.Caption:= GetTextLang(1202);//Total :
  if ShowContraAccount then
     QRLabel2.Caption:= GetTextLang(34) + '/' + GetTextLang(379);//Account
end;

procedure TqrBatchTypeReport.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value :=  DMTCCoreLink.ReadDescription(StrToIntdef(Value,0));
end;

procedure TqrBatchTypeReport.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  TDataBaseRoutines.GetBatchNameById(StrTointDef(Value,-1));
end;

procedure TqrBatchTypeReport.qrBatFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    IncTotal.Caption:=FormatFloat(MaskView,IncMainTotal);
end;

procedure TqrBatchTypeReport.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  IncMainTotal:=0;
end;

procedure TqrBatchTypeReport.QRLabel11Print(sender: TObject;
  var Value: String);
begin
  Value:= gettextlang(600)+ ' : '+ GetPeriodDesc(QTransactionsWPeriodId.Value);
end;

function TqrBatchTypeReport.GetCheckedText: String;
var
 i : Integer ;
begin
  result := '' ;
  for i := 0 to fmBatchTypeReportOptions.CBBatchTypes.Items.Count -1 do
    begin
       if  fmBatchTypeReportOptions.CBBatchTypes.Checked[i] then
         begin
          if result = '' then
          result := fmBatchTypeReportOptions.CBBatchTypes.Items[i]
          else  result := result + ' / ' + fmBatchTypeReportOptions.CBBatchTypes.Items[i] ;
         end;
    end;
 if   result = '' then result := 'WBatchTypeID >-1 ' ;

end;

end.
