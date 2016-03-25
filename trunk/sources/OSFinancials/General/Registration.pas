unit Registration;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons,ShellApi,XRoutines;

type
  TfmRegister = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCompanyName: TEdit;
    edtSerialNumber: TEdit;
    edtUnlockingCode: TEdit;
    ButtonPanel: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Button1: TBitBtn;
    Timer1: TTimer;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtCompanyNameKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure initform ;

    { Public declarations }
  end;


var
  fmRegister: TfmRegister;
  Mess:String;
implementation

uses HtmlHelpAPI, inifiles,databaseaccess,tcvariables , UPluginsSharedUnit,
  GlobalFunctions, UDMTCCoreLink, OSFGeneralRoutines;//, Uregistration;

{$R *.DFM}




procedure TfmRegister.btnOKClick(Sender: TObject);
begin
  if (edtCompanyName.Text = '') or (edtSerialNumber.Text = '') or (edtUnlockingCode.Text = '')
     or (Length(edtSerialNumber.Text)<6) then
  begin
    OSFMessageDlg('Please complete the registration form', mterror, [mbok], 0);
    edtCompanyName.SetFocus;
  end
  else
  begin
    if ((((StrToInt(edtSerialNumber.Text) div 2) + 50) div 10) div 7) <> StrToInt(edtUnlockingCode.Text) then
    begin
      OSFMessageDlg(gettextlang(20108), mterror, [mbok], 0);
      edtUnlockingCode.SetFocus;
    end
    else
    begin
      TheGlobalDataObject.Registration.CompanyName  := edtCompanyName.Text;
      TheGlobalDataObject.Registration.Registered  := true;
      TheGlobalDataObject.Registration.SerialNumber  := edtSerialNumber.Text;

      TheGlobalDataObject.SaveToFile(TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm');
      Close;
    end;
  end;
end;

procedure TfmRegister.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRegister.edtCompanyNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if (Key = #27) and (messagedlg(gettextlang(1054), mtconfirmation, [mbyes, mbno], 0) = mryes) then
    btnCancelClick(Sender);
end;

procedure TfmRegister.BitBtn1Click(Sender: TObject);
var
  ActiveIndex : Integer ;
  AText : String ;
begin
  AText :=  DMTCCoreLink.getTextLang(3119) ;
 if  PluginExist('RegisterOnline.tpd') then
   begin
      OSFPLUGINRunPlugInsDLLProgram('plug_ins\RegisterOnline.tpd','');
      // reload object and recheck
      ActiveIndex := 0 ;
      if TheGlobalDataObject.Books.ActiveBooks <> nil then
      ActiveIndex := TheGlobalDataObject.Books.ActiveBooks.Index ;
      TheGlobalDataObject.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm');
      DMTCCoreLink.TheGlobalDataObject.LoadFromFile(TDMTCCoreLink.GetLocalBaseDir+'Bin\Settings.dfm');
      DMTCCoreLink.TheGlobalDataObject.Books.ScannBooksDir(IncludeTrailingPathDelimiter(ExtractFilePath(Application.Exename)+'books'));
      DMTCCoreLink.TheGlobalDataObject.Books.SetActive(ActiveIndex);
      TheGlobalDataObject.LoadFromFile(TheGlobalDataObject.LoadedFile);
      TheGlobalDataObject.Books.SetActive(ActiveIndex);
      initform ;
      close ;
   end else

   ShellExecute(Handle, 'open', pchar(AText){'http://www.osfshop.com/create_account.php'}, nil, nil, SW_SHOW);
{ FOnlineRegistration:= TFOnlineRegistration.create(Application);
 try
  FOnlineRegistration.ShowModal ;
 finally
  FOnlineRegistration.free ;
 end;      }
 //
end;

procedure TfmRegister.FormCreate(Sender: TObject);

begin
 //    Label6.Caption:= GetTextLang(967);{Unregistered copies of TurboCASH}
 //  Label7.Caption:= GetTextLang(968);{are limited to 150 transactions}
     Label3.Caption:= GetTextLang(970);{Unlocking Code :}
     Label2.Caption:= GetTextLang(971);{Serial Number ( On Disk ) : }
     Label1.Caption:= GetTextLang(976);{Company Name : }
     BitBtn1.Caption:= GetTextLang(969);{&Get it Online}
     BtnCancel.Caption:= GetTextLang(828);{Close}
     BtnOK.Caption:= GetTextLang(167);{Ok}
     Caption:=  GetTextLang(972);{Register your TurboCASH}
//     Label5.Caption:= GetTextLang(973);{To Get your Unlocking Code or}
 //    Label4.Caption:= GetTextLang(974);{Phone :}
     Button1.Caption:= GetTextLang(2248);{delete :}
     Mess:=  GetTextLang(975);{This copy of TurboCASH is not registered , do you wish to register it now ?}
end;

procedure TfmRegister.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=112 then
  begin
      HtmlHelpShowContentID(161);
      Key:=0;
  end;
end;



procedure TfmRegister.Button1Click(Sender: TObject);
begin
  if OSFMessageDlg(GetTextLang(2952){'This will remove your current registration and open the enter registration form! Do you want to cancel?'},mtWarning,[mbyes,mbno],0) = mryes then exit ;
   begin
    TheGlobalDataObject.Registration.Registered := false ;
    TheGlobalDataObject.Registration.SerialNumber := '' ;
    TheGlobalDataObject.Registration.CompanyName := '' ;
    TheGlobalDataObject.Save ;
    initform ;
   end;
end;

procedure TfmRegister.initform;
begin
 if TheGlobalDataObject.Registration.Registered then
   begin
     BitBtn1.Visible := PluginExist('RegisterOnline.tpd') ;
     Button1.Visible := true ;
     edtCompanyName.Enabled := false ;
     edtCompanyName.Text := TheGlobalDataObject.Registration.CompanyName ;
     edtSerialNumber.Enabled := false ;
     edtSerialNumber.Text := TheGlobalDataObject.Registration.SerialNumber ;
     edtUnlockingCode.Enabled := false ;
     edtUnlockingCode.Text := 'XXXXX';
     btnOK.Visible := false ;
   end else
   begin
     BitBtn1.Visible := true ;
     Button1.Visible := false ;
     btnOK.Visible := true ;
     edtCompanyName.Enabled := true ;
     edtCompanyName.Text := '' ;
     edtSerialNumber.Enabled := true ;
     edtSerialNumber.Text := '' ;
     edtUnlockingCode.Enabled := true ;
     edtUnlockingCode.Text := '';
   end;
end;

procedure TfmRegister.FormShow(Sender: TObject);
begin
   DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
   DMTCCoreLink.LoadImage(Button1.Glyph,'retry');

 initform ;
if  TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '0' then
  if not TheGlobalDataObject.Registration.Registered or ( PluginExist('RegisterOnline.tpd') ) then
  begin
    BitBtn1Click(self);

    Timer1.Enabled := True ;
  end;
   
end;

procedure TfmRegister.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled := false ;
self.close ;
end;

end.
