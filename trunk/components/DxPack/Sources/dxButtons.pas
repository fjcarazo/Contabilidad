
{*******************************************************************}
{                                                                   }
{   dxButtons (Design eXperience)                                   }
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

unit dxButtons;

interface

uses
  Windows, Classes, Graphics, Controls, Forms, ActnList, ImgList,
  dxCore, dxCoreUtils, TypInfo;

type
{ TdxCustomButtonActionLink }

  TdxCustomButtonActionLink = class(TWinControlActionLink)
  protected
    { Protected declarations }
    function IsImageIndexLinked: Boolean; override;
    procedure AssignClient(AClient: TObject); override;
    procedure SetImageIndex(Value: Integer); override;
  public
    { Public declarations }
    destructor Destroy; override;
  end;

{ TdxCustomButton }

  TdxLayout = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);

  TdxCustomButton = class(TdxCustomStyleControl)
  private
    { Private declarations }
    FAutoGray: Boolean;
    FBgGradient: TBitmap;
    FCancel: Boolean;
    FCkGradient: TBitmap;
    FDefault: Boolean;
    FFcGradient: TBitmap;
    FGlyph: TBitmap;
    FHlGradient: TBitmap;
    FImageChangeLink: TChangeLink;
    FImageIndex: Integer;
    FLayout: TdxLayout;
    FShowAccelChar: Boolean;
    FShowFocusRect: Boolean;
    FSmoothEdges: Boolean;
    FSpacing: Byte;
    FWordWrap: Boolean;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure ImageListChange(Sender: TObject);
  protected
    { Protected declarations }
    function GetActionLinkClass: TControlActionLinkClass; override;
    function IsSpecialDrawState(IgnoreDefault: Boolean = False): Boolean;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure SetAutoGray(Value: Boolean); virtual;
    procedure SetDefault(Value: Boolean); virtual;
    procedure SetGlyph(Value: TBitmap); virtual;
    procedure SetLayout(Value: TdxLayout); virtual;
    procedure SetShowAccelChar(Value: Boolean); virtual;
    procedure SetShowFocusRect(Value: Boolean); virtual;
    procedure SetSmoothEdges(Value: Boolean); virtual;
    procedure SetSpacing(Value: Byte); virtual;
    procedure SetWordWrap(Value: Boolean); virtual;
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure HookResized; override;
  published
    { Published declarations }

    // common properties.
    property Action;
    property Caption;
    property Enabled;
    property TabOrder;
    property TabStop default True;
    property Height default 21;
    property Width default 73;

    // advanced properties.
    property AutoGray: Boolean read FAutoGray write SetAutoGray default True;
    property Cancel: Boolean read FCancel write FCancel default False;
    property Default: Boolean read FDefault write SetDefault default False;
    property Glyph: TBitmap read FGlyph write SetGlyph;
    property Layout: TdxLayout read FLayout write SetLayout default blGlyphLeft;
    property ModalResult;
    property ShowAccelChar: Boolean read FShowAccelChar write SetShowAccelChar default True;
    property ShowFocusRect: Boolean read FShowFocusRect write SetShowFocusRect default False;
    property SmoothEdges: Boolean read FSmoothEdges write SetSmoothEdges default True;
    property Spacing: Byte read FSpacing write SetSpacing default 3;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default True;
  end;

{ TdxButton }

  TdxButton = class(TdxCustomButton);

{ TdxToolType }

  TdxToolType = (ttArrowLeft, ttArrowRight, ttClose, ttMaximize, ttMinimize,
    ttPopup, ttRestore);

{ TdxCustomToolButton }

  TdxCustomToolButton = class(TdxCustomStyleControl)
  private
    { Private declarations }
    FToolType: TdxToolType;
  protected
    { Protected declarations }
    procedure SetToolType(Value: TdxToolType); virtual;
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure HookResized; override;
  published
    { Published declarations }
    property Enabled;
    property Color default clBlack;
    property Height default 15;
    property ToolType: TdxToolType read FToolType write SetToolType default ttClose;
    property Width default 15;
  end;

{ TdxToolButton }

  TdxToolButton = class(TdxCustomToolButton);

implementation

{ TdxCustomButtonActionLink }

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButtonActionLink.AssignClient
  Author:    mh
  Date:      09-Apr-2002
  Arguments: AClient: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TdxCustomButton;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButtonActionLink.Destroy
  Author:    mh
  Date:      12-Apr-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

