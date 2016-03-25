unit CashFlowOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ComCtrls, Buttons, ExtCtrls, Mask, wwcheckbox,
  wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfmCashFlowOptions = class(TForm)
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblFromAcc: TLabel;
    edtFromDate: TEdit;
    cbPeriods: TComboBox;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    edtFrom: TEdit;
    cbPetty: TwwCheckBox;
    dbcomboxWhichYear: TwwDBComboBox;
    Label1: TLabel;
    edtFromBank: TEdit;
    Label2: TLabel;
    edtToBank: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edtCountChange(Sender: TObject);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    NboOfPeriods:Integer ;
    Procedure SaveReoprtOp;
    Procedure LoadReoprtOp;
    Procedure CreateTmpFlow;
    Function PosPerID(w:Integer):Byte;
    Procedure SetPers;

  public
    { Public declarations }
  end;

var
  fmCashFlowOptions: TfmCashFlowOptions;
  Pers : Array[1..6] of Byte;
  LastID:BYte;
  OTotals,PettyOpen,
  PettyIn,PettyOut: Array[1..6] Of Real;
implementation

uses Database, CashFlowrp, GlobalFunctions, Main, TcVariables,
  DatabaseAccess,LedgerRoutines,XRoutines;

{$R *.dfm}

Procedure TfmCashFlowOptions.SetPers;
var
  i,j:Byte;
begin
  i:=0;
  LastID := cbPeriods.ItemIndex+1;
  For j:=FirstPeriod to LastPeriod do
  begin
//    if i<=LastPeriod-FirstPeriod then

//    if i<=cbPeriods.ItemIndex then
//    begin
//       if  (FirstPeriod + i > NboOfPeriods)  AND (FirstPeriod + i <14) then
//         Pers[i+1] := FirstPeriod + i + (14-NboOfPeriods-1)
//       else
    if (j > NboOfPeriods) AND (j<14) then Continue ;
    Pers[i+1]:=j;
    PettyIn[i+1]:=0;
    PettyOut[i+1]:=0;
    PettyOpen[i+1]:=0;
    OTotals[i+1]:=0;

//       LastID:=i+1;
//    end
//    else
//       Pers[i+1]:=LastPeriod;
     inc(i);
   end;
end;

Function TfmCashFlowOptions.PosPerID(w:Integer):Byte;
Var
  i:Byte;
begin
  For i:=1 to 6 do
  if w=Pers[i] then
  begin
    Result:=i;
    Break;
  end;
end;

Procedure TfmCashFlowOptions.CreateTmpFlow;
Var
  tmpbat:Integer;
  PettyFlt,
  Sfilter,sa,sb:String;
  Amt:Real;
  i:Byte;
