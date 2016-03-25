(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TcVariables;
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

Uses classes,Controls,Contnrs,SysUtils,SylTagParser,TcashClasses,Udmtccorelink,UPluginsSharedUnit;

Var
  {0  = Standar , Befor 10, T3 Act as Standar version}
  {10 = Lite, From This Value T3 will act as Lite Version}
  TCashCompiledAs :Integer = 0;

Type
// batches,periodes
TReportGroupTypes = (rgtDebtor1,rgtDebtor2,rgtCreditor1,rgtCreditor2,rgtGeneralLeder1,rgtGeneralLeder2,rgtStock1,rgtStock2,rgtDoc1,rgtDoc2);
TLedgerData = array of array of double ;
TLedgerType = (ltGeneralledger,ltDebtor,ltCreditor,ltBank,ltTax);
TActionType = (atCopyInvoice,acCopyInvoiceToGroup);
// base is integer 10
TDocumentType = (dtInvoice,dtCreditNote,dtPurchase,dtGoodsReturn,dtQuote,dtOrders,dtAdjustment,dtStatement,dtRemittance,dtDeliverynote);
// Row lines for easy read ord 
TDocumentRowType = (drtDocId,drtOrder,drtShip,drtprice,drtTotalInc,drtTotalExcl,drttotalTax,drtInc,drtDebCredID);
TLedgerAmountPos = (lapDebit,lapCredit);
TStockTypes= (stDefault,stBOM,stSales,stPurchaes,stSalesNoStock,stPurchaesNoStock,stAccountin,stOptions,stOptionsNoStock,stBomProd,StLinkedItems);
 


// predeceleration
TLedgerItem = class ;
TLedgerAddItemEvent = procedure ( const aLedgerItem : TLedgerItem );
// done Class implementation for better Calculations of ledgers
TTaxBased = (tbInvoice,tbPayments);





  TCompanyInfo = class (TPersistent)
  private
    FDebtorsControlAccount: Integer;
    FCREDITorsControlAccount: Integer;
    FRetaintEarnings: Integer;
    FTaxBased: TTaxBased;
    FCreateCostOfSales: Boolean;
    FEMailAddress: String;
    FCompanyName: String;
    FRegNumber: String;
    procedure SetCreditorsControlAccount(const Value: Integer);
    procedure SetDebtorsControlAccount(const Value: Integer);
    procedure SetRetaintEarnings(const Value: Integer);
    procedure SetTaxBased(const Value: TTaxBased);
    procedure SetCreateCostOfSales(const Value: Boolean);
    procedure SetEMailAddress(const Value: String);
    procedure SetCompanyName(const Value: String);
    procedure SetRegNumber(const Value: String);
       published
        property TaxBased : TTaxBased  read FTaxBased write SetTaxBased;
        property DebtorsControlAccount : Integer  read FDebtorsControlAccount write SetDebtorsControlAccount;
        property CreditorsControlAccount : Integer  read FCREDITorsControlAccount write SetCreditorsControlAccount;
        property RetaintEarnings : Integer  read FRetaintEarnings write SetRetaintEarnings;
        property CreateCostOfSales : Boolean  read FCreateCostOfSales write SetCreateCostOfSales;
        property EMailAddress : String  read FEMailAddress write SetEMailAddress;
        property CompanyName : String  read FCompanyName write SetCompanyName;
        property RegNumber : String  read FRegNumber write SetRegNumber;
  end ;

  TDataParameter = class (TPersistent)
  private
    FCBViewAllBankState: Boolean;
    FCBNoCalcBatch: Boolean;
    FBDataEntryReal: Boolean;
    FWDataEntryDecQty: Integer;
    FWDataEntryNbrQty: Integer;
    FSedtDecSymb: String;
    FBUseCurSign: Boolean;
    FSEdtDigSymb: String;
    FCurrencyMask: String;
    FNOWarningUnposted: Boolean;
    FNoPrintMessage: Boolean;
    FCheckDocReferenceUsed: Boolean;
    FDoNotCreateItems: Boolean;
    FCBUseCurrentDateForReports: Boolean;
    FCBDONotUseReportMan: Boolean;
    FWDocRowDecimals: Integer;
    FWEntryDecimals: Integer;
    FcbContraISRef: Boolean;
    FLogLevel: Integer;
    FWDocRowDecimalsShow: Integer;
    procedure SetBDataEntryReal(const Value: Boolean);
    procedure SetBUseCurSign(const Value: Boolean);
    procedure SetCBNoCalcBatch(const Value: Boolean);
    procedure SetCBViewAllBankState(const Value: Boolean);
    procedure SetSedtDecSymb(const Value: String);
    procedure SetSEdtDigSymb(const Value: String);
    procedure SetWDataEntryDecQty(const Value: Integer);
    procedure SetWDataEntryNbrQty(const Value: Integer);
    procedure SetCurrencyMask(const Value: String);
    procedure SetNOWarningUnposted(const Value: Boolean);
    procedure SetNoPrintMessage(const Value: Boolean);
    procedure SetCheckDocReferenceUsed(const Value: Boolean);
    procedure SetDoNotCreateItems(const Value: Boolean);
    procedure SetCBUseCurrentDateForReports(const Value: Boolean);
    procedure SetCBDONotUseReportMan(const Value: Boolean);
    procedure SetWDocRowDecimals(const Value: Integer);
    procedure SetWEntryDecimals(const Value: Integer);
    procedure SetcbContraISRef(const Value: Boolean);
    procedure SetLogLevel(const Value: Integer);
    procedure SetWDocRowDecimalsShow(const Value: Integer);
    public
     function GetmaskFromDigets(Adigets:Integer) : String ;
    published
      property WDataEntryDecQty   : Integer  read FWDataEntryDecQty write SetWDataEntryDecQty;
      property WDataEntryNbrQty   : Integer  read FWDataEntryNbrQty write SetWDataEntryNbrQty;
      property BDataEntryReal     : Boolean  read FBDataEntryReal write SetBDataEntryReal;
      property SEdtDigSymb        : String   read FSEdtDigSymb write SetSEdtDigSymb;
      property SedtDecSymb        : String   read FSedtDecSymb write SetSedtDecSymb;
      property BUseCurSign        : Boolean   read FBUseCurSign write SetBUseCurSign;
      property CBViewAllBankState : Boolean  read FCBViewAllBankState write SetCBViewAllBankState;
      property CBNoCalcBatch      : Boolean  read FCBNoCalcBatch write SetCBNoCalcBatch;
      property CurrencyMask :  String  read FCurrencyMask write SetCurrencyMask;
      property NOWarningUnposted : Boolean  read FNOWarningUnposted write SetNOWarningUnposted;
      property NoPrintMessage : Boolean  read FNoPrintMessage write SetNoPrintMessage;
      property CheckDocReferenceUsed : Boolean  read FCheckDocReferenceUsed write SetCheckDocReferenceUsed;
      property DoNotCreateItems : Boolean  read FDoNotCreateItems write SetDoNotCreateItems;
      property CBUseCurrentDateForReports : Boolean  read FCBUseCurrentDateForReports write SetCBUseCurrentDateForReports;
      property CBDONotUseReportMan : Boolean  read FCBDONotUseReportMan write SetCBDONotUseReportMan;
      property WDocRowDecimals : Integer  read FWDocRowDecimals write SetWDocRowDecimals;
      property WDocRowDecimalsShow : Integer   read FWDocRowDecimalsShow write SetWDocRowDecimalsShow;
      property WEntryDecimals : Integer  read FWEntryDecimals write SetWEntryDecimals;
      property cbContraISRef : Boolean  read FcbContraISRef write SetcbContraISRef;
      property LogLevel : Integer  read FLogLevel write SetLogLevel;
   end;
{  TRightsSystem = class (TPersistent)
  private
    published
   end;}
  TLedgerPeriodeCollection = class ;

  TSetOfBooksPropertys = Class(TComponent)
  private
    FCompanyInfo: TCompanyInfo;
    FDataParameter: TDataParameter;
    FLedgerPeriodes: TLedgerPeriodeCollection;
    procedure SetCompanyInfo(const Value: TCompanyInfo);
    procedure SetDataParameter(const Value: TDataParameter);
    procedure SetLedgerPeriodes(const Value: TLedgerPeriodeCollection);
     public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
     published
      property CompanyInfo : TCompanyInfo  read FCompanyInfo write SetCompanyInfo;
      property DataParameter : TDataParameter  read FDataParameter write SetDataParameter;
      property LedgerPeriodes : TLedgerPeriodeCollection  read FLedgerPeriodes write SetLedgerPeriodes;
  end;

TLedgerItem = class(TCollectionItem)

  protected
     // Debit or credit periodes so [0,2,1] Debitcolumn, batchid 2,periodid 1
     FinancialData : Array of TLedgerData ;
     BatchTransactionsCount : Array of integer ;
  private
    FSubAccounts: Boolean;
    FIncomeExpence: Boolean;
    FAccountcode: String;
    FName: String;
    FLedgerType: TLedgerType;
    FSubAccountCode: String;
    FAccountID: Integer;
    procedure SetAccountcode(const Value: String);
    procedure SetIncomeExpence(const Value: Boolean);
    procedure SetLedgerType(const Value: TLedgerType);
    procedure SetName(const Value: String);
    procedure SetSubAccounts(const Value: Boolean);
    procedure SetSubAccountCode(const Value: String);
    procedure SetAccountID(const Value: Integer);
    function GetTransactionCount(index: Integer): integer;
    procedure SetTransactionCount(index: Integer; const Value: integer);
   public
     property AccountID : Integer  read FAccountID write SetAccountID;
     property Name : String  read FName write SetName;
     property LedgerType : TLedgerType  read FLedgerType write SetLedgerType;
     property Accountcode : String  read FAccountcode write SetAccountcode;
     property IncomeExpence : Boolean  read FIncomeExpence write SetIncomeExpence;
     property SubAccounts : Boolean  read FSubAccounts write SetSubAccounts;
     property SubAccountCode : String  read FSubAccountCode write SetSubAccountCode;
     // accessors
     function  GetValue(Period,BatchId : Integer ; aLedgerAmountPos  : TLedgerAmountPos ) : Double ;
     procedure SetValue(Period,BatchId : Integer; Value : Double ; aLedgerAmountPos  : TLedgerAmountPos );
     procedure AddValue(Period,BatchId : Integer; Value : Double ; aLedgerAmountPos  : TLedgerAmountPos );
     procedure GetTotalsFromPeriodes(AFromPeriode,AToPeriode : Integer;var ADebit,ACredit : Double)  ;
     function GetTotalsForAccount : Double ;
     procedure GetTotalsFromBatch(ABatch : Integer;var ADebit,ACredit : Double)  ;
     property TransactionCount [index : Integer ] : integer  read GetTransactionCount write SetTransactionCount;
     procedure Clear ;
  published
end;


TLedgerCalculationClass = Class(TOwnedCollection)
  private
    FOnItemAdd: TLedgerAddItemEvent;
    function GetLedgerItems(index: integer): TLedgerItem;
    procedure SetLedgerItems(index: integer; const Value: TLedgerItem);
    procedure SetOnItemAdd(const Value: TLedgerAddItemEvent);

  public
     property OnItemAdd : TLedgerAddItemEvent  read FOnItemAdd write SetOnItemAdd;
     property LedgerItems [index : integer] : TLedgerItem  read GetLedgerItems write SetLedgerItems; default ;
     function GetItemOnAccountId (AAccountId : Integer) : TLedgerItem ;
     function HasItemOnAccountId (AAccountId : Integer) : boolean ;
     procedure GetTotalsFromBatch(ABatchId : Integer;var Debit,Credit : Double ) ;
     function GetTotalInBacthCount(ABatchId : Integer) : Integer ;
end;

TStockInvoicedItem = class(TCollectionItem)
    private
      // list of sales with invoiceid,order,ship,price,total
    DocumentArray : array[dtInvoice..dtDeliverynote] of TLedgerData ;

    FStockControlAccountId: Integer;
    FInputTaxAccountId: Integer;
    FSaleSACCOUNTId: Integer;
    FStockName: String;
    FStockCode: String;
    FStockID: Integer;
    FOutputTaxAccountId: Integer;
    FInvQtyOnHand: Double;
    FQtyOnHand: Double;
    procedure SetSaleSACCOUNTId(const Value: Integer);
    procedure SetStockCode(const Value: String);
    procedure SetStockControlAccountId(const Value: Integer);
    procedure SetStockName(const Value: String);
    procedure SetInputTaxAccountId(const Value: Integer);
    procedure SetStockID(const Value: Integer);
    procedure SetOutputTaxAccountId(const Value: Integer);
    procedure SetInvQtyOnHand(const Value: Double);
    procedure SetQtyOnHand(const Value: Double);

    published
      property StockID : Integer  read FStockID write SetStockID;
      property StockCode : String  read FStockCode write SetStockCode;
      property StockName : String  read FStockName write SetStockName;
      property InvQtyOnHand : Double  read FInvQtyOnHand write SetInvQtyOnHand;
      property QtyOnHand : Double  read FQtyOnHand write SetQtyOnHand;
      property SaleSACCOUNTId : Integer  read FSaleSACCOUNTId write SetSaleSACCOUNTId;
      property StockControlAccountId : Integer  read FStockControlAccountId write SetStockControlAccountId;
      property InputTaxAccountId : Integer  read FInputTaxAccountId write SetInputTaxAccountId;
      property OutputTaxAccountId : Integer  read FOutputTaxAccountId write SetOutputTaxAccountId;
      procedure AddDocumentEntry(aDocumentType:TDocumentType;AInvoiceId,AOrder,AShip,Aprice,ATotalInc,ATotalExc,AtotalTax,Inc,CredDebLinkID : Double ) ;
      procedure DoClear ;
      procedure TotalAfterDocumentProcess(var aShip,aOrder : Double);
      procedure TotalQuotePurchasenote(var aShip,aOrder : Double);
end;

TStockInvoicedCollection = Class(TOwnedCollection)
  private
    function GetStockItems(index: integer): TStockInvoicedItem;
    procedure SetStockItems(index: integer; const Value: TStockInvoicedItem);
  public
     property StockItems [index : integer] : TStockInvoicedItem  read GetStockItems write SetStockItems; default ;
     function StockItemOnStockId(AID : Integer ) : TStockInvoicedItem ;
     function StockItemOnStockCode(ACode : String ) : TStockInvoicedItem ;
  end;

TLedgerPeriodeItem =  class(TCollectionItem)
  private
    FPeriodeId: Integer;
    FDescription: String;
    FStartDate: TDate;
    FEndDate: TDate;
    FShutDown: Boolean;
    procedure SetDescription(const Value: String);
    procedure SetStartDate(const Value: TDate);
    procedure SetPeriodeId(const Value: Integer);
    procedure SetEndDate(const Value: TDate);
    procedure SetShutDown(const Value: Boolean);
    function getEndDateString: String;
    function getStartDateString: String;
   published
     property StartDate : TDate  read FStartDate write SetStartDate;
     property StartDateString : String read getStartDateString ;
     property EndDate : TDate  read FEndDate write SetEndDate;
     property EndDateString : String read getEndDateString ;
     property PeriodeId : Integer  read FPeriodeId write SetPeriodeId;
     property Description : String  read FDescription write SetDescription;
     property ShutDown : Boolean  read FShutDown write SetShutDown;
 end;

 TLedgerPeriodeCollection = Class(TOwnedCollection)
  private
    function GetLedgerPeriode(index: integer): TLedgerPeriodeItem;
    procedure SetLedgerPeriode(index: integer;
      const Value: TLedgerPeriodeItem);
     public
      property LedgerPeriode [index : integer] : TLedgerPeriodeItem   read GetLedgerPeriode write SetLedgerPeriode; default ;
      function GetItemFromPeriod(Period : Integer) : TLedgerPeriodeItem ;
      function GetItemPeriodFromDate(ADate : TDateTime) : TLedgerPeriodeItem ;
      function GetLowYear : TDateTime ;
      function GetHighYear : TdateTime ;
      function IsValideDate(ADate : TDateTime) : Boolean ;
 end;



Const
 T3Edit=0; T3Create=1; T3Delete=2;T3OnFly=3;
 crReportCursor=1;
  eline = #13#10;

Const
  TxfID='<TCASH3 ID="77SP80" TXT="SYL">';
  XmlID='<?xml version="1.0" standalone="yes"?>';
  DocFields : Array [10..15] of String=('SInvoicesMessage', 'SCreditNoteMessage','SPurchasesMessage',
        'SGoodsReturnedMessage','SQuoteMessage','SOrderMessage');

  
Var
  AFormOnDocProcPluginRecordArray : array [0..9] of TFormPluginRecord ;
  TcEmail : TEmailClient;
  TmpAccountRec:TAccountRec;
  TmpDebtorRec:TDtAccountRec;
  TmpDatesLimits : Array [0..1] of TDate;
  TmpStockRec:TStockRec;
  CtrlAccounts : T3ControlAcc;
  FromBatch,ToBatch,
  ReturnBatch : TBatchCon;
  TmpFomInt: Array[0..4] of integer;
  TmpToInt : Array[0..4] of integer;
  EmailBackup:Boolean =False;

  aTmpSaxParser : TSylSax;
  EmailType    : Byte =0;
  EmailFile    : String ='';
  tmpstrs1,tmpstrs2,tmpstrs3:String;
  TotCount,Count:integer;
  //IDDocType        : Byte;
  // For Batch entry screen
  IsCashBook     : Byte; //0=Not CashBook, 1 Payment, 2 Receipt;
  IsContraPerLine :Boolean;
  BatchCtrlID : Integer;
  BPaymentsBased :Boolean;
  ftmp:Double;
  BDesc1 : Boolean =False;
  BDesc2 : Boolean =False;
  StrOrderBy1 : String ='';
  StrOrderBy2 : String ='';
  FieldBy1,
  FieldBy2 : String;
  DocDraft : Boolean=True;
  BDocPrnLogo : Boolean;
  idDocType        : integer;
  ReturnID : Integer;
  ReturnLookup : String ='';
  ReturnLookupDesc : String ='';
  WinFormID : String= '';
  ReportID : Integer = 0 ;
  RecImported : LongInt;
  CommonDbPath : String ='';
  BBarCode : Boolean =False;
  FromID , ToID : Integer;
  sFromID , sToID : String;
  MainColor,
  MainPanelColor : Integer;
  RealUser : Integer;
  Converted : Integer;
  SavePass : String ='';
  ApplicationPath : String;
  AppName : String;
  AppVersion : String ;
  AppWebName : String;
  AppSupport : String;
  AppSupportPage : String;
  AppCopyright : String;
  CLassicColor : String;
   SaveOutput:Integer =0 ; // Hold last Output device
  PosShiftDate:TDate;
  PosPrnConf : Boolean = True;
  PosShowPreview : Boolean  = False;
  NetServerName:String='';
  BDefaultPrint:Boolean=True;
  PosChPrice : Boolean=True;
  PosChQty : Boolean=True;
  OnlyThisBatch : String='';
  AutoUpDtStarted : Boolean = False;
  AutoPost:Boolean = false;
  SMsgErr:String ='';
  TxfRes:WideString='';
  LastErrMsg : String;
  Amt2Allocate : Real;
  BatLinkedID,DefaultContraAccount  : Integer;
  LastSelectedAccount   : Integer;
  ItemLiked : Boolean;
  AccExclFilter : String;
  txfWarngs : String;
  CancelFtp:Boolean=False;
  AccountLock:Integer;
  MainAccountLength,DocReferenceLength : Integer;
  PollDispl:TComPort;
  CashDrawer:TComPort;
  ExternalPolePlugin : TOSFPosPlugin ;
  ExternalLoginControlerPlugin : TOSFLoginControlerPlugin ;
  AExternalPinPlugin : TOSFPinPlugin ;
  AExternalPOSPointsPlugin : TOSFPinPlugin ;
  AExternalEditAddItemToDocPlugin : TFormPluginRecord ;
  AExternalEditAddItemToStockPlugin : TFormPluginRecord ;
  AExternalPinIsReady : Boolean ;
  Prn1Feed,Prn2Feed : Integer;
  SPaperCut2,SPaperCut1 : String ;
  AutoLoginPosPassword,ChangeDiscountPW : String ;
  UseDebtorSellingPrice,ChangeDiscount,POSShowQtyOnhand,DOCCantSellOutOfStock : Boolean;
  
  PrnVars:TPrinterVars;
  DocModel :Word;

  MakeTXTReport : Boolean ;
//  GblReportGroup1List,GblReportGroup2List,GblUnitList : TStringList ;

  DefZoom ,   // Default Zoom Preview Value

  RepNbr:Integer; // Next Temp doc file Number;
  DefaultThemeID:Integer = 0;
//  tcPrinterCopies,


  CurrentBooks     : Integer;
  currentLanguage : String ;
  CurrentUserName : String ='';



  BatchNameFName,
//  ReturnLookupDesc,
//  ReturnLookup,
  Importdir        : String;
  ThemePath ,ThemeName        :String;
  isRepeatingInv,
  IsRepeatingBat:Boolean;
  NotShowIntro:Boolean = False;
  
  UpBatches,
  IsDeleteMode     : Boolean;
  vPrinterName     : String;
  EmailList        : TstringLIst;
  NbrAddDocAtt     : Integer;

   // TODO : We should clean out his section and make classes for all propertys if they blong in a se of books then we should put them there if they are global then the global data componentn should be used.
   // Current initilization will be done at init of this unit
  function TheGlobalDataObject : TGlobalDataObject ;

  function CurrentUser :Integer;
  procedure SetCurrentuser (AUser : Integer ) ;

  Procedure SendMessageToPosDocPlugin(AMessage : String ) ;
implementation

uses Math;

procedure SendMessageToPosDocPlugin(AMessage: String);
var
 i : Integer ;
begin

  for i := 0 to  9 do
    begin
     try
       if  Assigned(AFormOnDocProcPluginRecordArray[i].aForm) then
        if   AFormOnDocProcPluginRecordArray[i].aInst <> 0 then
          AFormOnDocProcPluginRecordArray[i].aMessageFormPlugin(AFormOnDocProcPluginRecordArray[i].aForm,PChar(AMessage));
      except
       on e: Exception do
          Raise Exception.Create(IntToStr(i)+ ' ' + GetModuleName(AFormOnDocProcPluginRecordArray[i].aInst)+' ' + e.Message);

      end;
    end;
end;



{ TLedgerCalculationClass }
function CurrentUser :Integer;
begin
   result := DMTCCoreLink.currentuser ;
end;

procedure SetCurrentuser (AUser : Integer ) ;
begin
   DMTCCoreLink.currentuser := AUser ;
   // change login

end;

function TLedgerCalculationClass.GetItemOnAccountId(
  AAccountId: Integer): TLedgerItem;
var
 i : Integer ;
begin
 for i := 0 to Count -1 do
 begin
   if (LedgerItems[i].AccountID = AAccountId) then
   begin
     Result := LedgerItems[i] ;
     exit ;
   end;
 end;
 Result := TLedgerItem(Self.Add) ;
 Result.AccountID := AAccountId ;
 if Assigned(FOnItemAdd) then
   FOnItemAdd(Result);
end;

function TLedgerCalculationClass.GetLedgerItems(
  index: integer): TLedgerItem;
begin
 result := TLedgerItem(self.items[index]) ;
end;

function TLedgerCalculationClass.GetTotalInBacthCount(
  ABatchId: Integer): Integer;
var
 i : Integer ;
begin
 result := 0 ;
 for i := 0 to self.count - 1 do
   begin
     result := result +  LedgerItems[i].TransactionCount[ABatchId] ;
   end ;
end;

procedure TLedgerCalculationClass.GetTotalsFromBatch(ABatchId: Integer;
  var Debit, Credit: Double);
var
 i : Integer ;
 aDebit, aCredit  : double ;
begin
 debit := 0 ;
 Credit := 0 ;
 for i := 0 to self.count - 1 do
   begin
     LedgerItems[i].GetTotalsFromBatch(ABatchId,aDebit, aCredit);
     debit := debit + adebit  ;
     Credit := Credit + aCredit  ;
   end ;
end;

function TLedgerCalculationClass.HasItemOnAccountId(
  AAccountId: Integer): boolean;
var
 i : Integer ;
begin
 Result := false ;
 for i := 0 to Count -1 do
   begin
      if (LedgerItems[i].AccountID = AAccountId) then
         begin
           Result := true ;
           exit ;
         end ;
   end ;
end;

procedure TLedgerCalculationClass.SetLedgerItems(index: integer;
  const Value: TLedgerItem);
begin
   self.items[index].assign(Value);
end;

procedure TLedgerCalculationClass.SetOnItemAdd(
  const Value: TLedgerAddItemEvent);
begin
  FOnItemAdd := Value;
end;

{ TLedgerItem }

procedure TLedgerItem.AddValue(Period, BatchId: Integer; Value: Double; aLedgerAmountPos  : TLedgerAmountPos );

var
 From , i : Integer ;
begin
 // exit periods -1
 if period < 0 then period := 0  ;
 if value = 0 then exit ;
 if high(FinancialData) <= ord(aLedgerAmountPos) then
    setlength(FinancialData,ord(aLedgerAmountPos)+1);
 if high(FinancialData[ord(aLedgerAmountPos)]) <= BatchId then
    setlength(FinancialData[ord(aLedgerAmountPos)],BatchId+1);

 if (high(FinancialData[ord(aLedgerAmountPos),BatchId]) <= Period) then
   begin
    From := high(FinancialData[ord(aLedgerAmountPos),BatchId]) ;
    setlength(FinancialData[ord(aLedgerAmountPos),BatchId],Period+1);
    for i := From + 1 to high(FinancialData[ord(aLedgerAmountPos),BatchId]) do
    FinancialData[ord(aLedgerAmountPos),BatchId,i] := 0 ;
   end;
  FinancialData[ord(aLedgerAmountPos),BatchId,Period] := FinancialData[ord(aLedgerAmountPos),BatchId,Period] + Value ;
end;

procedure TLedgerItem.Clear;
begin
 SetLength(FinancialData,0);
 SetLength(BatchTransactionsCount,0);
end;

function TLedgerItem.GetTotalsForAccount  : Double ;

 var
  x1,x2  : Integer ;
 ADebit,
  ACredit : Double ;
begin
  ADebit := 0 ;
  ACredit := 0 ;
  if high(FinancialData) >= Ord(lapDebit) then
   for x1 := low(FinancialData[Ord(lapDebit)]) to high(FinancialData[Ord(lapDebit)]) do
      for x2 := low(FinancialData[Ord(lapDebit),x1]) to high(FinancialData[Ord(lapDebit),x1]) do
           ADebit := ADebit + GetValue(x2,x1,lapDebit) ;

  if high(FinancialData) >= Ord(lapCredit) then
   for x1 := low(FinancialData[Ord(lapCredit)]) to high(FinancialData[Ord(lapCredit)]) do
     for x2 := low(FinancialData[Ord(lapCredit),x1]) to high(FinancialData[Ord(lapCredit),x1]) do
        ACredit := ACredit + GetValue(x2,x1,lapCredit) ;
  Result := ADebit - ACredit ;
end;

procedure TLedgerItem.GetTotalsFromBatch(ABatch: Integer; var ADebit,
  ACredit: Double);
 var
  x1,x2  : Integer ;
begin
  ADebit := 0 ;
  ACredit := 0 ;
  if high(FinancialData) >= Ord(lapDebit) then
   for x1 := low(FinancialData[Ord(lapDebit)]) to high(FinancialData[Ord(lapDebit)]) do
    if x1 = ABatch then
      for x2 := low(FinancialData[Ord(lapDebit),x1]) to high(FinancialData[Ord(lapDebit),x1]) do
           ADebit := ADebit + GetValue(x2,x1,lapDebit) ;

  if high(FinancialData) >= Ord(lapCredit) then
   for x1 := low(FinancialData[Ord(lapCredit)]) to high(FinancialData[Ord(lapCredit)]) do
    if x1 = ABatch then
     for x2 := low(FinancialData[Ord(lapCredit),x1]) to high(FinancialData[Ord(lapCredit),x1]) do
        ACredit := ACredit + GetValue(x2,x1,lapCredit) ;
end;

procedure TLedgerItem.GetTotalsFromPeriodes(AFromPeriode,AToPeriode : Integer;var ADebit,ACredit : Double)  ;
 var
  x1,x2  : Integer ;
begin
  ADebit := 0 ;
  ACredit := 0 ;
  if high(FinancialData) >= Ord(lapDebit) then
   for x1 := low(FinancialData[Ord(lapDebit)]) to high(FinancialData[Ord(lapDebit)]) do
     for x2 := low(FinancialData[Ord(lapDebit),x1]) to high(FinancialData[Ord(lapDebit),x1]) do
          if (x2 >= AFromPeriode) and (x2 <= AToPeriode) then
           ADebit := ADebit + GetValue(x2,x1,lapDebit) ;

  if high(FinancialData) >= Ord(lapCredit) then
   for x1 := low(FinancialData[Ord(lapCredit)]) to high(FinancialData[Ord(lapCredit)]) do
     for x2 := low(FinancialData[Ord(lapCredit),x1]) to high(FinancialData[Ord(lapCredit),x1]) do
         if (x2 >= AFromPeriode) and (x2 <= AToPeriode) then
           ACredit := ACredit + GetValue(x2,x1,lapCredit) ;
end;

function TLedgerItem.GetTransactionCount(index: Integer): integer;
begin
  Result := 0 ;
  if index <= high(BatchTransactionsCount) then
     result := BatchTransactionsCount[index] ;
end;

function TLedgerItem.GetValue(Period, BatchId: Integer; aLedgerAmountPos  : TLedgerAmountPos  ): Double;
begin
 result := 0 ;
 if ord(aLedgerAmountPos)<= high(FinancialData)   then
  if  BatchId <= high(FinancialData[ord(aLedgerAmountPos)])then
   if  (Period <= high(FinancialData[ord(aLedgerAmountPos),BatchId])) then
    result := FinancialData[ord(aLedgerAmountPos),BatchId,Period] ;
end;

procedure TLedgerItem.SetAccountcode(const Value: String);
begin
  FAccountcode := Value;
end;

procedure TLedgerItem.SetAccountID(const Value: Integer);
begin
  FAccountID := Value;
end;

procedure TLedgerItem.SetIncomeExpence(const Value: Boolean);
begin
  FIncomeExpence := Value;
end;

procedure TLedgerItem.SetLedgerType(const Value: TLedgerType);
begin
  FLedgerType := Value;
end;

procedure TLedgerItem.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TLedgerItem.SetSubAccountCode(const Value: String);
begin
  FSubAccountCode := Value;
end;

procedure TLedgerItem.SetSubAccounts(const Value: Boolean);
begin
  FSubAccounts := Value;
end;

procedure TLedgerItem.SetTransactionCount(index: Integer;
  const Value: integer);
begin
  if high(BatchTransactionsCount) < index then
     SetLength(BatchTransactionsCount,index+1);
   BatchTransactionsCount[index] := Value;
end;

procedure TLedgerItem.setValue(Period, BatchId: Integer; Value: Double; aLedgerAmountPos  : TLedgerAmountPos );
var
 From , i : Integer ;
begin
 if value = 0 then exit ;
 if high(FinancialData) <= ord(aLedgerAmountPos) then
     setlength(FinancialData,ord(aLedgerAmountPos)+1);
 if high(FinancialData[ord(aLedgerAmountPos)]) <= BatchId then
  setlength(FinancialData[ord(aLedgerAmountPos)],BatchId+1);

 if (high(FinancialData[BatchId]) <= Period) then
   begin
    From := high(FinancialData[ord(aLedgerAmountPos),BatchId]) ;
    setlength(FinancialData[ord(aLedgerAmountPos),BatchId],Period+1);
    for i := From + 1 to high(FinancialData[ord(aLedgerAmountPos),BatchId]) do
    FinancialData[ord(aLedgerAmountPos),BatchId,i] := 0 ;
   end;

  FinancialData[ord(aLedgerAmountPos),BatchId,Period] := Value ;
end;

{ TStockInvoicedItem }

procedure TStockInvoicedItem.AddDocumentEntry(aDocumentType:TDocumentType;AInvoiceId,AOrder,AShip,Aprice,ATotalInc,ATotalExc,AtotalTax,Inc,CredDebLinkID : Double ) ;
begin
 SetLength(DocumentArray[aDocumentType],high(DocumentArray[aDocumentType])+2);
 SetLength(DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])],9);
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][0] := AInvoiceId ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][1] := AOrder ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][2] := AShip  ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][3] := Aprice ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][4] := ATotalInc ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][5] := ATotalExc ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][6] := AtotalTax ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][7] := Inc ;
 DocumentArray[aDocumentType][high(DocumentArray[aDocumentType])][8] := CredDebLinkID ;

