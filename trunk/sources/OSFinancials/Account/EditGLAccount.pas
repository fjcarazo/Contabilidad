(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit EditGLAccount;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, wwdbedit, Wwdotdot, Wwdbcomb,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, ActnList;

type
  TfmEditGLAccount = class(TForm)
    Label1: TLabel;
    edtMainAccount: TEdit;
    edtSubAccount: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ButtonPanel: TPanel;
    edtDescription: TEdit;
    cbIncExp: TCheckBox;
    DescLabel: TLabel;
    CbxRepGroup1: TwwDBComboBox;
    CbxRepGroup2: TwwDBComboBox;
    btnOk: TBitBtn;
    BtnCancel: TBitBtn;
    fcMenu: TfcOutlookBar;
    fcSubNew: TfcOutlookList;
    fcNew: TfcShapeBtn;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcSearch: TfcShapeBtn;
    fcOutlookBar1OutlookList3: TfcOutlookList;
    fcDelete: TfcShapeBtn;
    fcOutlookBar1OutlookList4: TfcOutlookList;
    fcMenu1: TfcShapeBtn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Timer1: TTimer;
    LcbIncExp: TLabel;
    CBInActive: TCheckBox;
    Label6: TLabel;
    CBOpenitem: TCheckBox;
    Label7: TLabel;
    procedure edtMainAccountExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbedtDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtSubAccountExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CbxRepGroup1CloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure CbxRepGroup1DropDown(Sender: TObject);
    procedure fcSearchClick(Sender: TObject);
    procedure fcDeleteClick(Sender: TObject);
    procedure fcMenu1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDescriptionEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    Procedure ClsScreen;
    Procedure DeleteGlAcc(Sender: TObject);
    procedure EndFormActivate(Sender: TObject);
    { Private declarations }
  public
     LastAccount : String ;
    { Public declarations }
  end;

var
  fmEditGLAccount: TfmEditGLAccount;
  
implementation

Uses Database, Main, GlobalFunctions, Lookup, HtmlHelpAPI,
  LanguageChoice, TcVariables, DatabaseAccess,LedgerRoutines,XRoutines;

{$R *.DFM}

procedure TfmEditGLAccount.edtMainAccountExit(Sender: TObject);
var
 i : Integer ;
begin
  if BtnCancel.Focused then exit;
  if edtMainAccount.Text = '' then begin
    OSFMessageDlg(Gettextlang(748){Illegal account Number?}, mterror, [mbOk], 0);
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
       // if Length(edtMainAccount.Text) = 1 then
      //    edtMainAccount.Text := '00000' + edtMainAccount.Text;
      //  if Length(edtMainAccount.Text) = 2 then
      //    edtMainAccount.Text := '0000' + edtMainAccount.Text;
      end;
      with dmDatabase do
      begin
        tblAccount.filter :='WAccountTypeID=0'  ;
        tblAccount.Filtered := true ;
        tblAccount.Open;
        if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text+'000']), []) = False then
        begin
          if OSFMessageDlg(Gettextlang(432){Create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
          begin
            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
            tblAccountSSUBACCOUNTCODE.Value := '000';
            tblAccountWAccountTypeID.Value := 0;
            tblAccountBSubAccounts.Value := 0;
            dmDatabase.tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+'000';
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);
            tblAccount.Close;
            Disable(edtMainAccount);
            edtSubAccount.Text := '000';
            Disable(edtSubAccount);
            edtDescription.SetFocus;
          end
          else
          begin
            tblAccount.Close;
            edtMainAccount.Text := '';
            edtMainAccount.SetFocus;
          end
        end
        else
        begin
//  Sylvain
          Disable(edtMainAccount);
          DescLabel.Caption := tblAccountSDescription.Value;
          //Get rep group 1
          dmDatabase.tblGroups.Open;
          if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup1ID.Value, 20{Account Reporting Group1}]), []) = True then
            CbxRepGroup1.Text := dmDatabase.tblGroupsSDescription.Value
          else
            CbxRepGroup1.Text := '';
          //Get rep group 2
          if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup2ID.Value, 21{Account Reporting Group2}]), []) = True then
            CbxRepGroup2.Text := dmDatabase.tblGroupsSDescription.Value
          else
            CbxRepGroup2.Text := '';
          dmDatabase.tblGroups.Close;
          If  tblAccountBIncomeExpense.AsInteger = 1 then
            cbIncExp.State:= CbChecked
          else cbIncExp.State:= CbUnChecked;
          cbIncExp.Enabled:= not CheckTransActionsByID(tblAccountWAccountId.Value);
          CBOpenitem.Checked := tblAccountBOPENITEM.AsInteger = 1 ;
          CBInActive.Checked := tblAccountBINACTIVE.AsInteger = 1 ;



          if isControlAccount(tblAccountWAccountId.Value) then
          begin
            edtDescription.Text := tblAccountSDescription.Value;
