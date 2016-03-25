
{*******************************************************}
{                                                       }
{                MiTeC DB Grid                          }
{           version 1.1 for Delphi 5,6                  }
{                                                       }
{           Copyright © 2002 Michal Mutl                }
{                                                       }
{*******************************************************}

{$DEFINE D6PLUS}

unit MDBGrid;

{$R-}

interface

uses
{$IFDEF D6PLUS}Variants, {$ENDIF}
  Windows, SysUtils, Messages, Classes, Controls, Forms, StdCtrls,
  Graphics, Grids, DBCtrls, Db, Menus, DBGrids, Registry;

type
  TColumnValue = (
    cvColor, cvWidth, cvFont, cvAlignment, cvReadOnly, cvImeMode, cvImeName,
      cvWordWrap, cvLookupDisplayFields,
    cvTitleColor, cvTitleCaption, cvTitleAlignment, cvTitleFont,
    cvFooterText, cvFooterAlignment, cvFooterFont,
    cvCheckboxActive, cvCheckboxColor, cvCheckboxType, cvCheckboxValueTrue,
      cvCheckboxValueFalse);
  TColumnValues = set of TColumnValue;

  TColumnRestoreParam = (crpColIndex, crpColWidths, crpSortMarker);
  TColumnRestoreParams = set of TColumnRestoreParam;

  TDBGridOption = (dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator,
    dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect,
    dgAlwaysShowSelection, dgMultiSelect, dgConfirmDelete, dgCancelOnExit,
    dgFlat, dgMultilineTitle, dgDrawMemoText, dgDrawGraphic, dgFooters,
      dgAutoFitColumns, dgRowSizing
    );

  TDBGridOptions = set of TDBGridOption;

const
  ColumnTitleValues = [cvTitleColor..cvTitleFont];
  ColumnFooterValues = [cvFooterText..cvFooterFont];
  ColumnCheckboxValues = [cvCheckboxColor..cvCheckboxValueFalse];

type
  TDBGColumn = class;
  TCustomMDBGrid = class;

  TSortMarker = (smNone, smDown, smUp);

  TColumnFooter = class(TPersistent)
  private
    FFont: TFont;
    FAlignment: TAlignment;
    FText: string;
    FColumn: TDBGColumn;
    function GetAlignment: TAlignment;
    function GetFont: TFont;
    function IsAlignmentStored: Boolean;
    function IsFontStored: Boolean;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetFont(const Value: TFont);
    procedure SetText(const Value: string);
    procedure FontChanged(Sender: TObject);
    function GetText: string;
  protected
    procedure RefreshDefaultFont;
  public
    constructor Create(Column: TDBGColumn);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultFont: TFont;
    function DefaultText: string;
    procedure RestoreDefaults; virtual;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored
      IsAlignmentStored;
    property Text: string read GetText write SetText;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
  end;

  TCheckType = (ctCheck, ctCross);

  TColumnCheckbox = class(TPersistent)
  private
    FActive: Boolean;
    FCheckType: TCheckType;
    FColor: TColor;
    FValueTrue, FValueFalse: variant;
    FColumn: TDBGColumn;
    function GetActive: boolean;
    function GetValueFalse: variant;
    function GetValueTrue: variant;
    function IsActiveStored: Boolean;
    function IsValueFalseStored: Boolean;
    function IsValueTrueStored: Boolean;
    procedure SetActive(const Value: boolean);
    procedure SetValueFalse(const Value: variant);
    procedure SetValueTrue(const Value: variant);
    function GetColor: TColor;
    function GetCheckType: TCheckType;
    function IsColorStored: Boolean;
    function IsCheckTypeStored: Boolean;
    procedure SetColor(const Value: TColor);
    procedure SetCheckType(const Value: TCheckType);
  protected
  public
    constructor Create(Column: TDBGColumn);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultActive: boolean;
    function DefaultColor: TColor;
    function DefaultCheckType: TCheckType;
    function DefaultValueTrue: variant;
    function DefaultValueFalse: variant;
    procedure RestoreDefaults; virtual;
  published
    property Active: boolean read GetActive write SetActive stored
      IsActiveStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property CheckType: TCheckType read GetCheckType write SetCheckType stored
      IsCheckTypeStored;
    property ValueTrue: variant read GetValueTrue write SetValueTrue stored
      IsValueTrueStored;
    property ValueFalse: variant read GetValueFalse write SetValueFalse stored
      IsValueFalseStored;
  end;

  TColumnTitle = class(TPersistent)
  private
    FColumn: TDBGColumn;
    FCaption: string;
    FFont: TFont;
    FColor: TColor;
    FAlignment: TAlignment;
    FEndEllipsis: Boolean;
    procedure FontChanged(Sender: TObject);
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetCaption: string;
    function GetFont: TFont;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsCaptionStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetColor(Value: TColor);
    procedure SetFont(Value: TFont);
    procedure SetCaption(const Value: string); virtual;
    procedure SetEndEllipsis(const Value: Boolean);
  protected
    FTitleButton: Boolean;
    FSortMarker: TSortMarker;
    procedure SetTitleButton(Value: Boolean);
    procedure SetSortMarker(Value: TSortMarker);
    procedure RefreshDefaultFont;
  public
    constructor Create(Column: TDBGColumn);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function DefaultCaption: string;
    procedure RestoreDefaults; virtual;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored
      IsAlignmentStored;
    property Caption: string read GetCaption write SetCaption stored
      IsCaptionStored;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;

    property TitleButton: Boolean read FTitleButton write SetTitleButton;
    property SortMarker: TSortMarker read FSortMarker write SetSortMarker;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis;
  end;

  TDBGColumn = class(TCollectionItem)
  private
    FField: TField;
    FFieldName: string;
    FColor: TColor;
    FWidth: Integer;
    FTitle: TColumnTitle;
    FFont: TFont;
    FImeMode: TImeMode;
    FImeName: TImeName;
    FPickList: TStrings;
    FPopupMenu: TPopupMenu;
    FDropDownRows: Cardinal;
    FButtonStyle: TColumnButtonStyle;
    FAlignment: TAlignment;
    FReadonly: Boolean;
    FAssignedValues: TColumnValues;
    FFooter: TColumnFooter;
    FCheckbox: TColumnCheckbox;
    procedure FontChanged(Sender: TObject);
    function GetAlignment: TAlignment;
    function GetColor: TColor;
    function GetField: TField;
    function GetFont: TFont;
    function GetImeMode: TImeMode;
    function GetImeName: TImeName;
    function GetPickList: TStrings;
    function GetReadOnly: Boolean;
    function GetWidth: Integer;
    function IsAlignmentStored: Boolean;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsImeModeStored: Boolean;
    function IsImeNameStored: Boolean;
    function IsReadOnlyStored: Boolean;
    function IsWidthStored: Boolean;
    procedure SetAlignment(Value: TAlignment); virtual;
    procedure SetButtonStyle(Value: TColumnButtonStyle);
    procedure SetColor(Value: TColor);
    procedure SetField(Value: TField); virtual;
    procedure SetFieldName(const Value: string);
    procedure SetFont(Value: TFont);
    procedure SetImeMode(Value: TImeMode); virtual;
    procedure SetImeName(Value: TImeName); virtual;
    procedure SetPickList(Value: TStrings);
    procedure SetPopupMenu(Value: TPopupMenu);
    procedure SetReadOnly(Value: Boolean); virtual;
    procedure SetTitle(Value: TColumnTitle);
    procedure SetWidth(Value: Integer); virtual;
    procedure SetFooter(const Value: TColumnFooter);
    function GetAutoFit: Boolean;
    procedure SetAutoFit(const Value: Boolean);
    procedure SetCheckbox(const Value: TColumnCheckbox);
  protected
    FAutoFit: Boolean;
    FInitWidth: Integer;
    FWordWrap: Boolean;
    FEndEllipsis: Boolean;
    FDropDownWidth: Integer;
    FLookupDisplayFields: string;
    FAlwaysShowEditButton: Boolean;
    FAutoDropDown: Boolean;
    function GetLookupDisplayFields: string;
    function GetWordWrap: Boolean;
    function IsWordWrapStored: Boolean;
    function IsLookupDisplayFieldsStored: Boolean;
    function DefaultLookupDisplayFields: string;
    function DefaultWordWrap: Boolean;
    procedure SetAlwaysShowEditButton(Value: Boolean);
    procedure SetAutoDropDown(Value: Boolean);
    procedure SetWordWrap(Value: Boolean); virtual;
    procedure SetLookupDisplayFields(Value: string); virtual;
    procedure SetDropDownWidth(Value: Integer);
    procedure SetEndEllipsis(const Value: Boolean);
    function CreateTitle: TColumnTitle; virtual;
    function CreateFooter: TColumnFooter; virtual;
    function CreateCheckbox: TColumnCheckbox; virtual;
    function GetGrid: TCustomMDBGrid;
    function GetDisplayName: string; override;
    procedure RefreshDefaultFont;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function DefaultAlignment: TAlignment;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function DefaultImeMode: TImeMode;
    function DefaultImeName: TImeName;
    function DefaultReadOnly: Boolean;
    function DefaultWidth: Integer;
    procedure RestoreDefaults; virtual;
    property Grid: TCustomMDBGrid read GetGrid;
    property AssignedValues: TColumnValues read FAssignedValues;
    property Field: TField read GetField write SetField;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment stored
      IsAlignmentStored;
    property AutoFit: Boolean read GetAutoFit write SetAutoFit default True;
    property ButtonStyle: TColumnButtonStyle read FButtonStyle write
      SetButtonStyle default cbsAuto;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property DropDownRows: Cardinal read FDropDownRows write FDropDownRows
      default 7;
    property FieldName: string read FFieldName write SetFieldName;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    property ImeMode: TImeMode read GetImeMode write SetImeMode stored
      IsImeModeStored;
    property ImeName: TImeName read GetImeName write SetImeName stored
      IsImeNameStored;
    property PickList: TStrings read GetPickList write SetPickList;
    property PopupMenu: TPopupMenu read FPopupMenu write SetPopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly stored
      IsReadOnlyStored;
    property Title: TColumnTitle read FTitle write SetTitle;
    property Footer: TColumnFooter read FFooter write SetFooter;
    property Checkbox: TColumnCheckbox read FCheckbox write SetCheckbox;
    property Width: Integer read GetWidth write SetWidth stored IsWidthStored;
    property AlwaysShowEditButton: Boolean read FAlwaysShowEditButton write
      SetAlwaysShowEditButton;
    property WordWrap: Boolean read GetWordWrap write SetWordWrap stored
      IsWordWrapStored;
    property EndEllipsis: Boolean read FEndEllipsis write SetEndEllipsis;
    property DropDownWidth: Integer read FDropDownWidth write SetDropDownWidth;
    property LookupDisplayFields: string read GetLookupDisplayFields write
      SetLookupDisplayFields stored IsLookupDisplayFieldsStored;
    property AutoDropDown: Boolean read FAutoDropDown write SetAutoDropDown;
  end;

  TDBGColumnClass = class of TDBGColumn;

  TDBGGridColumns = class(TCollection)
  private
    FGrid: TCustomMDBGrid;
    function GetColumn(Index: Integer): TDBGColumn;
    function GetState: TDBGridColumnsState;
    procedure SetColumn(Index: Integer; Value: TDBGColumn);
    procedure SetState(NewState: TDBGridColumnsState);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Grid: TCustomMDBGrid; ColumnClass: TDBGColumnClass);
    function Add: TDBGColumn;
    procedure LoadFromFile(const Filename: string);
    procedure LoadFromStream(S: TStream);
    procedure RestoreDefaults;
    procedure RebuildColumns;
    procedure SaveToFile(const Filename: string);
    procedure SaveToStream(S: TStream);
    property State: TDBGridColumnsState read GetState write SetState;
    property Grid: TCustomMDBGrid read FGrid;
    property Items[Index: Integer]: TDBGColumn read GetColumn write SetColumn;
      default;
  end;

  TGridDataLink = class(TDataLink)
  private
    FGrid: TCustomMDBGrid;
    FFieldCount: Integer;
    FFieldMapSize: Integer;
    FFieldMap: Pointer;
    FModified: Boolean;
    FInUpdateData: Boolean;
    FSparseMap: Boolean;
    function GetDefaultFields: Boolean;
    function GetFields(I: Integer): TField;
  protected
    procedure ActiveChanged; override;
    procedure DataSetChanged; override;
    procedure DataSetScrolled(Distance: Integer); override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure EditingChanged; override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
    function GetMappedIndex(ColIndex: Integer): Integer;
  public
    constructor Create(AGrid: TCustomMDBGrid);
    destructor Destroy; override;
    function AddMapping(const FieldName: string): Boolean;
    procedure ClearMapping;
    procedure Modified;
    procedure Reset;
    property DefaultFields: Boolean read GetDefaultFields;
    property FieldCount: Integer read FFieldCount;
    property Fields[I: Integer]: TField read GetFields;
    property SparseMap: Boolean read FSparseMap write FSparseMap;
  end;

  TRecordmarkList = class
  private
    FList: TStringList;
    FGrid: TCustomMDBGrid;
    FCache: TBookmarkStr;
    FCacheIndex: Integer;
    FCacheFind: Boolean;
    FLinkActive: Boolean;
    function GetCount: Integer;
    function GetCurrentRowSelected: Boolean;
    function GetItem(Index: Integer): TBookmarkStr;
    procedure SetCurrentRowSelected(Value: Boolean);
    procedure StringsChanged(Sender: TObject);
  protected
    function CurrentRow: TBookmarkStr;
    function Compare(const Item1, Item2: TBookmarkStr): Integer;
    procedure LinkActive(Value: Boolean);
  public
    constructor Create(AGrid: TCustomMDBGrid);
    destructor Destroy; override;
    procedure Clear;
    procedure Delete;
    function Find(const Item: TBookmarkStr; var Index: Integer): Boolean;
    function IndexOf(const Item: TBookmarkStr): Integer;
    function Refresh: Boolean;
    property Count: Integer read GetCount;
    property CurrentRowSelected: Boolean read GetCurrentRowSelected
      write SetCurrentRowSelected;
    property Items[Index: Integer]: TBookmarkStr read GetItem; default;
  end;

  THeadTreeNode = class;
  TMDBGrid = class;

  LeafCol = record
    FLeaf: THeadTreeNode;
    FColumn: TDBGColumn;
  end;

  PLeafCol = ^LeafCol;
  TLeafCol = array[0..MaxListSize - 1] of LeafCol;
  PTLeafCol = ^TLeafCol;

  {  THeadTreeNode }

  THeadTreeProc = procedure(node: THeadTreeNode) of object;
  THeadTreeNode = class(TObject)
  public
    Host: THeadTreeNode;
    Child: THeadTreeNode;
    Next: THeadTreeNode;
    Text: string;
    Height: Integer;
    Width: Integer;
    WIndent: Integer;
    Drawed: Boolean;
    constructor Create;
    constructor CreateText(AText: string; AHeight, AWidth: Integer);
    destructor Destroy; override;
    function Add(AAfter: THeadTreeNode; AText: string; AHeight, AWidth:
      Integer): THeadTreeNode;
    function AddChild(ANode: THeadTreeNode; AText: string; AHeight, AWidth:
      Integer): THeadTreeNode;
    function Find(ANode: THeadTreeNode): Boolean;
    procedure Union(AFrom, ATo: THeadTreeNode; AText: string; AHeight: Integer);
    procedure FreeAllChild;
    procedure CreateFieldTree(AGrid: TCustomMDBGrid);
    procedure DoForAllNode(proc: THeadTreeProc);
  end;

  TDrawDBGColumnCellEvent = procedure(Sender: TObject; const Rect: TRect;
    DataCol: Integer; Column: TDBGColumn; State: TGridDrawState) of object;
  TMDBGridClickEvent = procedure(Column: TDBGColumn) of object;

  TTitleClickEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TDBGColumn) of object;
  TCheckTitleBtnEvent = procedure(Sender: TObject; ACol: Longint;
    Column: TDBGColumn; var Enabled: Boolean) of object;
  TGetBtnParamsEvent = procedure(Sender: TObject; Column: TDBGColumn;
    AFont: TFont; var Background: TColor; var SortMarker: TSortMarker;
    IsDown: Boolean) of object;
  TGetCellParamsEvent = procedure(Sender: TObject; Column: TDBGColumn;
    AFont: TFont; var Background: TColor; State: TGridDrawState) of object;

  TCustomMDBGrid = class(TCustomGrid)
  private
    FIndicators: TImageList;
    FTitleFont: TFont;
    FReadOnly: Boolean;
    FOriginalImeName: TImeName;
    FOriginalImeMode: TImeMode;
    FUserChange: Boolean;
    FLayoutFromDataset: Boolean;
    FOptions: TDBGridOptions;
    FTitleOffset, FIndicatorOffset: Byte;
    FUpdateLock: Byte;
    FLayoutLock: Byte;
    FInColExit: Boolean;
    FDefaultDrawing: Boolean;
    FSelfChangingTitleFont: Boolean;
    FSelecting: Boolean;
    FSelRow: Integer;
    FDataLink: TGridDataLink;
    FOnColEnter: TNotifyEvent;
    FOnColExit: TNotifyEvent;
    FOnDrawDataCell: TDrawDataCellEvent;
    FOnDrawColumnCell: TDrawDBGColumnCellEvent;
    FEditText: string;
    FColumns: TDBGGridColumns;
    FOnEditButtonClick: TNotifyEvent;
    FOnColumnMoved: TMovedEvent;
    FBookmarks: TRecordmarkList;
    FSelectionAnchor: TBookmarkStr;
    FOnCellClick: TMDBGridClickEvent;
    FOnTitleClick: TMDBGridClickEvent;
    FOnGetCellParams: TGetCellParamsEvent;

    function AcquireFocus: Boolean;
    procedure DataChanged;
    procedure EditingChanged;
    function GetDataSource: TDataSource;
    function GetFieldCount: Integer;
    function GetFields(FieldIndex: Integer): TField;
    function GetSelectedField: TField;
    function GetSelectedIndex: Integer;
    procedure InternalLayout;
    procedure MoveCol(RawCol: Integer);
    procedure ReadColumns(Reader: TReader);
    procedure RecordChanged(Field: TField);
    procedure SetIme;
    procedure SetColumns(Value: TDBGGridColumns);
    procedure SetDataSource(Value: TDataSource);
    procedure SetOptions(Value: TDBGridOptions);
    procedure SetSelectedField(Value: TField);
    procedure SetSelectedIndex(Value: Integer);
    procedure SetTitleFont(Value: TFont);
    procedure TitleFontChanged(Sender: TObject);
    procedure UpdateData;
    procedure UpdateActive;
    procedure UpdateIme;
    procedure UpdateScrollBar;
    procedure UpdateRowCount;
    procedure WriteColumns(Writer: TWriter);
    procedure CMExit(var Message: TMessage); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentFontChanged(var Message: TMessage); message
      CM_PARENTFONTCHANGED;
    procedure CMDeferLayout(var Message); message cm_DeferLayout;
    procedure CMDesignHitTest(var Msg: TCMDesignHitTest); message
      CM_DESIGNHITTEST;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMIMEStartComp(var Message: TMessage); message
      WM_IME_STARTCOMPOSITION;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SetFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
  protected

    FUpdateFields: Boolean;
    FAcquireFocus: Boolean;
    FUpdatingEditor: Boolean;

    FTitleHeightFull: Integer;

    FMarginText: Boolean;
    FVTitleMargin: Integer;
    FHTitleMargin: Integer;

    FInitColWidth: TList;
    FMinAutoFitWidth: Integer;

    FFooterRowCount: Integer;

    FHeadTree: THeadTreeNode;
    FLeafFieldArr: PTLeafCol;
    FNewRowsHeight: Integer;
    FDefaultRowChanged: Boolean;
    FAllowWordWrap: Boolean; // True if RowsHeight+3>TextHeight
    FSortMarkerImages: TImageList;
    FPressedCol: Longint;
    FPressed: Boolean;
    FTracking: Boolean;
    FSwapButtons: Boolean;
    FOnCheckButton: TCheckTitleBtnEvent;
    FOnGetBtnParams: TGetBtnParamsEvent;
    FOnTitleBtnClick: TTitleClickEvent;
    FInplaceEditorButtonWidth: Integer;
    FFrozenCols: Integer;

    procedure Paint; override;

    procedure ClearPainted(node: THeadTreeNode);
    function SetChildTreeHeight(ANode: THeadTreeNode): Integer;

    procedure WriteMarginText(IsMargin: Boolean);
    procedure WriteVTitleMargin(Value: Integer);
    procedure WriteHTitleMargin(Value: Integer);

    function GetRowsHeight: Integer;
    procedure SetRowsHeight(Value: Integer);

    procedure RowHeightsChanged; override;
    function StdDefaultRowHeight: Integer;

    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure WMCancelMode(var Message: TMessage); message WM_CANCELMODE;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    function DataVisible: boolean;
    procedure DoTitleClick(ACol: Longint; AColumn: TDBGColumn); dynamic;
    procedure CheckTitleButton(ACol: Longint; var Enabled: Boolean); dynamic;
    procedure GetCellParams(Column: TDBGColumn; AFont: TFont; var Background:
      TColor;
      State: TGridDrawState); dynamic;
    procedure SetFrozenCols(Value: Integer);

    function RawToDataColumn(ACol: Integer): Integer;
    function DataToRawColumn(ACol: Integer): Integer;
    function AcquireLayoutLock: Boolean;
    procedure BeginLayout;
    procedure BeginUpdate;
    procedure CancelLayout;
    function CanEditAcceptKey(Key: Char): Boolean; override;
    function CanEditModify: Boolean; override;
    function CanEditShow: Boolean; override;
    procedure CellClick(Column: TDBGColumn); dynamic;
    procedure ColumnMoved(FromIndex, ToIndex: Longint); override;
    procedure ColEnter; dynamic;
    procedure ColExit; dynamic;
    procedure ColWidthsChanged; override;
    function CreateColumns: TDBGGridColumns; dynamic;
    function CreateEditor: TInplaceEdit; override;
    procedure CreateWnd; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DeferLayout;
    procedure DefaultHandler(var Msg); override;
    procedure DefineFieldMap; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState:
      TGridDrawState); override;
    procedure DrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); dynamic; { obsolete }
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TDBGColumn; State: TGridDrawState); dynamic;
    procedure EditButtonClick; dynamic;
    procedure EndLayout;
    procedure EndUpdate;
    function GetColField(DataCol: Integer): TField;
    function GetEditLimit: Integer; override;
    function GetEditMask(ACol, ARow: Longint): string; override;
    function GetEditText(ACol, ARow: Longint): string; override;
    function GetFieldValue(ACol: Integer): string;
    function HighlightCell(DataCol, DataRow: Integer; const Value: string;
      AState: TGridDrawState): Boolean; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure LayoutChanged; virtual;
    procedure LinkActive(Value: Boolean); virtual;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
    procedure Scroll(Distance: Integer); virtual;
    procedure SetColumnAttributes; virtual;
    procedure SetEditText(ACol, ARow: Longint; const Value: string); override;
    function StoreColumns: Boolean;
    procedure TimedScroll(Direction: TGridScrollDirection); override;
    procedure TitleClick(Column: TDBGColumn); dynamic;
    property Columns: TDBGGridColumns read FColumns write SetColumns;
    property DefaultDrawing: Boolean read FDefaultDrawing write FDefaultDrawing
      default True;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataLink: TGridDataLink read FDataLink;
    property LayoutLock: Byte read FLayoutLock;
    property Options: TDBGridOptions read FOptions write SetOptions
      default [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
      dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
    property ParentColor default False;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property SelectedRows: TRecordmarkList read FBookmarks;
    property TitleFont: TFont read FTitleFont write SetTitleFont;
    property UpdateLock: Byte read FUpdateLock;
    property OnColEnter: TNotifyEvent read FOnColEnter write FOnColEnter;
    property OnColExit: TNotifyEvent read FOnColExit write FOnColExit;
    property OnDrawDataCell: TDrawDataCellEvent read FOnDrawDataCell
      write FOnDrawDataCell; { obsolete }
    property OnDrawColumnCell: TDrawDBGColumnCellEvent read FOnDrawColumnCell
      write FOnDrawColumnCell;
    property OnEditButtonClick: TNotifyEvent read FOnEditButtonClick
      write FOnEditButtonClick;
    property OnColumnMoved: TMovedEvent read FOnColumnMoved write
      FOnColumnMoved;
    property OnCellClick: TMDBGridClickEvent read FOnCellClick write
      FOnCellClick;
    property OnTitleClick: TMDBGridClickEvent read FOnTitleClick write
      FOnTitleClick;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DefaultDrawDataCell(const Rect: TRect; Field: TField;
      State: TGridDrawState); { obsolete }
    procedure DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer;
      Column: TDBGColumn; State: TGridDrawState);
    function ValidFieldIndex(FieldIndex: Integer): Boolean;
    property EditorMode;
    property FieldCount: Integer read GetFieldCount;
    property Fields[FieldIndex: Integer]: TField read GetFields;
    property SelectedField: TField read GetSelectedField write SetSelectedField;
    property SelectedIndex: Integer read GetSelectedIndex write
      SetSelectedIndex;

    procedure DrawFooterCell(ACol, ARow: DWORD; AText: string; AAlignment:
      TAlignment; AFont: TFont);
    procedure DrawCheckBox(Rect: TRect; Field: TField; Color: TColor; CheckType:
      TCheckType; State: TGridDrawState; TrueValue: variant);
    procedure DrawBitmap(Rect: TRect; Field: TField; Color: TColor; State:
      TGridDrawState; Bitmap: TBitmap; Stretch, DrawText: boolean);
    property Canvas;
    property Col;
    property InplaceEditor;
    property LeftCol;
    property Row;
    property VisibleRowCount;
    property VisibleColCount;
    property IndicatorOffset: Byte read FIndicatorOffset;
    property TitleOffset: Byte read FTitleOffset;

    //    property FooterRowCount: Integer read GetFooterRowCount write SetFooterRowCount;
    property RowsHeight: Integer read GetRowsHeight write SetRowsHeight;
    property FrozenCols: Integer read FFrozenCols write SetFrozenCols;
    property OnCheckButton: TCheckTitleBtnEvent read FOnCheckButton write
      FOnCheckButton;
    property OnGetBtnParams: TGetBtnParamsEvent read FOnGetBtnParams write
      FOnGetBtnParams;
    property OnTitleBtnClick: TTitleClickEvent read FOnTitleBtnClick write
      FOnTitleBtnClick;
    property OnGetCellParams: TGetCellParamsEvent read FOnGetCellParams write
      FOnGetCellParams;
  end;

  TMDBGrid = class(TCustomMDBGrid)
  public
    property GridHeight;
    property RowCount;
    property Canvas;
    property SelectedRows;
  published
    property Align;
    property BorderStyle;
    property Color;
    property Columns stored False;
    property Ctl3D;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RowsHeight;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell; { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property OnTitleClick;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property OnEndDock;
    property OnStartDock;
    property FrozenCols;
    property OnCheckButton;
    property OnGetBtnParams;
    property OnTitleBtnClick;
    property OnGetCellParams;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

  {const
    IndicatorWidth=11;}

procedure WriteTextEx(ACanvas: TCanvas; // Canvas
  ARect: TRect; // Draw rect and ClippingRect
  FillRect: Boolean; // Fill rect Canvas.Brash.Color
  DX, DY: Integer; // InflateRect(Rect, -DX, -DY) for text
  const Text: string; // Draw text
  Alignment: TAlignment; // Text alignment
  Layout: TTextLayout; // Text layout
  MultyL: Boolean; // Word break
  EndEllipsis: Boolean; // Truncate long text by ellipsis
  LeftMarg, // Left margin
  RightMarg: Integer); // Right margin

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);

