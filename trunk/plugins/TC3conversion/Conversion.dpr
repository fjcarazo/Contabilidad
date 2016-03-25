program Conversion;

uses
  fastmm4,
  Forms,
  UMainConversion in 'UMainConversion.pas' {FormMainConversion},
  TcashClasses in '..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  UDMTCCoreLink in '..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  OSFGeneralRoutines in '..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UConnectionClass in '..\..\sources\OSFinancials\Shared\UConnectionClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMainConversion, FormMainConversion);
  Application.CreateForm(TDMTCCoreLink, DMTCCoreLink);
  Application.Run;
end.
