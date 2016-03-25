unit BatchOptions;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ComCtrls;

type
  TfmBatchOptions = class(TForm)
    ButtonPanel: TPanel;
    LCashBook: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    PCMain: TPageControl;
    TSStandard: TTabSheet;
    TSAdvanced: TTabSheet;
    Label1: TLabel;
    edtContraAccount: TEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    GroupBox1: TGroupBox;
    ItemIndex0: TRadioButton;
    ItemIndex1: TRadioButton;
    ItemIndex2: TRadioButton;
    CDAlwayBalance: TCheckBox;
    RGAccountCodeType: TRadioGroup;
    RGContraAccountCodeType: TRadioGroup;
    CBRememberTax: TCheckBox;
    CBNOOpenItemBatch: TCheckBox;
    CBRemeberContraOnAcc: TCheckBox;
    CBNoTax: TCheckBox;
    CBAutoIncNum: TCheckBox;
    BitBtn1: TBitBtn;
    CBUseSingleMode: TCheckBox;
    cbAutoAlias: TCheckBox;
    cbOpeningbal: TCheckBox;
    cbCostCenter: TCheckBox;
    cbProjects: TCheckBox;
    cbAccountLookupOnly: TCheckBox;
    cbDefcost: TComboBox;
    Ldefcostcenter: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtContraAccountKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtContraAccountExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FISFromDutchBankWay: Boolean;
    procedure SetISFromDutchBankWay(const Value: Boolean);
    { Private declarations }
  public
    BatchnameText : String ;
    property ISFromDutchBankWay : Boolean  read FISFromDutchBankWay write SetISFromDutchBankWay;
    { Public declarations }
  end;

var
  fmBatchOptions: TfmBatchOptions;

implementation

uses Database, Main, BatchEntry, Lookup, LanguageChoice, GlobalFunctions,
  TcVariables, DatabaseAccess,LedgerRoutines, DB,XRoutines, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

