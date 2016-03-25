(*
  Id: UOSFVisuals.pas by Pieter Valentijn (C) 2011 Delphidreams
  Released under the GNU General Public License
*)
unit UOSFVisuals;

interface

uses  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls,comctrls, Forms, Dialogs,DBGrids, DBCtrls,menus,
   StdCtrls, ExtCtrls,db,  DBAccess , Uni, registry,OSFGeneralRoutines,TcashClasses,ULookupPeriods,Buttons,cxSplitter
   ;

type
// TLookupTypes = (ltStockEntry,ltProjects);
  TViewTypes = (vtDetail,vtCompact);
//const
// TLookupNames : array [ltStockEntry..ltProjects] of string = ('STOCKENTRY','PROJECTS');
type
  TPanelTreeViewItem = class(TCollectionItem)
  private
    FItemName: String;
    FControl: TControl;
    FDataSource: TDataSource;
    FCaptionLabel: TStaticText;
    FOrder: Integer;
    FUsedPanel: Tpanel;
    function ReadHeight: integer;
    function ReadWidth: integer;
    procedure SetControl(const Value: TControl);
    procedure SetItemName(const Value: String);
    procedure WriteHeight(const Value: integer);
    procedure WriteWidth(const Value: integer);
    procedure SetCaptionLabel(const Value: TStaticText);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetOrder(const Value: Integer);
    procedure SetUsedPanel(const Value: Tpanel);
   public
    destructor Destroy; override;

   published
     procedure OnMenuItemClick(Sender: TObject);
     procedure OnDataChange (Sender: TObject; Field: TField);
     property DataSource : TDataSource  read FDataSource write SetDataSource;
     property CaptionLabel : TStaticText  read FCaptionLabel write SetCaptionLabel;
     property UsedPanel : Tpanel  read FUsedPanel write SetUsedPanel;
     property ItemName : String  read FItemName write SetItemName;
     property Control : TControl  read FControl write SetControl;
     property Width : integer read ReadWidth write WriteWidth;
     property Heigth : integer read ReadHeight write WriteHeight;
     property Order : Integer  read FOrder write SetOrder;

  end;
 TPanelTreeView = class(TOwnedCollection)
  private
     mouseisDown : Boolean ;
     LastCord : Tpoint;
    function GetPanelTreeViewItem(index: Integer): TPanelTreeViewItem;
    procedure SetPanelTreeViewItem(index: Integer;
      const Value: TPanelTreeViewItem);


    procedure pcDetailsListExpClick(Sender: TObject);
    procedure OnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OnMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure OnMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
     public
       MoreRows : Integer ;

       property  PanelTreeViewItem [index : Integer] : TPanelTreeViewItem  read GetPanelTreeViewItem write SetPanelTreeViewItem ;default;
       procedure Construct(AScrollbox : TScrollBox) ;
       procedure Reorder ;
       procedure ClearItems ;
 end;

  TEditCollectionItem = class(TCollectionItem)
     protected
     //  procedure AssignTo(Dest: TPersistent); override;

     public
       Wosf_edit_fields_id : integer ;
       SColumnOrigen : String ;
       WColumnTranslation : integer ;
       WControlX : integer ;
       WControly : integer ;
       WControlWidth : integer ;
       WControlHeigth : integer ;
       SControlType : String ;
       WLength : integer ;
       LLOOKUPSQL : String ;
       Component : TComponent ;
       ExtComponent : TComponent ;
       Button : TComponent ;
       TextLabel : TComponent ;

    SDEFAULTVALUE : String ;
    BACTIVE : Boolean ;
    Delete : Boolean ;
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetValue : Variant ;
    procedure SetValue(Value : Variant );
    function GetDisplayValue : String;
    procedure clear ;
  end;

TEditCollection = class(TCollection)
  private
    function  GetEditCollectionItem(index: Integer): TEditCollectionItem;
      procedure SetEditCollectionItem(index: Integer;  const Value: TEditCollectionItem);
      procedure osfSearchClick(Sender: TObject);
      procedure LookupKeyPress(Sender: TObject; var Key: Char);
      procedure onDropdown(sender : TObject);
      procedure CheckBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   public
      AWincontrol : TWincontrol ;
      procedure BuildGui(OnWinControl : TWinControl;EditForm : Boolean;SUBKEY:String) ;
      property  EditCollectionItem [index : Integer] : TEditCollectionItem  read GetEditCollectionItem write SetEditCollectionItem; default ;
      procedure OnEditControlKeyPress(Sender: TObject; var Key: Char) ;
      procedure OnMemoDblClick(sender : Tobject);
      procedure ClearData ;
      procedure CleanupControls ;
  end;

       type
   THackDBNavigator = class(TDBNavigator);






   TEditFormCollectionItem = class(TCollectionItem)
  private
    procedure DBNavigatorInsertClick(Sender: TObject);

     protected
     //  procedure AssignTo(Dest: TPersistent); override;

     public
       WOSF_EDIT_FORM_ID   : integer ;
       SFORMNAME           : String ;
       SFORMDISPLAYNAME    : String ;
       SMASTERTABLE       : String ;
       STABLE            : String ;
       SPRIMARYKEY      : String ;             
       SSUBKEY         : String ;
       SNEXTIDSQL     : String ;
       BMULTILINE     : Boolean ;
       Delete : Boolean ;
       EditCollection : TEditCollection ;
       TabSheet : TTabSheet ;
       Scrollbox : TScrollBox ;
       AQuery : TuniQuery ;
       AGrid : TDBGrid ;
       APanel : Tpanel ;
       ANAv : THackDBNavigator ;
       BInImport : Boolean ;
       AupdateQuery : TUniUpdateSql ;
    procedure DataSetToGui ;
    procedure GuiToDataSet ;
    procedure AfterInsert(DataSet: TDataSet);
    procedure DoubleClickGrid(Sender : Tobject);
    procedure OnColumnClick(Column: TColumn);
    procedure OnGridKeyDown(Sender: TObject; var Key: Char);
    procedure ControlKeyDown(Sender: TObject; var Key: Char);

    procedure BCancel(Sender : Tobject);
    procedure Bok(Sender : Tobject);
    procedure BokNew(Sender : Tobject);
    procedure GetStockDatasetDesc(Sender: TField;  var Text: String; DisplayText: Boolean);
    procedure GetMemoDatasetDesc(Sender: TField;  var Text: String; DisplayText: Boolean);

    procedure   GetAccountDatasetDesc(Sender: TField;  var Text: String; DisplayText: Boolean);
    procedure   GetLookupDatasetDesc(Sender: TField;  var Text: String; DisplayText: Boolean);
    procedure   GetLookupGENDatasetDesc(Sender: TField;  var Text: String; DisplayText: Boolean);
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    // editor routines
    procedure SaveToDatabase(Aformname : String) ;
    procedure ExportDatatoStream(AStream : Tstream; AProgress : TosFProgressEvent );
    procedure ImportDataFromLine(ALine : String;Matchtype : Integer );
    function  GetItemOnFieldName(AFieldname : String ) : TEditCollectionItem ;
    procedure CheckCreateTableAndFields ;
    procedure CheckAltID(var Aid : integer;AltKeylist : TStringlist);
  end;

  TEditFormCollection = class(TOwnedCollection)
  private
    function GetEditFormCollectionItem(index: Integer): TEditFormCollectionItem;
    procedure SetEditFormCollectionItem(index: Integer;
      const Value: TEditFormCollectionItem);

      public
        AltKeyList : TStringlist ;


        property EditFormCollection [index : Integer] : TEditFormCollectionItem  read GetEditFormCollectionItem write SetEditFormCollectionItem; default ;
        procedure Load(Aid : Integer = -1) ;
        procedure Copy(Aid : Integer);
        procedure Save(Aid : Integer ) ;
        procedure Delete(Aid : Integer ) ;
        procedure DeleteForCopy(Aid: Integer);
        procedure Cancel ;
        procedure CheckCreateTableAndFields ;
    destructor Destroy; override;
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);
   end;


  TEditPanel = class (TPanel)
  private
    FEditType : String ;
    FEditor: Boolean;
    procedure SetEditor(const Value: Boolean);
    procedure Ondropdownchange(Sender: Tobject);
  public
    EditForm : Boolean ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    EditFormCollection : TEditFormCollection ;
    APageControl : TPageControl ;
    AScrollBox : TScrollBox ;
    ATopBar : TPanel ;
    aPanelTreeView : TPanelTreeView ;
    procedure SetEditType(AEditType : String;LimitTo : String;JustLoad : Boolean = False) ;
    procedure BuildGui ;


    procedure CleanupControls ;
    procedure UpdateFromActiveControl(AControl: TControl);
    property Editor : Boolean  read FEditor write SetEditor;
    property EditType : String read FEditType ;
    procedure ExportData(AFilename : String; AProgress : TosFProgressEvent );
    procedure ImportData(AFilename : String ;AProgress : TosFProgressEvent );
  end;


  TSearchCollectionItem = class(TCollectionItem)
  private
    FDelete: Boolean;
    FWLength: integer;
    FWControlWidth: integer;
    FWControlHeigth: integer;
    FWosf_search_fields_id: integer;
    FWColumnTranslation: integer;
    FWControly: integer;
    FWControlX: integer;
    FSUseStringLike: String;
    FSColumnOrigen: String;
    FLLOOKUPSQL: String;
    FSControlType: String;
    FTypeDropdown: TComboBox;
    FButton: TComponent;
    FComponent: TComponent;
    FTextLabel: TComponent;
    function GetTrueValue: String;
    procedure SetButton(const Value: TComponent);
    procedure SetComponent(const Value: TComponent);
    procedure SetDelete(const Value: Boolean);
    procedure SetLLOOKUPSQL(const Value: String);
    procedure SetSColumnOrigen(const Value: String);
    procedure SetSControlType(const Value: String);
    procedure SetSUseStringLike(const Value: String);
    procedure SetTextLabel(const Value: TComponent);
    procedure SetTypeDropdown(const Value: TComboBox);
    procedure SetWColumnTranslation(const Value: integer);
    procedure SetWControlHeigth(const Value: integer);
    procedure SetWControlWidth(const Value: integer);
    procedure SetWControlX(const Value: integer);
    procedure SetWControly(const Value: integer);
    procedure SetWLength(const Value: integer);
    procedure SetWosf_search_fields_id(const Value: integer);

     protected
      procedure AssignTo(Dest: TPersistent); override;

     public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    function GetValue : String ;
    procedure clear ;
    published
       property Wosf_search_fields_id : integer  read FWosf_search_fields_id write SetWosf_search_fields_id;
       property SColumnOrigen : String  read FSColumnOrigen write SetSColumnOrigen;
       property WColumnTranslation : integer  read FWColumnTranslation write SetWColumnTranslation;
       property WControlX : integer  read FWControlX write SetWControlX;
       property WControly : integer  read FWControly write SetWControly;
       property WControlWidth : integer  read FWControlWidth write SetWControlWidth;
       property WControlHeigth : integer  read FWControlHeigth write SetWControlHeigth;
       property SControlType : String  read FSControlType write SetSControlType;
       property WLength : integer  read FWLength write SetWLength;
       property LLOOKUPSQL : String  read FLLOOKUPSQL write SetLLOOKUPSQL;
       property SUseStringLike : String  read FSUseStringLike write SetSUseStringLike;
       property Component : TComponent  read FComponent write SetComponent;
       property TypeDropdown : TComboBox  read FTypeDropdown write SetTypeDropdown;
       property Button : TComponent  read FButton write SetButton;
       property TextLabel : TComponent  read FTextLabel write SetTextLabel;
       property Delete : Boolean  read FDelete write SetDelete;

  end;
  TSearchCollection = class(TOwnedCollection)
  private
    function GetSearchCollectionItem(index: Integer): TSearchCollectionItem;
    procedure SetSearchCollectionItem(index: Integer;
      const Value: TSearchCollectionItem);
      public
        property SearchCollectionItem [index : Integer] : TSearchCollectionItem  read GetSearchCollectionItem write SetSearchCollectionItem; default ;
  end;
  TSearchPanel = class (TPanel)
  private

    FaSearchCollection: TSearchCollection;
    FonSearch: TNotifyEvent;
    FDefSql: String;
    FViewType: TViewTypes;
    FEditor: Boolean;
    procedure SetaSearchCollection(const Value: TSearchCollection);
    procedure SetonSearch(const Value: TNotifyEvent);
    procedure SetDefSql(const Value: String);
    procedure SetViewType(const Value: TViewTypes);
    procedure cbCompactChange(Sender: TObject);
    procedure cbChangeTypeClick(Sender: TObject);
    procedure SetEditor(const Value: Boolean);


    public
      AComboBox : TCombobox ;
      Rightpanel   : TPanel ;
      FLookup : String ;
      SearchArea   : TScrollBox ;
      SearchButton : TBitBtn ;
      ClearButton  : TBitBtn ;
      ChangeTypeButton : TBitBtn ;

      aPopupmenu : Tpopupmenu ;
      LastFocused : TWinControl ;
      Procedure SetLastFocus ;
      procedure   OnEditControlKeyPress(Sender: TObject; var Key: Char) ;
      function    GetClause : String ;
      function Values: String;
      procedure   SaveCollection ;
      procedure   BuildGui ;
      procedure   rebuild ;
      procedure   ClearComponents;
      procedure    ClearOtherComponents ;
      procedure   ClearClick (Sender : TObject) ;
      procedure   osfSearchClick (Sender : TObject) ;
      procedure   SearchClick (Sender : TObject) ;
      procedure OnMenuitemClick(sender : Tobject);
     
      procedure CheckBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
       property onSearch : TNotifyEvent  read FonSearch write SetonSearch;
       // property DefSql : String  read FDefSql write SetDefSql;
       property ViewType : TViewTypes  read FViewType write SetViewType;
       // Editor finctions
       procedure UpdateFromActiveControl(AControl : TControl);
       procedure SaveEditedToDatabase ;
       property  Editor : Boolean  read FEditor write SetEditor;

      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

    published
       property DefSql : String  read FDefSql write SetDefSql;
       procedure SetLookupType(ALookup : String) ;
       function  LookupExists(Alookup : String ) : boolean;
       function  GetItemOnFieldOrignName(AFieldname : String ) : TSearchCollectionItem ;
       property  aSearchCollection : TSearchCollection  read FaSearchCollection write SetaSearchCollection;
       procedure LoadFromFile(AFile: String );
       Procedure SaveToFile(AFile :String );
  end;

  procedure ChangeDBNavigatorIcons(ADBNavigator : TDBNavigator);
  function BlobFieldToString(ABlobField : TBlobField):String ;
implementation

uses UDMTCCoreLink,CheckLst,osfLookup,
  TypInfo, UGenSearch, DateUtils, Types, Math;

function BlobFieldToString(ABlobField : TBlobField):String ;
var
 astream :TStringStream ;
begin
 astream :=TStringStream.Create ;
 try
  ABlobField.SaveToStream(astream);
  Result := astream.DataString ;
 finally
   astream.Free ;
 end;


end;
procedure ChangeDBNavigatorIcons(ADBNavigator : TDBNavigator);
var
 ABitmap : TBitmap ;
 AFile : String ;
 Procedure SetGlyph (TheBitmap : TBitmap) ;
 begin
     TheBitmap.Width := 16 ;
     TheBitmap.Height := 32;
     TheBitmap.Assign(ABitmap);
    {TheBitmap.Canvas.StretchDraw(
     Rect(0,0,15,15)
     ,
     ABitmap);}
 end;
begin
  // nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit,
  // nbPost, nbCancel, nbRefresh


//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsRetry.bmp' ;

 // If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
     DMTCCoreLink.LoadImage(ABitmap,'nbsRetry',24);
     if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbRefresh].Glyph);
     finally
       ABitmap.free ;
     end;
    end;


//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbscancel.bmp' ;

 // If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
     DMTCCoreLink.LoadImage(ABitmap,'nbscancel',24);
        if  ABitmap.Width > 0 then
    SetGlyph(  THackDBNavigator(ADBNavigator).buttons[nbCancel].Glyph );
     finally
       ABitmap.free ;
     end;
    end;


 // AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsSave.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
      DMTCCoreLink.LoadImage(ABitmap,'nbsSave',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbPost].Glyph );
     finally
       ABitmap.free ;
     end;
    end;

 // AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsEdit.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsEdit',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbEdit].Glyph );
     finally
       ABitmap.free ;
     end;
    end;

 // AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsDelete.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsDelete',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbDelete].Glyph );
     finally
       ABitmap.free ;
     end;
    end;


//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsinsert.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsinsert',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbInsert].Glyph );
     finally
       ABitmap.free ;
     end;
    end;


 // AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsEnd.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsEnd',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbLast].Glyph );
     finally
       ABitmap.free ;
     end;
    end;


//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsNext.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsNext',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbNext].Glyph );
     finally
       ABitmap.free ;
     end;
    end;
//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsPrevious.bmp' ;

 // If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsPrevious',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbPrior].Glyph );
     finally
       ABitmap.free ;
     end;
    end;

//  AFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Bin\themes\Classic\nbsFirst.bmp' ;

//  If FileExists(AFile) then
    begin
     ABitmap := TBitmap.Create ;
     try
       DMTCCoreLink.LoadImage(ABitmap,'nbsFirst',24);
        if  ABitmap.Width > 0 then
     SetGlyph( THackDBNavigator(ADBNavigator).buttons[nbFirst].Glyph );
     finally
       ABitmap.free ;
     end;
    end;

end;
{ SearchPanel }

procedure TSearchPanel.CheckBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then
    begin
      if TCheckBox(Sender).State = cbUnchecked then
       TCheckBox(Sender).State := cbChecked else
       if (TCheckBox(Sender).State = cbChecked) and TCheckBox(Sender).AllowGrayed then
       TCheckBox(Sender).State := cbGrayed else
       TCheckBox(Sender).State := cbUnchecked ;
       abort ;
    end;
end;


procedure TSearchPanel.ClearClick(Sender: TObject);
var
 i :  integer ;
begin
  for i := 0 to FaSearchCollection.Count -1 do
     begin
        FaSearchCollection[i].clear ;
     end;
end;

procedure TSearchPanel.SaveCollection;
var
 i , x : Integer ;
 Value : String ;
begin

   for i := 0 to aPopupmenu.Items.Count -1 do
   for x := 0 to  aPopupmenu.Items[i].Count -1 do
    begin
     if x = 10 then break ;
     TDatabaseRegistyRoutines.WriteRegValue(fLookup+ 'ViewType_' + IntToStr(aPopupmenu.Items[i].Items[x].tag)+ '_'  ,IntToStr(x),aPopupmenu.Items[i].Items[x].Caption) ;
    end;



   Value := '0';
   if ViewType = vtCompact then
      Value := '1';
 DMTCCoreLink.WriteSysParam(fLookup+ 'ViewType_',Value,DMTCCoreLink.currentuser);

if ViewType = vtCompact then
  begin
   if assigned(AComboBox) then
   begin
   Value := IntToStr(AComboBox.ItemIndex)  ;
   DMTCCoreLink.WriteSysParam(fLookup+ 'Compact_',Value,DMTCCoreLink.currentuser);
   end;
  end;

for i := 0 to FaSearchCollection.Count -1 do
  begin
    if FaSearchCollection[i].SControlType = 'B' then
     begin
       Value := '-1' ;
       if TCheckBox(FaSearchCollection[i].Component).State <> cbGrayed then
        Value := IntToStr(ord(TCheckBox(FaSearchCollection[i].Component).Checked));
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',Value,DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType = 'IC'  then
     begin
       Value := '' ;
       for x := 0 to TCheckListBox(FaSearchCollection[i].Component).Items.Count -1 do
        if TCheckListBox(FaSearchCollection[i].Component).Checked[x] then
         begin
           if Value <> '' then Value := Value + ',' ;
           Value := Value + IntToStr(Integer(TCheckListBox(FaSearchCollection[i].Component).Items.Objects[x]));
         end;
       DMTCCoreLink.WriteLongSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',Value,DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType = 'IL' then
     begin
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',IntToStr(TComboBox(FaSearchCollection[i].Component).itemIndex) ,DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType = 'D' then
     begin
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',FormatDatetime('yyyymmdd',TDateTimePicker(FaSearchCollection[i].Component).date) ,DMTCCoreLink.currentuser);
       if FaSearchCollection[i].FSUseStringLike <> 'B' then
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_D',IntToStr(FaSearchCollection[i].TypeDropdown.ItemIndex),DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType = 'DX' then
     begin
       DMTCCoreLink.WriteLongSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',TFrameLookupPeriods(FaSearchCollection[i].Component).GetPropString ,DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType = 'S' then
     begin
       DMTCCoreLink.WriteLongSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',TEdit(FaSearchCollection[i].Component).Text,DMTCCoreLink.currentuser)
     end else
    if (FaSearchCollection[i].SControlType = 'F') or (FaSearchCollection[i].SControlType = 'N')  then
      begin
       if TEdit(FaSearchCollection[i].Component).Text <> '' then
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',StringReplace(TEdit(FaSearchCollection[i].Component).Text,DecimalSeparator,'.',[rfReplaceAll]),DMTCCoreLink.currentuser)
       else
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_','',DMTCCoreLink.currentuser) ;
       if FaSearchCollection[i].FSUseStringLike <> 'B' then
       DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_D',IntToStr(FaSearchCollection[i].TypeDropdown.ItemIndex),DMTCCoreLink.currentuser);
     end else
    if FaSearchCollection[i].SControlType[1] = 'O' then
      begin
       if FaSearchCollection[i].SControlType[2] = 'X' then
         DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id),TEdit(FaSearchCollection[i].Component).Text,DMTCCoreLink.currentuser)
         else
         DMTCCoreLink.WriteSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id),IntToStr(FaSearchCollection[i].Component.tag),DMTCCoreLink.currentuser) ;
      end;
  end;

end;

constructor TSearchPanel.Create(AOwner: TComponent);
begin
  inherited;
  aPopupmenu := Tpopupmenu.create(self) ;
  aPopupmenu.AutoHotkeys := maManual ;

  FaSearchCollection:= TSearchCollection.Create(self,TSearchCollectionItem);
  Rightpanel := TPanel.Create(self) ;
  Rightpanel.Width := 200 ;
  Rightpanel.Align := alLeft ;
  Rightpanel.Parent := self ;

  Rightpanel.PopupMenu := aPopupMenu ;

  Rightpanel.ParentColor := true ;
  // Rightpanel.DoubleBuffered := True ;

  SearchArea := TScrollBox.Create(self) ;
  SearchArea.Parent := self ;
  SearchArea.Align := alClient ;
  SearchArea.ParentColor := true ;
  // SearchArea.DoubleBuffered := True ;



  ChangeTypeButton := TBitBtn.Create(self) ;
  ChangeTypeButton.Caption := DMTCCoreLink.GetTextLang(1079);
  ChangeTypeButton.Parent := Rightpanel ;
  DMTCCoreLink.LoadImage(ChangeTypeButton.Glyph,'sType')  ;
  ChangeTypeButton.Top := 62 ;
  ChangeTypeButton.Left := 10 ;
  ChangeTypeButton.Width := 180 ;
  ChangeTypeButton.OnClick := cbChangeTypeClick ;
  ChangeTypeButton.Margin := 50 ;

  SearchButton := TBitBtn.Create(self) ;
  SearchButton.Caption := DMTCCoreLink.GetTextLang(952);
  DMTCCoreLink.LoadImage(SearchButton.Glyph,'sSearch')  ;
  SearchButton.Parent := Rightpanel ;
  SearchButton.Top := 2 ;
  SearchButton.Left := 10 ;
  SearchButton.Width := 180 ;
  SearchButton.OnClick := SearchClick ;
  SearchButton.Margin := 50 ;

  ClearButton := TBitBtn.Create(self) ;
  ClearButton.Caption := DMTCCoreLink.GetTextLang(1016);
  ClearButton.Parent := Rightpanel ;
  DMTCCoreLink.LoadImage(ClearButton.Glyph,'sClear')  ;
  ClearButton.Top := 32 ;
  ClearButton.Left := 10 ;
  ClearButton.Width := 180 ;
  ClearButton.OnClick := ClearClick;
  ClearButton.Margin := 50 ;
