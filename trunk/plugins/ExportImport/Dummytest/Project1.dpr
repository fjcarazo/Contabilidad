program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  JvMemoryDataset in '..\..\pluginsShared\JvMemoryDataset.pas',
  janXPathTokenizer in '..\..\pluginsShared\janXPathTokenizer.pas',
  janstrings in '..\..\pluginsShared\janstrings.pas',
  janXMLparser2 in '..\..\pluginsShared\janXMLparser2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
