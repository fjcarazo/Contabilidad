(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit PosRoutines;

interface

Uses Graphics,Dialogs,Classes,Windows,Types,Printers,TcVariables,SysUtils,
      Variants,IniFiles,db,StrUtils,LedgerRoutines,TCashClasses;


Function  PrintTillDoc(aDocID:integer;Params : String):Boolean;
Procedure LoadPrintersVars;
Procedure SavePrintersVars;
Function  TestPrintes:Boolean;
Function  FormatRight(S:String;aLen:Integer):String;
Function  FormatLeft(S:String;aLen:Integer):String;
Procedure LoadPosInputVars;
Procedure SavePosInputVars;
Function  LoadDebtorInfo(Var Dt:TDtAccountRec):Boolean;
Function  LocateStockItem(Var Stk:TStockRec):Boolean;
Function  LocateStockItemOnCode(Var Stk:TStockRec):Boolean;
function  StockLoadItem(Var aStockRec : TStockRec) : Boolean ;
function  StockLoadItemOnCode(Var aStockRec : TStockRec) : Boolean ;

Function  SaveInvoice(PymType:integer):Integer;
Function  GetSalesPersonID(aName:String):Integer;
Procedure LoadCashup;
Procedure SaveCashup;
procedure WriteText(ACanvas: TCanvas; const ARect: TRect; DX, DY: Integer;
                    const Text: string; aFormat: Word);
Procedure CLoseShift;
Function  AmtFix(Amount: Real):real;
Function  Tax1m(Rate:Real):Real;
Function  GetNextPosNo:String;
Procedure CloseSysParams;
Function  LocateTmpDebtor(DebID:integer):Boolean;
Function  LocateTmpAccount(AccID:Integer):Boolean;
Procedure OpenDrowerNow;
Procedure ResetCashup(aSalesPersID:Integer);
Procedure PrintOnPoll(DispType : Integer;LineId,aText:String);
Procedure PrintOnSoftwarePoll(DispType : Integer;LineId,aText:String);
Procedure LoadDocMessages(Var Value:TDtAccountRec);
Function  IsExternalTrans(Var TransID,TransType:Integer):Boolean;



Var
  Pos_PrintCustomer,
  Pos_PrintInvAddress:Boolean;
  APrinter1,APrinter2:String;
  usePrn1,usePrn2 :Boolean;
  TillAccountID,PaidOutID,ChequeID,
  DftSaleSACCOUNT:Integer;
  DftCustAccount,
  CurCustAccount:TDtAccountRec;
//  NextDocNo : String ='';
  SalesPerson : String ='';
  PosUser : String = '';
  LastDocID : Integer;
  NextDoc:Boolean;
  PosCash,PosChange:real;
  DefDesc:String ='';
  SNextPOSInv : String ='';
  BatDescr,
  LastDocNo :string;
  SalesPerID:Integer;
  KeepPassWord : String = '';
  KeepSalesPerson :String ='';
  UseScanner,UseSNtrk,
  PymtDet,
  RememPass:Boolean;
  CashUp:Array [0..1] of Array[0..4] of Real;
  InvLine:integer;
  aPrnType1,aPrnType2:Integer;
  PosBatchID,PosChqBatchID :Integer;
  CashLimit,PosFloatLimit:real;
  PosMess1,PosMess2,PosMess3:String;
  UsePosMess:Boolean;
  AllowCashFloat,UseInvoice:Boolean;
  POSRoundAmount : Double ;
  POSFastSwitchSalesMan : Boolean ;
  POSWeightDishConnected : Boolean ;
  POSWeightDishPORT : String ;
  ExtTransType,ExtTransID:Integer;
  MyCurrentUser : Integer ;

implementation

uses Database, GlobalFunctions, DosTextPrint, NewLookup,
  DatabaseAccess, XRoutines, Progress, OSFGeneralRoutines,
  NewProgress, UDMTCCoreLink,forms;



Function DivTax(Rate,Def:Real):Real;
begin
  if Rate<=0 then Result := Def
  else Result :=  1/Rate;
end;

FUnction Tax1m(Rate:Real):Real;
begin
  // This is = 1-1/Rate it's returns 0 if Rate = 0
  // The rate is in 1+ Rate / 100 ===> 1.14
  Result := 1 - DivTax(Rate,1)
end;



Function AmtFix(Amount: Real):real;
begin
  // Roundamount this seems to fix the Rounding bug. i get on a number 0.005 im pointing all routimes to this one ;
  Result := roundAmount(Amount);
  // done : Pieter I think its better this way right ?? Please check syvain maby we should make it a option.
{  if Amount>=0 then
   Result := Trunc(Amount*100+0.49999999)/100
  else
   Result := Trunc(Amount*100-0.49999999)/100;    }
end;


Procedure LoadCashup;
Var
  i,j:Integer;
 // Hold:Boolean;
begin
 // Hold:=dmDatabase.tblOpReport.Active;
 // dmDatabase.tblOpReport.Open;
  For i:=0 to 1 do
    For j:=0 to 4 do
     CashUp[i,j] := ReadReportOp('CashUp'+IntToStr(SalesPerID)+'_'+IntToStr(i)+IntToStr(j),0).AsFloat;
 // if Not Hold then dmDatabase.tblOpReport.Close;
end;


Function  GetNextPosNo:String;
Var
  Hold:Boolean;

begin
  // this way theres a lock on the record until post.
  Hold:=dmDatabase.tblSysParams.Active;
  dmDatabase.tblSysParams.Close;
  dmDatabase.tblSysParams.Open;
  // done : Get General numbering in here
  if ReadReportOp('BUseGeneralNumber','false').Asboolean then
     MyCurrentUser := DMTCCoreLink.ReadSysParam('IUserGeneralNumber',StrToInt(varToStr( DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
  else
    MyCurrentUser := CurrentUser ;

  dmdatabase.tblSysParams.sql.text := dmDatabase.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  dmdatabase.tblSysParams.ParamByName('SParamName').AsString := Uppercase('SNextPOSInv') ;
  dmdatabase.tblSysParams.ParamByName('wUserID').Asinteger := MyCurrentUser ;
  dmdatabase.tblSysParams.ParamByName('WTypeID').Asinteger := 0 ;
  dmdatabase.tblSysParams.open ;

  if dmdatabase.tblSysParams.IsEmpty then
  begin
    dmDatabase.tblSysParams.Append;
    dmDatabase.tblSysParamsSParamName.AsString :='SNextPOSInv';
    Result :=  'POS00001' ;
    dmdatabase.tblSysParamsSParamValue.AsString:='POS00001';
    dmdatabase.tblSysParamsWTypeID.AsString:='0';
    dmdatabase.tblSysParamsWUserID.Asinteger:=MyCurrentUser;
    dmdatabase.tblSysParams.Post;
  end else
  begin
    try
    dmDatabase.tblSysParams.Edit;
    Result :=  dmdatabase.tblSysParamsSParamValue.AsString ;
    SNextPOSInv := _IncrementString(Result);
    if SNextPOSInv ='' then SNextPOSInv := 'POS00001';
    dmdatabase.tblSysParamsSParamValue.AsString:=SNextPOSInv;
    dmdatabase.tblSysParams.Post;
    except
       raise Exception.create(gettextlang(2054));
    end;
  end;
  if Not Hold then dmDatabase.tblSysParams.Close;
end;

Procedure ResetCashup(aSalesPersID:Integer);
Var
  i,j:Integer;
  saveID:integer;
begin
  saveID:=SalesPerID;
  SalesPerID:=aSalesPersID;
  For i:=0 to 1 do
    For j:=0 to 4 do
    CashUp[i,j] := 0;
  SaveCashup;
  SalesPerID:=SaveID;
end;

Procedure SaveCashup;
Var
  i,j:Integer;
//  Hold:Boolean;
begin
//  Hold:=dmDatabase.tblOpReport.Active;
//  dmDatabase.tblOpReport.Open;
  For i:=0 to 1 do
    For j:=0 to 4 do
       WriteReportOp('CashUp'+IntToStr(SalesPerID)+'_'+IntToStr(i)+IntToStr(j),FloatToStr(CashUp[i][j]));
//  if Not Hold then dmDatabase.tblOpReport.Close;
end;

Procedure LoadPosInputVars;
Var
  Hold:Boolean;
begin

  Hold:=dmDatabase.tblSysParams.Active;
  dmDatabase.tblSysParams.Open;
  // done : Get General numbering in here
  if ReadReportOp('BUseGeneralNumber','false').Asboolean then
     MyCurrentUser := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
  else
    MyCurrentUser := CurrentUser ;
  //WriteReportOp
  DftSaleSACCOUNT := ReadSysParam('WpDefaultAccount',0,0).AsInteger;
  RememPass := ReadSysParam('BpRememPassWord',False,0).AsBoolean;
  UseScanner := ReadSysParam('BpUseScanner',True,0).AsBoolean;
  TillAccountID := ReadSysParam('WpCashAccount',0,0).AsInteger;
  PaidOutID := ReadSysParam('WpFloatAccount',0,0).AsInteger;
  ChequeID := ReadSysParam('WpCheckAccount',TillAccountID,0).AsInteger;
  BatDescr := ReadSysParam('SpBatDescr','Inv.',0).AsString;
  UseSNtrk := ReadSysParam('BpUseSNtrk',False,0).AsBoolean;
  PosChPrice := ReadSysParam('BPosChPrice',True,MyCurrentUser).AsBoolean;
  PosChQty := ReadSysParam('BPosChQty',True,MyCurrentUser).AsBoolean;
  UsePosMess := ReadSysParam('BpUseMess',False,0).AsBoolean;
 // SNextPOSInv := ReadSysParam('SNextPOSInv','POS00001',0).ASString;
  ChangeDiscount := ReadSysParam('POSChangeDiscount',false,0).AsBoolean;
  UseDebtorSellingPrice := ReadSysParam('POSUseDebtorSP',false,0).AsBoolean;
  ChangeDiscountPW := ReadSysParam('POSChangeDiscountPW','',0).AsString ;
  POSShowQtyOnhand  := ReadSysParam('POSShowQtyOnhand',false,0).AsBoolean;
  POSRoundAmount :=   Str2Float(stringreplace(ReadSysParam('POSRoundAmount',0,0).Asstring,'.',DecimalSeparator,[rfReplaceAll]));
  POSFastSwitchSalesMan := ReadSysParam('POSFastSwitchSalesMan',false,0).AsBoolean;
  POSWeightDishConnected := ReadSysParam('POSWeightDishConnected',false,0).AsBoolean;
  POSWeightDishPORT := ReadSysParam('POSWeightDishPORT','COM1',0).AsString ;
  PosShowPreview := readSysParam('cbShoPReview',False,0).AsBoolean ;
  dmdatabase.tblSysParams.sql.text := dmDatabase.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  dmdatabase.tblSysParams.ParamByName('SParamName').AsString := Uppercase('SNextPOSInv') ;
  dmdatabase.tblSysParams.ParamByName('wUserID').Asinteger := MyCurrentUser ;
  dmdatabase.tblSysParams.ParamByName('WTypeID').Asinteger := 0 ;
  dmdatabase.tblSysParams.open ;
  if dmdatabase.tblSysParams.IsEmpty  then
  begin
    dmDatabase.tblSysParams.Append;
    dmDatabase.tblSysParamsSParamName.AsString :='SNextPOSInv';
    SNextPOSInv :='POS00001';
    dmdatabase.tblSysParamsSParamValue.AsString:=SNextPOSInv;
    dmdatabase.tblSysParamsWTypeID.AsString:='0';
    dmdatabase.tblSysParamsWUserID.Asinteger:=MyCurrentUser;
    dmdatabase.tblSysParams.Post;
  end else
  begin
    SNextPOSInv := dmdatabase.tblSysParamsSParamValue.AsString;
  end;

  DefDesc := ReadSysParam('SpDefDesc','Inv.',0).ASString;
  CashLimit := ReadSysParam('FCashLimit',0,0).AsFloat;
  PosBatchID := ReadSysParam('WpPosBatchID','0',0).AsInteger;
  PosChqBatchID := ReadSysParam('WpPosChqBatchID',0,0).AsInteger;
  PosMess1 := ReadSysParam('SPosMess1','',0).AsString;
  PosMess2 := ReadSysParam('SPosMess2','',0).AsString;
  PosMess3 := ReadSysParam('SPosMess3','',0).AsString;
  AllowCashFloat := ReadSysParam('BDoCashFloat',True,0).AsBoolean;
  {Poll Display Settings}
  PollDispl.Name:= ReadSysParam('SPolComName','1',0).AsString;
  PollDispl.parity := ReadSysParam('SPolParity','N',0).AsString[1];
  PollDispl.baud := ReadSysParam('SPolBaud','9600',0).AsInteger;
  PollDispl.data := ReadSysParam('SPolData','8',0).AsInteger;
  PollDispl.stop := ReadSysParam('SPolStop','1',0).AsInteger;
  PollDispl.Connected := ReadSysParam('SPolConnect','1',0).AsBoolean;
  PollDispl.IsComPort := ReadSysParam('SPolIsCom','1',0).AsBoolean;

  {Drawer Settings}
  CashDrawer.Name:= ReadSysParam('SDrwComName','1',0).AsString;
  CashDrawer.parity := ReadSysParam('SDrwParity','N',0).AsString[1];
  CashDrawer.baud := ReadSysParam('SDrwBaud','9600',0).AsInteger;
  CashDrawer.data := ReadSysParam('SDrwData','8',0).AsInteger;
  CashDrawer.stop := ReadSysParam('SDrwStop','1',0).AsInteger;
  CashDrawer.Connected := ReadSysParam('SDrwConnect','1',0).AsBoolean;
  CashDrawer.IsComPort := ReadSysParam('SDrwIsCom','1',0).AsBoolean;
  CashDrawer.ControlStr := ReadSysParam('SDrwControlStr','07',0).AsString;
  UseInvoice  := ReadSysParam('SUseInvoice','1',0).AsBoolean ;
  if Not Hold then dmDatabase.tblSysParams.Close;
end;

Procedure SavePosInputVars;
Var
  Hold:Boolean;
begin
  Hold:=dmDatabase.tblSysParams.Active;
  dmDatabase.tblSysParams.Open;
  if ReadReportOp('BUseGeneralNumber','false').Asboolean then
     MyCurrentUser := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
  else
  MyCurrentUser := CurrentUser ;

  WriteSysParam('POSFastSwitchSalesMan',Bool2Str(POSFastSwitchSalesMan));
  WriteSysParam('WpDefaultAccount',IntToStr(DftSaleSACCOUNT));
  WriteSysParam('BpRememPassWord',Bool2Str(RememPass));
  WriteSysParam('BpUseScanner',Bool2Str(UseScanner));
  WriteSysParam('WpCashAccount',IntToStr(TillAccountID));
  WriteSysParam('WpFloatAccount',IntToStr(PaidOutID));
  WriteSysParam('WpCheckAccount',IntToStr(ChequeID));
  WriteSysParam('SpBatDescr',BatDescr);
  WriteSysParam('BpUseSNtrk',Bool2Str(UseSNtrk));
  WriteSysParam('BPosChPrice',Bool2Str(PosChPrice),MyCurrentUser);
  WriteSysParam('BPosChQty',Bool2Str(PosChQty),MyCurrentUser);
  WriteSysParam('POSChangeDiscount',Bool2Str(ChangeDiscount));
  WriteSysParam('POSShowQtyOnhand',Bool2Str(POSShowQtyOnhand));
  WriteSysParam('POSUseDebtorSP',Bool2Str(UseDebtorSellingPrice));
  WriteSysParam('POSChangeDiscountPW',ChangeDiscountPW);
  WriteSysParam('POSRoundAmount',stringreplace(FloatToStr(POSRoundAmount),DecimalSeparator,'.',[rfReplaceAll]));
  WriteSysParam('POSWeightDishConnected',Bool2Str(POSWeightDishConnected));
  WriteSysParam('POSWeightDishPORT',POSWeightDishPORT);

  dmdatabase.tblSysParams.sql.text := dmDatabase.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  dmdatabase.tblSysParams.ParamByName('SParamName').AsString := Uppercase('SNextPOSInv') ;
  dmdatabase.tblSysParams.ParamByName('wUserID').Asinteger := MyCurrentUser ;
  dmdatabase.tblSysParams.ParamByName('WTypeID').Asinteger := 0 ;
  dmdatabase.tblSysParams.open ;

  if dmdatabase.tblSysParams.IsEmpty then
  begin
    dmDatabase.tblSysParams.Append;
    dmDatabase.tblSysParamsSParamName.AsString :='SNextPOSInv';
    dmdatabase.tblSysParamsSParamValue.AsString:=SNextPOSInv;
    dmdatabase.tblSysParamsWTypeID.AsString:='0';
    dmdatabase.tblSysParamsWUserID.Asinteger:=MyCurrentUser;
    dmdatabase.tblSysParams.Post;
  end else
  begin
    try
    dmDatabase.tblSysParams.Edit;
    dmdatabase.tblSysParamsSParamValue.AsString:=SNextPOSInv;
    dmdatabase.tblSysParams.Post;
    except
       raise Exception.create(gettextlang(2054));
    end;
  end;

//  WriteSysParam('SNextPOSInv',SNextPOSInv);
  WriteSysParam('SpDefDesc',DefDesc);
  WriteSysParam('FCashLimit',FLoatToStr(CashLimit));
  WriteSysParam('WpPosBatchID',IntToStr(PosBatchID));
  WriteSysParam('WpPosChqBatchID',IntToStr(PosChqBatchID));
  WriteSysParam('SPosMess1',PosMess1);
  WriteSysParam('SPosMess2',PosMess2);
  WriteSysParam('SPosMess3',PosMess3);
  WriteSysParam('BpUseMess',Bool2Str(UsePosMess));
  WriteSysParam('BDoCashFloat',Bool2Str(AllowCashFloat));
  {Poll Display Settings}
  WriteSysParam('SPolBaud',IntToStr(PollDispl.baud));
  WriteSysParam('SPolComName',PollDispl.Name);
  WriteSysParam('SPolIsCom',Bool2Str(PollDispl.IsComPort));
  WriteSysParam('SPolParity',PollDispl.parity);
  WriteSysParam('SPolData',IntToStr(PollDispl.data));
  WriteSysParam('SPolStop',IntToStr(PollDispl.stop));
  WriteSysParam('SPolConnect',Bool2Str(PollDispl.Connected));





  {Drawer Display Settings}
  WriteSysParam('SDrwBaud',IntToStr(CashDrawer.baud));
  WriteSysParam('SDrwComName',CashDrawer.Name);
  WriteSysParam('SDrwParity',CashDrawer.parity);
  WriteSysParam('SDrwData',IntToStr(CashDrawer.data));
  WriteSysParam('SDrwStop',IntToStr(CashDrawer.stop));
  WriteSysParam('SDrwConnect',Bool2Str(CashDrawer.Connected));
  WriteSysParam('SDrwIsCom',Bool2Str(CashDrawer.IsComPort));
  WriteSysParam('SUseInvoice',Bool2Str(UseInvoice));
  WriteSysParam('SDrwControlStr',CashDrawer.ControlStr);

  if Not Hold then dmDatabase.tblSysParams.Close;
end;


Procedure LoadPrintersVars;
Var
  Hold:Boolean;
begin
  Hold:=dmDatabase.tblSysParams.Active;
  dmDatabase.tblSysParams.Open;
  Pos_PrintCustomer := ReadSysParam('BpPrintCustDetails',True,0).AsBoolean;
  Pos_PrintInvAddress := ReadSysParam('BpPrintInvAddress',False,0).AsBoolean;
  APrinter1 := ReadSysParam('SpName1','',0).AsString;
  APrinter2 := ReadSysParam('SpName2','',0).AsString;
  usePrn1 := ReadSysParam('BpusePrn1',True,0).AsBoolean;
  usePrn2 := ReadSysParam('BpusePrn2',False,0).AsBoolean;
  Prn1Feed := ReadSysParam('WFeed1',0,0).AsInteger;
  Prn2Feed := ReadSysParam('WFeed2',0,0).AsInteger;

  // todo : Add default paper cut.
  SPaperCut2 := ReadLongSysparam('SPaperCut2',0);
  if SPaperCut2 = '' then SPaperCut2 := '13+10+13+10+13+10+13+10+13+10+13+10+13+10' ;

  SPaperCut1 := ReadLongSysparam('SPaperCut1',0);
  if SPaperCut1 = '' then SPaperCut1 := '13+10+13+10+13+10+13+10+13+10+13+10+13+10' ;

  PymtDet := ReadSysParam('BpPymtDet',False,0).AsBoolean;

  aPrnType1 := ReadSysParam('SpPrnType1',5,0).AsInteger;
  aPrnType2 := ReadSysParam('SpPrnType2',5,0).AsInteger;
  PosPrnConf := ReadSysParam('BPosPrnConf',True,0).AsBoolean;





  if Not Hold then dmDatabase.tblSysParams.Close;
end;


Procedure SavePrintersVars;
Var
  Hold:Boolean;
begin
  Hold:=dmDatabase.tblSysParams.Active;
  dmDatabase.tblSysParams.Open;
  WriteSysParam('BpPrintCustDetails',Bool2Str(Pos_PrintCustomer));
  WriteSysParam('BpPrintInvAddress',Bool2Str(Pos_PrintInvAddress));
  WriteSysParam('SpName1',APrinter1);
  WriteSysParam('SpName2',APrinter2);
  WriteSysParam('BpUsePrn1',Bool2Str(usePrn1));
  WriteSysParam('BpUsePrn2',Bool2Str(usePrn2));
  WriteSysParam('BpPymtDet',Bool2Str(PymtDet));
  WriteSysParam('WFeed2',Prn1Feed);
  WriteSysParam('WFeed1',Prn2Feed);

  WriteLongSysParam('SPaperCut2',SPaperCut2);
  WriteLongSysParam('SPaperCut1',SPaperCut1);

  WriteSysParam('SpPrnType1',aPrnType1);
  WriteSysParam('SpPrnType2',aPrnType2);
  WriteSysParam('BPosPrnConf',Bool2Str(PosPrnConf));




  if Not Hold then dmDatabase.tblSysParams.Close;
end;

Function ExtractLPTPort(aPrinterName:String):String;
Var
  i:Integer;
begin
  aPrinterName:=UppercAse(aPrinterName);
  i:=Pos(' ON LPT',aPrinterName);
  Result:='LPT1';
  if i<>0 then
  begin
    Result:='';
    Delete(aPrinterName,1,i+3);
    While aPrinterName<>'' do
    begin
      if aPrinterName[1] in ['A'..'Z','0'..'9'] then
       Result:=result+aPrinterName[1];
       Delete(aPrinterName,1,1);
    end;
  end;
end;

Function EndLine:String;
begin
  Result := #13+#10;
end;

Function ExtraSlipLines(PrnID:Integer):String;
var
 PaperCut : String ;
begin
  If PrnID=1 then
    begin
    PrnID := Prn1Feed ;
    PaperCut := TDataBaseStringRoutines.GetCharsFromTextInAndPlusSignAsDivider(SPaperCut1) ;
    end
  else
   begin
    PrnID := Prn2Feed;
    PaperCut := TDataBaseStringRoutines.GetCharsFromTextInAndPlusSignAsDivider(SPaperCut2) ;
   end;
  Result := DupeString(EndLine,PrnID);
  result := Result + PaperCut ;
end;

Function FormatRight(S:String;aLen:Integer):String;
Begin
  Result := DupeString(' ',aLen)+s;
  Result := RightStr(Result,aLen);
end;

Function FormatLeft(S:String;aLen:Integer):String;
Begin
  Result := S+DupeString(' ',aLen);
  Result := LeftStr(Result,aLen);
end;

Function FormatMid(S:String;aLen:Integer):String;
Var
  X,Y:integer;
Begin
  x:=Alen Div 2;
  Y:=Length(s) Div 2;
  Result := FormatRight(Copy(s,1,y),x)+FormatLeft(RightStr(s,Length(s)-Y),aLen-x);
end;

Function CreateTillInv(aDocID:Integer;Params:String):String;
{Create Doc Text for Till Printers}
{This function Will open DocHead and DocLines and live them open}
Var
  i,j,level:Integer;
  TotQty ,fTotal,TxTotal: Real;
  invComt,
  ContactStr:String;
  TaxRate:Double;
  AParamsList : TStringlist ;
begin
  Result :='';
//  dmDatabase.tblDocHeader.Open;
//  dmDatabase.tblDocHeader.Filtered:=False;
  TotQty:=0;
  fTotal:=0;
  TxTotal:=0;
  TaxRate := 0;
//if dmDatabase.tblDocHeader.Locate('WDocID',aDocID,[]) then
//begin
    dmDatabase.tblDocLine.SQL.Text := 'select * from docline where WDocID='+IntToStr(aDocID);
    dmDatabase.tblDocLine.Open;
    dmDatabase.tblSysVars.open ;
    if dmDatabase.tblDocLine.RecordCount>0 then
    begin
      dmDatabase.tblDocLine.First;
      //dmDatabase.tblSysVars.Open;
      dmDatabase.tblAccount.Open;
      dmDatabase.tblGroups.Open;
      dmDatabase.tblAccount.Filtered:=False;
      dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.qryDocHeadWAccountID.Value,[]);
      Result := EndLine + FormatLeft(dmDatabase.tblSysVarsSCompanyName.Value,40)+EndLine;
      Result := Result + FormatLeft(dmDatabase.tblSysVarsSAddress1.Value,40)+EndLine;
       Result := Result + FormatLeft(dmDatabase.tblSysVarsSPostCode.Value + ' ' + dmDatabase.tblSysVarsSAddress2.Value,40)+EndLine;
      Result := Result + FormatLeft(dmDatabase.tblSysVarsSAddress3.Value,40)+EndLine;

      Result := Result + FormatLeft(gettextlang(2038){phone}+' '+dmDatabase.tblSysVarsSPhoneNumber.Value,39)+ EndLine;
      Result := Result + FormatLeft(gettextlang(2039){Fax}+' '+dmDatabase.tblSysVarsSPhoneNumber.Value,39)+EndLine;
      Result := Result + FormatLeft(gettextlang(317)+' '+dmDatabase.tblSysVarsSTAXRegNo.Value,40)+EndLine;
      if (dmDatabase.qryDocHeadWSalesmanID.Asstring<>'') AND (dmDatabase.qryDocHeadWSalesmanID.Value<>0) then
      begin
         level := 0 ;
         ContactStr := TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qryDocHeadWSalesmanID.Value,level);
        if ContactStr <> '' then
          Result := Result + FormatLeft(gettextlang(2045)+' ' + ContactStr,40)+EndLine
        else
          Result := Result + endline;
      end;

      Result := Result + DupeString('-',40)+EndLine;
      Result := Result + FormatLeft(dmDatabase.qryDocHeadSDocNo.Value,16)
                       + FormatLeft(DateToStr(dmDatabase.qryDocHeadDDAte.Value),14)
                       + FormatRight(FormatLeft(TimeToStr(Time),8),10)+EndLine;
      Result := Result + DupeString('-',40)+EndLine;
      invComt:='';
      AParamsList := TStringlist.create ;
      try
      While not dmDatabase.tblDocLine.eof do
      begin
        if (dmDatabase.tblDocLineWLineTypeID.Value= 91) then
        begin
        //  if PymtDet then
        //  begin
          AParamsList.Text := DMTCCoreLink.ReadDescription(dmDatabase.tblDocLineWDescriptionId.Value) ;
          for level := 0 to AParamsList.Count -1 do
          begin
           ContactStr := Trim(AParamsList[level]) ;
           while ContactStr <> '' do
             begin
             Result := Result +
             EndLine+ FormatLeft(copy(ContactStr,1,40),40);
             delete(ContactStr,1,40);

             end;
          end;
        //  end ;
          dmDatabase.tblDocLine.Next;
          Continue;
        end;

        j:= GetTaxRate100(dmDatabase.tblDocLineWTaxID.ASInteger);
        if J>TaxRate then TaxRate := J;
        TotQty  := TotQty + FixAmount(dmDatabase.tblDocLineFQtyShipped.Value);
        TxTotal := TxTotal + FixAmount(dmDatabase.tblDocLineFTaxAmount.Value);
        fTotal:= fTotal + FixAmount(dmDatabase.tblDocLineFInclusiveAmt.Value);
        Result := Result + EndLine;
        Result := Result + FormatLeft(FloatToStrF(dmDatabase.tblDocLineFQtyShipped.Value,ffFixed,4,2),5);

        ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.tblDocLineWDescriptionId.Value) ;

        Result := Result + ' '+ FormatLeft(ContactStr,21);
        //
        Result := Result + DupeString(' ',4);
        //
        Result := Result +' ' + FormatRight(FloatToStrF(dmDatabase.tblDocLineFInclusiveAmt.Value,ffFixed,6,2),7);
        if dmDatabase.tblDocLineFTaxAmount.Value=0 then
          Result := Result +'*'
        else
          Result := Result +' ';
        dmDatabase.tblDocLine.Next;
      end;
      finally
         AParamsList.free ;
      end;
      Result := Result + EndLine +  EndLine ;

      Result := Result + FormatLeft(gettextlang(2052){Items},7)+' '+FormatRight(FloatToStrF(TotQty,ffFixed,10,2),11);
      Result := Result + ' '+FormatLeft(gettextlang(2053){Due},7)+' '+ FormatRight(FloatToStrF(fTotal,ffFixed,10,2),11) + EndLine;
      // addpaymenttypes
      if Params <> '' then
      begin
      AParamsList := TStringlist.create ;
      try
        AParamsList.Text := Params ;
        for i := 0 to AParamsList.Count -1 do
          begin
            if (AParamsList.Names[i] = 'payment1') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
               Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(792){Cash},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
            if (AParamsList.Names[i] = 'payment2') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
               Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(823){CreditCard},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
            if (AParamsList.Names[i] = 'payment3') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
               Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(793){Cheque},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
            if (AParamsList.Names[i] = 'payment4') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
               Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(34){Account},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
            if (AParamsList.Names[i] = 'payment5') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
               Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(1173){Voucher},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
           // if (AParamsList.Names[i] = 'AmountPayed') and (StrToFloatDef(AParamsList.ValueFromIndex[i],0) <> 0 ) then
           //    Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(960){Total},8)+' '+FormatRight(FloatToStrF(StrToFloat(AParamsList.ValueFromIndex[i]),ffFixed,10,2)+' ',11) + EndLine;
          end;
      finally
        AParamsList.free ;
      end;
      end else
       Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(2041){Cash},8)+' '+FormatRight(FloatToStrF(PosCash,ffFixed,10,2)+' ',11) + EndLine;

      Result := Result + DupeString(' ',20)+FormatLeft(gettextlang(2042){change},10)+' '+FormatRight(FloatToStrF(PosChange,ffFixed,8,2)+' ',9) + EndLine;
      Result := Result + EndLine;
      // todo : make multy tax
      dmDatabase.qGen.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('pos_agragateTax');
      dmDatabase.qGen.Params[0].AsInteger := aDocID ;
      dmDatabase.qGen.open ;
      while not dmDatabase.qGen.eof do
        begin
         TaxRate := dmDatabase.qGen.Fields[1].AsFloat ;
         TxTotal := dmDatabase.qGen.Fields[2].AsFloat ;
         Result := Result + FormatLeft(gettextlang(2043){Tax},11)+' '+FormatRight(FloatToStrF(TaxRate,ffFixed,4,2) +'%',7)+FormatRight(FloatToStrF(TxTotal,ffFixed,10,2)+' ',21) + EndLine;
         dmDatabase.qGen.next ;
        end;

     // if dmDatabase.qGen.IsEmpty then
     // Result := Result + FormatLeft(gettextlang(2043),10)+' '+FormatLeft(FloatToStrF(TaxRate/100,ffFixed,4,2) +'%',7)+FormatRight(FloatToStrF(TxTotal,ffFixed,10,2)+' ',20) + EndLine;

      dmDatabase.qGen.close ;

      Result := Result + DupeString('-',40)+EndLine;

      {}
      if Pos_PrintCustomer then
      begin
        //dmDatabase.tblContact.Open;
        Result := Result + FormatLeft(gettextlang(2046),8)+' '+ FormatLeft(dmDatabase.tblAccountSACCOUNTCODE.Text,8)+EndLine;
        Result := Result + FormatLeft(gettextlang(2047),8)+' '+  FormatLeft(dmDatabase.tblAccountSDescription.Value,30) + EndLine;
        if dmDatabase.tblAccountWAccountTypeID.Value=2 then
        begin

        end
        else
        begin
          dmDatabase.tblDebtor.Open;
          dmDatabase.tblDebtor.Locate('WAccountID',dmDatabase.qryDocHeadWAccountID.Value,[]);
          Result := Result + FormatLeft(gettextlang(2038){Tel},8)+ ' ' + FormatLeft(dmDatabase.tblDebtorSTelephone1.Value,20) +

          endline + FormatLeft(gettextlang(2040){Mob},8)+ ' ' + FormatLeft(dmDatabase.tblDebtorSTelephone2.Value,20)+EndLine;
          //Result := Result + FormatLeft('Tel.',8)+' '+ FormatLeft(dmDatabase.tblDebtorSTelephone1.Value,10);
          //Result := Result + ' '+FormatLeft('Cel.',8)+' '+ FormatLeft(dmDatabase.tblDebtorSTelephone2.Value,10) + EndLine;
          Result := Result + FormatLeft(gettextlang(2048{Contact}),8) ;
          ContactStr := getcontactName(dmDatabase.tblDebtorWContactID.Value);
          if ContactStr <> '' then
            Result := Result + ' '+FormatLeft(ContactStr,30) + EndLine
          else
            Result := Result + EndLine;
          dmDatabase.tblDebtor.Close;
        end;
        if Pos_PrintInvAddress then
        begin
          Result := Result + DupeString('-',40)+EndLine;
          Result := Result + FormatLeft(gettextlang(2049),40)+EndLine;
          ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWDelAddress1ID.AsInteger) ;
          if ContactStr <> '' then
           Result := Result +FormatLeft(ContactStr,40)+EndLine;
          ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWDelAddress2ID.AsInteger) ;
          if ContactStr <> '' then
           Result := Result + FormatLeft(ContactStr,40)+EndLine;
          ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWDelAddress3ID.AsInteger) ;
          if ContactStr <> '' then
             Result := Result + FormatLeft(ContactStr,40)+EndLine;
          ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWDelCodeID.AsInteger) ;
          if ContactStr <> '' then
           Result := Result + FormatLeft(ContactStr,40)+EndLine;
        end;
        Result := Result + DupeString('-',40)+EndLine;
      end;
      {Add Comments and Payements Details}
       if PymtDet And (invComt<>'') then
       begin
         Result := Result + FormatMid(gettextlang(2050),40)+EndLine;
         Result := Result + invComt ;
         Result := Result + DupeString('-',40)+EndLine;
       end;
      {Add messages }
      ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWMessage1ID.AsInteger) ;
      Result := Result + FormatLeft(ContactStr,40)+EndLine;
      ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWMessage2ID.AsInteger) ;
      Result := Result + FormatLeft(ContactStr,40)+EndLine;
      ContactStr := DMTCCoreLink.ReadDescription(dmDatabase.qryDocHeadWMessage3ID.AsInteger) ;
      Result := Result + FormatLeft(ContactStr,40)+EndLine;

      {}
      Result := Result + FormatMid(gettextlang(2051),40)+EndLine;
      Result := Result + DupeString('-',40)+EndLine;

    end;
