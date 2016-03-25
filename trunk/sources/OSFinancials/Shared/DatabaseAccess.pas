(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DatabaseAccess;
{***************************************************************}
{                                                               }
{       This Unit will let All Plug-ins to Access               }
{       Dmdatabase module safely Using correct Calls            }
{                                                               }
{       * Date  : 29/08/2002   12:11:00                         }
{       * Author: Sylvain Ntumba                                }
{       * Note: Changing this can cause Plug-ins to not Compile }
{                Or the main TurboCASH to not Compile           }
{       Copyright (c) 2002   PinksoftWare                       }
{                                                               }
{***************************************************************}

interface

uses SysUtils,Forms,Mapi,windows,DB,Database,TcVariables,Math,Controls,
    Buttons,ShellApi,DBClient, Graphics,StdCtrls,Classes,
    Variants,dbiProcs,Registry,Dialogs,ExtCtrls, DBAccess , Uni,
    TcashClasses;


Type

// allows easy saving of the database settings.
// Add more propertys if there needed.
TSaveClientDatasetCall = Class
  private
    Bookmark : {$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
    Filter : String ;
    Filterd : Boolean ;
    IndexFieldName : String ;
    ADataset : TDataset ;
    DataState : TDataSetState ;
    Active : Boolean ;
    DisableControls : Boolean ;
  public
    AfterInsert :  TDataSetNotifyEvent ;
    destructor Destroy; override;
    Constructor Create (AClientDataset : TDataset ;aDisableControls : Boolean) ;
 end;

// A list of database object mantained by its self so destruction wil reset the databases in it.
// Lets use this so the code gets cleaner and propebly saver.
TSaveClientDatasetCallList = class(TList)
  private
    function GetclientObject(index: integer): TSaveClientDatasetCall;
   public
    function AddclientObject(ADataset : TDataset;aDisableControls : Boolean ) : TSaveClientDatasetCall ;
    property clientObject [index : integer] : TSaveClientDatasetCall  read GetclientObject ;
    destructor Destroy; override;
end;





function GetPersistentProp(const AName: string; APersistent: TPersistent): Variant;
procedure SetPersistentProp(const AName: string;  APersistent: TPersistent; Value: Variant);

Function  GetTotalsByPeriods(Var aAccRec:TAccountRec):Boolean;
Function  RoundAmount(Amount: Real;vDec:Integer):real;Overload;
Function  RoundAmount(Amount: Real):real;Overload;
Function  GetBankBatch(AContraAccID:integer;BPymt:Boolean ):integer;
Function  LocateAccount(Var FAccount:TAccountRec):Boolean;
Procedure GetDatesLimits;
//procedure CheckBatchFieldDefsLengths ;
Function  GetBatchTypeName(aBatchTypeID:Integer):String;
function  BatchTypeIdFromBatchConId(WBatConId : integer ) : integer ;
Function  GetBatchTypeID(aBatchName:String):Integer;
procedure  GetBatchConRec(Var aBatch:TBatchCon;JustRead:Boolean;DS:TDataSet=Nil);
Function  IfSwapVars(Var vloInt,vHiInt:Integer):Boolean;
Procedure GetRprtSizes(arprtType:integer;Var aLeft,aRight,aBott,aTop,aWidth,aLen:real;Var BCust:Boolean);
Function  ReadNwReportOp(vfield:String):TField;Overload;
Function  ReadNwReportOp(vfield:String;BValue:Boolean):TField;Overload;
Function  ReadNwReportOp(vfield:String;DValue:TDate):TField;Overload;
Function  ReadNwReportOp(vfield:String;SValue:String):TField;Overload;
Function  ReadNwReportOp(vfield:String;Value:Integer):TField;Overload;
Procedure WriteNwReportOp(vfield,Value:String);
Procedure CreatNwReportOp(vfield:String);
Procedure WriteLongReportOp(vfield,Value:String);
function  ReadLongReportOp(vfield:String) : String ;

Function  FloatToStr2Dec(aValue:real):String;
Function  FloatToSQLStr(aValue:real):String;
Function  ExtractXmlTag(XmlStr,aTagName:String):String;
function  TcSendMapiMail(const Subject, Body, FileName,
                  SenderName, SenderEMail,
                  RecipientName, RecipientEMail: AnsiString;aHandle : HWND = 0): Integer;
Function  IsProperlyClosed:Integer;
function  GetTaxRate(TaxAcc:String;UseLinkRate : Boolean = true):Double;
function  GetTaxRateOnId(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;

function  GetTaxRate100(TaxID:Integer):Integer;



function  GetPeriodDesc(DateID:Integer):string;
function  StripMinFromLongAccountCode(AString : String ) : String ;
procedure LoadTextBatch(Filename : String;DefaultContraID:Integer);
procedure WriteTextBatch(Filename : String);
procedure WriteTextBatchFromDataset(ADataset : TDataset ; AFilename : String ) ;
Function  OpenBatch(aBatchType:String;Var BatID:integer;Repeating:Boolean;AltBatch:TUniTable=nil):String;
Procedure GetBatchList (AList : TStrings);
Function  GetAppPath:String;
Function  GetT3UserName(UserID:integer):String;
Function  GetT3UserID(UserName:String):Integer;
Procedure DoCloseBatch;
Function  CanPostToLastYear:Boolean;
Function  PostBatch(CanToLastYear,MustPost:Boolean;IsReverse : Boolean  = false;IsOpeningBal : Boolean = false ):Integer;
Function  ExportDocsToTxf(aStartDate,aEndDate:TDateTime;afilename:String):integer;
Function  ExportDocsToTxfStr(aStartDate,aEndDate:TDateTime;Var docstext:String):integer;
procedure OpenDocSql(aFilter,Order:String);
Procedure ChargeDocSql;
Function  WriteDocListToStr(filter:String;Var StrResult:String):integer;
Function  FixAmount(Amount:Real):real;Overload;
Function  FixDocAmount(Amount:Real):real;
Function  FixAmount(Amount:Real;vDec:Integer):real;OverLoad;

// todo : Write Language stuff to non database / XMLDatapacket so the way for divernet DB's is then created.
function  GetTextLang(MsgID : Integer) : String;
function GetTypeDesc(AType : Integer) : String ;
procedure ChangePrnLbls(aDestLbl,alblCopies:Tlabel;aBitSetPrint:TWinControl);
Procedure EditBtns(bAdd,bEdit,bDelete:TPersistent);
Procedure NavBtns(b1,b2,b3,b4:TPersistent);
Procedure OkCancel(aOk,aCancel:TWinControl);
// Language stuff

Function  CheckGetReconData(BankAccountID:Integer;vDate,tDate:TDateTime; Var PymtID,RcptID:String;Var TotalUnpost:Double;JustOpenRCon:Boolean = false):integer;
Procedure UpDateBankRecon(PymtID,RcptID:String);
Function  ComposeBatName(aUser,BatID:integer;Var CanCreate:Boolean;Repeating:Boolean):string;OverLoad;
procedure ClearAndCreateBatFiles(DoClearTable  : boolean ) ;
Function  LoadDocHead(DocID:Integer;Var Value:TDocHeadRec):Boolean;

Function  GetAddUnitId(aUnitStr:String;Add:Boolean=False):Integer;
Function  GetAddGetContact( aName ,Telephone1,Telephone2 ,Fax , SEmail  : String;AccountId : Integer ): Integer;
Function  GetContactName(AContact : Integer ): String ;
procedure GetContactInfo(AContact : Integer;Var aName ,Telephone1,Telephone2 ,Fax , SEmail  : String ) ;

Procedure UpDateOutStanding(TransactID:Integer;OutStanding:Double);
//Function  GetOpenItemLinked(WtransactionID:integer):String;
Function  GetsplMess(MessID:Integer):String;
Procedure LoadSalesPersons(aList:TStrings);
Procedure GetMainColorVars(Var Colour:Integer);
Procedure LoadPrintOutModes(cbComboPrint:TComboBox);
Procedure BatConRelink(aBatID,aBatType,aUserid:Integer;bPosted:Boolean);
//procedure  LoadDocTypes(AList : TStrings;AddAll,AddQuoteOrder:boolean);
function  CallLookup(OldValue : String; Kind : Integer;OldID : integer = 0;FreeLimit : String ='';ForceShowList : Boolean = True ;Parent : TWincontrol = nil;ForCreditor : Integer = 0) : String;OverLoad;
function  CallLookup(OldValue : Integer; Kind : Integer;FreeLimit : String ='';ForceShowList : Boolean = True;Parent : TWincontrol = nil;ForCreditor : Integer = 0) : String;OverLoad;
procedure ClearLookupModalType ;
Function  OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
          AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false;FontStr : String = '' ): Word;
function  ShowQuestionMessage(AQuestion : String) : word ;

Function  CheckBackOrder(vAccountID : Integer):Boolean;
Function  GetViewMask(Amt:Byte):String ;
Function  GetDefaultDocPaperID(DocTypeID:integer):Integer;
Procedure SetGRSQlLine(WhereClause : String);
Procedure SetSQlLine(WhereClause : String);
procedure SetDefaults;
procedure SetSysvars;
Function  EditAccountRecord(AccountCode:String;Description:Variant;Group1,Group2:String;IncomeExpense:Boolean;BopenItem,BInactive : Integer):Integer;
procedure CreateTotalsEntries(AccountID : Integer);
Function  UserControlAccess(aSection:String;UserID:Integer=-100):Boolean;
Procedure LoadSqlinCds(aSql:String;cds:TClientDataset);
Procedure WriteNetServerParams;
Procedure ReadNetServerParams(Var MailUserName,EmailAddr,ServerName:String);
Function  ReadSysParam(vfield:String;Default:Real    ;UserID:Integer ;AType:Integer=0):TField;Overload;
Function  ReadSysParam(vfield:String;Default:Integer ;UserID:Integer ;AType:Integer=0):TField;Overload;
Function  ReadSysParam(vfield:String;Default:String  ;UserID:Integer ;AType:Integer=0):TField;overload;
Function  ReadSysParam(vfield:String;BValue :Boolean ;UserID:Integer ;AType:Integer=0):TField;Overload;
function  ReadLongSysparam(vfield:String;UserID:Integer;AType:Integer=0;ADefault:string='') : String ;
Procedure WriteLongSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);
//Function  ReadSysParam(vfield:String;UserID:Integer):TField;OverLoad;
Function  InternalReadSysParam(vfield:String;UserID:Integer;AType:Integer):TField;
Procedure WriteSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);Overload;
Procedure WriteSysParam(vfield:String;Default:Integer;WUserID:Integer=0;WTypeID:Integer=0);Overload;
Procedure SetSMTPSettings(aUserAccount,aServerAddr,aEmailAddr,aPwsd:String);
Procedure GetSMTPSettings(Var aUserAccount,aServerAddr,aEmailAddr,aPwsd:String);
//Function  GetAccountIDFromCode(AccountText:string):integer;
Function  GetAccountIdFromCodeAndType(AccountCode:string;TypeID : Integer):integer;
function  EncodePassword (Password : String) : String;
function  DecodePassword (Password : String) : String;
Function  IsGeneralPwd (Password : String)   : Boolean;
Function  FilterSubAccountsIDs(SMain:String;wType:integer):String;
Function  FilterDT_CTRlAccountIDs(Var RetID,DetID,CredID:integer ):String;
Function  SwapInt(Var vloInt,vHiInt:Integer):Boolean;
Function  FixAmt(Amt:Real):Real;overload;
Function  GetDecPalces:integer;
Function  FixAmt(Amt:Real;Decpl:Integer):Real;overload;
Procedure DeleteOnlineBank;
Procedure SetAccountGoupedSQL(GroupIndex:Integer;ExtraSql:String;BIncExp:Boolean=False);
Procedure GetDirFileList(aDirMusk:String;Var Result : TStringList);
function  FctCreateBooks(BooksPath,BooksToCreate : String;AccountLength : Integer) : Integer;
Function  IsAmtIncludeTax(ActualAmt,TaxRate: Double; Var TaxAmt:Double;BCashBook:Boolean):Boolean;
Function  GetCurrentBooksName:string;
Function  GetPhyAddress(WAccountID:Integer):String;
FUnction  GetUnitDesc(UnitID:Integer):String;
Function  GetCustContact(AccountID:Integer;Var Tel,Fax,TaxRef:String):String;
Function  TxfSign:String;
//Procedure UpdateSvr;
Procedure DocRecDates(Var DtFrom,DtTo:TDateTime;bRead:Boolean=True);
Function  CheckNewSince(Atime,aTimeTo:TDateTime;Atype:Integer;ExceptUser:Integer;Var trMin,TrMax:Integer):Boolean;
Function  BatchNameToTypeID(aBatName:String;Var aUserID:integer):Integer;
Function  GetActiveBatTypeName:String;
Function  CanUserBatch(UserID,aBatID:Integer):Boolean;
Procedure SetCanUserBatch(UserID,aBatID:Integer;Value:Boolean);
Function  DateTimeToDBEStr(ADate:TDateTime):String;
Procedure UpdateBatCon(BatID,InitID:integer;aAlias,AUnique:String;Imported:Boolean=True);
Function  SQLToXML(aSql:String):String;
Function  GetDbDescription(atable:string;KeyID:Integer):String;
Function  GetDbDescriptionEx(atable,Field,Where:string):String;
Procedure SeekAccount(Var aAccRec:TAccountRec);
Function  Var2Float(v:Variant):Real;
Procedure SaveAccountAccess(Value:TrSelect;aUserID:Integer);
Procedure LoadAccountAccess(Var Value:TrSelect;aUserID:Integer);
Function  GetAccExclFilter(Var AccBlocked:TrSelect):String;
Procedure InitAccBlockArray(Var Value:TrSelect;WUSerID : Integer = 0 ;JustBlocked:Boolean = false);
Function  DirectSQLToInt(SQLText,Field:String;Var Value:Integer):Boolean;
Function  DirectSQLToStr(SQLText,Field:String;Var Value:String):Boolean;
procedure  DirectSQLToBool(SQLText,Field:String;Var Value:Boolean);
// StringList With Int as obj routines
Procedure  FillStringListWithSelect(AStringList : TStrings ;ASelectIntKeyDescFromTable : String ; AEmptyTransaltionNr : integer = 20046);
function  GetItemIndexFromId(AStringList : TStrings ; AID : Integer ) : Integer ;
procedure SetFieldWithIndexValue(AField:TField;AStringList : TStrings ; AID : Integer);


Function  IncBatchLine(BatID:integer):Integer;
Function  BatchExists(InitID,UserID:integer;AUnique,SBatNumber:String):Integer;
Function  DateToFilter(Field:String;FrDate,ToDate:TdateTime;SQL:Boolean=True):String;
Function  DateTimeToFilter(Field:String;FrDate,ToDate:TdateTime;SQL:Boolean=True):String;
Function GetGroupDisplayName (AGroupType : TReportGroupTypes ) : String ;
Function BatchNameExists(Var Value: TBatchTypeRec):Boolean;
//Function  ValidateUser(SetofBooks,Username,Pass:String):Boolean;
Procedure PrepareExport(aFileList:TStringList;dtFrom,DtTo:TDateTime;UseDate:Boolean;ExceptUser:Integer;Prep:String='');
Procedure PrepareBatchRep(aFileList:TStringList;ExceptUser:Integer;Prep:String='');
Procedure CheckupDocNumber(UserID,DocType:Integer;Number:String);
Function  CheckBacthSecq(aBatchID:Integer):Boolean;
Function  ValidateUcsImport(Var aPrior,aCurrent:String;Save:Boolean):Integer;
Procedure LoadControlAccs;
Function  GetTxfTypeSpec:Integer;
Procedure LastBackupFileName(aName,aFolder:String);Overload;
Function  LastBackupFileName:String; Overload;
Function  AccountExists(Search,Look:String;Partial:Boolean):Boolean;
Function  AccountIsBlocked(WAccID:Integer;AccBlocked:TrSelect) : Boolean;
Function  CanUserAccesSACCOUNT(WUserID,wAccountType:Integer) : Boolean;
Function  IsMainAccountExist(AccountCode:String):Integer;
Procedure LoadBooksVars;
function  CheckTransActions(MainAccountNo, SubAccountNumber : String) : Boolean;
function  CheckTransActionsByID(AccountID:Integer) : Boolean;
procedure TransferTransactions(FromID, ToID:Integer);
Procedure DoneAccBlockArray(Var Value:TrSelect);

Procedure CopyDocument(AFromDocId,AToAccountID,DocType : Integer;DoDelete:Boolean ;GenList:TStringList;DefaultDate : TDate;UseDocDate : Boolean;Var NewDocId : Integer;AltDesc1: String = '';AltDesc2: String = '';AltDesc3: String = '';AddMessageText : String = '' ;RedoAccountInfo : Boolean = false ;UpdatePosted : Boolean = true) ;
Procedure CopyToDocument(AFromDocId,AToDocId : Integer;DoDelete : Boolean) ;
procedure CreateDocument(AToAccountID,DocType : Integer;Var NewDocId : Integer);
Procedure AddPurchaseStockLine(AAccountid,ADocid,AStockid : Integer; Aqty : Double;Var Lineid : Integer ;UsePriceOrg : Boolean = false ;CustSellPrice: Double = -1;CustDiscount : Double = -1;CustOrgSellPrice: Double = -1;Wunitid:  integer = -1 );

Procedure UpdatePurchaseStockLine(AAccountid,ADocid,ALineId : Integer; Aqty,AExcPrice : Double );

procedure ExportTrailBalanceAsBath(Fromid,ToId : Integer ; Filename : String );
function  CheckIfFieldExist(Afield,ATable  : String ) : Boolean ;
procedure Addfield(ATable, AfieldText: String);
Function  ExecSql(ASql:String):Integer ;
function  GetFieldLength(ATable,AField : String  ) : Integer ;
function  OpenSqlAndGetFirtsColumnValue(ASql : String) : Variant;
function  TableHasData(ATable : String ): Boolean ;
procedure DropTable(ATable : String) ;
procedure ClearTable(ATable : String) ;

Function  MakeBatUID:String;
Procedure SaveBatConRecord(Arec:TBatchCon);
Function  SeekBatch(Var ABatCont : TBatchCon):Boolean;

procedure FillAccountInfoInDocHead(AToAccountID : Integer;Replace : Boolean ) ;
Function GetMessageByDocType(idDocType:Integer;sMessageID:String):String;
Procedure UpdateBatchConDet;
function GetAccountCodeAndDescription(aAccountId : Integer) : String ;

Function IsFieldExists(vFieldName,vTableName:string):Boolean;
Function IntGetBatchRec(Var aBatch:TBatchCon):boolean;
Function CalcOpenBat:Integer;
// Main procedure to init the global object
// Thsi will for now load up the existing DB files but in the feature it will replace them
Procedure InitGlobalObject ;
procedure GlobalSetOfBooksToDataSet(ADataSet : TDataSet ) ;

implementation

uses GlobalFunctions,LedgerRoutines, Progress, ExchangeTCData, XRoutines,Lookup, UMsgBox,typinfo,
  NewLookup,DateUtils,OSFGeneralRoutines, UDMTCCoreLink, ConvTOX,posroutines,
   NewProgress, osfLookup;




procedure GlobalSetOfBooksToDataSet(ADataSet : TDataSet ) ;
var
 i : Integer ;
 LastId : Integer ;
begin
 LastId := ADataSet.FieldByName('ID').AsInteger ;
 ADataSet.DisableControls ;
 try
 while not ADataSet.IsEmpty do
  ADataSet.Delete ;

 for i:= 0 to TheGlobalDataObject.Books.Count -1 do
   begin
     ADataSet.insert ;
     ADataSet.FieldByName('ID').AsInteger := i ;
     ADataSet.FieldByName('Bookname').AsString := TheGlobalDataObject.Books[i].Name ;
     ADataSet.FieldByName('server').AsString := TheGlobalDataObject.Books[i].Server ;
     ADataSet.FieldByName('database').AsString := TheGlobalDataObject.Books[i].Database ;
     ADataSet.Post ;
   end;
  ADataSet.Locate('ID',LastId,[]);
  finally
     ADataSet.EnableControls ;
  end;
if adataset is  TClientDataSet then
begin
 if TClientDataSet(ADataSet).IndexDefs.IndexOf('indBookname') = -1 then
        TClientDataSet(ADataSet).AddIndex('indBookname', 'Bookname', []);
 TClientDataSet(ADataSet).IndexName := 'indBookname' ;
end; 


end;


Procedure InitGlobalObject ;
Var
 ASearchRec : TSearchRec ;
 LastLang : String ;
 i ,LastlangCount: Integer ;
