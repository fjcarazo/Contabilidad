unit CashFlowrp;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrCashFlow = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrttl1: TQRLabel;
    qrttl2: TQRLabel;
    qrDates: TQRLabel;
    qrttl3: TQRLabel;
    qrttl4: TQRLabel;
    qrttl5: TQRLabel;
    qrttl6: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText4: TQRDBText;
    qrttl7: TQRLabel;
    qrbBatch: TQRGroup;
    qrDetails: TQRBand;
    QRFootBat: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    qrTot1: TQRLabel;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    qrOp1: TQRLabel;
    qrOp2: TQRLabel;
    qrOp3: TQRLabel;
    qrOp4: TQRLabel;
    qrOp5: TQRLabel;
    qrOp6: TQRLabel;
    qrOp7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    qrDet1: TQRLabel;
    qrDet2: TQRLabel;
    qrDet3: TQRLabel;
    qrDet4: TQRLabel;
    qrDet5: TQRLabel;
    qrDet6: TQRLabel;
    qrDet7: TQRLabel;
    qrTot2: TQRLabel;
    qrTot3: TQRLabel;
    qrTot4: TQRLabel;
    qrTot5: TQRLabel;
    qrTot6: TQRLabel;
    qrTot7: TQRLabel;
    qrBankSumr: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    qrncf1: TQRLabel;
    qrBnkTot1: TQRLabel;
    qrncf2: TQRLabel;
    qrBnkTot2: TQRLabel;
    qrncf3: TQRLabel;
    qrBnkTot3: TQRLabel;
    qrncf4: TQRLabel;
    qrBnkTot4: TQRLabel;
    qrncf5: TQRLabel;
    qrBnkTot5: TQRLabel;
    qrncf6: TQRLabel;
    qrBnkTot6: TQRLabel;
    qrncf7: TQRLabel;
    qrBnkTot7: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape1: TQRShape;
    qrGnb1: TQRLabel;
    qrPtin1: TQRLabel;
    qrPtOut1: TQRLabel;
    qrPtNt1: TQRLabel;
    qrPtt1: TQRLabel;
    qrTcf1: TQRLabel;
    qrFa1: TQRLabel;
    qrGnb2: TQRLabel;
    qrPtin2: TQRLabel;
    qrPtOut2: TQRLabel;
    qrPtNt2: TQRLabel;
    qrPtt2: TQRLabel;
    qrTcf2: TQRLabel;
    qrFa2: TQRLabel;
    qrFa3: TQRLabel;
    qrTcf3: TQRLabel;
    qrPtt3: TQRLabel;
    qrPtNt3: TQRLabel;
    qrPtOut3: TQRLabel;
    qrPtin3: TQRLabel;
    qrGnb3: TQRLabel;
    qrGnb4: TQRLabel;
    qrGnb5: TQRLabel;
    qrGnb6: TQRLabel;
    qrGnb7: TQRLabel;
    qrPtin7: TQRLabel;
    qrPtOut7: TQRLabel;
    qrPtNt7: TQRLabel;
    qrPtt7: TQRLabel;
    qrTcf7: TQRLabel;
    qrFa7: TQRLabel;
    qrFa6: TQRLabel;
    qrTcf6: TQRLabel;
    qrPtt6: TQRLabel;
    qrPtNt6: TQRLabel;
    qrPtOut6: TQRLabel;
    qrPtin6: TQRLabel;
    qrPtin5: TQRLabel;
    qrPtOut5: TQRLabel;
    qrPtNt5: TQRLabel;
    qrPtt5: TQRLabel;
    qrTcf5: TQRLabel;
    qrFa5: TQRLabel;
    qrFa4: TQRLabel;
    qrTcf4: TQRLabel;
    qrPtt4: TQRLabel;
    qrPtNt4: TQRLabel;
    qrPtOut4: TQRLabel;
    QRShape2: TQRShape;
    qrPtin4: TQRLabel;
    procedure qrbBatchBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRFootBatBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrBankSumrBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    TotAcc:Array [1..6] of Real;

  public

  end;

var
  qrCashFlow: TqrCashFlow;
  LastPeriod,FirstPeriod:Byte;
  RTotal,PTotal:Array [1..6] of Real;
  BnkRc,  BnkPy,
  tot,tmp:Real;