destructor TdxCustomButtonActionLink.Destroy;
begin
  TdxCustomButton(FClient).Invalidate;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButtonActionLink.IsImageIndexLinked
  Author:    mh
  Date:      09-Apr-2002
  Arguments: None
  Result:    Boolean
-----------------------------------------------------------------------------}

function TdxCustomButtonActionLink.IsImageIndexLinked: Boolean;
begin
  Result := True;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButtonActionLink.SetImageIndex
  Author:    mh
  Date:      09-Apr-2002
  Arguments: Value: Integer
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButtonActionLink.SetImageIndex(Value: Integer);
begin
  inherited;
  (FClient as TdxCustomButton).FImageIndex := Value;
  (FClient as TdxCustomButton).Invalidate;
end;

{ TdxCustomButton }

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.Create
  Author:    mh
  Date:      21-Feb-2002
  Arguments: AOwner: TComponent
  Result:    None
-----------------------------------------------------------------------------}

constructor TdxCustomButton.Create(AOwner: TComponent);
begin
  inherited;

  // set default properties.
  ControlStyle := ControlStyle - [csDoubleClicks];
  Height := 21;
  Width := 73;
  TabStop := True;

  // set custom properties.
  FAutoGray := True;
  FCancel := False;
  FDefault := False;
  FImageIndex := -1;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FGlyph := TBitmap.Create;
  FLayout := blGlyphLeft;
  FShowAccelChar := True;
  FShowFocusRect := False;
  FSmoothEdges := True;
  FSpacing := 3;
  FWordWrap := True;

  // create ...
  FBgGradient := TBitmap.Create; // background gradient
  FCkGradient := TBitmap.Create; // clicked gradient
  FFcGradient := TBitmap.Create; // focused gradient
  FHlGradient := TBitmap.Create; // Highlight gradient
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.Destroy
  Author:    mh
  Date:      21-Feb-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

destructor TdxCustomButton.Destroy;
begin
  FBgGradient.Free;
  FCkGradient.Free;
  FFcGradient.Free;
  FHlGradient.Free;
  FGlyph.Free;
  FImageChangeLink.OnChange := nil;
  FImageChangeLink.Free;
  FImageChangeLink := nil;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.GetActionLinkClass
  Author:    mh
  Date:      09-Apr-2002
  Arguments: None
  Result:    TControlActionLinkClass
-----------------------------------------------------------------------------}

function TdxCustomButton.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TdxCustomButtonActionLink;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.CMDialogKey
  Author:    mh
  Date:      22-Feb-2002
  Arguments: var Message: TCMDialogKey
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.CMDialogKey(var Message: TCMDialogKey);
begin
  inherited;
  with Message do
    if (((CharCode = VK_RETURN) and (Focused or (FDefault and not (IsSibling))))
      or ((CharCode = VK_ESCAPE) and FCancel) and (KeyDataToShiftState(KeyData) = []))
      and CanFocus then
    begin
      Click;
      Result := 1;
    end
    else
      inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetAutoGray
  Author:    mh
  Date:      12-Apr-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetAutoGray(Value: Boolean);
begin
  if Value <> FAutoGray then
  begin
    FAutoGray := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetDefault
  Author:    mh
  Date:      22-Feb-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetDefault(Value: Boolean);
begin
  if Value <> FDefault then
  begin
    FDefault := Value;
    with GetParentForm(Self) do
      Perform(CM_FOCUSCHANGED, 0, LongInt(ActiveControl));
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetGlyph
  Author:    mh
  Date:      22-Feb-2002
  Arguments: Value: TPicture
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetGlyph(Value: TBitmap);
begin
  FGlyph.Assign(Value);
  if not IsLocked then
    Invalidate;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetLayout
  Author:    mh
  Date:      12-Apr-2002
  Arguments: Value: TdxLayout
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetLayout(Value: TdxLayout);
begin
  if Value <> FLayout then
  begin
    FLayout := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetShowAccelChar
  Author:    mh
  Date:      22-Feb-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetShowAccelChar(Value: Boolean);
begin
  if Value <> FShowAccelChar then
  begin
    FShowAccelChar := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetShowFocusRect
  Author:    mh
  Date:      22-Feb-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetShowFocusRect(Value: Boolean);
begin
  if Value <> FShowFocusRect then
  begin
    FShowFocusRect := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetSmoothEdges
  Author:    mh
  Date:      05-Jul-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetSmoothEdges(Value: Boolean);
