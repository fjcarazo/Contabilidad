(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AccMovementReport;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrAccountsMovements = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    Detail1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Period1: TQRLabel;
    Period2: TQRLabel;
    Period3: TQRLabel;
    Period4: TQRLabel;
    Period5: TQRLabel;
    Period6: TQRLabel;
    Period7: TQRLabel;
    Period8: TQRLabel;
    Period9: TQRLabel;
    Period10: TQRLabel;
    Period11: TQRLabel;
    Period12: TQRLabel;
    Period13: TQRLabel;
    Total1: TQRLabel;
    Total2: TQRLabel;
    Total13: TQRLabel;
    Total12: TQRLabel;
    Total11: TQRLabel;
    Total10: TQRLabel;
    Total9: TQRLabel;
    Total8: TQRLabel;
    Total7: TQRLabel;
    Total6: TQRLabel;
    Total5: TQRLabel;
    Total4: TQRLabel;
    Total3: TQRLabel;
    Budget1: TQRLabel;
    Budget2: TQRLabel;
    Budget3: TQRLabel;
    Budget4: TQRLabel;
    Budget5: TQRLabel;
    Budget6: TQRLabel;
    Budget7: TQRLabel;
    Budget8: TQRLabel;
    Budget9: TQRLabel;
    Budget10: TQRLabel;
    Budget11: TQRLabel;
    Budget12: TQRLabel;
    Budget13: TQRLabel;
    VarAmnt1: TQRLabel;
    VarAmnt2: TQRLabel;
    VarAmnt3: TQRLabel;
    VarAmnt4: TQRLabel;
    VarAmnt5: TQRLabel;
    VarAmnt6: TQRLabel;
    VarAmnt7: TQRLabel;
    VarAmnt8: TQRLabel;
    VarAmnt9: TQRLabel;
    VarAmnt10: TQRLabel;
    VarAmnt11: TQRLabel;
    VarAmnt12: TQRLabel;
    VarAmnt13: TQRLabel;
    VarPer1: TQRLabel;
    VarPer2: TQRLabel;
    VarPer3: TQRLabel;
    VarPer4: TQRLabel;
    VarPer5: TQRLabel;
    VarPer6: TQRLabel;
    VarPer7: TQRLabel;
    VarPer8: TQRLabel;
    VarPer9: TQRLabel;
    VarPer10: TQRLabel;
    VarPer11: TQRLabel;
    VarPer12: TQRLabel;
    VarPer13: TQRLabel;
    QRFoot1: TQRBand;
    AThisYear: TQRLabel;
    ALastYear: TQRLabel;
    AVarAmnt: TQRLabel;
    AVarPer: TQRLabel;
    QRLabel6: TQRLabel;
    qrTotalOp: TQRLabel;
    qrTotalLastOp: TQRLabel;
    qrTotalVarOp: TQRLabel;
    qrTotalPerOp: TQRLabel;
    procedure Detail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFoot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
    idDocType : Integer ;
    IncludeOpeningBals,OnlyOpeningBals : boolean;
    includeNillBalanses : Boolean ;
  end;

var
  qrAccountsMovements: TqrAccountsMovements;
  tempAThisYear,
  tempALastYear,
  tempAVarAmnt,
  tempAVarPer       : Real;

implementation

Uses
  Database, GlobalFunctions, Main, TcVariables,DatabaseAccess,
  OSFGeneralRoutines;

{$R *.DFM}


procedure TqrAccountsMovements.Detail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
 i:integer;
 vThis,vLast:Real;
 function GetSql (aAccount,aperiod,aActual : Integer): Double ;
 begin


  if aperiod = 0 then
   begin
   if not dmDatabase.tblAccountBINCOMEEXPENSE.AsInteger = 1 then
     begin
       if aActual = 1 then
       begin
        result :=  TDataBaseRoutines.GetBalansDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,True,TDataBaseRoutines.GetPeriodStartDate(14)-1,TDataBaseRoutines.GetPeriodStartDate(14)-1,True,0,0) ;
        result :=  result + TDataBaseRoutines.GetBalansDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,False,TDataBaseRoutines.GetPeriodStartDate(14)-1,TDataBaseRoutines.GetPeriodStartDate(14)-1,True,0,0);
       end else
       begin
        result :=  TDataBaseRoutines.GetBudgetDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,True,TDataBaseRoutines.GetPeriodStartDate(14)-1,TDataBaseRoutines.GetPeriodStartDate(14)-1,True,0,0);
        result :=  result + TDataBaseRoutines.GetBudgetDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,False,TDataBaseRoutines.GetPeriodStartDate(14)-1,TDataBaseRoutines.GetPeriodStartDate(14)-1,True,0,0);
       end;

     end else
     result :=  0 ;
   end else
   begin
      if aActual = 1 then
       begin
        result :=  TDataBaseRoutines.GetBalansDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,True,TDataBaseRoutines.GetPeriodStartDate(aperiod),TDataBaseRoutines.GetPeriodEndDate(aperiod),False,0,0) ;
        result :=  result + TDataBaseRoutines.GetBalansDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,False,TDataBaseRoutines.GetPeriodStartDate(aperiod),TDataBaseRoutines.GetPeriodEndDate(aperiod),False,0,0) ;
       end else
       begin
        result :=  TDataBaseRoutines.GetBudgetDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,True,TDataBaseRoutines.GetPeriodStartDate(aperiod) ,TDataBaseRoutines.GetPeriodEndDate(aperiod) ,False,0,0);
        result :=  result + TDataBaseRoutines.GetBudgetDebCredOnDate(dmDatabase.tblAccountWACCOUNTID.AsInteger,False,TDataBaseRoutines.GetPeriodStartDate(aperiod) ,TDataBaseRoutines.GetPeriodEndDate(aperiod) ,False,0,0);
       end;

   end;
 end;