procedure TfmBatchOptions.FormShow(Sender: TObject);
begin
 if dmDatabase.tblBatchTypes.IsEmpty then
    begin
     dmDatabase.tblBatchTypes.open ;
     dmDatabase.tblBatchTypes.Locate('WBATCHTYPEID',dmDatabase.BatchType,[]);

    end;

 TDataBaseRoutines.FillStringsWithReportingGroups(cbDefcost.Items,1002)  ;

 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

 PCMain.ActivePageIndex := 0 ;
 Caption :=  GetTextLang(622) + ' ' + BatchnameText ;//Options for this batch
 label1.Caption := GetTextLang(379);//Contra Account
 DbCheckBox2.Caption := GetTextLang(623);//Increment Reference number ?
 DbCheckBox4.Caption := GetTextLang(624);//Repeat Details ?
 DbCheckBox1.Caption := GetTextLang(625);//Contra Account per Line
 DbCheckBox5.Caption := GetTextLang(626);//Consolidate Balancing
 //Amount EntryGetTextLang(GetTextL)/ iNCLUSIVE MODE

 itemIndex0.Caption:=GetTextLang(593);//Allow BothGetTextLang(FieldBy)  Locate ('wLabelID','627',[]);
 itemIndex1.Caption:=GetTextLang(211);//Debit
 itemIndex2.Caption:= GetTextLang(212);//Credit
 btnOK.Caption := GetTextLang(167);//OK 167
 btnCancel.Caption := GetTextLang(168);//Cancel 168
 cbAccountLookupOnly.Caption := GetTextLang(3192);
 cbCostCenter.Caption := GetTextLang(3188);
 cbOpeningbal.Caption := GetTextLang(3197);
 Ldefcostcenter.Caption := GetTextLang(3319);



 cbProjects.Caption := GetTextLang(3099);

  dmDatabase.tblAccount.Filtered:=False;
  dmDatabase.tblAccount.open;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID', IntToStr(dmDatabase.BatchType), []);
  dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblBatchTypesWContraAccountID.Value , []);
  if dmDatabase.tblBatchTypesWContraAccountID.Value <> 0 then
  begin
   edtContraAccount.Text:=dmDatabase.tblAccountSMAINACCOUNTCODE.Value+'-'+dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
   edtContraAccount.tag :=dmDatabase.tblBatchTypesWContraAccountID.Value ;
   if dmDatabase.tblBatchTypesBCASHBOOK.AsInteger = 1 then
     begin
        edtContraAccount.ReadOnly := true;
        BitBtn1.Visible := false;

        DBCheckBox1.Visible := false;
        cbOpeningbal.Visible := false;
     end;
  end;
  dmDatabase.tblAccount.Close;
  case dmDatabase.tblBatchTypesWDebitCredit.Value of
  1:ItemIndex1.Checked:=True;
  2:ItemIndex2.Checked:=True;
  else
    ItemIndex0.Checked:=True;
  end;
  GroupBox1.Enabled := (dmDatabase.tblBatchTypesBCASHBOOK.AsInteger = 0) or  FISFromDutchBankWay ;

  cbDefcost.ItemIndex := cbDefcost.Items.IndexOfObject(TObject(ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',0).AsInteger ));


  // done : Pieter Lets give them a always balance option.
  CDAlwayBalance.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAlwaysBalance',false).AsBoolean ;
  // done : Pieter While im at it lets remove tax if its not wanted
  CBNoTax.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoTax',false).AsBoolean ;
    // done : Pieter lets limit the account codes if we need to
  RGAccountCodeType.ItemIndex  := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountCodeType',0).AsInteger ;
  RGContraAccountCodeType.ItemIndex  := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BContraAccountCodeType',0).AsInteger ;
  // done : Pieter Remember tax with a ledger for easy entering
  CBRememberTax.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberTax',false).AsBoolean ;
  // done : Pieter getting errors in sales and stock journals that the link ammount was not found. But it must not link this for some batches
  CBNOOpenItemBatch.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoOpenItem',false).AsBoolean ;
  // done : Pieter Remember contra account with a ledger for easy entering
  CBRemeberContraOnAcc.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberContra',false).AsBoolean ;


  cbAccountLookupOnly.Checked :=  DMTCCoreLink.ReadNwReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountLonly',False) ;
  
  cbOpeningbal.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BOpeningBal',false).AsBoolean ;


  cbProjects.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbProjects',false).AsBoolean ;
  cbCostCenter.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',false).AsBoolean ;


  CBAutoIncNum.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'CBAutoIncNum',false).AsBoolean ;
  cbAutoAlias.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbAutoAlias',false).AsBoolean ;
  if ISFromDutchBankWay then
    begin
    CBUseSingleMode.Visible := true;
    CBUseSingleMode.Checked := ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'UseSingleMode',true).AsBoolean ;
    end else
    begin
      CBUseSingleMode.Visible := false;
    end;


   CDAlwayBalance.Caption := GetTextLang(1981);

   CBNoTax.Caption := GetTextLang(1982);
   CBNOOpenItemBatch.Caption := GetTextLang(1983);

   CBRememberTax.Caption := GetTextLang(1985);
   CBRemeberContraOnAcc.Caption := GetTextLang(1986);

   RGAccountCodeType.Items[0] := GetTextLang(1098);
   RGAccountCodeType.Items[1] := GetTextLang(32);
   RGAccountCodeType.Items[2] := GetTextLang(31);
   RGAccountCodeType.Items[3] := GetTextLang(30);
   RGAccountCodeType.Items[4] := GetTextLang(1987);
   RGAccountCodeType.Caption :=  GetTextLang(1988);
   RGAccountCodeType.Items[5] :=  DMTCCoreLink.GetTextLangNoAmp(3326);
   RGContraAccountCodeType.Items[0] := GetTextLang(1098);
   RGContraAccountCodeType.Items[1] := GetTextLang(32);
   RGContraAccountCodeType.Items[2] := GetTextLang(31);
   RGContraAccountCodeType.Items[3] := GetTextLang(30);
   RGContraAccountCodeType.Items[4] :=   GetTextLang(1987);
   RGContraAccountCodeType.Caption :=  GetTextLang(1989);
   TSStandard.Caption :=  GetTextLang(1990);
   TSAdvanced.Caption :=  GetTextLang(1991);

   CBAutoIncNum.Caption :=  GetTextLang(2963);
   DBCheckBox3.Caption := GetTextLang(3031);
   CBUseSingleMode.Caption := GetTextLang(3032);
   cbAutoAlias.Caption := GetTextLang(3033);
   CBAutoIncNum.Caption := GetTextLang(3034);
   GroupBox1.Caption := GetTextLang(3047); // amount entry

   case IsCashBook of
   1:   LCashBook.Caption:= GetTextLang(997);{'Payments Cash book';}
   2:   LCashBook.Caption:= GetTextLang(998);{'Receipt Cash book'}
   else
     LCashBook.Caption:='';
   end;
end;

