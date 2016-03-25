program WinXPBarDemo;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  dxWinXPBar in '..\dxWinXPBar.pas',
  dxRegister in '..\dxRegister.pas',
  dxContainer in '..\dxContainer.pas',
  dxCore in '..\dxCore.pas',
  dxCoreUtils in '..\dxCoreUtils.pas',
  ZnCtrls in '..\..\..\..\..\..\Zion\ZnCtrls.pas',
  znPanels in '..\..\..\..\..\..\Zion\znPanels.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