implementation

uses DBConsts, Dialogs;

{$R MDBGRID.RES}

const
  bmArrow = 'MDBGARROW';
  bmEdit = 'MDBEDIT';
  bmInsert = 'MDBINSERT';
  bmMultiDot = 'MDBMULTIDOT';
  bmMultiArrow = 'MDBMULTIARROW';
  //ddd
  bmSmDown = 'MDBSMDOWN';
  bmSmUp = 'MDBSMUP';
  //\\\

  MaxMapSize = (MaxInt div 2) div SizeOf(Integer); { 250 million }

  { Error reporting }

procedure RaiseGridError(const S: string);
begin
  raise EInvalidGridOperation.Create(S);
end;

procedure KillMessage(Wnd: HWnd; Msg: Integer);
// Delete the requested message from the queue, but throw back
// any WM_QUIT msgs that PeekMessage may also return
var
  M: TMsg;
begin
  M.Message := 0;
  if PeekMessage(M, Wnd, Msg, Msg, pm_Remove) and (M.Message = WM_QUIT) then
    PostQuitMessage(M.wparam);
end;

//ddd

//Pure RX
type
  //ddd
  TCharSet = set of Char;
  //\\\

function ExtractWord(N: Integer; const S: string; WordDelims: TCharSet): string;
  forward;

function GetDefaultSection(Component: TComponent): string;
var
  F: TCustomForm;
  Owner: TComponent;
begin
  if Component <> nil then
  begin
    if Component is TCustomForm then
      Result := Component.ClassName
    else
    begin
      Result := Component.Name;
      if Component is TControl then
      begin
        F := GetParentForm(TControl(Component));
        if F <> nil then
          Result := F.ClassName + Result
        else
        begin
          if TControl(Component).Parent <> nil then
            Result := TControl(Component).Parent.Name + Result;
        end;
      end
      else
      begin
        Owner := Component.Owner;
        if Owner is TForm then
          Result := Format('%s.%s', [Owner.ClassName, Result]);
      end;
    end;
  end
  else
    Result := '';
end;

function Max(A, B: Longint): Longint;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

function Min(A, B: Longint): Longint;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function iif(Condition: Boolean; V1, V2: Integer): Integer;
begin
  if (Condition) then
    Result := V1
  else
    Result := V2;
end;

//\\\

procedure GridInvalidateRow(Grid: TCustomMDBGrid; Row: Longint);
var
  I: Longint;
begin
  for I := 0 to Grid.ColCount - 1 do
    Grid.InvalidateCell(I, Row);
end;

{ TDBGridInplaceEdit }

{ TDBGridInplaceEdit adds support for a button on the in-place editor,
  which can be used to drop down a table-based lookup list, a stringlist-based
  pick list, or (if button style is esEllipsis) fire the grid event
  OnEditButtonClick.  }

type
  TEditStyle = (esSimple, esEllipsis, esPickList, esDataList);
  TPopupListbox = class;

  TDBGridInplaceEdit = class(TInplaceEdit)
  private
    FButtonWidth: Integer;
    FDataList: TDBLookupListBox;
    FPickList: TPopupListbox;
    FActiveList: TWinControl;
    FLookupSource: TDatasource;
    FEditStyle: TEditStyle;
    FListVisible: Boolean;
    FTracking: Boolean;
    FPressed: Boolean;
    procedure ListMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    //ddd
    procedure ListMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    //\\\
    procedure SetEditStyle(Value: TEditStyle);
    procedure StopTracking;
    procedure TrackButton(X, Y: Integer);
    procedure CMCancelMode(var Message: TCMCancelMode); message CM_CancelMode;
    procedure WMCancelMode(var Message: TMessage); message WM_CancelMode;
    procedure WMKillFocus(var Message: TMessage); message WM_KillFocus;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message
      wm_LButtonDblClk;
    procedure WMPaint(var Message: TWMPaint); message wm_Paint;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SetCursor;
  protected
    procedure BoundsChanged; override;
    procedure CloseUp(Accept: Boolean);
    procedure DoDropDownKeys(var Key: Word; Shift: TShiftState);
    procedure DropDown;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure PaintWindow(DC: HDC); override;
    procedure UpdateContents; override;
    procedure WndProc(var Message: TMessage); override;
    property EditStyle: TEditStyle read FEditStyle write SetEditStyle;
    property ActiveList: TWinControl read FActiveList write FActiveList;
    property DataList: TDBLookupListBox read FDataList;
    property PickList: TPopupListbox read FPickList;
  public
    constructor Create(Owner: TComponent); override;
  end;

  { TPopupListbox }

  TPopupListbox = class(TCustomListbox)
  private
    FSearchText: string;
    FSearchTickCount: Longint;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      override;
  end;

procedure TPopupListBox.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupListbox.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupListbox.Keypress(var Key: Char);
var
  TickCount: Integer;
begin
  case Key of
    #8, #27: FSearchText := '';
    #32..#255:
      begin
        TickCount := GetTickCount;
        if TickCount - FSearchTickCount > 2000 then
          FSearchText := '';
        FSearchTickCount := TickCount;
        if Length(FSearchText) < 32 then
          FSearchText := FSearchText + Key;
        SendMessage(Handle, LB_SelectString, WORD(-1),
          Longint(PChar(FSearchText)));
        Key := #0;
      end;
  end;
  inherited Keypress(Key);
end;

procedure TPopupListbox.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  TDBGridInPlaceEdit(Owner).CloseUp((X >= 0) and (Y >= 0) and
    (X < Width) and (Y < Height));
end;

constructor TDBGridInplaceEdit.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FLookupSource := TDataSource.Create(Self);
  FButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
  FEditStyle := esSimple;
end;

procedure TDBGridInplaceEdit.BoundsChanged;
var
  R: TRect;
begin
  SetRect(R, 2, 2, Width - 2, Height);
  if FEditStyle <> esSimple then
    Dec(R.Right, FButtonWidth);
  SendMessage(Handle, EM_SETRECTNP, 0, LongInt(@R));
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
  if SysLocale.FarEast then
    SetImeCompositionWindow(Font, R.Left, R.Top);
end;

procedure TDBGridInplaceEdit.CloseUp(Accept: Boolean);
var
  MasterField: TField;
  ListValue: Variant;
begin
  if FListVisible then
  begin
    if GetCapture <> 0 then
      SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
    if FActiveList = FDataList then
      ListValue := FDataList.KeyValue
    else if FPickList.ItemIndex <> -1 then
      ListValue := FPickList.Items[FPicklist.ItemIndex];
    SetWindowPos(FActiveList.Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_HIDEWINDOW);
    FListVisible := False;
    if Assigned(FDataList) then
      FDataList.ListSource := nil;
    FLookupSource.Dataset := nil;
    Invalidate;
    if Accept then
    begin
      if FActiveList = FDataList then
        with TCustomMDBGrid(Grid), Columns[SelectedIndex].Field do
        begin
          MasterField := DataSet.FieldByName(KeyFields);
          if MasterField.CanModify then
          begin
            DataSet.Edit;
            try
              MasterField.Value := ListValue;
              //ddd
            except
              on Exception do
              begin
                Text :=
                  TCustomMDBGrid(Grid).Columns[TCustomMDBGrid(Grid).SelectedIndex].Field.Text + ' '; //May be delphi bag. But without ' ' don't assign
                raise;
              end;
            end;
            Text := FDataList.SelectedItem;
            //\\\
          end;
        end
      else if (not VarIsNull(ListValue)) and EditCanModify then
        with TCustomMDBGrid(Grid), Columns[SelectedIndex].Field do
          Text := ListValue
    end
      //ddd
    else if FActiveList = FDataList then
      Text :=
        TCustomMDBGrid(Grid).Columns[TCustomMDBGrid(Grid).SelectedIndex].Field.Text;
    //\\\
  end;
end;