procedure TfmBatchOptions.edtContraAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(435){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
  if key =#8 then
     begin
     edtContraAccount.Text := '' ;
     edtContraAccount.Tag := 0 ;
     end;
end;

procedure TfmBatchOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  dmDatabase.tblBatchTypes.Close;
  dmDatabase.tblAccount.Close;
end;

procedure TfmBatchOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBatchOptions.btnOkClick(Sender: TObject);
begin
 // warn for some settings
 if DBCheckBox5.Checked then
    if not CBNoTax.Checked then
       OSFMessageDlg(DMTCCoreLink.GetTextLang(3345),mtInformation,[mbOK],0);


  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbCostCenter',BoolToStr(cbCostCenter.Checked,true)) ;
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbProjects',BoolToStr(cbProjects.Checked,true)) ;
  if cbDefcost.ItemIndex <> -1 then
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',IntToStr(Integer(cbDefcost.items.objects[cbDefcost.ItemIndex]))) ;

  cbDefcost.ItemIndex := cbDefcost.Items.IndexOfObject(TObject(ReadReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'DefCostCen',0).AsInteger ));

  DMTCCoreLink.WriteNwReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountLonly',BoolToStr(cbAccountLookupOnly.checked,true)) ;

  // done : Pieter Lets give them a always balance option.
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAlwaysBalance',BoolToStr(CDAlwayBalance.Checked,true)) ;
  // done : Pieter While im at it lets remove tax if its not wanted
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoTax',BoolToStr(CBNoTax.Checked,true)) ;

    WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BOpeningBal',BoolToStr(cbOpeningbal.Checked,true)) ;

  // done : Pieter lets limit the account codes if we need to
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BAccountCodeType',inttostr(RGAccountCodeType.ItemIndex)) ;
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BContraAccountCodeType',inttostr(RGContraAccountCodeType.ItemIndex)) ;
  // done : Pieter Remember tax with a ledger for easy entering
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberTax',BoolToStr(CBRememberTax.Checked,true)) ;
  // done : Pieter getting errors in sales and stock journals that the link ammount was not found. But it must not link this for some batches
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BNoOpenItem',BoolToStr(CBNOOpenItemBatch.Checked,true)) ;
  // done : Pieter Remember contra account with a ledger for easy entering
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'BRememberContra',BoolToStr(CBRemeberContraOnAcc.Checked,true)) ;

  // To Autoremember Numering.
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'CBAutoIncNum',BoolToStr(CBAutoIncNum.Checked,true)) ;
  // auto alias
  WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'cbAutoAlias',BoolToStr(cbAutoAlias.Checked,true)) ;


  if ISFromDutchBankWay then
    begin
      WriteReportOp(dmDatabase.tblBatchTypesWBatchTypeID.AsString + 'UseSingleMode',BoolToStr(CBUseSingleMode.Checked,true)) ;
    end ;
  dmDatabase.tblBatchTypes.Edit;
 if edtContraAccount.Text <> '' then
  dmDatabase.tblBatchTypesWContraAccountID.Value := edtContraAccount.tag
  else
  dmDatabase.tblBatchTypesWContraAccountID.Clear ;



  if ItemIndex1.Checked then
    dmDatabase.tblBatchTypesWDebitCredit.Value :=1
  else if ItemIndex2.Checked then
    dmDatabase.tblBatchTypesWDebitCredit.Value :=2
  else
    dmDatabase.tblBatchTypesWDebitCredit.Value :=0;

  dmDatabase.tblBatchTypes.Post;
  if isCashBook=0 then
    IsContraPerLine:=dmDatabase.tblBatchTypesBContraPerLine.AsInteger = 1;
  if dmDatabase.tblBatchTypesWDebitCredit.Value = 0 then
  begin
    dmDatabase.tblBatchFCREDIT.Tag := 0;
    dmDatabase.tblBatchFDEBIT.Tag := 0;
  end;
  if dmDatabase.tblBatchTypesWDebitCredit.Value = 1 then
  begin
    dmDatabase.tblBatchFCREDIT.Tag := 1;
    dmDatabase.tblBatchFDEBIT.Tag := 0;
  end;
  if dmDatabase.tblBatchTypesWDebitCredit.Value = 2 then
  begin
    dmDatabase.tblBatchFCREDIT.Tag := 0;
    dmDatabase.tblBatchFDEBIT.Tag := 1;
  end;
  if dmDatabase.tblBatch.Active then
  begin
  dmDatabase.tblBatch.DisableControls;
  dmDatabase.tblBatch.First;
  While not  dmDatabase.tblBatch.Eof do
  begin
    If (dmDatabase.tblBatchSCONTRAACCOUNT.isnull) or (Trim(dmDatabase.tblBatchSCONTRAACCOUNT.Value)='-')
     or (Trim(dmDatabase.tblBatchSCONTRAACCOUNT.AsString)='') or
     (dmDatabase.tblBatchSACCOUNT.AsString='')then
    begin
      dmDatabase.tblBatch.Edit;
      dmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
      dmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.tag ;
      dmDatabase.tblBatch.Post;
    end;
    dmDatabase.tblBatch.next;
  end;
  dmDatabase.tblBatch.EnableControls;
  end;
  if FmBatchEntry <> nil then
  FmBatchEntry.LContraAccount.Caption :=  DMTCCoreLink.GetTextLangNoAmp(34)+ ' : ' + dmDatabase.tblBatchSCONTRAACCOUNT.Value;
  modalresult := mrYes ;
  // Close;
