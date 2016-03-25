unit CashUpVariance;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrCashUpVariance = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    Dates: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrbSalesPersFoot: TQRBand;
    QRLabel46: TQRLabel;
    qrSysTotal: TQRLabel;
    qrCashTotal: TQRLabel;
    qrVarTotal: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel79: TQRLabel;
    SmCashTotal: TQRLabel;
    SmSysTotal: TQRLabel;
    SmVarTotal: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbSalesPersFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    SysCashUp: Array [0..1] of Array[0..4] of Real;
    Function GetPosVar(i,j:integer):real;
    Function GetPosVart(i,j:integer):real;    
    Procedure LoadCompValues(WSalesPersID:integer);

  public

  end;

var
  qrCashUpVariance: TqrCashUpVariance;
  Stotal,cTotal,vTotal:real;
  GrandStotal,GrandcTotal,GrandvTotal:real;
  TotalCU,TotalSys: Array[0..1,0..5] Of Real;
implementation

uses PosRoutines, GlobalFunctions, Database,DatabaseAccess,OSFGeneralRoutines;


{$R *.DFM}


Function TqrCashUpVariance.GetPosVar(i,j:integer):real;
begin
   Result := - CashUp[i,j]  + SysCashUp[i,j];
end;

Function TqrCashUpVariance.GetPosVart(i,j:integer):real;
begin
   Result := - TotalCU[i,j] + TotalSys[i,j];
end;


Procedure TqrCashUpVariance.LoadCompValues(WSalesPersID:integer);
   Procedure ClearOld;
   Var
     i,j:Integer;
   begin
     for i:=0 to 1 do
       For j:=0 to 4 do
         SysCashUp[i,j]:=0;
   end;
begin
  ClearOld;
  if TDataBaseRoutines.TableExist('PosPymtInv'+IntToStr(SalesPerID)) then
  Begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Text:='Select Sum(FAmount) as FAmt, FQty , Sum(NotUsed) As FiCount from PosPymtInv'+IntToStr(SalesPerID)  +
                            ' Where (SReference<>''********'') or (Sreference Is null) '+
                            ' Group By FQty';
    dmDatabase.qGen.Open;
    dmDatabase.qGen.First;
    While not dmDatabase.qGen.Eof do
    begin
      Case dmDatabase.qGen.FieldByName('FQty').AsInteger of
      2:Begin {Vouchers}
          SysCashUp[0,4]:= SysCashUp[0,4] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,4]:= SysCashUp[1,4] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
        end;
      16:Begin {Cash}
          SysCashUp[0,0]:= SysCashUp[0,0] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,0]:= SysCashUp[1,0] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
        end;
       8:Begin {Credit Cards}
          SysCashUp[0,1]:= SysCashUp[0,1] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,1]:= SysCashUp[1,1] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
       1:Begin {Cheques}
          SysCashUp[0,3]:= SysCashUp[0,3] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,3]:= SysCashUp[1,3] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
       32:Begin {Float}
          SysCashUp[0,2]:= SysCashUp[0,2] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;
          SysCashUp[1,2]:= SysCashUp[1,2] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
      end;
      dmDatabase.qGen.Next;
    end;
  end;

end;

procedure TqrCashUpVariance.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  i,j,SaveID:Integer;
//  CanGo:Boolean;
begin
  {Load Cash up for Salesperson}
  SaveID:=SalesPerID;
  SalesPerID:=dmDatabase.tblGroupsWGroupID.Value;
  LoadCompValues(SalesPerID);
  LoadCashup;
  SalesPerID:=SaveID;
  Stotal :=0;
  cTotal :=0;
  vTotal :=0;
//  CanGo:=True;
  For i:=0 to 4 do
  begin
    Stotal := Stotal + SysCashUp[1,i];
    cTotal := ctotal + CashUp[1,i];
    vTotal := vtotal - CashUp[1,i]+ SysCashUp[1,i] ;
//    CanGo:= CanGo AND (SysCashUp[1,i]=0) AND (SysCashUp[1,i]=0)
  end;
  For i:=0 to 1 do
  For j:=0 to 4 do
  begin
    TotalCU[i,j] := TotalCU[i,j] + CashUp[i,j];
    TotalSys[i,j] := TotalSys[i,j] + SysCashUp[i,j];
  end;
