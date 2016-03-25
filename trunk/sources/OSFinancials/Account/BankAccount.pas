(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BankAccount;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, wwdbedit, Wwdotdot, Wwdbcomb,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar;

type
  TfmEditBankAccount = class(TForm)
    Label1: TLabel;
    edtMainAccount: TEdit;
    edtSubAccount: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ButtonPanel: TPanel;
    edtDescription: TEdit;
    DescLabel: TLabel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    cbxPayments: TwwDBComboBox;
    cbxReceipts: TwwDBComboBox;
    CbxRepGroup1: TwwDBComboBox;
    CbxRepGroup2: TwwDBComboBox;
    fcMenu: TfcOutlookBar;
    fcNew: TfcShapeBtn;
    fcSearch: TfcShapeBtn;
    fcDelete: TfcShapeBtn;
    fcSave1: TfcShapeBtn;
    fcSubNew: TfcOutlookList;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcOutlookBar1OutlookList3: TfcOutlookList;
    fcOutlookBar1OutlookList4: TfcOutlookList;
    Timer1: TTimer;
    procedure edtMainAccountExit(Sender: TObject);
    procedure edtSubAccountExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtMainAccountKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxPaymentsClick(Sender: TObject);
    procedure cbxReceiptsClick(Sender: TObject);
    procedure CbxRepGroup1DropDown(Sender: TObject);
    procedure CbxRepGroup1CloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure fcSearchClick(Sender: TObject);
    procedure fcDeleteClick(Sender: TObject);
    procedure fcSave1Click(Sender: TObject);
    procedure fcNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDescriptionEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    RTmp,
    PTmp:String;
    Ok:Boolean;
    OldAccount:String;

    { Private declarations }
    Procedure ClsScreen;
    procedure btnDeleteClick(Sender: TObject);
    procedure EndFormActivate(Sender: TObject);
  public
    { Public declarations }
    procedure LoadBankAccountDetails;
    procedure BlankAll;
    Function  UniqueBatch(ActBat:TwwDBComboBox ):Boolean;
    procedure UpdateCbxBats;
  end;

var
  fmEditBankAccount: TfmEditBankAccount;
  TmpIDAcc:Integer;
implementation

uses Main, Database,  GlobalFunctions, Lookup, HtmlHelpAPI,
  LanguageChoice, TcVariables, DatabaseAccess,LedgerRoutines,XRoutines, DB;

{$R *.DFM}
procedure TfmEditBankAccount.BlankAll;
begin
    enable(edtMainAccount);
   // enable(edtSubAccount);
    DescLabel.Caption:='';
    edtMainAccount.text:='';
    edtSubAccount.text:='000';
    edtDescription.Text:='';
    CbxRepGroup1.Text:='';
    CbxRepGroup2.Text:='';
    CbxPayments.ItemIndex:=0;
    cbxReceipts.ItemIndex:=0;
end;

procedure TfmEditBankAccount.LoadBankAccountDetails;
begin
  // set the old description so if edited you can still see the old one
  DescLabel.Caption := dmDatabase.tblAccountSDescription.Value;
  //get the account description
  edtDescription.Text := dmDatabase.tblAccountSDescription.Value;
  //Get rep group 1
  CbxRepGroup1.ItemIndex := CbxRepGroup1.Items.IndexOfObject(TObject(dmDatabase.tblAccountWReportingGroup1ID.AsInteger)) ;
  //Get rep group 2
  CbxRepGroup2.ItemIndex := CbxRepGroup2.Items.IndexOfObject(TObject(dmDatabase.tblAccountWReportingGroup2ID.AsInteger)) ;
  //get the payments batch
  dmDatabase.tblBank.Open;
  dmDatabase.tblBank.Locate('WAccountID', dmDatabase.tblAccountWAccountID.Value, []);
  dmDatabase.tblBatchTypes.Open;
  TmpIDAcc:=dmDatabase.tblAccountWAccountID.Value;
  CbxPayments.ItemIndex :=  CbxPayments.Items.IndexOfObject(TObject(dmDatabase.tblBankWPaymentsID.AsInteger));
  //get the receipts batch
  CbxReceipts.ItemIndex :=  CbxReceipts.Items.IndexOfObject(TObject(dmDatabase.tblBankWReceiptsID.AsInteger));
  dmDatabase.tblBank.Close;
  RTmp:=CbxReceipts.Text;
  if CbxReceipts.ItemIndex < 1 then
     RTmp := '' ;
  PTmp:=CbxPayments.Text;
  if CbxPayments.ItemIndex < 1 then
     PTmp := '' ;
end;

Function TfmEditBankAccount.UniqueBatch(ActBat:TwwDBComboBox):Boolean;
// By Sylvain
begin
  Ok := True;
  if ReadReportOp('CBViewAllBankState',true).AsBoolean then
  begin
    With dmDatabase do
    begin
      tblBank.Active:=True;
      tblBank.Filter:='';
      tblBank.Filtered:=False;
      tblBatchTypes.Active:=True;
  //    tblBank.Filter:='WaccountID<>'+IntToStr(TmpIdAcc);
  //    tblBank.Filtered:=True;
      if tblBatchTypes.Locate('SDescription',ActBat.Text, []) = True then
      While not tblBank.Eof do
        begin
          if TmpIdAcc=tblBankWaccountID.value then begin
             if (ActBat.Name='CbxPayments') and
               (tblBankWReceiptsID.Value=tblBatchTypesWBatchTypeID.value) then
               Ok:=False;
             if (ActBat.Name='CbxReceipts') and
               (tblBankWPaymentsID.Value=tblBatchTypesWBatchTypeID.value) then
               Ok:=False;
          end
          else begin
          if (tblBankWReceiptsID.Value=tblBatchTypesWBatchTypeID.value) or
             (tblBankWPaymentsID.Value=tblBatchTypesWBatchTypeID.value) then
             Ok:=False;
          end;
          if (CbxPayments.Text=CbxReceipts.Text) and (CbxReceipts.text<>'') then
            Ok:=False;
          if (ok=False) then begin
           if ActBat.Name='CbxPayments' then
             OSFMessageDlg(GetTextLang(679){Cannot  have the same Receipt batch type as another Bank account ! ?}, mtconfirmation, [mbOK], 0)
           else
             OSFMessageDlg(GetTextLang(683){Cannot  have the same Payments batch type as another Bank account ! ?}, mtconfirmation, [mbOK], 0);
            BlankAll;
            Break;
          end;
          tblBank.Next;
        end;
       tblBank.Filtered:=False;
       tblBank.Filter:='';
       tblBank.Active:=False;
       tblBatchTypes.Active:=False;
     end;
   end;
   UniqueBatch:=Ok
end;


procedure TfmEditBankAccount.edtMainAccountExit(Sender: TObject);
Var
  i : Integer ;
begin
  if BtnCancel.Focused then exit;
  if edtMainAccount.Text = '' then begin
    OSFMessageDlg(GetTextLang(748){Illegal account Number?}, mterror, [mbOk], 0);
    edtMainAccount.Setfocus;
    exit
  end
  else
  begin
    if CheckAccountNumber(edtMainAccount.Text) = True then
    begin
      if Length(edtMainAccount.Text) < MainAccountLength then
      begin
      // done : Pieter Accountnr to 6 digets
        for i := Length(edtMainAccount.Text) to MainAccountLength -1 do
           edtMainAccount.Text := '0' + edtMainAccount.Text;

     {   if Length(edtMainAccount.Text) = 1 then
          edtMainAccount.Text := '00' + edtMainAccount.Text;
        if Length(edtMainAccount.Text) = 2 then
          edtMainAccount.Text := '0' + edtMainAccount.Text;  }
      end;
      with dmDatabase do
      begin
        tblAccount.Open;
        if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text+'000']), []) = False then
        begin
         // if OSFMessageDlg(GetTextLang(432){Create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
          begin
            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
            tblAccountSSUBACCOUNTCODE.Value := '000';
            tblAccountWReportingGroup1ID.Value:=0;
            tblAccountWReportingGroup2ID.Value:=0;
            tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
            tblAccountWAccountTypeID.Value := 3;
            tblAccountBSubAccounts.Value := 0;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+'000';
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);
            tblBank.Open;
            tblBank.Insert;
            tblGlobal.Open;
            tblBankWAccountID.Value := tblAccountWAccountID.Value;
            tblGlobal.Close;
            tblBank.Post;
            tblBank.Close;
            tblAccount.Close;
            Disable(edtMainAccount);
            edtSubAccount.Text := '000';
            Disable(edtSubAccount);
            edtDescription.SetFocus;
          end ;
         { else
          begin
            tblAccount.Close;
            edtMainAccount.Text := '';
            edtMainAccount.SetFocus;
          end }
        end
        else
        begin
