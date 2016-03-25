unit Calculator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfrmCalculator = class(TForm)
    Bevel1: TBevel;
    ScrDisplay: TLabel;
    btnMc: TBitBtn;
    btnMr: TBitBtn;
    btnTcm: TBitBtn;
    btnMp: TBitBtn;
    btn7: TBitBtn;
    btn4: TBitBtn;
    btn1: TBitBtn;
    btn0: TBitBtn;
    btn8: TBitBtn;
    btn5: TBitBtn;
    btn2: TBitBtn;
    btnpsms: TBitBtn;
    btn9: TBitBtn;
    btn6: TBitBtn;
    btn3: TBitBtn;
    btnDot: TBitBtn;
    BtnDiv: TBitBtn;
    btnTimes: TBitBtn;
    btnMinus: TBitBtn;
    btnPlus: TBitBtn;
    BtnSqrt: TBitBtn;
    BitBtn22: TBitBtn;
    BtnInv: TBitBtn;
    BtnEqual: TBitBtn;
    BtnClear: TBitBtn;
    BtnTrans: TBitBtn;
    BtnBackSp: TBitBtn;
    btnOpP: TBitBtn;
    BtnClp: TBitBtn;
    BtnSum: TBitBtn;
    BtnAvg: TBitBtn;
    BtnFocus: TBitBtn;
    lblMem: TLabel;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnEqualClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBackSpClick(Sender: TObject);
    procedure BtnTransClick(Sender: TObject);
    procedure btnTcmClick(Sender: TObject);
    procedure BtnSumClick(Sender: TObject);
    procedure BtnAvgClick(Sender: TObject);
    procedure btnMpClick(Sender: TObject);
    procedure btnMrClick(Sender: TObject);
    procedure btnMcClick(Sender: TObject);
    procedure BtnInvClick(Sender: TObject);
    procedure BtnSqrtClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    BOper : Boolean;
    NewExp : Integer;
    CalMem :Real;
    Procedure Display;
    Procedure AddDigit(S:Char);
    Procedure CheckFirst;
    Procedure ReCallMems(MemVal:Real);
    Procedure ShowMems;
    { Private declarations }
  public
    StrExpres :String;
    GetResult :Boolean;
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;
  TcMem : Real;
implementation

uses EvaluateExpressions,Udmtccorelink;

{$R *.DFM}

Procedure TfrmCalculator.ShowMems;
begin

end;

Procedure TfrmCalculator.CheckFirst;
begin
  if NewExp=-1 then
  begin
    StrExpres:='';
    NewExp:=0
  end;
end;

Procedure TfrmCalculator.ReCallMems(MemVal:Real);
begin
  if (NewExp=-1) Or (Not BOper) then
  begin
    StrExpres:='';
    NewExp:=0
  end;
  If (FloatToStr(MemVal)<>'0') then
    StrExpres:=StrExpres+FloatToStr(MemVal);
  Display;
end;

Procedure TfrmCalculator.Display;
begin
  StrExpres:=Trim(StrExpres);
  if StrExpres='' then
   ScrDisplay.Caption:='0.'
  else
   ScrDisplay.Caption:= StrExpres;
end;

Procedure TfrmCalculator.AddDigit(S:Char);
begin
  if NewExp=-1 then
  begin
    if Pos(s,'*-+/')=0 then
      StrExpres:='';
    NewExp:=0
  end;
  If (s='0') AND ((StrExpres='0.') Or (StrExpres='0')) then
    StrExpres:='0.'
  else
    StrExpres:=StrExpres+S;
  Display;
end;

procedure TfrmCalculator.FormShow(Sender: TObject);
begin
//  Caption := GetTextLang(1092);
//  BtnTrans.Caption := GetTextLang(1094);
//  BtnBackSp.Caption := GetTextLang(1093);

  NewExp:=0;
  StrExpres:='';
  Display;
  CalMem :=0;
  GetResult:=False;
  Caption := DMTCCoreLink.GetTextLang(1092);
  BtnTrans.Caption := DMTCCoreLink.GetTextLang(1094);
  BtnBackSp.Caption := DMTCCoreLink.GetTextLang(1093);
  StatusBar1.Panels[0].Text:='';
  if TcMem<>0 then
    StatusBar1.Panels[0].Text:=FloatToStr(TcMem);
end;