end;

procedure TStockInvoicedItem.Doclear;
var
 I : TDocumentType ;
begin
 for i :=  dtInvoice to dtDeliverynote do
 SetLength(DocumentArray[i],0);
end;

procedure TStockInvoicedItem.SetSaleSACCOUNTId(const Value: Integer);
begin
  FSaleSACCOUNTId := Value;
end;

procedure TStockInvoicedItem.SetStockCode(const Value: String);
begin
  FStockCode := Value;
end;

procedure TStockInvoicedItem.SetStockControlAccountId(
  const Value: Integer);
begin
  FStockControlAccountId := Value;
end;

procedure TStockInvoicedItem.SetStockID(const Value: Integer);
begin
  FStockID := Value;
end;

procedure TStockInvoicedItem.SetStockName(const Value: String);
begin
  FStockName := Value;
end;

procedure TStockInvoicedItem.SetInputTaxAccountId(const Value: Integer);
begin
  FInputTaxAccountId := Value;
end;

procedure TStockInvoicedItem.SetOutputTaxAccountId(const Value: Integer);
begin
  FOutputTaxAccountId := Value;
end;

procedure TStockInvoicedItem.TotalAfterDocumentProcess(var aShip,
  aOrder: Double);
var
 i  : Integer ;

begin
aShip := 0 ;
aOrder := 0 ;

