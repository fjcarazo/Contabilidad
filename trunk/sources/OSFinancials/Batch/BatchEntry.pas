(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchEntry;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Buttons, StdCtrls,  ComCtrls, ToolWin,
   DB, Mask, Menus,
   DBAccess , Uni,   UDMCoreData,
  DBCtrls ,UosfResources,TcashClasses,UPluginsSharedUnit, MemDS,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxDBExtLookupComboBox, cxGridDBTableView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid,ULookupGrids, cxCalendar,
  cxCalc, cxCurrencyEdit, cxDropDownEdit, cxContainer, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxButtonEdit;
 type

  TfmBatchEntry = class(TForm)
    ImportDialog: TOpenDialog;
    ExportDialog: TSaveDialog;
    xTblRpBatch: TUniTable;
    PopupMenu2: TPopupMenu;
    Lookupdocument1: TMenuItem;
    Lookupdocwithammount1: TMenuItem;
    Lookupdebtor1: TMenuItem;
    Lookupcreditor1: TMenuItem;
    xTblRpBatchSREFERENCE: TStringField;
    xTblRpBatchSACCOUNT: TStringField;
    xTblRpBatchSDESCRIPTION: TStringField;
    xTblRpBatchFDEBIT: TFloatField;
    xTblRpBatchFAMOUNT: TFloatField;
    xTblRpBatchSTAX: TStringField;
    xTblRpBatchDDATE: TDateTimeField;
    xTblRpBatchFCREDIT: TFloatField;
    xTblRpBatchSCONTRAACCOUNT: TStringField;
    xTblRpBatchFTAXAMOUNT: TFloatField;
    xTblRpBatchDALLOCATEDDATE: TDateTimeField;
    xTblRpBatchBRECONCILED: TSmallintField;
    xTblRpBatchBEXCLUSIVE: TSmallintField;
    xTblRpBatchWACCOUNTID: TIntegerField;
    xTblRpBatchWLINEID: TIntegerField;
    xTblRpBatchFQTY: TFloatField;
    xTblRpBatchWPROFILEID: TIntegerField;
    xTblRpBatchWTAX2ID: TIntegerField;
    xTblRpBatchNOTUSED: TFloatField;
    xTblRpBatchSPROFILE: TStringField;
    xTblRpBatchSJOBCODE: TStringField;
    xTblRpBatchSTAX2: TStringField;
    xTblRpBatchBLINKED: TSmallintField;
    xTblRpBatchDSYSDATE: TDateTimeField;
    xTblRpBatchFTAX2AMOUNT: TFloatField;
    xTblRpBatchWTAXID: TIntegerField;
    xTblRpBatchWCONTRAACCOUNTID: TIntegerField;
    xTblRpBatchWLINKEDID: TIntegerField;
    xTblRpBatchWREPORTINGGROUP1ID: TIntegerField;
    xTblRpBatchWREPORTINGGROUP2ID: TIntegerField;
    xTblRpBatchDPAYMENTDATE: TDateTimeField;
    xTblRpBatchWDOCID: TIntegerField;
    QGen: TuniQuery;
    PageControl1: TPageControl;
    tsEnter: TTabSheet;
    Panel3: TPanel;
    PnlRpBatch: TPanel;
    Label7: TLabel;
    lblMonth: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    RpbtCancel: TBitBtn;
    RpbtOk: TBitBtn;
    Rien: TPanel;
    LbYear: TListBox;
    edtPeriod: TEdit;
    edtAddDesc: TEdit;
    edtNewRef: TEdit;
    BitBtn2: TBitBtn;
    tsPosted: TTabSheet;
    Copy1: TMenuItem;
    GenCopyFrom: TMenuItem;
    GenCopyto: TMenuItem;
    Lookuptransactions1: TMenuItem;
    N1: TMenuItem;
    Plugins: TMenuItem;
    cxGrid1Level1: TcxGridLevel;
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
    TbarMain: TToolBar;
    PnlAlias: TPanel;
    Label15: TLabel;
    edtAlias: TEdit;
    tlbtnDelete: TToolButton;
    tlbtnInsert: TToolButton;
    tlbtnBalance: TToolButton;
    tlbtnPost: TToolButton;
    tlbtnExclIncl: TToolButton;
    tlbtnincl: TToolButton;
    tlbtnList: TToolButton;
    tlbtnProcess: TToolButton;
    tlbtnSetup: TToolButton;
    tblBatch: TUniTable;
    dsBatch: TDataSource;
    qGenBatchId: TUniQuery;
    Panel2: TPanel;
    lFind: TLabel;
    createaccount1: TMenuItem;
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
    cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn;
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
    tblBatchISBALANCE: TSmallintField;
    cxGrid1DBBandedTableView1ISBALANCE: TcxGridDBBandedColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbtnDeleteClick(Sender: TObject);
    procedure tlbtnProcessClick(Sender: TObject);
    procedure tlbtnInsertClick(Sender: TObject);
    procedure tlbtnPostClick(Sender: TObject);
    procedure tlbtnExclInclClick(Sender: TObject);
    procedure tlbtnSetupClick(Sender: TObject);
    procedure tlbtnBalanceClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    Procedure AdjIncExcBtn(BExcl:Boolean);
    procedure LookupDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PnlRpBatchEnter(Sender: TObject);
    procedure RpbtOkClick(Sender: TObject);
    procedure PnlRpBatchExit(Sender: TObject);
    procedure RpbtCancelClick(Sender: TObject);
    procedure RpbtOkKeyPress(Sender: TObject; var Key: Char);
    procedure RpbtCancelKeyPress(Sender: TObject; var Key: Char);
    procedure RienEnter(Sender: TObject);
    procedure tlbtnListClick(Sender: TObject);
    procedure EdtMonthKeyPress(Sender: TObject; var Key: Char);
    procedure LbYearKeyPress(Sender: TObject; var Key: Char);
    procedure dbgridBatchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PnlAliasExit(Sender: TObject);
    procedure edtAliasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  
    procedure dbgridBatchDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Lookupdocument1Click(Sender: TObject);
    procedure Lookupdocwithammount1Click(Sender: TObject);
    procedure Lookupdebtor1Click(Sender: TObject);
    procedure dbgridBatchTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure DBLCBCostgroup2Exit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Lookuptransactions1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBBandedTableView1EditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
    procedure cxGrid1DBBandedTableView1FocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure cxGrid1DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid1DBBandedTableView1FDEBITPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tblBatchAfterScroll(DataSet: TDataSet);
    procedure tblBatchAfterInsert(DataSet: TDataSet);
    procedure tblBatchBeforeOpen(DataSet: TDataSet);
    procedure tblBatchAfterPost(DataSet: TDataSet);
    procedure tblBatchBeforePost(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure cxGrid1DBBandedTableView1WACCOUNTIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBBandedTableView1WCONTRAACCOUNTIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGrid1DBBandedTableView1EditValueChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure cxGrid1DBBandedTableView1Editing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
      procedure onclosupNotifiy (Sender : Tobject);
    procedure createaccount1Click(Sender: TObject);
    procedure cxGrid1DBBandedTableView1InitEditValue(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var AValue: Variant);
    procedure cxGrid1DBBandedTableView1Column1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure tblBatchAfterDelete(DataSet: TDataSet);
    procedure tblBatchWACCOUNTIDValidate(Sender: TField);
    procedure tblBatchWCONTRAACCOUNTIDValidate(Sender: TField);
    procedure tblBatchWTAXIDValidate(Sender: TField);
    procedure tblBatchCalcFields(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure tblBatchBeforeClose(DataSet: TDataSet);
  private
    FIdCol: Char;
    aLookupgrid : TfmLookupgrids ;


    Procedure UnlinkLine(_BatLinkedID:integer);



    procedure GenMenuCopy(Sender: TObject);
    procedure GenMenuPast(Sender: TObject);
    procedure loadPlugins;
    procedure InitPluginsMenu ;
    procedure OnMenuPluginAct1(Sender: TObject);
    procedure onPopupNotifiy(Sender: Tobject);
 
    { Private declarations }
  public
    { Public declarations }
    CopyData : Variant ;
    LastUsedReference,LastUsedDescription : String ;
    LastUsedContra ,LastUsedTax,LastUsedAccount: Integer ;
    LastUsedDate : TDateTime ;
    NeedsReopen  : Boolean ;
    DefaultContraAccount : Integer ;
    ShowLinkMessage,ShowLinkForThisLine,InProcesOrClose,InLinkCall  : boolean;
 
    SpecialOpenItemAccounts : String ;
    AccountLookupType,SubAccountLookUpType : Integer ;
    ADMCoreData : TDMCoreData ;
    PayRollPluginLoaded , AccountLoopupOnly: Boolean ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;

    LastTabletype : String ;
    // this ensures the posting event with is mutch beter than that strange grid stuff

    InRowChanged:Boolean;
  CInRowChanged:Integer;

  BatchCaption : String;
  OldAccount,ActualAccount,
  search,Look,Tbl,SSelect:String;
  EditMode,
  PostHere,
  ImpRpBatch,SelectContraAcc,
  ReShow,Account,BrememberContra,BRememberTax : Boolean;
  BackRow:Integer;
  PostDone:Boolean ;


    procedure WriteBatch(Filename : String);
    procedure GetRefTotals;

 

    Procedure F9Process(Return:String);

    // done : Pieter give message show as result so we can do it after all things are done.
    function CallLinks : Boolean ;
 
    procedure RemoveBalanceEntrys ;
    procedure RemoveEmptys ;
    procedure TranslateColumns ;
 
  end;

  var
     fmBatchEntry   : TfmBatchEntry;

implementation

uses Main, Database, SelectBatchType, BatchProcessMenu, GlobalFunctions,
   SetAbbreviations, 
  HtmlHelpAPI, LanguageChoice, BatchPeriodTotals, BatchOptions,
   Lookup, GenMutliEntry, EditReceipts, SelectAccountType,
  GetReportDate, OpenItemSelection, UpdateInvoice, ExchangeTCData,
  DatabaseAccess, TcVariables, LedgerRoutines, BatchPayCreditors,XRoutines,
   BatchPayDebtors, InvoiceEntryGrid, Debtor, FreeReportsUnit,
  ReverseBatch,OSFGeneralRoutines, NewProgress, Types,
  UDMTCCoreLink , UDmQuantumGridDefs;

{$R *.DFM}

Var
  vMonth,vYear,
  vbDay,veDay           :Word;
  OkMoveOne             :ShortInt;
  AccBlocked :   TrSelect;

Procedure HidefmSelectBat(vHide:Boolean);
begin
  if fmSelectBatchType=nil then
    exit;
  if vHide then
    fmSelectBatchType.hide
  else
    fmSelectBatchType.show;
end;

Function GetRepetitiveBatchName:string;
Var
  i:Integer;
begin
  Result:=BatchNameFName;
    if Result='' then exit;
    i:=pos('.',Result);
    if i>0 then
     begin
    repeat
      Dec(i);
      if Result[i]='\' then
      begin
        Insert('Rbt',Result,i+4);
        Break;
      end;
    until i=1
  end else
  begin
     // new way with no table .db stuff
     Insert('Rbt',Result,4);
  end;
end;


Procedure TfmBatchEntry.UnlinkLine(_BatLinkedID:integer);
begin
 // todo : no unlinkig for now. 
  LedgerRoutines.UnlinkLine(_BatLinkedID,BatchCtrlID);
 // ?? why  exit 
 //exit;
end;

 






Procedure TfmBatchEntry.AdjIncExcBtn(BExcl:Boolean);
Begin
  if BExcl =False then
  begin
    //Inclusive mode
    tlbtnExclIncl.Down := False;
    tlbtnincl.Down := True ;
  end
  else
  begin
    //Exclusive mode
    tlbtnExclIncl.Down := True;
    tlbtnincl.Down := False ;
  end;
end;

procedure TfmBatchEntry.WriteBatch(Filename : String);

begin
  WriteTextBatch(FileName);
  exit;
end;



procedure TfmBatchEntry.GetRefTotals;
 var
   i : Integer ;
   aTotal :  Double ;
begin

 if tblBatch.ControlsDisabled then exit ;


 if tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger then
  begin
  aTotal := 0 ;
    for i := 0 to cxGrid1DBBandedTableView1.ViewData.RowCount -1 do
      begin
        if  VarToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1SREFERENCE.Index] ) = tblBatchSREFERENCE.AsString then
          if varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINEID.Index] ) = varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1WLINKEDID.Index] ) then
            aTotal :=  aTotal + StrToFloatDef(VarToStr(varToStr(cxGrid1DBBandedTableView1.ViewData.Rows[i].Values[cxGrid1DBBandedTableView1FAMOUNT.Index] )),0) ;
      end;
 LRefTotal.Caption := FloatToStrF( aTotal, ffCurrency, 18, 2);
 if TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger) <> 1 then
    begin
      if tblBatchBEXCLUSIVE.AsInteger = 1 then
         begin
            if IsCashBook = 0 then
               begin
                 lExclAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat , ffCurrency, 18, 2) ;
                 LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger ), ffCurrency, 18, 2);
               end  else
               begin
                 lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger) , ffCurrency, 18, 2);
                 LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
               end;
         end else
         begin
          if IsCashBook = 1 then
           begin
              lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat/ TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger), ffCurrency, 18, 2);
              LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat , ffCurrency, 18, 2);
           end else
           begin
              lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat/  TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)  , ffCurrency, 18, 2) ;
              LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
           end;
         end;
    end else
    begin
    lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    end;

   lAlocatedTo.Caption := TDataBaseRoutines.GetAccountFullDescription(tblBatchWACCOUNTID.AsInteger) ;
   Lcontraaccountcode.Caption := TDataBaseRoutines.GetAccountFullDescription(tblBatchWCONTRAACCOUNTID.AsInteger) ;
    LRefTotal.Caption := FloatToStrF( aTotal, ffCurrency, 18, 2);
        AdjIncExcBtn(tblBatchBExclusive.AsInteger = 1);
  end else
  begin
    AdjIncExcBtn(false);
    lExclAmount.Caption := FloatToStrF(  tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    LIncAmount.Caption := FloatToStrF( tblBatchFAMOUNT.AsFloat, ffCurrency, 18, 2);
    lAlocatedTo.Caption := TDataBaseRoutines.GetAccountFullDescription(tblBatchWACCOUNTID.AsInteger) ;
    Lcontraaccountcode.Caption := '' ;
    LRefTotal.Caption := '';

  end;

end;



procedure TfmBatchEntry.FormShow(Sender: TObject);
var
  MySql,LookupType:String;
  Colindex,i : Integer ;
  newprogress : TfmNewProgress ;
begin
 newprogress := TfmNewProgress.Create(self) ;
 try
 newprogress.initProgress(Gettextlang(1256),1);

 tsEnter.Caption := Gettextlang(298);
 tsPosted.Caption := Gettextlang(2003);

 LookupTransactions1.Caption := Gettextlang(3274);

 tblBatch.IndexFieldNames := 'WlineId' ;
 SpecialOpenItemAccounts := ReadLongSysparam('OpenITemLedgers',0) ;

 InProcesOrClose := false ;

 dmDatabase.tblBatchTypes.open ;
 dmDatabase.tblBatchTypes.Locate('WBatchTypeID',dmDatabase.BatchType,[]);
 DefaultContraAccount := dmDatabase.tblBatchTypesWContraAccountID.AsInteger ;


  BrememberContra := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberContra',false).AsBoolean ;
  BRememberTax := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberTax',false).AsBoolean ;
 cxGrid1DBBandedTableView1.DataController.Filter.Active :=
  ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BLIMITBAL',0).AsInteger = 1 ;

 AccountLoopupOnly :=  DMTCCoreLink.ReadNwReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountLonly',False) ;
 AccountLookupType := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountCodeType',0).AsInteger ;
 SubAccountLookUpType :=  ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BContraAccountCodeType',0).AsInteger ;


 {if dmDatabase.tblBatchTypesBContraPerLine.Asinteger = 1 then
    DefaultContraAccount := 0 ;  }
     (* Input Batch Entry *)
      BatchCaption := dmDatabase.tblBatchTypesSDescription.AsString;
      // // Sylvain: this Call will help define the cash book type.
      // I can not remember where it was but it's found no where
      // So the receipt Cash books is not identified.
      PrepareBatch(BatchCaption);

      Caption:=BatchCaption;
      search:=GetBatAlias(BatchCtrlID);
      if search<>'' then
        Caption := Caption +' - ['+search+']';
      // we forgot about the repeating batc
      if IsRepeatingBat then
         begin
            Caption := Caption +' *** ' +  StringReplace(GetTextLang(25),'&','',[]) +' ***';
            // lt pink to know your in repeating batch
            cxGrid1DBBandedTableView1.Styles.ContentEven.Color := $00F2F1FA ;
            cxGrid1DBBandedTableView1.Styles.ContentOdd.Color := $00F2F1FA ;
 
         end ;
     tlbtnDelete.Caption := Gettextlang(367);  //^D : Delete 367
     tlbtnInsert.Caption := Gettextlang(368); //^N : Insert 368
     tlbtnBalance.Caption := Gettextlang(369);//F5 : Allocate 369
     tlbtnPost.Caption := Gettextlang(370);  //F6 : Contra 370
     tlbtnList.Caption := Gettextlang(372); //F8 : Link 372
     tlbtnProcess.Caption := Gettextlang(373); //F9 : Process 373
     tlbtnSetup.Caption := Gettextlang(374); //F10 : Setup 374
     Label1.Caption := Gettextlang(375); //Inclusive amount 375
     Label2.Caption := Gettextlang(376);//Exclusive amount 376
     Label5.Caption := Gettextlang(377);  //Reference total 377
     Label3.Caption := Gettextlang(378); //Allocate to 378
     LContraAccount.Caption := Gettextlang(34);  //Contra amount 379
     Label7.Caption := Gettextlang(599); // Enter month and Year to repeat entries  to
     RpBtCancel.Caption := Gettextlang(168); // Repeating Cancel
     RpBtok.Caption := Gettextlang(167); // Repeating Ok
     LblMonth.Caption :='&'+ Gettextlang(600);// Month
     Label8.Caption := '&'+Gettextlang(601);// Year
 tlbtnExclIncl.Caption := GetTextLang(371);
 tlbtnIncl.Caption := GetTextLang(664);
 Lookupdocument1.Caption := Gettextlang(2899 {Lookup document});
 Lookupdocwithammount1.Caption := Gettextlang(2900 {Lookup doc with ammout});
 Lookupdebtor1.Caption := Gettextlang(2901{Lookup debtor});
 Lookupcreditor1.Caption := Gettextlang(2902 {Lookup creditor});
 // done : Pieter Im going to detatch the post routine and attach it as last thing.
 dmDatabase.CalledFromBatch := False ; //  tblBatchBeforePost
  tblBatch.DisableControls ;
     try
  AccExclFilter:= GetAccExclFilter(AccBlocked);
  PostHere:=True;
  CInRowChanged:=0;
  dmDatabase.OpenItemRequest:=0;
  dmDatabase.DefaultTax:='';
  if Reshow then exit;
  AdjIncExcBtn(True);
  if Screen.Height = 1024 then
    begin
    fmBatchEntry.Height := 890;
    fmBatchEntry.Width :=  760 ;
    end else
  if Screen.Height = 768 then
    begin
    fmBatchEntry.Height := 640;
    fmBatchEntry.Width :=  760 ;
    end else
  if Screen.Height = 600 then
     begin
    fmBatchEntry.Height := 540;
    fmBatchEntry.Width :=  760 ;
    end else
  if Screen.Height = 480 then
    begin
    fmBatchEntry.Height := 390;
    fmBatchEntry.Width :=  600 ;
    end;
  Label1.Caption :=GetTextLang(375);// 'Inclusive Amount :';
  Label2.Caption :=GetTextLang(376);//  'Exclusive Amount :';
  Label5.Caption := GetTextLang(377);// 'Reference Total :';
  Label3.Caption := GetTextLang(378);// 'Allocated to :';
  LContraAccount.Caption := GetTextLang(34);// 'Contra Account :';
  Label15.Caption := gettextlang(2029);
  Lcontraaccountcode.Caption := '';
  Label9.Caption := gettextlang(2129);
  Label16.Caption := gettextlang(2130);
  tblBatch.Close;
  tblBatchFDEBIT.DisplayFormat := GetViewMask(0);
  tblBatchFCREDIT.DisplayFormat := GetViewMask(0);
     tlbtnPost.Enabled :=  CheckUserCtrl('Post',False) ;

  BatchCtrlID := GetBatchCtrlID(dmDatabase.tblBatchTypesWBATCHTYPEID.AsInteger) ;
  BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,IsRepeatingBat);
  dmDatabase.tblBatch.close ;
  tblBatch.TableName := BatchNameFName;




     tblBatch.Open;
     LastUsedReference := '' ;
     while not tblBatch.eof do
        begin
           if tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger then
            if  tblBatchSREFERENCE.AsString <> '' then
             begin
              LastUsedReference :=  tblBatchSREFERENCE.AsString ;
              LastUsedContra    :=  tblBatchWCONTRAACCOUNTID.AsInteger ;
              LastUsedAccount   :=  tblBatchWACCOUNTID.AsInteger ;
              LastUsedDate   :=  tblBatchDDATE.AsDateTime ;
              LastUsedTax   :=  tblBatchWTAXID.AsInteger ;
             end;
          tblBatch.next ;
        end;
     if LastUsedReference = '' then
        begin
           LastUsedReference := VarToStr(
           DMTCCoreLink.OpenSqlReturnFirstColumn('select first 1 sreference from transact where WLINEID <> WLINKEDID and  WBatchTypeid = ' + IntToStr(dmDatabase.tblBatchTypesWBATCHTYPEID.AsInteger) +' order by ddate, wlineid desc '));
        end;

    //set debits / credits readonly
    dmDatabase.tblBatchTypes.Edit;
    dmDatabase.tblBatchTypesDSysDate.Value := Now;
    dmDatabase.tblBatchTypes.Post;
    // done : pieter Grid seems to be off track when disabling fields and trowing them out.
    // no deleting just disable
    if dmDatabase.tblBatchTypesWDebitCredit.Value = 0 then
    begin
      tblBatchFCREDIT.Tag := 0;
      tblBatchFDEBIT.Tag := 0;
      cxGrid1DBBandedTableView1FDEBIT.Options.Editing := True ;
      cxGrid1DBBandedTableView1FCREDIT.Options.Editing := True ;
    end;
    if dmDatabase.tblBatchTypesWDebitCredit.Value = 1 then
    begin
      tblBatchFCREDIT.Tag := 1;
      tblBatchFDEBIT.Tag := 0;
      cxGrid1DBBandedTableView1FDEBIT.Options.Editing := True ;
      cxGrid1DBBandedTableView1FCREDIT.Options.Editing := False ;
    end;
    if dmDatabase.tblBatchTypesWDebitCredit.Value = 2 then
    begin
      tblBatchFCREDIT.Tag := 0;
      tblBatchFDEBIT.Tag := 1;
      cxGrid1DBBandedTableView1FDEBIT.Options.Editing := False ;
      cxGrid1DBBandedTableView1FCREDIT.Options.Editing := True ;
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
    DmDatabase.qBatPeriodTotals.Close;
    DmDatabase.qBatPeriodTotals.SQL.Clear;
    DmDatabase.qBatPeriodTotals.SQL.Add(MySql);
    EditMode := True;
    TranslateColumns ;
    dmDatabase.DoAutoInc := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'CBAutoIncNum',True).AsBoolean ;
    aLookupgrid.ZQProjects.close ;
    aLookupgrid.ZQProjects.open ;
    if (aLookupgrid.ZQProjects.RecordCount < 2) or not(ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbProjects',false).AsBoolean) then
      begin
       cxGrid1DBBandedTableView1SJOBCODE.VisibleForCustomization := False ;
       cxGrid1DBBandedTableView1SJOBCODE.Visible := False ;
       // hide  projects
      end;
 aLookupgrid.ZQCostgroup2.close ;
 aLookupgrid.ZQCostgroup2.open ;
  if (aLookupgrid.ZQCostgroup2.RecordCount < 2) or not (ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',false).AsBoolean) then
   begin
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.VisibleForCustomization := False ;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Visible := False ;
   end;
 aLookupgrid.ZQCostgroup1.close ;
 aLookupgrid.ZQCostgroup1.open ;
 if (aLookupgrid.ZQCostgroup1.RecordCount < 2) or not(ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',true).AsBoolean)  then
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
if ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoTax',false).AsBoolean  then
  begin
    cxGrid1DBBandedTableView1WTAXID.VisibleForCustomization := False ;
    cxGrid1DBBandedTableView1WTAXID.Visible := False ;
    tlbtnExclIncl.Visible := false ;
    tlbtnincl.Visible := false ;
  end;
  if not (dmDatabase.tblBatchTypesBContraPerLine.Asinteger = 1) then
      begin
        cxGrid1DBBandedTableView1WCONTRAACCOUNTID.VisibleForCustomization := False ;
        cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Visible := False ;
      end;
   cxGrid1DBBandedTableView1FCREDIT.Options.Editing := True ;
   cxGrid1DBBandedTableView1FCREDIT.Options.Editing := True ;
   if cxGrid1DBBandedTableView1FCREDIT.Tag = 1 then
      cxGrid1DBBandedTableView1FCREDIT.Options.Editing := true ;
   if cxGrid1DBBandedTableView1FCREDIT.Tag = 1  then
      cxGrid1DBBandedTableView1FCREDIT.Options.Editing := true ;
    cxGrid1DBBandedTableView1WLINEID.Caption:=GetTextLang(1706);
    finally

      tblBatch.first ;
      tblBatch.EnableControls ;
     dmDatabase.CalledFromBatch := True ;
     tblBatch.open ;
    end;
  dmDatabase.DefCostGroup1 := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',0).AsInteger ;
  edtAlias.Text := GetBatAlias(BatchCtrlID);
  self.top := 10 ;
  self.Left := 10 ;

  cxGrid1DBBandedTableView1Column1.Visible := not ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoOpenItem',false).AsBoolean ;
  cxGrid1DBBandedTableView1Column1.Visible := cxGrid1DBBandedTableView1Column1.Visible and not IsRepeatingBat ;
  cxGrid1DBBandedTableView1Column1.Caption :=  GetTextLang(3326);
  createaccount1.Caption :=GetTextLang( 296);
  TDatabaseRegistyRoutines.ReadFormPos(self,dmDatabase.tblBatchTypesWBatchTypeID.AsString);
  if cxGrid1.CanFocus then
     cxGrid1.SetFocus ;
 loadPlugins ;
 finally
    newprogress.Free ;
 end;
end;

procedure TfmBatchEntry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BLIMITBAL',IntTostr(ord(
   cxGrid1DBBandedTableView1.DataController.Filter.Active)));

 try
 if cxGrid1.CanFocus then
  cxGrid1.SetFocus ;
 except

 end; 
    InProcesOrClose := true  ;
  if ( tblBatch.state in [dsinsert,dsEdit]) then
      tblBatch.post ;
  dmDatabase.tblBatchRefTotals.Close;
  EditMode := False;

  tblBatchFDEBIT.ReadOnly:=False;
  tblBatchFCREDIT.ReadOnly:=False;
 
  if PostDone then RunUpdateClient;
  if NeedsReopen then self.ModalResult := 5 ;
  Reshow := false ;

  TDatabaseRegistyRoutines.WriteFormPos(self,dmDatabase.tblBatchTypesWBatchTypeID.AsString);
