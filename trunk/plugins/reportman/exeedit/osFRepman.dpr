program osFRepman;

uses
  fastmm4,
  Forms,
  Ulogindb in 'Ulogindb.pas' {fmLoginDB},
  MainReportMan in '..\editor\MainReportMan.pas' {frMainReportMan},
  UPluginsSharedUnit in '..\..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas',
  TcashClasses in '..\..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  UDMTCCoreLink in '..\..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  OSFGeneralRoutines in '..\..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  UDmDummyDatabase in '..\..\closedplugins\ECommerce\ServiceApp\UDmDummyDatabase.pas' {dmDatabase: TDataModule},
  HtmlHelpAPI in '..\..\..\sources\OSFinancials\Shared\HtmlHelpAPI.pas',
  UDMReportsGlobals in '..\..\..\sources\OSFinancials\ReportsDll\Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  UDesignSearch in '..\..\closedplugins\osFFreeField\UDesignSearch.pas' {DesignSearch},
  USearchTrans in '..\..\..\sources\OSFinancials\Shared\USearchTrans.pas' {FLookupTrans},
  UReportManager in '..\viewer\UReportManager.pas' {ReportManager};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfmLoginDB, fmLoginDB);
  Application.Run;
end.
