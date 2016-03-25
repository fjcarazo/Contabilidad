unit USelectSearchFromEditForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni, StdCtrls;

type
  TFSelectSearch = class(TForm)
    ListBox1: TListBox;
    Bok: TButton;
    ZQGetList: TuniQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    function GetSelectedType(AMastertable : String ) : String;

implementation

uses UDMTCCoreLink;

{$R *.dfm}

procedure TFSelectSearch.FormCreate(Sender: TObject);
begin
    DMTCCoreLink.AssignConnectionToChilds(self);
end;

function GetSelectedType(AMastertable: String): String;
var
  FSelectSearch: TFSelectSearch;
begin

  FSelectSearch:= TFSelectSearch.create(Application);
  try
  with FSelectSearch do
  begin
  Result := '' ;
  ListBox1.items.clear ;
  ZQGetList.close ;
  ZQGetList.params[0].asstring := UpperCase(AMastertable);
  ZQGetList.open ;

  while not ZQGetList.eof do
     begin
        ListBox1.Items.Add(ZQGetList.Fields[0].asstring) ;
        ZQGetList.next ;
     end;
  if ListBox1.Items.Count > 0 then
     ListBox1.ItemIndex := 0 ;
  if ListBox1.Items.Count > 1 then
     ShowModal else
     result := ZQGetList.Fields[0].asstring ;
  if ListBox1.ItemIndex > 0 then
    begin
       Result := ListBox1.Items[ListBox1.itemIndex] ;
    end;
  end;
  finally
   FSelectSearch.free ;
  end;
end;

end.
