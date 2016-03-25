unit UStockLinkDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,   DBAccess , Uni, ImgList,
  ComCtrls,jpeg,VirtualTable, Grids, DBGrids, StdCtrls, ExtCtrls,
  Buttons, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTreeView;

type
  TStockLinkDetail = class(TForm)
    ZQLinkedDef: TuniQuery;
    TreeView1: TcxTreeView;
    ILitems: TImageList;
    ZQLinkedDefWSTOCKLINKSALEID: TIntegerField;
    ZQLinkedDefWSTOCKID: TIntegerField;
    ZQLinkedDefWLINKSTOCKID: TIntegerField;
    ZQLinkedDefWGROUPID: TIntegerField;
    ZQLinkedDefWGROUPITEMID: TIntegerField;
    ZQLinkedDefFEXTRAPRICE: TFloatField;
    ZQLinkedDefWPRICETYPE: TSmallintField;
    ZQLinkedDefWSORTID: TIntegerField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    LTotExcl: TLabel;
    lTotInc: TLabel;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    ZQDoclineLink: TuniQuery;
    ZUSQLDocLinked: TUniUpdateSql;
    ZQDoclineLinkWDOCLINKED_ID: TIntegerField;
    ZQDoclineLinkWDOCLINEID: TIntegerField;
    ZQDoclineLinkWDOCID: TIntegerField;
    ZQDoclineLinkWSTOCKID: TIntegerField;
    ZQDoclineLinkWLINETYPEID: TIntegerField;
    ZQDoclineLinkWDESCRIPTIONID: TIntegerField;
    ZQDoclineLinkFQTYORDERED: TFloatField;
    ZQDoclineLinkFQTYSHIPPED: TFloatField;
    ZQDoclineLinkFSELLINGPRICE: TFloatField;
    ZQDoclineLinkFITEMDISCOUNT: TFloatField;
    ZQDoclineLinkWTAXID: TIntegerField;
    ZQDoclineLinkFEXCLUSIVEAMT: TFloatField;
    ZQDoclineLinkFINCLUSIVEAMT: TFloatField;
    ZQDoclineLinkFTAXAMOUNT: TFloatField;
    ZQDoclineLinkDSYSDATE: TDateTimeField;
    ZQDoclineLinkSUNIT: TStringField;
    ZQDoclineLinkSSTOCKCODE: TStringField;
    ZQDoclineLinkWPROFILEID: TIntegerField;
    ZQDoclineLinkWSERIALNOID: TIntegerField;
    ZQDoclineLinkWSORTNO: TIntegerField;
    ZQDoclineLinkWREPORTINGGROUP1ID: TIntegerField;
    ZQDoclineLinkWREPORTINGGROUP2ID: TIntegerField;
    ZQDoclineLinkWACCOUNTID: TIntegerField;
    ZQDoclineLinkFUNITQTY: TFloatField;
    Eqty: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure ZQDoclineLinkAfterInsert(DataSet: TDataSet);
    procedure EqtyKeyPress(Sender: TObject; var Key: Char);
    procedure EqtyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FBaseQuery: TuniQuery;
    aDataset : TVirtualTable ;
    procedure SetBaseQuery(const Value: TuniQuery);
    function AddGlyph(aListImage: TImageList; aFilename: String): Integer;
    procedure DatasetAfterPost(Sender: TDataset);
    { Private declarations }
  public
    CurrentDocid,
    CurrentLineId ,
    DefaultTax ,
    CurrentAccount,
    CurrentGotoIndex : Integer ;
    DocType : Integer ;
    HasChoices : Boolean ;
    TotExcl,TotInc : Double ;
   property BaseQuery : TuniQuery  read FBaseQuery write SetBaseQuery;
   procedure InitFromStock(AStockid : Integer ) ;
   procedure InitCheckStart  ;
   procedure InitFromStockDocLine(AStockid : Integer;Alineid : Integer ) ;
   procedure RecalcTotals ;
   procedure LoadDoc(ADocid : Integer) ;
   procedure SaveDoc(ADocid : Integer) ;
   procedure deleteline(Alineid : Integer );
   function GetLastTotalQty : Double ;
   procedure TotalFromStockDocLine(ALineId : Integer ;Var ATotExc, ATotInc : Double );

    { Public declarations }
  end;

