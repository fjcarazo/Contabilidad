(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ExchangeTCData;

interface
uses
  DB,Variants,classes, SysUtils,Forms, Windows,
  TcVariables,Registry,StrUtils,SylTagParser,Controls,DBClient,Provider,  TcashClasses,
  DBAccess , Uni,dialogs,midas;
Type TOnImportClientDataset = procedure (AClientDataset : TClientDataset;ImportType:String) ;

TStockImportEditType = (sitAll,sitAvgCost,sitQtyReorderAveCost,sitQtyReorderOnHand,sitSellingprice,sitQtyOnhand,sitbarcode,sitDescriptions,sitFree);

Function  ExportXmlDoc(aDate,aDateTo:TDateTime;Headfile,Linesfile,Logfile:String;ExcludeUnPosted:Boolean;FileTyeID:integer;Bsysdate:boolean=false;limitSQL:string=''):Integer;
Function  ImportXmlDocs(Headfile,Linesfile,Logfile:String):Integer;
Function  AddDocExchange(aDate:TDate):Integer;
FUnction  LoadDocExchange:Integer;
Function  ReadBookPath(BooksName:String):String;
Function  ExportXmlAccts(acFrom,acTo:String;afile,Logfile:String;AfileType:Integer;aType:Integer):Integer;
// Function  ExportXmlStocks(acFrom,acTo:String;afile,Logfile:String):Integer;
Function  SaveFileToWkx (afile,Logfile:String):integer;
Function  SaveFileToCsv(aOrgfile,afile,Logfile:String;Delimiter : Char):integer;
Function  SaveFileToXls(afile,Logfile:String):integer;
Function  ImportWkxSTock(afile,Logfile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):integer;
Function  ImportTextStock(afile,Logfile:String;ASeperator : Char;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):integer;
Function  ImportXmlStock(aFile,aLogFile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):Integer;
Function  ImportXmlStockFromCds(FSStream:TClientDataSet;aLogFile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):Integer;
Function  ExportXmlStocks(AcFrom,acTo:String;afile,Logfile:String;BAppend:Boolean;CustomDataSet : TDataSet):Integer;
Function  ExportDebtors(AcFrom,acTo:String;afile,Logfile:String;FileTyeID:integer):Integer;
procedure CreateXmlFilesDef(Var FStream:TClientDataSet;FileID:Integer);
Function  ExportXmlTransact(aEBatch,aBBatch,WPeriodID:Integer;afile,Logfile:String;FileTyeID:Integer):Integer;
Function  ExportCreditors(AcFrom,acTo:String;afile,Logfile:String;FileTyeID:integer):Integer;
Procedure SplitAccountCode(aCode:string;Var Main,Sub:String;Var AccType:integer);
Function  WriteDocListToStr(filter:String;Var StrResult:String):integer;
Function  TransaformDstoCds(aDataset:TDataset):String;
Function  ReadReconData(FromDate,UntilDate:TDatetime;BankCode:String;Var StrResult:string):Integer;
Function  ImportDtCt(aFileName:string;RecEdit:Boolean=True;LogFile:String=''):integer;
Function  ImportDtCtAndAccountsFromTextFile(aFileName:string;ASeperator : Char;RecEdit:Boolean=True;DEDCRED:Boolean=True;LogFile:String=''):integer;
Function  ImportFileAccounts(aFileName:string;RecEdit:Boolean=True;LogFile:String=''):integer;

Function  ImportOFCFile(aFileName:String;aSTream:TStream=nil):Integer;
Function  ReadTxfFromFile(aFileName:String;AsNewDoc:Boolean;AsType:Integer=0):integer;
Function  ImportTransInBat(aFileName:String):Integer;
Procedure AddThisStr(aList:TStringList;aFileName:String);
Function  ExportBact2Txf(ABatchCon:TBatchCon;aFileName:String):Boolean;
// CDS import functions
Function ImportDocsFromCds(FStream,FlStream,fldStream:TClientDataset;Logfile:String):Integer;
Procedure ReadDocFromCSSVToDataSet (FStream , FlStream,FldStream : TClientDataSet; AFile : String;AsNewDoc : Boolean ;AsType : Integer;LastDocAccountid : Integer);
Function ImportStreamAccounts(FStream:TClientDataSet;LogFile:String=''):integer;
Function ImportXmlDtCr(FStream:TClientDataSet;LogFile:String=''):integer;


Var
  aSetOfBooks:String;
  aTable:TuniTable;
  ErrorLog:String;
  MainCount:Integer;
  ToBatch:String='';
  OnImportClientDataset : TOnImportClientDataset  =nil ;
implementation

uses Database, Progress, ExportToSpreadSheet, Read123,
  Math, DatabaseAccess, XRoutines, LedgerRoutines,
  SpreadSheetsIO,GlobalFunctions,  UDMCoreData,OSFGeneralRoutines,
  UDMTCCoreLink, Debtor, StockEntry, NewProgress, UDMCoreDocData;

Function Date2TxfStr(Value:TDateTime):String;
begin
  Result := FormatDateTime('YYYYMMDD',Value);
end;

Function DateTime2TxfStr(Value:TDateTime):String;
begin
 Result := FormatDateTime('YYYYMMDD hhnnss',Value);
end;

Procedure AddThisStr(aList:TStringList;aFileName:String);
begin
    if FileExists(GettmpFolder + aFileName) then
     aList.Add(aFileName);
end;

Function GetAddReportingGrpstr(aType:integer;aName:Variant;Add:Boolean=False):String;
Var
  V:Variant;
begin
  Result :='';

  If NOt VarIsNull(aName) then
  V := TDataBaseRoutines.GetAddGroupNesteled(aName,aType);

  If NOt VarIsNull(V) then begin
    Result := VarToStR(V);
  end;
end;

Procedure AddTxfWarning(S:String);
begin
  Addtag(txfWarngs,'warning',s);
end;

Procedure CdsAdd(ads:TclientDataset;xField:TField;NewName:string='');
begin
  if NewName='' then
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size)
  else
    ads.FieldDefs.Add(NewName,xField.DataType,xField.Size);
end;

Function SaveFileToSpreadSheet(afile,DestFile,Logfile:String):integer;
Var
  FStream:TClientDataSet;
begin
  FStream:=TClientDataSet.Create(Application);
  FStream.FileName:=afile;
  Try
    Result := ExportDsTofile(FStream,DestFile);
  Finally
    FStream.Free;
  end;
end;

Function GetDestFileByType(AFileName:String;AfileType:Integer):String;
  Const
    ext : Array  [0..6] Of String =('','.csv','.wk1','.xls','','.slk','.sxc');
  Var
    FExt:String;
begin
    if AfileType in [0..6] then
      FExt:=ext[AfileType];
    if FExt='' then FExt := '.slk';
    Result := ChangeFileExt(AFileName,FExt);
end;



Procedure AddDebtorDetails(AccountID:Integer;Var AccLst:String);
Var
  Hold:Boolean;
  ic : Integer;
  s:String;
begin
  Hold := dmDatabase.tblDebtor.Active;
  dmDatabase.tblDebtor.Active := True;
  if Not dmDatabase.tblDebtor.Locate('WAccountID',AccountID,[]) then exit;
  For ic:=0 to dmDatabase.tblDebtor.FieldCount-1 do
  begin
    s:=dmDatabase.tblDebtor.Fields[ic].FieldName;
    if SameText(uppercase(Copy(s,1,1)),'W') then
       begin
         if (uppercase(dmDatabase.tblDebtor.Fields[ic].FieldName) = 'WPOSTCOUNTRIES_ID') or
            (uppercase(dmDatabase.tblDebtor.Fields[ic].FieldName) = 'WDELCOUNTRIES_ID') then
            begin
              s := 'S' + Copy(s,2,255);
              AccLst := AccLst + AddTag(s,TDataBaseRoutines.GetCountryName(dmDatabase.tblDebtor.Fields[ic].Asinteger));
            end;
         if (uppercase(dmDatabase.tblDebtor.Fields[ic].FieldName) = 'WDUEDAYS') then
            begin
              AccLst := AccLst + AddTag(s,dmDatabase.tblDebtor.Fields[ic].AsString);
            end;

       end
    else
      AccLst := AccLst + AddTag(s,dmDatabase.tblDebtor.Fields[ic].AsString);
  end;
  dmDatabase.tblDebtor.Active := Hold;
end;

Procedure AddCreditorDetails(AccountID:Integer;Var AccLst:String);
Var
  Hold:Boolean;
  ic : Integer;
  s:String;
begin
  Hold := dmDatabase.tblCreditor.Active;
  dmDatabase.tblCreditor.Active := True;
  if Not dmDatabase.tblCreditor.Locate('WAccountID',AccountID,[]) then exit;
  For ic:=0 to dmDatabase.tblCreditor.FieldCount-1 do
  begin
    s:=dmDatabase.tblCreditor.Fields[ic].FieldName;
    if SameText(uppercase(Copy(s,1,1)),'W') then
       begin
         if (uppercase(dmDatabase.tblCreditor.Fields[ic].FieldName) = 'WPOSTCOUNTRIES_ID') or
            (uppercase(dmDatabase.tblCreditor.Fields[ic].FieldName) = 'WDELCOUNTRIES_ID') then
            begin
              s := 'S' + Copy(s,2,255);
              AccLst := AccLst + AddTag(s,TDataBaseRoutines.GetCountryName(dmDatabase.tblCreditor.Fields[ic].Asinteger));
            end;
         if (uppercase(dmDatabase.tblCreditor.Fields[ic].FieldName) = 'WBANKNAME') then
            begin
              s := 'S' + Copy(s,2,255);
              AccLst := AccLst + AddTag(s,dmDatabase.tblCreditor.Fields[ic].AsString);
            end;
         if (uppercase(dmDatabase.tblCreditor.Fields[ic].FieldName) = 'WDUEDAYS') then
            begin
              AccLst := AccLst + AddTag(s,dmDatabase.tblCreditor.Fields[ic].AsString);
            end;
       end
    else
      AccLst := AccLst + AddTag(s,dmDatabase.tblCreditor.Fields[ic].AsString);
  end;
  dmDatabase.tblCreditor.Active := Hold;
end;

Procedure AddBankDetails(AccountID:Integer;Var AccLst:String);
Var
  Hold:Boolean;
  ic : Integer;
  s:String;
begin
  Hold := dmDatabase.tblBank.Active;
  dmDatabase.tblBank.Active := True;
  if Not dmDatabase.tblBank.Locate('WAccountID',AccountID,[]) then exit;
  For ic:=0 to dmDatabase.tblBank.FieldCount-1 do
  begin
    s:=dmDatabase.tblBank.Fields[ic].FieldName;
    if SameText(uppercase(Copy(s,1,1)),'W') then
    else
      AccLst := AccLst + AddTag(s,dmDatabase.tblBank.Fields[ic].AsString);
  end;
  dmDatabase.tblBank.Active := Hold;
end;

Procedure AddTaxDetails(AccountID:Integer;Var AccLst:String);
Var
  Hold:Boolean;
  ic : Integer;
  s:String;
begin
  Hold := dmDatabase.tblTax.Active;
  dmDatabase.tblTax.Active := True;
  if Not dmDatabase.tblTax.Locate('WAccountID',AccountID,[]) then exit;
  For ic:=0 to dmDatabase.tblTax.FieldCount-1 do
  begin
    s:=dmDatabase.tblTax.Fields[ic].FieldName;
    if SameText(uppercase(Copy(s,1,1)),'W') then
    else
      AccLst := AccLst + AddTag(s,dmDatabase.tblTax.Fields[ic].AsString);
  end;
  dmDatabase.tblTax.Active := Hold;
end;


Procedure FieldSetter(Dest,SOurce:TDataset;fDest,fSource:String);
Var
  SrcField,DestField:TField;
begin
 SrcField := Source.FindField(fSource);
 DestField := Dest.FindField(fDest);
 if Assigned(SrcField) AND Assigned(DestField) AND (Not SrcField.IsNull) AND (SrcField.AsString<>'') then
   DestField.AsString:=SrcField.AsString;
end;

Procedure FieldSetterWithValue(Dest:TDataset;fDest:String;Value :Variant);
Var
  DestField:TField;
begin
 DestField := Dest.FindField(fDest);
 if  Assigned(DestField) AND (Not (Vartostr(Value) = '')) then
   DestField.AsString:=Value;
end;

Procedure AddAccountToTxf(AccountID:Integer;Var AccLst,AccountCode:String;Detailed:Boolean=False);
var
 ALevel : Integer ;
begin
  AccountCode:='';
  if Not dmDatabase.tblAccount.Locate('WAccountID',AccountID,[]) then
   exit;
  AccountCode := dmDatabase.tblAccountSACCOUNTCODE.Text;
  if Pos('<accid>'+IntToStr(AccountID)+'</accid>',AccLst)<=0 then
  begin
    AccLst := AccLst + '<accinfo>' ;
    AccLst := AccLst + AddTag('code',dmDatabase.tblAccountSACCOUNTCODE.Text);
    AccLst := AccLst + AddTag('accid',dmDatabase.tblAccountwaccountid.AsString);
    AccLst := AccLst + AddTag('description',dmDatabase.tblAccountSdescription.AsString);
    AccLst := AccLst + AddTag('incomeexpense',dmDatabase.tblAccountBIncomeExpense.AsString);
    AccLst := AccLst + AddTag('bsubaccounts',dmDatabase.tblAccountBSubaccounts.AsString);
    AccLst := AccLst + AddTag('bopenitem',dmDatabase.tblAccountBOPENITEM.AsString);
    AccLst := AccLst + AddTag('binactive',dmDatabase.tblAccountBINACTIVE.AsString);
    ALevel := 0 ;
    AccLst := AccLst + AddTag('group1',TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.tblAccountWREPORTINGGROUP1ID.AsInteger,ALevel));
    ALevel := 0 ;
    AccLst := AccLst + AddTag('group2',TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.tblAccountWREPORTINGGROUP2ID.AsInteger,ALevel));

    Case dmDatabase.tblAccountWAccountTypeID.Value of
      1: AddDebtorDetails(AccountID,AccLst);
      2: AddCreditorDetails(AccountID,AccLst);
      3: AddBankDetails(AccountID,AccLst);
      4: AddTaxDetails(AccountID,AccLst);
    end;
    AccLst := AccLst + '</accinfo>';
  end;
end;




Procedure AddStockItemToTxf(StockID:integer;Var StcLst,AccLst:String);
Var
  Code:String;
begin
  if Pos('<wstockid>'+IntToStr(StockID)+'</wstockid>',StcLst)<=0 then
  dmDatabase.ZQStock.sql.Text := DMTCCoreLink.GetSqlByName('database_selectstockonid');
  dmDatabase.ZQStock.ParamByName('WStockID').AsInteger := StockID;
  dmDatabase.ZQStock.open ;

  if not dmDatabase.ZQStock.IsEmpty then
  begin
    StcLst := StcLst + '<stockinfo>'+'<code>'+dmDatabase.ZQStockSSTOCKCODE.value+'</code>';
    StcLst := StcLst + '<wstockid>'+dmDatabase.ZQStockWStockID.AsString+'</wstockid>';
    StcLst := StcLst + '<description>'+dmDatabase.ZQStockSdescription.AsString+'</description>';
    StcLst := StcLst + '<barcode>'+dmDatabase.ZQStockSBARCODENUMBER.AsString+'</barcode>';
    StcLst := StcLst + '<manufacturer>'+dmDatabase.ZQStockSMANUFACTURER.AsString+'</manufacturer>';


    AddAccountToTxf(dmDatabase.ZQStockWinputTaxID.Value,AccLst,Code);
    StcLst := StcLst + '<intax>'+Code+'</intax>';
    AddAccountToTxf(dmDatabase.ZQStockWOutputTaxID.Value,AccLst,Code);
    StcLst := StcLst + '<Outax>'+Code+'</Outax>';
    AddAccountToTxf(dmDatabase.ZQStockWSaleSACCOUNTID.Value,AccLst,Code);
    StcLst := StcLst + '<SalesAcc>'+Code+'</SalesAcc>';
    AddAccountToTxf(dmDatabase.ZQStockWCostAccountID.Value,AccLst,Code);
    StcLst := StcLst + '<CostAcc>'+Code+'</CostAcc>';
    AddAccountToTxf(dmDatabase.ZQStockWStockAccountID.Value,AccLst,Code);
    StcLst := StcLst + '<StockAcc>'+Code+'</StockAcc>';
    StcLst := StcLst + '</stockinfo>';
  end;
end;





Function  SaveFileNow(aFile:String;FStream:TClientDataSet;FileTyeID:integer):Integer;
Var
  LotusStream:TLotusStream;
begin
  Case FileTyeID of
  1:Begin
      _SetProgress(gettextlang(2078),0);
       Result := ExportDsTofile(FStream,GetDestFileByType(AFile,FileTyeID));
      _SetProgress(-2);
    end;
  2:Begin
      _SetProgress(gettextlang(2079),0);
      LotusStream:=TLotusStream.Create;
      LotusStream.Dataset :=FStream;
      LotusStream.LtsFilename := aFile;
      LotusStream.Gauge:= fmProgress.Gauge1;
      LotusStream.Wk1Export;
      FStream.Close;
      _SetProgress(-2);
    end;
  3:Begin
      _SetProgress(gettextlang(2082),0);
       Result := ExportDsTofile(FStream,GetDestFileByType(AFile,FileTyeID));
      _SetProgress(-2);
    end;
   4:Begin
       
     end;
  5:Begin
      _SetProgress(gettextlang(2081),0);
       Result := ExportDsTofile(FStream,GetDestFileByType(AFile,FileTyeID));
      _SetProgress(-2);
    end;
  6:Begin
      _SetProgress(gettextlang(2080),0);
       Result := ExportDsTofile(FStream,GetDestFileByType(AFile,FileTyeID));
      _SetProgress(-2);
    end;


  else
    FStream.LogChanges := False;
    FStream.SaveToFile(aFile,dfXml);
    FStream.Close;
  end;
end;


Function ReadBookPath(BooksName:String):String;
var
 i : Integer ;
begin
  if BooksName='' then exit;
  for i := 0 to TheGlobalDataObject.Books.Count-1 do
     begin
       if TheGlobalDataObject.Books[i].Name = BooksName then
         begin
            result := TheGlobalDataObject.Books[i].Database ;
            break ;
         end;
     end;
end;


Function Str2Int(S:String):INteger;
Begin
  Result := StrToIntDef(S,0);
end;

Function Str2Bool(S:String):Boolean;
begin
  Result:= SameText('True',Trim(s));
end;


Function  SaveFileToWkx(afile,Logfile:String):integer;
Var
  FStream:TClientDataSet;
  LotusStream:TLotusStream;
begin
  _SetProgress(gettextlang(2079),0);
  FStream:=TClientDataSet.Create(Application);
  try
     FStream.FileName:=afile;
     LotusStream:=TLotusStream.Create;
    try
     LotusStream.Dataset :=FStream;
     LotusStream.LtsFilename := afile;
     LotusStream.Gauge:= fmProgress.Gauge1;
     LotusStream.Wk1Export;
    finally
     LotusStream.Free;
    end
  finally
   FStream.Free;
  end;
  _SetProgress(-2);
end;

Function  SaveFileToCsv(aOrgfile,afile,Logfile:String;Delimiter : Char):integer;
Var
  FStream:TClientDataSet;
  CsvStream:TCsvStream;
  AProgress : TfmNewProgress ;  
begin

   AProgress := TfmNewProgress.Create(nil) ;
    try

    FStream:=TClientDataSet.Create(nil);
    try
       FStream.FileName:=aOrgfile;
       FStream.open ;
       AProgress.initProgress(gettextlang(2078),FStream.RecordCount);
       AProgress.BtnStop.Visible := true ;

       CsvStream:=TCsvStream.Create;
      try
       CsvStream.Dataset :=FStream;
       CsvStream.CsvFilename := afile;
       CsvStream.Delimeter := Delimiter ;
       CsvStream.Gauge := fmProgress.Gauge1;
       CsvStream.CsvExport;
      finally
       CsvStream.Free;
      end;
    finally
    FStream.Free;
    end;
    finally
      AProgress.free ;
    end;
end;

Function  SaveFileToXls(afile,Logfile:String):integer;
Var
  FStream:TClientDataSet;
  ExcelStream:TExcelStream;
begin
  _SetProgress(gettextlang(2078),0);
  FStream:=TClientDataSet.Create(nil);
  try
     FStream.FileName:=afile;
     ExcelStream:=TExcelStream.Create;
    try
     ExcelStream.Dataset :=FStream;
     ExcelStream.XlsFilename := afile;
     ExcelStream.Gauge := fmProgress.Gauge1;
     ExcelStream.XlsExport;
    finally
     ExcelStream.Free;
    end;
  finally
  FStream.Free;
  end;
  _SetProgress(-2);
end;

Function UpDateStock(aStockID:Integer; StockValue:Real;AddQte:Boolean):Integer;
Var
  Hold:Boolean;
begin
  Result := 0;
  With dmDatabase do begin
    Hold := tblStock.Active;
    tblStock.Open;
    StockValue:=Abs(StockValue);
    if  tblStock.Locate('WStockID', aStockID, []) then begin
      tblStock.Edit;
      if AddQte then
        tblStockFInvQtyOnHand.Value := tblStockFInvQtyOnHand.Value + StockValue
      else
        tblStockFInvQtyOnHand.Value := tblStockFInvQtyOnHand.Value - StockValue;
      tblStock.Post;
    end;
    tblStock.Active:=Hold;
  end;
end;

