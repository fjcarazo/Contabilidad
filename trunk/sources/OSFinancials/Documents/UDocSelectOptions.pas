unit UDocSelectOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,DBAccess , Uni,
   DB,   Grids, DBGrids,
  ComCtrls, Mask, DBCtrls, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,cxEditRepositoryItems, cxContainer, cxTextEdit,
  cxCurrencyEdit, cxDBEdit, cxMaskEdit, cxDropDownEdit, Menus, cxTreeView,
  ValEdit, VirtualTable;

type
  TDocSelectOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    ZQOptions: TuniQuery;
    ZQOptionsWDOCLINEOPTIONSID: TIntegerField;
    ZQOptionsWDOCID: TIntegerField;
    ZQOptionsWLINEID: TIntegerField;
    ZQOptionsWITEMOPTIONVALUE1ID: TIntegerField;
    ZQOptionsWITEMOPTIONVALUE2ID: TIntegerField;
    ZQOptionsWITEMOPTIONVALUE3ID: TIntegerField;
    ZQOptionsWITEMOPTIONVALUE4ID: TIntegerField;
    ZQOptionsWITEMOPTIONVALUE5ID: TIntegerField;
    ZQOptionsFEXTRAPRICE: TFloatField;
    ZQOptionsFQTY: TFloatField;
    ZQOptionsWDESCRIPTIONID: TIntegerField;
    ZUSQLOptions: TUniUpdateSql;
    ZQStockOptions: TuniQuery;
    ZQStockOptionsWSTOCKOPTIONSID: TIntegerField;
    ZQStockOptionsWSTOCKID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE1ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE2ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE3ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE4ID: TIntegerField;
    ZQStockOptionsWITEMOPTIONVALUE5ID: TIntegerField;
    ZQStockOptionsFEXTRAPRICE: TFloatField;
    ZQStockOptionsFQTYONHAND: TFloatField;
    ZQStockOptionsSBARCODE: TStringField;
    ZQStockOptionsSREFERENCE: TStringField;
    ZQStockOptionsFUNITCOST: TFloatField;
    ZQStockOptionsFUNITAVECOST: TFloatField;
    dsGridOptions: TDataSource;
    PageControl1: TPageControl;
    tsGridview: TTabSheet;
    tsTreeview: TTabSheet;
    TreeView1: TcxTreeView;
    PDetail: TPanel;
    LQty: TLabel;
    DBEdit1: TDBEdit;
    dsOptions: TDataSource;
    LExtraPrice: TLabel;
    DBEdit2: TDBEdit;
    ZQSelDestinct: TuniQuery;
    ZQStockDef: TuniQuery;
    ZQStockDefWSTOCKID: TIntegerField;
    ZQStockDefWITEMOPTION1ID: TIntegerField;
    ZQStockDefWITEMOPTION2ID: TIntegerField;
    ZQStockDefWITEMOPTION3ID: TIntegerField;
    ZQStockDefWITEMOPTION4ID: TIntegerField;
    ZQStockDefWITEMOPTION5ID: TIntegerField;
    ZQStockDefWLEVEL: TIntegerField;
    ZQStockDefWSTOCKTYPEID: TIntegerField;
    ZQStockDefWLOOKUPTYPE: TIntegerField;
    ZQStockDefSDESCRIPTION: TStringField;
    DBText1: TDBText;
    DataSource2: TDataSource;
    TSOptionView: TTabSheet;
    LPrice2: TLabel;
    DBEdit3: TDBEdit;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Lqty2: TLabel;
    dbQty2: TDBEdit;
    Qtyonhand: TMemo;
    ZQStockOptionsFREORDERQTY: TFloatField;
    ZQStockOptionsFREORDERQTYTRIG: TFloatField;
    ZQStockOptionsFEXTRAPRICE2: TFloatField;
    ZQStockOptionsFEXTRAPRICE3: TFloatField;
    cxoptionsDBTableView1: TcxGridDBTableView;
    cxoptionsLevel1: TcxGridLevel;
    cxoptions: TcxGrid;
    PopupMenu1: TPopupMenu;
    price1: TMenuItem;
    price2: TMenuItem;
    price3: TMenuItem;
    cxEditRepository1: TcxEditRepository;
    pricecombo: TcxEditRepositoryComboBoxItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure HandleNextLevel(ANode :TTreeNode) ;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OnExitOptions(Sender: TObject);
    procedure ZQOptionsWITEMOPTIONVALUE1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure ZQOptionsFEXTRAPRICEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQOptionsFEXTRAPRICESetText(Sender: TField;
      const Text: String);
    procedure ZQOptionsAfterInsert(DataSet: TDataSet);
    procedure ZQOptionsFQTYSetText(Sender: TField; const Text: String);
    procedure ZQMemDataSetText(Sender: TField;
      const Text: String);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dbQty2DblClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure cxoptionsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure price1Click(Sender: TObject);
    procedure cxoptionsDBTableView1InitEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
  private
    { Private declarations }
    procedure BuildOptionsView ;

  public
    Level,LineID,Accountid,Docid,DocType,LastLineTaxID : Integer ;
    LastInclusive : Boolean ;
    LastStdStockPrice : Double ;
    AValuesList : TStringlist ;
    aoptionsDataset : TVirtualTable ;
    ColumnList : TStringlist ;
    lstQty,lstTotal : Double ;

    procedure doLocateBarcode(abarcode : String );
    Procedure InitForStock(AStockid,ALineid,TaxID : Integer;Inclusive:Boolean;LocateBarCode:String ) ;
    function GetAccountPrice : Double ;
    Procedure InitDoc(Adocid ,AAccountid: Integer; aDocType:Integer) ;
    function GetLineText(ALine : Integer) : String ;
    procedure DoPost(ADocid : Integer) ;
    procedure CopyFromDocLine(ADocID,ALineid : Integer ) ;
    procedure deleteline(AlineId : Integer) ;
    procedure DoCancel ;


    function GetOptionItemValueName(AOptionItemValueid:Integer ) : String;
    { Public declarations }
  end;


implementation

uses UDMTCCoreLink, OSFGeneralRoutines, Math, Types, UDmQuantumGridDefs;

{$R *.dfm}

{ TDocSelectOptions }

procedure TDocSelectOptions.DoCancel;
begin

end;

procedure TDocSelectOptions.DoPost(ADocid : Integer);
begin
  if ZQOptions.Active then
  begin
  if (ZQOptions.State in [dsEdit,dsInsert]) then
      ZQOptions.Post ;
  ZQOptions.Filtered := false ;
  ZQOptions.First ;
  while not ZQOptions.Eof do
     begin
       if ZQOptionsWDOCID.AsInteger = 0 then
         begin
          ZQOptions.edit ;
          ZQOptionsWDOCID.AsInteger := ADocid ;
          ZQOptionsWDOCLINEOPTIONSID.AsInteger := DMTCCoreLink.GetNewIdStr('DOCLINEOPTIONS');
          ZQOptions.post ;
         end;
         ZQOptions.Next ;
     end;
 if ZQOptions.UpdatesPending then
     ZQOptions.ApplyUpdates ;

  end;
end;

procedure TDocSelectOptions.InitForStock(AStockid, ALineid,TaxID : Integer;Inclusive:Boolean;LocateBarCode:String);
var
 i : Integer ;