begin
 
  //initialise totals
  tempAVarAmnt := 0;
  tempAVarPer := 0;
  vThis := 0 ;
  vLast := 0 ;
  // Sylvain
  // Opening Balance
  tempAThisYear :=  GetSql(dmDatabase.tblAccountWAccountID.Value,0, 1) ;
  qrTotalOp.Caption:=FloatToStrT(tempAThisYear, ffFixed, 18, 2);

  tempALastYear :=  GetSql(dmDatabase.tblAccountWAccountID.Value,0, 0) ;
  qrTotalLastOp.Caption:=FloatToStrT(tempALastYear, ffFixed, 18, 2);
  //
  qrTotalVarOp.Caption:=FloatToStrT(tempAThisYear-tempALastYear, ffFixed, 18, 2) ;
  if vThis<>0 then
   qrTotalPerOp.Caption:=FloatToStrT(((tempAThisYear-tempALastYear)/tempAThisYear)*100, ffFixed, 18, 2)
  else if vLast<>0 then
   qrTotalPerOp.Caption:=FloatToStrT(((tempAThisYear-tempALastYear)/tempALastYear)*100, ffFixed, 18, 2)
  else
   qrTotalPerOp.Caption:='';
  //
  For i:=1 to 13 do begin
    With qrAccountsMovements.FindComponent('Period'+IntToStr(i)) as TqrLabel  do
      if dmDatabase.tblPeriods.Locate('WPERIODID', 13+i, []) then
        Caption:=dmDatabase.tblPeriodsSDescription.Value
      else
        Caption:='';
    // This Year Total Amount
    vThis :=  GetSql(dmDatabase.tblAccountWAccountID.Value,13+i, 1) ;
    With qrAccountsMovements.FindComponent('Total'+IntToStr(i)) as TqrLabel  do
      Caption:=FloatToStrT(vThis, ffFixed, 18, 2);
    if idDocType=255 then begin
      // Budget Total Amount
     vLast :=  GetSql(dmDatabase.tblAccountWAccountID.Value,13+i, 0) ;
      With qrAccountsMovements.FindComponent('Budget'+IntToStr(i)) as TqrLabel  do
        Caption:=FloatToStrT(vLast, ffFixed, 18, 2);
    end
    else
    begin
     vLast :=  GetSql(dmDatabase.tblAccountWAccountID.Value,i, 0) ;

      With qrAccountsMovements.FindComponent('Budget'+IntToStr(i)) as TqrLabel  do
        Caption:=FloatToStrT(vLast, ffFixed, 18, 2);
    end;

    // Variance Amount
    With qrAccountsMovements.FindComponent('VarAmnt'+IntToStr(i)) as TqrLabel  do
//    if (vThis<>0) and (vLast<>0) then
      Caption:=FloatToStrT(vThis-vLast, ffFixed, 18, 2) ;
//    else
//      Caption:='';
    // Variance %

    With qrAccountsMovements.FindComponent('VarPer'+IntToStr(i)) as TqrLabel  do begin
       if vThis<>0 then
         Caption:=FloatToStrT(((vThis-vLast)/vThis)*100, ffFixed, 18, 2)
       else if vLast<>0 then
         Caption:=FloatToStrT(((vThis-vLast)/vLast)*100, ffFixed, 18, 2)
       else
         Caption:='';
    end;
    tempAThisYear := TempAThisYear + vThis;
    tempALastYear := tempALastYear + vLast;
  end;
  if not includeNillBalanses then
     PrintBand := (tempAThisYear <> 0) or (tempALastYear <> 0) ;
end;

procedure TqrAccountsMovements.QRFoot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  AThisYear.Caption := FloatToStrT(tempAThisYear, ffFixed, 18, 2);
  ALastYear.Caption := FloatToStrT(tempALastYear, ffFixed, 18, 2);
  AVarAmnt.Caption := FloatToStrT(tempAThisYear-tempALastYear, ffFixed, 18, 2);
  if tempAThisYear<>0 then
    AVarPer.Caption := FloatToStrT(((tempAThisYear-tempALastYear)/tempAThisYear)*100, ffFixed, 18, 2)
  else
    AVarPer.Caption :='';

  if not includeNillBalanses then
    PrintBand := (tempAThisYear <> 0) or (tempALastYear <> 0)
end;

procedure TqrAccountsMovements.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  case idDocType of
  255:Value:= GetTextLang(1184); //'Budget Performance';
  1  :Value:= GetTextLang(1181); //'Debtor Movement';
  2  :Value:= GetTextLang(1182); //'Creditor Movement';
  else
  Value:= GetTextLang(1183); // 'Account Movement';

  end;
end;

procedure TqrAccountsMovements.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if idDocType=255 then
    QRLabel3.caption:= GetTextLang(1027)  //{'Budget'}
  else
    QRLabel3.caption:=GetTextLang(604);//'Last Year'

end;

procedure TqrAccountsMovements.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabel6.caption := GetTextLang(1066);//'Opening Balance'
  QRLabel2.caption := GetTextLang(603);//'This Year'
  QRLabel4.caption := GetTextLang(1185);// Variance Amount'
  QRLabel5.caption := GetTextLang(1186);// Variance Percentage
  QRSysData2.Text:= GetTextLang(1024); // Page
end;

end.
