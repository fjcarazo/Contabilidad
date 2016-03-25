(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit GLLedgerOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DB, ExtCtrls, DBCtrls, Mask, ComCtrls, Buttons;

type
  TfmGLLedgerOptions = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtFromDate: TEdit;
    edtToDate: TEdit;
    dbcboxNilBal: TDBCheckBox;
    dbcomboxSequence: TDBComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    dbcboxPeriodsSeperate: TDBCheckBox;
    dbcboxNewPage: TDBCheckBox;
    CbBatch: TCheckBox;
    CbShowDet: TCheckBox;
    LcbGroup: TLabel;
    cbGroup: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dbcomboxWhichYear: TComboBox;
    dbedtFromAccount: TEdit;
    dbedtToAccount: TEdit;
    procedure FormShow(Sender: TObject);
    procedure dbcomboxOutputKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure Bitprn1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure dbcomboxSequenceChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbcomboxWhichYearChange(Sender: TObject);
  private
    Procedure CreateSqlText;
    Function  GetTypeGrpID:Integer;
    Function  GetGrpIDFilter:String;
    procedure ShowToAndFromInGui ;
    { Private declarations }
  public
    ReportAccountType:Integer;
    Function  CheckGrp:Integer;    
    { Public declarations }
  end;

 function fmGLLedgerOptions: TfmGLLedgerOptions;
 
var
  afmGLLedgerOptions: TfmGLLedgerOptions;

implementation

Uses
  Database, Main, Lookup, GlLedgerReport, HtmlHelpAPI, LanguageChoice,
  GlobalFunctions, TcVariables, DatabaseAccess,XRoutines;

{$R *.DFM}


function fmGLLedgerOptions: TfmGLLedgerOptions;
begin
   if not assigned(afmGLLedgerOptions) then
   afmGLLedgerOptions:= TfmGLLedgerOptions.Create(Application);
   result := afmGLLedgerOptions ;
end;

Function TfmGLLedgerOptions.CheckGrp:Integer;
begin
  Result := 2 - (dbcomboxSequence.Items.Count - dbcomboxSequence.ItemIndex) ;
  if Not (Result in [0,1]) then
    Result := -1;
end;


Function TfmGLLedgerOptions.GetTypeGrpID:Integer;
begin
 Result := CheckGrp;
 if Result<0 then exit;
 ReSult := Result + 20 + ReportAccountType * 2;

end;

Function TfmGLLedgerOptions.GetGrpIDFilter:String;
Var
  ID,TID:integer;
  Function Grp:String;
  begin
    Result := IntToStr(CheckGrp+1);
  end;
begin
  Result := '';
  TID := GetTypeGrpID;
  if (TID>0) AND(cbGroup.ItemIndex>0) then
  begin
    ID:= LocateGroup(cbGroup.TExt,TID);
    if ID>0 then
      Result := ' AND (WReportingGroup'+Grp+'ID='''+IntToStr(ID)+''')';
  end;
end;

procedure TfmGLLedgerOptions.FormShow(Sender: TObject);

begin
 dbcomboxWhichYear.Items[0] := GetTextLang(603);//Thisyear
 dbcomboxWhichYear.Items[1] := GetTextLang(604);//Lastyear
 dbcomboxWhichYear.Items[2] := GetTextLang(3012);//Lastyear
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  CbBatch.Caption := GetTextLang(2190);
  CbShowDet.Caption := GetTextLang(2191);
  dbcomboxSequence.Items.Clear;
  cbGroup.ItemIndex:=0;
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  if ReportAccountType=0 then
    dbcomboxSequence.Items.Add(GetTextLang(1109));//'Account Type'
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  //get the periods
  Case ReportAccountType of
    0:Begin // Reporting GLLeger
       Caption := GetTextLang(1034)  {'Ledger Options'};
       FromID := dmDatabase.tblReportingOptions.FieldByName('WGLLedgerFromDate').AsInteger;
       ToID := dmDatabase.tblReportingOptions.FieldByName('WGLLedgerToDate').AsInteger;
       dbcomboxSequence.DataField:='SGLLedgerSequence';
       if dmDatabase.tblReportingOptions.FieldByName('SGLLedgerWhichYear').asstring = '1' then
       dbcomboxWhichYear.ItemIndex := 1 else
       if dmDatabase.tblReportingOptions.FieldByName('SGLLedgerWhichYear').asstring = '2' then
       dbcomboxWhichYear.ItemIndex := 2 else
       dbcomboxWhichYear.ItemIndex := 0  ;

       // account code is to small for 4 digets accoutn code.
       // lets try to write out this reporting options

       dbedtFromAccount.text := ReadReportOp('SGLLedgerFromAccount','').AsString ;
       dbedtToAccount.text := ReadReportOp('SGLLedgerToAccount','').AsString ;
       dbcboxPeriodsSeperate.DataField:='BGLLedgerEachPeriod';
       dbcboxNewPage.DataField:='BGLLedgerNewPage';
       dbcboxNilBal.DataField:='BGLLedgerNilBalances';
      end;
    1:Begin // Reporting Debtors
       Caption:= GetTextLang(275) {'Debtor Transaction Report Options'};
       FromID := dmDatabase.tblReportingOptions.FieldByName('WDebTransFromDate').AsInteger;
       ToID := dmDatabase.tblReportingOptions.FieldByName('WDebTransToDate').AsInteger;
       dbcomboxSequence.DataField:='SDebTransSequence';

       if dmDatabase.tblReportingOptions.FieldByName('SDebTransWhichYear').asstring = '1' then
       dbcomboxWhichYear.ItemIndex := 1 else
       if dmDatabase.tblReportingOptions.FieldByName('SDebTransWhichYear').asstring = '2' then
       dbcomboxWhichYear.ItemIndex := 2 else
       dbcomboxWhichYear.ItemIndex := 0  ;
       dbedtFromAccount.text := ReadReportOp('SDebTransFromAccount','').AsString ;
       dbedtToAccount.text := ReadReportOp('SDebTransToAccount','').AsString  ;
       dbcboxPeriodsSeperate.DataField:='BDebTransEachPeriod';
       dbcboxNewPage.DataField:='BDebTransNewPage';
       dbcboxNilBal.DataField:='BDebTransIncNilBal';
      end;
    2:Begin // Reporting Creditors
       Caption:= GetTextLang(249) {'Creditor Transaction Report Options'};
       FromID := dmDatabase.tblReportingOptions.FieldByName('WCredTransFromDate').AsInteger;
       ToID := dmDatabase.tblReportingOptions.FieldByName('WCredTransToDate').AsInteger;
       dbcomboxSequence.DataField:='SCredTransSequence';


       if dmDatabase.tblReportingOptions.FieldByName('SCredTransWhichYear').asstring = '1' then
       dbcomboxWhichYear.ItemIndex := 1 else
       if dmDatabase.tblReportingOptions.FieldByName('SCredTransWhichYear').asstring = '2' then
       dbcomboxWhichYear.ItemIndex := 2 else
       dbcomboxWhichYear.ItemIndex := 0  ;
       dbedtFromAccount.text := ReadReportOp('SCredTransFromAccount','').AsString ;
       dbedtToAccount.text := ReadReportOp('SCredTransToAccount','').AsString;

       dbcboxPeriodsSeperate.DataField:='BCredTransEachPeriod';
       dbcboxNewPage.DataField:='BCredTransNewPage';
       dbcboxNilBal.DataField:='BCredTransIncNilBal';
      end;
  end;
  ShowToAndFromInGui ;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;

 //  Caption := GetTextLang(287); //Header 278
   Label6.Caption := GetTextLang(246);  //From account 246
   Label2.Caption := GetTextLang(247);//Sequence 247
   Label4.Caption := GetTextLang(243); //From reporting date 243
   dbcboxNilBal.Caption := GetTextLang(248);//Include nil balances 248
   Label3.Caption := GetTextLang(242);//Which year 242
   Label7.Caption := GetTextLang(208);   //To  208
   Label5.Caption := GetTextLang(208); //To  208
   dbcboxPeriodsSeperate.Caption := GetTextLang(1035); //Each period seperately
   dbcboxNewPage.Caption := GetTextLang(1036); //New page per account ?
   OkCancel(btnOK,btnCancel);
   ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
   cbGroup.Items[0] := GetTextLang(20055);//Lastyear
   LcbGroup.Caption :=  GetTextLang(1794);//Reporting Group
end;

procedure TfmGLLedgerOptions.dbcomboxOutputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(441){Do you want to continue reporting ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmGLLedgerOptions.btnOkClick(Sender: TObject);
var
  FromDate,
  ToDate       : TDateTime;
  Main1, Main2 : String;
begin
  Main1 := GetMainAccountCode(dbedtFromAccount.Text)+
        GetSubAccountCode(dbedtFromAccount.Text);
  Main2 := GetMainAccountCode(dbedtToAccount.Text)+
        GetSubAccountCode(dbedtToAccount.Text);
  SwapStr(Main1,Main2);
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  FromDate := dmDatabase.tblPeriodsDStartDate.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  ToDate := dmDatabase.tblPeriodsDEndDate.Value;
  dmDatabase.tblPeriods.Close;
  if FromDate > ToDate then
  begin
    OSFMessageDlg(format(gettextlang(2095),[DateToStr(FromDate),DateToStr(ToDate)]), mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;
  dmDatabase.qryTransactionReport.Close;
  CreateSqlText;
  dmDatabase.qryTransactionReport.Filtered := False;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Filter:='SACCOUNTCODE>='''+Main1+''' And SACCOUNTCODE<='''+Main2 +'''';
  Case ReportAccountType of
    0:Begin // Reporting GLLeger
       WriteReportOp('SGLLedgerFromAccount',dbedtFromAccount.text);
       WriteReportOp('SGLLedgerToAccount',dbedtToAccount.text);

       dmDatabase.tblReportingOptions.FieldByName('SGLLedgerWhichYear').asstring := IntToStr(dbcomboxWhichYear.ItemIndex) ;
       dmDatabase.tblReportingOptions.FieldByName('WGLLedgerFromDate').AsInteger := FromID;
       dmDatabase.tblReportingOptions.FieldByName('WGLLedgerToDate').AsInteger := ToID;
//       dmDatabase.qryTransactionReport.Filter := 'WAccountTypeID <> ''1'' and WAccountTypeID <> ''2''';
       dmDatabase.tblAccount.Filter :=dmDatabase.tblAccount.Filter+ ' AND WAccountTypeID <> ''1'' and WAccountTypeID <> ''2''';
      end;
    1:Begin // Reporting Debtors
       WriteReportOp('SDebTransFromAccount',dbedtFromAccount.text)  ;
       WriteReportOp('SDebTransToAccount',dbedtToAccount.text) ;

       dmDatabase.tblReportingOptions.FieldByName('WDebTransFromDate').AsInteger := FromID;
       dmDatabase.tblReportingOptions.FieldByName('WDebTransToDate').AsInteger := ToID;
       dmDatabase.tblAccount.Filter :=dmDatabase.tblAccount.Filter+ 'AND WAccountTypeID = ''1''';
       dmDatabase.tblReportingOptions.FieldByName('SDebTransWhichYear').asstring := IntToStr(dbcomboxWhichYear.ItemIndex) ;
      end;
    2:Begin // Reporting Creditors
       WriteReportOp('SCredTransFromAccount',dbedtFromAccount.text);
       WriteReportOp('SCredTransToAccount',dbedtToAccount.text);

       dmDatabase.tblReportingOptions.FieldByName('SCredTransWhichYear').asstring := IntToStr(dbcomboxWhichYear.ItemIndex) ;
       dmDatabase.tblReportingOptions.FieldByName('WCredTransFromDate').AsInteger := FromID;
       dmDatabase.tblReportingOptions.FieldByName('WCredTransToDate').AsInteger := ToID;
       dmDatabase.tblAccount.Filter :=dmDatabase.tblAccount.Filter+ 'AND WAccountTypeID = ''2''';
      end;
  end;
  dmDatabase.tblAccount.Filter := dmDatabase.tblAccount.Filter + GetGrpIDFilter;
  dmDatabase.tblAccount.Filtered:=True;


  Case dbcomboxSequence.ItemIndex of
  1: dmDatabase.tblAccount.IndexFieldNames:='SDescription';
  2: dmDatabase.tblAccount.IndexFieldNames:='WAccountTypeID';
  else
    dmDatabase.tblAccount.IndexFieldNames:='SACCOUNTCODE';
  end;

  if dmDatabase.tblReportingOptions.State<>dsEdit then
   dmDatabase.tblReportingOptions.Edit;
   dmDatabase.tblReportingOptions.Post;
//  dmDatabase.tblAccount.Close;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblBatchTypes.Open;
  dmDatabase.tblMessage.Open;
  dmDatabase.tblTotals.Open;
  dmDatabase.qryTransactionReport.ParamByName('FromAcc').Value := Main1;
  dmDatabase.qryTransactionReport.ParamByName('ToAcc').Value := Main2;
  dmDatabase.qryTransactionReport.ParamByName('FromDate').Value := FromID;
  dmDatabase.qryTransactionReport.ParamByName('ToDate').Value := ToID;
  dmDatabase.qryTransactionReport.Open;
  dmDatabase.qryTransactionReport.Filtered := True;
  qrLedger := TqrLedger.Create(Self);
  try
  // Need the cred and debitors control to calculate totals begin and end.
  qrLedger.DebtorsControl := dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount ;
  qrLedger.CreditorsControl := dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount ;


  if CbShowDet.Checked then else
  begin
    qrLedger.QRSubDetail1.Height:=0;
    qrLedger.QRLabel15.Left :=3;
  end;
  qrLedger.qrBdPeriod.Enabled := dbcboxPeriodsSeperate.Checked;
  qrLedger.qrBdPeriodFoot.Enabled := dbcboxPeriodsSeperate.Checked;
  qrLedger.Foot1.Enabled:= Not qrLedger.qrBdPeriodFoot.Enabled;
  qrLedger.QRGroup1.ForceNewPage := dbcboxNewPage.Checked;
  qrLedger.qrBottPage.Enabled := qrLedger.QRGroup1.ForceNewPage;
  qrLedger.grBatch.Enabled :=  CbBatch.Checked;
  qrLedger.BatchFoot.Enabled := qrLedger.grBatch.Enabled;
//  qrGLLedger.Preview;
  LegerTypeID := ReportAccountType;
  PrintReportProcess(cbDestination.ItemIndex,qrLedger,edtCount.Text);
  finally
  qrLedger.Free;
  end;


  dmDatabase.tblPeriods.Close;
  dmDatabase.tblBatchTypes.Close;
  dmDatabase.tblMessage.Close;
  dmDatabase.tblTotals.Close;
  dmDatabase.qryTransactionReport.Close;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Filter:='';
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmGLLedgerOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGLLedgerOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

with dmDatabase do
 begin
    tblSysParams.close;
    tblBatchTypes.close;
    qryUpdateBatch.close;
    tblDocHeader.close;
  end;
end;

procedure TfmGLLedgerOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
        Case ReportAccountType of
        0:HtmlShowTopic(189);
        1:HtmlShowTopic(183);
        2:HtmlShowTopic(174);
        else
          HtmlShowTopic(185);
        end;
         key := 0;
        end;
     if Key = 27 then
        begin
          Close;
          Key:=0;
        end;
end;

procedure TfmGLLedgerOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmGLLedgerOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmGLLedgerOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmGLLedgerOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmGLLedgerOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

Procedure TfmGLLedgerOptions.CreateSqlText;
begin
with dmDatabase.qryTransactionReport.SQL do
begin
  Clear;

  add(dmDatabase.SQLList.GetFormatedSQLByName('GLLedgerOptions_Transactions') + GetGrpIDFilter ) ;
     if CbBatch.Checked then
     begin
       if dbcboxPeriodsSeperate.Checked <> true then
         Add('  ORDER BY Account.SACCOUNTCODE, WBatchTypeID , Transact.DDate , WTransactionID ')
       else
         Add('  ORDER BY Account.SACCOUNTCODE, Transact.DDate, WBatchTypeID,WTransactionID ');
     end
     else
       Add('  ORDER BY Account.SACCOUNTCODE, Transact.DDate,WTransactionID ');
end;

end;
procedure TfmGLLedgerOptions.dbcomboxSequenceChange(Sender: TObject);
begin
  LoadGroups(cbGroup,GetTypeGrpID);
  cbGroup.ItemIndex:=0;
end;

procedure TfmGLLedgerOptions.BitBtn3Click(Sender: TObject);
begin
  Highlight(edtFromDate);

  if dbcomboxWhichYear.ItemIndex = 1 then
    ReturnLookup:=CallLookup(FromID, 9)
    else
  if dbcomboxWhichYear.ItemIndex = 2 then
     ReturnLookup:=CallLookup(FromID, 19)
  else
    ReturnLookup:=CallLookup(FromID, 8);
  BackNormal(edtFromDate);
  if (ReturnLookup <> 'ESC') and (dbcomboxWhichYear.ItemIndex <> -1) then
  begin
    FromID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
    edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
    dmDatabase.tblPeriods.Close;
    SelectNext(ActiveControl, True, True);
  end;

end;

procedure TfmGLLedgerOptions.BitBtn4Click(Sender: TObject);
begin
  HighLight(edtToDate);
  if dbcomboxWhichYear.ItemIndex = 1 then
    ReturnLookup:=CallLookup(ToID, 9)
    else
  if dbcomboxWhichYear.ItemIndex = 2 then
     ReturnLookup:=CallLookup(ToID, 19)
  else
    ReturnLookup:=CallLookup(ToID, 8);

  BackNormal(edtToDate);
  if (ReturnLookup <> 'ESC') and (dbcomboxWhichYear.ItemIndex <> -1) then
  begin
    ToID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
    edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
    dmDatabase.tblPeriods.Close;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmGLLedgerOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  case ReportAccountType of
   1,2:ReturnLookup:=CallLookup(dbedtToAccount.Text,ReportAccountType+2 );
   else
   ReturnLookup:=CallLookup(dbedtToAccount.Text, 1);
  end;
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmGLLedgerOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  case ReportAccountType of
   1,2:ReturnLookup:=CallLookup(dbedtFromAccount.Text,ReportAccountType+2 );
   else

   ReturnLookup:=CallLookup(dbedtFromAccount.Text, 1);
  end;
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmGLLedgerOptions.dbcomboxWhichYearChange(Sender: TObject);
begin
 // thisyear
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

procedure TfmGLLedgerOptions.ShowToAndFromInGui;
begin
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
  dmDatabase.tblPeriods.Close;

end;

end.
