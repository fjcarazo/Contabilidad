(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SendEmailReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons,ExtCtrls, CheckLst, ComCtrls, Menus,
  TcVariables,IdEMailAddress, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxListView;

type
  TfmSendEmailReport = class(TForm)
    ButtonPanel: TPanel;
    lblMessage: TLabel;
    Label2: TLabel;
    edtCcAddress: TEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    edtMailSubject: TEdit;
    Notebook: TNotebook;
    cbList: TcxListView;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    AddtoSendList1: TMenuItem;
    ClearSendtoList1: TMenuItem;
    PnlSingleMail: TPanel;
    LeftSingleMailPnl: TPanel;
    Label5: TLabel;
    Splitter1: TSplitter;
    RigthSingleMailPnl: TPanel;
    lvAddresses: TcxListView;
    Label6: TLabel;
    SelectAll1: TMenuItem;
    SendListBox: TListBox;
    N1: TMenuItem;
    UnsentLbl: TLabel;
    Replaceemail1: TMenuItem;
    pnlMessage: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    spbMessage: TSpeedButton;
    Bevel1: TBevel;
    BackMessage: TMemo;
    edtBckTo: TEdit;
    LedtBckTo: TLabel;
    Label7: TLabel;
    edtPass: TEdit;
    procedure FormShow(Sender: TObject);
    Function  CallEmail:Boolean;
    procedure ReportMailConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReportMailSuccess(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure AddtoSendList1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure ClearSendtoList1Click(Sender: TObject);
    procedure lvAddressesDblClick(Sender: TObject);
    procedure Replaceemail1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ReportMailSendStart(Sender: TObject);
    procedure ReportMailPacketSent(Sender: TObject);
    procedure ReportMailFailure(Sender: TObject);
    procedure spbMessageClick(Sender: TObject);
    procedure cbListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbListDblClick(Sender: TObject);
    {$IFDEF COMPILER12_UP}
    procedure IdSMTP1Work(Sender: TObject; AWorkMode: TWorkMode;
        AWorkCount: Int64);
    procedure IdSMTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
        AWorkCountMax: Int64);
    procedure IdSMTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);

    {$ELSE}
    procedure IdSMTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdSMTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdSMTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
      {$ENDIF COMPILER12_UP}
  private
    NbrSent,NbrFailed:LongInt;
    PubliMail:Boolean;
    FaxFiles : TStringList;
    Procedure LoadAdresses;
    Procedure AlocateAdresses;
    Function GetFileName(fs:String):String;

  public
    UseFaxMail : Boolean;
    userEmail : String ;
    Function GetContactEmail(_ContactID:Integer):String;
    Function SmtpConnect:Boolean;

  end;

var
  fmSendEmailReport: TfmSendEmailReport;

implementation

uses Database,Main, GlobalFunctions, LanguageChoice, DatabaseAccess,
  XRoutines,shellapi, TcashClasses, UDMTCCoreLink;

{$R *.DFM}

Var
  XMax:Integer;

Function GetSigName:String;
Var
  F:TSearchRec;
Begin
  if FindFirst(ApplicationPath+'*.csf',faAnyFile ,F)=0 then
  begin
    repeat
      if Pos('@',F.Name)<>0 then
      begin
        Result:=F.Name;
        Break;
      end;
    until FindNext(F)<>0;
     // done : pieter Findclose to perserve resource
     FindClose(f);    
  end
  else
    Result:='';
end;


Function TfmSendEmailReport.GetFileName(fs:String):String;
begin
  Result :=fs;
  if Not FileExists(fs) then
  begin
    fs := ChangeFileExt(fs,'.pdf');
    if FileExists(fs) then
      Result := fs;
  end;
end;

Function TfmSendEmailReport.GetContactEmail(_ContactID:Integer):String;
begin
  Result:='';
  dmDatabase.QContacts.SQL.Text := 'Select * from contacts where RecordID =:ID';
  dmDatabase.QContacts.params[0].AsInteger := _ContactID ;
  dmDatabase.QContacts.Open;
  if not dmDatabase.QContacts.IsEmpty then
  begin
   if UseFaxMail then
       Result := ValideFaxNbr(dmDatabase.QContactsPhone2.Value)
    else
       Result:=ValidateEmail(dmDatabase.QContactsEMail.Value);
  end;
  dmDatabase.QContacts.Close;
end;

Function  TfmSendEmailReport.CallEmail:Boolean;
begin
  CallEmail:=True;
  fmSendEmailReport.ShowModal;
