(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit IncomeStatementOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRPrntr,StdCtrls, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmIncomeStatementOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbcboxShowSubAccounts: TDBCheckBox;
    dbcboxIncNilBal: TDBCheckBox;
    dbcomboxSequence: TDBComboBox;
    edtFromDate: TEdit;
    edtToDate: TEdit;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbIncStatShowDec: TCheckBox;
    Bevel1: TBevel;
    cbLastYear: TCheckBox;
    cbVariance: TCheckBox;
    cbBudget: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure cbLastYearClick(Sender: TObject);
    procedure cbBudgetClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    Function CanShowIt:Boolean;
  public
    { Public declarations }
  end;

var
  fmIncomeStatementOptions : TfmIncomeStatementOptions;
//  FromID, ToID             : Integer;

implementation

uses Main, Database, Lookup, HTMLHelpAPI, IncomeStatement, LanguageChoice,
  GlobalFunctions, TcVariables, DatabaseAccess,XRoutines;

{$R *.DFM}


procedure TfmIncomeStatementOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then
        begin
           //Result := (HTMLHelpShowHelp <> 0);
            HtmlShowTopic(191);
           key := 0;
   end;
   
end;

procedure TfmIncomeStatementOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  FromID := dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger;
  ToID := dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
  dmDatabase.tblPeriods.Close;
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  cbBudget.Caption :=  GetTextLang(2980);
  Caption:=GetTextLang(980);
  cbVariance.Caption := GetTextLang(982); // Show Variance
  cbLastYear.Caption := GetTextLang(981); // Ly
  dbcboxIncNilBal.Caption := GetTextLang(248); // Nil Bal
  cbIncStatShowDec.Caption := GetTextLang(979); // Show Dec
  dbcboxShowSubAccounts.Caption := GetTextLang(276);  // Sub -Acc
  Label3.Caption := GetTextLang(247);  //Sequence
  Label1.Caption := GetTextLang(282);  //From 282
  Label2.Caption := GetTextLang(208); //To 208
  btnOK.Caption := GetTextLang(167);  //OK 167
  btnCancel.Caption := GetTextLang(168); //Cancel 168
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);

end;

