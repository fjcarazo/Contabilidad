
{*******************************************************************}
{                                                                   }
{   dxCheckControls (Design eXperience)                             }
{     - TdxCheckbox                                                 }
{                                                                   }
{   Copyright (c) 2002 APRIORI business solutions AG                }
{   (W)ritten by M. Hoffmann - ALL RIGHTS RESERVED.                 }
{                                                                   }
{   DEVELOPER NOTES:                                                }
{   ==========================================================      }
{   This file is part of a component suite called Design            }
{   eXperience and may be used in freeware- or commercial           }
{   applications. The package itself is distributed as              }
{   freeware with full sourcecodes.                                 }
{                                                                   }
{   Feel free to fix bugs or include new features if you are        }
{   familiar with component programming. If so, please email        }
{   me your modifications, so it will be possible for me to         }
{   include nice improvements in further releases:                  }
{                                                                   }
{*******************************************************************}

unit dxCheckCtrls;

interface

uses
  Windows, Graphics, Classes, Controls, dxCore, dxCoreUtils;

type
{ TdxCustomCheckControl }

  TdxCustomCheckControl = class(TdxCustomStyleControl)
  private
    { Private declarations }
    FBgGradient: TBitmap;
    FBoundLines: TdxBoundLines;
    FChecked: Boolean;
    FCheckSize: Byte;
    FCkGradient: TBitmap;
    FHlGradient: TBitmap;
    FSpacing: Byte;
  protected
    { Protected declarations }
    procedure SetBoundLines(Value: TdxBoundLines); virtual;
    procedure SetChecked(Value: Boolean); virtual;
    procedure SetSpacing(Value: Byte); virtual;
    procedure DrawCheckSymbol(const R: TRect); virtual; abstract;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    procedure Paint; override;
    procedure HookResized; override;
  published
    { Published declarations }

    // common properties.
    property Caption;
    property Enabled;
    property TabOrder;
    property TabStop default True;

    // advanced properties.
    property BoundLines: TdxBoundLines read FBoundLines write SetBoundLines
      default [];
    property Checked: Boolean read FChecked write SetChecked default False;
    property Spacing: Byte read FSpacing write SetSpacing default 3;
  end;

{ TdxCheckbox }

  TdxCheckbox = class(TdxCustomCheckControl)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure DrawCheckSymbol(const R: TRect); override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

implementation

{ TdxCustomCheckControl }

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.Create
  Author:    mh
  Date:      02-Mai-2002
  Arguments: AOwner: TComponent
  Result:    None
-----------------------------------------------------------------------------}

constructor TdxCustomCheckControl.Create(AOwner: TComponent);
begin
  inherited;

  // set default properties.
  ControlStyle := ControlStyle - [csDoubleClicks];
  Height := 17;
  TabStop := True;
  Width := 161;

  // set custom properties.
  FBoundLines := [];
  FChecked := False;
  FCheckSize := 13;
  FSpacing := 3;

  // create ...
  FBgGradient := TBitmap.Create; // background gradient
  FCkGradient := TBitmap.Create; // clicked gradient
  FHlGradient := TBitmap.Create; // Highlight gradient
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.Destroy
  Author:    mh
  Date:      08-Mai-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

destructor TdxCustomCheckControl.Destroy;
begin
  FBgGradient.Free;
  FCkGradient.Free;
  FHlGradient.Free;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.Click
  Author:    mh
  Date:      10-Mai-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.Click;
begin
  FChecked := not FChecked;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.HookResized
  Author:    mh
  Date:      08-Mai-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.HookResized;
begin
  //
  // create gradient rectangles for...
  //

  // background.
  dxCreateGradientRect(FCheckSize - 2, FCheckSize - 2, dxColor_Btn_Enb_BgFrom_WXP,
    dxColor_Btn_Enb_BgTo_WXP, 16, gsTop, False, FBgGradient);

  // clicked.
  dxCreateGradientRect(FCheckSize - 2, FCheckSize - 2, dxColor_Btn_Enb_CkFrom_WXP,
    dxColor_Btn_Enb_CkTo_WXP, 16, gsTop, True, FCkGradient);

  // highlight.
  dxCreateGradientRect(FCheckSize - 2, FCheckSize - 2, dxColor_Btn_Enb_HlFrom_WXP,
    dxColor_Btn_Enb_HlTo_WXP, 16, gsTop, True, FHlGradient);

  // redraw.
  if not IsLocked then
    Invalidate;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.SetBoundLines
  Author:    mh
  Date:      08-Mai-2002
  Arguments: Value: TdxBoundLines
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.SetBoundLines(Value: TdxBoundLines);
begin
  if Value <> FBoundLines then
  begin
    FBoundLines := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.SetChecked
  Author:    mh
  Date:      08-Mai-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.SetChecked(Value: Boolean);
