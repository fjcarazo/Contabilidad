(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BudgetPerformanceOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, ComCtrls;

type

  TfmBudgetPerformance = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    dbcomboxSequence: TDBComboBox;
    Label3: TLabel;
    dbedtFromAccount: TDBEdit;
    Label4: TLabel;
    dbedtToAccount: TDBEdit;
    dbcboxSubAccounts: TDBCheckBox;
    dbcboxNilBalances: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    Edtcount: TEdit;
    UpDown1: TUpDown;
    cbGraph: TCheckBox;
    Label6: TLabel;
    edtFromDate: TEdit;
    Label7: TLabel;
    edtToDate: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure EdtcountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure edtFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadReoprtOp;
    procedure SaveReoprtOp;
    { Public declarations }
  end;

var
  fmBudgetPerformance: TfmBudgetPerformance;
//  FromID, ToID         : Integer;
implementation

Uses Database, Main,  Lookup, HtmlHelpAPI,
  GlobalFunctions, AccMovementReport,  LanguageChoice,
  TcVariables, DatabaseAccess,LedgerRoutines,XRoutines, OSFGeneralRoutines,
  DB, UDMTCCoreLink;

{$R *.DFM}

Procedure TfmBudgetPerformance.LoadReoprtOp;
begin
  FromID := ReadReportOp('BugPerFromPer',14).AsInteger ;
  edtFromDate.Text := TDataBaseRoutines.GetPeriodDescription(FromID,999) ;
  ToID := ReadReportOp('BugPerToPer',14).AsInteger ;
  edtToDate.Text := TDataBaseRoutines.GetPeriodDescription(ToID,999) ;
end;

Procedure TfmBudgetPerformance.SaveReoprtOp;
begin
  WriteReportOp('BugPerFromPer',IntToStr(FromID));
  WriteReportOp('BugPerToPer',IntToStr(ToID));
end;


procedure TfmBudgetPerformance.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');


  ButtonPanel.Color := fmMain.ControlPanel.Color;

  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(getTextLang(176));
  dbcomboxSequence.Items.Add(GetTextLang(1108));
  dbcomboxSequence.Items.Add(GetTextLang(1109));
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  LoadReoprtOp ;
end;

procedure TfmBudgetPerformance.btnOkClick(Sender: TObject);
var
  Main1, Sub1,
  Main2, Sub2 : String;
begin
  SaveReoprtOp ;
  Main1 := GetMainAccountCode(dbedtFromAccount.Text );
  Sub1 := GetSubAccountCode(dbedtFromAccount.Text );
  Main2 := GetMainAccountCode(dbedtToAccount.Text );
  Sub2 := GetSubAccountCode(dbedtToAccount.Text );
  dmDatabase.tblAccount.Open;


  if dbcomboxSequence.ItemIndex = 0 then
    dmDataBase.tblAccount.IndexFieldNames := 'SAccountCode';
  if dbcomboxSequence.ItemIndex = 1 then
    dmDataBase.tblAccount.IndexFieldNames := 'SDescription';
  dmDatabase.tblSysVars.Open;
  if dbcomboxSequence.ItemIndex = 3 then
    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID';
  if dbcomboxSequence.ItemIndex = 4 then
    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID';
  if dbcomboxSequence.ItemIndex = 2then
    dmDatabase.tblAccount.IndexFieldNames := 'WAccountTypeID';

  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Filtered := False;
  if dbcboxSubAccounts.Checked = True then
    dmDatabase.tblAccount.Filter := 'SMAINACCOUNTCODE >= ''' + Main1
                           + ''' and SMAINACCOUNTCODE <= ''' + Main2
                           + ''' and WAccountTypeID <> ''1'' and WAccountTypeID <> ''2'''
  else
    dmDatabase.tblAccount.Filter := 'SMAINACCOUNTCODE >= ''' + Main1
                           + ''' and SMAINACCOUNTCODE <= ''' + Main2
                           + ''' and SSUBACCOUNTCODE = ''000'' and WAccountTypeID <> ''1'' and WAccountTypeID <> ''2''';
  dmDatabase.tblAccount.Filtered := True;
  if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;
  qrAccountsMovements := TqrAccountsMovements.Create(Self);
  try
   qrAccountsMovements.includeNillBalanses  := dbcboxNilBalances.Checked ;
   qrAccountsMovements.idDocType := 100 ;
//  qrAccMvtGraph := TqrAccMvtGraph.Create(Self);
  //Chekl to see if the Budget covers only

  //period 1 and include opening balances
  if ((FromID = 14) and (ToID = 14)) then
    begin
    if OSFMessageDlg(GetTextLang(637){'Include opening balances?'},mtConfirmation,[mbYes,mbNo],0) = mrYes then
     qrAccountsMovements.IncludeOpeningBals := true else
     qrAccountsMovements.IncludeOpeningBals := false;



    end;
  if ((FromID = 14) and (ToID > 14)) then
    qrAccountsMovements.IncludeOpeningBals := true;
  if (FromID > 14) then
    qrAccountsMovements.IncludeOpeningBals := false;

  dmDatabase.tblSysVars.Open;
  dmDatabase.tblTotals.Open;
  dmDatabase.tblPeriods.Open;
  qrAccountsMovements.idDocType:=255;
  if cbGraph.Checked then begin
           // todo : Pieter Took out this routine in my version couse of compiler problems
  {
    dmDatabase.qrChartSerie1.open;
    dmDatabase.qrChartSerie2.open;
    PrintReportProcess(cbDestination.ItemIndex,qrAccMvtGraph,edtCount.Text);
    dmDatabase.qrChartSerie1.Close;
    dmDatabase.qrChartSerie2.Close;
    }
  end
  else
  begin
    PrintReportProcess(cbDestination.ItemIndex,qrAccountsMovements,edtCount.Text);
  end;
// todo : Pieter Took out this routine in my version couse of compiler problems
//  qrAccMvtGraph.Free;
  finally
   FreeAndNil(qrAccountsMovements);
  end;
  dmDataBase.tblAccount.IndexFieldNames := 'SAccountCode';
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblTotals.Close;
  dmDatabase.tblPeriods.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmBudgetPerformance.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmBudgetPerformance.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(186);
             key := 0;
      end;
end;

procedure TfmBudgetPerformance.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    Edtcount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    Edtcount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

procedure TfmBudgetPerformance.EdtcountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(Edtcount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmBudgetPerformance.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmBudgetPerformance.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmBudgetPerformance.edtFromDateKeyPress(Sender: TObject;
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

procedure TfmBudgetPerformance.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;

  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 2);

  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmBudgetPerformance.BitBtn3Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 2);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmBudgetPerformance.BitBtn2Click(Sender: TObject);
begin
  edtFromDate.Color := clHighlight;
  ReturnLookup:=CallLookup(edtFromDate.Text, 8);
  if ReturnLookup <> 'ESC' then
  begin
    FromID := StrToInt(ReturnLookup);
    edtFromDate.Text := TDataBaseRoutines.GetPeriodDescription(FromID,999) ;
  end;
  edtFromDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmBudgetPerformance.BitBtn4Click(Sender: TObject);
begin
  edtToDate.Color := clHighlight;
  ReturnLookup:=CallLookup(edtToDate.Text, 8);
  if ReturnLookup <> 'ESC' then
  begin
    ToID := StrToInt(ReturnLookup);
    edtToDate.Text := TDataBaseRoutines.GetPeriodDescription(ToID,999) ;
  end;
  edtToDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