for i := low(DocumentArray[dtInvoice]) to high(DocumentArray[dtInvoice]) do
   begin
     aShip := aShip - DocumentArray[dtInvoice][i][ord(drtShip)] ;
     aOrder := aOrder - DocumentArray[dtInvoice][i][ord(drtOrder)] ;
   end;
for i := low(DocumentArray[dtCreditNote]) to high(DocumentArray[dtCreditNote]) do
   begin
     aShip := aShip + DocumentArray[dtCreditNote][i][ord(drtShip)] ;
     aOrder := aOrder + DocumentArray[dtCreditNote][i][ord(drtOrder)] ;
   end;
for i := low(DocumentArray[dtPurchase]) to high(DocumentArray[dtPurchase]) do
   begin
     aShip := aShip + DocumentArray[dtPurchase][i][ord(drtShip)] ;
     aOrder := aOrder + DocumentArray[dtPurchase][i][ord(drtOrder)] ;
   end;
for i := low(DocumentArray[dtGoodsReturn]) to high(DocumentArray[dtGoodsReturn]) do
   begin
     aShip := aShip - DocumentArray[dtGoodsReturn][i][ord(drtShip)] ;
     aOrder := aOrder - DocumentArray[dtGoodsReturn][i][ord(drtOrder)] ;
   end;