//  if  CanGo then
//  begin
//    PrintBand:=False;
//    qrbSalesPersFoot.Enabled:=False;
//    Exit;
//  end;
  qrbSalesPersFoot.Enabled:=True;
  QRLabel2.Caption:=GetTextLang(198){'Salesperson'} + ':'+dmDatabase.tblGroupsSDescription.Value;
  {Cash up}
  qrLabel52.Caption := FloatToStrT(CashUp[1,0], ffFixed, 18, 2);
  qrLabel60.Caption := FloatToStrT(CashUp[0,1], ffFixed, 18, 2);
  qrLabel53.Caption := FloatToStrT(CashUp[1,1], ffFixed, 18, 2);
  qrLabel59.Caption := FloatToStrT(CashUp[0,2], ffFixed, 18, 2);
  qrLabel54.Caption := FloatToStrT(CashUp[1,2], ffFixed, 18, 2);
  qrLabel58.Caption := FloatToStrT(CashUp[0,3], ffFixed, 18, 2);
  qrLabel55.Caption := FloatToStrT(CashUp[1,3], ffFixed, 18, 2);
  qrLabel57.Caption := FloatToStrT(CashUp[0,4], ffFixed, 18, 2);
  qrLabel56.Caption := FloatToStrT(CashUp[1,4], ffFixed, 18, 2);
  {TurboCash Values}
  QRLabel13.Caption :=  FloatToStrT(SysCashUp[1,0], ffFixed, 18, 2);
  qrLabel11.Caption := FloatToStrT(SysCashUp[0,1], ffFixed, 18, 2);
  qrLabel17.Caption := FloatToStrT(SysCashUp[1,1], ffFixed, 18, 2);
  qrLabel18.Caption := FloatToStrT(SysCashUp[0,2], ffFixed, 18, 2);
  qrLabel19.Caption := FloatToStrT(SysCashUp[1,2], ffFixed, 18, 2);
  qrLabel20.Caption := FloatToStrT(SysCashUp[0,3], ffFixed, 18, 2);
  qrLabel21.Caption := FloatToStrT(SysCashUp[1,3], ffFixed, 18, 2);
  qrLabel22.Caption := FloatToStrT(SysCashUp[0,4], ffFixed, 18, 2);
  qrLabel23.Caption := FloatToStrT(SysCashUp[1,4], ffFixed, 18, 2);
  {Variance}
  qrLabel70.Caption :=  FloatToStrT(GetPosVar(1,0), ffFixed, 18, 2);
  qrLabel78.Caption := FloatToStrT(GetPosVar(0,1), ffFixed, 18, 2);
  qrLabel71.Caption := FloatToStrT(GetPosVar(1,1), ffFixed, 18, 2);
  qrLabel77.Caption := FloatToStrT(GetPosVar(0,2), ffFixed, 18, 2);
  qrLabel72.Caption := FloatToStrT(GetPosVar(1,2), ffFixed, 18, 2);
  qrLabel76.Caption := FloatToStrT(GetPosVar(0,3), ffFixed, 18, 2);
  qrLabel73.Caption := FloatToStrT(GetPosVar(1,3), ffFixed, 18, 2);
  qrLabel75.Caption := FloatToStrT(GetPosVar(0,4), ffFixed, 18, 2);
  qrLabel74.Caption := FloatToStrT(GetPosVar(1,4), ffFixed, 18, 2);



  QRBand2.Enabled:=True;
end;

procedure TqrCashUpVariance.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  i,j:Integer;
begin
  QRBand2.Enabled:=False;
  GrandStotal:=0;
  GrandcTotal:=0;
  GrandvTotal:=0;
  FOr i:=0 to 1 do for j:=0 to 5 do
  begin
    TotalCU[i,j]:=0;
    TotalSys[i,j]:=0;
  end;
  QRSysData2.Text:= GetTextLang(1024); // Page
  QRLabel1.Caption:= GetTextLang(1243); // Point of Sales Cash up Check
  QRLabel9.Caption:= GetTextLang(1244); // System
  QRLabel14.Caption:= GetTextLang(1245); // Qty
  QRLabel33.Caption:= GetTextLang(1245); // Qty
  QRLabel35.Caption:= GetTextLang(1245); // Qty
  QRLabel16.Caption:= GetTextLang(946); // Amt
  QRLabel34.Caption:= GetTextLang(946); // Amt
  QRLabel36.Caption:= GetTextLang(946); // Amt
  QRLabel12.Caption:= GetTextLang(1159); // Variance
  QRLabel10.Caption:= GetTextLang(1246);// Cashed up (In the Drawer)
  QRLabel47.Caption:= GetTextLang(792);// Cash
  QRLabel48.Caption:= GetTextLang(1170);//Credit Cards
  QRLabel49.Caption:= GetTextLang(1172);//Cheques
  QRLabel50.Caption:= GetTextLang(1171);//Float
  QRLabel51.Caption:= GetTextLang(1173);// Vouchers
  QRLabel46.Caption:= GetTextLang(1360);// Total
  QRLabel15.Caption:= GetTextLang(1247);// Summary
  QRLabel3.Caption:= GetTextLang(792);// Cash
  QRLabel6.Caption:= GetTextLang(1170);//Credit Cards
  QRLabel5.Caption:= GetTextLang(1172);//Cheques
  QRLabel4.Caption:= GetTextLang(1171);//Float
  QRLabel7.Caption:= GetTextLang(1173);// Vouchers
  QRLabel79.Caption:= GetTextLang(1360);// Total
      



