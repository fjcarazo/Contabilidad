(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit UMsgBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ExtCtrls, StdCtrls, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage;

type
  TMyMsgBox = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    ImInformation: TcxImage;
    ImError: TcxImage;
    ImWarning: TcxImage;
    ImConfirmation: TcxImage;
    ImCustom: TcxImage;
    PnlBas: TPanel;
    BtnG: TBitBtn;
    BtnD: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TMemo;
    Panel6: TPanel;
    tcxTitle: TLabel;
    tcxShape: TShape;
    BtnY: TBitBtn;
    PHelp: TPanel;
    cbHaveRead: TCheckBox;
    BtnM: TBitBtn;
    procedure Label1Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbHaveReadClick(Sender: TObject);
  protected
    sMsg: string;
    sAType: TMsgDlgType;
    sAButtons: TMsgDlgButtons;
    sHelpCtx: Longint;
    sBtn1,sBtn2,sBtn3,sBtn4:Smallint;
    BtnID: Array [1..5] of byte;
    AllowFocus : Boolean ;
  public



  end;
Function OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
      AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false;FontStr : String = ''): Word;
  
implementation

uses HtmlHelpAPI,UdmTCCoreLink;

{$R *.DFM}

Function OSFMessageDlg(const Msg: string;AType: TMsgDlgType;
      AButtons: TMsgDlgButtons;HelpCtx: Longint;AsMemo:Boolean=false;FontStr : String = ''): Word;
// Totaly created by sylvain for Tcash needs.
Var
  NbrBtn,
  BtnType:Byte;
  aWidth,aHeight,i : Integer ;
  MyMsgBox : TMyMsgBox ;
  LastBtn : TWinControl ;
