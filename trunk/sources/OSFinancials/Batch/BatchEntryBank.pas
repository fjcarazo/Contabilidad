(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
  Full Delphi 15 rewrite Delphidreams 2012
*)
unit BatchEntryBank;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Buttons, StdCtrls, ComCtrls, ToolWin,
   DB, Mask, Menus,  jpeg,   DatabaseAccess,UDMCoreData, InvoiceEntryGrid,
  UosfResources,UPluginsSharedUnit, DBAccess, Uni, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxCalendar, cxDBExtLookupComboBox,
  cxButtonEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid,ULookupGrids, DBClient;



type

  TfmBatchEntryBank = class(TForm)
    TbarMain: TToolBar;
    tlbtnDelete: TToolButton;
    tlbtnInsert: TToolButton;
    tlbtnPost: TToolButton;
    tlbtnList: TToolButton;
    tlbtnProcess: TToolButton;
    tlbtnSetup: TToolButton;
    ImportDialog: TOpenDialog;
    ExportDialog: TSaveDialog;
    Panel3: TPanel;
    UpdateSQL1: TUniUpdateSql;
    TBBankImport: TToolButton;
    Panel2: TPanel;
    Label6: TLabel;
    LTotalAccountLast: TLabel;
    Label7: TLabel;
    LEnterdStatement: TLabel;
    LLLDiverence: TLabel;
    LDiverence: TLabel;
    TBDeleteLine: TToolButton;
    QGen: TuniQuery;
    PopupMenu2: TPopupMenu;
    Usefilter1: TMenuItem;
    QFindAccountOFDebtor: TuniQuery;
    QFindAccountOFCREDITor: TuniQuery;
    QFindAccountOFCREDITorWAccountID: TIntegerField;
    QFindAccountOFDebtorWAccountID: TIntegerField;
    tlbtnExcl: TToolButton;
    Label9: TMemo;
    tlbtnIncl: TToolButton;
    PopupMenu1: TPopupMenu;
    Deleteline1: TMenuItem;
    Updatebankaccount1: TMenuItem;
    Lookupinvoice1: TMenuItem;
    Lookupdocwithamount1: TMenuItem;
    Lookupdebtor1: TMenuItem;
    Lookupcreditor1: TMenuItem;
    Autolinkbankaccounts1: TMenuItem;
    Createnewinvoice1: TMenuItem;
    Gotodocument1: TMenuItem;
    Autolinkofall1: TMenuItem;
    Showrefsforaccount1: TMenuItem;
    ZQbankline: TuniQuery;
    LookupTransactions: TMenuItem;
    PageControl1: TPageControl;
    tsEnter: TTabSheet;
    tsPosted: TTabSheet;
    PnlAlias: TPanel;
    Label15: TLabel;
    edtAlias: TEdit;
    ZQBankRefs: TuniQuery;
    zqBankActions: TuniQuery;
    N1: TMenuItem;
    Plugins: TMenuItem;
    Paymentdiverence1: TMenuItem;
    Openitem1: TMenuItem;
    Panel1: TPanel;
    lFind: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1WLINEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SACCOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FDEBIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STAX: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FCREDIT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SCONTRAACCOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FTAXAMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DALLOCATEDDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BRECONCILED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BEXCLUSIVE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FQTY: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPROFILEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTAX2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1NOTUSED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SPROFILE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SJOBCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1STAX2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BLINKED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DSYSDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FTAX2AMOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTAXID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WCONTRAACCOUNTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WLINKEDID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DPAYMENTDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDOCID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    CdsBankDnl: TUniQuery;
    CdsBankDnlSTRANSID: TStringField;
    CdsBankDnlWLINETYPEID: TIntegerField;
    CdsBankDnlWSOURCEID: TIntegerField;
    CdsBankDnlWBANKID: TIntegerField;
    CdsBankDnlWTRANSTYPEID: TIntegerField;
    CdsBankDnlSACCOUNTCODE: TStringField;
    CdsBankDnlDTRANSDATE: TDateTimeField;
    CdsBankDnlDPOSTEDDATE: TDateTimeField;
    CdsBankDnlFAMOUNT: TFloatField;
    CdsBankDnlSMEMO: TStringField;
    CdsBankDnlSREFERENCE: TStringField;
    CdsBankDnlBRECONCILED: TSmallintField;
    CdsBankDnlSDESCRIPTION: TStringField;
    CdsBankDnlWCURRENCYID: TIntegerField;
    CdsBankDnlWACCOUNTID: TIntegerField;
    CdsBankDnlWLINEID: TIntegerField;
    CdsBankDnlWTCTRANSID: TIntegerField;
    CdsBankDnlWPROFILEID: TIntegerField;
    CdsBankDnlWAUTOMATCHID: TIntegerField;
    CdsBankDnlBUSEFORBATCH: TIntegerField;
    CdsBankDnlDSYSDATE: TDateTimeField;
    CdsBankDnlWAMTSGN: TIntegerField;
    CdsBankDnlSEXTRADESCRIPTION: TStringField;
    dsBatch: TDataSource;
    tblBatch: TUniTable;
    tblBatchWLINEID: TIntegerField;
    tblBatchSREFERENCE: TStringField;
    tblBatchSACCOUNT: TStringField;
    tblBatchSDESCRIPTION: TStringField;
    tblBatchFDEBIT: TFloatField;
    tblBatchFCREDIT: TFloatField;
    tblBatchFAMOUNT: TFloatField;
    tblBatchSTAX: TStringField;
    tblBatchWTAXID: TIntegerField;
    tblBatchDDATE: TDateTimeField;
    tblBatchSCONTRAACCOUNT: TStringField;
    tblBatchWCONTRAACCOUNTID: TIntegerField;
    tblBatchFTAXAMOUNT: TFloatField;
    tblBatchDALLOCATEDDATE: TDateTimeField;
    tblBatchBRECONCILED: TIntegerField;
    tblBatchBEXCLUSIVE: TIntegerField;
    tblBatchWACCOUNTID: TIntegerField;
    tblBatchFQTY: TFloatField;
    tblBatchWPROFILEID: TIntegerField;
    tblBatchWTAX2ID: TIntegerField;
    tblBatchNOTUSED: TFloatField;
    tblBatchSPROFILE: TStringField;
    tblBatchSJOBCODE: TStringField;
    tblBatchSTAX2: TStringField;
    tblBatchBLINKED: TIntegerField;
    tblBatchDSYSDATE: TDateTimeField;
    tblBatchFTAX2AMOUNT: TFloatField;
    tblBatchWLINKEDID: TIntegerField;
    tblBatchWREPORTINGGROUP1ID: TIntegerField;
    tblBatchWREPORTINGGROUP2ID: TIntegerField;
    tblBatchDPAYMENTDATE: TDateTimeField;
    tblBatchWDOCID: TIntegerField;
    GridPanel1: TGridPanel;
    Label3: TLabel;
    LContraAccount: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    lAlocatedTo: TLabel;
    Lcontraaccountcode: TLabel;
    LIncAmount: TLabel;
    lExclAmount: TLabel;
    LRefTotal: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ltax: TLabel;
    tblBatchISBALANCE: TSmallintField;
    cxGrid1DBBandedTableView1ISBALANCE: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbtnDeleteClick(Sender: TObject);
    procedure tlbtnProcessClick(Sender: TObject);
    procedure tblBatchBeforePost(DataSet: TDataSet);
    procedure tblBatchAfterPost(DataSet: TDataSet);
    procedure tlbtnPostClick(Sender: TObject);
    procedure tlbtnExclClick(Sender: TObject);
    procedure tlbtnSetupClick(Sender: TObject);
    procedure tlbtnBalanceClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LookupDBGridDblClick(Sender: TObject);
    procedure CtrOkClick(Sender: TObject);
    procedure CtrCancelClick(Sender: TObject);
    procedure tlbtnListClick(Sender: TObject);
    procedure dbgridBatchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PnlAliasExit(Sender: TObject);
    procedure edtAliasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tlbtnInsertClick(Sender: TObject);
    procedure  ToolButton2Click(Sender: TObject);
    procedure TBBankImportClick(Sender: TObject);
    procedure Deleteline1Click(Sender: TObject);
    procedure Updatebankaccount1Click(Sender: TObject);
    procedure Usefilter1Click(Sender: TObject);
    procedure LookUpPanelEnter(Sender: TObject);
    procedure fmInvoiceEntryGridLookupinvoice1Click(Sender: TObject);
    procedure Lookupdocwithamount1Click(Sender: TObject);
    procedure Lookupcreditor1Click(Sender: TObject);
    procedure dbgridBatchTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure Autolinkbankaccounts1Click(Sender: TObject);
    procedure DBLCBCostgroup1Exit(Sender: TObject);
    procedure DBLCBCostgroup1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLCBCostgroup1KeyPress(Sender: TObject; var Key: Char);
    procedure Createnewinvoice1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Gotodocument1Click(Sender: TObject);
    procedure Autolinkofall1Click(Sender: TObject);
    procedure ZQProjectsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ZQCostgroup1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure Showrefsforaccount1Click(Sender: TObject);
    procedure LookupTransactionsClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Paymentdiverence1Click(Sender: TObject);
    procedure Openitem1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBBandedTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBBandedTableView1EditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure cxGrid1DBBandedTableView1Column1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1Editing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure cxGrid1DBBandedTableView1EditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cxGrid1DBBandedTableView1InitEditValue(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var AValue: Variant);
    procedure cxGrid1DBBandedTableView1FDEBITPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBBandedTableView1WACCOUNTIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBBandedTableView1WTAXIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure tblBatchAfterDelete(DataSet: TDataSet);
    procedure tblBatchAfterScroll(DataSet: TDataSet);
    procedure cxGridDBBandedTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure tblBatchAfterInsert(DataSet: TDataSet);
    procedure tblBatchBeforeOpen(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure tblBatchWACCOUNTIDValidate(Sender: TField);
    procedure tblBatchWCONTRAACCOUNTIDValidate(Sender: TField);
    procedure tblBatchWTAXIDValidate(Sender: TField);
    procedure tblBatchBeforeDelete(DataSet: TDataSet);
    procedure tblBatchCalcFields(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    FIdCol: Char;
    afmInvoiceEntryGrid : TfmInvoiceEntryGrid ;
    aLookupgrid : TfmLookupgrids ;

    Procedure UnlinkLine(_BatLinkedID:integer);
    procedure MyOnFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure AdjIncExcBtn(BExcl: Boolean);

    procedure MatchAutolinkofaccount;
    procedure InitPluginsMenu;
    procedure loadPlugins;
    procedure OnMenuPluginAct1(Sender: TObject);
    procedure GetRefTotals;
    procedure onclosupNotifiy(Sender: Tobject);
    procedure onPopupNotifiy(Sender: Tobject);
    { Private declarations }
  public
  AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    BankAccountLength ,EmailLength : Integer ;
    { Public declarations }
    GlSelectedSet : set of byte ;
    AccountLoopupOnly : Boolean ;
    DeleteLine,InLinkCall :Boolean ;
    DefaultAccount,LastEnterdAccount : String ;
    AccountLookupType,SubAccountLookUpType : Integer ;
    DefaultAccountId ,DefaultContraAccount,LastBatchTypeID: Integer ;
    NeedsReopen,gridinit : Boolean ;
    // need a way to make sure the links screen does not show up.
    ShowLinkMessage,ShowLinkForThisLine,NotAOpenItemBatch, InProcesOrClose : boolean;

    paymentID : Integer ;
        LastUsedReference,LastUsedDescription : String ;
    LastUsedContra ,LastUsedTax,LastUsedAccount: Integer ;

    LastUsedDate : TDateTime ;
    NoBatchReload ,BrememberContra,BRememberTax : Boolean ;
    LastTCBankAmount,EnterdStamentAmount,CurrentTotal : double ;
    EnterItemsUntil : TDatetime ;
   // ASaveClientDatasetCallList : TSaveClientDatasetCallList ;
    SpecialOpenItemAccounts : String ;
    LastTableType : String ;
      ADMCoreData : TDMCoreData ;
     lastfocusedaccount : integer ;
    // this ensures the posting event with is mutch beter than that strange grid stuff


    procedure WriteBatch(Filename : String);


    Procedure F9Process(Return:String);
    // done : Pieter give message show as result so we can do it after all things are done.
    function CallLinks : Boolean ;
    // Done : Pieter i must say that Grid sucks you should check out Quantum grid.
    Function FindIndexOfName (aName : String): Integer ;
    procedure RemoveBalanceEntrys ;
    procedure RemoveEmptys ;
    procedure TranslateColumns ;
    procedure AutoLinkBankAccounts ;
    
  end;


  Procedure ShowBank(ABankBatchId : Integer) ;
var

  CInRowChanged:Integer;

  fmBatchEntryBank   : TfmBatchEntryBank;
  BatchCaption : String;
  OldAccount,ActualAccount,
  search,Look,Tbl,SSelect:String;
  EditMode,
  PostHere,
  ImpRpBatch,SelectContraAcc,
  ReShow,Account : Boolean;
  BackRow:Integer;


  PostDone:Boolean = False;
implementation

uses Main, Database, SelectBatchType, BatchProcessMenu, GlobalFunctions,
   SetAbbreviations, 
  HtmlHelpAPI, LanguageChoice, BatchPeriodTotals, BatchOptions,
   Lookup, GenMutliEntry, EditReceipts, SelectAccountType,
  GetReportDate, OpenItemSelection, UpdateInvoice, ExchangeTCData,
  TcVariables, LedgerRoutines, BatchPayCreditors,XRoutines,
   BatchPayDebtors, Debtor, FreeReportsUnit, ReverseBatch,OSFGeneralRoutines,
  NewProgress, UDMTCCoreLink, TcashClasses,
  UEditAccountRef, StrUtils, TransfertTrans, OpenLink, UDmQuantumGridDefs;

{$R *.DFM}

Var
  OkMoveOne             :ShortInt;
  AccBlocked :   TrSelect;


Procedure ShowBank(ABankBatchId : Integer) ;
Var
  lastResult,LastId,LastBatchTypeId  : Integer ;
begin

 dmDatabase.QryBatchTypesList.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('SelectBatTypes_BatchList');
 dmDatabase.QryBatchTypesList.Open;
 if not dmDatabase.QryBatchTypesList.Locate('WBatchTypeID',ABankBatchId,[]) then exit ;


  dmDatabase.tblBatchTypes.open ;
  LastBatchTypeId := dmDatabase.qryBatchTypesListWbatchtypeID.AsInteger   ;
  if not dmDatabase.tblBatchTypes.Locate('WBatchTypeID',LastBatchTypeId,[]) then
     exit;

  if CanUserBatch(dmDatabase.qryBatchTypesListWbatchtypeID.AsInteger,LastBatchTypeId) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
    Exit;
  end;
  dmDatabase.tblBatch.close;
  // done : pieter Batc conrol out of sinc ??
  // Theres reports from digian about the abriviation

  BatchCtrlID := GetBatchCtrlID(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger) ;
  LastId := BatchCtrlID ;
  // So you dont need to hide this form bacth it gave strange problems.
  LAstResult := 5 ;

  while LAstResult = 5 do
  begin
  BatchCtrlID := lastid ;

  fmBatchEntryBank   := TfmBatchEntryBank.Create(Application);
  try
  dmDatabase.qryBatchTypesList.Open;
  dmDatabase.tblBatchTypes.Open ;

      fmBatchEntryBank.Caption := dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,IsRepeatingBat);

  BatchNameFName := dmDatabase.tblBatch.TableName;
  dmDatabase.tblBatch.Close;
  lastresult := fmBatchEntryBank.ShowModal;
  finally
  FreeAndNil(fmBatchEntryBank);
  //dmDatabase.tblBatch.EnableControls ;
  end;

  dmDatabase.qryBatchTypesList.Close;
  dmDatabase.tblBatchTypes.Close ;
  end;
end;

Procedure HidefmSelectBat(vHide:Boolean);
begin
  if fmSelectBatchType=nil then
    exit;
  if vHide then
    fmSelectBatchType.Hide
  else
    fmSelectBatchType.Show;
end;

Function GetRepetitiveBatchName:string;
Var
  i:Integer;
begin
  Result:=BatchNameFName;
  if Result='' then exit;
  i:=pos('.',Result);
  if i<=1 then exit;
  repeat
    Dec(i);
    if Result[i]='\' then
    begin
      Insert('Rbt',Result,i+4);
      Break;
    end;
  until i=1
end;



procedure TfmBatchEntryBank.onclosupNotifiy(Sender: Tobject);

begin


 aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;
 //Showmessage(TcxComboBoxPopupWindow(TcxExtLookupComboBox(Sender).PopupWindow).FocusedControl.ClassName);
end;
procedure TfmBatchEntryBank.loadPlugins;

var
 i , IncArr,Ins : Integer ;
  ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  IsEnable := false ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 15 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToBatchRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);




            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('STOCK',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
              end;
             if IsEnable then
               begin
               inc(IncArr) ;
               end else
            begin
              @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil ;
              @AFormPluginRecordArray[IncArr].aMessageFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil ;
              @AFormPluginRecordArray[IncArr].aPluginEnabled   := nil ;
            end;
        end;
    end;
 InitPluginsMenu ;

end;


procedure TfmBatchEntryBank.OnMenuPluginAct1(Sender: TObject);
var
 AMessage : String ;
  AForm : TForm ;

begin
 AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'') ;
 try

 AMessage := 'CONTEXT=' + IntToStr(BatchCtrlID) + #13+#10 + 'SUB=' + IntToStr(tblBatchWLINKEDID.AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;

procedure TfmBatchEntryBank.InitPluginsMenu;
var
 i :  Integer ;
 AForm: TForm ;

 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;
 AMenuitem : TMenuitem ;
 ACaption : String ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
       try
         // ShowMessage(GetModuleName(AFormPluginRecordArray[i].aInst));
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'STOCK');

         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         ACaption :=  ReturnString ;
          AFormPluginRecordArray[i].aUnLoadFormPlugin(AForm);

         if Assigned(AFormPluginRecordArray[i].aContextmenuEnabled) then
            begin
             AMenuitem := TMenuitem.Create(Plugins) ;
             Plugins.Add(AMenuitem);
             AMenuitem.Caption := ACaption ;
             AMenuitem.tag := i ;
             AMenuitem.OnClick := OnMenuPluginAct1;
            end;



        except
           on e : Exception do
             begin
                OSFMessageDlg(GetModuleName(AFormPluginRecordArray[i].aInst) + ' Error ! ' + e.Message,mtError,[mbok],0);
             end;
        end;
      end;
  Plugins.Caption := DMTCCoreLink.GetTextLang(3282);
  Plugins.Visible := Plugins.Count <> 0 ;
  N1.Visible := Plugins.Visible ;


end;

Procedure TfmBatchEntryBank.UnlinkLine(_BatLinkedID:integer);
begin
  LedgerRoutines.UnlinkLine(_BatLinkedID,BatchCtrlID);
end;
 

procedure TfmBatchEntryBank.WriteBatch(Filename : String);

