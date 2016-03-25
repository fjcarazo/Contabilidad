unit ULocBatSerInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess , Uni, DB,   
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls,
  Menus, MemDS;

type
  TLocBatSerInput = class(TForm)
    DSData: TDataSource;
    ZSQLData: TUniUpdateSql;
    ZQData: TuniQuery;
    ZQDataWLOCBATSER_ID: TIntegerField;
    ZQDataWSTOCKID: TIntegerField;
    ZQDataWDOCID: TIntegerField;
    ZQDataWLINEID: TIntegerField;
    ZQDataSDESCRIPTION: TStringField;
    ZQDataDLASTSALESDATE: TDateField;
    ZQDataFQTY: TFloatField;
    ZQDataWLOCATIONID: TIntegerField;
    ZQDataDCREATEDATE: TDateField;
    ZQDataFQTYORG: TFloatField;
    ZQDataLOCATION: TStringField;
    QLocation: TuniQuery;
    QLocationWLOCATIONID: TIntegerField;
    QLocationSLOCCODE: TStringField;
    ZUSQLStock: TUniUpdateSql;
    ZQStockLocBatSer: TuniQuery;
    ZQStockLocBatSerWSTOCKID: TIntegerField;
    ZQStockLocBatSerWLOCBATSERTYPEID: TIntegerField;
    PBotom: TPanel;
    BClose: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    ZQSales: TuniQuery;
    ZUSQLSales: TUniUpdateSql;
    ZQSalesWLOCBATSERSALE_ID: TIntegerField;
    ZQSalesWLOCBATSER_ID: TIntegerField;
    ZQSalesWDOCID: TIntegerField;
    ZQSalesWLINEID: TIntegerField;
    ZQSalesDLASTSALESDATE: TDateField;
    ZQSalesFQTY: TFloatField;
    ZQSalesWSTOCKID: TIntegerField;
    dssales: TDataSource;
    ZQSalesDESCRIPTION: TStringField;
    ZQGetDescr: TuniQuery;
    ZQGetDescrSDESCRIPTION: TStringField;
    ZQGetDescrSLOCCODE: TStringField;
    ZQSalesLOCATION: TStringField;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    bChange: TButton;
    Edit1: TEdit;
    dtpDate: TDBEdit;
    dtpDate2: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Efastscan: TEdit;
    EFromrange: TEdit;
    EToRange: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    bAddRange: TButton;
    PopupMenu1: TPopupMenu;
    Selectall1: TMenuItem;
    cbLocations: TComboBox;
    Lfilterloc: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    eSaleFrom: TEdit;
    ESalesTo: TEdit;
    Button1: TButton;
    procedure ZQDataAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZQDataBeforePost(DataSet: TDataSet);
    procedure ZQSalesCalcFields(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure AddRecord(sender:Tobject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure ZQDataAfterScroll(DataSet: TDataSet);
    procedure ZQSalesAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure bChangeClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EfastscanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bAddRangeClick(Sender: TObject);
    function ValidateFromToRange(Afrom,ATo : String ):Integer ;
    procedure Selectall1Click(Sender: TObject);
    procedure cbLocationsChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    LastStockId,LastLineId,LastDocType,LastLoc  : Integer ;
    LastProductionDate,LastSalesDate : TDate ;
    GoToSerial : String ;
   // NeedUpdateList : TStringList ;
    procedure InitData(ADocid,ADocType : Integer);
    procedure LoadData(ADocid,Alineid,AStockID : Integer);
    Function  GetLastTotalQty : Double ;
    procedure DeleteLine(Alineid: Integer);
    procedure DeleteDoc(ADocid: Integer);
    procedure PostData(ADocid : Integer);
    procedure cancelPost ;
    procedure InitType ;
    procedure InitSalesType ;
    procedure reverseSales ;


    { Public declarations }
  end;

var
  LocBatSerInput: TLocBatSerInput;

implementation

uses UDMTCCoreLink, OSFGeneralRoutines, Math, UMsgBox, NewProgress;

{$R *.dfm}

procedure TLocBatSerInput.ZQDataAfterInsert(DataSet: TDataSet);
begin
 ZQDataWLOCBATSER_ID.AsInteger := 0 ;
 ZQDataWSTOCKID.AsInteger := LastStockId ;
 ZQDataWLINEID.AsInteger := LastLineId ;
 if LastLoc <> 0 then
    ZQDataWLOCATIONID.AsInteger := LastLoc ;
 if LastProductionDate <> 0 then
    ZQDataDCREATEDATE.AsDateTime := LastProductionDate ;
 if LastSalesDate <> 0 then
    ZQDataDLASTSALESDATE.AsDateTime := LastSalesDate ;

 if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger = 1 then
    begin
      ZQDataFQTY.AsFloat := 1 ;
      ZQDataFQTYORG.AsFloat := 1 ;
    end;
end;

procedure TLocBatSerInput.FormCreate(Sender: TObject);
begin
   DMTCCoreLink.AssignConnectionToChilds(self);
  // NeedUpdateList := TStringList.create ;

   ZQStockLocBatSer.SQL.Text := 'Select WStockid,WLOCBATSERTYPEID  from stock where WStockid = :Stockid'  ;
   QLocation.open ;
   QLocation.first ;
   cbLocations.Items.Clear ;
   cbLocations.AddItem('All',nil);
   while not QLocation.eof do
      begin
         cbLocations.AddItem(QLocationSLOCCODE.AsString,Tobject(QLocationWLOCATIONID.AsInteger));
         QLocation.Next ;
      end;

   if cbLocations.items.IndexOf(TDatabaseRegistyRoutines.ReadAppRegValue('SERIALS','DEFLOCATION')) <> -1 then
      cbLocations.ItemIndex := cbLocations.items.IndexOf(TDatabaseRegistyRoutines.ReadAppRegValue('SERIALS','DEFLOCATION'))
      else
      cbLocations.ItemIndex := 0 ;
   if  cbLocations.Items.Count = 0 then
      begin
        Lfilterloc.Visible := False ;
        cbLocations.Visible := False ;
      end;
end;


procedure TLocBatSerInput.LoadData(ADocid, Alineid, AStockID: Integer);
Var
 ShowTheseIds ,SPosted : String ;
begin
 

 TabSheet1.tabvisible := false ;
 TabSheet2.tabvisible := false ;

 LastStockId := AStockID ;

 LastLineId  :=  Alineid ;
 ZQStockLocBatSer.close ;
 ZQStockLocBatSer.Params[0].AsInteger := AStockID ;
 ZQStockLocBatSer.open ;

  if (LastDocType in [11,12,15]) then
  begin
  PageControl1.ActivePage := TabSheet1 ;

 ZQData.Filtered := false ;
    ZQData.Filter := 'WLINEID='+ IntToStr(Alineid) ;
    ZQData.Filtered := true ;
    ZQData.First ;
    while not ZQData.eof do
      begin
        if ZQDataWSTOCKID.AsInteger <> AStockID  then
           ZQData.delete else
           ZQData.next ;
     end;

 if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger > 0 then
  begin

  if not ZQData.Locate('WLINEID',Alineid,[]) then
    begin
     ZQData.Append ;
     ZQDataWDOCID.AsInteger := ADocid ;
     ZQDataWLINEID.AsInteger := Alineid ;
     ZQDataWSTOCKID.AsInteger := AStockID ;
     ZQData.Post ;
    end ;
    ZQData.First ;
    InitType ;
    self.ShowModal ;

 end ;
 end else
 begin
  PageControl1.ActivePage := TabSheet2 ;

  ZQData.close ;
  ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WStockid =' + IntToStr(AStockID) +' and FQTY > 0 ' ;
  ZQData.open ;

 ZQStockLocBatSer.close ;
 ZQStockLocBatSer.Params[0].AsInteger := AStockID ;
 ZQStockLocBatSer.open ;
 if  ZQSales.Active then
 begin
 ZQSales.Filtered := false ;
    ZQSales.Filter := 'WLINEID='+ IntToStr(Alineid) ;
    ZQSales.Filtered := true ;
    ZQSales.First ;
   ShowTheseIds := '' ;
    while not ZQSales.eof do
      begin
        if ZQSalesWSTOCKID.AsInteger <> AStockID  then
          // todo : Alse reverse them.
           ZQSales.delete else
           begin
            ShowTheseIds := ShowTheseIds + ',' +  ZQSalesWLOCBATSER_ID.AsString ;
            ZQSales.next ;
           end;
     end;
  end;
  if ShowTheseIds <> '' then
     ShowTheseIds := copy(ShowTheseIds,2,length(ShowTheseIds))
     else
     ShowTheseIds := '0' ;
  ZQData.close ;
  //SPosted := 'and (b.BPosted is null or b.BPosted=1)' ;
  SPosted := '' ;
  ZQData.Filter := '' ;
  ZQData.SQL.Text := 'select a.* from DOC_LOCBATSER a left join dochead b on a.WDocid = b.WDocid  where (a.FQty <> 0 or a.WLOCBATSER_ID in ('+ShowTheseIds+') ) ' + Sposted + ' and a.WStockid =' + IntToStr(AStockID) ;
  ZQData.open ;

  if cbLocations.ItemIndex > 0 then
    begin
     ZQData.Filter := 'WLOCATIONID = ' + IntToStr(Integer(cbLocations.Items.objects[cbLocations.ItemIndex])); ;
     ZQData.Filtered := True ;
    end;


 if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger > 0 then
  begin
    InitSalesType ;
    ZQData.First ;
    if GoToSerial <> '' then
       begin
          ZQData.Locate('SDESCRIPTION',GoToSerial,[]);
       end;
    if not ZQData.IsEmpty then
    self.ShowModal ;
 end;
 end;
end;

procedure TLocBatSerInput.PostData(ADocid: Integer);

 
begin
 try
  if ZQData.Active = false then
      exit ;



     if (LastDocType in [11,12,15]) then
      begin
        ZQData.Filtered := False ;
        ZQData.First ;

       while not ZQData.Eof do
         begin
             if ZQDataWDOCID.AsInteger <> ADocid then
             begin
                ZQData.Edit ;
                ZQDataWDOCID.AsInteger := ADocid ;
                ZQData.post ;
             end;
             if ZQDataWLOCBATSER_ID.AsInteger = 0 then
             begin
                ZQData.Edit ;
                ZQDataWLOCBATSER_ID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_LOCBATSER') ;
                ZQData.post ;
             end;
           ZQData.next ;
        end;
        end else
        begin
        ZQData.Filtered := False ;
        ZQData.First ;
        ZQSales.Filtered := False ;
        if ZQData.State <> dsbrowse then
          ZQData.post ;
         if ZQData.UpdatesPending then
           ZQData.CancelUpdates ;

         { for i := NeedUpdateList.Count -1 downto 0 do
            begin
              try
              if TuniQuery(NeedUpdateList.Objects[i]).UpdatesPending then
                      TuniQuery(NeedUpdateList.Objects[i]).ApplyUpdates ;
              except
                TuniQuery(NeedUpdateList.Objects[i]).CancelUpdates ;
              end;
            end;

          for i := NeedUpdateList.Count -1 downto 0 do
            begin
                TuniQuery(NeedUpdateList.Objects[i]).Free ;
            end;  

           NeedUpdateList.Clear ; }
          if ZQSales.Active then
          begin
         ZQSales.FIRST ;
         while not ZQSales.Eof do
         begin
             if ZQSalesWDOCID.AsInteger <> ADocid then
             begin
                ZQSales.Edit ;
                ZQSalesWDOCID.AsInteger := ADocid ;
                ZQSales.post ;
             end;
             if ZQSalesWLOCBATSERSALE_ID.AsInteger = 0 then
             begin
                ZQSales.Edit ;
                ZQSalesWLOCBATSERSALE_ID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_LOCBATSERSALE');
                ZQSales.post ;
             end;
           ZQSales.next ;
        end;
        end;
        end;
        try
            if ZQData.UpdatesPending then
               ZQData.ApplyUpdates ;
            if ZQSales.UpdatesPending then
             ZQSales.ApplyUpdates ;
        except
        on e:Exception do
          begin
           if self.ShowModal = mrOk then
            PostData(ADocid);


          {  if ZQData.UpdatesPending then
             ZQData.CancelUpdates ;
            if ZQSales.UpdatesPending then
             ZQSales.CancelUpdates ;
             Raise Exception.create(e.message);  }
          end;
     end;

   except
     on e:Exception do
       begin
         showmessage(e.message);
       end;
   end;
end;


procedure TLocBatSerInput.InitData(ADocid,ADocType :  Integer);

begin
 // look if sales is posted last time if not reverese
 if ZQSales.UpdatesPending then
    begin
      reverseSales ;
    end;

 LastDocType := ADocType ;


 if (LastDocType in [11,12,15]) then
  begin
  ZQData.close ;
  ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WDocid =' + IntToStr(ADocid) ;
  ZQData.open ;
  end else
  begin
         {   for i := NeedUpdateList.Count -1 downto 0 do
            begin
              TuniQuery(NeedUpdateList[i]).free ;
            end;
           NeedUpdateList.clear ;  }

   ZQSales.close ;
   ZQSales.SQL.Text := 'select * from DOC_LOCBATSERSALE where WDocid =' + IntToStr(ADocid) ;
   ZQSales.open ;
  end;
end;

procedure TLocBatSerInput.ZQDataBeforePost(DataSet: TDataSet);

begin
 LastLoc := ZQDataWLOCATIONID.AsInteger ;
 LastProductionDate := ZQDataDCREATEDATE.AsDateTime ;
 LastSalesDate   := ZQDataDLASTSALESDATE.AsDateTime ;

 if (LastDocType in [11,12,15]) then
    ZQDataFQTY.AsFloat := ZQDataFQTYORG.AsFloat
    else
    begin



  end;
end;

procedure TLocBatSerInput.InitType;
  var i : Integer ;
begin
  for i:= 0 to DBGrid1.Columns.Count-1 do
    DBGrid1.Columns[i].Visible := true ;


  DBEdit1.Visible := true ;
  dtpDate.Visible := true ;
  dtpDate2.Visible := true ;
  DBEdit4.Visible := true ;
  DBLookupComboBox1.Visible := not QLocation.IsEmpty ;
  Label1.Visible := true ;
  Label2.Visible := true ;
  Label3.Visible := true ;
  Label4.Visible := true ;
  Label5.Visible := true ;

  case ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger of
  -1,0 : begin

           Label4.Visible := false ;
           DBEdit4.Visible := false ;
           Self.Caption := 'Non' ;
         end;
  1 : begin
            for i:= 0 to DBGrid1.Columns.Count-1 do
             begin
              if  DBGrid1.Columns[i].Field = ZQDataFQTYORG then
                  DBGrid1.Columns[i].Visible := false ;
               if  DBGrid1.Columns[i].Field = ZQDataLOCATION then
                  DBGrid1.Columns[i].Visible := not QLocation.IsEmpty  ;
             end;


           Label4.Visible := false ;
           DBEdit4.Visible := false ;
           Self.Caption := 'Serial input' ;
      end;
  2 : begin
         Self.Caption := 'Batch location' ;
            for i:= 0 to DBGrid1.Columns.Count-1 do
             begin
               if  DBGrid1.Columns[i].Field = ZQDataLOCATION then
                  DBGrid1.Columns[i].Visible := not QLocation.IsEmpty  ;
             end;

      end;
  3 : begin
            for i:= 0 to DBGrid1.Columns.Count-1 do
             begin
               if  DBGrid1.Columns[i].Field = ZQDataLOCATION then
                  DBGrid1.Columns[i].Visible := not QLocation.IsEmpty  ;
               if  DBGrid1.Columns[i].Field = ZQDataSDESCRIPTION then
                  DBGrid1.Columns[i].Visible := fALSE  ;
             end;

           Label1.Visible := false ;
           DBEdit1.Visible := false ;
           Label2.Visible := false ;
           dtpDate.Visible := false ;
           Label3.Visible := false ;
           dtpDate2.Visible := false ;
           Self.Caption := 'Location' ;
         end;
  end;
 { if DBLookupComboBox1.CanFocus then
     DBLookupComboBox1.SetFocus ;}
end;
procedure TLocBatSerInput.DeleteLine(Alineid: Integer);
var
 MyVariance : Double ;
begin
  if ZQData.Active = false then
      exit ;

 if (LastDocType in [11,12,15]) then
 begin
 ZQData.Filtered := false ;
 ZQData.Filter := 'WLINEID='+ IntToStr(Alineid) ;
 ZQData.Filtered := true ;
 while not ZQData.IsEmpty do
   ZQData.Delete;
 end else
 begin
 ZQData.DisableControls ;
 try
 if ZQSales.Active then
 begin
 ZQSales.First ;
 ZQSales.Filtered := False ;
 ZQSales.Filter := 'WLINEID = ' + IntToStr(Alineid);
 ZQSales.Filtered := true ;
 While not ZQSales.Eof do
  begin
    MyVariance := ZQSalesFQTY.AsFloat ;


    ZQData.close ;
    ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WLOCBATSER_ID = ' + ZQSalesWLOCBATSER_ID.AsString ;
    ZQData.open ;
    ZQData.Edit ;
    ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat + MyVariance ;
    ZQData.Post ;

     ZQSales.next ;
   end;
   end; 
   finally
      ZQData.EnableControls ;
   end;
  end;

 end;

procedure TLocBatSerInput.DeleteDoc(ADocid: Integer);
var
 MyVariance : Double ;
begin

 if (LastDocType in [11,12,15]) then
 begin

    ZQData.close ;
    ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WDOCID = ' + IntToStr(ADocid)  ;
    ZQData.Filtered := false ;
    ZQData.Filter := '' ;

    ZQData.open ;

 while not ZQData.IsEmpty do
   ZQData.Delete;
 end else
 begin
    ZQSales.close ;
    ZQSales.SQL.Text := 'select * from DOC_LOCBATSERSALE where WDOCID = ' + IntToStr(ADocid)  ;
    ZQSales.open ;


 ZQSales.Filtered := False ;
 ZQSales.Filter := '' ;
 ZQSales.First ; 
 While not ZQSales.Eof do
  begin
    MyVariance := ZQSalesFQTY.AsFloat ;
    ZQData.close ;
    ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WLOCBATSER_ID = ' + ZQSalesWLOCBATSER_ID.AsString ;
    ZQData.open ;
    ZQData.Edit ;
    ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat + MyVariance ;
    ZQData.Post ;
    if ZQData.UpdatesPending then
       ZQData.ApplyUpdates ;
     ZQSales.next ;   
   end;

  end;
end;


function TLocBatSerInput.GetLastTotalQty: Double;
begin
 result := 0 ;
 if (LastDocType in [11,12,15]) then
 begin
 ZQData.First ;
 while not ZQData.Eof do
   begin
     result := result + ZQDataFQTY.AsFloat ;
     ZQData.Next ;
   end;
 end else
 begin
 if  ZQSales.Active then
 begin
   ZQSales.First ;
 while not ZQSales.Eof do
   begin
     result := result + ZQSalesFQTY.AsFloat ;
     ZQSales.Next ;
   end;
  end; 
 end;
end;

procedure TLocBatSerInput.ZQSalesCalcFields(DataSet: TDataSet);
begin
 ZQGetDescr.close ;
 ZQGetDescr.Params[0].AsInteger := ZQSalesWLOCBATSER_ID.AsInteger ;
 ZQGetDescr.Open ;
 ZQSalesDESCRIPTION.AsString := ZQGetDescrSDESCRIPTION.AsString ;
 ZQSalesLOCATION.AsString := ZQGetDescrSLOCCODE.AsString ;
end;

procedure TLocBatSerInput.DBGrid2DblClick(Sender: TObject);
var
 MaxSale ,CurrentQty: Double ;
 ISNew : Boolean ;
 i : Integer ;
begin
 if ZQData.IsEmpty then exit ;
if DBGrid2.SelectedRows.Count = 0 then
   DBGrid2.SelectedRows.CurrentRowSelected := True ;


for i := 0 to DBGrid2.SelectedRows.Count -1 do
 begin
  ZQData.Bookmark := DBGrid2.SelectedRows.Items[i] ;
   AddRecord(self);
   end;
end;

procedure TLocBatSerInput.DBGrid3DblClick(Sender: TObject);
var
 MaxSale,CurrentQty : Double ;
begin
if ZQSales.IsEmpty then exit ;
if ZQSalesFQTY.AsFloat <= 0 then exit ;
 if ZQData.Locate('WLOCBATSER_ID',ZQSalesWLOCBATSER_ID.AsInteger,[]) then
   begin
   MaxSale := ZQSalesFQTY.AsFloat ;
   if MaxSale > 1 then
     MaxSale := 1 ;

   // see if non was changed
   CurrentQty := DMTCCoreLink.OpenSqlReturnFirstColumn('select Fqty from DOC_LOCBATSER where  WLOCBATSER_ID = ' + ZQDataWLOCBATSER_ID.AsString );
   if  (VarToStr(ZQDataFQTY.OldValue) <> '') and (ZQDataFQTY.OldValue <> CurrentQty) then
     begin
       ZQData.close ;
       ZQData.open ;
       Raise Exception.Create('Item was changed by other user please select again!');

     end;

   ZQSales.Edit ;
   ZQSalesFQTY.AsFloat := ZQSalesFQTY.AsFloat - MaxSale ;
   ZQSales.Post ;
   ZQData.Edit ;
   ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat  + MaxSale ;
   ZQData.Post ;
   if ZQData.UpdatesPending then
      ZQData.ApplyUpdates ;


   if ZQSalesFQTY.AsFloat = 0 then
      ZQSales.Delete ;

  end;
end;

procedure TLocBatSerInput.ZQDataAfterScroll(DataSet: TDataSet);
begin
  if ZQData.IsEmpty then exit ;
  if ZQSales.Active then
  if not ZQData.ControlsDisabled then
  if ZQSales.Locate('WLOCBATSER_ID',ZQDataWLOCBATSER_ID.AsInteger,[]) then
     begin
     Edit1.Text := ZQSalesFQTY.AsString ;
     Edit1.SelectAll ;
     end else
   begin
     bChange.Visible := false ;
     Edit1.Visible := false ;
   end;
end;

procedure TLocBatSerInput.ZQSalesAfterPost(DataSet: TDataSet);
begin
   Edit1.Text := ZQSalesFQTY.AsString ;
 if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger <> 1 then
    begin
     bChange.Visible := True ;
     Edit1.Visible := True ;
     Edit1.SelectAll ;
     try
     if Edit1.CanFocus then
     Edit1.setfocus ;
     except

     end;
   end;

end;

procedure TLocBatSerInput.BitBtn1Click(Sender: TObject);
begin
 if ZQData.State <> dsBrowse then
    ZQData.Post ;

 ZQData.Append ;
 if QLocation.IsEmpty then
   begin
   if DBEdit4.CanFocus then
     DBEdit4.SetFocus  else
   if DBEdit1.CanFocus then
      DBEdit1.SetFocus
   end else
 if DBLookupComboBox1.CanFocus then
    DBLookupComboBox1.SetFocus ;
end;

procedure TLocBatSerInput.InitSalesType;
var
 i : Integer ;
begin
 Edit1.Visible := true;
 bChange.Visible := true;
 for i := 0 to DBGrid2.Columns.Count -1 do
   begin
     DBGrid2.Columns[i].Visible := true;
   end;
 for i := 0 to DBGrid3.Columns.Count -1 do
   begin
     DBGrid3.Columns[i].Visible := true;
   end;
 if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger = 1 then
    begin
      Self.Caption := 'Serial selection' ;
      Edit1.Visible := False;
      bChange.Visible := False;
     for i := 0 to DBGrid2.Columns.Count -1 do
       begin
              if (DBGrid2.Columns[i].Field = ZQDataFQTY)  then
               DBGrid2.Columns[i].Visible := False;
       end;
     for i := 0 to DBGrid3.Columns.Count -1 do
       begin
              if (DBGrid3.Columns[i].Field = ZQSalesFQTY)  then
               DBGrid3.Columns[i].Visible := False;
       end;


    end else
     if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger = 1 then
     begin
       Self.Caption := 'Batch location selection' ;
     end else
      if ZQStockLocBatSerWLOCBATSERTYPEID.AsInteger = 3 then
      begin
        Self.Caption := 'Location selection' ;
      end;
  {  if DBGrid2.CanFocus then
       DBGrid2.SetFocus ;    }
end;

procedure TLocBatSerInput.bChangeClick(Sender: TObject);
var
 aVariance ,CurrentQty : Double ;
 LastidTogoto : Integer ;
begin
 ZQData.DisableControls ;
 try
 if StrToFloatDef(Edit1.Text,-1) <0 then
   begin
    exit ;
   end;
 if ZQData.IsEmpty then exit ;
 if ZQSales.IsEmpty then exit ;
 LastidTogoto :=  ZQSalesWLOCBATSER_ID.AsInteger ;
 if ZQData.Locate('WLOCBATSER_ID',LastidTogoto,[]) then
   begin
     aVariance := ZQSalesFQTY.AsFloat - (StrToFloatDef(Edit1.Text,-1)) ;
     if ZQDataFQTY.AsFloat + aVariance < 0 then
        aVariance := - ZQDataFQTY.AsFloat ;


   // see if non was changed
   CurrentQty := DMTCCoreLink.OpenSqlReturnFirstColumn('select Fqty from DOC_LOCBATSER where  WLOCBATSER_ID = ' + ZQDataWLOCBATSER_ID.AsString );
   if  (VarToStr(ZQDataFQTY.OldValue) <> '') and (ZQDataFQTY.OldValue <> CurrentQty) then
     begin
 
       ZQData.close ;
       ZQData.open ;
       Raise Exception.Create('Item was changed by other user please select again!');

     end;


     ZQSales.Edit ;
     ZQSalesFQTY.AsFloat := ZQSalesFQTY.AsFloat - aVariance ;
     ZQSales.Post ;

     ZQData.Edit ;
     ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat  + aVariance ;
     ZQData.Post ;
     if ZQData.UpdatesPending then
         ZQData.ApplyUpdates ; 

     ZQData.Locate('WLOCBATSER_ID',LastidTogoto,[]) ;
   end;
  finally
    ZQData.EnableControls ;
  end;
end;

procedure TLocBatSerInput.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
    if not ZQData.IsEmpty then
      DBGrid2DblClick(self);
end;

procedure TLocBatSerInput.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if key = '.' then key := DecimalSeparator ;
 if key = #13 then bChangeClick(self);
end;

procedure TLocBatSerInput.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_ESCAPE then
    self.close ;
 

end;

procedure TLocBatSerInput.DBGrid3KeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
    if not ZQSales.IsEmpty then
      DBGrid3DblClick(self);
end;

procedure TLocBatSerInput.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ZQDataFQTY.AsFloat = 0 then
     begin
        if (gdSelected in state ) or (gdFocused in state) then
          begin
           DBGrid2.Canvas.Font.Color := clRed ;
           DBGrid2.Canvas.Brush.Color := clwhite ;
          end else
          begin
           DBGrid2.Canvas.Font.Color := clwhite ;
           DBGrid2.Canvas.Brush.Color := clRed ;
         end;
     end;
   DBGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);  
end;

procedure TLocBatSerInput.FormShow(Sender: TObject);
begin
 LastLoc := 0 ;
 LastProductionDate :=  0 ;
 LastSalesDate   :=  0 ;
 EFromrange.Text := '' ;
 EToRange.Text := '' ;
 Efastscan.Text := '' ;

 DBLookupComboBox1.Visible := not QLocation.IsEmpty ;
 Label5.Visible := DBLookupComboBox1.Visible ;
  if PageControl1.ActivePageIndex = 0 then
     begin
       if QLocation.IsEmpty then
         begin
         if DBEdit4.CanFocus then
           DBEdit4.SetFocus else
         if DBEdit1.CanFocus then
           DBEdit1.SetFocus
         end else
       if DBLookupComboBox1.CanFocus then
          DBLookupComboBox1.SetFocus ;
     end else
     begin
      DBGrid2.SetFocus ;

     end;
end;

procedure TLocBatSerInput.FormDestroy(Sender: TObject);
begin
 // NeedUpdateList.free ;
end;

procedure TLocBatSerInput.reverseSales;
var
 MyVariance : Double ;
begin
 if not ZQSales.Active then exit ;
 ZQData.DisableControls ;
 try
 ZQSales.Filtered := false ;
 ZQSales.First ;
 While not ZQSales.Eof do
  begin
  if (ZQSalesFQTY.Value <> ZQSalesFQTY.OldValue) then
  begin
    if (VartoStr(ZQSalesFQTY.OldValue) <> '') then
    MyVariance := (ZQSalesFQTY.AsFloat - ZQSalesFQTY.OldValue)
    else MyVariance := ZQSalesFQTY.AsFloat ;


    ZQData.close ;
    ZQData.SQL.Text := 'select * from DOC_LOCBATSER where WLOCBATSER_ID = ' + ZQSalesWLOCBATSER_ID.AsString ;
    ZQData.open ;
    ZQData.Edit ;
    ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat + MyVariance ;
    ZQData.Post ;
    if ZQData.UpdatesPending then
       ZQData.ApplyUpdates ;
   end;
   ZQSales.next ;
  end;
 if ZQSales.UpdatesPending then
    ZQSales.CancelUpdates ;
 finally
   ZQData.EnableControls ;
 end;
end;

procedure TLocBatSerInput.cancelPost;
begin
   if ZQData.Active = false then
      exit ;
  reverseSales ;
end;

procedure TLocBatSerInput.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13)   then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TLocBatSerInput.DBLookupComboBox1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_INSERT then
    BitBtn1Click(self);
 if key = VK_ESCAPE then
    self.close ;    
