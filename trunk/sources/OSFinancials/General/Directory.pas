(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Directory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, Buttons;

type
  TfmDirectory = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    ButtonPanel: TPanel;
    Label1: TLabel;
    BtnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDirectory: TfmDirectory;

implementation

uses Main, TcVariables, UDMTCCoreLink;

{$R *.DFM}

procedure TfmDirectory.FormShow(Sender: TObject);
begin

 DMTCCoreLink.LoadImage(BtnClose.Glyph,'Ok');
 Caption := DMTCCoreLink.GetTextLang(574);// Pick a directory
 btnClose.Caption := DMTCCoreLink.GetTextLang(167);// OK

end;

procedure TfmDirectory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReturnLookup:=DirectoryListBox1.Directory;
  ImportDir := DirectoryListBox1.Directory;
end;

procedure TfmDirectory.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