//  end;
  if Result<>'' then
  // adde dto default
  For i:=0 to 6 do Result:=Result+ EndLine;
//  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblSysVars.Close ;
end;

Function PrintTillDoc(aDocID:integer;Params : String):Boolean;
Var
  TillText:String;
begin
  LoadPrintersVars;
  TillText := CreateTillInv(aDocID,Params);
  if usePrn1 then
    PrintTextNow(TillText + ExtraSlipLines(1) ,APrinter1,gettextlang(2036),readSysParam('cbForceCutprn1',True,0).AsBoolean) ;
  if usePrn2 then
    PrintTextNow(TillText + ExtraSlipLines(2) ,APrinter2,gettextlang(2036),readSysParam('cbForceCutprn2',True,0).AsBoolean);
end;

//Function  PrintTextNow(S:string;aport:String):Boolean;
//Var
//  FileDest:System.TextFile;
//begin
//  SetSylPrnName(APrinter1);
//  PrintOnSylPrn(s);

//  Assign (FileDest,'LPT1');
//  Rewrite (FileDest);
//  Write(FileDest,S);
//  CloseFile(FileDest);
//end;

Function TestPrintes:Boolean;
Var
  STest:String;
begin
  LoadPrintersVars;
  STest:='';
  STest:=STest + EndLine+EndLine;
  STest:=STest + FormatLeft(TimeToStr(Time),10)+ FormatLeft(DateToStr(Date),10)+EndLine;
  STest:=STest + DupeString('*',40)+EndLine;
  STest:=STest+ GetTextLang(1743)+EndLine;
  STest:=STest+ FormatLeft(GetTextLang(1744),40)+Endline;
  STest:=STest+ FormatLeft(GetTextLang(1744),40)+Endline;
  STest:=STest+ FormatLeft(GetTextLang(1744),40)+Endline;
  STest:=STest+ FormatMid(GetTextLang(1745),40)+Endline;
  STest:=STest+ FormatMid(GetTextLang(1745),40)+Endline;
  STest:=STest+ FormatMid(GetTextLang(1745),40)+Endline;
  STest:=STest+ FormatRight(GetTextLang(1746),40)+Endline;
  STest:=STest+ FormatRight(GetTextLang(1746),40)+Endline;
  STest:=STest+ FormatRight(GetTextLang(1746),40)+Endline;
  STest:=STest+  DupeString('-',40)+EndLine;
  STest:=STest+ GetTextLang(1747)+EndLine;
  STest:=STest+ EndLine + EndLine +EndLine;
  STest:=STest+ (GetTextLang(1748))+EndLine;
  STest:=STest+  DupeString('-',40)+EndLine;
  STest:=STest+ EndLine + EndLine +EndLine;
  STest:=STest+ EndLine + EndLine +EndLine;
  if usePrn1 then
    PrintTextNow(STest+ExtraSlipLines(1),APrinter1,GetTextLang(1749),readSysParam('cbForceCutprn1',True,0).AsBoolean);
  if usePrn2 then
    PrintTextNow(STest+ExtraSlipLines(2),APrinter2,GetTextLang(1749),readSysParam('cbForceCutprn2',True,0).AsBoolean);