begin
 // clear object
 TheGlobalDataObject.Clear ;
  if  FileExists(TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm') then
      TheGlobalDataObject.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm')
      else
      TheGlobalDataObject.LoadedFile := TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm' ;
     LastlangCount := TheGlobalDataObject.Languages.Count ;
     if TheGlobalDataObject.Languages.ActiveLanguage <> nil then
     LastLang := TheGlobalDataObject.Languages.ActiveLanguage.Name ;
     TheGlobalDataObject.Languages.clear ;
  // Find all languages
    if FindFirst(ExtractFilePath(Application.ExeName) +'Bin\Languages\*.dfm', faAnyFile, ASearchRec) = 0 then
    begin
      repeat

       if TheGlobalDataObject.Languages.findLanguageByName(ChangeFileExt(ASearchRec.name,'')) = nil then

        with TheGlobalDataObject.Languages.Add as TLanguageCollectionItem  do
        begin
            Name := ChangeFileExt(ASearchRec.name,'')  ;
            filename :=  ChangeFileExt(ASearchRec.name,'') ;
        end;

      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;
    if TheGlobalDataObject.Languages.findLanguageByName(LastLang) <> nil then
        TheGlobalDataObject.Languages.SetActiveLanguage(TheGlobalDataObject.Languages.findLanguageByName(LastLang).Index);
    if  TheGlobalDataObject.Languages.ActiveLanguage = nil then
        theGlobalDataObject.Languages.SetDefault ;

  for i  := 0 to TheGlobalDataObject.Languages.Count -1 do
     begin
         if TheGlobalDataObject.Languages[i].Active   then
           begin
             TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
             break ;
           end ;
     end;

    if LastlangCount <> Languages.Count then
      begin
      try
       TheGlobalDataObject.SaveToFile( TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm');
      except

      end;
      end;

   TheGlobalDataObject.DefaultLangSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\English.dfm');

    // InitBooks;
  if not FileExists(ExtractFilePath(Application.ExeName) + 'plug_ins\Openbooks.tpd') then
    if FindFirst(TDMTCCoreLink.GetLocalBaseDir+'Books\*.*', faDirectory, ASearchRec) = 0 then
    begin
      repeat
       if FileExists(TDMTCCoreLink.GetLocalBaseDir+'Books\' + ASearchRec.name +'\books.fdb') then
        if TheGlobalDataObject.Books.FindBooksByName(ASearchRec.name) = nil then
          with TheGlobalDataObject.Books.Add as TBooksCollectionItem  do
           begin
              Name :=  ASearchRec.name ;
              Database := TDMTCCoreLink.GetLocalBaseDir+'Books\' + ASearchRec.name +'\books.fdb'  ;
              UserName := 'sysdba';
              Password := 'masterkey';
           end;
      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;

end;

function GetAccountCodeAndDescription(aAccountId : Integer) : String ;
begin
  dmDatabase.qGen.SQL.Text := 'Select SACCOUNTCODE || ' + QuotedStr(' ')+ ' || SDescription as Text from account where WAccountId = ' + IntToStr(aAccountId);
  dmDatabase.qGen.open ;
  result :=  dmDatabase.qGen.fields[0].asstring ;
  dmDatabase.qGen.close ;

end;

Function IsFieldExists(vFieldName,vTableName:string):Boolean;
Var
  Vtable:TuniTable;
begin
  vTable:=TuniTable.create(Nil);
  Result:=False;
  Try
    vTable.Connection:=dmDatabase.ZMainconnection;
    vTable.TableName:=vTableName;
    vTable.Open;
    Try
      if vTable.FindField(vFieldName)=Nil then
        Result:=False
      else
        Result:=True;
    except end;
    vTable.Close;
  Finally
    vTable.Free;
  end;

end;


procedure FillAccountInfoInDocHead(AToAccountID : Integer;Replace : Boolean ) ;
 var
  DebQuery,CredQuery : TuniQuery ;
begin
 DebQuery := TuniQuery.Create(nil) ;
 CredQuery := TuniQuery.Create(nil) ;
 try
  DebQuery.Connection := DMTCCoreLink.TheZConnection ;
  CredQuery.Connection := DMTCCoreLink.TheZConnection ;

  DebQuery.sql.text := 'Select * from debtor where WAccountid = ' + IntToStr(AToAccountID) ;
  CredQuery.sql.text := 'Select * from creditor where WAccountid = ' + IntToStr(AToAccountID) ;
  DebQuery.open ;
  CredQuery.open  ;

         if (dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger :=AddMessage(TDataBaseRoutines.GetAccountDescription(AToAccountID));
         if (dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger :=AddMessage(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));




    if not DebQuery.IsEmpty then
      begin
         if (dmDatabase.tblDocHeaderWTAXNUMBER.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWTAXNUMBER.AsInteger :=AddMessage(DebQuery.findfield('SREFERENCE').AsString);


             dmDatabase.tblDocHeaderDDUEDATE.AsDateTime :=  dmDatabase.tblDocHeaderDDATE.AsDateTime  + DebQuery.findfield('WDUEDAYS').AsInteger;




         if (dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger := DebQuery.findfield('WDEFAULTACCOUNT').AsInteger ;

         if (dmDatabase.tblDocHeaderWPostal1ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostal1ID.AsInteger :=AddMessage(DebQuery.findfield('SPostal1').AsString);
         if (dmDatabase.tblDocHeaderWPostal2ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostal2ID.AsInteger :=AddMessage(DebQuery.findfield('SPostal2').AsString);
         if (dmDatabase.tblDocHeaderWPostal3ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostal3ID.AsInteger :=AddMessage(DebQuery.findfield('SPostal3').AsString);
         if (dmDatabase.tblDocHeaderWPostalCodeID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostalCodeID.AsInteger :=AddMessage(DebQuery.findfield('SPostalCode').AsString);
         if (dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger := DebQuery.findfield('WPOSTCOUNTRIES_ID').AsInteger;

         if (dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger :=AddMessage(DebQuery.findfield('SDelivery1').AsString);
         if (dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger :=AddMessage(DebQuery.findfield('SDelivery2').AsString);
         if (dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger :=AddMessage(DebQuery.findfield('SDelivery3').AsString);
         if (dmDatabase.tblDocHeaderWDelCodeID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelCodeID.AsInteger :=AddMessage(DebQuery.findfield('SDELIVERYCODE').AsString);
      if (dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger := DebQuery.findfield('WDELCOUNTRIES_ID').AsInteger;
      if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
         begin
             if (dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS').AsString = '') or replace then
             dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS').AsString := DebQuery.findfield('SEMAIL').AsString;
         end;
      if dmDatabase.tblDocHeader.FindField('X_CONTACTID') <> nil then
         begin
             if (dmDatabase.tblDocHeader.FindField('X_CONTACTID').AsInteger = 0) or replace then
             dmDatabase.tblDocHeader.FindField('X_CONTACTID').AsInteger := DebQuery.findfield('WCONTACTID').AsInteger;
         end;

         if  (dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger = 0) and
              (dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger = 0) and
              (dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger = 0) and
              (dmDatabase.tblDocHeaderWDelCodeID.AsInteger = 0) and
              (dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger = 0) then
              begin
                dmDatabase.tblDocHeaderWDELNAME.AsInteger := dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger ;
                dmDatabase.tblDocHeaderWDELCONTACT.AsInteger :=dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger ;
                dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger := dmDatabase.tblDocHeaderWPostal1ID.AsInteger ;
                dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger := dmDatabase.tblDocHeaderWPostal2ID.AsInteger ;
                dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger := dmDatabase.tblDocHeaderWPostal3ID.AsInteger ;
                dmDatabase.tblDocHeaderWDelCodeID.AsInteger  := dmDatabase.tblDocHeaderWPOSTALCODEID.AsInteger ;
                dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger := dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger ;
              end else
              begin
               if (dmDatabase.tblDocHeaderWDELNAME.AsInteger = 0) or replace then
                   dmDatabase.tblDocHeaderWDELNAME.AsInteger :=AddMessage(TDataBaseRoutines.GetAccountDescription(AToAccountID));
               if (dmDatabase.tblDocHeaderWDELCONTACT.AsInteger = 0) or replace then
                   dmDatabase.tblDocHeaderWDELCONTACT.AsInteger :=AddMessage(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));
              end;



      end;
    if not CredQuery.IsEmpty then
      begin
         dmDatabase.tblDocHeaderDDUEDATE.AsDateTime :=  dmDatabase.tblDocHeaderDDATE.AsDateTime  + CredQuery.findfield('WDUEDAYS').AsInteger;


      if dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
         begin
             if (dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS').AsString = '') or replace then
             dmDatabase.tblDocHeader.FindField('X_CUSTOMERS_EMAIL_ADDRESS').AsString := CredQuery.findfield('SEMAIL').AsString;
         end;
      if dmDatabase.tblDocHeader.FindField('X_CONTACTID') <> nil then
         begin
             if (dmDatabase.tblDocHeader.FindField('X_CONTACTID').AsInteger = 0) or replace then
             dmDatabase.tblDocHeader.FindField('X_CONTACTID').AsInteger := CredQuery.findfield('WCONTACTID').AsInteger;
         end;

         if (dmDatabase.tblDocHeaderWTAXNUMBER.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWTAXNUMBER.AsInteger :=AddMessage(CredQuery.findfield('SREFERENCE').AsString);

         if (dmDatabase.tblDocHeaderWDELNAME.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWDELNAME.AsInteger :=AddMessage(TDataBaseRoutines.GetAccountDescription(AToAccountID));
         if (dmDatabase.tblDocHeaderWDELCONTACT.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWDELCONTACT.AsInteger :=AddMessage(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));

         if (dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWPOSTALNAME.AsInteger :=AddMessage(TDataBaseRoutines.GetAccountDescription(AToAccountID));
         if (dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWPOSTALCONTACT.AsInteger :=AddMessage(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));


         if (dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger = 0) or replace then
             dmDatabase.tblDocHeaderWCONTRAACCOUNT.AsInteger := CredQuery.findfield('WDEFAULTACCOUNT').AsInteger ;
         if (dmDatabase.tblDocHeaderWPostal1ID.AsInteger = 0) or replace then
         begin
         dmDatabase.tblDocHeaderWPostal1ID.AsInteger :=AddMessage(CredQuery.findfield('SPostal1').AsString);
         if (dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPOSCOUNTRIES_ID.AsInteger := CredQuery.findfield('WPOSTCOUNTRIES_ID').AsInteger;
         if (dmDatabase.tblDocHeaderWPostal2ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostal2ID.AsInteger :=AddMessage(CredQuery.findfield('SPostal2').AsString);
         if (dmDatabase.tblDocHeaderWPostal3ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostal3ID.AsInteger :=AddMessage(CredQuery.findfield('SPostal3').AsString);
         if (dmDatabase.tblDocHeaderWPostalCodeID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWPostalCodeID.AsInteger :=AddMessage(CredQuery.findfield('SPostalCode').AsString);
         end;
         if (dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger = 0) or replace then
         begin
         dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger :=AddMessage(CredQuery.findfield('SDelivery1').AsString);
         if (dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger :=AddMessage(CredQuery.findfield('SDelivery2').AsString);
         if (dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger :=AddMessage(CredQuery.findfield('SDelivery3').AsString);
         if (dmDatabase.tblDocHeaderWDelCodeID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDelCodeID.AsInteger :=AddMessage(CredQuery.findfield('SDELIVERYCODE').AsString);
      if (dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger = 0) or replace then
         dmDatabase.tblDocHeaderWDELCOUNTRIES_ID.AsInteger := CredQuery.findfield('WDELCOUNTRIES_ID').AsInteger;
         end;
      end;
      
 if dmDatabase.tblDocHeaderDDATE.AsDateTime > dmDatabase.tblDocHeaderDDUEDATE.AsDateTime then
    dmDatabase.tblDocHeaderDDUEDATE.AsDateTime := dmDatabase.tblDocHeaderDDATE.AsDateTime ;

 finally
  DebQuery.free ;
  CredQuery.free ;
 end;

end ;


Procedure UpDateOutStanding(TransactID:Integer;OutStanding:Double);
begin
 ExecSql('update transact set FOutStandingAmount = ' + StringReplace(FloatToStr(OutStanding),DecimalSeparator,'.',[rfReplaceAll]) + 'where WTransactionID = ' +  inttostr(TransactID));
end;

function GetPersistentProp(const AName: string; APersistent: TPersistent): Variant;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  Result := varNull ;
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      try
        if (PropList[i]^.Name = Propname) then
        begin
          case PropList[i]^.PropType^.Kind of
            tkString, tkLString,tkUString,
              tkWString, tkWChar,
              tkChar:
              begin
                Result := GetStrProp(APersistent, PropList[i]);
              end;

            tkInteger,
              tkEnumeration:
              begin
                Result := GetOrdProp(APersistent, PropList[i]);
              end;
            tkFloat:
              begin
                if (PropList[i]^.PropType^.Name = 'TDateTime') then
                  Result := VarFromDateTime(GetFloatProp(APersistent, PropList[i]))
                else
                  Result := GetFloatProp(APersistent, PropList[i]);
              end;
            tkClass:
              begin
                if GetObjectProp(APersistent, PropList[i]) is TPersistent then
                begin
         // TCollection alows indexed acces
                  if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                  begin
                    Propname := copy(NextName, 1, pos('.', NextName) - 1);
                    NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                    if Uppercase(NextName) = 'COUNT' then
                    begin
                      Result := TCollection(GetObjectProp(APersistent, PropList[i])).Count;
                      exit; // found Count key word
                    end;
                // is it a property of collection ?
                    Result := null;
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                // if found then exit ;
                    if VarIsNull(Result) then
                    begin
                      Result := 0;
                    end
                    else
                      exit;
                // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(Propname, x, 1);
                    end;
               // check empty
                    if Propname <> '' then
                      Result := GetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)]);

                  end
                  else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                end;
              end;

          end; // case
           // end found so if found exit ;
          Exit;
        end;
      except
        Result := -1;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;


procedure SetPersistentProp(const AName: string; APersistent: TPersistent; Value: Variant);
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName, FloatValue: string;
  AFloat: Double;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) and (PropList[i]^.SetProc <> nil) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString,tkUString,
            tkWString, tkWChar,
            tkChar:
            begin
              SetStrProp(APersistent, PropList[i], VarToStr(Value));
            end;

          tkInteger,
            tkEnumeration:
            begin
              if (Uppercase(VarToStr(Value)) = 'TRUE') or (Uppercase(VarToStr(Value)) = 'FALSE') then
                 begin
                   if (Uppercase(VarToStr(Value)) = 'TRUE') then
                      SetOrdProp(APersistent, PropList[i], 1) else
                      SetOrdProp(APersistent, PropList[i], 0);
                 end else
                 begin
                 if VarToStr(Value) <> '' then
                    SetOrdProp(APersistent, PropList[i], StrToInt(VarToStr(Value)));
                 end;
            end;
          tkFloat:
            begin
              if (PropList[i]^.PropType^.Name = 'TDateTime') then
                SetFloatProp(APersistent, PropList[i], VarToDateTime(Value))
              else
              begin
                FloatValue := VarToStr(Value);
                if (FloatValue <> '') then
                begin

                  if Pos('IND', FloatValue) <> 0 then
                    AFloat := 0
                  else if Pos('INF', FloatValue) <> 0 then
                    AFloat := 0
                  else
                   AFloat := StrToFloat(FloatValue)  ;
                  SetFloatProp(APersistent, PropList[i], AFloat);
                end;
              end
            end;
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
              // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                  Propname := copy(NextName, 1, pos('.', NextName) - 1);
                  NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                  // if its a add function then add
                  if Uppercase(NextName) = 'ADD' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Add;
                    exit; // found ADD key word
                  end;
                  if Uppercase(NextName) = 'CLEAR' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Clear;
                    exit; // found ADD key word
                  end;
                  // Do the same for delete
                  if Uppercase(Propname) = 'DELETE' then
                  begin
                  // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (NextName[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(NextName, i, 1);
                    end;
                    if NextName <> '' then
                    begin
                      TCollection(GetObjectProp(APersistent, PropList[i])).Delete(StrToInt(NextName));
                      exit; // found delete key word
                    end;
                  end;
                  // probeer een set van de default propertys
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
                 // strip annyting not numeric
                  for x := Length(Propname) downto 1 do
                  begin
                    if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                      delete(Propname, i, 1);
                  end;
                // check empty
                  if Propname <> '' then
                    SetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)], Value);
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
              end;
            end;

        end; // case
           // end found so if found exit ;
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;

destructor TSaveClientDatasetCall.Destroy;

begin

  try
 If IsPublishedProp(aDataset,'SortedFields') then
     SetStrProp(aDataset,'SortedFields',IndexFieldName);
  aDataset.Filter := Filter;
  aDataset.Filtered := Filterd;
  
  aDataset.Active := Active ;

  if aDataset.Active then
  begin
 // make sure this is last as it mite raise exception.
// if ADataset.BookmarkValid(TBookmark(BookMark))  then
 if not aDataset.isempty then
      begin
  aDataset.Bookmark := BookMark ;
   case DataState of
     dsEdit : aDataset.Edit ;
     // it was postend a insert will make a new record.
     dsInsert : aDataset.Edit ;
    end;
  end;
  end;
  except
  end;
  if DisableControls then
       aDataset.EnableControls ;

  inherited;
end;

constructor TSaveClientDatasetCall.Create(AClientDataset: TDataset ; aDisableControls : Boolean);
begin
  DataState := AClientDataset.State ;
  Active := AClientDataset.Active ;
  aDataset := AClientDataset ;
  BookMark := AClientDataset.Bookmark;
  Filter := AClientDataset.Filter ;
  Filterd := AClientDataset.Filtered ;
 If IsPublishedProp(aDataset,'SortedFields') then
    IndexFieldName :=  GetStrProp(aDataset,'SortedFields');
    DisableControls :=  aDisableControls ;
  if DisableControls then
   AClientDataset.DisableControls ;
end;


procedure ExportTrailBalanceAsBath(Fromid,ToId : Integer ; Filename : String );
var
 AList : TStringList ;
begin
  dmDatabase.qGen.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('endyear_ExportTrailBalanceAsBatch');
  dmDatabase.qGen.ParamByName('WAccountId1').AsInteger := dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount ;
  dmDatabase.qGen.ParamByName('WAccountId2').AsInteger := dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount ;
  dmDatabase.qGen.ParamByName('WAccountId3').AsInteger := dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings ;
  dmDatabase.qGen.open ;
  try
    AList := TStringList.create ;
      try
         while not dmDatabase.qGen.Eof do
           begin
             AList.Add('bb'+ #9 + FormatDateTime('dd/mm/yyyy',date) + #9 + dmDatabase.qGen.Fields[2].AsString + #9 +AccType2Char(dmDatabase.qGen.Fields[4].AsInteger)  +  LrAddDashInAccountCode(dmDatabase.qGen.Fields[1].AsString)+#9+#9+#9  + StringReplace(dmDatabase.qGen.Fields[3].AsString,DecimalSeparator,'.',[rfReplaceAll]) +#9+'0') ;
             dmDatabase.qGen.next ;
           end;
         AList.SaveToFile(Filename);
      finally
         AList.free ;
      end;
  finally
   dmDatabase.qGen.close ;
  end;

end;

function  OpenSqlAndGetFirtsColumnValue(ASql : String) : Variant;
var
 AQuery : TuniQuery ;
begin
 result := 0 ;
 try
 AQuery := TuniQuery.Create(nil) ;
 try
 AQuery.Connection := dmDatabase.ZMainconnection ;
 AQuery.SQL.Text := ASql ;
 AQuery.open ;
 result :=  AQuery.Fields[0].Value ;
 AQuery.Close ;
 finally
  AQuery.free ;
 end;
 except
    result := 0 ;
 end;
end;

function  GetFieldLength(ATable,AField : String  ) : Integer ;
begin
 result := DMTCCoreLink.GetFieldLength(ATable,AField) ;
end;

function  CheckIfFieldExist(Afield,ATable : String ) : Boolean ;
var
 AQuery : TuniQuery ;
begin
 try
 AQuery := TuniQuery.Create(nil) ;
 try
 AQuery.Connection := dmDatabase.ZMainconnection ;
 AQuery.SQL.Text := 'select * from ' + ATable + ' where 1 = 0 ' ;
 AQuery.open ;
 result := AQuery.FindField(Afield) <> nil ;
 AQuery.Close ;
 finally
  AQuery.free ;
 end;
 except
    result := false ;
 end;
end;

procedure Addfield(ATable, AfieldText: String);
begin
 ExecSql('Alter table ' + ATable + ' ' + AfieldText);
end;

function TableHasData(ATable : String ): Boolean ;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
 AQuery.Connection := dmDatabase.ZMainconnection ;
 AQuery.SQL.Text := 'select count(*) from '+ QuotedStr(ATable);
 AQuery.Open ;
 Result := AQuery.Fields[0].AsInteger <> 0 ;
 AQuery.Close ;
 finally
  AQuery.free ;
 end;
end;

Function ExecSql(ASql:String):Integer;
var
 AQuery : TuniQuery ;
begin
 Result := 100;
 AQuery := TuniQuery.Create(nil) ;
 try
   Try
 AQuery.Connection := dmDatabase.ZMainconnection ;
 AQuery.SQL.Text := ASql ;
 AQuery.ExecSQL ;
 AQuery.Close ;
    Result := 0;
   except
   end;
 finally
  AQuery.free ;
 end;
end;


procedure ClearTable(ATable : String) ;
begin
   If TDataBaseRoutines.TableExist(ExtractFileName(ATable)) then
  // lets clean the table to
     begin
     ExecSql('delete from ' + ATable);
     end;
end;

procedure DropTable(ATable : String) ;
begin
   If TDataBaseRoutines.TableExist(ExtractFileName(ATable)) then
  // lets clean the table to
     begin
     ExecSql('delete from ' + ATable);
     ExecSql('drop table ' + ATable);
     end;
end;



Function FixAmt(Amt:Real):Real;
begin
  // Pieter 2005 07 29
  // we need to look at the diges used so the tax transactios are correct

  Result := FixAmount(Amt,dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty);
end;

Function  FixAmt(Amt:Real;Decpl:Integer):Real;
begin
  {Used For Data Storage and Posting Routines}
  Result := FixAmount (Amt,Decpl);

end;

Function FixAmount(Amount: Real;vDec:Integer):real;
begin
  {Used For Reporting}
 Result := roundamount(Amount,vDec);
end;

Function FixDocAmount(Amount:Real):real;
Var
  vDec : Integer;
begin
  dmDatabase.tblReportingOptions.Open;
  vDec:=2;
  if dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString<>'' then
    vDec:=StrToIntDef(dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString,2);
  Result := FixAmount(Amount,vDec);
end;

Function FixAmount(Amount:Real):real;
Var
  vDec : Integer;
begin
  vDec := dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty ;
  Result := FixAmount(Amount,vDec);
end;



Function CanPostToLastYear:Boolean;
begin
  if Not dmdatabase.tblSysVars.Active then
  begin
    dmdatabase.tblSysVars.Open;
    Result := dmDatabase.tblSysVarsBPostToLastYear.Value=1;
    dmdatabase.tblSysVars.Close;
  end
  else
    Result := dmDatabase.tblSysVarsBPostToLastYear.Value=1;
end;



Function  ComposeBatName(aUser,BatID:integer;Var CanCreate:Boolean;Repeating:Boolean):string;OverLoad;
begin
 if DMTCCoreLink.currentuser = -1 then DMTCCoreLink.currentuser := 0 ; 
  if Repeating then
    Result := 'batRbt' + IntToStr(CurrentUser) +'t'+IntToStr(BatID)
  else
    Result := 'bat' + IntToStr(CurrentUser) +'t'+IntToStr(BatID) ;
  CanCreate:= Not TDataBaseRoutines.TableExist(Result);
end;

procedure ClearAndCreateBatFiles(DoClearTable  : boolean ) ;
begin
   dmDatabase.tblUser.Open ;
   dmDatabase.tblUser.First ;
   dmDatabase.tblBatchTypes.open ;
   dmDatabase.tblBatchTypes.first ;
   while not dmDatabase.tblBatchTypes.eof do
     begin
        dmDatabase.tblUser.First ;
        while not  dmDatabase.tblUser.eof do
          begin
            if not TDataBaseRoutines.TableExist( 'bat' + dmDatabase.tblUserWUSERID.AsString  +'t'+ dmDatabase.tblBatchTypesWBATCHTYPEID.AsString ) then
               dmDatabase.CreateBatch('bat' + dmDatabase.tblUserWUSERID.AsString  +'t'+ dmDatabase.tblBatchTypesWBATCHTYPEID.AsString );
            if DoClearTable then
            ClearTable('bat' +  dmDatabase.tblUserWUSERID.AsString  +'t'+ dmDatabase.tblBatchTypesWBATCHTYPEID.AsString );

            dmDatabase.tblUser.next ;
          end;
        dmDatabase.tblBatchTypes.next ;
     end;

end;

function TcSendMapiMail(const Subject, Body, FileName,
                  SenderName, SenderEMail,
                  RecipientName, RecipientEMail: Ansistring;aHandle : HWND  = 0): Integer;
var
  Message: TMapiMessage;
  lpSender, lpRecipient: TMapiRecipDesc;
  FileAttach: TMapiFileDesc;

  SM: TFNMapiSendMail;
  MAPIModule: HModule;
begin
  FillChar(Message, SizeOf(Message), 0);
  with Message do
  begin
    if (Subject <> '') then
      lpszSubject := PAnsiChar(Subject);

    if (Body <> '') then
      lpszNoteText := PAnsiChar(Body);

    if (SenderEmail <> '') then
    begin
      lpSender.ulRecipClass := MAPI_ORIG;
      if (SenderName = '') then
        lpSender.lpszName := PAnsiChar(SenderEMail)
      else
        lpSender.lpszName := PAnsiChar(SenderName);
      lpSender.lpszAddress := PAnsiChar(SenderEmail);
      lpSender.ulReserved := 0;
      lpSender.ulEIDSize := 0;
      lpSender.lpEntryID := nil;
      lpOriginator := @lpSender;
    end;

    if (RecipientEmail <> '') then
    begin
      lpRecipient.ulRecipClass := MAPI_TO;
      if (RecipientName = '') then
        lpRecipient.lpszName := PAnsiChar(RecipientEMail)
      else
        lpRecipient.lpszName := PAnsiChar(RecipientName);
      lpRecipient.lpszAddress := PAnsiChar(RecipientEmail);
      lpRecipient.ulReserved := 0;
      lpRecipient.ulEIDSize := 0;
      lpRecipient.lpEntryID := nil;
      nRecipCount := 1;
      lpRecips := @lpRecipient;
    end
    else
      lpRecips := nil;

    if (FileName = '') then
    begin
      nFileCount := 0;
      lpFiles := nil;
    end
    else
    begin
      FillChar(FileAttach, SizeOf(FileAttach), 0);
      FileAttach.nPosition := Cardinal($FFFFFFFF);
      FileAttach.lpszPathName := PAnsiChar(FileName);

      nFileCount := 1;
      lpFiles := @FileAttach;
    end;
  end;

  MAPIModule := LoadLibrarya('MAPI32.DLL');
  if MAPIModule = 0 then
   begin
    Result := -1 ;
    ShowMessage('Mapi dll not found please use manual methode.' +#13+#10+FileName );
  end else
    try
      @SM := GetProcAddress(MAPIModule, 'MAPISendMail');
      if @SM <> nil then
      begin
        if aHandle = 0 then
          aHandle := Application.Handle ;
        Result := SM(0,aHandle , Message, MAPI_DIALOG or MAPI_LOGON_UI, 0);
      end
      else
        Result := 1;
    finally
      FreeLibrary(MAPIModule);
    end;

end;




Function FloatToStr2Dec(aValue:real):String;
begin
  Result := FloatToStrF(aValue,ffFixed,18, 2);
end;
Function  FloatToSQLStr(aValue:real):String;
begin
  Result := StringReplace(FormatFloat('#####0.######',aValue),DecimalSeparator,'.',[rfReplaceAll]);
end;

Function RoundAmount(Amount: Real):real;Overload;
begin
  Result:=RoundAmount(Amount,2);
end;

Function RoundAmount(Amount: Real;vDec:Integer):real;
begin
 // Roundamount this seems to fix the Rounding bug. i get on a number 0.005 im pointing all routimes to this one ;
  if vDec<3 then vDec:=100
  else vDec := StrToInt(FloatToStr(Power(10,vDec)));
  if Amount>=0 then            //0.500000001
   Result := Trunc(Amount*vDec+0.500000001)/vDec
  else
   Result := Trunc(Amount*vDec-0.500000001)/vDec;
end;


Function GetTotalsByPeriods(Var aAccRec:TAccountRec):Boolean;
Var
  Hold:Boolean;
  HoldA:Boolean;
  LySum:Real;
  i : Integer ;
begin
  for i := 0 to 26 do
   begin
      aAccRec.FBalances[i] := 0 ;
   end;
  Hold := dmDatabase.tblTotals.Active;
  HoldA := dmDatabase.tblAccount.Active;
  dmDatabase.tblTotals.Open;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblTotals.Filtered := False;
  dmDatabase.tblTotals.Filter:='WAccountID='''+ IntToStr(aAccRec.WAccountID)+
     ''' AND BActual=1';
  dmDatabase.tblTotals.Filtered:=True;
  Result:=False;
  LySum:=0;
  dmDatabase.tblAccount.Locate('WAccountID',aAccRec.WAccountID,[]);
  aAccRec.BIncExp := dmDatabase.tblAccountBIncomeExpense.Value=1;
  if dmDatabase.tblTotals.RecordCount>0 then
  begin
    Result:=True;
    dmDatabase.tblTotals.First;
    While not dmDatabase.tblTotals.Eof do
    begin
      if dmDatabase.tblTotalsWPeriodID.Value in [1..13] then
        LySum := LySum + dmDatabase.tblTotalsFAmount.Value;
      aAccRec.FBalances[dmDatabase.tblTotalsWPeriodID.Value]:= FixAmt(dmDatabase.tblTotalsFAmount.Value,2);
      dmDatabase.tblTotals.Next;
    end;
    if dmDatabase.tblAccountBIncomeExpense.Asinteger = 0  then
      aAccRec.FBalances[0] := aAccRec.FBalances[0] - LySum ;
  end;
  dmDatabase.tblTotals.Filtered := False;
  dmDatabase.tblTotals.Filter:='';
  dmDatabase.tblTotals.Active:=Hold;
  dmDatabase.tblAccount.Active := HoldA;
end;


Function  GetBankBatch(AContraAccID:integer;BPymt:Boolean ):integer;
Var
  Hold:Boolean;
begin
  Hold:=dmDatabase.tblBank.Active;
  dmDatabase.tblBank.Open;
  Result := -1;
  if dmDatabase.tblBank.Locate('WAccountID',AContraAccID,[]) then
  begin
   if dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState then
    begin
    if BPymt then
      Result := dmDatabase.tblBankWPaymentsID.Value
    else
      Result := dmDatabase.tblBankWReceiptsID.Value;
     end else
     begin
         Result := dmDatabase.tblBankWPaymentsID.Value ;
     end;
  end;
  dmDatabase.tblBank.Active:=Hold;
end;

Function LocateAccount(Var FAccount:TAccountRec):Boolean;
Var
  Hold:Boolean;
begin
  Hold:= dmDatabase.tblAccount.Active;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered:=False;
  Result:=False;
  if dmDatabase.tblAccount.Locate('WAccountID',FAccount.WAccountID,[]) then
  begin
    FAccount.SACCOUNTCODE := dmDatabase.tblAccountSACCOUNTCODE.Value;
    FAccount.SDescription := dmDatabase.tblAccountSDescription.Value;
    FAccount.WAccountTypeID := dmDatabase.tblAccountWAccountTypeID.Value;
    Result:=True;
  end;
  dmDatabase.tblAccount.Active:=Hold;
end;

Procedure GetDatesLimits;
begin

  dmdatabase.tblPeriods.IndexFieldNames := 'WPERIODID' ;
  dmdatabase.tblPeriods.Open;
  dmdatabase.tblPeriods.First;

  TmpDatesLimits[0]:= dmdatabase.tblPeriodsDStartDate.Value;
  dmdatabase.tblPeriods.Last;
  TmpDatesLimits[1] := dmdatabase.tblPeriodsDEndDate.Value;
  dmdatabase.tblPeriods.Close;
end;


Function IntGetBatchRec(Var aBatch:TBatchCon):boolean;
Var
  Hold:Boolean;
begin
  Hold:=dmdatabase.tblBatchControl.Active;
  dmdatabase.tblBatchControl.Open;
  result :=  dmdatabase.tblBatchControl.Locate('WBatchID',aBatch.WBatchID,[]);
  if result then GetBatchConRec(aBatch,True);
  dmdatabase.tblBatchControl.Active:=Hold;
end;

Function GetCashBookType(aBankID,aBatTypeID:Integer):Byte;
Var
  Hold:Boolean;
begin
  Result:=0;
  Hold := dmDatabase.tblBank.Active;
  dmDatabase.tblBank.open;
  if dmDatabase.tblBank.Locate('WAccountID',aBankID,[]) then
  begin
    if dmDatabase.tblBankWPaymentsID.Value = aBatTypeID then
       Result:=1;
    if dmDatabase.tblBankWReceiptsID.Value = aBatTypeID then
       Result:=2;
  end;
  dmDatabase.tblBank.Active:=Hold;
end;

procedure GetBatchConRec(Var aBatch:TBatchCon;JustRead:Boolean;DS:TDataSet=Nil);
begin
   if JustRead then
   begin
     if Ds=nil then ds := dmdatabase.tblBatchControl;
     aBatch.WBatchID     := ds.FieldByName('WBatchID').AsInteger;
     aBatch.WBatchTypeID := ds.FieldByName('WBatchTypeID').AsInteger;
     aBatch.SAlias := ds.FieldByName('SAlias').AsString;
     aBatch.SName := GetBatchTypeName(aBatch.WBatchTypeID);
     aBatch.BPosted := ds.FieldByName('BPosted').Asinteger = 1;
     aBatch.WDocID := ds.FieldByName('WDocID').AsInteger;
     aBatch.BDocSource := ds.FieldByName('BDocSource').Asinteger = 1;
     aBatch.BImported := ds.FieldByName('BImported').Asinteger = 1;
     aBatch.DSysDate := ds.FieldByName('DSysDate').AsDateTime;
     aBatch.SFilename := ds.FieldByName('SFilename').AsString;
     aBatch.SUniqueID := ds.FieldByName('SUniqueID').AsString;
     aBatch.SBatchNumber := ds.FieldByName('SBatchNumber').AsString;
     aBatch.WLineCount := ds.FieldByName('WLineCount').AsInteger;
     aBatch.WInitBatID := ds.FieldByName('WInitBatID').AsInteger;
     aBatch.WUserID := ds.FieldByName('WUserID').AsInteger;
   end
   else
     IntGetBatchRec(aBatch);
end;


Function GetActiveBatTypeName:String;
Var
 tmpID:Integer;
begin
  Result :='';
  if Not dmDatabase.tblBatch.Active then exit;
  Result:=dmDatabase.tblBatch.TableName;
  Result := GetBatchTypeName(BatchNameToTypeID(Result,tmpID));
end;


function  BatchTypeIdFromBatchConId(WBatConId : integer ) : integer  ;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
  try
     AQuery.Connection := dmDatabase.ZMainconnection ;
     AQuery.sql.text := 'select WBatchTypeID from BATCON where WBatchId = ' + IntToStr(WBatConId) ;
     AQuery.open ;
     result := AQuery.Fields[0].AsInteger ;
  finally
    AQuery.free ;
  end;

end;
Function GetBatchTypeName(aBatchTypeID:Integer):String;
Var
  Hold:Boolean;
begin
  Result:='';
  Hold:=dmdatabase.tblBatchTypes.Active;
  dmDatabase.tblBatchTypes.Open;
  if dmDatabase.tblBatchTypes.Locate('WBatchTypeID', aBatchTypeID, []) then
    Result := dmDatabase.tblBatchTypesSDescription.Value;
  dmdatabase.tblBatchTypes.Active := Hold;
end;

Function GetBatchTypeID(aBatchName:String):Integer;
Var
  Hold:Boolean;
begin
  Result:=0;
  Hold:=dmdatabase.tblBatchTypes.Active;
  dmDatabase.tblBatchTypes.Open;
  if   dmDatabase.tblBatchTypes.Locate('SDescription', aBatchName, [LoCaseInsensitive]) then
    Result := dmDatabase.tblBatchTypesWBatchTypeID.Value;
  dmDatabase.tblBatchTypes.Close;
  dmdatabase.tblBatchTypes.Active := Hold;
end;

Function BatchNameToTypeID(aBatName:String;Var aUserID:integer):Integer;
Var
  Res:String;
  iPos:Integer;
begin
  // todo : BDEFIX Suspicius code
  Result :=-1;
  if Trim(aBatName)='' then exit;
  Res := ExtractFileName(aBatName);
  Res := ChangeFileExt(Res,'');
  if Not SameText(Copy(Res,1,3),'bat') then exit;
  System.Delete(Res,1,3);
  iPos := AnsiPos('t',res);
  if iPos=0 then
    iPos := Pos('T',res);
  if iPos=0 then exit;
  aUserID := StrToIntDef(Copy(Res,1,iPos-1),0);
  System.Delete(Res,1,iPos);
  Result := StrToIntDef(Res,0);
end;


Function  ReadNwReportOp(vfield:String;BValue:Boolean):TField;Overload;
Begin
  dmdatabase.tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + UpperCase(QuotedStr(vfield)) ;
  dmdatabase.tblOpReport.open ;
  if dmdatabase.tblOpReport.IsEmpty then
  begin
    dmdatabase.tblOpReport.Append;
    dmdatabase.tblOpReportStrOption.AsString:=vField;
    dmdatabase.tblOpReportSOptionValue.AsString:= Bool2Str(BValue);
    dmdatabase.tblOpReportWOptionTypeID.AsString:='0';
    dmdatabase.tblOpReport.Post;
  end;
  result:=dmdatabase.tblOpReportSOptionValue;
end;

Function  ReadNwReportOp(vfield:String;DValue:TDate):TField;Overload;
Begin
  dmdatabase.tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + UpperCase(QuotedStr(vfield)) ;
  dmdatabase.tblOpReport.open ;
 if dmdatabase.tblOpReport.IsEmpty then
  begin
    dmdatabase.tblOpReport.Append;
    dmdatabase.tblOpReportStrOption.AsString:=vField;
    dmdatabase.tblOpReportSOptionValue.AsDateTime:= DValue;
    dmdatabase.tblOpReportWOptionTypeID.AsString:='0';
    dmdatabase.tblOpReport.Post;
  end;
     if StrToDateDef(dmdatabase.tblOpReportSOptionValue.AsString,DValue) = DValue then
       begin
         dmdatabase.tblOpReport.Edit;
         dmdatabase.tblOpReportSOptionValue.AsDateTime:= DValue;
         dmdatabase.tblOpReport.post ;
       end;

  result:=dmdatabase.tblOpReportSOptionValue;

end;


Function  ReadNwReportOp(vfield:String;Value:Integer):TField;
begin
  Result:= ReadNwReportOp(vfield);
  if result.AsString='' then
    WriteNwReportOp(vfield,IntToStr(Value));
end;

Procedure WriteNwReportOp(vfield,Value:String);
begin
try
  dmdatabase.tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + UpperCase(QuotedStr(vfield)) ;
  dmdatabase.tblOpReport.open ;
  if dmdatabase.tblOpReport.IsEmpty then
    CreatNwReportOp(vfield);
  dmdatabase.tblOpReport.Edit;
  dmdatabase.tblOpReport.FieldByName('SOptionValue').AsString := Value;
  dmdatabase.tblOpReport.Post;
except

end;
end;

Procedure CreatNwReportOp(vfield:String);
begin
 try
  dmdatabase.tblOpReport.Append;
  dmdatabase.tblOpReportStrOption.AsString:=vField;
  dmdatabase.tblOpReportSOptionValue.AsString:='';
  dmdatabase.tblOpReportWOptionTypeID.AsString:='0';
  dmdatabase.tblOpReport.Post;
   except
  on  e : Exception do
      begin
         DMTCCoreLink.ExecSql('SET GENERATOR GEN_OPREP_ID TO ' + IntToStr(1 +StrTOIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WOPTIONID) from opreport')) ,1)));
         dmdatabase.tblOpReport.FieldByName('WOPTIONID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_OPREP_ID');
         dmdatabase.tblOpReport.Post;
       end ;

    end;


End;



Function  ReadNwReportOp(vfield:String;SValue:String):TField;
begin
  Result:= ReadNwReportOp(vfield);
  if result.AsString='' then
    WriteNwReportOp(vfield,sValue);
end;

Function ReadNwReportOp(vfield:String):TField;
begin
  dmdatabase.tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + UpperCase(QuotedStr(vfield)) ;
  dmdatabase.tblOpReport.open ;
  if dmdatabase.tblOpReport.IsEmpty then
    CreatNwReportOp(vfield);
  result:= dmdatabase.tblOpReport.FieldByName('SoptionValue');
end;

function  ReadLongReportOp(vfield:String) : String ;
var
 i : Integer ;
 Temp : String ;
begin
  Result:= '' ;
  i := 0 ;
  Temp :=  ReadNwReportOp(vfield+IntToStr(i)).AsString ;
  while  Temp <> '' do
   begin
      Result := Result + Temp ;
      inc(i);
      Temp := ReadNwReportOp(vfield+IntToStr(i)).AsString ;
   end;
end;

Procedure WriteLongReportOp(vfield,Value:String);
var
 i : Integer ;
 Temp : String ;
begin
  i := 0 ;
  Temp := ReadNwReportOp(vfield+IntToStr(i)).AsString ;
  while  Temp <> '' do
   begin
      WriteNwReportOp(vfield+IntToStr(i),'');
      inc(i);
      Temp := ReadNwReportOp(vfield+IntToStr(i)).AsString ;
   end;

 i := 0 ;
 Temp := copy(Value,1,35);
 If copy(temp,35,1) = ' ' then
    Insert(' ',Value,36);
 Delete(Value,1,35);
  while  Temp <> '' do
   begin
      WriteNwReportOp(vfield+IntToStr(i),Temp);
      Temp := copy(Value,1,35);
       If copy(temp,35,1) = ' ' then
          Insert(' ',Value,36);
      Delete(Value,1,35);
      inc(i);
   end;
end;


Function IfSwapVars(Var vloInt,vHiInt:Integer):Boolean;
// This function makes vloInt to be < then vHiInt
// Added by Sylvain
Var
  tmp:Integer;
begin
  Result:=False;
  try
    if vloInt>vHiInt then begin
      tmp:=vloInt;
      vloInt:=vHiInt;
      vHiInt:=tmp;
      result:=True;
    end;
  Except end;
end;

Procedure GetRprtSizes(arprtType:integer;Var aLeft,aRight,aBott,aTop,aWidth,aLen:real;Var BCust:Boolean);

begin
  Case arprtType of
  1:begin
                 // done : Pieter Write with '.' like DFM but read translate to decimalseperatr
      //StrToFloat(StringReplace(ReadNwReportOp('WStmPageMrgLeft','6.0').AsString,'.',DecimalSeparator,[rfReplaceAll]));
      aLeft :=   StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgLeft','6.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),6);
      aTop :=  StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgTop','2.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),2);
      aRight :=  StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgRight','10.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),10);
      aBott :=  StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgBottom','13.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),13);
      aWidth :=  StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgWidth','195.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),195);
      aLen :=  StrToFloatDef(StringReplace(ReadNwReportOp('WStmPageMrgLength','218.55').AsString,'.',DecimalSeparator,[rfReplaceAll]),218.55);
      BCust :=  ReadNwReportOp('BStmPageCust',False).AsBoolean;
    end;
  2:begin
      aLeft :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgLeft','10.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),10);
      aTop :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgTop','10.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),10);
      aRight :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgRight','10.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),10);
      aBott :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgBottom','10.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),10);
      aWidth :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgWidth','195.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),195);
      aLen :=  StrToFloatDef(StringReplace(ReadNwReportOp('WOthPageMrgLength','218.55').AsString,'.',DecimalSeparator,[rfReplaceAll]),218.55);
      BCust :=  ReadNwReportOp('BOthPageCust',False).AsBoolean;
    end;
  else
    aLeft :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgLeft','0.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),0);
    aTop :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgTop','2.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),2);
    aRight :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgRight','5.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),5);
    aBott :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgBottom','7.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),7);
    aWidth :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgWidth','195.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),195);
    aLen :=  StrToFloatDef(StringReplace(ReadNwReportOp('WDocPageMrgLength','216.0').AsString,'.',DecimalSeparator,[rfReplaceAll]),216);
    BCust :=  ReadNwReportOp('BDocPageCust',False).AsBoolean;
  end;
  DocDraft := ReadNwReportOp('WDocQuality',1).AsInteger=0;
end;

Function  ExtractXmlTag(XmlStr,aTagName:String):String;
begin
  Result:=' You will get your Table Here, Thanks';
end;


Function  IsProperlyClosed:Integer;
Var
  Bonline:Boolean;
  AList  : TStringList ;
  i : Integer ;
Begin
  Result:=10;
  Bonline := False;

  if not dmDatabase.ZMainconnection.Connected then
    exit ;
  try
  With  dmDatabase do
  begin
        Result:= 0 ;
        tblSysvars.Open;
        if tblSysvarsBNotClosed.Asinteger = 1 then
        begin
          Bonline:=False;
          tblUser.Open;
          tblUser.DisableControls;
          tblUser.First;
          While (not tblUser.Eof) AND (Not Bonline) do
          begin
            if tblUserWUserID.Value<>CurrentUser then
              Bonline:= tblUser.FieldByName('BOnline').Asinteger <> 0;
            tblUser.Next;
          end;
          if TblUser.Locate('WUserID',CurrentUser,[]) then
          begin
             TblUser.edit ;
             tblUser.FieldByName('BOnline').Asinteger := 0 ;
             TblUser.post;
          end;
          tblUser.Close;
          tblUser.EnableControls;
        end;
       tblSysvars.Open;
       tblSysvars.Edit;
       tblSysvarsBNotClosed.Value := ord(Bonline);
       tblSysvars.Post;
       tblSysvars.Close;
   end;
      DMTCCoreLink.CloseUserConnection ;
   except
      // no handling for now.
   end;   
end;





function GetTaxRate100(TaxID:Integer):Integer;
Var
  T:Real;
begin
  Result := 0;
  t := GetTaxRateOnID(TaxID,true);
  if t=0 then exit;
  t := (t-1)*10000;
  Result := Trunc(T);
end;

function  GetTaxRateOnID(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;

begin
  Result:= TDataBaseRoutines.GetTaxRateOnId(TaxAccId,UseLinkRate) ;
end;

function GetTaxRate(TaxAcc:String;UseLinkRate : Boolean = true):Double;
var
  TMain,TSub:string;
begin
  Result:= 1 ;
  If Trim(TaxAcc) ='' then exit ;
  TMain:=lrGetMainAccountCode(TaxAcc);
  TSub:=lrGetSubAccountCode(TaxAcc);
  Result:= GetTaxRateOnID(TDataBaseRoutines.GetAccountIDFromCode('T'+TMain+TSub),UseLinkRate) ;
end;

function  StripMinFromLongAccountCode(AString : String ) : String ;
begin
   Result := AString ;
   Delete(Result,MainAccountLength+2,1);
end;

procedure LoadTextBatch(Filename : String;DefaultContraID:Integer);
var
  Contra,
  Temp   : String;
  ComTemp,ImportList : TStringList;
  CrTmp,DtTmp:boolean;
  Dt:Tdate;
  vTax :Real;
  AccountId,i : Integer ;
  Aprogress : TfmNewProgress ;
begin
  // import as tab delimited
  ComTemp := TStringList.Create;
   try
  DTtmp:=dmDatabase.tblBatchFDEBIT.ReadOnly;
  CrTmp:=dmDatabase.tblBatchFCREDIT.Readonly;
  dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
  dmDatabase.tblBatchFCREDIT.Readonly:=False;

  dmDatabase.tblBatch.DisableControls;
  if DefaultContraID <> 0 then
    Contra := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(DefaultContraID)  ;
 // dmDatabase.tblBatch.First;
 // Contra:=dmDatabase.tblBatchSCONTRAACCOUNT.Value;
  dmDatabase.tblBatch.Last;
  //dmDatabase.tblAccount.open;
  //dmDatabase.tblAccount.Filtered:=False;
  Aprogress := TfmNewProgress.Create(nil) ;
  ImportList := TStringList.Create;
  Try
  ImportList.LoadFromFile(FileName);
  Aprogress.initProgress('Loading...',ImportList.Count);
   for i := 0 to ImportList.Count -1 do
    begin
        Aprogress.SetProgress('',i+1);
       Temp := StringReplace(ImportList[i],#9,#13,[rfReplaceAll]) ;
       ComTemp.Text := Temp;
      //
      // ComTemp.Text := StringReplace(Temp,',',#13,[rfReplaceAll]) ;
      dmDatabase.tblBatch.Append;
      dmDatabase.tblBatchSReference.Value := ComTemp.Strings[0];
      // Sylvain: We Forcing the Date to be dd/mm/yyyy the separator is from the system
      Dt:=Str2Date(Trim(ComTemp.Strings[1]));
      dmDatabase.tblBatchDDate.Value :=Dt ;
      dmDatabase.tblBatchDAllocatedDate.Value := Dt;
      dmDatabase.tblBatchSDescription.Value := ComTemp.Strings[2];
      AccountId := TDataBaseRoutines.GetAccountIDFromCode( StripMinFromLongAccountCode(ComTemp.Strings[3]));
      dmDatabase.tblBatchWAccountID.Value := AccountId;
      dmDatabase.tblBatchSACCOUNT.Value := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(AccountId);

        if (DefaultContraID<>0) And (Trim(ComTemp.Strings[4])='') then
          begin
          dmDatabase.tblBatchSCONTRAACCOUNT.Value:=Contra  ;
          dmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger := DefaultContraID ;
          end
        else
          begin
          AccountId := TDataBaseRoutines.GetAccountIDFromCode( StripMinFromLongAccountCode(ComTemp.Strings[4]));
          dmDatabase.tblBatchSCONTRAACCOUNT.Value := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(AccountId);
          dmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger := AccountId ;
          end;
        if (Trim(ComTemp.Strings[5])<>'') then
           begin
             AccountId := TDataBaseRoutines.GetAccountIDFromCode(StripMinFromLongAccountCode(ComTemp.Strings[5]));
             dmDatabase.tblBatchSTAX.Value := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(AccountId);
             dmDatabase.tblBatchWTAXID.AsInteger := AccountId ;
           end;
      // done : Pieter import and convert to decimal seperator.
      dmDatabase.tblBatchFAmount.AsString:= StringReplace(ComTemp.Strings[6],'.',DecimalSeparator,[rfReplaceAll]);;
      dmDatabase.tblBatchFDEBIT.AsString := '';
      dmDatabase.tblBatchFCREDIT.AsString := '';
      // done : Pieter Add in and exclusive
      dmDatabase.tblBatchBExclusive.Value := 1;
      if ComTemp.Count >= 8 then
      dmDatabase.tblBatchBExclusive.Asinteger := ord(UpperCase(ComTemp.Strings[7]) = 'TRUE') ;

      // Cal Tax
      if dmDatabase.tblBatchBExclusive.Asinteger = 1 then
      begin
      vTax:=GetTaxRateOnId(dmDatabase.tblBatchWTAXID.AsInteger,true);
      dmDatabase.tblBatchFTaxAmount.Value:=dmDatabase.tblBatchFAmount.Value * (vTax-1);
      if StrToFloatDef(StringReplace(ComTemp.Strings[6],'.',DecimalSeparator,[rfReplaceAll]),0)<0 then
         dmDatabase.tblBatchFCREDIT.Value := -(dmDatabase.tblBatchFAmount.Value*vTax)    else
         dmDatabase.tblBatchFDEBIT.Value :=dmDatabase.tblBatchFAmount.Value*vTax;
      end else
      begin
      vTax:=GetTaxRateOnId(dmDatabase.tblBatchWTAXID.AsInteger,true);
      dmDatabase.tblBatchFTaxAmount.Value:=dmDatabase.tblBatchFAmount.Value - (dmDatabase.tblBatchFAmount.Value / vTax)  ;
      if StrToFloatDef(StringReplace(ComTemp.Strings[6],'.',DecimalSeparator,[rfReplaceAll]),0)<0 then
         dmDatabase.tblBatchFCREDIT.Value := -(dmDatabase.tblBatchFAmount.Value)    else
         dmDatabase.tblBatchFDEBIT.Value :=dmDatabase.tblBatchFAmount.Value;
      end;
      dmDatabase.tblBatchBReconciled.Value := 0;

      dmDatabase.tblBatch.Post;
    end;
  finally
    ImportList.free ;
    Aprogress.free ;
    dmDatabase.tblBatch.EnableControls;
    dmDatabase.tblBatchFDEBIT.ReadOnly:=DTtmp;
    dmDatabase.tblBatchFCREDIT.Readonly:=CrTmp;

  end;
  finally
    ComTemp.free ;
  end;
  dmDatabase.tblBatchFDEBIT.ReadOnly:=DTtmp;
  dmDatabase.tblBatchFCREDIT.Readonly:=CrTmp;
  dmDatabase.tblAccount.Close;
end;

procedure WriteTextBatchFromDataset(ADataset : TDataset ; AFilename : String ) ;
var
  A , B  :Char;
  Batch : TextFile;

  function DateAsString(ADate : TDateTime): String;
  var
  Year,Month,Day : Word ;
  begin
    DecodeDate(ADate,Year,Month,Day);
    result := FormatFloat('00',Day) +'/'+ FormatFloat('00',Month) +'/'+ FormatFloat('0000',Year)
  end;
begin
  AssignFile(Batch, AFilename);
  ReWrite(Batch);
  with dmDatabase do
  begin
    ADataset.Open;
    tblAccount.Open;
    tblAccount.Filtered:=False;
    ADataset.First;
    while not ADataset.EOF do
    begin
      // all text exports as tab delimited
      A := AccType2Char(GetAccountType(tblBatchWAccountID.AsInteger)) ;
      B := AccType2Char(GetAccountType(tblBatchWCONTRAACCOUNTID.AsInteger)) ;
      WriteLn(Batch,   ADataset.FieldByName('SReference').asstring
                  // done : Pieter always export date as dd/mm/yyyy the separator is from the system
                 + #9 + DateAsString(ADataset.FieldByName('DDate').AsDateTime)
                 + #9 + ADataset.FieldByName('SDescription').asstring
                 + #9 + A+ADataset.FieldByName('SACCOUNT').asstring
                 + #9 + B+ADataset.FieldByName('SCONTRAACCOUNT').asstring
                 + #9 + 'T'+ADataset.FieldByName('STAX').asstring
                 // done : pieter export in default . so no decimal seperator wil affect the exp and import

                 + #9 + StringReplace(FloatToStr(StrToFloatDef(ADataset.FieldByName('FAmount').asstring,0)),DecimalSeparator,'.',[rfReplaceAll])
                 // done added in or exlusive mode
                 
                 + #9 + boolToStr(ADataset.FieldByName('BExclusive').Asinteger = 1,true) );

      ADataset.Next;
    end;
    ADataset.Close;
    tblAccount.Open;
  end;
  CloseFile(Batch);
end;

procedure WriteTextBatch(Filename : String);
var
  A , B  :Char;
  Batch : TextFile;
  function DateAsString(ADate : TDateTime): String;
  var
  Year,Month,Day : Word ;
  begin
    DecodeDate(ADate,Year,Month,Day);
    result := FormatFloat('00',Day) +'/'+ FormatFloat('00',Month) +'/'+ FormatFloat('0000',Year)
  end;
begin
  AssignFile(Batch, FileName);
  ReWrite(Batch);
  with dmDatabase do
  begin
    tblBatch.Open;
    tblAccount.Open;
    tblAccount.Filtered:=False;
    tblBatch.First;
    while not dmDatabase.tblBatch.EOF do
    begin
      // all exports as tab delimited
      A:=AccType2Char(GetAccountType(tblBatchWAccountID.AsInteger)) ;
      B := AccType2Char(GetAccountType(tblBatchWCONTRAACCOUNTID.AsInteger)) ;

      WriteLn(Batch,  tblBatchSReference.Value
                  // done : Pieter always export date as dd/mm/yyyy the separator is from the system
                 + #9 + DateAsString(tblBatchDDate.AsDateTime)
                 + #9 + tblBatchSDescription.Value
                 + #9 + A+tblBatchSACCOUNT.Value
                 + #9 + B+tblBatchSCONTRAACCOUNT.Value
                 + #9 + 'T'+tblBatchSTAX.Value
                 // done : pieter export in default . so no decimal seperator wil affect the exp and import

                 + #9 + StringReplace(FloatToStr(StrToFloatDef(tblBatchFAmount.AsString,0)),DecimalSeparator,'.',[rfReplaceAll])
                 // done added in or exlusive mode

                 + #9 + BoolToStr(tblBatchBExclusive.Asinteger = 1,true) );

      tblBatch.Next;
    end;
    tblBatch.Close;
    tblAccount.Open;
  end;
  CloseFile(Batch);
end;

Function MakeBatUID:String;
begin
  Result := Copy(FormatDateTime('zzzhnsdd',Now),1,8);
end;

Procedure GetBatchList (AList : TStrings);
begin
  dmDatabase.ZQGenBatches.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('BatCon_GetActiveList') + '  and BatCon.WUserId =' + IntToStr(CurrentUser);
  dmDatabase.ZQGenBatches.Open ;
  While not dmDatabase.ZQGenBatches.Eof do

     begin

        if TDataBaseRoutines.tableExist(dmDatabase.ZQGenBatches.fieldByname('SFileName').asstring) then
         if AList.IndexOf(dmDatabase.ZQGenBatches.fieldByname('SFileName').asstring)  = -1 then
            AList.AddObject(dmDatabase.ZQGenBatches.fieldByname('SFileName').asstring,TObject(dmDatabase.ZQGenBatches.FieldByName('WBatchTypeId').AsInteger));
        dmDatabase.ZQGenBatches.next ;
     end;
end;

Function BatchPointer(aBatchType:String;aDocID:Integer;Var BatID:integer;Repeating:Boolean):String;
Var
  bCreate : Boolean ;
  ASaveList : TSaveClientDatasetCallList ;
begin
  Result:='';

  ASaveList := TSaveClientDatasetCallList.Create ;
  try
  ASaveList.AddclientObject(dmDatabase.tblBatchTypes,true);
  ASaveList.AddclientObject(dmDatabase.tblUser,true);
  dmDatabase.tblBatchTypes.Open;
  dmDatabase.tblBatch.close;
  if dmDatabase.tblBatchTypes.Locate('SDescription',aBatchType,[Locaseinsensitive]) then
  begin
    {Select and set Batch file name }
    {Dot7 Bug  in  ComposeBatName for repeating Batch fixed 18/03/2003}
    dmDatabase.tblBatch.TableName:=ComposeBatName(CurrentUser,dmDatabase.tblBatchTypesWBatchTypeID.value,bCreate,Repeating);
    tcvariables.DefaultContraAccount := dmDatabase.tblBatchTypesWCONTRAACCOUNTID.AsInteger ;
   {Check if we have to create the file}
    if bCreate then
      begin
        dmDatabase.CreateBatch(dmDatabase.tblBatch.TableName);
      end;
    if Repeating then
    begin
       BatID:=0;
    end
    else
    begin

     dmDatabase.ZQBatControl.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnUSerTypePosted');
     //Update the Batch control info
     dmDatabase.ZQBatControl.ParamByName('WUserID').AsInteger := CurrentUser ;
     dmDatabase.ZQBatControl.ParamByName('WBatchTypeID').AsInteger :=  dmDatabase.tblBatchTypesWBatchTypeID.AsInteger;
     dmDatabase.ZQBatControl.open ;


      if not dmDatabase.ZQBatControl.IsEmpty then
      begin
        if  (dmDatabase.ZQBatControlWDocID.AsString='') then
        begin
          dmDatabase.ZQBatControl.edit;
          dmDatabase.ZQBatControlBDocSource.Value := 0;
          dmDatabase.ZQBatControlWDocID.value := 0;
          if ReadReportOp(dmDatabase.ZQBatControlWBatchTypeID.AsString + 'cbAutoAlias',false).AsBoolean then
           dmDatabase.ZQBatControlSAlias.Value := formatDateTime('yyyymmdd',date)
          else
          dmDatabase.ZQBatControlSAlias.Value := aBatchType;
          dmDatabase.ZQBatControlWLineCount.Value := 0;
          dmDatabase.ZQBatControlDSysDate.Value:=Now;
          dmDatabase.ZQBatControl.Post;
        end;
      end;

     dmDatabase.ZQBatControl.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnUSerTypePostedDoc');
     //Update the Batch control info
     dmDatabase.ZQBatControl.ParamByName('WUserID').AsInteger := CurrentUser ;
     dmDatabase.ZQBatControl.ParamByName('WBatchTypeID').AsInteger :=  dmDatabase.tblBatchTypesWBatchTypeID.AsInteger;
     dmDatabase.ZQBatControl.ParamByName('WDocID').AsInteger := aDocID ;
     dmDatabase.ZQBatControl.open  ;



      if dmDatabase.ZQBatControl.IsEmpty then
      begin
       {Create the entry in Bat ctrl}
        with dmDatabase do
        begin
 
          tblSysVars.Open;
           dmDatabase.ZQBatControl.Append;
           dmDatabase.ZQBatControlWUserID.Value := CurrentUser;
           dmDatabase.ZQBatControlWBatchTypeID.Value := dmDatabase.tblBatchTypesWBatchTypeID.Value;

          if aDocID>0 then
             dmDatabase.ZQBatControlBDocSource.Value:=1
          else
             dmDatabase.ZQBatControlBDocSource.Value:=0;

           dmDatabase.ZQBatControlWDocID.value := aDocID;
          if ReadReportOp( dmDatabase.ZQBatControlWBatchTypeID.AsString + 'cbAutoAlias',false).AsBoolean then
            dmDatabase.ZQBatControlSAlias.Value := formatDateTime('yyyymmdd',date)
          else
           dmDatabase.ZQBatControlSAlias.Value:= aBatchType;
           dmDatabase.ZQBatControlWLineCount.Value := 0;
           dmDatabase.ZQBatControlDSysDate.Value:=Now;
           dmDatabase.ZQBatControlSUniqueID.AsString := MakeBatUID;

          tblUser.Open;
          if ReadNwReportOp('BUseGeneralNumber','false').Asboolean then
             dmDatabase.tblUser.Locate('WUserID',StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0))), [])
           else
          dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);

          tblUser.Edit;
          dmDatabase.ZQBatControlSBatchNumber.Value := dmDatabase.tblUserSNextBatchNumber.Value;

         tblUsersNextBatchNumber.Value := _IncrementString(dmDatabase.tblUsersNextBatchNumber.Value);
         tblUser.Post;
         //tblUser.Close;
          dmDatabase.ZQBatControlBPosted.Value := 0;
          dmDatabase.ZQBatControlBImported.Value := 0;
          dmDatabase.ZQBatControlSFileName.Value:=tblBatch.TableName;
          dmDatabase.ZQBatControl.Post;
        end; {With Dmdatabase}
      end;
      BatID :=  dmDatabase.ZQBatControlWBatchID.value;
    end; {If Repeating}
    Result := dmDatabase.tblBatch.TableName;//dmDatabase.tblBatchControlSFileName.Value;
    dmDatabase.BatchType := dmDatabase.tblBatchTypesWBatchTypeID.Value;
    IsCashBook :=GetCashBookType(dmDatabase.tblBatchTypesWContraAccountID.Value,dmDatabase.tblBatchTypesWBatchTypeID.Value);
    if IsCashBook in [1,2]  then
      IsContraPerLine:=False
    else
      IsContraPerLine:= dmDatabase.tblBatchTypesBContraPerLine.Value = 1;
    dmDatabase.NmBatchType := dmDatabase.tblBatchTypesSDescription.Value;
    end;

   finally
     ASaveList.free ;
   end;
end;

Function GetGroupDisplayName (AGroupType : TReportGroupTypes ) : String ;

begin
  case  AGroupType of
  rgtDebtor1 : result :=TDataBaseRoutines.GetTypeDescription(22);
  rgtDebtor2 : result :=TDataBaseRoutines.GetTypeDescription(23);
  rgtCreditor1 : result := TDataBaseRoutines.GetTypeDescription(24);
  rgtCreditor2 : result := TDataBaseRoutines.GetTypeDescription(25);
  rgtGeneralLeder1 : result := TDataBaseRoutines.GetTypeDescription(20);
  rgtGeneralLeder2 : result := TDataBaseRoutines.GetTypeDescription(21);
  rgtStock1 : result :=  TDataBaseRoutines.GetTypeDescription(26);
  rgtStock2 : result :=  TDataBaseRoutines.GetTypeDescription(27);
  rgtDoc1 : result :=  TDataBaseRoutines.GetTypeDescription(28);
  rgtDoc2 : result :=  TDataBaseRoutines.GetTypeDescription(29);
  end;
end;

Function BatchNameExists(Var Value: TBatchTypeRec):Boolean;
begin
  Result := False;
  dmDatabase.qGen.CLose;
  Try
    dmDatabase.qGen.Filtered:=False;
    dmDatabase.qGen.SQL.Text:=  'Select * From BatTypes Where Upper(Sdescription)=''' + UpperCase(Value.SDescription)+'''';
    dmDatabase.qGen.Open;
    Result := dmDatabase.qGen.RecordCount>0;
    if result then
    begin
      Value.WBatchTypeID := dmDatabase.qGen.FieldByName('WBatchTypeID').AsInteger;
      Value.BCashBook := dmDatabase.qGen.FieldByName('BCashBook').Asinteger = 1;
      Value.WContraAccountID := dmDatabase.qGen.FieldByName('WContraAccountID').AsInteger;
      Value.DSysDate := dmDatabase.qGen.FieldByName('DSysDate').AsDateTime;
    end;
  Finally
    dmDatabase.qGen.CLose;
  end;
end;

Function SeekBatch(Var ABatCont : TBatchCon):Boolean;
{Sylvain:
 This function will locate tha batch in Bacth control and return the record}
Var
  Hold:Boolean;
begin
  Hold := dmDatabase.tblBatchControl.Active;
  dmDatabase.tblBatchControl.Active := True;
  Result := dmDatabase.tblBatchControl.Locate('WInitbatID;WUserID;SUniqueID;DSysDate',VarArrayof([ABatCont.WInitBatID,ABatCont.WUserID,ABatCont.SUniqueID,ABatCont.DSysDate ]),[]);
  if Result then
    GetBatchConRec(ABatCont,True);
  dmDatabase.tblBatchControl.Active := Hold;
end;

Function BatchExists(InitID,UserID:integer;AUnique,SBatNumber:String):Integer;
{
  This function will check if the txf Bacth exists;
  0 : Not found;
  1 : Found and Not posted
  2 : Found and Posted
  }
begin
  Result := 0;
  if AUnique='********' then
    Result := 2
    else
    begin
     dmDatabase.ZQBatControl.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnUserInitBatUnique');
     //Update the Batch control info
     dmDatabase.ZQBatControl.ParamByName('WUserID').AsInteger := UserID ;
     dmDatabase.ZQBatControl.ParamByName('WInitbatID').AsInteger :=  InitID;
     dmDatabase.ZQBatControl.ParamByName('SUniqueID').AsString := AUnique ;
     dmDatabase.ZQBatControl.Open;
       if not dmDatabase.ZQBatControl.IsEmpty then
        begin
          if dmDatabase.ZQBatControlBPosted.AsInteger =1 then
            Result := 2
          else
            Result := 1;
        end;
    end;
end;

Procedure UpdateBatCon(BatID,InitID:integer;aAlias,AUnique:String;Imported:Boolean=True);
Var
  Hold:Boolean;
begin
 // TODO : SQLOPTIMIZE
  Hold := dmDatabase.tblBatchControl.Active;
  dmDatabase.tblBatchControl.Active := True;
  if dmDatabase.tblBatchControl.Locate('WbatchID',BatID,[]) then
  begin
    dmDatabase.tblBatchControl.Edit;
    dmDatabase.tblBatchControlBImported.Value:=ord(Imported);
    dmDatabase.tblBatchControlWInitBatID.Value:= InitID;
    dmDatabase.tblBatchControlSAlias.Value := aAlias;
    dmDatabase.tblBatchControlSUniqueID.Value := AUnique;
    dmDatabase.tblBatchControl.Post;
  end;
  dmDatabase.tblBatchControl.Active := Hold;
end;

Function OpenBatch(aBatchType:String;Var BatID:integer;Repeating:Boolean;AltBatch:TUniTable=nil):String;
var
 USeBatch : TUniTable ;
begin
  if AltBatch <> nil then
    USeBatch := AltBatch else
    USeBatch := dmDatabase.tblBatch ;
  Result:='';
  dmDatabase.tblBatchRefTotals.Close;
  if aBatchType='' then exit;
  Try
    USeBatch.DisableControls;
    USeBatch.Close;
    Result := BatchPointer(aBatchType,0,BatID,Repeating);
      if AltBatch <> nil then
         AltBatch.TableName :=   dmDatabase.tblBatch.TableName ;
    USeBatch.EnableControls;
    if Result='' then exit;
    USeBatch.Open;
  except end;
  dmDatabase.tblBatchRefTotals.TableName:=USeBatch.TableName;
end;

Function  GetAppPath:String;
begin
  Result :=   UpperCase(IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalBaseDir ));
end;


Function GetT3UserName(UserID:integer):String;
Var
  Hold:Boolean;
begin
  Result :='';
  Hold := dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Open;
  if dmDatabase.tblUser.Locate('WuserID',UserID,[]) then
    Result := dmDatabase.tblUserSUserName.Value;
  dmDatabase.tblUser.Active:=Hold;
end;

Function GetT3UserID(UserName:String):Integer;
Var
  Hold:Boolean;
begin
  Result := -1 ;
  Hold := dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Open;
  if dmDatabase.tblUser.Locate('SUserName',UserName,[LoCaseInsensitive]) then
    Result := dmDatabase.tblUserWUserID.AsInteger
   else if dmDatabase.tblUser.Locate('WUserID',0,[]) then
     Result := 0;
  dmDatabase.tblUser.Active:=Hold;
end;


Procedure DoCloseBatch;
begin
  if dmDatabase.tblBatch.Active = True then
  begin
    dmDatabase.tblBatch.Edit;
    dmDatabase.tblBatch.Post;
    dmDatabase.tblBatch.Close;
  end;
  dmDatabase.tblBatchRefTotals.Close;
  dmDatabase.tblBatchSreference.Size:=15;
  dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
  dmDatabase.tblBatchFCREDIT.ReadOnly:=False;
  dmDatabase.tblAccount.Close;
end;



Function PostBatch(CanToLastYear,MustPost:Boolean;IsReverse : Boolean  = false;IsOpeningBal : Boolean = false ):Integer;
var
 WasInTrans : Boolean ;
begin
  // allow higer transaction.
  WasInTrans := dmDatabase.ZMainconnection.InTransaction ;
  if not WasInTrans then
    dmDatabase.ZMainconnection.StartTransaction ;
       try
       Result := PostBatchNow(CanToLastYear,MustPost,IsReverse,IsOpeningBal);
       if not WasInTrans then
       dmDatabase.ZMainconnection.Commit ;
      finally
      if not WasInTrans then
      if  dmDatabase.ZMainconnection.InTransaction then
        dmDatabase.ZMainconnection.Rollback ;
     end;
  {remove progress bar}
  _SetProgress(-2);
end;


Function ExportDocsToTxf(aStartDate,aEndDate:TDateTime;afilename:String):integer;
Var
  ext:string;
//  aDate:TDate;
begin
//  aDate := StrToDate(aStartDate);
  ext:=Uppercase(ExtractFileExt(afileName));
  Result:=100;
  if ext='.TXF' then
  begin
    Result := ExportXmlDoc(aStartDate,aEndDate,afilename,'tmp.xml','tmp.log',False,4);
  end;
end;

Function ExportDocsToTxfStr(aStartDate,aEndDate:TDateTime;Var docstext:String):integer;
//Var
//  aDate:TDate;
begin
//  aDate := StrToDate(aStartDate);
  tmpstrs1:='';
  Result := ExportXmlDoc(aStartDate,aEndDate,'tmp.xml','tmp.xml','tmp.log',False,200);
  docstext:=tmpstrs1;
end;

Procedure ChargeDocSql;
begin
   if dmDatabase.qryDocHead.Active then dmDatabase.qryDocHead.Close;
   dmDatabase.qryDocHead.SQL.Clear;
   dmDatabase.qryDocHead.filter := '' ;
   dmDatabase.qryDocHead.Filtered := false ;
   dmDatabase.qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
end;

procedure OpenDocSql(aFilter,Order:String);
begin
  with dmDatabase.qryDocHead do begin
   ChargeDocSql;
   if aFilter<>'' then
   SQL.Add(' AND ' + aFilter);
   Order:=Trim(Order);
   SQL.Add('order by ');
   if (Order<>'') then
      SQL.Add(Order)
   else
     SQL.Add(' DocHead.SDocNo ');
   // Please dont process an maby force a event.
   // Also application should not be used in a datamodule.
   //Application.ProcessMessages;
   Open;
   end;
end;

Function  WriteDocListToStr(filter:String;Var StrResult:String):integer;
begin
  Result := ExchangeTCData.WriteDocListToStr(filter,StrResult);
end;

Function  IsAmtIncludeTax(ActualAmt,TaxRate: Double; Var TaxAmt:Double;BCashBook:Boolean):Boolean;
// Adde By Sylvain
// Return true if Amount Contains Tax Amount
Var
  vFAmt,vTxAmt:real;
begin
  Result := True;
  if BCashBook then
  begin
    vTxAmt := ActualAmt * (TaxRate/100);
    Result := Not (RoundAmount(vTxAmt) = RoundAmount(TaxAmt)) ;
    TaxAmt := vTxAmt ;
  end
  else
  begin
    vFAmt := (ActualAmt * 100) / (TaxRate+100);
    vTxAmt := vFAmt * TaxRate / 100  ;
    // Test if Inclusive Mode
    if RoundAmount(vTxAmt) <> RoundAmount(TaxAmt) then
      Result := False ;
    TaxAmt := vTxAmt ;
  end;
end;


Function CheckGetReconData(BankAccountID:Integer;vDate,tDate:TDateTime; Var PymtID,RcptID:String;Var TotalUnpost:Double;JustOpenRCon:Boolean = false):integer;
// Get Data From Payment & Receipt Batch and Transactions
// Table Structure is the same as Batch
// FDEBIT = Bacth type ID
// SContaAccount : 'True'=Posted or 'False'= Unposted
// STAX = BatchType
// FCREDIT=TransactionID
Var
  OK ,Include     : Boolean;
  BankAccount  :String;
  tmpAmt,TxRate,
  TemTax   :Double;
  AProgress :  TfmNewProgress ;
begin
 AProgress  :=  TfmNewProgress.create(nil) ;
 try
  // todo : SQLOPTIMIZE
  CheckGetReconData := 1;
  TotalUnpost:=0;
  PymtID:='';
  RcptID:='';
  dmDatabase.tblBank.Open;
  if  dmDatabase.tblBank.Locate('WAccountID', BankAccountID, []) then
  begin
    PymtID:=dmDatabase.tblBankWPaymentsID.AsString;
    RcptID:=dmDatabase.tblBankWReceiptsID.AsString;
  end;
  if (PymtID='') or (RcptID='') then
  begin
    dmDatabase.tblBank.Close;
    result := 2;
    exit;
  end;


  DmDatabase.tblReconBank.DisableControls;
  try
  With DmDatabase do
  begin
    if DmDatabase.tblReconBank.Active then DmDatabase.tblReconBank.Close;
    DmDatabase.tblReconBank.Connection :=ZMainconnection;
      RConBankTableName := 'Recon' + IntToStr(CurrentUser) ;
      DmDatabase.tblReconBank.Sql.text := 'Select * from ' + RConBankTableName ;
      if not TDataBaseRoutines.TableExist(RConBankTableName) then
       dmDatabase.CreateBatch(RConBankTableName);
    {Sylvain: The table is not empty??}
    DmDatabase.tblReconBank.Close;
    clearTable(RConBankTableName);

    DmDatabase.TblReconBank.open;
    tblBatch.Filtered:=False;
    DmDatabase.ZQTransAction.close ;
    DmDatabase.ZQTransAction.SQL.Text := 'select * from transact where WBatchTypeID in ('+RcptID +','+ PymtID +') and WLinkedid = WLineid and WBALANCINGACCOUNTID = '+ IntToStr(BankAccountID) +
     'and ddate >= '+TDatabaseTableRoutines.GetFirebirdsSqlForDate(trunc(tDate))+
     'and ddate <= '+TDatabaseTableRoutines.GetFirebirdsSqlForDate(trunc(vDate));

     if JustOpenRCon then
       DmDatabase.ZQTransAction.SQL.add('and BRECONCILED = 0');
    DmDatabase.ZQTransAction.SQL.add('order by ddate');
    DmDatabase.ZQTransAction.Open ;
    DmDatabase.ZQTransAction.last ;
    DmDatabase.ZQTransAction.first ;
    AProgress.initProgress('...',DmDatabase.ZQTransAction.RecordCount);
    BankAccount:= TDataBaseRoutines.GetAccountCode(BankAccountID);

    while not DmDatabase.ZQTransAction.Eof do
    begin
      AProgress.SetProgress('',DmDatabase.ZQTransAction.RecNo);
      // < date
         Include := (trunc(dmDatabase.ZQTransActionDDate.AsDateTime) <= trunc(vdate)) ;



{      Include := Include and not ((not dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState)and ((DmDatabase.tblTransactionWAccountID.AsInteger = BankAccountID ) or(GetAccountType(DmDatabase.tblTransactionWAccountID.AsInteger) =4 ))) ;
      // always include external to the batches for the bank account                                    -
      if (not (tblTRansactionWBatchTypeID.Asinteger in [StrToInt(RcptID),StrToInt(PymtID)] )) and (DmDatabase.tblTransactionWAccountID.AsInteger = BankAccountID)  then
        Include := true ; }


      If Include then
      begin
        Result:=0;
        DmDatabase.TblReconBank.Append;
        DmDatabase.TblReconBankSreference.value:=dmDatabase.ZQTransActionSreference.value;
        DmDatabase.TblReconBankDDate.value:=dmDatabase.ZQTransActionDdate.Value;
       // tblAccount.Locate('WAccountID',ZQTransActionWAccountID.Value, []);
        DmDatabase.TblReconBankSACCOUNT.value:=  TDataBaseRoutines.AddDashInStdAccCode( TDataBaseRoutines.GetAccountCode(ZQTransActionWAccountID.AsInteger ));
//
        DmDatabase.TblReconBankWDOCID.AsInteger := ZQTransActionWDOCID.AsInteger ;
        //DmDatabase.TblReconBankWLINKEDID.AsInteger := dmDatabase.ZQTransActionWTRANSACTIONID.AsInteger ;

        DmDatabase.TblReconBankSDescription.value:= _ReadDescription(ZQTransActionWDescriptionID.AsInteger);
         if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
           DmDatabase.TblReconBankBReconciled.AsInteger:=dmDatabase.ZQTransActionBReconciled.AsInteger
           else
           DmDatabase.TblReconBankBReconciled.AsInteger:= 0 ;

        DmDatabase.TblReconBankWLINKEDID.AsInteger := dmDatabase.ZQTransActionBReconciled.AsInteger;
        DmDatabase.TblReconBankWTAX2ID.AsInteger := dmDatabase.ZQTransActionWTRANSACTIONID.AsInteger;

        DmDatabase.TblReconBankFDEBIT.value:=dmDatabase.ZQTransActionWBatchTypeID.Value;
        DmDatabase.TblReconBankFAmount.AsFloat:= dmDatabase.ZQTransActionFAmount.AsFloat + dmDatabase.ZQTransActionFTAXAMOUNT.AsFloat ;

        DmDatabase.TblReconBankFCREDIT.AsFloat:=ZQTransActionWTransactionid.AsFloat;
        DmDatabase.TblReconBankWLineID.AsFloat := ZQTransActionWTransactionid.AsFloat;
        if PymtID = RcptID then
        begin
            if DmDatabase.ZQTransActionFAMOUNT.AsFloat > 0  then
         begin
          TblReconBankSTAX.value:=GetTextLang(1099){'Payment'}
         end   else
         begin
          TblReconBankSTAX.value:=GetTextLang(1100){'Recepit'};
         end;
        end else
        begin
        if DmDatabase.ZQTransActionWBatchTypeID.AsString=PymtID then
         begin
          TblReconBankSTAX.value:=GetTextLang(1099){'Payment'}
         end   else
         begin
          TblReconBankSTAX.value:=GetTextLang(1100){'Recepit'};
         end;
        end;
        DmDatabase.TblReconBankFAmount.value:=-TblReconBankFAmount.value;
        DmDatabase.TblReconBankSCONTRAACCOUNT.Value:='1';
        DmDatabase.TblReconBank.Post;
      end;
      DmDatabase.ZQTransAction.Next;
    end;
  end;

  tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(PymtID),OK,False);
  if not Ok then
  begin
    dmDatabase.tblBatch.close;
    dmDatabase.tblBatch.TableName:= tmpstrs1;
  With DmDatabase do
  begin
    tblAccount.Filtered := False;
    tblAccount.Filter := '';

    tblBatch.Open;
    tblBatch.last;
    tblBatch.First;
    AProgress.initProgress('..',tblBatch.RecordCount);
    while not tblBatch.Eof do
    begin
    AProgress.SetProgress('',tblBatch.RecNo);

     If (tblBatchWLINEID.value=tblBatchWLINKEDID.value) and (tblBatchDDate.value<=vDate) and (tblBatchDDate.value>=tDate) Then
       if (DmDatabase.tblBatchBExclusive.Value=1) and (DmDatabase.tblBatchFAmount.Value<>0) then
         TotalUnpost := TotalUnpost +(DmDatabase.tblBatchFAmount.Value+StrTOFloatDef(DmDatabase.tblBatchFTaxAmount.AsString,0))
       else
         TotalUnpost := TotalUnpost + DmDatabase.tblBatchFAmount.Value;
     If (tblBatchWLINEID.value=tblBatchWLINKEDID.value ) {and  (tblBatchBReconciled.Value=0)  }
         and (tblBatchDDate.value<=vDate) and (tblBatchDDate.value>=tDate) then
     begin
      if (dmDatabase.tblBatchFDEBIT.AsFloat <> 0) or (dmDatabase.tblBatchFCREDIT.AsFloat <> 0) then
      begin
      // PymtID
      Result:=0;
      TblReconBank.Append;
      TblReconBankSreference.value:=tblBatchSreference.value;
      TblReconBankDDate.value:=tblBatchDdate.Value;
      TblReconBankSACCOUNT.value:=tblBatchSACCOUNT.Value;
      TblReconBankSDescription.value:=tblBatchSDescription.Value;
      TblReconBankBReconciled.value:=tblBatchBReconciled.Value;

      TblReconBankWDOCID.AsInteger := tblBatchWLINEID.AsInteger ;
      TblReconBankWLINKEDID.AsInteger := tblBatchBReconciled.Value;
      TblReconBankWTAX2ID.AsInteger := 0 ;

      TblReconBankFDEBIT.value:= StrToInt(PymtID) ;
      TblReconBankFCREDIT.value := tblBatch.RecNo;
      TblReconBankWLineID.AsInteger := -10000 + tblBatchWLineID.AsInteger;
     // TblReconBankWDOCID.Value := tblBatchWLineID.Value;

      if tblBatchSTAX.Value='' then
       TemTax := 0
      else
       TemTax := tblBatchFTaxAmount.Value;
      //
      TblReconBankFAmount.value:=0;
      if tblBatchFAmount.Value<>0 then
      if tblBatchBExclusive.Value=1then
        TblReconBankFAmount.value:= -tblBatchFAmount.Value+TemTax
      else
        TblReconBankFAmount.value:= -tblBatchFAmount.Value;


      TblReconBankSCONTRAACCOUNT.Value:='0';
      TblReconBankBExclusive.value:=tblBatchBExclusive.Value;
      TblReconBankSTAX.value:=GetTextLang(1099){'Payment'};
      TblReconBank.Post;
      end;
     end;
     tblBatch.Next;
    end;
  end;
  End; //IF

  // if there the same exit ales we get em 2 times
  if PymtID =  RcptID then exit ;

  tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(RcptID),OK,False);
  if Not Ok then
  begin
    dmDatabase.tblBatch.close;
     dmDatabase.tblBatch.TableName := tmpstrs1;
  With DmDatabase do
  begin
    tblAccount.Filtered := False;
    tblAccount.Filter := '';
    tblBatch.Open;
    tblBatch.last ;
    tblBatch.First ;
    AProgress.initProgress('..',tblBatch.RecordCount);
    while not tblBatch.Eof do
    begin
    AProgress.SetProgress('',tblBatch.RecNo);
     If (tblBatchWLINEID.value=tblBatchWLINKEDID.value) and (tblBatchDDate.value<=vDate) and (tblBatchDDate.value>=tDate) Then
       if (DmDatabase.tblBatchBExclusive.AsInteger =1 )and (DmDatabase.tblBatchFAmount.Value<>0) then
         TotalUnpost := TotalUnpost + (DmDatabase.tblBatchFAmount.Value+StrToFloatDef(DmDatabase.tblBatchFTaxAmount.AsString,0))
       else
         TotalUnpost := TotalUnpost + DmDatabase.tblBatchFAmount.Value;
     If (tblBatchWLINEID.value=tblBatchWLINKEDID.value){ and  (tblBatchBReconciled.Value=0) }
        and (tblBatchDDate.value<=vDate) and (tblBatchDDate.value>=tDate) then
     begin
      if (dmDatabase.tblBatchFDEBIT.AsFloat <> 0) or (dmDatabase.tblBatchFCREDIT.AsFloat <> 0) then      begin
       // RcptID
      Result:=0;
      TblReconBank.Append;
      TblReconBankSreference.AsString:=tblBatchSreference.AsString;
      TblReconBankDDate.value:=tblBatchDdate.Value;
      TblReconBankSACCOUNT.AsString:=tblBatchSACCOUNT.AsString;
      TblReconBankSDescription.AsString:=tblBatchSDescription.AsString;
      TblReconBankBReconciled.AsInteger:=tblBatchBReconciled.AsInteger;
      TblReconBankWLINKEDID.AsInteger := tblBatchBReconciled.AsInteger;
      TblReconBankWTAX2ID.AsInteger := 0 ;

      TblReconBankFDEBIT.value:= StrToInt(RcptID) ;
      TblReconBankFCREDIT.value:= tblBatch.RecNo;
      TblReconBankFAmount.value:=0;
      TblReconBankWLineID.AsInteger := -20000 + tblBatchWLineID.AsInteger;
      TblReconBankWDOCID.AsInteger := tblBatchWLINEID.AsInteger;

      if tblBatchSTAX.Value='' then
       TemTax := 0
      else
       TemTax := tblBatchFTaxAmount.Value;
      if tblBatchFAmount.Value<>0 then
      if tblBatchBExclusive.Value =1then
        TblReconBankFAmount.value:= - (tblBatchFAmount.Value+temTax)
      else
        TblReconBankFAmount.value:= - tblBatchFAmount.Value;
      TblReconBankSCONTRAACCOUNT.Value:='0';
      TblReconBankBExclusive.value:= tblBatchBExclusive.Value;
      TblReconBankSTAX.value:= GetTextLang(1100){'Receipt'};
      TblReconBank.Post;
      end;
     end;
     tblBatch.Next;
    end;
    tblBank.Close;
    tblBatch.Close;
    ZQTransAction.Close;
    If TblReconBank.RecordCount>0 then
      CheckGetReconData:=0
    end;
  End;
  dmDatabase.tblReconBank.close ;
  dmDatabase.tblReconBank.filter := 'WLINKEDID = 0' ;
  dmDatabase.tblReconBank.Filtered := true ;
  dmDatabase.tblReconBank.open ;

  finally
  dmDatabase.tblReconBank.EnableControls;
  end;
  Finally
     AProgress.free;
  end;
end;

// language Stuff
procedure ChangePrnLbls(aDestLbl,alblCopies:Tlabel;aBitSetPrint:TWinControl);
  begin
    if  IsPublishedProp(aBitSetPrint,'Caption') then
      SetStrProp(aBitSetPrint,'Caption',GetTextLang(864));

    if  IsPublishedProp(aDestLbl,'Caption') then
      SetStrProp(aDestLbl,'Caption',GetTextLang(865));

    if  IsPublishedProp(alblCopies,'Caption') then
      SetStrProp(alblCopies,'Caption',GetTextLang(866));

  end;
Procedure EditBtns(bAdd,bEdit,bDelete:TPersistent);
  begin
    if  IsPublishedProp(bAdd,'Caption') then
      SetStrProp(bAdd,'Caption',GetTextLang(983));
    if  IsPublishedProp(bEdit,'Caption') then
      SetStrProp(bEdit,'Caption',GetTextLang(121));
    if  IsPublishedProp(bDelete,'Caption') then
      SetStrProp(bDelete,'Caption',GetTextLang(173));
  end;

Procedure NavBtns(b1,b2,b3,b4:TPersistent);
  begin
    if  IsPublishedProp(b1,'Caption') then
      SetStrProp(b1,'Caption',GetTextLang(983));
    if  IsPublishedProp(b2,'Caption') then
      SetStrProp(b2,'Caption',GetTextLang(952));
    if  IsPublishedProp(b3,'Caption') then
      SetStrProp(b3,'Caption',GetTextLang(984));
    if  IsPublishedProp(b4,'Caption') then
      SetStrProp(b4,'Caption',GetTextLang(726));
  end;
Procedure OkCancel(aOk,aCancel:TWinControl);
  begin
    if  IsPublishedProp(aOk,'Caption') then
      SetStrProp(aOk,'Caption',GetTextLang(167));
    if  IsPublishedProp(aCancel,'Caption') then
      SetStrProp(aCancel,'Caption',GetTextLang(168));
  end;

function GetTypeDesc(AType : Integer) : String ;
begin
 dmDatabase.tblType.SQL.Text := 'select * from v_types TYPES where WTypeID = ' + IntToStr(AType);
 dmDatabase.tblType.open ;
 result := dmDatabase.tblTypeSDescription.AsString ;
 dmDatabase.tblType.open ;
end;
Procedure CopyToDocument(AFromDocId,AToDocId : Integer;DoDelete : Boolean)  ;
var
   AQDocLine : TuniQuery ;
   MaxLine, j : Integer ;
begin
    With  DmDatabase do
    begin
     tblDocHeader.close ;
     tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + IntToStr(AToDocId);
     tblDocHeader.open ;
     if not tblDocHeader.IsEmpty then
     begin
     dmDatabase.tblDocLine.SQL.Text := 'Select * from docline where WDocid =' + IntToStr(AToDocId) +' order by WSortno';
       tblDocline.open ;
       AQDocLine := TuniQuery.Create(nil) ;
       try
          AQDocLine.Connection := dmDatabase.ZMainconnection ;
          AQDocLine.SQL.Text := 'select * from docline where WDocID='+ IntToStr(AFromDocId) +' order by WSortno';
          MaxLine := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WDOCLINEID) from docline where WDocID='+ IntToStr(AToDocId))),0);
          AQDocLine.open  ;
          AQDocLine.First;
          While not AQDocLine.Eof do
          begin
           { if (AQDocLine.FindField('WLineTypeID').asinteger <> 91) and
               dmDatabase.tblDocLine.Locate('WSTOCKID',AQDocLine.FieldByName('WSTOCKID').AsInteger,[]) then
             begin
                tblDocline.Edit ;
                tblDocLineFQTYORDERED.AsFloat := tblDocLineFQTYORDERED.AsFloat + AQDocLine.FieldByName('FQTYORDERED').AsFloat ;
                tblDocLineFQTYSHIPPED.AsFloat := tblDocLineFQTYSHIPPED.AsFloat + AQDocLine.FieldByName('FQTYSHIPPED').AsFloat ;
                tblDocLineFEXCLUSIVEAMT.AsFloat := tblDocLineFEXCLUSIVEAMT.AsFloat + AQDocLine.FieldByName('FEXCLUSIVEAMT').AsFloat ;
                tblDocLineFINCLUSIVEAMT.AsFloat := tblDocLineFINCLUSIVEAMT.AsFloat + AQDocLine.FieldByName('FINCLUSIVEAMT').AsFloat ;
             end else  }
             begin
            tblDocline.Append;
            for j := 0 to AQDocLine.FieldCount - 1 do
              if  tblDocline.FindField(AQDocLine.Fields[j].FieldName) <> nil then
              begin
               if AQDocLine.Fields[j].FieldName='WDESCRIPTIONID' then
               begin
                  if AQDocLine.FindField('WLineTypeID').asinteger <> 91 then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=AQDocLine.Fields[j].value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsInteger := AddMessage(_ReadDescription(AQDocLine.Fields[j].AsInteger),True);
                end
                else
                // end [ 1371752 ] qoutation to invoice
                  if  AQDocLine.Fields[j].FieldName ='WDOCID' then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=tblDocHeaderWDocID.Value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsString:=AQDocLine.Fields[j].AsString;
              end;

              inc(MaxLine) ;
              tblDocLineWDOCLINEID.AsInteger := MaxLine ;
              tblDocLineWSORTNO.AsInteger := MaxLine ;
              end;
              tblDocline.Post;
              AQDocLine.Next;
          end;
          tblDocline.close;
       finally
         AQDocLine.free;
       end;
        if DoDelete then
       begin
          DMTCCoreLink.ExecSql('Delete from docline where wdocid ='+ IntToStr(AFromDocId));
          DMTCCoreLink.ExecSql('Delete from dochead where wdocid ='+ IntToStr(AFromDocId));
       end;

       end;
    end;
end;
Procedure UpdatePurchaseStockLine(AAccountid,ADocid,ALineId : Integer; Aqty,AExcPrice : Double );
var
   AQStockItem : TuniQuery ;
    j : Integer ;
   AStockRec : TStockRec ;
   TaxRate : Double ;
   ADefaultContra,ADefaultTax : Integer ;
begin
    With  DmDatabase do
    begin
       dmDatabase.ZQDocLine.SQL.Text := 'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where Wdocid = :Wdocid and wdoclineid =:wdoclineid ';
       dmDatabase.ZQDocLine.Params[0].AsInteger := ADocid ;
       dmDatabase.ZQDocLine.Params[1].AsInteger := ALineId ;
       ZQDocLine.open ;
       if not ZQDocLine.IsEmpty then
       begin
       ZQDocLine.edit ;
       dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := AExcPrice ;
       dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat := Aqty ;
       dmDatabase.ZQDocLineFQTYORDERED.AsFloat := Aqty ;
       TaxRate := GetTaxRateOnId(dmDatabase.ZQDocLineWTAXID.AsInteger,true);
       dmDatabase.ZQDocLineFInclusiveAmt.Value := FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat) *TaxRate,dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
       dmDatabase.ZQDocLineFExclusiveAmt.Value := FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
       dmDatabase.ZQDocLineFTAXAMOUNT.Value :=FixAmount((dmDatabase.ZQDocLineFInclusiveAmt.Value - dmDatabase.ZQDocLineFExclusiveAmt.Value),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
       dmDatabase.ZQDocLine.Post ;
       dmDatabase.ZQDocLine.Close ;
       end;
    end;
end;


Procedure AddPurchaseStockLine(AAccountid,ADocid,AStockid : Integer; Aqty : Double;Var Lineid : Integer;UsePriceOrg : Boolean = false;CustSellPrice: Double = -1;CustDiscount : Double = -1;CustOrgSellPrice: Double = -1 ;Wunitid:  integer = -1 );
var
   AQStockItem : TuniQuery ;
   MaxLine, j : Integer ;
   AStockRec : TStockRec ;
   TaxRate : Double ;
   ADefaultContra,ADefaultTax : Integer ;
begin
    With  DmDatabase do
    begin
     MaxLine := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(WDOCLINEID) from docline where WDocID='+ IntToStr(ADocid))),0);
     tblDocHeader.close ;
     tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + IntToStr(ADocid);
     tblDocHeader.open ;
     if not tblDocHeader.IsEmpty then
       dmDatabase.ZQDocLine.SQL.Text := 'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where Account.WaccountId is null';
       ZQDocLine.open ;
       AStockRec.WStockID := AStockid ;
       StockLoadItem(AStockRec) ;
       dmDatabase.ZQDocLine.Insert ;
       dmDatabase.ZQDocLineWTAXID.AsInteger := AStockRec.WInputTaxID ;
  
       if Wunitid > 0 then
          begin
             dmDatabase.ZQDocLineSUNIT.AsInteger := Wunitid ;
          //   dmDatabase.ZQDocLineFUNITQTY.AsFloat := TDataBaseStockRoutines.GetUnitQty(Wunitid);

          end;
       // see if theres account default

      GetAccountDefaultTaxAndContra(dmdatabase.tblDocHeaderWAccountID.AsInteger,ADefaultContra,ADefaultTax) ;
      if  ADefaultTax <> 0 then
          begin
           dmDatabase.ZQDocLineWTAXID.AsInteger := ADefaultTax ;
          end;
       dmDatabase.ZQDocLineSSTOCKCODE.AsString :=  AStockRec.SSTOCKCODE ;
       dmDatabase.ZQDocLineWLINETYPEID.AsInteger :=  90 ;
       dmDatabase.ZQDocLineWSTOCKID.AsInteger := AStockid ;
       dmDatabase.ZQDocLineFITEMDISCOUNT.asfloat := 0 ;
       if CustSellPrice <> -1 then
        dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := CustSellPrice
       else
       dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(AAccountid,AStockid,Aqty) * TDataBaseStockRoutines.GetUnitQty(Wunitid); ;

       dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat := Aqty ;
       dmDatabase.ZQDocLineWDOCID.AsInteger := ADocid ;
       dmDatabase.ZQDocLineFQTYORDERED.AsFloat := Aqty ;
       dmDatabase.ZQDocLineWDESCRIPTIONID.AsInteger := DMTCCoreLink.GetAddDescription(AStockRec.SDescription) ;
       inc(MaxLine) ;
       dmDatabase.ZQDocLineWDOCLINEID.AsInteger := MaxLine ;
       dmDatabase.ZQDocLineWSORTNO.AsInteger := MaxLine ;
        dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat := dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat ;
       TaxRate := GetTaxRateOnId(dmDatabase.ZQDocLineWTAXID.AsInteger,true);
       dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat :=  0 ;
       if CustDiscount <> -1 then
          dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat :=   CustDiscount ;
       dmDatabase.ZQDocLineFInclusiveAmt.Value :=  (1 - ( dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat / 100)) *  FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat  )) *TaxRate,dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
       dmDatabase.ZQDocLineFExclusiveAmt.Value := (1 - ( dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat / 100)) * FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat )),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);

       dmDatabase.ZQDocLineFTAXAMOUNT.Value :=FixAmount((dmDatabase.ZQDocLineFInclusiveAmt.Value - dmDatabase.ZQDocLineFExclusiveAmt.Value),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
        dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat := 0 ;
       dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat := Aqty ;

       if UsePriceOrg then
          begin
             if (tblDocHeaderWTYPEID.AsInteger in [10,11,14]) then

              dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getDefaultStockPrice(AAccountid,AStockid) *  TDataBaseStockRoutines.GetUnitQty(Wunitid)
               else
             dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getLastStockCost(AStockid) * TDataBaseStockRoutines.GetUnitQty(Wunitid) ;


            dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat := ((dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat * (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat))) - dmDatabase.ZQDocLineFEXCLUSIVEAMT.Value ;

            if dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat<> 0 then
             if (dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat * (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat* TDataBaseStockRoutines.GetUnitQty(Wunitid))) <> 0 then
               dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat := (dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat / ((dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat * (dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat)))*100);

          end;
       if CustSellPrice <> -1 then
         begin
            dmDatabase.ZQDocLineFITEMDISCOUNT.asFloat := CustDiscount ;
            dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := CustSellPrice ;
         end;
         
       dmDatabase.ZQDocLineWACCOUNTID.AsInteger := 0 ;

       dmDatabase.ZQDocLineWACCOUNTTYPEID.AsInteger := 0 ;
       dmDatabase.ZQDocLineWREPORTINGGROUP1ID.AsInteger := 0 ;
       dmDatabase.ZQDocLineWREPORTINGGROUP2ID.AsInteger := 0 ;
       dmDatabase.ZQDocLineBSUBACCOUNTS.AsInteger := 0 ;
       dmDatabase.ZQDocLineBINCOMEEXPENSE.AsInteger := 0 ;
       Lineid := dmDatabase.ZQDocLineWDOCLINEID.AsInteger ;
       dmDatabase.ZQDocLine.Post ;
       dmDatabase.ZQDocLine.Close ;
    end;
end;
procedure CreateDocument(AToAccountID,DocType : Integer;Var NewDocId : Integer);
Var
  TryCount : Integer ;
  i,j ,InternalDoctype         :Integer;
  TWDocID          :String;
  tmpDocNo : String;
  TmpField         :Array of variant;
//  Bool : Boolean;
  ASaveList : TSaveClientDatasetCallList ;
  AQDocLine : TuniQuery ;
begin
  case DocType of
  0 : InternalDoctype := 10 ;
  1 : InternalDoctype := 12 ;
  2 : InternalDoctype := 15 ;
  3 : InternalDoctype := 14 ;
  end;
  ASaveList := TSaveClientDatasetCallList.Create ;
  try
    With  DmDatabase do
    begin
     ASaveList.AddclientObject(tblDocHeader,true);
     ASaveList.AddclientObject(tblUser,true);
     ASaveList.AddclientObject(tblSysVars,true);
     ASaveList.AddclientObject(tblDocLine,true);
     ASaveList.AddclientObject(tblDebtor,true);
     ASaveList.AddclientObject(tblCreditor,true);

     tblUser.Active:=True;
     tblSysVars.Open;
     tblDocHeader.close ;
     tblDocHeader.sql.Text :=' Select * from dochead where WDocid=-1' ;
     tblDocHeader.open ;
      With tblDocHeader do
        begin
           tblDocHeader.Append;

           for j := 0 to tblDocHeader.FieldCount - 1 do
             if tblDocHeader.Fields[j].FieldName<>'WDOCID' then
             begin
               if tblDocHeader.Fields[j].FieldName='WTYPEID' then
                  tblDocHeader.Fields[j].Value := InternalDoctype // Create an Invoice
               else if tblDocHeader.Fields[j].FieldName='SDOCNO' then
                  begin
                     tblDocHeader.Fields[j].AsString := TDataBaseDocumentRoutines.GetDocNextNum(InternalDoctype) ;
                  end 
             else if (tblDocHeader.Fields[j].FieldName='BPRINTED') or
                      (tblDocHeader.Fields[j].FieldName='BREPEATING') or
                      (tblDocHeader.Fields[j].FieldName='BPOSTED') then
                      tblDocHeader.Fields[j].Value:=0
             else if tblDocHeader.Fields[j].FieldName='DDATE' then
             begin
                tblDocHeader.Fields[j].AsdateTime :=Date;
             end
             else if tblDocHeader.Fields[j].FieldName='WACCOUNTID' then
                tblDocHeader.Fields[j].Value:= AToAccountID
            end; // end for j
             {Change Messages to point to Doc Messages}
        end;
        NewDocId := tblDocHeaderWDocID.AsInteger ;
        // reload Debtor/Creditor address info.
        FillAccountInfoInDocHead(AToAccountID,True) ;
        NewDocId := tblDocHeaderWDOCID.AsInteger ;
        tblDocHeader.Post;
        tblDocHeader.close ;

       end;
  finally
    ASaveList.free ;
  end;
end;

Procedure CopyDocument(AFromDocId,AToAccountID,DocType : Integer;DoDelete:Boolean ;GenList:TStringList;DefaultDate : TDate;UseDocDate : Boolean;Var NewDocId : Integer ;AltDesc1: String = '';AltDesc2: String = '';AltDesc3: String = '';AddMessageText : String = '';RedoAccountInfo : Boolean = false;UpdatePosted : Boolean = true) ;
Var
  TryCount , OldType : Integer ;
  i,j ,InternalDoctype         :Integer;
  TWDocID          :String;
  tmpDocNo : String;
  TmpField         :Array of variant;
//  Bool : Boolean;
  ASaveList : TSaveClientDatasetCallList ;
  AQDocLine,AQLinkeDDoc : TuniQuery ;
  AUpdLinkedDoc : TUniUpdateSql ;
  AddDays , OldAccount: Integer ;
begin

  case DocType of
  0 : InternalDoctype := 10 ;
  1 : InternalDoctype := 12 ;
  2 : InternalDoctype := 15 ;
  3 : InternalDoctype := 14 ;
  4 : InternalDoctype := 11 ;
  5 : InternalDoctype := 13 ;
  6 : InternalDoctype := 0 ;
  7 : InternalDoctype := 16 ;
  8 : InternalDoctype := 17 ;
  end;
  ASaveList := TSaveClientDatasetCallList.Create ;
  try
    With  DmDatabase do
    begin
     ASaveList.AddclientObject(tblDocHeader,true);
     ASaveList.AddclientObject(tblUser,true);
     ASaveList.AddclientObject(tblSysVars,true);
     ASaveList.AddclientObject(tblDocLine,true);
     ASaveList.AddclientObject(tblDebtor,true);
     ASaveList.AddclientObject(tblCreditor,true);

     tblUser.Active:=True;
     tblSysVars.Open;
     tblDocHeader.close ;
     tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + IntToStr(AFromDocId);


     tblDocHeader.open ;

     if not tblDocHeader.IsEmpty then
        With tblDocHeader do
        begin
           OldAccount := tblDocHeaderWACCOUNTID.AsInteger ;
           OldType := tblDocHeaderWTYPEID.AsInteger ;

           tmpDocNo:='';
           setlength(TmpField,tblDocHeader.FieldCount);
           for i := 0 to tblDocHeader.FieldCount - 1 do
           begin
             if SameText(tblDocHeader.Fields[i].FieldName,'sDocNo') then
               tmpDocNo := tblDocHeader.Fields[i].AsString;
             TmpField[i]:=  tblDocHeader.Fields[i].value;
           end;
           tblDocHeader.Append;

           if AltDesc1 <> '' then
            dmDatabase.tblDocHeader.FieldByName('WMESSAGE1ID').AsInteger := database.AddMessage(AltDesc1,false);
           if AltDesc2 <> '' then
              dmDatabase.tblDocHeader.FieldByName('WMESSAGE2ID').AsInteger := database.AddMessage(AltDesc2,false);
           if AltDesc3 <> '' then
              dmDatabase.tblDocHeader.FieldByName('WMESSAGE3ID').AsInteger := database.AddMessage(AltDesc3,false);

           for j := 0 to tblDocHeader.FieldCount - 1 do
             if tblDocHeader.Fields[j].FieldName<>'WDOCID' then
             begin
               if tblDocHeader.Fields[j].FieldName='WTYPEID' then
                  tblDocHeader.Fields[j].Value := InternalDoctype // Create an Invoice
               else if tblDocHeader.Fields[j].FieldName='SDOCNO' then
               begin
                 if  InternalDoctype <> 0 then
                  tblDocHeader.Fields[j].AsString:=  TDataBaseDocumentRoutines.GetDocNextNum(InternalDoctype)
                   else
                   tblDocHeader.Fields[j].AsString:= 'TMP' ;
                 end
             else if (tblDocHeader.Fields[j].FieldName='BPRINTED') or
                      (tblDocHeader.Fields[j].FieldName='BREPEATING') or
                      (tblDocHeader.Fields[j].FieldName='BPOSTED') then
                      tblDocHeader.Fields[j].Value:=0
             else if tblDocHeader.Fields[j].FieldName='DDATE' then
             begin
                if UseDocDate then
                  tblDocHeader.Fields[j].AsString:=TmpField[j]
                else
                  tblDocHeader.Fields[j].AsdateTime :=DefaultDate;
             end

             else if tblDocHeader.Fields[j].FieldName='WACCOUNTID' then
                tblDocHeader.Fields[j].Value:= AToAccountID
             {Change Messages to point to Doc Messages}
             else if (tblDocHeader.Fields[j].FieldName='WMESSAGE1ID')
                     or (tblDocHeader.Fields[j].FieldName='WMESSAGE2ID')
                     or (tblDocHeader.Fields[j].FieldName='WMESSAGE3ID') then
             begin
               If (AltDesc1+AltDesc2+AltDesc3) = '' then
                begin

                if (Pos('3',tblDocHeader.Fields[j].FieldName)<>0) then
                  tblDocHeader.Fields[j].AsInteger:=database.AddMessage('Ref:'+tmpDocNo + ' '+GetMessageByDocType(InternalDoctype,Copy(tblDocHeader.Fields[j].FieldName,2,8))+_ReadDescription(StrToIntDef(VarToStr(TmpField[j]),0)))
                else
                  tblDocHeader.Fields[j].AsInteger:=database.AddMessage(GetMessageByDocType(InternalDoctype,Copy(tblDocHeader.Fields[j].FieldName,2,8))+_ReadDescription(StrToIntDef(VarToStr(TmpField[j]),0)))
                end;
              end
              else
                tblDocHeader.Fields[j].value :=TmpField[j];
        end;
        TWDocID := tblDocHeaderWDocID.AsString ;
        NewDocId := tblDocHeaderWDocID.AsInteger ;

        // reload Debtor/Creditor address info.
        FillAccountInfoInDocHead(AToAccountID,RedoAccountInfo) ;
        tblDocHeaderWSOURCETYPEID.Clear ;
        tblDocHeaderBPOSTED.AsInteger := 0 ;
        tblDocHeaderWOPENITEMTRANSACTID.Clear ;
        tblDocHeader.Post;
        if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' then
          begin
          TDataBaseDocumentRoutines.CopyDocLink(AFromDocId,NewDocId);
          TDataBaseDocumentRoutines.AddDocLink(AFromDocId,NewDocId);
          end;
        tblDocHeader.close ;
        tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + TWDocID  ;
        tblDocHeader.open ;
        if GenList <> nil then
           GenList.Add(tblDocHeaderWDocID.AsString);
       end;

    {   Case DocType of
         0: tblUserSInvoiceNextNumber.Value:=_IncrementString(tblUserSInvoiceNextNumber.AsString);
         1: tblUserSPurchaseNextNumber.Value:=_IncrementString(tblUserSPurchaseNextNumber.AsString);
         2: tblUserSORDERNEXTNUMBER.Value:=_IncrementString(tblUserSORDERNEXTNUMBER.AsString);
         3: tblUserSQUOTENEXTNUMBER.Value:=_IncrementString(tblUserSQUOTENEXTNUMBER.AsString);
         4: tblUserSCREDITNOTENEXTNUMBER.Value:=_IncrementString(tblUserSCREDITNOTENEXTNUMBER.AsString);
         5: tblUserSGOODSRETURNEDNEXTNUMBER.Value:=_IncrementString(tblUserSGOODSRETURNEDNEXTNUMBER.AsString);
       end;

       tblUser.Post; }
       // UpDate DocLine Table
       // --------------------
       // [ 1371752 ] qoutation to invoice
       dmDatabase.tblDocLine.SQL.Text := 'select * from docline where wdocid = -1';
       tblDocline.open ;
       AQDocLine := TuniQuery.Create(nil) ;
       try
          AQDocLine.Connection := dmDatabase.ZMainconnection ;
          AQDocLine.SQL.Text := 'select * from docline where WDocID='+ IntToStr(AFromDocId) +' order by WSortno';
          AQDocLine.open  ;
          AQDocLine.First;
          While not AQDocLine.Eof do
          begin

             if (AQDocLine.FieldByName('WLineTypeID').AsInteger = 93) and
                not ((OldType in [14,15]) and (InternalDoctype in [10,12])) then
                begin
                   AQDocLine.next ;
                   Continue ;
                end;

            tblDocline.Append;
           if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' then
              TDataBaseDocumentRoutines.AddDocLink(AFromDocId,NewDocId,AQDocLine.FieldByName('WDOCLINEID').AsInteger,AQDocLine.FieldByName('WDOCLINEID').AsInteger);


            for j := 0 to AQDocLine.FieldCount - 1 do
              if  tblDocline.FindField(AQDocLine.Fields[j].FieldName) <> nil then
              begin
               if AQDocLine.Fields[j].FieldName='WDESCRIPTIONID' then
               begin
                  if AQDocLine.FindField('WLineTypeID').asinteger <> 91 then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=AQDocLine.Fields[j].value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsInteger := AddMessage(_ReadDescription(AQDocLine.Fields[j].AsInteger),True);
                end
                else
                // end [ 1371752 ] qoutation to invoice
                  if  AQDocLine.Fields[j].FieldName ='WDOCID' then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=tblDocHeaderWDocID.Value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsString:=AQDocLine.Fields[j].AsString;
              end;

              // correct tax
              tblDocline.Post;
              AQDocLine.Next;
          end;
           if (DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE')  then
           begin
          AQDocLine.SQL.Text := 'select * from DOCLINE_LINKED where WDocID='+ IntToStr(AFromDocId) +' order by WSortno';
          AQLinkeDDoc := TuniQuery.create(nil) ;
          AUpdLinkedDoc := TUniUpdateSql.create(nil) ;
          try
           AQLinkeDDoc.Connection := DMTCCoreLink.TheZConnection ;
           AQLinkeDDoc.SQL.Text := 'select * from DOCLINE_LINKED where WDocID=0' ;
           AQLinkeDDoc.UpdateObject := AUpdLinkedDoc ;

           TDatabaseTableRoutines.UpdateQuery(AQLinkeDDoc,'DOCLINE_LINKED',['WDOCLINKED_ID']);
           AQLinkeDDoc.open ;
          AQDocLine.open  ;
          AQDocLine.First;
          While not AQDocLine.Eof do
          begin


            AQLinkeDDoc.Append;
            for j := 0 to AQLinkeDDoc.FieldCount - 1 do
              if  AQLinkeDDoc.FindField(AQDocLine.Fields[j].FieldName) <> nil then
              begin
               if AQDocLine.Fields[j].FieldName='WDESCRIPTIONID' then
               begin

                    AQLinkeDDoc.FindField(AQDocLine.Fields[j].FieldName).Value:=AQDocLine.Fields[j].value

                end
                else
                // end [ 1371752 ] qoutation to invoice
                  if  AQDocLine.Fields[j].FieldName ='WDOCID' then
                    AQLinkeDDoc.FindField(AQDocLine.Fields[j].FieldName).Value:=tblDocHeaderWDocID.Value
                  else
                    AQLinkeDDoc.FindField(AQDocLine.Fields[j].FieldName).AsString:=AQDocLine.Fields[j].AsString;
              end;
             AQLinkeDDoc.fields[0].AsInteger := DMTCCoreLink.GetNewIdStr('GEN_STOCKLINKSALE') ;
              // correct tax
              AQLinkeDDoc.Post;
              AQDocLine.Next;
          end;
          finally
          AQLinkeDDoc.free  ;
          AUpdLinkedDoc.free  ;
          end;
         end;

          if AddMessageText <> '' then
          begin
              tblDocline.Append;
             // tblDoclineWStockID.Value := 0;
              tblDoclineWDocID.Value := tblDocHeaderWDocID.Value;
              tblDoclineWDocLineID.Value :=  AQDocLine.FieldCount;
              tblDocLineWSORTNO.AsInteger := AQDocLine.FieldCount;
              tblDoclineWLineTypeID.Value := 91 ;
              tblDoclineWDescriptionID.Value := AddMessage(AddMessageText);
              tblDocline.Post;
          end;
          tblDocline.close;
       finally
         AQDocLine.free;
       end;

       // Update Posted
       if UpdatePosted and not (OldType in [10,11,12,13]) then
       begin
         tblDocHeader.close ;
         tblDocHeader.SQL.Text := 'select * from dochead where WDocid=' + IntToStr(AFromDocId);
         tblDocHeader.open ;
         if not tblDocHeader.isempty then
         begin
           tblDocHeader.Edit;
           tblDocHeaderBRepeating.Value:=1;
           tblDocHeaderBPOSTED.Value:=1;
           tblDocHeader.Post;
         end;
       end;
         // lets offer to delete it.
         // todo : Translate
       // copy options
       dmDatabase.qGen.SQL.Text :=
       'insert into DOCLINEOPTIONS SELECT '+ DMTCCoreLink.GetGenUniSyntaxShort('DOCLINEOPTIONS') +' , '+ IntToStr(NewDocId)+', WLINEID, WITEMOPTIONVALUE1ID, WITEMOPTIONVALUE2ID, ' +
       ' WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID, WITEMOPTIONVALUE5ID, FEXTRAPRICE, FQTY, WDESCRIPTIONID FROM DOCLINEOPTIONS where Wdocid = ' + IntToStr(AFromDocId);
        dmDatabase.qGen.ExecSQL ;


          if DoDelete then
            begin
               DMTCCoreLink.ExecSql( 'update MULTIMEDIA set  WREFID=' + IntToStr(NewDocId) +' where STYPE = ' + QuotedStr('DOC') + '  and  WREFID = ' + IntToStr(AFromDocId) );
               DMTCCoreLink.ExecSql( 'insert into imp_link  (IMP_LINKID, IMP_SOURCEID, IMP_EXTID, WACCOUNTID, WDOCID, WSTOCKID, WCONTACTID, '+
               ' WEVENTID, WTAXID, WGROUPID) SELECT '+DMTCCoreLink.GetGenUniSyntaxShort('GEN_LINKID')+' , a.IMP_SOURCEID, a.IMP_EXTID, a.WACCOUNTID,'+IntToStr(NewDocId)+
               ',a.WSTOCKID, a.WCONTACTID, a.WEVENTID, a.WTAXID, a.WGROUPID FROM IMP_LINK a where a.WDOCID = ' +  IntToStr(AFromDocId));
            end else
            DMTCCoreLink.ExecSql('insert into MULTIMEDIA SELECT '+ DMTCCoreLink.GetGenUniSyntaxShort('GEN_MULTIM_ID') +' , a.STYPE, a.SGROUP, a.WREFID, a.SDESCRIPTION, a.SPATH, ' +
           ' a.SORGFILENAME, a.DFILEDATE, a.DSYSDATE,a.WSUBREF FROM MULTIMEDIA a where a.STYPE = ' + QuotedStr('DOC') + '  and a.WREFID = ' +IntToStr(AFromDocId))  ;

       if (DoDelete ) and not (OldType in [10,11,12,13]) then
       begin
          DMTCCoreLink.ExecSql('Delete from docline where wdocid ='+ IntToStr(AFromDocId));
          DMTCCoreLink.ExecSql('Delete from dochead where wdocid ='+ IntToStr(AFromDocId));
       end;
    end;

    TDataBaseDocumentRoutines.CleanupDochead(NewDocId);
  finally
    ASaveList.free ;
  end;
end;


function GetTextLang(MsgID : Integer) : String;
(* Generic Message Routine. *)
begin
  result := DMTCCoreLink.GetTextLang(MsgID) ;
end;
   // end language stuff

Procedure UpDateBankRecon(PymtID,RcptID:String);
Var
  OK:Boolean;
  AProgress :  TfmNewProgress ;
begin
 AProgress  :=  TfmNewProgress.create(nil) ;
 dmDatabase.tblBatch.DisableControls;
  dmDatabase.tblreconBank.DisableControls;
 try
  with dmDatabase do
  begin
  // tblTransaction.Open;
    ZQTransAction.sql.text := 'Select * from transact where WTransactionID = :trans' ;
   // tblreconBank.close ;
   // tblreconBank.Open ;


    tblreconBank.Filtered := false ;
    tblreconBank.Filter :=  'WLINKEDID = 0' ;

    tblreconBank.First;

    AProgress.initProgress('...',tblreconBank.RecordCount);
    While not tblreconBank.Eof do begin
      AProgress.SetProgress('',tblreconBank.RecNo);
   //  ShowMessage(DmDatabase.TblReconBankBRECONCILED.AsString);


     if (DmDatabase.TblReconBankSCONTRAACCOUNT.AsString = '1' ) and (DmDatabase.TblReconBankBRECONCILED.AsInteger =1) then
       begin
       ZQTransAction.Close ;
       ZQTransAction.Params[0].asinteger :=  DmDatabase.TblReconBankFCREDIT.AsInteger ;
       ZQTransAction.Open ;

       if not ZQTransAction.IsEmpty then
       begin
        ZQTransAction.edit;
        ZQTransActionBReconciled.Value:= 1;
        ZQTransAction.Post;
        tblreconBank.Edit ;
        TblReconBankWLINKEDID.AsInteger := 1 ;
        tblreconBank.Post ;
       end ;


      end ;

      tblreconBank.Next;

    end;

    tblreconBank.Filtered := true ;
//Pymt
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(PymtID),OK,False);
    if Not Ok then
    begin
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      tblreconBank.First;

      While not tblreconBank.Eof do begin
        if (tblreconBankSCONTRAACCOUNT.Asinteger = 0) and (tblreconBankFDEBIT.AsString=PymtID)then begin
          tblBatch.First;
          tblBatch.Locate('WLineID',TblReconBankWDOCID.AsInteger,[]);
          tblBatch.Edit;
          tblBatchBReconciled.Value:=tblreconBankBReconciled.Value;
          tblBatch.Post;
        end;
        tblreconBank.Next;
      end;
    end;
//Rcpt
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(RcptID),OK,False);
    if Not Ok then
    begin
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      tblreconBank.First;
      tblBatch.First;
      While not tblreconBank.Eof do begin
        if (tblreconBankSCONTRAACCOUNT.Asinteger =0) and (tblreconBankFDEBIT.AsString=RcptID)then begin
          tblBatch.First;
          tblBatch.Locate('WLineID',TblReconBankWDOCID.AsInteger,[]);
          tblBatch.Edit;
          tblBatchBReconciled.Value:=tblreconBankBReconciled.Value;
          tblBatch.Post;
        end;
        tblreconBank.Next;
      end;
    end;
  end;
  {Online Bank Recon}
  try
    if dmdatabase.CdsBankDnl.Active then
    begin
    //  dmdatabase.tblBankdnl.open;
      dmdatabase.CdsBankDnl.DisableControls;
      dmdatabase.CdsBankDnl.First;
      While not dmdatabase.CdsBankDnl.eof do
      begin
        dmDatabase.tblBankDnl.sql.text := 'Select * from  DNLBANKS where StransID=' + QuotedStr(dmdatabase.CdsBankDnlStransID.AsString) + ' and WlineID = ' + IntToStr(dmdatabase.CdsBankDnlWlineID.AsInteger) + ' and SACCOUNTCODE = ' + QuotedStr(dmdatabase.CdsBankDnlSACCOUNTCODE.AsString);
        dmDatabase.tblBankDnl.open ;
        if not dmdatabase.tblBankdnl.IsEmpty then
        begin
          dmdatabase.tblBankdnl.Edit;
          dmdatabase.tblBankDnlBReconciled.Value := Ord(dmdatabase.CdsBankDnlBReconciled.Value) ;
          dmdatabase.tblBankdnl.Post;
        end;
        dmDatabase.tblBankDnl.close ;
        dmdatabase.CdsBankDnl.Next;
      end;
      dmdatabase.CdsBankDnl.EnableControls;
      dmdatabase.tblBankdnl.Close;
    end;
  except end;
  finally
     AProgress.free ;
    dmDatabase.tblreconBank.EnableControls;
    dmDatabase.tblBatch.EnableControls;     
  end;
end;

Procedure LoadCompLogoInfo(Var CompLogo:TCompLogo);
begin
  dmDatabase.tblSysVars.Active;
  dmDatabase.tblSysVars.Active:=True;
  CompLogo.Visible := dmDatabase.tblSysVarsBUnitsExist.AsInteger = 1;
  CompLogo.STAXRegNo := dmDatabase.tblSysVarsSTAXRegNo.Value;
  CompLogo.SCompReg := dmDatabase.tblSysVarsSCompanyRegNo.Value;
  if CompLogo.Visible then
  begin
    CompLogo.SCompName := dmDatabase.tblSysVarsSCompanyName.Value;
    CompLogo.SAdd1  := dmDatabase.tblSysVarsSAddress1.Value;
    CompLogo.SAdd2  := dmDatabase.tblSysVarsSAddress2.Value;
    CompLogo.SAdd3 := dmDatabase.tblSysVarsSAddress3.Value;
    CompLogo.SAddCode := dmDatabase.tblSysVarsSPostCode.Value;
    CompLogo.STel :=  dmDatabase.tblSysVarsSPhoneNumber.Value;
    CompLogo.SFax := dmDatabase.tblSysVarsSFaxNumber.Value;
    CompLogo.SEmail := dmDatabase.tblSysVarsSEmailAddress.Value;
  end
  else
  begin
    CompLogo.SCompName := '';
    CompLogo.SAdd1  := '';
    CompLogo.SAdd2  := '';
    CompLogo.SAdd3 := '';
    CompLogo.SAddCode := '';
    CompLogo.STel :=  '';
    CompLogo.SFax := '';
    CompLogo.SEmail := '';
  end;
end;

Function LoadDocHead(DocID:Integer;Var Value:TDocHeadRec):Boolean;
Var
  HoldAcc,
  HoldH : boolean;
begin
  Result := False;
  HoldH:= dmDatabase.tblDocHeader.Active;
  dmDatabase.tblDocHeader.Open;
  if Not dmDatabase.tblDocHeader.Locate('WDocID',DocID,[])then exit;
  Result :=True;
  HoldAcc := dmDatabase.tblAccount.Active;
  dmDatabase.tblAccount.Active:=True;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblDocHeaderWAccountID.Value,[]);
  Value.SACCOUNTCODE := dmDatabase.tblAccountSACCOUNTCODE.Text;
  Value.SACCOUNTDesc := dmDatabase.tblAccountSDescription.Text;
  dmDatabase.tblAccount.Active :=   HoldAcc ;
  Value.SDocNo := dmDatabase.tblDocHeaderSDocNo.Value;
  Value.SRef := dmDatabase.tblDocHeaderSReference.Value;
  Value.WtypeID := dmDatabase.tblDocHeaderWTypeID.Value;
  Value.SdelAdr1 := _ReadDescription( dmDatabase.tblDocHeaderWDelAddress1ID.Value);
  Value.SdelAdr2 := _ReadDescription( dmDatabase.tblDocHeaderWDelAddress2ID.Value);
  Value.SdelAdr3 := _ReadDescription( dmDatabase.tblDocHeaderWDelAddress3ID.Value);
  Value.SdelCode := _ReadDescription( dmDatabase.tblDocHeaderWDelCodeID.Value);
  Value.BPosted := dmDatabase.tblDocHeaderBPosted.AsInteger = 1;
  VAlue.SMess1 := _ReadDescription( dmDatabase.tblDocHeaderWMessage1ID.Value);
  VAlue.SMess2 := _ReadDescription( dmDatabase.tblDocHeaderWMessage2ID.Value);
  VAlue.SMess3 := _ReadDescription( dmDatabase.tblDocHeaderWMessage3ID.Value);
  VAlue.DDate := dmDatabase.tblDocHeaderDDate.Value;
  VAlue.SDate := FormatDateTime('dd/mm/yyyy', dmDatabase.tblDocHeaderDDate.Value);
  VAlue.SPost1 := _ReadDescription( dmDatabase.tblDocHeaderWPostal1ID.Value);
  VAlue.SPost2 := _ReadDescription( dmDatabase.tblDocHeaderWPostal2ID.Value);
  VAlue.SPost3 := _ReadDescription( dmDatabase.tblDocHeaderWPostal3ID.Value);
  VAlue.SPostCode := _ReadDescription( dmDatabase.tblDocHeaderWPostalCodeID.Value);
  VAlue.STAXRef :=  TDatabaseDebtorCreditorRoutines.GetTaxRef(dmDatabase.tblDocHeaderWAccountID.Value);
  LoadCompLogoInfo(Value.CompLogo);
  dmDatabase.tblAccount.Active := HoldAcc;
  dmDatabase.tblDocHeader.Active :=   HoldH;
end;

Function GetsplMess(MessID:Integer):String;
begin
  Result :=_ReadDescription(MessID);
end;

procedure GetContactInfo(AContact : Integer;Var aName ,Telephone1,Telephone2 ,Fax , SEmail  : String ) ;
begin
  dmDatabase.QContacts.SQL.Text := 'Select * from contacts where RecordID = ' + intToStr(AContact);
  dmDatabase.QContacts.open ;
  aName := dmDatabase.QContactsLastName.AsString ;
  Telephone1 := dmDatabase.QContactsPhone1.AsString ;
  Telephone2 := dmDatabase.QContactsPhone2.AsString ;
  Fax        := dmDatabase.QContactsPhone3.AsString ;
  SEmail     := dmDatabase.QContactsEMail.AsString ;
  dmDatabase.QContacts.close ;
end ;


Function  GetContactName(AContact : Integer ): String ;
begin
  dmDatabase.QContacts.SQL.Text := 'Select * from contacts where RecordID = ' + intToStr(AContact);
  dmDatabase.QContacts.open ;
  result := Trim(Trim(dmDatabase.QContactsTITLE.AsString + ' ' +  dmDatabase.QContactsFIRSTNAME.AsString) + ' '  + dmDatabase.QContactsLastName.AsString) ;
  dmDatabase.QContacts.close ;
end ;

Function  GetAddGetContact( aName ,Telephone1,Telephone2 ,Fax , SEmail  : String;AccountId : Integer ): Integer;
begin
   result := 0 ;
   if trim(aName) = '' then exit ;

   dmDatabase.QContacts.SQL.Text := 'Select * from contacts where Lastname = :Lastname and (Phone1 = :Telephone1 or ' +
                                    'Phone1 is null ) and  (Phone2 = :Telephone2 or ' +
                                    'Phone2 is null ) and  (Phone3 = :Telephone3 or ' +
                                    'Phone3 is null ) and (Email = :Email or ' +
                                    'Email is null )' ;
     dmDatabase.QContacts.ParamByName('Lastname').AsString := trim(aName) ;
     dmDatabase.QContacts.ParamByName('Telephone1').AsString := trim(Telephone1) ;
     dmDatabase.QContacts.ParamByName('Telephone2').AsString := trim(Telephone2) ;
     dmDatabase.QContacts.ParamByName('Telephone3').AsString := Trim(Fax) ;
     dmDatabase.QContacts.ParamByName('Email').AsString := trim(SEmail) ;
     dmDatabase.QContacts.open ;
   if dmDatabase.QContacts.IsEmpty then
     begin
        dmDatabase.QContacts.Insert ;
        dmDatabase.QContactsLastName.AsString :=  aName ;
        dmDatabase.QContactsPhone1.AsString :=  Telephone1 ;
        dmDatabase.QContactsPhone2.AsString :=  Telephone2 ;
        dmDatabase.QContactsPhone3.AsString :=  Fax ;
        dmDatabase.QContactsEMail.AsString :=  SEmail ;
        dmDatabase.QContacts.Post ;

        Result := dmDatabase.QContactsRecordID.AsInteger ;

     end else
     Result := dmDatabase.QContactsRecordID.AsInteger ;
     dmDatabase.QContacts.close ;
 
   if AccountId <> 0 then
      begin
         dmDatabase.QadressPerAccount.sql.text := 'Select * from contacts,AddressPerAccount where Contacts.RecordID = AddressPerAccount.WContactId and  AddressPerAccount.WaccountId = ' + IntToStr(AccountId);
         dmDatabase.QadressPerAccount.open;
         if not dmDatabase.QadressPerAccount.locate('WCONTACTID', Result,[]) then
           begin
             dmDatabase.QadressPerAccount.Insert ;
             dmDatabase.QadressPerAccountWACCOUNTID.AsInteger := AccountId ;
             dmDatabase.QadressPerAccountWCONTACTID.AsInteger := Result ;
             dmDatabase.QadressPerAccount.post ;
           end;
        dmDatabase.QadressPerAccount.close ;
      end;
end;
Function  GetAddUnitId(aUnitStr:String;Add:Boolean=False):Integer;
Var
  Hold:Boolean;
  LocalName : String ;
begin
  Result:=0;
  if aUnitStr = '' then Exit;
  LocalName:=Trim(aUnitStr);
  Result:=0;

  If LocalName='' then Exit;
  Hold := dmDatabase.tblUnit.Active;
  dmDatabase.tblUnit.Open;
  // make sure its the max lengt as the locate does not like longer fields
  LocalName := Copy(LocalName,1,dmDatabase.tblUnitSDescription.Size);

   if dmDatabase.tblUnit.Locate('SDescription',LocalName,[LoCaseInsensitive]) then
       Result := dmDatabase.tblUnitWUnitID.AsInteger
  else
  begin
    if Add then
    begin
      dmDatabase.tblUnit.Append;
      dmDatabase.tblUnitSDescription.Value := LocalName;
      dmDatabase.tblUnit.Post;
      Result := dmDatabase.tblUnitWUnitID.value;
    end
  end;
  DmDatabase.tblUnit.Active := Hold ;
end;
 

Procedure LoadSalesPersons(aList:TStrings);
Var
  Hold:Boolean;
begin
  aList.Clear;
  Hold:=dmDatabase.tblGroups.Active;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = ''31''';
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.First;
  while not dmDatabase.tblGroups.EOF do
  begin
    aList.Add(dmDatabase.tblGroupsSDescription.Value);
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblGroups.Active := Hold;
end;

Procedure GetMainColorVars;
{********
         Read color ID in SysVars
         and Save as Main and Panel Color
********}
Var
  HoldActive:Boolean;
  R,B,G:Integer;
  Procedure GetCLassicMain;
  Var
   R1,B1,G1:String;
  begin
   R1 := Copy(CLassicColor,1,3);
   G1 := Copy(CLassicColor,5,3);
   B1 := Copy(CLassicColor,8,3);
   R := StrToIntDEf(R1,197);
   G := StrToIntDEf(B1,193);
   B := StrToIntDEf(G1,255);
   {197,193,225}
  end;
begin
  try

    HoldActive := dmDatabase.tblSysVars.Active;
    if dmDatabase.tblSysVars.Connection.Connected then
    begin
      dmDatabase.tblSysVars.Open;
      Colour:= dmDatabase.tblSysVarsWColourID.Value;
    end;
    dmDatabase.tblSysVars.Active := HoldActive;
  except end;
  if Colour = 41 then // Brilliant
  begin
    MainColor := RGB(255,153,51);
    MainPanelColor := RGB(222,255,255);
  end else
  if Colour = 42 then  // Pastel
  begin
    MainColor :=  RGB(204,204,255);
    MainPanelColor := RGB(255,219,157);
  end else
  if Colour = 43 then //New SA
  begin
    MainColor :=  RGB(0,153,0);
    MainPanelColor := RGB(255,255,0);
  end else
  if Colour = 44 then //PinkSoft
  begin
    MainColor := RGB(153,204,255) ;
    MainPanelColor := RGB(255,204,255);
  end else
  if Colour = 45 then //WindowsDefault
  begin
    MainColor := clBtnFace;
    MainPanelColor := clBtnFace;
  end else
  if Colour = 46 then
  begin
    MainColor := clWhite;
    MainPanelColor := clWhite;
  end else
  // Classic
  begin
    MainColor :=  clSilver;
    GetCLassicMain;
//    MainPanelColor := RGB(197,193,225);
    MainPanelColor := RGB(R,G,B);
  end;

end;



Procedure LoadPrintOutModes(cbComboPrint:TComboBox);
Begin
  cbComboPrint.Items.Clear;
  cbComboPrint.Items.Add(GetTextLang(985));{'Screen'}
  cbComboPrint.Items.Add(GetTextLang(986));{'Printer'}
  cbComboPrint.Items.Add(GetTextLang(120));{'File'}
  cbComboPrint.Items.Add(GetTextLang(191));{'E-mail'}
  cbComboPrint.Items.Add(GetTextLang(189));{'Fax'}
  cbComboPrint.ItemIndex:=SaveOutput;
end;
{
procedure LoadDocTypes(AList : TStrings;AddAll,AddQuoteOrder:Boolean);
Var
  i:Byte;
begin
  AList.clear ;
  if AddAll then
  AList.addObject(GetTextLang(1098),TObject(0));
     // it's allows to remove Quote and Orde from the Doc List
  dmDatabase.tblType.SQL.Text := 'select * from v_types TYPES where WTypeId in (10,11,12,13,14,15) and WTypeParent = 1 order by WTypeID';
  dmDatabase.tblType.Open;
  // order
  if AddQuoteOrder then
  begin
  dmDatabase.tblType.Locate('WTypeID',15,[]);
  AList.addObject(Trim( dmDatabase.tblTypeSDescription.Value),TObject(15)) ;
  end;
  // purchase
  dmDatabase.tblType.Locate('WTypeID',12,[]);
  AList.addObject(Trim(dmDatabase.tblTypeSDescription.Value),TObject(12)) ;
  // return note
  dmDatabase.tblType.Locate('WTypeID',13,[]);
  AList.addObject(Trim(dmDatabase.tblTypeSDescription.Value),TObject(13)) ;

  // Quote
  if AddQuoteOrder then
  begin
  dmDatabase.tblType.Locate('WTypeID',14,[]);
  AList.addObject(Trim(dmDatabase.tblTypeSDescription.Value),TObject(14)) ;
  end;
  // invoice
  dmDatabase.tblType.Locate('WTypeID',10,[]);
  AList.addObject(Trim(dmDatabase.tblTypeSDescription.Value),TObject(10)) ;
  // creditnote
  dmDatabase.tblType.Locate('WTypeID',11,[]);
  AList.addObject(Trim(dmDatabase.tblTypeSDescription.Value),TObject(11)) ;
  if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
  begin
   // new types
  if not (DMTCCoreLink.ExtraOptions.Values['STOCKDOCDECREORD'] = 'TRUE') then
   AList.addObject('Stock out',TObject(16)) ;
   AList.addObject('Stock in',TObject(17)) ;
  end;

  dmDatabase.tblType.Close;
end;
       }
procedure ClearLookupModalType ;
begin
    FmLookup.IsShowForm := false ;
end;
function  CallLookup(OldValue : Integer; Kind : Integer;FreeLimit : String ='';ForceShowList : Boolean = True;Parent : TWincontrol = nil;ForCreditor : Integer = 0) : String;
begin
  Result:=CallLookup('',Kind,OldValue,FreeLimit,ForceShowList,Parent,ForCreditor );
end;

function CallLookup(OldValue : String; Kind : Integer;OldID : integer = 0 ;FreeLimit : String ='';ForceShowList : Boolean = True;Parent : TWincontrol = nil;ForCreditor : Integer = 0) : String;
{
  This function Can not return 'NEW', 'ESC' or '' to get this values
  Check ReturnLookup string-variable (Sylvain)

  Calls up a lookup box. Oldvalue is what is already
  stored in the caller's text field.
  Kind can be :

  0 : All the accounts
  1 : All the accounts, excluding debtors and creditors
  2 : Just the general ledger accounts
  3 : Just the debtors
  4 : Just the creditors
  5 : Just the bank accounts
  6 : Just the tax accounts
  7 : All the stock
  8 : All the periods in this year
  9 : All the periods in last year
  10: All the accounts excluding debtor and creditor control and retained earnings.
           and no tax acccounts  '
  11: Just the tax accounts without No Tax
  12: All Contact
  13 : Same With 2 but plus All Tax And Excluding No Tax
  15 : Account Reporting groupe 1
  16 : All the stock minus the Purchaes items and not disabled items with new stock selection screen.
  17 : All the stock minus the bom and Sales items and not disabled items new stock selection screen.
  18 : All the stock with new stock selection screen.
  19 : All periods last and this year
}
var
  ID  , DoEnabledForPurchase   : Integer;
  aStockRec:TStockRec ;
  Sender: TObject;
begin
  FmLookup.IsShowForm := False ;
  DoEnabledForPurchase := StrToIntDef(VarToStr(DMTCCoreLink.ReadNwReportOp('STOCKDISABLEHIDE',1)),1) ;
  Sender := nil;
  fmLookup.Parent := Parent ;
  if FmLookup.Parent <> nil then
     FmLookup.Align := alClient ;
  fmLookup.hide ;
  case Kind of
  0 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('X'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
     ReturnID:=0;
     ReturnLookup:='';
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(1002),'ALL',tcstALL,tcltAccount,id,0,FreeLimit);
    // fmLookup.SelectLookup(Sender, GetTextLang(1002){'Accounts'}, 'ALL', 'ACCOUNT', ID,FreeLimit);
  end;
  1 :
  begin
       id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('X'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;

    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(1002),'ALL',tcstGLTHREE,tcltAccount,id,0,FreeLimit);

   // fmLookup.SelectLookup(Sender, GetTextLang(1002){'Accounts'}, 'GLTHREE', 'ACCOUNT', ID,FreeLimit);
  end;
  2,13 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('X'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;


    if Kind=13 then
     OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(1002),'ALL',tcstGLANDTAX,tcltAccount,id,0,FreeLimit)
      //fmLookup.SelectLookup(Sender, GetTextLang(1002){'Accounts'}, 'GLANDTAX', 'ACCOUNT', ID,FreeLimit)
    else
     OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(1002),'ALL',tcstGLONE,tcltAccount,id,0,FreeLimit);
     //  fmLookup.SelectLookup(Sender, GetTextLang(1002){'Accounts'}, 'GLONE', 'ACCOUNT', ID,FreeLimit);
  end;
  3 :
  begin
       id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('D'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(160),'DEB',tcstDEB,tcltAccount,id,0,FreeLimit);

   // fmLookup.SelectLookup(Sender, GetTextLang(160){'Debtors'}, 'DEB', 'ACCOUNT', ID,FreeLimit);
  end;
  4 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('C'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(161),'CRED',tcstCRED,tcltAccount,id,0,FreeLimit);
    // fmLookup.SelectLookup(Sender, GetTextLang(161){'Creditors'}, 'CRED', 'ACCOUNT', ID,FreeLimit);
  end;
  5 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('B'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    // fmLookup.SelectLookup(Sender, GetTextLang(183){'Bank Accounts'}, 'BANK', 'ACCOUNT', ID,FreeLimit);
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(183),'BANK',tcstBANK,tcltAccount,id,0,FreeLimit);

  end;
  6 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('T'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(254),'TAX',tcstTAX,tcltAccount,id,0,FreeLimit);
    //fmLookup.SelectLookup(Sender,GetTextLang(254){ 'Tax Accounts'}, 'TAX', 'ACCOUNT', ID,FreeLimit);
    if ReturnLookup='' then
      OldValue :=' ';
  end;
  7 :
  begin
    if OldValue <> '' then
    begin
      id := TDataBaseStockRoutines.GetStockID(OldValue);
    end
    else
      ID := OldID ;

    aStockRec.WStockID := ID ;
    aStockRec.SSTOCKCODE := VarToStr(OpenSqlAndGetFirtsColumnValue('Select SStockCode from Stock where WStockId =' + IntToStr(aStockRec.WStockID)));

    newlookup.SelectLookup(aStockRec,true,FreeLimit,ForceShowList);
    if (ReturnLookup <> 'NEW') and (ReturnLookup <> '') then
    begin
    returnID := aStockRec.WStockID ;
    ReturnLookup := aStockRec.SSTOCKCODE ;
    end;
   { dmDataBase.tblStock.filter := '' ;

    fmLookup.SelectLookup(Sender, GetTextLang(257)// 'Stock Items'
    , '', 'STOCK', ID);  }
  end;
  8 :begin
       ID := str2Int(oldValue);
       if ID=0 then ID:=1;
       oldValue:=intToStr(ID);
       fmLookup.SelectLookup(Sender, GetTextLang(603){'This Year'}, 'THISYEAR', 'PERIODS', ID,FreeLimit);
     end;
  9 :begin
       ID := str2Int(oldValue);
       if ID=0 then ID:=1;
       oldValue:=intToStr(ID);
       fmLookup.SelectLookup(Sender, GetTextLang(604){'Last Year'}, 'LASTYEAR', 'PERIODS', ID,FreeLimit);
     end;
  10:
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('X' + GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    fmLookup.SelectLookup(Sender,GetTextLang(1002){'Accounts'}, 'BATCH', 'ACCOUNT', ID,FreeLimit);
  end;
  11 :
  begin
    id := OldID ;
    if OldValue <> '' then
    begin
      id :=  TDataBaseRoutines.GetAccountIDFromCode('T'+GetMainAccountCode(OldValue)+ GetSubAccountCode(OldValue)) ;
    end;
    OSFGetLookupValue(ReturnLookup,ReturnID,GetTextLang(254),'NTAX',tcstNTAX,tcltAccount,id,0,FreeLimit);
    //fmLookup.SelectLookup(Sender, GetTextLang(254){'Tax Accounts'}, 'NTAX', 'ACCOUNT', ID,FreeLimit);
  end;
  12:Begin
      if OldValue = '' then
        ID := 1
      else
        ID := StrToIntDef(OldValue,0);
      fmLookup.SelectLookup(Sender,GetTextLang(1003){'Select Contact'}, '', 'CONTACT', ID,FreeLimit);
     end;
  15:Begin // Account Reporting Group1
      dmDatabase.tblGroups.Filtered := False;
      dmDatabase.tblGroups.Filter := 'WGroupTypeID=20';
      dmDatabase.tblGroups.Filtered := True;
      if OldValue = '' then
        ID := dmDatabase.tblGroupsWGroupID.Value
      else
        ID := StrToIntDef(OldValue,0);
      fmLookup.SelectLookup(Sender, GetTextLang(1004){'Select Groups'}, 'ACCGROUP1', 'GROUPS', ID,FreeLimit);
     end;
  16 :
  begin
 // 16 : All the stock minus the Purchaes items
    fmPosLookup.DefSupplier := 0 ;

    if DoEnabledForPurchase = 1 then

    fmPosLookup.ExtraFilter := '(WStockTypeId <> 3) and (WStockTypeId <> 5) and (BDisabled = 0 or BDisabled is null )'
    else
    fmPosLookup.ExtraFilter := '(WStockTypeId <> 3) and (WStockTypeId <> 5) ' ;
    fmPosLookup.ShowHideCredlist(False);
    fmPosLookup.ZQStock.filter :=fmPosLookup.ExtraFilter ;
    dmDataBase.tblStock.filtered := true ;
      if OldValue <> '' then
    begin
      id := TDataBaseStockRoutines.GetStockID(OldValue);
    end
    else
      ID := OldID ;
    aStockRec.WStockID := ID ;
    aStockRec.SSTOCKCODE := VarToStr(OpenSqlAndGetFirtsColumnValue('Select SStockCode from Stock where WStockId =' + IntToStr(aStockRec.WStockID)));

    newlookup.SelectLookup(aStockRec,true,FreeLimit,ForceShowList);
    if (ReturnLookup <> 'NEW') and (ReturnLookup <> 'ESC') and (ReturnLookup <> '') then
    begin
    returnID := aStockRec.WStockID ;
    ReturnLookup := aStockRec.SSTOCKCODE ;
    end;
    dmDataBase.tblStock.filter := '' ;
  end;
  17 :
  begin
  //17 : All the stock minus the bom and Sales items
   fmPosLookup.DefSupplier := 0 ;



   if DoEnabledForPurchase = 1 then                       //(WStockTypeId <> 1) and
   fmPosLookup.ExtraFilter := '(WStockTypeId <> 2) and   (WStockTypeId <> 4)and (BDisabled = 0  or BDisabled is null )'
   else
   fmPosLookup.ExtraFilter := '(WStockTypeId <> 2) and (WStockTypeId <> 4)' ;

   fmPosLookup.ZQStock.filter :=fmPosLookup.ExtraFilter ;
   fmPosLookup.ShowHideCredlist(True);
   if fmPosLookup.LimitStockToCreditor then
   if ForCreditor <> 0 then
     begin
      fmPosLookup.DefSupplier := ForCreditor ;
      fmPosLookup.ZQStock.filter := fmPosLookup.ZQStock.filter + ' and (WSUPPLIER1ID = ' + IntToStr(ForCreditor) + ' or WSUPPLIER2ID = ' + IntToStr(ForCreditor) + ' or WSUPPLIER1ID = 0 or WSUPPLIER1ID is null)' ;
    end;


   dmDataBase.tblStock.filtered := true ;
      if OldValue <> '' then
    begin
      id := TDataBaseStockRoutines.GetStockID(OldValue);
    end
    else
      ID := OldID ;


    aStockRec.WStockID := ID ;
    newlookup.SelectLookup(aStockRec,true,FreeLimit,ForceShowList);
    if (ReturnLookup <> 'NEW') and (ReturnLookup <> 'ESC') and (ReturnLookup <> '') then
    begin
    returnID := aStockRec.WStockID ;
    ReturnLookup := aStockRec.SSTOCKCODE ;
    end;
    dmDataBase.tblStock.filter := '' ;

  end;
  18 :
  begin
  //17 : All the stock minus the bom and Sales items
   dmDataBase.tblStock.filter := '' ;
   fmPosLookup.ZQStock.filter := '' ;   

    if OldValue <> '' then
    begin
      id := TDataBaseStockRoutines.GetStockID(OldValue);
    end
    else
      ID := OldID ;

    aStockRec.WStockID := ID ;
    newlookup.SelectLookup(aStockRec,false,FreeLimit,ForceShowList);
    if (ReturnLookup <> 'NEW') and (ReturnLookup <> '') then
    begin
    returnID := aStockRec.WStockID ;
    ReturnLookup := aStockRec.SSTOCKCODE ;
    end;
  end;
  19 :begin
       ID := str2Int(oldValue);
       if ID=0 then ID:=1;
       oldValue:=intToStr(ID);
       fmLookup.SelectLookup(Sender, GetTextLang(3012){'Last Year'}, 'ALLYEAR', 'PERIODS', ID,FreeLimit);
     end;
  end;//case

  if (ReturnLookup = 'NEW')or (ReturnLookup = '-') or (ReturnLookup = '') OR (ReturnLookup='ESC') then
    CallLookup := OldValue
  else
    begin
    CallLookup := ReturnLookup;

    end ;
end;

function  ShowQuestionMessage(AQuestion : String) : word ;
begin
  result := OSFMessageDlg(AQuestion,mtConfirmation,[mbyes,mbno],0) ;
end;

Function OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
      AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false;FontStr : String = '' ): Word;
begin
 result := umsgbox.OSFMessageDlg(Msg,AType,AButtons,HelpCtx,AsMemo,FontStr);
end;







Procedure  CheckupDocNumber(UserID,DocType:Integer;Number:String);
Var
  H:Boolean;
  SCur:String;
begin
  H := dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Open;
  SCur :=  TDataBaseDocumentRoutines.GetDocNextNum(DocType,true);
  // lets check if the prefix is the same (first 3 chars)
  // else the Invoice will be updated by POS
  if copy(SCur,1,3) <> copy(Number,1,3) then exit ;

  if ((SCur<Number) OR (SCur='')) AND dmDatabase.tblUser.Locate('WUserID', UserID, []) then
  begin
    dmDatabase.tblUser.Edit;
    try
    Case DocType of
      11:dmDatabase.tblUserSCreditNoteNextNumber.Value:=Number;
      12:dmDatabase.tblUserSPurchaseNextNumber.Value:=Number;
      13:dmDatabase.tblUserSGoodsReturnedNextNumber.Value:=Number;
      14:dmDatabase.tblUserSQuoteNextNumber.Value:=Number;
      15:dmDatabase.tblUserSOrderNextNumber.Value:=Number;
    else
      dmDatabase.tblUserSInvoiceNextNumber.Value:=Number;
    end;
    except
      dmDatabase.tblUser.Cancel ;
    end;
    dmDatabase.tblUser.Post;
  end;
   dmDatabase.tblUser.Active := H;
end;

Function CheckBackOrder(vAccountID: Integer):Boolean;
begin
 Result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from backord where WACCOUNTID = ' + IntToStr(vAccountID))) <> '0' ;
end;

Function GetViewMask(Amt:Byte):String ;
Var
  Digits : Byte;
  i : Integer ;
  ThousendSep : String ;
Begin
  if Amt=1 then
  begin
      Digits := dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryDecQty ;
  end else if Amt= 5  then
    begin
      Result :='##0.' ;
      exit ;
    end
  else if Amt = 6  then
    begin
      Result :='% ##0.' ;
      exit ;
    end
  else if Amt = 7  then
    begin
      Result :='##0.##' ;
      exit ;
    end
  else if Amt = 8  then
    begin
      Digits:= dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimalsShow ;
     if Digits<=0 then
      Digits := 2 ;
      Result :='0.00' ;
      for i := 3  to Digits do
         Result := Result  + '#' ;
      exit ;
    end


  else
  begin
    Digits:= dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals ;
    if Digits<=0 then
      Digits := 2
    else
    if Digits>12 then
      Digits :=12 ;
  end;
  
  ThousendSep :=  FormatSettings.ThousandSeparator ;
  if ThousendSep <> '' then
   begin

    if dmDatabase.SetOfBooksPropertys.DataParameter.BUseCurSign then
            Result :=CurrencyString  + ' ####,###,###,##0.'
           else
             Result := ' ####,###,###,##0.' ;
   end else
   begin
      if dmDatabase.SetOfBooksPropertys.DataParameter.BUseCurSign then
        Result :=CurrencyString  + ' ############0.'
       else
         Result :='############0.';
    end;
  Result := Result + Copy('000000000000',1,Digits);
 // Result := Result + '######';
end;


Function GetDefaultDocPaperID(DocTypeID:integer):Integer;
Var
  HoldActive:Boolean;
begin
 { with dmDatabase do begin
    HoldActive := tblSysVars.Active;
    if not HoldActive then
      tblSysVars.Open;
    case DocTypeId of
     10:Result:=tblSysvarsWInvoicePaperID.Value;
     11:Result:=tblSysvarsWCreditNotePaperID.Value;
     12:Result:=tblSysvarsWPurchasePaperID.Value;
     13:Result:=tblSysvarsWGoodsReturnedPaperID.Value;
     14:Result:=tblSysvarsWQuotePaperID.Value;
     15:Result:=tblSysvarsWOrderPaperID.Value;
     17:Result:=tblSysvarsWStatementPaperID.Value;
     18:Result:=tblSysvarsWRemittancePaperID.Value;
    else
      Result:=51;
    end;
    tblSysVars.Active := HoldActive;
  end;
  if (Result<50) or (Result>54) then
  }
   Result:=51;
end;

Procedure SetGrSQlLine(WhereClause : String);
begin
  dmDatabase.qrPrnDocLines.Close;
  dmDatabase.qrPrnDocLines.SQL.Text:=
  ' Select Stock.*,DocLine.* '+
  ' From DocLine left join Stock on DocLine.WStockID= Stock.WStockID'+
  ' Where 1 = 1 ' +
  WhereClause +
  ' Order by Stock.WReportingGroup1ID, Stock.WReportingGroup2ID, '+
  ' Stock.SDescription  ';
end;

Procedure SetSQlLine(WhereClause : String);
begin
  dmDatabase.qrPrnDocLines.Close;
  dmDatabase.qrPrnDocLines.SQL.Text:=
  ' Select Stock.*,DocLine.* '+
  ' From DocLine left join Stock on DocLine.WStockID= Stock.WStockID'+
  ' Where 1 = 1 ' +
  WhereClause +
  ' Order by DocLine.WSortno,DocLine.WDocLineID ';
end;

procedure SetSysvars;
begin
    with dmdatabase do
    begin
    tblSysVars.Open;
    if tblSysVars.IsEmpty then
    tblSysVars.Append
    else tblSysVars.edit ;
    tblSysVarsSACCOUNTReportName1.AsString := GetTextLang(1323);// 'Rep Group 1';
    tblSysVarsSACCOUNTReportName2.AsString := GetTextLang(1325);// 'Rep Group 2';
    tblSysVarsSDebtorReportName1.AsString := GetTextLang(1323);// 'Rep Group 1';
    tblSysVarsSDebtorReportName2.AsString := GetTextLang(1325);// 'Rep Group 2';
    tblSysVarsSCreditorReportName1.AsString := GetTextLang(1323);// 'Rep Group 1';
    tblSysVarsSCreditorReportName2.AsString := GetTextLang(1325);// 'Rep Group 2';
    tblSysVarsSStockReportName1.AsString := GetTextLang(1323);// 'Rep Group 1';
    tblSysVarsSStockReportName2.AsString := GetTextLang(1325);// 'Rep Group 2';
    tblSysVarsSDocumentReportName1.AsString := GetTextLang(1323);// 'Rep Group 1';
    tblSysVarsSDocumentReportName2.AsString := GetTextLang(1325);// 'Rep Group 2';
    tblSysVars.fieldbyname('BUseAvgCost').AsInteger:=1;
    tblSysVars.fieldbyname('BPrnStatementLogo').AsInteger:=1;
    tblSysVars.fieldbyname('DTLastUseTime').AsDateTime :=Now;
    tblSysVars.fieldbyname('BServicePreprinted').AsInteger := 0;
    // PaperID
    tblSysvarsWInvoicePaperID.AsInteger:=51;
    tblSysvarsWCreditNotePaperID.AsInteger:=51;
    tblSysvarsWPurchasePaperID.AsInteger:=51;
    tblSysvarsWGoodsReturnedPaperID.AsInteger:=51;
    tblSysvarsWQuotePaperID.AsInteger:=51;
    tblSysvarsWOrderPaperID.AsInteger:=51;
    tblSysvarsWStatementPaperID.AsInteger:=51;
    tblSysvarsWRemittancePaperID.AsInteger:=51;
    //and selling prices
    tblSysVarsSSellingPriceName1.AsString := GetTextLang(216);//'Selling Price 1';
    tblSysVarsSSellingPriceName2.AsString := GetTextLang(217);//'Selling Price 2';
    tblSysVarsSSellingPriceName3.AsString := GetTextLang(218);//'Selling Price 3';
    // Must Change for each Version
    tblSysVarsWVersion.Value := OSFDatabaseversion ;
    // Set Doc Heading
    tblSysVarsSInvoiceHeading.AsString:= GetTextLang(750);// 'Tax Invoice No';
    tblSysVarsSCreditNoteHeading.AsString:= GetTextLang(299);//'Credit Note No';
    tblSysVarsSPurchaseHeading.AsString:='GRV No';
    tblSysVarsSGoodsReturnedHeading.AsString:='Goods Returned No';
    tblSysVarsSQuoteHeading.AsString:='Quote No';
    tblSysVarsSOrderHeading.AsString:='Order No';
    tblSysVars.Post;
    tblSysVars.Close;
    end;
end;
procedure SetDefaults;
{

  This procedure clears all the tables in a set
  of books and then adds back the defaults.
  *This should only be called by CreateBooks or Import*

}
begin
  if not dmDatabase.ZMainConnection.Connected then exit ;
  with dmDatabase do
  begin
   // Why do it 2 times i gess the last time just counts ?
    ClearTable(tblGroups.TableName);
    tblGroups.Open;
    tblGroups.Append;
    tblGroupsWGROUPID.AsInteger := 0 ;
    tblGroupsSDESCRIPTION.AsString := 'No group' ;
    tblGroups.Post ;
    tblGroups.Close;
    ClearTable(tblAbreviations.TableName);
    tblAccount.Close;    

    ClearTable(tblAccount.TableName);
    //create the no tax account entry
    tblAccount.Open;
    tblAccount.Append;
    tblAccountWAccountTypeID.Value := 4;
    tblAccountSDescription.Value := 'Empty account';
    tblAccountWREPORTINGGROUP1ID.AsInteger := 0 ;
    tblAccountWREPORTINGGROUP2ID.AsInteger := 0 ;
    tblAccountWAccountID.Value := 0;
    tblAccount.Post;
    tblAccount.Close;
    ClearTable(tblBackOrder.TableName);
    ClearTable(tblBank.TableName);
    ClearTable(tblBatchControl.TableName);
  //  ClearTable(tblBatchTypes.TableName);
    ClearTable(tblContacts.TableName);
    ClearTable(tblCreditor.TableName);
   // ClearTable(tblCurrency.TableName);
    ClearTable(tblDebtor.TableName);
    ClearTable('DocHead');
    ClearTable('DocLine');
    //add the "unallocated" group
    // TODO :Translate
    ClearTable('messages');
    ExecSql('INSERT INTO MESSAGES VALUES (0,'+QuotedStr('')+','+QuotedStr('')+')');
    ClearTable(tblPeriods.TableName);
    ClearTable(tblRepCols.TableName);
    ClearTable(tblRepeatingDocs.TableName);
    ClearTable(tblRepeatingBatch.TableName);
    ClearTable(tblRepHead.TableName);
    ClearTable(tblRepLine.TableName);
    ClearTable(tblReportingOptions.TableName);
    tblReportingOptions.Open;
    tblReportingOptions.Edit;
    tblReportingOptions.FieldByName('SDebtorAgeRangeName0').AsString := GetTextLang(1856); //  'Current';
    tblReportingOptions.FieldByName('SDebtorAgeRangeName1').AsString := GetTextLang(1857); // '30 Days';
    tblReportingOptions.FieldByName('SDebtorAgeRangeName2').AsString := GetTextLang(1858); //'60 Days';
    tblReportingOptions.FieldByName('SDebtorAgeRangeName3').AsString := GetTextLang(1859); //'90 Days';
    tblReportingOptions.FieldByName('WDebtorAgeMonth1').AsInteger := 1;
    tblReportingOptions.fieldByname('WDebtorAgeMonth2').AsInteger := 1;
    tblReportingOptions.fieldByName('WDebtorAgeMonth3').AsInteger := 1;
    tblReportingOptions.fieldByName('SDebtStatementAgeName0').AsString := GetTextLang(1856); //  'Current';
    tblReportingOptions.fieldByName('SDebtStatementAgeName1').AsString := GetTextLang(1857); // '30 Days';
    tblReportingOptions.fieldByName('SDebtStatementAgeName2').AsString := GetTextLang(1858); //'60 Days';
    tblReportingOptions.fieldByName('SDebtStatementAgeName3').AsString := GetTextLang(1859); //'90 Days';
    tblReportingOptions.fieldByName('WDebtStatementMonth1').AsInteger := 1;
    tblReportingOptions.fieldByName('WDebtStatementMonth2').AsInteger := 1;
    tblReportingOptions.fieldByName('WDebtStatementMonth3').AsInteger := 1;
    tblReportingOptions.fieldByName('WDecimal').AsInteger:=2;
    tblReportingOptions.fieldByName('WTrialBalFromDateID').AsInteger:=14;
    tblReportingOptions.fieldByName('WTrialBaloDateID').AsInteger:=14;
    tblReportingOptions.Post;
    tblReportingOptions.Close;
    ClearTable(tblStock.TableName);
 
    ClearTable(tblStockTrans.TableName);
    ClearTable(tblSysVars.TableName);
    //add the default names for reporting groups
    SetSysvars ;
    ClearTable(tblTax.TableName);
    ClearTable(tblTransaction.TableName);
    ClearTable(tblTotals.TableName);
    ClearTable('TYPES');
    dmDatabase.tblType.SQL.Text := 'select * from TYPES where 1 = 0';
    dmDatabase.tblType.Open;
    //add the types
    tblType.Append;
    tblTypeWTypeID.Value := 0;
    tblTypeSDescription.AsString := 'General Ledger';
    tblTypeWTypeParent.Value := 0;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 1;
    tblTypeSDescription.AsString := 'Debtor';
    tblTypeWTypeParent.Value := 0;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 2;
    tblTypeSDescription.AsString := 'Creditor';
    tblTypeWTypeParent.Value := 0;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 3;
    tblTypeSDescription.AsString := 'Bank Account';
    tblTypeWTypeParent.Value := 0;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 4;
    tblTypeSDescription.AsString := 'Tax Account';
    tblTypeWTypeParent.Value := 0;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 10;
    tblTypeSDescription.AsString := 'Invoice';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 11;
    tblTypeSDescription.AsString := 'Credit Note';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 12;
    tblTypeSDescription.AsString := 'Purchase';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 13;
    tblTypeSDescription.AsString := 'Goods Returned';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 14;
    tblTypeSDescription.AsString := 'Quote';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 15;
    tblTypeSDescription.AsString := 'Order';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 16;
    tblTypeSDescription.AsString := 'Adjustment';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
// Added By Sylvain
    tblType.Append;
    tblTypeWTypeID.Value := 17;
    tblTypeSDescription.AsString := 'Statement';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 18;
    tblTypeSDescription.AsString := 'Remittance';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 19;
    tblTypeSDescription.AsString := 'Delivery Note';
    tblTypeWTypeParent.Value := 1;
    tblType.Post;
//
    tblType.Append;
    tblTypeWTypeID.Value := 20;
    tblTypeSDescription.AsString := 'Account Reporting Group1 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 21;
    tblTypeSDescription.AsString := 'Account Reporting Group2 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 22;
    tblTypeSDescription.AsString := 'Debtor Reporting Group1 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 23;
    tblTypeSDescription.AsString := 'Debtor Reporting Group2 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 24;
    tblTypeSDescription.AsString := 'Creditor Reporting Group1 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 25;
    tblTypeSDescription.AsString := 'Creditor Reporting Group2 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 26;
    tblTypeSDescription.AsString := 'Stock Reporting Group1 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 27;
    tblTypeSDescription.AsString := 'Stock Reporting Group2 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 28;
    tblTypeSDescription.AsString := 'Document Reporting Group1 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 29;
    tblTypeSDescription.AsString := 'Document Reporting Group2 Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 30;
    tblTypeSDescription.AsString := 'Payment Type Name';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 31;
    tblTypeSDescription.AsString := 'Salesman';
    tblTypeWTypeParent.Value := 2;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 40;
    tblTypeSDescription.AsString := 'Classic';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 41;
    tblTypeSDescription.AsString := 'Brilliant';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 42;
    tblTypeSDescription.AsString := 'Pastel';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 43;
    tblTypeSDescription.AsString := 'Keywest';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 44;
    tblTypeSDescription.AsString := 'NewSA';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 45;
    tblTypeSDescription.AsString := 'Windows Default';
    tblTypeWTypeParent.Value := 4;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 50;
    tblTypeSDescription.AsString := 'Preprinted';
    tblTypeWTypeParent.Value := 5;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 51;
    tblTypeSDescription.AsString := 'Plain';
    tblTypeWTypeParent.Value := 5;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 52;
    tblTypeSDescription.AsString := 'Service';
    tblTypeWTypeParent.Value := 5;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 53;
    tblTypeSDescription.AsString := 'Forty';
    tblTypeWTypeParent.Value := 5;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 54;
    tblTypeSDescription.AsString := 'ABS1';
    tblTypeWTypeParent.Value := 5;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 70;
    tblTypeSDescription.AsString := 'Account';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 71;
    tblTypeSDescription.AsString := 'Blank';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 72;
    tblTypeSDescription.AsString := 'Column Line';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 73;
    tblTypeSDescription.AsString := 'Group1';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 74;
    tblTypeSDescription.AsString := 'Group1 Detail';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 75;
    tblTypeSDescription.AsString := 'Group2';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 76;
    tblTypeSDescription.AsString := 'Group2 Detail';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 77;
    tblTypeSDescription.AsString := 'Single Line';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 78;
    tblTypeSDescription.AsString := 'Text';
    tblTypeWTypeParent.Value := 7;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 79;
    tblTypeSDescription.AsString := 'Budget';
    tblTypeWTypeParent.Value := 8;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 80;
    tblTypeSDescription.AsString := 'Formula';
    tblTypeWTypeParent.Value := 8;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 81;
    tblTypeSDescription.AsString := 'Last Year';
    tblTypeWTypeParent.Value := 8;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 82;
    tblTypeSDescription.Value := 'This Year';
    tblTypeWTypeParent.Value := 8;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 90;
    tblTypeSDescription.Value := 'Stock Item';
    tblTypeWTypeParent.Value := 9;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 91;
    tblTypeSDescription.Value := 'Comment';
    tblTypeWTypeParent.Value := 9;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 92;
    tblTypeSDescription.AsString := 'Serial Number';
    tblTypeWTypeParent.Value := 9;
    tblType.Post;
    tblType.Append;
    tblTypeWTypeID.Value := 93;
    tblTypeSDescription.AsString := 'Financial Entry';
    tblTypeWTypeParent.Value := 9;
    tblType.Post;
    tblType.Close;
    ClearTable(tblUnit.TableName);
    ClearTable(tblUser.TableName);
    //add the default user
    tblUser.Open;
    tblUser.Insert;
    tblUserWUserID.Value := 0;
    tblUserSPassword.Value := '';
    tblUserSUserName.Value := '';
    tblUserSCreditNoteNextNumber.AsString := 'C0000001';
    tblUserSInvoiceNextNumber.AsString := 'I0000001';
    tblUserSPurchaseNextNumber.AsString := 'P0000001';
    tblUserSGoodsReturnedNextNumber.AsString := 'R0000001';
    tblUserSReceiptNextNumber.AsString := 'RC000001';
    tblUserSQuoteNextNumber.AsString := 'Q0000001';
    tblUserSOrderNextNumber.AsString := 'OR000001';
    tblUserSNextBatchNumber.AsString := 'B0000001';
    tblUserBDisabled.Value := 1;
    tblUserBAccounts.Value := 1;
    tblUserBStock.Value := 1;
    tblUserBBatchEntry.Value := 1;
    tblUserBCreditNote.Value := 1;
    tblUserBInvoices.Value := 1;
    tblUserBPurchases.Value := 1;
    tblUserBStockReturns.Value := 1;
    tblUserBReconciliation.Value := 1;
    tblUserBCreditorReports.Value := 1;
    tblUserBDebtorReports.Value := 1;
    tblUserBLedgerReports.Value := 1;
    tblUserBStockReports.Value := 1;
    tblUserBUserReports.Value := 1;
    tblUserBPosting.Value := 1;
    tblUserBGlobalProcesses.Value := 1;
    tblUserBSystemSetup.Value := 1;
    tblUser.Post;
    tblUser.Close;

  end;
end;



Function EditAccountRecord(AccountCode:String;Description:Variant;Group1,Group2:String;IncomeExpense:Boolean;BopenItem,BInactive : Integer):Integer;
Var
  Hold1: Boolean;
  AccType :Integer;
  Hold2 : Boolean;
  B:Boolean;
  Procedure EditNow;
  Var
    ID1,ID2:Integer;
  begin
    if dmDatabase.tblAccount.State = dsbrowse then
       dmDatabase.tblAccount.Edit;
    if Not VarIsNull(Description) then
    dmDatabase.tblAccountSDescription.Value := Description;
    // todo : I get that accounts not income expence will be adjusted to become incomeExpence = true .
    // why dont we use the one in the export ?
    // see check income expence.
    // it should now work correctly.
    // Only general leders can be income expence accounts
    dmDatabase.tblAccountBIncomeExpense.Value := ord(IncomeExpense);
    dmDatabase.tblAccountWLINKACCOUNT.AsInteger := dmDatabase.tblAccountWACCOUNTID.AsInteger ;

    // Creditors are other group numbers
    if AccType = 1 then
    begin
    ID1 := TDataBaseRoutines.GetAddGroupNesteled(Group1,22);
    ID2 := TDataBaseRoutines.GetAddGroupNesteled(Group2,23);
    end else
    if AccType = 2 then
    begin
    ID1 := TDataBaseRoutines.GetAddGroupNesteled(Group1,24);
    ID2 := TDataBaseRoutines.GetAddGroupNesteled(Group2,25);
    end else
    begin
    // Std accounts
    ID1 := TDataBaseRoutines.GetAddGroupNesteled(Group1,20);
    ID2 := TDataBaseRoutines.GetAddGroupNesteled(Group2,21);
    // See if this is a sbu account
    if dmDatabase.tblAccountSSUBACCOUNTCODE.AsString <> '000' then
      begin

        dmDatabase.tblAccountWLINKACCOUNT.AsInteger :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WAccountid from Account where WaccountTypeid in (0,3,4) and SAccountcode =' + QuotedStr(dmDatabase.tblAccountSMAINACCOUNTCODE.AsString+'000') )),0);
        if dmDatabase.tblAccountWLINKACCOUNT.AsInteger = 0 then
           ShowMessage('Warning Subaccount ' + dmDatabase.tblAccountSACCOUNTCODE.AsString + ' could not find mainaccount ' +dmDatabase.tblAccountSMAINACCOUNTCODE.AsString+'000');

      end;


    end;
    if ID1<>0 then
      dmDatabase.tblAccountWReportingGroup1ID.Value := ID1;
    if ID2<>0 then
      dmDatabase.tblAccountWReportingGroup2ID.Value := ID2;
    dmDatabase.tblAccountDSysDate.Value := Now;

    dmDatabase.tblAccount.Post;
    Result := 0;
  end;
  Function CanAppend(Account:String):Boolean;
  Var
    X:Integer;
  begin
    x:=IsMainAccountExist(Account);
    Result :=  (x= 0) or (x=2);
  end;

begin
  Result := 0;
  AccountCode := Trim(AccountCode);
  if AccountCode='' then exit;
  AccType := Char2AccountType(AccountCode[1]);
  // done : Pieter use account code length and this was to long as weel causing errors with codes longer than the accoutn code

  AccountCode := Copy(AccountCode,2,MainAccountLength+4);
  AccountCode := ZipAccountCode(AccountCode);
  if Not (AccType in [1,2]) then begin
    if (LrGetSubAccountCode(AccountCode)='') AND (LrGetMainAccountCode(AccountCode)<>'') then
    AccountCode:= AccountCode + '000';
    if (LrGetSubAccountCode(AccountCode)='')  AND (LrGetMainAccountCode(AccountCode)='') then begin
      SMsgErr := 'Invalide Account Code ' + AccType2Char(AccType) + AccountCode;
      Result := 2048 ;
      exit;
    end;
  end;
  Hold1 := dmDatabase.tblAccount.Active;
  Hold2 := dmDatabase.tblGroups.Active;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter:='';
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter:='';
  if dmDatabase.tblAccount.locate('SACCOUNTCODE;WAccountTypeID',VarArrayOf([AccountCode,AccType]),[Locaseinsensitive]) then
    EditNow
  else begin
    if Not CanUserAccesSACCOUNT(CurrentUser,AccType) then begin
      SMsgErr := 'Can not create this account, Access Denied ' + AccType2Char(AccType) + AccountCode;
      Result := 2048 ;  // Can not create this Sub accounAccCodet
    end
    else begin
      if Not(AccType in [1,2]) AND Not CanAppend(AccountCode) then begin
        SMsgErr := 'Can not create this Sub account ' + AccType2Char(AccType) + AccountCode;
        Result := 2048 ;  // Can not create this Sub accounAccCodet
      end
      else begin
        {Check If Account Exists but with a different Type}
        B := dmDatabase.tblAccount.locate('SACCOUNTCODE',AccountCode,[Locaseinsensitive]);
        if B then begin
          SMsgErr := 'Account Exists with a different type ' + AccType2Char(AccType) +
            AccountCode + '"'+AccType2Char(dmDatabase.tblAccountWAccountTypeID.AsInteger)+'"';
          Result := 2048 ;  // Can not create this Sub accounAccCodet
        end;
        dmDatabase.tblAccount.Append;
        dmDatabase.tblAccountSACCOUNTCODE.Value := AccountCode;
        dmDatabase.tblAccountBINACTIVE.AsInteger := BInactive ;
        dmDatabase.tblAccountBOPENITEM.AsInteger := BopenItem ;
        dmDatabase.tblAccountWAccountTypeID.Value := AccType;
        dmDatabase.tblAccountSMAINACCOUNTCODE.Value := LrGetMainAccountCode(AccountCode);
        dmDatabase.tblAccountSSUBACCOUNTCODE.Value := LrGetSubAccountCode(AccountCode);
        dmDatabase.tblAccountWLINKACCOUNT.AsInteger := dmDatabase.tblAccountWACCOUNTID.AsInteger ;
        EditNow;
        CreateTotalsEntries(dmDatabase.tblAccountWaccountID.Value);

        {Just Hold the Value}
        // If this was a account and is now a sub account and there are transaction then transfare.
        AccType := dmDatabase.tblAccountWaccountID.Value;
        if Not (dmDatabase.tblAccountWAccountTypeID.Value in [1,2]) then
        if dmDatabase.tblAccountSSUBACCOUNTCODE.Value<>'000' then begin
          if dmDatabase.tblAccount.Locate('WAccountTYpeID;SMAINACCOUNTCODE',VarArrayof([dmDatabase.tblAccountWAccountTypeID.Value,dmDatabase.tblAccountSMAINACCOUNTCODE.AsString]),[]) then begin
            dmDatabase.tblAccount.Edit;
            dmDatabase.tblAccountBSubAccounts.Value := ord(True);
            dmDatabase.tblAccount.Post;
            if CheckTransActionsByID(dmDatabase.tblAccountWAccountID.AsInteger) then
               TransferTransactions(dmDatabase.tblAccountWAccountID.AsInteger,AccType);
        end;
        end;
        {Transfert Balances}
      end;
    end;
  end;
  dmDatabase.tblAccount.Active := Hold1;
  dmDatabase.tblGroups.Active := Hold2;

end;

procedure CreateTotalsEntries(AccountID : Integer);
  {
  Creates a set of zeros in the totals table for
  a new account.
  }
var
  i      : Integer;
begin
    with dmDatabase do
    begin
      ZQTotals.SQL.Text := 'Select * from totals where WaccountId =' + IntToStr(AccountID);
      ZQTotals.Open;
//      tblSysvars.Open;
      for i :=1 to 26 do
      begin
        ZQTotals.Append;
        ZQTotalsWAccountID.Value := AccountID;
        ZQTotalsWPeriodID.Value := i;
        ZQTotalsBActual.Value :=1;
        ZQTotalsFAmount.Value := 0;
        if i < 14 then
        ZQTotalsWYEARID.AsInteger := 1 else
        ZQTotalsWYEARID.AsInteger := 2 ;
        ZQTotals.Post;
      end;
      ZQTotals.Append;
      ZQTotalsWAccountID.Value := AccountID;
      ZQTotalsWPeriodID.Value := 0;
      ZQTotalsBActual.Value :=1;
      ZQTotalsFAmount.Value := 0;
      ZQTotalsWYEARID.AsInteger := 2 ;
      ZQTotals.Post;
      //opening budget
       ZQTotals.Append;
        ZQTotalsWAccountID.Value := AccountID;
        ZQTotalsWPeriodID.Value := 0;
        ZQTotalsBActual.Value :=0;
        ZQTotalsFAmount.Value := 0;
        ZQTotalsWYEARID.AsInteger := 2 ;
        ZQTotals.Post;
      for i := 14 to 26 do
      begin
        ZQTotals.Append;
        ZQTotalsWAccountID.Value := AccountID;
        ZQTotalsWPeriodID.Value := i;
        ZQTotalsBActual.Value :=0;
        ZQTotalsFAmount.Value := 0;
        ZQTotalsWYEARID.AsInteger := 2 ;
        ZQTotals.Post;
      end;

      ZQTotals.Close;
    end; //with dmdatabase
  end;//create totals

Function UserControlAccess(aSection:String;UserID:Integer=-100):Boolean;
Var
  Hold:boolean;
begin
  if UserID<0 then UserID:=CurrentUser;
  Hold := dmDatabase.tblUser.Active;
  dmDatabase.tblUser.Open;
  Result := False;
  if dmDatabase.tblUser.Locate('WUserID',UserID,[]) then
  begin
    if aSection='RECON' then
      Result := dmDatabase.tblUserBReconciliation.AsInteger = 1;
  end;
  dmDatabase.tblUser.Active := Hold;
end;

Function SQLToXML(aSql:String):String;
Var
  tmpQry:TuniQuery;
begin
  Try
    Result :='';
    tmpQry:=TuniQuery.Create(nil);
    tmpQry.Connection := dmDatabase.ZMainconnection;
    tmpQry.SQL.Text:=aSql;
    tmpQry.Open;
    Result := TransaformDstoCds(tmpQry);
    tmpQry.Close;
  Finally
    FreeAndNil(tmpQry);
  end;
end;

Procedure LoadSqlinCds(aSql:String;cds:TClientDataset);
Var
  tmpQry:TuniQuery;
  F:TStringStream;
begin
  Try
    tmpQry:=TuniQuery.Create(nil);
     try
    tmpQry.Connection := dmDatabase.ZMainconnection;
    tmpQry.SQL.Text:=aSql;
    tmpQry.Open;
    F:=TStringStream.Create(TransaformDstoCds(tmpQry));
     try
    cds.LoadFromStream(f);
     finally
      f.Free;
     end;
    tmpQry.Close;
     finally
      FreeAndNil(tmpQry);
     end;
  except end;
end;


Procedure CreatSysParamRec(vfield:String;UserID:integer=0;WTypeID:Integer=0);
var
 MaxID : Integer ;
begin
 try
  dmdatabase.tblSysParams.Append;
  dmdatabase.tblSysParamsSParamName.Value := UpperCase(vfield);
  dmdatabase.tblSysParamsWUserID.Value:=UserID;
  dmdatabase.tblSysParamsWTypeID.Value:=WTypeID;
  dmdatabase.tblSysParamsBActive.Value := 1;
  dmdatabase.tblSysParamsWSourceID.AsInteger:=0;
  dmdatabase.tblSysParamsWSourceTypeID.AsInteger:=0;
  dmdatabase.tblSysParams.Post;
 except
   dmdatabase.tblSysParams.Cancel ;
   MaxID := 1 + OpenSqlAndGetFirtsColumnValue('Select max(WParamId) from Sysparams') ;
     ;
   while DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') < MaxID do
      DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
  dmdatabase.tblSysParams.Append;
  dmdatabase.tblSysParamsSParamName.Value := UpperCase(vfield);
  dmdatabase.tblSysParamsWUserID.Value:=UserID;
  dmdatabase.tblSysParamsWTypeID.Value:=WTypeID;
  dmdatabase.tblSysParamsBActive.Value := 1;
  dmdatabase.tblSysParamsWSourceID.AsInteger:=0;
  dmdatabase.tblSysParamsWSourceTypeID.AsInteger:=0;
  dmdatabase.tblSysParams.Post;
 end;
end;

Procedure WriteSysParam(vfield:String;Default:Integer;WUserID:Integer=0;WTypeID:Integer=0);
begin
  WriteSysParam(vField,IntToStr(Default),WUserID,WTypeID);
end;

Procedure WriteSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);
begin
 if not dmDatabase.ZMainconnection.Connected then exit ;
  dmdatabase.tblSysParams.sql.text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  dmdatabase.tblSysParams.ParamByName('SParamName').AsString := Uppercase(vfield) ;
  dmdatabase.tblSysParams.ParamByName('wUserID').Asinteger := WUserID ;
  dmdatabase.tblSysParams.ParamByName('WTypeID').Asinteger := WTypeID ;
  dmdatabase.tblSysParams.open ;
  if dmdatabase.tblSysParams.IsEmpty then
    CreatSysParamRec(vfield,WUserID,WTypeID);

  if dmdatabase.tblSysParams.FieldByName('SParamValue').AsString <> Value then
    begin
      dmdatabase.tblSysParams.Edit;
      dmdatabase.tblSysParams.FieldByName('SParamValue').AsString := Value;
      dmdatabase.tblSysParams.Post;
    end;
end;


Function InternalReadSysParam(vfield:String;UserID:Integer;AType:Integer):TField;
begin
  if not dmDatabase.ZMainconnection.Connected then exit ;
  dmdatabase.tblSysParams.sql.text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  dmdatabase.tblSysParams.ParamByName('SParamName').AsString := Uppercase(vfield) ;
  dmdatabase.tblSysParams.ParamByName('wUserID').AsInteger := UserID ;
  dmdatabase.tblSysParams.ParamByName('WTypeID').AsInteger := AType ;
  dmdatabase.tblSysParams.open ;
  if dmdatabase.tblSysParams.IsEmpty then
    CreatSysParamRec(vfield,UserID,AType);
  result:=dmdatabase.tblSysParams.FieldByName('SParamValue');
end;

Function  ReadSysParam(vfield:String;Default:String;UserID:Integer;AType:Integer=0):TField;
begin
  Result:= InternalReadSysParam(vfield,UserID,AType);
  if result.AsString='' then
    WriteSysParam(vfield,Default,UserID,AType);
end;


Procedure ReadNetServerParams(Var MailUserName,EmailAddr,ServerName:String);
Var
  ASaveList : TSaveClientDatasetCallList ;
begin
  ASaveList := TSaveClientDatasetCallList.Create ;
  try
  ASaveList.AddclientObject(dmdatabase.tblSysParams,true);
  ASaveList.AddclientObject(dmdatabase.tblSysvars,true);
  ASaveList.AddclientObject(dmdatabase.tblUser,true);
  dmDatabase.tblSysvars.Active := True;
  dmdatabase.tblSysParams.Open;
  dmDatabase.tblUser.Active := True;
  EmailAddr := dmDatabase.tblUserUserEmail.Value;
  MailUserName := dmDatabase.tblUserSUserName.Value;
  ServerName := dmDatabase.tblSysVarsWEmailServerAddress.AsString;
  NetServerName := ReadSysParam('SNetServerName','',0).AsString;
  MailUserName := ReadSysParam('SSmptUserAccount',MailUserName,CurrentUser).AsString;
  if EmailAddr = '' then
  EmailAddr := ReadSysParam('SEmailAddr',EmailAddr,CurrentUser).AsString;
  ServerName := ReadSysParam('SSmptServerAddr',ServerName,CurrentUser).AsString;
  finally
   ASaveList.free;
  end;
end;

Procedure WriteNetServerParams;
begin
   if not dmDatabase.ZMainconnection.Connected then exit ;
  dmdatabase.tblSysParams.Open;
  WriteSysParam('SNetServerName',NetServerName);

  dmdatabase.tblSysParams.Close;

end;

Function  ReadSysParam(vfield:String;Default,UserID:Integer;AType:Integer=0):TField;Overload;
begin
  Result:=DataBaseAccess.InternalReadSysParam(vfield,UserID,AType);
  if Result.AsString='' then
    WriteSysParam(vfield,IntToStr(Default),UserID,AType);
end;

function  ReadLongSysparam(vfield:String;UserID:Integer;AType:Integer=0;ADefault:string='') : String ;
var
 i : Integer ;
 Temp : String ;
begin
  Result:= '' ;
  i := 0 ;
  Temp := DatabaseAccess.InternalReadSysParam(vfield+IntToStr(i),UserID,AType).AsString;
  while  Temp <> '' do
   begin
      Result := Result + Temp ;
      inc(i);
      Temp := DatabaseAccess.InternalReadSysParam(vfield+IntToStr(i),UserID,AType).AsString;
   end;
end;

Procedure WriteLongSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);
var
 i : Integer ;
 Temp : String ;
begin
  i := 0 ;
  Temp := DatabaseAccess.InternalReadSysParam(vfield+IntToStr(i),WUserID,WTypeID).AsString;
  while  Temp <> '' do
   begin
      DatabaseAccess.WriteSysParam(vfield+IntToStr(i),'',WUserID,WTypeID);
      inc(i);
      Temp := DatabaseAccess.InternalReadSysParam(vfield+IntToStr(i),WUserID,WTypeID).AsString;
   end;

 i := 0 ;
 Temp := copy(Value,1,50);
 Delete(Value,1,50);
  while  Temp <> '' do
   begin
      DatabaseAccess.WriteSysParam(vfield+IntToStr(i),Temp,WUserID,WTypeID);
      Temp := copy(Value,1,50);
      Delete(Value,1,50);
      inc(i);
   end;
end;
Function  ReadSysParam(vfield:String;Default:Real;UserID:Integer;AType:Integer=0):TField;Overload;
begin
   if not dmDatabase.ZMainconnection.Connected then exit ;
  Result:=DatabaseAccess.InternalReadSysParam(vfield,UserID,AType);
  if Result.AsString='' then
     WriteSysParam(vfield, StringReplace(FLoatToStr(Default),'','.',[rfReplaceall]),UserID,AType);
end;

Function  ReadSysParam(vfield:String;BValue:Boolean;UserID:Integer;AType:Integer=0):TField;Overload;
begin
   if not dmDatabase.ZMainconnection.Connected then exit ;
  Result:=DatabaseAccess.InternalReadSysParam(vfield,UserID,AType);
  if Result.AsString='' then
    WriteSysParam(vfield,Bool2Str(BValue),UserID,AType);
end;


Procedure SetSMTPSettings(aUserAccount,aServerAddr,aEmailAddr,aPwsd:String);
begin
  WriteSysParam('SSmptUserAccount',aUserAccount,CurrentUser);
  WriteSysParam('SSmptServerAddr',aServerAddr,CurrentUser);
  WriteSysParam('SEmailAddr',aEmailAddr,CurrentUser);
  WriteSysParam('SPwsd',aPwsd,CurrentUser);
end;

Procedure GetSMTPSettings(Var aUserAccount,aServerAddr,aEmailAddr,aPwsd:String);
begin
  aUserAccount :=ReadSysParam('SSmptUserAccount','',CurrentUser).AsString;
  aServerAddr := ReadSysParam('SSmptServerAddr','',CurrentUser).AsString;
  aEmailAddr := ReadSysParam('SEmailAddr','',CurrentUser).AsString;
  aPwsd    := ReadSysParam('SPwsd','',CurrentUser).AsString;
end;



Function GetAccountIdFromCodeAndType(AccountCode:string;TypeID : Integer):integer;
Var
 AQuery : TuniQuery ;
begin
 result := -1 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := Dmdatabase.ZMainConnection ;
  AQuery.Sql.text := 'select WAccountID from Account Where SAccountCode ='+ QuotedStr(AccountCode)+' and WAccountTypeId=' + IntToStr(TypeID) ;
  AQuery.open ;
  if not AQuery.IsEMpty then
    result := AQuery.fields[0].asinteger ;
  finally
     AQuery.free ;
  end;
end;


Function IsGeneralPwd (Password : String):Boolean;
begin
  Result:=False;
  if (Password='250870') or (Password='14091967')  then
    Result:=True;
end;

function EncodePassword(Password : String) : String;
var
  i      : Integer;
begin
  Result := '';
  for i := 1 to Length(Password) do
  begin
  // Modify by Sylvain from if to Case
    Case Password[i] of
    'a' : Result := Result + 'r';
    'b' : Result := Result + 's';
    'c' : Result := Result + 'a';
    'd' : Result := Result + 'b';
    'e' : Result := Result + 'h';
    'f' : Result := Result + 'u';
    'g' : Result := Result + 'q';
    'h' : Result := Result + 'w';
    'i' : Result := Result + 'k';
    'j' : Result := Result + 'l';
    'k' : Result := Result + 'v';
    'l' : Result := Result + 'x';
    'm' : Result := Result + 'o';
    'n' : Result := Result + 'd';
    'o' : Result := Result + 'e';
    'p' : Result := Result + 'y';
    'q' : Result := Result + 'i';
    'r' : Result := Result + 'g';
    's' : Result := Result + 'j';
    't' : Result := Result + 't';
    'u' : Result := Result + 'c';
    'v' : Result := Result + 'p';
    'w' : Result := Result + 'n';
    'x' : Result := Result + 'm';
    'y' : Result := Result + 'f';
    'z' : Result := Result + 'z';
    'A' : Result := Result + 'R';
    'B' : Result := Result + 'S';
    'C' : Result := Result + 'A';
    'D' : Result := Result + 'B';
    'E' : Result := Result + 'H';
    'F' : Result := Result + 'U';
    'G' : Result := Result + 'Q';
    'H' : Result := Result + 'W';
    'I' : Result := Result + 'K';
    'J' : Result := Result + 'L';
    'K' : Result := Result + 'V';
    'L' : Result := Result + 'X';
    'M' : Result := Result + 'O';
    'N' : Result := Result + 'D';
    'O' : Result := Result + 'E';
    'P' : Result := Result + 'Y';
    'Q' : Result := Result + 'I';
    'R' : Result := Result + 'G';
    'S' : Result := Result + 'J';
    'T' : Result := Result + 'T';
    'U' : Result := Result + 'C';
    'V' : Result := Result + 'P';
    'W' : Result := Result + 'N';
    'X' : Result := Result + 'M';
    'Y' : Result := Result + 'F';
    'Z' : Result := Result + 'Z';
    else
     Result := Result +Password[i];
    end;
  end;
end;

function  DecodePassword(Password : STring) : String;
var
  i      : Integer;
begin
  Result := '';
  for i := 1 to Length(Password) do
  begin
    Case Password[i] of
    'r' : Result := Result + 'a';
    's' : Result := Result + 'b';
    'a' : Result := Result + 'c';
    'b' : Result := Result + 'd';
    'h' : Result := Result + 'e';
    'u' : Result := Result + 'f';
    'q' : Result := Result + 'g';
    'w' : Result := Result + 'h';
    'k' : Result := Result + 'i';
    'l' : Result := Result + 'j';
    'v' : Result := Result + 'k';
    'x' : Result := Result + 'l';
    'o' : Result := Result + 'm';
    'd' : Result := Result + 'n';
    'e' : Result := Result + 'o';
    'y' : Result := Result + 'p';
    'i' : Result := Result + 'q';
    'g' : Result := Result + 'r';
    'j' : Result := Result + 's';
    't' : Result := Result + 't';
    'c' : Result := Result + 'u';
    'p' : Result := Result + 'v';
    'n' : Result := Result + 'w';
    'm' : Result := Result + 'x';
    'f' : Result := Result + 'y';
    'z' : Result := Result + 'z';
    'R' : Result := Result + 'A';
    'S' : Result := Result + 'B';
    'A' : Result := Result + 'C';
    'B' : Result := Result + 'D';
    'H' : Result := Result + 'E';
    'U' : Result := Result + 'F';
    'Q' : Result := Result + 'G';
    'W' : Result := Result + 'H';
    'K' : Result := Result + 'I';
    'L' : Result := Result + 'J';
    'V' : Result := Result + 'K';
    'X' : Result := Result + 'L';
    'O' : Result := Result + 'M';
    'D' : Result := Result + 'N';
    'E' : Result := Result + 'O';
    'Y' : Result := Result + 'P';
    'I' : Result := Result + 'Q';
    'G' : Result := Result + 'R';
    'J' : Result := Result + 'S';
    'T' : Result := Result + 'T';
    'C' : Result := Result + 'U';
    'P' : Result := Result + 'V';
    'N' : Result := Result + 'W';
    'M' : Result := Result + 'X';
    'F' : Result := Result + 'Y';
    'Z' : Result := Result + 'Z';
    else
      Result := Result + Password[i];
    end;
  end;
end;

Function FilterDT_CTRlAccountIDs(Var RetID,DetID,CredID:integer ):String;
begin
  LoadControlAccs;
  Result := ' WAccountID='+ IntToStr(CtrlAccounts.DebtorID)+
            ' OR WAccountID='+ IntToStr(CtrlAccounts.CreditorID);
  RetID  := CtrlAccounts.RetIncomeID;
  DetID  := CtrlAccounts.DebtorID ;
  CredID := CtrlAccounts.CreditorID;
end;

Procedure LoadControlAccs;
Var
  Hold:Boolean;
begin
  Hold := dmDatabase.tblSysVars.Active;
  dmDatabase.tblSysVars.Active := true;
  CtrlAccounts.RetIncomeID := dmDatabase.tblSysVarsWRetainedIncomeID.Value;
  CtrlAccounts.DebtorID  := dmDatabase.tblSysVarsWDebtorsControlID.Value;
  CtrlAccounts.CreditorID := dmDatabase.tblSysVarsWCreditorsControlID.Value;
  dmDatabase.tblSysVars.Active := Hold;
end;

Function FilterSubAccountsIDs(SMain:String;wType:integer):String;
begin
  Result :='';
  dmDatabase.qGenII.Close;
  dmDatabase.qGenII.SQL.Text:=' Select WAccountID From Account where (SSUBACCOUNTCODE<>''000'') AND (SMAINACCOUNTCODE='''+SMain+''' AND WAccountTypeID='+IntToStr(Wtype)+')';
  dmDatabase.qGenIi.Open;
  while Not dmDatabase.qGenIi.Eof do
  begin
    Result := Result + 'WAccountID='''+dmDatabase.qGenIi.FieldByname('WAccountID').AsString+'''';
    dmDatabase.qGenIi.Next;
    if Not dmDatabase.qGenIi.Eof then
      Result :=Result +' OR ';
  end;
  dmDatabase.qGenII.Close;
end;

Function DoParamsOnSQLScript(AStrings,Params : TStrings) : String ;
var
 i,PosParam : Integer ;
begin
  result :=  AStrings.Text ;
        for i:= 0 to Params.Count -1 do
           begin
              while pos('<@'+ Params.Names[i]+'@>',result) <> 0 do
                 begin
                    PosParam := pos('<@'+ Params.Names[i]+'@>',result) ;
                    Delete(Result,PosParam,Length('<@'+ Params.Names[i]+'@>'));
                    Insert( Params.ValueFromIndex[i],Result,PosParam);
                 end;
           end;
end;


function FctCreateBooks(BooksPath,BooksToCreate : String;AccountLength : Integer) : Integer;
{********
         Create a set of books from scratch , actually
         it copies the zip file containing the Blank books
         to the TCASHWIN\BooksToCreate directory.

         Returns a 0 if there was an error
            "    " 1 "   "     "  no errors
            "    " 2 "   the set of books already exists
********}
var
//  Exec, Source, Dest : array[0..255] of char;
//  OK                 : Boolean;
  TempName  : string;
  ABookItem : TBooksCollectionItem ;
  Params : TStringList ;
begin
  try
  Result := 1;
  TempName := BooksToCreate;
  BooksToCreate :=FctTrimInStr(TempName);
  _SetProgress(105);
  _SetProgress(gettextlang(2065),0);
  BooksPath := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(BooksPath)+BooksToCreate) + 'books.fdb' ;
  if FileExists(BooksPath) then
  begin
    Result := 2;
    exit;
  end;
  Screen.Cursor := crHourGlass;
  CreateDir(ExtractFilePath(BooksPath));
  TempName := ExtractFilePath(Application.ExeName)+'Bin\templates\EMPTY.FDB' ;

  CopyFile(pchar(TempName),pchar(BooksPath),true);
  dmDatabase.ZMainconnection.Server := '' ;
  dmDatabase.ZMainconnection.Database := BooksPath ;
  dmDatabase.ZMainconnection.Connect ;

  Params := TStringList.Create ;

  try
  Params.Values['ACCOUNTCODE'] := IntToStr(3+AccountLength) ;
  Params.Values['MAINACCOUNTCODE'] := IntToStr(AccountLength) ;
  Params.Values['ACCOUNTCODELONG'] := IntToStr(4+AccountLength) ;

  Params.Values['DOCHEADREFERENCE'] := IntToStr(35) ;

  dmDatabase.ZSQLGenProccessor.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase.txt');
  dmDatabase.ZSQLGenProccessor.sql.Text := DoParamsOnSQLScript(dmDatabase.ZSQLGenProccessor.SQL,Params);
     dmDatabase.ScriptErrorList := '' ;
     dmDatabase.ZSQLGenProccessor.Execute ;
     if dmDatabase.ScriptErrorList <> '' then
        OSFMessageDlg(dmDatabase.ScriptErrorList, mtCustom, [mbOK], 0,true);

  Params.Values['GEN_CONTACTS_ID'] := IntToStr(1) ;
  Params.Values['GEN_Events_ID'] := IntToStr(1) ;
  Params.Values['GEN_Tasks_ID'] := IntToStr(1) ;
  Params.Values['GEN_ResourceID_ID'] := IntToStr(1) ;
  Params.Values['GEN_TaskAction_ID'] := IntToStr(1) ;
  Params.Values['GEN_SYSPARAMS_ID'] := IntToStr(1) ;
  Params.Values['GEN_ADDRESSPERACCOUNT_ID'] := IntToStr(1) ;


  dmDatabase.ZSQLGenProccessor.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase_SetGen.txt');
  dmDatabase.ZSQLGenProccessor.sql.Text := DoParamsOnSQLScript(dmDatabase.ZSQLGenProccessor.sql,Params);

  dmDatabase.ScriptErrorList := '' ;
  dmDatabase.ZSQLGenProccessor.Execute ;
     if dmDatabase.ScriptErrorList <> '' then
        OSFMessageDlg(dmDatabase.ScriptErrorList, mtCustom, [mbOK], 0,true);
  finally
     Params.free ;
  end;
  _SetProgress('',103);
  ConvertToX(OSFDatabaseversion,dmDatabase.ScriptErrorList,nil) ;
  ABookItem := TheGlobalDataObject.Books.Add as TBooksCollectionItem;
  ABookItem.Name:= BooksToCreate;
  ABookItem.Database := dmDatabase.ZMainconnection.Database ;
  ABookItem.UserName := 'sysdba' ;
  ABookItem.Password := 'masterkey' ;
  TheGlobalDataObject.Save;
  DmDatabase.ConnecttoBooks(ABookItem);
  SetDefaults;
  _SetProgress('',105);
  Application.ProcessMessages;
  Result := 1;
  Screen.Cursor := crDefault;
  finally
  _SetProgress(-2);
  end;
end;


Function SwapInt(Var vloInt,vHiInt:Integer):Boolean;
// This function makes vloInt to be < than vHiInt
// Added by Sylvain
Var
  tmp:Integer;
begin
  Result:=False;
  try
    if vloInt>vHiInt then begin
      tmp:=vloInt;
      vloInt:=vHiInt;
      vHiInt:=tmp;
      result:=True;
    end;
  Except end;
end;

Function GetDecPalces:integer;
// get field lenght transact famount
begin
  // Result := 2;


  if not dmDatabase.SetOfBooksPropertys.DataParameter.BDataEntryReal then
    if  dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty = 0 then
      Result:=2
    else
      begin
       if Result > dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty then
        Result :=  dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty ;
      end;
 if Result > 8 then
    Result := 8 ;
end;

Procedure DeleteOnlineBank;
begin
    dmDatabase.tblBankDnl.Close;
    ExecSql('Delete from dnlbanks');
end;

Procedure GetDirFileList(aDirMusk:String;Var Result : TStringList);
Var
  Sr:TSearchRec;
begin
{$I-}
  if FindFirst(aDirMusk, faAnyFile, sr) = 0 then
  begin
    repeat
      if not((sr.Attr and faDirectory) = faDirectory) then
      begin
        Result.Add(sr.Name);
      end;
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
  end;
  if IOResult<>0 then ;
{$I+}
end;
 

Procedure SetAccountGoupedSQL(GroupIndex:Integer;ExtraSql:String;BIncExp:Boolean=False);
Var
  h:Boolean;

begin
  h:= dmDatabase.tblSysVars.Active;
  dmDatabase.tblSysVars.Active:=tRUE;
  if GroupIndex = 1 then
     dmDatabase.flGroupsID:=21
  else
     dmDatabase.flGroupsID:=20;
   with dmdatabase.qrBalSheetAccount,dmdatabase.qrBalSheetAccount.SQL do
   begin
     Close;
     Clear;
     text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DatabaseAccess_GroupedAccountSql') + ExtraSql;
     {Text:='Select Account.WAccountID, Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, Account.WAccountTypeID, ';
       Add(' Account.SDescription, Account.WReportingGroup1ID, Account.WReportingGroup2ID, Account.BSubAccounts, Account.BIncomeExpense, ');
       Add(' Account.SACCOUNTCODE, Groups.WParentGroup1ID, Groups.WParentGroup2ID, Groups.WSortNo');
       Add(' From Account, Groups ');
       Add(' Where Account.WReportingGroup'+IntToStr(dmDatabase.flGroupsID-19)+'ID=Groups.WGroupID'); }
       if BIncExp then
         Add(' Order By Groups.WSortNo,Groups.WParentGroup'+IntToStr(dmDatabase.flGroupsID-19) +'ID Desc, Account.SACCOUNTCODE')
       else
         Add(' Order By Groups.WParentGroup'+IntToStr(dmDatabase.flGroupsID-19) +'ID Desc, Groups.WSortNo,Account.SACCOUNTCODE');
   end;
   dmDatabase.tblSysVars.Active:=H;
end;

Function GetCurrentBooksName:string;
begin
  result := '' ;
  if TheGlobalDataObject.Books.ActiveBooks <> nil then
     result  := TheGlobalDataObject.Books.ActiveBooks.Name ;
end;

Function  GetPhyAddress(WAccountID:Integer):String;
begin
end;

FUnction  GetUnitDesc(UnitID:Integer):String;
Var
  h:Boolean;
begin
  h:= dmDatabase.tblUnit.active;
  dmDatabase.tblUnit.Open;
  dmDatabase.tblUnit.Locate('WUnitID', UnitID, []);
  Result := dmDatabase.tblUnitSDescription.Value;
  dmDatabase.tblUnit.Active := h;
end;



Function GetCustContact(AccountID:Integer;Var Tel,Fax,TaxRef:String):String;
var
  h1:Boolean;
  id:Integer ;
  Dummy1,Dummy2,Dummy3 : String ;
begin
  h1:= dmDatabase.tblAccount.Active;
  dmDatabase.tblAccount.Active := True;
  id :=0;
  Tel :='';
  Fax :='';
  if dmDatabase.tblAccount.Locate('WAccountID',AccountID,[]) then
  begin
    if dmDatabase.tblAccountWaccountTypeID.Value=1 then
    begin
      dmDatabase.tbldebtor.Open;
      if dmDatabase.tbldebtor.Locate('WAccountID',AccountID,[]) then
      begin

        ID := dmDatabase.tblDebtorWContactID.AsInteger;
        GetContactInfo(ID,Dummy1,Tel,Dummy2,Fax,Dummy3);
        TaxRef := dmDatabase.tbldebtorSReference.Value;;
      end;
      dmDatabase.tbldebtor.Close;
    end
    else
    if dmDatabase.tblAccountWaccountTypeID.Value=2 then
    begin
      dmDatabase.tblCreditor.Open;
      if dmDatabase.tblCreditor.Locate('WAccountID',AccountID,[]) then
      begin
        ID := dmDatabase.tblCreditorWContactID.Value;
        GetContactInfo(ID,Dummy1,Tel,Dummy2,Fax,Dummy3);
        TaxRef := dmDatabase.tblCreditorSReference.Value;
      end;
      dmDatabase.tblCreditor.Close;
    end;
  end;
  Result :='';
  if id>0 then
  begin
    //dmDatabase.tblContact.Open;
   // if dmDatabase.tblContact.Locate('WContactID',ID,[]) then
     result := GetContactName(ID);
     // Result := dmDatabase.tblContactSContactName.Value;
  end;
  dmDatabase.tblAccount.Active := h1;
 // dmDatabase.tblContact.Close;
end;

// todo : All this needs encoding (Name cannot contain <> etc but must convert to &ltr; &gtr;
// The smae must be done when reading this from file I.e. &ltr; becomes <
Function TxfSign:String;
begin
  Result := XmlID + #13#10;
  Result := Result + TxfID+#13#10;

  if TheGlobalDataObject.Books.ActiveBooks <> nil then
  Result := Result + '<booksname>'+TheGlobalDataObject.Books.ActiveBooks.Name+'</booksname>'+#13#10
  else
  Result := Result + '<booksname>'+DMTCCoreLink.TheZConnection.Database+'</booksname>'+#13#10
end;

// todo : Date is a flawn algorithem for replication.
// We need to change this to garantee the workign on high volume systems
Procedure  DocRecDates(Var DtFrom,DtTo:TDateTime;bRead:Boolean=True);
begin
  dmdatabase.tblSysParams.Open;
  if bRead then
  begin
    DtTo := Now;
    DtFrom := EncodeDate(2000,1,1) + SysUtils.Time;    
    DtTo := StrDb2Datetime(ReadSysParam('DDocRepTo',DateTime2DbStr(DtTo),0).AsString);
    DtFrom := StrDb2Datetime(ReadSysParam('DDocRepFrom',DateTime2DbStr(DtFrom),0).AsString);
  end
  else
  begin
    WriteSysParam('DDocRepFrom',DateTime2DbStr(DtFrom));
    WriteSysParam('DDocRepTo',DateTime2dbStr(DtTo));
  end;
  dmdatabase.tblSysParams.Open;
end;


Procedure PrepareExport(aFileList:TStringList;dtFrom,DtTo:TDateTime;UseDate:Boolean;ExceptUser:Integer;Prep:String='');
Var
  aFileName:String;
  trMin,trMax:Integer;
begin
  if Not UseDate then
    DocRecDates(dtFrom,dtFrom);
  aFileList.Clear;
  aFileList.Delimiter:='*';
  AutoPost := True;
  Try
    Try
      if CheckNewSince(dtFrom,DtTo,0,ExceptUser,trMin,trMax) then
      begin


        aFileName:='Doc'+Prep+TheGlobalDataObject.Books.ActiveBooks.Name+IntToStr(CurrentUser)+'.txf';
        if ExportXmlDoc(dtFrom,dtTo,GettmpFolder + aFileName,GettmpFolder+'Lines.txf','DocLog.Log',False,4,true)=0 then
          AddThisStr(aFileList,aFileName);
      end;
    Except end;
    Try
      if CheckNewSince(dtFrom,DtTo,1,ExceptUser,trMin,trMax) then
      begin
        aFileName:='Bat'+Prep+TheGlobalDataObject.Books.ActiveBooks.Name+IntToStr(CurrentUser)+'.txf';
        if ExportXmlTransact(trMin,trMax,-1,GettmpFolder + aFileName,'batLog.Log',4)=0 then
          AddThisStr(aFileList,aFileName);
      end;
    Except end;
    if (CalcOpenBat=1) or (Prep<>'') then
      PrepareBatchRep(aFileList,ExceptUser,Prep);
  Finally
    AutoPost := False;
  end;
end;

Procedure PrepareBatchRep(aFileList:TStringList;ExceptUser:Integer;Prep:String='');
Var
  ABatRec:TBatchCon;
  s:String;
  ID:INteger;
begin
  dmDatabase.qGen.CLose;
  dmDatabase.qGen.Filtered := False;
  dmDatabase.qGen.Filter:='';
  dmDatabase.qGen.SQL.Text := 'Select * from Batcon where BPosted<>1';
  dmDatabase.qGen.Open;
  While Not dmDatabase.qGen.Eof do
  begin
    {Mus open The batc from Here}
    GetBatchConRec(ABatRec,True,dmDatabase.qGen);
    OpenBatch(ABatRec.SName,ID,False);
    s := Prep+dmDatabase.qGen.FieldByName('SFileName').AsString;
    S:= ChangeFileExt(s,'.Txf');
    ExportBact2Txf(ABatRec,GettmpFolder + s);
    aFileList.Add(s);
    {CLose the Batch and Rename it So It will not be sent Again}
    dmDatabase.tblBatch.Close;
    dmDatabase.tblBatchRefTotals.Close;
    dmDatabase.qGen.Next;
    dmDatabase.tblBatch.close;
  end;
end;



Function GetTagValue(Stext,atag:STring):String;
Var
  i,j:Integer;
begin
  i:=Pos('<'+aTag+'>',sText);
  j:=Pos('</'+aTag+'>',sText);
  Result := '';
  if (i>0) And (J>0) then
  begin
    i:=i+Length(aTag)+2;
    Result := Copy(sText,i,j-i);
  end;
end;

Procedure GetBDETimeStamp(Var DateFormat,TimeFormat:String);
begin
  // todo :BDEDATEFORMAT
  TimeFormat:='hh:nn:ss';
  DateFormat := 'yyyy' +  DateSeparator + 'mm' +
        DateSeparator + 'dd' ;
{  Check(DbiGetDateFormat(Params));
//  DbiGetTimeFormat(tmParams);
  with Params do begin
   case iDateMode of
      0: DateFormat := 'mm' + szDateSeparator + 'dd' +
        szDateSeparator + 'yyyy';
      1: DateFormat := 'dd' + szDateSeparator + 'mm' +
        szDateSeparator + 'yyyy';
      2: DateFormat := 'yyyy' + szDateSeparator + 'mm' +
        szDateSeparator + 'dd';
    end;
  end;
  TimeFormat:='hh:nn:ss'; }
end;

Function DateToDBEStr(ADate:TDateTime):String;
Var
  D,T:String;
begin
  GetBDETimeStamp(D,T);
  DateTimeToString(Result,d,ADate);
end;

Function DateTimeToDBEStr(ADate:TDateTime):String;
Var
  D,T:String;
begin
  GetBDETimeStamp(D,T);
  DateTimeToString(Result,d+' '+t,ADate);
end;


Function  CheckNewSince(Atime,aTimeTo:TDateTime;Atype:Integer;ExceptUser:Integer;Var trMin,TrMax:Integer):Boolean;
Var
  S:String;
  s2:String;
begin
  trMin := -1;
  TrMax := -1;
  result := False;

  if Atype=0 then
  begin
    s:='Select DSysDate From DocHead Where ' + DateTimeToFilter('DsysDate',Atime,ATimeTo);
    s2:='Select Min(WDocID),Max(WDocID) From DocHead Where ' + DateTimeToFilter('DsysDate',Atime,ATimeTo);
  end;
  if Atype=1 then
  begin
    s:='Select DSysDate From BatCon Where BDocSource<>1 AND BPosted=True AND '+ DateTimeToFilter('DsysDate',Atime,ATimeTo);
    s2:='Select Min(WBatchID),Max(WBatchID) From BatCon Where BDocSource<>1 AND BPosted=1 AND '+ DateTimeToFilter('DsysDate',Atime,ATimeTo);
  end;
  if ExceptUser>0 then begin
    s:= s + ' AND (WUserID<>'''+IntToStr(ExceptUser)+''')';
    s2:= s2 + ' AND (WUserID<>'''+IntToStr(ExceptUser)+''')';
  end;

  Try
    DmDatabase.qGen.Close;
    DmDatabase.qGen.Filtered:=False;
    DmDatabase.qGen.Filter:='';
    DmDatabase.qGen.SQL.Text:=s;
    DmDatabase.qGen.Open;
    Result := DmDatabase.qGen.RecordCount>=1;
    if Result then begin
     DmDatabase.qGen.Close;
     DmDatabase.qGen.SQL.Text:=s2;
     DmDatabase.qGen.Open;
     trMin := DmDatabase.qGen.Fields[0].AsInteger;
     TrMax := DmDatabase.qGen.Fields[1].AsInteger;
    end;
  Except end;
  DmDatabase.qGen.Close;
  DmDatabase.qGen.SQL.Text:='';
end;


Function CanUserBatch(UserID,aBatID:Integer):Boolean;
begin
  Result := ReadSysParam('BUseBatch',True,UserID,aBatID).asBoolean;
end;

Procedure SetCanUserBatch(UserID,aBatID:Integer;Value:Boolean);
begin
  WriteSysParam('BUseBatch',Bool2Str(Value),UserID,aBatID);
end;

Procedure SeekAccount(Var aAccRec:TAccountRec);
begin
  if aAccRec.WAccountID<=0 then
    aAccRec.WAccountID:=StrToIntDef(GetDbDescriptionEx('Account','WAccountID','WaccountTypeID='''
        +IntToStr(aAccRec.WAccountTypeID)+''' AND SACCOUNTCODE='''+aAccRec.SACCOUNTCODE+''''),0)
  else ;

end;

Function GetDbDescriptionEx(atable,Field,Where:string):String;
Var
  aQry:TuniQuery;
begin
  try
    aQry:=TuniQuery.Create(nil);
    try
      aQry.Connection := dmDatabase.qGen.Connection;
      aQry.Close;
      aQry.SQL.Text:='Select * from ' + atable ;
      Where:=Trim(Where);
      if Where<>'' then
        aQry.SQL.Text := aQry.SQL.Text + ' Where '+ Where;
      aQry.Open;
      Result := aQry.FieldByName(Field).AsString;
     except end;
  finally
     aQry.Close;
     FreeAndNil(aQry);
  end;
end;

Function CheckBacthSecq(aBatchID:Integer):Boolean;
{This function will Check if the current BatchID is in Sequence if the
  Prior imported batch}
//Var
//  tmp:Integer;
begin
  Result := True;
end;

Function GetDbDescription(atable:string;KeyID:Integer):String;
begin
  Result :='';
  if sameText(aTable,'groups') then
  begin
    try
      try
        dmDatabase.qGen.Close;
        dmDatabase.qGen.SQL.Text:='Select * from v_groups Groups where WgroupID='''+IntToStr(KeyID)+'''';
        dmDatabase.qGen.Open;
        Result := dmDatabase.qGen.FieldByName('Sdescription').AsString;
       except end;
    finally
       dmDatabase.qGen.Close;
    end;
  end
  else if sameText(aTable,'contact') then
  begin
    try
      dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Text:='Select * from contact where WcontactID='''+IntToStr(KeyID)+'''';
      dmDatabase.qGen.Open;
      Result := dmDatabase.qGen.FieldByName('Sdescription').AsString;
    finally
       dmDatabase.qGen.Close;
    end;
  end
  else if sameText(aTable,'periods') then
  begin
    try
      dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Text:='Select * from periods where WperiodID='''+IntToStr(KeyID)+'''';
      dmDatabase.qGen.Open;
      Result := dmDatabase.qGen.FieldByName('Sdescription').AsString;
    finally
       dmDatabase.qGen.Close;
    end;
  end
  else if sameText(aTable,'types') then
  begin
    try
      dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Text:='Select * from type where WtypeID='''+IntToStr(KeyID)+'''';
      dmDatabase.qGen.Open;
      Result := dmDatabase.qGen.FieldByName('Sdescription').AsString;
    finally
       dmDatabase.qGen.Close;
    end;
  end
  else if sameText(aTable,'account') then
  begin
    try
      dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Text:='Select * from account where WaccountID='''+IntToStr(KeyID)+'''';
      dmDatabase.qGen.Open;
      Result := dmDatabase.qGen.FieldByName('Sdescription').AsString;
    finally
       dmDatabase.qGen.Close;
    end;
  end;

end;

Function Var2Float(v:Variant):Real;
begin
  if TVarData(v).VType in [varNull,varEmpty] then
    Result :=0
  else
    Result :=StrToFLoatDef(v,0);
end;

Function DirectSQLToStr(SQLText,Field:String;Var Value:String):Boolean;
Var
  Qry:TuniQuery;
begin
  Qry:=TuniQuery.Create(Nil);
  Try
    Result := False;
    Try
     Qry.Connection :=DmDatabase.ZMainConnection;
     Qry.SQL.Text:=SQLText;
     Qry.Open;
     Value := Qry.FieldByName(Field).AsString;
     Qry.Close;
     Result := True;
     except
       Result := False;
     end;
  Finally
    FreeAndNil(Qry);
  end;

end;

Function DirectSQLToInt(SQLText,Field:String;Var Value:Integer):Boolean;
Var
  S:String;
begin
  Value := 0;
  Result := DirectSQLToStr(SQlText,Field,s);
  if Result then
    Value := StrToIntDef(s,0);
end;

procedure SetFieldWithIndexValue(AField:TField;AStringList : TStrings ; AID : Integer);
begin
  AField.Clear ;
  if AID <> -1 then
     AField.AsInteger :=  Integer(AStringList.Objects[AID]) ;
end;



function  GetItemIndexFromId(AStringList : TStrings ; AID : Integer ) : Integer ;
begin
  result := AStringList.IndexOfObject(TObject(AID)) ;
end;
Procedure  FillStringListWithSelect(AStringList : TStrings ;ASelectIntKeyDescFromTable : String ; AEmptyTransaltionNr : integer = 20046);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := dmDatabase.ZMainconnection ;
    AQuery.SQL.Text := ASelectIntKeyDescFromTable ;
    AStringList.Clear ;
    AStringList.Add(GetTextLang(AEmptyTransaltionNr)) ;
    AQuery.open ;
    if not (AQuery.fields[0].DataType in [ftSmallint, ftInteger, ftWord,ftFloat,
                                          ftCurrency,ftBytes, ftVarBytes, ftAutoInc,
                                          ftBlob, ftMemo, ftGraphic, ftFmtMemo,ftLargeint]) then
       raise Exception.Create('Wrong datatype in select');
    while not AQuery.Eof do
     begin
       AStringList.AddObject(AQuery.fields[1].AsString,TObject(AQuery.fields[0].asinteger));
       AQuery.Next ;
     end;
  finally
     AQuery.free ;
  end;
end;

procedure DirectSQLToBool(SQLText,Field:String;Var Value:Boolean);
Var
  S:String;
begin
  Value := DirectSQLToStr(SQlText,Field,s);
  s:=LowerCase(s);
  if Value then
    Value := (s = '1')
  else
    Value := False;
end;



Function DirectSQL(SQLText:String):Boolean;
Var
  Qry:TuniQuery;
begin
  Qry:=TuniQuery.Create(Nil);
  Try
    Result := False;
    Try
     Qry.Connection:=DmDatabase.ZMainconnection;
     Qry.SQL.Text:=SQLText;
     Qry.ExecSQL;
     Result := True;
     except
       Result := False;
     end;
  Finally
    FreeAndNil(Qry);
  end;
end;

Procedure SaveAccountAccess(Value:TrSelect;aUserID:Integer);
Var
  ic:Integer;
  F:String;
begin
    DirectSQL('Delete from sysparams where WTypeID=7002 AND wUserID= '+IntToStr(aUserID));
  For ic:=0 to High(Value) do
  begin
    if Value[ic].Value then
    begin
      F:='B'+IntToStr(Value[ic].ID);
      WriteSysParam(f,Bool2Str(Value[ic].Value),aUserID,7002);
    end;
  end;
end;

Procedure LoadAccountAccess(Var Value:TrSelect;aUserID:Integer);
Var
  Hold:Boolean;
  var
  AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;

  Try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'select * from sysparams where WTypeID=7002 AND wUserID=' +IntToStr(aUserID) ;
    AQuery.OPEN ;



    While Not AQuery.Eof do
    begin
      SetRec(Value,str2Int(Copy(AQuery.FieldByName('SParamName').AsString,2,50)),
            Str2Bool(AQuery.FieldByName('SParamValue').AsString));
      AQuery.Next;
    end;
  Finally
    AQuery.free ;

  end;

end;

Function GetAccExclFilter(Var AccBlocked:TrSelect):String;
Var
  ic:integer;
begin
  InitAccBlockArray(AccBlocked,CurrentUser,True);
 //  LoadAccountAccess(AccBlocked,CurrentUser);
  Result :='';
  For ic:=0 to Length(AccBlocked)-1 do
  begin
    if Not AccBlocked[ic].Value then Continue;
    if Result<>'' then
      Result := Result +' AND ';
    Result := Result + ' WAccountID<>'''+IntToStr(AccBlocked[ic].ID)+''''
  end;
end;

Function AccountIsBlocked(WAccID:Integer;AccBlocked:TrSelect):Boolean;
Var
  ic:Integer;
begin
  Result := False;
  for ic:=0 to High(AccBlocked) do begin
    if WAccID=AccBlocked[ic].ID then begin
      Result := AccBlocked[ic].Value;
      Break;
    end;
  end;
end;




Procedure InitAccBlockArray(Var Value:TrSelect;WUSerID : Integer = 0 ; JustBlocked:Boolean = false);
Var
  ic:Integer;
  Bool:Boolean;
begin
  Bool := dmDatabase.QryAccountList.Active;
  dmDatabase.QryAccountList.sql.Text := 'select * from account' ;
  if JustBlocked then
     begin
       dmDatabase.QryAccountList.sql.Text := 'Select * from account , SYSPARAMS where cast(substring(sparamname from 2 for 50) as integer) = Account.WAccountid and SParamValue =' + QuotedStr('True') +'  and WTypeID=7002 ';

       dmDatabase.QryAccountList.sql.add('and  SYSPARAMS.Wuserid = ' + IntToStr(WUSerID));

     end;
  dmDatabase.QryAccountList.Active := True;
  dmDatabase.QryAccountList.Filtered:= False;
  dmDatabase.QryAccountList.First;
  SetLength(Value,dmDatabase.QryAccountList.RecordCount+1);
  ic:=0;
  While Not dmDatabase.QryAccountList.Eof do
  begin
    Value[ic].ID := dmDatabase.QryAccountList.FieldByName('WAccountID').AsInteger;
    Value[ic].Value := False;
    if JustBlocked then
       Value[ic].Value := true ;
    dmDatabase.QryAccountList.Next;
    inc(ic);
  end;
  dmDatabase.QryAccountList.Active := Bool;
end;


Procedure DoneAccBlockArray(Var Value:TrSelect);
begin
  SetLength(Value,0);
end;

Function IncBatchLine(BatID:integer):Integer;
begin
  DirectSQLToInt('Select WlineCount from BatCon Where WbatchID='''+IntToStr(Batid)+'''','WlineCount',Result);
  if Result<=0 then Result := 1;
  DirectSQL('Update Batcon set WlineCount='''+IntToStr(Result+1)+''' where WbatchID='''+IntToStr(Batid)+'''');
end;

Function DateToFilter(Field:String;FrDate,ToDate:TdateTime;SQL:Boolean=True):String;
begin
  if Sql then
    Result := Field+'>='''+DateToDBEStr(FrDate)+''' AND '+Field+'<= '''+DateToDBEStr(ToDate)+''''
  else
    Result := Field+'>='''+DateToDBEStr(FrDate)+''' AND '+Field+'<= '''+DateToDBEStr(ToDate)+'''';
end;

Function DateTimeToFilter(Field:String;FrDate,ToDate:TdateTime;SQL:Boolean=True):String;
begin
  if Sql then
    Result := Field+'>='''+DateTimeToDBEStr(FrDate)+''' AND '+Field+'<= '''+DateTimeToDBEStr(ToDate)+''''
  else
    Result := Field+'>='''+DateTimeToStr(FrDate)+''' AND '+Field+'<= '''+DateTimeToStr(ToDate)+'''';
end;


Function GetTxfTypeSpec:Integer;
  Function Checkucs(aName : String):Boolean;
  Var
    xc:String;
  begin
    xc := aName;
    DirectSQLToStr('Select * from Users where Upper(SUserName)='''+ UpperCase(xc) + '''','SUserName',aName);
    Result := SameText(xc,aName);
  end;
begin
  Result := 0;
  if Checkucs('ucs') then
    Result := 1;
  AccountLock:=Result;
end;

Procedure BatConRelink(aBatID,aBatType,aUserid:Integer;bPosted:Boolean);
Var
  H:Boolean;
begin
 // todo : SQLOPTIMIZE
  with dmDatabase do begin
    H:=tblBatchControl.Active;
    tblBatchControl.Active:=True;
    tblBatchControl.Append;
    tblBatchControlWBatchID.AsInteger := aBatID;
    tblBatchControlWUserID.Value := aUserid;
    tblBatchControlWBatchTypeID.Value := aBatType;
    tblUser.Open;
        if ReadNwReportOp('BUseGeneralNumber','false').Asboolean then
         dmDatabase.tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
        dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);
     tblUser.Edit;
    tblBatchControlSBatchNumber.Value := dmDatabase.tblUserSNextBatchNumber.Value;
    tblUsersNextBatchNumber.Value := _IncrementString(dmDatabase.tblUsersNextBatchNumber.Value);
    tblUser.Post;
    tblUser.Close;
    tblBatchControlBPosted.Value := Ord(bPosted);
    tblBatchControlBImported.Value := ord(False);
    tblBatchControlSAlias.Value := '';
    tblBatchControl.Post;
    tblBatchControl.Active := h;
    
  end;
end;

Procedure LastBackupFileName(aName,aFolder:String);Overload;
begin
 // dmdatabase.tblSysParams.Open;
  WriteSysParam('SLastBackupName',aName,0);
  WriteLongSysParam('SLastBackupFolder',aFolder,0);
 // dmdatabase.tblSysParams.Close;
  WriteT3IniFile('BACKUP','LASTPATH',aFolder);
end;

Function  LastBackupFileName:String; Overload;
begin
 // dmdatabase.tblSysParams.Open;
  Result := ReadLongSysParam('SLastBackupFolder',CurrentUser) ;
  if Result = '' then result := 'C:\temp\' ;
  Result := IncludeTrailingPathDelimiter(Result) + ReadSysParam('SLastBackupName','tcbackup.exe',0).AsString;
  Result := ChangeFileExt(REsult,'.exe');
 // dmdatabase.tblSysParams.Close;
end;

Function ValidateUcsImport(Var aPrior,aCurrent:String;Save:Boolean):Integer;
Var
  tmp:String;
begin
  dmdatabase.tblSysParams.Open;
  Result := 0;
  if GetTxfTypeSpec<>1 then exit;
  aPrior := ReadSysParam('SImportFileSeq','0',0).AsString;
  SplitStrNum(aPrior,tmp);
  aPrior := tmp;
  SplitStrNum(aCurrent,tmp);
  aCurrent := tmp;
  if save then begin
    WriteSysParam('SImportFileSeq',aCurrent,0);
    aPrior :=aCurrent
  end
  else begin
   if Not((Str2Int(aPrior)=Str2Int(aCurrent)-1) OR (Str2Int(aPrior)=0) OR (aPrior=aCurrent)) then
     Result := 2005;
  end;
  dmdatabase.tblSysParams.Close;
end;

Procedure LoadBooksVars;
begin

end;

Function IsMainAccountExist(AccountCode:String):Integer;
{This return
  0 if the main account exists and AccountCode is a sub account
  1 if not 1
  2 if AccountCode is main account
  }
Var
  MainCode,SubCode:String;
begin
  MainCode := GetMainAccountCode(AccountCode);
  SubCode  := GetSubAccountCode(AccountCode);
  if SameText(SubCode,StringOfChar('0',Length(SubCode))) then
    Result := 2
  else if AccountExists('SACCOUNTCODE',MainCode+StringOfChar('0',Length(SubCode)),false) then
    Result := 0
  else
    Result := 1
end;

Function  AccountExists(Search,Look:String;Partial:Boolean):Boolean;
Var
  Opts : TLocateOptions ;
  tmpLook : Variant;
begin
  Try
    dmDatabase.QryAccountList.DisableControls;
    dmDatabase.QryAccountList.Open;
    dmDatabase.QryAccountList.Filtered := False;
    Opts := Opts + [LoCaseInsensitive];
    if Partial then
      Opts := Opts + [LoPartialkey]
    else
      Opts := Opts - [LoPartialkey];
    if Pos(';',Look)>0 then begin
      tmpLook := VarArrayCreate([0, 1], varVariant);{I Will Add for More than 2 Fields}
      tmpLook [0] := Copy(Look,1,Pos(';',Look)-1);
      tmpLook [1] := Copy(Look,Pos(';',Look)+1,Length(Look));
      Result :=   dmDatabase.QryAccountList.Locate(Search,tmpLook,Opts);
    end
    else
      Result :=   dmDatabase.QryAccountList.Locate(Search,Look,Opts)
  Finally
    dmDatabase.QryAccountList.Close;
    dmDatabase.QryAccountList.EnableControls;
  end;
end;

Function CanUserAccesSACCOUNT(WUserID,wAccountType:Integer):Boolean;
Var
  XUserID:String;
begin
  dmDatabase.tblSysParams.Open;
  XUserID := IntToStr(WUserID);
  DirectSQLToStr('Select * from Users where WUserID='+ IntToStr(WUserID) +
                  ' AND BDIsabled<>1','WUserID', XUserID);
  Result := StrToIntDef(XUserID,0)=WUserID;
  if Not Result Then exit;
  Case wAccountType of
  1: Result := ReadSysParam('BEditDebtor',true,WUserID,0).AsBoolean;
  2: Result := ReadSysParam('BEditCreditor',true,WUserID,0).AsBoolean;
  3: Result := ReadSysParam('BEditBank',true,WUserID,0).AsBoolean;
  4: Result := ReadSysParam('BEditTax',true,WUserID,0).AsBoolean;
  else
    Result := ReadSysParam('BGlAccount',true,WUserID,0).AsBoolean;
  end;
end;

function CheckTransActions(MainAccountNo, SubAccountNumber : String) : Boolean;
  {
  Checks for transactions relies
  on the Accounts table being open
  }
//this should be replaced with a qGen
//then it would not rely on the account being open
begin
  if not dmDatabase.tblAccount.Active then dmDatabase.tblAccount.Open;
  dmDatabase.tblTransaction.Filtered:=False;
  dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([MainAccountNo + SubAccountNumber]), []);
  dmDatabase.tblTransaction.Open;
  CheckTransActions := dmDatabase.tblTransaction.Locate('WAccountID', dmDatabase.tblAccountWAccountID.Value, []);
  dmDatabase.tblTransaction.Close;
end;

function CheckTransActionsByID(AccountID:Integer) : Boolean;
  {
  Checks for transactions relies
  on the Accounts table being open
  }
//this should be replaced with a qGen
//then it would not rely on the account being open
begin
 CheckTransActionsByID :=  DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from Account where WAccountID = ' + IntToStr(AccountID) ) <> 0 ;   
end;

procedure TransferTransactions(FromID, ToID:Integer);
  {
  Transfers transactions and balances from one account
  to another.

  The Account numbers (main and sub) MUST have a -
  seperating them, or this wont work. The accounts
  table should also be open before using this.

  ??? Changed by Sylvain to Work with ID and not With Code
  25/07/00
  }
var
  MainFromID, MainToID, WCnt ,FromTypeID,ToTypeID: Integer;
  BFromMainToSub : Boolean;
  FHold : real;
  i : Integer;
  FromAccountCode,
  ToAccountCode:String;
begin
  // Sylvain. This procedure Must use accountID instead of Account Code
  // b'cause, we can have same acc_Code for Debtor and Creditor ???
  //get the From account Code
  dmDatabase.tblAccount.Locate('WAccountID',FromID,[]);
  FromAccountCode:= dmDatabase.tblAccountSMAINACCOUNTCODE.Value+'-'+dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
  FromTypeID := dmDatabase.tblAccountWAccountTypeID.Value;
  //get the to account Code
  dmDatabase.tblAccount.Locate('WAccountID',ToID,[]);
  ToAccountCode:= dmDatabase.tblAccountSMAINACCOUNTCODE.Value+'-'+dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
  ToTypeID := dmDatabase.tblAccountWAccountTypeID.Value;
  //check if its the special case of main to sub account
  BFromMainToSub  := false;
  if (GetMainAccountCode(FromAccountCode) = GetMainAccountCode(ToAccountCode))
    and (GetSubAccountCode(FromAccountCode) = '000') AND Not(FromTypeID in [1,2])  then
  BFromMainToSub := true;
  //get the Main from account ID
  if (dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID', VarArrayOf([GetMainAccountCode(FromAccountCode)+ '000',FromTypeID]), []))
  and (dmDatabase.tblAccountWAccountID.Value <> FromID) then
    MainFromID := dmDatabase.tblAccountWAccountID.Value
  else
    MainFromID := 0;
  //get the Main to account ID
  if (dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID', VarArrayOf([GetMainAccountCode(ToAccountCode)+ '000',ToTypeID]), []))
  and (dmDatabase.tblAccountWAccountID.Value <> ToID) then
    MainToID := dmDatabase.tblAccountWAccountID.Value
  else
    MainToID := 0;
  dmDatabase.tblTransaction.Open;
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := 'WAccountID = ''' + IntToStr(FromID) + '''';
  dmDatabase.tblTransaction.Filtered := True;
  dmDatabase.tblTransaction.First;
  dmDatabase.tblTotals.Open;
  if not (BFromMainToSub ) then
  begin
    For i:=0 to 26 do
    begin
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([FromID, i, 1]), []);
      dmDatabase.tblTotals.Edit;
      FHold:= dmDatabase.tblTotalsFAmount.Value;
      dmDatabase.tblTotalsFAmount.Value := 0;
      dmDatabase.tblTotals.Post;
      //add the amount to the to account
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([ToID, i, 1]), []);
      dmDatabase.tblTotals.Edit;
      dmDatabase.tblTotalsFAmount.Value := dmDatabase.tblTotalsFAmount.Value + FHold;
      dmDatabase.tblTotals.Post;
      //subtract the amount from the from account's main account
      if MainFromID <> 0 then
      begin
        dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([MainFromID, i, 1]), []);
        dmDatabase.tblTotals.Edit;
        dmDatabase.tblTotalsFAmount.Value := dmDatabase.tblTotalsFAmount.Value - FHold;
        //FHold:=dmDatabase.tblTotalsFAmount.Value;
        //dmDatabase.tblTotalsFAmount.Value := 0;
        dmDatabase.tblTotals.Post;
      end;
      //add the amount to the to account's main account
      if MainToID <> 0 then
      begin
        dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([MainToID, i, 1]), []);
        dmDatabase.tblTotals.Edit;
        dmDatabase.tblTotalsFAmount.Value :=dmDatabase.tblTotalsFAmount.Value+ FHold;
        dmDatabase.tblTotals.Post;
      end;
    end;
    // Transfert Transactions in Transaction table
    dmDatabase.tblTransaction.First;
    while not dmDatabase.tblTransaction.Eof do
    begin
      dmDatabase.tblTransaction.Edit;
      dmDatabase.tblTransactionWAccountID.Value := ToID;
      dmDatabase.tblTransaction.Post;
    end; //while
  end; // if BFromMainToSub

  // Added by Sylvain

  dmDatabase.tblDocHeader.Filtered:=False;
  dmDatabase.tblDocHeader.sql.Text :=' Select * from dochead where wAccountID ='+IntToStr(FromID);
  dmDatabase.tblDocHeader.open;
  While not dmDatabase.tblDocHeader.eof do
  begin
    dmDatabase.tblDocHeader.Edit;
    dmDatabase.tblDocHeaderWaccountID.Value:=ToID;
    dmDatabase.tblDocHeader.Post;
  end;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblDocHeader.Filtered:=False;
  dmDatabase.tblDocHeader.Filter:='';
//now deal with the special case transferirng
// from a main to a sub account
//  of the same main account
    if  BFromMainToSub  then
    begin
    for WCnt := 0 to 26 do
    begin
      // Added By Sylvain
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([FromID, WCnt, 1]), []);
      FHold :=  dmDatabase.tblTotalsFAmount.Value;
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([ToID, WCnt, 1]), []);
      dmDatabase.tblTotals.Edit;
      dmDatabase.tblTotalsFAmount.Value := FHold;
      dmDatabase.tblTotals.Post
    end;
    //now do budgets
    //first the opening balance
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([FromID, 0, 0]), []);
      FHold :=  dmDatabase.tblTotalsFAmount.Value;
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([ToID, 0, 0]), []);
      dmDatabase.tblTotals.Edit;
      dmDatabase.tblTotalsFAmount.Value := FHold;
      dmDatabase.tblTotals.Post;
    //now the rest of the budgets
    for WCnt := 14 to 26 do
    begin
      // Added By Sylvain
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([FromID, WCnt, 0]), []);
      FHold :=  dmDatabase.tblTotalsFAmount.Value;
      dmDatabase.tblTotals.Locate('WAccountID; WPeriodID; BActual', VarArrayOf([ToID, WCnt, 0]), []);
      dmDatabase.tblTotals.Edit;
      dmDatabase.tblTotalsFAmount.Value := FHold;
      dmDatabase.tblTotals.Post
    end;

    dmDatabase.tblTransaction.First;
    while not dmDatabase.tblTransaction.Eof do
    begin
      dmDatabase.tblTransaction.Edit;
      dmDatabase.tblTransactionWAccountID.Value := ToID;
      dmDatabase.tblTransaction.Post;
    end; //while
  end;
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := '';
  dmDatabase.tblTransaction.Close;
end;





{ TSaveClientDatasetCallList }

function TSaveClientDatasetCallList.AddclientObject(ADataset : TDataset;aDisableControls : Boolean ) : TSaveClientDatasetCall;
begin
  Result := TSaveClientDatasetCall.Create(ADataset,aDisableControls);
  Self.Add(Result);
end;

destructor TSaveClientDatasetCallList.Destroy;
var
 i : Integer ;
begin
  for i := self.count -1 downto 0 do
     TObject(items[i]).free ;
  inherited;
end;

function TSaveClientDatasetCallList.GetclientObject(
  index: integer): TSaveClientDatasetCall;
begin
  result :=  TSaveClientDatasetCall(items[index]);
end;

Function  GetPeriodDesc(DateID:Integer):String;
{
  Gets the period Id Date Period and Return Period Description
}
Var
 Hold:Boolean;
begin
  Hold:=dmDatabase.tblPeriods.Active;
  dmDatabase.tblPeriods.Open;
  GetPeriodDesc:='';
  IF dmDatabase.tblPeriods.Locate('WPeriodID',DateID,[]) then
  Begin
   GetPeriodDesc:=Copy(dmDatabase.tblPeriodsSDescription.Value+'           ',1,10)+
     FormatDateTime('yy', dmDatabase.tblPeriodsDEndDate.Value);
  end;
  dmDatabase.tblPeriods.Active:=Hold;
End;

Procedure SaveBatConRecord(Arec:TBatchCon);
begin
  Arec.DSysDate := Now;
  dmDatabase.tblBatchControl.FieldByName('SBatchNumber').AsString := Arec.SBatchNumber;
  dmDatabase.tblBatchControl.FieldByName('SAlias').AsString := Arec.SAlias;
  dmDatabase.tblBatchControl.FieldByName('SFilename').AsString := Arec.SFilename;
  dmDatabase.tblBatchControl.FieldByName('WUserID').AsInteger:= Arec.WUserID;
  dmDatabase.tblBatchControl.FieldByName('WBatchTypeID').AsInteger:= Arec.WBatchTypeID;
  dmDatabase.tblBatchControl.FieldByName('WInitBatID').AsInteger:= Arec.WInitBatID;
  dmDatabase.tblBatchControl.FieldByName('WDocID').AsInteger:= Arec.WDocID;
  dmDatabase.tblBatchControl.FieldByName('WLineCount').AsInteger:= Arec.WLineCount;
  dmDatabase.tblBatchControl.FieldByName('BPosted').Asinteger:= ord(Arec.BPosted);
  dmDatabase.tblBatchControl.FieldByName('BImported').AsInteger:= ord(Arec.BImported);
  dmDatabase.tblBatchControl.FieldByName('BDocSource').AsInteger:= ord(Arec.BDocSource);
  dmDatabase.tblBatchControl.FieldByName('SUniqueID').AsString := Arec.SUniqueID;
  dmDatabase.tblBatchControl.FieldByName('DSysDate').AsDateTime := Arec.DSysDate;

  if Arec.SUniqueID='' then
    dmDatabase.tblBatchControl.FieldByName('SUniqueID').AsString := MakeBatUID;
  dmDatabase.tblBatchControl.Post;
end;

Function GetMessageByDocType(idDocType:Integer;sMessageID:String):String;
Var
  HoldActive:Boolean;
Begin
  HoldActive:=dmDatabase.tblSysVars.Active;
  if not HoldActive then
    dmDatabase.tblSysVars.Active:=True;
  Case idDocType of
  11:Result := dmDatabase.tblSysVars.FieldByName('SCreditNote'+sMessageID).AsString;
  12:Result := dmDatabase.tblSysVars.FieldByName('SPurchases'+sMessageID).AsString;
  13:Result := dmDatabase.tblSysVars.FieldByName('SGoodsReturned'+sMessageID).AsString;
  14:Result := dmDatabase.tblSysVars.FieldByName('SQuote'+sMessageID).AsString;
  15:Result := dmDatabase.tblSysVars.FieldByName('SOrder'+sMessageID).AsString;
  19:Result := 'Delivery Note ';
  else
    Result:=dmDatabase.tblSysVars.FieldByName('SInvoices'+sMessageID).AsString;
  end;
  if not HoldActive then
    dmDatabase.tblSysVars.Active:=HoldActive;
end;

Function CalcOpenBat:Integer;
begin
  Result := 0;
  if Not ReadSysParam('BDoOpenBaches',true,CurrentUser).asBoolean then exit;
  if ReadSysParam('rbUploadOnly',true,CurrentUser).AsBoolean then
    Result := 1
  else
    Result := 2;
end;


Procedure UpdateBatchConDet;
Var
  S:String;
  B:Boolean;
begin
  {Try to fill SUniqueID in batcon with some data to make the replication
   not duplicating old data}
  B := ReadSysParam('BUniqueBatOk',False,0).AsBoolean;
  if B then exit;
  S:='Update BatCon Set SUniqueID=''********'',WInitbatID=0 where (SUniqueID Is null) OR (SUniqueID='''')';
  if ExecSql(S)=0 then
    WriteSysParam('BUniqueBatOk','True');
end;



initialization
  CommonDbPath := GetCommonDbPath;

Finalization



end.




