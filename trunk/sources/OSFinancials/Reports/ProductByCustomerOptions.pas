(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ProductByCustomerOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls,DB;

type
  TfmProductByCustomerOptions = class(TForm)
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
    CBShowAll: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  fmProductByCustomerOptions: TfmProductByCustomerOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, ProductByCustomerReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines, UDMTCCoreLink;

{$R *.DFM}


procedure TfmProductByCustomerOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GEttextLang(213){'Stock Code'});
  dbcomboxSequence.Items.Add(GEttextLang(1058){'Stock Description'});
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  CBShowAll.Caption :=  GetTextLang(1084);//Show all

  Caption := GetTextLang(992);//Header
  Label2.Caption := GetTextLang(247);//Sequence 247
  Label3.Caption := GetTextLang(392);//Show Details
  Label3.Caption := GetTextLang(389); //From Product 389
  Label4.Caption := GetTextLang(208); //To 208
  Label5.Caption := GetTextLang(282); //From 282
  Label6.Caption := GetTextLang(208); //To 208
  btnOK.Caption := GetTextLang(167); //OK 167
  cbShowDetails.Caption := GetTextLang(392); // Show Detail
  btnCancel.Caption :=  GetTextLang(168);//Cancel 168
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);

end;

procedure TfmProductByCustomerOptions.FormKeyPress(Sender: TObject;
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

procedure TfmProductByCustomerOptions.btnOkClick(Sender: TObject);
begin
  if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qryProductByCustomer.ParamByName('FromDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DProdByCustFromDate').AsDateTime;
  dmDatabase.qryProductByCustomer.ParamByName('ToDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DProdByCustToDate').AsDateTime;
  dmDatabase.qryProductByCustomer.Open;
  dmDatabase.qryProductByCustomer.Filtered := False;
  if not CBShowAll.Checked then
  dmDatabase.qryProductByCustomer.Filter := 'SSTOCKCODE >= ''' + dmDatabase.tblReportingOptions.FieldByName('SProdByCustFromProd').AsString + ''' AND SSTOCKCODE <= ''' + dmDatabase.tblReportingOptions.FieldByName('SProdByCustToProd').AsString + '''';
  dmDatabase.qryProductByCustomer.Filtered := True;
  qrProductByCustomer := TqrProductByCustomer.Create(Self);
  try
  if Not cbShowDetails.Checked then
  begin {Hide All Details and Details-Titles}
    qrProductByCustomer.QRBand2.Height := 0;
  end;
  PrintReportProcess(cbDestination.ItemIndex,qrProductByCustomer,edtCount.Text);
//  qrProductByCustomer.Preview;
  finally
   FreeAndNil(qrProductByCustomer);
  end;
  dmDatabase.qryProductByCustomer.Filtered := False;
  dmDatabase.qryProductByCustomer.Filter := '';
  dmDatabase.qryProductByCustomer.Filtered := False;
  dmDatabase.qryProductByCustomer.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmProductByCustomerOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmProductByCustomerOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(192);
   key := 0;
  end;
end;

procedure TfmProductByCustomerOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmProductByCustomerOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmProductByCustomerOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmProductByCustomerOptions.edtCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmProductByCustomerOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmProductByCustomerOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;


Procedure TfmProductByCustomerOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmProductByCustomerOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

procedure TfmProductByCustomerOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromProduct.Color := clHighlight;
  dbedtFromProduct.Text  := CallLookup(dbedtFromProduct.Text, 7);
  dbedtFromProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmProductByCustomerOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToProduct.Color := clHighlight;
  dbedtToProduct.Text  := CallLookup(dbedtToProduct.Text, 7);
  dbedtToProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