end;

procedure TLocBatSerInput.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_ESCAPE then
    self.close ;
 if key = VK_UP then
    ZQData.Prior ;
 if key = VK_Down then
    ZQData.Next ;
  if not Edit1.Visible then
    DBGrid2.SetFocus ;
end;

procedure TLocBatSerInput.SpeedButton1Click(Sender: TObject);
begin
 DateTimePicker1.Visible := True ;

 if  ZQDataDLASTSALESDATE.AsDateTime  <> 0 then
 DateTimePicker1.Date := ZQDataDLASTSALESDATE.AsDateTime
 else
 DateTimePicker1.Date := date ;

 DateTimePicker1.SetFocus ;
 DateTimePicker1.BringToFront ;
end;

procedure TLocBatSerInput.DateTimePicker1Exit(Sender: TObject);
begin
 if (ZQData.State = dsbrowse) then
   ZQData.Edit ;
  ZQDataDLASTSALESDATE.AsDateTime := DateTimePicker1.Date ;
  DateTimePicker1.Visible := false ;
end;

procedure TLocBatSerInput.DateTimePicker2Exit(Sender: TObject);
begin
 if (ZQData.State = dsbrowse) then
   ZQData.Edit ;
  ZQDataDCREATEDATE.AsDateTime := DateTimePicker2.Date  ;
  DateTimePicker2.Visible := false ;