end;

procedure TStockInvoicedItem.TotalQuotePurchasenote(var aShip,
  aOrder: Double);
var
 i  : Integer ;

begin
aShip := 0 ;
aOrder := 0 ;

for i := low(DocumentArray[dtQuote]) to high(DocumentArray[dtQuote]) do
   begin
     aShip := aShip - DocumentArray[dtQuote][i][ord(drtShip)] ;
     aOrder := aOrder - DocumentArray[dtQuote][i][ord(drtOrder)] ;
   end;
for i := low(DocumentArray[dtOrders]) to high(DocumentArray[dtOrders]) do
   begin
     aShip := aShip + DocumentArray[dtOrders][i][ord(drtShip)] ;
     aOrder := aOrder + DocumentArray[dtOrders][i][ord(drtOrder)] ;
   end;



end;

procedure TStockInvoicedItem.SetInvQtyOnHand(const Value: Double);
begin
  FInvQtyOnHand := Value;
end;

procedure TStockInvoicedItem.SetQtyOnHand(const Value: Double);
begin
  FQtyOnHand := Value;
end;

{ TStockInvoicedCollection }


function TStockInvoicedCollection.GetStockItems(
  index: integer): TStockInvoicedItem;
begin
 result := TStockInvoicedItem(self.items[index]) ;
