(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit PrintOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Quickrpt ,ExtCtrls, QRExport;

type
  TfmPrintOptions = class(TForm)
    DestLbl: TLabel;
    cbDestination: TComboBox;
    BitBtnPrint: TBitBtn;
    ButtonPanel: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    UpDown1: TUpDown;
    edtCount: TEdit;
    lblCopies: TLabel;
    Function  CallPrint(Sender:TForm;NReport:TQuickRep):Boolean;
    procedure BitBtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edtCountChange(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
  private
    ReportName: TQuickRep;
    { Private declarations }
  public

    { Public declarations }
  end;
// done : Pieter Create when needed
function fmPrintOptions: TfmPrintOptions ;



implementation

uses Main, TrialBalance, Database, GlobalFunctions, DatabaseAccess;

{$R *.DFM}
var
  afmPrintOptions: TfmPrintOptions;

function fmPrintOptions: TfmPrintOptions ;
begin
   if not assigned(afmPrintOptions) then
   afmPrintOptions:= TfmPrintOptions.Create(Application);
   result := afmPrintOptions ;
end;

procedure TfmPrintOptions.BitBtnPrintClick(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmPrintOptions.FormShow(Sender: TObject);
begin
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbDestination.DroppedDown:=True;

end;

Function TfmPrintOptions.CallPrint(Sender:TForm;NReport:TQuickRep):Boolean;
begin
  SetUpForm(Self);
  Result := False ;
  ReportName:=NReport;
//  Sender.Hide;
  if fmPrintOptions.ShowModal= mrOk then
    Result := True ;
//  Sender.Show;
end;

procedure TfmPrintOptions.btnOkClick(Sender: TObject);
(*
Other filters:
HTML: TQRHTMLDocumentFilter
ASCII: TQRAsciiExportFilter
CSV: TQRCommaSeparatedFilter

In Professional Version:
RTF: TQRRTFExportFilter
WMF: TQRWMFExportFilter
Excel: TQRXLSFilter
*)
begin

    BtnCancel.SetFocus;
    dmDatabase.tblSysVars.Open;
    PrintReportProcess(cbDestination.ItemIndex,ReportName,edtCount.Text);
    dmDatabase.tblSysVars.Close;
end;

procedure TfmPrintOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmPrintOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmPrintOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmPrintOptions.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    EdtCount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    EdtCount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

end.
