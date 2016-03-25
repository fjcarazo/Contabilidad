(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CreditorAgeAnalysisOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, DBCtrls, Mask, ExtCtrls, db, Grids, DBGrids,
  Buttons,Variants, ComCtrls;

type
  TfmCreditorAgeAnalysisOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    wwDBDateTimePickerAgeDate: TwwDBDateTimePicker;
    wwDBDateTimePickerCurrent: TwwDBDateTimePicker;
    wwDBDateTimePicker30Days: TwwDBDateTimePicker;
    wwDBDateTimePicker60Days: TwwDBDateTimePicker;
    wwDBDateTimePicker90Days: TwwDBDateTimePicker;
    dbedtRangeName1: TDBEdit;
    dbedtRangeName2: TDBEdit;
    dbedtRangeName3: TDBEdit;
    dbedtRangeName4: TDBEdit;
    dbedtNoMonth1: TDBEdit;
    dbedtNoMonth2: TDBEdit;
    dbedtNoMonth3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    dbedtFromAccount: TDBEdit;
    dbedtToAccount: TDBEdit;
    dbedtMinAmount: TDBEdit;
    dbcbDetail: TDBCheckBox;
    dbcbSort: TDBCheckBox;
    dbcbShowTransactions: TDBCheckBox;
    dbcbZeroBal: TDBCheckBox;
    TopPnl: TPanel;
    Label1: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    BitBtn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcbOpenItem: TDBCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CBShowAll: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure wwDBDateTimePickerAgeDateChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCreditorAgeAnalysisOptions: TfmCreditorAgeAnalysisOptions;

implementation

Uses
  GlobalFunctions, Database, Main, Lookup, CreditorAgeAnalysisReport, HTMLHelpAPI,
  PrintOptions, TcVariables, DatabaseAccess,LanguageChoice,XRoutines;
{$R *.DFM}

procedure TfmCreditorAgeAnalysisOptions.FormShow(Sender: TObject);
begin

  CBShowAll.Checked := ReadReportOp('DEBTORAGESHOWALL',true).AsBoolean ;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  with dmDatabase.tblReportingOptions do begin
   Open;
   Edit;
   if FieldByName('SCreditorAgeRangeName0').AsString = '' then FieldByName('SCreditorAgeRangeName0').AsString := GetTextLang(1856);// 'Current';
   if FieldByName('SCreditorAgeRangeName1').AsString = '' then FieldByName('SCreditorAgeRangeName1').AsString := GetTextLang(1857);//'30 Days';
   if FieldByName('SCreditorAgeRangeName2').AsString = '' then FieldByName('SCreditorAgeRangeName2').AsString := GetTextLang(1858);//'60 Days';
   if FieldByName('SCreditorAgeRangeName3').AsString = '' then FieldByName('SCreditorAgeRangeName3').AsString := GetTextLang(1859);//'90+ Days';
   if FieldByName('DCreditorAgeCurrentDate').AsString = '' then FieldByName('DCreditorAgeCurrentDate').AsString := DateToStr(Date);
   if FieldByName('WCreditorAgeMonth1').AsString = '' then FieldByName('WCreditorAgeMonth1').AsString := '1';
   if FieldByName('WCreditorAgeMonth2').AsString = '' then FieldByName('WCreditorAgeMonth2').AsString := '1';
   if FieldByName('WCreditorAgeMonth3').AsString = '' then FieldByName('WCreditorAgeMonth3').AsString := '1';
  end;
  Application.Processmessages;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  if TCashCompiledAs>=10 then
  begin
    dbcbOpenItem.Checked := False;
    dbcbOpenItem.Visible := False;
  end;
  if dmDatabase.SetOfBooksPropertys.DataParameter.CBUseCurrentDateForReports then
     begin
       wwDBDateTimePickerAgeDate.Field.DataSet.Edit ;
       wwDBDateTimePickerAgeDate.Field.AsDateTime := date ;
       wwDBDateTimePickerAgeDateChange(self);
     end;
  cbDestination.SetFocus;

   
   Caption := GetTextLang(1033); //Header 390
   OkCancel(BtnOk, BtnCancel);
   Label5.Caption := GetTextLang(270);{Date of ageing}
   Label6.Caption := GetTextLang(271); {up to}
   Label7.Caption := GetTextLang(272); {month(s) up to}
   Label8.Caption := GetTextLang(272); {month(s) up to}
   Label9.Caption := GetTextLang(272); {month(s) up to}
   Label3.Caption := GetTextLang(246); {From account}
   Label4.Caption := GetTextLang(208);{To}
   Label2.Caption := GetTextLang(264); {Minimum amount}
   dbcbDetail.Caption := GetTextLang(267);{Show account details}
   dbcbSort.Caption := GetTextLang(268);{Sort by name}
   dbcbShowTransactions.Caption := GetTextLang(269); {Show Transactions}
   dbcbZeroBal.Caption := GetTextLang(266);{Ignore Zero Balances}
   ChangePrnLbls(Label1,lblCopies,BitBtn1);
   {Use Open item}
   dbcbOpenItem.Caption := GetTextLang(265);
   CBShowAll.Caption :=  GetTextLang(1084);
end;

procedure TfmCreditorAgeAnalysisOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmCreditorAgeAnalysisOptions.btnOkClick(Sender: TObject);
var
  AccBeg,AccEnd : String;
//  AccIDF,AccIDt:Integer;
begin
  // Load Cursor
  SetT3Cursor(10);
  BtnOk.Enabled:=False;
  with dmDatabase do begin
    tblReportingOptions.Post;
    AccBeg := GetMainAccountCode(dbedtFromAccount.Text);
    AccBeg := AccBeg+GetSubAccountCode(dbedtFromAccount.Text);
    AccEnd := GetMainAccountCode(dbedtToAccount.Text);
    AccEnd := AccEnd+GetSubAccountCode(dbedtToAccount.Text);
    qryCreditAge.Close;
   tblAccount.Open;
   tblAccount.Filtered:= False;
   SwapStr(AccBeg,AccEnd);
   if dbcbSort.Checked then
     tblAccount.IndexFieldNames := 'SDescription'
   else
     tblAccount.IndexFieldNames := 'SAccountCode';
     if CBShowAll.Checked then
     tblAccount.Filter :='WAccountTypeID=2' else
     tblAccount.Filter :='WAccountTypeID=2 AND SACCOUNTCODE>='''+AccBeg +''' AND SACCOUNTCODE<='''+ AccEnd+'''';
   tblAccount.Filtered:= True;
   FillTmpAgeTable(False,tblReportingOptions.FieldByName('DCreditorAgeDateLimit4').AsDateTime,tblReportingOptions.FieldByName('DCreditorAgeDateLimit3').AsDateTime,tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime, tblReportingOptions.FieldByName('DCreditorAgeCurrentDate').AsDateTime,Not(dbcbOpenItem.Checked=False));
   // Create Sql Text lines ;
   qryCreditAge.Sql.Text:=CreateAgeSql(False,dbcbSort.Checked ,0);

   qryCreditAge.ParamByName('AccTypeID').AsInteger :=  2 ;
   qryCreditAge.ParamByName('date1').AsDateTime := tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime ;
   qryCreditAge.ParamByName('date2').AsDateTime := tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsDateTime ;
   qryCreditAge.ParamByName('date3').AsDateTime := tblReportingOptions.FieldByName('DCreditorAgeCurrentDate').AsDateTime ;
   qryCreditAge.Filtered := False;
   qryCreditAge.Open;
  end;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblOilinks.Open;
  qrCreditorAgeAnalysisReport := TqrCreditorAgeAnalysisReport.Create(Self);
  try
  fmLangChoice.TranslateReport(qrCreditorAgeAnalysisReport);
  // Set group breaks
   if dbcbSort.Checked then
     qrCreditorAgeAnalysisReport.QRGroup1.Expression :='qryCreditAge.SDescription + qryCreditAge.WAccountID'
   else
     qrCreditorAgeAnalysisReport.QRGroup1.Expression :='qryCreditAge.SACCOUNTCODE + qryCreditAge.WAccountID';
  dmDatabase.tblCreditor.Active:=True;
  PrintReportProcess(cbDestination.ItemIndex,qrCreditorAgeAnalysisReport,edtCount.Text);
  finally
  qrCreditorAgeAnalysisReport.Free;
  end;
  dmDatabase.qryCreditAge.Close;
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblOilinks.Close;  
  dmDatabase.tblCreditor.Close;
  dmDatabase.tblSysVars.Close;
  WriteReportOp('DEBTORAGESHOWALL',BoolToStr(CBShowAll.Checked,true));
  BtnOk.Enabled:=True;
  dmDatabase.tblTmpAgeAnal.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmCreditorAgeAnalysisOptions.wwDBDateTimePickerAgeDateChange(
  Sender: TObject);
var
  Day, Month, Year,
  TempDay, TempMonth,
  TempYear           : Word;
  PeriodID           : Integer;
  MDate :TDate;
  Coef  :Word;
begin
  if (dbedtNoMonth1.Text = '') or (dbedtNoMonth2.Text = '') or (dbedtNoMonth3.Text = '') then exit;
  if dmDatabase.tblReportingOptions.State <> dsEdit then exit;
  MDate:=wwDBDateTimePickerAgeDate.Date;
  dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit1').AsFloat := MDate;
  Coef:=Abs(Str2Int(dbedtNoMonth1.Text));
  dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit2').AsFloat := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth2.Text));
  dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit3').AsFloat := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth3.Text));
  dmDatabase.tblReportingOptions.FieldByName('DCreditorAgeDateLimit4').AsFloat := IncMonthT(Mdate,-Coef);
end;

procedure TfmCreditorAgeAnalysisOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmCreditorAgeAnalysisOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(170);
   key := 0;
  end;
end;

procedure TfmCreditorAgeAnalysisOptions.cbDestinationChange(
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

procedure TfmCreditorAgeAnalysisOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmCreditorAgeAnalysisOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmCreditorAgeAnalysisOptions.edtCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmCreditorAgeAnalysisOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmCreditorAgeAnalysisOptions.BitBtn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmCreditorAgeAnalysisOptions.BitBtn3Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 4);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCreditorAgeAnalysisOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;

  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 4);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
