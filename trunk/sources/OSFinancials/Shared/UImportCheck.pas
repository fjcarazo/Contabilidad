(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit UImportCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids,ExchangeTCData,
  DB,DBclient;

type
  TImportCheck = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    DataSource1: TDataSource;
    cdDoubles: TClientDataSet;
    cdDoublesCODE: TStringField;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BDoublesClick(Sender: TObject);
    procedure cdsonFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    oktoall : Boolean ;
    { Public declarations }
  end;

var
  ImportCheck: TImportCheck;

procedure myImportCheck (AClientDataset : TClientDataset;ImportType:String) ;

implementation

uses UDMTCCoreLink, UOSFVisuals;

{$R *.dfm}
procedure myImportCheck (AClientDataset : TClientDataset;ImportType:String) ;
begin
    if ImportCheck.oktoall then exit ;
    ImportCheck.DataSource1.DataSet := AClientDataset ;
    if  ImportCheck.ShowModal <> mrok then
        begin
           raise Exception.Create(DMTCCoreLink.GetTextLang(3072){'Abort import!'});
        end;
end;


procedure TImportCheck.FormCreate(Sender: TObject);
begin
  uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
  OnImportClientDataset :=  myImportCheck ;
end;

procedure TImportCheck.FormDestroy(Sender: TObject);
begin
  OnImportClientDataset :=  nil ;
  
end;

procedure TImportCheck.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
Var
 CodeField  : TField ;
 i : integer ;
 lastcode : String ;
begin
 CodeField := DataSource1.DataSet.FindField('SACCOUNTCODE');
 if CodeField <> nil then
    begin
       if cdDoubles.Locate('CODE',CodeField.ASString,[]) then
          DBGrid1.Canvas.Brush.Color := clred ;
    end;
  DBGrid1.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TImportCheck.BDoublesClick(Sender: TObject);

Var
 CodeField  : TField ;
 i : integer ;
 lastcode : String ;
 function IsNotValide : Boolean ;
  var
   x : Integer ;
   Text : String ;
  begin
    result := false ;
    Text := CodeField.AsString ;
    if Text = '' then
       begin
       result := true ;
       exit ;
       end;
    for x := 1 to length(Text) do
      begin
         if (Text[x] in [' ','-',#13,#9,#10]) then
           begin
            result := true ;
            exit ;
           end;
      end;
  end;
begin
 CodeField := DataSource1.DataSet.FindField('SACCOUNTCODE');
 if CodeField = nil then exit ;

 DataSource1.DataSet.DisableControls ;
 try
 if TClientDataset(DataSource1.DataSet).IndexName = '' then
   begin
    TClientDataset(DataSource1.DataSet).IndexDefs.Add('IX_CODE',CodeField.fieldname,[]) ;
    TClientDataset(DataSource1.DataSet).IndexName := 'IX_CODE';
   end;
 DataSource1.DataSet.first ;
 cdDoubles.EmptyDataSet ;
 lastcode := '' ;
 while not  DataSource1.DataSet.eof do
   begin
      if (lastcode =  CodeField.AsString) or IsNotValide then
         begin
           if not cdDoubles.Locate('CODE',lastcode,[]) then
             begin
                cdDoubles.Insert ;
                cdDoublesCODE.AsString :=  lastcode ;
                cdDoubles.Post ;
             end;
         end;
     lastcode := CodeField.AsString ;

     DataSource1.DataSet.next ;
   end;
  finally
     DataSource1.DataSet.EnableControls ;
  end;
 CheckBox1.Visible := cdDoubles.RecordCount <> 0 ;
end;

procedure TImportCheck.cdsonFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
Var
 CodeField  : TField ;
 i : integer ;
 lastcode : String ;
begin
 CodeField := DataSource1.DataSet.FindField('SACCOUNTCODE');
 if CodeField <> nil then
  accept :=  cdDoubles.Locate('CODE',CodeField.ASString,[]) ;

end;

procedure TImportCheck.CheckBox1Click(Sender: TObject);
begin
 TClientDataSet(DataSource1.DataSet).Filtered :=  CheckBox1.checked ;
 TClientDataSet(DataSource1.DataSet).OnFilterRecord := cdsonFilterRecord ;

end;

procedure TImportCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
TClientDataSet(DataSource1.DataSet).OnFilterRecord := nil ;
end;

procedure TImportCheck.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Ok');


 BDoublesClick(self);

end;

procedure TImportCheck.BitBtn1Click(Sender: TObject);
begin
oktoall := true ;
end;

end.