end;

procedure TLocBatSerInput.SpeedButton2Click(Sender: TObject);
begin
 DateTimePicker2.Visible := True ;

 if ZQDataDCREATEDATE.AsDateTime <> 0 then
 DateTimePicker2.Date := ZQDataDCREATEDATE.AsDateTime
 else
 DateTimePicker2.Date := date ;
 DateTimePicker2.SetFocus ;
 DateTimePicker2.BringToFront ;
end;

procedure TLocBatSerInput.BitBtn2Click(Sender: TObject);
begin
   ZQData.Delete ;
end;

procedure TLocBatSerInput.EfastscanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_return then
    begin
      if ZQData.Locate('SDESCRIPTION', Efastscan.Text,[]) then
         if OSFMessageDlg('Item ' + Efastscan.Text +' is in list! continue!' , mtConfirmation,[mbyes,mbNo],0 ) = mrNo then exit ;

     if ZQDataSDESCRIPTION.AsString <> '' then
          BitBtn1Click(self);

        ZQData.edit  ;
        ZQDataSDESCRIPTION.AsString := Efastscan.Text ;
        ZQData.post ;
        Efastscan.SetFocus ;
        Efastscan.SelectAll ;
    end;
end;

procedure TLocBatSerInput.bAddRangeClick(Sender: TObject);
var
 AList : TStringList ;
 MaxIter : Integer ;
 CurLine,NextLine : String ;
 AProgress : TfmNewProgress ;
