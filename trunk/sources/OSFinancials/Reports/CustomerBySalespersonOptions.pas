(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CustomerBySalespersonOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls,DB;

type
  TfmCustomerBySalesPersonOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
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
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edtCountChange(Sender: TObject);
    procedure Bitprn1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmCustomerBySalesPersonOptions: TfmCustomerBySalesPersonOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, CustomerBySalespersonReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TfmCustomerBySalesPersonOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbSalesman.Clear;
  cbSalesman.Items.Add(GetTExtLang(1098){'All'});
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
  cbSalesman .ItemIndex:=cbSalesman.Items.IndexOf(dmDatabase.tblReportingOptions.FieldByName('SCustBySPersonSPerson').Asstring);
  if cbSalesman .ItemIndex<=-1 then
    cbSalesman .ItemIndex:=0;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmCustomerBySalesPersonOptions.FormKeyPress(Sender: TObject;
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

procedure TfmCustomerBySalesPersonOptions.btnOkClick(Sender: TObject);
begin
 ButtonPanel.Enabled := false ;
 try

  if dmDatabase.tblReportingOptions.State <> dsedit then
    dmDatabase.tblReportingOptions.Edit ;


  dmDatabase.tblReportingOptions.FieldByName('SCustBySPersonSPerson').Value := cbSalesman.Text;

  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.qryCustomerBySalesperson.ParamByName('FromDate').Value := dmDatabase.tblReportingOptions.FieldByName('DCustBySPersonFromDate').Value;
  dmDatabase.qryCustomerBySalesperson.ParamByName('ToDate').Value := dmDatabase.tblReportingOptions.FieldByName('DCustBySPersonToDate').Value;
  dmDatabase.qryCustomerBySalesperson.Open;
  qrCustomerBySalesperson := TqrCustomerBySalesperson.Create(Self);
   try
  if cbSalesman.ItemIndex <> 0 {'All'} then
  begin
    dmDatabase.qryCustomerBySalesperson.Filtered := False;
    dmDatabase.qryCustomerBySalesperson.Filter := 'SDescription_1 = ''' + dmDatabase.tblReportingOptions.FieldByName('SCustBySPersonSPerson').Value + '''';
    dmDatabase.qryCustomerBySalesperson.Filtered := True;
  end
  else
    qrCustomerBySalesperson.qrAllSelected.Enabled := True;
  if Not cbShowDetails.Checked then
  begin {Hide All Details and Details-Titles}
    qrCustomerBySalesperson.QRBand2.Height := 0;
  end;
  qrCustomerBySalesperson.Dates.Caption:=DateRange(dmDatabase.tblReportingOptions.FieldByName('DCustBySPersonFromDate').Value,dmDatabase.tblReportingOptions.FieldByName('DCustBySPersonToDate').Value);
//  qrCustomerBySalesperson.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrCustomerBySalesperson,edtCount.Text);
   finally
     FreeAndNil(qrCustomerBySalesperson);
   end;
  dmDatabase.qryCustomerBySalesperson.Filtered := False;
  dmDatabase.qryCustomerBySalesperson.Filter := '';
  dmDatabase.qryCustomerBySalesperson.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  finally
     ButtonPanel.Enabled := true ;
  end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmCustomerBySalesPersonOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmCustomerBySalesPersonOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(177);
   key := 0;
  end;
end;

procedure TfmCustomerBySalesPersonOptions.cbDestinationChange(
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

procedure TfmCustomerBySalesPersonOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmCustomerBySalesPersonOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmCustomerBySalesPersonOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmCustomerBySalesPersonOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmCustomerBySalesPersonOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmCustomerBySalesPersonOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

end.