(* For This Release
          if tblAccountWAccountTypeID.Value = 3 then
          begin
            Disable(edtMainAccount);
            Disable(edtSubAccount);
            LoadBankAccountDetails;
            edtDescription.SetFocus;
          end
          else
*)
          begin
            if isControlAccount(tblAccountWAccountId.Value) then
            begin
               OSFMessageDlg(GetTextLang(781){Control account, Can not be used}, mterror, [mbok], 0);
               edtMainAccount.Text := '';
               edtMainAccount.SetFocus;
               Exit;
            end;
            Disable(edtMainAccount);
            LoadBankAccountDetails ;
          end;
        end;
      end;
    end
    else
    begin
      OSFMessageDlg(GetTextLang(433){Invalid account number, the first letter must be a number}, mterror, [mbok], 0);
      edtMainAccount.Text := '';
      edtMainAccount.SetFocus;
    end;
  end;
  Timer1.Enabled :=true ;
end;

procedure TfmEditBankAccount.edtSubAccountExit(Sender: TObject);
var
 Mainaccount : Integer ;
begin
  if Length(edtSubAccount.Text) < 3 then
  begin
    if Length(edtSubAccount.Text) = 1 then
      edtSubAccount.Text := '00' + edtSubAccount.Text;
    if Length(edtSubAccount.Text) = 2 then
      edtSubAccount.Text := '0' + edtSubAccount.Text;
  end;