begin
  if Value <> FSmoothEdges then
  begin
    FSmoothEdges := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetSpacing
  Author:    mh
  Date:      11-Apr-2002
  Arguments: Value: Integer
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetSpacing(Value: Byte);
begin
  if Value <> FSpacing then
  begin
    FSpacing := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.SetWordWrap
  Author:    mh
  Date:      29-Apr-2002
  Arguments: Value: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.SetWordWrap(Value: Boolean);
begin
  if Value <> FWordWrap then
  begin
    FWordWrap := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.ImageListChange
  Author:    mh
  Date:      09-Apr-2002
  Arguments: Sender: TObject
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.ImageListChange(Sender: TObject);
begin
  if Assigned(Action) and (Sender is TCustomImageList)
    and Assigned(TAction(Action).ActionList.Images)
    and ((TAction(Action).ImageIndex < (TAction(Action).ActionList.Images.Count))) then
    FImageIndex := TAction(Action).ImageIndex
  else
    FImageIndex := -1;
  if not IsLocked then
    Invalidate;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.KeyDown
  Author:    mh
  Date:      22-Feb-2002
  Arguments: var Key: Word; Shift: TShiftState
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_SPACE) then
  begin
    DrawState := DrawState + [dsHighlight];
    HookMouseDown;
  end;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.KeyUp
  Author:    mh
  Date:      22-Feb-2002
  Arguments: var Key: Word; Shift: TShiftState
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.KeyUp(var Key: Word; Shift: TShiftState);
var
  cPos: TPoint;
begin
  //
  // it's not possible to call the 'HookMouseUp' or 'HookMouseLeave' methods,
  // because we don't want to call there event handlers.
  //
  if dsClicked in DrawState then
  begin
    GetCursorPos(cPos);
    cPos := ScreenToClient(cPos);
    if not PtInRect(Bounds(0, 0, Width, Height), cPos) then
      DrawState := DrawState - [dsHighlight];
    DrawState := DrawState - [dsClicked];
    if not IsLocked then
      Invalidate;
    Click;
  end;
  inherited;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.IsSpecialDrawState
  Author:    mh
  Date:      22-Feb-2002
  Arguments: None
  Result:    Boolean
-----------------------------------------------------------------------------}

function TdxCustomButton.IsSpecialDrawState(IgnoreDefault: Boolean = False): Boolean;
begin
  if dsClicked in DrawState then
    Result := not (dsHighlight in DrawState)
  else
    Result := (dsHighlight in DrawState) or (dsFocused in DrawState);
  if not IgnoreDefault then
    Result := Result or (FDefault and CanFocus) and not IsSibling;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.ActionChange
  Author:    mh
  Date:      09-Apr-2002
  Arguments: Sender: TObject; CheckDefaults: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if Assigned(TCustomAction(Sender).ActionList.Images) and
        (FImageChangeLink.Sender <> TCustomAction(Sender).ActionList.Images) then
        TCustomAction(Sender).ActionList.Images.RegisterChanges(FImageChangeLink);
      if (ActionList <> nil) and (ActionList.Images <> nil) and
        (ImageIndex >= 0) and (ImageIndex < ActionList.Images.Count) then
        FImageIndex := ImageIndex;
      if not IsLocked then
        Invalidate;
    end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.HookResized
  Author:    mh
  Date:      22-Feb-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.HookResized;
const
  ColSteps = 64;
  Dithering = True;
var
  Offset: Integer;
begin
  inherited;

  // calculate offset.
  Offset := 4 * (Integer(IsSpecialDrawState(True)));

  //
  // create gradient rectangles for...
  //

  // background.
  dxCreateGradientRect(Width - (2 + Offset), Height - (2 + Offset),
    dxColor_Btn_Enb_BgFrom_WXP,  dxColor_Btn_Enb_BgTo_WXP, ColSteps, gsTop, Dithering,
    FBgGradient);

  // clicked.
  dxCreateGradientRect(Width - 2, Height - 2, dxColor_Btn_Enb_CkFrom_WXP,
    dxColor_Btn_Enb_CkTo_WXP, ColSteps, gsTop, Dithering, FCkGradient);

  // focused.
  dxCreateGradientRect(Width - 2, Height - 2, dxColor_Btn_Enb_FcFrom_WXP,
    dxColor_Btn_Enb_FcTo_WXP, ColSteps, gsTop, Dithering, FFcGradient);

  // highlight.
  dxCreateGradientRect(Width - 2, Height - 2, dxColor_Btn_Enb_HlFrom_WXP,
    dxColor_Btn_Enb_HlTo_WXP, ColSteps, gsTop, Dithering, FHlGradient);

  // redraw.
  if not IsLocked then
    Invalidate;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomButton.Paint
  Author:    mh
  Date:      21-Feb-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomButton.Paint;
