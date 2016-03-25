(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Fonts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmFonts = class(TForm)
    ListBox1: TListBox;
    GBSample: TGroupBox;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Edit1: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFonts: TfmFonts;

implementation

uses GlobalFunctions, DatabaseAccess, UDMTCCoreLink;

{$R *.DFM}

procedure TfmFonts.FormCreate(Sender: TObject);
begin
  ListBox1.Items:=Screen.Fonts;
end;

procedure TfmFonts.ListBox1Click(Sender: TObject);
begin
  Label1.Font.Name:=ListBox1.Items[ListBox1.ItemIndex];
  Label2.Font:=Label1.Font;
  Edit1.TExt:=ListBox1.Items[ListBox1.ItemIndex];
end;

procedure TfmFonts.Edit1Change(Sender: TObject);
var
 i:integer;
begin
  for i:=0 to  ListBox1.Items.Count-1 do
    if Pos(UpperCase(edit1.Text),UpperCase(ListBox1.Items[i]))=1 then begin
      ListBox1.ItemIndex:=i;
      Break;
    end;
 if ListBox1.ItemIndex <> -1 then
  Label1.Font.Name:=ListBox1.Items[ListBox1.ItemIndex];
  Label2.Font:=Label1.Font;
end;

procedure TfmFonts.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(219);
             key := 0;

        end;
end;

procedure TfmFonts.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

OkCancel(BtnOk,BtnCancel);
GBSample.Caption := GetTextLang(2966);
Self.Caption := StringReplace(GetTextLang(847),'&','',[rfReplaceAll]);
Label1.Caption := DMTCCoreLink.ReadSysVar('SCOMPANYNAME');
Label2.Caption := GetTextLang(3116);
end;

end.
