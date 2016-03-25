program Conversion_osf1;

uses
  fastmm4,
  Forms,
  UMainConversionOsf1 in 'UMainConversionOsf1.pas' {FormMainConversion},
  TcashClasses in '..\..\sources\OSFinancials\Shared\TcashClasses.pas',
  OSFGeneralRoutines in '..\..\sources\OSFinancials\Shared\OSFGeneralRoutines.pas',
  UDMTCCoreLink in '..\..\sources\pluginsShared\UDMTCCoreLink.pas' {DMTCCoreLink: TDataModule},
  UConnectionClass in '..\..\sources\OSFinancials\Shared\UConnectionClass.pas',
  UDMCoreData in '..\..\sources\OSFinancials\Shared\UDMCoreData.pas' {DMCoreData: TDataModule},
  ConvTOX in '..\..\sources\OSFinancials\Shared\ConvTOX.pas',
  NewProgress in '..\..\sources\OSFinancials\Shared\NewProgress.pas' {fmNewProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMTCCoreLink, DMTCCoreLink);
  Application.CreateForm(TFormMainConversion, FormMainConversion);
  Application.Run;
end.
