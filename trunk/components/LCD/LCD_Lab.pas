{******************************************************************************}
{                                                                              }
{  TLCDLabel v1.5 - The one and only LCD label that work like the real thing!  }
{  (c) 1999 - Peter Czidlina                                                   }
{  Now with editable fonts!                                                    }
{******************************************************************************}

unit LCD_Lab;

interface

uses
  SysUtils, Windows, WinProcs, WinTypes, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Matrix;

type
  TDotMatrix  = (mat5x7, mat5x8, mat7x9, mat9x12, Hitachi, Hitachi2, dos5x7, CustomFont);
  TPixelSize  = (pix1x1, pix2x2, pix3x3, pix4x4, pix5x5, pix6x6, pix7x7, pix8x8, pix9x9, pix10x10, pix11x11, pix12x12, pix13x13, pix14x14, pix15x15, pix16x16, pixCustom);
  TPixelShape = (spSquare, spShaped, spRound);
  TMyBorder   = (frRaised, frLowered, frSingle, frNone);
  TPixelState = (pixOn, pixOff);
  TPixelPtr   = ^TPixelState;
  T_FileName  = type string;

  TLCDLabel = class(TGraphicControl)
  private
    FPixelSize : TPixelSize;        { Size of a LCD pixel (in screen pixels    }
    FPixelShape: TPixelShape;       { Shape of a LCD pixel                     }
    FDotMatrix : TDotMatrix;        { Type of character matrix on the LCD      }
    FPixelSpacing : integer;        { Space between each pixel in the matrix   }
    FCharSpacing : integer;         { Space between the characters on the LCD  }
    FLineSpacing : integer;         { Space between text lines on the display  }
    FBorderSpace : integer;         { Distance from the LCD border             }
    FTextLines   : integer;         { Number of text lines on the LCD          }
    FNoOfChars   : integer;         { Number of characters on a single line    }
    FBackGround  : TColor;          { LCD background color                     }
    FPixOnColor  : TColor;          { LCD pixel ON color                       }
    FPixOffColor : TColor;          { LCD pixel OFF color                      }
    FPixHalfColor: TColor;          { Half intensity ON color                  }
    FPixWidth    : integer;         { Pixel widht                              }
    FPixHeight   : integer;         { Pixel height                             }
    FBorderStyle : TMyBorder;       { Border around the the component          }
    FBorderColor : TColor;          { Color of component border                }
    FWidth       : integer;         { Label width in pixels                    }
    FHeight      : integer;         { Label height in pixels                   }
    charw, charh : integer;         { Temp. storage of character sizes         }
    psx, psy     : integer;         { Internal pixel width variables           }
    pix_x, pix_y     : integer;     { Font size                                }
    first_c, last_c  : integer;     { First and last character to draw         }
    FFilename : T_FileName;         { Filename of custom font file             }
    charbuf  : Array[0..256] of Char;
    FontList : Array[0..255] of TPixelPtr;
    procedure SetPixelSize(psize : TPixelSize);
    procedure SetDotMatrix(matrix : TDotMatrix);
    procedure SetPixelShape(pshape : TPixelShape);
    procedure SetPixelSpacing(pspacing : integer);
    procedure SetCharSpacing(cspacing : integer);
    procedure SetLineSpacing(lspacing : integer);
    procedure SetBorderSpace(bspace : integer);
    procedure SetTextLines(tlines : integer);
    procedure SetNoOfChars(nchars : integer);
    procedure GetAsciiInterval;
    procedure CalcSize;
    procedure CalcCharSize;
    procedure SetBkgColor(bcolor : TColor);
    procedure SetPixOnColor(ocolor : TColor);
    procedure SetPixOffColor(ocolor : TColor);
    procedure SetBorderStyle(bstyle : TMyBorder);
    procedure SetBorderColor(bcolor : TColor);
    procedure SetFileName(fname : T_FileName);
    procedure SetPixelWidth(pwidth : integer);
    procedure SetPixelHeight(pheight : integer);
    function  ReadCustomFont(fname : string) : boolean;
    function  BuildFontList(var FontList : Array of TPixelPtr; font_w, font_h : integer) : boolean;
    procedure FreeFontList(var FontList : Array of TPixelPtr);
    procedure DrawMatrix(BitMap : TBitMap; xpos, ypos : integer; charindex : integer);
    procedure DrawCharacters(BitMap : TBitMap);
    function  GetCaption : TCaption;
    procedure SetCaption(const Value : TCaption);
    procedure CalcHalfColor;
  protected  { Internal properties }

  public     { Non-published but avaiable read-only properties }
    property FontWidth : integer read pix_x;
    property FontHeight : integer read pix_y;
  published  { Normal properties (avaiable in Inspector) }
  { Text setting - make the text on the LCD }
    property Caption: TCaption read GetCaption write SetCaption;
  { LCD character parameters }
    property DotMatrix: TDotMatrix read FDotMatrix write SetDotMatrix default mat5x7;
    property PixelSize: TPixelSize read FPixelSize write SetPixelSize;
    property PixelSpacing: integer read FPixelSpacing write SetPixelSpacing;
    property PixelShape: TPixelShape read FPixelShape write SetPixelShape default spSquare;
    property PixelWidth: integer read FPixWidth write SetPixelWidth;
    property PixelHeight: integer read FPixHeight write SetPixelHeight;
  { LCD display parameters }
    property CharSpacing: integer read FCharSpacing write SetCharSpacing;
    property LineSpacing: integer read FLineSpacing write SetLineSpacing;
    property BorderSpace: integer read FBorderSpace write SetBorderSpace;
    property TextLines : integer read FTextLines write SetTextLines;
    property NoOfChars : integer read FNoOfChars write SetNoOfChars;
  { LCD color parameters }
    property BackGround : TColor read FBackGround write SetBkgColor default clSilver;
    property BorderStyle : TMyBorder read FBorderStyle write SetBorderStyle default frLowered;
    property BorderColor : TColor read FBorderColor write SetBorderColor default clBlack;
    property PixelOn : TColor read FPixOnColor write SetPixOnColor default clBlack;
    property PixelOff : TColor read FPixOffColor write SetPixOffColor default clGray;
  { Custom font properties }
    property filename : T_FileName read FFilename write SetFileName;
  { TGraphicControl properties }
    property Hint;
    property ShowHint;
    property Enabled;
    property Visible;
  { Events }
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    procedure Paint; override;
  end;

  procedure Register;

implementation

{uses
  DesignIntf;}
  
{ Create component }
constructor TLCDLabel.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited Create(AOwner);
  for i := 0 to 255 do
    FontList[i] := NIL;
  FWidth       := 0;
  FHeight      := 0;
  FCharSpacing := 2;
  FLineSpacing := 2;
  FPixelSpacing:= 1;
  FBorderSpace := 3;
  FTextLines   := 1;
  FNoOfChars   := 10;
  FBorderStyle := frLowered;
  FBorderColor := clBlack;
  FBackGround  := clSilver;
  FPixOnColor  := clBlack;
  FPixOffColor := $00AAAAAA;
  FPixelSize   := pix2x2;
  CalcHalfColor;             { Halftone On color          }
  CalcSize;                  { Get correct sizes at start }
end;

{ Remove component }
destructor TLCDLabel.Destroy;
begin
  FreeFontList(FontList);
  inherited Destroy;
end;

{******************************************************************************}
{*  Custom font file loading                                                  *}
function TLCDLabel.ReadCustomFont(fname : string) : boolean;
var
  FontFile : File;
  i        : integer;
begin
  result := True;
  {$I-}
  AssignFile(FontFile, fname);
  Reset(FontFile, 1);
  {$I+}
  if (IOResult <> 0) then   { Check if file open failed }
    result := False
  else begin                { Everything OK - read file }
    try
      BlockRead(FontFile, pix_x, sizeof(integer));
      BlockRead(FontFile, pix_y, sizeof(integer));
      BlockRead(FontFile, first_c, sizeof(integer));
      BlockRead(FontFile, last_c, sizeof(integer));
      if BuildFontList(FontList, pix_x, pix_y) then begin
        for i := first_c to last_c do begin
          BlockRead(FontFile, FontList[i]^, (pix_x * pix_y) * sizeof(TPixelState));
        end;
      end else
        result := False;
    finally
      CloseFile(FontFile);
    end;
  end;
end;

// Build font list in memory
function TLCDLabel.BuildFontList(var FontList : Array of TPixelPtr; font_w, font_h : integer) : boolean;
var
  i, j : integer;
  TPtr : TPixelPtr;
begin
  result := True;
// Set all pointers to NIL
  for i := 0 to 255 do
    FontList[i] := NIL;
// Allocate memory for each font
  for i := 0 to 255 do begin
    try
      GetMem(FontList[i], font_w * font_h * sizeof(TPixelState));
      TPtr := FontList[i];
    // Set the new font to blank
      for j := 0 to ((font_w * font_h) - 1) do begin
        TPtr^ := pixOff;
        Inc(TPtr);
      end;
    except
      result := False;
      break;
    end;
  end;
end;

// Free the entire font list
procedure TLCDLabel.FreeFontList(var FontList : Array of TPixelPtr);
var
  i : integer;
begin
  for i := 0 to 255 do begin
    if (FontList[i] <> NIL) then begin
      try
        FreeMem(FontList[i]);
        FontList[i] := NIL;
      except
      end;
    end;
  end;
end;

{******************************************************************************}
procedure TLCDLabel.DrawMatrix(BitMap : TBitMap; xpos, ypos : integer; charindex : integer);
var
  i, j : integer;
  tx, ty : integer;
  CColor : TColor;
  TPtr   : TPixelPtr;
begin
  tx := xpos;
  ty := ypos;
  for i := 1 to pix_y do begin
    for j := 1 to pix_x do begin
      case FDotMatrix of
        mat5x7 : begin
                   if Char5x7[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        mat5x8 : begin
                   if Char5x8[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        Hitachi: begin
                   if CharHitachi[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        Hitachi2:begin  // Use full height for character 194 - 223
                   if (charindex <= 193) then begin  // Normal Hitachi
                     if (i <= 7) then begin
                       if CharHitachi[charindex][i][j] = 1 then
                         CColor := FPixOnColor
                       else
                         CColor := FPixOffColor;
                     end else
                       CColor := FPixOffColor;
                   end else begin  // Extended height
                     if CharHitachiExt[charindex][i][j] = 1 then
                       CColor := FPixOnColor
                     else
                       CColor := FPixOffColor;
                   end;
                 end;
        mat7x9 : begin
                   if Char7x9[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        mat9x12: begin
                   if Char9x12[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        dos5x7 : begin
                   if CharDOS5x7[charindex][i][j] = 1 then
                     CColor := FPixOnColor
                   else
                     CColor := FPixOffColor;
                 end;
        CustomFont : begin  { Custom font - an other counting are needed }
                   TPtr := FontList[charindex];
                   Inc(TPtr, ((j - 1) + ((i - 1) * pix_x)) * sizeof(TPixelState));
                   case TPtr^ of
                     pixOn : CColor := FPixOnColor;
                     pixOff: CColor := FPixOffColor;
                   end;
                 end;
      end;
    // Paint pixels in selected shape
      case FPixelShape of
        spSquare: begin  // Standard square pixels
                  BitMap.Canvas.Pen.Color := CColor;
                  BitMap.Canvas.Brush.Color := CColor;
                  BitMap.Canvas.rectangle(tx, ty, tx + psx, ty + psy);
                end;
        spShaped: begin  // Pixels with shaped corners
                  if CColor = FPixOnColor then begin
                    BitMap.Canvas.Pen.Color := FPixHalfColor;
                    BitMap.Canvas.Brush.Color := FpixHalfColor;
                    BitMap.Canvas.rectangle(tx, ty, tx + psx, ty + psy);
                    BitMap.Canvas.Pen.Color := CColor;
                    BitMap.Canvas.Brush.Color := CColor;
                    BitMap.Canvas.ellipse(tx, ty, tx + psx, ty + psy);
                  end else begin
                    BitMap.Canvas.Pen.Color := CColor;
                    BitMap.Canvas.Brush.Color := CColor;
                    BitMap.Canvas.rectangle(tx, ty, tx + psx, ty + psy);
                  end;
                end;
        spRound : begin  // Round pixels
                  BitMap.Canvas.Pen.Color := CColor;
                  BitMap.Canvas.Brush.Color := CColor;
                  BitMap.Canvas.ellipse(tx, ty, tx + psx, ty + psy);
                end;
      end;
      tx := tx + psx + FPixelSpacing;
    end;
    tx := xpos;
    ty := ty + psy + FPixelSpacing;
  end;
end;

procedure TLCDLabel.DrawCharacters(BitMap : TBitMap);
var
  row ,col : integer;
  xpos, ypos : integer;
  charindex : integer;
  cc : integer;
  textend : Boolean;
begin
  xpos := FBorderSpace + 1;
  ypos := FBorderSpace + 1;
  cc := 0;
  textend := False;
  for row := 1 to FTextLines do begin      { Line counter             }
    for col := 1 to FNoOfChars do begin    { Character counter        }
      if textend = False then              { Check for string end     }
        if charbuf[cc] = #0 then
          textend := True;
      if textend then
        charindex := 0
      else
        charindex := Ord(charbuf[cc]);
      if (charindex < first_c) then        { Limit charactes inside interval }
        charindex := first_c;
      if (charindex > last_c) then
        charindex := last_c;
      DrawMatrix(BitMap, xpos, ypos, charindex);
      xpos := xpos + charw + FCharSpacing;
      Inc(cc);
    end;
    ypos := ypos + charh + FLineSpacing;
    xpos := FBorderSpace + 1;
  end;
end;

{******************************************************************************}
{ Repaint the component }
procedure TLCDLabel.Paint;
var
  BitMap : TBitMap;
  T_Rect : TRect;
  flag : boolean;
begin
  flag := False;
  if Width <> FWidth then begin
    flag := True;
    FWidth := Width;
  end;
  if Height <> FHeight then begin
    flag := True;
    FHeight := Height;
  end;
  GetAsciiInterval;          { Calculate interval for ASCII values }
  if flag then
    CalcCharSize
  else
    CalcSize;                { Get Width and Height correct }
  with Canvas do begin
    BitMap := TBitMap.Create;
    try                         { Draw image off-screen }
      BitMap.Height := Height + 2;
      BitMap.Width := Width + 2;
{ Border drawing }
      with BitMap.Canvas do begin
        Pen.Style   := psSolid;
        Brush.Style := bsSolid;
        if Visible then begin     { Draw only real graphics if display is marked visible }
          T_Rect := Rect(0, 0, Width, Height);
          Brush.Color := FBackGround;
          FillRect(T_Rect);          { Background fill }
          if (FBorderStyle <> frNone) then begin
            case FBorderStyle of
              frSingle: Brush.Color := FBorderColor;
              frRaised: Brush.Color := clBtnShadow;
              frLowered:Brush.Color := clBtnHighlight;
            end;
            FrameRect(T_Rect);
            if (FBorderStyle <> frSingle) then begin
              case FBorderStyle of
                frLowered: Pen.Color := clBtnShadow;
                frRaised:  Pen.Color := clBtnHighlight;
              end;
              PolyLine([Point(Width, 0), Point(0, 0), Point(0, Height)]);
            end;
          end;
{ Character drawing }
          if Enabled then
            DrawCharacters(BitMap);
        end else begin  { Invisible - draw a square in background color }
          Brush.Color := clBtnFace;
          FillRect(ClipRect);
        end;
      end;
{ Copy drawn characters to Window bitmap }
      BitBlt(Canvas.Handle, 0, 0, Width, Height, BitMap.Canvas.Handle, 0, 0, srcCopy);
    finally
      BitMap.Free;
    end;
  end;
end;

{ Calculate half color intensity }
procedure TLCDLabel.CalcHalfColor;
var
  red, green, blue, control : byte;
begin
  blue := byte(FPixOnColor) div 2;
  green:= byte(FPixOnColor shr 8) div 2;
  red  := byte(FPixOnColor shr 16) div 2;
  control := byte(FPixOnColor shr 24);
  FPixHalfColor := blue + (green * $100) + (red * $10000) + (control * $1000000);
end;

{ Get interval for ASCII values }
procedure TLCDLabel.GetAsciiInterval;
begin
  case FDotMatrix of
    mat5x7, Hitachi : begin
               first_c := HITACHI_FIRST;
               last_c  := HITACHI_LAST;
             end;
    Hitachi2:begin
               first_c := HITACHI2_FIRST;
               last_c  := HITACHI2_LAST;
             end;
    mat5x8 : begin
               first_c := MAT5X8_FIRST;
               last_c  := MAT5X8_LAST;
             end;
    mat7x9 : begin
               first_c := MAT7X9_FIRST;
               last_c  := MAT7X9_LAST;
             end;
    mat9x12: begin
               first_c := MAT9X12_FIRST;
               last_c  := MAT9X12_LAST;
             end;
    dos5x7 : begin
               first_c := DOS5X7_FIRST;
               last_c  := DOS5X7_LAST;
             end;
  end;
end;

{ Calculate no of characters and lines from width and heigth }
procedure TLCDLabel.CalcCharSize;
begin
  if (Ord(pixCustom) = Ord(FPixelSize)) then begin  { Custom size }
    psx := FPixWidth;
    psy := FPixHeight;
  end else begin             { Predefined width selected - make square pixels }
    psx := Ord(FPixelSize) + 1;
    psy := psx;
    FPixWidth := psx;
    FPixHeight := psy;
  end;
  case FDotMatrix of         { Calculate the space taken by the character matrix }
    mat5x7, Hitachi : begin
               pix_x := HITACHI_WIDTH;
               pix_y := HITACHI_HEIGHT;
             end;
    Hitachi2:begin
               pix_x := HITACHI2_WIDTH;
               pix_y := HITACHI2_HEIGHT;
             end;
    mat5x8 : begin
               pix_x := MAT5X8_WIDTH;
               pix_y := MAT5X8_HEIGHT;
             end;
    mat7x9 : begin
               pix_x := MAT7X9_WIDTH;
               pix_y := MAT7X9_HEIGHT;
             end;
    mat9x12: begin
               pix_x := MAT9X12_WIDTH;
               pix_y := MAT9X12_HEIGHT;
             end;
    dos5x7 : begin
               pix_x := DOS5X7_WIDTH;
               pix_y := DOS5X7_HEIGHT;
             end;
  end;
  charw := (pix_x * psx) + ((pix_x - 1) * FPixelSpacing);
  charh := (pix_y * psy) + ((pix_y -1) * FPixelSpacing);
  FNoOfChars := (Width - (2 * FBorderSpace) + FCharSpacing) div (charw + FCharSpacing);
  FTextLines := (Height- (2 * FBorderSpace) + FLineSpacing) div (charh + FLineSpacing);
  if FNoOfChars < 1 then FNoOfChars := 1;
  if FTextLines < 1 then FTextLines := 1;
  Width := (FBorderSpace * 2) +                { Distance to sides (there are two) }
           (FCharSpacing * (FNoOfChars - 1)) + { Spaces between charactes          }
           (charw * FNoOfChars) +              { The characters itself             }
           2;                                  { For the border                    }
  Height:= (FBorderSpace * 2) +                { Distance to top and bottom        }
           (FLineSpacing * (FTextLines - 1)) + { Spacing between lines             }
           (charh * FTextLines) +              { The lines                         }
           2;                                  { For the border                    }
  FWidth := Width;
  FHeight := Height;
end;

{ Calculations for width and height }
procedure TLCDLabel.CalcSize;
begin
  if (Ord(pixCustom) = Ord(FPixelSize)) then begin  { Custom size }
    psx := FPixWidth;
    psy := FPixHeight;
  end else begin             { Predefined width selected - make square pixels }
    psx := Ord(FPixelSize) + 1;
    psy := psx;
    FPixWidth := psx;
    FPixHeight := psy;
  end;
  case FDotMatrix of         { Calculate the space taken by the character matrix }
    mat5x7, Hitachi : begin
               pix_x := HITACHI_WIDTH;
               pix_y := HITACHI_HEIGHT;
             end;
    Hitachi2:begin
               pix_x := HITACHI2_WIDTH;
               pix_y := HITACHI2_HEIGHT;
             end;
    mat5x8 : begin
               pix_x := MAT5X8_WIDTH;
               pix_y := MAT5X8_HEIGHT;
             end;
    mat7x9 : begin
               pix_x := MAT7X9_WIDTH;
               pix_y := MAT7X9_HEIGHT;
             end;
    mat9x12: begin
               pix_x := MAT9X12_WIDTH;
               pix_y := MAT9X12_HEIGHT;
             end;
    dos5x7 : begin
               pix_x := DOS5X7_WIDTH;
               pix_y := DOS5X7_HEIGHT;
             end;    
  end;
  charw := (pix_x * psx) + ((pix_x - 1) * FPixelSpacing);
  charh := (pix_y * psy) + ((pix_y - 1) * FPixelSpacing);
  Width := (FBorderSpace * 2) +                { Distance to sides (there are two) }
           (FCharSpacing * (FNoOfChars - 1)) + { Spaces between charactes          }
           (charw * FNoOfChars) +              { The characters itself             }
           2;                                  { Border outside character area     }
  Height:= (FBorderSpace * 2) +                { Distance to top and bottom        }
           (FLineSpacing * (FTextLines - 1)) + { Spacing between lines             }
           (charh * FTextLines) +              { The lines                         }
           2;                                  { The Border                        }
  FWidth := Width;
  FHeight := Height;
end;

{ Get caption string }
function TLCDLabel.GetCaption : TCaption;
var
  Buf: Array[0..256] of Char;
begin
  GetTextBuf(Buf, 256);
  StrCopy(charbuf, Buf);
  Result := StrPas(Buf);
end;

{ Set caption string }
procedure TLCDLabel.SetCaption(const Value : TCaption);
var
  Buffer: Array[0..255] of Char;
begin
  if GetCaption <> Value then begin
    SetTextBuf(StrPCopy(Buffer, Value));
    StrCopy(charbuf, Buffer);
    Paint;  // Force a direct re-paint of label without any flicker
  end;
end;

{ Change type of dot matrix }
procedure TLCDLabel.SetDotMatrix(matrix : TDotMatrix);
var
  OldMatrix : TDotMatrix;
begin
  OldMatrix  := FDotMatrix;
  FDotMatrix := matrix;
  if (OldMatrix = CustomFont) then      { Can't use a custom as old - all data are erased }
    OldMatrix := mat5x7;
  if (matrix = CustomFont) then begin   { Custom font - load it from file }
    if (filename <> '') then begin
      FreeFontList(FontList);
      if not ReadCustomFont(filename) then
        FDotMatrix := OldMatrix;
    end else
      FDotMatrix := OldMatrix;
  end;
  Paint;
end;

{ Change border style }
procedure TLCDLabel.SetBorderStyle(bstyle : TMyBorder);
begin
  if bstyle <> FBorderStyle then begin
    FBorderStyle := bstyle;
    Paint;
  end;
end;

{ Change border color }
procedure TLCDLabel.SetBorderColor(bcolor : TColor);
begin
  if bcolor <> FBorderColor then begin
    FBorderColor := bcolor;
    Paint;
  end;
end;

{ Change shape of LCD pixels }
procedure TLCDLabel.SetPixelShape(pshape : TPixelShape);
begin
  if pshape <> FPixelShape then begin
    FPixelShape := pshape;
    Paint;
  end;
end;

{ Change pixel spacing (distance between the pixels in the LCD) }
procedure TLCDLabel.SetPixelSpacing(pspacing : integer);
begin
  if pspacing < 0 then
    MessageDlg('Pixel spacing can''t be less than zero!', mtError, [mbOK], 0)
  else begin
    if pspacing <> FPixelSpacing then begin
      FPixelSpacing := pspacing;
      Paint;
    end;
  end;
end;

{ Change character spacing (Distance between characters in the LCD) }
procedure TLCDLabel.SetCharSpacing(cspacing : integer);
begin
  if cspacing < 0 then
    MessageDlg('Character spacing can''t be less than zero!', mtError, [mbOK], 0)
  else begin
    if cspacing <> FCharSpacing then begin
      FCharSpacing := cspacing;
      Paint;
    end;
  end;
end;

{ Change space between lines in a multi-line LCD }
procedure TLCDLabel.SetLineSpacing(lspacing : integer);
begin
  if lspacing < 0 then
    MessageDlg('Line spacing can''t be less than zero!', mtError, [mbOK], 0)
  else begin
    if lspacing <> FLineSpacing then begin
      FLineSpacing := lspacing;
      Paint;
    end;
  end;
end;

{ Change LCD pixel size }
procedure TLCDLabel.SetPixelSize(psize : TPixelSize);
begin
  if psize <> FPixelSize then begin
    FPixelSize := psize;
    Paint;
  end;
end;

{ Set space between the border and character array }
procedure TLCDLabel.SetBorderSpace(bspace : integer);
begin
  if bspace < 0 then
    MessageDlg('Border spacing can''t be less than zero!', mtError, [mbOK], 0)
  else begin
    if bspace <> FBorderSpace then begin
      FBorderSpace := bspace;
      Paint;
    end;
  end;
end;

{ Set number of text lines on the LCD }
procedure TLCDLabel.SetTextLines(tlines : integer);
begin
  if tlines < 1 then
    MessageDlg('Display needs at least on line!', mtError, [mbOK], 0)
  else begin
    if tlines <> FTextLines then begin
      FTextLines := tlines;
      Paint;
    end;
  end;
end;

{ Set number of characters on one line (all lines are of same length) }
procedure TLCDLabel.SetNoOfChars(nchars : integer);
begin
  if nchars < 1 then
    MessageDlg('Display needs at least one character!', mtError, [mbOK], 0)
  else begin
    if nchars <> FNoOfChars then begin
      FNoOfChars := nchars;
      Paint;
    end;
  end;
end;

{ Set background color }
procedure TLCDLabel.SetBkgColor(bcolor : TColor);
begin
  if bcolor <> FBackGround then begin
    FBackGround := bcolor;
    Paint;
  end;
end;

{ Set pixel ON color }
procedure TLCDLabel.SetPixOnColor(ocolor : TColor);
begin
  if ocolor <> FPixOnColor then begin
    FPixOnColor := ocolor;
    CalcHalfColor;
    Paint;
  end;
end;

{ Set pixel OFF color }
procedure TLCDLabel.SetPixOffColor(ocolor : TColor);
begin
  if (ocolor <> FPixOffColor) then begin
    FPixOffColor := ocolor;
    Paint;
  end;
end;

{ Set pixel width }
procedure TLCDLabel.SetPixelWidth(pwidth : integer);
begin
  if (FPixelSize = pixCustom) then begin
    if (pwidth <> FPixWidth) then begin
      if (pwidth < 1) then
        MessageDlg('Display pixel width must be 1 or greater!', mtError, [mbOk], 0)
      else begin
        FPixWidth := pwidth;
        Paint;
      end;
    end;
  end;
end;

{ Set pixel height }
procedure TLCDLabel.SetPixelHeight(pheight : integer);
begin
  if (FPixelSize = pixCustom) then begin
    if (pheight <> FPixHeight) then begin
      if (pheight < 1) then
        MessageDlg('Display pixel height must be 1 or greate!', mtError, [mbOk], 0)
      else begin
        FPixHeight := pheight;
        Paint;
      end;
    end;
  end;
end;

{ Set custom font file name property }
procedure TLCDLabel.SetFileName(fname : T_FileName);
begin
  FFilename := fname;
  DotMatrix := CustomFont;
  Paint;
end;

{ Component registration }
procedure Register;
begin
  RegisterComponents('Illuwatar', [TLCDLabel]);
 // RegisterPropertyEditor(TypeInfo(T_FileName), TLCDLabel, 'filename', TFileNameProperty);
end;

end.