implementation

uses Database, GlobalFunctions, CashFlowOptions,DatabaseAccess;

{$R *.DFM}

//Function LastID:BYte;
//begin
//  Result:=LastPeriod-FirstPeriod+1;
//  if Not Result in [1..6] then
//   result :=6
//end;

procedure TqrCashFlow.qrbBatchBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if dmDatabase.tblCashFlowWBatchID.Value=1 then
   qrLabel6.Caption:= GetTextLang(1241) // 'CASH RECEIVED'
  else
   qrLabel6.Caption:= GetTextLang(1242) //'CASH PAID OUT'
end;

procedure TqrCashFlow.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  i:Byte;  
begin
  for i:=1 to 6 do
  begin
   RTotal[i]:=0;
   PTotal[i]:=0;
  end;
  BnkRc := 0;
  BnkPy := 0;
  if Not fmCashFlowOptions.cbPetty.Checked Then
      QRChildBand1.Enabled:=False;
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel1.Caption:= GetTextLang(1230); // CASH Flow
  QRLabel2.Caption:= GetTextLang(34); // Account
  QRLabel9.Caption:= GetTextLang(1231); //Opening BANK Balance
  QRLabel10.Caption:= GetTextLang(1232); //Net Cash Flow
  QRLabel16.Caption:= GetTextLang(1233); //Total Bank Balance
  QRLabel13.Caption:= GetTextLang(1234); //Opening Petty Cach Balance
  QRLabel3.Caption:= GetTextLang(1235); // Petty Cash In
  QRLabel18.Caption:= GetTextLang(1236); //Petty Cash Out
  QRLabel26.Caption:= GetTextLang(1237); // Net Petty Cash Flow
  QRLabel34.Caption:= GetTextLang(1238); // Total Petty Cash
  QRLabel42.Caption:= GetTextLang(1239); // Total Cash Flow
  QRLabel50.Caption:= GetTextLang(1240); // Funds Available

end;

procedure TqrCashFlow.QRFootBatBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  i:byte;
begin
  Tot:=0;
  qrLabel7.Caption:=' Total For '+qrLabel6.Caption;
  For i:=1 to 7 do
  With findcomponent('qrTot'+IntToStr(i)) AS TQrLabel do
  begin
    if i<=LastID then
    begin
     if dmDatabase.tblCashFlowWBatchID.Value=1 then
       tmp:=RTotal[i]
     else
       tmp:=PTotal[i];
     Caption := FloatToStrT (Tmp , ffFixed, 18, 1);
     Tot:=Tot+tmp;
    end
    else if i=LastID+1 then
    begin
      Caption :=FloatToStrT (Tot , ffFixed, 18, 1);
      if dmDatabase.tblCashFlowWBatchID.Value=1 then
        BnkRc := tot
      else
        BnkPy := tot;
    end
    else
      Caption:='';
  end;
end;

procedure TqrCashFlow.qrDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
 i:Byte;
begin
  Tot:=0;
  for i:=1 to 7 do
  begin
   With  TQrLabel(findcomponent('qrDet'+IntToStr(i))) do
   if i<=LastID then
   begin
     tmp:=dmDatabase.tblCashFlow.FieldByName('FAmount'+IntToStr(i)).AsFloat;
     tot:=Tot+tmp;
     if dmDatabase.tblCashFlowWBatchID.Value=1 then
       RTotal[i]:= RTotal[i] - tmp
     else
       PTotal[i]:= PTotal[i] + tmp ;
     Caption := FloatToStrT (Abs(tmp) , ffFixed, 18, 1);
   end
   else if i<=LastID+1 then
     Caption := FloatToStrT (Abs(Tot) , ffFixed, 18, 1)
   else
     Caption:='';
  end;
end;

procedure TqrCashFlow.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  i:BYte;

begin
  For i:=1 to 7 do
  With findcomponent('qrOp'+IntToStr(i)) AS TQrLabel do
  begin
    if i<=LastID then
    begin
//      tmp :=GetAccountToTal(dmDatabase.tblCashFlowWAccountID.Value,Pers[i],3);
      Caption := FloatToStrT (OTotals[i], ffFixed, 18, 1);
    end
    else
      Caption:='';
  end;
