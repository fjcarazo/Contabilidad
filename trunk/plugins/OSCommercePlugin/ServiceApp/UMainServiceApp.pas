unit UMainServiceApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdSMTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdPOP3, ComCtrls, AppEvnts;

type
  TMainServiceApp = class(TForm)
    Bstart: TButton;
    BSetupOsfOSc: TButton;
    Timer1: TTimer;
    IdPOP31: TIdPOP3;
    IdSMTP1: TIdSMTP;
    pcmainsetup: TPageControl;
    tsdatabase: TTabSheet;
    tsemail: TTabSheet;
    tslog: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EUsername: TEdit;
    EPassword: TEdit;
    EDatabase: TEdit;
    EServer: TEdit;
    cbProtocol: TComboBox;
    EPort: TEdit;
    Label12: TLabel;
    ESendToEmail: TEdit;
    Label10: TLabel;
    ESMTPServer: TEdit;
    Label9: TLabel;
    EPopPassword: TEdit;
    Label8: TLabel;
    EPopUsername: TEdit;
    Label7: TLabel;
    EPopMailserver: TEdit;
    Label6: TLabel;
    MLog: TMemo;
    ETimeBetweenMails: TEdit;
    Label13: TLabel;
    Label11: TLabel;
    EtimerInterval: TEdit;
    ApplicationEvents1: TApplicationEvents;
    procedure BstartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BSetupOsfOScClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    LastSendMail : TDateTime;
    SendString : String ;
    procedure EmailError (Error:String );

    { Public declarations }
  end;

var
  MainServiceApp: TMainServiceApp;

implementation

uses ULinkService, UDmDummyDatabase, ZConnection,IdMessage, Math;

{$R *.dfm}

procedure TMainServiceApp.BstartClick(Sender: TObject);
begin
 if  Timer1.Tag = 1 then
   begin
    tslog.TabVisible := false ;
    tsdatabase.TabVisible := true ;
    tsemail.TabVisible := true ;

    Timer1.Enabled := false ;
    Timer1.Tag := 0 ;
    Bstart.Caption := 'start' ;
    dmDatabase.ZMainConnection.Disconnect ;
    BSetupOsfOSc.Visible := True ;
   end else
   begin
    tslog.TabVisible := true ;
    tsdatabase.TabVisible := false ;
    tsemail.TabVisible := false ;
    Timer1.Interval := StrToIntDef(EtimerInterval.text,300) * 1000;
    Bstart.Caption := 'stop' ;
    Timer1.Enabled := true ;
    Timer1.Tag := 1 ;
    BSetupOsfOSc.Visible := false ;
  end;
end;

procedure TMainServiceApp.FormCreate(Sender: TObject);
var
 AList : TStringlist ;
begin
pcmainsetup.ActivePageIndex := 0 ;
SendString := '' ;
 if FileExists(ChangeFileExt(Application.ExeName,'.ini')) then
 begin
  AList := TStringlist.Create ;
  try
        AList.LoadFromFile(ChangeFileExt(Application.ExeName,'.ini'));
        EUsername.Text := AList.Values['Username'];
        cbProtocol.itemindex := cbProtocol.Items.IndexOf(AList.Values['Protocol']);
        EPassword.Text := AList.Values['Password'];
        EServer.Text := AList.Values['Server'];
        EPort.Text := AList.Values['Port'];
        EDatabase.Text := AList.Values['Database'];
        EPopMailserver.Text  := AList.Values['PopMailserver'];
        EPopUsername.Text  := AList.Values['PopUsername'];
        EPopPassword.Text  := AList.Values['PopPassword'];
        ESMTPServer.Text  := AList.Values['SMTPServer'];
        ESendToEmail.Text  := AList.Values['SendToEmail'];
        ETimeBetweenMails.Text  := AList.Values['TimeBetweenMails'];
  finally
   AList.free ;
  end;
  end;
  if pos('START',uppercase(ParamStr(1))) <> 0 then
       BstartClick(self);
end;

procedure TMainServiceApp.FormDestroy(Sender: TObject);
var
 AList : TStringlist ;
begin
  AList := TStringlist.Create ;
  try
      AList.Values['Username'] := EUsername.Text ;
      AList.Values['Protocol'] := cbProtocol.Text ;
      AList.Values['Password'] := EPassword.Text ;
      AList.Values['Server']   := EServer.Text ;
      AList.Values['Port']     := EPort.Text ;
      AList.Values['Database'] := EDatabase.Text  ;

     AList.Values['PopMailserver']  :=   EPopMailserver.Text    ;
     AList.Values['PopUsername']    :=   EPopUsername.Text     ;
     AList.Values['PopPassword']    :=   EPopPassword.Text     ;
     AList.Values['SMTPServer']     :=   ESMTPServer.Text      ;
     AList.Values['SendToEmail']    :=   ESendToEmail.Text     ;
     AList.Values['TimeBetweenMails'] := ETimeBetweenMails.Text  ;
      AList.SaveToFile(ChangeFileExt(Application.ExeName,'.ini'));
  finally
   AList.free ;
  end;