end;

procedure TStockInvoicedCollection.SetStockItems(index: integer;
  const Value: TStockInvoicedItem);
begin
  self.items[index].Assign(Value);
end;

function TStockInvoicedCollection.StockItemOnStockCode(
  ACode: String): TStockInvoicedItem;
  var
   i : Integer ;
begin
  Result := nil ;
  for i := 0 to Self.Count -1 do
    begin
        if self.StockItems[i].FStockCode = ACode then
          begin
             Result := self.StockItems[i] ;
             exit ;
          end;
    end ;
end;

function TStockInvoicedCollection.StockItemOnStockId(
  AID: Integer): TStockInvoicedItem;
  var
   i : Integer ;
begin
  Result := nil ;
  for i := 0 to Self.Count -1 do
    begin
        if self.StockItems[i].FStockID = AID then
          begin
             Result := self.StockItems[i] ;
             exit ;
          end;
    end ;
end;

{ TLedgerPeriodeItem }

procedure TLedgerPeriodeItem.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TLedgerPeriodeItem.SetStartDate(const Value: TDate);
begin
  FStartDate := trunc(Value);
end;

procedure TLedgerPeriodeItem.SetPeriodeId(const Value: Integer);
begin
  FPeriodeId := Value;
end;

procedure TLedgerPeriodeItem.SetShutDown(const Value: Boolean);
begin
  FShutDown := Value;
