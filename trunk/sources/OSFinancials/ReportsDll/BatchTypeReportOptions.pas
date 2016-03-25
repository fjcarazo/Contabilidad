(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchTypeReportOptions;

interface            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TcVariables,ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls,db,
  CheckLst,XRoutines;

type
  TfmBatchTypeReportOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dbcomboxWhichYear: TDBComboBox;
    dbcboxPeriodsSeperate: TDBCheckBox;
    dbcboxBalancingEntries: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    GBUseNumbers: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    cbUseNbr: TCheckBox;
    GBUSePeriods: TGroupBox;
    cboxUsePeriods: TCheckBox;
    Label4: TLabel;
    edtFromDate: TEdit;
    Label5: TLabel;
    edtToDate: TEdit;
    edtBatTo: TEdit;
    edtBatFrom: TEdit;
    CBShowContra: TCheckBox;
    CBBatchTypes: TCheckListBox;
    CBEatchBatchSep: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcomboxWhichYearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure Bitprn1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edtFromDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBatchTypeChange(Sender: TObject);
    procedure cboxUsePeriodsClick(Sender: TObject);
    procedure cbUseNbrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    Procedure SetVisib;
  public
    CBBatchTypesList : TStringList ;
    function BuildFilterFromChecked : String ;
    procedure LoadSysvars ;
    procedure SaveSysvars ;
    { Public declarations }
  end;

var
  fmBatchTypeReportOptions: TfmBatchTypeReportOptions;
//  FromID, ToID,
  BatchID   : Integer;

implementation

Uses
  Database, Main, Lookup, BatchTypeReport, HtmlHelpAPI,
  GlobalFunctions, LanguageChoice, PrintOptions, DatabaseAccess;

{$R *.DFM}

procedure TfmBatchTypeReportOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
//  CheckUnpostedItems;
  dbcomboxWhichYear.Clear;
  dbcomboxWhichYear.Items.Add(GetTextLang(603){'This Year'});
  dbcomboxWhichYear.Items.Add(GetTextLang(604){'Last Year'});
  dbcomboxWhichYear.Items.Add(GetTextLang(3012){'Last Year'});
  CBEatchBatchSep.Caption := GetTextLang(2190);
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  //get the periods
  FromID := dmDatabase.tblReportingOptions.FieldByName('WBatchTypeFromDateID').AsInteger;
  ToID := dmDatabase.tblReportingOptions.FieldByName('WBatchTypeToDateID').AsInteger;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value;
  dmDatabase.tblPeriods.Close;
  //get the batch type
  BatchID := dmDatabase.tblReportingOptions.FieldByName('WBatchTypeType').AsInteger;
  dmDatabase.tblBatchTypes.Open;
 // edtBatchType.Text:='';
  CBBatchTypesList.Clear;
  CBBatchTypesList.AddObject(GetTextLang(1098){'All'},Tobject(-1));
  dmDatabase.tblBatchTypes.First;

  While not dmDatabase.tblBatchTypes.eof do begin
    CBBatchTypesList.AddObject(dmDatabase.tblBatchTypesSDescription.Value,TObject(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger));
    dmDatabase.tblBatchTypes.next;
  end;
  CBBatchTypes.Items.Assign(CBBatchTypesList);
  if dmDatabase.tblBatchTypes.Locate('WBatchTypeID', BatchID, []) then
    begin
     try
      if CBBatchTypesList.IndexOfObject(TObject(BatchID)) <> -1 then
         CBBatchTypes.Checked[CBBatchTypesList.IndexOfObject(TObject(BatchID))] := true ;
      except
       // done i get errors here but i dont now why i caal the indexofobject that should be save
      end;
    end;
 {   edtBatchType.ItemIndex :=edtBatchType.Items.IndexOf(dmDatabase.tblBatchTypesSDescription.Value)
  else  if (BatchID=-1) And (edtBatchType.Items.count>0) then
    edtBatchType.ItemIndex:=0
  else
    edtBatchType.ItemIndex:=-1;}

  dmDatabase.tblBatchTypes.Close;
  // load Print Modes
  SetVisib;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  dbcomboxWhichYear.DataSource.DataSet.edit ;
  if dbcomboxWhichYear.ItemIndex = -1 then
   begin
   dbcomboxWhichYear.Field.AsString :=   dbcomboxWhichYear.Items[0];
 // dbcomboxWhichYear.ItemIndex := 0 ;
  end;
  if (dbcomboxWhichYear.DataSource.DataSet.State in [dsedit,dsinsert]) then
      begin
      dbcomboxWhichYear.DataSource.DataSet.post ;
      dbcomboxWhichYear.DataSource.DataSet.edit ;

      end;
  GBUseNumbers.Caption := GetTextLang(2090) ;
  GBUSePeriods.Caption := GetTextLang(2091) ;
  CBShowContra.Caption := GetTextLang(2092) ;
  LoadSysvars ;
  Label1.Caption := GetTextLang(2010) ;
  Label6.Caption := GetTextLang(2011) ;
end;

procedure TfmBatchTypeReportOptions.btnOkClick(Sender: TObject);
Var
  FromDate,ToDate:TDate;
  FilterText : String ;
begin
 hide ;
 try
  SaveSysvars ;
  dmDatabase.tblPeriods.Open;
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
  dmDatabase.tblReportingOptions.FieldByName('WBatchTypeType').AsInteger := BatchID;
  dmDatabase.tblReportingOptions.FieldByName('WBatchTypeFromDateID').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WBatchTypeToDateID').AsInteger := ToID;
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblAccount.Open;
   dmDatabase.tblTransaction.Open;
   dmDataBase.tblTransaction.IndexFieldNames := 'WBatchTypeId';
   dmDatabase.tblTransaction.Filtered := False;
  // if all is ticked
  if  CBBatchTypes.Checked[0] then
     FilterText:= 'WBatchTypeID >-1 '
  else
    FilterText:= BuildFilterFromChecked ;

  if dmDatabase.tblReportingOptions.FieldByName('BBatchTypeShowBal').AsInteger =0 then
    FilterText:= FilterText +
                        'and (  SReference <> ' + QuotedStr('********')+ '  or SReference is null)';
  if cbUseNbr.Checked then
  begin
    TmpFomInt[0]:= edtBatFrom.Tag ;
    TmpToInt[0]:= edtBatTo.tag;
    IfSwapVars(TmpFomInt[0],TmpToInt[0]);
    FilterText:= FilterText+
              '  AND (WBatchID>= '+ IntToStr(TmpFomInt[0])+' AND WBatchID<='+ IntToStr(TmpToInt[0])+')';
  end
  else
    FilterText:= FilterText+
                                     ' and WPeriodID >= ' + IntToStr(FromID) +
                                     ' and WPeriodID <= ' + IntToStr(ToID) ;
 // dmDatabase.tblTransaction.Filtered := True;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblMessage.Open;
  dmDatabase.tblBatchTypes.Open;
  qrBatchTypeReport := TqrBatchTypeReport.Create(Self);
  try
  //Each period sep
  qrBatchTypeReport.ShowContraAccount := CBShowContra.Checked ;
  qrBatchTypeReport.QTransactions.Connection := dmDatabase.tblAccount.Connection ;
  // done : We need date only when not doing per batch as else booking of the same date get scatered.
  if CBEatchBatchSep.Checked then
  qrBatchTypeReport.QTransactions.SQL.Text := 'select * from transact where ' + FilterText +' order by WBatchTypeID,DDate'
  else
  qrBatchTypeReport.QTransactions.SQL.Text := 'select * from transact where ' + FilterText +' order by DDate' ;

  qrBatchTypeReport.QRGroup1.Enabled :=  CBEatchBatchSep.Checked ;
  qrBatchTypeReport.qrBatFoot.Enabled :=  CBEatchBatchSep.Checked ;

  qrBatchTypeReport.QTransactions.open ;
  dmDatabase.tblTransaction.close ;
  qrBatchTypeReport.qrgrpPeriod.Enabled:=dbcboxPeriodsSeperate.Checked;
  qrBatchTypeReport.QrPerFoot.Enabled:=dbcboxPeriodsSeperate.Checked;
  //
  PrintReportProcess(cbDestination.ItemIndex,qrBatchTypeReport,edtCount.Text);
  finally
   FreeAndNil(qrBatchTypeReport);
  end;
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := '';
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblMessage.Close;
  dmDatabase.tblBatchTypes.Close;
  // TODO : BDEINDEX
  //  dmDataBase.tblTransaction.IndexName := '';
//  dmDatabase.tblTransaction.TableName:=tmptbl;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblSysVars.Close;
  finally
    show ;
  end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmBatchTypeReportOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBatchTypeReportOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblReportingOptions.Close;
end;

procedure TfmBatchTypeReportOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then
  begin
    //Result := (HTMLHelpShowHelp <> 0);
    HtmlShowTopic(167);
    key := 0;
  end;
  if ssCtrl in Shift then
  begin
    if Key=32 then
    begin
      Key:=0;
      cboxUsePeriods.Checked :=  Not cboxUsePeriods.Checked;
    end;
  end;
end;

procedure TfmBatchTypeReportOptions.dbcomboxWhichYearKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
     begin
       SelectNext(ActiveControl, True, True);
       Key:=0;
     end;
     if Key = 112 then
     begin
         //Result := (HTMLHelpShowHelp <> 0);
         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchTypeReportOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmBatchTypeReportOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmBatchTypeReportOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmBatchTypeReportOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmBatchTypeReportOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmBatchTypeReportOptions.edtFromDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
     begin
         //Result := (HTMLHelpShowHelp <> 0);
         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchTypeReportOptions.edtToDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
     begin
         //Result := (HTMLHelpShowHelp <> 0);
         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchTypeReportOptions.edtBatchTypeChange(Sender: TObject);
begin
 { edtBatchType.Color:=clHighlight;
    dmDatabase.tblBatchTypes.Open;
    if dmDatabase.tblBatchTypes.Locate('SDescription', edtBatchType.Text, []) then
      BatchID := dmDatabase.tblBatchTypesWBatchTypeID.Value
    else
      BatchID:=-1;
    dmDatabase.tblBatchTypes.Close;
//  end;
  SelectNext(ActiveControl, True, True);
  edtBatchType.Color:=clWindow;     }
end;

procedure TfmBatchTypeReportOptions.cboxUsePeriodsClick(Sender: TObject);
begin
  if cboxUsePeriods.Checked=cbUseNbr.Checked then
  cbUseNbr.Checked:=Not cboxUsePeriods.Checked;
  SetVisib;
end;

procedure TfmBatchTypeReportOptions.cbUseNbrClick(Sender: TObject);
begin
  if cbUseNbr.Checked=cboxUsePeriods.Checked then
    cboxUsePeriods.Checked:=Not cbUseNbr.Checked;
  SetVisib;
end;

Procedure TfmBatchTypeReportOptions.SetVisib;
begin
  edtBatFrom.Enabled := cbUseNbr.Checked;
  edtBatTo.Enabled := cbUseNbr.Checked;
  Label1.Enabled := cbUseNbr.Checked;
  Label6.Enabled := cbUseNbr.Checked;
  edtFromDate.Enabled := cboxUsePeriods.Checked;
  edtToDate.Enabled := cboxUsePeriods.Checked;
  Label4.Enabled := cboxUsePeriods.Checked;
  Label5.Enabled := cboxUsePeriods.Checked;
end;


function TfmBatchTypeReportOptions.BuildFilterFromChecked: String;
var
 i : Integer ;
begin
 // dont do the all item
 result := '' ;
 for i := 1 to CBBatchTypes.Items.Count -1 do
  begin

   if CBBatchTypes.Checked[i] then
     if result = '' then

        result := '(WBatchTypeID = ' +  IntToStr(Integer(CBBatchTypes.Items.Objects[i]))
       else
       result := result +  ' or WBatchTypeID = ' +  IntToStr(Integer(CBBatchTypes.Items.Objects[i]))
  end;
  if result <> '' then result := result + ')'
  else
  result := 'WBatchTypeID >-1 ' ;
end;

procedure TfmBatchTypeReportOptions.LoadSysvars;
var
 i : Integer ;
begin
  CBShowContra.Checked := ReadReportOp('CBBatchShowContra',False).AsBoolean;
  CBEatchBatchSep.Checked := ReadReportOp('CBBatchShowBatchSep',true).AsBoolean;

 CBBatchTypes.Checked[0] := ReadReportOp('ListBatch0',False).AsBoolean ;
 for i := 1 to CBBatchTypes.Items.Count -1  do
   begin
      CBBatchTypes.Checked[i] := ReadReportOp('ListBatch'+IntToStr(Integer(CBBatchTypes.Items.Objects[i])),False).AsBoolean ;
   end;
end;

procedure TfmBatchTypeReportOptions.SaveSysvars;
var
 i : Integer ;
begin
 WriteReportOp('CBBatchShowBatchSep',Bool2Str(CBEatchBatchSep.Checked));
 WriteReportOp('CBBatchShowContra',Bool2Str(CBShowContra.Checked));
 WriteReportOp('ListBatch0',Bool2Str(CBBatchTypes.Checked[0])) ;
 for i := 1 to CBBatchTypes.Items.Count -1 do
   begin
      WriteReportOp('ListBatch'+IntToStr(Integer(CBBatchTypes.Items.Objects[i])),Bool2Str(CBBatchTypes.Checked[i])) ;
   end;

end;

procedure TfmBatchTypeReportOptions.FormCreate(Sender: TObject);
begin
CBBatchTypesList := TStringList.Create ;
end;

procedure TfmBatchTypeReportOptions.FormDestroy(Sender: TObject);
begin
CBBatchTypesList.free ;
end;

procedure TfmBatchTypeReportOptions.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color:=clHighlight;
  // done : Pieter Wrong expression for other lnguage
  if dbcomboxWhichYear.Text = GetTextLang(604) then
    ReturnLookup:=CallLookup(FromID, 9)
  else
  if dbcomboxWhichYear.Text = GetTextLang(3012) then
    ReturnLookup:=CallLookup(FromID, 19)
    else
    ReturnLookup:=CallLookup(FromID, 8);
  if (ReturnLookup <> 'ESC') and (dmDatabase.tblReportingOptions.FieldByName('SBatchTypeWhichYear').AsString <> '') then
  begin
    FromID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
    edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + ' ' + FormatDateTime('yyyy',dmDatabase.tblPeriodsDStartDate.AsDateTime)  ;
    dmDatabase.tblPeriods.Close;
    edtFromDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBatchTypeReportOptions.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color:=clHighlight;
  if dbcomboxWhichYear.Text = GetTextLang(604) then
    ReturnLookup:=CallLookup(ToID, 9)
  else
  if dbcomboxWhichYear.Text = GetTextLang(3012) then
    ReturnLookup:=CallLookup(ToID, 19)
    else
    ReturnLookup:=CallLookup(ToID, 8);

  if (ReturnLookup <> 'ESC') and (dmDatabase.tblReportingOptions.FieldByName('SBatchTypeWhichYear').AsString <> '') then
  begin
    ToID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
    edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + ' ' + FormatDateTime('yyyy',dmDatabase.tblPeriodsDStartDate.AsDateTime)  ;
    dmDatabase.tblPeriods.Close;
    edtToDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBatchTypeReportOptions.BitBtn3Click(Sender: TObject);
begin
  edtFromDate.Color:=clHighlight;
  if CallNewLookup(30,True) then
  {The result Is in ReturnBatch record}
    FromBatch:= ReturnBatch;
  edtBatFrom.tag := FromBatch.WBatchID ;
  edtBatFrom.Text :=FromBatch.SAlias + ' (' + IntToStr(FromBatch.WBatchID) +')';
  edtFromDate.Color:=clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmBatchTypeReportOptions.BitBtn4Click(Sender: TObject);
begin
  edtBatTo.Color:=clHighlight;
  if CallNewLookup(30,True) then
  {The result Is in ReturnBatch record}
    ToBatch:= ReturnBatch;
    edtBatTo.Tag := ToBatch.WBatchID;
  edtBatTo.Text := ToBatch.SAlias + ' (' + IntToStr(ToBatch.WBatchID) +')';
  edtBatTo.Color:=clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
