(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BackOrdersOutatanding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db,Buttons, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TfmBackOrdersOutatanding = class(TForm)
    StatusBar1: TStatusBar;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BackOrdDBGrid: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BackOrdDBGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    vWAccountID:Integer;
    MDResult:Boolean;
    { Public declarations }
  end;

var
  fmBackOrdersOutatanding: TfmBackOrdersOutatanding;

implementation

uses Database, Main,databaseaccess;

{$R *.DFM}

procedure TfmBackOrdersOutatanding.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  Caption := GetTextLang(1191); // BackOrders Outatanding
  OkCancel(BtnOk,BtnCancel);
  BackOrdDBGrid.Columns[0].DisplayLabel := gettextlang(1708) ; // Description
  BackOrdDBGrid.Columns[1].DisplayLabel := gettextlang(2052) ; // Qty
  BackOrdDBGrid.Columns[2].DisplayLabel := gettextlang(416) ; // Selling price
  BackOrdDBGrid.Columns[3].DisplayLabel := gettextlang(1070) ; // selected

end;

procedure TfmBackOrdersOutatanding.BtnCancelClick(Sender: TObject);
begin
  MDResult := False;
  Close;
end;

procedure TfmBackOrdersOutatanding.BtnOkClick(Sender: TObject);
begin
  MDResult := True;
  try
    if dmDatabase.tblBackOrder.state=dsEdit then
       dmDatabase.tblBackOrder.post;
  except end;
  Close;
end;

procedure TfmBackOrdersOutatanding.BackOrdDBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  Case key of
   #32:begin
        dmDatabase.tblBackOrder.Edit;
        dmDatabase.tblBackOrderBselected.Value:= not dmDatabase.tblBackOrderBselected.Value;
        dmDatabase.tblBackOrder.post;        
      end;
  end;
end;

end.