procedure TDBGridInplaceEdit.DoDropDownKeys(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_UP, VK_DOWN:
      if ssAlt in Shift then
      begin
        if FListVisible then
          CloseUp(True)
        else
          DropDown;
        Key := 0;
      end;
    VK_RETURN, VK_ESCAPE:
      if FListVisible and not (ssAlt in Shift) then
      begin
        CloseUp(Key = VK_RETURN);
        Key := 0;
      end;
  end;
end;

procedure TDBGridInplaceEdit.DropDown;
var
  P: TPoint;
  I, J, Y: Integer;
  Column: TDBGColumn;
  //ddd
  TM: TTextMetric;
  RestoreCanvas: Boolean;
  fList: TList;
  dlcw: Integer;
  //\\\
begin
  if not FListVisible and Assigned(FActiveList) then
  begin
    FActiveList.Width := Width;
    with TCustomMDBGrid(Grid) do
      Column := Columns[SelectedIndex];
    if FActiveList = FDataList then
      with Column.Field do
      begin
        FDataList.Color := Color;
        FDataList.Font := Font;
        FDataList.RowCount := Column.DropDownRows;
        FLookupSource.DataSet := LookupDataSet;
        FDataList.KeyField := LookupKeyFields;
        //ddd      FDataList.ListField:={ddd LookupResultField}Column.LookupDisplayFields;
        FDataList.ListSource := FLookupSource;
        FDataList.KeyValue := DataSet.FieldByName(KeyFields).Value;
        //ddd
        FDataList.ListFieldIndex := 0;
        if (Column.DropDownWidth = -1) then
        begin
          RestoreCanvas := not HandleAllocated;
          if RestoreCanvas then
            TCustomMDBGrid(Grid).Canvas.Handle := GetDC(0);
          try
            fList := TList.Create;
            LookupDataSet.GetFieldList(fList, Column.LookupDisplayFields);
            TCustomMDBGrid(Grid).Canvas.Font := Self.Font;
            GetTextMetrics(TCustomMDBGrid(Grid).Canvas.Handle, TM);
            dlcw := 0;
            for i := 0 to fList.Count - 1 do
            begin
              Inc(dlcw, TField(fList[i]).DisplayWidth *
                (TCustomMDBGrid(Grid).Canvas.TextWidth('0') - TM.tmOverhang)
                + TM.tmOverhang + 4);
              if (TField(fList[i]).FieldName = LookupResultField) then
                FDataList.ListFieldIndex := i;
            end;
            FDataList.ClientWidth := dlcw;
            if (FDataList.Width < Self.Width) then
              FDataList.Width := Self.Width;
            fList.Free;
          finally
            if RestoreCanvas then
            begin
              ReleaseDC(0, TCustomMDBGrid(Grid).Canvas.Handle);
              TCustomMDBGrid(Grid).Canvas.Handle := 0;
            end;
          end
        end
        else if (Column.DropDownWidth > 0) then
          FDataList.ClientWidth := Column.DropDownWidth;
        FDataList.ListField := Column.LookupDisplayFields;
          // Assignment ListField must be after ListFieldIndex
        //\\\
  {      J:=Column.DefaultWidth;
        if J>FDataList.ClientWidth then
          FDataList.ClientWidth:=J;
     }
      end
    else
    begin
      FPickList.Color := Color;
      FPickList.Font := Font;
      FPickList.Items := Column.Picklist;
      if FPickList.Items.Count >= Column.DropDownRows then
        FPickList.Height := Column.DropDownRows * FPickList.ItemHeight + 4
      else
        FPickList.Height := FPickList.Items.Count * FPickList.ItemHeight + 4;
      if Column.Field.IsNull then
        FPickList.ItemIndex := -1
      else
        FPickList.ItemIndex := FPickList.Items.IndexOf(Column.Field.Value);
      J := FPickList.ClientWidth;
      for I := 0 to FPickList.Items.Count - 1 do
      begin
        Y := FPickList.Canvas.TextWidth(FPickList.Items[I]);
        if Y > J then
          J := Y;
      end;
      FPickList.ClientWidth := J;
    end;
    P := Parent.ClientToScreen(Point(Left, Top));
    Y := P.Y + Height;
    if Y + FActiveList.Height > Screen.Height then
      Y := P.Y - FActiveList.Height;
    //ddd Drop Down Width
    if (FActiveList.Width > Screen.Width) then
      FActiveList.Width := Screen.Width;
    if (P.X + FActiveList.Width > Screen.Width) then
      P.X := Screen.Width - FActiveList.Width;
    //\\
    SetWindowPos(FActiveList.Handle, HWND_TOP, P.X, Y, 0, 0,
      SWP_NOSIZE or SWP_NOACTIVATE or SWP_SHOWWINDOW);
    FListVisible := True;
    Invalidate;
    Windows.SetFocus(Handle);
  end;
end;

type
  TWinControlCracker = class(TWinControl)
  end;

procedure TDBGridInplaceEdit.KeyDown(var Key: Word; Shift: TShiftState);
//ddd
var
  MasterField, Field: TField;
  //\\\
begin
  if (EditStyle = esEllipsis) and (Key = VK_RETURN) and (Shift = [ssCtrl]) then
  begin
    TCustomMDBGrid(Grid).EditButtonClick;
    KillMessage(Handle, WM_CHAR);
  end
  else
    {//ddd} if (EditStyle = esDataList) and (Key = VK_DELETE) and (Shift = [])
      and (SelStart = 0) and (SelLength = Length(Text)) then
    begin
      Field :=
        TCustomMDBGrid(Grid).Columns[TCustomMDBGrid(Grid).SelectedIndex].Field;
      MasterField := Field.DataSet.FieldByName(Field.KeyFields);
      if MasterField.CanModify then
      begin
        MasterField.DataSet.Edit;
        MasterField.Clear;
        Text := '';
        Field.Clear;
        //\\\
      end;
    end
    else
      //\\\
      inherited KeyDown(Key, Shift);
end;

procedure TDBGridInplaceEdit.ListMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    CloseUp(PtInRect(FActiveList.ClientRect, Point(X, Y)));
end;

//ddd

procedure TDBGridInplaceEdit.ListMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (FEditStyle = esDataList) and (FDataList <> nil) and (ssLeft in Shift) then
    Text := FDataList.SelectedItem;
end;

procedure TDBGridInplaceEdit.ListMouseDown(Sender: TObject; Button:
  TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (FEditStyle = esDataList) and (FDataList <> nil) and (ssLeft in Shift) then
    Text := FDataList.SelectedItem;
end;
//\\\

procedure TDBGridInplaceEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Button = mbLeft) and (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(X, Y)) then
  begin
    if FListVisible then
      CloseUp(False)
    else
    begin
      MouseCapture := True;
      FTracking := True;
      TrackButton(X, Y);
      if Assigned(FActiveList) then
        DropDown;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TDBGridInplaceEdit.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ListPos: TPoint;
  MousePos: TSmallPoint;
begin
  if FTracking then
  begin
    TrackButton(X, Y);
    if FListVisible then
    begin
      ListPos := FActiveList.ScreenToClient(ClientToScreen(Point(X, Y)));
      if PtInRect(FActiveList.ClientRect, ListPos) then
      begin
        StopTracking;
        MousePos := PointToSmallPoint(ListPos);
        SendMessage(FActiveList.Handle, WM_LBUTTONDOWN, 0, Integer(MousePos));
        Exit;
      end;
    end;
  end;
  inherited MouseMove(Shift, X, Y);
end;

procedure TDBGridInplaceEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  WasPressed: Boolean;
begin
  WasPressed := FPressed;
  StopTracking;
  if (Button = mbLeft) and (FEditStyle = esEllipsis) and WasPressed then
    TCustomMDBGrid(Grid).EditButtonClick;
  inherited MouseUp(Button, Shift, X, Y);
end;

//ddd

procedure PaintInplaceButton(DC: HDC; EditStyle: TEditStyle; Rect: TRect;
  Pressed, Active: Boolean);
var
  W, H, Flags, VFlags: Integer;
begin
  Flags := 0;
  if EditStyle <> esSimple then
    if EditStyle in [esDataList, esPickList] then
    begin
      if Active = False then
        Flags := DFCS_INACTIVE
      else if Pressed then
        Flags := DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(DC, Rect, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    end
    else { esEllipsis }
    begin
      if Pressed then
        Flags := BF_FLAT;
      DrawEdge(DC, Rect, EDGE_RAISED, BF_RECT or BF_MIDDLE or Flags);
      Flags := ((Rect.Right - Rect.Left) shr 1) - 1 + Ord(Pressed);
      VFlags := ((Rect.Bottom - Rect.Top) shr 1) - 1 + Ord(Pressed);
      W := (Rect.Right - Rect.Left) shr 3;
      H := (Rect.Bottom - Rect.Top) shr 3;
      if W = 0 then
        W := 1;
      if H = 0 then
        H := 1;
      if W > 2 then
        W := 2;
      if H > 2 then
        H := 2;
      PatBlt(DC, Rect.Left + Flags, Rect.Top + VFlags, W, H, BLACKNESS);
      PatBlt(DC, Rect.Left + Flags - (W * 2), Rect.Top + VFlags, W, H,
        BLACKNESS);
      PatBlt(DC, Rect.Left + Flags + (W * 2), Rect.Top + VFlags, W, H,
        BLACKNESS);
    end;
end;
//\\\

procedure TDBGridInplaceEdit.PaintWindow(DC: HDC);
var
  R: TRect;
  //ddd  Flags: Integer;
  //ddd  W: Integer;
begin
  if FEditStyle <> esSimple then
  begin
    SetRect(R, Width - FButtonWidth, 0, Width, Height);
    //ddd    Flags:=0;
        //ddd
    PaintInplaceButton(DC, FEditStyle, R, FPressed, True);
    (*if FEditStyle in [esDataList, esPickList] then
    begin
      ddd
      if FActiveList=nil then
        Flags:=DFCS_INACTIVE
      else if FPressed then
        Flags:=DFCS_FLAT or DFCS_PUSHED;
      DrawFrameControl(DC, R, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
    end
    else   { esEllipsis }
    begin
      if FPressed then
        Flags:=BF_FLAT;
      DrawEdge(DC, R, EDGE_RAISED, BF_RECT or BF_MIDDLE or Flags);
      Flags:=((R.Right-R.Left) shr 1)-1+Ord(FPressed);
      W:=Height shr 3;
      if W=0 then W:=1;
      PatBlt(DC, R.Left+Flags, R.Top+Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left+Flags-(W*2), R.Top+Flags, W, W, BLACKNESS);
      PatBlt(DC, R.Left+Flags+(W*2), R.Top+Flags, W, W, BLACKNESS);
    end;*)
    //\\\
    ExcludeClipRect(DC, R.Left, R.Top, R.Right, R.Bottom);
  end;
  inherited PaintWindow(DC);
end;

procedure TDBGridInplaceEdit.SetEditStyle(Value: TEditStyle);
begin
  if Value = FEditStyle then
    Exit;
  FEditStyle := Value;
  case Value of
    esPickList:
      begin
        if FPickList = nil then
        begin
          FPickList := TPopupListbox.Create(Self);
          FPickList.Visible := False;
          FPickList.Parent := Self;
          FPickList.OnMouseUp := ListMouseUp;
          FPickList.IntegralHeight := True;
          FPickList.ItemHeight := 11;
        end;
        FActiveList := FPickList;
      end;
    esDataList:
      begin
        if FDataList = nil then
        begin
          FDataList := TPopupDataList.Create(Self);
          FDataList.Visible := False;
          FDataList.Parent := Self;
          FDataList.OnMouseUp := ListMouseUp;
          //ddd
          FDataList.OnMouseMove := ListMouseMove;
          FDataList.OnMouseDown := ListMouseDown;
          //\\\
        end;
        FActiveList := FDataList;
      end;
  else { cbsNone, cbsEllipsis, or read only field }
    FActiveList := nil;
  end;
  with TCustomMDBGrid(Grid) do
    Self.ReadOnly := Columns[SelectedIndex].ReadOnly;
  Repaint;
end;

procedure TDBGridInplaceEdit.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TDBGridInplaceEdit.TrackButton(X, Y: Integer);
var
  NewState: Boolean;
  R: TRect;
begin
  SetRect(R, ClientWidth - FButtonWidth, 0, ClientWidth, ClientHeight);
  NewState := PtInRect(R, Point(X, Y));
  if FPressed <> NewState then
  begin
    FPressed := NewState;
    InvalidateRect(Handle, @R, False);
  end;
end;

function GetColumnEditStile(Column: TDBGColumn): TEditStyle;
var
  MasterField: TField;
  ACanModify: Boolean;
begin
  Result := esSimple;
  case Column.ButtonStyle of
    cbsEllipsis: Result := esEllipsis;
    cbsAuto:
      if Assigned(Column.Field) then
        with Column.Field do
        begin
          { Show the dropdown button only if the field is editable }
          if FieldKind = fkLookup then
          begin
            MasterField := Dataset.FieldByName(KeyFields);
            { Column.DefaultReadonly will always be True for a lookup field.
              Test if Column.ReadOnly has been assigned a value of True }
            //ddd
            ACanModify := MasterField.CanModify or (Assigned(Column.Grid) and
              (csDesigning in Column.Grid.ComponentState));
            //\\\
            if Assigned(MasterField) and {ddd MasterField.CanModify}  ACanModify
              and
            not ((cvReadOnly in Column.AssignedValues) and Column.ReadOnly) then
              with Column.Grid do
                if not ReadOnly and DataLink.Active and not Datalink.ReadOnly
                  then
                  Result := esDataList
          end
          else if Assigned(Column.Picklist) and (Column.PickList.Count > 0) and
            not Column.Readonly then
            Result := esPickList;
        end;
  end;
end;

procedure TDBGridInplaceEdit.UpdateContents;
var
  Column: TDBGColumn;
  NewStyle: TEditStyle;
  MasterField: TField;
  //ddd
  NewBackgrnd: TColor;
  //\\\
begin
  with TCustomMDBGrid(Grid) do
    Column := Columns[SelectedIndex];
  NewStyle := esSimple;
  case Column.ButtonStyle of
    cbsEllipsis: NewStyle := esEllipsis;
    cbsAuto:
      if Assigned(Column.Field) then
        with Column.Field do
        begin
          { Show the dropdown button only if the field is editable }
          if FieldKind = fkLookup then
          begin
            MasterField := Dataset.FieldByName(KeyFields);
            { Column.DefaultReadonly will always be True for a lookup field.
              Test if Column.ReadOnly has been assigned a value of True }
            if Assigned(MasterField) and MasterField.CanModify and
              not ((cvReadOnly in Column.AssignedValues) and Column.ReadOnly)
                then
              with TCustomMDBGrid(Grid) do
                if not ReadOnly and DataLink.Active and not Datalink.ReadOnly
                  then
                  NewStyle := esDataList
          end
          else if Assigned(Column.Picklist) and (Column.PickList.Count > 0) and
            not Column.Readonly then
            NewStyle := esPickList;
        end;
  end;
  EditStyle := NewStyle;
  //ddd Backgrnd And Color of Inplace Editor
  NewBackgrnd := Column.Color;
  Font.Assign(Column.Font);
  TCustomMDBGrid(Grid).GetCellParams(Column, Font, NewBackgrnd, [gdFocused]);
  Color := NewBackgrnd;
  //\\\
  inherited UpdateContents;
end;

procedure TDBGridInplaceEdit.CMCancelMode(var Message: TCMCancelMode);
begin
  if (Message.Sender <> Self) and (Message.Sender <> FActiveList) then
    CloseUp(False);
end;

procedure TDBGridInplaceEdit.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TDBGridInplaceEdit.WMKillFocus(var Message: TMessage);
begin
  if not SysLocale.FarEast then
    inherited
  else
  begin
    ImeName := Screen.DefaultIme;
    ImeMode := imDontCare;
    inherited;
    if Message.WParam <> TCustomMDBGrid(Grid).Handle then
      ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTIVATE);
  end;
  CloseUp(False);
end;

procedure TDBGridInplaceEdit.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  with Message do
    if (FEditStyle <> esSimple) and
      PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), Point(XPos, YPos))
        then
      Exit;
  inherited;
end;

procedure TDBGridInplaceEdit.WMPaint(var Message: TWMPaint);
begin
  PaintHandler(Message);
end;

procedure TDBGridInplaceEdit.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  GetCursorPos(P);
  if (FEditStyle <> esSimple) and
    PtInRect(Rect(Width - FButtonWidth, 0, Width, Height), ScreenToClient(P))
      then
    Windows.SetCursor(LoadCursor(0, idc_Arrow))
  else
    inherited;
end;

procedure TDBGridInplaceEdit.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    wm_KeyDown, wm_SysKeyDown, wm_Char:
      if EditStyle in [esPickList, esDataList] then
        with TWMKey(Message) do
        begin
          DoDropDownKeys(CharCode, KeyDataToShiftState(KeyData));
          //ddd
          if (CharCode <> 0) and (Message.Msg = wm_Char) and (Char(CharCode) in
            [#32..#255]) and not FListVisible
            and
              TCustomMDBGrid(Grid).Columns[TCustomMDBGrid(Grid).SelectedIndex].AutoDropDown then
            DropDown;
          //\\\
          if (CharCode <> 0) and FListVisible then
          begin
            with TMessage(Message) do
            begin
              SendMessage(FActiveList.Handle, Msg, WParam, LParam);
              //ddd
              if (FEditStyle = esDataList) and (FDataList <> nil) then
                Text := FDataList.SelectedItem;
              //\\\
            end;
            Exit;
          end;
        end
  end;
  inherited;
end;

//\\\

{ TGridDataLink }

type
  TIntArray = array[0..MaxMapSize] of Integer;
  PIntArray = ^TIntArray;

constructor TGridDataLink.Create(AGrid: TCustomMDBGrid);
begin
  inherited Create;
  FGrid := AGrid;
end;

destructor TGridDataLink.Destroy;
begin
  ClearMapping;
  inherited Destroy;
end;

function TGridDataLink.GetDefaultFields: Boolean;
var
  I: Integer;
begin
  Result := True;
  if DataSet <> nil then
    Result := DataSet.DefaultFields;
  if Result and SparseMap then
    for I := 0 to FFieldCount - 1 do
      if PIntArray(FFieldMap)^[I] < 0 then
      begin
        Result := False;
        Exit;
      end;
end;

function TGridDataLink.GetFields(I: Integer): TField;
begin
  if (0 <= I) and (I < FFieldCount) and (PIntArray(FFieldMap)^[I] >= 0) then
    Result := DataSet.Fields[PIntArray(FFieldMap)^[I]]
  else
    Result := nil;
end;

function TGridDataLink.AddMapping(const FieldName: string): Boolean;
var
  Field: TField;
  NewSize: Integer;
begin
  Result := True;
  if FFieldCount >= MaxMapSize then
    RaiseGridError(STooManyColumns);
  if SparseMap then
    Field := DataSet.FindField(FieldName)
  else
    Field := DataSet.FieldByName(FieldName);

  if FFieldCount = FFieldMapSize then
  begin
    NewSize := FFieldMapSize;
    if NewSize = 0 then
      NewSize := 8
    else
      Inc(NewSize, NewSize);
    if (NewSize < FFieldCount) then
      NewSize := FFieldCount + 1;
    if (NewSize > MaxMapSize) then
      NewSize := MaxMapSize;
    ReallocMem(FFieldMap, NewSize * SizeOf(Integer));
    FFieldMapSize := NewSize;
  end;
  if Assigned(Field) then
  begin
    PIntArray(FFieldMap)^[FFieldCount] := Field.Index;
    Field.FreeNotification(FGrid);
  end
  else
    PIntArray(FFieldMap)^[FFieldCount] := -1;
  Inc(FFieldCount);
end;

procedure TGridDataLink.ActiveChanged;
begin
  FGrid.LinkActive(Active);
end;

procedure TGridDataLink.ClearMapping;
begin
  if FFieldMap <> nil then
  begin
    FreeMem(FFieldMap, FFieldMapSize * SizeOf(Integer));
    FFieldMap := nil;
    FFieldMapSize := 0;
    FFieldCount := 0;
  end;
end;

procedure TGridDataLink.Modified;
begin
  FModified := True;
end;

procedure TGridDataLink.DataSetChanged;
begin
  FGrid.DataChanged;
  FModified := False;
end;

procedure TGridDataLink.DataSetScrolled(Distance: Integer);
begin
  FGrid.Scroll(Distance);
end;

procedure TGridDataLink.LayoutChanged;
var
  SaveState: Boolean;
begin
  { FLayoutFromDataset determines whether default column width is forced to
    be at least wide enough for the column title.  }
  SaveState := FGrid.FLayoutFromDataset;
  FGrid.FLayoutFromDataset := True;
  try
    FGrid.LayoutChanged;
  finally
    FGrid.FLayoutFromDataset := SaveState;
  end;
  inherited LayoutChanged;
end;

procedure TGridDataLink.FocusControl(Field: TFieldRef);
begin
  if Assigned(Field) and Assigned(Field^) then
  begin
    FGrid.SelectedField := Field^;
    if (FGrid.SelectedField = Field^) and FGrid.AcquireFocus then
    begin
      Field^ := nil;
      FGrid.ShowEditor;
    end;
  end;
end;

procedure TGridDataLink.EditingChanged;
begin
  FGrid.EditingChanged;
end;

procedure TGridDataLink.RecordChanged(Field: TField);
begin
  FGrid.RecordChanged(Field);
  FModified := False;
end;

procedure TGridDataLink.UpdateData;
begin
  FInUpdateData := True;
  try
    if FModified then
      FGrid.UpdateData;
    FModified := False;
  finally
    FInUpdateData := False;
  end;
end;

function TGridDataLink.GetMappedIndex(ColIndex: Integer): Integer;
begin
  if (0 <= ColIndex) and (ColIndex < FFieldCount) then
    Result := PIntArray(FFieldMap)^[ColIndex]
  else
    Result := -1;
end;

procedure TGridDataLink.Reset;
begin
  if FModified then
    RecordChanged(nil)
  else
    Dataset.Cancel;
end;

{ TColumnTitle }

constructor TColumnTitle.Create(Column: TDBGColumn);
begin
  inherited Create;
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
  //ddd
  FTitleButton := False;
  SortMarker := smNone;
  //\\\
end;

destructor TColumnTitle.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TColumnTitle.Assign(Source: TPersistent);
begin
  if Source is TColumnTitle then
  begin
    if cvTitleAlignment in TColumnTitle(Source).FColumn.FAssignedValues then
      Alignment := TColumnTitle(Source).Alignment;
    if cvTitleColor in TColumnTitle(Source).FColumn.FAssignedValues then
      Color := TColumnTitle(Source).Color;
    if cvTitleCaption in TColumnTitle(Source).FColumn.FAssignedValues then
      Caption := TColumnTitle(Source).Caption;
    if cvTitleFont in TColumnTitle(Source).FColumn.FAssignedValues then
      Font := TColumnTitle(Source).Font;
    //ddd
    TitleButton := TColumnTitle(Source).TitleButton;
    SortMarker := TColumnTitle(Source).SortMarker;
    EndEllipsis := TColumnTitle(Source).EndEllipsis;
    //\\\
  end
  else
    inherited Assign(Source);
end;

function TColumnTitle.DefaultAlignment: TAlignment;
begin
  Result := taLeftJustify;
end;

function TColumnTitle.DefaultColor: TColor;
var
  Grid: TCustomMDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.FixedColor
  else
    Result := clBtnFace;
end;

function TColumnTitle.DefaultFont: TFont;
var
  Grid: TCustomMDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.TitleFont
  else
    Result := FColumn.Font;
end;

function TColumnTitle.DefaultCaption: string;
var
  Field: TField;
begin
  Field := FColumn.Field;
  if Assigned(Field) then
    Result := Field.DisplayName
  else
    Result := FColumn.FieldName;
end;

procedure TColumnTitle.FontChanged(Sender: TObject);
begin
  Include(FColumn.FAssignedValues, cvTitleFont);
  FColumn.Changed(True);
end;

function TColumnTitle.GetAlignment: TAlignment;
begin
  if cvTitleAlignment in FColumn.FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TColumnTitle.GetColor: TColor;
begin
  if cvTitleColor in FColumn.FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TColumnTitle.GetCaption: string;
begin
  if cvTitleCaption in FColumn.FAssignedValues then
    Result := FCaption
  else
    Result := DefaultCaption;
end;

function TColumnTitle.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvTitleFont in FColumn.FAssignedValues) then
  begin
    Def := DefaultFont;
    if (FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TColumnTitle.IsAlignmentStored: Boolean;
begin
  Result := (cvTitleAlignment in FColumn.FAssignedValues) and
    (FAlignment <> DefaultAlignment);
end;

function TColumnTitle.IsColorStored: Boolean;
begin
  Result := (cvTitleColor in FColumn.FAssignedValues) and
    (FColor <> DefaultColor);
end;

function TColumnTitle.IsFontStored: Boolean;
begin
  Result := (cvTitleFont in FColumn.FAssignedValues);
end;

function TColumnTitle.IsCaptionStored: Boolean;
begin
  Result := (cvTitleCaption in FColumn.FAssignedValues) and
    (FCaption <> DefaultCaption);
end;

procedure TColumnTitle.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvTitleFont in FColumn.FAssignedValues) then
    Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnTitle.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvTitleFont in FColumn.FAssignedValues;
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnTitleValues;
  FCaption := '';
  RefreshDefaultFont;
  { If font was assigned, changing it back to default may affect grid title
    height, and title height changes require layout and redraw of the grid. }
  FColumn.Changed(FontAssigned);
end;

procedure TColumnTitle.SetAlignment(Value: TAlignment);
begin
  if (cvTitleAlignment in FColumn.FAssignedValues) and (Value = FAlignment) then
    Exit;
  FAlignment := Value;
  Include(FColumn.FAssignedValues, cvTitleAlignment);
  FColumn.Changed(False);
end;

procedure TColumnTitle.SetColor(Value: TColor);
begin
  if (cvTitleColor in FColumn.FAssignedValues) and (Value = FColor) then
    Exit;
  FColor := Value;
  Include(FColumn.FAssignedValues, cvTitleColor);
  FColumn.Changed(False);
end;

procedure TColumnTitle.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TColumnTitle.SetCaption(const Value: string);
begin
  if (cvTitleCaption in FColumn.FAssignedValues) and (Value = FCaption) then
    Exit;
  FCaption := Value;
  Include(FColumn.FAssignedValues, cvTitleCaption);
  FColumn.Changed(False);
end;

procedure TColumnTitle.SetTitleButton(Value: Boolean);
begin
  if (Value = FTitleButton) then
    Exit;
  FTitleButton := Value;
  FColumn.Changed(False);
end;

procedure TColumnTitle.SetSortMarker(Value: TSortMarker);
begin
  if (Value = FSortMarker) then
    Exit;
  FSortMarker := Value;
  FColumn.Changed(False);
end;

procedure TColumnTitle.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  FColumn.Changed(False);
end;

{ TDBGColumn }

constructor TDBGColumn.Create(Collection: TCollection);
var
  Grid: TCustomMDBGrid;
begin
  Grid := nil;
  if Assigned(Collection) and (Collection is TDBGGridColumns) then
    Grid := TDBGGridColumns(Collection).Grid;
  if Assigned(Grid) then
    Grid.BeginLayout;
  try
    inherited Create(Collection);
    FDropDownRows := 7;
    FButtonStyle := cbsAuto;
    FFont := TFont.Create;
    FFont.Assign(DefaultFont);
    FFont.OnChange := FontChanged;
    FImeMode := imDontCare;
    FImeName := Screen.DefaultIme;
    FTitle := CreateTitle;
    FFooter := CreateFooter;
    FCheckbox := CreateCheckbox;
    FInitWidth := Width;
    FAutoFit := True;
  finally
    if Assigned(Grid) then
      Grid.EndLayout;
  end;
end;

destructor TDBGColumn.Destroy;
begin
  FTitle.Free;
  FFooter.Free;
  FCheckbox.Free;
  FFont.Free;
  FPickList.Free;
  inherited Destroy;
end;

procedure TDBGColumn.Assign(Source: TPersistent);
begin
  if Source is TDBGColumn then
  begin
    if Assigned(Collection) then
      Collection.BeginUpdate;
    try
      RestoreDefaults;
      FieldName := TDBGColumn(Source).FieldName;
      if cvColor in TDBGColumn(Source).AssignedValues then
        Color := TDBGColumn(Source).Color;
      if cvWidth in TDBGColumn(Source).AssignedValues then
        Width := TDBGColumn(Source).Width;
      if cvFont in TDBGColumn(Source).AssignedValues then
        Font := TDBGColumn(Source).Font;
      if cvImeMode in TDBGColumn(Source).AssignedValues then
        ImeMode := TDBGColumn(Source).ImeMode;
      if cvImeName in TDBGColumn(Source).AssignedValues then
        ImeName := TDBGColumn(Source).ImeName;
      if cvAlignment in TDBGColumn(Source).AssignedValues then
        Alignment := TDBGColumn(Source).Alignment;
      if cvReadOnly in TDBGColumn(Source).AssignedValues then
        ReadOnly := TDBGColumn(Source).ReadOnly;
      Title := TDBGColumn(Source).Title;
      Footer := TDBGColumn(Source).Footer;
      Checkbox := TDBGColumn(Source).Checkbox;
      DropDownRows := TDBGColumn(Source).DropDownRows;
      ButtonStyle := TDBGColumn(Source).ButtonStyle;
      PickList := TDBGColumn(Source).PickList;
      PopupMenu := TDBGColumn(Source).PopupMenu;
      FInitWidth := TDBGColumn(Source).FInitWidth;
      if cvWordWrap in TDBGColumn(Source).AssignedValues then
        WordWrap := TDBGColumn(Source).WordWrap;
      EndEllipsis := TDBGColumn(Source).EndEllipsis;
      DropDownWidth := TDBGColumn(Source).DropDownWidth;
      if cvLookupDisplayFields in TDBGColumn(Source).AssignedValues then
        LookupDisplayFields := TDBGColumn(Source).LookupDisplayFields;
      AutoDropDown := TDBGColumn(Source).AutoDropDown;
      AlwaysShowEditButton := TDBGColumn(Source).AlwaysShowEditButton;
      WordWrap := TDBGColumn(Source).WordWrap;
    finally
      if Assigned(Collection) then
        Collection.EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

function TDBGColumn.CreateTitle: TColumnTitle;
begin
  Result := TColumnTitle.Create(Self);
end;

function TDBGColumn.DefaultAlignment: TAlignment;
begin
  if Assigned(Field) then
    Result := FField.Alignment
  else
    Result := taLeftJustify;
end;

function TDBGColumn.DefaultColor: TColor;
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Color
  else
    Result := clWindow;
end;

function TDBGColumn.DefaultFont: TFont;
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.Font
  else
    Result := FFont;
end;

function TDBGColumn.DefaultImeMode: TImeMode;
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeMode
  else
    Result := FImeMode;
end;

function TDBGColumn.DefaultImeName: TImeName;
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
    Result := Grid.ImeName
  else
    Result := FImeName;
end;

function TDBGColumn.DefaultReadOnly: Boolean;
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  Result := (Assigned(Grid) and Grid.ReadOnly) or (Assigned(Field) and
    FField.ReadOnly);
end;

function TDBGColumn.DefaultWidth: Integer;
var
  RestoreCanvas: Boolean;
  TM: TTextMetric;
begin
  if GetGrid = nil then
  begin
    Result := 64;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      RestoreCanvas := not HandleAllocated;
      if RestoreCanvas then
        Canvas.Handle := GetDC(0);
      try
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        Result := Field.DisplayWidth * (Canvas.TextWidth('0') - TM.tmOverhang) +
          TM.tmOverhang + 4;
      finally
        if RestoreCanvas then
        begin
          ReleaseDC(0, Canvas.Handle);
          Canvas.Handle := 0;
        end;
      end;
    end
    else
      Result := DefaultColWidth;
  end;
end;

procedure TDBGColumn.FontChanged;
begin
  Include(FAssignedValues, cvFont);
  Title.RefreshDefaultFont;
  Changed(False);
end;

function TDBGColumn.GetAlignment: TAlignment;
begin
  if cvAlignment in FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TDBGColumn.GetColor: TColor;
begin
  if cvColor in FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TDBGColumn.GetField: TField;
var
  Grid: TCustomMDBGrid;
begin { Returns Nil if FieldName can't be found in dataset }
  Grid := GetGrid;
  if (FField = nil) and (Length(FFieldName) > 0) and Assigned(Grid) and
    Assigned(Grid.DataLink.DataSet) then
    with Grid.Datalink.Dataset do
      if Active or (not DefaultFields) then
        SetField(FindField(FieldName));
  Result := FField;
end;

function TDBGColumn.GetFont: TFont;
var
  Save: TNotifyEvent;
begin
  if not (cvFont in FAssignedValues) and (FFont.Handle <> DefaultFont.Handle)
    then
  begin
    Save := FFont.OnChange;
    FFont.OnChange := nil;
    FFont.Assign(DefaultFont);
    FFont.OnChange := Save;
  end;
  Result := FFont;
end;

function TDBGColumn.GetGrid: TCustomMDBGrid;
begin
  if Assigned(Collection) and (Collection is TDBGGridColumns) then
    Result := TDBGGridColumns(Collection).Grid
  else
    Result := nil;
end;

function TDBGColumn.GetDisplayName: string;
begin
  Result := FFieldName;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

function TDBGColumn.GetImeMode: TImeMode;
begin
  if cvImeMode in FAssignedValues then
    Result := FImeMode
  else
    Result := DefaultImeMode;
end;

function TDBGColumn.GetImeName: TImeName;
begin
  if cvImeName in FAssignedValues then
    Result := FImeName
  else
    Result := DefaultImeName;
end;

function TDBGColumn.GetPickList: TStrings;
begin
  if FPickList = nil then
    FPickList := TStringList.Create;
  Result := FPickList;
end;

function TDBGColumn.GetReadOnly: Boolean;
begin
  if cvReadOnly in FAssignedValues then
    Result := FReadOnly
  else
    Result := DefaultReadOnly;
end;

function TDBGColumn.GetWidth: Integer;
begin
  if cvWidth in FAssignedValues then
    Result := FWidth
  else
    Result := DefaultWidth;
end;

function TDBGColumn.IsAlignmentStored: Boolean;
begin
  Result := (cvAlignment in FAssignedValues) and (FAlignment <>
    DefaultAlignment);
end;

function TDBGColumn.IsColorStored: Boolean;
begin
  Result := (cvColor in FAssignedValues) and (FColor <> DefaultColor);
end;

function TDBGColumn.IsFontStored: Boolean;
begin
  Result := (cvFont in FAssignedValues);
end;

function TDBGColumn.IsImeModeStored: Boolean;
begin
  Result := (cvImeMode in FAssignedValues) and (FImeMode <> DefaultImeMode);
end;

function TDBGColumn.IsImeNameStored: Boolean;
begin
  Result := (cvImeName in FAssignedValues) and (FImeName <> DefaultImeName);
end;

function TDBGColumn.IsReadOnlyStored: Boolean;
begin
  Result := (cvReadOnly in FAssignedValues) and (FReadOnly <> DefaultReadOnly);
end;

function TDBGColumn.IsWidthStored: Boolean;
begin
  Result := (cvWidth in FAssignedValues) //and (FWidth<>DefaultWidth);
end;

procedure TDBGColumn.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if cvFont in FAssignedValues then
    Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TDBGColumn.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFont in FAssignedValues;
  FTitle.RestoreDefaults;
  FFooter.RestoreDefaults;
  FCheckbox.RestoreDefaults;
  FAssignedValues := [];
  RefreshDefaultFont;
  FPickList.Free;
  FPickList := nil;
  ButtonStyle := cbsAuto;
  Changed(FontAssigned);
end;

procedure TDBGColumn.SetAlignment(Value: TAlignment);
begin
  if (cvAlignment in FAssignedValues) and (Value = FAlignment) then
    Exit;
  FAlignment := Value;
  Include(FAssignedValues, cvAlignment);
  Changed(False);
end;

procedure TDBGColumn.SetButtonStyle(Value: TColumnButtonStyle);
begin
  if Value = FButtonStyle then
    Exit;
  FButtonStyle := Value;
  Changed(False);
end;

procedure TDBGColumn.SetColor(Value: TColor);
begin
  if (cvColor in FAssignedValues) and (Value = FColor) then
    Exit;
  FColor := Value;
  Include(FAssignedValues, cvColor);
  Changed(False);
end;

procedure TDBGColumn.SetField(Value: TField);
begin
  if FField = Value then
    Exit;
  FField := Value;
  if Assigned(Value) then
    FFieldName := Value.FieldName;
  Changed(False);
end;

procedure TDBGColumn.SetFieldName(const Value: string);
var
  AField: TField;
  Grid: TCustomMDBGrid;
begin
  AField := nil;
  Grid := GetGrid;
  if Assigned(Grid) and Assigned(Grid.DataLink.DataSet) and
    not (csLoading in Grid.ComponentState) and (Length(Value) > 0) then
    AField := Grid.DataLink.DataSet.FindField(Value); { no exceptions }
  FFieldName := Value;
  SetField(AField);
  FInitWidth := Width;
  Changed(False);
end;

procedure TDBGColumn.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
  Include(FAssignedValues, cvFont);
  Changed(False);
end;

procedure TDBGColumn.SetImeMode(Value: TImeMode);
begin
  if (cvImeMode in FAssignedValues) or (Value <> DefaultImeMode) then
  begin
    FImeMode := Value;
    Include(FAssignedValues, cvImeMode);
  end;
  Changed(False);
end;

procedure TDBGColumn.SetImeName(Value: TImeName);
begin
  if (cvImeName in FAssignedValues) or (Value <> DefaultImeName) then
  begin
    FImeName := Value;
    Include(FAssignedValues, cvImeName);
  end;
  Changed(False);
end;

procedure TDBGColumn.SetPickList(Value: TStrings);
begin
  if Value = nil then
  begin
    FPickList.Free;
    FPickList := nil;
    Exit;
  end;
  PickList.Assign(Value);
end;

procedure TDBGColumn.SetPopupMenu(Value: TPopupMenu);
begin
  FPopupMenu := Value;
  if Value <> nil then
    Value.FreeNotification(GetGrid);
end;

procedure TDBGColumn.SetReadOnly(Value: Boolean);
begin
  if (cvReadOnly in FAssignedValues) and (Value = FReadOnly) then
    Exit;
  FReadOnly := Value;
  Include(FAssignedValues, cvReadOnly);
  Changed(False);
end;

procedure TDBGColumn.SetTitle(Value: TColumnTitle);
begin
  FTitle.Assign(Value);
end;

procedure TDBGColumn.SetWidth(Value: Integer);
begin
  if (cvWidth in FAssignedValues) or (Value <> DefaultWidth) then
  begin
    FWidth := Value;
    Include(FAssignedValues, cvWidth);
  end;
  Changed(False);
end;

//ddd

procedure TDBGColumn.SetAlwaysShowEditButton(Value: Boolean);
begin
  if (FAlwaysShowEditButton = Value) then
    Exit;
  FAlwaysShowEditButton := Value;
  Changed(False);
end;

//---- WordWrap

procedure TDBGColumn.SetWordWrap(Value: Boolean);
begin
  if (cvWordWrap in FAssignedValues) or (Value <> DefaultWordWrap) or
    (Assigned(Grid) and (csLoading in Grid.ComponentState)) then
  begin
    FWordWrap := Value;
    Include(FAssignedValues, cvWordWrap);
  end;
  Changed(False);
end;

function TDBGColumn.GetWordWrap: Boolean;
begin
  if cvWordWrap in FAssignedValues then
    Result := FWordWrap
  else
    Result := DefaultWordWrap;
end;

function TDBGColumn.IsWordWrapStored: Boolean;
begin
  Result := (cvWordWrap in FAssignedValues) and (FWordWrap <> DefaultWordWrap);
end;

function TDBGColumn.DefaultWordWrap: Boolean;
begin
  if GetGrid = nil then
  begin
    Result := False;
    Exit;
  end;
  with GetGrid do
  begin
    if Assigned(Field) then
    begin
      case Field.DataType of
        ftString, ftMemo, ftFmtMemo: Result := True;
      else
        Result := False;
      end;
    end
    else
      Result := False;
  end;
end;

procedure TDBGColumn.SetEndEllipsis(const Value: Boolean);
begin
  FEndEllipsis := Value;
  Changed(False);
end;

procedure TDBGColumn.SetDropDownWidth(Value: Integer);
begin
  if (Value = FDropDownWidth) then
    Exit;
  FDropDownWidth := Value;
  Changed(False);
end;

function TDBGColumn.DefaultLookupDisplayFields: string;
begin
  if Assigned(Field) then
    Result := FField.LookupResultField
  else
    Result := '';
end;

function TDBGColumn.GetLookupDisplayFields: string;
begin
  if cvLookupDisplayFields in FAssignedValues then
    Result := FLookupDisplayFields
  else
    Result := DefaultLookupDisplayFields;
end;

procedure TDBGColumn.SetLookupDisplayFields(Value: string);
begin
  if (cvLookupDisplayFields in FAssignedValues) or (Value <>
    DefaultLookupDisplayFields) then
  begin
    FLookupDisplayFields := Value;
    Include(FAssignedValues, cvLookupDisplayFields);
  end;
  Changed(False);
end;

function TDBGColumn.IsLookupDisplayFieldsStored: Boolean;
begin
  Result := (cvLookupDisplayFields in FAssignedValues) and (FLookupDisplayFields
    <> DefaultLookupDisplayFields);
end;

procedure TDBGColumn.SetAutoDropDown(Value: Boolean);
begin
  if (Value = FAutoDropDown) then
    Exit;
  FAutoDropDown := Value;
  Changed(False);
end;

//\\\

{ TPassthroughColumn }

type
  TPassthroughColumnTitle = class(TColumnTitle)
  private
    procedure SetCaption(const Value: string); override;
  end;

  TPassthroughColumn = class(TDBGColumn)
  private
    procedure SetAlignment(Value: TAlignment); override;
    procedure SetField(Value: TField); override;
    procedure SetIndex(Value: Integer); override;
    procedure SetReadOnly(Value: Boolean); override;
    procedure SetWidth(Value: Integer); override;
  protected
    function CreateTitle: TColumnTitle; override;
  end;

procedure TDBGColumn.SetFooter(const Value: TColumnFooter);
begin
  FFooter.Assign(Value);
end;

function TDBGColumn.CreateFooter: TColumnFooter;
begin
  Result := TColumnFooter.Create(Self);
end;

function TDBGColumn.GetAutoFit: Boolean;
begin
  Result := FAutoFit;
end;

procedure TDBGColumn.SetAutoFit(const Value: Boolean);
begin
  FAutoFit := Value;
  if Assigned(Grid) and (dgAutoFitColumns in Grid.Options) and not (csLoading in
    Grid.ComponentState) then
    Width := FInitWidth;
  Changed(False);
end;

procedure TDBGColumn.SetCheckbox(const Value: TColumnCheckbox);
begin
  FCheckbox.Assign(Value);
end;

function TDBGColumn.CreateCheckbox: TColumnCheckbox;
begin
  Result := TColumnCheckbox.Create(Self);
end;

{ TPassthroughColumnTitle }

procedure TPassthroughColumnTitle.SetCaption(const Value: string);
var
  Grid: TCustomMDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(FColumn.Field) then
    FColumn.Field.DisplayLabel := Value
  else
    inherited SetCaption(Value);
end;

{ TPassthroughColumn }

function TPassthroughColumn.CreateTitle: TColumnTitle;
begin
  Result := TPassthroughColumnTitle.Create(Self);
end;

procedure TPassthroughColumn.SetAlignment(Value: TAlignment);
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) and (Grid.Datalink.Active) and Assigned(Field) then
    Field.Alignment := Value
  else
    inherited SetAlignment(Value);
end;

procedure TPassthroughColumn.SetField(Value: TField);
begin
  inherited SetField(Value);
  if Value = nil then
    FFieldName := '';
  RestoreDefaults;
  FInitWidth := Width;
end;

procedure TPassthroughColumn.SetIndex(Value: Integer);
var
  Grid: TCustomMDBGrid;
  Fld: TField;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active then
  begin
    Fld := Grid.Datalink.Fields[Value];
    if Assigned(Fld) then
      Field.Index := Fld.Index;
  end;
  inherited SetIndex(Value);
end;

procedure TPassthroughColumn.SetReadOnly(Value: Boolean);
var
  Grid: TCustomMDBGrid;
begin
  Grid := GetGrid;
  if Assigned(Grid) and Grid.Datalink.Active and Assigned(Field) then
    Field.ReadOnly := Value
  else
    inherited SetReadOnly(Value);
end;

procedure TPassthroughColumn.SetWidth(Value: Integer);
var
  Grid: TCustomMDBGrid;
  TM: TTextMetric;
begin
  Grid := GetGrid;
  if Assigned(Grid) then
  begin
    if Grid.HandleAllocated and Assigned(Field) and Grid.FUpdateFields then
      with Grid do
      begin
        Canvas.Font := Self.Font;
        GetTextMetrics(Canvas.Handle, TM);
        Field.DisplayWidth := (Value + (TM.tmAveCharWidth div 2) - TM.tmOverhang
          - 3) div Canvas.TextWidth('0');
      end;
    if (not Grid.FLayoutFromDataset) or (cvWidth in FAssignedValues) then
      inherited SetWidth(Value);
  end
  else
    inherited SetWidth(Value);
end;

{ TDBGGridColumns }

constructor TDBGGridColumns.Create(Grid: TCustomMDBGrid; ColumnClass:
  TDBGColumnClass);
begin
  inherited Create(ColumnClass);
  FGrid := Grid;
end;

function TDBGGridColumns.Add: TDBGColumn;
begin
  Result := TDBGColumn(inherited Add);
end;

function TDBGGridColumns.GetColumn(Index: Integer): TDBGColumn;
begin
  Result := TDBGColumn(inherited Items[Index]);
end;

function TDBGGridColumns.GetOwner: TPersistent;
begin
  Result := FGrid;
end;

function TDBGGridColumns.GetState: TDBGridColumnsState;
begin
  Result := TDBGridColumnsState((Count > 0) and not (Items[0] is
    TPassthroughColumn));
end;

procedure TDBGGridColumns.LoadFromFile(const Filename: string);
var
  S: TFileStream;
begin
  S := TFileStream.Create(Filename, fmOpenRead);
  try
    LoadFromStream(S);
  finally
    S.Free;
  end;
end;

type
  TColumnsWrapper = class(TComponent)
  private
    FColumns: TDBGGridColumns;
  published
    property Columns: TDBGGridColumns read FColumns write FColumns;
  end;

procedure TDBGGridColumns.LoadFromStream(S: TStream);
var
  Wrapper: TColumnsWrapper;
begin
  Wrapper := TColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := FGrid.CreateColumns;
    S.ReadComponent(Wrapper);
    Assign(Wrapper.Columns);
  finally
    Wrapper.Columns.Free;
    Wrapper.Free;
  end;
end;

procedure TDBGGridColumns.RestoreDefaults;
var
  I: Integer;
begin
  BeginUpdate;
  try
    for I := 0 to Count - 1 do
      Items[I].RestoreDefaults;
  finally
    EndUpdate;
  end;
end;

procedure TDBGGridColumns.RebuildColumns;
var
  I: Integer;
begin
  if Assigned(FGrid) and Assigned(FGrid.DataSource) and
    Assigned(FGrid.Datasource.Dataset) then
  begin
    FGrid.BeginLayout;
    try
      Clear;
      with FGrid.Datasource.Dataset do
        for I := 0 to FieldCount - 1 do
          Add.FieldName := Fields[I].FieldName
    finally
      FGrid.EndLayout;
    end
  end
  else
    Clear;
end;

procedure TDBGGridColumns.SaveToFile(const Filename: string);
var
  S: TStream;
begin
  S := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(S);
  finally
    S.Free;
  end;
end;

procedure TDBGGridColumns.SaveToStream(S: TStream);
var
  Wrapper: TColumnsWrapper;
begin
  Wrapper := TColumnsWrapper.Create(nil);
  try
    Wrapper.Columns := Self;
    S.WriteComponent(Wrapper);
  finally
    Wrapper.Free;
  end;
end;

procedure TDBGGridColumns.SetColumn(Index: Integer; Value: TDBGColumn);
begin
  Items[Index].Assign(Value);
end;

procedure TDBGGridColumns.SetState(NewState: TDBGridColumnsState);
begin
  if NewState = State then
    Exit;
  if NewState = csDefault then
    Clear
  else
    RebuildColumns;
end;

procedure TDBGGridColumns.Update(Item: TCollectionItem);
var
  Raw: Integer;
  OldWidth: Integer;
begin
  if (FGrid = nil) or (csLoading in FGrid.ComponentState) then
    Exit;
  if (Item = nil) then
    FGrid.LayoutChanged
  else
  begin
    Raw := FGrid.DataToRawColumn(Item.Index);
    FGrid.InvalidateCol(Raw);

    if not (dgAutoFitColumns in FGrid.Options) or (csDesigning in
      FGrid.ComponentState) then
    begin
      FGrid.ColWidths[Raw] := TDBGColumn(Item).Width;
      if (dgMultilineTitle in FGrid.Options) and not (csDesigning in
        FGrid.ComponentState) then
        FGrid.LayoutChanged;
    end
    else
    begin
      {OldWidth:=TDBGColumn(Item).FInitWidth;
      TDBGColumn(Item).FInitWidth:=MulDiv(TDBGColumn(Item).FInitWidth,TDBGColumn(Item).Width,FGrid.ColWidths[Raw]);
      if (Raw<>FGrid.ColCount-1) then begin
        Inc(FGrid.Columns[Raw-FGrid.FIndicatorOffset+1].FInitWidth,OldWIdth-FGrid.FColumns[Raw-FGrid.FIndicatorOffset].FInitWidth);
        if (FGrid.Columns[Raw-FGrid.FIndicatorOffset+1].FInitWidth<0) then
          FGrid.Columns[Raw-FGrid.FIndicatorOffset+1].FInitWidth:=0;
      end;
      FGrid.LayoutChanged;}
    end;
  end;
end;

{ TRecordmarkList }

constructor TRecordmarkList.Create(AGrid: TCustomMDBGrid);
begin
  inherited Create;
  FList := TStringList.Create;
  FList.OnChange := StringsChanged;
  FGrid := AGrid;
end;

destructor TRecordmarkList.Destroy;
begin
  Clear;
  FList.Free;
  inherited Destroy;
end;

procedure TRecordmarkList.Clear;
begin
  if FList.Count = 0 then
    Exit;
  FList.Clear;
  FGrid.Invalidate;
end;

function TRecordmarkList.Compare(const Item1, Item2: TBookmarkStr): Integer;
begin
  with FGrid.Datalink.Datasource.Dataset do
    Result := CompareBookmarks(TBookmark(Item1), TBookmark(Item2));
end;

function TRecordmarkList.CurrentRow: TBookmarkStr;
begin
  if not FLinkActive then
    RaiseGridError(sDataSetClosed);
  Result := FGrid.Datalink.Datasource.Dataset.Bookmark;
end;

function TRecordmarkList.GetCurrentRowSelected: Boolean;
var
  Index: Integer;
begin
  Result := Find(CurrentRow, Index);
end;

function TRecordmarkList.Find(const Item: TBookmarkStr; var Index: Integer):
  Boolean;
var
  L, H, I, C: Integer;
begin
  if (Item = FCache) and (FCacheIndex >= 0) then
  begin
    Index := FCacheIndex;
    Result := FCacheFind;
    Exit;
  end;
  Result := False;
  L := 0;
  H := FList.Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := Compare(FList[I], Item);
    if C < 0 then
      L := I + 1
    else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
  FCache := Item;
  FCacheIndex := Index;
  FCacheFind := Result;
end;

function TRecordmarkList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TRecordmarkList.GetItem(Index: Integer): TBookmarkStr;
begin
  Result := FList[Index];
end;

function TRecordmarkList.IndexOf(const Item: TBookmarkStr): Integer;
begin
  if not Find(Item, Result) then
    Result := -1;
end;

procedure TRecordmarkList.LinkActive(Value: Boolean);
begin
  Clear;
  FLinkActive := Value;
end;

procedure TRecordmarkList.Delete;
var
  I: Integer;
begin
  with FGrid.Datalink.Datasource.Dataset do
  begin
    DisableControls;
    try
      for I := FList.Count - 1 downto 0 do
      begin
        Bookmark := FList[I];
        Delete;
        FList.Delete(I);
      end;
    finally
      EnableControls;
    end;
  end;
end;

function TRecordmarkList.Refresh: Boolean;
var
  I: Integer;
begin
  Result := False;
  with FGrid.DataLink.Datasource.Dataset do
  try
    CheckBrowseMode;
    for I := FList.Count - 1 downto 0 do
      if not BookmarkValid(TBookmark(FList[I])) then
      begin
        Result := True;
        FList.Delete(I);
      end;
  finally
    UpdateCursorPos;
    if Result then
      FGrid.Invalidate;
  end;
end;

procedure TRecordmarkList.SetCurrentRowSelected(Value: Boolean);
var
  Index: Integer;
  Current: TBookmarkStr;
begin
  Current := CurrentRow;
  if (Length(Current) = 0) or (Find(Current, Index) = Value) then
    Exit;
  if Value then
    FList.Insert(Index, Current)
  else
    FList.Delete(Index);
  FGrid.InvalidateRow(FGrid.Row);
end;

procedure TRecordmarkList.StringsChanged(Sender: TObject);
begin
  FCache := '';
  FCacheIndex := -1;
end;

{ TCustomMDBGrid }

var
  DrawBitmap: TBitmap;
  UserCount: Integer;

procedure UsesBitmap;
begin
  if UserCount = 0 then
    DrawBitmap := TBitmap.Create;
  Inc(UserCount);
end;

procedure ReleaseBitmap;
begin
  Dec(UserCount);
  if UserCount = 0 then
    DrawBitmap.Free;
end;

procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer;
  const Text: string; Alignment: TAlignment);
const
  AlignFlags: array[TAlignment] of Integer =
  (DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX);
var
  B, R: TRect;
  I, Left: Integer;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then
  begin { Use ExtTextOut for solid colors }
    case Alignment of
      taLeftJustify:
        Left := ARect.Left + DX;
      taRightJustify:
        Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
        - (ACanvas.TextWidth(Text) shr 1);
    end;
    ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, ETO_OPAQUE or
      ETO_CLIPPED, @ARect, PChar(Text), Length(Text), nil);
  end
  else
  begin { Use FillRect and Drawtext for dithered colors }
    DrawBitmap.Canvas.Lock;
    try
      with DrawBitmap, ARect do { Use offscreen bitmap to eliminate flicker and }
      begin { brush origin tics in painting/scrolling.    }
        Width := Max(Width, Right - Left);
        Height := Max(Height, Bottom - Top);
        R := Rect(DX, DY, Right - Left - 1, Bottom - Top - 1);
        B := Rect(0, 0, Right - Left, Bottom - Top);
      end;
      with DrawBitmap.Canvas do
      begin
        Font := ACanvas.Font;
        Font.Color := ACanvas.Font.Color;
        Brush := ACanvas.Brush;
        Brush.Style := bsSolid;
        FillRect(B);
        SetBkMode(Handle, TRANSPARENT);
        DrawText(Handle, PChar(Text), Length(Text), R, AlignFlags[Alignment]);
      end;
      ACanvas.CopyRect(ARect, DrawBitmap.Canvas, B);
    finally
      DrawBitmap.Canvas.Unlock;
    end;
  end;
