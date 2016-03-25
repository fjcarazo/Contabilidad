(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit EditTaxAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar;

type
  TfmEditTaxAccount = class(TForm)
    ButtonPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DescLabel: TLabel;
    edtMainAccount: TEdit;
    edtSubAccount: TEdit;
    edtDescription: TEdit;
    Label6: TLabel;
    dtFrom: TDateTimePicker;
    Label7: TLabel;
    dtTo: TDateTimePicker;
    Label8: TLabel;
    edtPercent: TEdit;
    btnOk: TBitBtn;
    BtnCancel: TBitBtn;
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
    Label11: TLabel;
    CBUseTaxLink: TCheckBox;
    PLinkTaxes: TPanel;
    Label10: TLabel;
    cbbLinkTaxId: TComboBox;
    CBContraTax: TCheckBox;
    Label9: TLabel;
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
    procedure edtPercentExit(Sender: TObject);
    procedure CbxRepGroup1CloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure CbxRepGroup1DropDown(Sender: TObject);
    procedure fcSubNewItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcSearchClick(Sender: TObject);
    procedure fcDeleteClick(Sender: TObject);
    procedure fcSave1Click(Sender: TObject);
    procedure fcSubNewItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDescriptionEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CBUseTaxLinkClick(Sender: TObject);
  private
    Procedure ClsScreen;
    { Private declarations }
    procedure btnDeleteClick(Sender: TObject);
    procedure EndFormActivate(Sender: TObject);
  public
    procedure LoadTaxAccountDetails;

    { Public declarations }
  end;

var
  fmEditTaxAccount: TfmEditTaxAccount;

implementation

uses Main, Database, GlobalFunctions, Lookup, HtmlHelpAPI,
  LanguageChoice, TcVariables, DatabaseAccess,LedgerRoutines,XRoutines;

{$R *.DFM}



procedure TfmEditTaxAccount.LoadTaxAccountDetails;
begin
  //get the account description
 
  edtDescription.Text := dmDatabase.tblAccountSDescription.Value;
  //Get rep group 1
  dmDatabase.tblGroups.Open;
  if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup1ID.Value, 20{Account Reporting Group1}]), []) = True then
    CbxRepGroup1.Text := dmDatabase.tblGroupsSDescription.Value
  else
    CbxRepGroup1.Text := '';
  //Get rep group 2
  if dmDatabase.tblGroups.Locate('WGroupID;WGroupTypeID', VarArrayOf([dmDatabase.tblAccountWReportingGroup2ID.Value, 21{Account Reporting Group2}]), []) = True then
    CbxRepGroup2.Text := dmDatabase.tblGroupsSDescription.Value
  else
    CbxRepGroup2.Text := '';
  dmDatabase.tblGroups.Close;
  //get the tax info
  dmDatabase.tblTax.Open;
  dmDatabase.tblTax.Locate('WAccountID', dmDatabase.tblAccountWAccountID.Value, []);
  dtFrom.Date := dmDatabase.tblTaxDStartDate.Value;
  dtTo.Date := dmDatabase.tblTaxDEndDate.Value;
  edtPercent.Text := dmDatabase.tblTaxFRate.AsString;
  FillStringListWithSelect(cbbLinkTaxId.Items,'select WAccountID,SAccountCode||'+ QuotedStr(' ')+' ||SDescription from ACCOUNT where WAccountTypeId = 4 and WAccountId not in(0,'
  + IntToStr(dmDatabase.tblAccountWAccountID.AsInteger) + ')' ) ;
  CBUseTaxLink.Checked := dmDatabase.tblTaxWLINKTAXID.AsInteger <> 0 ;
  cbbLinkTaxId.ItemIndex := GetItemIndexFromId(cbbLinkTaxId.Items,dmDatabase.tblTaxWLINKTAXID.AsInteger);
  CBContraTax.Checked := dmDatabase.tblTaxBLINKCONTRA.AsInteger = 1 ;
  dmDatabase.tblTax.Close;
  CBUseTaxLinkClick(self);
end;

procedure TfmEditTaxAccount.edtMainAccountExit(Sender: TObject);
var
 i : Integer ;
