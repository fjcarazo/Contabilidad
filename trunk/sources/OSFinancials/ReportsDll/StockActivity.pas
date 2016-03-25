(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockActivity;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,TCVariables,UDMCoreDocData;

type
  TqrStockActivity = class(TQuickRep)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Detail1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLoopBand1: TQRLoopBand;
    qrPeriod1: TQRLabel;
    Qty1: TQRLabel;
    Amnt1: TQRLabel;
    GP1: TQRLabel;
    LQty1: TQRLabel;
    LAmnt1: TQRLabel;
    LGP1: TQRLabel;
    QRLabel11: TQRLabel;
    qrCost: TQRLabel;
    QRLabel12: TQRLabel;
    qrLCost: TQRLabel;
    QRLStockGroup: TQRLabel;
    procedure QRLoopBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Detail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     aLedgerPeriodeCollection : TLedgerPeriodeCollection ;
  public

    // done : Pieter getting the viewmask everytime makes reprots slow.
    // so lets do it only on create ;
    ViewMask0,ViewMask5,ViewMask6 : String ;
    BPrintAll : Boolean ;
    ReportGroup : Integer ;
    aDMCoreDocData : TDMCoreDocData ;
    Function DoPeriodX(PeriodID:Integer):Real;
    destructor Destroy; override;
    constructor Create(AOwner: TComponent); override;
  end;

var
  qrStockActivity: TqrStockActivity;

implementation

uses Database, GlobalFunctions,Databaseaccess,LedgerRoutines, DB;

{$R *.DFM}

Function TqrStockActivity.DoPeriodX(PeriodID:Integer):Real;
var
  tmpQ,
  tempCThisYear,
  tempCLastYear,
  tempQThisYear,
  tempQLastYear,
  tempAThisYear,
  tempALastYear,
  tempGPThisYear,
  tempGPLastYear : Real;
  aLedgerPeriodeItem : TLedgerPeriodeItem ;
begin
  //initialise totals
  tempQThisYear := 0;
  tempQLastYear := 0;
  tempAThisYear := 0;
  tempALastYear := 0;
  tempGPThisYear := 0;
  tempGPLastYear := 0;
  tempCThisYear := 0;
  aLedgerPeriodeItem := aLedgerPeriodeCollection.GetItemFromPeriod(PeriodID+13);
  If aLedgerPeriodeItem = nil then exit ;

 // dmDatabase.tblPeriods.Locate('WPeriodID',PeriodID+13, []);
  aDMCoreDocData.ZQStockTrans.SQL.Text := 'select * from StockTrn where ' + 'WStockID = ''' + dmDatabase.tblStockWStockID.AsString + ''' AND DDate >= ''' + aLedgerPeriodeItem.StartDateString + ''' AND DDate <= ''' + aLedgerPeriodeItem.EndDateString  + ''''
  + ' And   (WDoctypeID=10 Or WDocTypeID=11 or WDocTypeID=13) ' ;
  aDMCoreDocData.ZQStockTrans.open ;
  //dmDatabase.tblStockTrans.Filtered := False;
  //dmDatabase.tblStockTrans.Filter := 'WStockID = ''' + dmDatabase.tblStockWStockID.AsString + ''' AND DDate >= ''' + aLedgerPeriodeItem.StartDateString + ''' AND DDate <= ''' + aLedgerPeriodeItem.EndDateString  + '''';
  //dmDatabase.tblStockTrans.Filter := dmDatabase.tblStockTrans.Filter +
  //      ' And   (WDoctypeID=10 Or WDocTypeID=11 or WDocTypeID=13) ';
  //dmDatabase.tblStockTrans.Filtered := True;
  //dmDatabase.tblStockTrans.First;
  while not aDMCoreDocData.ZQStockTrans.EOF do
  begin
    tmpQ:= - aDMCoreDocData.ZQStockTransFQty.Value;
    tempQThisYear := tempQThisYear + tmpq;
    tempAThisYear := tempAThisYear + aDMCoreDocData.ZQStockTransFSellingPrice.Value * TmpQ;
    tempCThisYear := tempCThisYear + aDMCoreDocData.ZQStockTransFCostPrice.Value * TmpQ;
    tempGPThisYear := tempGPThisYear + (aDMCoreDocData.ZQStockTransFSellingPrice.Value * tmpQ - aDMCoreDocData.ZQStockTransFCostPrice.Value * TmpQ);
    aDMCoreDocData.ZQStockTrans.Next;
  end;

  aLedgerPeriodeItem := aLedgerPeriodeCollection.GetItemFromPeriod(PeriodID);
  If aLedgerPeriodeItem = nil then exit ;

  aDMCoreDocData.ZQStockTrans.SQL.Text := 'select * from StockTrn where ' + 'WStockID = ''' + dmDatabase.tblStockWStockID.AsString + ''' AND DDate >= ''' + aLedgerPeriodeItem.StartDateString + ''' AND DDate <= ''' + aLedgerPeriodeItem.EndDateString  + ''''
  + ' And   (WDoctypeID=10 Or WDocTypeID=11 or WDocTypeID=13) ' ;

  aDMCoreDocData.ZQStockTrans.open ;


 // dmDatabase.tblPeriods.Locate('WPeriodID', PeriodID, []);
{  dmDatabase.tblStockTrans.Filtered := False;
  dmDatabase.tblStockTrans.Filter :=
  dmDatabase.tblStockTrans.Filter := dmDatabase.tblStockTrans.Filter +
         ' And   (WDoctypeID=10 Or WDocTypeID=11 or WDocTypeID=13) ';
  dmDatabase.tblStockTrans.Filtered := True;
  dmDatabase.tblStockTrans.First;  }
  while not aDMCoreDocData.ZQStockTrans.EOF do
  begin
    tmpq:=- aDMCoreDocData.ZQStockTransFQty.Value;
    tempCLastYear :=  tempCLastYear + aDMCoreDocData.ZQStockTransFCostPrice.Value;
    tempQLastYear := tempQLastYear + tmpQ;
    tempALastYear := tempALastYear + aDMCoreDocData.ZQStockTransFSellingPrice.Value * TmpQ;
    tempGPLastYear := tempGPLastYear + (aDMCoreDocData.ZQStockTransFSellingPrice.Value * TmpQ - aDMCoreDocData.ZQStockTransFCostPrice.Value * TmpQ);
    aDMCoreDocData.ZQStockTrans.Next;
  end;
  Qty1.Caption := FormatFloat(ViewMask5,tempQThisYear );
  Amnt1.Caption := FormatFloat(ViewMask0,tempAThisYear );
  if tempAThisYear<>0 then
    tmpQ:=tempGPThisYear*100/tempAThisYear
  else
    tmpQ:=0;
  GP1.Caption := FormatFloat(ViewMask6,TmpQ );
  LQty1.Caption := FormatFloat(ViewMask5,tempQLastYear );
  LAmnt1.Caption := FormatFloat(ViewMask0,tempALastYear );
  if tempALastYear<>0 then
    tmpQ:= 100*tempGPLastYear/tempALastYear
  else
    tmpQ:=0;
  LGP1.Caption := FormatFloat(ViewMask6,TmpQ );
  qrCost.Caption:= FormatFloat(ViewMask0,tempCThisYear );
  qrLCost.Caption := FormatFloat(ViewMask0,tempCLastYear );
  Result := tempQThisYear + tempQLastYear +  tempAThisYear +
     tempALastYear + tempGPThisYear + tempGPLastYear + tempCThisYear;
end;

procedure TqrStockActivity.QRLoopBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tmp:Real;
begin
  if dmDatabase.tblPeriods.Locate('WPeriodID', QRLoopBand1.Count+1, []) then begin
    qrPeriod1.Caption :=FormatDateTime('mmmm ',dmDatabase.tblPeriodsDEndDate.Value);
//    qrPeriod2.Caption :=' to   '+FormatDateTime('dd-mmm ',dmDatabase.tblPeriodsDEndDate.Value);
    tmp := DoPeriodX(QRLoopBand1.Count+1);
    PrintBand := Not (tmp = 0);
  end
  else begin
    PrintBand:=False;
  end;
end;

procedure TqrStockActivity.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 ViewMask0 :=  getviewmask(0) ;
 ViewMask5 :=  getviewmask(5) ;
 ViewMask6 :=  getviewmask(6) ;
 ReadLedgerPeriodes(aLedgerPeriodeCollection);
end;

procedure TqrStockActivity.Detail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 PrintBand := true ;
 if not BPrintAll then
    begin
      dmDatabase.tblStockTrans.Filtered := false ;
      dmDatabase.tblStockTrans.Filter := 'WStockID = ' + QuotedStr(dmDatabase.tblStockWStockID.AsString) +' And   (WDoctypeID=10 Or WDocTypeID=11 or WDocTypeID=13) ';
      dmDatabase.tblStockTrans.Filtered := True ;
      PrintBand := not dmDatabase.tblStockTrans.IsEmpty ;
      if PrintBand then PrintBand := true ;
    end;
end;

procedure TqrStockActivity.QRGroup1BeforePrint(Sender: TQRCustomBand;
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

constructor TqrStockActivity.Create(AOwner: TComponent);
begin
  inherited;
  aLedgerPeriodeCollection := TLedgerPeriodeCollection.Create(self,TLedgerPeriodeItem) ;
  aDMCoreDocData := TDMCoreDocData.Create(nil) ;

end;

destructor TqrStockActivity.Destroy;
begin
   aLedgerPeriodeCollection.free ;
   aDMCoreDocData.free ;
  inherited;
end;

end.