begin
 dsGridOptions.DataSet := nil ;
  Level := 0 ;
 for i := TSOptionView.ComponentCount -1 downto 0 do
     TSOptionView.Components[i].free ;
 LastLineTaxID := TaxID ;
 LastInclusive := Inclusive ;
 LastStdStockPrice := 0 ;
 LineID := ALineid ;
 aoptionsDataset.close ;
 aoptionsDataset.FieldDefs.clear ;
 aoptionsDataset.DisableControls ;
 try
 aoptionsDataset.AfterInsert := ZQOptionsAfterInsert ;
 ZQStockOptions.close ;
 ZQStockOptions.Params[0].AsInteger := AStockid ;
 ZQStockOptions.open ;
 ZQStockDef.close ;
 ZQStockDef.Params[0].AsInteger := AStockid ;
 ZQStockDef.open ;

 if ZQStockDef.IsEmpty then
   exit ;

 LastStdStockPrice := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockDefWSTOCKID.AsInteger,1) ;

 TDatabaseRegistyRoutines.ReadFormPos(self,ZQStockDefWITEMOPTION1ID.AsString);

 if ZQStockOptions.IsEmpty then
   if ZQStockDefWSTOCKTYPEID.AsInteger = 7 then
   exit ;

 tsGridview.TabVisible := false ;
 tsTreeview.TabVisible := false ;
 TSOptionView.TabVisible := false ;

 if ZQStockDefWSTOCKTYPEID.AsInteger = 8 then
 begin
   PageControl1.ActivePage := TSOptionView ;

 end else
 begin
 if ZQStockDefWLOOKUPTYPE.AsInteger = 0 then
 PageControl1.ActivePage := tsGridview
 else
  PageControl1.ActivePage := tsTreeview ;

  if ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger <> 0 then
   Level := 1 ;
  if ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger <> 0 then
   Level := 2 ;
  if ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger <> 0 then
   Level := 3 ;
  if ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger <> 0 then
   Level := 4 ;
 end;

 if PageControl1.ActivePage = tsGridview then
 begin
 if Level > 0 then
   begin
     ColumnList.clear ;
     ZQStockOptions.First ;
     while not ZQStockOptions.Eof  do
       begin
         if ColumnList.IndexOfObject(Tobject(ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger)) = -1 then
           ColumnList.AddObject(GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger),Tobject(ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger)) ;
         ZQStockOptions.next ;
      end;
     aoptionsDataset.close ;
     aoptionsDataset.FieldDefs.clear ;
     aoptionsDataset.FieldDefs.Add('SDESCRIPTION',ftString,254);
     aoptionsDataset.FieldDefs.Add('WITEMOPTIONVALUE2ID',ftInteger);
     aoptionsDataset.FieldDefs.Add('WITEMOPTIONVALUE3ID',ftInteger);
     aoptionsDataset.FieldDefs.Add('WITEMOPTIONVALUE4ID',ftInteger);
     aoptionsDataset.FieldDefs.Add('WITEMOPTIONVALUE5ID',ftInteger);
     for i:= 0 to  ColumnList.Count -1 do
       begin
         aoptionsDataset.FieldDefs.Add('FEXTRAPRICE'+ IntToStr(Integer(ColumnList.Objects[i])),ftFloat);
         aoptionsDataset.FieldDefs.Add('FQTY'+ IntToStr(Integer(ColumnList.Objects[i])),ftFloat);
         aoptionsDataset.FieldDefs.Add('FQTYONHAND'+ IntToStr(Integer(ColumnList.Objects[i])),ftFloat);
       end;
     aoptionsDataset.open ;
     for i:= 0 to  ColumnList.Count -1 do
       begin
         aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(Integer(ColumnList.Objects[i]))).DisplayLabel := ColumnList[i] +' ' + DMTCCoreLink.GetTextLang(1132) ;
         aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).DisplayLabel := ColumnList[i] +' ' + DMTCCoreLink.GetTextLang(413) ; ;
         aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).OnSetText := ZQMemDataSetText ;
         aoptionsDataset.FieldByName('FQTYONHAND'+ IntToStr(Integer(ColumnList.Objects[i]))).Visible := false ;

         TFloatField(aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(Integer(ColumnList.Objects[i])))).DisplayFormat := '0.00' ;
      end;
      aoptionsDataset.FieldByName('WITEMOPTIONVALUE2ID').Visible := false ;
      aoptionsDataset.FieldByName('WITEMOPTIONVALUE3ID').Visible := false ;
      aoptionsDataset.FieldByName('WITEMOPTIONVALUE4ID').Visible := false ;
      aoptionsDataset.FieldByName('WITEMOPTIONVALUE5ID').Visible := false ;
     aoptionsDataset.FieldByName('SDESCRIPTION').DisplayLabel := DMTCCoreLink.GetTextLang(178) ;
     aoptionsDataset.FieldByName('SDESCRIPTION').DisplayWidth := 20 ;
     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALineid);
     ZQOptions.Filtered := true ;
     ZQOptions.First ;
     ZQStockOptions.First ;
     while not ZQStockOptions.Eof  do
         begin
           if not aoptionsDataset.Locate('WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',
             VarArrayOf([ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger,
             ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger]) ,[]) then
             begin
              aoptionsDataset.Append ;
              aoptionsDataset.FieldByName('WITEMOPTIONVALUE2ID').AsInteger := ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger ;
              aoptionsDataset.FieldByName('WITEMOPTIONVALUE3ID').AsInteger := ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger ;
              aoptionsDataset.FieldByName('WITEMOPTIONVALUE4ID').AsInteger := ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger ;
              aoptionsDataset.FieldByName('WITEMOPTIONVALUE5ID').AsInteger := ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger ;
              aoptionsDataset.FieldByName('SDESCRIPTION').AsString := Trim(GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger) + ' ' + GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger)
              + ' ' + GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger) + ' ' + GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger));
             end else aoptionsDataset.Edit ;

         i := ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger ;
         if (DocType in [10,11,14]) then
             aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(i)).AsFloat := LastStdStockPrice  + GetAccountPrice
             else
             aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(i)).AsFloat := ZQStockOptionsFUNITCOST.AsFloat ;


          if Inclusive then
             begin
                aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(i)).AsFloat := aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(i)).AsFloat * TDataBaseRoutines.GetTaxRateOnId(TaxID) ;
             end;

         if ZQOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',
             VarArrayOf([ZQStockOptionsWITEMOPTIONVALUE1ID.value,ZQStockOptionsWITEMOPTIONVALUE2ID.value,ZQStockOptionsWITEMOPTIONVALUE3ID.value,
             ZQStockOptionsWITEMOPTIONVALUE4ID.value,ZQStockOptionsWITEMOPTIONVALUE5ID.value]) ,[]) then
              begin
                aoptionsDataset.FieldByName('FQTY'+ IntToStr(i)).AsFloat := ZQOptionsFQTY.AsFloat ;
                aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(i)).AsFloat := ZQOptionsFEXTRAPRICE.AsFloat ;
              end;
           aoptionsDataset.FieldByName('FQTYONHAND'+ IntToStr(i)).AsFloat :=  ZQStockOptionsFQTYONHAND.AsFloat -  TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersOptions(ZQStockDefWSTOCKID.AsInteger,Docid,ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger,
             ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger,0);

           aoptionsDataset.Post ;
           ZQStockOptions.Next ;
        end;
   end else
   begin
     aoptionsDataset.close ;
     aoptionsDataset.FieldDefs.clear ;
     aoptionsDataset.FieldDefs.Add('WITEMOPTIONVALUE1ID',ftInteger);
     aoptionsDataset.FieldDefs.Add('SDESCRIPTION',ftString,DMTCCoreLink.MessageLength);
     aoptionsDataset.FieldDefs.Add('FEXTRAPRICE',ftFloat);
     aoptionsDataset.FieldDefs.Add('FQTY',ftFloat);
     aoptionsDataset.FieldDefs.Add('FQTYONHAND',ftFloat);
     aoptionsDataset.open ;
     aoptionsDataset.FieldByName('WITEMOPTIONVALUE1ID').Visible := false ;
     aoptionsDataset.FieldByName('FQTYONHAND').Visible := false ;


     aoptionsDataset.FieldByName('FEXTRAPRICE').DisplayLabel := DMTCCoreLink.GetTextLang(1132) ;
     TFloatField(aoptionsDataset.FieldByName('FEXTRAPRICE')).DisplayFormat := '0.00' ;
     aoptionsDataset.FieldByName('FQTY').DisplayLabel := DMTCCoreLink.GetTextLang(413) ;
     aoptionsDataset.FieldByName('SDESCRIPTION').DisplayLabel := DMTCCoreLink.GetTextLang(3148) ;

     aoptionsDataset.FieldByName('FQTY').OnSetText := ZQMemDataSetText ;


     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALineid);
     ZQOptions.Filtered := true ;
     ZQOptions.First ;
     ZQStockOptions.First ;
     while not ZQStockOptions.Eof  do
         begin
           aoptionsDataset.Append ;
           aoptionsDataset.FieldByName('FQTYONHAND').AsFloat :=  ZQStockOptionsFQTYONHAND.AsFloat -  TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchasesAndOrdersOptions(ZQStockDefWSTOCKID.AsInteger,Docid,ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger,
             ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger,ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger,0);
           aoptionsDataset.FieldByName('SDESCRIPTION').AsString := GetOptionItemValueName(ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger)  + ' (' + FloatToStr(aoptionsDataset.FindField('FQTYONHAND').AsFloat) + ')';

         if (DocType in [10,11,14]) then
             aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat := LastStdStockPrice + GetAccountPrice
             else
             aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat := ZQStockOptionsFUNITCOST.AsFloat ;



           aoptionsDataset.FieldByName('WITEMOPTIONVALUE1ID').AsInteger := ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger ;
           if ZQOptions.Locate('WITEMOPTIONVALUE1ID',ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,[]) then
              begin
                aoptionsDataset.FieldByName('FQTY').AsFloat :=  ZQOptionsFQTY.AsFloat ;
                aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat := ZQOptionsFEXTRAPRICE.AsFloat ;
              end;
          if Inclusive then
             begin
                aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat := aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat * TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
             end;
           aoptionsDataset.post ;  
           ZQStockOptions.Next ;
        end;
   end;


  if LocateBarCode <> '' then
    Dolocatebarcode(LocateBarCode);
  end else // end gridview
  if  PageControl1.ActivePage = tsTreeview then
  begin
     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALineid);
     ZQOptions.Filtered := true ;
     ZQOptions.First ;
    TreeView1.Items.BeginUpdate ;
    try
     TreeView1.Items.Clear ;
     ZQSelDestinct.sql.Text := 'select distinct(WITEMOPTIONVALUE1ID) from STOCKOPTIONS where WStockid =:WStockid ' ;
     ZQSelDestinct.Params[0].AsInteger := ZQStockOptions.Params[0].AsInteger ;
     ZQSelDestinct.Open ;
     HandleNextLevel(nil);
      finally
        TreeView1.Items.EndUpdate ;
      end;
  end else // end treeview
  begin
     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALineid);
     ZQOptions.Filtered := true ;
     ZQOptions.First ;  
    BuildOptionsView ;
  end;

  if not BtnOk.Enabled then
    begin
       DBGrid2.ReadOnly := true ;
       cxoptionsDBTableView1.OptionsData.Editing := False ;
       treeview1.ReadOnly := true ;
       PDetail.Enabled := false ;
    end else
    begin
       DBGrid2.ReadOnly := False ;
       cxoptionsDBTableView1.OptionsData.Editing := true ;
       treeview1.ReadOnly := False ;
       PDetail.Enabled := True ;
    end;

  finally
    aoptionsDataset.EnableControls ;
  end;
 if PageControl1.ActivePage = tsGridview then
  begin
    dsGridOptions.DataSet := aoptionsDataset ;
     FOR I := cxoptionsDBTableView1.ColumnCount -1 downto 0 do
       cxoptionsDBTableView1.Columns[i].free ;


    cxoptionsDBTableView1.DataController.CreateAllItems(True);
    try
    cxoptionsDBTableView1.RestoreFromRegistry('Software\osfinancials\gridsopt\FF'+   ZQStockDefWITEMOPTION1ID.AsString +'-' + ZQStockDefWITEMOPTION2ID.AsString +'-'
     + ZQStockDefWITEMOPTION3ID.AsString +'-' + ZQStockDefWITEMOPTION4ID.AsString +'-' + ZQStockDefWITEMOPTION5ID.AsString +'-' ,false);
     except
       cxoptionsDBTableView1.RestoreDefaults ;
     end;

    if cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE1ID') <> nil then
    begin
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE1ID').SortIndex := 0 ;
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE1ID').SortOrder := soDescending ;
    end;
    if cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE2ID') <> nil then
    begin
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE2ID').SortIndex := 1 ;
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE2ID').SortOrder := soDescending ;

    end;
     if cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE3ID') <> nil then
    begin
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE3ID').SortOrder := soDescending ;
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE3ID').SortIndex := 2 ;

    end;
     if cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE4ID') <> nil then
    begin
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE4ID').SortIndex := 3 ;
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE4ID').SortOrder := soDescending ;
    end;
    if cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE5ID') <> nil then
    begin
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE5ID').SortIndex := 4 ;
    cxoptionsDBTableView1.DataController.GetItemByFieldName('WITEMOPTIONVALUE5ID').SortOrder := soDescending ;

    end;





    for i := 0 to cxoptionsDBTableView1.ColumnCount -1 do
      begin
         if copy(cxoptionsDBTableView1.Columns[i].DataBinding.FieldName,1,4) ='FQTY' then
           begin
                cxoptionsDBTableView1.Columns[i].PropertiesClass := tcxcurrencyEditProperties;
                tcxcurrencyEditProperties(cxoptionsDBTableView1.Columns[i].Properties).DisplayFormat := '0.########;-0.########'  ;
                tcxcurrencyEditProperties(cxoptionsDBTableView1.Columns[i].Properties).EditFormat := '0.########;-0.########' ;
           end else
         if copy(cxoptionsDBTableView1.Columns[i].DataBinding.FieldName,1,11) ='FEXTRAPRICE' then
           begin
                cxoptionsDBTableView1.Columns[i].RepositoryItem := pricecombo ;
                {PropertiesClass := tcxcurrencyEditProperties;
                tcxcurrencyEditProperties(cxoptionsDBTableView1.Columns[i].Properties).DisplayFormat := ',###,##0.00;-,###,##0.00'  ;
                tcxcurrencyEditProperties(cxoptionsDBTableView1.Columns[i].Properties).EditFormat := '0.00#######;-0.00######' ;}
           end else
           cxoptionsDBTableView1.Columns[i].Options.Editing := False ;
      end;
    If cxoptionsDBTableView1.ColumnCount > 2 then
     cxoptionsDBTableView1.Controller.FocusedColumnIndex := 2 ;
   end;
  if LocateBarCode <> '' then
    BtnOkClick(self)
  else
  ShowModal ;
