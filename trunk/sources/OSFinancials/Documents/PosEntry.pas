(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn                                                                                 
  Released under the GNU General Public License
*)
unit PosEntry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids,   LCD_Lab, ExtCtrls,
  PosRoutines,StdCtrls,tcashclasses, TcVariables,Mask,    DB,Buttons, Menus, XRoutines,
    DBAccess , Uni,UosfResources, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxCurrencyEdit, cxButtonEdit,IOUtils;
const
 dispTypeClear = 0;
 dispTypeLine = 1;
 dispTypeTotal = 2;
 dispTypeCashback = 3;
 dispTypeCancel = 4;
 dispTypeDeleteRow = 5; 

type
  TfmPosInvoiceEntry = class(TForm)
    ToolBar1: TToolBar;
    tblSearch: TToolButton;
    Panel1: TPanel;
    PosLcd: TLCDLabel;
    StatusBar: TStatusBar;
    Panel2: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    lblCustName: TLabel;
    Shape2: TShape;
    tblCustomer: TToolButton;
    tblDeleteLine: TToolButton;
    tblEdit: TToolButton;
    tlbDeleteAll: TToolButton;
    tlbPayments: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    tlbFloat: TToolButton;
    PnlFloat: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Shape3: TShape;
    RGFloatMovement: TRadioGroup;
    BtnOk: TBitBtn;
    BtnCancelFloat: TBitBtn;
    Label5: TLabel;
    Edit3: TEdit;
    Shape4: TShape;
    PopupMenu1: TPopupMenu;
    CashUp2: TMenuItem;
    ReprintLastInvoice1: TMenuItem;
    CloseShift1: TMenuItem;
    InclusiveExclusiveMode1: TMenuItem;
    Report1: TMenuItem;
    OpenDrawer1: TMenuItem;
    tblProcess: TToolButton;
    ToolButton3: TToolButton;
    Timer1: TTimer;
    PMultyUserDebug: TPanel;
    BStartStop: TButton;
    ETimerInterval: TEdit;
    Label6: TLabel;
    EMaxInvoices: TEdit;
    Label7: TLabel;
    EBarcodeToUse: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    NR: TLabel;
    LEAccountNr: TLabel;
    EAccountNr: TEdit;
    Invoice: TToolButton;
    CBAccountFromTo: TCheckBox;
    BGetInvAmount: TButton;
    PopupMenu2: TPopupMenu;
    Adminoverride1: TMenuItem;
    PPassword: TPanel;
    EAdminPassword: TEdit;
    BOkpassword: TButton;
    Label10: TLabel;
    BAccountNr: TBitBtn;
    CBSalesMan: TComboBox;
    LSalesman: TLabel;
    Recievepayemt1: TMenuItem;
    Useweightdish1: TMenuItem;
    TimerSetPosDisplay: TTimer;
    TAutologout: TTimer;
    TSavelist: TToolButton;
    cbListSelect: TComboBox;
    BSelectList: TButton;
    BDeleteList: TButton;
    BRename: TButton;
    BCopy: TButton;
    ScrollBox1 : TScrollbox ;
    ZQuery1: TuniQuery;
    edtBarCode: TcxComboBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WLINEID: TcxGridDBColumn;
    cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid1DBTableView1SACCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1FDEBIT: TcxGridDBColumn;
    cxGrid1DBTableView1FAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1FCREDIT: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure tblSearchClick(Sender: TObject);
    procedure dbStockLookupDropDown(Sender: TObject);
    procedure tlbDeleteAllClick(Sender: TObject);
    procedure tblEditClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tlbPaymentsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tblDeleteLineClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tblCustomerClick(Sender: TObject);
    procedure edtBarCodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tlbFloatClick(Sender: TObject);
    procedure BtnCancelFloatClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdPosEntryCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CashUp2Click(Sender: TObject);
    procedure CloseShift1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure OpenDrawer1Click(Sender: TObject);
    procedure dbgrdPosEntryKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure BStartStopClick(Sender: TObject);
    procedure CBAccountFromToClick(Sender: TObject);
    procedure InvoiceClick(Sender: TObject);
    procedure BGetInvAmountClick(Sender: TObject);
    procedure Adminoverride1Click(Sender: TObject);
    procedure BOkpasswordClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PPasswordExit(Sender: TObject);
    procedure EAdminPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure BAccountNrClick(Sender: TObject);
    procedure CBSalesManChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Recievepayemt1Click(Sender: TObject);
    procedure dtBarCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdPosEntryKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Useweightdish1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerSetPosDisplayTimer(Sender: TObject);
    procedure ReprintLastInvoice1Click(Sender: TObject);
    procedure dbgrdPosEntryRowChanged(Sender: TObject);
    procedure dbgrdPosEntryMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure TAutologoutTimer(Sender: TObject);
    procedure tblProcessMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TSavelistClick(Sender: TObject);
    procedure BSelectListClick(Sender: TObject);
    procedure BDeleteListClick(Sender: TObject);
    procedure BRenameClick(Sender: TObject);
    procedure BCopyClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1SACCOUNTPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1SREFERENCEPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    PosBatchName : String;
    PosPymtBatchName : String;
    Contra : String;
    StkItem : TStockRec;
    Payed,ShowOutOfStockMessage : Boolean;
    TmpValue : Real;
    MsgStockID,PolDisplayType,Polstep:Integer;
    aComPort : TComPort ;
    WeightCurline : Boolean ;
    ExternalSalesOn : Boolean;
    CurrentListName : String ;
    ListBaseFolder : AnsiString ;
    AListCollection : TSQLList ;
    procedure ScanFolder ; 
    Function iSACCOUNTOk:Boolean;
    Procedure AddItem(NewLine:Boolean);
    Procedure NewInvoice;
    Procedure PrintDoc;
    Procedure ReplaceLines(line1,line2,line3:String);
    Procedure RefreshDiplay;
    Procedure PrintToPole(DispType : Integer;LineId,Line1,Line2:String);
    Procedure PrintToSoftwarePole(DispType : Integer;LineId,Line1:String);
    procedure myReceiveWeightDishProc(Data: string);
    procedure LoadFile;
  public
    { Public declarations }
    TRN_CreditCard,TRN_Account,TRN_Voucher,TRN_Cheque,
    TRN_Cash,TRN_CCnr,TRN_CCName,TRN_CCType,TRN_CCExpDate ,
    TRN_InvCreditCard,TRN_InvAccount,TRN_InvVoucher,
    TRN_InvCheque,TRN_InvCash,TRN_SalesPerson,
    TRN_DefaultAccountNotSet,TRN_NewInvoice,
    TRN_MSG_Close,TRN_MSG_DefaultSetup,TRN_MSG_Post,TRN_MSG_Change,TRN_MSG_Tanks : String ;

    TotalAmount,FAmtPayed,FAmtChange:real;
    PasswordUsed,OneClickDeb  :Boolean ;
    Function CalcAmount:Real;
    Procedure ClearFloatMvt;
    procedure tblBatchBeforePost(DataSet: TDataSet);
    procedure InitBatchTables ;
  end;

var
  fmPosInvoiceEntry: TfmPosInvoiceEntry;
  PymtMethod : Array[0..4] of Boolean = (False,false,false,false,false);
  PymtAmount : Array[0..4] of Real =(0,0,0,0,0);
  SaveMainFormState : TWindowState;
implementation

uses Main,Database, PosSetup, GlobalFunctions, PosPayments, NewLookup,
  PosInvoiceInfo, PosCashup, DatabaseAccess,FreeReportsUnit, Lookup,
  InvoiceEntryGrid, LanguageChoice,  OSFGeneralRoutines,
  UDMTCCoreLink, PosReportOptions, Calculator, UDmQuantumGridDefs;

{$R *.dfm}

procedure TfmPosInvoiceEntry.myReceiveWeightDishProc(Data: string);
begin
 if WeightCurline then
  if cxGrid1DBTableView1.Controller.FocusedColumn <> nil then
   if cxGrid1DBTableView1.Controller.FocusedColumn = cxGrid1DBTableView1FDEBIT then
     if  (dmDatabase.tblBatch.state in [dsedit,Dsinsert]) then
       if Data <> '' then
       begin
         dmDatabase.tblBatchFDEBIT.AsString := StripNotNumericReturnZero(StringReplace(Data,'.',DecimalSeparator,[rfreplaceAll])) ;
       end;
end;

Function PosSum:Real;
var
 ISEdit : Boolean ;
begin
  ISEdit := (dmDatabase.tblBatch.State in [dsEdit,dsInsert]);
  if ISEdit then dmDatabase.tblBatch.Post;
  dmDatabase.qGenII.DisableControls;
  dmDatabase.qGenII.Close;
  dmDatabase.qGenII.Sql.Text:='Select Sum(FAmount) As FSum from '+dmDatabase.tblBatch.TableName;
  dmDatabase.qGenII.Open;
  Result := dmDatabase.qGenII.FieldByName('FSum').AsFloat;
  dmDatabase.qGenII.Close;
  dmDatabase.qGenII.EnableControls;
  if ISEdit then dmDatabase.tblBatch.edit ;
end;

Function PosPymtMethods(BCash,BCCard,BAccount,BVoucher,BElse:Boolean):integer;
begin
  Result := 0;
  if BCash then
      Result := 16;
  if BCCard then
      Result := Result + 8 ;
  if BAccount then
      Result :=  Result + 4;
  if BVoucher then
      Result := Result + 2 ;
  if BElse then
      Result := Result + 1;
end;

Function PosPymtCode(Index:integer):Integer;
begin
  Case Index of
   0:Result :=16;
   1:Result :=8;
   2:Result :=4;
   3:Result :=2;
   4:Result :=1;
  end;
end;

Function ZipPymtMethods:Integer;
begin
  Result:=PosPymtMethods(PymtMethod[0],PymtMethod[1],PymtMethod[2],PymtMethod[3],PymtMethod[4]);
end;
Procedure POSTransAvailableLink(Date: Integer; Time: Integer;
                       TransNum: Integer;
                       TransType: Integer;
                       Dispenser: Integer; Hose: Integer;
                       Grade: Integer; UnitPrice: Double;
                       Volume: Double; Amount: Double);
begin
  fmPosInvoiceEntry.StkItem.SSTOCKCODE  := inttostr(Grade);
  LocateStockItemOnCode(fmPosInvoiceEntry.StkItem);
  fmPosInvoiceEntry.StkItem.SDescription :=  ' Grade '+IntToStr(Grade)+'/Disp'+IntToStr(Dispenser);
  fmPosInvoiceEntry.StkItem.FPrice1  := UnitPrice;
  fmPosInvoiceEntry.AddItem(True);
  dmDatabase.tblBatch.Edit;
  dmDatabase.tblBatchFDEBIT.Value := Volume;
  dmDatabase.tblBatchFAmount.ASFLoat := Amount;
  dmDatabase.tblBatchSreference.ASString := IntToStr(Grade);
  dmDatabase.tblBatchsProfile.AsString := Chr(TransType)+IntToStr(Dispenser);
  dmDatabase.tblBatch.Post;
  fmPosInvoiceEntry.RefreshDiplay;
  fmPosInvoiceEntry.ExternalSalesOn := True;
end;


procedure TfmPosInvoiceEntry.FormCreate(Sender: TObject);

 Var Lvl : Integer ;
begin
 BtnOk.Caption := DMTCCoreLink.GetTextLang(167);
 BtnCancelFloat.Caption := DMTCCoreLink.GetTextLang(168);

 OneClickDeb := DMTCCoreLink.ReadNwReportOp('POSONECLICKDEB',False);


  AListCollection := TSQLList.Create(nil) ;
  ListBaseFolder := IOUtils.TPath.GetTempPath;
  ListBaseFolder := IncludeTrailingPathDelimiter(ListBaseFolder) + 'osFPos' + IntToStr(CurrentUser) + PathDelim ;
  ForceDirectories(ListBaseFolder);
  ScanFolder ;

  dmDatabase.tblBatch.BeforePost := tblBatchBeforePost ;
 // inherited;
// done : Pieter Sometimes (liek after cleaning all data ) it gives an error saying
// it cant preform this on a close dataset. So i make sure its losed and opened again.
// dmDatabase.tblBatchRefTotals.close;
 // Sylvain: Table name not difine yet.
