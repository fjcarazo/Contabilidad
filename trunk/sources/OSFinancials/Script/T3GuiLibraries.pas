unit T3GuiLibraries;

interface

Uses forms,SysUtils,ifps3,DB,ifpidelphi,ifpidelphiruntime,ifpscomp,menus,StdCtrls;

Procedure RegisterT3gLibR(Sender:TIFPSExec);
Procedure RegisterT3gLibC(Sender: TIFPSPascalCompiler);
Function  GetAppPath:String;

implementation

uses Main, GlobalFunctions, Database, DatabaseAccess, WelcomHelp,
  ExchangeTCData, TcVariables, Classes, OSFGeneralRoutines;


Function GetAppPath:String;
begin
  Result := DatabaseAccess.GetAppPath;
end;

Procedure SelectSetofBooks;
begin
  fmMain.FileOpenClick(application);
end;

Procedure SelectBatch;
begin
  fmMain.InputBatchEntryClick(application);
end;

Function WriteDocsToFile(StartDate,EndDate:TDateTime;FileName:String):Integer;
begin
  Result := ExportDocsToTxf(StartDate,EndDate,FileName);
end;

Function WriteDocsToStr(StartDate,EndDate:String;Var strResult:String):Integer;
begin
  Result := ExportDocsToTxfStr(StrToDate(StartDate),StrToDate(EndDate),strResult);
end;

Function GetDocList(Filter:string;Var StrResult:String):Integer;
begin
  Result:= 0;
  Try
    WriteDocListToStr(Filter,StrResult)
  except
    Result := 1;
  end;
end;


Function OpenSetOfBooks(aName:string):Integer;
begin
  Result := 0;
  if TheGlobalDataObject.Books.FindBooksByName(aName) = nil then
    Result := 1;
  if result<>0 Then exit;
  TheGlobalDataObject.Books.SetActive(TheGlobalDataObject.Books.FindBooksByName(aName).Index) ;
  OpenBooks(False);
end;

Procedure SetLoginPassword(aPassword:string);
begin
  AutoLoginPosPassword := aPassword;
end;

Procedure ExecuteAnnyItem(aItemName:string);
var
 AComponent : TComponent  ;
begin
  Application.ProcessMessages ;
  AComponent := fmMain.FindComponent(aItemName) ;
  if AComponent <> nil then
    begin
      if AComponent is TButton then
         (AComponent as TButton).Click ;
      if AComponent is tmenuitem then
         (AComponent as tmenuitem).Click ;
     end;
end;

Procedure ExecuteMainMenuItem(aMenutext:string);
var
 i : Integer ;
begin
  for i := 0 to fmMain.ComponentCount -1 do
    begin
      if fmMain.Components[i] is tmenuitem then

       if tmenuitem(fmMain.Components[i]).Caption = aMenutext then
         if tmenuitem(fmMain.Components[i]).Enabled then
           begin
           tmenuitem(fmMain.Components[i]).Click ;
           exit ;
           end;
    end;
end;

Function LoadBatchFromText(aFileName:String):integer;
begin
  Result:=0;
  LoadTextBatch(aFileName,0);
end;

Procedure CloseBatch;
begin
  DoCloseBatch;
end;

Function BalanceBatch(Consolidate:byte):integer;
begin
//  Result:=DoBalanceBatch(Consolidate);
end;

Function GetBankReconData(Fromdate,UntilDate:TDateTime;BankCode:String;Var StrResult:string):Integer;
begin

  Result := ReadReconData(Fromdate,UntilDate,BankCode,StrResult);
end;
Function GetWinUsername :string;
begin

  Result := TDatabaseUserRoutines.GetWinUsername ;
  if Result = '' then
    Result := '' ;
end;

procedure SetLoginUsername(aName :string);
begin
 TDatabaseRegistyRoutines.WriteAppRegValue('','username',aName);
   
end;