Procedure CreateXmlTransDef(Var ads:TClientDataSet);
begin

  ads.FieldDefs.Add('SBatchName',ftString,16);
  ads.FieldDefs.Add('SACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('STAXAccount',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SCONTRAACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SUserName',ftString,20);
  ads.FieldDefs.Add('SDescription',ftString,35);
  ads.FieldDefs.Add('SUniqueID',ftString,32);
  ads.FieldDefs.Add('SAlias',ftString,32);

  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('WBatchID'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('WLineID'));
  CdsAdd(ads,dmDatabase.tblTransactionWLINKEDID);
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('DDate'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('WPeriodID'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('SReference'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FAmount'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FTaxRate'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FTaxAmount'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FTaxRate2'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FTax2Amount'));
  CdsAdd(ads,dmDatabase.tblTransaction.fieldbyname('FForExAmount'));
  {}

end;




Procedure CreateStocksDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  dmDatabase.InitFieldsBeforeOpenDataset(dmDatabase.tblStock);
  Add(dmDatabase.tblStock.fieldbyname('SSTOCKCODE'));
  Add(dmDatabase.tblStock.fieldbyname('WStockTypeID'));
  Add(dmDatabase.tblStock.fieldbyname('SbarCodeNumber'));
  Add(dmDatabase.tblStock.fieldbyname('SDescription'));
  Add(dmDatabase.tblStock.fieldbyname('Smanufacturer'));
  Add(dmDatabase.tblStock.fieldbyname('FQtyOnhand'));
  Add(dmDatabase.tblStock.fieldbyname('FReorderQty'));
  Add(dmDatabase.tblStock.fieldbyname('FReorderQtyTrig'));
  Add(dmDatabase.tblStock.fieldbyname('FMINIMUMQTY'));

  Add(dmDatabase.tblStock.fieldbyname('BApplyInvoiceDiscount'));
  Add(dmDatabase.tblStock.fieldbyname('FSellingPrice1'));
  Add(dmDatabase.tblStock.fieldbyname('FSellingPrice2'));
  Add(dmDatabase.tblStock.fieldbyname('FSellingPrice3'));
  Add(dmDatabase.tblStock.fieldbyname('FUnitAveCost'));
  Add(dmDatabase.tblStock.fieldbyname('FUnitCost'));
  Add(dmDatabase.tblStock.fieldbyname('FNETTOWEIGHT'));
  Add(dmDatabase.tblStock.fieldbyname('FGROSSWEIGHT'));
  Add(dmDatabase.tblStock.fieldbyname('SEXTRADESC'));
  Add(dmDatabase.tblStock.fieldbyname('SEXTERNALID'));
  Add(dmDatabase.tblStock.fieldbyname('BDISABLED'));

   Add(dmDatabase.tblStock.fieldbyname('SSTOCKCODESUP1'));
   Add(dmDatabase.tblStock.fieldbyname('SSTOCKCODESUP2'));


  ads.FieldDefs.Add('SUnit',ftString,8);
  ads.FieldDefs.Add('SGroup1',ftString,400);
  ads.FieldDefs.Add('SGroup2',ftString,400);
  ads.FieldDefs.Add('SCostAccount',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SSaleSACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SStockAccount',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SInputTax',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SOutputTax',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SSupplier1',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SSupplier2',ftString,MainAccountLength + 5);

  ads.FieldDefs.Add('OPTION',ftString,255);
  dmDatabase.ZQGroups.Close ;
  dmDatabase.ZQGroups.SQL.Text := 'Select * from groups where WGroupTypeid = 1004' ;
  dmDatabase.ZQGroups.open ;
  while not dmDatabase.ZQGroups.Eof do
    begin
     ads.FieldDefs.Add('DESCLANG' + dmDatabase.ZQGroupsWGROUPID.AsString ,ftString,DMTCCoreLink.GetFieldLength('STOCK_DESCRIPTIONS','SDESCRIPTION'));
     ads.FieldDefs.Add('MEMOLANG' + dmDatabase.ZQGroupsWGROUPID.AsString ,ftMemo);
     dmDatabase.ZQGroups.next ;
    end;


  {For Tax Accounts}
end;

Procedure CreateAcctsDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  Add(dmDatabase.tblAccount.fieldbyname('WAccountTypeID'));
  Add(dmDatabase.tblAccount.fieldbyname('sDescription'));
  {}
  // done : Pieter Account code length is important
  ads.FieldDefs.Add('SACCOUNTCODE',ftString,MainAccountLength + 5);
  Add(dmDatabase.tblAccount.fieldbyname('BincomeExpense'));
  Add(dmDatabase.tblAccount.fieldbyname('BSubAccounts'));
  Add(dmDatabase.tblAccount.fieldbyname('BOpenItem'));
  Add(dmDatabase.tblAccount.fieldbyname('BInactive'));
  ads.FieldDefs.Add('SGroup1',ftString,30);
  ads.FieldDefs.Add('SGroup2',ftString,30);
  {For Tax Accounts}
  Add(dmDatabase.tblTax.fieldbyname('DStartDate'));
  Add(dmDatabase.tblTax.fieldbyname('DEndDate'));
  Add(dmDatabase.tblTax.fieldbyname('FRate'));
  {For Bank Accounts}
  ads.FieldDefs.Add('SReceipt',ftString,30);
  ads.FieldDefs.Add('SPayment',ftString,30);
  ads.FieldDefs.Add('SCurrency',ftString,30);

end;

Procedure CreateBatchDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField;NewName:string='');
  begin
    if NewName='' then
      ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size)
    else
      ads.FieldDefs.Add(NewName,xField.DataType,xField.Size);
  end;
begin
  Add(dmDatabase.tblBatch.fieldbyname('WLineID'));
  Add(dmDatabase.tblBatch.fieldbyname('SReference'));
  Add(dmDatabase.tblBatch.fieldbyname('DDate'));
  Add(dmDatabase.tblBatch.fieldbyname('SDescription'));
  Add(dmDatabase.tblBatch.fieldbyname('FAmount'));
  Add(dmDatabase.tblBatch.fieldbyname('BExclusive'));
  Add(dmDatabase.tblBatch.fieldbyname('FTaxAmount'));
  // done : Pieter Account code length is important
  ads.FieldDefs.Add('SACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('STAXAccount',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SCONTRAACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SBatchName',ftString,32);

  Add(dmDatabase.tblBatch.fieldbyname('WLineID'),'WBatchID');
  Add(dmDatabase.tblBatch.fieldbyname('WLineID'),'WPeriodID');
  Add(dmDatabase.tblBatch.fieldbyname('WLinkedID'),'WLinkedID');
  ads.FieldDefs.Add('SUserName',ftString,32);
  ads.FieldDefs.Add('SUniqueID',ftString,32);
  ads.FieldDefs.Add('SAlias',ftString,32);
  Add(dmDatabase.tblBatch.fieldbyname('FTaxAmount'),'FTaxRate2');
  Add(dmDatabase.tblBatch.fieldbyname('FTaxAmount'),'FTaxRate');
  Add(dmDatabase.tblBatch.fieldbyname('FTaxAmount'),'FTax2Amount');
  Add(dmDatabase.tblBatch.fieldbyname('FTaxAmount'),'FForexAmount');
end;



Procedure CreateDoclineDetail(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  Add(dmDatabase.tblDocLine.fieldbyname('WDocID'));
  Add(dmDatabase.tblDocLine.fieldbyname('WDocLineID'));
  ads.FieldDefs.Add('SOPTION1NAME',ftString,35);
  ads.FieldDefs.Add('SOPTIONVALUE1NAME',ftString,35);

  ads.FieldDefs.Add('SOPTION2NAME',ftString,35);
  ads.FieldDefs.Add('SOPTIONVALUE2NAME',ftString,35);

  ads.FieldDefs.Add('SOPTION3NAME',ftString,35);
  ads.FieldDefs.Add('SOPTIONVALUE3NAME',ftString,35);

  ads.FieldDefs.Add('SOPTION4NAME',ftString,35);
  ads.FieldDefs.Add('SOPTIONVALUE4NAME',ftString,35);

  ads.FieldDefs.Add('SOPTION5NAME',ftString,35);
  ads.FieldDefs.Add('SOPTIONVALUE5NAME',ftString,35);
  ads.FieldDefs.Add('FQTY',ftFloat,0);
  ads.FieldDefs.Add('FPRICE',ftFloat,0);
end;


Procedure CreateDocLinesDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  Add(dmDatabase.tblDocLine.fieldbyname('WDocID'));
  Add(dmDatabase.tblDocLine.fieldbyname('WLineTypeID'));
  Add(dmDatabase.tblDocLine.fieldbyname('WDocLineID'));
  Add(dmDatabase.tblDocLine.fieldbyname('WStockID'));
  Add(dmDatabase.tblDocLine.fieldbyname('FQtyOrdered'));
  Add(dmDatabase.tblDocLine.fieldbyname('FQtyShipped'));
  Add(dmDatabase.tblDocLine.fieldbyname('FSellingPrice'));
  Add(dmDatabase.tblDocLine.fieldbyname('FItemDiscount'));
  Add(dmDatabase.tblDocLine.fieldbyname('WTaxID'));
  Add(dmDatabase.tblDocLine.fieldbyname('FInclusiveAmt'));
  Add(dmDatabase.tblDocLine.fieldbyname('FExclusiveAmt'));
  Add(dmDatabase.tblDocLine.fieldbyname('FTaxAmount'));
  Add(dmDatabase.tblDocLine.fieldbyname('WSORTNO'));
  {}
  ads.FieldDefs.Add('SDescription',ftString,255);
  {From Account}
  Add(dmDatabase.tblAccount.fieldbyname('SACCOUNTCODE'));
  {From Stock}
  Add(dmDatabase.TblStock.fieldbyname('SBARCODENUMBER'));
  Add(dmDatabase.TblStock.fieldbyname('SSTOCKCODE'));
end;

Procedure CreateDocHeadDef(Var ads:TClientDataSet);
Var
  aSize : integer;
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  Add(dmDatabase.tblDocHeader.fieldbyname('WDocID'));
  Add(dmDatabase.tblDocHeader.fieldbyname('WtypeID'));
  Add(dmDatabase.tblDocHeader.fieldbyname('DDate'));
  Add(dmDatabase.tblDocHeader.fieldbyname('DAllocatedDate'));
  Add(dmDatabase.tblDocHeader.fieldbyname('SDocNo'));
  Add(dmDatabase.tblDocHeader.fieldbyname('SReference'));
  Add(dmDatabase.tblDocHeader.fieldbyname('BPrinted'));
  Add(dmDatabase.tblDocHeader.fieldbyname('BPosted'));
  Add(dmDatabase.tblDocHeader.fieldbyname('BExclusive'));
  Add(dmDatabase.tblDocHeader.fieldbyname('FInvoiceDiscount'));
  Add(dmDatabase.tblDocHeader.fieldbyname('FDocAmount'));
  Add(dmDatabase.tblDocHeader.fieldbyname('FTaxAmount'));
  Add(dmDatabase.tblDocHeader.fieldbyname('WAccountID'));
  Add(dmDatabase.tblDocHeader.fieldbyname('WPaymentTypeID'));
  Add(dmDatabase.tblDocHeader.fieldbyname('WPaymentGroupID'));
  Add(dmDatabase.tblDocHeader.fieldbyname('BRepeating'));
  Add(dmDatabase.tblDocHeader.fieldbyname('DSysDate'));
  {From Account}
  Add(dmDatabase.tblAccount.fieldbyname('SACCOUNTCODE'));
  Add(dmDatabase.tblAccount.fieldbyname('WAccountTypeID'));
  {From Messages}
  aSize:= DMTCCoreLink.GetFieldLength('messages','SDescription');
  ads.FieldDefs.Add('SPostCompany',ftString,aSize);
  ads.FieldDefs.Add('SPostContact',ftString,aSize);
  ads.FieldDefs.Add('SDelCompany',ftString,aSize);
  ads.FieldDefs.Add('SDelContact',ftString,aSize);
  ads.FieldDefs.Add('STAXREF',ftString,aSize);

  ads.FieldDefs.Add('SPost1',ftString,aSize);
  ads.FieldDefs.Add('SPost2',ftString,aSize);
  ads.FieldDefs.Add('SPost3',ftString,aSize);
  ads.FieldDefs.Add('SPostCode',ftString,aSize);
  ads.FieldDefs.Add('SMsg1',ftString,aSize);
  ads.FieldDefs.Add('SMsg2',ftString,aSize);
  ads.FieldDefs.Add('SMsg3',ftString,aSize);
  ads.FieldDefs.Add('SSalesperson',ftString,aSize);
  ads.FieldDefs.Add('SDel1',ftString,aSize);
  ads.FieldDefs.Add('SDel2',ftString,aSize);
  ads.FieldDefs.Add('SDel3',ftString,aSize);
  ads.FieldDefs.Add('SDelCode',ftString,aSize);
  ads.FieldDefs.Add('SGroup1',ftString,aSize);
  ads.FieldDefs.Add('SGroup2',ftString,aSize);
  ads.FieldDefs.Add('SCurrency',ftString,aSize);
  ads.FieldDefs.Add('SUserName',ftString,aSize);
  aSize:= DMTCCoreLink.GetFieldLength('COUNTRIES','COUNTRIES_NAME ');
  ads.FieldDefs.Add('SPostCountry',ftString,aSize);
  ads.FieldDefs.Add('SDelCountry',ftString,aSize);
end;


Procedure CreateDebtorsDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
    // done : Pieter Account code length is important
  ads.FieldDefs.Add('SACCOUNTCODE',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SDescription',ftString,35);
  ads.FieldDefs.Add('SContactName',ftString,50);

  ads.FieldDefs.Add('SPostCountry',ftString,64);
  ads.FieldDefs.Add('SDelCountry',ftString,64);

  Add(dmDatabase.tblDebtor.fieldbyname('SPostal1'));
  Add(dmDatabase.tblDebtor.fieldbyname('SPostal2'));
  Add(dmDatabase.tblDebtor.fieldbyname('SPostal3'));
  Add(dmDatabase.tblDebtor.fieldbyname('SPostalCode'));



  Add(dmDatabase.tblDebtor.fieldbyname('SDelivery1'));
  Add(dmDatabase.tblDebtor.fieldbyname('SDelivery2'));
  Add(dmDatabase.tblDebtor.fieldbyname('SDelivery3'));
  Add(dmDatabase.tblDebtor.fieldbyname('SDeliveryCode'));
  Add(dmDatabase.tblDebtor.fieldbyname('STelephone1'));
  Add(dmDatabase.tblDebtor.fieldbyname('STelephone2'));
  Add(dmDatabase.tblDebtor.fieldbyname('SEmail'));
  Add(dmDatabase.tblDebtor.fieldbyname('SFax'));
  Add(dmDatabase.tblDebtor.fieldbyname('FCREDITLimit'));
  Add(dmDatabase.tblDebtor.fieldbyname('FChargeAmount'));
  Add(dmDatabase.tblDebtor.fieldbyname('FDiscount'));
  Add(dmDatabase.tblDebtor.fieldbyname('FInterest'));
  Add(dmDatabase.tblAccount.fieldbyname('BOpenItem'));
  Add(dmDatabase.tblAccount.fieldbyname('BInactive'));
  Add(dmDatabase.tblDebtor.fieldbyname('SMessage'));
  Add(dmDatabase.tblDebtor.fieldbyname('WDefaultPriceTypeID'));
  Add(dmDatabase.tblDebtor.fieldbyname('DLastActivity'));
  Add(dmDatabase.tblDebtor.fieldbyname('SReference'));

  Add(dmDatabase.tblDebtorSBANKNAME);
  Add(dmDatabase.tblDebtorSBRANCHCODE);
  Add(dmDatabase.tblDebtorSBANKACCOUNTNUMBER);
  Add(dmDatabase.tblDebtorSBANKACCOUNTNAME);
  Add(dmDatabase.tblDebtorSCREDITCARDNUMBER);
  Add(dmDatabase.tblDebtorSCREDITCARDTYPE);
  Add(dmDatabase.tblDebtorSCREDITCARDHOLDER);


  Add(dmDatabase.tblDebtor.fieldbyname('WDUEDAYS'));
  //Add(dmDatabase.tblDebtor.fieldbyname('DREMITTANCE'));
  Add(dmDatabase.tblCreditor.fieldbyname('SCOMPANYREGNO'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD1'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD2'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD3'));

  ads.FieldDefs.Add('SGroup1',ftString,200);
  ads.FieldDefs.Add('SGroup2',ftString,200);
  ads.FieldDefs.Add('SSalesPerson',ftString,30);
  ads.FieldDefs.Add('SCurrency',ftString,30);

  // done : Pieter Account code length is important
  ads.FieldDefs.Add('SForeExAccount',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SDEFAULTACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SDEFAULTTAX',ftString,MainAccountLength + 5);
end;


Procedure CreateCreditorDef(Var ads:TClientDataSet);
  Procedure Add(xField:TField);
  begin
    ads.FieldDefs.Add(xfield.FieldName,xField.DataType,xField.Size);
  end;
begin
  ads.FieldDefs.Add('SACCOUNTCODE',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SDescription',ftString,35);
  ads.FieldDefs.Add('SContactName',ftString,50);
  ads.FieldDefs.Add('SPostCountry',ftString,64);
  ads.FieldDefs.Add('SDelCountry',ftString,64);

  Add(dmDatabase.tblCreditor.fieldbyname('SPostal1'));
  Add(dmDatabase.tblCreditor.fieldbyname('SPostal2'));
  Add(dmDatabase.tblCreditor.fieldbyname('SPostal3'));
  Add(dmDatabase.tblCreditor.fieldbyname('SPostalCode'));
  Add(dmDatabase.tblCreditor.fieldbyname('SDelivery1'));
  Add(dmDatabase.tblCreditor.fieldbyname('SDelivery2'));
  Add(dmDatabase.tblCreditor.fieldbyname('SDelivery3'));


  Add(dmDatabase.tblCreditor.fieldbyname('STelephone1'));
  Add(dmDatabase.tblCreditor.fieldbyname('STelephone2'));
  Add(dmDatabase.tblCreditor.fieldbyname('SEmail'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFax'));
  Add(dmDatabase.tblCreditor.fieldbyname('FCREDITLimit'));
  Add(dmDatabase.tblCreditor.fieldbyname('FChargeAmount'));
  Add(dmDatabase.tblCreditor.fieldbyname('FDiscount'));

  // dummy not used in Creditor.
  ads.FieldDefs.Add('SDeliveryCode',ftString,dmDatabase.tblCreditorSDelivery1.Size);
  ads.FieldDefs.Add('FInterest',ftFloat,0);
  Add(dmDatabase.tblDebtorSCREDITCARDNUMBER);
  Add(dmDatabase.tblDebtorSCREDITCARDTYPE);
  Add(dmDatabase.tblDebtorSCREDITCARDHOLDER);


  Add(dmDatabase.tblAccount.fieldbyname('BOpenItem'));
  Add(dmDatabase.tblAccount.fieldbyname('BInactive'));
//  Add(dmDatabase.tblCreditor.fieldbyname('BDisabled'));
  Add(dmDatabase.tblCreditor.fieldbyname('SMessage'));
  Add(dmDatabase.tblCreditor.fieldbyname('WDefaultPriceTypeID'));
  Add(dmDatabase.tblCreditor.fieldbyname('DLastActivity'));
  Add(dmDatabase.tblCreditor.fieldbyname('SReference'));
  ads.FieldDefs.Add('SBANKNAME',ftString,dmDatabase.tblCreditorWBANKNAME.Size);

  Add(dmDatabase.tblCreditorSBRANCHCODE);
  Add(dmDatabase.tblCreditorSBANKACCOUNTNUMBER);
  Add(dmDatabase.tblCreditorSBANKACCOUNTNAME);


  Add(dmDatabase.tblCreditorWDUEDAYS);
  Add(dmDatabase.tblCreditor.fieldbyname('SCOMPANYREGNO'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD1'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD2'));
  Add(dmDatabase.tblCreditor.fieldbyname('SFREEFIELD3'));
  {}





  ads.FieldDefs.Add('SGroup1',ftString,30);
  ads.FieldDefs.Add('SGroup2',ftString,30);
//  ads.FieldDefs.Add('SSalesPerson',ftString,30);
  ads.FieldDefs.Add('SCurrency',ftString,30);
  ads.FieldDefs.Add('SForeExAccount',ftString,MainAccountLength + 5);

  ads.FieldDefs.Add('SDEFAULTACCOUNT',ftString,MainAccountLength + 5);
  ads.FieldDefs.Add('SDEFAULTTAX',ftString,MainAccountLength + 5);

end;




procedure CreateXmlDocHead(Var FStream:TClientDataSet);

begin
//  if pos('.',Filename)>1 then
//       Filename:=Trim(Copy(Filename,1,Pos('.',Filename)-1));
//  Filename:=Filename+'.Xml';
  FStream.Close;
  // Save Fields Names ANd Types
  FStream.FieldDefs.Clear;
  CreateDocHeadDef(FStream);
//  Filename:=ApplicationPath+'tcDocHead.Xml';
  FStream.CreateDataSet;
  FStream.LogChanges := False;
  FStream.SaveToFile('',dfXml);
//  FStream.FileName := Filename;
  FStream.Active := True;
end;

procedure CreateXmlDocLines(Var FStream:TClientDataSet);
begin
  FStream.Close;
  // Save Fields Names ANd Types
  FStream.FieldDefs.Clear;
  CreateDocLinesDef(FStream);
//  Filename:=ApplicationPath+'tcDocLines.Xml';
  FStream.CreateDataSet;
  FStream.LogChanges := False;
  FStream.SaveToFile('',dfXml);
//  FStream.FileName := Filename;
  FStream.Active := True;
end;

procedure CreateXmlFilesDef(Var FStream:TClientDataSet;FileID:Integer);
begin
  FStream.Close;
  FStream.FieldDefs.Clear;
  Case FileID of
   0:CreateAcctsDef(FStream);
   1:CreateStocksDef(FStream);
   2:CreateDebtorsDef(FStream);
   3:CreateDocHeadDef(FStream);
   4:CreateDocLinesDef(FStream);
   5:CreateXmlTransDef(FStream);
   6:CreateCreditorDef(FStream);
   7:CreateBatchDef(FStream);
   8:CreateDoclineDetail(FStream);
  end;
  FStream.CreateDataSet;
//  FStream.SaveToFile('',dfXml);
   FStream.Active := True;
end;

Function WriteDocTxfToFile(FStream,LStream,lDStream:TDataset;aFile:string):Integer;Forward;
Function WriteDocTxfToStr(FStream,LStream,lDStream:TDataset):Integer;Forward;



Function  ExportXmlDoc(aDate,aDateTo:TDateTime;Headfile,Linesfile,Logfile:String;ExcludeUnPosted:Boolean;FileTyeID:integer;Bsysdate:boolean=false;limitSQL:string=''):Integer;
Var
  FStream:TClientDataSet;
  FlStream:TClientDataSet;
  FldStream:TClientDataSet;
  xc,yc, i:integer;
  ALevel : Integer ;
  //UserName:String;
  QOptions : TuniQuery ;
  AFileStream : TFileStream ;
  LineToWrite : AnsiString ;
  AFormatSettings : TFormatSettings ;
Begin
  AFormatSettings.DateSeparator := '/' ;
  AFormatSettings.DecimalSeparator := '.' ;
  AFormatSettings.ThousandSeparator := ',' ;
  AFormatSettings.ShortDateFormat := 'yyyy/mm/dd' ;



  Result := 0;
  try
    dmDatabase.tblUser.Open;
    FStream := TClientDataSet.Create(Application);
    FlStream := TClientDataSet.Create(Application);
    FldStream := TClientDataSet.Create(Application);
    QOptions := TuniQuery.create(nil) ;
    QOptions.Connection := DMTCCoreLink.TheZConnection ;
    QOptions.sql.Text := 'SELECT * FROM DOCLINEOPTIONS where wdocid =:WDocid  order by wlineid,WDOCLINEOPTIONSID' ;

     CreateXmlFilesDef(FldStream,8);
      {Create Doc Head Data set}
      CreateXmlFilesDef(FStream,3);
      {Create Doc Lines Data set}
      CreateXmlFilesDef(FlStream,4);
    {Export Doc Head}
    {Open Tables}
    if limitSQL <> '' then
      begin
       dmDatabase.tblDocHeader.SQL.Text := limitSQL
      end  else
      begin
        dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead ';
        if Bsysdate then
          dmDatabase.tblDocHeader.SQL.Add('where DSysDate>='+ QuotedStr(FormatDateTime('yyyy/mm/dd',aDate))+' AND DSysDate<= '+ QuotedStr(FormatDateTime('yyyy/mm/dd',adateTo)))
        else
          dmDatabase.tblDocHeader.SQL.Add('where DDate>='+ QuotedStr(FormatDateTime('yyyy/mm/dd',aDate))+' AND DDate<= '+ QuotedStr(FormatDateTime('yyyy/mm/dd',adateTo)));
      end;
    if ExcludeUnPosted then
       dmDatabase.tblDocHeader.SQL.Add(' and BPosted=1');

    dmDatabase.tblDocHeader.Open;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblStock.Open;
    xc:=0;

      {}
      _SetProgress(gettextlang(2077),0);
      yc:=dmDatabase.tblDocHeader.RecordCount;
      _SetProgress(yc);
      With dmDatabase.tblDocHeader do
      While not Eof do
      begin
        Inc(xc);
        _SetSubText(IntToStr(xc)+ ' '+gettextlang(3005){of}+' '+ intToStr(yc));
        //if bAppend And FStream.Locate('WDocID',FieldByName('WDocID').AsString,[]) then
        //begin
        //  dmDatabase.tblDocHeader.Next;
        //  Continue;
        //end;
        FStream.Append;
        FStream.FieldByName('WDocID').AsString         := FieldByName('WDocID').AsString;
        FStream.fieldbyname('WtypeID').AsString        := fieldbyname('WtypeID').AsString;
        FStream.fieldbyname('DDate').AsString          := fieldbyname('DDate').AsString;
        FStream.fieldbyname('DAllocatedDate').AsString := fieldbyname('DAllocatedDate').AsString;
        FStream.fieldbyname('SDocNo').AsString         := fieldbyname('SDocNo').AsString;
        FStream.fieldbyname('SReference').AsString     := fieldbyname('SReference').AsString;
        FStream.fieldbyname('BPrinted').AsString       := fieldbyname('BPrinted').AsString;
        FStream.fieldbyname('BPosted').AsString        := fieldbyname('BPosted').AsString;
        FStream.fieldbyname('BExclusive').AsString     := fieldbyname('BExclusive').AsString;
        FStream.fieldbyname('FInvoiceDiscount').AsString := fieldbyname('FInvoiceDiscount').AsString;
        FStream.fieldbyname('FDocAmount').AsString       := fieldbyname('FDocAmount').AsString;
        FStream.fieldbyname('FTaxAmount').AsString       := fieldbyname('FTaxAmount').AsString;
        FStream.fieldbyname('WAccountID').AsString       := fieldbyname('WAccountID').AsString;
        FStream.fieldbyname('WPaymentTypeID').AsString   := fieldbyname('WPaymentTypeID').AsString;
        FStream.fieldbyname('WPaymentGroupID').AsString  := fieldbyname('WPaymentGroupID').AsString;
        FStream.fieldbyname('BRepeating').AsString       := fieldbyname('BRepeating').AsString;
      {From Account}
        dmDatabase.tblAccount.Locate('WAccountID',FieldByName('WAccountID').AsInteger,[]);
        FStream.fieldbyname('SACCOUNTCODE').AsString :=  dmDatabase.tblAccount.fieldbyname('SACCOUNTCODE').AsString ;
        FStream.fieldbyname('WAccountTypeID').AsString := dmDatabase.tblAccount.fieldbyname('WAccountTypeID').AsString ;
      {From Messages}
        FStream.FieldByName('SPost1').AsString :=  _ReadDescription(FieldByName('wPostal1ID').AsInteger);
        FStream.FieldByName('SPost2').AsString :=  _ReadDescription(FieldByName('wPostal2ID').AsInteger);
        FStream.FieldByName('SPost3').AsString :=  _ReadDescription(FieldByName('wPostal3ID').AsInteger);
        FStream.FieldByName('SPostCode').AsString :=  _ReadDescription(FieldByName('WPostalCodeID').AsInteger);
        FStream.FieldByName('SPostCountry').AsString :=  TDataBaseRoutines.GetCountryName(FieldByName('WPOSCOUNTRIES_ID').AsInteger);
        FStream.FieldByName('SMsg1').AsString :=  _ReadDescription(FieldByName('WMessage1ID').AsInteger);
        FStream.FieldByName('SMsg2').AsString :=  _ReadDescription(FieldByName('WMessage2ID').AsInteger);
        FStream.FieldByName('SMsg3').AsString :=  _ReadDescription(FieldByName('WMessage3ID').AsInteger);


        FStream.FieldByName('SPostCompany').AsString :=  _ReadDescription(FieldByName('WPOSTALNAME').AsInteger);
        FStream.FieldByName('SPostContact').AsString :=  _ReadDescription(FieldByName('WPOSTALCONTACT').AsInteger);
        FStream.FieldByName('SDelCompany').AsString :=  _ReadDescription(FieldByName('WDELNAME').AsInteger);
        FStream.FieldByName('SDelContact').AsString :=  _ReadDescription(FieldByName('WDELCONTACT').AsInteger);
        FStream.FieldByName('STAXREF').AsString :=  _ReadDescription(FieldByName('WTAXNUMBER').AsInteger);

        ALevel := 0 ;
        FStream.FieldByName('sGroup1').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(FieldByName('WReportingGroup1ID').AsInteger,ALevel) ;
        ALevel := 0 ;
        FStream.FieldByName('sGroup2').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(FieldByName('WReportingGroup2ID').AsInteger,ALevel) ;
        ALevel := 0 ;
        FStream.FieldByName('SSalesperson').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(FieldByName('WSalesmanID').AsInteger,ALevel) ;


        FStream.FieldByName('SDel1').AsString :=  _ReadDescription(FieldByName('wDelAddress1ID').AsInteger);
        FStream.FieldByName('SDel2').AsString :=  _ReadDescription(FieldByName('wDelAddress2ID').AsInteger);
        FStream.FieldByName('SDel3').AsString :=  _ReadDescription(FieldByName('wDelAddress3ID').AsInteger);
        FStream.FieldByName('SDelCode').AsString :=  _ReadDescription(FieldByName('wDelCodeID').AsInteger);

        FStream.FieldByName('SDelCountry').AsString :=  TDataBaseRoutines.GetCountryName(FieldByName('WDELCOUNTRIES_ID').AsInteger);
        ALevel:=0;
        FStream.FieldByName('SGroup1').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(FieldByName('WReportingGroup1ID').AsInteger,ALevel) ;
        ALevel:=0;
        FStream.FieldByName('SGroup2').AsString :=  TDataBaseRoutines.GetNesteldNameFromGroupID(FieldByName('WReportingGroup2ID').AsInteger,ALevel) ;
        FStream.FieldByName('SCurrency').AsString :=  '';
        FStream.FieldByName('SUserName').AsString := GetT3UserName(FieldByName('WUserID').AsInteger);
        FStream.FieldByName('DSysDate').ASDateTime := FieldByName('DSysDate').AsDateTime;
        FStream.Post;
        {Export Doc Lines}
        dmdatabase.tblDocLine.Close ;
        dmdatabase.tblDocLine.SQL.Text :='select * from docline where WDocid ='+ FieldByNAme('WDocID').AsString  + ' order by wsortno ' ;
        dmdatabase.tblDocLine.Open;
        dmDatabase.tblDocLine.First;
        While not dmdatabase.tblDocLine.Eof do
        begin
          FlStream.Append;
          FlStream.FieldByName('WDocID').AsString := dmDatabase.tblDocLineWDocID.AsString;
          FlStream.FieldByName('WSORTNO').AsString := dmDatabase.tblDocLineWSORTNO.AsString;
          FlStream.FieldByName('WLineTypeID').AsString := dmDatabase.tblDocLineWLineTypeID.AsString;
          FlStream.FieldByName('WDocLineID').AsString := dmDatabase.tblDocLineWDocLineID.AsString;
          FlStream.FieldByName('WDocLineID').AsString := dmDatabase.tblDocLineWDocLineID.AsString;
          FlStream.FieldByName('WStockID').AsString := dmDatabase.tblDocLineWStockID.AsString;
          FlStream.FieldByName('SDescription').AsString := _ReadDescription(dmDatabase.tblDocLineWDescriptionID.AsInteger);
          FlStream.FieldByName('FQtyOrdered').AsString := dmDatabase.tblDocLineFQtyOrdered.AsString;
          FlStream.FieldByName('FQtyShipped').AsString := dmDatabase.tblDocLineFQtyShipped.AsString;
          FlStream.FieldByName('FSellingPrice').AsString := dmDatabase.tblDocLineFSellingPrice.AsString;
          FlStream.FieldByName('FItemDiscount').AsString := dmDatabase.tblDocLineFItemDiscount.AsString;
          FlStream.FieldByName('WTaxID').AsString := dmDatabase.tblDocLineWTaxID.AsString;
          FlStream.FieldByName('FInclusiveAmt').AsString := dmDatabase.tblDocLineFInclusiveAmt.AsString;
          FlStream.FieldByName('FExclusiveAmt').AsString := dmDatabase.tblDocLineFExclusiveAmt.AsString;
          FlStream.FieldByName('FTaxAmount').AsString := dmDatabase.tblDocLineFTaxAmount.AsString;
          {From Account}
          if dmDatabase.tblAccount.Locate('WAccountID', dmDatabase.tblDocLineWTaxID.AsInteger,[]) then
            FlStream.FieldByName('SACCOUNTCODE').AsString := dmDatabase.tblAccount.fieldbyname('SACCOUNTCODE').AsString;
          {From Stock}
          FlStream.FieldByName('SSTOCKCODE').AsString:='';
          if dmDatabase.tblDocLineWLineTypeID.AsInteger in [90,94] then
           begin
              dmDatabase.ZQStock.sql.Text := DMTCCoreLink.GetSqlByName('database_selectstockonid');
              dmDatabase.ZQStock.ParamByName('WStockID').AsInteger := dmDatabase.tblDocLineWStockID.AsInteger;
              dmDatabase.ZQStock.open ;
              if not dmDatabase.ZQStock.IsEmpty then
                  FlStream.FieldByName('SSTOCKCODE').AsString := dmDatabase.ZQStock.fieldbyname('SSTOCKCODE').AsString;
           end;
          FlStream.Post;
          dmDatabase.tblDocLine.Next;
        end;


        QOptions.Close ;
        QOptions.Params[0].AsInteger := FieldByNAme('WDocID').AsInteger;
        QOptions.Open;
        QOptions.First;
        While not QOptions.Eof do
        begin
          FldStream.Append;
          FldStream.FieldByName('WDocID').AsInteger := QOptions.fieldByName('WDocID').AsInteger;

          FldStream.FieldByName('WDocLineID').AsInteger := QOptions.fieldByName('WLineid').AsInteger;
          FldStream.FieldByName('SOPTION1NAME').AsString := TDataBaseStockRoutines.GetOptionNameFromItemValueID(QOptions.fieldByName('WITEMOPTIONVALUE1ID').AsInteger);
          FldStream.FieldByName('SOPTIONVALUE1NAME').AsString := TDataBaseStockRoutines.GetOptionItemValueName(QOptions.fieldByName('WITEMOPTIONVALUE1ID').AsInteger);

          FldStream.FieldByName('SOPTION2NAME').AsString := TDataBaseStockRoutines.GetOptionNameFromItemValueID(QOptions.fieldByName('WITEMOPTIONVALUE2ID').AsInteger);
          FldStream.FieldByName('SOPTIONVALUE2NAME').AsString := TDataBaseStockRoutines.GetOptionItemValueName(QOptions.fieldByName('WITEMOPTIONVALUE2ID').AsInteger);
          FldStream.FieldByName('SOPTION3NAME').AsString := TDataBaseStockRoutines.GetOptionNameFromItemValueID(QOptions.fieldByName('WITEMOPTIONVALUE3ID').AsInteger);
          FldStream.FieldByName('SOPTIONVALUE3NAME').AsString := TDataBaseStockRoutines.GetOptionItemValueName(QOptions.fieldByName('WITEMOPTIONVALUE3ID').AsInteger);
          FldStream.FieldByName('SOPTION4NAME').AsString := TDataBaseStockRoutines.GetOptionNameFromItemValueID(QOptions.fieldByName('WITEMOPTIONVALUE4ID').AsInteger);
          FldStream.FieldByName('SOPTIONVALUE4NAME').AsString := TDataBaseStockRoutines.GetOptionItemValueName(QOptions.fieldByName('WITEMOPTIONVALUE4ID').AsInteger);
          FldStream.FieldByName('SOPTION5NAME').AsString := TDataBaseStockRoutines.GetOptionNameFromItemValueID(QOptions.fieldByName('WITEMOPTIONVALUE5ID').AsInteger);
          FldStream.FieldByName('SOPTIONVALUE5NAME').AsString := TDataBaseStockRoutines.GetOptionItemValueName(QOptions.fieldByName('WITEMOPTIONVALUE5ID').AsInteger);

          FldStream.FieldByName('FQTY').AsFloat := QOptions.fieldByName('FQTY').Asfloat;
          FldStream.FieldByName('FPRICE').AsFloat :=  QOptions.fieldByName('FEXTRAPRICE').Asfloat;
          FldStream.Post;
          QOptions.Next;
        end;

        _SetProgress('',xc);
        dmDatabase.tblDocHeader.Next;
    end;
    if FileTyeID=4 then
      WriteDocTxfToFile(FStream,FlStream,FldStream,Headfile)
    else if FileTyeID=200 then
      WriteDocTxfToStr(FStream,FlStream,FldStream)
    else
    if FileTyeID=1 then
     begin
         AFileStream := TFileStream.Create(Headfile,fmCreate) ;
         try
         FStream.first ;
         LineToWrite := '1'  ;
         for i := 0 to FStream.FieldCount -1 do
            begin
               LineToWrite := LineToWrite + #9 + FStream.Fields[i].FieldName ;
            end  ;
            LineToWrite := LineToWrite + #13+ #10 ;
          AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;

         LineToWrite := '2'  ;
         for i := 0 to FlStream.FieldCount -1 do
            begin
               LineToWrite := LineToWrite + #9 + FlStream.Fields[i].FieldName ;
            end  ;
            LineToWrite := LineToWrite + #13+ #10 ;
          AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;

         LineToWrite := '3'  ;
         for i := 0 to FldStream.FieldCount -1 do
            begin
               LineToWrite := LineToWrite + #9 + FldStream.Fields[i].FieldName ;
            end  ;
            LineToWrite := LineToWrite + #13+ #10 ;
          AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;



         while not FStream.Eof do
            begin
            LineToWrite := '1'  ;
              for i := 0 to FStream.FieldCount -1 do
               begin
                 LineToWrite := LineToWrite + #9 + UTF8Encode(FStream.Fields[i].AsString) ;
              end  ;
              LineToWrite := LineToWrite + #13+ #10 ;
             AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;

              FlStream.Filtered := False;
              FlStream.Filter:='WDocID='+IntToStr(FStream.FieldByname('WDocID').AsInteger);
              FlStream.Filtered := True;
              FlStream.First ;
              while not FlStream.Eof do
                 begin
                   LineToWrite := '2'  ;
                   for i := 0 to FlStream.FieldCount -1 do
                      begin
                         case FlStream.Fields[i].DataType of
                             ftFloat,ftCurrency : LineToWrite := LineToWrite + #9 + FloatToStr(FlStream.Fields[i].AsFloat,AFormatSettings) ;
                             ftDateTime,ftTimeStamp,ftTime : LineToWrite := LineToWrite + #9 + DateTimeToStr(FlStream.Fields[i].AsFloat,AFormatSettings) ;
                             ftDate : LineToWrite := LineToWrite + #9 + DateToStr(FlStream.Fields[i].AsFloat,AFormatSettings) ;
                             else  LineToWrite := LineToWrite + #9 + UTF8Encode(FlStream.Fields[i].AsString) ;
                         end;

                      end  ;
                      LineToWrite := LineToWrite + #13+ #10 ;
                    AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;

                  FldStream.Filtered := False;
                  FldStream.Filter:='WDocID='+IntToStr(FStream.FieldByname('WDocID').AsInteger) +' and WDocLineID = ' + IntToStr(FlStream.FieldByname('WDocLineID').AsInteger);
                  FldStream.Filtered := True;
                  FldStream.First ;
                    while not FldStream.Eof do
                      begin
                       LineToWrite := '3'  ;
                       for i := 0 to FldStream.FieldCount -1 do
                          begin
                             case FldStream.Fields[i].DataType of
                             ftFloat,ftCurrency : LineToWrite := LineToWrite + #9 + FloatToStr(FldStream.Fields[i].AsFloat,AFormatSettings) ;
                             ftDateTime,ftTimeStamp,ftTime : LineToWrite := LineToWrite + #9 + DateTimeToStr(FldStream.Fields[i].AsFloat,AFormatSettings) ;
                             ftDate : LineToWrite := LineToWrite + #9 + DateToStr(FldStream.Fields[i].AsFloat,AFormatSettings) ;
                             else  LineToWrite := LineToWrite + #9 + UTF8Encode(FldStream.Fields[i].AsString) ;
                             end;
                          end  ;
                          LineToWrite := LineToWrite + #13+ #10 ;
                          AFileStream.Write(LineToWrite[1],length(LineToWrite)) ;
                          FldStream.next ;
                      end;
                   FlStream.next ;
                  end;

              FStream.next ;
            end;

           finally
             AFileStream.free ;
           end;


     end else
     begin
       SaveFileNow(Headfile,FStream,FileTyeID);
       SaveFileNow(Linesfile,FlStream,FileTyeID);
       SaveFileNow( ChangeFileExt(Linesfile,'d'  +ExtractFileExt(Linesfile)) ,FldStream,FileTyeID);
     end;
    dmDatabase.tblDocLine.Close;
    dmDatabase.tblStock.Close;
    dmDatabase.ZQStock.close ;
    dmDatabase.tblDocHeader.Close;
    dmdatabase.tblDocLine.Close;
    dmDatabase.tblAccount.Close;
    dmDatabase.tblGroups.Close;
    dmDatabase.tblUser.Close;
  except
    Result:=8;
  end;
  {Export User Info}
  FStream.Free;
  FlStream.Free;
  FldStream.Free;
  QOptions.Free;

  _SetProgress(-2);
  dmdatabase.tblDocLine.Filtered:=False;
  dmdatabase.tblDocLine.Filter:='';
end;


Function ImportXmlDocs(Headfile,Linesfile,Logfile:String):Integer;
VAr
  FStream:TClientDataSet;
  FlStream,FldStream:TClientDataSet;
begin
  Result:=100;
  Try
    FStream := TClientDataSet.Create(Application);
    FlStream := TClientDataSet.Create(Application);

    FldStream := TClientDataSet.Create(Application);

    Try
      FStream.FileName:=Headfile;
      FlStream.FileName:=Linesfile;
      FStream.LoadFromFile();
      FlStream.LoadFromFile();
      FldStream.FileName :=  ChangeFileExt(Linesfile,'d'  +ExtractFileExt(Linesfile));
      if FileExists(FldStream.FileName) then
      FldStream.LoadFromFile()
      else
      CreateDoclineDetail(FldStream);



      Result := ImportDocsFromCds(FStream,FlStream,FldStream,Logfile);
      FStream.Close;
      FlStream.Close;
    except
    end;
  Finally
    FStream.Free;
    FlStream.Free;
  end;
end;


Function ImportDocsFromCds(FStream,FlStream,fldStream:TClientDataset;Logfile:String):Integer;
Var
  AccID,Cnt,AUserID:Integer;
//  DocNbr:Array[10..15] of String;
  Ok : Boolean;
  aTrans : Integer;
  AProgress : TfmNewProgress ;
  ProcesssIndex,DetailIndex : Integer ;
  AdmCoreDocDate : TDMCoreDocData ;
  Procedure RemoveDocLines;

  begin
     dmdatabase.tblDocLine.Filtered:=False;
     dmdatabase.tblDocLine.Filter:='WDocID='''+ dmDatabase.tblDocHeader.FieldByNAme('WDocID').AsString+'''';
     dmdatabase.tblDocLine.Filtered:=True;
     dmDatabase.tblDocLine.First;
     While not dmdatabase.tblDocLine.Eof do
     begin
       Case dmDatabase.tblDocHeader.FieldByNAme('WTypeID').AsInteger of
       10,13:UpDateStock(dmdatabase.tblDocLineWStockID.AsInteger,dmdatabase.tblDocLineFQtyShipped.value,true);
       12:UpDateStock(dmdatabase.tblDocLineWStockID.AsInteger,dmdatabase.tblDocLineFQtyShipped.value,False);
       end;
       dmdatabase.tblDocLine.Delete;
     end;
     dmdatabase.tblDocLine.Filtered:=False;
     dmdatabase.tblDocLine.Filter:='';
  end;
begin
 AdmCoreDocDate := TDMCoreDocData.Create(nil) ;
 try
   if not TDataBaseRoutines.TableExist('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) then

  if assigned(OnImportClientDataset) then
     OnImportClientDataset(FStream,'DOCSHEAD');
  if assigned(OnImportClientDataset) then
     OnImportClientDataset(FlStream,'DOCLINES');

  if assigned(OnImportClientDataset) then
     OnImportClientDataset(fldStream,'DOCOPTIONLINES');

  MainCount:=0;
  Result := 0;
  ErrorLog:='';
  {Get T3 UserID}
//  dmDatabase.tblUser.Locate('SUserName',FStream.Fieldbyname('SUserName').AsString,[]);
//  UserID:=dmDatabase.tblUserWUserID.Value;
//  For Cnt:=10 to 15 do
//    DocNbr[Cnt]:='';
AProgress := TfmNewProgress.create(nil) ;
   try
   AProgress.initProgress(gettextlang(2076), FStream.RecordCount);
   ProcesssIndex := 1 ;

  try
    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead' ;
    dmDatabase.tblDocHeader.Open;
    dmDatabase.tblDocLine.SQL.Text := 'select * from docline ' ;
    dmdatabase.tblDocLine.Open;




    FStream.First;
    // Sylvain: Make Sure that the search will succed
    dmDatabase.tblDocHeader.Filtered:= False;
    dmDatabase.tblDocHeader.Filter:='';
    With dmDatabase.tblDocHeader do
    While not FStream.Eof do
    begin
      AProgress.SetProgress('',ProcesssIndex);
      inc(ProcesssIndex) ;

      {Posting Document closes some tables so we must reopen them here}
      dmDatabase.tblUser.Open;
      dmDatabase.tblAccount.Open;
      dmDatabase.tblGroups.Open;
      dmDatabase.tblStock.Open;
      AccID := GetAccountIdFromCodeAndType(FStream.fieldbyname('SACCOUNTCODE').AsString,FStream.fieldbyname('WAccountTypeID').asinteger);
      if AccID <= 0 then
      begin
        ErrorLog:=ErrorLog+'"*['+FStream.FieldByName('SDocNo').AsString+']['+FStream.fieldbyname('SACCOUNTCODE').AsString+']'+' Invalid Account Code ";';
        FStream.Next;
        Continue;
      end;
      dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where SDocNo=:SDocNo and WTypeID=:WTypeID' ;
      dmDatabase.tblDocHeader.Params[0].AsString := FStream.fieldbyname('SDocNo').AsString ;
      dmDatabase.tblDocHeader.Params[1].AsInteger := FStream.fieldbyname('WtypeID').AsInteger ;
      dmDatabase.tblDocHeader.open;


      if not IsEmpty then
        if fieldbyname('BPosted').AsInteger =1 then
        begin
          FStream.Next;
          Continue;
        end
        else
        begin
          Edit;
          {Remove Old Docline Records}
          RemoveDocLines;
        end
      else
        Append;
      {Hold Doc Type ID}
      Cnt:=Str2Int(FStream.fieldbyname('WtypeID').AsString);
//      FieldByName('WDocID').AsString           := FStream.FieldByName('WDocID').AsString ;
      fieldbyname('WtypeID').AsString          := FStream.fieldbyname('WtypeID').AsString;
      fieldbyname('DDate').AsString            := FStream.fieldbyname('DDate').AsString;
      fieldbyname('DAllocatedDate').AsString   := FStream.fieldbyname('DAllocatedDate').AsString ;
      fieldbyname('SDocNo').AsString           := FStream.fieldbyname('SDocNo').AsString ;
      fieldbyname('SReference').AsString       := FStream.fieldbyname('SReference').AsString ;
      fieldbyname('BPrinted').AsString         := FStream.fieldbyname('BPrinted').AsString ;
  //    fieldbyname('BPosted').AsString          := FStream.fieldbyname('BPosted').AsString  ;
      fieldbyname('BPosted').Asinteger          := 0;
      fieldbyname('BExclusive').AsString       := FStream.fieldbyname('BExclusive').AsString ;
      fieldbyname('FInvoiceDiscount').AsString := FStream.fieldbyname('FInvoiceDiscount').AsString;
      fieldbyname('FDocAmount').AsString       := FStream.fieldbyname('FDocAmount').AsString;
      fieldbyname('FTaxAmount').AsString       := FStream.fieldbyname('FTaxAmount').AsString;

      fieldbyname('WAccountID').AsInteger       := AccID;
//      fieldbyname('WAccountID').AsString       := FStream.fieldbyname('WAccountID').AsString;

      fieldbyname('WPaymentTypeID').AsString   := FStream.fieldbyname('WPaymentTypeID').AsString;
      fieldbyname('WPaymentGroupID').AsString  := FStream.fieldbyname('WPaymentGroupID').AsString;
      fieldbyname('BRepeating').AsString       := FStream.fieldbyname('BRepeating').AsString;
    {From Account}
  //    dmDatabase.tblAccount.Locate('WAccountID',FieldByName('WAccountID').AsString,[]);
  //    FStream.fieldbyname('SACCOUNTCODE').AsString :=  dmDatabase.tblAccount.fieldbyname('SACCOUNTCODE').AsString ;
  //    FStream.fieldbyname('WAccountTypeID').AsString := dmDatabase.tblAccount.fieldbyname('WAccountTypeID').AsString ;
    {From Messages}
      FieldByName('wPostal1ID').AsInteger    := AddMessage(FStream.FieldByName('SPost1').AsString);
      FieldByName('wPostal2ID').AsInteger    := AddMessage(FStream.FieldByName('SPost2').AsString);
      FieldByName('wPostal3ID').AsInteger    := AddMessage(FStream.FieldByName('SPost3').AsString);
      FieldByName('WPostalCodeID').AsInteger := AddMessage(FStream.FieldByName('SPostCode').AsString);
      FieldByName('WMessage1ID').AsInteger   := AddMessage(FStream.FieldByName('SMsg1').AsString);
      FieldByName('WMessage2ID').AsInteger   := AddMessage(FStream.FieldByName('SMsg2').AsString);
      FieldByName('WMessage3ID').AsInteger  := AddMessage(FStream.FieldByName('SMsg3').AsString);
      FieldByName('wDelAddress1ID').AsInteger   := AddMessage(FStream.FieldByName('SDel1').AsString);
      FieldByName('wDelAddress2ID').AsInteger   := AddMessage(FStream.FieldByName('SDel2').AsString);
      FieldByName('wDelAddress3ID').AsInteger   := AddMessage(FStream.FieldByName('SDel3').AsString);
      FieldByName('wDelCodeID').AsInteger       := AddMessage(FStream.FieldByName('SDelCode').AsString);
      FieldByName('WPOSCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SPostCountry').AsString) ;
      FieldByName('WDELCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SDelCountry').AsString) ;
      FieldByName('WPOSTALNAME').AsInteger       := AddMessage(FStream.FieldByName('SPostCompany').AsString);
      FieldByName('WPOSTALCONTACT').AsInteger       := AddMessage(FStream.FieldByName('SPostContact').AsString);
      FieldByName('WDELNAME').AsInteger       := AddMessage(FStream.FieldByName('SDelCompany').AsString);
      FieldByName('WDELCONTACT').AsInteger       := AddMessage(FStream.FieldByName('SDelContact').AsString);
      FieldByName('WTAXNUMBER').AsInteger       := AddMessage(FStream.FieldByName('STAXREF').AsString);
      if (FieldByName('WDELNAME').AsInteger  = 0) and
       (FieldByName('WDELCONTACT').AsInteger  = 0) and
       (FieldByName('wDelAddress1ID').AsInteger  = 0) and
       (FieldByName('wDelAddress3ID').AsInteger  = 0) and
       (FieldByName('wDelAddress2ID').AsInteger  = 0) and
       (FieldByName('wDelCodeID').AsInteger  = 0) and
        (FieldByName('WDELCOUNTRIES_ID').AsInteger  = 0) then
         begin
           FieldByName('WDELNAME').AsInteger :=  FieldByName('WPOSTALNAME').AsInteger ;
           FieldByName('WDELCONTACT').AsInteger :=  FieldByName('WPOSTALCONTACT').AsInteger ;
           FieldByName('wDelAddress1ID').AsInteger :=  FieldByName('wPostal1ID').AsInteger ;
           FieldByName('wDelAddress2ID').AsInteger :=  FieldByName('wPostal2ID').AsInteger ;
           FieldByName('wDelAddress3ID').AsInteger :=  FieldByName('wPostal3ID').AsInteger ;
           FieldByName('wDelCodeID').AsInteger :=  FieldByName('WPostalCodeID').AsInteger ;
           FieldByName('WDELCOUNTRIES_ID').AsInteger :=  FieldByName('WPOSCOUNTRIES_ID').AsInteger ;
         end;
      AUserID := GetT3UserID(FStream.FieldByName('SUserName').AsString);
      FieldByName('WUserID').AsInteger       :=  AUserID;
      FieldByName('WSalesManID').Value :=  TDataBaseRoutines.GetAddGroupNesteled(FStream.FieldByName('SSalesperson').AsString,31);
      FieldByName('WReportingGroup1ID').Value := TDataBaseRoutines.GetAddGroupNesteled(FStream.FieldByName('sGroup1').AsString,28);
      FieldByName('WReportingGroup2ID').Value := TDataBaseRoutines.GetAddGroupNesteled(FStream.FieldByName('sGroup2').AsString,29);
      FieldByName('WCurrencyID').AsString :=  '';
      FieldByName('DSysDate').AsDateTime       := FStream.FieldByName('DsysDate').AsDateTime;
      Post;
      //if
      if AUserID <> 0 then
        CheckupDocNumber(AUserID,Cnt,_IncrementString(fieldbyname('SDocNo').AsString));
      {Import Lines}
      FlStream.Filtered:=False;
      FlStream.Filter:='WDocID='''+FStream.FieldbyName('WDocID').AsString+'''';
      FlStream.Filtered:=True;
      Ok := True;

      AProgress.InitSubProgress('Details',FlStream.RecordCount);
      While not FlStream.Eof do
      begin
        AProgress.SetSubProgress(DetailIndex);

        dmdatabase.tblDocLine.Append;
        dmDatabase.tblDocLineWDocID.AsString := FieldByName('WDocID').AsString ;
        dmDatabase.tblDocLineWLineTypeID.AsString := FlStream.FieldByName('WLineTypeID').AsString;
        dmDatabase.tblDocLineWDocLineID.AsString :=  FlStream.FieldByName('WDocLineID').AsString;
        dmDatabase.tblDocLineWSORTNO.AsInteger := FlStream.FieldByName('WSortno').AsInteger ;
        dmDatabase.tblDocLineFQtyOrdered.AsString:= FlStream.FieldByName('FQtyOrdered').AsString ;
        dmDatabase.tblDocLineFQtyShipped.AsString := FlStream.FieldByName('FQtyShipped').AsString ;
        dmDatabase.tblDocLineFSellingPrice.AsString := FlStream.FieldByName('FSellingPrice').AsString ;
        dmDatabase.tblDocLineFItemDiscount.AsString := FlStream.FieldByName('FItemDiscount').AsString ;
        dmDatabase.tblDocLineWTaxID.AsString := FlStream.FieldByName('WTaxID').AsString;
        dmDatabase.tblDocLineFInclusiveAmt.AsString := FlStream.FieldByName('FInclusiveAmt').AsString ;
        dmDatabase.tblDocLineFExclusiveAmt.AsString := FlStream.FieldByName('FExclusiveAmt').AsString ;
        dmDatabase.tblDocLineFTaxAmount.AsString := FlStream.FieldByName('FTaxAmount').AsString ;
        dmDatabase.tblDocLineWDescriptionID.value    := AddMessage(FlStream.FieldByName('SDescription').AsString);
        {From Stock}
        dmDatabase.tblDocLine.fieldbyname('WStockID').AsString :='';
        if FlStream.FieldByName('WLineTypeID').AsInteger in [90,94] then
        begin
            dmDatabase.ZQStock.sql.Text := DMTCCoreLink.GetSqlByName('database_selectstockoncode');
            dmDatabase.ZQStock.ParamByName('SStockCode').AsString := FlStream.FieldByName('SSTOCKCODE').AsString;
            dmDatabase.ZQStock.open ;
            if not dmDatabase.ZQStock.IsEmpty then
          begin
            dmDatabase.tblDocLine.fieldbyname('WStockID').AsString := dmDatabase.ZQStock.FieldbyName('WStockID').AsString;
            Case FStream.fieldbyname('WtypeID').AsInteger of
            10,13:UpDateStock(FlStream.FieldByName('WStockID').AsInteger,FlStream.FieldByName('FQtyShipped').AsFLoat,False);
            12:UpDateStock(FlStream.FieldByName('WStockID').AsInteger,FlStream.FieldByName('FQtyShipped').AsFLoat,True);
            end;
          end
          else
          begin
            {Stock dosenot exist}
            ErrorLog:=ErrorLog+'"['+dmDatabase.tblDocHeaderSDocNo.AsString+']['+ FlStream.FieldByName('SSTOCKCODE').AsString+ '] Invalid Stock item Code ";';
            FlStream.Last;
            Ok:=False;
          end;
        end
        else
        begin
          dmDatabase.tblStock.First;
          dmDatabase.tblDocLine.fieldbyname('WStockID').AsString := dmDatabase.tblStock.FieldbyName('WStockID').AsString
        end;
        dmDatabase.tblDocLine.Post;
        FlStream.Next;
      end;
      // import line detail

      fldStream.Filtered:=False;
      fldStream.Filter:='WDocID=' + FStream.FieldbyName('WDocID').AsString;
      fldStream.Filtered:=True;
      AdmCoreDocDate.ZQDoclineOptions.Open ;
      while not fldStream.eof do
         begin
           AdmCoreDocDate.ZQDoclineOptions.Append ;
           AdmCoreDocDate.ZQDoclineOptionsWDOCID.AsInteger :=  FieldByName('WDocID').AsInteger ;
           AdmCoreDocDate.ZQDoclineOptionsWLINEID.AsInteger :=  fldStream.FieldbyName('WDocLINEID').AsInteger;

           AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsInteger := TDataBaseStockRoutines.GetAddOptionItemValueID(fldStream.FieldbyName('SOPTION1NAME').AsString,fldStream.FieldbyName('SOPTIONVALUE1NAME').AsString) ;
           if AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE1ID.AsInteger = 0 then
             AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE1ID.Clear ;

           AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsInteger := TDataBaseStockRoutines.GetAddOptionItemValueID(fldStream.FieldbyName('SOPTION2NAME').AsString,fldStream.FieldbyName('SOPTIONVALUE2NAME').AsString) ;
           if AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE2ID.AsInteger = 0 then
             AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE2ID.Clear ;

           AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsInteger := TDataBaseStockRoutines.GetAddOptionItemValueID(fldStream.FieldbyName('SOPTION3NAME').AsString,fldStream.FieldbyName('SOPTIONVALUE3NAME').AsString) ;
           if AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE3ID.AsInteger = 0 then
             AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE3ID.Clear ;

           AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsInteger := TDataBaseStockRoutines.GetAddOptionItemValueID(fldStream.FieldbyName('SOPTION4NAME').AsString,fldStream.FieldbyName('SOPTIONVALUE4NAME').AsString) ;
           if AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE4ID.AsInteger = 0 then
             AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE4ID.Clear ;

           AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsInteger := TDataBaseStockRoutines.GetAddOptionItemValueID(fldStream.FieldbyName('SOPTION5NAME').AsString,fldStream.FieldbyName('SOPTIONVALUE5NAME').AsString) ;
           if AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE5ID.AsInteger = 0 then
             AdmCoreDocDate.ZQDoclineOptionsWITEMOPTIONVALUE5ID.Clear ;

           AdmCoreDocDate.ZQDoclineOptionsFQTY.AsFloat := fldStream.FieldbyName('FQTY').AsFloat ;
           AdmCoreDocDate.ZQDoclineOptionsFEXTRAPRICE.AsFloat := fldStream.FieldbyName('FPRICE').AsFloat ;
           AdmCoreDocDate.ZQDoclineOptions.Post ;
           fldStream.next ;
         end;

      // cleanup do
      TDataBaseDocumentRoutines.CleanupDochead(dmDatabase.tblDocHeaderWDocId.AsInteger);

      {If error, Remove All lines}
       if Not Ok then
       begin
         ErrorLog:=ErrorLog+'"*['+dmDatabase.tblDocHeaderSDocNo.AsString+'] not imported ";';
         RemoveDocLines;
         dmDatabase.tblDocHeader.Delete;
       end
       else
       begin
         {If Posted on client then Post it Here}
         if FStream.fieldbyname('BPosted').AsInteger =1 then
         begin
           ConvertDocumentToBatch(aTrans,dmDatabase.tblDocHeaderWDocId.asinteger,True);
           {Sylvain This Casue the DocLine to close
           so Reopen it now }
           dmDatabase.tblDocLine.SQL.Text := 'select * from docline' ;
           dmDatabase.tblDocLine.Open;
         end;
         Inc(MainCount);
       end;
      _SetProgress('',FStream.RecNo);
      FStream.Next;
    end;
    dmDatabase.tblDocLine.Close;
    dmDatabase.tblStock.Close;
    dmDatabase.ZQStock.Close;
    dmDatabase.tblDocHeader.Close;
    dmdatabase.tblDocLine.Close;
    dmDatabase.tblAccount.Close;
    dmDatabase.tblGroups.Close;
    dmDatabase.tblUser.Close;
  {Import User Info}
  except
    Result:=8;
  end;
  finally
    AProgress.free ;
  end;
  _SetProgress(-2);
  finally
    AdmCoreDocDate.Free ;
  end;
end;

Function AddDocExchange(aDate:TDate):Integer;
begin
(*
//  if Not T3IsRegistered Then Exit;
  {$I-}
  if Not DirectoryExists(ApplicationPath+'TcDataExch') then
    MkDir(ApplicationPath+'TcDataExch');
  ChDir(ApplicationPath+'TcDataExch');
  if Not DirectoryExists(OpenSetName) then
    MkDir(OpenSetName);
  {$I+}
  Logfile:=IncludeTrailingPathDelimiter(ApplicationPath+'TcDataExch\'+OpenSetName);
  Headfile  := Logfile + 'tcExHead.xml';
  Linesfile := Logfile + 'tcExLines.xml';
  Logfile   := Logfile + 'tcExDocLog.xml';
//  Result := ExportXmlDoc(aDate,Headfile,Linesfile,Logfile,True);
*)
end;

Function LoadDocExchange:Integer;
begin
(*
//  if Not T3IsRegistered Then Exit;
  Result := 3;
  ChDir(ApplicationPath+'TcDataExch');
  if Not DirectoryExists(OpenSetName) then
    exit;
  Logfile:=IncludeTrailingPathDelimiter(ApplicationPath+'TcDataExch\'+OpenSetName);
  Headfile  := Logfile + 'tcExHead.xml';
  Linesfile := Logfile + 'tcExLines.xml';
  Logfile   := Logfile + 'tcExDocLog.xml';
  Result := ImportXmlDocs(Headfile,Linesfile,Logfile);
*)
end;




Function  TcExportXmlAccts(AcFrom,acTo:String;afile,Logfile:String;BAppend:Boolean;aType:Integer=0):Integer;
var
  FStream:TClientDataSet;
begin
  Result := 0;
  try
    FStream := TClientDataSet.Create(Application);
    FStream.FileName := afile;
    If BAppend AND fileExists(afile) then
    begin
      FStream.Open;

    end
    else
    begin
      {Create Account Data set}
      CreateXmlFilesDef(FStream,0);
    end;
    {Open Tables}
    dmDatabase.tblAccount.Open;
    dmDatabase.tbltax.Open;
    dmDatabase.tblBank.Open;
    dmDatabase.tblBatchTypes.Open;
    dmDatabase.tblAccount.Filtered := False;
    if atype=1 then
      dmDatabase.tblAccount.Filter:='SACCOUNTCODE>='''+acFrom+''' AND SACCOUNTCODE<='''+acTo+''' '+
       ' AND WAccountTypeID=1'
    else if atype=2 then
      dmDatabase.tblAccount.Filter:='SACCOUNTCODE>='''+acFrom+''' AND SACCOUNTCODE<='''+acTo+''' '+
       ' AND WAccountTypeID=2'
    else
    dmDatabase.tblAccount.Filter:='SACCOUNTCODE>='''+acFrom+''' AND SACCOUNTCODE<='''+acTo+''' '+
       ' AND WAccountTypeID<>1 AND WAccountTypeID<>2 ';
    dmDatabase.tblAccount.Filtered := True;
    dmDatabase.tblGroups.Open;
    {}
    _SetProgress(gettextlang(2075),0);
    _SetProgress(dmDatabase.tblAccount.RecordCount);
    dmDatabase.tblAccount.First;
    With dmDatabase.tblAccount do
      While not Eof do
      begin
         FStream.Append;
         FStream.FieldByName('WAccountTypeID').AsString := FieldByName('WAccountTypeID').AsString;
         FStream.FieldByName('SACCOUNTCODE').AsString := AccType2Char(FieldByName('WAccountTypeID').AsInteger) + FieldByName('SACCOUNTCODE').AsString;
         FStream.FieldByName('SDescription').AsString := FieldByName('SDescription').AsString;
         FStream.FieldByName('BincomeExpense').AsString := FieldByName('BincomeExpense').AsString;
         FStream.FieldByName('BSubAccounts').AsString := FieldByName('BSubAccounts').AsString;
         if FieldByName('WReportingGroup1ID').AsInteger<=0 then
            FStream.FieldByName('SGroup1').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup1ID').AsInteger,[]) then
           FStream.FieldByName('SGroup1').AsString := dmDatabase.tblGroupsSDescription.AsString;
         if FieldByName('WReportingGroup2ID').AsInteger<=0 then
            FStream.FieldByName('SGroup2').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup2ID').AsInteger,[]) then
           FStream.FieldByName('SGroup2').AsString := dmDatabase.tblGroupsSDescription.AsString;
         FStream.FieldByName('DStartDate').AsString :='';;
         FStream.FieldByName('DEndDate').AsString :='';
         FStream.FieldByName('FRate').AsString :='';
         FStream.FieldByName('SReceipt').AsString :='';
         FStream.FieldByName('SPayment').AsString :='';
         FStream.FieldByName('SCurrency').AsString :='';
         if FieldByName('WAccountTypeID').AsInteger = 4 then
         if dmDatabase.tblTax.locate('WAccountID',FieldByName('WAccountID').AsString,[]) then
         Begin
            FStream.FieldByName('DStartDate').AsString :=dmDatabase.tblTax.FieldByName('DStartDate').AsString;
            FStream.FieldByName('DEndDate').AsString :=dmDatabase.tblTax.FieldByName('DEndDate').AsString;
            FStream.FieldByName('FRate').AsString :=dmDatabase.tblTax.FieldByName('FRate').AsString;
         end;
         if FieldByName('WAccountTypeID').AsInteger = 3 then
         if dmDatabase.tblBank.locate('WAccountID',FieldByName('WAccountID').AsString,[]) then
         Begin
           if dmDatabase.tblBatchTypes.Locate('WBatchTYpeID',dmDatabase.tblBank.FieldByName('WReceiptsID').AsString,[]) then
             FStream.FieldByName('SReceipt').AsString := dmDatabase.tblBatchTypesSDescription.ASString;
           if dmDatabase.tblBatchTypes.Locate('WBatchTypeID',dmDatabase.tblBank.FieldByName('WPaymentsID').AsString,[]) then
             FStream.FieldByName('SPayment').AsString := dmDatabase.tblBatchTypesSDescription.ASString;
           FStream.FieldByName('SCurrency').AsString :='';
         end;
         FStream.Post;
        _SetProgress('',RecNo);
        Next;
    end;
    _SetProgress(-2);
    FStream.Close;
    dmDatabase.tblAccount.Close;
    dmDatabase.tblGroups.Close;
    dmDatabase.tbltax.Close;
    dmDatabase.tblBank.Close;
  Except

  end;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
end;

Function  ExportBact2Txf(ABatchCon:TBatchCon;aFileName:String):Boolean;
var
  S:String;
  tmpData:String;
  i:Integer;
  aStream:TFileStream;
begin
  Result := False;
  tmpData := '';

  aFileName := ChangeFileExt(aFileName,'.txf');
  try
    {The batch file mus be the current opened}
    _SetProgress(gettextlang(2075),0);
    _SetProgress(2);
    {Add BatchType Record}
    tmpData :='<BatconRec'
      + ' SName="'+ABatchCon.SName+'"' + #13
      + ' SBatchNumber="'+ABatchCon.SBatchNumber+'"' + #13
      + ' SAlias="'+ABatchCon.SAlias+'"' + #13
      + ' SUniqueID="'+ABatchCon.SUniqueID+'"' + #13
      + ' SFilename="'+ABatchCon.SFilename+'"' + #13
      + ' WBatchID="'+intToStr(ABatchCon.WBatchID)+'"' + #13
      + ' WUserID="'+intToStr(ABatchCon.WUserID)+'"' + #13
      + ' WBatchTypeID="'+intToStr(ABatchCon.WBatchTypeID)+'"' + #13
      + ' WInitBatID="'+intToStr(ABatchCon.WInitBatID)+'"' + #13
      + ' WDocID="'+intToStr(ABatchCon.WDocID)+'"' + #13
      + ' WLineCount="'+intToStr(ABatchCon.WLineCount)+'"' + #13
      + ' BPosted="'+IntToStr(ord(ABatchCon.BPosted))+'"' + #13
      + ' BImported="'+Bool2Str(ABatchCon.BImported)+'"' + #13
      + ' BDocSource="'+Bool2Str(ABatchCon.BDocSource)+'"' + #13
      + ' DSysDate="'+DateTime2TxfStr(ABatchCon.DSysDate)+'"' + #13
      + '/>' + #13;
    Try
       S := 'Select * from ' + dmDatabase.tblBatch.TableName;
       S := SQLToXML(s);
       {Remove the xml Tag}
       if Pos('?xml',S)<>0 then
       begin
         i := Pos('>',S);
         delete(s,1,i);
       end;
       AddTag(tmpData,'OpenBatData',Trim(s));
       tmpData := '<OpenBatches>'+tmpData+'</OpenBatches>';
      _SetProgress(-2);
      tmpData:= TxfSign +'<txf>'+ tmpData + '</txf>'+'</TCASH3>';
      Result := True;
    Except

    end;
  finally
    if Result and (tmpData<>'') then
    begin
      aStream := TFileStream.Create(aFileName,fmCreate);
      aStream.Write(tmpData[1],length(tmpData));
      aStream.Free;
    end;
  end;
end;


Function SaveAccToTxfStream (acFrom,acTo:String;sHead,sLog:String;aStream:TStream;aType:Integer):Integer;
Var
  AccLst,AccCode:String;
  iRecNo,RecNo:Integer;
begin
  AccLst:='';
  with dmDatabase do
  begin
    tblAccount.Open;


    tblDebtor.Open;
    tbltax.Open;
    tblBank.Open;
    tblcreditor.Open;
    tblAccount.First;
    iRecNo :=0;
    RecNo := tblAccount.RecordCount;
    _SetProgress(RecNo);
    _SetProgress(gettextlang(2074),0);
    try
      while Not tblAccount.Eof do
      begin
        inc(iRecNo);
        _SetProgress('',iRecNo);
        AddAccountToTxf(tblAccountWAccountID.AsInteger,AccLst,AccCode,True);
        tblAccount.Next;
      end;
    finally
      _SetProgress(-10);
      tblAccount.Close;
      tblDebtor.Close;
      tbltax.Close;
      tblBank.Close;
      tblcreditor.Close;
    end;
  end;
  AccLst:= TxfSign + eline +'<txf>'+'<acclist>'+AccLst+'</acclist>'
       + eline+ '</txf>'+'</TCASH3>';
  aStream.Write(AccLst[1],length(AccLst));
end;

Function SaveAccToTxf(acFrom,acTo:String;afile,Logfile:String;aType:Integer):Integer;
Var
  aStream:TFileStream;
begin
  aFile := ChangeFileExt(aFile,'.txf');
  aStream := TFileStream.Create(aFile,fmCreate);
  Try
    Result := SaveAccToTxfStream(acFrom,acTo,afile,Logfile,aStream,aType);
  Finally
    FreeAndNil(aStream);
  end;
end;

Function  ExportXmlAccts(acFrom,acTo:String;afile,Logfile:String;AfileType:Integer;aType:Integer):Integer;


begin
  if AfileType=4 then
     Result := SaveAccToTxf (acFrom,acTo,afile,Logfile,aType)
  else
  begin
    Case aType of
    1: Result := ExportDebtors(sFromID,sToID,afile,Logfile,AfileType);
    2: Result := ExportCreditors(sFromID,sToID,afile,Logfile,AfileType)
    else
      TcExportXmlAccts(acFrom,acTo,afile,Logfile,False,aType);
      Case AfileType of
        2 : Result := SaveFileToWkx(afile,Logfile);
//        1 : Result := SaveFileToCsv(afile,Logfile);
//        3 : Result := SaveFileToXls(afile,Logfile);
        else
          Result := SaveFileToSpreadSheet(afile,GetDestFileByType(afile,aType),Logfile);
      end;
    end;
  end;
end;

{Export Stocks}

Function  ExportXmlStocks(AcFrom,acTo:String;afile,Logfile:String;BAppend:Boolean;CustomDataSet : TDataSet):Integer;
var
  FStream:TClientDataSet;
  Level : Integer ;
  SourceDataSet : TDataSet ;
  AProgress : TfmNewProgress ;
  aQuery : TuniQuery ;
  OptStr,OptName : String ;
    AStream : TStringstream ;
begin
    aQuery := TuniQuery.create(nil) ;
    try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    aQuery.SQL.Text := 'SELECT  a.WITEMOPTIONVALUE1ID, a.WITEMOPTIONVALUE2ID, a.WITEMOPTIONVALUE3ID, a.WITEMOPTIONVALUE4ID, a.WITEMOPTIONVALUE5ID,'+
    ' a.FEXTRAPRICE,a.FEXTRAPRICE2,a.FEXTRAPRICE3, a.FQTYONHAND, a.SBARCODE, a.SREFERENCE, a.FUNITCOST, a.FREORDERQTY, a.FREORDERQTYTRIG, a.FUNITAVECOST '+
     ' FROM STOCKOPTIONS a where a.WSTOCKID =:Wstockid' ;
    FStream := TClientDataSet.Create(Application);
    FStream.FileName := afile;
    If BAppend AND fileExists(afile) then
    begin
      FStream.Open;
    end
    else
    begin
      {Create Stock Data set}
      CreateXmlFilesDef(FStream,1);
    end;
    {Open Tables}
    if CustomDataSet = nil then
    begin
    dmDatabase.tblStock.Open;
    SourceDataSet := dmDatabase.tblStock ;
    end else
     SourceDataSet := CustomDataSet ;

     dmDatabase.ZQGroups.Close ;
     dmDatabase.ZQGroups.SQL.Text := 'Select * from groups where WGroupTypeid = 1004' ;
     dmDatabase.ZQGroups.open ;

    AProgress := TfmNewProgress.Create(nil) ;
    try
    SourceDataSet.DisableControls ;
    try
    SourceDataSet.last ;
    AProgress.initProgress('Exporting Stock Items',SourceDataSet.RecordCount);
    AProgress.BtnStop.Visible := true ;
    SourceDataSet.First;
    With SourceDataSet do
      While not Eof do
      begin
         
         FStream.Append;
         FStream.FieldByName('SSTOCKCODE').AsString := FieldByName('SSTOCKCODE').AsString;
         FStream.FieldByName('SDescription').AsString := FieldByName('SDescription').AsString;
         FStream.FieldByName('SBarCodeNumber').AsString := FieldByName('SBarCodeNumber').AsString;
         FStream.FieldByName('Smanufacturer').AsString := FieldByName('Smanufacturer').AsString;

         FStream.FieldByName('WStockTypeID').AsString := FieldByName('WStockTypeID').AsString;
         FStream.FieldByName('BDisabled').AsInteger := FieldByName('BDisabled').AsInteger;
         FStream.FieldByName('FSellingPrice1').AsString := FieldByName('FSellingPrice1').AsString;
         FStream.FieldByName('FSellingPrice2').AsString := FieldByName('FSellingPrice2').AsString;
         FStream.FieldByName('FSellingPrice3').AsString := FieldByName('FSellingPrice3').AsString;
         FStream.fieldbyname('FQtyOnhand').AsString := FieldByName('FQtyOnhand').AsString;
         FStream.fieldbyname('FREORDERQTYTRIG').AsString := FieldByName('FREORDERQTYTRIG').AsString;
         FStream.fieldbyname('FMINIMUMQTY').AsString := FieldByName('FMINIMUMQTY').AsString;
         FStream.fieldbyname('FReorderQty').AsString := FieldByName('FReorderQty').AsString;
         FStream.fieldbyname('BApplyInvoiceDiscount').AsString := FieldByName('BApplyInvoiceDiscount').AsString;
         FStream.fieldbyname('FUnitAveCost').AsString := FieldByName('FUnitAveCost').AsString;
         FStream.fieldbyname('FUnitCost').AsString := FieldByName('FUnitCost').AsString;
         FStream.fieldbyname('FNETTOWEIGHT').AsString := FieldByName('FNETTOWEIGHT').AsString;
         FStream.fieldbyname('FGROSSWEIGHT').AsString := FieldByName('FGROSSWEIGHT').AsString;
         FStream.fieldbyname('SEXTRADESC').AsString := FieldByName('SEXTRADESC').AsString;
         FStream.FieldByName('SEXTERNALID').AsString := FieldByName('SEXTERNALID').AsString;
         FStream.FieldByName('SSTOCKCODESUP1').AsString := FieldByName('SSTOCKCODESUP1').AsString;
         FStream.FieldByName('SSTOCKCODESUP2').AsString := FieldByName('SSTOCKCODESUP2').AsString;
         level := 0 ;
         if FieldByName('WReportingGroup1ID').AsInteger<=0 then
            FStream.FieldByName('SGroup1').AsString := ''
         else
           FStream.FieldByName('SGroup1').AsString := GetNesteldNameFromGroupID(FieldByName('WReportingGroup1ID').AsInteger,level);

         if FieldByName('WReportingGroup2ID').AsInteger<=0 then
            FStream.FieldByName('SGroup2').AsString := ''
         else
           FStream.FieldByName('SGroup2').AsString := GetNesteldNameFromGroupID(FieldByName('WReportingGroup2ID').AsInteger,level);

         FStream.fieldbyname('SCostAccount').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WCostAccountID').AsInteger) ;

         FStream.fieldbyname('SSaleSACCOUNT').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSaleSACCOUNTID').AsInteger) ;
         FStream.fieldbyname('SStockAccount').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WStockAccountID').AsInteger) ;
         FStream.fieldbyname('SInputTax').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WInputTaxID').AsInteger) ;
         FStream.fieldbyname('SOutputTax').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WOutputTaxID').AsInteger) ;
         FStream.fieldbyname('SSupplier1').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSUPPLIER1ID').AsInteger) ;
         FStream.fieldbyname('SSupplier2').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSUPPLIER2ID').AsInteger) ;
         FStream.fieldbyname('SUnit').AsString := TDataBaseStockRoutines.GetUnitDesc(FieldByName('WUnitID').AsInteger);

        dmDatabase.ZQStockDesc.Close ;
        dmDatabase.ZQStockDesc.params[0].AsInteger := FieldByName('WSTOCKID').AsInteger ;
        dmDatabase.ZQStockDesc.open ;
        dmDatabase.ZQGroups.first ;
        while not dmDatabase.ZQGroups.Eof do
          begin
              if dmDatabase.ZQStockDesc.Locate('WLANGUAGEID',dmDatabase.ZQGroupsWGROUPID.AsInteger,[]) then
                begin
                  FStream.fieldbyname('DESCLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).Value := dmDatabase.ZQStockDescSDESCRIPTION.Value ;
                  AStream := TStringstream.Create('') ;
                  try
                  dmDatabase.ZQStockDescSEXTRADESCRIPTION.SaveToStream(AStream);
                  FStream.fieldbyname('MEMOLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).Value := TDataBaseStringRoutines.StripEnterLinefeed(AStream.DataString) ;
                  finally
                   AStream.Free ;
                  end;

                end;
              dmDatabase.ZQGroups.next ;
          end;
         FStream.Post;
         // optionsType
         if FieldByName('WStockTypeID').AsInteger = 7 then
            begin
               aQuery.close ;
               aQuery.Params[0].AsInteger :=  FieldByName('WSTOCKID').AsInteger ;
               aQuery.Open ;
               while not aQuery.Eof do
                  begin






                   FStream.Append;
                   FStream.FieldByName('SSTOCKCODE').AsString := FieldByName('SSTOCKCODE').AsString;
                   FStream.FieldByName('SDescription').AsString := FieldByName('SDescription').AsString;
                   FStream.FieldByName('SBarCodeNumber').AsString := aQuery.FieldByName('SBARCODE').AsString;
                   FStream.FieldByName('Smanufacturer').AsString := FieldByName('Smanufacturer').AsString;
                   FStream.FieldByName('WStockTypeID').AsString := FieldByName('WStockTypeID').AsString;
                   FStream.FieldByName('BDisabled').AsInteger := FieldByName('BDisabled').AsInteger;
                   FStream.FieldByName('FSellingPrice1').AsString := aQuery.FieldByName('FEXTRAPRICE').AsString   ;
                   FStream.FieldByName('FSellingPrice2').AsString := aQuery.FieldByName('FEXTRAPRICE2').AsString;
                   FStream.FieldByName('FSellingPrice3').AsString := aQuery.FieldByName('FEXTRAPRICE3').AsString;
                   FStream.fieldbyname('FQtyOnhand').AsString := aQuery.FieldByName('FQtyOnhand').AsString;
                   FStream.fieldbyname('FREORDERQTYTRIG').AsString := aQuery.FieldByName('FREORDERQTYTRIG').AsString;
                   FStream.fieldbyname('FMINIMUMQTY').AsString := FieldByName('FMINIMUMQTY').AsString;
                   FStream.fieldbyname('FReorderQty').AsString := aQuery.FieldByName('FReorderQty').AsString;
                   FStream.fieldbyname('BApplyInvoiceDiscount').AsString := FieldByName('BApplyInvoiceDiscount').AsString;
                   FStream.fieldbyname('FUnitAveCost').AsString := aQuery.FieldByName('FUnitAveCost').AsString;
                   FStream.fieldbyname('FUnitCost').AsString := aQuery.FieldByName('FUnitCost').AsString;
                   FStream.fieldbyname('FNETTOWEIGHT').AsString := FieldByName('FNETTOWEIGHT').AsString;
                   FStream.fieldbyname('FGROSSWEIGHT').AsString := FieldByName('FGROSSWEIGHT').AsString;
                   FStream.fieldbyname('SEXTRADESC').AsString := FieldByName('SEXTRADESC').AsString;
                   FStream.FieldByName('SEXTERNALID').AsString := FieldByName('SEXTERNALID').AsString;
                   FStream.FieldByName('SSTOCKCODESUP1').AsString := FieldByName('SSTOCKCODESUP1').AsString;
                   FStream.FieldByName('SSTOCKCODESUP2').AsString := FieldByName('SSTOCKCODESUP2').AsString;
                   level := 0 ;
                   if FieldByName('WReportingGroup1ID').AsInteger<=0 then
                      FStream.FieldByName('SGroup1').AsString := ''
                   else
                     FStream.FieldByName('SGroup1').AsString := GetNesteldNameFromGroupID(FieldByName('WReportingGroup1ID').AsInteger,level);

                   if FieldByName('WReportingGroup2ID').AsInteger<=0 then
                      FStream.FieldByName('SGroup2').AsString := ''
                   else
                     FStream.FieldByName('SGroup2').AsString := GetNesteldNameFromGroupID(FieldByName('WReportingGroup2ID').AsInteger,level);

                   FStream.fieldbyname('SCostAccount').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WCostAccountID').AsInteger) ;
                   FStream.fieldbyname('SSaleSACCOUNT').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSaleSACCOUNTID').AsInteger) ;
                   FStream.fieldbyname('SStockAccount').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WStockAccountID').AsInteger) ;
                   FStream.fieldbyname('SInputTax').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WInputTaxID').AsInteger) ;
                   FStream.fieldbyname('SOutputTax').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WOutputTaxID').AsInteger) ;
                   FStream.fieldbyname('SSupplier1').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSUPPLIER1ID').AsInteger) ;
                   FStream.fieldbyname('SSupplier2').AsString := GetAccountCodeWithTypePrefixFromAccountId(FieldByName('WSUPPLIER2ID').AsInteger) ;
                   FStream.fieldbyname('SUnit').AsString := TDataBaseStockRoutines.GetUnitDesc(FieldByName('WUnitID').AsInteger);
                   OptStr := TDataBaseStockRoutines.GetOptionItemValueName(aQuery.FieldByName('WITEMOPTIONVALUE1ID').AsInteger) ;
                   OptName := TDataBaseStockRoutines.GetOptionNameFromItemValueID(aQuery.FieldByName('WITEMOPTIONVALUE1ID').AsInteger) ;
                   FStream.fieldbyname('OPTION').AsString := OptName +'=' + OptStr ;
                   OptStr := TDataBaseStockRoutines.GetOptionItemValueName(aQuery.FieldByName('WITEMOPTIONVALUE2ID').AsInteger) ;
                   OptName := TDataBaseStockRoutines.GetOptionNameFromItemValueID(aQuery.FieldByName('WITEMOPTIONVALUE2ID').AsInteger) ;
                   if OptStr <> '' then
                   begin
                   FStream.fieldbyname('OPTION').AsString :=  FStream.fieldbyname('OPTION').AsString + '@' + OptName +'=' +OptStr ;
                   OptStr := TDataBaseStockRoutines.GetOptionItemValueName(aQuery.FieldByName('WITEMOPTIONVALUE3ID').AsInteger) ;
                   OptName := TDataBaseStockRoutines.GetOptionNameFromItemValueID(aQuery.FieldByName('WITEMOPTIONVALUE3ID').AsInteger) ;
                    if OptStr <> '' then
                       begin
                          FStream.fieldbyname('OPTION').AsString :=  FStream.fieldbyname('OPTION').AsString + '@' + OptName +'=' +OptStr ;

                          OptStr := TDataBaseStockRoutines.GetOptionItemValueName(aQuery.FieldByName('WITEMOPTIONVALUE4ID').AsInteger) ;
                          OptName := TDataBaseStockRoutines.GetOptionNameFromItemValueID(aQuery.FieldByName('WITEMOPTIONVALUE4ID').AsInteger) ;
                          if OptStr <> '' then
                          FStream.fieldbyname('OPTION').AsString :=  FStream.fieldbyname('OPTION').AsString + '@' + OptName +'=' +OptStr ;

                          OptStr := TDataBaseStockRoutines.GetOptionItemValueName(aQuery.FieldByName('WITEMOPTIONVALUE5ID').AsInteger) ;
                          OptName := TDataBaseStockRoutines.GetOptionNameFromItemValueID(aQuery.FieldByName('WITEMOPTIONVALUE5ID').AsInteger) ;
                          if OptStr <> '' then
                          FStream.fieldbyname('OPTION').AsString :=  FStream.fieldbyname('OPTION').AsString + '@' + OptName +'=' +OptStr ;

                       end;
                   end;



                   aQuery.next ;
                   FStream.Post;

                  end;
            end;

         AProgress.SetProgress('',RecNo);
         if AProgress.bStop then
            raise Exception.Create('User stop!');
         Application.ProcessMessages ;   
        next
    end;
    finally
      SourceDataSet.EnableControls ;
    end;
    finally
      AProgress.free ;
    end;

    if CustomDataSet = nil then
     begin
       dmDatabase.tblStock.Close ; ;
     end;
    FStream.Close;
  finally
    aQuery.Free ;
  end;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
end;

Function  ImportTextStock(afile,Logfile:String;ASeperator : Char;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):integer;
  var
   LstFieldExsts : Boolean ;
  TheFile,AHearder,AValues:TStringList ;

  tmpField,tmpValue,
  StockCode:String;
  ValueCount,aCount,I,Listcount:Integer;

  function ReadField(AName : String;var Exist : Boolean) : String ;
  var
  FieldIndex : Integer;
  begin
    result := '' ;
    Exist := false ;
    for FieldIndex := 0 to AHearder.Count-1 do
      if  uppercase(AHearder[FieldIndex]) = uppercase(AName) then
        begin
          Exist := true;
           if AValues.Count > FieldIndex then
               result := AValues[FieldIndex] ;
           exit ;
        end;
  end;
 { Procedure ReadAccount(S:String);

  begin
    tmpField := ReadField(S,LstFieldExsts);
    if LstFieldExsts then
    begin
      // done : Pieter now way its going to find the tax accounts other wize.
      // and adjusted it to be able to use 4 diget account code
      tmpField :=Copy(tmpField,2,MainAccountLength + 4);
      tmpField := ZipAccountCode(tmpField);
      if dmDatabase.tblAccount.Locate('SACCOUNTCODE',tmpField,[]) then
      dmDatabase.tblStock.Fields[i].AsString := dmDatabase.tblAccountWAccountID.AsString;
    end;
  end;  }
Var
  Cds:TClientDataSet;
  FieldExist : Boolean ;
  Source,ErrorString ,CurField:  String ;
  pSource : PChar ;
  AOptionlist : TStringlist ;
begin
  ErrorString := '' ;
  AOptionlist := TStringlist.create ;
  Cds:=TClientDataSet.Create(nil);
  Try
  CreateStocksDef(Cds);
  Cds.CreateDataSet;
  Cds.Active := True;
  TheFile   :=TStringList.Create ;
  AHearder:=TStringList.Create ;
  AValues :=TStringList.Create ;
  try
  TheFile.LoadFromFile(afile);
  if TheFile.Count < 2 then exit ;
  AHearder.Delimiter := ASeperator ;
  AHearder.Text := StringReplace(TheFile[0],ASeperator,#13#10,[rfreplaceAll]);
  for i := 0 to AHearder.Count -1 do
    begin
     Source := AHearder[i] ;
     pSource := pchar(Source) ;
     Source := AnsiExtractQuotedStr(pSource,'"');
     if (Source <> '') and (Source <> '""') then
        AHearder[i] := Source ;
    end;
  AValues.Delimiter := ASeperator ;

    _SetProgress(gettextlang(2073),0);
    _SetProgress(Thefile.Count);
 //   GoNext123;

    aCount:=0;
    for valuecount := 2 to TheFile.Count do
    begin
       AValues.Text := StringReplace(TheFile[valuecount-1],ASeperator,#13#10,[rfreplaceAll]);
       for i := 0 to AValues.Count -1 do
        begin
         Source := AValues[i] ;
         pSource := pchar(Source) ;
         Source := AnsiExtractQuotedStr(pSource,'"');
         if (Source <> '') and (Source <> '""') then
         AValues[i] := Source ;

         if AValues[i] = '""' then
            AValues[i] := '' ;

        end;
 

       StockCode:= trim(ReadField('SSTOCKCODE',LstFieldExsts));

       if trim(StockCode) = '' then
          begin
             Continue ;
          end;
       Inc(aCount);
       _SetProgress('',aCount);
       // Watch for lenght couse locate does not like lengths to long

       Cds.Append ;
        try
       if length(StockCode) > dmDatabase.tblStockSSTOCKCODE.Size then
          SetLength(StockCode,dmDatabase.tblStockSSTOCKCODE.Size);
       for i:= 0 to cds.FieldCount-1 do
         begin
           tmpField := cds.Fields[i].FieldName;
           CurField := tmpField  ;
           tmpField := trim(ReadField(tmpField,FieldExist));
           if tmpField <> '' then
             begin
              if (cds.Fields[i].DataType in [ftFloat, ftCurrency]) then
              cds.Fields[i].AsString := StringReplace(tmpField,'.',DecimalSeparator,[rfReplaceAll])
              else if (cds.Fields[i].DataType in [ftSmallint, ftInteger, ftWord,   ftBoolean, ftLargeint]) then
                  cds.Fields[i].AsInteger :=  Trunc(StrToFloatDef(StringReplace(tmpField,'.',DecimalSeparator,[rfReplaceAll]),0))
              else
              cds.Fields[i].AsString := tmpField ;

              if (cds.Fields[i].AsString = '') then
                cds.Fields[i].Clear ;
             end;
          end;
         cds.fieldBYname('SSTOCKCODE').AsString := UpperCase(cds.fieldBYname('SSTOCKCODE').AsString) ;
         cds.post ;

         // special options cols to 1 col
         for Listcount := 0 to AHearder.Count -1 do
          begin
            if copy(AHearder[Listcount],1,7) = 'OPTION:' then
               begin
                 tmpField := '' ;
                 if AValues.Count > Listcount then
                   tmpField := trim(AValues[Listcount]) ;
                 if tmpField = '' then
                    begin
                      Continue ;
                    end;

                 Cds.Append ;
                 AOptionlist.Text := StringReplace(copy(AHearder[Listcount],8,Length(AHearder[Listcount])),'@',#13+#10,[rfReplaceAll]) ;

                 for i:= 0 to cds.FieldCount-1 do
                   begin
                     tmpField := cds.Fields[i].FieldName;
                     tmpField := trim(ReadField(tmpField,FieldExist));
                     if tmpField <> '' then
                       begin
                        if (cds.Fields[i].DataType in [ftFloat, ftCurrency]) then
                        cds.Fields[i].AsString := StringReplace(tmpField,'.',DecimalSeparator,[rfReplaceAll])
                        else
                        cds.Fields[i].AsString := tmpField ;

                        if (cds.Fields[i].AsString = '') then
                          cds.Fields[i].Clear ;
                       end;
                    end;
                   cds.FieldByName('FSELLINGPRICE1').AsFloat := 0 ;
                   tmpField := '' ;
                   if AValues.Count > Listcount then
                   tmpField := trim(AValues[Listcount]) ;
                   cds.FieldByName('FQTYONHAND').AsString :=  StringReplace(tmpField,'.',DecimalSeparator,[rfReplaceAll]) ;
                   cds.FieldByName('OPTION').AsString := copy(AHearder[Listcount],8,Length(AHearder[Listcount])) ;
                   cds.post ;
               end;
          end;


        except

          on e : Exception do
           begin
             ErrorString := ErrorString + 'Error on record!' + cds.Fields[0].AsString + #13+#10 + CurField + ':'+ e.Message ;
             cds.Cancel ;
           end;
        end;
    end;
  finally
  TheFile.free ;
  AHearder.free ;
  AValues.free ;
  end;
  _SetProgress(-2);
  if ErrorString <> '' then
    OSFMessageDlg(ErrorString,mtWarning,[mbok],0,true) ;
  ImportXmlStockFromCds(Cds,'',Bedit,EditType);

  Finally
    Cds.Free;
    AOptionlist.free;
  end;

end;

Function ImportWkxSTock(afile,Logfile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):integer;
Var
  aCount, I:Integer;
  Cds:TClientDataSet;
  StockCode,tmpField : String ;
begin

  Cds:=TClientDataSet.Create(nil);
  Try
    CreateStocksDef(Cds);
    Cds.CreateDataSet;
    Cds.Active := True;

  i := Pos('.',aFile);
  if i=0 then
    afile:=afile+'.Wk1'
  else
    ChangeFileExt(afile,'.wk1');
  if Open123File(afile) then
  begin
    _SetProgress(gettextlang(2073),0);
    _SetProgress(Row_Count);
    GoNext123;
    StockCode:= ReadField('SSTOCKCODE');
    aCount:=0;
    While StockCode<>'' do
    begin
       Inc(aCount);
       _SetProgress('',aCount);
       // Watch for lenght couse locate does not like lengths to long
       Cds.Append ;
       if length(StockCode) > dmDatabase.tblStockSSTOCKCODE.Size then
          SetLength(StockCode,dmDatabase.tblStockSSTOCKCODE.Size);
      for i:= 0 to cds.FieldCount-1 do
         begin
           tmpField := cds.Fields[i].FieldName;
           tmpField := ReadField(tmpField);
           if tmpField <> '' then
             begin
              if (cds.Fields[i].DataType in [ftFloat, ftCurrency]) then
              cds.Fields[i].AsString := StringReplace(tmpField,'.',DecimalSeparator,[rfReplaceAll])
              else
              cds.Fields[i].AsString := tmpField ;
             end;
          end;
       GoNext123;
       StockCode:= ReadField('SSTOCKCODE');
    end;
    ImportXmlStockFromCds(Cds,'',Bedit,EditType);
  end;
  Finally
    Cds.Free;
  end;
  _SetProgress(-2);
end;

{Export Debtors}

Function  ExportDebtors(AcFrom,acTo:String;afile,Logfile:String;FileTyeID:integer):Integer;
var
  FStream:TClientDataSet;
//  FlStream:TClientDataSet;
  UserName:String;
begin
  Result := 0;
  UserName:=acTo;
  if UpperCase(AcFrom)>UpperCase(acTo) then
  begin
    acTo:= AcFrom;
    AcFrom:=UserName;
  end;

  try
    FStream := TClientDataSet.Create(Application);
    CreateXmlFilesDef(FStream,2);
    {Open Tables}
    dmDatabase.tblAccount.Open;
    dmDatabase.tblDebtor.Open;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblAccount.Filter:='WAccountTypeID=1 AND SACCOUNTCODE>='''+acFrom+''' And SACCOUNTCODE<='''+acTo+'''';
    dmDatabase.tblAccount.Filtered := True;
    dmDatabase.tblAccount.First;
    dmDatabase.tblDebtor.Filtered := False;
    _SetProgress(gettextlang(2072),0);
    _SetProgress(dmDatabase.tblAccount.RecordCount);
    dmDatabase.tblAccount.First;
    With dmDatabase.tblAccount do
      While not Eof do
      begin
         if not dmDatabase.tblDebtor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[])then
         begin
           Next;
           Continue;
         end;
         FStream.Append;
         FStream.FieldByName('SACCOUNTCODE').AsString := dmDatabase.tblAccountSACCOUNTCODE.Text;
         FStream.FieldByName('SDescription').AsString := dmDatabase.tblAccountSdescription.Value;
         FStream.FieldByName('Spostal1').AsString := dmDatabase.tblDebtorSPostal1.AsString;
         FStream.FieldByName('SContactName').AsString := GetContactName(dmDatabase.tblDebtorWCONTACTID.AsInteger);

         FStream.FieldByName('Spostal2').AsString := dmDatabase.tblDebtorSPostal2.AsString;
         FStream.FieldByName('Spostal3').AsString := dmDatabase.tblDebtorSPostal3.AsString;
         FStream.FieldByName('SpostalCode').AsString := dmDatabase.tblDebtorSPostalCode.AsString;
         FStream.FieldByName('sDelivery1').AsString := dmDatabase.tblDebtorsDelivery1.AsString;
         FStream.FieldByName('sDelivery2').AsString := dmDatabase.tblDebtorsDelivery2.AsString;
         FStream.FieldByName('sDelivery3').AsString := dmDatabase.tblDebtorsDelivery3.AsString;
         FStream.FieldByName('sDeliveryCode').AsString := dmDatabase.tblDebtorsDeliveryCode.AsString;
         FStream.FieldByName('STelephone1').AsString := dmDatabase.tblDebtorSTelephone1.AsString;
         FStream.FieldByName('STelephone2').AsString := dmDatabase.tblDebtorSTelephone2.AsString;
         FStream.FieldByName('SEmail').AsString := dmDatabase.tblDebtorSEMail.AsString;
         FStream.FieldByName('SFax').AsString := dmDatabase.tblDebtorSFax.AsString;
         FStream.FieldByName('FCREDITLimit').Value := dmDatabase.tblDebtorFCREDITLimit.Value;
         FStream.FieldByName('FChargeAmount').Value := dmDatabase.tblDebtorFChargeAmount.Value;
         FStream.FieldByName('FDiscount').Value := dmDatabase.tblDebtorFDiscount.Value;
         FStream.FieldByName('FInterest').Value := dmDatabase.tblDebtorFInterest.Value;
         FStream.FieldByName('BOpenItem').Value := dmDatabase.tblAccountBOPENITEM.Value;
         FStream.FieldByName('BINACTIVE').Value := dmDatabase.tblAccountBINACTIVE.Value;
         FStream.FieldByName('SMessage').Value := dmDatabase.tblDebtorSMessage.Value;
         FStream.FieldByName('WDefaultPriceTypeID').Value := dmDatabase.tblDebtorWDefaultPriceTypeID.Value;
         FStream.FieldByName('DLastActivity').Value := dmDatabase.tblDebtorDLastActivity.Value;
         FStream.FieldByName('Sreference').Value := dmDatabase.tblDebtorSreference.Value;
         FStream.FieldByName('WDUEDAYS').Value := dmDatabase.tblDebtorWDUEDAYS.Value;

         FStream.FieldByName('SBANKNAME').Value := dmDatabase.tblDebtorSBANKNAME.Value;
         FStream.FieldByName('SBRANCHCODE').Value := dmDatabase.tblDebtorSBRANCHCODE.Value;
         FStream.FieldByName('SBANKACCOUNTNUMBER').Value := dmDatabase.tblDebtorSBANKACCOUNTNUMBER.Value;
         FStream.FieldByName('SBANKACCOUNTNAME').Value := dmDatabase.tblDebtorSBANKACCOUNTNAME.Value;
         FStream.FieldByName('SCREDITCARDNUMBER').Value := dmDatabase.tblDebtorSCREDITCARDNUMBER.Value;
         FStream.FieldByName('SCREDITCARDTYPE').Value := dmDatabase.tblDebtorSCREDITCARDTYPE.Value;
         FStream.FieldByName('SCREDITCARDHOLDER').Value := dmDatabase.tblDebtorSCREDITCARDHOLDER.Value;


         FStream.FieldByName('SCOMPANYREGNO').Value := dmDatabase.tblDebtorSCOMPANYREGNO.Value;
         FStream.FieldByName('SFREEFIELD1').Value := dmDatabase.tblDebtorSFREEFIELD1.Value;
         FStream.FieldByName('SFREEFIELD2').Value := dmDatabase.tblDebtorSFREEFIELD2.Value;
         FStream.FieldByName('SFREEFIELD3').Value := dmDatabase.tblDebtorSFREEFIELD3.Value;

         FStream.FieldByName('SPostCountry').AsString := TDataBaseRoutines.GetCountryName(dmDatabase.tblDebtorWPOSTCOUNTRIES_ID.AsInteger);
         FStream.FieldByName('SDelCountry').AsString := TDataBaseRoutines.GetCountryName(dmDatabase.tblDebtorWDELCOUNTRIES_ID.AsInteger);



         if FieldByName('WReportingGroup1ID').AsInteger<=0 then
            FStream.FieldByName('SGroup1').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup1ID').AsInteger,[]) then
           FStream.FieldByName('SGroup1').AsString := dmDatabase.tblGroupsSDescription.AsString;
         if FieldByName('WReportingGroup2ID').AsInteger<=0 then
            FStream.FieldByName('SGroup2').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup2ID').AsInteger,[]) then
           FStream.FieldByName('SGroup2').AsString := dmDatabase.tblGroupsSDescription.AsString;
        if  DmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOf([Str2Int(dmDatabase.tblDebtor.FieldByName('WSalesmanID').AsString),31]),[]) then
          FStream.FieldByName('SSalesperson').AsString :=  DmDatabase.tblGroupsSDescription.Value;


        FStream.FieldByName('SDEFAULTACCOUNT').AsString := GetAccountCodeWithTypePrefixFromAccountId(dmDatabase.tblDebtorWDEFAULTACCOUNT.AsInteger);
        FStream.FieldByName('SDEFAULTTAX').AsString := GetAccountCodeWithTypePrefixFromAccountId(dmDatabase.tblDebtorWDEFAULTTAX.AsInteger);


         FStream.Post;
        _SetProgress('',RecNo);
        Next;
    end;
    _SetProgress(-2);
    SaveFileNow(afile,FStream,FileTyeID);
  Except

  end;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblDebtor.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
  dmDatabase.tblDebtor.Filtered := False;
  dmDatabase.tblDebtor.Filter:='';

end;


{Export Creditors}

Function  ExportCreditors(AcFrom,acTo:String;afile,Logfile:String;FileTyeID:integer):Integer;
var
  FStream:TClientDataSet;
//  FlStream:TClientDataSet;
  UserName:String;
begin
  Result := 0;
  UserName:=acTo;
  if UpperCase(AcFrom)>UpperCase(acTo) then
  begin
    acTo:= AcFrom;
    AcFrom:=UserName;
  end;

  try
    FStream := TClientDataSet.Create(Application);
    CreateXmlFilesDef(FStream,6);
    {Open Tables}
    dmDatabase.tblAccount.Open;
    dmDatabase.tblCreditor.Open;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblAccount.Filter:='WAccountTypeID=2 AND SACCOUNTCODE>='''+acFrom+''' And SACCOUNTCODE<='''+acTo+'''';
    dmDatabase.tblAccount.Filtered := True;
    dmDatabase.tblAccount.First;
    dmDatabase.tblCreditor.Filtered := False;
    _SetProgress(gettextlang(2073),0);
    _SetProgress(dmDatabase.tblAccount.RecordCount);
    dmDatabase.tblAccount.First;
    With dmDatabase.tblAccount do
      While not Eof do
      begin
         if not dmDatabase.tblCreditor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[])then
         begin
           Next;
           Continue;
         end;
         FStream.Append;
         FStream.FieldByName('SACCOUNTCODE').AsString := dmDatabase.tblAccountSACCOUNTCODE.Text;
         FStream.FieldByName('SDescription').AsString := dmDatabase.tblAccountSdescription.Value;
         FStream.FieldByName('SContactName').AsString := GetContactName(dmDatabase.tblCreditorWCONTACTID.AsInteger);
         FStream.FieldByName('Spostal1').AsString := dmDatabase.tblCreditorSPostal1.AsString;
         FStream.FieldByName('Spostal2').AsString := dmDatabase.tblCreditorSPostal2.AsString;
         FStream.FieldByName('Spostal3').AsString := dmDatabase.tblCreditorSPostal3.AsString;

         FStream.FieldByName('SPostCountry').AsString := TDataBaseRoutines.GetCountryName(dmDatabase.tblCreditorWPOSTCOUNTRIES_ID.AsInteger);
         FStream.FieldByName('SDelCountry').AsString := TDataBaseRoutines.GetCountryName(dmDatabase.tblCreditorWDELCOUNTRIES_ID.AsInteger);

         FStream.FieldByName('SpostalCode').AsString := dmDatabase.tblCreditorSPostalCode.AsString;
         FStream.FieldByName('sDelivery1').AsString := dmDatabase.tblCreditorsDelivery1.AsString;
         FStream.FieldByName('sDelivery2').AsString := dmDatabase.tblCreditorsDelivery2.AsString;
         FStream.FieldByName('sDelivery3').AsString := dmDatabase.tblCreditorsDelivery3.AsString;
//         FStream.FieldByName('sDeliveryCode').AsString := dmDatabase.tblCreditorsDeliveryCode.AsString;
         FStream.FieldByName('STelephone1').AsString := dmDatabase.tblCreditorSTelephone1.AsString;
         FStream.FieldByName('STelephone2').AsString := dmDatabase.tblCreditorSTelephone2.AsString;
         FStream.FieldByName('SEmail').AsString := dmDatabase.tblCreditorSEMail.AsString;
         FStream.FieldByName('SFax').AsString := dmDatabase.tblCreditorSFax.AsString;
         FStream.FieldByName('FCREDITLimit').Value := dmDatabase.tblCreditorFCREDITLimit.Value;
         FStream.FieldByName('FChargeAmount').Value := dmDatabase.tblCreditorFChargeAmount.Value;
         FStream.FieldByName('FDiscount').Value := dmDatabase.tblCreditorFDiscount.Value;
//         FStream.FieldByName('FInterest').Value := dmDatabase.tblCreditorFInterest.Value;
         FStream.FieldByName('BOpenItem').Value := dmDatabase.tblAccountBOPENITEM.Value;
         FStream.FieldByName('BINACTIVE').Value := dmDatabase.tblAccountBINACTIVE.Value;
         FStream.FieldByName('SMessage').Value := dmDatabase.tblCreditorSMessage.Value;
         FStream.FieldByName('WDefaultPriceTypeID').Value := dmDatabase.tblCreditorWDefaultPriceTypeID.Value;
         FStream.FieldByName('DLastActivity').Value := dmDatabase.tblCreditorDLastActivity.Value;
         FStream.FieldByName('Sreference').Value := dmDatabase.tblCreditorSreference.Value;
         FStream.FieldByName('WDUEDAYS').Value := dmDatabase.tblCreditorWDUEDAYS.Value;
         FStream.FieldByName('SCOMPANYREGNO').Value := dmDatabase.tblCreditorSCOMPANYREGNO.Value;
         FStream.FieldByName('SFREEFIELD1').Value := dmDatabase.tblCreditorSFREEFIELD1.Value;
         FStream.FieldByName('SFREEFIELD2').Value := dmDatabase.tblCreditorSFREEFIELD2.Value;
         FStream.FieldByName('SFREEFIELD3').Value := dmDatabase.tblCreditorSFREEFIELD3.Value;

         FStream.FieldByName('SBANKNAME').Value := dmDatabase.tblCreditorWBANKNAME.Value;
         FStream.FieldByName('SBRANCHCODE').Value := dmDatabase.tblCreditorSBRANCHCODE.Value;
         FStream.FieldByName('SBANKACCOUNTNUMBER').Value := dmDatabase.tblCreditorSBANKACCOUNTNUMBER.Value;
         FStream.FieldByName('SBANKACCOUNTNAME').Value := dmDatabase.tblCreditorSBANKACCOUNTNAME.Value;
        { FStream.FieldByName('SCREDITCARDNUMBER').Value := dmDatabase.tblCreditorSCREDITCARDNUMBER.Value;
         FStream.FieldByName('SCREDITCARDTYPE').Value := dmDatabase.tblCreditorSCREDITCARDTYPE.Value;
         FStream.FieldByName('SCREDITCARDHOLDER').Value := dmDatabase.tblCreditorSCREDITCARDHOLDER.Value;  }



         if FieldByName('WReportingGroup1ID').AsInteger<=0 then
            FStream.FieldByName('SGroup1').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup1ID').AsInteger,[]) then
           FStream.FieldByName('SGroup1').AsString := dmDatabase.tblGroupsSDescription.AsString;
         if FieldByName('WReportingGroup2ID').AsInteger<=0 then
            FStream.FieldByName('SGroup2').AsString := ''
         else
         if dmDatabase.tblGroups.locate('WGroupID',FieldByName('WReportingGroup2ID').AsInteger,[]) then
           FStream.FieldByName('SGroup2').AsString := dmDatabase.tblGroupsSDescription.AsString;
//        if  DmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID',VarArrayOf([Str2Int(dmDatabase.tblCreditor.FieldByName('WSalesmanID').AsString),31]),[]) then
//          FStream.FieldByName('SSalesperson').AsString :=  DmDatabase.tblGroupsSDescription.Value;
        FStream.FieldByName('SDEFAULTACCOUNT').AsString := GetAccountCodeWithTypePrefixFromAccountId(dmDatabase.tblCreditorWDEFAULTACCOUNT.AsInteger);
        FStream.FieldByName('SDEFAULTTAX').AsString := GetAccountCodeWithTypePrefixFromAccountId(dmDatabase.tblCreditorWDEFAULTTAX.AsInteger);

         FStream.Post;
        _SetProgress('',RecNo);
        Next;
    end;
    _SetProgress(-2);
    SaveFileNow(afile,FStream,FileTyeID);
  Except

  end;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblCreditor.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
  dmDatabase.tblCreditor.Filtered := False;
  dmDatabase.tblCreditor.Filter:='';

end;

Function CheckUniqueBatcon(Value:String):String;
begin
  Result := Value;
  if Trim(Value)='' then
    Result :='********';
end;

Function  TransactToStream(FStream:TClientDataSet;aStream:TStream):Integer;
Var
  AccLst,AccCode:String;
  Body,Batches:String;
  ID:Integer;
  ic:integer;
begin
  AccLst:='';
  Body:='';

  FStream.First;
  dmDatabase.tblAccount.Open;
  Batches:='';
  While not FStream.Eof do
  begin
    Body:= '<Batchtrans>' + eline;
    AddTag(Body,'batchname',FStream.fieldbyname('SBatchName').AsString);
    AddTag(Body,'salias',FStream.fieldbyname('SAlias').AsString);
    AddTag(Body,'wInitBatID',FStream.fieldbyname('WBatchID').AsString);
    AddTag(Body,'SUniqueID',CheckUniqueBatcon(FStream.fieldbyname('SUniqueID').AsString));
    if AutoPost then
      Addtag(Body,'postBatch','true');
    ic := FStream.fieldbyname('WBatchID').AsInteger;
    While (not FStream.Eof) AND (ic = FStream.fieldbyname('WBatchID').AsInteger) do
    begin
      ID := TDataBaseRoutines.GetAccountIDFromCode(FStream.FieldByname('SACCOUNT').asString);
      if (Pos('<accid>'+IntToStr(ID)+'</accid>',AccLst)<=0) And (ID>0) then
      AddAccountToTxf(ID,AccLst,AccCode);
      {Import Contra Account}
      ID := TDataBaseRoutines.GetAccountIDFromCode(FStream.FieldByname('SCONTRAACCOUNT').asString);
      AddAccountToTxf(ID,AccLst,AccCode);

      Body := Body + '<BatchLine>'+eline;
      Body := Body + Addtag('Date', Date2TxfStr(FStream.fieldbyname('DDate').AsDateTime));
      Body := Body + Addtag('Reference',FStream.fieldbyname('SReference').AsString);
      // todo : This is not correct i gess so but i could think of errors when the batch is reversed
      Body := Body + Addtag('Exclusive','True');
      Body := Body + Addtag('Account',FStream.fieldbyname('SACCOUNT').AsString);
      Body := Body + Addtag('ContraAccount',FStream.fieldbyname('SCONTRAACCOUNT').AsString);
      Body := Body + Addtag('TaxAccount',FStream.fieldbyname('STAXAccount').AsString);
      Body := Body + Addtag('Amount',FStream.fieldbyname('FAmount').AsString);
      Body := Body + Addtag('TaxAmount',FStream.fieldbyname('FTaxAmount').AsString);
      Body := Body + Addtag('Description',FStream.fieldbyname('SDescription').AsString);
      Body := Body + Addtag('BatchName',FStream.fieldbyname('SBatchName').AsString);
      Body:=  Body + Addtag('UserName',FStream.fieldbyname('SUserName').AsString);
      Body:=  Body + Addtag('Lineid',FStream.fieldbyname('WLineid').AsString);
      Body:=  Body + Addtag('Linkedid',FStream.fieldbyname('WLinkedid').AsString);
      Body:=  Body + '</BatchLine>'+eline;
      FStream.Next;
    end;
    Body:=body + '</Batchtrans>' + eline;
    Batches := Batches + Body;
  end;
  {Write now to sr eate}
  {}
  AccLst:= TxfSign + eline +'<txf>'+'<acclist>'+AccLst+'</acclist>';
  if AccLst <> '' then
  aStream.Write(AccLst[1],length(AccLst));
  if Batches <> '' then
  aStream.Write(Batches[1],length(Batches));
  Body:='</txf>'+'</TCASH3>';
  aStream.Write(Body[1],length(Body));
  dmDatabase.tblStock.Close;
  dmDatabase.tblAccount.Close;
end;

Function  ExportTxfTransact(FStream:TClientDataSet;aFile:String):Integer;
Var
  aStream:TFileStream;
begin
  Result:=1;
  Try
    aFile := ChangeFileExt(aFile,'.txf');
    aStream := TFileStream.Create(aFile,fmCreate);
    Result := TransactToStream(FStream,aStream);
  Finally
    aStream.Free;
  end;

end;

Function CreateTrsBatFilter:String;
begin
  Result := '';
end;

Function  ExportXmlTransact(aEBatch,aBBatch,WPeriodID:Integer;afile,Logfile:String;FileTyeID:Integer):Integer;
var
  FStream:TClientDataSet;
//  FlStream:TClientDataSet;
begin
  Result := 0;
  FStream := TClientDataSet.Create(nil) ;
    try
    CreateXmlFilesDef(FStream,5);
    {Open Tables}
    dmDatabase.tblAccount.Open;
    dmDatabase.tblUser.Open;
    dmDatabase.tblTransaction.Open;
    dmDatabase.tblBatchTypes.Open;
    dmDatabase.tblBatchControl.Open;
    dmDatabase.tblBatchControl.Filtered:=False;
    dmDatabase.tblBatchControl.Filter:='';
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblAccount.Filter:='';
    swapint(aBBatch,aEBatch);
    dmDatabase.tblTransaction.Filtered := False;
    dmDatabase.tblTransaction.Filter:='WBatchID>='''+IntToStr(aBBatch)+''' AND WBatchID<=''' + IntToStr(aEBatch) + '''';
    if WPeriodID>=0 then begin
       dmDatabase.tblTransaction.Filter := dmDatabase.tblTransaction.Filter +
       ' AND (WPeriodID='''+IntToStr(WPeriodID)+''')';
    end;
    dmDatabase.tblTransaction.Filtered:=True;
    _SetProgress(gettextlang(2071),0);
    _SetProgress(dmDatabase.tblTransaction.RecordCount);
    dmDatabase.tblTransaction.First;
    With dmDatabase,dmDatabase.tblTransaction do
      While not Eof do
      begin
         if dmDatabase.tblBatchControl.Locate('WbatchID',FieldByName('WbatchID').AsString,[]) then begin
           if dmDatabase.tblBatchControlBDocSource.AsInteger =1 then
           begin
             Next;
             COntinue;
           end;
         end else
           {Fix thie entry in the batCon}
          BatConRelink(tblTransactionWBatchID.AsInteger,tblTransactionWBatchTypeID.AsInteger,
           tblTransactionWUserID.AsInteger,True);
         FStream.Append;
         FStream.FieldByName('WBatchID').AsString := dmDatabase.tblTransactionWBatchID.AsString;
         FStream.FieldByName('WLineID').AsString := dmDatabase.tblTransactionWLineID.AsString;
         FStream.FieldByName('WLinkedID').AsString := dmDatabase.tblTransactionWLINKEDID.AsString;
         FStream.FieldByName('DDAte').AsString := dmDatabase.tblTransactionDDAte.AsString;
         FStream.FieldByName('WperiodID').AsString := dmDatabase.tblTransactionWperiodID.AsString;
         FStream.FieldByName('SReference').AsString := dmDatabase.tblTransactionSReference.AsString;
         FStream.FieldByName('FAmount').AsString := dmDatabase.tblTransactionFAmount.AsString;
         FStream.FieldByName('FTaxRate').AsString := dmDatabase.tblTransactionFTaxRate.AsString;
         FStream.FieldByName('FTaxAmount').AsString := dmDatabase.tblTransactionFTaxAmount.AsString;
         FStream.FieldByName('FForExAmount').AsString := dmDatabase.tblTransactionFForExAmount.AsString;
         FStream.FieldByName('SACCOUNT').AsString := '';
         if dmdatabase.tblAccount.Locate('WAccountID', dmDatabase.tblTransactionWAccountID.Value,[]) then
            FStream.FieldByName('SACCOUNT').AsString := dmdatabase.tblAccountSACCOUNTCODE.Text;
         FStream.FieldByName('STAXAccount').AsString := '';
         if dmdatabase.tblAccount.Locate('WAccountID', dmDatabase.tblTransactionWTaxAccountID.Value,[]) then
            FStream.FieldByName('STAXAccount').AsString := dmdatabase.tblAccountSACCOUNTCODE.Text;
         FStream.FieldByName('SCONTRAACCOUNT').AsString := '';
         if dmdatabase.tblAccount.Locate('WAccountID', dmDatabase.tblTransactionWBalancingAccountID.Value,[]) then
            FStream.FieldByName('SCONTRAACCOUNT').AsString := dmdatabase.tblAccountSACCOUNTCODE.Text;
         FStream.FieldByName('SUserName').AsString := GetT3UserName(dmdatabase.tblTransactionWUserID.Value);
         FStream.FieldByName('SBatchName').AsString :='';
         if dmDatabase.tblBatchTypes.Locate('WBatchTypeID', dmDatabase.tblTransactionWBatchTypeID.Value,[]) then
            FStream.FieldByName('SBatchName').AsString := dmdatabase.tblBatchTypesSDescription.Value;
         FStream.FieldByName('SDescription').AsString := _ReadDescription(dmDatabase.tblTransactionWDescriptionID.Value);
         if dmDatabase.tblBatchControl.Locate('WBatchID',dmDatabase.tblTransactionWBatchID.AsInteger,[]) then
         begin
           FStream.FieldByName('SAlias').AsString := dmDatabase.tblBatchControlSAlias.AsString;
           FStream.FieldByName('SUniqueID').AsString := dmDatabase.tblBatchControlSUniqueID.AsString;
         end;
         FStream.Post;
        _SetProgress('',RecNo);
        Next;
    end;
    _SetProgress(-2);
    if 4=FileTyeID then
      ExportTxfTransact(FStream,afile)
    else
      SaveFileNow(afile,FStream,FileTyeID);
  Finally
    FStream.Free;

  end;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter:='';
  dmDatabase.tblUser.Close;
  dmDatabase.tblBatchTypes.CLose;
  dmDatabase.tblBatchControl.Close;
  dmDatabase.tblBatchControl.Filtered := False;
  dmDatabase.tblBatchControl.Filter:='';
end;

Procedure SplitAccountCode(aCode:string;Var Main,Sub:String;Var AccType:integer);
begin
  Main:='';
  Sub:='';
  if aCode='' then aCode :=' ';
  AccType:= Pos(aCode[1],'GDCBT');
  if AccType>=1 then
  begin
   Dec(AccType);
   Delete(aCode,1,1);
  end;
  // done : Redid this for accountcode length and adding - in accountcodes
  if Length(acode) > MainAccountLength then
    if acode[MainAccountLength+1] ='-' then
        Delete(aCode,MainAccountLength+1,1);

  Main:=Trim(Copy(aCode,1,MainAccountLength));
  Sub:=Copy(aCode,MainAccountLength+1,3);
  if (Main<>'') and Not (AccType in [1,2]) And (Sub='') then
    Sub:='000';
end;

Function ImportXmlTransInBat(cds:TClientDataSet;batPost:Boolean=False):Integer;
{This suppose that the Batch file is open}
Var
  Count,TotCount:integer;
  AtypeID:Integer;
  Hold : Boolean;
  KeepUserID:Integer;
  OldID:Integer;
  FBatchType : TBatchTypeRec;
  ADMCoreData : TDMCoreData ;
begin
  ADMCoreData := TDMCoreData.create(nil) ;
  try
  Result := 0;
  dmDatabase.tblAccount.Open;
  Try
    KeepUserID := CurrentUser;

    if cds.RecordCount>0 then
    begin
      Hold := dmDatabase.tblBatch.Active;
 //     cds.Open;
     if assigned(OnImportClientDataset) then
        OnImportClientDataset(cds,'BATCHDATA');

      cds.First;
      {Check if Batch can be loaded}
      OldID:=cds.fieldbyName('WBatchID').AsInteger;
      if cds.fieldbyName('sUserName').AsString <> '' then
      SetCurrentuser(GetT3UserID(cds.fieldbyName('sUserName').AsString));
      if CurrentUser<0 then begin
        Result := 2046; // ' Error Cannot Edit Batch';
        SMsgErr := 'Invalid user name "'+cds.fieldbyName('sUserName').AsString+'"in batch ' + cds.fieldbyName('sBatchName').AsString+' '+ ' Batch '+ IntToStr(OldID);
        Exit;
      end;
      FBatchType.SDescription := cds.fieldbyName('sBatchName').AsString;
      if Not BatchNameExists(FBatchType) then
      begin
        Result := 2034; // ' Error Cannot Edit Batch';
        SMsgErr := 'Batch Name Not Found ' + cds.fieldbyName('sBatchName').AsString+' '+ ' Batch '+ IntToStr(OldID);
        Exit;
      end;
      Count:= BatchExists(FBatchType.WBatchTypeID,CurrentUser,cds.fieldbyName('SuniqueID').AsString,'');
      if (Count=2) AND (Trim(OnlyThisBatch)='') then
      begin
        Result := 2033; // ' Error Cannot Edit Batch';
        SMsgErr := 'posted '+cds.fieldbyName('sBatchName').AsString+' Nbr:' + cds.fieldbyName('WBatchID').AsString+' '+ ' Batch '+ IntToStr(OldID);
        Exit;
      end;
      {Check In Which Batch File to load}
      if Trim(OnlyThisBatch)='' then
      begin
       if Not SameText(cds.fieldbyName('sBatchName').AsString,GetActiveBatTypeName) then
         dmDatabase.tblBatch.Close;
       if Not dmDatabase.tblBatch.Active then
       begin
         OpenBatch (cds.fieldbyName('sBatchName').AsString,BatchCtrlID,False);
         UpdateBatCon(BatchCtrlID,cds.fieldbyName('WBatchID').AsInteger,
         cds.fieldbyName('SAlias').AsString,cds.fieldbyName('SUniqueID').AsString,True);
         
       end;
      end;
  //    cds:=TClientDataSet.Create(nil);
      try
        dmDatabase.tblBatchFCREDIT.ReadOnly:=False;
        dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
        dmDatabase.tblBatch.Last;
        if (dmDatabase.tblBatch.RecordCount>0) AND (dmDatabase.tblBatchFDEBIT.Value=0) and
         (dmDatabase.tblBatchFCREDIT.Value=0) then
          dmDatabase.tblBatch.delete;
  //      cds.LoadFromFile(aFileName);

        while not cds.Eof do
        begin
          dmDatabase.tblBatch.Append;
          _SetProgress(format(gettextlang(2183),[IntToStr(Count),IntToStr(TotCount)]),0); {'Importing :'+IntToStr(Count)+' Of '+IntToStr(TotCount),0);}
          dmDatabase.tblBatchSReference.Value := cds.fieldbyName('SReference').AsString;
          dmDatabase.tblBatchDDate.Value := cds.FieldByName('DDAte').AsDateTime ;
          dmDatabase.tblBatchDAllocatedDate.Value := dmDatabase.tblBatchDDate.Value;
          dmDatabase.tblBatchSDescription.Value := cds.FieldByName('SDescription').AsString ;
          tmpstrs1 := cds.FieldByName('SACCOUNT').AsString ;
          SplitAccountCode(tmpstrs1,tmpstrs2,tmpstrs3,AtypeID);
          //dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',VarArrayOf([tmpstrs2+tmpstrs3,AtypeID]),[]);
          dmDatabase.tblBatchWAccountID.Value := GetAccountIdFromCodeAndType(tmpstrs2 + tmpstrs3,AtypeID);
          dmDatabase.tblBatchSACCOUNT.Value := TDataBaseRoutines.AddDashInAccCode(tmpstrs2+tmpstrs3);

          SplitAccountCode(cds.FieldByName('SCONTRAACCOUNT').AsString,tmpstrs2,tmpstrs3,AtypeID);

          dmDatabase.tblBatchSCONTRAACCOUNT.Value:=TDataBaseRoutines.AddDashInAccCode(tmpstrs2+tmpstrs3);
          dmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger := GetAccountIdFromCodeAndType(tmpstrs2 + tmpstrs3,AtypeID);

          SplitAccountCode(cds.FieldByName('STAXAccount').AsString,tmpstrs2,tmpstrs3,AtypeID);
          dmDatabase.tblBatchSTAX.Value := TDataBaseRoutines.AddDashInAccCode(tmpstrs2+tmpstrs3);
          dmDatabase.tblBatchWTAXID.AsInteger := GetAccountIdFromCodeAndType(tmpstrs2 + tmpstrs3,AtypeID);

          dmDatabase.tblBatchFAmount.Value:= cds.FieldByName('FAmount').AsFloat;
          dmDatabase.tblBatchFTaxAmount.Value := cds.FieldByName('FTaxAmount').AsFloat;
          dmDatabase.tblBatchFDEBIT.AsString := '';
          dmDatabase.tblBatchFCREDIT.AsString := '';
          if dmDatabase.tblBatchFAmount.Value>=0 then
            dmDatabase.tblBatchFDEBIT.Value := dmDatabase.tblBatchFAmount.Value
          else
            dmDatabase.tblBatchFCREDIT.Value :=-dmDatabase.tblBatchFAmount.Value;
          if FBatchType.BCashBook then
            dmDatabase.tblBatchFAmount.Value := dmDatabase.tblBatchFAmount.Value + dmDatabase.tblBatchFTaxAmount.Value;
          dmDatabase.tblBatchBReconciled.Value := 1;
          dmDatabase.tblBatchBExclusive.Value := cds.FieldByName('BExclusive').AsInteger;
          dmDatabase.tblBatch.Post;
          Inc(Count);
          cds.Next;
        end;
        cds.Close;
      finally
       // cds.Free;
        (*
        if Not CheckBacthSecq(BatchCtrlID) then
        begin
          {Should be an error for for UCS but not for TCASH3}
          AddTxfWarning('Error 2045 Batch out of sequence');
        end;
        *)
        if (Result=0) AND batPost AND (Trim(OnlyThisBatch)='') then
        begin
           // I Must Read Consolidate from batch settings
           // todo : I dont think the batch needs to be balanced as it was already balanced in the source set of books
           // Result := LrBalanceBatch(dmdatabase.TblBatch.Tablename, ADMCoreData,dmDatabase.BatchType,tcvariables.DefaultContraAccount);
           result := 0 ;
           if Result=0 then
           begin
             Result := PostBatchNow(True,false);
             Hold := False;
           end
           else
             SMsgErr := SMsgErr + ' Batch '+ IntToStr(OldID);
           if Result<>0 then
           begin
             dmDatabase.tblBatch.Close;
             Application.ProcessMessages;
             ClearTable(dmDatabase.tblBatch.Tablename);
           end;
        end;
        dmDatabase.tblBatch.Active := Hold;
      end;
    end;
  finally
    SetCurrentuser(KeepUserID);
  end;
  finally
     ADMCoreData.free ;
  end;
end;


Function  ImportTransInBat(aFileName:String):Integer;
Var
  cds:TClientDataSet;
  tcExt:String;
begin
  Try
   Result := 0;
    cds := TClientDataSet.Create(Application);
    tcExt := ExtractFileExt(aFileName);
    if SameText(tcExt,'.xml') then begin
      cds.LoadFromFile(aFileName);
      Result := ImportXmlTransInBat(cds);
    end
    else
    { DONE -osylvain -cMust : Import Txf file into Opened Batch file }
      Result := ReadTxfFromFile(aFileName,false);
  finally
    cds.Free;

  end;
end;


Function WriteDocTxf(FStream,LStream,lDStream:TDataset;aStream:TStream):Integer;
Var
  AccLst:string;
  StcLst:String;
  Body : String;
  tmp:STring;
begin
  AccLst:='';
  StcLst:='';
  Body:='';
  FStream.First;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblStock.Open;
  While not FStream.Eof do
  begin
    LStream.Filtered := False;
    LStream.Filter:='WDocID='+IntToStr(FStream.FieldByname('WDocID').AsInteger);
    LStream.Filtered := True;
    LStream.First;
    {}
    (*
    if Pos('<accid>'+FStream.FieldByname('WAccountID').asString+'</accid>',AccLst)<=0 then
    if dmDatabase.tblAccount.Locate('WAccountID',FStream.FieldByname('WAccountID').AsInteger,[]) then
    begin
      AccLst := AccLst + '<accinfo>'+'<code>'+dmDatabase.tblAccountSACCOUNTCODE.Text+'</code>';
      AccLst := AccLst + '<accid>'+dmDatabase.tblAccountwaccountid.AsString+'</accid>';
      AccLst := AccLst + '<description>'+dmDatabase.tblAccountSdescription.AsString+'</description>';
      AccLst := AccLst + '<incomeexpense>'+dmDatabase.tblAccountBIncomeExpense.AsString+'</incomeexpense>';
      AccLst := AccLst + '</accinfo>';
    end;
    *)
    AddAccountToTxf(FStream.FieldByname('WAccountID').AsInteger,AccLst,tmp);

    Body:=Body + '<doctrans>';
    Body:=Body + '<docinfo>';
    Body:=Body + Addtag('Docid',FStream.fieldbyname('WDocID').AsString);
    Body:=Body + Addtag('Acctcode',dmDatabase.tblAccountSACCOUNTCODE.AsString);
    Body:=Body + Addtag('AcctTypeID',dmDatabase.tblAccountWAccountTypeID.AsString);
    Body:=Body + Addtag('type',FStream.fieldbyname('WtypeID').AsString);
    Body:=Body + Addtag('Date',Date2TxfStr(FStream.fieldbyname('DDate').AsDateTime));
    Body:=Body + Addtag('Number',FStream.fieldbyname('SDocNo').AsString);
    Body:=Body + Addtag('Reference',FStream.fieldbyname('SReference').AsString);
    Body:=Body + Addtag('Printed',FStream.fieldbyname('BPrinted').AsString);;
    Body:=Body + Addtag('Posted',FStream.fieldbyname('BPosted').AsString);
    Body:=Body + Addtag('Exclusive',FStream.fieldbyname('BExclusive').AsString);
    Body:=Body + Addtag('InvoiceDiscount',FStream.fieldbyname('FInvoiceDiscount').AsString);
    Body:=Body + Addtag('DocAmount',FStream.fieldbyname('FDocAmount').AsString);
    Body:=Body + Addtag('TaxAmount',FStream.fieldbyname('FTaxAmount').AsString);
    Body:=Body + Addtag('PaymentType','none');
    Body:=Body + Addtag('PaymentGroup','none');
    Body:=Body + Addtag('Salesperson',FStream.fieldbyname('SSalesperson').AsString);

    Body:=Body + Addtag('PostCompany',FStream.fieldbyname('SPostCompany').AsString);
    Body:=Body + Addtag('PostContact',FStream.fieldbyname('SPostContact').AsString);
    Body:=Body + Addtag('DelCompany',FStream.fieldbyname('SDelCompany').AsString);
    Body:=Body + Addtag('DelContact',FStream.fieldbyname('SDelContact').AsString);
    Body:=Body + Addtag('TaxRef',FStream.fieldbyname('STAXREF').AsString);





    Body:=Body + Addtag('Postal1',FStream.fieldbyname('SPost1').AsString);
    Body:=Body + Addtag('Postal2',FStream.fieldbyname('SPost2').AsString);
    Body:=Body + Addtag('Postal3',FStream.fieldbyname('SPost3').AsString);
    Body:=Body + Addtag('PostalCode',FStream.fieldbyname('SPostCode').AsString);
    Body:=Body + Addtag('PosCountry',FStream.fieldbyname('SPostCountry').AsString);
    Body:=Body + Addtag('Msg1',FStream.fieldbyname('SMsg1').AsString);
    Body:=Body + Addtag('Msg2',FStream.fieldbyname('SMsg2').AsString);
    Body:=Body + Addtag('Msg3',FStream.fieldbyname('SMsg3').AsString);
    Body:=Body + Addtag('DelAddr1',FStream.fieldbyname('SDel1').AsString);
    Body:=Body + Addtag('DelAddr2',FStream.fieldbyname('SDel2').AsString);
    Body:=Body + Addtag('DelAddr3',FStream.fieldbyname('SDel3').AsString);
    Body:=Body + Addtag('DelCode',FStream.fieldbyname('SDelCode').AsString);
    Body:=Body + Addtag('DelCountry',FStream.fieldbyname('SDelCountry').AsString);
    Body:=Body + Addtag('RepGroup1',FStream.fieldbyname('SGroup1').AsString);
    Body:=Body + Addtag('RepGroup2',FStream.fieldbyname('SGroup2').AsString);
    Body:=Body + Addtag('Currency',FStream.fieldbyname('SCurrency').AsString);
    Body:=Body + Addtag('SysDate',DateTime2TxfStr(FStream.fieldbyname('DSysDate').AsDateTime));
    Body:=Body + Addtag('UserName',FStream.fieldbyname('SUserName').AsString);
    Body:=Body + '</docinfo>';
    Body:=Body + '<linesdetail>';
    While Not lStream.Eof do
    begin
      {Add Stock Items here}
      (*
      if Pos('<wstockid>'+lStream.FieldByname('wstockid').asString+'</wstockid>',StcLst)<=0 then
      if dmDatabase.tblStock.Locate('WStockID',lStream.FieldByname('WStockID').AsInteger,[]) then
      begin
        StcLst := StcLst + '<stockinfo>'+'<code>'+dmDatabase.tblstockSSTOCKCODE.value+'</code>';
        StcLst := StcLst + '<wstockid>'+dmDatabase.tblstockWStockID.AsString+'</wstockid>';
        StcLst := StcLst + '<description>'+dmDatabase.tblstockSdescription.AsString+'</description>';
        StcLst := StcLst + '</stockinfo>';
      end;
      *)
      AddStockItemToTxf(lStream.FieldByname('wstockid').asInteger,StcLst,AccLst);
      Body:=Body + '<lineitem>';
      {Export Doc Lines}
      Body:=Body + Addtag('Docid',FStream.fieldbyname('WDocID').AsString);
      Body:=Body + Addtag('type',lStream.fieldbyname('WLineTypeID').AsString);
      Body:=Body + Addtag('linenbr',lStream.fieldbyname('WDocLineID').AsString);
      Body:=Body + Addtag('StockCode',lStream.fieldbyname('SSTOCKCODE').AsString);
      Body:=Body + Addtag('Description',lStream.fieldbyname('SDescription').AsString);
      Body:=Body + Addtag('QtyOrdered',lStream.fieldbyname('FQtyOrdered').AsString);
      Body:=Body + Addtag('QtyShipped',lStream.fieldbyname('FQtyShipped').AsString);
      Body:=Body + Addtag('SellingPrice',lStream.fieldbyname('FSellingPrice').AsString);
      Body:=Body + Addtag('ItemDiscount',lStream.fieldbyname('FItemDiscount').AsString);
      Body:=Body + Addtag('InclusiveAmt',lStream.fieldbyname('FInclusiveAmt').AsString);
      Body:=Body + Addtag('ExclusiveAmt',lStream.fieldbyname('FExclusiveAmt').AsString);
      Body:=Body + Addtag('TaxAmount',lStream.fieldbyname('FTaxAmount').AsString);
      Body:=Body + Addtag('TaxCode',lStream.fieldbyname('SACCOUNTCODE').AsString);
      Body:=Body + Addtag('StockCode',lStream.fieldbyname('SSTOCKCODE').AsString);
      Body:=Body + Addtag('Barcode',lStream.fieldbyname('SBARCODENUMBER').AsString);



      Body:=Body + '</lineitem>';

      lStream.Next;
    end;
      lDStream.Filtered := False;
      lDStream.Filter:='WDocID='+IntToStr(FStream.FieldByname('WDocID').AsInteger)  ;
      lDStream.Filtered := True;
      lDStream.First ;

       lDStream.First ;
       while not lDStream.Eof do
           begin
             Body:=Body + '<linedetail>';
             Body:=Body + Addtag('Docid',lDStream.fieldbyname('WDocID').AsString);
             Body:=Body + Addtag('linenbr',lDStream.fieldbyname('WDocLineID').AsString);
             Body:=Body + Addtag('Option1name',lDStream.fieldbyname('SOPTION1NAME').AsString);
             Body:=Body + Addtag('Optionvalue1name',lDStream.fieldbyname('SOPTIONVALUE1NAME').AsString);
             Body:=Body + Addtag('Option2name',lDStream.fieldbyname('SOPTION2NAME').AsString);
             Body:=Body + Addtag('Optionvalue2name',lDStream.fieldbyname('SOPTIONVALUE2NAME').AsString);
             Body:=Body + Addtag('Option3name',lDStream.fieldbyname('SOPTION3NAME').AsString);
             Body:=Body + Addtag('Optionvalue3name',lDStream.fieldbyname('SOPTIONVALUE3NAME').AsString);
             Body:=Body + Addtag('Option4name',lDStream.fieldbyname('SOPTION4NAME').AsString);
             Body:=Body + Addtag('Optionvalue4name',lDStream.fieldbyname('SOPTIONVALUE4NAME').AsString);
             Body:=Body + Addtag('Option5name',lDStream.fieldbyname('SOPTION5NAME').AsString);
             Body:=Body + Addtag('Optionvalue5name',lDStream.fieldbyname('SOPTIONVALUE5NAME').AsString);
             Body:=Body + Addtag('Qty',lDStream.fieldbyname('FQTY').AsString);
             Body:=Body + Addtag('Price',lDStream.fieldbyname('FPRICE').AsString);
             lDStream.Next ;
             Body:=Body + '</linedetail>';
           end;

    Body:=Body + '</linesdetail>';
    Body:=Body + '</doctrans>';
    FStream.Next;
  end;
  {Write now to sr eate}
  {}
  AccLst:= TxfSign +'<txf>'+'<acclist>'+AccLst+'</acclist>';
  aStream.Write(AccLst[1],length(AccLst));
  StcLst:=eline+'<stocklist>'+StcLst+'</stocklist>';
  aStream.Write(StcLst[1],length(StcLst));
  Body := '<doclist>'+eline+ Body + eline + '</doclist>'+eline;
  aStream.Write(Body[1],length(Body));
  Body:='</txf>'+'</TCASH3>';
  aStream.Write(Body[1],length(Body));
  dmDatabase.tblStock.Close;
  dmDatabase.tblAccount.Close;
end;

Function WriteDocTxfToFile(FStream,LStream,lDStream:TDataset;aFile:string):Integer;
Var
  aStream:TFileStream;
begin
  Result:=1;
  Try
    aFile := ChangeFileExt(aFile,'.txf');
    aStream:=TFileStream.Create(aFile,fmCreate);
    Result := WriteDocTxf(FStream,LStream,lDStream,aStream);
  Finally aStream.Free; end;
end;

Function WriteDocTxfToStr(FStream,LStream,lDStream:TDataset):Integer;
Var
  aStream:TStringStream;
begin
  Result:=1;
  Try
    aStream:=TStringStream.Create('');
    Result := WriteDocTxf(FStream,LStream,lDStream,aStream);
    tmpstrs1:= aStream.DataString;
  Finally aStream.Free; end;
end;

Function WriteDocListToStr(filter:String;Var StrResult:String):integer;
begin
  Try
    OpenDocSql(filter,'');
    StrResult:='';
    if dmDatabase.qryDocHead.Active then
    begin
      dmDatabase.qryDocHead.First;
      StrResult:='<doclist>';
      While not dmDatabase.qryDocHead.Eof do
      begin
        StrResult:=StrResult+'<record>'+ eline;
        StrResult:=StrResult+ Addtag('Number', dmDatabase.qryDocHead.FieldByname('SDocNo').AsString);
        StrResult:=StrResult+ Addtag('Account', dmDatabase.qryDocHead.FieldByname('SACCOUNTCODE').Text);
        StrResult:=StrResult+ Addtag('Name', dmDatabase.qryDocHead.FieldByname('SDescription').AsString);
        StrResult:=StrResult+ Addtag('Posted', dmDatabase.qryDocHead.FieldByname('BPosted').AsString);
        StrResult:=StrResult+ Addtag('Printed', dmDatabase.qryDocHead.FieldByname('BPrinted').AsString);
        StrResult:=StrResult+ Addtag('Date', Date2TxfStr(dmDatabase.qryDocHead.FieldByname('DDate').AsDateTime));
  (*
   SQL.Add('       DocHead.WMessage1ID, DocHead.WMessage2ID, DocHead.FInvoiceDiscount,DocHead.WMessage3ID,');
   SQL.Add('       DocHead.WDelAddress1ID, DocHead.WDelAddress2ID, DocHead.WDelAddress3ID,');
   SQL.Add('       DocHead.WDelCodeID, DocHead.WAccountID, Account.WAccountID,');
   SQL.Add('       DocHead.WSalesmanID,DocHead.WCurrencyID,DocHead.WPaymentTypeID,');
   SQL.Add(' DocHead.BRepeating ,DocHead.WSourceTYpeID,');
   SQL.Add('      DocHead.WUserID');
   *)
        StrResult:=StrResult+'</record>'+ eline;
        dmDatabase.qryDocHead.Next;
      end;
      dmDatabase.qryDocHead.Close;
      StrResult:=StrResult+'</doclist>'+ eline;
    end;
    StrResult:=TxfSign + eline+'<txf>'+StrResult+'</TCASH3>';
  except
    Result := 1;
  end;
end;

Function TransaformDstoCds(aDataset:TDataset):String;
Var
  aProvider:TDatasetProvider;
  cds:TClientDataset;
  H:Boolean;
begin
  Result:='';
  Try
    cds:=TClientDataset.Create(Application);
    aProvider:=TDatasetProvider.Create(Application);
    aProvider.Name:='cdsPrv1';
    aProvider.ResolveToDataSet:=False;
    aProvider.DataSet:=aDataset;
    cds.ProviderName:=aProvider.Name;
    H := aDataset.Active;
    aDataset.Open;
    cds.Active:=true;
    Result:=cds.XMLData;
    cds.Close;
    aDataset.Active := H;
  Finally
    cds.Free;
    aProvider.Free;
  end;
end;

(*
Function ReadReconData(BankCode:String;UntilDate:TDate;Var StrResult:string):Integer;
begin
  StrResult:='';
  BankCode:=Trim(BankCode);
  if BankCode='' then exit;
  if Length(BankCode)=7 then
    if BankCode[1] in ['b','B'] then
      Delete(BankCode,1,1);
  dmDatabase.tblAccount.Open;
  if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTYpeID',VarArrayOf([BankCode,3]),[loCaseInsensitive]) then
  begin
    Result := CheckGetReconData(dmDatabase.tblAccountWAccountID.Value,UntilDate,tmpstrs1,tmpstrs2,ftmp);
    if Result=0 then
      StrResult := TransaformDstoCds(dmDatabase.tblBank);
    dmDatabase.tblBank.Close;
  end;
  dmDatabase.tblAccount.Close;
end;
*)

Function ImportXmlDtCr(FStream:TClientDataSet;LogFile:String=''):integer;
var
  AccCode : String;
  AccT:Char;
  Procedure FieldSetCred(Dest,Src:String);
  begin
    FieldSetter(dmDatabase.tblCreditor,FStream,Dest,Src);
  end;
  Procedure FieldSetDeb(Dest,Src:String);
  begin
    FieldSetter(dmDatabase.tblDebtor,FStream,Dest,Src);
  end;
begin
   FStream.Open;
  if assigned(OnImportClientDataset) then
     OnImportClientDataset(FStream,'DEBTORCREDITOR');

  _SetProgress(gettextlang(2184),0);
  _SetProgress(FStream.RecordCount);
  try
  FStream.First;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblDebtor.Open;
  dmDatabase.tblCreditor.Open;
  dmDatabase.tblGroups.Open;
  Result := 0;
  Try
    While not  FStream.Eof And (Result=0) do
    begin
      AccCode := UpperCase(Trim( FStream.FieldByName('SACCOUNTCODE').AsString));
      _SetProgress(gettextlang(2184),FStream.RecNo);
      if AccCode='' then
      begin
         FStream.Next;
        Continue;
      end;
      if (Length(AccCode) > DMTCCoreLink.MainAccountLength + 4) then
         raise EConvertError.create('Invalide Accountlenght expected maximum ' + IntToStr(MainAccountLength + 4) + ' actualy ' + IntToStr(Length(AccCode)) +' for accountcode' + AccCode);

      AccT := AccCode[1];
      Delete(AccCode,1,1);
     // done : Pieter i gess its account code 2 right im not soing it import
     EditAccountRecord(AccT+AccCode,FStream.FieldByName('SDescription').Value,FStream.FieldByName('SGroup1').AsString,
           FStream.FieldByName('SGroup2').AsString,False,FStream.FieldByName('Bopenitem').Asinteger,FStream.FieldByName('BInactive').Asinteger);
      Case Char2AccountType(AccT) of
      2:Begin {Creditors}
           if dmDatabase.tblCreditor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]) then
           begin
             If CanUserAccesSACCOUNT(CurrentUser,Char2AccountType(AccT)) then
               dmDatabase.tblCreditor.Edit
             else
             begin
                FStream.Next;
               Continue;
             end
           end
           else
             dmDatabase.tblCreditor.Append;
          dmDatabase.tblCreditorWAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
          FieldSetCred('SPostal1' ,'Spostal1');
          FieldSetCred('SPostal2' ,'Spostal2');
          FieldSetCred('SPostal3' ,'Spostal3');
          FieldSetCred('SPostalCode' ,'SpostalCode');
          FieldSetCred('sDelivery1' ,'sDelivery1');
          FieldSetCred('sDelivery2' ,'sDelivery2');
          FieldSetCred('sDelivery3' ,'sDelivery3');
          FieldSetCred('STelephone1' ,'STelephone1');
          FieldSetCred('STelephone2' ,'STelephone2');
          FieldSetCred('SEMail' ,'SEmail');
          FieldSetCred('SFax' ,'SFax');
          FieldSetCred('FCREDITLimit' ,'FCREDITLimit');
          FieldSetCred('FChargeAmount' ,'FChargeAmount');
          FieldSetCred('FDiscount' ,'FDiscount');
          FieldSetCred('SMessage' ,'SMessage');
          FieldSetCred('WDefaultPriceTypeID' ,'WDefaultPriceTypeID');
          FieldSetCred('DLastActivity' ,'DLastActivity');
          FieldSetCred('Sreference' ,'Sreference');

          FieldSetCred('WBANKNAME' ,'SBANKNAME');
          FieldSetCred('SBRANCHCODE' ,'SBRANCHCODE');
          FieldSetCred('SBANKACCOUNTNUMBER' ,'SBANKACCOUNTNUMBER');
          FieldSetCred('SBANKACCOUNTNAME' ,'SBANKACCOUNTNAME');

          FieldSetCred('SCOMPANYREGNO' ,'SCOMPANYREGNO');
          FieldSetCred('SFREEFIELD1' ,'SFREEFIELD1');
          FieldSetCred('SFREEFIELD2' ,'SFREEFIELD2');
          FieldSetCred('SFREEFIELD3' ,'SFREEFIELD3');
          FieldSetCred('WDUEDAYS' ,'WDUEDAYS');

          FieldSetCred('WDUEDAYS' ,'WDUEDAYS');

         FieldSetterWithValue(dmDatabase.tblCreditor,'WPOSTCOUNTRIES_ID',TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SPostCountry').AsString));
         FieldSetterWithValue(dmDatabase.tblCreditor,'WDELCOUNTRIES_ID',TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SDelCountry').AsString));



          dmDatabase.tblCreditorWDEFAULTACCOUNT.AsInteger := 0 ;
          AccCode := UpperCase(Trim( FStream.FieldByName('SDEFAULTACCOUNT').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              dmDatabase.tblCreditorWDEFAULTACCOUNT.AsInteger := GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;

          dmDatabase.tblCreditorWDEFAULTTAX.AsInteger := 0 ;
          AccCode := UpperCase(Trim( FStream.FieldByName('SDEFAULTTAX').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              dmDatabase.tblCreditorWDEFAULTTAX.AsInteger := GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;

          FieldSetterWithValue(dmDatabase.tblCreditor,'WContactID',GetAddGetContact(
          trim(FStream.FieldByName('SContactName').asstring),
          trim(FStream.FieldByName('STelephone1').asstring),
          trim(FStream.FieldByName('STelephone2').asstring),
          trim(FStream.FieldByName('SFax').asstring),
          trim(FStream.FieldByName('SEMail').asstring),dmDatabase.tblAccountWAccountID.Value));
          dmDatabase.tblCreditorDSysDate.Value := Now;
          dmDatabase.tblCreditor.Post;
        end;
      1:begin
        {Debtors}
           if dmDatabase.tblDebtor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]) then
           begin
             If CanUserAccesSACCOUNT(CurrentUser,Char2AccountType(AccT)) then
               dmDatabase.tblDebtor.Edit
             else
             begin
                FStream.Next;
               Continue;
             end
           end
           else
             dmDatabase.tblDebtor.Append;
          dmDatabase.tblDebtorWAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
          FieldSetDeb('SPostal1' ,'Spostal1') ;
          FieldSetDeb('SPostal2' ,'Spostal2');
          FieldSetDeb('SPostal3' ,'Spostal3');
          FieldSetDeb('SPostalCode' ,'SpostalCode');
          FieldSetDeb('sDelivery1' ,'sDelivery1');
          FieldSetDeb('sDelivery2' ,'sDelivery2');
          FieldSetDeb('sDelivery3' ,'sDelivery3');
          FieldSetDeb('sDeliveryCode' ,'sDeliveryCode');
          FieldSetDeb('STelephone1' ,'STelephone1');
          FieldSetDeb('STelephone2' ,'STelephone2');
          FieldSetDeb('SEMail' ,'SEmail');
          FieldSetDeb('SFax' ,'SFax');
          FieldSetDeb('FCREDITLimit' ,'FCREDITLimit');
          FieldSetDeb('FChargeAmount' ,'FChargeAmount');
          FieldSetDeb('FDiscount' ,'FDiscount');
          FieldSetDeb('FInterest' ,'FInterest');
          FieldSetDeb('SMessage' ,'SMessage');
          FieldSetDeb('WDefaultPriceTypeID' ,'WDefaultPriceTypeID');
          FieldSetDeb('DLastActivity' ,'DLastActivity');
          FieldSetDeb('Sreference' ,'Sreference');
          
          FieldSetDeb('WDUEDAYS' ,'WDUEDAYS');
          FieldSetDeb('SCOMPANYREGNO' ,'SCOMPANYREGNO');
          FieldSetDeb('SFREEFIELD1' ,'SFREEFIELD1');
          FieldSetDeb('SFREEFIELD2' ,'SFREEFIELD2');
          FieldSetDeb('SFREEFIELD3' ,'SFREEFIELD3');

          FieldSetDeb('SBANKNAME' ,'SBANKNAME');
          FieldSetDeb('SBRANCHCODE' ,'SBRANCHCODE');
          FieldSetDeb('SBANKACCOUNTNUMBER' ,'SBANKACCOUNTNUMBER');
          FieldSetDeb('SBANKACCOUNTNAME' ,'SBANKACCOUNTNAME');
          FieldSetDeb('SCREDITCARDNUMBER' ,'SCREDITCARDNUMBER');
          FieldSetDeb('SCREDITCARDTYPE' ,'SCREDITCARDTYPE');
          FieldSetDeb('SCREDITCARDHOLDER' ,'SCREDITCARDHOLDER');

          dmDatabase.tblDebtorWDEFAULTACCOUNT.AsInteger := 0 ;
          AccCode := UpperCase(Trim( FStream.FieldByName('SDEFAULTACCOUNT').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              dmDatabase.tblDebtorWDEFAULTACCOUNT.AsInteger := GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;

          dmDatabase.tblDebtorWDEFAULTTAX.AsInteger := 0 ;
          AccCode := UpperCase(Trim( FStream.FieldByName('SDEFAULTTAX').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              dmDatabase.tblDebtorWDEFAULTTAX.AsInteger := GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;


          FieldSetterWithValue(dmDatabase.tblDebtor,'WPOSTCOUNTRIES_ID',TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SPostCountry').AsString));
          FieldSetterWithValue(dmDatabase.tblDebtor,'WDELCOUNTRIES_ID',TDataBaseRoutines.GetAddCountryId(FStream.FieldByName('SDelCountry').AsString));

          FieldSetterWithValue(dmDatabase.tblDebtor,'WSalesmanID',GetAddReportingGrpStr(31,FStream.FieldByName('SSalesperson').Value,True));

         // FieldSetDeb('WSalesmanID',GetAddReportingGrpStr(31,FStream.FieldByName('SSalesperson').Value,True));
          FieldSetterWithValue(dmDatabase.tblDebtor,'WContactID',GetAddGetContact(
          trim(FStream.FieldByName('SContactName').asstring),
          trim(FStream.FieldByName('STelephone1').asstring),
          trim(FStream.FieldByName('STelephone2').asstring),
          trim(FStream.FieldByName('SFax').asstring),
          trim(FStream.FieldByName('SEMail').asstring),dmDatabase.tblAccountWAccountID.Value));
          dmDatabase.tblDebtorDSysDate.Value := Now;
          dmDatabase.tblDebtor.Post;
        end;
      else
      end;
       FStream.Next;
    end;
  except
    On E:Exception do
    begin
      Result :=2047;
      SMsgErr := e.Message + ' While Recording Account Information for "'+AccCode+'"';
    end;
  end;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblDebtor.Close;
  dmDatabase.tblCreditor.Close;
  dmDatabase.tblGroups.Close;
//  FStream.Close;
//  FStream.Free;
  finally
  _SetProgress(-2);
  end; 
end;
Function ImportStreamAccounts(FStream:TClientDataSet;LogFile:String=''):integer;
Var
  AccCode:String;
  AccT:Char;
  tmpID:Integer;
  Function CheckIncome:Boolean;
  begin
    Result := false ;
    // messes up import so lets stay of the bank tax and generalleders
    // just general leders can be proffit loss accoutns
    if (Char2AccountType(AccT) in [1,2,3,4]) then
      Result := false
    else  begin
           if not FStream.FieldByName('BIncomeExpense').IsNull then
           Result := FStream.FieldByName('BIncomeExpense').AsInteger = 1
       end;
  end;
begin
   FStream.Open;
  if assigned(OnImportClientDataset) then
     OnImportClientDataset(FStream,'ACCOUNTS');   
  _SetProgress(gettextlang(2070),0);
  _SetProgress(FStream.RecordCount);
  FStream.First;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblBank.Open;
  dmDatabase.tblTax.Open;
  dmDatabase.tblGroups.Open;
  Result := 0;
  Try
    While (not FStream.Eof) AND (Result=0) do
    begin
      AccCode := UpperCase(Trim( FStream.FieldByName('SACCOUNTCODE').AsString));
      if AccCode='' then
      begin
         FStream.Next;
        Continue;
      end;
      if (Length(AccCode) <> DMTCCoreLink.MainAccountLength + 4) and (AccCode <> 'T' ) then
         raise EConvertError.create('Invalide Accountlenght expected ' + IntToStr(MainAccountLength + 4) + ' actualy ' + IntToStr(Length(AccCode)) +' for accountcode' + AccCode);
      AccT := AccCode[1];
      Delete(AccCode,1,1);
      _SetProgress(gettextlang(2070),FStream.RecNo);
      EditAccountRecord(AccT+AccCode,FStream.FieldByName('SDescription').Value,FStream.FieldByName('SGroup1').AsString,
               FStream.FieldByName('SGroup2').AsString,CheckIncome,FStream.FieldByName('Bopenitem').Asinteger,FStream.FieldByName('BInactive').Asinteger );
      Case Char2AccountType(AccT) of
      3:Begin {Bank}
           if dmDatabase.tblBank.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]) then
           begin
             If CanUserAccesSACCOUNT(CurrentUser,3) then
               dmDatabase.tblBank.Edit
             else
             begin
                FStream.Next;
               Continue;
             end
           end
           else
             dmDatabase.tblBank.Append;
          dmDatabase.tblBankWAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
          tmpID := GetBatchTypeID(FStream.FieldByName('SReceipt').AsString);
          if tmpID>0 then
            dmDatabase.tblBankWReceiptsID.Value := tmpID;
          tmpID := GetBatchTypeID(FStream.FieldByName('SPayment').AsString);
          if tmpID>0 then
            dmDatabase.tblBankWPaymentsID.Value := tmpID;
          dmDatabase.tblBank.Post;
          {I should Test if These two batches are set are cashbook}
        end;
      4:begin {Tax}
           if dmDatabase.tblTax.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]) then
           begin
             If CanUserAccesSACCOUNT(CurrentUser,4) then
               dmDatabase.tblTax.Edit
             else
             begin
                FStream.Next;
               Continue;
             end
           end
           else
             dmDatabase.tblTax.Append;
           dmDatabase.tblTaxWAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
           dmDatabase.tblTaxDStartDate.AsDateTime :=  FStream.FieldByName('DStartDate').AsDatetime  ;
           dmDatabase.tblTaxDEndDate.AsDateTime :=  FStream.FieldByName('DEndDate').AsDatetime  ;
           if FStream.FieldByName('FRate').AsFloat <> 0 then
           dmDatabase.tblTaxFRate.AsFloat := FStream.FieldByName('FRate').AsFloat ;
           dmDatabase.tblTax.Post;
        end;
      else
      end;
      FStream.Next;
    end;
  except
    on e : EConvertError do
     begin
       raise Exception.Create(e.Message);
     end else
    Result :=1;
  end;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblTax.Close;
  dmDatabase.tblBank.Close;
  dmDatabase.tblGroups.Close;
//  FStream.Close;
//  FStream.Free;
  _SetProgress(-2);
end;

Function  ImportDtCtAndAccountsFromTextFile(aFileName:string;ASeperator : Char;RecEdit:Boolean=True;DEDCRED:Boolean=True;LogFile:String=''):integer;
Var
  FieldExist : Boolean ; 
  MyFile,MyHeaders,MyValues : TStringList ;
  FStream:TClientDataSet;
  function ReadField(AName : String;var Exist : Boolean) : String ;
  var
  FieldIndex : Integer;
  strSource : String ;
    pSource : PChar ;
  begin
    result := '' ;
    Exist := false ;
    for FieldIndex := 0 to MyHeaders.Count-1 do
      if  uppercase(MyHeaders[FieldIndex]) = uppercase(AName) then
        begin
           Exist := true ;
           if MyValues.Count > FieldIndex then
               result := trim(MyValues[FieldIndex]) ;
           // AName:= Result ;
           strSource := Result ;
           pSource := pchar(strSource) ;
           strSource := AnsiExtractQuotedStr(pSource,'"');
           if (strSource <> '') and (strSource <> '""') then
              Result := strSource ;
             if Result = '""' then result := '' ; 
             exit ;
        end;
  end;


  Function CheckFields:Boolean;
  Var
    I : Integer;
  begin
    For i:=0 to FStream.FieldCount-1 do
    begin
      ReadField(FStream.Fields[i].FieldName ,Result);
      if Not Result then
          begin
          Showmessage('Field '+ FStream.Fields[i].FieldName +' not found in import!');
          Break;
          end;
    end;
  end;
  Function LoadWk1Content:Integer;
  Var
    I,Lines,Count,LineCount:integer;
    Ok:Boolean;
  begin
    Result := 1;{Error On Loading WK1}
    if FileExists(aFileName) then
    begin
      MyFile.LoadFromFile(aFileName);
      if MyFile.Count < 2 then exit ;
      MyHeaders.Delimiter := ASeperator ;
      MyValues.Delimiter := ASeperator ;
      MyHeaders.Text :=  StringReplace(StringReplace(MyFile[0],ASeperator,#13+#10,[rfReplaceAll]),'"','',[rfReplaceAll]) ;
      FStream.FieldDefs.Clear;
      CreateXmlFilesDef(FStream,2); {Check if Debtors Wk1 File}
      if DEDCRED then
      begin
      Ok := CheckFields;
      if Not Ok then
      begin
         FStream.FieldDefs.Clear;
         CreateXmlFilesDef(FStream,6); {Check if Creditors Wk1 File}
         Ok := CheckFields ;
      end;
      end else
      begin
        CreateXmlFilesDef(FStream,0);
        Ok := CheckFields ;
      end;
      Count:=0;
      if Ok then
      begin
        _SetProgress(gettextlang(2069),0);

        Lines:=MyFile.Count -2;
        _SetProgress(Lines);
        //FStream.Open; {It's Created And Ready to Go}
        Try

          for LineCount := 1 to MyFile.Count-1 do
          begin
          Inc(Count);
          _SetProgress(IntToStr(Count)+' '+gettextlang(2032)+' '+IntToStr(Lines)+' ' + gettextlang(2017),100);
          MyValues.Text :=  StringReplace(MyFile[LineCount],ASeperator,#13+#10,[rfReplaceAll]) ;

          if  Trim(ReadField('SACCOUNTCODE',FieldExist))<>'' then
          begin
            FStream.Append;

            For i:=0 to FStream.Fields.Count-1 do
              begin
               // done : Pieter try to import even if theres a error.
                try
                  FStream.Fields[i].AsString := ReadField(FStream.Fields[i].FieldName,FieldExist);
                except
                  On e : Exception do
                    begin

                       if ShowQuestionMessage('Error on import with message( ' + e.message +') Do you want to continue?') <> mryes then
                          exit ;
                    end;
                end;
              end;
            FStream.Post;
          end;
          Result :=0;
          end;
        except
          Result := 3;
        end;
      end
      else
      begin
        Result :=3;
      end;
      _SetProgress(-2);
    end;
  end;
begin
  RecImported:=0;
  Result :=0;
  FStream:=TClientDataSet.Create(Nil);

MyFile:= TStringList.create ;
MyHeaders:= TStringList.create ;
MyValues := TStringList.create ;
try
    if LoadWk1Content<>0 then
    begin
      Exit;
    end;
  if DEDCRED then
  Result := ImportXmlDtCr(FStream,LogFile) else
    ImportStreamAccounts(FStream,LogFile);
  finally
    MyFile.free ;
    MyHeaders.free ;
    MyValues.free ;
  FreeAndNil(FStream);
  end;
end;


Function ImportDtCt(aFileName:string;RecEdit:Boolean=True;LogFile:String=''):integer;
Var
  ListFieldNotFound  : String ;
  FExt:String;
  FStream:TClientDataSet;
  Function CheckFields:Boolean;
  Var
    I : Integer;
  begin
    LastErrMsg := '' ;
    For i:=0 to FStream.FieldCount-1 do
    begin
      if UPPERCASE(FStream.Fields[i].FieldName) = 'BOPENITEM' then
         result := true ;
      Result := LtsFieldExists(FStream.Fields[i].FieldName);
      if Not Result then
         begin
         LastErrMsg := ' Field ' + FStream.Fields[i].FieldName + ' not found'  ;
         Break;
         end;
    end;
  end;
  Function LoadWk1Content:Integer;
  Var
    I,Lines,Count:integer;
    Ok:Boolean;
  begin
    Result := 1;{Error On Loading WK1}
    if Open123File(aFileName) then
    begin
      FStream.FieldDefs.Clear;
      CreateXmlFilesDef(FStream,2); {Check if Debtors Wk1 File}
      Ok := CheckFields;
      if Not Ok then
      begin
         FStream.FieldDefs.Clear;
         CreateXmlFilesDef(FStream,6); {Check if Creditors Wk1 File}
         Ok := CheckFields ;
      end;
      Count:=0;
      if Ok then
      begin
        _SetProgress(gettextlang(2069),0);
        Lines:=Row_Count;
        _SetProgress(Lines);
        //FStream.Open; {It's Created And Ready to Go}
        Try
          Inc(Count);
          _SetProgress(IntToStr(Count)+' '+gettextlang(2032)+' '+IntToStr(Lines)+' ' + gettextlang(2017),100);
          GoNext123;
          While Trim(ReadField('SACCOUNTCODE'))<>'' do
          begin
            FStream.Append;

            For i:=0 to FStream.Fields.Count-1 do
              begin
               // done : Pieter try to import even if theres a error.
                try
                  FStream.Fields[i].AsString := ReadField(FStream.Fields[i].FieldName);
                except
                  On e : Exception do
                    begin

                       if ShowQuestionMessage('Error on import with message( ' + e.message +') Do you want to continue?') = mryes then
                          exit ;
                    end;
                end;
              end;
            FStream.Post;
            GoNext123;
          end;
          Result :=0;
        except
          Result := 3;
        end;
      end
      else
      begin
        Result :=3;
      end;
      Close132File;
      _SetProgress(-2);
    end;
  end;
begin
  RecImported:=0;
  Result :=0;
  FStream:=TClientDataSet.Create(Nil);
  FExt:=ExtractFileExt(aFileName);
  if SameText(FExt,'.Txf') then
  begin

  end
  else if SameText(FExt,'.Wk1') then
  begin
    if LoadWk1Content<>0 then
    begin
      FStream.Close;
      FStream.Free;
      Raise Exception.Create(DMTCCoreLink.GetTextLang( 3066{Field missing please check importfile!'}));
    end;
  end
  else if SameText(FExt,'.xml') then
     FStream.LoadFromFile(aFileName);
  Result := ImportXmlDtCr(FStream,LogFile);
  FreeAndNil(FStream);
end;



Function ReadReconData(FromDate,UntilDate:TDatetime;BankCode:String;Var StrResult:string):Integer;
begin
  StrResult:='';
  BankCode:=Trim(BankCode);
  if BankCode='' then exit;
  if Length(BankCode)=7 then
    if BankCode[1] in ['b','B'] then
      Delete(BankCode,1,1);
  dmDatabase.tblAccount.Open;
  if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTYpeID',VarArrayOf([BankCode,3]),[loCaseInsensitive]) then
  begin
    Result := CheckGetReconData(dmDatabase.tblAccountWAccountID.Value,UntilDate,FromDate,tmpstrs1,tmpstrs2,ftmp);
    if Result=0 then
      StrResult := TransaformDstoCds(dmDatabase.tblBank);
    dmDatabase.tblBank.Close;
  end;
  dmDatabase.tblAccount.Close;
end;






Function ImportFileAccounts(aFileName:string;RecEdit:Boolean=True;LogFile:String=''):integer;
Var
  FStream:TClientDataSet;
  FExt :String;

  Function CheckFields:Boolean;
  Var
    I : Integer;
  begin
    For i:=0 to FStream.FieldCount-1 do
    begin
      Result := LtsFieldExists(FStream.Fields[i].FieldName);
      if UPPERCASE(FStream.Fields[i].FieldName) = 'BOPENITEM' then
         result := true ;
      if Not Result then
         begin
         LastErrMsg := ' Field ' + FStream.Fields[i].FieldName + ' not found'  ;
         Break;
         end;
    end;
  end;
  Function LoadWk1Content:Integer;
  Var
    I,Lines,Count:integer;
    Ok:Boolean;
  begin
    Result := 1;{Error On Loading WK1}

    if Open123File(aFileName) then
    begin
      FStream.FieldDefs.Clear;
      CreateXmlFilesDef(FStream,0);
      Ok := CheckFields;
      Count:=0;
      if Ok then
      begin
        _SetProgress(gettextlang(2069),0);
        Lines:=Row_Count;
        _SetProgress(Lines);
        //FStream.Open; {It's Created And Ready to Go}
        Try
          Inc(Count);
          _SetProgress(IntToStr(Count)+' '+gettextlang(2032)+' '+IntToStr(Lines)+' '+ gettextlang(2017),100);
          GoNext123;
          While Trim(ReadField('SACCOUNTCODE'))<>'' do
          begin
            FStream.Append;
            For i:=0 to FStream.Fields.Count-1 do
              try
              if (FStream.Fields[i] is TDateField) or (FStream.Fields[i] is TDateTimeField) then
              FStream.Fields[i].AsDateTime := str2Date(ReadField(FStream.Fields[i].FieldName))
              else
              if (FStream.Fields[i] is TFloatField) then
                  FStream.Fields[i].AsFloat := Str2Float(StringReplace(ReadField(FStream.Fields[i].FieldName),'.',DecimalSeparator,[rfReplaceAll]))
              else
               FStream.Fields[i].AsString := ReadField(FStream.Fields[i].FieldName);
              except
              end;
            FStream.Post;
            GoNext123;
          end;
          Result :=0;
        except
          on e: Exception do
            begin

             Result := 3;
             LastErrMsg := trim(LastErrMsg + ' ' + e.Message);
            end
        end;
      end
      else
      begin
        Result :=3;
      end;
      Close132File;
      _SetProgress(-2);
    end;
  end;
begin
  RecImported:=0;
  Result :=0;
  FStream := TClientDataSet.Create(Nil);
  FExt:=ExtractFileExt(aFileName);
  if SameText(FExt,'.Txf') then
  begin

  end
  else if SameText(FExt,'.Wk1') then
  begin
    Result := LoadWk1Content ;
    if Result<>0 then
    begin
      FStream.Close;
      FStream.Free;
      Exit;
    end;
  end
  else if SameText(FExt,'.xml') then
     FStream.LoadFromFile(aFileName);
  ImportStreamAccounts(FStream,LogFile);
  FreeAndNil(FStream);
  _SetProgress(-2);
end;

Function ImportOFCFile(aFileName:String;aSTream:TStream=nil):Integer;
Var
 New:TSylSax;
 Bankid:Integer;
 Acc:String;
 Bal:Real;
 Bool:Boolean;
 NextLineID: integer;
 Amt:Real;
 ed,sd:Tdate;
begin
  New:=TSylSax.Create(Application);
//  New.OnTagProcess:=MyOnTagProcess;
  if aSTream<>nil then
  begin
    New.FileName:='';
    New.Active:=True;
    New.ReadFromStream(aStream)
  end
  else
  begin
    New.FileName:=aFileName;
    New.Active:=True;
  end;
  dmDatabase.tblBankDnl.sql.text := 'Select * from  DNLBANKS ';
  dmDatabase.tblBankDnl.Open;
  if dmDatabase.tblBankDnl.Locate('WlineTypeID',300,[]) then
  else
  begin
    dmDatabase.tblBankDnl.Append;
    dmDatabase.tblBankDnl.FieldByName('WLineTypeID').AsInteger:=300;
    dmDatabase.tblBankDnl.FieldByName('WlineID').AsInteger := -1;
    dmDatabase.tblBankDnl.FieldByName('WAutoMatchID').AsInteger := dmDatabase.tblBankDnl.RecordCount+1 ;
    dmDatabase.tblBankDnl.Post;
  end;
  NextLineID:=dmDatabase.tblBankDnl.FieldByName('WAutoMatchID').AsInteger;

  Bool:=False;
  Bal :=0;
  BankID:=0;
  While Not New.EOTags do
  begin
    if New.TagName='OFC' then
      Bool:=True
    else if New.TagName='BANKID' then
      Bankid:=New[''].AsInteger
    else if New.TagName='ACCTID' then
      Acc:=New[''].AsString
    else if New.TagName='DTSTART' then
      Sd:=New[''].AsDate
    else if New.TagName='DTEND' then
      ed:=New[''].AsDate
    else if New.TagName='LEDGER' then
      Bal:=New[''].AsFloat
    else if (New.TagName='STMTTRN') And Bool  then
    begin
      New.ScanNow;

      if Not dmDatabase.tblBankDnl.Locate('STransID;SACCOUNTCODE',VarArrayOf([New['FITID'].Value,Acc]),[]) then
      begin
        dmDatabase.tblBankDnl.Append;
        dmDatabase.tblBankDnlBReconciled.Value:=0;
        dmDatabase.tblBankDnlSReference.Value:='';
        dmDatabase.tblBankDnlSACCOUNTCODE.Value := Acc;
        dmDatabase.tblBankDnlWLineTypeID.Value := 0;
        dmDatabase.tblBankDnlWBankID.Value:= Bankid;
        dmDatabase.tblBankDnlSTransID.Value := New['FITID'].Value;
        Amt := New['TRNAMT'].ASFloat ;
        dmDatabase.tblBankDnlFAmount.Value := Abs(Amt);
        dmDatabase.tblBankDnlWAmtSgn.value := 1;
        if Amt<0 then
          dmDatabase.tblBankDnlWAmtSgn.value := -1;
        dmDatabase.tblBankDnlDPostedDate.Value := New['DTPOSTED'].AsDate;
        dmDatabase.tblBankDnlSMemo.Value := New['MEMO'].Value;
        dmDatabase.tblBankDnlSDescription.Value := New['MEMO'].Value;
        dmDatabase.tblBankDnlWTransTypeID.Value:= New['TRNTYPE'].AsInteger;
        dmDatabase.tblBankDnlWlineID.Value := NextLineID;
        dmDatabase.tblBankDnlDSysDate.Value := Now;
        dmDatabase.tblBankDnl.Post;
        Inc(NextLineID);
        if Not dmDatabase.tblBankDnl.Locate('WLineID',-1,[]) then

        ;
        dmDatabase.tblBankDnl.Edit;
        dmDatabase.tblBankDnlWAutoMatchID.Value := NextLineID;
        dmDatabase.tblBankDnl.Post;
      end;
    end;
    New.Next
  end;
  {Save Current Value}
  if Bool then
  begin
    if Not dmDatabase.tblBankDnl.Locate('WLineTypeID;SACCOUNTCODE',VarArrayOf([200,Acc]),[LoCaseInsensitive]) then
    begin
      dmDatabase.tblBankDnl.Append;
      dmDatabase.tblBankDnlSACCOUNTCODE.Value := Acc;
      dmDatabase.tblBankDnlWLineTypeID.Value := 200;
      dmDatabase.tblBankDnlWBankID.Value:= Bankid;
      dmDatabase.tblBankDnlFAmount.Value := bal;
      dmDatabase.tblBankDnlDTransDate.Value := Sd;
      dmDatabase.tblBankDnlDPostedDate.Value := ed;
      dmDatabase.tblBankDnlSMemo.Value := '';
      dmDatabase.tblBankDnlWTransTypeID.Value:= 0;
      dmDatabase.tblBankDnlWlineID.Value := - 2;
      dmDatabase.tblBankDnlWAmtSgn.Value := Sign(Bal);
      dmDatabase.tblBankDnl.Post;
    end
    else
    begin
      if dmDatabase.tblBankDnlDPostedDate.Value <= ed then
      begin
        dmDatabase.tblBankDnl.edit;
        dmDatabase.tblBankDnlDPostedDate.Value := ed;
        dmDatabase.tblBankDnlFAmount.Value := bal;
        dmDatabase.tblBankDnlWAmtSgn.Value := Sign(Bal);        
        dmDatabase.tblBankDnl.Post;        
      end;
    end;

  end;
  dmDatabase.tblBankDnl.Filtered:=False;
  dmDatabase.tblBankDnl.Filter:='WLineTypeID<>200';
  dmDatabase.tblBankDnl.Filtered:=True;
  Result:=1;
end;

Procedure ReadDocFromCSSVToDataSet (FStream , FlStream ,FldStream: TClientDataSet; AFile : String;AsNewDoc : Boolean;AsType : Integer;LastDocAccountid : Integer );
var
 FCSVFile : TStringlist ;
 FCSVHeader,FCSVHeaderLines : TStringlist ;
 FCSVLine : TStringlist ;
 i ,LastType: Integer ;
   ADebtorcreditor : TfmDebtor ;
     AStockentry : TfmStockEntry ;
   SAccCode : String ;
   IAccType : Integer ;
  AFormatSettings : TFormatSettings ;

  Function GetIndex(AName : String ) : Integer ;
  var
   x : Integer ;
  begin
   case LastType of
   1 : FCSVHeader.Text := StringReplace(FCSVHeaderLines[0],#9,#13+#10,[rfReplaceAll]) ;
   2 : FCSVHeader.Text := StringReplace(FCSVHeaderLines[1],#9,#13+#10,[rfReplaceAll]) ;
   3 : FCSVHeader.Text := StringReplace(FCSVHeaderLines[2],#9,#13+#10,[rfReplaceAll]) ;
   end;
   result := 0 ;
   AName := UpperCase(AName) ;
    for x := 0 to FCSVHeader.Count -1 do
      if UpperCase(FCSVHeader[x]) =  AName  then
        result := x ;
   if FCSVLine.Count <= result then
      result := 0 ;

     end;
  Procedure AddDocHrecord;
  begin
    dmDatabase.tblStock.open;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblStock.Filtered := False;
    FStream.Append;

    FStream.fieldbyname('WtypeID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WtypeID')],10);
    FStream.fieldbyname('WDocID').AsInteger :=  StrToIntDef(FCSVLine[GetIndex('WDocID')],0);
    FStream.fieldbyname('DDate').AsDateTime := StrToDateDef( FCSVLine[GetIndex('DDate')],Date,AFormatSettings);
    FStream.fieldbyname('DAllocatedDate').AsDateTime :=StrToDateDef( FCSVLine[GetIndex('DDate')],Date,AFormatSettings);
    FStream.fieldbyname('BPrinted').AsString :=  FCSVLine[GetIndex('BPrinted')];
    FStream.fieldbyname('BPosted').AsString := FCSVLine[GetIndex('BPosted')];
    FStream.fieldbyname('SDocNo').AsString := FCSVLine[GetIndex('SDocNo')];
    FStream.fieldbyname('SACCOUNTCODE').AsString := FCSVLine[GetIndex('SACCOUNTCODE')];
    FStream.fieldbyname('SReference').AsString := FCSVLine[GetIndex('SReference')];
    FStream.fieldbyname('WAccountTypeID').AsString := FCSVLine[GetIndex('WAccountTypeID')];

    FStream.fieldbyname('BExclusive').AsString := FCSVLine[GetIndex('BExclusive')];
    if AsNewDoc and (AsType in [10,11,14]) then
       FStream.fieldbyname('BExclusive').AsInteger := 1 ;
    FStream.fieldbyname('FInvoiceDiscount').AsFloat :=  StrToFloatDef(FCSVLine[GetIndex('FInvoiceDiscount')],0,AFormatSettings);
    FStream.fieldbyname('FDocAmount').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FDocAmount')],0,AFormatSettings);
    FStream.fieldbyname('FTaxAmount').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FTaxAmount')],0,AFormatSettings);

    FStream.fieldbyname('WPaymentTypeID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WPaymentTypeID')],0);
    FStream.fieldbyname('SSalesperson').AsString :=  FCSVLine[GetIndex('SSalesperson')];
    FStream.fieldbyname('SGroup1').AsString :=FCSVLine[GetIndex('SGroup1')];
    FStream.fieldbyname('SGroup2').AsString := FCSVLine[GetIndex('SGroup2')];
    FStream.fieldbyname('SCurrency').AsString := FCSVLine[GetIndex('SCurrency')];
    FStream.fieldbyname('SUserName').AsString := FCSVLine[GetIndex('SUserName')];
    FStream.fieldbyname('DSysDate').AsDateTime := StrToDateDef( FCSVLine[GetIndex('DSysDate')],Date,AFormatSettings);


    if AsNewDoc then
      begin
        FStream.fieldbyname('BPrinted').AsString := '0';
        FStream.fieldbyname('BPosted').AsString := '0';
        FStream.fieldbyname('WtypeID').AsInteger := AsType ;
        FStream.fieldbyname('SDocNo').AsString := TDataBaseDocumentRoutines.GetDocNextNum(AsType) ;
         if LastDocAccountid = 0 then
         begin
            ADebtorcreditor := TfmDebtor.create(Application) ;
            try
             ADebtorcreditor.UseCreditor:=not (AsType in [10,11,14]);
             ADebtorcreditor.AsFindScreen(True) ;
             ADebtorcreditor.ShowModal ;
             if ADebtorcreditor.QDebtorCreditor.IsEmpty then Raise Exception.Create('No accoutn selected');
             LastDocAccountid := ADebtorcreditor.QDebtorCreditorWAccountID.AsInteger ;
            finally
              ADebtorcreditor.free ;
            end;
            TDataBaseRoutines.GetAccountCodeAndTypeFromId(SAccCode,IAccType,LastDocAccountid);

         FStream.fieldbyname('SACCOUNTCODE').AsString :=  SAccCode ;
         FStream.fieldbyname('WAccountTypeID').Asinteger :=  iaccType ;

        end ;
          FStream.fieldbyname('SReference').AsString := FCSVLine[GetIndex('SReference')]  ;

          FStream.fieldbyname('WPaymentTypeID').AsInteger := 0;
          FStream.fieldbyname('SSalesperson').AsString := '';
          FStream.fieldbyname('SGroup1').AsString := '';
          FStream.fieldbyname('SGroup2').AsString :='';
          FStream.fieldbyname('SCurrency').AsString := '';
          FStream.fieldbyname('SUserName').AsString := '';
          FStream.fieldbyname('DSysDate').AsDateTime := now;
    end;

    FStream.fieldbyname('SPostCompany').AsString := FCSVLine[GetIndex('SPostCompany')];
    FStream.fieldbyname('SPostContact').AsString :=FCSVLine[GetIndex('SPostContact')];
    FStream.fieldbyname('SDelCompany').AsString := FCSVLine[GetIndex('SDelCompany')];
    FStream.fieldbyname('SDelContact').AsString := FCSVLine[GetIndex('SDelContact')];
    FStream.fieldbyname('STAXREF').AsString :=FCSVLine[GetIndex('STAXREF')];

    FStream.fieldbyname('SPostCountry').AsString :=FCSVLine[GetIndex('SPostCountry')];
    FStream.fieldbyname('SDelCountry').AsString := FCSVLine[GetIndex('SDelCountry')];

    FStream.fieldbyname('SPost1').AsString := FCSVLine[GetIndex('SPost1')];

    FStream.fieldbyname('SPost2').AsString := FCSVLine[GetIndex('SPost2')];
    FStream.fieldbyname('SPost3').AsString := FCSVLine[GetIndex('SPost3')];
    FStream.fieldbyname('SPostCode').AsString := FCSVLine[GetIndex('SPostCode')];

    FStream.fieldbyname('SMsg1').AsString := FCSVLine[GetIndex('SMsg1')];
    FStream.fieldbyname('SMsg2').AsString := FCSVLine[GetIndex('SMsg2')];
    FStream.fieldbyname('SMsg3').AsString := FCSVLine[GetIndex('SMsg3')];
    FStream.fieldbyname('SDel1').AsString := FCSVLine[GetIndex('SDel1')];
    FStream.fieldbyname('SDel2').AsString := FCSVLine[GetIndex('SDel2')];
    FStream.fieldbyname('SDel3').AsString := FCSVLine[GetIndex('SDel3')];
    FStream.fieldbyname('SDelCode').AsString := FCSVLine[GetIndex('SDelCode')];
    FStream.Post;
  end;
 Procedure AddDocdetrecord;
  begin

    FldStream.Append;
    FldStream.fieldbyname('WDocID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WDocID')],0);
    FldStream.fieldbyname('WDocLineID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WDocLineID')],0);

    FldStream.fieldbyname('SOPTION1NAME').AsString :=  FCSVLine[GetIndex('SOPTION1NAME')] ;
    FldStream.fieldbyname('SOPTIONVALUE1NAME').AsString :=  FCSVLine[GetIndex('SOPTIONVALUE1NAME')] ;

    FldStream.fieldbyname('SOPTION2NAME').AsString :=  FCSVLine[GetIndex('SOPTION2NAME')] ;
    FldStream.fieldbyname('SOPTIONVALUE2NAME').AsString :=  FCSVLine[GetIndex('SOPTIONVALUE2NAME')] ;

    FldStream.fieldbyname('SOPTION3NAME').AsString :=  FCSVLine[GetIndex('SOPTION3NAME')] ;
    FldStream.fieldbyname('SOPTIONVALUE3NAME').AsString :=  FCSVLine[GetIndex('SOPTIONVALUE3NAME')] ;

    FldStream.fieldbyname('SOPTION4NAME').AsString :=  FCSVLine[GetIndex('SOPTION4NAME')] ;
    FldStream.fieldbyname('SOPTIONVALUE4NAME').AsString :=  FCSVLine[GetIndex('SOPTIONVALUE4NAME')] ;

    FldStream.fieldbyname('SOPTION5NAME').AsString :=  FCSVLine[GetIndex('SOPTION5NAME')] ;
    FldStream.fieldbyname('SOPTIONVALUE5NAME').AsString :=  FCSVLine[GetIndex('SOPTIONVALUE5NAME')] ;

    FldStream.fieldbyname('FQTY').AsFloat :=  StrToFloatDef(FCSVLine[GetIndex('FQTY')],0,AFormatSettings);
    FldStream.fieldbyname('FPRICE').AsFloat :=  StrToFloatDef(FCSVLine[GetIndex('FPRICE')],0,AFormatSettings);
    FldStream.Post;
  end;

  Procedure AddDocLrecord;
  begin

    FlStream.Append;
    FlStream.fieldbyname('WDocID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WDocID')],0);
    FlStream.fieldbyname('WSORTNO').AsInteger := StrToIntDef(FCSVLine[GetIndex('WSORTNO')],0);
    FlStream.fieldbyname('WLineTypeID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WLineTypeID')],0);
    FlStream.fieldbyname('WDocLineID').AsInteger := StrToIntDef(FCSVLine[GetIndex('WDocLineID')],0);
    FlStream.fieldbyname('SSTOCKCODE').AsString := FCSVLine[GetIndex('SSTOCKCODE')];
    FlStream.fieldbyname('SBARCODENUMBER').AsString := FCSVLine[GetIndex('SBARCODENUMBER')] ;
    FlStream.fieldbyname('FSellingPrice').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FSellingPrice')],0,AFormatSettings);
    FlStream.fieldbyname('FItemDiscount').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FFItemDiscountPRICE')],0,AFormatSettings);
    FlStream.fieldbyname('FInclusiveAmt').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FInclusiveAmt')],0,AFormatSettings);
    FlStream.fieldbyname('FExclusiveAmt').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FExclusiveAmt')],0,AFormatSettings);
    FlStream.fieldbyname('FTaxAmount').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FTaxAmount')],0,AFormatSettings);
    FlStream.fieldbyname('SDescription').AsString := FCSVLine[GetIndex('SDescription')] ;
    FlStream.fieldbyname('FQtyOrdered').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FQtyOrdered')],0,AFormatSettings);
    FlStream.fieldbyname('FQtyShipped').AsFloat := StrToFloatDef(FCSVLine[GetIndex('FQtyShipped')],0,AFormatSettings);


    if AsNewDoc  AND (FlStream.fieldbyname('WLineTypeID').AsInteger <> 91) then
    begin

        AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SStockcode =' + QuotedStr(FlStream.fieldbyname('SSTOCKCODE').AsString) ;
        AStockentry.tblStockAd.open ;
        if AStockentry.tblStockAd.IsEmpty then
          begin
            if FlStream.fieldbyname('SBarCodeNumber').AsString <> '' then
            AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SBarCodeNumber =' + QuotedStr(FlStream.fieldbyname('SBarCodeNumber').AsString) ;
            AStockentry.tblStockAd.open ;
            if AStockentry.tblStockAd.IsEmpty and (AsType in [10,11,14]) then
              begin
                  AStockentry.AddNewStockItem :=FlStream.fieldbyname('SSTOCKCODE').AsString;
                  AStockentry.StockName    := FlStream.fieldbyname('SDescription').AsString ;
                  AStockentry.StockBarcode   := FlStream.fieldbyname('SBarCodeNumber').AsString ;

                  AStockentry.ShowModal ;

               end;
          end ;



          if AStockentry.tblStockAd.IsEmpty then
             begin
               FlStream.fieldbyname('SDescription').AsString :=FlStream.fieldbyname('SSTOCKCODE').AsString +' ' +  FlStream.fieldbyname('SBarCodeNumber').AsString + ' ' +  FlStream.fieldbyname('FQtyShipped').AsString + ' ' + FlStream.fieldbyname('FExclusiveAmt').AsString;
               FlStream.fieldbyname('WLineTypeID').AsInteger := 91 ;

             end else
          begin

          FlStream.fieldbyname('SSTOCKCODE').AsString := AStockentry.tblStockAdSSTOCKCODE.AsString ;
          FlStream.fieldbyname('SDescription').AsString := AStockentry.tblStockAdSDESCRIPTION.AsString ;
          FlStream.fieldbyname('SBarCodeNumber').AsString := AStockentry.tblStockAdSBARCODENUMBER.AsString ;
          FlStream.fieldbyname('WStockID').AsInteger := AStockentry.tblStockAdWSTOCKID.AsInteger ;

          FlStream.fieldbyname('WTaxID').AsInteger := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WDEFAULTTAX from debtor where WAccountid = ' + IntToStr(LastDocAccountid) +
                                      ' union Select WDEFAULTTAX from creditor where WAccountid = ' + IntToStr(LastDocAccountid))),0);





         if FlStream.fieldbyname('WTaxID').AsInteger = 0 then
         begin
             if (AsType in [10,11,14]) then
              FlStream.fieldbyname('WTaxID').AsInteger :=  AStockentry.tblStockAdWOUTPUTTAXID.AsInteger
              else
             FlStream.fieldbyname('WTaxID').AsInteger :=  AStockentry.tblStockAdWINPUTTAXID.AsInteger ;
         end;
        FlStream.fieldbyname('SACCOUNTCODE').AsString := TDataBaseRoutines.GetAccountCode(FlStream.fieldbyname('WTaxID').AsInteger) ;
        if (AsType in [10,11,14]) then
          begin
             case StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WDEFAULTPRICETYPEID from debtor where waccountid=' + IntToStr(LastDocAccountid) )),0) of
              0 , 1 : FlStream.fieldbyname('FSellingPrice').AsFloat := AStockentry.tblStockAdFSELLINGPRICE1.AsFloat ;
              2 : FlStream.fieldbyname('FSellingPrice').AsFloat :=  AStockentry.tblStockAdFSELLINGPRICE2.AsFloat ;
              3 : FlStream.fieldbyname('FSellingPrice').AsFloat :=  AStockentry.tblStockAdFSELLINGPRICE3.AsFloat ;
             end;
           if DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false) then
              begin
                FlStream.fieldbyname('FSellingPrice').AsFloat := TDataBaseStockRoutines.getStockPrice(LastDocAccountid,FlStream.fieldbyname('WStockID').AsInteger,FlStream.fieldbyname('FQtyShipped').AsFloat)
              end;

              flStream.fieldbyname('FExclusiveAmt').AsFloat :=   FlStream.fieldbyname('FQtyShipped').AsFloat *  FlStream.fieldbyname('FSellingPrice').AsFloat ;

              // reclac tax
              flStream.fieldbyname('FInclusiveAmt').AsFloat :=   flStream.fieldbyname('FExclusiveAmt').AsFloat * TDataBaseRoutines.GetTaxRateOnId(FlStream.fieldbyname('WTaxID').AsInteger);
              FlStream.fieldbyname('FTaxAmount').AsFloat := flStream.fieldbyname('FInclusiveAmt').AsFloat - flStream.fieldbyname('FExclusiveAmt').AsFloat ;
            end;
          end;
    end else
    begin
        FlStream.fieldbyname('SACCOUNTCODE').AsString :=   FCSVLine[GetIndex('SACCOUNTCODE')] ;
        if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',VarArrayOf([ FlStream.fieldbyname('SACCOUNTCODE').AsString,4]),[LoCaseInsensitive]) then
          FlStream.fieldbyname('WTaxID').AsInteger := dmDatabase.tblAccountWAccountID.Value;
        FlStream.fieldbyname('SSTOCKCODE').AsString := FCSVLine[GetIndex('SSTOCKCODE')]  ;
        FlStream.fieldbyname('WStockID').AsInteger:=0;

            dmDatabase.ZQStock.sql.Text := DMTCCoreLink.GetSqlByName('database_selectstockoncode');
            dmDatabase.ZQStock.ParamByName('SStockCode').AsString := FlStream.FieldByName('SSTOCKCODE').AsString;
            dmDatabase.ZQStock.open ;
            if not dmDatabase.ZQStock.IsEmpty then
               FlStream.fieldbyname('WStockID').AsInteger:=dmDatabase.ZQStockWStockID.Value;
    end;

    FlStream.Post;
  end;

begin
  AFormatSettings.DateSeparator := '/' ;
  AFormatSettings.DecimalSeparator := '.' ;
  AFormatSettings.ThousandSeparator := ',' ;
  AFormatSettings.ShortDateFormat := 'yyyy/mm/dd' ;

 AStockentry := TfmStockEntry.create(nil);
 try
 FCSVFile := TStringlist.create ;
 FCSVHeader := TStringlist.create ;
 FCSVHeaderLines := TStringlist.create ;
 FCSVLine := TStringlist.create ;
 try
  LastType := -1 ;
  FCSVFile.LoadFromFile(AFile);
  if FCSVFile.Count < 3 then exit ;
  FCSVHeaderLines.add(FCSVFile[0]) ;
  FCSVHeaderLines.add(FCSVFile[1]) ;
  FCSVHeaderLines.add(FCSVFile[2]) ;


  for i := 3 to FCSVFile.Count -1 do
  begin
   FCSVLine.Text := StringReplace(FCSVFile[i],#9,#13+#10,[rfReplaceAll]) ;
   if FCSVLine.Count = 0 then Continue ;
   LastType := StrToIntDef(Trim(FCSVLine[0]),0);
       case LastType of
       1 :  AddDocHrecord ;
       2 :  AddDocLrecord ;
       3 :  AddDocdetrecord  ;
       end;
  end;
 finally
  FCSVFile.free ;
  FCSVHeader.free ;
  FCSVLine.free ;
 end;
 finally
    AStockentry.free ;
 end;

end;

Function ReadTxfFromStream(aStream:TStream;aFileName:string;UseFile:Boolean=True;AsNewDoc:Boolean=true;AsType:Integer=0):Integer;
Var
  FStream : TClientDataSet;
  FlStream : TClientDataSet;
  FldStream : TClientDataSet;
  FStkStream : TClientDataSet;
  FBatchStream : TClientDataSet;
  FAccounts : TClientDataSet;
  FSupCds : TClientDataSet;
  FDebtors : TClientDataSet;
  FXmlFile : TSylSax;
  tmpTag:String;
  BatPost : Boolean;
  CurrentBatch : String;
  CurrentBatchUserName : String;
  BatAlias,BatUniqueID:String;
  BatInitID, LastDocAccountid:Integer;
  BeditStk : Boolean;
  ClResult:String;
  BatNbrCheck:String;
  FileNbrCheck,SAccCode:String;
  IAccType,RecLineSecNr : Integer ;
  ABatCont : TBatchCon;
  ADebtorcreditor : TfmDebtor ;
  AStockentry : TfmStockEntry ;
    AProgress : TfmNewProgress ;
  ProcesssIndex : Integer ;
  Procedure OpenTables;
  begin
    dmDatabase.tblStock.open;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblStock.Filtered := False;
  end;
  Function txfd(aField:String):String;
  begin
    Result:=Trim(lowerCase(aField));
  end;
  Procedure AddStockItem;
  Begin
    if not AsNewDoc or (not (AsType in [10,11,14])) then
    begin
    if AsNewDoc then
        begin
             AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SStockcode =' + QuotedStr( FXmlFile['code'].AsString) ;
             AStockentry.tblStockAd.open ;
             if AStockentry.tblStockAd.IsEmpty then
             begin
             if FXmlFile['barcode'].AsString <> '' then
             AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SBARCODENUMBER =' + QuotedStr( FXmlFile['barcode'].AsString) ;
             AStockentry.tblStockAd.open ;
             if AStockentry.tblStockAd.IsEmpty then
                begin
                  AStockentry.AddNewStockItem := FXmlFile['code'].AsString ;
                  AStockentry.StockName    := FXmlFile['description'].AsString ;
                  AStockentry.StockBarcode   := FXmlFile['barcode'].AsString ;
                  AStockentry.StockManufacturer  := FXmlFile['manufacturer'].AsString ;
                  AStockentry.ShowModal ;
                end;
              end;
              if AStockentry.tblStockAd.IsEmpty then raise Exception.Create('No stock selected!');
              FStkStream.Append;
              FStkStream.fieldbyname('SSTOCKCODE').AsString := AStockentry.tblStockAdSSTOCKCODE.AsString;
              FStkStream.fieldbyname('Smanufacturer').AsString := AStockentry.tblStockAdSMANUFACTURER.AsString ;
              FStkStream.fieldbyname('SDescription').AsString := AStockentry.tblStockAdSDESCRIPTION.AsString ;
              FStkStream.fieldbyname('SbarCodeNumber').AsString := AStockentry.tblStockAdSBARCODENUMBER.AsString ;
              FStkStream.fieldbyname('SInputTax').AsString := TDataBaseRoutines.GetAccountCode(AStockentry.tblStockAdWOUTPUTTAXID.AsInteger) ;
              FStkStream.fieldbyname('SOutputTax').AsString := TDataBaseRoutines.GetAccountCode(AStockentry.tblStockAdWINPUTTAXID.AsInteger) ;
              FStkStream.fieldbyname('SSaleSACCOUNT').AsString := TDataBaseRoutines.GetAccountCode(AStockentry.tblStockAdWSALESACCOUNTID.AsInteger) ;
              FStkStream.fieldbyname('SCostAccount').AsString := TDataBaseRoutines.GetAccountCode(AStockentry.tblStockAdWCOSTACCOUNTID.AsInteger) ;
              FStkStream.fieldbyname('SStockAccount').AsString := TDataBaseRoutines.GetAccountCode(AStockentry.tblStockAdWSTOCKACCOUNTID.AsInteger) ;
              FStkStream.Post;
        end else
        begin
            OpenTables;
            FStkStream.Append;
            //FStkStream.fieldbyname('WtypeID').AsInteger := FXmlFile['code'].AsInteger;
            FStkStream.fieldbyname('SSTOCKCODE').AsString := FXmlFile['code'].AsString;
            FStkStream.fieldbyname('Smanufacturer').AsString := FXmlFile['manufacturer'].AsString;
            FStkStream.fieldbyname('SDescription').AsString := FXmlFile['description'].AsString;
            FStkStream.fieldbyname('SInputTax').AsString := FXmlFile['intax'].AsString;
            FStkStream.fieldbyname('SOutputTax').AsString := FXmlFile['outax'].AsString;
            FStkStream.fieldbyname('SSaleSACCOUNT').AsString := FXmlFile['SalesAcc'].AsString;
            FStkStream.fieldbyname('SCostAccount').AsString := FXmlFile['costAcc'].AsString;
            FStkStream.fieldbyname('SStockAccount').AsString := FXmlFile['stockAcc'].AsString;
            FStkStream.Post;
        end;
    end;
  end;
  Procedure AddDocHrecord;
  begin
    OpenTables;
    FStream.Append;

    FStream.fieldbyname('WtypeID').AsInteger := FXmlFile['Type'].AsInteger;
    FStream.fieldbyname('WDocID').AsInteger := FXmlFile['Docid'].AsInteger;
    FStream.fieldbyname('DDate').AsDateTime := FXmlFile['Date'].AsDate;
    FStream.fieldbyname('DAllocatedDate').AsDateTime := FStream.fieldbyname('DDate').AsDateTime;
    FStream.fieldbyname('BPrinted').AsString := FXmlFile['Printed'].AsString;
    FStream.fieldbyname('BPosted').AsString := FXmlFile['Posted'].AsString;
    FStream.fieldbyname('SDocNo').AsString := FXmlFile['Number'].asString;
    FStream.fieldbyname('SACCOUNTCODE').AsString := FXmlFile['Acctcode'].AsString;
    FStream.fieldbyname('SReference').AsString := FXmlFile['Reference'].AsString;
    FStream.fieldbyname('WAccountTypeID').AsString := FXmlFile['AcctTypeID'].AsString;

    FStream.fieldbyname('BExclusive').AsString := FXmlFile['Exclusive'].AsString;
    if AsNewDoc and (AsType in [10,11,14]) then
       FStream.fieldbyname('BExclusive').AsInteger := 1 ;
    FStream.fieldbyname('FInvoiceDiscount').AsFloat := FXmlFile['InvoiceDiscount'].AsFloat;
    FStream.fieldbyname('FDocAmount').AsFloat := FXmlFile['DocAmount'].AsFloat;
    FStream.fieldbyname('FTaxAmount').AsFloat := FXmlFile['TaxAmount'].AsFloat;

    FStream.fieldbyname('WPaymentTypeID').AsInteger := FXmlFile['PaymentType'].AsInteger;
    FStream.fieldbyname('SSalesperson').AsString := FXmlFile['Salesperson'].AsString;
    FStream.fieldbyname('SGroup1').AsString := FXmlFile['RepGroup1'].AsString;
    FStream.fieldbyname('SGroup2').AsString := FXmlFile['RepGroup2'].AsString;
    FStream.fieldbyname('SCurrency').AsString := FXmlFile['Currency'].AsString;
    FStream.fieldbyname('SUserName').AsString := FXmlFile['UserName'].AsString;
    FStream.fieldbyname('DSysDate').AsDateTime := FXmlFile['DSysDate'].ASDateTime;


    if AsNewDoc then
      begin
        FStream.fieldbyname('BPrinted').AsString := '0';
        FStream.fieldbyname('BPosted').AsString := '0';
        FStream.fieldbyname('WtypeID').AsInteger := AsType ;
        FStream.fieldbyname('SDocNo').AsString := TDataBaseDocumentRoutines.GetDocNextNum(AsType) ;
         if LastDocAccountid = 0 then
         begin
            ADebtorcreditor := TfmDebtor.create(Application) ;
            try  
             ADebtorcreditor.UseCreditor:=not (AsType in [10,11,14]);
             ADebtorcreditor.AsFindScreen(True) ;
             ADebtorcreditor.ShowModal ;
             if ADebtorcreditor.QDebtorCreditor.IsEmpty then Raise Exception.Create('No accoutn selected');
             LastDocAccountid := ADebtorcreditor.QDebtorCreditorWAccountID.AsInteger ;
            finally
              ADebtorcreditor.free ;
            end;
            TDataBaseRoutines.GetAccountCodeAndTypeFromId(SAccCode,IAccType,LastDocAccountid);

         FStream.fieldbyname('SACCOUNTCODE').AsString :=  SAccCode ;
         FStream.fieldbyname('WAccountTypeID').Asinteger :=  iaccType ;

        end ;
          FStream.fieldbyname('SReference').AsString := trim(FXmlFile['Number'].asString +  ' '  + FXmlFile['Reference'].AsString)   ;

          FStream.fieldbyname('WPaymentTypeID').AsInteger := 0;
          FStream.fieldbyname('SSalesperson').AsString := '';
          FStream.fieldbyname('SGroup1').AsString := '';
          FStream.fieldbyname('SGroup2').AsString :='';
          FStream.fieldbyname('SCurrency').AsString := '';
          FStream.fieldbyname('SUserName').AsString := '';
          FStream.fieldbyname('DSysDate').AsDateTime := now;
    end;

    FStream.fieldbyname('SPostCompany').AsString := FXmlFile['PostCompany'].AsString;
    FStream.fieldbyname('SPostContact').AsString := FXmlFile['PostContact'].AsString;
    FStream.fieldbyname('SDelCompany').AsString := FXmlFile['DelCompany'].AsString;
    FStream.fieldbyname('SDelContact').AsString := FXmlFile['DelContact'].AsString;
    FStream.fieldbyname('STAXREF').AsString := FXmlFile['TaxRef'].AsString;

    FStream.fieldbyname('SPostCountry').AsString := FXmlFile['poscountry'].AsString;
    FStream.fieldbyname('SDelCountry').AsString := FXmlFile['DelCountry'].AsString;

    FStream.fieldbyname('SPost1').AsString := FXmlFile['Postal1'].AsString;
    FStream.fieldbyname('SPost2').AsString := FXmlFile['Postal2'].AsString;
    FStream.fieldbyname('SPost3').AsString := FXmlFile['Postal3'].AsString;
    FStream.fieldbyname('SPostCode').AsString := FXmlFile['PostalCode'].AsString;

    FStream.fieldbyname('SMsg1').AsString := FXmlFile['Msg1'].AsString;
    FStream.fieldbyname('SMsg2').AsString := FXmlFile['Msg2'].AsString;
    FStream.fieldbyname('SMsg3').AsString := FXmlFile['Msg2'].AsString;
    FStream.fieldbyname('SDel1').AsString := FXmlFile['DelAddr1'].AsString;
    FStream.fieldbyname('SDel2').AsString := FXmlFile['DelAddr2'].AsString;
    FStream.fieldbyname('SDel3').AsString := FXmlFile['DelAddr3'].AsString;
    FStream.fieldbyname('SDelCode').AsString := FXmlFile['DelCode'].AsString;








    FStream.Post;
  end;
 Procedure AddDocdetrecord;
  begin

    FldStream.Append;
    FldStream.fieldbyname('WDocID').AsInteger := FXmlFile['Docid'].AsInteger;
    FldStream.fieldbyname('WDocLineID').AsInteger := FXmlFile['linenbr'].AsInteger;

    FldStream.fieldbyname('SOPTION1NAME').AsString := FXmlFile['Option1name'].AsString;
    FldStream.fieldbyname('SOPTIONVALUE1NAME').AsString := FXmlFile['Optionvalue1name'].AsString;

    FldStream.fieldbyname('SOPTION2NAME').AsString := FXmlFile['Option2name'].AsString;
    FldStream.fieldbyname('SOPTIONVALUE2NAME').AsString := FXmlFile['Optionvalue2name'].AsString;

    FldStream.fieldbyname('SOPTION3NAME').AsString := FXmlFile['Option3name'].AsString;
    FldStream.fieldbyname('SOPTIONVALUE3NAME').AsString := FXmlFile['Optionvalue3name'].AsString;

    FldStream.fieldbyname('SOPTION4NAME').AsString := FXmlFile['Option4name'].AsString;
    FldStream.fieldbyname('SOPTIONVALUE4NAME').AsString := FXmlFile['Optionvalue4name'].AsString;

    FldStream.fieldbyname('SOPTION5NAME').AsString := FXmlFile['Option5name'].AsString;
    FldStream.fieldbyname('SOPTIONVALUE5NAME').AsString := FXmlFile['Optionvalue5name'].AsString;

    FldStream.fieldbyname('FQTY').AsFloat := FXmlFile['Qty'].ASFloat;
    FldStream.fieldbyname('FPRICE').AsFloat := FXmlFile['Price'].ASFloat;
    FldStream.Post;
  end;

  Procedure AddDocLrecord;
  begin
    OpenTables;
    inc(RecLineSecNr) ;
    FlStream.Append;
    FlStream.fieldbyname('WDocID').AsInteger := FXmlFile['Docid'].AsInteger;
    FlStream.fieldbyname('WSORTNO').AsInteger := RecLineSecNr ;
    FlStream.fieldbyname('WLineTypeID').AsInteger := FXmlFile['type'].AsInteger;
    FlStream.fieldbyname('WDocLineID').AsInteger := FXmlFile['linenbr'].AsInteger;
    FlStream.fieldbyname('SSTOCKCODE').AsString := FXmlFile['stockCode'].AsString;
    FlStream.fieldbyname('SBARCODENUMBER').AsString := FXmlFile['barcode'].AsString;
    FlStream.fieldbyname('FSellingPrice').AsFloat := FXmlFile['SellingPrice'].AsFloat;
    FlStream.fieldbyname('FItemDiscount').AsFloat := FXmlFile['ItemDiscount'].AsFloat;
    FlStream.fieldbyname('FInclusiveAmt').AsFloat := FXmlFile['InclusiveAmt'].AsFloat;
    FlStream.fieldbyname('FExclusiveAmt').AsFloat := FXmlFile['ExclusiveAmt'].AsFloat;
    FlStream.fieldbyname('FTaxAmount').AsFloat := FXmlFile['TaxAmount'].AsFloat;
    FlStream.fieldbyname('SDescription').AsString := FXmlFile['description'].AsString;
    FlStream.fieldbyname('FQtyOrdered').AsFloat := FXmlFile['qtyordered'].AsFloat;
    FlStream.fieldbyname('FQtyShipped').AsFloat := FXmlFile['qtyshipped'].AsFloat;


    if AsNewDoc  AND (FlStream.fieldbyname('WLineTypeID').AsInteger <> 91) then
    begin
        AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SStockcode =' + QuotedStr(FlStream.fieldbyname('SSTOCKCODE').AsString) ;
        AStockentry.tblStockAd.open ;
        if AStockentry.tblStockAd.IsEmpty then
          begin
            if FlStream.fieldbyname('SBarCodeNumber').AsString <> '' then
            AStockentry.tblStockAd.SQL.Text := 'Select * from stock where SBarCodeNumber =' + QuotedStr(FlStream.fieldbyname('SBarCodeNumber').AsString) ;
            AStockentry.tblStockAd.open ;
            if AStockentry.tblStockAd.IsEmpty and (AsType in [10,11,14]) then
              begin
                  AStockentry.AddNewStockItem :=FlStream.fieldbyname('SSTOCKCODE').AsString;
                  AStockentry.StockName    := FlStream.fieldbyname('SDescription').AsString ;
                  AStockentry.StockBarcode   := FlStream.fieldbyname('SBarCodeNumber').AsString ;
                  AStockentry.StockManufacturer  := FXmlFile['manufacturer'].AsString ;
                  AStockentry.ShowModal ;

               end;
          end ;



          if AStockentry.tblStockAd.IsEmpty then
             begin
               FlStream.fieldbyname('SDescription').AsString :=FlStream.fieldbyname('SSTOCKCODE').AsString +' ' +  FlStream.fieldbyname('SBarCodeNumber').AsString + ' ' +  FlStream.fieldbyname('FQtyShipped').AsString + ' ' + FlStream.fieldbyname('FExclusiveAmt').AsString;
               FlStream.fieldbyname('WLineTypeID').AsInteger := 91 ;

             end else
          begin

          FlStream.fieldbyname('SSTOCKCODE').AsString := AStockentry.tblStockAdSSTOCKCODE.AsString ;
          FlStream.fieldbyname('SDescription').AsString := AStockentry.tblStockAdSDESCRIPTION.AsString ;
          FlStream.fieldbyname('SBarCodeNumber').AsString := AStockentry.tblStockAdSBARCODENUMBER.AsString ;
          FlStream.fieldbyname('WStockID').AsInteger := AStockentry.tblStockAdWSTOCKID.AsInteger ;

          FlStream.fieldbyname('WTaxID').AsInteger := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WDEFAULTTAX from debtor where WAccountid = ' + IntToStr(LastDocAccountid) +
                                      ' union Select WDEFAULTTAX from creditor where WAccountid = ' + IntToStr(LastDocAccountid))),0);





         if FlStream.fieldbyname('WTaxID').AsInteger = 0 then
         begin
             if (AsType in [10,11,14]) then
              FlStream.fieldbyname('WTaxID').AsInteger :=  AStockentry.tblStockAdWOUTPUTTAXID.AsInteger
              else
             FlStream.fieldbyname('WTaxID').AsInteger :=  AStockentry.tblStockAdWINPUTTAXID.AsInteger ;
         end;
        FlStream.fieldbyname('SACCOUNTCODE').AsString := TDataBaseRoutines.GetAccountCode(FlStream.fieldbyname('WTaxID').AsInteger) ;
        if (AsType in [10,11,14]) then
          begin
             case StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WDEFAULTPRICETYPEID from debtor where waccountid=' + IntToStr(LastDocAccountid) )),0) of
              0 , 1 : FlStream.fieldbyname('FSellingPrice').AsFloat := AStockentry.tblStockAdFSELLINGPRICE1.AsFloat ;
              2 : FlStream.fieldbyname('FSellingPrice').AsFloat :=  AStockentry.tblStockAdFSELLINGPRICE2.AsFloat ;
              3 : FlStream.fieldbyname('FSellingPrice').AsFloat :=  AStockentry.tblStockAdFSELLINGPRICE3.AsFloat ;
             end;
           if DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false) then
              begin
                FlStream.fieldbyname('FSellingPrice').AsFloat := TDataBaseStockRoutines.getStockPrice(LastDocAccountid,FlStream.fieldbyname('WStockID').AsInteger,FlStream.fieldbyname('FQtyShipped').AsFloat)
              end;

              flStream.fieldbyname('FExclusiveAmt').AsFloat :=   FlStream.fieldbyname('FQtyShipped').AsFloat *  FlStream.fieldbyname('FSellingPrice').AsFloat ;

              // reclac tax
              flStream.fieldbyname('FInclusiveAmt').AsFloat :=   flStream.fieldbyname('FExclusiveAmt').AsFloat * TDataBaseRoutines.GetTaxRateOnId(FlStream.fieldbyname('WTaxID').AsInteger);
              FlStream.fieldbyname('FTaxAmount').AsFloat := flStream.fieldbyname('FInclusiveAmt').AsFloat - flStream.fieldbyname('FExclusiveAmt').AsFloat ;
            end;
          end;
    end else
    begin
        FlStream.fieldbyname('SACCOUNTCODE').AsString := FXmlFile['TaxCode'].AsString;
        if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',VarArrayOf([ FlStream.fieldbyname('SACCOUNTCODE').AsString,4]),[LoCaseInsensitive]) then
          FlStream.fieldbyname('WTaxID').AsInteger := dmDatabase.tblAccountWAccountID.Value;
        FlStream.fieldbyname('SSTOCKCODE').AsString := FXmlFile['StockCode'].AsString;
        FlStream.fieldbyname('WStockID').AsInteger:=0;

            dmDatabase.ZQStock.sql.Text := DMTCCoreLink.GetSqlByName('database_selectstockoncode');
            dmDatabase.ZQStock.ParamByName('SStockCode').AsString := FlStream.FieldByName('SSTOCKCODE').AsString;
            dmDatabase.ZQStock.open ;
            if not dmDatabase.ZQStock.IsEmpty then
               FlStream.fieldbyname('WStockID').AsInteger:=dmDatabase.ZQStockWStockID.Value;
    end;

    FlStream.Post;
  end;
  Procedure LoadBatch;
  begin
    OpenTables;
    {this test is modified to let the batch name to be appear in BatcTrans tag}
    if (OnlyThisBatch<>'') AND
         Not SameText(CurrentBatch,OnlyThisBatch) Then exit;
    FBatchStream.Append;
    FBatchStream.FieldByName('WBatchID').AsInteger := 0;
    FBatchStream.FieldByName('WPeriodID').AsInteger := 0;
    FBatchStream.FieldByName('Sreference').AsString := FXmlFile['reference'].AsString;
    if FXmlFile['lineid'].AsString <> '' then
    FBatchStream.FieldByName('Wlineid').AsString := FXmlFile['lineid'].AsString;
    if FXmlFile['linkedid'].AsString <> '' then
    FBatchStream.FieldByName('Wlinkedid').AsString := FXmlFile['linkedid'].AsString;
    FBatchStream.FieldByName('DDate').AsDateTime := FXmlFile['Date'].AsDate;
    FBatchStream.FieldByName('SDescription').AsString := FXmlFile['Description'].AsString;
    FBatchStream.FieldByName('FAmount').AsString := FXmlFile['Amount'].AsString;
    FBatchStream.FieldByName('SACCOUNT').AsString := FXmlFile['Account'].AsString;
    FBatchStream.FieldByName('STAXAccount').AsString := FXmlFile['TaxAccount'].AsString;
    FBatchStream.FieldByName('SCONTRAACCOUNT').AsString := FXmlFile['ContraAccount'].AsString;
    FBatchStream.FieldByName('SUserName').AsString := CurrentBatchUserName ;
    FBatchStream.FieldByName('FTaxAmount').AsString := FXmlFile['taxAmount'].AsString;
    FBatchStream.FieldByName('FTaxRate').AsFloat := 0;
    FBatchStream.FieldByName('FTaxRate2').AsFloat := 0;
    FBatchStream.FieldByName('FTax2Amount').AsFloat := 0;
    FBatchStream.FieldByName('FForexAmount').AsFloat := 0;
    FBatchStream.FieldByName('SbatchName').AsString := CurrentBatch;
    FBatchStream.FieldByName('SUniqueID').AsString := BatUniqueID;
    FBatchStream.FieldByName('SAlias').AsString := BatAlias;
    FBatchStream.FieldByName('WBatchID').AsInteger := BatInitID;

    FBatchStream.Post;
  end;
  Procedure ExecTxfSql;
  begin
    TxfRes := SqlToXML(FXmlFile[''].AsString);
    if Pos(String('<?xml'),String(TxfRes))<>0 then
      System.Delete(txfres,1,pos(String('?>'),String(txfres))+1);
  end;
  Procedure ExecuteRqst(aCode:Integer);
  Var
    SubRes,Node:String;
    aList:TStringList;
    dtFrom,DtTo:TDateTime;
    UserID : Integer;
    Procedure PutFilesForUser;
    Var
      Ic:Integer;
    begin
       if aList.Count<=0 then
       begin
         AddTag(Node,'code',IntToStr(aCode));
         AddTag(Node,'filename','');
         AddTag(SubRes,'reply',Node);
       end
       else
       For ic:=0 to aList.Count-1 do
       begin
         Node := '';
         AddTag(Node,'code',IntToStr(aCode));
         AddTag(Node,'filename', GettmpFolder + aList[ic]);
         AddTag(SubRes,'reply',Node);
       end;
    end;
  begin
    SubRes:='';
    aList:=TStringList.Create;
    Try
      Case aCode of
      100: begin
             dtFrom := FXmlFile['Date'].AsDateTime;
             DtTo := Now;
             UserID := GetT3UserID(FXmlFile['UserName'].AsString);
             PrepareExport(aList,dtFrom,DtTo,true,UserID,'XC');
             Node :='';
             PutFilesForUser;
           end;
        101: Begin {Make a backup now}
             //DoBackupTo(Folder,aList);
             aList.Add(LastBackupFileName);
             PutFilesForUser;
            end;
         102 : Begin {Replicate all Opened Batches}
              UserID := GetT3UserID(FXmlFile['UserName'].AsString);
              PrepareBatchRep(aList,UserID,'XC');
              PutFilesForUser;
           end;
      end;
    Finally
      FreeAndNil(aList);
    End;
    ClResult := ClResult + SubRes ;
  end;
  Procedure LoadAccount;
  Var
    S:String;
  begin
  if not AsNewDoc then
    begin
    S:= FXmlFile['Code'].AsString;
    if s='' then exit;
    Case s[1] of
    'c','C': Begin
        FSupCds.Append;
        FSupCds.FieldByName('SACCOUNTCODE').Value := FXmlFile['code'].Value;
        FSupCds.FieldByName('SDescription').Value := FXmlFile['description'].Value;
        FSupCds.FieldByName('BOpenItem').Value := (uppercase(vartoStr(FXmlFile['openitem'].Value)) = 'TRUE');
        with FSupCds do begin

          FieldByName('Spostal1').AsString := FXmlFile['SPostal1'].AsString;
          FieldByName('Spostal2').AsString := FXmlFile['SPostal2'].AsString;
          FieldByName('Spostal3').AsString := FXmlFile['SPostal3'].AsString;
          FieldByName('SpostalCode').AsString := FXmlFile['SPostalCode'].AsString ;
          FieldByName('sDelivery1').AsString := FXmlFile['sDelivery1'].AsString;
          FieldByName('sDelivery2').AsString := FXmlFile['sDelivery2'].AsString ;
          FieldByName('sDelivery3').AsString := FXmlFile['sDelivery3'].AsString;
          FieldByName('STelephone1').AsString := FXmlFile['STelephone1'].AsString ;
          FieldByName('STelephone2').AsString := FXmlFile['STelephone2'].AsString;
          FieldByName('SEmail').AsString := FXmlFile['SEMail'].AsString;
          FieldByName('SFax').AsString := FXmlFile['SFax'].AsString ;
          FieldByName('FCREDITLimit').AsFloat := FXmlFile['FCREDITLimit'].AsFloat;
          FieldByName('FChargeAmount').AsFloat := FXmlFile['FChargeAmount'].AsFloat;
          FieldByName('FDiscount').AsFloat := FXmlFile['FDiscount'].AsFloat;
          FieldByName('BOpenItem').AsString := FXmlFile['BOpenItem'].AsString;
          FieldByName('SMessage').AsString := FXmlFile['SMessage'].AsString;
          FieldByName('WDefaultPriceTypeID').AsString := FXmlFile['WDefaultPriceTypeID'].AsString  ;
          FieldByName('DLastActivity').asstring := FXmlFile['DLastActivity'].asstring ;
          FieldByName('Sreference').AsString := FXmlFile['Sreference'].AsString ;
          FieldByName('BInactive').AsString := FXmlFile['BInactive'].AsString ;
          
         FieldByName('WDUEDAYS').AsString := FXmlFile['WDUEDAYS'].AsString ;
         FieldByName('SCOMPANYREGNO').AsString := FXmlFile['SCOMPANYREGNO'].AsString ;
         FieldByName('SFREEFIELD1').AsString := FXmlFile['SFREEFIELD1'].AsString ;
         FieldByName('SFREEFIELD2').AsString := FXmlFile['SFREEFIELD2'].AsString ;
         FieldByName('SFREEFIELD3').AsString := FXmlFile['SFREEFIELD3'].AsString ;

         FieldByName('SBANKNAME').AsString := FXmlFile['SBANKNAME'].AsString ;
         FieldByName('SBRANCHCODE').AsString := FXmlFile['SBRANCHCODE'].AsString ;
         FieldByName('SBANKACCOUNTNUMBER').AsString := FXmlFile['SBANKACCOUNTNUMBER'].AsString ;
         FieldByName('SBANKACCOUNTNAME').AsString := FXmlFile['SBANKACCOUNTNAME'].AsString ;

         FieldByName('SDelCountry').AsString := FXmlFile['DelCountry'].AsString ;
         FieldByName('SPostCountry').AsString := FXmlFile['PostCountry'].AsString ;

         FieldByName('SGroup1').AsString := FXmlFile['group1'].AsString ;
         FieldByName('SGroup2').AsString := FXmlFile['group2'].AsString ;


        end;
        FSupCds.Post;
        end;
    'D','d': begin
        FDebtors.Append;
        FDebtors.FieldByName('SACCOUNTCODE').AsString := FXmlFile['code'].AsString;
        FDebtors.FieldByName('SDescription').AsString := FXmlFile['description'].AsString;
        FDebtors.FieldByName('BOpenItem').AsString := FXmlFile['openitem'].AsString;
        with FDebtors do begin
          FieldByName('Spostal1').AsString := FXmlFile['SPostal1'].AsString  ;
          FieldByName('Spostal2').AsString := FXmlFile['SPostal2'].AsString ;
          FieldByName('Spostal3').AsString := FXmlFile['SPostal3'].AsString ;
          FieldByName('SpostalCode').AsString := FXmlFile['SPostalCode'].AsString ;
          FieldByName('sDelivery1').AsString := FXmlFile['sDelivery1'].AsString;
          FieldByName('sDelivery2').AsString := FXmlFile['sDelivery2'].AsString;
          FieldByName('sDelivery3').AsString := FXmlFile['sDelivery3'].AsString;
          FieldByName('sDeliveryCode').AsString := FXmlFile['sDeliveryCode'].AsString;
          FieldByName('STelephone1').AsString := FXmlFile['STelephone1'].AsString;
          FieldByName('STelephone2').AsString := FXmlFile['STelephone2'].AsString;



          FieldByName('SEmail').AsString := FXmlFile['SEMail'].AsString;
          FieldByName('SFax').AsString := FXmlFile['SFax'].AsString;
          FieldByName('FCREDITLimit').AsFloat := FXmlFile['FCREDITLimit'].AsFloat;
          FieldByName('FChargeAmount').AsFloat := FXmlFile['FChargeAmount'].AsFloat;
          FieldByName('FDiscount').AsFloat := FXmlFile['FDiscount'].AsFloat;
          FieldByName('FInterest').AsFloat := FXmlFile['FInterest'].AsFloat;
          FieldByName('BOpenItem').AsString := FXmlFile['BOpenItem'].AsString;
          FieldByName('SMessage').AsString := FXmlFile['SMessage'].AsString;
          FieldByName('WDefaultPriceTypeID').AsString := FXmlFile['WDefaultPriceTypeID'].AsString;
          FieldByName('DLastActivity').AsString := FXmlFile['DLastActivity'].AsString;
          FieldByName('Sreference').AsString := FXmlFile['Sreference'].AsString;
          FieldByName('BInactive').AsString := FXmlFile['BInactive'].AsString ;
//          FieldByName('WSalesmanID').AsString := GetAddReportingGrpStr(31,FStream.FieldByName('SSalesperson').AsString,True)
         FieldByName('WDUEDAYS').AsString := FXmlFile['WDUEDAYS'].AsString ;
         FieldByName('SCOMPANYREGNO').AsString := FXmlFile['SCOMPANYREGNO'].AsString ;
         FieldByName('SFREEFIELD1').AsString := FXmlFile['SFREEFIELD1'].AsString ;
         FieldByName('SFREEFIELD2').AsString := FXmlFile['SFREEFIELD2'].AsString ;
         FieldByName('SFREEFIELD3').AsString := FXmlFile['SFREEFIELD3'].AsString ;

         FieldByName('SBANKNAME').AsString := FXmlFile['SBANKNAME'].AsString ;
         FieldByName('SBRANCHCODE').AsString := FXmlFile['SBRANCHCODE'].AsString ;
         FieldByName('SBANKACCOUNTNUMBER').AsString := FXmlFile['SBANKACCOUNTNUMBER'].AsString ;
         FieldByName('SBANKACCOUNTNAME').AsString := FXmlFile['SBANKACCOUNTNAME'].AsString ;

         FieldByName('SDelCountry').AsString := FXmlFile['DelCountry'].AsString ;
         FieldByName('SPostCountry').AsString := FXmlFile['PostCountry'].AsString ;

         FieldByName('SGroup1').AsString := FXmlFile['group1'].AsString ;
         FieldByName('SGroup2').AsString := FXmlFile['group2'].AsString ;

         FieldByName('SCREDITCARDNUMBER').AsString := FXmlFile['SCREDITCARDNUMBER'].AsString ;
         FieldByName('SCREDITCARDTYPE').AsString := FXmlFile['SCREDITCARDTYPE'].AsString ;
         FieldByName('SCREDITCARDHOLDER').AsString := FXmlFile['SCREDITCARDHOLDER'].AsString ;

        end;
        FDebtors.Post;
      end;
     else
        FAccounts.Append;
        FAccounts.FieldByName('SACCOUNTCODE').AsString := FXmlFile['code'].AsString;
        FAccounts.FieldByName('SDescription').AsString := FXmlFile['description'].AsString;
        FAccounts.FieldByName('WAccountTypeID').AsInteger := Char2AccountType(s[1]) ;
        FAccounts.FieldByName('BincomeExpense').AsString := FXmlFile['incomeexpense'].AsString;
        FAccounts.FieldByName('BInactive').AsString := FXmlFile['BInactive'].AsString ;
        FAccounts.FieldByName('BOpenItem').AsString := FXmlFile['BOpenItem'].AsString ;
        FAccounts.FieldByName('SGroup1').AsString := FXmlFile['group1'].AsString ;
        FAccounts.FieldByName('SGroup2').AsString := FXmlFile['group2'].AsString ;
        FAccounts.Post;
     end;
   end;  
  end;

  Function GetAccountBalance(WID:Integer=0):string;
  Var
    tmpRec:TAccountRec;
    Code:String ;
  begin

    Result := '0';
    Code := trim(Copy(FXmlFile['code'].AsString,2,20));
    tmpRec.WAccountID := 0;
    if (WID>0) then
      tmpRec.WAccountID := WID
    else if Code<>''then begin
      tmpRec.SACCOUNTCODE := Code;
      tmpRec.WAccountTypeID := Char2AccountType(Code[1]);
      SeekAccount(tmpRec);
    end;
    Code := tmpRec.SACCOUNTCODE;
    if (Code='') OR (tmpRec.WAccountTypeID<=0) then exit;
    Result := FloatToStr(LrGetAccountTotal(tmpRec,27,3));
  end;

  Function GetAccountVariance:string;
  begin
    Result := GetAccountBalance();
    result := FloatToStr(strtofloat(result)-strtofloatDef(FXmlFile['balance'].AsString,0));
  end;

  Function LoadOpenBatches(aData:String;ABatRec:TBatchCon):Boolean;
  Var
    ipos:Integer;
    S:String;
  begin
    {Check the batch Control record}
    if SeekBatch(ABatRec) then
    begin
      {check if Posted or Not}
      Result := True;
      if ABatRec.BPosted then exit;
    end
    else
    begin
      {Need Batch type name}
      s := GetBatchTypeName(ABatRec.WBatchTypeID);
      s := OpenBatch(s,ABatRec.WBatchTypeID,false);
      if s=''  then {This This is not found}
        ;{}
      Try
        {This is Comming from TXF so ajust it now}
        Result := False;
        Try
          Adata := XmlID + Adata;
          FBatchStream.Close;
          FBatchStream.XMLData := aData;
          {Erase the Batch}
          Try
            Try
              dmDatabase.tblBatch.DisableControls;
              dmDatabase.tblBatch.First;
              While not dmDatabase.tblBatch.Eof do
                  dmDatabase.tblBatch.Delete;
            finally;
              dmDatabase.tblBatch.EnableControls;
            end;
          except
          end;
          FBatchStream.Open;
          Result := FBatchStream.Active;
          if Result then
            FBatchStream.First;
          while Not FBatchStream.Eof do
          begin
            dmDatabase.tblBatch.Insert;
            for ipos:= 0 to FBatchStream.FieldCount-1 do
             dmDatabase.tblBatch.FieldByName(FBatchStream.Fields[iPOs].FieldName).Value := FBatchStream.Fields[iPOs].Value;
            dmDatabase.tblBatch.Post;
            {Check Max Lines and Update}
            FBatchStream.Next;
          end;
        Except

        end;
      finally
        dmDatabase.tblBatch.CLose;
      end;
    end;
  end;

begin
  Result:= 0;
  BatPost   := False;
  BeditStk  := False;
  txfWarngs := '';
  LoadControlAccs;
  BatNbrCheck:='';
  FileNbrCheck:='';
  RecLineSecNr := 0 ;
 AProgress := TfmNewProgress.create(nil) ;
  try

  ProcesssIndex := 1 ;

  {Validate Txf File}
  if GetTxfTypeSpec=1 then begin
    CurrentBatchUserName := ChangeFileExt(ExtractFileName(aFileName),'');
    SplitStrNum(CurrentBatchUserName,FileNbrCheck);
    FileNbrCheck:=Rightstr(FileNbrCheck,6);
  end;
  DMTCCoreLink.TheZConnection.StartTransaction ;
  Try
   AStockentry := TfmStockEntry.create(Application) ;
   try
     TxfRes:='';
    FStream := TClientDataSet.Create(Application);
    FlStream := TClientDataSet.Create(Application);
    FldStream := TClientDataSet.Create(Application);
    FXmlFile := TSylSax.Create(Application);
    FStkStream := TClientDataSet.Create(Application);
    FBatchStream := TClientDataSet.Create(Application);
    FAccounts := TClientDataSet.Create(Application);
    FSupCds := TClientDataSet.Create(Application);
    FDebtors := TClientDataSet.Create(Application);

    FXmlFile.MachCase:=False;
//    FXmlFile.StdDateFomat := True;
    CreateXmlFilesDef(FStream,3);
    CreateXmlFilesDef(FlStream,4);
    CreateXmlFilesDef(FStkStream,1);
    CreateXmlFilesDef(FBatchStream,7);
    CreateXmlFilesDef(FAccounts,0);
    CreateXmlFilesDef(FSupCds,6);
    CreateXmlFilesDef(FDebtors,2);
    CreateXmlFilesDef(FldStream,8);



    dmDatabase.tblStock.open;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblStock.Filtered := False;
    if uppercase(ExtractFileExt(aFileName)) ='.CSV' then
      begin
       ReadDocFromCSSVToDataSet(FStream,FlStream,FldStream,aFileName,AsNewDoc,AsType,LastDocAccountid);
       ImportDocsFromCds(FStream,FlStream,FldStream,'')  ;

       DMTCCoreLink.TheZConnection.Commit ;
       Exit ;
      end ;

    if  useFile then
      FXmlFile.FileName := aFileName
    else
      FXmlFile.ReadFromStream(aStream);
    Try
      FXmlFile.Active:=True;
      AProgress.initProgress(gettextlang(2068), FXmlFile.TheStream.Size);


      Result := 2030; // Invalide Xml File
      if SameText(FXmlFile.TagName,'xml') then
      begin
        FXmlFile.Next;
        Result := 2031; // Invalide txf File
        if SameText(FXmlFile.TagName,'TCASH3') AND (Pos('txt="syl"',LowerCase(FXmlFile.TagAttributes))<>0) then
            Result := 0;
      end;
      While (result=0) and (not FXmlFile.EOTags) do
      begin
        AProgress.SetProgress('', FXmlFile.TheStream.Position);
        if Result<>0 then break;
        if SameText(FXmlFile.TagName,'stockinfo') then
        begin

          {Load Stock Items}
           FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
           AddStockItem;
           { TODO -osylvain -cMust : Add Stock List Tag For Docs To load Correctly from txf }
          If (Result=0) AND (FStkStream.RecordCount>0) then
          begin
           Try
             FStkStream.First;
             Result := ImportXmlStockFromCds(FStkStream,'',BeditStk);
           except end;
          end;
          FStkStream.EmptyDataSet;
        end else
        if SameText(FXmlFile.TagName,'doclist') then
        begin
          {Load Ad Document Head and Lines}



          while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/doclist')) do
          begin
            AProgress.SetProgress('Loading...', FXmlFile.TheStream.Position);
            FXmlFile.Next;
            if SameText(FXmlFile.TagName,'docinfo') then
            begin
              FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
              AddDocHrecord;
            end
            else if SameText(FXmlFile.TagName,'lineitem') then
            begin
              FXmlFile.ScanNow; {This will > Load the Rec Tag  in  }
              AddDocLrecord;
            end else
            if SameText(FXmlFile.TagName,'linedetail') then
            begin
              FXmlFile.ScanNow; {This will > Load the Rec Tag  in  }
              AddDocdetrecord;
            end ;

          end;

          if (Result=0) AND (FStream.RecordCount>0) then
          begin
              FStream.First;
              Result := ImportDocsFromCds(FStream,FLStream,FldStream,'');
          end;
          FStream.EmptyDataSet;
          FLStream.EmptyDataSet;
        end else if SameText(FXmlFile.TagName,'openBatches') then
        begin
          {Add to Razor the option to replicate unposted Batches.
            This leads to Add the Batch Number to the batch File name to make
            file names unique}
             CurrentBatch :='';
             CurrentBatchUserName:='';
             BatuniqueID := '';
             BatInitID := 0;
             BatAlias := '';
             {First Get Parameters For Batch Control}
             while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/openBatches')) AND (Result=0) do
             begin
               AProgress.SetProgress('', FXmlFile.TheStream.Position);
               FXmlFile.Next;
               if SameText(FXmlFile.TagName,'BatconRec') then
               begin
                 ABatCont.WBatchID := FXmlFile['WBatchID'].AsInteger;
                 ABatCont.WUserID := FXmlFile['WUserID'].AsInteger;
                 ABatCont.WBatchTypeID := FXmlFile['WBatchTypeID'].AsInteger;
                 ABatCont.WInitBatID := FXmlFile['WInitBatID'].AsInteger;
                 ABatCont.WDocID := FXmlFile['WDocID'].AsInteger;
                 ABatCont.WLineCount := FXmlFile['WLineCount'].AsInteger;
                 ABatCont.DSysDate := FXmlFile['DSysDate'].AsDateTime;
                 ABatCont.SName := FXmlFile['SName'].AsString;
                 ABatCont.SUniqueID := FXmlFile['SUniqueID'].AsString;
                 ABatCont.BPosted := (FXmlFile['BPosted'].asString ='1');
                 ABatCont.BImported := (FXmlFile['BImported'].asString ='1');
                 ABatCont.BDocSource := (FXmlFile['BDocSource'].asString ='1');
                 ABatCont.SFilename := FXmlFile['SFilename'].AsString;
               end
               else if SameText(FXmlFile.TagName,'OpenBatData') then
               begin
                 // todo :Not working in my version
                 BatAlias := FXmlFile.ExtractXML('DataPacket');
                 if Not LoadOpenBatches(BatAlias,ABatCont) then Result := 2033;
               end;
             end;
        end
        else if SameText(FXmlFile.TagName,'Batchtrans') then
        begin
            {Load Batch Transactions}
             CurrentBatch :='';
             CurrentBatchUserName:='';
             BatuniqueID := '';
             BatInitID := 0;
             BatAlias := '';
             while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/Batchtrans')) AND (Result=0) do
             begin
               AProgress.SetProgress('', FXmlFile.TheStream.Position);
               FXmlFile.Next;
               if SameText(FXmlFile.TagName,'suniqueID') then
                BatUniqueID :=CheckUniqueBatcon(FXmlFile['suniqueID'].AsString)
               else if SameText(FXmlFile.TagName,'wInitbatID') then begin
                BatInitID := FXmlFile['wInitbatID'].AsInteger;
                {Check if the batch ID validated}
                 if (FileNbrCheck<>'') AND
                       Not SameText(FileNbrCheck,Rightstr(IntToStr(BatInitID),6)) then begin
                     SMsgErr:=IntToStr(BatInitID)+' invalide Batch day number';
                   Result:= 2045;
                 end;
               end
               else if SameText(FXmlFile.TagName,'SAlias') then
                BatAlias :=FXmlFile['SAlias'].AsString
               else if SameText(FXmlFile.TagName,'batchname') then
                CurrentBatch :=FXmlFile['batchname'].AsString
               else if SameText(FXmlFile.TagName,'userName') then
                 CurrentBatchUserName :=FXmlFile['userName'].AsString
               else if SameText(FXmlFile.TagName,'PostBatch') then begin
                 //FXmlFile.ScanNow;
                 BatPost :=  Str2Bool(FXmlFile['PostBatch'].AsString);
                 FXmlFile.Next;
               end
               else if SameText(FXmlFile.TagName,'BatchLine') then begin
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 if (CurrentBatch='') AND (FXmlFile['batchname'].AsString<>'') then
                   CurrentBatch :=FXmlFile['batchname'].AsString;
                 if (CurrentBatchUserName='') AND (FXmlFile['userName'].AsString<>'') then
                   CurrentBatchUserName :=FXmlFile['userName'].AsString;
                 LoadBatch;
               end
             end;
            if (Result=0) AND (FBatchStream.RecordCount>0) then
            begin
                FBatchStream.First;
                Result := ImportXmlTransInBat(FBatchStream,BatPost) ;
                { TODO -osylvain -c0 : Import Cds batch and stop debug procedure }
                if Result = 2033 then
                begin
                  Raise Exception.Create(GetErrMsg(2033));
                  Result := 0;
                end;
            end;
            FBatchStream.Active:= true;
              FBatchStream.EmptyDataSet;
        end
        else if SameText(FXmlFile.TagName,'acclist') then
        begin
           {Load Accounts Information}
          while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/acclist')) do
          begin
               AProgress.SetProgress('', FXmlFile.TheStream.Position);
               FXmlFile.Next;
               if SameText(FXmlFile.TagName,'accinfo') then begin
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 LoadAccount;
               end
          end;
          if (Result=0) AND (FAccounts.RecordCount>0) then
          begin
              FAccounts.First;
              Result := ImportStreamAccounts(FAccounts);
          end;
          if (Result=0) AND (FDebtors.RecordCount>0) then
          begin
              FDebtors.First;
              Result := ImportXmlDtCr(FDebtors);
          end;
          if (Result=0) AND (FSupCds.RecordCount>0) then
          begin
              FSupCds.First;
              Result := ImportXmlDtCr(FSupcds);
          end;
          {Clean All Loaded Accounts From Client DataSets}
        end
        else if SameText(FXmlFile.TagName,'clientrqst') then
        begin
         while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/clientrqst')) do
         begin
           AProgress.SetProgress('', FXmlFile.TheStream.Position);
           FXmlFile.Next;
           if SameText(FXmlFile.TagName,'request') then
           begin
             FXmlFile.ScanNow;
             ExecuteRqst(FXmlFile['code'].AsInteger);
           end;
         end;
        end
        else if SameText(FXmlFile.TagName,'sql') then
        begin
          ExecTxfSql;
        end
        else if SameText(FXmlFile.TagName,'sysrecon') then
        begin
             while not FXmlFile.EOTags And Not (SameText(FXmlFile.TagName,'/sysrecon')) do begin
               AProgress.SetProgress('', FXmlFile.TheStream.Position);
               FXmlFile.Next;
              if SameText(FXmlFile.TagName,'accountbalance') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + AddTag('code',FXmlFile['code'].AsString);
                 TxfRes := TxfRes + AddTag('balance',GetAccountBalance());
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'accountvariance') then
               begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + AddTag('code',FXmlFile['code'].AsString);
                 TxfRes := TxfRes + AddTag('variance',GetAccountVariance);
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'stockbalance') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + AddTag(tmptag,'To be implemented');
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'stockcontrol') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + FXmlFile['balance'].AsString +','+GetAccountBalance(0);
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'debtorscontrol') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + FXmlFile['balance'].AsString +','+GetAccountBalance(CtrlAccounts.DebtorID);
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'creditorscontrol') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + FXmlFile['balance'].AsString +','+GetAccountBalance(CtrlAccounts.CreditorID);
                 TxfRes := TxfRes + RTag(tmptag);
               end
               else if SameText(FXmlFile.TagName,'retainedincome') then begin
                 tmpTag := FXmlFile.TagName;
                 FXmlFile.ScanNow; {This will > Load the Rec Tag in  }
                 TxfRes := TxfRes + LTag(tmptag);
                 TxfRes := TxfRes + FXmlFile['balance'].AsString +','+GetAccountBalance(CtrlAccounts.RetIncomeID);
                 TxfRes := TxfRes + RTag(tmptag);
               end
             end;
        end;
        FXmlFile.Next;
      end;
    except
      on E: Exception do
       begin
         SMsgErr := E.Message;
         Result := 2032;
       end;  
    end;

    dmDatabase.tblStock.Close;
    dmDatabase.tblAccount.Close;
    DMTCCoreLink.TheZConnection.Commit ;
    finally
     AStockentry.free ;
    end;

  Finally
   if DMTCCoreLink.TheZConnection.InTransaction then
     DMTCCoreLink.TheZConnection.Rollback ;
    FXmlFile.Close;
    FreeAndNil(FXmlFile);
    FreeAndNil (FStream);
    FreeAndNil (FlStream);
    FreeAndNil (FStkStream);
    FreeAndNil (FBatchStream);
    FreeAndNil (FAccounts);
    FreeAndNil (FSupCds);
    FreeAndNil (FDebtors);
    FreeAndNil (FldStream);



    if txfWarngs<>'' then
    begin
     if TxfRes<>'' then
       TxfRes:= TxfRes + eline;
     TxfRes := TxfRes + '<warnings>'+eline+txfWarngs+'</warnings>'+eline;
    end;
    if ClResult<>'' then
    begin
     if TxfRes<>'' then
       TxfRes:= TxfRes + eline;
     TxfRes := TxfRes + '<replylist>'+eline+ClResult+eline+'</replylist>'+eline;
    end;

  end;
  finally
    AProgress.free ;
  end;
end;

Function ReadTxfFromFile(aFileName:String;AsNewDoc:Boolean;AsType:Integer=0):integer;
begin
  Result := ReadTxfFromStream (Nil,aFileName,true,AsNewDoc,AsType);
end;



Function ImportXmlStockFromCds(FSStream:TClientDataSet;aLogFile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):Integer;
Var
  HoldAcc,
  Holdsk:Boolean;
  X,NeedDescUpdate:Boolean;
  aQuery : TuniQuery ;
  AProgress : TfmNewProgress ;
  ProcesssIndex : Integer ;
  OptionsList : TStringlist ;
  i,OpId,ValId :Integer ;
  LocateVar:array of variant ;
  LocateFields : String ;
begin
  NeedDescUpdate := False ;


 AProgress := TfmNewProgress.create(nil) ;
  try
  AProgress.initProgress(gettextlang(2068), FSStream.RecordCount);
  ProcesssIndex := 1 ;
  AProgress.Top := AProgress.top - AProgress.Height ;



  FSStream.First ;
  if assigned(OnImportClientDataset) then
     OnImportClientDataset(FSStream,'STOCK');
  Result := 0;
//  Holdsk:=dmDatabase.tblStock.Active;
//  DmDatabase.tblStock.Open;
//  DmDatabase.tblStock.Filtered := False;
  
  dmDatabase.ZQGroups.Close ;
  dmDatabase.ZQGroups.SQL.Text := 'Select * from groups where WGroupTypeid = 1004' ;
  dmDatabase.ZQGroups.open ;


  OptionsList := TStringlist.create ;
  aQuery := TuniQuery.Create(nil) ;
  try
  aQuery.Connection := DMTCCoreLink.TheZConnection ;
  if Not Assigned(FSStream) then exit;
  Try
    While not FSStream.eof do
    begin

    if (trim(FSStream.FieldByName('SSTOCKCODE').AsString) = '') then
           begin
             FSStream.Next;
             Continue;
           end  ;

   dmDatabase.ZQStock.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('database_selectstockoncode') ;
   dmDatabase.ZQStock.ParamByName('SStockCode').AsString := trim(UpperCase(FSStream.FieldByName('SSTOCKCODE').AsString)) ;
   DmDatabase.ZQStock.open ;


      if (FSStream.FieldByName('OPTION').AsString <> '') and (not DmDatabase.ZQStock.IsEmpty) and (DmDatabase.ZQStock.FieldByName('WSTOCKTYPEID').AsInteger in [6,7])  then
      begin
       LocateFields := '' ;
       OptionsList.Text :=  StringReplace(FSStream.FieldByName('OPTION').AsString,'@',#13+#10 ,[rfReplaceAll]);
       for i := 0 to OptionsList.Count -1 do
         begin
          OptionsList.objects[i] := Tobject(
          TDataBaseStockRoutines.GetAddOptionItemValueID(OptionsList.Names[i],OptionsList.ValueFromIndex[i])) ;
          if i > 0 then
            begin
               SetLength(LocateVar,i);
               LocateVar[i-1] :=  Integer(OptionsList.objects[i]) ;
               if LocateFields <> '' then
                 LocateFields := LocateFields + ';' ;
               LocateFields := LocateFields + 'WITEMOPTIONVALUE' + IntToStr(i+1) +'ID' ;
            end
         end;


       dmDatabase.ZQDefoptions.close ;
       dmDatabase.ZQDefoptions.Params[0].AsInteger := DmDatabase.ZQStockWSTOCKID.AsInteger;
       dmDatabase.ZQDefoptions.Open ;
       if dmDatabase.ZQDefoptions.isEmpty then
         begin
          dmDatabase.ZQDefoptions.insert ;
          dmDatabase.ZQDefoptionsWSTOCKID.AsInteger :=   DmDatabase.ZQStockWSTOCKID.AsInteger;
           for i := 0 to OptionsList.Count -1 do
           begin
              dmDatabase.ZQDefoptions.FieldByName('WITEMOPTION' + IntToStr(i+1) +'ID').AsInteger := TDataBaseStockRoutines.GetOptionIdFromItemValueID(Integer(OptionsList.Objects[i])) ;
           end;
          dmDatabase.ZQDefoptionsWLOOKUPTYPE.AsInteger := 0 ;
          dmDatabase.ZQDefoptionsWLEVEL.AsInteger := 0 ;
          dmDatabase.ZQDefoptions.Post ;
         end;

       if DmDatabase.ZQStock.FieldByName('WSTOCKTYPEID').AsInteger = 7 then
       begin
       dmDatabase.ZQStockOptions.close ;
       dmDatabase.ZQStockOptions.Params[0].AsInteger := DmDatabase.ZQStockWSTOCKID.AsInteger;
       dmDatabase.ZQStockOptions.Params[1].AsInteger := Integer(OptionsList.objects[0]);

       dmDatabase.ZQStockOptions.Open ;
       if LocateFields <> '' then
         begin
         if dmDatabase.ZQStockOptions.Locate(LocateFields,LocateVar,[]) then
           dmDatabase.ZQStockOptions.edit
           else
           dmDatabase.ZQStockOptions.insert ;
         end else
         begin
           if dmDatabase.ZQStockOptions.IsEmpty then
            dmDatabase.ZQStockOptions.insert
            else dmDatabase.ZQStockOptions.Edit ;
         end;

         dmDatabase.ZQStockOptionsWSTOCKID.AsInteger := DmDatabase.ZQStockWSTOCKID.AsInteger ;

         for i := 0 to OptionsList.Count -1 do
         begin
           dmDatabase.ZQStockOptions.FieldByName('WITEMOPTIONVALUE' + IntToStr(i+1) +'ID').AsInteger := Integer(OptionsList.Objects[i]) ;
         end;

             if not FSStream.FieldByName('SBarCodeNumber').IsNull then
      dmDatabase.ZQStockOptionsSBARCODE.Value := FSStream.FieldByName('SBarCodeNumber').AsString;


      if not FSStream.FieldByName('FQtyOnHand').IsNull then
      dmDatabase.ZQStockOptionsFQTYONHAND.Value := Str2Float(FSStream.FieldByName('FQtyOnHand').asString);
      if not FSStream.FieldByName('FReorderQty').IsNull then
      dmDatabase.ZQStockOptionsFREORDERQTY.Value := Str2Float(FSStream.FieldByName('FReorderQty').asString);
      if not FSStream.FieldByName('FReorderQtyTrig').IsNull then
      dmDatabase.ZQStockOptionsFREORDERQTYTRIG.Value := Str2Float(FSStream.FieldByName('FReorderQtyTrig').asString);

      if not FSStream.FieldByName('FUnitAveCost').IsNull then
      dmDatabase.ZQStockOptionsFUNITAVECOST.Value := Str2Float(FSStream.FieldByName('FUnitAveCost').asString);
      if not FSStream.FieldByName('FUnitCost').IsNull then
      dmDatabase.ZQStockOptionsFUNITCOST.Value := Str2Float(FSStream.FieldByName('FUnitCost').asString);

      if not FSStream.FieldByName('FSellingPrice1').IsNull then
      dmDatabase.ZQStockOptionsFEXTRAPRICE.Value := Str2Float(FSStream.FieldByName('FSellingPrice1').asString);
      if not FSStream.FieldByName('FSellingPrice2').IsNull then
      dmDatabase.ZQStockOptionsFEXTRAPRICE2.Value := Str2Float(FSStream.FieldByName('FSellingPrice2').asString);
      if not FSStream.FieldByName('FSellingPrice3').IsNull then
      dmDatabase.ZQStockOptionsFEXTRAPRICE3.Value := Str2Float(FSStream.FieldByName('FSellingPrice3').asString);
      dmDatabase.ZQStockOptions.post ;
      end;








       FSStream.Next;
       Continue;
      end;

      if (not DmDatabase.ZQStock.IsEmpty)  then
      begin
       if Not BEdit  then
       begin
        FSStream.Next;
        Continue;
       end
       else
         DmDatabase.ZQStock.Edit
      end
      else
       begin
        if (EditType <> sitAll) then
           begin
             FSStream.Next;
             Continue;
           end  ;

        DmDatabase.ZQStock.Append;
       end;

      if (EditType = sitAll) or ( DmDatabase.ZQStock.State = dsinsert ) then
      begin
      NeedDescUpdate := true ;
      if not FSStream.FieldByName('SSTOCKCODE').IsNull then
      DmDatabase.ZQStockSSTOCKCODE.Value := trim(UpperCase(FSStream.FieldByName('SSTOCKCODE').AsString));

      if not FSStream.FieldByName('BDISABLED').IsNull then
      DmDatabase.ZQStockBDISABLED.AsInteger := FSStream.FieldByName('BDISABLED').AsInteger;

      if DmDatabase.ZQStockBDISABLED.IsNull then
         DmDatabase.ZQStockBDISABLED.AsInteger := 0 ;


      if not FSStream.FieldByName('WSTOCKTYPEID').IsNull then
      DmDatabase.ZQStockWSTOCKTYPEID.AsInteger := FSStream.FieldByName('WSTOCKTYPEID').AsInteger;

      if DmDatabase.ZQStockWSTOCKTYPEID.IsNull then
         DmDatabase.ZQStockWSTOCKTYPEID.AsInteger := 0 ;



      if not FSStream.FieldByName('SSTOCKCODE').IsNull then
      DmDatabase.ZQStockSSTOCKCODE.Value := UpperCase(FSStream.FieldByName('SSTOCKCODE').AsString);

      if not FSStream.FieldByName('SSTOCKCODESUP1').IsNull then
      DmDatabase.ZQStockSSTOCKCODESUP1.Value := UpperCase(FSStream.FieldByName('SSTOCKCODESUP1').AsString);

      if not FSStream.FieldByName('SSTOCKCODESUP2').IsNull then
      DmDatabase.ZQStockSSTOCKCODESUP2.Value := UpperCase(FSStream.FieldByName('SSTOCKCODESUP2').AsString);



      if not FSStream.FieldByName('SBarCodeNumber').IsNull then
      DmDatabase.ZQStockSBarCodeNumber.Value := trim(UpperCase(FSStream.FieldByName('SBarCodeNumber').AsString));
      if not FSStream.FieldByName('SDescription').IsNull then
      DmDatabase.ZQStockSDescription.Value := FSStream.FieldByName('SDescription').AsString;
      if not FSStream.FieldByName('Smanufacturer').IsNull then
      DmDatabase.ZQStockSMANUFACTURER.Value := FSStream.FieldByName('Smanufacturer').AsString;
      if not FSStream.FieldByName('FQtyOnHand').IsNull then
      DmDatabase.ZQStockFQtyOnHand.Value := Str2Float(FSStream.FieldByName('FQtyOnHand').asString);
      if not FSStream.FieldByName('FReorderQty').IsNull then
      DmDatabase.ZQStockFReorderQty.Value := Str2Float(FSStream.FieldByName('FReorderQty').asString);
      if not FSStream.FieldByName('FReorderQtyTrig').IsNull then
      DmDatabase.ZQStockFREORDERQTYTRIG.Value := Str2Float(FSStream.FieldByName('FReorderQtyTrig').asString);
      if not FSStream.FieldByName('BApplyInvoiceDiscount').IsNull then
      DmDatabase.ZQStockBApplyInvoiceDiscount.Value := FSStream.FieldByName('BApplyInvoiceDiscount').AsInteger;
      if not FSStream.FieldByName('FSellingPrice1').IsNull then
      DmDatabase.ZQStockFSellingPrice1.Value := Str2Float(FSStream.FieldByName('FSellingPrice1').asString);
      if not FSStream.FieldByName('FSellingPrice2').IsNull then
      DmDatabase.ZQStockFSellingPrice2.Value := Str2Float(FSStream.FieldByName('FSellingPrice2').asString);
      if not FSStream.FieldByName('FSellingPrice3').IsNull then
      DmDatabase.ZQStockFSellingPrice3.Value := Str2Float(FSStream.FieldByName('FSellingPrice3').asString);
      if not FSStream.FieldByName('FUnitAveCost').IsNull then
      DmDatabase.ZQStockFUnitAveCost.Value := Str2Float(FSStream.FieldByName('FUnitAveCost').asString);
      if not FSStream.FieldByName('FUnitCost').IsNull then
      DmDatabase.ZQStockFUnitCost.Value := Str2Float(FSStream.FieldByName('FUnitCost').asString);
      if not FSStream.FieldByName('SUnit').IsNull then
      DmDatabase.ZQStockWUnitID.Value := GetAddUnitId(FSStream.FieldByName('SUnit').asString,true);
      if not FSStream.FieldByName('SGroup1').IsNull then
      DmDatabase.ZQStockWReportingGroup1ID.Value :=  TDataBaseRoutines.GetAddGroupNesteled(FSStream.FieldByName('SGroup1').asString,26);
      if not FSStream.FieldByName('SGroup2').IsNull then
      DmDatabase.ZQStockWReportingGroup2ID.Value := TDataBaseRoutines.GetAddGroupNesteled(FSStream.FieldByName('SGroup2').asString,27 );
      if not FSStream.FieldByName('SCostAccount').IsNull then
      DmDatabase.ZQStockWCostAccountID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SCostAccount').AsString);
      if not FSStream.FieldByName('SSaleSACCOUNT').IsNull then
      DmDatabase.ZQStockWSaleSACCOUNTID.Value := TDataBaseRoutines.GetAccountIDFromCode( FSStream.FieldByName('SSaleSACCOUNT').AsString);
      if not FSStream.FieldByName('SStockAccount').IsNull then
      DmDatabase.ZQStockWStockAccountID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SStockAccount').AsString);
      if not FSStream.FieldByName('SInputTax').IsNull then
      DmDatabase.ZQStockWInputTaxID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SInputTax').AsString);
      if not FSStream.FieldByName('SOutputTax').IsNull then
      DmDatabase.ZQStockWOutputTaxID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SOutputTax').AsString);
      if not FSStream.FieldByName('SSupplier1').IsNull then
      DmDatabase.ZQStockWSUPPLIER1ID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SSupplier1').AsString);
      if not FSStream.FieldByName('SSupplier2').IsNull then
      DmDatabase.ZQStockWSUPPLIER2ID.Value := TDataBaseRoutines.GetAccountIDFromCode(FSStream.FieldByName('SSupplier2').AsString);
      if not FSStream.FieldByName('SEXTERNALID').IsNull then
      DmDatabase.ZQStockSEXTERNALID.Value := FSStream.FieldByName('SEXTERNALID').AsString;
      if not FSStream.FieldByName('SEXTRADESC').IsNull then
      DmDatabase.ZQStockSEXTRADESC.Value := FSStream.FieldByName('SEXTRADESC').AsString;
      if not FSStream.FieldByName('FNETTOWEIGHT').IsNull then
      DmDatabase.ZQStockFNETTOWEIGHT.Value := Str2Float(FSStream.FieldByName('FNETTOWEIGHT').asString);
      if not FSStream.FieldByName('FGROSSWEIGHT').IsNull then
      DmDatabase.ZQStockFGROSSWEIGHT.Value := Str2Float(FSStream.FieldByName('FGROSSWEIGHT').asString);
       NeedDescUpdate := true ;
      end else
      begin

      case EditType of
         sitFree,sitDescriptions :  Begin
                                 if not FSStream.FieldByName('SEXTRADESC').IsNull then
                                    DmDatabase.ZQStockSEXTRADESC.Value := FSStream.FieldByName('SEXTRADESC').AsString;
                                 if not FSStream.FieldByName('SDescription').IsNull then
                                    DmDatabase.ZQStockSDescription.Value := FSStream.FieldByName('SDescription').AsString;
                                   NeedDescUpdate := true ;
                            end;



          sitAvgCost :
                       Begin
                        DmDatabase.ZQStockFUnitAveCost.AsFloat:= FSStream.FieldByName('FUnitAveCost').AsFloat  ;
                       end;
          sitQtyReorderAveCost:
                       Begin
                         DmDatabase.ZQStockFQtyOnHand.AsFloat:= FSStream.FieldByName('FQtyOnHand').AsFloat  ;
                         DmDatabase.ZQStockFReorderQty.AsFloat:= FSStream.FieldByName('FReorderQty').AsFloat  ;
                         DmDatabase.ZQStockFUnitAveCost.AsFloat:= FSStream.FieldByName('FUnitAveCost').AsFloat  ;
                       end;
       sitQtyReorderOnHand:
                        Begin
                           DmDatabase.ZQStockFQtyOnHand.AsFloat:= FSStream.FieldByName('FQtyOnHand').AsFloat  ;
                           DmDatabase.ZQStockFReorderQty.AsFloat:= FSStream.FieldByName('FReorderQty').AsFloat  ;
                        end;
           sitSellingprice:
                       Begin
                          DmDatabase.ZQStockFSellingPrice1.AsFloat:= FSStream.FieldByName('FSellingPrice1').AsFloat  ;
                          DmDatabase.ZQStockFSellingPrice2.AsFloat:= FSStream.FieldByName('FSellingPrice2').AsFloat  ;
                          DmDatabase.ZQStockFSellingPrice3.AsFloat:= FSStream.FieldByName('FSellingPrice3').AsFloat  ;
                        end;
          sitQtyOnhand
                      :Begin
                            DmDatabase.ZQStockFQtyOnHand.AsFloat:= FSStream.FieldByName('FQtyOnHand').AsFloat  ;
                        end;
          sitbarcode
                      :Begin
                            DmDatabase.ZQStockSBARCODENUMBER.AsString:= FSStream.FieldByName('SBARCODENUMBER').AsString  ;
                        end;
         end; // end case
     end;
      DmDatabase.ZQStock.Post;
      // is options


       if NeedDescUpdate then
       begin
           dmDatabase.ZQStockDesc.Close ;
           dmDatabase.ZQStockDesc.params[0].AsInteger := DmDatabase.ZQStockWSTOCKID.AsInteger ;
           dmDatabase.ZQStockDesc.open ;
           dmDatabase.ZQGroups.first ;
      while not dmDatabase.ZQGroups.Eof do
          begin
              if dmDatabase.ZQStockDesc.Locate('WLANGUAGEID',dmDatabase.ZQGroupsWGROUPID.AsInteger,[]) then
                begin
                 dmDatabase.ZQStockDesc.edit ;
                end else
                begin
                  dmDatabase.ZQStockDesc.Insert ;
                  dmDatabase.ZQStockDescSDESCRIPTION.Value := '' ;
                end;
                dmDatabase.ZQStockDescWSTOCKID.AsInteger := DmDatabase.ZQStockWSTOCKID.AsInteger ;
                dmDatabase.ZQStockDescWLANGUAGEID.AsInteger := dmDatabase.ZQGroupsWGROUPID.AsInteger ;

                 if  not FSStream.fieldbyname('DESCLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).IsNull then
                 dmDatabase.ZQStockDescSDESCRIPTION.Value :=   FSStream.fieldbyname('DESCLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).Value ;
                 if  not FSStream.fieldbyname('MEMOLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).IsNull then
                 dmDatabase.ZQStockDescSEXTRADESCRIPTION.Value :=   FSStream.fieldbyname('MEMOLANG' + dmDatabase.ZQGroupsWGROUPID.AsString).Value ;


                   dmDatabase.ZQStockDesc.post ;

              dmDatabase.ZQGroups.next ;
          end;
        end;


      AProgress.SetProgress('',ProcesssIndex);
      inc(ProcesssIndex) ;
      FSStream.Next;
    end;

  Finally
    DmDatabase.ZQStock.Active := false;
  end;
    finally
       aQuery.free ;
       OptionsList.free ;
    end;
   finally
    AProgress.free ;
  end;
end;

Function ImportXmlStock(aFile,aLogFile:String;BEdit:Boolean=False;EditType:TStockImportEditType=sitAll):Integer;
Var
  Cds:TClientDataSet;
begin
  Result := 0;
  Cds:=TClientDataSet.Create(nil);
  Try
    Cds.LoadFromFile(aFile);
    try
      Result := ImportXmlStockFromCds(Cds,aLogFile,Bedit,EditType);
     except End;
  Finally
    Cds.Free;
  end;
end;

end.

