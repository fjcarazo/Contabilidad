(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ProductBySalespersonOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmProductBySalesPersonOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
    cbSalesman: TComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbShowDetails: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;    
  public
    { Public declarations }
  end;

var
  fmProductBySalesPersonOptions: TfmProductBySalesPersonOptions;

implementation

uses Main, Database, ProductBySalespersonReport, HTMLHelpAPI,
  LanguageChoice, GlobalFunctions, DatabaseAccess,XRoutines;

{$R *.DFM}

procedure TfmProductBySalesPersonOptions.FormKeyPress(Sender: TObject;
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

procedure TfmProductBySalesPersonOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbSalesman.Clear;
  cbSalesman.Items.Add(GetTextLang(1098){'All'});
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = ''31''';
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.First;
  while not dmDatabase.tblGroups.EOF do
  begin
    cbSalesman.Items.Add(dmDatabase.tblGroupsSDescription.Value);
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblGroups.Close;
  dmDatabase.tblReportingOptions.Open;
  cbSalesman .ItemIndex:=cbSalesman.Items.IndexOf(dmDatabase.tblReportingOptions.FieldByName('SCustBySPersonSPerson').AsString);
  if cbSalesman .ItemIndex<=-1 then
    cbSalesman .ItemIndex:=0;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
//  cbSalesman.SetFocus;
end;

procedure TfmProductBySalesPersonOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.FieldByName('SProdBySPSalesperson').AsString := cbSalesman.Text;
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qryProductBySalesperson.ParamByName('FromDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DProdBySPFromDate').AsDateTime;
  dmDatabase.qryProductBySalesperson.ParamByName('ToDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DProdBySPToDate').AsDateTime;
  dmDatabase.qryProductBySalesPerson.Open;
  qrProductBySalesPersonReport := TqrProductBySalesPersonReport.Create(Self);
  try
  if cbSalesman.ItemIndex <> 0 {'All'} then
  begin
    dmDatabase.qryProductBySalesPerson.Filtered := False;
    dmDatabase.qryProductBySalesPerson.Filter := 'SDescription = ''' + dmDatabase.tblReportingOptions.FieldByName('SProdBySPSalesperson').AsString + '''';
    dmDatabase.qryProductBySalesPerson.Filtered := True;
  end
  else
  begin
    dmDatabase.qryProductBySalesPerson.Filtered := False;
    dmDatabase.qryProductBySalesPerson.Filter := 'WGroupTypeID = 31';
    dmDatabase.qryProductBySalesPerson.Filtered := True;
    qrProductBySalesPersonReport.qrAllSelected.Enabled := True;
  end;
  if Not cbShowDetails.Checked then
  begin {Hide All Details and Details-Titles}
    qrProductBySalespersonReport.QRBand2.Height := 0;
  end;
  dmDatabase.Temp_1.Open;
  while dmDatabase.Temp_1.Recordcount > 0 do dmDatabase.Temp_1.Delete;
//  CrunchTable;

  PrintReportProcess(cbDestination.ItemIndex,qrProductBySalesPersonReport,edtCount.Text);
  //qrProductBySalesPersonReport.Preview;
  finally
   FreeAndNil(qrProductBySalesPersonReport);
  end;

  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;

  dmDatabase.qryProductBySalesPerson.Filtered := False;
  dmDatabase.qryProductBySalesPerson.Filter := '';
  dmDatabase.qryProductBySalesPerson.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmProductBySalesPersonOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmProductBySalesPersonOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(193);
   key := 0;
  end;
end;

procedure TfmProductBySalesPersonOptions.cbDestinationChange(
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

procedure TfmProductBySalesPersonOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmProductBySalesPersonOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmProductBySalesPersonOptions.edtCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmProductBySalesPersonOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmProductBySalesPersonOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;


Procedure TfmProductBySalesPersonOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmProductBySalesPersonOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

end.


