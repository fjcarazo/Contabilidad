library Reportman;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }



{$DEFINE USEZEOS}



uses
  FastMM4,
  SysUtils,
  Classes,
  UReportManager in 'UReportManager.pas' {ReportManager},
  UDMTCCoreLink in '..\..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  TcashClasses in '..\..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  UDMReportsGlobals in '..\..\..\sources\OSFinancials\ReportsDll\Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  HtmlHelpAPI in '..\..\..\sources\OSFinancials\Shared\HtmlHelpAPI.pas',
  UPluginsSharedUnit in '..\..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas',
  UOSFVisuals in '..\..\..\sources\pluginsShared\UOSFVisuals.pas',
  ULookupPeriods in '..\..\..\sources\pluginsShared\ULookupPeriods.pas' {FrameLookupPeriods: TFrame},
  osfLookup in '..\..\..\sources\pluginsShared\osfLookup.pas',
  UGenSearch in '..\..\..\sources\pluginsShared\UGenSearch.pas' {GenSearch},
  UMsgBox in '..\..\..\sources\pluginsShared\UMsgBox.pas' {MyMsgBox},
  UDmQuantumGridDefs in '..\..\..\sources\pluginsShared\UDmQuantumGridDefs.pas' {dmQuantumGridDefs: TDataModule};

{$R *.res}
  exports
    HASREPORT, RUNREPORT, RUNDOCUMENT;
begin
end.
