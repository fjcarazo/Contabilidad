(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BalanceSheetOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRPrntr,StdCtrls, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmBalanceSheetOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
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
    cbBalSheetShowDec: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    dbcomboxWhichYear: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbcomboxWhichYearChange(Sender: TObject);
  private
    Procedure SetBalSheetSQL(ExtraSql : String);
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    procedure ShowToAndFromInGui;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBalanceSheetOptions: TfmBalanceSheetOptions;
//  FromID, ToID         : Integer;

implementation

uses Main, Database, Lookup, HTMLHelpAPI, BalanceSheet, LanguageChoice,
  GlobalFunctions, TcVariables, DatabaseAccess, XRoutines, UDMTCCoreLink;
{$R *.DFM}


Procedure TfmBalanceSheetOptions.SetBalSheetSQL(ExtraSql : String);
begin
  SetAccountGoupedSQL(dbcomboxSequence.ItemIndex,ExtraSql);
  (*
  if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName2.Value then
     flGroupsID:=21
  else
     flGroupsID:=20;
   with dmdatabase.qrBalSheetAccount,dmdatabase.qrBalSheetAccount.SQL do
   begin
     Close;
     Clear;
     Text:='Select Account.WAccountID, Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, Account.WAccountTypeID, ';
       Add(' Account.SDescription, Account.WReportingGroup1ID, Account.WReportingGroup2ID, Account.BSubAccounts, Account.BIncomeExpense, ');
       Add(' Account.SACCOUNTCODE, Groups.WParentGroup1ID, Groups.WParentGroup2ID, Groups.WSortNo');
       Add(' From Account, Groups ');
       Add(' Where Account.WReportingGroup'+IntToStr(flGroupsID-19)+'ID=Groups.WGroupID');
//       Add(' Where Account.WReportingGroup1ID=Groups.WGroupID');
//       Add(' Order By Groups.WParentGroup'+IntToStr(flGroupsID-19) +'ID Desc,Account.WReportingGroup'+IntToStr(flGroupsID-19)+'ID,Account.SACCOUNTCODE');
       Add(' Order By Groups.WParentGroup'+IntToStr(flGroupsID-19) +'ID Desc, Groups.WSortNo,Account.SACCOUNTCODE');
   end;
   *)
end;

procedure TfmBalanceSheetOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmDatabase.tblReportingOptions.Close;
end;

procedure TfmBalanceSheetOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(166);
             key := 0;

        end;
end;

procedure TfmBalanceSheetOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');


  Caption := GetTextLang(978);
  BtnCancel.Caption := GetTextLang(168);
  BtnOk.Caption := GetTextLang(167);
  Label1.Caption := GetTextLang(282);
  Label2.Caption := GetTextLang(208);
  Label3.Caption := GetTextLang(247);
  dbcboxShowSubAccounts.Caption := GetTextLang(276);
  dbcboxIncNilBal.Caption := GetTextLang(248);
  cbBalSheetShowDec.Caption := GetTextLang(979);
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
  dbcomboxWhichYear.Items[0] := GetTextLang(603);//Thisyear
  dbcomboxWhichYear.Items[1] := GetTextLang(604);//Lastyear
  Label4.Caption := GetTextLang(242);//Which year 242  
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;

  FromID := dmDatabase.tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger;
  ToID := dmDatabase.tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger;
  dbcomboxWhichYear.ItemIndex := ReadReportOp('WBalSheetYear',0).AsInteger ;

  ShowToAndFromInGui ;

  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  cbDestination.ItemIndex:=0;
end;

procedure TfmBalanceSheetOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmBalanceSheetOptions.edtFromDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(441), mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmBalanceSheetOptions.btnOKClick(Sender: TObject);
var
  FromDate,
  ToDate      : TDateTime;
  tmp,tmp_Total : real;
begin
 self.Hide ;
 try
   if dbcomboxWhichYear.ItemIndex = 1 then
   begin
     // lastyear
     if FromID > 13 then FromID := 12 ;
     if ToID > 13 then ToID := 13 ;

   end else
   begin
    // thisyear
     if FromID < 14 then FromID := 14 ;
     if ToID < 14 then ToID := 14 ;
   end;



  WriteReportOp('WBalSheetYear',IntToStr(dbcomboxWhichYear.ItemIndex)) ;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  FromDate := dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  ToDate := dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Close;
  if FromDate > ToDate then
  begin
    OSFMessageDlg(GetTextLang(631) + DateToStr(FromDate) + ' '+GetTextLang(208)+' ' + DateToStr(ToDate), mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;


//Chekl to see if the balance Sheet covers only
//period 1 abd the if opening balances must be included
  qrBalanceSheet.Page.PaperSize:=QRPrntr.A4;
  SetupQrfm(qrBalanceSheet);
  if ((FromID = 14) and (ToID = 14)) then
    if OSFMessageDlg(GetTextLang(637){'Include opening balances?'},mtConfirmation,[mbYes,mbNo],0) = mrYes then
     qrBalanceSheet.IncludeOpeningBals := true else
     qrBalanceSheet.IncludeOpeningBals := false;

  if ((FromID = 14) and (ToID > 14)) then

    qrBalanceSheet.IncludeOpeningBals := true;

  if (FromID > 14) then
    qrBalanceSheet.IncludeOpeningBals := false;


  qrBalanceSheet.lastyear := dbcomboxWhichYear.ItemIndex = 1 ;
  dmDatabase.tblReportingOptions.FieldByName('WBalSheetFromDateID').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WBalSheetToDateID').AsInteger := ToID;
  dmDatabase.tblReportingOptions.Post;
  //
  SaveReoprtOp;
  //

  dmDatabase.tblGroups.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qrBalSheetAccount.Close;
  SetBalSheetSQL('and WAccountTypeID <> 1  and WAccountTypeID <>  2 ');
  dmDatabase.qrBalSheetAccount.Open;

  if cbBalSheetShowDec.Checked then
    qrBalanceSheet.sDigits := 2
  else
    qrBalanceSheet.sDigits := 100;

//  if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName2.Value then
  if dmDatabase.flGroupsID=21 then
  begin
    qrBalanceSheet.QRGroup1.Expression:='qrBalSheetAccount.WReportingGroup2ID';
    qrBalanceSheet.qrGpAssets.Expression:= 'IF(qrBalSheetAccount.WParentGroup2ID=69,2,1)' ;
  end
  else
  begin
//    flGroupsID:=20;
    qrBalanceSheet.QRGroup1.Expression:='qrBalSheetAccount.WReportingGroup1ID';
    qrBalanceSheet.qrGpAssets.Expression:='IF(qrBalSheetAccount.WParentGroup1ID=69,2,1)';
  end;

  dmDatabase.qrBalSheetAccount.Filtered := False;
  // dmDatabase.qrBalSheetAccount.Filter := '';
  if not dbcboxShowSubAccounts.Checked then
    dmDatabase.qrBalSheetAccount.Filter := 'SSUBACCOUNTCODE = ''000''';
  dmDatabase.qrBalSheetAccount.Filtered := True;

// qrBalanceSheet.qrBalanceSheetReport.Preview;
 PrintReportProcess(cbDestination.ItemIndex,qrBalanceSheet,edtCount.Text);
 // ----------------------
 dmDatabase.tblSysVars.Close;
 dmDatabase.qrBalSheetAccount.Filtered := False;
 dmDatabase.qrBalSheetAccount.Filter := '';
 dmDatabase.qrBalSheetAccount.Close;
 dmDatabase.tblGroups.Close;
 finally
 self.show ;
 end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmBalanceSheetOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmBalanceSheetOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmBalanceSheetOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmBalanceSheetOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmBalanceSheetOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmBalanceSheetOptions.LoadReoprtOp;
begin
  cbBalSheetShowDec.Checked := ReadReportOp('cbBalSheetShowDec').AsBoolean;
end;


Procedure TfmBalanceSheetOptions.SaveReoprtOp;
begin
  WriteReportOp('cbBalSheetShowDec',Bool2Str(cbBalSheetShowDec.Checked));
end;


procedure TfmBalanceSheetOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmBalanceSheetOptions.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color := clHighlight;
  // why is lats year taken out ?
  // People need there balans sheet to do last year
  if dbcomboxWhichYear.ItemIndex = 1 then
     ReturnLookup:=CallLookup(FromID, 9)
  else
    ReturnLookup:=CallLookup(FromID, 8);


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

procedure TfmBalanceSheetOptions.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color := clHighlight;


  if dbcomboxWhichYear.ItemIndex = 1 then
     ReturnLookup:=CallLookup(ToID, 9)
  else
    ReturnLookup:=CallLookup(ToID, 8);



//  else

  if ReturnLookup <> 'ESC' then
  begin
    ToID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
    edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value  +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
    dmDatabase.tblPeriods.Close;
  end;
  edtToDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmBalanceSheetOptions.dbcomboxWhichYearChange(Sender: TObject);
begin
 if dbcomboxWhichYear.ItemIndex = 0 then
 if FromID < 14 then
    begin
      FromID := FromID + 13 ;
      ToID := ToID + 13 ;
    end;
 // lastyear
 if dbcomboxWhichYear.ItemIndex = 1 then
 if FromID > 13 then
    begin
      FromID := FromID - 13 ;
      ToID := ToID - 13 ;
    end;

 ShowToAndFromInGui ;
end;

procedure TfmBalanceSheetOptions.ShowToAndFromInGui;
begin
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
  dmDatabase.tblPeriods.Close;

end;

end.