var
  StockLinkDetail: TStockLinkDetail;

implementation

uses UDMTCCoreLink, OSFGeneralRoutines, TcashClasses;

{$R *.dfm}

{ TStockLinkDetail }


function TStockLinkDetail.AddGlyph(aListImage:TImageList;aFilename : String) : Integer ;
Var
  ABmp,BBmp : TBitmap ;
  TempFilename : String ;
   Ajpg :  TJPEGImage ;
Begin


    if not FileExists(aFileName) then
       exit ;
    if uppercase(ExtractFileExt(aFileName)) ='.JPG'then
     begin
       ABmp := TBitmap.Create ;
       Ajpg := TJPEGImage.Create ;
       Try
         Ajpg.LoadFromFile(aFileName);
         ABmp.Width := aListImage.Width ;
         ABmp.Height := aListImage.Height ;
          aBmp.PixelFormat :=pf32bit ;
          aBmp.Canvas.StretchDraw(rect(0,0,aListImage.Width,aListImage.Width), Ajpg);

         result := aListImage.Add(ABmp,nil) ;
         aListImage.ReplaceMasked(result,ABmp,ABmp.Canvas.Pixels[0,0]) ;

       Finally
         ABmp.Free;
         Ajpg.free ;
       end;
     end else
    if uppercase(ExtractFileExt(aFileName)) ='.ICO'then
     begin
       ABmp := TBitmap.Create ;
       Try
         ABmp.Width := aListImage.Width ;
         ABmp.Height := aListImage.Height ;

         DMTCCoreLink.Icon2Bmp(aListImage.Width,aFileName,ABmp);


         result := aListImage.Add(ABmp,nil) ;
         aListImage.ReplaceMasked(result,ABmp,ABmp.Canvas.Pixels[0,0]) ;

       Finally
         ABmp.Free;
       end;
     end else
     begin
       ABmp := TBitmap.Create ;
        try
         ABmp.LoadFromFile(aFileName);
         if ABmp.Width  <>  aListImage.Width then
          begin
           BBmp := TBitmap.Create ;
              try
              BBmp.Width :=  aListImage.Width ;
              BBmp.Height :=  aListImage.Width ;
              BBmp.PixelFormat :=pf32bit ;
              BBmp.Canvas.StretchDraw(rect(0, 0, aListImage.Width, aListImage.Width),ABmp);
              result := aListImage.Add(ABmp,nil) ;
              // aListImage.ReplaceMasked(Index,BBmp,ABmp.Canvas.Pixels[0,ABmp.height]) ;
              aListImage.Replace(result,BBmp,nil) ;

                finally
                   BBmp.Free ;
                end;
          end else
          begin
           result := aListImage.Add(ABmp,nil) ;
           ABmp.TransparentColor := ABmp.Canvas.Pixels[0,ABmp.height-1] ;
           ABmp.Transparent := true ;

            aListImage.ReplaceMasked(result,ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1]) ;
          end;
        finally
           ABmp.Free ;
        end;
     end ;
   
end;

procedure TStockLinkDetail.InitFromStock(AStockid: Integer);
var
 LastGroup : String ;
 RootNode,SibNode : TTreeNode ;
 ImgName ,ImgName2 : String ;
