(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchPeriodTotals;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Database,Grids, DBGrids, ExtCtrls, Db, DBAccess , Uni, MemDS ;
type
  TFrmBatchPeriodTotals = class(TForm)
    Panel1: TPanel;
    GridTotalsBat: TStringGrid;
    qBatPeriodTotals: TuniQuery;
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBatchPeriodTotals: TFrmBatchPeriodTotals;


implementation

Uses DatabaseAccess,GlobalFunctions, UDMTCCoreLink;
{$R *.DFM}



procedure TFrmBatchPeriodTotals.FormShow(Sender: TObject);
Var
  i,LNext:integer;
  BatTotals:Array[0..3,-1..27] Of Double;
begin
  For I:=1 to 26 do
  Begin
   BatTotals[3,i]:=-1;
   BatTotals[2,i]:=0;
   BatTotals[1,i]:=0;
  end;
  GridTotalsBat.Cols[0].Text :=  GetTextLang(600); //'Period';
  GridTotalsBat.ColWidths[0] :=120;
  GridTotalsBat.cols[1].text := GetTextLang(211); // 'Debit';
  GridTotalsBat.cols[2].text := GetTextLang(212); // 'Credit';
  GridTotalsBat.cols[3].text := GetTextLang(1193); // 'To Balance';
  caption  := GetTextLang(2128);
  qBatPeriodTotals.Connection := DMTCCoreLink.TheZConnection ;
  Begin
     qBatPeriodTotals.Close;
     qBatPeriodTotals.Open;
     qBatPeriodTotals.First;
    While Not qBatPeriodTotals.Eof do
    Begin
     i:=Getperiod(qBatPeriodTotals.FieldByName('Period').VAlue);
     BatToTals[0,I]:=Getperiod(qBatPeriodTotals.FieldByName('Period').VAlue);
     BAtTotals[1,I]:=BAtTotals[1,I]+qBatPeriodTotals.FieldByName('Debit').AsFloat;
     BAtTotals[2,I]:=BAtTotals[2,I]+qBatPeriodTotals.FieldByName('Credit').AsFloat;
     BAtTotals[3,I]:=1;
     qBatPeriodTotals.Next;
    end
  End;
  LNext:=1;
  For i:=1 To 26 do
  begin
   If BAtTotals[3,I]=1 then
   Begin
     GridTotalsBat.Cells[0,LNext]:=GetPeriodDesc(i);
     GridTotalsBat.Cells[1,LNext]:=FloaTToStr(BAtTotals[1,I]);
     GridTotalsBat.Cells[2,LNext]:=FloaTToStr(BAtTotals[2,I]);
     GridTotalsBat.Cells[3,LNext]:=FloaTToStr(BAtTotals[1,I]-BAtTotals[2,I]);
     Inc(LNext);
   end;
  end;
end;

procedure TFrmBatchPeriodTotals.FormDeactivate(Sender: TObject);
begin
  Close;
end;

procedure TFrmBatchPeriodTotals.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  Close
end;

end.