begin

  MyMsgBox := TMyMsgBox.Create(screen.ActiveForm) ;
  try

  With MyMsgBox do
  begin

    sMsg:=Msg;
    sAType:=Atype;
    sAButtons:=Abuttons;
    sHelpCtx:=HelpCtx;
    Label1.ScrollBars := ssNone ;
    AllowFocus := false ;
    Label1.WordWrap := true ;
    Visible:=False;
    tcxTitle.Caption := dmTCCoreLink.GetTextLang(1168);//Please read this
    if FontStr <> '' then
      Label1.Font.Name := FontStr ;
    Label1.Text:=Msg;
    Width:=600;
    aWidth := 0 ;
    aHeight :=0 ;
    for i := 0 to MyMsgBox.Label1.Lines.count -1 do
     begin
      if aWidth < MyMsgBox.Canvas.TextWidth(MyMsgBox.Label1.Lines[i]) then
       aWidth :=  MyMsgBox.Canvas.TextWidth(MyMsgBox.Label1.Lines[i]);
      aHeight := aHeight + MyMsgBox.Canvas.TextHeight(MyMsgBox.Label1.Lines[i]);
     end;
    if aWidth < 150 then aWidth := 150 ; 
    Width := 102 + aWidth ;
    Height := 140 + aHeight;
    BtnG.visible:=False;
    BtnM.visible:=False;
    BtnD.visible:=False;

    BtnY.visible:=False;
    BtnD.NumGlyphs := 1 ;
    BtnM.NumGlyphs := 1 ;
    BtnG.NumGlyphs := 1 ;
    BtnY.NumGlyphs := 1 ;

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
       LastBtn  := BtnG ;
        BtnG.visible:=true;
       BtnG.Left:=trunc(PnlBas.Width/2-BtnG.Width/2) ;
       BtnG.Kind:=BkOk;
       BtnG.NumGlyphs := 1 ;

       BtnG.Caption:=dmTCCoreLink.GetTextLang(167); { Ok }
       DMTCCoreLink.LoadImage(BtnG.Glyph,'Ok');
       if BtnG.Glyph.Width > 20 then
           BtnG.NumGlyphs := 2 ;
      end;
    else
      begin
         BtnG.visible:=true;
         BtnD.visible:=true;
         BtnG.Left:=Trunc(PnlBas.Width/2-(BtnG.Width*2+12)/2);
         LastBtn  := BtnD ;
         BtnD.Left:=BtnG.Left+BtnG.Width+12;
         DMTCCoreLink.LoadImage(BtnG.Glyph,'Ok');
          if BtnG.Glyph.Width > 20 then
           BtnG.NumGlyphs := 2 ;

         DMTCCoreLink.LoadImage(BtnD.Glyph,'Cancel');
         if BtnD.Glyph.Width > 20 then
           BtnD.NumGlyphs := 2 ;
         Case BtnType of
         9: begin // Ok, Cancel
              BtnG.Kind:=BkOk;
              BtnD.Kind:=BkCancel;
              BtnD.NumGlyphs := 1 ;
              BtnG.NumGlyphs := 1 ;
              BtnG.Caption:=dmTCCoreLink.GetTextLang(167); { Ok }
              BtnD.Caption:=dmTCCoreLink.GetTextLang(168); { Cancel }
             DMTCCoreLink.LoadImage(BtnG.Glyph,'Ok');
             if BtnG.Glyph.Width > 20 then
               BtnG.NumGlyphs := 2 ;
             DMTCCoreLink.LoadImage(BtnD.Glyph,'cancel');
              if BtnD.Glyph.Width > 20 then
                BtnD.NumGlyphs := 2 ;

            end;
         Else
           BtnG.Kind:=BkYes;
           BtnD.Kind:=BkNo;
           BtnD.NumGlyphs := 1 ;
           BtnG.NumGlyphs := 1 ;
           BtnG.Caption:=dmTCCoreLink.GetTextLang(2); { Yes }
           BtnD.Caption:=dmTCCoreLink.GetTextLang(1); { No }
           DMTCCoreLink.LoadImage(BtnG.Glyph,'Yes');
           if BtnG.Glyph.Width > 20 then
             BtnG.NumGlyphs := 2 ;
           DMTCCoreLink.LoadImage(BtnD.Glyph,'No');
            if BtnD.Glyph.Width > 20 then
             BtnD.NumGlyphs := 2 ;
         End
      end
    end;
   { BtnD.NumGlyphs := 1 ;
    BtnM.NumGlyphs := 1 ;
    BtnG.NumGlyphs := 1 ;
    BtnY.NumGlyphs := 1 ;  }
    If mbAll in sAbuttons then
     if LastBtn <> nil then
    begin //8
      DMTCCoreLink.LoadImage(BtnY.Glyph,'YesToall');
      if BtnY.Glyph.Width > 20 then
             BtnY.NumGlyphs := 2 ;
      BtnY.Left:=LastBtn.Left+LastBtn.Width+12;
      BtnY.Visible := True ;
      if  Width < BtnY.Left + BtnY.Width + 12 then
         Width := BtnY.Left + BtnY.Width + 12 ;
    end;

    // Updating Image and Title;
   Caption:=Application.Title+'  ';
   If sAType=mtWarning then
   begin
     ImWarning.Visible:=True;
     Caption:=Caption+dmTCCoreLink.GetTextLang(630); { Warning }
     DMTCCoreLink.LoadImage(ImWarning.Picture.Bitmap,'Warning',48);

   end
   else if  sAType=mtError then
   begin
     ImError.Visible:=True;
     Caption:=Caption+dmTCCoreLink.GetTextLang(588); { Error }
     DMTCCoreLink.LoadImage(ImError.Picture.Bitmap,'Error',48);
   end
   else if sAType=mtInformation then
   begin
     ImInformation.Visible:=True;
     Caption:=Caption+dmTCCoreLink.GetTextLang(629); { Information }
     DMTCCoreLink.LoadImage(ImInformation.Picture.Bitmap,'Information',48);
   end
   else if  sAType=mtConfirmation then
   begin
     ImConfirmation.Visible:=True;
     Caption:=Caption+dmTCCoreLink.GetTextLang(628); { Confirmation }
     DMTCCoreLink.LoadImage(ImConfirmation.Picture.Bitmap,'Confirmation',48);
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
        Constraints.MaxHeight := 0 ;
        Constraints.MaxWidth := 0 ;
      end;

   if (mbHelp in AButtons) then
     begin


      PHelp.Visible := True ;
      PnlBas.Visible := False ;
      cbHaveRead.Caption := DMTCCoreLink.GetTextLangNoAmp(3471) ;
     end;
   result := MyMsgBox.ShowModal;
  end  ;
  finally
    MyMsgBox.free ;
  end;
end;


procedure TMyMsgBox.Label1Enter(Sender: TObject);
begin
  if not AllowFocus then
  if PnlBas.CanFocus then
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


procedure TMyMsgBox.cbHaveReadClick(Sender: TObject);
begin


 PnlBas.Visible := cbHaveRead.Checked ;
 PHelp.Visible := False ;
end;

end.
