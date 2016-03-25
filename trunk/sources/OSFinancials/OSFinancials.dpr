(*
  Origian : Turbocash
  changed 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
program OSFinancials;

uses
  fastmm4,
  Midas,
  pngimage,
  UosfResources,
  Forms,
  classes,
  Controls,
  Windows,
  Dialogs,
  SysUtils,
  Main in 'General\Main.pas' {fmMain},
  Database in 'Books\Database.pas' {dmDatabase: TDataModule},
  About in 'General\About.pas' {fmAbout},
  OpenASetOfBooks in 'Books\OpenASetOfBooks.pas' {fmOpenASetOfBooks},
  DeleteASetOfBooks in 'Books\DeleteASetOfBooks.pas' {fmDeleteASetOfBooks},
  ChangeBooksProperties in 'Books\ChangeBooksProperties.pas' {fmChangeBooksProperties},
  IntroScreen in 'General\IntroScreen.pas' {fmIntroScreen},
  Password in 'General\Password.pas' {fmPassword},
  AccessControl in 'General\AccessControl.pas' {fmAccessControl},
  Salesman in 'Documents\Salesman.pas' {fmSalesman},
  CompanyInfo in 'General\CompanyInfo.pas' {fmCompanyInfo},
  Groups in 'Documents\Groups.pas' {fmGroups},
  Periods in 'Books\Periods.pas' {fmPeriods},
  DocSetup in 'Documents\DocSetup.pas' {fmDocumentSetup},
  StockInfo in 'Documents\StockInfo.pas' {fmStockInfo},
  Directory in 'General\Directory.pas' {fmDirectory},
  SelectBatchType in 'Batch\SelectBatchType.pas' {fmSelectBatchType},
  SetAbbreviations in 'Batch\SetAbbreviations.pas' {fmSetAbbreviations},
  SelectUser in 'General\SelectUser.pas' {fmSelectUser},
  LanguageChoice in 'Books\LanguageChoice.pas' {fmLangChoice},
  HtmlHelpAPI in 'Shared\HtmlHelpAPI.pas',
  Debtor in 'Documents\Debtor.pas' {fmDebtor},
  TAccountView in 'General\TAccountView.pas' {fmTAccountView},
  StockEntry in 'Documents\StockEntry.pas' {fmStockEntry},
  InvoiceEntryGrid in 'Documents\InvoiceEntryGrid.pas' {fmInvoiceEntryGrid},
  ConfirmDocs in 'Documents\ConfirmDocs.pas' {fmConfirmDocs},
  BatchPeriodTotals in 'Batch\BatchPeriodTotals.pas' {FrmBatchPeriodTotals},
  BatchOptions in 'Batch\BatchOptions.pas' {fmBatchOptions},
  BatchPayDebtors in 'Batch\BatchPayDebtors.pas' {frBatchPayDebtors},
  BatchProcessMenu in 'Batch\BatchProcessMenu.pas' {fmBatchProcessMenu},
  BatchEntry in 'Batch\BatchEntry.pas' {fmBatchEntry},
  BatchTypes in 'Batch\BatchTypes.pas' {fmBatchTypes},
  ReverseBatch in 'Batch\ReverseBatch.pas' {FormReverseBatch},
  BatchPayCreditors in 'Batch\BatchPayCreditors.pas' {frPayCreditors},
  BatchEntryBank in 'Batch\BatchEntryBank.pas' {fmBatchEntryBank},
  DataEntry in 'Books\DataEntry.pas' {fmDataEntry},
  SaveAs in 'Books\SaveAs.pas' {fmSaveAs},
  CentralSearch in 'General\CentralSearch.pas' {fmInvestigator},
  UMsgBox in '..\pluginsShared\UMsgBox.pas' {MyMsgBox},
  EvaluateExpressions in 'Shared\EvaluateExpressions.pas',
  SendEmailReport in 'General\SendEmailReport.pas' {fmSendEmailReport},
  EnterLinkAmount in 'Batch\EnterLinkAmount.pas' {fmEnterLinkAmount},
  UnReconcileOptions in 'Batch\UnReconcileOptions.pas' {fmUnReconcileOptions},
  OpenLink in 'Batch\OpenLink.pas' {fmOpenLink},
  UpdateInvoice in 'Batch\UpdateInvoice.pas' {fmUpdateInvoice},
  InvoiceHistory in 'Documents\InvoiceHistory.pas' {fmInvoiceHistory},
  DataIntegrityCheck in 'Reports\DataIntegrityCheck.pas' {fmDataIntegrityCheck},
  GetReportDate in 'Reports\GetReportDate.pas' {fmGetDateValue},
  GenMutliEntry in 'Batch\GenMutliEntry.pas' {fmGenMutliEntry},
  EditReceipts in 'Batch\EditReceipts.pas' {fmEditReceipts},
  SelectAccountType in 'Account\SelectAccountType.pas' {frmSelectAccountType},
  TransfertTrans in 'Batch\TransfertTrans.pas' {frmTransfertTrans},
  Support in 'General\Support.pas' {fmSupport},
  FinancialCategories in 'Account\FinancialCategories.pas' {fmFinancialCategories},
  ConvTOX in 'Shared\ConvTOX.pas',
  OpenItemSelection in 'Batch\OpenItemSelection.pas' {fmOpenItemSelection},
  ZipBackupRestore in 'Books\ZipBackupRestore.pas' {fmZipBackupRestore},
  CreationCompWiz in 'Books\CreationCompWiz.pas' {fmCreationCompWiz},
  Calculator in 'General\Calculator.pas' {frmCalculator},
  LotusWKx in 'Shared\LotusWKx.pas',
  CustomLang in 'Books\CustomLang.pas' {fmCustomLang},
  Read123 in 'Shared\Read123.pas',
  Progress in 'Shared\Progress.pas' {fmProgress},
  ExportToSpreadSheet in 'Shared\ExportToSpreadSheet.pas',
  ExchangeTCData in 'Shared\ExchangeTCData.pas',
  ExportTcData in 'Books\ExportTcData.pas' {fmExportData},
  DataImport in 'Books\DataImport.pas' {fmDataImport},
  UImportCheck in 'Shared\UImportCheck.pas' {ImportCheck},
  SpreadSheetsIO in 'Shared\SpreadSheetsIO.pas',
  PosSetup in 'Documents\PosSetup.pas' {fmPosSetup},
  PosRoutines in 'Shared\PosRoutines.pas',
  PosEntry in 'Documents\PosEntry.pas' {fmPosInvoiceEntry},
  PosPayments in 'Documents\PosPayments.pas' {fmPosPayments},
  PosPassword in 'Documents\PosPassword.pas' {fmPosPassword},
  PosInvoiceInfo in 'Documents\PosInvoiceInfo.pas' {fmPosInvoiceInfo},
  PosCashup in 'Documents\PosCashup.pas' {fmPosCashup},
  PosReportOptions in 'Reports\PosReportOptions.pas' {fmPosReportOptions},
  XRoutines in 'Shared\XRoutines.pas',
  GlobalFunctions in 'Shared\GlobalFunctions.pas',
  LedgerRoutines in 'Shared\LedgerRoutines.pas',
  DatabaseAccess in 'Shared\DatabaseAccess.pas',
  TcashClasses in 'Shared\TcashClasses.pas',
  TcVariables in 'Shared\TcVariables.pas',
  NewLookup in 'Account\NewLookup.pas' {fmPosLookup},
  Fonts in 'General\Fonts.pas' {fmFonts},
  WelcomHelp in 'General\WelcomHelp.pas' {FrmWelcome},
  MainWizard in 'General\MainWizard.pas' {fmMainWizard},
  VpTCEvntEditDlg in 'Planit\VpTCEvntEditDlg.pas' {DlgEventTCEdit},
  VpTaskTCEditDlg in 'Planit\VpTaskTCEditDlg.pas' {TaskTCEditForm},
  VpResTCEditDlg in 'Planit\VpResTCEditDlg.pas' {ResEditTCForm},
  VpContactTCEditDlg in 'Planit\VpContactTCEditDlg.pas' {ContactTCEditForm},
  TCDayPlanner in 'Planit\TCDayPlanner.pas' {PlanerMainForm},
  ExVpRptSetup in 'Planit\ExVpRptSetup.pas' {frmReportSetup},
  ExVpAbout in 'Planit\ExVpAbout.pas' {frmAbout},
  VpTaskActionEditDlg in 'Planit\VpTaskActionEditDlg.pas' {FormTaskEditDlg},
  VpTCAlarmDlg in 'Planit\VpTCAlarmDlg.pas' {TCAlarmNotifyForm},
  ReconcileBank in 'Reports\ReconcileBank.pas' {fmReconcileBank},
  Registration in 'General\Registration.pas' {fmRegister},
  NewGlobalFunctions in 'Shared\NewGlobalFunctions.pas',
  AccountSelect in 'General\AccountSelect.pas' {frmAccountSelect},
  PaymentType in 'Batch\PaymentType.pas' {fmPaymentType},
  UPluginsSharedUnit in 'Shared\UPluginsSharedUnit.pas',
  UDMCoreDocData in 'Shared\UDMCoreDocData.pas' {DMCoreDocData: TDataModule},
  UDMCoreData in 'Shared\UDMCoreData.pas' {DMCoreData: TDataModule},
  OSFGeneralRoutines in 'Shared\OSFGeneralRoutines.pas',
  UConnectionClass in 'Shared\UConnectionClass.pas',
  NewProgress in 'Shared\NewProgress.pas' {fmNewProgress},
  UDMTCCoreLink in '..\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  USetPrinters in 'Shared\USetPrinters.pas' {frSetPrinter},
  UOSFVisuals in '..\pluginsShared\UOSFVisuals.pas',
  osfLookup in '..\pluginsShared\osfLookup.pas' {osfLookup},
  UAccountTreeView in 'Account\UAccountTreeView.pas' {AccountTreeView},
  UGeneralEditAccount in 'Account\UGeneralEditAccount.pas' {GeneralEditAccount},
  UFromToDates in 'Planit\UFromToDates.pas' {FormReportingDates},
  UDmCoreAccountData in 'Account\UDmCoreAccountData.pas' {DMCoreAccountData: TDataModule},
  ReconOptions in 'Reports\ReconOptions.pas' {fmReconOptions},
  FreeReportsUnit in 'Reports\FreeReportsUnit.pas' {frmFreeReports},
  DosTextPrint in 'Shared\DosTextPrint.pas',
  DosTextReports in 'Shared\DosTextReports.pas',
  CheckUnpost in 'General\CheckUnpost.pas' {fmCheckUnpost},
  janstrings in '..\pluginsShared\janstrings.pas',
  UMainJobProject in 'JobProject\UMainJobProject.pas' {JobProject},
  OSFinancials_TLB in 'OSFinancials_TLB.pas',
  UGenSearch in '..\pluginsShared\UGenSearch.pas' {GenSearch},
  UEditSpecialDays in 'Planit\UEditSpecialDays.pas' {fmEditSpecialDays},
  InvoicePayment in 'Shared\InvoicePayment.pas' {fmInvocePayment},
  UItemOptions in 'Documents\UItemOptions.pas' {ItemOptions},
  UDocSelectOptions in 'Documents\UDocSelectOptions.pas' {DocSelectOptions},
  UReportManager in '..\..\plugins\reportman\viewer\UReportManager.pas' {ReportManager},
  UPOSSHARED in '..\pluginsShared\UPOSSHARED.pas',
  ULocBatSerInput in 'Shared\ULocBatSerInput.pas' {LocBatSerInput},
  UEditAccountRef in '..\pluginsShared\UEditAccountRef.pas' {fmEditAccountRef},
  ULookupPeriods in '..\pluginsShared\ULookupPeriods.pas' {FrameLookupPeriods: TFrame},
  UCheckPlugins in '..\pluginsShared\UCheckPlugins.pas' {fmCheckPlugins},
  UDMReportsGlobals in 'ReportsDll\Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  UStockLinkDetail in 'Shared\UStockLinkDetail.pas' {StockLinkDetail},
  Uworkflowtoolbox in '..\..\plugins\closedplugins\workflow\Uworkflowtoolbox.pas' {fmWorkFlowToolBox},
  UWorkFlowHistory in '..\..\plugins\closedplugins\workflow\UWorkFlowHistory.pas' {fmWorkFlowHistory},
  UWorkFlowDatamodule in '..\..\plugins\closedplugins\workflow\UWorkFlowDatamodule.pas' {dmWorkflowData: TDataModule},
  UWorkFlowHandel in '..\..\plugins\closedplugins\workflow\UWorkFlowHandel.pas' {fmWorkFlowHandel},
  UWorkFlowExeCuteStep in '..\..\plugins\closedplugins\workflow\UWorkFlowExeCuteStep.pas' {fmWorkflowExecuteStep},
  Uworkflowsetup in '..\..\plugins\closedplugins\workflow\Uworkflowsetup.pas' {fmWorkflow},
  UEditCurrencies in 'General\UEditCurrencies.pas' {fmEditCurrencies},
  UOutLookEmailForm in '..\pluginsShared\UOutLookEmailForm.pas' {fmOutlookEmail},
  UDocRefLinks in '..\pluginsShared\UDocRefLinks.pas' {fmDocLinks},
  UEventList in 'Planit\UEventList.pas' {fmEventList},
  NetSetUp in 'General\NetSetUp.pas' {fmNetSetUp},
  UDmQuantumGridDefs in '..\pluginsShared\UDmQuantumGridDefs.pas' {dmQuantumGridDefs: TDataModule},
  UTranslateQuantumgrid in '..\pluginsShared\UTranslateQuantumgrid.pas',
  ContactListing in 'Documents\ContactListing.pas' {fmContactListing},
  BackOrdersOutstanding in 'Documents\BackOrdersOutstanding.pas' {fmBackOrdersOutstanding},
  ULookupGrids in 'Batch\ULookupGrids.pas' {fmLookupgrids},
  UNewDocdetails in 'Documents\UNewDocdetails.pas' {fmDocdetails},
  Lookup in 'Account\Lookup.pas' {FmLookup};

{ $ R *.TLB}

{$R *.RES}


var
  hMutex: THandle;
  Counter : Integer ;
  CanLoad : Boolean ;
  fmIntroScreen: TfmIntroScreen;
   MutexName : String ;
 

begin

  application.Title := 'Loading...';
  Application.CreateForm(TDMTCCoreLink, DMTCCoreLink);

  DMTCCoreLink.loadGlobalObject ;
  dmQuantumGridDefs := TdmQuantumGridDefs.create(application);
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[0].Description  := DMTCCoreLink.GetTextLangNoAmp(901017) ;
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[1].Description  :=DMTCCoreLink.GetTextLangNoAmp(901018) ;
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[2].Description  :=DMTCCoreLink.GetTextLangNoAmp(901019) ;
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[3].Description  :=DMTCCoreLink.GetTextLangNoAmp(901020) ;
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[4].Description  :=DMTCCoreLink.GetTextLangNoAmp(901021) ;
  dmQuantumGridDefs.osfTypePeriod.Properties.Items.Items[5].Description  :=DMTCCoreLink.GetTextLangNoAmp(901022) ;

  dmOsfResource := TdmOsfResource.create(Application);


  HMutex := 0 ;

  if not FileExists(ExtractFilePath(Application.ExeName) + 'plug_ins\Openbooks.tpd') then
  begin
  for Counter := 0 to 4 do
    begin
       MutexName := 'Global\OSFinancials'+ IntToStr(Counter) ;
       hMutex := CreateMutex(nil, True, pchar(MutexName));
       if GetLastError = ERROR_ALREADY_EXISTS then
       begin
          CanLoad := False ;
       end else
       begin
         CanLoad := true ;
         Break ;
       end;
    end;
  end else
  begin
     CanLoad := true ;
  end;
   if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
   Appname := ReadT3IniFile('Appconfig','Appname','TurboCASH')  +' '
   else
   Appname := ReadT3IniFile('Appconfig','Appname','osFinancials')+' ';


SetThreadLocale(LOCALE_USER_DEFAULT);
GetFormatSettings;


   MutexName :=   ReadT3IniFile('Appconfig','shortdateformat','');
   if MutexName <> '' then
     FormatSettings.shortdateformat := MutexName ;
   MutexName :=   ReadT3IniFile('Appconfig','DateSeparator','');
   if MutexName <> '' then
     FormatSettings.DateSeparator := MutexName[1]  ;

   MutexName :=   ReadT3IniFile('Appconfig','DecimalSeparator','');
   if MutexName <> '' then
     FormatSettings.DecimalSeparator := MutexName[1] ;

   MutexName :=   ReadT3IniFile('Appconfig','ThousandSeparator','');
   if MutexName <> '' then
     FormatSettings.ThousandSeparator := MutexName[1] ;

  if CanLoad then
  begin
    InitGlobalObject ;
    ReadAppConfig ;
    SaveOutput:=0;// Set to Screen when starting;
    Application.Initialize;
    ApplicationPath := UpperCase(IncludeTrailingPathDelimiter(Extractfilepath(Application.Exename)));
    fmIntroScreen := TfmIntroScreen.Create(application);
    fmIntroScreen.Show;
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
     Application.ProcessMessages ;
    fmIntroScreen.Gauge.AddProgress(10);
    fmIntroScreen.Gauge.AddProgress(20);
    dmDatabase := TdmDatabase.create(Application);
    DMTCCoreLink.AApplication := Application ;
    DMTCCoreLink.AssignConnectionToChilds(dmDatabase);
    fmIntroScreen.Gauge.AddProgress(30);
    Application.CreateForm(TfmMain, fmMain);
    fmMain.TrayIcon1.Hint := Appname ;
    fmIntroScreen.BringToFront ;
    FmMain.Update;
    Application.OnException:=fmMain.MyHandlExceptions;
    PrnVars.PrinterIndex:=-1;
    fmIntroScreen.Gauge.AddProgress(40);
    Application.CreateForm(TfmLangChoice, fmLangChoice);
    fmIntroScreen.Gauge.AddProgress(50);
    fmIntroScreen.Gauge.AddProgress(60);
    fmIntroScreen.Gauge.AddProgress(100);
    fmIntroScreen.Timer1.Enabled := true ;
    Application.Run;
  end
   else
   begin
    messagedlg(Appname +' is running more then 5 copies'#13#10'Cannot run an other copy on this machine please contact us for a version that can do this if you need it!',mtinformation,[mbOk],0);
   end;

   if HMutex <> 0 then CloseHandle(HMutex)

end.


