(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalespersonByProductOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmSalesPersonByProductOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedtFromProduct: TDBEdit;
    dbedtToProduct: TDBEdit;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
    dbcomboxSequence: TDBComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbShowDetails: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmSalesPersonByProductOptions: TfmSalesPersonByProductOptions;

implementation
uses  Main, Database, Lookup, GlobalFunctions, SalesPersonByProductReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines;
{$R *.DFM}

procedure TfmSalesPersonByProductOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(441){'Do you want to continue reporting ?'}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmSalesPersonByProductOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(213){'Stock Code'});
  dbcomboxSequence.Items.Add(GetTextLang(1058){'Stock Description'});
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
      // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
//  dbcomboxSequence.SetFocus;
end;

procedure TfmSalesPersonByProductOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesPersonByProductOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qrySalesPersonByProduct.ParamByName('FromCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SSalesPersByProdFromProd').AsString;
  dmDatabase.qrySalesPersonByProduct.ParamByName('ToCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SSalesPersByProdToProd').AsString;
  dmDatabase.qrySalesPersonByProduct.Open;
  dmDatabase.qrySalesPersonByProduct.Filtered := False;
  dmDatabase.qrySalesPersonByProduct.Filter := 'DDate >= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesPersByProdFromDate').AsDateTime) + ''' AND DDate <= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesPersByProdToDate').AsdateTime) + '''';
  dmDatabase.qrySalesPersonByProduct.Filtered := True;
  qrSalesPersonByProduct := TqrSalesPersonByProduct.Create(Self);
  try
  if Not cbShowDetails.Checked then
    qrSalesPersonByProduct.QRBand2.Height := 0;
  PrintReportProcess(cbDestination.ItemIndex,qrSalesPersonByProduct,edtCount.Text);
  finally
   FreeAndNil(qrSalesPersonByProduct);
  end;
  dmDatabase.qrySalesPersonByProduct.Filtered := False;
  dmDatabase.qrySalesPersonByProduct.Filter := '';
  dmDatabase.qrySalesPersonByProduct.Filtered := False;
  dmDatabase.qrySalesPersonByProduct.Close;

  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmSalesPersonByProductOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(202);
   key := 0;
  end;
end;

procedure TfmSalesPersonByProductOptions.cbDestinationChange(
  Sender: TObject);
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

procedure TfmSalesPersonByProductOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesPersonByProductOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmSalesPersonByProductOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesPersonByProductOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmSalesPersonByProductOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmSalesPersonByProductOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

procedure TfmSalesPersonByProductOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromProduct.Color := clHighlight;
  dbedtFromProduct.Text  := CallLookup(dbedtFromProduct.Text, 7);
  dbedtFromProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmSalesPersonByProductOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToProduct.Color := clHighlight;
  dbedtToProduct.Text  := CallLookup(dbedtToProduct.Text, 7);
  dbedtToProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