end;

procedure TqrCashFlow.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  i:BYte;
begin
  for i:=1 to 7 do
   With  TQrLabel(findcomponent('qrttl'+IntToStr(i))) do
   if i<=LastID then
     Caption := GetPeriodDesc(Pers[i])
   else if i<=LastID+1 then
     Caption := GetTextLang(960) // 'Total'
   else
     Caption:='';
  qrDates.Caption:=FormatDateRange(Pers[LastID],Pers[LastID]);
end;

procedure TqrCashFlow.qrBankSumrBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

Var
  i:Byte;
  PtyIn,PtyOut:Real;
begin
  PtyIn:=0;
  PtyOut:=0;
  For i:=1 to 7 do
  begin
    Tot:=0;
    Tmp:=0;
    With findcomponent('qrncf'+IntToStr(i)) AS TQrLabel do
    begin
      if i<=LastID then
      begin
       tmp := RTotal[i]-PTotal[i];
       Caption := FloatToStrT (Tmp , ffFixed, 18, 1);
       Tot:=Tot+tmp;
      end
      else if i=LastID+1 then
      begin
        Caption :=FloatToStrT (Bnkrc-Bnkpy , ffFixed, 18, 1)
      end
      else
        Caption:='';
    end;
    With findcomponent('qrBnkTot'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (OTotals[1] + Bnkrc-Bnkpy , ffFixed, 18, 1)
      else if i<=LastID then
       Caption := FloatToStrT (OTotals[i] + Tmp , ffFixed, 18, 1)
      else
        Caption :='';
    if fmCashFlowOptions.cbPetty.Checked Then
    begin
      With findcomponent('qrGnb'+IntToStr(i)) As TQrLabel do
      if i>=LastID+1 then
        Caption  := ''
      else
        Caption := FloatToStrT (PettyOpen[i], ffFixed, 18, 1);

      {Petty Cash In}
      With findcomponent('qrPtin'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (PtyIn, ffFixed, 18, 1)
      else if i>LastID+1 then
        Caption:=''
      else
         Caption := FloatToStrT (PettyIn[i], ffFixed, 18, 1);
      {Petty Cash Out}
      With findcomponent('qrPtOut'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (PtyOut, ffFixed, 18, 1)
      else if i>LastID+1 then
        Caption:=''
      else
         Caption := FloatToStrT (PettyOut[i], ffFixed, 18, 1);
      {Net Petty Cash Flow}
      With findcomponent('qrPtNt'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (PtyIn- PtyOut, ffFixed, 18, 1)
      else if i>LastID+1 then
        Caption:=''
      else
         Caption := FloatToStrT (PettyIn[i] - PettyOut[i], ffFixed, 18, 1);
      {Total Petty Cash}
      With findcomponent('qrPtt'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (PettyOpen[1] + PtyIn - PtyOut, ffFixed, 18, 1)
      else if i>LastID+1 then
        Caption:=''
      else
         Caption := FloatToStrT (PettyOpen[i] + PettyIn[i] - PettyOut[i], ffFixed, 18, 1);
      {Total Cash Flow}
      With findcomponent('qrTcf'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (Tot + PtyIn - PtyOut , ffFixed, 18, 1)
      else if i<=LastID then
         Caption := FloatToStrT (tmp + PettyIn[i] - PettyOut[i], ffFixed, 18, 1)
      else
        Caption :='';

      {Fonds Available}
      With findcomponent('qrFa'+IntToStr(i)) As TQrLabel do
      if i=LastID+1 then
        Caption  := FloatToStrT (OTotals[1] +  Bnkrc-Bnkpy  + PettyOpen[1] + PtyIn - PtyOut , ffFixed, 18, 1)
      else if i<=LastID then
         Caption := FloatToStrT (OTotals[i] + Tmp + PettyOpen[i]+ PettyIn[i] - PettyOut[i], ffFixed, 18, 1)
      else
        Caption:='';
      if i<=LastID then
      begin
        PtyIn:=PtyIn+PettyIn[i];
        PtyOut:=PtyOut+PettyOut[i];
      end;
    end;
  end;

end;

end.