var
  Rect: TRect;
  Offset, Flags: Integer;
  DrawPressed: Boolean;
  Image: TBitmap;
  Bitmap: TBitmap;
begin
  with Canvas do
  begin
    // clear background.
    Rect := GetClientRect;
    Brush.Color := Self.Color;
    FillRect(Rect);

    // draw gradient borders.
    if IsSpecialDrawState then
    begin
      Bitmap := TBitmap.Create;
      try
        if dsHighlight in DrawState then
          Bitmap.Assign(FHlGradient)
        else
          Bitmap.Assign(FFcGradient);
        BitBlt(Handle, 1, 1, Width, Height, Bitmap.Canvas.Handle, 0, 0, SRCCOPY);
      finally
        Bitmap.Free;
      end;
    end;

    // draw background gradient...
    if not ((dsHighlight in DrawState) and (dsClicked in DrawState)) then
    begin
      Offset := 2 * Integer(IsSpecialDrawState);
      BitBlt(Handle, 1 + Offset, 1 + Offset, Width - 3 * Offset, Height - 3 * Offset,
        FBgGradient.Canvas.Handle, 0, 0, SRCCOPY);
    end
    // ...or click gradient.
    else
      BitBlt(Handle, 1, 1, Width, Height, FCkGradient.Canvas.Handle, 0, 0, SRCCOPY);

    // draw border lines.
    if Enabled then
      Pen.Color := dxColor_Btn_Enb_Border_WXP
    else
      Pen.Color := dxColor_Btn_Dis_Border_WXP;
    Brush.Style := bsClear;
    RoundRect(0, 0, Width, Height, 5, 5);

    // draw border edges.
    if FSmoothEdges then
    begin
      if Enabled then
        Pen.Color := dxColor_Btn_Enb_Edges_WXP
      else
        Pen.Color := dxColor_Btn_Dis_Edges_WXP;
      dxDrawLine(Canvas, 0, 1, 2, 0);
      dxDrawLine(Canvas, Width - 2, 0, Width, 2);
      dxDrawLine(Canvas, 0, Height - 2, 2, Height);
      dxDrawLine(Canvas, Width - 3, Height, Width, Height - 3);
    end;

    // set drawing flags.
    Flags := {DT_VCENTER or }DT_END_ELLIPSIS;
    if FWordWrap then
      Flags := Flags or DT_WORDBREAK;

    // draw image & caption.
    Image := TBitmap.Create;
    try
      // get image from action or glyph property.
      if Assigned(Action) and Assigned(TAction(Action).ActionList.Images) and
        (FImageIndex > -1) and (FImageIndex < TAction(Action).ActionList.Images.Count) then
        TAction(Action).ActionList.Images.GetBitmap(FImageIndex, Image)
      else
        Image.Assign(FGlyph);

      // autogray image (if allowed).
      if FAutoGray and not Enabled then
        dxConvertToGray2(Image);

      // assign canvas font (change HotTrack-Color, if necessary).
      Font.Assign(Self.Font);

      // calculate textrect.
      if not Image.Empty then
        case FLayout of
          blGlyphLeft:
            Inc(Rect.Left, Image.Width + FSpacing);
          blGlyphRight:
            begin
              Dec(Rect.Left, Image.Width + FSpacing);
              Dec(Rect.Right, (Image.Width + FSpacing) * 2);
              Flags := Flags or DT_RIGHT;
            end;
          blGlyphTop:
            Inc(Rect.Top, Image.Height + FSpacing);
          blGlyphBottom:
            Dec(Rect.Top, Image.Height + FSpacing);
        end;
      dxRenderText(Self, Canvas, Caption, Font, Enabled, FShowAccelChar, Rect, Flags or DT_CALCRECT);
      OffsetRect(Rect, (Width - Rect.Right) div 2, (Height - Rect.Bottom) div 2);

      // should we draw the pressed state?
      DrawPressed := (dsHighlight in DrawState) and (dsClicked in DrawState);
      if DrawPressed then
        OffsetRect(Rect, 1, 1);

      // draw image - if available.
      if not Image.Empty then
      begin
        Image.Transparent := True;
        case FLayout of
          blGlyphLeft:
            Draw(Rect.Left - (Image.Width + FSpacing), (Height - Image.Height) div 2 +
              Integer(DrawPressed), Image);
          blGlyphRight:
            Draw(Rect.Right + FSpacing, (Height - Image.Height) div 2 +
              Integer(DrawPressed), Image);
          blGlyphTop:
            Draw((Width - Image.Width) div 2 + Integer(DrawPressed),
              Rect.Top - (Image.Height + FSpacing), Image);
          blGlyphBottom:
            Draw((Width - Image.Width) div 2 + Integer(DrawPressed),
              Rect.Bottom + FSpacing, Image);
        end;
      end;

      // draw focusrect (if enabled).
      if (dsFocused in DrawState) and (FShowFocusRect) then
      begin
        Brush.Style := bsSolid;
        DrawFocusRect(Bounds(3, 3, Width - 6, Height - 6));
      end;

      // draw caption.
      SetBkMode(Handle, Transparent);
      dxRenderText(Self, Canvas, Caption, Font, Enabled, FShowAccelChar, Rect, Flags);
    finally
      Image.Free;
    end;
  end;
