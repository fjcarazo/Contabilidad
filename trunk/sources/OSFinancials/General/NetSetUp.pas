(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit NetSetUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask,  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxMemo;

type
  TfmNetSetUp = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    lblUserMail: TLabel;
    LEmailAddress: TLabel;
    LOutgoingMail: TLabel;
    tcxShape: TShape;
    Shape1: TShape;
    LogMemo: TcxMemo;
    TestMailSvr: TBitBtn;
    LDefaultText: TLabel;
    Label10: TLabel;
    edtMailAddress: TcxDBMaskEdit;
    edtEmailServer: TcxTextEdit;
    edtUserID: TcxTextEdit;
    edtPass: TcxTextEdit;
    EDefaultText: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TestMailSvrClick(Sender: TObject);
    procedure TestSmptInvalidHost(var Handled: Boolean);
    procedure TestSmptConnect(Sender: TObject);
    procedure TestSmptSendStart(Sender: TObject);
    procedure TestSmptSuccess(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure TestSmptConnectionFailed(Sender: TObject);
    procedure TestSmptFailure(Sender: TObject);
    procedure TestSmptDisconnect(Sender: TObject);
    procedure TestSmptAuthenticationFailed(var Handled: Boolean);
    procedure TestSmptPacketSent(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure LogMemoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TestFTPsInvalidHost(var Handled: Boolean);
    procedure TestFTPsHostResolved(Sender: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure DisplayMessage(aMsg:String);
  end;

var
  fmNetSetUp: TfmNetSetUp;

implementation

uses Database, Main, GlobalFunctions, DatabaseAccess,
  TcVariables, DB, TcashClasses, UDMTCCoreLink, OSFGeneralRoutines;

{$R *.DFM}

procedure TfmNetSetUp.FormShow(Sender: TObject);
Var
  SAddr,SName,SServer,SPass:String;
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');

  dmDatabase.tblsysVars.open;
  dmDatabase.tblUser.open;
  dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);
  if CurrentUser=0 then begin
    dmDatabase.tblUser.Edit;
    dmDatabase.tblUserUserEmail.Value := dmDatabase.tblSysVarsSEmailAddress.value;
    dmDatabase.tblUser.Post;
//    edtUserID.ReadOnly:=False;
//    edtUserID.Color:=clWindow;
  end;
//  else begin
//    edtUserID.ReadOnly:=True;
//    edtUserID.Color:=clBtnFace;
//  end;

  ReadNetServerParams(SName,SAddr,SServer);
  edtUserID.Text := SName;
  edtEmailServer.Text := SServer;
 // ServerName.Text := NetServerName;
  // if they dont waht the passowrd to save jsut delete it.
  //But remeber theres a login at show of the email form.
  // Nasty swiths of params in this function beware
  GetSMTPSettings(SName,SServer,SAddr,SPass);
  edtUserID.Text := SName;
  edtEmailServer.Text := SServer;
  edtPass.Text := SPass;

  if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1' then
  EDefaultText.Text := ReadSysParam('EMAILDEFAULTTEXT','Turbocash Email Sender',CurrentUser ).AsString
  else
  EDefaultText.Text := ReadSysParam('EMAILDEFAULTTEXT','osFinancials Email Sender',CurrentUser ).AsString;

  Self.Caption := gettextlang(1940);
  Label6.Caption := gettextlang(1941);
  Label7.Caption := gettextlang(1942);
  lblUserMail.Caption := gettextlang(1943);
  //Label5.Caption := gettextlang(1944);
  //Label1.Caption := gettextlang(1945);
  //Label8.Caption := gettextlang(1946);
  //BitBtn1.Caption := gettextlang(1947);

  BtnOk.Caption := gettextlang(945);
  BtnCancel.Caption := gettextlang(828);
  LDefaultText.Caption := gettextlang(2969); // default text
  LEmailAddress.Caption := gettextlang(1254); // Email address
  LOutgoingMail.Caption := gettextlang(2968); // Outgoing email server
end;

procedure TfmNetSetUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { TODO : Replace with ICS }
  (*
  if TestSmpt.FConnected then
    TestSmpt.Disconnect;
  With dmDatabase do begin
    tblUser.Close;
    tblSysVars.Close;
  end;
  *)
end;

procedure TfmNetSetUp.TestMailSvrClick(Sender: TObject);
Begin
  BtnOkClick(Sender);
  LogMemo.Lines.Clear;
  DisplayMessage(format(gettextlang(1948),[edtUserID.Text,edtEmailServer.Text]));
  { TODO : Replace with ICS }
  TcEmail.Connection.Username := edtUserID.Text;
  TcEmail.Connection.Password := edtPass.Text;
  TcEmail.Connection.Host := edtEmailServer.Text;
  TcEmail.MailMessage.Body.Add(format(gettextlang(1951),[#13#10,DateToStr(Date)+'  '+TimeToStr(Time)]));
  if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1' then
  TcEmail.MailMessage.Subject := 'Turbocash Email Test'
  else
  TcEmail.MailMessage.Subject := 'osFinancials Email Test';
  TcEmail.MailMessage.From.Text := edtMailAddress.Text;
  TcEmail.MailMessage.Recipients.EMailAddresses := edtMailAddress.Text;
  DisplayMessage(gettextlang(1953));
  if Not TcEmail.Connect then
   DisplayMessage(gettextlang(1952))
  else
  begin
    TcEmail.SendEmail;
    TcEmail.Connection.Disconnect;
    DisplayMessage(gettextlang(1958));
  end;
end;

procedure TfmNetSetUp.TestSmptInvalidHost(var Handled: Boolean);
begin
  DisplayMessage(gettextlang(1952));
end;

procedure TfmNetSetUp.TestSmptConnect(Sender: TObject);
begin
  DisplayMessage(gettextlang(1953));
end;

procedure TfmNetSetUp.TestSmptSendStart(Sender: TObject);
begin
  DisplayMessage(gettextlang(1954));
end;

procedure TfmNetSetUp.TestSmptSuccess(Sender: TObject);
begin
  DisplayMessage(gettextlang(1955));
end;

procedure TfmNetSetUp.BtnCancelClick(Sender: TObject);
begin
  Close;
  BtnOkClick(self);
end;

procedure TfmNetSetUp.BtnOkClick(Sender: TObject);
begin
  dmDatabase.TblSysVars.Edit;
  dmDatabase.TblSysVars.Post;
  dmDatabase.tblUser.Edit;
  dmDatabase.tblUser.Post;
 // NetServerName:=ServerName.Text;
  dmDatabase.tblSysParams.Open;   
  WriteSysParam('EMAILDEFAULTTEXT',EDefaultText.Text,CurrentUser );
  WriteNetServerParams;
  SetSMTPSettings(edtUserID.Text,edtEmailServer.Text,edtMailAddress.Text,edtPass.Text);
  dmDatabase.tblSysParams.Close;
end;

procedure TfmNetSetUp.TestSmptConnectionFailed(Sender: TObject);
begin
  DisplayMessage(gettextlang(1956));
end;

procedure TfmNetSetUp.TestSmptFailure(Sender: TObject);
begin
  DisplayMessage(gettextlang(1957));

end;

procedure TfmNetSetUp.TestSmptDisconnect(Sender: TObject);
begin
  DisplayMessage(gettextlang(1958));
end;

procedure TfmNetSetUp.TestSmptAuthenticationFailed(var Handled: Boolean);
begin
  DisplayMessage(gettextlang(1959));


end;

procedure TfmNetSetUp.TestSmptPacketSent(Sender: TObject);
begin
   { TODO : Replace with ICS }
   (*
  DisplayMessage(format(gettextlang(1960),[IntToStr(TestSmpt.BytesSent),IntToStr(TestSmpt.BytesTotal)]));
   *)
end;

procedure TfmNetSetUp.SpeedButton2Click(Sender: TObject);
begin
//  if SpeedButton2.Down then
//    LogMemo.visible:=True
//  else
//    LogMemo.visible:=False;
end;

procedure TfmNetSetUp.LogMemoEnter(Sender: TObject);
begin
  Panel1.setfocus;
end;

procedure TfmNetSetUp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(214);
             key := 0;

        end;
end;

procedure TfmNetSetUp.TestFTPsInvalidHost(var Handled: Boolean);
begin
  LogMemo.Lines.Add(gettextlang(1962));
end;

procedure TfmNetSetUp.TestFTPsHostResolved(Sender: TComponent);
begin
  LogMemo.Lines.Add(gettextlang(1963));
end;

Procedure TfmNetSetUp.DisplayMessage(aMsg:String);
begin
  LogMemo.Lines.Add(aMsg);
end;

end.