end;

Function LocateTmpAccount(AccID:Integer):Boolean;
begin
  TmpAccountRec.WAccountID:=AccID;
  Result := LocateAccount(TmpAccountRec);
end;


Function LocateTmpDebtor(DebID:integer):Boolean;
begin
   TmpDebtorRec.WaccountID:=DebID;
   Result := LoadDebtorInfo(TmpDebtorRec);
end;

Function LoadDebtorInfo(Var Dt:TDtAccountRec):Boolean;
begin
  Result:=False;
  dmDatabase.tblDebtor.Open;
  dmDatabase.tblDebtor.Filtered:=False;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered:=False;
  if dmDatabase.tblDebtor.Locate('WAccountID',Dt.WaccountID,[]) then
  begin
    Result:=True;
    dmDatabase.tblAccount.Locate('WAccountID',Dt.WaccountID,[]);
    dt.SDescription := dmDatabase.tblAccountSDescription.Value;
    dt.SACCOUNTCODE := dmDatabase.tblAccountSACCOUNTCODE.Value;
    dt.SPostal1 := dmDatabase.tblDebtorSPostal1.Value;
    dt.SPostal2 := dmDatabase.tblDebtorSPostal2.Value;
    dt.SPostal3 := dmDatabase.tblDebtorSPostal3.Value;
    dt.SPostalCode := dmDatabase.tblDebtorSPostalCode.Value;
    dt.SPostCounty := TDataBaseRoutines.GetCountryName(dmDatabase.tblDebtorWPOSTCOUNTRIES_ID.AsInteger);
    dt.SDelAddress1 := dmDatabase.tblDebtorSDelivery1.Value;
    dt.SDelAddress2 := dmDatabase.tblDebtorSDelivery2.Value;
    dt.SDelAddress3 := dmDatabase.tblDebtorSDelivery3.Value;
    dt.SDELCounty := TDataBaseRoutines.GetCountryName(dmDatabase.tblDebtorWDELCOUNTRIES_ID.AsInteger);
    dt.SDelCode := dmDatabase.tblDebtorSDeliveryCode.Value;
    dt.WSellingPrice := dmDatabase.tblDebtorWDefaultPriceTypeID.AsInteger;
    dt.WDEfaultTaxId :=  dmDatabase.tblDebtorWDefaultTax.AsInteger;
    dt.FCreditLimit := dmDatabase.tblDebtorFCREDITLIMIT.AsFloat;
    dt.FCurrentBalance := TDataBaseRoutines.GetBalans(Dt.WaccountID,date);
  end;
  dmDatabase.tblDebtor.Close;
  dmDatabase.tblAccount.Close;
