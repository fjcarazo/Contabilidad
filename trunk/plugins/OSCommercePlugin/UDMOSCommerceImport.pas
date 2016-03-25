(*
  Id: UDMOSCommerceImport.pas,v 1 2004/09/20 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
unit UDMOSCommerceImport;

interface

uses
  SysUtils, Classes, DB,
     DBTables,   IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,IdAuthentication,
  ZSqlUpdate,  DBAccess , Uni, ZAbstractRODataset,
  ZAbstractDataset, MemDS, IdIOHandlerStack, IdSSL,VirtualTable;
const
  OrderTotalText = 'Order Total' ;




type
 TOrderTotalType = (otoDISCOUNT,otoPRODUCT) ;

 TUpdateEventNotify = procedure (const AMin,Amax,Acurrent:Integer;const EventName : String ;const HasRecordInfo : Boolean ;var StopNow : boolean) of object;
  TIDLinkItem = class(TcollectionItem)
  private
    FID: Integer;
    procedure SetID(const Value: Integer);
    published
        property ID : Integer  read FID write SetID;
    end;

  TIDLinksCollection = class(TOwnedCollection)
  private
    function GetLinksItem(index: Integer): TIDLinkItem;
    procedure SetLinksItem(index: Integer; const Value: TIDLinkItem);
     public
       function GetSepList(ASep : String) : String ;

       property  LinksItem [index : Integer ] : TIDLinkItem  read GetLinksItem write SetLinksItem; default ;
  end;

  TTaxLinksItem = class(TcollectionItem)
  private
    FSalesAccount: Integer;
    FTCTaxID: Integer;
    FStockAccount: Integer;
    FCostOfSaleAccount: Integer;
    FOSCTaxId: Integer;
    FTaxFound: Boolean;
    FOSCTaxName: String;
    FTCTaxInput: Integer;
    FExclusive: Boolean;
    FLinkRate: Double;
    FOSCTaxDesc: String;
    procedure SetCostOfSaleAccount(const Value: Integer);
    procedure SetOSCTaxId(const Value: Integer);
    procedure SetSalesAccount(const Value: Integer);
    procedure SetStockAccount(const Value: Integer);
    procedure SetTCTaxID(const Value: Integer);
    procedure SetTaxFound(const Value: Boolean);
    procedure SetOSCTaxName(const Value: String);
    procedure SetTCTaxInput(const Value: Integer);
    procedure SetExclusive(const Value: Boolean);
    procedure SetLinkRate(const Value: Double);
    procedure SetOSCTaxDesc(const Value: String);
    public
      property TaxFound : Boolean  read FTaxFound write SetTaxFound;
    Published
      property OSCTaxId : Integer  read FOSCTaxId write SetOSCTaxId;
      property OSCTaxName : String  read FOSCTaxName write SetOSCTaxName;
      property OSCTaxDesc : String  read FOSCTaxDesc write SetOSCTaxDesc;
      property TCTaxID : Integer  read FTCTaxID write SetTCTaxID;
      property TCTaxInput : Integer   read FTCTaxInput write SetTCTaxInput;
      property SalesAccount : Integer  read FSalesAccount write SetSalesAccount;
      property CostOfSaleAccount : Integer  read FCostOfSaleAccount write SetCostOfSaleAccount;
      property StockAccount : Integer  read FStockAccount write SetStockAccount;
      property Exclusive : Boolean  read FExclusive write SetExclusive;
      property LinkRate : Double  read FLinkRate write SetLinkRate;
  end;

  TTaxLinksCollection = class(TOwnedCollection)
  private
    function GetTaxLinksItem(index: Integer): TTaxLinksItem;
    procedure SetTaxLinksItem(index: Integer; const Value: TTaxLinksItem);
     public
       property  TaxLinksItem [index : Integer ] : TTaxLinksItem  read GetTaxLinksItem write SetTaxLinksItem; default ;
  end;

  TOSCLinks = class(TComponent)
  private
    FTaxLink: TTaxLinksCollection;
    FCBProductBarcode: integer;
    FCBProductLang: integer;
    FCBProductCur: integer;
    FEInvoicePrefix: String;
    FECustomerPRefix: String;
    FDTSincDate: TDateTime;
    FDTSincTime: TDateTime;
    FEStockCodePrefix: String;
    FCBImportAsQuote: Boolean;
    FCBResyncDateTime: Boolean;
    FCBUpdateStockFromTC: Boolean;
    FCBImportItemAttributesAsComment: Boolean;
    FStatusLink: TIDLinksCollection;
    FServerDateTimeFormat: String;
    FOTTaxLink: TTaxLinksCollection;
    FAlternateWay: Integer;
    FCBUSeTaxRatesFromOrderProduct: Boolean;
    FCountiesList: TStringList;
    FDefaultAccountDebtorNotInCountyList: Integer;
    FDebtorGroup1Id: Integer;
    FUseStockIDOnly: Boolean;
    FUseDocReportingGroup1: Boolean;
    FImportStockGroups: Boolean;
    FEditExistingItems: Boolean;
    FUseInvoiceGroupSort: Boolean;
    FDocGroupStockNotAvail: Integer;
    FDocGroupStockAvail: Integer;
    FSettingsVersion: Integer;
    procedure SetTaxLink(const Value: TTaxLinksCollection);
    procedure SetCBProductBarcode(const Value: integer);
    procedure SetCBProductCur(const Value: integer);
    procedure SetCBProductLang(const Value: integer);
    procedure SetDTSincDate(const Value: TDateTime);
    procedure SetDTSincTime(const Value: TDateTime);
    procedure SetECustomerPRefix(const Value: String);
    procedure SetEInvoicePrefix(const Value: String);
    procedure SetEStockCodePrefix(const Value: String);
    procedure SetCBImportAsQuote(const Value: Boolean);
    procedure SetCBResyncDateTime(const Value: Boolean);
    procedure SetCBImportItemAttributesAsComment(const Value: Boolean);
    procedure SetCBUpdateStockFromTC(const Value: Boolean);
    procedure SetStatusLink(const Value: TIDLinksCollection);
    procedure SetServerDateTimeFormat(const Value: String);
    procedure SetOTTaxLink(const Value: TTaxLinksCollection);
    procedure SetAlternateWay(const Value: Integer);
    procedure SetCBUSeTaxRatesFromOrderProduct(const Value: Boolean);
    procedure SetCountiesList(const Value: TStringList);
    procedure SetDefaultAccountDebtorNotInCountyList(const Value: Integer);
    procedure SetDebtorGroup1Id(const Value: Integer);
    procedure SetUseStockIDOnly(const Value: Boolean);
    procedure SetUseDocReportingGroup1(const Value: Boolean);
    procedure SetImportStockGroups(const Value: Boolean);
    procedure SetEditExistingItems(const Value: Boolean);
    procedure SetDocGroupStockAvail(const Value: Integer);
    procedure SetDocGroupStockNotAvail(const Value: Integer);
    procedure SetUseInvoiceGroupSort(const Value: Boolean);
    procedure SetSettingsVersion(const Value: Integer);

     public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
     public
       procedure ClearFoundTaxes ;
       function FindTaxLink(Aid:Integer;ReturnDefault : Boolean = false) : TTaxLinksItem ;
       function FindTaxLinkOnRate(ARate:Double;ReturnDefault : Boolean = true) : TTaxLinksItem ;
       function FindOTLink(AOTNAME : String ) : TTaxLinksItem ;
       Function TotalDatetime : TDatetime ;
     published
      property TaxLink : TTaxLinksCollection  read FTaxLink write SetTaxLink;
      property OTTaxLink : TTaxLinksCollection  read FOTTaxLink write SetOTTaxLink;
      property StatusLink : TIDLinksCollection  read FStatusLink write SetStatusLink;
      property CBProductLang    : integer  read FCBProductLang write SetCBProductLang;
      property CBProductCur     : integer  read FCBProductCur write SetCBProductCur;
      property CBProductBarcode : integer  read FCBProductBarcode write SetCBProductBarcode;
      property DTSincDate       : TDateTime  read FDTSincDate write SetDTSincDate;
      property DTSincTime       : TDateTime  read FDTSincTime write SetDTSincTime;
      property EInvoicePrefix   : String  read FEInvoicePrefix write SetEInvoicePrefix;
      property ECustomerPRefix  : String  read FECustomerPRefix write SetECustomerPRefix;
      property EStockCodePrefix : String  read FEStockCodePrefix write SetEStockCodePrefix;
      property CBImportAsQuote : Boolean  read FCBImportAsQuote write SetCBImportAsQuote;
      property CBResyncDateTime : Boolean  read FCBResyncDateTime write SetCBResyncDateTime;
      property CBImportItemAttributesAsComment : Boolean  read FCBImportItemAttributesAsComment write SetCBImportItemAttributesAsComment;
      property CBUSeTaxRatesFromOrderProduct : Boolean  read FCBUSeTaxRatesFromOrderProduct write SetCBUSeTaxRatesFromOrderProduct;
      property CBUpdateStockFromTC : Boolean  read FCBUpdateStockFromTC write SetCBUpdateStockFromTC;
      property AlternateWay : Integer  read FAlternateWay write SetAlternateWay;
      property ServerDateTimeFormat : String  read FServerDateTimeFormat write SetServerDateTimeFormat;
      property CountiesList : TStringList  read FCountiesList write SetCountiesList;
      property DefaultAccountDebtorNotInCountyList : Integer  read FDefaultAccountDebtorNotInCountyList write SetDefaultAccountDebtorNotInCountyList;
      property DebtorGroup1Id : Integer  read FDebtorGroup1Id write SetDebtorGroup1Id;
      property UseStockIDOnly : Boolean  read FUseStockIDOnly write SetUseStockIDOnly;
      property UseDocReportingGroup1 : Boolean  read FUseDocReportingGroup1 write SetUseDocReportingGroup1;
      property ImportStockGroups : Boolean  read FImportStockGroups write SetImportStockGroups;
      property EditExistingItems : Boolean   read FEditExistingItems write SetEditExistingItems;
      property UseInvoiceGroupSort : Boolean  read FUseInvoiceGroupSort write SetUseInvoiceGroupSort;
      property DocGroupStockAvail : Integer  read FDocGroupStockAvail write SetDocGroupStockAvail;
      property DocGroupStockNotAvail : Integer  read FDocGroupStockNotAvail write SetDocGroupStockNotAvail;
      property SettingsVersion : Integer  read FSettingsVersion write SetSettingsVersion;
    end;

TDMOSCommerceImport = class (TDataModule)
    QAccountsLookups: TuniQuery;
    TCTotals: TuniTable;
    TAccounts: TuniTable;
    TDebtor: TuniTable;
    TCQDOCLINE: TuniQuery;
    TCQDOCLINEWDocLineID: TIntegerField;
    TCQDOCLINEWDocID: TIntegerField;
    TCQDOCLINEWStockID: TIntegerField;
    TCQDOCLINEWLineTypeID: TIntegerField;
    TCQDOCLINEWDescriptionID: TIntegerField;
    TCQDOCLINEFQtyOrdered: TFloatField;
    TCQDOCLINEFQtyShipped: TFloatField;
    TCQDOCLINEFSellingPrice: TFloatField;
    TCQDOCLINEFItemDiscount: TFloatField;
    TCQDOCLINEWTaxID: TIntegerField;
    TCQDOCLINEFExclusiveAmt: TFloatField;
    TCQDOCLINEFInclusiveAmt: TFloatField;
    TCQDOCLINEFTaxAmount: TFloatField;
    TCQDOCLINEDSysDate: TDateTimeField;
    TCQDOCLINESUnit: TStringField;
    TCQDOCLINESSTockCode: TStringField;
    TCQDOCLINEWProfileID: TIntegerField;
    TCQDOCLINEWSerialNoID: TIntegerField;
    TCQDOCHEAD: TuniQuery;
    QAccountCodeLength: TuniQuery;
    TCTax: TuniTable;
    TCTaxWAccountID: TIntegerField;
    TCTaxSDescription: TStringField;
    TCTaxDStartDate: TDateField;
    TCTaxDEndDate: TDateField;
    TCTaxFRate: TFloatField;
    TCTaxDSysDate: TDateTimeField;
    IdHTTP1: TIdHTTP;
    QGen: TuniQuery;
    QStockItems: TuniQuery;
    USQLStock: TUniUpdateSql;
    USQLDocHead: TUniUpdateSql;
    USQLDocLine: TUniUpdateSql;
    TCTotalsWACCOUNTID: TIntegerField;
    TCTotalsWPERIODID: TIntegerField;
    TCTotalsBACTUAL: TSmallintField;
    TCTotalsFAMOUNT: TFloatField;
    TCTotalsDSYSDATE: TDateTimeField;
    TCTotalsWYEARID: TIntegerField;
    ZqReportingGroup: TuniQuery;
    ZUSQLReportingGroup: TUniUpdateSql;
    ZqReportingGroupWGROUPID: TIntegerField;
    ZqReportingGroupWGROUPTYPEID: TIntegerField;
    ZqReportingGroupSDESCRIPTION: TStringField;
    ZqReportingGroupWPARENTGROUP2ID: TIntegerField;
    ZqReportingGroupWPARENTGROUP1ID: TIntegerField;
    ZqReportingGroupDSYSDATE: TDateTimeField;
    ZqReportingGroupWSORTNO: TIntegerField;
    ZCountries: TuniTable;
    ZCountriesCOUNTRIES_ID: TIntegerField;
    ZCountriesCOUNTRIES_NAME: TStringField;
    ZCountriesCOUNTRIES_ISO_CODE_2: TStringField;
    ZCountriesCOUNTRIES_ISO_CODE_3: TStringField;
    ZCountriesADDRESS_FORMAT_ID: TIntegerField;
    TCQDESCRIPTION: TuniQuery;
    TCQDESCRIPTIONWMessageID: TIntegerField;
    TCQDESCRIPTIONSDescription: TStringField;
    TCQDESCRIPTIONSExtraDescription: TStringField;
    USQLDescription: TUniUpdateSql;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ZQOrdersAfterScroll(DataSet: TDataSet);
    procedure ZQUniqueTaxCodeCalcFields(DataSet: TDataSet);
    procedure IdHTTP1Authorization(Sender: TObject;
      Authentication: TIdAuthentication; var Handled: Boolean);
    procedure AllQuerysAfterPost(DataSet: TDataSet);
    procedure QStockItemsBeforeOpen(DataSet: TDataSet);
    procedure QStockItemsAfterInsert(DataSet: TDataSet);
  private
    FOSCLinks: TOSCLinks;
    FAccountCodeLength: Integer;
    FUpdateEventNotify: TUpdateEventNotify;
    FLoginIndex: Integer;
    FSQLCurrencies: TStringList;
    FSQLOrderStatusHist: TStringList;
    FSQLOrdersTotal: TStringList;
    FSQLStatus: TStringList;
    FSQLUniqueTaxCode: TStringList;
    FSQLUpdateStock: TStringList;
    FSQLOrdersOptions: TStringList;
    FSQLLanguage: TStringList;
    FSQLProducts: TStringList;
    FSQLOrders: TStringList;
    FSQLOptions: TStringList;
    FSQLOrderProducts: TStringList;
    FSQLAllProds: TStringList;
    FRemoteURL: String;
    FRememberPassword: Boolean;
    FPassword: String;
    FUsername: String;
    FLoggedIn: Boolean;
    FDateFormat: String;
    FDateTimeFormat: String;
    FSQLCheckOnline: TStringList;
    FPREFIX: String;
    FLoginName: String;
    FSQLChartData: TStringList;
    FSQLAllCatProducts: TStringList;
    FSQLCatPerProduct: TStringList;
    FSqlFolder: String;
    procedure SetOSCLinks(const Value: TOSCLinks);
    procedure CreateTotals(AccountID: Integer);
    procedure SetAccountCodeLength(const Value: Integer);
    procedure SetUpdateEventNotify(const Value: TUpdateEventNotify);
    procedure SetLoginIndex(const Value: Integer);
    procedure SetSQLAllProds(const Value: TStringList);
    procedure SetSQLCurrencies(const Value: TStringList);
    procedure SetSQLLanguage(const Value: TStringList);
    procedure SetSQLOptions(const Value: TStringList);
    procedure SetSQLOrderProducts(const Value: TStringList);
    procedure SetSQLOrders(const Value: TStringList);
    procedure SetSQLOrdersOptions(const Value: TStringList);
    procedure SetSQLOrderStatusHist(const Value: TStringList);
    procedure SetSQLOrdersTotal(const Value: TStringList);
    procedure SetSQLProducts(const Value: TStringList);
    procedure SetSQLStatus(const Value: TStringList);
    procedure SetSQLUniqueTaxCode(const Value: TStringList);
    procedure SetSQLUpdateStock(const Value: TStringList);
    procedure SetRemoteURL(const Value: String);
    procedure SetPassword(const Value: String);
    procedure SetRememberPassword(const Value: Boolean);
    procedure SetUsername(const Value: String);
    procedure SetLoggedIn(const Value: Boolean);
    procedure SetDateFormat(const Value: String);
    procedure SetDateTimeFormat(const Value: String);
    procedure SetSQLCheckOnline(const Value: TStringList);
    procedure SetPREFIX(const Value: String);
    procedure SetLoginName(const Value: String);
    procedure SetSQLChartData(const Value: TStringList);
    function RoundAmount(Amount: Double;Decimals : Integer = 4): Double;
    function AddMessage(StrMessage: String): Integer;
    procedure SetSQLAllCatProducts(const Value: TStringList);
    procedure SetSQLCatPerProduct(const Value: TStringList);
    procedure SetSqlFolder(const Value: String);

    { Private declarations }
  public
    Stock0String : String ;
    StockLength : Integer ;

    GlFromDate,GlToDate : TDateTime ;
    AlternateWay : Integer ;
    UseDebug : Boolean ;
    DebugString : String ;
    WDataEntryNbrQty : Integer ;
    WDocRowDecimals : Integer ;

    ZQOptions: TVirtualTable;
    ZQProducts: TVirtualTable;
    ZQOrders: TVirtualTable;
    ZOrderProducts: TVirtualTable;
    ZQOrdersTotal: TVirtualTable;
    ZQOrdersOptions: TVirtualTable;
    ZQOrderStatusHist: TVirtualTable;
    ZQUpdateStock: TVirtualTable;
    ZStatus: TVirtualTable;
    ZQUniqueTaxCode: TVirtualTable;
    ZLanguage: TVirtualTable;
    ZCurrencies: TVirtualTable;
    ZQAllProds: TVirtualTable;
    CDChartData: TVirtualTable;
    CDGen: TVirtualTable;
    ZQAllCatProducts: TVirtualTable;
    ZQCatPerProduct: TVirtualTable;


    ForceCheckCode : Boolean ;
    function URLEncode(Value: String): String;
    property LoginIndex : Integer  read FLoginIndex write SetLoginIndex;
    property LoginName : String  read FLoginName write SetLoginName;
    procedure OpenTables ;
    property  OSCLinks : TOSCLinks  read FOSCLinks write SetOSCLinks;
    procedure SaveOSCLinks (AFilename : String );
    procedure LoadOSCLinks (AFilename : String );
    procedure SyncStockGroup ;
    procedure SyncStock ;
    procedure RelinkOldStock;
    procedure SyncOrders ;
    procedure SyncCustomers ;
    procedure HandelEvents ;

    procedure ReSyncOSCWithTCStock(DoAll :Boolean) ;
    property  AccountCodeLength : Integer  read FAccountCodeLength write SetAccountCodeLength;
    procedure InitAccountCodeLength ;
    function  IsDateTimeBigger(AOldDateTime,ANewDatetime :TDateTime) : Boolean ;
    procedure CloseConnection ;
    property  UpdateEventNotify : TUpdateEventNotify  read FUpdateEventNotify write SetUpdateEventNotify;
    function  GetTaxRate(AtaxID : Integer) : Double ;
    property  SQLCurrencies : TStringList  read FSQLCurrencies write SetSQLCurrencies;
    property  SQLLanguage    : TStringList  read FSQLLanguage write SetSQLLanguage;
    property  SQLOrderProducts : TStringList  read FSQLOrderProducts write SetSQLOrderProducts;
    property  SQLAllProds : TStringList  read FSQLAllProds write SetSQLAllProds;
    property  SQLOptions : TStringList  read FSQLOptions write SetSQLOptions;
    property  SQLOrders : TStringList  read FSQLOrders write SetSQLOrders;
    property  SQLOrdersOptions : TStringList  read FSQLOrdersOptions write SetSQLOrdersOptions;
    property  SQLOrderStatusHist : TStringList  read FSQLOrderStatusHist write SetSQLOrderStatusHist;
    property  SQLOrdersTotal : TStringList  read FSQLOrdersTotal write SetSQLOrdersTotal;
    property  SQLProducts : TStringList  read FSQLProducts write SetSQLProducts;
    property  SQLUniqueTaxCode : TStringList  read FSQLUniqueTaxCode write SetSQLUniqueTaxCode;
    property  SQLUpdateStock : TStringList  read FSQLUpdateStock write SetSQLUpdateStock;
    property  SQLStatus : TStringList  read FSQLStatus write SetSQLStatus;
    property  SQLCheckOnline : TStringList  read FSQLCheckOnline write SetSQLCheckOnline;
    property  SQLChartData : TStringList  read FSQLChartData write SetSQLChartData;
    property  SQLAllCatProducts : TStringList  read FSQLAllCatProducts write SetSQLAllCatProducts;
    property  SQLCatPerProduct : TStringList  read FSQLCatPerProduct write SetSQLCatPerProduct;

    property RemoteURL : String  read FRemoteURL write SetRemoteURL;
    property Username : String  read FUsername write SetUsername;
    property Password : String  read FPassword write SetPassword;
    property SqlFolder : String  read FSqlFolder write SetSqlFolder;
    property RememberPassword : Boolean  read FRememberPassword write SetRememberPassword;
    property PREFIX : String  read FPREFIX write SetPREFIX;
    Procedure FillCDSWithQuery(ACDS : TVirtualTable ; ASQL : String ) ;
    procedure ExecSql(ASQL : String) ;
    property LoggedIn : Boolean  read FLoggedIn write SetLoggedIn;
    function CheckLogin : Boolean ;
    function DateTOMYSQLDate(ADatetime : TDateTime) : String ;
    property DateFormat : String  read FDateFormat write SetDateFormat;
    property DateTimeFormat : String  read FDateTimeFormat write SetDateTimeFormat;
    procedure LoadSQL;
    procedure LoadIni(LoadDefault : Boolean ) ;
    procedure SaveIni(Delete : Boolean = false ) ;
    function GetAddDocReportinggroup(AName : String) : Integer ;

    // Names can be nesteld use test/test/test to create or select a nesteld name
    { Public declarations }
  end;

var
  DMOSCommerceImport: TDMOSCommerceImport;

implementation

{$R *.dfm}
 uses StrUtils,forms,variants,math , UDMTCCoreLink, TcashClasses,
  OSFGeneralRoutines, janXMLParser2;
{ TDMOSCommerceImport }

Function TDMOSCommerceImport.RoundAmount(Amount: Double;Decimals : Integer = 4 ): Double;
var
  Multyplier : Double ;
begin
  Multyplier := power(10,Decimals);
  if Amount>=0 then
   Result := Trunc(Amount*Multyplier+0.49999999)/Multyplier
  else
   Result := Trunc(Amount*Multyplier-0.49999999)/Multyplier;
end;

function TDMOSCommerceImport.URLEncode(Value : String) : String;
Var I : Integer;
const
 ValidURLChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$-_@.&+-!*"(),;/#?:';
Begin
   Result := '';
   For I := 1 To Length(Value) Do
      Begin
         If Pos(UpperCase(Value[I]), ValidURLChars) > 0 Then
            Result := Result + Value[I]
         Else
            Begin
               If Value[I] = ' ' Then
                  Result := Result + '%20'
               Else
                  Begin
                     Result := Result + '%';
                     Result := Result + IntToHex(Byte(Value[I]), 2);
                  End;
            End;
      End;
End;


procedure TDMOSCommerceImport.OpenTables;
begin

end;

procedure TDMOSCommerceImport.SetOSCLinks(const Value: TOSCLinks);
begin
  FOSCLinks := Value;
end;

procedure TDMOSCommerceImport.LoadOSCLinks(AFilename: String);
var
 Astream : TMemoryStream ;
begin
 if not FileExists(AFilename)then exit ;
 Astream := TMemoryStream.Create ;
  try
   Astream.LoadFromFile(AFilename);
   Astream.ReadComponent(OSCLinks);
  finally
    Astream.free ;
  end;

end;

procedure TDMOSCommerceImport.SaveOSCLinks(AFilename: String);
var
 Astream : TMemoryStream ;
begin

 Astream := TMemoryStream.Create ;
  try
   Astream.WriteComponent(OSCLinks);
   Astream.SaveToFile(AFilename);

  finally
    Astream.free ;
  end;

end;
procedure TDMOSCommerceImport.SyncStock ;
procedure HandelXFields ;
var
  v : Integer ;
 begin
   for v := 0 to QStockItems.FieldCount -1 do
     begin
       if POS('X_',UpperCase(QStockItems.Fields[v].FieldName)) = 1 then
         begin
           if ZQProducts.FindField(copy(QStockItems.Fields[v].FieldName,3,255)) <> nil then
              QStockItems.Fields[v].Value := ZQProducts.FindField(copy(QStockItems.Fields[v].FieldName,3,255)).Value ;
         end;
     end;
 end;

var
 i : Integer ;
 CodeMask,Code,ConFlictStockcode : String ;
 AItem : TTaxLinksItem ;
 Stop : Boolean ;
begin
  StockLength := DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE') ;
  Stock0String := '' ;
  for i := 0 to StockLength do
      Stock0String := Stock0String + '0';

  




 if OSCLinks.ImportStockGroups then
   if ZQAllCatProducts.Active = false then
      begin
         SyncStockGroup ;
      end;

 ZQProducts.DisableControls ;
 try
 CodeMask := LeftStr(OSCLinks.EStockCodePrefix+Stock0String,StockLength) ;

  QStockItems.close ;
  QStockItems.sql.Text := 'select * from stock where SEXTERNALID = :SEXTERNALID';
  QStockItems.Params[0].AsInteger :=  -1 ;
  QStockItems.open ;
  TDatabaseTableRoutines.UpdateQuery(QStockItems,'STOCK',['WSTOCKID']);

  ZQProducts.First ;
  while not ZQProducts.Eof do
    begin
     if assigned(FUpdateEventNotify) then
        FUpdateEventNotify(0,ZQProducts.RecordCount,ZQProducts.RecNo,'products',true,Stop);
      if stop then raise Exception.Create('Stopt by user!');
               if OSCLinks.CBResyncDateTime then
                  begin
                      if ZQProducts.FieldByName('products_last_modified').AsDateTime = 0 then
                         begin
                         if IsDateTimeBigger(OSCLinks.TotalDatetime,ZQProducts.FieldByName('products_date_added').AsDateTime) then
                            begin
                            OSCLinks.FDTSincDate := ZQProducts.FieldByName('products_date_added').AsDateTime ;
                            OSCLinks.FDTSincTime := ZQProducts.FieldByName('products_date_added').AsDateTime ;
                            end;
                         end
                        else
                        begin
                             if IsDateTimeBigger(OSCLinks.TotalDatetime,ZQProducts.FieldByName('products_last_modified').AsDateTime) then
                                begin
                                OSCLinks.FDTSincDate := ZQProducts.FieldByName('products_last_modified').AsDateTime ;
                                OSCLinks.FDTSincTime := ZQProducts.FieldByName('products_last_modified').AsDateTime ;
                                end;
                        end;
                  end;
      Code := '' ;
      if (AlternateWay = 0) and (not OSCLinks.UseStockIDOnly) then
         Code := uppercase(ZQProducts.FieldByName('products_model').AsString) ;

     if code = '' then
      Code := FormatFloat(CodeMask,ZQProducts.FieldByName('products_id').AsInteger) ;
      Code := UPPERCASE(LeftStr(Code,StockLength));
      //FormatFloat(CodeMask,ZQProductsproducts_id.AsInteger) ;
      QStockItems.close ;
      QStockItems.Params[0].AsString :=  ZQProducts.FieldByName('products_id').AsString ;
      QStockItems.open ;
      if not QStockItems.IsEmpty then
         begin
          if DMOSCommerceImport.OSCLinks.EditExistingItems then
           begin
               QStockItems.edit ;

               QStockItems.FieldByName('SEXTERNALID').AsString := ZQProducts.FieldByName('products_id').AsString ;

               if DMOSCommerceImport.AlternateWay = 0 then
               QStockItems.FieldByName('SDescription').AsString := ZQProducts.FieldByName('products_name').AsString
               else
               QStockItems.FieldByName('SDescription').AsString := ZQProducts.FieldByName('products_model').AsString;
               if DMOSCommerceImport.AlternateWay = 0 then
               AItem :=  OSCLinks.FindTaxLink(ZQProducts.FieldByName('products_tax_class_id').AsInteger,true)
               else
               AItem :=  OSCLinks.FindTaxLink(ZQProducts.FieldByName('products_ext_tax_id').AsInteger,true);
               if AItem <> nil then
               begin
                 QStockItems.FieldByName('WCostAccountID').AsInteger:= AItem.FCostOfSaleAccount ;
                 QStockItems.FieldByName('WInputTaxID').AsInteger := AItem.FTCTaxInput ;
                 QStockItems.FieldByName('WOutputTaxID').AsInteger := AItem.FTCTaxID ;
                 QStockItems.FieldByName('WSalesAccountID').AsInteger := AItem.FSalesAccount ;
                 QStockItems.FieldByName('WStockAccountID').AsInteger := AItem.FStockAccount ;
                 end;
               if DMOSCommerceImport.AlternateWay = 1 then
               begin
                 // look for pirce1 etc field
                 if  ZQProducts.FindField('price1') <> nil then
                   begin
                     QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('price1').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                     QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('price2').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                     QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('price3').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                   end else
                  QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('products_price').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
               end else
               begin
                 if  ZQProducts.FindField('price1') <> nil then
                   begin
                     QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('price1').AsFloat ;
                     QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('price2').AsFloat ;
                     QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('price3').AsFloat ;
                   end else
                 QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('products_price').AsFloat  ;
               end;
               if OSCLinks.ImportStockGroups then
                    begin
                       FillCDSWithQuery(ZQCatPerProduct,format(SQLCatPerProduct.text+' and p.products_id = %s' ,[intToStr(OSCLinks.CBProductLang),IntToStr(ZQProducts.FieldByName('products_id').AsInteger)]));
                       if not ZQCatPerProduct.IsEmpty then
                         if ZQAllCatProducts.Locate('categories_id',ZQCatPerProduct.fieldbyname('categories_id').asinteger,[]) then
                           QStockItems.FieldByName('WREPORTINGGROUP1ID').AsInteger := ZQAllCatProducts.fieldbyname('TCGroupID').asinteger
                    end;
               // look for the BDISABLED field

                 QStockItems.FieldByName('BDISABLED').asinteger := ord(not (ZQProducts.FindField('products_status').asstring = '1')) ;
             if QStockItems.FindField('SExtraDesc') <> nil then
                QStockItems.FindField('SExtraDesc').AsString := ZQProducts.FieldByName('products_name').AsString ;
             if ZQProducts.FindField('barcode') <> nil then
                QStockItems.FindField('SBARCODENUMBER').AsString := ZQProducts.FindField('barcode').AsString ;
               HandelXFields;
               QStockItems.Post ;
           end; // end DMOSCommerceImport.OSCLinks.EditExistingItems
         end else
         begin
         // check to see if double stockcode would exsist.
         if ForceCheckCode then
         begin
         ConFlictStockcode := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WStockId from Stock where SStockCode =' + QuotedStr(Code))) ;
         if ConFlictStockcode <> '' then
           begin
             QStockItems.close ;
             QStockItems.sql.Text := 'select * from stock where WStockId = ' + ConFlictStockcode;
             QStockItems.open ;
            // if QStockItems.fieldbyName('SEXTERNALID').AsString = '' then
            //   begin
                 QStockItems.edit ;
                 QStockItems.fieldbyName('SEXTERNALID').AsString :=  ZQProducts.FieldByName('products_id').AsString ;
                 QStockItems.Post ;
            //   end;
            QStockItems.close ;
            QStockItems.sql.Text := 'select * from stock where SEXTERNALID = :SEXTERNALID';
            QStockItems.Params[0].AsString :=  ZQProducts.FieldByName('products_id').AsString ;
            QStockItems.open ;
            if not QStockItems.IsEmpty then
              QStockItems.Edit else
                Continue ;
           end else
           QStockItems.Insert ;
           end else // CbForceItems.checked
           QStockItems.Insert ;

           QStockItems.FieldByName('SEXTERNALID').AsString := ZQProducts.FieldByName('products_id').AsString ;
           QStockItems.FieldByName('SStockCode').AsString := Code;
           if DMOSCommerceImport.AlternateWay = 0 then
           QStockItems.FieldByName('SDescription').AsString := ZQProducts.FieldByName('products_name').AsString
           else
           QStockItems.FieldByName('SDescription').AsString := ZQProducts.FieldByName('products_model').AsString;
           if QStockItems.FindField('SExtraDesc') <> nil then
              QStockItems.FindField('SExtraDesc').AsString := ZQProducts.FieldByName('products_name').AsString ;
           if ZQProducts.FindField('barcode') <> nil then
              QStockItems.FindField('SBARCODENUMBER').AsString := ZQProducts.FindField('barcode').AsString ;
           QStockItems.FieldByName('WSTOCKTYPEID').AsFloat := 0 ;
           if DMOSCommerceImport.AlternateWay = 0 then
           AItem :=  OSCLinks.FindTaxLink(ZQProducts.FieldByName('products_tax_class_id').AsInteger,true)
           else
           AItem :=  OSCLinks.FindTaxLink(ZQProducts.FieldByName('products_ext_tax_id').AsInteger,true);
           if  AItem <> nil then
            begin
              QStockItems.FieldByName('WCostAccountID').AsInteger:= AItem.FCostOfSaleAccount ;
              QStockItems.FieldByName('WInputTaxID').AsInteger := AItem.FTCTaxInput ;
              QStockItems.FieldByName('WOutputTaxID').AsInteger := AItem.FTCTaxID ;
              QStockItems.FieldByName('WSalesAccountID').AsInteger := AItem.FSalesAccount ;
              QStockItems.FieldByName('WStockAccountID').AsInteger := AItem.FStockAccount ;
            end;  
           QStockItems.FieldByName('FQtyOnHand').AsFloat := ZQProducts.FieldByName('products_quantity').AsInteger ;
           if DMOSCommerceImport.AlternateWay = -1 then
           QStockItems.FieldByName('FQtyOnHand').AsFloat := -1 ;
           QStockItems.FieldByName('FOpeningQty').AsFloat := ZQProducts.FieldByName('products_quantity').AsInteger ;
           QStockItems.FieldByName('FREORDERQTY').AsFloat := 0 ;
           if DMOSCommerceImport.AlternateWay = 1 then
               begin
                 // look for pirce1 etc field
                 if  ZQProducts.FindField('price1') <> nil then
                   begin
                     QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('price1').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                     QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('price2').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                     QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('price3').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                   end else
                   begin
                   QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('products_price').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                   QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('products_price').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                   QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('products_price').AsFloat / (1+ GetTaxRate(AItem.FTCTaxID)) ;
                   end ;
           end else
               begin
                 if  ZQProducts.FindField('price1') <> nil then
                   begin
                     QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('price1').AsFloat ;
                     QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('price2').AsFloat ;
                     QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('price3').AsFloat ;
                   end else
                  begin
                     QStockItems.FieldByName('FSellingPrice1').AsFloat := ZQProducts.FieldByName('products_price').AsFloat  ;
                     QStockItems.FieldByName('FSellingPrice2').AsFloat := ZQProducts.FieldByName('products_price').AsFloat  ;
                     QStockItems.FieldByName('FSellingPrice3').AsFloat := ZQProducts.FieldByName('products_price').AsFloat  ;
                  end;
               end;
           QStockItems.FieldByName('BDISABLED').asinteger := ord(not (ZQProducts.FindField('products_status').asstring = '1')) ;
           QStockItems.FieldByName('WStockTypeID').AsInteger := 0;
           QStockItems.FieldByName('WREPORTINGGROUP1ID').AsInteger := 0 ;
           QStockItems.FieldByName('WREPORTINGGROUP2ID').AsInteger := 0 ;
           if OSCLinks.ImportStockGroups then
                begin
                   FillCDSWithQuery(ZQCatPerProduct,format(SQLCatPerProduct.text+' and p.products_id = %s' ,[intToStr(OSCLinks.CBProductLang),IntToStr(ZQProducts.FieldByName('products_id').AsInteger)]));
                   if not ZQCatPerProduct.IsEmpty then
                     if ZQAllCatProducts.Locate('categories_id',ZQCatPerProduct.fieldbyname('categories_id').asinteger,[]) then
                       QStockItems.FieldByName('WREPORTINGGROUP1ID').AsInteger := ZQAllCatProducts.fieldbyname('TCGroupID').asinteger
                end;
           HandelXFields;
           QStockItems.Post ;
          end;
       ZQProducts.Next ;
    end;
   for i := 0 to OSCLinks.OTTaxLink.Count -1 do
      if  OSCLinks.OTTaxLink[i].FOSCTaxId = ord(otoPRODUCT) then
      begin
         Code :=  OSCLinks.OTTaxLink[i].FOSCTaxName ;
         Code :=  UPPERCASE(LeftStr(Code,StockLength)) ;
      QStockItems.close ;
      QStockItems.sql.Text := 'select * from stock where SStockCode = :StockCode';
      QStockItems.Params[0].AsString :=  Code ;
      QStockItems.open ;
      if QStockItems.IsEmpty then
      begin
           QStockItems.Insert ;
           AItem :=  OSCLinks.OTTaxLink[i] ;
           QStockItems.FieldByName('SStockCode').AsString := Code;
           QStockItems.FieldByName('SDescription').AsString := AItem.FOSCTaxDesc;
           QStockItems.FieldByName('WCostAccountID').AsInteger:= AItem.FCostOfSaleAccount ;
           QStockItems.FieldByName('WInputTaxID').AsInteger := AItem.FTCTaxInput ;
           QStockItems.FieldByName('WOutputTaxID').AsInteger := AItem.FTCTaxID ;
           QStockItems.FieldByName('FQtyOnHand').AsFloat := -1 ;
           QStockItems.FieldByName('FOpeningQty').AsFloat := 0 ;
           QStockItems.FieldByName('FREORDERQTY').AsFloat := -1 ;
           QStockItems.FieldByName('WSTOCKTYPEID').AsFloat := 4 ;
           QStockItems.FieldByName('WSalesAccountID').AsInteger := AItem.FSalesAccount ;
           QStockItems.FieldByName('WStockAccountID').AsInteger := AItem.FStockAccount ;
           QStockItems.FieldByName('FSellingPrice1').AsFloat := 1  ;
           QStockItems.FieldByName('FSellingPrice2').AsFloat := 1  ;
           QStockItems.FieldByName('FSellingPrice3').AsFloat := 1  ;
           if QStockItems.FindField('SExtraDesc') <> nil then
              QStockItems.FindField('SExtraDesc').AsString := AItem.FOSCTaxDesc ;
           QStockItems.Post ;
      end else
      begin
           QStockItems.Edit ;
           AItem :=  OSCLinks.OTTaxLink[i] ;
           QStockItems.FieldByName('WCostAccountID').AsInteger:= AItem.FCostOfSaleAccount ;
           QStockItems.FieldByName('WInputTaxID').AsInteger := AItem.FTCTaxInput ;
           QStockItems.FieldByName('WOutputTaxID').AsInteger := AItem.FTCTaxID ;
           QStockItems.FieldByName('WSalesAccountID').AsInteger := AItem.FSalesAccount ;
           QStockItems.FieldByName('WStockAccountID').AsInteger := AItem.FStockAccount ;
           if QStockItems.FieldByName('SDescription').AsString <> '' then
           QStockItems.FieldByName('SDescription').AsString := AItem.OSCTaxDesc ;
           if QStockItems.FindField('SExtraDesc').AsString = '' then
              QStockItems.FindField('SExtraDesc').AsString := AItem.OSCTaxDesc;
           QStockItems.Post ;
      end;
     end;
 finally
 ZQProducts.First ;
 ZQProducts.EnableControls ;
 end;
end;

procedure TDMOSCommerceImport.RelinkOldStock;
var
 i : Integer ;
 CodeMask,Code : String ;
 AItem : TTaxLinksItem ;
 Stop : Boolean ;
begin
  StockLength := DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE') ;
  Stock0String := '' ;
  for i := 0 to StockLength do
      Stock0String := Stock0String + '0';



 ZQProducts.DisableControls ;
 try
 CodeMask := LeftStr(OSCLinks.EStockCodePrefix+Stock0String,StockLength) ;
 ZQProducts.First ;
  while not ZQProducts.Eof do
    begin
     if assigned(FUpdateEventNotify) then
        FUpdateEventNotify(0,ZQProducts.RecordCount,ZQProducts.RecNo,'products relink',true,Stop);

      Code := '' ;
      if (AlternateWay = 0) and (not OSCLinks.UseStockIDOnly) then
         Code := uppercase(ZQProducts.FieldByName('products_model').AsString) ;
      if code = '' then
         Code := FormatFloat(CodeMask,ZQProducts.FieldByName('products_id').AsInteger) ;
       Code := UPPERCASE(LeftStr(Code,StockLength));
       QStockItems.close ;
       QStockItems.sql.Text := 'select * from stock where SStockCode = :StockCode';
       QStockItems.Params[0].AsString :=  Code ;
       QStockItems.open ;
       if not QStockItems.IsEmpty then
         begin
             QStockItems.edit ;
             QStockItems.FieldByName('SEXTERNALID').AsString := ZQProducts.FieldByName('products_id').AsString ;
             QStockItems.Post ;
         end;
       ZQProducts.Next ;
    end;
 finally
 ZQProducts.First ;
 ZQProducts.EnableControls ;
 end;
end;

procedure TDMOSCommerceImport.CreateTotals(AccountID : Integer);
  {
  Creates a set of zeros in the totals table for
  a new account.
  }
var
  i      : Integer;
begin
   TDataBaseRoutines.CreateTotalsForAccount(AccountID);
end;

Function TDMOSCommerceImport.AddMessage(StrMessage : String):Integer;
Var
  ExtraMsg:String;
begin
  ExtraMsg := Copy(Trim(StrMessage),DMTCCoreLink.MessageLength +1,Length(StrMessage));
  ExtraMsg := copy(trim(ExtraMsg),1,255);
  StrMessage:=Copy(Trim(StrMessage),1,DMTCCoreLink.MessageLength  );
  StrMessage := trim(StrMessage);

  TCQDESCRIPTION.close;
  TCQDESCRIPTIONSDescription.Size := DMTCCoreLink.MessageLength ;
  if ExtraMsg = '' then
   TCQDESCRIPTION.sql.Text := 'Select * from  messages where SDescription = :SDescription and (SExtraDescription = :SExtraDescription or SExtraDescription is null)'
    else
   TCQDESCRIPTION.sql.Text := 'Select * from messages where SDescription = :SDescription and SExtraDescription = :SExtraDescription ';
  TCQDESCRIPTION.Params[0].AsString := strMessage ;
  TCQDESCRIPTION.Params[1].AsString := ExtraMsg ;
  TCQDESCRIPTION.open;
  if (StrMessage+ExtraMsg)='' then
  begin
    result := 0 ;
  end
  else
  begin
   if  TCQDESCRIPTION.IsEmpty then
      begin
        TCQDESCRIPTION.Insert;
        TCQDESCRIPTIONWMessageID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWMESSAGEID) ;
        TCQDESCRIPTIONSDescription.Value := strMessage;
        if ExtraMsg <> '' then
        TCQDESCRIPTIONSExtraDescription.AsString := ExtraMsg;
        TCQDESCRIPTION.Post;
      end ;                   
    Result := TCQDESCRIPTIONWMessageID.Value;
  end;
  TCQDESCRIPTION.close;
