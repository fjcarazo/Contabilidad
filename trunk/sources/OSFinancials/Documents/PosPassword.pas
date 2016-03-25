
unit PosPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, 
  ComCtrls, ToolWin, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxImage;

type
  TfmPosPassword = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtPassword: TEdit;
    cbRemem: TCheckBox;
    Label5: TLabel;
    tcxShape: TShape;
    tcxTitle: TLabel;
    Image1: TcxImage;
    edtSalesPerson: TComboBox;
    PosInvDate: TcxDateEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    BLogin:Boolean;
  public
    { Public declarations }

  end;
  Function PosLogin:Boolean;
  // Function  IsGeneralPwd (Password : Pchar):Boolean;StdCall; External  'Tc32LibGen.dll';

var
  fmPosPassword: TfmPosPassword;

implementation

uses Database,PosRoutines, GlobalFunctions, LanguageChoice, Main,
  DatabaseAccess, TcVariables, UDMTCCoreLink, OSFGeneralRoutines;

{$R *.dfm}

Function PosLogin:Boolean;
begin
   if Assigned(ExternalLoginControlerPlugin) and DMTCCoreLink.ReadNwReportOp('CONTROLERLOGIN',false) and (UpperCase(TDatabaseRegistyRoutines.ReadRegValue('','CONTROLERLOGIN')) = 'TRUE' )then
       begin
         DMTCCoreLink.currentuser :=  ExternalLoginControlerPlugin(Application,dmDatabase.ZMainconnection);
          if CurrentUser > 0 then
          begin
          Result := true ;
          SalesPerID := ReadSysParam('WLOGINSALESMANLINK',0,CurrentUser).AsInteger ;
          end else
          Result := false ;


       end else
  begin



  Result := False;
  fmPosPassword:=TfmPosPassword.Create(Application);
  try
  setupForm(fmPosPassword);
  fmPosPassword.BLogin:=False;
  fmPosPassword.cbRemem.Checked := RememPass;
  if RememPass then
  begin
    fmPosPassword.edtSalesPerson.ItemIndex := fmPosPassword.edtSalesPerson.Items.IndexOf(KeepSalesPerson);
    fmPosPassword.edtPassword.Text := KeepPassWord;
  end else
  fmPosPassword.edtPassword.Text :=  SavePass ;
  fmPosPassword.ShowModal;
  RememPass:=fmPosPassword.cbRemem.Checked;
  WriteSysParam('BpRememPassWord',BoolToStr(RememPass,true));

//   SavePosInputVars;
  Result :=fmPosPassword.BLogin;
  KeepSalesPerson := fmPosPassword.edtSalesPerson.Text;
  KeepPassWord := fmPosPassword.edtPassword.Text;
  finally
  FreeAndNil(fmPosPassword);
  end ;
  end;
end;

procedure TfmPosPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
    if BtnOk.Focused then
       BtnOk.Click else
    if edtPassword.Focused then
       BtnOk.Click else
    Self.SelectNext(ActiveControl,True,true);
      Key:=0;
  end;
end;

procedure TfmPosPassword.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPosPassword.BtnOkClick(Sender: TObject);
Var
  Test:String;
begin
  RememPass := cbRemem.Checked;
  dmDatabase.tblUser.Open;
  Test :=Copy(EncodePassword(edtPassword.Text),1,8);
  SalesPerID:=GetSalesPersonID(edtSalesPerson.Text);
  BLogin:=(SalesPerID>0) And ((CurrentUser<>0) AND (edtPassword.Text<>'') or
          (CurrentUser=0) AND (edtPassword.Text=''));


  if BLogin  AND (CurrentUser<>0) then
  begin
   if (dmDatabase.tblUser.Locate('SPassword',Test, []) = True) then
    SetCurrentUser(dmDatabase.tblUserWUserID.Value)
   else
    if IsGeneralPwd(PChar(edtPassword.Text)) Then  // General PassWords
       SetCurrentUser(CurrentUser) 
   else
    BLogin:=False ;
  // new check to see if sales person is linked.

  if ReadSysParam('WLOGINSALESMANLINK',0,CurrentUser).AsInteger <> 0 then
    begin
      BLogin := ReadSysParam('WLOGINSALESMANLINK',0,CurrentUser).AsInteger = SalesPerID ;
    end;
  end;
//  else
//    BLogin:=False;
  dmDatabase.tblUser.Close;
  PosShiftDate:=PosInvDate.Date;
  if BLogin then
    begin
     if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
        begin
          DMTCCoreLink.LogAction('POSPASSOK',0,'Login ok!');
        end;
    close ;
    end
  else
  begin
     OSFMessageDlg(GetTextLang(741){'Invalid Password'}, mterror, [mbok], 0);
     edtSalesPerson.SetFocus;
     if dmDatabase.SetOfBooksPropertys.DataParameter.LogLevel > 0 then
        begin
           DMTCCoreLink.LogAction('POSPASFAIL',0,'Login fial!');
        end;
   end;
end;

procedure TfmPosPassword.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
  try
  Image1.Picture.LoadFromFile(DMTCCoreLink.LoadImagename('Password'));
  except

  end;

  LoadPosInputVars;
  GetDatesLimits;
  if (Now<PosInvDate.Properties.MinDate) or (Now>PosInvDate.Properties.MaxDate) then begin
    OSFMessageDlg(DateToStr(Now)+' :'+ GetTextLang(1162){'Invalid Date'}, mterror, [mbok], 0);
    PosInvDate.Date := PosInvDate.Properties.MaxDate;
  end
  else
    PosInvDate.Date := Now;
  Label2.Visible:=CurrentUser<>0;
  edtPassword.Visible:=CurrentUser<>0;

  if cbRemem.Checked And (edtSalesPerson.Text<>'') then
    BtnOk.SetFocus;

//  edtSalesPerson.ItemIndex := 1;

  if AutoLoginPosPassword <> '' then
    begin
    edtPassword.Text := AutoLoginPosPassword ;
    BtnOk.Click ;
    end;

    // Caption 259
   Caption := GetTextLang(1174);
   tcxTitle.Caption := GetTextLang(1175);                  
   Label4.Caption := GetTextLang(238); //Date
   Label1.Caption := GetTextLang(1176);  //Cashier Name
   Label5.Caption := GetTextLang(1177); //(Saleperson Name)
   Label2.Caption := GetTextLang(295); //User Password
   cbRemem.Caption := GetTextLang(1178); //Remember my Login
   OkCancel(BtnOk,BtnCancel);
end;

procedure TfmPosPassword.FormCreate(Sender: TObject);
begin
   LoadSalesPersons(edtSalesPerson.items);
   if edtSalesPerson.Items.Count > 0 then
   edtSalesPerson.ItemIndex := 0;

end;

end.