end;

procedure TLedgerPeriodeItem.SetEndDate(const Value: TDate);
begin
  FEndDate := trunc(Value);
end;

function TLedgerPeriodeItem.getEndDateString: String;
begin
 result := formatDateTime('yyyy-mm-dd',FEndDate);
end;

function TLedgerPeriodeItem.getStartDateString: String;
begin
 result := formatDateTime('yyyy-mm-dd',FStartDate); 
end;

{ TLedgerPeriodeCollection }

function TLedgerPeriodeCollection.GetHighYear: TdateTime;
var
 i : Integer ;
begin
 result := 0 ;
 for i := 0 to Count -1 do
  if LedgerPeriode[i].FEndDate > result then
    result := LedgerPeriode[i].FEndDate ;
end;

function TLedgerPeriodeCollection.GetItemFromPeriod(
  Period : Integer): TLedgerPeriodeItem;
var
 i : Integer ;
begin
  Result := nil ;
  for i := 0 to Self.Count -1 do
    begin
       if Self.LedgerPeriode[i].FPeriodeId = Period then
         begin
            Result := Self.LedgerPeriode[i] ;
            exit ;
         end;
    end;
end;

function TLedgerPeriodeCollection.GetItemPeriodFromDate(
  ADate: TDateTime): TLedgerPeriodeItem;
