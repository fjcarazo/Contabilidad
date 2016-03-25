program DataAccess;

uses
  Forms,
  UMainDataAccess in 'UMainDataAccess.pas' {MainDataAccess};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainDataAccess, MainDataAccess);
  Application.Run;
end.
