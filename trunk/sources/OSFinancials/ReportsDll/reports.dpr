library reports;


uses
  fastmm4,
  SysUtils,
  Classes,
  UDMReport in 'UDMReport.pas' {DMReportsModule: TDataModule},
  BatchReportParams in 'Newforms\BatchReportParams.pas' {fmBatchReportParams},
  UDMTCCoreLink in '..\..\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  TcashClasses in '..\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\Shared\OSFGeneralRoutines.pas',
  HtmlHelpAPI in '..\Shared\HtmlHelpAPI.pas',
  UConnectionClass in '..\Shared\UConnectionClass.pas',
  UDMReportsGlobals in 'Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  BalanceReportOptions in 'Newforms\BalanceReportOptions.pas' {fmBalanceSheetOptions},
  UMsgBox in '..\..\pluginsShared\UMsgBox.pas' {MyMsgBox},
  UReportBasis in 'Newforms\UReportBasis.pas' {FormReportOptionsBase},
  TaxReportParams in 'Newforms\TaxReportParams.pas' {fmTaxReportParams},
  USetPrinters in '..\Shared\USetPrinters.pas' {frSetPrinter},
  AccountListingOptions in 'AccountListingOptions.pas' {fmAccountListingOptions},
  osfLookup in '..\..\pluginsShared\osfLookup.pas' {osfLookup},
  BackorderParams in 'Newforms\BackorderParams.pas' {fmBackorderParams},
  UGLHistorical in 'Newforms\UGLHistorical.pas' {fmGLHistorical},
  UGeneosFSearch in 'Newforms\UGeneosFSearch.pas' {fmGenOsfSearch},
  UOSFVisuals in '..\..\pluginsShared\UOSFVisuals.pas',
  ULookupPeriods in '..\..\pluginsShared\ULookupPeriods.pas' {FrameLookupPeriods: TFrame};

{$R *.res}
  exports
    HASREPORT, RUNREPORT, RUNDOCUMENT;
begin
end.
 