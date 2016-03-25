(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TrialBalanceOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRPrntr,StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ComCtrls, wwcheckbox;

type
  TfmTrialBalanceOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel2: TPanel;
    edtFromDate: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtToDate: TEdit;
    Label3: TLabel;
    adbcboxShowSubAccounts: TDBCheckBox;
    dbcboxIncNilBal: TDBCheckBox;
    dbcomboxSequence: TComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Toimage: TImage;
    CBBeforePosting: TCheckBox;
    CBUpostedonly: TCheckBox;
    CBopeningBalanceOnly: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbLyOnly: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure adbcboxShowSubAccountsKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCountChange(Sender: TObject);
    procedure Bitprn1Click(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure cbDestinationChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure CBBeforePostingClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtFromDateDblClick(Sender: TObject);
    procedure edtToDateDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmTrialBalanceOptions: TfmTrialBalanceOptions;
//  FromID, ToID         : Integer;
implementation

uses Main, Database, TrialBalance, Lookup, HtmlHelpAPI, LanguageChoice,
  GlobalFunctions, PrintOptions, TcVariables, DatabaseAccess,XRoutines, DB,
  UDMTCCoreLink;

{$R *.DFM}

procedure TfmTrialBalanceOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');



  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
//  dbcomboxSequence.Items.Add('Account Number');
//  dbcomboxSequence.Items.Add('Account Description');
//  dbcomboxSequence.Items.Add('Account Type');
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  dbcomboxSequence.Items.Add(GetTextLang(1109){'Account Type'});
  CBBeforePosting.Caption := GetTextLang(532);
  CBUpostedonly.Caption := GetTextLang(2189);
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  FromID := dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger;
  ToID := dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').AsInteger;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
  dmDatabase.tblPeriods.Close;
  LoadReoprtOp;
  CBopeningBalanceOnly.Caption := GetTextLang(2979);
  Caption := GetTextLang(281);  //Header 281
  Label1.Caption := GetTextLang(282);  //From 282
  Label2.Caption := GetTextLang(208); //To 208
  adbcBoxShowSubAccounts.Caption :=GetTextLang(276);  //Display Sub Acc 276
  dbcBoxIncNilBal.Caption := GetTextLang(248);  //Include Nil Balances 248
  Label3.Caption := GetTextLang(247); //Sequence 247
  btnOK.Caption := GetTextLang(167); //OK 167
  cbLyOnly.Caption := GetTextLang(1088);//cbLyOnly
  btnCancel.Caption := GetTextLang(168);//Cancel 168
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
  LoadPrintOutModes(cbDestination); // load Print Modes
  try
  cbDestination.SetFocus;
  except
  end;

end;

procedure TfmTrialBalanceOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmTrialBalanceOptions.BtnOkClick(Sender: TObject);
var
  FromDate,
  ToDate      : TDateTime;
  OrderSql,AndClauseThisYearBuget,AndClauseLastYear : String ;
begin
 hide ;
 try
  BtnOk.Enabled:=False;
  BtnCancel.SetFocus;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  FromDate := dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  ToDate := dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Close;
  if FromDate > ToDate then
  begin
    OSFMessageDlg(GetTextLang(631){'You cannot report from '} + DateToStr(FromDate) + ' '+GetTextLang(208) {to }+' '+ DateToStr(ToDate), mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;

//Chekl to see if the trisl balance covers only
//period 1 abd the if opening balances must be included

  if ((FromID = 14) and (ToID = 14)) then
    if OSFMessageDlg(GetTextLang(637){'Include opening balances?'},mtConfirmation,[mbYes,mbNo],0) = mrYes then
     qrTrialBalance.IncludeOpeningBals := true else
     qrTrialBalance.IncludeOpeningBals := false;

  if ((FromID = 14) and (ToID > 14)) then
    qrTrialBalance.IncludeOpeningBals := true;

  if (FromID > 14) then
    qrTrialBalance.IncludeOpeningBals := false;

  dmDatabase.tblReportingOptions.FieldByName('WTrialBalFromDateID').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WTrialBaloDateID').AsInteger := ToID;
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;


  // dmDatabase.tblAccount.Open;
  if dbcomboxSequence.ItemIndex=0 then
    OrderSql := 'order by SACCOUNTCODE';
  if dbcomboxSequence.itemIndex=1 then
     OrderSql := 'order by SDescription';
  if dbcomboxSequence.itemIndex=2 then
     OrderSql := 'order by WAccountTypeId,SACCOUNTCODE';
  dmDatabase.tblSysVars.Open;
  qrTrialBalance.QRGroup1.Expression:='';
  qrTrialBalance.QRBand3.Height:=1;
  flGroupsID:=0;
  if dbcomboxSequence.itemIndex=3 then
  begin
    OrderSql := ' order by group1.WSortNo,SACCOUNTCODE ' ;
    qrTrialBalance.QRGroup1.Expression:='ZQAccounts.WREPORTINGGROUP1ID';
    flGroupsID:=20;
    qrTrialBalance.QRBand3.Height:=38;
  end;
  if dbcomboxSequence.itemIndex=4 then
  begin
    OrderSql := ' order by group2.WSortNo ,SACCOUNTCODE' ;
    qrTrialBalance.QRGroup1.Expression:='ZQAccounts.WREPORTINGGROUP2ID';
    flGroupsID:=21;
    qrTrialBalance.QRBand3.Height:=38;
  end;
  if qrTrialBalance.IncludeOpeningBals then
  AndClauseThisYearBuget := 'and ((WPeriodID <= ' + IntToStr(ToID) + ' and  WPeriodID >= ' + IntToStr(FromID) + ' ) or WPeriodId = 0 or WPeriodId is null)'
  else
  AndClauseThisYearBuget := 'and (WPeriodID <= ' + IntToStr(ToID) + ' and  WPeriodID >= ' + IntToStr(FromID) + ' or WPeriodID is null)' ;
  qrTrialBalance.CBopeningBalanceOnly := fmTrialBalanceOptions.CBopeningBalanceOnly.Checked ;


  if fmTrialBalanceOptions.CBopeningBalanceOnly.Checked then
  AndClauseThisYearBuget := 'and (WPeriodId = 0 or WPeriodID is null)' ;


  AndClauseLastYear := 'and ((WPeriodID <= ' + IntToStr(ToID-13) + ' and  WPeriodID >= ' + IntToStr(FromID-13) + ' or WPeriodid is null) ) and (BActual = 1 or BActual is null)' ;

  if CBopeningBalanceOnly.Checked then
  // dummy select
  AndClauseLastYear := 'and (WPeriodId = -9999)' ;

  qrTrialBalance.ZQThisYear.close ;
  qrTrialBalance.QLastyear.close ;
  qrTrialBalance.QBuget.close ;
  qrTrialBalance.ZQAccounts.close ;
  qrTrialBalance.ZQAccountsSACCOUNTCODE.Size := MainAccountLength + 3 ;
  qrTrialBalance.ZQThisYear.SQL.Text := format(dmDatabase.SQLList.GetFormatedSQLByName('Trailbalance_Totals'),[AndClauseThisYearBuget+' and (BActual = 1 or BActual is null)',OrderSql]);
  qrTrialBalance.QLastyear.SQL.Text := format(dmDatabase.SQLList.GetFormatedSQLByName('Trailbalance_Buget'),[AndClauseLastYear  ]);
  qrTrialBalance.QBuget.SQL.Text := format(dmDatabase.SQLList.GetFormatedSQLByName('Trailbalance_Buget'),[AndClauseThisYearBuget +' and BActual = 0 ']);

 qrTrialBalance.zQThisYear.open ;
 qrTrialBalance.ZQAccounts.open ;
  qrTrialBalance.ZQAccounts.Filtered := False;
  // Need the filer in the trailbalance else the totals do not match

    qrTrialBalance.ReportTitle:='Trial Balance';
    ChangeReportFont(qrTrialBalance);
    bLyOnly := fmTrialBalanceOptions.cbLyOnly.Checked;

    qrTrialBalance.Page.PaperSize:=QRPrntr.A4;
    PrintReportProcess(cbDestination.ItemIndex,qrTrialBalance,edtCount.Text);

  BtnOk.Enabled:=True;

  dmDatabase.tblGroups.Close;
  qrTrialBalance.zQThisYear.close ;
  qrTrialBalance.QLastyear.close ;
  qrTrialBalance.QBuget.close ;
  qrTrialBalance.ZQAccounts.close ;
  finally
   Show ;
  end;

  if OptionsClose then Close
  else FormShow(Sender);

end;

procedure TfmTrialBalanceOptions.adbcboxShowSubAccountsKeyPress(
  Sender: TObject; var Key: Char);
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

procedure TfmTrialBalanceOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);


begin
     if Key = 112 then
        begin
             HtmlShowTopic(190);
             key := 0;

        end;
     if Key = 27 then
        begin
             Close;
             key := 0;

        end;
end;

procedure TfmTrialBalanceOptions.edtCountChange(Sender: TObject);
begin
   UpDown1.Position:=ValideInt(edtCount.Text);
end;

procedure TfmTrialBalanceOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);

  edtCount.Text:= IntTOStr(prnvars.NumCopies);
end;

procedure TfmTrialBalanceOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmTrialBalanceOptions.cbDestinationChange(Sender: TObject);
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
  LoadPrtOutBmp(Toimage,cbDestination.ItemIndex);
end;

procedure TfmTrialBalanceOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

Procedure TfmTrialBalanceOptions.LoadReoprtOp;
begin
  cbLyOnly.Checked := ReadReportOp('BTrialBalLyOnly',False).AsBoolean;
  dbcomboxSequence.ItemIndex := ReadReportOp('BTrialBalSeq',0).AsInteger ;
  CBUpostedonly.Checked := ReadReportOp('BUnpostedOnly',False).AsBoolean;
  CBBeforePosting.Checked := ReadReportOp('BAddUnposted',False).AsBoolean;
  CBopeningBalanceOnly.Checked := ReadReportOp('BOpeningBalansOnly',False).AsBoolean;
  if CBBeforePosting.Checked then
     CBBeforePostingClick(CBBeforePosting)
     else
     CBUpostedonly.Checked := false ;

end;

Procedure TfmTrialBalanceOptions.SaveReoprtOp;
begin

  WriteReportOp('BTrialBalSeq',IntToStr(dbcomboxSequence.ItemIndex));
  WriteReportOp('BOpeningBalansOnly',Bool2Str(CBopeningBalanceOnly.Checked));
  WriteReportOp('BTrialBalLyOnly',Bool2Str(cbLyOnly.Checked));
  WriteReportOp('BUnpostedOnly',Bool2Str(CBUpostedonly.Checked));
  WriteReportOp('BAddUnposted',Bool2Str(CBBeforePosting.Checked));
end;



procedure TfmTrialBalanceOptions.CBBeforePostingClick(Sender: TObject);
begin
CBUpostedonly.Visible :=  CBBeforePosting.Checked ;
if not CBUpostedonly.Visible then
   CBUpostedonly.Checked := false ;
end;

procedure TfmTrialBalanceOptions.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color := clHighlight;
  ReturnLookup:=CallLookup(FromID, 8);
  if ReturnLookup <> 'ESC' then
  begin
    FromID := StrToInt(ReturnLookup);
    edtFromDate.Text:= GetDateDesc(FromID);
  end;
  edtFromDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmTrialBalanceOptions.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color := clHighlight;
  ReturnLookup:=CallLookup(ToID, 8);
  if ReturnLookup <> 'ESC' then
  begin
    ToID := StrToInt(ReturnLookup);
    edtToDate.Text:= GetDateDesc(ToID);
  end;
  edtToDate.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmTrialBalanceOptions.edtFromDateDblClick(Sender: TObject);
begin
BitBtn1Click(self);
end;

procedure TfmTrialBalanceOptions.edtToDateDblClick(Sender: TObject);
begin
BitBtn2Click(self);
end;

procedure TfmTrialBalanceOptions.FormDestroy(Sender: TObject);
begin
with dmDatabase do
 begin
    tblSysParams.close;
    tblBatchTypes.close;
    qryUpdateBatch.close;
    tblDocHeader.close;
    tblReportingOptions.close;
    tblSysVars.close;
    tblOpReport.close;
  end;
end;

end.
