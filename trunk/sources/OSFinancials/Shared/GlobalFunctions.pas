(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
Unit GlobalFunctions;

interface

uses
  Main,DB,Variants,classes, Database, inifiles, SysUtils, Forms, Graphics, FileCtrl, Windows, Menus,
  Password, stdctrls,dbctrls,  CheckUnpost,grids,
  Math,dbtables,Controls, Dialogs, Lookup, LanguageChoice,
  StrUtils,printers,registry, buttons,extctrls,ShellApi,Messages,UMsgBox,
  TcashClasses, LedgerRoutines,UDMCoreData,DBGrids,ActnMan, ActnCtrls, ActnList;

const
  NVBDisabeItemIndex = 0 ;



procedure SetColour(Colour : Integer);
Function  OpenBooks(JustDoPath : Boolean):Integer;
procedure HandelHideSimple ;
procedure HandelSpecialUserMenu(OnComponent : TComponent ; ASysparamname : String ;AlistContent : String = '') ;
procedure handelDisableItems ;

function  CopyExistingBooks(SourceBooks, DestBooks, aName : String;CopyOverExistingBooks: Boolean = false) : Integer;
function  CreateBooks(BooksPath,BooksToCreate : String;AccountLength:Integer) : Integer;
procedure DeleteBooks(Path : String);
procedure CloseSetOfBooks;
Function  GetCmdPath:string;
function  DataIntegrityCheck : Boolean;
Function  EncodeAccount(Main,Sub:String):String;
Function  GetEncodeAccount:String;
Function  GetAccountDescription(vAccountID:Integer;SACCOUNT:string):String;
function  IsControlAccount(AccountID: integer) : Boolean;
function  IsMainAccountWithSub(AccountCode:String ) : boolean;Overload;
function  IsMainAccountWithSub(AccountCode:String;Var IsIncome:Boolean) : Boolean;Overload;
Function  IsPastelData(PastelDir:String):Boolean;
// function  PostBatchLine(ADMCoreData : TDMCoreData;BatchTypeID : Integer;Var TransID:LongInt;BatCtrlID:integer;DocId : Integer) : Boolean;
function  GetPeriod(Date : TDateTime) : Integer;
procedure CreateTotals(AccountID : Integer);
procedure ImportSetOfBooks(DirectoryToImportFrom : String);
procedure ClearReset(DoStockQuestion : Boolean = False);
//Procedure OpenTipOftheDays(BCheck:Boolean);

function  GetExactAccountTotal (_WAccountID, _WPeriodID: Integer; vDate:TDate) : Real;
procedure DeleteAccount(var ErrMessage :String;AccountID : Integer);
Function  GetAccountCode(vAccountID:Integer):String;
procedure GetAccountDefaultTaxAndContra(vAccountID:Integer;Var ContraAccount,TaxAccount:Integer);
Procedure GetAccountCodeDesc(vAccountID:Integer;Var AAccountCode, AAccountDesc : String );
Function  GetAccountType(vAccountID:Integer):integer ;
procedure CheckUnpostedItems;
procedure ClearLinks(AccountID : Integer;FrDate,ToDate:TDate;Side:Byte);
procedure CreateBBFLinks(AccountID : Integer;FrDate,ToDate:TDate;UseFrDate:Boolean;DocOnly : Boolean = false);
procedure CreateBBFLinksOnRef(AccountID : Integer);
procedure LinkTranscationOnID(ADMCoreData : TDMCoreData ;aTransactionID,aAccountID,aBatchLineID,aTaxID,aUserID,aBatchCtrlID : Integer
; aFullAmount,aLinkedAmount : Double;aDate,aDocDate : TDatetime;aReference,aLinkedReference : String  );

function  WinExecAndWait32(Path: PChar; Visibility: Word): integer;

Function StripNotNumericReturnZero(S:String):String;
Function  Str2Int(S:String):Integer;
function  FirstRun:Boolean;
function  GetLastYearsOpeningBalance(_accountID:integer):double;
function  GetYearsOpeningBalance(_accountID:integer):double;

function  FloatToStrT(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer): string;
function  FloatToStrTD2C(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer;ReversForView:Boolean = false): string;

procedure SetUpForm(Aform:TForm);
procedure DoYearEnd(Silent : Boolean );
Function  CheckDocInfos:Boolean;
function  GetControlAccountID(AccountID: integer) : integer;
function  GetAccountIncome(AccountID: integer;Var ARPAccount:Boolean): Integer;
Function  NextDocNbrOk(TdocTypeID:Integer):Boolean;
Function  ValideInt(S:string):Integer;
Procedure SetNbrFormat; // we need this in Free reports to.
Function  GetReconData(Fromdate,Todate:TDateTime;BankAccountID:Integer; Var PymtID,RcptID:String;Var TotalUnpost:Double;JustOpenRCon:Boolean = false):Boolean;
procedure  TransactionBBF(_WTransactionID,AccountType:Integer);
Function  IncMonthT(DDate:TDateTime; NumberOfMonths: Integer): TDateTime;
Function  ForceDeleteDir(sDirectory:string):Integer;
Function  DateRange(Bdate,Edate:Tdate):String;


procedure DBHighlight(EditBox : TDBEdit);
procedure DBBackNormal(EditBox : TDBEdit);
procedure Disable(EditBox : TEdit);
procedure Enable(EditBox : TEdit);
procedure DBDisable(EditBox : TDBEdit);
procedure DBEnable(EditBox : TDBEdit);
procedure MakeDec(EditBox : TEdit);
 

function  CheckAccountNumber(AccountNumber : String) : Boolean;
Function  IsRegistered:Boolean;
Function  GetStopDate:Tdate;
function  sgn(Value:real):SmallInt;
Function  AdjTransactions(TotTrs,tcMode:Integer):integer;
function  CnvAccountType(_AccountTypeID:Integer):Char;
Procedure ProperlyInUseClosed(ClosedNow:Boolean);
Function  GetTotalDocStock(StcItem:Integer):real;
Function  T3FormatStr(Value:string;Long:Integer;Cfill:char):String;Overload;
Function  T3FormatStr(Value:String;Long:Integer):String;Overload;
Function  T3FormatStr(Value,Long:Integer):String;Overload;
Function  BkMbFormat(N:integer):String;
Function  CheckOpenItemLink(_AccountID:Integer;MyBook:String;Var DtFAmount,CrFAmount,
          DtOutStanding,CrOutStanding,DtTotals,CrTotals:Real):Integer;

function EvaluateText(AReportmanStyleExpression,params : String ; ADataSet : TDataset) : Variant ;
// Procedure FixDtCrOutStanding(_AccountID:Integer);
function  NumberToText( const sAmount : String ) : string;
Function  IsDateNotInPeriod(MyDate:Tdate;Var StartDate,EndDate:Tdate):Boolean;
Function  LoadT3image(Var T3Image:TImage;ImageName:String):Boolean;
Function  ValidateEmail(EMail:String):String;
Function  SwapStr(Var vLStr,vUStr:String):Boolean;
Function  FullAccountCode(AccountCode:String;AccType:integer):String;
Function  ZipAccountCode(AccountCode:string):String;
Function  GetDocHeadingMes(idDocType:Integer):String;
Function  GetDocTypeFromDocId(DocId:Integer):Integer ;

Function  SelectAccType(OldTypeID:Integer;JustSelect:Boolean=false):Integer;
procedure Fix203TxtFile(Var FileName:String);
Function  AddDashInAccCode(AccCode:String;ShortCode:Boolean=False):String;
function  AddDashInAccCodeNoPRefix(AccCode:String):String;
Function  TrimInStr(vString:String):String;
Function  GetWinOSName:string;
Function  GetAbreviation(Var S:String):Boolean;
Function  CreateAgeSql(BDebtor,NameSort:Boolean;GroupShow:Integer):String;
Function  BCheckOpenItem(_AccountID :Integer):Integer;
Function  FitIndex(Value:TDBComboBox):Integer;
function  GetDescFromList(AList: TStrings;AId :Integer) : String ;
Function  GetBatchCtrlID(BatTypeID:Integer):Integer;
Function GetOPenBatchCtrlID(BatTypeID:Integer):Integer;
Function  GetFinCatDescription(FinCatID:Integer):String;
function  RecycleFile(FileToRecycle: string): boolean;
Function  GetDrvType(DriveStr:String):Byte;
Function  ReadReportOp(vfield:String):TField;Overload;
Function  ReadReportOp(vfield:String;BValue:Boolean):TField;Overload;
Function  ReadReportOp(vfield:String;aDate:TDate):TField;Overload;
Function  ReadReportOp(vfield,sValue:String):TField;Overload;
Function  ReadReportOp(vfield:String;Value:Integer):TField;Overload;
Procedure WriteReportOp(vfield,Value:String);
procedure  FillTmpAgeTable(DbtAccount:Boolean;Date90,Date60,Date30,DateCur:Tdate;BOiMode,ShowTransactions:Boolean);
Function  GetRangeTotal(WPeriodTypeID,WFromID,WToID,WAccountID:integer;BIncludeOpeningBals,BIncExp:Boolean):real;
function  GetTotalProffitLoss(WFromID,WToID : Integer) : Double ;
Function  Str2Bool(Value:String):Boolean;
Function  CallCalc(Var InMem:Double):Boolean;
function  DoesBatchBalance : Boolean;
Function  CheckUserCtrl(vAction:String;Msg:Boolean):Boolean;
Procedure SetUserOnLine(vOnline:Boolean);
function  CurrentOsUserName:String;
function  CurrentUserPC:String;
Function  ValideFaxNbr(sfNumber:string):String;
Function  FaxSetup(vLock:Boolean):Integer;
Function  GetFaxPrinterIdx:integer;
Procedure SetFaxFiles(wbNext:Integer);
Procedure MoveBtns(BtnTag:Integer;Pnl:TPanel;Btn1,Btn2,Btn3,Btn4:TSpeedButton);
function  CheckControlAccountID(fAccountID : Integer):Boolean;
Procedure CheckTransactionSTAX;

Function  FormatDateRange(SDateID , EDateID : Integer): String ;
Function  GetFirstPeriodDate:TDate;
Function  GetIspPasseWord:String;
Procedure SetIspPasseWord(Value:String);
 


Function  CheckNilTotalBal(_AccountID,_PeriodID:Integer):Boolean;
Function  CheckO2CNilBal(_AccountID,_oPeriodID,_cPeriodID:Integer):Boolean;
Function  CanPostToLastYear:Boolean;
function  GetDecPres:Integer;
Function  CalcReconAmts(aDate:TDate;BankStat,TotalUnposted:Real;AccountID:Integer):Double;
Procedure UpdatePb(Percent:Integer);
Procedure SetProgress(aText:String;aPosition:LongInt);Overload;
Procedure SetProgress(aMax:LongInt);Overload;
Function  GetProgress:LongInt;
procedure SetSubProgres(aPos:LongInt);
procedure InitSubProgres(aText:String;aMax:LongInt);

Procedure HtmlShowTopic(Index:Integer);
//Function  LangLabel(LabelID:integer):String;
Function  ReadDescription(MessageID:Integer):String;
Function  GetBackupPath:String;
Function  GetLatFolder(Folder:String):String;
Function  GetDateDesc(DateID:Integer):String;
Function  ReadContactNAme(_Contact:Integer):String;
Function  EndOfMonth(vMonth,vYear:Word):Word;
Procedure LoadBatchList(aList:TComboBox);
Procedure LoadPaperType(aList:TComboBox);
Function  GetTcName:String;
Function  GetDocName(DocID:integer):String;
Procedure PreviewDocument(SenditTo,WDocID:integer;ToFileName : String = '' );
Procedure ChangeBatAlias(aBatchID:Integer;AnAlias:String);
Function  GetBatAlias(aBatchID:Integer):String;
Function MenuItemIsEnabled(AMenuitem : TMenuitem) : Boolean ;
//Function  GetT3UserName(UserID:integer):String;

Function  CallNewLookup(Kind : Integer;BAsFrom:Boolean) : Boolean;
//Procedure StartTxtRprt;
//Procedure AddTxtRprtLine;

//Function  CurrLine:TcReportCols;
function  SendaMapiMail(const Subject, Body, FileName,SenderName, SenderEMail,RecipientName, RecipientEMail: string;aHandle : HWND = 0): Integer;
Procedure TcashHtmlCmd(aBase,acmd:byte);
Procedure LoadPrtOutBmp(aImage:TImage;Index:integer);
procedure  Highlight(EditBox : TEdit);
procedure  BackNormal(EditBox : TEdit);
Procedure LoadGroups(cbBox:TComboBox;GroupID:Integer;WithAll:Boolean=True);
Function  LocateGroup(Description:String;wTypeID:Integer):Integer;

Procedure RunUpdateClient;
function PluginExist(AName : String): Boolean;
procedure FillFreeReportLayoutBox(AStrings:TStrings);
function SetProcessDefaultLayout(mODE: DWORD): BOOL; stdcall;
procedure SaveGridToRegistry(AGrid : TDBGrid; APrefix : String ) ;
procedure LoadGridFromRegistry(AGrid : TDBGrid; APrefix : String ) ;
 


Var
  OptionsClose:Boolean;
  CurrLineIndex:Integer;
  NrOfRecuse :Integer;
implementation

Uses UpdateInvoice, SendEmailReport, SelectAccountType, OpenItemSelection,
     Progress,Calculator,TcVariables,   DatabaseAccess, NewLookup, WelcomHelp,
  XRoutines, PosRoutines, NewGlobalFunctions,  DBAccess , Uni,
  UPluginsSharedUnit,OSFGeneralRoutines, NewProgress,
  UDMTCCoreLink, FreeReportsUnit,VpNavBar, VpBase, UMainJobProject,comctrls,rpeval,rpalias;


{ TCustomGridHack }


 

procedure WriteFormPos( form : TForm; APrefix : String);
var
  ARegistry : TRegistry ;
begin
  ARegistry := TRegistry.create(KEY_WRITE);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\grids\'+APrefix+form.Name ,true) then exit ;
      ARegistry.WriteInteger('State',integer(form.Windowstate));
      if form.windowstate in [wsMinimized,wsMaximized] then
         form.windowstate := wsNormal;
      ARegistry.WriteInteger('Left',  form.Left);
      ARegistry.WriteInteger('Top',   form.Top);
      ARegistry.WriteInteger('Width', form.Width);
      ARegistry.WriteInteger('Height',form.Height);
     // ARegistry.WriteInteger('State',Integer(form.WindowState) );
  finally
    ARegistry.Free;
  end;
end;

procedure ReadFormPos( form : TForm; APrefix : String);
var
  ARegistry : TRegistry ;
  NewWindowState: TWindowState;
begin

  ARegistry := TRegistry.create(KEY_READ);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\grids\'+APrefix+form.Name ,true) then exit ;
      if ARegistry.ValueExists('Width') then
      form.Width  := ARegistry.ReadInteger('Width');
       if ARegistry.ValueExists('Height') then
      form.Height := ARegistry.ReadInteger('Height');
       if ARegistry.ValueExists('Left') then
      form.Left   := ARegistry.ReadInteger('Left');
       if ARegistry.ValueExists('Top') then
     form.Top    := ARegistry.ReadInteger('Top');
      NewWindowState := form.WindowState ;
      if ARegistry.ValueExists('State') then
      NewWindowState := TWindowState(ARegistry.ReadInteger('State')) ;

      if form.WindowState <> NewWindowState then
        form.WindowState := NewWindowState;
      if (form.Top + 10) > screen.Height then
          form.Top := screen.Height - 10 ;
      if (form.Left + 10) > screen.Width then
          form.Left := screen.Width - 10 ;
  finally
    ARegistry.Free;
  end;
end;



function SetProcessDefaultLayout ; external User32 name 'SetProcessDefaultLayout';
 


procedure SaveGridToRegistry(AGrid : TDBGrid; APrefix : String ) ;
Var
 i : integer ;
 ARegistry : TRegistry ;
begin
 ARegistry := TRegistry.create(KEY_WRITE) ;
 try
 if not ARegistry.OpenKey('\Software\osfinancials\grids\'+APrefix+AGrid.Name ,true) then exit ;
  for i := AGrid.Columns.Count -1 downto 0 do
    begin
     if  AGrid.Columns.Items[i].Field <> nil then 
     ARegistry.WriteString(IntToStr(I),AGrid.Columns.Items[i].Field.FieldName + #9 + IntToStr(AGrid.Columns.Items[i].Width) + #9 + IntToStr(AGrid.Columns.Items[i].Index));
    end;
  finally
    ARegistry.free ;
  end;
end;

procedure LoadGridFromRegistry(AGrid : TDBGrid; APrefix : String ) ;
Var
 i,X : integer ;
 ARegistry : TRegistry ;
 AList : TStringList ;
begin
 AList := TStringList.create ;
 try
 ARegistry := TRegistry.create(KEY_READ) ;
 try
 if not ARegistry.OpenKey('\Software\osfinancials\grids\'+APrefix+AGrid.Name ,true) then exit ;
  for i := AGrid.Columns.Count -1 downto 0 do
    begin
     AList.Text := StringReplace(ARegistry.ReadString(IntToStr(I)),#9,#13,[rfReplaceAll]);
     if AList.Count = 3 then
       begin
          for x := 0 to  AGrid.Columns.Count -1 do
            begin
               if AGrid.Columns[x].FieldName = AList[0] then
                 begin
                   AGrid.Columns[x].Width := StrTOIntDef(AList[1],AGrid.Columns[x].Width);
                   AGrid.Columns[x].index := StrTOIntDef(AList[2],AGrid.Columns[x].index);                   
                   break ;
                 end;
            end;
       end;
    end;
  finally
    ARegistry.free ;
  end;
  finally
    AList.free ;
  end;
end;


procedure FillFreeReportLayoutBox(AStrings:TStrings);
Var
  myF            :TSearchRec;
  MyStrings : TStringlist ;
  i : Integer ;
begin
  AStrings.Clear;
  MyStrings := TStringlist.create ;
  try

if FindFirst(DMTCCoreLink.GetLocalPluginDir+'\reports\documents\documents\*.rep',faAnyFile,myF)=0 then
  begin
  repeat
    if SameText(ExtractFileExt(myF.Name),'.rep') then
      begin
        if Pos('TRN_',myF.Name) = 1 then
          begin
            if MyStrings.IndexOf(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(myF.Name,5,20),''),0))) = -1 then
               MyStrings.AddObject(DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(myF.Name,5,20),''),0)),TObject(StrToIntDef(ChangeFileExt(copy(myF.Name,5,20),''),0))) ;

          end else
          begin
           if MyStrings.IndexOf(ChangeFileExt(myF.Name,'')) = -1 then
              MyStrings.Add(ChangeFileExt(myF.Name,''));
          end;
      end;
  until FindNext(myF)<>0;
     // done : pieter Findclose to perserve resource
     SysUtils.FindClose(myF);
   // Look for reporman reports

  end;
  MyStrings.Sort ;
  for i := 0 to MyStrings.Count -1 do
    astrings.AddObject(MyStrings[i],MyStrings.Objects[i]) ;
  finally
    MyStrings.free ;
  end;
end;

function PluginExist(AName : String): Boolean;
var
 MyAppName : String ;
begin
  MyAppName:= ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + AName ;
 result := FileExists(MyAppName);
end;



Function  IsRegistered:Boolean;
begin
   result := NewGlobalFunctions.IsRegistered ;
end;
Function  GetStopDate:Tdate;
begin
   result := date + 1000 ;
end;

function  sgn(Value:real):SmallInt;
begin
  if value<0 then
    result:=-1
  else
    result:=1
end;

Function  AdjTransactions(TotTrs,tcMode:Integer):integer;
begin
   result := 1 ;
end;

Function ShiftStr(Value:String;Up:Boolean):String;
Var
  i:Integer;
Begin
  if Length(Value)=0 then
  begin
   Result :='';
   exit;
  end;
  // done : Pieter Strings starts at 1
  For i:= 1 to Length(Value) do
  begin
    if Ord(Value[i])>= 2 then
    begin
      if Up then
        Value[i]:=Char(Ord(Value[i])+2)
      else
        Value[i]:=Char(Ord(Value[i])-2)
    end;
  end;
  Result:=Value;
end;

Function Str2Char(Value:String):Char;
begin
 Result:=#0;
 if Length(Value)>0 then
   Result := Value[1];
end;

function CurrentOsUserName:String;
// Get Os (Windows) User
var
  u: array[0..127] of Char;
  sz:DWord;
begin
  sz:=SizeOf(u);
  FillChar(u,sz,0);
  Windows.GetUserName(u,sz);
  Result:=u;
end;


function CurrentUserPC:String;
// Get Os (Windows) User
var
  u: array[0..127] of Char;
  sz:DWord;
begin
  sz:=SizeOf(u);
  FillChar(u,sz,0);
  Windows.GetComputerName(u,sz);
  Result:=u;
end;


Function  Str2Bool(Value:String):Boolean;
Begin
  if Trim(UpperCase(Value))='TRUE' then
    Result:=True
  else
    Result:=False
end;

function RecycleFile(FileToRecycle: string): boolean;
// Added by sylvain. This Recycles Set of Books Files
var Struct: TSHFileOpStructA;
    pFromc: array[0..255] of Ansichar;
    Resultval: integer;
begin
   if not FileExists(FileToRecycle) then begin
      RecycleFile := False;
      exit;
   end
   else begin
      fillchar(pfromc,sizeof(pfromc),0);
      StrPcopy(pfromc,expandfilename(FileToRecycle)+#0#0);
      Struct.wnd := 0;
      Struct.wFunc := FO_DELETE;
      Struct.pFrom := pFromC;
      Struct.pTo   := nil;
      Struct.fFlags:= FOF_ALLOWUNDO+FOF_NOCONFIRMATION+FOF_SILENT;
      Struct.fAnyOperationsAborted := false;
      Struct.hNameMappings := nil;
      Resultval := SHFileOperationA(Struct);
      RecycleFile := (Resultval = 0);
   end;
end;

function CheckAccountNumber(AccountNumber : String):Boolean;
begin
  Result := TRIM(AccountNumber) <>'' ;
end;



function CheckControlAccountID(fAccountID : Integer):Boolean;
{Writen By sylvain
 this function check if fAccountid is one of
 control Account ID
 }
Var
  HoldActive:Boolean;
begin
  with dmDatabase do
  begin
    Result := False;
    HoldActive := tblSysvars.Active;
    tblSysvars.Open ;
    if (fAccountID=tblsysvarsWDebtorsControlID.Value)
      Or (fAccountID=tblsysvarsWCreditorsControlID.Value)
      or (fAccountID=tblsysvarsWRetainedIncomeID.Value)
    then
      Result := True;
    tblSysvars.Active := HoldActive;
  end;
end;

Function Str2Int(S:String):Integer;
Begin
  Result := StrToIntDef(s,0);
end;

Function StripNotNumericReturnZero(S:String):String;
// done : Pieter lets strip all non numeric characters
 Var i : Integer ;
begin
 // done : Pieter Lets strip anny non numeric characters before conversion
 for i := length(S) downto 1 do
    if not (s[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator,'-']) then
       delete(s,i,1);

 result :='0';
 if (Trim(S)='') then exit;
   result:= s;

end;


Function NextDocNbrOk(TdocTypeID:Integer):Boolean;
// Test if Actual Next Document Number exist and not Duplicate
var
  TmpNbr:String;
  Ok:boolean;
  UserID : Integer ;
  ASaveCall : TSaveClientDatasetCallList ;
begin
 if NrOfRecuse = 10 then exit ;
 inc( NrOfRecuse) ;
 
  ASaveCall := TSaveClientDatasetCallList.Create ;
  try
    ASaveCall.AddclientObject(dmDatabase.tblDocHeader,true) ;
    ASaveCall.AddclientObject(dmDatabase.tblUser,true) ;
    ASaveCall.AddclientObject(dmDatabase.tblOpReport,true) ;

    Ok:=True;
    NextDocNbrOk:=False;
    TmpNbr:='';
    dmDatabase.tblUser.Open;
    dmDatabase.tblUser.filter :='' ;
    UserID :=  CurrentUser ;
 if ReadReportOp('BUseGeneralNumber','false').Asboolean then
   begin
     UserID := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0); 
     if not dmDatabase.tblUser.Locate('WUserID', UserID, []) then
        UserID :=  CurrentUser ;
   end ;


    if dmDatabase.tblUser.Locate('WUserID', UserID, []) then
    begin
      case TdocTypeId Of
        11: TmpNbr:=dmDatabase.tblUserSCreditNoteNextNumber.AsString;
        12:TmpNbr:=dmDatabase.tblUserSPurchaseNextNumber.AsString;
        13:TmpNbr:=dmDatabase.tblUserSGoodsReturnedNextNumber.AsString;
        14:TmpNbr:=dmDatabase.tblUserSQuoteNextNumber.AsString;
        15:TmpNbr:=dmDatabase.tblUserSOrderNextNumber.AsString;
        else
          TmpNbr:=dmDatabase.tblUserSInvoiceNextNumber.AsString;
      end;
    end
    else // User doesn't exist
    begin
      dmDatabase.tblUser.Insert ;
      dmDatabase.tblUserWUSERID.AsInteger := UserID ;
      TmpNbr := '' ;

      dmDatabase.tblUser.post;
    end;
    // Test if empty
    // if Trim(TmpNbr)='' then Exit;
    //Test if Duplicate
    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where SDocNo='+ QuotedStr(TmpNbr) + ' and WTypeID= ' +IntTOStr(TdocTypeID) ;
    dmDatabase.tblDocHeader.Open ;


    Ok:=  dmDatabase.tblDocHeader.IsEmpty;
    if not ok then
       begin
          dmDatabase.qGen.SQL.Text := 'select max(SDocNo) from dochead where SDocNo like  '+ QuotedStr(copy(TmpNbr,1,2)+'%') ;
          dmDatabase.qGen.Open ;
          if TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString) = dmDatabase.qGen.fields[0].AsString then
             begin
                Result := false ;
                exit ; 
             end;
          if not dmDatabase.qGen.IsEmpty then
            begin
                dmDatabase.tblUser.Edit ;
                  case TdocTypeId Of
                  11: dmDatabase.tblUserSCreditNoteNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                  12:dmDatabase.tblUserSPurchaseNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                  13:dmDatabase.tblUserSGoodsReturnedNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                  14:dmDatabase.tblUserSQuoteNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                  15:dmDatabase.tblUserSOrderNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                  else
                    dmDatabase.tblUserSInvoiceNextNumber.AsString:=TDataBaseStringRoutines.IncrementString(dmDatabase.qGen.fields[0].AsString);
                end;
              dmDatabase.tblUser.Post ;
            end;
          ok := NextDocNbrOk(TdocTypeID) ;
       end;
    NextDocNbrOk:=Ok ;
    finally
       ASaveCall.free ;
       dec(NrOfRecuse) ;
    end;
end;
procedure Disable(EditBox : TEdit);
begin

  EditBox.Enabled := False;
  EditBox.Color := clBlack;
  EditBox.Font.Color := clWhite;
end;

procedure Enable(EditBox : TEdit);
begin
  EditBox.Enabled := True;
  EditBox.Color := clWindow;
  EditBox.Font.Color := clWindowText;
end;

procedure DBDisable(EditBox : TDBEdit);
begin
  EditBox.Color := clGray;
  EditBox.Font.Color := clWhite;
  EditBox.Enabled := False;
end;

