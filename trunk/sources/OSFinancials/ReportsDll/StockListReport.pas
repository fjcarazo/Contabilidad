(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockListReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrStockListing = class(TQuickRep)
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
    lblSelPrice: TQRLabel;
    lblStockCount: TQRLabel;
    lblStockVal: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    dblblUnit: TQRLabel;
    dblblQtyOnHand: TQRDBText;
    dblblCostPrice: TQRDBText;
    dblblSelPrice1: TQRDBText;
    qrexprStockVal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    qrTotal: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    qrGroupReport: TQRGroup;
    qrLblGroup: TQRLabel;
    qrGroupReportFoot: TQRBand;
    qrgrTotal: TQRLabel;
    qrLblTotalGr: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure dblblQtyOnHandPrint(sender: TObject; var Value: String);
    procedure qrTotalPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGroupReportBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrTotalPrint(sender: TObject; var Value: String);
    procedure qrGroupReportFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure dblblCostPricePrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure dblblSelPrice1Print(sender: TObject; var Value: String);
  private

  public
     ViewMask0,Viewmask7 : String ;
     InclusivePrice : Boolean ;
  end;

var
  qrStockListing: TqrStockListing;
  PriceID : Integer;
implementation

Uses Database, StockListOptions, GlobalFunctions, Main,DatabaseAccess,
  TcVariables, XRoutines;

{$R *.DFM}
Var
  gTotal,
  vTotal:real;

procedure TqrStockListing.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  RZero : Real;
begin
//  AddTxtRprtLine;
  if Not fmStockListOptions.DBcbNilBal.Checked then
  begin
    // Print Band if no zero
    RZero := 0;
    if fmStockListOptions.cboxQtyOnHand.Checked then
      RZero := Abs(dmDatabase.tblStockFQtyOnHand.Value);
    if fmStockListOptions.cboxQtyOnHand.Checked then
      RZero := Abs(dmDatabase.tblStockFQtyOnHand.Value);
    if fmStockListOptions.dbcboxStockCount.Enabled then
    begin
     if fmStockListOptions.dbcboxStockListAveCost.Checked then
         RZero := RZero + Abs(dmDatabase.tblStockFUnitAveCost.Value);
     //
     //if fmStockListOptions.dbcboxStockCount.Enabled then
//         RZero := RZero + Abs(dmDatabase.dmDatabase.tblStock .Value);
     //
     if fmStockListOptions.dbcboxCostPrice.Checked then
         RZero := RZero + Abs(dmDatabase.tblStockFUnitCost.Value);
     //
     //if fmStockListOptions.dbcboxStockValue.Checked then
//         RZero := RZero + Abs(dmDatabase.tblStock .Value);
    end
    else
      RZero:= RZero + Abs (dmDatabase.tblStockFSellingPrice1.Value)+Abs (dmDatabase.tblStockFSellingPrice2.Value)+
           Abs (dmDatabase.tblStockFSellingPrice3.Value);
    if RZero=0 then
    begin
      PrintBand:=False;
      Exit;
    end;
  end;
  if dmDatabase.tblStockWUnitID.AsString <> '' then
  begin
   dblblUnit.Caption := GetDescFromList(GblUnitList,dmDatabase.tblStockWUnitID.AsInteger);
  {  if dmDatabase.tblUnit.Locate('WUnitID', dmDatabase.tblStockWUnitID.AsString, []) then
      dblblUnit.Caption := dmDatabase.tblUnitSDescription.Value
    else
      dblblUnit.Caption := '';  }
  end
  else
    dblblUnit.Caption := '';

  if not fmStockListOptions.CBShowZerostockCount.Checked then
       if Abs(dmDatabase.tblStockFQtyOnHand.Value) = 0 then
          begin
               PrintBand:=False;
               Exit;
          end;

  vTotal:=vTotal + dmDatabase.tblStockFQtyOnHand.value * dmDatabase.tblStockFUnitAveCost.Value;
  gTotal:=gTotal + dmDatabase.tblStockFQtyOnHand.value * dmDatabase.tblStockFUnitAveCost.Value;
  qrexprStockVal.caption :=  FormatFloat(ViewMask0,dmDatabase.tblStockFQtyOnHand.asfloat * dmDatabase.tblStockFUnitAveCost.asfloat);
end;

procedure TqrStockListing.dblblQtyOnHandPrint(sender: TObject;
  var Value: String);
begin

  Value:=FormatFloat(ViewMask7,dmDatabase.tblStockFQtyOnHand.AsFloat );
end;

procedure TqrStockListing.qrTotalPrint(sender: TObject; var Value: String);
begin
  Value:=FormatFloat(ViewMask0,vTotal );
end;

procedure TqrStockListing.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  StartTxtRprt;
ViewMask0 := getviewmask(0) ;
Viewmask7 := getviewmask(7) ;
  vTotal:=0;
  gTotal:=0;
  lblQtyOnHand.Enabled := fmStockListOptions.cboxQtyOnHand.Checked;
  dblblQtyOnHand.Enabled := fmStockListOptions.cboxQtyOnHand.Checked;
  lblCostPrice.Enabled := fmStockListOptions.dbcboxCostPrice.Checked;
  dblblCostPrice.Enabled := fmStockListOptions.dbcboxCostPrice.Checked;
  lblStockCount.Enabled := fmStockListOptions.dbcboxStockCount.Checked;
  lblStockVal.Enabled := fmStockListOptions.dbcboxStockValue.Checked;
  qrTotal.Enabled:=lblStockVal.Enabled;
  qrexprStockVal.Enabled := fmStockListOptions.dbcboxStockValue.Checked;
  QRLabel4.Enabled := fmStockListOptions.dbcboxStockListAveCost.Checked;
  QRDBText2.Enabled := fmStockListOptions.dbcboxStockListAveCost.Checked;
  if PriceID in [2,3,4] then
  begin
    lblSelPrice.Enabled := True;
    dblblSelPrice1.Enabled := True;
    dblblSelPrice1.DataField:='FSellingPrice'+IntToStr(PriceID-1);
  end
  else
  begin
    if PriceID=1 then
    begin
      //'Selling Price 1';
      lblCostPrice.Caption:= DmDatabase.tblsysVarsSSellingPriceName1.Value;
      lblCostPrice.Enabled:=True;
      dblblCostPrice.DataField:='FSellingPrice1';
      dblblCostPrice.Enabled:=True;
      //'Selling Price 2';
      QRLabel4.Caption:=DmDatabase.tblsysVarsSSellingPriceName2.Value;
      QRLabel4.Enabled:=True;
      QRDBText2.DataField:='FSellingPrice2';
      QRDBText2.Enabled:=True;
      //'Selling Price 3';
      lblSelPrice.Caption :=DmDatabase.tblsysVarsSSellingPriceName3.Value;
      dblblSelPrice1.DataField:='FSellingPrice3';
      dblblSelPrice1.Enabled:=True;
    end
    else
    begin
      lblSelPrice.Enabled := False;
      dblblSelPrice1.Enabled := False;
    end;
  end;
  
end;

procedure TqrStockListing.qrGroupReportBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrLblGroup.Caption:='';
  if fmStockListOptions.dbcomboxSequence.ItemIndex in[2,3] then
  begin
    if fmStockListOptions.dbcomboxSequence.ItemIndex=2 then
      qrLblGroup.Caption := GetDescFromList(GblReportGroup1List,dmDatabase.tblStockWReportingGroup1ID.Value);
     // dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblStockWReportingGroup1ID.Value, []);
    if fmStockListOptions.dbcomboxSequence.ItemIndex=3 then
      qrLblGroup.Caption := GetDescFromList(GblReportGroup2List,dmDatabase.tblStockWReportingGroup2ID.Value);
      //dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblStockWReportingGroup2ID.Value, []);
  //  qrLblGroup.Caption := dmDatabase.tblGroupsSDescription.Value;
    qrLblTotalGr.Caption:= 'Total for ' + qrLblGroup.Caption;
  end;
  gTotal:=0;  
end;

procedure TqrStockListing.qrgrTotalPrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatFloat(ViewMask0,gTotal );
end;

procedure TqrStockListing.qrGroupReportFootBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand:=qrGroupReport.Enabled;
end;

procedure TqrStockListing.dblblCostPricePrint(sender: TObject;
  var Value: String);
begin
  Value:=FormatFloat(ViewMask0,Str2Float(Value) );
end;

procedure TqrStockListing.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatFloat(ViewMask0,Str2Float(Value) );
end;

procedure TqrStockListing.dblblSelPrice1Print(sender: TObject;
  var Value: String);
begin
 if InclusivePrice then
   Value:=FormatFloat(ViewMask0, dblblSelPrice1.DataSet.FindField(dblblSelPrice1.DataField).AsFloat * GetTaxRateOnID(dmDatabase.tblStockWOutputTaxID.AsInteger,true))
 else
  Value:=FormatFloat(ViewMask0,Str2Float(Value) );
end;

end.