end;

{ TdxCustomToolButton }

{-----------------------------------------------------------------------------
  Procedure: TdxCustomToolButton.Create
  Author:    mh
  Date:      16-Aug-2002
  Arguments: AOwner: TComponent
  Result:    None
-----------------------------------------------------------------------------}

constructor TdxCustomToolButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csDoubleClicks];
  Color := clBlack;
  FToolType := ttClose;
  HookResized;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomToolButton.HookResized
  Author:    mh
  Date:      16-Aug-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomToolButton.HookResized;
begin
  Height := 15;
  Width := 15;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomToolButton.SetToolType
  Author:    mh
  Date:      16-Aug-2002
  Arguments: Value: TdxToolType
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomToolButton.SetToolType(Value: TdxToolType);
begin
  if Value <> FToolType then
  begin
    FToolType := Value;
    if not IsLocked then
      Invalidate;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomToolButton.Paint
  Author:    mh
  Date:      16-Aug-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomToolButton.Paint;
var
  Rect: TRect;
  Bitmap: TBitmap;
  Theme: TdxTheme;
  Shifted: Boolean;
begin
  with Canvas do
  begin
    Rect := GetClientRect;
    Brush.Color := TdxWinControl(Parent).Color;
    FillRect(Rect);
    if csDesigning in ComponentState then
      DrawFocusRect(Rect);
    Brush.Style := bsClear;
    Theme := Style.GetTheme;
    if (Theme = WindowsXP) and (dsClicked in DrawState) and
      not (dsHighlight in DrawState) then
      dxFrame3d(Self.Canvas, Rect, clWhite, clBlack);
    if dsHighlight in DrawState then
    begin
      if Theme = WindowsXP then
        dxFrame3d(Self.Canvas, Rect, clWhite, clBlack, dsClicked in DrawState)
      else begin
        Pen.Color := dxColor_BorderLineOXP;
        Rectangle(Rect);
        InflateRect(Rect, -1, -1);
        if dsClicked in DrawState then
          Brush.Color := dxColor_BgCkOXP
        else
          Brush.Color := dxColor_BgOXP;
        FillRect(Rect);
      end;
    end;
    Shifted := (Theme = WindowsXP) and (dsClicked in DrawState);
    Bitmap := TBitmap.Create;
    try
      Bitmap.Handle := LoadBitmap(hInstance, PChar(Copy(GetEnumName(TypeInfo(TdxToolType),
        Ord(FToolType)), 3, MAXINT)));
      if (dsClicked in DrawState) and (dsHighlight in DrawState) then
        dxColorizeBitmap(Bitmap, clWhite)
      else
      if not Enabled then
        dxColorizeBitmap(Bitmap, clGray)
      else
      if Color <> clBlack then
        dxColorizeBitmap(Bitmap, Color);
      Bitmap.Transparent := True;
      Draw((Width - Bitmap.Width) div 2 + Integer(Shifted),
        (Height - Bitmap.Height) div 2 + Integer(Shifted), Bitmap);
    finally
      Bitmap.Free;
    end;
  end;
end;

end.