end;

procedure WriteTextEx(ACanvas: TCanvas; ARect: TRect; FillRect: Boolean; DX, DY:
  Integer;
  const Text: string; Alignment: TAlignment; Layout: TTextLayout; MultyL:
    Boolean; EndEllipsis: Boolean; LeftMarg, RightMarg: Integer);
const
  AlignFlags: array[TAlignment] of Integer =
  (DT_LEFT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_RIGHT or DT_EXPANDTABS or DT_NOPREFIX,
    DT_CENTER or DT_EXPANDTABS or DT_NOPREFIX);
var
  rect1: TRect;
  I, Left, txth, DrawFlag: Integer;
  lpDTP: TDrawTextParams;
begin
  I := ColorToRGB(ACanvas.Brush.Color);
  if GetNearestColor(ACanvas.Handle, I) = I then
  begin { Use ExtTextOut for solid colors }
    if (MultyL = False) and (EndEllipsis = False) then
    begin
      case Alignment of
        taLeftJustify:
          Left := ARect.Left + DX;
        taRightJustify:
          Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
      else { taCenter }
        Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
          - (ACanvas.TextWidth(Text) shr 1);
      end;
      if (FillRect = True) then
        DrawFlag := ETO_OPAQUE or ETO_CLIPPED
      else
        DrawFlag := ETO_OPAQUE or ETO_CLIPPED;
      ExtTextOut(ACanvas.Handle, Left, ARect.Top + DY, DrawFlag,
        @ARect, PChar(Text), Length(Text), nil)

    end
    else
    begin {} {/////////// MultyL}

      if (FillRect = True) then
        ACanvas.FillRect(ARect);

      DrawFlag := 0;
      if (MultyL = True) then
        DrawFlag := DrawFlag or DT_WORDBREAK;
      if (EndEllipsis = True) then
        DrawFlag := DrawFlag or DT_END_ELLIPSIS;
      DrawFlag := DrawFlag or AlignFlags[Alignment];

      {}
      rect1.Left := 0;
      rect1.Top := 0;
      rect1.Right := 0;
      rect1.Bottom := 0;
      rect1 := ARect; {}

      lpDTP.cbSize := SizeOf(lpDTP);
      lpDTP.uiLengthDrawn := Length(Text);
      lpDTP.iLeftMargin := LeftMarg;
      lpDTP.iRightMargin := RightMarg;

      InflateRect(rect1, -DX, -DY);

      if (Layout <> tlTop) and (MultyL = True) then
        txth := DrawTextEx(ACanvas.Handle, PChar(Text), Length(Text), {}
          rect1, DrawFlag or DT_CALCRECT, @lpDTP) // Получить квадрат.
      else
        txth := 0;
      rect1 := ARect; {}
      InflateRect(rect1, -DX, -DY);

      case Layout of
        tlTop: ;
        tlBottom: rect1.top := rect1.Bottom - txth;
        tlCenter: rect1.top := rect1.top + ((rect1.Bottom - rect1.top) div 2) -
          (txth div 2);
      end;

      DrawTextEx(ACanvas.Handle, PChar(Text), Length(Text), {}
        rect1, DrawFlag, @lpDTP); {}

    end; {} {\\\\\\\\\\\\\}
  end
  else
  begin { Use FillRect and Drawtext for dithered colors }
  end;
end;

constructor TCustomMDBGrid.Create(AOwner: TComponent);
var
  Bmp: TBitmap;
begin
  inherited Create(AOwner);
  inherited DefaultDrawing := False;
  FAcquireFocus := True;
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromResourceName(HInstance, bmArrow);
    FIndicators := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmEdit);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmInsert);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiDot);
    FIndicators.AddMasked(Bmp, clWhite);
    Bmp.LoadFromResourceName(HInstance, bmMultiArrow);
    FIndicators.AddMasked(Bmp, clWhite);
    //ddd
    Bmp.LoadFromResourceName(HInstance, bmSmDown);
    FSortMarkerImages := TImageList.CreateSize(Bmp.Width, Bmp.Height);
    FSortMarkerImages.AddMasked(Bmp, clFuchsia);
    Bmp.LoadFromResourceName(HInstance, bmSmUp);
    FSortMarkerImages.AddMasked(Bmp, clFuchsia);
    //\\\
  finally
    Bmp.Free;
  end;
  FTitleOffset := 1;
  FIndicatorOffset := 1;
  FUpdateFields := True;
  FOptions := [dgEditing, dgTitles, dgIndicator, dgColumnResize,
    dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit];
  DesignOptionsBoost := [goColSizing];
  VirtualView := True;
  UsesBitmap;
  ScrollBars := ssHorizontal;
  inherited Options := [goFixedHorzLine, goFixedVertLine, goHorzLine,
    goVertLine, goColSizing, goColMoving, goTabs, goEditing];
  FColumns := CreateColumns;
  inherited RowCount := 2;
  inherited ColCount := 2;
  FDataLink := TGridDataLink.Create(Self);
  Color := clWindow;
  ParentColor := False;
  FTitleFont := TFont.Create;
  FTitleFont.OnChange := TitleFontChanged;
  FSaveCellExtents := False;
  FUserChange := True;
  FDefaultDrawing := True;
  FUpdatingEditor := False;
  FBookmarks := TRecordmarkList.Create(Self);
  HideEditor;

  //ddd

  FTitleHeightFull := 0;
  FLeafFieldArr := nil;
  FHeadTree := THeadTreeNode.CreateText('корень', 10, 0);
  FVTitleMargin := 10;
  FHTitleMargin := 0;
  FInitColWidth := TList.Create;
  FDefaultRowChanged := False;
  FInplaceEditorButtonWidth := GetSystemMetrics(SM_CXVSCROLL);
end;

destructor TCustomMDBGrid.Destroy;
begin
  FColumns.Free;
  FColumns := nil;
  FDataLink.Free;
  FDataLink := nil;
  FIndicators.Free;
  FTitleFont.Free;
  FTitleFont := nil;
  FBookmarks.Free;
  FBookmarks := nil;
  inherited Destroy;
  ReleaseBitmap;

  FSortMarkerImages.Free;
  if (FLeafFieldArr <> nil) then
    FreeMem(FLeafFieldArr);
  FHeadTree.Free;
  FInitColWidth.Free;
end;

function TCustomMDBGrid.AcquireFocus: Boolean;
begin
  Result := True;
  if FAcquireFocus and CanFocus and not (csDesigning in ComponentState) then
  begin
    SetFocus;
    Result := Focused or (InplaceEditor <> nil) and InplaceEditor.Focused;
  end;
end;

function TCustomMDBGrid.RawToDataColumn(ACol: Integer): Integer;
begin
  Result := ACol - FIndicatorOffset;
end;

function TCustomMDBGrid.DataToRawColumn(ACol: Integer): Integer;
begin
  Result := ACol + FIndicatorOffset;
end;

function TCustomMDBGrid.AcquireLayoutLock: Boolean;
begin
  Result := (FUpdateLock = 0) and (FLayoutLock = 0);
  if Result then
    BeginLayout;
end;

procedure TCustomMDBGrid.BeginLayout;
begin
  BeginUpdate;
  if FLayoutLock = 0 then
    Columns.BeginUpdate;
  Inc(FLayoutLock);
end;

procedure TCustomMDBGrid.BeginUpdate;
begin
  Inc(FUpdateLock);
end;

procedure TCustomMDBGrid.CancelLayout;
begin
  if FLayoutLock > 0 then
  begin
    if FLayoutLock = 1 then
      Columns.EndUpdate;
    Dec(FLayoutLock);
    EndUpdate;
  end;
end;

function TCustomMDBGrid.CanEditAcceptKey(Key: Char): Boolean;
begin
  with Columns[SelectedIndex] do
    Result := FDatalink.Active and Assigned(Field) and Field.IsValidChar(Key);
end;

function TCustomMDBGrid.CanEditModify: Boolean;
begin
  Result := False;
  if not ReadOnly and FDatalink.Active and not FDatalink.Readonly then
    with Columns[SelectedIndex] do
      if (not ReadOnly) and Assigned(Field) and Field.CanModify
        and (not Field.IsBlob or Assigned(Field.OnSetText)) then
      begin
        FDatalink.Edit;
        Result := FDatalink.Editing;
        if Result then
          FDatalink.Modified;
      end;
end;

function TCustomMDBGrid.CanEditShow: Boolean;
begin
  Result := (LayoutLock = 0) and inherited CanEditShow;
end;

procedure TCustomMDBGrid.CellClick(Column: TDBGColumn);
begin
  if Assigned(FOnCellClick) then
    FOnCellClick(Column);
end;

procedure TCustomMDBGrid.ColEnter;
begin
  UpdateIme;
  if Assigned(FOnColEnter) then
    FOnColEnter(Self);
end;

procedure TCustomMDBGrid.ColExit;
begin
  if Assigned(FOnColExit) then
    FOnColExit(Self);
end;