Procedure RegisterT3gLibR;
begin
  RegisterDelphiFunctionR(Sender, @SetLoginUsername,UpperCase('SetLoginUsername'), cdRegister);
  RegisterDelphiFunctionR(Sender, @GetWinUsername,UpperCase('GetWinUsername'), cdRegister);
  RegisterDelphiFunctionR(Sender, @ExecuteAnnyItem,UpperCase('ExecuteAnnyItem'), cdRegister);
  RegisterDelphiFunctionR(Sender, @ExecuteMainMenuItem,UpperCase('ExecuteMainMenuItem'), cdRegister);
  RegisterDelphiFunctionR(Sender, @SetLoginPassword,UpperCase('SetLoginPassword'), cdRegister);
  RegisterDelphiFunctionR(Sender, @SelectSetofBooks,UpperCase('SelectSetofBooks'), cdRegister);
  RegisterDelphiFunctionR(Sender, @SelectBatch,UpperCase('SelectBatch'), cdRegister);
  RegisterDelphiFunctionR(Sender, @OpenSetOfBooks,UpperCase('OpenSetOfBooks'), cdRegister);
  RegisterDelphiFunctionR(Sender, @OpenBatch,UpperCase('OpenBatch'), cdRegister);
  //RegisterDelphiFunctionR(Sender, @CloseWelcome,UpperCase('CloseWelcome'), cdRegister);
  RegisterDelphiFunctionR(Sender, @LoadBatchFromText,UpperCase('LoadBatchFromText'), cdRegister);
  RegisterDelphiFunctionR(Sender, @CloseBatch,UpperCase('CloseBatch'), cdRegister);
  RegisterDelphiFunctionR(Sender, @BalanceBatch,UpperCase('BalanceBatch'), cdRegister);
  RegisterDelphiFunctionR(Sender, @PostBatch,UpperCase('PostBatch'), cdRegister);
  RegisterDelphiFunctionR(Sender, @WriteDocsToFile,UpperCase('WriteDocsToFile'), cdRegister);
  RegisterDelphiFunctionR(Sender, @WriteDocsToStr,UpperCase('WriteDocsToStr'), cdRegister);
  RegisterDelphiFunctionR(Sender, @GetDocList,UpperCase('GetDocList'), cdRegister);
  RegisterDelphiFunctionR(Sender, @GetBankReconData,UpperCase('GetBankReconData'), cdRegister);

end;

Procedure RegisterT3gLibC;
begin
  RegisterDelphiFunctionC(Sender, 'Procedure ExecuteAnnyItem(aItemName:string);');
  RegisterDelphiFunctionC(Sender, 'Procedure SetLoginUsername(aUsename:string);');
  RegisterDelphiFunctionC(Sender, 'Function  GetWinUsername:string;');

  RegisterDelphiFunctionC(Sender, 'Procedure ExecuteMainMenuItem(aMenutext:string);');
  RegisterDelphiFunctionC(Sender, 'Procedure SetLoginPassword(aPassword:string);');
  RegisterDelphiFunctionC(Sender, 'Procedure SelectSetofBooks;');
  RegisterDelphiFunctionC(Sender, 'Procedure SelectBatch;');
  RegisterDelphiFunctionC(Sender, 'Function  OpenSetOfBooks(aName:string):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  OpenBatch(aBatchType:String;Var BatID:integer):String;');
  RegisterDelphiFunctionC(Sender, 'Procedure CloseWelcome;');
  RegisterDelphiFunctionC(Sender, 'Function  LoadBatchFromText(aFileName:String):integer;');
  RegisterDelphiFunctionC(Sender, 'Procedure CloseBatch;');
  RegisterDelphiFunctionC(Sender, 'Function  BalanceBatch(Consolidate:byte):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  PostBacth(CanToLastYear:Boolean):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  WriteDocsToFile(StartDate:TDateTime;FileName:String):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  WriteDocsToStr(StartDate:String;Var strResult:String):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  GetDocList(Filter:string;Var StrResult:String):Integer;');
  RegisterDelphiFunctionC(Sender, 'Function  GetBankReconData(BankCode:String;UntilDate:String;Var StrResult:string):Integer;');

end;

end.
