(*
  Id: OSCommerceImport.dpr ,v 1 2004/09/20 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
library ECommerceImport;

uses
  FastMM4,
  MidasMemPatch in '..\..\..\sources\pluginsShared\midasmempatch.pas',
  Forms,
  windows,
  Dialogs,
  UMainOSCommerceImport in '..\..\..\plugins\closedplugins\osFClosedSource\UMainOSCommerceImport.pas' {MainOSCommerceImport},
  UDMOSCommerceImport in '..\..\..\plugins\closedplugins\osFClosedSource\UDMOSCommerceImport.pas' {DMOSCommerceImport: TDataModule},
  ULoginMySql in '..\..\..\plugins\closedplugins\osFClosedSource\ULoginMySql.pas' {LoginMySql},
  UPluginsSharedUnit in '..\..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas',
  TcashClasses in '..\..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  UDMTCCoreLink in '..\..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  OSFGeneralRoutines in '..\..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  osfLookup in '..\..\..\sources\pluginsShared\osfLookup.pas' {osfLookup},
  janStrings in '..\..\..\sources\pluginsShared\janstrings.pas',
  janXMLParser2 in '..\..\..\sources\pluginsShared\janXMLparser2.pas',
  janXPathTokenizer in '..\..\..\sources\pluginsShared\janXPathTokenizer.pas',
  JvMemoryDataset in '..\..\..\sources\pluginsShared\JvMemoryDataset.pas',
  UReportManager in '..\..\..\plugins\reportman\viewer\UReportManager.pas' {ReportManager},
  UDMReportsGlobals in '..\..\..\sources\OSFinancials\ReportsDll\Newforms\UDMReportsGlobals.pas' {DMReportsGlobals},
  UDMCoreDocData in '..\..\..\sources\OSFinancials\Shared\UDMCoreDocData.pas' {DMCoreDocData: TDataModule};

{$E .xpt}

{$R *.res}
exports
  OSFMenuPlugin ;

begin

end.
