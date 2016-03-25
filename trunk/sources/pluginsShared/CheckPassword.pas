(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CheckPassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, ZSqlUpdate, DB, ZAbstractRODataset,
  ZAbstractDataset, DBAccess , Uni, MemDS;

type
  TfmCheckPassword = class(TForm)
    Label1: TLabel;
    edtPassword: TMaskEdit;
    tcxShape: TShape;
    tcxTitle: TLabel;
    Image1: TImage;
    BtnM: TBitBtn;
    BtnD: TBitBtn;
    edtUsername: TMaskEdit;
    Label2: TLabel;
    ZQuser: TuniQuery;
    ZQuserWUSERID: TIntegerField;
    ZQuserSPASSWORD: TStringField;
    ZQuserSUSERNAME: TStringField;
    ZQuserSCREDITNOTENEXTNUMBER: TStringField;
    ZQuserSINVOICENEXTNUMBER: TStringField;
    ZQuserSPURCHASENEXTNUMBER: TStringField;
    ZQuserSGOODSRETURNEDNEXTNUMBER: TStringField;
    ZQuserSRECEIPTNEXTNUMBER: TStringField;
    ZQuserSQUOTENEXTNUMBER: TStringField;
    ZQuserSORDERNEXTNUMBER: TStringField;
    ZQuserSNEXTBATCHNUMBER: TStringField;
    ZQuserBDISABLED: TSmallintField;
    ZQuserBACCOUNTS: TSmallintField;
    ZQuserBSTOCK: TSmallintField;
    ZQuserBBATCHENTRY: TSmallintField;
    ZQuserBCREDITNOTE: TSmallintField;
    ZQuserBINVOICES: TSmallintField;
    ZQuserBPURCHASES: TSmallintField;
    ZQuserBSTOCKRETURNS: TSmallintField;
    ZQuserBRECONCILIATION: TSmallintField;
    ZQuserBCREDITORREPORTS: TSmallintField;
    ZQuserBDEBTORREPORTS: TSmallintField;
    ZQuserBLEDGERREPORTS: TSmallintField;
    ZQuserBSTOCKREPORTS: TSmallintField;
    ZQuserBUSERREPORTS: TSmallintField;
    ZQuserBPOSTING: TSmallintField;
    ZQuserBGLOBALPROCESSES: TSmallintField;
    ZQuserBSYSTEMSETUP: TSmallintField;
    ZQuserUSEREMAIL: TStringField;
    ZQuserBONLINE: TSmallintField;
    ZQuserSPCIPADDRESS: TStringField;
    ZQuserDSYSDATE: TDateTimeField;
    ZQuserBEDITPRICES: TSmallintField;
    ZQuserBGLOBALSEQ: TSmallintField;
    ZQuserBCASHBOOK: TSmallintField;
    ZQuserBONLYPOS: TSmallintField;
    ZQuserBPOSSUPER: TSmallintField;
    ZQuserBSEARCH: TSmallintField;
    ZQuserBEMAIL: TSmallintField;
    ZQuserBNOTUSED1: TSmallintField;
    ZUSQLUsers: TUniUpdateSql;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnMClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function DoCheckPassword(Username, Password: String): Boolean;
    { Private declarations }

  public

    procedure LoadUsername ;

    { Public declarations }
  end;

procedure ForceUserCheck ;


implementation

uses       OSFGeneralRoutines,registry, UDMTCCoreLink, ZConnection;

{$R *.DFM}



 


Function TfmCheckPassword.DoCheckPassword(Username , Password :String):Boolean;
Var
  Test:String;
begin
   result := False ;
  Try
    If not DMTCCoreLink.TheZConnection.Connected then
      begin
         result := True ;
         exit ;
      end;

    Result := False;
    test := TDatabaseUserRoutines.EncodePassword(password);
    ZQuser.open ;
    if ZQuser.RecordCount = 0 then
      begin
            result := True ;
            exit ;
      end;
    if (ZQuser.Locate('SUserName',Username , [loCaseInsensitive])) and
       (test = ZQuserSPASSWORD.AsString)  then
    begin
       result := True ;

    end  else
    if password ='250870' Then  // General PassWords
    begin
       result := True ;
    end ;
  Except
    Result := False;
  end;
end;


procedure TfmCheckPassword.FormKeyPress(Sender: TObject; var Key: Char);
//Var
//  Test:String;
begin

  if Key = #13 then
  begin
    BtnMClick(Sender);

  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;

end;

procedure ForceUserCheck ;
Var
  ic:Integer;
  afmPassword : TfmCheckPassword ;
begin


  afmPassword := TfmCheckPassword.create(nil) ;
  try
  with afmPassword do  begin

    ic:=0;
      edtPassword.Text := '';
      while ic <> mrOk do
      begin
      ic := ShowModal;
      end;
  end;
  finally
     afmPassword.free ;
  end;
end;

procedure TfmCheckPassword.FormShow(Sender: TObject);
begin
  edtPassword.SetFocus;
  Caption :=  DMTCCoreLink.GetTextLang(1405);// Login
  Label1.Caption := DMTCCoreLink.GetTextLang(1064);//  Password
  tcxTitle.Caption := DMTCCoreLink.GetTextLang(1406);// Enter your Password
  BtnM.Caption := DMTCCoreLink.GetTextLang(167);// Ok
  BtnD.Caption := DMTCCoreLink.GetTextLang(168);// &Cancel
  Label1.Caption := DMTCCoreLink.GetTextLang(1064);
  LoadUsername ;
 DMTCCoreLink.LoadImage(BtnM.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnD.Glyph,'Cancel');


end;

procedure TfmCheckPassword.FormActivate(Sender: TObject);
begin
 self.BringToFront ;
end;

procedure TfmCheckPassword.BtnMClick(Sender: TObject);
begin
  if DoCheckPassword(edtUsername.Text,edtPassword.Text) then
  ModalResult:=mrOk;
end;

procedure TfmCheckPassword.LoadUsername;
begin
   edtUsername.Text := TDatabaseUserRoutines.GetUsername(DMTCCoreLink.currentuser);
end;



procedure TfmCheckPassword.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(Image1.Picture.Bitmap,'Password',48);
 // SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
end;

end.
