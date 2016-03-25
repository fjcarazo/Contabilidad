(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CustomerByProductOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmCustomerByProductOptions = class(TForm)
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
  fmCustomerByProductOptions: TfmCustomerByProductOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, CustomerByProductReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines;

{$R *.DFM}

procedure TfmCustomerByProductOptions.FormKeyPress(Sender: TObject;
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

procedure TfmCustomerByProductOptions.FormShow(Sender: TObject);
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

procedure TfmCustomerByProductOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmCustomerByProductOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp ;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qryCustomerByProduct.ParamByName('FromCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SCustByProdFromProd').AsString;
  dmDatabase.qryCustomerByProduct.ParamByName('ToCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SCustByProdToProd').AsString;
  dmDatabase.qryCustomerByProduct.Open;
  dmDatabase.qryCustomerByProduct.Filtered := False;
  dmDatabase.qryCustomerByProduct.Filter := 'DDate >= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DCustByProdFromDate').AsDateTime) + ''' AND DDate <= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DCustByProdToDate').AsDateTime) + '''';
  dmDatabase.qryCustomerByProduct.Filtered := True;
  qrCustomerByProductReport := TqrCustomerByProductReport.Create(Self);
   try
  if Not cbShowDetails.Checked then
    qrCustomerByProductReport.QRBand2.Height := 0;
  PrintReportProcess(cbDestination.ItemIndex,qrCustomerByProductReport,edtCount.Text);
//  qrCustomerByProductReport.Preview;
   finally
     FreeAndNil(qrCustomerByProductReport);
   end;
  dmDatabase.qryCustomerByProduct.Filtered := False;
  dmDatabase.qryCustomerByProduct.Filter := '';
  dmDatabase.qryCustomerByProduct.Filtered := False;
  dmDatabase.qryCustomerByProduct.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmCustomerByProductOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(175);
   key := 0;
  end;
end;

Procedure TfmCustomerByProductOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmCustomerByProductOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;


procedure TfmCustomerByProductOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmCustomerByProductOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromProduct.Color := clHighlight;
  dbedtFromProduct.Text  := CallLookup(dbedtFromProduct.Text, 7);
  dbedtFromProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCustomerByProductOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToProduct.Color := clHighlight;
  dbedtToProduct.Text  := CallLookup(dbedtToProduct.Text, 7);
  dbedtToProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