end;

procedure TfmBatchOptions.FormActivate(Sender: TObject);
begin
  if not edtContraAccount.Focused then
  begin
  edtContraAccount.Enabled:=true;
  edtContraAccount.SetFocus;
  end;
end;

procedure TfmBatchOptions.GroupBox1Enter(Sender: TObject);
begin
  if ItemIndex1.Checked then
    ItemIndex1.SetFocus
  else if ItemIndex2.Checked then
    ItemIndex2.SetFocus
  else
    ItemIndex0.SetFocus;
end;

procedure TfmBatchOptions.GroupBox1Exit(Sender: TObject);
begin
 if ButtonPanel.Visible then SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmBatchOptions.BitBtn1Click(Sender: TObject);
begin
   case IsCashBook of
   1:   LCashBook.Caption:= GetTextLang(997);{'Payments Cash book';}
   2:   LCashBook.Caption:= GetTextLang(998);{'Receipt Cash book'}
   else
     LCashBook.Caption:='';
   end;
   
  If (dmDatabase.tblBatchTypesBCashBook.AsInteger = 1) and
     (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
  begin
   edtContraAccount.Enabled:=False;
   DBCheckBox1.Enabled:=False;
   case IsCashBook of
   1:   LCashBook.Caption:= GetTextLang(997);{'Payments Cash book';}
   2:   LCashBook.Caption:= GetTextLang(998);{'Receipt Cash book'}
   else
     LCashBook.Caption:='';
   end;  
   exit;
  end
  else
  begin
   edtContraAccount.Enabled:=True;
   DBCheckBox1.Enabled:=True;
   LCashBook.Caption:='';
  end;
   dmDatabase.tblBatchTypes.Locate('WBatchTypeID', IntToStr(dmDatabase.BatchType), []);
   CallLookup(edtContraAccount.Text, 10);
  // if ReturnLookup
   dmDatabase.tblBatchTypes.Locate('WBatchTypeID', IntToStr(dmDatabase.BatchType), []);
   if ReturnLookup <> 'ESC' then
   begin
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Filtered := False;
    dmDatabase.tblAccount.Locate('WACCOUNTID', ReturnID, []);
    if dmDatabase.tblAccountBSubAccounts.AsInteger = 1 then
    begin
      OSFMessageDlg(GetTextLang(742){'You cannot use this account as a contra account, as it contains sub-accounts'}, mterror, [mbok], 0);
      edtContraAccount.OnEnter(Sender);
    end
    else
      begin
      edtContraAccount.Text := dmDatabase.tblAccountSMAINACCOUNTCODE.Value + '-' + dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
      edtContraAccount.tag :=  dmDatabase.tblAccountWAccountID.AsInteger ;
      end;
    dmDatabase.tblAccount.Close;
  end;
  DBCheckBox2.SetFocus;
//    edtContraAccount.Text := '';
//  SelectNext(ActiveControl, True, True);
end;

procedure TfmBatchOptions.SetISFromDutchBankWay(const Value: Boolean);
begin
  FISFromDutchBankWay := Value;
end;

procedure TfmBatchOptions.edtContraAccountExit(Sender: TObject);
begin
   if edtContraAccount.Text <> '' then
   begin
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtContraAccount.Text) + GetSubAccountCode(edtContraAccount.Text)]), []);
    if dmDatabase.tblAccountBSubAccounts.AsInteger = 1 then
    begin
      OSFMessageDlg(GetTextLang(742){'You cannot use this account as a contra account, as it contains sub-accounts'}, mterror, [mbok], 0);
    end
    else
      begin
      edtContraAccount.Text := dmDatabase.tblAccountSMAINACCOUNTCODE.Value + '-' + dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
      edtContraAccount.tag :=  dmDatabase.tblAccountWAccountID.AsInteger ;
      end;
    dmDatabase.tblAccount.Close;
  end else
  begin
    edtContraAccount.tag := 0 ;
  end;
end;

procedure TfmBatchOptions.FormCreate(Sender: TObject);
begin
// self.DoubleBuffered := True ;
 //PCMain.DoubleBuffered := True ;
// TSStandard.DoubleBuffered := True ;
// TSAdvanced.DoubleBuffered := True ;
end;

procedure TfmBatchOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift) then
   self.Invalidate ;
end;

end.