end;

procedure TfmSendEmailReport.FormShow(Sender: TObject);

begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  Update;
  TcEmail.Connection.OnConnected :=  ReportMailConnect;
  TcEmail.Connection.OnWork :=  IdSMTP1Work;
  TcEmail.Connection.OnWorkBegin :=  IdSMTP1WorkBegin;
  TcEmail.Connection.OnWorkEnd :=  IdSMTP1Workend;

  spbMessage.Visible:=Not UseFaxMail;
  lblMessage.Caption := '';
  if EmailBackup then exit;
  if UseFaxMail then
  begin
    edtMailSubject.Text := 'osFinancials i.efax Sender';
    Label3.Caption := 'Public-Fax List';
    cbList.Columns[1].Caption := 'Fax number';
  end
  else
  begin
    Label3.Caption := 'Publi-Fax List';
    cbList.Columns[1].Caption := 'E-mail Address';
    edtCcAddress.Text := dmDatabase.SetOfBooksPropertys.CompanyInfo.EMailAddress ;
  end;

  lblMessage.Caption:='';
  UnsentLbl.Caption:='';

  SmtpConnect;

  if EmailList.Count>0 then
  begin
    AlocateAdresses;
    PubliMail:=True;
    Notebook.PageIndex:=0;
  end
  else
  begin
  // Load Creditors and Debtors addresses
    PubliMail:=False;
    LoadAdresses;
    Notebook.PageIndex:=1;
  end;


end;

procedure TfmSendEmailReport.ReportMailConnect(Sender: TObject);
begin
  lblMessage.Caption:=TcEmail.Connection.Host+'  ' + GetTextLang(1953);

end;

procedure TfmSendEmailReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 i:Integer;
begin
  TcEmail.Connection.Disconnect;
  TcEmail.Clear;
  TcEmail.Connection.OnConnected := nil;
  TcEmail.Connection.OnWork :=  nil;
  TcEmail.Connection.OnWorkBegin :=  Nil;
  TcEmail.Connection.OnWorkEnd :=  nil;
  DeleteAllFiles(TDMTCCoreLink.GetLocalBaseDir+'\tmp');
  i:=1;
  While FileExists(TDMTCCoreLink.GetLocalBaseDir+'Report'+IntToStr(i)+'.Doc') do begin
    Deletefile(TDMTCCoreLink.GetLocalBaseDir+'Report'+IntToStr(i)+'.Doc');
    inc(i);
  end;
  i:=1;
  While FileExists(TDMTCCoreLink.GetLocalBaseDir+'Report'+IntToStr(i)+'.pdf') do begin
    Deletefile(TDMTCCoreLink.GetLocalBaseDir+'Report'+IntToStr(i)+'.pdf');
    inc(i);
  end;
  EmailList.Clear;
  EmailBackup:=False;
end;

procedure TfmSendEmailReport.ReportMailSuccess(Sender: TObject);
begin
  lblMessage.Caption:='Sent Successfully';
  SetProgress(-1);
end;