end;

destructor TSearchPanel.Destroy;
begin
  FaSearchCollection.free ;
  inherited;
end;

function TSearchPanel.Values: String;
var
 i :  integer ;
begin
  result := '' ;
  for i := 0 to FaSearchCollection.Count -1 do
     begin

          if result <> '' then
             Result := Result + #13+#10 ;
             result :=   Result + FaSearchCollection[i].SColumnOrigen +'='+  FaSearchCollection[i].GetTrueValue   ;
     end;
end;

function TSearchPanel.GetClause: String;
var
 i :  integer ;
begin
  result := '' ;
  for i := 0 to FaSearchCollection.Count -1 do
     begin
        if FaSearchCollection[i].GetValue <> '' then
         begin
          if result = '' then
             result :=  FaSearchCollection[i].GetValue else
             Result := Result + ' and ' + FaSearchCollection[i].GetValue ;
         end;
     end;
end;

procedure TSearchPanel.OnEditControlKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
   begin
     if (sender is Twincontrol) then
        LastFocused := (sender as Twincontrol) ;
     key := #0 ;
     SearchButton.Click ;
   end;
end;

procedure TSearchPanel.SearchClick(Sender: TObject);
var
 ApopupMenuitem,ApopupMenuitemValue : TMenuItem ;
 i ,x:  integer ;
 Lookstring : String ;
 found : Boolean ;
begin
 screen.Cursor := crHourGlass ;
 try

   for i := 0 to FaSearchCollection.Count -1 do
     begin
      if (FaSearchCollection[i].Component is TCustomEdit) and not assigned(FaSearchCollection[i].Button) then
        if (FaSearchCollection[i].Component as TCustomEdit).Text <> '' then
         begin
          if aPopupmenu.FindComponent('MI_'+ IntToStr(i)) <> nil then
             ApopupMenuitem := TMenuItem(aPopupmenu.FindComponent('MI_'+ IntToStr(i)))
             else
             begin
             ApopupMenuitem := TMenuItem.Create(aPopupmenu);
             ApopupMenuitem.Name :=  'MI_'+ IntToStr(i) ;
             ApopupMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(FaSearchCollection[i].WColumnTranslation) ;
             aPopupmenu.Items.Add(ApopupMenuitem);
             end;
             Lookstring := (FaSearchCollection[i].Component as TCustomEdit).Text ;
             found := False ;
             for x := 0 to ApopupMenuitem.Count -1 do
               if ApopupMenuitem.Items[x].Caption = Lookstring then
                found := True ;

             if not found then
               begin
                ApopupMenuitemValue := TMenuItem.create(ApopupMenuitem) ;
                ApopupMenuitemValue.Caption := Lookstring ;
                ApopupMenuitemValue.OnClick := OnMenuitemClick;
                ApopupMenuitemValue.Tag := i ;
                ApopupMenuitem.Insert(0,ApopupMenuitemValue);


               end;
         end;
     end;




 if Assigned(FonSearch) then
    FonSearch(self);
   finally
      screen.Cursor := crDefault ;
   end;
end;

procedure TSearchPanel.SetaSearchCollection(
  const Value: TSearchCollection);
begin
  FaSearchCollection := Value;
end;

procedure TSearchPanel.SetLookupType(ALookup: String);
Var
 AQuery : TuniQuery ;
begin
 DMTCCoreLink.ReinitCustomLang ;
 FLookup := ALookup  ;
 FaSearchCollection.Clear ;
 if trim(fLookup) = '' then exit ;
 DefSql := '' ;
 AQuery := TuniQuery.Create(nil) ;
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := 'select * from OSF_SEARCH_FIELDS where SFORMNAME = ' + QuotedStr(fLookup) ;
   AQuery.open ;
   while not AQuery.eof do
       begin
         if AQuery.FieldByName('SColumnOrigen').AsString = 'SQL' then
          begin
             DefSql :=  AQuery.FieldByName('LLOOKUPSQL').AsString
          end else
          begin
           FaSearchCollection.Add ;
           FaSearchCollection[FaSearchCollection.Count-1].Wosf_search_fields_id := AQuery.FieldByName('Wosf_search_fields_id').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SColumnOrigen := AQuery.FieldByName('SColumnOrigen').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].WColumnTranslation := AQuery.FieldByName('WColumnTranslation').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlX := AQuery.FieldByName('WControlX').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControly := AQuery.FieldByName('WControly').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlWidth := AQuery.FieldByName('WControlWidth').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlHeigth := AQuery.FieldByName('WControlHeigth').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SControlType := AQuery.FieldByName('SControlType').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].WLength := AQuery.FieldByName('WLength').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SUseStringLike := AQuery.FieldByName('SUseStringLike').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].LLOOKUPSQL := AQuery.FieldByName('LLOOKUPSQL').AsString ;
          end;
          AQuery.next ;
       end;
  finally
   AQuery.free ;
  end;
 BuildGui ;
end;

{ TSearchCollection }

function TSearchCollection.GetSearchCollectionItem(
  index: Integer): TSearchCollectionItem;
begin
  Result := TSearchCollectionItem(Items[index]);
end;

procedure TSearchCollection.SetSearchCollectionItem(index: Integer;
  const Value: TSearchCollectionItem);
begin
  Items[index].Assign(Value);
end;

{ TSearchCollectionItem }

procedure TSearchCollectionItem.AssignTo(Dest: TPersistent);
begin
  if dest is TSearchCollectionItem then
  begin
     (dest as TSearchCollectionItem).SColumnOrigen := SColumnOrigen ;
     (dest as TSearchCollectionItem).WColumnTranslation := WColumnTranslation ;
     (dest as TSearchCollectionItem).WControlX := WControlX ;
     (dest as TSearchCollectionItem).WControly := WControly ;
     (dest as TSearchCollectionItem).WControlWidth := WControlWidth ;
     (dest as TSearchCollectionItem).WControlHeigth := WControlHeigth ;
     (dest as TSearchCollectionItem).SControlType := SControlType ;
     (dest as TSearchCollectionItem).WLength := WLength ;
     (dest as TSearchCollectionItem).SUseStringLike := SUseStringLike ;
     (dest as TSearchCollectionItem).LLOOKUPSQL := LLOOKUPSQL ;
  end else
  inherited;


end;

procedure TSearchCollectionItem.clear;
var
 i :  integer ;
begin
  if SControlType = 'S' then
   begin
    if LLOOKUPSQL <> '' then
    begin
     if SColumnOrigen <> '#' then
      begin
       TEdit(Component).Text := LLOOKUPSQL ;
      end else
     TEdit(Component).Text := '' ;
    end else
    TEdit(Component).Text := '' ;
   end else
  if SControlType = 'B' then
   begin
     if LLOOKUPSQL <> '' then
      begin
      if LLOOKUPSQL ='0' then
      TCheckBox(Component).State := cbUnchecked else
        TCheckBox(Component).State := cbChecked
      end else
     TCheckBox(Component).State := cbGrayed
   end else
  if SControlType = 'D' then
   begin

     TDateTimePicker(Component).Date := date ;
     if Assigned(TypeDropdown) then
        TypeDropdown.ItemIndex := 0 ;
   end else
  if (SControlType = 'F') or (SControlType = 'N')  then
   begin
     if LLOOKUPSQL <> '' then
      begin
       if Assigned(TypeDropdown) then
       TypeDropdown.ItemIndex := 1 ;
       TEdit(Component).Text := LLOOKUPSQL ;
      end else
      begin
       TEdit(Component).Text := '' ;
       if Assigned(TypeDropdown) then
       TypeDropdown.ItemIndex := 0 ;
      end;
   end else
  if SControlType = 'IL' then
   begin
    TComboBox(Component).ItemIndex := 0 ;
   end else
  if SControlType = 'SL' then
   begin
    TComboBox(Component).ItemIndex := 0 ;
   end else
  if SControlType = 'IC' then
   begin
    for i := 0 to TCheckListBox(Component).Items.count -1 do
     TCheckListBox(Component).Checked[i] := false;
   end else
  if SControlType[1] = 'O' then
   begin
     TEdit(Component).Tag := 0 ;
     TEdit(Component).Text := '' ;
   end;

end;

constructor TSearchCollectionItem.Create(Collection: TCollection);
begin
  inherited;
   Component := nil ;
   Button := nil ;
   TypeDropdown := nil ;
end;

destructor TSearchCollectionItem.Destroy;
begin
  if Component <> nil then
     Component.Free ;
  if TypeDropdown <> nil then
     TypeDropdown.Free ;
  if Button <> nil then
     Button.Free ;
  inherited;
end;

procedure TSearchPanel.SetonSearch(const Value: TNotifyEvent);
begin
  FonSearch := Value;
end;


function TSearchCollectionItem.GetTrueValue: String;
Var
 I :  Integer ;
begin
  result := '' ;
  if not Assigned(Component) then exit ;
if SControlType = 'S' then
    begin
      if TEdit(Component).Text <> '' then
        begin
         if SUseStringLike ='B' then
           result := ' and '+ 'upper(' + SColumnOrigen + ') like ' + QuotedStr('%'+TEdit(Component).Text+'%')
           else
           result := ' and '+'upper(' + SColumnOrigen + ') like ' + QuotedStr( TEdit(Component).Text+'%') ;
        end;
      result := result + #13+#10 +   SColumnOrigen +'tx=' + TEdit(Component).Text ;
    end else
if SControlType = 'IL' then
    begin
      if TComboBox(Component).ItemIndex > -1 then
        begin
           result := IntToStr(Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex])) ;
           result := result + #13+#10 +   SColumnOrigen +'tx=' + TComboBox(Component).Items[TComboBox(Component).ItemIndex] ;
            result := result + #13+#10 +   SColumnOrigen +'tx2=' + IntToStr(Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex])) ;
        end;

    end else
    if SControlType = 'DX' then
    begin
      result := 'cast(' + SColumnOrigen + ' as date) between ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetStartDate) + ' and ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetEndDate) ) );

      result := result + #13+#10 +   SColumnOrigen +'from=' + FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetStartDate) ;
      result := result + #13+#10 +   SColumnOrigen +'to=' + FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetEndDate) ;
      result := result + #13+#10 +   SColumnOrigen +'fromfl=' + IntToStr(Trunc( TFrameLookupPeriods(Component).GetStartDate)) ;
      result := result + #13+#10 +   SColumnOrigen +'tofl=' + IntToStr(Trunc(TFrameLookupPeriods(Component).GetEndDate)) ;
    end else
if SControlType = 'D' then
    begin
      if TDateTimePicker(Component).Date <> 0 then
        begin
         if FSUseStringLike = 'B' then
            begin
             result := SColumnOrigen +'=' + FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date) ;
             result := result + #13+#10 +   SColumnOrigen +'fl=' + IntToStr(Trunc( TDateTimePicker(Component).Date)) ;
            end else
            begin
              case TypeDropdown.ItemIndex of
               0 : result := '' ;
               1 : result := ' and '+'cast(' + SColumnOrigen + ' as date) = ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
               2 : result := ' and '+'cast(' + SColumnOrigen + ' as date) < ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
               3 : result := ' and '+'cast(' + SColumnOrigen + ' as date) > ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
               4 : result := ' and '+'cast(' + SColumnOrigen + ' as date) <= ' +QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
               5 : result := ' and '+'cast(' + SColumnOrigen + ' as date) >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
              end;
          end;
        end;
      result := result + #13+#10 +   SColumnOrigen +'tx=' + FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date) ;
    end else
if (SControlType = 'F') or (SControlType = 'N') then
    begin
      if (StrTOFloatDef(TEdit(Component).Text,0) <> 0) or (Assigned(TypeDropdown) and (TypeDropdown.ItemIndex <> 0)) then
        begin
       if FSUseStringLike = 'B' then
            begin
             result := SColumnOrigen +'=' +  FloatToStr(StrTOFloatDef(TEdit(Component).Text,0))  ;
             result := result + #13+#10 +   SColumnOrigen +'fl=' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]) ;
            end else
            begin
              case TypeDropdown.ItemIndex of
               0 : result := ' and '+SColumnOrigen + ' = ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
               1 : result := ' and '+SColumnOrigen + ' < ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
               2 : result := ' and '+SColumnOrigen + ' > ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
               3 : result := ' and '+SColumnOrigen + ' <= ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
               4 : result := ' and '+SColumnOrigen + ' >= ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
              end;
          end;
        end;
      result := result + #13+#10 +   SColumnOrigen +'tx=' + TEdit(Component).Text ;

    end else
if SControlType = 'B' then
    begin
      if TCheckBox(Component).State <> cbGrayed then
        begin
         result := IntToStr(ord(TCheckBox(Component).Checked));
        end;
      result := result + #13+#10 +   SColumnOrigen +'tx=' + BoolToStr(TCheckBox(Component).Checked,True) ;
    end else
if SControlType[1] = 'O' then
    begin
      if SControlType[2] = 'X' then
        begin
         if TEdit(Component).Text <> '' then
            result := SColumnOrigen + ' in (' + TEdit(Component).Text + ') ';
        end else
      if TEdit(Component).Tag <> 0 then
        begin
        result := IntToStr(TEdit(Component).Tag);
         if copy(SControlType,2,1) = 'S' then
            result := result + #13+#10 +   SColumnOrigen +'code=' + TDataBaseStockRoutines.GetStockCode(TEdit(Component).Tag)

           else
             result := result + #13+#10 +   SColumnOrigen +'acc=' + TDataBaseRoutines.GetAccountCode(TEdit(Component).Tag) ;
        end;
       result := result + #13+#10 +   SColumnOrigen +'tx=' + TEdit(Component).Text ;
    end else
if SControlType = 'IC' then
    begin
      result := '' ;
      for i := 0 to TCheckListBox(Component).Items.Count -1 do
        if TCheckListBox(Component).Checked[i] then
          begin
           if result <> '' then
             result := result + ',' ;

           if copy(Trim(FLLOOKUPSQL),1,5) ='GROUP' then
              begin
               result := result +  TDataBaseRoutines.GetChildIDsFromGroupID(Integer(TCheckListBox(Component).Items.Objects[i]),0);
              end else
              result := result + IntToStr(Integer(TCheckListBox(Component).Items.Objects[i]));
          end;
        if result <> '' then
         result := ' and '+ SColumnOrigen + ' in(' + result + ')' ;
    end;
end;


function TSearchCollectionItem.GetValue: String;
Var
 I :  Integer ;
 TempResult : String ;
begin
  result := '' ;
  if not Assigned(Component) then exit ;
if SControlType = 'S' then
    begin
      if TEdit(Component).Text <> '' then
        begin
      if copy(SColumnOrigen,1,1) = '#' then
            begin
             result :=  FLLOOKUPSQL ;
             if result <> '' then
                result :=  TDatabaseTableRoutines.ReplaceParams(result,'ID='+  TEdit(Component).Text )
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

          end else

          if copy(SColumnOrigen,1,1) = '@' then
            begin
             result := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(SColumnOrigen,2,200)) ;
             if result <> '' then
                result :=  TDatabaseTableRoutines.ReplaceParams(result,'ID='+  TEdit(Component).Text )
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

          end else
          begin

         if SUseStringLike ='B' then
           result := 'upper(' + SColumnOrigen + ') like ' + QuotedStr('%'+TEdit(Component).Text+'%')
           else
           result := 'upper(' + SColumnOrigen + ') like ' + QuotedStr( TEdit(Component).Text+'%') ;
         end;
        end;
    end else
if SControlType = 'IL' then
    begin
      if TComboBox(Component).ItemIndex > 0 then
        begin
           if copy(SColumnOrigen,1,1) = '@' then
            begin
             result := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(SColumnOrigen,2,200)) ;
             if result <> '' then
                result :=  TDatabaseTableRoutines.ReplaceParams(result,'ID='+ IntToStr(Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex])))
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

           end else
             result := SColumnOrigen + ' = ' +  IntToStr(Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex])) ;

        end;
    end else
if SControlType = 'SL' then
    begin
      if TComboBox(Component).ItemIndex > 0 then
        begin
           if copy(SColumnOrigen,1,1) = '@' then
            begin
             result := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(SColumnOrigen,2,200)) ;
             if result <> '' then
                result :=  TDatabaseTableRoutines.ReplaceParams(result,'ID='+ TComboBox(Component).Text)  
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

           end else
             result := SColumnOrigen + ' = ' +  QuotedStr( TComboBox(Component).Text ) ;

        end;
    end else
if SControlType = 'D' then
    begin
      if TDateTimePicker(Component).Date <> 0 then
        begin
         if copy(SColumnOrigen,1,1) = '@' then
            begin
             result := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(SColumnOrigen,2,200)) ;
             if result <> '' then
               begin
                  case TypeDropdown.ItemIndex of
                     0 : result := '' ;
                     1 : result := TDatabaseTableRoutines.ReplaceParams(result,'ID='+ ' = ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date)));
                     2 : result := TDatabaseTableRoutines.ReplaceParams(result,'ID='+ ' < ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date)));
                     3 : result := TDatabaseTableRoutines.ReplaceParams(result,'ID='+ ' > ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date)));
                     4 : result := TDatabaseTableRoutines.ReplaceParams(result,'ID='+ ' <= ' +QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date)));
                     5 : result := TDatabaseTableRoutines.ReplaceParams(result,'ID='+ ' >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date)));
                    end;
                end
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

           end else

         begin


          case TypeDropdown.ItemIndex of
           0 : result := '' ;
           1 : result := 'cast(' + SColumnOrigen + ' as date) = ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
           2 : result := 'cast(' + SColumnOrigen + ' as date) < ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
           3 : result := 'cast(' + SColumnOrigen + ' as date) > ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
           4 : result := 'cast(' + SColumnOrigen + ' as date) <= ' +QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
           5 : result := 'cast(' + SColumnOrigen + ' as date) >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TDateTimePicker(Component).Date));
          end;
         end;
        end;
    end else
    if SControlType = 'DX' then
    begin
      result := 'cast(' + SColumnOrigen + ' as date) between ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetStartDate) + ' and ' + QuotedStr(FormatDateTime('yyyy/mm/dd',TFrameLookupPeriods(Component).GetEndDate) ) );
    end else
if (SControlType = 'F') or (SControlType = 'N') then
    begin
      if (StrTOFloatDef(TEdit(Component).Text,0) <> 0) or (TypeDropdown.ItemIndex <> 0) then
        begin
          case TypeDropdown.ItemIndex of
           0 : result := SColumnOrigen + ' = ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
           1 : result := SColumnOrigen + ' < ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
           2 : result := SColumnOrigen + ' > ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
           3 : result := SColumnOrigen + ' <= ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
           4 : result := SColumnOrigen + ' >= ' + StringReplace(FloatToStr(StrTOFloatDef(TEdit(Component).Text,0)),DecimalSeparator,'.',[]);
          end;
        end;
    end else
if SControlType = 'B' then
    begin
      if TCheckBox(Component).State <> cbGrayed then
        begin
          if copy(LLOOKUPSQL,1,1) = '@' then
           begin
             result := copy(LLOOKUPSQL,2,1000) ;
             if result = '' then
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;
             if TCheckBox(Component).State <> cbChecked then
                result := Format(result,['NOT'])  else
                result := Format(result,['']) ;

          end else
         result := SColumnOrigen + ' = ' + IntToStr(ord(TCheckBox(Component).Checked));
        end;
    end else
if SControlType[1] = 'O' then
    begin
      if SControlType[2] = 'X' then
        begin
         if TEdit(Component).Text <> '' then
            result := SColumnOrigen + ' in (' + TEdit(Component).Text + ') ';
        end else
      if TEdit(Component).Tag <> 0 then
        begin
         result := SColumnOrigen + ' = ' + IntToStr(TEdit(Component).Tag);
        end;
    end else
if SControlType = 'IC' then
    begin
      result := '' ;
      for i := 0 to TCheckListBox(Component).Items.Count -1 do
        if TCheckListBox(Component).Checked[i] then
          begin
           if result <> '' then
             result := result + ',' ;
            result := result + IntToStr(Integer(TCheckListBox(Component).Items.Objects[i]));
          end;
        if result <> '' then
          begin
           if copy(SColumnOrigen,1,1) = '@' then
            begin
             TempResult := DMTCCoreLink.SQLList.GetFormatedSQLByName(copy(SColumnOrigen,2,200)) ;
             if TempResult <> '' then
                result :=  TDatabaseTableRoutines.ReplaceParams(TempResult,'ID='+ IntToStr(Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex])))
             else
               result := 'SQL not found' + copy(SColumnOrigen,2,200) ;

           end else

           result := SColumnOrigen + ' in(' + result + ')' ;
         end;
    end;
end;

procedure TSearchPanel.osfSearchClick(Sender: TObject);
var
 aosfLookup : TosfLookup ;
 GenSearch: TGenSearch;
 AnewText : String ;