begin

  if BtnCancel.Focused then exit;
  if edtMainAccount.Text = '' then begin
    OSFMessageDlg(GetTextLang(748){Illegal account Number?}, mterror, [mbOk], 0);
    edtMainAccount.Setfocus;
    exit;
  end
  else
  begin
    if CheckAccountNumber(edtMainAccount.Text)  then
    begin
      if Length(edtMainAccount.Text) < MainAccountLength then
      begin
      // done : Pieter Accountnr to 6 digets
        for i := Length(edtMainAccount.Text) to MainAccountLength -1 do
           edtMainAccount.Text := '0' + edtMainAccount.Text;

      end;
      with dmDatabase do
      begin
        tblAccount.filter := 'WAccountTypeID = 4 or WAccountTypeID = 0 or WAccountTypeID = 3' ;
        tblAccount.Filtered := true; 
        tblAccount.Open;
        
        if not tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text+'000']), [])  then
        begin
          if OSFMessageDlg(GetTextLang(432){Create this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
          begin
            tblAccount.Insert;
            tblAccountSMAINACCOUNTCODE.Value := edtMainAccount.Text;
            tblAccountSSUBACCOUNTCODE.Value := '000';
            tblAccountWReportingGroup1ID.Value:=0;
            tblAccountWReportingGroup2ID.Value:=0;
            tblAccountWAccountTypeID.Value := 4;
            tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
            tblAccountBSubAccounts.Value := 0;
            // Sylvain Acc
            tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+'000';
            tblAccount.Post;
            CreateTotals(tblAccountWAccountID.Value);
            tblTax.Open;
            tblTax.Insert;
            tblTaxWAccountID.Value := tblAccountWAccountID.Value;
            tblTax.Post;
            tblTax.Close;
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
            if not (tblAccountWACCOUNTTYPEID.AsInteger in [4,0]) then
              begin
                OSFMessageDlg('There is already a ledger account with this number please create a uniqe number for the whole leder!',mtWarning,[mbok],0);
                edtMainAccount.SetFocus ;
                exit ;
              end;
            Disable(edtMainAccount);
            Disable(edtSubAccount);
            LoadTaxAccountDetails;
            edtDescription.SetFocus;
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
  if CbxRepGroup1.CanFocus then
   CbxRepGroup1.SetFocus else
   edtPercent.SetFocus ;

   Timer1.Enabled := true ;
end;

procedure TfmEditTaxAccount.edtSubAccountExit(Sender: TObject);
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
  if (edtSubAccount.Text = '000') or (edtSubAccount.Text = '') then
  begin
    OSFMessageDlg(GetTextLang(469){This is not a tax account}, mterror, [mbok], 0);
    Enable(edtMainAccount);
    Enable(edtSubAccount);
    edtMainAccount.Text := '';
    edtSubAccount.Text := '';
    edtMainAccount.SetFocus;
  end
  else
  begin
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
          tblAccountWAccountTypeID.Value := 4;
          // Sylvain Acc
          tblAccountSACCOUNTCODE.Value := edtMainAccount.Text+edtSubAccount.Text;
          tblAccount.Post;
          // 27/03/00
          CreateTotals(tblAccountWAccountID.Value);
          tblTax.Open;
          tblTax.Insert;
          tblTaxWAccountID.Value := tblAccountWAccountID.Value;
          tblTax.Post;
          tblTax.Close;
          //

          tblAccount.Close;
          Disable(edtMainAccount);
          Disable(edtSubAccount);
          edtDescription.SetFocus;
        end;
      end
      else
      begin
        tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
        if tblAccountWAccountTypeID.value<>4 then
        begin
          OSFMessageDlg(GetTextLang(669){General Ledger account, Can not be used}, mterror, [mbok], 0);
          enable(edtMainAccount);
          enable(edtSubAccount);
          edtMainAccount.Text := '';
          edtSubAccount.Text:='';
          edtMainAccount.SetFocus;
          Exit;
        end;
        LoadTaxAccountDetails;
        dmDatabase.tblAccount.Close;
        Disable(edtMainAccount);
        Disable(edtSubAccount);
        edtDescription.SetFocus;
      end;
    end;
  end;
end;

procedure TfmEditTaxAccount.FormClose(Sender: TObject;
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
  dtFrom.Date := Date;
  dtTo.Date := Date;
  edtPercent.Text := '';
end;

procedure TfmEditTaxAccount.btnOkClick(Sender: TObject);
Var
 D1:Tdate;
begin
  if dtFrom.date>dtTo.Date then begin
    D1:=dtFrom.date;dtFrom.date:=dtTo.Date;dtTo.Date:=D1
  end;
  with dmDatabase do
  begin
    tblAccount.Open;
    tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []);
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
    tblAccount.Post;
    tblTax.Open;
    tblTax.Locate('WAccountID', tblAccountWAccountID.Value, []);
    tblTax.Edit;
    tblTaxDStartDate.Value := dtFrom.Date;
    tblTaxDEndDate.Value := dtTo.Date;
    If tblTaxFRate.Value<>Str2Float(edtPercent.Text) then
    OSFMessageDlg(GetTextLang(667){You changed your rate ?}, mtinformation, [mbOk], 0);
    tblTaxFRate.Value := Str2Float(edtPercent.Text);
    if not CBUseTaxLink.Checked then
    begin
    dmDatabase.tblTaxWLINKTAXID.AsInteger := 0 ;
    dmDatabase.tblTaxBLINKCONTRA.AsInteger := 0 ;
    end else
    begin
     SetFieldWithIndexValue(dmDatabase.tblTaxWLINKTAXID,cbbLinkTaxId.Items,cbbLinkTaxId.ItemIndex) ;
     dmDatabase.tblTaxBLINKCONTRA.AsInteger := ord(CBContraTax.Checked) ;
    end;
    tblTax.Post;
  end;
  if edtMainAccount.Visible then
  begin
    enable(edtMainAccount);
    enable(edtSubAccount);
    edtMainAccount.text:='';
    edtSubAccount.text:='';
    edtDescription.Text:='';
    CbxRepGroup1.Text:='';
    CbxRepGroup2.Text:='';
    edtPercent.Text:='';
    edtMainAccount.SetFocus;
    FormActivate(Sender)
  end
  else
     Close;

end;

procedure TfmEditTaxAccount.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEditTaxAccount.edtMainAccountKeyPress(Sender: TObject;
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
      if OSFMessageDlg(GetTextLang(445){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
        btnOkClick(Sender)
      else
        btnCancelClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmEditTaxAccount.FormShow(Sender: TObject);
begin
  Caption := GetTextLang(254);//Header 254
  Label1.Caption := GetTextLang(176);//Account Number 176
  Label2.Caption := GetTextLang(177);//Sub account 177
  Label3.Caption := GetTextLang(178);//Description 178
  Label4.Caption := GetTextLang(179);//Rep group 1 179
  Label5.Caption := GetTextLang(180);//Rep group 2 180
  Label6.Caption := GetTextLang(207);//Valid from 207
  Label7.Caption := GetTextLang(208);//to 208
  Label8.Caption := GetTextLang(209);//Percentage 209

  Label11.Caption := GetTextLang(3035);// Use link tax
  Label10.Caption := GetTextLang(3036);// Link tax
  Label9.Caption := GetTextLang(3037);// Contra tax
  fcSubNew.Items[0].Text:= GetTextLang(34);{Account}
  fcSubNew.Items[1].Text := GetTextLang(177); {Sub-Account}
  btnOK.Caption := GetTextLang(167);//OK 167
  btnCancel.Caption := GetTextLang(168);//Cancel 168
  navBtns(fcNew,fcSearch,fcDelete,fcSave1);

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  CbxRepGroup1.Enabled:=FillStringsWithReportingGroups(CbxRepGroup1.Items,20);
  CbxRepGroup2.Enabled:=FillStringsWithReportingGroups(CbxRepGroup2.Items,21);
  edtMainAccount.SetFocus;
  dmDatabase.tblSysVars.Open;
  Label4.Caption := dmDatabase.tblSysVarsSACCOUNTReportName1.Value;
  Label5.Caption := dmDatabase.tblSysVarsSACCOUNTReportName2.Value;
  dmDatabase.tblSysVars.Close;
  // done : pieter Conversion goes wrong on other datetime setting 29222 = 01/01/1980
  edtMainAccount.MaxLength := MainAccountLength ;
  if dtFrom.Date<= 29222 then
  dtFrom.Date:=Date();
  if dtTo.Date<= 29222 then
  dtTo.Date:=Date()+ 6000;
  fcMenu.ActivePage:= fcSearch;  
end;
procedure TfmEditTaxAccount.EndFormActivate(Sender: TObject);
begin
  if (ReturnLookup <> 'NEW') and(ReturnLookup <> 'ESC') and (ReturnLookup <> '-') then
  begin
    edtMainAccount.Text := GetMainAccountCode(ReturnLookup );
    edtSubAccount.Text := GetSubAccountCode(ReturnLookup );
    Disable(edtMainAccount);
    Disable(edtSubAccount);
  end
  else
    edtMainAccount.Color := clWindow;
end;

procedure TfmEditTaxAccount.FormActivate(Sender: TObject);
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
  //fmLookup.SelectLookup(Sender, 'Accounts', 'NTAX', 'ACCOUNT', 1);
  CallLookup(edtMainAccount.Text, 11);
  end else
   EndFormActivate(self);
end;

procedure TfmEditTaxAccount.FormKeyDown(Sender: TObject; var Key: Word;
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

             HtmlShowTopic(127);

             key := 0;

        end;
end;

procedure TfmEditTaxAccount.edtPercentExit(Sender: TObject);
begin
   if Str2Float(edtPercent.Text)>100 then
     edtPercent.Text:='100';
   if Str2Float(edtPercent.Text)<0 then
     edtPercent.Text:='0';
end;

procedure TfmEditTaxAccount.CbxRepGroup1CloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  (Sender As TwwDBComboBox).Color:=ClWindow;
end;

procedure TfmEditTaxAccount.CbxRepGroup1DropDown(Sender: TObject);
begin
  (Sender As TwwDBComboBox).Color:=ClInfoBk;
end;

Procedure TfmEditTaxAccount.ClsScreen;
begin
    Enable(edtMainAccount);
    Enable(edtSubAccount);
    edtMainAccount.text:='';
    edtSubAccount.text:='';
    edtDescription.Text:='';
    CbxRepGroup1.Text:='';
    CbxRepGroup2.Text:='';
    dtFrom.date :=  Date;
    dtTo.date :=  Date;
    edtPercent.Text := '00.0';
    DescLabel.Caption :='';
end;

procedure TfmEditTaxAccount.btnDeleteClick(Sender: TObject);
begin
  dmDatabase.tblAccount.Open;
  if dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([edtMainAccount.Text + edtSubAccount.Text]), []) then
  begin
    if OSFMessageDlg(GetTextLang(460){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
      DeleteAccount(dmDatabase.tblAccountWAccountID.Value);
    fcMenu.ActivePage := fcSearch ;
    fcSearchClick(self);

    //edtMainAccount.setfocus;
    //FormActivate(Sender);
  end
  else
    OSFMessageDlg(GetTextLang(832){Account does not exit}, mterror, [mbok], 0);
 // gave a empty search box so removed.
 // dmDatabase.tblAccount.Close;
end;


procedure TfmEditTaxAccount.fcSubNewItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
      edtSubAccount.Enabled := False;
      ClsScreen;
      edtMainAccount.SetFocus;
end;

procedure TfmEditTaxAccount.fcSearchClick(Sender: TObject);
begin
      ClsScreen;
      edtMainAccount.SetFocus;
      FormActivate(Sender);
end;

procedure TfmEditTaxAccount.fcDeleteClick(Sender: TObject);
begin
      if trim(edtMainAccount.Text)='' then
        exit
      else
        btnDeleteClick(Sender);
end;

procedure TfmEditTaxAccount.fcSave1Click(Sender: TObject);
begin
      if trim(edtMainAccount.Text)='' then
        exit
      else
        btnOkClick(Sender);
end;

procedure TfmEditTaxAccount.fcSubNewItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  if (edtMainAccount.Enabled=False) AND (edtMainAccount.Text<>'') then
  begin
    edtSubAccount.Text:='';
    Enable(edtSubAccount);
    edtSubAccount.SetFocus;
  end;
end;

procedure TfmEditTaxAccount.FormCreate(Sender: TObject);
begin
   FmLookup.IsShowForm := true ;
end;

procedure TfmEditTaxAccount.FormDestroy(Sender: TObject);
begin
   FmLookup.IsShowForm := false ;
end;

procedure TfmEditTaxAccount.edtDescriptionEnter(Sender: TObject);
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

procedure TfmEditTaxAccount.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false ;
 edtDescription.SetFocus;
end;

procedure TfmEditTaxAccount.CBUseTaxLinkClick(Sender: TObject);
begin
 PLinkTaxes.Visible := CBUseTaxLink.Checked ;
end;

end.