procedure TCustomMDBGrid.ColumnMoved(FromIndex, ToIndex: Longint);
begin
  FromIndex := RawToDataColumn(FromIndex);
  ToIndex := RawToDataColumn(ToIndex);
  Columns[FromIndex].Index := ToIndex;
  if Assigned(FOnColumnMoved) then
    FOnColumnMoved(Self, FromIndex, ToIndex);
end;

procedure TCustomMDBGrid.ColWidthsChanged;
var
  i: Integer;
  OldWidth: Integer;
begin
  inherited ColWidthsChanged;
  if (FDatalink.Active or (FColumns.State = csCustomized)) and AcquireLayoutLock
    then
  try
    for i := FIndicatorOffset to ColCount - 1 do
      if not (dgAutoFitColumns in Options) or (csDesigning in ComponentState)
        then
        FColumns[i - FIndicatorOffset].Width := ColWidths[i]
      else if (FColumns[i - FIndicatorOffset].Width <> ColWidths[i]) then
      begin
        if (FColumns[i - FIndicatorOffset].AutoFit) then
        begin
          OldWidth := FColumns[i - FIndicatorOffset].FInitWidth;
          FColumns[i - FindicatorOffset].FinitWidth := MulDiv(FColumns[i -
            FindicatorOffset].FinitWidth, ColWidths[i], FColumns[i -
            FindicatorOffset].Width);
          if (i <> ColCount - 1) then
          begin
            inc(FColumns[i - FIndicatorOffset + 1].FinitWidth, OldWidth -
              FColumns[i - FindicatorOffset].FinitWidth);
            if (FColumns[i - FIndicatorOffset + 1].FInitWidth < 0) then
              FColumns[i - FIndicatorOffset + 1].FinitWidth := 0;
          end;
        end
        else
          FColumns[i - FindicatorOffset].Width := ColWidths[i];
      end;
  finally
    EndLayout;
  end;
end;

function TCustomMDBGrid.CreateColumns: TDBGGridColumns;
begin
  Result := TDBGGridColumns.Create(Self, TDBGColumn);
end;

function TCustomMDBGrid.CreateEditor: TinplaceEdit;
begin
  Result := TDBGridinplaceEdit.Create(Self);
end;

procedure TCustomMDBGrid.CreateWnd;
begin
  BeginUpdate; { prevent updates in WMSize message that follows WMCreate }
  try
    inherited CreateWnd;
  finally
    EndUpdate;
  end;
  UpdateRowCount;
  UpdateActive;
  UpdateScrollBar;
  FOriginalimeName := imeName;
  FOriginalimeMode := imeMode;
end;

procedure TCustomMDBGrid.DataChanged;
begin
  if not HandleAllocated then
    Exit;
  UpdateRowCount;
  UpdateScrollBar;
  UpdateActive;
  invalidateEditor;
  ValidateRect(Handle, nil);
  invalidate;
end;

procedure TCustomMDBGrid.DefaultHandler(var Msg);
var
  P: TPopupMenu;
  Cell: TGridCoord;
begin
  inherited DefaultHandler(Msg);
  if TMessage(Msg).Msg = wm_RButtonUp then
    with TWMRButtonUp(Msg) do
    begin
      Cell := MouseCoord(XPos, YPos);
      if (Cell.X < FindicatorOffset) or (Cell.Y < 0) then
        Exit;
      P := Columns[RawToDataColumn(Cell.X)].PopupMenu;
      if (P <> nil) and P.AutoPopup then
      begin
        SendCancelMode(nil);
        P.PopupComponent := Self;
        with ClientToScreen(SmallPointToPoint(Pos)) do
          P.Popup(X, Y);
        Result := 1;
      end;
    end;
end;

procedure TCustomMDBGrid.DeferLayout;
var
  M: TMsg;
begin
  if HandleAllocated and
    not PeekMessage(M, Handle, cm_DeferLayout, cm_DeferLayout, pm_NoRemove) then
    PostMessage(Handle, cm_DeferLayout, 0, 0);
  CancelLayout;
end;

procedure TCustomMDBGrid.DefineFieldMap;
var
  i: integer;
begin
  if FColumns.State = csCustomized then
  begin { Build the column/field map from the column attributes }
    DataLink.SparseMap := True;
    for i := 0 to FColumns.Count - 1 do
      FDataLink.AddMapping(FColumns[i].FieldName);
  end
  else { Build the column/field map from the field list order }
  begin
    FDataLink.SparseMap := False;
    with Datalink.Dataset do
      for i := 0 to FieldCount - 1 do
        with Fields[i] do
          if Visible then
            Datalink.AddMapping(FieldName);
  end;
end;

procedure TCustomMDBGrid.DefaultDrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
var
  Alignment: TAlignment;
  Value: string;
begin
  Alignment := taLeftJustify;
  Value := '';
  if Assigned(Field) then
  begin
    Alignment := Field.Alignment;
    Value := Field.DisplayText;
  end;
  WriteText(Canvas, Rect, 2, 2, Value, Alignment);
end;

procedure TCustomMDBGrid.DefaultDrawColumnCell(const Rect: TRect;
  DataCol: integer; Column: TDBGColumn; State: TGridDrawState);
var
  Value: string;
begin
  Value := '';
  if Assigned(Column.Field) then
    Value := Column.Field.DisplayText;
  WriteText(Canvas, Rect, 2, 2, Value, Column.Alignment);
end;

procedure TCustomMDBGrid.ReadColumns(Reader: TReader);
begin
  Columns.Clear;
  Reader.ReadValue;
  Reader.ReadCollection(Columns);
end;

procedure TCustomMDBGrid.WriteColumns(Writer: TWriter);
begin
  Writer.WriteCollection(Columns);
end;

procedure TCustomMDBGrid.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('Columns', ReadColumns, WriteColumns,
    ((Columns.State = csCustomized) and (Filer.Ancestor = nil)) or
    ((Filer.Ancestor <> nil) and
    ((Columns.State <> TCustomMDBGrid(Filer.Ancestor).Columns.State) or
    (not CollectionsEqual(Columns,
      TCustomMDBGrid(Filer.Ancestor).Columns{$IFDEF D6PLUS}, nil,
      nil{$ENDIF})))));
end;

procedure TCustomMDBGrid.DrawCell(ACol, ARow: Longint; ARect: TRect; AState:
  TGridDrawState);
var
  OldActive: integer;
  Highlight: Boolean;
  Value: string;
  DrawColumn: TDBGColumn;
  FrameOffs: Byte;
  ARect1: TRect;
  Down: Boolean;
  MultiSelected: Boolean;
  indicator, LeftMarg, RightMarg: integer;
  BackColor: TColor;
  ASortMarker: TSortMarker;
  SortMarkeridx: integer;
  NewBackgrnd: TColor;
  AEditStyle: TEditStyle;
  BM: TBitmap;

  function RowisMultiSelected: Boolean;
  var
    index: integer;
  begin
    Result := (dgMultiSelect in Options) and Datalink.Active and
      FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, index);
  end;

  procedure DrawHost(ALeaf: THeadTreeNode; DHRect: TRect; AEndEllipsis:
    Boolean);
  var
    curLeaf: THeadTreeNode;
    curW: integer;
    leftM: integer;
    drawRec, FrozenRectCell: TRect;
    OldColor: TColor;
  begin
    DHRect.Bottom := DHRect.Top - 1;
    Dec(DHRect.Top, ALeaf.Host.Height);
    curLeaf := ALeaf.Host.Child;
    curW := 0;
    while curLeaf <> ALeaf do
    begin
      inc(curW, curLeaf.Width);
      if dgColLines in Options then
        inc(curW, 1);
      curLeaf := curLeaf.Next;
    end;
    Dec(DHRect.Left, curW);
    DHRect.Right := DHRect.Left + ALeaf.Host.Width;
    leftM := 0;
    drawRec := DHRect;
    if (DHRect.Left < ColWidths[0]) and (dgindicator in Options) then
    begin
      leftM := DHRect.Left - ColWidths[0] - 1;
      drawRec.Left := ColWidths[0] + 1;
    end;
    if (FrozenCols > 0) then
    begin
      FrozenRectCell := CellRect(FixedCols - 1, 0);
      if (FrozenRectCell.Right > drawRec.Left) and (FrozenRectCell.Right <
        drawRec.Right) then
      begin
        Dec(leftM, FrozenRectCell.Right - drawRec.Left);
        drawRec.Left := FrozenRectCell.Right + 1;
      end;
    end;
    inflateRect(DHRect, 1, 1);
    if (leftM <> 0) then
      WriteTextEx(Canvas, drawRec, True, FrameOffs - 1, FrameOffs,
        ALeaf.Host.Text, taCenter, tlCenter, True, AEndEllipsis, leftM, 0)
    else
      WriteTextEx(Canvas, drawRec, True, FrameOffs, FrameOffs, ALeaf.Host.Text,
        taCenter, tlCenter, True, AEndEllipsis, leftM, 0);
    ALeaf.Host.Drawed := True;
    if (gdFixed in AState) and (([dgRowLines, dgColLines] * Options =
      [dgRowLines, dgColLines])) then
    begin
      if (leftM <> 0) then
        DrawEdge(Canvas.Handle, drawRec, BDR_RAISEDINNER, BF_TOP)
      else
        DrawEdge(Canvas.Handle, drawRec, BDR_RAiSEDiNNER, BF_TOPLEFT);
      DrawEdge(Canvas.Handle, drawRec, BDR_RAISEDINNER, BF_BOTTOMRiGHT);
      inflateRect(DHRect, -1, -1);
    end;
    OldColor := Canvas.Pen.Color;
    Canvas.Pen.Color := clBlack;
    Canvas.MoveTo(drawRec.Left, drawRec.Bottom);
    Canvas.LineTo(drawRec.Right, drawRec.Bottom);
    Canvas.Pen.Color := OldColor;
    if (ALeaf.Host.Host <> nil) and (ALeaf.Host.Host.Drawed = False) then
    begin
      DrawHost(ALeaf.Host, DHRect, AEndEllipsis);
      ALeaf.Host.Host.Drawed := True;
    end;
  end;

begin
  Down := False;
  if csLoading in ComponentState then
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ARect);
    Exit;
  end;

  Dec(ARow, FTitleOffset);
  Dec(ACol, indicatorOffset);

  if (gdFixed in AState) and (([dgRowLines, dgColLines] * Options = [dgRowLines,
    dgColLines]) or (dgFlat in Options)) and
    ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount -
      FFooterRowCount - 1 - FTitleOffset)))
    and ((ACol < 0) or (ARow < 0)) then
  begin
    inflateRect(ARect, -1, -1);
    FrameOffs := 1;
  end
  else
    FrameOffs := 2;

  if (gdFixed in AState) and (ACol < 0) then
  begin
    if ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow <> RowCount -
      FFooterRowCount - 1 - FTitleOffset))) then
      Canvas.Brush.Color := FixedColor
    else
      Canvas.Brush.Color := Color;
    Canvas.FillRect(ARect);
    if Assigned(DataLink) and DataLink.Active then
    begin
      MultiSelected := False;
      if (ARow >= 0) and ((ARow < FDatalink.RecordCount) or (FFooterRowCount =
        0)) then
      begin
        OldActive := FDataLink.ActiveRecord;
        try
          FDatalink.ActiveRecord := ARow;
          MultiSelected := RowisMultiselected;
        finally
          FDatalink.ActiveRecord := OldActive;
        end;
      end;
      if (ARow = FDataLink.ActiveRecord) or MultiSelected then
      begin
        indicator := 0;
        if FDataLink.DataSet <> nil then
          case FDataLink.DataSet.State of
            dsEdit: indicator := 1;
            dsinsert: indicator := 2;
            dsBrowse: if MultiSelected then
                if (ARow <> FDatalink.ActiveRecord) then
                  indicator := 3
                else
                  indicator := 4;
          end;
        Findicators.BkColor := FixedColor;
        Findicators.Draw(Canvas, ARect.Right - Findicators.Width - FrameOffs,
          (ARect.Top + ARect.Bottom - Findicators.Height) shr 1, indicator);
        if ARow = FDatalink.ActiveRecord then
          FSelRow := ARow + FTitleOffset;
      end;
    end;
  end
  else
    with Canvas do
    begin
      DrawColumn := Columns[ACol];
      if ((gdFixed in AState) and ((ACol < 0) or (ARow < 0)) or (ARow > RowCount
        - FFooterRowCount - 1 - FTitleOffset)) then
      begin
        Font := DrawColumn.Title.Font;
        Brush.Color := DrawColumn.Title.Color;
      end
      else
      begin
        Font := DrawColumn.Font;
        Brush.Color := DrawColumn.Color;
      end;
      if (ARow < 0) or (ARow > RowCount - FFooterRowCount - 1 - FTitleOffset)
        then
        with DrawColumn.Title do
        begin
          Down := (FPressedCol - indicatorOffset = ACol) and FPressed;
          if (dgMultiLineTitle in FOptions) and (ARow < 0) then
            ARect.Top := ARect.Bottom - FLeafFieldArr[ACol].FLeaf.Height + 3;
          ARect1 := ARect;
          ASortMarker := DrawColumn.Title.SortMarker;
          if (DrawColumn.Field <> nil) and Assigned(FOnGetBtnParams) then
          begin
            BackColor := Canvas.Brush.Color;
            FOnGetBtnParams(Self, DrawColumn, Canvas.Font, BackColor,
              ASortMarker, Down);
            Canvas.Brush.Color := BackColor;
          end;
          if (ARow < 0) then
          begin
            if Down then
            begin
              if (dgMultiLineTitle in FOptions) then
              begin
                LeftMarg := 2;
                RightMarg := -2;
                inc(ARect1.Top, 2)
              end
              else
              begin
                LeftMarg := 1;
                RightMarg := -1;
                inc(ARect1.Top, 1);
              end;
            end
            else
            begin
              LeftMarg := 0;
              RightMarg := 0;
            end;
            case ASortMarker of
              smDown: SortMarkeridx := 0;
              smUp: SortMarkeridx := 1;
            else
              SortMarkeridx := -1;
            end;
            if SortMarkeridx <> -1 then
              Dec(ARect1.Right, 16);
            Canvas.FillRect(ARect);
            if (dgMultiLineTitle in FOptions) then
            begin
              Font := TitleFont;
              WriteTextEx(Canvas, ARect1, False, FrameOffs, FrameOffs,
                FLeafFieldArr[ACol].FLeaf.Text,
                FLeafFieldArr[ACol].FColumn.FTitle.FAlignment, tlCenter, True,
                EndEllipsis, LeftMarg, RightMarg);
            end
            else
            begin
              ARect1.Left := ARect1.Left + LeftMarg;
              ARect1.Right := ARect1.Right - RightMarg;
              WriteTextEx(Canvas, ARect1, False, FrameOffs, FrameOffs, Caption,
                Alignment, tlTop, False, EndEllipsis, LeftMarg, RightMarg);
            end;
            if (SortMarkeridx <> -1) then
            begin
              FSortMarkerimages.BkColor := Canvas.Brush.Color;
              FSortMarkerimages.Draw(Canvas, ARect.Right -
                FSortMarkerimages.Width - 4 + LeftMarg,
                (ARect.Bottom + ARect.Top - FSortMarkerimages.Height) div 2 +
                  LeftMarg, SortMarkeridx);
            end;
          end
          else
          begin
            inflateRect(ARect, -1, -1);
            Canvas.FillRect(ARect);
          end;
          if (FFooterRowCount > 0) then
            DrawFooterCell(ACol, 0, DrawColumn.Footer.Text,
              DrawColumn.Footer.Alignment, DrawColumn.Footer.Font);
        end
      else if (DataLink = nil) or not DataLink.Active then
        FillRect(ARect)
      else
      begin
        Value := '';
        OldActive := DataLink.ActiveRecord;
        try
          if ((ARow >= 0) and (ARow < FDatalink.RecordCount)) or (FFooterRowCount
            = 0) then
          begin
            DataLink.ActiveRecord := ARow;
            if (DrawColumn.AlwaysShowEditButton) then
            begin
              AEditStyle := GetColumnEditStile(DrawColumn);
              if (AEditStyle <> esSimple) then
              begin
                SetRect(ARect1, ARect.Right - FinplaceEditorButtonWidth,
                  ARect.Top, ARect.Right, ARect.Bottom);
                PaintinplaceButton(Canvas.Handle, AEditStyle, ARect1, False,
                  DataLink.Active);
                ARect.Right := ARect.Right - FinplaceEditorButtonWidth;
              end;
            end;
            if Assigned(DrawColumn.Field) then
              if (dgDrawMemoText in FOptions) and (DrawColumn.Field.DataType in
                [ftMemo, ftBLOB]) then
                Value := DrawColumn.Field.AsString
              else
                Value := DrawColumn.Field.DisplayText;
            Highlight := HighlightCell(ACol, ARow, Value, AState);
            if Highlight then
            begin
              Brush.Color := clHighlight;
              Font.Color := clHighlightText;
            end;
            NewBackgrnd := Canvas.Brush.Color;
            GetCellParams(DrawColumn, Font, NewBackgrnd, AState);
            Canvas.Brush.Color := NewBackgrnd;
            if DefaultDrawing then
              WriteTextEx(Canvas, ARect, True, 2, 1, Value,
                DrawColumn.Alignment, tlTop, DrawColumn.WordWrap and
                FAllowWordWrap, DrawColumn.EndEllipsis, 0, 0);
            if (dgDrawGraphic in FOptions) and (DrawColumn.Field.DataType in
              [ftGraphic]) then
            begin
              BM := TBitmap.Create;
              try
                Canvas.CopyMode := cmSrcCopy;
                BM.Assign(DrawColumn.Field);
                Canvas.StretchDraw(ARect, BM);
              finally
                BM.Free;
              end;
            end
            else if DrawColumn.Checkbox.Active then
            begin
              DrawCheckbox(ARect, DrawColumn.Field, DrawColumn.Checkbox.Color,
                DrawColumn.Checkbox.CheckType, AState,
                DrawColumn.Checkbox.ValueTrue);
            end;
            if Columns.State = csDefault then
              DrawDataCell(ARect, DrawColumn.Field, AState);
            DrawColumnCell(ARect, ACol, DrawColumn, AState);
          end
          else
            FillRect(ARect);
        finally
          DataLink.ActiveRecord := OldActive;
        end;
        if DefaultDrawing and (gdSelected in AState) and ((dgAlwaysShowSelection
          in Options) or Focused)
          and not (csDesigning in ComponentState) and not (dgRowSelect in
            Options) and (UpdateLock = 0)
          and (ValidParentForm(Self).ActiveControl = Self) then
          Windows.DrawFocusRect(Handle, ARect);
      end;

      if (ARow < 0) and (ACol >= 0) and (dgMultiLineTitle in FOptions) then
        with DrawColumn.Title do
          if (FLeafFieldArr[ACol].FLeaf.Host <> nil) and
            (FLeafFieldArr[ACol].FLeaf.Host.Drawed = False) then
            DrawHost(FLeafFieldArr[ACol].FLeaf, ARect, EndEllipsis);
    end;

  if (gdFixed in AState) and
    (([dgRowLines, dgColLines] * Options = [dgRowLines, dgColLines]) or (dgFlat
      in Options))
    and ((FFooterRowCount = 0) or ((FFooterRowCount > 0) and (ARow < RowCount -
      FFooterRowCount - 1 - FTitleOffset)))
    and ((ACol < 0) or ((ARow < 0))) then
  begin
    inflateRect(ARect, 1, 1);
    if Down then
    begin
      DrawEdge(Canvas.Handle, ARect, BDR_SUNKENiNNER, BF_BOTTOMRiGHT);
      DrawEdge(Canvas.Handle, ARect, BDR_SUNKENiNNER, BF_TOPLEFT);
    end
    else
    begin
      DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRiGHT);
      DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
  end;

  if (FFooterRowCount > 0) and (ARow > RowCount - FFooterRowCount - 1 -
    FTitleOffset) then
  begin
    inflateRect(ARect, 1, 1);
    {    if (dgFlat in Options) then begin
          DrawEdge(Canvas.Handle, ARect, BDR_SUNKENOUTER, BF_BOTTOMRiGHT);
          DrawEdge(Canvas.Handle, ARect, BDR_SUNKENOUTER, BF_TOPLEFT);
        end else begin}
    DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_BOTTOMRiGHT);
    DrawEdge(Canvas.Handle, ARect, BDR_RAISEDINNER, BF_TOPLEFT);
    //    end;
    inflateRect(ARect, -1, 1);
  end;
end;

procedure TCustomMDBGrid.DrawFooterCell;
var
  Rect: TRect;
  h, i: integer;
begin
  h := StdDefaultRowheight;
  Canvas.Font := AFont;
  Rect.Left := ClientRect.Left + (ACol + 1) * 1 + 3;
  if dgIndicator in Options then
    Rect.Left := Rect.Left + ColWidths[0];
  for i := LeftCol to ACol do
    Rect.Left := Rect.Left + ColWidths[i];
  Rect.Right := Rect.Left + ColWidths[ACol + 1] - 5;
  Rect.Top := ClientRect.Bottom - (FFooterRowCount - ARow) * h;
  Rect.Bottom := Rect.Top + h - 4;
  WriteTextEx(Canvas, Rect, False, 0, 0, AText, AAlignment, tlTop, False, True,
    0, 0);
end;