begin
 MaxIter := 0 ;
 if Trim(EFromrange.Text) = '' then
    begin
      EFromrange.SetFocus ;
      EFromrange.Hint := 'Enter from range';
      EFromrange.ShowHint := True ;
      Exit ;
    end;
 if Trim(EToRange.Text) = '' then
    begin
      EToRange.SetFocus ;
      EToRange.Hint := 'Enter to range';
      EToRange.ShowHint := True ;
      Exit ;
    end;

 MaxIter := ValidateFromToRange(Trim(EFromrange.Text) ,Trim(EToRange.Text));
 if MaxIter = -3 then
   raise Exception.Create('No range foud!');
 if MaxIter = -2 then
   raise Exception.Create('Postfix not the same!');
 if MaxIter = -1 then
   raise Exception.Create('Prefix not the same!');
if OSFMessageDlg('Do you wish to add ' + IntToStr(MaxIter ) +' serials ? ',mtConfirmation,[mbYes,mbNo],0,True) = mrno then
             exit ;

 AList := TStringList.Create ;
  try
    AList.Add(EFromrange.Text);
    CurLine := EFromrange.Text ;
    NextLine := TDataBaseStringRoutines.IncrementString(CurLine);
    while (CurLine <> NextLine) and (CurLine <> EToRange.Text) do
      begin
        AList.Add(NextLine) ;
        CurLine := NextLine ;
        NextLine := TDataBaseStringRoutines.IncrementString(CurLine);
        Dec(MaxIter);
        if MaxIter < 0 then exit ;

      end;
    if AList.IndexOf(EToRange.Text) = -11 then
    AList.Add(EToRange.Text);
     AProgress := TfmNewProgress.Create(self) ;
     ZQData.DisableControls;
     try
          AProgress.initProgress('Creating...',AList.Count);
         // AProgress.Parent := self ;
        //  AProgress.Align := alBottom;
          for maxiter := 0 to AList.Count -1 do
              begin
                 if ZQData.Locate('SDESCRIPTION',AList[maxiter],[]) then
                  if OSFMessageDlg('Item ' + AList[maxiter] +' is in list! continue!' , mtConfirmation,[mbyes,mbNo],0 ) = mrNo then
                     exit
                  else
                    Continue ;

                 AProgress.BtnStop.Visible := True ;
                  if ZQDataSDESCRIPTION.AsString <> '' then
                   BitBtn1Click(self);
                   ZQData.edit  ;
                   ZQDataSDESCRIPTION.AsString := AList[maxiter] ;
                   ZQData.post ;
                // Application.ProcessMessages ;
                AProgress.SetProgress('',MaxIter+1);
                 if AProgress.bStop then
                   raise Exception.Create('User stop!');
             end;
      finally
          ZQData.EnableControls ;
          AProgress.free ;
       end;

  finally
    AList.free ;
  end;

