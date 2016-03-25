(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StatementSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons;

type
  TfmStatementSetup = class(TForm)
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    ButtonPanel: TPanel;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Bitprn1: TBitBtn;
    GroupBox1: TGroupBox;
    cbFrames: TCheckBox;
    cbLogo: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bitprn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStatementSetup: TfmStatementSetup;

implementation

uses Main, Database, HtmlHelpAPI, LanguageChoice, GlobalFunctions,
  PaperSetup, DatabaseAccess, XRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TfmStatementSetup.FormShow(Sender: TObject);
begin

 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  dmDatabase.tblType.filter := 'WTypeParent=5';
  dmDatabase.tblType.filtered := True ;
  dmDatabase.tblType.open ;


  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblSysVars.Open;
  cbFrames.Checked := ReadReportOp('BStmtPrntFrames',True).AsBoolean;
  cbLogo.Checked := ReadReportOp('BStmtPrntLogo',True).AsBoolean;
  DBLookupComboBox3.SetFocus;
  Bitprn1.Caption := GetTextLang(864);//Printer setup
  Caption := GetTextLang(347);//Header 347
  Label4.Caption := GetTextLang(323);//paper type 323
  Label11.Caption := GetTextLang(348);//Statement Message 348
  DBCheckbox1.Caption := GetTextLang(348);//Create Balance brought forward
  btnOK.Caption := GetTextLang(167);//OK 167
  btnCancel.Caption := GetTextLang(168);//Cancel 168
  cbFrames.Caption := GetTextLang(2990);
  cbLogo.Caption := GetTextLang(2991);
end;

procedure TfmStatementSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblType.close ;
  dmDatabase.tblType.filter := '';
  dmDatabase.tblType.filtered := False ;
end;

procedure TfmStatementSetup.btnOKClick(Sender: TObject);
begin
  dmDatabase.tblSysVars.Edit;
  dmDatabase.tblSysVars.Post;
  WriteReportOp('BStmtPrntFrames',Bool2Str(cbFrames.Checked));
  WriteReportOp('BStmtPrntLogo',Bool2Str(cbLogo.Checked));
  Close;
end;

procedure TfmStatementSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmStatementSetup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(445){'Do you want to save these changes ?'}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;


procedure TfmStatementSetup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(232);
             key := 0;

        end;
end;

procedure TfmStatementSetup.Bitprn1Click(Sender: TObject);
begin
  fmPaperSetup := TfmPaperSetup.Create(self);
  try
  SetUpForm(fmPaperSetup);
  fmPaperSetup.rbRepType.ItemIndex:=1;
  fmPaperSetup.ShowModal;
  finally
  FreeAndNil(fmPaperSetup);
  end;
end;

end.