procedure DBEnable(EditBox : TDBEdit);
begin
  EditBox.Enabled := True;
  EditBox.Color := clWindow;
  EditBox.Font.Color := clWindowText;
end;

procedure DBHighlight(EditBox : TDBEdit);
begin
  EditBox.Color := clHighlight;
  EditBox.Font.Color := clHighlightText;
end;
procedure DBBackNormal(EditBox : TDBEdit);
begin
  EditBox.Font.Color := clWindowText;
  EditBox.Color := clWindow;
end;


procedure MakeDec(EditBox : TEdit);
begin
  // todo : pieter Range check error.
  // done : Pieter Decimal seperator is important for Dutch
  if trim(EditBox.Text) = '' then exit ;
    if pos(DecimalSeparator,EditBox.Text) >= (Length(EditBox.Text) - 2) then
  begin
      if pos(DecimalSeparator,EditBox.Text) <> 0 then
      EditBox.Text := copy(EditBox.Text+'00',1,pos(DecimalSeparator,EditBox.Text)+2) else


      EditBox.Text := EditBox.Text + DecimalSeparator + '00';


  end;
end;


Procedure SetNbrFormat;
var
  DigSymb:Char;
begin
{  DigSymb :=  Str2Char(ReadReportOp('SEdtDigSymb').AsString);
  //DecSymb :=  Str2Char(ReadReportOp('SedtDecSymb').AsString);
  ThousandSeparator := DigSymb;
//  if DecSymb<>#0 then
//   DecimalSeparator:=DecSymb
//  else
// done : Pieter Done do this for dutch people.
//   DecimalSeparator:= '.';
  if ThousandSeparator=DecimalSeparator then
    if ThousandSeparator='.' then
      ThousandSeparator:=','
    else
      ThousandSeparator:='.';   }
end;

function FloatToStrT(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer): string;
var
  tmp,tst : string;
  BPrintzero :Boolean;
begin
  Format := ffNumber;
//  re - using Digit for Printing 00.00
  if Not dmDatabase.tblReportingOptions.Active then
    dmDatabase.tblReportingOptions.Active := True;
  if Digits=100 then
  begin
    Digits:=0;
    BPrintzero := True;
  end      
  else
  begin
    BPrintzero:=False;
    if Digits<0 then
      BPrintzero:=True;
    if (dmDatabase.tblReportingOptions.FieldByName('WDecimal').isNull) or
       (Trim(dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString)='') then
      Digits:=2
    else
      Digits:=dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsInteger;
  end;
  if (Digits<0) or (Digits>7) then Digits:=2;
 tst := FloatToStrF(Value, Format, Precision, Digits);
 tmp := FloatToStrF(Value, Format, Precision, Digits);
// if Str2Float(tst) =  0 then tmp :='';
 if dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger = 0 then begin
  // <> for Credit
  if Value >  0 then tmp := tmp + ' ';
  if Value <  0 then tmp := '<' + copy(tmp,2,length(tmp)-1) + '>';
 end;



 if dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger = 2 then begin
  // D/C for Debit/Credit
  if Value > 0 then
   begin
    tmp := FloatToStrF(Value,Format,Precision,Digits);
    tmp := tmp + 'D';
   end
  else if Value < 0 then
   begin
    tmp := FloatToStrF(Value,Format,Precision,Digits);
    tmp := copy(tmp,2,length(tmp)-1);
    tmp := tmp + 'C';
   end;
 end;
 if (tmp='') and BPrintzero then
   if Digits>=1 then
    Result :='0.'+Copy('00000',1,Digits)
   else
    Result:='0'
 else
   Result := Trim(tmp);
end;

function FloatToStrTD2C(Value: Extended; Format: TFloatFormat; Precision, Digits: Integer;ReversForView:Boolean = false): string;
begin
  if ReversForView then Value := -Value ;
  Result:=FloatToStrT(Value,Format,Precision, Digits);
  // TODO : USE OSF FORMAT FOR THIS ?

end;

function GetLastYearsOpeningBalance(_accountID:integer):double;
begin
  Result := GetAccountTotal(_accountID,-1,4);
end;

function GetYearsOpeningBalance(_accountID:integer):double;
begin
  Result := GetAccountTotal(_accountID,0,4);
end;

Function  GetDateDesc(DateID:Integer):String;
{
  Gets the period Id Date Period and Return Period Description
  This is Similar to GetPeriodDesc;
}
Var
 Hold:Boolean;
begin
  Hold:=dmDatabase.tblPeriods.Active;
  dmDatabase.tblPeriods.Open;
  Result:='';
  IF dmDatabase.tblPeriods.Locate('WPeriodID',DateID,[]) then
  Begin
   Result:=dmDatabase.tblPeriodsSDescription.Value+' '+
     FormatDateTime('yyyy', dmDatabase.tblPeriodsDEndDate.Value);
  end;
  dmDatabase.tblPeriods.Active:=Hold;
End;

function WinExecAndWait32(Path: PChar; Visibility: Word): integer;
var Msg: TMsg;
    { Delphi 3:    lpExitCode: integer; }
    { Delphi 4 information courtesy of Joel Milne }
    { Delphi 4: }  lpExitCode: cardinal;
    StartupInfo: TStartupInfo;
    ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    wShowWindow := visibility; {you could pass sw_show or sw_hide as parameter}
  end;
  if CreateProcess(nil, path, nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
  begin
    repeat
      while PeekMessage(Msg, 0, 0, 0, pm_Remove) do
      begin
        if Msg.Message = wm_Quit then Halt(Msg.WParam);
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
      GetExitCodeProcess(ProcessInfo.hProcess,lpExitCode);
    until lpExitCode <> Still_Active;
    with ProcessInfo do {not sure this is necessary but seen in in some code elsewhere}
    begin
      CloseHandle(hThread);
      CloseHandle(hProcess);
    end;
    Result := 0; {success}
  end else Result := GetLastError
end;

procedure SetColour(Colour : Integer);
{********
         Sets the different colour styles
         like the old tcash
********}
Var
  HoldActive:Boolean;
begin
 
  fmMain.UpdateColorsForThema;

{  fmMain.ControlPanel.Color := MainPanelColor;
  fmMain.ControlBar.Color := fmMain.ControlPanel.Color;
  fmMain.TopPnlBar.Color :=  fmMain.ControlPanel.Color;

                        }

  // fmMain.Color := MainColor;
  //fmMain.NVBMain.BackgroundColor := fmMain.ControlPanel.Color ;
  fmMain.RePaint;

end;

Procedure AdminUserMemu;
Begin
   fmMain.rgStart.Enabled := true ;

    with fmMain do
    begin


      rgSetupGroup.Enabled := True;
      //
      rbtools.Enabled := True;
      ToolsExport1.Enabled := True;
      Import1.Enabled := True;
//      ToolsMenu.Enabled := True;
      //
      rbReports.Enabled := True;


      TBPlugin.Enabled := True;
      //MIPlugin.Enabled := True;

      tlBtnRecon.Enabled := True;
      tlBtnLink.Enabled := True;

      Accounts1.Enabled := True;
      EditStockItems.Enabled := True;
      tlBtnBatch.Enabled := True;
      InputCreditNotes.Enabled := True;
      InputInvoices.Enabled := True;


//      tlBtnBackRest.Enabled := True;
      InputPurchases.Enabled := True;
      InputStockReturns.Enabled := True;


      tlBtnRecon.Enabled := True;
      

      btlSearch.Enabled := True;

      FileCreate.Enabled := True;
      FileSaveAs.Enabled := True;
      FileDelete.Enabled := True;

      ReportDesigner1.Enabled := True;


    end;
end;
{   function StdPluginVisible : Boolean ;
function StdPluginVisible : Boolean ;
begin


end;  }

procedure handelDisableItems ;
var
 DontShow : Boolean ;
 i : Integer ;
begin
     DontShow := false ;
    try
    if DMTCCoreLink.TheZConnection.Connected then
    DontShow :=  ReadSysParam('BHideDisabledMenuitems',false,CurrentUser,0).AsBoolean ;
    except
     DontShow := false ;
    end;
      if DMTCCoreLink.SimpleMode > 0  then
          DontShow := True ;

    if DontShow then
    begin
     for i := 0 to fmMain.ComponentCount -1 do
        begin
            if fmMain.Components[i] is TAction then
             begin
              if not (fmMain.Components[i] as TAction).Enabled and DontShow then
                 (fmMain.Components[i] as TAction).Visible := false else
                 (fmMain.Components[i] as TAction).Visible := true ;
              end else
            if fmMain.Components[i] is TMenuitem then
             begin
              if not (fmMain.Components[i] as TMenuitem).Enabled and DontShow then
                 (fmMain.Components[i] as TMenuitem).Visible := false else
                 (fmMain.Components[i] as TMenuitem).Visible := true ;
              end else
            if fmMain.Components[i] is TToolButton then
             begin
              if not (fmMain.Components[i] as TToolButton).Enabled and DontShow then
                 (fmMain.Components[i] as TToolButton).Visible := false else
                 (fmMain.Components[i] as TToolButton).Visible := true ;
              end;
        end ;
    end;    
 fmMain.TBPlugin.Visible := fmMain.StdPluginVisible  ;
 fmMain.TBPlugin.Tag := ord(not fmMain.TBPlugin.Visible);
end;

procedure HandelSpecialUserMenu(OnComponent : TComponent ; ASysparamname : String ;AlistContent : String = '') ;

Var
 AList:TStringList ;
 i : Integer ;
begin
 if not DMTCCoreLink.TheZConnection.Connected then exit ;
 
 AList:=TStringList.Create ;
 try
 AList.Delimiter := ';';
 if AlistContent <> '' then
 AList.DelimitedText := AlistContent
 else
 AList.DelimitedText :=  ReadLongSysparam(ASysparamname,CurrentUser);
 for i:= 0 to AList.Count -1 do
   begin
      if OnComponent.FindComponent(AList.Names[i]) <> nil then
        begin
          if AList.Values[AList.Names[i]] = 'D' then
             SetPersistentProp('Enabled',OnComponent.FindComponent(AList.Names[i]),false);
          if AList.Values[AList.Names[i]] = 'H' then
            begin
                SetPersistentProp('Visible',OnComponent.FindComponent(AList.Names[i]),false);
                SetPersistentProp('Enabled',OnComponent.FindComponent(AList.Names[i]),false);
             end;
          if AList.Values[AList.Names[i]] = 'E' then
             SetPersistentProp('Enabled',OnComponent.FindComponent(AList.Names[i]),true);
          if AList.Values[AList.Names[i]] = 'S' then
             begin
                SetPersistentProp('Visible',OnComponent.FindComponent(AList.Names[i]),true);
                SetPersistentProp('Enabled',OnComponent.FindComponent(AList.Names[i]),True);
             end;
        end;
   end;
 finally
     AList.free ;
 end;

end;

Function MenuItemIsEnabled(AMenuitem : TMenuitem) : Boolean ;
begin
   result := AMenuitem.Enabled and AMenuitem.Visible ;
   if (AMenuitem.Parent <> nil) and result then
      result := result and MenuItemIsEnabled(AMenuitem.Parent);
end;




procedure handelHideSimple ;
 procedure TurnOff(AItem : Tmenuitem ) ;
 var i : Integer ;
 begin
   for i := 0 to AItem.Count -1 do
    TurnOff(AItem.Items[i]);
   AItem.Enabled := False ;
   AItem.Visible := False ;
 end;
 procedure TurnOffAction(AItem : Taction ) ;
 var i : Integer ;
 begin
   AItem.Enabled := False ;
   AItem.Visible := False ;
 end;


begin

          fmMain.TBPlugin.Enabled := False ;
          fmMain.TBPlugin.Visible := False ;
          fmMain.TBPlugin.Tag  := 1 ;

          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.InputAdjustStock);
          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.SetupDocuments);
          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.SetupSalesman);
          TurnOffAction(fmMain.InputProjects);
          TurnOffAction(fmMain.FileSwitch);
          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.InputCalendar);
          TurnOffAction(fmMain.PointOfSales1 );
          TurnOffAction(fmMain.SetupInternet );
          TurnOffAction(fmMain.Workflowsetup1 );
          TurnOffAction(fmMain.SetupAccessControl);
          TurnOffAction(fmMain.Currencies1 );
          TurnOff(fmMain.EditDeleteDocuments );
          TurnOffAction(fmMain.EditRepeatingInvoices );
          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.EditStockItems  );
          if DMTCCoreLink.SimpleMode =1  then
          TurnOffAction(fmMain.SetupStockInfo );
          TurnOffAction(fmMain.ToolsCalculator  );


          TurnOffAction(fmMain.Ledgerviewer1  );
          TurnOffAction(fmMain.AccountViewer1 );
          TurnOffAction(fmMain.Ledgerviewer2 );


          TurnOffAction(fmMain.DataIntegrityCheck1  );
          TurnOffAction(fmMain.Customizelanguage1 );


          TurnOffAction(fmMain.Closeopensforms1  );
          TurnOffAction(fmMain.Activateplugins1  );

          TurnOffAction(fmMain.SetupPrinter  );
          TurnOffAction(fmMain.SetupDataEntry );
          TurnOffAction(fmMain.BackupPath  );


          if DMTCCoreLink.SimpleMode =2  then
             TurnOffAction(fmMain.tlBtnBatch );

end;
Function OpenBooks(JustDoPath : Boolean):Integer;
{********
         This procedure points the tables in the Data
         form to the current database and changes the
         user interface to reflect an open database
********}
var i : Integer ;
    DontShow : Boolean ;
    AName : String ;
begin

//  if Not DirectoryExists(dmDatabase.tblBooksSBookPath.Value) then begin
//  end;

