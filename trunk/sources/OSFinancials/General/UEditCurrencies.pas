unit UEditCurrencies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,    DBAccess , Uni,
  ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, MemDS;

type
  TfmEditCurrencies = class(TForm)
    ZQCurs: TuniQuery;
    ZUSQLCurrency: TUniUpdateSql;
    ZQCursWCURRENCYID: TIntegerField;
    ZQCursSDESCRIPTION: TStringField;
    ZQCursSSYMBOL: TStringField;
    ZQCursFRATE1: TFloatField;
    ZQCursFRATE2: TFloatField;
    ZQCursFRETE3: TFloatField;
    ZQCursFRATE4: TFloatField;
    ZQCursFRATE5: TFloatField;
    ZQCursFRATE6: TFloatField;
    ZQCursFRATE7: TFloatField;
    ZQCursFRATE8: TFloatField;
    ZQCursFRATE9: TFloatField;
    ZQCursFRATE10: TFloatField;
    ZQCursFRATE11: TFloatField;
    ZQCursFRATE12: TFloatField;
    ZQCursFRATE13: TFloatField;
    ZQCursFRATE14: TFloatField;
    ZQCursFRATE15: TFloatField;
    ZQCursFRATE16: TFloatField;
    ZQCursFRATE17: TFloatField;
    ZQCursFRATE18: TFloatField;
    ZQCursFRATE19: TFloatField;
    ZQCursFRATE20: TFloatField;
    ZQCursFRATE21: TFloatField;
    ZQCursFRATE22: TFloatField;
    ZQCursFRATE23: TFloatField;
    ZQCursFRATE24: TFloatField;
    ZQCursFRATE25: TFloatField;
    ZQCursFRATE26: TFloatField;
    ZQCursWCONTRYID: TIntegerField;
    ZQCursWVARIANCEACCOUNTID: TIntegerField;
    ZQCursWNOOFDECIMALS: TIntegerField;
    ZQCursDSYSDATE: TDateTimeField;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    procedure ZQCursBeforeDelete(DataSet: TDataSet);
    procedure ZQCursAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEditCurrencies: TfmEditCurrencies;

implementation

uses UDMTCCoreLink, TcashClasses, UOSFVisuals;

{$R *.dfm}

procedure TfmEditCurrencies.ZQCursBeforeDelete(DataSet: TDataSet);
begin
 if ZQCursWCURRENCYID.AsInteger = 0 then
    begin
      Raise Exception.Create('You cannot delete the default');
    end;
end;

procedure TfmEditCurrencies.ZQCursAfterInsert(DataSet: TDataSet);
begin
   ZQCursWCURRENCYID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWCURRENCYID) ;
   ZQCursFRATE1.AsInteger := 1 ;

end;

procedure TfmEditCurrencies.FormShow(Sender: TObject);
begin
uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
self.Caption := DMTCCoreLink.GetTextLangNoAmp(3470);
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
DBGrid1.Columns[0].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(1706);
DBGrid1.Columns[1].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(178);
DBGrid1.Columns[2].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(3454);
DBGrid1.Columns[4].Title.Caption := DMTCCoreLink.GetTextLangNoAmp(3455);
 ZQCurs.Open ;
end;

procedure TfmEditCurrencies.DBGrid1TitleClick(Column: TColumn);
begin
 if Column.Width > (DBGrid1.ClientWidth-20) then
    Column.Width := DBGrid1.ClientWidth - 30 ;

 if ZQCurs.Active then
  if ZQCurs.IndexFieldNames <> Column.FieldName then
    begin
     ZQCurs.IndexFieldNames := Column.FieldName ;
    end else
    begin
       ZQCurs.IndexFieldNames := Column.FieldName +' desc'; 
    end;



end;

procedure TfmEditCurrencies.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
end;

end.