end;

procedure TDocSelectOptions.FormCreate(Sender: TObject);
var
 i :Integer ;
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
  aoptionsDataset := TVirtualTable.Create(self) ;
  AValuesList := TStringlist.create ;
  ColumnList := TStringlist.Create ;
 cxoptions.ScaleBy(Trunc(100 * glScaleByPerc),100);
  DBGrid2.ScaleBy(Trunc(100 * glScaleByPerc),100);
  TreeView1.ScaleBy(Trunc(100 * glScaleByPerc),100);
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);//Btn Cancel
 BtnOk.Caption := DMTCCoreLink.GetTextLang(167);//Btn Ok
 self.Caption := DMTCCoreLink.GetTextLang(3154);
 LQty.Caption := DMTCCoreLink.GetTextLang(413);
 LExtraPrice.Caption := DMTCCoreLink.GetTextLang(1132);
 LQty2.Caption := DMTCCoreLink.GetTextLang(413);
 LPrice2.Caption := DMTCCoreLink.GetTextLang(1132);

 DBGrid2.Columns[0].Title.Caption := DMTCCoreLink.GetTextLang(3148);
 DBGrid2.Columns[1].Title.Caption := DMTCCoreLink.GetTextLang(413);
 DBGrid2.Columns[2].Title.Caption := DMTCCoreLink.GetTextLang(1132);

end;

procedure TDocSelectOptions.FormDestroy(Sender: TObject);
begin
 aoptionsDataset.free ;
 AValuesList.free ;
 ColumnList.free ;
end;

procedure TDocSelectOptions.InitDoc(Adocid,AAccountid: Integer;aDocType : Integer);
var
 i : Integer ; 
begin
 for i := TSOptionView.ComponentCount -1 downto 0 do
          TSOptionView.Components[i].free ;
 Accountid := AAccountid ;
  if ZQOptions.UpdatesPending then
      ZQOptions.CancelUpdates  ;

  Docid := Adocid ;
  while not aoptionsDataset.IsEmpty do
     begin
        aoptionsDataset.Delete ;
     end;
  ZQOptions.close ;
  ZQOptions.Params[0].AsInteger := Adocid ;
  ZQOptions.Open ;
   
  self.DocType := aDocType ;
end;

function TDocSelectOptions.GetOptionItemValueName(
  AOptionItemValueid: Integer): String;
 var
  AIndex : Integer ;
begin
  result := '' ;
  if AOptionItemValueid = 0 then
     exit ;

  AIndex := AValuesList.IndexOfObject(TObject(AOptionItemValueid)) ;
  if AIndex = -1 then
     begin
      AValuesList.AddObject(TDataBaseStockRoutines.GetOptionItemValueName(AOptionItemValueid),Tobject(AOptionItemValueid)) ;
      AIndex := AValuesList.Count -1 ;
     end;
  result := AValuesList[AIndex];