begin
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Filter:='SACCOUNTCODE>='''+ZipAccountCode(EdtFromBank.Text)+''' AND SACCOUNTCODE<='''+ZipAccountCode(EdtToBank.Text)+'''';
  dmDatabase.tblAccount.Filtered:=True;
  dmDatabase.tblCashFlow.Close;
  ClearTable(dmDatabase.tblCashFlow.TableName);
  dmDataBase.tblTransaction.Close;
  dmDataBase.tblBank.Open;
  dmDataBase.tblBank.Filtered:=False;
  Sfilter:='';
  dmdatabase.tblAccount.First;
  While not dmdatabase.tblAccount.Eof do
  begin
    Sfilter:= Sfilter + ' WAccountID='''+dmdatabase.tblAccountWAccountID.AsString+'''';
    dmdatabase.tblAccount.Next;
    if Not dmdatabase.tblAccount.Eof then
      Sfilter := Sfilter + ' OR '
  end;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Filter:='';
  dmDataBase.tblBank.Filtered:=False;
  dmDataBase.tblBank.Filter:=Sfilter;
  dmDataBase.tblBank.Filtered:=True;
  dmDataBase.tblBank.First;
  Sfilter:='';
  sa:='';
  sb:='';
  while not dmDataBase.tblBank.Eof do
  begin
    // done check for link with payments batch
    if dmDataBase.tblBankWPaymentsID.AsString = '' then raise Exception.Create(GetTextLang(1926));// baches not set up correctly
    sa :=' WAccountID<>'''+dmDataBase.tblBankWAccountID.AsString+'''';
    sb :=' WBatchTypeID='''+dmDataBase.tblBankWReceiptsID.AsString+''''+
         ' OR WBatchTypeID='''+dmDataBase.tblBankWPaymentsID.AsString+'''';
    if Sfilter= '' then
       Sfilter :=  ' AND ('
     else
        Sfilter :=' AND ' + Sfilter +' OR ' ;
    Sfilter:= sa + Sfilter + sb;
    For i:=1 to LastID do
      if  Pers[i] <= NboOfPeriods then
        OTotals[i] := OTotals[i] + GetAccountToTal(dmDatabase.tblBankWAccountID.Value,Pers[i],4)
      else
        OTotals[i] := OTotals[i] + GetAccountToTal(dmDatabase.tblBankWAccountID.Value,Pers[i],3);
    dmDataBase.tblBank.Next;
  end;
  {Get All Petty cash Sub Accounts}
  PettyFlt:='';
  if cbPetty.Checked then
  begin
    if  dmDatabase.tblAccount.Locate('SMAINACCOUNTCODE;WAccountTypeID',VarArrayOf([Copy(ZipAccountCode(edtFrom.Text),1,MainAccountLength),0]),[])
    then
      dmDatabase.tblAccount.Filter:='SMAINACCOUNTCODE='''+GetMainAccountCode(ZipAccountCode(edtFrom.Text))+'''';
      dmDatabase.tblAccount.Filtered:=True;
      dmDatabase.tblAccount.First;
      dmDataBase.tblTransaction.Open;
      while Not dmDatabase.tblAccount.Eof do
      begin
        if dmDatabase.tblAccountWAccountTypeID.Value<>3 then
        For i:=1 to LastID do
        begin
          PettyOpen[i] := PettyOpen[i] + GetAccountToTal(dmDatabase.tblAccountWAccountID.Value , Pers[i],3);
          dmDatabase.tblTransaction.Filtered := False;
          dmDatabase.tblTransaction.Filter := 'WAccountID='''+dmDatabase.tblAccountWAccountID.AsString+''' AND WPeriodID='''+IntToStr(Pers[i])+'''';
          dmDatabase.tblTransaction.Filtered:=True;
          dmDatabase.tblTransaction.First;
          While Not dmDatabase.tblTransaction.Eof do
          begin
            Amt := dmDatabase.tblTransactionFAmount.Value;
            if Amt >=0 then
              PettyIn[i]  := PettyIn[i] + Amt
            else
              PettyOut[i] := PettyOut[i] - Amt;
            dmDatabase.tblTransaction.Next;
          end;
        end;
        dmDatabase.tblAccount.Next;
    end;
    dmDatabase.tblAccount.Filtered:=False;
    dmDatabase.tblAccount.Filter:='';
    dmDataBase.tblTransaction.Close;
  end;
  if Sfilter='' then
    exit;
  Sfilter:= Sfilter + ')';
  dmDataBase.tblBank.Close;
  // TODO : BDEINDEX
  // dmDataBase.tblTransaction.IndexName := 'Ind_BatchType';
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := Sfilter;
  dmDatabase.tblTransaction.Filter:= dmDatabase.tblTransaction.Filter+
                                     '  and WPeriodID >= ''' + IntToStr(FirstPeriod) +
                                     ''' and WPeriodID <= ''' + IntToStr(LastPeriod) + '''';
  dmDatabase.tblTransaction.Filtered := True;
  dmDatabase.tblTransaction.Open;
  dmDatabase.tblTransaction.First;
  dmDatabase.tblCashFlow.Open;
  While Not dmDatabase.tblTransaction.eof do
  begin
    tmpbat:=1;
    sa:='';sb:='';
    Amt := dmDatabase.tblTransaction.FieldByName('FAmount').AsFloat ;
    if  Amt >0 then
      tmpbat:=2;
    if Not dmDatabase.tblCashFlow.Locate('WAccountID;WBatchID',VarArrayOf([dmDatabase.tblTransactionWAccountID.ASString,tmpbat]),[]) then
    begin
      if tmpbat=2 then
        dmDatabase.tblCashFlow.Append
      else
      begin
        dmDatabase.tblCashFlow.First;
        dmDatabase.tblCashFlow.Insert;
      end;
      if dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblTransactionWAccountID.AsString,[]) then
      begin
        sa:=dmDatabase.tblAccountSDescription.Value;
        sb:=dmDatabase.tblAccountSACCOUNTCODE.Text;
      end;
      For i:=1 to 6 do
       dmDatabase.tblCashFlow.FieldByName('FAmount'+IntToStr(i)).AsFloat:=0;
      dmDatabase.tblCashFlowWAccountID.Value:=dmDatabase.tblTransaction.FieldByName('WAccountID').AsInteger;
      dmDatabase.tblCashFlowWPeriodID.Value:=dmDatabase.tblTransaction.FieldByName('WPeriodID').AsInteger;
      dmDatabase.tblCashFlow.FieldByName('FAmount'+IntToStr(PosPerID(dmDatabase.tblTransactionWPeriodID.Value))).AsFloat:=Amt;
      dmDatabase.tblCashFlowWBatchID.Value:=tmpbat;
      dmDatabase.tblCashFlowSDescription.Value := sa;
      dmDatabase.tblCashFlowSCode.Value:=sb;
    end
    else
    begin
      Amt := Str2Float(dmDatabase.tblTransactionFAmount.AsString) + Str2Float(dmDatabase.tblCashFlow.FieldByName('FAmount'+IntToStr(PosPerID(dmDatabase.tblTransactionWPeriodID.Value))).AsString);
      sa:=dmDatabase.tblCashFlowSDescription.Value;
      sb:=dmDatabase.tblCashFlowSCode.Value;
      dmDatabase.tblCashFlow.Edit;
      dmDatabase.tblCashFlow.FieldByName('FAmount'+IntToStr(PosPerID(dmDatabase.tblTransactionWPeriodID.Value))).AsFloat:=amt;
    end;
    dmDatabase.tblCashFlow.Post;
    dmDatabase.tblTransaction.Next;
  end;
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblCashFlow.First;
  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.Filter:='';
  dmDataBase.tblBank.Filtered:=False;
  dmDataBase.tblBank.Filter:='';
  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := '';
end;

procedure TfmCashFlowOptions.BtnOkClick(Sender: TObject);
Var
  s1,s2:String;
  i:integer;
begin
 try
  dmDatabase.tblSysVars.Open;
  NboOfPeriods := dmDatabase.tblSysVars.FieldByName('wNoOfPeriods').AsInteger;
  if ToID<=0 then ToID := 14;
  cbPeriods.ItemIndex := cbPeriods.Items.IndexOf(cbPeriods.Text);
  SaveReoprtOp;
  LastPeriod := ToID;
  if (ToID>13) AND (14 > ToID - cbPeriods.ItemIndex) then
    FirstPeriod := LastPeriod - cbPeriods.ItemIndex - (14-NboOfPeriods-1)
  else
    FirstPeriod := LastPeriod - cbPeriods.ItemIndex;
  s1:=EdtFromBank.Text;
  s2:=EdtToBank.Text;
  If SwapStr(s1,s2) then
  begin
    EdtFromBank.Text:=s1;
    EdtToBank.Text:=s2;
  end;
  SetPers;
  CreateTmpFlow;
  dmDatabase.tblCashFlow.Open;
  dmDatabase.tblSysVars.Open;
  qrCashFlow := TqrCashFlow.Create(Self);
  PrintReportProcess(cbDestination.ItemIndex,qrCashFlow,edtCount.Text);
  dmDatabase.tblCashFlow.Close;
  qrCashFlow.Free;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblCashFlow.Close;
  if OptionsClose then Close
  else FormShow(Sender);
  except on e:Exception do
      OSFMessageDlg(e.Message,mterror,[mbok],0) ;
    end
end;

procedure TfmCashFlowOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  dbcomboxWhichYear.Items[0] := GetTextLang(603);
  dbcomboxWhichYear.Items[1] := GetTextLang(604);
  Caption := GetTextLang(1045);
  ChangePrnLbls(DestLbl,lblCopies,Bitprn1);
  Label3.Caption := GetTextLang(242);
  Label4.Caption := GetTextLang(1046);
  Label5.Caption := GetTextLang(576);
  lblFromAcc.Caption := GetTextLang(1002);
  OkCancel(BtnOk,BtnCancel);
  cbPetty.Caption := GetTextLang(1048);
  Label1.Caption := GetTextLang(1047);
  Label2.Caption := GetTextLang(208);

end;

procedure TfmCashFlowOptions.BtnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TfmCashFlowOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(245);
             key := 0;

        end;

end;

Procedure TfmCashFlowOptions.SaveReoprtOp;
Var
  xd:Real;
begin
  WriteReportOp('SCashFlFromBank',edtFromBank.Text );
  WriteReportOp('SCashFlToBank',edtToBank.Text  ) ;
  WriteReportOp('SCashFlFrom',edtFrom.Text );
//  WriteReportOp('SCashFlTo',edtTo.Text  ) ;
  WriteReportOp('BCashFlPetty',Bool2Str(cbPetty.Checked));
  WriteReportOp('WCashFlPeriods',IntToStr(cbPeriods.ItemIndex));
  WriteReportOp('SCashFlWhichYear',dbcomboxWhichYear.Text);
  WriteReportOp('WCashFlPeriodID',IntToStr(ToID));
end;

Procedure TfmCashFlowOptions.LoadReoprtOp;
begin

  edtFromBank.Text :=  ReadReportOp('SCashFlFromBank').AsString;
  edtToBank.Text :=  ReadReportOp('SCashFlToBank').AsString;
  edtFrom.Text :=  ReadReportOp('SCashFlFrom').AsString;
  cbPetty.Checked := ReadReportOp('BCashFlPetty').AsBoolean;
  cbPeriods.ItemIndex := Str2Int(ReadReportOp('WCashFlPeriods').AsString);
  dbcomboxWhichYear.ItemIndex := dbcomboxWhichYear.Items.IndexOf(ReadReportOp('SCashFlWhichYear').AsSTring);
  ToID := Str2Int(ReadReportOp('WCashFlPeriodID').AsString);
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
  dmDatabase.tblPeriods.Close;
  FromID:=ToID-cbPeriods.ItemIndex;
end;

procedure TfmCashFlowOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmCashFlowOptions.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmCashFlowOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmCashFlowOptions.edtCountChange(Sender: TObject);
begin
   UpDown1.Position:=ValideInt(edtCount.Text);
end;

procedure TfmCashFlowOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
  edtCount.Text:= IntToStr(prnvars.NumCopies);
end;

procedure TfmCashFlowOptions.BitBtn3Click(Sender: TObject);
begin
  edtFrom.Color := clHighlight;
  ReturnLookup:=CallLookup(edtFrom.Text, 1);
  if ReturnLookup <> 'ESC' then
    edtFrom.Text := ReturnLookup;
  edtFrom.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCashFlowOptions.BitBtn1Click(Sender: TObject);
begin
  edtToBank.Color := clHighlight;
  ReturnLookup:=CallLookup(edtToBank.Text, 5);
  if ReturnLookup <> 'ESC' then
    edtToBank.Text := ReturnLookup;
  edtToBank.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCashFlowOptions.BitBtn2Click(Sender: TObject);
begin
  edtFromBank.Color := clHighlight;
  ReturnLookup:=CallLookup(edtFromBank.Text, 5);
  if ReturnLookup <> 'ESC' then
    edtFromBank.Text := ReturnLookup;
  edtFromBank.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCashFlowOptions.BitBtn4Click(Sender: TObject);
begin
  Highlight(edtFromDate);
  if dbcomboxWhichYear.ItemIndex <> 1 then
    ReturnLookup:=CallLookup(edtFromDate.Text, 8)
  else
    ReturnLookup:=CallLookup(edtFromDate.Text, 9);
  BackNormal(edtFromDate);
  if (Str2Int(ReturnLookup)<>0) and (dbcomboxWhichYear.Text <> '') then
  begin
    FromID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
    edtFromDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.Value);
    dmDatabase.tblPeriods.Close;
    SelectNext(ActiveControl, True, True);
  end;
  ToID:=FromID;
end;

end.
