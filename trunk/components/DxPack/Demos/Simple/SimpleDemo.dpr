program SimpleDemo;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Design eXperience II - Simple Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