// dmDatabase.tblBatchRefTotals.open;
// done : Pieter addad support for MultyuserDebug
     DOCCantSellOutOfStock    :=  ReadReportOp('STKCantSellOOS',false).AsBoolean;
    Caption := GetTextLang(1714);
    Label2.Caption :=  GetTextLang(1774);
     RGFloatMovement.Caption :=  GetTextLang(1713);
     RGFloatMovement.Items[0] := GetTextLang(1715);
     RGFloatMovement.Items[1] := GetTextLang(1716);
     Label1.Caption :=  GetTextLang(1717);
     TRN_SalesPerson := GetTextLang(1718);
     Label5.Caption :=  GetTextLang(1719);
     Label3.Caption :=  GetTextLang(1712);
     Label4.Caption := GetTextLang(1708);
     TRN_DefaultAccountNotSet := GetTextLang(1720);
     TRN_NewInvoice := GetTextLang(1721);
     TRN_InvCreditCard := GetTextLang(1722);
     TRN_InvAccount := GetTextLang(1723);
     TRN_InvVoucher := GetTextLang(1724);
     TRN_InvCheque := GetTextLang(1725);
     TRN_InvCash  := GetTextLang(1726);
     TRN_CreditCard := GetTextLang(1727);
     TRN_Account   := GetTextLang(1728);
     TRN_Voucher  := GetTextLang(1729);
     TRN_Cheque    := GetTextLang(1730);
     TRN_Cash     := GetTextLang(1731);
     TRN_CCnr      := GetTextLang(1732);
     TRN_CCName    := GetTextLang(1733);
     TRN_CCType    := GetTextLang(1734);
     TRN_CCExpDate  := GetTextLang(1735);

     TRN_MSG_Close   := GetTextLang(1736);
     TRN_MSG_DefaultSetup  := GetTextLang(1737);
     TRN_MSG_Post    := GetTextLang(1738);
     TRN_MSG_Change  := GetTextLang(1739);
     TRN_MSG_Tanks   := GetTextLang(1740);

   PMultyUserDebug.Visible := lowercase(ParamStr(2)) = 'true';


  fmPosInvoiceInfo:=TfmPosInvoiceInfo.Create(Self);

  LoadPosInputVars;
  MsgStockID:=-1;

  TotalAmount:=0;
  {Create Batch File}
  InitBatchTables ;
  Application.ProcessMessages;
  dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
  dmDatabase.tblBatchFCREDIT.Readonly:=False;
  Lvl := 0 ;
  SalesPerson := TDataBaseRoutines.GetNesteldNameFromGroupID(SalesPerID,Lvl) ;
  StatusBar.Panels[1].Text  :=  TRN_SalesPerson + SalesPerson ;

  cxGrid1DBTableView1SACCOUNT.Options.Editing :=  PosChPrice;
  cxGrid1DBTableView1FDEBIT.Options.Editing := PosChQty;
  if Not (PosChPrice AND PosChQty) then
  begin
    cxGrid1DBTableView1FCREDIT.Options.Editing  :=  PosChPrice;
     cxGrid1DBTableView1FAMOUNT.Options.Editing  :=  PosChPrice;
  end;
  SaveMainFormState := fmMain.WindowState;
 
end;



procedure TfmPosInvoiceEntry.FormShow(Sender: TObject);
var
 pOutput : array [0..1536] of char ;
 PpOutput : Pchar ;
 aTest : String ;
begin


  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancelFloat.Glyph,'Cancel');


  TSavelist.Visible := DMTCCoreLink.ReadNwReportOp('PLCUSTHOLD_ON',false);

  TAutologout.Interval :=  (DMTCCoreLink.ReadSysParam('POSAUTOLOGOUT',0,0) * 1000) ;
  dmDatabase.CalledFromBatch:=False;
  AExternalPinIsReady := false ;
  TDatabaseRegistyRoutines.ReadFormPos(self,'');
  dmDatabase.tblBatch.IndexFieldNames := 'WlineId' ;
  PolDisplayType  := readSysParam('SPolType',0,0).AsInteger ;


  
  if Assigned(AExternalPinPlugin) then
   begin
    FillChar(pOutput,1536,#0);
    PpOutput := @pOutput[0];
    AExternalPinPlugin(Application,0,'',ppOutput);
    AExternalPinIsReady := true ;
         if pos('ERROR:',pOutput) = 1 then
           begin
              PpOutput := @pOutput[6] ;
              AExternalPinIsReady := false ;
             // OSFMessageDlg('Betaling is niet mogelijk!' + #13+#10 + PpOutput,mtError,[mbOk],0);
           end ;
   end;
  // Need to udjust this when adding new pos layouts.
  if PolDisplayType < 0 then
     PolDisplayType := 0 ;
   if PolDisplayType > 1 then
     PolDisplayType := 1 ;


 (* if PostecControler.LoadLib then
  begin

   {Reset Position}
   Left := 0;
   if PostecControler.VcBotRight.Y>50 then
   begin
     Top := PostecControler.VcBotRight.Y;
     Height := Screen.WorkAreaRect.Bottom - PostecControler.VcBotRight.Y -1;
   end;
  end;   *)
 CBSalesMan.Visible := POSFastSwitchSalesMan ;
 LSalesman.Visible := POSFastSwitchSalesMan ;
 if POSWeightDishConnected then
  if aComPort = nil then
   begin
      aComPort := TComPort.Create(self);
      aComPort.ReceiveCallBack := myReceiveWeightDishProc ;
      aComPort.Port := POSWeightDishPORT ;
      aComPort.open ;
   end;
 if POSFastSwitchSalesMan then
 begin
 FillStringsWithReportingGroups(CBSalesMan.Items,31);
 CBSalesMan.ItemIndex := CBSalesMan.Items.IndexOfObject(TObject(SalesPerID));
 end;
      // Only purchase items
    dmDataBase.tblStock.filter := 'WStockTypeId <> 3 and WStockTypeId <> 5' ;


    
 UpDate;
 if iSACCOUNTOk then {This test will load customer details in DftCustAccount}
 begin
   lblCustName.Caption:= DftCustAccount.SDescription;
   CurCustAccount:=DftCustAccount;
 end;
 dmDatabase.tblBatch.Open;
 dmDatabase.tblBatchRefTotals.Open;

     cxGrid1DBTableView1WLINEID.Caption:= GetTextLang(1706);
     cxGrid1DBTableView1SREFERENCE.Caption := GetTextLang(1707);
     cxGrid1DBTableView1SDESCRIPTION.Caption := GetTextLang(1708);
     cxGrid1DBTableView1SACCOUNT.Caption := GetTextLang(1709);
     cxGrid1DBTableView1FDEBIT.Caption := GetTextLang(1710);
     cxGrid1DBTableView1FCREDIT.Caption := GetTextLang(1711);
     cxGrid1DBTableView1FAMOUNT.Caption := GetTextLang(1712);
     Label10.Caption := GetTextLang(1064);
     Adminoverride1.Caption := GetTextLang(1980);
     BOkpassword.Caption := GetTextLang(167);
     BGetInvAmount.Caption := GetTextLang(98);
     Invoice.Caption := GetTextLang(260);
     LEAccountNr.Caption := GetTextLang(34);
     CBAccountFromTo.Caption := GetTextLang(1934);
     PosLcd.Caption := GetTextLang(1721);
     CashUp2.Caption :=  GetTextLang(1750);
     ReprintLastInvoice1.Caption :=  GetTextLang(1751);
     CloseShift1.Caption :=  GetTextLang(1752);
     InclusiveExclusiveMode1.Caption :=  GetTextLang(1753);
     Report1.Caption :=  GetTextLang(1754);
     OpenDrawer1.Caption :=  GetTextLang(1755);
     dmDatabase.tblBatchFDEBIT.DisplayFormat := '0.00';
     dmDatabase.tblBatchFCREDIT.DisplayFormat := GetViewMask(6) ;

      

     LSalesman.Caption :=  GetTextLang(876);

      tblDeleteLine.caption :=  GetTextLang(367); //^D Delete
     tblEdit.caption := 'F2:'+ GetTextLang(121);// Edit
     tblSearch.caption :='F3:'+ GetTextLang(1163);// F3: &Lookup
     tblCustomer.caption := 'F5:'+ GetTextLang(1164);//&Customer
     tlbFloat.caption := 'F8:'+  GetTextLang(1165);// &Float
     tlbPayments.caption :='F9:'+  GetTextLang(1166);//  &Payment
     tlbDeleteAll.caption := 'F10:'+  GetTextLang(1167);// Delete All
     tblProcess.caption := '^P:'+  GetTextLang(953);// Process


      
 // if PollDispl.Connected then
     PrintToPole(dispTypeClear,'',FormatLeft(GetTextLang(1721),20),'');
     PrintToSoftwarePole(dispTypeClear,dmDatabase.tblBatch.TableName,GetTextLang(1721));


      
 
  // get the last docid so a print can be redone even the pos is restarted.
  aTest := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select Max(WDocId) from DOCHEAD where WSourceTypeId = 2 and WTypeId = 10 and WUserID =' + IntToStr(CurrentUser)));
  LastDocID := StrToIntDef(aTest,0);
  //Reload Lastpayments.
   PymtAmount[0] := DMTCCoreLink.ReadSysParam(0.00,'POSPAYAMT0',CurrentUser);
   PymtAmount[1] := DMTCCoreLink.ReadSysParam(0.00,'POSPAYAMT1',CurrentUser);
   PymtAmount[2] := DMTCCoreLink.ReadSysParam(0.00,'POSPAYAMT2',CurrentUser);
   PymtAmount[3] := DMTCCoreLink.ReadSysParam(0.00,'POSPAYAMT3',CurrentUser);
   PymtAmount[4] := DMTCCoreLink.ReadSysParam(0.00,'POSPAYAMT4',CurrentUser);


end;

Function TfmPosInvoiceEntry.iSACCOUNTOk:Boolean;
begin
  Result:=False;
  if DftSaleSACCOUNT>0 then
  begin
    DftCustAccount.WaccountID := DftSaleSACCOUNT;
    Result := LoadDebtorInfo(DftCustAccount) AND (TillAccountID>0);
    if Result then
    begin
      {Get AccountCode}

     dmDatabase.tblAccount.Open;
     Result := dmDatabase.tblAccount.Locate('WAccountID',TillAccountID,[]);
     Contra:=dmDatabase.tblAccountSACCOUNTCODE.Value;
     dmDatabase.tblAccount.Close;
    end;
  end;
  if not Result then
  begin
    ShowMessage(TRN_DefaultAccountNotSet);
    fmPosSetup:=TfmPosSetup.Create(Application);
    try
    SetUpForm(fmPosSetup);
    fmPosSetup.ShowModal;
    finally
     FreeAndNil(fmPosSetup);
    end;
  end;
  DftCustAccount.WaccountID := DftSaleSACCOUNT;
  Result := LoadDebtorInfo(DftCustAccount);
  if Result then
  LoadDocMessages(DftCustAccount);
end;

Procedure TfmPosInvoiceEntry.AddItem(NewLine:Boolean);
Var
  ThePrice,TheNewPrice : Double ;

begin
  {
   STAX          = Tax ID
   sReference    = Stock Code
   sDecsription  = Sdescription
   FDEBIT        = Qty
   FAMount       = Inclu Amt
   FCREDIT       = Discount
   FTaxAmount    = Tax Amt
   SACCOUNT      = Price
   WaccountID    = No
   //This is new Field And I Dont want to change Now My Qty Field
   FQty          = Tax Rate
   Sylvain : I'll use the the SProfile  to keep more info on stock and external Transactions

  }
  // done : Pieter Detach

  if MsgStockID=-1 then
    MsgStockID:=StkItem.WStockID;
  if StkItem.WStockID = 0 then exit ;
    TDataBaseStockRoutines.StockLoadItem(StkItem);

  // dmDatabase.tblBatch.DisableControls ;
  dmDatabase.tblBatchFCREDIT.ReadOnly := false;
  dmDatabase.tblBatchFAmount.ReadOnly := false;
  dmDatabase.tblBatchSACCOUNT.ReadOnly := false;

  try

  if NewLine or (dmDatabase.tblBatch.RecordCount<=0) then
  begin
    if not (dmDatabase.tblBatch.State in [dsinsert]) then
    dmDatabase.tblBatch.Append;
  end
  else
  begin
    if not(dmDatabase.tblBatch.State in [dsedit,dsinsert] )then
    dmDatabase.tblBatch.Edit;
  end;
  dmDatabase.tblBatchsProfile.AsString:='';

  if dmDatabase.tblBatchFDEBIT.AsString = '' then
     dmDatabase.tblBatchFDEBIT.AsInteger := 1 ;
  if dmDatabase.tblBatchFCREDIT.AsString = '' then
     dmDatabase.tblBatchFCREDIT.AsInteger := 0 ;

  dmDatabase.tblBatchsReference.Value:=StkItem.SSTOCKCODE;
  dmDatabase.tblBatchSDescription.Value:=StkItem.SDescription;
  dmDatabase.tblBatchFTax2Amount.AsInteger := StkItem.WStockID ;

  dmDatabase.tblBatchFQty.Value := StkItem.FOutputRate; {This is not the Qty but the Tax Rate}

   ThePrice := StkItem.FPrice1 ;
  If POSShowQtyOnhand then
    begin
      Caption := GetTextLang(1714) + ' : ' +  StkItem.SDescription +' : ' + FloatToStr(StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)+dmDatabase.tblBatchFDEBIT.AsFloat)) ;
    end;
  if DOCCantSellOutOfStock then
    begin
       if (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)+dmDatabase.tblBatchFDEBIT.AsFloat)) < 0 then
       if StkItem.WStockTypeId = 0 then
        begin
         OSFMessageDlg(DMTCCoreLink.GetTextLang(3083){'This item is out of stock! Auto adjusting qty'},mtwarning,[mbyes],0) ;
          if (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0))) > 0 then
          dmDatabase.tblBatchFDEBIT.AsFloat := (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)))
         else
         dmDatabase.tblBatchFDEBIT.AsFloat := 0 ;
        end;
    end;
   TheNewPrice := Theprice ;

  if UseDebtorSellingPrice then
    begin
     case CurCustAccount.WSellingPrice of
      2 : ThePrice := StkItem.FPrice2 ;
      3 : ThePrice := StkItem.FPrice3 ;
      end;
     // if plugin then price from there
       if DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false) then
        TheNewPrice := TDataBaseStockRoutines.getStockPrice(CurCustAccount.WaccountID,StkItem.WStockID,dmDatabase.tblBatchFDEBIT.AsFloat) 
       else TheNewPrice := Theprice ;
    end;
  if CurCustAccount.WDEfaultTaxId <> 0 then
     begin
       StkItem.WOutputTaxID := CurCustAccount.WDEfaultTaxId ;
       StkItem.SOutTax  := GetAccountCode(StkItem.WOutputTaxID);
       StkItem.FOutputRate :=  TDataBaseRoutines.GetTaxRateOnId(StkItem.WOutputTaxID); ;
     end;

  dmDatabase.tblBatchSACCOUNT.Value := FormatFloat(GetViewMask(0), AmtFix(ThePrice* StkItem.FOutputRate));
  dmDatabase.tblBatchFAmount.Value := AmtFix((TheNewPrice* StkItem.FOutputRate)* (dmDatabase.tblBatchFDEBIT.Value-dmDatabase.tblBatchFCREDIT.Value));
  dmDatabase.tblBatchFTaxAmount.Value := AmtFix((TheNewPrice * (StkItem.FOutputRate-1))* (dmDatabase.tblBatchFDEBIT.Value-dmDatabase.tblBatchFCREDIT.Value));
  dmDatabase.tblBatchSCONTRAACCOUNT.Value := IntToStr(StkItem.WStockID);
  dmDatabase.tblBatchFCREDIT.AsFloat := 0;
  if ThePrice <> 0 then
  dmDatabase.tblBatchFCREDIT.AsFloat := AmtFix(100 - ((TheNewPrice/ ThePrice) * 100)) ;

  dmDatabase.tblBatchSTAX.Value := StkItem.SOutTax;
  dmDatabase.tblBatchWaccountID.Value := StkItem.WOutputTaxID;
  dmDatabase.tblBatchBExclusive.AsInteger := 0 ;

  if dmDatabase.tblBatchWLineID.IsNull then
  begin
  dmDatabase.qGenBatchId.SQL.Text := 'select max(WLineID)  from ' + dmDatabase.tblBatch.TableName ;
  dmDatabase.qGenBatchId.open ;
  dmDatabase.tblBatchWLineID.AsInteger := dmDatabase.qGenBatchId.fields[0].asinteger   + 1 ;
  dmDatabase.qGenBatchId.close ;
  end;




 // dmDatabase.tblBatchWAccountID.Value := StkItem.WStockID;
 // done : pieter damm this not in edit or insert mode.

  dmDatabase.tblBatch.Post;

  RefreshDiplay;
  // done : Pieter Attach
  finally
 
 // dmDatabase.tblBatch.EnableControls ;
  end;

  dmDatabase.tblBatch.edit ;

  if ChangeDiscount and not(PasswordUsed) then
  begin
  dmDatabase.tblBatchFCREDIT.ReadOnly := true;
  dmDatabase.tblBatchFAmount.ReadOnly := true;
  dmDatabase.tblBatchSACCOUNT.ReadOnly := true;
  end;
  if StrToFloatDef(dmDatabase.tblBatchSACCOUNT.AsString,0) = 0 then
     begin
     cxGrid1.SetFocus ;
     cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1SACCOUNT.Index;
     end;