try

            for i := 0 to fmMain.ComponentCount -1 do
                 begin
                  if fmMain.Components[i] is TMenuitem then
                  begin
                  (fmMain.Components[i] as TMenuitem).Visible := true ;
                  (fmMain.Components[i] as TMenuitem).Enabled := true ;
                  end else
                  if fmMain.Components[i] is TToolButton then
                  begin
                  (fmMain.Components[i] as TToolButton).Visible := true ;
                  (fmMain.Components[i] as TToolButton).Enabled := true ;
                  end else
                  if fmMain.Components[i] is TAction then
                  begin
                  (fmMain.Components[i] as TAction).Visible := true ;
                  (fmMain.Components[i] as TAction).Enabled := true ;
                  end;

                 end ;

  with dmDatabase do
  begin
    //NB!!  If you add or remove tables from the data module you MUST update this.
    //Moved By Sylvain to dmDatabase Unit;
    // I have found out that short path names give so Mutch less hassel for the BDE that you can install it in C:\program file without anny problems
    if TheGlobalDataObject.Books.ActiveBooks <> nil then
    begin
      fmMain.MainStatusBar.panels[5].Text := Trim(TheGlobalDataObject.Books.ActiveBooks.Server +' ' + TheGlobalDataObject.Books.ActiveBooks.Database) ;
      Result := DoOpenSetofBooks(TheGlobalDataObject.Books.ActiveBooks);
      if not DMTCCoreLink.TheZConnection.Connected then
        begin
          fmMain.MainStatusBar.panels[1].Text := '' ;
        end else
        begin
        fmMain.TrayIcon1.BalloonFlags := bfInfo ;
        fmMain.TrayIcon1.BalloonTitle := DMTCCoreLink.GetTextLangNoAmp( 1000024);
        fmMain.TrayIcon1.BalloonHint := DMTCCoreLink.ReadSysVar('SCOMPANYNAME') ;
        fmMain.TrayIcon1.ShowBalloonHint ;
        fmMain.TrayIcon1.hint := DMTCCoreLink.ReadSysVar('SCOMPANYNAME') ;

              ReadAppConfig ;
              if FileExists(ExtractFilePath(Application.ExeName) + 'gds32.dll') then
                begin
                if DMTCCoreLink.TheZConnection <> nil then
                if DMTCCoreLink.TheZConnection.Connected then
                  if DMTCCoreLink.TheZConnection.Server = '' then
                  AppName := AppName +' '+ DMTCCoreLink.GetTextLangNoAmp(3103) ;
                end;

              if TheGlobalDataObject.Registration.Registered then
              AppName := AppName  +' - '+DMTCCoreLink.GetTextLangNoAmp(3105)+' - ' + TheGlobalDataObject.Registration.SerialNumber + ' '+DMTCCoreLink.GetTextLangNoAmp(3102)+' ' + TheGlobalDataObject.Registration.CompanyName ;
              Application.Title := AppName;

        end;

    end
    else
    begin
      Result := 0;

    end;

    Case Result of
    0:;
    2100:begin
          OSFMessageDlg(GetTextLang(741){'Invalid Password'}, mterror, [mbok], 0);
          DoCloseSetOfBooks ;
          exit;
        end;
    2102:begin
         // OSFMessageDlg(GetTextLang(741){'Invalid Password'}, mterror, [mbok], 0);
          DoCloseSetOfBooks ;
          exit;
        end;
    2103: begin
            ShowErrMsg (Result);
            DoCloseSetOfBooks ;
            exit;
         end;
    10: begin
         OSFMessageDlg(GetTextLang(717){'Set of Books not Found, Directory doesn''t exists :'}+
              TheGlobalDataObject.Books.ActiveBooks.Database+#13#10+GetTextLang(718),mtInformation,[mbOk],0);
          DoCloseSetOfBooks ;
          exit;
        end;
    else
      Exit;
    end;

    fmMain.MainStatusBar.Panels[2].Text:='';
    // Check if  correct verion of T3 Database
    Result:= Converted;
    Case  Result of
    255: OSFMessageDlg(GetTextLang(812){'The old T3 data were successfully converted'},mtinformation,[mbok],0);
      0: ; {Data Format up to date}
    else
      OSFMessageDlg(GetTextLang(813){'An Error occur while converting your old T3 data.'},mtError,[mbok],0);
      exit;
    end;
    //if not CheckDatabaseVer then exit;
    //


    if not JustDoPath then
    begin
      //Launch the password entry screen
      tblUser.Open;




              fmMain.EditRepeatingInvoices.Visible := true ;
              fmMain.EditStockItems.Visible := true ;
              fmMain.InputAdjustStock.Visible := true ;

              fmMain.InputProjects.Visible :=   DMTCCoreLink.ReadNwReportOp('cbProjects',false); ;
              

              
              fmMain.SetupDocuments.Visible := true ;
              fmMain.PointOfSales1.Visible := true ;
              fmMain.SetupSalesman.Visible := true ;
              fmMain.SetupStockInfo.Visible := true ;



              // fmMain.InputMenu.Enabled := true ;
              fmMain.rbReports.Enabled := true ;

              fmMain.AToolsBackup.Enabled := true ;
              fmMain.tlbtnBatch.Enabled := true ;
              fmMain.aFileOpen.Enabled := true ;
              fmMain.tlbtnRecon.Enabled := true ;
              fmMain.tlbtnLink.Enabled := true ;



              fmMain.EditRepeatingInvoices.Enabled := true ;
              fmMain.EditStockItems.Enabled := true ;
              fmMain.InputAdjustStock.Enabled := true ;

              fmMain.InputProjects.Enabled :=    DMTCCoreLink.ReadNwReportOp('cbProjects',false); ;



              
              fmMain.SetupDocuments.Enabled := true ;
              fmMain.PointOfSales1.Enabled := true ;
              fmMain.SetupSalesman.Enabled := true ;
              fmMain.SetupStockInfo.Enabled := true ;
 

            fmMain.mainRibbon.Caption := Application.Title  +' - ' + tblSysVarsSCompanyname.Value + ' ( ' + tblUserSUserName.Value + ' logged in )';
            fmMain.MainStatusBar.Panels[2].text:='User:'+tblUserSUserName.Value;


            fmMain.rgSetupGroup.Enabled := True;

            fmMain.btlSearch.Enabled := True;

            fmMain.rbtools.Enabled := True;
            fmMain.ToolsExport1.Enabled := True;
            fmMain.Import1.Enabled := True;
            //
            fmMain.rbReports.Enabled := True;
            fmMain.tlBtnBatch.Enabled := True;
            fmMain.TBPlugin.Enabled := True;

            fmMain.tlBtnRecon.Enabled := True;
            fmMain.tlBtnLink.Enabled := True;

            fmMain.TBPlugin.Enabled := True;
            fmMain.TBPlugin.Visible := fileExists(IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\' +(ReadT3IniFile('DEFPLUGIN','PATH',''))) ;
            if fmMain.TBPlugin.Visible then
              begin
                AName := uppercase(ReadT3IniFile('DEFPLUGIN','PATH','')) ;
                if AName <> uppercase('OSCommerceImport.osc') then
                    fmMain.TBPlugin.Visible := false   ;
              end;

            if fmMain.TBPlugin.Visible then
            fmMain.TBPlugin.Tag := 0
            else
            fmMain.TBPlugin.Tag := 1 ;



      if CurrentUser<>-1 then
      begin
        //fmPassword.Showmodal;
        //if CurrentUser < 0 then exit;
        //set the colour

        tblSysVars.Open;
        dmdatabase.tblSysParams.Open;
        if not TDatabaseTableRoutines.FieldExists('WORKFLOWWORK','WWORKFLOWWORKID') then
           fmMain.bWorkflow2.Visible := DMTCCoreLink.IsRegistered('{885E288E-BF96-4E71-9BFF-68F0D5360712}');
        if not fmMain.bWorkflow2.Visible then
            begin
             if TDatabaseTableRoutines.FieldExists('WORKFLOWWORK','WWORKFLOWWORKID') then
                 fmMain.bWorkflow2.Visible :=  varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*) from WORKFLOWTYPES')) <> '0' ;
            end;



        fmMain.UpdateColorsForThema;
        if RealUser=-1 then
        begin
          fmMain.mainRibbon.Caption := Application.Title  +' - ' + tblSysVarsSCompanyname.Value + ' ( Universal Administrator logged in )';
          fmMain.MainStatusBar.Panels[2].text:='Universal Administrator';
          AdminUserMemu;

           handelDisableItems ;
           HandelSpecialUserMenu(fmmain,'DISABLEITEMS') ;
        end
        else
        begin
          tblUser.Locate('WUserID', CurrentUser, []);

          with fmMain do
            begin


            EditStockItems.Enabled := tblUserBStock.Value=1;
            InputAdjustStock.Enabled := tblUserBStock.Value=1;

            tlBtnBatch.Enabled := tblUserBBatchEntry.Value=1;
            rbEdit.Enabled := ReadSysParam('BUserSystemMenu',true,CurrentUser).AsBoolean ;


            InputCreditNotes.Enabled := tblUserBCreditNote.Value=1;
            InputInvoices.Enabled := tblUserBInvoices.Value=1;
            EditRepeatingInvoices.Enabled := tblUserBInvoices.Value=1;


            InputPurchases.Enabled := tblUserBPurchases.Value=1;
            InputStockReturns.Enabled := tblUserBStockReturns.Value=1;
            InputStockReturns.Enabled := InputStockReturns.Enabled ;

            tlBtnRecon.Enabled := tblUserBReconciliation.Value=1;
            

            // get desc for costgroup
           // Costcenter11.Caption := TDataBaseRoutines.GetTypeDescription(1002) ;
          //  Costcenter21.Caption := TDataBaseRoutines.GetTypeDescription(1003) ;
            AccountViewer1.Enabled := tblUserBLEDGERREPORTS.Value =1 ;
            Ledgerviewer1.Enabled := tblUserBLEDGERREPORTS.Value =1 ;
            Ledgerviewer2.Enabled := tblUserBLEDGERREPORTS.Value =1 ;

            rbtools.Enabled := tblUserBGlobalProcesses.Value=1;
            {Setup Disabled}
            rgSetupGroup.Enabled := tblUserBSystemSetup.Value=1;
            FileCreate.Enabled := tblUserBSystemSetup.Value=1;
            FileSaveAs.Enabled := tblUserBSystemSetup.Value=1;
            FileDelete.Enabled := tblUserBSystemSetup.Value=1;

            ReportDesigner1.Enabled := tblUserBSystemSetup.Value=1;

            
            Accounts1.Enabled := ReadSysParam('BGlAccount',true,CurrentUser,0).AsBoolean;
            EditAccountsDebtor.Enabled  := ReadSysParam('BEditDebtor',True,CurrentUser,0).AsBoolean;
            EditAccountsCreditor.Enabled := ReadSysParam('BEditCreditor',True,CurrentUser,0).AsBoolean;
              // done : Pieter hide inactve menu items.
            HandelSpecialUserMenu(fmmain,'DISABLEITEMS') ;

          end;


      Case ReadSysParam('BEditmode',0,RealUser).AsInteger of
       // 0 Invoice/Accounting
       // 1 Accounting
       // 2 POS
       // 3 workflow
        1 : begin
                fmMain.EditRepeatingInvoices.Visible := false ;
              fmMain.EditStockItems.Visible := false ;
              fmMain.InputAdjustStock.Visible := false ;
              fmMain.InputProjects.Visible := false ;
              fmMain.SetupDocuments.Visible := false ;
              fmMain.PointOfSales1.Visible := false ;
              fmMain.SetupSalesman.Visible := false ;
              fmMain.SetupStockInfo.Visible := false ;
              fmMain.EditRepeatingInvoices.Enabled := false ;
              fmMain.EditStockItems.Enabled := false ;
              fmMain.InputAdjustStock.Enabled := false ;
              fmMain.InputProjects.Enabled := false ;
              fmMain.SetupDocuments.Enabled := false ;
              fmMain.PointOfSales1.Enabled := false ;
              fmMain.SetupSalesman.Enabled := false ;
              fmMain.SetupStockInfo.Enabled := false ;

              fmMain.TBPlugin.Visible := False;
              fmMain.TBPlugin.Tag := 1;
            end;
        2  : begin




              fmMain.rbReports.Enabled := false ;

              fmMain.AToolsBackup.Enabled := false ;
              fmMain.tlbtnBatch.Enabled := false ;
              fmMain.aFileOpen.Enabled := false ;
              fmMain.tlbtnRecon.Enabled := false ;
              fmMain.tlbtnLink.Enabled := false ;


            end;
            3 : begin


              fmMain.mainRibbon.Visible := False ;



              fmMain.rbReports.Enabled := false ;

              fmMain.AToolsBackup.Enabled := false ;
              fmMain.tlbtnBatch.Enabled := false ;
              fmMain.aFileOpen.Enabled := false ;
              fmMain.tlbtnRecon.Enabled := false ;
              fmMain.tlbtnLink.Enabled := false ;


              fmMain.EditRepeatingInvoices.Visible := false ;
              fmMain.EditStockItems.Visible := false ;
              fmMain.InputAdjustStock.Visible := false ;
              fmMain.InputProjects.Visible := false ;


              fmMain.SetupDocuments.Visible := false ;
              fmMain.PointOfSales1.Visible := false ;
              fmMain.SetupSalesman.Visible := false ;
              fmMain.SetupStockInfo.Visible := false ;

              fmMain.EditRepeatingInvoices.Enabled := false ;
              fmMain.EditStockItems.Enabled := false ;
              fmMain.InputAdjustStock.Enabled := false ;

              fmMain.InputProjects.Enabled := false ;

              
              fmMain.SetupDocuments.Enabled := false ;
              fmMain.PointOfSales1.Enabled := false ;
              fmMain.SetupSalesman.Enabled := false ;
              fmMain.SetupStockInfo.Enabled := false ;

              fmMain.TBPlugin.Visible := False;
              fmMain.TBPlugin.Tag := 1;

            end;
         end ;//end case
          HandelSpecialUserMenu(fmmain,'DISABLEITEMS');
        end;
      end
      else
      begin
        tblSysVars.Open;
        fmMain.mainRibbon.Caption := Application.Title +' - ' + tblSysVarsSCompanyname.Value;
        //set the colour

        SetColour(tblSysVarsWColourID.Value);

        tblSysVars.Close;
        SetCurrentUser(0);
        RealUser:=CurrentUser;
       Case ReadSysParam('BEditmode',0,RealUser).AsInteger of
             //0 Invoice/Accounting
             //1 Accounting
             //2 POS
              1 : begin
                    fmMain.EditRepeatingInvoices.Visible := false ;
                    fmMain.EditStockItems.Visible := false ;
                    fmMain.InputAdjustStock.Visible := false ;
                    fmMain.InputProjects.Visible := false ;
                    fmMain.SetupDocuments.Visible := false ;
                    fmMain.PointOfSales1.Visible := false ;
                    fmMain.SetupSalesman.Visible := false ;
                    fmMain.SetupStockInfo.Visible := false ;
                    fmMain.EditRepeatingInvoices.Enabled := false ;
                    fmMain.EditStockItems.Enabled := false ;
                    fmMain.InputAdjustStock.Enabled := false ;
                    fmMain.InputProjects.Enabled := false ;
                    fmMain.SetupDocuments.Enabled := false ;
                    fmMain.PointOfSales1.Enabled := false ;
                    fmMain.SetupSalesman.Enabled := false ;
                    fmMain.SetupStockInfo.Enabled := false ;
                    fmMain.TBPlugin.Visible := False;
                    fmMain.TBPlugin.Tag := 1;
                  end;
              2 : begin

                    fmMain.rbReports.Enabled := false ;

                    fmMain.AToolsBackup.Enabled := false ;
                    fmMain.tlbtnBatch.Enabled := false ;
                    fmMain.aFileOpen.Enabled := false ;
                    fmMain.tlbtnRecon.Enabled := false ;
                    fmMain.tlbtnLink.Enabled := false ;

                  end;
                3 : begin


                            fmMain.mainRibbon.Visible := False ;

                            fmMain.rbReports.Enabled := false ;

                            fmMain.AToolsBackup.Enabled := false ;
                            fmMain.tlbtnBatch.Enabled := false ;
                            fmMain.aFileOpen.Enabled := false ;
                            fmMain.tlbtnRecon.Enabled := false ;
                            fmMain.tlbtnLink.Enabled := false ;
                            fmMain.EditRepeatingInvoices.Visible := false ;
                            fmMain.EditStockItems.Visible := false ;
                            fmMain.InputAdjustStock.Visible := false ;
                            fmMain.InputProjects.Visible := false ;
                            fmMain.SetupDocuments.Visible := false ;
                            fmMain.PointOfSales1.Visible := false ;
                            fmMain.SetupSalesman.Visible := false ;
                            fmMain.SetupStockInfo.Visible := false ;
                            fmMain.EditRepeatingInvoices.Enabled := false ;
                            fmMain.EditStockItems.Enabled := false ;
                            fmMain.InputAdjustStock.Enabled := false ;
                            fmMain.InputProjects.Enabled := false ;
                            fmMain.SetupDocuments.Enabled := false ;
                            fmMain.PointOfSales1.Enabled := false ;
                            fmMain.SetupSalesman.Enabled := false ;
                            fmMain.SetupStockInfo.Enabled := false ;
                            fmMain.TBPlugin.Visible := False;
                            fmMain.TBPlugin.Tag := 1;
                          end;
             end ;//end case

             handelDisableItems ;
             HandelSpecialUserMenu(fmmain,'DISABLEITEMS') ;
        with fmMain do
        begin
         if not(ReadSysParam('BEditmode',0,RealUser).AsInteger in [1,2]) then
          AdminUserMemu;

          UpDateThemes(DefaultThemeID,False);

        end;

      end;
      tblUser.Close;
    end;

  end;

  //set the language
  fmMain.SetUPTranslation;


 if DMTCCoreLink.TheZConnection.Connected then
    TDatabaseTableRoutines.DumpToReportmanTransport(nil,false,0);

 SaveOutput :=  DMTCCoreLink.ReadSysParam('WDEFAULTOUTPUTID',StrToIntDef(DMTCCoreLink.ReadSysVar('WDEFAULTOUTPUTID'),0),CurrentUser) ;

 fmMain.initMainplugins ;
  if FileExists(TDMTCCoreLink.GetLocalBaseDir +'actions.ini') then
    begin
      try
       // fmMain.ActionManager1.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir +'actions.ini');
      except

      end;


    end;

 finally
    if DMTCCoreLink.SimpleMode > 0  then
       begin
           handelHideSimple ;
       end;
 end;


end;

function CopyExistingBooks(SourceBooks, DestBooks, aName : String;CopyOverExistingBooks: Boolean = false) : Integer;

procedure CopyRecurse (AFolder,ADestFolder : String ) ;
var
  F:TSearchRec;
  ASrc,Adest: string ;

  i : Integer ;
begin
 AFolder:= IncludeTrailingPathDelimiter(AFolder) ;
 ADestFolder:= IncludeTrailingPathDelimiter(ADestFolder) ;
  if FindFirst(AFolder+'*.*',faAnyFile ,F)=0 then
  begin
   repeat
   if ((faDirectory in [f.Attr])) And (f.NAme<>'.') and (f.NAme<>'..') then
     begin
     CreateDir(ADestFolder+ f.NAme);
     CopyRecurse(AFolder + f.NAme,ADestFolder+ f.NAme)
     end  else

   if (f.NAme<>'.') and (f.NAme<>'..') then
     begin

         ASrc := AFolder + f.NAme ;
        Adest := ADestFolder+f.NAme ;

         CopyFile(Pchar(ASrc),pChar(ADest),false);
     end;
   // done : pieter Findclose to perserve resource
   until FindNext(F) <> 0;
   sysutils.FindClose(f);
  end;


end;

{**********
           This procedure allows the user to
           copy an existing set of books. It
           zips the Source directory then
           unzips it into the destination
           directory (which it creates) and
           adds a record to the books.db table

Note: Changed by sylvain to work without Zip Program
      9-10-00
           Returns a 0 if there was an error
            "    " 1 "   "     "  no errors
            "    " 2 "   the set of books already exists
**********}
//var
//  DelFile, Exec : array[0..255] of char;

Var
  SourceFile,DestFile:array[0..255] of char;

  Ok:Boolean;
begin
  Result := 0;

  // DestBooks:= DestBooks ;
  DestBooks := IncludeTrailingPathDelimiter(DestBooks) ;
  SourceBooks := IncludeTrailingPathDelimiter(SourceBooks) ;
  if UpperCase(DestBooks) = UpperCase(SourceBooks) then
    raise Exception.Create('Dest and source are the same!' + DestBooks);

  if ExtractFileExt(DestBooks) <> '' then
     DestBooks := ExtractFilePath(DestBooks);
  if ExtractFileExt(SourceBooks) <> '' then
     SourceBooks := ExtractFilePath(SourceBooks);

  fmMain.Cursor := crHourGlass;
  try
  // onlywhen there s set of books
  if DirectoryExists(DestBooks) and fileExists(DestBooks + 'Books.fdb')  then
  begin
    Result := 2;
    if not CopyOverExistingBooks then
      exit
    else
     begin
      // if we want to copy then we must delete all files

      DeleteAllFiles(DestBooks) ;
     end;
  end;
  CreateDir(DestBooks);
  Ok:=False;
  if FileExists(DestBooks + 'books.fdb') then
     RecycleFile(DestBooks + 'books.fdb') ;
  CopyRecurse(SourceBooks,DestBooks);
  {if FindFirst(SourceBooks+'*.*',faAnyFile ,F)=0 then
  begin
   StrPCopy(SourceFile ,SourceBooks+f.Name);
   StrPCopy(DestFile,DestBooks+F.Name);
   if (f.Attr=FaDirectory) And (f.NAme<>'.') and (f.NAme<>'..') then
     CopyFile(SourceFile,DestFile,Ok);

   while FindNext(F)=0 do
   begin
     if (f.NAme<>'.') and (f.NAme<>'..') then
     begin
         StrPCopy(SourceFile ,SourceBooks+f.Name);
         StrPCopy(DestFile,DestBooks+F.Name);
         CopyFile(SourceFile,DestFile,Ok);
     end;
   end;
   // done : pieter Findclose to perserve resource
   sysutils.FindClose(f);
  end;   }

  if FileExists(DestBooks + 'Books.fdb') then
  begin
     if TheGlobalDataObject.Books.FindBooksByPath(DestBooks+'books.fdb') = nil then
        with TheGlobalDataObject.Books.Add as TBooksCollectionItem do
        begin
          Name := aName ;
          Database :=  DestBooks+ 'Books.fdb' ;
          UserName := 'sysdba' ;
          Password := 'masterkey' ;
          result := 1;
        end;
  end
  else
    begin
    Raise Exception.Create('Books not foud. Please check rights!');
    result := 0;
    end;
 finally
  fmMain.Cursor := crArrow;
 end;
end;

function CreateBooks(BooksPath,BooksToCreate : String;AccountLength:Integer) : Integer;
begin
  Result := FctCreateBooks(BooksPath,BooksToCreate,AccountLength)
end;


procedure DeleteBooks(Path : String);
{******
       This procedure deletes the set of books
       by moving the files into a single zip file ,
       deleting the zip file and then deleting the
       directory and removing the record from the
       Books table.
******}
(* Changed by sylvain to delphi deletefile function
*)
// todo : Pieter The BDE locks a dir that hase been opend (see google ) so you cannot delete the directory.
// maby whe should make a delete list file that can be deleted next time TC starts.
var
  Ok:Integer;
  afmPassword:  TfmPassword;


begin
  Ok := 1;

  if ExtractFileExt(Path) <> '' then
     Path := ExtractFilePath(Path) ;
  Path := IncludeTrailingPathDelimiter(Path);

  fmMain.Cursor := crHourGlass;
  try
    if TheGlobalDataObject.Books.FindBooksByPath(Path+'books.fdb') <> nil then
    begin
      if (FileExists(Path+'books.fdb')) AND (GetDrvType(Path)<>4) then
      begin
      (* Test if setofBooks need PassWord*)
        With dmDatabase do
        begin
          // Keep Actual Folder;
          tblUser.Connection.Disconnect ;
          tblUser.Close;
          tblUser.Connection.Database:=Path+'books.fdb';
          tblUser.Open;
          if (tblUser.Locate('WUserID', 0, []) <> True) and
             (tblUser.RecordCount>0) then
          begin
             afmPassword:= TfmPassword.Create(Application);
             try
             afmPassword.Showmodal;
             finally
              afmPassword.free ;
             end;
            // Test if Password Correct
            tblUser.Close;
            tblUser.Connection.Disconnect ;
            tblUser.Connection.Database := '' ;
            // give te server time to release the DB
            Sleep(1000);
            if CurrentUser>0 then
              Ok:=ForceDeleteDir(Path);
          end
          else
          begin
            tblUser.Close;
            tblUser.Connection.Disconnect ;
            tblUser.Connection.Database := '' ;
            // give te server time to release the DB
            Sleep(1000);
            Ok:=ForceDeleteDir(Path);
          end ;
        end; //with
      end
      else // else FileExists(Path+'\user.db')
      begin
        Ok:=0;
      end;
      if Ok = 0 then
      begin
        TheGlobalDataObject.Books.Delete(TheGlobalDataObject.Books.FindBooksByPath(Path+'books.fdb').index);
        if TheGlobalDataObject.Books.Count > 0 then
        begin
        TheGlobalDataObject.Books.Books[0].Active := true ;
        TheGlobalDataObject.Books.Books[0].Selected := true ;
        end;
        TheGlobalDataObject.Save;
      end
      else
      begin
        OSFMessageDlg(IntToStr(Ok)+#13#10+'Error when Deleting set of books'+' '#13#10+Path,mtError,[mbok],0)
      end;
    end;
  finally
    fmMain.Cursor := crArrow;
  end;
end;

procedure CloseSetOfBooks;
{

  Closes the current set of books.

}
var
 i : integer ;
begin
 try
 // cleanup search pos
 if assigned(afmPosLookup) then
   FreeAndNil(afmPosLookup);

// clean up workflow ;
 if Application.FindComponent('fmWorkFlowHandel') <> nil then
   Application.FindComponent('fmWorkFlowHandel').Free ;


  for i := 1 to fmMain.PCMain.PageCount -1 do
   begin
     if fmMain.PCMain.Pages[i].Tag <> 0 then
       begin
       fmMain.PCMain.ActivePage := fmMain.PCMain.Pages[i] ;
       fmMain.PCMainChange(nil);

        if not TForm(fmMain.PCMain.Pages[i].Tag).CloseQuery then
          begin
          abort ;
          end;
       end;
   end;

  for i := 1 to fmMain.PCMain.PageCount -1 do
   begin
     if fmMain.PCMain.Pages[i].Tag <> 0 then
       begin
       TForm(fmMain.PCMain.Pages[i].Tag).close ;
       TObject(fmMain.PCMain.Pages[i].Tag).free ;
       fmMain.PCMain.Pages[i].Tag := 0 ;
       end;
   end;
  fmMain.PCMain.ActivePageIndex := 0 ;

  if assigned(JobProject) then
     FreeAndNil(JobProject) ;


  fmMain.ClearPlugins ;
  

  DoCloseSetOfBooks;




  //set the visible stuff
  with fmMain do
  begin


    rgSetupGroup.Enabled := False;
    //
    //ToolsMenu.Enabled := False;
    rbtools.Enabled := False;
    ToolsExport1.Enabled := False;
    Import1.Enabled := False;
    //
    rbReports.Enabled := False;
    tlBtnBatch.Enabled := False;
    TBPlugin.Enabled := False;
    //MIPlugin.Enabled := False;
    tlBtnRecon.Enabled := False;
    tlBtnLink.Enabled := False;

    Caption := Application.Title ;
    MainStatusBar.Panels[3].Text := '';

    btlSearch.Enabled := False;
    MainStatusBar.Panels[2].Text:='';
    MainStatusBar.Panels[1].Text:='';
    mainRibbon.ActivePage := rgStart ;

  end;
  If TheGlobalDataObject.Books.ActiveBooks <> nil then
     TheGlobalDataObject.Books.ActiveBooks.Active := false ;
//  ProperlyInUseClosed(True);
finally

    if DMTCCoreLink.SimpleMode > 0  then
       begin
           handelHideSimple ;
       end;
end;
end;

function  DataIntegrityCheck : Boolean;
{*********
          Do the Data integrity check
*********}
begin
  DataIntegrityCheck := True;
end;





{
function PostBatchLine(ADMCoreData : TDMCoreData;BatchTypeID : Integer;Var TransID:LongInt;BatCtrlID:integer;DocId : Integer) : Boolean;
Var
  tmp2:Integer;
begin
  Result := lrPostBatchLine(ADMCoreData,BatchTypeID,TransID,tmp2,DocId);
end;
 }

function GetPeriod(Date : TDateTime) : Integer;
begin
  Result := LrGetPeriod(Date);
end;

procedure CreateTotals(AccountID : Integer);
begin
  TDataBaseRoutines.CreateTotalsForAccount(AccountID);
end;//create totals



procedure ImportSetOfBooks(DirectoryToImportFrom : String);

begin

end;

function GetControlAccountID(AccountID: integer) : integer;
{Written by Philip}
{ This procedure will get the Control AccountID from the Sysvars file
0 returns an error unable to open Sysvars file
1 Debtors control Account
2 Creditors Control Account
3 retained Earnings Account   }

//Var
//  HoldActive:Boolean;
begin
  Result := LrGetControlAccountID(AccountID);

end;

function IsControlAccount(AccountID: integer) : Boolean;
{Written by Sylvain}
begin
   Result := (AccountID in [dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount,
                            dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount,
                            dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ]);
end;


procedure DoYearEnd(Silent : Boolean );

{
  This procedure Runs the yearend  procedure on a
  set of books.

  1) Converts this year transactions to Last years transactions.
  2) Deletes Last years transactions from the file
     Leaves Open items in the file but marks them as period 0
     and as carried forward
  3) Resets the year end total (period 0)
  4) Makes last years totals equal to this years totals
     Resets the year end total (period 0)
  5) Resets the period dates
 Re-writen By sylvain on 12/05/2004 due to 13 periods Bug. 
 }



var
  HoldAmount,
  YearTotal : Real;
  IncomeID,
  Test,TotalRec,NextYearID:Integer;
  vyear,vday,vmonth : word;
  ARPAcc:Boolean;
  Qgen : TuniQuery ;
  Mindate,Maxdate : TDateTime ;
  AProgress : TfmNewProgress ;
  Tekst : String ;
  LastyearsShutdown : array [0..30] of byte ;
  UsersInDatabase : Integer ;
  UserMessage : String ;
begin
UserMessage := TDatabaseTableRoutines.GetUsersInDatabase(UsersInDatabase);
if UsersInDatabase <> 0 then
  if OSFMessageDlg('Continue?'+#13+#10+UserMessage,mtConfirmation,[mbYes,mbNo],0) = mrNo then
     exit ;


 if not Silent then
 begin
  If Not( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo,mbHelp], 115)=mrYes) then
     exit;
  if OSFMessageDlg(GetTextLang(1005){Do you want to cancel the Year end Process}, mtconfirmation, [mbyes, mbno], 115) = mryes Then
    exit;
  end;
  dmDatabase.ZMainconnection.StartTransaction ;
  try
  Qgen := TuniQuery.create(nil) ;
  try
    Qgen.Connection := dmDatabase.ZMainconnection ;
    AProgress := TfmNewProgress.create(nil) ;
   // copy data to the hist table
   try
     Qgen.Close;
    Qgen.Filtered := False;
    Qgen.SQL.Text:='select min(DSTARTDATE)  from periods where WYearid = 1 ' ;
    Qgen.open ;
    Mindate := Qgen.Fields[0].AsDateTime ;


     Qgen.Close;
    Qgen.Filtered := False;
    Qgen.SQL.Text:='select max(DENDDATE)  from periods where WYearid = 1 ' ;
    Qgen.open ;
    Maxdate := Qgen.Fields[0].AsDateTime ;

    if FormatDateTime('YYYY',Mindate) = FormatDateTime('YYYY',Maxdate) then
       begin
        Tekst := FormatDateTime('YYYY',Mindate) ;
       end else
       begin
        Tekst := FormatDateTime('YYYY',Mindate) +'/' + FormatDateTime('YYYY',Maxdate);
       end;


    Qgen.Close;
    Qgen.Filtered := False;
    Qgen.SQL.Text:='select max(WYearID)  from periodhist ' ;
    Qgen.open ;
    NextYearID := Qgen.Fields[0].AsInteger + 1;
    Qgen.SQL.Text := 'insert into PERIODHIST  (WYEARID, WPERIODID, DSTARTDATE, DENDDATE, SDESCRIPTION, DSYSDATE)' +
     ' SELECT '+ IntToStr(NextYearID) + ',WPERIODID, DSTARTDATE, DENDDATE, SDESCRIPTION , CURRENT_TIMESTAMP FROM PERIODS where wyearid = 1 ' +
     ' union SELECT '+ IntToStr(NextYearID) + ',-1, ' +
     ' cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd',Mindate)) +' as timestamp) '
     + ' , ' +
     ' cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd',Maxdate)) +' as timestamp) '
     + ', '+QuotedStr(Tekst)+' , CURRENT_TIMESTAMP FROM RDB$DATABASE ' ;
    Qgen.ExecSQL ;

    Qgen.SQL.Text := 'insert into TOTALSHIST  (SACCOUNTCODE, WACCOUNTTYPEID, WACCOUNTID, WYEARID, WPERIODID, BACTUAL, FAMOUNT, DSYSDATE)' +
     'SELECT ACCOUNT.SACCOUNTCODE,ACCOUNT.WACCOUNTTYPEID,ACCOUNT.WACCOUNTID, '+ IntToStr(NextYearID) + ',WPERIODID, BACTUAL, FAMOUNT, ACCOUNT.DSYSDATE'+
     ' FROM TOTALS JOIN ACCOUNT ON TOTALS.WACCOUNTID=  ACCOUNT.WACCOUNTID WHERE wPERIODID < 14 AND wpeRIODID <> 0 '  ;

    Qgen.ExecSQL ;
    except

    end;
  try
  try
  fmMain.Cursor := crHourGlass;
  with dmDatabase do
  begin
    ZQTotals.SQL.Text := SQLList.GetFormatedSQLByName('database_SelectTotalsOnAccountPeriodActualAndYear') ;
    YearTotal:=0;

    Qgen.Close;
    Qgen.Filtered := False;
    Qgen.SQL.Text:='select min(WYearID) -1 from years ' ;
    Qgen.Open ;
    NextYearID := Qgen.Fields[0].AsInteger ;
    Qgen.Close ;
    // add entry in the years table
    Qgen.SQL.Text:='insert into Years values('+ IntToStr(NextYearID)+ ',' +QuotedStr('Old year') + ')' ;
    Qgen.ExecSQL ;
    // Insert a period ID
    Qgen.SQL.Text:='insert into Periods values('+ IntToStr(NextYearID)+ ',-1,'
     +QuotedStr('1600-01-01')+ ','+QuotedStr('1600-01-01')+ ','+QuotedStr('Old year')+',1,1)' ;
    Qgen.ExecSQL ;

    Qgen.SQL.Text:='Update Transact set WPeriodID = -1,WYearID = WYearID -1 where WPeriodId < 1';
    Qgen.ExecSQL ;
    Qgen.SQL.Text:='Select count(*) from Totals Where WperiodID>=14 AND BActual = 1 ';
    Qgen.Open;
    TotalRec := Qgen.Fields[0].AsInteger ;
    // Clean Last years totals
    // Delete them now We
    Qgen.SQL.Text:='Delete from Totals where WyearId = 1';
    Qgen.ExecSQL;
    // DELETE PERIOD -1 (LASTYEARS BALANCE_
    Qgen.SQL.Text:='delete from totals where WPeriodID = -1 and WYearId = -1';
    Qgen.ExecSQL;
    //  copy opening balance
    Qgen.SQL.Text:='insert into totals select totals.WAccountId,-1,-1,BACTUAL, FAMOUNT,null from totals join account on account.Waccountid = totals.Waccountid  where WyearId = 2 and WPeriodId = 0' ;
    Qgen.ExecSQL;



    Qgen.SQL.Text:='Select * from Totals Where WperiodID>=14 AND Wyearid in (2) and BActual= 1 order by WperiodID ';
    Qgen.Open;
    // last gets all data and chashed
    if not Qgen.IsEmpty then
    Qgen.last ;
    Qgen.First;

    TotalRec := Qgen.RecordCount ;

    AProgress.initProgress(gettextlang(3009){'Moving Totals...'},TotalRec);
    Application.ProcessMessages ;
    Test := 0 ;

    while not Qgen.EOF do
    begin
      Test:=Test+1;
      AProgress.SetProgress('',Test);

      try
        IncomeID:=GetAccountIncome(dmdatabase.Qgen.FieldbyName('WAccountID').AsInteger,ARPAcc);
        // This year
        ZQTotals.Close ;
        ZQTotals.ParamByName('WAccountId').AsInteger :=  dmdatabase.Qgen.FieldbyName('WAccountID').AsInteger ;
        ZQTotals.ParamByName('WPeriodId').AsInteger := dmdatabase.Qgen.FieldbyName('WPeriodID').AsInteger ;
        ZQTotals.ParamByName('BActual').AsInteger := 1 ;
        ZQTotals.ParamByName('WyearId').AsInteger := 2 ;
        ZQTotals.open ;
        if ZQTotals.IsEmpty then
           begin
            ZQTotals.Insert ;
            ZQTotals.FieldByName('WAccountId').AsInteger :=  ZQTotals.ParamByName('WAccountId').AsInteger ;
            ZQTotals.FieldByName('WPeriodId').AsInteger := ZQTotals.ParamByName('WPeriodId').AsInteger ;
            ZQTotals.FieldByName('BActual').AsInteger := ZQTotals.ParamByName('BActual').AsInteger ;
            ZQTotals.FieldByName('WyearId').AsInteger := ZQTotals.ParamByName('WyearId').AsInteger ;
            ZQTotals.Post ;
           end;


        if not ZQTotals.IsEmpty then
        begin
          if IncomeID=1 then
            YearTotal := YearTotal + ZQTotalsFAmount.Value;
          HoldAmount := ZQTotalsFAmount.value;
          dmDatabase.ZQTotals.Delete ;
               // Last Year
          dmDatabase.ZQTotals.Close ;
          dmDatabase.ZQTotals.ParamByName('WAccountId').AsInteger :=  dmdatabase.Qgen.FieldbyName('WAccountID').AsInteger ;
          dmDatabase.ZQTotals.ParamByName('WPeriodId').AsInteger := dmdatabase.Qgen.FieldbyName('WPeriodID').AsInteger - 13 ;
          if dmDatabase.ZQTotals.ParamByName('WPeriodId').AsInteger > 13 then
            Raise Exception.Create('Your totals table has invalide entry`s');


          dmDatabase.ZQTotals.ParamByName('BActual').AsInteger := 1 ;
          dmDatabase.ZQTotals.ParamByName('WyearId').AsInteger := 1 ;
          dmDatabase.ZQTotals.open ;
          if ZQTotals.IsEmpty then
            begin
            ZQTotals.Insert ;
            ZQTotals.FieldByName('WAccountId').AsInteger :=  ZQTotals.ParamByName('WAccountId').AsInteger ;
            ZQTotals.FieldByName('WPeriodId').AsInteger := ZQTotals.ParamByName('WPeriodId').AsInteger ;
            ZQTotals.FieldByName('BActual').AsInteger := ZQTotals.ParamByName('BActual').AsInteger ;
            ZQTotals.FieldByName('WyearId').AsInteger := ZQTotals.ParamByName('WyearId').AsInteger ;
            ZQTotals.Post ;
            end;
         ZQTotals.Edit;
         ZQTotalsFAmount.value := HoldAmount;
         ZQTotals.Post;

           // Openning Balances
          dmDatabase.ZQTotals.Close ;
          dmDatabase.ZQTotals.ParamByName('WAccountId').AsInteger :=  dmdatabase.Qgen.FieldbyName('WAccountID').AsInteger ;
          dmDatabase.ZQTotals.ParamByName('WPeriodId').AsInteger := 0 ;
          dmDatabase.ZQTotals.ParamByName('BActual').AsInteger := 1 ;
          dmDatabase.ZQTotals.ParamByName('WyearId').AsInteger := 2 ;
          dmDatabase.ZQTotals.open ;
        if ZQTotals.IsEmpty then
           begin
            ZQTotals.Insert ;
            ZQTotals.FieldByName('WAccountId').AsInteger :=  ZQTotals.ParamByName('WAccountId').AsInteger ;
            ZQTotals.FieldByName('WPeriodId').AsInteger := ZQTotals.ParamByName('WPeriodId').AsInteger ;
            ZQTotals.FieldByName('BActual').AsInteger := ZQTotals.ParamByName('BActual').AsInteger ;
            ZQTotals.FieldByName('WyearId').AsInteger := ZQTotals.ParamByName('WyearId').AsInteger ;
            ZQTotals.Post ;
           end;
           
          if IncomeID<>0 then
            HoldAmount := 0;
          ZQTotals.Edit;
          dmDatabase.ZQTotalsFAmount.value := HoldAmount + dmDatabase.ZQTotalsFAmount.value;
          ZQTotals.Post;
        end;
      except
       on  e : Exception do
        begin
         Raise Exception.Create(e.Message + ' on account' + ZQTotals.ParamByName('WAccountId').AsString+ ' Period ' + ZQTotals.ParamByName('WPeriodId').AsString);
        end;
      end;
      Qgen.Next;
    end;//While
    Qgen.Close;
    tblAccount.Active := false ;

   dmDatabase.tblTotals.Filtered:=False;
   dmDatabase.tblTotals.Filter:='';

   ZQTotals.Close ;
   ZQTotals.ParamByName('WAccountId').AsInteger :=  dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ;
   ZQTotals.ParamByName('WPeriodId').AsInteger := 0 ;
   ZQTotals.ParamByName('BActual').AsInteger := 1 ;
   ZQTotals.ParamByName('WyearId').AsInteger := 2 ;
   ZQTotals.open ;

    if dmDatabase.ZQTotals.IsEmpty then
      begin
       dmDatabase.ZQTotals.Insert ;
       dmDatabase.ZQTotalsWACCOUNTID.AsInteger := ZQTotals.ParamByName('WAccountId').AsInteger ;
       dmDatabase.ZQTotalsWPERIODID.AsInteger := ZQTotals.ParamByName('WPeriodId').AsInteger ;
       dmDatabase.ZQTotalsWYEARID.AsInteger := ZQTotals.ParamByName('WyearId').AsInteger ;
       dmDatabase.ZQTotalsBACTUAL.AsInteger := ZQTotals.ParamByName('BActual').AsInteger ;
       dmDatabase.ZQTotalsFAMOUNT.asfloat := 0 ;
       dmDatabase.ZQTotals.Post ;
      end;
    ZQTotals.Edit;
    ZQTotalsFAmount.Value := ZQTotalsFAmount.Value +YearTotal;
    ZQTotals.Post;
    ZQTotals.Close;
    ZQTransAction.SQL.Text := 'Select * from transact where WYearID in (1,2)';
    ZQTransAction.FetchRows := 65535 ;
    ZQTransAction.Open;
    ZQTransAction.First;
    AProgress.initProgress('Transactions ..',ZQTransAction.RecordCount);
    Application.ProcessMessages ;
    Test := 0 ;
    while not ZQTransAction.EOF do
    begin
      AProgress.SetProgress('',Test);
      inc(Test);
      if ZQTransActionWPeriodID.Value > 13 then
      begin
          ZQTransAction.Edit;
          ZQTransActionWPeriodID.Value := ZQTransActionWPeriodID.Value - 13;
          ZQTransActionWYEARID.AsInteger := ZQTransActionWYEARID.AsInteger - 1 ;
          ZQTransAction.Post;
          ZQTransAction.next;
      end
      else
      begin
        // Do not delete else we can recalculate
        // We can make a option to delete years simehwere lese
          // lets not do the old ones (year before old year )
          // this way we save all data
          // Should never happen
           if ZQTransActionWPeriodID.Value > -1 then
            begin
            ZQTransAction.Edit;
            // 0 makes it come up in the recalc lets make it a fake period.
            ZQTransActionWPeriodID.Value := -1;
            ZQTransActionWYEARID.AsInteger := ZQTransActionWYEARID.AsInteger + - 1 ;
            // Should never happen
            ZQTransAction.Post;
            ZQTransAction.next;
            end else
            ZQTransAction.next;
      end;
    end;//while
    ZQTransAction.Close;
    //Update PEriod Dates
    tblPeriods.Open;
    tblPeriods.First;
    while not tblPeriods.EOF do
    begin
       tblPeriods.Edit;
       DecodeDate(tblPeriodsDStartDate.Value,vYear,vMonth,vDay);
       vYear := vYear +1;
       if (VMonth=2) And (vDay in [28,29]) then
         vDay := EndOfMonth(2,vYear);
       tblPeriodsDStartDate.Value := EncodeDate(vYear,vMonth,vDay);
       DecodeDate(tblPeriodsDEndDate.Value,vYear,vMonth,vDay);
       vYear := vYear +1;
       if (VMonth=2) And (vDay in [28,29]) then
         vDay := EndOfMonth(2,vYear);
       tblPeriodsDEndDate.Value := EncodeDate(vYear,vMonth,vDay);
       if  tblPeriodsWPERIODID.AsInteger > -1 then
           LastyearsShutdown[tblPeriodsWPERIODID.AsInteger] := tblPeriodsBSHUTDOWN.AsInteger ;
       tblPeriodsBSHUTDOWN.AsInteger := 0 ;
       tblPeriods.Post;
       tblPeriods.Next;
    end;
