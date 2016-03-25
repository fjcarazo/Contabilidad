(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TcashClasses;

interface

Uses Controls,Windows,SysUtils,Contnrs,Classes,Graphics,Forms,
  IdMessage,IdSMTP ,printers,DBAccess , Uni , DB,WinSpool,ExtCtrls ,StdCtrls,DBCtrls ,XStandard_TLB ,comobj
     ,idAttachment,IdAttachmentFile  ;

type
  T3Totals=Array[0..26] of Real;
  T3Budgets=Array[0..13] of Real;

  T3ControlAcc=Record
    DebtorID:Integer;
    CreditorID:Integer;
    RetIncomeID:Integer;
  end;
  TComPort=Record
    IsComPort : Boolean;
    baud:Integer;
    parity:Char;
    data:Byte;
    stop:Byte;
    Name:String;
    Connected : Boolean;
    ControlStr: String;
  end;

 { TosfDBMemo = class (TPanel)
    private
     AMemo : TDBMemo ;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function Getlines: TStrings;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure Setlines(const Value: TStrings);
    function GetScrollBars: TScrollStyle;
    function GetWantReturns: Boolean;
    function GetWantTabs: Boolean;
    function GetWordWrap: Boolean;
    procedure SetScrollBars(const Value: TScrollStyle);
    procedure SetWantReturns(const Value: Boolean);
    procedure SetWantTabs(const Value: Boolean);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetText(const Value: String);
    function GetText: String;
    function GetMaxLength: Integer;
    procedure setMaxLength(const Value: Integer);
    public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    published
     property lines : TStrings  read Getlines write Setlines;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
     property ScrollBars: TScrollStyle read GetScrollBars write SetScrollBars ;
    property WantReturns: Boolean read GetWantReturns write SetWantReturns ;
    property WantTabs: Boolean read GetWantTabs write SetWantTabs ;
    property WordWrap: Boolean read GetWordWrap write SetWordWrap ;
    property Text : String read GetText write SetText ;
    property MaxLength : Integer read GetMaxLength write setMaxLength ;
  end;  }

  TosFMemo = class (TPanel)
    private
     AMemo : TCustomMemo ;

     localLines : TStringlist ;
     FTypeControl: Integer;
     Fmaxlength : Integer;
    procedure Setlines(const Value: TStrings);
    function Getlines: TStrings;
    function GetScrollBars: TScrollStyle;
    function GetWantReturns: Boolean;
    function GetWantTabs: Boolean;
    function GetWordWrap: Boolean;
    procedure SetScrollBars(const Value: TScrollStyle);
    procedure SetWantReturns(const Value: Boolean);
    procedure SetWantTabs(const Value: Boolean);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetText(const Value: String);
    function GetText: String;
    function GetMaxLength: Integer;
    procedure setMaxLength(const Value: Integer);
    procedure SetTypeControl(const Value: Integer);
    procedure TextChange(sender: Tobject);
    public
    AXControl : TXHTMLEditor ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


    published
     property lines : TStrings  read Getlines write Setlines;
     property ScrollBars: TScrollStyle read GetScrollBars write SetScrollBars ;
    property WantReturns: Boolean read GetWantReturns write SetWantReturns ;
    property WantTabs: Boolean read GetWantTabs write SetWantTabs ;
    property WordWrap: Boolean read GetWordWrap write SetWordWrap ;
    property Text : String read GetText write SetText ;
    property MaxLength : Integer read GetMaxLength write setMaxLength ;
    property TypeControl : Integer  read FTypeControl write SetTypeControl;
    procedure Clear ;
  end;
  TosfDBMemo = class (DBCtrls.TDBMemo)
  private
  public
  class function ShowEditor(var Atext : String ) : TModalresult ;
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure onDblClickEvent (sender:Tobject);

   published

    end;



 // Tmemo = class(TosFMemo);
 //  TDBMemo= class(TosfDBMemo);

  TDtAccountRec=Record
    WaccountID:integer;
    SDescription:String;
    SACCOUNTCODE:string;
    SPostal1,SPostal2,SPostal3,SPostalCode,SPostCounty:String;
    SDelAddress1,SDelAddress2,SDelAddress3,SDelCode,SDelCounty:String;
    SMessage1,SMessage2,SMessage3 : String;
    WSellingPrice,WDEfaultTaxId : Integer ;
     FCreditLimit,FCurrentBalance : Double ;
  end;
  TDescriptionRecord=Record
   WdescriptionId : integer ;
    SDescription : String;
    SDescription2 : String;
    SDescription3 : String;
    SDescription4 : String;
    SDescription5 : String;
    end;
  TDescriptionRecPointer = ^TDescriptionRecord;
  TDescriptionRecList = class(TObject)
  private
   AdescList : Tlist ;
   protected
   function IdExsist(MessageID: Integer;UpdateText : String):boolean;
   
  public

    function ReadDescription(MessageID: Integer): String;
    function GetAddDescription(aDescription : String;Unique: Boolean = false) : Integer;
    procedure UpdateDescription(MessageID:Integer ; aDescription : String);

    procedure Clear ;
    destructor Destroy; override;
    constructor create ;
  end;

  TAccountRec=Record
    WAccountID:Integer;
    SDescription : String;
    WAccountTypeID :Integer;
    SACCOUNTCODE : String;
    BIncExp : Boolean;
    BEnabled :Boolean ;
    FRate : Double ;
    FRate2 : Double ;
    FBalances : T3Totals;
    FBudgets : T3Budgets;
    SHOWTYPE : Integer ;
    group1 : Integer ;
    TAXACCOUNT : Integer ;
  end;

  TAccountRecPointer = ^TAccountRec;

  TAccountRecList = class(TObject)
  private
   AAccList : Tlist ;
  public
    procedure Clear ;
    function getAccount(var aAccRec : TAccountRecPointer;AAccountCode : String ) : Boolean;
    function getAccountOnid(var aAccRec : TAccountRecPointer;AAccountId : Integer ) : Boolean;
    function getAccountCode(AAccountId : Integer ) : String;
    function getAccountSimpelCode(AAccountId : Integer ) : String;
    function getAccountCodeWithDash(AAccountId : Integer ) : String;
    function GetAccountGroup1(AAccountId : Integer ) : Integer ;
    function GetAccountDefTaxAccount(AAccountId : Integer ) : Integer ;
    function getAccountFullDescription(AAccountid  : Integer) : String ;
    function getAccountType(AAccountId: Integer): integer;
    destructor Destroy; override;
    constructor create ;
    function GetTaxRateOnId(AAccountId : Integer) : Double ;
  end;




  TCompLogo = Record
    SCompName : String;
    Visible : Boolean;
    SAdd1 : String;
    SAdd2 : String;
    SAdd3 : String;
    SAddCode :String;
    STel : String;
    SFax : String;
    SEmail : String;
    STAXRegNo : String;
    SCompReg : String;
  end;

  TDocHeadRec=Record
    SdelAdr1,
    SdelAdr2,
    SdelAdr3,
    SdelCode : String;
    WAccountID :Integer;
    SDocNo  : String;
    WtypeID : Integer;
    DDate   : TDateTime;
    SDate   : String;
    WUserID : Integer;
    SRef    : String;
    STAXRef : String;
    SACCOUNTCODE : String;
    SACCOUNTDesc :String;
    SMess1 : String;
    SMess2 : String;
    SMess3 : String;
    BPosted : Boolean;
    SPost1 : String;
    SPost2 : String;
    SPost3 : String;
    SPostCode : String;
    CompLogo : TCompLogo;
  end;
  
  TSelect=Record
    ID    : Integer;
    Value : BooLean;
  end;

  TrSelect = Array of TSelect;

  TPrinterVars=Record
    NumCopies    : integer;
    Pages        : String;
    PrinterIndex : Integer;
  end;

  TBatchCon=Record
    WBatchID    : Integer;
    WUserID     : Integer;
    SName       : String;
    WBatchTypeID: Integer;
    SBatchNumber: String;
    BPosted     : Boolean;
    BImported   : Boolean;
    BDocSource  : Boolean;
    WInitBatID  : Integer;
    SAlias      : String;
    DSysDate    : TDateTime;
    SUniqueID   : String;
    WDocID      : Integer;
    WLineCount  : Integer;
    SFilename   : String;
  end;

  TBatchTypeRec=Record
    WBatchTypeID : Integer;
    SDescription : String;
    BCashBook    : Boolean;
    WContraAccountID : Integer;
    DSysDate    : TDateTime;
  end;

Type
 TOnDialogEvent = procedure (AMessage : String) of object ;
{ TOSFStartPlugin = function(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection) : TModalresult ; stdcall ;
  TOSFCreateFormPlugin  = function(AType : String;AName : String) : TCustomForm ; stdcall ;
  TOSFFreeFormPlugin = procedure(AName : String) ; stdcall ;
  TOSFEndPlugin = procedure(AApplicationHandle: THandle)  ; stdcall ;

 TOSFPluginListItem = class(TCollectionItem)

     protected
       AFormList : TStringList ;
       aOSFStartPlugin : TOSFStartPlugin ;
       aOSFCreateFormPlugin : TOSFCreateFormPlugin ;
       aOSFFreeFormPlugin : TOSFFreeFormPlugin ;
       aOSFEndPlugin : TOSFEndPlugin ;
     published
       property DllHinst : Cardinal ;
       property Name : String ;
       procedure GetForm (Aname,AType : String ): TCustomForm ;
       procedure FreeForm(Aname) ;
 end;  }


 TTCPreviewType = (tcptScreen,tcptFile);
  // Failsave next id getter
  TTCIdType = (tcidNEWACCOUNTID ,
               tcidNEWBACKORDERID,
               tcidNEWCONTACTID    ,
               tcidNEWBATCHTYPEID,
               tcidNEWBATCHID   ,
               tcidNEWGROUPID    ,
               tcidNEWCURRENCYID  ,
               tcidNEWDOCID,
               tcidNEWLABSPECSID,
               tcidNEWREPORTID   ,
               tcidNEWTRANSACTIONID,
               tcidNEWSTOCKID,
               tcidNEWUNITID,
               tcidNEWUSERID,
               tcidNEWMESSAGEID,
               tcidNEWSTOCKTRANSID,
               tcidNEWADDRESSPERACCOUNT,
               tcidNEWOILINKS,
               tcidNewJOBPROJECTID,
               tcidNewLogID,
               tcidNewLogEntryID);
 const
  TTCIdTypeStr : array [tcidNEWACCOUNTID..tcidNewLogEntryID] of string =(
  'GEN_ACCOUNTID',
  'GEN_BACKORDERID',
  'GEN_CONTACTS_ID',
  'GEN_BATCHTYPEID',         
  'GEN_BATCHID',
  'GEN_GROUPID',
  'GEN_CURRENCYID',
  'GEN_DOCID',
  'GEN_LABSPECSID',
  'GEN_REPORTID',
  'GEN_TRANSACTIONID',
  'GEN_STOCKID',
  'GEN_UNITID',
  'GEN_USERID',
  'GEN_MESSAGEID',
  'GEN_STOCKTRANSID',
  'GEN_ADDRESSPERACCOUNT_ID' ,
  'GEN_OILINKS_ID' ,
  'GEN_JOBPROJECTID',
  'GEN_LOGID',
  'GEN_LOGENTRYID'
  );
    TTCIdTypeStrTable : array [tcidNEWACCOUNTID..tcidNewLogEntryID] of string =(
  'ACCOUNT',
  'BACKORD',
  'CONTACTS',
  'BATTYPES',
  'BATCON',
  'GROUPS',
  'CURRENCY',
  'DOCHEAD',
  'LABSPECS',
  'OPREPORT',
  'TRANSACT',
  'STOCK',
  'UNIT',
  'USERS',
  'MESSAGES',
  'STOCKTRN',
  'ADDRESSPERACCOUNT' ,
  'OILINKS' ,
  'JOBPROJECT',
  'LOGGEDIN',
  'LOGENTRY'
  );
    TTCIdTypeStrKeyfield : array [tcidNEWACCOUNTID..tcidNewLogEntryID] of string =(
  'WACCOUNTID',                                                               
  'WBACKORDERID',
  'RECORDID',                                                                 
  'WBATCHTYPEID',                                                             
  'WBATCHID',                                                                 
  'WGROUPID',                                                                 
  'WCURRENCYID',                                                              
  'WDOCID',                                                                   
  'WLABSPECSID',                                                              
  'WOPTIONID',                                                                
  'WTRANSACTIONID',                                                           
  'WSTOCKID',                                                                 
  'WUNITID',                                                                  
  'WUSERID',                                                                  
  'WMESSAGEID',                                                               
  'WSTOCKTRANSACTIONID',                                                      
  'WADDRESSPERACCOUNTID' ,                                                    
  'WOILINKSID' ,                                                              
  'WJOBPROJECTID',
  'WLOGID',
  'WLOGENTRYID'
  );
  type
  TPrinterSetup = class

  private
    Device, Driver, Port: array[0..255] of char;
    DeviceMode: THandle;
    FLastPrinterName: String;
    procedure Refresh;
    procedure SetLastPrinterName(const Value: String);

  protected

  public
    procedure SaveSetup(FileName: TFilename);
    procedure LoadSetup(FileName: TFilename);
    property LastPrinterName : String  read FLastPrinterName write SetLastPrinterName;
  end;
  TPrinterConfig = record
    ADevice, ADriver, APort: array[0..255] of char;
    SizeOfDeviceMode: DWORD;
  end;


  TEmailClient=CLass(TComponent)
  Private
    SMTP      : TIdSMTP;
    IdMsgSend : TIdMessage;
  Public
    Constructor Create(AOwner: TComponent);Override;
    Destructor Destroy;Override;
    Function SendEmail:Integer;
    Function Connect:Boolean;
    Procedure Clear;
    Procedure AddAttachement(AFile:String;aDisplayName:String);
  Published
    Property MailMessage:TIdMessage Read IdMsgSend;
    Property Connection:TIdSMTP REad SMtp;
  end;

  // Interact class for params parcing of plugins
  TPluginIteractClass = class(TComponent)
  private
    FPreviewDocId: Integer;
    FpreviewFilename: String;
    FpreviewStyle: TTCPreviewType;
    FProcessBatch: String;
    Fprocessstring: String;
    FResultString: String;
    procedure SetPreviewDocId(const Value: Integer);
    procedure SetpreviewFilename(const Value: String);
    procedure SetpreviewStyle(const Value: TTCPreviewType);
    procedure SetProcessBatch(const Value: String);
    procedure Setprocessstring(const Value: String);
    procedure SetResultString(const Value: String);
    published
      property PreviewDocId : Integer  read FPreviewDocId write SetPreviewDocId;
      property previewStyle : TTCPreviewType  read FpreviewStyle write SetpreviewStyle;
      property previewFilename : String  read FpreviewFilename write SetpreviewFilename;
      property ProcessBatch : String  read FProcessBatch write SetProcessBatch;
      // Cross use of forms. current implements : LOOUPDEB , LOOKUPCRED
      property processstring : String  read Fprocessstring write Setprocessstring;
      property ResultString : String  read FResultString write SetResultString;
  end;
 // Item for reportin gdates
TOSFSpecialDaysItem = class(TCollectionItem)
  private
    FDSTARTDATETIME: TDateTime;
    FWCOLOR: Integer;
    FWPRIORITY: Integer;
    FWRESOURCEID: Integer;
    FWTYPEID: Integer;
    FDENDDATETIME: TDateTime;
    FSDESCRIPTION: String;
    procedure SetDSTARTDATETIME(const Value: TDateTime);
    procedure SetWCOLOR(const Value: Integer);
    procedure SetWPRIORITY(const Value: Integer);
    procedure SetWRESOURCEID(const Value: Integer);
    procedure SetWTYPEID(const Value: Integer);
    procedure SetDENDDATETIME(const Value: TDateTime);
    procedure SetSDESCRIPTION(const Value: String);
  published
    property WTYPEID : Integer  read FWTYPEID write SetWTYPEID;
    property WRESOURCEID : Integer  read FWRESOURCEID write SetWRESOURCEID;
    property WCOLOR : Integer  read FWCOLOR write SetWCOLOR;
    property WPRIORITY : Integer  read FWPRIORITY write SetWPRIORITY;
    property DSTARTDATETIME : TDateTime  read FDSTARTDATETIME write SetDSTARTDATETIME;
    property DENDDATETIME : TDateTime   read FDENDDATETIME write SetDENDDATETIME;
    property SDESCRIPTION : String  read FSDESCRIPTION write SetSDESCRIPTION;
  end;

TOSFSpecialDaysCollection = Class(TOwnedCollection)
  private
    function GetSpecialDaysItem(index: integer): TOSFSpecialDaysItem;
    procedure SetSpecialDaysItem(index: integer;
      const Value: TOSFSpecialDaysItem);
  public
     property SpecialDaysItem [index : integer] : TOSFSpecialDaysItem   read GetSpecialDaysItem write SetSpecialDaysItem; default ;
     procedure Init(AResourceId : Integer ) ;
     Function GetitemOnDate(ADate : TDateTime ) : TOSFSpecialDaysItem ;
  end;

 // collection for inmem treeview class

 TOSFLedgerCalculationClass = class ;

TOSFLedgerItem = class(TCollectionItem)
  private
    FSubAccounts: Boolean;
    FIncomeExpence: Boolean;
    FAccountcode: String;
    FName: String;
    FLedgerType: Integer;
    FSubAccountCode: String;
    FAccountID: Integer;
    FInactive: Boolean;
    FOpenItem: Boolean;
    FTotal: Double;
    FDateLastChange: TDate;
    FGroup1: Integer;
    FGroupType: Integer;
    FIsGroupNode: Boolean;
    FParentNode: TOSFLedgerItem;// TTReenode
    FNesteldNodes: TOSFLedgerCalculationClass;
    FControlAccountType: Integer;
    FProffitLoss: Double;
    FBalans: Double;
    FFinancialCategory: Integer;
    FSortNo: Integer;
    FLinkedAccountId: Integer;
    FGroup1ID: Integer;
    FGroup2Id: Integer;

    FTaxRate: Double;
    FLinkTax: Integer;
    FPaymentBatchName: String;
    FReceiptsBatchName: String;
    FReceiptsBatchID: Integer;
    FPaymentBatchID: Integer;
    FUseContraTax: Boolean;
    FTaxAccountid: Integer;
    FGroupColor: Tcolor;
    FGroupBgColor: Tcolor;
    FTaxType: Integer;
    FForceRecurse: Boolean;

    procedure SetAccountcode(const Value: String);
    procedure SetIncomeExpence(const Value: Boolean);
    procedure SeInteger(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetSubAccounts(const Value: Boolean);
    procedure SetSubAccountCode(const Value: String);
    procedure SetAccountID(const Value: Integer);
    procedure SetDateLastChange(const Value: TDate);
    procedure SetInactive(const Value: Boolean);
    procedure SetOpenItem(const Value: Boolean);
    procedure SetTotal(const Value: Double);
    procedure SetGroup1(const Value: Integer);
    procedure SetGroupType(const Value: Integer);
    procedure SetIsGroupNode(const Value: Boolean);
    procedure SetParentNode(const Value: TOSFLedgerItem);
    procedure SetNesteldNodes(const Value: TOSFLedgerCalculationClass);
    procedure SetControlAccountType(const Value: Integer);
    procedure SetProffitLoss(const Value: Double);
    procedure SetBalans(const Value: Double);
    procedure SetFinancialCategory(const Value: Integer);
    procedure SetSortNo(const Value: Integer);
    procedure SetLinkedAccountId(const Value: Integer);
    procedure SetGroup1ID(const Value: Integer);
    procedure SetGroup2Id(const Value: Integer);
    procedure SetLinkTax(const Value: Integer);
    procedure SetPaymentBatchName(const Value: String);
    procedure SetReceiptsBatchName(const Value: String);
    procedure SetTaxRate(const Value: Double);
    procedure SetPaymentBatchID(const Value: Integer);
    procedure SetReceiptsBatchID(const Value: Integer);
    procedure SetUseContraTax(const Value: Boolean);
    procedure SetTaxAccountid(const Value: Integer);
    procedure SetGroupColor(const Value: Tcolor);
    procedure SetGroupBgColor(const Value: Tcolor);
    procedure SetTaxType(const Value: Integer);
    procedure SetForceRecurse(const Value: Boolean);


   public

     property AccountID : Integer  read FAccountID write SetAccountID;
     property Name : String  read FName write SetName;
     property LedgerType : Integer  read FLedgerType write SeInteger;
     property Accountcode : String  read FAccountcode write SetAccountcode;
     property IncomeExpence : Boolean  read FIncomeExpence write SetIncomeExpence;
     property SubAccounts : Boolean  read FSubAccounts write SetSubAccounts;
     property SubAccountCode : String  read FSubAccountCode write SetSubAccountCode;
     property OpenItem : Boolean  read FOpenItem write SetOpenItem;
     property Inactive : Boolean  read FInactive write SetInactive;
     property DateLastChange :TDate  read FDateLastChange write SetDateLastChange;
     property Total : Double  read FTotal write SetTotal;
     property ProffitLoss : Double  read FProffitLoss write SetProffitLoss;
     property Balans : Double   read FBalans write SetBalans;
     property Group1 : Integer  read FGroup1 write SetGroup1;
     property GroupType : Integer  read FGroupType write SetGroupType;
     property Group1ID : Integer  read FGroup1ID write SetGroup1ID;
     property Group2Id : Integer  read FGroup2Id write SetGroup2Id;
     property LinkedAccountId : Integer  read FLinkedAccountId write SetLinkedAccountId;
     property GroupColor : Tcolor  read FGroupColor write SetGroupColor;
     property GroupBgColor : Tcolor   read FGroupBgColor write SetGroupBgColor;
     // this is the linked tax for a main account
     property TaxAccountid : Integer  read FTaxAccountid write SetTaxAccountid;
     // Tax
     property TaxRate : Double  read FTaxRate write SetTaxRate;
     property LinkTax : Integer  read FLinkTax write SetLinkTax;
     property TaxType : Integer  read FTaxType write SetTaxType;

     property UseContraTax : Boolean  read FUseContraTax write SetUseContraTax;
     // bank
     property ReceiptsBatchName : String  read FReceiptsBatchName write SetReceiptsBatchName;
     property PaymentBatchName : String  read FPaymentBatchName write SetPaymentBatchName;
     property ReceiptsBatchID : Integer read FReceiptsBatchID write SetReceiptsBatchID;
     property PaymentBatchID : Integer read FPaymentBatchID write SetPaymentBatchID;
     property ForceRecurse : Boolean  read FForceRecurse write SetForceRecurse;

     property SortNo : Integer  read FSortNo write SetSortNo;
     property IsGroupNode : Boolean  read FIsGroupNode write SetIsGroupNode;
     property FinancialCategory : Integer  read FFinancialCategory write SetFinancialCategory;
     property ControlAccountType : Integer  read FControlAccountType write SetControlAccountType;
     Function GetAccountText : String ;
     property ParentNode : TOSFLedgerItem read FParentNode write SetParentNode;
     property NesteldNodes : TOSFLedgerCalculationClass  read FNesteldNodes write SetNesteldNodes;
     function FindOnGroupId(AID : Integer ) : TOSFLedgerItem ;
     function FindOnAccountId(AID : Integer ) : TOSFLedgerItem ;
     function FindOnName(AName: String): TOSFLedgerItem;
     Function CalculateGroups : Double ;
     Function CalculateProffitLoss : Double ;
     procedure ClearAMounts ;
     Function CalculateBalans : Double ;
     Function HasProffitLoss : Boolean ;
     Function HasTotal : Boolean ;
     Function HasBalans : Boolean ;
     function GetLevel : Integer ;
     function NeedsRecurce : Boolean ;
     procedure FillStrings(AStrings : TStrings ) ;
     function isSubAccount : Boolean ;
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

  published
end;


TOSFLedgerCalculationClass = Class(TOwnedCollection)
  private
    function GetLedgerItems(index: integer): TOSFLedgerItem;
    procedure SetLedgerItems(index: integer; const Value: TOSFLedgerItem);
  public
     property LedgerItems [index : integer] : TOSFLedgerItem  read GetLedgerItems write SetLedgerItems; default ;
     function GetItemOnAccountId (AAccountId : Integer) : TOSFLedgerItem ;
     function HasItemOnAccountId (AAccountId : Integer) : boolean ;
     function add (AOwner : TOSFLedgerItem) : TOSFLedgerItem ;
     function GetItemOnAccountCode (AAccountCode : String ) : TOSFLedgerItem ;
     procedure deleteZeroacc ;
  end;

//  Books collection so we can write out the database at startup.
//
//
  TBooksCollectionItem = Class(TCollectionItem)
  private
    FPassword: String;
    FConnectionType: String;
    FServer: String;
    FUserName: String;
    Fdriver: String;
    FDatabase: String;
    FName: String;
    FActive: Boolean;
    FSelected: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetSelected(const Value: Boolean);
    protected

      procedure AssignTo(Dest: TPersistent); override ;
    public
      FDatabaseId : Integer ;
    // Is this the actice book?
      property Active : Boolean  read FActive write SetActive;
      property Selected : Boolean  read FSelected write SetSelected;
     published
       // display name of the books
       property Name : String  read FName write FName;
       // connection type as string so it can be used for manny
       // will be used to get the directory of specific SQL
       property ConnectionType : String  read FConnectionType write FConnectionType;
       // full path or
       property Database : String  read FDatabase write FDatabase;
       // server if needed
       property Server : String  read FServer write FServer;
       // username
       property UserName : String  read FUserName write FUserName;
       // password
       property Password : String  read FPassword write FPassword;
       // ZEOS driver
       property driver : String  read Fdriver write Fdriver;

       function GetFileSaveDir : String ;
  end;
TBooksCollection = class (TOwnedCollection)
  private                                          
    function GetBooks(index: Integer): TBooksCollectionItem;
    procedure SetBooks(index: Integer; const Value: TBooksCollectionItem);
    function GetSelected(index: Integer): Boolean;
    procedure SetSelected(index: Integer; const Value: Boolean);

   public
      property Books [index : Integer]: TBooksCollectionItem  read GetBooks write SetBooks; default ;
      function FindBooksByName (AName : String ) : TBooksCollectionItem ;
      function FindBooksByPath (APath : String ) : TBooksCollectionItem ;
      function FindBooksByNameServerAndPath(APath, AName,  AServer: String): TBooksCollectionItem;
      property Selected [index : Integer] : Boolean  read GetSelected write SetSelected;
      function ActiveBooks : TBooksCollectionItem ;
      function SelectedBooks : TBooksCollectionItem ;
      procedure DeselectBooks ;
      procedure SetActive(Index : Integer) ;
      procedure setActiveByName(AName : String ) ;
      procedure setActiveByPath(APath : String ) ;
      procedure ScannBooksDir(ADir : String ) ;
      procedure SwitchOrgStart(AFrom,ATo : String );
      

end;

// Registration class

TRegistration = class(tPersistent)
  private
    FRegistered: Boolean;
    FCompanyName: String;
    FSerialNumber: String;
    published
      property CompanyName : String read FCompanyName write FCompanyName;
      property SerialNumber : String read FSerialNumber write FSerialNumber;
      property Registered : Boolean  read FRegistered write FRegistered;
end;
// Translation object
TTranslationCollectionItem = Class(TCollectionItem)
  private
    FIndexID: Integer;
    FText: String;
    published
      property IndexID : Integer  read FIndexID write FIndexID;
      property Text : String  read FText write FText;
end;

TTranslationCollection = class (TOwnedCollection)
  private
    function Gettranslation(index: Integer): TTranslationCollectionItem;
    procedure Settranslation(index: Integer;
      const Value: TTranslationCollectionItem);

   public
      property translation [index : Integer]: TTranslationCollectionItem   read Gettranslation write Settranslation; default ;
      function GetTextLang(AId : Integer) : String ;
      function GetTextNum(Atrans : String) : Integer ;
      function FindIndexOfId(AId: Integer): Integer;

end;

TTranslationSaveObject = Class(TComponent)
  private
    FaTranslationCollection: TTranslationCollection;
    FLastFileName: String;
    procedure SetaTranslationCollection(
      const Value: TTranslationCollection);
    procedure SetLastFileName(const Value: String);
  Public
    Procedure LoadFromFile(AFilename : String );
    procedure LoadFromStream(AStream : TStream);
    Procedure SaveToFile(AFilename : String );
    procedure SaveToStream(AStream : TStream);
    property  LastFileName : String  read FLastFileName write SetLastFileName;
  published
    property  aTranslationCollection : TTranslationCollection  read FaTranslationCollection write SetaTranslationCollection;
end;

TLanguageCollectionItem = Class(TCollectionItem)
  private
    FName: String;
    fFilename: String;
    FActive: Boolean;
    procedure SetActive(const Value: Boolean);
    published
      property Name : String   read FName write FName;
      property filename : String   read fFilename write fFilename;
      property Active : Boolean  read FActive write SetActive;
end;

TLanguageCollection = class (TOwnedCollection)
  private
    function GetLanguage(index: Integer): TLanguageCollectionItem;
    procedure SetLanguage(index: Integer;
      const Value: TLanguageCollectionItem);
    function GetActiveLanguage: TLanguageCollectionItem;
   public

      property Language [index : Integer]: TLanguageCollectionItem   read GetLanguage write SetLanguage; default ;
      function findLanguageByName(AName : String ) :  TLanguageCollectionItem ;
      procedure SetActiveLanguage(Index : Integer) ;
      property ActiveLanguage : TLanguageCollectionItem read GetActiveLanguage;
      procedure SetDefault ;

end;

TGlobalDataObject = class (TComponent)
  private
    FLoadedFile : String ;
    FBooks: TBooksCollection;
    FRegistration: TRegistration;
    FCurrentLanguage: TTranslationCollection;
    FLanguages: TLanguageCollection;
    FTranslationSaveObject: TTranslationSaveObject;
    FFirstTime: Boolean;
    FDefaultLanguage: TTranslationCollection;
    FDefaultLangSaveObject: TTranslationSaveObject;
    procedure SetBooks(const Value: TBooksCollection);
    procedure SetCurrentLanguage(const Value: TTranslationCollection);
    procedure SetRegistration(const Value: TRegistration);
    procedure SetLanguages(const Value: TLanguageCollection);
    procedure SetTranslationSaveObject(
      const Value: TTranslationSaveObject);
    procedure SetFirstTime(const Value: Boolean);
    procedure SetLoadedFile(const Value: String);
    procedure SetDefaultLanguage(const Value: TTranslationCollection);
    procedure SetDefaultLangSaveObject(
      const Value: TTranslationSaveObject);
    public
      procedure Clear ;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      property TranslationSaveObject : TTranslationSaveObject  read FTranslationSaveObject write SetTranslationSaveObject;
      property DefaultLangSaveObject : TTranslationSaveObject  read FDefaultLangSaveObject write SetDefaultLangSaveObject;
      property CurrentLanguage : TTranslationCollection  read FCurrentLanguage write SetCurrentLanguage;
      property DefaultLanguage : TTranslationCollection   read FDefaultLanguage write SetDefaultLanguage;
      procedure LoadFromFile ( AFilename : String ) ;
      procedure SaveToFile   ( AFilename : String ) ;

      procedure Save;

    published
      property Languages : TLanguageCollection  read FLanguages write SetLanguages;
      property LoadedFile : String  read FLoadedFile write SetLoadedFile;
      property Registration : TRegistration  read FRegistration write SetRegistration;
      property Books : TBooksCollection  read FBooks write SetBooks;
      property FirstTime : Boolean  read FFirstTime write SetFirstTime;
end;



type
  TSQLList = class;

  TSqlCollectionItem = class(TCollectionItem)
  private
    FSql: TStrings;
    FName: string;
    procedure SetSql(const Value: TStrings);
    procedure SetName(const Value: string);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(pCollection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(pSource: TPersistent); override;
  published
    property SQL: TStrings read FSql write SetSql;
    property Name: string read FName write SetName;
  end;

  TSqlCollection = class(TOWnedCollection)
  private
    FSqlList: TSQLList;
    procedure SetItem(aIndex: Integer;aValue: TSqlCollectionItem);
    function GetItem(aIndex: Integer): TSqlCollectionItem;
  protected
  public
    constructor Create(aOwner: TSQLList);
    function Add: TSqlCollectionItem;
    function GetItemByName(aName: string): TSqlCollectionItem;
    property Items[pIndex: Integer]: TSqlCollectionItem read GetItem write SetItem;default;
  end;

  TSQLList = class(TComponent)
  private
    FSQLCollection: TSqlCollection;
    FParamsList: TStringList;
    procedure SetParamsList(const Value: TStringList);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Function GetFormatedSQLByName(AName : String ) : String ;
    property ParamsList : TStringList  read FParamsList write SetParamsList;
    Procedure LoadFromDir(ADir : String;Subname : String = '');
  published
    property SQLCollection: TSqlCollection
      read FSQLCollection write FSQLCollection;
  end;

  TGroupRec= Record
    WGroupID:integer;
    WGroupTypeID:Integer ;
    SDescription:String;
    WLinkID :Integer ;
    Wfontcol :Integer ;
    Wbackcol :Integer ;
    BDisable: Boolean ;
  end;
  TGroupRecPointer = ^TGroupRec;
  TGroupRecList = class(TObject)

  private
   AGroupList : Tlist ;
   IsInitialized : Boolean ;
  public
    procedure Clear ;
    function GetGroupImgName(AGroupid : Integer) : String ;
    function GetGroupNesteldName(AGroupid : Integer ;locQuery : TuniQuery = nil):String ;
    function GetGroupName(AGroupid : Integer ):String ;
    function getGroup(var aGroupRec : TGroupRecPointer;AGroupid : integer;locQuery : TuniQuery = nil) : Boolean;
    procedure FillListWithReportingGroup(grouptypeeid : Integer;AList : TStrings;AsLookup:Boolean=false);
    destructor Destroy; override;
    constructor create ;
  end;

  TStockRec= Record
    WStockID:integer;
    SDescription:String;
    SExtraDesc:String;
    Smanufacturer:String;
    FPrice1,FPrice2,FPrice3,FSellingPrice,FDiscount:Double;
    SBARCODENUMBER:String;
    SSTOCKCODE:String;
    WInputTaxID:integer;
    WOutputTaxID:integer;
    SInTax,SOutTax:String;
    FInputRate:Double;
    FOutputRate:Double;
    FQtyOnHand:Double ;
    FQtyInOrder:Double ;
    FQtyExpected:Double ;
    FReorderQty : Double ;
    FReorderQtyTrig : Double ;
    FminimumQty : Double ;
    FUnpostedItems : Double ;
    FUnitCost    : Double ;
    FAvgUnitCost    : Double ;
    FNettoWeigth    : Double ;
    FGrossWeigth    : Double ;
    WConstOfSaleSACCOUNTId : Integer ;
    WSaleSACCOUNTId : Integer ;
    WStockAccountId : Integer ;
    WStockTypeId : Integer ;
    WUnitId : Integer ;
    BApplyDiscount : Boolean ;
    wLocBatSerTypeid : Integer ;
    SSTOCKCODESUP1 : String ;
    WDefaultLinegroup1id : Integer ;
  end;
  TStockRecPointer = ^TStockRec;
  TStockRecList = class(TObject)

  private
   AStockList : Tlist ;

  public
    procedure Clear ;
    function getStock(var aStockRec : TStockRecPointer;AStockCode : String ) : Boolean;
    function reinitStock(AStockCode : String ) : Boolean;
    function getStockOnid(var aStockRec : TStockRecPointer;AStockId : Integer ) : Boolean;
    function getStockCode(AStockId: Integer): String;
    function getStockDefUnit(AStockId: Integer): integer;
    function getStockDescription(AStockId: Integer): String;
    function GetStockid(AStockcode: String): Integer;
    function GetStockCodeAndDescription(AStockid : Integer) : String ;
    destructor Destroy; override;
    constructor create ;
    procedure CopyStockRec(AFrom : TStockRecPointer;var ato : TStockRec );
  end;

  procedure SetPersistentProp(const AName: string; APersistent: TPersistent; Value: Variant);

  implementation

uses StrUtils,OSFGeneralRoutines,UDMTCCoreLink,inifiles, dialogs,variants  {delete this is just for debug},
  DateUtils,typinfo;



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
      if (UpperCase(PropList[i]^.Name) = UpperCase(Propname)) and (PropList[i]^.SetProc <> nil) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString, tkUString,
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

procedure TOSFLedgerItem.SetParentNode(const Value: TOSFLedgerItem);
begin
  FParentNode := Value;
end;

procedure TOSFLedgerItem.SetNesteldNodes(
  const Value: TOSFLedgerCalculationClass);
begin
  FNesteldNodes := Value;
end;

constructor TOSFLedgerItem.Create(Collection: TCollection);
begin
  inherited;
  FNesteldNodes:= TOSFLedgerCalculationClass.Create(self,TOSFLedgerItem);
end;

destructor TOSFLedgerItem.Destroy;
begin
  FNesteldNodes.Free ;
  inherited;
end;

function TOSFLedgerItem.FindOnGroupId(AID: Integer): TOSFLedgerItem;
var
 i : Integer ;
begin
  result := nil ;
  for i := 0 to FNesteldNodes.Count -1 do
    begin
       if FNesteldNodes[i].IsGroupNode then
         begin
           if FNesteldNodes[i].FGroup1 = AID then
             result := FNesteldNodes[i]
             else
             result := FNesteldNodes[i].FindOnGroupId(AId);
         end;
      if Assigned(Result) then exit ;
    end;
end;

Function TOSFLedgerItem.CalculateGroups : Double ;
var
 i : Integer ;
begin
 result := 0 ;

 for i := 0 to NesteldNodes.Count -1 do
    begin
       if NesteldNodes[i].NeedsRecurce  then
         result := result + NesteldNodes[i].CalculateGroups
         else
         if (not NesteldNodes[i].FSubAccounts) or (NesteldNodes[i].FLedgerType in [1,2]) then
           result :=  Result + NesteldNodes[i].FTotal ;

    end;
 if ((not FIsGroupNode) and (not FSubAccounts)) or (FLedgerType in [1,2]) then
    result :=  Result + FTotal ;
 if (FIsGroupNode or ForceRecurse) and (not (FControlAccountType in [1,2,3])) then
   begin
    FTotal := result ;
    if not FIsGroupNode then
     Balans := FTotal ;
   end;
 // Just give total for special control account
 if (FControlAccountType in [1,2,3]) then
    result := FTotal ;
end;

function TOSFLedgerItem.GetAccountText: String;
begin
  if IsGroupNode then
   result := Trim(Name)
  else
   result := Copy(TDataBaseRoutines.AccTypeToChar(FLedgerType)
                                        +  FAccountcode+'                      ',1,DMTCCoreLink.MainAccountLength + 4)
                                        +  ' ' + Trim(Name) ;
  If FIncomeExpence then result := '*' + result else
   if IsGroupNode then
    result := '#' + result
   else
    result := ' ' + result ;
end;

function TOSFLedgerItem.NeedsRecurce: Boolean;
begin
result := (FIsGroupNode or FSubAccounts or (ControlAccountType in [3] )) or ForceRecurse ;
end;



procedure TOSFLedgerItem.SetControlAccountType(const Value: Integer);
begin
  FControlAccountType := Value;
end;

function TOSFLedgerItem.FindOnName(AName : String): TOSFLedgerItem;
var
 i : Integer ;
begin
  result := nil ;
  for i := 0 to FNesteldNodes.Count -1 do
    begin
        if FNesteldNodes[i].Name = AName then
            result := FNesteldNodes[i] else
            result := FNesteldNodes[i].FindOnName(AName);
      if Assigned(Result) then exit ;
    end;
end;

function TOSFLedgerItem.FindOnAccountId(AID: Integer): TOSFLedgerItem;
var
 i : Integer ;
begin
  result := nil ;
  for i := 0 to FNesteldNodes.Count -1 do
    begin
      if FNesteldNodes[i].AccountID = AID then
        begin
         result := FNesteldNodes[i] ;
         exit
        end;
      if Assigned(Result) then exit ;
      result := FNesteldNodes[i].FindOnAccountId(AId);
    end;
end;


function TOSFLedgerItem.CalculateProffitLoss: Double;
var
 i : Integer ;
begin
 result := 0 ;

 for i := 0 to NesteldNodes.Count -1 do
    begin
       if NesteldNodes[i].NeedsRecurce  then
         result := result + NesteldNodes[i].CalculateProffitLoss
         else
         if (not (NesteldNodes[i].FSubAccounts or (NesteldNodes[i].FLedgerType in [1,2,3,4]))) then
           result :=  Result + NesteldNodes[i].FProffitLoss ;
    end;
 if FIsGroupNode or ForceRecurse   then
    FProffitLoss := result ;

// if ((not FIsGroupNode) and (not FSubAccounts)) or ((FLedgerType in [1,2])or (FIncomeExpence and not FSubAccounts))  then
//    result :=  Result + FProffitLoss ;
 //if ((not FIsGroupNode) and (not FSubAccounts)) or (NesteldNodes[i]. FLedgerType in [1,2])or (FIncomeExpence)  then
 //   result :=  Result + FProffitLoss ;
end;

procedure TOSFLedgerItem.SetProffitLoss(const Value: Double);
begin
  FProffitLoss := Value;
end;

function TOSFLedgerItem.HasProffitLoss: Boolean;
var
 i : Integer ;
begin
 result := false ;
 for i := 0 to NesteldNodes.Count -1 do
    begin
         if NesteldNodes[i].NeedsRecurce  then
         result := NesteldNodes[i].HasProffitLoss
         else
         result :=  (NesteldNodes[i].FIncomeExpence and (NesteldNodes[i].FProffitLoss <> 0));
       if result then exit ;
    end;

end;

procedure TOSFLedgerItem.SetBalans(const Value: Double);
begin
  FBalans := Value;
end;

function TOSFLedgerItem.CalculateBalans: Double;
var
 i : Integer ;
begin
 result := 0 ;
 if NesteldNodes.Count = 0 then
  begin
   if not IncomeExpence then
   Result := Balans ;
  end
 else
 begin
 for i := 0 to NesteldNodes.Count -1 do
    begin
         result := result + NesteldNodes[i].CalculateBalans
    end;
  end;
end;


function TOSFLedgerCalculationClass.add(
  AOwner: TOSFLedgerItem): TOSFLedgerItem;
begin
  result := TOSFLedgerItem(TCollection(self).Add) ;
  Result.FParentNode := AOwner ;
end;

procedure TOSFLedgerCalculationClass.deleteZeroacc;
var
 i : Integer ;
begin

 for i := Count -1 downto 0 do
 begin
   LedgerItems[i].NesteldNodes.deleteZeroacc ;
   if (LedgerItems[i].NesteldNodes.Count = 0) and
      (LedgerItems[i].Total = 0) then
      Delete(i);
 end;
end;

function TOSFLedgerCalculationClass.GetItemOnAccountCode(
  AAccountCode: String): TOSFLedgerItem;
var
 i : Integer ;
begin
 Result := nil ;
 for i := 0 to Count -1 do
 begin
   if (LedgerItems[i].Accountcode = AAccountCode) then
   begin
     Result := LedgerItems[i] ;
     exit ;
   end;
 end;
end;

function TOSFLedgerCalculationClass.GetItemOnAccountId(
  AAccountId: Integer): TOSFLedgerItem;
var
 i : Integer ;
begin
 Result := nil ;
 for i := 0 to Count -1 do
 begin
   if (LedgerItems[i].AccountID = AAccountId) then
   begin
     Result := LedgerItems[i] ;
     exit ;
   end;
 end;
end;

function TOSFLedgerCalculationClass.GetLedgerItems(
  index: integer): TOSFLedgerItem;
begin
 result := TOSFLedgerItem(self.items[index]) ;
end;


function TOSFLedgerCalculationClass.HasItemOnAccountId(
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

procedure TOSFLedgerCalculationClass.SetLedgerItems(index: integer;
  const Value: TOSFLedgerItem);
begin
   self.items[index].assign(Value);
end;


{ TOSFLedgerItem }



procedure TOSFLedgerItem.SetAccountcode(const Value: String);
begin
  FAccountcode := Value;
end;

procedure TOSFLedgerItem.SetAccountID(const Value: Integer);
begin
  FAccountID := Value;
  FLinkedAccountId := FAccountID ;
end;

procedure TOSFLedgerItem.SetDateLastChange(const Value: TDate);
begin
  FDateLastChange := Value;
end;

procedure TOSFLedgerItem.SetInactive(const Value: Boolean);
begin
  FInactive := Value;
end;

procedure TOSFLedgerItem.SetIncomeExpence(const Value: Boolean);
begin
  FIncomeExpence := Value;
end;

procedure TOSFLedgerItem.SeInteger(const Value: Integer);
begin
  FLedgerType := Value;
end;

procedure TOSFLedgerItem.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TOSFLedgerItem.SetOpenItem(const Value: Boolean);
begin
  FOpenItem := Value;
end;

procedure TOSFLedgerItem.SetSubAccountCode(const Value: String);
begin
  FAccountcode := copy(FAccountcode,1,DMTCCoreLink.MainAccountLength) + Value ;
  FSubAccountCode := Value ;
end;

procedure TOSFLedgerItem.SetSubAccounts(const Value: Boolean);
begin
  FSubAccounts := Value;
end;

procedure TOSFLedgerItem.SetTotal(const Value: Double);
begin
  FTotal := Value;
end;

procedure TOSFLedgerItem.SetGroup1(const Value: Integer);
begin
  FGroup1 := Value;
  if FGroupType = 21 then
  FGroup2Id := Value else
  FGroup1ID := Value ;
end;

procedure TOSFLedgerItem.SetGroupType(const Value: Integer);
begin
  FGroupType := Value;
end;

procedure TOSFLedgerItem.SetIsGroupNode(const Value: Boolean);
begin
  FIsGroupNode := Value;
end;

function TOSFLedgerItem.HasBalans: Boolean;
var
 i : Integer ;
begin
 result := false ;
 for i := 0 to NesteldNodes.Count -1 do
    begin
         if NesteldNodes[i].NeedsRecurce  then
         result := NesteldNodes[i].HasBalans
         else
         result :=  ((not NesteldNodes[i].FIncomeExpence) and (NesteldNodes[i].FBalans <> 0));
       if result then exit ;
    end;

end;


procedure TSqlCollectionItem.SetSql(const Value: TStrings);
begin
  if FSql.Text <> FSql.Text then begin
    FSql.BeginUpdate;
    try
      FSql.Assign(Value);
    finally
      FSql.EndUpdate;
    end;
  end;
end;

procedure TSqlCollectionItem.SetName(const Value: string);
begin
  if Value <> FName then begin
    FName := UpperCase(Value);
    DisplayName := Value;
  end;
end;

constructor TSqlCollectionItem.Create(pCollection: TCollection);
begin
  inherited;
  FSql := TStringList.Create;
end;

destructor TSqlCollectionItem.Destroy;
begin
  FSql.Free;
  inherited;
end;

procedure TSqlCollectionItem.Assign(pSource: TPersistent);
begin
  if pSource is TSqlCollectionItem then begin
    FSql.Assign(TSqlCollectionItem(pSource).SQL);
    Name := TSqlCollectionItem(pSource).Name;
  end
  else
    inherited;
end;

function TSqlCollectionItem.GetDisplayName: string;
begin
  Result := Name ;
  if Name = '' then Result := ClassName;
end;

function TSqlCollection.GetItem(aIndex: Integer): TSqlCollectionItem;
begin
  Result := TSqlCollectionItem(inherited GetItem(aIndex));
end;
procedure TSqlCollection.SetItem(aIndex: Integer; aValue: TSqlCollectionItem);
begin
  inherited SetItem(aIndex, aValue);
end;


constructor TSqlCollection.Create(aOwner: TSQLList);
begin
  FSQLList := aOwner;
  inherited Create(aOwner,TSqlCollectionItem);
end;

function TSqlCollection.Add: TSqlCollectionItem;
begin
  Result := TSqlCollectionItem(inherited Add);
end;

function TSqlCollection.GetItemByName(aName: string): TSqlCollectionItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count-1 do
    begin


    if assigned(DMTCCoreLink) and (UpperCase(GetItem(i).Name) = UpperCase(DMTCCoreLink.GlobalSqlPrefix+AName))  then
     begin
      Result := GetItem(i);
      Break;
     end else
    if  UpperCase(GetItem(i).Name) = UpperCase(aName) then
      begin
      Result := GetItem(i);
      Break;
    end;
  end;
end;

constructor TSQLList.Create(AOwner: TComponent);
begin
  inherited;
  FSQLCollection := TSqlCollection.Create(Self);
  FParamsList:= TStringList.Create;
end;

destructor TSQLList.Destroy;
begin
  FSQLCollection.Free;
  FParamsList.Free ;
  inherited;
end;


procedure TSQLList.LoadFromDir(ADir: String;Subname : String = '');
var
 ASearchRec : TSearchRec ;
 AStream : TMemoryStream ;
begin
 if Subname = '' then
 self.FSQLCollection.Clear ;
 if FindFirst(IncludeTrailingPathDelimiter(ADir)+'*.*',faAnyFile,ASearchRec) = 0 then
    begin
    repeat
     if (ASearchRec.Name <> '.') and (ASearchRec.Name <> '..') then
      begin
      if ((ASearchRec.Attr and faDirectory) = faDirectory ) then
      begin
        with self.SQLCollection.Add do
         begin
            FName :=  UpperCase(ChangeFileExt('*'+Subname + ASearchRec.Name,''));
            FSQL.text := '*'+Subname + ASearchRec.Name ;
         end;

         LoadFromDir(IncludeTrailingPathDelimiter(ADir) + ASearchRec.Name,Subname  + ASearchRec.Name + '\');
      end else
      begin
      AStream := TMemoryStream.Create() ;
      try
      AStream.LoadFromFile(IncludeTrailingPathDelimiter(ADir)+ASearchRec.Name);
      with self.SQLCollection.Add do
         begin
            AStream.Position := 0 ;
            FSQL.LoadFromStream(AStream);
            FName :=  UpperCase(ChangeFileExt(Subname  +ASearchRec.Name,''));
         end;
      finally
         AStream.free ;
      end;
      end;
     end;
    until FindNext(ASearchRec) <> 0;
    FindClose(ASearchRec);
    end;
end;

procedure TSQLList.SetParamsList(const Value: TStringList);
begin
  FParamsList := Value;
end;

function TSQLList.GetFormatedSQLByName(AName: String): String;
var
 i,PosParam : Integer ;
 
begin
  result := '' ;
  if Assigned(DMTCCoreLink) then
 if FSQLCollection.GetItemByName(DMTCCoreLink.GlobalSqlPrefix+AName) <> nil then
    AName :=  DMTCCoreLink.GlobalSqlPrefix+AName ;

 if FSQLCollection.GetItemByName(AName) <> nil then
    begin
        result :=  FSQLCollection.GetItemByName(AName).SQL.Text ;
        for i:= 0 to FParamsList.Count -1 do
           begin

              while pos('<@'+ FParamsList.Names[i]+'@>',result) <> 0 do
                 begin
                    PosParam := pos('<@'+ FParamsList.Names[i]+'@>',result) ;
                    Delete(Result,PosParam,Length('<@'+ FParamsList.Names[i]+'@>'));
                    Insert( FParamsList.ValueFromIndex[i],Result,PosParam);
                 end;
           end;
    end;
end;
 
function TOSFLedgerItem.GetLevel: Integer;
begin
  result := 0 ;
  if ParentNode <> nil then
     result := 1 + ParentNode.GetLevel ;
end;

procedure TOSFLedgerItem.FillStrings(AStrings: TStrings);
begin

end;

procedure TOSFLedgerItem.SetFinancialCategory(const Value: Integer);
begin
  FFinancialCategory := Value;
end;

procedure TOSFLedgerItem.SetSortNo(const Value: Integer);
begin
  FSortNo := Value;
end;

procedure TOSFLedgerItem.SetLinkedAccountId(const Value: Integer);
begin
  FLinkedAccountId := Value;
end;

function TOSFLedgerItem.HasTotal: Boolean;
var
 i : Integer ;
begin
 result := false ;
 for i := 0 to NesteldNodes.Count -1 do
    begin
         if NesteldNodes[i].NeedsRecurce  then
         result := NesteldNodes[i].HasTotal
         else
         result :=  (NesteldNodes[i].Total <> 0);
       if result then exit ;
    end ;
  result := result or (Total <> 0)
end;

function TOSFLedgerItem.isSubAccount: Boolean;
begin
 result := (AccountID <> LinkedAccountId) and (not IsGroupNode) ;
end;

procedure TOSFLedgerItem.SetGroup1ID(const Value: Integer);
begin
  FGroup1ID := Value ;
  if FGroupType <> 21 then
  FGroup1 := Value ;
end;

procedure TOSFLedgerItem.SetGroup2Id(const Value: Integer);
begin
  FGroup2Id := Value;
  if FGroupType = 21 then
  FGroup1 := Value ;
end;

procedure TOSFLedgerItem.SetLinkTax(const Value: Integer);
begin
  FLinkTax := Value;
end;

procedure TOSFLedgerItem.SetPaymentBatchName(const Value: String);
begin
  FPaymentBatchName := Value;
end;

procedure TOSFLedgerItem.SetReceiptsBatchName(const Value: String);
begin
  FReceiptsBatchName := Value;
end;

procedure TOSFLedgerItem.SetTaxRate(const Value: Double);
begin
  FTaxRate := Value;
end;

procedure TOSFLedgerItem.SetPaymentBatchID(const Value: Integer);
begin
  FPaymentBatchID := Value;
end;

procedure TOSFLedgerItem.SetReceiptsBatchID(const Value: Integer);
begin
  FReceiptsBatchID := Value;
end;

procedure TOSFLedgerItem.SetUseContraTax(const Value: Boolean);
begin
  FUseContraTax := Value;
end;

procedure TOSFLedgerItem.SetTaxAccountid(const Value: Integer);
begin
  FTaxAccountid := Value;
end;

procedure TOSFLedgerItem.SetGroupColor(const Value: Tcolor);
begin
  FGroupColor := Value;
end;

procedure TOSFLedgerItem.SetGroupBgColor(const Value: Tcolor);
begin
  FGroupBgColor := Value;
end;

procedure TOSFLedgerItem.SetTaxType(const Value: Integer);
begin
  FTaxType := Value;
end;

procedure TOSFLedgerItem.SetForceRecurse(const Value: Boolean);
begin
  FForceRecurse := Value;
end;

procedure TOSFLedgerItem.ClearAmounts;

var
 i : Integer ;
begin

 Balans := 0 ;
 Total := 0 ;
 ProffitLoss := 0 ;
 for i := 0 to NesteldNodes.Count -1 do
    begin
         NesteldNodes[i].ClearAmounts ;
    end;
end;
{ TPrinterSetup }

procedure TPrinterSetup.Refresh;
begin
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
end;

procedure TPrinterSetup.SaveSetup(FileName: TFilename);
var
  StubDevMode: TDeviceMode;
  SetupPrinter: TPrinterConfig;
  FPrinterHandle: THandle;
  fFileConfig: file of TPrinterConfig;
  fFileDevMode: file of Char;
  pDevMode: PChar;
  Contador: Integer;
begin
  Refresh;
  with SetupPrinter do
  begin
    StrLCopy(ADevice, Device, SizeOf(ADevice));
    StrLCopy(ADriver, Driver, SizeOf(ADriver));
    StrLCopy(APort, Port, SizeOf(APort));
    OpenPrinter(Device, FPrinterHandle, nil);
    SizeOfDeviceMode := DocumentProperties(0, FPrinterHandle, Device,
      StubDevMode, StubDevMode, 0);
  end;
  FLastPrinterName := SetupPrinter.ADevice ;
  AssignFile(fFileConfig, FileName);
  ReWrite(fFileConfig);
  Write(fFileConfig, SetupPrinter);
  CloseFile(fFileConfig);
  AssignFile(fFileDevMode, FileName);
  Reset(fFileDevMode);
  Seek(fFileDevMode, FileSize(fFileDevMode));
  pDevMode := GlobalLock(DeviceMode);
  for Contador := 0 to SetupPrinter.SizeOfDeviceMode - 1 do
  begin
    Write(fFileDevMode, pDevMode[Contador]);
  end;
  CloseFile(fFileDevMode);
  GlobalUnLock(DeviceMode);

end;


procedure TPrinterSetup.LoadSetup(FileName: TFilename);
var
  SetupPrinter: TPrinterConfig;
  fFileConfig: file of TPrinterConfig;
  fFileDevMode: file of Char;
  ADeviceMode: THandle;
  pDevMode: PChar;
  Contador: Integer;
begin

  if FileExists(FileName) then
  begin
    AssignFile(fFileConfig, FileName);
    Reset(fFileConfig);
    read(fFileConfig, SetupPrinter);
    CloseFile(fFileConfig);
    AssignFile(fFileDevMode, FileName);
    Reset(fFileDevMode);
    Seek(fFileDevMode, SizeOf(SetupPrinter));
    ADeviceMode := GlobalAlloc(GHND, SetupPrinter.SizeOfDeviceMode);
    pDevMode := GlobalLock(ADeviceMode);
    try
    for Contador := 0 to SetupPrinter.SizeOfDeviceMode - 1 do
    begin
      read(fFileDevMode, char(pDevMode[Contador]));
    end;
    CloseFile(fFileDevMode);
    finally
    GlobalUnLock(ADeviceMode);
    end;
    Printer.SetPrinter(SetupPrinter.ADevice, SetupPrinter.ADriver,
      SetupPrinter.APort, ADeviceMode);
      FLastPrinterName := SetupPrinter.ADevice ;
  end;
end;


procedure TPrinterSetup.SetLastPrinterName(const Value: String);
begin
  FLastPrinterName := Value;
end;

{ TPluginIteractClass }

procedure TPluginIteractClass.SetPreviewDocId(const Value: Integer);
begin
  FPreviewDocId := Value;
end;

procedure TPluginIteractClass.SetpreviewFilename(const Value: String);
begin
  FpreviewFilename := Value;
end;

procedure TPluginIteractClass.SetpreviewStyle(const Value: TTCPreviewType);
begin
  FpreviewStyle := Value;
end;

procedure TPluginIteractClass.SetProcessBatch(const Value: String);
begin
  FProcessBatch := Value;
  //
  if FProcessBatch <> '' then
    begin

    end;
end;

procedure TPluginIteractClass.Setprocessstring(const Value: String);
begin
  Fprocessstring := Value;
end;

procedure TPluginIteractClass.SetResultString(const Value: String);
begin
  FResultString := Value;
end;

{TEmailClient}
Constructor TEmailClient.Create(AOwner: TComponent);
begin
  Inherited ;
  SMTP      := TIdSMTP.Create(Self);
  IdMsgSend := TIdMessage.Create(Self);
end;

Destructor TEmailClient.Destroy;
begin
  SMTP.Free;
  IdMsgSend.Free;
  Inherited;
end;

Function TEmailClient.SendEmail:Integer;
begin
  result := -1;
  Try
    if SMTP.Connected then
    begin
      IdMsgSend.ReplyTo.EMailAddresses := IdMsgSend.From.Address;
      smtp.Send(IdMsgSend);
      result := 0;
    end;
  Except

  end;
end;

Function TEmailClient.Connect:Boolean;
begin
  Result := SMTP.Connected;
  if Result Then exit;
  Try
    SMTP.Connect;
    if SMTP.Password <> '' then
    begin
    {$IFDEF COMPILER12_UP}
      SMTP.Authenticate


    {$ELSE}

    if  SMTP.ValidateAuthLoginCapability  then
    begin
      SMTP.AuthType := satDefault;
      SMTP.Authenticate;
    end;
    {$ENDIF COMPILER12_UP}
    end;
  Except
  end;
  Result := SMTP.Connected;  
end;

Procedure TEmailClient.AddAttachement(AFile:String;aDisplayName:String);
begin

 with TIdAttachmentFile.Create(IdMsgSend.MessageParts)do

   begin
      LoadFromFile(AFile);
      Filename := AFile  ;

      ContentDescription := ChangeFileExt(aDisplayName,ExtractFileExt(AFile))   ;

   end;


end;


Procedure TEmailClient.Clear;
begin
  MailMessage.Body.Clear;;
  MailMessage.CCList.Clear;
  MailMessage.Recipients.Clear;
  IdMsgSend.Clear;  
end;


{ TBooksCollection }

function TBooksCollection.ActiveBooks: TBooksCollectionItem;
  var
   i : Integer ;
begin
 result :=  SelectedBooks ;
  for i := 0 to self.Count -1 do
   if self.Books[i].FActive then
    begin
       result := self.Books[i] ;
       exit ;
    end;
  if (result = nil) and (self.Count <>0 ) then
    Result := self.Books[0]; 
end;

procedure TBooksCollection.DeselectBooks;
 var
   i : Integer ;
begin
  for i := 0 to self.Count -1 do
   self.Books[i].FSelected  := false ;
end;

function TBooksCollection.FindBooksByName(
  AName: String): TBooksCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if UpperCase(self.Books[i].FName) = UpperCase(AName) then
    begin
       result := self.Books[i] ;
       exit ;
    end;
end;

function TBooksCollection.FindBooksByNameServerAndPath(
  APath,AName,AServer: String): TBooksCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if (UpperCase(self.Books[i].FDatabase) = UpperCase(APath)) and
      (UpperCase(self.Books[i].FName) = UpperCase(AName)) and
      (UpperCase(self.Books[i].FServer) = UpperCase(AServer))  then
    begin
       result := self.Books[i] ;
       exit ;
    end;
end;


function TBooksCollection.FindBooksByPath(
  APath: String): TBooksCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if UpperCase(self.Books[i].FDatabase) = UpperCase(APath) then
    begin
       result := self.Books[i] ;
       exit ;
    end;
end;

function TBooksCollection.GetBooks(index: Integer): TBooksCollectionItem;
begin
 result := TBooksCollectionItem(self.Items[index]);
end;


function TBooksCollection.GetSelected(index: Integer): Boolean;
begin
result := Books[index].Selected ;
end;

procedure TBooksCollection.ScannBooksDir(ADir: String);
var
 ASearchRec : TSearchRec ;
begin
 if FindFirst(IncludeTrailingPathDelimiter(ADir)+'*.*',faDirectory,ASearchRec) = 0 then
    begin
    repeat
      if (ASearchRec.Name <> '.') and (ASearchRec.Name <> '..') then
         begin
            if FileExists(IncludeTrailingPathDelimiter(ADir)+ASearchRec.Name+PathDelim+'books.fdb') then
             begin
               if self.FindBooksByPath(IncludeTrailingPathDelimiter(ADir)+ASearchRec.Name+PathDelim+'books.fdb') = nil then
                 begin
                    with Add as TBooksCollectionItem do
                      begin
                        Database :=  IncludeTrailingPathDelimiter(ADir)+ASearchRec.Name+PathDelim+'books.fdb' ;
                        Name := ASearchRec.Name ;
                        UserName := 'sysdba';
                        Password :=   'masterkey' ;
                      end;
                 end;

              end else
              begin
               ScannBooksDir(IncludeTrailingPathDelimiter(ADir)+ASearchRec.Name);
              end;
         end;
    until FindNext(ASearchRec) <> 0;
    FindClose(ASearchRec);
    end;
end;

function TBooksCollection.SelectedBooks: TBooksCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if self.Books[i].FSelected then
    begin
       result := self.Books[i] ;
       exit ;
    end;
end;

procedure TBooksCollection.SetActive(Index: Integer);
var
 i : Integer ;
begin
  for i :=0  to self.Count -1 do
    self.Books[i].Active := false ;
  books[index].Active := true ;

end;

procedure TBooksCollection.setActiveByName(AName: String);
begin
  if FindBooksByName(AName) <> nil then
    SetActive(FindBooksByName(AName).Index);
end;

procedure TBooksCollection.setActiveByPath(APath: String);
begin
  if FindBooksByPath(APath) <> nil then
    SetActive(FindBooksByPath(APath).Index);

end;

procedure TBooksCollection.SetBooks(index: Integer;
  const Value: TBooksCollectionItem);
begin
  self.Items[index].Assign(Value);
end;


procedure TBooksCollection.SetSelected(index: Integer;
  const Value: Boolean);
begin
  Books[index].Selected := Value ;
end;

procedure TBooksCollection.SwitchOrgStart(AFrom, ATo: String);
  var
   i : Integer ;
begin
  for i := 0 to self.Count -1 do
  if trim(self.Books[i].FServer) = '' then
   if Pos(UpperCase(AFrom) ,UpperCase(self.Books[i].FDatabase)) = 1 then
    begin
       self.Books[i].FDatabase := ATo + copy(self.Books[i].FDatabase,length(AFrom)+1,255) ;
    end;
end;

{ TTranslationCollection }

function TTranslationCollection.FindIndexOfId(AId: Integer): Integer;
var
 i : Integer ;
begin
 result :=  -1 ;
 for i := 0 to self.Count -1 do
   if self.translation[i].FIndexID = AId then
   begin
     result := i ;
     exit ;
   end;
end;


function TTranslationCollection.GetTextLang(AId: Integer): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 0 to self.Count -1 do
   if self.translation[i].FIndexID = AId then
   begin
     result := self.translation[i].Text ;
     exit ;
   end;
end;

function TTranslationCollection.GetTextNum(Atrans: String): Integer;
var
 i : Integer ;
begin
 result := 0 ;
 for i := 0 to self.Count -1 do
   if   self.translation[i].Text = Atrans then
   begin
     result := self.translation[i].FIndexID ;
     exit ;
   end;
end;

function TTranslationCollection.Gettranslation(
  index: Integer): TTranslationCollectionItem;
begin
 result := TTranslationCollectionItem(self.Items[index]);
end;

procedure TTranslationCollection.Settranslation(index: Integer;
  const Value: TTranslationCollectionItem);
begin
  self.Items[index].Assign(Value);
end;

{ TGlobalDataObject }

procedure TGlobalDataObject.Clear;
begin
    FBooks.Clear;
    FRegistration.Registered := false ;
    FRegistration.CompanyName := '' ;
    FRegistration.SerialNumber := '' ;
    FCurrentLanguage.Clear;
    FDefaultLanguage.Clear ;
    FFirstTime := true ;
end;

constructor TGlobalDataObject.Create(AOwner: TComponent);
begin
  inherited;
    FBooks:= TBooksCollection.Create(self,TBooksCollectionItem);
    FRegistration:= TRegistration.Create;
    FCurrentLanguage:= TTranslationCollection.Create(self,TTranslationCollectionItem);
    FDefaultLanguage := TTranslationCollection.Create(self,TTranslationCollectionItem);
    FLanguages:= TLanguageCollection.Create(self,TLanguageCollectionItem);
    FDefaultLangSaveObject:= TTranslationSaveObject.Create(self);
    FDefaultLangSaveObject.FaTranslationCollection :=  FDefaultLanguage ;
    FTranslationSaveObject:= TTranslationSaveObject.Create(self);
    FTranslationSaveObject.FaTranslationCollection :=  FCurrentLanguage ;
    FirstTime := true ;
end;

destructor TGlobalDataObject.Destroy;
begin
    FBooks.Free ;
    FRegistration.Free ;
    FCurrentLanguage.Free ;
    FDefaultLanguage.free ;
    FLanguages.free ;
  inherited;
end;


procedure TGlobalDataObject.LoadFromFile(AFilename: String);
Var AStream : TFileStream ;
begin
    AStream := TFileStream.create( AFilename,fmOpenRead) ;
 try
   AStream.ReadComponent(self);
 
 finally
    AStream.free ;
 end;
 FLoadedFile :=  AFilename ;
end;

procedure TGlobalDataObject.Save;
begin
 SaveToFile(FLoadedFile);
end;

Procedure WriteT3IniFile(SSection,SKey,SValue:String);
// iType =0 for boolean , 1 for String
Var
  OSFIniFile:TIniFile;
  aFile : String ;
begin
  try
  aFile :=  TDMTCCoreLink.GetLocalBaseDir + TDatabaseRegistyRoutines.GetAppValue('ININAME') ;

  OSFIniFile := TIniFile.Create(aFile);
  try
  OSFIniFile.WriteString(SSection,Skey,SValue);
  finally
  OSFIniFile.Free;
  end;
  except

  end;
end;

procedure TGlobalDataObject.SaveToFile(AFilename: String);
Var AStream : TFileStream ;
begin
 WriteT3IniFile('INFO','SERIAL',Registration.SerialNumber);
 AStream := TFileStream.create( AFilename,fmCreate) ;
 try
   AStream.WriteComponent(self);
 finally
    AStream.free ;
 end;
end;

procedure TGlobalDataObject.SetBooks(const Value: TBooksCollection);
begin
  FBooks.Assign( Value);
end;

procedure TGlobalDataObject.SetCurrentLanguage(
  const Value: TTranslationCollection);
begin
  FCurrentLanguage.Assign(Value);
end;

procedure TGlobalDataObject.SetDefaultLangSaveObject(
  const Value: TTranslationSaveObject);
begin
  FDefaultLangSaveObject := Value;
end;

procedure TGlobalDataObject.SetDefaultLanguage(
  const Value: TTranslationCollection);
begin
  FDefaultLanguage := Value;
end;

procedure TGlobalDataObject.SetFirstTime(const Value: Boolean);
begin
  FFirstTime := Value;
end;

procedure TGlobalDataObject.SetLanguages(const Value: TLanguageCollection);
begin
  FLanguages.Assign( Value);
end;

procedure TGlobalDataObject.SetLoadedFile(const Value: String);
begin
  FLoadedFile := Value;
end;

procedure TGlobalDataObject.SetRegistration(const Value: TRegistration);
begin
  FRegistration.Assign( Value);
end;


procedure TGlobalDataObject.SetTranslationSaveObject(
  const Value: TTranslationSaveObject);
begin
  FTranslationSaveObject := Value;
end;


{ TLanguageCollection }

function TLanguageCollection.findLanguageByName(
  AName: String): TLanguageCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if uppercase(self.Language[i].FName) = uppercase(AName) then
    begin
       result := self.Language[i] ;
       exit ;
    end;
end;

function TLanguageCollection.GetLanguage(
  index: Integer): TLanguageCollectionItem;
begin
 result := TLanguageCollectionItem(self.Items[index]);
end;

procedure TLanguageCollection.SetLanguage(index: Integer;
  const Value: TLanguageCollectionItem);
begin
  self.Items[index].Assign(Value);
end;

procedure TLanguageCollection.SetActiveLanguage(Index: Integer);
var
 i : Integer ;
begin
  for i :=0  to self.Count -1 do
    self.Language[i].Active := false ;
  Language[index].Active := true ;

end;



function TLanguageCollection.GetActiveLanguage: TLanguageCollectionItem;
  var
   i : Integer ;
begin
 result := nil ;
  for i := 0 to self.Count -1 do
   if self.Language[i].FActive then
    begin
       result := self.Language[i] ;
       exit ;
    end;
  if Result = nil then
    if Self.Count > 0 then
    Result := self.Language[0]
  //  else
  //  raise Exception.Create('Fail to get language!');
end;

procedure TLanguageCollection.SetDefault;
begin
if findLanguageByName('English') <> nil then
   SetActiveLanguage(findLanguageByName('English').Index)
   else
   if self.Count <> 0 then
      SetActiveLanguage(0);


end;


{ TLanguageCollectionItem }

procedure TLanguageCollectionItem.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

{ TTranslationSaveObject }

procedure TTranslationSaveObject.LoadFromFile(AFilename: String);
Var
 AStream : TFileStream ;
begin
 try
 AStream := TFileStream.Create(AFilename,fmOpenRead) ;
 try
   LoadFromStream(AStream);
 finally
    AStream.free ;
 end;
 FLastFileName := AFilename;
 except
    // dont handel

 end;
end;

procedure TTranslationSaveObject.LoadFromStream(AStream: TStream);
var
 bStream :TMemoryStream ;
 MyOrgFormat : TStreamOriginalFormat ;
begin
 bStream := TMemoryStream.create ;
 try
  try
    ObjectTextToBinary(AStream,BStream,MyOrgFormat);
    bStream.Position := 0 ;
    bStream.ReadComponent(self);
  except
     aStream.Position := 0 ;
     aStream.ReadComponent(self);
  end;
 finally
   bStream.free ;
 end;
 Self.Name := '' ;
end;

procedure TTranslationSaveObject.SaveToFile(AFilename: String);
Var
 AStream : TFileStream ;
 i : Integer ;
begin
 for i :=  aTranslationCollection.Count -1 downto 0 do
   begin
     if aTranslationCollection[i].Text = '' then
      if aTranslationCollection[i].IndexID > 999998 then
       aTranslationCollection.delete(i) else
      if aTranslationCollection[i].IndexID < 0 then
       aTranslationCollection.delete(i);
   end;

 AStream := TFileStream.Create(AFilename,fmCreate	) ;
 try

   SaveToStream(AStream);

 finally
    AStream.free ;
 end;
 FLastFileName := AFilename;
end;

procedure TTranslationSaveObject.SaveToStream(AStream: TStream);
var
 BStream : TMemoryStream ;

begin
  BStream := TMemoryStream.Create ;
   try
   BStream.WriteComponent(self);
   BStream.Position := 0 ;

   ObjectBinaryToText(bStream,AStream);


   finally
     BStream.free ;
   end;


end;

procedure TTranslationSaveObject.SetaTranslationCollection(
  const Value: TTranslationCollection);
begin
  FaTranslationCollection := Value;
end;

procedure TTranslationSaveObject.SetLastFileName(const Value: String);
begin
  FLastFileName := Value;

end;

{ TBooksCollectionItem }

procedure TBooksCollectionItem.AssignTo(Dest: TPersistent);
begin

  if (dest is TBooksCollectionItem) then
    begin
       ( dest as TBooksCollectionItem).FPassword := Self.FPassword ;
       ( dest as TBooksCollectionItem).FConnectionType := Self.FConnectionType ;
       ( dest as TBooksCollectionItem).FServer := Self.FServer ;
       ( dest as TBooksCollectionItem).FUserName := Self.FUserName ;
       ( dest as TBooksCollectionItem).Fdriver := Self.Fdriver ;
       ( dest as TBooksCollectionItem).FDatabase := Self.FDatabase ;
       ( dest as TBooksCollectionItem).FName := Self.FName ;

    end else
    inherited;
end;

function TBooksCollectionItem.GetFileSaveDir: String;
var
 AIni : TStringList ;
  OwnBaseDir,aFile : String ;
begin
 AIni := TStringList.create ;
 try
   aFile :=  ExtractFilePath(GetModuleName(MainInstance))+ TDatabaseRegistyRoutines.GetAppValue('ININAME') ;
   if  FileExists(aFile)  then
   begin
    AIni.LoadFromFile(aFile);

   OwnBaseDir := AIni.Values['OWNBASEDIR'] ;
   end;
 finally
   AIni.free ;
 end;

 if server <> '' then
    begin
      result := ExtractFileDir(Database);
      ExcludeTrailingPathDelimiter(Result);
      result := ExtractFilePath(GetModuleName(MainInstance))+'localfiles\'+ ExtractFileName(Result) ;
      if OwnBaseDir <> '' then
         result := IncludeTrailingPathDelimiter(OwnBaseDir)+  ExtractFileDir(Database) ;
    end
    else result := ExtractFilePath(Database);
 Result := IncludeTrailingPathDelimiter(result) ;
end;
procedure TBooksCollectionItem.SetActive(const Value: Boolean);
begin
  FActive := Value;
end;

procedure TBooksCollectionItem.SetSelected(const Value: Boolean);
begin
  FSelected := Value;
end;



{ TOSFSpecialDaysItem }

procedure TOSFSpecialDaysItem.SetDENDDATETIME(const Value: TDateTime);
begin
  FDENDDATETIME := Value;
end;

procedure TOSFSpecialDaysItem.SetDSTARTDATETIME(const Value: TDateTime);
begin
  FDSTARTDATETIME := Value;
end;

procedure TOSFSpecialDaysItem.SetSDESCRIPTION(const Value: String);
begin
  FSDESCRIPTION := Value;
end;

procedure TOSFSpecialDaysItem.SetWCOLOR(const Value: Integer);
begin
  FWCOLOR := Value;
end;

procedure TOSFSpecialDaysItem.SetWPRIORITY(const Value: Integer);
begin
  FWPRIORITY := Value;
end;

procedure TOSFSpecialDaysItem.SetWRESOURCEID(const Value: Integer);
begin
  FWRESOURCEID := Value;
end;

procedure TOSFSpecialDaysItem.SetWTYPEID(const Value: Integer);
begin
  FWTYPEID := Value;
end;

{ TOSFSpecialDaysCollection }

function TOSFSpecialDaysCollection.GetitemOnDate(
  ADate: TDateTime): TOSFSpecialDaysItem;
  var
  i  : Integer ;
  Hour,Minute,Sec,Milsec : Word ;
  fHour,fMinute,fdec,fMilsec : Word ;
  tHour,tMinute,tdec,tMilsec : Word ;
begin
 result := nil ;
 for i := 0 to Self.Count -1 do
   begin
      if SpecialDaysItem[i].FWTYPEID = 1 then
        begin
           if DayOfWeek(ADate) = DayOfWeek(SpecialDaysItem[i].FDSTARTDATETIME) then
             begin
               DecodeTime(ADate,Hour,Minute,Sec,Milsec);
               DecodeTime(SpecialDaysItem[i].FDSTARTDATETIME,fHour,fMinute,fdec,fMilsec);
               DecodeTime(SpecialDaysItem[i].FDENDDATETIME,tHour,tMinute,tdec,tMilsec);

              if ( EncodeTime(Hour,Minute,Sec,Milsec) >= EncodeTime(fHour,fMinute,fdec,fMilsec)) and
                 (EncodeTime(Hour,Minute,Sec,Milsec) < EncodeTime(tHour,tMinute,tdec,tMilsec)) then
                 begin
                   result := SpecialDaysItem[i] ;
                   exit;
                 end;
             end;
        end else
        begin
          if (SpecialDaysItem[i].FDSTARTDATETIME <= ADate) and (SpecialDaysItem[i].FDENDDATETIME > ADate) then
             begin
               result := SpecialDaysItem[i] ;
               exit;
             end;
        end;
   end;
end;

function TOSFSpecialDaysCollection.GetSpecialDaysItem(
  index: integer): TOSFSpecialDaysItem;
begin
   result := TOSFSpecialDaysItem(self.Items[index]);
end;

procedure TOSFSpecialDaysCollection.Init(AResourceId: Integer);
var
 AQuery : TuniQuery ;
 aITem : TOSFSpecialDaysItem ;
begin
  self.Clear ;
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.text := 'select * from EVENTSPECIALDAYS where WTypeId = 2 or (WRESOURCEID = :WRESOURCEID) order by WPRIORITY DESC' ;
   AQuery.params[0].AsInteger := AResourceId ;
   AQuery.open ;
   While not AQuery.eof do
      begin
        aITem := TOSFSpecialDaysItem(self.Add) ;
        aITem.FDSTARTDATETIME := AQuery.fieldByName('DSTARTDATETIME').AsDateTime ;
        aITem.FWCOLOR := AQuery.fieldByName('WCOLOR').AsInteger ;
        aITem.FWPRIORITY := AQuery.fieldByName('WPRIORITY').AsInteger ;
        aITem.FWRESOURCEID := AQuery.fieldByName('WRESOURCEID').AsInteger ;
        aITem.FWTYPEID := AQuery.fieldByName('WTYPEID').AsInteger ;
        aITem.FDENDDATETIME := AQuery.fieldByName('DENDDATETIME').AsDateTime ;
        aITem.FSDESCRIPTION := AQuery.fieldByName('SDESCRIPTION').AsString ;
        AQuery.next ;
      end;
 finally
  AQuery.free ;
 end;
end;

procedure TOSFSpecialDaysCollection.SetSpecialDaysItem(index: integer;
  const Value: TOSFSpecialDaysItem);
begin
  self.Items[index].Assign(Value);
end;

{ TStockRecList }

procedure TStockRecList.Clear;
var
 i : integer ;
begin
 for i := 0 to AStockList.Count -1 do
    begin
      Dispose(AStockList.Items[i]);
    end;
 AStockList.Clear ;
end;

procedure TStockRecList.CopyStockRec(AFrom: TStockRecPointer;
  var ato: TStockRec);
begin
   ato.WStockID := AFrom^.WStockID;
   ato.SDescription := AFrom^.SDescription;
   ato.SExtraDesc := AFrom^.SExtraDesc;
   ato.Smanufacturer := AFrom^.Smanufacturer;
   ato.FPrice1 := AFrom^.FPrice1;
   ato.FPrice2 := AFrom^.FPrice2;
   ato.FPrice3 := AFrom^.FPrice3;
   ato.FSellingPrice := AFrom^.FSellingPrice;
   ato.FDiscount := AFrom^.FDiscount;
   ato.SBARCODENUMBER := AFrom^.SBARCODENUMBER;
   ato.SSTOCKCODE := AFrom^.SSTOCKCODE;
   ato.WInputTaxID := AFrom^.WInputTaxID;
   ato.WOutputTaxID := AFrom^.WOutputTaxID;
   ato.SInTax := AFrom^.SInTax;
   ato.SOutTax := AFrom^.SOutTax;
   ato.FInputRate := AFrom^.FInputRate;
   ato.FOutputRate := AFrom^.FOutputRate;
   ato.FQtyOnHand := AFrom^.FQtyOnHand;
   ato.FQtyInOrder := AFrom^.FQtyInOrder;
   ato.FQtyExpected := AFrom^.FQtyExpected;
   ato.FReorderQty := AFrom^.FReorderQty;
   ato.FReorderQtyTrig := AFrom^.FReorderQtyTrig;
   ato.FminimumQty := AFrom^.FminimumQty;
   ato.FUnpostedItems := AFrom^.FUnpostedItems;
   ato.FUnitCost := AFrom^.FUnitCost;
   ato.FAvgUnitCost := AFrom^.FAvgUnitCost;
   ato.FNettoWeigth := AFrom^.FNettoWeigth;
   ato.FGrossWeigth := AFrom^.FGrossWeigth;
   ato.WConstOfSaleSACCOUNTId := AFrom^.WConstOfSaleSACCOUNTId;
   ato.WSaleSACCOUNTId := AFrom^.WSaleSACCOUNTId;
   ato.WStockAccountId := AFrom^.WStockAccountId;
   ato.WStockTypeId := AFrom^.WStockTypeId;
   ato.WUnitId := AFrom^.WUnitId;
   ato.BApplyDiscount := AFrom^.BApplyDiscount;
   ato.wLocBatSerTypeid := AFrom^.wLocBatSerTypeid;
   ato.SSTOCKCODESUP1 := AFrom^.SSTOCKCODESUP1;
   ato.WDefaultLinegroup1id := AFrom^.WDefaultLinegroup1id;
end;

constructor TStockRecList.create;
begin
 AStockList := TList.Create ;
end;

destructor TStockRecList.Destroy;
begin
  clear ;
  AStockList.Free ;
  inherited;
end;

function TStockRecList.getStock(var aStockRec: TStockRecPointer;AStockCode : String  ) : Boolean ;
var
 i : integer ;

 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 result := false ;
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.SSTOCKCODE = AStockCode then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        result := true ;
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  TDataBaseStockRoutines.GetStockID(AStockCode) ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    aStockRec  := MyRecPointer ;

end;

function TStockRecList.getStockCode(AStockId : Integer ) : String;
var
 i : integer ;
 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.WStockID = AStockId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  AStockId ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    result := MyRecPointer^.SSTOCKCODE ;
end;


function TStockRecList.GetStockCodeAndDescription(
  AStockid: Integer): String;
var
 i : integer ;
 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.WStockID = AStockId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  AStockId ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    result := Trim(MyRecPointer^.SSTOCKCODE + ' ' + MyRecPointer^.SDescription) ;
end;

function TStockRecList.getStockDefUnit(AStockId: Integer): integer;
var
 i : integer ;
 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.WStockID = AStockId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  AStockId ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    result := MyRecPointer^.WUnitId ;
end;

function TStockRecList.getStockDescription(AStockId: Integer): String;
var
 i : integer ;
 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.WStockID = AStockId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  AStockId ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    result := MyRecPointer^.SDescription ;
end;

function TStockRecList.GetStockid(AStockcode: String): Integer;
var
 i : integer ;
 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.SSTOCKCODE = UpperCase(AStockcode) then
         begin
          found := true ;
          Break ;
         end;
    end;
  if not found then
     begin
        new(MyRecPointer) ;
        MyRecPointer^.WStockID := TDataBaseStockRoutines.GetStockID(UpperCase(AStockcode)) ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    result := MyRecPointer^.WStockID ;
end;

function TStockRecList.getStockOnid(var aStockRec: TStockRecPointer;
  AStockId: Integer): Boolean;
var
 i : integer ;

 MyRecPointer : TStockRecPointer ;
 found : Boolean ;
begin
 MyRecPointer := nil ;
 result := false ;
 found := false ;
 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.WStockID = AStockId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        result := true ;
        new(MyRecPointer) ;
        MyRecPointer^.WStockID :=  AStockId ;
        TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
        AStockList.Add(MyRecPointer);
     end;
    aStockRec  := MyRecPointer ;

end;

function TStockRecList.reinitStock(AStockCode: String): Boolean;
var
 i : integer ;

 MyRecPointer : TStockRecPointer ;

begin
 result := false ;


 for i := 0 to AStockList.Count -1 do
    begin
      MyRecPointer := AStockList.Items[i] ;
      if MyRecPointer^.SSTOCKCODE = AStockCode then
         begin
         TDataBaseStockRoutines.StockLoadItem(MyRecPointer^);
         result := True ;
         Break ;
         end;
    end;
end;

{ TAccountRecList }

procedure TAccountRecList.Clear;
var
 i : integer ;
begin
 for i := 0 to AAccList.Count -1 do
    begin
      Dispose(AAccList.Items[i]);
    end;
 AAccList.Clear ;
end;

constructor TAccountRecList.create;
begin
  AAccList := TList.Create ;
end;

destructor TAccountRecList.Destroy;
begin
  Clear ;
  AAccList.free ;
  inherited;
end;

function TAccountRecList.getAccount(var aAccRec: TAccountRecPointer;
  AAccountCode: String): Boolean;
var
 i : integer ;

 MyRecPointer : TAccountRecPointer ;
 found : Boolean ;
begin
 result := false ;
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AAccList.Count -1 do
    begin
      MyRecPointer := AAccList.Items[i] ;
      if MyRecPointer^.SACCOUNTCODE = AAccountCode then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        result := true ;
        new(MyRecPointer) ;
        MyRecPointer^.WAccountID :=  TDataBaseRoutines.GetAccountIdFromCodeAndType(AAccountCode,-1) ;
        TDataBaseRoutines.loadAccountItem(MyRecPointer^);
        AAccList.Add(MyRecPointer);
     end;
    aAccRec  := MyRecPointer ;

end;


function TAccountRecList.getAccountType(AAccountId: Integer): integer;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := aAccRec^.WAccountTypeID ;
end;



function TAccountRecList.getAccountCode(AAccountId: Integer): String;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := TDataBaseRoutines.AccTypeToChar(aAccRec^.WAccountTypeID) +  aAccRec^.SACCOUNTCODE ;
end;

function TAccountRecList.getAccountCodeWithDash(
  AAccountId: Integer): String;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := TDataBaseRoutines.AccTypeToChar(aAccRec^.WAccountTypeID) +  TDataBaseRoutines.AddDashInAccCodeNoPRefix(aAccRec^.SACCOUNTCODE) ;

end;

function TAccountRecList.GetAccountDefTaxAccount(
  AAccountId: Integer): Integer;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := aAccRec^.TAXACCOUNT;
end;

function TAccountRecList.getAccountFullDescription(
  AAccountid: Integer): String;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := Trim(TDataBaseRoutines.AccTypeToChar(aAccRec^.WAccountTypeID) +  aAccRec^.SACCOUNTCODE +' ' + aAccRec^.SDescription) ;
end;


function TAccountRecList.GetAccountGroup1(AAccountId: Integer): Integer;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);

 Result := aAccRec^.group1;
end;

function TAccountRecList.getAccountOnid(var aAccRec: TAccountRecPointer;
  AAccountId: Integer): Boolean;
var
 i : integer ;

 MyRecPointer : TAccountRecPointer ;
 found : Boolean ;
begin
 MyRecPointer := nil ;
 result := false ;
 found := false ;
 for i := 0 to AAccList.Count -1 do
    begin
      MyRecPointer := AAccList.Items[i] ;
      if MyRecPointer^.WAccountID = AAccountId then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        result := true ;
        new(MyRecPointer) ;
        MyRecPointer^.WAccountID :=  AAccountId ;
        TDataBaseRoutines.loadAccountItem(MyRecPointer^);
        AAccList.Add(MyRecPointer);
     end;
    aAccRec  := MyRecPointer ;

end;

function TAccountRecList.getAccountSimpelCode(AAccountId: Integer): String;
var
 aAccRec: TAccountRecPointer;
begin
 getAccountOnid(aAccRec,AAccountId);
 Result := aAccRec^.SACCOUNTCODE ;
end;

function TAccountRecList.GetTaxRateOnId(AAccountId: Integer): Double;
var
 aAccRec : TAccountRecPointer ;
begin
  getAccountOnid(aAccRec,AAccountId);
  Result := aAccRec^.FRate ;
end;

{ TGroupRecList }

procedure TGroupRecList.Clear;
var
 i : integer ;
begin
IsInitialized := false ;
 for i := 0 to AGroupList.Count -1 do
    begin
      Dispose(AGroupList.Items[i]);
    end;
 AGroupList.Clear ;
end;

constructor TGroupRecList.create;
begin
 AGroupList := TList.Create ;
end;

destructor TGroupRecList.Destroy;
begin
  clear ;
  AGroupList.Free ;
  inherited;
end;

procedure TGroupRecList.FillListWithReportingGroup(grouptypeeid: Integer;
  AList: TStrings;AsLookup:Boolean=false);

var
 i : integer ;
 AQuery : TuniQuery ;
  Newname: String ;

 MyRecPointer : TGroupRecPointer ;
begin
  AList.clear ;
   AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := DMTCCoreLink.TheZConnection ;
     AQuery.SQL.Text := 'select count(WGroupid) from groups where WGroupTypeid = ' + InttoStr(grouptypeeid)  ;
     AQuery.open ;
 //MyRecPointer := nil ;
 for i := 0 to AGroupList.Count -1 do
    begin
      MyRecPointer := AGroupList.Items[i] ;
      if MyRecPointer^.WGroupTypeID = grouptypeeid then
      if not MyRecPointer^.BDisable  then
         begin
           if not AsLookup then
               begin
                 AList.AddObject(GetGroupNesteldName(MyRecPointer^.WGroupID),TObject(MyRecPointer^.WGroupID)) ;
               end else
               begin
                  AList.AddObject(GetGroupNesteldName(MyRecPointer^.WGroupID)+#9+IntToStr(MyRecPointer^.WGroupID),TObject(MyRecPointer^.WGroupID)) ;
               end;
         end;
     end;
    if (AList.Count <> AQuery.Fields[0].AsInteger) then
      begin
        AQuery.Connection := DMTCCoreLink.TheZConnection ;
        AQuery.SQL.Text := 'select * from v_groups where WGroupTypeid = ' + InttoStr(grouptypeeid);

        AQuery.open ;
        while not AQuery.Eof do
           begin
              Newname := Trim(GetGroupNesteldName(AQuery.Fields[0].AsInteger,AQuery)) ;
              if not AsLookup then
                     begin
                     if AList.IndexOf(Newname) = -1 then
                       AList.AddObject(Newname,TObject(AQuery.Fields[0].AsInteger)) ;
                     end else
                     begin
                       if AList.IndexOf(Newname+#9+IntToStr(AQuery.Fields[0].AsInteger)) = -1 then
                        AList.AddObject(Newname+#9+IntToStr(AQuery.Fields[0].AsInteger),TObject(AQuery.Fields[0].AsInteger)) ;
                     end;
              AQuery.next ;
           end;

      end;

   finally
     AQuery.free ;
   end;

end;

function TGroupRecList.getGroup(var aGroupRec: TGroupRecPointer;
  AGroupid: integer;locQuery : TuniQuery = nil): Boolean;

var
 i : integer ;
 AQuery : TuniQuery ;


 MyRecPointer : TGroupRecPointer ;
 found : Boolean ;
begin
 result := false ;
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AGroupList.Count -1 do
    begin
      MyRecPointer := AGroupList.Items[i] ;
      if MyRecPointer^.WGroupID = AGroupid then
         begin
         found := true ;
         Break ;
         end;
    end;
  if not found then
     begin
        result := true ;
        new(MyRecPointer) ;
       if locQuery = nil then
            AQuery := TuniQuery.Create(nil)
            else
            AQuery :=  locQuery  ;

       try
          if locQuery = nil then
          begin
           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.SQL.Text := 'select * from v_groups groups where WGroupid = ' + InttoStr(AGroupid);
           AQuery.open ;
          end;
         MyRecPointer^.WGroupID :=  AGroupid ;
         MyRecPointer^.WGroupTypeID :=  AQuery.fieldbyname('WGROUPTYPEID').AsInteger ;
         MyRecPointer^.SDescription :=  Trim(AQuery.fieldbyname('SDESCRIPTION').AsString) ;
         MyRecPointer^.WLinkID :=  AQuery.fieldbyname('WPARENTGROUP2ID').AsInteger ;

         MyRecPointer^.Wfontcol :=  AQuery.fieldbyname('WTEXTCOLOR').AsInteger ;
         MyRecPointer^.Wbackcol :=  AQuery.fieldbyname('WCOLOR').AsInteger ;
         MyRecPointer^.BDisable :=  AQuery.fieldbyname('BDISABLE').AsInteger = 1;



       finally
         if locQuery = nil then
         AQuery.free ;
       end;
       AGroupList.Add(MyRecPointer);
     end;
    aGroupRec  := MyRecPointer ;

end;

function TGroupRecList.GetGroupImgName(AGroupid: Integer): String;
begin
 result := ''  ;
{ if FileExists(
  result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\'+ +'\batchsetup.bmp' ; }

 if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.jpg' ) then
    result := DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.jpg';
 if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.bmp' ) then
     result := DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.bmp' ;
 if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.gif' ) then
     result := DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.gif' ;
 if FileExists( DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.png' ) then
    result := DMTCCoreLink.GetLocalSaveDir + 'images\GRP_' + IntToStr(Integer(AGroupid))+'.png' ;
 if not FileExists( result) then
  begin
      result := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select spath from multimedia where STYPE =' +  QuotedStr ('GROUP') + ' and SGROUP = ' +QuotedStr('categories_image')
                 + ' and wrefid = ' + IntToStr(AGroupid))) ;
           if result <> '' then
               begin

                 if pos('file:',result) = 1 then
                   result := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir+'files') + copy(result,6,length(result));
                 if pos('link:',result) = 1  then
                   result := copy(result,6,length(result));

               end;

   end;
  if not FileExists(result )  then
     result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\stock.ico' ;
end;

function TGroupRecList.GetGroupName(AGroupid: Integer): String;
var
  MyRecPointer : TGroupRecPointer ;
begin
    getGroup(MyRecPointer,AGroupid);
    result := MyRecPointer^.SDescription ;
end;

function TGroupRecList.GetGroupNesteldName(AGroupid: Integer;locQuery : TuniQuery = nil): String;
var
  MyRecPointer : TGroupRecPointer ;
  i : Integer ;
begin
   i := 0 ;
    getGroup(MyRecPointer,AGroupid,locQuery);
    result := MyRecPointer^.SDescription ;
    while MyRecPointer^.WLinkID <> 0 do
      begin
          getGroup(MyRecPointer,MyRecPointer^.WLinkID);
          result := MyRecPointer^.SDescription +'@'+ result ;
          inc(i);
          if i >9 then break ;
      end

end;

{ TosFMemo }

procedure TosFMemo.Clear;
begin
 AMemo.Clear ;
end;

constructor TosFMemo.Create(AOwner: TComponent);
var
 p : String ;
begin
  inherited;
  FTypeControl := 0 ;
  try
  p := ClassIDToProgID(sysutils.StringToGUID('{0EED7206-1661-11D7-84A3-00606744831D}')) ;
  except
   p := '' ;
  end;
  if p <> ''then
     FTypeControl := 1 ;
  if TypeControl = 0 then
  begin
    AMemo := StdCtrls.TMemo.Create(self);
    AMemo.Parent := self ;
    AMemo.Align := alClient ;
  end else
  begin
   // self.BorderWidth := 5 ;
    AXControl := TXHTMLEditor.Create(self);
      AXControl.CSS :=  DMTCCoreLink.GetLocalPluginDir + 'XStandard\format.css' ;
     AXControl.Styles := DMTCCoreLink.GetLocalPluginDir + 'XStandard\styles.xml' ;
    AXControl.lang :='nl';
    AXControl.Parent := self ;
    AXControl.Align := alClient ;

    with tpanel.Create(self) do
     begin
         Top := self.Height -20  ;
         Height := 20  ;
         Width := self.Width ;
         Left := 0 ;
         Anchors := [akLeft,akRight,akBottom];
         Parent := self ;
     end;
    localLines := TStringlist.create ;
    localLines.OnChange :=  TextChange ;
  end;

end;

destructor TosFMemo.Destroy;
begin
  if Assigned(AMemo) then
  FreeAndNil(AMemo);
  if Assigned(AXControl) then
  FreeAndNil(AXControl);
  if Assigned(localLines) then
  FreeAndNil(localLines);
  inherited;
end;

function TosFMemo.Getlines: TStrings;
begin
  if TypeControl = 0 then
  result := AMemo.Lines else
  begin
    localLines.Text := GetText ;
    Result := localLines ;
  end;
end;

function TosFMemo.GetMaxLength: Integer;
begin
Result := 0 ;
 if TypeControl = 0 then
 begin
    if AMemo is StdCtrls.TMemo then
    Result :=  (AMemo as  TMemo).MaxLength ;
    if AMemo is DBCtrls.TDBMemo then
    Result :=  (AMemo as  TDBMemo).MaxLength ;

 end else
    Result :=  Fmaxlength ;

end;

function TosFMemo.GetScrollBars: TScrollStyle;
begin
 if TypeControl = 0 then
 begin
    if AMemo is StdCtrls.TMemo then
       Result :=  (AMemo as   StdCtrls.TMemo).ScrollBars ;
    if AMemo is DBCtrls.TDBMemo then
       Result :=  (AMemo as   DBCtrls.TDBMemo).ScrollBars ;
 end else
 result := ssBoth ;

end;

function TosFMemo.GetText: String;
begin
 if TypeControl = 0 then
 begin
 Result := AMemo.Text ;
 end else
 begin
 Result := AXControl.Data ;
 if pos('<!--',result)=1 then
 if pos('-->',result)> 0 then
  delete(result,1,pos('-->',result)+ 2);

 if (pos('<p>',result) =  1) and(pos('<p>',copy(result,3,length(result))) = 0)then 
 begin
  delete(result,1,3);
 if pos('</p>',result) =  (length(Result)-3) then
  delete(result,length(Result)-3,4);
 end;
 end;
end;

function TosFMemo.GetWantReturns: Boolean;
begin
 if TypeControl = 0 then
 begin
    if AMemo is StdCtrls.TMemo then
    Result :=  (AMemo as   StdCtrls.TMemo).WantReturns ;
    if AMemo is DBCtrls.TDBMemo then
    Result :=  (AMemo as   DBCtrls.TDBMemo).WantReturns ;
  end else
   Result := false ;


end;

function TosFMemo.GetWantTabs: Boolean;
begin
 if TypeControl = 0 then
 begin
   if AMemo is StdCtrls.TMemo then
   Result :=  (AMemo as  StdCtrls.TMemo).WantTabs ;
   if AMemo is DBCtrls.TDBMemo then
   Result :=  (AMemo as  DBCtrls.TDBMemo).WantTabs ;
 end else
   Result := false;

end;

function TosFMemo.GetWordWrap: Boolean;
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
Result :=  (AMemo as   StdCtrls.TMemo).WordWrap ;
if AMemo is DBCtrls.TDBMemo then
Result :=  (AMemo as   DBCtrls.TDBMemo).WordWrap ;
end else
result := False ;
end;

procedure TosFMemo.Setlines(const Value: TStrings);
begin
 if TypeControl = 0 then
 begin
  AMemo.Lines.Assign(Value) ;
 end else
 begin
   localLines.Assign(Value) ;
   AXControl.Data := lines.Text ;
 end;
end;

procedure TosFMemo.setMaxLength(const Value: Integer);
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
 (AMemo as   StdCtrls.TMemo).MaxLength := Value ;
if AMemo is DBCtrls.TDBMemo then
 (AMemo as   DBCtrls.TDBMemo).MaxLength := Value ;
 end else
 Fmaxlength := Value ;
end;

procedure TosFMemo.SetScrollBars(const Value: TScrollStyle);
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
 (AMemo as   StdCtrls.TMemo).ScrollBars := Value ;
if AMemo is DBCtrls.TDBMemo then
 (AMemo as   DBCtrls.TDBMemo).ScrollBars := Value ;
 end ;

end;

procedure TosFMemo.SetText(const Value: String);
begin
 if TypeControl = 0 then
 begin
   AMemo.Text := Value ;
 end else
 begin
    if AXControl.Styles = '' then
     if FileExists(DMTCCoreLink.GetLocalPluginDir + 'XStandard\styles.xml') then
     begin

     AXControl.Styles := DMTCCoreLink.GetLocalPluginDir + 'XStandard\styles.xml' ;
     AXControl.CSS :=  DMTCCoreLink.GetLocalPluginDir + 'XStandard\format.css' ;
    end;
   AXControl.Data := Value ;
 end;
end;

procedure TosFMemo.SetTypeControl(const Value: Integer);
begin
  FTypeControl := Value;
end;

procedure TosFMemo.SetWantReturns(const Value: Boolean);
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
 (AMemo as   StdCtrls.TMemo).WantReturns := Value ;
if AMemo is DBCtrls.TDBMemo then
 (AMemo as   DBCtrls.TDBMemo).WantReturns := Value ;
  end ;
end;

procedure TosFMemo.SetWantTabs(const Value: Boolean);
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
 (AMemo as  StdCtrls.TMemo).WantTabs := Value ;
if AMemo is DBCtrls.TDBMemo then
 (AMemo as  DBCtrls.TDBMemo).WantTabs := Value ;
 end   ;

end;

procedure TosFMemo.SetWordWrap(const Value: Boolean);
begin
 if TypeControl = 0 then
 begin
if AMemo is StdCtrls.TMemo then
 (AMemo as  StdCtrls.TMemo).WordWrap := Value ;
if AMemo is DBCtrls.TDBMemo then
 (AMemo as  DBCtrls.TDBMemo).WordWrap := Value ;
  end;
end;

procedure TosFMemo.TextChange(sender: Tobject);
begin


    AXControl.Data := localLines.Text ;
end;

{ TosfDBMemo }

constructor TosfDBMemo.Create(AOwner: TComponent);
begin
 inherited;
 With TButton.Create(self) do
   begin
     Caption := '*' ;
     OnClick := onDblClickEvent ;
     parent := self ;
     Top := 0 ;
     Left := 0 ;
   end;
 OnDblClick := onDblClickEvent;

end;

destructor TosfDBMemo.Destroy;
begin

  inherited;
end;



procedure TosfDBMemo.onDblClickEvent(sender: Tobject);
var
atext : String ;
begin
   aText := Self.Text ;
   if ShowEditor(atext) = mrok   then
       Text := aText ;
end;

class function TosfDBMemo.ShowEditor(var Atext: String): TModalresult;
var
AForm : Tform ;
ABottom : TPanel ;
aosFMemo : TosFMemo ;
begin
   AForm :=  TForm.Create(Application) ;
       try
         ABottom := TPanel.create(aform) ;
         //ABottom.Top := AForm.Height -20  ;
         ABottom.Height := 30 ;
         //ABottom.Width := AForm.Width ;
         //ABottom.Left := 0 ;
         ABottom.Align := alBottom ;
          AForm.Caption := 'Edit HTML' ;
         ABottom.Parent := AForm ;
         With TButton.create(AForm) do
            begin
               Top := 0 ;
               Left := 10;
               Caption := 'Ok' ;
               ModalResult := mrok ;
               Parent := ABottom ;
            end;
         With TButton.create(AForm) do
            begin
               Top := 0 ;
               Left := 150;
               Caption := 'Cancel' ;
               ModalResult := mrCancel ;
               Parent := ABottom ;
            end;
         aosFMemo := TosFMemo.Create(AForm) ;
         with aosFMemo do
            begin
               Align := alClient ;
               Text := Atext ;
               Parent := AForm ;
            end;

        AForm.Position := poScreenCenter ;
        AForm.Width := 800 ;
        AForm.Height := 600 ;
        ABottom.BringToFront ;
       if AForm.showmodal = mrOk then
         Atext := aosFMemo.Text ;
        result := AForm.ModalResult ;
       finally
         AForm.free ;
       end;
end;

{ TDescriptionRecList }

procedure TDescriptionRecList.Clear;

var
 i : integer ;
begin
 for i := 0 to AdescList.Count -1 do
    begin
      Dispose(AdescList.Items[i]);
    end;
 AdescList.Clear ;
end;


constructor TDescriptionRecList.create;
begin
  AdescList := TList.Create ;
end;

destructor TDescriptionRecList.Destroy;
begin
  Clear ;
  AdescList.free ;
  inherited;
end;

function TDescriptionRecList.GetAddDescription(aDescription: String;
  Unique: Boolean): Integer;
Var
  ExtraMsg,StrMessage,SpaceTrails:String;
  ZQMessage : TuniQuery ;
  NewID, i : Integer ;
 MyRecPointer : TDescriptionRecPointer ;
begin
  result := 0 ;
  if aDescription = '' then exit ;
   SpaceTrails := '' ;
  StrMessage := aDescription ;
  ExtraMsg := Copy(Trim(aDescription),DMTCCoreLink.MessageLength +1,Length(StrMessage));
  for i := length(ExtraMsg) downto 1 do
    begin
       if (ExtraMsg[i] in [' ',#13,#10]) then
          delete(ExtraMsg,i,1)
        else break ;
    end;


  StrMessage:=Copy(StrMessage,1,DMTCCoreLink.MessageLength);
  for i := length(StrMessage) downto 1 do
    begin
       if (StrMessage[i] in [' ',#13,#10]) then
          SpaceTrails := StrMessage[i] + SpaceTrails
        else break ;
    end;
  StrMessage := trim(StrMessage);
  if ExtraMsg <> '' then
    ExtraMsg := SpaceTrails + ExtraMsg ;


  ZQMessage := TuniQuery.Create(nil) ;
  try
  ZQMessage.Connection := DMTCCoreLink.TheZConnection;
  if StrMessage='' then
  begin

    ZQMessage.sql.text := 'Select WMessageID from messages where WMessageID = 0' ;
    ZQMessage.Open ;
    if ZQMessage.IsEmpty  then
    begin
      ZQMessage.sql.Text := 'INSERT INTO MESSAGES (WMESSAGEID, SDESCRIPTION, SEXTRADESCRIPTION) VALUES (0,' + QuotedStr('') +',null)' ;
      ZQMessage.ExecSQL ;
      ZQMessage.sql.text := 'Select WMessageID from messages where WMessageID = 0' ;
      ZQMessage.Open ;
    end ;
  end else // Else not empty
  begin
   // done : Pieter i gess you dont want to override the extra message lets do it like this then
    if ExtraMsg = '' then
       begin
           ZQMessage.sql.text := 'select WMessageID from MESSAGES where SExtraDescription is null and Sdescription = :SDescription' ;
           ZQMessage.ParamByName('sdescription').AsString :=  StrMessage ;
           ZQMessage.Open ;
           if  ZQMessage.IsEmpty or Unique then
            begin
              NewID := DMTCCoreLink.GetNewId(tcidNEWMESSAGEID);
              ZQMessage.sql.Text := 'INSERT INTO MESSAGES (WMESSAGEID, SDESCRIPTION, SEXTRADESCRIPTION) VALUES ('+IntTostr(NewID)+',:a,null)' ;
              ZQMessage.params[0].asstring := StrMessage ;
              ZQMessage.ExecSQL ;
              Result := NewID ;
            end ;
        end else // extra message
        begin
           ZQMessage.sql.text := 'select WMessageID from MESSAGES where SExtraDescription = :SExtraDesc and Sdescription = :SDescription' ;
           ZQMessage.ParamByName('sdescription').AsString :=  StrMessage ;
           ZQMessage.ParamByName('SExtraDesc').AsString :=  ExtraMsg ;
           ZQMessage.Open ;
           if  ZQMessage.IsEmpty or Unique then
            begin
              NewID := DMTCCoreLink.GetNewId(tcidNEWMESSAGEID);
              ZQMessage.sql.Text := 'INSERT INTO MESSAGES (WMESSAGEID, SDESCRIPTION, SEXTRADESCRIPTION) VALUES ('+IntTostr(NewID)+',:a,:b)' ;
              ZQMessage.params[0].asstring :=  StrMessage ;
              ZQMessage.params[1].asstring :=  ExtraMsg ;
              ZQMessage.ExecSQL ;
              Result := NewID ;
            end ;
       end;
  end; // else not empty



  if not ZQMessage.IsEmpty then
    begin
       Result := ZQMessage.fieldByName('WMessageID').AsInteger ;
       if not IdExsist(Result,StrMessage + ExtraMsg) then
           begin
              new(MyRecPointer) ;
              MyRecPointer^.WdescriptionId := Result ;
              MyRecPointer^.SDescription := copy(StrMessage + ExtraMsg,1,255) ;
              MyRecPointer^.SDescription2 := copy(StrMessage + ExtraMsg,256,255);
              MyRecPointer^.SDescription3 := copy(StrMessage + ExtraMsg,512,255);
              MyRecPointer^.SDescription4 := copy(StrMessage + ExtraMsg,768,255);
              MyRecPointer^.SDescription5 := copy(StrMessage + ExtraMsg,1024,255);
              AdescList.Add(MyRecPointer);
           end ;

    end;
  finally
  ZQMessage.free ;
  end;
end;

function TDescriptionRecList.IdExsist(MessageID: Integer;UpdateText : String): boolean;
var
 i : integer ;
 MyRecPointer : TDescriptionRecPointer ;
begin
 result := false ;
 MyRecPointer := nil ;
 for i := 0 to AdescList.Count -1 do
    begin
      MyRecPointer := AdescList.Items[i] ;
      if MyRecPointer^.WdescriptionId = MessageID then
         begin

              MyRecPointer^.SDescription := copy(UpdateText,1,255) ;
              MyRecPointer^.SDescription2 := copy(UpdateText,256,255);
              MyRecPointer^.SDescription3 := copy(UpdateText,512,255);
              MyRecPointer^.SDescription4 := copy(UpdateText,768,255);
              MyRecPointer^.SDescription5 := copy(UpdateText,1024,255);

           result := true ;
           Break ;
         end;
    end;
end;
function TDescriptionRecList.ReadDescription(MessageID: Integer): String;
var
 i : integer ;

 MyRecPointer : TDescriptionRecPointer ;
 found : Boolean ;
 AQuery : TuniQuery ;

begin
 result := '' ;
 found := false ;
 MyRecPointer := nil ;
 for i := 0 to AdescList.Count -1 do
    begin
      MyRecPointer := AdescList.Items[i] ;
      if MyRecPointer^.WdescriptionId = MessageID then
         begin
           result :=  MyRecPointer^.SDescription + MyRecPointer^.SDescription2 + MyRecPointer^.SDescription3+  MyRecPointer^.SDescription4 + MyRecPointer^.SDescription5 ;
           found := true ;
           Break ;
         end;
    end;
  if not found then
     begin
           Result :='';
            AQuery := TuniQuery.create(nil) ;
            try
            AQuery.Connection := DMTCCoreLink.TheZConnection ;
            AQuery.SQL.Text := 'Select * from Messages where WMessageID =' + IntToStr(MessageID);
            AQuery.Open;
            Result := AQuery.fieldByName('SDescription').AsString + AQuery.fieldByName('SExtraDescription').AsString;
            finally
              AQuery.free ;
            end;
        new(MyRecPointer) ;
        MyRecPointer^.WdescriptionId := MessageID ;
        MyRecPointer^.SDescription := copy(Result,1,255) ;
        MyRecPointer^.SDescription2 := copy(Result,256,255);
        MyRecPointer^.SDescription3 := copy(Result,512,255);
        MyRecPointer^.SDescription4 := copy(Result,768,255);
        MyRecPointer^.SDescription5 := copy(Result,1024,255);
        AdescList.Add(MyRecPointer);
     end;


end;
procedure TDescriptionRecList.UpdateDescription(MessageID: Integer;
  aDescription: String);
Var
  ExtraMsg,StrMessage,SpaceTrails:String;
  ZQMessage : TuniQuery ;
  i : Integer ;
   MyRecPointer : TDescriptionRecPointer ;
begin
  if MessageID = 0 then exit ;
  SpaceTrails := '' ;
  StrMessage := aDescription ;
  ExtraMsg := Copy(Trim(aDescription),DMTCCoreLink.MessageLength +1,Length(StrMessage));
  for i := length(ExtraMsg) downto 1 do
    begin
       if (ExtraMsg[i] in [' ',#13,#10]) then
          delete(ExtraMsg,i,1)
        else break ;
    end;


  StrMessage:=Copy(StrMessage,1,DMTCCoreLink.MessageLength);
  for i := length(StrMessage) downto 1 do
    begin
       if (StrMessage[i] in [' ',#13,#10]) then
          SpaceTrails := StrMessage[i] + SpaceTrails
        else break ;
    end;
  StrMessage := trim(StrMessage);
  if ExtraMsg <> '' then
    ExtraMsg := SpaceTrails + ExtraMsg ;

  ZQMessage := TuniQuery.Create(nil) ;
  try
  ZQMessage.Connection := DMTCCoreLink.TheZConnection;
  ZQMessage.sql.Text := 'update MESSAGES Set SDESCRIPTION = :SDESCRIPTION , SEXTRADESCRIPTION = :SEXTRADESCRIPTION where WMessageID = ' + IntToStr(MessageID) ;
  ZQMessage.Params[0].AsString :=  StrMessage ;
  ZQMessage.Params[1].AsString :=  ExtraMsg ;
  ZQMessage.ExecSQL ;
  finally
  ZQMessage.free ;
  end;
  if not IdExsist(MessageID,StrMessage + ExtraMsg) then
    begin
              new(MyRecPointer) ;
              MyRecPointer^.WdescriptionId := MessageID ;
              MyRecPointer^.SDescription := copy(StrMessage + ExtraMsg,1,255) ;
              MyRecPointer^.SDescription2 := copy(StrMessage + ExtraMsg,256,255);
              MyRecPointer^.SDescription3 := copy(StrMessage + ExtraMsg,512,255);
              MyRecPointer^.SDescription4 := copy(StrMessage + ExtraMsg,768,255);
              MyRecPointer^.SDescription5 := copy(StrMessage + ExtraMsg,1024,255);
              AdescList.Add(MyRecPointer);

    end;
end;

end.

