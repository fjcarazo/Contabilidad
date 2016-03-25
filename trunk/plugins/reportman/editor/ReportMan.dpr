library ReportMan;

uses
  FastMM4,
  Forms,
  MainReportMan in 'MainReportMan.pas' {frMainReportMan},
  UDMTCCoreLink in '..\..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  TcashClasses in '..\..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  UMsgBox in '..\..\..\sources\pluginsShared\UMsgBox.pas' {MyMsgBox},
  HtmlHelpAPI in '..\..\..\sources\OSFinancials\Shared\HtmlHelpAPI.pas',
  osfLookup in '..\..\..\sources\pluginsShared\osfLookup.pas' {osfLookup},
  UDMReportsGlobals in '..\..\..\sources\OSFinancials\ReportsDll\Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  UDesignSearch in '..\..\closedplugins\osFFreeField\UDesignSearch.pas' {DesignSearch},
  UOSFVisuals in '..\..\..\sources\pluginsshared\UOSFVisuals.pas',
  USearchTrans in '..\..\..\sources\OSFinancials\Shared\USearchTrans.pas' {FLookupTrans},
  UReportManager in '..\viewer\UReportManager.pas' {ReportManager},
  UPluginsSharedUnit in '..\..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas';

{$E of4}

{$R *.res}
exports
  OSFMenuPlugin ,OSFGetPluginInfo;

begin

end.
