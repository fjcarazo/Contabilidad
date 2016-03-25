library ExportImport;

uses
  FastMM4,

  Forms,
  UDMTCCoreLink in '..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  TcashClasses in '..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  UMainExpImp in 'UMainExpImp.pas' {FormMainExpImp},
  UDMAccountStockDocument in '..\..\sources\pluginsShared\UDMAccountStockDocument.pas' {DMAccountStockDocument: TDataModule},

  janStrings in '..\..\sources\pluginsShared\janstrings.pas',
  janXMLParser2 in '..\..\sources\pluginsShared\janXMLparser2.pas',
  janXPathTokenizer in '..\..\sources\pluginsShared\janXPathTokenizer.pas',
  UCDSLinkRoutines in '..\..\sources\pluginsShared\UCDSLinkRoutines.pas' {DMCDSLinkRoutines: TDataModule},
  UDMHandelRawdata in 'UDMHandelRawdata.pas' {DMHandelRawdata: TDataModule},
  osfLookup in '..\..\sources\pluginsShared\osfLookup.pas' {osfLookup},
  HtmlHelpAPI in '..\..\sources\OSFinancials\Shared\HtmlHelpAPI.pas';

{$E of4}

{$R *.res}
exports
  OSFMenuPlugin,OSFGetPluginInfo ;

begin

end.