end;

Function  LocateStockItemOnCode(Var Stk:TStockRec):Boolean;
begin
  Result := StockLoadItemOnCode(Stk);
end;

function  StockLoadItemOnCode(Var aStockRec : TStockRec) : Boolean ;
var
 aStockrecPoint : TStockRecPointer ;
begin

  DMTCCoreLink.stockObject.getStock(aStockrecPoint,aStockRec.SSTOCKCODE );
  aStockRec :=  aStockrecPoint^ ;{


   dmDatabase.ZQStock.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('database_selectstockoncode') ;
   dmDatabase.ZQStock.ParamByName('SStockCode').AsString := aStockRec.SSTOCKCODE ;
   dmDatabase.ZQStock.open ;
   aStockRec.WStockID := dmDatabase.ZQStockWStockID.AsInteger;
   aStockRec.SBARCODENUMBER := dmDatabase.ZQStockSBARCODENUMBER.AsString;
   aStockRec.SDescription := dmDatabase.ZQStockSDESCRIPTION.AsString;
   aStockRec.SExtraDesc :=  DmDatabase.ZQStockSEXTRADESC.AsString;   
   aStockRec.Smanufacturer := dmDatabase.ZQStockSMANUFACTURER.AsString;
   aStockRec.FPrice1:=dmDatabase.ZQStockFSellingPrice1.AsFloat;
   aStockRec.FPrice2:=dmDatabase.ZQStockFSellingPrice2.AsFloat;
   aStockRec.FPrice3:=dmDatabase.ZQStockFSellingPrice3.AsFloat;
   aStockRec.SSTOCKCODE := dmDatabase.ZQStockSSTOCKCODE.AsString;
   aStockRec.FQtyOnHand :=  dmDatabase.ZQStockFQtyOnHand.AsFloat;
   aStockRec.FReorderQty := dmDatabase.ZQStockFReorderQty.AsFloat;
   aStockRec.FReorderQtyTrig := dmDatabase.ZQStockFREORDERQTYTRIG.AsFloat;
   aStockRec.FminimumQty := dmDatabase.ZQStockFMINIMUMQTY.AsFloat;
   aStockRec.FUnitCost := dmDatabase.ZQStockFUnitCost.AsFloat;
   aStockRec.FAvgUnitCost := dmDatabase.ZQStockFUnitAveCost.AsFloat;
   aStockRec.WConstOfSaleSACCOUNTId :=  dmDatabase.ZQStockWCostAccountID.Asinteger;
   aStockRec.WSaleSACCOUNTId :=  dmDatabase.ZQStockWSaleSACCOUNTID.Asinteger;
   aStockRec.WStockAccountId :=  dmDatabase.ZQStockWStockAccountID.Asinteger;
   aStockRec.WStockTypeId :=  dmDatabase.ZQStockWStockTypeID.Asinteger;
   aStockRec.BApplyDiscount := dmDatabase.ZQStockBApplyInvoiceDiscount.AsInteger = 1 ;
   aStockRec.WInputTaxID:=dmDatabase.ZQStockWInputTaxID.AsInteger;
   aStockRec.WOutputTaxID:=dmDatabase.ZQStockWOutputTaxID.AsInteger;
   aStockRec.wLocBatSerTypeid:=dmDatabase.ZQStockWLOCBATSERTYPEID.AsInteger;
   aStockRec.FInputRate:=GetTaxRateOnId(aStockRec.WInputTaxID,true);
   aStockRec.FOutputRate:=GetTaxRateOnId(aStockRec.WOutputTaxID,true);
   aStockRec.SOutTax:=DmDatabase.ZQStockOUTTAXCODE.AsString;
   aStockRec.SInTax:=DmDatabase.ZQStockINTAXCODE.AsString;
   aStockRec.WUnitId := DmDatabase.ZQStockWUNITID.AsInteger;
   aStockRec.FSellingPrice := 0 ;
   aStockRec.FDiscount := 0 ;
   if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
       if aStockRec.WStockTypeId = 1 then
         aStockRec.FQtyOnHand := TDataBaseStockRoutines.GetStockQty(aStockRec.WStockID);

   dmDatabase.ZQStock.close ;    }