//             OSFMessageDlg(GetTextLang(666){Control account , Can not be used}, mterror, [mbok], 0);
             Disable(edtSubAccount);
             edtDescription.SetFocus;
             cbIncExp.Enabled:= false ;
          end
          else
            edtSubAccount.SetFocus;
        end;
      end;
    end
    else
    begin
      OSFMessageDlg(Gettextlang(433){Invalid account number, the first letter must be a number}, mterror, [mbok], 0);
      edtMainAccount.Text := '';
      edtMainAccount.SetFocus;
    end;
  end;

  fcMenu.SetFocus;
  Timer1.Enabled := true ;
end;

procedure TfmEditGLAccount.edtSubAccountExit(Sender: TObject);
Var
  FID,TID,MainAccountId :Integer;
begin
  if Length(edtSubAccount.Text) < 3 then
  begin
    if Length(edtSubAccount.Text) = 1 then
      edtSubAccount.Text := '00' + edtSubAccount.Text;
    if Length(edtSubAccount.Text) = 2 then
      edtSubAccount.Text := '0' + edtSubAccount.Text;
  end;
  if (edtSubAccount.Text = '000') or (edtSubAccount.Text = '') then
  begin
    //Change the visible stuff
    if edtSubAccount.Text = '' then edtSubAccount.Text := '000';
    Disable(edtMainAccount);
    Disable(edtSubAccount);
    DescLabel.Caption := '';
    edtDescription.SetFocus;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text+ '000']), []);

    if dmDatabase.tblAccountWAccountTypeID.Value <> 0 then
    begin
      OSFMessageDlg(Gettextlang(467){This is not a GL account}, mterror, [mbok], 0);
      Enable(edtMainAccount);
      Enable(edtSubAccount);
      edtMainAccount.Text := '';
      edtSubAccount.Text := '';
      edtMainAccount.SetFocus;
      exit;
    end;
    //get the account description
    edtDescription.Text := dmDatabase.tblAccountSDescription.Value;
    //Get rep group 1
    dmDatabase.tblGroups.Open;
    if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup1ID.Value, 20{Account Reporting Group1}]), []) then
      CbxRepGroup1.Text := dmDatabase.tblGroupsSDescription.Value
    else
      CbxRepGroup1.Text := '';
    //Get rep group 2
    if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup2ID.Value, 21{Account Reporting Group2}]), []) then
      CbxRepGroup2.Text := dmDatabase.tblGroupsSDescription.Value
    else
      CbxRepGroup2.Text := '';
    dmDatabase.tblGroups.Close;
    //Income Expense ?
    cbIncExp.Checked := dmDatabase.tblAccountBIncomeExpense.AsInteger = 1;
    CBOpenitem.Checked := dmDatabase.tblAccountBOPENITEM.AsInteger = 1 ;
    CBInActive.Checked := dmDatabase.tblAccountBINACTIVE.AsInteger = 1 ;
    dmDatabase.tblAccount.Close;
  end
  else
  begin
    with dmDatabase do
    begin
      tblAccount.Open;
      if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []) = False then
      begin
        if OSFMessageDlg(Gettextlang(432){Create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
        begin
          //check for transactions
          // Sylvain
          if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + '000']), []) then
          //
          if (CheckTransActions(edtMainAccount.Text, '000')) and ( Not tblAccountBSubAccounts.AsInteger = 1) then
          begin
            if OSFMessageDlg(Gettextlang(468){This account is still active , all transactions will be moved to new sub account, are you sure you wish to create sub account ?},
                          mtconfirmation, [mbyes, mbno], 0) = mryes then
            begin
              tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + '000']), []);
              tblAccount.Edit;
              tblAccountBSubAccounts.AsInteger := 1;
              MainAccountId := tblAccountWACCOUNTID.AsInteger ;
              tblAccount.Post;

              tblAccount.Insert;
              tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
              tblAccountSSUBACCOUNTCODE.Value := edtSubAccount.Text;
              tblAccountWLINKACCOUNT.AsInteger := MainAccountId ;
              tblAccountWAccountTypeID.Value := 0;
              // Sylvain Acc
              tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+edtSubAccount.Text;
              tblAccountBSubAccounts.AsInteger := 0;
              tblAccount.Post;
              TID:=tblAccountWAccountID.Value;
              CreateTotals(tblAccountWAccountID.Value);
              //acounts table must be open (which it is) to do this