procedure TfrmCalculator.btn0Click(Sender: TObject);
Var
  S:String;
begin
  S:=(Sender As TBitBtn).Caption;
  AddDigit(s[1]);
  BtnFocus.SetFocus;
  BOper:=False;
  if Pos(s,'*-+/')<> 0 then
    BOper:=True;
end;

procedure TfrmCalculator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  BtnFocus.SetFocus;
  Case Key of
  '0'..'9','('..'+','-'..'/',':':
    begin
      AddDigit(Key);
      Key:=#0;
    end;
  'x','X':begin
      BtnInvClick(Sender);
      Key:=#0;
     end;
  'a','A':begin
      BtnAvgClick(Sender);
      Key:=#0;
     end;
  's','S':begin
      BtnSumClick(Sender);
      Key:=#0;
     end;
  'r','R':begin
     BtnSqrtClick(Sender);
      Key:=#0;
     end;
  #27:begin
      if (StrExpres='') or (StrExpres='0.') or (StrExpres='0') then
        Close
      else
        BtnClearClick(Sender);
      Key:=#0;
     end;
  #8:begin
      BtnBackSpClick(Sender);
      Key:=#0;
     end;
  end;
end;

procedure TfrmCalculator.BtnClearClick(Sender: TObject);
begin
  BtnFocus.SetFocus;
  StrExpres:='';
  Display ;
end;

procedure TfrmCalculator.BtnEqualClick(Sender: TObject);
begin
  BtnFocus.SetFocus;
  NewExp:=-1;
  StrExpres:=Calc(StrExpres);
  Display;
end;

procedure TfrmCalculator.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   BtnFocus.SetFocus;
   Case Key of
   13:begin
        Key:=0;
        BtnEqualClick(Sender);
      end;
   116:begin
        Key:=0;
        BtnTransClick(Sender);
      end;
   end;
end;

procedure TfrmCalculator.BtnBackSpClick(Sender: TObject);
begin
   BtnFocus.SetFocus;
//   if Length(StrExpres)>0 then
  Delete(StrExpres,Length(StrExpres),1);
  Display;
end;

procedure TfrmCalculator.BtnTransClick(Sender: TObject);
begin
  BtnFocus.SetFocus;
  GetResult:=True;
  Close;
end;

procedure TfrmCalculator.btnTcmClick(Sender: TObject);
begin
  ReCallMems(TcMem);
end;

procedure TfrmCalculator.BtnSumClick(Sender: TObject);
begin
  CheckFirst;
  StrExpres:=StrExpres+'Sum(';
  Display;
  BtnFocus.SetFocus;
end;

procedure TfrmCalculator.BtnAvgClick(Sender: TObject);
begin
  CheckFirst;
  StrExpres:=StrExpres+'Avg(';
  Display;
  BtnFocus.SetFocus;
end;

procedure TfrmCalculator.btnMpClick(Sender: TObject);
begin
  lblMem.Caption:='';
  CalMem:=CalMem+StrToFloatDef(StrExpres,0);
  BtnFocus.SetFocus;
  StatusBar1.Panels[1].Text:='';
  if CalMem<>0 then
  begin
    NewExp:=-1;
      ShowMems;
    if CalMem<0 then
      lblMem.Caption:='-M';
    if CalMem>0 then
      lblMem.Caption:='+M';
    if CalMem<>0 then
      StatusBar1.Panels[1].Text:=FloatToStr(CalMem);
  end;
end;

procedure TfrmCalculator.btnMrClick(Sender: TObject);
begin
  ReCallMems(CalMem);
end;

procedure TfrmCalculator.btnMcClick(Sender: TObject);
begin
  lblMem.Caption:='';
  CalMem:=0;
end;

procedure TfrmCalculator.BtnInvClick(Sender: TObject);
begin
  StrExpres:=StrExpres+'Inv(';
  Display;
  BtnFocus.SetFocus;
end;

procedure TfrmCalculator.BtnSqrtClick(Sender: TObject);
begin
  StrExpres:=StrExpres+'Sqrt(';
  Display;
  BtnFocus.SetFocus;
end;

procedure TfrmCalculator.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             // HtmlShowTopic(236);
             key := 0;

        end;
end;

procedure TfrmCalculator.FormCreate(Sender: TObject);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)
 btnDot.Caption := DecimalSeparator ;
end;

end.