end;


procedure TMainServiceApp.BSetupOsfOScClick(Sender: TObject);
begin
    with dmDatabase.ZMainConnection do
     Begin
        Disconnect ;
        User := EUsername.Text ;
        Protocol := cbProtocol.Text ;
        Password := EPassword.Text ;
        HostName := EServer.Text ;
        Port := StrToIntDef(EPort.Text,0) ;
        Database := EDatabase.Text ;
        Connect ;
     end;

   SetupOsfOsc ;
   dmDatabase.ZMainConnection.Disconnect ;
end;

procedure TMainServiceApp.Timer1Timer(Sender: TObject);
begin
timer1.Enabled := false;
try
if not dmDatabase.ZMainConnection.Connected then
 begin
    with dmDatabase.ZMainConnection do
     Begin
        User := EUsername.Text ;
        Protocol := cbProtocol.Text ;
        Password := EPassword.Text ;
        HostName := EServer.Text ;
        Port := StrToIntDef(EPort.Text,0) ;
        Database := EDatabase.Text ;
        Connect ;
     end;
  end;   
RunOsfOsc ;
except
   on e : Exception do
     begin
         EmailError(e.Message) ;
     end;
end;
if Timer1.Tag =1 then
  timer1.Enabled := true;

end;

procedure TMainServiceApp.EmailError(Error:String );
var
 i , x, BCCCount : Integer ;
 TimerInterval : Cardinal ;
 TempString : String ;
 Template : TStringList ;

 AMessage : TIDMessage ;

 AAttachment : TIdAttachment ;
 AText : TIdText ;
 Hour,Minute : Word ;
 Minutes : Integer ;
begin
Minutes := StrToIntDef(ETimeBetweenMails.Text,1);
hour := Minutes div 60 ;
Minute := Minutes mod 60 ;

if (LastSendMail + EncodeTime(hour,Minute,0,0)) >= (Now ) then
  begin
     MLog.Lines.Add('');
     MLog.Lines.Add('Not sending mail Time trigger:');
     MLog.Lines.Add('');
     MLog.Lines.Add(Error);

     SendString := SendString + #13+#10+'Errors at ' + DateTimeToStr(now) + #13+#10+ Error ;
     exit ;
  end ;
MLog.Lines.Add('');
MLog.Lines.Add('Sending mail time trigger:');
MLog.Lines.Add('');
MLog.Lines.Add(Error);

LastSendMail := now ;
// not with empty SMTP.
if ESMTPServer.Text = '' then exit ;

if EPopMailserver.Text <> '' then
   begin
    if trim(EPopPassword.Text) = '' then
     raise Exception.Create('No pop password enterd');
    IdPOP31.Host := EPopMailserver.Text ;
    IdPOP31.Username := EPopUsername.Text ;
    IdPOP31.Password := EPopPassword.Text ;
    IdSMTP1.UseEhlo := true ;
    IdSMTP1.HeloName := EPopUsername.Text ;
   end;

 IdSMTP1.Host  := ESMTPServer.Text ;
 Template := TStringList.Create ;
  try
  
  AMessage := TIDMessage.Create(self) ;
  try
  AMessage.From.Name := 'NoReplay@osfinancials.org' ;
  AMessage.From.Address := 'NoReplay@osfinancials.org' ;
  AMessage.Subject := 'Error in service ' +  Application.ExeName  ;
  AMessage.Recipients.Clear ;
  AMessage.Recipients.Add ;
  AMessage.Recipients[0].Address :=  ESendToEmail.text ;
  AMessage.Recipients[0].Name :=  ESendToEmail.text ;
  AMessage.BccList.Clear ;


  // add text here
 Template.Add('Error in running service with message:');
 Template.Add(Error);
 if SendString <> '' then
   begin
     Template.Add(SendString);
     SendString := '' ;
   end;
 AText := TIdText.Create(AMessage.MessageParts) ;
 AText.ContentType := 'text/plain';
 AText.Body.Text := Template.text;
 AMessage.ContentType := 'text/plain' ;

             try
              if EPopMailserver.Text <> '' then
                begin
                IdPOP31.Connect(2000);
                IdPOP31.RetrieveMailBoxSize ;
                IdPOP31.Disconnect();
                end;
              if IdSMTP1.Connected then
              IdSMTP1.Disconnect();
              try
              IdSMTP1.Connect();
              except
              end;
              IdSMTP1.Send(AMessage);
              IdSMTP1.Disconnect();

              AMessage.BccList.Clear ;
              except

              end;
     finally
       AMessage.free ;
     end;
  finally
     Template.free ;
  end;
end;
procedure TMainServiceApp.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
 EmailError(e.Message) ;
 ApplicationEvents1.CancelDispatch ;
end;

end.