end;

procedure TLocBatSerInput.Selectall1Click(Sender: TObject);

begin
DBGrid2.DataSource.DataSet.First ;
while not DBGrid2.DataSource.DataSet.Eof do
  begin
  DBGrid2.SelectedRows.CurrentRowSelected :=True ;
  DBGrid2.DataSource.DataSet.next ;
  end;

end;

procedure TLocBatSerInput.cbLocationsChange(Sender: TObject);
begin

 ZQData.Filter := '' ;
 if cbLocations.ItemIndex > 0 then
    begin
    ZQData.Filter := 'WLOCATIONID = ' + IntToStr(Integer(cbLocations.Items.objects[cbLocations.ItemIndex])); ;
     ZQData.Filtered := True ;
    end;
end;

procedure TLocBatSerInput.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 TDatabaseRegistyRoutines.WriteAppRegValue('SERIALS','DEFLOCATION',cbLocations.Text) ;
end;

function TLocBatSerInput.ValidateFromToRange(Afrom, ATo: String): Integer;

var
 AFromleft,AfromMid,AFromRight,AtoLeft,AtoMid,AtoRight : String ;
 i,innerState,Total : Integer ;

begin
aFromleft := '' ;
AfromMid := '' ;
AFromRight := '' ;
AtoLeft := '' ;
AtoMid  := '' ;
AtoRight := '' ;
  innerState := 0 ;
  for i := length(Afrom) downto 1 do
    begin
      if innerState = 0 then
      begin
        if  (Afrom[i] in ['0','1','2','3','4','5','6','7','8','9']) then
           innerState := 1 ;
      end else
      if innerState = 1 then
      begin
         if not  (Afrom[i] in ['0','1','2','3','4','5','6','7','8','9']) then
          innerState := 2 ;
      end;

      case innerState of
        0 : AFromRight :=Afrom[i] + AFromRight ;
        1 : AfromMid :=Afrom[i] + AfromMid ;
        2 : AFromleft :=Afrom[i] + AFromleft ;

       end;
    end;

 innerState := 0 ;
  for i := length(ATo) downto 1 do
    begin
      if innerState = 0 then
      begin
        if  (ATo[i] in ['0','1','2','3','4','5','6','7','8','9']) then
          innerState := 1 ;
      end else
      if innerState = 1 then
      begin
         if not  (ATo[i] in ['0','1','2','3','4','5','6','7','8','9']) then
          innerState := 2 ;
      end;

      case innerState of
        0 : AtoRight :=ATo[i] + AtoRight ;
        1 : AtoMid :=ATo[i] + AtoMid ;
        2 : AtoLeft :=ATo[i] + AtoLeft ;

       end;
    end;
   if AFromleft <> AtoLeft then
     result := -1
     else
   if AFromRight <> AtoRight then
      result := -2
    else
     begin

       Total := StrTOIntDef(TDataBaseStringRoutines.StripNotInt(AfromMid),0) ;
       Total := StrTOIntDef(TDataBaseStringRoutines.StripNotInt(AtoMid),0) - Total ;
       if Total < 1 then
        Total:= -3 else
         Total := Total + 1 ;
       Result := Total ;


     end;