end;

//Toolbar

procedure TfmBatchEntry.tlbtnDeleteClick(Sender: TObject);
Var
  i , Tmp:Integer;

begin

  i := cxGrid1DBBandedTableView1.Controller.SelectedRecordCount ;
  if i < 1 then i := 1 ;
    //aSaveClientDatasetCallList.
  if tblBatch.IsEmpty then exit ;
  if OSFMessageDlg(GetTextLang(437) + ' (' + IntToStr(i)+')' {Are you sure you wish to delete this transaction ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
   try
     if cxGrid1DBBandedTableView1.Controller.SelectedRecordCount > 1 then
      begin
        for i := cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 downto 0  do
           begin

             begin
             cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
             Tmp := tblBatchWlineID.AsInteger;
             UnlinkLine(Tmp);
             tblBatch.Delete;
             end;
           end;
      end else
      begin
       Tmp := tblBatchWlineID.AsInteger;
       UnlinkLine(Tmp);
       tblBatch.Delete;
      end;
   except
   end;
end;

procedure TfmBatchEntry.tlbtnInsertClick(Sender: TObject);
begin
  tblBatch.Append;
end;

procedure TfmBatchEntry.tlbtnBalanceClick(Sender: TObject);
begin
 RemoveEmptys ;

 F9Process('Balance');
end;

procedure TfmBatchEntry.tlbtnPostClick(Sender: TObject);
begin
 

  if ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAlwaysBalance',false).AsBoolean then
     tlbtnBalanceClick(self);
  PostHere:=True;
  if tlbtnPost.Enabled then
     F9Process('Post');
end;

procedure TfmBatchEntry.tlbtnExclInclClick(Sender: TObject);
var
  Rate       : Real;
  TempIndex : Integer;
  ToTal:Extended;
  BExcl:Boolean;
 
begin
  if TblBatch.IsEmpty or
  ( tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger) then
     begin
       AdjIncExcBtn(False);
     exit ;
     end;
    Rate := 0 ;
 // TblBatch.DisableControls ;
  InProcesOrClose := True ;
  try
 
   UnlinkLine(tblBatchWLINEID.AsInteger);
               tblBatch.edit ;
            tblBatchBLINKED.Clear ;
   cxGrid1DBBandedTableView1SREFERENCE.Focused := True ;

  Total:=tblBatchFAmount.Value;
  BExcl := Not (TblBatchBExclusive.Value=1);
  if not (tblbatch.State in [dsedit,DsInsert ]) then
  TblBatch.Edit;
  TblBatchBExclusive.Value := ord(BExcl);
  TblBatch.Post;
  AdjIncExcBtn(BExcl);

  if tblBatchWTAXID.AsInteger <> 0 then
  begin

    Rate:= TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger);
    If TblBatchBExclusive.Value =1 then
    begin

      if not (tblbatch.State in [dsedit,DsInsert ]) then
      TblBatch.Edit;

      If TblBatchFDEBIT.Value>TblBatchFCREDIT.Value then
       begin
        if (IsCashBook<>0) then
            TblBatchFDEBIT.Value :=ToTal
          else TblBatchFDEBIT.Value:=ToTal * Rate ;

       // tblBatchFAMOUNT.Value:= TblBatchFDEBIT.Value ;
      end else
      begin
        if (IsCashBook<>0) then
            TblBatchFCREDIT.Value:=Abs(ToTal)
        else
         TblBatchFCREDIT.Value:=Abs(ToTal) * Rate ;
      end;
     // tblBatchFAMOUNT.AsFloat := TblBatchFDEBIT.Value - TblBatchFCREDIT.Value ;
    end
    else
    begin
      if not (tblbatch.State in [dsedit,DsInsert ]) then
      TblBatch.Edit;
      If TblBatchFDEBIT.Value>TblBatchFCREDIT.Value then
        if (IsCashBook<>0) then
           TblBatchFDEBIT.Value:=ToTal / Rate
        else
          TblBatchFDEBIT.Value:=ToTal
      else
        if (IsCashBook<>0) then
           TblBatchFCREDIT.Value:=Abs(ToTal) / Rate
        else
          TblBatchFCREDIT.Value:=Abs(ToTal);
    end;
   // tblBatchFAMOUNT.AsFloat := TblBatchFDEBIT.Value - TblBatchFCREDIT.Value ;
  end ;

  if not (tblbatch.State in [dsedit,DsInsert ]) then
  TblBatch.Edit;
  if rate <> 0 then
  begin
  if TblbatchBExclusive.Value =1then
       begin
          TblbatchFTaxAmount.Value :=  TblBatchFAmount.Value * (Rate-1) ;
        end else
        begin
          TblbatchFTaxAmount.Value := TblBatchFAmount.Value -(TblBatchFAmount.Value / Rate) ;
        end;
  end;
  tblBatchBLINKED.AsInteger := 0 ;
  finally
 //   TblBatch.EnableControls ;
    InProcesOrClose := False ;
  end;

  if  (tblbatch.State in [dsedit,DsInsert ]) then
  TblBatch.post;
  GetRefTotals ;
end;

Procedure TfmBatchEntry.F9Process(Return:String);
Var
  D,M,Y :Word;
  MyDate:TDate;

  SaveDt,SaveCt:Boolean;
  ProcRes:Integer;
  LyPost:Boolean;
  ABatchCon:TBatchCon;
  AProgress : TfmNewProgress ;
  TextString : String ;
begin
 PageControl1.ActivePageIndex := 0 ;
 if edtAlias.CanFocus then
 try
 edtAlias.SetFocus ;
 except
 end;
 
 AProgress := TfmNewProgress.create(nil) ;
 try
 // lets force commit all pending so others can see the batch
// dbgridBatch.SetActiveField(dmDatabase.tblBatchSDESCRIPTION.FieldName);
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


  // done : Pieter there are sometime unexpected errors when you stand on the account field and press process.
  // i think this wil fix that
  // set the active index to reference and post this wil speed up processing as the accounts will not be filtered everytime
  try
  ShowLinkForThisLine := false ;
  cxGrid1DBBandedTableView1SREFERENCE.Focused := true ;
 

  ShowLinkForThisLine := false ;
  InProcesOrClose := true ;


 Application.ProcessMessages ;

  try

  ProcRes := 0;

  if return = 'PayrollImportPlugin'then
    begin
       tblBatch.close ;
       OSFPLUGINRunPlugInsDLLProgram('plug_ins\payroll.tpd','BATCH_NAME='+tblBatch.TableName);
       tblBatch.open ;
    end;

  if return = 'MakeAccContra'then
    begin
      tblBatch.open ;
     tblBatch.DisableControls;

     try
     tblBatch.First ;
        While not tblBatch.Eof do
        begin
           if not (tblbatch.State in [dsedit,DsInsert ]) then
           tblBatch.Edit;
           tblBatchSCONTRAACCOUNT.AsString := tblBatchSACCOUNT.AsString ;
           tblBatchWCONTRAACCOUNTID.AsString := tblBatchWACCOUNTID.AsString ;
           tblBatch.post;
           tblBatch.Next;
        end;
      finally
        tblBatch.EnableControls;
      end;
    end else
  if Return= 'RpBtExec' then
  begin
     PnlRpBatch.Visible:=True;
     PnlRpBatch.BringToFront ;
     PnlRpBatch.SetFocus;
  end else
  if Return = 'RpbtErase' then
  begin
    if OSFMessageDlg(GetTextLang(621){Are you sure you wish to delete this transaction ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      F9Process('Erase') ;
      exit ;
    end;
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

    dmDatabase.tblBatchRefTotals.close ;
    tblBatch.Close;
    //DeleteFile();

    dmDatabase.tblBatchControl.Open;
    // TODO : BDEINDEX
    dmDatabase.tblBatchControl.Filtered := False;
    dmDatabase.tblBatchControl.Filter := 'BPosted = 0 and WUserID = ''' + IntToStr(CurrentUser) + ''' and WBatchTypeID = ''' + IntToStr(dmDatabase.BatchType) + '''';
    dmDatabase.tblBatchControl.Filtered := True;

    dmDatabase.tblBatchControl.Last;

    try
      if dmDatabase.tblBatchControlWBATCHID.AsInteger <> 0 then
        begin
         DMTCCoreLink.ExecSql('delete from oilinkspre where WBATCHID = ' +  dmDatabase.tblBatchControlWBATCHID.AsString) ;
         dmDatabase.tblBatchControl.Delete;
        end;
    except
    end;
    While dmDatabase.tblBatchControl.Locate('WUserID;BPosted;WBatchTypeID', VarArrayOf([CurrentUser,0,dmDatabase.BatchType]), []) do
    begin
      dmDatabase.tblBatchControl.Edit;
      dmDatabase.tblBatchControlBPosted.Value := 1;
      dmDatabase.tblBatchControl.Post;
    end;
    dmDatabase.tblBatchControl.Close;
    dmDatabase.tblBatchControl.Filtered := False;
    dmDatabase.tblBatchControl.Filter:='';

    //KillBatchOiLinks;
    clearTable(tblBatch.TableName);
    fmBatchEntry.Close;
    ShowErrMsg(ProcRes);
    exit ;

  end else

  If Return='Print' Then
  begin
    CheckReportMan(0,0,1,0,'BATCHNAME=' + tblBatch.TableName+#13+#10+'BATCHID=' + dmDatabase.tblBatchTypesWBatchTypeID.AsString +#13+#10+'BATCTRLID=' + IntToStr(BatchCtrlID),'batch','GENERAL');
     exit;

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
      tblBatch.Close ;
      LoadTextBatch(ImportDialog.FileName,DefaultContraAccount);
      tblBatch.Open ;
      dmDatabase.tblBatchControl.Open;
      dmDatabase.tblBatchControl.Filtered := False;
      dmDatabase.tblBatchControl.Filter := 'WBatchTypeID = ' + IntToStr(dmDatabase.BatchType);
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
      tblBatch.close;
    if ExportDialog.FileName <> 'nothing' then
    begin
      if SameTExt('.txf',ExtractFileExt( ExportDialog.FileName)) then
      begin
        {Read batchCon record Seek it now}
        ABatchCon.WBatchID :=  BatchCtrlID;
        if IntGetBatchRec(ABatchCon) then
          ExportBact2Txf(ABatchCon,ExportDialog.FileName);
      end
      else
        WriteBatch(ExportDialog.Filename);
      tblBatch.Open;
    end;
  end else
  if Return = 'Post' then
  begin
    tblBatch.close ;
    dmDatabase.IsBalPost:=True;
    LyPost:=True;
    If IsPostLastYear then
    begin
      LyPost:= OSFMessageDlg(GetTextLang(595)+#13#10+GetTextLang(594){Are you sure you wish to Post to Last Year?}, mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
      begin
        ShowErrMsg(ProcRes);
        exit ;
      end;
    end;
    if IsCashBook = 0 then
    If IsPostBankToStdLedgerWithTax(TextString) then
    begin
      LyPost:= OSFMessageDlg('You are putting proffit/loss on ledger with tax. This will messup tax reports Do you wish to continue?' +#13+#10 + TextString , mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
       begin
        SetProgress(-1);
        exit ;
       end;
    end;
    If IsPostBankToBank(TextString) then
    begin
      LyPost:= OSFMessageDlg('You are putting cash from a bank/cash directly to a bank/cash account. Do you wish to continue?' +#13+#10 + TextString , mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
       begin
        SetProgress(-1);
        exit ;
       end;
    end;
    If IsPostOnAccount(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings) then
    begin
      LyPost:= OSFMessageDlg('Do you wish to post on the retained earnings account?', mtconfirmation, [mbyes, mbno], 0) = mrYes;
      if not LyPost then
      begin
        ShowErrMsg(ProcRes);
        exit ;
      end;
    end ;
    fmBatchEntry.Cursor := crHourGlass;
    dmDatabase.ZMainconnection.StartTransaction ;
     try
     ProcRes := PostBatchNow(LyPost,false,false, ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BOpeningBal',false).AsBoolean);
     dmDatabase.ZMainconnection.Commit ;
     PostDone := True;
     if ProcRes=0 then Close;
     finally
      if  dmDatabase.ZMainconnection.InTransaction then
        dmDatabase.ZMainconnection.Rollback ;
      fmBatchEntry.Cursor := crDefault;
      tblBatch.Open;
     end;
  end else
  if Return = 'Balance' then
  begin
    tblBatch.close;
    dmDatabase.IsBalPost:=True;
    dmDatabase.tblBatchTypes.Locate('WBatchTypeID', dmDatabase.BatchType, []);

    ProcRes := LrBalanceBatch(TblBatch.Tablename,ADMCoreData,dmDatabase.BatchType,DefaultContraAccount,not cxGrid1DBBandedTableView1WTAXID.VisibleForCustomization);
    ShowErrMsg(ProcRes);


    dmDatabase.IsBalPost:=False;
    tblBatch.Open;
  end else
  if Return = 'MultiEntry' then begin
  //Sylvain 23/06/000
     tblBatch.close;
    fmGenMutliEntry:=TfmGenMutliEntry.Create(Application);
     try
      SetUpForm(fmGenMutliEntry);
      fmGenMutliEntry.edtContraAccount.Text:=tblBatchSCONTRAACCOUNT.AsString;
      fmGenMutliEntry.edtContraAccount.Tag:= tblBatchWCONTRAACCOUNTID.AsInteger;
      fmGenMutliEntry.ShowModal;
     finally
      FreeAndNil(fmGenMutliEntry);
       tblBatch.open ;
     end;
  end else
  if Return = 'CrBalancesAtDate' then
  begin
  // Paymt case of Multi Entries
    tblBatch.close;
    fmGetDateValue := TfmGetDateValue.Create(self);
    try
    SetUpForm(fmGetDateValue);
    if not fmGetDateValue.GetReportDate(MyDate) then
      // Esc if not ok pressed
      abort ;
    finally
    fmGetDateValue.Free;
    end;
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Clear;
    dmDatabase.qGen.SQL.add('Select Transact.WAccountID, Sum(Transact.FOutstandingAmount) as FoutSum ,'
             // done : Pieter wheres DDate ??
             + ' Account.SACCOUNTCODE , Transact.DDate '
             + ' From Transact,Account '
             + ' Where Transact.WAccountID=Account.WAccountID '
             + ' AND Transact.FOutstandingAmount<0 '
//             + ' AND Transact.DDate <= Cast("' + DateToStr(MyDate)+'" As Date)'
             + ' AND Account.WAccountTypeID=2'
             // done : Pieter wheres DDate ??
             + ' Group by Transact.WAccountID,Account.SACCOUNTCODE,Transact.DDate');
    try
      // Use Filter For Date Fields, DBE Date Configuration not Stable !!!
      dmDatabase.qGen.Filtered:=False;
      dmDatabase.qGen.Filter:='DDate<= '''+ DateToStr(MyDate)+'''';
      dmDatabase.qGen.Filtered:=True;
      dmDatabase.qGen.Open;
      dmDatabase.qGen.First;
       tblBatch.open ;
      tblBatch.DisableControls;
//      tblAccount.Filtered:=False;
//      tblAccount.Open;
      While Not dmDatabase.qGen.Eof do
      begin
        if dmDatabase.QGen.FieldByNAme('WAccountID').AsString<>'' then
        begin
          tblBatch.Append;
          DecodeDate(MyDate,Y,M,D);
          tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
          tblBatchDDate.Value:=MyDate;
          tblBatchSDescription.Value:={'BALANCE AT}gettextlang(2149)+' '+DateToStr(MyDate);
          tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
  //        dmDatabase.tblBatchSACCOUNT.Value:=tblAccountSMAINACCOUNTCODE.Value+'-'
  //                  +tblAccountSSUBACCOUNTCODE.Value;
          tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByNAme('WAccountID').AsString;
          tblBatchFAmount.Value:=Abs(dmDatabase.QGen.FieldByNAme('FoutSum').AsFloat);
          tblBatchFDEBIT.Value:=Abs(dmDatabase.QGen.FieldByNAme('FoutSum').AsFloat);
          tblBatchFTaxAmount.Value:=0;
          tblBatchSTAX.Value:='';
          tblBatchWTAXID.AsInteger := 0 ;
          tblBatchBReconciled.Value:=ord(False);
          tblBatch.Post;
        end;
        dmDatabase.qGen.Next;
      end;
    Finally
      dmDatabase.qGen.Close;
      tblBatch.EnableControls;
    end;
  end else
  if Return = 'CreateReceipts' then begin
  // Recpt Case of Multi Entries
  //Sylvain 23/06/000
    tblBatch.close;
    fmEditReceipts:=TfmEditReceipts.Create(Application);
    try
    SetUpForm(fmEditReceipts);
    fmEditReceipts.edtAccountCode.Text:=tblBatchSCONTRAACCOUNT.AsString;
    fmEditReceipts.ShowModal;


    finally
      FreeAndNil(fmEditReceipts);
       tblBatch.open ;
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
     tblBatch.close;
    frPayCreditors:= TfrPayCreditors.Create(self);
     try
        if frPayCreditors.ShowModal = mrok then
          begin
              tblBatch.open;
             RemoveEmptys ;
             frPayCreditors.CDSCreditorOpenItems.First ;
             AProgress.initProgress('',frPayCreditors.CDSCreditorOpenItems.RecordCount);
              while not frPayCreditors.CDSCreditorOpenItems.eof do
                begin
                 AProgress.SetProgress('',frPayCreditors.CDSCreditorOpenItems.RecNo);
                 if frPayCreditors.CDSCreditorOpenITemsPayTransaction.AsInteger =1 then
                  begin
                   tblBatch.Insert ;
                   tblBatchBExclusive.AsInteger := 0 ;
                   tblBatchSReference.AsString := frPayCreditors.CDSCreditorOpenITemsReference.AsString ;
                   tblBatchSDescription.AsString := frPayCreditors.CDSCreditorOpenITemsDescription.AsString ;
                   tblBatchFDEBIT.AsFloat := abs(frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat) ;
                   tblBatchFAmount.AsFloat :=  - frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat ;
                   tblBatchDDate.AsDateTime := frPayCreditors.DTPaymentDate.Date ;
                   tblBatchSACCOUNT.AsString := AddDashInStdAccCode(copy(frPayCreditors.CDSCreditorOpenITemsCreditorCode.AsString,2,99));
                   if Length(tblBatchSACCOUNT.AsString) = MainAccountLength then
                     tblBatchSACCOUNT.AsString := tblBatchSACCOUNT.AsString + '-' ;

                   tblBatchBLinked.AsInteger := 1 ;

                   tblBatchWAccountID.AsInteger := frPayCreditors.CDSCreditorOpenITemsaccountid.AsInteger ;

                   tblBatchSCONTRAACCOUNT.AsString := frPayCreditors.EContraAccount.text ;
                   tblBatchWCONTRAACCOUNTID.AsInteger := frPayCreditors.EContraAccount.Tag  ;
                   aDMCoreData.ZQContraAccount.Close ;
                   ADMCoreData.ZQContraAccount.ParamByName('SAccountcode').AsString := GetMainAccountCode(tblBatchSCONTRAACCOUNT.AsString)+ GetSubAccountCode(tblBatchSCONTRAACCOUNT.AsString) ;
                   ADMCoreData.ZQContraAccount.open ;
                   ProcRes := tblBatchWAccountID.AsInteger;

                   tblBatch.Post ;
                   if BatchCtrlID <0 then raise Exception.Create('BatchCtrlID is <0 )')  ;
                   LinkTranscationOnID(ADMCoreData,frPayCreditors.CDSCreditorOpenITemsTransactionID.AsInteger,
                                       ProcRes,tblBatchWLineID.AsInteger,0,CurrentUser,BatchCtrlID,
                                        frPayCreditors.CDSCreditorOpenITemsAmount.AsFloat,frPayCreditors.CDSCreditorOpenITemsAmountOpen.AsFloat,tblBatchDDate.AsDateTime
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
  //begin RecieveDebtors
  // end RecieveDebtors
  else if SameText('RecieveDebtors',Return) then
  begin
    frBatchPayDebtors:= TfrBatchPayDebtors.Create(self);
     try
         tblBatch.close;
        if frBatchPayDebtors.ShowModal = mrok then
          begin
              tblBatch.open;
             RemoveEmptys ;
             frBatchPayDebtors.CDOpenstaandePosten.First ;
             AProgress.initProgress('',frBatchPayDebtors.CDOpenstaandePosten.RecordCount);
              while not frBatchPayDebtors.CDOpenstaandePosten.eof do
                begin
                AProgress.SetProgress('',frBatchPayDebtors.CDOpenstaandePosten.RecNo);
                 if (frBatchPayDebtors.CDOpenstaandePostenEXPORT.Asinteger = 1) then
                  begin
                   tblBatch.Insert ;
                   tblBatchBExclusive.AsInteger := 0 ;
                   tblBatchSReference.AsString := frBatchPayDebtors.CDOpenstaandePostenSReference.AsString ;
                   tblBatchSDescription.AsString := frBatchPayDebtors.CDOpenstaandePostenSDescription.AsString ;
                   if  frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat < 0 then
                   tblBatchFDEBIT.AsFloat :=   - frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat
                   else
                   tblBatchFCREDIT.AsFloat :=  frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat ;
                   tblBatchFAmount.AsFloat :=  - frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat ;
                   tblBatchDDate.AsDateTime := frBatchPayDebtors.DTPaymentDate.Date ;
                   tblBatchSACCOUNT.AsString := AddDashInStdAccCode(frBatchPayDebtors.CDOpenstaandePostenCode.AsString);
                   tblBatchBLinked.AsInteger := 1 ;
                   tblBatchWAccountID.AsInteger := frBatchPayDebtors.CDOpenstaandePostenWAccountID.AsInteger ;
                   tblBatchSCONTRAACCOUNT.AsString := frBatchPayDebtors.EContraAccount.text ;
                   tblBatchWCONTRAACCOUNTID.AsInteger :=  frBatchPayDebtors.EContraAccount.Tag ;
                   ProcRes := frBatchPayDebtors.CDOpenstaandePostenWAccountID.AsInteger ;
                   tblBatch.Post ;
                   if BatchCtrlID <0 then raise Exception.Create('BatchCtrlID is <0 )')  ; 
                   LinkTranscationOnID(ADMCoreData,frBatchPayDebtors.CDOpenstaandePostenWTransactionID.AsInteger,
                                       ProcRes,tblBatchWLineID.AsInteger,0,CurrentUser,BatchCtrlID,
                                        frBatchPayDebtors.CDOpenstaandePostenTotalAmount.AsFloat,frBatchPayDebtors.CDOpenstaandePostenOutstanding.AsFloat,tblBatchDDate.AsDateTime
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
  else if SameText('ReverseBat',Return) then
  begin
     tblBatch.open ;
     tblBatch.DisableControls;

    try
    SaveDt:=tblBatchFDEBIT.ReadOnly;
    SaveCt:=tblBatchFCREDIT.ReadOnly;
    tblBatchFDEBIT.ReadOnly:=False;
    tblBatchFCREDIT.ReadOnly:=False;

    tblBatch.First;
    While not tblBatch.Eof do
    begin
      if not (tblbatch.State in [dsedit,DsInsert ]) then
      tblBatch.Edit;
      if tblBatchFDEBIT.Value=0 then
      begin
        tblBatchFDEBIT.Value:=tblBatchFCREDIT.Value;
        tblBatchFCREDIT.AsString:='0';
      end
      else if tblBatchFCREDIT.Value=0 then
      begin
        tblBatchFCREDIT.Value:=tblBatchFDEBIT.Value;
        tblBatchFDEBIT.AsString:='0';
      end;
      tblBatchFAmount.Value := -tblBatchFAmount.Value;
      tblBatchFTAXAMOUNT.Value := -tblBatchFTAXAMOUNT.Value;

      tblBatch.Post;
      tblBatch.Next;
    end;
    finally

    tblBatch.EnableControls;
    tblBatchFDEBIT.ReadOnly:=SaveDt;
    tblBatchFCREDIT.ReadOnly:=SaveCt;
    end;
  end
  else if SameText('ImportPostBatch',Return) then
  begin
     tblBatch.close ;
     ImportPostedBatch(dmDatabase.BatchType);

     tblBatch.open ;
  end
  else if SameText('LoadTrans',Return) then
  begin
    tblBatch.close ;
    if ImportDialog.FileName <> 'nothing' then
    begin

      dmDatabase.tblBatchTypes.Locate('WBatchTypeID', IntToStr(dmDatabase.BatchType), []);
      OnlyThisBatch:= dmDatabase.tblBatchTypesSDescription.Value;
      tblBatch.close ;
      ProcRes := ImportTransInBat(ImportDialog.FileName);
      OnlyThisBatch:='';
      tblBatch.open ;
    end;
  end;

   ShowErrMsg(ProcRes);
  finally
     Application.ProcessMessages ;
     InProcesOrClose := false ;
  end ;

  Except
     on e : Exception do
       begin
        if not (pos('Refresh failed',E.Message)  = 1 ) then
          OSFMessageDlg(E.Message,mterror,[mbyes],0) ;
       end;
  end;
  finally
     TbarMain.Enabled := true ;
     AProgress.CloseProgress ;
     AProgress.free ;
     dmDatabase.tblBatch.close ;
     tblBatch.Open ;
     
  end;
end;


procedure TfmBatchEntry.tlbtnProcessClick(Sender: TObject);
var
  Return : String;
begin
  //bring up the process
  PostHere:=True;
  fmBatchProcessMenu.PayRollPluginLoaded := PayRollPluginLoaded ;
  Return := fmBatchProcessMenu.ShowMenu('');
  cxGrid1DBBandedTableView1SREFERENCE.Focused := True ; 
  // done : Pieter Before annything remove empty
  RemoveEmptys ;
    F9Process(Return);
  // done : Pieter Apparently After annything remove empty
//  RemoveEmptys ;
  dmDatabase.IsBalPost:=False;

end;

procedure TfmBatchEntry.tlbtnSetupClick(Sender: TObject);
 var Result : Integer ;
begin

  cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection ;
  tblBatch.close ;
  fmBatchOptions := TfmBatchOptions.Create(self);
  try
  SetUpForm(fmBatchOptions);
  Result := fmBatchOptions.ShowModal
   finally
  fmBatchOptions.Free;
   end;
 if Result = mrYes then
    begin
    NeedsReopen := true ;
    self.close ;
    end else
    tblBatch.open ;
end;


procedure TfmBatchEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

Var
     RResult:Double;
     LookupType : String ;
begin
 
  if ssCtrl in Shift then
  begin
    if (Key=82)then
    begin
      if not (tblbatch.State in [dsedit,DsInsert ]) then
      tblBatch.Edit;
      tblBatchBReconciled.Value:= ord(Not (tblBatchBReconciled.Value= 1));
      tblBatch.post;
      Key:=0;
    end;
  end else
    if Key = 115 then
  begin
    RResult:=TblBatchFDEBIT.value-TblBatchFCREDIT.value;
    if CallCalc(RResult) then
    begin
      if RResult<>0 then
      begin
        if not (tblbatch.State in [dsedit,DsInsert ]) then
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
    tlbtnExclInclClick(Sender);
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
        if not tblBatch.Eof then
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


        if (tblBatch.State in [dsedit,dsinsert]) then
           tblBatch.post ;

        tblBatch.Prior;
        key := 0;
      end else
 if (key = vk_DOWN) and (ssShift in Shift) then
   // done : Pieter go to next line fist field
   begin


        if (tblBatch.State in [dsedit,dsinsert]) then
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

procedure TfmBatchEntry.FormKeyPress(Sender: TObject; var Key: Char);
var
  OldLook : String ;

begin
  if edtAlias.Focused then exit ;



    
  if Key = #4 then
  begin
    tlbtnDeleteClick(Sender);
    Key := #0;
  end;
  if Key = #14 then
  begin
    tlbtnInsertClick(Sender);
    Key := #0;
  end;


end;

procedure TfmBatchEntry.LookupDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 36 then
  begin
    if tbl = 'ACCOUNT' then aLookupgrid.tblAccount.First;
    Key := 0;
  end;
  //if the user pushes [end] go to the last record
  if Key = 35 then
  begin
    if tbl = 'ACCOUNT' then aLookupgrid.tblAccount.Last;
    Key := 0;
  end;
  If Key=VK_Left then
  begin
    cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex  - 1 ;
    Key:=0;

  end;
  if Key=VK_Right then
  begin
    cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex := cxGrid1DBBandedTableView1.Controller.FocusedColumnIndex  + 1 ;
   key:=0;
  end;
  if key<>0 then
  begin
    if Key = 116 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnBalanceClick(Sender);
      Key := 0;
    end;
    if Key = 117 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnPostClick(Sender);
      Key := 0;
    end;
    if Key = 118 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnExclInclClick(Sender);
      Key := 0;
    end;
    if Key = 119 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnListClick(Sender);
      Key := 0;
    end;
    if Key = 120 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnProcessClick(Sender);
      Key := 0;
    end;
    if Key = 121 then
    begin
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
      tlbtnSetupClick(Sender);
      Key := 0;
    end;

   if Key = 112 then
   begin
     cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlHelpShowTopic('BatchEntry.htm');
             key := 0;

   end;
  end;
end;

procedure TfmBatchEntry.PnlRpBatchEnter(Sender: TObject);
Var
 Jour,Mois,Annee:Word;
begin

  LbYear.Items.clear;
  LbYear.Items.Add(GetTextLang(604));
  LbYear.Items.Add(GetTextLang(603));
  LbYear.ItemIndex:=1;
  ImpRpBatch:=False;
  xTblRpBatch.Close;
  DecodeDate(Date,Annee,Mois,Jour);


  If PnlRpBatch.Visible then
  begin

   lbYear.SetFocus;
   xTblRpBatch.Connection:=DmDatabase.ZMainconnection;
     xTblRpBatch.TableName:= GetRepetitiveBatchName  ;
   If  TDataBaseRoutines.TableExist(xTblRpBatch.TableName) then
     xTblRpBatch.open
   else
   begin
     OSFMessageDlg(GetTextLang(598), mterror, [mbok], 0);
     ImpRpBatch:=False;
     PnlRpBatch.Visible:=False;
     exit;
   end;
  end;
end;

procedure TfmBatchEntry.RpbtOkClick(Sender: TObject);
begin
  ImpRpBatch:=True;
  PnlRpBatch.Visible:=False;
end;

procedure TfmBatchEntry.PnlRpBatchExit(Sender: TObject);
Var
 Jour,Mois,Annee:Word;
 BHlDt,BHlCr:Boolean;
 NewRef : String;
 MaxID : Integer ;
begin

 if xTblRpBatch.TableName = '' then exit ;


  if ImpRpBatch then
  begin
  MaxID := 1 + StrToIntDef(VartoSTR(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(wlineid) from ' + TblBatch.TableName)),0) ;

   xTblRpBatch.First;
   BHlDt:=tblBatchFDEBIT.ReadOnly;
   BHlCr:=tblBatchFCREDIT.ReadOnly;
   tblBatchFDEBIT.ReadOnly:=False;
   tblBatchFCREDIT.ReadOnly:=False;
   NewRef:= Trim(edtNewRef.Text);
   While not xTblRpBatch.Eof do
   begin

    begin
      TblBatch.Append;
      if NewRef='' then
        tblBatchSReference.Value:=xTblRpBatchSReference.value
      else
      begin
        tblBatchSReference.Value:=NewRef;
      end;
      DecodeDate(xtblRpBatchDDate.Value,Annee,Mois,Jour);
      if Jour<vbDay then Jour:=vbDay;
      if jour>veDay then Jour:=veDay;
      tblBatchDDate.value:=EncodeDate(vYear,vMonth,Jour);
      tblBatchDAllocatedDate.value:= EncodeDate(vYear,vMonth,Jour);
      tblBatchSDescription.value:= xtblRpBatchSDescription.value + edtAddDesc.Text;
      tblBatchSACCOUNT.value:= xtblRpBatchSACCOUNT.value;
      tblBatchSTAX.value:= xtblRpBatchSTAX.value;
      tblBatchWTAXID.AsInteger := xTblRpBatchWTAXID.AsInteger ;
      tblBatchSCONTRAACCOUNT.value:=xtblRpBatchSCONTRAACCOUNT.value;
      tblBatchWCONTRAACCOUNTID.AsInteger := xTblRpBatchWCONTRAACCOUNTID.AsInteger ;
      tblBatchWLINEID.AsInteger := MaxID + xTblRpBatchWLINEID.AsInteger ;
      tblBatchWLINKEDID.AsInteger := MaxID + xTblRpBatchWLINKEDID.AsInteger ;

      if xtblRpBatchFDEBIT.value>0 then
        tblBatchFDEBIT.value:=xtblRpBatchFDEBIT.value
      else tblBatchFDEBIT.AsString:='';
      if xtblRpBatchFCREDIT.Value>0 then
        tblBatchFCREDIT.Value:=xtblRpBatchFCREDIT.Value
      else tblBatchFCREDIT.AsString:='';
      tblBatchFTaxAmount.Value:=xtblRpBatchFTaxAmount.Value;
      tblBatchBReconciled.Value:=xtblRpBatchBReconciled.Value;
      tblBatchBExclusive.Value:=xtblRpBatchBExclusive.Value;
      tblBatchFAmount.Value:=xtblRpBatchFAmount.Value;
      tblBatchWAccountID.Value:=xtblRpBatchWAccountID.Value;
      tblBatchWDOCID.AsInteger := 0 ;
      tblBatchWREPORTINGGROUP1ID.AsInteger := xTblRpBatchWREPORTINGGROUP1ID.AsInteger ;
      tblBatchWREPORTINGGROUP2ID.AsInteger := xTblRpBatchWREPORTINGGROUP2ID.AsInteger ;
      tblBatchSJOBCODE.AsString := xTblRpBatchSJOBCODE.AsString ;

      TblBatch.post;
    end;
    xTblRpBatch.next;
    if dmdatabase.tblBatchTypesBrepeatDetails.Value =1then
      NewRef:=_IncrementString(NewRef);
   end;
  end;
  ImpRpBatch:=false;
  xTblRpBatch.Close;
  tblBatchFDEBIT.ReadOnly:=BHlDt;
  tblBatchFCREDIT.ReadOnly:=BHlCr;
  xTblRpBatch.TableName:='';


end;

procedure TfmBatchEntry.RpbtCancelClick(Sender: TObject);
begin
 ImpRpBatch:=False;
 PnlRpBatch.Visible:=False;
end;

procedure TfmBatchEntry.RpbtOkKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  #27:Begin
       RpbtCancelClick(Sender);
       Key:=#0;
      end;
  end;

end;

procedure TfmBatchEntry.RpbtCancelKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
  #27:Begin
       RpbtCancelClick(Sender);
       Key:=#0;
      end;
  end;

end;

procedure TfmBatchEntry.RienEnter(Sender: TObject);
begin
  if PnlRpBatch.visible then
    lbYear.SetFocus;
end;

procedure TfmBatchEntry.tlbtnListClick(Sender: TObject);
begin
   F9Process('Print');
end;

procedure TfmBatchEntry.EdtMonthKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then
  Begin
    Key:=#0;
    LbYear.SetFocus;
  end;
  If Key=#27 then
  Begin
    Key:=#0;
    RpbtCancelClick(Sender);
  end;

end;

procedure TfmBatchEntry.LbYearKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then
  Begin
    Key:=#0;
    SelectNext(Screen.ActiveControl, True, True);
  end;
  If Key=#27 then
  Begin
    Key:=#0;
    RpbtCancelClick(Sender);
  end;

end;


procedure TfmBatchEntry.dbgridBatchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=80) and (ssCtrl in Shift) then begin
    F9Process('Print');
    Key:=0;
  end;


end;


 

Function TfmBatchEntry.CallLinks : Boolean ;
Var
  Value:Double;
begin
  result := false ;
  if InProcesOrClose then exit;
  if IsRepeatingBat then exit;
  if tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger then exit ;
  if not cxGrid1DBBandedTableView1Column1.Visible then exit ;
  dmDatabase.OpenItemRequest := BCheckOpenItem(tblBatchWaccountID.Value );

          if (tblbatch.State in [dsedit,DsInsert ]) then
        tblBatchBLinked.Value := ord(false);
    if dmDatabase.OpenItemRequest<>0 then
    begin
      InProcesOrClose:=True ;
      try
    //  if (tblBatch.State in [dsedit,dsinsert]) then
    //     tblBatch.post ;

      Value :=  RoundAmount( tblBatchFDEBIT.Value) - roundamount(tblBatchFCREDIT.Value);
      if Value<>0 then
      begin
        BatLinkedID := tblBatchWlineID.AsInteger;
        result := Not CanRunOpenItem(tblBatchSReference.AsString,TblbatchDDate.AsDateTime ,TblbatchWAccountID.asInteger,BatchCtrlID,dmDatabase.OpenItemRequest,Value,BatLinkedID,false,tblBatchSDESCRIPTION.AsString) ;
        if not (tblbatch.State in [dsedit,DsInsert ]) then
              tblBatch.edit ;
        tblBatchBLinked.Value := ord(ItemLiked);
      end;
        finally
          InProcesOrClose := False ;
        end;
      
    end;
end;



procedure TfmBatchEntry.PnlAliasExit(Sender: TObject);
begin
 search:=Trim(edtAlias.text);
  if (search<>'') and (search<>GetBatAlias(BatchCtrlID))  then
  begin
    ChangeBatAlias(BatchCtrlID,edtAlias.text);
     Caption := BatchCaption +' - ['+search+']';
      if IsRepeatingBat then
         begin
            Caption := Caption +' *** ' +  StringReplace(GetTextLang(25),'&','',[]) +' ***';
         end ;
  end;
end;

procedure TfmBatchEntry.edtAliasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
    SelectNext(Screen.ActiveControl,true,true);
    Key:=0;
  end;
end;

procedure TfmBatchEntry.RemoveBalanceEntrys;
begin
    While not tblBatch.Eof do
    begin
      if  tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger then
         tblBatch.Delete
      else
         tblBatch.Next;
    end;
end;



procedure TfmBatchEntry.RemoveEmptys;
var
 i : Integer ;
begin
    if ( tblBatch.state in [dsinsert,dsEdit]) then
      tblBatch.post ;

    InProcesOrClose := true ;
    i := 0 ;
    tblBatch.first ;
    tblBatch.DisableControls;
    try
    While not tblBatch.Eof do
    begin
      if (tblBatchFDEBIT.Asfloat = 0 ) and
         (tblBatchFCREDIT.Asfloat = 0) and
         (tblBatchSDescription.AsString = '') and
         (tblBatchSReference.AsString = '')
         then
        begin
        if tblBatch.RecordCount <> 1 then
         tblBatch.Delete  else
         tblBatch.Next;
         inc(i) ;
         IF i = 400 then exit ;
        end
      else
         tblBatch.Next;
    end;

    finally
       tblBatch.EnableControls;
       InProcesOrClose := false ;
    end;
end;

 

procedure TfmBatchEntry.FormCreate(Sender: TObject);
var
 i :  Integer ;

 AMenuitem : TMenuitem ;
begin
 aLookupgrid := TfmLookupgrids.Create(self) ;
 aLookupgrid.CloseUpNotify :=  onclosupNotifiy ;
 aLookupgrid.PopUpNotify :=   onPopupNotifiy ;
 DMTCCoreLink.AssignConnectionToChilds(self);
 if DMTCCoreLink.SimpleMode = 1  then
    begin
      Lookupdocument1.Visible := False ;
      Lookupdocwithammount1.Visible := False ;


    end;
 TDataBaseRoutines.SetDynamicFieldLengths(self);
  // done : Important to know we attach the beforePost to capture open item link and maby transfare some more checks to this event.
  // And we remeber if anny event was on it to recall that in our event making it save to use with other events on the Dataset

  tblBatchFDEBIT.ReadOnly := false ;
  tblBatchFCREDIT.ReadOnly := false ;
  tblBatchFCREDIT.Tag := 0 ;
  tblBatchFDEBIT.Tag := 0 ;

 ADMCoreData := TDMCoreData.Create(nil) ;
  // tblBatchBeforeScroll
  PayRollPluginLoaded := PluginExist('payroll.tpd') ;
 
  i := 1 ;
  While (DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHCOPY' + IntToStr(i)) <> '')
  and (DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHPAST' + IntToStr(i)) <> '')
  and (DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHCOPYNAME' + IntToStr(i)) <> '')
  do
    begin
         AMenuitem := TMenuitem.Create(GenCopyFrom) ;
         GenCopyFrom.Add(AMenuitem);
         AMenuitem.Caption := trim(DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHCOPYNAME' + IntToStr(i))) ;
         if StrToIntDef(AMenuitem.Caption,0) <> 0 then
            AMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AMenuitem.Caption,0)) ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := GenMenuCopy;

         AMenuitem := TMenuitem.Create(GenCopyto) ;
         GenCopyto.Add(AMenuitem);
         AMenuitem.Caption := trim(DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHCOPYNAME' + IntToStr(i))) ;
         if StrToIntDef(AMenuitem.Caption,0) <> 0 then
            AMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AMenuitem.Caption,0)) ;
         AMenuitem.tag := i ;
         AMenuitem.OnClick := GenMenuPast;
      inc(i);
    end;
  Copy1.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3293);  
  GenCopyFrom.Caption := DMTCCoreLink.GetTextLang(3291);
  GenCopyto.Caption := DMTCCoreLink.GetTextLang(3292);
  GenCopyFrom.Visible := GenCopyFrom.Count <> 0 ;
  GenCopyto.Visible := GenCopyto.Count <> 0 ;

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

   DMTCCoreLink.LoadImage(RpbtOk.Glyph,'Ok');
   DMTCCoreLink.LoadImage(RpbtCancel.Glyph,'Cancel');

end;

procedure TfmBatchEntry.GenMenuCopy(Sender: TObject);
var
 i : Integer ;
begin
 if tblBatch.IsEmpty then exit ;

 CopyData := DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHCOPY'+ IntToStr(TComponent(sender).Tag)),'WLINEID='+ tblBatchWLINEID.AsString+#13+#10 + 'BATCH='+ tblBatch.TableName ))  ;

 for i := 0 to GenCopyto.Count -1 do
    begin
      GenCopyto.Items[i].Enabled := GenCopyto.Items[i].Tag = TComponent(sender).Tag ;
    end;
end;

procedure TfmBatchEntry.GenMenuPast(Sender: TObject);
  var
  AMessage,SqlToExecute : String ;
  i,x : Integer ;
  AQuery : TuniQuery ;
begin
 if OSFMessageDlg('Replace old data for '  +  Tmenuitem(sender).Caption + '?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;

  AQuery := TuniQuery.create(self) ;
  try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;

 for i := 0 to  cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
  begin
    cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
    SqlToExecute := TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('BATCHPAST'+ IntToStr(TComponent(sender).Tag)),'DATA=' + VarToStr(CopyData) + #13 +#10 + 'WLINEID='+ tblBatchWLINEID.AsString+#13+#10 + 'BATCH='+ tblBatch.TableName  )  ;
    if pos('@@GO@@',SqlToExecute) = 0 then
      SqlToExecute := SqlToExecute + '@@GO@@' ;

    while pos('@@GO@@',SqlToExecute) > 1 do
      begin
       AQuery.SQL.Text:= trim(copy(SqlToExecute,1,pos('@@GO@@',SqlToExecute)-1));
       Delete(SqlToExecute,1,pos('@@GO@@',SqlToExecute)+ 5);
         for  x := 0 to AQuery.Params.Count -1 do
            AQuery.Params[x].Value := CopyData;
            AQuery.ExecSQL ;

      end;


   end;
  finally
    AQuery.free ;
  end;
 tblBatch.close  ;
 tblBatch.Open  ;

end;


procedure TfmBatchEntry.FormDestroy(Sender: TObject);
begin
 ADMCoreData.free ;
end;
 
 

procedure TfmBatchEntry.dbgridBatchDblClick(Sender: TObject);
begin
 if InLinkCall then exit ;
 InLinkCall := true ;
 try

 // Force Open item selection
 if (tblBatch.State in [dsedit,dsinsert]) then
   begin
     tblBatch.post ;
   end;
 if not tblBatch.IsEmpty then
  
 CallLinks ;
 ShowLinkForThisLine := false ;
 
  
   finally
     InLinkCall := false ;
  end;
end;

procedure TfmBatchEntry.BitBtn2Click(Sender: TObject);
begin
  Highlight(edtPeriod);
  if LbYear.ItemIndex=0 then
    ReturnLookup:=CallLookup(edtPeriod.Text, 9)
  else
    ReturnLookup:=CallLookup(edtPeriod.Text, 8);
  if ReturnLookup <> 'ESC' then
  begin
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ReturnLookup, []);
    DecodeDate(dmDatabase.tblPeriodsDEndDate.value,vYear,vMonth,veDay);
    DecodeDate(dmDatabase.tblPeriodsDStartDate.value,vYear,vMonth,vbDay);
    edtPeriod.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
    dmDatabase.tblPeriods.Close;
  end;
  BackNormal(edtPeriod);
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmBatchEntry.Lookupdocument1Click(Sender: TObject);
var
 LinkAmount : Double ;
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
  if tblBatch.IsEmpty then exit ;
    idDocType:=10;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    fmInvoiceEntryGrid.ListIsReadOnly := true ;
    if fmInvoiceEntryGrid.ShowModal = mrok then
      begin
         cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
         if not (tblbatch.State in [dsedit,DsInsert ]) then
         tblBatch.Edit ;

         tblBatchSCONTRAACCOUNT.AsString := GetAccountCode(DefaultContraAccount) ;
         tblBatchWCONTRAACCOUNTID.AsInteger := DefaultContraAccount ;
         tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(fmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ; ;
         tblBatchWAccountID.AsInteger := fmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;

         if tblBatchFAmount.AsFloat = 0 then
            begin
             LinkAmount := fmInvoiceEntryGrid.QDocHeadOPENAMOUNT.AsFloat ;
             if (idDocType in [10,13,14])then
             begin
             tblBatchFDEBIT.Asfloat := 0 ;
             tblBatchFCREDIT.Asfloat := abs(LinkAmount) ;
             tblBatchFAmount.AsFloat := -abs(LinkAmount)
             end else
             begin
             tblBatchFCREDIT.Asfloat := 0 ;
             tblBatchFDEBIT.Asfloat := abs(LinkAmount) ;
             tblBatchFAmount.AsFloat := abs(LinkAmount)
             end;
         end;
         If tblBatchSDescription.AsString = '' then
            tblBatchSDescription.AsString := trim(fmInvoiceEntryGrid.QDocHeadSDocNo.AsString +' ' + fmInvoiceEntryGrid.QDocHeadSReference.AsString) ;
         abort ;    
      end;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;

end;

procedure TfmBatchEntry.Lookupdocwithammount1Click(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
  if tblBatch.IsEmpty then exit ;
  if tblBatchFAmount.AsFloat = 0 then exit ;

    idDocType:=10;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    fmInvoiceEntryGrid.ListIsReadOnly := true ;
    fmInvoiceEntryGrid.LookupFrom := 2 ;
    fmInvoiceEntryGrid.LookupAmount := abs(tblBatchFAmount.AsFloat) ;
    if fmInvoiceEntryGrid.ShowModal = mrok then
      begin
         cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
         if not (dmdatabase.tblbatch.State in [dsedit,DsInsert ]) then
         tblBatch.Edit ;
         tblBatchSCONTRAACCOUNT.AsString := GetAccountCode(DefaultContraAccount) ;
         tblBatchWCONTRAACCOUNTID.AsInteger :=  DefaultContraAccount ;
         tblBatchSACCOUNT.AsString := AddDashInAccCodeNoPRefix(fmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ; ;
         tblBatchWAccountID.AsInteger := fmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;
         if tblBatchFAmount.AsFloat = 0 then
            begin
             if (idDocType in [10,13,14])then
             begin
             tblBatchFDEBIT.Asfloat := 0 ;
             tblBatchFCREDIT.Asfloat := abs(fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat) ;
             tblBatchFAmount.AsFloat := -fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat ;
             end else
             begin
             tblBatchFCREDIT.Asfloat := 0 ;
             tblBatchFDEBIT.Asfloat := abs(fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat) ;
             tblBatchFAmount.AsFloat := fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat ;
             end;

            end;
         If tblBatchSDescription.AsString = '' then
            tblBatchSDescription.AsString := trim(fmInvoiceEntryGrid.QDocHeadSDocNo.AsString +' ' + fmInvoiceEntryGrid.QDocHeadSReference.AsString)
      end;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;

end;


procedure TfmBatchEntry.Lookupdebtor1Click(Sender: TObject);

var
  fmDebtor: TfmDebtor;
begin
  if tblBatch.IsEmpty then exit ;

    fmDebtor := TfmDebtor.Create(self);
      try
      fmDebtor.UseCreditor:= Lookupdebtor1 <> Sender ;
      fmDebtor.AsFindScreen(True) ;
      SetUpForm(fmDebtor);
      if fmDebtor.ShowModal <> mrok then exit ;
      if fmDebtor.QDebtorCreditor.IsEmpty then exit ;
      aLookupgrid.datarefresh ;
      cxGrid1DBBandedTableView1SREFERENCE.FocusWithSelection;
       if not (tblbatch.State in [dsedit,DsInsert ]) then
        tblBatch.Edit ;
        tblBatchWAccountID.AsInteger := fmDebtor.QDebtorCreditorWAccountID.AsInteger ;
        tblBatchSACCOUNT.AsString := AddDashInAccCode(fmDebtor.QDebtorCreditorSACCOUNTCODE.AsString) ;
        tblBatch.Post ;
      finally
      FreeAndNil(fmDebtor);

      end;
end;

procedure TfmBatchEntry.TranslateColumns;

begin
 cxGrid1DBBandedTableView1SREFERENCE.Caption := GetTextLang(607);
 cxGrid1DBBandedTableView1SDESCRIPTION.Caption :=  GetTextLang(178);
 cxGrid1DBBandedTableView1SJOBCODE.Caption :=  GetTextLang(3556);
   cxGrid1DBBandedTableView1WACCOUNTID.Caption:=   GetTextLang(608);
   cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption:=   GetTextLang(379 );
 
 cxGrid1DBBandedTableView1WTAXID.Caption:=  GetTextLang(609);
 cxGrid1DBBandedTableView1FDEBIT.Caption :=  GetTextLang(211);
 cxGrid1DBBandedTableView1FCREDIT.Caption:= GetTextLang(212);
 cxGrid1DBBandedTableView1WREPORTINGGROUP1ID.Caption:= TDataBaseRoutines.GetTypeDescription(1002);
 cxGrid1DBBandedTableView1WREPORTINGGROUP2ID.Caption:= TDataBaseRoutines.GetTypeDescription(1003);
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

      Label3.Caption := cxGrid1DBBandedTableView1WACCOUNTID.Caption;
      LContraAccount.Caption :=  cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Caption ;

end;

procedure TfmBatchEntry.dbgridBatchTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
 if (dmDatabase.tblBatch.State in [dsedit,dsinsert]) then
    dmDatabase.tblBatch.post ;
 if dmDatabase.tblBatch.FieldByName(AFieldName)  <> nil then
   if dmDatabase.tblBatch.IndexFieldNames = AFieldName then
     dmDatabase.tblBatch.IndexFieldNames := AFieldName + '  desc'
   else
   dmDatabase.tblBatch.IndexFieldNames := AFieldName ;

end;

procedure TfmBatchEntry.DBLCBCostgroup2Exit(Sender: TObject);
begin
  (sender as tcontrol).Visible := false ;
end;


procedure TfmBatchEntry.PageControl1Change(Sender: TObject);
var
 aFormReverseBatch : TFormReverseBatch ;
begin
 if PageControl1.ActivePageIndex =1 then
  begin
   if  PageControl1.ActivePage.Tag = 0 then
   begin
     aFormReverseBatch := TFormReverseBatch.Create(PageControl1.ActivePage) ;
     aFormReverseBatch.Panel1.Visible := False ;
     aFormReverseBatch.BitBtn1.Visible := false ;
     aFormReverseBatch.BitBtn2.Visible := false ;
     aFormReverseBatch.TSDocuments.TabVisible := false ;
     aFormReverseBatch.ID.Visible := false ;
     aFormReverseBatch.Button1.Visible := false ;
     aFormReverseBatch.BReDoAll.Visible := false ;
     aFormReverseBatch.CBNoDocPosts.Visible := false ;
     aFormReverseBatch.CBNoDocPosts.Checked := false ;
     aFormReverseBatch.EFindId.Visible := false ;
     aFormReverseBatch.BDeleteBatch.Visible := false ;

     aFormReverseBatch.BatchListAndClause := '  and BatCon.WBatchTypeId = '  +  IntToStr(dmDatabase.BatchType);
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

procedure TfmBatchEntry.Lookuptransactions1Click(Sender: TObject);
var
 Value : Double ;
 Linked : Boolean ;
begin
 InLinkCall := true ;
 dmDatabase.tblBatch.DisableControls ;
 try
      Value := RoundAmount(tblBatchFDEBIT.Value - tblBatchFCREDIT.Value);
      { Bugs : OpenItem Screen not showing for dt-debtor or Ct-Creditor
       Value should keep the sign and this will be remove in CanRunOpenItem}
        BatLinkedID := tblBatchWlineID.AsInteger;
        // Unlink line if exists
        UnlinkLine(BatLinkedID);
                    tblBatch.edit ;
            tblBatchBLINKED.Clear ;
        Linked := Not CanRunOpenItem(tblBatchSReference.AsString,TblbatchDDate.AsDateTime ,TblbatchWAccountID.asInteger,BatchCtrlID,dmDatabase.OpenItemRequest,Value,BatLinkedID,false,tblBatchSDESCRIPTION.AsString,true ) ;
        if (OpenItemAllocatedAmount <> 0) then
            begin
               if OpenItemAllocatedAmount < 0 then
                  begin
                    tblBatch.Edit ;
                    tblBatchFAMOUNT.AsFloat := abs( OpenItemAllocatedAmount) ;
                    tblBatchFDEBIT.AsFloat := abs(OpenItemAllocatedAmount);
                    tblBatchFCREDIT.AsFloat := 0;

                    tblBatch.post ;
                    ShowLinkForThisLine := false ;
                  end else
                   begin
                    tblBatch.Edit ;
                    tblBatchFAMOUNT.AsFloat := - abs(OpenItemAllocatedAmount) ;
                    tblBatchFCREDIT.AsFloat := abs(OpenItemAllocatedAmount);
                    tblBatchFDEBIT.AsFloat := 0;
                    tblBatch.post ;
                    ShowLinkForThisLine := false ;
                  end ;
            end;
        tblBatch.edit ;
        tblBatchBLinked.Value := ord(ItemLiked);
        ShowLinkForThisLine := false ;
   Application.ProcessMessages ;
   finally
     dmDatabase.tblBatch.EnableControls ;
     InLinkCall := false ;
   end;
end;

procedure TfmBatchEntry.loadPlugins;

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


procedure TfmBatchEntry.OnMenuPluginAct1(Sender: TObject);
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

procedure TfmBatchEntry.InitPluginsMenu;
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
procedure TfmBatchEntry.cxGrid1DBBandedTableView1CustomDrawCell(
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
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1EditKeyPress(
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

procedure TfmBatchEntry.cxGrid1DBBandedTableView1FocusedItemChanged(
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

procedure TfmBatchEntry.cxGrid1DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;
 
 ShowLinkForThisLine := True ;




end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1FDEBITPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if cxGrid1DBBandedTableView1FDEBIT.Focused then
     begin
      //  if tblBatchBEXCLUSIVE.AsInteger = 1 then
     //     tblBatchFAMOUNT.AsFloat := StrToFloat(VarToStr(DisplayValue)) * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)
     //   else
        tblBatchFAMOUNT.AsFloat := StrToFloatDef(VarToStr(DisplayValue),0);
     end else
  if cxGrid1DBBandedTableView1FCREDIT.Focused then
     begin
     //   if tblBatchBEXCLUSIVE.AsInteger = 1 then
     //     tblBatchFAMOUNT.AsFloat := (-  StrToFloat(VarToStr(DisplayValue)))  * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)
    //    else
        tblBatchFAMOUNT.AsFloat := - StrToFloatDef(VarToStr(DisplayValue),0);
     end;
if  tblBatchFAMOUNT.AsFloat < 0 then
     begin
       tblBatchFDEBIT.AsFloat := 0 ;
        if tblBatchBEXCLUSIVE.AsInteger = 1 then
       tblBatchFCREDIT.AsFloat := (- tblBatchFAMOUNT.AsFloat) * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)
       else
       tblBatchFCREDIT.AsFloat := - tblBatchFAMOUNT.AsFloat ;
     end else
     begin
       tblBatchFCREDIT.AsFloat := 0 ;
        if tblBatchBEXCLUSIVE.AsInteger = 1 then
        tblBatchFDEBIT.AsFloat := tblBatchFAMOUNT.AsFloat * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)
        else
       tblBatchFDEBIT.AsFloat := tblBatchFAMOUNT.AsFloat ;
     end;    
end;


procedure TfmBatchEntry.tblBatchAfterScroll(DataSet: TDataSet);
begin
 GetRefTotals ;
end;

procedure TfmBatchEntry.tblBatchAfterInsert(DataSet: TDataSet);
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

procedure TfmBatchEntry.tblBatchBeforeClose(DataSet: TDataSet);
begin
 if ( DataSet.State in [dsedit,dsInsert]) then
      DataSet.post ;
end;

procedure TfmBatchEntry.tblBatchBeforeOpen(DataSet: TDataSet);
begin
   if DMTCCoreLink.GetFieldLength((DataSet as TuniTable).TableName,'SDESCRIPTION') <>  DMTCCoreLink.MessageLength then
    begin
       TDataBaseRoutines.ExecSql('ALTER TABLE ' +(DataSet as TuniTable).TableName +' ALTER SDESCRIPTION TYPE varChar('+IntToStr(DMTCCoreLink.MessageLength)+'); ');
    end;
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'select first 1 * from ' +(DataSet as TuniTable).TableName );
end;

procedure TfmBatchEntry.tblBatchAfterPost(DataSet: TDataSet);
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

procedure TfmBatchEntry.tblBatchBeforePost(DataSet: TDataSet);
begin
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
         if not (tblBatchBLinked.Asinteger = 1) then
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

procedure TfmBatchEntry.tblBatchCalcFields(DataSet: TDataSet);
begin
tblBatchISBALANCE.AsInteger := Ord(tblBatchWLINEID.AsInteger <> tblBatchWLINKEDID.AsInteger  ) ;
end;

procedure TfmBatchEntry.tblBatchWACCOUNTIDValidate(Sender: TField);
var Account : Integer ;
begin
if InRowChanged then
exit ;
if not cxGrid1DBBandedTableView1WACCOUNTID.Focused then
 exit ;
InRowChanged := True ;
try

  if BrememberContra then
   if Sender.AsInteger <> 0 then
    if cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Visible then
     begin
      tblBatchWCONTRAACCOUNTID.AsInteger := ReadReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( tblBatchWACCOUNTID.AsInteger) + 'WContraAccount',0).AsInteger ;

      if BRememberTax then
         tblBatchWTAXID.AsInteger :=ReadReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( tblBatchWCONTRAACCOUNTID.AsInteger) + 'WAccountTax',0).AsInteger

     end;

  if NOT BrememberContra OR (tblBatchWCONTRAACCOUNTID.AsInteger = 0) then
     if cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Visible then
       begin
         Account := TDatabaseDebtorCreditorRoutines.GetDefaultContraOnAccount(tblBatchWACCOUNTID.AsInteger) ;
         if Account <> 0 then
            begin
//              tblBatch.edit ;
              tblBatchWCONTRAACCOUNTID.AsInteger := Account ;
                if cxGrid1DBBandedTableView1WTAXID.Visible then
                   begin
                    Account := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(tblBatchWACCOUNTID.AsInteger) ;
                       if Account <> 0 then
                        tblBatchWTAXID.AsInteger := Account ;
                   end;
            end;
       end;

  finally
  InRowChanged := False ;
end;
end;

procedure TfmBatchEntry.tblBatchWCONTRAACCOUNTIDValidate(Sender: TField);
var
  Account : Integer ;
begin
  if sender.AsInteger <> 0 then
   if cxGrid1DBBandedTableView1WCONTRAACCOUNTID.Focused then

     begin
      if BRememberTax then
         tblBatchWTAXID.AsInteger :=ReadReportOp(TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( tblBatchWCONTRAACCOUNTID.AsInteger) + 'WAccountTax',0).AsInteger
       else
        begin
        if cxGrid1DBBandedTableView1WTAXID.Visible then
         if not cxGrid1DBBandedTableView1WTAXID.Focused then

             begin
              Account := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(tblBatchWACCOUNTID.AsInteger) ;
                 if Account <> 0 then
                  tblBatchWTAXID.AsInteger := Account ;
             end;
        end;
    end;
end;

procedure TfmBatchEntry.tblBatchWTAXIDValidate(Sender: TField);
begin
if (Sender.IsNull ) or (Sender.OldValue <> Sender.NewValue)  then
begin
 UnlinkLine(tblBatchWLINEID.AsInteger);
 tblBatch.edit ;
 tblBatchBLINKED.Clear ;
end;
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
 Sub : String ;
begin
if key = vk_return then
 if (tblBatch.State in [dsedit,dsInsert]) then
   if cxGrid1DBBandedTableView1SDESCRIPTION.Focused then
        if Length(tblBatchSDESCRIPTION.AsString) < 11 then
        begin
         sub :=  TDataBaseLedgerRoutines.GetAbreviat(tblBatchSDESCRIPTION.AsString) ;
         if Sub <> '' then
           begin
              tblBatchSDESCRIPTION.AsString := Sub;
           if cxGrid1DBBandedTableView1SDESCRIPTION.Editing then
             cxGrid1DBBandedTableView1SDESCRIPTION.EditValue := tblBatchSDESCRIPTION.AsString ;
           end;
         end;
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1WACCOUNTIDGetDisplayText(
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

procedure TfmBatchEntry.cxGrid1DBBandedTableView1WCONTRAACCOUNTIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if (VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINEID.Index]) <> VarToStr(ARecord.Values[cxGrid1DBBandedTableView1WLINKEDID.Index])) then
    AText :=  DMTCCoreLink.GetTextLang(2142);
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1EditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
  var
   Account : Integer ;
   aAmt : Double ;
begin
 if (AItem = cxGrid1DBBandedTableView1FDEBIT) or (AItem =  cxGrid1DBBandedTableView1FCREDIT) or (AItem = cxGrid1DBBandedTableView1WACCOUNTID) or (AItem = cxGrid1DBBandedTableView1WTAXID)  then
       if tblBatchBLINKED.AsInteger = 1 then
        begin
            UnlinkLine(tblBatchWLINEID.AsInteger) ;
            tblBatch.edit ;
            tblBatchBLINKED.Clear ;
         end;


 if  (AItem = cxGrid1DBBandedTableView1WTAXID)   then
     begin
        aAmt := tblBatchFAMOUNT.AsFloat;
        tblBatch.Edit ;
        if (tblBatchBEXCLUSIVE.AsInteger = 1) then
         begin
        if aAmt > 0 then
           tblBatchFDEBIT.AsFloat := aAmt * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger)
          else
         tblBatchFCREDIT.AsFloat := (-aAmt) * TDataBaseRoutines.GetTaxRateOnId(tblBatchWTAXID.AsInteger) ;
         end else
         begin
          if aAmt > 0 then
           tblBatchFDEBIT.AsFloat := aAmt
          else
         tblBatchFCREDIT.AsFloat := (-aAmt)   ;
         end;
     end  ;
if AItem = cxGrid1DBBandedTableView1WCONTRAACCOUNTID then
  begin
     if tblBatchWTAXID.AsInteger = 0 then
        if cxGrid1DBBandedTableView1WTAXID.VisibleForCustomization then
           begin
            Account := TDatabaseDebtorCreditorRoutines.GetDefaultTaxIDOnAccount(tblBatchWCONTRAACCOUNTID.AsInteger) ;
               if Account <> 0 then
                tblBatchWTAXID.AsInteger := Account ;
           end;

  end;
if AItem = cxGrid1DBBandedTableView1WACCOUNTID then
  begin
  

  end;

 aLookupgrid.lookAccount := '' ;
 aLookupgrid.lookGroup1 := '' ;
 aLookupgrid.lookContra := '' ;
 aLookupgrid.lookGroup2 := '' ;
 aLookupgrid.lookjob := '' ;
 aLookupgrid.lookTax := '' ;
 lFind.Caption := '' ;
 ShowLinkForThisLine := True ;
 GetRefTotals ;
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1Editing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
 AAllow := tblBatchWLINEID.AsInteger = tblBatchWLINKEDID.AsInteger ;

end;
procedure TfmBatchEntry.onPopupNotifiy(Sender: Tobject);
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
procedure TfmBatchEntry.onclosupNotifiy(Sender: Tobject);

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

procedure TfmBatchEntry.createaccount1Click(Sender: TObject);
begin
 if tblBatch.State in [dsedit,dsinsert] then
                 tblBatch.post ;
            try
             // ReShow:=True;
             SendToBack ;
             SelectAccType(0);
             aLookupgrid.datarefresh ;
             BringToFront
          finally

          end;
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1InitEditValue(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var AValue: Variant);
begin
 if AItem = cxGrid1DBBandedTableView1FDEBIT then
     begin
       if tblBatchFAMOUNT.AsFloat > 0 then
       AValue :=  tblBatchFAMOUNT.AsFloat  ;
     end else
  if AItem = cxGrid1DBBandedTableView1FCREDIT then
     begin
      if tblBatchFAMOUNT.AsFloat < 0 then
      AValue :=  -tblBatchFAMOUNT.AsFloat  ;
     end;
end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
 if dmDatabase.DoAutoInc then
    writereportop(IntToStr(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger)  +'AutoIncNr', varToStr(DisplayValue));

end;

procedure TfmBatchEntry.cxGrid1DBBandedTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   dbgridBatchDblClick(self);
end;

procedure TfmBatchEntry.tblBatchAfterDelete(DataSet: TDataSet);
begin
 GetRefTotals ;
end;

end.