procedure TCustomMDBGrid.DrawDataCell(const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  if Assigned(FOnDrawDataCell) then
    FOnDrawDataCell(Self, Rect, Field, State);
end;

procedure TCustomMDBGrid.DrawColumnCell(const Rect: TRect; DataCol: integer;
  Column: TDBGColumn; State: TGridDrawState);
begin
  if Assigned(OnDrawColumnCell) then
    OnDrawColumnCell(Self, Rect, DataCol, Column, State);
end;

procedure TCustomMDBGrid.EditButtonClick;
begin
  if Assigned(FOnEditButtonClick) then
    FOnEditButtonClick(Self);
end;

procedure TCustomMDBGrid.EditingChanged;
begin
  if dgindicator in Options then
    invalidateCell(0, FSelRow);
end;

procedure TCustomMDBGrid.EndLayout;
begin
  if FLayoutLock > 0 then
  begin
    try
      try
        if FLayoutLock = 1 then
          internalLayout;
      finally
        if FLayoutLock = 1 then
          FColumns.EndUpdate;
      end;
    finally
      Dec(FLayoutLock);
      EndUpdate;
    end;
  end;
end;

procedure TCustomMDBGrid.EndUpdate;
begin
  if FUpdateLock > 0 then
    Dec(FUpdateLock);
end;

function TCustomMDBGrid.GetColField(DataCol: integer): TField;
begin
  Result := nil;
  if (DataCol >= 0) and FDatalink.Active and (DataCol < Columns.Count) then
    Result := Columns[DataCol].Field;
end;

function TCustomMDBGrid.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCustomMDBGrid.GetEditLimit: integer;
begin
  Result := 0;
  if Assigned(SelectedField) and (SelectedField.DataType = ftString) then
    Result := SelectedField.Size;
end;

function TCustomMDBGrid.GetEditMask(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active then
    with Columns[RawToDataColumn(ACol)] do
      if Assigned(Field) then
        Result := Field.EditMask;
end;

function TCustomMDBGrid.GetEditText(ACol, ARow: Longint): string;
begin
  Result := '';
  if FDatalink.Active then
    with Columns[RawToDataColumn(ACol)] do
      if Assigned(Field) then
        Result := Field.Text;
  FEditText := Result;
end;

function TCustomMDBGrid.GetFieldCount: integer;
begin
  Result := FDatalink.FieldCount;
end;

function TCustomMDBGrid.GetFields(Fieldindex: integer): TField;
begin
  Result := FDatalink.Fields[Fieldindex];
end;

function TCustomMDBGrid.GetFieldValue(ACol: integer): string;
var
  Field: TField;
begin
  Result := '';
  Field := GetColField(ACol);
  if Field <> nil then
    Result := Field.DisplayText;
end;

function TCustomMDBGrid.GetSelectedField: TField;
var
  index: integer;
begin
  index := Selectedindex;
  if index <> -1 then
    Result := Columns[index].Field
  else
    Result := nil;
end;

function TCustomMDBGrid.GetSelectedindex: integer;
begin
  Result := RawToDataColumn(Col);
end;

function TCustomMDBGrid.HighlightCell(DataCol, DataRow: integer;
  const Value: string; AState: TGridDrawState): Boolean;
var
  index: integer;
begin
  Result := False;
  if (dgMultiSelect in Options) and Datalink.Active then
    Result := FBookmarks.Find(Datalink.Datasource.Dataset.Bookmark, index);
  if not Result then
    Result := (gdSelected in AState)
      and ((dgAlwaysShowSelection in Options) or Focused)
      { updatelock eliminates flicker when tabbing between rows }
    and ((UpdateLock = 0) or (dgRowSelect in Options));
end;

procedure TCustomMDBGrid.KeyDown(var Key: Word; Shift: TShiftState);
var
  KeyDownEvent: TKeyEvent;

  procedure ClearSelection;
  begin
    if (dgMultiSelect in Options) then
    begin
      FBookmarks.Clear;
      FSelecting := False;
    end;
  end;

  procedure DoSelection(Select: Boolean; Direction: integer);
  var
    AddAfter: Boolean;
  begin
    AddAfter := False;
    BeginUpdate;
    try
      if (dgMultiSelect in Options) and FDatalink.Active then
        if Select and (ssShift in Shift) then
        begin
          if not FSelecting then
          begin
            FSelectionAnchor := FBookmarks.CurrentRow;
            FBookmarks.CurrentRowSelected := True;
            FSelecting := True;
            AddAfter := True;
          end
          else
            with FBookmarks do
            begin
              AddAfter := Compare(CurrentRow, FSelectionAnchor) <> -Direction;
              if not AddAfter then
                CurrentRowSelected := False;
            end
        end
        else
          ClearSelection;
      FDatalink.Dataset.MoveBy(Direction);
      if AddAfter then
        FBookmarks.CurrentRowSelected := True;
    finally
      EndUpdate;
    end;
  end;

  procedure NextRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
    begin
      if (State = dsinsert) and not Modified and not FDatalink.FModified then
        if EOF then
          Exit
        else
          Cancel
      else
        DoSelection(Select, 1);
      if EOF and CanModify and (not ReadOnly) and (dgEditing in Options) then
        Append;
    end;
  end;

  procedure PriorRow(Select: Boolean);
  begin
    with FDatalink.Dataset do
      if (State = dsinsert) and not Modified and EOF and
        not FDatalink.FModified then
        Cancel
      else
        DoSelection(Select, -1);
  end;

  procedure Tab(GoForward: Boolean);
  var
    ACol, Original: integer;
  begin
    ACol := Col;
    Original := ACol;
    BeginUpdate; { Prevent highlight flicker on tab to next/prior row }
    try
      while True do
      begin
        if GoForward then
          inc(ACol)
        else
          Dec(ACol);
        if ACol >= ColCount then
        begin
          NextRow(False);
          ACol := FindicatorOffset + {ddd} FrozenCols;
        end
        else if ACol < FindicatorOffset + {ddd} FrozenCols then
        begin
          PriorRow(False);
          ACol := ColCount;
        end;
        if ACol = Original then
          Exit;
        if TabStops[ACol] then
        begin
          MoveCol(ACol);
          Exit;
        end;
      end;
    finally
      EndUpdate;
    end;
  end;

  function DeletePrompt: Boolean;
  var
    Msg: string;
  begin
    if (FBookmarks.Count > 1) then
      Msg := SDeleteMultipleRecordsQuestion
    else
      Msg := SDeleteRecordQuestion;
    Result := not (dgConfirmDelete in Options) or
      (MessageDlg(Msg, mtConfirmation, mbOKCancel, 0) <> idCancel);
  end;

const
  RowMovementKeys = [VK_UP, VK_PRiOR, VK_DOWN, VK_NEXT, VK_HOME, VK_END];

begin
  KeyDownEvent := OnKeyDown;
  if Assigned(KeyDownEvent) then
    KeyDownEvent(Self, Key, Shift);
  if not FDatalink.Active or not CanGridAcceptKey(Key, Shift) then
    Exit;
  with FDatalink.DataSet do
    if ssCtrl in Shift then
    begin
      if (Key in RowMovementKeys) then
        ClearSelection;
      case Key of
        VK_UP, VK_PRiOR: MoveBy(-FDatalink.ActiveRecord);
        VK_DOWN, VK_NEXT: MoveBy(FDatalink.BufferCount - FDatalink.ActiveRecord
          - 1);
        //ddd        VK_LEFT: MoveCol(FindicatorOffset);
        VK_LEFT: MoveCol(FindicatorOffset + FrozenCols);
        VK_RiGHT: MoveCol(ColCount - 1);
        VK_HOME: First;
        VK_END: Last;
        VK_DELETE:
          if (not ReadOnly) and not isEmpty
            and CanModify and DeletePrompt then
            if FBookmarks.Count > 0 then
              FBookmarks.Delete
            else
              Delete;
      end
    end
    else
      case Key of
        VK_UP: PriorRow(True);
        VK_DOWN: NextRow(True);
        VK_LEFT:
          if dgRowSelect in Options then
          begin
            // ddd
            if (LeftCol > indicatorOffset + FrozenCols) then
              LeftCol := LeftCol - 1
          end
            // ddd
            {PriorRow(False)}
          else
            MoveCol(Col - 1);
        VK_RiGHT:
          if dgRowSelect in Options then
          begin
            // ddd
            if (VisibleColCount + LeftCol < ColCount) then
              LeftCol := LeftCol + 1; {new}

            { NextRow(False) }
             //\\\
          end
          else
            MoveCol(Col + 1);
        VK_HOME:
          if (ColCount = FindicatorOffset + 1)
            or (dgRowSelect in Options) then
          begin
            ClearSelection;
            First;
          end
          else
            MoveCol(FindicatorOffset);
        VK_END:
          if (ColCount = FindicatorOffset + 1)
            or (dgRowSelect in Options) then
          begin
            ClearSelection;
            Last;
          end
          else
            MoveCol(ColCount - 1);
        VK_NEXT:
          begin
            ClearSelection;
            MoveBy(VisibleRowCount);
          end;
        VK_PRiOR:
          begin
            ClearSelection;
            MoveBy(-VisibleRowCount);
          end;
        VK_iNSERT:
          if CanModify and (not ReadOnly) and (dgEditing in Options) then
          begin
            ClearSelection;
            insert;
          end;
        VK_TAB: if not (ssAlt in Shift) then
            Tab(not (ssShift in Shift));
        VK_ESCAPE:
          begin
            FDatalink.Reset;
            ClearSelection;
            if not (dgAlwaysShowEditor in Options) then
              HideEditor;
          end;
        VK_F2: EditorMode := True;
      end;
end;

procedure TCustomMDBGrid.KeyPress(var Key: Char);
begin
  if not (dgAlwaysShowEditor in Options) and (Key = #13) then
    FDatalink.UpdateData;
  inherited KeyPress(Key);
end;

{ internalLayout is called with layout locks and column locks in effect }

procedure TCustomMDBGrid.internalLayout;
var
  i, J, K: integer;
  Fld: TField;
  Column: TDBGColumn;
  SeenPassthrough: Boolean;
  RestoreCanvas: Boolean;

  tm: TTEXTMETRiC;
  AFont: TFont;
  CW, CountedWidth: Integer;

  function FieldisMapped(F: TField): Boolean;
  var
    X: integer;
  begin
    Result := False;
    if F = nil then
      Exit;
    for X := 0 to FDatalink.FieldCount - 1 do
      if FDatalink.Fields[X] = F then
      begin
        Result := True;
        Exit;
      end;
  end;

begin
  if (csLoading in ComponentState) then
    Exit;

  if HandleAllocated then
    KillMessage(Handle, cm_DeferLayout);

  { Check for Columns.State flip-flop }
  SeenPassthrough := False;
  for i := 0 to FColumns.Count - 1 do
  begin
    if (FColumns[i] is TPassthroughColumn) then
      SeenPassthrough := True
    else if SeenPassthrough then
    begin { We have both custom and passthrough columns. Kill the latter }
      for J := FColumns.Count - 1 downto 0 do
      begin
        Column := FColumns[J];
        if Column is TPassthroughColumn then
          Column.Free;
      end;
      Break;
    end;
  end;

  FindicatorOffset := 0;
  if dgindicator in Options then
    inc(FindicatorOffset);
  FDatalink.ClearMapping;
  if FDatalink.Active then
    DefineFieldMap;
  if FColumns.State = csDefault then
  begin
    { Destroy columns whose fields have been destroyed or are no longer
      in field map }
    if (not FDataLink.Active) and (FDatalink.DefaultFields) then
      FColumns.Clear
    else
      for J := FColumns.Count - 1 downto 0 do
        with FColumns[J] do
          if not Assigned(Field) or not FieldisMapped(Field) then
            Free;
    i := FDataLink.FieldCount;
    if (i = 0) and (FColumns.Count = 0) then
      inc(i);
    for J := 0 to i - 1 do
    begin
      Fld := FDatalink.Fields[J];
      if Assigned(Fld) then
      begin
        K := J;
        { Pointer compare is valid here because the grid sets matching
          column.field properties to nil in response to field object
          free notifications.  Closing a dataset that has only default
          field objects will destroy all the fields and set associated
          column.field props to nil. }
        while (K < FColumns.Count) and (FColumns[K].Field <> Fld) do
          inc(K);
        if K < FColumns.Count then
          Column := FColumns[K]
        else
        begin
          Column := TPassthroughColumn.Create(FColumns);
          Column.Field := Fld;
        end;
      end
      else
        Column := TPassthroughColumn.Create(FColumns);
      Column.index := J;
    end;
  end
  else
  begin
    { Force columns to reacquire fields (in case dataset has changed) }
    for i := 0 to FColumns.Count - 1 do
      FColumns[i].Field := nil;
  end;
  ColCount := FColumns.Count + FindicatorOffset;
  inherited FixedCols := FindicatorOffset + FrozenCols;
  FTitleOffset := 0;
  if dgTitles in Options then
    FTitleOffset := 1;
  RestoreCanvas := not HandleAllocated;
  if RestoreCanvas then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    K := Canvas.TextHeight('Wg') + 3;
    if dgRowLines in Options then
      inc(K, GridLineWidth);

    // DefaultRowHeight:=K;
    GetTextMetrics(Canvas.Handle, tm);
    if (FNewRowsHeight > 0) then
      DefaultRowHeight := FNewRowsHeight
    else
      DefaultRowHeight := K;

    if (tm.tmExternalLeading + tm.tmHeight + tm.tminternalLeading + 4 <
      DefaultRowHeight) then
      FAllowWordWrap := True
    else
      FAllowWordWrap := False;

    if dgTitles in Options then
    begin
      K := 0;
      for i := 0 to FColumns.Count - 1 do
      begin
        Canvas.Font := FColumns[i].Title.Font;
        J := Canvas.TextHeight('Wg') + 4;
        if J > K then
          K := J;
      end;
      if K = 0 then
      begin
        Canvas.Font := FTitleFont;
        K := Canvas.TextHeight('Wg') + 4;
      end;
      RowHeights[0] := K;
    end;
  finally
    if RestoreCanvas then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;

  if (dgAutoFitColumns in Options) and not (csDesigning in ComponentState) then
  begin
    CW := 0;
    K := 0;
    for i := 0 to Columns.Count - 1 do
      if (Columns[i].AutoFit = False) then
        Inc(CW, Columns[i].Width)
      else
        Inc(K, Columns[i].FInitWidth);

    UpdateScrollBar;
    if (ClientWidth > FMinAutoFitWidth) then
      CW := ClientWidth - CW
    else
      CW := FMinAutoFitWidth - CW;
    if (CW < 0) then
      CW := 0;
    if (dgIndicator in Options) then
      Dec(CW, ColWidths[0]);
    if (dgColLines in Options) then
      Dec(CW, ColCount);

    CountedWidth := 0;
    for i := 0 to Columns.Count - 1 do
    begin
      if (Columns[i].AutoFit = True) then
      begin
        Columns[i].Width := MulDiv(Columns[i].FInitWidth, CW, K);
        Inc(CountedWidth, Columns[i].Width);
      end;
    end;

    if (CountedWidth <> CW) then
    begin // Correct last AutoFitColWidth column
      for i := Columns.Count - 1 downto 0 do
        if (Columns[i].AutoFit = True) then
        begin
          Columns[i].Width := Columns[i].Width + CW - CountedWidth;
          if (Columns[i].Width < 0) then
            Columns[i].Width := 0;
          Break;
        end;
    end;
  end;

  if (dgTitles in Options) then
  begin
    if (dgMultiLineTitle in FOptions) then
    begin
      ReallocMem(FLeafFieldArr, SizeOf(LeafCol) * Columns.Count);
      AFont := Canvas.Font;
      Canvas.Font := TitleFont;
      for i := 0 to Columns.Count - 1 do
        FLeafFieldArr[i].FColumn := Columns[i];
      FHeadTree.CreateFieldTree(Self);
      RowHeights[0] := SetChildTreeHeight(FHeadTree) - 1; // +2;
      Canvas.Font := AFont;
    end;
  end;

  UpdateRowCount;
  SetColumnAttributes;
  UpdateActive;
  invalidate;
end;

procedure TCustomMDBGrid.LayoutChanged;
begin
  if AcquireLayoutLock then
    EndLayout;
end;

procedure TCustomMDBGrid.LinkActive(Value: Boolean);
begin
  if not Value then
    HideEditor;
  FBookmarks.LinkActive(Value);
  LayoutChanged;
  UpdateScrollBar;
  if Value and (dgAlwaysShowEditor in Options) then
    ShowEditor;
end;

procedure TCustomMDBGrid.Loaded;
var
  i: Integer;
begin
  inherited Loaded;
  if FColumns.Count > 0 then
  begin
    ColCount := FColumns.Count;
    if (dgAutoFitColumns in Options) then
    begin
      Columns.BeginUpdate;
      for i := 0 to Columns.Count - 1 do
        Columns[i].FInitWidth := Columns[i].Width;
      Columns.EndUpdate;
      ScrollBars := ssNone;
    end;
  end;
  LayoutChanged;
end;

//ddd

function PointinRect(const P: TPoint; const R: TRect): Boolean;
begin
  with R do
    Result := (Left <= P.X) and (Top <= P.Y) and
      (Right >= P.X) and (Bottom >= P.Y);
end;
//\\\

procedure TCustomMDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: integer);
var
  Cell: TGridCoord;
  OldCol, OldRow, Xm, Ym: integer;
  EnableClick: Boolean;
  ARect: TRect;
  Flag: Boolean;
  MouseDownEvent: TMouseEvent;
  //ddd  MCoor:TPoint;
    //ddd
  AEditStyle: TEditStyle;
  APointinRect: Boolean;
  //\\\
begin
  if not AcquireFocus then
    Exit;
  if (ssDouble in Shift) and (Button = mbLeft) then
  begin
    DblClick;
    Exit;
  end;
  //ddd
  Xm := X;
  Ym := Y;
  //\\\
  if Sizing(X, Y) then
  begin
    FDatalink.UpdateData;
    inherited MouseDown(Button, Shift, X, Y)
  end
  else
  begin
    Cell := MouseCoord(X, Y);
    ARect := CellRect(Cell.X, Cell.Y);

    //ddd
    if (dgMultiLineTitle in FOptions) then
    begin
      if (Cell.X > indicatorOffset - 1) and
        (PtinRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom -
          FLeafFieldArr[Cell.X - indicatorOffset].FLeaf.Height + 1),
        Point(X, Y))) then
        Flag := False
      else
        Flag := True;
    end
    else
      Flag := True;
    if (Datalink <> nil) and Datalink.Active and
      (Cell.Y < TitleOffset) and (Cell.X >= indicatorOffset) and
      not (csDesigning in ComponentState) and Flag then
    begin
      if (dgColumnResize in Options) and (Button = mbRight) then
      begin
        Button := mbLeft;
        FSwapButtons := True;
        MouseCapture := True;
      end
      else if Button = mbLeft then
      begin
        EnableClick := Columns[Cell.X - indicatorOffset].Title.TitleButton;
        CheckTitleButton(Cell.X - indicatorOffset, EnableClick);
        if EnableClick then
        begin
          MouseCapture := True;
          FTracking := True;
          FPressedCol := Cell.X;
          TrackButton(X, Y);
          Exit;
        end;
      end;
    end;
    //\\\

    if ((csDesigning in ComponentState) or (dgColumnResize in Options)) and
      (Cell.Y < FTitleOffset) then
    begin
      FDataLink.UpdateData;
      inherited MouseDown(Button, Shift, X, Y)
    end
    else
    begin
      if FDatalink.Active then
        with Cell do
        begin
          BeginUpdate; { eliminates highlight flicker when selection moves }
          try
            HideEditor;
            OldCol := Col;
            OldRow := Row;
            if (Y >= FTitleOffset) and (Y - Row <> 0) then
              FDatalink.Dataset.MoveBy(Y - Row);
            if X >= FindicatorOffset then
              MoveCol(X);
            if (dgMultiSelect in Options) and FDatalink.Active then
              with FBookmarks do
              begin
                FSelecting := False;
                if ssCtrl in Shift then
                  CurrentRowSelected := not CurrentRowSelected
                else
                begin
                  //ddd
                  if not ((Button = mbRight) and (CurrentRowSelected = True))
                    then
                  begin
                    //\\\
                    Clear;
                    CurrentRowSelected := True;
                  end;
                end;
              end;
            // ddd
            (*            if (Button=mbLeft) and
                          (((X=OldCol) and (Y=OldRow)) or (dgAlwaysShowEditor in Options)) then begin
                            ShowEditor;         { put grid in edit mode }*)
            if (Button = mbLeft) then
            begin
              if (Cell.X > indicatorOffset - 1) and (Columns[Cell.X -
                indicatorOffset].AlwaysShowEditButton) then
                AEditStyle := GetColumnEditStile(Columns[Cell.X -
                  indicatorOffset])
              else
                AEditStyle := esSimple;

              APointinRect := PointinRect(Point(Xm, Ym), Rect(ARect.Right -
                FinplaceEditorButtonWidth, ARect.Top, ARect.Right, ARect.Bottom));
              if (dgAlwaysShowEditor in Options) or ((AEditStyle <> esSimple) and
                APointinRect) or ((X = OldCol) and (Y = OldRow)) then
                ShowEditor;

              if (inplaceEditor <> nil) and inplaceEditor.Visible and
                APointinRect then
                inplaceEditor.Perform(WM_LBUTTONDOWN, MK_LBUTTON,
                  Longint(PointToSmallPoint(inplaceEditor.ScreenToClient(ClientToScreen(Point(Xm, Ym))))));
              {                if ((dgAlwaysShowEditor in Options) and (inplaceEditor<>nil) and (inplaceEditor.Visible)) then
                                 inplaceEditor.Perform(WM_LBUTTONDOWN,MK_LBUTTON,
                                   Longint(PointToSmallPoint(inplaceEditor.ScreenToClient(ClientToScreen(Point(Xm,Ym))))));}
              //\\\
            end
            else
              invalidateEditor; { draw editor, if needed }
          finally
            EndUpdate;
          end;
        end;
      //ddd
      MouseDownEvent := OnMouseDown;
      if Assigned(MouseDownEvent) then
        MouseDownEvent(Self, Button, Shift, X, Y);
      //\\\
    end;
  end;
end;

procedure TCustomMDBGrid.MouseMove(Shift: TShiftState; X, Y: integer);
begin
  if FTracking then
    TrackButton(X, Y);
  inherited MouseMove(Shift, X, Y);
end;

procedure TCustomMDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: integer);
var
  Cell: TGridCoord;
  SaveState: TGridState;

  DoClick: Boolean;
  ACol: Longint;

begin
  SaveState := FGridState;
  if (GetCursor = Screen.Cursors[crVSplit]) then
    FDefaultRowChanged := True;
  if FTracking and (FPressedCol >= 0) then
  begin
    Cell := MouseCoord(X, Y);
    DoClick := PtinRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y)) and
      (Cell.Y = 0) and (Cell.X = FPressedCol);
    StopTracking;
    if DoClick then
    begin
      ACol := Cell.X;
      if (dgindicator in Options) then
        Dec(ACol);
      if (DataLink <> nil) and DataLink.Active and (ACol >= 0) and (ACol <
        Columns.Count) then
        DoTitleClick(ACol, Columns[ACol]);
    end;
  end
  else if FSwapButtons then
  begin
    FSwapButtons := False;
    MouseCapture := False;
    if Button = mbRight then
      Button := mbLeft;
  end;

  inherited MouseUp(Button, Shift, X, Y);
  if (SaveState = gsRowSizing) or (SaveState = gsColSizing) or ((inplaceEditor
    <> nil) and (inplaceEditor.Visible) and
    (PtinRect(inplaceEditor.BoundsRect, Point(X, Y)))) then
    Exit;
  Cell := MouseCoord(X, Y);
  if (Button = mbLeft) and (Cell.X >= FindicatorOffset) and (Cell.Y >= 0) then
    if Cell.Y < FTitleOffset then
      TitleClick(Columns[RawToDataColumn(Cell.X)])
    else
      CellClick(Columns[Selectedindex]);

  FDefaultRowChanged := False;
end;

procedure TCustomMDBGrid.MoveCol(RawCol: integer);
var
  OldCol: integer;
begin
  FDatalink.UpdateData;
  if RawCol >= ColCount then
    RawCol := ColCount - 1;
  if RawCol < FindicatorOffset + {ddd} FrozenCols then
    RawCol := FindicatorOffset + {ddd} FrozenCols;
  OldCol := Col;
  if RawCol <> OldCol then
  begin
    if not FinColExit then
    begin
      FinColExit := True;
      try
        ColExit;
      finally
        FinColExit := False;
      end;
      if Col <> OldCol then
        Exit;
    end;
    if not (dgAlwaysShowEditor in Options) then
      HideEditor;
    Col := RawCol;
    ColEnter;
  end;
end;

procedure TCustomMDBGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i: integer;
  NeedLayout: Boolean;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if (AComponent is TPopupMenu) then
    begin
      for i := 0 to Columns.Count - 1 do
        if Columns[i].PopupMenu = AComponent then
          Columns[i].PopupMenu := nil;
    end
    else if (FDataLink <> nil) then
      if (AComponent = DataSource) then
        DataSource := nil
      else if (AComponent is TField) then
      begin
        NeedLayout := False;
        BeginLayout;
        try
          for i := 0 to Columns.Count - 1 do
            with Columns[i] do
              if Field = AComponent then
              begin
                Field := nil;
                NeedLayout := True;
              end;
        finally
          if NeedLayout and Assigned(FDatalink.Dataset)
            and not FDatalink.Dataset.ControlsDisabled then
            EndLayout
          else
            DeferLayout;
        end;
      end;
  end;
end;

procedure TCustomMDBGrid.RecordChanged(Field: TField);
var
  i: integer;
  CField: TField;
begin
  if not HandleAllocated then
    Exit;
  if Field = nil then
    invalidate
  else
  begin
    for i := 0 to Columns.Count - 1 do
      if Columns[i].Field = Field then
        invalidateCol(DataToRawColumn(i));
  end;
  CField := SelectedField;
  if ((Field = nil) or (CField = Field)) and
    (Assigned(CField) and (CField.Text <> FEditText)) then
  begin
    invalidateEditor;
    if inplaceEditor <> nil then
      inplaceEditor.Deselect;
  end;
end;

//ddd

procedure TCustomMDBGrid.Scroll(Distance: integer);
var
  OldRect, NewRect, ClipRegion: TRect;
  RowHeight: integer;
begin
  if not HandleAllocated then
    Exit;
  OldRect := BoxRect(0, Row, ColCount - 1, Row);
  if (FDataLink.ActiveRecord >= RowCount - FTitleOffset) then
    UpdateRowCount;
  UpdateScrollBar;
  UpdateActive;
  NewRect := BoxRect(0, Row, ColCount - 1, Row);
  ValidateRect(Handle, @OldRect);
  invalidateRect(Handle, @OldRect, False);
  invalidateRect(Handle, @NewRect, False);
  if Distance <> 0 then
  begin
    HideEditor;
    try
      if Abs(Distance) > VisibleRowCount then
      begin
        invalidate;
        Exit;
      end
      else
      begin
        RowHeight := DefaultRowHeight;
        if dgRowLines in Options then
          inc(RowHeight, GridLineWidth);
        if dgindicator in Options then
        begin
          OldRect := BoxRect(0, FSelRow, ColCount - 1, FSelRow);
          invalidateRect(Handle, @OldRect, False);
        end;
        NewRect := BoxRect(0, FTitleOffset, ColCount - 1, 1000);
        //ddd
        if (FFooterRowCount > 0) then
        begin
          ClipRegion := BoxRect(0, FTitleOffset, ColCount - 1, RowCount -
            FFooterRowCount - 2);
          ScrollWindowEx(Handle, 0, -RowHeight * Distance, @NewRect,
            @ClipRegion,
            0, nil, SW_invalidate);
        end
        else
          ScrollWindowEx(Handle, 0, -RowHeight * Distance, @NewRect, @NewRect,
            0, nil, SW_invalidate);
        //\\\ddd
        if dgindicator in Options then
        begin
          NewRect := BoxRect(0, Row, ColCount - 1, Row);
          invalidateRect(Handle, @NewRect, False);
        end;
      end;
    finally
      if dgAlwaysShowEditor in Options then
        ShowEditor;
    end;
  end;
  if UpdateLock = 0 then
    Update;
end;

procedure TCustomMDBGrid.SetColumns(Value: TDBGGridColumns);
begin
  Columns.Assign(Value);
end;

function ReadOnlyField(Field: TField): Boolean;
var
  MasterField: TField;
begin
  Result := Field.ReadOnly;
  if not Result and (Field.FieldKind = fkLookup) then
  begin
    Result := True;
    if Field.DataSet = nil then
      Exit;
    MasterField := Field.Dataset.FindField(Field.KeyFields);
    if MasterField = nil then
      Exit;
    Result := MasterField.ReadOnly;
  end;
