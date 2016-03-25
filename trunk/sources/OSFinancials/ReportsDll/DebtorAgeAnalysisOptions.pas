(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DebtorAgeAnalysisOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, wwdbdatetimepicker, db, Grids, DBGrids,
  Buttons,Variants, ComCtrls;

type
  TfmDebtorAgeAnalysisOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
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
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcbOpenItem: TDBCheckBox;
    cdRepGoups: TComboBox;
    LRepGroup: TLabel;
    CBAllDebtors: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure wwDBDateTimePickerAgeDateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure SaveReoprtOp;
    Procedure LoadReoprtOp;

  end;

var
  fmDebtorAgeAnalysisOptions: TfmDebtorAgeAnalysisOptions;

implementation

Uses
  GlobalFunctions, Database, Main, Lookup, DebtorAgeAnalysisReport, HTMLHelpAPI,
  PrintOptions, TcVariables, DatabaseAccess, Progress,LanguageChoice,XRoutines;

{$R *.DFM}

procedure TfmDebtorAgeAnalysisOptions.FormShow(Sender: TObject);
begin
  cdRepGoups.Items[0] := GetTextLang(1057);
  dmDatabase.tblSysVars.Open ;
  cdRepGoups.Items[1] := dmDatabase.tblSysVarsSDebtorReportName1.AsString ;
  cdRepGoups.Items[2] := dmDatabase.tblSysVarsSDebtorReportName2.AsString ;
  dmDatabase.tblSysVars.Close ;
  LRepGroup.Caption := GetTextLang(1794);
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  with dmDatabase.tblReportingOptions do begin
   Open;
   Edit;
   if FieldByName('SDebtorAgeRangeName0').AsString = '' then FieldByName('SDebtorAgeRangeName0').AsString := GetTextLang(1856);//'Current';
   if FieldByName('SDebtorAgeRangeName1').AsString = '' then FieldByName('SDebtorAgeRangeName1').AsString := GetTextLang(1857);//'30 Days';
   if FieldByName('SDebtorAgeRangeName2').AsString = '' then FieldByName('SDebtorAgeRangeName2').AsString := GetTextLang(1858);//'60 Days';
   if FieldByName('SDebtorAgeRangeName3').AsString = '' then FieldByName('SDebtorAgeRangeName3').AsString := GetTextLang(1859);//'90+ Days';
   if FieldByName('DDebtorAgeCurrentDate').AsString = '' then FieldByName('DDebtorAgeCurrentDate').AsString := DateToStr(Date);
   if FieldByName('WDebtorAgeMonth1').AsString = '' then FieldByName('WDebtorAgeMonth1').AsString := '1';
   if FieldByName('WDebtorAgeMonth2').AsString = '' then FieldByName('WDebtorAgeMonth2').AsString := '1';
   if FieldByName('WDebtorAgeMonth3').AsString = '' then FieldByName('WDebtorAgeMonth3').AsString := '1';
  end;
  Application.Processmessages;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  LoadReoprtOp;

  if dmDatabase.SetOfBooksPropertys.DataParameter.CBUseCurrentDateForReports then
     begin
       wwDBDateTimePickerAgeDate.Field.DataSet.Edit ;
       wwDBDateTimePickerAgeDate.Field.AsDateTime := date ;
       wwDBDateTimePickerAgeDateChange(self);
     end;
   cbDestination.SetFocus;

   Caption := GetTextLang(263);   //Header 263
   Label3.Caption := GetTextLang(246); //From account 246
   Label4.Caption := GetTextLang(208); //To 208
   Label2.Caption := GetTextLang(264);//Minimum amount 264
   dbcbOpenItem.Caption := GetTextLang(265);//use open item 265
   dbcbZeroBal.Caption := GetTextLang(266);//Ignore zero balance 266
   dbcbDetail.Caption := GetTextLang(267);//Show account detail 267
   dbcbSort.Caption := GetTextLang(268);//Sort by name 268
   dbcbShowTransactions.Caption := GetTextLang(269); //Show transactions 269
   Label5.Caption := GetTextLang(270);//Date of ageing 270
   Label6.Caption := GetTextLang(271);//up to 271
   Label7.Caption := GetTextLang(272);//Months up to 272
   Label8.Caption := GetTextLang(272);//Months up to 272
   Label9.Caption := GetTextLang(272);//Month up to 272
   btnOK.Caption := GetTextLang(167);//OK 167
   btnCancel.Caption := GetTextLang(168);//Cancel 168
   CBAllDebtors.Caption := GetTextLang(1084);// show all
   ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
end;

procedure TfmDebtorAgeAnalysisOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmDebtorAgeAnalysisOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmDebtorAgeAnalysisOptions.btnOkClick(Sender: TObject);
var
  AccBeg,AccEnd : String;
  AccIDF,AccIDt:Integer;

begin
  // Load Cursor
  SetT3Cursor(10);
  BtnOk.Enabled:=False;
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
 // why this ? set the type to dropdownlist as its mutch better and you will always have a itemindex
 // Sylvain: There is a problem when change text in runtime
  cdRepGoups.ItemIndex := cdRepGoups.Items.IndexOf(cdRepGoups.Text);

  with dmDatabase do begin
   AccBeg := GetMainAccountCode(dbedtFromAccount.Text);
   AccBeg := AccBeg+GetSubAccountCode(dbedtFromAccount.Text);
   AccEnd := GetMainAccountCode(dbedtToAccount.Text);
   AccEnd := AccEnd+GetSubAccountCode(dbedtToAccount.Text);
   qryDebtAge.Close;
   tblAccount.Open;
   tblAccount.Filtered:= False;
   SwapStr(AccBeg,AccEnd);

   if dbcbSort.Checked then
     tblAccount.IndexFieldNames := 'SDescription'
   else
     tblAccount.IndexFieldNames := 'SAccountCode';


     if CBAllDebtors.Checked then
     tblAccount.Filter :='WAccountTypeID=1 '
     else
     tblAccount.Filter :='WAccountTypeID=1 AND SACCOUNTCODE>='''+AccBeg +''' AND SACCOUNTCODE<='''+ AccEnd+'''';
   tblAccount.Filtered:= True;
   FillTmpAgeTable(True,tblReportingOptions.FieldByName('DDebtorAgeDateLimit4').AsDateTime,tblReportingOptions.FieldByName('DDebtorAgeDateLimit3').AsDateTime,tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsDateTime, tblReportingOptions.FieldByName('DDebtorAgeCurrentDate').AsDateTime,Not(dbcbOpenItem.Checked=False));
    _SetProgress(-2);
   // Create Sql Text lines ;
   qryDebtAge.Sql.Text:=CreateAgeSql(True,dbcbSort.Checked,cdRepGoups.ItemIndex);
   qryDebtAge.ParamByName('AccTypeID').AsInteger :=  1 ;
   qryDebtAge.ParamByName('date1').AsDateTime := tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsDateTime ;
   qryDebtAge.ParamByName('date2').AsDateTime := tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsDateTime ;
   qryDebtAge.ParamByName('date3').AsDateTime := tblReportingOptions.FieldByName('DDebtorAgeCurrentDate').AsDateTime ;

   qryDebtAge.Filtered := False;

    qryDebtAge.Open;
  end;
  dmDatabase.tblOilinks.Open;
  qrDebtorAgeAnalysis := TqrDebtorAgeAnalysis.Create(Self);
  try
  fmLangChoice.TranslateReport(qrDebtorAgeAnalysis);
  qrDebtorAgeAnalysis.ShowRepGrp:=cdRepGoups.ItemIndex;
  // Set group breaks
  if cdRepGoups.ItemIndex>0 then
    qrDebtorAgeAnalysis.RepGrpHead.Expression := MkFieldName;
  if dbcbSort.Checked then
     qrDebtorAgeAnalysis.QRGroup1.Expression :='qryDebtAge.SDescription + qryDebtAge.WAccountID'
   else
     qrDebtorAgeAnalysis.QRGroup1.Expression :='qryDebtAge.SACCOUNTCODE + qryDebtAge.WAccountID';
    _SetProgress(-2);
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblDebtor.Active:=True;
  PrintReportProcess(cbDestination.ItemIndex,qrDebtorAgeAnalysis,edtCount.Text);
  finally
   FreeAndNil(qrDebtorAgeAnalysis);
  end;
  dmDatabase.qryDebtAge.Close;
  dmDatabase.tblOilinks.Close;  
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblDebtor.Close;
  dmDatabase.tblSysVars.Close;
  BtnOk.Enabled:=True;
  dmDatabase.tblTmpAgeAnal.Close;
  dmDatabase.tblAccount.Close;  
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmDebtorAgeAnalysisOptions.wwDBDateTimePickerAgeDateChange(
  Sender: TObject);

var
  MDate:TDate;
  Coef  :Word;
begin
  if (dbedtNoMonth1.Text = '') or (dbedtNoMonth2.Text = '') or (dbedtNoMonth3.Text = '') then exit;
  if dmDatabase.tblReportingOptions.State <> dsEdit then exit;
  MDate:=wwDBDateTimePickerAgeDate.Date;
  // we need to change this so its works on days
  // theres also 14 day payment here.
  dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit1').AsDateTime := MDate;
  Coef:=Abs(Str2Int(dbedtNoMonth1.Text));
  dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsDateTime := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth2.Text));
  dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit3').AsDateTime := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth3.Text));
  dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit4').AsDateTime := IncMonthT(Mdate,-Coef);
end;


procedure TfmDebtorAgeAnalysisOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(179);
   key := 0;
  end;
end;

procedure TfmDebtorAgeAnalysisOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmDebtorAgeAnalysisOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmDebtorAgeAnalysisOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmDebtorAgeAnalysisOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmDebtorAgeAnalysisOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmDebtorAgeAnalysisOptions.SaveReoprtOp;
begin
  WriteReportOp('WDebtAgeGroup',IntToStr(cdRepGoups.ItemIndex));
  WriteReportOp('WDebtAgeShowAll',Bool2Str(CBAllDebtors.Checked));

end;

Procedure TfmDebtorAgeAnalysisOptions.LoadReoprtOp;
begin
  cdRepGoups.ItemIndex := ReadReportOp('WDebtAgeGroup','0').AsInteger;
  CBAllDebtors.Checked := ReadReportOp('WDebtAgeShowAll',true).Asboolean ;

end;


procedure TfmDebtorAgeAnalysisOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 3);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmDebtorAgeAnalysisOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 3);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
