unit USearchGenSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZConnection, DB, ZAbstractRODataset, DBAccess , Uni, Grids, DBGrids,
  Buttons, StdCtrls, ExtCtrls, MemDS;

type
  TGenSearchSqlFrom = class(TForm)
    Panel1: TPanel;
    BSearch: TButton;
    cbParams: TComboBox;
    EParams: TEdit;
    PBotom: TPanel;
    btnok: TBitBtn;
    btncancel: TBitBtn;
    DBGrid1: TDBGrid;
    ZQSearch: TuniQuery;
    dsSearch: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cbParamsChange(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure EParamsChange(Sender: TObject);
    procedure EParamsKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
   procedure Search(Asql : String ; AConnection : TUniconnection );
    { Public declarations }
  end;

var
  GenSearchSqlFrom: TGenSearchSqlFrom;

implementation

uses UDMTCCoreLink;

{$R *.dfm}

procedure TGenSearchSqlFrom.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(btnok.Glyph,'Ok');
 DMTCCoreLink.LoadImage(btncancel.Glyph,'Cancel');
 btnok.Caption := DMTCCoreLink.GetTextLang(167);
 btncancel.Caption := DMTCCoreLink.GetTextLang(168);
end;

procedure TGenSearchSqlFrom.Search(Asql: String; AConnection: TUniconnection );
  var
   i : Integer ;
begin
  cbParams.Clear ;
  ZQSearch.SQL.Text := Asql ;
  ZQSearch.Connection := AConnection ;
  for i:= 0 to ZQSearch.Params.Count -1 do
     begin
      cbParams.items.Add(ZQSearch.Params[i].Name);
     end;
  cbParams.Visible := cbParams.Items.Count <> 0 ;
  EParams.Visible := cbParams.Items.Count <> 0 ;
  if cbParams.Items.Count = 0 then
    begin
       cbParams.ItemIndex := 0 ;
       cbParamsChange(self);
    end;
end;

procedure TGenSearchSqlFrom.cbParamsChange(Sender: TObject);
begin
 if cbParams.itemindex <> -1 then
 EParams.Text := ZQSearch.Params[cbParams.itemindex].AsString ;
end;

procedure TGenSearchSqlFrom.BSearchClick(Sender: TObject);
begin
  if cbParams.itemindex <> -1 then
   ZQSearch.Params[cbParams.itemindex].AsString := EParams.Text ;
   ZQSearch.Close ;
   ZQSearch.Open ;
end;

procedure TGenSearchSqlFrom.EParamsChange(Sender: TObject);
begin
 if cbParams.itemindex <> -1 then
  ZQSearch.Params[cbParams.itemindex].AsString := EParams.Text ;
end;

procedure TGenSearchSqlFrom.EParamsKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   BSearchClick(self);
end;

procedure TGenSearchSqlFrom.DBGrid1DblClick(Sender: TObject);
begin
 if not DBGrid1.DataSource.DataSet.IsEmpty then
  ModalResult := mrOk ;
end;

procedure TGenSearchSqlFrom.DBGrid1TitleClick(Column: TColumn);
begin
  if ZQSearch.IndexFieldNames = Column.FieldName then
    ZQSearch.IndexFieldNames := Column.FieldName +' desc'
    else
    ZQSearch.IndexFieldNames := Column.FieldName ;
end;

end.