var
 i : Integer ;
begin
 aDate := trunc(ADate);
  Result := nil ;
  for i := 0 to Self.Count -1 do
    begin
       if (Self.LedgerPeriode[i].FStartDate <= ADate) and (Self.LedgerPeriode[i].FEndDate >= ADate) then
         begin
            Result := Self.LedgerPeriode[i] ;
            exit ;
         end;
    end;
end;

function TLedgerPeriodeCollection.GetLedgerPeriode(
  index: integer): TLedgerPeriodeItem;
begin
 result :=   TLedgerPeriodeItem(self.Items[index]);
end;

function TLedgerPeriodeCollection.GetLowYear: TDateTime;
var
 i : Integer ;
begin
 result := 99999999999  ;
 for i := 0 to Count -1 do
  if LedgerPeriode[i].FStartDate < result then
    result := LedgerPeriode[i].FStartDate ;
  if result =  99999999999 then result := 0 ;
end;

function TLedgerPeriodeCollection.IsValideDate(ADate: TDateTime): Boolean;
var
 i : Integer ;
 Found : Boolean ;
begin
 result := false ;
 Found := False ;
 for i := 0 to Count -1 do
  if (LedgerPeriode[i].FStartDate <= ADate) and  (LedgerPeriode[i].FEndDate >= ADate) then
   begin
    result := not LedgerPeriode[i].ShutDown ;
    Found := True ;
   end;
 if not Found then
   if count <> 0 then
    if  LedgerPeriode[0].FStartDate >  ADate then
       result := not LedgerPeriode[0].ShutDown ;