begin
  WriteTextBatch(FileName);
  exit;
end;

 

procedure TfmBatchEntryBank.FormShow(Sender: TObject);
var
  MySql,CapStr,LookupType:String;
  bIsCashbook : Boolean ;
  BContrAcc,i : Integer ;
begin
 tblBatchFDEBIT.DisplayFormat := GetViewMask(0);
 tblBatchFCREDIT.DisplayFormat := GetViewMask(0);

 BankAccountLength := DMTCCoreLink.GetFieldLength('debtor','SBankAccountNumber');
 tsEnter.Caption := Gettextlang(298);
 tsPosted.Caption := Gettextlang(2003);
 Autolinkbankaccounts1.Caption := Gettextlang(3272);
 Autolinkofall1.Caption := Gettextlang(3273);
 Showrefsforaccount1.Caption := Gettextlang(3275);
 LookupTransactions.Caption := Gettextlang(3274);

 


 tblBatch.IndexFieldNames := 'WlineId' ;
 ADMCoreData := TDMCoreData.Create(nil) ;
 SpecialOpenItemAccounts := ReadLongSysparam('OpenITemLedgers',0) ;
 InProcesOrClose := false ;
 dmDatabase.tblSysParams.Open ;
 Usefilter1.Checked := ReadSysParam('BATCHUSELOOKFILT',Bool2Str(false),currentUser).AsBoolean ;
 Usefilter1.Caption := GetTextLang(2967);
 dmDatabase.tblSysParams.Close ;
 
 

 

   Caption := Gettextlang(366); //Header 366
   BatchCaption := Caption ;
   tlbtnDelete.Caption := Gettextlang(367); //^D : Delete 367
   tlbtnInsert.Caption := Gettextlang(368);//^N : Insert 368
   tlbtnPost.Caption := Gettextlang(370);  //F5 : Allocate 369
   tlbtnList.Caption := Gettextlang(372); //F8 : Link 372
   tlbtnProcess.Caption := Gettextlang(373);  //F9 : Process 373
   tlbtnSetup.Caption := Gettextlang(374);//F10 : Setup 374
   Label1.Caption := Gettextlang(375);//Inclusive amount 375;
   Label2.Caption := Gettextlang(376);//Exclusive amount 376
   Label5.Caption := Gettextlang(377);  //Reference total 377

   Label7.Caption := Gettextlang(599); // Enter month and Year to repeat entries  to
               //F7 : Exclusive 371
              // tlbtnExclIncl.Caption := Gettextlang(371);
    tlbtnIncl.Caption := GetTextLang(664);
    tlbtnExcl.Caption :=GetTextLang(371);
    tlbtnIncl.ImageIndex := 8;
    tlbtnExcl.ImageIndex := 4;

 TBBankImport.Caption := Gettextlang(2238);


 TBBankImport.Visible := PluginExist('bankimport.tpd') ;

 Deleteline1.Caption := Gettextlang(367) ; {delete}
 Updatebankaccount1.Caption := Gettextlang(2898); {Update bankaccount}
 Lookupinvoice1.Caption := Gettextlang(2899); {Lookup document}
 Lookupdocwithamount1.Caption := Gettextlang(2900); {Lookup doc with ammout}
 Lookupdebtor1.Caption := Gettextlang(2901);{Lookup debtor}
 Lookupcreditor1.Caption := Gettextlang(2902); {Lookup creditor}
 Openitem1.Caption := GetTextLang(360);

 gridinit := false ;

  dmDatabase.tblBatchTypes.open ;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID',paymentID,[]);
  if (dmDatabase.tblBatchTypesWBatchTypeID.AsString='') or
     (dmDatabase.tblBatchTypesSDescription.AsString='') then
     exit;
  dmDatabase.BatchType :=  dmDatabase.tblBatchTypesWBatchTypeID.AsInteger ;


  BrememberContra := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberContra',false).AsBoolean ;
  BRememberTax := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberTax',false).AsBoolean ;


 cxGrid1DBBandedTableView1.DataController.Filter.Active :=
  ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BLIMITBAL',0).AsInteger = 1 ;



  AccountLookupType := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountCodeType',0).AsInteger ;
  SubAccountLookUpType :=  ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BContraAccountCodeType',0).AsInteger ;
  AccountLoopupOnly :=  DMTCCoreLink.ReadNwReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountLonly',False) ;

  dmDatabase.DefCostGroup1 := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',0).AsInteger ;

  DefaultContraAccount := dmDatabase.tblBatchTypesWContraAccountID.AsInteger ;
  dmDatabase.tblBatchTypes.Edit ;
  dmDatabase.tblBatchTypesBCashBook.AsInteger := 1 ;
  dmDatabase.tblBatchTypesBContraPerLine.AsInteger := 0 ;
  dmDatabase.tblBatchTypesWDebitCredit.AsInteger := 0;
  dmDatabase.tblBatchTypes.Post ;


  dmDatabase.DoAutoInc := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'CBAutoIncNum',True).AsBoolean ;
  

 
  DefaultAccount := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(dmDatabase.tblBatchTypesWContraAccountID.AsInteger);
  if DefaultAccount = '-'then DefaultAccount := '' ;
  DefaultAccountId := dmDatabase.tblBatchTypesWContraAccountID.AsInteger ;

 // tblAccount.Close  ;
  if CanUserBatch(CurrentUser, paymentID) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
    Exit;
  end;
  tblBatch.close;
  // done : pieter Batc conrol out of sinc ??
  // Theres reports from digian about the abriviation

  LastTCBankAmount := GetAccountTotal(DefaultAccountId,26+1,3) ;
  LTotalAccountLast.Caption := formatfloat(tblBatchFDEBIT.DisplayFormat,LastTCBankAmount);
  LEnterdStatement.Caption := formatfloat(tblBatchFDEBIT.DisplayFormat,EnterdStamentAmount);
  LDiverence.Caption := formatfloat(tblBatchFDEBIT.DisplayFormat,EnterdStamentAmount-LastTCBankAmount);
  BatchCtrlID := GetBatchCtrlID(paymentID) ;

  BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,IsRepeatingBat);
   dmDatabase.tblBatch.close ;
   tblBatch.TableName := dmDatabase.tblBatch.TableName ;
   tblBatch.open ;
  // lets remove anny contra bookkings
  while not tblBatch.eof do
    begin
       if   (tblBatchWLINEID.AsInteger <> tblBatchWLINEID.AsInteger) then
          tblBatch.Delete else
       tblBatch.Next ;
    end;

       
     

 dmdatabase. CalledFromBatch := False ;
 try

  NotAOpenItemBatch  := ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoOpenItem',false).AsBoolean ;
  LastBatchTypeID :=  dmdatabase.tblBatchTypesWBatchTypeID.AsInteger ;
  AccExclFilter:= GetAccExclFilter(AccBlocked);
  PostHere:=True;
  CInRowChanged:=0;
   dmdatabase.OpenItemRequest:=0;
   dmdatabase.DefaultTax:='';
  if Reshow then exit;

  Label1.Caption :=GetTextLang(375);// 'Inclusive Amount :';
  Label2.Caption :=GetTextLang(376);//  'Exclusive Amount :';
  Label5.Caption := GetTextLang(377);// 'Reference Total :';

  Label15.Caption := gettextlang(2029);
  Lcontraaccountcode.Caption := '';
 
  LLLDiverence.Caption := gettextlang(955);
  Label6.Caption := gettextlang(2234);

  Label7.Caption := gettextlang(2235);
  tlbtnDelete.Caption := gettextlang(2236);

  TBDeleteLine.Caption := gettextlang(2237);



  tblBatch.Close;

//  tblBatchSreference.Size:=8;
  tlbtnPost.Enabled:=CheckUserCtrl('Post',False) ;
  tblBatch.Open;
  tblBatch.First;
  //set debits / credits readonly
     dmdatabase.tblBatchTypes.Edit;
     dmdatabase.tblBatchTypesDSysDate.Value := Now;
     dmdatabase.tblBatchTypes.Post;
    // done : pieter Grid seems to be off track when disabling fields and trowing them out.
    // no deleting just disable
    if  dmdatabase.tblBatchTypesWDebitCredit.Value = 0 then
    begin
      tblBatchFCREDIT.Tag := 0;
      tblBatchFDEBIT.Tag := 0;
    end;
    if  dmdatabase.tblBatchTypesWDebitCredit.Value = 1 then
    begin
      tblBatchFCREDIT.Tag := 1;
      tblBatchFDEBIT.Tag := 0;
    end;
    if  dmdatabase.tblBatchTypesWDebitCredit.Value = 2 then
    begin
      tblBatchFCREDIT.Tag := 0;
      tblBatchFDEBIT.Tag := 1;
    end;

    MySql:='SELECT SReference , DDate AS Period, sum(FDEBIT) AS Debit, sum(FCREDIT) As Credit  FROM ' + BatchNameFName+' GROUP BY SReference,DDate;';

    if not IsRepeatingBat then
    begin
     cxGrid1DBBandedTableView1DDATE.Caption:=gettextlang(238){'Date'};

    end
    else
    begin
     cxGrid1DBBandedTableView1DDATE.Caption:=gettextlang(2179){'Day'};

     tlbtnPost.Enabled:=False;
    end;
     dmdatabase.qBatPeriodTotals.Close;
     dmdatabase.qBatPeriodTotals.SQL.Clear;
     dmdatabase.qBatPeriodTotals.SQL.Add(MySql);
    EditMode := True;


    glSelectedSet := [] ;

    i :=  FindIndexOfName('SACCOUNT') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;

    i :=  FindIndexOfName('SCONTRAACCOUNT') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;


    i :=  FindIndexOfName('SJOBCODE') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;

    i :=  FindIndexOfName('WREPORTINGGROUP1ID') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;

    i :=  FindIndexOfName('WREPORTINGGROUP2ID') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;

     i :=  FindIndexOfName('STAX') ;
    if i > -1 then
     glSelectedSet := glSelectedSet + [i] ;

  //  glSelectedSet := [FindIndexOfName('SACCOUNT'),FindIndexOfName('SCONTRAACCOUNT'),FindIndexOfName('STAX'),FindIndexOfName('SJOBCODE'),FindIndexOfName('WREPORTINGGROUP1ID'),FindIndexOfName('WREPORTINGGROUP2ID')] ;

          aLookupgrid.ZQProjects.close ;
    aLookupgrid.ZQProjects.open ;
    if (aLookupgrid.ZQProjects.RecordCount < 2) or not(ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'cbProjects',false).AsBoolean) then
      begin
       cxGrid1DBBandedTableView1SJOBCODE.VisibleForCustomization := False ;
       cxGrid1DBBandedTableView1SJOBCODE.Visible := False ;
       // hide  projects
      end;
 aLookupgrid.ZQCostgroup2.close ;
 aLookupgrid.ZQCostgroup2.open ;
  if (aLookupgrid.ZQCostgroup2.RecordCount < 2) or not (ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',false).AsBoolean) then
   begin
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.VisibleForCustomization := False ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Visible := False ;
   end;
 aLookupgrid.ZQCostgroup1.close ;
 aLookupgrid.ZQCostgroup1.open ;
 if (aLookupgrid.ZQCostgroup1.RecordCount < 2) or not(ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',true).AsBoolean)  then
   begin
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.VisibleForCustomization := False ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Visible := False ;
   end;
     aLookupgrid.nEWShowLookup(aLookupgrid.ZQCostgroup1, 'Costgroup 1','GLTHREE','COST1');
     aLookupgrid.nEWShowLookup(aLookupgrid.ZQCostGroup2,'Costgroup 2','GLTHREE','COST2');
      case AccountLookupType of
       0 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount, 'Accounts','GLTHREE','ACCOUNT');
       1 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount,'Accounts','GLTHREE','ACCOUNTONLY');
       2 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount,'Accounts','GLTHREE','DEBTOR');
       3 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount,'Accounts','GLTHREE','CREDITOR');
       4 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount,'Accounts','GLTHREE','SPECIALSELECTACCOUNT');
       5 : aLookupgrid.nEWShowLookup(aLookupgrid.TblAccount,'Accounts','GLTHREE','OPENITEM');
       end;
      aLookupgrid.nEWShowLookup(aLookupgrid.ZQProjects,'Project','GLTHREE','PROJECT');
      case SubAccountLookUpType of
       0 : LookupType := 'ACCOUNT' ;
       1 : LookupType := 'ACCOUNTONLY';
       2 : LookupType := 'DEBTOR';
       3 : LookupType := 'CREDITOR';
       4 : LookupType := 'SPECIALSELECTACCOUNT';
       end;
      aLookupgrid.nEWShowLookup(aLookupgrid.zqContrAccount, 'Accounts','GLTHREE',LookupType);
      aLookupgrid.nEWShowLookup(aLookupgrid.zqTax,'Accounts','TAX','ACCOUNT');
    finally
     // done : Pieter attatc.
      dmdatabase.CalledFromBatch := True ;

     tblBatch.open ;


    end;

  cxGrid1DBBandedTableView1Column1.Visible := not ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoOpenItem',false).AsBoolean ;
  cxGrid1DBBandedTableView1Column1.Visible := cxGrid1DBBandedTableView1Column1.Visible and not IsRepeatingBat ;
  cxGrid1DBBandedTableView1Column1.Caption :=  GetTextLang(3326);

    dmdatabase.CalledFromBatch := true ;

    CapStr:=GetBatAlias(BatchCtrlID);
    edtAlias.Text := CapStr ; 
    if IsCashBook <> 0 then
       begin
        TDataBaseRoutines.GetBatchInfo( dmdatabase.ZQBatControlWBATCHTYPEID.AsInteger,bIsCashbook,BContrAcc);
        CapStr := Trim(CapStr + ' ' + TDataBaseRoutines.GetAccountDescription(BContrAcc))
       end;
    if CapStr<>'' then
      Caption := BatchCaption +' - ['+CapStr+']';

    Label15.Caption := gettextlang(2029);
   self.top := 10 ;
   self.Left := 10 ;
   TDatabaseRegistyRoutines.ReadFormPos(self, dmdatabase.tblBatchTypesWBatchTypeID.AsString);

    cxGrid1.SetFocus ;
      dmdatabase.DefCostGroup1 := ReadReportOp( dmdatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',0).AsInteger ;
    loadPlugins ;
end;

procedure TfmBatchEntryBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BLIMITBAL',IntTostr(ord(
   cxGrid1DBBandedTableView1.DataController.Filter.Active)));

  Reshow := false ;
  InProcesOrClose := true ;
  WriteSysParam('BATCHUSELOOKFILT',Bool2Str(Usefilter1.Checked),currentUser);
  NotAOpenItemBatch := true ;
  if ( tblBatch.state in [dsinsert,dsEdit]) then
      tblBatch.post ;
  EditMode := False;
  if PostDone then RunUpdateClient; 
  if NeedsReopen then self.ModalResult := 5 ;
  TDatabaseRegistyRoutines.WriteFormPos(self, dmdatabase.tblBatchTypesWBatchTypeID.AsString);
end;


procedure TfmBatchEntryBank.tlbtnDeleteClick(Sender: TObject);
Var
  Tmp:Integer;
  Reference : String ;
