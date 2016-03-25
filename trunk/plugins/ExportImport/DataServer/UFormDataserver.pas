unit UFormDataserver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdThreadMgr, IdThreadMgrDefault, IdBaseComponent,
  IdComponent, IdTCPServer, IdCustomHTTPServer, IdHTTPServer, Buttons,
  ComCtrls;

type
  TFormDataserver = class(TForm)
    BActivate: TBitBtn;
    IdHTTPServer1: TIdHTTPServer;
    IdThreadMgrDefault1: TIdThreadMgrDefault;
    EServerPort: TEdit;
    Database: TGroupBox;
    EUsername: TEdit;
    EPassword: TEdit;
    EDatabase: TEdit;
    EServer: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbProtocol: TComboBox;
    Label5: TLabel;
    EPort: TEdit;
    Label6: TLabel;
    Button1: TButton;
    procedure IdHTTPServer1Connect(AThread: TIdPeerThread);
    procedure IdHTTPServer1Disconnect(AThread: TIdPeerThread);
    procedure BActivateClick(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AThread: TIdPeerThread;
      ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDataserver: TFormDataserver;

implementation

uses UDMDataserver, ZConnection,shellapi, ComObj,ActiveX;

{$R *.dfm}

procedure TFormDataserver.IdHTTPServer1Connect(AThread: TIdPeerThread);
begin
    AThread.Data := TDMDataserver.Create(nil);
    with TDMDataserver(AThread.Data).ZConnection1 do
     Begin
        User := EUsername.Text ;
        Protocol := cbProtocol.Text ;
        Password := EPassword.Text ;
        HostName := EServer.Text ;
        Port := StrToIntDef(EPort.Text,0) ;
        Database := EDatabase.Text ;
     end;
end;

procedure TFormDataserver.IdHTTPServer1Disconnect(AThread: TIdPeerThread);
begin
   AThread.Data.free ;
   AThread.Data := nil ;
end;

procedure TFormDataserver.BActivateClick(Sender: TObject);
begin
if not IdHTTPServer1.Active then
  begin
    IdHTTPServer1.DefaultPort := StrToIntDef(EServerPort.Text,88);
    EServerPort.Text := IntToStr(IdHTTPServer1.DefaultPort);
  end;
IdHTTPServer1.Active := not IdHTTPServer1.Active ;
if IdHTTPServer1.Active then
 BActivate.Caption := 'Stop' else
 BActivate.Caption := 'Activate' ;
end;

procedure TFormDataserver.IdHTTPServer1CommandGet(AThread: TIdPeerThread;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
Var
 AList : TStringlist ;
begin
 AList := TStringlist.create ;
  try
     if ARequestInfo.FormParams <> '' then
      AList.Text := ARequestInfo.FormParams else
      AList.Text :=  ARequestInfo.QueryParams ;
      if AList.Count <> 0 then
        begin
          AResponseInfo.ContentText:= TDMDataserver(AThread.Data).RunSql(AList.Values['sql']);
        end else
        AResponseInfo.ContentText := 'No SQL' ;

  finally
   AList.free ;
  end;

end;

procedure TFormDataserver.FormCreate(Sender: TObject);
var
 AList : TStringlist ;
begin
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
        EServerPort.Text := AList.Values['Serverport'];
  finally
   AList.free ;
  end;
  end;
   
end;

procedure TFormDataserver.FormDestroy(Sender: TObject);
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
      AList.Values['Serverport'] := EServerPort.Text  ;

      AList.SaveToFile(ChangeFileExt(Application.ExeName,'.ini'));
  finally
   AList.free ;
  end;
end;

procedure TFormDataserver.Button1Click(Sender: TObject);
var
 AString : AnsiString ;
begin
  AString  :=  'http://127.0.0.1:'+ EServerPort.Text ;
    ShellExecute(self.Handle,'OPEN',pAnsiChar(AString),'','',1);
end;

end.
