unit BackorderParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UReportBasis, StdCtrls, Buttons, ExtCtrls;

type
  TfmBackorderParams = class(TFormReportOptionsBase)
    Label3: TLabel;
    dbedtFromAccount: TEdit;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    dbedtToAccount: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
   FromID, ToID : Integer ;
   Procedure LoadReoprtOp;
    Procedure SaveReoprtOp ; 
    { Public declarations }
  end;

var
  fmBackorderParams: TfmBackorderParams;

implementation

uses OSFGeneralRoutines, UDMReportsGlobals, osfLookup, UDMTCCoreLink,math;

{$R *.dfm}

{ TFormReportOptionsBase1 }

procedure TfmBackorderParams.LoadReoprtOp;
begin
  FromID :=  DMTCCoreLink.ReadNwReportOp('BackordListingFromID',0);
  ToID :=  DMTCCoreLink.ReadNwReportOp('BackordListingToID',0);
  dbedtFromAccount.Text := TDataBaseStockRoutines.GetStockCode(FromID);
  dbedtToAccount.Text := TDataBaseStockRoutines.GetStockCode(ToID);
end;

procedure TfmBackorderParams.SaveReoprtOp;
begin
  DMTCCoreLink.WriteNwReportOp('BackordListingFromID',IntToStr(FromID) );
  DMTCCoreLink.WriteNwReportOp('BackordListingToID',IntToStr(ToID) ) ;

end;

procedure TfmBackorderParams.BitBtn2Click(Sender: TObject);
begin
  dbedtFromAccount.Color:=clHighlight;

  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltStock,FromID,1);

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    FromID := DMReportsGlobals.Alookup.ReturnID ;
    dbedtFromAccount.Text := TDataBaseStockRoutines.GetStockCode(FromID) ;
    dbedtFromAccount.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBackorderParams.BitBtn1Click(Sender: TObject);
begin
  dbedtToAccount.Color:=clHighlight;

  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltStock,ToID,1);

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    ToID := DMReportsGlobals.Alookup.ReturnID ;
    dbedtToAccount.Text := TDataBaseStockRoutines.GetStockCode(ToID) ;
    dbedtToAccount.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBackorderParams.BtnOkClick(Sender: TObject);
Var
  Params , FileName : String ;
  ShowType : Integer ;
begin
 SaveReoprtOp ;
 hide ;
 try


  ShowType := GetPrintType ;

  Params := 'FROMID=' + dbedtFromAccount.Text +#13 ;
  Params := Params + 'TOID=' + dbedtToAccount.Text +#13 ;
  FileName := '' ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(RandomRange(0,999999)) +'.pdf' ;
    end;
      DMReportsGlobals.ShowReport('REPORTS\STOCK\BACKORDER\BACKORDER',Caption,params,ShowType,FileName);
   finally
    show ;
  end;
end;

procedure TfmBackorderParams.FormCreate(Sender: TObject);
begin
  inherited;
 LoadReoprtOp ;
end;

procedure TfmBackorderParams.BtnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