end;

procedure TDMOSCommerceImport.SyncOrders;
procedure HandelXFields ;
 var
  I : Integer ;
 begin
   for i := 0 to TCQDOCHEAD.FieldCount -1 do
     begin
       if POS('X_',UpperCase(TCQDOCHEAD.Fields[i].FieldName)) = 1 then
         begin
           if ZQOrders.FindField(copy(TCQDOCHEAD.Fields[i].FieldName,3,255)) <> nil then
              TCQDOCHEAD.Fields[i].Value := ZQOrders.FindField(copy(TCQDOCHEAD.Fields[i].FieldName,3,255)).Value ;
         end;
     end;
 end;

var
 LineId,TaxId,i: Integer ;
 CodeMask,StockCodeMask,Code,LineText : String ;
 TotalDoc , TotalTax,StockQty , PercentageDiscount,TotalDiscount,NewTotalDoc : Double ;
 Stop,StockInHouse : Boolean ;
begin
  StockLength := DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE') ;
  Stock0String := '' ;
  for i := 0 to StockLength do
      Stock0String := Stock0String + '0';


 SyncCustomers ;
 ZQOrders.first ;
 if OSCLinks.UseDocReportingGroup1 then
   begin
   ZStatus.Close ;
   FillCDSWithQuery(ZStatus,format(SQLStatus.Text,[IntTOStr(OSCLinks.CBProductLang)]));
   end;
 ZQOrders.DisableControls ;
 ZQOrders.AfterOpen := nil ;
 ZQOrders.AfterScroll := nil ;
 try
 CodeMask := LeftStr(OSCLinks.EInvoicePrefix+'000000000',AccountCodeLength + 3) ;
 StockCodeMask := LeftStr(OSCLinks.EStockCodePrefix+Stock0String,StockLength) ;
 TAccounts.Close ;
 TAccounts.open ;
 TDebtor.close ;
 TDebtor.open ;

 TCQDOCHEAD.close ;
 TCQDOCHEAD.Params[0].AsString := 'XXX#111@' ;
 TCQDOCHEAD.open ;
 TDatabaseTableRoutines.UpdateQuery(TCQDOCHEAD,'DOCHEAD',['WDOCID']);

 ZQOrders.First ;
 while not ZQOrders.Eof do
    begin
     if (ZQOrders.fieldByName('orders_id').AsInteger = 0) then
       begin
         ZQOrders.Next ;
         Continue ;
       end;
     DMTCCoreLink.TheZConnection.StartTransaction ;
        try
       // Remember the high time
       if OSCLinks.CBResyncDateTime then
          begin
            if ZQOrders.fieldByName('last_modified').AsDateTime = 0 then
               begin
               if IsDateTimeBigger(OSCLinks.TotalDatetime,ZQOrders.fieldByName('date_purchased').AsDateTime) then
                  begin
                  OSCLinks.FDTSincDate := ZQOrders.fieldByName('date_purchased').AsDateTime ;
                  OSCLinks.FDTSincTime := ZQOrders.fieldByName('date_purchased').AsDateTime ;
                  end;
               end
          else
          begin
               if IsDateTimeBigger(OSCLinks.TotalDatetime,ZQOrders.fieldByName('last_modified').AsDateTime) then
                  begin
                  OSCLinks.FDTSincDate := ZQOrders.fieldByName('last_modified').AsDateTime ;
                  OSCLinks.FDTSincTime := ZQOrders.fieldByName('last_modified').AsDateTime ;
                  end;
          end;
        end ;
     // Do update screen event and check for stop
     if assigned(FUpdateEventNotify) then
        FUpdateEventNotify(0,ZQOrders.RecordCount,ZQOrders.RecNo,'Orders',true,Stop);
      if stop then raise Exception.Create('Stopt by user!');
      // Get unique code form debtor basis is the ID from OSC The debtor is created in SyncCustomers so it should always be there.
      CodeMask := LeftStr(OSCLinks.ECustomerPRefix+'000000000',AccountCodeLength+3) ;
      Code := copy(FormatFloat(CodeMask,ZQOrders.fieldByName('customers_id').AsInteger),1,DMTCCoreLink.MainAccountLength +3 ) ;

      // Must have been created by SynCustomers
       if TAccounts.Locate('SACCOUNTCODE',Code,[]) then
         begin
           TDebtor.Locate('WAccountID',TAccounts.fieldByName('WAccountID').AsInteger,[]) ;
           LineId := 0 ;
           CodeMask := LeftStr(OSCLinks.EInvoicePrefix+'000000000',AccountCodeLength + 3) ;
           Code := FormatFloat(CodeMask,ZQOrders.fieldByName('orders_id').AsInteger) ;
           TCQDOCHEAD.close ;
           TCQDOCHEAD.Params[0].AsString := Code ;
           TCQDOCHEAD.open ;

           // If it does not already exist then add
           if TCQDOCHEAD.IsEmpty then
               begin
               TCQDOCHEAD.Insert ;
               TCQDOCHEAD.FieldByName('WDocID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWDOCID) ;
               TCQDOCLINE.close ;
               TCQDOCLINE.Params[0].AsInteger := TCQDOCHEAD.FieldByName('WDocID').AsInteger ;
               TCQDOCLINE.open ;
               TCQDOCHEAD.FieldByName('SDocNo').AsString := Code ;
               TCQDOCHEAD.FieldByName('DDate').AsDateTime := ZQOrders.fieldByName('date_purchased').AsDateTime ;
               TCQDOCHEAD.FieldByName('DAllocatedDate').AsDateTime := ZQOrders.fieldByName('date_purchased').AsDateTime ;

               TCQDOCHEAD.FieldByName('WAccountID').AsInteger := TAccounts.FieldByName('WAccountID').AsInteger ;
               TCQDOCHEAD.FieldByName('WPaymentTypeID').AsInteger := 0 ;
               // If its just one account that is used for websales.
              { if (Length(OSCLinks.ECustomerPRefix) >= AccountCodeLength+3 ) then
                  begin
                   if ZQOrders.fieldByName('customers_company').AsString  <> '' then
                    begin
                     TCQDOCHEAD.FieldByName('SReference').Asstring := trim(ZQOrders.fieldByName('customers_company').AsString) ;
                    end else
                    begin
                       TCQDOCHEAD.FieldByName('SReference').Asstring :=  trim(ZQOrders.fieldByName('customers_name').AsString) ;
                    end;
                  end else
                  begin  }
                   // added to head now.
                   TCQDOCHEAD.FieldByName('SReference').Asstring := Code ;
               //   end;
               // Get status in doc group field1
               if OSCLinks.FUseDocReportingGroup1 then
                  begin
                    if ZStatus.Locate('orders_status_id',ZQOrders.fieldByName('orders_status').AsString,[]) then
                    TCQDOCHEAD.FieldByName('WREPORTINGGROUP1ID').AsInteger := GetAddDocReportinggroup(ZStatus.FieldByName('orders_status_name').AsString);
                  end;
               TCQDOCHEAD.FieldByName('WPostal1ID').AsInteger := AddMessage(ZQOrders.fieldByName('customers_street_address').AsString) ;
               TCQDOCHEAD.FieldByName('WPostal2ID').AsInteger := AddMessage(trim(ZQOrders.fieldByName('customers_suburb').AsString + ' ' + ZQOrders.fieldByName('customers_city').AsString )) ;
               TCQDOCHEAD.FieldByName('WPostal3ID').AsInteger := AddMessage(trim(ZQOrders.fieldByName('customers_state').AsString)) ;
               TCQDOCHEAD.FieldByName('WPostalCodeID').AsInteger := AddMessage(ZQOrders.fieldByName('customers_postcode').AsString) ;
               TCQDOCHEAD.FieldByName('WPOSCOUNTRIES_ID').AsInteger :=  TDebtor.FieldByName('WPOSTCOUNTRIES_ID').AsInteger ;
               TCQDOCHEAD.FieldByName('WDelAddress1ID').AsInteger := AddMessage(ZQOrders.fieldByName('delivery_street_address').AsString) ;
               TCQDOCHEAD.FieldByName('WDelAddress2ID').AsInteger := AddMessage(Trim(ZQOrders.fieldByName('delivery_suburb').AsString + ' ' + ZQOrders.fieldByName('delivery_city').AsString)) ;
               TCQDOCHEAD.FieldByName('WDelAddress3ID').AsInteger := AddMessage(trim(ZQOrders.fieldByName('delivery_state').AsString )) ;
               TCQDOCHEAD.FieldByName('WDelCodeID').AsInteger := AddMessage(ZQOrders.fieldByName('delivery_postcode').AsString) ;
               TCQDOCHEAD.FieldByName('WDELCOUNTRIES_ID').AsInteger :=  TDebtor.FieldByName('WDELCOUNTRIES_ID').AsInteger ;
                 ZQOrderStatusHist.Close ;
                 if  ZQOrders.fieldByName('orders_id').asstring <> '' then
                  begin
                    FillCDSWithQuery(ZQOrderStatusHist,format(SQLOrderStatusHist.Text,[ZQOrders.fieldByName('orders_id').asstring]));
                   LineText := ZQOrderStatusHist.fieldByName('comments').Text ;
                   TCQDOCHEAD.FieldByName('WMessage1ID').AsInteger := AddMessage(Copy(LineText,1,TCQDESCRIPTIONSDescription.Size)) ;
                   delete(LineText,1,TCQDESCRIPTIONSDescription.Size);
                   TCQDOCHEAD.FieldByName('WMessage2ID').AsInteger := AddMessage(Copy(LineText,1,TCQDESCRIPTIONSDescription.Size)) ;
                   delete(LineText,1,TCQDESCRIPTIONSDescription.Size);
                   TCQDOCHEAD.FieldByName('WMessage3ID').AsInteger := AddMessage(Copy(LineText,1,TCQDESCRIPTIONSDescription.Size)) ;
                   ZQOrderStatusHist.Close ;
                    end ;

               if OSCLinks.CBImportAsQuote then
               TCQDOCHEAD.FieldByName('WTypeID').AsInteger := 14
               else
               TCQDOCHEAD.FieldByName('WTypeID').AsInteger := 10 ;
               if DMOSCommerceImport.AlternateWay = 0 then
               TCQDOCHEAD.FieldByName('BExclusive').AsInteger := 1
               else
               TCQDOCHEAD.FieldByName('BExclusive').AsInteger := 0 ;
               TCQDOCHEAD.FieldByName('WSalesmanID').AsInteger := 0 ;
               TCQDOCHEAD.FieldByName('WUserID').AsInteger := 0 ;
               TCQDOCHEAD.FieldByName('BPrinted').AsInteger := 0 ;
               TCQDOCHEAD.FieldByName('BPosted').AsInteger := 0 ;
               TCQDOCHEAD.FieldByName('BRepeating').AsInteger := 0 ;
               HandelXFields  ;
               TCQDOCHEAD.Post ;
               ZOrderProducts.Close ;
               ZQOrdersTotal.Close ;
                if ZQOrders.fieldByName('orders_id').asstring <> '' then
                FillCDSWithQuery(ZOrderProducts,format(SQLOrderProducts.Text,[ZQOrders.fieldByName('orders_id').asstring]));

                if ZQOrders.fieldByName('orders_id').asstring <> '' then
                FillCDSWithQuery(ZQOrdersTotal,format(SQLOrdersTotal.Text,[ZQOrders.fieldByName('orders_id').asstring]));

               ZOrderProducts.First ;
               TotalDoc := 0 ;
               TotalTax := 0 ;
               StockInHouse := true ;
               // Add doclines Stock should be synced with Syncstock or it can now add a item on the fly by calling Addstock with ID
               while not ZOrderProducts.eof do
                  begin

                         begin
                            inc(lineID) ;
                            TCQDOCLINE.Append ;
                            TCQDOCLINEWDocLineID.AsInteger := LineId ;
                            TCQDOCLINEWDocID.AsInteger :=  TCQDOCHEAD.FieldByName('WDocID').AsInteger ;
                         // No need for code link on SExtrenal
                         //   code := '' ;
                         //   if (AlternateWay = 0) and (not OSCLinks.UseStockIDOnly) then
                         //   Code := uppercase(ZOrderProducts.FieldByName('products_model').AsString) ;
                         //   if code = '' then
                         //      Code := FormatFloat(StockCodeMask,ZOrderProducts.FieldByName('products_id').AsInteger) ;
                         //   code := LeftStr(Code,15);
                              Code := IntToStr(ZOrderProducts.FieldByName('products_id').AsInteger) ;
                         // Find TC item
                          QStockItems.close ;
                          QStockItems.sql.Text := 'select * from stock where SEXTERNALID = :StockCode';
                          QStockItems.Params[0].AsString :=  Code ;
                          QStockItems.open ;
                           if QStockItems.IsEmpty then
                              begin
                                // Add one Stock item
                                FillCDSWithQuery(ZQProducts,format(SQLAllProds.Text+'  and ' + PREFIX +'products.products_id=' + IntToStr(ZOrderProducts.FieldByName('products_id').AsInteger),[IntToStr(OSCLinks.CBProductLang)])) ;
                                SyncStock ;
                                QStockItems.close ;
                                QStockItems.sql.Text := 'select * from stock where SEXTERNALID = :StockCode';
                                QStockItems.Params[0].AsString :=  Code ;
                                QStockItems.open ;
                                // If its empty now its deleted in OSC.
                                if QStockItems.IsEmpty then
                                    begin
                                    ZQProducts.Insert ;

                                    ZQProducts.FieldByName('products_model').AsString := 'DELETEDITEM' ;
                                    ZQProducts.FieldByName('products_id').ReadOnly := false ;
                                    ZQProducts.FieldByName('products_id').AsInteger := 99999999 ;
                                    ZQProducts.FieldByName('products_name').AsString := 'Deleted items' ;
                                    if ZQProducts.FindField('products_tax_class_id') <> nil then
                                    ZQProducts.FieldByName('products_tax_class_id').AsInteger := -1 ;
                                    if ZQProducts.FindField('products_ext_tax_id') <> nil then
                                    ZQProducts.FieldByName('products_ext_tax_id').AsInteger := -1 ;
                                    ZQProducts.FieldByName('products_price').AsFloat := 0 ;
                                    ZQProducts.FieldByName('products_quantity').AsInteger  := 0 ;

                                    SyncStock;
                                    QStockItems.close ;
                                    QStockItems.sql.Text := 'select * from stock where SStockCode = :StockCode';
                                    if (AlternateWay = 0) and (not OSCLinks.UseStockIDOnly) then
                                    QStockItems.Params[0].AsString :=  'DELETEDITEM' else
                                    QStockItems.Params[0].AsString := FormatFloat(StockCodeMask,ZQProducts.FieldByName('products_id').AsInteger);
                                    
                                    QStockItems.open ;
                                end;
                              end;
                            // Handel stock in house
                            if OSCLinks.UseInvoiceGroupSort then
                               begin
                                  StockQty := (((QStockItems.FieldByName('FQTYONHAND').AsFloat - TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases( QStockItems.FieldByName('WStockID').AsInteger,-1) - ZOrderProducts.FieldByName('products_quantity').AsFloat)) ) ;
                                 // raise Exception.Create(FloatToStr(StockQty) + );
                                  if  QStockItems.FieldByName('WSTOCKTYPEID').AsInteger = 0 then
                                    StockInHouse := StockInHouse and (StockQty >= 0)
                                end;
                            TCQDOCLINEWStockID.AsInteger := QStockItems.FieldByName('WStockID').AsInteger ;
                            TCQDOCLINESSTockCode.AsString := code ;

                            TCQDOCLINEWDescriptionID.AsInteger := AddMessage(QStockItems.FieldByName('SDescription').AsString) ;
                            TCQDOCLINEFQtyOrdered.AsFloat :=  ZOrderProducts.FieldByName('products_quantity').AsFloat ;
                            TCQDOCLINEFQtyShipped.AsFloat :=  ZOrderProducts.FieldByName('products_quantity').AsFloat ;
                            if OSCLinks.CBUSeTaxRatesFromOrderProduct then
                               begin
                                 TaxId := OSCLinks.FindTaxLinkOnRate(ZOrderProducts.FieldByName('products_tax').asfloat,true).FTCTaxID ;
                               end
                            else
                            TaxId := QStockItems.FieldByName('WOutputTaxID').AsInteger ;
                            if DMOSCommerceImport.AlternateWay = 0 then
                            begin
                            TCQDOCLINEWLineTypeID.AsInteger := 90 ;
                            TCQDOCLINEFInclusiveAmt.AsFloat :=  RoundAmount((ZOrderProducts.FieldByName('final_price').AsFloat *TCQDOCLINEFQtyOrdered.AsFloat) * (1+ GetTaxRate(TaxId)),DMOSCommerceImport.WDocRowDecimals ) ;
                            TCQDOCLINEFExclusiveAmt.AsFloat := RoundAmount((ZOrderProducts.FieldByName('final_price').AsFloat * TCQDOCLINEFQtyOrdered.AsFloat),DMOSCommerceImport.WDocRowDecimals)  ;
                            TCQDOCLINEFTaxAmount.AsFloat :=   RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat - TCQDOCLINEFExclusiveAmt.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFItemDiscount.AsFloat := 0 ;
                            TCQDOCLINEFSellingPrice.AsFloat :=  RoundAmount(ZOrderProducts.FieldByName('final_price').AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                            // Round Figures
                            if GetTaxRate(TaxId) = 0 then
                               begin
                               TCQDOCLINEFTaxAmount.AsFloat := 0 ;
                               if OSCLinks.CountiesList.Count <> 0 then
                                 begin
                                  TDebtor.edit ;
                                  TDebtor.fieldByName('WDefaultAccount').AsInteger := OSCLinks.FDefaultAccountDebtorNotInCountyList ;
                                  TDebtor.post ;
                                 end;
                               end;
                             end else
                            begin
                            TCQDOCLINEWLineTypeID.AsInteger := 94 ;
                            TCQDOCLINEFExclusiveAmt.AsFloat :=  RoundAmount((ZOrderProducts.FieldByName('final_price').AsFloat *TCQDOCLINEFQtyOrdered.AsFloat) / (1+ GetTaxRate(TaxId)),DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFTaxAmount.AsFloat :=  RoundAmount((ZOrderProducts.FieldByName('final_price').AsFloat * TCQDOCLINEFQtyOrdered.AsFloat) - TCQDOCLINEFExclusiveAmt.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFItemDiscount.AsFloat := 0 ;
                            TCQDOCLINEFInclusiveAmt.AsFloat :=  RoundAmount(TCQDOCLINEFExclusiveAmt.AsFloat + TCQDOCLINEFTaxAmount.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFSellingPrice.AsFloat :=  RoundAmount(ZOrderProducts.FieldByName('final_price').AsFloat,DMOSCommerceImport.WDocRowDecimals)  ;
                            // Round Figures
                            if GetTaxRate(TaxId) = 0 then
                               TCQDOCLINEFTaxAmount.AsFloat := 0 ;
                            end;

                            TotalDoc := TotalDoc + TCQDOCLINEFInclusiveAmt.AsFloat ;
                            TotalTax := TotalTax + TCQDOCLINEFTaxAmount.AsFloat ;
                            TCQDOCLINEWTaxID.AsInteger := TaxId ;
                            TCQDOCLINESSTockCode.AsString := Code ;
                            TCQDOCLINE.Post ;
                            // Import atibutes  as comments in to TC
                            if OSCLinks.CBImportItemAttributesAsComment then
                              begin
                                 ZQOrdersOptions.close ;
                                 FillCDSWithQuery(ZQOrdersOptions,format(SQLOrdersOptions.Text,[ZOrderProducts.FieldByName('orders_id').asstring,ZOrderProducts.FieldByName('orders_products_id').asstring]));
                                 LineText := '' ;
                                  while not ZQOrdersOptions.eof do
                                     begin
                                      LineText := ZQOrdersOptions.FieldByName('products_options').AsString + ' : ' + ZQOrdersOptions.FieldByName('products_options_values').AsString ;
                                      if LineText <> '' then
                                        begin
                                          inc(lineID) ;
                                          TCQDOCLINE.Append ;
                                          TCQDOCLINEWDocLineID.AsInteger := LineId ;
                                          TCQDOCLINEWStockID.AsInteger := QStockItems.FieldByName('WStockID').AsInteger ;
                                          TCQDOCLINESSTockCode.AsString := '' ;
                                          TCQDOCLINEWDocID.AsInteger := TCQDOCHEAD.FieldByName('WDocID').AsInteger ;
                                          TCQDOCLINEWLineTypeID.AsInteger := 91 ;
                                          TCQDOCLINEWDescriptionID.AsInteger := AddMessage(LineText);
                                          TCQDOCLINE.Post ;
                                        end;
                                      ZQOrdersOptions.Next ;
                                     end;
                                 ZQOrdersOptions.close ;

                              end;
                        end ; // end if value <> 0
                    ZOrderProducts.next ;
                  end;
                // get total discount/
                ZQOrdersTotal.First ;
                NewTotalDoc := 0 ;
                TotalDiscount := 0 ;
                // OT Discount deducted from items
                while not ZQOrdersTotal.Eof do
                  begin
                   // look for the total to
                  if ZQOrdersTotal.fieldByName('class').AsString = 'ot_total' then
                           NewTotalDoc :=  ZQOrdersTotal.fieldByName('value').AsFloat ;
                    if OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString) <> nil then
                      if OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FOSCTaxId = ord(otoDISCOUNT) then
                       begin
                         if not OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FExclusive then
                          TotalDiscount := TotalDiscount + abs(ZQOrdersTotal.fieldByName('value').AsFloat)
                          else
                          begin
                            TotalDiscount := TotalDiscount + abs(ZQOrdersTotal.fieldByName('value').AsFloat) * (1+ GetTaxRate(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).TCTaxID));
                          end;
                       end;
                    ZQOrdersTotal.Next ;
                  end;
                TCQDOCLINE.First ;
                // reclac discount
                if  TotalDiscount <> 0 then
                begin
                PercentageDiscount := (TotalDiscount / (totalDoc / 100)) /100   ;
                TotalDoc := 0;
                TotalTax := 0;

                while not TCQDOCLINE.eof do
                  begin
                    if (TCQDOCLINEWLineTypeID.AsInteger in [90,94]) then
                       begin
                            // edit all lines wi
                            TCQDOCLINE.Edit ;
                            TCQDOCLINEFInclusiveAmt.AsFloat :=    RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat - (TCQDOCLINEFInclusiveAmt.AsFloat * PercentageDiscount),DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFTaxAmount.AsFloat    :=   RoundAmount(TCQDOCLINEFTaxAmount.AsFloat - (TCQDOCLINEFTaxAmount.AsFloat *  PercentageDiscount),DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFSellingPrice.AsFloat :=   RoundAmount(TCQDOCLINEFSellingPrice.AsFloat - (TCQDOCLINEFSellingPrice.AsFloat *  PercentageDiscount),DMOSCommerceImport.WDocRowDecimals) ;
                            TCQDOCLINEFTaxAmount.AsFloat := RoundAmount(TCQDOCLINEFTaxAmount.AsFloat);

                            if GetTaxRate(TCQDOCLINEWTaxID.AsInteger) = 0 then
                               TCQDOCLINEFTaxAmount.AsFloat := 0 ;
                            TCQDOCLINEFExclusiveAmt.AsFloat :=  RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat -  TCQDOCLINEFTaxAmount.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;


                            TotalDoc := TotalDoc +        TCQDOCLINEFInclusiveAmt.AsFloat ;
                            TotalTax := TotalTax +        TCQDOCLINEFTaxAmount.AsFloat ;
                            TCQDOCLINE.Post ;
                       end;
                     TCQDOCLINE.next ;
                  end;
                end;   // end discount
                ZQOrdersTotal.First ;
                while not ZQOrdersTotal.Eof do
                  begin
                   if OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString) <> nil then
                    if OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FOSCTaxId = ord(otoPRODUCT) then
                    begin
                        inc(lineID) ;
                        TCQDOCLINE.Append ;
                        TCQDOCLINEWDocLineID.AsInteger := LineId ;
                        TCQDOCLINEWDocID.AsInteger :=TCQDOCHEAD.FieldByName('WDocID').AsInteger ;
                        Code := OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).OSCTaxName ; //FormatFloat(CodeMask,ZQProductsproducts_id.AsInteger) ;
                        Code := UPPERCASE(LeftStr(Code,StockLength));
                        QStockItems.close ;
                        QStockItems.sql.Text := 'select * from stock where SStockCode = :StockCode';
                        QStockItems.Params[0].AsString :=    Code ;
                        QStockItems.open ;
                         if QStockItems.IsEmpty then
                          begin
                            QStockItems.Insert ;
                            QStockItems.FieldByName('SStockCode').AsString  := copy(UPPERCASE(ZQOrdersTotal.fieldByName('class').AsString),1,StockLength);
                            QStockItems.FieldByName('SDescription').AsString := copy(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FOSCTaxDesc,1,DMTCCoreLink.MessageLength);
                          end;
                        TCQDOCLINEWStockID.AsInteger := QStockItems.FieldByName('WStockID').AsInteger ;
                        TCQDOCLINEWDescriptionID.AsInteger := AddMessage(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FOSCTaxDesc);
                        TCQDOCLINEFQtyOrdered.AsFloat :=  1 ;
                        TCQDOCLINEFQtyShipped.AsFloat :=  1 ;
                        TCQDOCLINEFItemDiscount.AsFloat := 0 ;
                        if AlternateWay = 0 then TCQDOCLINEWLineTypeID.AsInteger := 90 else
                        TCQDOCLINEWLineTypeID.AsInteger := 94 ;
                        TCQDOCLINEWTaxID.AsInteger :=  OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).TCTaxID ;
                        if not OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).FExclusive then
                         begin
                          TCQDOCLINEFExclusiveAmt.AsFloat :=  RoundAmount(ZQOrdersTotal.fieldByName('value').AsFloat,DMOSCommerceImport.WDocRowDecimals) ; // / (1+GetTaxRate(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).TCTaxID))) ;
                          TCQDOCLINEFInclusiveAmt.AsFloat :=  RoundAmount(ZQOrdersTotal.fieldByName('value').AsFloat * (1+GetTaxRate(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).TCTaxID)),DMOSCommerceImport.WDocRowDecimals) ;
                          TCQDOCLINEFTaxAmount.AsFloat :=  RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat - TCQDOCLINEFExclusiveAmt.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                         end else
                         begin
                          TCQDOCLINEFExclusiveAmt.AsFloat :=  RoundAmount(ZQOrdersTotal.fieldByName('value').AsFloat / (1+GetTaxRate(OSCLinks.FindOTLink(ZQOrdersTotal.fieldByName('class').AsString).TCTaxID)),DMOSCommerceImport.WDocRowDecimals) ;
                          TCQDOCLINEFTaxAmount.AsFloat    :=  RoundAmount(ZQOrdersTotal.fieldByName('value').AsFloat - TCQDOCLINEFExclusiveAmt.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                          TCQDOCLINEFInclusiveAmt.AsFloat :=  RoundAmount(TCQDOCLINEFExclusiveAmt.AsFloat + TCQDOCLINEFTaxAmount.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                         end;
                         if AlternateWay = 0 then
                         TCQDOCLINEFSellingPrice.AsFloat := TCQDOCLINEFExclusiveAmt.AsFloat
                         else
                         TCQDOCLINEFSellingPrice.AsFloat := TCQDOCLINEFInclusiveAmt.AsFloat ;
                         if GetTaxRate(TCQDOCLINEWTaxID.AsInteger) = 0 then
                            TCQDOCLINEFTaxAmount.AsFloat := 0 ;
                        TotalDoc := TotalDoc + TCQDOCLINEFInclusiveAmt.AsFloat ;
                        TotalTax := TotalTax + TCQDOCLINEFTaxAmount.AsFloat ;
                        TCQDOCLINEWTaxID.AsInteger := QStockItems.FieldByName('WOutputTaxID').AsInteger ;
                        TCQDOCLINESSTockCode.AsString := QStockItems.FieldByName('SStockCode').asstring ;
                        TCQDOCLINE.Post ;
                     end;
                    ZQOrdersTotal.Next ;
                  end;
                if (round(NewTotalDoc*100) <> round(TotalDoc*100)) then
                  begin
                    TCQDOCLINE.First ;
                    while not TCQDOCLINE.eof do
                      begin
                        if (TCQDOCLINEWLineTypeID.AsInteger in [90,94]) then
                           begin
                               TCQDOCLINE.Edit ;
                               // TotalTax := TotalTax -  TCQDOCLINEFTaxAmount.AsFloat ;
                                if  TCQDOCLINEWLineTypeID.AsInteger = 90 then
                                 begin
                                  TCQDOCLINEFInclusiveAmt.AsFloat :=    RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat +  (NewTotalDoc - TotalDoc),DMOSCommerceImport.WDocRowDecimals);
                                  TCQDOCLINEFExclusiveAmt.AsFloat :=    RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat / ( 1 + GetTaxRate(TCQDOCLINEWTaxID.AsInteger)),DMOSCommerceImport.WDocRowDecimals) ;
                                  TCQDOCLINEFTaxAmount.AsFloat    :=   RoundAmount((TCQDOCLINEFInclusiveAmt.AsFloat - TCQDOCLINEFExclusiveAmt.AsFloat),DMOSCommerceImport.WDocRowDecimals) ;
                                  TCQDOCLINEFSellingPrice.AsFloat := RoundAmount(TCQDOCLINEFExclusiveAmt.AsFloat / TCQDOCLINEFQtyShipped.AsFloat,DMOSCommerceImport.WDocRowDecimals)
                                 end else
                                 begin
                                  TCQDOCLINEFInclusiveAmt.AsFloat :=    RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat +  (NewTotalDoc - TotalDoc),DMOSCommerceImport.WDocRowDecimals);
                                  TCQDOCLINEFExclusiveAmt.AsFloat :=    RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat / ( 1 + GetTaxRate(TCQDOCLINEWTaxID.AsInteger)),DMOSCommerceImport.WDocRowDecimals) ;
                                  TCQDOCLINEFTaxAmount.AsFloat    :=   RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat - TCQDOCLINEFExclusiveAmt.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                                  TCQDOCLINEFSellingPrice.AsFloat := RoundAmount(TCQDOCLINEFInclusiveAmt.AsFloat / TCQDOCLINEFQtyShipped.AsFloat,DMOSCommerceImport.WDocRowDecimals) ;
                                 end;
                                 if GetTaxRate(TCQDOCLINEWTaxID.AsInteger) = 0 then
                                     TCQDOCLINEFTaxAmount.AsFloat := 0 ;
                                TCQDOCLINE.Post ;
                                //TotalTax := TotalTax +  TCQDOCLINEFTaxAmount.AsFloat ;
                                //TotalDoc := NewTotalDoc ;
                                Break ;
                            end;
                         TCQDOCLINE.next ;
                      end;
                  end;
   TotalTax := 0 ;
   TotalDoc :=  0 ;
   TCQDOCLINE.First ;
                    while not TCQDOCLINE.eof do
                      begin
                        if (TCQDOCLINEWLineTypeID.AsInteger in [90,94]) then
                           begin
                                TotalTax :=  TotalTax +TCQDOCLINEFTaxAmount.AsFloat ;
                                TotalDoc :=  TotalDoc + TCQDOCLINEFInclusiveAmt.AsFloat ;
                            end;
                         TCQDOCLINE.next ;
                      end;
                // add payment methode
                if ZQOrders.fieldByName('payment_method').AsString <> '' then
                begin
                inc(lineID) ;
                TCQDOCLINE.Append ;
                TCQDOCLINEWDocLineID.AsInteger := LineId ;
                TCQDOCLINEWDocID.AsInteger := TCQDOCHEAD.FieldByName('WDocID').AsInteger ;
                TCQDOCLINEWLineTypeID.AsInteger := 91 ;
                TCQDOCLINEWDescriptionID.AsInteger := AddMessage(ZQOrders.fieldByName('payment_method').AsString);
                TCQDOCLINE.Post ;
                end;

                TCQDOCHEAD.Edit ;
                TCQDOCHEAD.FieldByName('FDocAmount').AsFloat := RoundAmount(TotalDoc,DMOSCommerceImport.WDataEntryNbrQty) ;
                TCQDOCHEAD.FieldByName('FTaxAmount').AsFloat := RoundAmount(TotalTax,DMOSCommerceImport.WDataEntryNbrQty)  ;
                if OSCLinks.UseInvoiceGroupSort then
                   begin
                    if StockInHouse then
                     TCQDOCHEAD.FieldByName('WREPORTINGGROUP2ID').AsInteger := OSCLinks.DocGroupStockAvail
                     else
                     TCQDOCHEAD.FieldByName('WREPORTINGGROUP2ID').AsInteger := OSCLinks.DocGroupStockNotAvail ;
                   end;
                HandelXFields ;   
                TCQDOCHEAD.Post ;


               end else // end doc found
               begin
                 // update reporting group 1
                  if OSCLinks.UseDocReportingGroup1 then
                    begin
                      TCQDOCHEAD.Edit ;
                      if ZStatus.Locate('orders_status_id',ZQOrders.fieldByName('orders_status').AsString,[]) then
                         TCQDOCHEAD.FieldByName('WREPORTINGGROUP1ID').AsInteger := GetAddDocReportinggroup(ZStatus.FieldByName('orders_status_name').AsString);
                      TCQDOCHEAD.Post ;
                    end;
               end;
         end ; // end locate account
       ZQOrders.Next ;
       if TCQDOCHEAD.UpdatesPending then
          TCQDOCHEAD.ApplyUpdates ;
       if TCQDOCLINE.UpdatesPending then
          TCQDOCLINE.ApplyUpdates ;
       DMTCCoreLink.TheZConnection.Commit ;
       finally
         if DMTCCoreLink.TheZConnection.InTransaction then
           DMTCCoreLink.TheZConnection.Rollback ;
       end;
    end;
 finally
  ZQOrders.first ;
  ZQOrders.EnableControls ;
  ZQOrders.AfterOpen := ZQOrdersAfterScroll ;
  ZQOrders.AfterScroll := ZQOrdersAfterScroll ;
 end;