end;

function  StockLoadItem(Var aStockRec : TStockRec) : Boolean ;
var
 aStockrecPoint : TStockRecPointer ;
begin

  DMTCCoreLink.stockObject.getStockOnid(aStockrecPoint,aStockRec.WStockID );
  aStockRec :=  aStockrecPoint^ ;{
   dmDatabase.ZQStock.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('database_selectstockonid') ;
   dmDatabase.ZQStock.ParamByName('WStockId').AsInteger := aStockRec.WStockID ;
   dmDatabase.ZQStock.open ;
   aStockRec.SDescription := dmDatabase.ZQStockSDESCRIPTION.AsString;
   aStockRec.SExtraDesc :=  DmDatabase.ZQStockSEXTRADESC.AsString;
   aStockRec.SBARCODENUMBER := dmDatabase.ZQStockSBARCODENUMBER.AsString;
   aStockRec.Smanufacturer := dmDatabase.ZQStockSMANUFACTURER.AsString;
   aStockRec.FPrice1:=dmDatabase.ZQStockFSellingPrice1.AsFloat;
   aStockRec.FPrice2:=dmDatabase.ZQStockFSellingPrice2.AsFloat;
   aStockRec.FPrice3:=dmDatabase.ZQStockFSellingPrice3.AsFloat;
   aStockRec.SSTOCKCODE := dmDatabase.ZQStockSSTOCKCODE.AsString;
   aStockRec.FQtyOnHand :=  dmDatabase.ZQStockFQtyOnHand.AsFloat;
   aStockRec.FReorderQty := dmDatabase.ZQStockFReorderQty.AsFloat;
   aStockRec.FReorderQtyTrig := dmDatabase.ZQStockFREORDERQTYTRIG.AsFloat;
   aStockRec.FminimumQty := dmDatabase.ZQStockFMINIMUMQTY.AsFloat;
   aStockRec.FUnitCost := dmDatabase.ZQStockFUnitCost.AsFloat;
   aStockRec.FAvgUnitCost := dmDatabase.ZQStockFUnitAveCost.AsFloat;
   aStockRec.wLocBatSerTypeid:=dmDatabase.ZQStockWLOCBATSERTYPEID.AsInteger;
   aStockRec.WConstOfSaleSACCOUNTId :=  dmDatabase.ZQStockWCostAccountID.Asinteger;
   aStockRec.WSaleSACCOUNTId :=  dmDatabase.ZQStockWSaleSACCOUNTID.Asinteger;
   aStockRec.WStockAccountId :=  dmDatabase.ZQStockWStockAccountID.Asinteger;
   aStockRec.WStockTypeId :=  dmDatabase.ZQStockWStockTypeID.Asinteger;
   aStockRec.BApplyDiscount := dmDatabase.ZQStockBApplyInvoiceDiscount.AsInteger = 1 ;
   aStockRec.WInputTaxID:=dmDatabase.ZQStockWInputTaxID.AsInteger;
   aStockRec.WOutputTaxID:=dmDatabase.ZQStockWOutputTaxID.AsInteger;
   aStockRec.FInputRate:=GetTaxRateOnId(aStockRec.WInputTaxID,true);
   aStockRec.FOutputRate:=GetTaxRateOnId(aStockRec.WOutputTaxID,true);
   aStockRec.SOutTax:=DmDatabase.ZQStockOUTTAXCODE.AsString;
   aStockRec.SInTax:=DmDatabase.ZQStockINTAXCODE.AsString;
   aStockRec.WUnitId:=DmDatabase.ZQStockWUNITID.AsInteger;



   aStockRec.FSellingPrice := 0 ;
   aStockRec.FDiscount := 0 ;
   if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
     if aStockRec.WStockTypeId = 1 then
       aStockRec.FQtyOnHand := TDataBaseStockRoutines.GetStockQty(aStockRec.WStockID);
   dmDatabase.ZQStock.close ;  }
