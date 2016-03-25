unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls ,JvMemoryDataset, janXMLParser2, ExtCtrls, DBCtrls,
  Grids, DBGrids, DB, DBClient, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ClientDataSet1: TClientDataSet;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DataSource2: TDataSource;
    BitBtn1: TBitBtn;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    DataSource3: TDataSource;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

    { Private declarations }
  public
     aDataset : TJvMemoryData  ;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DateUtils;


{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

begin
 aDataset.Close ;
 LoadXMLFromString(Memo1.Lines.Text,aDataset);
 DBGrid1.Columns.RebuildColumns ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 aDataset := TJvMemoryData.create(nil)  ;
 DataSource1.DataSet :=  aDataset ;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 aDataset.free ;
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
ClientDataSet1.MergeChangeLog ;
Memo1.Text := ClientDataSet1.XMLData ;
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
 Memo1.Lines.Text := DataSetToXmlString(aDataset);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 aDataset.
end;

end.