end;

procedure TfmPosInvoiceEntry.tblSearchClick(Sender: TObject);
 

 
begin


  {This will add Stock Item if Found}
   edtBarCode.SetFocus ;
   StkItem.WStockID := ReturnID ;
   TAutologout.Enabled := false ;
   if SelectLookup(StkItem,True,'(WSTOCKTYPEID = 0 or WSTOCKTYPEID = 1 or WSTOCKTYPEID = 2 or WSTOCKTYPEID =4) and BDisabled = 0  ',False) then
     begin
     AddItem(True);
     cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1FDEBIT.Index;
     if  StrtoFloatDef(dmDatabase.tblBatchSACCOUNT.AsString,0) = 0 then
         begin
           cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1SACCOUNT.Index;
           cxGrid1.SetFocus ;
         end;
     end;
end;

procedure TfmPosInvoiceEntry.dbStockLookupDropDown(Sender: TObject);
begin
    StkItem.WStockID:=-1;
    StkItem.SSTOCKCODE:=  dmDatabase.tblBatchSREFERENCE.AsString;

    ReturnLookup := CallLookup('', 7);
    StkItem.WStockID := ReturnID ;
    if LocateStockItem(StkItem) And (dmDatabase.tblBatchSREFERENCE.AsString<>StkItem.SSTOCKCODE) then
       AddItem(False);
end;



procedure TfmPosInvoiceEntry.tlbDeleteAllClick(Sender: TObject);
begin
  if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(508),mtConfirmation,[mbyes,mbno],0) = mryes then
     NewInvoice;
end;

procedure TfmPosInvoiceEntry.tblEditClick(Sender: TObject);
begin
  if dmdatabase.tblBatch.RecordCount<=0 then exit;
  cxGrid1.SetFocus;
   cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1FDEBIT.Index ;

 

end;

Procedure TfmPosInvoiceEntry.NewInvoice;
begin
  PasswordUsed := false;
  ExternalSalesOn := False;
  InitBatchTables ;
//  dmDatabase.tblBatch.DisableControls;
//  dmDatabase.tblBatch.First;
//  While not dmDatabase.tblBatch.Eof do
//    dmDatabase.tblBatch.Delete;
//  dmDatabase.tblBatch.EnableControls;
  //TotalAmount:=0;
  PosLcd.Caption := FormatLeft(TRN_NewInvoice,20);
  PrintToPole(dispTypeClear,'',FormatLeft(TRN_NewInvoice,20),'');
  PrintToSoftwarePole(dispTypeClear,'',TRN_NewInvoice);

  CurCustAccount:=DftCustAccount;
  SelectPosCustomer(CurCustAccount,1,true);
  LoadDocMessages(CurCustAccount);
  PosCash := 0;
  PosChange := 0;
  if UseScanner then
    edtBarCode.SetFocus
  else
  begin
    cxGrid1.SetFocus;
     cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1SREFERENCE.Index;
  end;
end;

procedure TfmPosInvoiceEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  Case Key of
  120:Begin{F9}
         tlbPaymentsClick(Sender);
         Key:=0;
      end;
  121:Begin{F10}
         tlbDeleteAllClick(Sender);
         Key:=0;
      end;
  122:Begin{F11}
         Useweightdish1Click(Sender);
         Key:=0;
      end;
  123:Begin{F12}
         CashUp2Click(Sender);
         Key:=0;
      end;
   114:Begin {F3}
         tblSearchClick(Sender);
         Key:=0;
      end;
   116:Begin {F5}
         if ssAlt in Shift then begin
           if WindowState=wsNormal then
             WindowState:=wsMaximized
           else
             WindowState:=wsNormal;
         end
         else
           tblCustomerClick(Sender);
         Key:=0;
      end;
   119:Begin {F8}
         tlbFloatClick(Sender);
         Key:=0;
      end;
   113:Begin {F2}
         tblEditClick(Sender);
         Key:=0;
      end;
  end;
end;

Procedure TfmPosInvoiceEntry.PrintDoc;
var
 PrintNow : Boolean ;
 Params : String ;
begin
//  if true then begin
  LoadPrintersVars;
  
  //  PymtAmount[0]:= StrToFloatDef(edtCash.Text,0);
  //PymtAmount[1]:= StrToFloatDef(edtCard.Text,0);
  //PymtAmount[2]:= StrToFloatDef(edtAccount.Text,0);
  //PymtAmount[3]:= StrToFloatDef(edtVouch.Text,0);
  //PymtAmount[4]:= StrToFloatDef(edtCheque.Text,0);;


  Params := 'cashtablename='  + dmDatabase.tblBatch.TableName ;
  Params := Params + #13 + 'payment1=' + StringReplace(FormatFloat('###0.00',PymtAmount[0] + FAmtChange),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'payment2=' + StringReplace(FormatFloat('###0.00',PymtAmount[1]),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'payment3=' + StringReplace(FormatFloat('###0.00',PymtAmount[2]),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'payment4=' + StringReplace(FormatFloat('###0.00',PymtAmount[3]),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'payment5=' + StringReplace(FormatFloat('###0.00',PymtAmount[4]),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'AmountPayed=' + StringReplace(FormatFloat('###0.00',PymtAmount[0]+PymtAmount[1]+PymtAmount[2]+PymtAmount[3]+PymtAmount[4]),DecimalSeparator,'.',[rfReplaceAll]) ;
  Params := Params + #13 + 'AmountChange=' + StringReplace(FormatFloat('###0.00',FAmtChange),DecimalSeparator,'.',[rfReplaceAll]) ;


  if UseInvoice then
   begin
   if  PosPrnConf then
   PrintNow := OSFMessageDlg(GetTextLang(505),mtConfirmation,[mbYes,mbNo],0)=mrYes
   else
   PrintNow := true ;

   if PrintNow then
   begin
   dmDatabase.tblUnit.Open;
   dmDatabase.tblStock.Open;
   dmDatabase.tblSysVars.Open;
   dmDatabase.tblDocLine.sql.Text := 'select * from docline where WDocID= ' + IntToStr(LastDocID) ;
   dmDatabase.tblDocLine.Open;
   dmDatabase.tblGroups.Open;
   dmDatabase.tblDocHeader.sql.Text := 'select * from dochead where WDocID= ' + IntToStr(LastDocID) ;
   dmDatabase.tblDocHeader.Open;
   dmDatabase.tblDocHeader.Filtered:=False;
   dmDatabase.tblDocHeader.Filter:='';
   dmDatabase.qrPrnDocLines.close;
   dmDatabase.qryDocHead.close ;
   // dmDatabase.qryDocHead.Open ;
   OpenDocSql('WDocID='+IntToStr(LastDocID),'');

