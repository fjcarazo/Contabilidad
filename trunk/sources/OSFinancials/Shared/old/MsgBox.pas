(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit MsgBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ExtCtrls, StdCtrls, Buttons;

type
  TMyMsgBox = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    ImInformation: TImage;
    ImError: TImage;
    ImWarning: TImage;
    ImConfirmation: TImage;
    ImCustom: TImage;
    PnlBas: TPanel;
    BtnG: TBitBtn;
    BtnD: TBitBtn;
    BtnM: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TMemo;
    Panel6: TPanel;
    tcxTitle: TLabel;
    tcxShape: TShape;
    procedure Label1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams);override ;
  public
    AllowFocus : Boolean ;
  end;



var
  sMsg: string;
  sAType: TMsgDlgType;
  sAButtons: TMsgDlgButtons;
  sHelpCtx: Longint;
  sBtn1,sBtn2,sBtn3:Smallint;
  BtnID: Array [1..4] of byte;
  {}


  Function OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
      AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false): Word;


implementation

uses HtmlHelpAPI, UDMTCCoreLink; //, TcVariables ;

{$R *.DFM}

Function OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
      AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false): Word;
// Totaly created by sylvain for Tcash needs.
Var
  NbrBtn,
  BtnType:Byte;
  aWidth,aHeight,i : Integer ;
  ACanvas : TControlCanvas ;
  aMyMsgBox: TMyMsgBox;