//  if (edtSubAccount.Text <> '000') or (edtSubAccount.Text = '') then
//  begin
//    OSFMessageDlg(GetTextLang(434){This is not a bank account}, mterror, [mbok], 0);
//    Enable(edtMainAccount);
//    Enable(edtSubAccount);
//    edtMainAccount.Text := '';
//    edtSubAccount.Text := '';
//    edtMainAccount.SetFocus;
//    Exit;
//  end
//  else
  Begin
  with dmDatabase do
    begin
     tblAccount.Open;
      if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []) = False then
      begin
        if OSFMessageDlg(GetTextLang(432){Create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
        begin
          tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + '000']), []);
          tblAccount.Edit;
          tblAccountBSubAccounts.Value := 1;
          tblAccount.Post;
          Mainaccount := tblAccountWACCOUNTID.AsInteger ;
          tblAccount.Insert;
          tblAccountWLINKACCOUNT.AsInteger := Mainaccount ;
          tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
          tblAccountSSUBACCOUNTCODE.Value := edtSubAccount.Text;
          tblAccountWAccountTypeID.Value := 3;
          // Sylvain Acc
          tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+edtSubAccount.Text;
          tblAccountBSubAccounts.Value := 0;
          tblAccount.Post;
          tblAccount.Close;
          Disable(edtMainAccount);
          Disable(edtSubAccount);
          edtDescription.SetFocus;
        end
        else
          if edtMainAccount.Visible then begin
            BlankAll;
            OldAccount:='';
            edtMainAccount.SetFocus;
            FormActivate(Self);
            exit;
         end;
      end  
      else
      begin
        tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
        if tblAccountWAccountTypeID.value<>3 then
        begin
          OSFMessageDlg(GetTextLang(669){General Ledger account, Can not be used}, mterror, [mbok], 0);
          enable(edtMainAccount);
          enable(edtSubAccount);
          edtMainAccount.Text := '';
          edtSubAccount.Text:='';
          edtMainAccount.SetFocus;
          Exit;
        end;
        LoadBankAccountDetails;
        dmDatabase.tblAccount.Close;
        Disable(edtMainAccount);
        Disable(edtSubAccount);
        edtDescription.SetFocus;
      end;
    end;
  end;
end;