begin
 aosfLookup := TosfLookup.Create(Application) ;
  try
  aosfLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
  aosfLookup.SavePrefix := 'OSFSEARCH' ;
  aosfLookup.aOSAConnectionItem :=  DMTCCoreLink.TheOSAConnectionItem ;
  case ((copy(TSearchCollectionItem(TComponent(Sender).tag).SControlType,2,1) + ' ')[1]) of
    'C' : aosfLookup.SelectLookup(self, DMTCCoreLink.GetTextLangNoAmp(30),tcstCRED,tcltAccount,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'D' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(31),tcstDEB,tcltAccount,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'G' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(34),tcstGLONE,tcltAccount,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'T' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(609),tcstTAX,tcltAccount  ,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'B' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(29),tcstBANK,tcltAccount,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'S' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(37),tcstALL,tcltStock,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'A' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(34),tcstALL,tcltAccount,0,0,TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
    'X' : begin
            GenSearch:= TGenSearch.create(self);
            try
             GenSearch.Init(TSearchCollectionItem(TComponent(Sender).tag).LLOOKUPSQL);
             GenSearch.ShowModal ;
             TEdit(TSearchCollectionItem(TComponent(Sender).tag).Component).Text := GenSearch.GetClause ;
            finally
             GenSearch.free ;
            end;
             exit ;
          end;
 end;

  if (TSearchCollectionItem(TComponent(Sender).tag).SControlType[2] in ['D','C','G','T','B','A']) then
   begin
   AnewText := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(aosfLookup.ReturnID) +' ' + TDataBaseRoutines.GetAccountDescription(aosfLookup.ReturnID)  ;
   end else
   AnewText := aosfLookup.ReturnLookup ;

   TEdit(TSearchCollectionItem(TComponent(Sender).tag).Component).SetTextBuf(pchar(AnewText));
  TEdit(TSearchCollectionItem(TComponent(Sender).tag).Component).Tag := aosfLookup.ReturnID ;

 finally
   aosfLookup.free ;
 end;
end;

procedure TSearchPanel.BuildGui;
Var
 AQuery : TuniQuery ;
 i , x: Integer ;
 Value : String ;
  ApopupMenuitem,ApopupMenuitemValue : TMenuItem ;

 procedure CreateLabel  ;
 begin
    FaSearchCollection[i].TextLabel := TEdit.Create(self) ;
     with (FaSearchCollection[i].TextLabel as TEdit) do
       begin
          BevelInner := bvNone ;
          BevelOuter := bvNone ;
          BorderStyle := bsNone ;
          Color := clBtnFace ;
          TabStop := false ;
          Height := 14 ;
          Parent := SearchArea ;
          ParentColor := true ;          
          Text := DMTCCoreLink.GetTextLang(FaSearchCollection[i].WColumnTranslation);
          //Caption := DMTCCoreLink.GetTextLang(FaSearchCollection[i].WColumnTranslation);
          Left := FaSearchCollection[i].WControlX ;
          Top  := FaSearchCollection[i].WControlY - 14 ;
          Font.Color := clWindowText ;
          ReadOnly := True ;
          Width := Canvas.TextWidth(Text) + 5 ;
          // FocusControl := TEdit(FaSearchCollection[i].Component) ;
       end;
  end;
begin
 // Build GUI
 // load popup from reg
 if Assigned (aPopupmenu) then
   begin
    aPopupmenu.Items.Clear ;
   for i := 0 to FaSearchCollection.Count -1 do
   begin
    ApopupMenuitem := nil ;


    for x := 0 to 9 do
    begin

    if TDatabaseRegistyRoutines.ReadRegValue(fLookup+ 'ViewType_' + IntToStr(i)+ '_'  ,IntToStr(x)) <> '' then
      begin
        if not Assigned(ApopupMenuitem) then
           begin
             ApopupMenuitem :=TMenuItem.Create(aPopupmenu);
             ApopupMenuitem.Name :=  'MI_'+ IntToStr(i) ;
             ApopupMenuitem.Caption := DMTCCoreLink.GetTextLangNoAmp(FaSearchCollection[i].WColumnTranslation) ;
             aPopupmenu.Items.Add(ApopupMenuitem);
           end;


        ApopupMenuitemValue  := TMenuItem.Create(aPopupmenu);
        ApopupMenuitemValue.Caption := TDatabaseRegistyRoutines.ReadRegValue(fLookup+ 'ViewType_' + IntToStr(i)+ '_' , IntToStr(x)) ;
        ApopupMenuitemValue.Tag := i ;
        ApopupMenuitemValue.OnClick := OnMenuitemClick;
        ApopupMenuitem.Add(ApopupMenuitemValue);

      end;
   end;
  end;
 end;

 LastFocused := nil ;
  if DMTCCoreLink.ReadSysparam(fLookup+ 'ViewType_',0,DMTCCoreLink.currentuser)  = 0 then
     ViewType := vtDetail else
     ViewType := vtCompact ;

     if not Rightpanel.Visible then
        ViewType := vtDetail ;


        if  ViewType = vtcompact then
         begin
           AComboBox := TComboBox.Create(self);
           AComboBox.Parent := SearchArea ;
           AComboBox.Left := 1 ;
           AComboBox.Top := 15;
           AComboBox.Width :=  100 ;
           AComboBox.Height :=  20;
           AComboBox.OnChange := cbCompactChange ;
           // add empty item
           AComboBox.Items.Append(DMTCCoreLink.GetTextLang(20046));
           AComboBox.Style := csDropDownList ;
             with TEdit.Create(AComboBox) do
                   begin
                      BevelInner := bvNone ;
                      BevelOuter := bvNone ;
                      BorderStyle := bsNone ;
                      Color := clBtnFace ;
                      TabStop := false ;
                      Height := 14 ;
                      Parent := SearchArea ;
                      Name := 'ETypeLabel' ;
                      Text := DMTCCoreLink.GetTextLang(944);
                      //Caption := DMTCCoreLink.GetTextLang(FaSearchCollection[i].WColumnTranslation);
                      Left := 1 ;
                      Top  := 1 ;
                      Font.Color := clWindowText ;
                      ReadOnly := True ;
                   end;
         end;


  for i := 0 to FaSearchCollection.Count -1 do
    if not FaSearchCollection[i].Delete then
     begin
      // handel all osfEntities


      if copy(FaSearchCollection[i].SControlType,1,1) = 'O' then
          begin

           FaSearchCollection[i].Component := TEdit.Create(self);
           FaSearchCollection[i].Button := Tbutton.Create(self);
           TEdit(FaSearchCollection[i].Component).Parent := SearchArea ;
           TEdit(FaSearchCollection[i].Component).ReadOnly := true ;
           TEdit(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX + 20 ;
           TEdit(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TEdit(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TEdit(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TEdit(FaSearchCollection[i].Component).CharCase := ecUpperCase ;
           TEdit(FaSearchCollection[i].Component).MaxLength :=  FaSearchCollection[i].WLength ;
           TEdit(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;

           FaSearchCollection[i].clear ;
           if copy(FaSearchCollection[i].SControlType,2,1) = 'X' then
             TEdit(FaSearchCollection[i].Component).Text := VarToStr(DMTCCoreLink.ReadSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id),'',DMTCCoreLink.currentuser))
           else
           begin
           TEdit(FaSearchCollection[i].Component).Tag :=  DMTCCoreLink.ReadSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id),0,DMTCCoreLink.currentuser);
           TEdit(FaSearchCollection[i].Component).Text := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TEdit(FaSearchCollection[i].Component).Tag) + ' ' + TDataBaseRoutines.GetAccountDescription(FaSearchCollection[i].Component.Tag) ;
           end;
           // ref to the data
           FaSearchCollection[i].Button.Tag := Integer(FaSearchCollection[i]);
           Tbutton(FaSearchCollection[i].Button).Parent := SearchArea ;
           Tbutton(FaSearchCollection[i].Button).Left   := FaSearchCollection[i].WControlX  ;
           Tbutton(FaSearchCollection[i].Button).Top := FaSearchCollection[i].WControlY ;
           Tbutton(FaSearchCollection[i].Button).Width  := 18 ;

           Tbutton(FaSearchCollection[i].Button).Height  := FaSearchCollection[i].WControlHeigth ;
           Tbutton(FaSearchCollection[i].Button).OnClick := osfSearchClick;


           CreateLabel ;

          end else // End type 'S'

        if FaSearchCollection[i].SControlType = 'S' then
          begin
           FaSearchCollection[i].Component := TEdit.Create(self);

           TEdit(FaSearchCollection[i].Component).Parent := SearchArea ;
           TEdit(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX ;
           TEdit(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TEdit(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TEdit(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TEdit(FaSearchCollection[i].Component).CharCase := ecUpperCase ;
           TEdit(FaSearchCollection[i].Component).MaxLength :=  FaSearchCollection[i].WLength ;
           TEdit(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           FaSearchCollection[i].clear ;
           if DMTCCoreLink.ReadLongSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser) <> '' then
           TEdit(FaSearchCollection[i].Component).Text :=  DMTCCoreLink.ReadLongSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser);
           CreateLabel  ;
          end else // End type 'S'

       if (FaSearchCollection[i].SControlType = 'F') or (FaSearchCollection[i].SControlType = 'N') then
          begin
           FaSearchCollection[i].Component := TEdit.Create(self);
           TEdit(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX ;
           if FaSearchCollection[i].FSUseStringLike <> 'B' then
           begin
           FaSearchCollection[i].TypeDropdown := TComboBox.Create(self);
           FaSearchCollection[i].TypeDropdown.Parent := SearchArea ;
           FaSearchCollection[i].TypeDropdown.Left := FaSearchCollection[i].WControlX ;
           FaSearchCollection[i].TypeDropdown.top := FaSearchCollection[i].WControlY ;
           FaSearchCollection[i].TypeDropdown.Items.Add('=');
           FaSearchCollection[i].TypeDropdown.Items.Add('<');
           FaSearchCollection[i].TypeDropdown.Items.Add('>');
           FaSearchCollection[i].TypeDropdown.Items.Add('<=');
           FaSearchCollection[i].TypeDropdown.Items.Add('>=');
           FaSearchCollection[i].TypeDropdown.Style :=  csDropDownList ;
           TEdit(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX  + 42 ;
           FaSearchCollection[i].TypeDropdown.Width := 40 ;
           FaSearchCollection[i].TypeDropdown.ItemIndex := DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_D',0,DMTCCoreLink.currentuser);
           end;
           FaSearchCollection[i].clear ;
           if floatToStr(DMTCCoreLink.ReadSysParam(0,fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser)) <> '0'  then
           TEdit(FaSearchCollection[i].Component).Text :=  floatToStr(DMTCCoreLink.ReadSysParam(0,fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser));
           TEdit(FaSearchCollection[i].Component).Parent := SearchArea ;

           TEdit(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TEdit(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TEdit(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TEdit(FaSearchCollection[i].Component).CharCase := ecUpperCase ;
           //TEdit(FaSearchCollection[i].Component).MaxLength :=  FaSearchCollection[i].WLength ;
           TEdit(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'F'
          if (FaSearchCollection[i].SControlType = 'DX') then
          begin
           FaSearchCollection[i].Component := TFrameLookupPeriods.Create(self);
           TFrameLookupPeriods(FaSearchCollection[i].Component).InitCaptions ;
           TFrameLookupPeriods(FaSearchCollection[i].Component).Parent := SearchArea ;
           TFrameLookupPeriods(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX   ;
           TFrameLookupPeriods(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TFrameLookupPeriods(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TFrameLookupPeriods(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;

           value := VarToStr(DMTCCoreLink.ReadLongSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser));
           if Value <> '' then
             TFrameLookupPeriods(FaSearchCollection[i].Component).SetPropString(value) else
              begin
              TFrameLookupPeriods(FaSearchCollection[i].Component).rgPEriode.ItemIndex := 5 ;
              TFrameLookupPeriods(FaSearchCollection[i].Component).rgPEriodeClick(self);

             end;

           //TEdit(FaSearchCollection[i].Component).MaxLength :=  FaSearchCollection[i].WLength ;
           TDateTimePicker(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'DX'
          if (FaSearchCollection[i].SControlType = 'D') then
          begin
           FaSearchCollection[i].Component := TDateTimePicker.Create(self);
           TDateTimePicker(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX   ;
           TDateTimePicker(FaSearchCollection[i].Component).MinDate := EncodeDate(1800,1,1);
           TDateTimePicker(FaSearchCollection[i].Component).MaxDate := EncodeDate(2900,1,1);
           if FaSearchCollection[i].FSUseStringLike <> 'B' then
           begin
           FaSearchCollection[i].TypeDropdown := TComboBox.Create(self);

           FaSearchCollection[i].TypeDropdown.Parent := SearchArea ;
           FaSearchCollection[i].TypeDropdown.Left := FaSearchCollection[i].WControlX ;
           FaSearchCollection[i].TypeDropdown.top := FaSearchCollection[i].WControlY ;
           FaSearchCollection[i].TypeDropdown.Items.Add('*');
           FaSearchCollection[i].TypeDropdown.Items.Add('=');
           FaSearchCollection[i].TypeDropdown.Items.Add('<');
           FaSearchCollection[i].TypeDropdown.Items.Add('>');
           FaSearchCollection[i].TypeDropdown.Items.Add('<=');
           FaSearchCollection[i].TypeDropdown.Items.Add('>=');
           FaSearchCollection[i].TypeDropdown.Style :=  csDropDownList ;
           FaSearchCollection[i].TypeDropdown.Width := 40 ;

           TDateTimePicker(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX  + 42 ;
           end;
       //    TDateTimePicker(FaSearchCollection[i].Component).date := 0 ;
           TDateTimePicker(FaSearchCollection[i].Component).Parent := SearchArea ;

           TDateTimePicker(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TDateTimePicker(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TDateTimePicker(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           value := VarToStr(DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',FormatDateTime('yyyymmdd',date),DMTCCoreLink.currentuser));
           FaSearchCollection[i].clear ;
           try
           TDateTimePicker(FaSearchCollection[i].Component).date := EncodeDate(StrToIntDef(copy(value,1,4),2008),StrToIntDef(copy(value,5,2),1),StrToIntDef(copy(value,7,2),1)) ;
           if assigned(FaSearchCollection[i].TypeDropdown) then
           FaSearchCollection[i].TypeDropdown.ItemIndex := DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_D',0,DMTCCoreLink.currentuser);
           except
            TDateTimePicker(FaSearchCollection[i].Component).date := date ;
           end;

           //TEdit(FaSearchCollection[i].Component).MaxLength :=  FaSearchCollection[i].WLength ;
           TDateTimePicker(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // end DX

          if FaSearchCollection[i].SControlType = 'B' then
          begin
           FaSearchCollection[i].Component := TCheckBox.Create(self);
           TCheckBox(FaSearchCollection[i].Component).Parent := SearchArea ;
           TCheckBox(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX   ;
           TCheckBox(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TCheckBox(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TCheckBox(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TCheckBox(FaSearchCollection[i].Component).Caption := '' ;
           TCheckBox(FaSearchCollection[i].Component).OnMouseDown := CheckBoxMouseDown ;
           if not Rightpanel.Visible then
           begin
           TCheckBox(FaSearchCollection[i].Component).State := cbUnchecked  ;
           TCheckBox(FaSearchCollection[i].Component).AllowGrayed := false ;
           end else
           begin
           TCheckBox(FaSearchCollection[i].Component).State := cbGrayed  ;
           TCheckBox(FaSearchCollection[i].Component).AllowGrayed := True ;
           end;
           //TCheckBox(FaSearchCollection[i].Component).Alignment := taLeftJustify ;
           FaSearchCollection[i].clear ;
           value :=  VarToStr(DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_','-1',DMTCCoreLink.currentuser));
           if  value = '' then Value := FaSearchCollection[i].FLLOOKUPSQL ;
           if  value <> '-1' then
            TCheckBox(FaSearchCollection[i].Component).Checked := boolean(StrToInt(value));

           TCheckBox(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel ;
          end else // End type 'B'
          if FaSearchCollection[i].SControlType = 'IC' then
          begin
           FaSearchCollection[i].Component := TCheckListBox.Create(self);
           TCheckListBox(FaSearchCollection[i].Component).Parent := SearchArea ;
           TCheckListBox(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX ;
           TCheckListBox(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TCheckListBox(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TCheckListBox(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TCheckListBox(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           // Groeps ?
           If Pos('GROUPS',FaSearchCollection[i].LLOOKUPSQL) = 1 then
           begin
            Value := ',' +  DMTCCoreLink.ReadLongSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser)+ ',';

             TDataBaseRoutines.FillStringsWithReportingGroups(TCheckListBox(FaSearchCollection[i].Component).Items,StrToIntDef( Copy(FaSearchCollection[i].LLOOKUPSQL,7,20),0));
             for x := 0 to TCheckListBox(FaSearchCollection[i].Component).Items.Count -1 do
               begin
                    if (pos(','+IntToStr(Integer(TCheckListBox(FaSearchCollection[i].Component).Items.Objects[x])) + ',',Value+',') <> 0) then
                       TCheckListBox(FaSearchCollection[i].Component).Checked[x] := true ;
               end;





           end else
           begin
           Value :=  ',' +DMTCCoreLink.ReadLongSysparam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',DMTCCoreLink.currentuser)+ ',';
           try
           AQuery := TuniQuery.Create(nil) ;
            try
             AQuery.Connection := DMTCCoreLink.TheZConnection ;

             AQuery.sql.Text :=  FaSearchCollection[i].LLOOKUPSQL ;
             AQuery.open ;
             while not AQuery.eof do
                 begin
                    if AQuery.Fields[1].FieldName ='TRN' then
                      TCheckListBox(FaSearchCollection[i].Component).Items.AddObject(DMTCCoreLink.GetTextLang(AQuery.fields[1].AsInteger), Tobject(AQuery.Fields[0].asinteger)) 

                    else
                    TCheckListBox(FaSearchCollection[i].Component).Items.AddObject(AQuery.fields[1].asstring,Tobject(AQuery.Fields[0].asinteger)) ;
                    if (pos(',' + AQuery.Fields[0].asString+ ',',Value+',') <> 0)  then
                       TCheckListBox(FaSearchCollection[i].Component).Checked[TCheckListBox(FaSearchCollection[i].Component).Items.Count-1] := true ;
                    AQuery.next ;
                 end;
            finally
              AQuery.free ;
            end;
            except
               TCheckListBox(FaSearchCollection[i].Component).Items.Add('SQL error') ;
               // dont handel
            end;
            end;
            CreateLabel  ;
          end else // End type 'IC'

          if FaSearchCollection[i].SControlType = 'IL' then
          begin
           FaSearchCollection[i].Component := TComboBox.Create(self);
           TComboBox(FaSearchCollection[i].Component).Parent := SearchArea ;
           TComboBox(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX ;
           TComboBox(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TComboBox(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TComboBox(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TComboBox(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           Value := VarToStr(DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',0,DMTCCoreLink.currentuser));
           // add empty item
           if Rightpanel.Visible then

           TComboBox(FaSearchCollection[i].Component).Items.Append(DMTCCoreLink.GetTextLang(20046));

            If Pos('GROUPS',FaSearchCollection[i].LLOOKUPSQL) = 1 then
           begin

             TDataBaseRoutines.FillStringsWithReportingGroups(TComboBox(FaSearchCollection[i].Component).Items,StrToIntDef( Copy(FaSearchCollection[i].LLOOKUPSQL,7,20),0));

           end else
           begin

           try
           AQuery := TuniQuery.Create(nil) ;
            try
             AQuery.Connection := DMTCCoreLink.TheZConnection ;
             AQuery.sql.Text :=  FaSearchCollection[i].LLOOKUPSQL ;
             AQuery.open ;
             while not AQuery.eof do
                 begin
                     if AQuery.Fields[1].FieldName ='TRN' then
                        TComboBox(FaSearchCollection[i].Component).Items.AddObject(DMTCCoreLink.GetTextLang(AQuery.fields[1].AsInteger),Tobject(AQuery.Fields[0].asinteger))
                       else
                        TComboBox(FaSearchCollection[i].Component).Items.AddObject(AQuery.fields[1].asstring,Tobject(AQuery.Fields[0].asinteger)) ;
                    AQuery.next ;
                 end;
            finally
              AQuery.free ;
            end;
            except
              TComboBox(FaSearchCollection[i].Component).Items.Add('SQL error') ;
               // dont handel
            end;
           end;


            TComboBox(FaSearchCollection[i].Component).Style := csDropDownList ;
            if not Rightpanel.Visible and (TComboBox(FaSearchCollection[i].Component).Items.Count > 0) then
               TComboBox(FaSearchCollection[i].Component).ItemIndex := 0 ;
               
            if TComboBox(FaSearchCollection[i].Component).Items.Count > StrToIntDef(Value,0) then
               TComboBox(FaSearchCollection[i].Component).ItemIndex := StrToIntDef(Value,0) ;
            CreateLabel  ;
          end; // End type 'IL'


           if FaSearchCollection[i].SControlType = 'SL' then
          begin
           FaSearchCollection[i].Component := TComboBox.Create(self);
           TComboBox(FaSearchCollection[i].Component).Parent := SearchArea ;
           TComboBox(FaSearchCollection[i].Component).Left := FaSearchCollection[i].WControlX ;
           TComboBox(FaSearchCollection[i].Component).Top := FaSearchCollection[i].WControlY ;
           TComboBox(FaSearchCollection[i].Component).Width :=  FaSearchCollection[i].WControlWidth ;
           TComboBox(FaSearchCollection[i].Component).Height :=  FaSearchCollection[i].WControlHeigth ;
           TComboBox(FaSearchCollection[i].Component).OnKeyPress := OnEditControlKeyPress ;
           Value := VarToStr(DMTCCoreLink.ReadSysParam(fLookup+ IntToStr(FaSearchCollection[i].Wosf_search_fields_id)+'_',0,DMTCCoreLink.currentuser));
           // add empty item
           TComboBox(FaSearchCollection[i].Component).Style := csDropDownList ;
           if Rightpanel.Visible then

           TComboBox(FaSearchCollection[i].Component).Items.Append(DMTCCoreLink.GetTextLang(20046));

            If Pos('GROUPS',FaSearchCollection[i].LLOOKUPSQL) = 1 then
           begin

             TDataBaseRoutines.FillStringsWithReportingGroups(TComboBox(FaSearchCollection[i].Component).Items,StrToIntDef( Copy(FaSearchCollection[i].LLOOKUPSQL,7,20),0));

           end else
           begin
            TComboBox(FaSearchCollection[i].Component).Items.Text := FaSearchCollection[i].FLLOOKUPSQL ;
            if Rightpanel.Visible then
                TComboBox(FaSearchCollection[i].Component).Items.Insert(0,DMTCCoreLink.GetTextLang(20046));

           end;

            if not Rightpanel.Visible and (TComboBox(FaSearchCollection[i].Component).Items.Count > 0) then
               TComboBox(FaSearchCollection[i].Component).ItemIndex := 0 ;
               
            if TComboBox(FaSearchCollection[i].Component).Items.Count > StrToIntDef(Value,0) then
               TComboBox(FaSearchCollection[i].Component).ItemIndex := StrToIntDef(Value,0) ;
            CreateLabel  ;
          end; // End type 'IL'



        if  ViewType = vtcompact then
           begin
            AComboBox.Items.AddObject(DMTCCoreLink.GetTextLang(FaSearchCollection[i].WColumnTranslation),FaSearchCollection[i]);
            if FaSearchCollection[i].TextLabel <> nil then
            SetOrdProp(FaSearchCollection[i].TextLabel,'Visible',0) ;
            if FaSearchCollection[i].Component <> nil then
               SetOrdProp(FaSearchCollection[i].Component,'Visible',0) ;
            if FaSearchCollection[i].TypeDropdown <> nil then
               SetOrdProp(FaSearchCollection[i].TypeDropdown,'Visible',0) ;
            if FaSearchCollection[i].Button <> nil then
               SetOrdProp(FaSearchCollection[i].Button,'Visible',0) ;
           end;
     end;
    if  ViewType = vtcompact then
        begin
        AComboBox.ItemIndex := DMTCCoreLink.ReadSysparam(fLookup+ 'Compact_',0,DMTCCoreLink.currentuser);
        cbCompactChange(self) ;
        end;

end;

procedure TSearchPanel.cbChangeTypeClick(Sender: TObject);
var
 Value : String ;
begin
   if ViewType = vtDetail then
      ViewType := vtCompact else
      ViewType := vtDetail ;

   Value := '0';
   if ViewType = vtCompact then
      Value := '1';
  DMTCCoreLink.WriteSysParam(fLookup+ 'ViewType_',Value,DMTCCoreLink.currentuser);

    rebuild ;  
end;

procedure TSearchPanel.cbCompactChange(Sender: TObject);
var
 i : Integer ;
begin
 // disable
 for i := 0 to FaSearchCollection.Count -1 do
   begin
      if FaSearchCollection[i].TextLabel <> nil then
      SetOrdProp(FaSearchCollection[i].TextLabel,'Visible',0) ;
      if FaSearchCollection[i].Component <> nil then
         SetOrdProp(FaSearchCollection[i].Component,'Visible',0) ;
      if FaSearchCollection[i].TypeDropdown <> nil then
         SetOrdProp(FaSearchCollection[i].TypeDropdown,'Visible',0) ;
      if FaSearchCollection[i].Button <> nil then
         SetOrdProp(FaSearchCollection[i].Button,'Visible',0) ;
   end;

   if AComboBox.ItemIndex > 0 then
     begin
       with  TSearchCollectionItem(AComboBox.Items.Objects[AComboBox.ItemIndex ]) do
         begin
             SetOrdProp(Component,'Top',15) ;
             SetOrdProp(Component,'Left',135) ;

             SetOrdProp(TextLabel,'Top',1) ;
             SetOrdProp(TextLabel,'Left',135) ;

             if GetOrdProp(Component,'Height') > 70 then
               SetOrdProp(Component,'Height',70) ;


            SetOrdProp(TextLabel,'Visible',1) ;
            SetOrdProp(Component,'Visible',1) ;

            if  TypeDropdown <> nil then
                begin
                  SetOrdProp( TypeDropdown,'Visible',1) ;
                  SetOrdProp(TypeDropdown,'Top',15) ;
                 SetOrdProp(TypeDropdown,'Left',115) ;
                end;
            if  Button <> nil then
                begin
                  SetOrdProp(Button,'Top',15) ;
                  SetOrdProp(Button,'Left',115) ;
                  SetOrdProp( Button,'Visible',1) ;
                end;

         end;
     end;
end;

procedure TSearchPanel.SetDefSql(const Value: String);
begin
  FDefSql := Value;
end;

procedure TSearchPanel.SetViewType(const Value: TViewTypes);
begin
  FViewType := Value;
end;

procedure TSearchPanel.rebuild;
var
 i : integer ;
begin
 if assigned(AComboBox) then
    FreeAndNil(AComboBox);
 for i := 0 to faSearchCollection.Count -1 do
   begin
     if assigned(faSearchCollection[i].Component) then
        faSearchCollection[i].Component.free ;
     faSearchCollection[i].Component := nil ;

     if assigned(faSearchCollection[i].TextLabel) then
        faSearchCollection[i].TextLabel.free ;
     faSearchCollection[i].TextLabel := nil ;

     if assigned(faSearchCollection[i].TypeDropdown) then
        faSearchCollection[i].TypeDropdown.free ;
     faSearchCollection[i].TypeDropdown := nil ;

     if assigned(faSearchCollection[i].Button) then
        faSearchCollection[i].Button.free ;
     faSearchCollection[i].Button := nil ;
   end;
     if self.FindComponent('ETypeLabel') <> nil then
        self.FindComponent('ETypeLabel').free ;
  BuildGui ;
end;

procedure TSearchPanel.SetLastFocus;
begin
if assigned(LastFocused) then
 if  LastFocused.CanFocus then
   LastFocused.SetFocus ;
end;

procedure TSearchPanel.UpdateFromActiveControl(AControl: TControl);
var
 i : Integer ;
begin
 for i :=  0 to FaSearchCollection.Count -1 do
    begin
       if FaSearchCollection.SearchCollectionItem[i].Component = AControl then
          begin
            FaSearchCollection.SearchCollectionItem[i].WControlX := AControl.Left ;
            FaSearchCollection.SearchCollectionItem[i].WControly := AControl.Top ;
            FaSearchCollection.SearchCollectionItem[i].WControlWidth := AControl.Width ;
            FaSearchCollection.SearchCollectionItem[i].WControlHeigth := AControl.Height ;
            if FaSearchCollection.SearchCollectionItem[i].SControlType ='' then
               raise Exception.Create('Control type is empty! for ' + FLookup);
            if (FaSearchCollection.SearchCollectionItem[i].SControlType[1] in ['F','D','O','N']) then
               begin
                FaSearchCollection.SearchCollectionItem[i].WControlX := AControl.Left - 42 ;
                FaSearchCollection.SearchCollectionItem[i].WControly := AControl.Top ;
               end;

            if Assigned(FaSearchCollection.SearchCollectionItem[i].TextLabel) then
               begin
                 TEdit(FaSearchCollection.SearchCollectionItem[i].TextLabel).Left := FaSearchCollection.SearchCollectionItem[i].WControlX  ;
                 TEdit(FaSearchCollection.SearchCollectionItem[i].TextLabel).Top := FaSearchCollection.SearchCollectionItem[i].WControly - 14;
               end;
            if Assigned(FaSearchCollection.SearchCollectionItem[i].Button) then
               begin
                 TButton(FaSearchCollection.SearchCollectionItem[i].Button).Left := FaSearchCollection.SearchCollectionItem[i].WControlX ;
                 TButton(FaSearchCollection.SearchCollectionItem[i].Button).Top := FaSearchCollection.SearchCollectionItem[i].WControly ;
               end;
            if Assigned(FaSearchCollection.SearchCollectionItem[i].TypeDropdown) then
               begin
                 TComboBox(FaSearchCollection.SearchCollectionItem[i].TypeDropdown).Left := FaSearchCollection.SearchCollectionItem[i].WControlX ;
                 TComboBox(FaSearchCollection.SearchCollectionItem[i].TypeDropdown).Top := FaSearchCollection.SearchCollectionItem[i].WControly ;
               end;
          end;
    end;
end;

procedure TSearchPanel.SaveEditedToDatabase;
Var
 AQuery : TuniQuery ;
 AUpdateComponent : TUniUpdateSql ;
 i : Integer ;
begin
  AQuery := TuniQuery.Create(nil) ;
  AUpdateComponent := TUniUpdateSql.Create(nil) ;
  try


   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := 'select * from OSF_SEARCH_FIELDS where SFORMNAME = ' + QuotedStr(FLookup) ;
   AQuery.UpdateObject := AUpdateComponent ;
   
   AQuery.open ;   
   TDatabaseTableRoutines.UpdateQuery(AQuery,'OSF_SEARCH_FIELDS',['WOSF_SEARCH_FIELDS_ID']);
   for i := 0 to Self.FaSearchCollection.Count -1 do
      begin
         if AQuery.Locate('WOSF_SEARCH_FIELDS_ID',Self.FaSearchCollection.SearchCollectionItem[i].Wosf_search_fields_id,[]) then
            AQuery.edit
         else
           AQuery.Insert ;
           if FaSearchCollection[i].Delete then
             begin
                if AQuery.State = dsEdit then
                  begin
                   AQuery.Cancel ;
                   AQuery.Delete ;
                   Continue ;
                  end else
                  begin
                     AQuery.Cancel ;
                     Continue ;
                  end;
             end;

           AQuery.FieldByName('Wosf_search_fields_id').AsInteger := FaSearchCollection[I].Wosf_search_fields_id;
           if AQuery.FieldByName('Wosf_search_fields_id').AsInteger = 0 then
             AQuery.FieldByName('Wosf_search_fields_id').AsInteger := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select max(Wosf_search_fields_id) from OSF_SEARCH_FIELDS ')) ,0) +1 ;

     
           AQuery.FieldByName('SColumnOrigen').AsString := FaSearchCollection[I].SColumnOrigen  ;
           AQuery.FieldByName('WColumnTranslation').AsInteger := FaSearchCollection[I].WColumnTranslation  ;
           AQuery.FieldByName('WControlX').AsInteger := FaSearchCollection[I].WControlX  ;
           AQuery.FieldByName('WControly').AsInteger := FaSearchCollection[I].WControly  ;
           AQuery.FieldByName('WControlWidth').AsInteger := FaSearchCollection[I].WControlWidth  ;
           AQuery.FieldByName('WControlHeigth').AsInteger := FaSearchCollection[I].WControlHeigth  ;
           AQuery.FieldByName('SControlType').AsString := FaSearchCollection[I].SControlType  ;
           AQuery.FieldByName('WLength').AsInteger := FaSearchCollection[I].WLength  ;
           AQuery.FieldByName('SUseStringLike').AsString := FaSearchCollection[I].SUseStringLike  ;
           AQuery.FieldByName('LLOOKUPSQL').AsString :=FaSearchCollection[I].LLOOKUPSQL ;
           AQuery.FieldByName('sformname').AsString := FLookup ;
           AQuery.Post ;
      end;

  { while not AQuery.eof do
       begin
         if AQuery.FieldByName('SColumnOrigen').AsString = 'SQL' then
          begin
             DefSql :=  AQuery.FieldByName('LLOOKUPSQL').AsString
          end else
          begin
           FaSearchCollection.Add ;
           FaSearchCollection[FaSearchCollection.Count-1].Wosf_search_fields_id := AQuery.FieldByName('Wosf_search_fields_id').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SColumnOrigen := AQuery.FieldByName('SColumnOrigen').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].WColumnTranslation := AQuery.FieldByName('WColumnTranslation').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlX := AQuery.FieldByName('WControlX').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControly := AQuery.FieldByName('WControly').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlWidth := AQuery.FieldByName('WControlWidth').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].WControlHeigth := AQuery.FieldByName('WControlHeigth').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SControlType := AQuery.FieldByName('SControlType').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].WLength := AQuery.FieldByName('WLength').AsInteger ;
           FaSearchCollection[FaSearchCollection.Count-1].SUseStringLike := AQuery.FieldByName('SUseStringLike').AsString ;
           FaSearchCollection[FaSearchCollection.Count-1].LLOOKUPSQL := AQuery.FieldByName('LLOOKUPSQL').AsString ;
           end;
           AQuery.next ;
       end;  }
  finally
   AQuery.free ;
   AUpdateComponent.free ;
  end;

end;

procedure TSearchCollectionItem.SetButton(const Value: TComponent);
begin
  FButton := Value;
end;

procedure TSearchCollectionItem.SetComponent(const Value: TComponent);
begin
  FComponent := Value;
end;

procedure TSearchCollectionItem.SetDelete(const Value: Boolean);
begin
  FDelete := Value;
end;

procedure TSearchCollectionItem.SetLLOOKUPSQL(const Value: String);
begin
  FLLOOKUPSQL := Value;
end;

procedure TSearchCollectionItem.SetSColumnOrigen(const Value: String);
begin
  FSColumnOrigen := Value;
end;

procedure TSearchCollectionItem.SetSControlType(const Value: String);
begin
  FSControlType := Value;
end;

procedure TSearchCollectionItem.SetSUseStringLike(const Value: String);
begin
  FSUseStringLike := Value;
end;

procedure TSearchCollectionItem.SetTextLabel(const Value: TComponent);
begin
  FTextLabel := Value;
end;

procedure TSearchCollectionItem.SetTypeDropdown(const Value: TComboBox);
begin
  FTypeDropdown := Value;
end;

procedure TSearchCollectionItem.SetWColumnTranslation(
  const Value: integer);
begin
  FWColumnTranslation := Value;
end;

procedure TSearchCollectionItem.SetWControlHeigth(const Value: integer);
begin
  FWControlHeigth := Value;
end;

procedure TSearchCollectionItem.SetWControlWidth(const Value: integer);
begin
  FWControlWidth := Value;
end;

procedure TSearchCollectionItem.SetWControlX(const Value: integer);
begin
  FWControlX := Value;
end;

procedure TSearchCollectionItem.SetWControly(const Value: integer);
begin
  FWControly := Value;
end;

procedure TSearchCollectionItem.SetWLength(const Value: integer);
begin
  FWLength := Value;
end;

procedure TSearchCollectionItem.SetWosf_search_fields_id(
  const Value: integer);
begin
  FWosf_search_fields_id := Value;
end;

{ TEditCollectionItem }

procedure TEditCollectionItem.clear;
var i : Integer ;
    var DefaultValue : Variant ;

begin
if not Assigned(Component) then exit ;
   if SDEFAULTVALUE <> '' then
      begin
         if Pos('SELECT',UpperCase(SDEFAULTVALUE) ) > 0 then
           DefaultValue := DMTCCoreLink.OpenSqlReturnFirstColumn(SDEFAULTVALUE)
           else
          DefaultValue :=  SDEFAULTVALUE ;
      end;

  if SControlType = 'D' then
   begin
    if VarToStr(DefaultValue) <> '' then
       TDateTimePicker(Component).Date := DefaultValue ;
   end else

  if SControlType = 'S' then
   begin
     TEdit(Component).Text := VarToStr(DefaultValue)
   end else
  if SControlType = 'M' then
   begin
      if LLOOKUPSQL = 'HTML' then
       TosFMemo(Component).Text := VarToStr(DefaultValue)
      else
     TMemo(Component).Text := VarToStr(DefaultValue)
   end else
  if SControlType = 'B' then
   begin
     TCheckBox(Component).Checked := trim(VarToStr(DefaultValue)) = '1' ;
   end else
  if (SControlType = 'F') or (SControlType = 'N')  then
   begin
     if  VarToStr(DefaultValue) <> '' then
      TEdit(Component).Text := FloatToStr(StrToFloatdef(VarToStr(DefaultValue),0))
     else
     TEdit(Component).Text := '' ;
   end else
  if SControlType = 'IL' then
   begin
    TComboBox(Component).ItemIndex := 0 ;
    if VarToStr(DefaultValue) <> '' then
     if TComboBox(Component).Tag = 0 then
       TComboBox(Component).ItemIndex := TComboBox(Component).Items.IndexOfObject(TObject(StrToIntDef(VarToStr(DefaultValue),0)))
       else
       TComboBox(Component).ItemIndex := TComboBox(Component).Items.IndexOf(VarToStr(DefaultValue));
   end else
  if SControlType = 'IC' then
   begin



    for i := 0 to TCheckListBox(Component).Items.count -1 do
      begin

       TCheckListBox(Component).Checked[i] := pos(','+IntToStr(Integer(TCheckListBox(Component).Items.Objects[i]))+',',','+VarToStr(DefaultValue)+',') <> 0 ;

      end;
   end else
  if SControlType[1] = 'O' then
   begin
     TEdit(Component).Tag := 0 ;
     TEdit(Component).Text := '' ;
   end;
end;

constructor TEditCollectionItem.Create(Collection: TCollection);
begin
  inherited;

end;

destructor TEditCollectionItem.Destroy;
begin

  inherited;
end;

function TEditCollectionItem.GetDisplayValue: String;
Var
 I :  Integer ;
  ExtraLookup : String ;
begin
result := '' ;
if not Assigned(Component) then exit ;

if SControlType = 'S' then
    begin
      if TEdit(Component).Text <> '' then
        begin
           result := TEdit(Component).Text ;
        end;
    end else
if SControlType = 'M' then
    begin
     if LLOOKUPSQL = 'HTML' then
       begin
         if TosFMemo(Component).Text <> '' then
           begin
             result := TosFMemo(Component).Text ;
           end;
        end else
        begin
         if TMemo(Component).Text <> '' then
           begin
             result := TMemo(Component).Text ;
           end;
        end;
    end else
if SControlType = 'IL' then
    begin

         result := TComboBox(Component).Text ;

    end else
if SControlType = 'T' then
    begin
      result := TimeToStr(TDateTimePicker(Component).Time);

    end else
    if SControlType = 'D' then
    begin
      result := DateToStr(TDateTimePicker(Component).Date);

    end else
if (SControlType = 'F') or (SControlType = 'N') then
    begin
     result := TEdit(Component).Text ;
    end else
if SControlType = 'B' then
    begin
         result := BoolToStr(TCheckBox(Component).Checked,true);
    end else
if copy(SControlType,1,1) = 'O' then
    begin
     ExtraLookup :=  LLOOKUPSQL ;
     if pos('@@GO@@',ExtraLookup) > 0 then
     begin
      system.delete(ExtraLookup,pos('@@GO@@',ExtraLookup),length(ExtraLookup));
      result:= varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(ExtraLookup,'ID='+
               IntToStr(TEdit(Component).Tag)))) ;
      end else

     if SControlType = 'OS' then
           result := TDataBaseStockRoutines.GetStockCode(TEdit(Component).Tag)
            else
            TEdit(Component).Text := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(Component.Tag) + ' '  +  TDataBaseRoutines.GetAccountDescription(Component.Tag);
    end else
if SControlType = 'IC' then
    begin
      result := '' ;
      for i := 0 to TCheckListBox(Component).Items.Count -1 do
        if TCheckListBox(Component).Checked[i] then
          begin
           if result <> '' then
             result := result + ',' ;
            result := result + IntToStr(Integer(TCheckListBox(Component).Items[i]));
          end;
    end;
end;
function TEditCollectionItem.GetValue: Variant;
Var
 I :  Integer ;
begin
result := '' ;
if not Assigned(Component) then exit ;

if SControlType = 'S' then
    begin
      if TEdit(Component).Text <> '' then
        begin
           result := TEdit(Component).Text ;
        end;
    end else
if SControlType = 'M' then
    begin
     if LLOOKUPSQL = 'HTML' then
     begin
       result := TosFMemo(Component).Text
     end else
     result := TMemo(Component).Text ;
    end else
if SControlType = 'IL' then
    begin
      if TComboBox(Component).Tag = 1 then
         begin
         result := TComboBox(Component).Text ;
         end else
      if TComboBox(Component).ItemIndex > -1 then
        begin
           result := Integer(TComboBox(Component).Items.Objects[TComboBox(Component).ItemIndex]) ;
        end else result := 0 ;
    end else
if SControlType = 'D' then
    begin
      result := varnull ;
      if TDateTimePicker(Component).Date <> 0 then
        begin
           result := TDateTimePicker(Component).Date;
        end;
    end else
if SControlType = 'T' then
    begin
      result := varnull ;
      if TDateTimePicker(Component).Date <> 0 then
        begin
           result := TDateTimePicker(Component).Time;
        end;
    end else
if (SControlType = 'F') or (SControlType = 'N') then
    begin
     result := 0 ;
      if (StrTOFloatDef(TEdit(Component).Text,0) <> 0) then
        begin
           result := StrTOFloatDef(TEdit(Component).Text,0);
        end;
    end else
if SControlType = 'B' then
    begin
         result := ord(TCheckBox(Component).Checked);
    end else
if copy(SControlType,1,1) = 'O' then
    begin
        result :=  TEdit(Component).Tag ;
     end else
if SControlType = 'IC' then
    begin
      result := '' ;
      for i := 0 to TCheckListBox(Component).Items.Count -1 do
        if TCheckListBox(Component).Checked[i] then
          begin
           if result <> '' then
             result := result + ',' ;
            result := result + IntToStr(Integer(TCheckListBox(Component).Items.Objects[i]));
          end;
    end;
end;


procedure TEditCollectionItem.SetValue(Value: Variant);
var
 i : Integer ;
 ExtraLookup : String ;
begin
if not Assigned(Component) then exit ;
      if SControlType[1] = 'O' then
          begin
           ExtraLookup :=  LLOOKUPSQL ;
           TEdit(Component).Tag := StrToIntDef(VarToStr(Value),0) ;
          if pos('@@GO@@',ExtraLookup) > 0 then
             begin
               system.delete(ExtraLookup,pos('@@GO@@',ExtraLookup),length(ExtraLookup));
               TEdit(Component).Text :=
               varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(ExtraLookup,'ID='+
               IntToStr(TEdit(Component).Tag)))) ;
            end else
           if SControlType = 'OS' then
            TEdit(Component).Text := TDataBaseStockRoutines.GetStockFullDescription(TEdit(Component).Tag)
            else
            TEdit(Component).Text := TDataBaseRoutines.GetAccountFullDescription(TEdit(Component).Tag) ;
          end else // End type 'S'
        if SControlType = 'S' then
          begin
           TEdit(Component).Text :=  VarToStr(Value) ;
          end else // End type 'S'
        if SControlType = 'M' then
          begin
           if LLOOKUPSQL = 'HTML' then
              TosFMemo(Component).Text :=  VarToStr(Value) 
           else
           TMemo(Component).Text :=  VarToStr(Value) ;
          end else // End type 'S'
       if (SControlType = 'F') or (SControlType = 'N') then
          begin
           TEdit(Component).Text :=  floatToStr(StrToFloatDef(VartoStr(Value),0));
          end else // End type 'F'
          if (SControlType = 'D') then
          begin
           TDateTimePicker(Component).date := 0 ;
           if VartoStr(Value) <> '' then
              TDateTimePicker(Component).date := Value;
          end else // End type 'F'
          if (SControlType = 'T') then
          begin
           TDateTimePicker(Component).Time := 0 ;
           if VartoStr(Value) <> '' then
              TDateTimePicker(Component).Time := Value ;
          end else // End type 'D'
         if SControlType = 'B' then
          begin
            TCheckBox(Component).Checked :=  boolean(StrToIntDef(VarToStr(value),0));
          end else // End type 'B'
          if SControlType = 'IC' then
          begin
            for i := 0 to TCheckListBox(Component).Items.Count -1 do
              begin
                 TCheckListBox(Component).Checked[i] := pos(','+IntToStr(Integer(TCheckListBox(Component).Items.Objects[i]))+',',','+Value+',') <> 0 ;
              end;


          end else // End type 'IC'

          if SControlType = 'IL' then
          begin
            if TComboBox(Component).Tag = 1 then
               begin
                 TComboBox(Component).text := VarToStr(Value) ;
               end else
               begin
                Value := TComboBox(Component).Items.IndexOfObject(TObject(StrToIntDef(VarToStr(Value),0))) ;
                if StrToIntDef(VarToStr(Value),0) < 0 then
                    Value := 0;
            if TComboBox(Component).Items.Count > StrToIntDef(VarToStr(Value),0) then
               TComboBox(Component).ItemIndex := StrToIntDef(VarToStr(Value),0) ;
              end;
          end; // End type 'IL'

end;

{ TEditCollection }

procedure TEditCollection.BuildGui(OnWinControl: TWinControl;EditForm : Boolean;SUBKEY:String);
Var
 AQuery : TuniQuery ;
 i : Integer ;



 procedure CreateLabel  ;
 begin
    EditCollectionItem[i].TextLabel := TEdit.Create(OnWinControl) ;
     with (EditCollectionItem[i].TextLabel as TEdit) do
       begin
          BevelInner := bvNone ;
          BevelOuter := bvNone ;
          BorderStyle := bsNone ;
          Color := clBtnFace ;
          TabStop := false ;
          Height := 14 ;
          Parent := OnWinControl ;
          ParentColor := true ;
          Text := DMTCCoreLink.GetTextLang(EditCollectionItem[i].WColumnTranslation);
          //Caption := DMTCCoreLink.GetTextLang(FaSearchCollection[i].WColumnTranslation);
          Left := EditCollectionItem[i].WControlX ;
          Top  := EditCollectionItem[i].WControlY - 14 ;
          Font.Color := clWindowText ;
          ReadOnly := True ;
          if Assigned(Application.MainForm) then
          Width := Application.MainForm.Canvas.TextWidth(Text) + 5
          else
          Width := EditCollectionItem[i].WControlWidth ;
          // FocusControl := TEdit(FaSearchCollection[i].Component) ;
       end;
  end;
begin
 // Build GUI
 AWincontrol := OnWinControl ;
  for i := 0 to self.Count -1 do
    if not EditCollectionItem[i].Delete then
     if ( EditCollectionItem[i].BACTIVE or EditForm) then
     begin
      // handel all osfEntities

       if EditCollectionItem[i].SControlType[1] = 'M' then
          begin
           if EditCollectionItem[i].LLOOKUPSQL ='HTML' then
             begin
              EditCollectionItem[i].Component := TosFMemo.Create(nil) ;
             TosFMemo(EditCollectionItem[i].Component).Parent := OnWinControl ;
             TosFMemo(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX  ;
             TosFMemo(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
             TosFMemo(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
             TosFMemo(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;

             //TMemo(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
             //TMemo(EditCollectionItem[i].Component).OnDblClick :=  OnMemoDblClick ;

              end  else
              begin
             EditCollectionItem[i].Component := TMemo.Create(OnWinControl);

             TMemo(EditCollectionItem[i].Component).Parent := OnWinControl ;
             TMemo(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX  ;
             TMemo(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
             TMemo(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
             TMemo(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
             TMemo(EditCollectionItem[i].Component).MaxLength :=  EditCollectionItem[i].WLength ;
             TMemo(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
             TMemo(EditCollectionItem[i].Component).OnDblClick :=  OnMemoDblClick ;
             end;
           // ref to the data
          CreateLabel ;

          end else // End type 'm'
      if copy(EditCollectionItem[i].SControlType,1,1) = 'O' then
          begin

           EditCollectionItem[i].Component := TEdit.Create(OnWinControl);
           EditCollectionItem[i].ExtComponent := EditCollectionItem[i].Component ;
           EditCollectionItem[i].Button := Tbutton.Create(TEdit(EditCollectionItem[i].Component));
           TEdit(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TEdit(EditCollectionItem[i].Component).ReadOnly := true ;
           TEdit(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX + 20 ;
           TEdit(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TEdit(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TEdit(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TEdit(EditCollectionItem[i].Component).MaxLength :=  EditCollectionItem[i].WLength ;
           TEdit(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;

           TEdit(EditCollectionItem[i].Component).OnKeyPress := LookupKeyPress ;

           // ref to the data
           Tbutton(EditCollectionItem[i].Button).Tag := Integer(EditCollectionItem[i]);
           Tbutton(EditCollectionItem[i].Button).Parent := OnWinControl ;
           Tbutton(EditCollectionItem[i].Button).Left   := EditCollectionItem[i].WControlX  ;
           Tbutton(EditCollectionItem[i].Button).Top := EditCollectionItem[i].WControlY ;
           Tbutton(EditCollectionItem[i].Button).Width  := 18 ;
           Tbutton(EditCollectionItem[i].Button).Height  := 18 ;
           Tbutton(EditCollectionItem[i].Button).OnClick := osfSearchClick;

           CreateLabel ;

          end else // End type 'S'

        if EditCollectionItem[i].SControlType = 'S' then
          begin
           EditCollectionItem[i].Component := TEdit.Create(OnWinControl);

           TEdit(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TEdit(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX ;
           TEdit(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TEdit(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TEdit(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TEdit(EditCollectionItem[i].Component).MaxLength :=  EditCollectionItem[i].WLength ;
           TEdit(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'S'

       if (EditCollectionItem[i].SControlType = 'F') or (EditCollectionItem[i].SControlType = 'N') or (EditCollectionItem[i].SControlType = 'I') then
          begin
           EditCollectionItem[i].Component := TEdit.Create(OnWinControl);
           TEdit(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TEdit(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX  ;
           TEdit(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TEdit(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TEdit(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TEdit(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'F'
          if (EditCollectionItem[i].SControlType = 'T') then
          begin
           EditCollectionItem[i].Component := TDateTimePicker.Create(OnWinControl);
           TDateTimePicker(EditCollectionItem[i].Component).MinDate := EncodeDate(1800,1,1);
           TDateTimePicker(EditCollectionItem[i].Component).MaxDate := EncodeDate(2900,1,1);

           TDateTimePicker(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TDateTimePicker(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX   ;
           TDateTimePicker(EditCollectionItem[i].Component).Kind := dtkTime ;
           TDateTimePicker(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TDateTimePicker(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TDateTimePicker(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TDateTimePicker(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'D'
          if (EditCollectionItem[i].SControlType = 'D') then
          begin
           EditCollectionItem[i].Component := TDateTimePicker.Create(OnWinControl);
           TDateTimePicker(EditCollectionItem[i].Component).MinDate := EncodeDate(1800,1,1);
           TDateTimePicker(EditCollectionItem[i].Component).MaxDate := EncodeDate(2900,1,1);

           TDateTimePicker(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TDateTimePicker(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX   ;
           TDateTimePicker(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TDateTimePicker(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TDateTimePicker(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TDateTimePicker(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           CreateLabel  ;
          end else // End type 'D'

          if EditCollectionItem[i].SControlType = 'B' then
          begin
           EditCollectionItem[i].Component := TCheckBox.Create(OnWinControl);
           TCheckBox(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TCheckBox(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX   ;
           TCheckBox(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TCheckBox(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TCheckBox(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TCheckBox(EditCollectionItem[i].Component).Caption := '' ;
           TCheckBox(EditCollectionItem[i].Component).OnMouseDown := CheckBoxMouseDown ;
           TCheckBox(EditCollectionItem[i].Component).State := cbGrayed  ;

           TCheckBox(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           EditCollectionItem[i].TextLabel := TLabel.Create(OnWinControl) ;
            CreateLabel ; 
          end else // End type 'B'
          if EditCollectionItem[i].SControlType = 'IC' then
          begin
           EditCollectionItem[i].Component := TCheckListBox.Create(OnWinControl);
           TCheckListBox(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TCheckListBox(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX ;
           TCheckListBox(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TCheckListBox(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TCheckListBox(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TCheckListBox(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           If Pos('GROUPS',EditCollectionItem[i].LLOOKUPSQL) = 1 then
           begin
             TDataBaseRoutines.FillStringsWithReportingGroups(TCheckListBox(EditCollectionItem[i].Component).Items,StrToIntDef( Copy(EditCollectionItem[i].LLOOKUPSQL,7,20),0));
           end else
           begin
           try
           AQuery := TuniQuery.Create(nil) ;
            try
             AQuery.Connection := DMTCCoreLink.TheZConnection ;

             AQuery.sql.Text :=  EditCollectionItem[i].LLOOKUPSQL ;
             AQuery.open ;
             while not AQuery.eof do
                 begin
                    if AQuery.Fields[1].FieldName ='TRN' then
                      TCheckListBox(EditCollectionItem[i].Component).Items.AddObject(DMTCCoreLink.GetTextLang(AQuery.fields[1].AsInteger), Tobject(AQuery.Fields[0].asinteger)) 

                    else
                    TCheckListBox(EditCollectionItem[i].Component).Items.AddObject(AQuery.fields[1].asstring,Tobject(AQuery.Fields[0].asinteger)) ;
                    AQuery.next ;
                 end;
            finally
              AQuery.free ;
            end;
            except
               TCheckListBox(EditCollectionItem[i].Component).Items.Add('SQL error') ;
               // dont handel
            end;
            end;
            CreateLabel  ;
          end else // End type 'IC'

          if EditCollectionItem[i].SControlType = 'IL' then
          begin
           EditCollectionItem[i].Component := TComboBox.Create(OnWinControl);
           TComboBox(EditCollectionItem[i].Component).Parent := OnWinControl ;
           TComboBox(EditCollectionItem[i].Component).Left := EditCollectionItem[i].WControlX ;
           TComboBox(EditCollectionItem[i].Component).Top := EditCollectionItem[i].WControlY ;
           TComboBox(EditCollectionItem[i].Component).Width :=  EditCollectionItem[i].WControlWidth ;
           TComboBox(EditCollectionItem[i].Component).Height :=  EditCollectionItem[i].WControlHeigth ;
           TComboBox(EditCollectionItem[i].Component).OnKeyPress := OnEditControlKeyPress ;
           If Pos('GROUPS',EditCollectionItem[i].LLOOKUPSQL) = 1 then
           begin
             TDataBaseRoutines.FillStringsWithReportingGroups(TComboBox(EditCollectionItem[i].Component).Items,StrToIntDef( Copy(EditCollectionItem[i].LLOOKUPSQL,7,20),0));
           end else
           begin

           // add empty item
           TComboBox(EditCollectionItem[i].Component).Items.Append(DMTCCoreLink.GetTextLang(20046));
           try
           AQuery := TuniQuery.Create(nil) ;
            try
             AQuery.Connection := DMTCCoreLink.TheZConnection ;
             if copy(EditCollectionItem[i].LLOOKUPSQL,1,1) = '*' then
              begin
                AQuery.sql.Text := TDatabaseTableRoutines.ReplaceParams(copy( EditCollectionItem[i].LLOOKUPSQL,2,length(EditCollectionItem[i].LLOOKUPSQL)),SUBKEY +'=1'+#13+#10+'KEY=1');
                TComboBox(EditCollectionItem[i].Component).OnDropDown := onDropdown ;
                TComboBox(EditCollectionItem[i].Component).tag := Integer(EditCollectionItem[i]);
              end else
             AQuery.sql.Text :=  TDatabaseTableRoutines.ReplaceParams(EditCollectionItem[i].LLOOKUPSQL,SUBKEY +'=1'+#13+#10+'KEY=1');
             AQuery.open ;
             if AQuery.Fields[0].FieldName ='SINGLE' then
                TComboBox(EditCollectionItem[i].Component).tag := 1 ;

             while not AQuery.eof do
                 begin
                     if AQuery.Fields[0].FieldName ='SINGLE' then
                       begin
                        TComboBox(EditCollectionItem[i].Component).Items.Add(AQuery.fields[0].AsString) ;
                       end  else
                     if AQuery.Fields[1].FieldName ='TRN' then
                        TComboBox(EditCollectionItem[i].Component).Items.AddObject(DMTCCoreLink.GetTextLang(AQuery.fields[1].AsInteger),Tobject(AQuery.Fields[0].asinteger))
                       else
                        TComboBox(EditCollectionItem[i].Component).Items.AddObject(AQuery.fields[1].asstring,Tobject(AQuery.Fields[0].asinteger)) ;
                    AQuery.next ;
                 end;
            finally
              AQuery.free ;
            end;
            except
              TComboBox(EditCollectionItem[i].Component).Items.Add('SQL error') ;
               // dont handel
            end;
            end;
            if TComboBox(EditCollectionItem[i].Component).tag = 0 then
            begin
            TComboBox(EditCollectionItem[i].Component).Style := csDropDownList ;
            end ;

            CreateLabel  ;
          end; // End type 'IL'
    end;
end;

function TEditCollection.GetEditCollectionItem(
  index: Integer): TEditCollectionItem;
begin
  Result := TEditCollectionItem(Items[index]);
end;


procedure TEditCollection.osfSearchClick(Sender: TObject);
var
 aosfLookup : TosfLookup ;
 ExtraLookup,Searchname : String ;
 OldId : Integer ;
 aGenSearch : TGenSearch ;
begin
 ExtraLookup :=   TEditCollectionItem(TComponent(Sender).tag).LLOOKUPSQL ;
 if pos('@@GO@@',ExtraLookup) > 0 then
    begin
       Searchname := trim(copy(ExtraLookup,pos('@@GO@@',ExtraLookup)+6,length(ExtraLookup)));
       system.delete(ExtraLookup,pos('@@GO@@',ExtraLookup),length(ExtraLookup));
       aGenSearch := TGenSearch.Create(Application);
       try
         aGenSearch.AutoFieldCols :=True;
         aGenSearch.Init(Searchname);
         if aGenSearch.ShowModal = mrok then
            begin
               TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Tag := aGenSearch.DataSource1.DataSet.Fields[0].AsInteger ;
               TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Text :=
               varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(ExtraLookup,'ID='+
               IntToStr(TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Tag)
               )));

            end;
       finally
        aGenSearch.free ;
       end;
      exit ;
    end;
 aosfLookup := TosfLookup.Create(nil) ;
  try

  aosfLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
  aosfLookup.SavePrefix := 'OSFSEARCH' ;
  aosfLookup.aOSAConnectionItem :=  DMTCCoreLink.TheOSAConnectionItem ;
  ExtraLookup :=   TEditCollectionItem(TComponent(Sender).tag).LLOOKUPSQL ;
  if trim(UpperCase(ExtraLookup)) ='POPUP' then
     ExtraLookup := '' ;
   OldId :=  TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Tag  ;

  case (copy(TEditCollectionItem(TComponent(Sender).tag).SControlType,2,1)+' ')[1] of
    'C' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(30),tcstCRED,tcltAccount,OldId,0,ExtraLookup);
    'D' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(31),tcstDEB,tcltAccount,OldId,0,ExtraLookup);
    'G' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(32),tcstGLONE,tcltAccount,OldId,0,ExtraLookup);
    'T' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(609),tcstTAX,tcltAccount,OldId,0,ExtraLookup);
    'B' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(29),tcstBANK,tcltAccount,OldId,0,ExtraLookup);
    'S' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(37),tcstALL,tcltStock,OldId,0,ExtraLookup);
    'A' : aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLangNoAmp(34),tcstALL,tcltAccount,OldId,0,ExtraLookup);
 end;
  if TEditCollectionItem(TComponent(Sender).tag).SControlType ='OS'then
  TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Text := TDataBaseStockRoutines.GetStockFullDescription(aosfLookup.ReturnID)
  else
  TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Text := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId (aosfLookup.ReturnID) + ' ' + TDataBaseRoutines.GetAccountDescription(aosfLookup.ReturnID) ;
  TEdit(TEditCollectionItem(TComponent(Sender).tag).Component).Tag := aosfLookup.ReturnID ;
 finally
   aosfLookup.free ;
 end;
end;


procedure TEditCollection.CheckBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbLeft then
    begin
      if TCheckBox(Sender).State = cbUnchecked then
       TCheckBox(Sender).State := cbChecked else
       if (TCheckBox(Sender).State = cbChecked) and (TCheckBox(Sender).AllowGrayed) then
       TCheckBox(Sender).State := cbGrayed else
       TCheckBox(Sender).State := cbUnchecked ;
       abort ;
    end;
end;


procedure TEditCollection.OnEditControlKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
    // todo selectnext
   end;
end;

procedure TEditCollection.SetEditCollectionItem(index: Integer;
  const Value: TEditCollectionItem);
begin
    Items[index].Assign(Value);
end;

procedure TEditCollection.ClearData;
var
 i : Integer ;
begin
   for i := 0 to Self.Count -1 do
      begin
        EditCollectionItem[i].clear ;
      end;
end;

procedure TEditCollection.CleanupControls;
var
 i : Integer ;
begin
  for i := 0 to self.Count -1 do
    begin
      if assigned(EditCollectionItem[i].Button)   then
         begin
          EditCollectionItem[i].Button.free ;
          EditCollectionItem[i].Button := nil ;
         end;
      if assigned(EditCollectionItem[i].Component)   then
         begin
          EditCollectionItem[i].Component.free ;
          EditCollectionItem[i].Component := nil ;
         end;

      if assigned(EditCollectionItem[i].TextLabel)   then
         begin
          EditCollectionItem[i].TextLabel.free ;
          EditCollectionItem[i].TextLabel := nil ;
         end;

    end;

end;

procedure TEditCollection.LookupKeyPress(Sender: TObject; var Key: Char);
begin
  Tbutton(TComponent(Sender).components[0]).Click ;
end;

procedure TEditCollection.OnMemoDblClick(sender: Tobject);
begin
if sender is TMemo then
  Tmemo(Sender).Text := TDatabaseRegistyRoutines.EditWithOpenOffice(Tmemo(Sender).Text) ;
end;

procedure TEditCollection.onDropdown(sender: TObject);
var
  AQuery :  TuniQuery ;
  Alastitemindex,EdititemIndex ,i: Integer ;
  PARAMS : String ;
begin

    EdititemIndex := -1 ;
   // add empty item
   Alastitemindex := TComboBox(sender).ItemIndex ;
   PARAMS := '' ;
   for i := 0 to Self.Count -1 do
     begin
        if 1 <> 0 then
          PARAMS := PARAMS + #13+#10 ;

         PARAMS := PARAMS + self.EditCollectionItem[i].SColumnOrigen + '=' + VarToStr(EditCollectionItem[i].GetValue) ;
        if  self.EditCollectionItem[i].Component = sender then
           EdititemIndex := i ;
     end;
   if EdititemIndex = -1 then raise Exception.Create('Component not found')  ;
   TComboBox(sender).Items.clear ;
   TComboBox(sender).Items.Append(DMTCCoreLink.GetTextLang(20046));
    try
           AQuery := TuniQuery.Create(nil) ;
            try


             AQuery.Connection := DMTCCoreLink.TheZConnection ;

             AQuery.sql.Text := TDatabaseTableRoutines.ReplaceParams(copy( self.EditCollectionItem[EdititemIndex].LLOOKUPSQL,2,length(self.EditCollectionItem[EdititemIndex].LLOOKUPSQL)),PARAMS );
             AQuery.open ;
             while not AQuery.eof do
                 begin
                     if AQuery.Fields[0].FieldName ='SINGLE' then
                       begin
                        TComboBox(self.EditCollectionItem[EdititemIndex].Component).Items.Add(AQuery.fields[0].AsString) ;
                       end  else
                     if AQuery.Fields[1].FieldName ='TRN' then
                        TComboBox(self.EditCollectionItem[EdititemIndex].Component).Items.AddObject(DMTCCoreLink.GetTextLang(AQuery.fields[1].AsInteger),Tobject(AQuery.Fields[0].asinteger))
                       else
                        TComboBox(self.EditCollectionItem[EdititemIndex].Component).Items.AddObject(AQuery.fields[1].asstring,Tobject(AQuery.Fields[0].asinteger)) ;
                    AQuery.next ;
                 end;
            finally
              AQuery.free ;
            end;
            except
              TComboBox(self.EditCollectionItem[TComboBox(sender).Tag-1].Component).Items.Add('SQL error') ;
               // dont handel
            end;
end;

{ TEditPanel }

procedure TEditPanel.Ondropdownchange(Sender: Tobject);
begin
  AScrollBox.ScrollInView(
  Tpanel(TComboBox(Sender).Items.Objects[TComboBox(Sender).ItemIndex])) ;
end;

procedure TEditPanel.BuildGui;
var
 i,x : Integer ;
 ADataSource : TDataSource ;

 ANav:THackDBNavigator ;
 Acolumn : TColumn ;
 APanel,bPanel : Tpanel ;

 AButton : TButton ;
 ADropDown : TComboBox ;
begin
  ADropDown := nil ;
  CleanupControls ;
  if not (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') then
  begin
  ATopBar := TPanel.create(self) ;
  ATopBar.Parent := self ;
  ATopBar.Align := alTop ;
  ATopBar.Height := 30 ;
  ADropDown := TComboBox.create(self);
  ADropDown.Parent := ATopBar ;
  ADropDown.Width := 200 ;
  ADropDown.Style :=  csDropDownList ;
  ADropDown.Top := 5 ;
  ADropDown.Left := 10 ;
  ADropDown.OnChange := Ondropdownchange ;

  AScrollBox := TScrollBox.Create(self);
  AScrollBox.Parent := self ;
  AScrollBox.Align := alClient ;
  end;
  APageControl := TPageControl.Create(self);
  APageControl.Parent := self ;
  APageControl.Align := alClient ;
  APageControl.Visible := (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') ;

  for i := 0 to EditFormCollection.Count -1 do
     begin
        EditFormCollection[i].TabSheet := TTabSheet.Create(APageControl);
        EditFormCollection[i].TabSheet.PageControl := APageControl ;
        EditFormCollection[i].TabSheet.Caption := EditFormCollection[i].SFORMDISPLAYNAME ;
        EditFormCollection[i].Scrollbox := TScrollBox.Create(APageControl);

        EditFormCollection[i].Scrollbox.Parent := EditFormCollection[i].TabSheet ;
        EditFormCollection[i].Scrollbox.Align := alclient ;
        EditFormCollection[i].Scrollbox.ParentColor := True ;
        if not (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') then
        begin
        bPanel := TPanel.Create(AScrollBox);
        bPanel.Align := alClient ;
        bPanel.Parent :=  EditFormCollection[i].Scrollbox ;
        ADropDown.Items.AddObject(EditFormCollection[i].SFORMDISPLAYNAME,bPanel) ;

        EditFormCollection[i].EditCollection.BuildGui(bPanel,EditForm,EditFormCollection[i].SSUBKEY );

        with aPanelTreeView.Add as TPanelTreeViewItem do
          begin
             Control := EditFormCollection[i].Scrollbox ;
             ItemName :=  EditFormCollection[i].SFORMDISPLAYNAME ;
             FDataSource := TDataSource.Create(AScrollBox);
             FDataSource.OnDataChange := OnDataChange ;
             FDataSource.DataSet :=  EditFormCollection[i].AQuery ;
             Order := i ;
          end;

        end else
         EditFormCollection[i].EditCollection.BuildGui(EditFormCollection[i].Scrollbox,EditForm,EditFormCollection[i].SSUBKEY );


        if (EditFormCollection[i].BMULTILINE) and not (Editor) then
           begin
              ADataSource :=  TDataSource.Create(APageControl) ;
              ADataSource.DataSet := EditFormCollection[i].AQuery ;


              APanel := Tpanel.Create(EditFormCollection[i].Scrollbox) ;
               if not (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') then
              APanel.parent := EditFormCollection[i].Scrollbox else
              APanel.parent := EditFormCollection[i].TabSheet ;

              APanel.Align := alTop ;
              APanel.Visible := false ;
              EditFormCollection[i].APanel :=  APanel ;
              AButton := TButton.Create(APanel) ;
              AButton.parent := APanel ;
              AButton.Left := 10 ;
              AButton.top := 5 ;
              AButton.Caption := 'Ok';
              AButton.OnClick := EditFormCollection[i].Bok;

              AButton := TButton.Create(APanel) ;
              AButton.parent := APanel ;
              AButton.Left := 110 ;
              AButton.top := 5 ;
              AButton.Caption := 'Cancel';
              AButton.OnClick := EditFormCollection[i].BCancel;


              AButton := TButton.Create(APanel) ;
              AButton.parent := APanel ;
              AButton.Left := 210 ;
              AButton.top := 5 ;
              AButton.Caption := 'Ok + New';
              AButton.OnClick := EditFormCollection[i].BokNew;


              EditFormCollection[i].AGrid := TDbGrid.Create(APageControl) ;
              EditFormCollection[i].AGrid.OnKeyPress := EditFormCollection[i].OnGridKeyDown ;
              EditFormCollection[i].AGrid.parent := EditFormCollection[i].Scrollbox ;
              EditFormCollection[i].AGrid.Align := alClient ;
              EditFormCollection[i].AGrid.DataSource := ADataSource ;
              EditFormCollection[i].AGrid.OnDblClick := EditFormCollection[i].DoubleClickGrid;
              EditFormCollection[i].AGrid.OnTitleClick := EditFormCollection[i].OnColumnClick;
           //    EditFormCollection[i].AGrid := aGrid ;
              ANav :=THackDBNavigator.Create(EditFormCollection[i].TabSheet) ;
              ANav.Buttons[nbInsert].OnClick := EditFormCollection[i].DBNavigatorInsertClick;
              ChangeDBNavigatorIcons(ANav);
              ANav.parent :=EditFormCollection[i].Scrollbox ;
              ANav.Align := altop ;
              ANav.DataSource := ADataSource ;
              EditFormCollection[i].ANAv := ANav ;
              for x := 0 to  EditFormCollection[i].EditCollection.Count -1 do
                 begin
                   Acolumn := EditFormCollection[i].AGrid.Columns.Add ;
                   Acolumn.Title.Caption :=  DMTCCoreLink.GetTextLangNoAmp(EditFormCollection[i].EditCollection[x].WColumnTranslation);
                   Acolumn.FieldName := EditFormCollection[i].EditCollection[x].SColumnOrigen ;
                   Acolumn.Width := EditFormCollection[i].EditCollection[x].WControlWidth ;



                   if (copy(EditFormCollection[i].EditCollection[x].SControlType,1,1) = 'O') then
                     begin
                       Acolumn.Alignment := taLeftJustify ;
                       Acolumn.ReadOnly := true ;

                     end;
                   if  (EditFormCollection[i].EditCollection[x].SControlType  = 'IL') then
                     begin
                       Acolumn.Alignment := taLeftJustify ;
                       Acolumn.ReadOnly := true ;
                     end;

                 end;
           end;
     end;
  if not (DMTCCoreLink.ExtraOptions.Values['BUSETABSINSTOCK'] = 'TRUE') then
  begin
   aPanelTreeView.MoreRows := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS','ROWS'),0) ;
   aPanelTreeView.Construct(AScrollBox);
   if ADropDown.Items.Count > 0 then
     ADropDown.ItemIndex := 0 ;
   end;

end;

constructor TEditPanel.Create(AOwner: TComponent);
begin
  inherited;
  EditFormCollection := TEditFormCollection.Create(self,TEditFormCollectionItem) ;
  aPanelTreeView := TPanelTreeView.Create(self,TPanelTreeViewItem) ;
  //DoubleBuffered := true ;
end;

destructor TEditPanel.Destroy;
begin
  aPanelTreeView.ClearItems ; 
  EditFormCollection.free ;
  aPanelTreeView.free ;
  inherited;
end;


procedure TEditPanel.UpdateFromActiveControl(AControl: TControl);
var
 i , x : Integer ;
begin
 for i :=  0 to EditFormCollection.Count -1 do
    begin
     for x := 0 to EditFormCollection[i].EditCollection.Count -1 do
       if EditFormCollection[i].EditCollection[x].Component = AControl then
          begin
            EditFormCollection[i].EditCollection[x].WControlX := AControl.Left ;
            EditFormCollection[i].EditCollection[x].WControly := AControl.Top ;
            EditFormCollection[i].EditCollection[x].WControlWidth := AControl.Width ;
            EditFormCollection[i].EditCollection[x].WControlHeigth := AControl.Height ;
            if EditFormCollection[i].EditCollection[x].SControlType ='' then
               raise Exception.Create('Control type is empty! for ' + FEditType);
            if (EditFormCollection[i].EditCollection[x].SControlType[1] in ['O']) then
               begin
                EditFormCollection[i].EditCollection[x].WControlX := AControl.Left - 42 ;
                EditFormCollection[i].EditCollection[x].WControly := AControl.Top ;
               end;
            if Assigned(EditFormCollection[i].EditCollection[x].TextLabel) then
               begin
                 TEdit(EditFormCollection[i].EditCollection[x].TextLabel).Left := EditFormCollection[i].EditCollection[x].WControlX  ;
                 TEdit(EditFormCollection[i].EditCollection[x].TextLabel).Top := EditFormCollection[i].EditCollection[x].WControly - 14;
               end;
            if Assigned(EditFormCollection[i].EditCollection[x].Button) then
               begin
                 TButton(EditFormCollection[i].EditCollection[x].Button).Left := EditFormCollection[i].EditCollection[x].WControlX ;
                 TButton(EditFormCollection[i].EditCollection[x].Button).Top := EditFormCollection[i].EditCollection[x].WControly ;
               end;
          end;
    end;
end;

procedure TEditPanel.SetEditType(AEditType: String;LimitTo : String;JustLoad : Boolean = False);
Var
 MainQuery,SubQuery : TuniQuery ;
 aEditFormCollectionItem :TEditFormCollectionItem ;
 AEditItem : TEditCollectionItem ;
 i : Integer ;
begin
 aEditFormCollectionItem := Nil ;
 FEditType := AEditType ;
 EditFormCollection.Clear ;
 MainQuery := TuniQuery.Create(nil) ;
 SubQuery := TuniQuery.Create(nil) ;
 try
 MainQuery.Connection := DMTCCoreLink.TheZConnection ;
 SubQuery.Connection := DMTCCoreLink.TheZConnection ;
 MainQuery.SQL.Text := 'select * from OSF_EDIT_FORM where SMASTERTABLE = ' + QuotedStr(FEditType) +' order by WOSF_EDIT_FORM_ID ';
 SubQuery.SQL.Text := 'select * from OSF_EDIT_FIELDS where SFORMNAME =  :SFORMNAME order by WOSF_EDIT_FIELDS_ID'  ;
 MainQuery.open ;
 while not MainQuery.eof do
    begin
      if LimitTo <> '' then
         if MainQuery.Fieldbyname('SFORMNAME').AsString <> LimitTo then
             begin
              MainQuery.next ;
              Continue ;
             end;
      aEditFormCollectionItem := (EditFormCollection.Add as TEditFormCollectionItem) ;
      aEditFormCollectionItem.WOSF_EDIT_FORM_ID :=  MainQuery.Fieldbyname('WOSF_EDIT_FORM_ID').AsInteger ;
      aEditFormCollectionItem.SFORMNAME :=  MainQuery.Fieldbyname('SFORMNAME').AsString ;
      aEditFormCollectionItem.SFORMDISPLAYNAME :=  MainQuery.Fieldbyname('SFORMDISPLAYNAME').AsString ;
      aEditFormCollectionItem.SMASTERTABLE :=  MainQuery.Fieldbyname('SMASTERTABLE').AsString ;
      aEditFormCollectionItem.STABLE :=  MainQuery.Fieldbyname('STABLE').AsString ;
      aEditFormCollectionItem.SPRIMARYKEY :=  MainQuery.Fieldbyname('SPRIMARYKEY').AsString ;
      aEditFormCollectionItem.SSUBKEY :=  MainQuery.Fieldbyname('SSUBKEY').AsString ;
      aEditFormCollectionItem.SNEXTIDSQL :=  MainQuery.Fieldbyname('SNEXTIDSQL').AsString ;
      aEditFormCollectionItem.BMULTILINE :=  MainQuery.Fieldbyname('BMULTILINE').AsInteger = 1 ;
     if not JustLoad then
      begin
      // columns

      if not(system.copy(aEditFormCollectionItem.SNEXTIDSQL,1,1) = '#') then
      begin
      aEditFormCollectionItem.AQuery.SQL.Text := 'select * from ' + aEditFormCollectionItem.STABLE + ' where ' + aEditFormCollectionItem.SSUBKEY +' =:' + aEditFormCollectionItem.SSUBKEY ;
      aEditFormCollectionItem.AQuery.Params[0].AsInteger := 0 ;
      aEditFormCollectionItem.AQuery.open ;
      TDatabaseTableRoutines.UpdateQuery(aEditFormCollectionItem.AQuery,aEditFormCollectionItem.STABLE,aEditFormCollectionItem.SPRIMARYKEY);
      aEditFormCollectionItem.AQuery.close ;
      end ;
      end;

      SubQuery.close ;
      SubQuery.params[0].AsString := aEditFormCollectionItem.SFORMNAME ;
      SubQuery.open ;
      while not SubQuery.eof do
        begin
          AEditItem :=   (aEditFormCollectionItem.EditCollection.add as TEditCollectionItem) ;
          AEditItem.Wosf_edit_fields_id := SubQuery.Fieldbyname('Wosf_edit_fields_id').AsInteger ;
          AEditItem.SColumnOrigen :=  SubQuery.Fieldbyname('SColumnOrigen').AsString ;
          AEditItem.WColumnTranslation := SubQuery.Fieldbyname('WColumnTranslation').AsInteger ;
          AEditItem.WControlX := SubQuery.Fieldbyname('WControlX').AsInteger ;
          AEditItem.WControly := SubQuery.Fieldbyname('WControly').AsInteger ;
          AEditItem.WControlWidth := SubQuery.Fieldbyname('WControlWidth').AsInteger ;
          AEditItem.WControlHeigth := SubQuery.Fieldbyname('WControlHeigth').AsInteger ;
          AEditItem.WLength := SubQuery.Fieldbyname('WLength').AsInteger ;
          AEditItem.SControlType := UpperCase(SubQuery.Fieldbyname('SControlType').AsString) ;
          AEditItem.LLOOKUPSQL := SubQuery.Fieldbyname('LLOOKUPSQL').AsString ;
          AEditItem.SDEFAULTVALUE := SubQuery.Fieldbyname('SDEFAULTVALUE').AsString ;
          AEditItem.BACTIVE := SubQuery.Fieldbyname('BACTIVE').AsInteger = 1 ;
          SubQuery.next ;
        end;
      MainQuery.next ;
    end;

  if  assigned(aEditFormCollectionItem) and (system.copy(aEditFormCollectionItem.SNEXTIDSQL,1,1) = '#') then
      begin

        aEditFormCollectionItem.AQuery.SQL.Text := 'select * from ' + aEditFormCollectionItem.STABLE + ' where ' + aEditFormCollectionItem.SSUBKEY +' =:' + aEditFormCollectionItem.SSUBKEY ;
        aEditFormCollectionItem.AQuery.Params[0].AsInteger := 0 ;

       aEditFormCollectionItem.AQuery.UpdateObject.ModifySQL.Text := 'update ' + aEditFormCollectionItem.STABLE + ' set '  ;
       for i := 0 to aEditFormCollectionItem.EditCollection.Count -1 do
         begin
             aEditFormCollectionItem.AQuery.UpdateObject.ModifySQL.add(aEditFormCollectionItem.EditCollection[i].SColumnOrigen +'=  :'+aEditFormCollectionItem.EditCollection[i].SColumnOrigen) ;
             if i <> (aEditFormCollectionItem.EditCollection.Count -1) then
             aEditFormCollectionItem.AQuery.UpdateObject.ModifySQL.add(',');
         end;

       aEditFormCollectionItem.AQuery.UpdateObject.ModifySQL.add( ' where  ' + aEditFormCollectionItem.SSUBKEY +' =:' + aEditFormCollectionItem.SSUBKEY ) ;


       // TDatabaseTableRoutines.UpdateQuery(aEditFormCollectionItem.AQuery,aEditFormCollectionItem.STABLE,aEditFormCollectionItem.SPRIMARYKEY);
       // aEditFormCollectionItem.AQuery.close ;
      end;
 finally
  MainQuery.free ;
  SubQuery.free ;
 end;
 if not JustLoad then
  if EditFormCollection.Count <> 0 then
   BuildGui ;

end;
procedure TEditPanel.CleanupControls;
var
 i : Integer ;
begin
  aPanelTreeView.ClearItems ;
  for i := 0 to EditFormCollection.Count -1 do
    begin
       EditFormCollection[i].EditCollection.CleanupControls ;
      if assigned(EditFormCollection[i].Scrollbox) then
         begin
          EditFormCollection[i].Scrollbox.Free ;
          EditFormCollection[i].Scrollbox := nil ;
         end;
      if assigned(EditFormCollection[i].TabSheet) then
         begin
          EditFormCollection[i].TabSheet.Free ;
          EditFormCollection[i].TabSheet := nil ;
         end;

    end;

if Assigned(APageControl) then FreeAndNil(APageControl) ;
if Assigned(AScrollBox) then FreeAndNil(AScrollBox) ;
if Assigned(ATopBar) then FreeAndNil(ATopBar) ;



end;

procedure TEditPanel.SetEditor(const Value: Boolean);
begin
  FEditor := Value;
end;

procedure  TEditFormCollectionItem.GetAccountDatasetDesc(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := TDataBaseRoutines.GetAccountFullDescription(sender.AsInteger);
end;

procedure TEditFormCollectionItem.GetStockDatasetDesc(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   Text := TDataBaseStockRoutines.GetStockFullDescription(sender.AsInteger);
end;

procedure TEditPanel.ExportData(AFilename: String; AProgress : TosFProgressEvent);
Var
 AStream : TFileStream ;
 i : Integer ;
begin
 AStream := TFileStream.Create(AFilename,fmCreate ) ;
 try
   for i :=0 to EditFormCollection.Count -1 do
      begin
         EditFormCollection[i].ExportDatatoStream(AStream,AProgress);
      end;
 finally
   AStream.free ;
 end;
end;

procedure TEditPanel.ImportData(AFilename: String; AProgress : TosFProgressEvent);
Var
 AStream : TFileStream ;
 i : Integer ;
 Line : String ;
 AChar : Char ;
 AStop  : Boolean ;
 ImpType : Integer ;
 Table ,ErrorString: String ;
begin
ErrorString := '' ;
 AStop := False ;
 AStream := TFileStream.Create(AFilename,fmOpenRead ) ;
 try
   Line := '' ;
   While AStream.Position < AStream.Size do
   begin
   if Assigned(AProgress) then
      AProgress(AStop,'Import datafile ',AStream.Size,AStream.Position,0 ) ;
    if AStop then raise Exception.Create('User stop import ' + AFilename);  

   AStream.Read(AChar,1) ;
   Line := Line + AChar ;
   If (pos(#13+#10,line) > 0) or ((AStream.Position = AStream.Size) and (Line <> '') )then
    begin
     for i :=0 to EditFormCollection.Count -1 do
        begin
         Table := EditFormCollection[i].STABLE ;


         ImpType := -1 ;
         if Pos(Table + #9,Line) = 1 then
           begin
              ImpType := 0 ;
           end else
          if Pos('@'+Table + #9,Line) = 1 then
          begin

           ImpType := 2 ;
          end else
          if Pos('#'+Table + #9,Line) = 1 then
          begin

           ImpType := 1 ;
          end;

         if ImpType <> -1 then
           try
            EditFormCollection[i].ImportDataFromLine(Line,ImpType);
           except
             on e:Exception do
                    ErrorString := ErrorString + #13+#10 + 'Pos ' + IntToStr(AStream.Position) + Line +' '  + e.Message ;

           end;
        end;
        Line := '' ;
      end;
   end;
 finally
   AStream.free ;
 end;
 if ErrorString <>'' then
   showmessage(ErrorString);

end;

{ TEditFormCollection }

procedure TEditFormCollection.Cancel;
var
 i : Integer ;
begin
  for i := 0 to self.Count -1 do
    begin
      EditFormCollection[i].AQuery.close  ;
    end;
end;



procedure TEditFormCollection.DeleteForCopy(Aid: Integer);
var
 i : Integer ;
begin
  for i := 0 to self.Count -1 do
   if DMTCCoreLink.ReadNwReportOp('FFCOPY'+EditFormCollection[i].STABLE ,True) then
    begin
      if not EditFormCollection[i].AQuery.Active then Continue ;
       if system.copy(EditFormCollection[i].SNEXTIDSQL,1,1) = '#' then
         continue   ;

      EditFormCollection[i].AQuery.First  ;
      while not EditFormCollection[i].AQuery.IsEmpty do
        begin
          EditFormCollection[i].AQuery.Delete;
        end;
      if EditFormCollection[i].AQuery.UpdatesPending then
         EditFormCollection[i].AQuery.ApplyUpdates ;
    end;
end;

procedure TEditFormCollection.Delete(Aid: Integer);
var
 i : Integer ;
begin
  for i := 0 to self.Count -1 do
    begin
      if not EditFormCollection[i].AQuery.Active then Continue ;
      if system.copy(EditFormCollection[i].SNEXTIDSQL,1,1) = '#' then
         continue   ;

      EditFormCollection[i].AQuery.First  ;
      while not EditFormCollection[i].AQuery.IsEmpty do
        begin
          EditFormCollection[i].AQuery.Delete;
        end;
      if EditFormCollection[i].AQuery.UpdatesPending then
         EditFormCollection[i].AQuery.ApplyUpdates ;
    end;
end;

function TEditFormCollection.GetEditFormCollectionItem(
  index: Integer): TEditFormCollectionItem;
begin
  result := self.items[index] as TEditFormCollectionItem ;
end;

procedure TEditFormCollection.Copy(Aid: Integer);
var
 i , x: Integer ;
 ACopyQuery : TuniQuery ;
begin

  ACopyQuery := TuniQuery.create(NIL) ;
  try
  ACopyQuery.Connection := DMTCCoreLink.TheZConnection ;

  for i := 0 to self.Count -1 do
    if DMTCCoreLink.ReadNwReportOp('FFCOPY'+EditFormCollection[i].STABLE ,True) then
    begin
       if system.copy(EditFormCollection[i].SNEXTIDSQL,1,1) = '#' then
         continue   ;

      ACopyQuery.SQL.Text := EditFormCollection[i].AQuery.SQL.Text ;
      ACopyQuery.Params[0].AsInteger  := Aid ;
      ACopyQuery.open ;

      EditFormCollection[i].AQuery.DisableControls ;
      try
      EditFormCollection[i].AQuery.close  ;
      EditFormCollection[i].AQuery.Params[0].AsInteger  := 0 ;
      EditFormCollection[i].AQuery.open ;
      while not ACopyQuery.eof do
         begin
            EditFormCollection[i].AQuery.insert ;
           for x := 0 to ACopyQuery.FieldCount -1 do
              begin
                if not ((CompareText(ACopyQuery.Fields[x].FieldName, EditFormCollection[i].SSUBKEY) = 0 )
                     or (CompareText(ACopyQuery.Fields[x].FieldName,EditFormCollection[i].SPRIMARYKEY)=0)) THEN
                 EditFormCollection[i].AQuery.FIELDS[X].Value := ACopyQuery.Fields[x].Value
                 else
                 EditFormCollection[i].AQuery.FIELDS[X].AsInteger := -1 ;
              end;
          EditFormCollection[i].AQuery.Post ;
          ACopyQuery.next ;
         end;
        finally
          EditFormCollection[i].AQuery.EnableControls ;
        end;
        EditFormCollection[i].DataSetToGui ;
    end;
    finally
      ACopyQuery.Free ;
    end;
end;


procedure TEditFormCollection.Load(Aid: Integer);
var
 i : Integer ;
 Lastid : Integer ;
begin
  Lastid := Aid ;
  for i := 0 to self.Count -1 do
    begin
      Aid :=Lastid ;
      EditFormCollection[i].CheckAltID(Aid,AltKeyList);
      EditFormCollection[i].AQuery.close  ;
      EditFormCollection[i].AQuery.Params[0].AsInteger  := Aid ;
      EditFormCollection[i].AQuery.open ;

      if EditFormCollection[i].BMULTILINE then
        begin
           EditFormCollection[i].AGrid.Visible := true ;
           EditFormCollection[i].ANAv.Visible := true ;
           EditFormCollection[i].APanel.Visible := false ;
        end else
        begin
          if EditFormCollection[i].AQuery.IsEmpty then
          begin
           if not(system.copy(EditFormCollection[i].SNEXTIDSQL,1,1) = '#') then
            begin
              EditFormCollection[i].AQuery.Insert ;
              EditFormCollection[i].AQuery.FieldByName(EditFormCollection[i].SSUBKEY).AsInteger := Aid ;
            end;
          end;
        end;
      EditFormCollection[i].DataSetToGui ;
    end;
end;

procedure TEditFormCollection.Save(Aid: Integer);
var
 i : Integer ;
 Lastid : Integer ;
begin
  Lastid := Aid ;
  for i := 0 to self.Count -1 do
    begin
      if not EditFormCollection[i].AQuery.Active then Continue ;

      Aid :=Lastid ;
      EditFormCollection[i].CheckAltID(Aid,AltKeyList);
      if (not EditFormCollection[i].BMULTILINE) or (not EditFormCollection[i].AGrid.Visible)then
      EditFormCollection[i].GuiToDataSet ;



      if (EditFormCollection[i].AQuery.State in [dsedit,dsinsert]) then
          EditFormCollection[i].AQuery.Post ;
      EditFormCollection[i].AQuery.first ;
      while not EditFormCollection[i].AQuery.eof do
      begin
      EditFormCollection[i].AQuery.Edit ;
      if EditFormCollection[i].AQuery.FieldByName(EditFormCollection[i].SSUBKEY).AsInteger <> Aid then
             begin
               EditFormCollection[i].AQuery.FieldByName(EditFormCollection[i].SSUBKEY).AsInteger := Aid ;
             end;
      if EditFormCollection[i].AQuery.FieldByName(EditFormCollection[i].SPRIMARYKEY).AsInteger = -1 then
             begin
               EditFormCollection[i].AQuery.FieldByName(EditFormCollection[i].SPRIMARYKEY).AsInteger := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(EditFormCollection[i].SNEXTIDSQL)),1) ;
             end;
      EditFormCollection[i].AQuery.Post ;
      EditFormCollection[i].AQuery.next ;
      end;
      if EditFormCollection[i].AQuery.UpdatesPending then
         EditFormCollection[i].AQuery.ApplyUpdates ;        
    end;
end;

procedure TEditFormCollection.SetEditFormCollectionItem(index: Integer;
  const Value: TEditFormCollectionItem);
begin
  self.items[index].Assign(Value);
end;

procedure TEditFormCollection.CheckCreateTableAndFields;
var
 i : Integer ;
begin
  for i := 0 to Self.Count -1 do
    Self.GetEditFormCollectionItem(i).CheckCreateTableAndFields ;
end;

constructor TEditFormCollection.Create(AOwner: TPersistent;
  ItemClass: TCollectionItemClass);
begin
  inherited Create( AOwner,ItemClass);
  AltKeyList := TStringList.Create ;
end;

destructor TEditFormCollection.Destroy;
begin
  AltKeyList.Free ;
  inherited;
end;

{ TEditFormCollectionItem }

procedure TEditFormCollectionItem.AfterInsert(DataSet: TDataSet);
var
 i : Integer ;
begin
if AQuery.ControlsDisabled then exit ;

 AQuery.FieldByName(SPRIMARYKEY).AsInteger := -1 ;
 AQuery.FieldByName(SSUBKEY).AsInteger := -1 ;

// if BMULTILINE then
    begin
     for i := 0 to EditCollection.Count -1 do
    begin
       if AQuery.FindField(EditCollection[i].SColumnOrigen) <> nil then
         if EditCollection[i].SDEFAULTVALUE <> '' then
          begin
            if pos('SELECT' , trim(UpperCase(EditCollection[i].SDEFAULTVALUE))) = 1 then
              AQuery.FindField(EditCollection[i].SColumnOrigen).asstring := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(EditCollection[i].SDEFAULTVALUE))
            else
            if EditCollection[i].SDEFAULTVALUE = '@' then
              begin

              if  aQuery.RecNo  =  0  then
                AQuery.FindField(EditCollection[i].SColumnOrigen).asstring := IntToStr(1)
              else
                AQuery.FindField(EditCollection[i].SColumnOrigen).asstring := IntToStr(aQuery.RecNo)
              end  else
                AQuery.FindField(EditCollection[i].SColumnOrigen).asstring := EditCollection[i].SDEFAULTVALUE ;

          end;
    end;
    if BMULTILINE then
       DoubleClickGrid(self);
       // look for def lookup
      if not BInImport then 
         for i := 0 to EditCollection.Count -1 do
          begin

               if  copy(EditCollection[i].SControlType,1,1) = 'O' then
                begin

                  if UpperCase((EditCollection[i].LLOOKUPSQL)) = 'POPUP' then
                    begin
                      Tbutton(EditCollection[i].Button).OnClick(EditCollection[i].Button);
                    end;
                end;
          end;

    end;
end;

procedure TEditFormCollectionItem.BCancel(Sender: Tobject);
begin
 if AQuery.State <> dsBrowse then
    AQuery.Cancel ;
 AGrid.Visible := true ;
 ANAv.Visible := true ;
 APanel.Visible := false ;
end;

procedure TEditFormCollectionItem.Bok(Sender: Tobject);
begin
 GuiToDataSet ;
 AGrid.Visible := true ;
 ANAv.Visible := true ;
 APanel.Visible := false ;
 AQuery.Post ;
end;

constructor TEditFormCollectionItem.Create(Collection: TCollection);
begin
  inherited;
  AGrid := nil ;
  EditCollection := TEditCollection.create(TEditCollectionItem) ;
  AQuery:= TuniQuery.Create(nil) ;
  AQuery.CachedUpdates := true ;
  AQuery.AfterInsert := AfterInsert;
  AupdateQuery := TUniUpdateSql.Create(nil) ;
  AQuery.UpdateObject := AupdateQuery ;
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
end;

 procedure TEditFormCollectionItem.DBNavigatorInsertClick(Sender: TObject);
var
  DBNavigator: TDBNavigator;
begin
  DBNavigator := ((Sender as TControl).Parent as TDBNavigator);
  if Assigned(DBNavigator.DataSource) and (DBNavigator.DataSource.State <> dsInactive) then
  begin
    if Assigned(DBNavigator.BeforeAction) then
      DBNavigator.BeforeAction(DBNavigator, nbInsert);

    DBNavigator.DataSource.DataSet.Append;

    if Assigned(DBNavigator.OnClick) then
      DBNavigator.OnClick(DBNavigator, nbInsert);
  end;
end;


procedure TEditFormCollectionItem.DataSetToGui;
var
 i,x : Integer ;
 MyQuery : TuniQuery ;

begin
  if not  AQuery.Active then exit ;
 EditCollection.ClearData ;
 for i := 0 to EditCollection.Count -1 do
   begin
            if (copy(EditCollection[i].SControlType,1,1) = 'O') then
                  begin
                    AQuery.FieldByName(EditCollection[i].SColumnOrigen).tag := i+1 ;
                    if pos('@@GO@@',EditCollection[i].LLOOKUPSQL) > 0 then
                        AQuery.FieldByName(EditCollection[i].SColumnOrigen).OnGetText := GetLookupGENDatasetDesc
                     else
                    if  (copy(EditCollection[i].SControlType,2,1) = 'S')  then
                       AQuery.FieldByName(EditCollection[i].SColumnOrigen).OnGetText := GetStockDatasetDesc
                      else
                       AQuery.FieldByName(EditCollection[i].SColumnOrigen).OnGetText :=   GetAccountDatasetDesc ;

                  end else
                 if (copy(EditCollection[i].SControlType,1,1) = 'M') then
                  begin
                     AQuery.FieldByName(EditCollection[i].SColumnOrigen).OnGetText :=   GetMemoDatasetDesc ;
                  end else
            if  EditCollection[i].SControlType  = 'IL'  then
                  begin
                       AQuery.FieldByName(EditCollection[i].SColumnOrigen).tag := i+1 ;
                       AQuery.FieldByName(EditCollection[i].SColumnOrigen).OnGetText := GetLookupDatasetDesc ;
                        if copy(EditCollection[i].LLOOKUPSQL,1,1) = '*' then
                           Continue ;
                       if pos('<@',EditCollection[i].LLOOKUPSQL) > 0 then
                       begin
                         TComboBox(EditCollection[i].Component).Items.text := DMTCCoreLink.GetTextLang(20046);

                       try
                       MyQuery := TuniQuery.Create(nil) ;
                        try
                         MyQuery.Connection := DMTCCoreLink.TheZConnection ;


                         MyQuery.sql.Text :=  TDatabaseTableRoutines.ReplaceParams(EditCollection[i].LLOOKUPSQL,TDatabaseTableRoutines.GetDatasetAsParamString(AQuery)+#13+#10+'KEY=' + AQuery.Params[0].AsString )  ;
                         MyQuery.open ;
                         while not MyQuery.eof do
                             begin
                                 if MyQuery.Fields[0].FieldName ='SINGLE' then
                                   begin
                                    TComboBox(EditCollection[i].Component).Items.Add(MyQuery.fields[0].AsString) ;
                                    TComboBox(EditCollection[i].Component).tag := 1 ;

                                   end  else
                                 if MyQuery.Fields[1].FieldName ='TRN' then
                                    TComboBox(EditCollection[i].Component).Items.AddObject(DMTCCoreLink.GetTextLang(MyQuery.fields[1].AsInteger),Tobject(MyQuery.Fields[0].asinteger))
                                   else
                                    TComboBox(EditCollection[i].Component).Items.AddObject(MyQuery.fields[1].asstring,Tobject(MyQuery.Fields[0].asinteger)) ;
                                MyQuery.next ;
                             end;
                        finally
                          MyQuery.free ;
                        end;
                        except
                          TComboBox(EditCollection[i].Component).Items.Add('SQL error') ;
                           // dont handel
                        end;
                     end;



 
                  end else
            if  EditCollection[i].SControlType  = 'D'  then
                  begin
                       if AQuery.FieldByName(EditCollection[i].SColumnOrigen) is TDateTimeField then
                         (AQuery.FieldByName(EditCollection[i].SColumnOrigen) as TDateTimeField).DisplayFormat := ShortDateFormat ;
                  end else
            if  EditCollection[i].SControlType  = 'T'  then
                  begin
                       if AQuery.FieldByName(EditCollection[i].SColumnOrigen) is TDateTimeField then
                         (AQuery.FieldByName(EditCollection[i].SColumnOrigen) as TDateTimeField).DisplayFormat := ShortTimeFormat ;
                  end else
            if  EditCollection[i].SControlType  = 'F'  then
                  begin

                    TEdit(EditCollection[i].Component).OnKeyPress := ControlKeyDown ;
                    


                    if AQuery.FieldByName(EditCollection[i].SColumnOrigen) is TFloatField then
                     if (AQuery.FieldByName(EditCollection[i].SColumnOrigen) as TFloatField).Precision = 2 then
                        (AQuery.FieldByName(EditCollection[i].SColumnOrigen) as TFloatField).DisplayFormat :=  '0.00' else
                        (AQuery.FieldByName(EditCollection[i].SColumnOrigen) as TFloatField).DisplayFormat :=  '0.00########' 


                  end;




     if not AQuery.IsEmpty then
      if AQuery.FindField(EditCollection[i].SColumnOrigen) <> nil then
         begin
          if AQuery.FindField(EditCollection[i].SColumnOrigen) is Tblobfield then
           EditCollection[i].SetValue(BlobFieldToString(AQuery.FindField(EditCollection[i].SColumnOrigen)as Tblobfield ))
              else
             EditCollection[i].SetValue(AQuery.FindField(EditCollection[i].SColumnOrigen).Value) ;



         end;
   end;
   // Do all special IML
 for i := 0 to EditCollection.Count -1 do
   begin
      if  EditCollection[i].SControlType  = 'IL'  then
       if copy(EditCollection[i].LLOOKUPSQL,1,1) = '*' then
           begin
              TComboBox(EditCollection[i].Component).OnDropDown(EditCollection[i].Component) ;
               if AQuery.FindField(EditCollection[i].SColumnOrigen) <> nil then
                       begin
                           if AQuery.FindField(EditCollection[i].SColumnOrigen) is Tblobfield then
                           EditCollection[i].SetValue(BlobFieldToString(AQuery.FindField(EditCollection[i].SColumnOrigen)as Tblobfield))

                           else
                           EditCollection[i].SetValue(AQuery.FindField(EditCollection[i].SColumnOrigen).Value) ;
                       end;
           end;
  end;
end;

destructor TEditFormCollectionItem.Destroy;
begin
  AQuery.free ;
  AupdateQuery.free ;
  EditCollection.free ;
  inherited;
end;



procedure TEditFormCollectionItem.DoubleClickGrid(Sender: Tobject);
var
 OldParent : TWinControl ;
 OldPoint : Tpoint ;
 OldVisible : Boolean ;

 NewForm : Tform ;
begin
  if (Sender is TDBGrid) and not (BInImport) then
  if (Sender as TDBGrid).SelectedField <> nil then
  if  not (Sender as TDBGrid).SelectedField.DataSet.IsEmpty then
    if (Sender as TDBGrid).SelectedField.Tag <> 0 then
      begin
        if copy(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].SControlType,1,1) = 'O' then
         begin
            EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].SetValue((Sender as TDBGrid).SelectedField.value);
            Tbutton(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Button).Click ;
            if (Sender as TDBGrid).SelectedField.DataSet.State = dsbrowse then
               (Sender as TDBGrid).SelectedField.DataSet.Edit ;
            (Sender as TDBGrid).SelectedField.AsInteger :=  EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component.Tag ;
            exit ;
         end;
        if  EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].SControlType  = 'IL' then
         begin
            NewForm := Tform.Create(nil);
            try
            EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].SetValue((Sender as TDBGrid).SelectedField.value);
            newform.Height := 205 ;
            newform.Caption := (Sender as TDBGrid).SelectedField.DisplayLabel ;
            newform.Width := TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Width + 40 ;
            if newform.Width < 260 then
               newform.Width := 260 ;

            newform.Top :=  Mouse.CursorPos.Y -250;
            newform.Left :=  Mouse.CursorPos.X - 100 ;
            With TBitBtn.Create(NewForm) do
              begin
                parent := NewForm ;
                Top := 120 ;
                Left := 160 ;
                Caption := 'Ok' ;
                Width := 90 ;
                ModalResult := mrok ;
              end;
            With TBitBtn.Create(NewForm) do
              begin
                parent := NewForm ;
                Top := 120 ;
                Left := 5 ;
                Width := 90 ;
                Caption := 'Cancel' ;
                ModalResult := mrCancel ;
              end;
             OldVisible := TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Visible ;
             OldParent := TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Parent ;
             OldPoint.X := TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Left ;
             OldPoint.y := TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Top ;
             try
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Parent := NewForm ;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Left := 5 ;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Top := 10 ;
             if  NewForm.ShowModal = mrok then
               begin
                  (Sender as TDBGrid).SelectedField.DataSet.DisableControls ;
                  try

                  if (Sender as TDBGrid).SelectedField.DataSet.State = dsbrowse then
                     (Sender as TDBGrid).SelectedField.DataSet.Edit ;

                  (Sender as TDBGrid).SelectedField.Value :=  EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].GetValue ;
                  finally
                    (Sender as TDBGrid).SelectedField.DataSet.EnableControls ;
                  end;
                end;
             finally
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Parent := OldParent;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Visible := OldVisible;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Left := OldPoint.X  ;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).Top := OldPoint.y  ;
             TComboBox(EditCollection[(Sender as TDBGrid).SelectedField.Tag-1].Component).SendToBack ;
             end;
            finally
              NewForm.free ;
            end;
            exit ;
         end;

      end  ;
  If AQuery.IsEmpty then
     AQuery.Insert ;

  DataSetToGui ;
  if Assigned(AGrid) then
   begin
   AGrid.Visible := false ;
   ANAv.Visible := false ;
   end;
  APanel.Visible := true ;
end;

procedure TEditFormCollectionItem.GuiToDataSet;
var
 Value : Variant ;
 i : Integer ;
begin
 if not  AQuery.Active then exit ;
 if not BMULTILINE then
    begin

        AQuery.First ;
    end;
 if system.copy(SNEXTIDSQL,1,1) = '#' then
        if (AQuery.IsEmpty or (AQuery.State = dsinsert)) then
          begin
           exit ;
           AQuery.Cancel ;
          end;

 if AQuery.IsEmpty then
    begin
      AQuery.Append ;
      AQuery.FieldByName(SPRIMARYKEY).AsInteger := -1 ;
      AQuery.FieldByName(SSUBKEY).AsInteger := AQuery.Params[0].AsInteger ;
    end else
    begin
      AQuery.edit ;
      if AQuery.FieldByName(SPRIMARYKEY).AsInteger = 0 then
         AQuery.FieldByName(SPRIMARYKEY).AsInteger := -1 ;
    end;

 for i := 0 to EditCollection.Count -1 do
   begin
      if AQuery.FindField(EditCollection[i].SColumnOrigen) <> nil then
         begin
             Value := EditCollection[i].GetValue ;
             AQuery.FindField(EditCollection[i].SColumnOrigen).ReadOnly := False ;
             if varToStr(Value) = '' then
             AQuery.FindField(EditCollection[i].SColumnOrigen).Clear
             else
             AQuery.FindField(EditCollection[i].SColumnOrigen).Value :=  value ;
         end;
   end;
   if not BMULTILINE then
    begin
      AQuery.post ;
      AQuery.Next ;

      while AQuery.RecordCount > 1 do
         AQuery.Delete ;
    end;

end;


procedure TEditFormCollectionItem.SaveToDatabase(Aformname : String);

Var
 AQuery : TuniQuery ;
 AUpdateComponent : TUniUpdateSql ;
 i  ,MaxId : Integer ;
begin
  AQuery := TuniQuery.Create(nil) ;
  AUpdateComponent := TUniUpdateSql.Create(nil) ;
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;

   MaxId := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select coalesce(max(WOSF_EDIT_FIELDS_ID),1) from OSF_EDIT_FIELDS')),1) ;
   //GuiToObject ;
   for i := 0 to EditCollection.Count -1 do
      begin
        if  EditCollection[i].Wosf_edit_fields_id > MaxId then
            MaxId := EditCollection[i].Wosf_edit_fields_id ;
      end;

   AQuery.sql.Text := 'select * from OSF_EDIT_FIELDS where SFORMNAME = ' + QuotedStr(Aformname) ;
   AQuery.UpdateObject := AUpdateComponent ;
   
   AQuery.open ;
   TDatabaseTableRoutines.UpdateQuery(AQuery,'OSF_EDIT_FIELDS',['WOSF_EDIT_FIELDS_ID']);
   for i := 0 to Self.EditCollection.Count -1 do
      begin
         if AQuery.Locate('Wosf_edit_fields_id',Self.EditCollection[i].Wosf_edit_fields_id,[]) then
            AQuery.edit
         else
           AQuery.Insert ;
           if Self.EditCollection[i].Delete then
             begin
                if AQuery.State = dsEdit then
                  begin
                   AQuery.Cancel ;
                   AQuery.Delete ;
                   Continue ;
                  end else
                  begin
                     AQuery.Cancel ;
                     Continue ;
                  end;
             end;


           AQuery.FieldByName('WOSF_EDIT_FIELDS_ID').AsInteger := Self.EditCollection[i].Wosf_edit_fields_id;
           if  Self.EditCollection[i].Wosf_edit_fields_id = 0 then
             begin
                inc(MaxId) ;
                AQuery.FieldByName('WOSF_EDIT_FIELDS_ID').AsInteger := MaxId ;
             end;
           AQuery.FieldByName('SColumnOrigen').AsString := Self.EditCollection[i].SColumnOrigen  ;
           AQuery.FieldByName('WColumnTranslation').AsInteger := Self.EditCollection[i].WColumnTranslation  ;
           AQuery.FieldByName('WControlX').AsInteger := Self.EditCollection[i].WControlX  ;
           AQuery.FieldByName('WControly').AsInteger := Self.EditCollection[i].WControly  ;
           AQuery.FieldByName('WControlWidth').AsInteger := Self.EditCollection[i].WControlWidth  ;
           AQuery.FieldByName('WControlHeigth').AsInteger := Self.EditCollection[i].WControlHeigth  ;
           AQuery.FieldByName('SControlType').AsString := Self.EditCollection[i].SControlType  ;
           AQuery.FieldByName('WLength').AsInteger := Self.EditCollection[i].WLength  ;
           AQuery.FieldByName('LLOOKUPSQL').AsString :=Self.EditCollection[i].LLOOKUPSQL ;
           AQuery.FieldByName('SDEFAULTVALUE').AsString :=Self.EditCollection[i].SDEFAULTVALUE ;
           AQuery.FieldByName('BACTIVE').Asinteger :=ord(Self.EditCollection[i].BACTIVE) ;
           AQuery.FieldByName('SFORMNAME').AsString := Aformname ;
           AQuery.Post ;
      end;
  finally
   AQuery.free ;
   AUpdateComponent.free ;
  end;
end;


procedure TSearchPanel.SetEditor(const Value: Boolean);
begin
  FEditor := Value;
end;

procedure TEditFormCollectionItem.BokNew(Sender: Tobject);
begin
 GuiToDataSet ;
 AQuery.Post ;
 AQuery.Append ;
 // DataSetToGui ;
end;

procedure TEditFormCollectionItem.GetLookupDatasetDesc(Sender: TField;
  var Text: String; DisplayText: Boolean);
  Var
   MyItems : TStrings ;
   MyIndex : Integer ;
begin
 if EditCollection.GetEditCollectionItem(sender.Tag-1).Component <> nil then
   begin
     if StrToIntDef(Sender.AsString,-9999999) = -9999999 then
       begin
         Text := Sender.AsString ;
       end else
       begin
       MyItems := GetObjectProp(EditCollection.GetEditCollectionItem(sender.Tag-1).Component,'Items') as TStrings ;
        if MyItems <> nil then
        begin
          MyIndex := MyItems.IndexOfObject(TObject(Sender.AsInteger));
          if MyIndex <> -1 then
             Text := MyItems[MyIndex] ;
        end;
      end;
   end;
end;

procedure TEditFormCollectionItem.OnColumnClick(Column: TColumn);
begin
 if Column.Grid.DataSource <> nil then
   if (Column.Grid.DataSource.DataSet is TuniQuery) then
   begin
    if (Column.Grid.DataSource.DataSet as TuniQuery).IndexFieldNames <> Column.FieldName then
    (Column.Grid.DataSource.DataSet as TuniQuery).IndexFieldNames := Column.FieldName
    else
     begin
         (Column.Grid.DataSource.DataSet as TuniQuery).IndexFieldNames := Column.FieldName +' desc'  ;
     end;
    end;

end;

procedure TEditFormCollectionItem.ExportDatatoStream(AStream: Tstream; AProgress : TosFProgressEvent);
var
 Aline : String ;
 i : Integer ;
 AStop : Boolean ;
 ARes,Bres : variant ;
begin

   AStop := false ;
   AQuery.SQL.Text := 'select * from ' + STABLE  ;
   AQuery.open ;
   if Assigned(AProgress) then
      AProgress(AStop,'Export ' + STABLE ,AQuery.RecordCount,0,0);
    Aline := 'TYPEIMP' + #9 ;
    if  SSUBKEY <> SPRIMARYKEY then
      begin
         Aline := Aline +'PRIMARYKEY'+ #9   ;
      end;
   Aline := Aline +'SUBKEY'   ;
    for i := 0 to AQuery.FieldCount -1 do
     if not ((AQuery.Fields[i].FieldName = uppercase(SPRIMARYKEY)) or (AQuery.Fields[i].FieldName = uppercase(SSUBKEY))) then
        Aline := Aline +#9 + AQuery.Fields[i].FieldName   ;

    Aline := Aline + #13+ #10 ;
    AStream.Write(Aline[1],length(Aline)) ;

   while not AQuery.Eof do
     begin
     if Assigned(AProgress) then
      AProgress(AStop,'Export ' + STABLE ,AQuery.RecNo,0,0);
      if AStop then raise Exception.Create('Export ' + STABLE +' user stop!');
       Aline := STABLE ;
      if SSUBKEY <> SPRIMARYKEY then
         begin
         if SPRIMARYKEY = 'WSTOCKID' then
         Aline := Aline + #9 + TDataBaseStockRoutines.GetStockCode(AQuery.Fieldbyname(SPRIMARYKEY).AsInteger) ;
         if SPRIMARYKEY = 'WACCOUNTID' then
         Aline := Aline + #9 + TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(AQuery.Fieldbyname(SPRIMARYKEY).AsInteger) ;
         if SPRIMARYKEY = 'WGROUPID' then
         begin
         Aline := Aline + #9 + IntToStr(TDataBaseRoutines.GetGroupTypeFromGroupID(AQuery.Fieldbyname(SPRIMARYKEY).AsInteger)) + ':'+ TDataBaseRoutines.GetNesteldNameFromGroupID(AQuery.Fieldbyname(SPRIMARYKEY).AsInteger,0) ;
         end;

       end ;


       if SSUBKEY = 'WSTOCKID' then
       Aline := Aline + #9 + TDataBaseStockRoutines.GetStockCode(AQuery.Fieldbyname(SSUBKEY).AsInteger) ;
       if SSUBKEY = 'WACCOUNTID' then
       Aline := Aline + #9 + TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(AQuery.Fieldbyname(SSUBKEY).AsInteger) ;
       if SSUBKEY = 'WGROUPID' then
       begin
       Aline := Aline + #9 + IntToStr(TDataBaseRoutines.GetGroupTypeFromGroupID(AQuery.Fieldbyname(SSUBKEY).AsInteger)) + ':'+ TDataBaseRoutines.GetNesteldNameFromGroupID(AQuery.Fieldbyname(SSUBKEY).AsInteger,0) ;
       end;
       if SSUBKEY = 'WGROUPDESCID' then
       begin
        ARes := DMTCCoreLink.OpenSqlReturnFirstColumn('Select WGROUPID from GROUPS_DESCRIPTIONS where WGROUPDESCID =' + AQuery.Fieldbyname(SSUBKEY).AsString) ;
        Bres := DMTCCoreLink.OpenSqlReturnFirstColumn('Select WLANGUAGEID from GROUPS_DESCRIPTIONS where WGROUPDESCID =' + AQuery.Fieldbyname(SSUBKEY).AsString) ;
        if VarToStr(Bres) <> '' then
           begin
            Bres := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDESCRIPTION from GROUPS  where WGROUPID =' + VarToStr(Bres)) ;
           end;
       if VarToStr(Ares) <> '' then
        Aline := Aline + #9 +  IntToStr(TDataBaseRoutines.GetGroupTypeFromGroupID(ARes)) + ':'+ Bres + ':' + TDataBaseRoutines.GetNesteldNameFromGroupID(ARes,0) ;
       end;




       if SSUBKEY = 'WJOBPROJECTID' then
       Aline := Aline + #9 + TDataBaseProjectRoutines.GetProjectCode(AQuery.Fieldbyname(SSUBKEY).AsInteger) ;

       DataSetToGui ;
       for i := 0 to AQuery.FieldCount -1 do
        BEGIN
        if (AQuery.Fields[i].FieldName = uppercase(SPRIMARYKEY)) or (AQuery.Fields[i].FieldName = uppercase(SSUBKEY)) then
          begin

          end
          else
          begin
               Aline := Aline + #9 + AQuery.Fields[i].AsString ;
          end;
         end;

       Aline := Aline + #13+ #10 ;
       AStream.Write(Aline[1],length(Aline)) ;
       AQuery.next ;
     end;


end;


procedure TEditFormCollectionItem.ImportDataFromLine(ALine: String;Matchtype : Integer);
var
 ALines : TStringlist ;
 AKey,i,UseIndex  : Integer ;
 KeyLookup,LookupFields : String ;
 Lookupvalues : array of variant ;
 AItem : TEditCollectionItem ;
 bLocated : Boolean ;
 ALeftPart,aMidPart,ARightPart : String ;
begin
 BInImport := true ;
 ALines := TStringList.Create ;
 try
   AKey := 0 ;
   ALines.Text := StringReplace(ALine,#9,#13+#10,[rfReplaceAll]) ;
   if ALines.Count < 3 then exit ;
   if SSUBKEY = 'WSTOCKID' then
    AKey := TDataBaseStockRoutines.GetStockID(ALines[1]) ;

   if SSUBKEY = 'WACCOUNTID' then
     AKey :=  TDataBaseRoutines.GetAccountIDFromCode(ALines[1]) ;
   if SSUBKEY = 'WJOBPROJECTID' then
       AKey :=  TDataBaseProjectRoutines.GetProjectId(ALines[1]) ;

   if SSUBKEY = 'WGROUPID' then
     begin
       ALeftPart := copy(ALines[1],1,pos(':',ALines[1])-1);
       ARightPart := ALines[1];
       system.Delete(ARightPart,1,pos(':',ALines[1]));

        if StrToIntDef(ALeftPart,0) <> 0 then
       AKey :=  TDataBaseRoutines.GetAddGroupNesteled(ARightPart,StrToIntDef(ALeftPart,0)) ;
     end;

   if SSUBKEY = 'WGROUPDESCID' then
     begin
       ALeftPart := copy(ALines[1],1,pos(':',ALines[1])-1);
       ARightPart := ALines[1];
       system.Delete(ARightPart,1,pos(':',ALines[1]));
       aMidPart :=  copy(ARightPart,1,pos(':',ARightPart)-1);
       system.Delete(ARightPart,1,pos(':',ARightPart));



        if StrToIntDef(ALeftPart,0) <> 0 then
       AKey :=  TDataBaseRoutines.GetAddGroupNesteled(ARightPart,StrToIntDef(ALeftPart,0)) ;

      akey :=  TDataBaseRoutines.GetAddGroupDescription(AKey,aMidPart,ALines[2]);
     end;

    if AKey <> 0 then
    begin
    AQuery.Close ;
    AQuery.Params[0].AsInteger := AKey ;
    AQuery.open ;
    while ALines.Count <= AQuery.FieldCount do
       ALines.Add('');
    if AQuery.IsEmpty then AQuery.Insert else
       begin
          if BMULTILINE then
           begin
             if AQuery.FieldCount > 2 then
             begin
               UseIndex := 2 ;
               if  uppercase(SSUBKEY) = uppercase(SPRIMARYKEY) then
                 dec(UseIndex);

               AItem := GetItemOnFieldName(AQuery.Fields[UseIndex].FieldName) ;
               if AItem <> nil then
                begin
                   KeyLookup := ALines[2] ;
                    if copy(AItem.SControlType,1,1) = 'O' then
                     begin
                       case (AItem.SControlType[2]) of
                            'C' : KeyLookup := IntToStr( TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                            'D' : KeyLookup := IntToStr(TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                            'G' : KeyLookup := IntToStr(TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                            'T' : KeyLookup := IntToStr(TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                            'B' : KeyLookup := IntToStr(TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                            'S' : KeyLookup := IntToStr(TDataBaseStockRoutines.GetStockID(ALines[2]));
                            'A' : KeyLookup := IntToStr(TDataBaseRoutines.GetAccountIDFromCode(ALines[2]));
                         end;
                     end ;

                end else
                begin
                  KeyLookup :=  ALines[2] ;
                end;
              end;
              if Matchtype = 0 then
               begin
               if AQuery.Locate(AQuery.Fields[2].FieldName, KeyLookup,[]) then
                  AQuery.Edit else
                  AQuery.Insert ;
               end else
               if Matchtype = 1 then
               begin
                  AQuery.Insert ;
               end else
               if Matchtype = 2 then
               begin
                 // on item

                 LookupFields := '' ;
                 for i := 0 to Self.EditCollection.Count -1 do
                   begin
                      KeyLookup := '' ;
                      if  (i + 2) < ALines.Count then
                           KeyLookup := ALines[i + 2] ;
                      if  (AQuery.FieldByName(Self.EditCollection[i].SColumnOrigen) <> nil) then
                         begin
                           SetLength(Lookupvalues,high(Lookupvalues)+2) ;
                          // if trim(KeyLookup) = '' then
                         //  Lookupvalues[high(Lookupvalues)] :=varNull
                         //  else
                           Lookupvalues[high(Lookupvalues)] :=  KeyLookup ;
                           if LookupFields <> '' then
                             LookupFields := LookupFields + ';' ;
                             LookupFields := LookupFields + AQuery.FieldByName(Self.EditCollection[i].SColumnOrigen).FieldName ;
                         end;

                   end ;
                   bLocated := (AQuery.Locate(LookupFields, Lookupvalues,[])) ;
                  if bLocated and not AQuery.IsEmpty then
                      AQuery.Edit else
                     AQuery.Insert ;
               end;
           end else
          AQuery.Edit ;
       end;
      AQuery.FieldByName(SSUBKEY).AsInteger := AKey ;
       for i:= 0 to AQuery.FieldCount -1 do
         begin
         if (AQuery.Fields[i].FieldName = uppercase(SPRIMARYKEY))  then
          begin
           if AQuery.State = dsInsert then
            if uppercase(SSUBKEY) <> uppercase(SPRIMARYKEY) then
              AQuery.Fields[i].Value := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(SNEXTIDSQL) ;

          end else
          if (AQuery.Fields[i].FieldName = uppercase(SSUBKEY)) then
            begin
              if uppercase(SSUBKEY) <> uppercase(SPRIMARYKEY) then
              AQuery.Fields[i].Value := AKey ;
            end else
            begin
             UseIndex := i ;
             if  SSUBKEY = SPRIMARYKEY then
                 inc(UseIndex) ;
             if  ALines.Count <= (UseIndex  ) then
                exit ;

            if Trim(ALines[UseIndex]) ='' then
                  begin
                    AQuery.Fields[i].Clear ;
                    Continue ;
                   end;

              AItem := GetItemOnFieldName(AQuery.Fields[i].FieldName) ;
              if AItem <> nil then
                begin
                   if copy(AItem.SControlType,1,1) = 'O' then
                     begin
                       case (AItem.SControlType[2]) of
                            'C' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                            'D' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                            'G' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                            'T' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                            'B' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                            'S' : AQuery.Fields[i].AsInteger := TDataBaseStockRoutines.GetStockID(ALines[UseIndex]);
                            'A' : AQuery.Fields[i].AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ALines[UseIndex]);
                         end;

                     end else
                     begin
                     if  (AItem.SControlType = 'D') or (AItem.SControlType = 'T') then
                        begin
                          if ALines[UseIndex] ='' then
                            AQuery.Fields[i].Clear
                          else
                          AQuery.Fields[i].Asstring := ALines[UseIndex] ;
                        end else
                        AQuery.Fields[i].Asstring := ALines[UseIndex] ;
                     end;
                end else
              AQuery.Fields[i].Asstring := ALines[UseIndex] ;

           end;
         end;
   AQuery.Post ;
   if AQuery.UpdatesPending then
      AQuery.ApplyUpdates ;
    end;


  // if SSUBKEY = 'WGROUPID' then
  //   AKey :=  TDataBaseRoutines.GetAddGroupNesteled(ALines[1],0) ;

 finally
  BInImport := false ;
  ALines.free ;

 end;



end;


function TEditFormCollectionItem.GetItemOnFieldName(
  AFieldname: String): TEditCollectionItem;
 var
  i : Integer ;
begin
 Result := nil ;
  For i := 0 to EditCollection.Count -1 do
    begin
       if UpperCase(EditCollection[i].SColumnOrigen) = UpperCase(AFieldname) then
         begin
          result := EditCollection[i];
          Exit ;
         end;
    end;
end;

procedure TEditFormCollectionItem.CheckCreateTableAndFields;
var
 x : Integer ;
begin
 if Not TDatabaseTableRoutines.TableExists(STABLE) then
  begin
     if SPRIMARYKEY <> SSUBKEY then
       begin
          TDataBaseRoutines.ExecSql('Create table ' + STABLE + '('+SPRIMARYKEY +' Integer NOT NULL, '
                                     +SSUBKEY +' Integer NOT NULL , ' +
            ' CONSTRAINT PK_' +  STABLE +' PRIMARY KEY ('+SPRIMARYKEY  +'))');







       end else
       begin
          TDataBaseRoutines.ExecSql('Create table ' + STABLE + '('+SPRIMARYKEY +' Integer NOT NULL , ' +
            ' CONSTRAINT PK_' +  STABLE +' PRIMARY KEY ('+SPRIMARYKEY  +'))');
       end;
         // create foreign key

        TDataBaseRoutines.ExecSql(' alter table '+ STABLE + ' add constraint FK_'+  STABLE +'_REF foreign key ( '+  SSUBKEY+') ' +
            ' references '+  SMASTERTABLE + '(' +  SSUBKEY + ')  on update CASCADE on delete CASCADE;');


        for x := 0 to  EditCollection.Count -1 do
            begin

              case  EditCollection[x].SControlType[1]  of
                 'S' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' varchar(' + IntToStr(EditCollection[x].WLength)+');');
                 'B' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' smallint;');
                 'N' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' integer;');
                 'F' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' numeric(16,8);');
                 'D' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' date;');
                 'M' : TDataBaseRoutines.ExecSql('Alter table ' + STABLE +' add ' + EditCollection[x].SColumnOrigen + ' Blob;');
                end;

           end;

  end;
end;

procedure TSearchPanel.OnMenuitemClick(sender: Tobject);
begin
 if  (FaSearchCollection[TComponent(sender).Tag].Component is TCustomEdit) then
     (FaSearchCollection[TComponent(sender).Tag].Component as TCustomEdit).Text := TmenuItem(sender).Caption ;

end;

procedure TEditFormCollectionItem.OnGridKeyDown(Sender: TObject;
  var Key: Char);
  var AItem :TEditCollectionItem ;
begin
 AItem := GetItemOnFieldName(AGrid.SelectedField.FieldName) ;
 if AItem <> nil then
    if AItem.SControlType = 'F' then
     if Key = '.' then Key := DecimalSeparator ;

end;

procedure TEditFormCollectionItem.ControlKeyDown(Sender: TObject;
  var Key: Char);
begin
      if Key = '.' then Key := DecimalSeparator ;

end;

procedure TEditFormCollectionItem.GetMemoDatasetDesc(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 If DisplayText then
    Text := copy(Sender.AsString,1,120) else
    Text := Sender.AsString ;

end;



procedure TSearchPanel.ClearComponents;
var
 i : integer ;
begin
 if assigned(AComboBox) then
    FreeAndNil(AComboBox);
 for i := faSearchCollection.Count -1 downto 0 do
   begin
    if faSearchCollection[i].Delete then
      begin
       faSearchCollection.Delete(i) ;
       Continue ;
      end;


     if assigned(faSearchCollection[i].Component) then
        faSearchCollection[i].Component.free ;
     faSearchCollection[i].Component := nil ;

     if assigned(faSearchCollection[i].TextLabel) then
        faSearchCollection[i].TextLabel.free ;
     faSearchCollection[i].TextLabel := nil ;

     if assigned(faSearchCollection[i].TypeDropdown) then
        faSearchCollection[i].TypeDropdown.free ;
     faSearchCollection[i].TypeDropdown := nil ;

     if assigned(faSearchCollection[i].Button) then
        faSearchCollection[i].Button.free ;
     faSearchCollection[i].Button := nil ;
   end;
     if self.FindComponent('ETypeLabel') <> nil then
        self.FindComponent('ETypeLabel').free ;

 {FreeAndNil(ChangeTypeButton) ;
 FreeAndNil(SearchButton) ;
 FreeAndNil(ClearButton) ;

 FreeAndNil(aPopupmenu) ;
 FreeAndNil(Rightpanel) ;
 FreeAndNil(SearchArea) ;  }


end;

procedure TSearchPanel.LoadFromFile(AFile: String);
  var
    AStream : TFileStream ;
begin
   if FileExists(AFile) then
     begin
       AStream := TFileStream.Create(AFile,fmShareDenyNone) ;
       try
          AStream.ReadComponent(self);
          self.BuildGui;
       finally
          AStream.free ;
       end;
     end;
end;

procedure TSearchPanel.SaveToFile(AFile: String);
  var
    AStream : TFileStream ;
begin
       AStream := TFileStream.Create(AFile,fmCreate) ;
       try
          AStream.WriteComponent(self);

       finally
          AStream.free ;
       end;
end;




function TSearchPanel.LookupExists(Alookup: String) : Boolean;
 Var
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.Create(nil) ;
  try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   AQuery.sql.Text := 'select * from OSF_SEARCH_FIELDS where SFORMNAME = ' + QuotedStr(Alookup) ;
   AQuery.open ;
   result := not AQuery.IsEmpty ;
  finally
   AQuery.free ;
  end;

end;

procedure TEditFormCollectionItem.GetLookupGENDatasetDesc(Sender: TField;
  var Text: String; DisplayText: Boolean);
 var

 ExtraLookup : String ;
begin
ExtraLookup :=  EditCollection[sender.Tag-1].LLOOKUPSQL ;
system.delete(ExtraLookup,pos('@@GO@@',ExtraLookup),length(ExtraLookup));
Text :=  varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn(TDatabaseTableRoutines.ReplaceParams(ExtraLookup,'ID='+
               IntToStr(Sender.AsInteger)))) ;
end;

procedure TEditFormCollectionItem.CheckAltID(var Aid: integer;AltKeylist : TStringlist);
var
 Aquery : TuniQuery ;
 i : Integer ;
begin
 if copy(SNEXTIDSQL,1,1) = '#' then
   begin
     Aquery := TuniQuery.create(nil) ;
     try
       Aquery.Connection := DMTCCoreLink.TheZConnection ;
       Aquery.SQL.Text :=  TDatabaseTableRoutines.ReplaceParams(copy(SNEXTIDSQL,2,length(SNEXTIDSQL)),AltKeylist.text) ;
       for i := 0 to Aquery.Params.Count -1 do
             Aquery.Params[i].AsInteger := Aid ;
       Aquery.open ;
       if Aquery.IsEmpty then raise Exception.Create('Key not found for ' + IntTostr(Aid) + ' ' + SNEXTIDSQL);
       Aid := Aquery.fields[0].AsInteger ;
     finally
        Aquery.free ;
     end;
   end;
end;

{ TPanelTreeViewItem }



destructor TPanelTreeViewItem.Destroy;
begin
  if Assigned(FDataSource) then
   FreeAndNil(FDataSource);

  inherited;
end;

procedure TPanelTreeViewItem.OnDataChange(Sender: TObject; Field: TField);
begin
 if Field = nil then
   if Assigned(CaptionLabel) then
      CaptionLabel.Caption := ItemName + '('+ IntToStr(DataSource.DataSet.RecordCount) +')' + copy(CaptionLabel.Caption,length(CaptionLabel.Caption),1) ;
end;

procedure TPanelTreeViewItem.OnMenuItemClick(Sender: TObject);
var
 i ,curIndex,OldOrder:  integer ;
 ASortedlist : TStringlist ;

begin

ASortedlist := TStringlist.create ;
try
    for i := 0 to Self.Collection.count -1 do
     begin
      ASortedlist.AddObject(FormatFloat('00000000',TPanelTreeView(Self.Collection)[i].FOrder),TPanelTreeView(Self.Collection)[i]);
     end;
    ASortedlist.Sort ;
    curIndex := ASortedlist.IndexOf(FormatFloat('00000000',self.FOrder));
    if Tcomponent(sender).Tag = 1 then
     begin
     if  curIndex = 0 then exit
     end else
     if curIndex = (ASortedlist.Count -1) then
       exit;
    if Tcomponent(sender).Tag = 1 then
        begin
          OldOrder := TPanelTreeViewItem(ASortedlist.Objects[curIndex]).FOrder ;
          TPanelTreeViewItem(ASortedlist.Objects[curIndex]).FOrder := TPanelTreeViewItem(ASortedlist.Objects[curIndex-1]).FOrder ;
          TPanelTreeViewItem(ASortedlist.Objects[curIndex-1]).FOrder := OldOrder ;
        end else
        begin
          OldOrder := TPanelTreeViewItem(ASortedlist.Objects[curIndex]).FOrder ;
          TPanelTreeViewItem(ASortedlist.Objects[curIndex]).FOrder := TPanelTreeViewItem(ASortedlist.Objects[curIndex+1]).FOrder ;
          TPanelTreeViewItem(ASortedlist.Objects[curIndex+1]).FOrder := OldOrder ;
        end;


  finally
     ASortedlist.free ;
  end;
 TPanelTreeView(Self.Collection).Reorder ;
end;


function TPanelTreeViewItem.ReadHeight: integer;
begin
 result := 0;
 if Assigned(Control) then
 Result := Control.Height ;
end;

function TPanelTreeViewItem.ReadWidth: integer;
begin
 result := 0;
 if Assigned(Control) then
 Result := Control.Width ;
end;

procedure TPanelTreeViewItem.SetCaptionLabel(const Value: TStaticText);
begin
  FCaptionLabel := Value;
end;

procedure TPanelTreeViewItem.SetControl(const Value: TControl);
begin
  FControl := Value;
end;

procedure TPanelTreeViewItem.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TPanelTreeViewItem.SetItemName(const Value: String);
begin
  FItemName := Value;
end;

procedure TPanelTreeViewItem.SetOrder(const Value: Integer);
begin
  FOrder := Value;
end;

procedure TPanelTreeViewItem.SetUsedPanel(const Value: Tpanel);
begin
  FUsedPanel := Value;
end;

procedure TPanelTreeViewItem.WriteHeight(const Value: integer);
begin
 if Assigned(Control) then
    Control.Height := Value;
end;

procedure TPanelTreeViewItem.WriteWidth(const Value: integer);
begin
 if Assigned(Control) then
    Control.Width := Value;
end;

{ TPanelTreeView }

procedure TPanelTreeView.pcDetailsListExpClick(Sender: TObject);
begin
 if TPanel(TStaticText(sender).parent).Tag = 0 then
  begin
   TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS',copy(TStaticText(sender).Caption,1,length(TStaticText(sender).Caption)-1)+'Height',IntToStr(TPanel(TStaticText(sender).parent).Height));
   TPanel(TStaticText(sender).parent).Height := 19 ;
   TStaticText(sender).Caption := copy(TStaticText(sender).Caption,1,length(TStaticText(sender).Caption)-1) + '+' ;
   TPanel(TStaticText(sender).parent).Tag := 1 ;
   TPanel(TStaticText(sender).parent).FindChildControl('SPLITTER').Visible := False ;
  end else
  begin
   TPanel(TStaticText(sender).parent).Height := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS',copy(TStaticText(sender).Caption,1,length(TStaticText(sender).Caption)-1)+'Height'),300) ;
   if TPanel(TStaticText(sender).parent).Height < 50 then
      TPanel(TStaticText(sender).parent).Height := 50 ;
   TStaticText(sender).Caption := copy(TStaticText(sender).Caption,1,length(TStaticText(sender).Caption)-1) + '-' ;
   TPanel(TStaticText(sender).parent).Tag := 0 ;
   TPanel(TStaticText(sender).parent).FindChildControl('SPLITTER').Visible := True ;
   if MoreRows > 0 then
        TPanel(TStaticText(sender).parent).parent.Height := TPanel(TStaticText(sender).parent).Height ;

    if  TPanel(TStaticText(sender).parent).parent is TScrollBox then
         (TPanel(TStaticText(sender).parent).parent as TScrollBox ).ScrollInView(
      TPanel(TStaticText(sender).parent)) ;

  end;
end;


procedure  TPanelTreeView.OnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     mouseisDown := True ;
    LastCord := Mouse.CursorPos ;
    LastCord.x := (Sender as TPanel).parent.Height ;
end;

procedure TPanelTreeView.OnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     mouseisDown := False ;
end;

procedure TPanelTreeView.OnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mouseisDown and ((Mouse.CursorPos.Y - LastCord.Y) <> 0 ) then
  begin
  if Sender is TPanel then
  begin
  (Sender as TPanel).parent.Height := LastCord.x + (Mouse.CursorPos.Y - LastCord.Y);
  if MoreRows > 0 then
     (Sender as TPanel).parent.Parent.Height := LastCord.x + (Mouse.CursorPos.Y - LastCord.Y);
 // LastCord.y := LastCord.y + (Mouse.CursorPos.Y - LastCord.Y); ;

  end;
  end;
end;


procedure TPanelTreeView.Construct(AScrollbox: TScrollBox);
var
 i ,NextVar:  integer ;
 ACaption : TStaticText ;
 aPanel,aPanel2,APanel3 : Tpanel ;
 APopupmenu : TPopupMenu ;
 AMenuitem : Tmenuitem ;
 
begin
  APanel3 := nil ;
  if MoreRows >0 then
  begin
     for i := 0 to count -1 do
     begin
         if (i mod (1+MoreRows)) = 0 then
          begin
           APanel3 := TPanel.Create(AScrollbox );
           APanel3.Align := alTop ;
           APanel3.Caption := '' ;
           APanel3.Parent :=  AScrollbox;
           APanel3.Height := 50 ;
          end;
          self.PanelTreeViewItem[i].FUsedPanel := APanel3 ;
            if (i mod (1+MoreRows)) < MoreRows then
                begin
                 with TSplitter.create( AScrollbox) do
                  begin
                     Align := alRight ;
                     Parent := APanel3 ;
                  end;
                end ;
                aPanel := Tpanel.create(AScrollbox) ;
                aPanel.Parent :=  APanel3;                
                if (i mod (1+MoreRows))< MoreRows then
                begin
                aPanel.Align := alRight ;
                end else
                aPanel.Align := alClient ;

                aPanel.Caption := '' ;

                aPanel.Height := 19 ;
                aPanel.Tag := 1 ;
                aPanel.Constraints.MinWidth := 50 ;
                ACaption := TStaticText.create(AScrollbox) ;
                ACaption.Align := alTop ;
                ACaption.Caption := self.PanelTreeViewItem[i].ItemName     ;
                ACaption.Parent :=  aPanel ;
                self.PanelTreeViewItem[i].FCaptionLabel := ACaption ;
                aPanel2  := Tpanel.create(AScrollbox) ;
                aPanel2.Align := alLeft ;
                aPanel2.Caption := '' ;
                aPanel2.Width := 20 ;
                aPanel2.Parent :=  aPanel ;
                PanelTreeViewItem[i].FControl.Align := alClient ;
                PanelTreeViewItem[i].FControl.Parent := aPanel ;
                aPanel2  := Tpanel.create(aPanel) ;
                aPanel2.Align := alBottom ;
                aPanel2.Name := 'SPLITTER' ;
                aPanel2.Caption := '--' ;
                aPanel2.Alignment := taCenter ;
                aPanel2.ParentBackground := False ;
                aPanel2.Color := clGray ;


                aPanel2.Height := 10 ;
                aPanel2.Parent :=  aPanel ;
                aPanel2.OnMouseDown := OnMouseDown;
                aPanel2.OnMouseUp := OnMouseUp;
                aPanel2.OnMouseMove := OnMouseMove;
                NextVar := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName+'Height'),300) ;
                if APanel3.Height < NextVar then
                APanel3.Height := NextVar ;

                aPanel.Width :=  StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName+'Width'),300) ;
                if aPanel.Width < 50 then
                  aPanel.Width := 50 ;




          // pcDetailsListExpClick(ACaption);

  end;
  end else
  begin
  for i := 0 to count -1 do
   begin

                Self.PanelTreeViewItem[i].Order := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS','ORD'+ Self.PanelTreeViewItem[i].ItemName),Self.PanelTreeViewItem[i].Order) ;
                APopupmenu := TPopupMenu.create(AScrollbox) ;
                APopupmenu.Images := DMTCCoreLink.ImageList1 ;
                AMenuitem := Tmenuitem.Create(AScrollbox) ;
                AMenuitem.ImageIndex := 31 ;
                AMenuitem.tag  := 1 ;
                AMenuitem.OnClick :=   self.PanelTreeViewItem[i].OnMenuItemClick ;
                APopupmenu.Items.Add(AMenuitem);
                AMenuitem := Tmenuitem.Create(AScrollbox) ;
                AMenuitem.ImageIndex := 30 ;
                AMenuitem.tag  := 0 ;
                AMenuitem.OnClick :=  self.PanelTreeViewItem[i].OnMenuItemClick ;
                APopupmenu.Items.Add(AMenuitem);

                aPanel := Tpanel.create(AScrollbox) ;
              //  aPanel.Align := alTop ;
                aPanel.Caption := '' ;
                aPanel.Parent :=  AScrollbox;
                aPanel.Height := 19 ;
                aPanel.Tag := 1 ;
                self.PanelTreeViewItem[i].FUsedPanel := aPanel ;
                aPanel.Constraints.MinWidth := 400 ;
                ACaption := TStaticText.create(AScrollbox) ;
                ACaption.Align := alTop ;
                ACaption.PopupMenu := APopupmenu ;
                ACaption.Caption :=  self.PanelTreeViewItem[i].ItemName + ' +' ;
                ACaption.Parent :=  aPanel ;
                ACaption.OnClick := pcDetailsListExpClick ;
                self.PanelTreeViewItem[i].FCaptionLabel := ACaption ;
                aPanel2  := Tpanel.create(AScrollbox) ;
                aPanel2.Align := alLeft ;
                aPanel2.Caption := '' ;
                aPanel2.Width := 20 ;
                aPanel2.Parent :=  aPanel ;
                PanelTreeViewItem[i].FControl.Align := alClient ;
                PanelTreeViewItem[i].FControl.Parent := aPanel ;
                aPanel2  := Tpanel.create(aPanel) ;
                aPanel2.Align := alBottom ;
                aPanel2.Name := 'SPLITTER' ;
                aPanel2.Caption := '--' ;
                aPanel2.Alignment := taCenter ;
                aPanel2.ParentBackground := False ;
                aPanel2.Color := clGray ;
                aPanel2.Caption := '' ;
                aPanel2.Visible := False ;
                aPanel2.Height := 10 ;
                aPanel2.Parent :=  aPanel ;
                aPanel2.OnMouseDown := OnMouseDown;
                aPanel2.OnMouseUp := OnMouseUp;
                aPanel2.OnMouseMove := OnMouseMove;
      if  (TDatabaseRegistyRoutines.ReadRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName) = '1') then
        begin
           pcDetailsListExpClick(ACaption);
        end;
  end;
  end;
  Reorder ;
end;

function TPanelTreeView.GetPanelTreeViewItem(
  index: Integer): TPanelTreeViewItem;
begin
 result := TPanelTreeViewItem(self.Items[index]);
end;

procedure TPanelTreeView.SetPanelTreeViewItem(index: Integer;
  const Value: TPanelTreeViewItem);
begin
  self.Items[index].Assign(Value);
end;

procedure TPanelTreeView.ClearItems;
var
 i : Integer ;
begin
 for i := 0 to Self.count -1 do
   begin
      TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS','ORD'+ Self.PanelTreeViewItem[i].ItemName,IntToStr(Self.PanelTreeViewItem[i].Order)) ;

      If Self.PanelTreeViewItem[i].FControl.Parent.Height = 19 then
       TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName,'0')
      else
       begin
        TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName,'1');
        TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName+'Height',IntToStr(Self.PanelTreeViewItem[i].FControl.Parent.Height));
        if MoreRows > 0 then
          TDatabaseRegistyRoutines.WriteRegValue('SPLITTERS',self.PanelTreeViewItem[i].ItemName+'Width',IntToStr(Self.PanelTreeViewItem[i].FControl.Parent.Width));
       end;


   end;
  self.clear ;
end;

procedure TPanelTreeView.Reorder;
var
 i,NextTop :  integer ;
 ASortedlist : TStringlist ;

begin

ASortedlist := TStringlist.create ;
try
    for i := 0 to count -1 do
     begin
      Self[i].FUsedPanel.Align := alNone ;
      ASortedlist.AddObject(FormatFloat('00000000',Self[i].FOrder),Self[i].FUsedPanel);
     end;
    ASortedlist.Sort ;
    NextTop := 0 ;
    for i :=  0 to ASortedlist.Count -1 do //  downto 0 do
     begin
        TPanel(ASortedlist.Objects[i]).Top := NextTop;
        NextTop := NextTop + TPanel(ASortedlist.Objects[i]).Height + 1 ;
     end;
    for i :=  0 to ASortedlist.Count -1 do //  downto 0 do
     begin                                            
        TPanel(ASortedlist.Objects[i]).Align := alTop;
     end;

  finally
     ASortedlist.free ;
  end;
end;



function TSearchPanel.GetItemOnFieldOrignName(
  AFieldname: String): TSearchCollectionItem;
  var
   i : Integer ;
   AField : String ;
begin
   Result := nil ;
   for i := 0 to FaSearchCollection.Count -1 do
    begin
    AField := FaSearchCollection.SearchCollectionItem[i].FSColumnOrigen ;
    if pos('.',AField) > 0 then
        delete(AField,1,pos('.',AField)) ;
     if UpperCase(AField) = UpperCase(AFieldname) then
        begin
           Result :=  FaSearchCollection.SearchCollectionItem[i] ;
           exit ;
        end;
     end;
end;

procedure TSearchPanel.ClearOtherComponents;
begin
    FreeAndNil(ChangeTypeButton) ;
    FreeAndNil(SearchButton) ;
    FreeAndNil(ClearButton) ;
    FreeAndNil(aPopupmenu) ;
    FreeAndNil(Rightpanel) ;
    FreeAndNil(SearchArea) ;
end;

end.