end;

Function  LocateStockItem(Var Stk:TStockRec):Boolean;
begin
    fmPosLookup.ZQStock.SQL.Text:=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +' where stock.WStockID =' + IntToStr(Stk.WStockID) ;
    fmPosLookup.ZQStock.Open;
    Result := LoadStockItem(Stk);
end;

Function SaveInvoice(PymType:integer):Integer;
{This Function Will Save Current POS Invoice to the Database}
Var
  StockItem:TStockRec;
  ASaveList : TSaveClientDatasetCallList ;
  Total , TotalTax : Double ;
begin
  if CurCustAccount.WaccountID = 0 then
     Raise Exception.Create('Account is null please select a account!');
  Result :=-1;
  Total := 0 ;
  TotalTax  := 0 ;
  ASaveList := TSaveClientDatasetCallList.create ;
  try
  ASaveList.AddclientObject(dmDatabase.tblBatch,true) ;
  ASaveList.AddclientObject(dmDatabase.tblDocHeader,true) ;
  ASaveList.AddclientObject(dmDatabase.tblDocLine,true) ;

  dmDatabase.tblDocHeader.sql.Text := 'select * from dochead where wdocid = -1 ';
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocLine.sql.Text := 'select * from docline where wdocid = -1 ';
  dmDatabase.tblDocLine.Open;

  LastDocNo:=GetNextPosNo;
  dmDatabase.tblDocHeader.Append;
  dmDatabase.tblDocHeaderWUserID.Value := CurrentUser;
  dmDatabase.tblDocHeaderSDocNo.Value := LastDocNo;
  dmDatabase.tblDocHeaderWTypeID.Value :=10;
  LastDocID:=dmDatabase.tblDocHeaderWDocID.Value;
  dmDatabase.tblDocHeaderWAccountID.Value := CurCustAccount.WaccountID;
  dmDatabase.tblDocHeaderWPaymentTypeID.Value := PymType;
  dmDatabase.tblDocHeaderWSourceTypeID.Value := 2; {From Point of Sales Screen}
  dmDatabase.tblDocHeaderWUserID.Value := CurrentUser;
  dmDatabase.tblDocHeaderBPrinted.Value := 0;
  dmDatabase.tblDocHeaderBPosted.Value := 0;
  dmDatabase.tblDocHeaderBRepeating.Value := 0;
  dmDatabase.tblDocHeaderWSalesManID.Value := SalesPerID;
  dmDatabase.tblDocHeaderWCurrencyID.Value := 0;
  dmDatabase.tblDocHeaderWPostal1ID.Value := AddMessage(CurCustAccount.SPostal1);
  dmDatabase.tblDocHeaderWPostal2ID.Value := AddMessage(CurCustAccount.SPostal2);
  dmDatabase.tblDocHeaderWPostal3ID.Value := AddMessage(CurCustAccount.SPostal3);
  dmDatabase.tblDocHeaderWPostalCodeID.Value := AddMessage(CurCustAccount.SPostalCode);
  dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger := TDataBaseRoutines.GetAddCountryId(CurCustAccount.SPostCounty);
  dmDatabase.tblDocHeaderWDelAddress1ID.Value := AddMessage(CurCustAccount.SDelAddress1);
  dmDatabase.tblDocHeaderWDelAddress2ID.Value := AddMessage(CurCustAccount.SDelAddress2);
  dmDatabase.tblDocHeaderWDelAddress3ID.Value := AddMessage(CurCustAccount.SDelAddress3);
  dmDatabase.tblDocHeaderWDelCodeID.Value := AddMessage(CurCustAccount.SDelCode);
  dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger := TDataBaseRoutines.GetAddCountryId(CurCustAccount.SDelCounty);
  {Save Messages}
  // i think it needs to be loaded at change
  // LoadDocMessages(CurCustAccount);
  dmDatabase.tblDocHeaderWMessage1ID.Value := AddMessage(CurCustAccount.SMessage1);
  dmDatabase.tblDocHeaderWMessage2ID.Value := AddMessage(CurCustAccount.SMessage2);
  dmDatabase.tblDocHeaderWMessage3ID.Value := AddMessage(CurCustAccount.SMessage3);
  // Add Documents Infos

  dmDatabase.tblDocHeaderDDate.Value := PosShiftDate;
  dmDatabase.tblDocHeaderDAllocatedDate.Value := PosShiftDate;
  dmDatabase.tblDocHeaderDDUEDATE.Value := PosShiftDate;

  dmDatabase.tblDocHeader.Post;

  {Post Invoice Llines}
  dmDatabase.tblStock.Open;
  dmDatabase.tblStock.Filtered:=False;
  InvLine:=1;
  dmDatabase.tblBatch.First;
  while not dmDatabase.tblBatch.EOF do
  begin

    StockItem.WStockID:= dmDatabase.tblBatchFTax2Amount.AsInteger;
    if Not LocateStockItem(StockItem) or ((StrtoFLoatDef(StringReplace(dmDatabase.tblBatchSACCOUNT.Value,ThousandSeparator,'',[rfReplaceAll]),0)=0) and
      (dmDatabase.tblBatchFDEBIT.Value=0)) then
    begin
      dmDatabase.tblBatch.Next;
      Continue;
    end;
    dmDatabase.tblDocLine.Append;
    dmDatabase.tblDocLineWDocID.Value := LastDocID;
    dmDatabase.tblDocLineWDocLineID.Value := InvLine;
    dmDatabase.tblDocLineWSORTNO.Value := InvLine;
    Inc(InvLine);
    dmDatabase.tblDocLineWStockID.Value := dmDatabase.tblBatchFTax2Amount.AsInteger;
    // done : Pieter make it inclusive line
    dmDatabase.tblDocLineWLineTypeID.Value := 94 ;// Stock Item
    dmDatabase.tblDocLineWDescriptionID.Value := AddMessage( dmDatabase.tblBatchSDescription.Value);
    dmDatabase.tblDocLineFQtyOrdered.Value := dmDatabase.tblBatchFDEBIT.Value;
    dmDatabase.tblDocLineFQtyShipped.Value := dmDatabase.tblDocLineFQtyOrdered.Value;
    dmDatabase.tblDocLineFSellingPrice.Value :=  StrtoFLoatDef(StringReplace(dmDatabase.tblBatchSACCOUNT.Value,ThousandSeparator,'',[rfReplaceAll]),0)  ;
    dmDatabase.tblDocLineFItemDiscount.Value := dmDatabase.tblBatchFCREDIT.Value;
    dmDatabase.tblDocLineWtaxID.Value:= dmDatabase.tblBatchWAccountID.Value;
    {}
    dmDatabase.tblDocLineFInclusiveAmt.Value := dmDatabase.tblBatchFAmount.Value;
    dmDatabase.tblDocLineFExclusiveAmt.Value := dmDatabase.tblBatchFAmount.Value - dmDatabase.tblBatchFTaxAmount.Value ;
    Total := Total + dmDatabase.tblDocLineFInclusiveAmt.Value ;
    TotalTax  := TotalTax + dmDatabase.tblBatchFTaxAmount.Value ;

      dmDatabase.tblDocLineFTaxAmount.Value := dmDatabase.tblDocLineFInclusiveAmt.Value - dmDatabase.tblDocLineFExclusiveAmt.Value;
      dmDatabase.tblDocLine.Post;
      {if This is an external Trans then send the conformation}
      if IsExternalTrans(ExtTransID,ExtTransType) then
      begin
         {Notify the POS controler that payment done}
       //  PostecControler.ConfirmSale(ExtTransID,ExtTransType);
      end;
      dmDatabase.tblBatch.Next;
    end;
     dmDatabase.tblDocHeader.edit ;
     dmDatabase.tblDocHeaderFDocAmount.AsFloat :=  Total ;
     dmDatabase.tblDocHeaderFTaxAmount.AsFloat :=  TotalTax ;
     dmDatabase.tblDocHeaderdSysdate.asdatetime := now ;
     dmDatabase.tblDocHeader.post ;

   finally
      ASaveList.free ;
   end;
    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
     begin
           DMTCCoreLink.LogAction('POSSAVE',LastDocID,'Pos save');
     end;