begin



  sMsg:=Msg;
  sAType:=Atype;
  sAButtons:=Abuttons;
  sHelpCtx:=HelpCtx;
  aMyMsgBox:= TMyMsgBox.Create(nil);
  try
  With aMyMsgBox do
  begin
    Label1.ScrollBars := ssNone ;
    AllowFocus := false ;
    Label1.WordWrap := true ;
    Visible:=False;
    tcxTitle.Caption := DMTCCoreLink.GetTextLang(1168);//Please read this
    Label1.Text:=Msg;
    Width:=600;
    aWidth := 0 ;
    aHeight :=0 ;
    ACanvas := TControlCanvas.create ;
    try
    ACanvas.Control := aMyMsgBox.Label1 ;
    
    for i := 0 to aMyMsgBox.Label1.Lines.count -1 do
     begin
    // use message box so the width is calculates correctly
      if aWidth < Canvas.TextWidth(aMyMsgBox.Label1.Lines[i]) then
       aWidth :=  Canvas.TextWidth(aMyMsgBox.Label1.Lines[i]);
      aHeight := aHeight + ACanvas.TextHeight(aMyMsgBox.Label1.Lines[i]) + 2;
     end;
    if aWidth < 150 then aWidth := 150 ;
    Width := 102 + aWidth ;
    Height := 90 + aHeight;
    Height := 0 ;
    // recalc with new width for wordwrap
    for i := 0 to aMyMsgBox.Label1.Lines.count -1 do
     begin
      if aWidth < Canvas.TextWidth(aMyMsgBox.Label1.Lines[i]) then
       aWidth :=  Canvas.TextWidth(aMyMsgBox.Label1.Lines[i]);
      aHeight := aHeight + ACanvas.TextHeight(aMyMsgBox.Label1.Lines[i]) ;
     end;
    if aWidth < 150 then aWidth := 150 ;
    Width := 102 + aWidth ;

    Height := round((90 / 96) * Screen.PixelsPerInch) + aHeight;
    if Height < (ImWarning.Height + Panel6.Height + PnlBas.Height + 30) then
      Height := (ImWarning.Height + Panel6.Height + PnlBas.Height + 30) ;


    
    finally
      ACanvas.free ;
    end;

    BtnG.visible:=False;
    BtnM.visible:=False;
    BtnD.visible:=False;
    ImInformation.Visible:=False;
    ImConfirmation.Visible:=False;
    ImError.Visible:=False;
    ImWarning.Visible:=False;
    ImCustom.Visible:=False;
    NbrBtn:=0;
    BtnType:=0;
    If mbOk in sAbuttons then
    begin // 1
      Inc(NbrBtn);
      BtnID[NbrBtn]:=3;
      BtnType:=1;
    end;
    If mbYes in sAbuttons then
    begin //2
      Inc(NbrBtn);
      BtnID[NbrBtn]:=1;
      BtnType:=BtnType+2;
    end;
    If mbNo in sAbuttons then
    begin //4
      Inc(NbrBtn);
      BtnID[NbrBtn]:=2;
      BtnType:=BtnType+4;
    end;
    If mbCancel in sAbuttons then
    begin //8
      Inc(NbrBtn);
      BtnID[NbrBtn]:=4;
      BtnType:=BtnType+8;
    end;
    //Update Btns

    Case NbrBtn of
    0,1:
      begin
       BtnM.Visible:=True;
       BtnM.Left:=trunc(PnlBas.Width/2-BtnM.Width/2) ;
       BtnG.Kind:=BkOk;
       BtnM.Caption:= DMTCCoreLink.GetTextLang(167); { Ok }
       DMTCCoreLink.LoadImage(BtnM.Glyph,'OK');
       BtnM.NumGlyphs := 1 ;
      end;
    else
      begin
         BtnG.visible:=true;BtnD.visible:=true;
         BtnG.Left:=Trunc(PnlBas.Width/2-(BtnG.Width*2+12)/2);
         BtnD.Left:=BtnG.Left+BtnG.Width+12;
         Case BtnType of
         9: begin // Ok, Cancel
              BtnG.Kind:=BkOk;
              BtnD.Kind:=BkCancel;
              BtnG.Caption:=DMTCCoreLink.GetTextLang(167); { Ok }
              BtnD.Caption:=DMTCCoreLink.GetTextLang(168); { Cancel }
              BtnD.NumGlyphs := 1 ;
              BtnG.NumGlyphs := 1 ;

              DMTCCoreLink.LoadImage(Btng.Glyph,'OK');
              DMTCCoreLink.LoadImage(Btnd.Glyph,'cancel');
            end;
         Else
           BtnG.Kind:=BkYes;
           BtnD.Kind:=BkNo;
           BtnG.Caption:=DMTCCoreLink.GetTextLang(2); { Yes }
           BtnD.Caption:=DMTCCoreLink.GetTextLang(1); { No }
           BtnD.NumGlyphs := 1 ;
           BtnG.NumGlyphs := 1 ;

           DMTCCoreLink.LoadImage(Btng.Glyph,'OK');
           DMTCCoreLink.LoadImage(Btnd.Glyph,'cancel');


         End
      end
    end;
    // Updating Image and Title;
   Caption:=Application.Title+'  ';
   If sAType=mtWarning then
   begin
     ImWarning.Visible:=True;
     Caption:=Caption+DMTCCoreLink.GetTextLang(630); { Warning }
   end
   else if  sAType=mtError then
   begin
     ImError.Visible:=True;
     Caption:=Caption+DMTCCoreLink.GetTextLang(588); { Error }
   end
   else if sAType=mtInformation then
   begin
     ImInformation.Visible:=True;
     Caption:=Caption+DMTCCoreLink.GetTextLang(629); { Information }
   end
   else if  sAType=mtConfirmation then
   begin
     ImConfirmation.Visible:=True;
     Caption:=Caption+DMTCCoreLink.GetTextLang(628); { Confirmation }
   end
   else if sAType=mtCustom then
   begin
     Caption:=Application.Title;
   end;
   if AsMemo then
      begin
        Width := 500 ;
        Height := 400 ;
        left := (Screen.Monitors[0].Width div 2) - 250 ;
        Top  := (Screen.Monitors[0].Height div 2) - 200 ;
        Label1.ScrollBars := ssBoth ;
        AllowFocus := true ;
       // Label1.Enabled := true ;
        Label1.WordWrap := false ;
      end;
   result := ShowModal;
  end ;
  finally
     aMyMsgBox.free ;
  end;

end;


procedure TMyMsgBox.Label1Enter(Sender: TObject);
begin
  if not AllowFocus then
  PnlBas.SetFocus;
end;

procedure TMyMsgBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 112) AND (sHelpCtx>0) then
  begin
      HtmlHelpShowContentID(sHelpCtx);
    key := 0;
  end;
end;




procedure TMyMsgBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Action := cafree;
end;

procedure TMyMsgBox.FormShow(Sender: TObject);
begin
 BringToFront ;
 ImWarning.Left := 17 ;
 ImCustom.Left := 17 ;
 ImInformation.Left := 17 ;
 ImError.Left := 17 ;
 ImConfirmation.Left := 17 ;
 ImWarning.top := 11 ;
 ImCustom.top := 11 ;
 ImInformation.top := 11 ;
 ImError.top := 11 ;
 ImConfirmation.top := 11 ;
end;

procedure TMyMsgBox.CreateParams(var Params : TCreateParams);
begin
  inherited CreateParams(Params);
{  if IsRightToLeftText then
  begin
  Params.ExStyle := Params.ExStyle or WS_EX_LEFT or $00400000 or WS_EX_RIGHT ;
  Params.WndParent := GetDesktopWindow;
  end ;
                                                 }
 {WS_EX_LEFT to set the text caption to the right,
  use WS_EX_RIGHT to set the caption to the left}
end;

end.