end;

procedure TqrCashUpVariance.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  QRBand2.Enabled:=False;
end;

procedure TqrCashUpVariance.qrbSalesPersFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrCashTotal.Caption:= FloatToStrT(cTotal, ffFixed, 18, 2);
  qrSysTotal.Caption:= FloatToStrT(sTotal, ffFixed, 18, 2);
  qrVarTotal.Caption:= FloatToStrT(vTotal, ffFixed, 18, 2);
  GrandStotal := GrandStotal + sTotal;
  GrandcTotal := GrandcTotal + cTotal;
  GrandvTotal := GrandvTotal + vTotal;
end;

procedure TqrCashUpVariance.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  {Cash up}
  qrLabel24.Caption := FloatToStrT(TotalSys[1,0], ffFixed, 18, 2);
  qrLabel25.Caption := FloatToStrT(TotalSys[0,1], ffFixed, 18, 2);
  qrLabel26.Caption := FloatToStrT(TotalSys[1,1], ffFixed, 18, 2);
  qrLabel27.Caption := FloatToStrT(TotalSys[0,2], ffFixed, 18, 2);
  qrLabel28.Caption := FloatToStrT(TotalSys[1,2], ffFixed, 18, 2);
  qrLabel29.Caption := FloatToStrT(TotalSys[0,3], ffFixed, 18, 2);
  qrLabel30.Caption := FloatToStrT(TotalSys[1,3], ffFixed, 18, 2);
  qrLabel31.Caption := FloatToStrT(TotalSys[0,4], ffFixed, 18, 2);
  qrLabel32.Caption := FloatToStrT(TotalSys[1,4], ffFixed, 18, 2);
  {TurboCash Values}
  QRLabel61.Caption :=  FloatToStrT(TotalCU[1,0], ffFixed, 18, 2);
  qrLabel69.Caption := FloatToStrT(TotalCU[0,1], ffFixed, 18, 2);
  qrLabel62.Caption := FloatToStrT(TotalCU[1,1], ffFixed, 18, 2);
  qrLabel68.Caption := FloatToStrT(TotalCU[0,2], ffFixed, 18, 2);
  qrLabel63.Caption := FloatToStrT(TotalCU[1,2], ffFixed, 18, 2);
  qrLabel67.Caption := FloatToStrT(TotalCU[0,3], ffFixed, 18, 2);
  qrLabel64.Caption := FloatToStrT(TotalCU[1,3], ffFixed, 18, 2);
  qrLabel66.Caption := FloatToStrT(TotalCU[0,4], ffFixed, 18, 2);
  qrLabel65.Caption := FloatToStrT(TotalCU[1,4], ffFixed, 18, 2);
  {Variance}
  qrLabel37.Caption :=  FloatToStrT(GetPosVart(1,0), ffFixed, 18, 2);
  qrLabel38.Caption := FloatToStrT(GetPosVart(0,1), ffFixed, 18, 2);
  qrLabel39.Caption := FloatToStrT(GetPosVart(1,1), ffFixed, 18, 2);
  qrLabel40.Caption := FloatToStrT(GetPosVart(0,2), ffFixed, 18, 2);
  qrLabel41.Caption := FloatToStrT(GetPosVart(1,2), ffFixed, 18, 2);
  qrLabel42.Caption := FloatToStrT(GetPosVart(0,3), ffFixed, 18, 2);
  qrLabel43.Caption := FloatToStrT(GetPosVart(1,3), ffFixed, 18, 2);
  qrLabel44.Caption := FloatToStrT(GetPosVart(0,4), ffFixed, 18, 2);
  qrLabel45.Caption := FloatToStrT(GetPosVart(1,4), ffFixed, 18, 2);

  SmCashTotal.Caption:= FloatToStrT(GrandcTotal, ffFixed, 18, 2);
  SmSysTotal.Caption:= FloatToStrT(GrandsTotal, ffFixed, 18, 2);
  SmVarTotal.Caption:= FloatToStrT(GrandvTotal, ffFixed, 18, 2);
end;

end.
