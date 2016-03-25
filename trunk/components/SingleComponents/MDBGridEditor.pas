
{*******************************************************}
{                                                       }
{                MiTeC DB Grid                          }
{           version 1.1 for Delphi 5,6                  }
{              Column Desig-time Editor                 }
{           Copyright © 2002 Michal Mutl                }
{                                                       }
{*******************************************************}

{$DEFINE D6PLUS}

unit MDBGridEditor;

interface

uses
  {$IFNDEF D6PLUS} DsgnIntf, DsgnWnds, {$ELSE} DesignEditors, DesignWindows, DesignIntf, Variants, {$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ToolWin, Menus, MDBGrid, DBGrids, ImgList;

type
  TMDBGridColumnsEditor = class(TDesignWindow)
    ToolBar1: TToolBar;
    tbAddNew: TToolButton;
    tbDeleteSelected: TToolButton;
    ToolButton3: TToolButton;
    tbAddAllFields: TToolButton;
    tbRestoreDefaults: TToolButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    miAddNew: TMenuItem;
    miDeleteSelected: TMenuItem;
    miAddAllFields: TMenuItem;
    miRestoreDefaults: TMenuItem;
    miSelectAll: TMenuItem;
    N1: TMenuItem;
    ListView1: TListView;
    tbMoveUp: TToolButton;
    tbMoveDown: TToolButton;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tbAddNewClick(Sender: TObject);
    procedure tbDeleteSelectedClick(Sender: TObject);
    procedure tbAddAllFieldsClick(Sender: TObject);
    procedure tbRestoreDefaultsClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormResize(Sender: TObject);
    procedure miAddNewClick(Sender: TObject);
    procedure miDeleteSelectedClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure miAddAllFieldsClick(Sender: TObject);
    procedure miRestoreDefaultsClick(Sender: TObject);
    procedure tbMoveUpClick(Sender: TObject);
    procedure tbMoveDownClick(Sender: TObject);
  private
    FMDBGrid:TMDBGrid;
    function CheckCollection: Boolean;
    procedure SetMDBGrid(const Value: TMDBGrid);
    procedure UpdateData;
    procedure Copy;
    procedure Cut;
    procedure Paste;
  protected
    function UniqueName(Component: TComponent): string; override;
    procedure Activated; override;
  public
    {$IFDEF D6PLUS}
    function EditAction(Action: TEditAction): boolean; override;
    {$ELSE}
    procedure EditAction(Action: TEditAction); override;
    procedure FormModified; override;
    procedure FormClosed(Form: TCustomForm); override;
    procedure ComponentDeleted(Component: IPersistent); override;
    {$ENDIF}
    function GetEditState: TEditState; override;

    property MDBGrid: TMDBGrid read FMDBGrid write SetMDBGrid;
  end;


{ TMDBGridColumnsProperty }

  TMDBGridColumnsProperty = class(TPropertyEditor)
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

{ TMDBGridEditor }

  TMDBGridEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

var
  MDBGridColumnsEditor: TMDBGridColumnsEditor;

implementation

{$R *.DFM}

function FindEditor(AMDBGrid: TMDBGrid): TMDBGridColumnsEditor;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do begin
    if Screen.Forms[I] is TMDBGridColumnsEditor then begin
      if TMDBGridColumnsEditor(Screen.Forms[I]).MDBGrid = AMDBGrid then
      begin
        Result := TMDBGridColumnsEditor(Screen.Forms[I]);
        Break;
      end;
    end;
  end;
end;

procedure ShowItemsEditor(Designer: IDesigner;
  AMDBGrid: TMDBGrid);
var
  Editor: TMDBGridColumnsEditor;
begin
  if AMDBGrid = nil then Exit;
  Editor := FindEditor(AMDBGrid);
  if Editor = nil then begin
    Editor := TMDBGridColumnsEditor.Create(Application);
    try
      {$IFDEF D6PLUS}
      Editor.Designer := IDesigner(Designer);
      {$ELSE}
      Editor.Designer := IFormDesigner(Designer);
      {$ENDIF}
      Editor.MDBGrid := AMDBGrid;
      Editor.Show;
    except
      Editor.Free;
      raise;
    end;
  end
  else begin
    Editor.Show;
    if Editor.WindowState = wsMinimized then
      Editor.WindowState := wsNormal;
  end;
end;


{ TDBGridColumnsEditor }

function TMDBGridColumnsEditor.CheckCollection: Boolean;
begin
  Result := (MDBGrid <> nil) and (MDBGrid.Columns <> nil)
  {$IFDEF D6PLUS}
    and (Designer.Root <> nil);
  {$ENDIF}
end;

procedure TMDBGridColumnsEditor.SetMDBGrid(const Value: TMDBGrid);
begin
  if FMDBGrid <> Value then begin
    FMDBGrid := Value;
    UpdateData;
  end;
end;

procedure TMDBGridColumnsEditor.UpdateData;
var
  Empty,Modified: Boolean;
  i:Integer;
  ListItem: TListItem;
begin
  if CheckCollection then begin
    Caption := Format('Edition %s.Columns', [MDBGrid.Name]);
    Empty := MDBGrid.Columns.Count = 0;
  end
  else Empty := True;
  if Empty then begin
    ListView1.Items.Clear;
  end
  else begin
    Modified := False;
    if (MDBGrid.Columns.Count <> ListView1.Items.Count) then Modified := True;
    if (Modified = False) then
      for i := 0 to MDBGrid.Columns.Count - 1 do
        if (ListView1.Items[i].Data <> MDBGrid.Columns[i]) then begin
          Modified := True;
          Break;
        end;
    if (Modified = True) then begin
      ListView1.Items.BeginUpdate;
      ListView1.Items.Clear;
      try
        if (MDBGrid.Columns.State = csCustomized) then begin
           for i := 0 to MDBGrid.Columns.Count - 1 do begin
             ListItem := ListView1.Items.Add;
             ListItem.Caption := IntToStr(i) + ' - ' + MDBGrid.Columns[i].DisplayName;
             ListItem.Data := MDBGrid.Columns[i];
           end;
        end;
      finally
        ListView1.Items.EndUpdate;
      end;
    end else // Заголовок может поменяться когда меняют FieldName
      for i := 0 to MDBGrid.Columns.Count - 1 do ListView1.Items[i].Caption := IntToStr(i) + ' - ' + MDBGrid.Columns[i].DisplayName;
  end;
  ListView1Change(nil,nil,ctState);
end;

procedure TMDBGridColumnsEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMDBGridColumnsEditor.FormCreate(Sender: TObject);
begin
  MDBGrid := nil;
  if NewStyleControls then Font.Style := [];
end;

procedure TMDBGridColumnsEditor.tbAddNewClick(Sender: TObject);
begin
  MDBGrid.Columns.Add;
  UpdateData;
  Designer.Modified;
  ListView1.Items[ListView1.Items.Count-1].Selected := True;
  ListView1Change(nil,nil,ctState);
end;

procedure TMDBGridColumnsEditor.tbDeleteSelectedClick(Sender: TObject);
var i,sel:Integer;
//  ListItem: TListItem;
  {$IFDEF D6PLUS}
  FComponents: IDesignerSelections;
  {$ELSE}
  FComponents: TDesignerSelectionList;
  {$ENDIF}

begin
  sel := -1;
  if (ListView1.SelCount > 0) then begin
    {$IFDEF D6PLUS}
    FComponents := CreateSelectionList;
    {$ELSE}
    FComponents := TDesignerSelectionList.Create;
    {$ENDIF}
    try
      MDBGrid.Columns.BeginUpdate;
      ListView1.Items.BeginUpdate;
      sel := ListView1.Items.IndexOf(ListView1.Selected);
      for i := ListView1.Items.Count - 1 downto 0 do
       if (ListView1.Items[i].Selected = True) and Assigned(ListView1.Items[i].Data) then begin
         FComponents.Add(TDBGColumn(ListView1.Items[i].Data));
       end;
      ListView1.Items.Clear;

      for i := 0 to FComponents.Count - 1 do FComponents[i].Free;

    finally
      ListView1.Items.EndUpdate;
      MDBGrid.Columns.EndUpdate;
      {$IFNDEF D6PLUS}
      FComponents.Free;
      {$ENDIF}
      Designer.Modified;
      if (ListView1.Items.Count > 0) then
        if (sel > ListView1.Items.Count - 1) then
           ListView1.Items[ListView1.Items.Count-1].Selected := True
        else
           ListView1.Items[sel].Selected := True;
      ListView1Change(nil,nil,ctState);
    end;
   end;
end;

procedure TMDBGridColumnsEditor.tbAddAllFieldsClick(Sender: TObject);
var msgValue:Word;
    i:Integer;
    Col:TDBGColumn;
begin
  if (MDBGrid.Columns.State = csDefault) then
    MDBGrid.Columns.State := csCustomized
  else begin
   if (MDBGrid.Columns.Count > 0) then begin
     msgValue := MessageDlg('Delete existing columns?',
                      mtConfirmation, [mbYes, mbNo, mbCancel], 0);
     case msgValue of
       mrYes: MDBGrid.Columns.Clear;
       mrCancel: Exit;
     end;
   end;
   for i := 0 to MDBGrid.DataSource.DataSet.FieldCount - 1 do begin
     Col := MDBGrid.Columns.Add;
     Col.FieldName := MDBGrid.DataSource.DataSet.Fields[i].FieldName;
   end;
  end;
  UpdateData;
  Designer.Modified;
end;

procedure TMDBGridColumnsEditor.tbRestoreDefaultsClick(Sender: TObject);
var i:Integer;
  ListItem: TListItem;
begin
  if (ListView1.SelCount > 0) then begin
    ListItem := ListView1.Selected;
    for i := 0 to ListView1.SelCount - 1 do begin
      TDBGColumn(ListItem.Data).RestoreDefaults;
      ListItem := ListView1.GetNextItem(ListItem,sdBelow,[isSelected]);
    end;
    ListView1Change(nil,nil,ctState);
    Designer.Modified;
  end;
end;

procedure TMDBGridColumnsEditor.ListView1Change(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  {$IFDEF D6PLUS}
  FComponents: IDesignerSelections;
  {$ELSE}
  FComponents: TDesignerSelectionList;
  {$ENDIF}
  i: Integer;
//  ListItem: TListItem;
begin
  if (Change <> ctState)  then Exit;
  tbDeleteSelected.Enabled := ListView1.SelCount > 0;
  tbRestoreDefaults.Enabled := ListView1.Items.Count > 0;

  miDeleteSelected.Enabled := ListView1.SelCount > 0;
  miRestoreDefaults.Enabled := ListView1.Items.Count > 0;
  miSelectAll.Enabled := ListView1.Items.Count > 0;
  tbMoveDown.Enabled := ListView1.Items.Count > 0;
  tbMoveUp.Enabled := ListView1.Items.Count > 0;
  tbAddAllFields.Enabled := Assigned(MDBGrid) and Assigned(MDBGrid.DataSource) and
    Assigned(MDBGrid.Datasource.Dataset) and (MDBGrid.Datasource.Dataset.FieldCount > 0);

  if CheckCollection and Active then begin
     {$IFDEF D6PLUS}
     FComponents:=CreateSelectionList;
     {$ELSE}
     FComponents:=TDesignerSelectionList.Create;
     {$ENDIF}
    if (ListView1.SelCount > 0) then begin
      for i := ListView1.Items.Count - 1 downto 0 do
       if (ListView1.Items[i].Selected = True) and Assigned(ListView1.Items[i].Data) then
         FComponents.Add(TDBGColumn(ListView1.Items[i].Data));
    end
    else FComponents.Add(MDBGrid.Columns);
    SetSelection(FComponents);
  end;
end;

procedure TMDBGridColumnsEditor.Activated;
begin
  ListView1Change(nil,nil,ctState);
end;

function TMDBGridColumnsEditor.UniqueName(Component: TComponent): string;
var
  Temp: string;
begin
  if (Component <> nil) then Temp := Component.ClassName
  else Temp := TDBGColumn.ClassName;
  if (UpCase(Temp[1]) = 'T') and (Length(Temp) > 1) then
    System.Delete(Temp, 1, 1);
  Result := Designer.UniqueName(Temp);
end;

{$IFDEF D6PLUS}
function TMDBGridColumnsEditor.EditAction;
begin
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: tbDeleteSelectedClick(Self);
  end;
end;
{$ELSE}
procedure TMDBGridColumnsEditor.EditAction(Action: TEditAction);
begin
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: tbDeleteSelectedClick(Self);
  end;
end;

procedure TMDBGridColumnsEditor.FormModified;
begin
  if not (csDestroying in ComponentState) then UpdateData;
end;

procedure TMDBGridColumnsEditor.FormClosed(Form: TCustomForm);
begin
  if Form = Designer.Form then Close;
end;

procedure TMDBGridColumnsEditor.ComponentDeleted(Component: IPersistent);
begin
  if ExtractPersistent(Component) = MDBGrid then begin

    MDBGrid := nil;
    Close;
  end;
end;
{$ENDIF}

procedure TMDBGridColumnsEditor.Copy;
var
  {$IFDEF D6PLUS}
  FComponents: IDesignerSelections;
  {$ELSE}
  FComponents: TDesignerSelectionList;
  {$ENDIF}
  ListItem: TListItem;
  i:Integer;
begin
  {$IFDEF D6PLUS}
  FComponents:=CreateSelectionList;
  {$ELSE}
  FComponents:=TDesignerSelectionList.Create;
  {$ENDIF}
  try
    if (ListView1.SelCount > 0) then begin
      ListItem := ListView1.Selected;
      for i := 0 to ListView1.SelCount - 1 do begin
        FComponents.Add(TDBGColumn(ListItem.Data));
        ListItem := ListView1.GetNextItem(ListItem,sdBelow,[isSelected]);
      end;
    end;
//    CopyComponents(MDBGrid.Columns, FComponents);
  finally
    {$IFNDEF D6PLUS}
    FComponents.Free;
    {$ENDIF}
  end;
end;

procedure TMDBGridColumnsEditor.Cut;
begin
  Copy;
  tbDeleteSelectedClick(Self);
end;

procedure TMDBGridColumnsEditor.Paste;
var
  {$IFDEF D6PLUS}
  FComponents: IDesignerSelections;
  {$ELSE}
  FComponents: TDesignerSelectionList;
  {$ENDIF}
begin
  if CheckCollection then begin
    {$IFDEF D6PLUS}
    FComponents:=CreateSelectionList;
    {$ELSE}
    FComponents:=TDesignerSelectionList.Create;
    {$ENDIF}
    try
//      PasteComponents(MDBGrid.Columns, MDBGrid.Columns, FComponents);
      UpdateData;
    finally
      {$IFNDEF D6PLUS}
      FComponents.Free;
      {$ENDIF}
    end;
  end;
end;

function TMDBGridColumnsEditor.GetEditState: TEditState;
begin
  Result := [];
  if tbDeleteSelected.Enabled then Result := [esCanDelete];
//  if tbDeleteSelected.Enabled then Result := [esCanDelete, esCanCut, esCanCopy];
//  if ClipboardComponents then Include(Result, esCanPaste);
end;

{ TMDBGridColumnsProperty }

procedure TMDBGridColumnsProperty.Edit;
begin
  ShowItemsEditor(Designer, TMDBGrid(GetComponent(0)));
end;

function TMDBGridColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TMDBGridColumnsProperty.GetValue: string;
begin
  FmtStr(Result, '(%s)', [GetPropType^.Name]);
end;


{ TMDBGridEditor }

procedure TMDBGridEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: ShowItemsEditor(Designer, TMDBGrid(Component));
  end;
end;

function TMDBGridEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Columns Editor ...';
  end;
end;

function TMDBGridEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure TMDBGridColumnsEditor.FormResize(Sender: TObject);
begin
  ListView1.Columns[0].Width := ListView1.ClientWidth;
end;

procedure TMDBGridColumnsEditor.miAddNewClick(Sender: TObject);
begin
  tbAddNewClick(Sender);
end;

procedure TMDBGridColumnsEditor.miDeleteSelectedClick(Sender: TObject);
begin
  tbDeleteSelectedClick(Sender);
end;

procedure TMDBGridColumnsEditor.miSelectAllClick(Sender: TObject);
var i:Integer;
begin
  for i := 0 to ListView1.Items.Count - 1 do ListView1.Items[i].Selected := True;
end;

procedure TMDBGridColumnsEditor.miAddAllFieldsClick(Sender: TObject);
begin
  tbAddAllFieldsClick(Sender);
end;

procedure TMDBGridColumnsEditor.miRestoreDefaultsClick(Sender: TObject);
begin
  tbRestoreDefaultsClick(Sender);
end;

procedure TMDBGridColumnsEditor.tbMoveUpClick(Sender: TObject);
var i:Integer;
    idxs: TList;
begin
  idxs := TList.Create;
  try
    MDBGrid.Columns.BeginUpdate;
    try
      for i := 1 to ListView1.Items.Count - 1 do
        if (ListView1.Items[i].Selected = True) then
          idxs.Add(Pointer(i));
      for i := 1 to ListView1.Items.Count - 1 do
        if (ListView1.Items[i].Selected = True) then
          MDBGrid.Columns[i].Index := i-1;
    finally
      MDBGrid.Columns.EndUpdate;
    end;

    ListView1.Items.BeginUpdate;
    try
      UpdateData;
      for i := 0 to idxs.Count - 1 do
        ListView1.Items[Integer(idxs.Items[i])-1].Selected := True;
     finally
       ListView1.Items.EndUpdate;
     end;
  finally
    idxs.Free;
  end;
end;

procedure TMDBGridColumnsEditor.tbMoveDownClick(Sender: TObject);
var i:Integer;
    idxs: TList;
begin
  idxs := TList.Create;
  try
    MDBGrid.Columns.BeginUpdate;
    try
      for i := 0 to ListView1.Items.Count - 2 do
        if (ListView1.Items[i].Selected = True) then
          idxs.Add(Pointer(i));
      for i := ListView1.Items.Count - 2 downto 0 do
        if (ListView1.Items[i].Selected = True) then
          MDBGrid.Columns[i].Index := i+1;
    finally
      MDBGrid.Columns.EndUpdate;
    end;

    ListView1.Items.BeginUpdate;
    try
      UpdateData;
      for i := 0 to idxs.Count - 1 do
        ListView1.Items[Integer(idxs.Items[i])+1].Selected := True;
     finally
       ListView1.Items.EndUpdate;
     end;
  finally
    idxs.Free;
  end;
end;

end.
