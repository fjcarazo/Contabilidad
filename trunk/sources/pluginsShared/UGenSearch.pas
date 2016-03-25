unit UGenSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,UOSFVisuals, DB,
    DBAccess , Uni, MemDS;

type
  TGenSearch = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BClose: TBitBtn;
    PSearch: TPanel;
    Splitter1: TSplitter;
    ZQGenSearch: TuniQuery;
    DataSource1: TDataSource;
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOnSearch: TNotifyEvent;
    { Private declarations }
    procedure SearchClick(Sender: TObject);
    procedure SetOnSearch(const Value: TNotifyEvent);
    procedure OnGetText(Sender: TField; var Text: String; DisplayText: Boolean);


  public
    { Public declarations }
    aSearchPanel : TSearchPanel ;
    ExtraLimit : String ;
    FType : String ;
    DoNoDoColumns : Boolean ;
    AutoFieldCols  : Boolean ;
    ForceSearch : Boolean ;
    property OnSearch : TNotifyEvent  read FOnSearch write SetOnSearch;
    procedure Init(AType: String);
    function GetClause: String;

  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines,CheckLst;

{$R *.dfm}

function TGenSearch.GetClause: String;
var
 InText : String ;
 Alist : TStringList ;
 i : Integer ;
begin

   Alist := TStringList.create ;
   try
   InText := '' ;
   if ZQGenSearch.IsEmpty then exit ;
   ZQGenSearch.First ;
   While not ZQGenSearch.eof do
      begin
         if Alist.IndexOf(ZQGenSearch.fields[0].Asstring) = -1 then
            Alist.Add(ZQGenSearch.fields[0].Asstring) ;
         ZQGenSearch.next ;
      end;
    for i:= 0 to Alist.Count -1 do
      begin
         InText := InText + Alist[i] ;
         if i < Alist.Count -1 then
            InText := InText + ',' ; 
      end;
    result := InText ;
   finally
     Alist.free ;
   end;
end;



procedure TGenSearch.SearchClick(Sender: TObject);
 var
  AClause : String ;
  i : Integer ;