end;

procedure TDocSelectOptions.BtnOkClick(Sender: TObject);
var
 i : Integer ;
begin

  cxoptionsDBTableView1.StoreToRegistry('Software\osfinancials\gridsopt\FF'+   ZQStockDefWITEMOPTION1ID.AsString +'-' + ZQStockDefWITEMOPTION2ID.AsString +'-'
  + ZQStockDefWITEMOPTION3ID.AsString +'-' + ZQStockDefWITEMOPTION4ID.AsString +'-' + ZQStockDefWITEMOPTION5ID.AsString +'-' );

 ZQOptions.DisableControls ;
 try

 lstQty := 0;
 lstTotal := 0 ;
 if PageControl1.ActivePage = tsGridview then
 begin
  aoptionsDataset.First ;
  if Level >0 then
     begin
        while not aoptionsDataset.Eof do
         begin
           for i := 0 to ColumnList.count -1 do
             begin
             if ZQOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',
                 VarArrayOf([Integer(ColumnList.Objects[i]),aoptionsDataset.FieldByName('WITEMOPTIONVALUE2ID').Value,aoptionsDataset.FieldByName('WITEMOPTIONVALUE3ID').value,
                 aoptionsDataset.FieldByName('WITEMOPTIONVALUE4ID').value,aoptionsDataset.FieldByName('WITEMOPTIONVALUE5ID').value]) ,[]) then
                  begin
                    if aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat = 0 then
                       ZQOptions.Delete else
                       begin
                         ZQOptions.edit ;
                         ZQOptionsFQTY.AsFloat :=  aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat ;
                         ZQOptionsFEXTRAPRICE.AsFloat :=  aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat ;
                         if LastInclusive and (ZQOptionsFEXTRAPRICE.AsFloat <> 0)then
                            begin
                               ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
                            end;

                         ZQOptions.Post ;
                         lstQty := lstQty + ZQOptionsFQTY.AsFloat;
                         lstTotal := lstTotal + (ZQOptionsFQTY.AsFloat * ZQOptionsFEXTRAPRICE.AsFloat) ;
                       end;
                  end else
                  begin
                     if aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat <> 0 then
                       begin
                         ZQOptions.DisableControls ;
                         try
                         ZQOptions.Append ;
                         ZQOptionsWDOCID.AsInteger := 0 ;
                         ZQOptionsWLINEID.AsInteger := LineID ;
                         ZQOptionsWDOCLINEOPTIONSID.AsInteger := 0 ;
                         ZQOptionsWITEMOPTIONVALUE1ID.AsInteger := Integer(ColumnList.Objects[i]) ;
                         ZQOptionsWITEMOPTIONVALUE2ID.AsInteger := aoptionsDataset.FieldByName('WITEMOPTIONVALUE2ID').AsInteger ;
                         ZQOptionsWITEMOPTIONVALUE3ID.AsInteger := aoptionsDataset.FieldByName('WITEMOPTIONVALUE3ID').AsInteger ;
                         ZQOptionsWITEMOPTIONVALUE4ID.AsInteger := aoptionsDataset.FieldByName('WITEMOPTIONVALUE4ID').AsInteger ;
                         ZQOptionsWITEMOPTIONVALUE5ID.AsInteger := aoptionsDataset.FieldByName('WITEMOPTIONVALUE5ID').AsInteger ;
                         ZQOptionsFQTY.AsFloat :=  aoptionsDataset.FieldByName('FQTY'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat ;
                         ZQOptionsFEXTRAPRICE.AsFloat :=  aoptionsDataset.FieldByName('FEXTRAPRICE'+ IntToStr(Integer(ColumnList.Objects[i]))).AsFloat ;
                         if LastInclusive and (ZQOptionsFEXTRAPRICE.AsFloat <> 0)then
                            begin
                               ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
                            end;

                         ZQOptions.Post ;
                         finally
                           ZQOptions.EnableControls ;
                         end;
                         lstQty := lstQty + ZQOptionsFQTY.AsFloat;
                         lstTotal := lstTotal + (ZQOptionsFQTY.AsFloat * ZQOptionsFEXTRAPRICE.AsFloat) ;
                       end;
                  end;
             end;
           aoptionsDataset.next ;
         end;
     end else
     begin
     while not aoptionsDataset.Eof do
         begin
             if ZQOptions.Locate('WITEMOPTIONVALUE1ID',
                 aoptionsDataset.FieldByName('WITEMOPTIONVALUE1ID').Value,[]) then
                  begin
                    if aoptionsDataset.FieldByName('FQTY').AsFloat = 0 then
                       ZQOptions.Delete else
                       begin
                         ZQOptions.edit ;
                         ZQOptionsFQTY.AsFloat :=  aoptionsDataset.FieldByName('FQTY').AsFloat ;
                         ZQOptionsFEXTRAPRICE.AsFloat :=  aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat ;
                         if LastInclusive and (ZQOptionsFEXTRAPRICE.AsFloat <> 0)then
                            begin
                               ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
                            end;

                         ZQOptions.Post ;
                         lstQty := lstQty + ZQOptionsFQTY.AsFloat;
                         lstTotal := lstTotal + (ZQOptionsFQTY.AsFloat * ZQOptionsFEXTRAPRICE.AsFloat) ;
                       end;
                  end else
                  begin
                     if aoptionsDataset.FieldByName('FQTY').AsFloat <> 0 then
                       begin
                         ZQOptions.DisableControls ;
                         try
                         ZQOptions.Append ;
                         ZQOptionsWDOCID.AsInteger := 0 ;
                         ZQOptionsWLINEID.AsInteger := LineID ;
                         ZQOptionsWDOCLINEOPTIONSID.AsInteger := 0 ;
                         ZQOptionsWITEMOPTIONVALUE1ID.AsInteger := aoptionsDataset.FieldByName('WITEMOPTIONVALUE1ID').AsInteger ;
                         ZQOptionsFQTY.AsFloat :=  aoptionsDataset.FieldByName('FQTY').AsFloat ;
                         ZQOptionsFEXTRAPRICE.AsFloat :=  aoptionsDataset.FieldByName('FEXTRAPRICE').AsFloat ;
                         if LastInclusive and (ZQOptionsFEXTRAPRICE.AsFloat <> 0)then
                            begin
                               ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
                            end;

                         ZQOptions.Post ;
                         finally
                           ZQOptions.EnableControls ;
                         end;
                         lstQty := lstQty + ZQOptionsFQTY.AsFloat;
                         lstTotal := lstTotal + (ZQOptionsFQTY.AsFloat * ZQOptionsFEXTRAPRICE.AsFloat) ;
                       end;
                  end;
           aoptionsDataset.next ;
         end;
     end;
    end else
    begin
      // no handeling.
      if ZQOptions.State <> dsbrowse then
          ZQOptions.Post ;
      ZQOptions.First ;
      while not ZQOptions.Eof do
          begin
             if ZQOptionsFQTY.AsFloat = 0 then
                ZQOptions.Delete else
                begin
                   lstQty := lstQty + ZQOptionsFQTY.AsFloat;
                   lstTotal := lstTotal + (ZQOptionsFQTY.AsFloat * ZQOptionsFEXTRAPRICE.AsFloat) ;
                   ZQOptions.next ;
                end;
          end;
    end;
    TDatabaseRegistyRoutines.WriteFormPos(self,ZQStockDefWITEMOPTION1ID.AsString);
    finally
      ZQOptions.EnableControls ;
    end;
    ModalResult := mrok ;
end;

procedure TDocSelectOptions.deleteline(AlineId: Integer);
begin
     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALineid);
     ZQOptions.Filtered := true ;
     while not ZQOptions.Eof do
        ZQOptions.Delete ;
end;

procedure TDocSelectOptions.FormShow(Sender: TObject);
begin
 if PageControl1.ActivePage = tsGridview then
   if cxoptions.CanFocus then
   cxoptions.SetFocus ;
 if PageControl1.ActivePage = tsTreeview then
  if TreeView1.CanFocus then
   TreeView1.SetFocus ;


end;

procedure TDocSelectOptions.BtnCancelClick(Sender: TObject);
begin
 ModalResult := mrcancel ;
end;

procedure TDocSelectOptions.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
 var
  ArrayVars : variant ;
  Index,I,curindex : Integer ;
  anode : TTreeNode ;