end;

procedure TDMOSCommerceImport.SyncCustomers;
 procedure HandelXFields ;
 var
  I : Integer ;
 begin
   for i := 0 to TDebtor.FieldCount -1 do
     begin
       if POS('X_',UpperCase(TDebtor.Fields[i].FieldName)) = 1 then
         begin
           if ZQOrders.FindField(copy(TDebtor.Fields[i].FieldName,3,255)) <> nil then
              TDebtor.Fields[i].Value := ZQOrders.FindField(copy(TDebtor.Fields[i].FieldName,3,255)).Value ;
         end;
     end;
 end;
var
 // I : Integer ;
 CodeMask,Code : String ;
 Stop : Boolean ;
begin
 Stop := false ;
 ZQOrders.DisableControls ;
 ZQOrders.AfterOpen := nil ;
 ZQOrders.AfterScroll := nil ;
 try
 CodeMask := LeftStr(OSCLinks.ECustomerPRefix+'0000000000000',AccountCodeLength+3) ;
 ZCountries.open ;
 QGen.close ;
 TAccounts.open ;
 TDebtor.Close ;
 TDebtor.open ;
 // TDatabaseTableRoutines.UpdateQuery(TDebtor,'DEBTOR','WACCOUNTID');
 TCTotals.Open ;
  ZQOrders.First ;
  while not ZQOrders.Eof do
    begin
     if assigned(FUpdateEventNotify) then
        FUpdateEventNotify(0,ZQOrders.RecordCount,ZQOrders.RecNo,'Customers',true,Stop);

      if stop then raise Exception.Create('Stopt by user!');
      Code := copy(FormatFloat(CodeMask,ZQOrders.fieldByName('customers_id').AsInteger),1,DMTCCoreLink.MainAccountLength +3 ) ;

       if TAccounts.Locate('SACCOUNTCODE',Code,[]) then
         begin

           TDebtor.Locate('WAccountID',TAccounts.FieldByName('WAccountID').AsInteger,[]) ;
          if not (Length(OSCLinks.ECustomerPRefix) >= AccountCodeLength+3 ) then
           begin

           TDebtor.Edit ;
           TAccounts.edit ;
           if ZQOrders.fieldByName('customers_company').AsString  <> '' then
            begin
              TAccounts.FieldByName('SDescription').AsString := trim(ZQOrders.fieldByName('customers_company').AsString) ;
              TDebtor.fieldByName('SMESSAGE').AsString :=  ZQOrders.fieldByName('customers_name').AsString ;
            end else
            begin
               TAccounts.FieldByName('SDescription').AsString := trim(ZQOrders.fieldByName('customers_name').AsString) ;
            end;

           TDebtor.fieldByName('SPostal1').AsString :=    ZQOrders.fieldByName('customers_street_address').AsString ;
           TDebtor.fieldByName('SPostal2').AsString :=  trim(ZQOrders.fieldByName('customers_suburb').AsString + ' ' + ZQOrders.fieldByName('customers_city').AsString)  ;
           TDebtor.fieldByName('SPostal3').AsString :=  trim(ZQOrders.fieldByName('customers_state').AsString ) ;
           TDebtor.fieldByName('SPostalCode').AsString :=  ZQOrders.fieldByName('customers_postcode').AsString ;
           if ZCountries.Locate('COUNTRIES_NAME',ZQOrders.fieldByName('customers_country').AsString,[]) then
               begin
                  TDebtor.fieldByName('WPOSTCOUNTRIES_ID').AsInteger := ZCountriesCOUNTRIES_ID.AsInteger ;
               end;
           TDebtor.fieldByName('STelephone1').AsString :=  ZQOrders.fieldByName('customers_telephone').AsString ;
           TDebtor.fieldByName('SEmail').AsString :=  ZQOrders.fieldByName('customers_email_address').AsString ;
           TDebtor.fieldByName('SDelivery1').AsString :=    trim(ZQOrders.fieldByName('delivery_street_address').AsString) ;
           TDebtor.fieldByName('SDelivery2').AsString :=  trim(ZQOrders.fieldByName('delivery_suburb').AsString + ' ' + ZQOrders.fieldByName('delivery_city').AsString) ;
           TDebtor.fieldByName('SDelivery3').AsString :=  trim(ZQOrders.fieldByName('delivery_state').AsString ) ;
           TDebtor.fieldByName('SDeliveryCode').AsString  :=  ZQOrders.fieldByName('delivery_postcode').AsString ;
           if ZCountries.Locate('COUNTRIES_NAME',ZQOrders.fieldByName('delivery_country').AsString,[]) then
               begin
                  TDebtor.fieldByName('WDELCOUNTRIES_ID').AsInteger := ZCountriesCOUNTRIES_ID.AsInteger ;
               end;

           TDebtor.fieldByName('BOpenItem').AsInteger := 1 ;
           if OSCLinks.CountiesList.Count <> 0 then
             begin
                  if OSCLinks.CountiesList.IndexOf(ZQOrders.fieldByName('customers_country').AsString) = -1 then
                  begin
                    TDebtor.fieldByName('WDefaultAccount').AsInteger := OSCLinks.DefaultAccountDebtorNotInCountyList ;
                  end;
             end;
           HandelXFields ;
           TDebtor.post ;
           TAccounts.Post ;
           end; // Edit if not account code prefix = maxlengt
         end else
         begin
           TAccounts.Insert ;
           TDebtor.Insert ;
           TAccounts.FieldByName('WAccountID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWACCOUNTID) ;
           TDebtor.fieldByName('WAccountID').AsInteger := TAccounts.FieldByName('WAccountID').AsInteger ;
           TAccounts.FieldByName('WAccountTypeID').AsInteger := 1 ;
           if ZQOrders.fieldByName('customers_company').AsString  <> '' then
            begin
              TAccounts.FieldByName('SDescription').AsString := trim(ZQOrders.fieldByName('customers_company').AsString) ;
              TDebtor.fieldByName('SMESSAGE').AsString :=  ZQOrders.fieldByName('customers_name').AsString ;
            end else
            begin
               TAccounts.FieldByName('SDescription').AsString := trim(ZQOrders.fieldByName('customers_name').AsString) ;
            end;
           TAccounts.FieldByName('SSubAccountCode').AsString := RightStr(Code,3) ;
           TAccounts.FieldByName('SMainAccountCode').AsString := LeftStr(Code,AccountCodeLength) ;
           TAccounts.FieldByName('SAccountCode').AsString := Code ;
           TAccounts.FieldByName('WREPORTINGGROUP1ID').AsInteger := 0 ;
           TAccounts.FieldByName('WREPORTINGGROUP2ID').AsInteger := 0 ;
           TAccounts.FieldByName('BSUBACCOUNTS').AsInteger := 0 ;
           TAccounts.FieldByName('BINCOMEEXPENSE').AsInteger := 0 ;
           TAccounts.FieldByName('BOPENITEM').AsInteger := 1 ;
           

           TDebtor.fieldByName('SPostal1').AsString :=    ZQOrders.fieldByName('customers_street_address').AsString ;
           TDebtor.fieldByName('SPostal2').AsString :=  trim(ZQOrders.fieldByName('customers_suburb').AsString + ' ' + ZQOrders.fieldByName('customers_city').AsString)  ;
           TDebtor.fieldByName('SPostal3').AsString :=  trim(ZQOrders.fieldByName('customers_state').AsString) ;
           TDebtor.fieldByName('SPostalCode').AsString :=  ZQOrders.fieldByName('customers_postcode').AsString ;
           if ZCountries.Locate('COUNTRIES_NAME',ZQOrders.fieldByName('customers_country').AsString,[]) then
               begin
                  TDebtor.fieldByName('WPOSTCOUNTRIES_ID').AsInteger := ZCountriesCOUNTRIES_ID.AsInteger ;
               end;
           TDebtor.fieldByName('STelephone1').AsString :=  ZQOrders.fieldByName('customers_telephone').AsString ;
           TDebtor.fieldByName('SEmail').AsString :=  ZQOrders.fieldByName('customers_email_address').AsString ;
           TDebtor.fieldByName('SDelivery1').AsString :=    trim(ZQOrders.fieldByName('delivery_street_address').AsString) ;
           TDebtor.fieldByName('SDelivery2').AsString :=  trim(ZQOrders.fieldByName('delivery_suburb').AsString + ' ' + ZQOrders.fieldByName('delivery_city').AsString) ;
           TDebtor.fieldByName('SDelivery3').AsString :=  trim(ZQOrders.fieldByName('delivery_state').AsString) ;
           TDebtor.fieldByName('SDeliveryCode').AsString  :=  ZQOrders.fieldByName('delivery_postcode').AsString ;
           if ZCountries.Locate('COUNTRIES_NAME',ZQOrders.fieldByName('delivery_country').AsString,[]) then
               begin
                  TDebtor.fieldByName('WDELCOUNTRIES_ID').AsInteger := ZCountriesCOUNTRIES_ID.AsInteger ;
               end;

           TDebtor.fieldByName('BOpenItem').AsInteger := 1 ;
           if OSCLinks.CountiesList.Count <> 0 then
             begin
                if OSCLinks.CountiesList.IndexOf(ZQOrders.fieldByName('customers_country').AsString) = -1 then
                  begin
                    TDebtor.fieldByName('WDefaultAccount').AsInteger := OSCLinks.DefaultAccountDebtorNotInCountyList ;
                  end;
             end;
           TDebtor.FieldByName('WDEFAULTACCOUNT').AsInteger := 0 ;
           TDebtor.FieldByName('WDEFAULTTAX').AsInteger := 0 ;
           HandelXFields ;
           TAccounts.Post ;
           TDebtor.Post ;
           CreateTotals(TDebtor.fieldByName('WACCOUNTID').AsInteger);

          end;
       ZQOrders.Next ;
    end;



 TAccounts.close ;
 TDebtor.close ;
 TCTotals.close ;
 ZCountries.close ;
 finally
 ZQOrders.EnableControls ;
 ZQOrders.AfterOpen := ZQOrdersAfterScroll ;
 ZQOrders.AfterScroll := ZQOrdersAfterScroll ;

 end;
end;
procedure TDMOSCommerceImport.InitAccountCodeLength;

begin
QAccountCodeLength.Open ;
AccountCodeLength := QAccountCodeLength.Fields[0].Size ;
QAccountCodeLength.Close ;
end;

procedure TDMOSCommerceImport.SetAccountCodeLength(const Value: Integer);
begin
  FAccountCodeLength := Value;
end;

function TDMOSCommerceImport.IsDateTimeBigger(AOldDateTime,
  ANewDatetime : TDateTime): Boolean;
 var
 OldTime,NEwTime : Double ;
begin
 if Round(AOldDateTime) <> round(ANewDatetime) then
   result := (AOldDateTime < ANewDatetime)
   else
   begin
     OldTime :=  AOldDateTime -round(AOldDateTime);
     NEwTime :=  ANewDatetime -round(ANewDatetime);
     OldTime :=  OldTime * 100000 ;
     NEwTime :=    NEwTime * 100000 ;
     result :=  (OldTime < Newtime)
   end;

end;

procedure TDMOSCommerceImport.CloseConnection;
var
 i : Integer ;
begin
 for i := 0 to ComponentCount -1 do
    begin
       if Components[i] is TuniTable then
          (Components[i] as TuniTable).Active := false ;
       if Components[i] is TuniQuery then
          (Components[i] as TuniQuery).Active := false ;
    end;
end;

procedure TDMOSCommerceImport.SetUpdateEventNotify(
  const Value: TUpdateEventNotify);
begin
  FUpdateEventNotify := Value;
end;

procedure TDMOSCommerceImport.ReSyncOSCWithTCStock(DoAll :Boolean);
var
 Stop : Boolean ;
 CodeMask : String ;
 i : Integer ;
begin
  StockLength := DMTCCoreLink.GetFieldLength('STOCK','SSTOCKCODE') ;
  Stock0String := '' ;
  for i := 0 to StockLength do
      Stock0String := Stock0String + '0';


  // todo : Check this algorithm.
  // Done : Working on external id
  CodeMask :=  LeftStr(OSCLinks.EStockCodePrefix+Stock0String,StockLength) ;
  QStockItems.close ;
  if DoAll then
  QStockItems.sql.Text := 'select * from stock where (SEXTERNALID <> ' + QuotedStr('') + ' and SEXTERNALID is not null) '
  else
  QStockItems.sql.Text := 'select * from stock where (SEXTERNALID <> ' + QuotedStr('') + ' and SEXTERNALID is not null) ' +
  ' and   (WStockId in (Select WStockId from docline join dochead on docline.WDocid = dochead.WDocid where dochead.Bposted = 0) or (stock.dsysdate <= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(GlToDate) + ' and stock.dsysdate >= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(GlFromDate)+'))'  ;
  QStockItems.open ;


  while not QStockItems.eof do
    begin
     if assigned(FUpdateEventNotify) then
        FUpdateEventNotify(0,QStockItems.RecordCount,QStockItems.RecNo,'Resync stock',true,Stop);
      if stop then raise Exception.Create('Stopt by user!');


      if not QStockItems.IsEmpty then
        begin
             ExecSql(format(SQLUpdateStock.Text,[StringReplace(floattostr(QStockItems.FieldByName('FQtyOnHand').AsFloat - TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases(QStockItems.fieldByName('WStockId').ASinteger,-1) ),DecimalSeparator,'.',[rfReplaceAll]),QStockItems.FieldByName('SEXTERNALID').asstring]));
        end;
      QStockItems.Next ;
    end;
end;

function TDMOSCommerceImport.GetTaxRate(AtaxID: Integer): Double;
begin
 Result := 0 ;
 TCTax.Open ;
 if TCTax.Locate('WAccountID',AtaxID,[]) then
 Result :=  TCTaxFRate.AsFloat / 100 ;
end;

procedure TDMOSCommerceImport.SetLoginIndex(const Value: Integer);
begin
  FLoginIndex := Value;
end;

procedure TDMOSCommerceImport.SetSQLAllProds(const Value: TStringList);
begin
  FSQLAllProds := Value;
end;

procedure TDMOSCommerceImport.SetSQLCurrencies(const Value: TStringList);
begin
  FSQLCurrencies := Value;
end;

procedure TDMOSCommerceImport.SetSQLLanguage(const Value: TStringList);
begin
  FSQLLanguage := Value;
end;

procedure TDMOSCommerceImport.SetSQLOptions(const Value: TStringList);
begin
  FSQLOptions := Value;
end;

procedure TDMOSCommerceImport.SetSQLOrderProducts(
  const Value: TStringList);
begin
  FSQLOrderProducts := Value;
end;

procedure TDMOSCommerceImport.SetSQLOrders(const Value: TStringList);
begin
  FSQLOrders := Value;
end;

procedure TDMOSCommerceImport.SetSQLOrdersOptions(
  const Value: TStringList);
begin
  FSQLOrdersOptions := Value;
end;

procedure TDMOSCommerceImport.SetSQLOrderStatusHist(
  const Value: TStringList);
begin
  FSQLOrderStatusHist := Value;
end;

procedure TDMOSCommerceImport.SetSQLOrdersTotal(const Value: TStringList);
begin
  FSQLOrdersTotal := Value;
end;

procedure TDMOSCommerceImport.SetSQLProducts(const Value: TStringList);
begin
  FSQLProducts := Value;
end;

procedure TDMOSCommerceImport.SetSQLStatus(const Value: TStringList);
begin
  FSQLStatus := Value;
end;

procedure TDMOSCommerceImport.SetSQLUniqueTaxCode(
  const Value: TStringList);
begin
  FSQLUniqueTaxCode := Value;
end;

procedure TDMOSCommerceImport.SetSQLUpdateStock(const Value: TStringList);
begin
  FSQLUpdateStock := Value;
end;

procedure TDMOSCommerceImport.FillCDSWithQuery(ACDS: TVirtualTable;
  ASQL: String);
  Var AMessage : String ;
  Filename: String ;
  AStream:TFileStream ;
  AChar : Char ;
  i : Integer ;
begin
Screen.Cursor := -11;
try
if usedebug then
 DebugString := DebugString + #13 + 'OpenSQL ' + ACDS.Name + #13 + ASQL ;
IdHTTP1.Disconnect ;
IdHTTP1.Request.Username := Username ;
IdHTTP1.Request.Password := Password ;
IdHTTP1.Request.BasicAuthentication := IdHTTP1.Request.Password <> '';
//IdHTTP1.Request.KeepAlive := true ;
ASQL := StringReplace(ASQL,#13#10,' ',[rfReplaceAll]);
Filename :=   ExtractFilePath(Application.ExeName)+'DL'{+FormatDatetime('hhnnss',now)} +ACDS.Name+'.xml' ;
AStream := TFileStream.Create(Filename,fmCreate	) ;
try
IdHTTP1.Get(RemoteURL+'?sql=' +URLEncode(ASQL),AStream  ) ;
AStream.Position := 0 ;
AMessage := '' ;
for i :=  0 to 20 do
  begin
    AStream.Read(AChar,1);
    AMessage := AMessage +  AChar ;
  end;
if pos('<RESULT>',AMessage) <> 0 then
  begin
      AStream.Position := 0 ;
      AMessage :=  '' ;
      while AStream.Position < AStream.Size do
        begin
          AStream.Read(AChar,1);
          AMessage := AMessage +  AChar ;
        end;
  end;
finally
  AStream.free ;
end;
if pos('<RESULT>',AMessage) <> 0 then
  raise Exception.create(AMessage);
 try
  LoadXMLFromFile(Filename,ACDS,False);
 
 except
  on e : Exception do
     raise Exception.create(e.Message + #10#13 + AMessage);
 end;
 finally
  Screen.Cursor := 0;
 end;

end;

procedure TDMOSCommerceImport.SetRemoteURL(const Value: String);
begin
  FRemoteURL := Value;
end;

procedure TDMOSCommerceImport.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TDMOSCommerceImport.SetRememberPassword(const Value: Boolean);
begin
  FRememberPassword := Value;
end;

procedure TDMOSCommerceImport.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

procedure TDMOSCommerceImport.SetLoggedIn(const Value: Boolean);
begin
  FLoggedIn := Value;
end;

function TDMOSCommerceImport.CheckLogin: Boolean;
begin
 result := true ;
 try
 FillCDSWithQuery(ZStatus,SQLCheckOnline.Text) ;
 except
   result := False ;
 end;

end;

function TDMOSCommerceImport.DateTOMYSQLDate(ADatetime: TDateTime): String;
begin
 // date time
 if DateTimeFormat = 'NR' then
      begin
        result := 'CAST(' + FormatDateTime('YYYYMMDDHHNNSS',ADatetime) + ' as datetime)';
        exit ;
      end;
 if (ADatetime - round(ADatetime)) <> 0 then
   begin
      result := FormatDateTime(DateTimeFormat,ADatetime) ;
   end else
   // no datetime
   begin
      result := FormatDateTime(DateFormat,ADatetime) ;
   end;
end;

procedure TDMOSCommerceImport.SetDateFormat(const Value: String);
begin
  FDateFormat := Value;
end;

procedure TDMOSCommerceImport.SetDateTimeFormat(const Value: String);
begin
  FDateTimeFormat := Value;
end;

procedure TDMOSCommerceImport.SetSQLCheckOnline(const Value: TStringList);
begin
  FSQLCheckOnline := Value;
end;

procedure TDMOSCommerceImport.SetPREFIX(const Value: String);
begin
  FPREFIX := Value;
end;

procedure TDMOSCommerceImport.SetLoginName(const Value: String);
begin
  FLoginName := Value;
end;

procedure TDMOSCommerceImport.LoadIni(LoadDefault : Boolean );
var
 AList : TStringlist ;
 APreFix : String ;
begin
 if FileExists(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini') then
   begin
     AList := TStringlist.create ;
      try
         AList.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini');
         APreFix := '' ;
         if LoadDefault then
          if AList.Values['LoginIndex'] <> '' then
             DMOSCommerceImport.LoginIndex :=  StrTOInt(AList.Values['LoginIndex']);
             
         if DMOSCommerceImport.LoginIndex <> 0 then
         APreFix := IntToStr(DMOSCommerceImport.LoginIndex) ;

         DMOSCommerceImport.Username :=  AList.Values[APreFix+'Username'] ;
         DMOSCommerceImport.RemoteURL :=  AList.Values[APreFix+'Database'] ;
         if  AList.Values[APreFix+'DateFormat'] <> '' then
         DMOSCommerceImport.DateFormat := AList.Values[APreFix+'DateFormat'] ;
         if  AList.Values[APreFix+'DateTimeFormat'] <> '' then
         DMOSCommerceImport.DateTimeFormat := AList.Values[APreFix+'DateTimeFormat'] ;
         DMOSCommerceImport.LoginName := AList.Values[APreFix+'Loginname'] ;
         if  AList.Values[APreFix+'TaxType'] <> '' then
             DMOSCommerceImport.AlternateWay :=  StrToInt(AList.Values[APreFix+'TaxType']) ;

         DMOSCommerceImport.RememberPassword := false ;
         if (AList.Values[APreFix+'RememberPassword']) = 'TRUE' then
           begin
             DMOSCommerceImport.Password :=  AList.Values[APreFix+'Password'] ;
             DMOSCommerceImport.RememberPassword := true ; ;
           end;
       DMOSCommerceImport.LoginName := AList.Values[APreFix+'Loginname'] ;
       DMOSCommerceImport.PREFIX := AList.Values[APreFix+'PREFIX']  ;

       DMOSCommerceImport.SqlFolder := AList.Values[APreFix+'sqlfolder']  ;

      finally
        AList.free ;
      end;
   end;
end;

procedure TDMOSCommerceImport.SaveIni(Delete : Boolean = false);
var
 AList : TStringlist ;
 APreFix : String ;
begin
     AList := TStringlist.create ;
      try

       if FileExists(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini') then
         AList.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini');
       APreFix := '' ;
        AList.Values['LoginIndex'] := '' ;
       if DMOSCommerceImport.LoginIndex > 0 then
        begin
        AList.Values['LoginIndex'] := IntToStr(DMOSCommerceImport.LoginIndex) ;
        APreFix := IntToStr(DMOSCommerceImport.LoginIndex) ;
        end;
       if not Delete then
       begin
       AList.Values[APreFix+'Username']  :=  DMOSCommerceImport.Username  ;
       AList.Values[APreFix+'Database']  :=  DMOSCommerceImport.RemoteURL  ;
       AList.Values[APreFix+'DateFormat'] := DMOSCommerceImport.DateFormat ;
       AList.Values[APreFix+'DateTimeFormat'] := DMOSCommerceImport.DateTimeFormat ;
       AList.Values[APreFix+'Loginname'] := DMOSCommerceImport.LoginName ;
       AList.Values[APreFix+'PREFIX'] := DMOSCommerceImport.PREFIX ;
       AList.Values[APreFix+'sqlfolder'] := DMOSCommerceImport.SqlFolder ;


       AList.Values[APreFix+'TaxType'] := IntToStr(DMOSCommerceImport.AlternateWay);
       if  DMOSCommerceImport.RememberPassword  then
           begin
            AList.Values[APreFix+'RememberPassword'] := 'TRUE' ;
            AList.Values[APreFix+'Password'] := DMOSCommerceImport.Password;
           end;
       end else
       begin
       AList.Values[APreFix+'Username']  :=  ''  ;
       AList.Values[APreFix+'Database']  :=  ''  ;
       AList.Values[APreFix+'DateFormat'] := '' ;
       AList.Values[APreFix+'DateTimeFormat'] := '' ;
       AList.Values[APreFix+'Loginname'] := '' ;
       AList.Values[APreFix+'PREFIX'] := '' ;
       AList.Values[APreFix+'RememberPassword'] := '' ;
       AList.Values[APreFix+'sqlfolder'] := '' ;

       end;



       AList.SaveToFile(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini');
      finally
        AList.free ;
      end;
end;

procedure TDMOSCommerceImport.ExecSql(ASQL: String);
  Var AMessage : String ;
begin
Screen.Cursor := -11;
try
if usedebug then
 DebugString := DebugString + #13 + 'ExecSQL' + #13 + ASQL ;
IdHTTP1.Disconnect ; 
IdHTTP1.Request.Username := Username ;
IdHTTP1.Request.Password := Password ;
IdHTTP1.Request.BasicAuthentication := IdHTTP1.Request.Password <> '';
//IdHTTP1.Request.KeepAlive := true ;
ASQL := StringReplace(ASQL,#13#10,' ',[rfReplaceAll]);
AMessage :=  IdHTTP1.Get(RemoteURL+'?sql=' +URLEncode(ASQL)  ) ;
if copy(AMessage,1,8) = '<RESULT>' then
  begin
  if pos('OK',AMessage) = -1 then
   raise Exception.create(AMessage);
  end;
finally
   Screen.Cursor := 0;
end;  
end;
procedure TDMOSCommerceImport.SetSQLChartData(const Value: TStringList);
begin
  FSQLChartData := Value;
end;


function TDMOSCommerceImport.GetAddDocReportinggroup(
  AName: String): Integer;
begin
  result := TDataBaseRoutines.GetAddGroupNesteled(AName,28);
end;



procedure TDMOSCommerceImport.SyncStockGroup;
Var
 ATempCDS : TVirtualTable ;
 Function FindParents(AOscID : Integer ) : String ;
  Var AName : String ;
 begin
    result := '' ;
    if AOscID = 0 then exit ;
    if ATempCDS.Locate('categories_id',AOscID,[]) then
       begin
         AName := StringReplace(ATempCDS.fieldByName('categories_name').AsString,'@',' ',[rfReplaceall]) ;
          result := FindParents(ATempCDS.fieldByName('parent_id').AsInteger) ;

         if result = '' then
            result :=  AName 
              else
            result := result +'@' +  AName ;
       end;
  end;
begin
 FillCDSWithQuery(ZQAllCatProducts,Format(SQLAllCatProducts.Text,[IntToStr(OSCLinks.CBProductLang)]));
 if not ZQAllCatProducts.Active then
        ZQAllCatProducts.Active := true ;
 ZQAllCatProducts.First ;
 ATempCDS := TVirtualTable.Create(nil) ;
  try

   //ATempCDS.CopyStructure(ZQAllCatProducts) ;
   ATempCDS.Assign(ZQAllCatProducts);
   ATempCDS.open ;
   ZQAllCatProducts.first ;
     while not ZQAllCatProducts.eof do
        begin
           ZQAllCatProducts.edit ;
           ZQAllCatProducts.FieldByName('TCGroupID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(FindParents(ZQAllCatProducts.fieldByName('categories_id').AsInteger),26) ;
           ZQAllCatProducts.post ;
           ZQAllCatProducts.next ;
        end;
  finally
     ATempCDS.free ;
  end;
end;

procedure TDMOSCommerceImport.SetSQLAllCatProducts(
  const Value: TStringList);
begin
  FSQLAllCatProducts := Value;
end;

procedure TDMOSCommerceImport.SetSQLCatPerProduct(
  const Value: TStringList);
begin
  FSQLCatPerProduct := Value;
end;

procedure TDMOSCommerceImport.SetSqlFolder(const Value: String);
begin
  FSqlFolder := Value;
  LoadSQL ;
end;

procedure TDMOSCommerceImport.HandelEvents;
begin
 
end;

{ TTaxLinksCollection }

function TTaxLinksCollection.GetTaxLinksItem(index: Integer): TTaxLinksItem;
begin
Result :=TTaxLinksItem(self.items[index]);
end;

procedure TTaxLinksCollection.SetTaxLinksItem(index: Integer;
  const Value: TTaxLinksItem);
begin
    self.items[index].assign(Value);
end;

{ TTaxLinksItem }

procedure TTaxLinksItem.SetCostOfSaleAccount(const Value: Integer);
begin
  FCostOfSaleAccount := Value;
end;

procedure TTaxLinksItem.SetExclusive(const Value: Boolean);
begin
  FExclusive := Value;
end;

procedure TTaxLinksItem.SetLinkRate(const Value: Double);
begin
  FLinkRate := Value;
end;

procedure TTaxLinksItem.SetOSCTaxDesc(const Value: String);
begin
  FOSCTaxDesc := Value;
end;

procedure TTaxLinksItem.SetOSCTaxId(const Value: Integer);
begin
  FOSCTaxId := Value;
end;

procedure TTaxLinksItem.SetOSCTaxName(const Value: String);
begin
  FOSCTaxName := Value;
end;

procedure TTaxLinksItem.SetSalesAccount(const Value: Integer);
begin
  FSalesAccount := Value;
end;

procedure TTaxLinksItem.SetStockAccount(const Value: Integer);
begin
  FStockAccount := Value;
end;

procedure TTaxLinksItem.SetTaxFound(const Value: Boolean);
begin
  FTaxFound := Value;
end;

procedure TTaxLinksItem.SetTCTaxID(const Value: Integer);
begin
  FTCTaxID := Value;
end;

procedure TTaxLinksItem.SetTCTaxInput(const Value: Integer);
begin
  FTCTaxInput := Value;
end;

{ TOSCLinks }

procedure TOSCLinks.ClearFoundTaxes;
var
 i : Integer ;
begin
 for i := 0 to Self.FTaxLink.Count -1 do
    TaxLink[i].FTaxFound := false ;
end;

constructor TOSCLinks.Create(AOwner: TComponent);
begin
  inherited;
  FCountiesList := TStringList.Create;
  FTaxLink := TTaxLinksCollection.Create(self,TTaxLinksItem);
  FOTTaxLink := TTaxLinksCollection.Create(self,TTaxLinksItem);
  FStatusLink := TIDLinksCollection.Create(self,TIDLinkItem);
  FEditExistingItems := true ;
end;

destructor TOSCLinks.Destroy;
begin
  FCountiesList.Free ;
  FTaxLink.Free ;
  FOTTaxLink.Free ;
  FStatusLink.free ;
  inherited;
end;

function TOSCLinks.FindOTLink(AOTNAME: String): TTaxLinksItem;
var
 i : Integer ;
begin
 result := nil ;
 for i := 0 to Self.FOTTaxLink.Count -1 do
  if Uppercase(FOTTaxLink[i].FOSCTaxName) = Uppercase(AOTNAME) then
    begin
    result := FOTTaxLink[i] ;
    EXIT ;
    end;
end;

function TOSCLinks.FindTaxLink(Aid: Integer;ReturnDefault : Boolean = false): TTaxLinksItem;
var
 i : Integer ;
begin
 result := nil ;
 for i := 0 to Self.FTaxLink.Count -1 do
  if TaxLink[i].FOSCTaxId = Aid then
    begin
    result := FTaxLink[i] ;
    EXIT ;
    end;
  if ReturnDefault then
     result := FindTaxLink(-2);
end;

function TOSCLinks.FindTaxLinkOnRate(ARate: Double;
  ReturnDefault: Boolean): TTaxLinksItem;
var
 i : Integer ;
begin
 result := nil ;
 for i := 0 to Self.FTaxLink.Count -1 do
  if TaxLink[i].FLinkRate = ARate then
    begin
    result := FTaxLink[i] ;
    EXIT ;
    end;
  if ReturnDefault then
     result := FindTaxLink(-2);
end;

procedure TOSCLinks.SetAlternateWay(const Value: Integer);
begin
  FAlternateWay := Value;
end;

procedure TOSCLinks.SetCBImportAsQuote(const Value: Boolean);
begin
  FCBImportAsQuote := Value;
end;

procedure TOSCLinks.SetCBImportItemAttributesAsComment(
  const Value: Boolean);
begin
  FCBImportItemAttributesAsComment := Value;
end;

procedure TOSCLinks.SetCBProductBarcode(const Value: integer);
begin
  FCBProductBarcode := Value;
end;

procedure TOSCLinks.SetCBProductCur(const Value: integer);
begin
  FCBProductCur := Value;
end;

procedure TOSCLinks.SetCBProductLang(const Value: integer);
begin
  FCBProductLang := Value;
end;

procedure TOSCLinks.SetCBResyncDateTime(const Value: Boolean);
begin
  FCBResyncDateTime := Value;
end;

procedure TOSCLinks.SetCBUpdateStockFromTC(const Value: Boolean);
begin
  FCBUpdateStockFromTC := Value;
end;

procedure TOSCLinks.SetCBUSeTaxRatesFromOrderProduct(const Value: Boolean);
begin
  FCBUSeTaxRatesFromOrderProduct := Value;
end;

procedure TOSCLinks.SetCountiesList(const Value: TStringList);
begin
  FCountiesList := Value;
end;

procedure TOSCLinks.SetDebtorGroup1Id(const Value: Integer);
begin
  FDebtorGroup1Id := Value;
end;

procedure TOSCLinks.SetDefaultAccountDebtorNotInCountyList(
  const Value: Integer);
begin
  FDefaultAccountDebtorNotInCountyList := Value;
end;

procedure TOSCLinks.SetDocGroupStockAvail(const Value: Integer);
begin
  FDocGroupStockAvail := Value;
end;

procedure TOSCLinks.SetDocGroupStockNotAvail(const Value: Integer);
begin
  FDocGroupStockNotAvail := Value;
end;

procedure TOSCLinks.SetDTSincDate(const Value: TDateTime);
begin
  FDTSincDate := Value;
end;

procedure TOSCLinks.SetDTSincTime(const Value: TDateTime);
begin
  FDTSincTime := Value;
end;

procedure TOSCLinks.SetECustomerPRefix(const Value: String);
begin
  FECustomerPRefix := Value;
end;

procedure TOSCLinks.SetEditExistingItems(const Value: Boolean);
begin
  FEditExistingItems := Value;
end;

procedure TOSCLinks.SetEInvoicePrefix(const Value: String);
begin
  FEInvoicePrefix := Value;
end;

procedure TOSCLinks.SetEStockCodePrefix(const Value: String);
begin
  FEStockCodePrefix := Value;
end;

procedure TOSCLinks.SetImportStockGroups(const Value: Boolean);
begin
  FImportStockGroups := Value;
end;

procedure TOSCLinks.SetOTTaxLink(const Value: TTaxLinksCollection);
begin
  FOTTaxLink := Value;
end;




procedure TOSCLinks.SetServerDateTimeFormat(const Value: String);
begin
  FServerDateTimeFormat := Value;
end;

procedure TOSCLinks.SetSettingsVersion(const Value: Integer);
begin
  FSettingsVersion := Value;
end;

procedure TOSCLinks.SetStatusLink(const Value: TIDLinksCollection);
begin
  FStatusLink := Value;
end;

procedure TOSCLinks.SetTaxLink(const Value: TTaxLinksCollection);
begin
  FTaxLink := Value;
end;

procedure TDMOSCommerceImport.DataModuleCreate(Sender: TObject);

begin
 FOSCLinks := TOSCLinks.Create(self);
 DateTimeFormat := '"Cast(' + quotedStr('"yyyymmddhhnnss"')+' as datetime)" ' ;
 DateFormat :=  'yyyymmdd' ;

 FSQLCurrencies:= TStringList.Create;
 FSQLOrderStatusHist:= TStringList.Create;
 FSQLOrdersTotal:= TStringList.Create;
 FSQLStatus:= TStringList.Create;
 FSQLUniqueTaxCode:= TStringList.Create;
 FSQLUpdateStock:= TStringList.Create;
 FSQLOrdersOptions:= TStringList.Create;
 FSQLLanguage:= TStringList.Create;
 FSQLProducts:= TStringList.Create;
 FSQLOrders:= TStringList.Create;
 FSQLOptions:= TStringList.Create;
 FSQLOrderProducts:= TStringList.Create;
 FSQLAllProds:= TStringList.Create;
 FSQLCheckOnline:= TStringList.Create;
 FSQLChartData:= TStringList.Create;

 FSQLCatPerProduct:= TStringList.Create;
 FSQLAllCatProducts:= TStringList.Create;

 LoadSQL ;


 // todo : Change per customer
 // 0 default
 // 1 piensattelier
 AlternateWay := 0 ;

    ZQOptions:= TVirtualTable.Create(nil);
    ZQProducts:= TVirtualTable.Create(nil);
    ZQOrders:= TVirtualTable.Create(nil);
    ZQOrders.AfterOpen := ZQOrdersAfterScroll;
    ZQOrders.AfterScroll := ZQOrdersAfterScroll;
    ZOrderProducts:= TVirtualTable.Create(nil);
    ZQOrdersTotal:= TVirtualTable.Create(nil);
    ZQOrdersOptions:= TVirtualTable.Create(nil);
    ZQOrderStatusHist:= TVirtualTable.Create(nil);
    ZQUpdateStock:= TVirtualTable.Create(nil);
    ZStatus:= TVirtualTable.Create(nil);
    ZQUniqueTaxCode:= TVirtualTable.Create(nil);
    ZLanguage:= TVirtualTable.Create(nil);
    ZCurrencies:= TVirtualTable.Create(nil);
    ZQAllProds:= TVirtualTable.Create(nil);
    CDChartData:= TVirtualTable.Create(nil);
    CDGen:= TVirtualTable.Create(nil);
    ZQAllCatProducts:= TVirtualTable.Create(nil);
    ZQCatPerProduct:= TVirtualTable.Create(nil);

end;

procedure TDMOSCommerceImport.LoadSQL ;
var
 Text : String ;
begin
 if fSqlFolder = '' then
    fSqlFolder := 'OSFOSCsql' ;
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZCurrencies.txt') then
 FSQLCurrencies.LoadFromFile(ExtractFilePath(Application.ExeName)+'\OSFOSCsql\ZCurrencies.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrderStatusHist.txt') then
 FSQLOrderStatusHist.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrderStatusHist.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrdersTotal.txt') then
 FSQLOrdersTotal.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrdersTotal.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZStatus.txt') then
 FSQLStatus.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZStatus.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQUniqueTaxCode.txt') then
 FSQLUniqueTaxCode.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQUniqueTaxCode.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQUpdateStock.txt') then
 FSQLUpdateStock.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQUpdateStock.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrdersOptions.txt') then
 FSQLOrdersOptions.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrdersOptions.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZLanguage.txt') then
 FSQLLanguage.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZLanguage.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQProducts.txt') then
 FSQLProducts.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQProducts.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrders.txt') then
 FSQLOrders.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOrders.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOptions.txt') then
 FSQLOptions.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQOptions.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZOrderProducts.txt') then
 FSQLOrderProducts.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZOrderProducts.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQAllProds.txt') then
 FSQLAllProds.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQAllProds.txt');
 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQCheckOnline.txt') then
 FSQLCheckOnline.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQCheckOnline.txt');

 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZSalesChart.txt') then
 FSQLChartData.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZSalesChart.txt');

 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQCatPerProduct.txt') then
 FSQLCatPerProduct.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQCatPerProduct.txt');

 if FileExists(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQAllCatProducts.txt') then
 FSQLAllCatProducts.LoadFromFile(ExtractFilePath(Application.ExeName)+'\'+fSqlFolder+'\ZQAllCatProducts.txt');


 Text := FSQLCurrencies.text;
 FSQLCurrencies.text := StringReplace(Text,'<@PREFIX>',PREFIX, [rfReplaceAll]);
 Text := FSQLOrderStatusHist.text ;
 FSQLOrderStatusHist.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLOrdersTotal.text ;
 FSQLOrdersTotal.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLStatus.text ;
 FSQLStatus.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLUniqueTaxCode.text ;
 FSQLUniqueTaxCode.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLUpdateStock.text ;
 FSQLUpdateStock.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLOrdersOptions.text ;
 FSQLOrdersOptions.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLLanguage.text ;
 FSQLLanguage.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLProducts.text ;
 FSQLProducts.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLOrders.text ;
 FSQLOrders.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLOptions.text ;
 FSQLOptions.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLOrderProducts.text ;
 FSQLOrderProducts.text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLAllProds.text ;
 FSQLAllProds.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLCheckOnline.text ;
 FSQLCheckOnline.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLChartData.text ;
 FSQLChartData.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);

 Text := FSQLCatPerProduct.text ;
 FSQLCatPerProduct.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);
 Text := FSQLAllCatProducts.text ;
 FSQLAllCatProducts.Text := StringReplace(text,'<@PREFIX>',PREFIX,[rfreplaceAll]);

end;

procedure TDMOSCommerceImport.DataModuleDestroy(Sender: TObject);

begin
 FSQLCurrencies.free ;
 FSQLOrderStatusHist.free ;
 FSQLOrdersTotal.free ;
 FSQLStatus.free ;
 FSQLUniqueTaxCode.free ;
 FSQLUpdateStock.free ;
 FSQLOrdersOptions.free ;
 FSQLLanguage.free ;
 FSQLProducts.free ;
 FSQLOrders.free ;
 FSQLOptions.free ;
 FSQLOrderProducts.free ;
 FSQLAllProds.free ;
 FSQLChartData.free ;
 FSQLCatPerProduct.free ;
 FSQLAllCatProducts.free ;
 FOSCLinks.free ;

 ZQOptions.free;
 ZQProducts.free;
 ZQOrders.free;
 ZOrderProducts.free;
 ZQOrdersTotal.free;
 ZQOrdersOptions.free;
 ZQOrderStatusHist.free;
 ZQUpdateStock.free;
 ZStatus.free;
 ZQUniqueTaxCode.free;
 ZLanguage.free;
 ZCurrencies.free;
 ZQAllProds.free;
 CDChartData.free;
 CDGen.free;
 ZQAllCatProducts.free;
 ZQCatPerProduct.free;
end;

procedure TDMOSCommerceImport.ZQOrdersAfterScroll(DataSet: TDataSet);
begin
  ZOrderProducts.Close ;
  if ZQOrders.fieldByName('orders_id').asstring <> '' then
  FillCDSWithQuery(ZOrderProducts,format(SQLOrderProducts.Text,[ZQOrders.fieldByName('orders_id').asstring]));
  ZQOrdersTotal.Close ;
  if ZQOrders.fieldByName('orders_id').asstring <> '' then
  FillCDSWithQuery(ZQOrdersTotal,format(SQLOrdersTotal.Text,[ZQOrders.fieldByName('orders_id').asstring]));
end;

procedure TOSCLinks.SetUseDocReportingGroup1(const Value: Boolean);
begin
  FUseDocReportingGroup1 := Value;
end;

procedure TOSCLinks.SetUseInvoiceGroupSort(const Value: Boolean);
begin
  FUseInvoiceGroupSort := Value;
end;

procedure TOSCLinks.SetUseStockIDOnly(const Value: Boolean);
begin
  FUseStockIDOnly := Value;
end;

function TOSCLinks.TotalDatetime: TDatetime;
begin
result := round(FDTSincDate) + (FDTSincTime - round(FDTSincTime))
end;

{ TIDLink }

procedure TIDLinkItem.SetID(const Value: Integer);
begin
  FID := Value;
end;

{ TIDLinksCollection }

function TIDLinksCollection.GetLinksItem(index: Integer): TIDLinkItem;
begin
result :=TIDLinkItem(self.items[index]);

end;

function TIDLinksCollection.GetSepList(ASep: String): String;
var
 i : Integer ;
begin
 for i:= 0 to Self.Count -1 do
   if i = 0 then
   result := IntToStr(LinksItem[i].FID) 
   else
   result := result + ASep + IntToStr(LinksItem[i].FID) ;
end;

procedure TIDLinksCollection.SetLinksItem(index: Integer;
  const Value: TIDLinkItem);
begin
self.items[index].assign(Value) ;
end;

procedure TDMOSCommerceImport.ZQUniqueTaxCodeCalcFields(DataSet: TDataSet);
begin
   ZQUniqueTaxCode.fieldByName('TAX_NAME').AsString := 'TAX '+ ZQUniqueTaxCode.fieldByName('tax_id').AsString ;
end;

procedure TDMOSCommerceImport.IdHTTP1Authorization(Sender: TObject;
  Authentication: TIdAuthentication; var Handled: Boolean);
begin
  Authentication.Username := Username ;
  Authentication.Password := Password ;
  Handled := true ;
end;

procedure TDMOSCommerceImport.AllQuerysAfterPost(DataSet: TDataSet);
begin
 TuniQuery(DataSet).ApplyUpdates ;
 TuniQuery(DataSet).CommitUpdates ;
end;

procedure TDMOSCommerceImport.QStockItemsBeforeOpen(DataSet: TDataSet);
begin
 DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select * from stock where 1 = 0');
end;

procedure TDMOSCommerceImport.QStockItemsAfterInsert(DataSet: TDataSet);
begin
  QStockItems.FieldByName('WStockID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWSTOCKID) ;
end;

end.
