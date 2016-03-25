(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DeleteASetOfBooks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids,  Buttons,   DB,
  DBClient, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, MemDS, VirtualTable, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfmDeleteASetOfBooks = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    BtnDelete: TBitBtn;
    BtnCancel: TBitBtn;
    Label1: TLabel;
    DSBooks: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1bookname: TcxGridDBColumn;
    cxGrid1DBTableView1database: TcxGridDBColumn;
    cxGrid1DBTableView1server: TcxGridDBColumn;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cdBooks: TVirtualTable;
    cdBooksbookname: TStringField;
    cdBooksdatabase: TStringField;
    cdBooksserver: TStringField;
    cdBooksid: TIntegerField;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdBooksAfterScroll(DataSet: TDataSet);
    procedure cdBooksAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDeleteASetOfBooks: TfmDeleteASetOfBooks;

implementation

uses
  GlobalFunctions, Database, OpenASetOfBooks,
  HtmlHelpAPI, LanguageChoice, DatabaseAccess, UDMTCCoreLink,
  UDmQuantumGridDefs,variants;

{$R *.DFM}


procedure TfmDeleteASetOfBooks.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BtnDelete.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
  GlobalSetOfBooksToDataSet(CDBooks);

  cxGrid1.SetFocus;
end;

procedure TfmDeleteASetOfBooks.btnDeleteClick(Sender: TObject);
Var
 i:Integer;
 S:String;
begin

    for i:=0 to cxGrid1DBTableView1.Controller.SelectedRowCount -1 do
    begin
    cxGrid1DBTableView1.Controller.SelectedRows[i].Focused := True ;

    s:=CDBooksBookname.AsString;
    if OSFMessageDlg(GetTextLang(458){Are you sure you want to delete the } + ' ' +
                s + ' ' +
                GetTextLang(459){ set of Accounts ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
    if  OSFMessageDlg(GetTextLang(755){The set of Books } + ' ' +
                s + ' ' +
                GetTextLang(756){ Will be permanebtly removed from Disk}+#13#10+
                GetTextLang(757){Do yo want to Cancel de deletion}, mtconfirmation, [mbyes, mbno], 0) = mrno then
    begin
      s := cdBooksdatabase.AsString;
      CloseSetOfBooks;
      DeleteBooks(s);
      OSFMessageDlg(GetTextLang(172){ set of Accounts ?}
           + ' '+ s +' '+ GetTextLang(1123), mtInformation, [mbOk], 0);
       
    end;
  end;
   GlobalSetOfBooksToDataSet(CDBooks);

end;

procedure TfmDeleteASetOfBooks.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeleteASetOfBooks.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnDeleteClick(Sender);
    Key := #0;
  end;
  if Key = #27 then
  begin
    btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmDeleteASetOfBooks.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     result : integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(113);
             key := 0;

        end;
end;

procedure TfmDeleteASetOfBooks.cdBooksAfterScroll(DataSet: TDataSet);
begin
 Label1.Caption:=   CDBooksDatabase.AsString;
end;

procedure TfmDeleteASetOfBooks.cdBooksAfterOpen(DataSet: TDataSet);
begin
 Label1.Caption:=   CDBooksDatabase.AsString;
end;

procedure TfmDeleteASetOfBooks.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Function BooksInT3folder:Boolean;
  Var
    aTest:String;
  begin
  
    aTest:=LowerCase(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index]));
    Result := Pos(LowerCase(ExtractFilePath(Application.ExeName) ),aTest)=1;
  end;
begin
  ACanvas.Font.Style :=[] ;


  if GetDrvType(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index]))=4 then
    ACanvas.Font.Style :=[ fsBold]
  else
  if Not BooksInT3folder then begin
    ACanvas.Font.Color:=clBlue;
    ACanvas.Font.Style :=[ fsBold]
  end;
  if VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1server.Index]) <> '' then
   begin
    ACanvas.Font.Color:=clNavy;
    ACanvas.Font.Style :=[ fsBold]
  end else
  if not FileExists(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index])) then
      begin
       ACanvas.Font.Color:=clRed;
       ACanvas.Font.Style :=[ fsBold]
      end;
  if ((AViewInfo.RecordViewInfo.Selected) or (AViewInfo.RecordViewInfo.Focused))then
  if (ACanvas.Font.Color =clNavy) or (ACanvas.Font.Color = clBlue) then ACanvas.Font.Color := clwhite ;
end;
end.