begin
 Index := 0 ;
 curindex := 0 ;
    if Level = 4 then
      Index := 5 ;
    if Level = 3 then
      Index := 4 ;
    if Level = 2 then
      Index := 3 ;
    if Level = 1 then
      Index := 2 ;
    if Level = 0 then
      Index := 1 ;

if ZQOptions.State <> dsbrowse then
    ZQOptions.post ;
 anode  := Node ;
 ArrayVars := VarArrayOf([Null,Null,Null,Null,Null]) ;
   for i := Index downto 1 do
       begin
         if anode = nil then break ;
         ArrayVars[i-1] := Integer(aNode.Data) ;
         anode := anode.Parent ;

       end;

  anode := Node ;
  while anode.Parent <> nil do
     begin
       inc(curindex) ;
       anode := anode.Parent ;
     end;
if curindex < Level then
   begin
     if Node.Count = 0 then
        begin
         ZQSelDestinct.sql.Text := 'select distinct(WITEMOPTIONVALUE' + IntToStr(curindex+2) + 'ID) from STOCKOPTIONS where WStockid =:WStockid ' ;
         anode := Node ;
         for i := curindex downto 0 do
           begin
             ZQSelDestinct.sql.add('and WITEMOPTIONVALUE' + IntToStr(i+1) + 'ID = '+ IntToStr(Integer(anode.data))) ;
              anode := anode.Parent ;
           end;
          ZQSelDestinct.Params[0].AsInteger := ZQStockOptions.Params[0].AsInteger ;
          ZQSelDestinct.Open ;
          HandleNextLevel(Node);
          if Node.Count <> 0 then
             Node.Item[0].Expand(true);
        end;
   end;

ZQOptions.DisableControls ;
try

PDetail.Visible := false ;
if (Node.Count = 0) then
   begin
    //  ShowMessage(VarToStr(ArrayVars[0])+VarToStr(ArrayVars[1])+VarToStr(ArrayVars[2])+VarToStr(ArrayVars[3])+VarToStr(ArrayVars[4]));
    if not ZQOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID',
       ArrayVars ,[]) then
       begin
               ZQOptions.Append ;
               ZQOptionsWDOCID.AsInteger := 0 ;
               ZQOptionsWLINEID.AsInteger := LineID ;
               ZQOptionsWDOCLINEOPTIONSID.AsInteger := 0 ;
               ZQOptionsWITEMOPTIONVALUE1ID.AsVariant := ArrayVars[0] ;
               ZQOptionsWITEMOPTIONVALUE2ID.AsVariant := ArrayVars[1];
               ZQOptionsWITEMOPTIONVALUE3ID.AsVariant := ArrayVars[2];
               ZQOptionsWITEMOPTIONVALUE4ID.AsVariant := ArrayVars[3];
               ZQOptionsWITEMOPTIONVALUE5ID.AsVariant := ArrayVars[4];
               ZQOptionsFQTY.AsFloat := 0 ;
               ZQOptionsFEXTRAPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockOptions.Params[0].AsInteger,0) ;
               If ZQStockOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID', ArrayVars ,[]) then
              begin
                ZQOptionsFEXTRAPRICE.AsFloat :=  ZQOptionsFEXTRAPRICE.AsFloat  + GetAccountPrice ;
              end;
         end;
     PDetail.Visible := true ;
     if DBEdit1.CanFocus then
        DBEdit1.SetFocus ;
   end;
  finally
     ZQOptions.EnableControls ;
  end;
end;

procedure TDocSelectOptions.HandleNextLevel(ANode: TTreeNode);
begin
  while not ZQSelDestinct.Eof do
     begin
       TreeView1.Items.AddChildObject(ANode,GetOptionItemValueName(ZQSelDestinct.Fields[0].AsInteger),Tobject(ZQSelDestinct.Fields[0].AsInteger)) ;
       ZQSelDestinct.Next ;
     end;
end;

procedure TDocSelectOptions.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = '.' then key := DecimalSeparator ;
 if  Key = #13  then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TDocSelectOptions.BuildOptionsView;
var
 aDBCheckBox : TDBCheckBox ;
 aDBRadioGroup : TDBRadioGroup ;
 NextTop,NextLeft : Integer ;
 BIsNew : Boolean ;
 procedure HandelInternal(AField : TField) ;
 begin
 ZQSelDestinct.Open ;
 if not ZQSelDestinct.IsEmpty then
     begin
       if ZQSelDestinct.RecordCount = 2 then
          begin
            aDBCheckBox := TDBCheckBox.Create(TSOptionView);
            aDBCheckBox.parent := TSOptionView ;
            aDBCheckBox.top := NextTop ;
            aDBCheckBox.Left := NextLeft ;
            aDBCheckBox.ValueUnchecked  := ZQSelDestinct.Fields[0].AsVariant ;
            NextTop := NextTop + trunc(35 * glScaleByPerc) ; ;
            ZQSelDestinct.next ;
            aDBCheckBox.ValueChecked  := ZQSelDestinct.Fields[0].AsVariant ;
            ZQSelDestinct.First ;
            aDBCheckBox.Caption :=   TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQSelDestinct.Fields[0].AsInteger);
            aDBCheckBox.DataSource  := dsOptions ;
            aDBCheckBox.DataField  := AField.FieldName ;
            if AField.AsInteger = 0 then
               begin
                AField.AsInteger := ZQSelDestinct.Fields[0].AsInteger ;
                OnExitOptions(aDBCheckBox);
               end;

           aDBCheckBox.OnClick := OnExitOptions;

           aDBCheckBox.OnExit :=   OnExitOptions ;
          end else
          begin
            aDBRadioGroup := TDBRadioGroup.Create(TSOptionView);
            aDBRadioGroup.parent := TSOptionView ;
            aDBRadioGroup.top := NextTop ;
            aDBRadioGroup.Left := NextLeft  ;
            aDBRadioGroup.Height := + trunc( 30 * glScaleByPerc)  ;

            NextTop := NextTop + + trunc( 35 * glScaleByPerc) ;
            aDBRadioGroup.Caption :=   TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQSelDestinct.Fields[0].AsInteger);
            BIsNew := false ;
            while not ZQSelDestinct.Eof do
              begin
                 if aDBRadioGroup.Items.Count = 0 then
                    if AField.AsString = '' then
                     begin
                      AField.AsInteger := ZQSelDestinct.Fields[0].AsInteger ;
                      BIsNew := true ;
                     end ;

                 if LastInclusive then

                 begin
                 if ZQSelDestinct.Fields[1].AsFloat <> 0 then
                  aDBRadioGroup.Items.Add(GetOptionItemValueName(ZQSelDestinct.Fields[0].AsInteger) + ' (' + FormatFloat('0.00',ZQSelDestinct.Fields[1].AsFloat * TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ) +')')
                 else
                 aDBRadioGroup.Items.Add(GetOptionItemValueName(ZQSelDestinct.Fields[0].AsInteger)) ;

                 end else
                 begin
                 if ZQSelDestinct.Fields[1].AsFloat <> 0 then
                  aDBRadioGroup.Items.Add(GetOptionItemValueName(ZQSelDestinct.Fields[0].AsInteger) + ' (' + FormatFloat('0.00',ZQSelDestinct.Fields[1].AsFloat) +')')
                 else
                 aDBRadioGroup.Items.Add(GetOptionItemValueName(ZQSelDestinct.Fields[0].AsInteger)) ;
                 end;

                 aDBRadioGroup.Values.Add(ZQSelDestinct.Fields[0].AsString);
                 aDBRadioGroup.Height := aDBRadioGroup.Height +  trunc( 11 * glScaleByPerc) ;
                 NextTop := NextTop + trunc( 11 * glScaleByPerc)  ;
                 ZQSelDestinct.next ;
              end;
            aDBRadioGroup.DataSource  := dsOptions ;
            aDBRadioGroup.DataField  := AField.FieldName ;
            aDBRadioGroup.OnChange := OnExitOptions ;
            if BIsNew then
               OnExitOptions(aDBRadioGroup);

          end;
     end;
   if   nexttop +   trunc( 100 * glScaleByPerc) > self.Height then
      begin
       NextLeft := NextLeft +   trunc( 200 * glScaleByPerc) ;
       NextTop := trunc(30 * glScaleByPerc) ;
      end;

 end;