//              TransferTransactions(edtMainAccount.Text  + '-' + '000', edtMainAccount.Text + '-' + edtSubAccount.Text);
              tblAccount.Locate('SACCOUNTCODE',edtMainAccount.Text + '000',[]);

              FID:=tblAccountWAccountID.Value;
              TransferTransactions(FID,TID);

              tblAccount.Close;
              Disable(edtMainAccount);
              Disable(edtSubAccount);
              edtDescription.SetFocus;
            end
            else
              Close;
          end
          else
          begin
            tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + '000']), []);
            tblAccount.Edit;
            tblAccountBSubAccounts.Value := 1;
            MainAccountId := tblAccountWACCOUNTID.AsInteger ;
            tblAccount.Post;

            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
            tblAccountSSUBACCOUNTCODE.Value := edtSubAccount.Text;
            tblAccountWAccountTypeID.Value := 0;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.AsString := edtMainAccount.Text+edtSubAccount.Text;
            tblAccountWLINKACCOUNT.AsInteger := MainAccountId ;
            tblAccountBSubAccounts.AsInteger := 0;
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);

//            CreateTotals(tblAccountWAccountID.Value, '');
            tblAccount.Close;
            Disable(edtMainAccount);
            Disable(edtSubAccount);
            edtDescription.SetFocus;
          end;
        end;
      end
      else
      begin
        tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text  + edtSubAccount.Text]), []);
        if dmDatabase.tblAccountWAccountTypeID.Value <> 0 then
        begin
          OSFMessageDlg(Gettextlang(467){This is not a GL account}, mterror, [mbok], 0);
          Enable(edtMainAccount);
          Enable(edtSubAccount);
          edtMainAccount.Text := '';
          edtSubAccount.Text := '';
          edtMainAccount.SetFocus;
          exit;
        end;
        //get the account description
        edtDescription.Text := dmDatabase.tblAccountSDescription.Value;
        //Get rep group 1
        dmDatabase.tblGroups.Open;
        if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup1ID.Value, 20{Account Reporting Group1}]), []) = True then
          CbxRepGroup1.Text := dmDatabase.tblGroupsSDescription.Value
        else
          CbxRepGroup1.Text := '';
        //Get rep group 2
        if dmDatabase.tblGroups.Locate('WGroupID; WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup2ID.Value, 21{Account Reporting Group2}]), []) = True then
          CbxRepGroup2.Text := dmDatabase.tblGroupsSDescription.Value
        else
          CbxRepGroup2.Text := '';
        dmDatabase.tblGroups.Close;
        //Income Expense ?
        cbIncExp.Checked := dmDatabase.tblAccountBIncomeExpense.AsInteger = 1;
       CBOpenitem.Checked := dmDatabase.tblAccountBOPENITEM.AsInteger = 1 ;
       CBInActive.Checked := dmDatabase.tblAccountBINACTIVE.AsInteger = 1 ;
        dmDatabase.tblAccount.Close;
        Disable(edtMainAccount);
        Disable(edtSubAccount);
        edtDescription.SetFocus;
      end;
    end;
  end;
end;

procedure TfmEditGLAccount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Enable(edtMainAccount);
  Enable(edtSubAccount);
  ClsScreen;
//  edtMainAccount.Text := '';
//  DescLabel.Caption := '';
//  edtSubAccount.Text := '';
//  edtDescription.Text := '';
//  CbxRepGroup1.Text := '';
//  CbxRepGroup2.Text := '';
//  cbIncExp.Checked := False;
end;

procedure TfmEditGLAccount.btnOkClick(Sender: TObject);
begin
  if (Trim(edtMainAccount.text)='') or (Trim(edtSubAccount.text)='') then
    exit;
  with dmDatabase do
  begin
    tblAccount.Open;
    tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text+ edtSubAccount.Text]), []);
    tblAccount.Edit;
    tblAccountSDescription.Value := edtDescription.Text;
    tblGroups.Open;
    tblAccountWReportingGroup1ID.Value:=0;
    tblAccountWReportingGroup2ID.Value:=0;
    if tblGroups.Locate('SDescription; WGroupTypeID', VarArrayOf([CbxRepGroup1.Text, 20{Account Reporting Group1}]), []) then
      tblAccountWReportingGroup1ID.Value := tblGroupsWGroupID.Value;
    if tblGroups.Locate('SDescription; WGroupTypeID', VarArrayOf([CbxRepGroup2.Text, 21{Account Reporting Group2}]), []) then
    tblAccountWReportingGroup2ID.Value := dmDatabase.tblGroupsWGroupID.Value;
    tblGroups.Close;
    tblAccountBIncomeExpense.AsInteger := ord(cbIncExp.Checked);
    dmDatabase.tblAccountBOPENITEM.AsInteger := ord(CBOpenitem.Checked) ;
    dmDatabase.tblAccountBINACTIVE.AsInteger := ord(CBInActive.Checked) ;

    tblAccount.Post;
    CreateTotals(tblAccountWAccountID.Value);
  end;
