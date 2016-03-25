program osFOscService;

uses
  Forms,
  UMainServiceApp in 'UMainServiceApp.pas' {MainServiceApp},
  UDMOSCommerceImport in '..\UDMOSCommerceImport.pas' {DMOSCommerceImport: TDataModule},
  ULoginMySql in '..\ULoginMySql.pas' {LoginMySql},
  UMainOSCommerceImport in '..\UMainOSCommerceImport.pas' {MainOSCommerceImport},
  ULinkService in 'ULinkService.pas',
  UPluginsSharedUnit in '..\..\..\sources\OSFinancials\Shared\UPluginsSharedUnit.pas',
  TcashClasses in '..\..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  UDMTCCoreLink in '..\..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  OSFGeneralRoutines in '..\..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  osfLookup in '..\..\..\sources\pluginsShared\osfLookup.pas' {osfLookup},
  UDmDummyDatabase in 'UDmDummyDatabase.pas' {dmDatabase: TDataModule},
  janStrings in '..\..\..\sources\pluginsShared\janstrings.pas',
  janXMLParser2 in '..\..\..\sources\pluginsShared\janXMLparser2.pas',
  janXPathTokenizer in '..\..\..\sources\pluginsShared\janXPathTokenizer.pas',
  JvMemoryDataset in '..\..\..\sources\pluginsShared\JvMemoryDataset.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainServiceApp, MainServiceApp);
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.Run;
end.