begin
  if Value <> FChecked then
  begin
    FChecked := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.SetSpacing
  Author:    mh
  Date:      08-Mai-2002
  Arguments: Value: Byte
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.SetSpacing(Value: Byte);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomCheckControl.Paint
  Author:    mh
  Date:      08-Mai-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomCheckControl.Paint;
var
  Rect: TRect;
  BoundColor: TColor;
begin
  with Canvas do
  begin
    // clear background.
    Rect := GetClientRect;
    Brush.Color := TdxWinControl(Parent).Color;
    FillRect(Rect);

    // draw designtime rect.
    if csDesigning in ComponentState then
      DrawFocusRect(Rect);

    // draw boundlines.
    if FBoundLines <> [] then
    begin
      if Style.GetTheme = WindowsXP then
        BoundColor := dxColor_Btn_Enb_Border_WXP
      else
        BoundColor := dxColor_DotNetFrame;
      dxDrawBoundLines(Self.Canvas, FBoundLines, BoundColor, Rect);
    end;

    // draw focusrect.
    if dsFocused in DrawState then
    begin
      Brush.Style := bsSolid;
      DrawFocusRect(Rect);
    end;

    // draw check symbol.
    DrawCheckSymbol(Rect);

    // draw caption.
    SetBkMode(Handle, Transparent);
    Font.Assign(Self.Font);
    Inc(Rect.Left, FCheckSize + 4 + FSpacing);
    dxPlaceText(Self, Canvas, Caption, Font, Enabled, True, taLeftJustify, True, Rect);
   end;
end;

{ TdxCheckbox }

{-----------------------------------------------------------------------------
  Procedure: TdxCheckbox.DrawCheckSymbol
  Author:    mh
  Date:      13-Mai-2002
  Arguments: const R: TRect
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCheckbox.DrawCheckSymbol(const R: TRect);
  procedure DrawGradient(const Bitmap: TBitmap);
  begin
    BitBlt(Canvas.Handle, R.Left + 3, (ClientHeight - FCheckSize) div 2 + 1,
      FCheckSize - 2, FCheckSize - 2, Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
  end;
var
  ClipW: Integer;
  Bitmap: TBitmap;
  Theme: TdxTheme;
begin
  // get current theme.
  Theme := Style.GetTheme;

  with Canvas do
  begin
    // check for highlight.
    ClipW := Integer(dsHighlight in DrawState);

    // draw border.
    if (Theme = WindowsXP) or ((Theme = OfficeXP) and (ClipW = 0)) then
      Pen.Color := dxColor_Chk_Enb_Border_WXP
    else
      Pen.Color := dxColor_BorderLineOXP;
    Rectangle(Bounds(R.Left + 2, (ClientHeight - FCheckSize) div 2,
      FCheckSize, FCheckSize));

    // draw background.
    case Theme of
      WindowsXP:
        begin
          if not ((ClipW <> 0) and (dsClicked in DrawState)) then
          begin
            if ClipW <> 0 then
              DrawGradient(FHlGradient);
            BitBlt(Handle, R.Left + 3 + ClipW, (ClientHeight - FCheckSize) div 2 + 1 +
              ClipW, FCheckSize - 2 - ClipW * 2, FCheckSize - 2 - ClipW * 2,
              FBgGradient.Canvas.Handle, 0, 0, SRCCOPY);
          end
          else
            DrawGradient(FCkGradient);
        end;
      OfficeXP:
        begin
          if ClipW <> 0 then
          begin
            if not (dsClicked in DrawState) then
              Brush.Color := dxColor_BgOXP
            else
              Brush.Color := dxColor_BgCkOXP;
            FillRect(Bounds(R.Left + 3, (ClientHeight - FCheckSize) div 2 + 1,
              FCheckSize - 2, FCheckSize - 2));
          end;
        end;
    end;

    // draw checked.
    if FChecked then
    begin
      Brush.Color := clSilver;
      Pen.Color := dxColor_Btn_Enb_Border_WXP;
      Bitmap := TBitmap.Create;
      try
        Bitmap.Transparent := True;
        Bitmap.Handle := LoadBitmap(hInstance, 'CHECKBOX');
        if Theme = WindowsXP then
          dxColorizeBitmap(Bitmap, dxColor_Chk_Enb_NmSymb_WXP)
        else
        if (dsClicked in DrawState) and (dsHighlight in DrawState) then
          dxColorizeBitmap(Bitmap, clWhite);
        Draw(FCheckSize div 2 - 1, (ClientHeight - FCheckSize) div 2 + 3, Bitmap);
      finally
        Bitmap.Free;
      end;
    end;
  end;
end;

end.


