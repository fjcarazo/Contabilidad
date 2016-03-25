(*
  Id: OSCommerceImport.dpr ,v 1 2004/09/20 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
library OSCommerceImport;

uses
  FastMM4,
  Forms,
  windows,
  Dialogs,
  UMainOSCommerceImport in 'UMainOSCommerceImport.pas' {MainOSCommerceImport},
  UDMOSCommerceImport in 'UDMOSCommerceImport.pas' {DMOSCommerceImport: TDataModule},
  ULoginMySql in 'ULoginMySql.pas' {LoginMySql},
  UPluginsSharedUnit in '..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas',
  TcashClasses in '..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  UDMTCCoreLink in '..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  OSFGeneralRoutines in '..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  osfLookup in '..\..\sources\pluginsShared\osfLookup.pas' {osfLookup},
  janStrings in '..\..\sources\pluginsShared\janstrings.pas',
  janXMLParser2 in '..\..\sources\pluginsShared\janXMLparser2.pas',
  janXPathTokenizer in '..\..\sources\pluginsShared\janXPathTokenizer.pas',
  HtmlHelpAPI in '..\..\sources\OSFinancials\Shared\HtmlHelpAPI.pas';

{$E .osc}

{$R *.res}
exports
  OSFMenuPlugin ;

begin

end.