end;

procedure TCustomMDBGrid.SetColumnAttributes;
var
  i: integer;
begin
  for i := 0 to FColumns.Count - 1 do
    with FColumns[i] do
    begin
      TabStops[i + FindicatorOffset] := not ReadOnly and DataLink.Active and
        Assigned(Field) and not (Field.FieldKind = fkCalculated) and not
        ReadOnlyField(Field);
      ColWidths[i + FindicatorOffset] := Width;
    end;
  if (dgindicator in Options) then
    ColWidths[0] := indicatorWidth;
end;

procedure TCustomMDBGrid.SetDataSource(Value: TDataSource);
begin
  if Value = FDatalink.Datasource then
    Exit;
  FBookmarks.Clear;
  FDataLink.DataSource := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
  LinkActive(FDataLink.Active);
end;

procedure TCustomMDBGrid.SetEditText(ACol, ARow: Longint; const Value: string);
begin
  FEditText := Value;
end;

procedure TCustomMDBGrid.SetOptions(Value: TDBGridOptions);
const
  LayoutOptions = [dgEditing, dgAlwaysShowEditor, dgTitles, dgindicator,
    dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection,
    dgMultilineTitle, dgDrawMemotext, dgDrawGraphic, dgFooters,
      dgAutoFitColumns];
var
  NewGridOptions: TGridOptions;
  ChangedOptions: TDBGridOptions;
  i: integer;
begin
  if FOptions <> Value then
  begin
    NewGridOptions := [];
    if dgColLines in Value then
      NewGridOptions := NewGridOptions + [goFixedVertLine, goVertLine];
    if dgRowLines in Value then
      NewGridOptions := NewGridOptions + [goFixedHorzLine, goHorzLine];
    if dgColumnResize in Value then
      NewGridOptions := NewGridOptions + [goColSizing, goColMoving];
    if dgTabs in Value then
      include(NewGridOptions, goTabs);
    if dgRowSelect in Value then
    begin
      include(NewGridOptions, goRowSelect);
      Exclude(Value, dgAlwaysShowEditor);
      Exclude(Value, dgEditing);
    end;
    if dgEditing in Value then
      include(NewGridOptions, goEditing);
    if dgAlwaysShowEditor in Value then
      include(NewGridOptions, goAlwaysShowEditor);
    if dgFlat in Value then
      NewGridOptions := NewGridOptions - [goFixedHorzLine, goFixedVertLine];
    if dgRowSizing in Value then
      NewGridOptions := NewGridOptions + [goRowSizing]
    else
      NewGridOptions := NewGridOptions - [goRowSizing];
    if dgFooters in Value then
      FFooterRowCount := 1
    else
      FFooterRowCount := 0;
    if (dgAutoFitColumns in Value) then
    begin
      if not (csLoading in ComponentState) then
        for i := 0 to Columns.Count - 1 do
          Columns[i].FinitWidth := Columns[i].Width;
      ScrollBars := ssNone;
    end
    else
    begin
      for i := 0 to Columns.Count - 1 do
        Columns[i].Width := Columns[i].FinitWidth;
      ScrollBars := ssHorizontal;
    end;
    inherited Options := NewGridOptions;
    if dgMultiSelect in (FOptions - Value) then
      FBookmarks.Clear;
    ChangedOptions := (FOptions + Value) - (FOptions * Value);
    FOptions := Value;
    if dgFlat in ChangedOptions then
      RecreateWnd
    else if ChangedOptions * LayoutOptions <> [] then
      LayoutChanged;
  end;
end;

procedure TCustomMDBGrid.SetSelectedField(Value: TField);
var
  i: integer;
begin
  if Value = nil then
    Exit;
  for i := 0 to Columns.Count - 1 do
    if Columns[i].Field = Value then
      MoveCol(DataToRawColumn(i));
end;

procedure TCustomMDBGrid.SetSelectedindex(Value: integer);
begin
  MoveCol(DataToRawColumn(Value));
end;

procedure TCustomMDBGrid.SetTitleFont(Value: TFont);
begin
  FTitleFont.Assign(Value);
  if dgTitles in Options then
    LayoutChanged;
end;

function TCustomMDBGrid.StoreColumns: Boolean;
begin
  Result := Columns.State = csCustomized;
end;

procedure TCustomMDBGrid.TimedScroll(Direction: TGridScrollDirection);
begin
  if FDatalink.Active then
  begin
    with FDatalink do
    begin
      if sdUp in Direction then
      begin
        DataSet.MoveBy(-ActiveRecord - 1);
        Exclude(Direction, sdUp);
      end;
      if sdDown in Direction then
      begin
        DataSet.MoveBy(RecordCount - ActiveRecord);
        Exclude(Direction, sdDown);
      end;
    end;
    if Direction <> [] then
      inherited TimedScroll(Direction);
  end;
end;

procedure TCustomMDBGrid.TitleClick(Column: TDBGColumn);
begin
  if Assigned(FOnTitleClick) then
    FOnTitleClick(Column);
end;

procedure TCustomMDBGrid.TitleFontChanged(Sender: TObject);
begin
  if (not FSelfChangingTitleFont) and not (csLoading in ComponentState) then
    ParentFont := False;
  if dgTitles in Options then
    LayoutChanged;
end;

procedure TCustomMDBGrid.UpdateActive;
var
  NewRow: integer;
  Field: TField;
begin
  if FDatalink.Active and HandleAllocated and not (csLoading in ComponentState)
    then
  begin
    NewRow := FDatalink.ActiveRecord + FTitleOffset;
    if Row <> NewRow then
    begin
      if not (dgAlwaysShowEditor in Options) then
        HideEditor;
      MoveColRow(Col, NewRow, False, False);
      invalidateEditor;
    end;
    Field := SelectedField;
    if Assigned(Field) and (Field.Text <> FEditText) then
      invalidateEditor;
  end;
end;

procedure TCustomMDBGrid.UpdateData;
var
  Field: TField;
begin
  Field := SelectedField;
  if Assigned(Field) then
    Field.Text := FEditText;
end;

procedure TCustomMDBGrid.UpdateRowCount;
var
  BetweenRowHeight, FooterHeight, Delta, t: integer;
begin
  if RowCount <= FTitleOffset then
    RowCount := FTitleOffset + 1;
  FixedRows := FTitleOffset;
  with FDataLink do
    if not Active or (RecordCount = 0) {or not HandleAllocated} then
    begin
      RowCount := 1 + FTitleOffset;
      if (HandleAllocated) then
      begin
        t := RowHeights[0];
        DefaultRowHeight := DefaultRowHeight;
        RowHeights[0] := t;
        if (FFooterRowCount > 0) then
        begin
          BetweenRowHeight := ClientHeight - GridHeight;
          RowCount := RowCount + FFooterRowCount + 1;
          FooterHeight := (StdDefaultRowHeight + iif(dgRowLines in Options,
            GridLineWidth, 0)) * FFooterRowCount;
          RowHeights[iif(dgTitles in Options, 2, 1)] := iif(FooterHeight + 1 <
            BetweenRowHeight, BetweenRowHeight - FooterHeight - 1, 0);
        end;
      end;
    end
    else
    begin
      RowCount := 1000;
      t := RowHeights[0];
      DefaultRowHeight := DefaultRowHeight;
      RowHeights[0] := t;

      FDataLink.BufferCount := VisibleRowCount;
      RowCount := RecordCount + FTitleOffset;
      if dgRowSelect in Options then
        TopRow := FixedRows;
      if (FFooterRowCount > 0) then
      begin
        FooterHeight := (StdDefaultRowHeight + iif(dgRowLines in Options,
          GridLineWidth, 0)) * FFooterRowCount;
        BetweenRowHeight := ClientHeight - GridHeight;
        if (FooterHeight < (ClientHeight - GridHeight)) then
        begin
          RowCount := RowCount + FFooterRowCount + 1;
          RowHeights[RowCount - FFooterRowCount - 1] := BetweenRowHeight -
            FooterHeight - 1;
        end
        else if ((ClientHeight - GridHeight) <= DefaultRowHeight) then
        begin
          if (BetweenRowHeight = 0) or (BetweenRowHeight = -1) then
          begin
            FDataLink.BufferCount := FDataLink.BufferCount - FFooterRowCount -
              1;
            if (FDataLink.BufferCount <= 0) then
            begin
              FDataLink.BufferCount := 1;
              RowCount := 2 + iif(dgTitles in Options, 1, 0) + FFooterRowCount;
              RowHeights[iif(dgTitles in Options, 2, 1)] := 0;
            end
            else if (BetweenRowHeight = 0) then
              RowHeights[RowCount - FFooterRowCount - 1] := DefaultRowHeight
            else
              RowHeights[RowCount - FFooterRowCount - 1] := DefaultRowHeight -
                1;
          end
          else
          begin
            RowCount := RowCount + 1;
            FDataLink.BufferCount := FDataLink.BufferCount - FFooterRowCount;
            if (FDataLink.BufferCount <= 1) then
            begin
              FDataLink.BufferCount := 1;
              RowCount := 2 + iif(dgTitles in Options, 1, 0) + FFooterRowCount;
              t := ClientHeight - (iif(dgTitles in Options, RowHeights[0], 0) +
                RowHeights[1] +
                iif(dgRowLines in Options, GridLineWidth, 0) * (2 + iif(dgTitles
                  in Options, 1, 0)) +
                FooterHeight);
              RowHeights[iif(dgTitles in Options, 2, 1)] := iif(t > 0, t, 0);
            end
            else
            begin
              if (BetweenRowHeight = DefaultRowHeight) then
                FDataLink.BufferCount := FDataLink.BufferCount - 1;
              RowHeights[RowCount - FFooterRowCount - 1] := BetweenRowHeight -
                1;
            end;
          end;
        end
        else if (FooterHeight - (ClientHeight - GridHeight) < (DefaultRowHeight
          + iif(dgRowLines in Options, GridLineWidth, 0)) * RecordCount) then
        begin
          Delta := (FooterHeight - (ClientHeight - GridHeight)) div
            (DefaultRowHeight + iif(dgRowLines in Options, GridLineWidth, 0)) + 1;
          BetweenRowHeight := (ClientHeight - GridHeight + 1) mod
            (DefaultRowHeight + iif(dgRowLines in Options, GridLineWidth, 0));
          RowCount := RowCount + (FFooterRowCount - Delta) + 1;
          FDataLink.BufferCount := FDataLink.RecordCount - Delta;
          if (FDataLink.BufferCount <= 0) then
          begin
            FDataLink.BufferCount := 1;
            RowCount := 2 + iif(dgTitles in Options, 1, 0) + FFooterRowCount;
            RowHeights[iif(dgTitles in Options, 2, 1)] := 0;
          end
          else if (BetweenRowHeight = 1) or (BetweenRowHeight = 0) then
            RowHeights[RowCount - FFooterRowCount - 1] := DefaultRowHeight - (1
              - BetweenRowHeight)
          else
            RowHeights[RowCount - FFooterRowCount - 1] := BetweenRowHeight - 2;
        end
        else
        begin
          FDataLink.BufferCount := 1;
          RowCount := 2 + iif(dgTitles in Options, 1, 0) + FFooterRowCount;
          RowHeights[iif(dgTitles in Options, 2, 1)] := 0;
        end;
      end;
      UpdateActive;
    end;
end;

procedure TCustomMDBGrid.UpdateScrollBar;
var
  SiOld, SiNew: TScrollinfo;
begin
  if FDatalink.Active and HandleAllocated then
    with FDatalink.DataSet do
    begin
      SiOld.cbSize := sizeof(SiOld);
      SiOld.fMask := SiF_ALL;
      GetScrollinfo(Self.Handle, SB_VERT, SiOld);
      SiNew := SiOld;
      if isSequenced then
      begin
        SiNew.nMin := 1;
        SiNew.nPage := Self.VisibleRowCount;
        SiNew.nMax := RecordCount + SiNew.nPage - 1;
        if State in [dsinactive, dsBrowse, dsEdit] then
          SiNew.nPos := RecNo; // else keep old pos
      end
      else
      begin
        SiNew.nMin := 0;
        SiNew.nPage := 0;
        SiNew.nMax := 4;
        if BOF then
          SiNew.nPos := 0
        else if EOF then
          SiNew.nPos := 4
        else
          SiNew.nPos := 2;
      end;
      if (SiNew.nMin <> SiOld.nMin) or (SiNew.nMax <> SiOld.nMax) or
        (SiNew.nPage <> SiOld.nPage) or (SiNew.nPos <> SiOld.nPos) then
        SetScrollinfo(Self.Handle, SB_VERT, SiNew, True);
    end;
end;

function TCustomMDBGrid.ValidFieldindex(Fieldindex: integer): Boolean;
begin
  Result := DataLink.GetMappedindex(Fieldindex) >= 0;
end;

procedure TCustomMDBGrid.CMParentFontChanged(var Message: TMessage);
begin
  inherited;
  if ParentFont then
  begin
    FSelfChangingTitleFont := True;
    try
      TitleFont := Font;
    finally
      FSelfChangingTitleFont := False;
    end;
    LayoutChanged;
  end;
end;

procedure TCustomMDBGrid.CMExit(var Message: TMessage);
begin
  try
    if FDatalink.Active then
      with FDatalink.Dataset do
        if (dgCancelOnExit in Options) and (State = dsinsert) and
          not Modified and not FDatalink.FModified then
          Cancel
        else
          FDataLink.UpdateData;
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TCustomMDBGrid.CMFontChanged(var Message: TMessage);
var
  i: integer;
begin
  inherited;
  BeginLayout;
  try
    for i := 0 to Columns.Count - 1 do
      Columns[i].RefreshDefaultFont;
  finally
    EndLayout;
  end;
end;

procedure TCustomMDBGrid.CMDeferLayout(var Message);
begin
  if AcquireLayoutLock then
    EndLayout
  else
    DeferLayout;
end;