begin

 AClause := aSearchPanel.GetClause  ;
 if (AClause <> '') and (ExtraLimit <> '') then
    AClause := ExtraLimit + ' and ' + AClause
    else
    AClause := ExtraLimit + AClause ;

 if aSearchPanel.DefSql = '' then raise Exception.Create('No Sql for ' + FType);
 ZQGenSearch.SQL.Text := aSearchPanel.DefSql  ;

 if AClause <> '' then
  if pos(' WHERE ',StringReplace(UpperCase(ZQGenSearch.SQL.Text),#13#10 ,' ',[rfreplaceAll])) > 0 then
    ZQGenSearch.SQL.add('and ' + AClause ) else
    ZQGenSearch.SQL.add('where ' + AClause );
 ZQGenSearch.open ;
 aSearchPanel.SaveCollection ;
 if PSearch.Width < 5 then
    PSearch.Width := 5 ;
if not DoNoDoColumns then
 begin
  for i := 0 to DBGrid1.Columns.Count -1 do
   begin
     if AutoFieldCols then
        begin
          if aSearchPanel.GetItemOnFieldOrignName(DBGrid1.Columns[i].FieldName) <> nil then
            begin
                DBGrid1.Columns[i].Title.Caption :=  DMTCCoreLink.GetTextLang(aSearchPanel.GetItemOnFieldOrignName(DBGrid1.Columns[i].FieldName).WColumnTranslation) ;
                if POS(copy(aSearchPanel.GetItemOnFieldOrignName(DBGrid1.Columns[i].FieldName).SControlType,1,1),'O,I,') > 0 then
                 begin
                  DBGrid1.Columns[i].Field.Tag := Integer(aSearchPanel.GetItemOnFieldOrignName(DBGrid1.Columns[i].FieldName));
                  DBGrid1.Columns[i].Field.OnGetText := OnGetText ;
                  DBGrid1.Columns[i].Field.Alignment :=  taRightJustify ;
                 end;
            end else
          DBGrid1.Columns[i].Visible := false ;

        end else
        begin
          if  pos(String('TRN'),String(DBGrid1.Columns[i].FieldName)) = 1 then
            begin
              DBGrid1.Columns[i].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(copy(DBGrid1.Columns[i].FieldName,4,length(DBGrid1.Columns[i].FieldName)),0));
            end else
          if  pos(String('FT_'),String(DBGrid1.Columns[i].FieldName)) = 1 then
            begin
              DBGrid1.Columns[i].Title.Caption := copy(DBGrid1.Columns[i].FieldName,4,1) +  LowerCase(copy(DBGrid1.Columns[i].FieldName,5,length(DBGrid1.Columns[i].FieldName))) ;
            end else
            begin
               DBGrid1.Columns[i].Visible := false ;
            end;
      end ;

   end;
 end;
 TDatabaseRegistyRoutines.LoadGridFromRegistry(DBGrid1,FType+'GENS');
 if not ZQGenSearch.IsEmpty then
   try
   DBGrid1.SetFocus ;
   except
   end;
  if Assigned(FOnSearch) then
    FOnSearch(Sender);
end;

procedure TGenSearch.Init(AType:String);
begin
    FType := AType ;
    if Assigned(aSearchPanel) then
       FreeAndNil(aSearchPanel);
       

    if not Assigned(aSearchPanel) then
    begin
    DMTCCoreLink.AssignConnectionToChilds(self);
    aSearchPanel := TSearchPanel.Create(self) ;

    aSearchPanel.Parent := PSearch;
    aSearchPanel.Align := alclient ;
    end;
    aSearchPanel.SetLookupType(AType);
    if not Assigned(aSearchPanel.onSearch)  then
    aSearchPanel.ScaleBy(screen.PixelsPerInch,96);
    aSearchPanel.onSearch := SearchClick ;
    if aSearchPanel.Caption <> ''  then
    Self.Caption := aSearchPanel.Caption ;

end;


procedure TGenSearch.DBGrid1TitleClick(Column: TColumn);
begin
 if Column.Width > (DBGrid1.ClientWidth-20) then
    Column.Width := DBGrid1.ClientWidth - 30 ;

if ZQGenSearch.Active then
  if ZQGenSearch.IndexFieldNames <> Column.FieldName then
    begin
     ZQGenSearch.IndexFieldNames := Column.FieldName ;
    end else
    begin
      ZQGenSearch.IndexFieldNames := Column.FieldName +' desc';
    end;






end;

procedure TGenSearch.SetOnSearch(const Value: TNotifyEvent);
begin
  FOnSearch := Value;
end;

procedure TGenSearch.FormShow(Sender: TObject);
begin
 if ForceSearch then
   SearchClick(self);
end;

procedure TGenSearch.OnGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
 var
  caseChar : Char ;
begin
// Text := '' ;
 if copy(TSearchCollectionItem(Sender.tag).SControlType,1,1) = 'O' then
  begin
  caseChar :=   TSearchCollectionItem(Sender.tag).SControlType[2] ;
   case caseChar of
    'C' ,'D' ,'G' , 'T','B','A' : Text := TDataBaseRoutines.GetAccountFullDescription(sender.AsInteger) ;
    'S' : Text := TDataBaseStockRoutines.GetStockFullDescription(sender.AsInteger) ;

 end;
 end else
  if (TSearchCollectionItem(Sender.tag).SControlType = 'IL') then
     begin
       if TComboBox(TSearchCollectionItem(Sender.tag).Component).Items.IndexOfObject(Tobject(sender.AsInteger)) <> -1 then
          begin
            Text :=    TComboBox(TSearchCollectionItem(Sender.tag).Component).Items[TComboBox(TSearchCollectionItem(Sender.tag).Component).Items.IndexOfObject(Tobject(sender.AsInteger))] ;
          end;
     end else
  if (TSearchCollectionItem(Sender.tag).SControlType = 'IC') then
     begin
       if TCheckListBox(TSearchCollectionItem(Sender.tag).Component).Items.IndexOfObject(Tobject(sender.AsInteger)) <> -1 then
          begin
            Text :=    TCheckListBox(TSearchCollectionItem(Sender.tag).Component).Items[TCheckListBox(TSearchCollectionItem(Sender.tag).Component).Items.IndexOfObject(Tobject(sender.AsInteger))] ;
          end;
     end;
end;

procedure TGenSearch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  TDatabaseRegistyRoutines.SaveGridToRegistry(DBGrid1,FType+'GENS');
end;

end.