//    OpenDocSql('DocHead.WTypeID ='''+IntTostr(idDocType)+'''','DocHead.SDocNo');
//   dmDatabase.qryDocHead.Filter := 'WDocID='+IntToStr(LastDocID) ;
   dmDatabase.qryDocHead.Open ;
   dmDatabase.qryDocHead.Filtered := true;
   try
   //dmDatabase.qrPrnDoc
   SetSQlLine(' AND WDocID=''' +IntToStr(LastDocID)+'''');
   dmDatabase.qrPrnDocLines.Open;


    if PosPrnConf then
    ShowFrReport(ord(PosShowPreview),0,1,9,'',Params)
     else
    ShowFrReport(ord(PosShowPreview),0,1,9,'',Params) ; // print directly to printer.
    dmDatabase.tblUnit.Close;
    dmDatabase.tblStock.Close;
    dmDatabase.tblSysVars.Close;
    dmDatabase.tblDocLine.Close;
    dmDatabase.tblGroups.Close;
    finally
     dmDatabase.qryDocHead.Filter := '' ;
     dmDatabase.qryDocHead.Filtered := false ;
    end;
    end;
    PrintTillDoc(LastDocID,Params);
    exit ;

   end;
   
  if (UsePrn1 or UsePrn2) AND PosPrnConf  AND (OSFMessageDlg(GetTextLang(505),mtConfirmation,[mbYes,mbNo],0)=mrYes) then begin
    dmDatabase.tblSysVars.Open;
    dmDatabase.qryDocHead.Open;
    dmDatabase.qryDocHead.Locate('WDocID',LastDocID,[]);
    PrintTillDoc(LastDocID,Params);
    dmDatabase.qryDocHead.Close;
    dmDatabase.tblSysVars.Close;
    dmDatabase.qrPrnDocLines.close;
  end;
end;

procedure TfmPosInvoiceEntry.tlbPaymentsClick(Sender: TObject);
Var
  New:TPoint;
  i,LastLineId:Integer;
  KeepTotalAmount:Real;
  Procedure AddInfoLine(Desc :String);
  Var
    Part,Whole : String ;
    EnterPos : Integer ;
    AStringList : TStringlist ;
    ListIndex : Integer ;
  begin
    AStringList := TStringlist.create ;
    try
    AStringList.Text := Desc ;
    for ListIndex := 0 to AStringList.count-1 do
      begin
      Whole:=Trim(AStringList[ListIndex]);
      part := copy(Whole,1,200);
      delete(Whole,1,200);
      while part <> '' do
        begin
        Inc(InvLine);
        dmDatabase.tblDocLine.SQL.Text := 'select * from docline where WDocID='+IntToStr(LastDocID)  ;
        dmDatabase.tblDocLine.open ;
        dmDatabase.tblDocLine.Append;
      //  dmDatabase.tblDocLineWStockID.Value:=MsgStockID;
        dmDatabase.tblDocLineWDocID.Value := LastDocID;


        dmDatabase.tblDocLineWDocLineID.Value:= InvLine;
        dmDatabase.tblDocLineWSORTNO.AsInteger := InvLine;
        dmDatabase.tblDocLineWLineTypeID.Value := 91 ;// Comment Line
        dmDatabase.tblDocLineWDescriptionID.Value := AddMessage(part,true);
        dmDatabase.tblDocLine.Post;
        part := copy(Whole,1,200);
        delete(Whole,1,200);
       end;
      end;
     finally
        AStringList.free ;
     end;
  end;
begin

 if CurCustAccount.WaccountID = 0 then
    raise Exception.Create('No account selected please select a account(f5)!');
 TAutologout.Enabled := false ;
 PrintToPole(dispTypeTotal,'',FormatLeft(gettextlang(960){Totaal},10) ,FormatRight(FloatToStrF(PosSum,ffNumber,18,2),20));
 PrintToSoftwarePole(dispTypeTotal,'',gettextlang(960) + #13 + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,PosSum));
  if dmDatabase.tblBatch.IsEmpty then
    exit ;
  if dmDatabase.tblBatch.State = dsinsert then
      dmDatabase.tblBatch.cancel ;
  if POSRoundAmount <> 0 then
    begin
       if round(dmDatabase.tblBatchFAmount.AsFloat*100) mod round(POSRoundAmount *100) <> 0 then
         begin
           dmDatabase.tblBatch.Edit ;
           dmDatabase.tblBatchFAmount.Tag := ord(dmDatabase.tblBatchFAmount.ReadOnly) ;
           dmDatabase.tblBatchFAmount.ReadOnly := false ;

           if  round(dmDatabase.tblBatchFAmount.AsFloat*100) mod round(POSRoundAmount *100) <= (round(POSRoundAmount *100) / 2) then
               dmDatabase.tblBatchFAmount.AsFloat := (round(dmDatabase.tblBatchFAmount.AsFloat*100) - (round(dmDatabase.tblBatchFAmount.AsFloat*100) mod round(POSRoundAmount *100))) / 100
              else
              dmDatabase.tblBatchFAmount.AsFloat := (round(dmDatabase.tblBatchFAmount.AsFloat*100) + (round(POSRoundAmount *100) -(round(dmDatabase.tblBatchFAmount.AsFloat*100) mod round(POSRoundAmount *100)))) / 100 ;
            dmDatabase.tblBatch.post ;
            dmDatabase.tblBatchFAmount.ReadOnly := Boolean(dmDatabase.tblBatchFAmount.Tag) ;
         end;
    end;
  PymtMethod[0]:=False;
  PymtMethod[1]:=False;
  PymtMethod[2]:=False;
  PymtMethod[3]:=False;
  PymtMethod[4]:=False;
  InvLine:=100;
  FAmtPayed := 0;
  FAmtChange := 0;
  KeepTotalAmount:= PosSum;
  fmPosPayments:= TfmPosPayments.Create(Application);
  try
  SetUpForm(fmPosPayments);
  New.X:= Self.Left + ABS(Self.Width-fmPosPayments.Width);
  New.Y:= cxGrid1.Top + Self.Top+22;
  fmPosPayments.Left:=New.X;
  fmPosPayments.Top:=New.Y;
  fmPosPayments.TotalAmount:=KeepTotalAmount;

  // done : pieter Debug option
  if lowercase(ParamStr(2)) <> 'true' then
  fmPosPayments.ShowModal else
  begin
  fmPosPayments.Show ;
  fmPosPayments.edtCash.Text := fmPosPayments.LbltoPay.Caption ;
  fmPosPayments.BtnOkClick(self);
  end;
  fmPosPayments.ReadAmt;

  if CurCustAccount.WaccountID = 0 then
     Raise Exception.Create('No account selected please select a account(f5)!');


  if FAmtChange>0 then
       begin
        PrintToPole(dispTypeCashback,'',FormatLeft(gettextlang(2042){change},10) ,FormatRight(FloatToStrF(FAmtChange,ffNumber,18,2),20));
        PrintToSoftwarePole(dispTypeCashback,'',gettextlang(2042) + #13 + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,FAmtChange));
        {if Chane<>0 then Adjust Amts}
        PymtAmount[0]:=PymtAmount[0]-FAmtChange;
      end;
  if NextDoc then
  begin
    if {(round(KeepTotalAmount*100)div 100) <= (round(PosCash*100) div 100) not sure what this does so i leave it but i seems nonens} true then
    begin
      SaveInvoice(ZipPymtMethods);
       if fmPosPayments.MComment.Text <> '' then
          AddInfoLine (fmPosPayments.MComment.Text);


      // clear list
      if CurrentListName <> '' then
        if AListCollection.SQLCollection.GetItemByName(CurrentListName) <> nil then
           begin
             // delete item
             DeleteFile(ListBaseFolder + CurrentListName +'.txt') ;
             AListCollection.SQLCollection.Delete(AListCollection.SQLCollection.GetItemByName(CurrentListName).Index);
             CurrentListName := '' ;
           end;

      //Remeber payments
      DMTCCoreLink.WriteSysParam('POSPAYAMT0', StringReplace(FloatToStr(PymtAmount[0]),DecimalSeparator,'.',[rfReplaceAll]),CurrentUser);
      DMTCCoreLink.WriteSysParam('POSPAYAMT1', StringReplace(FloatToStr(PymtAmount[1]),DecimalSeparator,'.',[rfReplaceAll]),CurrentUser);
      DMTCCoreLink.WriteSysParam('POSPAYAMT2', StringReplace(FloatToStr(PymtAmount[2]),DecimalSeparator,'.',[rfReplaceAll]),CurrentUser);
      DMTCCoreLink.WriteSysParam('POSPAYAMT3', StringReplace(FloatToStr(PymtAmount[3]),DecimalSeparator,'.',[rfReplaceAll]),CurrentUser);
      DMTCCoreLink.WriteSysParam('POSPAYAMT4', StringReplace(FloatToStr(PymtAmount[4]),DecimalSeparator,'.',[rfReplaceAll]),CurrentUser);


      {Payment Was Made So generate Batch Info for that}

      for i:=0 to 4 do
      if PymtAmount[i]<>0 then
      begin
        if i=2 then continue; {Baying by Account there is no payment}
        {credit debtor account}
        // done : Pieter if no open open it.
        if not dmDatabase.tblBatchRefTotals.Active then
           dmDatabase.tblBatchRefTotals.Active := true ;

        dmDatabase.tblBatchRefTotals.Append;
        dmDatabase.tblBatchRefTotalsWDOCID.AsInteger :=  LastDocID ;
        dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
        dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
        dmDatabase.tblBatchRefTotalsSReference.Value := LastDocNo;
        dmDatabase.tblBatchRefTotalsWAccountID.Value := CurCustAccount.WaccountID;
        dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(CurCustAccount.SACCOUNTCODE);
        dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
        dmDatabase.tblBatchRefTotalsWLINKEDID.AsInteger := dmDatabase.tblBatchRefTotalsWLINEID.AsInteger ;
        LastLineId := dmDatabase.tblBatchRefTotalsWLINEID.AsInteger ;
        dmDatabase.tblBatchRefTotalsNotUsed.Value:=1;
//        ZipPymtMethods;
        dmDatabase.tblBatchRefTotalsFQty.Value:= PosPymtCode(i);
        //LastDocID;
        {Create Entries for Each Payment Method}
        Case i of
        1:begin
            dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_CreditCard;
            {Add Messages To the Invoice}
            AddInfoLine(TRN_CCnr +fmPosPayments.Edit1.Text);
            AddInfoLine(TRN_CCName+ fmPosPayments.Edit2.Text);
            AddInfoLine(TRN_CCType +fmPosPayments.Edit3.Text);

            AddInfoLine(StringReplace(TRN_CCExpDate,':','',[rfReplaceAll]) +':' +DateToStr(fmPosPayments.wwDBDateTimePicker1.Date));
          end;
        2:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_Account;
        3:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_Voucher;
        4:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_Cheque;
        else
          dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_Cash;
        end;
        dmDatabase.tblBatchRefTotalsFCREDIT.Value := PymtAmount[i];
        dmDatabase.tblBatchRefTotalsFamount.Value := - PymtAmount[i];
        dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
        dmDatabase.tblBatchRefTotals.Post;
        {Debit Till Cash Account (Balancing Entry) }
        dmDatabase.tblBatchRefTotals.Append;
        dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
        dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
        dmDatabase.tblBatchRefTotalsSReference.Value := '********';
        if i=4  then dmDatabase.tblBatchRefTotalsWAccountID.Value := ChequeID
                  else
           dmDatabase.tblBatchRefTotalsWAccountID.Value := TillAccountID;
        dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
        dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
        dmDatabase.tblBatchRefTotalsWLINKEDID.AsInteger := LastLineId ;
        dmDatabase.tblBatchRefTotalsWDOCID.AsInteger :=  LastDocID ;
        //LastDocID;
        {Create Entries for Each Payment Method}
        Case i of
        1 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvCreditCard,[LastDocNo]);
        2 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvAccount,[LastDocNo]);
        3 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvVoucher,[LastDocNo]);
        4 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvCheque,[LastDocNo]);
        else
          dmDatabase.tblBatchRefTotalsSDescription.Value :=  format(TRN_InvCash,[LastDocNo]);
        end;
        dmDatabase.tblBatchRefTotalsFDEBIT.Value := PymtAmount[i];
        dmDatabase.tblBatchRefTotalsFamount.Value := PymtAmount[i];
        dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
        dmDatabase.tblBatchRefTotals.Post;

         if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
            begin
               DMTCCoreLink.LogAction('POSINVOICE',LastDocID,'Invoiced!');
            end;

      end;
      // done : pieter Debug option
      if lowercase(ParamStr(2)) <> 'true' then
      PrintDoc;
      {Record Change Entry}
      NewInvoice;
    end;
  end else // end nextdoc
  begin
   PrintToPole(dispTypeCancel,'',FormatLeft(gettextlang(960){Totaal},10) ,FormatRight(FloatToStrF(PosSum,ffNumber,18,2),20));
   PrintToSoftwarePole(dispTypeCancel,'', gettextlang(960) + #13 + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,PosSum));
  end;
  finally
  fmPosPayments.Free;
  end;
  if FAmtChange>0 then
       begin
        OSFMessageDlg(FloatToStrF(FAmtChange,ffFixed,18,2)+#13#10+gettextlang(2042), mtinformation, [mbok], 0);
      end;
end;

procedure TfmPosInvoiceEntry.FormActivate(Sender: TObject);
begin
  if DftSaleSACCOUNT<=0 then
  begin
    ShowMessage(TRN_MSG_DefaultSetup);
  end;
  if UseScanner then
   edtBarCode.SetFocus
  else
  begin
   cxGrid1.SetFocus;
   if dmDatabase.tblBatch.RecordCount<=0 then
      cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1SREFERENCE.Index;
  end;
end;

Procedure TfmPosInvoiceEntry.ReplaceLines(line1,line2,line3:String);
begin
  PosLcd.Caption:=
       FormatLeft(line1,PosLcd.NoOfChars)+
       FormatLeft(line2,PosLcd.NoOfChars)+
       FormatLeft(line3,PosLcd.NoOfChars);
end;

Procedure TfmPosInvoiceEntry.PrintToPole(DispType: Integer ;LineId,Line1,Line2:String);
begin
  {Display On the Pole}
  PrintOnPoll(DispType ,LineId,#13#13+
        FormatLeft(Line1,20) +
        FormatLeft(Line2,20) + #13);
end;

procedure TfmPosInvoiceEntry.tblDeleteLineClick(Sender: TObject);
var
  B:Boolean;
begin
  if dmDatabase.tblBatch.RecordCount>0 then
  begin
    try
     // B := IsExternalTrans(ExtTransID,ExtTransType);
      PrintToPole(dispTypeDeleteRow,dmDatabase.tblBatchWLINEID.AsString,'','');
      PrintToSoftwarePole(dispTypeDeleteRow,dmDatabase.tblBatchWLINEID.AsString,'');

      dmDatabase.tblBatch.Delete;
      {If this is an external trans let notify the controler of the deletion}
      //if b then
       // PostecControler.UnConfirmSale(ExtTransID,ExtTransType);
      RefreshDiplay;
    except end;
  end;
end;

procedure TfmPosInvoiceEntry.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    if PnlFloat.Visible then
    begin
      SelectNext(Screen.ActiveControl,True,True);
      
    end;
  end;
  if Key = #4 then
  begin
    tblDeleteLineClick(Sender);
    Key := #0;
  end;
  if Key=#27 then
  begin
    if PnlFloat.Visible then
      BtnCancelFloatClick(Sender)
    else
    begin
      if OSFMessageDlg(TRN_MSG_Close,mtConfirmation,[mbYes,mbNo],0)=mrYes then
      Close;
    end;
    Key:=#0;
  end;
end;

procedure TfmPosInvoiceEntry.tblCustomerClick(Sender: TObject);
begin
  TAutologout.Enabled := false ;
  SelectPosCustomer(CurCustAccount,1,false,OneClickDeb);
  lblCustName.Caption:= CurCustAccount.SDescription;
 // CurCustAccount:=DftCustAccount;
end;

procedure TfmPosInvoiceEntry.edtBarCodeKeyPress(Sender: TObject;
  var Key: Char);
var
 aQuery : TuniQuery ;
 LocateCode : String ;

begin

   if Key='*' then
      begin
         cxGrid1.SetFocus ;
          cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1FDEBIT.Index;
         Key := #0 ;
      end;

  if Key=#13 then
  begin
    if Trim(edtBarCode.text)<>'' then
    begin
      LocateCode := '' ;
            ReturnID := 0 ;
            if DMTCCoreLink.SQLList.GetFormatedSQLByName('FREESTOCKLOOKUP') <> '' then
             begin
              aQuery := TuniQuery.create(self) ;
              try
              aQuery.Connection := DMTCCoreLink.TheZConnection ;
              aQuery.SQL.Text :=  TDatabaseTableRoutines.ReplaceParams(DMTCCoreLink.SQLList.GetFormatedSQLByName('FREESTOCKLOOKUP'),'ID='+trim(edtBarCode.Text)) ;
              aQuery.Open ;
              if aQuery.RecordCount > 1 then
                begin
                 while not aQuery.Eof do
                   begin
                      if LocateCode <> '' then
                       LocateCode := LocateCode + ',' ;
                      LocateCode := LocateCode + aQuery.fields[0].AsString  ;
                     aQuery.next ; 
                   end;
                end else
                  ReturnID := aQuery.fields[0].AsInteger ;
              finally
               aQuery.free ;
              end;
              if LocateCode <> '' then
                 begin
                   CallLookup('', 16,0,'@ where WStockid in (' + LocateCode +')' ,false) ;
                 end ;
             end else
             begin
               ReturnID :=  TDataBaseStockRoutines.FindStockOnBarCode(Trim(edtBarCode.text))  ;
             end;

      if ReturnID = 0 then
          begin
           StkItem.WStockID := -1;
           if LoadStockItem(StkItem,Trim(edtBarCode.text)) then
           AddItem(True)
           else begin Beep;Beep; end;
          end  else
          begin
           MsgStockID := -1 ;
           StkItem.WStockID := ReturnID ;

           if TDataBaseStockRoutines.StockLoadItem(StkItem) then
           AddItem(True)
           else begin Beep;Beep; end;
          end;

    end
    else
    begin
      tblSearchClick(self);
    end;
    edtBarCode.text:='';
  end;

end;

procedure TfmPosInvoiceEntry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TDatabaseRegistyRoutines.WriteFormPos(self,'');
 

  if SaveMainFormState<>fmMain.WindowState then
    fmMain.WindowState := SaveMainFormState;
  //PostecControler.UnloadPosLib;
  if aComPort <> nil
   then FreeAndNil(aComPort);
         // Only purchase items
  dmDatabase.tblBatchFCREDIT.ReadOnly := false;
  dmDatabase.tblBatchFAmount.ReadOnly := false;
  dmDatabase.tblBatchSACCOUNT.ReadOnly := false;
  dmDataBase.tblStock.filter := '' ;
  SavePosInputVars;
  PrintToPole(dispTypeClear,'',FormatLeft(GetTextLang(3050) {Closed},20),'');
  PrintToSoftwarePole(dispTypeClear,'',GetTextLang(3050){'Closed'});
  dmDatabase.tblBatchRefTotals.Close;
  dmDatabase.tblBatch.Close;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblDocLine.Close;
  dmDatabase.tblStock.Close;
  dmDatabase.tblBatchFDEBIT.DisplayFormat := GetViewMask(0) ;
  dmDatabase.tblBatchSreference.Size:=8;
  dmDatabase.tblBatchRefTotalsSreference.Size:=8;
end;

procedure TfmPosInvoiceEntry.tlbFloatClick(Sender: TObject);
begin
 if dmDatabase.tblBatch.RecordCount <> 0 then
  if OSFMessageDlg(TRN_MSG_Close, mtConfirmation, [mbyes,mbno], 0)<>mryes then
   exit ;
  if Not AllowCashFloat then begin
   OSFMessageDlg(gettextlang(2097), mtInformation, [mbok], 0);
   Exit;
  end;
  PnlFloat.Visible:= Not PnlFloat.Visible;
  ClearFloatMvt;
  RGFloatMovement.SetFocus ;
  CBAccountFromTo.Checked := ReadReportOp('CBAccountFromTo',false).asboolean ;
  RGFloatMovement.ItemIndex :=  ReadReportOp('CBFLoatMovement',0).AsInteger ;
end;

procedure TfmPosInvoiceEntry.BtnCancelFloatClick(Sender: TObject);
begin
  PnlFloat.Visible:=False;
  ClearFloatMvt;
  if UseScanner then
    edtBarCode.SetFocus
  else
    cxGrid1.SetFocus;
end;

procedure TfmPosInvoiceEntry.BtnOkClick(Sender: TObject);
Var
  Amt:real;
  LastLineId : Integer ;
begin
  Amt:= StrToFloatDef(Edit1.Text,0);
 if CBAccountFromTo.Checked then
     begin
      if EAccountNr.tag = 0 then
        begin
         Showmessage('You need to select a account!');
         BAccountNrClick(self);
         exit ;
        end;
     end;
  if Amt = 0 then
     begin
       Showmessage('Amount is empty!');
       Edit1.SetFocus ;
       exit ;
     end;

  if not dmDatabase.tblBatchRefTotals.Active then
    dmDatabase.tblBatchRefTotals.open ;
  WriteReportOp('CBAccountFromTo',BoolToStr(CBAccountFromTo.Checked,true));
  WriteReportOp('CBFLoatMovement',IntToStr(RGFloatMovement.ItemIndex));


  if RGFloatMovement.ItemIndex=0 then
    Amt := - Amt;
  if ((Edit1.Text<>'') or (Edit2.Text<>'')) AND (Amt<>0) then
  begin
    // Update Float Account;

    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
      begin
         DMTCCoreLink.LogAction('POSAMTMOVE',0,'Pos movement !' + FloatToStr(Amt) + ' '+ Edit1.Text + ' ' + Edit2.Text );
      end;

    dmDatabase.tblBatchRefTotals.Append;
    dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
    dmDatabase.tblBatchRefTotalsSReference.Value := Edit3.Text;
    dmDatabase.tblBatchRefTotalsSDescription.Value := Edit2.Text;
    dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
     if dmDatabase.tblBatchRefTotalsWLineID.IsNull then
     begin
     dmDatabase.qGen.SQL.Text := 'select 1 + max(WLineID)  from ' + dmDatabase.tblBatchRefTotals.TableName ;
     dmDatabase.qGen.open ;
     dmDatabase.tblBatchRefTotalsWLineID.AsInteger := dmDatabase.qGen.fields[0].asinteger   ;
     dmDatabase.qGen.close ;
     end;

    dmDatabase.tblBatchRefTotalsWLINKEDID.AsInteger := dmDatabase.tblBatchRefTotalsWLINEID.AsInteger ;
    LastLineId := dmDatabase.tblBatchRefTotalsWLINEID.AsInteger ;
    // allow selecting of debtor.
    if CBAccountFromTo.Checked then
    begin
       dmDatabase.tblBatchRefTotalsWAccountID.Value := EAccountNr.tag;
       dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(EAccountNr.text);
       dmDatabase.tblBatchRefTotalsWDOCID.AsInteger := Edit3.tag ;
    end else
    begin
       dmDatabase.tblBatchRefTotalsWAccountID.Value := PaidOutID;
       dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(GetAccountCode(PaidOutID));
    end ;



    dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(GetAccountCode(TillAccountID));
    dmDatabase.tblBatchRefTotalsFamount.Value := - Amt;
    dmDatabase.tblBatchRefTotalsFDEBIT.Value := 0;
    dmDatabase.tblBatchRefTotalsFCREDIT.Value := 0;
    dmDatabase.tblBatchRefTotalsFQty.Value := 32;
    dmDatabase.tblBatchRefTotalsNotUsed.Value:=1;
    if dmDatabase.tblBatchRefTotalsFamount.Value>0 then
      dmDatabase.tblBatchRefTotalsFDEBIT.Value := Abs(Amt)
    else
      dmDatabase.tblBatchRefTotalsFCREDIT.Value := Abs(Amt);
    dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
    dmDatabase.tblBatchRefTotals.Post;
    // Credit or Debit the till Account
    dmDatabase.tblBatchRefTotals.Append;
    dmDatabase.tblBatchRefTotalsWLINKEDID.AsInteger := LastLineId ;
    dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
    dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
    dmDatabase.tblBatchRefTotalsSReference.Value := '********';
    dmDatabase.tblBatchRefTotalsWAccountID.Value := TillAccountID;
    dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
    dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
    dmDatabase.tblBatchRefTotalsSDescription.Value := Edit2.Text;
    if CBAccountFromTo.Checked then
    begin
       dmDatabase.tblBatchRefTotalsWDOCID.AsInteger := Edit3.tag ;
    end ;
    dmDatabase.tblBatchRefTotalsFDEBIT.Value := 0;
    dmDatabase.tblBatchRefTotalsFCREDIT.Value := 0;
    if Amt>=0 then
      dmDatabase.tblBatchRefTotalsFDEBIT.Value := Abs(Amt)
    else
      dmDatabase.tblBatchRefTotalsFCREDIT.Value := Abs(Amt);
    dmDatabase.tblBatchRefTotalsFamount.Value := Amt;
    dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
    dmDatabase.tblBatchRefTotals.Post;
  end;
  PnlFloat.Visible:=False;
  ClearFloatMvt;
  if UseScanner then
    edtBarCode.SetFocus
  else
    cxGrid1.SetFocus;

  if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
     begin
       DMTCCoreLink.LogAction('POSOPENDAW',0,'Open drawer!');
     end;
  OpenDrowerNow ;
end;

procedure TfmPosInvoiceEntry.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Key:=#0;

 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.   if key = '.' then
   if sender = Edit1 then
    if key = '.' then
    key :=  DecimalSeparator ;
end;

procedure TfmPosInvoiceEntry.dbgrdPosEntryCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if (Field.FieldName='WAccountID')  Or SameText(Field.FieldName,'FAmount') then
  begin
    ABrush.Color:=clBtnFace;
  end;
//   if ((Sender as TwwDBGrid).GetActiveRow = (Sender as  TwwDBGrid).CalcCellRow) then
//   begin
//     ABrush.Color:= clhighlight;
//     AFont.Color:= clwhite;
//   end;
end;

procedure TfmPosInvoiceEntry.CashUp2Click(Sender: TObject);
begin
  CashUpNow;
end;

procedure TfmPosInvoiceEntry.CloseShift1Click(Sender: TObject);
var
 i  :integer ;
 PpOutput : Pchar ;
 pOutput : array [0..1536] of char ;
begin
  fmPosReportOptions:=TfmPosReportOptions.Create(self);
  try
  fmPosReportOptions.BFromPosClose := true ;
  fmPosReportOptions.ShowModal;
  finally
  FreeAndNil(fmPosReportOptions);
  end;

  dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
  dmDatabase.tblBatchFCREDIT.Readonly:=False;

  // inherited;

  if OSFMessageDlg(DMTCCoreLink.GetTextLang(901507) , mtConfirmation, [mbyes,mbno], 0)=mryes then
  begin
    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
      begin
         DMTCCoreLink.LogAction('POSCLOSEST',0,'Pos trying to close!');
      end;

    dmDatabase.tblBatch.BeforePost := dmDatabase.tblBatchBeforePost ;
    Hide;
    try
    if CBSalesMan.Visible then
       begin
         // close shift for all sales man.
         for i := 0 to  CBSalesMan.items.Count -1 do
             begin
              SalesPerID := Integer(CBSalesMan.Items.Objects[i]);
              InitBatchTables ;

              end;

        dmDatabase.ZMainconnection.StartTransaction ;
        try

         for i := 0 to  CBSalesMan.items.Count -1 do
             begin
              SalesPerID := Integer(CBSalesMan.Items.Objects[i]);
              InitBatchTables ;
               try
                 CLoseShift;
              except
                on e : Exception do
                  OSFMessageDlg(e.Message,mtError,[MBOK],0)
              end;
              end; // end for loop

              if dmDatabase.ZMainconnection.InTransaction then
                 dmDatabase.ZMainconnection.Commit ;
               finally
                    if dmDatabase.ZMainconnection.InTransaction then
                      begin
                       dmDatabase.ZMainconnection.Rollback ;
                       show ;
                       raise Exception.Create(DMTCCoreLink.GetTextLang( 3067){'Error in closing shift please try again.'});
                      end;
                 end;

       end // end sales man visible
    else
    begin
    //SalesPerID := 0 ;
    // sales person is set.
    InitBatchTables ;
    dmDatabase.ZMainconnection.StartTransaction ;
    try
     try
    CLoseShift;
    except
      on e : Exception do
        OSFMessageDlg(e.Message,mtError,[MBOK],0)
    end;
    if dmDatabase.ZMainconnection.InTransaction then
       dmDatabase.ZMainconnection.Commit ;
      finally
         if dmDatabase.ZMainconnection.InTransaction then
              begin
                dmDatabase.ZMainconnection.Rollback ;
                show ;
                 raise Exception.Create(DMTCCoreLink.GetTextLang( 3067){'Error in closing shift please try again.'});
              end;
    end; // end try

    end; // end else
     Close;
    finally
        dmDatabase.tblBatch.BeforePost := tblBatchBeforePost ;
    end;



    // delete templists
 {   if AListCollection.SQLCollection.Count >0 then
       begin
         if OSFMessageDlg('Delete unloaded invoices?',mtConfirmation,[mbyes,mbno],0) = mryes then
            begin
               for i := AListCollection.SQLCollection.Count -1 downto 0 do
                  begin
                   DeleteFile(ListBaseFolder + AListCollection.SQLCollection.Items[i].Name +'.txt') ;
                   AListCollection.SQLCollection.Delete(AListCollection.SQLCollection.Items[i].Index);
                  end;
            end;

       end;   }


  // handel PIN
  if Assigned(AExternalPinPlugin) and AExternalPinIsReady then
     begin

     FillChar(pOutput,1536,#0);
     PpOutput :=  @pOutput[0] ;
     AExternalPinPlugin(Application,2,'0',PpOutput);
     if pOutput <> '' then
       begin
         if pos('ERROR:',pOutput) = 1 then
           begin
              PpOutput := @pOutput[6] ;
              AExternalPinIsReady := false ;
              Raise Exception.Create('Pin kan geen niet worden afgesloten!' + #13+#10 + PpOutput);
           end ;
       end;
     end;

    if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
      begin
         DMTCCoreLink.LogAction('POSCLOSEOK',0,'Pos Closed!');
      end;
  end ; // end close shift ?





end;

Function TfmPosInvoiceEntry.CalcAmount:Real;

var
 Astring : String ;
begin
  Astring :=  StringReplace(dmDatabase.tblBatchSACCOUNT.Value,ThousandSeparator,'',[rfReplaceAll]) ;

  Result := StrToCurrDef(Astring,0)* dmDatabase.tblBatchFDEBIT.Value;
  Result := AmtFix((1 - (dmDatabase.tblBatchFCREDIT.AsFloat/100) ) * Result)  ;
end;

Procedure TfmPosInvoiceEntry.RefreshDiplay;

begin

 case PolDisplayType of
 0 : begin
      ReplaceLines(FormatLeft(gettextlang(3046){sub-total},15) +  FormatRight(FloatToStrF(PosSum,ffNumber,18,2),25),
         '',FormatLeft(dmDatabase.tblBatchSDescription.Value,29)+' '+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,10,2),10) );
      PrintToPole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString,FormatLeft(gettextlang(3046){sub-total},10) + ' '+FormatRight(FloatToStrF(PosSum,ffNumber,18,2),9),
            FormatLeft(dmDatabase.tblBatchSDescription.Value,10)+' '+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,10,2),9) );
     end else begin
      ReplaceLines(FormatLeft(gettextlang(3046){sub-total},15) +  FormatRight(FloatToStrF(PosSum,ffNumber,18,2),25),
         '',FormatLeft(dmDatabase.tblBatchSDescription.Value,29)+' '+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,10,2),10) );
      PrintToPole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString,FormatLeft(dmDatabase.tblBatchSDescription.Value,20),FormatLeft(FloatToStrF(dmDatabase.tblBatchFDEBIT.AsFloat,ffNumber,10,2),5)+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,15,2),15) );
      Polstep := 0 ;
      TimerSetPosDisplay.Enabled := false ;
      TimerSetPosDisplay.Interval :=  750 ;
      TimerSetPosDisplay.Enabled := true ;
     end;
 end;
 PrintToSoftwarePole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString, gettextlang(3046) + #13 + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,PosSum) + #13 + dmDatabase.tblBatchFDEBIT.AsString + #13 + dmDatabase.tblBatchFCREDIT.AsString + #13 + dmDatabase.tblBatchSDescription.AsString + #13 + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,dmDatabase.tblBatchFAmount.AsFloat) + #13 + dmDatabase.tblBatchSCONTRAACCOUNT.AsString );
end;

procedure TfmPosInvoiceEntry.Report1Click(Sender: TObject);
Var
  AFileName,BFileName:String;
begin
  {Sylvain: This cause the screen to freeze as the batch table is closed}
  AFileName := dmDatabase.tblBatch.TableName;
  BFileName := dmDatabase.tblBatchRefTotals.TableName ;
  Try
    dmDatabase.tblBatch.DisableControls;
    fmMain.PointofSale1Click(Sender);
  Finally
    Try
      dmDatabase.tblBatch.Filtered := False;
      dmDatabase.tblBatch.Filter := '';
      dmDatabase.tblBatch.Close;
      dmDatabase.tblBatch.TableName := AFileName;
      dmDatabase.tblBatch.OPen;


      dmDatabase.tblBatchRefTotals.Filtered := False;
      dmDatabase.tblBatchRefTotals.Filter := '';
      dmDatabase.tblBatchRefTotals.Close;
      dmDatabase.tblBatchRefTotals.TableName := BFileName;
      dmDatabase.tblBatchRefTotals.OPen;
     Finally
      dmDatabase.tblBatch.EnableControls;
    end;
  end;
end;

procedure TfmPosInvoiceEntry.OpenDrawer1Click(Sender: TObject);
begin
   if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
      begin
         DMTCCoreLink.LogAction('POSOPENDAW',0,'Open drawer!');
      end;
   if CashDrawer.Connected then
  OpenDrowerNow else
  begin
    if FileExists(DMTCCoreLink.GetLocalPluginDir + 'reports\DOCUMENTS\DOCUMENTS\opendrawer.rep') then
       begin
          if PosPrnConf then
             ShowFrReport(0,0,1,9,'opendrawer','')
             else
             ShowFrReport(1,0,1,9,'opendrawer','') ; // print directly to printer.
       end;
  end;

end;

procedure TfmPosInvoiceEntry.dbgrdPosEntryKeyPress(Sender: TObject;
  var Key: Char);
begin
// if this is barocde mod then use enter to go to barcode entry after discount column

  if UseScanner then
   if key = #9 then
    if (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1FDEBIT.Index ) or (cxGrid1DBTableView1.Controller.FocusedColumnIndex = cxGrid1DBTableView1FCREDIT.Index ) then
     begin
      edtBarCode.SetFocus ;
      Abort ;
     end;

 if key = '*' then
   cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1.Controller.FocusedColumnIndex +1;


 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.   if key = '.' then
 if key = '.'then
   if (cxGrid1DBTableView1.Controller.FocusedColumnIndex in [3,4,5] )then
     key := DecimalSeparator ;
 // you cannot put - in the qty field    
 if key = '-'then
   if (cxGrid1DBTableView1.Controller.FocusedColumnIndex in [3] )then
     key := #0 ;
   if (cxGrid1DBTableView1.Controller.FocusedColumnIndex in [1] )then
    if key = ' ' then
      if dmDatabase.tblBatch.IsEmpty then
       begin
        StkItem.WStockID := ReturnID ;
         if SelectLookup(StkItem,True,'(WSTOCKTYPEID = 0 or WSTOCKTYPEID = 1 or WSTOCKTYPEID = 2 or WSTOCKTYPEID =4) and BDisabled = 0  ') then
           AddItem(false);
       end;
end;

Procedure TfmPosInvoiceEntry.ClearFloatMvt;
begin
  Edit3.Text:='';
  Edit1.Text:='0.00';
  Edit2.Text:='';
end;

procedure TfmPosInvoiceEntry.Timer1Timer(Sender: TObject);
var
 DummyKey : Char ;
begin
  Timer1.Enabled := false ;
  if BStartStop.Tag = 0 then exit ;
  Timer1.Interval := StrToInt(ETimerInterval.Text);
  application.ProcessMessages ;
  edtBarCode.Text := EBarcodeToUse.Text ;
  DummyKey := #13 ;
  edtBarCodeKeyPress(self,DummyKey);
  tlbPaymentsClick(self);
  Timer1.Tag := Timer1.Tag + 1 ;
  Nr.Caption := IntToStr(Timer1.tag) ;
  if BStartStop.Tag = 1 then
     if Timer1.Tag < strToInt(EMaxInvoices.text) then
        Timer1.Enabled := true ;
end;

procedure TfmPosInvoiceEntry.BStartStopClick(Sender: TObject);
begin
if BStartStop.Tag = 0 then
   begin
   BStartStop.Caption := 'stop' ;
   BStartStop.Tag := 1 ;
   Timer1.Interval := StrToInt(ETimerInterval.Text);
   Timer1.Enabled := true;

   end else
   begin
   BStartStop.Caption := 'start' ;
   BStartStop.Tag := 0 ;
   Timer1.Enabled := false;

   end;
end;

procedure TfmPosInvoiceEntry.CBAccountFromToClick(Sender: TObject);
begin
 EAccountNr.Visible := CBAccountFromTo.Checked ;
 BAccountNr.Visible := CBAccountFromTo.Checked ; 
 LEAccountNr.Visible := CBAccountFromTo.Checked ;
end;

procedure TfmPosInvoiceEntry.InvoiceClick(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
TAutologout.Enabled := false ;
if ChangeDiscount then
  begin
   if dmDatabase.tblBatchFCREDIT.ReadOnly then
    begin
    PPassword.Visible := true ;
    EAdminPassword.SetFocus ;
    EAdminPassword.Text := '' ;
    exit ;
    end;
  end;
   self.Hide ;
    dmDatabase.tblBatch.BeforePost := dmDatabase.tblBatchBeforePost ;
    try
 if NextDocNbrOk(10) then
  begin
    idDocType:=10;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);

  finally
      FormCreate(self);
     self.show ;
  end;
end;

procedure TfmPosInvoiceEntry.BGetInvAmountClick(Sender: TObject);
var
 OldDocType : Integer ;
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
 self.Hide ;
 if NextDocNbrOk(10) then
  begin
    WriteReportOp('CBAccountFromTo',BoolToStr(CBAccountFromTo.Checked,true));
    WriteReportOp('CBFLoatMovement',IntToStr(RGFloatMovement.ItemIndex));
    OldDocType := idDocType ;
    if RGFloatMovement.ItemIndex = 0 then
       idDocType := 12
    else
    idDocType:=10;

    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    fmInvoiceEntryGrid.ListIsReadOnly := true ;
    SetUpForm(fmInvoiceEntryGrid);
    if fmInvoiceEntryGrid.ShowModal = mrok then
      begin
         CBAccountFromTo.Checked := true ;
         Edit1.Text :=  FloatToStr(fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat) ;
         EAccountNr.tag  := fmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger ;
         EAccountNr.Text := AddDashInAccCodeNoPRefix(fmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString) ;
         Edit3.Text :=  fmInvoiceEntryGrid.QDocHeadSDocNo.AsString;
         Edit3.tag :=   fmInvoiceEntryGrid.QDocHeadWDOCID.AsInteger ;
         Edit2.Text :=  fmInvoiceEntryGrid.QDocHeadSACCOUNTDescription.AsString;
      end;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    idDocType := OldDocType ;
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
  FormCreate(self);
  self.show ;
end;

procedure TfmPosInvoiceEntry.Adminoverride1Click(Sender: TObject);
begin
   PPassword.Visible := true ;
   EAdminPassword.text := '' ;
   EAdminPassword.SetFocus ;
end;

procedure TfmPosInvoiceEntry.BOkpasswordClick(Sender: TObject);
begin
   if EAdminPassword.Text = ChangeDiscountPW then
     begin
        dmDatabase.tblBatchFCREDIT.ReadOnly := false;
        dmDatabase.tblBatchFAmount.ReadOnly := false;
        dmDatabase.tblBatchSACCOUNT.ReadOnly := false;
        PasswordUsed := true ;
        PPassword.Visible := false ;
     end else
     OSFMessageDlg(gettextlang(475),mterror,[mbok],0);

end;

procedure TfmPosInvoiceEntry.PopupMenu2Popup(Sender: TObject);
begin
 Adminoverride1.Visible :=  ChangeDiscount ;
end;

procedure TfmPosInvoiceEntry.PPasswordExit(Sender: TObject);
begin
PPassword.Visible := false ;
end;

procedure TfmPosInvoiceEntry.EAdminPasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
   begin
     BOkpasswordClick(self);
   end;
end;

procedure TfmPosInvoiceEntry.BAccountNrClick(Sender: TObject);
begin
 EAccountNr.Text :=  CallLookup(EAccountNr.Text,0);
 EAccountNr.Tag := ReturnID ;
 Edit3.Tag := 0 ;
 SelectNext(EAccountNr,true,true);
end;

procedure TfmPosInvoiceEntry.CBSalesManChange(Sender: TObject);
begin
 if not dmDatabase.tblBatch.IsEmpty then
 if OSFMessageDlg(TRN_MSG_Close,mtConfirmation,[mbyes,mbno],0) = mrno then
    begin
      CBSalesMan.ItemIndex := CBSalesMan.Items.IndexOfObject(TObject(SalesPerID));
      exit ;
    end;
 SalesPerID := Integer(CBSalesMan.Items.Objects[CBSalesMan.ItemIndex]) ;
 InitBatchTables ;
end;

procedure TfmPosInvoiceEntry.tblBatchBeforePost(DataSet: TDataSet);
begin

  if dmDatabase.tblBatchSACCOUNT.AsString = '' then
    begin
      dmDatabase.tblBatchSACCOUNT.AsInteger := 0 ;
    end;
 if dmDatabase.tblBatchSCONTRAACCOUNT.AsString ='' then
    begin
      dmDatabase.tblBatchSCONTRAACCOUNT.AsString := StkItem.SSTOCKCODE ;

      if dmDatabase.tblBatchSCONTRAACCOUNT.AsString ='' then
      raise Exception.Create(gettextlang(466));
    end;
end;

procedure TfmPosInvoiceEntry.FormDestroy(Sender: TObject);
begin
  AListCollection.free ;
  dmDatabase.tblBatch.BeforePost := dmDatabase.tblBatchBeforePost ;
end;

procedure TfmPosInvoiceEntry.InitBatchTables;
begin
  dmDatabase.CreateBatch('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) ;
  PosBatchName :=  'PosInv'+IntToStr(SalesPerID) ;
  PosPymtBatchName:=  'PosPymtInv'+IntToStr(SalesPerID) ;
  dmDatabase.createBatch(PosPymtBatchName);
  dmDatabase.createBatch(PosBatchName);


  dmDatabase.tblBatch.close;
  dmDatabase.tblBatchRefTotals.Close;
  dmDatabase.tblBatchSreference.Size:=15;
  dmDatabase.tblBatchRefTotalsSreference.Size:=15;
  dmDatabase.tblBatchRefTotals.TableName := PosPymtBatchName ;
  dmDatabase.tblBatch.TableName := PosBatchName;
  try
  ClearTable(dmDatabase.tblBatch.TableName);
  finally
  end;
  dmDatabase.tblBatch.open;
  dmDatabase.tblBatchRefTotals.open ;
end;

procedure TfmPosInvoiceEntry.Recievepayemt1Click(Sender: TObject);
Var
  New:TPoint;
  i:Integer;
  KeepTotalAmount:Real;
   fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
 self.Hide ;
    idDocType:=10;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    fmInvoiceEntryGrid.ListIsReadOnly := true ;
    SetUpForm(fmInvoiceEntryGrid);
    if fmInvoiceEntryGrid.ShowModal = mrok then
      begin
        PymtMethod[0]:=False;
        PymtMethod[1]:=False;
        PymtMethod[2]:=False;
        PymtMethod[3]:=False;
        PymtMethod[4]:=False;
        InvLine:=100;
        FAmtPayed := 0;
        FAmtChange := 0;
        KeepTotalAmount:= fmInvoiceEntryGrid.QDocHeadFDocAmount.AsFloat;
        fmPosPayments:= TfmPosPayments.Create(Application);
        try
        SetUpForm(fmPosPayments);
        New.X:= Self.Left + ABS(Self.Width-fmPosPayments.Width);
        New.Y:= cxGrid1.Top + Self.Top+22;
        fmPosPayments.Left:=New.X;
        fmPosPayments.Top:=New.Y;
        fmPosPayments.TotalAmount:=KeepTotalAmount;
        fmPosPayments.ShowModal ;
        fmPosPayments.ReadAmt;
        if FAmtChange>0 then begin
           OSFMessageDlg(FloatToStrF(FAmtChange,ffFixed,18,2)+#13#10'Change to give Back.'#13#10 + 'Thanks.', mtinformation, [mbok], 0);
           {if Chane<>0 then Adjust Amts}
           PymtAmount[0]:=PymtAmount[0]-FAmtChange;
        end;
        if NextDoc then
        begin
          if (round(KeepTotalAmount*100)div 100) <= (round(PosCash*100) div 100) then
          begin
            SaveInvoice(ZipPymtMethods);

            {Payment Was Made So generate Batch Info for that}
            for i:=0 to 4 do
            if PymtAmount[i]<>0 then
            begin
              if i=2 then continue; {Baying by Account there is no payment}
              {credit debtor account}
              // done : Pieter if no open open it.
              if not dmDatabase.tblBatchRefTotals.Active then
                 dmDatabase.tblBatchRefTotals.Active := true ;

              dmDatabase.tblBatchRefTotals.Append;
              dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
              dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
              dmDatabase.tblBatchRefTotalsSReference.Value := fmInvoiceEntryGrid.QDocHeadSDocNo.asstring;
              dmDatabase.tblBatchRefTotalsWAccountID.Value := fmInvoiceEntryGrid.QDocHeadWAccountID.AsInteger;
              dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(fmInvoiceEntryGrid.QDocHeadSACCOUNTCODE.AsString);
              dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
              dmDatabase.tblBatchRefTotalsNotUsed.Value:=1;
      //        ZipPymtMethods;
              dmDatabase.tblBatchRefTotalsFQty.Value:= PosPymtCode(i);
              //LastDocID;
              {Create Entries for Each Payment Method}
              Case i of
              1:begin
                  dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + LastDocNo + ' '+ TRN_CreditCard;
                end;
              2:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + fmInvoiceEntryGrid.QDocHeadSDocNo.asstring + ' '+ TRN_Account;
              3:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + fmInvoiceEntryGrid.QDocHeadSDocNo.asstring + ' '+ TRN_Voucher;
              4:dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + fmInvoiceEntryGrid.QDocHeadSDocNo.asstring + ' '+ TRN_Cheque;
              else
                dmDatabase.tblBatchRefTotalsSDescription.Value := DefDesc + fmInvoiceEntryGrid.QDocHeadSDocNo.asstring + ' '+ TRN_Cash;
              end;
              dmDatabase.tblBatchRefTotalsFCREDIT.Value := PymtAmount[i];
              dmDatabase.tblBatchRefTotalsFamount.Value := - PymtAmount[i];
              dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
              dmDatabase.tblBatchRefTotals.Post;
              {Debit Till Cash Account (Balancing Entry) }
              dmDatabase.tblBatchRefTotals.Append;
              dmDatabase.tblBatchRefTotalsDDate.Value := PosShiftDate; {This will be the Shift Date}
              dmDatabase.tblBatchRefTotalsDAllocatedDate.Value := dmDatabase.tblBatchRefTotalsDDate.Value;
              dmDatabase.tblBatchRefTotalsSReference.Value := '********';
              dmDatabase.tblBatchRefTotalsWAccountID.Value := TillAccountID;
              dmDatabase.tblBatchRefTotalsSACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
              dmDatabase.tblBatchRefTotalsSCONTRAACCOUNT.Value := AddDashInAccCodeNoPRefix(Contra);
              //LastDocID;
              {Create Entries for Each Payment Method}
              Case i of
              1 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvCreditCard,[LastDocNo]);
              2 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvAccount,[LastDocNo]);
              3 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvVoucher,[LastDocNo]);
              4 : dmDatabase.tblBatchRefTotalsSDescription.Value := format(TRN_InvCheque,[LastDocNo]);
              else
                dmDatabase.tblBatchRefTotalsSDescription.Value :=  format(TRN_InvCash,[LastDocNo]);
              end;
              dmDatabase.tblBatchRefTotalsFDEBIT.Value := PymtAmount[i];
              dmDatabase.tblBatchRefTotalsFamount.Value := PymtAmount[i];
              dmDatabase.tblBatchRefTotalsBExclusive.Value := 0;
              dmDatabase.tblBatchRefTotals.Post;
            end;
          end;
        end;
        finally
        fmPosPayments.Free;
        end;
      end;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  FormCreate(self);
  self.show ;
end;

procedure TfmPosInvoiceEntry.dtBarCodeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key =  vk_home then
     begin
        cxGrid1.setfocus ;
        cxGrid1DBTableView1.Controller.FocusedColumnIndex := 4 ;
     end;
end;

procedure TfmPosInvoiceEntry.dbgrdPosEntryKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key =  vk_home then
     begin
        edtBarCode.setfocus ;
     end;
end;

procedure TfmPosInvoiceEntry.Useweightdish1Click(Sender: TObject);
begin
  WeightCurline := not WeightCurline ;
  if WeightCurline then
   if not  dmDatabase.tblBatch.IsEmpty then
    begin
       dmDatabase.tblBatch.Edit ;
       cxGrid1DBTableView1.Controller.FocusedColumnIndex := 4 ;
    end;
end;

procedure TfmPosInvoiceEntry.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ExternalSalesOn then
  begin
    if OSFMessageDlg(GetTextLang(445){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) <> mrYes then
    begin
     Try
       While dmDatabase.tblBatch.RecordCount>0 do tblDeleteLineClick(Sender);
     except
     end;
    end
    else
      CanClose := False;
  end;
end;

procedure TfmPosInvoiceEntry.TimerSetPosDisplayTimer(Sender: TObject);
begin
 TimerSetPosDisplay.Enabled := false ;
 inc(Polstep);
 if Polstep < 20 then
    begin

     TimerSetPosDisplay.Interval :=  300 ;
     if Length(dmDatabase.tblBatchSDescription.AsString) > 20+Polstep then
     PrintToPole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString,FormatLeft(formatright(dmDatabase.tblBatchSDescription.AsString,(Length(dmDatabase.tblBatchSDescription.AsString))-Polstep),20),FormatLeft(FloatToStrF(dmDatabase.tblBatchFDEBIT.AsFloat,ffNumber,10,2),5)+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,15,2),15) )
     else
     PrintToPole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString,FormatLeft(dmDatabase.tblBatchSDescription.AsString,20),FormatLeft(FloatToStrF(dmDatabase.tblBatchFDEBIT.AsFloat,ffNumber,10,2),5)+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,15,2),15) ) ;

     TimerSetPosDisplay.Enabled := true ;
     end else
     begin
     PrintToPole(dispTypeLine,dmDatabase.tblBatchWLINEID.AsString,FormatLeft(gettextlang(3046){sub-total},10) + ' '+FormatRight(FloatToStrF(PosSum,ffNumber,18,2),9),
            FormatLeft(dmDatabase.tblBatchSDescription.Value,10)+' '+ FormatRight(FloatToStrF(dmDatabase.tblBatchFAmount.Value,ffNumber,10,2),9) );
     end;
end;

procedure TfmPosInvoiceEntry.PrintToSoftwarePole(DispType: Integer; LineId,
  Line1: String);
begin
  PrintOnSoftwarePoll(DispType ,LineId,#13#10+
         Line1);

end;

procedure TfmPosInvoiceEntry.ReprintLastInvoice1Click(Sender: TObject);
begin
 PrintDoc ;
end;

procedure TfmPosInvoiceEntry.dbgrdPosEntryRowChanged(Sender: TObject);
begin
 if edtBarCode.Focused then
   exit ;
 if dmDatabase.tblBatch.IsEmpty then
    exit ;


  if dmDatabase.tblBatch.FieldByName('SREFERENCE').AsString = '' then
  begin
   if not UseScanner then
   begin
   if SelectLookup(StkItem,True,'(WSTOCKTYPEID = 0 or WSTOCKTYPEID = 1 or WSTOCKTYPEID = 2 or WSTOCKTYPEID =4) and BDisabled = 0 ') then
     begin
     Application.ProcessMessages ;
     AddItem(False);
     cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1FDEBIT.Index;
     end else
     if dmDatabase.tblBatch.State = dsbrowse then
        dmDatabase.tblBatch.edit ;
   end else
   begin
      edtBarCode.SetFocus ;
     if dmDatabase.tblBatch.State = dsbrowse then
        dmDatabase.tblBatch.edit ;
   end;
  end;
end;

procedure TfmPosInvoiceEntry.dbgrdPosEntryMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 TAutologout.Enabled := false ;
 TAutologout.Enabled := TAutologout.Interval <> 0 ;
end;

procedure TfmPosInvoiceEntry.TAutologoutTimer(Sender: TObject);
begin
 TAutologout.Enabled := false ;
 if (dmDatabase.tblBatch.RecordCount > 0) or
    (dmDatabase.tblBatch.State = dsinsert) or
    (BSelectList.Visible) then
    begin
      TAutologout.Enabled := True ;
      exit ;
    end;

 modalresult := 99 ;
 //self.close ;
end;

procedure TfmPosInvoiceEntry.tblProcessMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
TAutologout.Enabled := false ;
end;

procedure TfmPosInvoiceEntry.TSavelistClick(Sender: TObject);
var
 i : Integer ;
begin
   TAutologout.Enabled := false ;
if not dmDatabase.tblBatch.IsEmpty then
 begin
 if CurrentListName = '' then
   begin
    CurrentListName := InputBox('Name','Enter name',FormatDateTime('yyyymmdd-hhmm',now)) ;
    while AListCollection.SQLCollection.GetItemByName(CurrentListName) <> nil do
          CurrentListName := InputBox('Name','The name '+CurrentListName+' already exsists Please enter unique name',FormatDateTime('yyyymmdd-hhmm',now)) ;
   end;
  if  AListCollection.SQLCollection.GetItemByName(CurrentListName) = nil then
      begin
        AListCollection.SQLCollection.Add.Name := CurrentListName;

      end;
    // save to list
    with AListCollection.SQLCollection.GetItemByName(CurrentListName) do
       begin
          SQL.Clear ;
          SQL.Add('SSTOCKCODE'+#9+'FQTY' +#9+'FPRICE') ;
          dmDatabase.tblBatch.First ;
          while not dmDatabase.tblBatch.Eof do
             begin
               SQL.Add(dmDatabase.tblBatchSREFERENCE.AsString +#9 + StringReplace( dmDatabase.tblBatchFDEBIT.AsString,DecimalSeparator,'.',[rfReplaceAll])
                      +#9 + StringReplace( dmDatabase.tblBatchSACCOUNT.AsString,DecimalSeparator,'.',[rfReplaceAll]) );
               dmDatabase.tblBatch.Next ;
             end;
          SQL.SaveToFile(ListBaseFolder+CurrentListName+'.txt');
          while not dmDatabase.tblBatch.IsEmpty do
               dmDatabase.tblBatch.Delete ;
       end;
     CurrentListName := '' ;  
  end ;
  begin
     // load list
     cbListSelect.Clear ;
     for i := 0 to AListCollection.SQLCollection.Count -1 do
        begin
         cbListSelect.Items.Add(AListCollection.SQLCollection.Items[i].Name) ;
        end;
   cbListSelect.Visible:= True ;
   BSelectList.Visible:= True ;
   BDeleteList.Visible:= True ;
   BRename.Visible:= True ;
   BCopy.Visible:= True ;
  end;

end;

procedure TfmPosInvoiceEntry.ScanFolder;
Var
 ASearchRec : TSearchRec ;
begin
   AListCollection.SQLCollection.Clear ;
    if FindFirst(ListBaseFolder +'*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        with AListCollection.SQLCollection.add  do
        begin
            SQL.LoadFromFile(ListBaseFolder+ASearchRec.name);
            Name := ChangeFileExt(ASearchRec.name,'');
        end;
      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;
end;

procedure TfmPosInvoiceEntry.BSelectListClick(Sender: TObject);
begin
 if cbListSelect.ItemIndex <> -1 then
     begin
      // clear list
      CurrentListName := cbListSelect.Text ;
      if AListCollection.SQLCollection.GetItemByName(CurrentListName) <> nil then
           begin
             // load item
             LoadFile ;
           end;
     end;
  cbListSelect.Visible:= false ;
  BSelectList.Visible:= false ;
  BDeleteList.Visible:= false ;
  BRename.Visible:= false ;
  BCopy.Visible:= false ;
end;

procedure TfmPosInvoiceEntry.BDeleteListClick(Sender: TObject);
begin
 if cbListSelect.ItemIndex <> -1 then
     begin
      // clear list
      CurrentListName := cbListSelect.Text ;
      if AListCollection.SQLCollection.GetItemByName(CurrentListName) <> nil then
           begin
             // delete item
             DeleteFile(ListBaseFolder + CurrentListName +'.txt') ;
             AListCollection.SQLCollection.Delete(AListCollection.SQLCollection.GetItemByName(CurrentListName).Index);
             CurrentListName := '' ;
           end;
     end;
  cbListSelect.Visible:= false ;
  BSelectList.Visible:= false ;
  BDeleteList.Visible:= false ;
  BRename.Visible:= false ;
  BCopy.Visible:= false ;
end;
procedure TfmPosInvoiceEntry.LoadFile;
var
 ATabFile,ALines,AHeaders : TStringlist ;
 i ,IndexStock,IndexQty,IndexBarcode,IndexPrice : Integer ;
 MyStock : TStockRec ;
 FQty,FPrice : double ;
 Function FindIndex(Aname:String):Integer ;
 var
  x : Integer ;
 begin
   result := -1 ;
    for x := 0 to AHeaders.Count -1 do
      if UpperCase(Aname)= UpperCase(AHeaders[x]) then
        result := x ;
 end;
begin
   ATabFile := TStringlist.create ;
   ALines  := TStringlist.create ;
   ALines.Delimiter := #9 ;
   AHeaders := TStringlist.create ;
   AHeaders.Delimiter := #9 ;
   try
   ATabFile.LoadFromFile(ListBaseFolder+CurrentListName+'.txt');
   if ATabFile.Count >0 then
      AHeaders.DelimitedText := ATabFile[0];

     IndexStock := FindIndex('SSTOCKCODE') ;
     IndexQty := FindIndex('FQTY') ;
     IndexBarcode := FindIndex('SBARCODE') ;
     IndexPrice := FindIndex('FPRICE') ;
     MyStock.WStockID := -1 ;
     if ((IndexStock = -1 ) and (IndexBarcode = -1)) or (IndexQty =-1) or (IndexPrice =-1) then
        raise Exception.Create('Missing columns you need SSTOCKCODE , FQTY, SBARCODE,FPRICE in a tab delimited file.');
 
   dmDatabase.tblBatchFCREDIT.ReadOnly := false;
   dmDatabase.tblBatchFAmount.ReadOnly := false;
   dmDatabase.tblBatchSACCOUNT.ReadOnly := false;
   dmDatabase.tblBatch.DisableControls ;
   try

   for i := 1 to ATabFile.count -1 do
      begin

    ALines.DelimitedText :=  ATabFile[i];
      if IndexStock <> -1 then
        begin
         if ALines.Count > IndexStock then
         MyStock.WStockID := StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WStockid from stock where sstockcode ='+ QuotedStr(ALines[IndexStock]))),-1);
         if MyStock.WStockID <> -1 then
            TDataBaseStockRoutines.StockLoadItem(MyStock) ;
        end;
      if (IndexBarcode <> -1) and (MyStock.WStockID = -1)  then
        begin
        if ALines.Count > IndexBarcode then
         MyStock.WStockID := StrToIntDef(varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WStockid from stock where sbarcodenumber ='+ QuotedStr(ALines[IndexBarcode]))),-1);
         if MyStock.WStockID <> -1 then
            LoadStockItem(MyStock) ;
        end;
      FQty := 0 ;
      FPrice  := 0 ;
      if ALines.Count > IndexQty then
      FQty :=  StrToFloatDef(StringReplace(ALines[IndexQty],'.',DecimalSeparator,[rfReplaceAll]),0) ;
      if ALines.Count > IndexPrice then
      FPrice  := StrToFloatDef(StringReplace(ALines[IndexPrice],'.',DecimalSeparator,[rfReplaceAll]),0) ;




    dmDatabase.tblBatch.Append;
  dmDatabase.tblBatchsProfile.AsString:='';
  dmDatabase.tblBatchsReference.Value:=MyStock.SSTOCKCODE;
  dmDatabase.tblBatchSDescription.Value:=MyStock.SDescription;
  dmDatabase.tblBatchFTax2Amount.AsInteger := MyStock.WStockID ;
  dmDatabase.tblBatchFQty.Value := MyStock.FOutputRate;

  dmDatabase.tblBatchFDEBIT.AsFloat := FQty ;

  FPrice := ((FPrice / MyStock.FOutputRate) * 1)  ;
  if CurCustAccount.WDEfaultTaxId <> 0 then
     begin
       StkItem.WOutputTaxID := CurCustAccount.WDEfaultTaxId ;
       StkItem.SOutTax  := GetAccountCode(MyStock.WOutputTaxID);
       StkItem.FOutputRate := GetTaxRate(MyStock.SOutTax );
     end;

  dmDatabase.tblBatchSACCOUNT.Value := FormatFloat(GetViewMask(0),AmtFix(FPrice* MyStock.FOutputRate));
  dmDatabase.tblBatchFAmount.Value := AmtFix((FPrice* MyStock.FOutputRate)* (dmDatabase.tblBatchFDEBIT.Value-dmDatabase.tblBatchFCREDIT.Value));
  dmDatabase.tblBatchFTaxAmount.Value := AmtFix((FPrice * (MyStock.FOutputRate-1))* (dmDatabase.tblBatchFDEBIT.Value-dmDatabase.tblBatchFCREDIT.Value));
  dmDatabase.tblBatchSCONTRAACCOUNT.Value := IntToStr(MyStock.WStockID);
  dmDatabase.tblBatchSTAX.Value := MyStock.SOutTax;
  dmDatabase.tblBatchWaccountID.Value := StkItem.WOutputTaxID;
  dmDatabase.tblBatchBExclusive.AsInteger := 0 ;

  if dmDatabase.tblBatchWLineID.IsNull then
  begin
  dmDatabase.qGenBatchId.SQL.Text := 'select max(WLineID)  from ' + dmDatabase.tblBatch.TableName ;
  dmDatabase.qGenBatchId.open ;
  dmDatabase.tblBatchWLineID.AsInteger := dmDatabase.qGenBatchId.fields[0].asinteger   + 1 ;
  dmDatabase.qGenBatchId.close ;
  end;
  dmDatabase.tblBatch.Post;
  RefreshDiplay ;
     end;
   finally

    if ChangeDiscount and not(PasswordUsed) then
      begin
      dmDatabase.tblBatchFCREDIT.ReadOnly := true;
      dmDatabase.tblBatchFAmount.ReadOnly := true;
      dmDatabase.tblBatchSACCOUNT.ReadOnly := true;
      end;
    dmDatabase.tblBatch.EnableControls ;

   end;
   finally
    ATabFile.free ;
    ALines.free ;
    AHeaders.free ;
   end ;
end;



procedure TfmPosInvoiceEntry.BRenameClick(Sender: TObject);
begin
 if cbListSelect.ItemIndex <> -1 then
     begin
      if AListCollection.SQLCollection.GetItemByName(cbListSelect.Text) <> nil then
           begin
             // delete item
             CurrentListName := InputBox('Name','Enter name',FormatDateTime('yyyymmdd-hhmm',now)) ;
             if AListCollection.SQLCollection.GetItemByName(CurrentListName) = nil then
                begin
                 AListCollection.SQLCollection.GetItemByName(cbListSelect.Text).Name := CurrentListName ;
                 RenameFile(ListBaseFolder + cbListSelect.Text + '.txt',ListBaseFolder + CurrentListName +'.txt') ;
                 cbListSelect.Items[cbListSelect.ItemIndex] := CurrentListName ;
                end;
           end;
     end;
  cbListSelect.Visible:= false ;
  BSelectList.Visible:= false ;
  BDeleteList.Visible:= false ;
  BRename.Visible:= false ;
  BCopy.Visible:= false ;
end;

procedure TfmPosInvoiceEntry.BCopyClick(Sender: TObject);
begin
if cbListSelect.ItemIndex <> -1 then
     begin
      if AListCollection.SQLCollection.GetItemByName(cbListSelect.Text) <> nil then
           begin
             // delete item
             CurrentListName := InputBox('Name','Enter name',FormatDateTime('yyyymmdd-hhmm',now)) ;
             if AListCollection.SQLCollection.GetItemByName(CurrentListName) = nil then
                begin
                 with AListCollection.SQLCollection.Add as TSqlCollectionItem do
                   begin
                      Name :=  CurrentListName ;
                      SQl.Text := AListCollection.SQLCollection.GetItemByName(cbListSelect.Text).SQL.Text ;
                      SQL.SaveToFile(ListBaseFolder + CurrentListName +'.txt'); 
                      cbListSelect.Items.Add(CurrentListName) ;
                      cbListSelect.ItemIndex := cbListSelect.Items.Count -1  ;
                   end;
                end;
           end;
     end;
  cbListSelect.Visible:= false ;
  BSelectList.Visible:= false ;
  BDeleteList.Visible:= false ;
  BRename.Visible:= false ;
  BCopy.Visible:= false ;
end;

procedure TfmPosInvoiceEntry.FormResize(Sender: TObject);
begin
 if self.Width < 750 then
    ScrollBox1.HorzScrollBar.Range := 750 ;
end;

procedure TfmPosInvoiceEntry.cxGrid1DBTableView1DblClick(Sender: TObject);
var
 AOldValue : Double ;
begin
  if dmDatabase.dsBatch.DataSet.IsEmpty then exit ;
  if DMTCCoreLink.ReadSysParam('LookupButtons',false,CurrentUser) then
    begin
       if (TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName = 'SACCOUNT') or (TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName = 'FDEBIT') then
        if not TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.Field.ReadOnly then
          begin
           dmDatabase.dsBatch.DataSet.Edit ;
           AOldValue := TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.Field.asfloat ;
           if CallCalc(AOldValue) then
              TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.Field.AsFloat := AOldValue ;
           end;
    end;
end;

procedure TfmPosInvoiceEntry.cxGrid1DBTableView1SACCOUNTPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
Function MustCheck:Boolean;
  begin
    Result := SameText(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,'SACCOUNT')
           or SameText(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,'FDEBIT') or SameText(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,'FCREDIT') or SameText(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,'FAMOUNT');
  end;

begin
  TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.Field.DataSet.Edit ;
  TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.Field.Text := DisplayValue ;


  // done : Pieter detatch
  dmDatabase.tblBatchFCREDIT.ReadOnly := false;
  dmDatabase.tblBatchFAmount.ReadOnly := false;
  dmDatabase.tblBatchSACCOUNT.ReadOnly := false;

  try

   if (dmDatabase.FieldInMod= cxGrid1DBTableView1.Controller.FocusedColumnIndex) or  Not MustCheck then
     begin
      RefreshDiplay ;
      exit;
     end;
   dmDatabase.FieldInMod:=cxGrid1DBTableView1.Controller.FocusedColumnIndex;
//   if SameText(Field.FieldName,'SACCOUNT') or
//      SameText(Field.FieldName,'FDEBIT') or
//      SameText(Field.FieldName,'FCREDIT') then
   if MustCheck then
   begin
      if  StkItem.WStockID <>   dmDatabase.tblBatchFTax2Amount.AsInteger then
       begin
       StkItem.WStockID :=   dmDatabase.tblBatchFTax2Amount.AsInteger  ;
       LoadStockItem(StkItem);
       WeightCurline := false ;
       end;
       
   if DOCCantSellOutOfStock then
    begin
       if (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)+dmDatabase.tblBatchFDEBIT.AsFloat)) < 0 then
        begin
          ShowOutOfStockMessage := true ;
          if (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0))) > 0 then
          dmDatabase.tblBatchFDEBIT.AsFloat := (StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)))
         else
         dmDatabase.tblBatchFDEBIT.AsFloat := 0 ;
        end;
    end;
    if SameText(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,'FAMOUNT') then
       begin
        dmDatabase.tblBatchSACCOUNT.AsString := FormatFloat(GetViewMask(0),dmDatabase.tblBatchFAMOUNT.AsFloat / dmDatabase.tblBatchFDEBIT.Value) ;
        dmDatabase.tblBatchFTaxAmount.Value := AmtFix(dmDatabase.tblBatchFAmount.Value *Tax1m(dmDatabase.tblBatchFQty.Value));
       end
    else
    begin
     dmDatabase.tblBatchFAmount.Value := CalcAmount;
     dmDatabase.tblBatchFTaxAmount.Value := AmtFix(dmDatabase.tblBatchFAmount.Value *Tax1m(dmDatabase.tblBatchFQty.Value));
    end;

      If POSShowQtyOnhand then
        begin
          Caption := GetTextLang(1714) + ' : ' +  StkItem.SDescription +' : ' + FloatToStr(StkItem.FQtyOnHand - (TDataBaseStockRoutines.GetUnpostedStockItemCount(StkItem.WStockID,0)+dmDatabase.tblBatchFDEBIT.AsFloat)) ;
        end;    
   end;
   RefreshDiplay;
  dmDatabase.FieldInMod:=0;
  finally
 
  end;
  if ChangeDiscount and not(PasswordUsed) then
  begin
  dmDatabase.tblBatchFCREDIT.ReadOnly := true;
  dmDatabase.tblBatchFAmount.ReadOnly := true;
  dmDatabase.tblBatchSACCOUNT.ReadOnly := true;
  end;
end;


procedure TfmPosInvoiceEntry.cxGrid1DBTableView1SREFERENCEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  dbStockLookupDropDown(self);
end;

end.


