program Conversiontc4;

uses
  fastmm4,
  Forms,
  UMainConversiontc4 in 'UMainConversiontc4.pas' {FormMainConversion},
  TcashClasses in '..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UDMTCCoreLink in '..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  UConnectionClass in '..\..\sources\OSFinancials\Shared\UConnectionClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMainConversion, FormMainConversion);
  Application.CreateForm(TDMTCCoreLink, DMTCCoreLink);
  Application.Run;
end.
