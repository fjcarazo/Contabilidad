(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockReOrder;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,TcVariables;

type
  TqrStockReOrder = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    lblUnit: TQRLabel;
    lblQtyOnHand: TQRLabel;
    lblCostPrice: TQRLabel;
    lblStockVal: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    qrBackOrder: TQRLabel;
    QRGroup1: TQRGroup;
    QRLStockGroup: TQRLabel;
    ARExtra: TQRLabel;
    QRTotalQuotePurchase: TQRLabel;
    QRLInvQtyOnHand: TQRLabel;
    QRDiverence: TQRLabel;
    QRDBText6: TQRDBText;
    QRUnitCost: TQRLabel;
    QRLabel5: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GeneralFloatPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure dblblQtyOnHandPrint(sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private

  public
     ReportGroup:Integer ;
     ShowAll       : Boolean;
     ShowExtraColumns,AddUnposted,ShowOrderQuote : Boolean ;
     StockInvoicedCollection : TStockInvoicedCollection ;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  qrStockReOrder: TqrStockReOrder;


implementation

Uses Database,  GlobalFunctions,LedgerRoutines, XRoutines;

{$R *.DFM}
Var
  vTotal:real;

procedure TqrStockReOrder.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vTotal:=0;
end;

procedure TqrStockReOrder.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  OTotal:Real;
   Ship,Order : Double ;
     Ship2,Order2 : Double ;
   aStockInvoicedItem : TStockInvoicedItem ;
begin

  // done : Pieter Tom Askt for the limitation of the items that need reorder ( no items with reorder 0)
  if  (Not ShowAll) and (dmDatabase.tblStockFReorderQty.AsInteger = -1) then
    begin
     PrintBand:=False;
     Exit;
    end;

  if (Not ShowAll) And (((dmDatabase.tblStockFQtyOnHand.Asinteger - dmDatabase.tblStockFReorderQty.AsInteger) >= 0) or (dmDatabase.tblStockFReorderQty.AsInteger = 0)) Then
  begin
    PrintBand:=False;
    Exit;
  end;
  // Added by sylvain
  with dmDatabase.qGen do
  begin
    active:=False;
    sql.clear;
    sql.Add('Select sum(Fqty) as fSum1 '+
            ' from BackOrd where WStockID='+
            dmDatabase.tblStockWStockID.AsString);
    active:=True;
    Ototal:=FieldByName('FSum1').AsFloat;
    active:=False;
  end;
  qrBackOrder.Caption:=FloatToStrT(Ototal, ffFixed, 18, 2);
//  vTotal:=vTotal + dmDatabase.tblStockFQtyOnHand.value * dmDatabase.tblStockFUnitAveCost.Value;
  vTotal:=vTotal + dmDatabase.tblStockFQtyOnHand.value ;
 // if AddUnposted then
  //  begin
     Ship := 0 ;
     Order := 0 ;
     aStockInvoicedItem := StockInvoicedCollection.StockItemOnStockId(dmDatabase.tblStockWStockID.AsInteger) ;
     if  aStockInvoicedItem <> nil then
          aStockInvoicedItem.TotalAfterDocumentProcess(Ship,Order);
    QRLInvQtyOnHand.caption := FloatToStrT(-Ship, ffFixed, 18, 2);


 if ShowOrderQuote then
    begin
   //  Ship := 0 ;
    // Order := 0 ;
     Ship2 := 0 ;
     Order2 := 0 ;
    if  aStockInvoicedItem <> nil then
          begin
          //aStockInvoicedItem.TotalAfterDocumentProcess(Ship,Order);
          aStockInvoicedItem.TotalQuotePurchasenote(Ship2,Order2);
          end;
     QRUnitCost.caption := FloatToStrT(-Ship2, ffFixed, 18, 2);
     QRTotalQuotePurchase.Caption := FloatToStrT(((dmDatabase.tblStockFQtyOnHand.AsFloat)+(Ship+Ship2)), ffFixed, 18, 2) ;
    end
  else
  QRUnitCost.caption := FloatToStrT(dmDatabase.tblStockFUnitCost.AsFloat, ffFixed, 18, 2);

  if AddUnposted then
    begin
      QRDiverence.Caption:=FloatToStrT((dmDatabase.tblStockFReorderQty.AsFloat- dmDatabase.tblStockFQtyOnHand.AsFloat)-Ship, ffFixed, 18, 2)  ;
    end else
    begin
      QRDiverence.Caption:=FloatToStrT((dmDatabase.tblStockFReorderQty.AsFloat- dmDatabase.tblStockFQtyOnHand.AsFloat), ffFixed, 18, 2);
    end;
  //  end ;

end;

procedure TqrStockReOrder.GeneralFloatPrint(sender: TObject;
  var Value: String);
begin

  Value:=FloatToStrT(Str2Float(Value), ffFixed, 18, 2);
end;

procedure TqrStockReOrder.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   StockInvoicedCollection.Clear ;
   ReadStockFromUnposted(StockInvoicedCollection);
   if  not ShowExtraColumns then
     begin
       lblStockVal.Enabled := false ;
       QRLabel4.Enabled := false ;
       QRLabel6.Enabled := false ;
       QRLInvQtyOnHand.Enabled := false ;
       qrBackOrder.Enabled := false ;
       QRUnitCost.Enabled := false ;
       ARExtra.Enabled := false ;
       QRTotalQuotePurchase.Enabled := false ;
     end;
   if  ShowOrderQuote then
     begin
       QRLabel6.Caption := 'Purchase-Order' ;
       QRLabel6.Enabled := true ;
       QRUnitCost.Enabled := true ;
       ARExtra.Enabled := true ;
       QRTotalQuotePurchase.Enabled := true ;
     end;


end;

constructor TqrStockReOrder.Create(AOwner: TComponent);
begin
  inherited;
  StockInvoicedCollection := TStockInvoicedCollection.Create(self,TStockInvoicedItem) ;
end;

destructor TqrStockReOrder.Destroy;
begin
  StockInvoicedCollection.free ;
  inherited;
end;

procedure TqrStockReOrder.dblblQtyOnHandPrint(sender: TObject;
  var Value: String);
  Var
   Ship,Order : Double ;
   aStockInvoicedItem : TStockInvoicedItem ;
begin
  if AddUnposted then
    begin
     Ship := 0 ;
     Order := 0 ;
     aStockInvoicedItem := StockInvoicedCollection.StockItemOnStockId(dmDatabase.tblStockWStockID.AsInteger) ;
     if  aStockInvoicedItem <> nil then
          aStockInvoicedItem.TotalAfterDocumentProcess(Ship,Order);

     Value:=FloatToStrT(dmDatabase.tblStockFQtyOnHand.AsFloat+Ship, ffFixed, 18, 2);
    end else
     GeneralFloatPrint(sender,Value) ;

end;

procedure TqrStockReOrder.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand := true ;
 QRLStockGroup.Caption := '' ;
 if ReportGroup = 1 then
  begin
  if dmDatabase.tblGroups.Locate('WGroupID',dmDatabase.tblStockWReportingGroup1ID.AsInteger,[]) then
     QRLStockGroup.Caption := dmDatabase.tblGroupsSDescription.AsString ;
   end else
  if ReportGroup = 2 then
   begin
    if dmDatabase.tblGroups.Locate('WGroupID',dmDatabase.tblStockWReportingGroup2ID.AsInteger,[]) then
       QRLStockGroup.Caption := dmDatabase.tblGroupsSDescription.AsString ;
   end;

end;

procedure TqrStockReOrder.QuickRepAfterPrint(Sender: TObject);
begin
   StockInvoicedCollection.Clear ;
end;

end.
