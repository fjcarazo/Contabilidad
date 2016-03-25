(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SelectUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,   Buttons,  cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfmSelectUser = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SUSERNAME: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    WSelectedUserId : Integer ;
     { Public declarations }
  end;


implementation

uses Database, Main, AccessControl, UDMTCCoreLink;

{$R *.DFM}



procedure TfmSelectUser.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

  dmDatabase.tblSelectUser.Open;
  dmDatabase.tblSelectUser.Filtered := False;
  dmDatabase.tblSelectUser.Filter := 'WUserID <> ''' + dmDatabase.tblUserWUserID.AsString + '''';
  dmDatabase.tblSelectUser.Filtered := True;
end;

procedure TfmSelectUser.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelectUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WSelectedUserId := dmDatabase.tblSelectUserWUSERID.AsInteger ;
  dmDatabase.tblSelectUser.Filtered := False;
  dmDatabase.tblSelectUser.Filter := '';
  dmDatabase.tblSelectUser.Close;
end;

procedure TfmSelectUser.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

end.
