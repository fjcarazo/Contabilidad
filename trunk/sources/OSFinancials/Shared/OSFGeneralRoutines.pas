(*
  Id: OSFGeneralRoutines.pas by Pieter Valentijn
  Released under the GNU General Public License
*)


unit OSFGeneralRoutines;


interface
uses comobj,SysUtils,ShellApi,Classes, Variants,Registry, DBAccess , Uni,
 TcashClasses,windows,forms,db,inifiles,DBGrids,cxImageComboBox;
type
  TReplaceParamsGetSqlFunction = function (Asql : String;AName : String ) : Variant  of object ;
  TosFProgressEvent= procedure (Var Stop :Boolean ; AText : String ; AMax , APostition : Integer;aTransId : Integer ) of object ;
  TDataBaseRoutines = class
   // Init database
   class Procedure SetDynamicFieldLengths(AComponent : TComponent );
   // Account Str routines
   class function  AddDashInAccCode(AccCode: String;ShortCode: Boolean = false): String;
   class function  AddDashInStdAccCode(AccCode: String): String;
   class function  AddDashInAccCodeNoPRefix(AccCode: String): String;
   class function  AccTypeToChar(aAccountTypeID: Integer): Char;
   class function  AccCharToType(AChar: Char): Integer;
   class function  SimpelAccountCodeToMainAccount(aAccountCode: String): String;
   class function  SimpelAccountCodeToSubAccount(aAccountCode: String): String;
   class function  ZipAccountCode(AccountCode: string): String; // Strips the code (2000-000 to 2000000 )
   class function  GetMainAccountCode(AccountNumber: String): String;
   class function  GetSubAccountCode(AccountNumber : String;AddDefaults : boolean = false;HasSeperator:Boolean = true): String;
   // Account database
   class function  CreateTotalsForAccount(aAccId : Integer;Force : Boolean = False): String;
   class function  GetAccountCode(aAccId : Integer): String;
   class function  GetAccountFullDescription(aAccId : Integer): String;
   class procedure GetAccountCodeAndDescription(aAccId : Integer; Var ACode , ADescription : String);
   class function  GetAccountType(aAccId : Integer): Integer;
   class procedure  GetAccountCodeAndTypeFromId(var AccountCode: string;  var TypeID: Integer; Accountid: Integer);
   class function   GetAccountDescription(aAccId: Integer): String;
   class function  GetAccountClassType(aAccId : Integer): Integer; // 0 = std , 1 =  sub accounts  2 = debconrol  3  = credcontrol  4 = retained earnings
   class Function  GetAccountIdFromCodeAndType(AccountCode:string;TypeID : Integer):integer;
   class function  GetUniqueAccountCode(APrefix : String ) : String ;
   class function  IsIncomeExpense(aAccId: Integer): Boolean;
   class function  IsSubAccount(aAccId : Integer ) : Boolean ;
   class function  IsOpenAccount(aAccId: Integer): Boolean;
   class function loadAccountItem(Var aAccountRec : TAccountRec) : Boolean ;
   // Use in External linkage (includes type prefix).
   class function  GetAccountCodeWithTypePrefixFromAccountId(AAccountId: Integer): String;
   class function  GetAccountCodeWithDashFromAccountId( AAccountId: Integer): String;
   class function  GetAccountIDFromCode(AccountText: string): integer;
   // Country
   class function  GetCountryName(aCountryId : Integer): String;
   class function  GetAddCountryId(aName : String): Integer;
   class function GetCountryISO2(aCountryId: Integer): String;
   class function GetCountryISO3(aCountryId: Integer): String;
   // Groups
   class function  GetNesteldNameFromGroupID(AGroupID : Integer;level : Integer ) : String ;
   class function  GetGroupTypeFromGroupID(AGroupID : Integer ) : Integer ;
   class function  GetIDsFromGroupID(AGroupID : Integer;level : Integer ) : String ;
   class procedure GetGroupColors(AGroupID : Integer;Var ATextColor,ABackColor : Integer )  ;
   class function  FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;
   class function  GetAddGroupNesteled(AName: String; GroupType : Integer; ChildID: Integer = 0): Integer;
   class procedure UpdateGroup(AName: String; Oldid,NewParent,sortorder,FinancialCategory : Integer );
   class function  AddGroup(AName: String; GroupType, ParentID ,FinancialCategory : Integer) : Integer ;
   class function  DeleteGroup(GroupID : Integer) : Integer ;
   class function  GetAddGroupDescription(AGroupid : Integer;Alanguage : String;Adesc : String): Integer;
   // Types
   class function  GetTypeDescription(AType : Integer) : String ;
   class procedure SetTypeDescription(AType : Integer;ADescription: String) ;
   // general
   class function  TableExist(ATable : String) : Boolean ;
   class function  ExecSql(ASql:String):Integer;
   class function  ExecSqlWithDelim(ASql:String):Integer;
   class function  OpenSqlAndGetFirtsColumnValue(ASql: String;ShowError : boolean = false ): Variant;
   class function  GetRepName(docType :Integer;Default : Boolean = true) : String ;
   // tax
   class function  GetTaxRateOnId(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;
   // Batch
   class procedure GetBatchesList(AList:TStrings;Alimitfilter : String);
   class function  GetAddBatchByName(Aname : String ) : Integer ;
   class function  GetBatchNameById(AId : Integer) : String ;
   class function  GetBatchIdFromPRocessId(AId : Integer) : Integer ;
   class procedure GetBatchInfo(AId: Integer; var BCashBook: Boolean;  var WContraAccount: Integer);
   class function  GetContraAccountFromBatchId(AId : Integer) : Integer ;
  // periods
  class function   GetPeriodCount : Integer ;
  class function   GetPeriodActive(Aperiod : Integer ) : Boolean  ;
  class function   GetPeriodStartDate(Period : Integer) : TDateTime ;
  class function   GetPeriodEndDate(Period : Integer) : TDateTime ;
  class function   GetPeriodDescription(Period,Year : Integer;LongDesc : Boolean=false) : String ;
  class function   GetPeriodFromDate(aDate: TDateTime): Integer;
  class function   GetBalans(aAccount : Integer ;Adate : TDateTime) : Double ;
  class function   GetOpeningBalans(aAccount : Integer ;Adate: TDateTime): Double;
  class function   GetBalansBetween(aAccount: Integer; AFromdate, AToDate: TDateTime): Double;
  class function   GetBalansDebCredOnPeriod(aAccount: Integer; Aperiod : Integer ; aDebit : Boolean ): Double;
  class function   GetTotalForPeriod(aAccount : Integer ;APeriod : Integer) : Double ;
  class function GetBudgetForPeriod(aAccount, AFromPeriod,   AToPeriod: Integer): Double;
  // Totals
  class procedure  CheckCreateTotalsEntry(aAccount : Integer ;APeriod : Integer)  ;
  class procedure  CheckCreateBugetsEntry(aAccount, APeriod: Integer);
  class function GetChildIDsFromGroupID(AGroupID, level: Integer): String;
  class function GetUnchachedTaxRateOnId(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;
  class function GetTaxShowType(TaxAccId:Integer):Integer ;
  class function GetBalansDebCredOnDate(aAccount : Integer; aDebit: Boolean; AFromDate, AToDate: TDateTime; IclOpeningbal: Boolean;CostGroup1,CostGroup2:Integer): Double;
  class function GetBudgetDebCredOnDate(aAccount: Integer;   aDebit: Boolean; AFromDate, AToDate: TDateTime;  IclOpeningbal: Boolean; CostGroup1, CostGroup2: Integer): Double;
 end;

 TDataBaseStockRoutines = class
   // Stock
   class function GetUniqueStockCode (APrefix : String ;TryThisCode : String): String ;
   class function ApplyTaxclassToStock (AStockId : Integer ): Boolean ;
   class function GetStockCode (AStockId : Integer ): String ;
   class function GetStockDescription (AStockId : Integer ): String ;
   class function GetStockFullDescription (AStockId : Integer ): String ;
   class function GetOuputTaxId (AStockId : Integer ): Integer ;
   class function GetInputTaxId (AStockId : Integer ): Integer ;
   class function GetInputTaxIdDef (AStockId,AAccountid : Integer ): Integer ;
   class function GetUnpostedStockITemCount(AStockItem : Integer;ExcludeDocId : Integer) : Double ;
   class function GetUnpostedStockITemCountFromType(AStockItem : Integer;aType,ExcludeDocId : Integer;MaxInvId : integer = 0;OrgItem:Integer =0;ExtraCriteria :String ='' ;MaxBackordId : Integer = 0) : Double ;
   class function GetUnpostedStockItemCountIncPurchases(AStockItem : Integer;ExcludeDocId : Integer;MaxInvId : Integer = 0;MaxBackordId : Integer = 0) : Double ;
   class function GetUnpostedStockItemCountIncPurchasesAndOrders(AStockItem : Integer;ExcludeDocId : Integer;MaxInvId : Integer = 0) : Double ;
   class function GetUnpostedStockItemListFromType(AStockItem,  aType, ExcludeDocId: Integer;MaxInvId : integer = 0;OrgItem:Integer =0 ): String;
   class function GetStockQty(AStock:Integer;level :integer = 0): Double;
   class function GetStockType(AStockid:Integer): Integer ;
   class function StockLoadItem(Var aStockRec : TStockRec) : Boolean ;
   // unit
   class function GetAddUnitId(aUnitStr:String;Add:Boolean=False): Integer;
   class function GetUnitDesc(aUnitID : Integer): String ;
   class function GetUnitQty(aUnitID : Integer): Double ;
   class function GetOptionItemValueName(aOptionItemValueID: Integer): String ;
   class function GetOptionNameFromItemValueID(aOptionItemValueID: Integer): String ;
   class function GetOptionIdFromItemValueID(aOptionItemValueID: Integer): Integer ;
   class function GetAddOptionItemValueID(AoptionName , AValuename : String; ExtOptionId : String = '';ExtValueId : String = '';Price : Double = 0): integer ;
   // use qy is used in stocklist!!!
   class function GetStockID(AStockCode: String): Integer;
   class function GetDefSup1(AStockId: Integer): integer;
   class function getImage(AStockId: Integer): String ;
   class function getDefaultStockPrice(AAccount,AStockId : Integer;Inclusive : Boolean = false) : Double ;
   class function getAvgStockCost(AStockId: Integer): Double;
   class function getLastStockCost(AStockId: Integer): Double;
   class function FindStockOnBarCode (Abarcode : String ) : Integer ;
   class function FindStockOnSupCode(Abarcode: String): Integer;
   class function FindStockOnSerial (ASerial : String ) : Integer ;
   class function getStockPrice(AAccount : Integer ;AStockId : Integer;aQty : Double) : Double ;
   class function GetUnpostedStockItemCountIncPurchasesAndOrdersOptions(
      AStockItem, ExcludeDocId, Option1, Option2, option3, option4,
      option5, MaxInvId: Integer): Double;
   class procedure TransportStockData(FromStockid,ToStockid : Integer );
   class procedure SyncQty(var aStockRec: TStockRec;DocType,LastDocHeaderId : Integer );
   class function GetUnpostedStockItemCountIncPurchasesAndOrdersforreorderOptions(
      AStockItem, ExcludeDocId, Option1, Option2, option3, option4,
      option5, MaxInvId: Integer): Double;
   class function GetCurrentStockOptionsCount(AStockItem, Option1, Option2, option3, option4,
      option5: Integer): Double;
   class procedure createStockTrans(AStockid : Integer ;AOpeningQty, ANewQty: Double; AtransString: String;transdate:TDateTime) ;
   class procedure createStockTransManual(Astockid: Integer; ATrans: Double; AtransString: String; transdate: TDateTime);
  end;

  TDataBaseDocumentRoutines = class
    // Will add Document routines here.
     class function GetUniqueDocNo (APrefix : String ;TryThisCode : String): String ;
     class function GetDocNextNum(DocType: Integer;JustShow : Boolean  = false): String;
     class function GetPosNextNum : String ;
     // Option 0 = gen nr 1 = read 2 = write
     class function GetAnnyNextNum(NumName : String;Option : integer = 0;NewValue : String = '' ) : String ;
     class function GetDocExtReference(DocId : Integer): String;
     class function GetDocIdFromTransactId(DocTransActId : Integer): Integer;
     class procedure CleanupDochead(ADocId : Integer) ;
     class procedure CleanupDocLine(ADocId ,Adoclineid: Integer) ;
     class procedure FillAccountInfoInDocHead(ADocID ,AToAccountID : Integer;Replace : Boolean ) ;
     class function GetGroupHistoryText(AGroupTypeID,ALinkId : Integer) : String ;
     class function GetDoclayoutOnAccountAndType(AType , AAccount : Integer )  : String ;
     class procedure RecalcLinePrices(Adocid : Integer );
     class procedure FillStringsWithReportsList(AStrings : TStrings ;AFolder : String) ;
     class function GetListName(AIndex : Integer ; AStringlist : TStrings ;AsTrn : Boolean) : String ;
     class function SetListName(AName : String ; AStringlist : TStrings ) : Integer ;
     class function GetDocNo(DocId: Integer): String;
     class function getDocPosted(docid : Integer) : Integer ;
     class function GetDocType(DocId: Integer): Integer;
     class procedure LoadDocTypes(AList : TStrings;AddAll,AddQuoteOrder:Boolean);
     class function GetLineDescription(DocId,Lineid: Integer): String;
     class function GetLineType(DocId,Lineid: Integer): Integer;
     class function GetTotalUnpostedDoc(AAccountid : Integer;MinusDocID : Integer) : double ;
     class function GetDocumentLineText(DocId: Integer): String;
     class function GetDocOrDefEmail(DocId: Integer) : String ;
     class function GetAccountOfDocid(DocId: Integer) : integer ;
     class function AddDocument(AType,AAccount : Integer ;ARef  : String ) : Integer ;
     class function AddDocLineStock(ADoc,AStock,WTaxId : Integer ; AQty,AExlPrice,ADiscount : Double ; ADate : TDateTime; ADesc : String  ) : integer  ;
     class function AddDocLineStockDef(ADoc,AStock : Integer ; AQty : Double  ) : integer  ;
     class function AddDocLineStockDefInc(ADoc,AStock : Integer ; AQty : Double  ) : integer  ;

     class function AddDocLineStockOptions(ADoc,AStock,WTaxId : Integer ; AQty,AExlPrice,ADiscount : Double ; ADate : TDateTime; ADesc : String;Option1,Option2,Option3,Option4,Option5: Integer ) : integer  ;
     class function AddDocRemark(ADoc : Integer ;Remark : String ; ADate : TDateTime ) : Integer  ;
     class function CopyDocument(AFromDocId,AToAccountID,DocType : Integer;DoDelete:Boolean ;GenList:TStringList;DefaultDate : TDateTime;
     UseDocDate : Boolean;AltDesc1: String = '';AltDesc2: String = '';AltDesc3: String = '';AddMessageText : String = '';RedoAccountInfo : Boolean = false;UpdatePosted : Boolean = true;AppendOnOpen:Boolean=False;JustHeader:Boolean=False) : Integer;

     class function GetCurrencyRate (ACurid : Integer) : Double ;
     class procedure AddDocLink(AFromDoc:Integer;AToDoc:Integer;AFromDocLine:Integer=-1;AToDocLine:Integer=-1);
     class procedure CopyDocLink(AFromDoc:Integer;AToDoc:Integer);
    class procedure SetDocNextNum(DocType: Integer; NewDocno: String);
    end;

 TDatabaseUserRoutines = class
      class function GetUserCanEditInvoice(AUser : Integer) : Boolean;
      class function GetUserCanEditStockReturns(AUser : Integer) : Boolean;
      class function GetUserCanEditCreditNote(AUser : Integer) : Boolean;
      class function GetUserAccessGlobalProcess( AUser: Integer): Boolean;
      class function GetUserCanEditPurchase(AUser : Integer) : Boolean;
      class function GetUserCanEditStock(AUser : Integer) : Boolean;
      class function GetWinUsername : String ;
      class function ValidateUser(AUsername,aPassword : String) : Integer;
      class function GetUsername(AUser: Integer) : String;
      class function UniqueIDLogin(AUniqueId : String) : Integer;
      class function getSalesmanOnUserId(Auserid : Integer ) : Integer ;

      class function GetPcName : String ;
      class function DecodePassword(Password: String): String;
      class function EncodePassword(Password: String): String;
   end;
 TDataBaseStringRoutines = class
        class function StripNotNumeric(AString : String): String;
        class function StripHtml(AString : String): String;
        class function StripRtf(ARtfString : String ) : String ;

        class function StripNotInt(AString: String): String;
        class function StripEnterLinefeed(AString : String): String;
        class function ReplaceTag(Source,Tagname , Value : String ;TagSep : char = '@') : String ;
        class Function IncrementString(Number : String;Increment:Integer = 1): String;
        // StringList With Int as obj routines  used in dropdownlists
        class Procedure  FillStringListWithSelect(AStringList : TStrings ;ASelectIntKeyDescFromTable : String ; AEmptyTransaltionNr : integer = 20046);
        class function  GetItemIndexFromId(AStringList : TStrings ; AID : Integer ) : Integer ;
        class function  GetIndexValue(AStringList : TStrings ; AID : Integer) : Variant ;
        class function LoadStringsFromFile(AFile : String ) : String ;

        class function  GetCharsFromTextInAndPlusSignAsDivider(ATextWithIntStr : String ) : String ;
        class function  GetSqlTillWhereClause(ASql : String ) : String ;
        class function StripNumericAndSpace(AString: String): String;
        class procedure FillStringListWithFormatSelect(AStringList: TStrings;
         ASelectAllWithKeyInFirstCol, Format: String;  AEmptyTransaltionNr: integer);

        class function GetAsValidFilename(aNAme : String) : String ; 
        class function htmlencode (value : String ) : String ;
        class function htmlencode128up (value : String ) : String ;
    end;

 TDatabaseRegistyRoutines  = class
      class procedure ReadFormPos( form : TForm; APrefix : String;DefaultSize : TWindowState = wsNormal);

      class procedure WriteFormPos( form : TForm; APrefix : String);
      class function GetAppToOpenExtention(AExtention : String) : String ;
      class function GetContentType(AExtention : String) : String ;


      class function ReadRegValue( Group,Name  : String) : String;
      class procedure WriteRegValue( Group,Name,Value  : String);
      class Function ReadOsfIni(Asection,AKey,ADefault : String ): String ;
      class function ReadAppRegValue(Group, Name: String): String;
      class procedure WriteAppRegValue(Group, Name, Value: String);
      class function GetAppValue(Avalue : String ) : String ;
      class procedure LoadGridFromRegistry(AGrid: TDBGrid; APrefix: String);
      class procedure SaveGridToRegistry(AGrid: TDBGrid; APrefix: String);
      class procedure WriteOsfIni(Asection, AKey, AValue: String);
      class function GetWindowsTempDir: string;
      class function GetFileSize(aFile: string): integer;
      class function EditWithOpenOffice(AHtmlIn : String ): String ;
      class function GetWindowsTempFile(ASug : String = 'sug'#0 ): string;
      class procedure OpenFile(AFile : String ) ; 


   end;

 TDatabaseTableRoutines  = class
      class procedure UpdateQuery(AQuery : TuniQuery;Table : String; PrimaryKeyColumn : array of string);
      class function ExportAsSqlInsert(AQuery: TuniQuery;TableName : String;ActiveRecordOnly: Boolean;KeyKolumn:String = '';KeySql:String = '';RepColumn:String = '';RepSql:String = ''): String;

      class function ExportAsHtmlTable(ADataSet: TDataSet): String;

      class procedure ResetIDGenerators;
      class procedure SetTriggerStatus(Active : boolean ) ;
      class function GetFirebirdsSqlForDate(ADate : TDateTime;ISMysql:Boolean = false  ) : String ;
      class function GetFirebirdsSqlForFloat(AFloat : Double ) : String ;
      class function ReplaceParams(AInText : String ; Params : String ; aReplaceParamsGetSqlFunction : TReplaceParamsGetSqlFunction = nil;DoQuoteQuote : boolean = true) : String ;
      class procedure AddDatasetToParamList(aDataSet : TDataSet ; Params : TStrings;DoQuote :Boolean = False;DisplayText : Boolean = false ;ISMysql:Boolean = false  )  ;
      class function GetDatasetAsParamString(aDataSet : TDataSet;DoQuote :Boolean = false;DisplayText : Boolean = false  ) : String  ;
      class function GetQueryAsParamString(Aquery : String;DoQuote :Boolean = false;DisplayText : Boolean = false  ) : String  ;
      class procedure SetIndexStatus(Active: boolean);
      class procedure CheckFieldLengthsAndAddFields(ADataset : Tdataset ; ASQL : String );
      class function StripOrderBy ( ASQL : String ) : String;
      class function OpenSqlReturnAsVarOrString ( ASQL : String ) : Variant ;
      class function OpenSqlReturnFirstColAsInStr ( ASQL : String ) : String ;
      class function FieldExists(ATabel,AField : String ) : Boolean ;
      class function GetScale(ATabel, AField: String): Integer;
      class function TableExists(ATabel: String): Boolean;
      class function GeneratorExists(Agenerator :String ) : Boolean ;
      class function GetCountSqlFromSql(ASql: String): String;
      class function GetfirstTablename (ASql: String): String;
      class procedure DumpToReportmanTransport(ADataset : TDataset; Clear : Boolean = true; RowType : Integer = 0 ;aosFProgressEvent : TosFProgressEvent = nil) ;
      class procedure DumpToReportmanTransportOfarray(ADataset : Variant ; Clear : Boolean = true; RowType : Integer = 0 ;aosFProgressEvent : TosFProgressEvent = nil) ;
      class function GetUsersInDatabase(Var Users : Integer ) : String ;

    class function FillStringsWithReportingGroups(
      AList: TcxImageComboBoxProperties; TpGroupID: integer): Boolean; static;
    class function FillStringsWithSelect(AList: TcxImageComboBoxProperties;
      asql: string): Boolean; static;
    class function BlobFieldToString(ABlobField: TBlobField): String; static;
   end;
 TDatabaseDebtorCreditorRoutines  = class
      class function GetDefaultTaxIDOnAccount(AAccount : Integer ) : Integer ;
      class function GetCreditAmount(AAccount : Integer ) : Double ;
      class function GetDefaultContraOnAccount(AAccount : Integer ) : Integer ;
      class procedure AddRef(ARef : String ; AAccount : Integer ) ;
      class function GetContactName(AAccount : Integer ) : String ;
      class function GetContactEmail(AAccount : Integer ) : String ;
      class function GetEmailAdress(AAccount : Integer ) : String ;
      class function GetTelnr(AAccount : Integer ) : String ;
      class function GetDefaultSalesmanOnAccount(AAccount : Integer ) : Integer ;
      class function GetNextUniqueDebtorCode : String ;
      class function GetDefaulDueDate(AAccount : Integer) : Integer ;
      class function GetTaxRef(AAccount : Integer ) : String ;
      class function GetBankAccount(AAccount : Integer ) : String ;
      class function GetTransmissionType(AAccount: Integer): integer; static;
   end;

  TDataBaseLedgerRoutines = class
      class function GetAbreviat(AAbreviat : String) : String ;
      class function RoundTo(Number : Double ; ADigts : int64) : Double ;
      class function RoundToLow(Number : Double ; AMultiplier : Word) : Double ;
      class function GetopenItemAmountOnTransact(AtrnId : Integer ) : Double ;
      class function GetBatchidFromTransactId(AtrnId : Integer ) : Integer ;
      class function GetBatchidFromDocId(ADocid : Integer ) : Integer ;

      class procedure ClearLink(KeyArray: array of integer);

      class function CountLink(atransact :  integer) : Integer ;
      class function LinkCheck(Atransact : Integer ) : Integer ;
      class procedure CleanupLink(AAccount : Integer ) ;
      class function TransportAccountData(AFromAccount,AtoAccount: Integer) : Integer ;
      class function AccountDataCount(AAccount: Integer) : Integer ;
      class function GetContraOnTransactionid(ATrnid : Integer) : String ;
      class function GetDescriptionFromTransaction( ATransactionId: Integer): String;
      class procedure Unlinkline(ALineid , ABatchid : Integer ) ;
      class function insertDummyZeroTrans(AAccount:Integer;Adate:TDateTime;AbatchTypeid:Integer): Integer;
      class function InsertPostedBatch(AbatchTypeid:Integer): Integer;
  end;

  TDataBaseProjectRoutines = class
      class function GetProjectCode(AProjectId : Integer) : String ;
      class function GetProjectId(AProjectCode : String) : Integer ;
      class function GetProjectDescription(AProjectId : Integer) : String ;
  end;



function GetDomainName: AnsiString;

implementation

uses UDMTCCoreLink,  math, StrUtils;




class Procedure TDataBaseRoutines.SetDynamicFieldLengths(AComponent : TComponent );
 var
  i : Integer ;
begin
  // done : pieter moved to 6 digets
  // see create remeber all sizes in tag
 for i := 0 to AComponent.ComponentCount -1 do
     begin
        if  (AComponent.Components[i] is TStringField) then
          begin
          if   ((AComponent.Components[i] as TStringField).FieldName = 'SMAINACCOUNTCODE') then
            begin
            (AComponent.Components[i] as TStringField).Size := DMTCCoreLink.MainAccountLength ;
            (AComponent.Components[i] as TStringField).DisplayWidth := 3+DMTCCoreLink.MainAccountLength ;
            end;

          if   (AComponent.Components[i] as TStringField).FieldName = 'SACCOUNTCODE' then
            begin
            (AComponent.Components[i] as TStringField).Size := 3+DMTCCoreLink.MainAccountLength ;
            (AComponent.Components[i] as TStringField).DisplayWidth := 12 ;
            end;
          if  (AComponent.Components[i] as TStringField).FieldName = 'SACCOUNT' then
            begin
            (AComponent.Components[i] as TStringField).Size := 4+DMTCCoreLink.MainAccountLength ;
            (AComponent.Components[i] as TStringField).DisplayWidth := 6+DMTCCoreLink.MainAccountLength ;
            end;
      end;
   end;

end;


class function TDataBaseLedgerRoutines.AccountDataCount(
  AAccount: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(
 'select count(Wtransactionid) from transact where Waccountid = '+ IntToStr(AAccount))),0) ;
 result := result +  StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(
 'select count(Wdocid) from dochead where Waccountid = '+ IntToStr(AAccount))),0) ;
end;

class procedure TDataBaseLedgerRoutines.CleanupLink(
  AAccount: Integer) ;
begin

TDataBaseRoutines.ExecSql('update transact set FOUTSTANDINGAMOUNT = FAmount where Waccountid = ' + IntToStr(AAccount)
+ ' and Wtransactionid not in (select a.WAmountTransactionID  from OILINKS a where a.WAmountTransactionID = transact.Wtransactionid and a.WAccountid = ' + IntToStr(AAccount) +' union select a.WLinkTransactionID  from OILINKS a where a.WLinkTransactionID = transact.Wtransactionid and a.WAccountid = ' + IntToStr(AAccount) +' ) '  ) ;


end;

class procedure TDataBaseLedgerRoutines.ClearLink( KeyArray : Array of integer);
var
 AQuery,BQuery  : TuniQuery ;
 i : Integer ;
 ZAmount : Double ;
begin
 AQuery := TuniQuery.create(nil) ;
 BQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    BQuery.Connection := DMTCCoreLink.TheZConnection ;
  for i := low(KeyArray) to high(KeyArray) do
   begin
    AQuery.SQL.Text := 'SELECT WOILINKSID , WLINKEDAMOUNT, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,UNUSED1 FROM OILINKS where '+
         ' WAMOUNTTRANSACTIONID = '+   IntToStr(KeyArray[i])  +
         ' or WLINKTRANSACTIONID = ' +   IntToStr(KeyArray[i]) + ' and Wbatchid = -1'  ;
       AQuery.open ;
       if AQuery.IsEmpty then
          begin
            // no links found so just clear amount
            BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FAmount where WTransactionID = :TransID';
            BQuery.Params[0].AsInteger := KeyArray[i] ;
            BQuery.ExecSQL ;
          end;
       While not AQuery.Eof do
         begin
            ZAmount := AQuery.FieldByName('WLINKEDAMOUNT').AsFloat ;
            if AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger = KeyArray[i] then
            begin
            BQuery.SQL.Text := 'select Famount from transact where WTransactionID = :TransID';
            BQuery.Params[0].AsInteger := KeyArray[i] ;
            BQuery.open ;
            if  BQuery.Fields[0].AsFloat > 0 then
                 ZAmount := ABS(ZAmount)
                 else
                 ZAmount := -ABS(ZAmount);

            BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT + :FAMount where WTransactionID = :TransID';
            BQuery.Params[0].AsFloat := ZAmount ;
            BQuery.Params[1].AsInteger := AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger ;
            BQuery.ExecSQL ;

            BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT - :FAMount where WTransactionID = :TransID';
            BQuery.Params[0].AsFloat := ZAmount ;
            BQuery.Params[1].AsInteger := AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger ;
            BQuery.ExecSQL ;

             // kijk of de gekoppelde transactie niet null is.
            BQuery.sql.text := 'SELECT WOILINKSID , WLINKEDAMOUNT, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,UNUSED1 FROM OILINKS where '+
             ' WAMOUNTTRANSACTIONID = '+   IntToStr(AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger)  +
             ' or WLINKTRANSACTIONID = ' +   IntToStr(AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger)+ ' and Wbatchid = -1'  ;
             BQuery.open ;
             IF BQuery.IsEmpty then
                begin
                  BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FAmount where WTransactionID = :TransID';
                  BQuery.Params[0].AsInteger := AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger ;
                  BQuery.ExecSQL ;
                end;
             // kijk of de gekoppelde transactie niet null is.
            BQuery.sql.text := 'SELECT WOILINKSID , WLINKEDAMOUNT, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,UNUSED1 FROM OILINKS where '+
             ' WAMOUNTTRANSACTIONID = '+   IntToStr(AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger)  +
             ' or WLINKTRANSACTIONID = ' +   IntToStr(AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger)+ ' and Wbatchid = -1'  ;
             BQuery.open ;
             IF BQuery.IsEmpty then
                begin
                  BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FAmount where WTransactionID = :TransID';
                  BQuery.Params[0].AsInteger := AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger ;
                  BQuery.ExecSQL ;
                end;
            end else
            if AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger = KeyArray[i] then
            begin
            BQuery.SQL.Text := 'select Famount from transact where WTransactionID = :TransID';
            BQuery.Params[0].AsInteger := KeyArray[i] ;
            BQuery.open ;
             if  BQuery.Fields[0].AsFloat > 0 then
                 ZAmount := ABS(ZAmount)
                 else
                 ZAmount := -ABS(ZAmount) ;    

            BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT - :FAMount where WTransactionID = :TransID';
            BQuery.Params[0].AsFloat := ZAmount ;
            BQuery.Params[1].AsInteger := AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger ;
            BQuery.ExecSQL ;
            BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FOUTSTANDINGAMOUNT + :FAMount where WTransactionID = :TransID';
            BQuery.Params[0].AsFloat := ZAmount ;
            BQuery.Params[1].AsInteger := AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger ;
            BQuery.ExecSQL ;
             // kijk of de gekoppelde transactie niet null is.
            BQuery.sql.text := 'SELECT WOILINKSID , WLINKEDAMOUNT, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,UNUSED1 FROM OILINKS where '+
             ' WAMOUNTTRANSACTIONID = '+   IntToStr(AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger)  +
             ' or WLINKTRANSACTIONID = ' +   IntToStr(AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger)+ ' and Wbatchid = -1'  ;
             BQuery.open ;
             IF BQuery.IsEmpty then
                begin
                  BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FAmount where WTransactionID = :TransID';
                  BQuery.Params[0].AsInteger := AQuery.FieldByName('WAMOUNTTRANSACTIONID').AsInteger ;
                  BQuery.ExecSQL ;
                end;
             // kijk of de gekoppelde transactie niet null is.
            BQuery.sql.text := 'SELECT WOILINKSID , WLINKEDAMOUNT, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,UNUSED1 FROM OILINKS where '+
             ' WAMOUNTTRANSACTIONID = '+   IntToStr(AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger)  +
             ' or WLINKTRANSACTIONID = ' +   IntToStr(AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger)+ ' and Wbatchid = -1'  ;
             BQuery.open ;
             IF BQuery.IsEmpty then
                begin
                  BQuery.SQL.Text := 'Update transact set FOUTSTANDINGAMOUNT = FAmount where WTransactionID = :TransID';
                  BQuery.Params[0].AsInteger := AQuery.FieldByName('WLINKTRANSACTIONID').AsInteger ;
                  BQuery.ExecSQL ;
                end;
            end ;
         // delete entry
         BQuery.SQL.Text := 'delete from OILINKS where WOILINKSID = :Linkid';
         BQuery.Params[0].AsFloat := AQuery.FieldByName('WOILINKSID').AsFloat ;
         BQuery.ExecSQL ;
         AQuery.Next ;
         end;
    end; // end keyarray
  finally
    AQuery.free ;
    BQuery.free ;

  end;
end;

class function TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(AAccountId : Integer):String ;
var
 AQuery : TuniQuery ;
begin
 result := '';
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select WAccountTypeId,SMainAccountCode, SSubAccountCode From Account where WAccountId =' + InttoStr(AAccountId);
     AQuery.open ;
     if not AQuery.IsEmpty then
     result := AccTypeToChar(AQuery.fields[0].AsInteger)+AQuery.fields[1].AsString + AQuery.fields[2].AsString;

   finally
     AQuery.free ;
   end;
end;

class function TDataBaseRoutines.ZipAccountCode(AccountCode:string):String;
begin
 result := AccountCode ;
  if  length(AccountCode) > DMTCCoreLink.MainAccountLength then
   begin
    if AccountCode[DMTCCoreLink.MainAccountLength+1] = '-' then
      delete(result,DMTCCoreLink.MainAccountLength+1,1);
    end else
    if  Length(AccountCode) > 0 then
    if AccountCode[Length(AccountCode)] = '-' then
       delete(result,Length(AccountCode),1);
   // make sure its the maximum
   if Length(result) > DMTCCoreLink.MainAccountLength + 3 then
      SetLength(result,DMTCCoreLink.MainAccountLength + 3);
end;


class function TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(AAccountId : Integer):String ;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select SAccountCode From Account where WAccountId =' + InttoStr(AAccountId);
     AQuery.open ;
     result := AQuery.fields[0].AsString ;
     if length(Result) >= DMTCCoreLink.MainAccountLength then
        Insert('-',Result, DMTCCoreLink.MainAccountLength+1);

   finally
     AQuery.free ;
   end;
end;

class function TDataBaseRoutines.GetSubAccountCode(AccountNumber : String;AddDefaults : boolean = false;HasSeperator:Boolean = true) : String;
var
  i    : Integer;
begin
  // done : Pieter simply get the caracters after 6 pos and stripout the '-' sign
  // new way makes spaces and - signs posible in some combinations
  if HasSeperator then
  AccountNumber := ZipAccountCode(AccountNumber);
  result := '' ;
  if  length(AccountNumber) > DMTCCoreLink.MainAccountLength then
    begin
       for i := 1+DMTCCoreLink.MainAccountLength to length(AccountNumber) do
        result := result + AccountNumber[i] ;
    end;
// result :=  StringReplace(result,'-','',[rfReplaceAll]);
 if AddDefaults then
    begin
       if Length(result) < 3 then
         begin
            for i := Length(result) to 2 do
              result := result + '0' ;
         end;
    end;
       if Length(result) > 3 then
          SetLength(result,3);
end;

class function TDataBaseRoutines.GetMainAccountCode(AccountNumber : String) : String;
begin
  Result:= AccountNumber ;
  if Result='' then exit;
  Result := ZipAccountCode(Result);
  if length(result) > DMTCCoreLink.MainAccountLength then
  setlength(Result,DMTCCoreLink.MainAccountLength);
  if length(result) > DMTCCoreLink.MainAccountLength then
    raise exception.create('');
end;

class function TDataBaseRoutines.GetAccountIDFromCode(AccountText:string):integer;
Function CheckAccount(AccountCode:String;Var AccType:Integer):String;
Begin
  Acctype:=0;
  Result := trim(AccountCode);
  if Result='' then exit;
  AccType := AccCharToType(Result[1]);

  Result := Copy(Result,2,DMTCCoreLink.MainAccountLength+6);
  Result:=ZipAccountCode(Result);
end;
Var
 AccType:integer;
begin
  Result:=0;
  AccountText:=CheckAccount(AccountText,AccType);
  if AccountText='' then exit;
  result := GetAccountIdFromCodeAndType(AccountText,AccType);
end;

class function TDataBaseRoutines.GetAddGroupNesteled(AName: String; GroupType : Integer ;ChildID : Integer = 0): Integer;
var
  LocalName : String ;
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  ACheckList : TStringlist ;
begin
 if AName = '' then
   begin
   result := 0 ;
   Exit ;
   end ;
 if ChildID = 0 then
 begin
   ACheckList := TStringlist.create  ;
   try
    DMTCCoreLink.GroupsObject.FillListWithReportingGroup(GroupType,ACheckList);
    if ACheckList.IndexOf(AName) <> -1 then
       begin
          Result := Integer(ACheckList.Objects[ACheckList.IndexOf(AName)]) ;
          exit ;
       end;
   finally
    ACheckList.free ;
   end;
 end;

 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
     // check for nesteled name
     if pos('@',AName) <> 0 then
        begin
          LocalName := copy(AName,1,pos('@',AName)-1) ;
          Delete(AName,1,pos('@',AName));
        end else
        begin
         LocalName := AName ;
         AName := '' ;
        end;

      AQuery.Connection := DMTCCoreLink.TheZConnection ;
      AQuery.UpdateObject := AUpdateComp ;
      AQuery.sql.Text := ' Select * FROM Groups where WGroupTypeId = :GroupType and SDescription =:Description' ;
      AUpdateComp.InsertSQL.Text :='INSERT INTO GROUPS (WGROUPID, WGROUPTYPEID, SDESCRIPTION, WPARENTGROUP2ID,' +
                                   'WPARENTGROUP1ID, DSYSDATE, WSORTNO) VALUES (:WGROUPID, :WGROUPTYPEID,:SDESCRIPTION,'+
                                   ':WPARENTGROUP2ID,:WPARENTGROUP1ID, :DSYSDATE, :WSORTNO)' ;

      if ChildID = 0 then
         AQuery.sql.add('And ((WParentGroup2ID is null) or (WParentGroup2ID = 0))')
         else
         AQuery.sql.add('And WParentGroup2ID = ' + IntToStr(ChildID)) ;

      AQuery.Params[0].AsInteger := GroupType ;
      AQuery.Params[1].AsString := copy(LocalName,1,DMTCCoreLink.GetFieldLength('Groups','SDescription')); ;
      AQuery.open ;
      if AQuery.IsEmpty then
         begin
           AQuery.Insert ;
           AQuery.FieldByName('WGROUPID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWGROUPID);
           AQuery.FieldByName('WGROUPTYPEID').AsInteger := GroupType ;
           AQuery.FieldByName('SDESCRIPTION').AsString := LocalName ;
           AQuery.FieldByName('WPARENTGROUP2ID').AsInteger := ChildID ;
           AQuery.FieldByName('WPARENTGROUP1ID').AsInteger := 0 ;
           AQuery.FieldByName('WSORTNO').AsInteger := AQuery.FieldByName('WGROUPID').AsInteger ;
           AQuery.Post ;
         end ;
     result := AQuery.FieldByName('WGROUPID').AsInteger ;
     AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
   if AName <> '' then
      result := GetAddGroupNesteled(AName,GroupType,result);
end;


class Function TDataBaseRoutines.GetRepName(docType :Integer;Default : Boolean = true) : String ;
begin
 if Default then
 begin
  case docType of
        9 :   result := DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4') ;
        10 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameInv',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))  ;
        11 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameCreditNote',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))  ;
        12 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNamePurchases',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))  ;
        13 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameGret',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))  ;
        15 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameOrder',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))  ;
        14 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameQuote',varToStr(DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4')))   ;
        else result :=  DMTCCoreLink.ReadNwReportOp('SDocLayoutName','DefaultA4') ;
    end;
  end else
  begin
  case docType of
        9 :   result := '' ;
        10 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameInv2','')  ;
        11 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameCreditNote2','')  ;
        12 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNamePurchases2','')  ;
        13 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameGret2','')  ;
        15 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameOrder2','')  ;
        14 :  result := DMTCCoreLink.ReadNwReportOp('SDocLayoutNameQuote2','')   ;
        else result := ''
    end;
  end;

 if pos('TRN_',Result) = 1 then
   begin
     result := DMTCCoreLink.GetTextLang(StrToIntDef(ChangeFileExt(copy(Result,5,20),''),0)) ;
   end;
end ;


class procedure TDataBaseDocumentRoutines.CleanupDochead(ADocId: Integer);
{var
  AQuery , ADocline: TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  AmtInc,AmtExc : Double ; }
  var
   AResult : Variant ;
begin
 // delete wrong types.
 if DMTCCoreLink.ExtraOptions.Values['STKCHECKType'] = '-1' then
 begin
     DMTCCoreLink.ExecSql('delete  from docline where (WlineTypeid <> 91 and WlineTypeid <> 93) and not '+
     '  exists( select a.WStockid from stock a where a.Wstockid = docline.Wstockid and a.Wstocktypeid not in (3,5) ) '+
     ' and wdocid = (select wdocid from dochead b where b.Wdocid = docline.WDOCID and b.WTYPEID in (10,11,14)) and wdocid = ' + IntToStr(ADocId)) ;

     DMTCCoreLink.ExecSql('delete from docline where (WlineTypeid <> 91 and WlineTypeid <> 93) and not '+
     '  exists( select a.WStockid from stock a where a.Wstockid = docline.Wstockid and a.Wstocktypeid not in (2,4) ) '+
     ' and wdocid = (select wdocid from dochead b where b.Wdocid = docline.WDOCID and b.WTYPEID in (12,13,15)) and wdocid = ' + IntToStr(ADocId)) ;
 end;

  if DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE' then
   begin
      DMTCCoreLink.ExecSql('update Dochead Set FDocAmount = (select sum(FInclusiveAmt) from docline join  stock on docline.Wstockid = stock.Wstockid where Stock.WstockTypeid <> 10 and wlineTypeid not in (93,91) and docline.WDocid = dochead.WDocid), '+
   ' FTaxAmount = (select sum(FInclusiveAmt-FExclusiveAmt) from docline join  stock on docline.Wstockid = stock.Wstockid where Stock.WstockTypeid <> 10 and wlineTypeid not in (93,91) and docline.WDocid = dochead.WDocid) where  WDocid =  ' + IntToStr(ADocId));
    AResult := DMTCCoreLink.OpenSqlReturnFirstColumn('select sum(FInclusiveAmt) from DOCLINE_LINKED docline join stock on docline.Wstockid = stock.Wstockid where Stock.WstockTypeid <> 10 and wlineTypeid not in (93,91) and docline.WDocid = ' + IntToStr(ADocId) );
    if VarToStr(AResult) <> '' then
     DMTCCoreLink.ExecSql('update Dochead Set FDocAmount = coalesce(FDocAmount,0) + ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(AResult) + '  where  WDocid =  ' + IntToStr(ADocId));
    AResult := DMTCCoreLink.OpenSqlReturnFirstColumn('select sum(FInclusiveAmt-FExclusiveAmt) from DOCLINE_LINKED docline join stock on docline.Wstockid = stock.Wstockid where Stock.WstockTypeid <> 10 and wlineTypeid not in (93,91) and docline.WDocid = ' + IntToStr(ADocId) );
    if VarToStr(AResult) <> '' then
     DMTCCoreLink.ExecSql('update Dochead Set FTaxAmount = coalesce(FTaxAmount,0) + ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(AResult) + '  where  WDocid =  ' + IntToStr(ADocId));
   end else
   DMTCCoreLink.ExecSql('update Dochead Set FDocAmount = (select sum(FInclusiveAmt) from docline where wlineTypeid not in (93,91) and docline.WDocid = dochead.WDocid), '+
   ' FTaxAmount = (select sum(FInclusiveAmt-FExclusiveAmt) from docline where wlineTypeid not in (93,91) and docline.WDocid = dochead.WDocid) where  WDocid =  ' + IntToStr(ADocId));


 {
 ADocline  := TuniQuery.Create(nil) ;
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    ADocline.Connection := DMTCCoreLink.TheZConnection ;

    AQuery.UpdateObject := AUpdateComp ;
    AQuery.sql.Text := ' Select * FROM dochead where WDOCID = :WDOCID' ;
    AUpdateComp.ModifySQL.Text := 'UPDATE dochead SET FDOCAMOUNT = :FDOCAMOUNT, FTAXAMOUNT = :FTAXAMOUNT WHERE WDOCID = :WDOCID' ;
    AQuery.params[0].asinteger := ADocId ;
    AQuery.open ;
    if AQuery.IsEmpty then exit;
    TDataBaseDocumentRoutines.FillAccountInfoInDocHead(ADocId,-1,false);
    AQuery.Edit ;
    ADocline.SQL.Text := 'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where WLineTypeId in (90,94) and WDocid = ' + IntToStr(ADocId);
    ADocline.open ;
    AmtInc := 0 ;
    AmtExc := 0 ;
     while not ADocline.eof do
      begin
       AmtInc := AmtInc + ADocline.fieldByName('FInclusiveAmt').AsFloat ;
       AmtExc := AmtExc + ADocline.fieldByName('FEXCLUSIVEAMT').AsFloat ;
       if (ADocline.fieldByName('FQTYSHIPPED').AsFloat = 0 ) and (ADocline.fieldByName('FQTYORDERED').AsFloat = 0 ) then
        begin
          DMTCCoreLink.ExecSql('Delete from docline where WDocid = '+ADocline.FieldByName('WDOCID').AsString +
          ' and wDocLineid =  ' +ADocline.FieldByName('WDOCLINEID').AsString );

        end ;

       ADocline.next ;
      end;
    AQuery.FieldByName('FDOCAMOUNT').AsFloat := AmtInc ;
    AQuery.FieldByName('FTAXAMOUNT').AsFloat := AmtInc - AmtExc;
    AQuery.Post;
    AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
      ADocline.free ;
   end; }
end;

class procedure TDataBaseDocumentRoutines.FillAccountInfoInDocHead(ADocID,
  AToAccountID: Integer; Replace: Boolean);
var
  AQuery ,aDeb,aCredit: TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;
 aDeb := TuniQuery.Create(nil) ;
 aCredit := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   aDeb.Connection := DMTCCoreLink.TheZConnection ;
   aCredit.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM dochead where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADocID ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCHEAD',['WDOCID']);
//    AUpdateComp.ModifySQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('OSFGEN_EditDochead');
   if AQuery.IsEmpty then exit ;
   AQuery.Edit ;
   if AToAccountID = -1 then
    AToAccountID :=  AQuery.fieldByName('WACCOUNTID').AsInteger ;
   aDeb.SQL.Text := 'Select * from debtor where WAccountid = ' + IntToStr(AToAccountID) ;
   aCredit.SQL.Text := 'Select * from creditor where WAccountid = ' + IntToStr(AToAccountID) ;
   aDeb.open;
   aCredit.Open ;

         if AQuery.FieldByName('DDATE').Asfloat = 0 then
            AQuery.FieldByName('DDATE').AsDateTime := date ;

    if not aDeb.IsEmpty then
      begin


         if (AQuery.FieldByName('WPOSTALNAME').AsInteger = 0) or replace then
         AQuery.FieldByName('WPOSTALNAME').AsInteger :=   DMTCCoreLink.GetAddDescription(TDataBaseRoutines.GetAccountDescription(AToAccountID)) ;
         if (AQuery.FieldByName('WPOSTALCONTACT').AsInteger = 0) or replace then
         AQuery.FieldByName('WPOSTALCONTACT').AsInteger := DMTCCoreLink.GetAddDescription(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));

         if (AQuery.FieldByName('WDELNAME').AsInteger = 0) or replace then
         AQuery.FieldByName('WDELNAME').AsInteger :=   DMTCCoreLink.GetAddDescription(TDataBaseRoutines.GetAccountDescription(AToAccountID)) ;
         if (AQuery.FieldByName('WDELCONTACT').AsInteger = 0) or replace then
         AQuery.FieldByName('WDELCONTACT').AsInteger := DMTCCoreLink.GetAddDescription(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));

         if AQuery.FindField('X_CONTACTID') <> nil then
           begin
            if (AQuery.FieldByName('X_CONTACTID').AsInteger = 0) or replace then
            AQuery.FieldByName('X_CONTACTID').AsInteger :=  aDeb.FieldByName('WCONTACTID').AsInteger ;
           end;


         if AQuery.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
           begin
            if (AQuery.FieldByName('X_CUSTOMERS_EMAIL_ADDRESS').AsString = '') or replace then
            AQuery.FieldByName('X_CUSTOMERS_EMAIL_ADDRESS').AsString :=  TDatabaseDebtorCreditorRoutines.GetContactEmail(AToAccountID) ;
           end;



         if (AQuery.FieldByName('WTAXNUMBER').AsInteger = 0) or replace then
         AQuery.FieldByName('WTAXNUMBER').AsInteger := DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SREFERENCE').AsString);


         if (AQuery.FieldByName('WPostal1ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal1ID').AsInteger := DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SPostal1').AsString);
         if (AQuery.FieldByName('WPostal2ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal2ID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SPostal2').AsString);
         if (AQuery.FieldByName('WPostal3ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal3ID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SPostal3').AsString);
         if (AQuery.FieldByName('WPostalCodeID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostalCodeID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SPostalCode').AsString);
         if (AQuery.FieldByName('WDelAddress1ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress1ID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SDelivery1').AsString);
         if (AQuery.FieldByName('WDelAddress2ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress2ID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SDelivery2').AsString);
         if (AQuery.FieldByName('WDelAddress3ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress3ID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SDelivery3').AsString);
         if (AQuery.FieldByName('WDelCodeID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelCodeID').AsInteger :=DMTCCoreLink.GetAddDescription(aDeb.FieldByName('SPostalCode').AsString);
         if (AQuery.FieldByName('WPOSCOUNTRIES_ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPOSCOUNTRIES_ID').AsInteger := aDeb.FieldByName('WPOSTCOUNTRIES_ID').AsInteger ;
         if (AQuery.FieldByName('WDELCOUNTRIES_ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDELCOUNTRIES_ID').AsInteger := aDeb.FieldByName('WDELCOUNTRIES_ID').AsInteger ;
         if AQuery.FieldByName('DDUEDATE').AsDateTime = 0 then
            AQuery.FieldByName('DDUEDATE').AsDateTime := AQuery.FieldByName('DDATE').AsDateTime  + aDeb.FieldByName('WDUEDAYS').asInteger ;

         if (AQuery.FieldByName('WSALESMANID').AsInteger = 0) or replace then
            AQuery.FieldByName('WSALESMANID').asInteger :=  aDeb.FieldByName('WSALESMANID').asInteger ;


      end;
    if not aCredit.IsEmpty then
      begin

         if (AQuery.FieldByName('WPOSTALNAME').AsInteger = 0) or replace then
         AQuery.FieldByName('WPOSTALNAME').AsInteger :=   DMTCCoreLink.GetAddDescription(TDataBaseRoutines.GetAccountDescription(AToAccountID)) ;
         if (AQuery.FieldByName('WPOSTALCONTACT').AsInteger = 0) or replace then
         AQuery.FieldByName('WPOSTALCONTACT').AsInteger := DMTCCoreLink.GetAddDescription(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));

         if (AQuery.FieldByName('WDELNAME').AsInteger = 0) or replace then
         AQuery.FieldByName('WDELNAME').AsInteger :=   DMTCCoreLink.GetAddDescription(TDataBaseRoutines.GetAccountDescription(AToAccountID)) ;
         if (AQuery.FieldByName('WDELCONTACT').AsInteger = 0) or replace then
         AQuery.FieldByName('WDELCONTACT').AsInteger := DMTCCoreLink.GetAddDescription(TDatabaseDebtorCreditorRoutines.GetContactName(AToAccountID));

         if AQuery.FindField('X_CONTACTID') <> nil then
           begin
            if (AQuery.FieldByName('X_CONTACTID').AsInteger = 0) or replace then
            AQuery.FieldByName('X_CONTACTID').AsInteger :=  aCredit.FieldByName('WCONTACTID').AsInteger ;
           end;


         if AQuery.FindField('X_CUSTOMERS_EMAIL_ADDRESS') <> nil then
           begin
            if (AQuery.FieldByName('X_CUSTOMERS_EMAIL_ADDRESS').AsString = '') or replace then
            AQuery.FieldByName('X_CUSTOMERS_EMAIL_ADDRESS').AsString :=  TDatabaseDebtorCreditorRoutines.GetContactEmail(AToAccountID) ;
           end;

         if (AQuery.FieldByName('WPostal1ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal1ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SPostal1').AsString);
         if (AQuery.FieldByName('WPostal2ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal2ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SPostal2').AsString);
         if (AQuery.FieldByName('WPostal3ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostal3ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SPostal3').AsString);
         if (AQuery.FieldByName('WPostalCodeID').AsInteger = 0) or replace then
         AQuery.FieldByName('WPostalCodeID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SPostalCode').AsString);
         if (AQuery.FieldByName('WDelAddress1ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress1ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SDelivery1').AsString);
         if (AQuery.FieldByName('WDelAddress2ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress2ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SDelivery2').AsString);
         if (AQuery.FieldByName('WDelAddress3ID').AsInteger = 0) or replace then
         AQuery.FieldByName('WDelAddress3ID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SDelivery3').AsString);
         if (AQuery.FieldByName('WDelCodeID').AsInteger = 0) or replace then
        AQuery.FieldByName('WDelCodeID').AsInteger :=DMTCCoreLink.GetAddDescription(aCredit.FieldByName('SPostalCode').AsString);
         if (AQuery.FieldByName('WPOSCOUNTRIES_ID').AsInteger = 0) or replace then
        AQuery.FieldByName('WPOSCOUNTRIES_ID').AsInteger := aCredit.FieldByName('WPOSTCOUNTRIES_ID').AsInteger;
         if (AQuery.FieldByName('WDELCOUNTRIES_ID').AsInteger = 0) or replace then
        AQuery.FieldByName('WDELCOUNTRIES_ID').AsInteger := aCredit.FieldByName('WDELCOUNTRIES_ID').AsInteger;


        if AQuery.FieldByName('DDUEDATE').AsDateTime = 0 then
            AQuery.FieldByName('DDUEDATE').AsDateTime := AQuery.FieldByName('DDATE').AsDateTime  + aCredit.FieldByName('WDUEDAYS').asInteger ;
      end;
        if AQuery.FieldByName('DDUEDATE').AsDateTime = 0 then
            AQuery.FieldByName('DDUEDATE').AsDateTime := AQuery.FieldByName('DDATE').AsDateTime  + aCredit.FieldByName('WDUEDAYS').asInteger ;
        if AQuery.FieldByName('DALLOCATEDDATE').AsDateTime = 0 then
            AQuery.FieldByName('DALLOCATEDDATE').AsDateTime := date;
        if AQuery.FieldByName('WPAYMENTTYPEID').Asinteger = 0 then
            AQuery.FieldByName('WPAYMENTTYPEID').Asinteger := 0;
        if AQuery.FieldByName('FINVOICEDISCOUNT').AsFloat = 0 then
            AQuery.FieldByName('FINVOICEDISCOUNT').AsFloat := 0;
        if AQuery.FieldByName('BPRINTED').Asinteger = 0 then
            AQuery.FieldByName('BPRINTED').Asinteger := 0;
        if AQuery.FieldByName('BPOSTED').Asinteger = 0 then
            AQuery.FieldByName('BPOSTED').Asinteger := 0;
        if AQuery.FieldByName('BREPEATING').Asinteger = 0 then
            AQuery.FieldByName('BREPEATING').Asinteger := 0;
        if AQuery.FieldByName('WMESSAGE1ID').Asinteger = 0 then
            AQuery.FieldByName('WMESSAGE1ID').Asinteger := 0;
        if AQuery.FieldByName('WMESSAGE2ID').Asinteger = 0 then
            AQuery.FieldByName('WMESSAGE2ID').Asinteger := 0;
        if AQuery.FieldByName('WMESSAGE3ID').Asinteger = 0 then
            AQuery.FieldByName('WMESSAGE3ID').Asinteger := 0;

        if AQuery.FieldByName('WREPORTINGGROUP1ID').Asinteger = 0 then
            AQuery.FieldByName('WREPORTINGGROUP1ID').Asinteger := 0;

        if AQuery.FieldByName('WREPORTINGGROUP2ID').Asinteger = 0 then
            AQuery.FieldByName('WREPORTINGGROUP2ID').Asinteger := 0;

        if AQuery.FieldByName('WUSERID').Asinteger = 0 then
            AQuery.FieldByName('WUSERID').Asinteger := DMTCCoreLink.currentuser ;

        if AQuery.FieldByName('BEXCLUSIVE').IsNull then
            AQuery.FieldByName('BEXCLUSIVE').Asinteger := 1;

      //  if AQuery.FieldByName('WSALESMANID').Asinteger = 0) then
      //      AQuery.FieldByName('WSALESMANID').Asinteger := 0;

      AQuery.Post ;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
   aDeb.free ;
   aCredit.free ;
 end;
end ;



class procedure TDataBaseDocumentRoutines.FillStringsWithReportsList(
  AStrings: TStrings; AFolder: String);
Var
  myF :TSearchRec;
  NumText : String ;
begin
AStrings.Clear;
if FindFirst(IncludeTrailingPathDelimiter(AFolder) + '*.rep',faAnyFile,myF)=0 then
  begin
  repeat
    if SameText(ExtractFileExt(myF.Name),'.rep') then
      begin
        if pos('LANG_',myF.name) = 1 then
          begin
            NumText := copy(ChangeFileExt(myF.name,''),6,20);
            AStrings.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToInt(NumText)),TObject(StrToInt(NumText)));

          end else
          if pos('TRN_',myF.name) = 1 then
          begin
            NumText := copy(ChangeFileExt(myF.name,''),5,20);
            AStrings.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToInt(NumText)),TObject(StrToInt(NumText)));
          end else
          begin
             AStrings.Add(ChangeFileExt(myF.name,''));
          end;
      end;
  until FindNext(myF)<>0;
     // done : pieter Findclose to perserve resource
     SysUtils.FindClose(myF);
   // Look for reporman reports

  end;
end;


class function TDataBaseDocumentRoutines.GetDocExtReference(
  DocId: Integer): String;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SREFERENCE  from dochead where WDocId =' + IntToStr(DocId)))  ;
end;

class function TDataBaseDocumentRoutines.GetDocNo(
  DocId: Integer): String;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SDocNo  from dochead where WDocId =' + IntToStr(DocId)))  ;
end;

class function TDataBaseDocumentRoutines.GetDocIdFromTransactId(
  DocTransActId: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WDocId from transact where WTransactionid =' + IntToStr(DocTransActId))),0)  ;
end;

class function TDataBaseDocumentRoutines.GetDoclayoutOnAccountAndType(
  AType, AAccount: Integer): String;
begin
  result := '' ;
  case AType of
    10 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTINVOICE from debtor where WAccountid =' + IntToStr(AAccount))) ;
    11 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTCREDITNOTE from debtor where WAccountid =' + IntToStr(AAccount))) ;
    14 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTQUOTE from debtor where WAccountid =' + IntToStr(AAccount))) ;
    12 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTINVOICE from creditor where WAccountid =' + IntToStr(AAccount))) ;
    13 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SSLAYOUTCREDITNOTE from creditor where WAccountid =' + IntToStr(AAccount))) ;
    15 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTQUOTE from creditor where WAccountid =' + IntToStr(AAccount))) ;
    16 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SSLAYOUTCREDITNOTE from creditor where WAccountid =' + IntToStr(AAccount))) ;
    17 : result := vartostr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SLAYOUTQUOTE from creditor where WAccountid =' + IntToStr(AAccount))) ;

   end;
   if not FileExists(DMTCCoreLink.GetLocalPluginDir + 'reports\documents\documents\' + result +'.rep') then
   if not FileExists(DMTCCoreLink.GetLocalPluginDir + '..\Bin\Reports\' + result +'.frf') then
      Result := '' ;

end;

class procedure TDataBaseDocumentRoutines.SetDocNextNum(DocType : Integer;NewDocno : String) ;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  I : Integer ;
  aResult : String ;
begin
   if trim(NewDocno) = '' then
     raise Exception.Create('New documentid for documenttype(' + IntToStr(DocType) + ') cannot be empty');
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   i := 10 ;
   while i > 0 do
   begin
   try
    if  (DocType > 20) then
      begin
           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.UpdateObject := AUpdateComp ;
           AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;

           AQuery.ParamByName('SParamName').AsString := Uppercase('DOCNO_'+ IntToStr(DocType) ) ;

             if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
               AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
             else
             AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

             AQuery.ParamByName('WTypeID').Asinteger := 0 ;
             AQuery.Open ;

             TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

             if AQuery.IsEmpty then
             begin
               AQuery.Append ;
               AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
               AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
               AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
               AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
               AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('SPARAMNAME').AsString :=  Uppercase('DOCNO_'+ IntToStr(DocType) ) ;
             end else
             AQuery.Edit ;



            AQuery.fieldByName('SParamValue').AsString:=NewDocno;
            AQuery.Post  ;
            i := 0 ;
     end else
   if  (DocType in [16,17]) then
     begin

           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.UpdateObject := AUpdateComp ;
           AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;
           if DocType = 16 then
           AQuery.ParamByName('SParamName').AsString := Uppercase('SSTOCKOUTNR')
           else
           AQuery.ParamByName('SParamName').AsString := Uppercase('SSTOCKINNR') ;

             if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
               AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
             else
             AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

             AQuery.ParamByName('WTypeID').Asinteger := 0 ;
             AQuery.Open ;

             TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

             if AQuery.IsEmpty then
             begin
               AQuery.Append ;
               AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
               AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
               AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
               AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
               AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
               if DocType = 16 then
               AQuery.FieldByName('SPARAMNAME').AsString := Uppercase('SSTOCKOUTNR')
               else
               AQuery.FieldByName('SPARAMNAME').AsString := Uppercase('SSTOCKINNR') ;
             end else
             AQuery.Edit ;



            AQuery.fieldByName('SParamValue').AsString:= NewDocno;

            AQuery.Post  ;
            i := 0 ;
     end else
     begin
   AQuery.close ;
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
    if DMTCCoreLink.ExtraOptions.Values['ORACLE'] = 'true' then

    AQuery.sql.Text := 'Select * FROM users where WUSERID = :WUSERID for update no wait '
    else
   AQuery.sql.Text := 'Select * FROM users where WUSERID = :WUSERID with lock ' ;
   AUpdateComp.ModifySQL.Text :='update users set ' +

   '  SPASSWORD = :SPASSWORD, SUSERNAME = :SUSERNAME, ' +
   'SCREDITNOTENEXTNUMBER = :SCREDITNOTENEXTNUMBER , SINVOICENEXTNUMBER = :SINVOICENEXTNUMBER, ' +
   'SPURCHASENEXTNUMBER = :SPURCHASENEXTNUMBER, SGOODSRETURNEDNEXTNUMBER = :SGOODSRETURNEDNEXTNUMBER, SRECEIPTNEXTNUMBER = :SRECEIPTNEXTNUMBER,' +
   'SQUOTENEXTNUMBER = :SQUOTENEXTNUMBER, SORDERNEXTNUMBER = :SORDERNEXTNUMBER, SNEXTBATCHNUMBER = :SNEXTBATCHNUMBER,' +
   'BDISABLED = :BDISABLED, BACCOUNTS = :BACCOUNTS, BSTOCK = :BSTOCK,' +
   'BBATCHENTRY = :BBATCHENTRY, BCREDITNOTE = :BCREDITNOTE, BINVOICES = :BINVOICES, BPURCHASES = :BPURCHASES,' +
   'BSTOCKRETURNS = :BSTOCKRETURNS, BRECONCILIATION = :BRECONCILIATION, BCREDITORREPORTS = :BCREDITORREPORTS, BDEBTORREPORTS = :BDEBTORREPORTS,' +
   'BLEDGERREPORTS = :BLEDGERREPORTS, BSTOCKREPORTS = :BSTOCKREPORTS, BUSERREPORTS = :BUSERREPORTS, BPOSTING = :BPOSTING,' +
   'BGLOBALPROCESSES = :BGLOBALPROCESSES, BSYSTEMSETUP = :BSYSTEMSETUP, USEREMAIL = :USEREMAIL, BONLINE = :BONLINE,' +
   'SPCIPADDRESS = :SPCIPADDRESS, DSYSDATE = :DSYSDATE, BEDITPRICES = :BEDITPRICES, BGLOBALSEQ = :BGLOBALSEQ, BCASHBOOK = :BCASHBOOK,' +
   'BONLYPOS = :BONLYPOS, BPOSSUPER = :BPOSSUPER, BSEARCH = :BSEARCH, BEMAIL = :BEMAIL, BNOTUSED1 = :BNOTUSED1' +
   ' where WUSERID = :WUSERID' ;
     if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
       AQuery.Params[0].AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(VarToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
     else
     AQuery.Params[0].AsInteger := DMTCCoreLink.currentuser ;
     AQuery.open ;
     if AQuery.IsEmpty then
     begin
       AQuery.close ;
       AQuery.Params[0].AsInteger := DMTCCoreLink.currentuser ;
       AQuery.open ;
       // DMTCCoreLink.WriteNwReportOp('IUserGeneralNumber',IntToStr(DMTCCoreLink.currentuser));
     end;

     if AQuery.IsEmpty then raise Exception.Create('Error getting next docnumber!');
     AQuery.Edit ;


    // done : Pieter multy user precoursion this way the number is unique.
    Case DocType of
      11: begin
            AQuery.fieldByName('SCreditNoteNextNumber').AsString:= NewDocno;
          end;
      12: begin
            AQuery.fieldByName('SPurchaseNextNumber').AsString:= NewDocno;
          end;
      13: begin
            AQuery.fieldByName('SGoodsReturnedNextNumber').AsString:= NewDocno;
          end;
      14: begin
            AQuery.fieldByName('SQuoteNextNumber').AsString:= NewDocno;
          end;
      15: begin
            AQuery.fieldByName('SOrderNextNumber').AsString:= NewDocno;
        end;
    else
        begin
           AQuery.fieldByName('SInvoiceNextNumber').AsString:= NewDocno;
        end;
    end;


    AQuery.Post   ;
    AQuery.close ;
    i := 0 ;
    end; // end else doctype 16,17
    except
      on e: Exception do
        begin
         dec(I) ;
         if i = 0 then raise Exception.create('User table error :' + e.message);
         sleep(1000);
        end;
    end;
    end ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;

end;

class function TDataBaseDocumentRoutines.GetDocNextNum(DocType : Integer;JustShow : Boolean  = false) : String ;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  I : Integer ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   i := 10 ;
   while i > 0 do
   begin
   try
    if  (DocType > 20) then
      begin
 AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.UpdateObject := AUpdateComp ;
           AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;

           AQuery.ParamByName('SParamName').AsString := Uppercase('DOCNO_'+ IntToStr(DocType) ) ;

             if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
               AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
             else
             AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

             AQuery.ParamByName('WTypeID').Asinteger := 0 ;
             AQuery.Open ;

             TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

             if AQuery.IsEmpty then
             begin
               AQuery.Append ;
               AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
               AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
               AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
               AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
               AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('SPARAMNAME').AsString :=  Uppercase('DOCNO_'+ IntToStr(DocType) ) ;
             end else
             AQuery.Edit ;



            Result :=  AQuery.fieldByName('SParamValue').AsString ;

            if Result ='' then
               begin
                 Result := 'D000001'
               end;
            AQuery.fieldByName('SParamValue').AsString:=TDataBaseStringRoutines.IncrementString(Result);
            if not JustShow then
            AQuery.Post else
            AQuery.Cancel ;
            i := 0 ;
     end else
   if  (DocType in [16,17]) then
     begin

           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.UpdateObject := AUpdateComp ;
           AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;
           if DocType = 16 then
           AQuery.ParamByName('SParamName').AsString := Uppercase('SSTOCKOUTNR')
           else
           AQuery.ParamByName('SParamName').AsString := Uppercase('SSTOCKINNR') ;

             if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
               AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
             else
             AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

             AQuery.ParamByName('WTypeID').Asinteger := 0 ;
             AQuery.Open ;

             TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

             if AQuery.IsEmpty then
             begin
               AQuery.Append ;
               AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
               AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
               AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
               AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
               AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
               AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
               if DocType = 16 then
               AQuery.FieldByName('SPARAMNAME').AsString := Uppercase('SSTOCKOUTNR')
               else
               AQuery.FieldByName('SPARAMNAME').AsString := Uppercase('SSTOCKINNR') ;
             end else
             AQuery.Edit ;



            Result :=  AQuery.fieldByName('SParamValue').AsString ;

            if Result ='' then
               begin
                if DocType = 16 then
                 Result := 'ST00001'
                 else
                 Result := 'SI00001' ;
               end;
            AQuery.fieldByName('SParamValue').AsString:=TDataBaseStringRoutines.IncrementString(Result);
            if not JustShow then
            AQuery.Post else
            AQuery.Cancel ;
            i := 0 ;
     end else
     begin
   AQuery.close ;
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
    if DMTCCoreLink.ExtraOptions.Values['ORACLE'] = 'true' then

    AQuery.sql.Text := 'Select * FROM users where WUSERID = :WUSERID for update no wait ' 
    else
   AQuery.sql.Text := 'Select * FROM users where WUSERID = :WUSERID with lock ' ;
   AUpdateComp.ModifySQL.Text :='update users set ' +

   '  SPASSWORD = :SPASSWORD, SUSERNAME = :SUSERNAME, ' +
   'SCREDITNOTENEXTNUMBER = :SCREDITNOTENEXTNUMBER , SINVOICENEXTNUMBER = :SINVOICENEXTNUMBER, ' +
   'SPURCHASENEXTNUMBER = :SPURCHASENEXTNUMBER, SGOODSRETURNEDNEXTNUMBER = :SGOODSRETURNEDNEXTNUMBER, SRECEIPTNEXTNUMBER = :SRECEIPTNEXTNUMBER,' +
   'SQUOTENEXTNUMBER = :SQUOTENEXTNUMBER, SORDERNEXTNUMBER = :SORDERNEXTNUMBER, SNEXTBATCHNUMBER = :SNEXTBATCHNUMBER,' +
   'BDISABLED = :BDISABLED, BACCOUNTS = :BACCOUNTS, BSTOCK = :BSTOCK,' +
   'BBATCHENTRY = :BBATCHENTRY, BCREDITNOTE = :BCREDITNOTE, BINVOICES = :BINVOICES, BPURCHASES = :BPURCHASES,' +
   'BSTOCKRETURNS = :BSTOCKRETURNS, BRECONCILIATION = :BRECONCILIATION, BCREDITORREPORTS = :BCREDITORREPORTS, BDEBTORREPORTS = :BDEBTORREPORTS,' +
   'BLEDGERREPORTS = :BLEDGERREPORTS, BSTOCKREPORTS = :BSTOCKREPORTS, BUSERREPORTS = :BUSERREPORTS, BPOSTING = :BPOSTING,' +
   'BGLOBALPROCESSES = :BGLOBALPROCESSES, BSYSTEMSETUP = :BSYSTEMSETUP, USEREMAIL = :USEREMAIL, BONLINE = :BONLINE,' +
   'SPCIPADDRESS = :SPCIPADDRESS, DSYSDATE = :DSYSDATE, BEDITPRICES = :BEDITPRICES, BGLOBALSEQ = :BGLOBALSEQ, BCASHBOOK = :BCASHBOOK,' +
   'BONLYPOS = :BONLYPOS, BPOSSUPER = :BPOSSUPER, BSEARCH = :BSEARCH, BEMAIL = :BEMAIL, BNOTUSED1 = :BNOTUSED1' +
   ' where WUSERID = :WUSERID' ;
     if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
       AQuery.Params[0].AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(VarToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
     else
     AQuery.Params[0].AsInteger := DMTCCoreLink.currentuser ;
     AQuery.open ;
     if AQuery.IsEmpty then
     begin
       AQuery.close ;
       AQuery.Params[0].AsInteger := DMTCCoreLink.currentuser ;
       AQuery.open ;
       // DMTCCoreLink.WriteNwReportOp('IUserGeneralNumber',IntToStr(DMTCCoreLink.currentuser));
     end;

     if AQuery.IsEmpty then raise Exception.Create('Error getting next docnumber!');
     AQuery.Edit ;


    // done : Pieter multy user precoursion this way the number is unique.
    Case DocType of
      11: begin
           result := AQuery.fieldByName('SCreditNoteNextNumber').AsString  ;
           AQuery.fieldByName('SCreditNoteNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SCreditNoteNextNumber').AsString);
          end;
      12: begin
           result :=  AQuery.fieldByName('SPurchaseNextNumber').AsString  ;
           AQuery.fieldByName('SPurchaseNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SPurchaseNextNumber').AsString);
          end;
      13: begin
           result :=  AQuery.fieldByName('SGoodsReturnedNextNumber').AsString  ;
           AQuery.fieldByName('SGoodsReturnedNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SGoodsReturnedNextNumber').AsString);
          end;
      14: begin
           result := AQuery.fieldByName('SQuoteNextNumber').AsString  ;
           AQuery.fieldByName('SQuoteNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SQuoteNextNumber').AsString);
          end;
      15: begin
           result := AQuery.fieldByName('SOrderNextNumber').AsString  ;
           AQuery.fieldByName('SOrderNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SOrderNextNumber').AsString);
        end;
    else
        begin
         result := AQuery.fieldByName('SInvoiceNextNumber').AsString  ;
         AQuery.fieldByName('SInvoiceNextNumber').AsString:= TDataBaseStringRoutines.IncrementString(AQuery.fieldByName('SInvoiceNextNumber').AsString);
        end;
    end;

    if not JustShow then
    AQuery.Post else
    AQuery.Cancel ;
    AQuery.close ;
    i := 0 ;
    end; // end else doctype 16,17
    except
      on e: Exception do
        begin
         dec(I) ;
         if i = 0 then raise Exception.create('User table error :' + e.message);
         sleep(1000);
        end;
    end;
    end ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
   if result = '' then
     raise Exception.Create('New documentid for documenttype(' + IntToStr(DocType) + ') cannot be empty');
end;

class function TDataBaseDocumentRoutines.GetPosNextNum : String ;
var
 AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  I : Integer ;

begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   i := 10 ;
   while i > 0 do
   begin
   try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;

   AQuery.ParamByName('SParamName').AsString := Uppercase('SNextPOSInv') ;
     if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
       AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0)
     else
     AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

     AQuery.ParamByName('WTypeID').Asinteger := 0 ;
     AQuery.Open ;

     TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

     if AQuery.IsEmpty then
     begin
       AQuery.Append ;
       AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
       AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
       AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
       AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
       AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
       AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
       AQuery.FieldByName('SPARAMNAME').AsString := Uppercase('SNextPOSInv') ;
     end else
     AQuery.Edit ;



   // try
    AQuery.Edit;
    Result :=  AQuery.fieldByName('SParamValue').AsString ;

    if Result ='' then Result := 'POS00001';
    AQuery.fieldByName('SParamValue').AsString:=TDataBaseStringRoutines.IncrementString(Result);
    AQuery.Post;
    i := 0 ;
   { except
      on e : Exception
       raise Exception.create(DMTCCoreLink.gettextlang(2054));
    end;}



    except
      on e: Exception do
        begin
         dec(I) ;
         if i = 0 then raise Exception.create('User table error :' + e.message);
         sleep(1000);
        end;
    end;
    end ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
end;

class function TDataBaseDocumentRoutines.GetAnnyNextNum(NumName : String;Option : integer = 0;NewValue : String = '' ) : String ;
var
 AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  I : Integer ;

begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   i := 10 ;
   while i > 0 do
   begin
   try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName') ;

   AQuery.ParamByName('SParamName').AsString := Uppercase(NumName) ;
     if DMTCCoreLink.ReadNwReportOp('BUseGeneralNumber','false') then
       AQuery.ParamByName('wUserID').AsInteger :=  DMTCCoreLink.ReadSysParam('IUserGeneralNumber', VarToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber','0')),DMTCCoreLink.currentuser,0)

     else
     AQuery.ParamByName('wUserID').AsInteger := DMTCCoreLink.currentuser ;

     AQuery.ParamByName('WTypeID').Asinteger := 0 ;
     AQuery.Open ;

     TDatabaseTableRoutines.UpdateQuery(AQuery,'SYSPARAMS',['WPARAMID']);

     if AQuery.IsEmpty then
     begin
       AQuery.Append ;
       AQuery.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
       AQuery.FieldByName('BACTIVE').AsInteger :=   1 ;
       AQuery.FieldByName('WUSERID').AsInteger :=   AQuery.ParamByName('wUserID').AsInteger ;
       AQuery.FieldByName('WTYPEID').AsInteger :=   0 ;
       AQuery.FieldByName('WSOURCEID').AsInteger :=   0;
       AQuery.FieldByName('WSOURCETYPEID').AsInteger :=   0 ;
       AQuery.FieldByName('SPARAMNAME').AsString :=  Uppercase(NumName) ;
     end else
     AQuery.Edit ;

  //   if AQuery.IsEmpty then raise Exception.Create('Error getting next posnumber!');




   // try
    AQuery.Edit;
    Result :=  AQuery.fieldByName('SParamValue').AsString ;

    if Option = 1 then exit ;

    if (Option = 3 ) and (result = '') then
      begin
       AQuery.Post;
       exit ;
      end;

    if Result ='' then Result := Copy(NumName,1,2) + '00001';

    if Option = 2 then
      begin
       AQuery.fieldByName('SParamValue').AsString:= NewValue ;
       Result := AQuery.fieldByName('SParamValue').AsString ;
      end
     else
    AQuery.fieldByName('SParamValue').AsString:=TDataBaseStringRoutines.IncrementString(Result);

    AQuery.Post;
    i := 0 ;
   { except
      on e : Exception
       raise Exception.create(DMTCCoreLink.gettextlang(2054));
    end;}



    except
      on e: Exception do
        begin
         dec(I) ;
         if i = 0 then raise Exception.create('User table error :' + e.message);
         sleep(1000);
        end;
    end;
    end ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
end;


class function TDataBaseRoutines.GetChildIDsFromGroupID(AGroupID : Integer;level : Integer ) : String ;
var
  LocalName,LocalName2 : String ;
 //  ParentID : Integer ;
  AQuery : TuniQuery ;
begin
  // prevent recursion loop
  If level = 10 then exit ;
  result := '' ;
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  inc(level);
  result := '' ;
  AQuery.sql.Text := ' Select WGROUPID FROM Groups where WPARENTGROUP2ID = :WGroupId' ;
  AQuery.Params[0].AsInteger := AGroupID ;
  AQuery.open ;
  // ParentID := AQuery.FieldByName('WPARENTGROUP2ID').AsInteger ;
  LocalName := IntToStr(AGroupID) ;
  while not AQuery.eof do
   begin
    LocalName2 := GetChildIDsFromGroupID(AQuery.FieldByName('WGROUPID').Asinteger,level) ;
    if LocalName2 <> '' then
    if Result <> '' then Result := Result + ',' ;
    result := result +  LocalName2 ;
    AQuery.next ;
   end;
   if result = '' then
      result :=  LocalName else
      result :=  LocalName + ',' + result;


  AQuery.close ;
  finally
    AQuery.Free ;
  end;
end;

class function TDataBaseRoutines.GetIDsFromGroupID(AGroupID : Integer;level : Integer ) : String ;
var
  Agroup : TGroupRecPointer ;

  LocalName : String ;


begin
  // prevent recursion loop
  If level = 10 then exit ;

  DMTCCoreLink.GroupsObject.getGroup(Agroup,AGroupID);
  LocalName := IntToStr(AGroupID) ;
  if AGroup^.WLinkID <> 0 then
     result := GetIDsFromGroupID(AGroup^.WLinkID,level+1) ;
    if result = '' then
     result :=  LocalName else
     result := result + ',' + LocalName ;

end;

class function TDataBaseRoutines.GetNesteldNameFromGroupID(AGroupID : Integer;level : Integer ) : String ;
//var
 // LocalName : String ;
 // ParentID : Integer ;
//  AQuery : TuniQuery ;
begin
result :=  DMTCCoreLink.GroupsObject.GetGroupNesteldName(AGroupID);
  {
  // prevent recursion loop
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  }

 { If level = 10 then exit ;
  inc(level);
  result := '' ;
  AQuery.sql.Text := ' Select * FROM Groups where WGROUPID = :WGroupId' ;
  AQuery.Params[0].AsInteger := AGroupID ;
  AQuery.open ;
  ParentID := AQuery.FieldByName('WPARENTGROUP2ID').AsInteger ;
  LocalName := AQuery.FieldByName('SDESCRIPTION').AsString ;
  AQuery.close ;
  if  ParentID <> 0 then
  result := GetNesteldNameFromGroupID(ParentID,level) ;
  if result = '' then
     result :=  LocalName else
     result := result + '@' + LocalName ; }

   { AQuery.sql.Text := 'WITH RECURSIVE RECGROUPS_TREE AS ( SELECT WGROUPID,CAST(groups.SDESCRIPTION AS VARCHAR(255)) AS INDENT '+
    ' FROM GROUPS  WHERE  (GROUPS.WPARENTGROUP2ID is null or GROUPS.WPARENTGROUP2ID  = 0) and GROUPS.WGROUPID <> 0 '+
    ' UNION ALL SELECT WGROUPID, trim( H.INDENT)||' + QuotedStr('@') + ' ||  D.SDESCRIPTION FROM GROUPS D JOIN RECGROUPS_TREE H ON D.WPARENTGROUP2ID = H.WGROUPID '+
     '  ) SELECT  * FROM RECGROUPS_TREE where WGroupid = :WGroupId' ;
    AQuery.Params[0].AsInteger := AGroupID ;

  AQuery.open ;
  result := trim(AQuery.fields[1].asstring) ;
  finally
    AQuery.Free ;
  end;   }
end;



class function TDataBaseRoutines.FillStringsWithReportingGroups(AList:TStrings;TpGroupID:integer;AsLookup:Boolean=false):Boolean;
  var
    i :Integer ;
    AQuery : TuniQuery ;
    AParent : TuniQuery ;
    MyList : TStringlist ;
function  LocalGetNesteldNameFromGroupID  : String ;
var
 Level : Integer ;
begin

  Level := 0 ;

  AParent.Locate('WGROUPID',AQuery.FieldByName('WGROUPID').AsInteger,[]);
  result := AParent.FieldByName('SDescription').AsString ;
  while AParent.FieldByName('WPARENTGROUP2ID').AsInteger <> 0 do
    begin
       if not AParent.Locate('WGROUPID',AParent.FieldByName('WPARENTGROUP2ID').AsInteger,[]) then
          exit ;
       result := AParent.FieldByName('SDESCRIPTION').AsString+ '@' + result    ;
       inc(Level) ;
       if Level = 10 then exit ;
    end;

end;

begin


  MyList := TStringlist.create ;
  try
  AList.Clear;
  DMTCCoreLink.GroupsObject.FillListWithReportingGroup(TpGroupID,MyList,AsLookup);
 { AQuery := TuniQuery.Create(nil) ;
  AParent := TuniQuery.Create(nil) ;
  try


  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select * from groups where WGroupTypeID=' + IntToStr(TpGroupID) +' order by WSortNo';
  AQuery.open ;
  AParent.Connection := DMTCCoreLink.TheZConnection ;
  AParent.SQL.Text := 'Select * from groups where WGroupTypeID=' + IntToStr(TpGroupID) +' order by WSortNo';
  AParent.open ;

  while not AQuery.Eof do
  begin
   if (AQuery.FieldByName('BDisable').AsInteger = 0) and
      (AQuery.FieldByName('SDescription').AsString <>'' ) then
     if not AsLookup then
       begin
         MyList.AddObject(LocalGetNesteldNameFromGroupID,TObject(AQuery.FieldByName('WGroupID').AsInteger))
       end else
       begin
          MyList.AddObject(LocalGetNesteldNameFromGroupID+#9+AQuery.FieldByName('WGroupID').AsString,TObject(AQuery.FieldByName('WGroupID').AsInteger));
       end;
    AQuery.Next;
  end;
  AQuery.Close;  }
  MyList.Sort ;
  for i := 0 to MyList.Count -1 do
    begin
      AList.AddObject(MyList[i],MyList.Objects[i]) ;

    end;

  finally
     MyList.free ;
  end;
  Result:= AList.Count>0;

  if result then
   AList.Insert(0,DMTCCoreLink.GetTextLang(20046));
 {finally
     AQuery.Free ;
     AParent.Free ;
  end;  }
end;


class function TDataBaseRoutines.AddDashInAccCodeNoPRefix(AccCode:String):String;
begin
  Result:=AccCode;
  If Length(Result)<DMTCCoreLink.MainAccountLength then
    exit;
  If Result[1] in ['0'..'9'] then
    if Length(AccCode)>1+DMTCCoreLink.MainAccountLength then

      Insert('-',Result,1+DMTCCoreLink.MainAccountLength)
     else
     else
  // Code with Account type in front thats the one longer than MainAccountLength +3
  if Length(AccCode)> DMTCCoreLink.MainAccountLength +3 then
       Insert('-',Result,1+DMTCCoreLink.MainAccountLength)
       else   // sometimes the subaccountcode is not there apperently
    if Length(AccCode)>DMTCCoreLink.MainAccountLength then
      Insert('-',Result,1+DMTCCoreLink.MainAccountLength);
  if result ='-' then
    result := '' ;
end;

class function TDataBaseRoutines.AddDashInAccCode(AccCode:String;ShortCode:Boolean=False):String;
begin
  Result:=AccCode;
  If Length(Result)<DMTCCoreLink.MainAccountLength then
    exit;
  If Result[1] in ['0'..'9'] then
    if Length(AccCode)>1+DMTCCoreLink.MainAccountLength then

      Insert('-',Result,1+DMTCCoreLink.MainAccountLength)
     else
     else
  // Code with Account type in front thats the one longer than MainAccountLength +3
  if Length(AccCode)> DMTCCoreLink.MainAccountLength +3 then
       Insert('-',Result,2+DMTCCoreLink.MainAccountLength)
       else   // sometimes the subaccountcode is not there apperently
    if Length(AccCode)>DMTCCoreLink.MainAccountLength then
      Insert('-',Result,2+DMTCCoreLink.MainAccountLength);
  if result ='-' then
    result := '' ;
end;


class function TDataBaseRoutines.AddDashInStdAccCode(AccCode:String):String;
begin
  Result:=AccCode;
  if Length(AccCode)>DMTCCoreLink.MainAccountLength then
      Insert('-',Result,1+DMTCCoreLink.MainAccountLength) ;

 if Length(Result)> (DMTCCoreLink.MainAccountLength + 4) then
      SetLength(Result,4+DMTCCoreLink.MainAccountLength);
end;

class function TDataBaseRoutines.AccCharToType(AChar:Char):Integer;
begin
  Result := Pos(aChar,'DCBTX');
end;

class function TDataBaseRoutines.AccTypeToChar(aAccountTypeID:Integer):Char;
begin
 Case aAccountTypeID of
  99 : Result:= 'X' ;
  1 : Result:= 'D' ;
  2 : Result:= 'C' ;
  3 : Result:= 'B' ;
  4 : Result:= 'T' ;
   else
     Result := 'G';
  end;
end;



class function TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(ASql : String;ShowError : boolean = false ) : Variant;
var
 AQuery : TuniQuery ;
begin
 result := 0 ;
 try
 AQuery := TuniQuery.Create(nil) ;
 try
 AQuery.Connection := DMTCCoreLink.TheZConnection ;
 AQuery.SQL.Text := ASql ;
 AQuery.open ;
 try
 result :=  AQuery.Fields[0].Value ;
 except
  result :=  AQuery.Fields[0].AsInteger ;
 end;
 AQuery.Close ;
 finally
  AQuery.free ;
 end;
 except
   on e : Exception do
    if ShowError then
      raise Exception.Create(e.Message);
    else
    result := 0 ;
 end;
end;

class function TDataBaseRoutines.ExecSql(ASql:String):Integer;
var
 AQuery : TuniQuery ;
begin
 // -1 is error
 Result := -1 ;
 AQuery := TuniQuery.Create(nil) ;
 try
   Try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := ASql ;
    AQuery.ExecSQL ;
    AQuery.Close ;
    Result := AQuery.RowsAffected ;
   except
   end;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseRoutines.TableExist(ATable : String) : Boolean ;
var
 Alist : TStringList ;
begin
  if (not DMTCCoreLink.TheZConnection.Connected )then
   begin
    result := false ;
    exit;
   end;
  Alist := TStringList.create ;
   try
     Alist.CaseSensitive := False;
     DMTCCoreLink.TheZConnection.GetTableNames(Alist);
     result := Alist.IndexOf(ChangeFileExt(ATable,'')) <> -1 ;
   finally
    Alist.free ;
   end
end;

class function TDataBaseRoutines.GetAccountCode(aAccId: Integer): String;
begin
  result := VarToStr(OpenSqlAndGetFirtsColumnValue('Select SAccountCode from Account where WaccountId=' + IntToStr(aAccId))) ;
end;


class function TDataBaseRoutines.GetAddCountryId(aName: String): Integer;
var
 AQuery : TuniQuery ;
 NextID : String ;
begin
 result := 0 ;
 if Trim(aName) ='' then exit ;
 AQuery := TuniQuery.Create(nil) ;
 try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT max(a.COUNTRIES_ID) FROM COUNTRIES a';
    AQuery.Open ;
    NextID := IntToStr(AQuery.Fields[0].AsInteger +1) ;

    AQuery.SQL.Text := 'SELECT COUNTRIES_ID FROM COUNTRIES where COUNTRIES_NAME = ' + QuotedStr(aName);
    AQuery.Open ;
    if AQuery.IsEmpty then
       begin
          AQuery.SQL.Text := 'insert into countries  (COUNTRIES_ID, COUNTRIES_NAME, COUNTRIES_ISO_CODE_2, COUNTRIES_ISO_CODE_3,ADDRESS_FORMAT_ID ) values('+NextID+', ' + QuotedStr(aName) +
                              ' ,'+ QuotedStr('')+','+ QuotedStr('')+',0)';
          AQuery.ExecSQL ;
          AQuery.SQL.Text := 'SELECT COUNTRIES_ID FROM COUNTRIES where COUNTRIES_NAME = ' + QuotedStr(aName);
          AQuery.Open ;
       end;
     result := AQuery.Fields[0].AsInteger ;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseRoutines.GetCountryISO3(
  aCountryId: Integer): String;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT COUNTRIES_ISO_CODE_3 FROM COUNTRIES where COUNTRIES_ID = ' + IntToStr(aCountryId);
    AQuery.Open ;
    result := AQuery.Fields[0].AsString ;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseRoutines.GetCountryISO2(
  aCountryId: Integer): String;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT COUNTRIES_ISO_CODE_2 FROM COUNTRIES where COUNTRIES_ID = ' + IntToStr(aCountryId);
    AQuery.Open ;
    result := AQuery.Fields[0].AsString ;
 finally
  AQuery.free ;
 end;
end;


class function TDataBaseRoutines.GetCountryName(
  aCountryId: Integer): String;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT COUNTRIES_NAME FROM COUNTRIES where COUNTRIES_ID = ' + IntToStr(aCountryId);
    AQuery.Open ;
    result := AQuery.Fields[0].AsString ;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseRoutines.CreateTotalsForAccount(
  aAccId: Integer;Force : Boolean = False): String;
var
 AQuery : TuniQuery ;
 InsertQuery : TuniQuery ;
 i,UntilCount  : Integer ;
begin
 UntilCount := 0 ;
 if  force then UntilCount  := 26 ;

 // Just create period 0
 // this reduces data
// Exit ;

 AQuery := TuniQuery.Create(nil) ;
 try
 InsertQuery := TuniQuery.Create(nil) ;
 try
    InsertQuery.Connection := DMTCCoreLink.TheZConnection ;
        InsertQuery.SQL.Text:= 'INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE)' +
        'VALUES (:WACCOUNTID,:WPERIODID,:WYEARID,:BACTUAL,:FAMOUNT,:DSYSDATE)' ;
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT * from Totals where WAccountID = ' + IntToStr(aAccId) + 'order by WPeriodID';
    AQuery.Open ;
// for i :=0 to 26 do
 for i :=0 to UntilCount do
      begin
        if not AQuery.Locate('WACCOUNTID;BACTUAL;WPERIODID',vararrayof([aAccId,1,i]),[]) then
        begin
        InsertQuery.ParamByName('WAccountID').AsInteger := aAccId ;
        InsertQuery.ParamByName('WPeriodID').AsInteger := i ;
         if (i < 14) and (i <> 0) then
        InsertQuery.ParamByName('WYEARID').AsInteger  := 1 else
        InsertQuery.ParamByName('WYEARID').AsInteger  := 2 ;
        InsertQuery.ParamByName('BActual').AsInteger :=1;
        InsertQuery.ParamByName('FAmount').AsFloat := 0;
        InsertQuery.ExecSQL;
        end;
      end;
    // create buget for defaul accounts
   if not (GetAccountType(aAccId) in [1,2]) then
     begin
       for i :=0 to 26 do
            begin
              // dont do lastyear
              if (i > 0) and (i < 14) then Continue ;
              if not AQuery.Locate('WACCOUNTID;BACTUAL;WPERIODID',vararrayof([aAccId,0,i]),[]) then
              begin
              InsertQuery.ParamByName('WAccountID').AsInteger := aAccId ;
              InsertQuery.ParamByName('WPeriodID').AsInteger := i ;
               if (i < 14) and (i <> 0) then
              InsertQuery.ParamByName('WYEARID').AsInteger  := 1 else
              InsertQuery.ParamByName('WYEARID').AsInteger  := 2 ;
              InsertQuery.ParamByName('BActual').AsInteger :=0;
              InsertQuery.ParamByName('FAmount').AsFloat := 0;
              InsertQuery.ExecSQL;
              end;
            end;
     end;
 finally
  InsertQuery.free ;
 end;
 finally
  AQuery.free ;
 end;
end;


class procedure TDataBaseRoutines.GetAccountCodeAndTypeFromId(Var AccountCode:string;var TypeID : Integer;Accountid:Integer);
begin
 TypeID := DMTCCoreLink.AccObject.getAccountType(TypeID ) ;
 AccountCode := DMTCCoreLink.AccObject.getAccountSimpelCode(Accountid ) ;
end;

class function TDataBaseRoutines.GetAccountIdFromCodeAndType(AccountCode:string;TypeID : Integer):integer;
Var
 AQuery : TuniQuery ;
begin
 result := -1 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  if (TypeID = -1) then
  AQuery.Sql.text := 'select WAccountID from Account Where SAccountCode ='+ QuotedStr(trim(AccountCode))+' and WAccountTypeId in (0,3,4)'
  else
  if (TypeID = 99) or (TypeID = 5)   then
  AQuery.Sql.text := 'select WAccountID from Account Where SAccountCode ='+ QuotedStr(Trim(AccountCode))
  else
  AQuery.Sql.text := 'select WAccountID from Account Where SAccountCode ='+ QuotedStr(trim(AccountCode))+' and WAccountTypeId=' + IntToStr(TypeID) ;
  AQuery.open ;
  if not AQuery.IsEMpty then
    result := AQuery.fields[0].asinteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.IsIncomeExpense(aAccId: Integer): Boolean;
begin
  result :=  (StrToIntDef(VarToStr( OpenSqlAndGetFirtsColumnValue('Select BIncomeExpense from Account where WaccountId=' + IntToStr(aAccId))),0) = 1);
end;

class function TDataBaseRoutines.GetAccountType(aAccId: Integer): Integer;
begin
  result := DMTCCoreLink.AccObject.getAccountType(aAccId) ;
end;


class function TDataBaseRoutines.SimpelAccountCodeToMainAccount(
  aAccountCode: String): String;
begin
 result := copy(aAccountCode,1,DMTCCoreLink.MainAccountLength);
end;

class function TDataBaseRoutines.SimpelAccountCodeToSubAccount(
  aAccountCode: String): String;
begin
 result := copy(aAccountCode,DMTCCoreLink.MainAccountLength+1,3);
end;


class function TDataBaseRoutines.GetUniqueAccountCode(
  APrefix: String): String;
  Var
   StartCode , i : Integer ;
   mask : String ;
begin
   i :=  0 ;
   mask := UpperCase(APrefix) +  '000000000' ;
   SetLength(mask,DMTCCoreLink.MainAccountLength+3) ;
   StartCode := OpenSqlAndGetFirtsColumnValue('Select max(waccountId) from Account') ;
   result := FormatFloat(mask,StartCode) ;
   while VartoStr(OpenSqlAndGetFirtsColumnValue('Select  waccountId from Account where SAccountCode = ' + QuotedStr(result)))<> '' do
     begin
      inc(StartCode) ;
      inc(i);
      if i > 1000 then raise Exception.Create('Unable to create unique accountcode');
      result := FormatFloat(mask,StartCode) ;
     end;
end;


function GetDomainName: AnsiString;
type
 WKSTA_INFO_100 = record
   wki100_platform_id: Integer;
   wki100_computername: PWideChar;
   wki100_langroup: PWideChar;
   wki100_ver_major: Integer;
   wki100_ver_minor: Integer;
 end;

 WKSTA_USER_INFO_1 = record
   wkui1_username: PChar;
   wkui1_logon_domain: PChar;
   wkui1_logon_server: PChar;
   wkui1_oth_domains: PChar;
 end;
type
 //Win9X ANSI prototypes from RADMIN32.DLL and RLOCAL32.DLL

 TWin95_NetUserGetInfo = function(ServerName, UserName: PChar; Level: DWORD; var
   BfrPtr: Pointer): Integer;
 stdcall;
 TWin95_NetApiBufferFree = function(BufPtr: Pointer): Integer;
 stdcall;
 TWin95_NetWkstaUserGetInfo = function(Reserved: PChar; Level: Integer; var
   BufPtr: Pointer): Integer;
 stdcall;

 //WinNT UNICODE equivalents from NETAPI32.DLL

 TWinNT_NetWkstaGetInfo = function(ServerName: PWideChar; level: Integer; var
   BufPtr: Pointer): Integer;
 stdcall;
 TWinNT_NetApiBufferFree = function(BufPtr: Pointer): Integer;
 stdcall;

 function IsWinNT: Boolean;
 var
   VersionInfo: TOSVersionInfo;
 begin
   VersionInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
   Result := GetVersionEx(VersionInfo);
   if Result then
     Result := VersionInfo.dwPlatformID = VER_PLATFORM_WIN32_NT;
 end;
var

 Win95_NetUserGetInfo: TWin95_NetUserGetInfo;
 Win95_NetWkstaUserGetInfo: TWin95_NetWkstaUserGetInfo;
 Win95_NetApiBufferFree: TWin95_NetApiBufferFree;

 WinNT_NetWkstaGetInfo: TWinNT_NetWkstaGetInfo;
 WinNT_NetApiBufferFree: TWinNT_NetApiBufferFree;

 WSNT: ^WKSTA_INFO_100;
 WS95: ^WKSTA_USER_INFO_1;

 EC: DWORD;
 hNETAPI: THandle;
begin
 hNETAPI := 0 ;
 Win95_NetWkstaUserGetInfo := nil ;
 try
   Result := '';

   if IsWinNT then
   begin
     hNETAPI := LoadLibrary('NETAPI32.DLL');
     if hNETAPI <> 0 then
     begin @WinNT_NetWkstaGetInfo := GetProcAddress(hNETAPI, 'NetWkstaGetInfo');
         @WinNT_NetApiBufferFree  := GetProcAddress(hNETAPI, 'NetApiBufferFree');

       EC := WinNT_NetWkstaGetInfo(nil, 100, Pointer(WSNT));
       if EC = 0 then
       begin
         Result := WideCharToString(WSNT^.wki100_langroup);
         WinNT_NetApiBufferFree(Pointer(WSNT));
       end;
     end;
   end
   else
   begin
     hNETAPI := LoadLibrary('RADMIN32.DLL');
     if hNETAPI <> 0 then
     begin @Win95_NetApiBufferFree := GetProcAddress(hNETAPI, 'NetApiBufferFree');
         @Win95_NetUserGetInfo := GetProcAddress(hNETAPI, 'NetUserGetInfoA');

       EC := Win95_NetWkstaUserGetInfo(nil, 1, Pointer(WS95));
       if EC = 0 then
       begin
         Result := WS95^.wkui1_logon_domain;
         Win95_NetApiBufferFree(Pointer(WS95));
       end;
     end;
   end;

 finally
   if hNETAPI <> 0 then
     FreeLibrary(hNETAPI);
 end;
end;


class function TDataBaseStockRoutines.GetAddUnitId(aUnitStr:String;Add:Boolean=False):Integer;
 var
  LocalName : String ;
  AQuery : TuniQuery ;
begin
 LocalName:= copy(Trim(aUnitStr),1,DMTCCoreLink.GetFieldLength('UNIT','SDESCRIPTION'));
 result := 0 ;
 if LocalName = '' then Exit;
 Result:=0;
  If LocalName='' then Exit;
  result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WUNITID from UNIT where SDESCRIPTION =' + QuotedStr(aUnitStr))),-1);
  if Result = -1 then
    begin
     AQuery := TuniQuery.Create(nil) ;
     try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'INSERT INTO UNIT (WUNITID, SDESCRIPTION,FUNITQTY) VALUES (:WUNITID,:SDESCRIPTION,1)' ;
     AQuery.Params[0].AsInteger := DMTCCoreLink.GetNewId(tcidNEWUNITID) ;
     AQuery.Params[1].AsString := LocalName ;
     AQuery.ExecSQL ;
     Result := AQuery.Params[0].AsInteger ;
     finally
      AQuery.free ;
     end;
    end;
end;


class function TDataBaseStockRoutines.GetInputTaxId(
  AStockId: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WInputTaxID from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetOuputTaxId(
  AStockId: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WOutputTaxId from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetStockID(
  AStockCode : String ): Integer ;
 Var
  AQuery : TuniQuery ;
begin
 // NOQRY list is used in dmtccorelink.stocklist !!
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select  WStockId from stock where SStockCode = ' + QuotedStr(uppercase(AStockCode));
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger  ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetDefSup1(
  AStockId: Integer): integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WSUPPLIER1ID from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetStockCode(
  AStockId: Integer): String;
//Var
// AQuery : TuniQuery ;
begin
  result := DMTCCoreLink.stockObject.getStockCode(AStockId) ;

{ AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select SStockCode from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsString ;
  finally
     AQuery.free ;
  end;}
end;

class function TDataBaseStockRoutines.GetStockDescription(
  AStockId: Integer): String;
//Var
// AQuery : TuniQuery ;
begin
 {AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select SDescription from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsString ;
  finally
     AQuery.free ;
  end;}
  result := DMTCCoreLink.stockObject.getStockDescription(AStockId) ;
end;

class function TDataBaseStockRoutines.GetStockFullDescription(
  AStockId: Integer): String;
//Var
// AQuery : TuniQuery ;
begin
 {AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select trim(trim(SStockCode) ||' +QuotedStr(' ') + ' || coalesce(SDescription,'+QuotedStr('')+')) from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsString ;
  finally
     AQuery.free ;
  end;  }
    result := DMTCCoreLink.stockObject.GetStockCodeAndDescription(AStockId) ;
end;

class function TDataBaseStockRoutines.GetUniqueStockCode(
  APrefix: String;TryThisCode : String): String;
  Var
   StartCode , i : Integer ;
   mask : String ;
begin
  APrefix    := uppercase (APrefix);
  TryThisCode := uppercase (TryThisCode);
  if TryThisCode <> '' then
   if VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select wStockid from STOCK where SSTOCKCODE = ' + QuotedStr(TryThisCode))) = '' then
     begin
      result := TryThisCode ;
      exit ;
     end;

   i :=  0 ;
   mask := UpperCase(APrefix) +  '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' ;
   SetLength(mask,DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE')) ;
   StartCode := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select max(wStockid) from STOCK') ;
   result := FormatFloat(mask,StartCode) ;
   while VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select wStockid from STOCK where SSTOCKCODE = ' + QuotedStr(result)))<> '' do
     begin
      inc(StartCode) ;
      inc(i);
      if i > 1000 then raise Exception.Create('Unable to create unique stockcode');
      result := FormatFloat(mask,StartCode) ;
     end;
end;


class function TDataBaseStockRoutines.GetUnitDesc(
  aUnitID: Integer): String;
begin
  result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SDESCRIPTION from UNIT where WUNITID =' + IntToStr(aUnitID)));
end;

class function TDataBaseStockRoutines.GetUnpostedStockITemCount(AStockItem,
  ExcludeDocId: Integer): Double;
begin
 if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE') and not(DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES'] = 'TRUE') then
  result := GetUnpostedStockITemCountFromType(AStockItem,16,ExcludeDocId)
   else
  result := GetUnpostedStockITemCountFromType(AStockItem,10,ExcludeDocId);
  result := result + GetUnpostedStockITemCountFromType(AStockItem,14,ExcludeDocId,0,0,' and DocHead.BPosted = -1');
end;

{ TDatabaseUserRoutines }

class function TDatabaseUserRoutines.GetWinUsername: String;
// Get Os (Windows) User
var
  u: array[0..127] of Char;
  sz:DWord;
begin
  sz:=SizeOf(u);
  FillChar(u,sz,0);
  Windows.GetUserName(u,sz);
  Result:= copy(u,1,127);
end;


class function TDatabaseUserRoutines.GetPcName: String;
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

class function TDatabaseUserRoutines.GetUserAccessGlobalProcess(
  AUser: Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BGLOBALPROCESSES from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

class function TDatabaseUserRoutines.GetUserCanEditCreditNote(
  AUser: Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BCreditNote from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

class function TDatabaseUserRoutines.GetUserCanEditInvoice(AUser : Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BInvoices from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

class function TDatabaseUserRoutines.GetUserCanEditPurchase(
  AUser: Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BPurchases from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

class function TDatabaseUserRoutines.GetUserCanEditStockReturns(
  AUser: Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BStockReturns from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

class function TDatabaseUserRoutines.UniqueIDLogin(AUniqueId: String): Integer;
begin
 result := StrToIntDef( VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WUSERID from users where SPCIPADDRESS   =' + QuotedStr(trim(AUniqueId)) )),-1)  ;
end;



class function TDatabaseUserRoutines.EncodePassword(Password : String) : String;
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


class function TDatabaseUserRoutines.DecodePassword(Password : String) : String;
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


class function TDatabaseUserRoutines.ValidateUser(AUsername,
  aPassword: String): Integer;
begin
 result := StrToIntDef( VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WUSERID from users where SUSERNAME  =' + QuotedStr(AUsername) + ' and SPASSWORD = ' + QuotedStr(EncodePassword(apassword))  )),-1)  ;

end;

class function TDatabaseUserRoutines.GetUsername(AUser: Integer): String;
begin
 result :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SUSERNAME from users where WUSERID  =' + IntToStr(AUser) ))  ;
end;

class function TDatabaseUserRoutines.getSalesmanOnUserId(
  Auserid: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(
 'select SYSPARAMS.SPARAMVALUE salesman from  SYSPARAMS where SYSPARAMS.sparamname = ' +QuotedStr( 'WLOGINSALESMANLINK') + ' and SYSPARAMS.wuserid = '+ IntTostr(Auserid))),0);
end;

{ TDataBaseDocumentRoutines }



class function TDatabaseUserRoutines.GetUserCanEditStock(
  AUser: Integer): Boolean;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select BSTOCK from users where WUserId =' + IntToStr(AUser))) = '1' ;
end;

{ TDataBaseDocumentRoutines }

class function TDataBaseDocumentRoutines.GetGroupHistoryText(AGroupTypeID,
  ALinkId: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 Result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select b.SDescription,a.DDate from GROUPSSTATUS a left join groups b on a.WGROUPID = b.WGROUPID where a.WGROUPTYPEID =:WGROUPTYPEID and a.WLINKID =:WLINKID order by WGROUPSTATUSID desc';
  AQuery.params[0].AsInteger := AGroupTypeID ;
  AQuery.params[1].AsInteger := ALinkId ;
  AQuery.open ;
  while not AQuery.Eof do
    begin
       Result := Result + AQuery.Fields[1].AsString + ' / ' + AQuery.Fields[0].AsString ;
       AQuery.next ;
       if not AQuery.Eof then
          Result := Result + #13+#10 ;
    end;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseDocumentRoutines.GetListName(AIndex: Integer;
  AStringlist: TStrings;AsTrn : Boolean): String;
begin
  result := '' ;
  if AIndex > -1 then
     begin
        if AStringlist.Count > AIndex then
           begin
              if AStringlist.Objects[AIndex] <> nil then
                 begin
                    if AsTrn then

                     result :=  'TRN_' + IntToStr(Integer(AStringlist.Objects[AIndex]))
                     else
                      result :=  'LANG_' + IntToStr(Integer(AStringlist.Objects[AIndex])) ;

                 end else
                 begin
                    result :=  AStringlist[AIndex] ;
                 end;
           end;
     end;
end;

class function TDataBaseDocumentRoutines.SetListName(AName : String ; AStringlist : TStrings  ) : Integer ;
var
 i : Integer ;
begin
  result := -1 ;
  if AName <> '' then
     begin
        for i := 0 to AStringlist.Count -1 do
           begin
             if AStringlist.Objects[i] <> nil then
               begin
                  if  'LANG_' + IntToStr(Integer(AStringlist.Objects[i])) = AName then
                   begin
                    result := i ;
                    exit ;
                   end;
                  if  'TRN_' + IntToStr(Integer(AStringlist.Objects[i])) = AName then
                   begin
                    result := i ;
                    exit ;
                   end;
               end
               else
               if AStringlist[i] = AName then
               begin
                  result := i ;
                  exit ;
               end;
           end;

     end;
end;


class function TDataBaseDocumentRoutines.GetUniqueDocNo(APrefix,
  TryThisCode: String): String;
  Var
   StartCode , i : Integer ;
   mask : String ;
begin
  if TryThisCode <> '' then
   if VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select wDocid from DOCHEAD where SDOCNO = ' + QuotedStr(TryThisCode))) = '' then
     begin
      result := TryThisCode ;
      exit ;
     end;

   i :=  0 ;
   mask := UpperCase(APrefix) +  '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' ;
   SetLength(mask,DMTCCoreLink.GetFieldLength('DOCHEAD','SDOCNO')) ;
   StartCode := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select max(wDocid) from DOCHEAD') ;
   result := FormatFloat(mask,StartCode) ;
   while VartoStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select wDocid from DOCHEAD where SDOCNO = ' + QuotedStr(result)))<> '' do
     begin
      inc(StartCode) ;
      inc(i);
      if i > 1000 then raise Exception.Create('Unable to create unique doccode');
      result := FormatFloat(mask,StartCode) ;
     end;
end;

class function TDataBaseRoutines.GetUnchachedTaxRateOnId(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;

var
  Rate   : Double;
  aQuery,Bquery : TuniQuery ;

begin
  Result:=1 ;
  If TaxAccId = 0 then exit ;
  aQuery := TuniQuery.Create(Nil);
  try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    aQuery.SQL.Text := 'select FRate,WLinkTaxID,BLinkContra from TAX join account on (TAX.WaccountId = Account.WaccountId) where Account.WaccountId  ='  + IntToStr(TaxAccId) ;
    aQuery.Open ;
    Rate := aQuery.FieldByName('FRate').AsFloat ;
    if UseLinkRate then
    if aQuery.FieldByName('WLinkTaxID').AsInteger <> 0 then
        begin
           Bquery  := TuniQuery.Create(Nil);
            try
             Bquery.Connection := DMTCCoreLink.TheZConnection ;
             Bquery.SQL.Text := 'select FRate,WLinkTaxID from TAX join account on (TAX.WaccountId = Account.WaccountId) where Account.WaccountId  ='  + IntToStr(aQuery.FieldByName('WLinkTaxID').AsInteger) ;
             Bquery.Open ;
             if aquery.FieldByName('BLinkContra').AsInteger = 1 then
               Rate := Rate - Bquery.FieldByName('FRate').AsFloat else
               Rate := Rate + Bquery.FieldByName('FRate').AsFloat ;
            finally
              Bquery.free ;
            end;
     end;
  finally
     aQuery.free ;
  end;
  if rate <> 0 then
  Result:=1+(Rate/100);
end;

class function TDataBaseRoutines.GetTaxRateOnId(TaxAccId:Integer;UseLinkRate : Boolean = true):Double;

var
 // Rate   : Double;
 // aQuery,Bquery : TuniQuery ;
  aAccRec : TAccountRecPointer ;
begin
 {Result := GetUnchachedTaxRateOnId(TaxAccId,UseLinkRate)  ;
 exit ; }
  Result:=1 ;
  If TaxAccId < 0 then exit ;
  DMTCCoreLink.AccObject.getAccountOnid(aAccRec,TaxAccId) ;
  if UseLinkRate then
  Result := aAccRec.FRate
  else
  Result := aAccRec.FRate2 ;
end;

class procedure TDataBaseStockRoutines.SyncQty(
  var aStockRec: TStockRec;DocType,LastDocHeaderId : Integer );
 begin
  if (aStockRec.WStockTypeId in [0,1,2,3,9]) then
      begin
       aStockRec.FUnpostedItems :=  TDataBaseStockRoutines.GetUnpostedStockItemCount(aStockRec.WStockID,LastDocHeaderId);
       aStockRec.FUnpostedItems :=  aStockRec.FUnpostedItems - TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(aStockRec.WStockID,12,LastDocHeaderId);
       aStockRec.FUnpostedItems :=  aStockRec.FUnpostedItems - TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(aStockRec.WStockID,15,LastDocHeaderId,0,0,' and DocHead.BPosted = -1');
       aStockRec.FQtyInOrder :=  TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(aStockRec.WStockID,15,LastDocHeaderId,0,0,' and DocHead.BPosted = 0'); ;
      end;
      if (DocType = 14 ) then
             begin
              aStockRec.FUnpostedItems :=  aStockRec.FUnpostedItems + aStockRec.FminimumQty ;
              aStockRec.FUnpostedItems :=  aStockRec.FUnpostedItems +  TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(aStockRec.WStockID,14,LastDocHeaderId);
             end;

 end;


class function TDataBaseStockRoutines.StockLoadItem(
  var aStockRec: TStockRec): Boolean;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;

   AQuery.SQL.Text :=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstockonid') ;
   AQuery.ParamByName('WStockId').AsInteger := aStockRec.WStockID ;
   AQuery.open ;
 //  if not AQuery.IsEmpty then
   begin
   aStockRec.SDescription := AQuery.FieldByName('SDESCRIPTION').AsString;
   aStockRec.SExtraDesc := AQuery.FieldByName('SEXTRADESC').AsString;
   aStockRec.Smanufacturer := AQuery.FieldByName('Smanufacturer').AsString;
   aStockRec.SBarCodeNumber := AQuery.FieldByName('SBarcodeNumber').AsString;
   aStockRec.FPrice1:=AQuery.FieldByName('FSellingPrice1').AsFloat;
   aStockRec.FPrice2:=AQuery.FieldByName('FSellingPrice2').AsFloat;
   aStockRec.FPrice3:=AQuery.FieldByName('FSellingPrice3').AsFloat;
   aStockRec.SSTOCKCODE := AQuery.FieldByName('SSTOCKCODE').AsString;
   aStockRec.FQtyOnHand :=  AQuery.FieldByName('FQtyOnHand').AsFloat;
   aStockRec.FReorderQty := AQuery.FieldByName('FReorderQty').AsFloat;
   aStockRec.FReorderQtyTrig := AQuery.FieldByName('FReorderQtyTrig').AsFloat;
   aStockRec.FminimumQty := AQuery.FieldByName('FMINIMUMQTY').AsFloat;
   aStockRec.wLocBatSerTypeid:= AQuery.FieldByName('WLOCBATSERTYPEID').AsInteger;
   aStockRec.FUnitCost := AQuery.FieldByName('FUnitCost').AsFloat;
   aStockRec.FAvgUnitCost := AQuery.FieldByName('FUnitAveCost').AsFloat;
   aStockRec.WConstOfSaleSACCOUNTId :=  AQuery.FieldByName('WCostAccountID').Asinteger;
   aStockRec.WSaleSACCOUNTId :=  AQuery.FieldByName('WSaleSACCOUNTID').Asinteger;
   aStockRec.WStockAccountId :=  AQuery.FieldByName('WStockAccountID').Asinteger;
   aStockRec.WDefaultLinegroup1id :=  AQuery.FieldByName('WDEFAULTCOSTGROUP1ID').Asinteger;

   aStockRec.WUnitId:=aQuery.FieldByName('WUNITID').AsInteger;

   aStockRec.FUnpostedItems := 0 ;
   aStockRec.FQtyExpected := 0 ;
   aStockRec.FQtyInOrder := 0 ;
   aStockRec.FNettoWeigth :=    AQuery.FieldByName('FNETTOWEIGHT').AsFloat;
   aStockRec.FGrossWeigth :=    AQuery.FieldByName('FGROSSWEIGHT').AsFloat;
   aStockRec.WStockTypeId :=  AQuery.FieldByName('WStockTypeID').Asinteger;
   aStockRec.BApplyDiscount := AQuery.FieldByName('BApplyInvoiceDiscount').AsInteger = 1 ;
   aStockRec.WInputTaxID:=AQuery.FieldByName('WInputTaxID').AsInteger;
   aStockRec.WOutputTaxID:=AQuery.FieldByName('WOutputTaxID').AsInteger;
   aStockRec.SSTOCKCODESUP1 := AQuery.FieldByName('SSTOCKCODESUP1').AsString;
   aStockRec.FSellingPrice := 0 ;
   aStockRec.FDiscount := 0 ;
   aStockRec.FInputRate:=1;
   aStockRec.FOutputRate:=1;
    if AQuery.FieldByName('INTAXRATE').AsFloat <> 0 then
       aStockRec.FInputRate := 1 + AQuery.FieldByName('INTAXRATE').AsFloat / 100 ;
    if AQuery.FieldByName('OUTTAXRATE').AsFloat <> 0 then
       aStockRec.FOutputRate := 1 + AQuery.FieldByName('OUTTAXRATE').AsFloat / 100 ;
   aStockRec.SOutTax:=AQuery.FieldByName('OUTTAXCODE').AsString;
   aStockRec.SInTax:=AQuery.FieldByName('INTAXCODE').AsString;

    if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
       if aStockRec.WStockTypeId = 1 then
         aStockRec.FQtyOnHand := TDataBaseStockRoutines.GetStockQty(aStockRec.WStockID);

    result := not AQuery.IsEmpty  ;
   end;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseDocumentRoutines.GetTotalUnpostedDoc(
  AAccountid: Integer;MinusDocID : Integer): double;

var
 AQuery : TuniQuery ;
begin


 AQuery := TuniQuery.Create(nil) ;
 try
 AQuery.Connection := DMTCCoreLink.TheZConnection ;
 AQuery.SQL.Text := 'Select sum (fdocamount) from dochead where bposted in(0,-1) and WTypeid in (10,13) and  Waccountid = ' + IntToStr(AAccountid);
 AQuery.SQL.add(' and WDocid <> ' + IntToStr(MinusDocID)) ;

 AQuery.open ;
 result :=  AQuery.Fields[0].asFloat  ;

 AQuery.SQL.Text := 'Select sum (fdocamount) from dochead where bposted in(0,-1) and WTypeid in (11,12) and  Waccountid = ' + IntToStr(AAccountid);
 AQuery.SQL.add(' and WDocid <> ' + IntToStr(MinusDocID)) ;

 AQuery.open ;
 result :=  result - AQuery.Fields[0].asFloat  ;

 AQuery.Close ;
 finally
  AQuery.free ;
 end;

end;
class function TDataBaseDocumentRoutines.GetLineDescription(DocId,
  Lineid: Integer): String;
begin
 result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select trim(trim( a.SDescription) || COALESCE(a.SEXTRADESCRIPTION,'+QuotedStr('')+')) Description from docline b join messages a on b.WDESCRIPTIONID = a.WMESSAGEID'+
 ' where b.WDocId =' + IntToStr(DocId)+' and b.WDOCLINEID =' + IntToStr(Lineid)))  ;
end;

class function TDataBaseDocumentRoutines.GetDocumentLineText(DocId: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select SDocNo, SReference ,account.SAccountcode, account.SDescription    from dochead join v_account account on dochead.WAccountid = account.WAccountid where WDocId =' + IntToStr(DocId) ;
  AQuery.open ;
  Result := trim(AQuery.Fields[0].AsString + ' ' +  AQuery.Fields[1].AsString) + ' ' + AQuery.Fields[2].AsString +' ' + AQuery.Fields[3].AsString ;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseDocumentRoutines.GetDocOrDefEmail(
  DocId: Integer): String;
Var
 AQuery : TuniQuery ;
 begin
 Result := '' ;
 if TDatabaseTableRoutines.FieldExists('DOCHEAD','X_CUSTOMERS_EMAIL_ADDRESS') then
 begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select X_CUSTOMERS_EMAIL_ADDRESS  from dochead where WDocId =' + IntToStr(DocId) ;
  AQuery.open ;
  Result := trim(AQuery.Fields[0].AsString)  ;
  finally
     AQuery.free ;
  end;
  end;

  if Result = '' then
    Result := TDatabaseDebtorCreditorRoutines.GetEmailAdress(TDataBaseDocumentRoutines.GetAccountOfDocid(DocId)) ;
end;


class function TDataBaseDocumentRoutines.GetAccountOfDocid(
  DocId: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select Waccountid from dochead where WDocId =' + IntToStr(DocId) ;
  AQuery.open ;
  Result := AQuery.Fields[0].Asinteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseDocumentRoutines.AddDocLineStock(ADoc,AStock,WTaxId : Integer ; AQty,AExlPrice,ADiscount : Double ; ADate : TDateTime ; ADesc : String  ): integer;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  MaxId : Integer ;
begin
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := ' Select max(WDOCLINEID) FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADoc ;
   AQuery.open ;
   MaxId := AQuery.Fields[0].AsInteger + 1 ;

   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADoc ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCID','WDOCLINEID']);
   AQuery.Insert ;
   // WDOCLINEID, WDOCID, WSTOCKID, WLINETYPEID, WDESCRIPTIONID, FQTYORDERED, FQTYSHIPPED, FSELLINGPRICE,
   // FITEMDISCOUNT, WTAXID, FEXCLUSIVEAMT, FINCLUSIVEAMT, FTAXAMOUNT, DSYSDATE, SUNIT,
   // SSTOCKCODE, WPROFILEID, WSERIALNOID, WSORTNO, WREPORTINGGROUP1ID, WREPORTINGGROUP2ID, WACCOUNTID, BCHECKED, DDELIVERDATE, DDELIVERDATE2

   AQuery.FieldByName('WDOCID').AsInteger := ADoc ;
   AQuery.FieldByName('WSTOCKID').AsInteger := AStock ;
   AQuery.FieldByName('WDOCLINEID').AsInteger := MaxId ;
   result := MaxId ;
   AQuery.FieldByName('WLINETYPEID').AsInteger := 90 ;
   AQuery.FieldByName('WSORTNO').AsInteger := MaxId ;
   if ADesc <> '' then
   begin
   if copy(ADesc,1,1) = '@' then
     begin
        AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(TDataBaseStockRoutines.GetStockDescription(AStock) + ' ' + copy(ADesc,2,length(ADesc))) ;
     end else
      AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(ADesc) ;

   end   else
   AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(TDataBaseStockRoutines.GetStockDescription(AStock)) ;


   AQuery.FieldByName('WTAXID').AsInteger := WTaxId ;
   AQuery.FieldByName('FQTYSHIPPED').AsFloat := AQty ;
   AQuery.FieldByName('FQTYORDERED').AsFloat := AQty ;
   AQuery.FieldByName('FITEMDISCOUNT').AsFloat := ADiscount ;
   AQuery.FieldByName('FSELLINGPRICE').AsFloat := AExlPrice ;
   AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat := (AExlPrice * AQty ) * ((100 -   ADiscount ) / 100)   ;
   AQuery.FieldByName('FINCLUSIVEAMT').AsFloat := AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat * TDataBaseRoutines.GetTaxRateOnId(WTaxId) ;
   AQuery.FieldByName('FTAXAMOUNT').AsFloat := AQuery.FieldByName('FINCLUSIVEAMT').AsFloat - AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat ;
   if AQuery.FindField('DDELIVERDATE') <> nil then
      AQuery.FindField('DDELIVERDATE').AsDateTime := ADate ;
   AQuery.Post ;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;

end ;
class function TDataBaseDocumentRoutines.AddDocRemark(ADoc : Integer ;Remark : String ; ADate : TDateTime ) : Integer  ;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  MaxId : Integer ;
begin
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := ' Select max(WDOCLINEID) FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADoc ;
   AQuery.open ;
   MaxId := AQuery.Fields[0].AsInteger + 1 ;
   result := MaxId ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADoc ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCID','WDOCLINEID']);
   AQuery.Insert ;
   // WDOCLINEID, WDOCID, WSTOCKID, WLINETYPEID, WDESCRIPTIONID, FQTYORDERED, FQTYSHIPPED, FSELLINGPRICE,
   // FITEMDISCOUNT, WTAXID, FEXCLUSIVEAMT, FINCLUSIVEAMT, FTAXAMOUNT, DSYSDATE, SUNIT,
   // SSTOCKCODE, WPROFILEID, WSERIALNOID, WSORTNO, WREPORTINGGROUP1ID, WREPORTINGGROUP2ID, WACCOUNTID, BCHECKED, DDELIVERDATE, DDELIVERDATE2

   AQuery.FieldByName('WDOCID').AsInteger := ADoc ;
   AQuery.FieldByName('WDOCLINEID').AsInteger := MaxId ;
   AQuery.FieldByName('WSORTNO').AsInteger := MaxId ;
   AQuery.FieldByName('WLINETYPEID').AsInteger := 91 ;
   AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(Remark,true) ;
   if AQuery.FindField('DDELIVERDATE') <> nil then
      AQuery.FindField('DDELIVERDATE').AsDateTime := ADate ;
   AQuery.Post ;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;

end ;

class function TDataBaseDocumentRoutines.AddDocument(AType, AAccount: Integer; ARef: String): Integer;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;

   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM dochead where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := 0 ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCHEAD',['WDOCID']);
   AQuery.Insert ;
   AQuery.FieldByName('WDOCID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_DOCID') ;
   result :=AQuery.FieldByName('WDOCID').AsInteger ;
   AQuery.FieldByName('WACCOUNTID').AsInteger := AAccount ;

   AQuery.FieldByName('WCONTRAACCOUNT').AsInteger :=  TDatabaseDebtorCreditorRoutines.GetDefaultContraOnAccount(AAccount) ;


   AQuery.FieldByName('WTYPEID').AsInteger := AType ;
   if AType <> 99 then
   AQuery.FieldByName('SDOCNO').AsString := GetDocNextNum(AType) ;
   AQuery.FieldByName('SREFERENCE').AsString := copy(ARef,1,AQuery.FieldByName('SREFERENCE').Size);
   AQuery.Post ;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
 FillAccountInfoInDocHead(result,AAccount,true);
end ;
class procedure TDataBaseDocumentRoutines.CleanupDocLine(ADocId,
  Adoclineid: Integer);
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;

begin
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = :WDOCID and WDOCLINEID=:WLINEID and WLineTypeid not in (91,93)' ;
   AQuery.Params[0].AsInteger := ADocId ;
   AQuery.Params[1].AsInteger := Adoclineid ;
   AQuery.open ;
   if AQuery.IsEmpty then exit ;

  TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCID','WDOCLINEID']);
   while not AQuery.eof do
    begin
     AQuery.Edit  ;




     if AQuery.FieldByName('WLINETYPEID').AsInteger = 90 then
     begin

     AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat := (AQuery.FieldByName('FSELLINGPRICE').AsFloat * AQuery.FieldByName('FQTYSHIPPED').AsFloat ) * ((100 -   AQuery.FieldByName('FITEMDISCOUNT').AsFloat ) / 100)   ;
     AQuery.FieldByName('FINCLUSIVEAMT').AsFloat := AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat * TDataBaseRoutines.GetTaxRateOnId(AQuery.FieldByName('WTAXID').AsInteger) ;
     end else
     begin
     AQuery.FieldByName('FINCLUSIVEAMT').AsFloat := (AQuery.FieldByName('FSELLINGPRICE').AsFloat * AQuery.FieldByName('FQTYSHIPPED').AsFloat ) * ((100 -   AQuery.FieldByName('FITEMDISCOUNT').AsFloat ) / 100)   ;
     AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat := AQuery.FieldByName('FINCLUSIVEAMT').AsFloat / TDataBaseRoutines.GetTaxRateOnId(AQuery.FieldByName('WTAXID').AsInteger) ;

     end;


     AQuery.FieldByName('FTAXAMOUNT').AsFloat := AQuery.FieldByName('FINCLUSIVEAMT').AsFloat - AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat ;
     AQuery.Post ;
     AQuery.next ;
    end;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;

end ;
class function TDataBaseDocumentRoutines.CopyDocument(AFromDocId,AToAccountID,DocType : Integer;DoDelete:Boolean ;GenList:TStringList;DefaultDate : TDateTime;UseDocDate : Boolean;AltDesc1: String = '';AltDesc2: String = '';AltDesc3: String = '';AddMessageText : String = '';RedoAccountInfo : Boolean = false;UpdatePosted : Boolean = true;AppendOnOpen:Boolean=False;JustHeader:Boolean=False) : Integer ;

// Procedure CopyDocument(AFromDocId,AToAccountID,DocType : Integer;DoDelete:Boolean ;GenList:TStringList;DefaultDate : TDate;UseDocDate : Boolean;Var NewDocId : Integer ;AltDesc1: String = '';AltDesc2: String = '';AltDesc3: String = '';AddMessageText : String = '';RedoAccountInfo : Boolean = false;UpdatePosted : Boolean = true) ;
Var
   OldType : Integer ;
  i,j ,InternalDoctype,NextLineid :Integer;
  TWDocID          :String;
  tmpDocNo : String;
  TmpField         :Array of variant;
  AQDocLine : TuniQuery ;

  tblDocHeader : TuniQuery ;
  AUpdateSql : TUniUpdateSql ;
  tblDocLine  : TuniQuery ;
  AUpdateSqlLine : TUniUpdateSql ;
  NeedsRecalc : Boolean ;
begin
 Result := -1 ;
 InternalDoctype := 14 ;
 OldType := 0 ;
 if DocType < 10 then
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
  end else InternalDoctype := DocType ;

     tblDocHeader := TuniQuery.create(nil) ;
     AUpdateSql := TUniUpdateSql.create(nil);
     tblDocLine  := TuniQuery.create(nil) ;
     AUpdateSqlLine := TUniUpdateSql.create(nil);

     try
     tblDocHeader.Connection := DMTCCoreLink.TheZConnection ;
     tblDocLine.Connection := DMTCCoreLink.TheZConnection ;
     tblDocHeader.UpdateObject := AUpdateSql ;
     tblDocLine.UpdateObject := AUpdateSqlLine ;
     tblDocHeader.close ;
     tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + IntToStr(AFromDocId);
     tblDocHeader.open ;
     if (DoDelete  and (tblDocHeader.FieldByName('WTYPEID').AsInteger = 14 ) and (InternalDoctype in [10] )) then
        begin
          TDatabaseTableRoutines.UpdateQuery(tblDocHeader,'DOCHEAD',['WDOCID']);
          // Just change the type and renumber
          tblDocHeader.edit ;
          tblDocHeader.FieldByName('WTYPEID').AsInteger :=  InternalDoctype ;
          tblDocHeader.FieldByName('BPOSTED').AsInteger :=  0 ;
          if tblDocHeader.FieldByName('WSOURCETYPEID').AsInteger > 1 then
            tblDocHeader.FieldByName('SDOCNO').asstring :=  TDataBaseDocumentRoutines.GetPosNextNum
            else
          tblDocHeader.FieldByName('SDOCNO').asstring := TDataBaseDocumentRoutines.GetDocNextNum(InternalDoctype) ;
          tblDocHeader.post ;
          exit ;
        end ;

     // needs reclac if basis is not the same
     NeedsRecalc := False ;
     if (InternalDoctype in [10,11,14,16]) and (not (tblDocHeader.FieldByName('WTYPEID').AsInteger in [10,11,14,16])) then
       NeedsRecalc := True ;
     if (not (InternalDoctype in [10,11,14,16])) and (tblDocHeader.FieldByName('WTYPEID').AsInteger in [10,11,14,16]) then
       NeedsRecalc := True ;

     TDatabaseTableRoutines.UpdateQuery(tblDocHeader,'DOCHEAD',['WDOCID']);
      TDatabaseTableRoutines.UpdateQuery(tblDocLine,'DOCLINE',['WDOCID','WDOCLINEID']);
     if not tblDocHeader.IsEmpty then
        With tblDocHeader do
        begin

           OldType := tblDocHeader.fieldByname('WTYPEID').AsInteger ;

           tmpDocNo:='';
           setlength(TmpField,tblDocHeader.FieldCount);
           for i := 0 to tblDocHeader.FieldCount - 1 do
           begin
             if SameText(tblDocHeader.Fields[i].FieldName,'SDOCNO') then
               tmpDocNo := tblDocHeader.Fields[i].AsString;
             TmpField[i]:=  tblDocHeader.Fields[i].value;
           end;
           //
           if AppendOnOpen then
             begin
               tblDocHeader.sql.Text :=' Select * from dochead where Bposted = 0 and WTypeid = ' + IntToStr(InternalDoctype) +' and WAccountid = ' + IntToStr(AToAccountID) + ' and Sreference = '+ QuotedStr(AddMessageText)  ;
               tblDocHeader.open ;
               if tblDocHeader.IsEmpty then
                  tblDocHeader.Append
                  else
                  tblDocHeader.Edit ;
            end else
           tblDocHeader.Append;
           //
           if AltDesc1 <> '' then
            tblDocHeader.FieldByName('WMESSAGE1ID').AsInteger := DMTCCoreLink.GetAddDescription(AltDesc1,false) ;
           if AltDesc2 <> '' then
              tblDocHeader.FieldByName('WMESSAGE2ID').AsInteger := DMTCCoreLink.GetAddDescription(AltDesc2,false);
           if AltDesc3 <> '' then
              tblDocHeader.FieldByName('WMESSAGE3ID').AsInteger := DMTCCoreLink.GetAddDescription(AltDesc3,false);

           for j := 0 to tblDocHeader.FieldCount - 1 do
             if tblDocHeader.Fields[j].FieldName<>'WDOCID' then
             begin
               if tblDocHeader.Fields[j].FieldName='WTYPEID' then
                  tblDocHeader.Fields[j].Value := InternalDoctype // Create an Invoice
               else if tblDocHeader.Fields[j].FieldName='SDOCNO' then
               begin
                 if  InternalDoctype <> 0 then
                  begin
                  if tblDocHeader.Fields[j].AsString ='' then
                  tblDocHeader.Fields[j].AsString:=  TDataBaseDocumentRoutines.GetDocNextNum(InternalDoctype)
                  end else
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
                  tblDocHeader.Fields[j].AsInteger:=DMTCCoreLink.GetAddDescription('Ref:'+tmpDocNo + ' '+ DMTCCoreLink.ReadDescription(StrToIntDef(VarToStr(TmpField[j]),0)))
                else
                  tblDocHeader.Fields[j].AsInteger:=DMTCCoreLink.GetAddDescription(DMTCCoreLink.ReadDescription(StrToIntDef(VarToStr(TmpField[j]),0)))
                end;
              end
              else
                tblDocHeader.Fields[j].value :=TmpField[j];
        end;
        if  tblDocHeader.fieldByname('WDocID').AsInteger = 0 then
          tblDocHeader.fieldByname('WDocID').AsInteger :=DMTCCoreLink.GetNewId(tcidNEWDOCID);
        TWDocID := tblDocHeader.fieldByname('WDocID').AsString ;
        Result := tblDocHeader.fieldByname('WDocID').AsInteger ;

        tblDocHeader.fieldByname('WSOURCETYPEID').Clear ;
        tblDocHeader.fieldByname('BPOSTED').AsInteger := 0 ;
        tblDocHeader.fieldByname('WOPENITEMTRANSACTID').Clear ;
        tblDocHeader.Post;
       if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' then
              TDataBaseDocumentRoutines.AddDocLink(AFromDocId,Result,-1,-1 );
        tblDocHeader.close ;
        TDataBaseDocumentRoutines.FillAccountInfoInDocHead(Result,AToAccountID,RedoAccountInfo) ;

        tblDocHeader.sql.Text :=' Select * from dochead where WDocid=' + TWDocID  ;
        tblDocHeader.open ;
        if GenList <> nil then
           GenList.Add(tblDocHeader.fieldByname('WDocID').AsString);
       end;
       if not JustHeader then
       begin
       NextLineid := 1+ StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select max(WDoclineid)  from docline where WDocId =' + IntToStr(Result))),0)  ; ;

       tblDocLine.SQL.Text := 'select * from docline where wdocid = ' + TWDocID;
       tblDocline.open ;
       AQDocLine := TuniQuery.Create(nil) ;
       try
          AQDocLine.Connection := DMTCCoreLink.TheZConnection ;
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
          if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True' then
              TDataBaseDocumentRoutines.AddDocLink(AFromDocId,Result,AQDocLine.FieldByName('WDOCLINEID').AsInteger,AQDocLine.FieldByName('WDOCLINEID').AsInteger);

            tblDocline.Append;
            for j := 0 to AQDocLine.FieldCount - 1 do
              if  tblDocline.FindField(AQDocLine.Fields[j].FieldName) <> nil then
              begin
               if AQDocLine.Fields[j].FieldName='WDESCRIPTIONID' then
               begin
                  if AQDocLine.FindField('WLineTypeID').asinteger <> 91 then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=AQDocLine.Fields[j].value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsInteger := DMTCCoreLink.GetAddDescription(DMTCCoreLink.ReadDescription(AQDocLine.Fields[j].AsInteger),True);
                end
                else

                  if  AQDocLine.Fields[j].FieldName ='WDOCID' then
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).Value:=tblDocHeader.fieldByname('WDocID').Value
                  else
                    tblDocline.FindField(AQDocLine.Fields[j].FieldName).AsString:=AQDocLine.Fields[j].AsString;
              end;

              // correct tax
              tblDocline.FieldByName('WDOCLINEID').AsInteger :=  NextLineid ;
              inc(NextLineid);
              tblDocline.Post;
              AQDocLine.Next;
          end;
          if NeedsRecalc then
            TDataBaseDocumentRoutines.RecalcLinePrices(Result);

          TDataBaseDocumentRoutines.CleanupDochead(Result);
          if AddMessageText <> '' then
          begin
              tblDocline.Append;
             // tblDoclineWStockID.Value := 0;
              tblDocline.fieldByname('WDocID').Value := tblDocHeader.fieldByname('WDocID').Value;
              tblDocline.fieldByname('WDocLineID').Value :=  AQDocLine.FieldCount;
              tblDocLine.fieldByname('WSORTNO').AsInteger := AQDocLine.FieldCount;
              tblDocline.fieldByname('WLineTypeID').Value := 91 ;
              tblDocline.fieldByname('WDescriptionID').Value := DMTCCoreLink.GetAddDescription(AddMessageText,True);
              tblDocline.FieldByName('WDOCLINEID').AsInteger :=  NextLineid ;
            //  inc(NextLineid);
              tblDocline.Post;
          end;
          tblDocline.close;
       finally
         AQDocLine.free;
       end;
           end else  // else not justheader
           TDataBaseDocumentRoutines.CleanupDochead(Result);
       // Update Posted
       if UpdatePosted and not (OldType in [10,11,12,13]) then
       begin
         tblDocHeader.close ;
         tblDocHeader.SQL.Text := 'select * from dochead where WDocid=' + IntToStr(AFromDocId);
         tblDocHeader.open ;
         if not tblDocHeader.isempty then
         begin
           tblDocHeader.Edit;
           tblDocHeader.fieldByname('BRepeating').Value:=1;
           tblDocHeader.fieldByname('BPOSTED').Value:=1;
           tblDocHeader.Post;
         end;
       end;
         DMTCCoreLink.ExecSql('insert into DOCLINEOPTIONS SELECT '+ DMTCCoreLink.GetGenUniSyntaxShort('DOCLINEOPTIONS') +' , '+ IntToStr(Result)+', WLINEID, WITEMOPTIONVALUE1ID, WITEMOPTIONVALUE2ID, ' +
       ' WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID, WITEMOPTIONVALUE5ID, FEXTRAPRICE, FQTY, WDESCRIPTIONID FROM DOCLINEOPTIONS where Wdocid = ' + IntToStr(AFromDocId));

          if DoDelete then
               DMTCCoreLink.ExecSql( 'update MULTIMEDIA set  WREFID=' + IntToStr(Result) +' where STYPE = ' + QuotedStr('DOC') + '  and  WREFID = ' + IntToStr(AFromDocId) )
           else
           DMTCCoreLink.ExecSql('insert into MULTIMEDIA SELECT '+DMTCCoreLink.GetGenUniSyntaxShort('GEN_MULTIM_ID') +', a.STYPE, a.SGROUP, a.WREFID, a.SDESCRIPTION, a.SPATH, ' +
           ' a.SORGFILENAME, a.DFILEDATE, a.DSYSDATE,a.WSUBREF FROM MULTIMEDIA a where a.STYPE = ' + QuotedStr('DOC') + '  and a.WREFID = ' +IntToStr(AFromDocId))  ;

       if (DoDelete ) and not (OldType in [10,11,12,13]) then
       begin
          DMTCCoreLink.ExecSql('Delete from docline where wdocid ='+ IntToStr(AFromDocId));
          DMTCCoreLink.ExecSql('Delete from dochead where wdocid ='+ IntToStr(AFromDocId));
       end;

  finally
     tblDocLine.free ;
     AUpdateSqlLine.free ;
     tblDocHeader.free ;
     AUpdateSql.free ;
  end;
end;
class procedure TDataBaseDocumentRoutines.RecalcLinePrices(
  Adocid: Integer);
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  AAccount : Integer ;
  ADocType : Integer ;
  Wtaxid : Integer ;
begin
 AAccount := GetAccountOfDocid(Adocid);
 Wtaxid := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(AAccount);

 ADocType := GetdocType(Adocid);
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.UpdateObject := AUpdateComp ;
    AQuery.sql.Text := 'Select * FROM docline where WDOCID = :WDOCID and WTypeid <> 93' ;
    AQuery.Params[0].AsInteger := ADocId ;
    AQuery.open ;
    if AQuery.IsEmpty then exit ;

   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCID','WDOCLINEID']);
   while not AQuery.eof do
   begin
    AQuery.Edit  ;
    if Wtaxid <> 0  then
    AQuery.FieldByName('WTAXID').AsInteger := Wtaxid else
    begin
      if (ADocType in [10,11,14,16])  then
      AQuery.FieldByName('WTAXID').AsInteger := TDataBaseStockRoutines.GetOuputTaxId(AQuery.FieldByName('WSTOCKID').asinteger)
      else
      AQuery.FieldByName('WTAXID').AsInteger := TDataBaseStockRoutines.GetinputTaxId(AQuery.FieldByName('WSTOCKID').asinteger) ;

    end;

    AQuery.FieldByName('FSELLINGPRICE').AsFloat := TDataBaseStockRoutines.getStockPrice(AAccount,AQuery.FieldByName('WSTOCKID').asinteger,AQuery.FieldByName('FQTYSHIPPED').AsFloat) ;
    AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat := (AQuery.FieldByName('FSELLINGPRICE').AsFloat * AQuery.FieldByName('FQTYSHIPPED').AsFloat ) * ((100 -   AQuery.FieldByName('FITEMDISCOUNT').AsFloat ) / 100)   ;
    AQuery.FieldByName('FINCLUSIVEAMT').AsFloat := AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat * TDataBaseRoutines.GetTaxRateOnId(AQuery.FieldByName('WTAXID').AsInteger) ;
    AQuery.FieldByName('FTAXAMOUNT').AsFloat := AQuery.FieldByName('FINCLUSIVEAMT').AsFloat - AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat ;
    AQuery.Post ;
    AQuery.next ;
   end;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;

end ;

class  procedure TDataBaseDocumentRoutines.LoadDocTypes(AList : TStrings;AddAll,AddQuoteOrder:Boolean);
Var
  i:Byte;

begin
  AList.clear ;
  if AddAll then
  AList.addObject(DMTCCoreLink.GetTextLang(1098),TObject(0));


  // order
  if AddQuoteOrder then
  begin


  AList.addObject(TDataBaseRoutines.GetTypeDescription(15),TObject(15)) ;
  end;
  // purchase                                                            
  AList.addObject(TDataBaseRoutines.GetTypeDescription(12),TObject(12)) ;
  // return note
  AList.addObject(TDataBaseRoutines.GetTypeDescription(13),TObject(13)) ;
  // Quote
  if AddQuoteOrder then
  begin
  AList.addObject(TDataBaseRoutines.GetTypeDescription(14),TObject(14)) ;
  end;
  // invoice
  AList.addObject(TDataBaseRoutines.GetTypeDescription(10),TObject(10)) ;
  // creditnote
  AList.addObject(TDataBaseRoutines.GetTypeDescription(11),TObject(11)) ;
  if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
  begin
   // new types
  if not (DMTCCoreLink.ExtraOptions.Values['STOCKDOCDECREORD'] = 'TRUE') then
   AList.addObject(DMTCCoreLink.GetTextLang(3560),TObject(16)) ;
   AList.addObject(DMTCCoreLink.GetTextLang(3561),TObject(17)) ;
  end;


end;

class function TDataBaseDocumentRoutines.GetDocType(
  DocId: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WTYPEID  from dochead where WDocId =' + IntToStr(DocId))),0)  ;
end;

class function TDataBaseDocumentRoutines.GetLineType(DocId,
  Lineid: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WlineTypeid from docline where '+
 ' b.WDocId =' + IntToStr(DocId)+' and b.WDOCLINEID =' + IntToStr(Lineid))),0)  ;

end;

class function TDataBaseDocumentRoutines.AddDocLineStockOptions(ADoc,
  AStock, WTaxId: Integer; AQty, AExlPrice, ADiscount: Double;
  ADate: TDateTime; ADesc: String; Option1, Option2, Option3, Option4,
  Option5: Integer): integer;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  MaxId,LastDesc : Integer ;
  AStockRect : TStockRecPointer ;
begin
 AQuery := TuniQuery.Create(nil) ;

 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := ' Select max(WDOCLINEID) FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := ADoc ;
   AQuery.open ;
   MaxId := AQuery.Fields[0].AsInteger + 1 ;

   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = -1' ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCID','WDOCLINEID']);
   AQuery.Insert ;
   // WDOCLINEID, WDOCID, WSTOCKID, WLINETYPEID, WDESCRIPTIONID, FQTYORDERED, FQTYSHIPPED, FSELLINGPRICE,
   // FITEMDISCOUNT, WTAXID, FEXCLUSIVEAMT, FINCLUSIVEAMT, FTAXAMOUNT, DSYSDATE, SUNIT,
   // SSTOCKCODE, WPROFILEID, WSERIALNOID, WSORTNO, WREPORTINGGROUP1ID, WREPORTINGGROUP2ID, WACCOUNTID, BCHECKED, DDELIVERDATE, DDELIVERDATE2

   AQuery.FieldByName('WDOCID').AsInteger := ADoc ;
   AQuery.FieldByName('WSTOCKID').AsInteger := AStock ;
   AQuery.FieldByName('WDOCLINEID').AsInteger := MaxId ;
   result := MaxId ;
   AQuery.FieldByName('WLINETYPEID').AsInteger := 90 ;
   AQuery.FieldByName('WSORTNO').AsInteger := MaxId ;
   DMTCCoreLink.stockObject.getStockOnid(AStockRect,AStock);
   if ADesc <> '' then
   begin
   if copy(ADesc,1,1) = '@' then
     begin
        AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(TDataBaseStockRoutines.GetStockDescription(AStock) + ' ' + copy(ADesc,2,length(ADesc))) ;
     end else
      AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(ADesc) ;

   end   else
   AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(TDataBaseStockRoutines.GetStockDescription(AStock)) ;

  LastDesc := AQuery.FieldByName('WDESCRIPTIONID').AsInteger;
   AQuery.FieldByName('WTAXID').AsInteger := WTaxId ;
   if WTaxId = 0 then
      begin
         if (TDataBaseDocumentRoutines.GetDocType(ADoc) in [10,11,14,16]) then
               WTaxId :=  AStockRect.WOutputTaxID else
              WTaxId :=  AStockRect.WInputTaxID ;
      end;
   AQuery.FieldByName('FQTYSHIPPED').AsFloat := AQty ;
   AQuery.FieldByName('FQTYORDERED').AsFloat := AQty ;
   AQuery.FieldByName('FITEMDISCOUNT').AsFloat := ADiscount ;
   AQuery.FieldByName('FSELLINGPRICE').AsFloat := AExlPrice ;
   AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat := (AExlPrice * AQty ) * ((100 -   ADiscount ) / 100)   ;
   AQuery.FieldByName('FINCLUSIVEAMT').AsFloat := AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat * TDataBaseRoutines.GetTaxRateOnId(WTaxId) ;
   AQuery.FieldByName('FTAXAMOUNT').AsFloat := AQuery.FieldByName('FINCLUSIVEAMT').AsFloat - AQuery.FieldByName('FEXCLUSIVEAMT').AsFloat ;
   if AQuery.FindField('DDELIVERDATE') <> nil then
      AQuery.FindField('DDELIVERDATE').AsDateTime := ADate ;
   AQuery.Post ;
   AQuery.sql.Text := 'Select * FROM DOCLINEOPTIONS where WDOCID = -1' ;

   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINEOPTIONS',['WDOCLINEOPTIONSID']);
   AQuery.insert ;
   AQuery.fieldByname('WDOCLINEOPTIONSID').AsInteger := DMTCCoreLink.GetNewIdStr('DOCLINEOPTIONS') ;
   AQuery.fieldByname('WDOCID').AsInteger := ADoc ;
   AQuery.fieldByname('WLINEID').AsInteger := result ;
   AQuery.fieldByname('WITEMOPTIONVALUE1ID').AsInteger := Option1 ;
   if Option2 <> 0 then
   AQuery.fieldByname('WITEMOPTIONVALUE2ID').AsInteger := Option2 ;
   if Option3 <> 0 then
   AQuery.fieldByname('WITEMOPTIONVALUE3ID').AsInteger := Option3 ;
   if Option4 <> 0 then
   AQuery.fieldByname('WITEMOPTIONVALUE4ID').AsInteger := Option4 ;
   if Option5 <> 0 then
   AQuery.fieldByname('WITEMOPTIONVALUE5ID').AsInteger := Option5 ;
   AQuery.fieldByname('FEXTRAPRICE').AsFloat := 0 ;
   AQuery.fieldByname('FQTY').AsFloat := AQty ;
   AQuery.fieldByname('WDESCRIPTIONID').AsInteger := LastDesc ;
   AQuery.Post ;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;

end ;
class function TDataBaseDocumentRoutines.getDocPosted(
  docid: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select Bposted  from dochead where WDocId =' + IntToStr(DocId))),0)  ;

end;

class function TDataBaseDocumentRoutines.AddDocLineStockDef(ADoc,
  AStock: Integer; AQty: Double): integer;
  var
   ADefTax,ADocType,Account : Integer ;
   CurrentPrice : Double ;
begin
  ADocType := GetDocType(ADoc) ;
  Account := GetAccountOfDocid(ADoc) ;
  CurrentPrice := TDataBaseStockRoutines.getStockPrice(Account,AStock,aqty) ;
  ADefTax := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(Account) ;
  if ADefTax = 0 then
   begin
     if (ADocType in [10,11,14,17,18]) then
         ADefTax := TDataBaseStockRoutines.GetOuputTaxId(AStock)
         else
         ADefTax := TDataBaseStockRoutines.GetInputTaxId(AStock) ;
   end;

  result := AddDocLineStock(ADoc,AStock,ADefTax,AQty,CurrentPrice,0,0,'');
end;

class function TDataBaseDocumentRoutines.AddDocLineStockDefInc(ADoc,
  AStock: Integer; AQty: Double): integer;
  var
   ADefTax,ADocType,Account : Integer ;
   CurrentPrice : Double ;
   Aline : Integer ;
begin
  Aline := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WDOCLINEID) WDOCLINEID from docline where wdocid =  ' + IntToStr(ADoc) +' and wstockid = ' + IntToStr(AStock) )),-1) ;

  if Aline <> -1 then
    begin
     TDataBaseRoutines.ExecSql('update docline set FQTYORDERED  = FQTYORDERED + ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(AQty) +',FQTYSHIPPED  = FQTYSHIPPED + ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(AQty) +' where wdocid = ' + IntToStr(ADoc) +' and WDOCLINEID = ' + IntToStr(Aline));

      CleanupDocLine(ADoc,Aline);
     result := -1 ;


    end else
    begin
  ADocType := GetDocType(ADoc) ;
  Account := GetAccountOfDocid(ADoc) ;
  CurrentPrice := TDataBaseStockRoutines.getStockPrice(Account,AStock,aqty) ;
  ADefTax := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(Account) ;
  if ADefTax = 0 then
   begin
     if (ADocType in [10,11,14,17,18]) then
         ADefTax := TDataBaseStockRoutines.GetOuputTaxId(AStock)
         else
         ADefTax := TDataBaseStockRoutines.GetInputTaxId(AStock) ;
   end;

  result := AddDocLineStock(ADoc,AStock,ADefTax,AQty,CurrentPrice,0,0,'');
 end;
end;

class function TDataBaseDocumentRoutines.GetCurrencyRate(
  ACurid: Integer): Double;
begin
 result := StrToFloatDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select FRATE1 from CURRENCY where '+
 ' WCURRENCYID =' + IntToStr(ACurid))),1)  ;

end;

class procedure TDataBaseDocumentRoutines.AddDocLink(AFromDoc:Integer;AToDoc:Integer;AFromDocLine:Integer=-1;AToDocLine:Integer=-1);
var
 AQuery : TuniQuery ;
 AString : String ;
begin
 AQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT * FROM DOC_LINK where WFROMDOCID = :FD and WFROMDOCLINEID = :FDL and WTODOCID = :TD and WTODOCLINEID = :TDL' ;
    AQuery.Params[0].AsInteger := AFromDoc ;
    AQuery.Params[1].AsInteger := AFromDocLine ;
    AQuery.Params[2].AsInteger := AToDoc ;
    AQuery.Params[3].AsInteger := AToDocLine ;
    AQuery.open ;
    if AQuery.IsEmpty then
      begin
         AQuery.Close ;
         AQuery.Params[0].AsInteger := AToDoc ;
         AQuery.Params[1].AsInteger := AToDocLine ;
         AQuery.Params[2].AsInteger := AFromDoc ;
         AQuery.Params[3].AsInteger := AFromDocLine ;
         AQuery.open ;
       end;
    if AQuery.IsEmpty then
      begin
       AQuery.insert ;
       AQuery.FieldByName('WFROMDOCID').AsInteger :=AFromDoc ;
       AQuery.FieldByName('WFROMDOCLINEID').AsInteger := AFromDocLine;
       AQuery.FieldByName('WTODOCID').AsInteger :=AToDoc ;
       AQuery.FieldByName('WTODOCLINEID').AsInteger := AToDocLine;
       AQuery.post ;
      end;

  finally
     AQuery.free ;
  end;
end;

class procedure TDataBaseDocumentRoutines.CopyDocLink(AFromDoc,
  AToDoc: Integer);
var
 AQuery,bquery : TuniQuery ;
 AString : String ;
begin
 AQuery := TuniQuery.create(nil) ;
 bquery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    BQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT * FROM DOC_LINK where WToDOCID = :FD' ;
    bquery.SQL.Text := 'SELECT * FROM DOC_LINK where WFROMDOCID = :FD' ;
    bquery.Params[0].AsInteger := AToDoc ;
    AQuery.Params[0].AsInteger := AFromDoc ;
    AQuery.open ;
    BQuery.open ;

    if BQuery.IsEmpty then
    while not AQuery.Eof do
      begin
       BQuery.insert ;
       BQuery.FieldByName('WFROMDOCID').AsInteger :=AQuery.FieldByName('WFROMDOCID').AsInteger;
       BQuery.FieldByName('WFROMDOCLINEID').AsInteger := AQuery.FieldByName('WFROMDOCLINEID').AsInteger;
       BQuery.FieldByName('WTODOCID').AsInteger := AToDoc;
       BQuery.FieldByName('WTODOCLINEID').AsInteger := AQuery.FieldByName('WTODOCLINEID').AsInteger;
       BQuery.post ;
       AQuery.Next ;
      end;

  finally
     AQuery.free ;
      BQuery.free ;
  end;
end;
{ TDataBaseStringRoutines }


class procedure TDataBaseStringRoutines.FillStringListWithFormatSelect(
  AStringList: TStrings; ASelectAllWithKeyInFirstCol,Format: String;
  AEmptyTransaltionNr: integer);
var
 AQuery : TuniQuery ;
 AString : String ;
begin
 AQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := ASelectAllWithKeyInFirstCol ;
    AStringList.Clear ;
    if AEmptyTransaltionNr <> 0 then
    AStringList.Add(DMTCCoreLink.GetTextLang(AEmptyTransaltionNr)) ;
    AQuery.open ;
    if not (AQuery.fields[0].DataType in [ftSmallint, ftInteger, ftWord,ftFloat,
                                          ftCurrency,ftBytes, ftVarBytes, ftAutoInc,
                                          ftBlob, ftMemo, ftGraphic, ftFmtMemo,ftLargeint]) then
       raise Exception.Create('Wrong datatype in select');
    while not AQuery.Eof do
     begin
       AString := TDatabaseTableRoutines.ReplaceParams(Format,TDatabaseTableRoutines.GetDatasetAsParamString(AQuery)) ;
       AStringList.AddObject(AString,TObject(AQuery.fields[0].asinteger));
       AQuery.Next ;
     end;
  finally
     AQuery.free ;
  end;
end;

class procedure TDataBaseStringRoutines.FillStringListWithSelect(
  AStringList: TStrings; ASelectIntKeyDescFromTable: String;
  AEmptyTransaltionNr: integer);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := ASelectIntKeyDescFromTable ;
    AStringList.Clear ;
    if AEmptyTransaltionNr <> 0 then
    AStringList.Add(DMTCCoreLink.GetTextLang(AEmptyTransaltionNr)) ;
    AQuery.open ;
    if not (AQuery.fields[0].DataType in [ftSmallint, ftInteger, ftWord,ftFloat,
                                          ftCurrency,ftBytes, ftVarBytes, ftAutoInc,
                                          ftLargeint]) then
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

class function  TDataBaseStringRoutines.GetSqlTillWhereClause(ASql : String ) : String ;
var
 PostWhere : Integer ;
begin
 result := ASql ;
 PostWhere := pos('WHERE',Uppercase(result));
 if PostWhere > 0 then
    begin
      result := copy(Result,1,PostWhere-1);
    end;
end;

class function TDataBaseStringRoutines.GetCharsFromTextInAndPlusSignAsDivider(
  ATextWithIntStr: String): String;
Var
  S:String;
  i,x:Integer;
begin
  x:= -1 ;
  s := Trim(ATextWithIntStr)+'+';
  Result  := '';
  Repeat
    i := Pos('+',s);
    if i>0 then begin
      x := StrToIntDef(Copy(s,1,i-1),-1);
      Delete(s,1,i);
    end else s :='' ;
    if x>=0 then
      Result := Result + Chr(x);
    Until s='';
end;

class function TDataBaseStringRoutines.GetIndexValue(AStringList: TStrings;
  AID: Integer): Variant;
begin
  result := varNull ;
  if AID <> -1 then
     result := Integer(AStringList.Objects[AID]) ;

end;

class function TDataBaseStringRoutines.GetItemIndexFromId(
  AStringList: TStrings; AID: Integer): Integer;
begin
  result := AStringList.IndexOfObject(TObject(AID)) ;
end;

class function TDataBaseStringRoutines.IncrementString(Number: String;
  Increment: Integer): String;
var
  StringPart,StringPartright,
  NumPart,EndNumberString     : String;
  Count  : Integer;
begin
  Result :='';
  if Number = '' then
    exit ;
  NumPart := '';
  StringPart := '';
  StringPartright := '' ;
   for Count := Length(Number) downto 1 do
      begin
       if (Number[Count] in ['0','1','2','3','4','5','6','7','8','9'])then
           NumPart := Number[Count] + Numpart
           else if NumPart = '' then
              StringPartright := Number[Count] + StringPartright
              else
              break ;
      end;
  if count < Length(Number) then
     StringPart := copy(Number,1,count);
    count :=  Length(NumPart) ;
   if NumPart <> '' then
   EndNumberString := IntToStr((StrToInt64(NumPart)+Increment)) ;
   while length(EndNumberString) < count do
         EndNumberString := '0'+ EndNumberString ;
   result := StringPart + EndNumberString + StringPartright ;
end;


class function TDataBaseStringRoutines.StripNumericAndSpace(AString : String): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 1 to Length(AString) do
   if (AString[i] in ['A'..'Z','a'..'z',' ']) then
     Result := Result + AString[i] ;
end;


class function TDataBaseStringRoutines.StripEnterLinefeed(AString : String): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 1 to Length(AString) do
   begin
   if not (AString[i] = #10) then
      begin
        if not (AString[i] = #13) then
           Result := Result + AString[i]
           else
           Result := Result + ' ' ;
      end;
   end;
end;

class function TDataBaseStringRoutines.StripNotNumeric(AString : String): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 1 to Length(AString) do
   if (AString[i] in ['0','1','2','3','4','5','6','7','8','9','-',DecimalSeparator]) then
     Result := Result + AString[i] ;
end;

class function TDataBaseStringRoutines.StripNotInt(AString : String): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 1 to Length(AString) do
   if (AString[i] in ['0','1','2','3','4','5','6','7','8','9']) then
     Result := Result + AString[i] ;
end;

class function TDataBaseStringRoutines.ReplaceTag(Source,Tagname,
  Value: String;TagSep : char = '@' ): String;
  var
   PosParam : Integer ;
begin
result := Source ;
while pos('<'+TagSep+ Tagname+TagSep+'>',result) <> 0 do
      begin
        PosParam := pos('<'+TagSep+ Tagname+TagSep+'>',result) ;
        Delete(Result,PosParam,Length('<'+TagSep+ Tagname+TagSep+'>'));
        Insert( Value,Result,PosParam);
      end;
end;

class function TDataBaseRoutines.GetPeriodEndDate(
  Period: Integer): TDateTime;
Var
 AQuery : TuniQuery ;
 NumOfPEriods : Integer ;

begin
 NumOfPEriods := StrToIntDef(DMTCCoreLink.ReadSysVar('WNoOfPeriods'),12);
 if Period > (13+NumOfPEriods) then
    Period := 13+NumOfPEriods ;
 if Period < 14 then
 if Period > (-1+NumOfPEriods) then
  Period := -1+NumOfPEriods ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
   if Period <0 then
     begin
       AQuery.SQL.Text := 'Select DEnddate -1 from periods where WYEARID in (1,2) and WPERIODID = 1 ' ;
     end else
   if Period =0 then
     begin
       AQuery.SQL.Text := 'Select DStartdate -1 from periods where WYEARID in (1,2) and WPERIODID = 14 ' ;
     end else
  AQuery.SQL.Text := 'Select DENDDATE from periods where WYEARID in (1,2) and WPERIODID =' + IntToStr(Period);
  AQuery.open ;
  Result := AQuery.Fields[0].AsDateTime ;
  if Result = 0 then
   begin
     if (((Period < 14) and (Period > 1)) or ((Period < 27 ) and (Period > 14))) or (Period >= 27) then
      Result := GetPeriodEndDate(Period-1)
   end;

  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetPeriodFromDate(
  aDate: TDateTime): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WPeriodid from periods where  DSTARTDATE  <=  ' +  TDatabaseTableRoutines.GetFirebirdsSqlForDate(aDate) +
  ' and  DENDDATE >= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(aDate) ;
  AQuery.open ;
  if AQuery.IsEmpty then
    begin
       if  GetPeriodStartDate(1) > aDate then
         result := 1 else result := 26 ; 
    end else
  Result := AQuery.Fields[0].AsInteger  ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetPeriodStartDate(
  Period: Integer): TDateTime;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select DSTARTDATE from periods where WYEARID in (1,2) and WPERIODID =' + IntToStr(Period);
  AQuery.open ;
  Result := AQuery.Fields[0].AsDateTime ;

 if Result = 0 then
   begin
      if (((Period < 14) and (Period > 1)) or ((Period < 27 ) and (Period > 14))) or (Period >= 27) then
      Result := GetPeriodStartDate(Period-1)
   end;

  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetAccountDescription(
  aAccId: Integer): String;
var
 AQuery : TuniQuery ;
begin
 result := '';
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select SDescription From v_account Account where WAccountId =' + InttoStr(aAccId);
     AQuery.open ;
     if not AQuery.IsEmpty then
     result := AQuery.fields[0].AsString;
   finally
     AQuery.free ;
   end;
end;


class function TDataBaseRoutines.GetAccountFullDescription(
  aAccId: Integer): String;
var
 AQuery : TuniQuery ;
begin
 result := '';
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select WAccountTypeId,SMainAccountCode, SSubAccountCode,SDescription From v_account Account where WAccountId =' + InttoStr(aAccId);
     AQuery.open ;
     if not AQuery.IsEmpty then
     result := trim(AccTypeToChar(AQuery.fields[0].AsInteger)+AQuery.fields[1].AsString +'-' + AQuery.fields[2].AsString +' '+  AQuery.fields[3].AsString);

   finally
     AQuery.free ;
   end;
end;

class function TDataBaseRoutines.AddGroup(AName: String; GroupType,
  ParentID,FinancialCategory : Integer): Integer;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
      AQuery.Connection := DMTCCoreLink.TheZConnection ;
      AQuery.UpdateObject := AUpdateComp ;
      AQuery.sql.Text := ' Select * FROM Groups where 0 = 1' ;
      AUpdateComp.InsertSQL.Text :='INSERT INTO GROUPS (WGROUPID, WGROUPTYPEID, SDESCRIPTION, WPARENTGROUP2ID,' +
                                   'WPARENTGROUP1ID, DSYSDATE, WSORTNO) VALUES (:WGROUPID, :WGROUPTYPEID,:SDESCRIPTION,'+
                                   ':WPARENTGROUP2ID,:WPARENTGROUP1ID, :DSYSDATE, :WSORTNO)' ;

      AQuery.open ;

      AQuery.Insert ;
      AQuery.FieldByName('WGROUPID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWGROUPID);
      AQuery.FieldByName('WGROUPTYPEID').AsInteger := GroupType ;
      AQuery.FieldByName('SDESCRIPTION').AsString := AName ;
      AQuery.FieldByName('WPARENTGROUP2ID').AsInteger := ParentID ;
      AQuery.FieldByName('WPARENTGROUP1ID').AsInteger := FinancialCategory ;
      AQuery.FieldByName('WSORTNO').AsInteger := AQuery.FieldByName('WGROUPID').AsInteger ;
      AQuery.Post ;
      result := AQuery.FieldByName('WGROUPID').AsInteger ;
     AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
end;

class procedure TDataBaseRoutines.UpdateGroup(AName: String;
  Oldid,NewParent,sortorder,FinancialCategory: Integer);
var

  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
      AQuery.Connection := DMTCCoreLink.TheZConnection ;
      AQuery.UpdateObject := AUpdateComp ;
      AQuery.sql.Text := ' Select * FROM Groups where WGROUPID = :WGROUPID' ;
      AUpdateComp.ModifySQL.Text :='update GROUPS set WGROUPTYPEID=:WGROUPTYPEID, SDESCRIPTION = :SDESCRIPTION,' +
                           ' WPARENTGROUP2ID = :WPARENTGROUP2ID,  WPARENTGROUP1ID = :WPARENTGROUP1ID, DSYSDATE = :DSYSDATE,  '+
                           ' WSORTNO = :WSORTNO where WGROUPID = :WGROUPID' ;
      AQuery.Params[0].AsInteger := Oldid ;
      AQuery.open ;
      if not AQuery.IsEmpty then
         begin
           AQuery.Edit ;
           AQuery.FieldByName('SDESCRIPTION').AsString := AName ;
           AQuery.FieldByName('WPARENTGROUP2ID').AsInteger := NewParent ;
           AQuery.FieldByName('WPARENTGROUP1ID').AsInteger := FinancialCategory ;

           AQuery.FieldByName('WSORTNO').AsInteger := sortorder ;
           AQuery.Post ;
         end ;
     AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
end;
class function TDataBaseRoutines.GetPeriodDescription(Period,
  Year: Integer; LongDesc: Boolean): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 if Period = 0 then
   begin
     result := 'Opening bal.' ;
     Exit ;
   end ;
 if Period <  0 then
   begin
     result := 'Opening bal. lastyear' ;
     Exit ;
   end ;

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  if Year = 999 then
  begin
  AQuery.SQL.Text := 'Select SDescription,DStartDate, DENDDATE from periods where WYEARID in (1,2) and WPERIODID =:WPeriodId'  ;
  AQuery.params[0].AsInteger := Period ;
  end else
  begin
  AQuery.SQL.Text := 'Select SDescription,DStartDate, DENDDATE from periods where WYEARID = :WYearId and WPERIODID =:WPeriodId';
  AQuery.params[0].AsInteger := Year  ;
  AQuery.params[1].AsInteger := Period ;
  end; 
  AQuery.open ;
  if not AQuery.IsEmpty then
   begin
     result := AQuery.Fields[0].AsString ;
     if LongDesc then
       begin
          result := result + '  '  + AQuery.Fields[1].AsString + '/' + AQuery.Fields[2].AsString ;
       end;
   end;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases(
  AStockItem, ExcludeDocId: Integer;MaxInvId : Integer = 0;MaxBackordId : Integer = 0): Double;

begin
 result := GetUnpostedStockITemCountFromType(AStockItem,10,ExcludeDocId,MaxInvId,0,'',MaxBackordId) ;
 result := Result + GetUnpostedStockITemCountFromType(AStockItem,14,ExcludeDocId,MaxInvId,0,' and DocHead.BPosted = -1',MaxBackordId) ;
 Result := Result - GetUnpostedStockITemCountFromType(AStockItem,12,ExcludeDocId,0,0,'',MaxBackordId) ;
 Result := Result - GetUnpostedStockITemCountFromType(AStockItem,15,ExcludeDocId,0,0,' and DocHead.BPosted = -1',MaxBackordId) ;
 Result := Result + GetUnpostedStockITemCountFromType(AStockItem,16,ExcludeDocId,0,0,'',MaxBackordId);
end;



class function TDataBaseRoutines.DeleteGroup(GroupID: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 result := 0 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select count(*) from GROUPS where WParentGroup2Id =   '+ IntToStr(GroupID);
  AQuery.open ;
  if AQuery.Fields[0].AsInteger <> 0 then
    raise Exception.Create(DMTCCoreLink.GetTextLang(3073){'Group still has nesteled groups remove them first!'});

  AQuery.SQL.Text := 'select count(*) from Account where WREPORTINGGROUP1ID =   '+ IntToStr(GroupID) +'  or WREPORTINGGROUP2ID =   '+ IntToStr(GroupID)  ;
  AQuery.open ;
  if AQuery.Fields[0].AsInteger <> 0 then
    begin
      AQuery.SQL.Text := 'select * from Account where WREPORTINGGROUP1ID =   '+ IntToStr(GroupID) +'  or WREPORTINGGROUP2ID =   '+ IntToStr(GroupID)  ;
      AQuery.open ;
       raise Exception.Create(DMTCCoreLink.GetTextLang(3074){'Theres still accounts using this group please remove them first! (Firts account = '}+ AQuery.FieldByName('SACCOUNTCODE').AsString + ')');
    end;

  AQuery.SQL.Text := 'select count(*) from Dochead where WREPORTINGGROUP1ID =   '+ IntToStr(GroupID) +'  or WREPORTINGGROUP2ID =   '+ IntToStr(GroupID)  ;
  AQuery.open ;
  if AQuery.Fields[0].AsInteger <> 0 then
    raise Exception.Create(DMTCCoreLink.GetTextLang(3075){'Theres still documents using this group please remove them first!'});


  AQuery.SQL.Text := 'select count(*) from Stock where WREPORTINGGROUP1ID =   '+ IntToStr(GroupID) +'  or WREPORTINGGROUP2ID =   '+ IntToStr(GroupID)  ;
  AQuery.open ;
  if AQuery.Fields[0].AsInteger <> 0 then
    raise Exception.Create(DMTCCoreLink.GetTextLang(3076){'Theres still stock using this group please remove them first!'});


   AQuery.SQL.Text := 'delete from groups where wgroupid = ' + IntToStr(GroupID)  ;
   AQuery.ExecSQL ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetAddBatchByName(Aname: String): Integer;
var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
      AQuery.UpdateObject := AUpdateComp ;
      AQuery.sql.Text := ' Select * FROM battypes  where battypes.SDESCRIPTION = :Description' ;
      AUpdateComp.InsertSQL.Text :='INSERT INTO battypes '+
      '(battypes.WBATCHTYPEID, battypes.SDESCRIPTION, battypes.BCASHBOOK, battypes.WCONTRAACCOUNTID, '+
      ' battypes.BCONTRAPERLINE, battypes.BINCREMENTREFNO, battypes.BREPEATDETAILS, '+
      ' battypes.BCONSOLIDATEBALANCING, battypes.WDEBITCREDIT, battypes.WPAYMENTGROUPID, '+
      ' battypes.WDEFAULTTAXID, battypes.BVIEWEXCLUSIVE, battypes.BLINKOI, battypes.BINCLUSIVEMODE, '+
      ' battypes.DSYSDATE) VALUES   '+
      '(:WBATCHTYPEID, :SDESCRIPTION, :BCASHBOOK, :WCONTRAACCOUNTID, :BCONTRAPERLINE, '+
      ' :BINCREMENTREFNO, :BREPEATDETAILS, :BCONSOLIDATEBALANCING, :WDEBITCREDIT,     '+
      ' :WPAYMENTGROUPID, :WDEFAULTTAXID, :BVIEWEXCLUSIVE, :BLINKOI, :BINCLUSIVEMODE, '+
      ' :DSYSDATE) ' ;
      AQuery.Params[0].AsString := copy(Aname,1,DMTCCoreLink.GetFieldLength('battypes','SDescription'));
      AQuery.open ;
      if AQuery.IsEmpty then
         begin
           AQuery.Insert ;
           AQuery.FieldByName('WBATCHTYPEID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWBATCHTYPEID);
           AQuery.FieldByName('BCASHBOOK').AsInteger := 0 ;
           AQuery.FieldByName('WCONTRAACCOUNTID').AsInteger := 0 ;
           AQuery.FieldByName('SDESCRIPTION').AsString := copy(Aname,1,DMTCCoreLink.GetFieldLength('battypes','SDescription')); ;
           AQuery.FieldByName('BCONTRAPERLINE').AsInteger := 0 ;
           AQuery.FieldByName('BINCREMENTREFNO').AsInteger := 0 ;
           AQuery.FieldByName('BREPEATDETAILS').AsInteger := 0 ;
           AQuery.FieldByName('BCONSOLIDATEBALANCING').AsInteger := 0 ;
           AQuery.FieldByName('WDEBITCREDIT').AsInteger := 0 ;
           AQuery.FieldByName('WPAYMENTGROUPID').AsInteger := 0 ;
           AQuery.FieldByName('WDEFAULTTAXID').AsInteger := 0 ;
           AQuery.FieldByName('BVIEWEXCLUSIVE').AsInteger := 0 ;
           AQuery.FieldByName('BLINKOI').AsInteger := 0 ;
           AQuery.FieldByName('BINCLUSIVEMODE').AsInteger := 0 ;
           AQuery.Post ;
         end ;
     result := AQuery.FieldByName('WGROUPID').AsInteger ;
     AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
end;

class procedure TDataBaseRoutines.GetBatchesList(AList: TStrings;Alimitfilter : String);
  var
    AQuery : TuniQuery ;
begin
  AList.Clear;
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select * from battypes ' ;
  if Alimitfilter <> '' then
    AQuery.SQL.Add('where ' + Alimitfilter );

  AQuery.open ;
  while not AQuery.Eof do
  begin
    if AQuery.FieldByName('SDescription').AsString <>'' then
       begin
         AList.AddObject(AQuery.FieldByName('SDescription').AsString,TObject(AQuery.FieldByName('WBATCHTYPEID').AsInteger))
       end;
    AQuery.Next;
  end;
  finally
     AQuery.Free ;
  end;
end;

class function TDataBaseStringRoutines.LoadStringsFromFile(
  AFile: String): String;
  var
   astrstream : TStringList ;
begin
   astrstream := TStringList.Create ;
   Try
    if FileExists(AFile) then
    astrstream.LoadFromFile(AFile);
    Result :=  astrstream.Text ;
   finally
    astrstream.free ;
   end ;

end;

class function TDataBaseStringRoutines.StripHtml(AString: String): String;
var
 startpos,EndPos : Integer ;
begin
  result := StringReplace(AString,'<br>',#13+#10,[rfReplaceAll,rfIgnoreCase]);
  result := StringReplace(AString,'<br/>',#13+#10,[rfReplaceAll,rfIgnoreCase]);
  result := StringReplace(AString,'<tr>',#13+#10,[rfReplaceAll,rfIgnoreCase]);
  result := StringReplace(AString,'<td>',#9,[rfReplaceAll,rfIgnoreCase]);
  result := StringReplace(AString,'</p>',#13+#10,[rfReplaceAll,rfIgnoreCase]);

  result := StringReplace(AString,'</p>',#13+#10,[rfReplaceAll,rfIgnoreCase]);

  // result := StringReplace(AString,'<a href="',#10+#13,[rfReplaceAll,rfIgnoreCase]);

  while pos('<',Result) > 0 do
     begin
        startpos :=   pos('<',Result) ;
        EndPos :=  pos('>',Result) ;
        if EndPos < 1 then
           EndPos := length(Result);
        if  EndPos < startpos then
            delete(Result,EndPos,1);
        delete(Result,startpos,(EndPos - startpos)+1);
     end;
end;

class function TDataBaseStringRoutines.GetAsValidFilename(
  aNAme: String): String;
  const
  LongForbiddenChars  : set of Char = ['<', '>', '|', '"', '\', '/', ':', '*', '?'];
  var
   i : Integer ;
begin
 for I := 1 to Length(aNAme) do
    if not (aNAme[I] in LongForbiddenChars) then
      Result := Result +  aNAme[I] ;
end;

class function TDataBaseStringRoutines.htmlencode(value: String): String;
var
  s:string;
  i,c:integer;
  ch:char;
begin
  result:='';
  if value='' then exit;
  s:=value;
  c:=length(s);
  for i:=1 to c do begin
    ch:=s[i];
    if ch='<' then
      result:=result+'&lt;'
    else if ch='>' then
      result:=result+'&gt;'
    else if ch='''' then
      result:=result+'&apos;'
    else if ch='"' then
      result:=result+'&quot;'
    else if ord(ch)>=128 then
      result:=result+'&#'+inttostr(ord(ch))+';'
    else
      result:=result+ch;
  end;
end;

class function TDataBaseStringRoutines.htmlencode128up(
  value: String): String;
var
  s:string;
  i,c:integer;
  ch:char;
begin
  result:='';
  if value='' then exit;
  s:=value;
  c:=length(s);
  for i:=1 to c do begin
    ch:=s[i];
    if ord(ch)>=128 then
      result:=result+'&#'+inttostr(ord(ch))+';'
    else
      result:=result+ch;
  end;
end;

class function TDataBaseStringRoutines.StripRtf(ARtfString: String): String;
var
 DelCount,i : Integer ;
 AString: String ;

begin
Result := '' ;
AString := ARtfString ;
(*

{\rtf1\ansi\ansicpg1252\deff0\deflang1043{\fonttbl{\f0\fnil MS Sans Serif;}{\f1\froman\fprq2\fcharset0 Times New Roman;}}
{\colortbl ;\red255\green0\blue0;}
\viewkind4\uc1\pard\f0\fs16 Kies klant
\par regelds
\par \f1\fs24 a\cf1 aaaa\cf0 aa/par\f0\fs16
\par sgsgs
\par sgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
\par sgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssgdgdsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgsgs
\par sggsassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
\par }

        *)
   AString := StringReplace(AString,'\par ','',[rfReplaceAll]);
  i := 1 ;
  DelCount := 0 ;
  while i <= length(AString) do
     begin
        if AString[i] = '{' then
         begin
           inc(DelCount) ;
         end;
        if AString[i] = '}' then
         begin
           dec(DelCount) ;
           while  (AString[i] <> ' ') and (i < length(AString)) do
             inc(i) ;
             inc(i) ;
         end;
        if DelCount = 0 then
           begin
             if AString[i] = '\' then
                begin
                  while  (AString[i] <> ' ') and (i < length(AString)) do
                     inc(i) ;
                 inc(i) ;
                end;
               result :=  result + AString[i] ;
           end;
        inc(i) ;    
     end;
end;

{ TDatabaseRegistyRoutines }

class function TDatabaseRegistyRoutines.GetAppToOpenExtention(
  AExtention: String): String;
var
  ARegistry : TRegistry ;
  OpenWith : AnsiString ;
//  aAnsiString : AnsiString ;
  i , DotPos: Integer ;
  DotFound : boolean ;
begin
  Result:= '' ;
  DotPos := 0 ;
  ARegistry := TRegistry.create(KEY_READ);
  try
    ARegistry.RootKey := HKEY_CLASSES_ROOT ;
    if not ARegistry.OpenKey(AExtention ,False) then exit ;
    OpenWith := ARegistry.ReadString('');
    If OpenWith <> '' then
    if not ARegistry.OpenKey('\'+OpenWith+'\shell\Open\command' ,False) then exit ;
    OpenWith := ARegistry.ReadString('');
    // find out params.
    DotFound := False ;
    For i := Length(OpenWith) downto 1 do
       begin
         if OpenWith[i] = '.' then
           begin
           DotPos := i ;
           DotFound := True ;
           Break ;           
           end;
       end;
     if DotFound then
       begin
         DotFound := False ;
         for i:= DotPos to Length(OpenWith) do
            begin
              if OpenWith[i] = ' ' then
                begin
                   DotFound := true ;
                end;
              if DotFound then
                begin
                  OpenWith[i] := ' ' ;
                end;
            end;
       end;
     Result := AnsiDequotedStr(trim(OpenWith),'"');
     if Result = '' then
       Result := trim(OpenWith) else
        Result := trim(Result);
  finally
    ARegistry.Free;
  end;
end;

class procedure TDatabaseRegistyRoutines.ReadFormPos(form: TForm;
  APrefix: String;DefaultSize : TWindowState = wsNormal);
var
  ARegistry : TRegistry ;
  NewWindowState: TWindowState;
begin
  // form.Position := poDesigned ;
  ARegistry := TRegistry.create(KEY_READ);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\forms\'+APrefix+form.Name ,false) then
      begin
        if DefaultSize <> wsNormal then
           if form.WindowState <> DefaultSize then
             form.WindowState :=DefaultSize ;
        exit ;
      end;
      if ARegistry.ValueExists('Width') then
      form.Width  := ARegistry.ReadInteger('Width');
       if ARegistry.ValueExists('Height') then
      form.Height := ARegistry.ReadInteger('Height');
       if ARegistry.ValueExists('Left') then
      form.Left   := ARegistry.ReadInteger('Left');
       if ARegistry.ValueExists('Top') then
     form.Top    := ARegistry.ReadInteger('Top');
      NewWindowState :=  form.WindowState ;
      if ARegistry.ValueExists('State') then
      NewWindowState := TWindowState(ARegistry.ReadInteger('State')) ;

      if form.WindowState <> NewWindowState then
       if  NewWindowState <> wsMinimized then
        form.WindowState := NewWindowState;
      if (form.Top + 10) > screen.Height then
          form.Top := screen.Height - 10 ;
      if (form.Left + 10) > screen.Width then
          form.Left := screen.Width - 10 ;

      if (form.Top ) < 0  then
          form.Top := 0 ;
      if (form.Left + 10) < 0  then
          form.Left := 0 ;

      if (form.Width ) < 40  then
          form.Width := 40 ;
      if (form.Height < 30)  then
          form.Height := 30 ;

  finally
    ARegistry.Free;
  end;
end;
class function TDatabaseRegistyRoutines.ReadOsfIni(Asection,
  AKey,ADefault: String): String;
Var
  OSFIniFile:TIniFile;
  aFile : String ;
begin
 // if reg exists use this.
  if ReadAppRegValue('ini\'+ Asection,AKey) <> '' then
     begin
       result := ReadAppRegValue('ini\'+ Asection,AKey) ;
       exit ;
     end;

  result := aDefault ;
  aFile :=  TDMTCCoreLink.GetLocalBaseDir+ TDatabaseRegistyRoutines.GetAppValue('ININAME') ;

  if not  FileExists(aFile) then exit ;
  OSFIniFile := TIniFile.Create(aFile);
  try
  Result := OSFIniFile.ReadString(aSection,akey,aDefault);
  finally
  OSFIniFile.Free;
  end;
end;



class function TDatabaseRegistyRoutines.GetWindowsTempFile(ASug : String = 'sug'#0 ): string;
var
  Path :  Ansistring ;
  LenNeeded, Index : integer;
  Sugest,TempResult : Ansistring  ;
begin
  TempResult := '' ;
  Sugest := ASug ;
  if Sugest[Length(Sugest)] <> #0 then
     Sugest := Sugest+#0 ;

  LenNeeded := GetTempPathA(0, nil);
  SetLength(Path, LenNeeded);
  LenNeeded := GetTempPathA(LenNeeded, @Path[1]);
  if LenNeeded = 0 then
    raise Exception.Create('Temp path create failed!');
  SetLength(TempResult, MAX_PATH);
  if GetTempFileNameA(@Path[1], @Sugest[1], 0, @TempResult[1]) = 0 then
    raise Exception.Create('Temp name create failed!');
  Index := Pos(#0, TempResult);
  Result := Copy(TempResult, 1, Index - 1);
end;


class function TDatabaseRegistyRoutines.GetWindowsTempDir: string;
var
  Buffer: array[0..MAX_PATH] of AnsiChar;
begin
  GetTempPathA(SizeOf(Buffer) - 1, Buffer);
  Result := StrPas(Buffer);
  Result := IncludeTrailingPathDelimiter(Result) ;
end;

class procedure  TDatabaseRegistyRoutines.WriteOsfIni(Asection,
  AKey,AValue: String);
Var
  OSFIniFile:TIniFile;
  aFile : String ;
begin
try
  aFile :=  TDMTCCoreLink.GetLocalBaseDir+ TDatabaseRegistyRoutines.GetAppValue('ININAME') ;
  if not  FileExists(aFile) then exit ;
  OSFIniFile := TIniFile.Create(aFile);
  try
   OSFIniFile.WriteString(aSection,akey,AValue);
   OSFIniFile.UpdateFile ;

  finally
  OSFIniFile.Free;
  end;
except
end;

end;


class function TDatabaseRegistyRoutines.ReadRegValue(Group,
  Name: String): String;
var
  ARegistry : TRegistry ;
begin
  ARegistry := TRegistry.create(KEY_READ);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\etc\'+Group ,false) then exit ;
      result := ARegistry.ReadString(Name);
  finally
    ARegistry.Free;
  end;
end;


class function TDatabaseRegistyRoutines.ReadAppRegValue(Group,
  Name: String): String;
var
  ARegistry : TRegistry ;
begin
 result := '' ;
  ARegistry := TRegistry.create(KEY_READ);
  try
    if ARegistry.OpenKey('\Software\osfinancials\'+Group ,false) then 
      result := ARegistry.ReadString(Name);
  finally
    ARegistry.Free;
  end;
end;


class procedure TDatabaseRegistyRoutines.SaveGridToRegistry(AGrid : TDBGrid; APrefix : String ) ;
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

class procedure TDatabaseRegistyRoutines.LoadGridFromRegistry(AGrid : TDBGrid; APrefix : String ) ;
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

class procedure TDatabaseRegistyRoutines.WriteFormPos(form: TForm;
  APrefix: String);
var
  ARegistry : TRegistry ;
begin
  ARegistry := TRegistry.create(KEY_WRITE);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\forms\'+APrefix+form.Name ,true) then exit ;

      ARegistry.WriteInteger('State',integer(form.Windowstate));
       if form.windowstate in [wsMinimized] then
         begin
         form.windowstate := wsNormal;
         ARegistry.WriteInteger('State',integer(form.Windowstate));
         end;

      if form.windowstate in [wsMinimized,wsMaximized] then
         form.windowstate := wsNormal;

      ARegistry.WriteInteger('Left',  form.Left);
      ARegistry.WriteInteger('Top',   form.Top);
      ARegistry.WriteInteger('Width', form.Width);
      ARegistry.WriteInteger('Height',form.Height);
  finally
    ARegistry.Free;
  end;
end;

class function TDataBaseRoutines.GetBudgetForPeriod(aAccount : Integer ;AFromPeriod,AToPeriod : Integer) : Double ;
Var
 AQuery : TuniQuery ;
begin
 
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select sum(FAmount) from Totals where WAccountId = ' + IntToStr(aAccount) + ' and BActual = 0  and (WPeriodid >=:WPeriodid and WPeriodid <=:WPeriodid2)' ;

  AQuery.Params[0].AsInteger := AFromPeriod ;
  AQuery.Params[1].AsInteger := AToPeriod ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetTotalForPeriod(aAccount : Integer ;APeriod : Integer) : Double ;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select sum(FAmount) from Totals where WAccountId = ' + IntToStr(aAccount) + ' and BActual = 1  and WPeriodid =:WPeriodid' ;
  AQuery.Params[0].AsInteger := APeriod ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetBalans(aAccount : Integer ;Adate: TDateTime): Double;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;

  if (aAccount = DMTCCoreLink.DebtorsControlAccountid)  then
    AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM account JOIN transact ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 1 '+
    ' AND  cast(transact.ddate as date) <= :todate4 and (BLASTYEAR is null or BLASTYEAR = 0 or cast(transact.ddate as date) <:itodate4)'
  else if (aAccount = DMTCCoreLink.CreditorsControlAccountid) then
    AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM account JOIN transact ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 2 '+
    ' AND  cast(transact.ddate as date) <= :todate4 and (BLASTYEAR is null or BLASTYEAR = 0 or cast(transact.ddate as date) <:itodate4)'
  else if (aAccount = DMTCCoreLink.RetaindIncomeControlAccountid) then
     AQuery.SQL.Text := 'SELECT SUM( -transact.FAmount ) total FROM account  JOIN transact ON  (account.WAccountId = transact.WAccountId ) '+
     ' WHERE  cast(transact.ddate as date) <= :todate5  and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 ) ' +
     ' and (BLASTYEAR is null or BLASTYEAR = 0 or cast(transact.ddate as date) <:itodate5) and account.WAccountId <> ' + IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)
  else
  AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM transact WHERE  Waccountid =  ' +  IntToStr(aAccount) +
  ' AND  cast(transact.ddate as date) <= :todate4 and (BLASTYEAR is null or BLASTYEAR = 0 or cast(transact.ddate as date) <:itodate4)' ;

  AQuery.Params[0].asdateTime := trunc(Adate) ;
  AQuery.Params[1].asdateTime := trunc(Adate) ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetOpeningBalans(aAccount : Integer ;Adate: TDateTime): Double;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;

  if (aAccount = DMTCCoreLink.DebtorsControlAccountid)  then
    AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM account JOIN transact ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 1 '+
    ' AND  cast(transact.ddate as date) <= :todate4 '
  else if (aAccount = DMTCCoreLink.CreditorsControlAccountid) then
    AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM account JOIN transact ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 2 '+
    ' AND  cast(transact.ddate as date) <= :todate4 '
  else if (aAccount = DMTCCoreLink.RetaindIncomeControlAccountid) then
     AQuery.SQL.Text := 'SELECT SUM( -transact.FAmount ) total FROM account  JOIN transact ON  (account.WAccountId = transact.WAccountId ) '+
     ' WHERE  cast(transact.ddate as date) <= :todate5  and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 ) ' +
     '  and account.WAccountId <> ' + IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)
  else
  AQuery.SQL.Text := 'SELECT SUM( transact.FAmount ) total FROM transact WHERE  Waccountid =  ' +  IntToStr(aAccount) +
  ' AND  cast(transact.ddate as date) <= :todate4 ' ;

  AQuery.Params[0].asdateTime := trunc(Adate) ;

  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;



class function TDataBaseRoutines.GetBalansBetween(aAccount : Integer ;AFromdate,AToDate: TDateTime): Double;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
   if (aAccount = DMTCCoreLink.DebtorsControlAccountid)  then
    AQuery.SQL.Text := 'Select sum(FAmount) from transact join account on account.Waccountid = transact.Waccountid where account.WaccountTypeID = 1 ' 
  else if (aAccount = DMTCCoreLink.CreditorsControlAccountid) then
     AQuery.SQL.Text := 'Select sum(FAmount) from transact join account on account.Waccountid = transact.Waccountid where account.WaccountTypeID = 2 '
  else if (aAccount = DMTCCoreLink.RetaindIncomeControlAccountid) then
     AQuery.SQL.Text := 'Select sum(FAmount) from transact where WaccountID = ' + IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)
  else


  AQuery.SQL.Text := 'Select sum(FAmount) from transact where WAccountId = ' + IntToStr(aAccount)  ;
  AQuery.SQL.add(' and cast(ddate as date) <=:Date1 and cast(ddate as date) >=:date2');
  AQuery.Params[0].asdateTime := trunc(Atodate) ;
  AQuery.Params[1].asdateTime := trunc(AFromdate) ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrders(
  AStockItem, ExcludeDocId, MaxInvId: Integer): Double;
begin
if (DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES'] = 'TRUE') then
  begin
   result := GetUnpostedStockITemCountFromType(AStockItem,10,ExcludeDocId,MaxInvId) ;
   result := result + GetUnpostedStockITemCountFromType(AStockItem,10,ExcludeDocId,MaxInvId,0,' and DocHead.BPosted = -1') ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,12,ExcludeDocId,0) ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,15,ExcludeDocId,0,0,' and DocHead.BPosted = -1') ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,17,ExcludeDocId,0) ;
  end else
  if DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE' then
  begin
   result := GetUnpostedStockITemCountFromType(AStockItem,16,ExcludeDocId,MaxInvId) ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,17,ExcludeDocId,0) ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,15,ExcludeDocId,0,0,' and DocHead.BPosted = -1') ;
  end else
  begin
   result := GetUnpostedStockITemCountFromType(AStockItem,10,ExcludeDocId,MaxInvId) ;
   Result := Result + GetUnpostedStockITemCountFromType(AStockItem,14,ExcludeDocId,0,0,' and DocHead.BPosted = -1') ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,12,ExcludeDocId,0) ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,15,ExcludeDocId,0,0,' and DocHead.BPosted = -1') ;
   Result := Result - GetUnpostedStockITemCountFromType(AStockItem,17,ExcludeDocId,0) ;
  end;
end;


class function TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersforreorderOptions(
  AStockItem, ExcludeDocId,Option1,Option2,option3,option4,option5,MaxInvId: Integer): Double;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select sum(FQty) from DOCLINEOPTIONS,dochead,docline  where dochead.WDocId = DOCLINEOPTIONS.WDocId '+
                      ' and DOCLINEOPTIONS.WDocId = docline.wdocid and docline.Wdocid = DOCLINEOPTIONS.WDocid and docline.Wdoclineid = DOCLINEOPTIONS.Wlineid  '+
                                'and DocHead.BPosted in(0,-1) and dochead.WTypeID = 10 and docline.WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);
  if Option1 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE1ID =' + IntToStr(Option1));
  if Option2 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE2ID =' + IntToStr(Option2));
  if Option3 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE3ID =' + IntToStr(Option3));
  if Option4 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE4ID =' + IntToStr(Option4));
  if Option5 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE5ID =' + IntToStr(Option5));
  if MaxInvId <> 0 then
    AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));

  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  AQuery.SQL.Text := 'Select sum(FQty) from DOCLINEOPTIONS,dochead,docline  where dochead.WDocId = DOCLINEOPTIONS.WDocId '+
                      ' and DOCLINEOPTIONS.WDocId = docline.wdocid and docline.Wdocid = DOCLINEOPTIONS.WDocid and docline.Wdoclineid = DOCLINEOPTIONS.Wlineid   '+
                                'and DocHead.BPosted in(0,-1) and dochead.WTypeID in (12,15) and docline.WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);

  if Option1 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE1ID =' + IntToStr(Option1));
  if Option2 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE2ID =' + IntToStr(Option2));
  if Option3 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE3ID =' + IntToStr(Option3));
  if Option4 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE4ID =' + IntToStr(Option4));
  if Option5 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE5ID =' + IntToStr(Option5));

  AQuery.open ;
  Result := Result - AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersOptions(
  AStockItem, ExcludeDocId,Option1,Option2,option3,option4,option5,MaxInvId: Integer): Double;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select sum(FQty) from DOCLINEOPTIONS,dochead,docline  where dochead.WDocId = DOCLINEOPTIONS.WDocId '+
                      ' and DOCLINEOPTIONS.WDocId = docline.wdocid and docline.Wdocid = DOCLINEOPTIONS.WDocid and docline.Wdoclineid = DOCLINEOPTIONS.Wlineid  '+
                                'and DocHead.BPosted in(0,-1) and dochead.WTypeID = 10 and docline.WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);
  if Option1 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE1ID =' + IntToStr(Option1));
  if Option2 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE2ID =' + IntToStr(Option2));
  if Option3 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE3ID =' + IntToStr(Option3));
  if Option4 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE4ID =' + IntToStr(Option4));
  if Option5 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE5ID =' + IntToStr(Option5));
  if MaxInvId <> 0 then
    AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));

  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;
  AQuery.SQL.Text := 'Select sum(FQty) from DOCLINEOPTIONS,dochead,docline  where dochead.WDocId = DOCLINEOPTIONS.WDocId '+
                      ' and DOCLINEOPTIONS.WDocId = docline.wdocid and docline.Wdocid = DOCLINEOPTIONS.WDocid and docline.Wdoclineid = DOCLINEOPTIONS.Wlineid   '+
                                'and DocHead.BPosted in(0,-1) and dochead.WTypeID in (12) and docline.WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);

  if Option1 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE1ID =' + IntToStr(Option1));
  if Option2 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE2ID =' + IntToStr(Option2));
  if Option3 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE3ID =' + IntToStr(Option3));
  if Option4 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE4ID =' + IntToStr(Option4));
  if Option5 <> 0 then
     AQuery.SQL.add('and WITEMOPTIONVALUE5ID =' + IntToStr(Option5));

  AQuery.open ;
  Result := Result - AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;



class procedure TDataBaseRoutines.GetAccountCodeAndDescription(
  aAccId: Integer; var ACode, ADescription: String);
var
 AQuery : TuniQuery ;
begin
 ACode := '' ;
 ADescription := '' ;
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select WAccountTypeId,SMainAccountCode, SSubAccountCode,SDescription From v_account Account where WAccountId =' + InttoStr(aAccId);
     AQuery.open ;
     if not AQuery.IsEmpty then
     begin
     if  AQuery.fields[2].AsString <> '' then
     ACode := AccTypeToChar(AQuery.fields[0].AsInteger)+AQuery.fields[1].AsString +'-' + AQuery.fields[2].AsString
     else
     ACode := AccTypeToChar(AQuery.fields[0].AsInteger)+AQuery.fields[1].AsString ;
     ACode := Trim(ACode);

     ADescription := Trim(AQuery.fields[3].AsString) ;
     end;

   finally
     AQuery.free ;
   end;
end;

class Procedure TDataBaseRoutines.GetBatchInfo(AId: Integer;Var BCashBook:Boolean;Var WContraAccount : Integer );
  var
    AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select bcashbook,WcontraAccountId from battypes where WbatchTypeId =' + IntTostr(AId) ;
  AQuery.open ;
  BCashBook := AQuery.fields[0].AsInteger =1 ;
  WContraAccount := AQuery.fields[1].AsInteger ;
  finally
     AQuery.Free ;
  end;
end;

class function TDataBaseRoutines.GetBatchNameById(AId: Integer): String;
  var
    AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select SDescription from battypes where WbatchTypeId =' + IntTostr(AId) ;
  AQuery.open ;
  result := AQuery.fields[0].asstring ;
  finally
     AQuery.Free ;
  end;
end;

class function TDataBaseRoutines.GetTypeDescription( AType: Integer): String;
begin
  result := trim(VarToStr(OpenSqlAndGetFirtsColumnValue('select SDescription from v_TYPES TYPES  where WTypeID =' + IntToStr(AType))));
end;

class procedure TDatabaseRegistyRoutines.WriteAppRegValue(Group,
  Name,Value: String);
var
  ARegistry : TRegistry ;
begin
  ARegistry := TRegistry.create(KEY_WRITE);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\'+Group ,true) then exit ;

      ARegistry.WriteString(Name,Value);
  finally
    ARegistry.Free;
  end;
end;


class procedure TDatabaseRegistyRoutines.WriteRegValue(Group,
  Name,Value: String);
var
  ARegistry : TRegistry ;
begin
  ARegistry := TRegistry.create(KEY_WRITE);
  try
    if not ARegistry.OpenKey('\Software\osfinancials\etc\'+Group ,true) then exit ;

      ARegistry.WriteString(Name,Value);
  finally
    ARegistry.Free;
  end;
end;

class function TDatabaseRegistyRoutines.GetAppValue(
  Avalue: String): String;
 var
rSHFI: TSHFileInfoA;
  iRet: Integer;
  VerSize: Integer;
  VerBuf: PAnsiChar;
  VerBufValue: Pointer;
  VerHandle: Cardinal;
  VerBufLen: Cardinal;
  VerKey: Ansistring;
  sAppNamePath :Ansistring ;


  function GetInfo(const aKey: Ansistring): Ansistring;
  begin
    GetInfo := '';
    VerKey := Format('\StringFileInfo\%.4x%.4x\%s',
      [LoWord(Integer(VerBufValue^)),
      HiWord(Integer(VerBufValue^)), aKey]);
    if VerQueryValueA(VerBuf, PAnsiChar(VerKey), VerBufValue, VerBufLen) then
      GetInfo := StrPas(PAnsiChar(VerBufValue));
  end;

  function QueryValue(const aValue: Ansistring): Ansistring;
  begin
    QueryValue := '';
    // obtain version information about the specified file
    if GetFileVersionInfoa(PAnsiChar(sAppNamePath), VerHandle, VerSize, VerBuf) and
      // return selected version information
      VerQueryValueA(VerBuf, '\VarFileInfo\Translation', VerBufValue, VerBufLen) then
      QueryValue := GetInfo(aValue);
  end;

begin
 sAppNamePath := Application.ExeName ;



 iRet := SHGetFileInfoA(PAnsiChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI), SHGFI_EXETYPE);
  if iRet <> 0 then
  begin
    // determine whether the OS can obtain version information
    VerSize := GetFileVersionInfoSizeA(PAnsiChar(sAppNamePath), VerHandle);
    if VerSize > 0 then
    begin
      VerBuf := AllocMem(VerSize);
      try
        result := QueryValue(Avalue);
      finally
        FreeMem(VerBuf, VerSize);
      end
    end;
  end




  end;



class function TDatabaseRegistyRoutines.GetFileSize(aFile: string): integer;
var
  SearchRec: TSearchRec;
  inRetval : Integer ;
begin
  try
    inRetval := FindFirst(ExpandFileName(aFile), faAnyFile, SearchRec);
    if inRetval = 0 then
      result := SearchRec.Size
    else
      result := -1;
  finally
    SysUtils.FindClose(SearchRec);
  end;

end;

class function TDatabaseRegistyRoutines.EditWithOpenOffice(
  AHtmlIn: String): String;

var
   StarOffice : Variant;
   Document : Variant;
    StarDesktop : Variant;
    LoadParams : Variant;
    CoreReflection : Variant;
    PropertyValue : Variant;
    AStrings : TStringlist ;
    LocalFilename,EncodedLocalFilename : String ;
    PosBody,PosEndSign : Integer ;
    aId: String ;
begin

Try
aid := ClassIDToProgID(StringToGUID('{0EED7206-1661-11D7-84A3-00606744831D}')) ;
except
aid := '' ;
end;
if aid  <> '' then
begin
   result := AHtmlIn ;
   TosfDBMemo.ShowEditor(result);
   exit ;
end;

try
  Result := AHtmlIn ;


  LocalFilename := TDatabaseRegistyRoutines.GetWindowsTempDir + 'ooEdit.html';
  EncodedLocalFilename := 'file:///' +  StringReplace(LocalFilename,'\','/',[rfreplaceAll]);

  AStrings := TStringList.Create ;
  try
  AStrings.add('<HTML>');
  AStrings.add('<HEAD>');

  AStrings.add('<TITLE></TITLE>');
  AStrings.add('</HEAD>');
  AStrings.add('<BODY>');
  AStrings.add(AHtmlIn) ;
  AStrings.add('</BODY>');
  AStrings.add('</HTML>');

  StarOffice := CreateOleObject('com.sun.star.ServiceManager');
  if (not (VarIsEmpty(StarOffice) or VarIsNull(StarOffice))) then
      begin
           AStrings.SaveToFile(LocalFilename);
           StarDesktop := StarOffice.createInstance('com.sun.star.frame.Desktop');
           LoadParams := VarArrayCreate([0, -1], varVariant);
           Document := StarDesktop.LoadComponentFromURL(EncodedLocalFilename{ 'private:factory/swriter'},'_blank', 0,  LoadParams);
           if (not (VarIsEmpty(Document) or VarIsNull(Document))) then
               begin
                 if  Application.MessageBox('Press ok if you are done with the document to continue!','',MB_OK) = IDOK	 then
                    begin
                       LoadParams := VarArrayCreate([0, 0], varVariant);
                       CoreReflection := StarOffice.createInstance('com.sun.star.reflection.CoreReflection');
                       CoreReflection.forName('com.sun.star.beans.PropertyValue').createObject(PropertyValue);
                       PropertyValue.Name := 'FilterName';
                       PropertyValue.Value := 'HTML (StarWriter)';
                       LoadParams[0] := PropertyValue;
                       try
                       Document.StoreAsUrl(EncodedLocalFilename,LoadParams);
                       except

                       end;
                       Document.close(true);
                       // StarDesktop.Terminate ;
                       AStrings.LoadFromFile(LocalFilename);
                       LocalFilename := AStrings.Text ;
                       // find body
                       // Strip till >
                       // Find end body
                       PosEndSign := 0 ;
                       PosBody := Pos('<BODY',LocalFilename);
                       if PosBody > 0 then
                          begin

                           While not(LocalFilename[PosBody+PosEndSign] in ['>',#0]) do
                               inc(PosEndSign) ;

                          end;
                        Delete(LocalFilename,1,PosBody+PosEndSign+1);

                       PosBody := Pos('</BODY>',LocalFilename);
                       if PosBody > 0 then
                          begin
                            Delete(LocalFilename,PosBody,length(LocalFilename));
                          end;
                       Result :=  LocalFilename ;
                    end;
               end ;
       end;
   finally
     AStrings.free ;
   end;
   except

   end;
 Result :=  trim(Result);  
end;
class function TDatabaseRegistyRoutines.GetContentType(
  AExtention: String): String;
var
  ARegistry : TRegistry ;
  OpenWith : AnsiString ;
 


begin
  Result:= '' ;

  ARegistry := TRegistry.create(KEY_READ);
  try
    ARegistry.RootKey := HKEY_CLASSES_ROOT ;
    if not ARegistry.OpenKey(AExtention ,False) then exit ;
    OpenWith := ARegistry.ReadString('Content Type');
 
    Result := trim(OpenWith) ;
  finally
    ARegistry.Free;
  end;
end;


class procedure TDatabaseRegistyRoutines.OpenFile(AFile: String);
begin
 ShellExecute(Application.Handle,'OPEN',pchar(AFile),'','',1);
end;

{ TDatabaseTableRoutines }

class  function TDatabaseTableRoutines.BlobFieldToString(ABlobField : TBlobField):String ;
var
 astream :TStringStream ;
begin
 astream :=TStringStream.Create ;
 try
  ABlobField.SaveToStream(astream);
  Result := astream.DataString ;
 finally
   astream.Free ;
 end;

end;


class procedure TDatabaseTableRoutines.AddDatasetToParamList(
  aDataSet: TDataSet; Params: TStrings;DoQuote :Boolean = False;DisplayText : Boolean = false;ISMysql:Boolean = false   );
  var
   i : Integer ;
   AText : String ;

begin
  for i := 0 to aDataSet.FieldCount -1 do
    begin
      if DisplayText then
      begin
        if aDataSet.Fields[i].DataType = ftFloat then
          AText  := FormatFloat('0.00',aDataSet.Fields[i].AsFloat)
        else
        AText  := aDataSet.Fields[i].DisplayText ;
        AText := StringReplace(AText,#13,'',[rfReplaceAll]);
        Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ AText) ;
      end else
      begin
      if aDataSet.Fields[i].DataType = ftDate then
          Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ 'Cast(' + QuotedStr(FormatDateTime('yyyy/mm/dd',aDataSet.Fields[i].AsDateTime)) + ' as date)' )
      else
     if aDataSet.Fields[i].DataType = ftDateTime then
       begin                                                                                                       // changed datetime to timespamp
         if ISMysql then
           Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ 'Cast(' + QuotedStr(FormatDateTime('yyyy/mm/dd hh:mm:ss',aDataSet.Fields[i].AsDateTime)) + ' as datetime)' )
         else
         Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ 'Cast(' + QuotedStr(FormatDateTime('yyyy/mm/dd hh:mm:ss',aDataSet.Fields[i].AsDateTime)) + ' as timestamp)' ) ;
       end
      else
     if aDataSet.Fields[i].DataType = ftFloat then
       Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ StringReplace(FormatFloat('0.00########', aDataSet.Fields[i].AsFloat),DecimalSeparator,'.',[rfReplaceAll]))
      else
       begin
       if (aDataSet.Fields[i] is  TBlobField) then
         AText := BlobFieldToString(aDataSet.Fields[i] as  TBlobField)
         else
       AText := VartoStr(aDataSet.Fields[i].Value) ;
       // strip enter linefeed
       AText := StringReplace(AText,#13+#10,' ',[rfReplaceAll] ) ;
       // and enter again
       AText := StringReplace(AText,#13,' ',[rfReplaceAll] ) ;
       if DoQuote then
       Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ QuotedStr(AText)) 
       else
       Params.Add(UpperCase(aDataSet.Fields[i].FieldName)+'='+ AText) ;
       end;
      end;
    end;
end;

class procedure TDatabaseTableRoutines.SetTriggerStatus(Active : boolean ) ;
var
 AQuery,BQuery  : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 BQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT RDB$TRIGGER_NAME FROM RDB$TRIGGERS where RDB$RELATION_NAME not like '+ QuotedStr('RDB$%');
    BQuery.Connection := DMTCCoreLink.TheZConnection ;
    while not AQuery.Eof do
     begin
       if Active then
       BQuery.SQL.Text := 'ALTER TRIGGER ' + AQuery.fields[0].asstring + ' ACTIVE'
       else
       BQuery.SQL.Text := 'ALTER TRIGGER ' + AQuery.fields[0].asstring + ' INACTIVE' ;
       BQuery.ExecSQL ;

       AQuery.Next ;
     end;
  finally
     AQuery.free ;
     BQuery.free ;
  end;
end;

class procedure TDatabaseTableRoutines.SetIndexStatus(Active : boolean ) ;
var
 AQuery,BQuery  : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 BQuery := TuniQuery.create(nil) ;
  try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'SELECT RDB$INDEX_NAME FROM RDB$INDICES where RDB$RELATION_NAME not like '+ QuotedStr('RDB$%');
    BQuery.Connection := DMTCCoreLink.TheZConnection ;
    while not AQuery.Eof do
     begin
       if Active then
       BQuery.SQL.Text := 'ALTER INDEX ' + AQuery.fields[0].asstring + ' ACTIVE'
       else
       BQuery.SQL.Text := 'ALTER INDEX ' + AQuery.fields[0].asstring + ' INACTIVE' ;
       BQuery.ExecSQL ;

       AQuery.Next ;
     end;
  finally
     AQuery.free ;
     BQuery.free ;
  end;
end;


class function TDatabaseTableRoutines.GetCountSqlFromSql(
  ASql: String): String;
  var
   i, x : Integer ;
begin
 Result := trim(StringReplace(ASql,#13+#10,' ',[rfReplaceAll] )) ;
 i := Pos(' FROM ',UpperCase(StringReplace(ASql,#13+#10,' ',[rfReplaceAll] ))) ;
 If i > 0 then
   begin
     x := Pos('SELECT',UpperCase(ASql)) ;
     if (x > 0) and (i > x) then
       begin
         delete(Result,x+ 6,(i - x)- 6);
         insert(' count(*) Recs ',result,x+ 6);
       end;
   end;
 x := Pos('ORDER BY',UpperCase(Result)) ;
 if x > 0 then
    delete(Result,x,5000);
end;


class function TDatabaseTableRoutines.GetFirebirdsSqlForDate(
  ADate: TDateTime;ISMysql:Boolean = false ): String;
  var
   Afrm : TFormatSettings ;
begin
 Afrm.ShortDateFormat := 'yyyy/mm/dd' ;
 Afrm.DateSeparator := '/';
 Afrm.TimeSeparator := ':';
 Afrm.ShortTimeFormat := 'hh:nn:ss';
 if ADate - round(ADate) <> 0 then
  begin

     if ISMysql then
     Result := 'Cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd hh:nn:ss',ADate,Afrm)) +' as DateTime) '
     else
     Result := 'Cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd hh:nn:ss',ADate,Afrm)) +' as timestamp) ' ;

   end
 else
 Result := 'Cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd',ADate,Afrm)) +' as date) ' ;;
end;

class function TDatabaseTableRoutines.ReplaceParams(AInText,
  Params: String ; aReplaceParamsGetSqlFunction : TReplaceParamsGetSqlFunction = nil;DoQuoteQuote : boolean = true ): String;

  procedure  HandelSpecialchars(var aString: String);
var
 i : Integer ;

begin
     for i := 128 to 255 do
         begin
            aString := StringReplace(aString,char(i),'%'+ IntToHex(i,2),[rfReplaceAll] );
         end;

     aString := StringReplace(aString,'&','%26',[rfReplaceAll] );
     aString := StringReplace(aString,'+','%2B',[rfReplaceAll] );
     aString := StringReplace(aString,'?','%3F',[rfReplaceAll] );
     aString := StringReplace(aString,#13,' ',[rfReplaceAll] );
     aString := StringReplace(aString,#10,'',[rfReplaceAll] );
    // aString := StringReplace(aString,'%','%25',[rfReplaceAll] );

end;


 Var
   AParamList : TStringList ;
   aSql,aValue :String ;
   i ,IntPos  : Integer ;
   Quote : Char ;
begin
   Quote := '''';
   result := AInText ;
   AParamList := TStringList.Create ;
   try
   AParamList.Text := Params ;
   AParamList.Add('PROCESS=0');
   For i := 0 to AParamList.Count -1 do
      begin
      IntPos := pos('<@'+ AParamList.Names[i] + '@>', Result) ;
      while  IntPos > 0 do
        begin
           Delete(Result,IntPos,length('<@'+ AParamList.Names[i] + '@>')) ;
           if copy(Result,IntPos,1) = '!' then
              begin
                aValue := copy(Result,IntPos,(pos('##', Result)+2) - IntPos);
                delete(Result,IntPos,length(aValue));
                delete(aValue,1,1);
                delete(aValue,Length(aValue),1);
                delete(aValue,Length(aValue),1);
                HandelSpecialchars(aValue);
                Insert(aValue,result,IntPos);
              end else
           if copy(Result,IntPos,1) = '^' then
              begin
                aValue := copy(Result,IntPos,(pos('##', Result)+2) - IntPos);
                delete(Result,IntPos,length(aValue));
                delete(aValue,1,1);
                delete(aValue,Length(aValue),1);
                delete(aValue,Length(aValue),1);
                Insert(aValue,result,IntPos);
              end else
            if  copy(Result,IntPos,1) = '*' then
              begin
                aValue := copy(Result,IntPos,(pos('##', Result)+2) - IntPos);
                delete(Result,IntPos,length(aValue));
                delete(aValue,1,1);
                delete(aValue,Length(aValue),1);
                delete(aValue,Length(aValue),1);
                aSql := aValue ;
                aSql := ReplaceParams(aSql,Params) ;
                aValue := TDatabaseTableRoutines.OpenSqlReturnFirstColAsInStr(aSql) ;
                Insert(aValue,result,IntPos);
              end else
           if  copy(Result,IntPos,1) = '@' then
              begin
                aValue := copy(Result,IntPos,(pos('##', Result)+2) - IntPos);
                delete(Result,IntPos,length(aValue));
                delete(aValue,1,1);
                delete(aValue,Length(aValue),1);
                delete(aValue,Length(aValue),1);
                aSql := aValue ;
                aSql := ReplaceParams(aSql,Params) ;
                aValue := varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(aSql,false)) ;
                Insert(StringReplace( aValue,Quote,Quote+Quote,[rfReplaceAll]),result,IntPos);
              end else
           if  copy(Result,IntPos,1) = '&' then
              begin
                aValue := copy(Result,IntPos,(pos('##', Result)+2) - IntPos);
                delete(Result,IntPos,length(aValue));
                delete(aValue,1,1);
                delete(aValue,Length(aValue),1);
                delete(aValue,Length(aValue),1);
                aSql := aValue ;
                aSql := ReplaceParams(aSql,Params) ;
                if Assigned(aReplaceParamsGetSqlFunction) then
                aValue := varToStr(aReplaceParamsGetSqlFunction(aSql,'PARMS')) ;
                if  aSql <> '' then
                Insert(StringReplace( aValue,Quote,Quote+Quote,[rfReplaceAll]),result,IntPos) 
                else
                Insert(AParamList.ValueFromIndex[i],result,IntPos) ;
              end else
             begin
               if Pos('Cast',AParamList.ValueFromIndex[i]) = 1 then
               Insert(AParamList.ValueFromIndex[i] ,result,IntPos)
               else
               if Pos('EXISTS',UpperCase(trim(AParamList.ValueFromIndex[i]))) = 1 then
               Insert(AParamList.ValueFromIndex[i] ,result,IntPos)
               else
               if DoQuoteQuote then
               Insert(StringReplace(AParamList.ValueFromIndex[i],Quote,Quote+Quote,[rfReplaceAll]) ,result,IntPos)
               else
               Insert(AParamList.ValueFromIndex[i],result,IntPos) ;
            end;
           IntPos := pos('<@'+ AParamList.Names[i] + '@>', Result) ;
        end;
      end;
   finally
     AParamList.free ;
   end;
end;

class procedure TDatabaseTableRoutines.ResetIDGenerators;
var
 QSetOpenAmountToZero : TuniQuery ;
 NextId : String ;
 i : TTCIdType ;
begin
 QSetOpenAmountToZero := TuniQuery.create(nil) ;

 try
 for i := low (TTCIdTypeStr) to high(TTCIdTypeStr) do
   begin
     QSetOpenAmountToZero.Connection := DMTCCoreLink.TheZConnection ;
     QSetOpenAmountToZero.SQL.Text := 'select max('+TTCIdTypeStrKeyField[i] +') from ' + TTCIdTypeStrTable[i];
     QSetOpenAmountToZero.open ;
     NextId := IntToStr(QSetOpenAmountToZero.Fields[0].asinteger + 1);
   {  QSetOpenAmountToZero.Close ;
     QSetOpenAmountToZero.sql.Text := 'Update global set WNEwAccountID = ' + NextId ;
     QSetOpenAmountToZero.ExecSQL ;  }
     QSetOpenAmountToZero.Close ;
     QSetOpenAmountToZero.sql.Text := 'SET GENERATOR '+ TTCIdTypeStr[i] +' to ' + NextId ;
     QSetOpenAmountToZero.ExecSQL ;
  end;
  finally
   QSetOpenAmountToZero.free ;
 end;
end;


class function TDatabaseTableRoutines.ExportAsSqlInsert(AQuery: TuniQuery;TableName  : String;ActiveRecordOnly: Boolean;KeyKolumn:String = '';KeySql:String = '';RepColumn:String = '';RepSql:String = ''): String;
// procedure TFormMainConversion.ParceSqlFireBird(ASql, TableName, PreFix: String;AddOnly : Integer );
const maxFields = 255 ;
      AnsiSep = '' ;

var
//TableName, PreFix: String;
 i : Integer ;
 InsertSql : String ;
     function AnsiQuotedStr(AName : String ; seperator : String ) : string;
      begin
         if seperator = '' then
         result := AName else
         result :=SysUtils.AnsiQuotedStr(AName,seperator[1]) ;
      end;
begin


  result := '' ;
  if not AQuery.Active then exit ;


InsertSql := 'Insert into ' + AnsiQuotedStr(TableName,AnsiSep) + '(' ;
for i :=0 to  AQuery.FieldCount -1  do
  begin

    case  AQuery.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep) ;
    ftLargeint,ftSmallint, ftInteger, ftWord :  InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep);
    ftBoolean :  InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep) ;
    ftFloat, ftCurrency :  InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep);
    ftDate, ftTime, ftDateTime,ftTimeStamp : InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep);
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  : InsertSql := InsertSql + AnsiQuotedStr(AQuery.Fields[i].FieldName,AnsiSep) ;

    end;
    if i < AQuery.FieldCount -1 then
       InsertSql := InsertSql +','   ;
  end;
  InsertSql := InsertSql +  ') Values( ';


if not ActiveRecordOnly then
   AQuery.first ;
while not AQuery.eof do
    begin
    result := result + InsertSql + #13+#10 ;

  for i :=0 to AQuery.FieldCount -1  do
  begin
   if AQuery.Fields[i].FieldName = KeyKolumn then
      begin
         result := result + KeySql + #13 + #10
      end
   else
   if AQuery.Fields[i].FieldName = RepColumn then
      begin
         result := result + RepSql + #13 + #10
      end
   else
   begin
   if not AQuery.Fields[i].IsNull  then
    case  AQuery.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : result := result + sysutils.AnsiQuotedStr(AQuery.Fields[i].AsString,#39) + #13 + #10;
    ftLargeint,ftSmallint, ftInteger, ftWord : result := result + AQuery.Fields[i].AsString + #13 + #10;
    ftBoolean :  begin
                 if AQuery.Fields[i].AsBoolean then
                    result := result + '1' + #13 + #10 else
                    result := result + '0' + #13 + #10;
                 end;
    ftFloat, ftCurrency : result := result +  StringReplace(AQuery.Fields[i].AsString,DecimalSeparator,'.',[rfReplaceAll])+ #13 + #10;
    ftDate, ftTime, ftDateTime,ftTimeStamp : result := result +  sysutils.AnsiQuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',AQuery.Fields[i].AsDateTime),'''') + #13 + #10;
    ftAutoInc : result := result + AnsiQuotedStr(AQuery.Fields[i].AsString,'')+ #13 + #10;
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  :
       begin
        result := result + sysutils.AnsiQuotedStr(AQuery.Fields[i].AsString,'''')+ #13 + #10;
       end
    else
        result := result + sysutils.AnsiQuotedStr(AQuery.Fields[i].AsString,'''')+ #13 + #10;
    end // end case
      else
      begin
      if AQuery.Fields[i].DataType <>  ftBoolean then
      result := result + 'null'+ #13 + #10  else result := result + '0'+ #13 + #10;

      end;
     end;
    if i <  AQuery.FieldCount -1 then
       result := result + ','+ #13 + #10;   ;
  end;
  result := result +  '); '+ #13 + #10;;
    if ActiveRecordOnly then break ;
   AQuery.next ;
  end;
end;

class procedure TDatabaseTableRoutines.UpdateQuery(AQuery: TuniQuery;Table : String;PrimaryKeyColumn : array of string);
var
 i : Integer ;
 ValuesClause : String ;
 AFieldsQuery : TuniQuery ;
begin
 ValuesClause := '';
 if AQuery.UpdateObject <> nil then
 begin
 AFieldsQuery := TuniQuery.Create(nil) ;
 try
 AFieldsQuery.Connection := DMTCCoreLink.TheZConnection ;
 AFieldsQuery.SQL.Text := 'Select * from ' + Table +' where ' + PrimaryKeyColumn[0] + ' is null' ;
 AFieldsQuery.open ;
 AQuery.UpdateObject.InsertSQL.Text := ' Insert into '+Table +' ( ';
 AQuery.UpdateObject.ModifySQL.Text := ' Update '+Table +' set ' ;
 for i := 0 to AFieldsQuery.FieldCount -1 do
   begin
     AQuery.UpdateObject.ModifySQL.Add(AFieldsQuery.Fields[i].FieldName +' = :' + AFieldsQuery.Fields[i].FieldName ) ;
     AQuery.UpdateObject.InsertSQL.Add(AFieldsQuery.Fields[i].FieldName );
     ValuesClause := ValuesClause + ':' + AFieldsQuery.Fields[i].FieldName ;
     if i <> AFieldsQuery.FieldCount -1 then
       begin
        AQuery.UpdateObject.ModifySQL.Add(',');
         AQuery.UpdateObject.InsertSQL.Add(',');
        ValuesClause := ValuesClause + ',' ;
       end;

   end;
   AQuery.UpdateObject.ModifySQL.Add(' where ')  ;
   AQuery.UpdateObject.InsertSQL.Add(') values(' + ValuesClause +')') ;
   AQuery.UpdateObject.DeleteSQL.Text := 'Delete from ' + Table + ' where ' ;
   for i := low(PrimaryKeyColumn) to high(PrimaryKeyColumn) do
     begin
      AQuery.UpdateObject.DeleteSQL.Add(PrimaryKeyColumn[i] +'=:' +  PrimaryKeyColumn[i]) ;
      if i <> high(PrimaryKeyColumn) Then
         AQuery.UpdateObject.DeleteSQL.Add('AND ') ;

      AQuery.UpdateObject.ModifySQL.Add(PrimaryKeyColumn[i] +'=:' +  PrimaryKeyColumn[i]) ;
      if i <> high(PrimaryKeyColumn) Then
         AQuery.UpdateObject.ModifySQL.Add('AND ') ;

     end;
    finally
      AFieldsQuery.free ;
    end;
 end;
end;

class procedure TDatabaseTableRoutines.CheckFieldLengthsAndAddFields(
  ADataset: Tdataset; ASQL: String);
  var
   AQuery : TuniQuery ;
   i : Integer ;
   AField : TField ;
   ACaption,BCaption : String ;
 
begin
  if ADataSet.Tag = 100 then exit ;

  //if  FMessageLength = 35 then exit ;
   AQuery := TuniQuery.create(nil) ;
    try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := ASql ;
     if ASQL = '' then
       if ADataset is TuniQuery then
           AQuery.SQL.Text := (ADataset as TuniQuery).SQL.Text ;
     if (ADataSet is TuniQuery) then
        AQuery.Params.Assign((ADataSet as TuniQuery).Params);
     AQuery.open ;

   for i := ADataset.FieldCount -1 downto 0 do
     begin
       if ADataset.Fields[i].Tag = 100 then
         begin
          AField := ADataset.Fields[i] ;
          if AQuery.FindField(AField.FieldName) = nil then
            begin
             ADataset.Fields.Remove(AField);
             AField.free ;
            end; 
         end;

     end;

     for i := 0 to AQuery.FieldCount -1 do
     begin
      AField := ADataSet.FindField(AQuery.Fields[i].FieldName) ;
       if  AField <> nil then
        begin
            if AField.Size <> AQuery.Fields[i].Size then
               AField.Size := AQuery.Fields[i].Size ;
             if  pos('TRN_',ACaption) = 1 then
              begin
                BCaption := '' ;
                ACaption := copy(AQuery.Fields[i].FieldName,5,length(AQuery.Fields[i].FieldName)) ;
                if pos('_',ACaption) > 1 then
                begin
                while pos('_',ACaption) > 1 do
                  begin
                     if BCaption <> '' then
                        BCaption := BCaption + ' ' ;

                     BCaption := BCaption + DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(copy(ACaption,1,pos('_',ACaption)-1),0));
                     delete(ACaption,1,pos('_',ACaption));
                  end;
                     if BCaption <> '' then
                        BCaption := BCaption + ' ' ;
                     BCaption := BCaption + DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ACaption,0));
                 end;
                if BCaption = '' then
                   AField.DisplayLabel := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ACaption,0))
                   else AField.DisplayLabel :=  BCaption;

              end else
           if  pos('FT_',ACaption) = 1 then
              begin
                AField.DisplayLabel := copy(ACaption,4,1) +  LowerCase(copy(ACaption,5,length(ACaption))) ;
              end else
             AField.DisplayLabel := AQuery.Fields[i].FieldName;

        end else
        begin
           AField :=  TFieldClass(AQuery.Fields[i].ClassType).Create(ADataSet) ;
           AField.FieldName := AQuery.Fields[i].FieldName;
           AField.FieldKind := AQuery.Fields[i].FieldKind;
           ACaption :=   AQuery.Fields[i].FieldName ;
           if  pos('TRN_',ACaption) = 1 then
              begin
                BCaption := '' ;
                ACaption := copy(AQuery.Fields[i].FieldName,5,length(AQuery.Fields[i].FieldName)) ;
                if pos('_',ACaption) > 1 then
                begin
                while pos('_',ACaption) > 1 do
                  begin
                     if BCaption <> '' then
                        BCaption := BCaption + ' ' ;

                     BCaption := BCaption + DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(copy(ACaption,1,pos('_',ACaption)-1),0));
                     delete(ACaption,1,pos('_',ACaption));
                  end;
                     if BCaption <> '' then
                        BCaption := BCaption + ' ' ;
                     BCaption := BCaption + DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ACaption,0));
                 end;
                if BCaption = '' then
                   AField.DisplayLabel := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ACaption,0))
                   else AField.DisplayLabel :=  BCaption;

              end else
           if  pos('FT_',ACaption) = 1 then
              begin
                AField.DisplayLabel := copy(ACaption,4,1) +  LowerCase(copy(ACaption,5,length(ACaption))) ;
              end else
             AField.DisplayLabel := AQuery.Fields[i].FieldName;

       

             if ADataSet.FindComponent(ADataSet.Name + AQuery.Fields[i].FieldName) <> nil then
              AField.Name := 'DS'+ADataSet.Name + AQuery.Fields[i].FieldName
              else
              AField.Name :=  ADataSet.Name + AQuery.Fields[i].FieldName;



           AField.DataSet := ADataSet;

           AField.Size := AQuery.Fields[i].Size ;
           AField.Tag := 100 ;
           AField.ProviderFlags := [];
           if not(adataset is tunitable )then
           if ADataset.FieldDefs.IndexOf(AQuery.Fields[i].FieldName) = -1 then
           if ADataset.FindField(AQuery.Fields[i].FieldName) = nil then
           begin
           ADataset.FieldDefs.BeginUpdate ;
           try
            try
           ADataset.FieldDefs.Add(AQuery.Fields[i].FieldName,AQuery.Fields[i].DataType,AQuery.Fields[i].Size,false);
            except

            end;
           finally
             ADataset.FieldDefs.EndUpdate ;
           end;
           end;
        end;
     end;
    finally
      AQuery.free ;
    end;
   ADataSet.Tag := 100 ;
end;


class function TDatabaseTableRoutines.GetDatasetAsParamString(
  aDataSet: TDataSet;DoQuote :Boolean = false ;DisplayText : Boolean = false ): String;
  var
    Params : TStrings;
begin
  Params := TStringlist.Create ;
  try
   AddDatasetToParamList(aDataSet,Params,DoQuote,DisplayText);
   Result := Params.Text ;
  finally
    Params.free ;
  end;
end;

class function TDatabaseTableRoutines.FieldExists(ATabel,
  AField: String): Boolean;
begin
 if not (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
  begin
      result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT count(*) FROM RDB$RELATION_FIELDS a '+
  ' join RDB$FIELDS b on (a.RDB$FIELD_SOURCE = b.RDB$FIELD_NAME ) where a.RDB$FIELD_NAME = ' + QuotedStr(UpperCase(AField)) +' and a.RDB$RELATION_NAME =' + QuotedStr(UpperCase(ATabel)))),0)  = 1;
  end else
   result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count(COLUMN_NAME) a from   all_tab_columns where COLUMN_NAME  '+
  '   = ' + QuotedStr(UpperCase(AField)) +' and table_name=' + QuotedStr(UpperCase(ATabel)))),0)  = 1;
end;

class function TDatabaseTableRoutines.GetScale(ATabel,
  AField: String): Integer;
begin
   result :=  abs(StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT b.RDB$FIELD_SCALE FROM RDB$RELATION_FIELDS a '+
  ' join RDB$FIELDS b on (a.RDB$FIELD_SOURCE = b.RDB$FIELD_NAME ) where a.RDB$FIELD_NAME = ' + QuotedStr(UpperCase(AField)) +' and a.RDB$RELATION_NAME =' + QuotedStr(UpperCase(ATabel)))),0))
 ;
end;

class function TDatabaseTableRoutines.TableExists(ATabel: String): Boolean;
begin
 if not (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
  begin
   result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT count(*) FROM RDB$RELATION_FIELDS a '+
  ' join RDB$FIELDS b on (a.RDB$FIELD_SOURCE = b.RDB$FIELD_NAME ) where a.RDB$RELATION_NAME =' + QuotedStr(UpperCase(ATabel)))),0)  > 0 ;
  end else
   result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count(COLUMN_NAME) a from   all_tab_columns where table_name=' + QuotedStr(UpperCase(ATabel)))),0)  <> 0;
end;


class function TDatabaseTableRoutines.StripOrderBy(ASQL: String): String;
begin
 Result := ASQL ;
 if pos('ORDER BY',UpperCase(ASQL)) > 0 then
    begin
       Delete(result,pos('ORDER BY',UpperCase(ASQL))-1,length(ASQL));

    end;
end;

class function TDatabaseTableRoutines.ExportAsHtmlTable(
  ADataSet: TDataSet): String;
  var
   i : Integer ;
begin
 result := '<table>' ;
 ADataSet.First ;
     result := result + '<tr>' ;
     for i := 0 to ADataSet.FieldCount -1 do
        if ADataSet.Fields[i].Visible then
          result := result + '<th>' + ADataSet.fields[i].DisplayLabel + '</th>' ;
     result := result + '</tr>' ;


 while not ADataSet.Eof do
   begin
     result := result + '<tr>' ;
     for i := 0 to ADataSet.FieldCount -1 do
        if ADataSet.Fields[i].Visible then
          result := result + '<td>' + ADataSet.fields[i].DisplayText + '</td>' ;
     result := result + '</tr>' ;
     ADataSet.next ;
   end;
 result := result + '</table>' ;

end;



class procedure TDatabaseTableRoutines.DumpToReportmanTransport( ADataset: TDataset ; Clear : Boolean = true; RowType : Integer = 0;aosFProgressEvent : TosFProgressEvent = nil );
 var
  AQuery : TuniQuery ;
  i,x : Integer ;
  Stop : Boolean ;
  AsqlInsText : String ;
begin
  if not TableExists('REPORT_TRANSPORT') then
     begin
       DMTCCoreLink.ExecSql('CREATE TABLE REPORT_TRANSPORT (   ID Integer NOT NULL,  USERSESSIONID Integer,WFIELDTYPE Integer, '+
       '   FIELD1 Varchar(255),    FIELD2 Varchar(255),   FIELD3 Varchar(255),   FIELD4 Varchar(255),  FIELD5 Varchar(255), '+
       '   FIELD6 Varchar(255),  FIELD7 Varchar(255),  FIELD8 Varchar(255),  FIELD9 Varchar(255),  FIELD10 Varchar(255), '+
       '  FIELD11 Varchar(255),   FIELD12 Varchar(255),   FIELD13 Varchar(255),  FIELD14 Varchar(255),  FIELD15 Varchar(255),'+
       '  FIELD16 Varchar(255),   FIELD17 Varchar(255),  FIELD18 Varchar(255),  FIELD19 Varchar(255),  FIELD20 Varchar(255),'+
       '  FIELD21 Varchar(255),   FIELD22 Varchar(255),  FIELD23 Varchar(255),  FIELD24 Varchar(255),  FIELD25 Varchar(255),'+
       '  FIELD26 Varchar(255),   FIELD27 Varchar(255),  FIELD28 Varchar(255),  FIELD29 Varchar(255),  FIELD30 Varchar(255),'+
       '  PRIMARY KEY (ID))');
     end;
  if not GeneratorExists('gen_REPORT_TRANS_ID') then
     begin
         try
       DMTCCoreLink.ExecSql('create generator gen_REPORT_TRANS_ID') ;
       except
       end ;
     end;
  if not Assigned(ADataset) then exit ;
  x := ADataset.FieldCount ;
   if ADataset.FieldCount > 29 then
      x := 30 ;
 //     raise Exception.Create('Dataset > 30 fields in DumpToReportmanTransport');
    ADataset.First ;
    AQuery := TuniQuery.Create(nil) ;
    try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     if Clear then
     begin
     AQuery.sql.Text := 'delete from REPORT_TRANSPORT where USERSESSIONID = current_connection' ;   
     AQuery.ExecSQL ;
     end  ;
     AsqlInsText := 'insert into REPORT_TRANSPORT (ID, USERSESSIONID, WFIELDTYPE';
     for i := 0 to x -1 do
        begin
           AsqlInsText := AsqlInsText + ', FIELD'+ IntToStr(i+1);
        end;
      AsqlInsText := AsqlInsText + ')  values('+DMTCCoreLink.GetGenUniSyntaxShort('gen_REPORT_TRANS_ID')+',current_connection,%s' ;
     for i := 0 to x -1 do
        begin
           AsqlInsText := AsqlInsText + ', :f'+ IntToStr(i+1);
        end;
      AsqlInsText := AsqlInsText + ')';
     AQuery.sql.Text := Format(AsqlInsText,[ '1']) ;
       for i := 0 to  x -1 do
            begin
               AQuery.Params[i].AsString := ADataset.fields[i].FieldName ;
            end;
     AQuery.ExecSQL ;
     AQuery.sql.Text := Format(AsqlInsText,[ IntToStr(RowType)]) ;
     Stop := False ;
      while not ADataset.Eof do
         begin
          if Assigned(aosFProgressEvent) then
            aosFProgressEvent(Stop,'Data insert..',ADataset.RecordCount,ADataset.RecNo,2031);
            if Stop then Raise Exception.Create('User stop!');
           for i := 0 to x -1 do
             begin
               AQuery.Params[i].AsString := ADataset.fields[i].AsString ;
             end;
           AQuery.ExecSQL ;
           ADataset.next ;
         end;
    finally
      AQuery.free ;
    end;
end;

class function TDatabaseTableRoutines.GeneratorExists(
  Agenerator: String): Boolean;
begin
 if not (DMTCCoreLink.ExtraOptions.Values['ORACLE'] ='true') then
  begin
   result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT count(*) FROM RDB$GENERATORS  a'+
   ' where a.RDB$GENERATOR_NAME =' + QuotedStr(UpperCase(Agenerator)))),0)  > 0 ;
  end else
  begin
    result :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*) from ALL_SEQUENCES where SEQUENCE_name =' + QuotedStr(UpperCase(Agenerator)))),0)  > 0 ;
  end;
end;

class function TDatabaseTableRoutines.OpenSqlReturnAsVarOrString(
  ASQL: String): Variant;
Var
 AQuery : TuniQuery ;
 i : Integer ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := ASQL;
  AQuery.open ;
  if AQuery.FieldCount =1 then
  Result := AQuery.Fields[0].Value else
  begin
   result := '' ;
   while not AQuery.Eof do
     begin
      if Result <> '' then
      Result := Result + ' ' ;
      for i := 0 to AQuery.FieldCount -1 do
         begin
          Result := Result + ' ' ;
          result := Result + AQuery.Fields[i].AsString ;
          result := trim(Result) ;
         end;
       AQuery.Next ;
     end;
  end ;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseTableRoutines.GetFirebirdsSqlForFloat(
  AFloat: Double): String;
  var
  afrm : TFormatSettings ;
begin
 afrm.DecimalSeparator := '.';
 afrm.ThousandSeparator := ',';
 Result := FloatToStr(AFloat,afrm);
end;

class function TDatabaseTableRoutines.OpenSqlReturnFirstColAsInStr(
  ASQL: String): String;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := ASQL;
  AQuery.open ;
  result := '' ;
   while not AQuery.Eof do
     begin
      if Result <> '' then
      Result := Result + ',' ;
      result := Result + AQuery.Fields[0].AsString ;
      AQuery.Next ;
     end;
  finally
     AQuery.free ;
  end;
 if Result = '' then Result := '0' ;
end;


class function TDatabaseTableRoutines.FillStringsWithReportingGroups(AList: TcxImageComboBoxProperties;TpGroupID:integer):Boolean;
  var
   LocalList : TStringList ;
   i : Integer ;
begin

  AList.Items.Clear ;
  AList.BeginUpdate ;
 LocalList := TStringList.create ;
 try
 result := TDataBaseRoutines.FillStringsWithReportingGroups(LocalList,TpGroupID,false) ;
 for i := 0 to LocalList.Count -1 do
    with AList.Items.Add do
      begin
         Description := LocalList[i] ;
         Value := Integer(LocalList.objects[i]) ;
      end;
 finally
  LocalList.free ;
  AList.EndUpdate ;
 end;
end;

 class function TDatabaseTableRoutines.FillStringsWithSelect(AList: TcxImageComboBoxProperties;asql:string):Boolean;
  var
   LocalList : TStringList ;
   i : Integer ;
   aquery : TUniQuery ;
begin
   aquery := TUniQuery.create(nil) ;
   try
   aquery.Connection := DMTCCoreLink.TheZConnection ;
   aquery.SQL.Text := asql ;
   aquery.open ;

  AList.Items.Clear ;
  AList.BeginUpdate ;
  try
     while not aquery.Eof do
      begin
    with AList.Items.Add do
      begin
         Description := aquery.fields[1].asstring  ;
         Value := aquery.fields[0].value ;
      end;
       aquery.next ;
     end;
 finally
  AList.EndUpdate ;
 end;
 finally
   aquery.free ;
 end;
end;


class procedure TDatabaseTableRoutines.DumpToReportmanTransportOfarray(
  ADataset: Variant; Clear: Boolean; RowType: Integer;
  aosFProgressEvent: TosFProgressEvent);

var
  AQuery : TuniQuery ;
  i,x,z : Integer ;
  Stop : Boolean ;
  AsqlInsText : String ;
begin
  if not TableExists('REPORT_TRANSPORT') then
     begin
       DMTCCoreLink.ExecSql('CREATE TABLE REPORT_TRANSPORT (   ID Integer NOT NULL,  USERSESSIONID Integer,WFIELDTYPE Integer, '+
       '   FIELD1 Varchar(255),    FIELD2 Varchar(255),   FIELD3 Varchar(255),   FIELD4 Varchar(255),  FIELD5 Varchar(255), '+
       '   FIELD6 Varchar(255),  FIELD7 Varchar(255),  FIELD8 Varchar(255),  FIELD9 Varchar(255),  FIELD10 Varchar(255), '+
       '  FIELD11 Varchar(255),   FIELD12 Varchar(255),   FIELD13 Varchar(255),  FIELD14 Varchar(255),  FIELD15 Varchar(255),'+
       '  FIELD16 Varchar(255),   FIELD17 Varchar(255),  FIELD18 Varchar(255),  FIELD19 Varchar(255),  FIELD20 Varchar(255),'+
       '  FIELD21 Varchar(255),   FIELD22 Varchar(255),  FIELD23 Varchar(255),  FIELD24 Varchar(255),  FIELD25 Varchar(255),'+
       '  FIELD26 Varchar(255),   FIELD27 Varchar(255),  FIELD28 Varchar(255),  FIELD29 Varchar(255),  FIELD30 Varchar(255),'+
       '  PRIMARY KEY (ID))');
     end;

  if not GeneratorExists('gen_REPORT_TRANS_ID') then
     begin
         try
       DMTCCoreLink.ExecSql('create generator gen_REPORT_TRANS_ID') ;
       except
       end ;
     end;

  if not VarType(ADataset) = varArray then exit ;
  if VarIsEmpty(ADataset) then exit ;
  if VarType(ADataset[0]) <> varArray then
     begin
        x := 1 ;
     end else
     begin
       x := VarArrayHighBound(ADataset,0) + 1;
     end;


    AQuery := TuniQuery.Create(nil) ;
    try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     if Clear then
     begin
     AQuery.sql.Text := 'delete from REPORT_TRANSPORT where USERSESSIONID = current_connection' ;
     AQuery.ExecSQL ;
     end;
     AsqlInsText := 'insert into REPORT_TRANSPORT (ID, USERSESSIONID, WFIELDTYPE';
     for i := 0 to x -1 do
        begin
           AsqlInsText := AsqlInsText + ', FIELD'+ IntToStr(i+1);
        end;

      AsqlInsText := AsqlInsText + ')  values('+DMTCCoreLink.GetGenUniSyntaxShort('gen_REPORT_TRANS_ID')+' ,current_connection,%s' ;
     for i := 0 to x -1 do
        begin
           AsqlInsText := AsqlInsText + ', :f'+ IntToStr(i+1);
        end;
      AsqlInsText := AsqlInsText + ')';

     AQuery.sql.Text := Format(AsqlInsText,[ IntToStr(RowType)]) ;

     Stop := False ;
          if VarType(ADataset[0]) <> varArray then
             begin
                for i := VarArrayLowBound(ADataset,1) to VarArrayHighBound(ADataset,1) do
                  begin
          if Assigned(aosFProgressEvent) then
            aosFProgressEvent(Stop,'Data insert..',VarArrayHighBound(ADataset,1)+1,i,2031);
                      AQuery.Params[0].Value := ADataset[i] ;
                      AQuery.ExecSQL ;
                  end;
             end else
             begin
               x := VarArrayHighBound(ADataset[0],1) + 1;
               for z := VarArrayLowBound(ADataset,1) to VarArrayHighBound(ADataset,1) do
                 begin
                   if Assigned(aosFProgressEvent) then
                    aosFProgressEvent(Stop,'Data insert..',VarArrayHighBound(ADataset,1)+1,x,2031);
                 for i := 0 to x -1 do
                   begin
                     AQuery.Params[i].AsString := ADataset.fields[i].AsString ;
                   end;
                 AQuery.ExecSQL ;

                 end;
             end;

 
    finally
      AQuery.free ;
    end;
end;
class function TDatabaseTableRoutines.GetfirstTablename(
  ASql: String): String;
  var
   i : Integer ;

begin
 Result := UpperCase(trim(StringReplace(ASql,#13+#10,' ',[rfReplaceAll] ))) ;
 i := Pos(' FROM ',Result) ;
 If i > 0 then
   begin
       delete(Result,1,i+5);
       Result := Trim(Result);
       i := pos(' ',Result);
       Delete(Result,i,length(Result)) ;

   end else
  Result := '' ;

end;

class function TDatabaseTableRoutines.GetQueryAsParamString(Aquery: String;
  DoQuote, DisplayText: Boolean): String;
var
 Query : TuniQuery ;
begin

 Query := TuniQuery.Create(nil) ;
 try
   Query.Connection := DMTCCoreLink.TheZConnection ;
   Query.SQL.Text := Aquery;
   Query.open ;
   result := GetDatasetAsParamString(query,DoQuote,DisplayText);
 finally
  Query.free ;
 end;
end;

class function TDatabaseTableRoutines.GetUsersInDatabase(
  var Users: Integer): String;

 var
  aQuery : TuniQuery ;
begin
  Users := 0 ;
  Result := '' ;
  aQuery := TuniQuery.create(nil) ;
  try
   aQuery.Connection := DMTCCoreLink.TheZConnection ;
   aQuery.SQL.Text := 'SELECT * FROM MON$ATTACHMENTS a where a.MON$ATTACHMENT_ID <> current_connection' ;
   try
   aQuery.Open ;
   users := aQuery.RecordCount ;
   while not aQuery.Eof do
      begin
         if Result <>'' then result := result + #13+#10 ;
         result := result + 'DB user:' + aQuery.fieldByName('MON$USER').AsString +' Remote Address:' + aQuery.fieldByName('MON$REMOTE_ADDRESS').AsString+' Remote Process:' + aQuery.fieldByName('MON$REMOTE_PROCESS').AsString;
         aQuery.next ;
      end;
   except
    users := -1 ;
   end;

  finally
   aQuery.free ;
  end;
end;

{ TDataBaseLEdgerRoutines }

class function TDataBaseLedgerRoutines.CountLink(
  atransact: integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select count(WOILINKSID) from OILINKS where WLinkTransactionID <> 0 and WAmountTransactionID = ' + IntToStr(atransact) + ' or WLinkTransactionID = ' + IntToStr(atransact))),0) ;
end;

class function  TDataBaseLedgerRoutines.GetDescriptionFromTransaction(ATransactionId : Integer ) : String ;
var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.SQL.Text := 'select MEssages.SDescription from  transact join messages on (transact.WDescriptionId = Messages.WMessageId) where transact.WTransactionID =' + IntToStr(ATransactionId);
   AQuery.open ;
   result := AQuery.fields[0].AsString ;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseLedgerRoutines.GetContraOnTransactionid(
  ATrnid: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 Result := '' ;

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;

  AQuery.SQL.Text := 'select a.Waccountid  from transact a '+
  '  join transact b on a.WBATCHID = b.WBATCHID and a.WLINKEDID = b.WLINEID  and a.WTRANSACTIONID <> b.WTRANSACTIONID and b.WTRANSACTIONID = ' +  IntToStr(ATrnid) +
  ' union select a.Waccountid  from transact a  '+
  '  join transact b on a.WBATCHID = b.WBATCHID and a.WLINEID = b.WLINKEDID and a.WTRANSACTIONID <> b.WTRANSACTIONID  and b.WTRANSACTIONID = ' +  IntToStr(ATrnid)   ;
  AQuery.open ;
  While not AQuery.Eof do
     begin
       if Result <> '' then
         Result :=  Result + ',' ;
        Result := Result +   DMTCCoreLink.AccObject.getAccountFullDescription( AQuery.fieldByName('Waccountid').AsInteger) ;
       AQuery.next ;
     end;

 finally
     AQuery.free ;
  end;
end;

class function TDataBaseLedgerRoutines.GetopenItemAmountOnTransact(
  AtrnId: Integer): Double;
begin
 result := StrToFloatDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select FOUTSTANDINGAMOUNT from transact where WTransactionid  = '+ IntToStr(AtrnId))),0);

end;

class function TDataBaseLedgerRoutines.LinkCheck(
  Atransact : Integer): Integer;
var
 TempVar : Variant ;
 Amount,Linked,Linked2,Linked3 : Double ;
 AAccount : Integer ;
begin
 AAccount := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WAccountid from transact where WTransactionid  = '+ IntToStr(Atransact));
 Amount := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select FOUTSTANDINGAMOUNT - FAmount from transact where WTransactionid  = '+ IntToStr(Atransact));
 Linked := 0 ;
 Linked2 := 0 ;
 Linked3 := 0 ;
 // Amount := 0 ;
 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS  where WbatchID = -1 and WACCOUNTID = '+ IntToStr(AAccount)+ ' and WLinkTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked := TempVar ;                                                                                    //WACCOUNTID = '+ IntToStr(AAccount)+ ' and

 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS WHERE WbatchID = -1 and WACCOUNTID = '+ IntToStr(AAccount)+ ' and WAmountTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked := Linked - TempVar ;

 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS  where   WLinkTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked2 := TempVar ;                                                                                    //WACCOUNTID = '+ IntToStr(AAccount)+ ' and

 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS WHERE  WAmountTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked2 := Linked - TempVar ;


 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS  where  WbatchID <> -1 and  UNUSED1 = -2 and WLinkTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked3 := TempVar ;                                                                                    //WACCOUNTID = '+ IntToStr(AAccount)+ ' and

 TempVar := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WLinkedAmount) from OILINKS WHERE WbatchID <> -1 and  UNUSED1 = -2 and WAmountTransactionID = ' + IntToStr(atransact))  ;
 if VarToStr(TempVar) <> '' then
    Linked3 := Linked - TempVar ;



 if Linked3 <> 0 then
    result := 3
 else           
 if abs(Amount) = abs(Linked) then
    result := 0
 else
  if abs(Linked2) <> abs(Linked) then
    result := 1
  else
    result := 2 ;
end;

class function TDataBaseLEdgerRoutines.RoundTo(Number: Double;
  ADigts: int64): Double;
begin
  if ADigts<3 then ADigts:=100
  else ADigts := StrToInt(FloatToStr(Power(10,ADigts)));
  if Number>=0 then            //0.500000001
   Result := Trunc(Number*ADigts+0.500000001)/ADigts
  else
   Result := Trunc(Number*ADigts-0.500000001)/ADigts;
end;

class function TDataBaseLEdgerRoutines.RoundToLow(Number: Double;
  AMultiplier: Word): Double;
begin
  if Number>=0 then            //0.500000001
   Result := Trunc((Number*AMultiplier)+0.500000001)/AMultiplier
  else
   Result := Trunc((Number*AMultiplier)-0.500000001)/AMultiplier;
end;


class procedure TDataBaseRoutines.CheckCreateBugetsEntry(aAccount,
  APeriod: Integer);
 var
  Syear : String ;
begin
  Syear := '2' ;
  if (APeriod < 14) and (APeriod <> 0) then
    Syear := '1' ;
  if APeriod >= 0 then
  begin
  if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(APeriod) +' and BActual = 1' ) = 0 then
    ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
      + IntToStr(aAccount) +',' + IntToStr(APeriod) +',' +  Syear + ',0,0,CURRENT_TIMESTAMP)') ;

  if Syear = '1' then
    begin
      if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(0) +' and BActual = 1' ) = 0 then
        ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
          + IntToStr(aAccount) +',' + IntToStr(0) +',' +  Syear + ',0,0,CURRENT_TIMESTAMP)') ;
    end;
   end else
   begin
      if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(-1) +' and BActual = 1' ) = 0 then
        ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
          + IntToStr(aAccount) +',' + IntToStr(-1) +',' +  IntToStr(-1) + ',0,0,CURRENT_TIMESTAMP)') ;

   end;
end;


class procedure TDataBaseRoutines.CheckCreateTotalsEntry(aAccount,
  APeriod: Integer);
  var
   Syear : String;
begin
  Syear := '2' ;
  if (APeriod < 14) and (APeriod <> 0) then
     Syear := '1' ;

  if APeriod > 0 then
  begin

  if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(APeriod) +' and BActual = 1' ) = 0 then
    ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
      + IntToStr(aAccount) +',' + IntToStr(APeriod) +',' +  Syear + ',1,0,CURRENT_TIMESTAMP)') ;
  end;
  if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(0) +' and BActual = 1' ) = 0 then
    ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
      + IntToStr(aAccount) +',' + IntToStr(0) +',' +  Syear + ',1,0,CURRENT_TIMESTAMP)') ;
  if OpenSqlAndGetFirtsColumnValue('Select count(*) from totals where WAccountid =' + IntToStr(aAccount) + ' and WPeriodid = ' + IntToStr(-1) +' and BActual = 1' ) = 0 then
    ExecSql('INSERT INTO TOTALS (WACCOUNTID, WPERIODID, WYEARID, BACTUAL, FAMOUNT, DSYSDATE) VALUES ( '
      + IntToStr(aAccount) +',' + IntToStr(-1) +',' +  IntToStr(-1) + ',1,0,CURRENT_TIMESTAMP)') ;
end;

class function TDataBaseRoutines.GetAccountClassType(
  aAccId: Integer): Integer;
begin
  result := 0 ;
  if VarToStr(OpenSqlAndGetFirtsColumnValue('Select BSubAccounts from Account where WaccountId=' + IntToStr(aAccId))) = '1' then
    begin
      result := 1 ;
    end;

 if aAccId = DMTCCoreLink.DebtorsControlAccountid then
     result := 2 ;
 if aAccId = DMTCCoreLink.CreditorsControlAccountid then
     result := 3 ;
 if aAccId = DMTCCoreLink.RetaindIncomeControlAccountid then
     result := 4 ;
end;

class function TDataBaseRoutines.IsOpenAccount(aAccId: Integer): Boolean;
begin
  result :=  (StrToIntDef(VarToStr( OpenSqlAndGetFirtsColumnValue('Select BOPENITEM from Account where WaccountId=' + IntToStr(aAccId))),0) = 1);
end;

class procedure TDataBaseRoutines.SetTypeDescription(AType: Integer;
  ADescription: String);
begin
ExecSql(format('Update Types set SDescription = %s where WTypeid =%s',[QuotedStr(ADescription),IntToStr(AType)])) ;
end;

class function TDataBaseStockRoutines.getStockPrice(AAccount,
  AStockId: Integer;aQty : Double): Double;
var
 ZQStock ,
 ZQSSubSelPrice,
 ZQDebtor ,
 ZQCreditor ,
 ZQAgreement : TuniQuery ;
 GroupIds ,GroupIds2 ,Dayselect,ExtraSql: String ;
 HasPriceAgree : Boolean ;
 LastPos :  DB.TBookmark ;
 AtempTotal : Double ;
 aDayofweek : integer ;
begin
 result := 0 ;
 if DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENT'] ='' then
    DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENT'] := BoolToStr(DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false),True) ;
 if DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTGR'] ='' then
    DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTGR'] := BoolToStr(DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGINGR',false),True) ;
 if DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTSTART'] ='' then
    DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTSTART'] := BoolToStr(TDatabaseTableRoutines.FieldExists('PRICE_AGREEMENT','DDATESTART') ,True) ;
 ZQStock := TuniQuery.Create(nil) ;
 ZQDebtor := TuniQuery.Create(nil) ;
 ZQCreditor := TuniQuery.Create(nil) ;
 ZQAgreement := TuniQuery.Create(nil) ;
 ZQSSubSelPrice := TuniQuery.Create(nil) ;
 try
 ZQStock.Connection := DMTCCoreLink.TheZConnection;
 ZQDebtor.Connection := DMTCCoreLink.TheZConnection;
 ZQCreditor.Connection := DMTCCoreLink.TheZConnection;
 ZQAgreement.Connection := DMTCCoreLink.TheZConnection;
 ZQSSubSelPrice.Connection := DMTCCoreLink.TheZConnection;

   if (AStockId <> 0)  then
    begin
     ZQStock.SQL.Text := 'Select * from stock where wstockid = :wstockid' ;

     ZQDebtor.SQL.Text :='select * from debtor where waccountid = :waccountid' ;
     ZQCreditor.SQL.Text :='select * from creditor where waccountid = :waccountid' ;
     ExtraSql := '' ;
       if DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTSTART'] ='True' then
          ExtraSql := ' and (ddatestart is null or ddatestart <= CURRENT_DATE) ';

     ZQAgreement.SQL.Text :='Select * from price_agreement where WStockid =:Stockid and WAccountid =:WAccountid  ' +
                          ' and (BPERCENTAGEOFCOSTPRICE is null or BPERCENTAGEOFCOSTPRICE <> 99) ' +
                          ' and (ddate is null or ddate >= CURRENT_DATE) '+  ExtraSql +
                          ' union Select * from price_agreement where WStockid =:aStockid and WAccountid  is null ' +
                          ' and (BPERCENTAGEOFCOSTPRICE is null or BPERCENTAGEOFCOSTPRICE <> 99) ' +
                          ' and (ddate is null or ddate >= CURRENT_DATE) '+  ExtraSql +
                          ' union Select * from price_agreement where WStockid is null and WAccountid  = :aAccountid ' +
                          ' and (BPERCENTAGEOFCOSTPRICE is null or BPERCENTAGEOFCOSTPRICE <> 99) ' +
                          ' and (ddate is null or ddate >= CURRENT_DATE) ' +  ExtraSql ;



     ZQStock.close ;
     ZQStock.Params[0].AsInteger :=  AStockId ;
     ZQStock.open ;
     ZQDebtor.close ;
     ZQDebtor.Params[0].AsInteger :=  AAccount ;
     ZQDebtor.open ;
     ZQCreditor.close ;
     ZQCreditor.Params[0].AsInteger :=  AAccount ;
     ZQCreditor.open ;


     if DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENTGR'] ='True' then
      if not ZQDebtor.IsEmpty then
       if not DMTCCoreLink.AccObject.GetAccountGroup1(AAccount)  =0 then
       begin

          ZQAgreement.SQL.add('union Select * from price_agreement where WStockid is null and WAccountid  is null ' +
                          ' and (BPERCENTAGEOFCOSTPRICE is null or BPERCENTAGEOFCOSTPRICE <> 99) ' +
                          ' and (ddate is null or ddate >= CURRENT_DATE)  and WGroup2id = ' + IntToStr(DMTCCoreLink.AccObject.GetAccountGroup1(AAccount))) ;
       end;
       ZQAgreement.SQL.add('order by 1');


     try



     HasPriceAgree := DMTCCoreLink.ExtraOptions.Values['BHASPRICEAGREEMENT'] = 'True' ;
     If HasPriceAgree then
     begin
      ZQAgreement.close ;
      ZQAgreement.Params[0].AsInteger :=  AStockId ;
      ZQAgreement.Params[1].AsInteger :=  AAccount ;
      ZQAgreement.Params[2].AsInteger :=  AStockId ;
      ZQAgreement.Params[3].AsInteger :=  AAccount ;
      ZQAgreement.open ;
     end;


    if (AAccount = -2) then
    begin
       result := ZQStock.fieldByname('FUNITCOST').AsFloat ;
       exit ;
    end ;

   // what record to select
   // first agreement on stock and account
   // second agreement on account
   // third agreement on stock
    if not ZQAgreement.IsEmpty then
      begin
         while not ZQAgreement.Eof do
           begin
            if (not ZQAgreement.fieldByname('WACCOUNTID').IsNull and not ZQAgreement.fieldByname('WSTOCKID').IsNull) then
               break ;
             ZQAgreement.next ;
           end;
        if  (ZQAgreement.fieldByname('WACCOUNTID').IsNull or ZQAgreement.fieldByname('WSTOCKID').IsNull) then
         begin
         ZQAgreement.first ;
         while not ZQAgreement.Eof do
           begin
            if not (ZQAgreement.fieldByname('WACCOUNTID').IsNull ) then
               break ;
             ZQAgreement.next ;
           end;
         end;
      end;





      GroupIds2 := ',' + TDataBaseRoutines.GetIDsFromGroupID(StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WREPORTINGGROUP1ID from account where WREPORTINGGROUP1ID <> 0 and Waccountid =' + IntToStr(AAccount) )),0),0)
                           + ',' +
                           TDataBaseRoutines.GetIDsFromGroupID(StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WREPORTINGGROUP2ID from account where WREPORTINGGROUP2ID <> 0 and Waccountid =' + IntToStr(AAccount) )),0),0)+',';

   // stock only now find the group
   If HasPriceAgree then
   LastPos := ZQAgreement.Bookmark ;
    If HasPriceAgree then
      if  (ZQAgreement.fieldByname('WACCOUNTID').IsNull or ZQAgreement.fieldByname('WSTOCKID').IsNull )  then
         begin
         ZQAgreement.first ;
         while not ZQAgreement.Eof do
           begin
            if not (ZQAgreement.fieldByname('WGROUPID').IsNull ) then
             begin
              if ZQAgreement.fieldByname('WGROUPID').AsInteger <> 0 then
                begin
                   if POS(',' +IntToStr(ZQAgreement.fieldByname('WGROUPID').AsInteger) +',',GroupIds2) > 0 then
                     begin
                     ZQAgreement.FreeBookmark(LastPos);
                     LastPos := ZQAgreement.Bookmark ;
                     break ;

                     end;
                end;
             end;
             ZQAgreement.next ;
           end;

         end;
    If HasPriceAgree then
      begin
      ZQAgreement.Bookmark := LastPos ;

      end;
   GroupIds := ',' + TDataBaseRoutines.GetIDsFromGroupID(StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WREPORTINGGROUP1ID from Stock where WStockid =' + IntToStr(AStockId) )),0),0)
                           + ',' +
                            TDataBaseRoutines.GetIDsFromGroupID(StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WREPORTINGGROUP2ID from Stock where WStockid =' + IntToStr(AStockId) )),0),0) +',';




      If HasPriceAgree then
      if   (ZQAgreement.fieldByname('WSTOCKID').IsNull and (ZQAgreement.fieldByname('WACCOUNTID').IsNull or (ZQAgreement.fieldByname('WGROUPID').AsInteger <> 0) )) then
         begin
         ZQAgreement.first ;
         while not ZQAgreement.Eof do
           begin
            if not (ZQAgreement.fieldByname('WGROUPID').IsNull ) then
             begin
              if ZQAgreement.fieldByname('WGROUPID').AsInteger <> 0 then
                begin
                   if POS(',' +IntToStr(ZQAgreement.fieldByname('WGROUPID').AsInteger) +',',GroupIds) > 0 then
                    begin
                     ZQAgreement.FreeBookmark(LastPos);
                     LastPos := ZQAgreement.Bookmark ;
                     break ;
                    end;
                end;
             end;
             ZQAgreement.next ;
           end;

         end;
     If HasPriceAgree then
        ZQAgreement.Bookmark := LastPos ;

  If HasPriceAgree then
  if not ((not ZQAgreement.IsEmpty
    and(ZQAgreement.fieldByname('WGROUPID').IsNull or ( POS(',' +
    IntToSTR(ZQAgreement.fieldByname('WGROUPID').AsInteger) +',',GroupIds+ GroupIds2) > 0) )
    and not (ZQAgreement.fieldByname('WACCOUNTID').IsNull
    and ZQAgreement.fieldByname('WGROUPID').IsNull and ZQAgreement.fieldByname('WSTOCKID').IsNull)) or (ZQAgreement.RecordCount = 1) )  then
    begin
      ZQAgreement.first ;
      while not ZQAgreement.Eof do
           begin
            if not (ZQAgreement.fieldByname('WSTOCKID').IsNull ) and (ZQAgreement.fieldByname('WGROUPID').IsNull)  then
               break ;
             ZQAgreement.next ;
           end;
    end;



    if ZQStock.FieldByName('BAPPLYINVOICEDISCOUNT').AsInteger = 0 then
     if (not HasPriceAgree) or (ZQAgreement.fieldByname('WACCOUNTID').IsNull or ZQAgreement.fieldByname('WSTOCKID').IsNull) then
       begin
        if ZQCreditor.IsEmpty then
        begin
         case ZQDebtor.FieldByName('WDEFAULTPRICETYPEID').AsInteger of
         0,1 : result := ZQStock.fieldByname('FSELLINGPRICE1').AsFloat ;
         2 : result := ZQStock.fieldByname('FSELLINGPRICE2').AsFloat ;
         3 : result := ZQStock.fieldByname('FSELLINGPRICE3').AsFloat ;
         end;
        end else
        begin
          result := ZQStock.fieldByname('FUNITCOST').AsFloat ;
        end;
         exit ;
       end ;

     if (ZQAgreement.RecordCount = 1) and (not ZQAgreement.FieldByName('WGROUPID').IsNull)  and (POS(',' + IntToSTR(ZQAgreement.FieldByName('WGROUPID').AsInteger) +',',GroupIds+ GroupIds2) = 0)
     then
        begin
           if not ZQDebtor.IsEmpty then
             begin
               case ZQDebtor.FieldByName('WDEFAULTPRICETYPEID').AsInteger of
                0,1 : result := ZQStock.fieldByname('FSELLINGPRICE1').AsFloat *( 1-(result / 100));
                2 : result := ZQStock.fieldByname('FSELLINGPRICE2').AsFloat * (1-(result / 100));
                3 : result := ZQStock.fieldByname('FSELLINGPRICE3').AsFloat * (1-(result / 100));
                end;
             end else
              begin
              result := ZQStock.fieldByname('FUNITCOST').AsFloat ;
             end ;
    end else


    if (not ZQAgreement.IsEmpty
    and(ZQAgreement.fieldByname('WGROUPID').IsNull or ( POS(',' +ZQAgreement.fieldByname('WGROUPID').AsString +',',GroupIds+GroupIds2) > 0))
    and not (ZQAgreement.fieldByname('WACCOUNTID').IsNull and not ZQCreditor.IsEmpty )) or (HasPriceAgree and (ZQAgreement.RecordCount = 1))  then
     begin
     if (aQty <=  ZQAgreement.fieldByname('FUNTILQTY1').AsFloat) or ZQAgreement.fieldByname('FUNTILQTY1').IsNull  then
        begin
         result := ZQAgreement.fieldByname('FPRICE1').AsFloat ;
         end else
     if (aQty <=  ZQAgreement.fieldByname('FUNTILQTY2').AsFloat) or ZQAgreement.fieldByname('FUNTILQTY2').isNull then
        begin
         result := ZQAgreement.fieldByname('FPRICE2').AsFloat ;
         end else
     if (aQty <=  ZQAgreement.fieldByname('FUNTILQTY3').AsFloat) or ZQAgreement.fieldByname('FUNTILQTY3').isNull then
        begin
         result := ZQAgreement.fieldByname('FPRICE3').AsFloat ;
         end else
     if (aQty <=  ZQAgreement.fieldByname('FUNTILQTY4').AsFloat) or ZQAgreement.fieldByname('FUNTILQTY4').isNull then
        begin
         result := ZQAgreement.fieldByname('FPRICE4').AsFloat ;
         end else
          begin
           result := ZQAgreement.fieldByname('FPRICE5').AsFloat ;
         end;
    if ZQAgreement.fieldByname('BPERCENTAGEOFCOSTPRICE').AsInteger = 1 then
       begin
           result := ZQStock.fieldByname('FUNITAVECOST').AsFloat * (result / 100) ;
       end else
           if ZQAgreement.fieldByname('BPERCENTAGEOFCOSTPRICE').AsInteger = 3 then
       begin
           result := ZQStock.fieldByname('FUNITCOST').AsFloat * (result / 100) ;
       end else
    if ZQAgreement.fieldByname('BPERCENTAGEOFCOSTPRICE').AsInteger = 1 then
       begin
           result := ZQStock.fieldByname('FUNITCOST').AsFloat * (result / 100) ;
       end else
    if ZQAgreement.fieldByname('BPERCENTAGEOFCOSTPRICE').AsInteger = 2 then
       begin
       if not ZQDebtor.IsEmpty then
         begin


         case ZQDebtor.FieldByName('WDEFAULTPRICETYPEID').AsInteger of
         0,1 : result := ZQStock.fieldByname('FSELLINGPRICE1').AsFloat *( 1-(result / 100));
         2 : result := ZQStock.fieldByname('FSELLINGPRICE2').AsFloat * (1-(result / 100));
         3 : result := ZQStock.fieldByname('FSELLINGPRICE3').AsFloat * (1-(result / 100));
         end;
         end else
         result := ZQStock.fieldByname('FUNITCOST').AsFloat *( 1-(result / 100));
       end;
    end else
     begin
        if ZQCreditor.IsEmpty then
        begin


         case ZQDebtor.FieldByName('WDEFAULTPRICETYPEID').AsInteger of
         0,1 : result := ZQStock.fieldByname('FSELLINGPRICE1').AsFloat ;
         2 : result := ZQStock.fieldByname('FSELLINGPRICE2').AsFloat ;
         3 : result := ZQStock.fieldByname('FSELLINGPRICE3').AsFloat ;
         end;
        end else

        begin
          result := ZQStock.fieldByname('FUNITCOST').AsFloat ;
        end;
     end;

    finally
     if DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTSUPPPRICE') <>'' then
       if  not ZQCreditor.IsEmpty then
         begin
         try
          ZQSSubSelPrice.SQL.Text := TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTSUPPPRICE'),'WACCOUNTID=' + IntToStr(AAccount) + #13+#10+'WSTOCKID=' + IntToStr(AStockId))  ;
          ZQSSubSelPrice.open ;
          if not ZQSSubSelPrice.IsEmpty then
           result := ZQSSubSelPrice.fields[0].AsFloat ;
          except

          end;
         end;

     if DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTCUSTPPRICE') <>'' then
       if  not ZQDebtor.IsEmpty then
         begin
         try
           aDayofweek := DayOfWeek(date) ;
            if aDayofweek = 1 then aDayofweek := 8 ;
            case aDayofweek of
            2 :  Dayselect := 'and BMON = 1 ' ;
            3 :  Dayselect := 'and BTUE = 1 ' ;
            4 : Dayselect := 'and BWED = 1 ' ;
            5 :  Dayselect := 'and BTHU = 1 ' ;
            6 :  Dayselect := 'and BFRI = 1 ' ;
            7 :  Dayselect := 'and BSAT = 1 ' ;
            8 :  Dayselect := 'and BSUN = 1 ' ;
            end;

          ZQSSubSelPrice.SQL.Text := TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('CUST_SELECTCUSTPPRICE'),'WACCOUNTID=' + IntToStr(ZQDebtor.Params[0].AsInteger) + #13+#10+'WSTOCKID=' + IntToStr(ZQStock.Params[0].AsInteger)+#13+#10 + 'GROUPIDS='+GroupIds+#13+#10+'DAYSEL='+Dayselect)  ;
          ZQSSubSelPrice.open ;
          if not ZQSSubSelPrice.IsEmpty then
           begin

            case ZQDebtor.FieldByName('WDEFAULTPRICETYPEID').AsInteger of
            0,1 : AtempTotal := ZQStock.fieldByname('FSELLINGPRICE1').AsFloat ;
            2 : AtempTotal := ZQStock.fieldByname('FSELLINGPRICE2').AsFloat
            else  AtempTotal := ZQStock.fieldByname('FSELLINGPRICE3').AsFloat ;
            end;
            if ZQSSubSelPrice.fieldByname('WDISCOUNTTYPEID').AsInteger < 2 then
             begin
               if ZQSSubSelPrice.fieldByname('FVALUE').AsFloat <> 100 then
               result := ((100 - ZQSSubSelPrice.fieldByname('FVALUE').AsFloat) / 100 ) * AtempTotal
               end   else
              result := ZQSSubSelPrice.fieldByname('FVALUE').AsFloat ;

           end;

          except

          end;
         end;
     end;
   end;    // showmessage(Amessage);
  finally
  if ZQAgreement.BookmarkValid(LastPos) then
      ZQAgreement.FreeBookmark(LastPos);
   ZQStock.Free;
   ZQDebtor.Free;
   ZQCreditor.Free;
   ZQAgreement.Free;
   ZQSSubSelPrice.Free;
  end;
end;


class function TDataBaseLedgerRoutines.TransportAccountData(AFromAccount,
  AtoAccount: Integer): Integer;

Var
 AQuery : TuniQuery ;
begin
 Result := 0 ;
 try
 TDataBaseRoutines.CreateTotalsForAccount(AtoAccount,True);
 except
 end;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Update transact set Waccountid = ' + IntToStr(AtoAccount) + ' where  Waccountid = ' + IntToStr(AFromAccount)  ;
  AQuery.ExecSQL ;
  AQuery.SQL.Text := 'SELECT a.WPERIODID, a.WYEARID , sum(a.FAMOUNT) FAMOUNT ' +
  ' FROM TOTALS a where a.BACTUAL = 1  and WAccountid in ('+ IntToStr(AtoAccount) +','+ IntToStr(AFromAccount) +') ' +
  ' group by  a.WPERIODID, a.WYEARID   ' ;
  AQuery.open ;
  While not AQuery.Eof do
     begin
       inc(Result);

       DMTCCoreLink.ExecSql('update Totals set FAMOUNT=' +  StringReplace(FormatFloat('0.00########', AQuery.FieldByName('FAMOUNT').AsFloat),DecimalSeparator,'.',[rfReplaceAll])  +
       ' where waccountid = ' + IntToStr(AtoAccount) + ' and  WPERIODID = ' + AQuery.FieldByName('WPERIODID').AsString
       + ' and  WYEARID = ' + AQuery.FieldByName('WYEARID').AsString);
       AQuery.next ;
     end;
   DMTCCoreLink.ExecSql('update Totals set FAMOUNT=0 where waccountid = ' + IntToStr(AFromAccount)) ;
   DMTCCoreLink.ExecSql('update OILINKS set WAccountid = '+IntToStr(AToAccount)+' where waccountid = ' + IntToStr(AFromAccount)) ;
   DMTCCoreLink.ExecSql('update dochead set WAccountid = '+IntToStr(AToAccount)+' where waccountid = ' + IntToStr(AFromAccount)) ;
 finally
     AQuery.free ;
  end;
end;

class procedure TDataBaseLedgerRoutines.Unlinkline(ALineid,
  ABatchid: Integer);
begin
 TDataBaseRoutines.ExecSql('delete from OILINKSPRE where WBATCHID = '+ IntToStr(ABatchid) +
 ' and WLINEID = ' + IntToStr(ALineid));
end;

class function TDataBaseLedgerRoutines.GetBatchidFromTransactId(
  AtrnId: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select Wbatchid from transact where WTransactionid  = '+ IntToStr(AtrnId))),0);
end;

class function TDataBaseLedgerRoutines.GetBatchidFromDocId(
  ADocid: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select min(Wbatchid) from transact where Wdocid  = '+ IntToStr(ADocid))),0);
end;

class function TDataBaseLedgerRoutines.GetAbreviat(
  AAbreviat: String): String;
begin
 Result := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select SABREVIATION from  ABREVIAT where CKEY = ' + QuotedStr(AAbreviat))) ;
end;

class function TDataBaseLedgerRoutines.insertDummyZeroTrans(AAccount:Integer;Adate:TDateTime;AbatchTypeid:Integer): Integer;

var
 DummyTrans : Integer ;
begin
  DummyTrans := DMTCCoreLink.GetNewIdStr('GEN_TRANSACTIONID') ;
  result :=  DummyTrans ;
 TDataBaseRoutines.ExecSql('INSERT INTO TRANSACT  (WTRANSACTIONID, WBATCHID, WBATCHTYPEID, WLINEID, BCARRIEDFORWARD, '+
 ' BLASTYEAR, BLINKSUSED, BMULTIPLEITEMS, WACCOUNTID, DDATE, WPERIODID, ' +
 ' WYEARID, SREFERENCE, FTAXRATE, WTAXACCOUNTID, FAMOUNT, FTAXAMOUNT, ' +
 ' FOUTSTANDINGAMOUNT, BRECONCILED, WBALANCINGACCOUNTID, WDESCRIPTIONID, ' +
 ' WCURRENCYID, FFOREXAMOUNT, WUSERID, UNUSED, DSYSDATE, BUNUSED, WTAX2ID, '+
 ' FCURRENCYRATE2, FTAXRATE2, FTAX2AMOUNT, WJOBCODEID, WPROFILEID, BEXCLUSIVE, '+
 ' WLINKEDID, WREPORTINGGROUP1ID, WREPORTINGGROUP2ID, WDOCID, DPAYMENTDATE, WREMITTANCECOUNT, '+
 ' WPAYMENTTYPE) VALUES (' + IntToStr(DummyTrans) +', '+IntTOStr(InsertPostedBatch(AbatchTypeid))+', '+IntTOStr(AbatchTypeid)+', 1, 0,'+
 ' NULL, 0, 0, '+IntToStr(AAccount)+', ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(Adate) +  ', 0, 2, '+QuotedStr('ActiDumy')+', 0.00, NULL, 0.00, 0.00,'
 + '0.00, 0, NULL, 0, 0, 1.00, 0, NULL, current_timestamp, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, null, null, NULL, NULL)');
end;

class function TDataBaseLedgerRoutines.InsertPostedBatch(
  AbatchTypeid: Integer): Integer;
var
 DummyTrans : Integer ;
begin
  DummyTrans := DMTCCoreLink.GetNewIdStr('GEN_BATCHID') ;
  result :=  DummyTrans ;
  TDataBaseRoutines.ExecSql('INSERT INTO BATCON (WBATCHID, WUSERID, WBATCHTYPEID, SBATCHNUMBER, BPOSTED, BIMPORTED, BDOCSOURCE, WLINECOUNT, SFILENAME,'+
  ' WDOCID, DSYSDATE, WINITBATID, SALIAS, SUNIQUEID) VALUES '+
  '(' +IntToStr(DummyTrans)+', 0, '+IntToStr(AbatchTypeid)+',null, 1, 0, 0, NULL, NULL, 0, current_timestamp, '+IntToStr(DummyTrans)+', '+QuotedStr('d'+IntToStr(DummyTrans)) +', '+QuotedStr('d'+IntToStr(DummyTrans)) +')');
end;

{ TDatabaseDebtorCreditorRoutines }

class procedure TDatabaseDebtorCreditorRoutines.AddRef(ARef: String;
  AAccount: Integer);
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select Sreference from ACCOUNTREF where WAccountid = ' + IntToStr(AAccount) +' and Sreference =' + QuotedStr(ARef) ;
  AQuery.open ;
  if AQuery.IsEmpty then
    begin
      TDataBaseRoutines.ExecSql('INSERT INTO ACCOUNTREF (WACCOUNTREFID, SREFERENCE, WACCOUNTID)  VALUES ( '+DMTCCoreLink.GetGenUniSyntaxShort('GEN_ACCOUNTREF_ID')+','+
      QuotedStr(ARef) +','+  IntToStr(AAccount) +')');
    end;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetBankAccount(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT  SBANKACCOUNTNUMBER  from debtor where WAccountid = ' + IntToStr(AAccount) +' union select SBANKACCOUNTNUMBER from creditor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := trim(AQuery.Fields[0].AsString) ;
    end;
  finally
     AQuery.free ;
  end;
end;




class function TDatabaseDebtorCreditorRoutines.GetContactEmail(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT EMAIL FROM CONTACTS where RECORDID in (select WCONTACTID from debtor where WAccountid = ' + IntToStr(AAccount) +' union select WCONTACTID from creditor where WAccountid = ' + IntToStr(AAccount) +') ' ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := AQuery.Fields[0].AsString ;
    end;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetContactName(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
 AFormat : String ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AFormat := DMTCCoreLink.ReadLongSysparam('CONTACTFORMAT',0) ;
  if AFormat = '' then AFormat := '<@SHORTNAME@>' ;

  AQuery.SQL.Text := 'SELECT RECORDID , trim(trim(trim(COALESCE(TITLE,'+QuotedStr('') + ')) ||'+QuotedStr(' ') + ' || COALESCE(FIRSTNAME,'+QuotedStr('') + ')) || '+QuotedStr(' ') + ' || trim(COALESCE(LASTNAME,'+QuotedStr('') + '))) SHORTNAME,CONTACTS.*  FROM CONTACTS where RECORDID in (select WCONTACTID from debtor where WAccountid = ' + IntToStr(AAccount) +' union select WCONTACTID from creditor where WAccountid = ' + IntToStr(AAccount) +') ' ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := TDatabaseTableRoutines.ReplaceParams(AFormat,TDatabaseTableRoutines.GetDatasetAsParamString(AQuery)) ;
    end;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetCreditAmount(
  AAccount: Integer): Double;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select FCREDITLIMIT from DEBTOR where WAccountid = ' + IntToStr(AAccount);
  AQuery.SQL.add('Union') ;
  AQuery.SQL.add('select FCREDITLIMIT from CREDITOR where WAccountid = ' + IntToStr(AAccount)) ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;

  finally
     AQuery.free ;
  end;
end;
class function TDatabaseDebtorCreditorRoutines.GetDefaulDueDate(
  AAccount: Integer): Integer;
  var
    AString : String ;
begin
   AString := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDueDays from debtor where WAccountid = ' + IntToStr(AAccount)));
   if AString = '' then
   result := StrToIntDef(VarToStr(DMTCCoreLink.ReadSysParam('DEF_DUEDAYS',30,0)),30)
   else
   Result := StrToIntDef(AString,30) ;

end;

class function TDatabaseDebtorCreditorRoutines.GetDefaultContraOnAccount(
  AAccount: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select WDEFAULTACCOUNT from DEBTOR where WAccountid = ' + IntToStr(AAccount);
  AQuery.SQL.add('Union') ;
  AQuery.SQL.add('select WDEFAULTACCOUNT from CREDITOR where WAccountid = ' + IntToStr(AAccount)) ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  if Result = -1 then Result := 0 ;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetDefaultSalesmanOnAccount(
  AAccount: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 result := 0 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT WSALESMANID from debtor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result :=  AQuery.Fields[0].AsInteger  ;
    end;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(
  AAccount: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'select WDEFAULTTAX from DEBTOR where WAccountid = ' + IntToStr(AAccount);
  AQuery.SQL.add('Union') ;
  AQuery.SQL.add('select WDEFAULTTAX from CREDITOR where WAccountid = ' + IntToStr(AAccount)) ;
  AQuery.SQL.add('Union') ;
  AQuery.SQL.add('select WTAXACCOUNT from account where waccounttypeid not in (1,2) and WAccountid = ' + IntToStr(AAccount)) ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  if Result = -1 then Result := 0 ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseStockRoutines.getLastStockCost(AStockId: Integer): Double;
  var
   Temp : Variant ;
begin
 Temp := '' ;
 result := 0 ;
 Temp := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select FUNITCOST from stock where WStockID = '+ IntToStr(AStockId));
 if VarToStr(Temp) <> '' then
      result := Temp ;
end;

class function TDataBaseStockRoutines.getAvgStockCost(AStockId: Integer): Double;
  var
   Temp : Variant ;
begin
 Temp := '' ;
 result := 0 ;
 Temp := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select FUNITAVECOST from stock where WStockID = '+ IntToStr(AStockId));
 if VarToStr(Temp) <> '' then
      result := Temp ;
end;

class function TDataBaseStockRoutines.getDefaultStockPrice(AAccount,
  AStockId: Integer;Inclusive : Boolean = false): Double;
  var
   Temp : Double ;
   AStockrec : TStockRecPointer ;
begin

  DMTCCoreLink.stockObject.getStockOnid(AStockrec,AStockId) ;
   case StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WDEFAULTPRICETYPEID from debtor where waccountid=' + IntToStr(AAccount) )),1+DMTCCoreLink.ReadNwReportOp('STKDefaultPrice',1)) of
         0 ,
         1 : Temp := AStockrec^.FPrice1 ;
         2 : Temp := AStockrec^.FPrice2 ;
        else Temp := AStockrec^.FPrice3 ;
    end;

   If Inclusive then
     result := Temp * AStockrec^.FOutputRate

   else
      result := Temp ;
end;


class function TDatabaseDebtorCreditorRoutines.GetTransmissionType(
  AAccount: Integer): integer;
Var
 AQuery : TuniQuery ;
begin
 result := 0 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT  WTRANSMISSIONTYPE  from debtor where WAccountid = ' + IntToStr(AAccount) +' union select WTRANSMISSIONTYPE from creditor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result :=  AQuery.Fields[0].AsInteger ;
    end;
  finally
     AQuery.free ;
  end;
end;


class function TDatabaseDebtorCreditorRoutines.GetEmailAdress(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT  SEmail  from debtor where WAccountid = ' + IntToStr(AAccount) +' union select SEmail from creditor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := trim(AQuery.Fields[0].AsString) ;
    end;
  finally
     AQuery.free ;
  end;
end;


class function TDatabaseDebtorCreditorRoutines.GetNextUniqueDebtorCode: String;
Var
 AQuery : TuniQuery ;
Var TempText,TempText2 : String ;
begin
  TempText :=  'D00000000000000' ;
  SetLength(TempText,DMTCCoreLink.MainAccountLength + 3 );
  TempText2 := DMTCCoreLink.ReadSysParam('NEWDEBNR','',0) ;
   if TempText2 = '' then
    begin
     TempText :=  'D00000000000000' ;
     SetLength(TempText,DMTCCoreLink.MainAccountLength + 3 );
    end else
    TempText := TempText2 ;


    if (TempText = '') or (TDataBaseStringRoutines.IncrementString(TempText,1) = TempText) then
      begin
        TempText := 'D000000000000000' ;
        SetLength(TempText,DMTCCoreLink.MainAccountLength + 3 );
      end;

 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT SAccountcode from account where WAccountTypeid = 1 and SAccountcode = :Saccountcode' ;
  AQuery.Params[0].AsString := TempText ;
  AQuery.open ;
  while not AQuery.IsEmpty do
    begin
        TempText := TDataBaseStringRoutines.IncrementString(TempText,1) ;
        AQuery.Close ;
        AQuery.Params[0].AsString := TempText ;
        AQuery.open ;
    end;
  result := TempText ;
  DMTCCoreLink.WriteSysParam('NEWDEBNR',TDataBaseStringRoutines.IncrementString(TempText,1),0) ;
  finally
     AQuery.free ;
  end;
end;

class function TDatabaseDebtorCreditorRoutines.GetTaxRef(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT  SReference  from debtor where WAccountid = ' + IntToStr(AAccount) +' union select SReference from creditor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := trim(AQuery.Fields[0].AsString) ;
    end;
  finally
     AQuery.free ;
  end;
end;



class function TDatabaseDebtorCreditorRoutines.GetTelnr(
  AAccount: Integer): String;
Var
 AQuery : TuniQuery ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'SELECT  STELEPHONE1  from debtor where WAccountid = ' + IntToStr(AAccount) +' union select STELEPHONE1 from creditor where WAccountid = ' + IntToStr(AAccount) ;
  AQuery.open ;
  if not AQuery.IsEmpty then
    begin
      result := trim(AQuery.Fields[0].AsString) ;
    end;
  finally
     AQuery.free ;
  end;
end;

{ TDataBaseProjectRoutines }

class function TDataBaseProjectRoutines.GetProjectCode(
  AProjectId: Integer): String;
begin
  result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select SJOBPROJECTCODE from JOBPROJECT where WJOBPROJECTID = ' + IntToStr(AProjectId)));
end;

class function TDataBaseRoutines.GetContraAccountFromBatchId(
  AId: Integer): Integer;

  var
    AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WCONTRAACCOUNTID from battypes where WbatchTypeId =' + IntTostr(AId) ;
  AQuery.open ;
  result := AQuery.fields[0].AsInteger ;
  finally
     AQuery.Free ;
  end;
end;


class function TDataBaseRoutines.IsSubAccount(aAccId: Integer): Boolean;
begin
  result := VarToStr(OpenSqlAndGetFirtsColumnValue('Select BSubAccounts from Account where WaccountId=' + IntToStr(aAccId))) = '1' ;
end;



class function TDataBaseStockRoutines.GetStockQty(AStock: Integer;level :integer = 0): Double;
Var
 AQuery : TuniQuery ;
 minimum : Double ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select FQTYONHAND  from stock where WStockid = ' + IntToStr(AStock);
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat  ;
  if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
      begin
         AQuery.SQL.Text := 'Select WSTOCKTYPEID  from stock where WStockid = ' + IntToStr(AStock);
         AQuery.open ;
         if (AQuery.Fields[0].AsInteger in [1]){ or((level =0) and (AQuery.Fields[0].AsInteger in [9]))} then
           begin
             AQuery.SQL.Text := 'Select * from BOM where WSTOCKID ='+ IntToStr(AStock) ;
             AQuery.open ;
             Result := high(Integer) ;
             While not AQuery.Eof do
               begin
                  if abs(AQuery.FieldByName('FQTY').AsFloat) < 1 then
                   begin
                    minimum := GetStockQty(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,level+1) / AQuery.FieldByName('FQTY').AsFloat;
                    if Result > minimum then
                       Result := minimum ;
                   end else
                   begin
                      minimum := GetStockQty(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,level+1) / AQuery.FieldByName('FQTY').AsFloat ;
                     if Result > minimum then
                       Result := minimum ;
                   end;
                  AQuery.next ;
               end;

           end;
      end;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseStockRoutines.GetUnpostedStockItemListFromType(AStockItem,  aType, ExcludeDocId: Integer;MaxInvId : integer = 0;OrgItem:Integer =0 ): String;
Var
 AQuery : TuniQuery ;

 fSold : Double ;
begin
 result := '' ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
   if not ((DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True') and (aType in [10])) then
   begin
       AQuery.SQL.Text := 'Select sum(cast(FQtyShipped as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a,SDocno,WDoclineid from docline join dochead on dochead.WDocId = DocLine.WDocId ' +
      ' left join unit on Sunit  = cast(unit.WUNITID as varchar(12))  where '+
                                    'DocHead.BPosted in(0,-1) and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                    ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);

   end else
          AQuery.SQL.Text := 'Select sum(cast(FQTYORDERED as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a,SDocno,WDoclineid from docline join dochead on dochead.WDocId = DocLine.WDocId ' +
      ' left join unit on Sunit  = cast(unit.WUNITID as varchar(12))  where '+
                                    'DocHead.BPosted in(0,-1) and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                    ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);



  if MaxInvId <> 0 then
     AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));
 AQuery.SQL.add(' group by SDocno,WDoclineid');
  AQuery.open ;
  while not AQuery.Eof do
    begin
      if result <> '' then
         result := result + #13+#10 ;
      result := result + 'DOC ' +AQuery.fields[1].AsString + #9 +'QTY ' + AQuery.fields[0].AsString + #9 + 'LINENR ' + AQuery.fields[2].AsString + #9 + GetStockCode(AStockItem) ;
      AQuery.next ;
    end;

  // Result := AQuery.Fields[0].AsFloat ;
  if (DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True')
  and (aType in [10]) then
    begin
       AQuery.SQL.Text := 'Select coalesce(unit.FUNITQTY,1)*FQty FQty,SSOURCE from backord left join unit on backord.wunitid = unit.wunitid where  WStockID= '+ IntToStr(AStockItem);
       AQuery.open ;
         while not AQuery.Eof do
          begin
            if result <> '' then
               result := result + #13+#10 ;
            result := result + AQuery.fields[1].AsString + #9 + AQuery.fields[0].AsString + #9 + 'backord' ;
            AQuery.next ;
          end;
    end;

    if (DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE')  then
    begin
       AQuery.SQL.Text :=  'Select sum(cast(FQtyShipped as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a,SDocno,WDoclineid from DOCLINE_LINKED docline join dochead on dochead.WDocId = DocLine.WDocId ' +
       ' left join unit on Sunit  = cast(unit.WUNITID as varchar(12))   where '+

                                '  DocHead.BPosted in (0,-1) and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);


      if MaxInvId <> 0 then
         AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));
        AQuery.SQL.add('group by SDocno,WDoclineid');
      AQuery.open ;
      while not AQuery.Eof do
        begin
          if result <> '' then
             result := result + #13+#10 ;
          result := result + 'DOC ' +AQuery.fields[1].AsString + #9 +'QTY ' + AQuery.fields[0].AsString + #9 + 'LINENR ' + AQuery.fields[2].AsString + #9 + GetStockCode(AStockItem) ;
          AQuery.next ;
        end;
    end;


   if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
     begin
       // recurse alg
       AQuery.SQL.Text := 'Select WSTOCKTYPEID,FREORDERQTY from stock where WStockid ='+ IntToStr(AStockItem) ;
       AQuery.open ;                                                        //
       if (AQuery.fields[0].AsInteger in [0,1,2,3,9]) and (OrgItem in [0,1,2]) and not ((AQuery.fields[0].AsInteger = 1) and (OrgItem=0)) then
         begin
             AQuery.SQL.Text := 'Select WSTOCKID,sum(Fqty) FQTY from BOM where WLINKEDSTOCKID ='+ IntToStr(AStockItem) + ' group by WSTOCKID'  ;
             AQuery.open ;
             While not AQuery.Eof do
               begin
                  if AQuery.FieldByName('WSTOCKID').AsInteger <> OrgItem then
                    begin
                     fSold :=  (GetUnpostedStockITemCountFromType(AQuery.FieldByName('WSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,1) * AQuery.FieldByName('FQTY').AsFloat  ) ;

                      if fSold <> 0 then
                      begin
                         if result <> '' then
                        result := result + #13+#10 ;
                        result := result + 'INBOM ' + #9 + FloatToStr(AQuery.FieldByName('FQTY').AsFloat * fSold  )+
                           #9 +  GetStockCode(AQuery.FieldByName('WSTOCKID').AsInteger)+
                           #9 +  GetStockCode(AStockItem) ;
                        result := result + #13+#10 ;
                        result := result +  GetUnpostedStockItemListFromType(AQuery.FieldByName('WSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,1) ;
                        if result <> '' then
                        result := result + #13+#10 ;
                      end;
                    end;

                    AQuery.next ;
               end;

         end ;  // else
         if (AQuery.fields[0].AsInteger in [1]) and (OrgItem in [0,1,2])
          then
         begin
             AQuery.SQL.Text := 'Select * from BOM where WSTOCKID ='+ IntToStr(AStockItem) ;
             AQuery.open ;


             While not AQuery.Eof do
               begin
               fSold :=  (GetUnpostedStockITemCountFromType(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,1) * AQuery.FieldByName('FQTY').AsFloat  ) ;
                      if fSold <> 0 then
                 begin
                 result := result + #13+#10 ;
                 result := result + 'ISBOM ' + #9 + GetStockCode(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger)+
                           #9 +  GetStockCode(AQuery.FieldByName('WSTOCKID').AsInteger);
                 result := result + GetUnpostedStockItemListFromType(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,2) ;
                 end;
                  { if AQuery.FieldByName('WLINKEDSTOCKID').AsInteger <> OrgItem then
                  fSold  :=  (GetUnpostedStockITemCountFromType(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,2) / AQuery.FieldByName('FQTY').AsFloat  ) ;
                   if FMaxSold < fSold then
                      FMaxSold := fSold ;
                               if fSold <> 0 then
               begin
               if result <> '' then
                        result := result + #13+#10 ;
                        result := result + 'ISBOM SUBITEM IN SUBITEM' + #9 + FloatToStr(fSold  )+
                           #9 +  GetStockCode(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger)+
                           #9 +  GetStockCode(AQuery.FieldByName('WSTOCKID').AsInteger);
               end;   }

                    AQuery.next ;
               end;

 


         end;

     end;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(
  AStockItem, aType, ExcludeDocId: Integer;MaxInvId : integer = 0;OrgItem:Integer =0;ExtraCriteria :String ='';MaxBackordId : Integer = 0): Double;
Var
 AQuery : TuniQuery ;

 fSold,FMaxSold : Double ;
begin

 Result := 0 ;
 try
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  if not ((DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True') and (aType in [10,16])) then
  begin
      AQuery.SQL.Text := 'Select sum(cast(FQtyShipped as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a from docline join dochead on dochead.WDocId = DocLine.WDocId ' +
      ' left join unit on Sunit  = cast(unit.WUNITID as varchar(12))  where ' ;

        if (aType in [14,15] ) and (ExtraCriteria = '') then
           AQuery.SQL.add(   '  DocHead.BPosted in(0)  ')
           else
           AQuery.SQL.add(   '  DocHead.BPosted in(0,-1)  ');
        AQuery.SQL.add(ExtraCriteria+' and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                    ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId));
      if MaxInvId <> 0 then
         AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));

      AQuery.open ;
      Result := AQuery.Fields[0].AsFloat ;
  end else

  if (DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True') and (aType in [10,16])  then
    begin
     if ((not(DMTCCoreLink.ExtraOptions.Values['STOCKDOCTYPES'] = 'TRUE') or (DMTCCoreLink.ExtraOptions.Values['STOCKDOCPURTYPES'] = 'TRUE')) and (aType in [10])) then
      begin
       AQuery.SQL.Text :=  'Select sum(cast(FQTYORDERED as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a from docline join dochead on dochead.WDocId = DocLine.WDocId ' +
       ' left join unit on Sunit = cast(unit.WUNITID as varchar(12))  where '+

                                '  DocHead.BPosted in(0,-1)  '+ExtraCriteria+' and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId);
        if MaxInvId > 0 then
           AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));

        AQuery.open ;
        Result := AQuery.Fields[0].AsFloat ;
       AQuery.SQL.Text := 'Select sum(cast(FQty as numeric(12,7)) * coalesce(unit.FUNITQTY,1))    from backord left join   unit on backord.WUNITID  =   unit.WUNITID  where  WStockID= '+ IntToStr(AStockItem);
         if MaxBackordId > 0 then
           AQuery.SQL.add('and  backord.WBACKORDERID <= '  +  IntToStr(MaxBackordId));

       AQuery.open ;
       Result := Result + AQuery.Fields[0].AsFloat ;
      end;
    end;

  if (DMTCCoreLink.ExtraOptions.Values['USETYPE10'] ='TRUE')  then
    begin
       AQuery.SQL.Text :=  'Select sum(cast(FQtyShipped as numeric(12,7)) * coalesce(unit.FUNITQTY,1)) a from  DOCLINE_LINKED docline join dochead on dochead.WDocId = DocLine.WDocId ' +
       ' left join unit on Sunit  = cast(unit.WUNITID as varchar(12)) where ' ;

        if (aType in [14,15]) then
           AQuery.SQL.add(   '  DocHead.BPosted in(0)  ')
           else
           AQuery.SQL.add(   '  DocHead.BPosted in(0,-1)  ');

        AQuery.SQL.add(ExtraCriteria+' and (dochead.WTypeID = '+IntToStr(aType)+') and (WLineTypeID in (90,94)) and WStockID= '+ IntToStr(AStockItem)+
                                ' and dochead.WDocID <> '+ IntToStr(ExcludeDocId));
        if MaxInvId > 0 then
           AQuery.SQL.add('and dochead.WDocID <= '  +  IntToStr(MaxInvId));

        AQuery.open ;
        Result := Result + AQuery.Fields[0].AsFloat ;
    end;




   if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
     begin
       // recurse alg
       AQuery.SQL.Text := 'Select WSTOCKTYPEID,FREORDERQTY from stock where WStockid ='+ IntToStr(AStockItem) ;
       AQuery.open ;
       if (AQuery.fields[0].AsInteger in [0,1,2,3,9]) and (OrgItem in [0,1]) and not ((AQuery.fields[0].AsInteger = 1) and (OrgItem=0)) then
         begin
             AQuery.SQL.Text := 'Select * from BOM where WLINKEDSTOCKID ='+ IntToStr(AStockItem) ;
             AQuery.open ;
             While not AQuery.Eof do
               begin

                  if AQuery.FieldByName('WSTOCKID').AsInteger <> OrgItem then
                      begin
                        Result := Result + (GetUnpostedStockITemCountFromType(AQuery.FieldByName('WSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,1,ExtraCriteria) * AQuery.FieldByName('FQTY').AsFloat ) ;
                        AQuery.next ;
                      end;

               end;
         end ; // else
         if (AQuery.fields[0].AsInteger in [1]) and (OrgItem in [0,1,2])  then
         begin
             AQuery.SQL.Text := 'Select * from BOM where WSTOCKID ='+ IntToStr(AStockItem) ;
             AQuery.open ;
             FMaxSold := 0 ;
             fSold  := 0 ;
             if not (aType in [10,11,14]) then
               FMaxSold := 9999999 ;

             While not AQuery.Eof do
               begin
                   if AQuery.FieldByName('WLINKEDSTOCKID').AsInteger <> OrgItem then
                  fSold  :=  (GetUnpostedStockITemCountFromType(AQuery.FieldByName('WLINKEDSTOCKID').AsInteger,aType,ExcludeDocId,MaxInvId,2,ExtraCriteria) / AQuery.FieldByName('FQTY').AsFloat  ) ;
                  if (aType in [10,11,14]) then
                    begin
                     if FMaxSold < fSold then
                          FMaxSold := fSold ;
                    end else
                    begin
                     if FMaxSold > fSold then
                          FMaxSold := fSold ;
                    end;

                    AQuery.next ;
               end;
            if FMaxSold <> 9999999 then
            Result := Result + FMaxSold ;
         end;

     end;
  finally
     AQuery.free ;
  end;
  except
   // no handel
  end;
end;

class function TDataBaseRoutines.GetBalansDebCredOnPeriod(aAccount,
  Aperiod: Integer; aDebit: Boolean): Double;
Var
 AQuery : TuniQuery ;
 aType : Integer ;
begin
 aType := 0 ;


 if aAccount = DMTCCoreLink.DebtorsControlAccountid then
     aType := 1 ;
 if aAccount = DMTCCoreLink.CreditorsControlAccountid then
     aType := 2 ;
 if aAccount = DMTCCoreLink.RetaindIncomeControlAccountid then
     aType := 3 ;

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  case aType of
      0  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact where WAccountId = ' + IntToStr(aAccount) ;
      1  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on )' ;
      2  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact where WAccountId in (Select Waccountid from account where account.WAccountid = Transact.WAccountid and WAccountTypeID = 2)' ;
      3  : AQuery.SQL.Text :=  'Select sum(-FAmount) from transact join account on account.WAccountId = Transact.WAccountId where transact.WAccountId <> ' + IntToStr(aAccount) ;
  end;



  if Aperiod = 0 then
  AQuery.SQL.Text := AQuery.SQL.Text + ' and WPERIODID < 14' 
  else
  if Aperiod < 0 then
  AQuery.SQL.Text := AQuery.SQL.Text + ' and WPERIODID < 0'
  else
  begin
  AQuery.SQL.Text := AQuery.SQL.Text + ' and WPERIODID =:period' ;
  AQuery.Params[0].asinteger := Aperiod ;
  end;
  if aDebit then
    AQuery.SQL.add('and famount >0')
    else
    AQuery.SQL.add('and famount <0') ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsFloat ;

  if aType = 3 then
     begin
       // add opening bal
       if Aperiod = 0 then
         begin
          AQuery.SQL.Text := 'Select Famount From totals where BActual  = 1 and WPeriodid = 0 and WAccountid =  ' + IntToStr(aAccount)   ;
          if aDebit then
            AQuery.SQL.add('and famount >0')
            else
            AQuery.SQL.add('and famount <0') ;
          AQuery.open ;
          Result := AQuery.Fields[0].AsFloat ;
         end
         else
       if Aperiod = -1 then
         begin
          AQuery.SQL.Text := 'Select Famount From totals where BActual  = 1 and WPeriodid = -1 and WAccountid =  ' + IntToStr(aAccount)   ;
          if aDebit then
            AQuery.SQL.add('and famount >0')
            else
            AQuery.SQL.add('and famount <0') ;
          AQuery.open ;
          Result := AQuery.Fields[0].AsFloat ;
          end;



     end;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetBudgetDebCredOnDate(aAccount : Integer; aDebit: Boolean;AFromDate,AToDate:TDateTime;IclOpeningbal : Boolean;CostGroup1,CostGroup2:Integer ): Double;
Var
 AQuery : TuniQuery ;
 aType : Integer ;
begin
 aType := 0 ;
 Result := 0 ;

 if aAccount = DMTCCoreLink.DebtorsControlAccountid then
     aType := 1 ;
 if aAccount = DMTCCoreLink.CreditorsControlAccountid then
     aType := 2 ;
 if aAccount = DMTCCoreLink.RetaindIncomeControlAccountid then
     aType := 3 ;

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  if IclOpeningbal then
    begin
          case aType of
              0  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact join account on account.WAccountId = Transact.WAccountId where (account.BIncomeExpense = 0 or account.BIncomeExpense is null) and transact.WAccountId = ' + IntToStr(aAccount) ;
              1 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact join account on account.WAccountId = Transact.WAccountId where account.WAccountTypeID = 1' ;
              2 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact join account on account.WAccountId = Transact.WAccountId where account.WAccountTypeID = 2' ;
              3  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact join account on account.WAccountId = Transact.WAccountId where  (transact.WAccountId = ' + IntToStr(aAccount) + ' or account.BIncomeExpense = 1)' ;

          end;
    AQuery.SQL.add(' and cast(ddate as date) < ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(AFromDate));

  if CostGroup1 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup1id = ' +  IntToStr(CostGroup1));
  if CostGroup2 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup2id = ' +  IntToStr(CostGroup2));



    if aDebit then
      AQuery.SQL.add('and famount >0')
    else
      AQuery.SQL.add('and famount <0') ;

        AQuery.open ;
        Result := AQuery.Fields[0].AsFloat ;
        if AToDate = 0 then exit ;
    end ;

  case aType of
              0  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact  where WAccountId = ' + IntToStr(aAccount) +' and (Blastyear = 0 or Blastyear is null)' ;
              1 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact  join account on account.WAccountId = Transact.WAccountId and account.WAccountTypeID = 1 where (Blastyear = 0 or Blastyear is null)' ;
              2 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact  join account on account.WAccountId = Transact.WAccountId and account.WAccountTypeID = 2 where (Blastyear = 0 or Blastyear is null)' ;
              3  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact_budget transact  where transact.WAccountId = ' + IntToStr(aAccount) +' and (Blastyear = 0 or Blastyear is null)'  ;
  end;

   AQuery.SQL.add(' and cast(ddate as date) between ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(AFromDate) +' and ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(AToDate) );
   if aDebit then
   AQuery.SQL.add('and famount >0')
     else
   AQuery.SQL.add('and famount <0') ;

  if CostGroup1 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup1id = ' +  IntToStr(CostGroup1));
  if CostGroup2 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup2id = ' +  IntToStr(CostGroup2));


   
   AQuery.open ;
   Result := Result + AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseRoutines.GetBalansDebCredOnDate(aAccount : Integer; aDebit: Boolean;AFromDate,AToDate:TDateTime;IclOpeningbal : Boolean;CostGroup1,CostGroup2:Integer ): Double;
Var
 AQuery : TuniQuery ;
 aType : Integer ;
begin
 aType := 0 ;
 Result := 0 ;

 if aAccount = DMTCCoreLink.DebtorsControlAccountid then
     aType := 1 ;
 if aAccount = DMTCCoreLink.CreditorsControlAccountid then
     aType := 2 ;
 if aAccount = DMTCCoreLink.RetaindIncomeControlAccountid then
     aType := 3 ;

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  if IclOpeningbal then
    begin
          case aType of
              0  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on account.WAccountId = Transact.WAccountId where (account.BIncomeExpense = 0 or account.BIncomeExpense is null) and transact.WAccountId = ' + IntToStr(aAccount) ;
              1 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on account.WAccountId = Transact.WAccountId where account.WAccountTypeID = 1' ;
              2 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on account.WAccountId = Transact.WAccountId where account.WAccountTypeID = 2' ;
              3  : AQuery.SQL.Text :=  'Select SUM( case when account.WAccountId = '+IntToStr(aAccount)+' then transact.FAmount else -transact.FAmount end   ) total '+
              '  from transact join account on account.WAccountId = Transact.WAccountId where  (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 ) ' ;

          end;
    AQuery.SQL.add(' and  ddate   < ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(AFromDate));

  if CostGroup1 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup1id = ' +  IntToStr(CostGroup1));
  if CostGroup2 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup2id = ' +  IntToStr(CostGroup2));



    if aDebit then
      AQuery.SQL.add('and famount >0')
    else
      AQuery.SQL.add('and famount <0') ;

        AQuery.open ;
        Result := AQuery.Fields[0].AsFloat ;
        if AToDate = 0 then exit ;
    end ;

  case aType of
              0  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact where WAccountId = ' + IntToStr(aAccount) ;
              1 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on account.WAccountId = Transact.WAccountId and account.WAccountTypeID = 1 where (Blastyear = 0 or Blastyear is null)' ;
              2 : AQuery.SQL.Text :=  'Select sum(FAmount) from transact join account on account.WAccountId = Transact.WAccountId and account.WAccountTypeID = 2 where (Blastyear = 0 or Blastyear is null)' ;
              3  : AQuery.SQL.Text :=  'Select sum(FAmount) from transact where transact.WAccountId = ' + IntToStr(aAccount) +' and (Blastyear = 0 or Blastyear is null)'  ;
  end;

   AQuery.SQL.add(' and  ddate   between ' +
   TDatabaseTableRoutines.GetFirebirdsSqlForDate(AFromDate) +' and dateadd( -1 millisecond to cast( ' +
   TDatabaseTableRoutines.GetFirebirdsSqlForDate(AToDate) + ' +1 as timestamp))');
   if aDebit then
   AQuery.SQL.add('and famount >0')
     else
   AQuery.SQL.add('and famount <0') ;

  if CostGroup1 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup1id = ' +  IntToStr(CostGroup1));
  if CostGroup2 <> 0 then
    AQuery.SQL.add('  and transact.WReportingGroup2id = ' +  IntToStr(CostGroup2));


   
   AQuery.open ;
   Result := Result + AQuery.Fields[0].AsFloat ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseProjectRoutines.GetProjectDescription(
  AProjectId: Integer): String;
begin
  result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDESCRIPTION from JOBPROJECT where WJOBPROJECTID = ' + IntToStr(AProjectId)));
end;

class function TDataBaseStockRoutines.GetOptionNameFromItemValueID(aOptionItemValueID: Integer): String ;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select b.SDESCRIPTION from ITEMOPTIONSVALUES a join ITEMOPTIONS b on (a.WITEMOPTIONID = b.WITEMOPTIONID) where a.WITEMOPTIONVALUEID = '+ IntToStr(aOptionItemValueID);
  AQuery.open ;
  Result := AQuery.Fields[0].AsString ;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseStockRoutines.GetOptionItemValueName(
  aOptionItemValueID: Integer): String;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select SDESCRIPTION from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = '+ IntToStr(aOptionItemValueID);
  AQuery.open ;
  Result := AQuery.Fields[0].AsString ;
  finally
     AQuery.free ;
  end;
end;
class function TDataBaseStockRoutines.GetAddOptionItemValueID(AoptionName,
  AValuename: String; ExtOptionId : String = '';ExtValueId : String = '';Price : Double = 0 ): integer;
  var
   Id : Integer ;
   PriceString : String ;
begin

  Result := 0 ;
  PriceString := StringReplace(FloatToStr(Price),DecimalSeparator,'.',[rfReplaceAll]);
  if AoptionName ='' then exit ;
  if AValuename ='' then exit ;
  if ExtOptionId <> '' then
  begin
  id := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONID from ITEMOPTIONS where upper(SEXTERNALID) = ' + QuotedStr((UpperCase(ExtOptionId))))),0);
  if id =0 then
   id := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONID from ITEMOPTIONS where upper(SDESCRIPTION) = ' + QuotedStr((UpperCase(AoptionName))))),0);

  if Id = 0 then
     begin
       DMTCCoreLink.ExecSql('Insert into ITEMOPTIONS values('+DMTCCoreLink.GetGenUniSyntaxShort('GEN_ITEMOPTIONID')+' ,'+QuotedStr(AoptionName)+','+QuotedStr(ExtOptionId)+')');
       id := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONID from ITEMOPTIONS where upper(SEXTERNALID) = ' + QuotedStr((UpperCase(ExtOptionId))))),0);
     end;
  end else
  begin
  id := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONID from ITEMOPTIONS where upper(sdescription) = ' + QuotedStr((UpperCase(AoptionName))))),0);
  if Id = 0 then
     begin
       DMTCCoreLink.ExecSql('Insert into ITEMOPTIONS values('+DMTCCoreLink.GetGenUniSyntaxShort('GEN_ITEMOPTIONID')+','+QuotedStr(AoptionName)+',null)');
        id := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONID from ITEMOPTIONS where upper(sdescription) = ' + QuotedStr((UpperCase(AoptionName))))),0);
     end;
  end;
  if Id = 0 then exit ;

  if ExtValueId <> '' then
    begin
      result := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONVALUEID from ITEMOPTIONSVALUES where WITEMOPTIONID = '+IntToStr(id)+' and upper(SEXTERNALID) = ' + QuotedStr((UpperCase(ExtValueId))))),0);
      if result = 0 then
         result := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONVALUEID from ITEMOPTIONSVALUES where WITEMOPTIONID = '+IntToStr(id)+' and upper(SDESCRIPTION) = ' + QuotedStr((UpperCase(AValuename))))),0);


      if result = 0 then
         begin
              DMTCCoreLink.ExecSql('Insert into ITEMOPTIONSVALUES values('+DMTCCoreLink.GetGenUniSyntaxShort('GEN_ITEMOPTIONVALUEID')+'  ,'+IntToStr(id)+','+QuotedStr(AValuename)+','+PriceString+','+QuotedStr(ExtValueId)+')');
              result := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONVALUEID from ITEMOPTIONSVALUES where WITEMOPTIONID = '+IntToStr(id)+' and upper(SEXTERNALID) = ' + QuotedStr((UpperCase(ExtValueId))))),0);
         end;
    end else
    begin
      result := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONVALUEID from ITEMOPTIONSVALUES where WITEMOPTIONID = '+IntToStr(id)+' and upper(sdescription) = ' + QuotedStr((UpperCase(AValuename))))),0);
      if result = 0 then
         begin
              DMTCCoreLink.ExecSql('Insert into ITEMOPTIONSVALUES values('+DMTCCoreLink.GetGenUniSyntaxShort('GEN_ITEMOPTIONVALUEID')+','+IntToStr(id)+','+QuotedStr(AValuename)+','+PriceString+',null)');
              result := StrToIntDef(varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WITEMOPTIONVALUEID from ITEMOPTIONSVALUES where WITEMOPTIONID = '+IntToStr(id)+' and upper(sdescription) = ' + QuotedStr((UpperCase(AValuename))))),0);
         end;
     end
end;

class function TDataBaseStockRoutines.GetOptionIdFromItemValueID(
  aOptionItemValueID: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select b.WITEMOPTIONID from ITEMOPTIONSVALUES a join ITEMOPTIONS b on (a.WITEMOPTIONID = b.WITEMOPTIONID) where a.WITEMOPTIONVALUEID = '+ IntToStr(aOptionItemValueID);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;


class function TDataBaseStockRoutines.FindStockOnSupCode(
  Abarcode: String): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WStockId  from stock where SSTOCKCODESUP1 = ';
  if DMTCCoreLink.SQLList.GetFormatedSQLByName('LOOKUPSUPCODE') <> '' then
    AQuery.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('LOOKUPSUPCODE') ;

  AQuery.SQL.Text :=  AQuery.SQL.Text  + QuotedStr(uppercase(Abarcode));
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger  ;
  finally
     AQuery.free ;
  end;
end;



class function TDataBaseStockRoutines.FindStockOnBarCode(
  Abarcode: String): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WStockId  from stock where SBarCodeNumber = ' + QuotedStr(uppercase(Abarcode));
  AQuery.open ;
  if AQuery.IsEmpty then
     begin
       AQuery.SQL.Text := 'Select WStockId  from STOCKOPTIONS where SBarCode = ' + QuotedStr(uppercase(Abarcode));
       AQuery.open ;
     end;

  Result := AQuery.Fields[0].AsInteger  ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetBatchIdFromPRocessId(
  AId: Integer): Integer;
  var
    AQuery : TuniQuery ;
begin
  AQuery := TuniQuery.Create(nil) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WBATCHTYPEID from batcon where WbatchId =' + IntTostr(AId) ;
  AQuery.open ;
  result := AQuery.fields[0].AsInteger ;
  finally
     AQuery.Free ;
  end;
end;

class function TDataBaseRoutines.GetPeriodCount: Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select count(*) from periods where WPERIODID > 13 ' ;
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;
class procedure TDataBaseRoutines.GetGroupColors(AGroupID: Integer;
  var ATextColor, ABackColor: Integer);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
   Try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.SQL.Text := 'Select WColor,WTextColor from groups where WGroupid = ' + IntToStr(AGroupID) ;
    AQuery.Open ;
    ABackColor := AQuery.Fields[0].AsInteger ;
    ATextColor := AQuery.Fields[1].AsInteger ;
    AQuery.Close ;
   except
   end;
 finally
  AQuery.free ;
 end;
end;

class function TDataBaseStockRoutines.FindStockOnSerial(
  ASerial: String): Integer;
Var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WStockId  from DOC_LOCBATSER where SDESCRIPTION = ' +  QuotedStr(ASerial);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger  ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseProjectRoutines.GetProjectId(
  AProjectCode: String): Integer;
begin
  result := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WJOBPROJECTID from JOBPROJECT where SJOBPROJECTCODE = ' + QuotedStr(AProjectCode))),0);


end;

class procedure TDataBaseStockRoutines.TransportStockData(FromStockid,
  ToStockid: Integer);
begin
 TDataBaseRoutines.ExecSql('Update stocktrn set WStockid = ' + IntToStr(ToStockid)+'  where wStockid = ' + IntToStr(FromStockid)) ;
 TDataBaseRoutines.ExecSql('Update backord set WStockid = ' + IntToStr(ToStockid)+'  where wStockid = ' + IntToStr(FromStockid)) ;
 TDataBaseRoutines.ExecSql('Update docline set WStockid = ' + IntToStr(ToStockid)+'  where wStockid = ' + IntToStr(FromStockid)) ;

end;

class function TDataBaseStockRoutines.GetStockType(
  AStockid: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 result := -1 ;
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WStockTypeid from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  if not AQuery.IsEmpty then
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetGroupTypeFromGroupID(
  AGroupID: Integer): Integer;
begin
 result := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WGroupTypeID from groups where WGroupID = ' + IntToStr(AGroupID))),0);

end;

class function TDataBaseRoutines.loadAccountItem(  var aAccountRec: TAccountRec ): Boolean;
Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;

   AQuery.SQL.Text :=  'Select * from v_account account where WAccountid=:Waccountid'  ;
   AQuery.ParamByName('Waccountid').AsInteger := aAccountRec.WAccountID ;
   AQuery.open ;
 //  if not AQuery.IsEmpty then
   begin
   aAccountRec.WAccountID := AQuery.FieldByName('WAccountID').AsInteger;
   aAccountRec.SDescription := AQuery.FieldByName('SDescription').AsString;
   aAccountRec.WAccountTypeID := AQuery.FieldByName('WAccountTypeID').AsInteger;
   aAccountRec.BIncExp :=AQuery.FieldByName('BINCOMEEXPENSE').AsInteger = 1;
   aAccountRec.SACCOUNTCODE :=AQuery.FieldByName('SACCOUNTCODE').AsString;
   aAccountRec.BEnabled :=AQuery.FieldByName('BINACTIVE').AsInteger = 0;
   aAccountRec.group1 :=AQuery.FieldByName('WREPORTINGGROUP1ID').AsInteger ;
   aAccountRec.TAXACCOUNT :=AQuery.FieldByName('WTAXACCOUNT').AsInteger ;

   aAccountRec.FRate := 0 ;
   aAccountRec.FRate2 := 0 ;
   aAccountRec.SHOWTYPE := 0 ;
   if aAccountRec.WAccountTypeID = 4 then
     begin
      aAccountRec.FRate := TDataBaseRoutines.GetUnchachedTaxRateOnId(aAccountRec.WAccountID,true) ;
      aAccountRec.FRate2 := TDataBaseRoutines.GetUnchachedTaxRateOnId(aAccountRec.WAccountID,False) ;
      aAccountRec.SHOWTYPE := TDataBaseRoutines.GetTaxShowType(aAccountRec.WAccountID);
     end;

      if aAccountRec.FRate < 1 then
         aAccountRec.FRate:= 1 ;
      if aAccountRec.FRate2 < 1 then
         aAccountRec.FRate2:= 1 ;

    result := not AQuery.IsEmpty  ;
   end;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetPeriodActive(
  Aperiod: Integer): Boolean;
  var
   Aresult : String ;
begin
  if Aperiod < 14 then
     Result :=  VarToStr(OpenSqlAndGetFirtsColumnValue('Select BPostToLastYear from  SysVars')) = '1'
     else
     begin
     Aresult := VarToStr(OpenSqlAndGetFirtsColumnValue('Select BShutdown from  periods where Wperiodid = ' + IntToStr(Aperiod))) ;
     if Aresult <> '' then
     Result := Aresult = '0'
     else
     result := GetPeriodActive(Aperiod-1);
     end;


end;

class function TDataBaseStockRoutines.getImage(AStockId: Integer): String;
var
 AFile : String ;
begin
   result :='' ;
    if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.jpg' ) then
          begin
          result :=DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.jpg' ;


          end else
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.bmp' ) then
          begin
          result :=DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.bmp';


          end else
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.gif' ) then
          begin
          result :=DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.gif';


          end else
       if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.png' ) then
          begin
            result :=DMTCCoreLink.GetLocalSaveDir + 'images\STK_' + IntToStr(AStockId)+'.png';
          end  else
          begin
                 result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select spath from multimedia where STYPE =' +  QuotedStr ('STOCK') + ' and SGROUP = ' +QuotedStr('products_image')
                 + ' and wrefid = ' + IntToStr(AStockId))) ;
           if result <> '' then
               begin
                 AFile := result ;
                 if pos('file:',AFile) = 1 then
                   AFile := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir+'files') + copy(AFile,6,length(AFile));
                 if pos('link:',AFile) = 1  then
                   AFile := copy(AFile,6,length(AFile));
                 if FileExists(AFile )  then
                    result := afile else
                    result := '' ;
               end;
          end;
end;

class function TDataBaseStockRoutines.GetInputTaxIdDef(AStockId,
  AAccountid: Integer): Integer;
Var
 AQuery : TuniQuery ;
begin
 result := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(AAccountid);
 if Result = 0 then
 begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select WInputTaxID from stock where WStockId = ' + IntToStr(AStockId);
  AQuery.open ;
  Result := AQuery.Fields[0].AsInteger ;
  finally
     AQuery.free ;
  end;
 end;
end;

class function TDataBaseStockRoutines.GetUnitQty(aUnitID: Integer): Double;
begin
  result := StrToFloatDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select FUNITQTY from UNIT where WUNITID =' + IntToStr(aUnitID))),1);
  if result = 0 then result := 1 ;
end;

class function TDataBaseRoutines.ExecSqlWithDelim(ASql: String ): Integer;
var
 AQuery : TuniQuery ;
 SqlToExecute : String ;
begin
 // -1 is error
 Result := -1 ;
 SqlToExecute := ASql ;
 AQuery := TuniQuery.Create(nil) ;
 
   Try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;

     if pos('@@GO@@',SqlToExecute) = 0 then
      SqlToExecute := SqlToExecute + '@@GO@@' ;

    while pos('@@GO@@',SqlToExecute) > 1 do
      begin
       AQuery.SQL.Text:= trim(copy(SqlToExecute,1,pos('@@GO@@',SqlToExecute)-1));
       Delete(SqlToExecute,1,pos('@@GO@@',SqlToExecute)+ 5);
       //if Assigned(AFromparams) then
       //   AQuery.Params.Assign(AFromparams);
       AQuery.ExecSQL ;
       Result := Result + AQuery.RowsAffected ;
      end;

 finally
  AQuery.free ;
 end;
end;



class function TDataBaseStockRoutines.GetCurrentStockOptionsCount(
  AStockItem, Option1, Option2, option3, option4,
  option5: Integer): Double;
Var
 AQuery : TuniQuery ;
 AlocateStr : String ;
 aVararray : variant ;
begin
 AQuery := TuniQuery.create(nil) ;
 try
  AQuery.connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := 'Select * from stockoptions where WStockid = '+ IntToStr(AStockItem) ;
  AQuery.open ;
  result := 0 ;
  if  Option2 = 0 then
    begin
       AlocateStr :='WITEMOPTIONVALUE1ID';
       aVararray := VarArrayOf([Option1]);
    end else
 if  Option3 = 0 then
    begin
       AlocateStr :='WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID';
       aVararray := VarArrayOf([Option1,Option2]);
    end else
 if  Option4 = 0 then
    begin
       AlocateStr :='WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID';
       aVararray := VarArrayOf([Option1,Option2,Option3]);
    end else
 if  Option5 = 0 then
    begin
       AlocateStr :='WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID';
       aVararray := VarArrayOf([Option1,Option2,Option3,Option4]);
    end else
    begin
       AlocateStr :='WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID';
       aVararray := VarArrayOf([Option1,Option2,Option3,Option4,Option5]);
    end ;
  if   AQuery.Locate(AlocateStr,
        aVararray,[]) then
         begin
           result :=  AQuery.fieldByName('FQTYONHAND').AsFloat ;
         end;
  finally
     AQuery.free ;
  end;
end;

class function TDataBaseRoutines.GetAddGroupDescription(AGroupid: Integer;
  Alanguage, Adesc: String): Integer;
  var
   LangID : Integer ;
   AQuery : TuniQuery ;
   AUpdatecom : TUniUpdateSql ;
begin
   LangID := GetAddGroupNesteled(Alanguage,1004);
   AQuery := TuniQuery.create(nil) ;
   AUpdatecom := TUniUpdateSql.create(nil) ;
   try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    AQuery.UpdateObject := AUpdatecom ;
    TDatabaseTableRoutines.UpdateQuery(AQuery,'GROUPS_DESCRIPTIONS',['WGROUPDESCID']);
    AQuery.SQL.Text := 'select * from GROUPS_DESCRIPTIONS where Wgroupid = ' + IntToStr(AGroupid) + ' and WLANGUAGEID = ' + IntToStr(LangID) ;
    AQuery.open ;
    if AQuery.IsEmpty then
         begin
         AQuery.Insert ;
         AQuery.fieldByname('WGROUPDESCID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_GROUPSDESC_ID') ;
         AQuery.fieldByname('Wgroupid').AsInteger :=  AGroupid ;
         AQuery.fieldByname('WLANGUAGEID').AsInteger := LangID ;
         end else
         AQuery.Edit ;
         AQuery.FieldByName('SDESCRIPTION').AsString := Adesc ;
         AQuery.post ;
         Result := AQuery.fieldByname('WGROUPDESCID').AsInteger ;
   finally
     AQuery.free ;
     AUpdatecom.free ;
   end;
end;

class function TDataBaseRoutines.GetTaxShowType(
  TaxAccId: Integer): Integer;
var
  aQuery : TuniQuery ;
begin
  Result:=0 ;
  If TaxAccId = 0 then exit ;
  aQuery := TuniQuery.Create(Nil);
  try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    aQuery.SQL.Text := 'select SHOWTYPE from TAX join account on (TAX.WaccountId = Account.WaccountId) where Account.WaccountId  ='  + IntToStr(TaxAccId) ;
    aQuery.Open ;
    Result := aQuery.FieldByName('SHOWTYPE').AsInteger ;
  finally
     aQuery.free ;
  end;
end;
class procedure TDataBaseStockRoutines.createStockTrans(Astockid: Integer;  AOpeningQty, ANewQty: Double; AtransString: String;transdate:TDateTime);


var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  ADocid : Integer ;
  KnownTotal : Variant ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM dochead where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := 0 ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCHEAD',['WDOCID']);
   AQuery.Insert ;
   AQuery.FieldByName('WDOCID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_DOCID') ;
   ADocid :=AQuery.FieldByName('WDOCID').AsInteger ;
   AQuery.FieldByName('WACCOUNTID').AsInteger := 0 ;
   AQuery.FieldByName('WTYPEID').AsInteger := 16 ;
   AQuery.FieldByName('SDOCNO').AsString := TDataBaseDocumentRoutines.GetDocNextNum(16) ;
   AQuery.FieldByName('SREFERENCE').AsString := copy(AtransString,1,AQuery.FieldByName('SREFERENCE').Size);
   AQuery.FieldByName('DDate').Value := transdate;
   AQuery.FieldByName('BPosted').Value :=1;
   AQuery.FieldByName('BPrinted').AsInteger := 0;
     // naming is wrong but the system must know users. ince its type = 16 i gess it should be ok for now.
     // but we need to change this.
    AQuery.FieldByName('WSalesmanID').Value := DMTCCoreLink.currentuser;
    AQuery.FieldByName('WUSERID').Value := DMTCCoreLink.currentuser;
    AQuery.FieldByName('SREFERENCE').AsString := copy(AtransString,1,AQuery.FieldByName('SREFERENCE').Size);
    AQuery.FieldByName('SDocNo').Value := TDataBaseDocumentRoutines.GetDocNextNum(16) ;
    AQuery.Post;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := 0 ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCLINEID','WDOCID']);
   AQuery.Insert ;
   AQuery.FieldByName('WDOCID').AsInteger := ADocid;
   AQuery.FieldByName('WDOClineID').AsInteger := 1;
   AQuery.FieldByName('WSORTNO').AsInteger := 1 ;
   AQuery.FieldByName('WSTOCKID').AsInteger := Astockid ;
   AQuery.FieldByName('WLINETYPEID').AsInteger := 90 ;
   AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(AtransString,false) ;
   KnownTotal := DMTCCoreLink.OpenSqlReturnFirstColumn('select sum(fqty) from stocktrn where wstockid = ' + IntToStr(Astockid) );
       AQuery.FieldByName('FQTYORDERED').AsFloat := 0 ;
       AQuery.FieldByName('FQTYSHIPPED').AsFloat := AQuery.FieldByName('FQTYORDERED').AsFloat;
        if VarToStr(KnownTotal) <> '' then
         begin
          KnownTotal := KnownTotal + AOpeningQty ;
          KnownTotal := KnownTotal - ANewQty ;
          AQuery.FieldByName('FQTYORDERED').AsFloat := - KnownTotal ;
          AQuery.FieldByName('FQTYSHIPPED').AsFloat := AQuery.FieldByName('FQTYORDERED').AsFloat;
        end else
        KnownTotal := AOpeningQty - ANewQty ;
    AQuery.FieldByName('FSELLINGPRICE').AsFloat := 0 ;
    AQuery.Post;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := 'select * from stocktrn where WSTOCKTRANSACTIONID = -1 ';
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'stocktrn',['WSTOCKTRANSACTIONID' ]);
   AQuery.Insert ;
   AQuery.FieldByName('WSTOCKTRANSACTIONID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWSTOCKTRANSID) ;
    AQuery.FieldByName('WAccountID').AsInteger := 0;
     AQuery.FieldByName('DDate').AsDateTime := transdate;
     AQuery.FieldByName('WSalesmanID').AsInteger := DMTCCoreLink.currentuser;
     AQuery.FieldByName('WDocID').AsInteger := ADocid;
     AQuery.FieldByName('WLINEID').AsInteger := 1 ;
     AQuery.FieldByName('WDocTypeID').AsInteger := 16;
     AQuery.FieldByName('WStockID').AsInteger :=   AStockid ;
     AQuery.FieldByName('FQty').AsFloat  :=   - KnownTotal ;
     AQuery.FieldByName('FSellingPrice').AsFloat :=  0 ;
     AQuery.FieldByName('FCostPrice').AsFloat :=0;
    AQuery.Post;

 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
end;


class procedure TDataBaseStockRoutines.createStockTransManual(Astockid: Integer;  ATrans: Double; AtransString: String;transdate:TDateTime);


var
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
  ADocid : Integer ;

begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM dochead where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := 0 ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCHEAD',['WDOCID']);
   AQuery.Insert ;
   AQuery.FieldByName('WDOCID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_DOCID') ;
   ADocid :=AQuery.FieldByName('WDOCID').AsInteger ;
   AQuery.FieldByName('WACCOUNTID').AsInteger := 0 ;
   AQuery.FieldByName('WTYPEID').AsInteger := 16 ;
   AQuery.FieldByName('SDOCNO').AsString := TDataBaseDocumentRoutines.GetDocNextNum(16) ;
   AQuery.FieldByName('SREFERENCE').AsString := copy(AtransString,1,AQuery.FieldByName('SREFERENCE').Size);
   AQuery.FieldByName('DDate').Value := transdate;
   AQuery.FieldByName('BPosted').Value :=1;
   AQuery.FieldByName('BPrinted').AsInteger := 0;
     // naming is wrong but the system must know users. ince its type = 16 i gess it should be ok for now.
     // but we need to change this.
    AQuery.FieldByName('WSalesmanID').Value := DMTCCoreLink.currentuser;
    AQuery.FieldByName('WUSERID').Value := DMTCCoreLink.currentuser;
    AQuery.FieldByName('SREFERENCE').AsString := copy(AtransString,1,AQuery.FieldByName('SREFERENCE').Size);
    AQuery.FieldByName('SDocNo').Value := TDataBaseDocumentRoutines.GetDocNextNum(16) ;
    AQuery.Post;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := ' Select * FROM docline where WDOCID = :WDOCID' ;
   AQuery.Params[0].AsInteger := 0 ;
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'DOCLINE',['WDOCLINEID','WDOCID']);
   AQuery.Insert ;
   AQuery.FieldByName('WDOCID').AsInteger := ADocid;
   AQuery.FieldByName('WDOClineID').AsInteger := 1;
   AQuery.FieldByName('WSORTNO').AsInteger := 1 ;
   AQuery.FieldByName('WSTOCKID').AsInteger := Astockid ;
   AQuery.FieldByName('WLINETYPEID').AsInteger := 90 ;
   AQuery.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(AtransString,false) ;
   AQuery.FieldByName('FQTYORDERED').AsFloat := ATrans ;
   AQuery.FieldByName('FQTYSHIPPED').AsFloat := AQuery.FieldByName('FQTYORDERED').AsFloat;
   AQuery.FieldByName('FSELLINGPRICE').AsFloat := 0 ;
   AQuery.Post;
 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.UpdateObject := AUpdateComp ;
   AQuery.sql.Text := 'select * from stocktrn where WSTOCKTRANSACTIONID = -1 ';
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'stocktrn',['WSTOCKTRANSACTIONID' ]);
   AQuery.Insert ;
   AQuery.FieldByName('WSTOCKTRANSACTIONID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWSTOCKTRANSID) ;
    AQuery.FieldByName('WAccountID').AsInteger := 0;
     AQuery.FieldByName('DDate').AsDateTime := transdate;
     AQuery.FieldByName('WSalesmanID').AsInteger := DMTCCoreLink.currentuser;
     AQuery.FieldByName('WDocID').AsInteger := ADocid;
     AQuery.FieldByName('WLINEID').AsInteger := 1 ;
     AQuery.FieldByName('WDocTypeID').AsInteger := 16;
     AQuery.FieldByName('WStockID').AsInteger :=   AStockid ;
     AQuery.FieldByName('FQty').AsFloat  :=   - ATrans ;
     AQuery.FieldByName('FSellingPrice').AsFloat :=  0 ;
     AQuery.FieldByName('FCostPrice').AsFloat :=0;
    AQuery.Post;

 finally
   AUpdateComp.free ;
 end;
 finally
   AQuery.free ;
 end;
end;

class function TDataBaseStockRoutines.ApplyTaxclassToStock(
  AStockId: Integer): Boolean;
var
  aQuery : TuniQuery ;
   TaxClass : Integer ;
begin
  Result:=False ;
  If AStockId = 0 then exit ;
  aQuery := TuniQuery.Create(Nil);
  try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    aQuery.SQL.Text := 'select WINPUTTAX2ID from stock where WStockid  ='  + IntToStr(AStockId) ;
    aQuery.Open ;
    TaxClass := aQuery.Fields[0].AsInteger ;

    if TaxClass <>0 then
      begin
      aQuery.SQL.Text := 'select * from stocktaxclass  where WSTOCKCLASSTAXID  ='  + IntToStr(TaxClass) ;
      aQuery.Open ;
      DMTCCoreLink.ExecSql('update stock set WCOSTACCOUNTID =  '+ IntToStr(aQuery.fieldByName('WCOSTACCOUNTID').AsInteger) +' ,  WINPUTTAXID= '+
             IntToStr(aQuery.fieldByName('WINPUTTAX').AsInteger) +' ,  WOUTPUTTAXID=   '+
             IntToStr(aQuery.fieldByName('WOUTPUTTAX').AsInteger) +' , WSALESACCOUNTID= '+
             IntToStr(aQuery.fieldByName('WSALESACCOUNTID').AsInteger) +' ,WSTOCKACCOUNTID=  '+
             IntToStr(aQuery.fieldByName('WSTOCKACCOUNTID').AsInteger) +' where WStockid = '  + IntToStr(AStockId)) ;
       result := True ;
      end;

  finally
     aQuery.free ;
  end;
end;



end.




