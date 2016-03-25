(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BackOrdersOutstanding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db,Buttons, ExtCtrls, ComCtrls,
     DBAccess , Uni, Mask,
  TcashClasses, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  DBCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEditRepository;

type
  TfmBackOrdersOutstanding = class(TForm)
    StatusBar1: TStatusBar;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    DataSource1: TDataSource;
    ZQBackorder: TuniQuery;
    ZQBackorderWBACKORDERID: TIntegerField;
    ZQBackorderWACCOUNTID: TIntegerField;
    ZQBackorderWSTOCKID: TIntegerField;
    ZQBackorderFQTY: TFloatField;
    ZQBackorderFSELLINGPRICE: TFloatField;
    ZQBackorderBSELECTED: TSmallintField;
    ZQBackorderDSYSDATE: TDateTimeField;
    ZUSQLBackorder: TUniUpdateSql;
    ZQBackorderQTYONHAND: TFloatField;
    PageControl1: TPageControl;
    tsBackorder: TTabSheet;
    tsDetail: TTabSheet;
    tslist: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    BCDelete: TButton;
    BCEdit: TButton;
    BCAdd: TButton;
    ZQBackorderSSOURCE: TStringField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BRecalcSalePrice: TButton;
    ZQBackorderFDISCOUNT: TFloatField;
    ZQBackorderFPRICE: TFloatField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    ZQBackorderQTYEXP: TFloatField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WBACKORDERID: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid1DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid1DBTableView1FQTY: TcxGridDBColumn;
    cxGrid1DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid1DBTableView1BSELECTED: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1QTYONHAND: TcxGridDBColumn;
    cxGrid1DBTableView1SSOURCE: TcxGridDBColumn;
    cxGrid1DBTableView1FDISCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1FPRICE: TcxGridDBColumn;
    cxGrid1DBTableView1QTYEXP: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid2DBTableView1FQTY: TcxGridDBColumn;
    cxGrid2DBTableView1FSELLINGPRICE: TcxGridDBColumn;
    cxGrid2DBTableView1BSELECTED: TcxGridDBColumn;
    cxGrid2DBTableView1FDISCOUNT: TcxGridDBColumn;
    cxGrid2DBTableView1FPRICE: TcxGridDBColumn;
    cxGrid2DBTableView1QTYEXP: TcxGridDBColumn;
    ZQBackorderWUNITID: TIntegerField;
    cxGrid2DBTableView1WUNITID: TcxGridDBColumn;
    UniQUnit: TUniQuery;
    cxEditRepository1: TcxEditRepository;
    UnitLookup: TcxEditRepositoryLookupComboBoxItem;
    dsUnit: TDataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label9: TLabel;
    cxGrid2DBTableView1WBACKORDERID: TcxGridDBColumn;
    cxGrid2DBTableView1SSOURCE: TcxGridDBColumn;
    cxGrid1DBTableView1WUNITID: TcxGridDBColumn;
    brefresh: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BackOrdDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure ZQBackorderAfterInsert(DataSet: TDataSet);
    procedure ZQBackorderWSTOCKIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ZQBackorderCalcFields(DataSet: TDataSet);
    procedure ZQBackorderWACCOUNTIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BCAddClick(Sender: TObject);
    procedure BCDeleteClick(Sender: TObject);
    procedure BCEditClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ZQBackorderAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BRecalcSalePriceClick(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DBEdit6Exit(Sender: TObject);
    procedure ZQBackorderFQTYChange(Sender: TField);
    procedure brefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    vWAccountID:Integer;
    ViewType : Integer ;
    MDResult:Boolean;
    // formmode 0 = std 1 = stock =  2 deb
    FormMode ,FormLinkId : Integer ;
    AStockList : TStockRecList ;
    function HasAnnyThing : Boolean;
    function HasSomethingToDeliver : Boolean;
    { Public declarations }
  end;

var
  fmBackOrdersOutstanding: TfmBackOrdersOutstanding;

implementation

uses Main, UDMTCCoreLink, OSFGeneralRoutines, osfLookup, UMsgBox,
  UDmQuantumGridDefs,variants;


{$R *.DFM}

procedure TfmBackOrdersOutstanding.FormShow(Sender: TObject);

begin


 if ViewType = 0 then
   PageControl1.ActivePage := tsBackorder ;

  if ViewType = 1 then
   PageControl1.ActivePage := tslist ;

 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  Caption := DMTCCoreLink.GetTextLang(1191); // BackOrders Outatanding
  BtnOk.Caption :=  DMTCCoreLink.GetTextLang(167) ;
  BtnCancel.Caption :=  DMTCCoreLink.GetTextLang(168) ;



  cxGrid2DBTableView1WSTOCKID.Caption := DMTCCoreLink.gettextlang(37) ; // Description
  cxGrid2DBTableView1QTYEXP.Caption := DMTCCoreLink.gettextlang(1999) ; //
  cxGrid2DBTableView1FSELLINGPRICE.Caption := DMTCCoreLink.gettextlang(416) ; //
  cxGrid2DBTableView1FQTY.Caption := DMTCCoreLink.gettextlang(2052) ; // Selling price
  cxGrid2DBTableView1BSELECTED.Caption := DMTCCoreLink.gettextlang(1070) ; //
  cxGrid2DBTableView1FDISCOUNT.Caption := DMTCCoreLink.gettextlang(1711) ; //
  cxGrid2DBTableView1FPRICE.Caption := DMTCCoreLink.gettextlang(1709) ; //


  BRecalcSalePrice.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3317) ;



  Label1.Caption :=  DMTCCoreLink.GetTextLangNoAmp(31) ;
  Label2.Caption :=  DMTCCoreLink.GetTextLangNoAmp(37) ;
  Label3.Caption :=  DMTCCoreLink.GetTextLangNoAmp(2052) ;
  Label4.Caption :=  DMTCCoreLink.GetTextLangNoAmp(1999) ;


  BCAdd.Caption :=  DMTCCoreLink.GetTextLangNoAmp(983) ;
  BCEdit.Caption :=  DMTCCoreLink.GetTextLangNoAmp(121) ;
  BCDelete.Caption :=  DMTCCoreLink.GetTextLangNoAmp(173) ;

 

  Label5.Caption :=  DMTCCoreLink.GetTextLangNoAmp(416) ;
  Label6.Caption :=  DMTCCoreLink.GetTextLangNoAmp(3202) ;

  cxGrid1DBTableView1WACCOUNTID.Caption := DMTCCoreLink.gettextlang(31) ; // Description
  cxGrid1DBTableView1WSTOCKID.Caption := DMTCCoreLink.gettextlang(37) ; // Description
  cxGrid1DBTableView1FQTY.Caption := DMTCCoreLink.gettextlang(2052) ; // Qty

  cxGrid1DBTableView1FDISCOUNT.Caption := DMTCCoreLink.gettextlang(1711) ; // Selling price
  cxGrid1DBTableView1QTYONHAND.Caption := DMTCCoreLink.gettextlang(1999) ; // Qty on hand
  cxGrid1DBTableView1SSOURCE.Caption := DMTCCoreLink.gettextlang(3202) ;

  cxGrid1DBTableView1FSELLINGPRICE.Caption := DMTCCoreLink.gettextlang(416) ;
  cxGrid1DBTableView1FPRICE.Caption := DMTCCoreLink.gettextlang(1709) ;
  cxGrid1DBTableView1QTYEXP.Caption := 'Exp.' + DMTCCoreLink.gettextlang(1070) ; //



  
  
  Label8.Caption :=  DMTCCoreLink.GetTextLangNoAmp(1709) ;
  Label7.Caption :=  DMTCCoreLink.GetTextLangNoAmp(1711) ;



  Label2.Visible := FormMode <> 1 ;
  BitBtn2.Visible := FormMode <> 1 ;

  cxGrid1DBTableView1WSTOCKID.Visible := FormMode <> 1 ;
  cxGrid1DBTableView1WSTOCKID.VisibleForCustomization := cxGrid1DBTableView1WACCOUNTID.Visible ;

  DBEdit1.Visible := FormMode <> 2 ;
  Label1.Visible := FormMode <> 2 ;
  BitBtn1.Visible := FormMode <> 2 ;
 
  cxGrid1DBTableView1WACCOUNTID.Visible :=   FormMode <> 2 ;
  cxGrid1DBTableView1WACCOUNTID.VisibleForCustomization := cxGrid1DBTableView1WACCOUNTID.Visible ;
end;

procedure TfmBackOrdersOutstanding.BtnCancelClick(Sender: TObject);
begin
 if PageControl1.ActivePage = tsDetail then
    begin
     if (DataSource1.DataSet.State in [dsedit ,dsinsert]) then
         DataSource1.DataSet.Cancel ;
      PageControl1.ActivePage := tslist ;
      exit ;
    end;

  MDResult := False;
  Close;
end;

procedure TfmBackOrdersOutstanding.BtnOkClick(Sender: TObject);
begin
 if PageControl1.ActivePage = tsDetail then
    begin
     if (DataSource1.DataSet.State in [dsedit ,dsinsert]) then
        begin

        // ZQBackorderFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,ZQBackorderFQTY.AsFloat);
         DataSource1.DataSet.Post ;
        end;
      PageControl1.ActivePage := tslist ;
      exit ;
    end;
  MDResult := True;
  try
    if DataSource1.DataSet.state=dsEdit then
       DataSource1.DataSet.post;
  except end;
  Close;
end;

procedure TfmBackOrdersOutstanding.BackOrdDBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  Case key of
   #32:begin
        DataSource1.DataSet.Edit;
        DataSource1.DataSet.FieldByName('Bselected').AsInteger := Ord(not(DataSource1.DataSet.FieldByName('Bselected').Value <> 0));
        DataSource1.DataSet.post;
      end;
  end;
end;

procedure TfmBackOrdersOutstanding.ZQBackorderAfterInsert(
  DataSet: TDataSet);
begin
   ZQBackorderWBackOrderID.Value := DMTCCoreLink.GetNewId(tcidNEWBACKORDERID);
   if FormMode = 1 then
     begin
      ZQBackorderWSTOCKID.AsInteger := FormLinkId ;
      ZQBackorderWUNITID.AsInteger := DMTCCoreLink.stockObject.getStockDefUnit(ZQBackorderWSTOCKID.AsInteger);
     end;
   if FormMode = 2 then
      ZQBackorderWACCOUNTID.AsInteger := FormLinkId ;
   ZQBackorderFQTY.AsInteger := 1 ;
end;

procedure TfmBackOrdersOutstanding.ZQBackorderWSTOCKIDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
  var
  AStockPoint : TStockRecPointer ;
begin
  if AStockList.getStockOnid(AStockPoint,Sender.AsInteger) then
    begin
       AStockPoint^.FQtyExpected := TDataBaseStockRoutines.GetStockQty(ZQBackorderWSTOCKID.AsInteger) ;
       AStockPoint^.FQtyExpected := AStockPoint^.FQtyExpected - TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases(ZQBackorderWSTOCKID.AsInteger,0,0) ;
    end;
 Text :=  AStockPoint^.SSTOCKCODE + ' '+  AStockPoint^.SDescription;
end;

procedure TfmBackOrdersOutstanding.ZQBackorderCalcFields(
  DataSet: TDataSet);
  var
  AStockPoint : TStockRecPointer ;
begin
  if AStockList.getStockOnid(AStockPoint,ZQBackorderWSTOCKID.AsInteger) then
    begin
    end;
        AStockPoint^.FQtyExpected := TDataBaseStockRoutines.GetStockQty(ZQBackorderWSTOCKID.AsInteger)  ;

       AStockPoint^.FQtyExpected :=  AStockPoint^.FQtyExpected  - TDataBaseStockRoutines.GetUnpostedStockItemCountIncPurchases(ZQBackorderWSTOCKID.AsInteger,0,0,ZQBackorderWBACKORDERID.AsInteger) ;

  ZQBackorderQTYEXP.AsFloat :=  AStockPoint^.FQtyExpected  ;

  ZQBackorderQTYONHAND.AsFloat :=  AStockPoint^.FQtyExpected  ;
   if DMTCCoreLink.ExtraOptions.Values['BWARNBACKORD'] = 'True' then
      ZQBackorderQTYONHAND.AsFloat :=   ZQBackorderQTYONHAND.AsFloat  +  (ZQBackorderFQTY.AsFloat* TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) ;

end;

procedure TfmBackOrdersOutstanding.ZQBackorderFQTYChange(Sender: TField);
begin
 if not ZQBackorder.ControlsDisabled then
    BRecalcSalePriceClick(self) ;

end;

procedure TfmBackOrdersOutstanding.ZQBackorderWACCOUNTIDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text :=  TDataBaseRoutines.GetAccountFullDescription(Sender.AsInteger);
end;

procedure TfmBackOrdersOutstanding.DBEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = '.'then key := DecimalSeparator ;
end;

procedure TfmBackOrdersOutstanding.BitBtn1Click(Sender: TObject);
var
 Returnlookup : String ;
 Id : Integer ;
begin
 OSFGetLookupValue(Returnlookup,id,DMTCCoreLink.GetTextLangNoAmp(31),'BACKORD',tcstDEB,tcltAccount,ZQBackorderWACCOUNTID.AsInteger,0);
 if Id <> 0 then
   begin
      ZQBackorder.Edit ;
      ZQBackorder.disableControls ;
      try
      ZQBackorderWACCOUNTID.AsInteger := Id ;
      ZQBackorderWUNITID.AsInteger := DMTCCoreLink.stockObject.getStockDefUnit(ZQBackorderWSTOCKID.AsInteger);
       ZQBackorderFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getDefaultStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,false) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger);

      ZQBackorderFPRICE.AsFloat :=  (TDataBaseStockRoutines.getStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,ZQBackorderFQTY.AsFloat* TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * ZQBackorderFQTY.AsFloat;

      if (ZQBackorderFQTY.AsFloat <> 0 ) and (ZQBackorderFPRICE.AsFloat <> 0) then
      ZQBackorderFDISCOUNT.AsFloat :=  100 - ((ZQBackorderFSELLINGPRICE.AsFloat / (ZQBackorderFPRICE.AsFloat/ ZQBackorderFQTY.AsFloat)) * 100 )
      else
      ZQBackorderFDISCOUNT.AsFloat := 0 ;

      finally
         ZQBackorder.EnableControls ;
      end;
   end;

end;

procedure TfmBackOrdersOutstanding.BitBtn2Click(Sender: TObject);
var
 Returnlookup : String ;
 Id : Integer ;
begin

 OSFGetLookupValue(Returnlookup,id,DMTCCoreLink.GetTextLangNoAmp(37),'BACKORD',tcstDEB,tcltStock,ZQBackorderWSTOCKID.AsInteger,0);
 if Id <> 0 then
   begin
      ZQBackorder.Edit ;
      ZQBackorder.disableControls ;
      try
      ZQBackorderWSTOCKID.AsInteger := Id ;
      ZQBackorderWUNITID.AsInteger := DMTCCoreLink.stockObject.getStockDefUnit(ZQBackorderWSTOCKID.AsInteger);

      ZQBackorderFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getDefaultStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,false) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger);
      ZQBackorderFPRICE.AsFloat :=  (TDataBaseStockRoutines.getStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,ZQBackorderFQTY.AsFloat* TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * ZQBackorderFQTY.AsFloat;
      if (ZQBackorderFQTY.AsFloat <> 0 ) and (ZQBackorderFPRICE.AsFloat <> 0) then
      ZQBackorderFDISCOUNT.AsFloat :=  100 - ((ZQBackorderFSELLINGPRICE.AsFloat / (ZQBackorderFPRICE.AsFloat/ ZQBackorderFQTY.AsFloat)) * 100 )
      else
      ZQBackorderFDISCOUNT.AsFloat := 0 ;

      finally
        ZQBackorder.EnableControls ;
      end;

   end;
end;

procedure TfmBackOrdersOutstanding.BCAddClick(Sender: TObject);
begin
 ZQBackorder.Insert ;

 PageControl1.ActivePage := tsDetail ;
end;

procedure TfmBackOrdersOutstanding.BCDeleteClick(Sender: TObject);
begin
 if ZQBackorder.IsEmpty then exit ;
  if OSFMessageDlg(Format(DMTCCoreLink.GetTextLangNoAmp(2881),[DMTCCoreLink.GetTextLangNoAmp(906050) ]),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
   ZQBackorder.Delete ;
end;

procedure TfmBackOrdersOutstanding.BCEditClick(Sender: TObject);
begin
 if ZQBackorder.IsEmpty then exit ;
 PageControl1.ActivePage := tsDetail ;
end;

procedure TfmBackOrdersOutstanding.DBGrid1DblClick(Sender: TObject);
begin
 if ZQBackorder.IsEmpty then exit ;
 PageControl1.ActivePage := tsDetail ;
end;
 

function TfmBackOrdersOutstanding.HasSomethingToDeliver: Boolean;
begin
  ZQBackorder.First ;
  Result := False ;
  while not ZQBackorder.eof do
    begin
      if ZQBackorderQTYONHAND.AsFloat >= ZQBackorderFQTY.AsFloat then
        begin
        result := true ;
        Exit ;

        end;
      ZQBackorder.next ;
    end;
end;

procedure TfmBackOrdersOutstanding.ZQBackorderAfterOpen(DataSet: TDataSet);
begin
  AStockList.Clear ;
 if FormMode <> 0 then
   BCAdd.Enabled := FormLinkId <> 0 ;

end;

procedure TfmBackOrdersOutstanding.FormCreate(Sender: TObject);
var
 i : Integer ;
begin

  for i := 0 to PageControl1.PageCount -1 do
   PageControl1.Pages[i].TabVisible := false ;
 DMTCCoreLink.AssignConnectionToChilds(self);
 AStockList := TStockRecList.create ;
 UniQUnit.Open ;
end;

procedure TfmBackOrdersOutstanding.FormDestroy(Sender: TObject);
begin
 AStockList.free ;
end;

function TfmBackOrdersOutstanding.HasAnnyThing: Boolean;
begin
  ZQBackorder.First ;
  Result := False ;
  while not ZQBackorder.eof do
    begin
      if ZQBackorderQTYONHAND.AsFloat >= ZQBackorderFQTY.AsFloat then
        begin
        result := true ;
        Exit ;

        end;
      ZQBackorder.next ;
    end;
end;

procedure TfmBackOrdersOutstanding.BRecalcSalePriceClick(Sender: TObject);
begin
      ZQBackorder.Edit ;
      ZQBackorder.disableControls ;
      try

      ZQBackorderFSELLINGPRICE.AsFloat :=TDataBaseStockRoutines.getDefaultStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,false) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger);
      ZQBackorderFPRICE.AsFloat :=  (TDataBaseStockRoutines.getStockPrice(ZQBackorderWACCOUNTID.AsInteger,ZQBackorderWSTOCKID.AsInteger,ZQBackorderFQTY.AsFloat* TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * TDataBaseStockRoutines.GetUnitQty(ZQBackorderWUNITID.AsInteger)) * ZQBackorderFQTY.AsFloat;
      if (ZQBackorderFQTY.AsFloat <> 0 ) and (ZQBackorderFPRICE.AsFloat <> 0) then
      ZQBackorderFDISCOUNT.AsFloat :=  100 - ((ZQBackorderFSELLINGPRICE.AsFloat / (ZQBackorderFPRICE.AsFloat/ZQBackorderFQTY.AsFloat )) * 100 )
      else
      ZQBackorderFDISCOUNT.AsFloat := 0 ;
      finally
        ZQBackorder.EnableControls ;
      end;
end;

procedure TfmBackOrdersOutstanding.brefreshClick(Sender: TObject);
begin
 ZQBackorder.close ;
 ZQBackorder.open ;
end;

procedure TfmBackOrdersOutstanding.DBEdit8Change(Sender: TObject);
begin
 if DBEdit8.Focused then
  begin
  ZQBackorder.Edit ;
  ZQBackorderFSELLINGPRICE.AsFloat :=  (StrToFloatDef(DBEdit8.text,ZQBackorderFPRICE.AsFloat) / ZQBackorderFQTY.AsFloat ) * (1 - (ZQBackorderFDISCOUNT.AsFloat / 100));
  end;
end;

procedure TfmBackOrdersOutstanding.DBEdit7Change(Sender: TObject);
begin
 if DBEdit7.Focused then
  begin
  ZQBackorder.Edit ;
    if StrToFloatDef(DBEdit7.text,ZQBackorderFDISCOUNT.AsFloat) <> 0 then
    ZQBackorderFPRICE.AsFloat :=   ((100- StrToFloatDef(DBEdit7.text,ZQBackorderFDISCOUNT.AsFloat)) / 100)
    * (( ZQBackorderFSELLINGPRICE.AsFloat  *  ZQBackorderFQTY.AsFloat ))
    else
   ZQBackorderFPRICE.AsFloat :=   (( ZQBackorderFSELLINGPRICE.AsFloat  *  ZQBackorderFQTY.AsFloat )) ;


  end;
end;

procedure TfmBackOrdersOutstanding.DBEdit5Change(Sender: TObject);
begin
 if DBEdit5.Focused then
  begin
   ZQBackorder.Edit ;
   if ZQBackorderFDISCOUNT.AsFloat  <> 0 then
    ZQBackorderFPRICE.AsFloat :=  ((100- ZQBackorderFDISCOUNT.AsFloat) / 100)
    * ((StrToFloatDef(DBEdit5.text,ZQBackorderFSELLINGPRICE.AsFloat) *  ZQBackorderFQTY.AsFloat ))
    else
   ZQBackorderFPRICE.AsFloat :=   ((StrToFloatDef(DBEdit5.text,ZQBackorderFSELLINGPRICE.AsFloat) *  ZQBackorderFQTY.AsFloat )) ;
  end;
end;

procedure TfmBackOrdersOutstanding.DBEdit5KeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = '.' then key := DecimalSeparator ;
end;

procedure TfmBackOrdersOutstanding.DBEdit6Exit(Sender: TObject);
begin
 BRecalcSalePriceClick(self);
end;

procedure TfmBackOrdersOutstanding.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if   StrToFloatDef(varToStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1FQTY.Index]),0) < StrToFloatDef(varToStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1QTYONHAND.Index]),0) then
     begin

        if (AViewInfo.Selected ) then
          begin
              ACanvas.Brush.Color :=  clgreen ;
              ACanvas.Font.Color :=  clwhite ;
          end else
          begin
              ACanvas.Brush.Color :=  clwhite ;
              ACanvas.Font.Color :=  clgreen ;
          end;
     end;

end;

end.