begin
 HasChoices := False ;
 
 TreeView1.Items.BeginUpdate ;
 try
 TreeView1.Items.Clear ;
 ILitems.Clear ;
  if Not Assigned(FBaseQuery) or (FBaseQuery = ZQLinkedDef) then
     begin
      FBaseQuery := ZQLinkedDef ;
      ZQLinkedDef.close ;
      ZQLinkedDef.Params[0].AsInteger := AStockid ;
      ZQLinkedDef.open ;

     end;
  FBaseQuery.First ;
  while not FBaseQuery.Eof do
    begin
      if (LastGroup <>  FBaseQuery.FieldByName('WGROUPID').AsString) then
        begin

          RootNode := TreeView1.Items.AddChild(nil,DMTCCoreLink.GroupsObject.GetGroupName(FBaseQuery.FieldByName('WGROUPID').AsInteger)) ;

          ImgName := DMTCCoreLink.GroupsObject.GetGroupImgName(BaseQuery.FieldByName('WGROUPID').AsInteger);
          RootNode.ImageIndex := AddGlyph(ILitems,ImgName);
          RootNode.Data := Tobject(BaseQuery.FieldByName('WGROUPID').AsInteger);

          RootNode.SelectedIndex := RootNode.ImageIndex ;
          LastGroup := FBaseQuery.FieldByName('WGROUPID').AsString ;
        end;
     SibNode :=  TreeView1.Items.AddChild(RootNode,DMTCCoreLink.GroupsObject.GetGroupName(FBaseQuery.FieldByName('WGROUPITEMID').AsInteger)) ;
     SibNode.Data := Tobject(BaseQuery.FieldByName('WSTOCKLINKSALEID').AsInteger);
     ImgName := DMTCCoreLink.GroupsObject.GetGroupImgName(BaseQuery.FieldByName('WGROUPITEMID').AsInteger);

     if  BaseQuery.FieldByName('WPRICETYPE').AsInteger = 2 then
      if BaseQuery.FieldByName('WLINKSTOCKID').AsInteger  <>0 then
        begin
          ImgName2 := TDataBaseStockRoutines.getImage(BaseQuery.FieldByName('WLINKSTOCKID').AsInteger) ;
          if FileExists(ImgName2 )  then
            ImgName := ImgName2 ;
        end ;

     SibNode.ImageIndex := AddGlyph(ILitems,ImgName);
     SibNode.SelectedIndex := SibNode.ImageIndex ;
     SibNode.StateIndex := SibNode.ImageIndex ;
     RootNode.Expand(true);
     HasChoices := HasChoices or (RootNode.Count >1);
     FBaseQuery.next ;
    end;
  finally
    TreeView1.Items.EndUpdate ;

  end;
end;

procedure TStockLinkDetail.SetBaseQuery(const Value: TuniQuery);
begin
  FBaseQuery := Value;
end;

procedure TStockLinkDetail.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
 aDataset := TVirtualTable.Create(self) ;
 aDataset.FieldDefs.Add('WDOCID',ftInteger);
 aDataset.FieldDefs.Add('WLINEID',ftInteger);
 aDataset.FieldDefs.Add('WITEMID',ftInteger);
 aDataset.FieldDefs.Add('LOCALID',ftInteger);
 aDataset.FieldDefs.Add('MAINGROUP',ftInteger);
 aDataset.FieldDefs.Add('SUBGROUP',ftInteger);
 aDataset.FieldDefs.Add('STOCKID',ftInteger);
 aDataset.FieldDefs.Add('TAXID',ftInteger);
 aDataset.FieldDefs.Add('TYPEID',ftInteger);
 aDataset.FieldDefs.Add('DESCRIPTION',ftString,255);
 aDataset.FieldDefs.Add('FEXCL',ftFloat);
 aDataset.FieldDefs.Add('FINC',ftFloat);
DataSource1.DataSet := aDataset;
 aDataset.open ;
 aDataset.AfterPost := DatasetAfterPost ; 
 TDatabaseRegistyRoutines.ReadFormPos(self,'LINKDET');
end;

procedure TStockLinkDetail.FormDestroy(Sender: TObject);
begin

 aDataset.free ;
end;

procedure TStockLinkDetail.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
  var
   i  : Integer ;
   Price : Double ;