procedure TfmIncomeStatementOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmIncomeStatementOptions.edtFromDateKeyPress(Sender: TObject;
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

procedure TfmIncomeStatementOptions.btnOKClick(Sender: TObject);
var
  FromDate,
  ToDate      : TDateTime;
  Len : Integer;
  AndClauseThisYearBuget,AndClauseLastYear : String ;
begin
hide ;
try
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  FromDate := dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  ToDate := dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Close;
  if FromDate > ToDate then
  begin
    OSFMessageDlg(GetTextLang(631){'You cannot report from '} + DateToStr(FromDate) +' '+GetTextLang(208)+' '{ ' to '} + DateToStr(ToDate), mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;
  if not CanShowIt then
    cbVariance.Checked := false;
  dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntFromDateID').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WIncomeStmntToDateID').AsInteger := ToID;
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  if cbVariance.Checked then
    Len:=330
  else if CanShowIt then
    Len := 220
  else
    Len := 100;

  qrIncomeStatement.Page.PaperSize:=QRPrntr.A4;
  SetupQrfm(qrIncomeStatement);
  if cbBudget.Checked then
    qrIncomeStatement.QRLabel4.Caption:=GetTextLang(1027)//'Budget'
  else
    qrIncomeStatement.QRLabel4.Caption:=GetTextLang(604);//'Last Year';
  qrIncomeStatement.QRShape18.Width := Len;
  qrIncomeStatement.QRShape1.Width := Len;
  {Last Year }
  qrIncomeStatement.QRLabel4.Enabled := CanShowIt;
  qrIncomeStatement.Debit2.Enabled := CanShowIt;
  qrIncomeStatement.qrGroupsTotalLyCr.Enabled := CanShowIt;
  qrIncomeStatement.NetProfCr.Enabled := CanShowIt;
  {Variance}
  qrIncomeStatement.QRLabel5.Enabled := cbVariance.Checked;
  qrIncomeStatement.qrVariance.Enabled := cbVariance.Checked;
  qrIncomeStatement.qrGroupsVar.Enabled := cbVariance.Checked;
  qrIncomeStatement.qrVarLp.Enabled := cbVariance.Checked;

  if cbIncStatShowDec.Checked then
    qrIncomeStatement.sDigits := 2
  else
    qrIncomeStatement.sDigits := 100;
  if ((FromID = 14) and (ToID = 14)) then
    if OSFMessageDlg(GetTextLang(637){'Include opening balances?'},mtConfirmation,[mbYes,mbNo],0) = mrYes then
     qrIncomeStatement.IncludeOpeningBals := true else
     qrIncomeStatement.IncludeOpeningBals := false;

  if ((FromID = 14) and (ToID > 14)) then
    qrIncomeStatement.IncludeOpeningBals := true;

  if (FromID > 14) then
    qrIncomeStatement.IncludeOpeningBals := false;


  dmDatabase.tblSysVars.Open;
  dmDatabase.tblGroups.Open;


  SetAccountGoupedSQL(dbcomboxSequence.ItemIndex,'and WAccountTypeID <> ''1'' and WAccountTypeID <> ''2'' AND BIncomeExpense=1',true);
  dmDatabase.qrBalSheetAccount.Open;
  if dbcomboxSequence.ItemIndex = 1 then
  begin
    qrIncomeStatement.QRGroup1.Expression:='qrBalSheetAccount.WReportingGroup2ID';
    dmDatabase.flGroupsID:=21;
  end
  else
  begin

    qrIncomeStatement.QRGroup1.Expression:='qrBalSheetAccount.WReportingGroup1ID';
    dmDatabase.flGroupsID:=20;
  end;
  dmDatabase.qrBalSheetAccount.Filtered := False;
//  dmDatabase.qrBalSheetAccount.Filter := '';
  if dbcboxShowSubAccounts.Checked = False then
    dmDatabase.qrBalSheetAccount.Filter :=  ' SSUBACCOUNTCODE = ''000''';
  dmDatabase.qrBalSheetAccount.Filtered := True;

    PrintReportProcess(cbDestination.ItemIndex,qrIncomeStatement,edtCount.Text);
 // ----------------------
 dmDatabase.tblSysVars.Close;
 dmDatabase.qrBalSheetAccount.Filtered := False;
 dmDatabase.qrBalSheetAccount.Filter := '';
 dmDatabase.qrBalSheetAccount.Close;
 dmDatabase.tblGroups.Close;
 finally
  show ;
 end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmIncomeStatementOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblReportingOptions.Close;
end;


procedure TfmIncomeStatementOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmIncomeStatementOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmIncomeStatementOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmIncomeStatementOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmIncomeStatementOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;


Procedure TfmIncomeStatementOptions.LoadReoprtOp;
begin
 cbIncStatShowDec.Checked := ReadReportOp('BIncStatShowDec').AsBoolean;
 cbLastYear.Checked := ReadReportOp('BIncStatLastYear',True).AsBoolean;
 cbVariance.Checked := ReadReportOp('BIncStatVariance',False ).AsBoolean;
 cbBudget.Checked := ReadReportOp('BIncStatBudg',False ).AsBoolean;
end;


Procedure TfmIncomeStatementOptions.SaveReoprtOp;
begin
  WriteReportOp('BIncStatShowDec',Bool2Str(cbIncStatShowDec.Checked));
  WriteReportOp('BIncStatLastYear',Bool2Str(cbLastYear.Checked));
  WriteReportOp('BIncStatVariance',Bool2Str(cbVariance.Checked));
  WriteReportOp('BIncStatBudg',Bool2Str(cbBudget.Checked));
end;

Function TfmIncomeStatementOptions.CanShowIt:Boolean;
begin
  Result := cbBudget.Checked or cbLastYear.Checked
end;

procedure TfmIncomeStatementOptions.cbLastYearClick(Sender: TObject);
begin
  if cbBudget.Checked AND (cbBudget.Checked=cbLastYear.Checked) then
    cbBudget.Checked:=Not cbLastYear.Checked;
end;

procedure TfmIncomeStatementOptions.cbBudgetClick(Sender: TObject);
begin
    if cbBudget.Checked AND  (cbBudget.Checked=cbLastYear.Checked) then
    cbLastYear.Checked:=Not cbBudget.Checked;
end;

procedure TfmIncomeStatementOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmIncomeStatementOptions.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color := clHighlight;
//  if dbcomboxWhichYear.Text = 'This Year' then
   // fmLookup.SelectLookup(Sender, 'Periods', 'THISYEAR', 'PERIODS', FromID);
    ReturnLookup:=CallLookup(edtFromDate.Text, 8);
///  else

  if ReturnLookup <> 'ESC' then
  begin
    FromID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
    edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
    dmDatabase.tblPeriods.Close;
  end;
  edtFromDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmIncomeStatementOptions.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color := clHighlight;

//  if dbcomboxWhichYear.Text = 'This Year' then
//    fmLookup.SelectLookup(Sender, 'Periods', 'THISYEAR', 'PERIODS', ToID);
    ReturnLookup:=CallLookup(edtToDate.Text, 8);
//  else

  if ReturnLookup <> 'ESC' then
  begin
    ToID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
    edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
    dmDatabase.tblPeriods.Close;
  end;
  edtToDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
