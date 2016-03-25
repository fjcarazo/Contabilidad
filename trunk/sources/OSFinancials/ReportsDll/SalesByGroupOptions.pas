(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByGroupOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls;

type
  TfmSalesByGroupOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
    cbToGroup: TComboBox;
    cbFromGroup: TComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbUseGroupID: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure cbUseGroupIDClick(Sender: TObject);
  private
    procedure LoadGroups;
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    { Private declarations }
  public
    GroupID:Integer;
    { Public declarations }
  end;

var
  fmSalesByGroupOptions: TfmSalesByGroupOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, SalesByGroupReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines;

{$R *.DFM}


procedure TfmSalesByGroupOptions.LoadGroups;
begin
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = '+IntToStr(GroupID);
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.First;
  cbFromGroup.Items.Clear;
  cbToGroup.Items.Clear;
  while not dmDatabase.tblGroups.EOF do
  begin
    cbFromGroup.Items.Add(dmDatabase.tblGroupsSDescription.Value);
    cbToGroup.Items.Add(dmDatabase.tblGroupsSDescription.Value);
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblGroups.Close;
end;


procedure TfmSalesByGroupOptions.FormShow(Sender: TObject);
begin
  GroupID:=28;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbFromGroup.Items.Clear;
  cbToGroup.Items.Clear;
  LoadGroups;
  LoadReoprtOp;
  dmDatabase.tblSysVars.Open;
  cbUseGroupID.Caption := GetTExtLang(1080)+' '+dmDatabase.tblSysVarsSDocumentReportName1.Asstring;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  cbFromGroup.Text := dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupFromGroup').Asstring;
  cbToGroup.Text := dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupToGroup').Asstring;
  dmDatabase.tblReportingOptions.Edit;
//  cbFromGroup.SetFocus;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmSalesByGroupOptions.FormKeyPress(Sender: TObject;
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

procedure TfmSalesByGroupOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupFromGroup').Value := cbFromGroup.Text;
  dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupToGroup').Value := cbToGroup.Text;
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qrySalesByGroup.ParamByName('FromDate').Value := dmDatabase.tblReportingOptions.FieldByName('DSalesByGroupFromDate').Asstring;
  dmDatabase.qrySalesByGroup.ParamByName('ToDate').Value := dmDatabase.tblReportingOptions.FieldByName('DSalesByGroupToDate').Asstring;
  dmDatabase.qrySalesByGroup.Open;
  dmDatabase.qrySalesByGroup.Filtered := False;
  dmDatabase.qrySalesByGroup.Filter := 'SDescription >= ''' + dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupFromGroup').Asstring + ''' AND SDescription <= ''' + dmDatabase.tblReportingOptions.FieldByName('SSalesByGroupToGroup').Asstring + ''' AND WGroupTypeID ='+IntToStr(GroupID);
  dmDatabase.qrySalesByGroup.Filtered := True;
  qrSalesByGroup := TqrSalesByGroup.Create(Self);
  try
//  qrSalesByGroup.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrSalesByGroup,edtCount.Text);
  finally
   FreeAndNil(qrSalesByGroup);
  end;
  dmDatabase.qrySalesByGroup.Filtered := False;
  dmDatabase.qrySalesByGroup.Filter := '';
  dmDatabase.qrySalesByGroup.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmSalesByGroupOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesByGroupOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
  HtmlShowTopic(198);

   key := 0;
  end;
end;

procedure TfmSalesByGroupOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmSalesByGroupOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesByGroupOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmSalesByGroupOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesByGroupOptions.Bitprn1Click(Sender: TObject);
begin
   fmMain.SetupPrinterClick(Sender);
end;

procedure TfmSalesByGroupOptions.cbUseGroupIDClick(Sender: TObject);
begin
  if cbUseGroupID.Checked then
    GroupID:=28
  else
    GroupID:=29;
   LoadGroups;
end;

Procedure TfmSalesByGroupOptions.LoadReoprtOp;
begin
  cbUseGroupID.Checked := ReadReportOp('BSalesByGroupUseGroup1').AsBoolean;
end;


Procedure TfmSalesByGroupOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesByGroupUseGroup1',Bool2Str(cbUseGroupID.Checked));
end;

end.