begin
       if ZQOptions.IsEmpty then
          begin
               ZQOptions.DisableControls ;
               try
               ZQOptions.Insert ;
               finally
               ZQOptions.EnableControls ;
               end;
               ZQOptionsWDOCID.AsInteger := 0 ;
               ZQOptionsWLINEID.AsInteger := LineID ;
               ZQOptionsWDOCLINEOPTIONSID.AsInteger := 0 ;
               ZQOptionsFQTY.AsFloat := 1 ;
               ZQOptionsFEXTRAPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockOptions.Params[0].AsInteger,0) ;
          end else
          ZQOptions.edit ;
  NextLeft := 30 ;
  NextTop := trunc(30 * glScaleByPerc) ;
  ZQSelDestinct.sql.Text := 'select WITEMOPTIONVALUEID,FEXTRAAMOUNT from ITEMOPTIONSVALUES where WITEMOPTIONID =:WStockid order by 1' ;
  ZQSelDestinct.Params[0].AsInteger := ZQStockDefWITEMOPTION1ID.AsInteger ;
  HandelInternal(ZQOptionsWITEMOPTIONVALUE1ID);
  ZQSelDestinct.close ;
  ZQSelDestinct.Params[0].AsInteger := ZQStockDefWITEMOPTION2ID.AsInteger ;
  HandelInternal(ZQOptionsWITEMOPTIONVALUE2ID);
  ZQSelDestinct.close ;
  ZQSelDestinct.Params[0].AsInteger := ZQStockDefWITEMOPTION3ID.AsInteger ;
  HandelInternal(ZQOptionsWITEMOPTIONVALUE3ID);
  ZQSelDestinct.close ;
  ZQSelDestinct.Params[0].AsInteger := ZQStockDefWITEMOPTION4ID.AsInteger ;
  HandelInternal(ZQOptionsWITEMOPTIONVALUE4ID);
  ZQSelDestinct.close ;
  ZQSelDestinct.Params[0].AsInteger := ZQStockDefWITEMOPTION5ID.AsInteger ;
  HandelInternal(ZQOptionsWITEMOPTIONVALUE5ID);
end;

procedure TDocSelectOptions.OnExitOptions(Sender: TObject);
var
 StockPrice,discount : Double ;
 i : Integer ;
begin
  discount := 0 ;
  if (ZQOptions.State = dsbrowse) or (ZQOptions.ControlsDisabled) {or (not self.Visible)} then
    exit ;
 StockPrice := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockDefWSTOCKID.AsInteger,ZQOptionsFQTY.AsInteger ) ;
 if  LastStdStockPrice <> 0 then
 discount := 100 -( (StockPrice / LastStdStockPrice) * 100) ;
 discount := 1 - (discount/ 100) ;
 for i := 0 to TSOptionView.ComponentCount -1 do
  with TSOptionView do 
   begin
    if Components[i] is TDBCheckBox then
        begin

           if (Components[i] as TDBCheckBox).Checked then
              StockPrice := StockPrice + (StrToFloatDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select FEXTRAAMOUNT from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = ' +  (Components[i] as TDBCheckBox).ValueChecked )),0) * discount)
            else
              StockPrice := StockPrice + (StrToFloatDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select FEXTRAAMOUNT from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = ' +  (Components[i] as TDBCheckBox).ValueUnchecked )),0)* discount) ;
        end;
     if Components[i] is TDBRadioGroup then
        begin
           if (Components[i] as TDBRadioGroup).ItemIndex > -1 then
              begin
                StockPrice := StockPrice + (StrToFloatDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select FEXTRAAMOUNT from ITEMOPTIONSVALUES where WITEMOPTIONVALUEID = ' +  (Components[i] as TDBRadioGroup).Values[(Components[i] as TDBRadioGroup).ItemIndex] )),0) * discount) ;
              end;
        end;
   end;
   ZQOptions.Edit ;
   ZQOptionsFEXTRAPRICE.AsFloat := StockPrice ;
end;

procedure TDocSelectOptions.ZQOptionsWITEMOPTIONVALUE1IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text :=  GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE1ID.AsInteger) ;
  if  ZQOptionsWITEMOPTIONVALUE2ID.AsInteger <> 0 then
   Text := Text + ' ' + GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE2ID.AsInteger) ;

  if  ZQOptionsWITEMOPTIONVALUE3ID.AsInteger <> 0 then
   Text := Text + ' ' + GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE3ID.AsInteger) ;

  if  ZQOptionsWITEMOPTIONVALUE4ID.AsInteger <> 0 then
   Text := Text + ' ' + GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE4ID.AsInteger) ;

  if  ZQOptionsWITEMOPTIONVALUE5ID.AsInteger <> 0 then
   Text := Text + ' ' + GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE5ID.AsInteger) ;
end;

procedure TDocSelectOptions.DBGrid2DblClick(Sender: TObject);
var
 i : integer ;
 ANode : TTreeNode ;
begin
 ANode := nil ;
  for i := TreeView1.Items.Count -1 downto 0 do
     begin
        if  TreeView1.Items[i].Parent = nil then
          if TreeView1.Items[i].Data = pointer(ZQOptionsWITEMOPTIONVALUE1ID.AsInteger) then
            begin
               ANode := TreeView1.Items[i] ;
               ANode.Selected := true ;
               ANode.Expanded := true ;
               break ;
            end;
     end;
  if (ANode <> nil) then
       begin
         for i := 0 to ANode.Count- 1 do
           if  ANode.Item[i].Data = pointer(ZQOptionsWITEMOPTIONVALUE2ID.AsInteger) then
             begin
               ANode := ANode.Item[i] ;
               ANode.Selected := true ;
               ANode.Expanded := true ;
               if ANode.Count = 0 then
                  ANode := nil ;
                break ;
            end;
       end;
  if (ANode <> nil) then
       begin
         for i := 0 to ANode.Count- 1 do

           if  ANode.Item[i].Data = pointer(ZQOptionsWITEMOPTIONVALUE3ID.AsInteger) then
             begin
               ANode := ANode.Item[i] ;
               ANode.Selected := true ;
               ANode.Expanded := true ;
               if ANode.Count = 0 then
                  ANode := nil ;
                break ;
            end;
       end;
  if (ANode <> nil) then
       begin
         for i := 0 to ANode.Count- 1 do
           if  ANode.Item[i].Data = pointer(ZQOptionsWITEMOPTIONVALUE4ID.AsInteger) then
             begin
               ANode := ANode.Item[i] ;
               ANode.Selected := true ;
               ANode.Expanded := true ;
               if ANode.Count = 0 then
                  ANode := nil ;
               break ;
            end;
       end;
   if (ANode <> nil) then
       begin
         for i := 0 to ANode.Count- 1 do
           if  ANode.Item[i].Data = pointer(ZQOptionsWITEMOPTIONVALUE5ID.AsInteger) then
             begin
               ANode := ANode.Item[i] ;
               ANode.Selected := true ;
               ANode.Expanded := true ;
               break ;   
            end;
       end;
end;

procedure TDocSelectOptions.ZQOptionsFEXTRAPRICEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 if LastInclusive then
    begin
       Text := FormatFloat('0.00',Sender.AsFloat * TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID)) ;
    end else
       Text := FormatFloat('0.00',Sender.AsFloat ) ;
end;

procedure TDocSelectOptions.ZQOptionsFEXTRAPRICESetText(Sender: TField;
  const Text: String);
begin
 Sender.AsFloat := StrToFloatDef(Text,0);
 if LastInclusive and (Sender.AsFloat <> 0) then
    begin
       Sender.AsFloat := Sender.AsFloat /  TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID) ;
    end ;
end;

procedure TDocSelectOptions.ZQOptionsAfterInsert(DataSet: TDataSet);
begin
 if not DataSet.ControlsDisabled then
  if PageControl1.ActivePage  = tsGridview then
     DataSet.Cancel ;
end;

procedure TDocSelectOptions.ZQOptionsFQTYSetText(Sender: TField;
  const Text: String);
 var
  ArrayVars : variant ;
  discount : Double ;
