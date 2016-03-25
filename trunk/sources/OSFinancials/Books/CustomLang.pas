{Copyright 2006 Pieter Valentijn under GPL licence}
unit CustomLang;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls,    DBAccess , Uni,
    StdCtrls, Mask,
  ComCtrls, Buttons, DBClient, DBCtrls,TcashClasses, Menus,
   MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, VirtualTable, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSplitter, cxMemo, dbcgrids, Grids, DBGrids,
  cxGridCardView, cxGridDBCardView ;

type
  TfmCustomLang = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    btnDelete: TBitBtn;
    dsCustLanguage: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Shape2: TShape;
    Label4: TLabel;
    Shape1: TShape;
    DbcbSelect: TComboBox;
    bttCreat: TButton;
    edtNewLang: TEdit;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Shape3: TShape;
    Label3: TLabel;
    dbedtEdit: TDBMemo;
    Label5: TLabel;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    CheckAddAll1: TMenuItem;
    BExportToTab: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Findunchanged1: TMenuItem;
    TsTypes: TTabSheet;
    ZTypes: TuniTable;
    dsTypes: TDataSource;
    ZTypesWTYPEID: TIntegerField;
    ZTypesSDESCRIPTION: TStringField;
    ZTypesWTYPEPARENT: TIntegerField;
    TabSheet2: TTabSheet;
    ZQTypesTrns: TuniQuery;
    ZQTypesTrnsWTYPEID: TIntegerField;
    ZQTypesTrnsWLANGUAGEID: TIntegerField;
    ZQTypesTrnsSDESCRIPTION: TStringField;
    DataSource1: TDataSource;
    ZQAccTrns: TuniQuery;
    ZQAccTrnsWACCOUNTID: TIntegerField;
    ZQAccTrnsWLANGUAGEID: TIntegerField;
    ZQAccTrnsSDESCRIPTION: TStringField;
    DataSource2: TDataSource;
    ZQGroupstrn: TuniQuery;
    ZQGroupstrnWGROUPID: TIntegerField;
    ZQGroupstrnWLANGUAGEID: TIntegerField;
    ZQGroupstrnSDESCRIPTION: TStringField;
    ZQGroupstrnWGROUPDESCID: TIntegerField;
    DataSource3: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    CDSTranslation: TVirtualTable;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1TRANSLATION: TcxGridDBColumn;
    cxGrid1DBTableView1ENGTEXT: TcxGridDBColumn;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    CBFindSame: TCheckBox;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Button2: TButton;
    EReplaceWith: TEdit;
    EReplace: TEdit;
    Button1: TButton;
    EYourname: TEdit;
    EYourmail: TEdit;
    cbFindChanged: TCheckBox;
    Shape4: TShape;
    Panel4: TPanel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Shape5: TShape;
    cxSplitter1: TcxSplitter;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBCardView1: TcxGridDBCardView;
    cxGrid2DBCardView1WGROUPID: TcxGridDBCardViewRow;
    cxGrid2DBCardView1WLANGUAGEID: TcxGridDBCardViewRow;
    cxGrid2DBCardView1SDESCRIPTION: TcxGridDBCardViewRow;
    cxGrid2DBCardView1WGROUPDESCID: TcxGridDBCardViewRow;
    cxSplitter2: TcxSplitter;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    EDescofEmptyAccount: TEdit;
    Button3: TButton;
    EDescofEmptyGroup: TEdit;
    Button5: TButton;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid3DBTableView1WLANGUAGEID: TcxGridDBColumn;
    cxGrid3DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid3DBCardView1: TcxGridDBCardView;
    cxGrid3DBCardView1WLANGUAGEID: TcxGridDBCardViewRow;
    cxGrid3DBCardView1SDESCRIPTION: TcxGridDBCardViewRow;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGrid5: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBCardView1: TcxGridDBCardView;
    cxGridDBCardViewRow1: TcxGridDBCardViewRow;
    cxGridDBCardViewRow2: TcxGridDBCardViewRow;
    cxGridLevel1: TcxGridLevel;
    cxGrid4DBTableView1WTYPEID: TcxGridDBColumn;
    cxGrid4DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid4DBTableView1WTYPEPARENT: TcxGridDBColumn;
    cxSplitter3: TcxSplitter;
    CDSTranslationID: TIntegerField;
    CDSTranslationTRANSLATION: TWideStringField;
    CDSTranslationENGTEXT: TWideStringField;
    BReloadUseCodePage: TButton;
    ECodepage: TEdit;
    procedure CheckAddLang(aTranslationCollection : TTranslationCollection; transName : String);
    procedure BtnCloseClick(Sender: TObject);
    procedure DbcbSelectChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bttCreatClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button55Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CBFindSameClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CDSTranslationFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CDSTranslationBeforeInsert(DataSet: TDataSet);
    procedure CDSTranslationBeforeDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure CDSTranslationBeforePost(DataSet: TDataSet);
    procedure CheckAddAll1Click(Sender: TObject);
    procedure BExportToTabClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Findunchanged1Click(Sender: TObject);
    procedure ZTypesAfterInsert(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure CDSTranslationAfterInsert(DataSet: TDataSet);
    procedure dbGridLanguageKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure ZTypesAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure ZQTypesTrnsWLANGUAGEIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ZQAccTrnsAfterOpen(DataSet: TDataSet);
    procedure ZQGroupstrnAfterInsert(DataSet: TDataSet);
    procedure ZQGroupstrnAfterOpen(DataSet: TDataSet);
    procedure ZQAccTrnsWLANGUAGEIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure BReloadUseCodePageClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    FATranslationSaveObject: TTranslationSaveObject;
    { Private declarations }
    Procedure LoadLangs;

    procedure SetATranslationSaveObject(
      const Value: TTranslationSaveObject);

  public
    OrderBy : Integer ;
    Direction ,DataisChanged,InLoad : Boolean ;
    MaxId,LastID : Integer ;
    LangList : Tstringlist ;
    procedure LoadToCDS ;
    procedure SaveFromCDS ;

    property ATranslationSaveObject : TTranslationSaveObject  read FATranslationSaveObject write SetATranslationSaveObject;

    { Public declarations }
  end;

var
  fmCustomLang: TfmCustomLang;
  CusttblName : String;

implementation

uses Database, GlobalFunctions,Main, TcVariables, DatabaseAccess, XRoutines,
  UDMTCCoreLink, OSFGeneralRoutines, UDmQuantumGridDefs;

{$R *.DFM}



procedure TfmCustomLang.CheckAddLang(aTranslationCollection : TTranslationCollection; transName : String);
var
 Change : Boolean ;
 i : Integer ;
 Procedure CheckAndAdd(LabelID : Integer ; DefaultEng : String ) ;
  begin
  if aTranslationCollection.FindIndexOfId(LabelID) = -1 then
      begin
      with aTranslationCollection.Add as TTranslationCollectionItem do
        begin
          IndexID := LabelID ;
          Text := DefaultEng ;
          Change := true;
        end;
      end;
  end;
begin
  Change := false ;
   // Add if not there


CheckAndAdd(3325 ,'<- Set selected to this price');
CheckAndAdd(3326 ,'Openitem');
CheckAndAdd(3327 ,'Clieop comment');
CheckAndAdd(3328 ,'City');

CheckAndAdd(3329 ,'Cur');
CheckAndAdd(3330 ,'Quote');
CheckAndAdd(3331 ,'P');
CheckAndAdd(3332 ,'LP');
CheckAndAdd(3333 ,'Order');
CheckAndAdd(3334 ,'Exp');
CheckAndAdd(3335 ,'Log level');
CheckAndAdd(3336 ,'Next batch nr');

CheckAndAdd(3337 ,'Backcolor');
CheckAndAdd(3338 ,'Frontcolor');

CheckAndAdd(3339 ,'Link image');
CheckAndAdd(3340 ,'Clear image');

CheckAndAdd(3340 ,'Clear image');
CheckAndAdd(3341 ,'Init all translations and plugins');

CheckAndAdd(3342 ,'Show colors');
CheckAndAdd(3343 ,'Find invalide');

CheckAndAdd(3344 ,'Adjust payment date');

CheckAndAdd(3345 ,'Consolidating lines and using tax will mess up your tax report! please make sure you do not use tax or do not consolidate lines.!');
CheckAndAdd(3346 ,'As PDF file')  ;
CheckAndAdd(3347 ,'Timeslot')  ;

CheckAndAdd(3348 ,'Show at startup')  ;

CheckAndAdd(3349 ,'There is document input asossiated with this project do you wish to continue ? all project data will be lost')  ;
CheckAndAdd(3350 ,'There is transaction input asossiated with this project do you wish to continue ? all project data will be lost')  ;
CheckAndAdd(3351 ,'There are unposted documents you cannot close this project!');
CheckAndAdd(3352 ,'Sales, Purchase, Cost of sales and tax accounts');

CheckAndAdd(3353 ,'Open transactions only');
CheckAndAdd(3354 ,'Remove fault links');
CheckAndAdd(3355 ,'Transfare transactions');
CheckAndAdd(3356 ,'Payroll import');
CheckAndAdd(3357 ,'Free selection');
CheckAndAdd(3358 ,'AutoPymt');

CheckAndAdd(3359 ,'Barcode printer');
CheckAndAdd(3360 ,'Label printer');
CheckAndAdd(3361 ,'Use multiprinter');

CheckAndAdd(3362 ,'change remark');
CheckAndAdd(3363 ,'Please enter change remark');
CheckAndAdd(3364 ,'No remaker entered operation aborted!');

CheckAndAdd(3365 ,'Stock Qty has been changed do you want to retain the current database data?');

CheckAndAdd(3366 ,'Manual adjust');

CheckAndAdd(3367 ,'Continue action %s ?');

CheckAndAdd(3368 ,'Standard Column balance');

CheckAndAdd(3369 ,'The data of this document has changed by a other user or input screen. %s Do you wish to override the data? ');
CheckAndAdd(3370 ,'User exit!');

CheckAndAdd(3371 ,'Do you wish to clear all documents or set them to unposted?');

CheckAndAdd(3372 ,'Budget vs actual');
CheckAndAdd(3373 ,'This year vs last year');


CheckAndAdd(3374 ,'Tools');
CheckAndAdd(3375 ,'External system links');
CheckAndAdd(3376 ,'financial tools');

CheckAndAdd(3377 ,'Generic plugins');


CheckAndAdd(3378 ,'Freefields');
CheckAndAdd(3379 ,'Multimedia');
CheckAndAdd(3380 ,'Price agreement');
CheckAndAdd(3381 ,'Stockcheck');
CheckAndAdd(3382 ,'QuickOrder');
CheckAndAdd(3383 ,'E-commerce');
CheckAndAdd(3384 ,'Activa');
CheckAndAdd(3385 ,'Office');
CheckAndAdd(3386 ,'Sql browser');
CheckAndAdd(3387 ,'Drill down');
CheckAndAdd(3388 ,'Xml audit file');

CheckAndAdd(3389 ,'Pos display');
CheckAndAdd(3390 ,'Send package');
CheckAndAdd(3391 ,'Subscriptions');
CheckAndAdd(3392 ,'Web export');
CheckAndAdd(3393 ,'Customer on hold');
CheckAndAdd(3394 ,'Document email pro');
CheckAndAdd(3395 ,'HORECA Pos');
CheckAndAdd(3396 ,'RETAIL Pos');
CheckAndAdd(3397 ,'Charter');
CheckAndAdd(3398 ,'Location-Serilization-batches');
CheckAndAdd(3400 ,'Remittance');

CheckAndAdd(3401 ,'Reportman');
CheckAndAdd(3402 ,'Handytools');
CheckAndAdd(3403 ,'Register plugins');
CheckAndAdd(3404 ,'Export / import');

CheckAndAdd(3405 ,'Stock plugins');
CheckAndAdd(3406 ,'Document plugins');
CheckAndAdd(3407 ,'Branch specific');
CheckAndAdd(3408 ,'Driverschool plugin');
CheckAndAdd(3409 ,'Postalcode / tax id / regno lookup');
CheckAndAdd(3410 ,'Dutch tax plugin');
CheckAndAdd(3411 ,'CCV Pin');
CheckAndAdd(3412 ,'Pos points');
CheckAndAdd(3413 ,'Controler login');
CheckAndAdd(3414 ,'Multi user agenda');
CheckAndAdd(3415 ,'Woodsales');
CheckAndAdd(3416 ,'Document export import');
CheckAndAdd(3417 ,'Promeetec');

CheckAndAdd(3418 ,'Plugin load list');
CheckAndAdd(3419 ,'Activate plugin');
CheckAndAdd(3420 ,'Deactivate plugin');
CheckAndAdd(3421 ,'Use tabs in stock');

CheckAndAdd(3422 ,'You are not yet registered to post on our forum you will need to register osFinancials then you can use that username password to login to our forum or shop.');

CheckAndAdd(3423 ,'Copy to');
CheckAndAdd(3424 ,'Delete not local (Books this pc can not find)');

CheckAndAdd(3425 ,'Reprint ticket');
CheckAndAdd(3426 ,'Rental / reservations');
CheckAndAdd(3427 ,'Calculate minutes');
CheckAndAdd(3428 ,'Minutes inactive');
CheckAndAdd(3429 ,'Std disc%');
CheckAndAdd(3430 ,'Document id');
CheckAndAdd(3431 ,'webshop/forum login and Newsletters');

CheckAndAdd(3432 ,'Step status');
CheckAndAdd(3433 ,'Process');
CheckAndAdd(3434 ,'Date last action');
CheckAndAdd(3435 ,'Step name');
CheckAndAdd(3436 ,'Used time');
CheckAndAdd(3437 ,'View closed');
CheckAndAdd(3438 ,'Belgische btw aangifte');

CheckAndAdd(3439 ,'Retype password');
CheckAndAdd(3440 ,'Branches');
CheckAndAdd(3441 ,'Skypename');

CheckAndAdd(3442 ,'Reset pass (email new pw to you)');
CheckAndAdd(3443 ,'Open webshop');
CheckAndAdd(3444 ,'Change password');

CheckAndAdd(3445 ,'Please register osFinancials first!');
CheckAndAdd(3446 ,'To register plugins you need to register osFinancials first!');
CheckAndAdd(3447 ,'Timelicence');


CheckAndAdd(3448 ,'Current total');
CheckAndAdd(3449 ,'No points used! please us points or close window!');
CheckAndAdd(3450 ,'Use point');

CheckAndAdd(3451 ,'Current points');
CheckAndAdd(3452 ,'Points to use');



CheckAndAdd(3453 ,'General DIV ledger');

CheckAndAdd(3454 ,'Symbol');
CheckAndAdd(3455 ,'Rate');

CheckAndAdd(3465 ,'Tax classes');
CheckAndAdd(3466 ,'Tax class');

CheckAndAdd(3467 ,'Force stocktype check');

CheckAndAdd(3468 ,'Default costgroup');

CheckAndAdd(3469 ,'Workflow setup');
CheckAndAdd(3470 ,'Currencies');
CheckAndAdd(3471 ,'I have read this instruction and i understaind the action!');

CheckAndAdd(3472 ,'Payment discount');
CheckAndAdd(3473 ,'Payment diverence');
CheckAndAdd(3474 ,'Auto process');

CheckAndAdd(3475 ,'Outlook sync');
CheckAndAdd(3476 ,'Sync to osF');
CheckAndAdd(3477 ,'From osf To outlook');
CheckAndAdd(3478 ,'Sync Email');
CheckAndAdd(3479 ,'Email link');
CheckAndAdd(3480 ,'Outlook syngroniser');


CheckAndAdd(3481 ,'Document links');
CheckAndAdd(3482 ,'Links from');
CheckAndAdd(3483 ,'Links to');
CheckAndAdd(3484 ,'Link');
CheckAndAdd(3485 ,'Where am i?');
CheckAndAdd(3486 ,'Step hint');

CheckAndAdd(3487 ,'Rights');
CheckAndAdd(3488 ,'Add step');
CheckAndAdd(3489 ,'Edit step');
CheckAndAdd(3490 ,'Delete step');
CheckAndAdd(3491 ,'Transition');
CheckAndAdd(3492 ,'Create Transition');
CheckAndAdd(3493 ,'Duration');
CheckAndAdd(3494 ,'Years');

CheckAndAdd(3495 ,'Status text');
CheckAndAdd(3496 ,'Screentype');
CheckAndAdd(3497 ,'Stepname');
CheckAndAdd(3498 ,'Stepdata');
CheckAndAdd(3499 ,'You still have a detail screen open press cancel or save to close.');
CheckAndAdd(3500 ,'Add transition');
CheckAndAdd(3501 ,'Condition');


CheckAndAdd(3502 ,'Next process date');
CheckAndAdd(3503 ,'Curent value');
CheckAndAdd(3504 ,'Purchase date');
CheckAndAdd(3505 ,'Write-off type');
CheckAndAdd(3506 ,'Write-off period');
CheckAndAdd(3507 ,'Linked transaction');
CheckAndAdd(3508 ,'Rest-amount');
CheckAndAdd(3509 ,'Write-off percentage');

CheckAndAdd(3510 ,'Next write-off amount');
CheckAndAdd(3511 ,'Total write-off on ledger');
CheckAndAdd(3512 ,'Needs processing');
CheckAndAdd(3513 ,'New transactions');
CheckAndAdd(3514 ,'Add manual');
CheckAndAdd(3515 ,'Posted transactions');
CheckAndAdd(3516 ,'Process (selected) lines');
CheckAndAdd(3517 ,'Purchase amount');
CheckAndAdd(3518 ,'Activa');
CheckAndAdd(3519 ,'Add (selected) lines');
CheckAndAdd(3520 ,'add consolidated');
CheckAndAdd(3521 ,'Show for this user');
CheckAndAdd(3522 ,'Selection');
CheckAndAdd(3523 ,'Adjust remittance date of selection to :');
CheckAndAdd(3524 ,'No auto incasso');
CheckAndAdd(3525 ,'With a remittance date from');
CheckAndAdd(3526 ,'Openitems with paydate from');
CheckAndAdd(3527 ,'Email filter');
CheckAndAdd(3528 ,'Email selected');
CheckAndAdd(3529 ,'Edit remittance');
CheckAndAdd(3530 ,'Print all');
CheckAndAdd(3531 ,'Edit report');
CheckAndAdd(3532 ,'Show report');
CheckAndAdd(3533 ,'Default days no remittance');
CheckAndAdd(3534 ,'Update multimedia');
CheckAndAdd(3535 ,'This action will adjust the lats date remittance at the "selected" debtors. Do you wish to continue?');
CheckAndAdd(3536 ,'This action will adjust the lats date remittance at the "ALL VISIBLE" debtors. Do you wish to continue?');
CheckAndAdd(3537 ,'Popup if there are transactions');
CheckAndAdd(3538 ,'Date oldest transaction');
CheckAndAdd(3539 ,'Date last remittance');

CheckAndAdd(3540 ,'Design edit fields');
CheckAndAdd(3541 ,'Design search fields');
CheckAndAdd(3542 ,'Search sql');
CheckAndAdd(3543 ,'Lookup language');
CheckAndAdd(3544 ,'Type of control');
CheckAndAdd(3545 ,'Heigth');
CheckAndAdd(3546 ,'Size');
CheckAndAdd(3547 ,'Translation');
CheckAndAdd(3548 ,'Col origin');
CheckAndAdd(3549 ,'Save and rebuild');
CheckAndAdd(3550 ,'Copy as new');
CheckAndAdd(3551 ,'Gen on table');
CheckAndAdd(3552 ,'Sql and extra data');
CheckAndAdd(3553 ,'Fieldtype');
CheckAndAdd(3554 ,'Default value');
CheckAndAdd(3555 ,'Write off for %s ended do you want to clear the activa accounts?');

CheckAndAdd(3556 ,'Project');
CheckAndAdd(3557 ,'Create entries');
CheckAndAdd(3558 ,'Entries createded!');
CheckAndAdd(3559 ,'Bulk time entry');

CheckAndAdd(3560 ,'Stock out');
CheckAndAdd(3561 ,'Stock in');
CheckAndAdd(3562 ,'Limit rows');

CheckAndAdd(3563 ,'User tab');
CheckAndAdd(3564 ,'Auto learn');
CheckAndAdd(3564 ,'Add to group');
CheckAndAdd(3565 ,'Unlinked items');

CheckAndAdd(3567 ,'Show inactive');










// CheckAndAdd(3355 ,'Open transactions only');


//CheckAndAdd(3329 ,'Lookup transactions');




// CheckAndAdd(3157 ,'Linked options');













  //CheckAndAdd(1992 ,'ULines');
  //CheckAndAdd(1993 ,'ULines');
  //CheckAndAdd(1994 ,'ULines');
  //CheckAndAdd(1995 ,'ULines');
  //CheckAndAdd(1996 ,'ULines');
  //CheckAndAdd(1997 ,'ULines');
  //CheckAndAdd(1998 ,'ULines');
  //CheckAndAdd(1999 ,'ULines');
  // plugins translation starts at 20000
  // TCDrilldown basic
CheckAndAdd(20000,'You cannot create recursive levels');
CheckAndAdd(20001,'Confirm');
CheckAndAdd(20002,'Delete record?');
CheckAndAdd(20003,'Delete all selected records?');
CheckAndAdd(20004,'Click here to add a new row');
CheckAndAdd(20005,'Filter is Empty>');
CheckAndAdd(20006,'Customization');
CheckAndAdd(20007,'Columns');
CheckAndAdd(20008,'Use your mouse to pull a column here to group on that column');
CheckAndAdd(20009,'Customize...');
CheckAndAdd(20010,'Bands');
CheckAndAdd(20011,'Missing an intermediary component! Please add a %s component to the form.');
CheckAndAdd(20012,'cxGrid does not exist');
CheckAndAdd(20013,'Component does not exist');
CheckAndAdd(20014,'Import error');
CheckAndAdd(20015,'Grid view does not exist');
CheckAndAdd(20016,'Active grid level does not exist');
CheckAndAdd(20017,'Can''t create the export output file');
CheckAndAdd(20018,'ExtLookupComboBox|Represents an ultra-advanced lookup using the QuantumGrid as its drop down control');
CheckAndAdd(20019,'Equal');
CheckAndAdd(20020,'Not equal');
CheckAndAdd(20021,'Less then');
CheckAndAdd(20022,'Less or equal');
CheckAndAdd(20023,'Greater');
CheckAndAdd(20024,'Greater or equal');
CheckAndAdd(20025,'like');
CheckAndAdd(20026,'Not like');
CheckAndAdd(20027,'Between');
CheckAndAdd(20028,'Not between');
CheckAndAdd(20029,'in');
CheckAndAdd(20030,'not in');
CheckAndAdd(20031,'is yesterday');
CheckAndAdd(20032,'is today');
CheckAndAdd(20033,'is tomorrow');
CheckAndAdd(20034,'is last week');
CheckAndAdd(20035,'is last month');
CheckAndAdd(20036,'is last year');
CheckAndAdd(20037,'is this week');
CheckAndAdd(20038,'is this month');
CheckAndAdd(20039,'is this year');
CheckAndAdd(20040,'is next week');
CheckAndAdd(20041,'is next month');
CheckAndAdd(20042,'is next year');
CheckAndAdd(20043,'And');
CheckAndAdd(20044,'Or');
CheckAndAdd(20045,'Not');
CheckAndAdd(20046,'Empty');
CheckAndAdd(20047,'is nul');
CheckAndAdd(20048,'is not nul');
CheckAndAdd(20049,'Begins with');
CheckAndAdd(20050,'Does not begin with');
CheckAndAdd(20051,'Ends with');
CheckAndAdd(20052,'Doe snot ends with');
CheckAndAdd(20053,'Contains');
CheckAndAdd(20054,'Does not contain');
CheckAndAdd(20055,'(All)');
CheckAndAdd(20056,'(Custom...)');
CheckAndAdd(20057,'(Empty)');
CheckAndAdd(20058,'(Not empty)');
CheckAndAdd(20059,'Transactionnr');
CheckAndAdd(20060,'Batchno');
CheckAndAdd(20061,'€ ,0.00');
CheckAndAdd(20062,'Count : 0');
CheckAndAdd(20063,'Export');
CheckAndAdd(20064,'Columns');

CheckAndAdd(20065,'Total sales');
CheckAndAdd(20066,'Total Qty.');
CheckAndAdd(20067,'Total sales per day');
CheckAndAdd(20068,'Total qty. per day');

CheckAndAdd(20069,'Journal');
CheckAndAdd(20070,'Customer invoice');
CheckAndAdd(20071,'Invoice stockitem');
CheckAndAdd(20072,'Stockitem invoice');
CheckAndAdd(20073,'Charts');

CheckAndAdd(20074,'Uniqe stockno');
CheckAndAdd(20075,'Uniqe documentno');
CheckAndAdd(20076,'Uniqe lineno');
CheckAndAdd(20077,'Uniqe accountno');

CheckAndAdd(20078,'This version wil only work till 1-3-2005 for more info go to www.osfinancials.org');

CheckAndAdd(20079,'Open eerst een administratie!');
CheckAndAdd(20080,'About');
CheckAndAdd(20081,'Exit');
CheckAndAdd(20082,'Run SQL');
CheckAndAdd(20083,'Load SQL...');
CheckAndAdd(20084,'Save SQL...');
CheckAndAdd(20085,'Filters');
CheckAndAdd(20086,'Groeping');
CheckAndAdd(20087,'Editor Font...');
CheckAndAdd(20088,'Native Style');
CheckAndAdd(20089,'Open directory');
CheckAndAdd(20090,'Visible columns');
CheckAndAdd(20091,'From');
CheckAndAdd(20092,'Until');

// Grid stuff
CheckAndAdd(20093,'And');
CheckAndAdd(20094,'or');          // any
CheckAndAdd(20095,'and Not'); // not all
CheckAndAdd(20096,'Or not');   // not any
CheckAndAdd(20097,'Filter');
CheckAndAdd(20098,'New &condition');
CheckAndAdd(20099,'New &group');
CheckAndAdd(20100,'&Delete row');
CheckAndAdd(20101,'Delete &all');
CheckAndAdd(20102,'Push this button to add a condition');
CheckAndAdd(20103,'Containts the folowing conditions');
CheckAndAdd(20104,'<Head>');
CheckAndAdd(20105,'<Empty>');
CheckAndAdd(20106,'Cant empty filter');
CheckAndAdd(20107,'Adjusted filter');
CheckAndAdd(20108,'Invalide value');
CheckAndAdd(20109,'Use');
CheckAndAdd(20110,'to present a single character');
CheckAndAdd(20111,'to present multyple characters');
CheckAndAdd(20112,'and');
CheckAndAdd(20113,'or');
CheckAndAdd(20114,'Show rows where :');
CheckAndAdd(20115,'Make filter');
CheckAndAdd(20116,'noname.flt');
CheckAndAdd(20117,'Open a saved filter');
CheckAndAdd(20118,'Save active filter');
CheckAndAdd(20119,'&Save as...');
CheckAndAdd(20120,'&Open...');
CheckAndAdd(20121,'&Apply');
//cxSFilterControlDialogActionOkCaption = 'OK';
//cxSFilterControlDialogActionCancelCaption = 'Annuleer';
CheckAndAdd(20122,'flt');
CheckAndAdd(20123,'Filter (*.flt)|*.flt');
CheckAndAdd(20124,'<No data to display>');
// do check here if annything has change if so then save object.
// Hande all from 1000000 for custom lang
for i := 0 to  TheGlobalDataObject.DefaultLanguage.Count -1 do
  begin
     if TheGlobalDataObject.DefaultLanguage[i].IndexID > 800000 then
       begin
          CheckAndAdd(TheGlobalDataObject.DefaultLanguage[i].IndexID,TheGlobalDataObject.DefaultLanguage[i].Text);
       end;
  end;

if Change then
 begin
  TheGlobalDataObject.TranslationSaveObject.aTranslationCollection := aTranslationCollection ;
  TheGlobalDataObject.TranslationSaveObject.SaveToFile(ExtractFilePath(Application.ExeName)+ 'Bin\Languages\'+ transName +'.dfm');
 end;
end;

Procedure TfmCustomLang.LoadLangs;
Var
  i : Integer ;
begin
 // add languages to the listbox
  for i := 0 to TheGlobalDataObject.Languages.Count -1 do
  begin
    DbcbSelect.Items.AddObject(TheGlobalDataObject.Languages[i].Name,TheGlobalDataObject.Languages[i]);
  end;
  // if the active language is found then
  if TheGlobalDataObject.Languages.ActiveLanguage <> nil then
    begin
     DbcbSelect.ItemIndex:=  DbcbSelect.Items.IndexOfObject(TheGlobalDataObject.Languages.ActiveLanguage);
     DbcbSelectChange(self);
    end;
end;

procedure TfmCustomLang.BtnCloseClick(Sender: TObject);
begin
  SaveFromCDS ;
  TheGlobalDataObject.Save;
  Close;
end;

procedure TfmCustomLang.DbcbSelectChange(Sender: TObject);
Var
  i : Integer ;
  ALanguageItem : TLanguageCollectionItem;
begin
// Save the old cursor
Screen.Cursor := crHourGlass ;
try
// to make sure averything get saved it there was a old language
if TheGlobalDataObject.Languages.ActiveLanguage <> nil then
 // if cource just as there was something loaded.
  if not CDSTranslation.IsEmpty then
    begin
       SaveFromCDS ;
    end;

if DbcbSelect.ItemIndex = -1 then exit ;
ALanguageItem := TLanguageCollectionItem(DbcbSelect.Items.Objects[DbcbSelect.ItemIndex]);

TheGlobalDataObject.Languages.SetActiveLanguage(ALanguageItem.Index);


if FileExists(ExtractFilePath(Application.ExeName)+ 'Bin\Languages\' +  ALanguageItem.filename +'.dfm') then
   TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Bin\Languages\' +  ALanguageItem.filename +'.dfm');

CheckAddLang(TheGlobalDataObject.CurrentLanguage,ALanguageItem.filename);


LoadToCDS ;


  finally
   Screen.Cursor := crDefault ;
  end;
end;

procedure TfmCustomLang.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveFromCDS ;
  ZTypes.close ;
end;


procedure TfmCustomLang.bttCreatClick(Sender: TObject);

Var
  NewLangtbl:String;
  SourceFile,DestFile: string ;
  Ok:Boolean;
  NewID:Integer;

begin
  if edtNewLang.text = 'New Lang' then Raise Exception.create('Please enter a language name!');

  if CDSTranslation.State = dsedit then
  CDSTranslation.Post;
  SaveFromCDS ;
  with TheGlobalDataObject.Languages.Add as TLanguageCollectionItem do
    begin
       Name := edtNewLang.Text ;
       filename := TrimInStr(edtNewLang.Text) ;
       TheGlobalDataObject.Languages.SetActiveLanguage(Index);
    end;
  TheGlobalDataObject.Save;
  TheGlobalDataObject.TranslationSaveObject.SaveToFile(ExtractFilePath(Application.ExeName)+ 'Bin\Languages\' +  TrimInStr(edtNewLang.Text) +'.dfm');


  LoadLangs ;
  

{  if edtNewLang.text = 'New Lang' then Raise Exception.create('Please enter a language name!'); ;
  NewLangtbl:=TrimInStr(edtNewLang.Text)+'.db';
  SourceFile :=  ApplicationPath+DbcbSelect.text+'.db'  ;
  DestFile :=  ApplicationPath +TrimInStr(edtNewLang.Text)+'.db' ;
  dmDatabase.tblLanguage.Open;
  if TableExists then
  begin
     If Not (dmDatabase.tblLanguage.Locate('sLanguageName',Trim(edtNewLang.Text),[])) then
     begin
       NewID:=3;
       dmDatabase.tblLanguage.DisableControls;
       dmDatabase.tblLanguage.First;
       While not dmDatabase.tblLanguage.Eof do
       begin
         if dmDatabase.tblLanguageWLanguageID.Value>=NewID then
           NewID:=dmDatabase.tblLanguageWLanguageID.Value;
         dmDatabase.tblLanguage.Next;
       end;
       Inc(NewID);
       dmDatabase.tblLanguage.Append;
       dmDatabase.tblLanguageWLanguageID.Value:=NewID;
       dmDatabase.tblLanguagesLanguageName.Value:=Trim(edtNewLang.Text);
       dmDatabase.tblLanguagesLanguageFile.Value:=NewLangtbl;
       dmDatabase.tblLanguage.Post;
       dmDatabase.tblLanguage.EnableControls;

procedure TfmCustomLang.dbedtEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
//    dbGridLanguage.SetFocus;
    CDSTranslation.Next;
    Key:=#0;
  end;     end;
  end;
   WriteT3IniFile('Current Language','File',dmDatabase.tblLanguage.FieldByName('sLanguageFile').AsString);
   WriteT3IniFile('Current Language','Name',dmDatabase.tblLanguage.FieldByName('sLanguageName').AsString);

  LoadLangs;
  DbcbSelect.ItemIndex := DbcbSelect.Items.IndexOf(Trim(edtNewLang.Text));
  dmDatabase.tblLanguage.Close;  
end;   }


end;  

procedure TfmCustomLang.btnDeleteClick(Sender: TObject);
Var
  S:String;
begin
{  if (CompareText(DbcbSelect.Text,'Francais')=0) or
    (CompareText(DbcbSelect.Text,'English')=0) or
    (CompareText(DbcbSelect.Text,'Afrikaans')=0) then
  begin
    OSFMessageDlg('Can Not Delete Default Languages',mtError,[mbOk],0);
    exit;
  end;
  if OSFMessageDlg('Do you want do delete this language?',mtinformation,[mbyes,mbno],0)=mrYes then
  begin

    DbcbSelect.ItemIndex:=DbcbSelect.Items.IndexOf('English');
    DeleteFile(ApplicationPath+s);
    dmDatabase.tblLanguage.Open;
    if dmDatabase.tblLanguage.Locate('SLanguageFile',S,[]) then
      dmDatabase.tblLanguage.Delete;
    LoadLangs;
    dmDatabase.tblLanguage.Close;
  end; }
end;

procedure TfmCustomLang.btnSearchClick(Sender: TObject);
begin
  CDSTranslation.Filtered:=False;
  CDSTranslation.OnFilterRecord:=nil;
  if (edit3.text='') and not CBFindSame.Checked  and not cbFindChanged.Checked then exit;
  CDSTranslation.OnFilterRecord:=CDSTranslationFilterRecord;
  CDSTranslation.Filtered:=True;
  Timer1.Enabled := true ;
end;

procedure TfmCustomLang.Edit3Change(Sender: TObject);
begin
  try
   btnSearchClick(Sender);
  Except
  end;
end;

procedure TfmCustomLang.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(244);
             key := 0;

        end;
end;

procedure TfmCustomLang.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmCustomLang.dbedtEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_up then
    CDSTranslation.Prior;
 if key = vk_down then
    CDSTranslation.Next;

end;

procedure TfmCustomLang.Button55Click(Sender: TObject);
var
 i : Integer ;
begin
Timer1.Enabled := false ;
i := 0 ;
 CDSTranslation.DisableControls ;
 try
 CDSTranslation.First ;
 while not CDSTranslation.Eof do
   begin
       inc(i);
       CDSTranslation.Next ;
   end;
 finally
   CDSTranslation.EnableControls ;
 end;
 Label5.Caption := 'Records ' + inttostr(i);
end;

procedure TfmCustomLang.Button2Click(Sender: TObject);
   var
    FoundIndex : Integer ;
begin
 if EReplace.Text <> '' then
  begin
   CDSTranslation.DisableControls ;
   try
   CDSTranslation.Last ;
   while not CDSTranslation.Bof do
     begin
       if pos(EReplace.Text,CDSTranslationTRANSLATION.AsString) <> 0 then
          begin
          FoundIndex := TheGlobalDataObject.CurrentLanguage.FindIndexOfId(CDSTranslationID.AsInteger) ;
          if FoundIndex <> -1 then
            begin
              CDSTranslation.Edit ;
              TheGlobalDataObject.CurrentLanguage[FoundIndex].Text := StringReplace(CDSTranslationTRANSLATION.AsString,EReplace.Text,EReplaceWith.Text,[rfreplaceall]) ;
              CDSTranslationTRANSLATION.AsString := TheGlobalDataObject.CurrentLanguage[FoundIndex].Text;
              CDSTranslation.Post ;
            end;
          end else
       CDSTranslation.Prior ;
     end;
    finally
          CDSTranslation.EnableControls ;
    end;
   end;

end;

procedure TfmCustomLang.RadioGroup1Click(Sender: TObject);
begin
btnSearchClick(self);
end;

procedure TfmCustomLang.CBFindSameClick(Sender: TObject);
begin
btnSearchClick(self);
end;

procedure TfmCustomLang.Button1Click(Sender: TObject);
var
 EmailText,EmailToname , EMailDesc,EmailTopic: String ;
                                                                            
begin
  if CDSTranslation.State = dsedit then
  CDSTranslation.Post;
  SaveFromCDS ;
    if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1' then
    begin
  EmailText := 'developerdoc@lantic.net';
  EMailDesc := 'Turbocash languagefile ' + DbcbSelect.Text;
  EmailToname  := '';//'pvalentijn@turbocash.nl';
  EmailTopic  := 'turbocashlanguagefile ' + DbcbSelect.Text;

    end else
    begin

  EmailText := 'support@osfinancials.org';
  EMailDesc := 'osFinancials languagefile ' + DbcbSelect.Text;
  EmailToname  := '';//'pvalentijn@turbocash.nl';
  EmailTopic  := 'osFinancialslanguagefile ' + DbcbSelect.Text;
  end;
  // todo : Save first
   fmmain.Hide;
  try
  SendaMapiMail(EmailTopic,EMailDesc,
                ExtractFilePath(Application.ExeName)+ 'Bin\Languages\' +  TheGlobalDataObject.Languages.ActiveLanguage.filename +'.dfm' ,
                EYourname.Text,EYourmail.Text,
                EmailToname,EmailText,self.Handle);
  finally
   fmmain.Show;
  end;

end;

procedure TfmCustomLang.CDSTranslationFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=True;
  if CBFindSame.Checked then
    begin
       Accept:=  CDSTranslationTRANSLATION.AsString = CDSTranslationENGTEXT.AsString ;
       exit ;
    end;

  if cbFindChanged.Checked then
    begin
       Accept:= not(CDSTranslationTRANSLATION.AsString = CDSTranslationENGTEXT.AsString);
       exit ;
    end;


  if Edit3.Text='' then
     exit;
  if RadioGroup1.ItemIndex = 1 then
    Accept:= Pos(UpperCase(edit3.Text),UpperCase(CDSTranslationENGTEXT.AsString))<>0
  else
  Accept:= Pos(UpperCase(edit3.Text),UpperCase(CDSTranslationTRANSLATION.AsString))<>0;
end;

procedure TfmCustomLang.CDSTranslationBeforeInsert(DataSet: TDataSet);
begin
// if not DataSet.ControlsDisabled then
// abort ;
end;

procedure TfmCustomLang.CDSTranslationBeforeDelete(DataSet: TDataSet);
begin
if not CDSTranslation.ControlsDisabled then

 if (CDSTranslationID.AsInteger < 1000000) and (CDSTranslationID.AsInteger > 0) then
 abort ;
end;


procedure TfmCustomLang.SetATranslationSaveObject(
  const Value: TTranslationSaveObject);
begin
  FATranslationSaveObject := Value;
end;

procedure TfmCustomLang.FormCreate(Sender: TObject);
begin
 LangList  := TStringList.Create ;
 DMTCCoreLink.GroupsObject.FillListWithReportingGroup(1004,LangList);
 DMTCCoreLink.AssignConnectionToChilds(self);
 ZQAccTrns.open ;
 ZQGroupstrn.open ;
 if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\Languages\English.dfm' ) then
   begin
     TheGlobalDataObject.DefaultLangSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\Languages\English.dfm');
     CheckAddLang(TheGlobalDataObject.DefaultLanguage,'English');
    end;
end;

procedure TfmCustomLang.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnClose.Glyph,'Close');
 DMTCCoreLink.LoadImage(btnDelete.Glyph,'Cancel');
 EDescofEmptyAccount.Text := TDataBaseRoutines.GetAccountDescription(0) ;
 EDescofEmptyGroup.Text := DMTCCoreLink.GroupsObject.GetGroupName(0) ;

 LoadLangs ;
 PageControl1.ActivePageIndex := 0 ;
end;

procedure TfmCustomLang.LoadToCDS;
var
 i,LastId  : Integer ;
 aAnsiString : RawByteString ;
begin
 DataisChanged := False ;
 CDSTranslation.DisableControls ;
 InLoad := True ;
 try
 LastId := CDSTranslationID.AsInteger ;
 while not CDSTranslation.IsEmpty do
  CDSTranslation.Delete ;

  MaxId := 999999 ;
  for i := 0 to TheGlobalDataObject.CurrentLanguage.Count -1 do
   if  TheGlobalDataObject.CurrentLanguage[i].IndexID > 0 then
    begin
      CDSTranslation.Append ;
      CDSTranslationID.AsInteger :=  TheGlobalDataObject.CurrentLanguage[i].IndexID ;
      if  BReloadUseCodePage.Tag = 1 then
        begin
            aAnsiString :=  TheGlobalDataObject.CurrentLanguage[i].Text ;
             SetCodePage(aAnsiString,StrToIntDef(ECodepage.Text,0),false);

           CDSTranslationTRANSLATION.AsWideString := aAnsiString ;
           CDSTranslationENGTEXT.AsWideString :=  TheGlobalDataObject.DefaultLanguage.GetTextLang(TheGlobalDataObject.CurrentLanguage[i].IndexID) ;


        end else
        begin


      CDSTranslationTRANSLATION.AsWideString :=   TheGlobalDataObject.CurrentLanguage[i].Text ;
      CDSTranslationENGTEXT.AsWideString :=  TheGlobalDataObject.DefaultLanguage.GetTextLang(TheGlobalDataObject.CurrentLanguage[i].IndexID) ;
        end;

      CDSTranslationTRANSLATION.AsWideString :=  TheGlobalDataObject.CurrentLanguage[i].Text ;
      CDSTranslationENGTEXT.AsWideString :=  TheGlobalDataObject.DefaultLanguage.GetTextLang(TheGlobalDataObject.CurrentLanguage[i].IndexID) ;
      CDSTranslation.Post ;
      if TheGlobalDataObject.CurrentLanguage[i].IndexID > MaxId then
        MaxId :=  TheGlobalDataObject.CurrentLanguage[i].IndexID ;
    end;
  LastId :=  MaxId ;
 
  CDSTranslation.locate('ID',LastId,[]);
 finally
   CDSTranslation.EnableControls ;
   InLoad := False ;

 end;
end;

procedure TfmCustomLang.SaveFromCDS;
begin
 if TheGlobalDataObject.Languages.ActiveLanguage = nil then exit ;
  if CDSTranslation.State = dsedit then
     CDSTranslation.Post;

 if  DataisChanged then
     begin
     TheGlobalDataObject.TranslationSaveObject.SaveToFile(ExtractFilePath(Application.ExeName)+ 'Bin\Languages\' +  TheGlobalDataObject.Languages.ActiveLanguage.filename +'.dfm');
    // if (LastId <>  MaxId) and (TheGlobalDataObject.CurrentLanguage <>  TheGlobalDataObject.DefaultLanguage) then
    //     TheGlobalDataObject.DefaultLangSaveObject.SaveToFile(TheGlobalDataObject.DefaultLangSaveObject.LastFileName);
     end;
end;

procedure TfmCustomLang.DBMemo1Enter(Sender: TObject);
begin
dbedtEdit.SetFocus ;
end;

procedure TfmCustomLang.CDSTranslationBeforePost(DataSet: TDataSet);
var
 FoundIndex : Integer;
begin

 if InLoad then exit ;
 DataisChanged := True ;
  FoundIndex := TheGlobalDataObject.CurrentLanguage.FindIndexOfId(CDSTranslationID.AsInteger) ;
  if FoundIndex <> -1 then
    begin
       TheGlobalDataObject.CurrentLanguage[FoundIndex].Text := CDSTranslationTRANSLATION.AsString ;
    end else
    begin
        with TheGlobalDataObject.CurrentLanguage.Add  As TTranslationCollectionItem do
          begin
             IndexID := CDSTranslationID.AsInteger ;
             Text := CDSTranslationTRANSLATION.AsString ;
          end;
        with TheGlobalDataObject.DefaultLanguage.Add  As TTranslationCollectionItem do
          begin
             IndexID := CDSTranslationID.AsInteger ;
             Text := CDSTranslationTRANSLATION.AsString ;
          end;
    end;
end;

procedure TfmCustomLang.CheckAddAll1Click(Sender: TObject);
var
 i : Integer ;
begin
 ATranslationSaveObject.aTranslationCollection := TTranslationCollection.Create(ATranslationSaveObject,TTranslationCollectionItem) ;
 try
 for i := 0 to DbcbSelect.Items.Count -1 do
 begin
 if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\Languages\'+DbcbSelect.Items[i]+'.dfm' ) then
   begin
     ATranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\Languages\'+DbcbSelect.Items[i]+'.dfm');
     CheckAddLang(ATranslationSaveObject.aTranslationCollection,DbcbSelect.Items[i]);
    end;
  end;
 finally
    ATranslationSaveObject.aTranslationCollection.free ;
    ATranslationSaveObject.aTranslationCollection := nil ;
 end;
end;

procedure TfmCustomLang.BExportToTabClick(Sender: TObject);
Var
 AFile : TStringlist ;
begin
if Not SaveDialog1.Execute then exit ;
 if TheGlobalDataObject.Languages.ActiveLanguage = nil then exit ;
  if CDSTranslation.State = dsedit then
     CDSTranslation.Post;
CDSTranslation.first ;
AFile := TStringlist.create ;
try
while not CDSTranslation.Eof do
  begin
    AFile.Add(CDSTranslationID.AsString+#9+CDSTranslationTRANSLATION.AsString+#9+CDSTranslationENGTEXT.AsString);
    CDSTranslation.Next ;
  end;
  AFile.SaveToFile(SaveDialog1.FileName);
 finally
   AFile.free ;
 end;
end;

procedure TfmCustomLang.Button4Click(Sender: TObject);
Var
 AFile : TStringlist ;
 i: Integer ;
 Number,Trans : String ;

begin
if Not OpenDialog1.Execute then exit ;
if TheGlobalDataObject.Languages.ActiveLanguage = nil then exit ;
  if CDSTranslation.State = dsedit then
     CDSTranslation.Post;
AFile := TStringlist.create ;
try
AFile.LoadFromFile(OpenDialog1.FileName);
for i:= 0 to AFile.Count-1 do
begin
  trans := AFile[i] ;
  Number := copy(trans,1,pos(#9,trans)-1);
  if pos(#9,trans) <> 0 then
  delete(trans,1,pos(#9,trans));
  if pos(#9,trans) <> 0 then
  trans := copy(trans,1,pos(#9,trans)-1);
  if CDSTranslation.locate('ID',Number,[]) then
    begin
       CDSTranslation.edit ;
       CDSTranslationTRANSLATION.AsString := trans ;
       CDSTranslation.post ;
    end;
  end;
 finally
   AFile.free ;
 end;
end;

procedure TfmCustomLang.Findunchanged1Click(Sender: TObject);
begin
  CDSTranslation.Filtered:=False;
  CDSTranslation.OnFilterRecord:=nil;
  if (edit3.text='') and not CBFindSame.Checked  then exit;
  CDSTranslation.OnFilterRecord:=CDSTranslationFilterRecord;
  CDSTranslation.Filtered:=True;
  Timer1.Enabled := true ;
end;

procedure TfmCustomLang.ZTypesAfterInsert(DataSet: TDataSet);
begin
 DataSet.Cancel ;
// raise Exception.Create('You cannot add a record!');
end;

procedure TfmCustomLang.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePageIndex = 1 then
  if dmDatabase.ZMainconnection.Connected then
   begin
    ZTypes.Connection := dmDatabase.ZMainconnection  ;
    ZTypes.AfterScroll := nil ;
    ZTypes.open ;
    ZTypes.AfterScroll := ZTypesAfterScroll;
    ZTypes.first ;
   end;

end;

procedure TfmCustomLang.CDSTranslationAfterInsert(DataSet: TDataSet);
begin
 if InLoad then exit ;
   inc(MaxId) ;
  CDSTranslationID.AsInteger := MaxId ;

end;

procedure TfmCustomLang.dbGridLanguageKeyPress(Sender: TObject;
  var Key: Char);
begin

 if Key = char(VK_BACK) then
   if (CDSTranslationID.AsInteger > 999999) or( CDSTranslationID.AsInteger <1) then
    if MessageDlg('Delete?',mtConfirmation,[mbyes,mbno],0) = mryes then
      begin
       if TheGlobalDataObject.TranslationSaveObject.aTranslationCollection.FindIndexOfId(CDSTranslationID.AsInteger) <> -1 then
        begin
         TheGlobalDataObject.TranslationSaveObject.aTranslationCollection.Delete(TheGlobalDataObject.TranslationSaveObject.aTranslationCollection.FindIndexOfId(CDSTranslationID.AsInteger));
         TheGlobalDataObject.TranslationSaveObject.SaveToFile(TheGlobalDataObject.TranslationSaveObject.LastFileName);
        end;
         CDSTranslation.Delete ;
         Key := #0 ;         
     end;
end;

procedure TfmCustomLang.Button3Click(Sender: TObject);
begin
 if OSFMessageDlg('Are you sure?',mtConfirmation,[mbyes,mbno],0) =mrno then exit ;
 DMTCCoreLink.ExecSql('update account set Sdescription = ' + QuotedStr(EDescofEmptyAccount.Text) + ' where WAccountid = 0 ' ) ;
end;

procedure TfmCustomLang.ZTypesAfterScroll(DataSet: TDataSet);
var
 i : Integer ;
begin
if ZQTypesTrns.State = dsedit then
  ZQTypesTrns.post ;

ZQTypesTrns.close ;
ZQTypesTrns.Params[0].AsInteger := ZTypesWTYPEID.AsInteger ;
ZQTypesTrns.Open ;
for i := 0 to LangList.Count -1 do
   begin
      if not ZQTypesTrns.Locate('WLANGUAGEID',integer(LangList.Objects[i]),[]) then
        begin
            ZQTypesTrns.Insert ;
            ZQTypesTrnsWTYPEID.AsInteger :=   ZTypesWTYPEID.AsInteger ;
            ZQTypesTrnsWLANGUAGEID.AsInteger :=   integer(LangList.Objects[i]) ;
            ZQTypesTrnsSDESCRIPTION.AsString := ZTypesSDESCRIPTION.AsString ;
            ZQTypesTrns.post ;
        end;
   end;
end;

procedure TfmCustomLang.FormDestroy(Sender: TObject);
begin
 LangList.free ;
end;

procedure TfmCustomLang.ZQTypesTrnsWLANGUAGEIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if LangList.IndexOfObject(Tobject(Sender.AsInteger)) <> -1 then
     text :=   LangList[LangList.IndexOfObject(Tobject(Sender.AsInteger))] ;
end;

procedure TfmCustomLang.ZQAccTrnsAfterOpen(DataSet: TDataSet);
var
 i : Integer ;
begin

for i := 0 to LangList.Count -1 do
   begin
      if not ZQAccTrns.Locate('WLANGUAGEID',integer(LangList.Objects[i]),[]) then
        begin
            ZQAccTrns.Insert ;
            ZQAccTrnsWACCOUNTID.AsInteger :=   0 ;
            ZQAccTrnsWLANGUAGEID.AsInteger :=  integer(LangList.Objects[i]) ;
            ZQAccTrnsSDESCRIPTION.AsString := 'Empty' ;
            ZQAccTrns.post ;
        end;
   end;
end;

procedure TfmCustomLang.ZQGroupstrnAfterInsert(DataSet: TDataSet);
begin
 
    ZQGroupstrnWGROUPDESCID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_GROUPSDESC_ID');
end;

procedure TfmCustomLang.ZQGroupstrnAfterOpen(DataSet: TDataSet);
var
 i : Integer ;
begin

for i := 0 to LangList.Count -1 do
   begin
      if not ZQGroupstrn.Locate('WLANGUAGEID',integer(LangList.Objects[i]),[]) then
        begin
            ZQGroupstrn.Insert ;
            ZQGroupstrnWGROUPID.AsInteger :=   0 ;
            ZQGroupstrnWLANGUAGEID.AsInteger :=  integer(LangList.Objects[i]) ;
            ZQGroupstrnSDESCRIPTION.AsString := 'Empty' ;
            ZQGroupstrn.post ;
        end;
   end;
end;

procedure TfmCustomLang.ZQAccTrnsWLANGUAGEIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if LangList.IndexOfObject(Tobject(Sender.AsInteger)) <> -1 then
     text :=   LangList[LangList.IndexOfObject(Tobject(Sender.AsInteger))] ;
end;

procedure TfmCustomLang.Button5Click(Sender: TObject);
begin
 if OSFMessageDlg('Are you sure?',mtConfirmation,[mbyes,mbno],0) =mrno then exit ;
 DMTCCoreLink.ExecSql('update groups set Sdescription = ' + QuotedStr(EDescofEmptyAccount.Text) + ' where Wgroupid = 0 ' ) ;
end;

procedure TfmCustomLang.Button6Click(Sender: TObject);
begin
   CDSTranslation.insert ;
end;

procedure TfmCustomLang.BReloadUseCodePageClick(Sender: TObject);
begin
BReloadUseCodePage.Tag := 1 ;
LoadToCDS ;
BReloadUseCodePage.Tag := 0 ;

end;

end.