procedure TfmEditBankAccount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Enable(edtMainAccount);
  Enable(edtSubAccount);
  edtMainAccount.Text := '';
  DescLabel.Caption := '';
  edtSubAccount.Text := '';
  edtDescription.Text := '';
  CbxRepGroup1.Text := '';
  CbxRepGroup2.Text := '';
  CbxPayments.Text := '';
  CbxReceipts.Text := '';
end;

procedure TfmEditBankAccount.btnOkClick(Sender: TObject);
begin
 if Not UniqueBatch(CbxPayments) Or
    Not UniqueBatch(CbxReceipts) then
    begin
        edtMainAccount.SetFocus;
        FormActivate(Self);
        exit;
 end;
 if ((RTmp<>CbxReceipts.Text) And (RTmp<>'') ) or ( (PTmp<>CbxPayments.Text) and (Ptmp<>'') ) then
   if OSFMessageDlg(GetTextLang(665), mtinformation, [mbYes,mbNo], 0)<>MrYes then begin
    BlankAll;
    edtMainAccount.SetFocus;
    FormActivate(Self);
    Exit;
   end;
  with dmDatabase do
  begin
    tblAccount.Open;
    tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
    tblAccount.Edit;
    tblAccountSDescription.Value := edtDescription.Text;
    tblBatchTypes.Open ;
    tblAccountWReportingGroup1ID.Value := 0 ;
    if CbxRepGroup1.ItemIndex <> -1 then
    tblAccountWReportingGroup1ID.Value := Integer(CbxRepGroup1.Items.Objects[CbxRepGroup1.ItemIndex]);

    tblAccountWReportingGroup2ID.Value := 0 ;
    if CbxRepGroup2.ItemIndex <> -1 then
    tblAccountWReportingGroup2ID.Value := Integer(CbxRepGroup2.Items.Objects[CbxRepGroup2.ItemIndex]);

    tblAccountBIncomeExpense.Value := 0;
    tblBank.Open;
    if Not tblBank.Locate('WAccountID', tblAccountWAccountID.Value, []) then
    begin
      {Re-create Bank Account in Bank Table (Bug fixes)}
      tblBank.Append;
      tblBankWAccountID.Value := tblAccountWAccountID.Value;
      tblBank.Post;
    end;
    tblBank.Edit;
    if CbxPayments.ItemIndex <> -1 then
       tblBankWPaymentsID.AsInteger := Integer(CbxPayments.Items.Objects[CbxPayments.ItemIndex]);
    if tblBatchTypes.Locate('WBATCHTYPEID',tblBankWPaymentsID.AsInteger,[]) then
    begin
    //set up the batch
    tblBatchTypes.Edit;
    tblBatchTypesWContraAccountID.Value := tblAccountWAccountID.Value;
    tblBatchTypesWDebitCredit.Value := 1;
    tblBatchTypesBcashBook.Value :=1 ;
    tblBatchTypes.Post;
    end ;

    tblBankWReceiptsID.Value := 0 ;


    if CbxReceipts.ItemIndex <> -1 then
       tblBankWReceiptsID.AsInteger := Integer(CbxReceipts.Items.Objects[CbxReceipts.ItemIndex]);


    if (tblBatchTypes.Locate('WBATCHTYPEID', tblBankWReceiptsID.AsInteger, []) and (cbxReceipts.Visible)) then
    begin
    tblBatchTypes.Edit;
    tblBatchTypesWContraAccountID.Value := tblAccountWAccountID.Value;
    tblBatchTypesWDebitCredit.Value := 2;
    tblBatchTypesBcashBook.Value :=1 ;
    tblBatchTypes.Post;
    end;
    tblBatchTypes.Close;
    tblBank.Post;
    tblBank.Close;
    tblAccount.Post;
  end;
//  Close;
  if edtMainAccount.Visible then begin
    BlankAll;
    OldAccount:='';
    edtMainAccount.Enabled := true ;
    edtMainAccount.SetFocus;
    FormActivate(Self);
  end;  
end;

procedure TfmEditBankAccount.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEditBankAccount.edtMainAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
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
end;