end;

Function GetSalesPersonID(aName:String):Integer;
begin
  Result:=0;
  if trim(aName)='' then exit;
  dmDatabase.tblGroups.Open;
  if dmDatabase.tblGroups.Locate('SDescription;WGroupTypeID',VarArrayof([aName,31]),[LoCaseInsensitive]) then
  begin
    Result := dmDatabase.tblGroupsWGroupID.Value;
    SalesPerson := dmDatabase.tblGroupsSDescription.Value; 
  end;
  dmDatabase.tblGroups.Close;
end;



procedure WriteText(ACanvas: TCanvas; const ARect: TRect; DX, DY: Integer;
                    const Text: string; aFormat: Word);
var
  S: array[0..255] of Char;
begin
  with ACanvas, ARect do
  begin
     case aFormat of
        DT_LEFT   : ExtTextOut(Handle, Left + DX, Top + DY, ETO_OPAQUE or ETO_CLIPPED,
                               @ARect, StrPCopy(S, Text), Length(Text), nil);

        DT_CENTER  : ExtTextOut(Handle, Right - TextWidth(Text) - 3, Top + DY,
                               ETO_OPAQUE or ETO_CLIPPED, @ARect, StrPCopy(S, Text),
                               Length(Text), nil);

        DT_RIGHT : ExtTextOut(Handle, Left + (Right - Left - TextWidth(Text)) div 2,
                               Top + DY, ETO_OPAQUE or ETO_CLIPPED, @ARect,
                               StrPCopy(S, Text), Length(Text), nil);
     end;
  end;
