(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DebtorStatementReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrDebtorStatement = class(TQuickRep)
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlDebit: TQRLabel;
    qrlCredit: TQRLabel;
    HideFooter: TQRBand;
    qrl90Label: TQRLabel;
    qrl90Amount: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    qrl60Label: TQRLabel;
    qrl60Amount: TQRLabel;
    qrl30Label: TQRLabel;
    qrl30Amount: TQRLabel;
    qrlCurrentLabel: TQRLabel;
    qrlCurrentAmount: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qrlDateUntil2: TQRLabel;
    qrlDueAmount: TQRLabel;
    qrlDue: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText6: TQRDBText;
    qrlDateUntil: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel11: TQRLabel;
    qrPage: TQRLabel;
    qrAccountCode: TQRLabel;
    qrSDescription: TQRLabel;
    qrAmtCr: TQRLabel;
    qrBBFHeader: TQRGroup;
    QRLabel15: TQRLabel;
    qrBBFfooter: TQRBand;
    QRLabel14: TQRLabel;
    qrCarDT: TQRLabel;
    qrCarCr: TQRLabel;
    qrBBFDT: TQRLabel;
    qrBBFCr: TQRLabel;
    QRShape5: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qrOpenItenLoopBand: TQRLoopBand;
    qrOiDate: TQRLabel;
    qrOiReference: TQRLabel;
    qrOiDescript: TQRLabel;
    qrOiDebit: TQRLabel;
    qrOiCredit: TQRLabel;
    qrOiLinkedRef: TQRLabel;
    QRDBText21: TQRDBText;
    qrContact: TQRLabel;
    qrContactName: TQRLabel;
    QRLabel3: TQRLabel;
    QrVatNbr: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure qrPagePrint(sender: TObject; var Value: String);
    procedure qrBBFHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrBBFfooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrBBFfooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrBBFHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure qrOpenItenLoopBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
  private
    aMin:real;
    AccChar : Char;
    isPymt,
    vPrintFoot:Boolean;
    vPage : Integer ;
    vAcc  : String;
    TotBBF,
    TotCar,
    CurrentTotal,
    _30daysTotal,
    _60daysTotal,
    _90daysTotal   : Double;
    Procedure AligneByPaper;
    Procedure CalTaxTransactions;
  public
    StPreprinted,
    BDebt,
    ShowTaxTrans,
    ShowContact,
    ShowMes, ShowFrames,ShowLogo,
    BPrinted:Boolean;
    iddoctype : Integer ;
  end;

var
  qrDebtorStatement: TqrDebtorStatement;
  TmpFAmt : Double;
  tmpTax,
  TxRate : Double;
implementation

Uses
  Database, GlobalFunctions, Main, DebtorStatementOptions, TcVariables,
  DatabaseAccess, XRoutines, OSFGeneralRoutines;

{$R *.DFM}

Procedure TqrDebtorStatement.CalTaxTransactions;
begin

  if ShowTaxTrans then
  begin
    IsAmtIncludeTax(TmpFAmt,TxRate,tmpTax,False);
    TmpFAmt := TmpFAmt - tmpTax;
  end;
end;

procedure TqrDebtorStatement.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TmpAmt,
  TmpOut:Real;
  TmpInt :LongInt;
begin
  isPymt := False ;
  qrOpenItenLoopBand.PrintCount:=0;
  qrOpenItenLoopBand.Height:=0;
  if ( (ABS(FixAmount(dmDatabase.qryDebtStatementFAmount.Value))<Abs(Str2Float(fmDebtorStatementOptions.dbedtMinAmount.Text)) )AND
       (FixAmount(Abs(Str2Float(fmDebtorStatementOptions.dbedtMinAmount.Text)))<>0) )
   Or( (fmDebtorStatementOptions.dbcbOpenItem.Checked=False) And (dmDatabase.qryDebtStatementDDate.Value<=fmDebtorStatementOptions.wwDBDateTimePicker30Days.Date)) then
  begin
    PrintBand:=False;
    exit;
  end;
  qrlCredit.Caption := '';
  qrlDebit.Caption := '';
  qrAmtCr.Caption:= '';
  TmpOut := FixAmount(dmDatabase.qryDebtStatementFOutstandingAmount.Value);
  TmpAmt := FixAmount(dmDatabase.qryDebtStatementFAmount.Value);
  TxRate := dmDatabase.qryDebtStatementFTaxRate.Value;
  if fmDebtorStatementOptions.dbcbOpenItem.Checked=False then
  begin
    TmpFAmt := TmpAmt;
    CalTaxTransactions;
    if TmpAmt > 0 then
      qrlDebit.Caption := FloatToStrT(TmpFAmt, ffFixed, 18, 2)
    else
      qrlCredit.Caption := FloatToStrTD2C(TmpFAmt * -1, ffFixed, 18, 2);
  end
  else
  begin

    dmDatabase.ZQOILinks.close ;
    dmDatabase.ZQOILinks.SQL.Text := 'Select OILinks.*,Messages.* from OILinks  join transact ' +
         ' on OILinks.WAmountTransactionID = transact.WtransactionID join messages on ' +
         '  (transact.WDescriptionId = Messages.WMessageId) where  ' +
          '( (WAmountTransactionID=' +dmDatabase.qryDebtStatementWTransactionID.AsString+') OR (WLinkTransactionID=' + dmDatabase.qryDebtStatementWTransactionID.AsString+')) AND OILinks.DDate>= cast('+ QuotedStr(FormatDateTime('YYYY/MM/DD',fmDebtorStatementOptions.wwDBDateTimePicker90Days.Date)) +' as date)' ;

    dmDatabase.ZQOILinks.open ;




 {   dmDatabase.tblOilinks.Filtered:=False;
    dmDatabase.tblOilinks.Filter:='( (WAmountTransactionID=' +dmDatabase.qryDebtStatementWTransactionID.AsString+') OR (WLinkTransactionID=' + dmDatabase.qryDebtStatementWTransactionID.AsString+')) AND DDate>='+ FormatDateTime('YYYY-MM-DD',fmDebtorStatementOptions.wwDBDateTimePicker90Days.Date);
    dmDatabase.tblOilinks.Filtered:=True;   }
    TmpInt:=dmDatabase.ZQOILinks.RecordCount;
    if  TmpInt > 0 then
       begin
         qrAmtCr.Caption:='('+ FloatToStrT(TmpAmt, ffFixed, 18, 2)+')';
         TmpAmt := FixAmount(dmDatabase.qryDebtStatementFOUTSTANDINGAMOUNT.Value);
       end;

    if (Tmpint>0) AND (((TmpAmt<=0) AND (idDocType=1)) OR
      ((TmpAmt>=0) AND (idDocType=2)))
         then
    begin
      {Check if linked in Cuurent Period}
      qrOpenItenLoopBand.PrintCount:=TmpInt;
      qrOpenItenLoopBand.Height:=16;
      dmDatabase.ZQOILinks.First;
    end
    else
    begin
      qrOpenItenLoopBand.PrintCount:=0;
      qrOpenItenLoopBand.Height:=0;
    end;
   // 2001
    if TmpAmt > 0 then
    begin
      if ((idDocType <> 1)AND ((TmpOut=0) Or (Tmpint>0))) then
          TmpFAmt:=TmpAmt
      else
        TmpFAmt:=TmpOut;
      CalTaxTransactions;
      qrlDebit.Caption := FloatToStrT(TmpFAmt, ffFixed, 18, 2);
      isPymt := dmDatabase.qryDebtStatementWAccountTypeID.Value = 2 ;
    end
    else
    begin
      if ((idDocType = 1)AND ((TmpOut=0) Or (Tmpint>0))) then
          TmpFAmt:=TmpAmt
      else
        TmpFAmt:=TmpOut;
      CalTaxTransactions;
      qrlCredit.Caption := FloatToStrTD2C(-TmpFAmt, ffFixed, 18, 2);
      isPymt := dmDatabase.qryDebtStatementWAccountTypeID.Value = 1;
    end;
    if (TmpAmt<> TmpOut) And (TmpOut<>0) then
       qrAmtCr.Caption:='('+ FloatToStrT(TmpAmt, ffFixed, 18, 2)+')';
  end;
  if (ShowTaxTrans And (dmDatabase.qryDebtStatementWTaxAccountID.Value>0)) then
  begin
    qrOpenItenLoopBand.PrintCount:=qrOpenItenLoopBand.PrintCount*2+1;
    qrOpenItenLoopBand.Height:=16;
  end;
  if fmDebtorStatementOptions.dbcbOpenItem.Checked then
  if (TmpAmt =0)and ((dmdatabase.ZQOILinksWAmountTransactionID.AsInteger <> 0) and (dmdatabase.ZQOILinksWLinkTransactionID.AsInteger <> 0)) then
     begin
     PrintBand := false ;
     exit ;
     end;
end;

procedure TqrDebtorStatement.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  dmDatabase.tblSysVars.Open;
//  QrCompPicture.Enabled := ReadReportOp('BUseCompPicLogo',False).AsBoolean ;  
//  qrlDateUntil.Caption := dmDatabase.tblReportingOptionsDDebtStatementDateLimit1.AsString;
  qrlDateUntil.Caption :=  fmDebtorStatementOptions.wwDBDateTimePickerStatementDate.Text;
  dmDatabase.tblTmpAgeAnal.Locate('WaccountID',dmDatabase.qryDebtStatementWAccountID.Value,[]);
  CurrentTotal := dmDatabase.tblTmpAgeAnalFCurrent.Value;
  _30daysTotal := dmDatabase.tblTmpAgeAnalF30Days.Value;
  _60daysTotal := dmDatabase.tblTmpAgeAnalF60Days.Value;
  _90daysTotal := dmDatabase.tblTmpAgeAnalF90Days.Value;
  TotBBF :=  TDataBaseRoutines.GetBalans(dmDatabase.qryDebtStatementWAccountID.Value,fmDebtorStatementOptions.wwDBDateTimePicker30Days.Date-1);
  aMin:=Str2Float(fmDebtorStatementOptions.dbedtMinAmount.Field.AsString);
  if aMin<>0 then
    if ABS(FixAmount(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat ))<Abs(aMin) then
  begin
    PrintBand:=False;
    Exit;
  end;
  Inc(vPage);
  if ShowContact then
  begin
    qrContactName.Caption:=ReadContactNAme(dmDatabase.qryDebtStatementWContactID.Value);
    qrContact.Enabled:=True;
  end
  else
  begin
    qrContactName.Enabled := False;
    qrContact.Enabled := False;
  end;
end;

procedure TqrDebtorStatement.QRDBText6Print(sender: TObject;
  var Value: String);
begin
    Value := AccChar+dmDatabase.qryDebtStatementSACCOUNTCODE.Text;
//    if vAcc<>Value then
//      vPage :=1;
//    vAcc:= Value;
    qrPage.caption := IntToStr(vPage);
end;

procedure TqrDebtorStatement.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if not vPrintFoot then
    Value:='';
end;

procedure TqrDebtorStatement.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if idDocType = 1 then
    Value:= GetTextLang(1128)//'Statement to'
  else
    Value:= GetTextLang(1129);//'Remittance Advice to';
end;

procedure TqrDebtorStatement.QuickRepStartPage(Sender: TCustomQuickRep);
begin
  AccChar:='D';
  if idDocType = 2 then
    AccChar:='C';
  vPrintFoot:=False;
//  if PageNumber=1 then vPage:=0;
end;

procedure TqrDebtorStatement.qrPagePrint(sender: TObject;
  var Value: String);
begin
  if Value='0' then Value:='1';
end;

procedure TqrDebtorStatement.qrBBFHeaderAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  BPrinted:=True;
end;

procedure TqrDebtorStatement.qrBBFfooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  BPrinted:=False;
end;

procedure TqrDebtorStatement.qrBBFfooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  dmDatabase.tblsysVars.open;
//  vPrintFoot:=True;
end;

Procedure TqrDebtorStatement.AligneByPaper;
begin
// Tag:=0;
  if dmDatabase.tblsysVarsWStatementPaperID.Value=50 then
  begin  // Preprinted Paper
    // Paper Length
//    Tag:=3;
    if BDefaultPrint then
      Page.Length:=218.55;
    StPreprinted:=True;
//    Page.TopMargin := StrToFloatDef(ReadReportOp('WStmPageMrgTop').AsString,2);
//    Page.Length := StrToFloatDef(ReadReportOp('WStmPageMrgLength').AsString,218.55);// 218.55;
//    Page.BottomMargin:=StrToFloatDef(ReadReportOp('WStmPageMrgBottom').AsString,13);//13;
//    Page.LeftMargin:=StrToFloatDef(ReadReportOp('WStmPageMrgLeft').AsString,6);//

    // Top Band
    QRDBText1.Size.Left := 5.3;
    QRDBText2.Size.Left := 5.3;
    QRDBText3.Size.Left := 5.3;
//    QRDBText4.Size.Left := 5.3;
    QRDBText5.Size.Left := 5.3;
    HideFooter.Size.Height:=77.40;
    QRDBText11.Left:=340;
    QRDBText6.Size.Top := 22.6; // 29.6 for Plain

    QRLabel1.Size.Left := 5.3;
    QRLabel1.Size.Top := QRDBText4.Size.Top;
    QRDBText4.Enabled:=False;
    // Debit Captions
    QRLabel7.Enabled:=False;
    qrBBFDT.Size.Left:=115;
    qrlDebit.Size.Left:=115;
    qrOiDebit.Size.Left:=115;
    qrCarDT.Size.Left:=115;
    // Amt Captions
//    qrAmtDT.Size.Left:=69;
    qrAmtCr.Size.Left:=69;
    qrOiLinkedRef.Size.Left:=69;
    // Credit Captions
    QRLabel8.Enabled:=False;
    qrBBFCr.Size.Left:=145;
    qrlCredit.Size.Left:=145;
    qrCarCr.Size.Left:=145;
    qrOiCredit.Size.Left:=145;
    // Bott Shapes
    QRShape1.Enabled:=false;
    QRShape2.Enabled:=False;
    // Bott Periodes Lbl
    qrl90Label.Enabled:=False;
    qrl60Label.Enabled:=False;
    qrl30Label.Enabled:=False;
    qrlCurrentLabel.Enabled:=False;
    qrlDue.Enabled:=False;
    // Header
    QRGroup1.Size.Length:=37.8;
//    QRLabel2.Size.Left:=140;// Statement Lbl
    QRShape3.Enabled:=False;
    QRShape4.Enabled:=False;
    QRLabel6.Enabled:=False;
    QRLabel5.Enabled:=False;
    QRLabel2.Enabled:=False;
    QRLabel9.Enabled := False;
    QRLabel10.Enabled := False;
//    qrlDateUntil.Size.Left := QRLabel2.Size.Left;
    qrlDateUntil.Size.Top := QRDBText6.Size.Top;
    QRLabel11.Size.Top := QRDBText6.Size.Top;
    qrPage.Size.Top := QRDBText6.Size.Top;
    // Bottom Band
       // Company infos
    QRDBText12.Size.Top :=32.5;      //22.5 for plain
    QRDBText13.Size.Top :=36.5;      //26.5 for plain
    QRDBText14.Size.Top :=41.0;      //31.0 for plain
    QRDBText15.Size.Top :=45.2;      //35.2 for plain
    QRDBText16.Size.Top :=49.4;      //39.4 for plain
    QRDBText17.Size.Top :=53.7;      //43.7 for plain
    QRDBText18.Size.Top :=57.9;      //47.9 for plain
      // Debt Infos
    qrAccountCode.Size.Top :=49.5;  //37.3 for plain
    qrlDateUntil2.Size.Top :=57.5;  //45.8 for plain

    qrContact.Size.Top := QRDBText14.Size.Top;
    qrContactName.Size.Top := QRDBText14.Size.Top;

  end
  else
  begin
    // Paper Length
    if BDefaultPrint then
     if dmDatabase.tblsysVarsWStatementPaperID.Value=53 then
      Page.Length:=283.00
     else
      Page.Length:=297.00;
    StPreprinted:=False;
    Page.BottomMargin:=10;
    // Debit Captions
    qrBBFDT.Size.Left:=135;
    qrlDebit.Size.Left:=135;
    qrOiDebit.Size.Left:=135;
    qrCarDT.Size.Left:=135;
    // Amt Captions
//    qrAmtDT.Size.Left:=99;
    qrAmtCr.Size.Left:=117;
    qrOiLinkedRef.Size.Left:=117;
    // Credit Captions
    qrBBFCr.Size.Left:=160;
    qrlCredit.Size.Left:=160;
    qrCarCr.Size.Left:=160;
    qrOiCredit.Size.Left:=160;    
    // Header
    QRGroup1.Size.Length:=50.8;
    qrContact.Size.Top := QRDBText14.Size.Top;
    qrContactName.Size.Top := QRDBText14.Size.Top;

    QRShape1.Enabled := ShowFrames;
    QRShape2.Enabled := ShowFrames;
    QRShape3.Enabled := ShowFrames;
    QRShape4.Enabled := ShowFrames;
    QRShape5.Enabled := ShowFrames;
    qrl90Label.Enabled := ShowLogo;
    qrl60Label.Enabled := ShowLogo;
    qrl30Label.Enabled := ShowLogo;
    qrlCurrentLabel.Enabled := ShowLogo;
    qrlDue.Enabled := ShowLogo;
    QRLabel4.Enabled := ShowLogo;
    QRLabel8.Enabled := ShowLogo;
    QRLabel7.Enabled := ShowLogo;
    QRLabel6.Enabled := ShowLogo;
    QRLabel5.Enabled := ShowLogo;

  end;

end;

procedure TqrDebtorStatement.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  AligneByPaper;
end;

procedure TqrDebtorStatement.qrBBFHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  _AccountID:integer;
  Date1,Date2,Date3,Date4:TDate;
  Temp : real;
  OiBool:Boolean;
begin
//  Inc(vPage);
  if BPrinted then begin
    PrintBand:=False;
    exit;
  end;
//
//  qrlDateUntil2.Caption := dmDatabase.tblReportingOptionsDDebtStatementDateLimit1.AsString;
  qrlDateUntil2.Caption := fmDebtorStatementOptions.wwDBDateTimePickerStatementDate.Text;
  qrSDescription.Caption:= dmDatabase.qryDebtStatementSDescription.Value;
  qrAccountCode.Caption:= AccChar + dmDatabase.qryDebtStatementSACCOUNTCODE.Value;
  QrVatNbr.Caption := TDatabaseDebtorCreditorRoutines.GetTaxRef(dmDatabase.qryDebtStatementWAccountID.AsInteger);
//
  qrlCurrentLabel.Caption :=  fmDebtorStatementOptions.dbedtRangeName1.Text;
  qrl30Label.Caption :=  fmDebtorStatementOptions.dbedtRangeName2.Text;
  qrl60Label.Caption :=   fmDebtorStatementOptions.dbedtRangeName3.Text;
  qrl90Label.Caption :=   fmDebtorStatementOptions.dbedtRangeName4.Text;

  Date1:=fmDebtorStatementOptions.wwDBDateTimePickerStatementDate.Date;
  Date2:=fmDebtorStatementOptions.wwDBDateTimePicker30Days.Date;
  Date3:=fmDebtorStatementOptions.wwDBDateTimePicker60Days.Date;
  Date4:=fmDebtorStatementOptions.wwDBDateTimePicker90Days.Date;
  OiBool:=fmDebtorStatementOptions.dbcbOpenItem.Checked;
  _AccountID:=dmDatabase.qryDebtStatementWAccountID.Value;
//
  dmDatabase.tblTmpAgeAnal.Locate('WaccountID',_AccountID,[]);
  CurrentTotal := dmDatabase.tblTmpAgeAnalFCurrent.Value;
  _30daysTotal := dmDatabase.tblTmpAgeAnalF30Days.Value;
  _60daysTotal := dmDatabase.tblTmpAgeAnalF60Days.Value;
  _90daysTotal := dmDatabase.tblTmpAgeAnalF90Days.Value;
   TotBBF :=  TDataBaseRoutines.GetBalans(dmDatabase.qryDebtStatementWAccountID.Value,fmDebtorStatementOptions.wwDBDateTimePicker30Days.Date-1);
 // this is the total 
{  if not fmDebtorStatementOptions.dbcbOpenItem.Checked then
       begin

          CurrentTotal := TDataBaseRoutines.GetBalansBetween(dmDatabase.qryDebtStatementWAccountID.AsInteger, fmDebtorStatementOptions.wwDBDateTimePicker30Days.Date+1,fmDebtorStatementOptions.wwDBDateTimePickerStatementDate.date);
          _30daysTotal := TDataBaseRoutines.GetBalansBetween(dmDatabase.qryDebtStatementWAccountID.AsInteger, fmDebtorStatementOptions.wwDBDateTimePicker60Days.Date+1,fmDebtorStatementOptions.wwDBDateTimePicker30Days.date);
          _60daysTotal := TDataBaseRoutines.GetBalansBetween(dmDatabase.qryDebtStatementWAccountID.AsInteger, fmDebtorStatementOptions.wwDBDateTimePicker90Days.Date+1,fmDebtorStatementOptions.wwDBDateTimePicker60Days.date);
          _90daysTotal := TDataBaseRoutines.GetBalans(dmDatabase.qryDebtStatementWAccountID.AsInteger,fmDebtorStatementOptions.wwDBDateTimePicker90Days.Date);

       end ;  }



       //  CalcAgeing(_AccountID,BDebt,OiBool,Date1,Date2,Date3,Date4,CurrentTotal, _30daysTotal, _60daysTotal, _90daysTotal);
//  TotBBF:=GetExactAccountToTal(_AccountID,GetPeriod(Date2),Date2);

  //
  qrlCurrentAmount.Caption := FloatToStrT(CurrentTotal, ffFixed, 18, -1);
  qrl30Amount.Caption := FloatToStrT(_30daysTotal, ffFixed, 18, -1);
  qrl60Amount.Caption := FloatToStrT(_60daysTotal, ffFixed, 18, -1);
  qrl90Amount.Caption := FloatToStrT(_90daysTotal, ffFixed, 18, -1);
  qrlDueAmount.Caption := FloatToStrT(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat, ffFixed, 18, -1);

//  if fmDebtorStatementOptions.dbcbOpenItem.Checked then
//  begin // OI
//    TotBBF := _30daysTotal+_60daysTotal+_90daysTotal;
//    TotCar := CurrentTotal;
//  end
//  else //BBF
  // done : Pieter tot end bal at period   TotCar :=_30daysTotal+_60daysTotal+_90daysTotal +CurrentTotal;
   // this is balance to date
 

   if fmDebtorStatementOptions.dbcbOpenItem.Checked then
      TotCar:=CurrentTotal else
   TotCar := TDataBaseRoutines.GetBalans(dmDatabase.qryDebtStatementWAccountID.AsInteger,fmDebtorStatementOptions.wwDBDateTimePickerStatementDate.Date);

  qrCarCr.Caption:='';
  qrCarDT.Caption:='';
  qrBBFDT.Caption:='';
  qrBBFCr.Caption:='';
  if TotCar>0 then
    qrCarDT.Caption:=FloatToStrT(TotCar, ffFixed, 18, -1)
  else
    qrCarCr.Caption:=FloatToStrTD2C(-TotCar, ffFixed, 18, -1);
  if TotBBf>0 then
    qrBBFDT.Caption:=FloatToStrT(TotBBf, ffFixed, 18, -1)
  else
    qrBBFCr.Caption:= FloatToStrTD2C(-TotBBf, ffFixed, 18, -1);

//  if dmdatabase.tblsysVarsBCreateBalanceLink.Value and (idDocType=1) then
  if ShowMes and (idDocType=1) then
  begin // This field is re-useded for Statements messages
   qrBBFfooter.Height:=91;
  end
  else
   qrBBFfooter.Height:=22;
end;

procedure TqrDebtorStatement.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  if BPrinted then begin
//    PrintBand:=False;
//    exit;
//  end;

  vPrintFoot:=True;
  PrintBand:=False;
end;

procedure TqrDebtorStatement.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if StPreprinted then
    Value:='';
end;

procedure TqrDebtorStatement.QuickRepEndPage(Sender: TCustomQuickRep);
begin
  if vPrintFoot then
    vPage:=0;
end;

procedure TqrDebtorStatement.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if StPreprinted then
     Value:=Trim(dmDatabase.qryDebtStatementSPostal3.Value+' '+dmDatabase.qryDebtStatementSPostalCode.AsString);

end;

procedure TqrDebtorStatement.qrOpenItenLoopBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
//Var
//  TmpAmt:Real;
begin

  qrOiCredit.Caption:='';
  qrOiDebit.Caption:='';
  qrOiLinkedRef.Caption:='';
  // lets not print linked posted transations they mess up the report
  // This fixes some of the bogus data in this report.
  if ((dmdatabase.ZQOILinksWAmountTransactionID.AsInteger <> 0) and (dmdatabase.ZQOILinksWLinkTransactionID.AsInteger <> 0)) then
     begin
     PrintBand := false ;
     exit ;
     end;

//  if (qrOpenItenLoopBand.Count Mod 2)=0 then
//  begin
  if ShowTaxTrans AND ((qrOpenItenLoopBand.Count Mod 2)=0) then
  begin
    if (dmDatabase.qryDebtStatementWTaxAccountID.Value>0) then
    begin
      qrOiDate.Caption :='';
      qrOiReference.Caption :='';
      qrOiDescript.Caption := '';
      dmDatabase.tblTax.open;
      if dmDatabase.tblTax.Locate('WAccountID',dmDatabase.qryDebtStatementWTaxAccountID.Value,[]) then
        qrOiDescript.Caption := dmDatabase.tblTaxSDescription.Value;
      dmDatabase.tblTax.Close;
  //    TxRate := dmDatabase.qryDebtStatementFTaxRate.Value;
  //    IsAmtIncludeTax(TmpFAmt,TxRate,tmpTax,False);
      If tmpTax<0 then
        qrOiCredit.Caption := FloatToStrTD2C(-tmpTax, ffFixed, 18, -1)
      else
        qrOiDebit.Caption := FloatToStrTD2C(tmpTax, ffFixed, 18, -1);
    end;
  end
  else
  begin
    if (Abs(GetPeriod(dmdatabase.ZQOILinksDDocDate.Value) - GetPeriod(dmdatabase.ZQOILinksDDate.Value))<=1)
     AND (not isPymt) then
      Printband := False
    else
    begin
      qrOiDate.Caption:=dmDatabase.qryDebtStatementDDAte.AsString;
      TmpFAmt:= dmdatabase.ZQOILinksWLinkedAmount.Value;
      // There is a sign conflict on WlinkedAmount Here
      // To solve it I recalculate it.
      if ((idDocType=1) and (TmpFAmt<0)) OR ((idDocType=2) and (TmpFAmt>0)) then
        TmpFAmt := - TmpFAmt;
      qrOiLinkedRef.Caption :='[' + dmDatabase.qryDebtStatementSReference.Value+']';
//      dmDatabase.tblMessage.Open;
      dmDatabase.tblTransaction.Open;
      if dmdatabase.ZQOILinksWAmountTransactionID.AsString<>dmDatabase.qryDebtStatementWTransactionID.AsString then
        dmDatabase.tblTransaction.Locate('WTransactionID',dmdatabase.ZQOILinksWAmountTransactionID.Value,[])
      else
        dmDatabase.tblTransaction.Locate('WTransactionID',dmdatabase.ZQOILinksWLinkTransactionID.Value,[]);
      qrOiDate.Caption:=dmDatabase.tblTransactionDDate.AsString;
      qrOiReference.Caption:=dmDatabase.tblTransactionSReference.Value;
      //get ref from doc if exist
      if  dmDatabase.tblTransactionWDOCID.AsInteger <> 0 then
        begin
         qrOiReference.Caption := TDataBaseDocumentRoutines.GetDocExtReference(dmDatabase.tblTransactionWDOCID.AsInteger);
         if qrOiReference.Caption <> '' then
              qrOiReference.Caption:= dmDatabase.tblTransactionSReference.Value +'/' + qrOiReference.Caption
              else
              qrOiReference.Caption:= dmDatabase.tblTransactionSReference.Value ;
        end;
      qrOiDescript.Caption:=_ReadDescription(dmDatabase.tblTransactionWDescriptionID.Value);
      if ShowTaxTrans then
      begin
        TxRate := dmDatabase.tblTransactionFTaxRate.Value;
        CalTaxTransactions;
      end;
      dmDatabase.tblTransaction.Close;
//      dmDatabase.tblMessage.Close;
      dmdatabase.ZQOILinks.Next;
      If TmpFAmt<0 then
        qrOiCredit.Caption := FloatToStrTD2C(-TmpFAmt, ffFixed, 18, -1)
      else
        qrOiDebit.Caption := FloatToStrT(TmpFAmt, ffFixed, 18, -1);
    end;
  end;
end;

procedure TqrDebtorStatement.QRDBText7Print(sender: TObject;
  var Value: String);
begin
    if idDocType = 2 then
      Value :='';
end;

procedure TqrDebtorStatement.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value := _ReadDescription(dmDatabase.qryDebtStatementWDescriptionID.Value);
end;

procedure TqrDebtorStatement.QRDBText9Print(sender: TObject;
  var Value: String);
  var
    ADocId : Integer ;
    NewTekst : String ;
begin
 ADocid := TDataBaseDocumentRoutines.GetDocIdFromTransactId(dmDatabase.qryDebtStatementWTRANSACTIONID.AsInteger);
    ;
      if  dmDatabase.tblTransactionWDOCID.AsInteger <> 0 then
        begin
         NewTekst := TDataBaseDocumentRoutines.GetDocExtReference(ADocid);
         if NewTekst <> '' then
             Value := Value +'/' + NewTekst ;

        end;
end;

end.

