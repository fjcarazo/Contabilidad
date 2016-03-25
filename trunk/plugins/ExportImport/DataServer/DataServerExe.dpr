program DataServerExe;

uses
  Forms,
  UFormDataserver in 'UFormDataserver.pas' {FormDataserver},
  UDMDataserver in 'UDMDataserver.pas' {DMDataserver: TDataModule},
  JvMemoryDataset in '..\..\..\sources\pluginsShared\JvMemoryDataset.pas',
  janStrings in '..\..\..\sources\pluginsShared\janstrings.pas',
  janXMLParser2 in '..\..\..\sources\pluginsShared\janXMLparser2.pas',
  janXPathTokenizer in '..\..\..\sources\pluginsShared\janXPathTokenizer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormDataserver, FormDataserver);
  Application.Run;
end.
