unit UGeneosFSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UReportBasis, StdCtrls, Buttons, ExtCtrls,UOSFVisuals;

type
  TfmGenOsfSearch = class(TFormReportOptionsBase)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    FaReport: String;
    procedure SetaReport(const Value: String);
    { Private declarations }
  public
    AsearchPanel : TSearchPanel ;
    property aReport : String  read FaReport write SetaReport;
    { Public declarations }
  end;

var
  fmGenOsfSearch: TfmGenOsfSearch;

implementation

uses UDMReportsGlobals, UDMTCCoreLink , math;



{$R *.dfm}

procedure TfmGenOsfSearch.FormCreate(Sender: TObject);
begin
  inherited;
  AsearchPanel := TSearchPanel.Create(self) ;
  AsearchPanel.Parent := self ;
  AsearchPanel.Align := alclient ;
  AsearchPanel.Rightpanel.Visible := false ;
end;

procedure TfmGenOsfSearch.FormDestroy(Sender: TObject);
begin
  AsearchPanel.free ;
  inherited;
 //
end;

procedure TfmGenOsfSearch.SetaReport(const Value: String);
   var
    AStream : TFileStream ;
begin
  FaReport := Value;
  AsearchPanel.SetLookupType(UpperCase(ChangeFileExt(ExtractFileName(FaReport),'')));
  if AsearchPanel.aSearchCollection.Count = 0 then
  if FileExists(ChangeFileExt( FaReport ,'.dfm')) then
     begin
       AStream := TFileStream.Create(ChangeFileExt( FaReport ,'.dfm'),fmShareDenyNone) ;
       try
          AStream.ReadComponent(AsearchPanel);
          AsearchPanel.BuildGui;
       finally
          AStream.free ;
       end;

     end;
  AsearchPanel.Parent := nil ;
  AsearchPanel.Parent := self ;
  // AsearchPanel.Invalidate ;
  Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AsearchPanel.DefSql,0)); 
end;

procedure TfmGenOsfSearch.BtnOkClick(Sender: TObject);
var
 params , FileName : String ;
 ShowType : Integer ;
begin


  inherited;
  ShowType := GetPrintType ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(RandomRange(0,999999)) +'.pdf' ;
    end;


  params := AsearchPanel.Values ;
   AsearchPanel.SaveCollection ;

  DMReportsGlobals.ShowReport(aReport,Caption,params,ShowType,FileName,true);
end;



end.
