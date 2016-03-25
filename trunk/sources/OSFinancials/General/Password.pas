(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Password;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage,
  cxLabel, cxTextEdit, cxMaskEdit;

type
  TfmPassword = class(TForm)
    Label1: TcxLabel;
    tcxShape: TShape;
    tcxTitle: TcxLabel;
    Image1: TcxImage;
    BtnM: TBitBtn;
    BtnD: TBitBtn;
    edtUsername: TcxMaskEdit;
    Label2: TcxLabel;
    edtPassword: TcxMaskEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtUsernameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public

    procedure LoadUsername ;
    procedure SaveUsername ;
    { Public declarations }
  end;

  Function PwdLoginWin:Integer;

 var
      pwdl_LastPassword : String ;

implementation

uses GlobalFunctions, Database, TcVariables, DatabaseAccess, DB,DBAccess , Uni,
  OSFGeneralRoutines,registry, UDMTCCoreLink;

{$R *.DFM}

Var
  UserDisab:Boolean;

 


Function CheckPassword(Username , Password :String):Boolean;
Var
  Test:String;
begin
  pwdl_LastPassword := Password ;
  Try
    If not DMTCCoreLink.TheZConnection.Connected then
      begin
        try
         DMTCCoreLink.TheZConnection.Username :=  Username ;
         DMTCCoreLink.TheZConnection.Password :=  Password ;
         DMTCCoreLink.TheZConnection.Connected := true ;

         result := true  ;

        except
         result := false ;
        end;
         exit ;
      end;

    Result := False;
    SetCurrentUser( -1);
    CurrentUserName := '';
    test := EncodePassword(password);
    UserDisab:=False;
    dmDatabase.tblUser.open ;
    if dmDatabase.tblUser.RecordCount = 0 then
      begin
            dmDatabase.tblUser.Insert ;
            dmDatabase.tblUserWUSERID.AsInteger := 0 ;
            dmDatabase.tblUser.post ;
            SetCurrentUser(0);
            exit ;
      end;



    if (dmDatabase.tblUser.Locate('SUserName',Username , [loCaseInsensitive])) and
       (test = dmDatabase.tblUserSPASSWORD.AsString)  then
    begin
      CurrentUserName := dmDatabase.tblUserSUserName.AsString;
      SetCurrentUser(dmDatabase.tblUserWUserID.Value);
      UserDisab := dmDatabase.tblUserBDisabled.AsInteger = 1;
      dmDatabase.tblUser.edit ;
      // dmDatabase.tblUserBONLINE.AsInteger := DMTCCoreLink.OpenSqlReturnFirstColumn('select CURRENT_CONNECTION from RDB$DATABASE') ;
      dmDatabase.tblUser.post;

      {dmDatabase.tblSysvars.open;
      dmDatabase.tblSysvars.Edit;
      dmDatabase.tblSysvarsBNotClosed.Asinteger := 1 ;
      dmDatabase.tblSysvars.post;
      dmDatabase.tblSysvars.close; }

    end
    else
    if IsGeneralPwd(password) Then  // General PassWords
    begin
        SetCurrentUser(0);
    end
    else
    begin
      SetCurrentUser(-1);
    end;
    Result := CurrentUser>=0;
  Except
    Result := False;
  end;
end;


procedure TfmPassword.FormKeyPress(Sender: TObject; var Key: Char);
//Var
//  Test:String;
begin

  if Key = #13 then
  begin
    BtnMClick(Sender);
    (*
    test:=EncodePassword(edtPassword.Text);
    if (dmDatabase.tblUser.Locate('SPassword',test , []) = True) then
    begin
      CurrentUser := dmDatabase.tblUserWUserID.Value;
      Close;
    end
    else
    if IsGeneralPwd(PChar(edtPassword.Text)) Then  // General PassWords
    begin
       CurrentUser:=0;
       Close;
    end
    else
    begin
      OSFMessageDlg(fmLangChoice.getMessage(741){'Invalid Password'}, mterror, [mbok], 0);
    end;
    *)
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;

end;

procedure TfmPassword.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RealUser:=CurrentUser;
  SavePass := edtPassword.Text;
  SaveUsername ;
 // Action := cafree;
end;

procedure TfmPassword.BtnDClick(Sender: TObject);
begin
if DMTCCoreLink.TheZConnection.Connected then
   SetCurrentUser( -1);
 DMTCCoreLink.TheZConnection.Connected := false ;
end;


Function PwdLoginWin:Integer;
Var
  ic:Integer;
  afmPassword : TfmPassword ;
begin
  Result := 2100;
  SavePass :='';
  UserDisab:=False;
  afmPassword := TfmPassword.create(nil) ;
  try
  with afmPassword do  begin
    Result := mrCancel;
    ic:=0;
      edtPassword.Text := '';
      SetCurrentUser( -1);
      if AutoLoginPosPassword <> '' then
      begin
      ic := mrok  ;
      edtPassword.Text := AutoLoginPosPassword ;
      
      Show ;
      BtnMClick(nil);
      end else
      ic := ShowModal;
      if  ic <> mrCancel then
      if not CheckPassword(copy(edtUsername.Text,1,20), copy(edtPassword.Text,1,8)) then
        begin
        
          Result := 2100;
          exit ;
        end;
      if  ic = mrCancel then
        Result := 2102;

  end;
  finally
     afmPassword.free ;
  end;
  if CurrentUser>=0 then
  begin
    Result := 0;
    if UserDisab then
      Result := 2103;
  end
  else if (Result=0) or (Result=2) then
    Result := 2102;

end;

procedure TfmPassword.FormShow(Sender: TObject);
begin
  edtPassword.SetFocus;
  Caption :=  GetTextLang(1405);// Login
  Label1.Caption := GetTextLang(1064);//  Password
  tcxTitle.Caption := GetTextLang(1406);// Enter your Password
  BtnM.Caption := GetTextLang(167);// Ok
  BtnD.Caption := GetTextLang(168);// &Cancel
  Label1.Caption := GetTextLang(1064);
  LoadUsername ;
  if edtUsername.Text = '' then
     edtUsername.Text := TheGlobalDataObject.Books.ActiveBooks.UserName ;
  SetCurrentUser(-1);
 DMTCCoreLink.LoadImage(BtnM.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnD.Glyph,'Cancel');


end;

procedure TfmPassword.FormActivate(Sender: TObject);
begin
 self.BringToFront ;
end;

procedure TfmPassword.BtnMClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfmPassword.edtUsernameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    edtPassword.SetFocus ;
  end;
end;

procedure TfmPassword.LoadUsername;
var
 AReg : TRegistry ;
begin
  AReg := TRegistry.Create ;
   try
     if AReg.OpenKey('\Software\osFinancials',false) then
        edtUsername.Text := AReg.ReadString('username');
   finally
     AReg.free ;
   end;
end;

procedure TfmPassword.SaveUsername;
var
 AReg : TRegistry ;
begin
  AReg := TRegistry.Create ;
   try
     if AReg.OpenKey('\Software\osFinancials',true) then
        AReg.WriteString('username',edtUsername.Text);
   finally
     AReg.free ;
   end;
end;

procedure TfmPassword.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(Image1.Picture.Bitmap,'Password',48);
 // SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
end;

end.