procedure TfmEditBankAccount.UpdateCbxBats;
begin
  cbxReceipts.Items.clear;
  cbxPayments.Items.clear;
  dmdatabase.tblBatchTypes.open;
  dmdatabase.tblBatchTypes.First;

  cbxReceipts.Items.AddObject(' ',TObject(0));
  cbxPayments.Items.addObject(' ',TObject(0));

  While not dmdatabase.tblBatchTypes.eof do
  begin
    if dmdatabase.tblBatchTypesSDescription.value<>'' then
    begin
      cbxReceipts.Items.AddObject(dmdatabase.tblBatchTypesSDescription.Value,TObject(dmdatabase.tblBatchTypesWBATCHTYPEID.AsInteger));
      cbxPayments.Items.addObject(dmdatabase.tblBatchTypesSDescription.Value,TObject(dmdatabase.tblBatchTypesWBATCHTYPEID.AsInteger));
    end;
    dmdatabase.tblBatchTypes.Next;
  end;
  dmdatabase.tblBatchTypes.Close;
end;

procedure TfmEditBankAccount.FormShow(Sender: TObject);

begin
Disable(edtSubAccount);
               (* Edit Bank Accout *)
               //Header 250
               Caption := GetTextLang(250);
               //Account Number 176
               Label1.Caption := GetTextLang(176);
               //Sub Account 177
               //Label2.Caption := GetTextLang(177);
               //Description 178
               Label3.Caption := GetTextLang(178);
               //Rep Group 1
               Label4.Caption := GetTextLang(179);
               //Rep Group 2
               Label5.Caption := GetTextLang(180);
               //Payments
               Label6.Caption := GetTextLang(181);
               //Receipts
               Label7.Caption := GetTextLang(182);
               //OK
               btnOK.Caption := GetTextLang(167);
               //cancel
               btnCancel.Caption := GetTextLang(168);
               navBtns(fcNew,fcSearch,fcDelete,fcSave1);




  {Bug Fix, Delete All Record With Blank WaccountID}
  edtMainAccount.MaxLength := MainAccountLength ;

  dmDatabase.tblBank.DisableControls;
  dmDatabase.tblBank.Open;
  dmDatabase.tblBank.Filtered:=False;
  dmDatabase.tblBank.First;
  While Not dmDatabase.tblBank.Eof do
  begin
    if dmDatabase.tblBankWAccountID.AsString='' then
      dmDatabase.tblBank.Delete
    else
      dmDatabase.tblBank.Next;
  end;
  dmDatabase.tblBank.Close;
  dmDatabase.tblBank.Filtered:=False;
  dmDatabase.tblBank.Filter := '';
  dmDatabase.tblBank.EnableControls;
  UpdateCbxBats;
  CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,20);
  CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,21);
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  edtMainAccount.SetFocus;
  dmDatabase.tblSysVars.Open;
  Label4.Caption := dmDatabase.tblSysVarsSACCOUNTReportName1.Value;
  Label5.Caption := dmDatabase.tblSysVarsSACCOUNTReportName2.Value;
  dmDatabase.tblSysVars.Close;
  TmpIDAcc:=-1;
  Ok:=True;
  fcMenu.ActivePage:= fcSearch;



  if not ReadReportOp('CBViewAllBankState',true).AsBoolean then
    begin
       Label6.Caption := GetTextLang(181) + ' / ' + GetTextLang(182) ;
       Label7.Visible := false ;
       cbxReceipts.Visible := false ;
    end;
end;

procedure TfmEditBankAccount.FormActivate(Sender: TObject);
begin
  if not (fsShowing in FmLookup.FormState) then
  begin
  if FmLookup.Visible then
    begin
         ReturnLookup :='Close' ;
         FmLookup.Close ;
         EndFormActivate(self);
       exit ;
    end ;
  //make the box a nice colour
  edtMainAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(OldAccount, 5);
  end else
  EndFormActivate(self);
end;

procedure TfmEditBankAccount.EndFormActivate(Sender: TObject);
begin
  if (ReturnLookup <> 'NEW') and(ReturnLookup <> 'ESC') and (ReturnLookup <> '-') and (ReturnLookup <> '') then
  begin
    edtMainAccount.Text := GetMainAccountCode(ReturnLookup);
    edtSubAccount.Text := GetSubAccountCode(ReturnLookup);
    Disable(edtMainAccount);
    Disable(edtSubAccount);
  end
  else
    edtMainAccount.Color := clWindow;