tblPeriods.First;
    while not tblPeriods.EOF do
    begin
      if tblPeriodsWPERIODID.AsInteger < 14 then
        begin
          tblPeriods.Edit ;
          if  tblPeriodsWPERIODID.AsInteger > -1 then
          tblPeriodsBSHUTDOWN.AsInteger := LastyearsShutdown[tblPeriodsWPERIODID.AsInteger + 13] ;
          tblPeriods.Post;
         end;
     tblPeriods.Next;
    end;
    tblPeriods.Close;
    end; //with dmDatabase
  // set opening balans Thisyear
  qGen.SQL.Text := 'Delete from totals where FAmount = 0 and BActual = 1 and totals.wPeriodid <> 0' ;
  Qgen.ExecSQL ;
  qGen.SQL.Text := 'Delete from totals where FAmount is null and BActual = 1 and totals.wPeriodid <> 0' ;
  Qgen.ExecSQL ;
  fmMain.Cursor := crDefault;
  AProgress.CloseProgress ;
  if not silent then
  OSFMessageDlg(gettextlang(3008){end of year was succesfull},mtConfirmation,[mbyes],0);
  finally
     fmMain.Cursor := crDefault;
  end;
  finally
    AProgress.CloseProgress ;
    AProgress.Free ;
  end;
  finally
     Qgen.free ;
  end;
  dmDatabase.ZMainconnection.Commit ;
  finally
   if dmDatabase.ZMainconnection.InTransaction then
     begin
      dmDatabase.ZMainconnection.Rollback ;
      OSFMessageDlg('Error In opening new year!',mterror,[mbok],0);
     end;
  end;
end;  //YEar end



procedure ClearReset(DoStockQuestion : Boolean = False );

//  This procedure clears the
//  set of books. It sets all
//  the totals to 0 and clears
//  the transaction files.



begin
  fmMain.Cursor := crHourGlass;
  with dmDatabase do
  begin
  {  tblTotals.Open;
    tblTotals.First;
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1849); //'Clearing Totals...';
    fmMain.MainProgressBar.StepBy(1);
    fmMain.MainProgressBar.Repaint;
    while not tblTotals.EOF do
    begin
      tblTotals.Edit;
      fmMain.MainStatusBar.Panels.Items[0].Text := fmMain.MainStatusBar.Panels.Items[0].Text + '.';
      tblTotalsFAmount.Value := 0;
      tblTotals.Post;
      tblTotals.Next;
    end;  }
    DMTCCoreLink.ExecSql('Update totals set FAmount = 0 where bactual = 1 ');
    tblTotals.Close;
    tblBatchControl.Close;
    tblDocLine.Close;
    tblDocHeader.Close;
    tblTransaction.CLose;
    tblStockTrans.CLose;
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1850); //'Clearing Transactions...';
    fmMain.MainProgressBar.StepBy(3);
    fmMain.MainProgressBar.Repaint;
    ClearTable(tblTransaction.TableName);
    // tblTransaction.EmptyTable;
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1851); //'Clearing Stock Transactions...';
    fmMain.MainProgressBar.StepBy(2);
    fmMain.MainProgressBar.Repaint;
    ClearTable(tblStockTrans.TableName);
