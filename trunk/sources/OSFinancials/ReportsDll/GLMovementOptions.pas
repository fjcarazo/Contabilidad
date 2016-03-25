(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit GLMovementOptions;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, ComCtrls;

type
  TfmGLMovementOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbcomboxSequence: TDBComboBox;
    dbedtFromAccount: TDBEdit;
    dbedtToAccount: TDBEdit;
    dbcboxNilBalances: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbGraph: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbcomboxOutputKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function fmGLMovementOptions: TfmGLMovementOptions;

implementation

Uses Database, Main, Lookup, HtmlHelpAPI, GlobalFunctions,
  AccMovementReport,  TcVariables, DatabaseAccess,LedgerRoutines,XRoutines;

{$R *.DFM}
var
  afmGLMovementOptions: TfmGLMovementOptions;
function fmGLMovementOptions: TfmGLMovementOptions;
begin
   if not assigned(afmGLMovementOptions) then
   afmGLMovementOptions:= TfmGLMovementOptions.Create(Application);
   result := afmGLMovementOptions ;
end;

procedure TfmGLMovementOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  dbcomboxSequence.Items.Add(GetTextLang(1109){'Account Type'});
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmGLMovementOptions.btnOkClick(Sender: TObject);
var
  Main1, Sub1,
  Main2, Sub2,
  ExclAccount : String;
  i           : Integer;
  Total       : Real;
begin
hide ;
try
  Main1 := GetMainAccountCode(dbedtFromAccount.Text );
  Sub1 := GetSubAccountCode(dbedtFromAccount.Text );
  Main2 := GetMainAccountCode(dbedtToAccount.Text );
  Sub2 := GetSubAccountCode(dbedtToAccount.Text );
  dmDatabase.tblAccount.Open;
  dmDatabase.tblSysVars.Open;


  if  dbcomboxSequence.ItemIndex =1 then
    dmDataBase.tblAccount.IndexFieldNames := 'SDescription'
  else
    if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName1.Value then
      dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID'
  else
    if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName2.Value then
      dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID'
  else if dbcomboxSequence.ItemIndex =3 then
    dmDatabase.tblAccount.IndexFieldNames := 'WAccountTypeID'
  else
    dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';


  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := 'SMAINACCOUNTCODE >= ''' + Main1
                             + ''' and SMAINACCOUNTCODE <= ''' + Main2
                             + ''' and WAccountTypeID <> ''1'' and WAccountTypeID <> ''2''';
  dmDatabase.tblAccount.Filtered := True;
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblTotals.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblPeriods.Open;
  //get rid of nil balances
  { you need 3 variables called :
    ExclAccount : String;
    i           : Integer;
    Total       : Real;
  }
  if dbcboxNilBalances.Checked <> True then
  begin
    ExclAccount := '';
    dmDatabase.tblAccount.First;
    while not dmDatabase.tblAccount.EOF do
    begin
      Total := 0;
      for i := 14 to 14 + dmDatabase.tblSysVarsWNoOfPeriods.Value do
      begin
        dmDatabase.tblTotals.Locate('WAccountID; WPeriodID', VarArrayOf([dmDatabase.tblAccountWAccountID.Value, i]), []);
        Total := Total + dmDatabase.tblTotalsFAmount.Value;
      end;
      if Total = 0 then
        ExclAccount := ExclAccount + ' and WAccountID <> ''' + dmDatabase.tblAccountWAccountID.AsString + '''';
      dmDatabase.tblAccount.Next;
    end;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblAccount.Filter := dmDatabase.tblAccount.Filter + ExclAccount;
    dmDatabase.tblAccount.Filtered := True;
  end;
  //*****************************
  idDocType:=0;
  qrAccountsMovements := TqrAccountsMovements.Create(Self);
     try
      PrintReportProcess(cbDestination.ItemIndex,qrAccountsMovements,edtCount.Text);
     finally
      FreeAndNil(qrAccountsMovements);
     end;


  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblTotals.Close;
  dmDatabase.tblPeriods.Close;
  finally
    show ;
  end;

  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmGLMovementOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmGLMovementOptions.dbcomboxOutputKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmGLMovementOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(188);
             key := 0;

        end;
end;

procedure TfmGLMovementOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmGLMovementOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmGLMovementOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmGLMovementOptions.edtCountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmGLMovementOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmGLMovementOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 2);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmGLMovementOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 2);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