begin
CurrentGotoIndex := -1 ;
if Node.Parent <> nil then
  Node.Parent.Selected := True
  else
  begin
    RadioGroup1.Caption := Node.Text ;
    RadioGroup1.Items.Clear ;
    for i := 0 to  Node.Count -1 do
      begin
        RadioGroup1.Items.AddObject(Node.Item[i].Text,TObject(Node.Item[i].Data));
        if  aDataset.Locate('WITEMID',Integer(Node.Item[i].Data),[]) then
           CurrentGotoIndex := RadioGroup1.Items.Count -1 ;
        if FBaseQuery.Locate('WSTOCKLINKSALEID',Integer(Node.Item[i].Data),[]) then
          begin
            if FBaseQuery.fieldByName('WPRICETYPE').AsInteger = 2 then
              begin
                Price := TDataBaseStockRoutines.getStockPrice(CurrentAccount,FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger,1);
              end else
              if FBaseQuery.fieldByName('WPRICETYPE').AsInteger = 0 then
              begin
                Price :=  FBaseQuery.fieldByName('FEXTRAPRICE').AsFloat
              end else
                Price :=  - FBaseQuery.fieldByName('FEXTRAPRICE').AsFloat;

                RadioGroup1.Items[RadioGroup1.Items.Count -1] := RadioGroup1.Items[RadioGroup1.Items.Count -1] + '  ' +
                FormatFloat('0.00##', Price );

          end;
      end;
     if RadioGroup1.Items.Count = 1 then
     RadioGroup1.ItemIndex :=  0
     else
     RadioGroup1.ItemIndex :=  CurrentGotoIndex ;
  end;

end;

procedure TStockLinkDetail.RadioGroup1Click(Sender: TObject);
var
 Price : Double ;
 TaxRate : Double ;
begin
if CurrentGotoIndex =   RadioGroup1.ItemIndex then
  exit ;
 if RadioGroup1.ItemIndex <> -1 then
   begin
    if CurrentGotoIndex <> -1 then
      begin
          if  aDataset.Locate('WITEMID',Integer(RadioGroup1.Items.Objects[CurrentGotoIndex] ),[]) then
            begin
             aDataset.delete ;
            end;
      end;
     if  FBaseQuery.Locate('WSTOCKLINKSALEID',Integer(RadioGroup1.Items.Objects[RadioGroup1.ItemIndex ] ),[]) then
     begin
    aDataset.Insert ;
    aDataset.FieldByName('WDOCID').AsInteger := CurrentDocid ;
    aDataset.FieldByName('WLINEID').AsInteger := CurrentLineId ;
    aDataset.FieldByName('WITEMID').AsInteger := FBaseQuery.fieldByName('WSTOCKLINKSALEID').AsInteger ;
    aDataset.FieldByName('LOCALID').AsInteger := 0;
    aDataset.FieldByName('MAINGROUP').AsInteger := FBaseQuery.fieldByName('WGROUPID').AsInteger;
    aDataset.FieldByName('SUBGROUP').AsInteger := FBaseQuery.fieldByName('WGROUPITEMID').AsInteger;
    aDataset.FieldByName('DESCRIPTION').Asstring := DMTCCoreLink.GroupsObject.GetGroupName(aDataset.FieldByName('MAINGROUP').AsInteger) + ' ' +
                    DMTCCoreLink.GroupsObject.GetGroupName(aDataset.FieldByName('SUBGROUP').AsInteger) ;
    aDataset.FieldByName('STOCKID').AsInteger := FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger;
    aDataset.FieldByName('TYPEID').AsInteger := FBaseQuery.fieldByName('WPRICETYPE').AsInteger ;


  if FBaseQuery.fieldByName('WPRICETYPE').AsInteger = 2 then
              begin
                Price := TDataBaseStockRoutines.getStockPrice(CurrentAccount,FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger,1);
              end else
              if FBaseQuery.fieldByName('WPRICETYPE').AsInteger = 0 then
              begin
                Price :=  FBaseQuery.fieldByName('FEXTRAPRICE').AsFloat
              end else
                Price :=  - FBaseQuery.fieldByName('FEXTRAPRICE').AsFloat;

    aDataset.FieldByName('FEXCL').AsFloat := Price ;

   aDataset.FieldByName('TAXID').AsInteger := 0 ;
   if DefaultTax <> 0 then
   begin
     aDataset.FieldByName('TAXID').AsInteger :=DefaultTax ;
   end else
   begin
   if (DocType in [0,10,11,14,16,18]) then
      aDataset.FieldByName('TAXID').AsInteger := TDataBaseStockRoutines.GetOuputTaxId(FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger)
      else
      aDataset.FieldByName('TAXID').AsInteger := TDataBaseStockRoutines.GetInputTaxId(FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger)  ;
   end;
    TaxRate := TDataBaseRoutines.GetTaxRateOnId(aDataset.FieldByName('TAXID').AsInteger);
    aDataset.FieldByName('FINC').AsFloat := Price *TaxRate  ;
    aDataset.post ;
    RecalcTotals ;
    CurrentGotoIndex :=   RadioGroup1.ItemIndex ;
    end;


   end;
