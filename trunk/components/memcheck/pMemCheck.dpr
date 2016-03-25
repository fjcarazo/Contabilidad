program pMemCheck;

uses
  //FastMM4, // AV on FinalizationUnits
  //FastObj, // Not detected object creation
  MemCheck,
  //ExceptDlg,
  Windows,
  SysUtils,
  Classes,
  Forms,
  Dialogs,
  uMemCheck in 'uMemCheck.pas' {Form1};

{$R *.res}

begin
  //MemChk;
  //MemCheckInit('111');
  //MemCheckInit('100');
  //MemCheckInitByFilter({MClass:}True, {MUser:}False, {MReallocedUser:}False);

  {while True do
  begin
    TStringList.Create;
    //ShowMessage('Next...');
    Exit;
  end; {}

  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.Title := 'Demo: MemCheck';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
