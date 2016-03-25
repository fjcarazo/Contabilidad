(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ChangeBooksProperties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxLabel;

type
  TfmChangeBooksProperties = class(TForm)
    Ldisplayname: TcxLabel;
    LConnection: TcxLabel;
    EDatabase: TcxTextEdit;
    ButtonPanel: TPanel;
    BtnChange: TBitBtn;
    BtnCancel: TBitBtn;
    LUSername: TcxLabel;
    EUsername: TcxTextEdit;
    LPassword: TcxLabel;
    EPassword: TcxTextEdit;
    LServer: TcxLabel;
    EDisplayname: TcxTextEdit;
    EServer: TcxTextEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BtnChangeClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChangeBooksProperties: TfmChangeBooksProperties;

implementation

uses
UMsgBox,
  UDMTCCoreLink;

{$R *.DFM}


procedure TfmChangeBooksProperties.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(445){Do you want to save these changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      BtnChangeClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmChangeBooksProperties.FormShow(Sender: TObject);
begin

   DMTCCoreLink.LoadImage(BtnChange.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

   Caption := DMTCCoreLink.GetTextLang(535);// Change a set of books properties
   Ldisplayname.Caption := DMTCCoreLink.GetTextLang(536);// Type in the name of the set of books
   LConnection.Caption := DMTCCoreLink.GetTextLang(537);// Type in the path where the books are stored
   btnCancel.Caption := DMTCCoreLink.GetTextLang(168);// Cancel
   btnChange.Caption := DMTCCoreLink.GetTextLang(538);// Change


  LServer.Caption := DMTCCoreLink.GetTextLang(1945);
  LUsername.Caption := DMTCCoreLink.GetTextLang(1899);
  LPassword.Caption := DMTCCoreLink.GetTextLang(1064);

 // ButtonPanel.Color := MainPanelColor;
  if DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks <> nil then
      begin
        EDisplayname.Text := DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Name ;
        EDatabase.Text := DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Database ;
        EUsername.Text := DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.UserName ;
        EPassword.Text := DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Password ;
        EServer.Text := DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Server ;
      end;
end;

procedure TfmChangeBooksProperties.BtnChangeClick(Sender: TObject);
begin
  if DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks <> nil then
      begin
        DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Name :=  EDisplayname.Text;
        DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Database := EDatabase.Text ;
        DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.UserName :=  EUsername.Text;
        DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Password:=  EPassword.Text ;
        DMTCCoreLink.TheGlobalDataObject.Books.SelectedBooks.Server :=  EServer.Text;
      end;
   ModalResult := mrOk ;
end;

procedure TfmChangeBooksProperties.BtnCancelClick(Sender: TObject);
begin
ModalResult := mrCancel ;
end;

end.
