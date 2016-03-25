unit UDmQuantumGridDefs;

interface

uses
  SysUtils, Classes, cxEdit, cxEditRepositoryItems, cxStyles, cxClasses,
  cxGridTableView,cxImageComboBox,cxGridCustomTableView,cxGridBandedTableView,
  cxGridDBBandedTableView, cxHint, cxContainer, cxLookAndFeels,
  cxGridCardView;

type
  TdmQuantumGridDefs = class(TDataModule)
    cxStyleRepository1: TcxStyleRepository;
    cxFooter: TcxStyle;
    cxGroupByBox: TcxStyle;
    cxHeader: TcxStyle;
    cxEditRepository1: TcxEditRepository;
    osfDBCheckbox: TcxEditRepositoryCheckBoxItem;
    osfTypePeriod: TcxEditRepositoryImageComboBoxItem;
    GridTableViewStyleSheetWindowsStandard: TcxGridTableViewStyleSheet;
    cxBackground: TcxStyle;
    cxContentOdd: TcxStyle;
    cxContentEven: TcxStyle;
    cxgroup: TcxStyle;
    cxInavtive: TcxStyle;
    osfCalcEdit: TcxEditRepositoryCalcItem;
    osFcurrencyEdit: TcxEditRepositoryCurrencyItem;
    osfCuWithHighDecimal: TcxEditRepositoryCurrencyItem;
    osfQtyWithHighDecimals: TcxEditRepositoryCurrencyItem;
    GridBandedTableViewStyleSheetWindowsStandard: TcxGridBandedTableViewStyleSheet;
    cxSelection: TcxStyle;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxEditStyleController1: TcxEditStyleController;
    cxHintStyleController1: TcxHintStyleController;
    cxDefaultEditStyleController1: TcxDefaultEditStyleController;
    GridCardViewStyleSheetWindowsStandard: TcxGridCardViewStyleSheet;

   // function FillStringsWithReportingGroups(AList: TcxImageComboBoxProperties;TpGroupID:integer): Boolean;
    // function  FillStringsWithSelect(AList: TcxImageComboBoxProperties;asql:string):Boolean;
    function getRecordValuesAsString(GridRecord: TcxCustomGridRecord):String ;
   // procedure DataModuleCreate(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmQuantumGridDefs: TdmQuantumGridDefs;

implementation

uses   cxGridDBDataDefinitions,variants ;


{$R *.dfm}
{
 function  TdmQuantumGridDefs.FillStringsWithReportingGroups(AList: TcxImageComboBoxProperties;TpGroupID:integer):Boolean;
  var
   LocalList : TStringList ;
   i : Integer ;
begin

  AList.Items.Clear ;
  AList.BeginUpdate ;
 LocalList := TStringList.create ;
 try
 result := TDataBaseRoutines.FillStringsWithReportingGroups(LocalList,TpGroupID,false) ;
 for i := 0 to LocalList.Count -1 do
    with AList.Items.Add do
      begin
         Description := LocalList[i] ;
         Value := Integer(LocalList.objects[i]) ;
      end;
 finally
  LocalList.free ;
  AList.EndUpdate ;
 end;
end;

 function  TdmQuantumGridDefs.FillStringsWithSelect(AList: TcxImageComboBoxProperties;asql:string):Boolean;
  var
   LocalList : TStringList ;
   i : Integer ;
   aquery : TUniQuery ;
begin
   aquery := TUniQuery.create(nil) ;
   try
   aquery.Connection := DMTCCoreLink.TheZConnection ;
   aquery.SQL.Text := asql ;
   aquery.open ;

  AList.Items.Clear ;
  AList.BeginUpdate ;
  try
     while not aquery.Eof do
      begin
    with AList.Items.Add do
      begin
         Description := aquery.fields[1].asstring  ;
         Value := aquery.fields[0].value ;
      end;
       aquery.next ;
     end;


 finally

  AList.EndUpdate ;
 end;
 finally
   aquery.free ;
 end;
end;

    }
function TdmQuantumGridDefs.getRecordValuesAsString(   GridRecord: TcxCustomGridRecord): String;
  var
   i : Integer ;
begin
  result := '' ;
  for i := 0 to GridRecord.ValueCount -1 do
    begin
     if ( GridRecord.ViewData.GridView.Items[i] is TcxGridDBBandedColumn) then
        begin
        if Result<>'' then Result:= Result + #13+#10 ;
        Result:= Result +        ( GridRecord.ViewData.GridView.Items[i] as TcxGridDBBandedColumn).DataBinding.FieldName +'=' + varToStr(GridRecord.Values[i]);
        end;
    end ;


end;
       {
procedure TdmQuantumGridDefs.DataModuleCreate(Sender: TObject);
begin


osfTypePeriod.Properties.Items.Items[0].Description  := DMTCCoreLink.GetTextLangNoAmp(901017) ;
osfTypePeriod.Properties.Items.Items[1].Description  :=DMTCCoreLink.GetTextLangNoAmp(901018) ;
osfTypePeriod.Properties.Items.Items[2].Description  :=DMTCCoreLink.GetTextLangNoAmp(901019) ;
osfTypePeriod.Properties.Items.Items[3].Description  :=DMTCCoreLink.GetTextLangNoAmp(901020) ;
osfTypePeriod.Properties.Items.Items[4].Description  :=DMTCCoreLink.GetTextLangNoAmp(901021) ;
osfTypePeriod.Properties.Items.Items[5].Description  :=DMTCCoreLink.GetTextLangNoAmp(901022) ;
end;
     }
end.