begin

 Sender.AsFloat := StrToFloatDef(Text,0);
 if not Sender.DataSet.ControlsDisabled then
   begin
   if ZQStockDefWSTOCKTYPEID.AsInteger = 8 then
   begin
     OnExitOptions(self);
   end else
   begin
    ArrayVars := VarArrayOf([Null,Null,Null,Null,Null]) ;
    ArrayVars[0]  := ZQOptionsWITEMOPTIONVALUE1ID.AsVariant   ;
    ArrayVars[1]  := ZQOptionsWITEMOPTIONVALUE2ID.AsVariant  ;
    ArrayVars[2]  := ZQOptionsWITEMOPTIONVALUE3ID.AsVariant  ;
    ArrayVars[3]  := ZQOptionsWITEMOPTIONVALUE4ID.AsVariant  ;
    ArrayVars[4]  := ZQOptionsWITEMOPTIONVALUE5ID.AsVariant  ;
    If ZQStockOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID', ArrayVars ,[]) then
        begin
         ZQOptionsFEXTRAPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockOptionsWSTOCKID.AsInteger,Sender.AsFloat) ;
         discount := 100 -( (ZQOptionsFEXTRAPRICE.AsFloat / LastStdStockPrice) * 100) ;
         if discount <> 0 then
         ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat + (GetAccountPrice * 1 - (discount/ 100))
         else
         ZQOptionsFEXTRAPRICE.AsFloat := ZQOptionsFEXTRAPRICE.AsFloat + GetAccountPrice ;
        end ;
     end;
   end;
end;

procedure TDocSelectOptions.ZQMemDataSetText(
  Sender: TField; const Text: String);

 var
  ArrayVars : variant ;
  discount : Double ;
begin
 Sender.AsFloat := StrToFloatDef(Text,0);
 if not Sender.DataSet.ControlsDisabled then
   begin
    ArrayVars := VarArrayOf([Null,Null,Null,Null,Null]) ;
    if Level = 0 then
    begin
     ArrayVars[0] := aoptionsDataset.FieldByName('WITEMOPTIONVALUE1ID').AsVariant ;
    end else
    begin
    ArrayVars[0] := StrToIntDef(TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName),0) ;
    ArrayVars[1] := aoptionsDataset.FieldByName('WITEMOPTIONVALUE2ID').AsVariant ;
    ArrayVars[2] := aoptionsDataset.FieldByName('WITEMOPTIONVALUE3ID').AsVariant ;
    ArrayVars[3] := aoptionsDataset.FieldByName('WITEMOPTIONVALUE4ID').AsVariant ;
    ArrayVars[4] := aoptionsDataset.FieldByName('WITEMOPTIONVALUE5ID').AsVariant ;
    end;

    if VarToStr(ArrayVars[2]) = '0' then
       ArrayVars[2] := Null ;
    if VarToStr(ArrayVars[3]) = '0' then
       ArrayVars[3] := Null ;
    if VarToStr(ArrayVars[4]) = '0' then
       ArrayVars[4] := Null ;
    If ZQStockOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID', ArrayVars ,[]) then
        begin
         aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockDefWSTOCKID.AsInteger,Sender.AsFloat) ;
         discount :=0 ;
         if LastStdStockPrice <> 0 then
         discount := 100 -( (aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat / LastStdStockPrice) * 100) ;
         if discount <> 0 then
         aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat := aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat + (GetAccountPrice * 1 - (discount/ 100))
         else
         aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat := aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat + GetAccountPrice ;
          if  LastInclusive then
                aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat := aoptionsDataset.FindField('FEXTRAPRICE' + TDataBaseStringRoutines.StripNotNumeric(Sender.FieldName)).AsFloat * TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID);

        end ;
  end;
end;


procedure TDocSelectOptions.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if cxoptionsDBTableView1.Controller.FocusedColumn <> nil then
   if TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.Field.DataType = ftfloat then
     if Key = '.' then
       Key := DecimalSeparator ;
end;

procedure TDocSelectOptions.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = '.' then
       Key := DecimalSeparator ;
end;

procedure TDocSelectOptions.DBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if DBGrid2.SelectedField <> nil then
   if DBGrid2.SelectedField.DataType <> ftString then
     if Key = '.' then
       Key := DecimalSeparator ;
end;

procedure TDocSelectOptions.doLocateBarcode(abarcode: String);
var
 Level : Integer;
begin
  Level := 0 ;
  if ZQStockOptionsWITEMOPTIONVALUE2ID.AsInteger <> 0 then
   Level := 1 ;
  if ZQStockOptionsWITEMOPTIONVALUE3ID.AsInteger <> 0 then
   Level := 2 ;
  if ZQStockOptionsWITEMOPTIONVALUE4ID.AsInteger <> 0 then
   Level := 3 ;
  if ZQStockOptionsWITEMOPTIONVALUE5ID.AsInteger <> 0 then
   Level := 4 ;
 if PageControl1.ActivePage = tsGridview then
       if ZQStockOptions.Locate('SBARCODE',UpperCase(abarcode),[]) then
          begin
              if Level = 0 then
                begin
                  aoptionsDataset.Locate('WITEMOPTIONVALUE1ID',ZQStockOptionsWITEMOPTIONVALUE1ID.AsInteger,[]);
                  aoptionsDataset.Edit ;
                  aoptionsDataset.FieldByName('FQTY').AsFloat := aoptionsDataset.FieldByName('FQTY').AsFloat + 1 ; 
                  aoptionsDataset.Post ;


                end;
          end;

end;

function TDocSelectOptions.GetLineText(ALine: Integer): String;
var
 Line : String ;
 TaxRate : Double ;
begin
 Result := '' ;
 if Self.Visible then exit ;
 if not ZQOptions.Active then exit ;
     ZQOptions.Filtered := False ;
     ZQOptions.Filter := 'WLINEID=' + IntToStr(ALine);
     ZQOptions.Filtered := true ;
     ZQOptions.First ;
     while not ZQOptions.Eof do
       begin
        if result <> '' then
         result := Result  +  #13+#10 ;
         if LastInclusive then
             TaxRate := TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID)
             else TaxRate := 1 ;
         result := Result  +  DMTCCoreLink.GetTextLangNoAmp(1709) + ' ' + FormatFloat('0.00',ZQOptionsFEXTRAPRICE.AsFloat * TaxRate) +' ' ;

         if ZQOptions.RecordCount > 1 then
           begin
            result := Result  +  DMTCCoreLink.GetTextLangNoAmp(413)  + ' ' + ZQOptionsFQTY.AsString +' ' ;
           end ;
         result := Result  +  TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQOptionsWITEMOPTIONVALUE1ID.AsInteger) + ' = ' + TDataBaseStockRoutines.GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE1ID.AsInteger)   ;
         Line  :=  TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQOptionsWITEMOPTIONVALUE2ID.AsInteger) + ' = ' + TDataBaseStockRoutines.GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE2ID.AsInteger)   ;
         if Trim(Line) <> '=' then
            result := Result  + ' @ ' + Line ;
         Line  :=  TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQOptionsWITEMOPTIONVALUE3ID.AsInteger) + ' = ' + TDataBaseStockRoutines.GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE3ID.AsInteger)   ;
         if Trim(Line) <> '=' then
            result := Result  + ' @ '+ Line ;

         Line  :=  TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQOptionsWITEMOPTIONVALUE4ID.AsInteger) + ' = ' + TDataBaseStockRoutines.GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE4ID.AsInteger)   ;
         if Trim(Line) <> '=' then
            result := Result  +  ' @ ' + Line ;

         Line  :=  TDataBaseStockRoutines.GetOptionNameFromItemValueID(ZQOptionsWITEMOPTIONVALUE5ID.AsInteger) + ' = ' + TDataBaseStockRoutines.GetOptionItemValueName(ZQOptionsWITEMOPTIONVALUE5ID.AsInteger)   ;
         if Trim(Line) <> '=' then
            result := Result  +  ' @ ' + Line ;
         ZQOptions.next ;
       end;
end;

procedure TDocSelectOptions.DBGrid1DblClick(Sender: TObject);
  var
  Ext : String ;