procedure TCustomMDBGrid.CMDesignHitTest(var Msg: TCMDesignHitTest);
begin
  inherited;
  if (Msg.Result = 1) and ((FDataLink = nil) or
    ((Columns.State = csDefault) and
    (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Msg.Result := 0;
end;

procedure TCustomMDBGrid.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (csDesigning in ComponentState) and ((FDataLink = nil) or
    ((Columns.State = csDefault) and
    (FDataLink.DefaultFields or (not FDataLink.Active)))) then
    Windows.SetCursor(LoadCursor(0, iDC_ARROW))
  else
    inherited;
end;

procedure TCustomMDBGrid.WMSize(var Message: TWMSize);
begin
  inherited;
  if (dgAutoFitColumns in Options) and (UpdateLock = 0) then
    LayoutChanged;
  if UpdateLock = 0 then
    UpdateRowCount;
end;

procedure TCustomMDBGrid.WMVScroll(var Message: TWMVScroll);
var
  Si: TScrollinfo;
begin
  if not AcquireFocus then
    Exit;
  if FDatalink.Active then
    with Message, FDataLink.DataSet do
      case ScrollCode of
        SB_LiNEUP: MoveBy(-FDatalink.ActiveRecord - 1);
        SB_LiNEDOWN: MoveBy(FDatalink.RecordCount - FDatalink.ActiveRecord);
        SB_PAGEUP: MoveBy(-VisibleRowCount);
        SB_PAGEDOWN: MoveBy(VisibleRowCount);
        SB_THUMBPOSiTiON:
          begin
            if isSequenced then
            begin
              Si.cbSize := sizeof(Si);
              Si.fMask := SiF_ALL;
              GetScrollinfo(Self.Handle, SB_VERT, Si);
              if Si.nTrackPos <= 1 then
                First
              else if Si.nTrackPos >= RecordCount then
                Last
              else
                RecNo := Si.nTrackPos;
            end
            else
              case Pos of
                0: First;
                1: MoveBy(-VisibleRowCount);
                2: Exit;
                3: MoveBy(VisibleRowCount);
                4: Last;
              end;
          end;
        SB_BOTTOM: Last;
        SB_TOP: First;
      end;
end;

procedure TCustomMDBGrid.Setime;
var
  Column: TDBGColumn;
begin
  if not SysLocale.FarEast then
    Exit;

  imeName := FOriginalimeName;
  imeMode := FOriginalimeMode;
  Column := Columns[Selectedindex];
  if Column.isimeNameStored then
    imeName := Column.imeName;
  if Column.isimeModeStored then
    imeMode := Column.imeMode;

  if inplaceEditor <> nil then
  begin
    TDBGridinplaceEdit(Self).imeName := imeName;
    TDBGridinplaceEdit(Self).imeMode := imeMode;
  end;
end;

procedure TCustomMDBGrid.Updateime;
begin
  if not SysLocale.FarEast then
    Exit;
  Setime;
  SetimeName(imeName);
  SetimeMode(Handle, imeMode);
end;

procedure TCustomMDBGrid.WMiMEStartComp(var Message: TMessage);
begin
  inherited;
  ShowEditor;
end;

procedure TCustomMDBGrid.WMSetFocus(var Message: TWMSetFocus);
begin
  if not ((inplaceEditor <> nil) and
    (Message.FocusedWnd = inplaceEditor.Handle)) then
    Setime;
  inherited;
end;

procedure TCustomMDBGrid.WMKillFocus(var Message: TMessage);
begin
  if not SysLocale.FarEast then
    inherited
  else
  begin
    imeName := Screen.Defaultime;
    imeMode := imDontCare;
    inherited;
    if not ((inplaceEditor <> nil) and
      (Message.WParam = inplaceEditor.Handle)) then
      ActivateKeyboardLayout(Screen.DefaultKbLayout, KLF_ACTiVATE);
  end;
end;

procedure TCustomMDBGrid.Paint;
begin
  inherited Paint;
  if (dgTitles in Options) and (dgMultiLineTitle in FOptions) then
    FHeadTree.DoForAllNode(ClearPainted);
  if not (csDesigning in ComponentState) and
    (dgRowSelect in Options) and DefaultDrawing and Focused then
  begin
    Canvas.Font.Color := clWindowText;
    with Selection do
      DrawFocusRect(Canvas.Handle, BoxRect(Left, Top, Right, Bottom));
  end;
end;

procedure TCustomMDBGrid.ClearPainted(node: THeadTreeNode);
begin
  node.Drawed := false;
end;

procedure TCustomMDBGrid.WriteMarginText(isMargin: Boolean);
begin
  if (isMargin <> FMarginText) then
  begin
    FMarginText := isMargin;
    LayoutChanged;
  end;
end;

procedure TCustomMDBGrid.WriteVTitleMargin(Value: integer);
begin
  FVTitleMargin := Value;
  LayoutChanged;
end;

procedure TCustomMDBGrid.WriteHTitleMargin(Value: integer);
begin
  FHTitleMargin := Value;
  LayoutChanged;
end;

function TCustomMDBGrid.GetRowsHeight: integer;
begin
  Result := FNewRowsHeight;
end;

procedure TCustomMDBGrid.SetRowsHeight(Value: integer);
begin
  if Value <> FNewRowsHeight then
  begin
    FNewRowsHeight := iif(Value < 0, 0, Value);
    LayoutChanged;
  end;
end;

procedure TCustomMDBGrid.RowHeightsChanged;
var
  i, ThisHasChanged, Def: integer;
begin
  if (FDefaultRowChanged = True) then
  begin
    FDefaultRowChanged := False;
    ThisHasChanged := -1;
    Def := DefaultRowHeight;
    for i := Ord(dgTitles in Options) to RowCount - iif(FFooterRowCount > 0,
      FFooterRowCount + 1, 0) do
      if RowHeights[i] <> Def then
      begin
        ThisHasChanged := i;
        Break;
      end;
    if ThisHasChanged <> -1 then
    begin
      SetRowsHeight(RowHeights[ThisHasChanged]);
    end;
  end;
  inherited;
end;

function TCustomMDBGrid.StdDefaultRowHeight: integer;
var
  K: integer;
begin
  if not HandleAllocated then
    Canvas.Handle := GetDC(0);
  try
    Canvas.Font := Font;
    K := Canvas.TextHeight('Wg') + 3;
    if dgRowLines in Options then
      inc(K, GridLineWidth);
    Result := K;
  finally
    if not HandleAllocated then
    begin
      ReleaseDC(0, Canvas.Handle);
      Canvas.Handle := 0;
    end;
  end;
end;

procedure TCustomMDBGrid.StopTracking;
begin
  if FTracking then
  begin
    TrackButton(-1, -1);
    FTracking := False;
    MouseCapture := False;
  end;
end;

procedure TCustomMDBGrid.TrackButton(X, Y: integer);
var
  Cell: TGridCoord;
  NewPressed: Boolean;
begin
  Cell := MouseCoord(X, Y);
  NewPressed := PtinRect(Rect(0, 0, ClientWidth, ClientHeight), Point(X, Y))
    and (FPressedCol = Cell.X) and (Cell.Y = 0);
  if FPressed <> NewPressed then
  begin
    FPressed := NewPressed;
    GridinvalidateRow(Self, 0);
  end;
end;

procedure TCustomMDBGrid.WMCancelMode(var Message: TMessage);
begin
  StopTracking;
  inherited;
end;

procedure TCustomMDBGrid.DoTitleClick(ACol: Longint; AColumn: TDBGColumn);
begin
  if Assigned(FOnTitleBtnClick) then
    FOnTitleBtnClick(Self, ACol, AColumn);
end;

procedure TCustomMDBGrid.CheckTitleButton(ACol: Longint; var Enabled: Boolean);
begin
  if (ACol >= 0) and (ACol < Columns.Count) then
  begin
    if Assigned(FOnCheckButton) then
      FOnCheckButton(Self, ACol, Columns[ACol], Enabled);
  end
  else
    Enabled := False;
end;

function TCustomMDBGrid.SetChildTreeHeight(ANode: THeadTreeNode): integer;
var
  htLast: THeadTreeNode;
  newh, maxh, th: integer;
  rec: TRect;
  DefaultRowHeight: integer;
begin
  DefaultRowHeight := 0;
  Result := 0;
  if (ANode.Child = nil) then
    Exit;
  htLast := ANode.Child;
  maxh := 0;
  Canvas.Font := TitleFont;
  if (htLast.Child <> nil) then
    maxh := SetChildTreeHeight(htLast);

  rec := Rect(0, 0, htLast.Width - 4 - htLast.Windent, DefaultRowHeight);
  if (rec.Left >= rec.Right) then
    rec.Right := rec.Left + 1;
  th := DrawText(Canvas.Handle, PChar(htLast.Text),
    Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT);
  if (th > DefaultRowHeight) then
    maxh := maxh + th + FVTitleMargin
  else
    maxh := maxh + DefaultRowHeight;

  while true do
  begin
    if (ANode.Child = htLast.Next) then
    begin
      break;
    end;
    htLast := htLast.Next;
    newh := 0;
    if (htLast.Child <> nil) then
      newh := SetChildTreeHeight(htLast);
    rec := Rect(0, 0, htLast.Width - 4 - htLast.Windent, DefaultRowHeight);
    if (rec.Left >= rec.Right) then
      rec.Right := rec.Left + 1;
    th := DrawText(Canvas.Handle, PChar(htLast.Text),
      Length(htLast.Text), rec, DT_WORDBREAK or DT_CALCRECT);
    if (th > DefaultRowHeight) then
      newh := newh + th + FVTitleMargin
    else
      newh := newh + DefaultRowHeight;

    if (maxh < newh) then
      maxh := newh;
  end;

  htLast := ANode.Child;
  while ANode.Child <> htLast.Next do
  begin
    if (htLast.Child = nil) then
      htLast.Height := maxh
    else
      htLast.Height := maxh - htLast.Height;
    htLast := htLast.Next;
  end;
  if (htLast.Child = nil) then
    htLast.Height := maxh
  else
    htLast.Height := maxh - htLast.Height;

  ANode.Height := maxh;
  Result := maxh;
end;

procedure TCustomMDBGrid.SetFrozenCols(Value: integer);
begin
  if (Value = FFrozenCols) and (Value < 0) then
    Exit;
  FFrozenCols := Value;
  LayoutChanged;
end;

{ THeadTreeNode }

function ExtractWordPos(N: integer; const S: string; WordDelims: TCharSet;
  var Pos: integer): string; forward;

constructor THeadTreeNode.Create;
begin
  Child := nil;
  Next := Self;
  Host := nil;
  Windent := 0;
end;

constructor THeadTreeNode.CreateText(AText: string; AHeight, AWidth: integer);
begin
  Create;
  Text := AText;
  Height := AHeight;
  Width := AWidth;
end;

destructor THeadTreeNode.Destroy;
begin
  inherited;
  if (Host = nil) then
  begin
    FreeAllChild;
  end;
end;

function THeadTreeNode.Add(AAfter: THeadTreeNode; AText: string; AHeight,
  AWidth: integer): THeadTreeNode;
var
  htLast, {htSelf,} th: THeadTreeNode;
begin
  if (Find(AAfter) = false) then
    raise Exception.Create('Node not in Tree');
  htLast := AAfter.Next;
  //    while AAfter<>htLast.Next do htLast:=htLast.Next; // Ишим последний
  th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
  th.Host := AAfter.Host;
  AAfter.Next := th;
  th.Next := htLast;
  Result := th;
end;

function THeadTreeNode.AddChild(ANode: THeadTreeNode; AText: string; AHeight,
  AWidth: integer): THeadTreeNode;
var
  htLast, th: THeadTreeNode;
begin
  if (Find(ANode) = false) then
    raise Exception.Create('Node not in Tree');

  if (ANode.Child = nil) then
  begin
    th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
    th.Host := ANode;
    ANode.Child := th;
  end
  else
  begin
    htLast := ANode.Child;
    while ANode.Child <> htLast.Next do
      htLast := htLast.Next;
    th := THeadTreeNode.CreateText(AText, AHeight, AWidth);
    th.Host := ANode;
    htLast.Next := th;
    th.Next := ANode.Child;
  end;
  Result := th;
end;

procedure THeadTreeNode.FreeAllChild;
var
  htLast, htm: THeadTreeNode;
begin
  if (Child = nil) then
    Exit;
  htLast := Child;

  while true do
  begin
    htLast.FreeAllChild;
    if (Child = htLast.Next) then
    begin
      htLast.Free;
      break;
    end;
    htm := htLast;
    htLast := htLast.Next;
    htm.Free;
  end;
  Child := nil;
end;

function THeadTreeNode.Find(ANode: THeadTreeNode): Boolean;
var
  htLast: THeadTreeNode;
begin
  Result := false;
  //  if(Child =nil) then Exit;

  htLast := Self;

  while true do
  begin
    if (htLast = ANode) then
    begin
      Result := true;
      break;
    end;
    if (htLast.Child <> nil) and (htLast.Child.Find(ANode) = true) then
    begin
      Result := true;
      break;
    end;
    if (Self = htLast.Next) then
    begin
      Result := false;
      break;
    end;
    htLast := htLast.Next;
  end;
end;

procedure THeadTreeNode.Union(AFrom, ATo: THeadTreeNode; AText: string; AHeight:
  integer);
var
  th, tUn, TBeforFrom: THeadTreeNode;
  toFinded: Boolean;
  wid: integer;
begin
  if (Find(AFrom) = false) then
    raise Exception.Create('Node not in Tree');
  toFinded := True;
  if (AFrom <> ATo) then
  begin //new
    th := AFrom;
    toFinded := false;
    while AFrom.HOst.Child <> th.Next do
    begin
      if (th.Next = ATo) then
      begin
        toFinded := true;
        break;
      end;
      th := th.Next;
    end;
  end;

  if (toFinded = false) then
    raise Exception.Create('ATo not in level');

  tUn := ATo.Add(ATo, AText, AHeight, 0);
  TBeforFrom := AFrom.Host.Child;
  while TBeforFrom.Next <> AFrom do
    TBeforFrom := TBeforFrom.Next;

  TBeforFrom.Next := tUn;

  th := AFrom;
  tUn.Child := AFrom;
  if (th = AFrom.Host.Child) then
    AFrom.Host.Child := tUn;
  Wid := 0;
  while th <> ATo.Next do
  begin
    inc(Wid, th.Width);
    inc(Wid, 1);
    Dec(th.Height, AHeight);
    th.Host := TUn;
    th := th.Next;
  end;
  Dec(Wid, 1);
  ATo.Next := AFrom;
  tUn.Width := Wid;
end;

//--------------------- CreateFieldTree ---------------------------------------

procedure THeadTreeNode.CreateFieldTree(AGrid: TCustomMDBGrid);
var
  i, pos, j: integer;
  node, nodeFrom, nodeTo: THeadTreeNode;
  ss, ss1: string;
  sameWord, GroupDid: Boolean;
begin

  FreeAllChild;

  for i := 0 to AGrid.Columns.Count - 1 do
  begin
    node := AddChild(Self, AGrid.Columns[i].Title.Caption,
      AGrid.RowHeights[0],
      AGrid.Columns[i].Width);
    if (AGrid.Columns[i].Title.SortMarker <> smNone) then
      node.Windent := 16;
    AGrid.FLeafFieldArr[i].FLeaf := node;
  end;

  // Группируем.
  while True do
  begin //for k:=0 to ListNodeField.Count-1 do begin
    GroupDid := false;
    for i := 0 to AGrid.Columns.Count - 1 do
    begin
      ss1 := ExtractWordPos(2, AGrid.FLeafFieldArr[i].FLeaf.Text, ['|'], pos);
      if (ss1 <> '') then
      begin
        ss1 := ExtractWord(1, AGrid.FLeafFieldArr[i].FLeaf.Text, ['|']);
        nodeFrom := AGrid.FLeafFieldArr[i].FLeaf;
        //      sameWord:=false;
        sameWord := True;
        for j := i to AGrid.Columns.Count - 1 do
        begin
          if (AGrid.Columns.Count - 1 > j) and
            (ExtractWord(1, AGrid.FLeafFieldArr[j + 1].FLeaf.Text, ['|']) = ss1)
              then
          begin
            ss := AGrid.FLeafFieldArr[j].FLeaf.Text;
            Delete(ss, 1, pos - 1);
            AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
            sameWord := true;
            GroupDid := true;
          end
          else
          begin
            if (sameWord = true) then
            begin
              ss := AGrid.FLeafFieldArr[j].FLeaf.Text;
              Delete(ss, 1, pos - 1);
              //            TLeafField(ListNodeField.items[j]).Field.DisplayLabel:=ss;
              AGrid.FLeafFieldArr[j].FLeaf.Text := ss;
              nodeTo := AGrid.FLeafFieldArr[j].FLeaf;
              GroupDid := true;
            end;
            break;
          end;
        end;
        if (sameWord = true) then
        begin
          Union(nodeFrom, nodeTo, ss1, 20);
          break;
        end;
      end; //if
    end; //i
    if (GroupDid = false) then
      break;
  end; //k

end;

procedure THeadTreeNode.DoForAllNode(proc: THeadTreeProc);
var
  htLast: THeadTreeNode;
begin
  if (Child = nil) then
    Exit;
  htLast := Child;
  while true do
  begin
    proc(htLast);
    if (htLast.Child <> nil) then
      htLast.DoForAllNode(proc);
    if (Child = htLast.Next) then
    begin
      break;
    end;
    htLast := htLast.Next;
  end;
end;

////////
///{strUtils}
////////

function WordPosition(const N: integer; const S: string; WordDelims: TCharSet):
  integer;
var
  Count, i: Cardinal;
begin
  Count := 0;
  i := 1;
  Result := 0;
  while (i <= Length(S)) and (Count <> N) do
  begin
    { skip over delimiters }
    while (i <= Length(S)) and (S[i] in WordDelims) do
      inc(i);
    { if we're not beyond end of S, we're at the start of a word }
    if i <= Length(S) then
      inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (i <= Length(S)) and not (S[i] in WordDelims) do
        inc(i)
    else
      Result := i;
  end;
end;

function ExtractWord(N: integer; const S: string; WordDelims: TCharSet): string;
var
  i: Word;
  Len: integer;
begin
  Len := 0;
  i := WordPosition(N, S, WordDelims);
  if i <> 0 then
    { find the end of the current word }
    while (i <= Length(S)) and not (S[i] in WordDelims) do
    begin
      { add the i'th character to result }
      inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[i];
      inc(i);
    end;
  SetLength(Result, Len);
end;

function ExtractWordPos(N: integer; const S: string; WordDelims: TCharSet;
  var Pos: integer): string;
var
  i, Len: integer;
begin
  Len := 0;
  i := WordPosition(N, S, WordDelims);
  Pos := i;
  if i <> 0 then
    { find the end of the current word }
    while (i <= Length(S)) and not (S[i] in WordDelims) do
    begin
      { add the i'th character to result }
      inc(Len);
      SetLength(Result, Len);
      Result[Len] := S[i];
      inc(i);
    end;
  SetLength(Result, Len);
end;

procedure TCustomMDBGrid.GetCellParams(Column: TDBGColumn; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, Column, AFont, Background, State);
end;

procedure TCustomMDBGrid.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if (BorderStyle = bsSingle) and (dgFlat in Options) then
    with Params do
    begin
      if NewStyleControls and Ctl3D then
        ExStyle := ExStyle and not WS_EX_CLiENTEDGE
      else
        Style := Style and not WS_BORDER;
    end;
end;

procedure TCustomMDBGrid.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  if (BorderStyle = bsSingle) and (dgFlat in Options) then
    inflateRect(Message.CalcSize_Params^.rgrc[0], -1, -1);
end;

procedure TCustomMDBGrid.WMNCPaint(var Message: TMessage);
var
  R, R1: TRect;
  DC: HDC;
  ScrollW, ScrollH: integer;
  Brush: HBRUSH;
  Scrollinfo: TScrollinfo;
  iScroll, VScroll, HScroll: boolean;
begin
  inherited;
  if (BorderStyle = bsSingle) and (dgFlat in Options) then
  begin
    DC := GetWindowDC(Handle);
    Brush := CreateSolidBrush(ColorToRGB(clBtnFace));
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);

      Scrollinfo.cbSize := SizeOf(Scrollinfo);
      Scrollinfo.fMask := SiF_ALL;
      iScroll := GetScrollinfo(Self.Handle, SB_HORZ, Scrollinfo);
      HScroll := iScroll and (Scrollinfo.nMin <> Scrollinfo.nMax);
      iScroll := GetScrollinfo(Self.Handle, SB_VERT, Scrollinfo);
      VScroll := iScroll and (Scrollinfo.nMin <> Scrollinfo.nMax);

      if DataVisible and HScroll and VScroll then
      begin
        ScrollW := GetSystemMetrics(SM_CXVSCROLL);
        ScrollH := GetSystemMetrics(SM_CYVSCROLL);
        R1 := Rect(R.Right - ScrollW - 1, R.Bottom - ScrollH - 1, R.Right - 1,
          R.Bottom - 1);
        FrameRect(DC, R1, Brush);
      end;

      DrawEdge(DC, R, BDR_SUNKENOUTER, BF_TOPLEFT);
      DrawEdge(DC, R, BDR_RAISEDINNER, BF_BOTTOMRiGHT);
    finally
      DeleteObject(Brush);
      ReleaseDC(Handle, DC);
    end;
  end;
end;

function TCustomMDBGrid.DataVisible: boolean;
begin
  Result := (csDesigning in ComponentState) or (
    (FColumns.Count <> 0) and (((DataSource <> nil) and
    (DataSource.DataSet <> nil) and (FDatalink.Fields[0] <> nil)) or
    (FColumns[0].FFieldName <> '')));
end;

procedure TCustomMDBGrid.DrawBitmap;
var
  MyRect: TRect;
begin
  Canvas.FillRect(Rect);
  MyRect.Top := ((Rect.Bottom - Rect.Top - DefaultRowHeight - 1) div 2) +
    Rect.Top;
  MyRect.Left := Rect.Left;
  MyRect.Bottom := MyRect.Top + DefaultRowheight;
  MyRect.Right := MyRect.Left + DefaultRowheight;
  if (gdSelected in State) and (Focused or (dgAlwaysShowSelection in Options))
    then
    Canvas.CopyMode := cmSrcCopy
  else
    Canvas.CopyMode := cmSrcCopy;
  if Stretch then
    Canvas.StretchDraw(MyRect, Bitmap)
  else
    Canvas.Draw(MyRect.Left, MyRect.Top, Bitmap);
  if DrawText then
    Canvas.TextOut(MyRect.Left + DefaultRowHeight + 4, Rect.Top + 2
      {(Rect.Bottom-Rect.Top-Canvas.TextHeight('M')) div 2}, Field.AsString);
end;

procedure TCustomMDBGrid.DrawCheckBox;
var
  MyRect: TRect;
begin
  Canvas.FillRect(Rect);
  MyRect.Top := ((Rect.Bottom - Rect.Top - 11) div 2) + Rect.Top;
  MyRect.Left := ((Rect.Right - Rect.Left - 11) div 2) + Rect.Left;
  MyRect.Bottom := MyRect.Top + 10;
  MyRect.Right := MyRect.Left + 10;
  if (gdSelected in State) and (Focused or (dgAlwaysShowSelection in Options))
    then
    Canvas.Pen.Color := clWhite
  else
    Canvas.Pen.Color := Color;
  Canvas.Polyline([
    Point(MyRect.Left, MyRect.Top), Point(MyRect.Right, MyRect.Top),
      Point(MyRect.Right, MyRect.Bottom), Point(MyRect.Left, MyRect.Bottom),
      Point(MyRect.Left, MyRect.Top)]);
  if Field.Value = TrueValue then
  begin
    case CheckType of
      ctCheck:
        begin
          Canvas.MoveTo(MyRect.Left + 2, MyRect.Top + 4);
          Canvas.LineTo(MyRect.Left + 2, MyRect.Top + 7);
          Canvas.MoveTo(MyRect.Left + 3, MyRect.Top + 5);
          Canvas.LineTo(MyRect.Left + 3, MyRect.Top + 8);
          Canvas.MoveTo(MyRect.Left + 4, MyRect.Top + 6);
          Canvas.LineTo(MyRect.Left + 4, MyRect.Top + 9);
          Canvas.MoveTo(MyRect.Left + 5, MyRect.Top + 5);
          Canvas.LineTo(MyRect.Left + 5, MyRect.Top + 8);
          Canvas.MoveTo(MyRect.Left + 6, MyRect.Top + 4);
          Canvas.LineTo(MyRect.Left + 6, MyRect.Top + 7);
          Canvas.MoveTo(MyRect.Left + 7, MyRect.Top + 3);
          Canvas.LineTo(MyRect.Left + 7, MyRect.Top + 6);
          Canvas.MoveTo(MyRect.Left + 8, MyRect.Top + 2);
          Canvas.LineTo(MyRect.Left + 8, MyRect.Top + 5);
        end;
      ctCross:
        begin
          Canvas.MoveTo(MyRect.Left + 8, MyRect.Top + 7);
          Canvas.LineTo(MyRect.Left + 8, MyRect.Top + 9);
          Canvas.MoveTo(MyRect.Left + 7, MyRect.Top + 6);
          Canvas.LineTo(MyRect.Left + 7, MyRect.Top + 9);
          Canvas.MoveTo(MyRect.Left + 6, MyRect.Top + 5);
          Canvas.LineTo(MyRect.Left + 6, MyRect.Top + 8);
          Canvas.MoveTo(MyRect.Left + 5, MyRect.Top + 4);
          Canvas.LineTo(MyRect.Left + 5, MyRect.Top + 7);
          Canvas.MoveTo(MyRect.Left + 4, MyRect.Top + 3);
          Canvas.LineTo(MyRect.Left + 4, MyRect.Top + 6);
          Canvas.MoveTo(MyRect.Left + 3, MyRect.Top + 2);
          Canvas.LineTo(MyRect.Left + 3, MyRect.Top + 5);

          Canvas.MoveTo(MyRect.Left + 3, MyRect.Top + 7);
          Canvas.LineTo(MyRect.Left + 3, MyRect.Top + 9);
          Canvas.MoveTo(MyRect.Left + 4, MyRect.Top + 6);
          Canvas.LineTo(MyRect.Left + 4, MyRect.Top + 9);
          Canvas.MoveTo(MyRect.Left + 5, MyRect.Top + 5);
          Canvas.LineTo(MyRect.Left + 5, MyRect.Top + 8);
          Canvas.MoveTo(MyRect.Left + 6, MyRect.Top + 4);
          Canvas.LineTo(MyRect.Left + 6, MyRect.Top + 7);
          Canvas.MoveTo(MyRect.Left + 7, MyRect.Top + 3);
          Canvas.LineTo(MyRect.Left + 7, MyRect.Top + 6);
          Canvas.MoveTo(MyRect.Left + 8, MyRect.Top + 2);
          Canvas.LineTo(MyRect.Left + 8, MyRect.Top + 5);
        end;
    end;
  end;
end;

{ TColumnFooter }

procedure TColumnFooter.Assign(Source: TPersistent);
begin
  if Source is TColumnFooter then
  begin
    if cvFooterAlignment in TColumnFooter(Source).FColumn.FAssignedValues then
      Alignment := TColumnFooter(Source).Alignment;
    if cvFooterText in TColumnFooter(Source).FColumn.FAssignedValues then
      Text := TColumnFooter(Source).Text;
    if cvFooterFont in TColumnFooter(Source).FColumn.FAssignedValues then
      Font := TColumnFooter(Source).Font;
  end
  else
    inherited Assign(Source);
end;

constructor TColumnFooter.Create(Column: TDBGColumn);
begin
  inherited Create;
  FColumn := Column;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
end;

function TColumnFooter.DefaultAlignment: TAlignment;
begin
  Result := taLeftJustify;
end;

function TColumnFooter.DefaultFont: TFont;
var
  Grid: TCustomMDBGrid;
begin
  Grid := FColumn.GetGrid;
  if Assigned(Grid) then
    Result := Grid.TitleFont
  else
    Result := FColumn.Font;
end;

function TColumnFooter.DefaultText: string;
begin
  Result := '';
end;

destructor TColumnFooter.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TColumnFooter.FontChanged(Sender: TObject);
begin
  include(FColumn.FAssignedValues, cvFooterFont);
  FColumn.Changed(True);
end;

function TColumnFooter.GetAlignment: TAlignment;
begin
  if cvFooterAlignment in FColumn.FAssignedValues then
    Result := FAlignment
  else
    Result := DefaultAlignment;
end;

function TColumnFooter.GetFont: TFont;
var
  Save: TNotifyEvent;
  Def: TFont;
begin
  if not (cvFooterFont in FColumn.FAssignedValues) then
  begin
    Def := DefaultFont;
    if (FFont.Handle <> Def.Handle) or (FFont.Color <> Def.Color) then
    begin
      Save := FFont.OnChange;
      FFont.OnChange := nil;
      FFont.Assign(DefaultFont);
      FFont.OnChange := Save;
    end;
  end;
  Result := FFont;
end;

function TColumnFooter.GetText: string;
begin
  if cvFooterText in FColumn.FAssignedValues then
    Result := FText
  else
    Result := DefaultText;
end;

function TColumnFooter.isAlignmentStored: Boolean;
begin
  Result := (cvFooterAlignment in FColumn.FAssignedValues) and (FAlignment <>
    DefaultAlignment);
end;

function TColumnFooter.isFontStored: Boolean;
begin
  Result := (cvFooterFont in FColumn.FAssignedValues);
end;

procedure TColumnFooter.RefreshDefaultFont;
var
  Save: TNotifyEvent;
begin
  if (cvFooterFont in FColumn.FAssignedValues) then
    Exit;
  Save := FFont.OnChange;
  FFont.OnChange := nil;
  try
    FFont.Assign(DefaultFont);
  finally
    FFont.OnChange := Save;
  end;
end;

procedure TColumnFooter.RestoreDefaults;
var
  FontAssigned: Boolean;
begin
  FontAssigned := cvFooterFont in FColumn.FAssignedValues;
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnFooterValues;
  FText := '';
  RefreshDefaultFont;
  FColumn.Changed(FontAssigned);
end;

procedure TColumnFooter.SetAlignment(const Value: TAlignment);
begin
  if (cvFooterAlignment in FColumn.FAssignedValues) and (Value = FAlignment)
    then
    Exit;
  FAlignment := Value;
  include(FColumn.FAssignedValues, cvFooterAlignment);
  FColumn.Changed(False);
end;

procedure TColumnFooter.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TColumnFooter.SetText(const Value: string);
begin
  if (cvFooterText in FColumn.FAssignedValues) and (Value = FText) then
    Exit;
  FText := Value;
  include(FColumn.FAssignedValues, cvFooterText);
  FColumn.Changed(False);
end;

{ TColumnCheckbox }

procedure TColumnCheckbox.Assign(Source: TPersistent);
begin
  if Source is TColumnCheckbox then
  begin
    if cvCheckboxActive in TColumnCheckbox(Source).FColumn.FAssignedValues then
      Active := TColumnCheckbox(Source).Active;
    if cvCheckboxColor in TColumnCheckbox(Source).FColumn.FAssignedValues then
      Color := TColumnCheckbox(Source).Color;
    if cvCheckboxType in TColumnCheckbox(Source).FColumn.FAssignedValues then
      CheckType := TColumnCheckbox(Source).CheckType;
    if cvCheckboxValueFalse in TColumnCheckbox(Source).FColumn.FAssignedValues
      then
      ValueFalse := TColumnCheckbox(Source).ValueFalse;
    if cvCheckboxValueTrue in TColumnCheckbox(Source).FColumn.FAssignedValues
      then
      ValueTrue := TColumnCheckbox(Source).ValueTrue;
  end
  else
    inherited Assign(Source);
end;

constructor TColumnCheckbox.Create(Column: TDBGColumn);
begin
  inherited Create;
  FColumn := Column;
end;

function TColumnCheckbox.DefaultActive: boolean;
begin
  Result := False;
end;

function TColumnCheckbox.DefaultValueFalse: variant;
begin
  Result := '0';
end;

function TColumnCheckbox.DefaultValueTrue: variant;
begin
  Result := '1';
end;

destructor TColumnCheckbox.Destroy;
begin
  inherited;

end;

function TColumnCheckbox.GetActive: boolean;
begin
  if cvCheckboxActive in FColumn.FAssignedValues then
    Result := FActive
  else
    Result := DefaultActive;
end;

function TColumnCheckbox.GetColor: TColor;
begin
  if cvCheckboxColor in FColumn.FAssignedValues then
    Result := FColor
  else
    Result := DefaultColor;
end;

function TColumnCheckbox.GetCheckType: TCheckType;
begin
  if cvCheckboxType in FColumn.FAssignedValues then
    Result := FCheckType
  else
    Result := DefaultCheckType;
end;

function TColumnCheckbox.GetValueFalse: variant;
begin
  if cvCheckboxValueFalse in FColumn.FAssignedValues then
    Result := FValueFalse
  else
    Result := DefaultValueFalse;
end;

function TColumnCheckbox.GetValueTrue: variant;
begin
  if cvCheckboxValueTrue in FColumn.FAssignedValues then
    Result := FValueTrue
  else
    Result := DefaultValueTrue;
end;

function TColumnCheckbox.IsActiveStored: Boolean;
begin
  Result := (cvCheckboxActive in FColumn.FAssignedValues) and (FActive <>
    DefaultActive);
end;

function TColumnCheckbox.IsColorStored: Boolean;
begin
  Result := (cvCheckboxColor in FColumn.FAssignedValues) and (FColor <>
    DefaultColor);
end;

function TColumnCheckbox.IsCheckTypeStored: Boolean;
begin
  Result := (cvCheckboxType in FColumn.FAssignedValues) and (FCheckType <>
    DefaultCheckType);
end;

function TColumnCheckbox.IsValueFalseStored: Boolean;
begin
  Result := (cvCheckboxValueFalse in FColumn.FAssignedValues) and (FValueFalse
    <> DefaultValueFalse);
end;

function TColumnCheckbox.IsValueTrueStored: Boolean;
begin
  Result := (cvCheckboxValueTrue in FColumn.FAssignedValues) and (FValueTrue <>
    DefaultValueTrue);
end;

procedure TColumnCheckbox.RestoreDefaults;
begin
  FColumn.FAssignedValues := FColumn.FAssignedValues - ColumnCheckboxValues;
end;

procedure TColumnCheckbox.SetActive(const Value: boolean);
begin
  if (cvCheckboxActive in FColumn.FAssignedValues) and (Value = FActive) then
    Exit;
  FActive := Value;
  include(FColumn.FAssignedValues, cvCheckboxActive);
  FColumn.Changed(False);
end;

procedure TColumnCheckbox.SetColor(const Value: TColor);
begin
  if (cvCheckboxColor in FColumn.FAssignedValues) and (Value = FColor) then
    Exit;
  FColor := Value;
  include(FColumn.FAssignedValues, cvCheckboxColor);
  FColumn.Changed(False);
end;

procedure TColumnCheckbox.SetCheckType(const Value: TCheckType);
begin
  if (cvCheckboxType in FColumn.FAssignedValues) and (Value = FCheckType) then
    Exit;
  FCheckType := Value;
  include(FColumn.FAssignedValues, cvCheckboxType);
  FColumn.Changed(False);
end;

procedure TColumnCheckbox.SetValueFalse(const Value: variant);
begin
  if (cvCheckboxValueFalse in FColumn.FAssignedValues) and (Value = FValueFalse)
    then
    Exit;
  FValueFalse := Value;
  include(FColumn.FAssignedValues, cvCheckboxValueFalse);
  FColumn.Changed(False);
end;

procedure TColumnCheckbox.SetValueTrue(const Value: variant);
begin
  if (cvCheckboxValueTrue in FColumn.FAssignedValues) and (Value = FValueTrue)
    then
    Exit;
  FValueTrue := Value;
  include(FColumn.FAssignedValues, cvCheckboxValueTrue);
  FColumn.Changed(False);
end;

function TColumnCheckbox.DefaultColor: TColor;
begin
  Result := clBlack;
end;

function TColumnCheckbox.DefaultCheckType: TCheckType;
begin
  Result := ctCheck;
end;

end.

