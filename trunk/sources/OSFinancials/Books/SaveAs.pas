unit SaveAs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FileCtrl, ComCtrls, ShellCtrls, Buttons;

type
  TfmSaveAs = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    edSaveAs: TEdit;
    edDir: TEdit;
    Label2: TLabel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    btnTo: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnToClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSaveAs: TfmSaveAs;

implementation
uses HTMLHelpAPI, Database, Main, GlobalFunctions, LanguageChoice,
  TcVariables, DatabaseAccess, UDMTCCoreLink;
{$R *.DFM}

procedure TfmSaveAs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(213);
   key := 0;
  end;
 if Key = 27 then
  begin
   Close;
   key := 0;
  end;
end;

procedure TfmSaveAs.btnSaveClick(Sender: TObject);
var tmp : string;
    DelFile, Exec : array[0..255] of char;
begin
 edSaveAs.Text := Trim(edSaveAs.Text);
 if edSaveAs.Text='' then
 begin
   OSFMessageDlg(GetTextLang(1049){'Nem cannot be blank'} ,mterror,[mbYes],0);
   exit;
 end;

 if not DirectoryExists(edDir.Text) then
  if OSFMessageDlg(GetTextLang(743){'Create directory '} + edDir.Text + '?',mtConfirmation,[mbYes,mbNo],0) = mrNo then exit;

 tmp := IncludeTrailingPathDelimiter(edDir.Text) + edSaveAs.Text;
 if DirectoryExists(tmp) then begin
  OSFMessageDlg(GetTextLang(744){'That set of books allready exists. Please re-enter.'},mtInformation,[mbOK],0);
  exit;
 end;

 if CopyExistingBooks(ExtractFilePath(dmDatabase.ZMainconnection.database), tmp, edSaveAs.Text )<>1 then
   OSFMessageDlg(GetTextLang(807){'Error Occur during copy process.'},mtError,[mbOK],0);
 edDir.Enabled := true;
 btnSave.Enabled := true;
 btnCancel.Enabled := true;
 OSFMessageDlg(GetTextLang(1827){'Seved'},mtInformation,[mbOK],0);
 Close;
end;

procedure TfmSaveAs.FormActivate(Sender: TObject);
begin

 edDir.Enabled := true;
 btnSave.Enabled := true;
 btnCancel.Enabled := true;

end;

procedure TfmSaveAs.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSaveAs.btnToClick(Sender: TObject);
Var
  Temp:String;
begin
   Temp:=edDir.Text;
   if Trim(Temp)='' then
    Temp := ApplicationPath +'books';
   Temp:=ExcludeTrailingPathDelimiter(Temp);
   if SelectDIrectory(GetTextLang(2977) {'Select New Set of Books Directory'},'',Temp) then
     edDir.Text:=Temp;
end;

procedure TfmSaveAs.FormShow(Sender: TObject);
begin
  edDir.Text := ApplicationPath +'books';
   DMTCCoreLink.LoadImage(btnSave.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
end;

end.