begin
  if tblBatch.IsEmpty then exit ;
  if OSFMessageDlg(GetTextLang(437){Are you sure you wish to delete this transaction ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  try
     while not tblBatch.IsEmpty do
     tblBatch.Delete ;
   except
   end;

end;

procedure TfmBatchEntryBank.tlbtnBalanceClick(Sender: TObject);
begin
 RemoveEmptys ;
 F9Process('Balance');
end;

procedure TfmBatchEntryBank.tlbtnPostClick(Sender: TObject);
begin

//  if ReadReportOp( tblBatchTypesWBatchTypeID.AsString + 'BAlwaysBalance',false).AsBoolean then
     tlbtnBalanceClick(self);
    Application.ProcessMessages ; 
  PostHere:=True;
  if tlbtnPost.Enabled then
     F9Process('Post');
end;

procedure TfmBatchEntryBank.tlbtnExclClick(Sender: TObject);
var
  Rate       : Real;
  TempIndex : Integer;
  ToTal:Extended;
  BExcl:Boolean;
 
begin
  if tblBatch.IsEmpty or
  ( tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger) then
     begin

       AdjIncExcBtn(false);
     exit ;
     end;
    Rate := 0 ;
 //  tblBatch.DisableControls ;
  InProcesOrClose := True ;
  try
 
   UnlinkLine(tblBatchWLINEID.AsInteger);
   cxGrid1DBBandedTableView1SREFERENCE.Focused := True ;

  Total:=tblBatchFAmount.Value;
  BExcl := Not (tblBatchBExclusive.Value=1);
  if not (tblBatch.State in [dsedit,DsInsert ]) then
  tblBatch.Edit;
   tblBatchBExclusive.Value := ord(BExcl);

  AdjIncExcBtn(BExcl);
     Rate:= TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger);


  if not ( tblBatch.State in [dsedit,DsInsert ]) then
   tblBatch.Edit;

  if tblBatchFAMOUNT.AsFloat > 0 then
    begin
    //  if tblBatchBExclusive.AsInteger = 0 then
        tblBatchFDEBIT.AsFloat :=  tblBatchFAMOUNT.AsFloat
    //    else
   //     tblBatchFDEBIT.AsFloat :=  tblBatchFAMOUNT.AsFloat / rate ;


    end else
    begin
     //   if tblBatchBExclusive.AsInteger = 0 then
         tblBatchFCREDIT.AsFloat :=  -tblBatchFAMOUNT.AsFloat
     //   else
     //   tblBatchFCREDIT.AsFloat :=  -tblBatchFAMOUNT.AsFloat / rate ;


    end;

  if rate <> 0 then
  begin
  if  tblBatchBExclusive.Value =1 then
       begin
           tblBatchFTaxAmount.Value :=   tblBatchFAmount.Value * (Rate-1) ;
        end else
        begin
           tblBatchFTaxAmount.Value :=  tblBatchFAmount.Value -( tblBatchFAmount.Value / Rate) ;
        end;
  end;
   tblBatchBLINKED.AsInteger := 0 ;
  finally
   //  tblBatch.EnableControls ;
    InProcesOrClose := False ;
  end;

  if  ( tblBatch.State in [dsedit,DsInsert ]) then
   tblBatch.post;
  GetRefTotals ;
end;
     
procedure TfmBatchEntryBank.onPopupNotifiy(Sender: Tobject);
var
 Apoint : Tpoint ;
 KEystate : Smallint ;
begin
KEystate := GetAsyncKeyState(VK_LBUTTON) ;
if KEystate <> -32767 then
begin
 if TcxExtLookupComboBox(sender).Properties.View.Controller.FocusedRecord = nil  then
  TcxExtLookupComboBox(sender).Properties.View.Controller.FocusFirstAvailableItem;
 Apoint := TcxExtLookupComboBox(sender).Parent.ClientToScreen(Point(TcxExtLookupComboBox(sender).Left+17,TcxExtLookupComboBox(sender).Top+38)) ;
  Mouse.CursorPos := Apoint;
end;
end;
Procedure TfmBatchEntryBank.F9Process(Return:String);
Var
  D,M,Y :Word;
  MyDate:TDate;
  SavePlace:TBookMark;
  SaveDt,SaveCt:Boolean;
  ProcRes:Integer;
  LyPost:Boolean;
  TextString : String ;
  Label MyExit;
begin
 if edtAlias.CanFocus then
 try
 edtAlias.SetFocus ;
 except
 end;
 try
 Application.ProcessMessages ;
 if tblBatch.State in [dsedit,dsinsert] then
   tblBatch.Post ;
  tblBatch.close ;
  dmDatabase.tblBatch.close ;
  dmDatabase.tblBatch.TableName := tblBatch.TableName ;
  dmDatabase.tblBatch.Open ;
  TbarMain.Enabled := false ;
   dmDatabase.tblBatch.first ;
    while not dmDatabase.tblBatch.Eof do
    if (dmDatabase.tblBatchDDATE.AsDateTime = 0) and(dmDatabase.tblBatchFAMOUNT.IsNull) and (dmDatabase.tblBatchSDESCRIPTION.AsString='') then
    dmDatabase.tblBatch.Delete else
    dmDatabase.tblBatch.Next ;

 try
 
  InProcesOrClose := true ;
  ShowLinkForThisLine := false ;
  cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex  := 0 ;
  ShowLinkForThisLine := false ;
   tblBatch.filter := '' ;
   tblBatch.Filtered := false ;
 
  try

  ProcRes := 0;

  if return = 'MakeAccContra'then
    begin

     try
      dmdatabase.tblBatch.First ;
        While not  dmdatabase.tblBatch.Eof do
        begin
            UnlinkLine(dmdatabase.tblBatchWLINEID.AsInteger);
            dmdatabase.tblBatch.Edit;
            dmdatabase.tblBatchBRECONCILED.Clear ;
            dmdatabase.tblBatchSCONTRAACCOUNT.AsString :=  tblBatchSACCOUNT.AsString ;
            dmdatabase.tblBatchWCONTRAACCOUNTID.AsInteger :=  tblBatchWACCOUNTID.AsInteger ;
            dmdatabase.tblBatch.post;
            dmdatabase.tblBatch.Next;
        end;
      finally
       //  tblBatch.EnableControls;
      end;
    end else
  if Return = 'RpbtErase' then
  begin
    dmdatabase.tblBatch.Close;

 
    QGen.Close;
    clearTable( dmdatabase.tblBatch.TableName);
    Close;
  end else
  if Return = 'Abbrieve' then
  begin
    fmSetAbbreviations := TfmSetAbbreviations.Create(self);
    try
    SetUpForm(fmSetAbbreviations);
    fmSetAbbreviations.ShowModal;
    finally
      FreeAndNil(fmSetAbbreviations);
    end;
  end else
  if Return = 'Erase' then
  begin
    if OSFMessageDlg(GetTextLang(621){Are you sure you wish to delete this transaction ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
     dmdatabase.tblBatch.Close;
     dmDatabase.tblBatchRefTotals.Close ;

    QGen.Close;

    ClearTable( dmdatabase.tblBatch.TableName);
     dmDatabase.tblBatchControl.Open;
    // TODO : SQLOPTIMIZE
    //   tblBatchControl.IndexName:='';
     dmDatabase.tblBatchControl.Filtered := False;
     dmDatabase.tblBatchControl.Filter := 'BPosted = 0 and WUserID = ''' + IntToStr(CurrentUser) + ''' and WBatchTypeID = ''' + IntToStr( dmDatabase.BatchType) + '''';
     dmDatabase.tblBatchControl.Filtered := True;
     dmDatabase.tblBatchControl.Last;
    try
      if  dmDatabase.tblBatchControlWBATCHID.AsInteger <> 0 then
        begin
         DMTCCoreLink.ExecSql('delete from oilinkspre where WBATCHID = ' +   dmDatabase.tblBatchControlWBATCHID.AsString) ;
          dmDatabase.tblBatchControl.Delete;
        end;
    except
    end;
    While  dmDatabase.tblBatchControl.Locate('WUserID;BPosted;WBatchTypeID', VarArrayOf([CurrentUser,0, dmDatabase.BatchType]), []) do
    begin
       dmDatabase.tblBatchControl.Edit;
       dmDatabase.tblBatchControlBPosted.Value := 1;
       dmDatabase.tblBatchControl.Post;
    end;
     dmDatabase.tblBatchControl.Close;
     dmDatabase.tblBatchControl.Filtered := False;
     dmDatabase.tblBatchControl.Filter:='';
    //KillBatchOiLinks;
    Close;
    end;
    Goto MyExit;
  end else

  If Return='Print' Then
  begin
   if CheckReportMan(0,0,1,0,'BATCHNAME=' +  tblBatch.TableName+#13+#10+'BATCHID=' +  dmDatabase.tblBatchTypesWBatchTypeID.AsString +#13+#10+'BATCTRLID=' + IntToStr(BatchCtrlID),'batch','GENERAL') then exit
  
  end else

  If Return='PeriodTotals' Then // Sylvain
    Begin
    FrmBatchPeriodTotals:= TFrmBatchPeriodTotals.Create(Application);
    try
      FrmBatchPeriodTotals.qBatPeriodTotals.SQL.Text := 'SELECT SReference , DDate AS Period, sum(FDEBIT) AS Debit, sum(FCREDIT) As Credit  FROM ' + BatchNameFName+' GROUP BY SReference,DDate;';
      FrmBatchPeriodTotals.ShowModal;
    finally
       FreeAndNil(FrmBatchPeriodTotals);
    end;
  End else

  if Return = 'Import' then
  begin
    if ImportDialog.FileName <> 'nothing' then
    begin
      // TODO : SQLOPTIMIZE
      LoadTextBatch(ImportDialog.FileName,DefaultContraAccount);
       tblBatch.First;
       dmDatabase.tblBatchControl.Open;
       dmDatabase.tblBatchControl.Filtered := False;
       dmDatabase.tblBatchControl.Filter := 'WBatchTypeID = ' + IntToStr( dmDatabase.BatchType);
       dmDatabase.tblBatchControl.Filtered := True;
       dmDatabase.tblBatchControl.Last;
       dmDatabase.tblBatchControl.Edit;
       dmDatabase.tblBatchControlBImported.Value := 1;
       dmDatabase.tblBatchControl.Post;
       dmDatabase.tblBatchControl.Filtered := False;
       dmDatabase.tblBatchControl.Filter := '';
       dmDatabase.tblBatchControl.Close;
    end;
  end else

  if Return = 'Export' then
  begin
    if ExportDialog.FileName <> 'nothing' then
    begin
      WriteBatch(ExportDialog.Filename);

    end;
  end else

  if Return = 'Post' then
  begin
    cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex:=0;
     dmDatabase.IsBalPost:=True;
    LyPost:=True;
    If IsPostLastYear then
    begin
      LyPost:= OSFMessageDlg(GetTextLang(595)+#13#10+GetTextLang(594){Are you sure you wish to Post to Last Year?}, mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
      begin
        SetProgress(-1);
        Goto MyExit;
      end;
    end;

    If IsPostBankToBank(TextString) then
    begin
      LyPost:= OSFMessageDlg('You are putting cash from a bank/cash directly to a bank/cash account. Do you wish to continue?' +#13+#10 + TextString, mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
       begin
        SetProgress(-1);
        Goto MyExit;
       end;
    end;


    If IsPostOnAccount( dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings) then begin
      LyPost:= OSFMessageDlg(DMTCCoreLink.GetTextLang(3080){'Do you wish to post on the retained earnings account?'}, mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
      begin
        SetProgress(-1);
        Goto MyExit;
      end;
    end;  
    Cursor := crHourGlass;

     dmDatabase.ZMainconnection.StartTransaction ;
     try
     ProcRes := PostBatchNow(LyPost,false);
      dmDatabase.ZMainconnection.Commit ;
     PostDone := True;
     if ProcRes=0 then Close;
     finally
      if   dmDatabase.ZMainconnection.InTransaction then
         dmDatabase.ZMainconnection.Rollback ;
       Cursor := crDefault;
      end;
     if ProcRes=0 then Close;
  end else

  if Return = 'Balance' then
  begin
     dmDatabase.IsBalPost:=True;
     dmDatabase.tblBatchTypes.Locate('WBatchTypeID',  dmDatabase.BatchType, []);
    Cursor := crHourGlass;
    // done : Testing this new routine
    // ProcRes := LrBalanceBatch( BatchType);
    ProcRes := LrBalanceBatch( TblBatch.Tablename,ADMCoreData, dmDatabase.BatchType,DefaultContraAccount,FindIndexOfName('STAX') =-1);

    ShowErrMsg(ProcRes);
    Cursor := crDefault;

     dmDatabase.IsBalPost:=False;
 
  end else
  if Return = 'MultiEntry' then begin
  //Sylvain 23/06/000
    fmGenMutliEntry:=TfmGenMutliEntry.Create(Application);
    try
    SetUpForm(fmGenMutliEntry);
    fmGenMutliEntry.edtContraAccount.Text:= tblBatchSCONTRAACCOUNT.AsString;
    fmGenMutliEntry.edtContraAccount.Tag:=  tblBatchWCONTRAACCOUNTID.AsInteger;
    fmGenMutliEntry.ShowModal;
    finally
     FreeAndNil(fmGenMutliEntry);
    end;
  end else
  if Return = 'CrBalancesAtDate' then
  begin
  // Paymt case of Multi Entries
    fmGetDateValue := TfmGetDateValue.Create(self);
    try
    SetUpForm(fmGetDateValue);
    if not fmGetDateValue.GetReportDate(MyDate) then
      // Esc if not ok pressed
      abort ;
    finally
     FreeAndNil(fmGetDateValue);
    end;
     qGen.Close;
     qGen.SQL.Clear;
     qGen.SQL.add('Select Transact.WAccountID, Sum(Transact.FOutstandingAmount) as FoutSum ,'
             // done : Pieter wheres DDate ??
             + ' Account.SACCOUNTCODE , Transact.DDate '
             + ' From Transact,Account '
             + ' Where Transact.WAccountID=Account.WAccountID '
             + ' AND Transact.FOutstandingAmount<0 '
             + ' AND Account.WAccountTypeID=2'
             + ' Group by Transact.WAccountID,Account.SACCOUNTCODE,Transact.DDate');
    try
      // Use Filter For Date Fields, DBE Date Configuration not Stable !!!
       qGen.Filtered:=False;
       qGen.Filter:='DDate<= '''+ DateToStr(MyDate)+'''';
       qGen.Filtered:=True;
       qGen.Open;
       qGen.First;
       dmdatabase.tblBatch.DisableControls;
      While Not  qGen.Eof do
      begin
        if  QGen.FieldByNAme('WAccountID').AsString<>'' then
        begin
           dmdatabase.tblBatch.Append;
          DecodeDate(MyDate,Y,M,D);
           dmdatabase.tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
           dmdatabase.tblBatchDDate.Value:=MyDate;
           dmdatabase.tblBatchSDescription.Value:={'BALANCE AT}gettextlang(2149)+' '+DateToStr(MyDate);
           dmdatabase.tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix( QGen.FieldByNAme('SACCOUNTCODE').AsString);
           dmdatabase.tblBatchWAccountID.AsString:= QGen.FieldByNAme('WAccountID').AsString;
           dmdatabase.tblBatchFAmount.Value:=Abs( QGen.FieldByNAme('FoutSum').AsFloat);
           dmdatabase.tblBatchFDEBIT.Value:=Abs( QGen.FieldByNAme('FoutSum').AsFloat);
           dmdatabase.tblBatchFTaxAmount.Value:=0;
           dmdatabase.tblBatchSTAX.Value:='';
           dmdatabase.tblBatchWTAXID.AsInteger := 0 ;
           dmdatabase.tblBatchBReconciled.Value:=0;
           dmdatabase.tblBatch.Post;
        end;
         qGen.Next;
      end;
    Finally
       qGen.Close;
       dmdatabase.tblBatch.EnableControls;
    end;
  end else
  if Return = 'CreateReceipts' then begin
  // Recpt Case of Multi Entries
  //Sylvain 23/06/000
    fmEditReceipts:=TfmEditReceipts.Create(Application);
    try
    SetUpForm(fmEditReceipts);

    fmEditReceipts.edtAccountCode.Text:= tblBatchSCONTRAACCOUNT.AsString;
    fmEditReceipts.ShowModal;
    finally
      FreeAndNil(fmEditReceipts);
    end;
  end
  else if SameText('ChangeAlias',Return) then
  begin
    PnlAlias.Visible:=True;
    edtAlias.Text:=GetBatAlias(BatchCtrlID);
     if edtAlias.CanFocus then
    edtAlias.SetFocus;
  end
  else if SameText('PayCreditors',Return) then
  begin
    frPayCreditors:= TfrPayCreditors.Create(self);
     try
       WriteNwReportOp('PWCContraAccount',IntToStr(DefaultContraAccount));
        if frPayCreditors.ShowModal = mrok then
          begin
             tblBatch.open;
             RemoveEmptys ;
             frPayCreditors.CDSCreditorOpenItems.First ;
             SetProgress(frPayCreditors.CDSCreditorOpenItems.RecordCount);
              while not frPayCreditors.CDSCreditorOpenItems.eof do
                begin
                 SetProgress('',frPayCreditors.CDSCreditorOpenItems.RecNo);
                 if frPayCreditors.CDSCreditorOpenITemsPayTransaction.AsInteger =1 then
                  begin
                    tblBatch.append ;
                    tblBatchBExclusive.Asinteger := 0 ;
                    tblBatchSReference.AsString := frPayCreditors.CDSCreditorOpenITemsReference.AsString ;
                    tblBatchSDescription.AsString := frPayCreditors.CDSCreditorOpenITemsDescription.AsString ;
                    tblBatchFDEBIT.AsFloat := abs(frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat) ;
                    tblBatchFAmount.AsFloat :=  - frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat ;
                    tblBatchDDate.AsDateTime := frPayCreditors.DTPaymentDate.Date ;
                    tblBatchSACCOUNT.AsString := AddDashInStdAccCode(copy(frPayCreditors.CDSCreditorOpenITemsCreditorCode.AsString,2,99));
                   if Length( dmdatabase.tblBatchSACCOUNT.AsString) = MainAccountLength then
                      dmdatabase.tblBatchSACCOUNT.AsString :=  dmdatabase.tblBatchSACCOUNT.AsString + '-' ;

                    tblBatchBLinked.AsInteger := 1 ;
                    tblBatchWAccountID.AsInteger := frPayCreditors.CDSCreditorOpenITemsaccountid.AsInteger ;


                    dmdatabase.tblBatchSCONTRAACCOUNT.AsString := DefaultAccount ;
                    tblBatchWCONTRAACCOUNTID.AsInteger := DefaultContraAccount ;
                   ProcRes :=   dmdatabase.tblBatchWAccountID.AsInteger ;
                    tblBatch.Post ;
                   LinkTranscationOnID(ADMCoreData, frPayCreditors.CDSCreditorOpenITemsTransactionID.AsInteger,
                                       ProcRes, tblBatchWLineID.AsInteger,0,CurrentUser,BatchCtrlID,
                                        frPayCreditors.CDSCreditorOpenITemsAmount.AsFloat,frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat,  tblBatchDDate.AsDateTime
                                        , frPayCreditors.CDSCreditorOpenITemsTransactionDate.AsDateTime,frPayCreditors.CDSCreditorOpenITemsReference.AsString,frPayCreditors.CDSCreditorOpenITemsReference.AsString);

                   ProcRes := 0 ;
                  end;

                   frPayCreditors.CDSCreditorOpenItems.Next ;
                end;
          end;
     finally
        FreeAndNil(frPayCreditors);
     end;
  end
  else if SameText('ReverseBat',Return) then
  begin

    tblBatch.open;
    SaveDt:= tblBatchFDEBIT.ReadOnly;
    SaveCt:= tblBatchFCREDIT.ReadOnly;

      tblBatch.First;
    While not   tblBatch.Eof do
    begin
      UnlinkLine( tblBatchWLINEID.AsInteger);

        tblBatch.Edit;
        tblBatchBRECONCILED.Clear ;
      if  tblBatchFDEBIT.Value=0 then
      begin
         tblBatchFDEBIT.Value:= tblBatchFCREDIT.Value;
         tblBatchFCREDIT.AsString:='0';
      end
      else if  tblBatchFCREDIT.Value=0 then
      begin
         tblBatchFCREDIT.Value:= tblBatchFDEBIT.Value;
         tblBatchFDEBIT.AsString:='0';
      end;
       tblBatchFAmount.Value := - tblBatchFAmount.Value;
       tblBatchFTAXAMOUNT.Value := - tblBatchFTAXAMOUNT.Value;
       tblBatch.Post;
       tblBatch.Next;
    end;

  end
  else if SameText('RecieveDebtors',Return) then
  begin
    WriteNwReportOp('BPDContraAccount',IntToStr(DefaultContraAccount));
    frBatchPayDebtors:= TfrBatchPayDebtors.Create(self);
     try
       SetProgress(-1);

        if frBatchPayDebtors.ShowModal = mrok then
          begin
             tblBatch.open;
             RemoveEmptys ;
             frBatchPayDebtors.CDOpenstaandePosten.First ;
             SetProgress(frBatchPayDebtors.CDOpenstaandePosten.RecordCount);
              while not frBatchPayDebtors.CDOpenstaandePosten.eof do
                begin
                 SetProgress('',frBatchPayDebtors.CDOpenstaandePosten.RecNo);
                 if frBatchPayDebtors.CDOpenstaandePostenEXPORT.AsInteger =1 then
                  begin
                    tblBatch.Append ;
                    tblBatchBExclusive.Asinteger := 0 ;
                   if frBatchPayDebtors.CBUseInvoiceRef.checked then
                    tblBatchSReference.AsString := frBatchPayDebtors.CDOpenstaandePostenSReference.AsString
                   else
                    tblBatchSReference.AsString := IntToStr(frBatchPayDebtors.LastBatchRun) ;
                    tblBatchSDescription.AsString := frBatchPayDebtors.CDOpenstaandePostenSDescription.AsString ;
                  //  dmdatabase.tblBatchFCREDIT.AsFloat := frBatchPayDebtors.CDOpenstaandePostenTotalAmount.AsFloat ;
                    tblBatchFCREDIT.AsFloat := abs(frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat) ;
                    tblBatchFAmount.AsFloat :=  -abs(frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat) ;
                    tblBatchDDate.AsDateTime := frBatchPayDebtors.DTPaymentDate.Date ;
                    tblBatchSACCOUNT.AsString := AddDashInStdAccCode(frBatchPayDebtors.CDOpenstaandePostenCode.AsString);
                    tblBatchBLinked.AsInteger := 1 ;

                  // tblAccount.open ;
                    tblBatchWAccountID.AsInteger := frBatchPayDebtors.CDOpenstaandePostenWAccountID.AsInteger ;

                    tblBatchSCONTRAACCOUNT.AsString := frBatchPayDebtors.EContraAccount.text ;
                    tblBatchWCONTRAACCOUNTID.AsInteger := frBatchPayDebtors.EContraAccount.Tag  ;
                   ProcRes := frBatchPayDebtors.CDOpenstaandePostenWAccountID.AsInteger ;

                    dmdatabase.tblBatch.Post ;
                   LinkTranscationOnID(ADMCoreData,frBatchPayDebtors.CDOpenstaandePostenWTransactionID.AsInteger,
                                       ProcRes, dmdatabase.tblBatchWLineID.AsInteger,0,CurrentUser,BatchCtrlID,
                                        frBatchPayDebtors.CDOpenstaandePostenTotalAmount.AsFloat,frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat, tblBatchDDate.AsDateTime
                                        , frBatchPayDebtors.CDOpenstaandePostenDDate.AsDateTime,frBatchPayDebtors.CDOpenstaandePostenSReference.AsString,frBatchPayDebtors.CDOpenstaandePostenSReference.AsString);

                   ProcRes := 0 ;
                  end;

                   frBatchPayDebtors.CDOpenstaandePosten.Next ;
                end;
          end;
     finally
        FreeAndNil(frBatchPayDebtors);
     end;
  end
  else if SameText('ImportPostBatch',Return) then
  begin
     ImportPostedBatch( dmDatabase.BatchType);
  end
  else if SameText('LoadTrans',Return) then
  begin

    if ImportDialog.FileName <> 'nothing' then
    begin
       dmDatabase.tblBatchTypes.Locate('WBatchTypeID', IntToStr( dmDatabase.BatchType), []);
      OnlyThisBatch:=  dmDatabase.tblBatchTypesSDescription.Value;
      ProcRes := ImportTransInBat(ImportDialog.FileName);
      OnlyThisBatch:='';
      if Not  dmdatabase.tblBatch.Active then
      begin
        SetProgress(-1);
        Close;
        Exit;
      end;

    end;
  end;
MyExit:
  ShowErrMsg(ProcRes);
//  PnlPrg.Visible:=False;
 
  finally
     InProcesOrClose := false ; 


     SetProgress(-1);
  end ;
  Except
     on e : Exception do
       begin
         OSFMessageDlg(E.Message,mterror,[mbyes],0) ;
         SetProgress(-1);
       end;
  end;
  finally
       TbarMain.Enabled := True ;
     dmDatabase.tblBatch.close ;
     tblBatch.Open ;
 
  end;

end;


procedure TfmBatchEntryBank.tlbtnProcessClick(Sender: TObject);
var
  Return : String;
begin

           
  PostHere:=True;
  IsCashBook := 1 ;
 cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0 ;
  Return := fmBatchProcessMenu.ShowMenu('');
  // done : Pieter Before annything remove empty
  RemoveEmptys ;
    F9Process(Return);
  // done : Pieter Apparently After annything remove empty
//  RemoveEmptys ;
   dmDatabase.IsBalPost:=False;


end;

procedure TfmBatchEntryBank.tlbtnSetupClick(Sender: TObject);
 var Result : Integer ;
begin
  cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0;
  fmBatchOptions := TfmBatchOptions.Create(self);
  try
  SetUpForm(fmBatchOptions);
  fmBatchOptions.ISFromDutchBankWay := true ;
  Result := fmBatchOptions.ShowModal
   finally
  fmBatchOptions.Free;
   end;
 if Result = mrYes then
    begin
    NeedsReopen := true ;
    self.close ;
    end;
end;



Procedure TfmBatchEntryBank.AdjIncExcBtn(BExcl:Boolean);
Begin
  if BExcl =False then
  begin

    tlbtnIncl.Down := True;
    tlbtnExcl.Down := false;
  end
  else
  begin
    tlbtnIncl.Down := false;
    tlbtnExcl.Down := True;
  end;

end;


procedure TfmBatchEntryBank.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
     RResult:Double;
     LookupType : String ;
begin
  if ssCtrl in Shift then
  begin
    if (Key=82)then
    begin
      if not ( tblbatch.State in [dsedit,DsInsert ]) then
       tblBatch.Edit;
       tblBatchBReconciled.Value:= ord(Not ( tblBatchBReconciled.Value= 1));
       tblBatch.post;
      Key:=0;
    end;
  end else if Key = 115 then
  begin
    RResult:= TblBatchFDEBIT.value- TblBatchFCREDIT.value;
    if CallCalc(RResult) then
    begin
      if RResult<>0 then
      begin
        if not ( tblbatch.State in [dsedit,DsInsert ]) then
         TblBatch.edit;
        if RResult>0 then
        begin
          cxGrid1DBBandedTableView1FDEBIT.FocusWithSelection ;
           TblBatchFDEBIT.value:=RResult;
        end
        else
        begin
          cxGrid1DBBandedTableView1FCREDIT.FocusWithSelection ;
           TblBatchFCREDIT.value:=-RResult;
        end;
      end;
    end;
    Key := 0;
  end
  else if Key = 116 then {F5}
  begin
    if ssAlt in Shift then begin
       if WindowState=wsNormal then
         WindowState:=wsMaximized
       else
         WindowState:=wsNormal;
     end
     else
       tlbtnBalanceClick(Sender);
    Key := 0;
  end
  else if Key = 117 then
  begin
    tlbtnPostClick(Sender);
    Key := 0;
  end
  else if Key = 118 then
  begin
    tlbtnExclClick(Sender);
    Key := 0;
  end
  else if Key = 119 then
  begin
    tlbtnListClick(Sender);
    Key := 0;
  end
  else if Key = 120 then
  begin
    tlbtnProcessClick(Sender);
    Key := 0;
  end
  else if Key = 121 then
  begin
    tlbtnSetupClick(Sender);
    Key := 0;
  end
  else if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             if IsCashBook in [1,2] then
                HtmlShowTopic(143)
             else
                HtmlShowTopic(144);
             key := 0;

   end else


 // done : pieter lets get on with the grid and use the current value if tab is pressed
 // its done by setting all the panelsX to tabstop=false

if key = vk_right then
   // done : Pieter go to next line fist field
   begin
     if not cxGrid1DBBandedTableView1FCREDIT.Options.Editing then
       if cxGrid1DBBandedTableView1FDEBIT.Focused then
        if not  tblBatch.Eof then
          begin
             tblBatch.next ;

          end else
          begin
             tblBatch.last ;
             tblBatch.Append ;
            cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection ;
          end;

   end else
if key = vk_left then
   // done : Pieter go to next line fist field
   begin

        if  not cxGrid1DBBandedTableView1FDEBIT.Options.Editing then
         if cxGrid1DBBandedTableView1FCREDIT.Focused then
            cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex - 1 ; 
   end else

 if (key = vk_UP) and (ssShift in Shift) then
      begin


        if ( tblBatch.State in [dsedit,dsinsert]) then
            tblBatch.post ;

         tblBatch.Prior;
        key := 0;
      end else
 if (key = vk_DOWN) and (ssShift in Shift) then
   // done : Pieter go to next line fist field
   begin


        if ( tblBatch.State in [dsedit,dsinsert]) then
            tblBatch.post ;

         tblBatch.Next;
        key := 0;
   end else
   begin
       if edtAlias.Focused then exit ;

   end;
   if key = VK_ESCAPE then
     begin
      aLookupgrid.lookAccount := '' ;
      aLookupgrid.lookGroup1 := '' ;
      aLookupgrid.lookContra := '' ;
      aLookupgrid.lookGroup2 := '' ;
      aLookupgrid.lookjob := '' ;
      aLookupgrid.lookTax := '' ;
      lFind.Caption := '' ;
    end;
end;

procedure TfmBatchEntryBank.LookupDBGridDblClick(Sender: TObject);
begin
LastEnterdAccount := 'go' ;
end;

procedure TfmBatchEntryBank.CtrOkClick(Sender: TObject);
begin
  cxGrid1.SetFocus;
end;

procedure TfmBatchEntryBank.CtrCancelClick(Sender: TObject);
begin
  ReturnLookup:='ESC';
  ReturnID:=-1;
  cxGrid1.SetFocus;
end;

procedure TfmBatchEntryBank.tlbtnListClick(Sender: TObject);
begin
   F9Process('Print');
end;

procedure TfmBatchEntryBank.dbgridBatchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=80) and (ssCtrl in Shift) then begin
    F9Process('Print');
    Key:=0;
  end; 
end;



Function TfmBatchEntryBank.CallLinks : Boolean ;
Var
  Value:Double;
begin
  result := false ;
  if InProcesOrClose then exit ;
  if IsRepeatingBat then exit;
  // done : Pieter getting errors in sales and stock journals that the link ammount was not found. But it must not link this for some batches
  if NotAOpenItemBatch  then exit ;


     dmDatabase.OpenItemRequest := BCheckOpenItem( tblBatchWaccountID.Value );
  //  if pos(GetMainAccountCode( tblBatchSACCOUNT.AsString)+GetSubAccountCode( tblBatchSACCOUNT.AsString),SpecialOpenItemAccounts ) > 0 then
 //       OpenItemRequest := 3 ;
    if  dmDatabase.OpenItemRequest<>0 then
    begin
      Value := RoundAmount( tblBatchFDEBIT.Value -  tblBatchFCREDIT.Value);
      { Bugs : OpenItem Screen not showing for dt-debtor or Ct-Creditor
       Value should keep the sign and this will be remove in CanRunOpenItem}
      if Value <> 0 then
      begin
        BatLinkedID :=  tblBatchWlineID.AsInteger;
        // Unlink line if exists
      // UnlinkLine(BatLinkedID);
        //
        result := Not CanRunOpenItem( tblBatchSReference.Value, TblbatchDDate.AsDateTime ,  TblbatchWAccountID.asInteger,BatchCtrlID, dmDatabase.OpenItemRequest,Value,BatLinkedID,false, tblBatchSDESCRIPTION.AsString + ' ' + Label9.Text ) ;

         tblBatch.edit ;
         tblBatchBLinked.Value := ord(ItemLiked);
        ShowLinkForThisLine := false ;
      end;
    end;
end;



procedure TfmBatchEntryBank.PnlAliasExit(Sender: TObject);
begin

     search:=Trim(edtAlias.text);
     if (search<>'') and (GetBatAlias(BatchCtrlID) <> search) then
     begin
       ChangeBatAlias(BatchCtrlID,edtAlias.text);
       Caption := BatchCaption +' - ['+search+']';
     end;


end;

procedure TfmBatchEntryBank.edtAliasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
   if cxGrid1.CanFocus then
   cxGrid1.SetFocus ;
  end;
end;

function TfmBatchEntryBank.FindIndexOfName(aName : String): Integer;

var
i : Integer ;
begin
  result := - 1 ;
  for i := 0 to cxGrid1DBBandedTableView1.ColumnCount -1 do
  begin

    if uppercase(TcxGridDBBandedColumn(cxGrid1DBBandedTableView1.Columns[i]).DataBinding.FieldName) = uppercase(aName) then
       begin
          result := cxGrid1DBBandedTableView1.Columns[i].index  ;
          Exit ;
       end;
  end;

end;

procedure TfmBatchEntryBank.RemoveBalanceEntrys;
begin
    While not  tblBatch.Eof do
    begin
      if  tblBatchSCONTRAACCOUNT.Value= '***' then
          tblBatch.Delete
      else
          tblBatch.Next;
    end;
end;



procedure TfmBatchEntryBank.RemoveEmptys;
var
 i : Integer ;
begin
    InProcesOrClose := true ;
        if ( tblBatch.state in [dsinsert,dsEdit]) then
      tblBatch.post ;
     tblBatch.first ;
    i := 0 ;
    try
    While not  tblBatch.Eof do
    begin
      if ( tblBatchFDEBIT.Asfloat = 0 ) and
         ( tblBatchFCREDIT.Asfloat = 0) and
         ( tblBatchSDescription.AsString = '') and
         ( tblBatchSReference.AsString = '')  then
        begin
         if  tblBatch.RecordCount <> 1 then
          tblBatch.Delete else
          tblBatch.Next;
        end
      else
          tblBatch.Next;
    end;

    finally
     //   tblBatch.EnableControls;
       InProcesOrClose := false ; 
    end;
end;

procedure TfmBatchEntryBank.tblBatchBeforeDelete(DataSet: TDataSet);
begin
  UnlinkLine( tblBatchWLINEID.AsInteger) ;
end;

procedure TfmBatchEntryBank.tblBatchBeforeOpen(DataSet: TDataSet);
begin
   if DMTCCoreLink.GetFieldLength((DataSet as TuniTable).TableName,'SDESCRIPTION') <>  DMTCCoreLink.MessageLength then
    begin
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +(DataSet as TuniTable).TableName +' ALTER SDESCRIPTION TYPE varChar('+IntToStr(DMTCCoreLink.MessageLength)+'); ');
    end;
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select first 1 * from ' +(DataSet as TuniTable).TableName );

end;

procedure TfmBatchEntryBank.tblBatchBeforePost(DataSet: TDataSet);
begin
if not InLinkCall then
 if tblBatchWACCOUNTID.OldValue <> Null then
 if (VarToStr(tblBatchWACCOUNTID.OldValue) <> VarToStr(tblBatchWACCOUNTID.Value))
  or (StrToFloatDef(VarToStr(tblBatchFDEBIT.OldValue),0) <> StrToFloatDef(VarToStr(tblBatchFDEBIT.Value),0))
  or (StrToFloatDef(VarToStr(tblBatchFCREDIT.OldValue),0) <> StrToFloatDef(VarToStr(tblBatchFCREDIT.Value),0))
  or (StrToIntDef(VarToStr(tblBatchWTAXID.OldValue),0) <> StrToIntDef(VarToStr(tblBatchWTAXID.Value),0))
 then
  begin
   if tblBatchBLINKED.AsInteger = 1 then
      UnlinkLine( tblBatchWLINEID.AsInteger) ;

      tblBatchBLINKED.Clear   ;
      ShowLinkForThisLine := True ;
  end;

if tblBatch.State = dsinsert  then
  if tblBatchWLineID.IsNull then
  begin

  tblBatchWLineID.AsInteger := StrToIntDef(VartoStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select 1 + max(WLineID)  from ' + tblBatch.TableName)),1);
  if tblBatchWLINKEDID.IsNull then
    tblBatchWLINKEDID.AsInteger := tblBatchWLineID.AsInteger ;
  end;
 if tblBatchDALLOCATEDDATE.IsNull then tblBatchDALLOCATEDDATE.AsDateTime  := date ;

 tblBatchDDATE.AsDateTime := trunc(tblBatchDDATE.AsDateTime);

  // force exit ;

  if dmDatabase.DoAutoInc   then
  if tblBatchWLINEID.AsInteger =tblBatchWLINKEDID.AsInteger then
    begin
    if tblBatchSReference.AsString = '' then
       begin
       tblBatchSReference.AsString := _IncrementString(ReadReportOp(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  + 'AutoIncNr','0').asstring) ;
       writereportop(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  +'AutoIncNr',tblBatchSReference.AsString);
       end ;
    end;



      if ShowLinkForThisLine then
         begin
         if  tblBatchBLinked.IsNull then
         ShowLinkMessage := CallLinks;
         ShowLinkForThisLine := false ;
         end;
   if  (tblBatch.State in [dsEdit,dsInsert]) then
   begin
   if  tblBatchWACCOUNTID.AsInteger <> 0 then
    tblBatchSACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode(tblBatchWACCOUNTID.AsInteger))
    else
    tblBatchSACCOUNT.Clear ;

     if  tblBatchWCONTRAACCOUNTID.AsInteger <> 0 then
    tblBatchSCONTRAACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode(tblBatchWCONTRAACCOUNTID.AsInteger))
    else
    tblBatchSCONTRAACCOUNT.Clear ;

     if  tblBatchWTAXID.AsInteger <> 0 then
    tblBatchSTAX.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode(tblBatchWTAXID.AsInteger))
    else
    tblBatchSTAX.Clear ;
   end;


end;

procedure TfmBatchEntryBank.tblBatchCalcFields(DataSet: TDataSet);
begin
tblBatchISBALANCE.AsInteger := Ord(tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger  ) ;
end;

procedure TfmBatchEntryBank.tblBatchWACCOUNTIDValidate(Sender: TField);
var
Account : Integer ;
aAmt  : Double ;
begin
if (Sender.IsNull ) or (Sender.OldValue <> Sender.NewValue)  then
begin
 UnlinkLine(tblBatchWLINEID.AsInteger);
end;

 if cxGrid1DBBandedTableView1WACCOUNTID.Focused then

  case DMTCCoreLink.AccObject.getAccountType(tblBatchWACCOUNTID.AsInteger) of
  0 : begin

    if  tblBatchWTAXID.AsInteger = 0 then
     if cxGrid1DBBandedTableView1WTAXID.Visible then
       begin
        Account := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount( tblBatchWACCOUNTID.AsInteger) ;
          if Account <> 0 then
           begin
           tblBatchWTAXID.AsInteger := Account ;
           end;
       end;
    end;

   1,2: begin
         if tblBatchWTAXID.AsInteger <> 0 then
          begin
           tblBatchWTAXID.AsInteger :=0 ;
           aAmt :=  tblBatchFAMOUNT.AsFloat;
            if aAmt > 0 then
                tblBatchFDEBIT.AsFloat := aAmt
              else
              tblBatchFCREDIT.AsFloat := (-aAmt)   ;
           end;
         end;
    end;
     GetRefTotals  ;
end;

procedure TfmBatchEntryBank.tblBatchWCONTRAACCOUNTIDValidate(Sender: TField);
begin
 if BRememberTax then
  if sender.AsInteger <> 0 then
       tblBatchWTAXID.AsInteger :=ReadReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( tblBatchWCONTRAACCOUNTID.AsInteger) + 'WAccountTax',0).AsInteger ;

end;

procedure TfmBatchEntryBank.tblBatchWTAXIDValidate(Sender: TField);
begin
 if (Sender.IsNull ) or (Sender.OldValue <> Sender.NewValue)  then
begin
 UnlinkLine(tblBatchWLINEID.AsInteger);
  // Correct amt
 // tblBatch.Edit ;

end;
 if cxGrid1DBBandedTableView1WTAXID.Focused or  cxGrid1DBBandedTableView1WACCOUNTID.Focused  then
  begin
     if tblBatchFAMOUNT.AsFloat > 0 then
    begin
    if tblBatchBEXCLUSIVE.AsInteger = 0 then
         tblBatchFDEBIT.AsFloat :=   tblBatchFAMOUNT.AsFloat / TDataBaseRoutines.GetTaxRateOnId(Sender.value)
         else
         tblBatchFDEBIT.AsFloat :=   tblBatchFAMOUNT.AsFloat ;
    end else
    begin
     if tblBatchBEXCLUSIVE.AsInteger = 0 then
     tblBatchFCREDIT.AsFloat :=   -tblBatchFAMOUNT.AsFloat / TDataBaseRoutines.GetTaxRateOnId(Sender.value)
     else
         tblBatchFCREDIT.AsFloat :=   -tblBatchFAMOUNT.AsFloat ;
    end;
     GetRefTotals  ;
  end;

end;

procedure TfmBatchEntryBank.FormCreate(Sender: TObject);
begin
   aLookupgrid := TfmLookupgrids.Create(self) ;
   aLookupgrid.CloseUpNotify := onclosupNotifiy ;
   aLookupgrid.PopUpNotify :=  onPopupNotifiy;

  DMTCCoreLink.AssignConnectionToChilds(self);
  //LastDate := date ;
  if DMTCCoreLink.SimpleMode = 1 then
    begin
      Lookupdocwithamount1.Visible := False ;
      Lookupinvoice1.Visible := False ;
   end;

   tblBatchFDEBIT.ReadOnly := false ;
  Label9.Color := Panel2.Color ;
  
   tblBatchFCREDIT.ReadOnly := false ;
  TDataBaseRoutines.SetDynamicFieldLengths(self);
   tblBatchFCREDIT.Tag := 0 ;
   tblBatchFDEBIT.Tag := 0 ;
  EmailLength    := DMTCCoreLink.GetFieldLength('debtor','SEMail');
  BankAccountLength := DMTCCoreLink.GetFieldLength('debtor','SBankAccountNumber');
  TranslateColumns ;
with cxGrid1DBBandedTableView1.DataController.Filter.Root do
  begin
    //clear all existing filter conditions
    Clear;
    //set the logical operator
    //by which new conditions are combined
  //  BoolOperatorKind := fboOr;
    //add new filter conditions
    AddItem(cxGrid1DBBandedTableView1ISBALANCE, foEqual, 0 , 'balance');
  end;


end;

procedure TfmBatchEntryBank.FormDestroy(Sender: TObject);
begin
 ADMCoreData.free ;

  dmDatabase.tblBatchTypes.close ;
  tblBatch.Filtered := false ;
  tblBatch.close ;
 CdsBankDnl.Close ;
end;



procedure TfmBatchEntryBank.tblBatchAfterDelete(DataSet: TDataSet);
begin
GetRefTotals ;
end;



procedure TfmBatchEntryBank.tblBatchAfterInsert(DataSet: TDataSet);
Var
  HoldAccountActive:Boolean;
  i,maxid :Integer ;
begin
  maxid := 0 ;
  for i := 0 to cxGrid1DBBandedTableView1.DataController.RecordCount -1 do
     begin
        if    StrToIntDef(VarTosTR(cxGrid1DBBandedTableView1.DataController.Values[i,cxGrid1DBBandedTableView1WLINEID.Index]),0) > maxid then
           maxid :=StrToIntDef(VarTosTR(cxGrid1DBBandedTableView1.DataController.Values[i,cxGrid1DBBandedTableView1WLINEID.Index]),0) ;
     end;
   maxid := maxid + 1 ;
  tblBatchWLineID.AsInteger := maxid;

  tblBatchDDate.Value := Date ;
  tblBatchWREPORTINGGROUP1ID.AsInteger := dmDatabase.DefCostGroup1 ;
  tblBatchWREPORTINGGROUP2ID.AsInteger := 0 ;
  tblBatchBEXCLUSIVE.AsInteger := 1 ;
  tblBatchWLINKEDID.AsInteger := tblBatchWLineID.AsInteger ;

  tblBatchFamount.AsString:='';
  tblBatchFTaxamount.AsString:='';
  tblBatchSTAX.Value:=dmDatabase.DefaultTax;
  tblBatchBExclusive.AsInteger:= ord(Not(dmDatabase.tblBatchTypesBInclusiveMode.AsInteger =1));

  if dmDatabase.DoAutoInc   then
    if tblBatchWLINEID.AsInteger =tblBatchWLINKEDID.AsInteger then
    begin
       tblBatchSReference.AsString := _IncrementString(ReadReportOp(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  + 'AutoIncNr','0').asstring) ;
       writereportop(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  +'AutoIncNr',tblBatchSReference.AsString);
    end;


  if dmDatabase.tblBatchTypesBRepeatDetails.Value = 1 then
  Begin
    tblBatchSDescription.Value := LastUsedDescription ;
    if not dmDatabase.DoAutoInc then
     begin
      if dmDatabase.tblBatchTypesBIncrementRefNo.Value = 1 then
      begin
      tblBatchSReference.Value := _IncrementString(LastUsedReference) ;
      LastUsedReference := tblBatchSReference.Value ;
      end else
      tblBatchSReference.Value := LastUsedReference;
     end;
      if tblBatchSReference.Value = '********' then
        tblBatchSReference.Value := '';
    if LastUsedDate = 0 then LastUsedDate := date ;
    tblBatchDDate.Value := LastUsedDate ;
    tblBatchDAllocatedDate.Value := Date ;
    tblBatchWCONTRAACCOUNTID.Value:= LastUsedContra;
    tblBatchWACCOUNTID.Value:=LastUsedAccount ;
    tblBatchWTAXID.Value:= LastUsedTax
  end
  else
  begin
   if not dmDatabase.DoAutoInc then
     begin
      if dmDatabase.tblBatchTypesBIncrementRefNo.Value = 1 then
      begin
      tblBatchSReference.Value := _IncrementString(LastUsedReference) ;
      LastUsedReference := tblBatchSReference.Value ;
      end else
      tblBatchSReference.Value := LastUsedReference;
     end;
      if tblBatchSReference.Value = '********' then
        tblBatchSReference.Value := '';
      tblBatchBReconciled.Value := 0;
  end;
  if DefaultContraAccount <> 0 then
     tblBatchWCONTRAACCOUNTID.Value:= DefaultContraAccount ;
end;

procedure TfmBatchEntryBank.tlbtnInsertClick(Sender: TObject);
begin
 cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0 ;


        tblBatch.Append ;
    



end;                                                                    

procedure TfmBatchEntryBank.tblBatchAfterPost(DataSet: TDataSet);
begin

 if (tblBatch.RecNo = tblBatch.RecordCount) or (DataSet.State = dsinsert) then
   begin
   LastUsedReference :=  tblBatchSREFERENCE.AsString ;
   LastUsedDescription :=  tblBatchSDESCRIPTION.AsString ;
   LastUsedContra    :=  tblBatchWCONTRAACCOUNTID.AsInteger ;
   LastUsedAccount   :=  tblBatchWACCOUNTID.AsInteger ;
   LastUsedDate   :=  tblBatchDDATE.AsDateTime ;
   LastUsedTax   :=  tblBatchWTAXID.AsInteger ;
   end;
     if BrememberContra  then
         if tblBatchWACCOUNTID.AsInteger  <>  0  then
          WriteReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( tblBatchWACCOUNTID.AsInteger) + 'WContraAccount', tblBatchWCONTRAACCOUNTID.AsString) ;
    if BRememberTax then
      if tblBatchWCONTRAACCOUNTID.AsInteger <> 0 then
           WriteReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(tblBatchWCONTRAACCOUNTID.AsInteger)+ 'WAccountTax',IntToStr( tblBatchWTAXID.AsInteger)) ;
end;

procedure TfmBatchEntryBank.tblBatchAfterScroll(DataSet: TDataSet);
begin
lastfocusedaccount := tblBatchWACCOUNTID.AsInteger ;
GetRefTotals ;
end;

procedure TfmBatchEntryBank.ToolButton2Click(Sender: TObject);
Var
  ISReverse:Boolean;
  Progress,AAccountId : Integer ;
  EMailAdres,LineText,FindDefAcc : String ;
   aProgress : TfmNewProgress ;
begin
   aProgress := TfmNewProgress.create(nil) ;
   try
   ZQBankRefs.close;
   zqBankActions.Close;
   ZQBankRefs.open;
   zqBankActions.open;
   aProgress.initProgress(gettextlang(1255),1);
 
 

   InProcesOrClose := true ;
   try
      DMTCCoreLink.ExecSql('update DnlBanks set WLineid = WLineid + 100000 where WLineTypeID<>2 And BReconciled=0 and WBankID=' + IntToStr(DefaultAccountId)+' and WLineid < 100000');

      CdsBankDnl.SQL.Text := 'Select * From DnlBanks where WLineTypeID<>2 And BReconciled=0 and WBankID=' + IntToStr(DefaultAccountId)+' order by wlineid desc' ;
      CdsBankDnl.open ;
      if not CdsBankDnl.Active then exit ;

      CdsBankDnl.First;
      aProgress.initProgress('',CdsBankDnl.RecordCount);
      Progress := 0 ;
      While not CdsBankDnl.Eof do
      begin
          aProgress.SetProgress('',Progress);
          inc(Progress);
           tblBatch.Append ;

     
          if CdsBankDnlFAmount.AsFloat < 0 then
          begin
             tblBatchFDEBIT.AsFloat :=  abs(CdsBankDnlFAmount.AsFloat) ;
             tblBatchFCREDIT.AsFloat :=  0 ;
             tblBatchFTaxAmount.AsFloat := 0 ;
             tblBatchFAmount.AsFloat := abs(CdsBankDnlFAmount.AsFloat);
          end
          else
          begin
             tblBatchFCREDIT.AsFloat := abs(CdsBankDnlFAmount.AsFloat) ;
             tblBatchFDEBIT.AsFloat :=  0 ;
             tblBatchFAmount.AsFloat :=  -abs(CdsBankDnlFAmount.AsFloat) ;
             tblBatchFTaxAmount.AsFloat :=  0 ;
          end ;
           tblBatchSDescription.AsString := CdsBankDnlSDescription.AsString ;
           tblBatchBReconciled.Asinteger := 0 ;
           tblBatchSReference.AsString := CdsBankDnlSReference.AsString ;
           tblBatchWAccountID.AsInteger := 0 ;

          CdsBankDnl.edit ;
          CdsBankDnlBReconciled.AsInteger := 1 ;
          CdsBankDnlSREFERENCE.AsString := CdsBankDnlSReference.AsString ;
          CdsBankDnlWLINEID.AsInteger :=  tblBatchWLINEID.AsInteger ;
          CdsBankDnl.post ;


          // try to get the Account

           tblBatchDDate.AsDateTime :=  CdsBankDnlDPostedDate.AsDateTime ;
           tblBatchBExclusive.Asinteger := 0 ;
          // special match
          MatchAutolinkofaccount ;
          // end link ammount.
           tblBatch.Post ;
          

          CdsBankDnl.Next;
      end;

   finally
      CdsBankDnl.close ;


     InProcesOrClose := false ;

   end;
  finally
    aProgress.CloseProgress;
    aProgress.free ;
  end;

end;

procedure TfmBatchEntryBank.TBBankImportClick(Sender: TObject);

begin
try
cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0 ;

 tblBatch.Filtered := false ;
 try

 OSFPLUGINRunPlugInsDLLProgram('plug_ins\bankimport.tpd','BANKID='+IntToStr(DefaultContraAccount) );
 finally
 ToolButton2Click(self);
 RemoveEmptys ;
 
 
 end ;
finally
 
 begin
    tblBatch.close ;
    tblBatch.open ;
 end;

// todo : Pieter abort ;
end;
end;

procedure TfmBatchEntryBank.Deleteline1Click(Sender: TObject);
Var
  i , Tmp:Integer;

begin

  i := cxGrid1DBBandedTableView1.Controller.SelectedRecordCount ;
  if i < 1 then i := 1 ;
    //aSaveClientDatasetCallList.
  if  tblBatch.IsEmpty then exit ;
  if OSFMessageDlg(GetTextLang(437) + ' (' + IntToStr(i)+')' {Are you sure you wish to delete this transaction ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
   try
     if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount > 1 then
      begin
        for i := cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 downto 0  do
           begin

             begin
             cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
             Tmp :=  tblBatchWlineID.AsInteger;
             UnlinkLine(Tmp);
              tblBatch.Delete;
             end;
           end;
      end else
      begin
       Tmp :=  tblBatchWlineID.AsInteger;
       UnlinkLine(Tmp);
        tblBatch.Delete;
      end;
   except
   end;
    GetRefTotals ;
end;



procedure TfmBatchEntryBank.MyOnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 if Usefilter1.Checked then
        begin
          if look <> '' then
          begin
            Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0 ;
            If not Accept then
            Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SAccountcode').AsString)) <> 0 ;
            if DataSet.FindField('OPENITEM') <> nil then
               If not Accept then
               Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('OPENITEM').AsString)) <> 0 ;
          end
          else
          Accept := true ;
        end;
end ;

procedure TfmBatchEntryBank.Updatebankaccount1Click(Sender: TObject);
procedure AddToAccountRef ;
var
 AAccountId : Integer ;
begin
       if StrToIntDef( dmDatabase.tblBankDnlSACCOUNTCODE.AsString,1) = 0 then
          exit ;

       AAccountId := StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WaccountId from Accountref where WAccountid = '+ IntToStr( tblBatchWACCOUNTID.AsInteger) +' and Sreference =' + QuotedStr( dmDatabase.tblBankDnlSACCOUNTCODE.AsString))) ,-1) ;
       if AAccountId = -1 then
          begin
              TDataBaseRoutines.ExecSql('insert into Accountref (WACCOUNTREFID, SREFERENCE, WACCOUNTID) values('+varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(DMTCCoreLink.GetGenUniSyntax('gen_accountref_id')))+','+QuotedStr( dmDatabase.tblBankDnlSACCOUNTCODE.AsString)+','+ tblBatchWACCOUNTID.asstring+')');
          end else
          if (AAccountId  <>  tblBatchWACCOUNTID.AsInteger) then
             begin
              TDataBaseRoutines.ExecSql('insert into Accountref (WACCOUNTREFID, SREFERENCE, WACCOUNTID) values('+varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(DMTCCoreLink.GetGenUniSyntax('gen_accountref_id')))+','+QuotedStr( dmDatabase.tblBankDnlSACCOUNTCODE.AsString)+','+ tblBatchWACCOUNTID.asstring+')');
            end;
end;

begin
 if sender <> nil then
  if OSFMessageDlg(Format(DMTCCoreLink.GetTextLang(3367) ,[StringReplace(Updatebankaccount1.Caption,'&','',[rfReplaceAll])]) ,mtConfirmation,mbOKCancel,0) = mrCancel then exit ;


    // todo : Optimzi use SQL
    dmDatabase.tblBankDnl.sql.text := 'Select * from  DNLBANKS where WBankID=' + IntToStr(DefaultAccountId) +
   ' and SReference = ' + QuotedStr( tblBatchSReference.asstring)+ '  and WLineID =' + IntToStr( tblBatchWLineID.asinteger) + ' and WTCTRANSID is null '  ;
   dmDatabase.tblBankDnl.open ;
  if not  dmDatabase.tblBankDnl.IsEmpty then
     begin
        If Length( dmDatabase.tblBankDnlSACCOUNTCODE.AsString) > 1  then
          if   tblBatchWACCOUNTID.AsInteger <> 0 then
          if  dmDatabase.tblBankDnlWPROFILEID.AsInteger = 0 then
           begin

            dmDatabase.tblDebtor.Close ;
            dmDatabase.tblDebtor.FilterSQL := 'WACCOUNTID=' + IntToStr(tblBatchWAccountID.AsInteger) ;
             dmDatabase.tblDebtor.Open ;
            if  dmDatabase.tblDebtor.locate('WAccountId', tblBatchWAccountID.AsInteger,[]) then
              begin
               if ( dmDatabase.tblDebtorSBankAccountNumber.AsString <> '' ) and
                  ( dmDatabase.tblDebtorSBankAccountNumber.AsString <> trim(dmDatabase.tblBankDnlSACCOUNTCODE.AsString)) then
                  begin
                   AddToAccountRef  ;
                 //if OSFMessageDlg(GetTextLAng(2903) + #10+#13 +gettextlang(2010) + ' '  +   tblDebtorSBankAccountNumber.AsString +' ' +gettextlang(1932) + ' '  +  tblBankDnlSACCOUNTCODE.AsString {There was already a bank account found do you wish to update this? from [code] to [code]},mtConfirmation,[mbyes,mbno],0) <> mryes then
                    exit ; // Exit this routine
                   end;
                  dmDatabase.tblDebtor.Edit ;
                  dmDatabase.tblDebtorSBranchCode.AsString := 'AutoAdded' ;
                  dmDatabase.tblDebtorSBankAccountNumber.AsString := trim( dmDatabase.tblBankDnlSACCOUNTCODE.AsString);
                  dmDatabase.tblDebtor.Post ;
              end else
              begin
            dmDatabase.tblCreditor.Close ;
            dmDatabase.tblCreditor.FilterSQL := 'WACCOUNTID=' + IntToStr(tblBatchWAccountID.AsInteger) ;
             dmDatabase.tblCreditor.Open ;
                dmDatabase.tblCreditor.Open ;
               if  dmDatabase.tblCreditor.locate('WAccountId', tblBatchWAccountID.AsInteger,[]) then
                  begin
               if ( dmDatabase.tblCreditorSBankAccountNumber.AsString <> '' ) and
                  ( dmDatabase.tblCreditorSBankAccountNumber.AsString <> trim( dmDatabase.tblBankDnlSACCOUNTCODE.AsString)) then
                      begin
                        AddToAccountRef  ;
                        // if OSFMessageDlg(GetTextLAng(2903) + #10+#13 +gettextlang(2010) + ' '  +   tblCreditorSBankAccountNumber.AsString +' ' +gettextlang(1932) + ' '  +  tblBankDnlSACCOUNTCODE.AsString {There was already a bank account found do you wish to update this? from [code] to [code]},mtConfirmation,[mbyes,mbno],0) <> mryes then
                        exit ; // Exit this routine
                      end;
                    dmDatabase.tblCreditor.Edit ;
                    dmDatabase.tblCreditorSBranchCode.AsString := 'AutoAdded' ;
                    dmDatabase.tblCreditorSBankAccountNumber.AsString := trim( dmDatabase.tblBankDnlSACCOUNTCODE.AsString);
                    dmDatabase.tblCreditor.Post ;
                  end else
                    begin
                      AddToAccountRef  ;
                    end;

                dmDatabase.tblDebtor.Close ;
                dmDatabase.tblDebtor.FilterSQL := '' ;
                dmDatabase.tblCreditor.Close ;
                dmDatabase.tblCreditor.FilterSQL := '' ;
              end;
         end;
     end;
    dmDatabase.tblBankDnl.close ;

end;

procedure TfmBatchEntryBank.Usefilter1Click(Sender: TObject);
begin
 Usefilter1.Checked := Not Usefilter1.Checked;
end;

procedure TfmBatchEntryBank.LookUpPanelEnter(Sender: TObject);
begin
 LastEnterdAccount :=  tblBatchSACCOUNT.AsString ;

end;

procedure TfmBatchEntryBank.fmInvoiceEntryGridLookupinvoice1Click(
  Sender: TObject);
  var
   BatchItems :String ;
   LinkAmount : Double ;

begin
  BatchItems := DMTCCoreLink.SQLList.ParamsList.Text ;
  if  tblBatch.IsEmpty then exit ;


    if afmInvoiceEntryGrid = nil then
    afmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try

    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(10)) ;
    idDocType:=10;

    afmInvoiceEntryGrid.ListIsReadOnly := true ;
    afmInvoiceEntryGrid.LookupFrom := 1 ;
    if afmInvoiceEntryGrid.ShowModal = mrok then
      begin
         DMTCCoreLink.SQLList.ParamsList.Text := BatchItems ;
         cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 2 ;
          tblBatch.Edit ;
          tblBatchSCONTRAACCOUNT.AsString := DefaultAccount ;
          tblBatchWCONTRAACCOUNTID.AsInteger := DefaultAccountId ;
          tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(afmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ; ;
          tblBatchWAccountID.AsInteger := afmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;
          tblBatchWDOCID.AsInteger := afmInvoiceEntryGrid.QDocHeadWDOCID.AsInteger ;

         if  tblBatchFAmount.AsFloat = 0 then
            begin
            if afmInvoiceEntryGrid.QDocHeadOPENAMOUNT.AsFloat = 0 then
            LinkAmount := afmInvoiceEntryGrid.QDocHeadFDOCAMOUNT.AsFloat
            else
            LinkAmount := afmInvoiceEntryGrid.QDocHeadOPENAMOUNT.AsFloat ;

             if (idDocType in [10,13,14])then
             begin
              tblBatchFDEBIT.Asfloat := 0 ;
              tblBatchFCREDIT.Asfloat := abs(LinkAmount) ;
              tblBatchFAmount.AsFloat :=  -abs(LinkAmount) ;
             end else
             begin
              tblBatchFCREDIT.Asfloat := 0 ;
              tblBatchFDEBIT.Asfloat := abs(LinkAmount) ;
              tblBatchFAmount.AsFloat := abs(LinkAmount) ;
             end;

            end;
         If  tblBatchSDescription.AsString = '' then
             tblBatchSDescription.AsString := trim(afmInvoiceEntryGrid.QDocHeadSDocNo.AsString +' ' + afmInvoiceEntryGrid.QDocHeadSReference.AsString) ;
         tblBatchBLinked.clear ;
         tblBatch.Post ;
      end;
    finally
 
    end;


end;

procedure TfmBatchEntryBank.Lookupdocwithamount1Click(Sender: TObject);
Var
 BatLinkedID : Integer ;
 
begin

  if  tblBatch.IsEmpty then exit ;
  if  tblBatchFAmount.AsFloat = 0 then exit ;

    if afmInvoiceEntryGrid = nil then
    afmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    if TDataBaseRoutines.GetAccountType( tblBatchWACCOUNTID.AsInteger) <> 2 then
    begin
    if  tblBatchFAMOUNT.AsFloat > 0 then
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(11));
    idDocType:=11;
    end
    else
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(10)) ;
    idDocType:=10;
    end;
    end else
     begin
    if  tblBatchFAMOUNT.AsFloat > 0 then
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(12));
    idDocType:=12;
    end
    else
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(13)) ;
    idDocType:=13;
    end;
    end ;

    afmInvoiceEntryGrid.ListIsReadOnly := true ;
    afmInvoiceEntryGrid.LookupFrom := 2 ;
    afmInvoiceEntryGrid.LookupAmount :=  -  tblBatchFAmount.AsFloat   ;
 

    if afmInvoiceEntryGrid.ShowModal = mrok then
     if afmInvoiceEntryGrid.QDocHeadWDOCID.AsString <> '' then
      begin
         cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 2 ;
          tblBatch.Edit ;
          tblBatchSCONTRAACCOUNT.AsString := DefaultAccount ;
          tblBatchWCONTRAACCOUNTID.AsInteger := DefaultAccountId ;
          tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(afmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ; ;
          tblBatchWAccountID.AsInteger := afmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;
          tblBatchWDOCID.AsInteger := afmInvoiceEntryGrid.QDocHeadWDOCID.AsInteger ;
         If  tblBatchSDescription.AsString = '' then
             tblBatchSDescription.AsString := trim(afmInvoiceEntryGrid.QDocHeadSDocNo.AsString +' ' + afmInvoiceEntryGrid.QDocHeadSReference.AsString) ;

          tblBatchBLinked.clear ;
          tblBatch.Post ;
      end;
    finally

    end;
end;


procedure TfmBatchEntryBank.Lookupcreditor1Click(Sender: TObject);
var
 fmDebtor: TfmDebtor;
begin
  if  tblBatch.IsEmpty then exit ;
    fmDebtor := TfmDebtor.Create(self);
      try
      fmDebtor.UseCreditor:= Lookupdebtor1 <> Sender ;
      fmDebtor.AsFindScreen(True) ;
      SetUpForm(fmDebtor);
      if fmDebtor.ShowModal <> mrok then exit ;
      if fmDebtor.QDebtorCreditor.IsEmpty then exit ;
 
      cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0 ;

      try
         tblBatch.Edit ;
        UnlinkLine( tblBatchWLINEID.AsInteger);
         tblBatchWAccountID.AsInteger := fmDebtor.QDebtorCreditorWAccountID.AsInteger ;
         tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString) ;
         tblBatch.Post ;
        finally
 
       end ;
      finally
      FreeAndNil(fmDebtor);
 
      end;
end;

procedure TfmBatchEntryBank.TranslateColumns;
begin
    cxGrid1DBBandedTableView1SREFERENCE.Caption := GetTextLang(607);
 cxGrid1DBBandedTableView1SDESCRIPTION.Caption :=  GetTextLang(178);

   cxGrid1DBBandedTableView1WACCOUNTID.Caption:=   GetTextLang(608);
   cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption:=   GetTextLang(379 );
cxGrid1DBBandedTableView1SJOBCODE.Caption :=  GetTextLang(3556);
 cxGrid1DBBandedTableView1WTAXID.Caption:=  GetTextLang(609);
 cxGrid1DBBandedTableView1FDEBIT.Caption :=  GetTextLang(181);
 cxGrid1DBBandedTableView1FCREDIT.Caption:= GetTextLang(1100);
 cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Caption:= TDataBaseRoutines.GetTypeDescription(1002);
 cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Caption:= TDataBaseRoutines.GetTypeDescription(1003);
 cxGrid1DBBandedTableView1WLINEID.Caption:=GetTextLang(1706);
 
   case AccountLookupType of
      2 : begin
           cxGrid1DBBandedTableView1WACCOUNTID.Caption:=   GetTextLang(31);
          end;
      3 : begin
            cxGrid1DBBandedTableView1WACCOUNTID.Caption :=   GetTextLang(30);
          end;
      end;
   case SubAccountLookUpType of

      2 : begin
            cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption :=   GetTextLang(31);
          end;
      3 : begin
            cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption :=   GetTextLang(30);
          end;
      end;

   if FindIndexOfName('FAMOUNT') <> -1 then
       cxGrid1DBBandedTableView1.Columns[FindIndexOfName('FAMOUNT')].Caption:=   GetTextLang(3047);

      Label3.Caption := cxGrid1DBBandedTableView1WACCOUNTID.Caption;
      LContraAccount.Caption :=  cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption ;
end;

procedure TfmBatchEntryBank.dbgridBatchTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
 if ( tblBatch.State in [dsedit,dsinsert]) then
     tblBatch.post ;
    
 if  tblBatch.FieldByName(AFieldName)  <> nil then
      begin
       if  tblBatch.IndexFieldNames <> AFieldName then
        tblBatch.IndexFieldNames := AFieldName else
        tblBatch.IndexFieldNames := AFieldName + ' desc' ;

     end;
end;

procedure TfmBatchEntryBank.AutoLinkBankAccounts;

begin

  cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 0 ;
   tblBatch.First ;
  while not  tblBatch.Eof do
  begin

    Updatebankaccount1Click(nil);
 
     tblBatch.Next ;
  end;
end;

procedure TfmBatchEntryBank.Autolinkbankaccounts1Click(Sender: TObject);
begin
if MessageDlg(DMTCCoreLink.GetTextLangNoAmp(642),mtConfirmation,mbOKCancel,0) = mrok then
   AutoLinkBankAccounts ;
end;

procedure TfmBatchEntryBank.DBLCBCostgroup1Exit(Sender: TObject);
begin
   (sender as tcontrol).Visible := false ;
end;

procedure TfmBatchEntryBank.DBLCBCostgroup1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_right then
   cxGrid1.SetFocus ;

if key = vk_left then
   cxGrid1.SetFocus ;

end;

procedure TfmBatchEntryBank.DBLCBCostgroup1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       cxGrid1.SetFocus ;
     end;
end;


procedure TfmBatchEntryBank.Createnewinvoice1Click(Sender: TObject);
 var
   BatchItems :String ;
   LinkAmount : Double ;
   Lineid : Integer ;

begin

  BatchItems := DMTCCoreLink.SQLList.ParamsList.Text ;
  if  tblBatch.IsEmpty then exit ;

  if  tblBatch.State = dsEdit then
      tblBatch.post ;
    BatchItems :=  tblBatch.TableName ;
     Lineid :=  tblBatchWLINEID.AsInteger ;
    idDocType:=10;
    if afmInvoiceEntryGrid = nil then
    afmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);

    afmInvoiceEntryGrid.AddInvoiceForAccount :=   tblBatchWACCOUNTID.AsInteger ;
    afmInvoiceEntryGrid.AddProjectForAccount :=  StrToIntDef( tblBatchSJOBCODE.asstring,0) ;
    if TDataBaseRoutines.GetAccountType( tblBatchWACCOUNTID.AsInteger) = 1 then
    begin

    if  tblBatchFAMOUNT.AsFloat > 0 then
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(11));
    idDocType:=11;
    end
    else
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(10)) ;
    idDocType:=10;
    end;
    end else
    begin

    if  tblBatchFAMOUNT.AsFloat > 0 then
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(12));
    idDocType:=12;
    end
    else
    begin
    afmInvoiceEntryGrid.cbDocTypenew.ItemIndex := afmInvoiceEntryGrid.cbDocTypenew.Items.IndexOfObject(TObject(13)) ;
    idDocType:=13;
    end;
    end;
    if Label9.Text = '' then

    afmInvoiceEntryGrid.MessageNewInvoice :=   tblBatchSDESCRIPTION.AsString + ' ' +  tblBatchFAMOUNT.AsString
    else
    afmInvoiceEntryGrid.MessageNewInvoice :=  Label9.Text + ' ' +  tblBatchFAMOUNT.AsString ;



    if afmInvoiceEntryGrid.ShowModal = mrok then
      begin
         if not  tblBatch.Active then
             tblBatch.TableName := BatchItems else
            if  tblBatch.TableName <> BatchItems then
              begin
                   tblBatch.Close ;
                   tblBatch.TableName := BatchItems ;
              end;


          tblBatch.open ;
          tblBatch.Locate('WLINEID', Lineid,[]);
          tblBatch.edit ;
          tblBatchWDOCID.AsInteger := afmInvoiceEntryGrid.LastDocHeaderId ;
      end;


end;

procedure TfmBatchEntryBank.PopupMenu1Popup(Sender: TObject);
var
 AaccType : Integer ;
begin
 Paymentdiverence1.Visible :=  tblBatchBLinked.AsInteger = 1 ;
 AaccType := TDataBaseRoutines.GetAccountType( tblBatchWACCOUNTID.AsInteger) ;

 Createnewinvoice1.Visible := (AaccType in [1,2]) ;

 if AaccType = 1 then
 Createnewinvoice1.Caption := DMTCCoreLink.GetTextLangNoAmp(174) + ' ' + DMTCCoreLink.GetTextLangNoAmp(165) +' / ' +  DMTCCoreLink.GetTextLangNoAmp(706)
 else
 if AaccType = 2 then
 Createnewinvoice1.Caption := DMTCCoreLink.GetTextLangNoAmp(174) + ' ' + DMTCCoreLink.GetTextLangNoAmp(302) +' / ' +  DMTCCoreLink.GetTextLangNoAmp(303) ;
 



 Gotodocument1.Visible :=  tblBatchWDOCID.AsInteger <> 0 ;
end;

 

procedure TfmBatchEntryBank.Gotodocument1Click(Sender: TObject);
  var
   BatchItems :String ;
   LinkAmount : Double ;

begin
  BatchItems := DMTCCoreLink.SQLList.ParamsList.Text ;
  if  tblBatch.IsEmpty then exit ;
    idDocType:=10;
    if afmInvoiceEntryGrid = nil then
    afmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    afmInvoiceEntryGrid.ListIsReadOnly := true ;
    afmInvoiceEntryGrid.LookupFrom := 1 ;
    afmInvoiceEntryGrid.GoToDocId :=   tblBatchWDOCID.AsInteger ;
    if afmInvoiceEntryGrid.ShowModal = mrok then
      begin
         DMTCCoreLink.SQLList.ParamsList.Text := BatchItems ;
         cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := 2 ;
          tblBatch.Edit ;
          tblBatchSCONTRAACCOUNT.AsString := DefaultAccount ;
          tblBatchWCONTRAACCOUNTID.AsInteger := DefaultAccountId ;
          tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(afmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ; ;
          tblBatchWAccountID.AsInteger := afmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;
          tblBatchWDOCID.AsInteger := afmInvoiceEntryGrid.QDocHeadWDOCID.AsInteger ;
         if  tblBatchFAmount.AsFloat = 0 then
            begin
            if afmInvoiceEntryGrid.QDocHeadOPENAMOUNT.AsFloat = 0 then
            LinkAmount := afmInvoiceEntryGrid.QDocHeadFDOCAMOUNT.AsFloat
            else
            LinkAmount := afmInvoiceEntryGrid.QDocHeadOPENAMOUNT.AsFloat ;

             if (idDocType in [10,13,14])then
             begin
              tblBatchFDEBIT.Asfloat := 0 ;
              tblBatchFCREDIT.Asfloat := abs(LinkAmount) ;
              tblBatchFAmount.AsFloat :=  -abs(LinkAmount) ;
             end else
             begin
              tblBatchFCREDIT.Asfloat := 0 ;
              tblBatchFDEBIT.Asfloat := abs(LinkAmount) ;
              tblBatchFAmount.AsFloat := abs(LinkAmount) ;
             end;

            end;
         If  tblBatchSDescription.AsString = '' then
             tblBatchSDescription.AsString := trim(afmInvoiceEntryGrid.QDocHeadSDocNo.AsString +' ' + afmInvoiceEntryGrid.QDocHeadSReference.AsString)
      end;
    finally

    end;
    CallLinks ;

end;


procedure TfmBatchEntryBank.MatchAutolinkofaccount;
var
 WasFiltered : Boolean ;
 AAccountId , i: integer ;
 MatchMask,MatchMask2,LineText,orgLineText,WDocid ,MatchText,EMailAdres,BankNr,FindDefAcc,ASql: String ;
begin


  ZQbankline.sql.text := 'Select * from  DNLBANKS where WBankID=' + IntToStr(DefaultAccountId) +
   ' and SReference = ' + QuotedStr( tblBatchSReference.asstring)+ '  and WLineID =' + IntToStr( tblBatchWLineID.asinteger) +' and WTCTRANSID is null ' ;
  ZQbankline.Open ;


  if trim(ZQbankline.fieldByName('SACCOUNTCODE').AsString) <> '' then
          begin
            
              //Select WaccountId from creditor where SBankAccountNumber = :Acc
              //Select WaccountId from debtor where SBankAccountNumber = :Acc
              // try to find the accounts
              QFindAccountOFDebtor.close ;
               if ZQbankline.fieldByName('WProfileID').AsInteger = 3 then
               begin
                if ZQbankline.fieldByName('FAmount').AsFloat > 0 then
                 QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from dochead where WTypeid in (10,14) and Sreference = :Acc'
                else
                QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from dochead where WTypeid in (11,15) and Sreference = :Acc' ;
                QFindAccountOFDebtor.Params[0].AsString := copy(trim(ZQbankline.fieldByName('SACCOUNTCODE').AsString),1,BankAccountLength) ;

               end else
              if ZQbankline.fieldByName('WProfileID').AsInteger = 0 then
              begin
                if ZQbankline.fieldByName('FAmount').AsFloat > 0 then
                 QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from debtor where SBankAccountNumber = :Acc'
                else
                QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from creditor where SBankAccountNumber = :Acc' ;
                QFindAccountOFDebtor.Params[0].AsString := copy(trim(ZQbankline.fieldByName('SACCOUNTCODE').AsString),1,BankAccountLength) ;
              end
              else
              begin
                QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from debtor where SEMail = :Acc' ;
                EMailAdres :=  ZQbankline.fieldByName('SDescription').AsString + ZQbankline.fieldByName('SMemo').AsString + ZQbankline.fieldByName('SEXTRADESCRIPTION').AsString;
                LineText := CopY(EMailAdres,1,pos(#13,EMailAdres)-1);
                delete(EMailAdres,1,pos(#13,EMailAdres));
                EMailAdres := copy( EMailAdres,1,EmailLength);
                QFindAccountOFDebtor.Params[0].AsString := trim(EMailAdres) ;
                if LineText <> '' then
                   tblBatchSDescription.AsString := LineText ;
              end;

              QFindAccountOFDebtor.Open ;
              if not QFindAccountOFDebtor.IsEmpty then
              begin
                 tblBatchSACCOUNT.AsString := AddDashInStdAccCode(GetAccountCode(QFindAccountOFDebtorWAccountID.AsInteger));
                 tblBatchWAccountID.AsInteger := QFindAccountOFDebtorWAccountID.AsInteger ;
              end
              else
              begin
                // look for creditor
                if ZQbankline.fieldByName('WProfileID').AsInteger = 0 then
                begin
                 if ZQbankline.fieldByName('FAmount').AsFloat > 0 then
                 QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from creditor where SBankAccountNumber = :Acc'
                else
                QFindAccountOFDebtor.SQL.Text := 'Select WaccountId from  debtor where SBankAccountNumber = :Acc' ;

                //   QFindAccountOFCREDITor.SQL.Text := 'Select WaccountId from creditor where SBankAccountNumber = :Acc';
                //   QFindAccountOFCREDITor.Params[0].AsString := copy(trim(CdsBankDnlSACCOUNTCODE.AsString),1,BankAccountLength) ;
                end
                else
                begin
                   QFindAccountOFCREDITor.SQL.Text := 'Select WaccountId from creditor where SEMail = :Acc' ;
                   EMailAdres :=  ZQbankline.fieldByName('SDescription').AsString + ZQbankline.fieldByName('SMemo').AsString + ZQbankline.fieldByName('SEXTRADESCRIPTION').AsString;
                   LineText := CopY(EMailAdres,1,pos(#13,EMailAdres)-1);
                   delete(EMailAdres,1,pos(#13,EMailAdres));
                   EMailAdres := copy( EMailAdres,1,EmailLength);
                   QFindAccountOFCREDITor.Params[0].AsString := trim(EMailAdres) ;
                   if LineText <> '' then
                      tblBatchSDescription.AsString := LineText ;
                end;
                QFindAccountOFCREDITor.open ;
                if not QFindAccountOFCREDITor.IsEmpty then
                begin
                   tblBatchSACCOUNT.AsString := AddDashInStdAccCode(GetAccountCode(QFindAccountOFCREDITorWAccountID.AsInteger));
                   tblBatchWAccountID.AsInteger := QFindAccountOFCREDITorWAccountID.AsInteger ;
                end  else
                begin
                  AAccountId := StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WaccountId from Accountref where Sreference =' + QuotedStr(ZQbankline.fieldByName('SACCOUNTCODE').AsString))) ,-1) ;
                  if AAccountId <> -1 then
                    begin
                       tblBatchSACCOUNT.AsString := AddDashInStdAccCode(GetAccountCode(AAccountId));
                       tblBatchWAccountID.AsInteger := AAccountId ;
                      // mark delete
                      if  copy(ZQbankline.fieldByName('SACCOUNTCODE').AsString,1,3) = '*@*' then
                        begin
                           TDataBaseRoutines.ExecSql('delete  from Accountref where WaccountId = '+ IntToStr(AAccountId) +'  and Sreference =' + QuotedStr(CdsBankDnlSACCOUNTCODE.AsString)) ;
                        end;
                    end else
                    begin

                    end;
                end;
              end;  
          end;
          QFindAccountOFCREDITor.close  ;
          QFindAccountOFDebtor.close  ;


 // do all refs with prefix # as instring;
  If  tblBatchWACCOUNTID.AsInteger = 0 then
      begin
            ZQBankRefs.first ;
            while not ZQBankRefs.Eof do
               begin
                if pos(uppercase(
                 copy(ZQBankRefs.Fields[0].AsString,2,ZQBankRefs.Fields[0].Size)),
                 uppercase(  tblBatch.fieldByName('SDescription').AsString +
                 ZQbankline.fieldByName('SDescription').AsString +
                 ZQbankline.fieldByName('SMemo').AsString +
                 ZQbankline.fieldByName('SEXTRADESCRIPTION').AsString + #13+#10 +
                 ZQbankline.fieldByName('SACCOUNTCODE').AsString
                 )) <> 0 then
                  begin
                     AAccountId := ZQBankRefs.Fields[1].AsInteger ;
                      tblBatchSACCOUNT.AsString := AddDashInStdAccCode(GetAccountCode(AAccountId));
                      tblBatchWAccountID.AsInteger := AAccountId ;
                     break ;
                  end;

                 ZQBankRefs.next ;
               end;
       end;
 // do all refs with prefix ! as instring;
  If  tblBatchWACCOUNTID.AsInteger = 0 then
      begin
            zqBankActions.first ;
            while not zqBankActions.Eof do
               begin
                ASql := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(zqBankActions.Fields[0].AsString,2,zqBankActions.Fields[0].Size)) ;
                if   dmDatabase.aeval.Identifiers.IndexOf('M.DATA') <> -1 then
                    dmDatabase.aeval.Identifiers.Delete( dmDatabase.aeval.Identifiers.IndexOf('M.DATA'));
                if   dmDatabase.aeval.Identifiers.IndexOf('M.AMT') <> -1 then
                    dmDatabase.aeval.Identifiers.Delete( dmDatabase.aeval.Identifiers.IndexOf('M.AMT'));
                if   dmDatabase.aeval.Identifiers.IndexOf('M.ACCNR') <> -1 then
                    dmDatabase.aeval.Identifiers.Delete( dmDatabase.aeval.Identifiers.IndexOf('M.ACCNR'));


                   dmDatabase.aeval.NewVariable('DATA',
                 uppercase(  tblBatch.fieldByName('SDescription').AsString +
                 ZQbankline.fieldByName('SDescription').AsString +
                 ZQbankline.fieldByName('SMemo').AsString +
                 ZQbankline.fieldByName('SEXTRADESCRIPTION').AsString)
                 );
                  dmDatabase.aeval.NewVariable('AMT',  tblBatchFAMOUNT.AsFloat );
                  dmDatabase.aeval.NewVariable('ACCNR', ZQbankline.fieldByName('SACCOUNTCODE').AsString );
                  dmDatabase.aeval.Expression := ASql ;
                 try
                  dmDatabase.aeval.Evaluate ;
                 except
                    on e : Exception do
                      OSFMessageDlg(zqBankActions.Fields[0].AsString +' ' + TDataBaseRoutines.GetAccountCode(zqBankActions.Fields[0].AsInteger) + ' has a error!' + #13+#10+ e.Message,mtError,[mbok],0);
                 end;
                 AAccountId := StrToIntDef(VarToStr(  dmDatabase.aeval.EvalResult),0);

                 if AAccountId <> 0 then
                  begin

                      tblBatchSACCOUNT.AsString := AddDashInStdAccCode(GetAccountCode(AAccountId));
                      tblBatchWAccountID.AsInteger := AAccountId ;
                     break ;
                  end;

                 zqBankActions.next ;
               end;
       end;


  If  tblBatchWACCOUNTID.AsInteger <> 0 then
           if FindIndexOfName( tblBatchSTAX.FieldName) <> -1 then
             begin
                  FindDefAcc := vartostr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WTAXACCOUNT from account where WAccountid = ' + IntToStr( tblBatchWACCOUNTID.AsInteger)));

                  if StrToIntDef(FindDefAcc,0) <> 0 then
                    begin
                        tblBatchWTAXID.AsInteger := StrToIntDef(FindDefAcc,0);
                        tblBatchSTAX.AsString := AddDashInStdAccCode(getaccountCode( tblBatchWTAXID.AsInteger)) ;
                       if  tblBatchBEXCLUSIVE.AsInteger = 1 then
                           tblBatchBEXCLUSIVE.AsInteger := 0 ;

                       if  tblBatchFDEBIT.AsFloat <> 0 then
                           tblBatchFDEBIT.AsFloat :=  tblBatchFDEBIT.AsFloat / TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) ;
                       if  tblBatchFCREDIT.AsFloat <> 0 then
                           tblBatchFCREDIT.AsFloat :=  tblBatchFCREDIT.AsFloat / TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) ;
                    end  ;
             end;


          if DMTCCoreLink.ExtraOptions.IndexOf('MATCHIDEAL') = -1 then
            DMTCCoreLink.ExtraOptions.Values['MATCHIDEAL'] :=  BoolToStr(DMTCCoreLink.ReadSysParam('MATCHIDEAL',false,0),True);


          if  tblBatchWACCOUNTID.AsInteger = 0 then
             begin

               If DMTCCoreLink.ExtraOptions.Values['MATCHIDEAL'] = 'True' then
                 begin
                    if MatchMask = '' then
                       begin
                       MatchMask := DMTCCoreLink.ReadSysParam('MATCHMASK','',0) ;
                       MatchMask2 := DMTCCoreLink.ReadSysParam('MATCHMASK2','',0) ;
                       end;

                    if MatchText = '' then
                       MatchText := DMTCCoreLink.ReadSysParam('MATCHTEXT','BETALING:',0) ;

                  Label9.Text := 'Matching on ' + MatchText  + ' with  '+  MatchMask ;

                     dmDatabase.tblBankDnl.sql.text := 'Select * from  DNLBANKS where WBankID=' + IntToStr(DefaultAccountId) +
                     ' and SReference = ' + QuotedStr( tblBatchSReference.asstring)+ '  and WLineID =' + IntToStr( tblBatchWLineID.asinteger) +' and WTCTRANSID is null ' ;
                      dmDatabase.tblBankDnl.open ;
                      if not  dmDatabase.tblBankDnl.IsEmpty then
                         begin
                            LineText :=  dmDatabase.tblBankDnlSDescription.AsString +  dmDatabase.tblBankDnlSMemo.AsString +  dmDatabase.tblBankDnlSEXTRADESCRIPTION.AsString ;
                            if pos(MatchText,LineText) > 0 then
                                begin
                                    delete(LineText,1,pos(MatchText,LineText) + length(MatchText)-1) ;
                                     i := 1 ;
                                     orgLineText := '' ;
                                     while ((LineText[i] in [' ',#13,#10]) and (i <= Length(LineText))) do
                                       inc(i) ;

                                     while ((LineText[i] in ['0','1','2','3','4','5','6','7','8','9']) and (i <= Length(LineText))) do
                                      begin
                                       orgLineText := orgLineText + LineText[i] ;
                                       inc(i);
                                      end;
                                     LineText := orgLineText;


                                   if StrToIntDef(LineText,0) <> 0 then
                                      begin



                                         LineText := FormatFloat(MatchMask,StrToIntDef(LineText,0));
                                         Label9.Text := 'Match on ' + MatchText  + ' with  '+  LineText ;
                                         Label9.Repaint ;
                                         WDocid := LineText ;
                                         if MatchMask2 = '#' then
                                            begin
                                               LineText := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select a.WAccountid from transact a join account b on (a.Waccountid = b.Waccountid and b.waccountTypeID = 1) where a.SReference = ' + QuotedStr(LineText) )) ;
                                               if StrToIntDef(LineText,0) <> 0 then
                                                  begin
                                                     tblBatch.edit ;
                                                     tblBatchWACCOUNTID.AsInteger := StrToIntDef(LineText,0) ;
                                                     tblBatchSACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode( tblBatchWACCOUNTID.AsInteger));
                                                  end;
                                            end else
                                                  begin
                                               LineText := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WAccountid from dochead where SReference = ' + QuotedStr(LineText) )) ;
                                               WDocid :=VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDocid from dochead where SReference = ' + QuotedStr(WDocid) )) ;

                                               if StrToIntDef(LineText,0) <> 0 then
                                                  begin
                                                     tblBatch.edit ;
                                                     tblBatchWACCOUNTID.AsInteger := StrToIntDef(LineText,0) ;

                                                     tblBatchWDOCID.AsInteger := StrToIntDef(WDocid,0) ;
                                                     tblBatchSACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode( tblBatchWACCOUNTID.AsInteger));
                                                   //  tblBatch.post ;

                                                  end else
                                                  if MatchMask2 <> '' then
                                                  begin
                                                   LineText := orgLineText ;
                                                   LineText := FormatFloat(MatchMask2,StrToIntDef(LineText,0));
                                                   WDocid := LineText ;
                                                   LineText := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WAccountid from dochead where SReference = ' + QuotedStr(LineText) )) ;
                                                   WDocid :=VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDocid from dochead where SReference = ' + QuotedStr(WDocid) )) ;
                                                   if StrToIntDef(LineText,0) <> 0 then
                                                      begin
                                                         tblBatch.edit ;
                                                         tblBatchWACCOUNTID.AsInteger := StrToIntDef(LineText,0) ;

                                                         tblBatchWDOCID.AsInteger := StrToIntDef(WDocid,0) ;
                                                         tblBatchSACCOUNT.AsString := TDataBaseRoutines.AddDashInStdAccCode(TDataBaseRoutines.GetAccountCode( tblBatchWACCOUNTID.AsInteger));
                                                       //  tblBatch.post ;

                                                      end  ;
                                                end;
                                            end;

                                      end;
                                end;
                         end;
                 end;
             end;


          if  tblBatchWACCOUNTID.AsInteger <> 0 then
             begin
              If DMTCCoreLink.ExtraOptions.Values['MATCHIDEAL'] = 'True' then
                  if MatchMask2 = '#' then
                   exit ;
               BatLinkedID :=  tblBatchWlineID.AsInteger;
               //
               ItemLiked := false ;
               CanRunOpenItem( tblBatchSReference.AsString, TblbatchDDate.AsDateTime , TblbatchWAccountID.asInteger,BatchCtrlID, dmDatabase.OpenItemRequest,- ZQbankline.fieldByName('FAmount').AsFloat,BatLinkedID,true, tblBatchSDESCRIPTION.AsString) ;
               if ItemLiked then
               begin
                tblBatchBLinked.Value := ord(ItemLiked);
               end;

             end;
end;

procedure TfmBatchEntryBank.Autolinkofall1Click(Sender: TObject);
var
 WasFiltered : Boolean ;
begin
  if ( tblBatch.State in [dsEdit,dsInsert]) then
        tblBatch.post ;

   tblBatch.DisableControls ;
  try
   ZQBankRefs.close;
   zqBankActions.Close;
   ZQBankRefs.open;
   zqBankActions.open;

  WasFiltered :=  tblBatch.Filtered  ;
   tblBatch.Filtered := false ;
   tblBatch.first ;
  while not  tblBatch.Eof do
    begin
       if  tblBatchWACCOUNTID.AsInteger = 0 then
          begin
             tblBatch.edit ;
             MatchAutolinkofaccount ;
             Application.ProcessMessages;
          if   tblBatch.State <> dsbrowse then
              tblBatch.post ;
         end else
         begin
            if  tblBatchBLINKED.AsInteger = 0 then
             begin
                tblBatch.Edit ;
               BatLinkedID :=  tblBatchWlineID.AsInteger;
               //
               ItemLiked := false ;
               CanRunOpenItem( tblBatchSReference.AsString, TblbatchDDate.AsDateTime , TblbatchWAccountID.asInteger,BatchCtrlID, dmDatabase.OpenItemRequest,  tblBatch.fieldByName('FAmount').AsFloat,BatLinkedID,true, tblBatchSDESCRIPTION.AsString) ;
               if ItemLiked then
               begin
                  tblBatchBLinked.Value := ord(ItemLiked);
               end;
             end;
         end;
       tblBatch.Next ;
   end;
  finally
     tblBatch.Filtered := WasFiltered ;
     tblBatch.enableControls ;
  end;
end;

procedure TfmBatchEntryBank.ZQProjectsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
 if Usefilter1.Checked then
        begin
          if look <> '' then
          begin
            Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0 ;
            If not Accept then
            Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SJOBPROJECTCODE').AsString)) <> 0 ;
          end
          else
          Accept := true ;
        end;
end;

procedure TfmBatchEntryBank.ZQCostgroup1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
  var
   Nesteld : Integer ;
begin
 if Usefilter1.Checked then
        begin
        Nesteld := 0 ;
          if look <> '' then
          begin

            Accept := pos(uppercase(look),uppercase(TDataBaseRoutines.GetNesteldNameFromGroupID(DataSet.FieldByName('WGROUPID').AsInteger,Nesteld))) <> 0 ;
            If not Accept then
            Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('WGROUPID').AsString)) <> 0 ;
          end
          else
          Accept := true ;
        end;
end;
procedure TfmBatchEntryBank.Showrefsforaccount1Click(Sender: TObject);
begin
 if  tblBatchWACCOUNTID.AsInteger = 0 then exit ;


 fmEditAccountRef:= TfmEditAccountRef.create(self) ;
 try
   fmEditAccountRef.Init( tblBatchWACCOUNTID.AsInteger);
   fmEditAccountRef.ShowModal ;
 finally
   FreeAndNil(fmEditAccountRef);

 end;

end;

procedure TfmBatchEntryBank.LookupTransactionsClick(Sender: TObject);
var
 Value : Double ;
 Linked : Boolean ;
begin
 InLinkCall := true ;
 if ( tblBatch.state in [dsedit,dsinsert]) then
       tblBatch.Post ;

 // tblBatch.DisableControls ;
 try
      Value := RoundAmount( tblBatchFDEBIT.Value -  tblBatchFCREDIT.Value);
      { Bugs : OpenItem Screen not showing for dt-debtor or Ct-Creditor
       Value should keep the sign and this will be remove in CanRunOpenItem}

        BatLinkedID :=  tblBatchWlineID.AsInteger;
        // Unlink line if exists
        UnlinkLine(BatLinkedID);
        //
        Linked := Not CanRunOpenItem( tblBatchSReference.AsString, TblbatchDDate.AsDateTime , TblbatchWAccountID.asInteger,BatchCtrlID, dmDatabase.OpenItemRequest,Value,BatLinkedID,false, tblBatchSDESCRIPTION.AsString,true ) ;
        if OpenItemAllocatedAmount <> 0 then
            begin
               if OpenItemAllocatedAmount < 0 then
                  begin
                     tblBatch.Edit ;
                     tblBatchFAMOUNT.AsFloat := abs( OpenItemAllocatedAmount) ;
                     tblBatchFDEBIT.AsFloat := abs(OpenItemAllocatedAmount);
                     tblBatchFCREDIT.AsFloat := 0;
                     dmDatabase.ExcOldValue := abs(OpenItemAllocatedAmount) ;
                     tblBatch.post ;
                    ShowLinkForThisLine := false ;
                  end else
                   begin
                     tblBatch.Edit ;
                     tblBatchFAMOUNT.AsFloat := - abs(OpenItemAllocatedAmount) ;
                     dmDatabase.ExcOldValue :=  abs(OpenItemAllocatedAmount) ;
                     tblBatchFCREDIT.AsFloat := abs(OpenItemAllocatedAmount);
                     tblBatchFDEBIT.AsFloat := 0;
                     tblBatch.post ;
                    ShowLinkForThisLine := false ;
                  end ;

            end;
         tblBatch.edit ;
         tblBatchBLinked.Value := ord(ItemLiked);
         tblBatch.Post ;
        ShowLinkForThisLine := false ;

   Application.ProcessMessages ;
   finally
   //   tblBatch.EnableControls ;
     InLinkCall := false ;
   end;
end;

procedure TfmBatchEntryBank.PageControl1Change(Sender: TObject);
 var
 aFormReverseBatch : TFormReverseBatch ;
begin
 if PageControl1.ActivePageIndex =1 then
  begin
   if  PageControl1.ActivePage.Tag = 0 then
   begin
     aFormReverseBatch := TFormReverseBatch.Create(PageControl1.ActivePage) ;
     aFormReverseBatch.BitBtn1.Visible := false ;
     aFormReverseBatch.BitBtn2.Visible := false ;
     aFormReverseBatch.Panel1.Visible := False ;
     aFormReverseBatch.TSDocuments.TabVisible := false ;
     aFormReverseBatch.ID.Visible := false ;
     aFormReverseBatch.Button1.Visible := false ;
     aFormReverseBatch.BReDoAll.Visible := false ;
     aFormReverseBatch.CBNoDocPosts.Checked := false ;
     aFormReverseBatch.CBNoDocPosts.Visible := false ;
     aFormReverseBatch.EFindId.Visible := false ;
     aFormReverseBatch.BDeleteBatch.Visible := false ;
     aFormReverseBatch.cxDetailsDBTableView1SCONTRAACCOUNT.Visible := false ;
     aFormReverseBatch.cxDetailsDBTableView1SCONTRAACCOUNT.VisibleForCustomization := False ;
     aFormReverseBatch.BatchListAndClause := '  and BatCon.WBatchTypeId = '  +  IntToStr( dmDatabase.BatchType);
     aFormReverseBatch.BorderStyle := bsNone ;
     aFormReverseBatch.Parent := PageControl1.ActivePage ;
     aFormReverseBatch.Position := poDesigned   ;
     aFormReverseBatch.Show ;
     aFormReverseBatch.Align := alClient ;
     PageControl1.ActivePage.Tag := Integer(aFormReverseBatch);
  end else
  begin
    TFormReverseBatch(PageControl1.ActivePage.Tag).QBatCon.close ;
    TFormReverseBatch(PageControl1.ActivePage.Tag).QBatCon.Open ;
  end;

  end;

end;


procedure TfmBatchEntryBank.Paymentdiverence1Click(Sender: TObject);
var
 Value : Double ;
 Linked : Boolean ;
 AAcc : TAccountRec ;
 localOpenItemAllocatedAmount  : Real ;

begin

   dmDatabase.ZQOILinks.Filter := '' ;
   dmDatabase.ZQOILinks.SQL.Text := 'Select OILinks.*,Messages.* from OILinks  join transact on OILinks.WAmountTransactionID = ' +
  ' transact.WtransactionID join messages on (transact.WDescriptionId = Messages.WMessageId)  ' +
  ' where OILinks.WBatchID = :WBatchID and '+
  ' OILinks.WLinkTransactionID =:WLinkTransactionID';
 //  ZQOILinks.ParamByName('WAccountID').AsInteger :=   aWAccountID ;
   dmDatabase.ZQOILinks.ParamByName('WBatchID').AsInteger :=     BatchCtrlID ;
   dmDatabase.ZQOILinks.ParamByName('WLinkTransactionID').AsInteger :=  tblBatchWlineID.AsInteger;
   dmDatabase.ZQOILinks.open ;
  localOpenItemAllocatedAmount :=    ( tblBatchFAMOUNT.AsFloat +  dmDatabase.ZQOILinksWLINKEDAMOUNT.AsFloat) ;
  if localOpenItemAllocatedAmount  = 0 then
   localOpenItemAllocatedAmount :=  TDataBaseLedgerRoutines.GetopenItemAmountOnTransact( dmDatabase.ZQOILinksWAMOUNTTRANSACTIONID.AsInteger);




  cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex :=0;
 if ( tblBatch.state in [dsedit,dsinsert]) then
       tblBatch.Post ;
  InLinkCall := true ;
 try

        if localOpenItemAllocatedAmount <> 0 then
            begin
              AAcc.WAccountID :=  tblBatchWACCOUNTID.AsInteger ;
              AAcc.SACCOUNTCODE := TDataBaseRoutines.GetAccountCode(AAcc.WAccountID) ;
              AAcc.SDescription := TDataBaseRoutines.GetAccountDescription(AAcc.WAccountID) ;
              AutoReceivePymt(AAcc,0,'PAYDIV',localOpenItemAllocatedAmount) ;
            end;

   finally

     InLinkCall := false ;
   end;
end;

procedure TfmBatchEntryBank.Openitem1Click(Sender: TObject);
begin
  fmOpenLink := TfmOpenLink.Create(self);
  try
   fmOpenLink.bFrombatch := True ;
   fmOpenLink.GotoAccount :=  tblBatchWACCOUNTID.AsInteger ;
   fmOpenLink.ShowModal ;
   if fmOpenLink.GotoAccount = 0 then
     if fmOpenLink.ZQAccountListWACCOUNTID.AsInteger <> 0 then
       begin
          tblBatch.edit ;
          tblBatchWACCOUNTID.AsInteger := fmOpenLink.ZQAccountListWACCOUNTID.AsInteger ;
          tblbatchSACCOUNT.Value:=  TDataBaseRoutines.AddDashInAccCode(TDataBaseRoutines.GetAccountCode( tblBatchWACCOUNTID.AsInteger),true);
          tblBatch.post;
       end;
  finally
   fmOpenLink.free ;
  end;
end;
procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

begin
  ACanvas.Font.Style := [] ;
  begin
    if AViewInfo.Item = cxGrid1DBBandedTableView1SREFERENCE  then begin
      if VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BRECONCILED.Index])='1' then
       ACanvas.Font.Color:=clBlue;
    end
    else if  (AViewInfo.Item = cxGrid1DBBandedTableView1FDEBIT) or (AViewInfo.Item = cxGrid1DBBandedTableView1FCREDIT) then begin
    if tlbtnIncl.Visible then
      if VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BEXCLUSIVE.Index])='1' then
        ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
    end;
    if VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BLINKED.Index])='1' then
        begin
         // some monitors do not show the color diverence.
         // so i made it more darker.
          if (AViewInfo.Selected) then
          begin
          // if selected we need to turn it around so its still visible.
          ACanvas.Brush.Color:=clBlack;
          ACanvas.Font.Color := $00B3EAFF ;
          end else
          begin
          ACanvas.Brush.Color:=$00B3EAFF;
          ACanvas.Font.Color := clBlack ;
          end;
        end;
  end;
  if (VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WLINEID.Index]) <> VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WLINKEDID.Index])) then
    begin
      if (AViewInfo.Selected ) then
      begin
      ACanvas.Brush.Color:=clBlack;
      ACanvas.Font.Color := $0042A0FF ;
      end else
      begin
      ACanvas.Brush.Color:=$0042A0FF;
      ACanvas.Font.Color := clBlack ;
      end;
    end;


 if AViewInfo.Item = cxGrid1DBBandedTableView1WACCOUNTID  then
     if StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WDOCID.Index]),0) <> 0 then

    begin
      if (not AViewInfo.Selected ) then
      begin
      ACanvas.Brush.Color:=clNavy;
      ACanvas.Font.Color := clWhite ;
      end;
    end;
 if AViewInfo.Item = cxGrid1DBBandedTableView1WTAXID  then
     if StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WACCOUNTID.Index]),0) <> 0 then
        if (TDataBaseRoutines.GetAccountType( StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1WACCOUNTID.Index]),0)) in [1,2,3,4]) then
       begin
        ACanvas.Brush.Color:=clRed;
        ACanvas.Font.Color :=clWhite ;

       end;


end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
 aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;

 if  ShowLinkForThisLine then
   if tblBatchBLinked.IsNull then
   begin
   CallLinks ;
   ShowLinkForThisLine := False ;
   end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if  tblbatch.State=DsInactive then exit;
  if  tblBatch.IsEmpty then exit ;
  if CdsBankDnl.Active then exit ;
  aLookupgrid.lookAccount := '' ;
  aLookupgrid.lookGroup1 := '' ;
  aLookupgrid.lookContra := '' ;
  aLookupgrid.lookGroup2 := '' ;
  aLookupgrid.lookjob := '' ;
  aLookupgrid.lookTax := '' ;
  lFind.Caption := '' ;
  ShowLinkForThisLine := True ;
  Label9.Text :=  '' ;


  if AFocusedRecord <> nil then
  begin
  ZQbankline.sql.text := 'Select * from  DNLBANKS where WBankID=' + IntToStr(DefaultAccountId) +
   ' and SReference = ' + QuotedStr( varToStr(AFocusedRecord.Values[cxGrid1DBBandedTableView1SREFERENCE.Index]))+ '  and WLineID =' + IntToStr( StrToIntDef(varToStr(AFocusedRecord.Values[cxGrid1DBBandedTableView1WLINEID.Index]),0)) +' and WTCTRANSID is null ' ;
  ZQbankline.Open ;
  if not ZQbankline.IsEmpty then
     begin
        Label9.Text :=   ZQbankline.fieldByName('SDescription').AsString + ZQbankline.fieldByName('SMemo').AsString + ZQbankline.fieldByName('SEXTRADESCRIPTION').AsString + #13+#10 + IfThen(ZQbankline.fieldByName('SACCOUNTCODE').AsString='','',DMTCCoreLink.GetTextLang(2211) +  ' ' + ZQbankline.fieldByName('SACCOUNTCODE').AsString);
     end;
  ZQbankline.Close ;
  end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
 Sub : String ;
begin
if key = vk_return then
 if ( tblBatch.State in [dsedit,dsInsert]) then
   if cxGrid1DBBandedTableView1SDESCRIPTION.Focused then
        if Length( tblBatchSDESCRIPTION.AsString) < 11 then
        begin
         sub :=  TDataBaseLedgerRoutines.GetAbreviat( tblBatchSDESCRIPTION.AsString) ;
         if Sub <> '' then
           begin
               tblBatchSDESCRIPTION.AsString := Sub;
           if cxGrid1DBBandedTableView1SDESCRIPTION.Editing then
             cxGrid1DBBandedTableView1SDESCRIPTION.EditValue :=  tblBatchSDESCRIPTION.AsString ;
           end;
         end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1EditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);

 var
  Apoint : TPoint;
begin
 if cxGrid1DBBandedTableView1FCREDIT.Focused then
   if Key = '.' then key := DecimalSeparator ;
 if cxGrid1DBBandedTableView1FDEBIT.Focused then
   if Key = '.' then key := DecimalSeparator ;

 if cxGrid1DBBandedTableView1WACCOUNTID.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookAccount := copy(aLookupgrid.lookAccount,1,length(aLookupgrid.lookAccount)-1)
   else
   aLookupgrid.lookAccount := aLookupgrid.lookAccount + Key ;

   lFind.Caption := aLookupgrid.lookAccount ;
  end else
   if cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookContra := copy(aLookupgrid.lookContra,1,length(aLookupgrid.lookContra)-1)
   else
   aLookupgrid.lookContra := aLookupgrid.lookContra + Key ;

   lFind.Caption := aLookupgrid.lookContra ;
  end else
   if cxGrid1DBBandedTableView1WTAXID.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookTax := copy(aLookupgrid.lookTax,1,length(aLookupgrid.lookTax)-1)
   else
   aLookupgrid.lookTax := aLookupgrid.lookTax + Key ;

   lFind.Caption := aLookupgrid.lookTax ;
  end else
   if cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookGroup1 := copy(aLookupgrid.lookGroup1,1,length(aLookupgrid.lookGroup1)-1)
   else
   aLookupgrid.lookGroup1 := aLookupgrid.lookGroup1 + Key ;

   lFind.Caption := aLookupgrid.lookGroup1 ;
  end else
   if cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookGroup2 := copy(aLookupgrid.lookGroup2,1,length(aLookupgrid.lookGroup2)-1)
   else
   aLookupgrid.lookGroup2 := aLookupgrid.lookGroup2 + Key ;

   lFind.Caption := aLookupgrid.lookTax ;
  end else
   if cxGrid1DBBandedTableView1SJOBCODE.Focused then
  begin
   if Key = #8 then
    aLookupgrid.lookjob := copy(aLookupgrid.lookjob,1,length(aLookupgrid.lookjob)-1)
   else
   aLookupgrid.lookjob := aLookupgrid.lookjob + Key ;

   lFind.Caption := aLookupgrid.lookjob ;
  end else
  lFind.Caption := '';

  Apoint := Mouse.CursorPos ;
  if Odd(Apoint.X)  then
     Apoint.X := Apoint.X +1
     else
     Apoint.X := Apoint.X -1;
  Mouse.CursorPos := Apoint;

end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
 if InLinkCall then exit ;
 InLinkCall := true ;
 try

 // Force Open item selection
 if ( tblBatch.State in [dsedit,dsinsert]) then
   begin
      tblBatch.post ;
   end;
 if not  tblBatch.IsEmpty then

 CallLinks ;
 ShowLinkForThisLine := false ;
 
  
   finally
     InLinkCall := false ;
  end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
 AAllow :=  tblBatchWLINEID.AsInteger =  tblBatchWLINKEDID.AsInteger ;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1EditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
 var
   Account : Integer ;
   aAmt : Double ;
   aAccountRec: TAccountRec ;
begin


 if  (AItem = cxGrid1DBBandedTableView1WTAXID)   then
     begin
       tblBatch.Edit ;
      if DMTCCoreLink.AccObject.getAccountType(tblBatchWACCOUNTID.AsInteger) <> 0 then
         tblBatchWTAXID.AsInteger := 0 ;
        aAmt :=  tblBatchFAMOUNT.AsFloat;

        if ( tblBatchBEXCLUSIVE.AsInteger = 1) then
         begin
        if aAmt > 0 then
            tblBatchFDEBIT.AsFloat := aAmt * TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger)
          else
          tblBatchFCREDIT.AsFloat := (-aAmt) * TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) ;
         end else
         begin
          if aAmt > 0 then
            tblBatchFDEBIT.AsFloat := aAmt
          else
          tblBatchFCREDIT.AsFloat := (-aAmt)   ;
         end;
     end  ;




 aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;
 GetRefTotals ;

end;


procedure TfmBatchEntryBank.GetRefTotals;
 var
   i : Integer ;
   aTotal,AGenTotal :  Double ;
begin
 if  tblBatch.ControlsDisabled then exit ;
 if  tblBatchWLINEID.AsInteger =  tblBatchWLINKEDID.AsInteger then
  begin
  aTotal := 0 ;
  AGenTotal  := 0 ;
    for i := 0 to cxGrid1DBBandedTableView1.ViewData.RowCount -1 do
      begin
        if  VarToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1SREFERENCE.Index] ) =  tblBatchSREFERENCE.AsString then
          if varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINEID.Index] ) = varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINKEDID.Index] ) then
           begin
           if varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1BEXCLUSIVE.Index] ) ='1' then
           aTotal :=  aTotal + ( StrToFloatDef(VarToStr(varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1FAMOUNT.Index] )),0) * DMTCCoreLink.AccObject.GetTaxRateOnId(StrToIntDef(
              varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WTAXID.Index] )
           ,0)) )
               else
           aTotal :=  aTotal + StrToFloatDef(VarToStr(varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1FAMOUNT.Index] )),0) ;

           end;
          if varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINEID.Index] ) = varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINKEDID.Index] ) then
           begin
           if varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1BEXCLUSIVE.Index] ) ='1' then
           AGenTotal :=  AGenTotal + ( StrToFloatDef(VarToStr(varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1FAMOUNT.Index] )),0) * DMTCCoreLink.AccObject.GetTaxRateOnId(StrToIntDef(
              varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WTAXID.Index] )
           ,0)) )
               else
           AGenTotal :=  AGenTotal + StrToFloatDef(VarToStr(varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1FAMOUNT.Index] )),0) ;

           end;



      end;
 LRefTotal.Caption := FloatToStrF( aTotal, ffCurrency, 18, 2);
 if TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) <> 1 then
    begin
      if ( tblBatchBEXCLUSIVE.AsInteger = 1 )then
         begin
            if IsCashBook = 0 then
               begin
                 lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2) ;
                 LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat *  TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger ) , ffCurrency, 18, 2);
               end  else
               begin
                 lExclAmount.Caption := FloatToStrF(   tblBatchFAMOUNT.AsFloat /  TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) , ffCurrency, 18, 2);
                 LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
               end;
         end else
         begin
          if IsCashBook = 1 then
           begin
                 lExclAmount.Caption := FloatToStrF(   tblBatchFAMOUNT.AsFloat /  TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) , ffCurrency, 18, 2);
                 LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
          end else
           begin
              lExclAmount.Caption := FloatToStrF(   tblBatchFAMOUNT.AsFloat/  TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger)  , ffCurrency, 18, 2) ;
              LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
           end;
         end;
    end else
    begin
    lExclAmount.Caption := FloatToStrF(   tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    end;

      LDiverence.Caption := formatfloat( tblBatchFDEBIT.DisplayFormat,EnterdStamentAmount-(LastTCBankAmount-AGenTotal));

   lAlocatedTo.Caption := TDataBaseRoutines.GetAccountFullDescription( tblBatchWACCOUNTID.AsInteger) ;
   Lcontraaccountcode.Caption := TDataBaseRoutines.GetAccountFullDescription( tblBatchWCONTRAACCOUNTID.AsInteger) ;
    LRefTotal.Caption := FloatToStrF( aTotal, ffCurrency, 18, 2);
    AdjIncExcBtn( tblBatchBExclusive.AsInteger = 1);
  end else
  begin
    AdjIncExcBtn(false);
    lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    LIncAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    lAlocatedTo.Caption := TDataBaseRoutines.GetAccountFullDescription( tblBatchWACCOUNTID.AsInteger) ;
    Lcontraaccountcode.Caption := '' ;
    LRefTotal.Caption := '';

  end;
end;


procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1InitEditValue(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var AValue: Variant);
begin
 if AItem = cxGrid1DBBandedTableView1FDEBIT then
     begin
       if  tblBatchFAMOUNT.AsFloat > 0 then
         AValue :=   tblBatchFAMOUNT.AsFloat
     end else
  if AItem = cxGrid1DBBandedTableView1FCREDIT then
     begin
       if  tblBatchFAMOUNT.AsFloat < 0 then
         AValue :=  - tblBatchFAMOUNT.AsFloat
     end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if dmDatabase.DoAutoInc then
    writereportop(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  +'AutoIncNr', varToStr(DisplayValue));

end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1FDEBITPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if cxGrid1DBBandedTableView1FDEBIT.Focused then
     begin

         tblBatchFAMOUNT.AsFloat := StrToFloatDef(VarToStr(DisplayValue),0);
     end else
  if cxGrid1DBBandedTableView1FCREDIT.Focused then
     begin

         tblBatchFAMOUNT.AsFloat := - StrToFloatDef(VarToStr(DisplayValue),0);
     end;
//  if  tblBatchBEXCLUSIVE.AsInteger = 1 then
//      tblBatchFAMOUNT.AsFloat := tblBatchFAMOUNT.AsFloat * TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger) ;


if   tblBatchFAMOUNT.AsFloat < 0 then
     begin
        tblBatchFDEBIT.AsFloat := 0 ;
        if  tblBatchBEXCLUSIVE.AsInteger = 0 then
        tblBatchFCREDIT.AsFloat := (-  tblBatchFAMOUNT.AsFloat) / TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger)
       else
        tblBatchFCREDIT.AsFloat := -  tblBatchFAMOUNT.AsFloat ;
     end else
     begin
        tblBatchFCREDIT.AsFloat := 0 ;
        if  tblBatchBEXCLUSIVE.AsInteger = 0 then
         tblBatchFDEBIT.AsFloat :=  tblBatchFAMOUNT.AsFloat / TDataBaseRoutines.GetTaxRateOnId( tblBatchWTAXID.AsInteger)
        else
        tblBatchFDEBIT.AsFloat :=  tblBatchFAMOUNT.AsFloat ;
     end;    
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1WACCOUNTIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if (VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINEID.Index]) <> VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINKEDID.Index])) then
   begin
      if (VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WACCOUNTID.Index]) = VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Index])) then
           AText :=  VarToStr(ARecord.DisplayTexts[cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Index]) else
           AText :=  DMTCCoreLink.AccObject.getAccountCodeWithDash(StrToIntDef(VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WACCOUNTID.Index]),0)) ;
   end;
end;

procedure TfmBatchEntryBank.cxGrid1DBBandedTableView1WTAXIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if (VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINEID.Index]) <> VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINKEDID.Index])) then
    AText :=  DMTCCoreLink.GetTextLang(2142);
end;

procedure TfmBatchEntryBank.cxGridDBBandedTableView1FocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
    aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;

 if  ShowLinkForThisLine then
  if tblBatchBLinked.IsNull then
   begin
   CallLinks ;
   ShowLinkForThisLine := False ;
   end;
end;

end.



