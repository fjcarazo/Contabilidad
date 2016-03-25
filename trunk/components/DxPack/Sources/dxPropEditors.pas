
{*******************************************************************}
{                                                                   }
{   Design eXperince Visual Component Library                       }
{   DesignTime Property Editors                                     }
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

unit dxPropEditors;

{$I dxVer.inc}

interface

uses
{$IFDEF DELPHI6}
  DesignIntf,
  DesignEditors,
  VCLEditors,
{$ELSE}
  Contnrs,
  DsgnIntf,
{$ENDIF}
  Classes, Windows, TypInfo, SysUtils, Forms, ImgList, ActnList, Graphics;

type
{$IFDEF DELPHI6}
  TDesignerSelectionList = IDesignerSelections;
{$ELSE}
  //TDesignerSelectionList = TComponentList;
{$ENDIF}

{ TdxCustomImageIndexPropertyEditor }

  TdxCustomImageIndexPropertyEditor = class(TIntegerProperty
    {$IFDEF DELPHI6}, ICustomPropertyListDrawing{$ENDIF})
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetImageListAt(Index: Integer): TCustomImageList; virtual;

    // ICustomPropertyListDrawing
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); {$IFNDEF DELPHI6} override; {$ENDIF}
    procedure ListMeasureWidth(const Value: string; ACanvas: TCanvas;
      var AWidth: Integer); {$IFNDEF DELPHI6} override; {$ENDIF}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF DELPHI6} override; {$ENDIF}
  end;

{ TdxItemImageIndexPropertyEditor }

  TdxItemImageIndexPropertyEditor = class(TdxCustomImageIndexPropertyEditor)
  public
    function GetImageListAt(Index: Integer): TCustomImageList; override;
  end;

{ TdxWinXPBarItemEditor }

  TdxWinXPBarItemEditor = class(TDefaultEditor)
  protected
  {$IFDEF DELPHI6}
    procedure RunPropertyEditor(const Prop: IProperty);
  {$ELSE}
    procedure RunPropertyEditor(Prop: TPropertyEditor);
  {$ENDIF}
  public
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure Edit; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

procedure Register;

implementation

uses
  dxWinXPBar;

type
{ TCustomWinXPBar }

  TCustomWinXPBar = class(TdxCustomWinXPBar)
  public
    property HotTrackColor;
  end;

{-----------------------------------------------------------------------------
  Procedure: Register
  Author:    mh
  Date:      28-Okt-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TImageIndex), TdxWinXPBarItem, 'ImageIndex',
    TdxItemImageIndexPropertyEditor);
  RegisterComponentEditor(TdxWinXPBar, TdxWinXPBarItemEditor);
end;

{ TdxCustomImageIndexPropertyEditor }

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.GetAttributes
  Author:    mh
  Date:      28-Okt-2002
  Arguments: None
  Result:    TPropertyAttributes
-----------------------------------------------------------------------------}

function TdxCustomImageIndexPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paRevertable];
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.GetImageListAt
  Author:    mh
  Date:      28-Okt-2002
  Arguments: Index: Integer
  Result:    TCustomImageList
-----------------------------------------------------------------------------}

function TdxCustomImageIndexPropertyEditor.GetImageListAt(Index: Integer):
  TCustomImageList;
begin
  Result := nil;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.GetValues
  Author:    mh
  Date:      28-Okt-2002
  Arguments: Proc: TGetStrProc
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomImageIndexPropertyEditor.GetValues(Proc: TGetStrProc);
var
  ImgList: TCustomImageList;
  i: Integer;