end;

procedure TStockLinkDetail.RecalcTotals;
var
 Abookmark :  DB.TBookmark ;
 Fqty : Double ;
begin
  Fqty := StrToFloatDef(Eqty.Text,1);
  TotExcl := 0 ;
  TotInc  := 0 ;
  if not aDataset.IsEmpty then
   begin
 Abookmark := aDataset.Bookmark ;
 Try
   aDataset.first ;
   while not aDataset.eof do
     begin
        TotExcl := TotExcl + aDataset.fieldByName('FEXCL').AsFloat ;
        TotInc := TotInc +   aDataset.fieldByName('FINC').AsFloat ;
        aDataset.next ;
     end;
 finally
   aDataset.Bookmark :=  Abookmark ;
   aDataset.FreeBookmark(Abookmark);
 end;
 end;
 LTotExcl.Caption := FormatFloat('0.00',TotExcl*Fqty);
 lTotInc.Caption := FormatFloat('0.00',TotInc*Fqty);
end;

procedure TStockLinkDetail.BtnCancelClick(Sender: TObject);
begin
 self.close ;
end;

procedure TStockLinkDetail.BtnOkClick(Sender: TObject);
var
 Disc : Double ;
begin
 aDataset.AfterPost := nil ;
 try
 RecalcTotals ;

 if ZQDoclineLink.Active then
   begin
      ZQDoclineLink.first ;
      while not ZQDoclineLink.eof do
         begin
           if ZQDoclineLinkWDOCLINEID.AsInteger = CurrentLineId then
            ZQDoclineLink.Delete else
           ZQDoclineLink.Next  ;
         end;
     aDataset.First ;
     while not aDataset.Eof do
       begin
         ZQDoclineLink.Insert ;
         ZQDoclineLinkWDOCLINEID.AsInteger := CurrentLineId ;
         ZQDoclineLinkWLINETYPEID.AsInteger := 90 ;
         ZQDoclineLinkWDESCRIPTIONID.AsInteger := 0 ;
         ZQDoclineLinkFQTYORDERED.AsFloat := StrToFloatDef(Eqty.Text,1) ;
         ZQDoclineLinkFQTYSHIPPED.AsFloat := StrToFloatDef(Eqty.Text,1) ;
         ZQDoclineLinkWSTOCKID.AsInteger := aDataset.fieldByName('STOCKID').AsInteger  ;
         ZQDoclineLinkFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(0,ZQDoclineLinkWSTOCKID.AsInteger,1) ;
         ZQDoclineLinkWTAXID.AsInteger := aDataset.fieldByName('TAXID').AsInteger  ;
         ZQDoclineLinkFEXCLUSIVEAMT.AsFloat := ZQDoclineLinkFQTYORDERED.AsFloat * aDataset.fieldByName('FEXCL').AsFloat ;
         ZQDoclineLinkFINCLUSIVEAMT.AsFloat := ZQDoclineLinkFQTYORDERED.AsFloat * aDataset.fieldByName('FINC').AsFloat ;
           Disc := (ZQDoclineLinkFSELLINGPRICE.AsFloat * ZQDoclineLinkFQTYSHIPPED.AsFloat);
          if ZQDoclineLinkFEXCLUSIVEAMT.AsFloat <> 0 then
             ZQDoclineLinkFITEMDISCOUNT.AsFloat := (Disc / ZQDoclineLinkFEXCLUSIVEAMT.AsFloat)*100 ;
          ZQDoclineLinkFTAXAMOUNT.AsFloat :=   ZQDoclineLinkFINCLUSIVEAMT.AsFloat - ZQDoclineLinkFEXCLUSIVEAMT.AsFloat ;
          ZQDoclineLinkSSTOCKCODE.AsString := DMTCCoreLink.stockObject.getStockCode(ZQDoclineLinkWSTOCKID.AsInteger);
           ZQDoclineLinkWPROFILEID.AsInteger := aDataset.fieldByName('WITEMID').AsInteger  ;
          ZQDoclineLinkFUNITQTY.AsFloat := 1 ;
          ZQDoclineLink.post ;


         aDataset.next ;
       end;
   end;
 self.ModalResult := mrok ;
 finally
   aDataset.AfterPost := DatasetAfterPost ;
 end;
