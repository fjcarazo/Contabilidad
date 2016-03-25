(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DataIntegrityCheckReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrDataIntegrityCheck = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    qrFilesCheck: TQRLoopBand;
    qrFileName: TQRLabel;
    qrFileRec: TQRLabel;
    qrFileSize: TQRLabel;
    qrTbChkeck: TQRLoopBand;
    qrFileState: TQRLabel;
    qrNum: TQRLabel;
    qrTbPeriod: TQRLabel;
    qrTbBalanceDt: TQRLabel;
    qrPath: TQRLabel;
    QRLabel3: TQRLabel;
    qrlblMem: TQRLabel;
    qrBandTrans: TQRLoopBand;
    qrBandCountAcc: TQRLoopBand;
    qrLblCountAccount: TQRLabel;
    qrAccount: TQRLabel;
    qrStockItemns: TQRLabel;
    qrGenLedger: TQRLabel;
    qrCreditors: TQRLabel;
    qrDebtors: TQRLabel;
    QRLabel4: TQRLabel;
    qrDebtorCreditor: TQRLoopBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrDFullAmt: TQRLabel;
    qrDCtrlAmt: TQRLabel;
    qrDToutAmt: TQRLabel;
    qrCRoutAmt: TQRLabel;
    qrCCtrlAmt: TQRLabel;
    qrCRfullAmt: TQRLabel;
    QRLoopDtCrLink: TQRLoopBand;
    qrAcountID: TQRLabel;
    qrDtName: TQRLabel;
    qrFdtAmt: TQRLabel;
    qrOutDtAmt: TQRLabel;
    agdiff: TQRLabel;
    qrDtTotAmt: TQRLabel;
    tbdiff: TQRLabel;
    qrDtCrAcc: TQRLabel;
    qrUnposted: TQRLoopBand;
    qrDocTypes: TQRLabel;
    qrDocTypesDetails: TQRLabel;
    qrTbBalanceCr: TQRLabel;
    qrTbBalanceDif: TQRLabel;
    procedure qrFilesCheckBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrTbChkeckBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAccountPrint(sender: TObject; var Value: String);
    procedure qrStockItemnsPrint(sender: TObject; var Value: String);
    procedure qrGenLedgerPrint(sender: TObject; var Value: String);
    procedure qrCreditorsPrint(sender: TObject; var Value: String);
    procedure qrDebtorsPrint(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure qrFilesCheckAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrTbChkeckAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRLoopDtCrLinkBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLoopDtCrLinkAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrUnpostedBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrUnpostedAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrDebtorCreditorBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrDataIntegrityCheck: TqrDataIntegrityCheck;

implementation

uses DataIntegrityCheck, GlobalFunctions, Database, DatabaseAccess,
  XRoutines,LedgerRoutines;

{$R *.DFM}

Function Amt2Dec(Amt:real) : Real;
begin
  // Roundamount this seems to fix the Rounding bug. i get on a number 0.005 im pointing all routimes to this one ;
  Result :=  RoundAmount(Amt)
end;

Function Amt2DecS(S:String):String;
Begin
  Result := FloatToStr(Amt2Dec(StrToFloat(s)));
end;

Function GetOutStandingAmount(AccTypeID:Integer;Var FullAmount:Real):Real;
begin
  result:=0;
  with dmDatabase do  begin
    qGen.close;
    qGen.SQL.Clear;
    qGen.SQL.Add(' Select Sum(FOutStandingAmount) as FSum1, Sum(FAmount)AS  FSum2 '+
                 ' from Transact, Account '+
                 ' Where Transact.WAccountID = Account.WAccountID '+
                 ' And Account.WAccountTypeID = '+IntToStr(AccTypeID));
    Try
      qGen.Open;
      Result:=qGen.fieldByName('FSum1').AsFloat;
      FullAmount:=qGen.fieldByName('FSum2').AsFloat;
    finally
      qGen.Close;
    end;
  end;
end;

procedure TqrDataIntegrityCheck.qrFilesCheckBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  TmpStr:string;
begin
  qrNum.Caption :='No';
  qrFileName.caption:='File Name';
  qrFileSize.Caption :='Size';
  qrFileRec.Caption:='Records';
  qrFileState.Caption:='Status';
  if qrFilesCheck.Count>tcFilesList.Count then begin
   PrintBand:=False;
   exit;
  end;
  if qrFilesCheck.Count>0 then begin
    qrNum.Caption :=T3Formatstr(qrFilesCheck.Count-1,2);
    qrFileName.caption:=tcFilesList[qrFilesCheck.Count-1];
    //
    tmpStr:=tcFilesSize[qrFilesCheck.Count-1];
    qrFileSize.Caption :=Copy(TmpStr,1,Pos('<>',tmpStr)-1);
    Delete(TmpStr,1,Pos('<>',tmpStr)+1);
    qrFileRec.Caption:=tmpStr;
    //

    qrFileState.Caption:='';
  end
  else begin
    qrFilesCheck.Font.Size:=10;
    qrFilesCheck.Font.Style:=[fsUnderline];
  end;


end;

procedure TqrDataIntegrityCheck.qrTbChkeckBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrTbPeriod.Caption :='Periods';
  qrTbBalanceDt.caption:='Debit';
  qrTbBalanceCr.caption:='Credit';
  qrTbBalanceDif.caption:='Balances';
  if qrTbChkeck.Count>0 then begin
   qrTbPeriod.Caption := tcDatePeriod[qrTbChkeck.Count-1];
   qrTbBalanceDT.caption:=Amt2DecS(tcTbbyPeriodDt[qrTbChkeck.Count-1]);
   qrTbBalanceCr.caption:=Amt2Decs(tcTbbyPeriodCr[qrTbChkeck.Count-1]);
   qrTbBalanceDif.caption:=FloatToStr(Amt2Dec(Str2Float(tcTbbyPeriodDt[qrTbChkeck.Count-1])-Str2Float(tcTbbyPeriodCr[qrTbChkeck.Count-1])));
  end
  else
  begin
    qrTbPeriod.Font.Size:=10;
    qrTbPeriod.Font.Style:=[fsUnderline];
    qrTbBalanceDT.Font.Size:=10;
    qrTbBalanceDT.Font.Style:=[fsUnderline];
    qrTbBalanceCr.Font.Size:=10;
    qrTbBalanceCr.Font.Style:=[fsUnderline];
    qrTbBalanceDif.Font.Size:=10;
    qrTbBalanceDif.Font.Style:=[fsUnderline];
  end;
end;

procedure TqrDataIntegrityCheck.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrPath.Caption:= fmDataIntegrityCheck.LblBooksDir.Caption;
end;

procedure TqrDataIntegrityCheck.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  vMem : TMemoryStatus;
begin
  vMem.dwLength :=Sizeof(vMem);
  GlobalMemoryStatus(vMem);
  qrlblMem.Caption:=BkMbFormat(vMem.dwTotalPhys);
end;




procedure TqrDataIntegrityCheck.qrAccountPrint(sender: TObject;
  var Value: String);
begin
  Value:='General Ledger: '+CountAccount[0];
end;

procedure TqrDataIntegrityCheck.qrStockItemnsPrint(sender: TObject;
  var Value: String);
begin
  Value:='Debtors: '+CountAccount[1];
end;

procedure TqrDataIntegrityCheck.qrGenLedgerPrint(sender: TObject;
  var Value: String);
begin
  Value:='Creditors: '+CountAccount[2];
end;

procedure TqrDataIntegrityCheck.qrCreditorsPrint(sender: TObject;
  var Value: String);
begin
  Value:='Bank : '+CountAccount[3];
end;

procedure TqrDataIntegrityCheck.qrDebtorsPrint(sender: TObject;
  var Value: String);
begin
  Value:='Tax: '+CountAccount[4];
end;

procedure TqrDataIntegrityCheck.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  Value:='Total in the Set of Books: '+CountAccount[6];
end;

procedure TqrDataIntegrityCheck.qrFilesCheckAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if qrFilesCheck.Count<=0 then begin
    qrFilesCheck.Font.Size:=8;
    qrFilesCheck.Font.Style:=[];
  end;
end;

procedure TqrDataIntegrityCheck.qrTbChkeckAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if qrTbChkeck.Count<=0 then begin
    qrTbPeriod.Font.Size:=8;
    qrTbPeriod.Font.Style:=[];
    qrTbBalanceDT.Font.Size:=8;
    qrTbBalanceDt.Font.Style:=[];
    qrTbBalanceCr.Font.Size:=8;
    qrTbBalanceCr.Font.Style:=[];
    qrTbBalanceDif.Font.Size:=8;
    qrTbBalanceDif.Font.Style:=[];
  end;
end;

procedure TqrDataIntegrityCheck.QRLoopDtCrLinkBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  i:Integer;
  TmpStr:String;
begin
  if QRLoopDtCrLink.Count>0 then begin
    TmpStr:=DicAccountID[QRLoopDtCrLink.Count-1];
    //Get ID
    i:=Pos('<>',TmpStr);
    qrAcountID.Caption:=Copy(TmpStr,1,i-1);
    Delete(TmpStr,1,i+1);
    // Get Account No
    i:=Pos('<>',TmpStr);
    qrDtCrAcc.Caption:=Copy(TmpStr,1,i-1);
    Delete(TmpStr,1,i+1);
    // Get name
    qrDtName.Caption:=TmpStr;
    // Full Amount
    qrFdtAmt.Caption:=DicFAmount[QRLoopDtCrLink.Count-1];
//    qrFCrAmt.Caption:=tcCrFAmount[QRLoopDtCrLink.Count-1];
    // OutStanding Amount
    qrOutDtAmt.Caption:=DicOutStanding[QRLoopDtCrLink.Count-1];
//    qrOutCrAmt.Caption:=tcCrOutStanding[QRLoopDtCrLink.Count-1];
    // Total Amount
    qrDtTotAmt.Caption:=DicTotals[QRLoopDtCrLink.Count-1];
    agdiff.Caption:=FloatToStr(FixAmt(StrToFloat(DicFAmount[QRLoopDtCrLink.Count-1])-StrToFloat(DicOutStanding[QRLoopDtCrLink.Count-1])));
    Tbdiff.Caption:=FloatToStr(FixAmt(StrToFloat(DicFAmount[QRLoopDtCrLink.Count-1])-StrToFloat(DicTotals[QRLoopDtCrLink.Count-1])));

//    qrCrTotAmt.Caption:=tcCrTotals[QRLoopDtCrLink.Count-1];
    // Total Balance
//    qrTotTot.Caption:=tcDtTotals[QRLoopDtCrLink.Count-1]+tcCrTotals[QRLoopDtCrLink.Count-1];
//    qrTotOut.Caption:=tcDtOutStanding[QRLoopDtCrLink.Count-1]+tcCrOutStanding[QRLoopDtCrLink.Count-1];
//    qrTotAmt.CAption:=tcDtFAmount[QRLoopDtCrLink.Count-1]+tcCrFAmount[QRLoopDtCrLink.Count-1];
  end
  else
  begin
    //Printing Group header
    qrAcountID.Caption:=' Account No';
    qrDtName.Caption:='Full Name';
    qrFdtAmt.Caption:='BBF Amount';
    qrOutDtAmt.Caption:='OI Amount';
    qrDtTotAmt.Caption:='TB Amount';
    agdiff.Caption:='Aging Diff';
    tbdiff.Caption:='Trial B Diff';
    // Set Font Size
    qrAcountID.Font.Size:=10;
    qrDtName.Font.Size:=10;
    qrFdtAmt.Font.Size:=10;
    qrOutDtAmt.Font.Size:=10;
    qrDtTotAmt.Font.Size:=10;
    qrAcountID.Font.Style:=[fsUnderline];
    qrDtName.Font.Style:=[fsUnderline];
    qrFdtAmt.Font.Style:=[fsUnderline];
    qrOutDtAmt.Font.Style:=[fsUnderline];
    qrDtTotAmt.Font.Style:=[fsUnderline];
//    qrTotTot.Caption:='';
//    qrTotOut.Caption:='';
//    qrTotTot.CAption:='';
  end;

end;

procedure TqrDataIntegrityCheck.QRLoopDtCrLinkAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if qrTbChkeck.Count<=0 then begin
    // Set Font Size
    qrAcountID.Font.Size:=8;
    qrDtName.Font.Size:=8;
    qrFdtAmt.Font.Size:=8;
    qrOutDtAmt.Font.Size:=8;
    qrDtTotAmt.Font.Size:=8;
    qrAcountID.Font.Style:=[];
    qrDtName.Font.Style:=[];
    qrFdtAmt.Font.Style:=[];
    qrOutDtAmt.Font.Style:=[];
    qrDtTotAmt.Font.Style:=[];
  end;
end;

procedure TqrDataIntegrityCheck.qrUnpostedBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrDocTypes.Caption:='';
  qrDocTypesDetails.Caption:='';
  if qrUnposted.count>0 then begin
    qrDocTypes.Caption:=tcDocUnposted[qrUnposted.count-1];
    qrDocTypesDetails.Caption:='';
  end
  else begin
    qrDocTypes.Font.Size:=10;
    qrDocTypes.Font.Style:=[fsUnderline];
    qrDocTypesDetails.Font.Size:=10;
    qrDocTypesDetails.Font.Style:=[fsUnderline];
    qrDocTypes.Caption:='Unposted Batches/Documents';
    qrDocTypesDetails.Caption:='Details';
  end;
end;

procedure TqrDataIntegrityCheck.qrUnpostedAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if qrUnposted.Count<=0 then begin
    qrDocTypes.Font.Size:=8;
    qrDocTypes.Font.Style:=[];
    qrDocTypesDetails.Font.Size:=8;
    qrDocTypesDetails.Font.Style:=[];
  end;
end;

procedure TqrDataIntegrityCheck.qrDebtorCreditorBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  DtControl,CrControl:real;
begin
  DtControl:=GetAccountTotal(GetControlAccountID(1),27,3);
  qrDCtrlAmt.Caption:=FloatToStrT(DtControl, ffFixed, 18, 2);
  CrControl:=GetAccountTotal(GetControlAccountID(2),27,3);
  qrCCtrlAmt.Caption:=FloatToStrT(CrControl, ffFixed, 18, 2);
  // Dt OutStanding & Full Amount
  qrDToutAmt.Caption:=FloatToStrT(GetOutStandingAmount(1,DtControl), ffFixed, 18, 2);
  qrDFullAmt.Caption:=FloatToStrT(DtControl, ffFixed, 18, 2);
  // Cr OutStanding & Full Amount
  qrCRoutAmt.Caption:=FloatToStrT(GetOutStandingAmount(2,CrControl), ffFixed, 18, 2);
  qrCRfullAmt.Caption:=FloatToStrT(CrControl, ffFixed, 18, 2);
end;

end.