end;

procedure TLocBatSerInput.Button1Click(Sender: TObject);
var
 AList : TStringList ;
 MaxIter : Integer ;
 CurLine,NextLine : String ;
  AProgress : TfmNewProgress ;
begin
 MaxIter := 0 ;
 if Trim(eSaleFrom.Text) = '' then
    begin
      eSaleFrom.SetFocus ;
      eSaleFrom.Hint := 'Enter from range';
      eSaleFrom.ShowHint := True ;
      Exit ;
    end;
 if Trim(ESalesTo.Text) = '' then
    begin
      ESalesTo.SetFocus ;
      ESalesTo.Hint := 'Enter to range';
      ESalesTo.ShowHint := True ;
      Exit ;
    end;

 MaxIter := ValidateFromToRange(Trim(eSaleFrom.Text) ,Trim(ESalesTo.Text));
 if MaxIter = -3 then
   raise Exception.Create('No range foud!');
 if MaxIter = -2 then
   raise Exception.Create('Postfix not the same!');
 if MaxIter = -1 then
   raise Exception.Create('Prefix not the same!');
if OSFMessageDlg('Do you wish to add ' + IntToStr(MaxIter ) +' serials ? ',mtConfirmation,[mbYes,mbNo],0,True) = mrno then
             exit ;

 AList := TStringList.Create ;
  try
    AList.Add(eSaleFrom.Text);
    CurLine := eSaleFrom.Text ;
    NextLine := TDataBaseStringRoutines.IncrementString(CurLine);
    while (CurLine <> NextLine) and (CurLine <> ESalesTo.Text) do
      begin
        AList.Add(NextLine) ;
        CurLine := NextLine ;
        NextLine := TDataBaseStringRoutines.IncrementString(CurLine);
        Dec(MaxIter);
        if MaxIter < -2 then exit ;

      end;
    if AList.IndexOf(ESalesTo.Text) = -1 then
        AList.Add(ESalesTo.Text);

     AProgress := TfmNewProgress.Create(self) ;
     ZQData.DisableControls;
     ZQSales.DisableControls;
     try
      AProgress.initProgress('Creating...',AList.Count);

        ZQData.Filtered := False;

          for maxiter := 0 to AList.Count -1 do
              begin
                if ZQData.Locate( ZQDataSDESCRIPTION.FieldName,AList[maxiter],[]) then
                   AddRecord(self);
                AProgress.SetProgress('',MaxIter+1);
                 if AProgress.bStop then
                   raise Exception.Create('User stop!');
             end;
      finally
          ZQData.EnableControls ;
           ZQSales.EnableControls;
          AProgress.free ;
       end;

  finally
    AList.free ;
  end;