//  cbIncExp.Enabled:=True;
  if edtMainAccount.Visible then
  begin
    enable(edtMainAccount);
    enable(edtSubAccount);
//    edtMainAccount.text:='';
//    edtSubAccount.text:='';
//    edtDescription.Text:='';
//    CbxRepGroup1.Text:='';
//    CbxRepGroup2.Text:='';
 // done : Pieter Do we need this ?
   // ClsScreen;
    edtMainAccount.SetFocus;
    FormActivate(Sender)
  end
  else
     Close;
end;

procedure TfmEditGLAccount.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEditGLAccount.dbedtDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if edtMainAccount.Text<>'' then
      if OSFMessageDlg(Gettextlang(435){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
        btnOkClick(Sender)
      else
        btnCancelClick(Sender)
    else
        btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmEditGLAccount.FormShow(Sender: TObject);
begin

  Caption := GetTextLang(253);
  Label1.Caption := GetTextLang(176);
  Label2.Caption := GetTextLang(177);
  Label3.Caption := GetTextLang(178);
  Label4.Caption := GetTextLang(179);
  Label5.Caption := GetTextLang(180);
  Label6.Caption := GetTextLang(304);// inactive
  lcbIncExp.Caption := GetTextLang(206);
  btnOK.Caption := GetTextLang(167);
  btnCancel.Caption := GetTextLang(168);
  Label7.Caption := GetTextLang(3038);// openitem account
  navBtns(fcNew,fcSearch,fcDelete,fcMenu1);
   //Account
  fcSubNew.Items[0].Text:= GetTextLang(34);
   //Sub-Account
  fcSubNew.Items[1].Text := GetTextLang(177);

  edtMainAccount.MaxLength := MainAccountLength ;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  CbxRepGroup1.Enabled:= FillStringsWithReportingGroups(CbxRepGroup1.Items,20);
  CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,21);
  edtMainAccount.SetFocus;
  dmDatabase.tblSysVars.Open;
  Label4.Caption := dmDatabase.tblSysVarsSACCOUNTReportName1.Value;
  Label5.Caption := dmDatabase.tblSysVarsSACCOUNTReportName2.Value;
  dmDatabase.tblSysVars.Close;
  fcMenu.ActivePage:= fcSearch;


end;


procedure TfmEditGLAccount.EndFormActivate(Sender: TObject);
begin
  if (ReturnLookup <> 'NEW') and (ReturnLookup <> 'ESC') and (ReturnLookup <> '-') then
  begin
    edtMainAccount.Text := GetMainAccountCode(ReturnLookup );
    edtSubAccount.Text := GetSubAccountCode(ReturnLookup );
    Disable(edtMainAccount);
    Disable(edtSubAccount);
  end
  else
    begin
    ClsScreen ;
    edtMainAccount.Color := clWindow;
    end;
end;

procedure TfmEditGLAccount.FormActivate(Sender: TObject);
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

  // done : Pieter Some adjustments
  if sender = nil then exit ;
  //make the box a nice colour
  cbIncExp.Enabled:=True;
  edtMainAccount.Color := clHighlight;
  //fmLookup.SelectLookup(Sender, 'Accounts', 'GLONE', 'ACCOUNT', 1);
   if trim(edtMainAccount.Text) <> '' then
  CallLookup(edtMainAccount.Text, 2) else
  CallLookup(LastAccount, 2) ;

  end else
  EndFormActivate(self);
end;

procedure TfmEditGLAccount.FormKeyDown(Sender: TObject; var Key: Word;
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
     key := 0;
     HtmlShowTopic(118);
  end;
end;

procedure TfmEditGLAccount.CbxRepGroup1CloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  (Sender As TwwDBComboBox).Color:=ClWindow;
end;

procedure TfmEditGLAccount.CbxRepGroup1DropDown(Sender: TObject);
begin
  (Sender As TwwDBComboBox).Color:=ClInfoBk;
end;

Procedure TfmEditGLAccount.ClsScreen;
begin
    Enable(edtMainAccount);
    Enable(edtSubAccount);
    edtMainAccount.text:='';
    edtSubAccount.text:='';
    edtDescription.Text:='';
    CbxRepGroup1.Text:='';
    CbxRepGroup2.Text:='';
    cbIncExp.Checked := False;
    cbIncExp.Enabled := True;
end;


Procedure TfmEditGLAccount.DeleteGlAcc(Sender: TObject);

begin
  dmDatabase.tblAccount.Open;
  if dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []) then
  begin
    if CheckControlAccountID( dmDatabase.tblAccountWAccountID.Value) then
    begin
      OSFMessageDlg(Gettextlang(754){Can not Delete control Account}, mterror, [mbok], 0);
      exit;
    end;
    if dmDatabase.tblAccountSSUBACCOUNTCODE.Value = '000' then
    begin
      dmDatabase.tblAccount.Filtered := False;
      dmDatabase.tblAccount.Filter := 'SMAINACCOUNTCODE = ''' + edtMainAccount.Text + ''' and SSUBACCOUNTCODE <> ''000''';
      dmDatabase.tblAccount.Filtered := True;
      if dmDatabase.tblAccount.RecordCount <> 0 then
      begin
        OSFMessageDlg(Gettextlang(461){This account contains} + IntToStr(dmDatabase.tblAccount.RecordCount) + Gettextlang(462){ sub-account(s) and cannot be deleted}, mterror, [mbok], 0);
        dmDatabase.tblAccount.Filtered := False;
        dmDatabase.tblAccount.Filter := '';
      end
      else
      begin
        dmDatabase.tblAccount.Filtered := False;
        dmDatabase.tblAccount.Filter := '';
        dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
        if OSFMessageDlg(Gettextlang(460){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
          DeleteAccount(dmDatabase.tblAccountWAccountID.Value);
      end;
    end
    else
    begin
      dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
      if OSFMessageDlg(GetTextLang(460){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
        DeleteAccount(dmDatabase.tblAccountWAccountID.Value);
    end;
  end
  else
    OSFMessageDlg(GetTextLang(832){Account does not exit}, mterror, [mbok], 0);  
 // this closes the account search box
 // dmDatabase.tblAccount.close;
   fcMenu.ActivePage := fcSearch ;
   fcSearchClick(self);
//  Close;
end;

procedure TfmEditGLAccount.fcSearchClick(Sender: TObject);
begin
      LastAccount := edtMainAccount.text + '-' +  edtSubAccount.text ;
      ClsScreen;
      edtMainAccount.SetFocus;
      FormActivate(Sender);
end;

procedure TfmEditGLAccount.fcDeleteClick(Sender: TObject);
begin
  DeleteGlAcc(Sender);
end;

procedure TfmEditGLAccount.fcMenu1Click(Sender: TObject);
begin
      if trim(edtMainAccount.Text)='' then
        exit
      else
      btnOkClick(Sender);
end;

procedure TfmEditGLAccount.Action1Execute(Sender: TObject);

var
 TempAccount : String ;
begin
  // done : Pieter ajustments
  TempAccount := edtMainAccount.Text ;
  btnOkClick(nil) ;
  edtMainAccount.Text  :=  TempAccount;

      edtSubAccount.Enabled := False;
      ClsScreen;
      edtMainAccount.SetFocus;

end;


procedure TfmEditGLAccount.Action2Execute(Sender: TObject);
var
 TempAccount : String ;
begin
  // done : Pieter ajustments
  TempAccount := edtMainAccount.Text ;
//  btnOkClick(nil) ;
  edtMainAccount.Text  :=  TempAccount;
  if  (edtMainAccount.Text<>'') then
  begin
    edtMainAccount.Enabled := False;
    edtSubAccount.Text:='';
    Enable(edtSubAccount);
    edtSubAccount.SetFocus;
  end;
end;


procedure TfmEditGLAccount.FormCreate(Sender: TObject);
begin
  if IsRightToLeftText then
   BiDiMode := bdLeftToRight;
 FmLookup.IsShowForm := true ;
end;



procedure TfmEditGLAccount.FormDestroy(Sender: TObject);
begin
 FmLookup.IsShowForm := false ;
end;

procedure TfmEditGLAccount.edtDescriptionEnter(Sender: TObject);
begin
 // done : Pieter strange bug needs strange fix.
 // bug is when u make a new account and use your mouse to go to the name after entering the accountcode
 // then you can not type in to the field.
{ edtDescription.OnEnter := nil ;
 try
 CbxRepGroup1.SetFocus;
 edtDescription.SetFocus;
 finally
 edtDescription.OnEnter := edtDescriptionEnter ;
 end;   }
end;

procedure TfmEditGLAccount.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled := false ;
edtDescription.SetFocus;
end;

end.