end;


Procedure CLoseShift;
var
  BCanPostDoc:Byte;
  WtransID,iCount,
  PostErr:Integer;
  AProgres : TfmNewProgress ;
begin

 // this must been called   dmDatabase.CreateBatch('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) ;

    dmDatabase.tblBatch.DisableControls;
    AProgres := TfmNewProgress.create(nil) ;
 try
 // create table for use as after start transaction it can not bee seen.
 // please create this before the transaction
    GetDatesLimits;
    dmDatabase.tblDocHeader.Close;
    dmDatabase.tblDocHeader.sql.Text := ' select * from dochead where (BPosted <> 1) and (WtypeID=10) and (WSourceTypeId = 2)  AND (WSalesManID = ' + IntToStr(SalesPerID) +')' ;
    dmDatabase.tblDocHeader.Open;
    AProgres.initProgress('',dmDatabase.tblDocHeader.RecordCount);
    dmDatabase.tblDocHeader.First;
    iCount:=0;
    AProgres.SetSubText(GetTextLang(1741));
    While Not dmDatabase.tblDocHeader.Eof do
    begin
      Inc(iCount);
      // Posting Documents
      {Check Here if the Document can be posted}
      {Check    - if Account is Disabled}
      {         - if Date falls in a correct and open for post Period}
      AProgres.SetProgress(GetTextLang(1742),iCount);
      BCanPostDoc := CanPostDoc(dmDatabase.tblDocHeaderDDate.Value,dmDatabase.tblDocHeaderWAccountID.Value);
      Case BCanPostDoc of
       0:begin
            PostErr:=ConvertDocumentToBatch(WtransID,dmDatabase.tblDocHeaderWDocId.asinteger,false,nil,nil,false);
            
            if PostErr <>0 then
            begin
              ShowErrMsg(PostErr);
              Case PostErr of
              2040:begin
                  OSFMessageDlg(dmDatabase.tblDocHeaderSDocNo.Value+#13#10+ GetTextLang(966){Error Posting}, mterror, [mbok], 0);
                end;
              else
                OSFMessageDlg(GetTextLang(495){'Error posting invoice, please restore backup'}, mterror, [mbok], 0);
              end;
              dmDatabase.tblDocHeader.Last;
              dmDatabase.tblDocHeader.Next;
            end else
            begin
              //Auto Create Links

            end;
         end;
        1: begin
           OSFMessageDlg(dmDatabase.tblDocHeaderSDocNo.Value+#13#10+dmDatabase.tblDocHeaderDDate.AsSTring +#13#10 + GetTextLang(888)+#13#10+GetTextLang(890) {'Last Year is Closed for posting'}  , mterror, [mbok], 0);
          end;
        2: begin
             OSFMessageDlg(dmDatabase.tblDocHeaderSDocNo.Value+#13#10+dmDatabase.tblDocHeaderDDate.AsSTring +#13#10 + GetTextLang(889)+#13#10+GetTextLang(890) {'This period is Closed for posting'}  , mterror, [mbok], 0);
           end;
        3: begin
             OSFMessageDlg(dmDatabase.tblDocHeaderSDocNo.Value+#13#10+dmDatabase.tblDocHeaderDDate.AsSTring +#13#10 + GetTextLang(589)+ '(' + DateToStr(TmpDatesLimits[0]) + ' - ' + DateToStr(TmpDatesLimits[1]) + ').', mterror, [mbok], 0);
           end;
       else
       begin
         OSFMessageDlg(SMsgErr ,  mterror, [mbok], 0);
       end;
      end;
      if BCanPostDoc<>0 then
      begin
        dmDatabase.tblDocHeader.Last;
        dmDatabase.tblDocHeader.Next;
      end;
      dmDatabase.tblDocHeader.Next;
    end;
    dmDatabase.tblBatch.Close;
    dmDatabase.tblBatchRefTotals.Close;
    dmDatabase.tblBatch.TableName := 'PosPymtInv' + IntToStr(SalesPerID);
    dmDatabase.tblBatch.Open;
    {Post Payments Batch}
    LrPostNewBatch(CurrentUser,PosChqBatchID,true,0 );
    ResetCashup(SalesPerID);
  finally
    AProgres.CloseProgress ;
    AProgres.free ;
    dmDatabase.tblBatch.EnableControls;
    dmDatabase.tblBatch.Close;
    ClearTable(dmDatabase.tblBatch.TableName);

    // dmDatabase.tblBatch.DeleteTable;
    dmDatabase.tblDocHeader.Close;
    dmDatabase.tblDocLine.Close;
  end;
end;

Procedure CloseSysParams;
begin
  dmDatabase.tblSysParams.Close;
end;

Procedure OpenDrowerNow;
Var
  S,DrwText:String;
  i,x:Integer;
begin
  s := Trim(CashDrawer.ControlStr)+'+';
  DrwText := '';
  Repeat
    i := Pos('+',s);
    if i>0 then begin
      x := StrToIntDef(Copy(s,1,i-1),-1);
      Delete(s,1,i);
    end else s :='' ;
    if x>=0 then
      DrwText := DrwText + Chr(x);
  Until s='';
  if CashDrawer.Connected then begin
    if CashDrawer.IsComPort then begin
      if DrwText='' then DrwText:=#7;
      PrintOnComPort(CashDrawer,DrwText)
    end
    else begin
      {Drwer connected via Printer or directly on LPT}
//     DrwText := DrwText + Endline;
    if usePrn1 then
      PrintTextNow(DrwText ,APrinter1,gettextlang(2035),readSysParam('cbForceCutprn1',True,0).AsBoolean)
    else if usePrn2 then
      PrintTextNow(DrwText ,APrinter2,gettextlang(2035),readSysParam('cbForceCutprn2',True,0).AsBoolean);
    end;
  end;
end;

Procedure PrintOnSoftwarePoll(DispType : Integer;LineId,aText:String);
Var
 SendText : AnsiString ;
begin

if Assigned(ExternalPolePlugin) and DMTCCoreLink.ReadNwReportOp('POLEDIS_ACTIVE',false) then
  begin
    SendText := IntToStr(DispType) + #13 + LineId + #13 +aText ;

    ExternalPolePlugin(Application, pchar(SendText));
  end;
end;


Procedure PrintOnPoll(DispType : Integer;LineId,aText:String);
begin
 if PollDispl.Connected then
   PrintOnComPort(PollDispl,aText);
end;


Procedure LoadDocMessages(Var Value:TDtAccountRec);
Var
  H:Boolean;
begin
 if UsePosMess then begin
  Value.smessage1 := PosMess1;
  Value.smessage2 := PosMess2;
  Value.smessage3 := PosMess3;
 end
 else begin
  H := dmDatabase.tblSysVars.Active;
  dmDatabase.tblSysVars.Active := True;
  Value.smessage1 := dmDatabase.tblSysVars.FieldbyName(DocFields[10]+'1').AsString;
  Value.smessage2 := dmDatabase.tblSysVars.FieldbyName(DocFields[10]+'2').AsString;
  Value.smessage3 := dmDatabase.tblSysVars.FieldbyName(DocFields[10]+'3').AsString;
  dmDatabase.tblSysVars.Active := h;
 end;
end;

Function  IsExternalTrans(Var TransID,TransType:Integer):Boolean;
Var
  S:String;
begin
  Result := False;
  s := Trim(dmDatabase.tblBatchSProfile.AsString);
  if (s='') Or (Length(s)<2) then exit;
  TransType := Ord(S[1]);
  TransID   := StrToIntDef(Copy(S,2,20),0);
  Result := True;
end;



end.