procedure TfmSendEmailReport.BtnOkClick(Sender: TObject);
Var
  i,j:LongInt;
  S,FaxSigFile:String;
  tmpItem:TIdEMailAddressItem;
  Function AddFaxes:Boolean;
  Var i:integer;
  begin
    Result := True;
    if FaxSigFile='' then
    begin
      Result:=False;
      OSFMessageDlg(GetTextLang(833)+#13#10+ApplicationPath{Invalid Signature file}, mtError, [mbok], 0);
      Inc(NbrFailed);
      exit;
    end;
    (*
    FaxFiles.LoadFromFile(ApplicationPath+'tmp\Report'+ IntToStr(RepNbr)+'.Fax');
    ReportMail.PostMessage.Attachments.Clear;
    // i.efax Signature
     ReportMail.PostMessage.Attachments.add(ApplicationPath+FaxSigFile);
    For i:=0 to FaxFiles.Count-1 do
    begin
     FaxFiles[i]:=UpperCase(FaxFiles[i]);
     J:=Pos(ApplicationPath+'TMP\',FaxFiles[i]);
     if J<>0 then
       ReportMail.PostMessage.Attachments.Add(Copy(FaxFiles[i],j,300));
    end
    *)
  end;
begin
  Memo1.Text := BackMessage.Text ;
  Try
    NbrSent:=0;
    NbrFailed:=0;
    lblMessage.Caption:='';
    UnsentLbl.Caption:='';
    FaxSigFile := GetSigName;

    if PubliMail And (cbList.Items.Count>0) then
    begin
      for i:=0 to cbList.Items.Count-1 do
      begin
        TcEmail.Clear;
        TcEmail.MailMessage.From.Name :=  dmDatabase.SetOfBooksPropertys.CompanyInfo.CompanyName ;
        if CurrentUser = 0 then
        TcEmail.MailMessage.From.Address := dmDatabase.SetOfBooksPropertys.CompanyInfo.EMailAddress
        else
        TcEmail.MailMessage.From.Address := userEmail ;

        TcEmail.MailMessage.Body.Clear;;
        TcEmail.MailMessage.CCList.Clear;
        TcEmail.MailMessage.Recipients.Clear;
        // Add Subject
        if Trim(edtMailSubject.Text)='' then
          s := 'osFinancials Email Sender'
        else
          s := edtMailSubject.Text ;
        // Add CC Address
        TcEmail.MailMessage.Subject := s;
        if (cbList.Items[i].SubItems[0] = '') then
        begin
          if Trim(edtCcAddress.Text)<>'' then
          begin
            TcEmail.MailMessage.CCList.EMailAddresses:='';
            TcEmail.MailMessage.Recipients.EMailAddresses := edtCcAddress.Text;
            TcEmail.MailMessage.Body.Add(BackMessage.Text+#13#10+#13#10+ ReadSysParam('EMAILDEFAULTTEXT','osFinancials Email Sender',CurrentUser ).AsString + ' '+DateToStr(Date)+'  '+TimeToStr(Time));
          end
          else
          begin
            Inc(NbrFailed);
            Continue;
          end;
        end
        else
        begin
          TcEmail.MailMessage.CCList.EMailAddresses := edtCcAddress.Text;
          TcEmail.MailMessage.Recipients.EMailAddresses := cbList.Items[i].SubItems[0];
          TcEmail.MailMessage.Body.Add(BackMessage.Text+#13#10+#13#10+ ReadSysParam('EMAILDEFAULTTEXT','osFinancials Email Sender',CurrentUser ).AsString + ' '+DateToStr(Date)+'  '+TimeToStr(Time));
          TcEmail.MailMessage.Body.Add('Free osfinancials emailer http://www.osfinancials.org');
        end;
        if TcEmail.MailMessage.Recipients.EMailAddresses<>'' then
        begin

          if FileExists(GetFileName(DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ IntToStr(i+RepNbr)+'.doc')) then
              TcEmail.AddAttachement(GetFileName(DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ IntToStr(i+RepNbr)+'.doc'),'Document');



          TcEmail.SendEMail;
        end;
      end;  
    end
    else
    begin
      if (PubliMail And (Trim(edtCcAddress.Text)<>'')) or
         (Not PubliMail And ((SendListBox.Items.Count=0) AND (Trim(edtCcAddress.Text)<>'')))  then
      begin
        SendListBox.Items.text :=  SendListBox.Items.text + StringReplace(edtCcAddress.Text,';',#13,[rfReplaceAll]);
        edtCcAddress.Text:='';
      end;
      if SendListBox.Items.Count>0 then
      begin // Send one mail to all List

        TcEmail.MailMessage.Body.Clear;;
        TcEmail.MailMessage.CCList.Clear;
        TcEmail.MailMessage.Recipients.Clear;

       (* ReportMail.PostMessage.Attachments.Clear; *)

        // Add Cc address
        if Trim(edtCcAddress.Text)<>'' then
          TcEmail.MailMessage.CCList.EMailAddresses:= StringReplace(edtCcAddress.Text,';',#13,[rfReplaceAll]);
        // Add Subject
        if Trim(edtMailSubject.Text)='' then
          TcEmail.MailMessage.Subject := 'osFinancials Email Sender'
        else
          TcEmail.MailMessage.Subject := edtMailSubject.Text ;
        // Add Send to List
      //  ?? this is done only once
        for j:=0 to 0 do
        begin
          if UseFaxMail then
          begin
            for i:=0 to SendListBox.Items.Count-1 do
            begin
             tmpItem := TcEmail.MailMessage.Recipients.Add;
             tmpItem.Address := '"'+SendListBox.Items[i]+'" <efax@iefaxing.com>';
            end;
            if Not AddFaxes then Break;
          end
          else
          begin
            for i:=0 to SendListBox.Items.Count-1 do
            begin
             tmpItem := TcEmail.MailMessage.Recipients.Add;
              tmpItem.Address := SendListBox.Items[i];
            end;
            if EmailType in [50..150] then
            begin
             (* ReportMail.SubType:=mtHTML; *)
              TcEmail.MailMessage.Body.Add(EmailFile);
            end
            else
            begin
             
              TcEmail.AddAttachement(GetFileName(DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ IntToStr(RepNbr)+'.Doc'),'Document');
              TcEmail.MailMessage.Body.Add(Memo1.Text+#13#10+#13#10+ ReadSysParam('EMAILDEFAULTTEXT','osFinancials Email Sender',CurrentUser ).AsString + ' '+DateToStr(Date)+'  '+TimeToStr(Time));
            end;
          end;
          TcEmail.SendEMail;
        end;
      end;
    end;
    if NbrFailed>0 then
      UnsentLbl.Caption:='Failed :'+IntToStr(NbrFailed)+ ' '+gettextlang(3005){of}+' '+IntToStr(cbList.Items.Count);
  finally
    //ReportMail.Disconnect;
  end;
end;

procedure TfmSendEmailReport.BtnCancelClick(Sender: TObject);
begin
  CLose;
end;

Procedure TfmSendEmailReport.LoadAdresses;
Var
 Email:String;
 ListItem:TListItem;
begin
  with dmDatabase do begin
    if UseFaxMail then
      lvAddresses.Columns[0].Caption := gettextlang(189)
    else
      lvAddresses.Columns[0].Caption :=  gettextlang(1254);
    lvAddresses.Items.Clear;
    tblDebtor.Open;
    tblAccount.Filtered:=False;
    tblAccount.Filter:='';
    tblAccount.Open;
    tblDebtor.Filtered:=false;
    tblDebtor.First;
    while not tblDebtor.eof do begin
      if UseFaxMail then
       Email := ValideFaxNbr(tblDebtorSFax.Value)
      else
        Email := ValidateEmail(tblDebtorSEmail.Value);
      if (Email<>'') then
      with lvAddresses do
      begin
        tblAccount.Locate('WAccountID',tblDebtorWaccountID.Value,[]);
        ListItem := Items.Add;
        ListItem.Caption:=EMail;
        listItem.subitems.add(tblAccountSDescription.Value);
        ListItem.subitems.add(IntToStr(RepNbr));
      end;
      tblDebtor.Next;
    end;
    tblDebtor.Close;
    // Load Creditors e-mail
    tblCreditor.Open;
    while not tblCreditor.eof do begin
      if UseFaxMail then
        Email := ValideFaxNbr(tblCreditorSFax.Value)
      else
        Email:=ValidateEmail(tblCreditorSEmail.Value);
      if (Email<>'') then
      with lvAddresses do
      begin
        tblAccount.Locate('WAccountID',tblCreditorWaccountID.Value,[]);
        ListItem := Items.Add;
        ListItem.Caption:=EMail;
        listItem.subitems.add(tblAccountSDescription.Value);
        ListItem.subitems.add(IntToStr(RepNbr));
      end;
      tblCreditor.Next;
    end;
    tblCreditor.Close;
    tblAccount.Close;
    // Load Contact e-mail
    // todo handel this
    (*
    tblContact.open;
    while not tblContact.eof do begin
      if UseFaxMail then
         Email := ValideFaxNbr(tblContactSFax.Value)
      else
        Email:=ValidateEmail(tblContactSEmail.Value);
      if (Email<>'') then
      with lvAddresses do
      begin
        ListItem := Items.Add;
        ListItem.Caption:=EMail;
        listItem.subitems.add(tblContactSContactName.Value);
        ListItem.subitems.add(IntToStr(RepNbr));
      end;
      tblContact.Next;
    end;
    tblContact.Close;   *)
  end;
end;

Procedure TfmSendEmailReport.AlocateAdresses;
Var
 i:integer;
 ContID,
 Email:String;
 ListItem:TListItem;
 Temp:TstringList;
begin
  with dmDatabase do
  begin
    cbList.Items.Clear;
    tblDebtor.Open;
    tblCreditor.Open;
    tblAccount.Filtered:=False;
    tblAccount.Filter:='';
    tblAccount.Open;
  //  tblContact.Open;
    tblCreditor.Filtered:=false;
    tblCreditor.First;
    tblDebtor.Filtered:=false;
    tblDebtor.First;
    Temp:=TStringList.Create;
    try
    for i:=0 to EmailList.count-1 do
    begin
      Temp.CommaText:=EmailList[i];
      ContID:='';
      // Temp Structure: DocTypeID, DocID, DocNo , AccountID , Report File No
      if Str2Int(temp[0]) in [1,10,11,14,17] then
      begin // Get Email in debtor table
        if tblDebtor.Locate('WAccountID',temp[3],[]) then
          if UseFaxMail then
            Email := ValideFaxNbr(tblDebtorSFax.Value)
          else
            Email:=ValidateEmail(tblDebtorSEmail.Value);
          if (tblDebtorWContactID.AsString<>'') then
      end
      else
      begin // Get Email in Creditor table
        if tblCreditor.Locate('WAccountID',temp[3],[]) then
          if UseFaxMail then
            Email := ValideFaxNbr(tblCreditorSFax.Value)
          else
            Email:=ValidateEmail(tblCreditorSEmail.Value);
          if (tblCreditorWContactID.AsString<>'') then
      end;
      tblAccount.Locate('WAccountID',temp[3],[]);
        with cbList do
        begin
          ListItem := Items.Add;
          ListItem.Caption:=Temp[2];
          listItem.subitems.add(Email);
          listItem.subitems.add(tblAccountSDescription.Value);
          ListItem.subitems.add(temp[4]);
          ListItem.subitems.add(ContID); //WaccountID
        end;
    end;
    finally
      Temp.free;
    end;
    tblDebtor.Close;
    tblCreditor.Close;
    tblAccount.Close;
    //tblContact.Close;
  end;

end;


procedure TfmSendEmailReport.AddtoSendList1Click(Sender: TObject);
Var
  i:integer;
  myItem:TListItem;
begin
  if lvAddresses.Selcount>0 then
  begin
    if SendListBox.Items.IndexOf(lvAddresses.Selected.Caption)<0 then
     SendListBox.Items.Add(lvAddresses.Selected.Caption);
    if lvAddresses.Selcount>1 then
      for i:=1 to lvAddresses.Selcount-1 do
      begin
        MyItem := lvAddresses.GetNextItem(lvAddresses.Selected,sdAll,[isSelected]);
        if SendListBox.Items.IndexOf(MyItem.Caption)<0 then
          SendListBox.Items.Add(MyItem.Caption);
      end;
  end;
end;

procedure TfmSendEmailReport.SelectAll1Click(Sender: TObject);
var
  i:integer;
begin
  For i:=0 to lvAddresses.Items.Count-1 do
  begin
    lvAddresses.Items[i].Selected:=True;
  end;
end;


procedure TfmSendEmailReport.ClearSendtoList1Click(Sender: TObject);
begin
  SendListBox.Items.Clear;
  cbList.Items.Clear ;
end;

procedure TfmSendEmailReport.lvAddressesDblClick(Sender: TObject);
begin
  AddtoSendList1Click(Sender);
end;

procedure TfmSendEmailReport.Replaceemail1Click(Sender: TObject);
Var
  i:integer;
  Email:String;
  MyItem:TListItem;
begin
  if cbList.Selcount>0 then
  begin
    EMail:=GetContactEmail(Str2Int(cbList.Selected.subitems[3]));
    if Email<>'' then
      cbList.Selected.subitems[0]:=Email;
    if lvAddresses.Selcount>1 then
      for i:=1 to cbList.Selcount-1 do
      begin
        MyItem:=cbList.GetNextItem(lvAddresses.Selected,sdAll,[isSelected]);
        EMail:=GetContactEmail(Str2Int(MyItem.subitems[3]));
//        MyItem := lvAddresses.GetNextItem(MyItem,sdAll,[isSelected]);
      if Email<>'' then
        MyItem.subitems[0]:=Email;
      end;
  end;
end;

procedure TfmSendEmailReport.FormCreate(Sender: TObject);
begin
  FaxFiles := TStringList.Create;
  edtMailSubject.Text := ReadSysParam('edtMailSubject','Your document',CurrentUser ).AsString ;
 // BackMessage.Text := ReadLongSysParam('EmailBackMessage',currentUser);
end;

procedure TfmSendEmailReport.FormDestroy(Sender: TObject);
begin
  FaxFiles.free;
  WriteSysParam('edtMailSubject', edtMailSubject.Text,CurrentUser );
 // WriteLongSysParam('EmailBackMessage',BackMessage.Text,CurrentUser);
end;


procedure TfmSendEmailReport.ReportMailSendStart(Sender: TObject);
begin
  lblMessage.Caption := 'Sending ...';
  (*
  SetProgress(ReportMail.BytesTotal);
  *)
end;

Function TfmSendEmailReport.SmtpConnect:Boolean;
Var
  srAddr,usName,maddr,SPAssW:String;
begin
  with dmdatabase do begin
    tblsysVars.open;
    tblUser.open;
    tblUser.Locate('WUserID', CurrentUser, []);
    GetSMTPSettings(usName,srAddr,maddr,SPAssW);
    {
    if (tblsysVarsWEmailServerAddress.AsString='') or
       (tblsysVarsWEmailServerAddress.isNull) or
       (tblUserSUserName.AsString='') or
       (tblUserSUserName.isNull)  then begin
     }
    // theres no need for username if your isp have open relay SMTP for your ip like mine
   if (srAddr='') then begin
     OSFMessageDlg(GetTextLang(724){'Internet Setup informations incorrect. Run Internet Setup'}, mtinformation, [mbok], 0);
     exit;
     Close;
    end ;
    userEmail := tblUserUserEmail.Value ;

    if (tblUserUserEmail.Value='') and (tblsysVarsSEmailAddress.Value='') then begin
     OSFMessageDlg(GetTextLang(724){'Internet Setup informations incorrect. Run Internet Setup'}, mtinformation, [mbok], 0);
      exit;
    end;
    TcEmail.Connection.Host := srAddr;
    TcEmail.Connection.Username := UsName;
    if edtPass.Text <> '' then
    TcEmail.Connection.Password := edtPass.Text
     else
    TcEmail.Connection.Password := SPassW ;

    TcEmail.MailMessage.From.Address := maddr;
    if tblUserUserEmail.Value<>'' then
      TcEmail.MailMessage.From.Address :=tblUserUserEmail.Value;
    // Get name
    TcEmail.MailMessage.From.Name := usName;
    tblsysVars.Close;
    tblUser.Close;
  end;
  fmSendEmailReport.Repaint;
  Result := TcEmail.Connect;
end;


procedure TfmSendEmailReport.ReportMailPacketSent(Sender: TObject);
begin
(*
  if ReportMail.BytesSent<ReportMail.BytesTotal then
    SetProgress('Sending email ...',ReportMail.BytesSent)
  else
    SetProgress(-1);
*)    
end;

procedure TfmSendEmailReport.ReportMailFailure(Sender: TObject);
begin
   SetProgress(-1);
   (*
   lblMessage.Caption := ReportMail.Status ;
   *)
end;

procedure TfmSendEmailReport.spbMessageClick(Sender: TObject);
begin
 if Notebook.PageIndex = 2 then
  begin
    if EmailList.Count>0 then
    begin
      Notebook.PageIndex:=0;
      Memo1.Text := BackMessage.Text ;

    end
    else
    begin
      Notebook.PageIndex:=1;
      Memo1.Text := BackMessage.Text ;
    end;
   end else
   begin
      Notebook.PageIndex := 2 ;
      edtBckTo.Visible := false ;
      ledtBckTo.Visible := false ;
   end;
end;

procedure TfmSendEmailReport.cbListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_delete then
   begin
      if cblist.Selected <> nil then
         cbList.DeleteSelected ; 

   end;
end;

procedure TfmSendEmailReport.cbListDblClick(Sender: TObject);
Var
 AExecLine : String ;
begin
 if cbList.Selected = nil then exit ;
 AExecLine := GetFileName(DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+ cbList.Selected.SubItems[2]+'.Doc') ;
 ShellExecute(Handle, 'open',pchar(AExecLine), nil, nil, SW_SHOW);

end;

procedure TfmSendEmailReport.IdSMTP1Work(Sender: TObject;
  AWorkMode: TWorkMode;  {$IFDEF COMPILER12_UP}   AWorkCount: Int64 {$ELSE} const AWorkCount:  Integer   {$ENDIF COMPILER12_UP});
begin
  lblMessage.Caption := 'Sending ... '+IntToStr(AWorkCount);
  lblMessage.Repaint;
//  XMax := AWorkCountMax;
end;

procedure TfmSendEmailReport.IdSMTP1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode;  {$IFDEF COMPILER12_UP}   AWorkCountMax:Int64    {$ELSE} const AWorkCountMax: Integer {$ENDIF COMPILER12_UP} );
begin
  XMax := AWorkCountMax;
end;

procedure TfmSendEmailReport.IdSMTP1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
  lblMessage.Caption:='Sent Successfully';
  SetProgress(-1);
end;

end.
