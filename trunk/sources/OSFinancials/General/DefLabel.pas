(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DefLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ComCtrls, wwriched, Mask, wwdbedit,
  wwDataInspector, Buttons, ExtCtrls, Wwdotdot, Wwdbcomb;

type
  TfmDefLabel = class(TForm)
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    DataInspector: TwwDataInspector;
    DPaperPnl: TPanel;
    Panel1: TPanel;
    CoinGb: TShape;
    PointG: TShape;
    CoinGh: TShape;
    PointH: TShape;
    PointB: TShape;
    CoinDb: TShape;
    PointD: TShape;
    CoinDh: TShape;
    lblDesc: TLabel;
    Bevel1: TBevel;
    cbLabelDes: TComboBox;
    Label1: TLabel;
    InputFilePnl: TPanel;
    Label2: TLabel;
    edFileName: TEdit;
    btnOk2: TBitBtn;
    BtnCancel2: TBitBtn;
    shTop: TShape;
    ShLeft: TShape;
    ShVGap: TShape;
    shHGap: TShape;
    wwDBComboBox1: TwwDBComboBox;
    BottomPnl: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    BtnDelete: TBitBtn;
    procedure LinkToSylBox(Sender: TObject);
    procedure StartMove(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EndMove(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CoinGhMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure CoinDhMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CoinGbMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PointGMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PointHMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PointDMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CoinDbMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PointBMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbLabelDesChange(Sender: TObject);
    procedure btnOk2Click(Sender: TObject);
    procedure InputFilePnlExit(Sender: TObject);
    procedure BtnCancel2Click(Sender: TObject);
    procedure ShVGapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shHGapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DataInspectorItemChanged(Sender: TwwDataInspector;
      Item: TwwInspectorItem; NewValue: String);
    procedure BtnDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
      TgLabel: TControl;
      DepLimit:Integer;
      Procedure SylBoxShow(vVisible:Boolean);
      Procedure AdjshLeftTop;
      procedure AdjTblValues;
      Procedure LoadValues;
      Procedure SetToDefault;
      Procedure LoadDescriptions;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDefLabel: TfmDefLabel;

implementation

uses Database, GlobalFunctions, LanguageChoice, DatabaseAccess,
  UDMTCCoreLink;


{$R *.DFM}
Var
  DepOk:Boolean;

Procedure TfmDefLabel.SylBoxShow(vVisible:Boolean);
begin
   CoinGh.visible:=vVisible;
   CoinGb.visible:=vVisible;
   PointH.visible:=vVisible;
   PointB.visible:=vVisible;
   CoinDh.visible:=vVisible;
   PointD.visible:=vVisible;
   PointG.visible:=vVisible;
   CoinDb.visible:=vVisible;
end;

procedure TfmDefLabel.StartMove(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DepOk:=True;
end;

procedure TfmDefLabel.EndMove(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DepOk:=False;
end;

Procedure TfmDefLabel.LinkToSylBox(Sender: TObject);
begin
  TgLabel:=(Sender AS TControl);
//------- Coin Gauche Haut
   CoinGh.Left:=TgLabel.Left-3;
   CoinGh.Top:=TgLabel.Top-3;
//------- Coin Bas Gauche.
   CoinGb.Left:=CoinGh.Left;
   CoinGb.Top:=TgLabel.Height+TgLabel.Top-3;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointH.Top:=CoinGh.Top;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointB.Top:=CoinGb.Top;
//-------- Coin Droit-Haut.
   CoinDh.Left:=TgLabel.Left+TgLabel.Width -3 ;
   CoinDh.Top:=CoinGh.Top;
//------  Point  Droit.
   PointD.Left:=CoinDh.Left ;
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Left:=CoinGh.Left;
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
// ------- Coin Droit Bas
   CoinDb.Left:=CoinDh.Left;
   CoinDb.Top:=CoinGb.Top;
   SylBoxShow(True);
end;

procedure TfmDefLabel.CoinGhMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   Y:=Y-3;
   if (CoinGh.Left+X>=CoinDb.Left-DepLimit) or
      (CoinGh.Top+Y>=CoinDb.Top-DepLimit) then exit;
   TgLabel.left:=TgLabel.left+X ;
   TgLabel.Top:=TgLabel.Top+Y;
   TgLabel.Height:=TgLabel.Height-Y;
   TgLabel.Width:=TgLabel.Width-X;
// Ce Coin.
   CoinGh.Left:=CoinGh.Left+X;
   CoinGh.Top:=CoinGh.Top+Y;
//------- Coin Bas Gauche.
   CoinGb.Left:=CoinGB.Left+X;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointH.Top:=PointH.Top+y;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- Coin Droit-Haut.
   CoinDh.Top:=CoinDh.Top+Y;
//------  Point  Droit.
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Left:=PointG.Left+X;
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   AdjshLeftTop;
  end;
end;

procedure TfmDefLabel.CoinDbMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   Y:=Y-3;
   if (CoinDb.Left+X<=CoinGh.Left+DepLimit) or
      (CoinDb.Top+Y<=CoinGh.Top+DepLimit) then exit;
   TgLabel.Height:=TgLabel.Height+Y;
   TgLabel.Width:=TgLabel.Width+X;
// Ce Coin.
   CoinDb.Left:=CoinDb.Left+X;
   CoinDb.Top:=CoinDb.Top+Y;
//------- Coin Bas Gauche.
   CoinGb.Top:=CoinGB.Top+Y;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointB.Top:=PointB.Top+y;
//-------- Coin Droit-Haut.
   CoinDh.Left:=CoinDh.Left+X;
//------  Point  Droit.
   PointD.Left:=PointD.Left+X;
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.CoinDhMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   Y:=Y-3;
   if (CoinDh.Left+X<=CoinGb.Left+DepLimit) or
      (CoinDh.Top+Y>=CoinGb.Top-DepLimit) then exit;
   TgLabel.Top:=TgLabel.Top+Y;
   TgLabel.Height:=TgLabel.Height-Y;
   TgLabel.Width:=TgLabel.Width+X;
// Ce Coin.
   CoinDh.Left:=CoinDh.Left+X;
   CoinDh.Top:=CoinDh.Top+Y;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointH.Top:=PointH.Top+Y;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- Coin Gauche-Haut.
   CoinGh.Top:=CoinGh.Top+Y;
//-------- Coin Droit-Bas.
   CoinDb.Left:=CoinDb.Left+X;
//------  Point  Droit.
   PointD.Left:=PointD.Left+X;
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.CoinGbMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   Y:=Y-3;
   if (CoinGb.Left+X>=CoinDh.Left-DepLimit) or
      (CoinGb.Top+Y<=CoinDh.Top+DepLimit) then exit;
   TgLabel.Left:=TgLabel.Left+X;
   TgLabel.Height:=TgLabel.Height+Y;
   TgLabel.Width:=TgLabel.Width-X;
// Ce Coin.
   CoinGb.Left:=CoinGb.Left+X;
   CoinGB.Top:=CoinGb.Top+Y;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
   PointB.Top:=PointB.Top+Y;
//-------- Coin Gauche-Haut.
   CoinGh.Left:=CoinGh.Left+X;
//-------- Coin Droit-Bas.
   CoinDb.Top:=CoinDb.Top+Y;
//------  Point  Droit.
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   PointG.Left:=PointG.Left+X;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.PointHMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   Y:=Y-3;
   if (PointH.Top+Y>=PointB.Top-DepLimit) then exit;
   TgLabel.Height:=TgLabel.Height-Y;
   TgLabel.Top:=TgLabel.Top+Y;
// Coin Droit Haut.
   CoinDh.Top:=CoinDh.Top+Y;
//------  Point  Haut.
   PointH.Top:=PointH.Top+Y;
//-------- Coin Gauche-Haut.
   CoinGh.Top:=CoinGh.Top+Y;
//------  Point  Droit.
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.PointBMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   Y:=Y-3;
   if (PointB.Top+Y<=PointH.Top+DepLimit) then exit;
   TgLabel.Height:=TgLabel.Height+Y;
// Coin Gauche bas.
   CoinGB.Top:=CoinGb.Top+Y;
//-------- PoinT Bas.
   PointB.Top:=PointB.Top+Y;
//-------- Coin Droit-Bas.
   CoinDb.Top:=CoinDb.Top+Y;
//------  Point  Droit.
   PointD.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
//-------- PoinT Gauche.
   PointG.Top:=TgLabel.Top+(TgLabel.Height Div 2)-3;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.PointDMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   if (PointD.Left+X<=PointG.Left+DepLimit) then exit;
   TgLabel.Width:=TgLabel.Width+X;
// Coin Droit Haut.
   CoinDh.Left:=CoinDh.Left+X;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- Coin Droit-Bas.
   CoinDb.Left:=CoinDb.Left+X;
//------  Point  Droit.
   PointD.Left:=PointD.Left+X;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.PointGMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  If DepOk Then
  Begin
   X:=X-3;
   if (PointG.Left+X>=PointD.Left-DepLimit) then exit;
   TgLabel.left:=TgLabel.left+X ;
   TgLabel.Width:=TgLabel.Width-X;

// Coin gauche haut.
   CoinGh.Left:=CoinGh.Left+X;
//------- Coin Bas Gauche.
   CoinGb.Left:=CoinGB.Left+X;
//------  Point  Haut.
   PointH.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- PoinT Bas.
   PointB.Left:=TgLabel.Left+(TgLabel.Width Div 2)-3;
//-------- PoinT Gauche.
   PointG.Left:=PointG.Left+X;
   AdjshLeftTop;
  end;

end;

procedure TfmDefLabel.Label1Click(Sender: TObject);
begin
   PointG.OnMouseMove:=PointGMouseMove;
   PointH.OnMouseMove:=PointHMouseMove;
   DepLimit:=24;
   LinkToSylBox(Sender);
end;
Procedure TfmDefLabel.LoadDescriptions;
begin
   cbLabelDes.Clear;
   cbLabelDes.Items.Add('New');
   with DmDatabase do begin
     tblLabSpecs.First;
     while not tblLabSpecs.eof do begin
       cbLabelDes.Items.Add(tblLabSpecsSDescription.value);
       tblLabSpecs.Next;
     end;
   end;
end;

procedure TfmDefLabel.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(btnOk2.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel2.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnDelete.Glyph,'Cancel');





   dmDatabase.tblLabSpecs.Open;
   SylBoxShow(False);
   cbLabelDes.Clear;
   cbLabelDes.Items.Add('New');
   LoadDescriptions;
   if cbLabelDes.Items.Count>1 then begin
       cbLabelDes.ItemIndex:=1;
       dmDatabase.tblLabSpecs.First;
       DepLimit:=24;
//       LinkToSylBox(Label1);
       LoadValues;
   end
   else
     AdjshLeftTop;
   If DepLimit<5 then DepLimit:=5;

end;

procedure TfmDefLabel.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblLabSpecs.edit;
  dmDatabase.tblLabSpecs.Post;
  close;
end;

Procedure ArrangeLbls(TopMg,LeftMg,LblHg,LblWd,PageHg,PageWd,VertGp,HorGap,AccrNbr,DnNbr:word);
Var
 TmpAccrNbr,TmpDnNbr:Word;
 xLabel:TLabel;
begin

end;

procedure TfmDefLabel.cbLabelDesChange(Sender: TObject);
begin
  if Uppercase(cbLabelDes.text)='NEW' then begin
    DataInspector.Visible:=False;
    InputFilePnl.Visible:=True;
    btnOk.Enabled:=False;
    btncancel.Enabled:=False;
    edFileName.SetFocus;
  end
  else
  begin
    dmDatabase.tblLabSpecs.edit;
    dmDatabase.tblLabSpecs.Post;
    dmDatabase.tblLabSpecs.Locate('SDescription',cbLabelDes.text,[]);
    LoadValues;
  end;
end;

procedure TfmDefLabel.btnOk2Click(Sender: TObject);
begin
  DataInspector.Visible:=True;
  btnOk.Enabled:=True;
  ScrollBox1.SetFocus;

end;

procedure TfmDefLabel.InputFilePnlExit(Sender: TObject);
begin
  if DataInspector.Visible=False then
  showMessage(gettextlang(2100));
  InputFilePnl.Visible:=False;
  btncancel.Enabled:=True;
  if btnOk.Enabled=True then begin
    dmDatabase.tblLabSpecs.Insert;
    dmDatabase.tblLabSpecsSDescription.Value:=edFileName.Text;
    SetTODefault;
    dmDatabase.tblLabSpecs.Post;
    dmDatabase.tblLabSpecs.Locate('SDescription',edFileName.Text,[]);
    LoadDescriptions;
  end
  else
    btnOk.Enabled:=True;
end;

procedure TfmDefLabel.BtnCancel2Click(Sender: TObject);
begin
  DataInspector.Visible:=True;
  ScrollBox1.SetFocus;
end;

Procedure TfmDefLabel.AdjshLeftTop;
begin
  AdjTblValues;
  if (TgLabel=ShVGap) or (TgLabel=ShHGap) then exit;
  try
    ShTop.Height:=Label1.Top;
    ShLeft.width:=Label1.Left;
    ShVGap.Left:=Label1.Left+Label1.Width;
    ShHGap.Top:=Label1.Top+Label1.Height;
  except
  end;

  Panel1.Repaint;
end;

procedure TfmDefLabel.ShVGapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TgLabel<>ShVGap then begin
    DepLimit:=5;
    TgLabel:=ShVGap;
    LinkToSylBox(TgLabel);
    PointG.OnMouseMove:=Nil;
  end;
end;

procedure TfmDefLabel.shHGapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if TgLabel<>shHGap then begin
    DepLimit:=5;
    TgLabel:=shHGap;
    LinkToSylBox(TgLabel);
    PointH.OnMouseMove:=Nil;
  end;
end;

procedure TfmDefLabel.AdjTblValues;
begin
  With dmDatabase do Begin
    tblLabSpecs.Edit;
  // Item 1 Page
    // 0: Width
//    DataInspector.Items[1].Items[0].Field.AsString:='210';
    // 1: Height
//    DataInspector.Items[1].Items[1].Field.AsString:='297';
    // 2 : Top Margin
    DataInspector.Items[1].Items[2].Field.AsString:=IntToStr(Label1.Top  Div 3);
    // 3 : Left Margin
    DataInspector.Items[1].Items[3].Field.AsString:=IntToStr(Label1.Left Div 3);
  // Item 2 Labels
    // 0: Width
    DataInspector.Items[2].Items[0].Field.AsString:=IntToStr(Label1.Width Div 3);
    // 1: Height
    DataInspector.Items[2].Items[1].Field.AsString:=IntToStr(Label1.Height Div 3);
    // 2 : Accross
//    DataInspector.Items[2].Items[2].Field.AsString:='3';
    // 3 : Down
//    DataInspector.Items[2].Items[3].Field.AsString:='8';
  // Item 3 Gaps
    // 0: Vert
    DataInspector.Items[3].Items[0].Field.AsString:=IntToStr(ShVGap.Width Div 3);
    // 1: Horiz
    DataInspector.Items[3].Items[1].Field.AsString:=IntToStr(ShHGap.Height Div 3);
  end;
end;

procedure TfmDefLabel.DataInspectorItemChanged(Sender: TwwDataInspector;
  Item: TwwInspectorItem; NewValue: String);
begin
  LoadValues;
end;

procedure TfmDefLabel.LoadValues;
begin
  With DmDatabase do begin
   Label1.Top:=Str2Int(tblLabSpecsFTopMargin.AsString)*3;
   Label1.Left:=Str2Int(tblLabSpecsFLeftMargin.AsString)*3;
   Label1.Height:=Str2Int(tblLabSpecsFHeight.AsString)*3;
   Label1.Width:=Str2Int(tblLabSpecsFWidth.AsString)*3;
   ShHGap.Height:=Str2Int(tblLabSpecsFHGap.AsString)*3;
   ShVGap.Width:=Str2Int(tblLabSpecsFVGap.AsString)*3;
   AdjshLeftTop;
   LinkToSylBox(Label1);
  end;
end;

Procedure  TfmDefLabel.SetTODefault;
begin
  With dmDatabase do Begin
    tblLabSpecs.Edit;
  // Item 1 Page
    // 0: Width
    DataInspector.Items[1].Items[0].Field.AsString:='210';
    // 1: Height
    DataInspector.Items[1].Items[1].Field.AsString:='297';
    // 2 : Top Margin
    DataInspector.Items[1].Items[2].Field.AsString:='5';
    // 3 : Left Margin
    DataInspector.Items[1].Items[3].Field.AsString:='0';
  // Item 2 Labels
    // 0: Width
    DataInspector.Items[2].Items[0].Field.AsString:='70';
    // 1: Height
    DataInspector.Items[2].Items[1].Field.AsString:='35';
    // 2 : Accross
    DataInspector.Items[2].Items[2].Field.AsString:='3';
    // 3 : Down
    DataInspector.Items[2].Items[3].Field.AsString:='8';
  // Item 3 Gaps
    // 0: Vert
    DataInspector.Items[3].Items[0].Field.AsString:='1';
    // 1: Horiz
    DataInspector.Items[3].Items[1].Field.AsString:='1';
  end;
  LoadValues;
end;

procedure TfmDefLabel.BtnDeleteClick(Sender: TObject);
begin
  if OSFMessageDlg(GetTextLang(715){'Do want to delete this label definitions ?'},mtInformation,[mbYes,mbNo],0)=mrYes then begin
    try dmDatabase.tblLabSpecs.Delete; except end;
    if dmDatabase.tblLabSpecs.RecNo>0 then LoadValues
     else
      ;
    LoadDescriptions;
  end;
end;

procedure TfmDefLabel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDatabase.tblLabSpecs.close;
end;

procedure TfmDefLabel.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(218);
             key := 0;

        end;
end;

procedure TfmDefLabel.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

end.
