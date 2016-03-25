program Registration;

uses
  Forms,
  Uregistration in 'Uregistration.pas' {Form1},
  janStrings in '..\trunk\sources\pluginsShared\janstrings.pas',
  wcrypt2 in 'Wcrypt2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