end;

procedure TfmEditBankAccount.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 // done : Pieter No spaces in account number alowed
  if (sender = edtMainAccount)  and (key = 39) then
  begin
    Key := 0 ;
    exit ;
  end;
  if Key = 112 then
  begin
    //Result := (HTMLHelpShowHelp <> 0);

    HtmlShowTopic(116);
    key := 0;
  end;
end;


procedure TfmEditBankAccount.cbxPaymentsClick(Sender: TObject);
begin
  if ReadReportOp('CBViewAllBankState',true).AsBoolean then
  begin
    if Not UniqueBatch(CbxPayments) then
    begin
      edtMainAccount.SetFocus;
      FormActivate(Self);
      exit;
    end;
   end else
   begin
     cbxReceipts.ItemIndex := cbxPayments.ItemIndex ;
   end;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmEditBankAccount.cbxReceiptsClick(Sender: TObject);
begin
  if ReadReportOp('CBViewAllBankState',true).AsBoolean then
  begin
    if Not UniqueBatch(cbxReceipts) then begin
      edtMainAccount.SetFocus;
      FormActivate(Self);
      exit;
    end;
  end;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmEditBankAccount.CbxRepGroup1DropDown(Sender: TObject);
begin
  (Sender As TwwDBComboBox).Color:=ClInfoBk;
end;

procedure TfmEditBankAccount.CbxRepGroup1CloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  (Sender As TwwDBComboBox).Color:=ClWindow;
end;

Procedure TfmEditBankAccount.ClsScreen;
begin
    Enable(edtMainAccount);
    //Enable(edtSubAccount);
    edtMainAccount.text:='';
    edtSubAccount.text:='000';
    edtDescription.Text:='';
    CbxRepGroup1.Text:='';
    CbxRepGroup2.Text:='';
    cbxPayments.Text:='';
    cbxReceipts.Text:='';
    DescLabel.Caption :='';
end;

procedure TfmEditBankAccount.btnDeleteClick(Sender: TObject);
begin
  dmDatabase.tblAccount.Open;
  if dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + '000']), []) then
  begin
    if OSFMessageDlg(GetTextLang(460){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
      DeleteAccount(dmDatabase.tblAccountWAccountID.Value);
    fcmenu.ActivePage :=  fcSearch ;
    fcSearchClick(self);
  end
  else
    OSFMessageDlg(GetTextLang(832){Account does not exit}, mterror, [mbok], 0);
  // This closes the search box.
  //dmDatabase.tblAccount.Close;
end;

procedure TfmEditBankAccount.fcSearchClick(Sender: TObject);
begin
      ClsScreen;
      edtMainAccount.SetFocus;
      FormActivate(Sender);
end;

procedure TfmEditBankAccount.fcDeleteClick(Sender: TObject);
begin
      if trim(edtMainAccount.Text)='' then
        exit
      else
         btnDeleteClick(Sender);

end;

procedure TfmEditBankAccount.fcSave1Click(Sender: TObject);
begin
      if trim(edtMainAccount.Text)='' then
        exit
      else
      btnOkClick(Sender);
end;

procedure TfmEditBankAccount.fcNewClick(Sender: TObject);
begin
      ClsScreen;
      edtMainAccount.SetFocus;
end;

procedure TfmEditBankAccount.FormCreate(Sender: TObject);
begin
  if IsRightToLeftText then
   BiDiMode := bdLeftToRight;

   FmLookup.IsShowForm := true ;
end;

procedure TfmEditBankAccount.FormDestroy(Sender: TObject);
begin
   FmLookup.IsShowForm := false ;
end;



procedure TfmEditBankAccount.edtDescriptionEnter(Sender: TObject);
begin
 // done : Pieter strange bug needs strange fix.
 // bug is when u make a new account and use your mouse to go to the name after entering the accountcode
 // then you can not type in to the field.
 {edtDescription.OnEnter := nil ;
 try
 CbxRepGroup1.SetFocus;
 edtDescription.SetFocus;
 finally
 edtDescription.OnEnter := edtDescriptionEnter ;
 end;}
end;

procedure TfmEditBankAccount.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false ;
try
 edtDescription.SetFocus;
  except;
  end; 
end;

end.

