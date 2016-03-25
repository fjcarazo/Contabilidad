(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit qrselect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, printers, qrprntr,QuickRpt, ComCtrls, Spin, ExtCtrls;

type
  TfrmReportsPrint = class(TForm)
    ButtonPanel: TPanel;
    Btncancel: TBitBtn;
    btnOk: TBitBtn;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    cbPrinters: TComboBox;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    AllPagesRb: TRadioButton;
    RangeRb: TRadioButton;
    FromEdt: TEdit;
    ToEdt: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    CopiesSe: TSpinEdit;
    Button2: TButton;
    rbCurrent: TRadioButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AllPagesRbClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FromEdtChange(Sender: TObject);
    procedure cbPrintersChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbCurrentClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    NumCopies: integer;
    SelPrinterIndex: integer;
    SelQRPrinter: TQRPrinter;
    FromPage, ToPage , Current: integer;

  end;

var
  frmReportsPrint: TfrmReportsPrint;

implementation

uses Main, LanguageChoice, Database, ReportsPreview, PaperSetup,
   GlobalFunctions, TcVariables,databaseaccess;

{$R *.DFM}

procedure TfrmReportsPrint.FormDestroy(Sender: TObject);
begin
  // All done, free the printer object
//  printer.free;
end;

procedure TfrmReportsPrint.FormShow(Sender: TObject);
var
//  LocItemIndex,
  nIdx: integer;
begin
  
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  // create a printer to get the list of printers
    try
      For nIdx:=0 to SelQRPrinter.Printers.Count-1 do
        cbPrinters.Items.Add(SelQRPrinter.Printers[nIdx]);
      Label1.Caption:={'Printing on}gettextlang(2192)+' '+ SelQRPrinter.Printers[ SelQRPrinter.PrinterIndex];
      cbPrinters.ItemIndex := SelQRPrinter.PrinterIndex;
      AllPagesRb.Caption := gettextlang(737)+' ('+IntToStr(SelQRPrinter.PageCount)+')' ;
      FromEdt.Text := '1';
      ToEdt.Text := IntToStr(SelQRPrinter.PageCount);
    except raise end;
  if PrnVars.NumCopies < 1 then
    PrnVars.NumCopies := 1;

  CopiesSe.Value := PrnVars.NumCopies;
  application.ProcessMessages;
  cbPrintersChange(Sender);
  Button1.Caption := gettextlang(534);
  Button2.Caption := gettextlang(1911);
  GroupBox2.Caption := gettextlang(99);
  GroupBox1.Caption := gettextlang(733);
  rbCurrent.Caption := gettextlang(1856);
  GroupBox3.Caption := gettextlang(732);
  Label4.Caption := gettextlang(738);
end;

procedure TfrmReportsPrint.AllPagesRbClick(Sender: TObject);
begin
  FromEdt.Enabled := RangeRb.Checked;
  ToEdt.Enabled := FromEdt.Enabled;
end;

procedure TfrmReportsPrint.btnOkClick(Sender: TObject);
begin
  FromPage := 0;
  ToPage := 0;
  PrnVars.NumCopies := CopiesSe.Value;
  PrnVars.PrinterIndex := cbPrinters.ItemIndex;
  selPrinterIndex := PrnVars.PrinterIndex;
  SelQRPrinter.PrinterIndex := PrnVars.PrinterIndex;
  if RangeRb.Checked Or rbCurrent.Checked then
  begin
     if rbCurrent.Checked then
     begin
       FromPage := Current;
       ToPage := Current;
     end
     else
     begin
       FromPage := StrToIntDef(FromEdt.text,0);
       ToPage := StrToIntDef(ToEdt.text,0);
      end;
  end;
  try
    if SelQRPrinter<>nil then
    if SelQRPrinter.ParentReport is TCustomquickrep then
    begin
      TCustomquickrep(SelQRPrinter.ParentReport).PrinterSettings.FirstPage:=FromPage;
      TCustomquickrep(SelQRPrinter.ParentReport).PrinterSettings.LastPage:=ToPage;
      TCustomquickrep(SelQRPrinter.ParentReport).PrinterSettings.Copies := PrnVars.NumCopies;
      TCustomquickrep(SelQRPrinter.ParentReport).PrinterSettings.PrinterIndex := cbPrinters.ItemIndex;
    end;
    WriteReportOp('wprnnumcopies',IntToStr(PrnVars.NumCopies));
  finally end;
end;

procedure TfrmReportsPrint.FromEdtChange(Sender: TObject);
const
  sIntKeys = '0123456789';
var
  nIdx: Integer;
begin
  with Sender as TEdit do
  begin
    nIdx := StrLen(pchar(Text));
    // only allow numbers to be entered
    for nIdx := 1 to nIdx do
      if StrScan(sIntKeys, char(Text[nIdx])) = nil then
      begin
        Text := '';
        break;
      end;
  end;
end;


procedure TfrmReportsPrint.cbPrintersChange(Sender: TObject);
var
  SaveCopies,
  SaveIndex: integer;
begin
  if SelQRPrinter=Nil then Exit;
  with SelQRPrinter do
  begin
    SaveIndex := PrinterIndex;
    PrinterIndex := cbPrinters.ItemIndex;

    // Quick and easy way to see if the printer supports the printing
    // of multiple copies
    SaveCopies := Copies;
    Copies := 2;


    Copies := SaveCopies;
    PrinterIndex := SaveIndex;
  end;


end;

procedure TfrmReportsPrint.Button2Click(Sender: TObject);
begin
  fmPaperSetup := TfmPaperSetup.Create(self);
  SetUpForm(fmPaperSetup);
  fmPaperSetup.ShowModal;
  fmPaperSetup.Free;
end;

procedure TfrmReportsPrint.FormCreate(Sender: TObject);
begin
  // done : Pieter Bug with printer screen. we need to set this printer object.
  // TODO : Sylvain check this please im getting access violation here if this line is commented
  // Sylvain The Changes are in Main.Pas line 814 see SetupPrinterClick;
  // QRPrinter was a global var in QR 3.6 now it's a local var (FQRPrinter) in QRPrntr.pas  
  //  SelQRPrinter := QRPrinter ;
  SetUpForm(Self);
end;

procedure TfrmReportsPrint.rbCurrentClick(Sender: TObject);
begin
  FromEdt.Enabled := RangeRb.Checked;
  ToEdt.Enabled := FromEdt.Enabled;
end;

procedure TfrmReportsPrint.Button1Click(Sender: TObject);
var
  Dummy : String ;
begin
// done : Pieter windows xp and 2000 this works not sure if it does on win98
  Dummy := 'RUNDLL32 PRINTUI.DLL,PrintUIEntry /p /n "'+cbPrinters.text +'"' ;
  WinExec(pchar(Dummy), 1);
end;

end.