begin
  ImgList := GetImageListAt(0);
  if Assigned(ImgList) then
  for i := 0 to ImgList.Count -1 do
    Proc(IntToStr(I));
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.ListDrawValue
  Author:    mh
  Date:      28-Okt-2002
  Arguments: const Value: string; ACanvas: TCanvas; const ARect: TRect;
    ASelected: Boolean
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomImageIndexPropertyEditor.ListDrawValue(const Value: string;
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  ImgList: TCustomImageList;
  x: Integer;
begin
  ImgList := GetImageListAt(0);
  ACanvas.FillRect(ARect);
  x := ARect.Left + 2;
  if Assigned(ImgList) then
  begin
    ImgList.Draw(ACanvas, x, ARect.Top + 2, StrToInt(Value));
    Inc(x, ImgList.Width);
  end;
  ACanvas.TextOut(x + 3, ARect.Top + 1, Value);
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.ListMeasureHeight
  Author:    mh
  Date:      28-Okt-2002
  Arguments: const Value: string; ACanvas: TCanvas; var AHeight: Integer
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomImageIndexPropertyEditor.ListMeasureHeight(const Value: string;
  ACanvas: TCanvas; var AHeight: Integer);
var
  ImgList: TCustomImageList;
begin
  ImgList := GetImageListAt(0);
  AHeight := ACanvas.TextHeight(Value) + 2;
  if Assigned(ImgList) and (ImgList.Height + 4 > AHeight) then
    AHeight := ImgList.Height + 4;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxCustomImageIndexPropertyEditor.ListMeasureWidth
  Author:    mh
  Date:      28-Okt-2002
  Arguments: const Value: string; ACanvas: TCanvas; var AWidth: Integer
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxCustomImageIndexPropertyEditor.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
var
  ImgList: TCustomImageList;
begin
  ImgList := GetImageListAt(0);
  AWidth := ACanvas.TextWidth(Value) + 4;
  if Assigned(ImgList) then
    Inc(AWidth, ImgList.Width);
end;

{ TdxItemImageIndexPropertyEditor }

{-----------------------------------------------------------------------------
  Procedure: TdxItemImageIndexPropertyEditor.GetImageListAt
  Author:    mh
  Date:      29-Okt-2002
  Arguments: Index: Integer
  Result:    TCustomImageList
-----------------------------------------------------------------------------}

function TdxItemImageIndexPropertyEditor.GetImageListAt(Index: Integer):
  TCustomImageList;
var
  Item: TPersistent;
begin
  Result := nil;
  Item := GetComponent(Index);
  if not(Item is TdxWinXPBarItem) then
    Exit;
  Result := TdxWinXPBarItem(Item).Images;
end;

{ TdxWinXPBarItemEditor }

{-----------------------------------------------------------------------------
  Procedure: TdxWinXPBarItemEditor.Edit
  Author:    mh
  Date:      30-Okt-2002
  Arguments: None
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxWinXPBarItemEditor.Edit;
var
  Components: TDesignerSelectionList;
begin
{$IFDEF DELPHI6}
  Components := CreateSelectionList;
{$ELSE}
  Components := TDesignerSelectionList.Create;
{$ENDIF}
  Components.Add(Component);
  GetComponentProperties(Components, [tkClass], Designer, RunPropertyEditor);
end;

{-----------------------------------------------------------------------------
  Procedure: TdxWinXPBarItemEditor.ExecuteVerb
  Author:    mh
  Date:      30-Okt-2002
  Arguments: Index: Integer
  Result:    None
-----------------------------------------------------------------------------}

procedure TdxWinXPBarItemEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: // 'Item Editor...'
      Edit;

    1: // 'Restore Default Colors'
      with TCustomWinXPBar(Component) do
      begin
        Font.Color := $00E75100;
        HeaderFont.Color := $00E75100;
        HotTrackColor := $00FF7C35;
        if csDesigning in ComponentState then
          TCustomForm(Owner).Designer.Modified;
      end;

    2: // 'Restore Default Fonts'
      with TCustomWinXPBar(Component) do
      begin
        ParentFont := True;
        if csDesigning in ComponentState then
          TCustomForm(Owner).Designer.Modified;
      end;
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxWinXPBarItemEditor.GetVerb
  Author:    mh
  Date:      30-Okt-2002
  Arguments: Index: Integer
  Result:    string
-----------------------------------------------------------------------------}

function TdxWinXPBarItemEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Item Editor...';
    1: Result := 'Restore Default Colors';
    2: Result := 'Restore Default Fonts';
  end;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxWinXPBarItemEditor.GetVerbCount
  Author:    mh
  Date:      30-Okt-2002
  Arguments: None
  Result:    Integer
-----------------------------------------------------------------------------}

function TdxWinXPBarItemEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

{-----------------------------------------------------------------------------
  Procedure: TdxWinXPBarItemEditor.RunPropertyEditor
  Author:    mh
  Date:      30-Okt-2002
  Arguments: const Prop: IProperty
  Result:    None
-----------------------------------------------------------------------------}

{$IFDEF DELPHI6}
procedure TdxWinXPBarItemEditor.RunPropertyEditor(const Prop: IProperty);
{$ELSE}
procedure TdxWinXPBarItemEditor.RunPropertyEditor(Prop: TPropertyEditor);
{$ENDIF}
begin
  if UpperCase(Prop.GetName) = 'ITEMS' then
    Prop.Edit;
end;

end.