end;


procedure TLedgerPeriodeCollection.SetLedgerPeriode(index: integer;
  const Value: TLedgerPeriodeItem);
begin
  self.Items[index].Assign(Value);
end;




{ TSetOfBooksProperty }

constructor TSetOfBooksPropertys.Create(AOwner: TComponent);
begin
  inherited;
  FCompanyInfo:= TCompanyInfo.create;
  FDataParameter:= TDataParameter.Create;
  FLedgerPeriodes:= TLedgerPeriodeCollection.Create(self,TLedgerPeriodeItem);
end;

destructor TSetOfBooksPropertys.Destroy;
begin
  FLedgerPeriodes.free ;
  FCompanyInfo.free ;
  FDataParameter.free ;
  inherited;
end;

procedure TSetOfBooksPropertys.SetCompanyInfo(const Value: TCompanyInfo);
begin
  FCompanyInfo := Value;
end;

{ TCompanyInfo }

procedure TCompanyInfo.SetCompanyName(const Value: String);
begin
  FCompanyName := Value;
end;

procedure TCompanyInfo.SetCreateCostOfSales(const Value: Boolean);
begin
  FCreateCostOfSales := Value;
end;

procedure TCompanyInfo.SetCreditorsControlAccount(const Value: Integer);
begin
  FCREDITorsControlAccount := Value;
end;

procedure TCompanyInfo.SetDebtorsControlAccount(const Value: Integer);
begin
  FDebtorsControlAccount := Value;
end;

procedure TCompanyInfo.SetEMailAddress(const Value: String);
begin
  FEMailAddress := Value;
end;

procedure TCompanyInfo.SetRegNumber(const Value: String);
begin
  FRegNumber := Value;
end;

procedure TCompanyInfo.SetRetaintEarnings(const Value: Integer);
begin
  FRetaintEarnings := Value;
end;

procedure TCompanyInfo.SetTaxBased(const Value: TTaxBased);
begin
  FTaxBased := Value;
end;

{ TDataParameter }

function TDataParameter.GetmaskFromDigets(Adigets: Integer): String;
var
 i : Integer ;
begin
 result := '0.' ;
 for i:= 1 to Adigets do
   begin
     result := result + '0' ;
   end;
end;

procedure TDataParameter.SetBDataEntryReal(const Value: Boolean);
begin
  FBDataEntryReal := Value;
end;

procedure TDataParameter.SetBUseCurSign(const Value: Boolean);
begin
  FBUseCurSign := Value;
end;

procedure TDataParameter.SetcbContraISRef(const Value: Boolean);
begin
  FcbContraISRef := Value;
end;

procedure TDataParameter.SetCBDONotUseReportMan(const Value: Boolean);
begin
  FCBDONotUseReportMan := Value;
end;

procedure TDataParameter.SetCBNoCalcBatch(const Value: Boolean);
begin
  FCBNoCalcBatch := Value;
end;

procedure TDataParameter.SetCBUseCurrentDateForReports(
  const Value: Boolean);
begin
  FCBUseCurrentDateForReports := Value;
end;

procedure TDataParameter.SetCBViewAllBankState(const Value: Boolean);
begin
  FCBViewAllBankState := Value;
end;

procedure TDataParameter.SetCheckDocReferenceUsed(const Value: Boolean);
begin
  FCheckDocReferenceUsed := Value;
end;

procedure TDataParameter.SetCurrencyMask(const Value: String);
begin
  FCurrencyMask := Value;
end;

procedure TDataParameter.SetDoNotCreateItems(const Value: Boolean);
begin
  FDoNotCreateItems := Value;
end;

procedure TDataParameter.SetLogLevel(const Value: Integer);
begin
  FLogLevel := Value;
end;

procedure TDataParameter.SetNoPrintMessage(const Value: Boolean);
begin
  FNoPrintMessage := Value;
end;

procedure TDataParameter.SetNOWarningUnposted(const Value: Boolean);
begin
  FNOWarningUnposted := Value;
end;

procedure TDataParameter.SetSedtDecSymb(const Value: String);
begin
  FSedtDecSymb := Value;
end;

procedure TDataParameter.SetSEdtDigSymb(const Value: String);
begin
  FSEdtDigSymb := Value;
end;

procedure TDataParameter.SetWDataEntryDecQty(const Value: Integer);
begin
  FWDataEntryDecQty := Value;
end;

procedure TDataParameter.SetWDataEntryNbrQty(const Value: Integer);
begin
  FWDataEntryNbrQty := Value;
end;

procedure TSetOfBooksPropertys.SetDataParameter(
  const Value: TDataParameter);
begin
  FDataParameter := Value;
end;

procedure TDataParameter.SetWDocRowDecimals(const Value: Integer);
begin
  FWDocRowDecimals := Value;
end;

procedure TDataParameter.SetWDocRowDecimalsShow(const Value: Integer);
begin
  FWDocRowDecimalsShow := Value;
end;

procedure TDataParameter.SetWEntryDecimals(const Value: Integer);
begin
  FWEntryDecimals := Value;
end;


procedure TSetOfBooksPropertys.SetLedgerPeriodes(
  const Value: TLedgerPeriodeCollection);
begin
  FLedgerPeriodes := Value;
end;

function TheGlobalDataObject : TGlobalDataObject ;
begin
 result := DMTCCoreLink.TheGlobalDataObject ;
end;






end.
