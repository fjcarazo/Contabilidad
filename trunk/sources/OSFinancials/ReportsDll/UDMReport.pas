unit UDMReport;

interface

uses
  SysUtils, Classes,windows,controls,Zconnection,forms,rptypeval,buttons,uni;

type
  HWND = type LongWord;
  TDMReportsModule = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMReportsModule: TDMReportsModule;

function HASREPORT (Areportname,Language : PChar) : Integer ; stdcall ;
function RUNREPORT (ADatabase : TUniconnection; Areportname ,Language : PChar;AApplication : HWnd;AApplicationPointer : TComponent) : TModalresult ; stdcall ;
function RUNDOCUMENT (ADatabase : TUniconnection;Areportname ,Language,Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies : Integer) : TModalresult ; stdcall ;



implementation

uses BatchReportParams, UDMTCCoreLink, UDMReportsGlobals,
  BalanceReportOptions, TaxReportParams, BackorderParams,dialogs,
  UGLHistorical, UGeneosFSearch;

{$R *.dfm}


function HASREPORT (Areportname,Language : PChar) : Integer ; stdcall ;
begin

  result := 0 ;
  if  Areportname = 'BATCHREPORT' then
    begin
     result := 1 ;
    end else
    if  Areportname = 'GL_BALANCE' then
    begin
     result := 1 ;
    end else
    if  Areportname = 'TAX' then
    begin
     result := 1 ;
    end else
    if  Areportname = 'STOCKDYNAMIC' then
    begin
     result := 1 ;
    end else
    if  Areportname = 'BACKORDER' then
    begin
     result := 1 ;
    end else
    if  Areportname = 'HISTORICAL' then
    begin
     result := 1 ;
    end else
    if FileExists(ExtractFilePath(Application.ExeName)+'plug_ins\genrep' + Areportname+'.rep') then
      result := 1
    else
    if FileExists(TDMTCCoreLink.GetLocalPluginDir+'genrep' + Areportname+'.rep') then
      result := 1  
    else
    if FileExists(TDMTCCoreLink.GetLocalPluginDir+'reports\userreports' + Areportname+'\'+ChangeFileExt(ExtractFileName(Areportname+'.rep'),'')+'.dfm') then
      result := 1 ;


end;
function RUNREPORT (ADatabase : TUniconnection; Areportname ,Language : PChar;AApplication : HWnd;AApplicationPointer : TComponent) : TModalresult ; stdcall ;


begin
// Application.Handle := AApplication ;

 Result := 2 ;

      DMTCCoreLink := TDMTCCoreLink.create(nil);
       try
        DMTCCoreLink.AApplication :=  AApplicationPointer ;
        DMReportsGlobals := TDMReportsGlobals.Create((nil));
        CustomRoutine :=  HandelReport ;
         try

    if FileExists(ExtractFilePath(Application.ExeName)+'plug_ins\genrep' + Areportname+'.rep') then
            begin

              fmGenOsfSearch := TfmGenOsfSearch.Create(Application);
               try
                fmGenOsfSearch.aReport := ExtractFilePath(Application.ExeName)+'plug_ins\genrep' + Areportname+'.rep' ;
                result := fmGenOsfSearch.ShowModal ;
               finally
                fmGenOsfSearch.free ;
               end;
            end else
    if FileExists(TDMTCCoreLink.GetLocalPluginDir+'genrep' + Areportname+'.rep') then
            begin

              fmGenOsfSearch := TfmGenOsfSearch.Create(Application);
               try
                fmGenOsfSearch.aReport := TDMTCCoreLink.GetLocalPluginDir +'genrep' + Areportname+'.rep' ;
                result := fmGenOsfSearch.ShowModal ;
               finally
                fmGenOsfSearch.free ;
               end;
            end else
    if FileExists(TDMTCCoreLink.GetLocalPluginDir+'reports\userreports' + Areportname+'\'+ChangeFileExt(ExtractFileName(Areportname+'.rep'),'')+'.rep') then
            begin
              fmGenOsfSearch := TfmGenOsfSearch.Create(Application);
               try
                fmGenOsfSearch.aReport := TDMTCCoreLink.GetLocalPluginDir +'reports\userreports' + Areportname+'\'+ChangeFileExt(ExtractFileName(Areportname+'.rep'),'')+'.rep' ;
                result := fmGenOsfSearch.ShowModal ;
               finally
                fmGenOsfSearch.free ;
               end;
            end else
     if  Areportname = 'HISTORICAL' then
            begin
              fmGLHistorical:= tfmGLHistorical.Create(Application);
               try
                result := fmGLHistorical.ShowModal ;
               finally
                fmGLHistorical.free ;
               end;
            end else
               if  Areportname = 'BACKORDER' then
            begin
              fmBackorderParams:= TfmBackorderParams.Create(Application);
               try
                result := fmBackorderParams.ShowModal ;
               finally
                fmBackorderParams.free ;
               end;
            end else    // end batch report

          if  Areportname = 'BATCHREPORT' then
            begin
              fmBatchReportParams:= TfmBatchReportParams.Create(Application);
               try
                result := fmBatchReportParams.ShowModal ;
               finally
                fmBatchReportParams.free ;
               end;
            end else    // end batch report
          if  Areportname = 'GL_BALANCE' then
            begin
              fmBalanceSheetOptions := TfmBalanceSheetOptions.Create(Application);
               try
                result := fmBalanceSheetOptions.ShowModal ;
               finally
                fmBalanceSheetOptions.free ;
               end;
            end else   // end balance report
          if  Areportname = 'TAX' then
            begin

              fmTaxReportParams := TfmTaxReportParams.Create(Application);
               try
                result := fmTaxReportParams.ShowModal ;
               finally
                fmTaxReportParams.free ;
               end;
            end ;
       finally
         DMReportsGlobals.free ;
       end;
    finally
      FreeAndNil(DMTCCoreLink);
    end;
end;

function RUNDOCUMENT (ADatabase : TUniconnection;Areportname ,Language,Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies : Integer) : TModalresult ; stdcall ;
begin
 // showmessage('yes');
  result := 0 ;
end;


end.
 
