(*
  Id: ULoginMySql.pas,v 1 2004/09/20 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
unit ULoginMySql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type

  TLoginMySql = class(TForm)
    Label1: TLabel;
    EServername: TEdit;
    Label3: TLabel;
    EUsername: TEdit;
    Label4: TLabel;
    EPassword: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBRememberPassword: TCheckBox;
    EDateFormat: TEdit;
    EDateTimeFormat: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    CBConfigs: TComboBox;
    BSaveConfig: TButton;
    EPrefix: TEdit;
    Label6: TLabel;
    BDeleteConfig: TButton;
    BSave: TButton;
    CBTaxType: TComboBox;
    Label7: TLabel;
    Esqlfolder: TEdit;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EDateFormatDblClick(Sender: TObject);
    procedure EDateTimeFormatDblClick(Sender: TObject);
    procedure BSaveConfigClick(Sender: TObject);
    procedure CBConfigsChange(Sender: TObject);
    procedure BDeleteConfigClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure osCsettingsToGui ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;



implementation

uses UDMOSCommerceImport, UDMTCCoreLink;

{$R *.dfm}

procedure TLoginMySql.BitBtn1Click(Sender: TObject);
begin
BSaveClick(self);
ModalResult := mrok ; 
end;

procedure TLoginMySql.FormShow(Sender: TObject);
var
 AList : TStringlist ;
 
 i : Integer ;
begin
 CBConfigs.clear ;
 if FileExists(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini') then
   begin
     AList := TStringlist.create ;
      try
        CBConfigs.AddItem('Default',TObject(0));
         i := 1 ;
         AList.LoadFromFile(DMTCCoreLink.GetLocalSaveDir + 'OSCommerce.ini');
         while AList.Values[IntTOStr(i)+'Loginname'] <> '' do
           begin
               CBConfigs.AddItem(AList.Values[IntTOStr(i)+'Loginname'],TObject(i));
               inc(i);
           end;
      finally
        AList.free ;
      end;

   end;
if DMOSCommerceImport.LoginIndex < CBConfigs.Items.Count then
CBConfigs.ItemIndex := DMOSCommerceImport.LoginIndex else
CBConfigs.ItemIndex := 0 ;

osCsettingsToGui ;

end;

procedure TLoginMySql.Button1Click(Sender: TObject);
begin
if DMOSCommerceImport.IdHTTP1.Connected then
DMOSCommerceImport.IdHTTP1.Disconnect ;
DMOSCommerceImport.IdHTTP1.Request.Username := EUsername.Text ;
DMOSCommerceImport.IdHTTP1.Request.Password := EPassword.Text ;
DMOSCommerceImport.IdHTTP1.Request.BasicAuthentication := DMOSCommerceImport.IdHTTP1.Request.Password <> '';
memo1.Text :=  DMOSCommerceImport.IdHTTP1.Get(EServername.text+'?sql=' +DMOSCommerceImport.URLEncode(StringReplace(DMOSCommerceImport.SQLCheckOnline.Text,#13#10,' ',[rfReplaceAll]))  ) ;
end;

procedure TLoginMySql.EDateFormatDblClick(Sender: TObject);
begin
 ShowMessage(formatdatetime(EDateFormat.text,now));
end;

procedure TLoginMySql.EDateTimeFormatDblClick(Sender: TObject);
begin
 ShowMessage(formatdatetime(EDateFormat.text,now));
end;

procedure TLoginMySql.BSaveConfigClick(Sender: TObject);
var
 ANAme : String ;
begin

 DMOSCommerceImport.LoginIndex := CBConfigs.Items.Count ;
 InpuTQuery('Name of config','Please enter the name of the config',ANAme);
 DMOSCommerceImport.LoginName := AName ;
 CBConfigs.AddItem(DMOSCommerceImport.LoginName,TObject(DMOSCommerceImport.LoginIndex));
 CBConfigs.ItemIndex := CBConfigs.Items.Count -1 ;
 BSaveClick(self) ;

end;

procedure TLoginMySql.CBConfigsChange(Sender: TObject);
begin
  if  CBConfigs.ItemIndex <> -1 then
  begin
  DMOSCommerceImport.LoginIndex := CBConfigs.ItemIndex ;
  DMOSCommerceImport.LoadIni(false);
  osCSettingsToGui ;
  end;
end;

procedure TLoginMySql.BDeleteConfigClick(Sender: TObject);
begin
 if CBConfigs.ItemIndex < 1 then
    Raise Exception.create('You cant delete the default');
  DMOSCommerceImport.SaveIni(true);
  FormShow(self) ;
  CBConfigsChange(self);
end;

procedure TLoginMySql.BSaveClick(Sender: TObject);
begin
DMOSCommerceImport.PREFIX := EPrefix.Text ;
DMOSCommerceImport.LoadSQL ;
DMOSCommerceImport.RemoteURL := EServername.Text ;
DMOSCommerceImport.Username := EUsername.Text ;
DMOSCommerceImport.Password := EPassword.Text ;
DMOSCommerceImport.RememberPassword := CBRememberPassword.Checked ;
DMOSCommerceImport.LoggedIn := DMOSCommerceImport.CheckLogin ;
DMOSCommerceImport.DateFormat :=EDateFormat.Text ;
DMOSCommerceImport.DateTimeFormat  := EDateTimeFormat.Text ;
DMOSCommerceImport.SqlFolder := Esqlfolder.Text ;
DMOSCommerceImport.LoginIndex := CBConfigs.ItemIndex ;
DMOSCommerceImport.SaveIni;
end;

procedure TLoginMySql.osCsettingsToGui;
begin
  EServername.Text := DMOSCommerceImport.RemoteURL   ;
  EUsername.Text := DMOSCommerceImport.Username   ;
  CBRememberPassword.Checked := DMOSCommerceImport.RememberPassword ;
  if CBRememberPassword.Checked then
  EPassword.Text := DMOSCommerceImport.Password ;
  EDateFormat.Text := DMOSCommerceImport.DateFormat ;
  EDateTimeFormat.Text := DMOSCommerceImport.DateTimeFormat ;
  EPrefix.Text :=  DMOSCommerceImport.PREFIX ;
  CBTaxType.ItemIndex := DMOSCommerceImport.AlternateWay ;
  Esqlfolder.Text := DMOSCommerceImport.SqlFolder ;
end;

end.