// Syl
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1852); //'Clearing Stock Informations...';
    fmMain.MainProgressBar.StepBy(2);
    fmMain.MainProgressBar.Repaint;
    if DoStockQuestion then
    begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(3081),mtConfirmation,[mbyes,mbno],0) = mryes then
    begin
      ExecSql('Update stock set FunitAveCost=0 , FunitCost = 0 ,FOpeningAveCost = 0, FOpeningQty = 0, FInvQtyOnHand = 0 , FQtyOnHand = 0');
      ExecSql('Update STOCKOPTIONS set FunitAveCost=0 , FunitCost = 0 ,FQTYONHAND = 0');
    end ;
    end else
    begin
      ExecSql('Update stock set FunitAveCost=0 , FunitCost = 0 ,FOpeningAveCost = 0, FOpeningQty = 0, FInvQtyOnHand = 0 , FQtyOnHand = 0');
      ExecSql('Update STOCKOPTIONS set FunitAveCost=0 , FunitCost = 0 ,FQTYONHAND = 0');
    end;
    ExecSql('Update stock set fopeningQty = FQtyOnHand') ;
    // Added by Sylvain
    tblBackOrder.Close;
    ClearTable(tblBackOrder.TableName);
    //
    // Added by Sylvain
    tblOILinks.Close;
    ClearTable(tblOILinks.TableName);
    //
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1853); //'Clearing Documents Transactions...';
    fmMain.MainProgressBar.StepBy(3);
    fmMain.MainProgressBar.Repaint;
    if DoStockQuestion then
    begin
    if OSFMessageDlg( GetTextLang(3371),mtConfirmation,[mbyes,mbno],0) = mrno then
      begin
        ExecSql('Update DocHead set BPosted = 0') ;
        ExecSql('Update DocHead set WOPENITEMTRANSACTID = null') ;
      end else
      begin
       ClearTable('DocLine');
       ClearTable('DocHead');
       TDataBaseRoutines.ExecSql('delete from MULTIMEDIABLOB where WMMID in (select a.WMMID from MULTIMEDIA a where (a.STYPE = ' + QuotedStr('DOC') + ')) ');
       TDataBaseRoutines.ExecSql('delete from MULTIMEDIA where  STYPE = ' + QuotedStr('DOC') );
     end;
    end else
    begin
    ClearTable('DocLine');
    ClearTable('DocHead');
    TDataBaseRoutines.ExecSql('delete from MULTIMEDIABLOB where WMMID in (select a.WMMID from MULTIMEDIA a where (a.STYPE = ' + QuotedStr('DOC') + ')) ');
    TDataBaseRoutines.ExecSql('delete from MULTIMEDIA where  STYPE = ' + QuotedStr('DOC') );
    end;

    ClearTable('TEMP1');
    ClearTable('TEST');
    ClearTable('TMPAGEAN');
    fmMain.MainStatusBar.Panels.Items[0].Text := GetTextLang(1854); //'Clearing Batch Information...';
    fmMain.MainProgressBar.StepBy(1);
    fmMain.MainProgressBar.Repaint;
    ClearTable(tblBatchControl.TableName);
    ClearTable('messages');
    fmMain.MainStatusBar.Panels.Items[0].Text := '';
    fmMain.MainProgressBar.Repaint;

    // CLear Pos tmp Files
    dmDatabase.tblGroups.Open;
    dmDatabase.tblGroups.Filtered:=False;
    dmDatabase.tblGroups.Filter:='WGroupTypeID=31';
    dmDatabase.tblGroups.Filtered:=True;
    dmDatabase.tblGroups.First;
    While Not dmDatabase.tblGroups.eof do
    begin
      if TDataBaseRoutines.TableExist('PosPymtInv' + IntToStr(dmDatabase.tblGroupsWgroupID.Value) ) then
      begin
        Try
          dmdatabase.tblBatch.Close;
          dmdatabase.tblBatchRefTotals.Close ;
          ClearTable('PosPymtInv' + IntToStr(dmDatabase.tblGroupsWgroupID.Value));
        except end;
      end;
       // Sysutils.DeleteFile('PosPymtInv' + IntToStr(dmDatabase.tblGroupsWgroupID.Value) + '.db');
      ResetCashup(dmDatabase.tblGroupsWgroupID.Value);
      dmDatabase.tblGroups.Next;
    end;
    dmDatabase.tblGroups.Close;
    dmDatabase.tblGroups.Filtered:=False;
    dmDatabase.tblGroups.Filter:='';
    {Reset Keys}  {
    TDataBaseRoutines.ExecSql('UPDATE global SET ' +
              'global.WNEWACCOUNTID = 1,'  +
              'global.WNEWBACKORDERID = 1,' +
              'global.WNEWCONTACTID = 1,'      +
              'global.WNEWBATCHTYPEID = 1,'   +
              'global.WNEWBATCHID = 1,         '   +
              'global.WNEWGROUPID = 1,         '  +
              'global.WNEWCURRENCYID = 1,   '  +
              'global.WNEWDOCID = 1,             '  +
              'global.WNEWLABSPECSID = 1,   '  +
              'global.WNEWREPORTID = 1,       '  +
              'global.WNEWTRANSACTIONID = 1,'+
              'global.WNEWSTOCKID = 1,            '+
              'global.WNEWUNITID = 1,              '+
              'global.WNEWUSERID = 1,              '+
              'global.WNEWMESSAGEID = 1,        '+
              'global.WNEWSTOCKTRANSID = 1   ';  }


TDataBaseRoutines.ExecSql('UPDATE global SET ' +
              'global.WNEWBACKORDERID = 1,' +
              'global.WNEWBATCHTYPEID = 1,'   +
              'global.WNEWBATCHID = 1,         '   +
              'global.WNEWDOCID = 1,             '  +
              'global.WNEWTRANSACTIONID = 1,'+
              'global.WNEWMESSAGEID = 1,        '+
              'global.WNEWSTOCKTRANSID = 1   ');


    {Clear Global Var}


    ClearTable('LOGGEDIN') ;

    ClearTable('PERIODHIST') ;
    ClearTable('TOTALSHIST') ;

     ClearTable('GROUPSSTATUS') ;

       if TDatabaseTableRoutines.FieldExists('WORKFLOWRIGHTS','WWORKFLOWTYPEID') then
         begin
           ClearTable('WORKFLOWWORKHIS') ;
           ClearTable('WORKFLOWWORK') ;
         end;


    tblsysparams.Open;
    WriteSysParam('SImportFileSeq',0,0);
    tblsysparams.Close;
    TblTasks.close ;
    ClearTable(TblTasks.TableName) ;
    TblEvents.close ;
    ClearTable(TblEvents.TableName) ;
  end;
  // Added by Sylvain
  // Delete All Batch Files
  ClearAndCreateBatFiles(true) ;
  DeleteOnlineBank;
  fmMain.MainProgressBar.Position := 0;
  fmMain.MainProgressBar.Repaint;
  fmMain.Cursor := crDefault;
end; //clear/reset




procedure DeleteAccount(var ErrMessage :String;AccountID : Integer);
{

   This procedure deletes an account.
   It checks the Transaction table to
   see if it can be deleted or not.

}
var

  AQuery , BQuery : TuniQuery ;
begin

  DMTCCoreLink.TheZConnection.StartTransaction ;
  try
  AQuery := TuniQuery.create(nil) ;
  BQuery := TuniQuery.create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  BQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.sql.Text := 'select * from account where WAccountID =' + IntToStr(AccountID);
  AQuery.open ;
  if AQuery.IsEmpty then exit ;

 //check to see if there are transactions for this account
    BQuery.SQL.Text := 'select count(WAccountID)  from transact where WAccountID = ' +IntToStr(AccountID) ;
    BQuery.Open ;
    if BQuery.Fields[0].AsInteger > 0 then
    begin
      if ErrMessage <> '' then
       ErrMessage := ErrMessage + #13+#10 ;
      ErrMessage := ErrMessage + GetAccountCodeAndDescription(AccountID)+#13#10+GetTextLang(774){'This account has transactions, Cannot be deleted'} ;
      Exit;
    end;
 // check for documents
    BQuery.SQL.Text := 'select count(WAccountID)  from dochead where WAccountID = ' +IntToStr(AccountID) ;
    BQuery.Open ;
    if BQuery.Fields[0].AsInteger > 0 then
    begin
        if ErrMessage <> '' then
       ErrMessage := ErrMessage + #13+#10 ;
      ErrMessage :=ErrMessage + GetAccountCodeAndDescription(AccountID)+#13#10+GetTextLang(774); {'This account has transactions, Cannot be deleted'}
      Exit;
    end;


    DMTCCoreLink.ExecSql('delete from totals where WAccountid =' + IntToStr( AccountID));
    //delete the record in all table's
    DMTCCoreLink.ExecSql('delete from bank where WAccountid =' + IntToStr( AccountID)) ;
    DMTCCoreLink.ExecSql('delete from tax where WAccountid =' + IntToStr( AccountID)) ;
    DMTCCoreLink.ExecSql('delete from Creditor where WAccountid =' + IntToStr( AccountID));
    DMTCCoreLink.ExecSql('delete from Debtor where WAccountid =' + IntToStr( AccountID));
    DMTCCoreLink.ExecSql('delete from account where WAccountid =' + IntToStr( AccountID));

  DMTCCoreLink.TheZConnection.Commit ;
  finally
    AQuery.free ;
    BQuery.free ;
  end;
  finally
   if DMTCCoreLink.TheZConnection.InTransaction then
     DMTCCoreLink.TheZConnection.Rollback ;
  end;
end;


function IsMainAccountWithSub(AccountCode:String;Var IsIncome:Boolean) : Boolean;Overload;
begin
  IsIncome:=False;
  with dmDatabase do
  begin
    tblAccount.Open;
    if tblAccount.locate('SACCOUNTCODE',VarArrayOf([GetMainAccountCode(AccountCode)+GetSubAccountCode(AccountCode)]),[]) then
    begin
      if (tblAccountBSubAccounts.Value = 1) then
         Result := true
      else
         Result := false;
      IsIncome:= tblAccountBIncomeExpense.Value=1;
    end
    else
         Result := false;
    tblAccount.Close;
  end;
end;

function IsMainAccountWithSub(AccountCode:String) : Boolean;Overload;
//Sylvain
begin
  with dmDatabase do
  begin
    tblAccount.Open;
    if tblAccount.locate('SACCOUNTCODE',VarArrayOf([GetMainAccountCode(AccountCode)+GetSubAccountCode(AccountCode)]),[]) then
      if (tblAccountBSubAccounts.Value = 1) then
         IsMainAccountWithSub := True
      else
         IsMainAccountWithSub := false
    else
         IsMainAccountWithSub := false;
    tblAccount.Close;
  end;
end;


//function GetAccountIncome(AccountID: integer) : Integer;
function  GetAccountIncome(AccountID: integer;Var ARPAccount:Boolean) : Integer;
//this function returns true if the account is an income statement
//returns false if balance sheet.
//philip
// Add by Sylvain
// Test also if it's main account without Sub Accounts
// Result -1 if Main Income Account
//        0 if not Income Account
//        1 if Sub Income Account
Var
  ASql : TuniQuery ;
begin
  ASql := TuniQuery.create(nil) ;
  try
     ASql.Connection := dmDatabase.ZMainconnection ;
     ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectAccountIncExpOnAccountId');
     ASql.ParamByName('WAccountid').AsInteger := AccountID ;
     ASql.open ;
     Result := ASql.FieldByName('BIncomeExpense').asinteger ;
     ARPAccount := ASql.FieldByName('WAccountTypeID').AsInteger in [1,2];

    if ASql.FieldByName('BIncomeExpense').Value = 1 then
    begin
      if (ASql.FieldByName('SSUBACCOUNTCODE').AsString='000') then
        Result:=1
      else
        Result:=-1;
    end;

     ASql.close ;

  finally
    ASql.free ;
  end;
end;


Function  CallNewLookup(Kind : Integer;BAsFrom:Boolean) : Boolean;
begin
  Result := False;
  Case Kind of
    30:Result := SelectLookup(ReturnBatch,BAsFrom);
  end;
end;




procedure CheckUnpostedItems;


{

  This checks for unposted items
  and displays them for the user.

}
begin
  FmLookup.IsShowForm := false ;
  fmCheckUnpost.Check;
end;

procedure ClearLinks(AccountID : Integer;FrDate,ToDate:TDate;Side:Byte);

{

   This procedure will Delete all links and return all outstanding amounts
   to the FAmounts

}
Var
  UnLink : Boolean ;
  trID : Integer;
  AProgress : TfmNewProgress ;
begin
// if Side=50 then exit ;
 // if all links are deleted we should clear out the whole from io of all the transactions involved (some garbage data will remail otherwize)

 if Side>10 then
   begin
    //Set all transations to famount
    dmDatabase.qGen.sql.text := 'update transact set  FOutstandingAmount =  FAmount where WAccountId = ' + IntToStr(AccountID)  ;
    dmDatabase.qGen.execSql ;
    // now just delete all io links
    dmDatabase.qGen.sql.text := 'delete from OILinks where WAMOUNTTRANSACTIONID in (select a.WTRANSACTIONID from transact a where OILINKS.WAMOUNTTRANSACTIONID = a.WTRANSACTIONID and a.WAccountid =' + IntToStr(AccountID) +')';
    dmDatabase.qGen.execSql ;
    dmDatabase.qGen.sql.text := 'delete from OILinks where WLINKTRANSACTIONID in (select a.WTRANSACTIONID from transact a where OILINKS.WLINKTRANSACTIONID = a.WTRANSACTIONID and a.WAccountid =' + IntToStr(AccountID) +')';
    dmDatabase.qGen.execSql ;
    exit ;
   end;

  AProgress := TfmNewProgress.create(nil) ;
  try

  with dmDatabase do
  begin
    ZQTransAction.SQL.Text := 'Select * from transact where WAccountid = ' + IntToStr(AccountID) +' and DDate >= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(FrDate) +
    'and DDate <=' +   TDatabaseTableRoutines.GetFirebirdsSqlForDate(ToDate) ;
    ZQTransAction.Open;
    ZQTransAction.last ;
    AProgress.initProgress('Unlinking',ZQTransAction.RecordCount);

    //filter for the account
    ZQTransAction.First;
    while not ZQTransAction.EOF do
    begin
      UnLink := False;
      AProgress.SetProgress('',ZQTransAction.RecNo);

      if ((ZQTransActionDDate.Value>=FrDate) And (ZQTransActionDDate.Value<=ToDate)) AND
         (
         ((Side=1) and (ZQTransActionFAmount.Value>0)) or
           ((Side=2) and (ZQTransActionFAmount.Value<0)) or (Side=0)
         ) then
      begin
        UnLink := True;
      end;

      if UnLink then
      Begin
        TDataBaseLedgerRoutines.ClearLink([ZQTransActionWTRANSACTIONID.AsInteger]);


      end;
      // Use Open Item Link History
      ZQTransAction.Next
    end;
   ZQTransAction.Close;
   ZQOILinks.Close;
  end;
  finally
     AProgress.free ;
  end;
end;



procedure CreateBBFLinks(AccountID : Integer;FrDate,ToDate:TDate;UseFrDate:Boolean;DocOnly : Boolean = false );
{

  This function
  for debors
  allocates outstanding credits to outstanding debits oldest first.
  Modified by Sylvain 17/04/2001

}
var
  TotRec,
  FromTransID ,ToTransId  : Integer;
  FromOutstandingAmount,
  LinkAmount  : Real;
  Debtor,Ok,
  AllAllocated : Boolean;
  DateFilter : String;
  prgIc:Integer;
  AProgress : TfmNewProgress ;
  ADocid : Integer ;
  TrnList,Subtrnlist : TStringlist ;
  TempValue1,TempValue2 : Double ;
begin
  // todod ; SQLOPTIMIZE
  AProgress := TfmNewProgress.create(nil) ;
  try
  TrnList := TStringlist.create  ;
  Subtrnlist := TStringlist.create  ;
  try
  AllAllocated := False;
  with dmDatabase do
  begin
    // check to see if Account is a debtor or a creditor
      Debtor := getaccountType(AccountID) = 1 ;

    {  tblAccount.Open;
      tblAccount.Filtered:=False;
      tblAccount.locate('WaccountID',Account,[]);
      if tblAccountWAccountTypeID.value=2 then Debtor:=False;
      tblAccount.Close;  }
      {Added by Sylvain
       Get Last year Opening Balances
       it must be equal to Period 0 total Amount }
      {}
    //  FixDtCrOutStanding(AccountID);

     // ZqTransaction.Open;
      // TODO : BDEINDER
      // ZqTransaction.Indexname := 'ind_DDate';
      AProgress.initProgress(gettextlang(2062),0);
      AProgress.InitSubProgress(gettextlang(2063),0);
      prgIc:=0;
      Ok := False;

      if UseFrDate then
        DateFilter := ' and DDate>=' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(FrDate)
        else
         DateFilter := ' and DDate<=' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(ToDate) ;

      while not AllAllocated do
      begin
        //i:=0;
        //find the first unlinked Credit or Debit
        ZqTransaction.SQL.Text :='select * from transact where waccountid =  ' + IntToStr(AccountID) ;
        if Debtor then
          ZqTransaction.SQL.Add(' and FOutstandingAmount < 0 ')
        else
          ZqTransaction.SQL.Add(' and FOutstandingAmount > 0 ');

       // if DocOnly then
       //    ZqTransaction.SQL.Add(' and WDocid <> 0 ') ;

        ZqTransaction.IndexFieldNames := '' ;
        ZqTransaction.SQL.add(DateFilter) ;
        ZqTransaction.SQL.add(' order by ddate,WTRANSACTIONID') ;
        ZqTransaction.open ;

        //check if there are still amounts outstanding
        if Not Ok then
        begin
          TotRec := ZqTransaction.RecordCount;
          AProgress.initProgress(gettextlang(2062) + ' ' + IntToStr(TotRec),TotRec);
          Ok:=True;
        end;
        if ZqTransaction.RecordCount = 0 then
          AllAllocated := True
        else
        //make allocations with the outstanding amount
        begin
          //inc(i);
          Inc(prgIc);
          ZqTransaction.First;
          if DocOnly then
          begin

          while  ((TrnList.IndexOf(ZQTransActionWTRANSACTIONID.AsString) <> -1 ) and (not ZqTransaction.Eof))  do
                  ZqTransaction.next  ;



            TrnList.Add(ZQTransActionWTRANSACTIONID.AsString)   ;


               if  ZQTransAction.Eof then
                 begin
                 exit ;
                 end;
          end;

          // Store in variables
          FromTransID := ZqTransactionWTransactionID.AsInteger;
          FromOutstandingAmount :=  ZqTransactionFOutstandingAmount.AsFloat;
          ADocid  :=  ZQTransActionWDOCID.AsInteger;


          while (((FromOutstandingAmount  < 0) and (Debtor)) or
                 ((FromOutstandingAmount  > 0) and (not Debtor)))and
                 (Not AllAllocated) do begin
        ZqTransaction.SQL.Text :='select * from transact where waccountid =  ' + IntToStr(AccountID) ;
        if Debtor then
          ZqTransaction.SQL.Add(' and FOutstandingAmount > 0 ')
        else
          ZqTransaction.SQL.Add(' and FOutstandingAmount < 0 ');

      //  if DocOnly then
      //     ZqTransaction.SQL.Add(' and WDocid = ' + IntToStr(ADocid)) ;

        ZqTransaction.SQL.add(DateFilter) ;
        ZqTransaction.SQL.add(' order by ddate,WTRANSACTIONID') ;
        ZqTransaction.open ;


{ if DocOnly then
          begin

          while  ((TrnList.IndexOf(ZQTransActionWTRANSACTIONID.AsString) <> -1 ) and (not ZqTransaction.Eof))  do
                  ZqTransaction.next  ;

           if TrnList.IndexOf(ZQTransActionWTRANSACTIONID.AsString) = -1 then

            TrnList.Add(ZQTransActionWTRANSACTIONID.AsString);


          if  ZQTransAction.Eof then
             begin
             exit ;
             end;
          end;}



         if ZqTransaction.RecordCount = 0 then
              AllAllocated := True
            else
            begin
              // look for the same amount first
             ZqTransaction.first ;
             TempValue1 := ABS(trunc(FromOutstandingAmount * 100)) ;
              if DocOnly then
               While not ZqTransaction.eof do
                   begin

                     TempValue2 := Abs(trunc(ZqTransactionFOutStandingAmount.AsFloat * 100)) ;

                     if (TempValue1 = TempValue2)  then
                        break ;
                     ZqTransaction.next ;
                 end;


             { if (ADocid  <>  ZQTransActionWDOCID.AsInteger) or (ADocid = 0) then
              begin
              ZqTransaction.first ;
              While not ZqTransaction.eof do
                 begin
                   if ABS(FromOutstandingAmount) = Abs(ZqTransactionFOutStandingAmount.Value) then
                     break ;
                     ZqTransaction.next ;
                 end;

              if ABS(FromOutstandingAmount) <> Abs(ZqTransactionFOutStandingAmount.Value) then
                  ZqTransaction.First;
              end;}
              TempValue2 := Abs(trunc(ZqTransactionFOutStandingAmount.AsFloat * 100)) ;

              if DocOnly and (TempValue1 <> TempValue2) then
                begin
                  FromOutstandingAmount := 0 ;
                  Continue ;
                 end;


              if ABS(FromOutstandingAmount) >= Abs(ZqTransactionFOutStandingAmount.Value) then
              begin
                //update the 'to' Outstanding Amount
                LinkAmount := ZqTransactionFOutStandingAmount.Value ;
                FromOutstandingAmount := FromOutstandingAmount +  ZqTransactionFOutStandingAmount.Value;
                ZqTransaction.Edit;
                 ZqTransactionFOutStandingAmount.Value := 0;
                 ToTransId := ZqTransactionWTransactionID.Asinteger ;

                ZqTransaction.Post;
                ZqTransaction.SQL.Text :='select * from transact where WTransactionID =  ' + IntToStr(FromTransID) ;
                // update the "from" outstanding Amount
                ZqTransaction.open ;
                ZqTransaction.Edit;
                ZqTransactionFOutStandingAmount.Value := FromOutstandingAmount;
                ZqTransaction.Post;
                linkTransaction(FromTransID,ToTransId,ZQTransActionWACCOUNTID.AsInteger,LinkAmount);
              end
              else
              begin
                //update the 'to' Outstanding Amount
                ZqTransaction.Edit;
                ZqTransactionFOutStandingAmount.Value := FromOutstandingAmount + ZqTransactionFOutStandingAmount.Value;
                ToTransId := ZqTransactionWTransactionID.Asinteger ;
                LinkAmount := FromOutstandingAmount;

                ZqTransaction.Post;
                // update the "from" outstanding Amount
                ZqTransaction.SQL.Text :='select * from transact where WTransactionID =  ' + IntToStr(FromTransID) ;
                // update the "from" outstanding Amount
                ZqTransaction.open ;
                ZqTransaction.Edit;
                ZqTransactionFOutStandingAmount.Value := 0;
                ZqTransaction.Post;
                FromOutstandingAmount := 0;
                linkTransaction(FromTransID,ToTransId,ZQTransActionWACCOUNTID.AsInteger,-LinkAmount);
              end;
            end; //while
          end;
          AProgress.SetProgress('',prgIc);
        end; //if record count
      end;//while not AllAlloc
      ZqTransaction.Filtered := False;
      ZqTransaction.Filter := '';
      ZqTransaction.Close;
  end; //with dmdatabase
  finally
     TrnList.free ;
     Subtrnlist.free ;
  end ;
  finally
    AProgress.CloseProgress ;
    AProgress.Free ;
  end;

end; //Do Balance brought forward links


Procedure LinkTranscationOnID(ADMCoreData : TDMCoreData ;aTransactionID,aAccountID,aBatchLineID,aTaxID,aUserID,aBatchCtrlID : Integer
; aFullAmount,aLinkedAmount : Double;aDate,aDocDate : TDatetime;aReference,aLinkedReference : String  );
Var
 NewAmount : Double ;
 begin

       ADMCoreData.ZQTransaction.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_TransactionsOnTransId');
       ADMCoreData.ZQTransaction.ParamByName('WTransactionID').asinteger := aTransactionID ;
       ADMCoreData.ZQTransaction.open ;
        if not ADMCoreData.ZQTransaction.isempty then
          begin
            ADMCoreData.ZQOILINKSPRE.Close ;
            ADMCoreData.ZQOILINKSPRE.open  ;
            ADMCoreData.ZQOILINKSPRE.Insert ;
            ADMCoreData.ZQOILINKSPREWBATCHID.AsInteger := aBatchCtrlID ;
            ADMCoreData.ZQOILINKSPREWLINEID.AsInteger := aBatchLineID ;
            ADMCoreData.ZQOILINKSPREWBATCHTYPEID.AsInteger := TDataBaseRoutines.GetBatchIdFromPRocessId(aBatchCtrlID);
            ADMCoreData.ZQOILINKSPREWTRANSACTIONID.AsInteger := aTransactionID ;
            ADMCoreData.ZQOILINKSPREFAMOUNT.AsFloat := aLinkedAmount ;
            ADMCoreData.ZQOILINKSPRE.post ;


           {

            ADMCoreData.ZQTransaction.Edit ;

            NewAmount :=  RoundAmount(ADMCoreData.ZQTransactionFOutstandingAmount.Asfloat  - aLinkedAmount,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty) ;
            ADMCoreData.ZQTransactionFOutstandingAmount.Asfloat := NewAmount ;
            ADMCoreData.ZQTransaction.Post ;
            }
            ADMCoreData.ZQOILinks.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyOILinks') ;


        ADMCoreData.ZQOILinks.open ;
        ADMCoreData.ZQOILinks.Append;
        ADMCoreData.ZQOILinksWAccountID.Value:=aAccountID;
        ADMCoreData.ZQOILinksWAmountTransactionID.Value:= aTransactionID ;
        ADMCoreData.ZQOILinksWFullAmount.Value:=RoundAmount(aFullAmount,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);

        ADMCoreData.ZQOILinksWOutStandingAmount.Value:=RoundAmount(ADMCoreData.ZQTransactionFOutstandingAmount.Asfloat,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);
        ADMCoreData.ZQOILinksDDate.Value:= round(aDate) ;
        ADMCoreData.ZQOILinksDDocDate.Value := round(aDocDate) ;
        ADMCoreData.ZQOILinksUnUsed1.Value :=-2;
        ADMCoreData.ZQOILinksWUserID.Value := aUserID;
        IF ADMCoreData.ZQTransactionFAMOUNT.AsFloat > 0 then
        ADMCoreData.ZQOILinksWLinkedAmount.Value:= abs(aLinkedAmount)

        else
        ADMCoreData.ZQOILinksWLinkedAmount.Value:= -abs(aLinkedAmount);

        ADMCoreData.ZQOILinksSReference.value :=aReference;
        ADMCoreData.ZQOILinksSLinkedReference.value :=  aLinkedReference;
        ADMCoreData.ZQOILinksWBatchID.value := aBatchCtrlID;
        ADMCoreData.ZQOILinksWTaxID.value := aTaxID;
        ADMCoreData.ZQOILinksWLinkTransactionID.Value := aBatchLineID;
        ADMCoreData.ZQOILinks.Post;
        end ;
end;
procedure CreateBBFLinksOnRef(AccountID : Integer);
{

  This function
  for debors / creditor
  On basis of there ref
  created by Pieter 01/11/2004

}
var
  TotRec,
  FromTransID   : Integer;
  FromOutstandingAmount,Paypart: Real;
  Debtor : Boolean;
  prgIc:Integer;
  AProgress : TfmNewProgress ;
begin
  // todod ; SQLOPTIMIZE
  AProgress := TfmNewProgress.create(nil) ;
  try
      Debtor := True;
    // check to see if Account is a debtor or a creditor
      dmDatabase.tblAccount.Open;
      dmDatabase.tblOILinks.Open;
      dmDatabase.tblAccount.Filtered:=False;
      dmDatabase.tblAccount.locate('WaccountID',Account,[]);
      if dmDatabase.tblAccountWAccountTypeID.value=2 then Debtor:=False;
      dmDatabase.tblAccount.Close;
      {Added by Sylvain
       Get Last year Opening Balances
       it must be equal to Period 0 total Amount }
      {}
     // FixDtCrOutStanding(AccountID);
      dmDatabase.ZQTransAction.close;
      dmDatabase.ZQTransAction.SQL.Text := 'select * from transact where WAccountID=' +  IntToStr(AccountID) ;
      dmDatabase.ZQTransAction.Open;
      // TODO : BDEINDER
      // dmDatabase.tblTransaction.Indexname := 'ind_DDate';
      AProgress.initProgress(gettextlang(2062),0);
      AProgress.InitSubProgress(gettextlang(2063),0);
      prgIc:=0;

      dmDatabase.qGen.close ;
      if Debtor then
      dmDatabase.qGen.SQL.Text := 'select * from transact where WAccountID=' +  IntToStr(AccountID) + ' and FOutstandingAmount <>0 and FAmount < 0 '
      else
      dmDatabase.qGen.SQL.Text := 'select * from transact where WAccountID=' +  IntToStr(AccountID) + ' and FOutstandingAmount <>0 and FAmount > 0 ';
      dmDatabase.qGen.open ;
      TotRec := dmDatabase.qGen.RecordCount;
      AProgress.initProgress(gettextlang(2062),TotRec);

      while not dmDatabase.qGen.Eof do
        begin
           Inc(prgIc);
           FromOutstandingAmount := 0 ;
               FromTransID := dmDatabase.qGen.FieldByName('WTransactionID').AsInteger ;
               if dmDatabase.ZQTransAction.Locate('WTransactionID',FromTransID,[]) then
                 begin
                   dmDatabase.ZQTransAction.Filter := 'SReference='+ QuotedStr(dmDatabase.ZQTransActionSReference.AsString) ;
                   dmDatabase.ZQTransAction.Filtered := true ;
                   dmDatabase.ZQTransAction.Locate('WTransactionID',FromTransID,[]) ;
                   if  dmDatabase.ZQTransAction.RecordCount > 1 then
                    if  dmDatabase.ZQTransActionFOutStandingAmount.Value <> 0 then
                      begin

                          dmDatabase.ZQTransAction.Edit;
                          FromOutstandingAmount := RoundAmount(dmDatabase.ZQTransActionFOutStandingAmount.Value,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);
                          if  dmDatabase.ZQTransActionFAMOUNT.AsFloat < 0 then
                            begin
                               if FromOutstandingAmount > 0 then
                                 FromOutstandingAmount := 0 ;
                            end else
                            begin
                               if FromOutstandingAmount < 0 then
                                 FromOutstandingAmount := 0 ;
                            end;

                          dmDatabase.ZQTransActionFOutStandingAmount.Value := 0;
                          dmDatabase.ZQTransAction.Post;
                          dmDatabase.ZQTransAction.first;
                          while (FromOutstandingAmount <> 0)  do
                          begin

                          while not dmDatabase.ZQTransAction.eof do
                            begin
                               if FromOutstandingAmount < 0 then
                                 if (dmDatabase.ZQTransActionFOutStandingAmount.Value >0) then break ;
                               if FromOutstandingAmount > 0 then
                                 if (dmDatabase.ZQTransActionFOutStandingAmount.Value <0) then break ;
                               dmDatabase.ZQTransAction.Next ;
                            end;

                               if FromOutstandingAmount < 0 then
                                 if (dmDatabase.ZQTransActionFOutStandingAmount.Value <0) then
                                   begin
                                    break ;
                                   end;
                               if FromOutstandingAmount > 0 then
                                 if (dmDatabase.ZQTransActionFOutStandingAmount.Value >0) then break ; ;
                                if dmDatabase.ZQTransActionFOutStandingAmount.Value = 0 then break ; ; 

                           if FromOutstandingAmount < 0 then
                                 Paypart := -min(-FromOutstandingAmount,dmDatabase.ZQTransActionFOutStandingAmount.Value);
                               if FromOutstandingAmount > 0 then
                                 Paypart := -max(-FromOutstandingAmount,dmDatabase.ZQTransActionFOutStandingAmount.Value) ;

                          FromOutstandingAmount := FromOutstandingAmount  - Paypart ;
                          dmDatabase.ZQTransAction.Edit;
                          dmDatabase.ZQTransActionFOutStandingAmount.Value := RoundAmount(dmDatabase.ZQTransActionFOutStandingAmount.Value + Paypart,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty);
                          dmDatabase.ZQTransAction.Post;
         
                                if  dmDatabase.tblOILinks.locate('WAccountID;WAmountTransactionID;WLinkTransactionID',VarArrayOf([AccountID,FromTransID,dmDatabase.ZQTransActionWTransactionID.AsInteger]),[]) then
                                  dmDatabase.tblOILinks.Edit
                                else
                                  dmDatabase.tblOILinks.Append;
                                dmDatabase.tblOILinksDDate.Value := dmDatabase.ZQTransActionDDate.Value;
                                dmDatabase.tblOILinksDDocDate.Value := date;
                                dmDatabase.tblOILinksWOutStandingAmount.Value := dmDatabase.ZQTransActionFOutStandingAmount.Value;
                                dmDatabase.tblOILinksWlinkedAmount.Value := dmDatabase.ZQOILinksWlinkedAmount.Value + ( - Paypart);
                                dmDatabase.tblOILinksWLinkTransactionID.Value := dmDatabase.ZQTransActionWTransactionID.AsInteger;
                                dmDatabase.tblOILinksWAmountTransactionID.Value := FromTransID;
                                dmDatabase.tblOILinksSReference.Value := dmDatabase.ZQTransActionSReference.AsString;
                                dmDatabase.tblOILinksSlinkedReference.Value := dmDatabase.ZQTransActionSReference.AsString;
                                dmDatabase.tblOILinksWAccountID.Value := AccountID;
                                dmDatabase.tblOILinksWTaxID.value := dmDatabase.ZQTransActionWTaxAccountID.AsInteger;
                                dmDatabase.tblOILinksWBATCHID.AsInteger := -1;
                                dmDatabase.tblOILinks.Post;
                         end;
                      end;
                    dmDatabase.ZQTransAction.Filtered := false ;
                 end;
           // set Div
           if FromOutstandingAmount <> 0 then
             begin                             
              if  dmDatabase.ZQTransAction.Locate('WTransactionID',FromTransID,[]) then
                 begin
                     dmDatabase.ZQTransAction.Edit;
                     dmDatabase.ZQTransActionFOutStandingAmount.Value := FromOutstandingAmount;
                     dmDatabase.ZQTransAction.Post;

                 end;
             end;
          AProgress.SetProgress('',prgIc);
          dmDatabase.qGen.next ;
        end; // Qgen
   dmDatabase.tblOILinks.Close ;
  finally
    AProgress.CloseProgress ;
    AProgress.Free ;
  end;
end;


Function FirstRun:Boolean;
{
  Test if it's the first time to run Tcash afert install it
}

Begin
 FirstRun:=False;
 If FileExists(TDMTCCoreLink.GetLocalBaseDir+'1.TXT') then
   FirstRun:=True;
end;

procedure SetUpForm(Aform:TForm);
begin
  fmLangChoice.TranslateForm(Aform);
end;

Function GetEncodeAccount:String;
// Is Same as EncodeAccount but
// Table account Must bo Open
// and Point to record to Encode.
// Mainly used in reports.
Begin
  GetEncodeAccount:=EncodeAccount(dmDatabase.tblAccountSMAINACCOUNTCODE.Value,dmDatabase.tblAccountSSUBACCOUNTCODE.Value);
end;

Function EncodeAccount(Main,Sub:String):String;
// Added
// This function let Account Number Begin with Correct letter.
// If Account Table is closed this function will leave it Closed
// If not it will leave it opened.
Var
  tblAccountOpen:Boolean;
Begin
  With dmDatabase do begin
    tblAccountOpen:=tblAccount.Active;
    if  Not tblAccountOpen then begin
      tblAccount.Open;
      tblAccount.Locate('SACCOUNTCODE',VarArrayOf([Main +Sub]),[]);
    end;
    EncodeAccount:='';
    Main:=Trim(Main);
    if (Main<>'') And (Main<>'-') then begin
      if (Sub<>'000') and (Trim(Sub)<>'') then
        Main:=Main+Sub
      else
        Main:=Main+'    ';
      Case tblAccountWaccountTypeID.Value of
        1:EncodeAccount:='D'+Main;
        2:EncodeAccount:='C'+Main;
        3:EncodeAccount:='B'+Main;
        4:EncodeAccount:='T'+Main;
      else
         EncodeAccount:='G'+Main;
      end;
    end;
    if Not tblAccountOpen then tblAccount.Close;
  end;
end;
 

Function GetAccountDescription(vAccountID:Integer;SACCOUNT:string):String;
// if vAccountID >0 it will be used for locate otherwise
// SACCOUNT will be used.
Var
  ASql : TuniQuery ;
begin
    ASql := TuniQuery.create(nil) ;
    try
       ASql.Connection := dmDatabase.ZMainconnection ;
       if  vAccountID <> 0 then
         begin
          ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectAccountCodeDescription');
          ASql.ParamByName('WAccountid').AsInteger := vAccountID ;
         end else
         begin
          ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectAccountCodeDescription');
          ASql.ParamByName('WAccountid').AsInteger := StrToIntDef(VarToStr(OpenSqlAndGetFirtsColumnValue('select WAccountId from Account where SAccountCode =' + QuotedStr(SACCOUNT))),-1) ;
         end;
       ASql.open ;
       Result := ASql.fields[1].asstring ;
       ASql.close ;
    finally
      ASql.free ;
    end;
end;
// neede to build array with account totals
Function  GetAccountType(vAccountID:Integer): integer ;
// Table account Must be Opened;
// if vAccountID >0 it will be used for locate otherwise
// SACCOUNT will be used.
Var
  ASql : TuniQuery ;
begin
  ASql := TuniQuery.create(nil) ;
  try
     ASql.Connection := dmDatabase.ZMainconnection ;
     ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectAccountTypeOnAccountId');
     ASql.ParamByName('WAccountid').AsInteger := vAccountID ;
     ASql.open ;
//     Result := ASql.fields[0].asstring ;
     Result := ASql.fieldByName('WAccountTypeID').AsInteger;

     ASql.close ;

  finally
    ASql.free ;
  end;
end;



Procedure  GetAccountCodeDesc(vAccountID:Integer;Var AAccountCode, AAccountDesc : String );
Var
  ASql : TuniQuery ;
begin
  ASql := TuniQuery.create(nil) ;
  try
     ASql.Connection := dmDatabase.ZMainconnection ;
     ASql.sql.Text := 'Select SAccountCode , SDescription, WAccountTypeId From account where WAccountid =:WAccountid';
     ASql.ParamByName('WAccountid').AsInteger := vAccountID ;
     ASql.open ;
     AAccountCode:= TDataBaseRoutines.AccTypeToChar(ASql.fields[2].Asinteger) + ASql.fields[0].asstring ;
     AAccountDesc:= ASql.fields[1].asstring ;
     ASql.close ;
  finally
    ASql.free ;
  end;
end;

procedure GetAccountDefaultTaxAndContra(vAccountID:Integer;Var ContraAccount,TaxAccount:Integer);
Var
  ASql : TuniQuery ;
begin
  ASql := TuniQuery.create(nil) ;
  try
     ASql.Connection := dmDatabase.ZMainconnection ;
     ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectDebCredDefaultAccOnAccountId');
     ASql.ParamByName('WAccountId1').AsInteger := vAccountID ;
     ASql.ParamByName('WAccountId2').AsInteger := vAccountID ;
     ASql.open ;
     ContraAccount := ASql.fields[0].AsInteger ;
     TaxAccount    := ASql.fields[1].AsInteger ;
     ASql.close ;

  finally
    ASql.free ;
  end;
end;


Function GetAccountCode(vAccountID:Integer):String;
// Table account Must be Opened;
// if vAccountID >0 it will be used for locate otherwise
// SACCOUNT will be used.
Var
  ASql : TuniQuery ;
begin
  ASql := TuniQuery.create(nil) ;
  try
     ASql.Connection := dmDatabase.ZMainconnection ;
     ASql.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectAccountCodeDescription');
     ASql.ParamByName('WAccountid').AsInteger := vAccountID ;
     ASql.open ;
     Result := ASql.fields[0].asstring ;

     ASql.close ;

  finally
    ASql.free ;
  end;
end;

Function GetReconData(Fromdate,Todate:TDateTime;BankAccountID:Integer;Var PymtID,RcptID:String;Var TotalUnpost:Double;JustOpenRCon:Boolean = false):Boolean;

Var
  xRes:Integer;
begin
  Result := False;
  xRes := CheckGetReconData(BankAccountID,Todate,Fromdate,PymtID,RcptID,TotalUnpost,JustOpenRCon);
  if xRes=2 then
  begin
    OSFMessageDlg(GetTextLang(815){'Your Payment and Receipt Batch are not attached Correctly to this Bank account.'}, mterror, [mbok], 0);
    exit;
  end;
  Result :=True;

end;


Function EndOfMonth(vMonth,vYear:Word):Word;
// added by sylvain
begin
  Case vMonth of
  2       :if IsLeapYear(vYear) then
             EndOfMonth:=29
           else
             EndOfMonth:=28;
  4,6,9,11:EndOfMonth:=30;
  else
    EndOfMonth:=31;
  end;
end;

Function IncMonthT(DDate:TDateTime; NumberOfMonths: Integer): TDateTime;
// added by sylvain
Var
  D,M,Y:Word;
begin
  DecodeDate(DDate,Y,M,D);
  Result:=IncMonth(DDate,NumberOfMonths);
  if D=EndOfMonth(M,Y) then begin
    DecodeDate(Result,Y,M,D);
    Result:=EncodeDate(Y,M,EndOfMonth(M,Y))
  end;
end;

procedure TransactionBBF(_WTransactionID,AccountType:Integer);

Var
  FromTransID,
  FromOutstandingAmount:Real;
  AllAllocated:Boolean;
  AccountID:Integer;
begin
   With dmDatabase do Begin
      AllAllocated:=False;
        tblTransaction.Open;
        // TODO : BDEINDER
        //tblTransaction.Indexname := 'ind_DDate';

        tblTransaction.Locate('WTransactionID',_WTransactionID,[]);
        AccountID:=tblTransactionWAccountID.Value;
        FromTransID := tblTransactionWTransactionID.Value;
        FromOutstandingAmount :=  tblTransactionFOutstandingAmount.Value;
        //check if there are still amounts outstanding
        if FromOutstandingAmount<> 0 then
        //make allocations with the outstanding amount
        begin
          // Store in variables
          while (((FromOutstandingAmount  < 0) and (AccountType=1)) or
                 ((FromOutstandingAmount  > 0) and (AccountType=2)))and
                 (Not AllAllocated) do begin
            // Get the first unallocated Outstanding Debit
            tblTransaction.Filtered := False;
            if AccountType=1 then
              tblTransaction.Filter := 'WAccountID = ''' + IntToStr(AccountID) + ''' and FOutstandingAmount > ''0'''
            else
              tblTransaction.Filter := 'WAccountID = ''' + IntToStr(AccountID) + ''' and FOutstandingAmount < ''0''';
            tblTransaction.Filtered := True;
            if tblTransaction.RecordCount = 0 then
              AllAllocated := True
            else
            begin
              tblTransaction.First;
              if ABS(FromOutstandingAmount) >= Abs(tblTransactionFOutStandingAmount.Value) then
              begin
                //update the 'to' Outstanding Amount
                FromOutstandingAmount := FromOutstandingAmount +  tblTransactionFOutStandingAmount.Value;
                tblTransaction.Edit;
                tblTransactionFOutStandingAmount.Value := 0;
                tblTransaction.Post;
                // update the "from" outstanding Amount
                tblTransaction.Filtered := False;
                tblTransaction.Filter := '';
                tblTransaction.Locate('WTransactionID', FromTransID, []);
                tblTransaction.Edit;
                tblTransactionFOutStandingAmount.Value := FromOutstandingAmount;
                tblTransaction.Post;
              end
              else
              begin
                //update the 'to' Outstanding Amount
                tblTransaction.Edit;
                tblTransactionFOutStandingAmount.Value := FromOutstandingAmount + tblTransactionFOutStandingAmount.Value;
                tblTransaction.Post;
                // update the "from" outstanding Amount
                tblTransaction.Filtered := False;
                tblTransaction.Filter := '';
                tblTransaction.Locate('WTransactionID', FromTransID, []);
                tblTransaction.Edit;
                tblTransactionFOutStandingAmount.Value := 0;
                tblTransaction.Post;
                FromOutstandingAmount := 0;
              end;
            end; //while
          end;
        end; //if record count
      tblTransaction.Filtered := False;
      tblTransaction.Filter := '';
      tblTransaction.Close;
      // TODO : BDEINDER
      // tblTransaction.Indexname := '';
  end; //with dmdatabase
end;

Function IsPastelData(PastelDir:String):Boolean;
var
   fileNamed: WideString;

begin
     fileNamed :=PastelDir+'\ACCPRMSY.DAT';
     If FileExists(Filenamed) then
       IsPastelData:=true
     else
       IsPastelData:=False;
end;




Function ForceDeleteDir(sDirectory:string):Integer;
// Added by Sylvain
// This function Delete Directory which contens or
// not files and it's sub-directories
// And send them to the recyclebin
Var
  F:TSearchRec;
  Ok:Boolean;
begin
  Ok:=True;
  if ExtractFileExt(sDirectory) <> '' then
   sDirectory :=ExtractFilePath(sDirectory) ;
  sDirectory := IncludeTrailingPathDelimiter(sDirectory);

  if FindFirst(sDirectory+'*.*',faAnyFile ,F)=0 then
  begin
     if ((f.Attr and faDirectory)=FaDirectory) And (f.NAme<>'.') and (f.NAme<>'..') then
     begin
       result := ForceDeleteDir(sDirectory+F.Name);
       if result <> 0 then
       begin
          exit;
       end;
     end;

     while FindNext(F)=0 do
     begin
       if ((f.Attr and faDirectory)=FaDirectory) And (f.NAme<>'.') and (f.NAme<>'..') then
       begin
         result := ForceDeleteDir(sDirectory+F.Name);
         if result <> 0 then
            exit;
       end;

       if (f.NAme<>'.') and (f.NAme<>'..') then
          Ok:=RecycleFile(sDirectory+f.NAme);
     end;
     // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
  end;
  RemoveDir(sDirectory);
  if Ok then
    Result:=0
  else
    Result:=GetLastError;
end;

Function DateRange(Bdate,Edate:Tdate):String;
// Dates range for Reports
// Dates are not Checked.
begin
  if Bdate=Edate then
    Result := GetTextLang(1028)+' '+{'As at '}FormatDateTime('dd-mmm-yyyy',Bdate)
  else
    Result:=GetTextLang(282)+' '+{'From '}FormatDateTime('dd-mmm-yyyy',Bdate)+' '+GetTextLang(1022)+' '+{to} FormatDateTime('dd-mmm-yyyy',EDate)
end;




 
Function CheckDocInfos:Boolean;
Var
  Bat:String;
begin
  // Test if Document Batch is setup correctly
  // Added by Sylvain
  Result :=True;
  Bat:='';
  with dmDatabase do begin
    tblSysVars.Open;
    tblBatchTypes.open;
    if tblSysVarsWCreditNoteBatchTypeID.isNull then begin
      Result:=False;

    end;
    if tblSysVarsWPurchasesBatchID.isNull then begin
      Result:=False;

    end;
    if tblSysVarsWGoodsReturnedBatchID.isNull then begin
      Result:=False;

    end;
    if tblSysVarsWInvoicesBatchID.isNull then begin
      Result:=False;

    end;
    tblSysVars.Close;
    tblBatchTypes.Close;
    if Result<>true then
      OSFMessageDlg('Setup Batch type for all Documents in System Setup/Documents',mtError,[mbOk],0)
  end;
end;



function GetExactAccountTotal (_WAccountID, _WPeriodID: Integer; vDate:TDate) : Real;
// Added By Sylvain
// This function get total for account until one
// period before PeriodID
// And add totals until the exact date.
// It's specialy for recon Report
begin
  if _WPeriodID>13 then
    Result:=GetAccountTotal(_WAccountID, _WPeriodID-1,3)
  else
    Result:=GetAccountTotal(_WAccountID, _WPeriodID-1,4);
  with dmDatabase do begin
   ZQTransAction.SQL.Text := 'Select * from transact where WAccountID=' + IntToStr(_WAccountID)+ '  and WPeriodId = ' + IntTostr(_WPeriodID) ;
    ZQTransAction.Open;
    //tblTransaction.First;
    While not ZQTransAction.Eof do begin
      if ZQTransActionDDate.Value<=vDate then
        Result:=Result+ZQTransActionFAmount.Value;
      ZQTransAction.Next;
    end;
    ZQTransAction.Close;
  end;
end;

function  CnvAccountType(_AccountTypeID:Integer):Char;
// Added By Sylvain
// This function will replace completly
// EncodeAccount and GetEncodeAccount
// And it will be used in Dmdatabase to Set
// GetText of AccountCode field.
begin
  Result := _CnvAccType(_AccountTypeID);
end;

Procedure ProperlyInUseClosed(ClosedNow:Boolean);
Var
  Bonline:Boolean;
Begin
 if not dmDatabase.ZMainconnection.Connected then exit ;
  With dmDatabase do begin
    if ClosedNow then begin
    try
      // Added By Sylvain
     // Set that the User exited the system normaly
     if  (tblSysvars.Connection.Connected) then
      if TDataBaseRoutines.tableExist('SysVars') then begin
       tblSysvars.Open;
       tblSysvars.Edit;
       tblSysvarsBNotClosed.Value := 0;
       tblSysvars.Post;
       tblSysvars.Close;
       SetUserOnLine(False);
     end;
    except end;
     //
   end
   else
   begin
    // Check if user exited normaly and
    // Set that Books are now in use
      try
        tblSysvars.Open;
        if tblSysvarsBNotClosed.value =1 then
        begin
          Bonline:=False;
          tblUser.Open;
          tblUser.DisableControls;
          tblUser.First;
          While (not tblUser.Eof) AND (Not Bonline) do
          begin
            if tblUserWUserID.Value<>CurrentUser then
            Bonline:=(tblUser.FieldByName('BOnline').AsInteger = 1);
            tblUser.Next;
          end;
          tblUser.Close;
          tblUser.EnableControls;
          if Not BOnline then
            OSFMessageDlg(GetTextLang(767)+#13#10+GetTextLang(768),mtInformation,[mbok],0);
        end;
        tblSysvars.Edit;
        tblSysvarsBNotClosed.Value := 1;
        tblSysvars.Post;
        tblSysvars.Close;
      except end;
    //
   end;
  end;
end;

Function GetTotalDocStock(StcItem:Integer):real;
// Added By Sylvain
// This function get Total for the stock item in unposted Docs
begin
  Result:=0;
  with dmdatabase do begin
    qgen.Close;
    qgen.SQL.clear;
    qgen.SQL.Add('SELECT DocLine.WStockID, DocLine.FQtyShipped, DocLine.WDocID, '+
                 ' DocHead.WtypeID, DocHead.BPosted '+
                 ' FROM DocLine,DocHead '+
                 ' WHERE ((DocHead.WTypeID>=10) And (DocHead.WTypeID<=13)) '+
                 ' And DocHead.BPosted<>1 ' +
                 ' And DocLine.WStockID=' + IntToStr(StcItem)+
                 ' And (DocLine.WDocID=DocHead.WDocID) ');
    qGen.Open;
    While not qGen.Eof do begin
      if qGen.FieldByName('WtypeID').AsInteger in [10,13] then begin
         Result:= Result - qGen.FieldByName('FQtyShipped').AsFloat
      end
      else
      begin
         Result:= Result + qGen.FieldByName('FQtyShipped').AsFloat
      end;
      qGen.Next;
    end;
    qgen.Close;
  end;
end;

Function T3FormatStr(Value,Long:Integer):String;Overload;
begin
  Result:=IntToStr(Value);
  Result:=T3FormatStr(Result,Long,'0');
end;

Function T3FormatStr(Value:String;Long:Integer):String;Overload;
Var
 i:Byte;
begin
  Result:=Value;
  if Length(Result)<Long then
  for i:=Length(Result) to Long do Result:=Result+' ';
end;

Function T3FormatStr(Value:string;Long:Integer;Cfill:char):String;Overload;
// This function returns value with Long Zero leading
Var
  i:Integer;
begin
  result:=value;
  Long:=Long-Length(Result);
  if Long>0 then
    for i:=1 to Long do Result:=Cfill+Result;
end;

Function BkMbFormat(N:integer):String;
begin
 if N>1024*1024 then
   Result := Format('%.1f Mb',[n/(1024*1024)])
 else
   Result := Format('%.1f Kb',[n/1024]);
end;

Function CheckOpenItemLink(_AccountID:Integer;MyBook:String;Var DtFAmount,CrFAmount,
        DtOutStanding,CrOutStanding,DtTotals,CrTotals:Real):Integer;
// The Result of this function can be:
// 0: No Error Found;
// 1: Error in OpenItemLink(Transactions Data)
// 2: Error in OpenItemLink(Totals Data)
// 3: Read database error

Begin
  Result:=0;
  DtFAmount:=0;
  CrFAmount:=0;
  DtOutStanding:=0;
  CrOutStanding:=0;
  DtTotals:=0;
  CrTotals:=0;
  With dmDatabase do begin
    qGen.Close;
    qGen.Connection:= ZMainconnection;
    qGen.Sql.Clear;
    // Calculate Debits Amounts (Transaction Data)
    qGen.Sql.Add('Select Sum(FOutStandingAmount) As Sum1,Sum(FAmount) As Sum2'+
                 ' from Transact '+
                 ' Where FAmount>=0'+
                 ' AND WAccountID='+IntToStr(_AccountID));
    Try
      qGen.Open;
        DtOutStanding:=qGen.FieldByName('Sum1').AsFloat;
        DtFAmount:=qGen.FieldByName('Sum2').AsFloat;
    except
      Result:=3;
      exit;
    end;
    // Calculate Credit Amounts(Transaction Data)
    qGen.Close;
    qGen.Sql.Clear;
    qGen.Sql.Add('Select Sum(FOutStandingAmount) As Sum1,Sum(FAmount) As Sum2'+
                 ' from Transact '+
                 ' Where FAmount<0'+
                 ' AND WAccountID='+IntToStr(_AccountID));
    Try
      qGen.Open;
        CrOutStanding:=qGen.FieldByName('Sum1').AsFloat;
        CrFAmount:=qGen.FieldByName('Sum2').AsFloat;
    except
      Result:=3;
      exit;
    end;
    // Calculate Debits Amounts(Totals Data)
    qGen.Close;
    qGen.Sql.Clear;
    qGen.Sql.Add('Select Sum(FAmount) As Sum1'+
                 ' from Totals '+
                 ' Where FAmount>=0'+
                 ' And BActual=1'+
                 ' And (WPeriodID>=14 or WPeriodID=0)'+
                 ' AND WAccountID='+IntToStr(_AccountID));
    Try
      qGen.Open;
        DtTotals:=qGen.FieldByName('Sum1').AsFloat;
    except
      Result:=3;
      exit;
    end;
    // Calculate Credits Amounts(Totals Data)
    qGen.Close;
    qGen.Sql.Clear;
    qGen.Sql.Add('Select Sum(FAmount) As Sum1'+
                 ' from Totals '+
                 ' Where FAmount<0'+
                 ' And BActual=1'+
                 ' And (WPeriodID>=14 or WPeriodID=0)'+
                 ' AND WAccountID='+IntToStr(_AccountID));
    Try
      qGen.Open;
        CrTotals:=qGen.FieldByName('Sum1').AsFloat;
    except
      Result:=3;
      exit;
    end;
    // Test Transactions Results
    // Fixe all Amounts to 2 decimal digits ??
    if FixAmount(DtTotals+CrTotals-(DtOutStanding+CrOutStanding),2)<>0 then
      Result:=1;
    // Test for exit
    if Result<>0 then exit;
     //Test Totals Results
    if FixAmount(DtFAmount+CrFAmount-(DtTotals+CrTotals),2)<>0 then
      Result:=2;
  end;
end;
(*
Procedure FixDtCrOutStanding(_AccountID:Integer);
// This Proc Fixes Importing Error in Outstanding Amount;
// For BBF
Var
  TrsFAmount,
  ActualBal : Real;
  wPeriod   : Integer;
  wDate     : TDate ;
begin

  with dmdatabase do begin
    tblTransaction.close;
    tblTransaction.Filtered:=False;
    // TODO : BDEINDER
    //HoldIndex:=tblTransaction.IndexName;
    //tblTransaction.IndexName:='ind_DDate';
      // Calculate Actual Balance From Total File
      ActualBal:=FixAmount(GetAccountTotal (_AccountID, 27,3));
      // Calculate same Sum From Transaction File
      qGen.Close;
      qGen.Connection:=ZMainconnection;
      qGen.Sql.Clear;
//      qGen.Sql.Add('Select Sum(FOutStandingAmount) As Sum1 '+
//      qGen.Sql.Add('Select Sum(FAmount) As Sum1, Sum(FOutStandingAmount) As Sum2 '+
      qGen.Sql.Add('Select Sum(FAmount) As Sum1 ' +
                 ' from Transact '+
                 ' Where WAccountID='+IntToStr(_AccountID));
      qGen.Open;
      TrsFAmount:=FixAmount(qGen.FieldByName('Sum1').AsFloat);
//      TrsFOutAmount:=FixAmount(qGen.FieldByName('Sum2').AsFloat);
      // Check if both are the same
//      if (ActualBal<>TrsFAmount) Or (ActualBal<>TrsFOutAmount) then begin
      if (ActualBal<>TrsFAmount) then
      begin
      // Fixing this error
        // 07/00
        tblTransaction.Open;
//       TrsFOutAmount := ActualBal -  TrsFOutAmount;
        ActualBal := ActualBal-TrsFAmount;
        tblTransaction.Filtered:=False;
        tblTransaction.Filter:='';
        tblTransaction.First;
        wDate:= tblTransactionDDate.Value;
        wPeriod:= tblTransactionWperiodID.Value;
        { fixed by Sylvain 17/04/2001}
        tblTransaction.Append;
        tblTransactionWBatchID.Value := 1;
        tblTransactionWBatchTypeID.Value := 1;
        tblTransactionWLineID.Value := 0;
        tblTransactionBCarriedForward.Value := 1;
        tblTransactionBLinksUsed.Value := 0;
        tblTransactionBMultipleItems.Value := 0;
        tblTransactionWAccountID.Value := _AccountID;
        tblTransactionDDate.Value := wDate;
        tblTransactionWPeriodID.Value := wPeriod;
        tblTransactionSReference.Value := 'Balance Brought Forward';
        tblTransactionFTaxRate.Value := 0;
        tblTransactionWTaxAccountID.Value := 0;
        tblTransactionFOutstandingAmount.Value := ActualBal;
        tblTransactionFTaxAmount.Value :=0;
        tblTransactionWCurrencyID.Value := 0;
        tblTransactionFForexAmount.Value := 1;
        tblTransactionWUserID.Value := CurrentUser;
        tblTransactionBReconciled.Value :=1;
        tblTransactionWDescriptionID.Value := 1;
        tblTransactionFAmount.Value := ActualBal ;
        tblTransactionWBalancingAccountID.Value := 0;
        tblTransaction.Post;
      end;
    tblTransaction.Filtered:=False;
    tblTransaction.Filter:='';
    qGen.Close;
  end;
end;
           *)
function StrReverse( var S: String ) : string;
var
i, j : word;
begin
   Result:=S;
   j := 1;
   for i := Length( S ) downto 1 do
      begin
      Result[j] := S[i];
      Inc( j );
      end;
   S := Result;                  { so it works like a C stdlib function }
end;

function CnvNumberToText( const sNum : String ) : string;
Type
  DIGITS = set of 0..9;
  POSITION = set of 1..13;
Const
  Tens : POSITION = [ 2,5,8,11];
  Hundreds : POSITION = [ 3,6,9,12];
  Thousands : POSITION = [ 4 ];
  Millions  : POSITION = [ 7 ];
  Billions  : POSITION = [ 10 ];
  BigNums   : POSITION = [ 4,7,10,13 ];
var
  MyNumber : string;
  i, iNum : word;
  bQualifier : boolean;
  NUMBERS   : array [1..19] of string[9];
  DECANUMS  : array [2..9] of string[9];
  MONDONUMS : array [4..13] of string[8];
begin
  for i:=1 to 19 do
  // One to nineteen
    NUMBERS[i]:= GetTextLang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= GetTextLang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= GetTextLang(155);
  MONDONUMS[7]:= GetTextLang(156);
  MONDONUMS[10]:= GetTextLang(795);
  MONDONUMS[13]:= GetTextLang(796);
  // My begin
   MyNumber := sNum;
   Result := '';                            { set a default value }
   bQualifier := True;
   StrReverse( MyNumber );
   i := Length( MyNumber );
   while i>0 do
      begin
      if ( i in Tens) and ( MyNumber[i] <> '0' ) then
         begin
         bQualifier := True;
         if MyNumber[i] = '1' then
            begin
            iNum := StrToInt( Copy( MyNumber, i, 1 ) );
            iNum := iNum * 10;
            Dec(i);                    { we're taking two this pass so bump i}
            iNum := iNum + StrToInt( Copy( MyNumber, i, 1 ) );
            Result := Result + NUMBERS[iNum] + ' ';
            end
         else
            begin
            iNum := StrToInt( Copy( MyNumber, i, 1 ) );
            Result := Result + DECANUMS[iNum] + ' ';
            if MyNumber[i-1] = '0' then
               Dec(i);
            end;
         end                   { end of Tens }
      else if MyNumber[i] <> '0'  then
         begin
         bQualifier := True;
         iNum := StrToInt( Copy( MyNumber, i, 1 ) );
         Result := Result + NUMBERS[iNum] + ' ';
         end;
      { check if hundreds qualifier is needed }
      if ( i in Hundreds ) and (MyNumber[i] <> '0') then
         Result := Result + GetTextLang(154)+' ';
      { check if additional qualifier is needed }
      if ( i in BigNums ) and ( bQualifier ) then
         begin
         bQualifier := False;
         Result := Result + MONDONUMS[i] + ' ';
         end;
     Dec(i);
   end;                                 { end of outer for loop }

end;

// done : Pietere Dutch Translation
function CnvNumberToTextDutch( const sNum : Integer ) : string;
Type
  DIGITS = set of 0..9;
  POSITION = set of 1..13;
Const
  Tens : POSITION = [ 2,5,8,11];
  Hundreds : POSITION = [ 3,6,9,12];
  Thousands : POSITION = [ 4 ];
  Millions  : POSITION = [ 7 ];
  Billions  : POSITION = [ 10 ];
  BigNums   : POSITION = [ 4,7,10,13 ];

var
  i : word;
  NUMBERS   : array [1..19] of string[9];
  DECANUMS  : array [2..9] of string[9];
  MONDONUMS : array [4..13] of string[8];
  LNum : Integer ;
   function getBase(ANumber : Integer) : String ;
    begin
       if ANumber > 100 then
         begin
               if   ANumber div 100 > 1 then
                    result :=  NUMBERS[ANumber div 100]  + MONDONUMS[5]
               else result := MONDONUMS[5] ;
            ANumber := ANumber mod 100 ;
         end;

       if ANumber < 20 then
         begin
         if ANumber > 0 then
         result := result+NUMBERS[ANumber]
         end
         else

         if ANumber < 100 then
           begin
           if ((ANumber mod 10) > 1)then
           begin
         //  result :=  result+NUMBERS[ANumber mod 10] ;
           if (NUMBERS[ANumber mod 10][Length(NUMBERS[ANumber mod 10])] = 'e') then
            result :=  result+NUMBERS[ANumber mod 10]+ 'ën' + DECANUMS[ANumber div 10]
              else
            result :=  result+NUMBERS[ANumber mod 10]+ 'en' + DECANUMS[ANumber div 10]
           end
           else               
           result := result+DECANUMS[ANumber div 10] ;
           end;
    end;
begin
  for i:=1 to 19 do
  // One to nineteen
    NUMBERS[i]:= GetTextLang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= GetTextLang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= GetTextLang(155);
  MONDONUMS[5]:= GetTextLang(154);
  MONDONUMS[7]:= GetTextLang(156);
  MONDONUMS[10]:= GetTextLang(795);
  MONDONUMS[13]:= GetTextLang(796);
  // My begin
  Result := '';
  LNum := sNum ;             { set a default value }
  // add from end to begin
  // i stop at 100 miljons now
  if (LNum div 1000000) <> 0 then
     begin
       Result := Result + getBase(LNum div 1000000)+MONDONUMS[7] ;
       lnum := lnum - ((LNum div 1000000) * 1000000);
     end;
  if (LNum div 1000) <> 0 then
     begin
     //  Result := Result + MONDONUMS[5] + getBase(LNum MOD 10000) ;
       Result := Result + getBase(LNum div 1000)+MONDONUMS[4] ;
       lnum := lnum - ((LNum div 1000) * 1000);
     end;
  if (LNum div 100) <> 0 then
     begin
       Result := Result + getBase(LNum div 100)+MONDONUMS[5] ;
       lnum := lnum - ((LNum div 100) * 100);
     end;
       Result := Result + getBase(LNum) ;
end;

function EvaluateText(AReportmanStyleExpression,params : String ; ADataSet : TDataset) : Variant ;
 var
  Alist : TStringList ;
  i,x : Integer ;
begin
  result := false ;
  try
   Alist := TStringList.create ;
   try
   Alist.Text := params ;

    for x := 0 to  Alist.Count -1 do
      begin
          for i := dmDatabase.aeval.Identifiers.Count -1 downto 0 do
          begin
            if 'M.' + AnsiUpperCase(Alist.Names[x]) =  dmDatabase.aeval.Identifiers[i] then
             begin
              dmDatabase.aeval.Identifiers.Delete(i);
              break ;
             end;
          end;
      end;


   for i := 0 to Alist.Count -1 do
     if Alist.ValueFromIndex[i] <> '' then
      begin
       dmDatabase.aeval.NewVariable(Alist.Names[i],Alist.ValueFromIndex[i]) ;
      end;
  dmDatabase.aeval.Expression:= AReportmanStyleExpression  ;
  dmDatabase.aeval.Rpalias := dmDatabase.rpalias ;

  dmDatabase.aeval.Rpalias.List.Clear ;
  if ADataSet <> nil then
  with dmDatabase.aeval.Rpalias.List.Add do
    begin
      Alias := 'DATA' ;
      Dataset :=  ADataSet ;
    end;
  dmDatabase.aeval.Evaluate;
  result := dmDatabase.aeval.EvalResult;
  finally
    Alist.free ;
    dmDatabase.aeval.Rpalias.List.Clear ;
  end;
  Except
      // no handel
      result := false ;
  end;
end ;


function NumberToText( const sAmount : String ) : string;
// Added and Modyfied by Sylvain
// 26-06-000
var
  sMyNumber : string;
  sCents : string[2];
  iDecimal : byte;
  i : word;
begin
   Result := '';
   sMyNumber := sAmount;
   { clean out commas }
      // done : Pieter lets use ThousandSeparator sep
   while Pos(ThousandSeparator, sMyNumber ) > 0 do
      Delete( sMyNumber, Pos(ThousandSeparator, sMyNumber ), 1 );
   { clean out currency symbol }
//   Delete( sWork, Pos( CurrencyString, sWork ), Length( CurrencyString ) );
   { Remove Extra Spaces}
   Trim(sMyNumber);
   { check that the string represents a valid number }
   for i := 1 to Length( sMyNumber ) do
      if not ( sMyNumber[i] in ['0'..'9', DecimalSeparator]) then
         Exit;
   { save the Cents }
   // done : Pieter Lets ude decimal sep.
   iDecimal := Pos(DecimalSeparator, sMyNumber );
   if iDecimal > 0 then
      begin
      sCents := Copy( sMyNumber, iDecimal + 1, 2 ); { Take two, truncate if more }
      while Length( sCents ) < 2 do
         sCents := sCents + '0';
      Delete( sMyNumber, iDecimal, 255 );           { remove the end of the string }
      end
   else
      sCents := '00';
   // Call Now Convertion
   if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
   Result := CnvNumberToTextDutch(StrToInt(sMyNumber) )
   else
   Result := CnvNumberToText( sMyNumber ) ;
   if Result > '' then
   // Add Currency Name
//      Result := GetTextLang(157)+' '+Result
      Result := ' '+Result
   else if sMyNumber = '0' then
      Result := GetTextLang(157)+' '+gettextlang(2146)+' ' ;
   // Get Cents
   if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
   sMyNumber := CnvNumberToTextDutch(StrToInt(sCents) )
   else
   sMyNumber:= CnvNumberToText( sCents );
   if sMyNumber <>'' then
     begin
       Result:=Result+ ' '+ gettextlang(2145) +' '+  sMyNumber+' ' +GetTextLang(158)  ;
     end ;
    result := Lowercase(result);
    if length(result) > 1 then
      result[2]:= UpCase(result[2]);
      if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
        if sMyNumber = '' then
           Result:=Result+' ' +GetTextLang(157); 
end;


Function IsDateNotInPeriod(MyDate:Tdate;Var StartDate,EndDate:Tdate):Boolean;
// Added by sylvain
// This fucntion return true if MyDate is not
// In the financials Period
// and return the financial date range
// in StartDate and EndDate
// 28-06-00
 Var
  lPeriod : Integer ;
begin
lPeriod := TDataBaseRoutines.GetPeriodFromDate(MyDate) ;
Result:= not TDataBaseRoutines.GetPeriodActive(lPeriod) ;
EndDate := TDataBaseRoutines.GetPeriodEndDate(lPeriod) ;
StartDate:= TDataBaseRoutines.GetPeriodStartDate(lPeriod) ;
 
end;

Function LoadT3image(Var T3Image:TImage;ImageName:String):Boolean;
Begin
  Result:=False;
  try
    if FileExists(ImageName) then
    begin
      T3Image.Picture.LoadFromFile(ImageName);
    end
    else begin
       ImageName:=ExtractFilePath(Application.ExeName)+'themes\Classic\'+ ExtractFileName(ImageName);
      T3Image.Picture.LoadFromFile(ImageName);
    end;
    Result:=True;
  Except
  end;
end;

Function ValidateEmail(EMail:String):String;
begin
  Result:='';
  if  @Email=Nil then
    exit;
  If (Pos('@',Result)<>0) or (Pos('.',Email)<>0) then
    Result:=Trim(Email);
end;


Function SwapStr(Var vLStr,vUStr:String):Boolean;
Var
  tmp:String;
begin
  Result:=False;
  try
    if UpperCase(vLStr)>UpperCase(vUStr) then begin
      tmp:=vLStr;
      vLStr:=vUStr;
      vUStr:=tmp;
      result:=True;
    end;
  Except

  end;
end;





Function FullAccountCode(AccountCode:String;AccType:integer):String;
begin
  Case AccType of
  1:Result :='D'+AccountCode;
  2:Result :='C'+AccountCode;
  3:Result :='B'+AccountCode;
  4:Result :='T'+AccountCode;
  else
    Result :='G'+AccountCode;
  end;
end;

Function ZipAccountCode(AccountCode:string):String;
begin
  Result:=xRoutines.ZipAccountCode(AccountCode);
  exit;
(*
  Result:=AccountCode;
  if Pos('-',Result)<>0 then
  begin
    delete(Result,Pos('-',Result),1);
  end;
*)
end;

Function GetFileNameOnly(SFile:String):String;
begin
  Try
    if Pos('.',SFile)<>0 then
      Result := Copy(SFile,1,Pos('.',SFile)-1);
  Except Result:=SFile end;
end;


Function  GetDocTypeFromDocId(DocId:Integer):Integer ;
var
 AQuery: TuniQuery ;
begin
 AQuery:= TuniQuery.create(nil) ;
   try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.Sql.text := 'Select WTYPEID from dochead where WDocid ='+ IntToStr(DocId) ;
    AQuery.open ;
    result := AQuery.fields[0].asinteger ;
   finally
     AQuery.free ;
  end;
end ;

Function GetDocHeadingMes(idDocType:Integer):String;
Var
  HoldActive:Boolean;
Begin
  HoldActive:=dmDatabase.tblSysVars.Active;
  if not HoldActive then
    dmDatabase.tblSysVars.Active:=True;
  Case idDocType of
  11:Result :=dmDatabase.tblSysVarsSCreditNoteHeading.Value;
  12:Result :=dmDatabase.tblSysVarsSPurchaseHeading.Value;
  13:Result :=dmDatabase.tblSysVarsSGoodsReturnedHeading.Value;
  14:Result :=dmDatabase.tblSysVarsSQuoteHeading.Value;
  15:Result :=dmDatabase.tblSysVarsSOrderHeading.Value;
  19:Result :=GetTextLang(1313){'Delivery Note '};
  else
    Result:=dmDatabase.tblSysVarsSInvoiceHeading.Value;
  end;
  if not HoldActive then
    dmDatabase.tblSysVars.Active:=HoldActive;
end;


Function SelectAccType(OldTypeID:Integer;JustSelect:Boolean=false):Integer;
begin

  frmSelectAccountType := TfrmSelectAccountType.Create(Application);
  try
  SetUpForm(frmSelectAccountType);
   frmSelectAccountType.JustSelect :=  JustSelect ;
  MyResult:=OldTypeID;
  frmSelectAccountType.ShowModal;
  Result:=MyResult;
  finally
  frmSelectAccountType.Free;
  end;
end;

procedure Fix203TxtFile(Var FileName:String);
Var
  T3TxtFile,
  DelTxtFile   : TextFile;
  vTxtBuf,
  vTxtBufOk     : String;
  i:integer;
begin
  AssignFile(DelTxtFile, FileName);
  FileName:=ChangeFileExt(FileName,'.txt');
  AssignFile(T3TxtFile, FileName);
  Reset(DelTxtFile);
  ReWrite(T3TxtFile);
  while not SeekEOF(DelTxtFile) do
  begin
    ReadLn(DelTxtFile, vTxtBuf);
    vTxtBufOk:='';
    if Pos(#10,vTxtBuf)<>0 then
      for i:=1 to Length(vTxtBuf) do
      begin
        if vTxtBuf[i]=#10 then
        begin
          vTxtBufOk:=vTxtBufOk+#13#10;
          if Copy(vTxtBuf,i+1,4)='""",' then
            vTxtBufOk:=vTxtBufOk+'"';
        end
        else
        begin
          vTxtBufOk:=vTxtBufOk+vTxtBuf[i];
          if Copy(vTxtBuf,i,5)=',""",' then
            vTxtBufOk:=vTxtBufOk+'"';
        end;
      end
    else
      vTxtBufOk:=vTxtBuf;
    Writeln(T3TxtFile,vTxtBufOk);
  end;
  CloseFile(T3TxtFile);
  CloseFile(DelTxtFile);
end;





function  AddDashInAccCodeNoPRefix(AccCode:String):String;
begin
  Result:=AccCode;
  If Length(Result)<MainAccountLength then
    exit;
  If Result[1] in ['0'..'9'] then
    if Length(AccCode)>1+MainAccountLength then

      Insert('-',Result,1+MainAccountLength)
     else
     else
  // Code with Account type in front thats the one longer than MainAccountLength +3
  if Length(AccCode)> MainAccountLength +3 then
       Insert('-',Result,1+MainAccountLength)
       else   // sometimes the subaccountcode is not there apperently
    if Length(AccCode)>MainAccountLength then
      Insert('-',Result,1+MainAccountLength);
  if result ='-' then
    result := '' ;
end;

Function AddDashInAccCode(AccCode:String;ShortCode:Boolean=False):String;
begin
 Result := TDataBaseRoutines.AddDashInAccCode(AccCode,ShortCode);
end;

Function TrimInStr(vString:String):String;
begin
  Result:=FctTrimInStr(vString);
end;

Function GetWinOSName:string;
// Added by Sylvain
var
  VwOS : OSVERSIONINFO;
begin
  try
    VwOs.dwOSVersionInfoSize:=SizeOf(VwOs);
    GetVersionEx (VwOs);
    Result := 'unknown';
    case VwOs.dwPlatformId of

      VER_PLATFORM_WIN32_NT:
        if (VwOs.dwMajorVersion = 3) then
          Result := 'Windows NT 3.51'
        else if (VwOs.dwMajorVersion = 4) then
          Result := 'Windows NT 4.0'
        else if (VwOs.dwMajorVersion = 5) AND (VwOs.dwMinorVersion= 0)  then
          Result := 'Windows 2000'
        else if (VwOs.dwMajorVersion = 5) AND (VwOs.dwMinorVersion= 1)  then
          Result := 'Windows XP';

      VER_PLATFORM_WIN32_WINDOWS:
      begin
        (*
        if (VwOs.dwMajorVersion = 4) AND (VwOs.dwMinorVersion = 0) then
          Result := 'Windows 95'
        else begin
          if (VwOs.dwMinorVersion = 10) then
            Result := 'Windows 98'
          else if (VwOs.dwMinorVersion = 90) then
            Result := 'Windows Me';
          *)
          if (VwOs.dwMajorVersion = 4) AND (VwOs.dwMinorVersion = 10) then
          begin
               if VwOs.szCSDVersion[1] = 'A' then
                 result := 'Windows 98 SE'
               else
                  result := 'Windows 98';
          end {if Version = 'A'}
          else
          if (VwOs.dwMajorVersion = 4) AND (VwOs.dwMinorVersion = 90) then
            result := 'Windows Me'
          else
            result := 'unknown';
      end;
      VER_PLATFORM_WIN32s:
        Result := 'Win32s';

    end;
      if Result<>'unknown' then ;
        Result:=Result+' (Build '+ IntToStr(VwOS.dwMajorVersion)
             + '.'+ IntToStr(VwOs.dwMinorVersion)+ ')';
  except
    Result := 'unknown';
  end;
end;




Procedure SetFaxFiles(wbNext:Integer);
Var
  F:TSearchRec;
  Bool:Boolean;
begin
  Bool:=False;
  if FindFirst(ApplicationPath+'tmp\*.egr',faAnyFile ,F)=0 then
  begin
    if UpperCase(ExtractFileExt(f.Name))='.EGR' then
    begin
      RenameFile(ApplicationPath+'tmp\'+F.Name,DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ intToStr(wbNext) +'.FAX');
      Bool:=True;
    end;
  while FindNext(F)=0 do
  begin
    if Bool then
      Sysutils.DeleteFile(f.NAme)
     else
     if UpperCase(ExtractFileExt(f.Name))='.EGR' then
     begin
      RenameFile(ApplicationPath+'tmp\'+F.Name,DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ intToStr(wbNext) +'.FAX');
      Bool:=True;
     end;
  end;
  If Not Bool then
  // Check and Get For Windows 2000 And NT
  begin
    if FindFirst(ApplicationPath+'tmp\*.grp',faAnyFile ,F)=0 then
    if UpperCase(ExtractFileExt(f.Name))='.GRP' then
    begin
      RenameFile(ApplicationPath+'tmp\'+F.Name,DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ intToStr(wbNext) +'.FAX');
      Bool:=True;
    end;
    while FindNext(F)=0 do
    begin
      if Bool then
        Sysutils.DeleteFile(f.NAme)
       else
       if UpperCase(ExtractFileExt(f.Name))='.GRP' then
       begin
        RenameFile(ApplicationPath+'tmp\'+F.Name,DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ intToStr(wbNext) +'.FAX');
        Bool:=True;
       end;
    end;
    // End For Win 2000 and NT
  end;
     // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
  end;
end;


Procedure ClacBBFAmts(Var Value,Temp:Real);
// Added by sylvain
// This fct reduce Value with Amt and
// Set result correctly to get BBF
// if Value>0 than temp must be <0 and Vice versa
// So this works for Debtor and Creditor;
begin
  if Abs(Value)>Abs(Temp) then
  begin
    Value:=Value+Temp;
    Temp:=0;
  end
  else
  begin
    Temp:=Value+Temp;
    Value:=0;
  end;
end;

Function GetCmdPath:string;
// This function get the command.com path
var
  SDos:Array [0..255] of Char;
begin
  GetEnvironmentVariable('COMSPEC',SDos,255);
  Result:=String(SDos);
  if Result<>'' then Exit;
  if fileExists('C:\Command.com') then
     SDos:='C:\Command.com'
   else begin
     GetSystemDirectory(SDos,Max_Path);
     StrPCopy(SDos,SDos+' \Command.com');
     if Not FileExists(String(SDos)) then begin
       GetWindowsDirectory(SDos,Max_Path);
       StrPCopy(SDos,SDos+' \Command.com');
       if Not FileExists(String(SDos)) then begin
         GetWindowsDirectory(SDos,Max_Path);
         StrPCopy(SDos,SDos+'\Command\Command.com');
         if Not FileExists(String(SDos)) then begin
           Result:='';
           exit;
         end;
       end;
     end;
   end;
  Result:=String(SDos);
end;


function GetDescFromList(AList: TStrings;AId :Integer) : String ;
begin
   result := '' ;
   if AList.IndexOfObject(TObject(AId)) <> -1 then
     Result := AList[AList.IndexOfObject(TObject(AId))] ;
end;
Function FitIndex(Value:TDBComboBox):Integer;
begin
  Result:=Value.ItemIndex;
  if (Value.Items.Count<1) or (Value.text='') then exit;
  if Value.Items.IndexOf(Value.text)<>Result then
  begin
    result:=0;
    While (Result<=Value.Items.count-1) do
    begin
      if (Value.Items[Result]>=Value.Text) then
        Break;
      Inc(Result);
    end;
    Value.ItemIndex:=Result;
  end;
end;



Function  CreateAgeSql(BDebtor,NameSort:Boolean;GroupShow:Integer):String;
Var
  Orderby:String;
begin
   result := dmDatabase.SQLList.GetFormatedSQLByName('AgeAnalisys_SelectFromAgeTemp');
    if NameSort then
      Orderby := ' tmpAgeAn.SDescription,tmpAgeAn.WAccountID,Transact.DDate'
    else
      Orderby := ' tmpAgeAn.SACCOUNTCODE,tmpAgeAn.WAccountID,Transact.DDate';
    if GroupShow in [1,2] then
      Orderby :=  ' A.WReportingGroup'+IntToStr(GroupShow)+'ID,' + Orderby ;
    Result := Result +' Order By '+ Orderby;
end;


Function GetAbreviation(Var S:String):Boolean;
begin
  Result:=False;
  if (Length(s)=1) AND (S<>' ') then
  begin
    dmdatabase.tblAbreviations.Open;
    if dmdatabase.tblAbreviations.locate('CKey',S,[loCaseInsensitive]) then
    begin
      Result:=true;
      S:=dmdatabase.tblAbreviationsSAbreviation.Value;
    end;
    dmdatabase.tblAbreviations.Close;
  end;
end;



Function GetFinCatDescription(FinCatID:Integer):String;
begin
  Case FinCatID of
  69:Result:='Assests';
  67:Result:='Captital';
  66:Result:='Expenses';
  68:Result:='Incomes';
  65:Result:='Liabilities';
  else
    Result:='';
  end;
end;

// lets do it so the debtors and creditors will be searched.
Function  BCheckOpenItem(_AccountID :Integer):Integer;
// Result = 0 if not OpenItem
//        = 1 if Debtor  OpenItem
//        = 2 if Creditor OpenItem
//        = 3 if Account OpenItem
   Var
//    FoundOne : Boolean ;
    AQuery : TuniQuery ;
begin
      Result:=0;
      AQuery := TuniQuery.Create(nil) ;
      try
        AQuery.Connection := dmDatabase.ZMainconnection ;
        AQuery.SQL.Text := 'Select BOpenItem,WAccountTypeID from Account where WAccountID = ' + IntToStr(_AccountID);
        AQuery.open ;
        if AQuery.Fields[0].AsInteger = 0 then
          exit ;
        if AQuery.Fields[0].AsInteger = 1 then
          result := 1 else
        if AQuery.Fields[0].AsInteger = 2 then
          result := 2
          else
          result := 3 ;
      finally
         AQuery.free ;
      end;
end;


Function GetOPenBatchCtrlID(BatTypeID:Integer):Integer;
begin
  // DMCoreData_SelectBatchConOnUserType
  dmDatabase.ZQBatControl.SQL.Text := 'Select * from batcon where WBatchTypeID = :WBatchTypeID AND WUserID = :WUserID and bposted = 0 order by Wbatchid desc  ';
  dmDatabase.ZQBatControl.ParamByName('WUserID').asinteger := CurrentUser ;
  dmDatabase.ZQBatControl.ParamByName('WBatchTypeID').asinteger := BatTypeID ;
  dmDatabase.ZQBatControl.Open ;
  Result := dmDatabase.ZQBatControlWBatchID.Value;
  dmDatabase.ZQBatControl.Close;
end;

Function GetBatchCtrlID(BatTypeID:Integer):Integer;
begin
  // DMCoreData_SelectBatchConOnUserType
  dmDatabase.ZQBatControl.SQL.Text := 'Select * from batcon where WBatchTypeID = :WBatchTypeID AND WUserID = :WUserID and bposted = 1 order by Wbatchid desc  ';
  dmDatabase.ZQBatControl.ParamByName('WUserID').asinteger := CurrentUser ;
  dmDatabase.ZQBatControl.ParamByName('WBatchTypeID').asinteger := BatTypeID ;
  dmDatabase.ZQBatControl.Open ;
  Result := dmDatabase.ZQBatControlWBatchID.Value;
  dmDatabase.ZQBatControl.Close;
end;


Function GetDrvType(DriveStr:String):Byte;
VAr
  S:String;
begin
  S:=ExtractFileDrive(Trim(DriveStr));

  if Pos(':',s)=0 then
  begin
    S:=Copy(s,1,Pos(':',S))+'\';
    result := GetDriveType(PChar(s));
  end
  else
  if (S[1]='\') and (s[2]= '\') then
    Result := 255 //
  else
    Result := GetDriveType(PChar(s));
end;

//Function Bool2Str(Value:Boolean):String;
//begin
// Result:= Bool2Str(Value);
//end;

Procedure CreatReportOp(vfield:String);
begin
  CreatNwReportOp(vfield);
End;




procedure FillTmpAgeTable(DbtAccount:Boolean;Date90,Date60,Date30,DateCur:Tdate;BOiMode,ShowTransactions:Boolean);
Var
  _WSwt, vDec,
  _WPeriodID:Integer;
  FDate : Tdate;


  Tmp : Real;
  iCount:Integer;
  afmNewProgress : TfmNewProgress ;
  Procedure AgeByDate(aValue:Real);
  begin
    if fDate<=Date90 then
       dmDatabase.tblTmpAgeAnalF90Days.Value := dmDatabase.tblTmpAgeAnalF90Days.Value + aValue
    else if (fDate>Date90) AND (fDate<=Date60) then
       dmDatabase.tblTmpAgeAnalF60Days.Value := dmDatabase.tblTmpAgeAnalF60Days.Value + aValue
    else if (fDate>Date60) AND (fDate<=Date30) then
       dmDatabase.tblTmpAgeAnalF30Days.Value := dmDatabase.tblTmpAgeAnalF30Days.Value + aValue
    else if (fDate>Date30) AND (fDate<=DateCur) and BOiMode then
        dmDatabase.tblTmpAgeAnalFCurrent.Value := dmDatabase.tblTmpAgeAnalFCurrent.Value + aValue ;
  end;

  Procedure CorrectAgeByDate(aValue:Real);
  var
   ValIsNeg : Boolean ;
   TempVal : Double ;
  begin
   TempVal := 0 ;

    ValIsNeg := aValue < 0 ;
    if dmDatabase.tblTmpAgeAnalF90Days.AsFloat <> 0 then
      begin

       if ValIsNeg then
        begin
          TempVal := - min(-aValue,dmDatabase.tblTmpAgeAnalF90Days.AsFloat) ;
          aValue := aValue + min(-aValue,dmDatabase.tblTmpAgeAnalF90Days.AsFloat) ;
          if aValue > 0 then
              aValue := 0 ;

         end;
       if not ValIsNeg then
        begin
          TempVal := - max(-aValue,dmDatabase.tblTmpAgeAnalF90Days.AsFloat) ;
          aValue := aValue + max(-aValue,dmDatabase.tblTmpAgeAnalF90Days.AsFloat) ;
           if aValue < 0 then
              aValue := 0 ;

         end;


       dmDatabase.tblTmpAgeAnalF90Days.AsFloat := dmDatabase.tblTmpAgeAnalF90Days.AsFloat + TempVal
      end;

    if (dmDatabase.tblTmpAgeAnalF60Days.AsFloat <> 0) and (aValue <> 0)  then
      begin
         if ValIsNeg then
            begin
              TempVal := - min(-aValue,dmDatabase.tblTmpAgeAnalF60Days.AsFloat) ;
              aValue := aValue + min(-aValue,dmDatabase.tblTmpAgeAnalF60Days.AsFloat) ;
              if aValue > 0 then
                  aValue := 0 ;

             end;
           if not ValIsNeg then
            begin
              TempVal := - max(-aValue,dmDatabase.tblTmpAgeAnalF60Days.AsFloat) ;
              aValue := aValue + max(-aValue,dmDatabase.tblTmpAgeAnalF60Days.AsFloat) ;
               if aValue < 0 then
                  aValue := 0 ;

             end;


       dmDatabase.tblTmpAgeAnalF60Days.AsFloat := dmDatabase.tblTmpAgeAnalF60Days.AsFloat + TempVal
      end;

    if (dmDatabase.tblTmpAgeAnalF30Days.AsFloat <> 0) and (aValue <> 0)  then
          begin

         if ValIsNeg then
            begin
              TempVal := - min(-aValue,dmDatabase.tblTmpAgeAnalF30Days.AsFloat) ;


             end;
           if not ValIsNeg then
            begin
              TempVal := - max(-aValue,dmDatabase.tblTmpAgeAnalF30Days.AsFloat) ;

             end;
       dmDatabase.tblTmpAgeAnalF30Days.AsFloat := dmDatabase.tblTmpAgeAnalF30Days.AsFloat + TempVal ;
      end;

  {   if (dmDatabase.tblTmpAgeAnalFCurrent.AsFloat <> 0) and (aValue <> 0)  then
          begin
         if ValIsNeg then
            begin
              TempVal := - min(-aValue,dmDatabase.tblTmpAgeAnalFCurrent.AsFloat) ;
              aValue := aValue + min(-aValue,dmDatabase.tblTmpAgeAnalFCurrent.AsFloat) ;
               if aValue > 0 then
                  aValue := 0 ;

             end;
           if not ValIsNeg then
            begin
              TempVal := - max(-aValue,dmDatabase.tblTmpAgeAnalFCurrent.AsFloat) ;
              aValue := aValue + max(-aValue,dmDatabase.tblTmpAgeAnalFCurrent.AsFloat) ;
              if aValue < 0 then
                  aValue := 0 ;

             end;

       dmDatabase.tblTmpAgeAnalFCurrent.AsFloat := dmDatabase.tblTmpAgeAnalFCurrent.AsFloat + Tmp ;    
      end;   }
  end;

   
begin
  afmNewProgress := TfmNewProgress.create(nil) ;
  try
   vDec := GetDecPres;
  // Why is this Do you just wat all transactions older then 90??
  _WPeriodID:=GetPeriod(Date90);

  dmDatabase.tblTmpAgeAnal.DisableControls;
  dmDatabase.tblTmpAgeAnal.Close;
  clearTable(dmDatabase.tblTmpAgeAnal.TableName);
//  dmDatabase.tblAccount.Open;
 // dmDatabase.tblTransaction.open;
  dmDatabase.tblTmpAgeAnal.Open;
  dmDatabase.tblAccount.last ;
  afmNewProgress.initProgress(gettextlang(2083),dmDatabase.tblAccount.RecordCount);

  iCount:=0;


  // Add All selected Accounts
  dmDatabase.tblAccount.First;
  while not dmDatabase.tblAccount.eof do
  begin
    Inc(Icount);
    afmNewProgress.SetProgressCount(iCount);
    dmDatabase.tblTmpAgeAnal.Append;
    dmDatabase.tblTmpAgeAnalWAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
    dmDatabase.tblTmpAgeAnalWAccountTypeID.Value := dmDatabase.tblAccountWAccountTypeID.Value;
    dmDatabase.tblTmpAgeAnalSdescription.Value := dmDatabase.tblAccountSDescription.Value;
    dmDatabase.tblTmpAgeAnalSACCOUNTCODE.Value := dmDatabase.tblAccountSACCOUNTCODE.Value;
    if not BOiMode then
    begin
       dmDatabase.tblTmpAgeAnalF90Days.Value := FixAmount(GetExactAccountTotal(dmDatabase.tblAccountWAccountID.Value,_WPeriodID,Date90),vDec);
       dmDatabase.tblTmpAgeAnalFTotal.Value := FixAmount(GetExactAccountTotal(dmDatabase.tblAccountWAccountID.Value,GetPeriod(DateCur),DateCur),vDec);
       dmDatabase.tblTmpAgeAnalFCurrent.AsFloat := FixAmount(dmDatabase.tblTmpAgeAnalFTotal.Value,vDec); ;
       dmDatabase.tblTmpAgeAnalFBBF.Value := FixAmount(dmDatabase.tblTmpAgeAnalF90Days.Value,vDec);
     end else
     begin
         dmDatabase.tblTmpAgeAnalFTotal.Value := FixAmount(GetExactAccountTotal(dmDatabase.tblAccountWAccountID.Value,GetPeriod(DateCur),DateCur),vDec);
     end;
    dmDatabase.tblTmpAgeAnal.Post;
    dmDatabase.tblAccount.Next;
  end ;
  // Age All Tansactions
//


  //
  afmNewProgress.SetSubText(gettextlang(2064));
  iCount:=0;
  if BOiMode then
  begin
    with dmDatabase.qGen do
    begin
      Sql.Clear;
      Sql.Add(' Select Transact.DDate, Transact.Famount, Transact.FOutStandingamount, Transact.WAccountID,');
      Sql.Add(' Transact.WPeriodID');
      Sql.Add(' From Transact, tmpAgeAn');
      Sql.Add(' Where Transact.WAccountID = tmpAgeAn.WAccountID');
      Sql.Add(' And Transact.FOutStandingamount<>0');
      Sql.Add(' and DDate<= :date1');
      params[0].AsDateTime :=  DateCur  ;
      Filtered:=False;
      Open;
      afmNewProgress.initProgress('',RecordCount);
      // Calc Age
      First;
      While not eof do
      begin
        Inc(Icount);
        afmNewProgress.SetProgressCount(iCount);
        afmNewProgress.SetProgress('',iCount);


        Tmp := FieldByName('FOutStandingAmount').AsFloat;
        tmp := FixAmount(tmp,vdec);
        dmDatabase.tblTmpAgeAnal.Locate('WaccountID',dmDatabase.qGen.FieldByName('WAccountID').AsInteger,[]);
        fDate := FieldByName('DDate').Value;
        dmDatabase.tblTmpAgeAnal.Edit;
        if fdate<=Date30 then
          dmDatabase.tblTmpAgeAnalFBBF.Value:=dmDatabase.tblTmpAgeAnalFBBF.Value+tmp;
       // dmDatabase.tblTmpAgeAnalFTotal.Value:= dmDatabase.tblTmpAgeAnalFTotal.Value + tmp;
        AgeByDate(tmp);
        dmDatabase.tblTmpAgeAnal.Post;
        next;
     end;
    end;
  end
  else
  begin

   // std (no openitem) must deduct - amt from oldest openitem for debotr and reverse for creditor.
    with dmDatabase.qGen do
    begin
      Sql.Clear;
      Sql.Add('Select Transact.DDate, Transact.Famount, Transact.FOutStandingamount, Transact.WAccountID,');
      Sql.Add('Transact.WPeriodID');
      Sql.Add('From Transact, tmpAgeAn');
      Sql.Add('Where Transact.WAccountID = tmpAgeAn.WAccountID');
      sql.Add('and ((DDate <= :date1 AND DDate >= :date2 ) )');
      Params[0].AsDateTime := DateCur ;
      Params[1].AsDateTime := Date90 ;


      Filtered:=False;

      Sql.Add('Order By Transact.WAccountID,Transact.DDate ') ;

      Open;
      // Calc Age
      last ;
      First;
      Icount := 0 ;
      afmNewProgress.initProgress(gettextlang(2063),dmDatabase.qGen.RecordCount);

      While not eof do
      begin
        Inc(Icount);
        afmNewProgress.SetProgress('',iCount);
        Tmp := FieldByName('FAmount').AsFloat;
        tmp := FixAmount(tmp,vdec);        
        dmDatabase.tblTmpAgeAnal.Locate('WaccountID',dmDatabase.qGen.FieldByName('WAccountID').AsInteger,[]);
        fDate :=dmDatabase.qGen.FieldByName('DDate').Value;
        dmDatabase.tblTmpAgeAnal.Edit;
        if fdate<=Date30 then
          dmDatabase.tblTmpAgeAnalFBBF.Value:=dmDatabase.tblTmpAgeAnalFBBF.Value+tmp;
    //   dmDatabase.tblTmpAgeAnalFTotal.Value := dmDatabase.tblTmpAgeAnalFTotal.Value + tmp;

        if not BOiMode then
        begin
            if (DbtAccount and (tmp < 0)) or (not DbtAccount and (tmp > 0)) and not ShowTransactions then
               CorrectAgeByDate(Tmp)
            else
               AgeByDate(tmp) ;
        end else
        begin
           AgeByDate(tmp) ;
        end;

        dmDatabase.tblTmpAgeAnal.Post;
        next;
      end;
    end;
  end;
  dmDatabase.qGen.Close;
  dmDatabase.tblTmpAgeAnal.EnableControls;

  finally
      afmNewProgress.CloseProgress ;
      afmNewProgress.free ;
  end;
end;


Function ValideInt(S:string):Integer;
begin
  Result:=Abs(StrToInt(S));
  if Result<0 then Result:=1;
end;


function  GetTotalProffitLoss(WFromID,WToID : Integer) : Double ;
var
  AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := dmDatabase.ZMainconnection ;
     AQuery.sql.Text := 'select sum(totals.FAmount) from totals join ACCOUNT on (totals.WaccountID = ACCOUNT.WAccountID)' +
                        ' where Account.BSubaccounts = 0 and totals.bACTUAL = 1 and Account.WAccountTypeId in (0,3,4) and Account.BINCOMEEXPENSE = 1'+
                        ' and Totals.wyearid in (1,2) and Totals.WPeriodID >=' + InTtoStr(WFromID) +' and Totals.WPeriodID <=' + InTtoStr(WToID) ;
     AQuery.open ;
     result := AQuery.Fields[0].AsFloat ;
   finally
    AQuery.free ;
   end;

end;

Function GetRangeTotal(WPeriodTypeID,WFromID,WToID,WAccountID:integer;BIncludeOpeningBals,BIncExp:Boolean):real;
// This function is used in Tb, IncomeStat and Bal Sheet Only.
// Lets make it SQL thats always faster
begin
  with dmDatabase do
  begin

    Case WPeriodTypeID of
    0:Begin
       //this year

       if BIncludeOpeningBals then
        begin
         if  WToID > 13 then
          begin
          ZCalTotals.sql.text := 'select sum(FAmount) from totals where WAccountID =  ' + IntToStr(WAccountID)+
                   '  and (((WPeriodID >=  ' + IntToStr(WFromID) +
                    ' ) and (WPeriodID <= '  + IntToStr(WToID)+
                    ' )) or (WPeriodID = 0)) and BActual = 1'
           end else
           begin
          ZCalTotals.sql.text := 'select sum(FAmount) from totals where WAccountID =  ' + IntToStr(WAccountID)+
                   '  and (((WPeriodID >=  ' + IntToStr(WFromID) +
                    ' ) and (WPeriodID <= '  + IntToStr(WToID)+
                    ' )) or (WPeriodID = -1)) and BActual = 1'
           end;
          end // end openig balans
        else
        ZCalTotals.sql.text := 'select sum(FAmount) from totals where WAccountID =  ' + IntToStr(WAccountID) +
                    ' and WPeriodID >=  ' + IntToStr(WFromID) +
                    ' and WPeriodID <=  ' + IntToStr(WToID) +
                    ' and BActual = 1';
       ZCalTotals.Filtered := True;
       ZCalTotals.Open;
       result := ZCalTotals.fields[0].asfloat ;
      end;
    1:begin
       //Budgets
       ZCalTotals.sql.text := 'select sum(FAmount) from totals where WAccountID = ' + IntToStr(WAccountID)+ ' and WPeriodID >= ' + IntToStr(WFromID) + ' and WPeriodID <= ' + IntToStr(WToID) + ' and BActual <> 1';
       ZCalTotals.Open;
       result := ZCalTotals.fields[0].asfloat ;
      end
    else
       //last year
       ZCalTotals.sql.text := 'select sum(FAmount) from totals where WAccountID = ' + IntToStr(WAccountID) +
                           ' and WPeriodID >= ' + IntToStr(WFromID) +
                           ' and WPeriodID <= ' + IntToStr(WToID ) +
                           ' and BActual = 1';

       ZCalTotals.Open;
       result := ZCalTotals.fields[0].asfloat ;
       // adjust last year's opening balance by subtracting total transaction amounts
       // for the year.
       if ((BIncludeOpeningBals) and (BIncExp = false)) then begin
         if WAccountID = tblSysVarsWRetainedIncomeID.Value
          then Result := Result + GetYearsOpeningBalance(WAccountID)
          else Result := Result + GetYearsOpeningBalance(WAccountID);
       end;
    end;
    ZCalTotals.Close;
  end;
end;

 


Function CallCalc(Var InMem:Double):Boolean;
begin
  frmCalculator := TfrmCalculator.Create(Application);
  try
  TcMem:= InMem;
  SetUpForm(frmCalculator);
  frmCalculator.ShowModal;
  Result := frmCalculator.GetResult;
  InMem := Str2Float(frmCalculator.StrExpres);
  finally
   FreeAndNil(frmCalculator);
  end;
end;

Function  ReadReportOp(vfield:String;aDate:TDate):TField;
begin
   Result:= ReadNwReportOp(vfield,aDate);
end;

Function  ReadReportOp(vfield:String;Value:Integer):TField;
begin
   Result:= ReadNwReportOp(vfield,Value);
end;

Function  ReadReportOp(vfield,sValue:String):TField;
begin
   Result:= ReadNwReportOp(vfield,sValue);
end;

Function  ReadReportOp(vfield:String):TField;
begin
  Result:= ReadNwReportOp(vfield);
end;

Function  ReadReportOp(vfield:String;BValue:Boolean):TField;
begin
  Result := ReadNwReportOp(vfield,BValue);
end;

Procedure WriteReportOp(vfield,Value:String);
begin
  WriteNwReportOp(vfield,Value);
end;


function DoesBatchBalance : Boolean;
var
  Temp    : Real;
  Periods : array[1..26] of Real;
  count   : Integer;
begin
  Temp := 0;
  with dmDatabase do
  begin
    tblBatchRefTotals.Close;
    tblBatchRefTotals.TableName := BatchNameFName;
    tblBatchRefTotals.Open;
    tblBatchRefTotals.First;
    while not tblBatchRefTotals.EOF do
    begin
      Temp := Temp + (tblBatchRefTotalsFDEBIT.Value - tblBatchRefTotalsFCREDIT.Value);
      tblBatchRefTotals.Next;
    end;
    tblBatchRefTotals.Close;
    //there is a bit of a round off problem here *
    if (Temp >= -0.01) and (Temp <= 0.01) then
    begin
      //if the batch balances , check periods
      //initialise the array
      for count := 1 to 26 do
        Periods[count] := 0;
      tblBatchRefTotals.Open;
      tblBatchRefTotals.First;
      //fill the array
      while not tblBatchRefTotals.EOF do
      begin
        Periods[GetPeriod(tblBatchRefTotalsDDate.Value)] := Periods[GetPeriod(tblBatchRefTotalsDDate.Value)] + (tblBatchRefTotalsFDEBIT.Value - tblBatchRefTotalsFCREDIT.Value);
        tblBatchRefTotals.Next;
      end;
      tblBatchRefTotals.Close;
      //check the array
      for count := 1 to 26 do
      begin
        //*and here.
        if (Periods[count] >= -0.01) and (Periods[count] <= 0.01) then
          DoesBatchBalance := True
        else
        begin
          tblPeriods.Open;
          tblPeriods.Locate('WPeriodID', count, []);
          OSFMessageDlg(tblPeriodsSDescription.Value + ' '+GetTextLang(591)+' ' + FloatToStrF(Periods[count], ffFixed, 18, 2) + '.', mterror, [mbok], 0);
          tblPeriods.Close;
          DoesBatchBalance := False;
          Exit;
        end;
      end;
    end
    else
      DoesBatchBalance := False;
  end;
end;

Function CheckUserCtrl(vAction:String;Msg:Boolean):Boolean;
var
  HoldActive:Boolean;
  vMess :String;
begin
  result:=true;
  if CurrentUser<=0 then
    exit;
  vAction:=UpperCase(vAction);
  HoldActive:=dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Active:=True;
  dmDatabase.tblUser.Filtered := false ;
  if vAction='POST' then
  begin
    dmDatabase.tblUser.Locate('WUserID',CurrentUser,[]);
    result:=dmDatabase.tblUserBPosting.Value=1;
    vMess:='Update Ledger';
  end;
  if vAction='BATCH' then
  begin
    dmDatabase.tblUser.Locate('WUserID',CurrentUser,[]);
    result:=dmDatabase.tblUserBBatchEntry.Value=1;
    vMess:='Batch Entry';
  end;
  dmDatabase.tblUser.Active := HoldActive;
  if Msg And (not Result) then
    OSFMessageDlg(vMess+#13#10+GetTextLang(829)+#13#10+GetTextLang(830), mterror, [mbok], 0);
end;

Procedure SetUserOnLine(vOnline:Boolean);
var
  HoldActive:Boolean;
begin
  try
    HoldActive:=dmDatabase.tblUser.Active;
    dmDatabase.tblUser.Open;
    if dmDatabase.tblUser.Locate('WUserID',CurrentUser,[]) then
    begin
      dmDatabase.tblUser.Edit;
      dmDatabase.tblUser.FieldByName('BOnline').AsInteger := ord(vOnline);
      dmDatabase.tblUser.Post;
    end;
    dmDatabase.tblUser.Active := HoldActive ;
  except End;
end;

Function ValideFaxNbr(sfNumber:string):String;
Var
  i:Integer;
begin
  Result:='';
  for i:=1 to length(sfNumber) do
    if sfNumber[i] in ['0'..'9'] then
      Result:=Result + sfNumber[i];
   // Remove leading 0
  if Result='' then exit;
  while Result[1]='0' do
    Delete(Result,1,1);
end;





Function  FaxSetup(vLock:Boolean):Integer;
Var
  i:Integer;
  Reg: Tregistry;
  BinDrv : Array [1..451] of Byte;
  BinDrvWin2 : Array [1..788] of Byte;
  tmpFaxFolder : String;
begin
  Result:=0;  // No Error
  Reg := TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
  if Reg.OpenKey('Printers\DevModePerUser' ,False) then
  begin
    if Reg.ValueExists('I.eFaxPro') then
    Begin
      // Win 2000 or NT Case
       if  Reg.ReadBinaryData('I.eFaxPro',BinDrvWin2,Sizeof(BinDrvWin2))<>0 then
       begin
         if vLock then
         begin
           if  ((BinDrvWin2[777] AND 1)=1)then
           begin // Set Byte to 0
             BinDrvWin2[777] := BinDrvWin2[777] - 1;
             Reg.WriteBinaryData('I.eFaxPro',BinDrvWin2,Sizeof(BinDrvWin2))
           end;
           Reg.RootKey:=HKEY_LOCAL_MACHINE;
           // Set Temp folder to Tcash3\Temp
           if Reg.OpenKey('System\CurrentControlSet\Control\Print\Printers\I.eFaxPro\PrinterDriverData' ,False) then
           begin

             Reg.WriteString('Out Directory',ApplicationPath+'Tmp');
           end
           else
           begin
             //
             Result:=1; // Error Can not Set temp Directory
             Exit;
           end;
         end
         else  // Unlock Fax Driver
         begin
           if (BinDrvWin2[777] AND 1)=0then
           begin // Set Byte to 1
             BinDrvWin2[777] := BinDrvWin2[777] + 1;
             Reg.WriteBinaryData('I.eFaxPro',BinDrvWin2,Sizeof(BinDrvWin2))
           end;
         end;
       end;
     end;
  end
  else   // Not Win 2000
  Begin
    // Win 9x.x
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    Reg.OpenKey('System\CurrentControlSet\Control\Print\Printers\I.eFaxPro',False);
    if  Reg.ReadBinaryData('Default DevMode',BinDrv,Sizeof(BinDrv))<>0 then
    begin
       tmpFaxFolder:='';
       For i:=1 to 127 do
         if BinDrv[152+i]>0 then
           tmpFaxFolder := tmpFaxFolder + Char(BinDrv[152+i])
         else
           Break;
       if vLock then
       begin
           if  ((BinDrv[286] AND 1)=1)then
           begin // Set Byte to 0
             BinDrv[286] := BinDrv[286] - 1;
//             Reg.WriteBinaryData('Default DevMode',BinDrv,Sizeof(BinDrv))
           end;
           tmpFaxFolder:=ApplicationPath+'Tmp';
           For i:=1 to 127  do
             if i<=Length(tmpFaxFolder) then
               BinDrv[152+i]:=Ord(tmpFaxFolder[i])
             else
               BinDrv[152+i]:=0;
           Reg.WriteBinaryData('Default DevMode',BinDrv,Sizeof(BinDrv))
       end
       else // Unlock Fax Driver
       begin
           if (BinDrv[286] AND 1)=0then
           begin // Set Byte to 1
             BinDrv[286] := BinDrv[286] + 1;
             Reg.WriteBinaryData('Default DevMode',BinDrv,Sizeof(BinDrv))
           end;
       end;

     end;
  end;
  Reg.Free;
end;

Function GetFaxPrinterIdx:integer;
var
  FaxPrinter : TPrinter;
  i: integer;
begin
  Result:=-1;
  try
    FaxPrinter := TPrinter.Create;
    try
      for i:=0 to FaxPrinter.Printers.Count-1 do
        if Pos('I.EFAXPRO',UpperCase(FaxPrinter.Printers[i]))<>0 then
        begin
          Result:=i;
          Break
        end
    finally
     FaxPrinter.Free;
    end;
  except
    // No handel ?
  end;

end;

Procedure MoveBtns(BtnTag:Integer;Pnl:TPanel;Btn1,Btn2,Btn3,Btn4:TSpeedButton);
  Procedure btnMvt(fBtn:TSpeedButton;Up:Boolean);
  begin
    if fBtn.Tag=BtnTag then
      fBtn.Font.Style := fBtn.Font.Style + [fsBold]
    else
      fBtn.Font.Style := fBtn.Font.Style - [fsBold];
    if up then
      fBtn.Top := Pnl.Top + (fBtn.Tag-1) * Btn1.Height -1
    else // Move down
      fBtn.Top := Pnl.Top + Pnl.Height - 5 - (5-fBtn.Tag) * Btn1.Height;
  end;
begin
  btnMvt(btn1,btn1.Tag<=btntag);
  btnMvt(btn2,btn2.Tag<=btntag);
  btnMvt(btn3,btn3.Tag<=btntag);
  btnMvt(btn4,btn4.Tag<=btntag);
end;

Procedure CheckTransactionSTAX;
Var
  fDate :TDate ;
  WBacthID,
  TrID,
  AccID : Integer;
  Famount : Real;
  fFilter : STring;
begin
 // todo : pieter I think we need to do this only once and then stay off it . What will hapen if the tax rate chages etc
 // This comes from multyple tax accounts
  dmDatabase.tblTransaction.Close;
  fFilter := '';
  dmDatabase.tblTax.Open;

  dmDatabase.tblTransaction.DisableControls;

  // TODO : BDEINDEX
  // dmDatabase.tblTransaction.IndexName :='' ;
  dmDatabase.tblTransaction.Filtered := False ;
  dmDatabase.tblTransaction.Filter := 'FTaxAmount<>0 And FTaxRate=0';
  dmDatabase.tblTransaction.Filtered := True;
  dmDatabase.tblTransaction.Open;

  if dmDatabase.tblTransaction.RecordCount>0 then
  begin
    dmDatabase.tblTransaction.Filtered := False;
//    dmDatabase.tblTransaction.Open;
    dmDatabase.tblTransaction.First;
    While not dmDatabase.tblTransaction.eof do
    begin
      TrID := dmDatabase.tblTransactionWtransactionID.Value;
      fAmount := dmDatabase.tblTransactionFAmount.Value;
      fDate := dmDatabase.tblTransactionDDate.Value;
      WBacthID := dmDatabase.tblTransactionWBatchID.Value;
      AccID := dmDatabase.tblTransactionWAccountID.Value;
      if dmDatabase.tbltax.Locate('WAccountID',AccID,[]) AND (AccID>0) then
      begin
        dmDatabase.tblTransaction.Next;
        if (Trunc(dmDatabase.tblTransactionFTaxAmount.Value*10) = -Trunc(FAmount*10)) And (AccID<>0) And (dmDatabase.tblTaxFRate.Value<>0)
           AND (WBacthID = dmDatabase.tblTransactionWBatchID.Value)  AND (fDate = dmDatabase.tblTransactionDDate.Value)
           And (dmDatabase.tblTransactionFTaxRate.Value=0) then
        begin
            dmDatabase.tblTransaction.Edit;
            dmDatabase.tblTransactionFTaxRate.Value := dmDatabase.tblTaxFRate.Value ;
            dmDatabase.tblTransactionwTaxAccountID.Value := dmDatabase.tblTaxWAccountID.Value;
            dmDatabase.tblTransaction.Post;
        end;
        dmDatabase.tblTransaction.Prior;
      end;
      fAmount := dmDatabase.tblTransactionFTaxAmount.Value;
      if (dmDatabase.tblTransactionFTaxRate.Value=0) AND (fAmount<>0) then
      begin
        dmDatabase.tblTransaction.MoveBy(2);
        if Trunc(dmDatabase.tblTransactionFAmount.Value*10)=-Trunc(fAmount*10) then
        begin
          AccID := dmDatabase.tblTransactionWAccountID.Value;
          dmDatabase.tblTransaction.MoveBy(-2);
          if dmDatabase.tbltax.Locate('WAccountID',AccID,[]) then
          begin
            dmDatabase.tblTransaction.Edit;
            dmDatabase.tblTransactionFTaxRate.Value := dmDatabase.tblTaxFRate.Value ;
            dmDatabase.tblTransactionwTaxAccountID.Value := AccID;
            dmDatabase.tblTransaction.Post;
          end;
        end;
        dmDatabase.tblTransaction.MoveBy(-2);
      end;
      While (dmDatabase.tblTransactionWtransactionID.Value <= TrID) And (Not dmDatabase.tblTransaction.Eof) do
       dmDatabase.tblTransaction.Next;
    end;
  end;
  dmDatabase.tblTransaction.Filtered := False ;
  dmDatabase.tblTransaction.Filter := '';
  dmDatabase.tblTransaction.DisableControls;
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblTax.Close;
end;




Function FormatDateRange(SDateID , EDateID : Integer): String ;
Var
  HoldActive : Boolean ;
  SDAte, EDate : TDate ;
begin
  HoldActive := dmDatabase.tblPeriods.Active ;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', SDateID, []);
  SDate:= dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', EDateID, []);
  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  if SDateID=EDateID then
    EDate := SDate;
  Result :=DateRange(SDate,EDate);
  dmDatabase.tblPeriods.Active := HoldActive ;
end;


Function GetFirstPeriodDate:TDate;
begin
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.First;
  if dmDatabase.tblPeriodsWPeriodID.Value<>1 then
    dmDatabase.tblPeriods.Locate('WPeriodID',1,[]);
  Result := dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Close;
end;

Function GetIspPasseWord:String;
Var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Result := '';
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if Reg.OpenKey('\SYTW3\Inc',False)
    then Result := Reg.ReadString('SyTw_v');
    Result := ShiftStr(Result,True);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

Procedure SetIspPasseWord(Value:String);
Var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if Reg.OpenKey('\SYTW3\Inc',True)
    then Reg.WriteString('SyTw_v',ShiftStr(Value,True));
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;




Function CheckNilTotalBal(_AccountID,_PeriodID:Integer):Boolean;
Var
  HoldActive:Boolean;
begin
  HoldActive:=dmDatabase.tblTotals.active;
  Result := True;
  if Not HoldActive then
    dmDatabase.tblTotals.Open;
  if dmDatabase.tblTotals.locate('WPeriodID;WAccountID;BActual',VarArrayOf([_PeriodID,_AccountID,1]),[]) then
  begin
    Result := dmDatabase.tblTotalsFAmount.Value=0;
  end;
end;

Function CheckO2CNilBal(_AccountID,_oPeriodID,_cPeriodID:Integer):Boolean;
Var
  HoldActive:Boolean;
  Som : Real;
begin
  HoldActive:=dmDatabase.tblTotals.active;
  Som := 0;

  if Not HoldActive then
    dmDatabase.tblTotals.Open;

  dmDatabase.tblTotals.locate('WAccountID;BActual',VarArrayOf([_AccountID,1]),[]);
  While (dmDatabase.tblTotalsWAccountID.Value = _AccountID)  do
  begin
    if (dmDatabase.tblTotalsWPeriodID.Value >= _oPeriodID-1) AND (dmDatabase.tblTotalsWPeriodID.Value <= _cPeriodID)
      AND (dmDatabase.tblTotalsBActual.Value = 1) then
      Som := Som + dmDatabase.tblTotalsFAmount.Value;
    dmDatabase.tblTotals.Next;
  end;
  Result := Som = 0;
  if Not HoldActive then
    dmDatabase.tblTotals.Close;
end;

Function CanPostToLastYear:Boolean;
begin
  Result := DatabaseAccess.CanPostToLastYear;
  exit;

end;



function GetDecPres:Integer;
begin
  dmDatabase.tblReportingOptions.Open;
  result :=Str2Int(dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString);
//  dmDatabase.tblReportingOptions.Close;
end;




Function CalcReconAmts(aDate:TDate;BankStat,TotalUnposted:Real;AccountID:Integer):Double;

begin
  With DmDataBase do
  Begin
    Result:= TDataBaseRoutines.GetBalans(AccountID, aDate);
    result:= Result-TotalUnposted;
  end;
end;

Procedure UpdatePb(Percent:Integer);
begin
  fmMain.UpDateProgressBar(Application,Percent);
end;

Function GetProgress:LongInt;
begin
//  Result := fmProgress.Gauge1.Progress;
    Result := _GetProgress;
end;

procedure SetSubProgres(aPos:LongInt);
begin
   _SetSubProgress(aPos);
end;

procedure InitSubProgres(aText:String;aMax:LongInt);
begin
   _InitSubProgress(aText,aMax);
end;

Procedure SetProgress(aMax:LongInt);
begin
//  if aMax>=0 then
//    fmProgress.Gauge1.MaxValue:=aMax
//  else
//  begin
//    fmProgress.CLose;
//    Exit;
//  end;
    _SetProgress(aMax);
end;

Procedure SetProgress(aText:String;aPosition:LongInt);
begin
  _SetProgress(aText,aPosition);
//  if aText<>'' then
//    fmProgress.lblCount.Caption := aText;
//  fmProgress.Gauge1.Progress := aPosition;
//  if Not fmProgress.Visible then
//    fmProgress.Show
//
//  else
//    fmProgress.Repaint;
//  fmProgress.Update;
end;



Function ReadDescription(MessageID:Integer):String;
{Read Description From Message.db}
begin
  REsult:= _ReadDescription(MessageID);
end;


Procedure HtmlShowTopic(Index:Integer);
begin
  XRoutines.HtmlShowTopic(Index);
//  HtmlHelpShowContentID(Index);
end;



Function GetLatFolder(Folder:String):String;
begin
  Result:=Trim(Folder);
  If Result='' then
    exit;
  if Result[Length(Result)]='\' then
    Delete(Result,Length(Result),1);
  while Pos('\',Result)>0 do
    Delete(Result,1,Pos('\',Result));
  Result:=Trim(Result) + '\';
end;

Function GetBackupPath:String;
begin
   if TheGlobalDataObject.Books.ActiveBooks <> nil then
      begin
         Result:=ReadT3IniFile('BACKUP','LASTPATH'+TheGlobalDataObject.Books.ActiveBooks.Name,TDMTCCoreLink.GetLocalBaseDir);
      end else
         Result:=ReadT3IniFile('BACKUP','LASTPATH',TDMTCCoreLink.GetLocalBaseDir);
  // provide long default path,
end;
      
Function ReadContactName(_Contact:Integer):String;
Var

  aSaveClientDatasetCall : TSaveClientDatasetCall ;
begin
  aSaveClientDatasetCall := TSaveClientDatasetCall.Create(dmDatabase.QContacts,true) ;

  try
  dmDatabase.QContacts.SQL.Text := 'Select * from contacts where RecordID =:ID ';
  dmDatabase.QContacts.params[0].AsInteger :=  _Contact ;
  dmDatabase.QContacts.open ;
  if not dmDatabase.QContacts.IsEmpty  then
    Result := dmDatabase.QContactsLastName.Value 
  else
   Result:='';
  finally
     aSaveClientDatasetCall.free ;
  end;
end;



Procedure LoadBatchList(aList:TComboBox);
Begin
  dmDatabase.tblBatchTypes.Open;
  dmDatabase.tblBatchTypes.First;
  aList.Clear;
  While Not dmDatabase.tblBatchTypes.Eof do
  begin
    aList.Items.AddObject(dmDatabase.tblBatchTypesSDescription.Value,TObject(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger));
    dmDatabase.tblBatchTypes.Next;
  end;
  dmDatabase.tblBatchTypes.Close;
end;

Procedure LoadPaperType(aList:TComboBox);
begin
  With Dmdatabase do
  begin
    aList.Clear;
    tbltype.active:=True;
    tbltype.Filtered:=False;
    tbltype.Filter:='WTypeParent=5';
    tbltype.Filtered:=True;
    tbltype.First;
    While Not tbltype.Eof do
    begin
      aList.items.add(tblTypeSDescription.AsString);
      tbltype.Next;
    end;
    tbltype.active:=False;
    tbltype.Filtered:=False;
    tbltype.Filter:='';
  end;
end;

Function GetTcName:String;
begin
  Case TCashCompiledAs of
  10: Result :='Lite ';
  else
    Result:='';
  end;
end;

Function GetDocName(DocID:integer):String;
begin
  Case DocID of
  11:Result := gettextlang(2152){'Credit Note'};
  12:Result := gettextlang(2153){'Purchasse'};
  13:Result := gettextlang(2154){'Goods Returned'};
  14:Result := gettextlang(2169){'Quote'};
  15:Result := gettextlang(2170){'Order'};
  16:Result := 'Stock out';
  17:Result := 'Stock in';
  18:Result := 'Production';
  19:Result := 'Dissable';
  else
    Result :=gettextlang(2155){'Invoice'};
  end;
end;

Procedure PreviewDocument(SenditTo,WDocID:integer;ToFileName : String = '' );
{This Wil Send Out The Document Corresponding to WDocID
 After that All Tables will be Closed !!!}
 var
  ASaveClientDatasetCallList : TSaveClientDatasetCallList ;
  CustomLayout : String ;
begin


  if WDocId=0 then Exit;
  ASaveClientDatasetCallList := TSaveClientDatasetCallList.Create ;
 try
  ASaveClientDatasetCallList.AddclientObject(dmDatabase.qrPrnDocLines,false);
  ASaveClientDatasetCallList.AddclientObject(dmDatabase.tblUnit,false);
  ASaveClientDatasetCallList.AddclientObject(dmDatabase.tblStock,false);
  ASaveClientDatasetCallList.AddclientObject(dmDatabase.tblSysVars,false);
  ASaveClientDatasetCallList.AddclientObject(dmDatabase.tblGroups,false);

  ASaveClientDatasetCallList.AddclientObject(dmDatabase.tblDocHeader,false);


  dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where WDocId='+  IntToStr(WDocID)  ;
  dmDatabase.tblDocHeader.Open ;
  OpenDocSql('WDocID='+ IntToStr(WDocID) ,'');
  SetSQlLine(' AND WDocID='+  IntToStr(WDocID) );
  dmDatabase.qrPrnDocLines.Open;
  dmDatabase.tblSysVars.open ;
  CustomLayout := TDataBaseDocumentRoutines.GetDoclayoutOnAccountAndType(idDocType, dmDatabase.tblDocHeaderWACCOUNTID.AsInteger);
  ShowFrReport(SenditTo,0,1,GetDocTypeFromDocId(WDocID),CustomLayout);
   finally
     ASaveClientDatasetCallList.free ;
  end;
end;


Procedure ChangeBatAlias(aBatchID:Integer;AnAlias:String);
begin
  dmDatabase.ZQBatControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnBatcControlID');
  dmDatabase.ZQBatControl.ParamByName('WBatchID').AsInteger := aBatchID ;
  dmDatabase.ZQBatControl.open ;
  if not dmDatabase.ZQBatControl.Eof then
  begin
     dmDatabase.ZQBatControl.Edit ;
     dmDatabase.ZQBatControlSAlias.AsString:=AnAlias;
     dmDatabase.ZQBatControl.Post ;
  end;
end;

Function GetBatAlias(aBatchID:Integer):String;
begin
  dmDatabase.ZQBatControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnBatcControlID');
  dmDatabase.ZQBatControl.ParamByName('WBatchID').AsInteger := aBatchID ;
  dmDatabase.ZQBatControl.open ;
  Result := dmDatabase.ZQBatControlSAlias.AsString;
end;


function  SendaMapiMail(const Subject, Body, FileName,SenderName, SenderEMail,RecipientName, RecipientEMail: string;aHandle : HWND = 0 ): Integer;
begin
  Result := TcSendMapiMail(Subject, Body, FileName,SenderName, SenderEMail,RecipientName, RecipientEMail,aHandle);
end;



Procedure TcashHtmlCmd(aBase,acmd:Byte);
begin
  Case acmd of
  100: begin
         fmMain.FileCreateClick(fmMain);
      end;


  end;
end;

Procedure LoadPrtOutBmp(aImage:TImage;Index:integer);
Var
 aFileName:String;
begin
 Case Index of
 1: {Printer}aFileName:='toPrinter.ico';
 2: aFileName:='tofile.ico'{File};
 3: aFileName:='toemail.ico'{email};
 4: aFileName:='tofax.ico'{Fax};
 else
   aFileName:='toscreen.ico';
 end;
 try
   aImage.Picture.Icon.LoadFromFile(ThemePath+'toscreen.ico');
 except end;
end;


procedure  Highlight(EditBox : TEdit);
begin
 XRoutines.Highlight(EditBox);
end;

procedure  BackNormal(EditBox : TEdit);
begin
  XRoutines.BackNormal(EditBox);
end;

Procedure LoadGroups(cbBox:TComboBox;GroupID:Integer;WithAll:Boolean=True);
begin
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = '+IntToStr(GroupID);
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.First;
  cbBox.Items.Clear;
  if WithAll then
    cbBox.Items.AddObject('All',TObject(0));
  while not dmDatabase.tblGroups.EOF do
  begin
    cbBox.Items.AddObject(dmDatabase.tblGroupsSDescription.Value,TObject(dmDatabase.tblGroupsWGroupID.AsInteger));
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblGroups.Close;
end;

Function LocateGroup(Description:String;wTypeID:Integer):Integer;
Var
  Hold:Boolean;
begin
  Hold := dmDatabase.tblGroups.Active;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  if dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayOf([wTypeID,Description]),[LoCaseInsensitive]) then
   Result := dmDatabase.tblGroupsWGroupID.Value
  else
    Result := -1;
  dmDatabase.tblGroups.Active := Hold;
end;



Procedure RunUpdateClient;
Var
  App:String;
begin
   Exit;
   App := ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + 'UpdateNetSvr.exe';
   if Not FileExists(app) then exit;
   ShellExecute(Application.Handle, 'open', Pchar(app),Pchar('-v False -b '+dmDatabase.ZMainconnection.Database+ ' -u '+ CurrentUserName+' -p '+SavePass) , nil, SW_SHOW);
end;

end.











