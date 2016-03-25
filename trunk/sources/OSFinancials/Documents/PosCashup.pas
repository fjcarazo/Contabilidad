unit PosCashup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TfmPosCashup = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    sgCashUp: TStringGrid;
    procedure sgCashUpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure sgCashUpDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgCashUpSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure SumAll;
  public
    { Public declarations }
  end;

var
  fmPosCashup: TfmPosCashup;

  Function CashUpNow:Boolean;

implementation

uses PosRoutines, DatabaseAccess, UDMTCCoreLink;

{$R *.dfm}

Function CashUpNow;
begin
  fmPosCashup:=TfmPosCashup.Create(Application);
  try
  fmPosCashup.BtnOk.Caption :=GetTextLang(167);
  fmPosCashup.BtnCancel.Caption :=GetTextLang(168);
  fmPosCashup.sgCashUp.ColWidths[0]:=150;
  fmPosCashup.sgCashUp.Cells[0,1]:= GetTextLang(1169);//'Cash in Drawer';
  fmPosCashup.sgCashUp.Cells[1,0]:= GetTextLang(413);//'Quantity';
  fmPosCashup.sgCashUp.Cells[2,0]:= GetTextLang(946);//'Amount';
  fmPosCashup.sgCashUp.Cells[0,2]:= GetTextLang(1170);//'Credit Cards';
  fmPosCashup.sgCashUp.Cells[0,3]:= GetTextLang(1171);//'Float In/Out';
  fmPosCashup.sgCashUp.Cells[0,4]:= GetTextLang(1172);//'Cheques';
  fmPosCashup.sgCashUp.Cells[0,5]:= GetTextLang(1173);//'Vouchers';
  fmPosCashup.sgCashUp.Cells[0,6]:= GetTextLang(960);//'TOTAL';
  fmPosCashup.ShowModal;
  finally
  FreeAndNil(fmPosCashup);
  end;
end;

procedure TfmPosCashup.sgCashUpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 13 then
 begin
    with sgCashUp do
      if Col < ColCount-1 then {next column!}
        Col := Col + 1
      else if Row < RowCount-1 then begin {next Row!}
        Row := Row + 1;
        Col := 1;
      end else begin {End of Grid! - Go to Top again!}
        Row := 1;
        Col := 1;
        {or you can make it move to another Control}
      end;
    Key:=0;
    SumAll;
  end;
end;

procedure TfmPosCashup.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPosCashup.FormCreate(Sender: TObject);
Var
  i,j:Integer;
begin
  LoadCashup;
  For i:=0 to 1 do
    For j:=0 to 4 do
    sgCashUp.Cells[1+i,1+j]:= FloatToStr(CashUp[i,j]);
  sgCashUp.Cells[1,1]:='';
  SumAll;
end;

Procedure TfmPosCashup.SumAll;
Var
  i,j:Integer;
  S:Array[1..2] of real;
begin
  For i:=1 to 2 do
  begin
    s[i]:=0;
    For j:=0 to 4 do
     s[i]:= s[i] + strTofloatDef(sgCashUp.Cells[i,j],0);
  end;
  sgCashUp.Cells[1,6]:=FloatToStr(s[1]);
  sgCashUp.Cells[2,6]:=FloatToStr(s[2]);
end;

procedure TfmPosCashup.BtnOkClick(Sender: TObject);
Var
  i,j:Integer;
begin
  For i:=0 to 1 do
    For j:=0 to 4 do
    CashUp[i,j] := StrToFloatDef(sgCashUp.Cells[1+i,1+j],0);
  SaveCashup;
  Close;
end;

procedure TfmPosCashup.sgCashUpDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);

  procedure Display(const S: string; Alignment: TAlignment);
  const
      Formats: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  begin
    WriteText(sgCashUp.Canvas, Rect, 2, 2, S, 2);
  end;

begin
  inherited;
  if ((aRow=1) And (aCol=1)) OR (aRow=6) then
  begin
    sgCashUp.Canvas.Brush.Color := clBtnFace;
    sgCashUp.Canvas.FillRect(Rect);
  end;
  if (aCol in [1,2] ) AND(aRow>0) then
  begin
    Display(sgCashUp.Cells[aCol,aRow], taRightJustify)
  end;

end;

procedure TfmPosCashup.sgCashUpSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(aRow<>6) AND Not ((aRow=1) AND (aCol=1));
end;

procedure TfmPosCashup.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

 Caption := gettextlang(2058) ;
end;

end.