end;

procedure TStockLinkDetail.ZQDoclineLinkAfterInsert(DataSet: TDataSet);
begin
 ZQDoclineLinkWDOCLINKED_ID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_DOCLINELINKSALE');
 ZQDoclineLinkWDOCLINEID.AsInteger := CurrentLineId ;
 ZQDoclineLinkWDOCID.AsInteger := CurrentDocid ;
end;

procedure TStockLinkDetail.EqtyKeyPress(Sender: TObject; var Key: Char);
begin
 if key = '.' then key := DecimalSeparator ;
 
end;

procedure TStockLinkDetail.EqtyChange(Sender: TObject);
begin
if StrToFloatDef(Eqty.Text,0) <> 0 then
   begin
     RecalcTotals ;

   end;
end;

procedure TStockLinkDetail.LoadDoc(ADocid : Integer);
begin
  CurrentDocid :=  ADocid ;
  ZQDoclineLink.close ;
  ZQDoclineLink.params[0].AsInteger := ADocid ;
  ZQDoclineLink.open ;
end;

procedure TStockLinkDetail.SaveDoc(ADocid : Integer);
begin
  if not ZQDoclineLink.Active then exit ;
  ZQDoclineLink.First ;
  while not ZQDoclineLink.Eof do
    begin
      if ZQDoclineLinkWDOCID.AsInteger <> ADocid then
        begin
           ZQDoclineLink.Edit ;
           ZQDoclineLinkWDOCID.AsInteger := ADocid ;
           ZQDoclineLink.Post ;
        end;
      ZQDoclineLink.next ;
    end;
  if ZQDoclineLink.UpdatesPending then
    ZQDoclineLink.ApplyUpdates ;
end;

procedure TStockLinkDetail.InitFromStockDocLine(AStockid,
  Alineid: Integer);
  var
   Price ,TaxRate: Double ;
