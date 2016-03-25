(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Main;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, inifiles,Menus, ToolWin, StdCtrls, ExtCtrls, FileCtrl, Jpeg, HTMLHelpAPI,
  printers,  ImgList, ShellAPi,  ScktComp,db,  ExtDlgs, TcashClasses,  VpBase,
  VpNavBar,UPluginsSharedUnit,UCheckPlugins,rpgraphutilsvcl,DBAccess , Uni,
  uOsfresources, MemDS, DALoader, UniLoader, CREncryption, UniDacVcl,
  DAAlerter, UniAlerter, DADump, UniDump, ActnMan, ActnCtrls, ActnList,
   Buttons,  pngimage, PlatformDefaultStyleActnCtrls, cxGraphics, Ribbon,
  RibbonLunaStyleActnCtrls, ActnMenus, RibbonActnMenus,
  RibbonSilverStyleActnCtrls, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  ActnPopup, cxImage, ScreenTips;

const WM_ICONTRAY = WM_USER + 1 ;
type
 twf_TfmMainSetup  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;
 twf_TfmMainPlugins  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;
 twf_TfmMain  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    procedure ExtraClick (sender : TObject) ;
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;

  TfmMain = class(TForm)
    EditDeleteDocuments: TMenuItem;
    DlgSaveAs: TSaveDialog;
    ExportDialog: TSaveDialog;
    FontDialog: TFontDialog;
    Label2: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    OpenDialog: TOpenDialog;
    MainProgressBar: TProgressBar;
    MainStatusBar: TStatusBar;
    TOpenBooks: TTimer;
    PTabs: TPanel;
    PCMain: TPageControl;
    TSStart: TTabSheet;
    TSDebtors: TTabSheet;
    TSCreditors: TTabSheet;
    TSStock: TTabSheet;
    TSCalender: TTabSheet;
    tsDocuments: TTabSheet;
    TUbutuFix: TTimer;
    LReportmenu: TcxImageList;
    ActionManager1: TActionManager;
    aFileOpen: TAction;
    AToolsBackup: TAction;
    mainRibbon: TRibbon;
    rgStart: TRibbonPage;
    rbFile: TRibbonGroup;
    tlBtnBatch: TAction;
    InputInvoices: TAction;
    tlbtnRecon: TAction;
    CloseSetofBooks1: TAction;
    FileSwitch: TAction;
    rgActions: TRibbonPage;
    bActions: TRibbonGroup;
    rbReports: TRibbonGroup;
    EditAccountsDebtor: TAction;
    EditAccountsCreditor: TAction;
    EditStockItems: TAction;
    InputCreditNotes: TAction;
    tlbtnLink: TAction;
    btlSearch: TAction;
    TBPlugin: TAction;
    TUnregistered: TAction;
    bWorkflow2: TAction;
    rgReport: TRibbonPage;
    rgSetupGroup: TRibbonGroup;
    pmEdit: TPopupMenu;
    Ledgerviewer1: TAction;
    Ledgerviewer2: TAction;
    EditDelete: TAction;
    rbEdit: TRibbonGroup;
    InputCalendar: TAction;
    AccountViewer1: TAction;
    ilbandsmall: TImageList;
    ilbandlarge: TImageList;
    ADocuments: TAction;
    Quotations1: TAction;
    PosInvoice2: TAction;
    InputPurchases: TAction;
    Order1: TAction;
    InputStockReturns: TAction;
    ReportDesigner1: TAction;
    Accounts1: TAction;
    Contact1: TAction;
    Workflowsetup1: TAction;
    SetupGroups: TAction;
    SetupAccessControl: TAction;
    SetupCompanyInfo: TAction;
    SetupDocuments: TAction;
    SetupStockInfo: TAction;
    SetupBatchTypes: TAction;
    SetupPrinter: TAction;
    ToolsGlobalProcessesDoYearEnd: TAction;
    SetupReportingDates: TAction;
    rbtools: TRibbonGroup;
    reportsPointofSale1: TAction;
    FileCreate: TAction;
    FileExit: TAction;
    ToolsExport1: TAction;
    Import1: TAction;
    FileSaveAs: TAction;
    FileDelete: TAction;
    PointOfSales1: TAction;
    InputProjects: TAction;
    rbuser: TRibbonPage;
    rgUser: TRibbonGroup;
    rguser2: TRibbonGroup;
    rguser3: TRibbonGroup;
    rguser4: TRibbonGroup;
    rguser5: TRibbonGroup;
    rguser6: TRibbonGroup;
    rglisten: TRibbonGroup;
    cbautolearn: TCheckBox;
    cxAddToGroup: TcxImageComboBox;
    InputCreditNotesUpdateLedger: TAction;
    EditRepeatingEntries: TAction;
    EditRepeatingInvoices: TAction;
    Action1: TAction;
    Webshop: TAction;
    Bugreportsourceforge1: TAction;
    HelpHelp: TAction;
    HelpAbout: TAction;
    ToolsSupport: TAction;
    ShowTipoftheDay1: TAction;
    RegistrationOnLine1: TAction;
    Forum1: TAction;
    InputAdjustStock: TAction;
    InputConfirm: TAction;
    Backorders1: TAction;
    FinancialCategories1: TAction;
    BackupPath: TAction;
    SetupDataEntry: TAction;
    SetupInternet: TAction;
    SetupSalesman: TAction;
    Currencies1: TAction;
    ToolsCalculator: TAction;
    DataIntegrityCheck1: TAction;
    Customizelanguage1: TAction;
    Closeopensforms1: TAction;
    Activateplugins1: TAction;
    PopupActionBar1: TPopupActionBar;
    rbgActiveedit: TRibbonGroup;
    aEditUserbar: TAction;
    rgSetup: TRibbonPage;
    ThemeItem0: TAction;
    Reversebatch1: TAction;
    ToolsGlobalProcessesClearReset: TAction;
    Copyfromasetofbooks1: TAction;
    imgBack: TcxImage;
    Image1: TImage;
    TrayIcon1: TTrayIcon;
    ScreenTipsManager1: TScreenTipsManager;
    procedure HelpAboutClick(Sender: TObject);
    procedure FileOpen2Click(Sender: TObject);
    procedure FileCreateClick(Sender: TObject);
    procedure FileDeleteClick(Sender: TObject);
    procedure FileExitClick(Sender: TObject);
    procedure SetupPrinterClick(Sender: TObject);
    procedure SetupColoursClassicClick(Sender: TObject);
    procedure SetupColoursBrilliantClick(Sender: TObject);
    procedure SetupColoursPastelClick(Sender: TObject);
    procedure SetupColoursNewSAClick(Sender: TObject);
    procedure SetupColoursKeywestClick(Sender: TObject);
    procedure SetupColoursWindowsDefaultClick(Sender: TObject);
    procedure ToolsBackupClick(Sender: TObject);
    procedure ToolsCalculatorClick(Sender: TObject);
    procedure ToolsSupportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetupAccessControlClick(Sender: TObject);
    procedure SetupBatchTypesClick(Sender: TObject);
    procedure SetupCompanyInfoClick(Sender: TObject);
    procedure SetupGroupsClick(Sender: TObject);
    procedure SetupReportingDatesClick(Sender: TObject);
    procedure SetupSalesmanClick(Sender: TObject);
    procedure SetupDocumentsClick(Sender: TObject);
    procedure SetupStockInfoClick(Sender: TObject);
    procedure SetupPaymentTypesClick(Sender: TObject);
    procedure InputBatchEntryClick(Sender: TObject);
    procedure ReportsGeneralLedgerTrialBalanceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolsImport1Click(Sender: TObject);
    procedure InputReconcileBankClick(Sender: TObject);
    procedure ToolsGlobalProcessesClearResetClick(Sender: TObject);
    procedure FileSwitch3Click(Sender: TObject);
    procedure ReportsDebtorAgeAnalysisClick(Sender: TObject);
    procedure ThemeItem0Click(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure HelpHelpClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ReportsInvoicesInvoiceHistoryClick(Sender: TObject);
    procedure InputOpenItemLinkClick(Sender: TObject);
    procedure ReportsGeneralLedgerIncomeStatementClick(Sender: TObject);
    procedure ReportsGeneralLedgerBalanceSheetClick(Sender: TObject);
    procedure ToolsPublishClick(Sender: TObject);
    procedure SetupDataEntryClick(Sender: TObject);
    procedure FileSaveAsClick(Sender: TObject);
    procedure EditRepeatingEntriesClick(Sender: TObject);
    procedure EditRepeatingInvoicesClick(Sender: TObject);
    procedure ToolsGlobalProcessesDoYearEndClick(Sender: TObject);
    procedure tlbtnInvoice2Click(Sender: TObject);
    procedure InputCreditNotesUpdateLedgerClick(Sender: TObject);
    procedure EditDeleteDocumentsClick(Sender: TObject);
    procedure InputAdjustStockClick(Sender: TObject);
    procedure RegistrationOnLine1Click(Sender: TObject);
    procedure SetupClientServerClick(Sender: TObject);
    procedure SetupInternetClick(Sender: TObject);
    procedure InputStockReturnsClick(Sender: TObject);
    procedure Quotations1Click(Sender: TObject);
    procedure InputPurchasesClick(Sender: TObject);
    procedure Orders1Click(Sender: TObject);
    procedure InputCreditNotesClick(Sender: TObject);
    procedure Fonts1Click(Sender: TObject);
    procedure ToolsExport1Click(Sender: TObject);
    procedure PrinterSetupDialogClose(Sender: TObject);
    procedure InputConfirmClick(Sender: TObject);
    procedure DataIntegrityCheck1Click(Sender: TObject);
    procedure Contact1Click(Sender: TObject);
    procedure EditDeleteContactClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolsGlobalProcessesTransferBalancesClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FinancialCategories1Click(Sender: TObject);
    procedure ShowTipoftheDay1Click(Sender: TObject);
    Procedure UpDateProgressBar( Sender: TObject; Percent: LongInt );
    procedure CloseSetofBooks13Click(Sender: TObject);
    procedure Customizelanguage1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    // ext plugins routines
    procedure ShowDocumentFromPlugin(Sender: TObject);
    procedure ProcessBatchFromPlugin(Sender: TObject);
    procedure OpenBatchFromPlugin(Sender: TObject);
    procedure ProcessExtPosFromPlugin(Sender: TObject);
    procedure OpenNewYearFromPlugin(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BackupPathClick(Sender: TObject);
    procedure PointOfSales1Click(Sender: TObject);
    procedure POSInvoice1Click(Sender: TObject);
    procedure InvestigatorClick(Sender: TObject);
    procedure AccountViewer1Click(Sender: TObject);
    procedure PointofSale1Click(Sender: TObject);
    procedure ReportDesigner1Click(Sender: TObject);
    procedure Reversebatch1Click(Sender: TObject);
    procedure Windows20041Click(Sender: TObject);
    procedure TBPluginClick(Sender: TObject);
    procedure Forum1Click(Sender: TObject);
    procedure InputCalendarClick(Sender: TObject);
    procedure MainStatusBarDblClick(Sender: TObject);
    procedure Bugreportsourceforge1Click(Sender: TObject);
    procedure Copyfromasetofbooks1Click(Sender: TObject);
    procedure TOpenBooksTimer(Sender: TObject);
    procedure WebshopClick(Sender: TObject);
    procedure PCMainChange(Sender: TObject);
    procedure NVBMainItemClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; Index: Integer);
    procedure Ledgerviewer1Click(Sender: TObject);
    procedure Accounts1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure InputProjectsClick(Sender: TObject);
    procedure MainStatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure Closeopensforms1Click(Sender: TObject);
    procedure Backorders1Click(Sender: TObject);
    procedure Activateplugins1Click(Sender: TObject);
    procedure TUbutuFixTimer(Sender: TObject);
    procedure bWorkflowClick(Sender: TObject);
    procedure Workflowsetup1Click(Sender: TObject);
    procedure Currencies1Click(Sender: TObject);
    procedure mainRibbonHelpButtonClick(Sender: TObject);
    procedure mainRibbonTabChange(Sender: TObject; const NewIndex,
      OldIndex: Integer; var AllowChange: Boolean);
    procedure EditAccountsDebtorExecute(Sender: TObject);
    procedure EditAccountsCreditorExecute(Sender: TObject);
    procedure EditStockItemsExecute(Sender: TObject);
    procedure Ledgerviewer1Execute(Sender: TObject);
    procedure Ledgerviewer2Execute(Sender: TObject);
    procedure EditDeleteExecute(Sender: TObject);
    procedure ActionManager1Execute(Action: TBasicAction; var Handled: Boolean);
    procedure ADocumentsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupActionBar1Popup(Sender: TObject);
    procedure aEditUserbarExecute(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
  private
    FPluginIteractClass: TPluginIteractClass;
    LastTheme ,ThemeClicked: Integer ;
    hasRunedOnce,InCloseUp  : Boolean ;
    BDisableOnActivate : Boolean ;
    FIniFilePath: String;
    FcheckPlugins : TfmCheckPlugins ;

    Procedure LoadThemes;
    function GetKDEThemeIndex : Integer ;
    procedure LoadPluginsDLL ;
    procedure LoadPluginsEXE;
    Procedure ThemeChecked(ThemeID:Integer);
    Function  CheckRandTheme(Var ThemeID:Integer):Boolean;
    Function  GetRandThemeID:Integer;
    Procedure UpDateBatThemes;
    Procedure RunPlugInsDLLProgram(Sender: TObject);
    procedure RunPlugInsEXEProgram(Sender: TObject);
    procedure SetMYBidiMode(AComponent: TComponent; Mode: Integer);
    procedure BuildUserReportmenu;

    procedure HandelUserReport(Sender: TObject);
    procedure HandelUserReportBand(Sender: TObject);
    procedure OnMessage(var Msg: TMsg; var Handled: Boolean);
    function Jpg1File: String;
    procedure SetIniFilePath(const Value: String);
    function GetIniFilePath: String;
    procedure SetPluginIteractClass(const Value: TPluginIteractClass);
    procedure osFRepmanEmail(AFileName: String);
    procedure initDynaScreen;
    function GetBatchDisabledButton: TImageList;
    function GetBatchEnabledButton: TImageList;
    function GetDisabledButtonImageList: TImageList;
    function GetEnabledButtonImageList: TImageList;
    function GetMenuImages: TImageList;
    procedure BuildUserReportmenuItemsActions(Atype: Integer;
      AMenuItem: TActionClientItem; ADir: String);
    function GetPathFromMenuItemRepmanBand(AMenuitem,
      StopItem: TActionClientItem): String;
    procedure HandelUserReportBandCust(Sender: TObject);
    procedure InitUserItems;
    { Private declarations }
  public
     ThemeClientITem ,PluginClientItem: TActionClient ;

    AEditAddItemToDocPlugin : TFormPluginRecord ;
    ErrorlistString,LastActiveFormName : String ;
    FMonoMask       : TBitMap;
    NextJpg1      : Integer ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    ArrayImageIndex : Array [0..15] of integer ;
    APluginsFormsList : TStringlist ;
    AllowedPluginList : TSTringlist ;


    procedure initMainplugins ;
    procedure ClearPlugins ;
    procedure TPluginClick(Sender: TObject);
    procedure TDynaClick(Sender: TObject);



    procedure MergeIniFile ;
    Procedure MyHandlExceptions(Sender: TObject; E: Exception);
    Procedure UpDateThemes(Var ThemeID:Integer;UpDateSysVars:Boolean);
    procedure UpdateColorsForThema ;
    procedure SetUPTranslation ;

     function StdPluginVisible : Boolean ;

   // Procedure AddXPStyle(Sender: TObject);
    function GetPathFromMenuItem(AMenuitem : TMenuItem;StopItem : TMenuItem ): String;
    function GetPathFromMenuItemRepman(AMenuitem : TMenuItem;StopItem : TMenuItem ): String;
    function GetGroupnameFromMenuItemRepman(AMenuitem : TActionClientItem;StopItem : TActionClientItem ): String;
    procedure LoadExtraLargeIcons ;
    function DllHasFunction(Aname: String): Boolean;

   published
    property IniFilePath : String  read GetIniFilePath write SetIniFilePath;
    property PluginIteractClass: TPluginIteractClass read FPluginIteractClass write SetPluginIteractClass;
    procedure CallPluginInteract(Sender: TObject);
    { Public declarations }
    property DisabledButtonImageList: TImageList read GetDisabledButtonImageList;
    property EnabledButtonImageList: TImageList read GetEnabledButtonImageList;
    property BatchEnabledButtons: TImageList read GetBatchEnabledButton;
    property MenuImages: TImageList read GetMenuImages;
    property BatchDisabledButtons: TImageList read GetBatchDisabledButton;

  end;

  Function LoadT3BiTmap(Var BitMap:TBitMap;BitName:String):Boolean;
  procedure AddFormToSkin(AForm , AOwner: TForm);
  procedure SkinForm(AForm : TForm);

var
   fmMain           : TfmMain;


implementation

uses variants,registry,About, OpenASetOfBooks, DeleteASetOfBooks,
  GlobalFunctions, Database, AccessControl,
  BatchTypes, CompanyInfo, Groups, Periods, Salesman,
   DocSetup, StockInfo,  PaymentType,
  Debtor,   SelectBatchType,
    Directory, ReconOptions, LanguageChoice,  StockEntry,
   UpdateInvoice, InvoiceHistory, OpenLink,
   DataEntry, SaveAs, InvoiceEntryGrid, IntroScreen,
      SelectAccountType,
   Fonts, ConfirmDocs, DataIntegrityCheck,
  TransfertTrans, Support, FinancialCategories,
  ZipBackupRestore, ContactListing, CreationCompWiz,  CustomLang,
   ExportTcData,  PosSetup, PosEntry,
  PosPassword, TcVariables,  CentralSearch,
  TAccountView, DatabaseAccess, PosReportOptions, DataImport,
  FreeReportsUnit, ReverseBatch, TCDayPlanner,VpSRVars,WelcomHelp,typinfo,
  XRoutines,  Progress,Themes ,OSFGeneralRoutines,
  Math, UDMTCCoreLink, USetPrinters, Registration, Lookup,
  UAccountTreeView, UGeneralEditAccount, DateUtils,
   UMainJobProject,rpeval, rpalias, BatchEntryBank, 
  BackOrdersOutstanding, SendEmailReport, Uworkflowsetup, UWorkFlowHandel,
  UWorkFlowDatamodule, UEditCurrencies, NetSetUp, UTranslateQuantumgrid,
  UDmQuantumGridDefs,cxStyles,RibbonConsts,cxclasses;

{$R *.DFM}



function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := CompareStr(Uppercase(List[Index1]),
                                UpperCase(List[Index2]));
end;


function StringListPluginsCompare(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if Index1 = Index2 then
    result := 0
   else         
  if (ExtractFileName(Uppercase(List[Index1])) ='FREEFIELDS.' + Uppercase(PluginsDLLName) ) and
     (ExtractFileName(Uppercase(List[Index2])) ='MULTIMEDIA.' + Uppercase(PluginsDLLName)) then
    result := 0 else
  if ExtractFileName(Uppercase(List[Index1])) ='FREEFIELDS.'+ Uppercase(PluginsDLLName) then
     result := -1 else
  if ExtractFileName(Uppercase(List[Index1])) ='MULTIMEDIA.'+ Uppercase(PluginsDLLName) then
     result := -1 else
  if ExtractFileName(Uppercase(List[Index2])) ='ECOMMERCE.'+ Uppercase(PluginsDLLName) then
     result := -1 else
  Result := CompareStr(Uppercase(List[Index1]),
                                UpperCase(List[Index2]));
                                
end;
procedure SkinForm(AForm : TForm);
begin
 { if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
           if Active then
             SkinForm(AForm.Handle);
           end;
       end;   }
end;


procedure AddFormToSkin(AForm , AOwner: TForm);
begin
 { if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
            if Active then
               AddNestForm(AOwner,AForm);
           end;
       end;   }
end;


 procedure TfmMain.OnMessage
(var Msg: TMsg; var Handled: Boolean) ;
var
// i: Integer;
y : Longint ;
GridControl : TControl ;
begin
if Msg.message = WM_MOUSEWHEEL then
begin
 
 glLastMouseWeel := GetTickCount ;
Msg.message := WM_KEYDOWN;
Msg.lParam := 0;
y := Msg.wParam ;
// i := y shr 16 ;
if y > 0 then
Msg.wParam := VK_UP
else
Msg.wParam := VK_DOWN;

Handled := False;
end;
end;

{procedure Tfmmain.CreateMask(gfx: TGraphic);
begin
  //FMonoMask := TBitmap.Create;
  with FMonoMask do
  begin
    if gfx is TBitmap then
    begin
      Assign(gfx);
      Transparent := True;
      Mask(transparentColor);
      Monochrome := true;
    end
    else
    if gfx is TIcon then
    begin
      	Height := gfx.Height;
        Width := gfx.Width;
        Canvas.Brush.Color := clWhite;
        Canvas.FillRect(Bounds(0,0,width, height));
        DrawIconEx(FMonoMask.Canvas.Handle, 0,0, TIcon(gfx).Handle, Width, Height, 0,0, DI_Mask);
       Monochrome := true;
     end
    else
    begin
      Height := gfx.Height;
      Width := gfx.Width;
      Canvas.Brush.Color := clWhite;
      Canvas.FillRect(Bounds(0,0,width, height));
      Canvas.Draw(0,0, gfx);
      Monochrome := true;
    end;
  end;
end;  }



procedure TfmMain.LoadThemes;
Var
  NewMenuItem:TAction;
  ItemPos:Integer;
  F:TSearchRec;
  AList : TStringlist ;
  i : Integer ;
begin
  AList := TStringlist.create ;
  try

  ItemPos := 1;
  if FindFirst(IncludeTrailingPathDelimiter( ApplicationPath)+'Bin\Themes\*.*',FaDirectory ,F)=0 then
  begin
     while FindNext(F)=0 do begin
       if (uppercase(f.Name)<>'CLASSIC') AND (f.NAme<>'..') AND (f.NAme<>'.') and (DirectoryExists(IncludeTrailingPathDelimiter( ApplicationPath)+'Bin\Themes\'+ f.NAme)) then
       begin
         AList.add(f.Name);
       end;
     end;
     // done : pieter Findclose to perserve resource
     FindClose(f);
  end;
  AList.CustomSort(StringListCompareStrings) ;

   for i := 0 to AList.Count -1 do
     begin
      if self.FindComponent('ThemeItem'+IntToStr(ItemPos)) = nil then
          begin
           NewMenuItem:=TAction.Create(Self);
           NewMenuItem.Name:='ThemeItem'+IntToStr(ItemPos);
           NewMenuItem.Caption:=AList[i];
           NewMenuItem.OnExecute:=ThemeItem0Click;
           NewMenuItem.ActionList := ActionManager1 ;
           ThemeClientITem.Items.Add.Action := NewMenuItem ;
           Inc(ItemPos);
          end;
     end;
//  DirsList.Free;
  if ItemPos>1 then // Add Random Theme
  begin
      NewMenuItem:=TAction.Create(Self);
      NewMenuItem.Name:='RandTheme'+IntToStr(ItemPos);
      NewMenuItem.Caption:='Random';
      NewMenuItem.OnExecute:=ThemeItem0Click;
      NewMenuItem.ActionList := ActionManager1 ;
      ThemeClientITem.Items.Add.Action := NewMenuItem ;
  end;
  finally
     AList.free ;
  end;
end;

{Function TfmMain.TcashHelp(Command: Word; Data: Integer; var CallHelp: Boolean): Boolean;
begin
  Result :=True;
  CallHelp:=False;
  HelpHelpClick(Self);
End;  }

procedure TfmMain.osFRepmanEmail(AFileName : String ) ;
type
  TOSFEmailPlugin = function (AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection ;AFilename :PChar) : TModalresult ; stdcall ;
var
 aOSFEmailPlugin : TOSFEmailPlugin  ;
 Ins : HINST ;
 Params  : String ;
 fulllink,Attlink : String ;
 Nextid : Integer ;
 aUserAccount,aServerAddr,aEmailAddr,aPwsd:String ;

begin
 if  not DMTCCoreLink.IsRegistered('{8996040C-4A24-42F0-802C-45A20A344ACB}') then
  begin
   GetSMTPSettings(aUserAccount,aServerAddr,aEmailAddr,aPwsd);

    TcSendMapiMail(ReadSysParam('edtMailSubject','Your document',CurrentUser ).AsString ,'',AFileName,aEmailAddr,aEmailAddr,'','');
  end else
 if not DMTCCoreLink.IsRegistered('{18F14A2E-998C-41C0-AB0B-975CAE590EE3}')  then
  begin
         fulllink := TDMTCCoreLink.GetLocalBaseDir+'tmp\Report' ;
         Nextid := NextEmailFileNo ;
         fulllink :=  fulllink +  IntToStr(Nextid) + ExtractFileExt(AFileName) ;
         Attlink := AFilename ;
         copyfile(pchar(Attlink),pchar(fulllink),false) ;
         EmailList.clear ;
         EmailList.Add('0,0,0,0,' + IntToStr(Nextid)) ;
         fmSendEmailReport := TfmSendEmailReport.Create(Application);
         try
           SetUpForm(fmSendEmailReport);
           fmSendEmailReport.UseFaxMail:=False;
           fmSendEmailReport.CallEmail;
         finally
           FreeAndNil(fmSendEmailReport);
         end;
  end else
  begin
  Params := ExtractFilePath(Application.ExeName) + 'plug_ins\emailDll.tpd' ;
  Ins := LoadLibrary(pchar(Params)) ;
  IF Ins <> 0 then
    begin
       @aOSFEmailPlugin := GetProcAddress(Ins, 'OSFEmailFilePlugin');
       if Assigned(aOSFEmailPlugin) then
         begin
            aOSFEmailPlugin(Application.Handle,Application,DMTCCoreLink.TheZConnection,pchar(AFileName));
         end;
       FreeLibrary(Ins);
    end;
   end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
 AString,DllName : String ;
 Areg : TRegistry ;
 i ,x :  Integer ;
 Ins : Cardinal ;
 aPage  : TTabSheet ;
begin
ThemeClientITem := nil ;
PluginClientItem:= nil ;

        for i:=0 to rgSetupGroup.Items.Count -1 do
           begin
             if  rgSetupGroup.Items[i].Tag =444  then
                begin
                    for x := 0 to  rgSetupGroup.Items[i].items.Count -1 do
                      begin
                         if rgSetupGroup.Items[i].items[x].Tag = 4 then
                           ThemeClientITem :=  rgSetupGroup.Items[i].items[x] ;

                      end;
                end;
           end;
        for i:=0 to rbtools.Items.Count -1 do
           begin
             if  rbtools.Items[i].Tag =444  then
                begin
                   PluginClientItem := rbtools.Items[i] ;
                end;
           end;







Application.HintHidePause := 5000 ;
 rpgraphutilsvcl.GLRPMEmailFromClickProc := osFRepmanEmail   ;

 AllowedPluginList := TSTringlist.create ;
 FcheckPlugins := TfmCheckPlugins.Create(self) ;
 try
   FcheckPlugins.check ;
   if FileExists(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt') then
   AllowedPluginList.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt');
 finally
   FreeAndNil(FcheckPlugins);
 end;
    for i := 0 to AllowedPluginList.Count-1 do
         begin
         DllName := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'plug_ins\'+AllowedPluginList.Names[i];
         if  AllowedPluginList.ValueFromIndex[i] <> 'True' then
         if LoadedPluginList.IndexOf(DllName) <> -1 then
          begin
           Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]) ;
           LoadedPluginList.Delete(LoadedPluginList.IndexOf(DllName)) ;
           FreeLibrary(Ins);
          end ;
         end;


if PCMain.FindComponent('TSLISTAccountview') = nil then
    begin
     try
      if PCMain.FindComponent('TSLISTAccountview') = nil then
        begin
           aPage  := TTabSheet.Create(PCMain) ;
           aPage.TabVisible := false ;
           aPage.name  := 'TSLISTAccountview' ;
           aPage.PageControl := PCMain ;
        end ;
      if PCMain.FindComponent('TSLISTAccountview2') = nil then
        begin
           aPage  := TTabSheet.Create(PCMain) ;
           aPage.TabVisible := false ;
           aPage.name  := 'TSLISTAccountview2' ;
           aPage.PageControl := PCMain ;
        end ;
      finally

      end;
    end;
 for i := 0 to PCMain.PageCount -1 do
    PCMain.Pages[i].TabVisible := false ;
 AString := '' ;
 APluginsFormsList := TStringlist.Create ;
 Areg := TRegistry.Create(KEY_READ) ;
 try
 Areg.RootKey := HKEY_CLASSES_ROOT ;
   if Areg.OpenKey('\CLSID\{9E8D2FA1-591C-11D0-BF52-0020AF32BD64}\InprocServer32',false ) then
     AString := Areg.ReadString('') ;
 finally
   Areg.free ;
 end;
 //if (AString = '') then showmessage('Midas key found but not set!');
 if (AString = '') or (not FileExists(AString)) then
   begin
       AString := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'midas.dll' ;
       Areg := TRegistry.Create(KEY_WRITE) ;
       try
       Areg.RootKey := HKEY_CLASSES_ROOT ;
         if Areg.OpenKey('\CLSID\{9E8D2FA1-591C-11D0-BF52-0020AF32BD64}\InprocServer32',false ) then
            Areg.WriteString('',AString) ;
       finally
         Areg.free ;
       end;
   end;
Areg := TRegistry.Create(KEY_READ) ;
 try
 Areg.RootKey := HKEY_CLASSES_ROOT ;
   if Areg.OpenKey('\CLSID\{9E8D2FA1-591C-11D0-BF52-0020AF32BD64}\InprocServer32',false ) then
     AString := Areg.ReadString('') ;
 finally
   Areg.free ;
 end;
  if (AString = '') then showmessage('Midas not set!');
   if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
     Appname := ReadT3IniFile('Appconfig','Appname','Turbocash') else
     Appname := ReadT3IniFile('Appconfig','Appname','osFinancials');
  if FileExists(ExtractFilePath(Application.ExeName) + 'gds32.dll') then
    AppName := AppName + GetTextLang(3103); // imbedded ;
  Randomize ;
  NextJpg1 := RandomRange(0,5);
  Application.Title := AppName;
  LastTheme := -1 ;
  MergeIniFile ;
  fPluginIteractClass := TPluginIteractClass.Create(self) ;
  FPluginIteractClass.Name := 'PluginIteractClass' ;
  MainProgressBar.Parent:=MainStatusBar;
  Application.OnMessage :=  OnMessage ;
  if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','smallicons','')) = 'TRUE' then
     begin
       EnabledButtonImageList.Height := 32 ;
       EnabledButtonImageList.Width := 32 ;
       DisabledButtonImageList.Height := 32 ;
       DisabledButtonImageList.Width := 32 ;
       BatchDisabledButtons.Height :=32 ;
       BatchDisabledButtons.Width := 32 ;
       BatchEnabledButtons.Height := 32 ;
       BatchEnabledButtons.Width := 32 ;
      if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','noicons','')) = 'TRUE' then
         begin
           EnabledButtonImageList.Height := 8 ;
           EnabledButtonImageList.Width := 8 ;
           DisabledButtonImageList.Height := 8 ;
           DisabledButtonImageList.Width := 8 ;
           BatchDisabledButtons.Height :=8 ;
           BatchDisabledButtons.Width := 8 ;
           BatchEnabledButtons.Height := 8 ;
           BatchEnabledButtons.Width := 8 ;
         end;
       EnabledButtonImageList.BlendColor := clBtnFace ;
       EnabledButtonImageList.ColorDepth := cdDeviceDependent ;
       EnabledButtonImageList.BkColor := clBtnFace ;
       DisabledButtonImageList.BlendColor := clBtnFace ;
       DisabledButtonImageList.ColorDepth := cdDeviceDependent ;
       DisabledButtonImageList.BkColor := clBtnFace ;
       BatchDisabledButtons.BlendColor := clBtnFace ;
       BatchDisabledButtons.ColorDepth := cdDeviceDependent ;
       BatchDisabledButtons.BkColor := clBtnFace ;
       BatchEnabledButtons.BlendColor := clBtnFace ;
       BatchEnabledButtons.ColorDepth := cdDeviceDependent ;
       BatchEnabledButtons.BkColor := clBtnFace ;
     end  ;
TDatabaseRegistyRoutines.ReadFormPos(self,'',wsMaximized);
end;

Procedure TfmMain.ThemeChecked(ThemeID:Integer);
Var
  i:Integer;

Begin

  ThemePath:=IncludeTrailingpathDelimiter((ExtractFilePath(application.ExeName)+'Bin\Themes'));
  ThemeName:= 'classic';
  if ThemeClientITem.Items.Count<=1 then Exit;


  for i:=0 to ThemeClientITem.Items.Count-1 do
   TAction(ThemeClientITem.Items[i].Action).Checked :=False;
  TAction(ThemeClientITem.Items[ThemeID].Action).Checked :=True;

  ThemeName:= ThemeClientITem.Items[ThemeID].Caption;
  Delete(ThemeName,Pos('&',ThemeName),1);
  ThemeName:= InCludeTrailingPathDelimiter(ThemeName);
  ThemePath:=IncludeTrailingpathDelimiter(ThemePath+ThemeName);

End;


Procedure Icon2Bmp(Size:Integer;IconName:String;bmp:TBitMap);
Var
  AIcon : TIcon;
  ARect:TRect;
begin
  AIcon := TIcon.Create ;
  ARect := rect(0, 0,Size,Size);
  try
   AIcon.Width  := Size ;
   AIcon.Height := Size ;
   AIcon.LoadFromFile(IconName);
   begin
       bmp.PixelFormat := pf32bit;
       bmp.Canvas.Draw(0,0,AIcon);
    end;
  finally
     AIcon.Free ;
  end;
end;
Procedure LoadT3Glyphcx(aListImage:TcxImageList;Index :Integer ;aFileName:String;ResizeTo : Integer = 32;UseDefault : Boolean = false);
Var
  ABmp,BBmp : TBitmap ;
  aImage:TIcon ;
  TempFilename : String ;
  procedure CheckAdd(MyBmp : TBitmap) ;
  begin
   if MyBmp <> nil then
    while aListImage.Count <= Index do
         aListImage.Add(MyBmp,MyBmp) ;
  end;
    procedure CheckAddico(MyBmp : TIcon) ;
  begin
   if MyBmp <> nil then
    while aListImage.Count <= Index do
         aListImage.AddIcon(MyBmp) ;
  end;
Begin
try
   TempFilename := aFileName ;
  aFileName := ThemePath + aFileName;
  if dmDatabase.ZMainconnection.Connected then
    begin
    if FileExists(DMTCCoreLink.GetLocalSaveDir + TempFilename) then
       aFileName := DMTCCoreLink.GetLocalSaveDir + TempFilename else
    if FileExists(DMTCCoreLink.GetLocalSaveDir + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := DMTCCoreLink.GetLocalSaveDir + ChangeFileExt(TempFilename,'.bmp') ;
   if not FileExists(aFileName) then
    if FileExists(ThemePath + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := ThemePath + ChangeFileExt(TempFilename,'.bmp') ;
   end else
   begin
   if not FileExists(aFileName) then
    if FileExists(ThemePath + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := ThemePath + ChangeFileExt(TempFilename,'.bmp') ;

   end;
    if not FileExists(aFileName) then
       aFileName := ThemePath + ChangeFileExt(aFileName,'.ico') ;
    if not FileExists(aFileName) then
       aFileName := ExtractFilePath(Application.ExeName)+'Bin\themes\Classic\'+ TempFilename;
    if not FileExists(aFileName) then
       aFileName := ChangeFileExt(aFileName,'.bmp') ;
    if not FileExists(aFileName) then

       aFileName := ChangeFileExt(aFileName,'.bmp') ;

    if UseDefault then
       if not FileExists(aFileName) then
         aFileName := ExtractFilePath(Application.ExeName)+'Bin\themes\Classic\B40.bmp'  ;


    if not FileExists(aFileName) then
       exit ;

    if uppercase(ExtractFileExt(aFileName)) ='.ICO'then
     begin

      aImage := TIcon.Create ;
        try

         aImage.LoadFromFile(aFileName);
         aImage.transparent := True ;
         CheckAddico(aImage) ;

       try
       if Index <> -1 then
           aListImage.ReplaceIcon(Index,aImage)
           else
           aListImage.AddIcon(aImage);
        except
              ABmp := TBitmap.Create ;
       Try
         ABmp.Width := ResizeTo ;
         ABmp.Height := ResizeTo ;

         Icon2Bmp(ResizeTo,aFileName,ABmp);
         CheckAdd(ABmp) ;
          if Index <> -1 then
           aListImage.ReplaceMasked(Index,ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1] )
           else
           aListImage.AddMasked(ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1] ) ;

         CheckAdd(ABmp) ;
        Finally
        ABmp.Free ;

       end;
         end;

       Finally
        aImage.Free ;

       end;
     end else
     begin
       ABmp := TBitmap.Create ;
        try
         ABmp.LoadFromFile(aFileName);
         if ABmp.Width  <> ResizeTo then
          begin
           BBmp := TBitmap.Create ;
              try
              BBmp.Width := ResizeTo ;
              BBmp.Height := ResizeTo ;
              BBmp.PixelFormat :=pf32bit ;
              BBmp.Canvas.StretchDraw(rect(0, 0,ResizeTo,ResizeTo),ABmp);
              CheckAdd(BBmp) ;
              // aListImage.ReplaceMasked(Index,BBmp,ABmp.Canvas.Pixels[0,ABmp.height]) ;
              aListImage.Replace(Index,BBmp,nil) ;

                finally
                   BBmp.Free ;
                end;
          end else
          begin
           CheckAdd(ABmp) ;
           ABmp.TransparentColor := ABmp.Canvas.Pixels[0,ABmp.height-1] ;
           ABmp.Transparent := true ;

            aListImage.ReplaceMasked(Index,ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1]) ;
          end;
        finally
           ABmp.Free ;
        end;
     end ;
  except
  end;

end;
Procedure LoadT3Glyph(aListImage:TImageList;Index :Integer ;aFileName:String;ResizeTo : Integer = 32;UseDefault : Boolean = false);

Begin
 DMTCCoreLink.CurrentTheme := ThemeName ;
 DMTCCoreLink.LoadT3Glyph(aListImage,Index ,aFileName,ResizeTo,UseDefault);
end;


Function TFmmain.Jpg1File:String;
Var
  F:TSearchRec;
  Ic:Integer;
begin
  ic := 0;
  Result := 'backGround1.jpg';
  if DirectoryExists(ThemePath) then
  begin
    if FindFirst(ThemePath+'*.Jpg',faAnyFile ,F)=0 then
    begin
      while FindNext(F)=0 do begin
        if SameText(f.NAme,'backGround2.jpg') then Continue;
        if Ic = NextJpg1 then
        begin
          Result  := f.NAme;
          Break;
        end;
        inc(ic);
      end;
      if ic<>NextJpg1 then NextJpg1:=0;
     sysutils.FindClose(f);
    end;
  end;
  Inc(NextJpg1);
end;

Procedure TfmMain.UpDateThemes(Var ThemeID:Integer;UpDateSysVars:Boolean);
  Var
   i,LastCount  : Integer ;
begin

WriteT3IniFile('Current Language','theme',IntToStr(ThemeID));
WriteT3IniFile('Current Language','themename',StringReplace(ThemeClientITem.Items[ThemeID].Caption,'&','',[rfReplaceAll]));
DMTCCoreLink.UpdateTheme ;


  if ThemeClientITem.Items.Count<=1 then Exit;

  With DmDatabase.tblSysVars do
    If (dmDatabase.ZMainconnection.Connected) then
    begin
      if Not active then active:=true;
      If UpDateSysVars then
      begin
         edit;
         DmDatabase.TblSysVarsWLanguageID.Value:=ThemeID;
         Post;
      end
      else
         ThemeID:=DmDatabase.TblSysVarsWLanguageID.Value;
      if ThemeID>ThemeClientITem.Items.Count-1 then
        ThemeID:=0;
      CheckRandTheme(ThemeID);
      ThemeChecked(ThemeID);

      active:=False; 
    end
    else  
        ThemeChecked(ThemeID);

  If not FileExists(ThemePath+'BackGround1.Jpg') then
  begin
      ThemeChecked(0);
  If ThemeItem0.Checked then
  begin
  if assigned(imgBack) then
     imgBack.Clear ;
     
  end ;
  end
  else
  Begin
    {Check if there is other Jpg }

   // imgBack.Picture.LoadFromFile(ThemePath+'backGround1.jpg');
   {Load Random Jpg 1 }
    imgBack.Picture.LoadFromFile(ThemePath+Jpg1File);
    if  TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '0' then
     begin
       rbFile.Items[0].Visible:=False ;
       Image1.Visible := False ;
       rbFile.Realign ;
     end else
     begin

     If  FileExists(ExtractFilePath(Application.ExeName)+'logosmall.png') then
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'logosmall.png')
     else
     rbFile.Items[0].Visible:=False ;
     end;

  end;




  if LastTheme <> ThemeID then
  begin
    LastTheme :=  ThemeID ;
    // ControlBar.Visible := false ;
    self.Menu := nil ;

    try
     LastCount :=  MenuImages.Count -1 ;
      MenuImages.Height := 16 ;
      MenuImages.Width  := 16 ;


      for i := 0 to LastCount do
        begin
           LoadT3Glyph(MenuImages,i,'SMImage'+IntTOStr(i)+'.Ico',MenuImages.Height,true);
        end;
      LoadT3Glyph(EnabledButtonImageList,0,'Recon.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,1,'Invoice.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,2,'Open.ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,3,'Batch.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,4,'OpenLink.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,5,'Backup.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,6,'BackRest.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,7,'Restore.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,8,'Search.Ico',EnabledButtonImageList.Height);
      LoadT3Glyph(EnabledButtonImageList,9,'Plugin.Ico',EnabledButtonImageList.Height);




    // Update images in DisabledButtonImageList
      LoadT3Glyph(DisabledButtonImageList,0,'BwRecon.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,1,'BwInvoice.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,2,'bwSearch.ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,3,'BwBatch.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,4,'BwOpenLink.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,5,'BwBackup.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,6,'bwSearch.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,7,'bwRestore.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,8,'bwSearch.Ico',DisabledButtonImageList.Height);
      LoadT3Glyph(DisabledButtonImageList,9,'bwPlugin.Ico',DisabledButtonImageList.Height);

      for i := 10 to 26 do
          begin
          LoadT3Glyph(DisabledButtonImageList,i,'bwButton'+IntToStr(i)+'.Ico',DisabledButtonImageList.Height);
          LoadT3Glyph(EnabledButtonImageList,i,'Button' + IntToStr(i) + '.Ico',EnabledButtonImageList.Height);
          end;

      UpDateBatThemes;


       LoadT3Glyph(EnabledButtonImageList,34,'Register.Ico',EnabledButtonImageList.Height);
       LoadT3Glyph(EnabledButtonImageList,59,'Workflow.Ico',EnabledButtonImageList.Height);
       LoadT3Glyph(DisabledButtonImageList,34,'Register.Ico',EnabledButtonImageList.Height);
       LoadT3Glyph(DisabledButtonImageList,59,'Workflow.Ico',EnabledButtonImageList.Height);      
      finally


      end;
  end;
  // warning exit routine above 
  ////FmMain.Repaint;
 {if FileExists(ThemePath+'skin.skn') then
  if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
           if Active then
             begin
              if SkinFile <> (ThemePath+'skin.skn') then
              begin
               LoadFromFile(ThemePath+'skin.skn');
              
              // UpdateMenu(self);

              end;
             end ;
           end;
       end;  }

      LastCount :=  dmOsfResource.ImageList1.Count -1 ;
      dmOsfResource.ImageList1.Height := 24 ;
      dmOsfResource.ImageList1.Width  := 24 ;

      for i := 0 to LastCount do
        begin
           LoadT3Glyph(dmOsfResource.ImageList1,i,'GEN'+IntTOStr(i)+'.Ico',dmOsfResource.ImageList1.Height,true);
        end;
    UpdateColorsForThema ;
{    ActionManager1.LargeImages := nil;
    ActionManager1.LargeDisabledImages := nil;
    ActionManager1.Images := nil;
    ActionManager1.DisabledImages := nil;
    ActionManager1.LargeImages := dmOsfResource.EnabledButtonImageList ;
    ActionManager1.LargeDisabledImages := dmOsfResource.DisabledButtonImageList ;
    ActionManager1.Images := dmOsfResource.MenuImages ;
 }

{    for i := 0 to RibbonPage1.Groups[0].Items.Count -1 do
        begin
          LastCount :=   RibbonPage1.Groups[0].Items[i].ImageIndex ;
          RibbonPage1.Groups[0].Items[i].ImageIndex := -1 ;
          RibbonPage1.Groups[0].Items[i].ImageIndex := LastCount ;
        end;
 }
end;

Procedure TfmMain.UpDateBatThemes;
 var i : Integer ;
begin
  with fmMain do
  begin

      for i := 38 to 59 do
       begin
          LoadT3Glyph(ilbandsmall,i,'B'+IntToStr(i)+'.Ico',ilbandsmall.Height,true);
          LoadT3Glyph(ilbandlarge,i,'B'+IntToStr(i)+'.Ico',ilbandlarge.Height,true);
       end;


      LoadT3Glyph(ilbandsmall,0,'Open.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,0,'Open.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,1,'BackRest.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,1,'BackRest.Ico',ilbandlarge.Height);

      LoadT3Glyph(ilbandsmall,2,'Register.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,2,'Register.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,3,'Tools.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,3,'Tools.Ico',ilbandlarge.Height);

      LoadT3Glyph(ilbandsmall,4,'Search.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,4,'Search.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,5,'Debtors.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,5,'Debtors.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,6,'Creditors.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,6,'Creditors.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,7,'Stock.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,7,'Stock.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,8,'recon.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,8,'recon.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,9,'openlink.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,9,'openlink.Ico',ilbandlarge.Height);

      LoadT3Glyph(ilbandsmall,10,'Button10.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,10,'Button10.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,11,'Button11.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,11,'Button11.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,12,'Button12.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,12,'Button12.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,13,'Button13.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,13,'Button13.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,14,'Button14.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,14,'Button14.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,15,'Button15.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,15,'Button15.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,16,'Button16.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,16,'Button16.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,17,'Button17.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,17,'Button17.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,18,'Button18.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,18,'Button18.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,19,'Workflow.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,19,'Workflow.Ico',ilbandlarge.Height);

      LoadT3Glyph(ilbandsmall,20,'Help.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,20,'Help.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,21,'Edit.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,21,'Edit.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,22,'Calender.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,22,'Calender.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,23,'Add.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,23,'Add.Ico',ilbandlarge.Height);


      LoadT3Glyph(ilbandsmall,24,'file.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,24,'file.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,25,'accountview.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,25,'accountview.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,26,'ledgerview.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,26,'ledgerview.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,27,'reports.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,27,'reports.Ico',ilbandlarge.Height);
       LoadT3Glyph(ilbandsmall,28,'reports2.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,28,'reports2.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,29,'Setup.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,29,'Setup.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,30,'SwitchLanguage.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,30,'SwitchLanguage.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,31,'Close.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,31,'Close.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,32,'POS.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,32,'POS.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,33,'BATCH.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,33,'BATCH.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,34,'Plugin.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,34,'Plugin.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,35,'Contact.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,35,'Contact.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,36,'Export.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,36,'Export.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,37,'Import.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,37,'Import.Ico',ilbandlarge.Height);
       // 38 til 59 for plugins   B38.ico , B39.ico etc
      LoadT3Glyph(ilbandsmall,60,'Delete.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,60,'Delete.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,61,'Project.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,61,'Project.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,62,'Post.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,62,'Post.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,63,'companydata.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,63,'companydata.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,64,'groups.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,64,'groups.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,65,'calculator.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,65,'calculator.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,66,'editreport.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,66,'editreport.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,67,'addadmin.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,67,'addadmin.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,68,'removeadm.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,68,'removeadm.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,69,'setupdoc.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,69,'setupdoc.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,70,'printer.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,70,'printer.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,71,'accounts.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,71,'accounts.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,72,'possetup.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,72,'possetup.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,73,'endofyear.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,73,'endofyear.Ico',ilbandlarge.Height);
      LoadT3Glyph(ilbandsmall,74,'salesman.Ico',ilbandsmall.Height);
      LoadT3Glyph(ilbandlarge,74,'salesman.Ico',ilbandlarge.Height);
  // Update images in BatchEnabledButtons
    LoadT3Glyph(BatchEnabledButtons,0,'Delete.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,1,'Insert.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,2,'Post.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,3,'List.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,4,'Excl.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,5,'OpenLink.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,6,'Process.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,7,'BatchSetUp.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,8,'Incl.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,9,'Comment.Ico',BatchEnabledButtons.Height); 
    LoadT3Glyph(BatchEnabledButtons,10,'EraseDoc.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,11,'CopyDoc.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,12,'Search.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,13,'GlobalUnrecon.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,14,'Consolidate.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,15,'ShowBank.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,16,'GlobalRecon.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,17,'Discount.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,18,'Balance.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,19,'Creditors.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,20,'Debtors.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,21,'ClearLinks.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,22,'Unlink.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,23,'Generate.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,24,'Properties.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,25,'File.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,26,'Purge.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,27,'Restore.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,28,'Backup.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,29,'DeleteStock.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,30,'Stock.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,31,'Edit.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,32,'Money.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,33,'Invoice.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,34,'Close.Ico',BatchEnabledButtons.Height);

    LoadT3Glyph(BatchEnabledButtons,35,'Bugreport.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,36,'Help.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,37,'Forum.Ico',BatchEnabledButtons.Height);


    for i := 38 to 59 do
       begin
          LoadT3Glyph(BatchEnabledButtons,i,'B'+IntToStr(i)+'.Ico',BatchEnabledButtons.Height,true);
          LoadT3Glyph(BatchDisabledButtons,i,'Bw'+IntToStr(i)+'.Ico',BatchDisabledButtons.Height,true);
       end;



    for i := 38 to 59 do
       begin
          LoadT3Glyph(EnabledButtonImageList,i,'B'+IntToStr(i)+'.Ico',EnabledButtonImageList.Height,true);
          LoadT3Glyph(EnabledButtonImageList,i,'B'+IntToStr(i)+'.Ico',EnabledButtonImageList.Height,true);
        end;

    LoadT3Glyph(BatchEnabledButtons,60,'Button10.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,61,'Button11.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,62,'Button12.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,63,'Button13.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,64,'Button14.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,65,'Button15.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,66,'Button16.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,67,'Button17.Ico',BatchEnabledButtons.Height);

    LoadT3Glyph(BatchEnabledButtons,68,'openhistory.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,69,'importbank.ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,70,'Unlink2.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,71,'linkoff.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,72,'removelinks.Ico',BatchEnabledButtons.Height);

    LoadT3Glyph(BatchEnabledButtons,73,'deleteall.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,74,'linkedofftrn.Ico',BatchEnabledButtons.Height);
    LoadT3Glyph(BatchEnabledButtons,75,'linkedtrn.Ico',BatchEnabledButtons.Height);



       // Update images in BatchDisabledButtons
    LoadT3Glyph(BatchDisabledButtons,0,'BwDelete.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,1,'BwInsert.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,2,'BwPost.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,3,'BwList.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,4,'BwExcl.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,5,'BwOpenLink.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,6,'BwProcess.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,7,'BwBatchSetUp.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,8,'BwIncl.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,9,'BwComment.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,10,'BwEraseDoc.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,11,'bwCopyDoc.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,12,'bwLookup.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,13,'BwGlobalUnRecon.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,14,'BwConsolidate.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,15,'BwShowAmount.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,16,'BwGlobalRecon.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,17,'BwDiscount.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,18,'BwBalance.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,19,'BwCreditors.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,20,'BwDebtors.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,21,'BwClearLinks.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,22,'BwUnlink.Ico',BatchDisabledButtons.Height);
    LoadT3Glyph(BatchDisabledButtons,23,'BwGenerate.Ico',BatchDisabledButtons.Height);
 end;
end;





procedure TfmMain.HelpAboutClick(Sender: TObject);
var
  fmAbout: TfmAbout;
begin

  fmAbout := TfmAbout.Create(self);
  try
  SetUpForm(fmAbout);
  fmAbout.ShowModal;
  finally
  FreeAndNil(fmAbout);
  end;
end;

procedure TfmMain.FileOpen2Click(Sender: TObject);
   var
    OpenResult : Integer ;

begin

  AutoLoginPosPassword := '' ;
  mainRibbon.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3105)+' - ' + TheGlobalDataObject.Registration.SerialNumber +
      ' '+DMTCCoreLink.GetTextLangNoAmp(3102)+' ' + TheGlobalDataObject.Registration.CompanyName  ;

  if OSFPLUGINFindAlternateDll('FileOpenClick') then exit ;
  fmOpenASetOfBooks := TfmOpenASetOfBooks.Create(self);
  try
  SetUpForm(fmOpenASetOfBooks);

  if ( Sender =nil ) and (TDatabaseRegistyRoutines.ReadRegValue('AUTOLOGIN','LASTOPEN') = 'TRUE' )  then
//  if not FileExists(ExtractFilePath(Application.ExeName)+'plug_ins\Openbooks.tpd') then
    begin
     fmOpenASetOfBooks.Show ;
     Application.ProcessMessages ;
      if not FileExists(ExtractFilePath(Application.ExeName)+'plug_ins\Openbooks.tpd') then
     fmOpenASetOfBooks.btnOpenClick(self);


     if CurrentUser > -1 then
        OpenResult := mrOk ;
     if not DMTCCoreLink.TheZConnection.Connected then
        OpenResult := fmOpenASetOfBooks.ShowModal;

    end else
  OpenResult := fmOpenASetOfBooks.ShowModal;
  finally
  FreeAndNil(fmOpenASetOfBooks);
  end;

  if (OpenResult <> mrOk) then
    begin
     CloseSetOfBooks ;

    end else
    begin
     if (TSStart.Tag <> 0 ) then
       TFrmWelcome(TSStart.Tag).GetUrlTimer.Enabled := True ;
    end;

  if (TheGlobalDataObject.Books.ActiveBooks <> nil) then
  begin
     fmMain.MainStatusBar.Panels[3].Text:= TheGlobalDataObject.Books.ActiveBooks.Name;
     fmMain.MainStatusBar.Repaint;
  end;
  LoadExtraLargeIcons ;


if  dmDatabase.ZMainconnection.Connected then
    begin
       if not rbuser.Visible then
          begin
             if   (ReadSysParam('BEditmode',0,CurrentUser).AsInteger <> 4) then
               mainRibbon.ActivePage := rgActions
               else
               mainRibbon.ActivePage := rbuser ;
          end  else
           begin
             mainRibbon.ActivePage := rbuser ;
           end;
    end;
  // add plugins
if  dmDatabase.ZMainconnection.Connected  and (ReadSysParam('BEditmode',0,CurrentUser).AsInteger = 3) then
    begin
     dmWorkflowData.InitForDatabase ;

    if Application.FindComponent('fmWorkFlowHandel') = nil then
     fmWorkFlowHandel := TfmWorkFlowHandel.Create(Application);
       with fmWorkFlowHandel do
          begin
             Aedit.Visible := False ;
             Parent := self ;
             BorderStyle :=  bsNone ;
             Align := alClient ;
             tStartJob.Enabled := True ;
             Show ;
             tbClose.OnClick := self.FileExitClick ;
          end;
    end else
    if  dmDatabase.ZMainconnection.Connected  and (ReadSysParam('BEditmode',0,CurrentUser).AsInteger = 4) then
    begin
      rgActions.Tag := 99 ;
      rgReport.Tag := 99 ;
      rgSetup.Tag := 99 ;
      rglisten.Visible := False ;
    end else
    begin
      rgActions.Tag := 0 ;
      rgReport.Tag := 0 ;
      rgSetup.Tag := 0 ;
      rglisten.Visible := True ;
if dmDatabase.ZMainconnection.Connected  then
if  ReadReportOp('CBShowCalendar',false).AsBoolean then
   begin
     InputCalendarClick(self);
   end;
  end;

  handelDisableItems ;
  HandelSpecialUserMenu(fmmain,'DISABLEITEMS') ;
  if OpenResult = mrYesToAll then
     FileCreateClick(self);

if dmDatabase.ZMainconnection.Connected  then
  begin
   if ToolsGlobalProcessesDoYearEnd.Enabled then
        
    if TDataBaseRoutines.GetPeriodEndDate(26) < date then
      begin
        if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(603)+' ' + DMTCCoreLink.GetTextLangNoAmp(579) + ' ' +
        DateToStr(TDataBaseRoutines.GetPeriodEndDate(26)) + #13+#10 + DMTCCoreLink.GetTextLangNoAmp(2344) +
        ' ' + DateToStr(date) + #13+#10 + DMTCCoreLink.GetTextLangNoAmp( 589)+ #13+#10 + DMTCCoreLink.GetTextLangNoAmp(115) + '?',mtConfirmation,mbYesNo,0) =mryes then
          ToolsGlobalProcessesDoYearEnd.Execute ;

        
      end;
  end;
end;

procedure TfmMain.FileCreateClick(Sender: TObject);
var
 OpenResult,ic : Integer ;
begin
  DMTCCoreLink.AccObject.Clear ;
  DMTCCoreLink.GroupsObject.Clear ;
  DMTCCoreLink.stockObject.clear ;
  if OSFPLUGINFindAlternateDll('FileCreateClick') then exit ;
  ic := 0 ;
  fmCreationCompWiz := TfmCreationCompWiz.Create(self);
  try
  SetUpForm(fmCreationCompWiz);
  if fmCreationCompWiz.ShowModal = mryesToAll then
    begin
     TheGlobalDataObject.Books.SetActive(TheGlobalDataObject.Books.count-1);
      if (TheGlobalDataObject.Books.ActiveBooks <> nil) then
        begin

              Repeat
                OpenResult:= OpenBooks(False);
                Inc(ic);
              Until (ic>3) OR (OpenResult=0) or (OpenResult=2103) or (OpenResult=2104);
        end;

    end;
  finally
  FreeAndNil(fmCreationCompWiz);
  end;

end;

procedure TfmMain.FileDeleteClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('FileDeleteClick') then exit ;
  fmDeleteASetOfBooks := TfmDeleteASetOfBooks.Create(self);
  try
  SetUpForm(fmDeleteASetOfBooks);
  fmDeleteASetOfBooks.ShowModal;
  finally
  FreeAndNil(fmDeleteASetOfBooks);
  end;
end;

procedure TfmMain.FileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.SetupPrinterClick(Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('SetupPrinterClick') then exit ;
   frSetPrinter:= TfrSetPrinter.create(nil);
   try
   if sender  = SetupPrinter then
    frSetPrinter.isedit := true ;
    frSetPrinter.showmodal ;
   finally
     FreeAndNil(frSetPrinter);
   end;
end;

procedure TfmMain.SetupColoursClassicClick(Sender: TObject);
begin
  SetColour(40);
end;

procedure TfmMain.SetupColoursBrilliantClick(Sender: TObject);
begin
  SetColour(41);
end;

procedure TfmMain.SetupColoursPastelClick(Sender: TObject);
begin
  SetColour(42);
end;

procedure TfmMain.SetupColoursNewSAClick(Sender: TObject);
begin
  SetColour(43);
end;

procedure TfmMain.SetupColoursKeywestClick(Sender: TObject);
begin
  SetColour(44);
end;

procedure TfmMain.SetupColoursWindowsDefaultClick(Sender: TObject);
begin
  SetColour(45);
end;

procedure TfmMain.ToolsBackupClick(Sender: TObject);
var
 LastOpen : String ;
begin

  if OSFPLUGINFindAlternateDll('ToolsBackupClick') then exit ;

  LastOpen := dmDatabase.ZMainconnection.Database ;

  CloseSetOfBooks;

  fmZipBackupRestore := TfmZipBackupRestore.Create(self);
  try

  fmZipBackupRestore.LastOpenSet := dmDatabase.ZMainconnection.Database ;
  SetUpForm(fmZipBackupRestore);

  fmZipBackupRestore.ShowModal;
  finally
  FreeAndNil(fmZipBackupRestore);
  end;
  // lets reopen people are confused
  if LastOpen <> '' then
    begin
    if TheGlobalDataObject.Books.FindBooksByPath(LastOpen) <> nil then
       begin
       TheGlobalDataObject.Books.SetActive(TheGlobalDataObject.Books.FindBooksByPath(LastOpen).Index);
       OpenBooks(false);
      end;
   end;
end;

procedure TfmMain.ToolsCalculatorClick(Sender: TObject);
{**********
           This launches the windows calculator
**********}
var
//  Exec, Windir : array[0..255] of char;
  Temp:Double;
begin
  
  if OSFPLUGINFindAlternateDll('ToolsCalculatorClick') then exit ;  
  Temp:=0;
  CallCalc(Temp);
end;

procedure TfmMain.ToolsSupportClick(Sender: TObject);
begin

  fmSupport := TfmSupport.Create(Application);
  try
  SetUpForm(fmSupport);
  fmSupport.ShowModal;
  finally
  FreeAndNil(fmSupport);
  end;
end;

procedure TfmMain.SetupAccessControlClick(Sender: TObject);
begin

  fmAccessControl := TfmAccessControl.Create(Application);
  try
  SetUpForm(fmAccessControl);
  fmAccessControl.ShowModal;
  InitUserItems ;
  finally
  FreeAndNil(fmAccessControl);
  end;
end;

procedure TfmMain.SetupBatchTypesClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupBatchTypesClick') then exit ;  
  fmBatchTypes := TfmBatchTypes.Create(Application);
  try
  SetUpForm(fmBatchTypes);
  fmBatchTypes.ShowModal;
  finally
  FreeAndNil(fmBatchTypes);
  end;
end;

procedure TfmMain.SetupCompanyInfoClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupCompanyInfoClick') then exit ;  
  fmCompanyInfo := TfmCompanyInfo.Create(Application);
  try
  SetUpForm(fmCompanyInfo);
  fmCompanyInfo.ShowModal;
  finally
  FreeAndNil(fmCompanyInfo);
  end;
end;

procedure TfmMain.SetupGroupsClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupGroupsClick') then exit ;  
  fmGroups := TfmGroups.Create(self);
  try
  SetUpForm(fmGroups);
  if fmGroups.GroupControl.TabCount <> 0 then
  fmGroups.ShowModal;
  finally
  FreeAndNil(fmGroups);
  end;
end;

procedure TfmMain.SetupReportingDatesClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupReportingDatesClick') then exit ;  
  fmPeriods := TfmPeriods.Create(self);
  try
  SetUpForm(fmPeriods);
  fmPeriods.ShowModal;
  finally
  FreeAndNil(fmPeriods);
  end;
end;

procedure TfmMain.SetupSalesmanClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupSalesmanClick') then exit ;  
  fmSalesman := TfmSalesman.Create(self);
  try
  SetUpForm(fmSalesman);
  fmSalesman.ShowModal;
  finally
  FreeAndNil(fmSalesman);
  end;
end;

procedure TfmMain.SetupDocumentsClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupDocumentsClick') then exit ;
  fmDocumentSetup := TfmDocumentSetup.Create(self);
  try
  SetUpForm(fmDocumentSetup);
  fmDocumentSetup.ShowModal;
  finally
  FreeAndNil(fmDocumentSetup);
  end;
end;

procedure TfmMain.SetupStockInfoClick(Sender: TObject);
begin
 
  if OSFPLUGINFindAlternateDll('SetupStockInfoClick') then exit ;
  fmStockInfo := TfmStockInfo.Create(self);
  try
  fmStockInfo.ShowModal;
  finally
  FreeAndNil(fmStockInfo);
  end;
  initSetOfBooksPropertys ;
end;

procedure TfmMain.SetupPaymentTypesClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('SetupPaymentTypesClick') then exit ;
  fmPaymentType := TfmPaymentType.Create(self);
  try
  SetUpForm(fmPaymentType);
  fmPaymentType.ShowModal;
  finally
  FreeAndNil(fmPaymentType);
  end;

end;

procedure TfmMain.InputBatchEntryClick(Sender: TObject);
Var
  i:Integer;
  LastDoctype : Integer  ;
begin
  LastDoctype :=idDocType ;
  if OSFPLUGINFindAlternateDll('InputBatchEntryClick') then exit ;
  i := GetRandThemeID;
  if ThemeClientITem.Items.Count>1 then
    if TAction(ThemeClientITem.Items[GetRandThemeID].Action).Checked then
      UpDateThemes(i,false);
  dmDatabase.CalledFromBatch:=True;
  IsRepeatingBat:=False;
  fmSelectBatchType := TfmSelectBatchType.Create(Application);
  try
  SetUpForm(fmSelectBatchType);
  fmSelectBatchType.Trailbalance1.Enabled := Ledgerviewer1.Enabled ;
 
  Application.OnException:=fmMain.MyHandlExceptions ;
  fmSelectBatchType.ShowModal;
  finally
  FreeAndNil(fmSelectBatchType);
  idDocType := LastDoctype;
  // done : Pieter Lets be save and close all datasets no need for begin screen to have one open right ?
  // if so lets do it wilt all the functions so the database is always closed for anny new function to open.
  // Then were also sure the current data is read.
  // I found some get called from other formas (we shoudl just create then with a local reference there.
  // And use TSaveCall objects so the datasets are left in good state after edit.
  end;

end;

procedure TfmMain.ReportsGeneralLedgerTrialBalanceClick(Sender: TObject);
begin
  CheckUnpostedItems ;
  PCMain.ActivePageIndex  := 6 ;
  PCMainChange(self) ;
  TAccountTreeView(PCMain.ActivePage.Tag).CBType.ItemIndex := 0 ;
  TAccountTreeView(PCMain.ActivePage.Tag).CBTypeChange(self) ;
  TAccountTreeView(PCMain.ActivePage.Tag).BCreateClick(self) ;
  exit ;
end;

procedure TfmMain.SetMYBidiMode(AComponent : TComponent;Mode : Integer)  ;
var
 i : Integer ;
begin
  if IsPublishedProp(AComponent,'BiDiMode') then
    SetOrdProp(AComponent,'BiDiMode',Mode);
   for i := 0 to AComponent.ComponentCount -1 do
     begin
         SetMYBidiMode(AComponent.Components[i],Mode);
     end;
end;
procedure TfmMain.FormShow(Sender: TObject);
Var
  RunStr : String ;
begin

  if TheGlobalDataObject.FirstTime then
  begin
     TheGlobalDataObject.Languages.SetDefault ;
     FileSwitch3Click(self);
  end ;
  if not hasRunedOnce then
  begin
  hasRunedOnce  :=true  ;
  dmDatabase.UniSQLMonitor1.Active := TDatabaseRegistyRoutines.ReadAppRegValue('ini\'+ 'INFO','DEBUGSQL') = '1' ;

  TrayIcon1.Visible := True ;



  // lets load plugins so the menu item gets translated
  {Sylvain: This line Cause a Crash in XP while Freeing DLL}
 // PTabs.DoubleBuffered := true ;
  PCMain.ActivePageIndex := 0 ;
  CloseSetOfBooks ;
  ReadAppConfig;

  SetColour(40);{Load Default Color}
  try
  LoadPluginsDLL ;
  LoadPluginsEXE ;
  except
  end;



  // done lets set up translation before a call to gettexlang is made,
  SetUPTranslation ;
  AppName := AppName + GetApplicationVersion  ;
  Application.Title := AppName    ;
  mainRibbon.Caption := Application.Title +' - ' + GetTextLang(3101);
 // fmMain.Left := 0;
 // fmMain.Top := 0;
   LoadThemes;
  DefaultThemeID :=  GetKDEThemeIndex ;

  RunStr := ReadT3IniFile('Current Language','theme','');
  if RunStr <> '' then
    DefaultThemeID := StrToInt(RunStr);
  UpDateThemes(DefaultThemeID,False);



  if IsRegistered then
  begin
   if assigned(TUnregistered) then
   begin
    rbfile.Items.Delete(2);
    FreeAndNil(TUnregistered)  ;
   end;
    // TUnregistered.Tag := 1 ;
     AppName := AppName  +' - '+DMTCCoreLink.GetTextLangNoAmp(3105)+' - ' + TheGlobalDataObject.Registration.SerialNumber + ' '+DMTCCoreLink.GetTextLangNoAmp(3102)+' ' + TheGlobalDataObject.Registration.CompanyName ;
     mainRibbon.Caption := AppName;
     if ReadT3IniFile('INFO','SERIAL','') <>  TheGlobalDataObject.Registration.SerialNumber then
       WriteT3IniFile('INFO','SERIAL',TheGlobalDataObject.Registration.SerialNumber);
  end else
  if assigned(TUnregistered) then
  TUnregistered.Caption := GetTextLang(3262); ////register
  end  ;
end;

procedure TfmMain.ToolsImport1Click(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('ToolsImport1Click') then exit ;
  ShowDataImport;
end;

procedure TfmMain.InputReconcileBankClick(Sender: TObject);
var
LastDocType : Integer ;
begin
  LastDocType := idDocType  ;
  try
  
  if OSFPLUGINFindAlternateDll('InputReconcileBankClick') then exit ;
  // Re-used as 1= Input Recon and 2=Report Recon
 if DMTCCoreLink.ReadSysParam('RCONISON',false,0) then
  if Not UserControlAccess('RECON') then
  begin
    OSFMessageDlg(GetTextLang(829){'Access Denied'},mterror,[mbOK],0);
    Exit;
  end;
  idDocType:=1;
  fmReconOptions := TfmReconOptions.Create(self);
  try
  SetUpForm(fmReconOptions);
  fmReconOptions.ShowModal;
  finally
  FreeAndNil(fmReconOptions);
  end;
  finally
    idDocType := LastDocType;
  end;
end;

procedure TfmMain.ToolsGlobalProcessesClearResetClick(Sender: TObject);
 var
  UsersInDatabase : Integer ;
  UserMessage : String ;
begin
UserMessage := TDatabaseTableRoutines.GetUsersInDatabase(UsersInDatabase);
if UsersInDatabase <> 0 then
  raise Exception.Create(UserMessage) ;

// if OSFPLUGINFindAlternateDll('ToolsGlobalProcessesClearResetClick') then exit ;
 if OSFMessageDlg(GetTextLang(519){'This will seriously effect your set of books , are you sure you want to clear this set of books ?'}, mtconfirmation , [mbyes, mbno,mbHelp], 237) = mryes Then
   if OSFMessageDlg(GetTextLang(780){'All transactions will be removed and account balances will be set to zero'}+
      #13#10+GetTextLang(781){'Do you want to cancel then clearing process ?'}, mtconfirmation, [mbyes, mbno], 237) = mrNo then
   //  if OSFMessageDlg(gettextlang(2094), mtconfirmation, [mbyes, mbno], 237) = mrNo then
      begin
       Closeopensforms1Click(self);
       ClearReset(true) ;
      end
   //  else
  //   begin
   //  Closeopensforms1Click(self);
   //  ClearResetAddBalanceClick(self) ;
   //  end;
end;

procedure TfmMain.FileSwitch3Click(Sender: TObject);

begin

  if OSFPLUGINFindAlternateDll('FileSwitchClick') then exit ;
  // done : Pieter take the translation to the main form. All sub forms wil have translation on there show reports on there create. (must do a create free construction to work) that way the translation can be put in localy.
  if fmLangChoice.ShowModal = mrok then
   SetUPTranslation ;

end;

procedure TfmMain.ReportsDebtorAgeAnalysisClick(Sender: TObject);
begin

end;

//Themes

procedure TfmMain.ThemeItem0Click(Sender: TObject);
Var
  Nbr:Integer;
begin
 LastTheme := -1 ;
  ThemeClicked :=Str2Int(Copy((Sender as TAction).Name,10,2));
  UpDateThemes(ThemeClicked,true);

end;

//**********************Themes

function TfmMain.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
  Result := (HTMLHelpShowHelp <> 0);
  CallHelp := False;
  //if assigned(application) then application.Minimize; {not needed anymore,,, I think..}
end;

procedure TfmMain.HelpHelpClick(Sender: TObject);
begin

  HtmlShowTopic(100);
end;

procedure TfmMain.FormResize(Sender: TObject);
{
  This makes sure the progressbar
  is always in the same place.
}

begin
  if InCloseUp then exit ;
 if PCMain.ActivePage <> nil then
 if PCMain.ActivePage.Tag <> 0 then
    begin
      TForm(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
      TForm(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
      if Assigned(TForm(PCMain.ActivePage.Tag ).OnResize) then
      if TForm(PCMain.ActivePage.Tag ).ClassName <> 'TfmInvoiceEntryGrid' then
      TForm(PCMain.ActivePage.Tag ).OnResize(self);
    end;
end;

procedure TfmMain.ReportsInvoicesInvoiceHistoryClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('ReportsInvoicesInvoiceHistoryClick') then exit ;
  fmInvoiceHistory := TfmInvoiceHistory.Create(self);
  try
  SetUpForm(fmInvoiceHistory);
  fmInvoiceHistory.ShowModal;
  finally
  FreeAndNil(fmInvoiceHistory);
  end;
end;

procedure TfmMain.InputOpenItemLinkClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('InputOpenItemLinkClick') then exit ;
  fmOpenLink := TfmOpenLink.Create(self);
  try
  SetUpForm(fmOpenLink);
  fmOpenLink.ShowModal;
  finally
  FreeAndNil(fmOpenLink);
  end;

end;

procedure TfmMain.ReportsGeneralLedgerIncomeStatementClick(
  Sender: TObject);
begin

  CheckUnpostedItems;
    if not dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan then
    begin
      PCMain.ActivePageIndex := 6 ;
      PCMainChange(self);
      TAccountTreeView(PCMain.ActivePage.Tag).CBType.ItemIndex := 1 ;
      TAccountTreeView(PCMain.ActivePage.Tag).CBTypeChange(self);
      TAccountTreeView(PCMain.ActivePage.Tag).BCreateClick(self);
     exit ;
    end ;
end;

procedure TfmMain.ReportsGeneralLedgerBalanceSheetClick(Sender: TObject);
begin

  CheckUnpostedItems;
    if not dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan then
    begin
      PCMain.ActivePageIndex := 6 ;
      PCMainChange(self);

      TAccountTreeView(PCMain.ActivePage.Tag).CBType.ItemIndex := 2 ;
      TAccountTreeView(PCMain.ActivePage.Tag).CBTypeChange(self);
      TAccountTreeView(PCMain.ActivePage.Tag).BCreateClick(self);
     exit ;
    end ;

end;

procedure TfmMain.ToolsPublishClick(Sender: TObject);
begin
// fmPublish.ShowModal;

end;

procedure TfmMain.SetupDataEntryClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupDataEntryClick') then exit ;
  fmDataEntry := TfmDataEntry.Create(self);
  try
  SetUpForm(fmDataEntry);
  fmDataEntry.ShowModal;
  finally
  FreeAndNil(fmDataEntry);
  end;
  initSetOfBooksPropertys ;
end;

procedure TfmMain.FileSaveAsClick(Sender: TObject);
begin
 
 if OSFPLUGINFindAlternateDll('FileSaveAsClick') then exit ;
 if DMTCCoreLink.TheZConnection.Connected = false then begin
  OSFMessageDlg(GetTextLang(635){'You must have a set of books open to use this option.'},mtInformation,[mbOK],0);
  exit;
 end;
 fmSaveAs := TfmSaveAs.Create(self);
 try
 SetUpForm(fmSaveAs);
 fmSaveAs.ShowModal;
 finally
 FreeAndNil(fmSaveAs);
 end;
end;

procedure TfmMain.EditRepeatingEntriesClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('EditRepeatingEntriesClick') then exit ;
  dmDatabase.CalledFromBatch:=True;
  IsRepeatingBat:=True;
  fmSelectBatchType := TfmSelectBatchType.Create(self);
  try
  SetUpForm(fmSelectBatchType);
  fmSelectBatchType.ShowModal;
  finally
  FreeAndNil(fmSelectBatchType);
  end;

end;

procedure TfmMain.EditRepeatingInvoicesClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('EditRepeatingInvoicesClick') then exit ;
  isRepeatingInv:=True;
  IDDocType:=10;
  dmDatabase.CalledFromBatch:=False;
  fmInvoiceHistory := TfmInvoiceHistory.Create(self);
  try
  SetUpForm(fmInvoiceHistory);
  fmInvoiceHistory.ShowModal;
  finally
  FreeAndNil(fmInvoiceHistory);
  end;
end;

procedure TfmMain.ToolsGlobalProcessesDoYearEndClick(Sender: TObject);
begin
  Closeopensforms1Click(self);
  if OSFPLUGINFindAlternateDll('ToolsGlobalProcessesDoYearEndClick') then exit ;
   dmDatabase.tblTotals.Filtered:=False;
   dmDatabase.tblTotals.Filter:='';
   //
   // correction wrong data
   dmDatabase.Qgen.SQL.Text:='Update Totals Set WYearId = 2 where WyearId = 1 and WPeriodId = 0';
   dmDatabase.Qgen.ExecSQL;


   DoYearEnd(false);
   DMTCCoreLink.LogAction('OPENYEAR',0,'Open new year!');
   CloseSetOfBooks ;
   if TheGlobalDataObject.Books.ActiveBooks <> nil then
   OpenBooks(false);
   //
end;

procedure TfmMain.tlbtnInvoice2Click(Sender: TObject);
Var
  i:integer;
  LastDoctype : Integer  ;
   fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin
  LastDoctype :=idDocType ;

  if OSFPLUGINFindAlternateDll('tlbtnInvoiceClick') then exit ;
  i:= GetRandThemeID;
  if ThemeClientITem.Items.Count>1 then
    if TAction(ThemeClientITem.Items[GetRandThemeID].Action).Checked then
      UpDateThemes(i,false);
  if NextDocNbrOk(10) then
  begin
    idDocType:=10;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    idDocType := LastDoctype ;
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
end;

procedure TfmMain.InputCreditNotesUpdateLedgerClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('InputCreditNotesUpdateLedgerClick') then exit ;
    IsDeleteMode:=False;
    If CheckDocInfos then begin
      fmUpdateInvoice := TfmUpdateInvoice.Create(self);
      try
      SetUpForm(fmUpdateInvoice);
      IdDocType:=10;
      fmUpdateInvoice.ShowModal;
      finally
      FreeAndNil(fmUpdateInvoice);
      end;
    end;
end;

procedure TfmMain.EditDeleteDocumentsClick(Sender: TObject);
begin

   if OSFPLUGINFindAlternateDll('EditDeleteDocumentsClick') then exit ;
    IdDocType:=10;
    IsDeleteMode:=True;
    fmUpdateInvoice := TfmUpdateInvoice.Create(self);
    try
    SetUpForm(fmUpdateInvoice);
    fmUpdateInvoice.ShowModal;
    finally
    FreeAndNil(fmUpdateInvoice);
    end;
end;

procedure TfmMain.InputAdjustStockClick(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('InputAdjustStockClick') then exit ;
  fmStockEntry := TfmStockEntry.Create(self);
  try
  SetUpForm(fmStockEntry);
  fmStockEntry.ShowModal;
  finally
  FreeAndNil(fmStockEntry);
  end;
end;

procedure TfmMain.RegistrationOnLine1Click(Sender: TObject);
Var
 Language : String ;
 afmRegister: TfmRegister ;
begin
  if not dmDatabase.ZMainconnection.Connected then
   raise Exception.Create( DMTCCoreLink.GetTextLang(20079));

 afmRegister:=TfmRegister.Create(nil);
      try
       afmRegister.ShowModal ;
       if TheGlobalDataObject.Registration.Registered  then
          Caption := Application.Title +' - '+DMTCCoreLink.GetTextLangNoAmp(3105)+' - ' + TheGlobalDataObject.Registration.SerialNumber + ' '+DMTCCoreLink.GetTextLangNoAmp(3102)+' ' + TheGlobalDataObject.Registration.CompanyName;
      Finally
        FreeAndNil(afmRegister);
      end;
end;

procedure TfmMain.SetupClientServerClick(Sender: TObject);
begin
//  fmSetupClientServer.ShowModal;
end;

procedure TfmMain.SetupInternetClick(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('SetupInternetClick') then exit ;
  fmNetSetUp := TfmNetSetUp.Create(self);
  try
  SetUpForm(fmNetSetUp);
  fmNetSetUp.ShowModal;
  finally
  FreeAndNil(fmNetSetUp);
  end;
end;

procedure TfmMain.InputStockReturnsClick(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin

  if OSFPLUGINFindAlternateDll('InputStockReturnsClick') then exit ;
  if NextDocNbrOk(13) then
  begin
    idDocType:=13;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
end;

procedure TfmMain.Quotations1Click(Sender: TObject);
var
 fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin

  if OSFPLUGINFindAlternateDll('Quotations1Click') then exit ;
  if NextDocNbrOk(14) then
  begin
    idDocType:=14;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);

end;

procedure TfmMain.InputPurchasesClick(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin

  if OSFPLUGINFindAlternateDll('InputPurchasesClick') then exit ;
  if NextDocNbrOk(12) then
  begin
    idDocType:=12;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
end;

procedure TfmMain.Orders1Click(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid; 
begin

  if OSFPLUGINFindAlternateDll('Orders1Click') then exit ;
  if NextDocNbrOk(15) then
  begin
    idDocType:=15;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    fmInvoiceEntryGrid.ShowDocForm;
    finally
    FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
end;

procedure TfmMain.InputCreditNotesClick(Sender: TObject);
var
  fmInvoiceEntryGrid : TfmInvoiceEntryGrid;
begin

  if OSFPLUGINFindAlternateDll('InputCreditNotesClick') then exit ;
  if NextDocNbrOk(11) then
  begin
    idDocType:=11;
    dmDatabase.CalledFromBatch:=False;
    fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
    try
    SetUpForm(fmInvoiceEntryGrid);
    fmInvoiceEntryGrid.ForceDocType:= idDocType ;
    fmInvoiceEntryGrid.ShowDocForm;
    finally
     FreeAndNil(fmInvoiceEntryGrid);
    end;
  end
  else
   OSFMessageDlg(GetTextLang(696){'Invalid Next Number,Change it in Document Setup'},mtError,[mbOk],0);
end;

procedure TfmMain.Fonts1Click(Sender: TObject);
Var
  ActualFont:string;
begin
//  FontDialog.Execute;

  With DmDatabase do begin
    tblSysVars.open;
    fmFonts:=TfmFonts.Create(Application);
    try
    fmFonts.Edit1.text := tblSysVarsSReportFontsName.Value;
    fmFonts.ShowModal;
    ActualFont:=fmFonts.Edit1.text;
    finally
    FreeAndNil(fmFonts);
    end;
    tblSysVars.Edit;
    tblSysVarsSReportFontsName.Value:=ActualFont;
    tblSysVars.Post;
    tblSysVars.Close;
  end;
end;

procedure TfmMain.ToolsExport1Click(Sender: TObject);
begin

  if OSFPLUGINFindAlternateDll('ToolsExport1Click') then exit ;
  fmExportData := TfmExportData.Create(self);
  try
  SetUpForm(fmExportData);
  fmExportData.ShowModal;
  finally
   FreeAndNil(fmExportData);
  end;
end;

procedure TfmMain.PrinterSetupDialogClose(Sender: TObject);
Var
  VPrinter:TPrinter;
begin
  
  if OSFPLUGINFindAlternateDll('PrinterSetupDialogClose') then exit ;
  VPrinter:=TPrinter.Create;
  try
  vPrinterName:=vPrinter.Printers[vPrinter.PrinterIndex];
  finally
  VPrinter.Free;
end;
end;

procedure TfmMain.InputConfirmClick(Sender: TObject);
begin
// Special handel plugin
if DMTCCoreLink.ReadNwReportOp('USEDOCPLUGIN',False) then
  begin
    // All logic is at documens.
    InputInvoices.Execute ;

    exit ;
  end;



  if OSFPLUGINFindAlternateDll('InputConfirmClick') then exit ;
  isRepeatingInv:=True;
  IDDocType:=14;
  dmDatabase.CalledFromBatch:=False;
  fmConfirmDocs := TfmConfirmDocs.Create(self);
  try
  SetUpForm(fmConfirmDocs);
  fmConfirmDocs.ShowModal;
  finally
  FreeAndNil(fmConfirmDocs);
  end;
end;

procedure TfmMain.DataIntegrityCheck1Click(Sender: TObject);
begin
  
  if OSFPLUGINFindAlternateDll('DataIntegrityCheck1Click') then exit ;
  fmDataIntegrityCheck := TfmDataIntegrityCheck.Create(self);
  try
  SetUpForm(fmDataIntegrityCheck);
  fmDataIntegrityCheck.ShowModal;
  finally
  FreeAndNil(fmDataIntegrityCheck);
  end;
end;

procedure TfmMain.Contact1Click(Sender: TObject);
 var
  fmContactListing: TfmContactListing;
begin

  if OSFPLUGINFindAlternateDll('ContactListing1Click') then exit ;
  fmContactListing := TfmContactListing.Create(self);
  try
  SetUpForm(fmContactListing);
  fmContactListing.ShowModal;
  finally
  FreeAndNil(fmContactListing);
  end;
end;

procedure TfmMain.EditDeleteContactClick(Sender: TObject);
 var
  fmContactListing: TfmContactListing;
begin
  
  if OSFPLUGINFindAlternateDll('ContactListing1Click') then exit ;
  fmContactListing := TfmContactListing.Create(self);
  try
  SetUpForm(fmContactListing);
  fmContactListing.ShowModal;
  finally
  FreeAndNil(fmContactListing);
  end;
end;

procedure TfmMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if PCMain.ActivePageIndex <> 0  then

  if PCMain.ActivePage.Tag > 0 then
    begin

     if  Assigned(Tform(PCMain.ActivePage.Tag ).OnKeyup) then
         Tform(PCMain.ActivePage.Tag ).OnKeyUp(Sender,Key,Shift);
    end;

end;


Function LoadT3BiTmap(Var BitMap:TBitMap;BitName:String):Boolean;
Begin
  Result:=False;
  try
    if FileExists(BitName) then
      Bitmap.LoadFromFile(BitName)
    else begin
       BitName:=ExtractFilePath(Application.ExeName)+'Bin\themes\Classic\'+ ExtractFileName(BitName);
       Bitmap.LoadFromFile(BitName)
    end;
      Bitmap.Height:=32;
      Bitmap.Width:=32;
      Result:=True;
  Except
  end;
end;






procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   var
    RunStr  : String ;
begin
  Try

    if dmDatabase.ZMainconnection.Connected then
    begin
      case OSFMessageDlg(GetTextLang(769)+#13#10+ GetTextLang(770)+#13#10+{Pink would like to remind you...}
              GetTextLang(800){Do you wish to close T...} , mtinformation, [mbYes,mbNo], 129) of
       mrNo :
        begin
          CanClose:=False;
           InCloseUp := False ;
        end
       else
        begin
        InCloseUp := true ;
        CloseSetOfBooks;
        Application.ProcessMessages ;
        ProperlyInUseClosed(True);
         if UpperCase(TDatabaseRegistyRoutines.ReadOsfIni('BACKUP','AUTOBACKUP','')) = 'TRUE' then
            begin
                 fmZipBackupRestore := TfmZipBackupRestore.Create(self);
               try
                 fmZipBackupRestore.LastOpenSet := dmDatabase.ZMainconnection.Database ;
                 SetUpForm(fmZipBackupRestore);
                 fmZipBackupRestore.Show;
                 fmZipBackupRestore.btnExecClick(self);
               finally
                 FreeAndNil(fmZipBackupRestore);
              end;
           end;
          Application.ProcessMessages;
        end;
      end;
    end;
  except
    CanClose:=True;
  end;
  if not CanClose then exit;

  InCloseUp := true ;
  // delete webpage
  if  TSStart.tag <> 0  then
     TComponent(TSStart.tag).free ;
   application.processmessages ;
  TDatabaseRegistyRoutines.WriteFormPos(self,'');
 try
   unloadplugins ;
 except
 end;
end;

procedure TfmMain.ToolsGlobalProcessesTransferBalancesClick(
  Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('ToolsGlobalProcessesTransferBalancesClick') then exit ;
  frmTransfertTrans := TfrmTransfertTrans.Create(self);
  try
  SetUpForm(frmTransfertTrans);
  TrSACCOUNTTypeID:=SelectAccType(0,true);
  if TrSACCOUNTTypeID>=0 then
    frmTransfertTrans.ShowModal;
  finally
  FreeAndNil(frmTransfertTrans);
  end;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
 If TOpenBooks.Tag =0 then
  begin
    TOpenBooks.Tag := 1 ;
    TOpenBooks.Enabled := true ;
    mainRibbon.Enabled := False ;
  end;
end;

procedure TfmMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   FormResize(Sender);
end;

Function TfmMain.CheckRandTheme(Var ThemeID:Integer):Boolean;
Begin
  Result:=True;
  if Pos('RandTheme',ThemeClientITem.Items[ThemeID].Action.Name)=1 then
    ThemeID:=1+Random(ThemeID-1);
End;

Function TfmMain.GetRandThemeID:Integer;
Var
  i:Integer;
Begin
  Result:=-1;
  For i:=0 to ThemeClientITem.Items.Count-1 do
   if Pos('RandTheme',ThemeClientITem.Items[i].Action.Name)=1 then
   begin
     Result:=i;
     Break;
  end;
End;

Procedure TfmMain.MyHandlExceptions(Sender: TObject; E: Exception);
begin
 if not Assigned(self) then
   begin
     OSFMessageDlg(E.Message,mterror,[mbOk],0);
     exit ;
   end;
 if Assigned(AfmProgress) then
     fmProgress.CanNowClose := true ;
 if (pos('read of address',lowercase(E.Message))<> 0)
 or ( pos('invalid pointer operation',lowercase(E.Message)) =1) then
    begin
    if ErrorlistString <> '' then
    ErrorlistString := ErrorlistString + #13+#10 ;
    ErrorlistString := ErrorlistString + E.Message ;
    if assigned(MainStatusBar) then
    begin
    if (MainStatusBar.Panels.Items[4].Text)  = '' then
       MainStatusBar.Panels.Items[4].Text := '0' else
      MainStatusBar.Panels.Items[4].Text := _IncrementString(MainStatusBar.Panels.Items[4].Text);
    end;
    exit ;
    end
  else
  OSFMessageDlg(E.Message,mterror,[mbOk],0);
end;

procedure TfmMain.FinancialCategories1Click(Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('FinancialCategories1Click') then exit ;
  fmFinancialCategories := TfmFinancialCategories.Create(self);
  try
  SetUpForm(fmFinancialCategories);
  fmFinancialCategories.ShowModal;
  finally
  FreeAndNil(fmFinancialCategories);
  end;
end;

Procedure TfmMain.UpDateProgressBar( Sender: TObject; Percent: LongInt );
begin
  MainProgressBar.Position := Percent;
  Repaint;
  MainProgressBar.Visible:= (Percent<>0) AND (Percent<100);
end;

procedure TfmMain.ShowTipoftheDay1Click(Sender: TObject);
begin
 PCMain.ActivePageIndex := 0 ;
 PCMainChange(self);
end;

procedure TfmMain.CloseSetofBooks13Click(Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('CloseSetofBooks1Click') then exit ;
  Try
    CloseSetOfBooks;
  except
  end;
end;

procedure TfmMain.Customizelanguage1Click(Sender: TObject);
begin
  fmCustomLang := TfmCustomLang.Create(self);
  try
  SetUpForm(fmCustomLang);
  fmCustomLang.ShowModal;
  SetUPTranslation ;
  finally
  FreeAndNil(fmCustomLang);
  end;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
APluginsFormsList.free ;
Application.OnException := nil ;
Application.OnMessage := nil ;
Screen.OnActiveFormChange:=Nil;
fPluginIteractClass.free ;
end;

procedure TfmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then begin
  HtmlHelpShowTopic('DIntro.htm');
  key := 0;
 end;
if PCMain.ActivePageIndex <> 0  then
  if PCMain.ActivePage.Tag > 0 then
    begin
     if  Assigned(Tform(PCMain.ActivePage.Tag ).OnKeyDown) then
         begin
          if not (Tform(PCMain.ActivePage.Tag ) is TfmStockEntry) then
           Tform(PCMain.ActivePage.Tag ).OnKeyDown(Sender,Key,Shift);
         end;
    end;   
end;

procedure TfmMain.BackupPathClick(Sender: TObject);
Var
  tmp:String;
begin
   tmp := GetBackupPath;
   Tmp:=ExcludeTrailingPathDelimiter(Tmp);
   if SelectDIrectory(GetTextLang(2965) { 'Select Backup Directory'},'',Tmp) then
   if TheGlobalDataObject.Books.ActiveBooks <> nil then
      begin
         WriteT3IniFile('BACKUP','LASTPATH'+TheGlobalDataObject.Books.ActiveBooks.Name ,Tmp);
      end else
         WriteT3IniFile('BACKUP','LASTPATH'  ,Tmp);
end;

procedure TfmMain.PointOfSales1Click(Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('PointOfSales1Click') then exit ;
  fmPosSetup := TfmPosSetup.Create(self);
  try
  SetUpForm(fmPosSetup);
  fmPosSetup.ShowModal;
  finally
  FreeAndNil(fmPosSetup);
  end;
end;

procedure TfmMain.PopupActionBar1Popup(Sender: TObject);
   procedure HandleGoups (AMenuitem : Tmenuitem  ;AGroup : TActionClients) ;
   var i : Integer ; ASubMenuitem : Tmenuitem ;
   begin
      for i := 0 to AGroup.Count -1 do
         begin
            ASubMenuitem := Tmenuitem.Create(PopupActionBar1); ;
            ASubMenuitem.Caption := AGroup[i].Caption ;
           if AGroup[i].Action = nil  then

            ASubMenuitem.ImageIndex := AGroup[i].ImageIndex
            else
            ASubMenuitem.Action := AGroup[i].Action ;
            AMenuitem.Add(ASubMenuitem) ;
           if  AGroup[i].Items <> nil then
               HandleGoups(ASubMenuitem,AGroup[i].Items);
         end;
   end;
var
 AMenuitem : Tmenuitem ;
 i , x: Integer ;
begin
 if Not DMTCCoreLink.TheZConnection.Connected then
   Abort ;

if (ReadSysParam('BEditmode',0,CurrentUser).AsInteger = 3) then
     exit ;

 if PopupActionBar1.Items.Count <> 0  then exit ;
  if   (ReadSysParam('BEditmode',0,CurrentUser).AsInteger = 4) then exit ;
  for i := 0 to mainRibbon.Tabs.Count -2 do
     begin
      AMenuitem := Tmenuitem.Create(PopupActionBar1);
      AMenuitem.Caption := mainRibbon.Tabs[i].Caption ;
      PopupActionBar1.Items.Add(AMenuitem);
      for x := 0 to mainRibbon.Tabs[i].Page.GroupCount -1 do
          begin
              HandleGoups(AMenuitem,mainRibbon.Tabs[i].Page.Groups[x].Items) ;
          end;
     end;
end;

procedure TfmMain.POSInvoice1Click(Sender: TObject);
var
  MyModalresult : Integer ;
  LoggedIn : Boolean ;
begin
  if OSFPLUGINFindAlternateDll('POSInvoice1Click') then exit ;
  if PosLogin then
  begin
    fmPosInvoiceEntry := TfmPosInvoiceEntry.Create(self);
    try
     MyModalresult := fmPosInvoiceEntry.ShowModal;
     if MyModalresult = 99 then
       LoggedIn := PosLogin ;
     while (MyModalresult = 99) and LoggedIn do
        begin
          FreeAndNil(fmPosInvoiceEntry) ;
          fmPosInvoiceEntry := TfmPosInvoiceEntry.Create(self);
          MyModalresult := fmPosInvoiceEntry.ShowModal;
           if MyModalresult = 99 then
             LoggedIn := PosLogin ;
        end ;
        if  (MyModalresult = 99) and not (LoggedIn) then
            begin
               CloseSetofBooks13Click(self);
            end;
    finally
    FreeAndNil(fmPosInvoiceEntry);
    end;
  end;
end;

procedure TfmMain.InvestigatorClick(Sender: TObject);
begin
  if OSFPLUGINFindAlternateDll('InvestigatorClick') then exit ;
  fmInvestigator := TfmInvestigator.Create(self);
  try
  SetUpForm(fmInvestigator);
  fmInvestigator.ShowModal;
  finally
  FreeAndNil(fmInvestigator);
  end;
end;

procedure TfmMain.AccountViewer1Click(Sender: TObject);
Var
  aPage  : TTabSheet ;
begin
  fmTAccountView := TfmTAccountView.Create(Application);
  try
  fmTAccountView.ShowModal;
  finally
    fmTAccountView.Free ;
  end;
end;

procedure TfmMain.PointofSale1Click(Sender: TObject);
begin
  CheckUnpostedItems;
  fmPosReportOptions:=TfmPosReportOptions.Create(self);
  try
  fmPosReportOptions.ShowModal;
  finally
  FreeAndNil(fmPosReportOptions);
  end;
end;


procedure TfmMain.ReportDesigner1Click(Sender: TObject);
begin
    OSFPLUGINRunPlugInsDLLProgram('plug_ins\ReportMan.'  +   PluginsDLLName ,'');
end;

procedure TfmMain.SetUPTranslation;
Var
  Found : Boolean ;
  i,x : Integer ;

begin
fmMain.ScreenTipsManager1.Footer :=  DMTCCoreLink.GetTextLangNoAmp( 1000004 );

  BuildUserReportmenu ;
  InitQuantumgridLang ;
  found := False;
   for i  := 0 to TheGlobalDataObject.Languages.Count -1 do
   begin
     if TheGlobalDataObject.Languages[i].Active and not Found then
     begin
       TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
       DMTCCoreLink.TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
       currentLanguage := theGlobalDataObject.Languages[i].name ;
       Found := true ;
     end else
     if  UpperCase(TheGlobalDataObject.Languages[i].Name) = 'ENGLISCH' then
     begin
       TheGlobalDataObject.DefaultLangSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
       DMTCCoreLink.TheGlobalDataObject.DefaultLangSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
     end;
   end;
   if not found and (TheGlobalDataObject.Languages.Count <> 0) then
   begin
      TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[0].Name +'.dfm');
      currentLanguage := theGlobalDataObject.Languages[0].Name ;
   end;
   HelpFileName := ExtractFilePath(Application.ExeName) +'EngHelp.chm' ;
   if FileExists(ExtractFilePath(Application.ExeName) + Copy(currentLanguage,1,3) +'Help.chm' ) then
      HelpFileName := ExtractFilePath(Application.ExeName) + Copy(currentLanguage,1,3) +'Help.chm' ;
   Application.HelpFile := HelpFileName ;
   try
        RSYes                  := GetTextLang(2243 );
        RSNo                   := GetTextLang(2244 );
        RSTrue                 := GetTextLang(2245 );
        RSFalse                := GetTextLang(2246 );
        RSTallShortChars       := GetTextLang(2247 );
        RSDelete               := GetTextLang(2248 );
        RSNotDoneYet           := GetTextLang(2249 );
        RSNoTimersAvail        := GetTextLang(2251 );
        RSBadTriggerHandle     := GetTextLang(2252 );
        RSEditingItems         := GetTextLang(2253 );
        RSEditingFolders       := GetTextLang(2254 );
        RSExclusiveEventConflict:=  GetTextLang(2255 );
        RSBackwardTimesError    :=  GetTextLang(2256 );
        RSDBPostError           :=  GetTextLang(2257 );
        RSMonthConvertError     :=  GetTextLang(2258 );
        RSInvalidDay            :=  GetTextLang(2259 );
        RSInvalidDate           :=  GetTextLang(2250 );
        RSInvalidMonth          :=  GetTextLang(2261 );
        RSInvalidMonthName      :=  GetTextLang(2262 );
        RSInvalidYear           :=  GetTextLang(2263 );
        RSDayIsRequired         :=  GetTextLang(2264 );
        RSMonthIsRequired       :=  GetTextLang(2265 );
        RSYearIsRequired        :=  GetTextLang(2266 );
        RSNameIsRequired        :=  GetTextLang(2267 );
        RSFailToCreateTask      :=  GetTextLang(2268 );
        RSFailToCreateEvent     :=  GetTextLang(2269 );
        RSFailToCreateContact   :=  GetTextLang(2260 );
        RSFailToCreateResource  :=  GetTextLang(2271 );
        RSDuplicateResource     :=  GetTextLang(2272 );
        RSInvalidTableSpecified :=  GetTextLang(2273 );
        RSUnableToOpen          :=  GetTextLang(2274 );
        RSSQLUpdateError        :=  GetTextLang(2275 );
        RSPhoneTypeLabel1       :=  GetTextLang(2276 );
        RSPhoneTypeLabel2       :=  GetTextLang(2277 );
        RSPhoneTypeLabel3       :=  GetTextLang(2278 );
        RSPhoneTypeLabel4       :=  GetTextLang(2279 );
        RSPhoneTypeLabel5       :=  GetTextLang(2280 );
        RSPhoneTypeLabel6       :=  GetTextLang(2281 );
        RSPhoneTypeLabel7       :=  GetTextLang(2282 );
        RSPhoneTypeLabel8       :=  GetTextLang(2283 );
        RSPhoneTypeLabel9       :=  GetTextLang(2284 );
        RSPhoneTypeLabel10      :=  GetTextLang(2285 );
        RSPhoneTypeLabel11      :=  GetTextLang(2286 );
        RSPhoneTypeLabel12      :=  GetTextLang(2287 );
        RSPhoneTypeLabel13      :=  GetTextLang(2288 );
        RSPhoneTypeLabel14      :=  GetTextLang(2289 );
        RSPhoneTypeLabel15      :=  GetTextLang(2290 );
        RSPhoneTypeLabel16      :=  GetTextLang(2291 );
        RSPhoneTypeLabel17      :=  GetTextLang(2292 );
        RSCategoryLabel1        :=  GetTextLang(2293 );
        RSCategoryLabel2        :=  GetTextLang(2294 );
        RSCategoryLabel3        :=  GetTextLang(2295 );
        RSCategoryLabel4        :=  GetTextLang(2296 );
        RSCategoryLabel5        :=  GetTextLang(2297 );
        RSWeekOf                :=  GetTextLang(2298 );
        RSThrough               :=  GetTextLang(2299 );
        RSSunday                :=  GetTextLang(2300 );
        RSMonday                :=  GetTextLang(2301 );
        RSTuesday               :=  GetTextLang(2302 );
        RSWednesday             :=  GetTextLang(2303 );
        RSThursday              :=  GetTextLang(2304 );
        RSFriday                :=  GetTextLang(2305 );
        RSSaturday              :=  GetTextLang(2306 );
        RSASunday               :=  GetTextLang(2307 );
        RSAMonday               :=  GetTextLang(2308 );
        RSATuesday              :=  GetTextLang(2309 );
        RSAWednesday            :=  GetTextLang(2310 );
        RSAThursday             :=  GetTextLang(2311 );
        RSAFriday               :=  GetTextLang(2312 );
        RSASaturday             :=  GetTextLang(2313 );
        RSLSunday               :=  GetTextLang(2314 );
        RSLMonday               :=  GetTextLang(2315 );
        RSLTuesday              :=  GetTextLang(2316 );
        RSLWednesday            :=  GetTextLang(2317 );
        RSLThursday             :=  GetTextLang(2318 );
        RSLFriday               :=  GetTextLang(2319 );
        RSLSaturday             :=  GetTextLang(2320 );
        RSNone                  :=  GetTextLang(2321 );
        RSDaily                 :=  GetTextLang(2322 );
        RSWeekly                :=  GetTextLang(2323 );
        RSMonthlyByDay          :=  GetTextLang(2324 );
        RSMonthlyByDate         :=  GetTextLang(2325 );
        RSYearlyByDay           :=  GetTextLang(2326 );
        RSYearlyByDate          :=  GetTextLang(2327 );
        RSCustom                :=  GetTextLang(2328 );
        RSMinutes               :=  GetTextLang(2329 );
        RSHours                 :=  GetTextLang(2330 );
        RSDays                  :=  GetTextLang(2331 );
        RSPermanent             :=  GetTextLang(2332 );
        RSFromContactList       :=  GetTextLang(2333 );
        RSContactPopupAdd       :=  GetTextLang(2334 );
        RSContactPopupEdit      :=  GetTextLang(2335 );
        RSContactPopupDelete    :=  GetTextLang(2336 );
        RSFromSchedule          :=  GetTextLang(2337 );
        RSFromTaskList          :=  GetTextLang(2338 );
        RSTaskPopupAdd          :=  GetTextLang(2339 );
        RSTaskPopupEdit         :=  GetTextLang(2340 );
        RSTaskPopupDelete       :=  GetTextLang(2341 );
        RSTaskTitleResource     :=  GetTextLang(2342 );
        RSTaskTitleNoResource   :=  GetTextLang(2343 );
        RSMonthPopupToday       :=  GetTextLang(2344 );
        RSMonthPopupNextMonth   :=  GetTextLang(2345 );
        RSMonthPopupPrevMonth   :=  GetTextLang(2346 );
        RSMonthPopupNextYear    :=  GetTextLang(2347 );
        RSMonthPopupPrevYear    :=  GetTextLang(2348 );
        RSWeekPopupAdd          :=  GetTextLang(2349 );
        RSWeekPopupEdit         :=  GetTextLang(2350 );
        RSWeekPopupDelete       :=  GetTextLang(2351 );
        RSWeekPopupNav          :=  GetTextLang(2352 );
        RSWeekPopupNavToday     :=  GetTextLang(2353 );
        RSWeekPopupNavNextWeek  :=  GetTextLang(2354 );
        RSWeekPopupNavPrevWeek  :=  GetTextLang(2355 );
        RSWeekPopupNavNextMonth :=  GetTextLang(2356 );
        RSWeekPopupNavPrevMonth :=  GetTextLang(2357 );
        RSWeekPopupNavNextYear  :=  GetTextLang(2358 );
        RSWeekPopupNavPrevYear  :=  GetTextLang(2359 );
        RSPrintPrvPrevPage      :=  GetTextLang(2360 );
        RSPrintPrvNextPage      :=  GetTextLang(2361 );
        RSPrintPrvFirstPage     :=  GetTextLang(2362 );
        RSPrintPrvLastPage      :=  GetTextLang(2363 );
        RSDayPopupAdd           :=  GetTextLang(2364 );
        RSDayPopupEdit          :=  GetTextLang(2365 );
        RSDayPopupDelete        :=  GetTextLang(2366 );
        RSDayPopupNav           :=  GetTextLang(2367 );
        RSDayPopupNavToday      :=  GetTextLang(2368 );
        RSDayPopupNavTomorrow   :=  GetTextLang(2369 );
        RSDayPopupNavYesterday  :=  GetTextLang(2370 );
        RSDayPopupNavNextDay    :=  GetTextLang(2371 );
        RSDayPopupNavPrevDay    :=  GetTextLang(2372 );
        RSDayPopupNavNextWeek   :=  GetTextLang(2373 );
        RSDayPopupNavPrevWeek   :=  GetTextLang(2374 );
        RSDayPopupNavNextMonth  :=  GetTextLang(2375 );
        RSDayPopupNavPrevMonth  :=  GetTextLang(2376 );
        RSDayPopupNavNextYear   :=  GetTextLang(2377 );
        RSDayPopupNavPrevYear   :=  GetTextLang(2378 );
        RSHintToday             :=  GetTextLang(2379 );
        RSHintTomorrow          :=  GetTextLang(2380 );
        RSHintYesterday         :=  GetTextLang(2381 );
        RSHintNextWeek          :=  GetTextLang(2382 );
        RSHintPrevWeek          :=  GetTextLang(2383 );
        RSPosition              :=  GetTextLang(2384 );
        RSCompany               :=  GetTextLang(2385 );
        RSTitle                 :=  GetTextLang(2386 );
        RSEMail                 :=  GetTextLang(2387 );
        RSCountry               :=  GetTextLang(2388 );
        RSCategory              :=  GetTextLang(2389 );
        RSNotes                 :=  GetTextLang(2390 );
        RSCustom1               :=  GetTextLang(2391 );
        RSCustom2               :=  GetTextLang(2392 );
        RSCustom3               :=  GetTextLang(2393 );
        RSCustom4               :=  GetTextLang(2394 );
        RSOKBtn                 :=  GetTextLang(2395 );
        RSCancelBtn             :=  GetTextLang(2396 );
        RSCloseBtn              :=  GetTextLang(2397 );
        RSPrintBtn              :=  GetTextLang(2398 );
        RSUntitled              :=  GetTextLang(2399 );
        RSSelectASound          :=  GetTextLang(2400 );
        RSSoundFinder           :=  GetTextLang(2401 );
        RSDefaultSound          :=  GetTextLang(2402 );
        RSDlgEventEdit          :=  GetTextLang(2403 );
        RSAppointmentGroupBox   :=  GetTextLang(2404 );
        RSDescriptionLbl        :=  GetTextLang(2405 );
        RSCategoryLbl           :=  GetTextLang(2406 );
        RSStartTimeLbl          :=  GetTextLang(2407 );
        RSEndTimeLbl            :=  GetTextLang(2408 );
        RSAlarmSet              :=  GetTextLang(2409 );
        RSRecurringLbl          :=  GetTextLang(2410 );
        RSIntervalLbl           :=  GetTextLang(2411 );
        RSRecurrenceEndsLbl     :=  GetTextLang(2412 );
        RSAllDayEvent           :=  GetTextLang(2413 );
        RSNotesLbl              :=  GetTextLang(2414 );
        RSDlgContactEdit        :=  GetTextLang(2415 );
        RSPhone1                :=  GetTextLang(1252 );
        RSPhone2                :=  GetTextLang(1253 );
        RSFax                   :=  GetTextLang(189 );
        RSNameLbl               :=  GetTextLang(2416 );
        RSTitleLbl              :=  GetTextLang(2417 );
        RSAddressLbl            :=  GetTextLang(2418 );
        RSCityLbl               :=  GetTextLang(2419 );
        RSStateLbl              :=  GetTextLang(2420 );
        RSCountryLbl            :=  GetTextLang(2421 );
        RSZipCodeLbl            :=  GetTextLang(2422 );
        RSCompanyLbl            :=  GetTextLang(2423 );
        RSPositionLbl           :=  GetTextLang(2424 );
        RSDlgPrintPreview       :=  GetTextLang(2425);
        RSDlgTaskEdit           :=  GetTextLang(2426);
        RSDueDate               :=  GetTextLang(2427);
        RSDetails               :=  GetTextLang(2428);
        RSComplete              :=  GetTextLang(2429);
        RSDaysOverdue           :=  GetTextLang(2430);
        RSCreatedOn             :=  GetTextLang(2431 );
        RSCompletedOn           :=  GetTextLang(2432 );
        RSReminder              :=  GetTextLang(2433 );
        RSOverdue               :=  GetTextLang(2434 );
        RSSnoozeCaption         :=  GetTextLang(2435 );
        RSSubjectCaption        :=  GetTextLang(2436 );
        RSNotesCaption          :=  GetTextLang(2437 );
        RSDismissBtn            :=  GetTextLang(2438 );
        RSSnoozeBtn             :=  GetTextLang(2439 );
        RSOpenItemBtn           :=  GetTextLang(2440 );
        RS5Minutes              :=  GetTextLang(2441 );
        RS10Minutes             :=  GetTextLang(2442 );
        RS15Minutes             :=  GetTextLang(2443 );
        RS30Minutes             :=  GetTextLang(2444 );
        RS45Minutes             :=  GetTextLang(2445 );
        RS1Hour                 :=  GetTextLang(2446 );
        RS2Hours                :=  GetTextLang(2447 );
        RS3Hours                :=  GetTextLang(2448 );
        RS4Hours                :=  GetTextLang(2449 );
        RS5Hours                :=  GetTextLang(2450 );
        RS6Hours                :=  GetTextLang(2451 );
        RS7Hours                :=  GetTextLang(2452 );
        RS8Hours                :=  GetTextLang(2453 );
        RS1Days                 :=  GetTextLang(2454 );
        RS2Days                 :=  GetTextLang(2455 );
        RS3Days                 :=  GetTextLang(2456 );
        RS4Days                 :=  GetTextLang(2457 );
        RS5Days                 :=  GetTextLang(2458 );
        RS6Days                 :=  GetTextLang(2459 );
        RS1Week                 :=  GetTextLang(2460 );
        RSCalendarPrevMonth     :=  GetTextLang(2461 );
        RSCalendarNextMonth     :=  GetTextLang(2462 );
        RSCalendarPrevYear      :=  GetTextLang(2463 );
        RSCalendarNextYear      :=  GetTextLang(2464 );
        RSCalendarToday         :=  GetTextLang(2465 );
        RSCalendarRevert        :=  GetTextLang(2466 );
        RSCalendarPopupToday    :=  GetTextLang(2467 );
        RSCalendarPopupNextMonth:=  GetTextLang(2468 );
        RSCalendarPopupPrevMonth:=  GetTextLang(2469 );
        RSCalendarPopupNextYear :=  GetTextLang(2470 );
        RSCalendarPopupPrevYear :=  GetTextLang(2471);
        RSCalendarPopupRevert   :=  GetTextLang(2472);
        sIENotInstalled    :=  GetTextLang(2773 );
        sOpenFileFailed    :=  GetTextLang(2774 );
        sFileNotFound      :=  GetTextLang(2775 );
        sAllocSrcMemFailed :=  GetTextLang(2776 );
        sHttpReadReqFailed :=  GetTextLang(2777 );
        sHttpDataNotAvail  :=  GetTextLang(2778 );
        sHttpReqSendFailed :=  GetTextLang(2779 );
        sHttpReqOpenFailed :=  GetTextLang(2780 );
        sInetConnectFailed :=  GetTextLang(2781 );
        sInetOpenFailed    :=  GetTextLang(2782 );
        sInvalidFtpLoc     :=  GetTextLang(2783 );
        sInvalidFtpDir     :=  GetTextLang(2784 );
        sFtpReadReqFailed  :=  GetTextLang(2785 );
        sFtpDataNotAvail   :=  GetTextLang(2786 );
        sFtpOpenFileFailed :=  GetTextLang(2787 );
        sFtpPutFileFailed  :=  GetTextLang(2788 );
        sSrcLoadFailed     :=  GetTextLang(2789 );
        sInvalidMemPtr     :=  GetTextLang(2790 );
        sFmtErrorMsg       :=  GetTextLang(2791 );
        sIndexOutOfBounds  :=  GetTextLang(2792 );
        sExpMarkupDecl     :=  GetTextLang(2793 );
        sIllAttrType       :=  GetTextLang(2794 );
        sIllAttrDefKeyw    :=  GetTextLang(2795 );
        sSysIdMissing      :=  GetTextLang(2796 );
        sExtModifMissing   :=  GetTextLang(2797 );
        sIllCondSectStart  :=  GetTextLang(2798 );
        sBadSepInModel     :=  GetTextLang(2799 );
        sExpCommentOrCDATA :=  GetTextLang(2800 );
        sUnexpectedEof     :=  GetTextLang(2801 );
        sMismatchEndTag    :=  GetTextLang(2802 );
        sIllCharInRef      :=  GetTextLang(2803 );
        sUndeclaredEntity  :=  GetTextLang(2804 );
        sExpectedString    :=  GetTextLang(2805 );
        sSpaceExpectedAt   :=  GetTextLang(2806 );
        sUnexpEndOfInput   :=  GetTextLang(2807 );
        sQuoteExpected     :=  GetTextLang(2808 );
        sInvalidXMLVersion :=  GetTextLang(2809 );
        sUnableCreateStr   :=  GetTextLang(2810 );
        sInvalidName       :=  GetTextLang(2811 );
        sInvalidCommentText:=  GetTextLang(2812 );
        sCommentBeforeXMLDecl:=  GetTextLang(2813 );
        sInvalidCDataSection :=  GetTextLang(2814 );
        sRedefinedAttr     :=  GetTextLang(2815 );
        sCircularEntRef    :=  GetTextLang(2816 );
        sInvAttrChar       :=  GetTextLang(2817 );
        sInvPCData         :=  GetTextLang(2818 );
        sDataAfterValDoc   :=  GetTextLang(2819 );
        sNoIntConditional  :=  GetTextLang(2820 );
        sNotationNotDeclared:=  GetTextLang(2821 );
        sInvPubIDChar      :=  GetTextLang(2822 );
        sNoNDATAInPeDecl   :=  GetTextLang(2823 );
        sInvStandAloneVal  :=  GetTextLang(2824 );
        sInvEncName        :=  GetTextLang(2825 );
        sInvVerNum         :=  GetTextLang(2826 );
        sInvEntityValue    :=  GetTextLang(2827 );
        sNoCommentInMarkup :=  GetTextLang(2828 );
        sNoPEInIntDTD      :=  GetTextLang(2829 );
        sXMLDecNotAtBeg   :=  GetTextLang(2830 );
        sInvalidElementName:=  GetTextLang(2831 );
        sBadParamEntNesting:=  GetTextLang(2832 );
        sInvalidCharEncoding:=  GetTextLang(2833 );
        sAttrNotNum        :=  GetTextLang(2834 );
        sUnknownAxis       :=  GetTextLang(2835 );
        sInvalidXMLChar   :=  GetTextLang(2836 );
        sInvalidBEChar    :=  GetTextLang(2837 );
        sInvalidLEChar    :=  GetTextLang(2838 );
        sBadUTF8Char      :=  GetTextLang(2839 );
        sErrEndOfDocument :=  GetTextLang(2840 );
        sUCS_ISOConvertErr:=  GetTextLang(2841 );
        sUCS_U16ConvertErr:=  GetTextLang(2842 );
        sUCS_U8ConverErr  :=  GetTextLang(2843 );
        RSOutOfRange      :=  GetTextLang(2844 );
        RSNotSupported    :=  GetTextLang(2845 );
        RSNeedElementName :=  GetTextLang(2846 );
        RSNeedFormatName  :=  GetTextLang(2847 );
        RSPrtControlOwner :=  GetTextLang(2848 );
        RSBadPrintFormat  :=  GetTextLang(2849 );
        RSBadItemType     :=  GetTextLang(2850 );
        RSBadMeasurement  :=  GetTextLang(2851 );
        RSOwnerNotWinCtrl :=  GetTextLang(2852 );
        RSNoControlLink   :=  GetTextLang(2853 );
        RSNoPrintFormats  :=  GetTextLang(2854 );
        RSNoCanvas        :=  GetTextLang(2855 );
        RSNoLocalizationFile := GetTextLang(2856 );
        RSCategoryDesc0   :=  GetTextLang(2857 );
        RSCategoryDesc1   :=  GetTextLang(2858 );
        RSCategoryDesc2   :=  GetTextLang(2859 );
        RSCategoryDesc3   :=  GetTextLang(2860 );
        RSCategoryDesc4   :=  GetTextLang(2861 );
        RSCategoryDesc5   :=  GetTextLang(2862 );
        RSCategoryDesc6   :=  GetTextLang(2863 );
        RSCategoryDesc7   :=  GetTextLang(2864 );
        RSCategoryDesc8   :=  GetTextLang(2865 );
        RSCategoryDesc9   :=  GetTextLang(2866 );
        RSEditPrintFormat :=  GetTextLang(2867 );
        RSAddNewResource  :=  GetTextLang(2868 );
        RSSelectResource  :=  GetTextLang(2869 );
        // plugins menu item  needs to be updated
        if FindComponent('PlugInsMenu') <> nil then
        begin
          TMenuItem(FindComponent('PlugInsMenu')).Caption:= GetTextLang(1805);
          TMenuItem(FindComponent('PlugInsMenu')).ImageIndex :=  53 ;
        end;
       rbReports.Items[1].Caption :=  GetTextLang(309 );
       cxclasses.cxSetResourceString(@SRecentDocuments,'Last actions');
        Bugreportsourceforge1.Caption :=  GetTextLang(3187 );
        Closeopensforms1.Caption :=  GetTextLang(3189 );
        bActions.Caption :=  GetTextLang(1341 );
        rbReports.Caption :=  GetTextLang(123 );
        rbEdit.Caption :=  GetTextLang(1841 );
        rgActions.Caption :=  GetTextLang(3217 );
        rgStart.Caption :=  GetTextLang(987);
        AToolsBackup.Caption :=  GetTextLang(834);
       // filemenu.Caption := GetTextLang(120);
        rbFile.Caption := GetTextLang(120);
        for i := 0 to rbEdit.Items.Count-1 do
          if rbEdit.Items[i].tag = 454 then
            rbEdit.Items[i].Caption := GetTextLang(121);
        for i := 0 to rbEdit.Items.Count-1 do
          if rbEdit.Items[i].tag = 464 then
            rbEdit.Items[i].Caption := GetTextLang(122);
        Ledgerviewer1.Caption := GetTextLang(3104)+' 1';
        Ledgerviewer2.Caption := GetTextLang(3104)+' 2';
        rbReports.Items[0].Caption := GetTextLang(123);
        rgSetupGroup.Caption := GetTextLang(124);
        rgSetup.Caption := GetTextLang(124);
        for i := 0 to rbtools.Items.Count-1 do
          if rbtools.Items[i].tag = 444 then
            begin
            rbtools.Items[i].Caption := GetTextLang(125);
            for x := 0 to rbtools.Items[i].Items.Count -1 do
               if rbtools.Items[i].Items[x].Tag = 4 then
                 rbtools.Items[i].Items[x].Caption := GetTextLang(108);
            end;
        rbtools.Caption := DMTCCoreLink.GetTextLangNoAmp(125);
        for i := 0 to rbEdit.Items.Count-1 do
          if rbEdit.Items[i].tag = 444 then
            rbEdit.Items[i].Caption := GetTextLang(126);
        (* File Menu Dropdown *)
        Currencies1.Caption := GetTextLang(3470);
        Workflowsetup1.Caption := GetTextLang(3469);
        FileCreate.Caption := GetTextLang(17);
        FileDelete.Caption := GetTextLang(18);
        FileSaveAs.Caption := GetTextLang(19);
        FileSwitch.Caption :=  'Switch language';
        FileExit.Caption := GetTextLang(21);
        CloseSetofBooks1.Caption := GetTextLang(835);
        Contact1.Caption := GetTextLang(838);
        Quotations1.Caption := GetTextLang(839);
        InputConfirm.Caption := GetTextLang(840);
        SetupInternet.Caption := GetTextLang(845);
        FinancialCategories1.Caption := GetTextLang(846);
        SetupDataEntry.Caption := GetTextLang(848);
        Customizelanguage1.Caption := GetTextLang(849);
        Import1.Caption := GetTextLang(850);
        ShowTipoftheDay1.Caption := GetTextLang(851);
        RegistrationOnLine1.Caption := GetTextLang(852);
        OpenPictureDialog.Title := GetTextLang(1017);
        (* Edit Menu Dropdown *)
        Accounts1.Caption := GetTextLang(22);
        EditAccountsCreditor.Caption := GetTextLang(30);
        EditAccountsDebtor.Caption := GetTextLang(31);
        EditDelete.Caption := GetTextLang(24);
        (* Delete SubMenu Dropdown *)
        (* Delete Accounts SubMenu Dropdown *)
        EditDeleteDocuments.Caption := GetTextLang(38);
        EditRepeatingEntries.Caption := GetTextLang(25);
        EditRepeatingInvoices.Caption := GetTextLang(26);
        EditStockItems.Caption := GetTextLang(27);
        ADocuments.Caption := GetTextLang(38);
        (* Input Menu Dropdown *)
        InputAdjustStock.Caption := GetTextLang(42);
        InputProjects.Caption := DMTCCoreLink.gettextlang(3099);
        (* Documents SubMenu Dropdown *)
        InputCreditNotes.Caption := GetTextLang(47);
        (* Credit Notes SubMenu Dropdown *)
        InputCreditNotesUpDateLedger.Caption := GetTextLang(53);
        InputInvoices.Caption := GetTextLang(48);
        Backorders1.Caption :=  DMTCCoreLink.GetTextLang(1191) ;
        (* Invoices SubMenu Dropdown *)
        InputPurchases.Caption := GetTextLang(49);
        (* Purchases SubMenu Dropdown *)
        InputStockReturns.Caption := GetTextLang(50);
        (* Stock Returns SubMenu Dropdown *)
        InputCalendar.Caption := GetTextLang(2879);
        (* Reports Menu Dropdown *)
        (* Creditor SubMenu Dropdown *)
        BackupPath.Caption := GetTextLang(91);
        (* Invoices SubMenu Dropdown *)
        SetupAccessControl.Caption := GetTextLang(585);
        SetupBatchTypes.Caption := GetTextLang(92);
        SetupCompanyInfo.Caption := GetTextLang(93);
        SetupDocuments.Caption := GetTextLang(98);
        SetupGroups.Caption := GetTextLang(97);
        SetupPrinter.Caption := GetTextLang(99);
        SetupReportingDates.Caption := GetTextLang(100);
        SetupSalesman.Caption := GetTextLang(101);
        SetupStockInfo.Caption := GetTextLang(103);
        PointOfSales1.Caption := GetTextLang(1759);
        ToolsCalculator.Caption := GetTextLang(105);
        DataIntegrityCheck1.Caption := GetTextLang(106);
        ToolsExport1.Caption := GetTextLang(107);
        ReportDesigner1.Caption := GetTextLang(1761);
        (* Global Processes SubMenu Dropdown *)
        ToolsGlobalProcessesClearReset.Caption := GetTextLang(114);
        ToolsGlobalProcessesDoYearEnd.Caption := GetTextLang(115);
        Reversebatch1.Caption := GetTextLang(2084);
        Copyfromasetofbooks1.Caption := GetTextLang(3004);
        ToolsSupport.Caption := GetTextLang(113);
        (* Help Menu Dropdown *)
        HelpHelp.Caption := GetTextLang(586);
        HelpAbout.Caption := GetTextLang(119);
        { Mainform Button Captions }
        aFileOpen.Caption := DMTCCoreLink.GetTextLangNoAmp(163);
        tlbtnBatch.Caption :=   DMTCCoreLink.GetTextLangNoAmp(164);
       // bActions.Items[0].Caption := InputInvoices.Caption  ;
        tlbtnRecon.Caption := DMTCCoreLink.GetTextLangNoAmp(166);
        tlbtnLink.Caption := DMTCCoreLink.GetTextLangNoAmp(404);
        btlSearch.Caption := DMTCCoreLink.GetTextLangNoAmp(1204);
        if assigned(TUnregistered) then
        TUnregistered.Caption := GetTextLang(3262); ////register
        //T Account Viewer
        AccountViewer1.Caption := GetTextLang(1265) ;
        //Point of Sale
        reportsPointofSale1.Caption := GetTextLang(1266);
        //Sales Documents
        for i:=0 to rbEdit.Items.Count -1 do
           begin
             if  rbEdit.Items[i].Tag =464  then
                begin
                    for x := 0 to  rbEdit.Items[i].items.Count -1 do
                      begin
                         if rbEdit.Items[i].items[x].Tag = 4 then
                            rbEdit.Items[i].items[x].caption := GetTextLang(1268);
                         if rbEdit.Items[i].items[x].Tag = 5 then
                            rbEdit.Items[i].items[x].caption := GetTextLang(1269);
                      end;
                end;
           end;
        for i:=0 to rgSetupGroup.Items.Count -1 do
           begin
             if  rgSetupGroup.Items[i].Tag =464  then
                begin

                    for x := 0 to  rgSetupGroup.Items[i].items.Count -1 do
                      begin
                         if rgSetupGroup.Items[i].items[x].Tag = 4 then
                            rgSetupGroup.Items[i].items[x].caption := GetTextLang(396);
                      end;
                end;
           end;
    PosInvoice2.Caption := GetTextLang(1270);
    Order1.Caption := GetTextLang(841);
    rbuser.Caption := GetTextLang(3563);
    rgReport.Caption := GetTextLang(123);
    aEditUserbar.Caption := GetTextLang(121);
    rglisten.Items[0].Caption :=GetTextLang(3564);
      rglisten.Items[1].Caption :=GetTextLang(345);
      cxAddToGroup.Properties.Items.Items[0].Description := GetTextLang(345) +' 1 ';
      cxAddToGroup.Properties.Items.Items[1].Description := GetTextLang(345) +' 2 ';
      cxAddToGroup.Properties.Items.Items[2].Description := GetTextLang(345) +' 3 ';
      cxAddToGroup.Properties.Items.Items[3].Description := GetTextLang(345) +' 4 ';
      cxAddToGroup.Properties.Items.Items[4].Description := GetTextLang(345) +' 5 ';
      cxAddToGroup.Properties.Items.Items[5].Description := GetTextLang(345) +' 6 ';
      rgUser.Caption := GetTextLang(345) +' 1 ';
      rgUser2.Caption := GetTextLang(345) +' 2 ';
      rgUser3.Caption := GetTextLang(345) +' 3 ';
      rgUser4.Caption := GetTextLang(345) +' 4 ';
      rgUser5.Caption := GetTextLang(345) +' 5 ';
      rgUser6.Caption := GetTextLang(345) +' 6 ';
   finally
   end;
   TBPlugin.Visible := StdPluginVisible ;
   TBPlugin.caption := ReadT3IniFile('DEFPLUGIN','CAPTION','Plugin') ;
   TBPlugin.Tag := ord(TBPlugin.Visible) ;

     for i := 0 to fmMain.ScreenTipsManager1.ScreenTips.Count -1 do
       begin
         if (fmMain.ScreenTipsManager1.ScreenTips[i].Action is TAction )then
          begin
              fmMain.ScreenTipsManager1.ScreenTips[i].Description.Text :='';
              fmMain.ScreenTipsManager1.ScreenTips[i].Header :=
               TAction(fmMain.ScreenTipsManager1.ScreenTips[i].Action).Caption ;
              fmMain.ScreenTipsManager1.ScreenTips[i].DisabledHeader :=
               TAction(fmMain.ScreenTipsManager1.ScreenTips[i].Action).Caption ;
          end;

       end ;

end;

procedure TfmMain.LoadPluginsEXE;
Var
  ItemCaption,
  PlugIns_Path :String;
  PlugInsItem,PlugInsItem2  :TActionClientITem;
  NewMenuItem  :TAction;
  F            :TSearchRec;
  Bool,i  : Integer ;
begin
  try
  PlugIns_Path:=ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim ;
  Bool := FindFirst(PlugIns_Path+'*.exe',faAnyFile,F);
  if Bool=0 then
  begin
    PlugInsItem2:= nil ;
   for i := 0 to PluginClientItem.Items.Count -1 do
     if PluginClientItem.Items[i].Tag = 10 then
        PlugInsItem2:=  PluginClientItem.Items[i] ;
    if PlugInsItem2 = nil then
       begin
        // 2. Add PlugIns Item
        PlugInsItem2:=PluginClientItem.Items.Add ;
        PlugInsItem2.tag := 10 ;
        PlugInsItem2.Caption:= DMTCCoreLink.GetTextLang(1805);
        PlugInsItem2.ImageIndex :=  34 ;
       end;
    PlugInsItem:= nil ;
   for i := 0 to PluginClientItem.Items.Count -1 do
     if PluginClientItem.Items[i].Tag = 11 then
        PlugInsItem:=  PluginClientItem.Items[i] ;
    if PlugInsITem = nil then
       begin
        // 2. Add PlugIns Item
        PlugInsItem:=PluginClientItem.Items.Add ;
        PlugInsItem.Caption:= DMTCCoreLink.GetTextLang(1905);
        PlugInsItem.tag := 11 ;
       end;

  While Bool = 0 do
  begin
    if AllowedPluginList.Values[F.Name] = 'True' then
    begin
    ItemCaption:=ChangeFileExt(F.Name,'');
    NewMenuItem:=TAction.Create(self);
    NewMenuItem.OnExecute:=RunPlugInsEXEProgram;
    // done : Pieter this allows spacing in the pluginname
    // done : Pieter lets not give them names and stop worry about the naming.
    // NewMenuItem.Name:= 'DLL'+StringReplace(ItemCaption,' ','_',[rfReplaceAll]);
    NewMenuItem.Caption:=ItemCaption;
     NewMenuItem.ActionList := ActionManager1 ;
    PlugInsItem.items.Add.Action := NewMenuItem;
    end;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
     FindClose(f);
  end;
   except
      // dont do annything on except
   end;
end;


Function TfmMain.DllHasFunction(Aname : String ) : Boolean ;
 var
 Ins: HINST;
 DllName : String ;
 a4MenuPlugin : TOSFMenuPlugin ;
 APosPlugin : TOSFPosPlugin ;
 aControlerPlugin : TOSFLoginControlerPlugin ;
 APinPlugin : TOSFPinPlugin ;
begin
 result := false ;
 if UpperCase(Aname) <> UpperCase('DYNADBREG.' + PluginsDLLName)   then
 if AllowedPluginList.Values[AName] <> 'True' then exit ;
 DllName :=ExtractFileDir(Application.ExeName) + '\plug_ins\'+Aname;
 Ins := 0 ;
 try
 if LoadedPluginList.IndexOf(DllName) = -1 then
   begin
    Ins := LoadLibrary(PChar(DllName));
    LoadedPluginList.AddObject(DllName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]);
   end;
 except
 end;
 if Ins = 0 then
  begin
    ErrorlistString := ErrorlistString + 'Error loading DLL from ' + DllName +#13 +  #10 ;
   Exit ;
  end;

  try
   @a4MenuPlugin := GetProcAddress(Ins, TCPLUGINSRoutineName);
   result := @a4MenuPlugin <> nil ;
   @aControlerPlugin := GetProcAddress(Ins, OSFCONTROLERLOGINRoutineName);

   if (@aControlerPlugin <> nil)  then
     @ExternalLoginControlerPlugin := @aControlerPlugin ;

   @APosPlugin := GetProcAddress(Ins, OSFPOSDISPLAYRoutineName);
   if (@APosPlugin <> nil)  then
     @ExternalPolePlugin := @APosPlugin ;

   @APinPlugin := GetProcAddress(Ins, OSFPINRoutineName);
   if @APinPlugin <> nil then
     @AExternalPinPlugin := @APinPlugin ;
   @APinPlugin := GetProcAddress(Ins, OSFPOSPOINTSPLUGIN);
   if @APinPlugin <> nil then
     @AExternalPOSPointsPlugin := @APinPlugin ;

   @AEditAddItemToDocPlugin.aOSFGetPluginInfo := GetProcAddress(Ins, OSFGetPluginInfoName);
   AEditAddItemToDocPlugin.aInst := ins ;
   if uppercase(ExtractFileName(DllName)) = 'WOODSALES.OF4' then
   begin
   @AEditAddItemToDocPlugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToDocRoutineName);
   if @AEditAddItemToDocPlugin.aLoadFormPlugin <> nil then
    begin
        @AExternalEditAddItemToDocPlugin.aLoadFormPlugin := @AEditAddItemToDocPlugin.aLoadFormPlugin ;
        @AExternalEditAddItemToDocPlugin.aMessageFormPlugin := GetProcAddress(Ins, OSFMESSAGEFORMRoutineName);
        @AExternalEditAddItemToDocPlugin.aUnLoadFormPlugin := GetProcAddress(Ins, OSFUNLOADFORMRoutineName);
        @AExternalEditAddItemToDocPlugin.aMessageGetDisplayText := GetProcAddress(Ins, OSFDISPLAYTEXTRoutineName);
    end;
   end;
  except
   result := false ;
  end;
// finally { wrap up }
  if not result then
    begin
      LoadedPluginList.Delete(LoadedPluginList.IndexOf(DllName));
      FreeLibrary(Ins);
    end;
//   FreeLibrary(Ins);
// end; { try/finally }
end;



procedure TfmMain.LoadPluginsDLL;



Var
  ItemCaption,
  PlugIns_Path :String;
  PlugInsItem,PlugInsItem2,FoundParent,PlugInsItemParent :TActionClientItem;
  NewMenuItem  :TAction;
  F            :TSearchRec;
  Bool  : Integer ;
  AddPluginList : TStringlist ;
  AddNamesList : TStringlist ;
  i ,x,y,GroupTrn,PluginTrn : Integer ;
  ReturnString : Array [0..1025] of char ;
  APChar : PChar ;
begin
  ErrorlistString := '' ;
  FillChar(ReturnString,SizeOF(ReturnString),#0);
  PlugInsItem := nil ;
  AddPluginList := TStringlist.create ;
  AddNamesList := TStringlist.create ;
  try
  try
  PlugIns_Path:=ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim;
  Bool := FindFirst(PlugIns_Path+'*.' + PluginsDLLName,faAnyFile,F);
  if Bool=0 then
  begin
    // Add PlugIns Menu
    // 1. Add Separator
    // 2. Add PlugIns Item
      PlugInsItem2:= nil ;
   for i := 0 to PluginClientItem.Items.Count -1 do
     if PluginClientItem.Items[i].Tag = 10 then
        PlugInsItem2:=  PluginClientItem.Items[i] ;
    if PlugInsItem2 = nil then
       begin
        // 2. Add PlugIns Item
        PlugInsItem2:=PluginClientItem.Items.Add ;
        PlugInsItem2.tag := 10 ;
        PlugInsItem2.Caption:= DMTCCoreLink.GetTextLang(1805);
        PlugInsItem2.ImageIndex :=  34 ;
       end;
    PlugInsItem:= nil ;
   for i := 0 to PluginClientItem.Items.Count -1 do
     if PluginClientItem.Items[i].Tag = 11 then
        PlugInsItem:=  PluginClientItem.Items[i] ;

    if PlugInsITem = nil then
       begin
        // 2. Add PlugIns Item
        PlugInsItem:=PluginClientItem.Items.Add ;
        PlugInsItem.Caption:= DMTCCoreLink.GetTextLang(1905);
        PlugInsItem.tag := 11 ;
       end;

  While Bool = 0 do
  begin
    ItemCaption:=ChangeFileExt(F.Name,'');

    GroupTrn := 3205 ;
    if  DllHasFunction(F.Name) then
    begin
    if Assigned(AEditAddItemToDocPlugin.aOSFGetPluginInfo) then
      begin
         APChar := ReturnString ;
         AEditAddItemToDocPlugin.aOSFGetPluginInfo(PluginTrn,GroupTrn,APChar);
         AEditAddItemToDocPlugin.aGuid := copy(Trim(ReturnString),1,50);
         if PluginTrn <> 0 then
         ItemCaption := DMTCCoreLink.GetTextLangNoAmp(PluginTrn) ;
      end;
      ItemCaption := DMTCCoreLink.GetTextLangNoAmp(GroupTrn) + '\' + ItemCaption ;
      AddPluginList.AddObject(ItemCaption,TObject(AEditAddItemToDocPlugin.aInst))
    end ;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
     FindClose(f);
  end;
  AddPluginList.CustomSort(StringListCompareStrings) ;
  for i := 0 to AddPluginList.Count -1 do
     begin
           AddNamesList.Text := StringReplace(AddPluginList[i],'\',#13+#10,[rfReplaceAll]);
            PlugInsItemParent := PlugInsItem2 ;
           for x := 0 to AddNamesList.Count -1 do
           begin
             FoundParent := nil ;
            for y := 0 to PlugInsItemParent.Items.Count -1 do
               if StringReplace(PlugInsItemParent.Items[y].Caption,'&','',[]) = AddNamesList[x] then
                 FoundParent := PlugInsItemParent.Items[y] ;
            if FoundParent<> nil then
            PlugInsItemParent := FoundParent
            else
            begin
               FoundParent := PlugInsItemParent.Items.Add ;
               FoundParent.Caption := AddNamesList[x] ;
               PlugInsItemParent := FoundParent ;
            end;

            if x  =  AddNamesList.Count -1 then
              begin
              NewMenuItem := nil;
              for y := 0 to ActionManager1.ActionCount-1 do
                if ActionManager1.Actions[y].Tag =  Integer(AddPluginList.Objects[i]) then
                   NewMenuItem := TAction(ActionManager1.Actions[y]) ;

              if NewMenuItem = nil then
                 begin
                  NewMenuItem:=TAction.Create(self);
                  NewMenuItem.ActionList := ActionManager1 ;
                 end;
                  NewMenuItem.Caption:=AddNamesList[x];

                  NewMenuItem.Name := ChangeFileExt(ExtractFileName(GetModuleName(Integer(AddPluginList.Objects[i]))),'') ;
                  PlugInsItemParent.Action := NewMenuItem ;
                  NewMenuItem.tag :=  Integer(AddPluginList.Objects[i]) ;
                  NewMenuItem.OnExecute:=RunPlugInsDLLProgram;
              end;
           end;
     end;

   except
      // dont do annything on except
   end;
   
   finally
     AddPluginList.free ;
     AddNamesList.free ;
   end;
end;
procedure TfmMain.RunPlugInsDLLProgram(Sender: TObject);
Var
  MyAppName:String;
Begin
  // done : Pieter fix names with spaces

  MyAppName :=  ExtractFileName(GetModuleName((Sender as TAction).Tag)) ;
  // MyAppName := StringReplace(MyAppName,'&','',[rfReplaceAll]);
  OSFPLUGINRunPlugInsDLLProgram('plug_ins\'+MyAppName,'') ;
end;

procedure TfmMain.RunPlugInsEXEProgram(Sender: TObject);
Var
  MyAppName,MyAppParams:String;
Begin
  // done : Pieter fix names with spaces
  MyAppName := (Sender as TAction).Caption+'.exe'  ;
  MyAppName := ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + StringReplace(MyAppName,'&','',[rfReplaceAll]);
  MyAppParams := dmDatabase.ZMainconnection.Username +  '  '  + dmDatabase.ZMainconnection.Password +' "'+dmDatabase.ZMainconnection.Database+'" ' + dmDatabase.ZMainconnection.Server ;
  ShellExecute(self.Handle, nil,  pchar(MyAppName),
    pchar(MyAppParams), nil, SW_SHOWNORMAL);
end;



procedure TfmMain.ShowDocumentFromPlugin(Sender: TObject);
begin
 if FPluginIteractClass.PreviewDocId <> 0 then
    begin
    if (FPluginIteractClass.previewStyle = tcptScreen) or (FPluginIteractClass.previewFilename = '') then
       PreviewDocument(0,FPluginIteractClass.PreviewDocId)
       else
       begin
         PreviewDocument(2,FPluginIteractClass.PreviewDocId,FPluginIteractClass.previewFilename);
       end;
    end;
end;



procedure TfmMain.Reversebatch1Click(Sender: TObject);
var
  FormReverseBatch: TFormReverseBatch;
begin
   Closeopensforms1Click(self);
   FormReverseBatch:= TFormReverseBatch.Create(self);
    try
       FormReverseBatch.ShowModal ;
       dmDatabase.ZMainconnection.Disconnect ;
       dmDatabase.ZMainconnection.Connect ;
    finally
       FormReverseBatch.free ;
    end;
end;

procedure TfmMain.mainRibbonHelpButtonClick(Sender: TObject);
begin
  HtmlShowTopic(100);
end;

procedure TfmMain.mainRibbonTabChange(Sender: TObject; const NewIndex,
  OldIndex: Integer; var AllowChange: Boolean);
begin
  if not DMTCCoreLink.TheZConnection.Connected then
    AllowChange := False
    else
   if newindex = rgStart.Index then
     begin

       PCMain.ActivePageIndex := 0 ;
       PCMainChange(self);
     end  else
     if mainRibbon.Tabs.Items[NewIndex].Page.Tag = 99 then
          AllowChange := False ;
end;

procedure TfmMain.Windows20041Click(Sender: TObject);
begin
 SetColour(46);
end;

procedure TfmMain.TBPluginClick(Sender: TObject);
var
 MyAppName,MyAppParams : String ;
 Cord : TRect ;
 oldAlign : TAlign ;
begin
 MyAppName :=  IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\' +(ReadT3IniFile('DEFPLUGIN','PATH',''));
 if uppercase(ExtractFileExt(MyAppName)) = '.XPT' then MyAppName := ChangeFileExt(MyAppName,'.OSF');
 if uppercase(ExtractFileExt(MyAppName)) = '.OSF' then MyAppName := ChangeFileExt(MyAppName,'.' + PluginsDLLName);

 if not FileExists(MyAppName) then
   MyAppName := IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\ECommerce.' + PluginsDLLName ;


 TBPlugin.Visible := fileExists(MyAppName) ;
 if TBPlugin.Visible  then
  begin
      // else it will show in the new reshow all itme this is couse they can be hiden now.
      TBPlugin.Tag := 0 ;
      // done : Pieter fix names with spaces
     //  MyAppName := 'plug_ins\' + ReadT3IniFile('DEFPLUGIN','PATH','') ;
   if UpperCase(ExtractFileExt(MyAppName)) = '.EXE' then
    begin
      // MyAppName := IncludeTrailingPathDelimiter(ApplicationPath) + MyAppName ;
       MyAppParams := dmDatabase.ZMainconnection.Username +  '  '  + dmDatabase.ZMainconnection.Password +' "'+dmDatabase.ZMainconnection.Database+'" ' + dmDatabase.ZMainconnection.Server ;
      ShellExecute(self.Handle, nil,  pchar(MyAppName),
       pchar(MyAppParams), nil, SW_SHOWNORMAL);
    end else
  begin
//  fmMain.Hide ;
  OSFPLUGINRunPlugInsDLLProgram('plug_ins\' + ExtractFileName(MyAppName),'');
//  fmMain.show ;
  Application.BringToFront ;
  end;

  end;
end;

procedure TfmMain.MergeIniFile;
Var
  aTurboiniFile:TIniFile;
  AHeaderList : TStringList ;
  AValueList : TStringList ;
  i , x : Integer ;
begin
  // done : Allow merging of the ini so the update etc dont desturb the old file.
  if FileExists(ExtractFilePath(Application.ExeName)+'TCashmerge.ini') then
  begin
  aTurboiniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'TCashmerge.ini');
  AHeaderList := TStringList.create ;
  AValueList := TStringList.create ;
  try
   aTurboiniFile.ReadSections(AHeaderList);
      for i := 0 to AHeaderList.count -1 do
        begin
          aTurboiniFile.ReadSectionValues(AHeaderList[i],AValueList);
          for x := 0 to  AValueList.count-1 do
            begin
              WriteT3IniFile(AHeaderList[i],AValueList.Names[x],AValueList.Values[AValueList.Names[x]]);
            end;
        end;

  finally
    aTurboiniFile.Free;
    AHeaderList.Free;
    AValueList.Free;
  end;
   DeleteFile(ExtractFilePath(Application.ExeName)+'TCashmerge.ini') ;
  end;
end;

procedure TfmMain.Forum1Click(Sender: TObject);
var
 AString : String ;
begin
  if not IsRegistered then
    begin
      OSFMessageDlg(DMTCCoreLink.GetTextLang( 3422),mtInformation,[mbok],0);
    end;
   AString := DMTCCoreLink.GetTextLang(3114) ;
    ShellExecute(Handle, 'open', {'http://www.osfinancials.org/component/option,com_fireboard/index.php?option=com_fireboard'} pchar(AString) , nil, nil, SW_SHOW);
end;

procedure TfmMain.InputCalendarClick(Sender: TObject);
begin
PCMain.ActivePageIndex := 4 ;
PCMainChange(self);
end;

procedure TfmMain.MainStatusBarDblClick(Sender: TObject);
 var
  i : Integer ;
  alist : String ;
begin
if ErrorlistString <> '' then
 OSFMessageDlg(ErrorlistString,mtConfirmation,[mbyes],0) else
   begin
   alist := '' ;
     for i := 0 to  ActionManager1.ActionCount -1 do
         BEGIN
           if alist <> ''  then
                     alist := alist + #13+#10 ;

             alist := alist + TAction(ActionManager1.Actions[i]).Caption + ' ' + IntToStr(TAction(ActionManager1.Actions[i]).ImageIndex) ;


         END;
      OSFMessageDlg(alist,mtConfirmation,[mbyes],0,true)
   end;
end;

function TfmMain.GetPathFromMenuItem(AMenuitem: TMenuItem;StopItem : TMenuItem): String;
begin
 result := '' ;
 IF  StopItem <> nil then
   if  AMenuitem = StopItem then exit ;

if (AMenuitem.Parent <> nil) then
 begin
 result := StringReplace(UpperCase(AMenuitem.Name),'&','',[rfreplaceAll]);
 result :=  GetPathFromMenuItem(AMenuitem.Parent,StopItem) + PathDelim + result ;
 end;
end;

procedure TfmMain.BuildUserReportmenu ;
begin
   if rbReports.Items[0].Items.Count =2 then
    begin
     BuildUserReportmenuItemsActions(1,rbReports.Items[1],DMTCCoreLink.GetLocalPluginDir + 'reports' + PathDelim + 'userreports'  + PathDelim );
     BuildUserReportmenuItemsActions(0,rbReports.Items[0],IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'plug_ins' + PathDelim + 'reports' + PathDelim + 'Newreports'  + PathDelim);
    end;
end;

procedure TfmMain.BuildUserReportmenuItemsActions(Atype : Integer ;AMenuItem : TActionClientItem ;ADir : String ) ;
var
  ASearchRec : TSearchRec ;
  ANewItem : TActionClientItem ;
  aNewAction : TAction ;
  AList : TStringList ;
  i : Integer ;
  Aicon : TIcon ;
  aCategory : String ;
begin

if not DMTCCoreLink.TheZConnection.Connected then exit ;

  AList := TStringList.create ;
  try
    if FindFirst(IncludeTrailingPathDelimiter(ADir)+'*.*', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
             if (ASearchRec.Name <> '.') and (ASearchRec.Name <> '..') then
             begin
              if (uppercase(ExtractFileExt(ASearchRec.Name)) = '.REP') or (sysutils.DirectoryExists(IncludeTrailingPathDelimiter(ADir)+ ASearchRec.Name )) then
                 AList.add(ASearchRec.Name);
             end;
      until FindNext(ASearchRec) <> 0;
      FindClose(ASearchRec);
    end;

   AList.CustomSort(StringListCompareStrings);
   for  i:= 0 to  AList.count -1 do
     begin
        if (uppercase(ExtractFileExt(AList[i]))<>'.REP') and ((uppercase(ExtractFileExt(AList[i]))<>'.DFM')) and ((uppercase(ExtractFileExt(AList[i]))<>'.ICO')) then
         begin
               ANewItem :=  AMenuItem.Items.Add ;

               if copy(AList[i],1,4) = 'TRN_' then
                 begin
                 ANewItem.tag := StrToIntDef(copy( AList[i],5,255),0);
                 if FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'bin\themes\classic\' + AList[i] +'.ico' ) then
                    begin
                        LoadT3Glyph(ilbandsmall,-1,AList[i] +'.ico',ilbandsmall.Width);
                        LoadT3Glyph(ilbandlarge,-1,AList[i] +'.ico',ilbandlarge.Width);
                        ANewItem.ImageIndex :=  ilbandsmall.Count -1 ;
                    end;
                 ANewItem.Caption := DMTCCoreLink.GetTextLangNoAmp(ANewItem.tag);

                end else
               ANewItem.Caption := AList[i] ;

                if ANewItem.ImageIndex = -1 then
                if FileExists(ADir +  AList[i]   +'\custom.ico' ) then
                    begin
                       Aicon := TIcon.Create ;
                       try
                       Aicon.Width := ilbandlarge.Width ;
                       Aicon.Height := ilbandlarge.Height ;
                       Aicon.LoadFromFile(ADir +  AList[i]  +'\custom.ico' );
                          try

                           ilbandlarge.AddIcon(Aicon);
                          except
                          end;
                       Aicon.free ;
                       Aicon := TIcon.Create ;
                       Aicon.Width := ilbandsmall.Width ;
                       Aicon.Height := ilbandsmall.Height ;
                       Aicon.LoadFromFile(ADir +  AList[i]  +'\custom.ico' );
                          try
                           ilbandsmall.AddIcon(Aicon);
                          except
                          end;
                       finally
                       Aicon.Free ;
                       end;
                       ANewItem.ImageIndex := ilbandlarge.Count -1 ;
                    end;

               BuildUserReportmenuItemsActions(Atype,ANewItem,IncludeTrailingPathDelimiter(ADir+AList[i])) ;

          end else
        if (uppercase(ExtractFileExt(AList[i]))='.REP')then
        begin
              if (AMenuItem.Items.Count = 0) and (AMenuItem.Action = nil) then
              begin
               aNewAction := TAction.Create(self);

               aNewAction.ActionList := ActionManager1 ;
               aNewAction.ImageIndex := AMenuItem.ImageIndex ;
               aNewAction.Tag := Integer(AMenuItem) ;
               aNewAction.Caption := AMenuItem.Caption ;

               aNewAction.name := 'DYNAACT' + IntToStr( ActionManager1.ActionCount -1) ;
               AMenuItem.Action := aNewAction;
               if Atype = 0 then
                begin
                  aNewAction.OnExecute := HandelUserReportBand ;
                  aNewAction.Category  := GetGroupnameFromMenuItemRepman(AMenuItem.ParentItem as TActionClientItem,rbReports.Items[0]) ;
                end else
                begin
                   aNewAction.OnExecute := HandelUserReportBandCust ;
                   aNewAction.Category  := GetGroupnameFromMenuItemRepman(AMenuItem.ParentItem as TActionClientItem,rbReports.Items[1]) ;
                end;
              end ;
        end;
     end;

   finally
     AList.free ;

   end;
end;


procedure TfmMain.HandelUserReport(Sender: TObject);
begin

end;

procedure TfmMain.HandelUserReportBand(Sender: TObject);
begin
 if (TObject(Taction(Sender ).tag) is TActionClientItem) then
  OSFPLUGINFindAlternateReport(GetPathFromMenuItemRepmanBand((TObject(Taction(Sender ).tag)   as TActionClientItem),rbReports.Items[0]),true,true,currentLanguage,false)  ;
end;
procedure TfmMain.HandelUserReportBandCust(Sender: TObject);

begin

 if (TObject(Taction(Sender ).tag) is TActionClientItem) then
  OSFPLUGINFindAlternateReport(GetPathFromMenuItemRepmanBand((TObject(Taction(Sender ).tag)   as TActionClientItem),rbReports.Items[1]),true,true,currentLanguage,false)  ;
end;



function TfmMain.GetKDEThemeIndex: Integer;
var i : Integer ;
begin
 result := 0 ;
 for i := 0 to ThemeClientITem.items.count -1 do
   begin
     If  uppercase(StringReplace(ThemeClientITem.items[i].Caption,'&','',[rfReplaceAll])) = 'CLASSIC' then
       begin
          result:=Str2Int(Copy(ThemeClientITem.items[i].Action.Name,10,2));
          exit ;
       end;
   end;
end;

procedure TfmMain.Bugreportsourceforge1Click(Sender: TObject);
var
 AString : String ;
begin
   AString := DMTCCoreLink.GetTextLang(3113) ;

    ShellExecute(Handle, 'open', { 'http://sourceforge.net/tracker/?group_id=169037'} pchar(AString) , nil, nil, SW_SHOW);
end;

procedure TfmMain.LoadExtraLargeIcons;
var
 AExtraMenu : TStringList ;
 i ,x: Integer ;
 TheImageIndex,TheComponent : String ;
 aToolButton : TActionClientItem ;
 AMenuItem : TAction  ;
begin
 i := 0 ;
 x := 0 ;
 for i := 0 to fmMain.ActionManager1.ActionCount -1 do
     if fmMain.ActionManager1.Actions[i].Tag = 0 then
    TAction(fmMain.ActionManager1.Actions[i]).Visible := true;
 if  FileExists(DMTCCoreLink.GetLocalSaveDir + 'icons.ini') then
    begin
      AExtraMenu := TStringList.Create ;
        try
          AExtraMenu.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'icons.ini');
          i := 0 ;
          while i < AExtraMenu.Count -1 do
             begin
               if (UpperCase(AExtraMenu.Names[i+1]) = 'IMAGEINDEX') and
                   (UpperCase(AExtraMenu.Names[i]) = 'COMPONENT') then
                   begin
                      TheImageIndex  :=  AExtraMenu.ValueFromIndex[i+1] ;
                      TheComponent  :=  AExtraMenu.ValueFromIndex[i] ;
                      inc(i,2);
                      // making of the item
                      if fmMain.FindComponent(TheComponent) is TAction then
                        begin
                           AMenuItem := fmMain.FindComponent(TheComponent) as TAction  ;
                           aToolButton :=  rbEdit.Items.Add ;
                           aToolButton.Action :=   AMenuItem ;
                           aToolButton.CommandStyle := csButton ;
                           TButtonProperties(aToolButton.CommandProperties).ButtonSize := bsLarge ;
                           inc(x);
                        end;
                   end else
                   inc(i);
             end;
        finally
           AExtraMenu.free ;
        end;
    end;
end;

procedure TfmMain.Copyfromasetofbooks1Click(Sender: TObject);
Var
 ToBooks,FromBooks : String ;
 i : integer ;
  UsersInDatabase : Integer ;
  UserMessage : String ;
begin
UserMessage := TDatabaseTableRoutines.GetUsersInDatabase(UsersInDatabase);
if UsersInDatabase <> 0 then
  raise Exception.Create(UserMessage) ;

if OSFMessageDlg(GetTextLang(519){'This will seriously effect your set of books , are you sure you want to clear this set of books ?'}, mtconfirmation, [mbyes, mbno,mbHelp], 237) = mryes Then
 begin
  Closeopensforms1Click(self);
  ToBooks := dmDatabase.ZMainconnection.Database ;
  fmOpenASetOfBooks := TfmOpenASetOfBooks.Create(self);
  try
  fmOpenASetOfBooks.JustPick := true ;
  fmOpenASetOfBooks.BtnOpen.ModalResult := mrok ;
  SetUpForm(fmOpenASetOfBooks);
  if fmOpenASetOfBooks.ShowModal = mrok then
     begin
       for i := 0 to TheGlobalDataObject.Books.Count -1 do
          begin
              if TheGlobalDataObject.Books.Selected[i] then
                 FromBooks := TheGlobalDataObject.Books[i].Database ;
          end;
       CloseSetOfBooks ;
       CopyExistingBooks(ExtractFilePath( FromBooks),ExtractFilePath(ToBooks),'',true);
       TheGlobalDataObject.Books.setActiveByPath(ToBooks);
       if TheGlobalDataObject.Books.ActiveBooks <> nil then
        OpenBooks(false);
        // doOpenSetofBooks(TheGlobalDataObject.Books.ActiveBooks);
     end;   
  finally
  FreeAndNil(fmOpenASetOfBooks);
  end;
  end;
end;

procedure TfmMain.TOpenBooksTimer(Sender: TObject);
Var
 Temp:String;

begin
 TOpenBooks.Enabled := false ;
 try
 if ErrorlistString <> '' then
    begin
       OSFMessageDlg(ErrorlistString,mtError,[mbyes],0);
       ErrorlistString := '' ;
    end;

  MainColor := StrToInt(ReadT3IniFile('INTRO','MainColor',IntToStr(MainColor))) ;
  if MainColor = 0 then
     MainColor := fmMain.Color ;
{  MainPanelColor  := StrToInt(ReadT3IniFile('INTRO','MainPanelColor',IntToStr(MainPanelColor))) ;
  fmMain.Color := MainColor;
  fmMain.ControlPanel.Color := MainPanelColor;
  fmMain.ControlBar.Color:= MainPanelColor;
  fmMain.ControlPanel.Color:=fmMain.ControlPanel.Color;
  fmMain.TopPnlBar.Color:=fmMain.ControlPanel.Color;
  MainPanelColor:= fmMain.ControlPanel.Color; }
  //fmMain.RePaint;

  UpBatches:=False;
  WinFormID := '';
  if FirstRun then
    begin
     Temp:=UpperCase(TDMTCCoreLink.GetLocalBaseDir);
     deleteFile(TDMTCCoreLink.GetLocalBaseDir+'1.TXT');
   end;
{ if not (UpperCase(ReadT3IniFile('Appconfig','maximizewindowstate','True')) ='FALSE') then
 Self.windowstate := wsMaximized else
 begin
    self.top := 0 ;
    self.Left := 0 ;
 end;}

 Application.ProcessMessages ;

If notShowIntro=False then
  begin
   // ExecAutoRun;
    if not dmDatabase.ZMainconnection.Connected then
     begin
       FileOpen2Click(nil);
       if CurrentUser = -1 then
         begin
         dmDatabase.ZMainconnection.Connected := false ;
         CloseSetOfBooks ;
         end;

       if not dmDatabase.ZMainconnection.Connected then
       begin
       if Uppercase(ReadT3IniFile('LASTOPEN','MUSTLOGIN','False')) = 'TRUE' then
         begin
           repeat
            if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(1956)+#13 + #10 + DMTCCoreLink.GetTextLangNoAmp(642),mtConfirmation,[mbyes,mbno],0) = mrno then
              begin
               Application.Terminate ;
               exit ;
              end;
           FileOpen2Click(self);
           until dmDatabase.ZMainconnection.Connected ;
         end ;
       end;  
     end;
  end;


if dmDatabase.ZMainconnection.Connected  then
begin


if  ReadReportOp('CBShowCalendar',false).AsBoolean then
   begin

     InputCalendarClick(self);
     if PCMain.ActivePage = TSStart then
        PCMain.ActivePage := nil ;


     PCMain.ActivePage :=  TSStart ;
     PCMainChange(self);
     Application.ProcessMessages ;
   end else
  begin
  If notShowIntro=False then
  begin
    notShowIntro:=True;

    PCMain.ActivePage :=  TSStart ;
    PCMainChange(self);
    Application.ProcessMessages ;
  end;
  end;  


 //   NVBMain.ActiveFolder := 0 ;
  // PCMain.ActivePage := TSStart ;
end;
 finally
   mainRibbon.Enabled := True ;

 end;
end;

procedure TfmMain.WebshopClick(Sender: TObject);
var
 AString : String ;
begin
   AString := DMTCCoreLink.GetTextLang(3115) ;
   ShellExecute(Handle, 'open', pchar(AString), nil, nil, SW_SHOW);

end;

procedure TfmMain.PCMainChange(Sender: TObject);
var
 aFrmWelcome : TFrmWelcome ;
begin
   if PCMain.ActivePage = TSStart then
   begin
   aFileOpen.Checked := True ;
    if fmMain.FindComponent('FrmWelcome') <> nil then
      begin

         aFrmWelcome :=   TFrmWelcome(fmMain.FindComponent('FrmWelcome'));
         // aFrmWelcome.parent := nil ;
         // aFrmWelcome.parent := TSStart ;
         if not aFrmWelcome.Showing then
         aFrmWelcome.show ;

       end  else
       begin
          // imgBack.Visible := false ;
          aFrmWelcome := TFrmWelcome.create(self);
          try
          TSStart.Tag := Integer(aFrmWelcome);
          SetUpForm(aFrmWelcome);
          aFrmWelcome.Parent:=TSStart;
          aFrmWelcome.Align := alClient;
          aFrmWelcome.Show;
          aFrmWelcome.GetUrlTimer.Enabled := True ;
          except
           TSStart.Tag := 0 ;
           FreeAndNil(aFrmWelcome);
         end;
       end;
   end else
   if PCMain.ActivePage = TSDebtors then
   begin
   EditAccountsDebtor.Checked := True ;

   if PCMain.ActivePage.Tag = 0 then
    begin
      PCMain.ActivePage.Tag := Integer(TfmDebtor.Create(Application));
      TfmDebtor(PCMain.ActivePage.Tag ).UseCreditor:=False;
      TfmDebtor(PCMain.ActivePage.Tag ).Parent := PCMain.ActivePage ;
      TfmDebtor(PCMain.ActivePage.Tag ).BorderStyle := bsnone ;
      TfmDebtor(PCMain.ActivePage.Tag ).Top := 0 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Left := 0 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
      TfmDebtor(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Show  ;
      TfmDebtor(PCMain.ActivePage.Tag ).BtnCancel.Visible := false ;
      SkinForm(TForm(PCMain.ActivePage.Tag ));
    end  else
    if TfmDebtor(PCMain.ActivePage.Tag ).Notebook1.PageIndex <> 0 then
    begin
    TfmDebtor(PCMain.ActivePage.Tag ).Visible := true ;
    TfmDebtor(PCMain.ActivePage.Tag ).BFilterClick(self);
    end;
  end;
 if PCMain.ActivePage = TSCreditors then
  begin
  EditAccountsCreditor.Checked := True ;
   if PCMain.ActivePage.Tag = 0 then
    begin
      PCMain.ActivePage.Tag := Integer(TfmDebtor.Create(PCMain.ActivePage));
      TfmDebtor(PCMain.ActivePage.Tag ).UseCreditor:=True;
      TfmDebtor(PCMain.ActivePage.Tag ).Parent := PCMain.ActivePage ;
      TfmDebtor(PCMain.ActivePage.Tag ).BorderStyle := bsnone ;
      TfmDebtor(PCMain.ActivePage.Tag ).Top := 0 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Left := 0 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
      TfmDebtor(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
      TfmDebtor(PCMain.ActivePage.Tag ).Show ;


     // TfmDebtor(PCMain.ActivePage.Tag ).Align := alClient  ;
      TfmDebtor(PCMain.ActivePage.Tag ).BtnCancel.Visible := false ;
      AddFormToSkin(TForm(PCMain.ActivePage.Tag ),self);
    end else
    begin
    if TfmDebtor(PCMain.ActivePage.Tag ).Notebook1.PageIndex <> 0 then
    TfmDebtor(PCMain.ActivePage.Tag ).BFilterClick(self);
    end;
  end;
 if PCMain.ActivePage = TSStock then
  begin
   EditStockItems.Checked := True ;
   if PCMain.ActivePage.Tag = 0 then
    begin
      PCMain.ActivePage.Tag := Integer(TfmStockEntry.Create(PCMain.ActivePage));
      TfmStockEntry(TSStock.Tag ).Parent := PCMain.ActivePage ;
      TfmStockEntry(TSStock.Tag ).BorderStyle := bsnone ;
      TfmStockEntry(TSStock.Tag ).Show ;
      TfmStockEntry(PCMain.ActivePage.Tag ).Top := 0 ;
      TfmStockEntry(PCMain.ActivePage.Tag ).Left := 0 ;
      TfmStockEntry(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
      TfmStockEntry(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
      SkinForm(TForm(TSStock.Tag ));
    end else
    begin
       TfmStockEntry(PCMain.ActivePage.Tag ).RefreshData ;
    //   TfmStockEntry(PCMain.ActivePage.Tag ).Visible := true ;
    //   TfmStockEntry(PCMain.ActivePage.Tag ).Align := alClient ;
    end;
  end;
 if PCMain.ActivePage = TSCalender then
  begin
    InputCalendar.Checked := True ;
      if TSCalender.tag = 0 then
        begin
        if dmDatabase.ZMainconnection.Connected then
         begin
           TSCalender.Tag := Integer(TPlanerMainForm.Create(self)) ;
           with TPlanerMainForm(TSCalender.Tag) do
            begin
               LoadT3Glyph(TPlanerMainForm(TSCalender.Tag).ImageList1,5,'Form.ico',ImageList1.Height);
               LoadT3Glyph(TPlanerMainForm(TSCalender.Tag).ImageList1,3,'Agenda.ico',ImageList1.Height);
               LoadT3Glyph(TPlanerMainForm(TSCalender.Tag).ImageList1,0,'Contacts.ico',ImageList1.Height);
               LoadT3Glyph(TPlanerMainForm(TSCalender.Tag).ImageList1,1,'Screenlist.ico',ImageList1.Height);
               parent := TSCalender ;
               BorderStyle := bsNone ;
               show ;
               //Align := alclient;
               //Align := alnone;
            end;
           AddFormToSkin(TForm(PCMain.ActivePage.Tag ),self);
           TPlanerMainForm(PCMain.ActivePage.Tag ).Top := 0 ;
           TPlanerMainForm(PCMain.ActivePage.Tag ).Left := 0 ;
           TPlanerMainForm(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
           TPlanerMainForm(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
          end;
       end else
       begin
          TPlanerMainForm(TSCalender.Tag).VpFlexDataStore1.RefreshEvents ;
          TPlanerMainForm(TSCalender.Tag).VpFlexDataStore1.RefreshTasks ;
       end;
    end;

 if PCMain.ActivePage = tsDocuments then
  begin
   ADocuments.Checked := True ;
   if PCMain.ActivePage.Tag = 0 then
    begin
      PCMain.ActivePage.Tag := Integer(TfmInvoiceEntryGrid.Create(PCMain.ActivePage));
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Parent := PCMain.ActivePage ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).BorderStyle := bsnone ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Show ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Top := 0 ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Left := 0 ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
   //   TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Align := alClient  ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).BitBtnCancel.Visible := false ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).BtnClose2.Visible := false ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).Panel10.Height := 105 ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).BitBtn1.Visible := false ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).StatusBar.Parent := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ) ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).StatusBar.Align := alTop ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).StatusBar.Font.Size := 14 ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).StatusBar.Height := 25 ;
      TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).StatusBar.Repaint ;
      AddFormToSkin(TForm(PCMain.ActivePage.Tag ),self);
    end else
    begin
       if TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).NBDocuments.PageIndex =0 then
         TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).BFilterClick(nil) ;
    end;
  end;
  if  (PCMain.ActivePage <> nil ) and ((PCMain.ActivePage.Name = 'TSLISTAccountview') or (PCMain.ActivePage.Name = 'TSLISTAccountview2') )then
    begin

      Ledgerviewer1.Checked := PCMain.ActivePage.Name = 'TSLISTAccountview'  ;

      Ledgerviewer2.Checked := not(PCMain.ActivePage.Name = 'TSLISTAccountview' ) ;


       if PCMain.ActivePage.Tag = 0 then
        begin
           PCMain.ActivePage.Tag := Integer(TAccountTreeView.create(PCMain.ActivePage));
           TAccountTreeView(PCMain.ActivePage.Tag).Parent := PCMain.ActivePage ;
           TAccountTreeView(PCMain.ActivePage.Tag).Show ;
           TAccountTreeView(PCMain.ActivePage.Tag ).Top := 0 ;
           TAccountTreeView(PCMain.ActivePage.Tag ).Left := 0 ;
           TAccountTreeView(PCMain.ActivePage.Tag ).Width := PCMain.ActivePage.Width - 1  ;
           TAccountTreeView(PCMain.ActivePage.Tag ).Height := PCMain.ActivePage.Height -1 ;
       end else
        begin
            // plugins ?
        end;
    end;

end;

procedure TfmMain.NVBMainItemClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; Index: Integer);
begin
{ if NVBMain.ActiveFolder = 3 then
   begin
     case Index of
        0 : TfmStockEntry(PCMain.ActivePage.Tag ).BSetupstockClick(self);
        1 : TfmStockEntry(PCMain.ActivePage.Tag ).BSetupGroupsClick(self);
        2 :  begin
              With OpenDialog do
              begin
                Title:=GetTextLang(1063);
                FileName:=TfmStockEntry(PCMain.ActivePage.Tag ).edtFileName.Text;
                DefaultExt:='.txt';
                Filter:='Tab delimited|*.txt|Lotus SpreadSheet (*.Wk1)|*.Wk1|All files|*.*|Comma Seperated Value|*.csv' ;
               // InitialDir:=ApplicationPath;
                if Execute then
                begin
                  TfmStockEntry(PCMain.ActivePage.Tag ).edtFileName.Text := FileName;
                  TfmStockEntry(PCMain.ActivePage.Tag ).BExportClick(self);
                end;
              end;
            end;
        3 : begin
            With OpenDialog do
              begin
                Title:=GetTextLang(1063);
                FileName:=TfmStockEntry(PCMain.ActivePage.Tag ).edtFileName.Text;
                DefaultExt:='.txt';
                Filter:='Tab delimited|*.txt|Lotus SpreadSheet (*.Wk1)|*.Wk1|All files|*.*|Comma Seperated Value|*.csv' ;
               // InitialDir:=ApplicationPath;
                if Execute then
                begin
                  TfmStockEntry(PCMain.ActivePage.Tag ).edtFileName.Text := FileName;
                  TfmStockEntry(PCMain.ActivePage.Tag ).bImportClick(self);
                end;
              end;
            end;
      end;
   end else

 if NVBMain.ActiveFolder = 0 then
   begin
     case Index of
        0 : WebshopClick(self);
        1 : Bugreportsourceforge1Click(self);
        2 : Forum1Click(self);
      end;
   end else
 if NVBMain.ActiveFolder = 1 then
   begin
    if DMTCCoreLink.SimpleMode then exit ;
     FmLookup.IsShowForm := false ;
     if TfmDebtor(PCMain.ActivePage.Tag ).QDebtorCreditor.IsEmpty then exit ;
     ForceAccountid := TfmDebtor(PCMain.ActivePage.Tag ).QDebtorCreditorWAccountID.AsInteger ;
     if TVpNavBtnItem(TVpNavFolder(NVBMain.FolderCollection.Item[1]).Items[Index]).IconIndex <> NVBDisabeItemIndex then
     case Index of
        0 : // \plug_ins\reports\Newreports\TRN_160\TRN_66\TRN_906140
             OSFPLUGINFindAlternateReport( '\TRN_160\TRN_66',true,true,currentLanguage,false)  ;
        1 :  OSFPLUGINFindAlternateReport( '\TRN_160\TRN_65',true,true,currentLanguage,false)  ;
        2 : tlbtnInvoice.Execute;
        3 : Quotations1Click(self);
        4 : InputCreditNotesClick(self);
      end;
   end else
 if NVBMain.ActiveFolder = 2 then
   begin
    if DMTCCoreLink.SimpleMode then exit ;
     if TfmDebtor(PCMain.ActivePage.Tag ).QDebtorCreditor.IsEmpty then exit ;
     ForceAccountid := TfmDebtor(PCMain.ActivePage.Tag ).QDebtorCreditorWAccountID.AsInteger ;   
     case Index of
        0 : InputPurchasesClick(self);
        1 : Orders1Click(self);
        2 : InputStockReturnsClick(self);
      end;
   end else
 if NVBMain.ActiveFolder = 5 then
   begin
     if TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).NBDocuments.PageIndex <> 0 then exit ;
     if TVpNavBtnItem(TVpNavFolder(NVBMain.FolderCollection.Item[5]).Items[Index]).IconIndex <> NVBDisabeItemIndex then
     if Index <=  5 then
     begin
     case Index of
        0 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(10))  ;
        1 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(11))  ;
        2 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(12))  ;
        3 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(13))  ;
        4 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(14))  ;
        5 : TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.ItemIndex := TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenew.Items.IndexOfObject(TObject(15))  ;
      end;
     TfmInvoiceEntryGrid(PCMain.ActivePage.Tag ).cbDocTypenewChange(self);
     end else
     begin
        if Index = 6 then
           EditAccountsDebtorClick(self);
        if Index = 7 then
           EditAccountsCreditorClick(self);
     end;
  end;   }
end;

procedure TfmMain.Ledgerviewer1Click(Sender: TObject);
begin

 PCMain.ActivePage :=  TTabSheet(PCMain.FindComponent('TSLISTAccountview')) ;
 PCMainChange(self);
end;

procedure TfmMain.Accounts1Click(Sender: TObject);
var
  GeneralEditAccount: TGeneralEditAccount;
begin
  GeneralEditAccount:= TGeneralEditAccount.create(nil);
   try
      GeneralEditAccount.showmodal ;
   finally
       GeneralEditAccount.free ;
   end;
end;

procedure TfmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
if PCMain.ActivePageIndex <> 0  then
  if PCMain.ActivePage.Tag > 0 then
    begin

     if  Assigned(Tform(PCMain.ActivePage.Tag ).OnKeyPress) then
       if not (Tform(PCMain.ActivePage.Tag ) is TfmStockEntry) then
         Tform(PCMain.ActivePage.Tag ).OnKeyPress(Sender,Key);
    end;
end;

procedure TfmMain.UpdateColorsForThema;
var
 AList : TStringlist ;
 aFile : String ;
 i : Integer ;
begin

 
        begin
        MainColor := 16777215;
        MainPanelColor :=  16777215 ;
        end;

     AList := TStringList.Create ;
      try
        aFile := ThemePath + 'colors.ini' ;
        if not FileExists(aFile ) then
        aFile :=  ApplicationPath + 'bin\themes\classic\colors.ini';
        if FileExists( aFile) then
        begin
        AList.LoadFromFile(aFile) ;


        dmQuantumGridDefs.cxBackground.Color := StrToIntDef(AList.values['gridbackcolor'],dmQuantumGridDefs.cxBackground.Color);
        dmQuantumGridDefs.cxGroupByBox.Color := StrToIntDef(AList.values['gridgroupcolor'],dmQuantumGridDefs.cxGroupByBox.Color);
        dmQuantumGridDefs.cxBackground.TextColor := StrToIntDef(AList.values['gridbackfontcolor'],dmQuantumGridDefs.cxBackground.TextColor);
        dmQuantumGridDefs.cxGroupByBox.TextColor := StrToIntDef(AList.values['gridgroupfontcolor'],dmQuantumGridDefs.cxGroupByBox.TextColor);

        dmQuantumGridDefs.cxHeader.Color := StrToIntDef(AList.values['gridheadingcolor'],dmQuantumGridDefs.cxHeader.Color);
        dmQuantumGridDefs.cxFooter.Color := StrToIntDef(AList.values['gridheadingcolor'],dmQuantumGridDefs.cxFooter.Color);
        dmQuantumGridDefs.cxHeader.TextColor := StrToIntDef(AList.values['gridheadingfontcolor'],dmQuantumGridDefs.cxHeader.TextColor);
        dmQuantumGridDefs.cxFooter.TextColor := StrToIntDef(AList.values['gridheadingfontcolor'],dmQuantumGridDefs.cxFooter.TextColor);
        if    StrToIntDef(AList.values['gridfontmaxsize'],10) <> 10 then
           begin
               for i := 0 to dmQuantumGridDefs.ComponentCount -1 do
                if  (dmQuantumGridDefs.Components[i] is     TcxStyle) then
                  (dmQuantumGridDefs.Components[i] as     TcxStyle).Font.Size :=  StrToIntDef(AList.values['gridfontmaxsize'],10) ;

           end;

        MainColor :=  StrToIntDef(AList.values['maincolor'],MainColor);
        MainPanelColor :=  StrToIntDef(AList.values['mainpanelcolor'],MainPanelColor);
        end;
       // self.Color := MainColor ;
       // self.ParentBackground := false ;
       // self.Font.Color := NVBMain.Font.Color ;
        finally
          AList.free ;
        end;

end;


procedure TfmMain.ProcessBatchFromPlugin(Sender: TObject);
var
 CleanText : String ;
 var Intransact : Boolean ;
begin
 Intransact :=  DMTCCoreLink.TheZConnection.InTransaction ;
 if TDataBaseRoutines.TableExist(FPluginIteractClass.ProcessBatch) then
 begin
 CleanText := copy(FPluginIteractClass.ProcessBatch,4,30);
  if not(copy(CleanText+ ' ',1,1)[1] in ['0','1','2','3','4','5','6','7','8','9']) then
  CleanText := copy(FPluginIteractClass.ProcessBatch,pos('_',FPluginIteractClass.ProcessBatch)+1,30);


 dmDatabase.BatchType := StrToIntDef(Copy(CleanText,pos('T',CleanText)+1,20),0) ;



 OpenBatch(TDataBaseRoutines.GetBatchNameById(dmDatabase.BatchType),BatchCtrlID,false);    
 dmDatabase.tblBatch.close ;
 dmDatabase.tblBatch.TableName :=FPluginIteractClass.ProcessBatch ;


 if not Intransact then
 DMTCCoreLink.TheZConnection.StartTransaction ;
 try
  dmDatabase.tblBatch.open ;

 PostBatch(True,true,false,DMTCCoreLink.ReadNwReportOp(intToStr(dmDatabase.BatchType) + 'BOpeningBal',false));
 if not Intransact then
 DMTCCoreLink.TheZConnection.Commit ;
 finally
   if not Intransact then
   if DMTCCoreLink.TheZConnection.InTransaction then
     DMTCCoreLink.TheZConnection.Rollback;

 end;
 end;
end;

procedure TfmMain.OpenNewYearFromPlugin(Sender: TObject);
begin
   DoYearEnd(true);
   initSetOfBooksPropertys ;
end;

procedure TfmMain.InputProjectsClick(Sender: TObject);
begin
      try
        if dmDatabase.ZMainconnection.Connected then
         begin
          if not assigned(JobProject) then
            JobProject :=  TJobProject.Create(Application) ;
            JobProject.ShowModal ;
            FreeAndNil(JobProject);
          end;
       except

       end;   
end;

procedure TfmMain.initDynaScreen;
var
  Aquery : TuniQuery ;
  ANewAction : TAction ;
  i : Integer ;
  ACLient:TActionClient ;
begin
   ACLient := nil ;
   for i := 0 to rbEdit.Items.Count-1 do
      if rbEdit.Items[i].tag = 464 then
         ACLient := rbEdit.Items[i];

  for i := ACLient.Items.Count -1 downto 0 do
     begin
        if ACLient.Items[i].Tag < 0 then
           ACLient.Items[i].Free ;

     end;
  Aquery := TuniQuery.create(nil) ;
  try
  Aquery.Connection := DMTCCoreLink.TheZConnection ;
  Aquery.SQL.Text := 'Select * from v_types types where WTYPEPARENT = 10';
  Aquery.open ;
  while not Aquery.eof do
  begin
               aNewAction := TAction.Create(self);

               aNewAction.ActionList := ActionManager1 ;

               aNewAction.Tag :=    - Aquery.fields[0].AsInteger   ;
               aNewAction.OnExecute := TDynaClick ;
               aNewAction.Caption := Aquery.fields[1].AsString ;

               aNewAction.name := 'DYNAACT' + IntToStr( ActionManager1.ActionCount -1) ;
               with ACLient.Items.Add do
               begin
                Action := aNewAction;
               end;


    Aquery.next ;
   // APluginsFormsList.AddObject(Aquery.fields[1].AsString,Tobject(- Aquery.fields[0].AsInteger));
   end;
  finally
    Aquery.free ;
  end;
end;

procedure TfmMain.InitUserItems ;
var
 aquery: TUniQuery ;
 AAction : TAction ;
 i : Integer ;
begin
fmMain.ScreenTipsManager1.Footer :=  DMTCCoreLink.GetTextLangNoAmp( 1000004 );
  for i := 0 to fmMain.ScreenTipsManager1.ScreenTips.Count -1 do
       begin
         if (fmMain.ScreenTipsManager1.ScreenTips[i].Action is TAction )then
          begin
              fmMain.ScreenTipsManager1.ScreenTips[i].Description.Text :='';
              fmMain.ScreenTipsManager1.ScreenTips[i].Header :=
               TAction(fmMain.ScreenTipsManager1.ScreenTips[i].Action).Caption ;
              fmMain.ScreenTipsManager1.ScreenTips[i].DisabledHeader :=
               TAction(fmMain.ScreenTipsManager1.ScreenTips[i].Action).Caption ;
          end;

       end ;

  //  add user tabs
  aquery := TUniQuery.Create(nil);
  try
    aquery.Connection := DMTCCoreLink.TheZConnection;
    aquery.sql.Text := 'select * from sysparams where WTypeid= 101 and wuserid =:wuser';
    aquery.Params[0].AsInteger := DMTCCoreLink.currentuser;
    aquery.Open;
    rbuser.Visible := not aquery.IsEmpty;
    while rguser.Items.Count <> 0 do
      rguser.Items.Delete(0);
    while rguser2.Items.Count <> 0 do
      rguser2.Items.Delete(0);
    while rguser3.Items.Count <> 0 do
      rguser3.Items.Delete(0);
    while rguser4.Items.Count <> 0 do
      rguser4.Items.Delete(0);
    while rguser5.Items.Count <> 0 do
      rguser5.Items.Delete(0);
    while rguser6.Items.Count <> 0 do
      rguser6.Items.Delete(0);
    while not aquery.Eof do
    begin
     AAction := nil  ;
     for i := 0 to fmMain.ActionManager1.ActionCount -1 do
       begin
         if fmMain.ActionManager1.Actions[i].Name = aquery.FieldByName('SPARAMVALUE').AsString  then
           AAction :=  fmMain.ActionManager1.Actions[i] as taction ;
       end;

      if  AAction <> nil then
      begin

        if aquery.FieldByName('SPARAMNAME').AsString = '6' then
        begin
          with rgUser6.Items.Add do
          begin
            Action :=  AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end
        else if aquery.FieldByName('SPARAMNAME').AsString = '5' then
        begin
          with rgUser5.Items.Add do
          begin
            Action := AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end
        else if aquery.FieldByName('SPARAMNAME').AsString = '4' then
        begin
          with rgUser4.Items.Add do
          begin
            Action := AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end
        else if aquery.FieldByName('SPARAMNAME').AsString = '3' then
        begin
          with rgUser3.Items.Add do
          begin
            Action := AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end
        else if aquery.FieldByName('SPARAMNAME').AsString = '2' then
        begin
          with rgUser2.Items.Add do
          begin
            Action := AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end
        else
        begin
          with rgUser.Items.Add do
          begin
            Action := AAction ;
            CommandStyle := csButton;
            if ImageIndex <> -1 then
              TButtonProperties(CommandProperties).ButtonSize := bsLarge;
            Tag := 9999;
          end;
        end;
      end;
      aquery.next;
    end;
    rguser.Visible := rguser.Items.Count <> 0;
    rguser2.Visible := rguser2.Items.Count <> 0;
    rguser3.Visible := rguser3.Items.Count <> 0;
    rguser4.Visible := rguser4.Items.Count <> 0;
    rguser5.Visible := rguser5.Items.Count <> 0;
    rguser6.Visible := rguser6.Items.Count <> 0;
  finally
    aquery.Free;
  end;
end;
procedure TfmMain.initMainplugins;
 var
     HorecaIndex : Integer ;
     AClient :TActionClient ;
 procedure Init;
    var
     i,ImageIndex  :  Integer ;
     AForm: TForm ;

     ReturnString : Array [0..1025] of char ;
     APChar : PChar ;
     AAction : TAction ;
     AClientAction : TActionClientItem ;
     aComponent : TComponent ;
    begin

      for i :=  rbEdit.Items.Count -1 downto 0 do
       if rbEdit.Items[i].Tag = 9999 then
        rbEdit.Items.Delete(i);

      if mainRibbon.FindComponent('MIAUTOPLUGINS') <> nil then
          mainRibbon.FindComponent('MIAUTOPLUGINS').free ;
      aComponent := TComponent.Create(mainRibbon) ;
      aComponent.Name := 'MIAUTOPLUGINS' ;

      for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormPluginRecordArray[i].aMessageGetDisplayText <> nil) then

          begin

             APChar := ReturnString ;
             try
             AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'');



             AFormPluginRecordArray[i].aForm := AForm ;
              if ArrayImageIndex[i] > -1 then
              begin
                AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
                AAction := TAction.Create(aComponent) ;
                AAction.Name := 'PLUGINTOOLBAR' + IntToStr(i) ;
                AAction.ImageIndex := ArrayImageIndex[i] ;
                AAction.Caption :=  ReturnString ;
                AAction.Tag := Integer(AForm);
                AAction.OnExecute := TPluginClick ;
                AAction.ActionList := ActionManager1 ;

                AClientAction :=  rbEdit.Items.Add ;
                 with AClientAction do
                   begin
                    Action := AAction ;
                    CommandStyle := csButton ;
                    TButtonProperties(CommandProperties).ButtonSize := bsLarge ;
                    Tag := 9999 ;
                   end;

             end;
             APluginsFormsList.AddObject(aform.Name,AForm);


             if AForm.ClassName = 'TFHorecaPos' then
                HorecaIndex := APluginsFormsList.Count-1 ;
              except
               on e: Exception do
                 showmessage(e.Message +  ' Error in plugin ' + GetModuleName(AFormPluginRecordArray[i].aInst) );
              end;
          end;
    end;

var
 i , IncArr,Ins,ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 aquery : TUniQuery ;
begin
  HorecaIndex := -1 ;
  IncArr := 0 ;
  // Sort Loaded plugins
  LoadedPluginList.CustomSort(StringListPluginsCompare);

  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 9 then exit ;
       try
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       IsEnable := true ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToMainRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aGetPriceFormPlugin := GetProcAddress(Ins, OSFGetPriceForDocRoutineName);
            @AFormPluginRecordArray[IncArr].aDocSearch := GetProcAddress(Ins, OSFDOCSEARCHRoutineName);

            ArrayImageIndex[IncArr] := 25 ;
            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('MAIN',APChar,ImageIndex);
                 if APChar = 'True' then
                 IsEnable := True else
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 ArrayImageIndex[IncArr] := ImageIndex ;
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
              @AFormPluginRecordArray[IncArr].aContextmenuEnabled   := nil ;
              AFormPluginRecordArray[IncArr].aForm := nil ;
              AFormPluginRecordArray[IncArr].ainst := 0 ;
            end;
        end;
        except
               on e: Exception do
                 showmessage(e.Message +  ' Error in plugin ' + GetModuleName(AFormPluginRecordArray[IncArr].ainst) );
        end;

    end;
 init ;

   IncArr := 0 ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 9 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       IsEnable := true ;
       @AFormOnDocProcPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFAddEditItemToDocProcess);
       if @AFormOnDocProcPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormOnDocProcPluginRecordArray[IncArr].aInst := Ins ;
            @AFormOnDocProcPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFMESSAGEFORMRoutineName);
            @AFormOnDocProcPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFUNLOADFORMRoutineName);
            @AFormOnDocProcPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFDISPLAYTEXTRoutineName);
            @AFormOnDocProcPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormOnDocProcPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            ArrayImageIndex[IncArr] := 25 ;
            if  assigned(AFormOnDocProcPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormOnDocProcPluginRecordArray[IncArr].aPluginEnabled('PROCDOC',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
                 ArrayImageIndex[IncArr] := ImageIndex ;
              end;
             if IsEnable then
               begin
                if (@AFormOnDocProcPluginRecordArray[IncArr].aLoadFormPlugin <> nil) then
                  AFormOnDocProcPluginRecordArray[IncArr].aForm :=  AFormOnDocProcPluginRecordArray[IncArr].aLoadFormPlugin(Application,'');



               inc(IncArr) ;
               end else
            begin
              @AFormOnDocProcPluginRecordArray[IncArr].aLoadFormPlugin := nil ;
              @AFormOnDocProcPluginRecordArray[IncArr].aMessageFormPlugin  := nil ;
              @AFormOnDocProcPluginRecordArray[IncArr].aUnLoadFormPlugin  := nil ;
              @AFormOnDocProcPluginRecordArray[IncArr].aMessageGetDisplayText := nil ;
              @AFormOnDocProcPluginRecordArray[IncArr].aPluginEnabled   := nil ;
              @AFormOnDocProcPluginRecordArray[IncArr].aContextmenuEnabled   := nil ;
              AFormOnDocProcPluginRecordArray[IncArr].aForm := nil ;
            end;

        end;
    end;
  // if Horeca Pos fount and we have a login controler then login
 if HorecaIndex <> -1 then
   if Assigned(ExternalLoginControlerPlugin) and DMTCCoreLink.ReadNwReportOp('CONTROLERLOGIN',false) and (UpperCase(TDatabaseRegistyRoutines.ReadRegValue('','CONTROLERLOGIN')) = 'TRUE' )then
            begin
             while CurrentUser <> -1 do
              begin
              Self.Hide ;
              fmOpenASetOfBooks.Hide ;
              TForm(APluginsFormsList.Objects[HorecaIndex]).ShowModal ;
              DMTCCoreLink.currentuser := -1 ;
              PosLogin ;
              end;
              fmOpenASetOfBooks.Visible := true ;
              Self.Visible := true ;
              Application.ProcessMessages ;
              CloseSetofBooks13Click(self);
            end;

 // check to see if backorders need show
  if DMTCCoreLink.ReadNwReportOp('BWARNBACKORD',False) and (ReadSysParam('BEditmode',0,CurrentUser).AsInteger = 0) then
     begin
          DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] := 'True' ;
          fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
    try

       IsEnable := false ;
      fmBackOrdersOutstanding.ViewType:=1 ;
      fmBackOrdersOutstanding.ZQBackorder.SQL.Text := 'Select * from BACKORD' ;
      fmBackOrdersOutstanding.ZQBackorder.Open;
      fmBackOrdersOutstanding.ZQBackorder.IndexFieldNames := 'QTYONHAND desc' ;
      fmBackOrdersOutstanding.ZQBackorder.First ;
      while not fmBackOrdersOutstanding.ZQBackorder.Eof do
        begin
          if fmBackOrdersOutstanding.ZQBackorderFQTY.AsFloat <  fmBackOrdersOutstanding.ZQBackorderQTYONHAND.AsFloat then
            begin
             IsEnable := true; 
             Break ;
            end;

        fmBackOrdersOutstanding.ZQBackorder.next ;
       end;
      if IsEnable then
         fmBackOrdersOutstanding.ShowModal;
    finally
      FreeAndNil(fmBackOrdersOutstanding);
    end
    end;

initDynaScreen ;
  InitUserItems;

end;
procedure TfmMain.TPluginClick(Sender: TObject);
begin
 if TForm(TCOmponent(Sender).Tag).Visible then
  TForm(TCOmponent(Sender).Tag).BringToFront 
 else
 begin
 if TForm(TCOmponent(Sender).Tag).tag = 99 then
   TForm(TCOmponent(Sender).Tag).show
 else
 TForm(TCOmponent(Sender).Tag).ShowModal ;
 end;
                 
end;



procedure TfmMain.TrayIcon1Click(Sender: TObject);
begin
TrayIcon1.ShowBalloonHint ;
end;

procedure TfmMain.ClearPlugins;
var
 i : Integer ;
begin
  // cleanup forms  .
    if rbEdit.Items <> nil  then
        for i :=  rbEdit.Items.Count -1 downto 0 do
        if rbEdit.Items[i].Tag = 9999 then
        rbEdit.Items.Delete(i);

      if mainRibbon.FindComponent('MIAUTOPLUGINS') <> nil then
          mainRibbon.FindComponent('MIAUTOPLUGINS').free ;


     for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
        if (@AFormPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormPluginRecordArray[i].aUnLoadFormPlugin <> nil) then
          begin
             AFormPluginRecordArray[i].aUnLoadFormPlugin(AFormPluginRecordArray[i].aForm);
             @AFormPluginRecordArray[i].aLoadFormPlugin := nil ;
             @AFormPluginRecordArray[i].aMessageFormPlugin  := nil ;
             @AFormPluginRecordArray[i].aUnLoadFormPlugin  := nil ;
             @AFormPluginRecordArray[i].aMessageGetDisplayText := nil ;
             @AFormPluginRecordArray[i].aPluginEnabled   := nil ;
             @AFormPluginRecordArray[i].aContextmenuEnabled   := nil ;
             AFormPluginRecordArray[i].aForm := nil ;
          end;

     for i := low(AFormOnDocProcPluginRecordArray) to high(AFormOnDocProcPluginRecordArray) do
        if (@AFormOnDocProcPluginRecordArray[i].aLoadFormPlugin <> nil) and (@AFormOnDocProcPluginRecordArray[i].aUnLoadFormPlugin <> nil) then
          begin
             AFormOnDocProcPluginRecordArray[i].aUnLoadFormPlugin(AFormOnDocProcPluginRecordArray[i].aForm);
             @AFormOnDocProcPluginRecordArray[i].aLoadFormPlugin := nil ;
             @AFormOnDocProcPluginRecordArray[i].aMessageFormPlugin  := nil ;
             @AFormOnDocProcPluginRecordArray[i].aUnLoadFormPlugin  := nil ;
             @AFormOnDocProcPluginRecordArray[i].aMessageGetDisplayText := nil ;
             @AFormOnDocProcPluginRecordArray[i].aPluginEnabled   := nil ;
             @AFormOnDocProcPluginRecordArray[i].aContextmenuEnabled   := nil ;
             AFormOnDocProcPluginRecordArray[i].aForm := nil ;
          end;

  APluginsFormsList.clear ;
end;

procedure TfmMain.SetIniFilePath(const Value: String);
begin
  FIniFilePath := Value;
end;

function TfmMain.GetIniFilePath: String;
begin
 result := FIniFilePath ;
end;

procedure TfmMain.SetPluginIteractClass(const Value: TPluginIteractClass);
begin
  FPluginIteractClass := Value;
end;

procedure TfmMain.ProcessExtPosFromPlugin(Sender: TObject);
begin
    IsDeleteMode:=False;
    If CheckDocInfos then begin
      fmUpdateInvoice := TfmUpdateInvoice.Create(self);
      try
      IdDocType:=10;
      fmUpdateInvoice.BDoExtPos := true ;
      fmUpdateInvoice.WProfileid := PluginIteractClass.PreviewDocId ;
      fmUpdateInvoice.ShowModal;
      finally
      FreeAndNil(fmUpdateInvoice);
      end;
    end;
end;

procedure TfmMain.MainStatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  aRect: TRect;
begin
  if Panel = StatusBar.Panels[1] then begin
    aRect := Rect;
    InflateRect(aRect, 1, 1);
    MainProgressBar.BoundsRect := aRect;
  end;
end;

procedure TfmMain.Closeopensforms1Click(Sender: TObject);
var
 i : Integer ;
 Fromfile,ToFile :String ;
begin
 // clean up left bar
 PCMain.ActivePageIndex := 0   ;
  for i := 1 to PCMain.PageCount -1 do
   begin
     if PCMain.Pages[i].Tag <> 0 then
       begin
          PCMain.ActivePage := PCMain.Pages[i] ;
          PCMainChange(self);
       if not TForm(PCMain.Pages[i].Tag).CloseQuery then
          begin
          abort ;
          end;
       end;
   end;


  for i := 1 to fmMain.PCMain.PageCount -1 do
   begin
     if PCMain.Pages[i].Tag <> 0 then
       begin
       TForm(PCMain.Pages[i].Tag).close ;
       TObject(PCMain.Pages[i].Tag).free ;
       PCMain.Pages[i].Tag := 0 ;
       end;
   end;
  PCMain.ActivePageIndex := 0 ;


  // Reload plugins
  if PluginIteractClass.ProcessBatch = 'GOCOPY' then
    begin
      // Special copy database action
      if FileExists(ExtractFilePath(DMTCCoreLink.TheZConnection.Database) + '\BACK\books.FDB') then
         begin
          ToFile :=  DMTCCoreLink.TheZConnection.Database ;
          CloseSetOfBooks ;

          Fromfile :=  ExtractFilePath(ToFile) + '\BACK\books.FDB' ;
          if CopyFile(pchar(Fromfile),pchar(ToFile),false) then
            DeleteFile(Fromfile) ;
          FileOpen2Click(self);

         end;
    end else
  begin
    ClearPlugins ;
    initMainplugins ;
  end;
end;

procedure TfmMain.OpenBatchFromPlugin(Sender: TObject);
begin

 dmDatabase.BatchType := StrToIntDef(trim(FPluginIteractClass.ProcessBatch),0) ;
 ShowBank(StrToIntDef(trim(FPluginIteractClass.ProcessBatch),0));
end;



procedure TfmMain.Backorders1Click(Sender: TObject);
begin
  fmBackOrdersOutstanding := TfmBackOrdersOutstanding.Create(self);
    try

      fmBackOrdersOutstanding.vWAccountID:=0;
      fmBackOrdersOutstanding.ViewType:=1 ;
      fmBackOrdersOutstanding.ZQBackorder.SQL.Text := 'Select * from BACKORD' ;
      fmBackOrdersOutstanding.ZQBackorder.Open;
      fmBackOrdersOutstanding.ShowModal;
    finally
      FreeAndNil(fmBackOrdersOutstanding);
    end
end;


function TfmMain.GetPathFromMenuItemRepmanBand(AMenuitem,
  StopItem: TActionClientItem): String;
begin
 result := '' ;
 IF  StopItem <> nil then
   if  AMenuitem = StopItem then exit ;

if (AMenuitem.OwningCollection.Owner <> nil) then
 begin
  if AMenuitem.Tag <> 0 then
    result := 'TRN_' + IntToStr(AMenuitem.Tag)
  else
  result := StringReplace(UpperCase(AMenuitem.Caption),'&','',[rfreplaceAll]);
  result :=  GetPathFromMenuItemRepmanBand(AMenuitem.ParentItem as TActionClientItem,StopItem) + PathDelim + result ;
 end;
end;

function TfmMain.GetPathFromMenuItemRepman(AMenuitem,
  StopItem: TMenuItem): String;
begin
 result := '' ;
 IF  StopItem <> nil then
   if  AMenuitem = StopItem then exit ;

if (AMenuitem.Parent <> nil) then
 begin
  if AMenuitem.Tag <> 0 then
    result := 'TRN_' + IntToStr(AMenuitem.Tag)
  else
  result := StringReplace(UpperCase(AMenuitem.Caption),'&','',[rfreplaceAll]);
  result :=  GetPathFromMenuItemRepman(AMenuitem.Parent,StopItem) + PathDelim + result ;
 end;
end;

procedure TfmMain.EditAccountsDebtorExecute(Sender: TObject);
begin
    PCMain.ActivePageIndex := 1 ;
    PCMainChange(self);
end;

procedure TfmMain.EditDeleteExecute(Sender: TObject);
begin
pmEdit.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TfmMain.Ledgerviewer2Execute(Sender: TObject);
begin
  PCMain.ActivePageIndex   := 7 ;
  PCMainChange(self) ;

end;

procedure TfmMain.Ledgerviewer1Execute(Sender: TObject);
begin
  PCMain.ActivePageIndex  := 6 ;
  PCMainChange(self) ;
end;

procedure TfmMain.EditAccountsCreditorExecute(Sender: TObject);
begin
          PCMain.ActivePageIndex := 2 ;
       PCMainChange(self);
end;

procedure TfmMain.EditStockItemsExecute(Sender: TObject);
begin
         PCMain.ActivePageIndex := 3 ;
       PCMainChange(self);
end;

procedure TfmMain.aEditUserbarExecute(Sender: TObject);
begin

  fmAccessControl := TfmAccessControl.Create(Application);
  try
  SetUpForm(fmAccessControl);
   fmAccessControl.ShowBarForUser := True ;
  fmAccessControl.ShowModal;
    InitUserItems ;
  finally
  FreeAndNil(fmAccessControl);
  end;
end;

procedure TfmMain.ActionManager1Execute(Action: TBasicAction;
  var Handled: Boolean);
  var I : integer ;
  localAction :TBasicAction ;
  aClientitem : TActionClientItem ;
begin
 if cbautolearn.Checked then
  if VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select count(*) from SYSPARAMS where wtypeid = 101 and SPARAMVALUE = '+ QuotedStr(Action.Name) +' and wuserid ='+IntToStr(DMTCCoreLink.currentuser))) ='0' then
    begin
      rgUser.Visible := True ;
      localAction := Action ;
      case cxAddToGroup.ItemIndex of
       1 : aClientitem := rgUser2.Items.Add ;
       2 : aClientitem := rgUser3.Items.Add ;
       3 : aClientitem := rgUser4.Items.Add ;
       4 : aClientitem := rgUser5.Items.Add ;
       5 : aClientitem := rgUser6.Items.Add ;
       else
       aClientitem := rgUser.Items.Add ;
      end;
      with aClientitem do
      begin
        Action := localAction as TAction ;
        CommandStyle := csButton ;
        TButtonProperties(CommandProperties).ButtonSize := bsLarge ;
        Tag := 9999 ;
        DMTCCoreLink.ExecSql('INSERT INTO SYSPARAMS (WPARAMID, WUSERID, SPARAMNAME, SPARAMVALUE, WTYPEID, WSOURCEID, WSOURCETYPEID, '+
        ' DSYSDATE, WPARENTID, WPARENTTYPEID, BACTIVE) VALUES (gen_id(GEN_SYSPARAMS_ID,1),' + IntToStr(DMTCCoreLink.currentuser) +','+ VarToStr(cxAddToGroup.Properties.Items[cxAddToGroup.ItemIndex].Value) +', ' + QuotedStr(Action.Name) +', 101, 0, 0, NULL, NULL, NULL, 1)');
      end;
    end;
end;

procedure TfmMain.Activateplugins1Click(Sender: TObject);
var
 PlugInsItem : TMenuItem ;
begin
   FcheckPlugins := TfmCheckPlugins.Create(self) ;
 try
   FcheckPlugins.check(true) ;
   Closeopensforms1Click(self);
   ClearPlugins ;
   PlugInsItem:= TMenuItem(Self.FindComponent('PlugInsMenu')) ;
   if PlugInsItem <> nil then
     PlugInsItem.Free ;

   AllowedPluginList.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir + 'pluginsload.txt');
   LoadPluginsDLL ;
   LoadPluginsEXE;
   initMainplugins ;
 finally
   FreeAndNil(FcheckPlugins);
 end;

end;

procedure TfmMain.ADocumentsExecute(Sender: TObject);
begin
  PCMain.ActivePageIndex := 5 ;
  PCMainChange(self);
end;

procedure TfmMain.CallPluginInteract(Sender: TObject);
var
 fmDebtor : TfmDebtor ;
 fmInvoiceEntryGrid : TfmInvoiceEntryGrid ;
 LastDoctype : Integer ;
begin
 if PluginIteractClass.processstring = 'LOOKUPDEB' then
    begin
      PluginIteractClass.ResultString := '' ;
      fmDebtor := TfmDebtor.Create(self);
      try
      fmDebtor.UseCreditor:=False;
      fmDebtor.AsFindScreen(True) ;
      if fmDebtor.ShowModal = mrok then
         PluginIteractClass.ResultString := IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger);
      finally
        fmDebtor.free ;
      end;

    end else
 if PluginIteractClass.processstring = 'LOOKUPCRED' then
    begin
      PluginIteractClass.ResultString := '' ;
      fmDebtor := TfmDebtor.Create(self);
      try
      fmDebtor.UseCreditor:=True;
      fmDebtor.AsFindScreen(True) ;
      if fmDebtor.ShowModal = mrok then
         PluginIteractClass.ResultString := IntToStr(fmDebtor.QDebtorCreditorWAccountID.AsInteger);
      finally
        fmDebtor.free ;
      end;

    end else
 if PluginIteractClass.processstring = 'LOOKUPINV' then
    begin
      PluginIteractClass.ResultString := '' ;
      LastDoctype := idDocType ;
      idDocType:=10;
      dmDatabase.CalledFromBatch:=False;
      fmInvoiceEntryGrid := TfmInvoiceEntryGrid.Create(self);
      try
       //  fmInvoiceEntryGrid.BitBtn1.Visible := false ;
       //  fmInvoiceEntryGrid.BitBtnCancel.Visible := false ;
       if  fmInvoiceEntryGrid.ShowModal = mrok then
           PluginIteractClass.ResultString := IntToStr(fmInvoiceEntryGrid.QDocHeadWDOCID.AsInteger);

       finally
       FreeAndNil(fmInvoiceEntryGrid);
       idDocType := LastDoctype ;

       end;

    end;
 if PluginIteractClass.processstring = 'LOOKUPSTOCK' then
    begin
      PluginIteractClass.ResultString := '' ;
      fmStockEntry := TfmStockEntry.Create(self);
      try
       //  fmInvoiceEntryGrid.BitBtn1.Visible := false ;
       //  fmInvoiceEntryGrid.BitBtnCancel.Visible := false ;
       fmStockEntry.GoToID := PluginIteractClass.PreviewDocId ;
       if  fmStockEntry.ShowModal = mrok then
           PluginIteractClass.ResultString := IntToStr(fmStockEntry.tblStockAdWSTOCKID.AsInteger);

       finally
       FreeAndNil(fmStockEntry);


       end;

    end;
end;

function TfmMain.StdPluginVisible: Boolean;
begin
  result := (fileExists(IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\' +( ReadT3IniFile('DEFPLUGIN','PATH','')))  or
   fileExists(IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\' +( ChangeFileExt(ReadT3IniFile('DEFPLUGIN','PATH',''),'.'+PluginsDLLName  ))));
  if result then
    result := uppercase(ReadT3IniFile('DEFPLUGIN','PATH','')) = uppercase('OSCommerceImport.osc') ;  
{ if not result then
   result := FileExists(IncludeTrailingPathDelimiter(ApplicationPath)+'plug_ins\ECommerce.' + PluginsDLLName)  ;
 if  ReadT3IniFile('DEFPLUGIN','PATH','') = '' then }
end;

procedure TfmMain.TUbutuFixTimer(Sender: TObject);
begin
 if Screen.ActiveForm <> nil then
 begin
// if LastActiveFormName <> Screen.ActiveForm.Name then
   if Screen.ActiveCustomForm <> self then
  begin
   if (fsActivated in  Screen.ActiveCustomForm.FormState) then
   begin
   MainStatusBar.Panels[2].Style := psText ;
   MainStatusBar.Panels[2].Text := '(T) '+Screen.ActiveCustomForm.Caption ;
   SetWindowPos(Screen.ActiveCustomForm.Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
   LastActiveFormName := Screen.ActiveCustomForm.Name ;
   end;
  end else
  begin
  //  self.BringToFront ;
  end;
 end;
end;

procedure TfmMain.TDynaClick(Sender: TObject);
begin
  fmGroups := TfmGroups.Create(self);
  try
   fmGroups.DEFLAYOUT := StringReplace(Tmenuitem(Sender).Caption,'&','',[rfReplaceAll]);

  if fmGroups.GroupControl.TabCount <> 0 then
  fmGroups.ShowModal;
  finally
  FreeAndNil(fmGroups);
  end;
end;

function TfmMain.GetBatchDisabledButton: TImageList;
begin
 result := dmOsfResource.BatchDisabledButtons ;
end;

function TfmMain.GetBatchEnabledButton: TImageList;
begin
  result := dmOsfResource.BatchEnabledButtons ;
end;

function TfmMain.GetDisabledButtonImageList: TImageList;
begin
  result := dmOsfResource.DisabledButtonImageList ;
end;

function TfmMain.GetEnabledButtonImageList: TImageList;
begin
  result := dmOsfResource.EnabledButtonImageList ;
end;

function TfmMain.GetGroupnameFromMenuItemRepman(AMenuitem,
  StopItem: TActionClientItem): String;
begin
 result := '' ;
 IF  StopItem <> nil then
   if  AMenuitem = StopItem then exit ;

if (AMenuitem.ParentItem <> nil) then
 begin
  result := StringReplace(UpperCase(AMenuitem.Caption),'&','',[rfreplaceAll]);
  result :=  GetGroupnameFromMenuItemRepman(AMenuitem.ParentItem as TActionClientItem ,StopItem) +  ' ' + result ;
 end;

end;

function TfmMain.GetMenuImages: TImageList;
begin
  result := dmOsfResource.MenuImages ;
end;

procedure TfmMain.bWorkflowClick(Sender: TObject);
var
 DmOwned : boolean ;
begin
 if  DMTCCoreLink.TheZConnection.Connected <> true  then
     exit ;


 (* if not DMTCCoreLink.IsRegistered('{22423B3E-237D-4A70-A47B-D307C1CAC250}') then
     begin
        dmWorkflowData.ZQWorkflow.open ;
       if dmWorkflowData.ZQWorkflow.RecordCount > 5 then
          raise Exception.Create('Workflow with more than 5 tasks and no licence please buy a licence!');
     end;  *)
    dmWorkflowData.InitForDatabase ;
   fmWorkFlowHandel := TfmWorkFlowHandel.Create(Application);
   try
    fmWorkFlowHandel.ShowModal ;
   finally
     FreeAndNil(fmWorkFlowHandel);
   end;


end;


{ twf_TfmMainPlugins }

constructor twf_TfmMainPlugins.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'main-plugins';
  Description := 'Show plugins intergated in the main form. ' + #13 + #10 +
  ' PLUGIN = plugin name parameter';
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PLUGIN' ;
        DataType := ftString ;
        Size := 255 ;
        Value := 'ECommerce' ;
     end;


end;

procedure twf_TfmMainPlugins.WorkflowEnd(AForm: TForm);
var

 Ins ,ImageIndex: Integer ;
 aplugin : TFormPluginRecord ;
  IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 AMessage : String ;
begin
 IsEnable := False ;
 if  LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName) <> -1 then
    begin

    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName)]);
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToMainRoutineName);
       if @aplugin.aLoadFormPlugin <> nil then
        begin
            aplugin.ainst := Ins ;
            @aplugin.aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @aplugin.aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @aplugin.aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @aplugin.aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @aplugin.aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            if  assigned(aplugin.aPluginEnabled) then
              begin

                  APChar := ReturnName ;

                 aplugin.aPluginEnabled('MAIN',APChar,ImageIndex);
                 if APChar ='True' then
                  IsEnable := true else

                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
              end ;
         end;
          //   if not IsEnable then
          //      raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName +' not found or loaded.' );
     AForm.Close ;  
     aplugin.aUnLoadFormPlugin(AForm) ;
      AForm.Align := alClient ;
end;
function twf_TfmMainPlugins.WorkFlowStart: TForm;
var

 Ins,ImageIndex : Integer ;
 aplugin : TFormPluginRecord ;
  IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 AMessage : String ;
begin
  IsEnable := false ;
 if  LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName) <> -1 then
    begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf( ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+PluginsDLLName)]);
     @aplugin.aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToMainRoutineName);
       if @aplugin.aLoadFormPlugin <> nil then
        begin
            aplugin.ainst := Ins ;
            @aplugin.aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @aplugin.aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @aplugin.aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @aplugin.aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @aplugin.aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            IsEnable := true ;
            if  assigned(aplugin.aPluginEnabled) then
              begin
                 APChar := ReturnName ;

                 aplugin.aPluginEnabled('MAIN',APChar,ImageIndex);
                 if APChar ='True' then
                  IsEnable := true else

                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);

              end ;
          end;
         //    if not IsEnable then
         //       raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not enabled.' );

      end else
         raise Exception.create('Plugin : ' + ExtractFilePath(Application.ExeName) + 'plug_ins' + PathDelim + Inparams.ParamByName('PLUGIN').AsString +'.'+ PluginsDLLName +' not found or loaded.' );

      Result := aplugin.aLoadFormPlugin(Application,'MAIN') ;

      if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;
 //     AMessage := 'EDIT=' +  Inparams.ParamByName('LASTID').AsString  ;
 //     aplugin.aMessageFormPlugin(Result,PChar(AMessage));
end;

{ twf_TfmMain }

constructor twf_TfmMain.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'main';
  Description := 'Main functions it just one now "close year".';
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ACTION' ;
        DataType := ftString ;
        Size := 255 ;
        Value := 'CLOSEYEAR' ;
     end;

end;

procedure twf_TfmMain.ExtraClick(sender: TObject);
begin
   TForm(TButton(sender).Parent).ModalResult := mrok ;
   Self.OnInternalProgress(sender);
end;

procedure twf_TfmMain.WorkflowEnd(AForm: TForm);
begin
  inherited;
  if  Inparams.ParamByName('ACTION').AsString  = 'CLOSEYEAR' then
    if AForm.ModalResult = mrOk then
       begin
          DoYearEnd(true);
       end;

  AForm.Free ;
end;

function twf_TfmMain.WorkFlowStart: TForm;
begin
  if  Inparams.ParamByName('ACTION').AsString  = 'CLOSEYEAR' then
      begin
          result := TForm.Create(self);
          with TButton.Create(Result) do
             begin
                Parent := Result ;
                caption := 'Run' ;
                Top := Result.Height div 2 ;
                Left := (Result.Width div 2)  ;
                Width := 120 ;
                OnClick := self.ExtraClick ;
             end;
      end else
      begin
        if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;


      end;
end;

procedure TfmMain.Workflowsetup1Click(Sender: TObject);

begin
   dmWorkflowData.InitForDatabase ;
   fmWorkflow := TfmWorkflow.Create(Application);
  try

   fmWorkflow.ShowModal ;
   finally
     FreeAndNil(fmWorkflow);
   end;


end;

{ twf_TfmMainSetup }

constructor twf_TfmMainSetup.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'setup-data';
  Description := 'Access setupdata like accesscontrol, batchtypes atc. set boolean value to true for the setupscreen you want to show.' +
  #13+#10 +'COMPDATA = Show Company data screen' +
  #13+#10 +'ACCESSCONTROL = Show access control screen' +
  #13+#10 +'BATCHTYPE = Show batchtypes screen' +
  #13+#10 +'FINCATS = Show financials categories screen' +
  #13+#10 +'PERIODS = Show periods setup screen' +
  #13+#10 +'POSSETUP = Show posssetup screen' +
  #13+#10 +'DOCSETUP = Show docsetup screen' ;
  with Inparams.Add as TParam do
     begin
        Name := 'COMPDATA' ;
        DataType := ftBoolean ;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ACCESSCONTROL' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'BATCHTYPE' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FINCATS' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PERIODS' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'POSSETUP' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
 with Inparams.Add as TParam do
     begin
        Name := 'DOCSETUP' ;
        DataType := ftBoolean ;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TfmMainSetup.WorkflowEnd(AForm: TForm);
begin
  inherited;
  Aform.close ;
  if ( Aform is TfmDocumentSetup) then
     begin
      fmDocumentSetup := Nil ;
     end;
  AForm.Free ;
end;

function twf_TfmMainSetup.WorkFlowStart: TForm;
var
 aform : TForm ;
begin
 try
 if Inparams.ParamByName('COMPDATA').AsBoolean then
   begin
    Aform := TfmCompanyInfo.Create(self) ;
    TfmCompanyInfo(Aform).ButtonPanel.Align := alTop ;
    TfmCompanyInfo(Aform).BtnOk.Left := 10 ;
    TfmCompanyInfo(Aform).BtnCancel.Left := 10 + TfmCompanyInfo(Aform).BtnOk.Left + TfmCompanyInfo(Aform).BtnOk.Width ;
   end else
 if Inparams.ParamByName('ACCESSCONTROL').AsBoolean then
    begin
       Aform := TfmAccessControl.Create(self) ;
       TfmAccessControl(Aform ).BtnClose.Visible := False ;
       TfmAccessControl(Aform ).ButtonPanel.Align := alTop ;
    end else
 if Inparams.ParamByName('BATCHTYPE').AsBoolean then
     begin
       Aform := TfmBatchTypes.Create(self)  ;
       TfmBatchTypes(Aform ).ButtonPanel.Visible := False ;
     end else
    if Inparams.ParamByName('FINCATS').AsBoolean then
      begin
       Aform := TfmFinancialCategories.Create(self)  ;
       TfmFinancialCategories(Aform ).BtnCancel.Visible := False ;
       end else
    if Inparams.ParamByName('POSSETUP').AsBoolean then
    begin
    Aform := TfmPosSetup.Create(self)

    end else
    if Inparams.ParamByName('DOCSETUP').AsBoolean then
    begin
    Aform := TfmDocumentSetup.Create(self) ;

    TfmDocumentSetup(Aform).ButtonPanel.Visible := False ;
    //TfmDocumentSetup(Aform).PageControl1.Height := Screen.Height - 400 ;
    end else
    begin           // def periods
      Aform := TfmPeriods.Create(self);
      TfmPeriods(Aform ).BtnCancel.Visible := False ;
    end;
      Aform.parent := self.parent ;
      Aform.Align := alClient ;
      Aform.BorderStyle := bsNone ;
      Aform.Show ;

 Result := aform ;

  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;

 Except
   on e: Exception do
    begin
       aform.free ;
       raise Exception.Create('Workflow:'+ Displayname +'->' +  e.Message );
    end;
 end;
end;

procedure TfmMain.Currencies1Click(Sender: TObject);
begin
  fmEditCurrencies := TfmEditCurrencies.Create(self);
  try
     fmEditCurrencies.ShowModal;
  finally
     FreeAndNil(fmEditCurrencies);
  end;
end;

initialization
  TcEmail := TEmailClient.Create(Nil);
  ApplicationPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  PrnVars.PrinterIndex:=-1;
  PrnVars.NumCopies:=1;
  PrnVars.Pages:='';
  EmailList:=TstringLIst.Create;
  twf_TfmMainPlugins.Create(nil);
  twf_TfmMainSetup.Create(nil);
  twf_TfmMain.Create(nil);
finalization
 FreeAndNil(EmailList);
  FreeAndNil(TcEmail);



end.




