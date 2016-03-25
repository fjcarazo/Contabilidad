(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DebtorStatementOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, wwdbdatetimepicker, db, Buttons,
  ComCtrls, Gauges;

type
  TfmDebtorStatementOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbedtFromAccount: TDBEdit;
    dbedtToAccount: TDBEdit;
    dbedtMinAmount: TDBEdit;
    wwDBDateTimePickerStatementDate: TwwDBDateTimePicker;
    wwDBDateTimePicker30Days: TwwDBDateTimePicker;
    wwDBDateTimePicker60Days: TwwDBDateTimePicker;
    wwDBDateTimePicker90Days: TwwDBDateTimePicker;
    dbedtRangeName1: TDBEdit;
    dbedtRangeName2: TDBEdit;
    dbedtRangeName3: TDBEdit;
    dbedtRangeName4: TDBEdit;
    dbcbOpenItem: TDBCheckBox;
    dbcbShowTaxSeperate: TDBCheckBox;
    dbedtNoMonth1: TDBEdit;
    dbedtNoMonth2: TDBEdit;
    dbedtNoMonth3: TDBEdit;
    dbcbShowTaxTrans: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    lblCurrent: TLabel;
    PrgPnl: TPanel;
    Gauge1: TGauge;
    Label1: TLabel;
    CBSortbyName: TCheckBox;
    cbContact: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure wwDBDateTimePickerStatementDateChange(Sender: TObject);
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
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    procedure CreateQry;
  public
    iddoctype : Integer ;
    { Public declarations }
  end;

var
  fmDebtorStatementOptions: TfmDebtorStatementOptions;

implementation

Uses
  GlobalFunctions, Database, Main, Lookup, DebtorStatementReport, HTMLHelpAPI,
  TrialBalance, TcVariables, DatabaseAccess, XRoutines, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

Procedure TfmDebtorStatementOptions.LoadReoprtOp;
begin
  if idDocType=2 then
  begin
    CBSortbyName.Checked := ReadReportOp('BRemitSort').AsBoolean;
    cbContact.Checked := ReadReportOp('BRemitContact',False).AsBoolean;
  end
  else
  begin
    CBSortbyName.Checked := ReadReportOp('BStatementSort',False).AsBoolean;
    cbContact.Checked := ReadReportOp('BStatementContact',False).AsBoolean;
  end;
end;

Procedure TfmDebtorStatementOptions.SaveReoprtOp;
begin
  if idDocType=2 then
  begin
    WriteReportOp('BRemitSort',Bool2Str(CBSortbyName.Checked));
    WriteReportOp('BRemitContact',Bool2Str(cbContact.Checked));
  end
  else
  begin
    WriteReportOp('BStatementSort',Bool2Str(CBSortbyName.Checked));
    WriteReportOp('BStatementContact',Bool2Str(cbContact.Checked));
  end;
end;


Procedure TfmDebtorStatementOptions.CreateQry;
Var
  S:String;
  MinAmount : Real;
Begin
  with dmDatabase do begin
    qryDebtStatement.SQL.Clear;
    if IdDocType=2 then
    begin
      S:='';
      MinAmount := Abs(tblReportingOptions.FieldByName('FRemittanceMinAmount').AsFloat);
      if MinAmount<>0 then
      begin
        S:=' AND  (tmpAgeAn.FTotal<='+ FloatToSQLStr(-MinAmount);
        S:=S + ' Or tmpAgeAn.FTotal>='+ FloatToSQLStr(MinAmount)+')';
      end;
  if dbcbOpenItem.Checked=False then
  begin // case of BBF
      S:=S + 'and (DDate <= :Date1)'
  end
  else
  begin
      S:=S + 'and ((DDate <= :Date1 AND FOutStandingAmount <> 0) OR (DDate > :date2 AND DDate <= :date3))';
  end;



      if  fmDebtorStatementOptions.CBSortbyName.Checked then
        S := S + ' ORDER BY tmpAgeAn.SDescription, Transact.DDate,Transact.SReference'
      else
        S := S + ' ORDER BY tmpAgeAn.SACCOUNTCODE, Transact.DDate,Transact.SReference';
       qryDebtStatement.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('remittance_creditor') + S ;
      end
      else
      begin
      S:='';
      MinAmount := Abs(tblReportingOptions.FieldByName('FDebtStatementMinAmount').AsFloat);
      if MinAmount<>0 then
      begin
        S:=' AND  (tmpAgeAn.FTotal<='+ FloatToSQLStr(-MinAmount);
        S:=S + ' Or tmpAgeAn.FTotal>='+ FloatToSQLStr(MinAmount)+')';
      end;

  if dbcbOpenItem.Checked=False then
  begin // case of BBF
      S:=S + 'and (DDate <= :Date1)'
  end
  else
  begin
      S:=S + 'and ((DDate <= :Date1 AND FOutStandingAmount <> 0) OR (DDate > :date2 AND DDate <= :date3))';
  end;


      if  fmDebtorStatementOptions.CBSortbyName.Checked then
        S := S + ' ORDER BY tmpAgeAn.SDescription, Transact.DDate,Transact.SReference'
      else
        S := S + ' ORDER BY tmpAgeAn.SACCOUNTCODE, Transact.DDate,Transact.SReference';
      qryDebtStatement.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('remittance_debtor') + S
      end;
  end;

end;

procedure TfmDebtorStatementOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  LoadReoprtOp;
  if idDocType = 2 then
  begin
    Caption:=GetTextLang(1089){'Remittance Advice'};
    dbedtFromAccount.Datafield :='SRemittanceFromAcc';
    dbedtToAccount.DataField :='SRemittanceToAcc';
    dbedtMinAmount.DataField :='FRemittanceMinAmount';
    wwDBDateTimePickerStatementDate.DataField:='DRemittanceDateLimit1';
//    wwDBDateTimePickerCurrent.DataField := 'DRemittanceDateLimit1';
    wwDBDateTimePicker30Days.DataField := 'DRemittanceDateLimit2';
    wwDBDateTimePicker60Days.DataField := 'DRemittanceDateLimit3';
    wwDBDateTimePicker90Days.DataField := 'DRemittanceDateLimit4';
    dbedtRangeName1.DataField:= 'SRemittanceAgeName0';
    dbedtRangeName2.DataField:= 'SRemittanceAgeName1';
    dbedtRangeName3.DataField:= 'SRemittanceAgeName2';
    dbedtRangeName4.DataField:= 'SRemittanceAgeName3';
    dbedtNoMonth1.DataField:=  'WRemittanceMonth1';
    dbedtNoMonth2.DataField:= 'WRemittanceMonth2';
    dbedtNoMonth3.DataField:= 'WRemittanceMonth3';
    dbcbShowTaxTrans.DataField:='BRemittanceTaxTransact';
    dbcbShowTaxSeperate.DataField:='BRemittanceTaxSeperate';
    dbcbOpenItem.DataField:='BRemittanceOpenItem';
  end
  else
  begin
    idDocType:=1;
    dbedtFromAccount.Datafield :='SDebtStatementFromAcc';
    dbedtToAccount.DataField :='SDebtStatementToAcc';
    dbedtMinAmount.DataField :='FDebtStatementMinAmount';
    wwDBDateTimePickerStatementDate.DataField:='DDebtStatementDateLimit1';
//    wwDBDateTimePickerCurrent.DataField := 'DDebtStatementDateLimit1';
    wwDBDateTimePicker30Days.DataField := 'DDebtStatementDateLimit2';
    wwDBDateTimePicker60Days.DataField := 'DDebtStatementDateLimit3';
    wwDBDateTimePicker90Days.DataField := 'DDebtStatementDateLimit4';
    dbedtRangeName1.DataField:= 'SDebtStatementAgeName0';
    dbedtRangeName2.DataField:= 'SDebtStatementAgeName1';
    dbedtRangeName3.DataField:= 'SDebtStatementAgeName2';
    dbedtRangeName4.DataField:= 'SDebtStatementAgeName3';
    dbedtNoMonth1.DataField:=  'WDebtStatementMonth1';
    dbedtNoMonth2.DataField:= 'WDebtStatementMonth2';
    dbedtNoMonth3.DataField:= 'WDebtStatementMonth3';
    dbcbShowTaxTrans.DataField:='BDebtStatementTaxTransact';
    dbcbShowTaxSeperate.DataField:='BDebtStatementTaxSeperate';
    dbcbOpenItem.DataField:='BDebtStatementOpenItem';
    Caption:=GetTextLang(1090){'Debtor Statements'};
  end;
  if dbedtNoMonth1.Text = '' then
    dbedtNoMonth1.Text:='1';
  if dbedtNoMonth2.Text = '' then
    dbedtNoMonth2.Text:='1';
  if dbedtNoMonth3.Text = '' then
    dbedtNoMonth3.Text:='1';
  if wwDBDateTimePickerStatementDate.Text='' then
    wwDBDateTimePickerStatementDate.date:=Date;
  lblCurrent.Caption := wwDBDateTimePickerStatementDate.Text;
  if TCashCompiledAs>=10 then
  begin
    dbcbOpenItem.Checked := False;
    dbcbOpenItem.Visible:=False;
  end;
  if dmDatabase.SetOfBooksPropertys.DataParameter.CBUseCurrentDateForReports then
     begin
       wwDBDateTimePickerStatementDate.Field.DataSet.Edit ;

       if TDataBaseRoutines.GetPeriodEndDate(26) < date then
        wwDBDateTimePickerStatementDate.Field.AsDateTime := TDataBaseRoutines.GetPeriodEndDate(26)
        else   wwDBDateTimePickerStatementDate.Field.AsDateTime := date ;

       wwDBDateTimePickerStatementDateChange(self);
     end;
end;

procedure TfmDebtorStatementOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmDebtorStatementOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmDebtorStatementOptions.btnOkClick(Sender: TObject);
var
  TmAcc1,TmAcc2,
  Acc1, Acc2 : String;
  Count,
  TotCount:LongInt;
begin
  // Load Cursor
//  SetT3Cursor(10);
  Hide ;
  try
  Acc1 := GetMainAccountCode(dbedtFromAccount.Text)+
     GetSubAccountCode(dbedtFromAccount.Text);
  Acc2 := GetMainAccountCode(dbedtToAccount.Text)+
     GetSubAccountCode(dbedtToAccount.Text);
  if dmDatabase.tblReportingOptions.State<>dsBrowse then
   dmDatabase.tblReportingOptions.Post;
   SaveReoprtOp;

  with dmDatabase do
  begin
   tblAccount.Open;
   tblAccount.Filtered:= False;
   tblAccount.First;
   // TODO : BDEINDEX

   if  CBSortbyName.Checked then
     tblAccount.IndexFieldNames := 'SDescription'
   else
    tblAccount.IndexFieldNames := 'SAccountCode';

   SwapStr(Acc1,Acc2);
   tblAccount.Filter :='WAccountTypeID='+IntToStr(IdDocType)+ ' AND SACCOUNTCODE>='''+Acc1 +''' AND SACCOUNTCODE<='''+ Acc2+'''';
{
   end;
}
   tblAccount.Filtered:= True;
   if IdDocType=2 then
     FillTmpAgeTable(False,tblReportingOptions.FieldByName('DRemittanceDateLimit4').AsDateTime,tblReportingOptions.FieldByName('DRemittanceDateLimit3').AsDateTime,tblReportingOptions.FieldByName('DRemittanceDateLimit2').AsDateTime, tblReportingOptions.FieldByName('DRemittanceDateLimit1').AsDateTime,Not(dbcbOpenItem.Checked=False),true)
   else
     FillTmpAgeTable(True,tblReportingOptions.FieldByName('DDebtStatementDateLimit4').AsDateTime,tblReportingOptions.FieldByName('DDebtStatementDateLimit3').AsDateTime,tblReportingOptions.FieldByName('DDebtStatementDateLimit2').AsDateTime, tblReportingOptions.FieldByName('DDebtStatementDateLimit1').AsDateTime,Not(dbcbOpenItem.Checked=False),true);
  end;
//
  dmDatabase.tblSysVars.Open;
  dmDatabase.qryDebtStatement.Close;
  // Added By Sylvain
  CreateQry;
  //
  qrDebtorStatement := TqrDebtorStatement.Create(Self);
  try
  SetUpQrFm(qrDebtorStatement);

 if dbcbOpenItem.Checked=False then
  begin // case of BBF
    if IdDocType=1 then
      dmDatabase.qryDebtStatement.paramByname('date1').Asdatetime :=  dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit1').Asdatetime 
    else
      dmDatabase.qryDebtStatement.paramByname('date1').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit1').Asdatetime ;
  end
  else
  begin
    qrDebtorStatement.qrBBFHeader.Height:=0;
    if  IdDocType=1 then // use it as Statement
      begin
        dmDatabase.qryDebtStatement.paramByname('date1').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit2').Asdatetime ;
        dmDatabase.qryDebtStatement.paramByname('date2').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit2').Asdatetime ;
        dmDatabase.qryDebtStatement.paramByname('date3').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit1').Asdatetime ;
      end
    else // use it as remittance Ad
      begin
        dmDatabase.qryDebtStatement.paramByname('date1').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit2').Asdatetime ;
        dmDatabase.qryDebtStatement.paramByname('date2').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit2').Asdatetime ;
        dmDatabase.qryDebtStatement.paramByname('date3').Asdatetime := dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit1').Asdatetime ;
      end
  end;

  dmDatabase.qryDebtStatement.Open;
  dmDatabase.tblOilinks.Open;

  qrDebtorStatement.iddoctype := iddoctype ;

  qrDebtorStatement.ShowFrames := ReadReportOp('BStmtPrntFrames',True).AsBoolean;
  qrDebtorStatement.ShowLogo := ReadReportOp('BStmtPrntLogo',True).AsBoolean;

//  dmDatabase.tblContact.Open;
  dmDatabase.qryDebtStatement.Filtered := False;
  qrDebtorStatement.BDebt:=True;
  qrDebtorStatement.ShowTaxTrans:=dbcbShowTaxTrans.Checked;
  qrDebtorStatement.ShowContact:= cbContact.Checked;
  if IdDocType<>1 then qrDebtorStatement.BDebt:=False;


  if Not (dmDatabase.tblsysVarsWStatementPaperID.Value in [50,53]) then
    qrDebtorStatement.Page.PaperSize:=qrTrialBalance.Page.PaperSize;
  qrDebtorStatement.BPrinted:=False;
    // This SysVars field is re-useded for Statements messages
  qrDebtorStatement.ShowMes:=dmdatabase.tblsysVarsBCreateBalanceLink.Value = 1;
  if cbDestination.ItemIndex=3 then
  begin
    PrgPnl.Visible:=True;
    dmDatabase.qGenII.Close;
    dmDatabase.qGenII.Filter:='';
    dmDatabase.qGenII.SQl.Clear;
    dmDatabase.qGenII.SQl.add(' Select SACCOUNTCODE, WAccountID from Account Where '+ ' (SACCOUNTCODE >= ''' + Acc1 + ''' AND SACCOUNTCODE <= ''' + Acc2 + ''')'+ ' Order by SACCOUNTCODE');
    dmDatabase.qGenII.Open;
    TotCount:=dmDatabase.qGenII.RecordCount;
    Gauge1.MaxValue:=TotCount;
    dmDatabase.qGenII.first;
    Count:=0;
    while not dmDatabase.qGenII.Eof do
    begin
      Inc(Count);
      Gauge1.Progress:=Count;
      Gauge1.Repaint;
      dmDatabase.qryDebtStatement.Filtered := False;
      dmDatabase.qryDebtStatement.Filter := 'SACCOUNTCODE='''+dmDatabase.qGenII.Fields[0].AsString+ '''';
      dmDatabase.qryDebtStatement.Filtered := True;
       // Prepareing e-mail List
      // Structure: DocTypeID, DocID, DocNo , AccountID , Report File No
       RepNbr:=NextEmailFileNo;
          EmailList.Add(IntToStr(idDocType+16)+','+'' + ','
          + dmDatabase.qGenII.Fields[0].AsString +','
            + dmDatabase.qGenII.Fields[1].AsString +','
            + IntToStr(RepNbr));
          //
        if (Count>=TotCount) or
          (dmDatabase.qGenII.Eof) then
          PrintReportProcess(cbDestination.ItemIndex,qrDebtorStatement,'#&'+IntToStr(TotCount))
        else
          PrintReportProcess(cbDestination.ItemIndex,qrDebtorStatement,'#&');
      dmDatabase.qGenII.Next;
    end;
    dmDatabase.qGenII.Close;
    PrgPnl.Visible:=False;
    Gauge1.Progress:=0;
  end
  else
  begin
    dmDatabase.qryDebtStatement.Filtered := False;
//    dmDatabase.qryDebtStatement.Filter := TmpFilter +' AND (SACCOUNTCODE >= ''' + Acc1 + ''' AND SACCOUNTCODE <= ''' + Acc2 + ''')';
    dmDatabase.qryDebtStatement.Filter := ' (SACCOUNTCODE >= ''' + Acc1 + ''' AND SACCOUNTCODE <= ''' + Acc2 + ''')';
    dmDatabase.qryDebtStatement.Filtered := True;
    PrintReportProcess(cbDestination.ItemIndex,qrDebtorStatement,edtCount.Text);
  end;
  finally
   FreeAndNil(qrDebtorStatement);
  end;
  dmDatabase.tblSysVars.Close;
  dmDatabase.qryDebtStatement.Close;
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblOilinks.Close;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblAccount.Filtered:= False;
  dmDatabase.tblAccount.Filter:='';
  // TODO : BDEINDEX
  // dmDatabase.tblAccount.IndexName := 'Ind_AccountCode';
  dmDatabase.tblTmpAgeAnal.Close;
 // dmDatabase.tblContact.Close;
 finally
   show ;
 end;
  if OptionsClose then Close
  else FormShow(Sender);
//  Close;
end;

procedure TfmDebtorStatementOptions.wwDBDateTimePickerStatementDateChange(
  Sender: TObject);
var
  MDate  : TDate;
  Coef   :Word;
begin
  lblCurrent.Caption := wwDBDateTimePickerStatementDate.Text;
  if (dbedtNoMonth1.Text = '') or (dbedtNoMonth2.Text = '') or (dbedtNoMonth3.Text = '') then exit;
  if dmDatabase.tblReportingOptions.State <> dsEdit then exit;
  MDate:=wwDBDateTimePickerStatementDate.Date;
  if idDocType=2 then
    dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit1').AsDateTime := MDate
  else
    dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit1').AsDateTime := MDate;
  Coef:=Abs(Str2Int(dbedtNoMonth1.Text));
  if idDocType=2 then
    dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit2').AsDateTime := IncMonthT(Mdate,-Coef)
  else
    dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit2').AsDateTime := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth2.Text));
  if idDocType=2 then
    dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit3').AsDateTime := IncMonthT(Mdate,-Coef)
  else
    dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit3').AsDateTime := IncMonthT(Mdate,-Coef);
  Coef:=Coef+Abs(Str2Int(dbedtNoMonth3.Text));
  if idDocType=2 then
    dmDatabase.tblReportingOptions.FieldByName('DRemittanceDateLimit4').AsDateTime := IncMonthT(Mdate,-Coef)
  else
    dmDatabase.tblReportingOptions.FieldByName('DDebtStatementDateLimit4').AsDateTime := IncMonthT(Mdate,-Coef);

end;


procedure TfmDebtorStatementOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
    if idDocType=1 then
     HtmlShowTopic(182)    
    else
     HtmlShowTopic(173);
   key := 0;
  end;
end;

procedure TfmDebtorStatementOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmDebtorStatementOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmDebtorStatementOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmDebtorStatementOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmDebtorStatementOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;


procedure TfmDebtorStatementOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 2+idDocType);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmDebtorStatementOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 2+idDocType);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