begin
 aDataset.AfterPost := nil ;
 try

  CurrentLineId := Alineid ;
  InitFromStock(AStockid);
  aDataset.Close ;
  aDataset.Open ;
  if not ZQDoclineLink.Active then exit ;
  ZQDoclineLink.First ;
  while not ZQDoclineLink.Eof do
    begin
      if ZQDoclineLinkWDOCLINEID.AsInteger = Alineid then
         begin
           begin

              if FBaseQuery.Locate('WSTOCKLINKSALEID', ZQDoclineLinkWPROFILEID.AsInteger ,[] ) then
              begin
              aDataset.Insert ;
              Eqty.Text :=   ZQDoclineLinkFQTYSHIPPED.AsString ;
              aDataset.FieldByName('WDOCID').AsInteger := CurrentDocid ;
              aDataset.FieldByName('WLINEID').AsInteger := CurrentLineId ;
              aDataset.FieldByName('WITEMID').AsInteger := FBaseQuery.fieldByName('WSTOCKLINKSALEID').AsInteger ;
              aDataset.FieldByName('LOCALID').AsInteger := 0;
              aDataset.FieldByName('MAINGROUP').AsInteger := FBaseQuery.fieldByName('WGROUPID').AsInteger;
              aDataset.FieldByName('SUBGROUP').AsInteger := FBaseQuery.fieldByName('WGROUPITEMID').AsInteger;
              aDataset.FieldByName('DESCRIPTION').Asstring := DMTCCoreLink.GroupsObject.GetGroupName(aDataset.FieldByName('MAINGROUP').AsInteger) + ' ' +
              DMTCCoreLink.GroupsObject.GetGroupName(aDataset.FieldByName('SUBGROUP').AsInteger) ;
              aDataset.FieldByName('STOCKID').AsInteger := FBaseQuery.fieldByName('WLINKSTOCKID').AsInteger;
              aDataset.FieldByName('TYPEID').AsInteger := FBaseQuery.fieldByName('WPRICETYPE').AsInteger ;

              aDataset.FieldByName('FEXCL').AsFloat := ZQDoclineLinkFEXCLUSIVEAMT.AsFloat ;

             aDataset.FieldByName('TAXID').AsInteger := ZQDoclineLinkWTAXID.AsInteger ;

              aDataset.FieldByName('FINC').AsFloat := ZQDoclineLinkFINCLUSIVEAMT.AsFloat  ;
              aDataset.post ;
              end;
            end;   
         end;
      ZQDoclineLink.next ;
    end;
  finally
    aDataset.AfterPost := DatasetAfterPost ;
  end;
    RecalcTotals ;
end;

procedure TStockLinkDetail.InitCheckStart;
var
 i : Integer ;
begin
 if not HasChoices then
   begin
     for i := 0 to TreeView1.Items.Count -1 do
       begin
          if TreeView1.Items[i].Parent = nil then
             TreeView1.Selected := TreeView1.Items[i] ;
       end;
      BtnOkClick(self); 
    end else
    self.ShowModal ;
end;

function TStockLinkDetail.GetLastTotalQty: Double;
begin
 Result :=   StrToFloatDef(Eqty.Text,1);
end;

procedure TStockLinkDetail.deleteline(Alineid: Integer);
begin
   if not ZQDoclineLink.Active then exit ;
  ZQDoclineLink.First ;
  while not ZQDoclineLink.Eof do
    begin
      if ZQDoclineLinkWDOCLINEID.AsInteger = Alineid then
         begin
           ZQDoclineLink.Delete ;
         end else
       ZQDoclineLink.next ;
    end;   
end;

procedure TStockLinkDetail.FormShow(Sender: TObject);
begin
 RecalcTotals ;
 if TreeView1.Items.Count <> 0 then
   TreeView1.Items[0].Selected := True ;

end;

procedure TStockLinkDetail.TotalFromStockDocLine(ALineId: Integer;
  var ATotExc, ATotInc: Double);
begin
ATotExc := 0 ;
ATotInc := 0 ;
  if not ZQDoclineLink.Active then exit ;
  ZQDoclineLink.First ;
  while not ZQDoclineLink.Eof do
    begin
      if ZQDoclineLinkWDOCLINEID.AsInteger = Alineid then
         begin
           ATotExc := ATotExc + ZQDoclineLinkFEXCLUSIVEAMT.AsFloat ;
           ATotInc := ATotInc + ZQDoclineLinkFINCLUSIVEAMT.AsFloat ;
         end;
      ZQDoclineLink.next ;   
     end;
end;

procedure TStockLinkDetail.DatasetAfterPost(Sender: TDataset);
begin
   RecalcTotals ;
end;

procedure TStockLinkDetail.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if Field = nil then exit ;
 if Field.DataSet = nil then exit ;
 if (Field.FieldName = 'FEXCL') and (Field.DataSet.State in [dsedit,DsInsert]) then
   begin
     Field.DataSet.FieldByName('FINC').AsFloat := Field.AsFloat * TDataBaseRoutines.GetTaxRateOnId( Field.DataSet.FieldByName('TAXID').AsInteger);

   end;

end;

procedure TStockLinkDetail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 TDatabaseRegistyRoutines.WriteFormPos(self,'LINKDET');
end;

end.
