(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SelectUserReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TfmSelectUserReport = class(TForm)
    ButtonPanel: TPanel;
    DBGrid1: TDBGrid;
    Btnok: TBitBtn;
    BtnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fmSelectUserReport: TfmSelectUserReport;
  DelUserReport:boolean;
implementation

uses Main, Database, ReportWriter, HtmlHelpAPI, LanguageChoice,
  GlobalFunctions, DatabaseAccess, UDMTCCoreLink;

{$R *.DFM}

Procedure DeleteUserReport(RepID:Integer);
Begin
 if OSFMessageDlg(GetTextLang(1006){'Are you sure you want delete this user report ?'}, mtconfirmation, [mbyes, mbno], 237) <> mryes Then
    exit;
  With DmDatabase do
  Begin


  tblRepHead.Open;
// Delete All records in TblRepLine WReportID:=RepID.
  tblRepline.Open;
  tblRepLine.Filtered := False;
  tblRepLine.Filter := 'WReportID = ' + IntToStr(RepId);
  tblRepLine.Filtered := True;
  While not tblRepLine.Eof do tblRepLine.Delete;

// Delete All records in TblRepCols WReportID:=RepID.
  tblRepCols.Open;
  tblRepCols.Filtered := False;
  tblRepCols.Filter := 'WReportID = ' + IntToStr(RepId);
  tblRepCols.Filtered := True;
  While not tblRepCols.Eof do tblRepCols.Delete;

// Delete 1 Record in TblRepHead WReportID=RepID.
  tblRepHead.Open;
  tblRepHead.Filtered := False;
  tblRepHead.Filter := 'WReportID = ' + IntToStr(RepId);
  tblRepHead.Filtered := True;
  While not tblRepHead.Eof do tblRepHead.Delete;

  tblRepLine.Filtered := False;
  tblRepLine.Filter := '';
  tblRepLine.Filtered := True;
  tblRepHead.Filtered := False;
  tblRepHead.Filter :='';
  tblRepHead.Filtered := True;
  tblRepCols.Filtered := False;
  tblRepCols.Filter :='';
  tblRepCols.Filtered := True;

  tblRepline.Close;
  tblRepCols.Close;

  end;
end;

procedure TfmSelectUserReport.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblRepHead.Open;
  If DelUserReport then
  begin
   BtnOk.Caption:=GetTextLang(24);
   If dmDatabase.tblrepHead.Locate('SReportName','New*',[]) then
     dmDatabase.tblrepHead.Delete;
   Exit;
  end
  else
   BtnOk.Caption:=GetTextLang(167);
  with DmDatabase do
    begin
      If not tblrepHead.Locate('SReportName','New*',[]) then
      Begin
        tblRepHead.Append;
        TblRepHeadSReportName.value:='New*';
        tblRepHeadWReportID.value:=0;
        tblRepHead.Post;
      end;
    end;
end;

procedure TfmSelectUserReport.btnOkClick(Sender: TObject);
begin
  If DelUserReport then
    DeleteUserReport(DmDataBase.tblRepHeadWReportID.AsInteger)
  else
  begin
    if DmDatabase.tblRepHeadWReportID.value=0 then
    begin
      DmDatabase.tblRepHead.Append;
      DmDatabase.tblRepHeadSReportName.value:='No Name '+IntToStr(DmDatabase.tblRepHeadWReportID.value);
//      DmDatabase.tblRepHeadWReportID.value:=NewRepID;
      DmDatabase.tblRepHeadWNoOfColumns.value:=2;
(*
      tblGlobal.open;
      NewRepID:=tblGlobalWNewReportID.Value;
      tblGlobal.Close;
*)

      DmDatabase.tblRepHead.Post;
    end;
      dmDatabase.tblRepLine.Open;
    dmDatabase.tblRepLine.Filtered := False;
    dmDatabase.tblRepLine.Filter := 'WReportID = ' + IntTostr(dmDatabase.tblRepHeadWReportID.Value) ;
    dmDatabase.tblRepLine.Filtered := True;
    fmReportWriter := TfmReportWriter.Create(self);
     try
      SetUpForm(fmReportWriter);
      fmReportWriter.ShowModal;
      finally
       FreeAndNil(fmReportWriter);
      end;
    dmDatabase.tblRepLine.Close;
    
  end;
  Close;


end;

procedure TfmSelectUserReport.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelectUserReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblRepHead.Close;
end;

procedure TfmSelectUserReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then begin
  key := 0;
  if deluserreport then
     HtmlShowTopic(123)
  else
    HtmlShowTopic(128);

 end;
end;

procedure TfmSelectUserReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmSelectUserReport.DBGrid1DblClick(Sender: TObject);
begin
 btnOkClick(self);
end;

end.