end;

procedure TLocBatSerInput.AddRecord(sender: Tobject);
var
 MaxSale ,CurrentQty: Double ;
 ISNew : Boolean ;

begin

 if not ZQSales.Locate('WLOCBATSER_ID',ZQDataWLOCBATSER_ID.AsInteger,[]) then
   begin
   ISNew := true ;
   ZQSales.Append ;
   ZQSalesFQTY.AsFloat := 0 ;
   ZQSalesWDOCID.AsInteger := 0 ;
   ZQSalesWLINEID.AsInteger := LastLineId ;
   ZQSalesWSTOCKID.AsInteger := LastStockId ;
   ZQSalesWLOCBATSER_ID.AsInteger := ZQDataWLOCBATSER_ID.AsInteger ;
   ZQSalesWLOCBATSERSALE_ID.AsInteger := 0 ;
   if not ZQDataDLASTSALESDATE.IsNull then
   ZQSalesDLASTSALESDATE.AsDateTime := ZQDataDLASTSALESDATE.AsDateTime ;
   ZQSales.Post ;

   end;



   ZQSales.Edit ;
   MaxSale := ZQDataFQTY.AsFloat ;
   If MaxSale > 1 then
      MaxSale := 1 ;


   ZQSalesFQTY.AsFloat := ZQSalesFQTY.AsFloat + MaxSale ;
   ZQSales.Post ;
   ZQData.Edit ;
   ZQDataFQTY.AsFloat := ZQDataFQTY.AsFloat  - MaxSale ;
   ZQData.Post ;
   if ZQData.UpdatesPending then
      ZQData.ApplyUpdates ;


end;
procedure TLocBatSerInput.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = vk_return then
    begin
       if ZQData.Locate( ZQDataSDESCRIPTION.FieldName,Edit2.Text,[]) then
            AddRecord(self);
        Edit2.SetFocus ;
        Edit2.SelectAll ;
    end;
end;

end.