begin
if  copy(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,1,4) = 'FQTY' then
 begin
  Ext :=   copy(tcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,5,10);
  if not aoptionsDataset.FieldByName('FEXTRAPRICE'+Ext).IsNull then
  begin
  aoptionsDataset.edit ;

  aoptionsDataset.FieldByName(tcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat := aoptionsDataset.FieldByName(tcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat + 1 ;
  aoptionsDataset.Post ;
  end;
  // todo calc and show stock

 end;
end;

procedure TDocSelectOptions.dbQty2DblClick(Sender: TObject);
begin
  ZQOptions.edit ;
  ZQOptionsFQTY.AsFloat := ZQOptionsFQTY.AsFloat +1 ;
end;

procedure TDocSelectOptions.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    Ext : String ;
  ArrayVars : variant ;
  I : Integer ;
  Aprice :Double ;


begin
 if (Button =  mbRight) and (copy(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,1,4) = 'FQTY') then
    begin
      aoptionsDataset.edit ;
      if aoptionsDataset.FieldByName(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat  > 0 then
      aoptionsDataset.FieldByName(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat := aoptionsDataset.FieldByName(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat - 1 ;
      // todo calc and show stock

    end ;

end;

procedure TDocSelectOptions.CopyFromDocLine(ADocID, ALineid: Integer);
var
 i : Integer ;
  ADocSelect : TDocSelectOptions ;
begin
  aoptionsDataset.DisableControls ;
  try
   aoptionsDataset.first ;

   while not aoptionsDataset.Eof do
    begin

      for i := 0 to aoptionsDataset.FieldCount -1 do
          begin
             if  copy(aoptionsDataset.Fields[i].FieldName,1,4) = 'FQTY' then
              if aoptionsDataset.Fields[i].AsFloat <>0 then
                begin
                  aoptionsDataset.edit ;
                  aoptionsDataset.Fields[i].AsFloat := 0 ;
                end;


          end;
           if (aoptionsDataset.State = dsedit) then
              aoptionsDataset.Post ;
      aoptionsDataset.next ;
    end;
  ADocSelect := TDocSelectOptions.create(nil) ;
  try
    ADocSelect.InitDoc(ADocID,0,ALineid);

    ADocSelect.InitForStock(ZQStockOptions.Params[0].AsInteger,LineID,LastLineTaxID,LastInclusive,'##@@$$%%^^&&&***');
   ADocSelect.aoptionsDataset.First ;
   aoptionsDataset.first ;

   while not aoptionsDataset.Eof do
    begin

      for i := 0 to aoptionsDataset.FieldCount -1 do
          begin
             if  (copy(aoptionsDataset.Fields[i].FieldName,1,4) = 'FQTY') or
             (copy(aoptionsDataset.Fields[i].FieldName,1,11) = 'FEXTRAPRICE' )then

                begin
                  aoptionsDataset.edit ;

                  aoptionsDataset.Fields[i].AsFloat := ADocSelect.aoptionsDataset.fields[i].AsFloat ;
                end;


          end;
           if (aoptionsDataset.State = dsedit) then
              aoptionsDataset.Post ;
      aoptionsDataset.next ;
      ADocSelect.aoptionsDataset.next ;
    end;

  finally
    ADocSelect.free ;
  end;

  finally
    aoptionsDataset.EnableControls ;
  end;
end;

procedure TDocSelectOptions.FormResize(Sender: TObject);
begin
   dbQty2.Left := (TSOptionView.Width - dbQty2.Width) - 5 ;
   Lqty2.Left := (dbQty2.Left - Lqty2.Width) - 10  
end;

function TDocSelectOptions.GetAccountPrice: Double;
begin
   case StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select WDEFAULTPRICETYPEID from debtor where waccountid=' + IntToStr( Accountid) )),1+DMTCCoreLink.ReadNwReportOp('STKDefaultPrice',1)) of
         0 ,
         1 : result := ZQStockOptionsFEXTRAPRICE.AsFloat ;
         2 : result := ZQStockOptionsFEXTRAPRICE2.AsFloat ;
        else result := ZQStockOptionsFEXTRAPRICE3.AsFloat ;
    end;
end;

procedure TDocSelectOptions.cxoptionsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

 var
  Ext : String ;
begin
   if copy(TcxGridDBColumn(AViewInfo.Item).DataBinding.FieldName,1,4) = 'FQTY' then
     begin
      Ext :=   copy(TcxGridDBColumn(AViewInfo.Item).DataBinding.FieldName,5,10);
      if cxoptionsDBTableView1.GetColumnByFieldName('FQTYONHAND'+Ext) <> nil then
        begin
        if StrToFloatDef(VarToStr( AViewInfo.GridRecord.Values[ cxoptionsDBTableView1.GetColumnByFieldName('FQTY'+Ext).Index]),0) <> 0 then
        begin
          if  (StrToFloatDef(VarToStr( AViewInfo.GridRecord.Values[ cxoptionsDBTableView1.GetColumnByFieldName('FQTYONHAND'+Ext).Index]),0) -
               StrToFloatDef(VarToStr( AViewInfo.GridRecord.Values[ cxoptionsDBTableView1.GetColumnByFieldName('FQTY'+Ext).Index]),0)) < 0 then
           begin
            ACanvas.Font.Color :=  clWhite;
            ACanvas.Brush.Color :=  clred;
           end;
         end else
         begin
           if  StrToFloatDef(VarToStr( AViewInfo.GridRecord.Values[ cxoptionsDBTableView1.GetColumnByFieldName('FQTYONHAND'+Ext).Index]),0) < 1 then
           begin
            ACanvas.Font.Color :=  clWhite;
            ACanvas.Brush.Color :=  clred;
           end;
         end;
          if VarToStr( AViewInfo.GridRecord.Values[ cxoptionsDBTableView1.GetColumnByFieldName('FQTYONHAND'+Ext).Index]) = '' then
           begin
            ACanvas.Font.Color :=  clWhite;
            ACanvas.Brush.Color :=  clred;
           end;
        end;
     end;

end;

procedure TDocSelectOptions.cxoptionsDBTableView1InitEdit(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit);
 var
  Ext : String ;
  ArrayVars : variant ;
  I : Integer ;
  Aprice :Double ;

begin

    if AItem.RepositoryItem = pricecombo then
      begin
      if  copy(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,1,11) = 'FEXTRAPRICE' then
 begin
  ArrayVars := VarArrayOf([Null,Null,Null,Null,Null]) ;
   for i := 0 to Level do
       begin
          ArrayVars[i] :=   aoptionsDataset.FieldByName('WITEMOPTIONVALUE'+IntToStr(I+1)+'ID').AsInteger ;
       end;

  Ext :=   copy(tcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,12,5);

  If ZQStockOptions.Locate('WITEMOPTIONVALUE1ID;WITEMOPTIONVALUE2ID;WITEMOPTIONVALUE3ID;WITEMOPTIONVALUE4ID;WITEMOPTIONVALUE5ID', ArrayVars ,[]) then
              begin
              TcxCombobox(AEdit).properties.Items.clear ;
               Aprice := TDataBaseStockRoutines.getStockPrice(Accountid,ZQStockOptionsWSTOCKID.AsInteger,  aoptionsDataset.FieldByName('FQTY'+Ext).AsFloat) ;

                IF LastInclusive then
                  begin

                  TcxCombobox(AEdit).properties.Items.Add(FormatFloat('0.00',(Aprice+ZQStockOptionsFEXTRAPRICE.AsFloat)* TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID)));
                   TcxCombobox(AEdit).properties.Items.Add( FormatFloat('0.00',(Aprice+ZQStockOptionsFEXTRAPRICE2.AsFloat)* TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID)));
                  TcxCombobox(AEdit).properties.Items.Add(FormatFloat('0.00',(Aprice+ZQStockOptionsFEXTRAPRICE3.AsFloat)* TDataBaseRoutines.GetTaxRateOnId(LastLineTaxID)));
                  end else
                  begin
                   TcxCombobox(AEdit).properties.Items.Add(FormatFloat('0.00',Aprice+ZQStockOptionsFEXTRAPRICE.AsFloat));
                   TcxCombobox(AEdit).properties.Items.Add(FormatFloat('0.00',Aprice+ZQStockOptionsFEXTRAPRICE2.AsFloat));
                   TcxCombobox(AEdit).properties.Items.Add(FormatFloat('0.00',Aprice+ZQStockOptionsFEXTRAPRICE3.AsFloat));
                  end;
              end;
  end;

end;


end;

procedure TDocSelectOptions.price1Click(Sender: TObject);
 var
  Ext : String ;

begin
if  copy(TcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName,1,11) = 'FEXTRAPRICE' then
 begin
  aoptionsDataset.edit ;
  aoptionsDataset.FieldByName(tcxGridDBColumn(cxoptionsDBTableView1.Controller.FocusedColumn).DataBinding.FieldName).AsFloat := StrToFloatDef(TMenuItem(Sender).Caption,0) ;
  aoptionsDataset.Post ;

 end;

end;

end.
