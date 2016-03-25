unit Support;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ShellApi, Buttons, ExtCtrls;

type
  TfmSupport = class(TForm)
    Panel1: TPanel;
    LLink: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Memo1: TMemo;
    Memo5: TMemo;
    btnOk: TBitBtn;
    procedure Memo5Enter(Sender: TObject);
    procedure LLinkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSupport: TfmSupport;

implementation

uses Main, GlobalFunctions, Database, TcVariables, UDMTCCoreLink;

{$R *.DFM}

procedure TfmSupport.Memo5Enter(Sender: TObject);
begin
  btnOk.Setfocus;
end;

procedure TfmSupport.LLinkClick(Sender: TObject);
var
 AString : String ;
begin
   AString := DMTCCoreLink.GetTextLang(3116) ;
   ShellExecute(Handle, 'open', Pchar(AString), nil, nil, SW_SHOW);
end;

procedure TfmSupport.FormShow(Sender: TObject);
Var
 s:String;
begin
 DMTCCoreLink.LoadImage(btnOk.Glyph,'Ok');

    Label1.Caption :=  DMTCCoreLink.GetTextLang(1197); //
    LLink.Caption := DMTCCoreLink.GetTextLang(1198); ////Software support page
    btnOk.Caption := DMTCCoreLink.GetTextLang(167);

  try
    memo1.Lines.LoadFromFile(ApplicationPath+'Support.txt');
    s:= memo1.Lines.text;
    Memo5.Lines.Text := Trim(Copy(s,Pos('>',s)+1,255));
    Delete(s,Pos('>',s)-1,255);
    memo1.Lines.text:=s;
  finally end;
end;

procedure TfmSupport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(133);
             key := 0;

        end;
     if Key = 27 then
        begin
             Close;
             key := 0;

        end;
        
end;

end.
