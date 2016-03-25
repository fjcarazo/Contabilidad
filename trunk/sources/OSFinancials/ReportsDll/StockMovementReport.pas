(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockMovementReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrStockMovementReport = class(TQuickRep)
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
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    Dates: TQRLabel;
    QRGroup2: TQRGroup;
    qrFootWStockID: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    qrOpenBal: TQRLabel;
    qrTotalStock: TQRLabel;
    Hist: TQRLabel;
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure qrTotalStockPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private

  public
    EDate,SDate     : TDate;
    SPeriodID,EPeriodID : Integer;
    vQty   : Real;
    BUseCurSign : Boolean ;
  end;

var
  qrStockMovementReport: TqrStockMovementReport;

implementation

uses Database, GlobalFunctions, DB, XRoutines;

{$R *.DFM}


Function GetOpeningQty(vDate:Tdate;StockID:Integer):real;
//Added By Sylvain
// This function get the exact qty for one stock itm at before precise Date
Begin
  with dmDatabase do begin
   // Todo : BDEFIX What is this the QGen is set somewhere else ?
   // Then why delegate it
   { qGen.Close;
    qGen.sql.Clear;
    qGen.sql.add(' Select sum(FQty) as Sum1 '+
                 ' From StockTrn '+
                 ' Where WStockID= '+IntToStr(StockID)+
                 ' AND (StockTrn.DDate <:FromDate) AND (WDocTypeID<>16)');
   qGen.ParamByName('FromDate').AsDate:=vDate;
   qGen.Open;     }
   // get Period Movements
   if qGen.locate('WStockID',StockID,[]) then
   Result:=qGen.fieldbyName('Sum1').AsFloat
   else
   Result := 0 ;
   Result:=Result + qryStockMovementFOpeningQty.AsFloat ;
  end;
end;

procedure TqrStockMovementReport.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=TopReportDate(Value);
end;

procedure TqrStockMovementReport.QRDBText7Print(sender: TObject;
  var Value: String);
Var
  tmp: Real;
begin
  tmp := Str2Float(Value);
  Hist.Enabled := True;
  if  dmDatabase.qryStockMovementWDocTypeID.Value<>16 then
  begin
     vQty := vQty + tmp;
     Hist.Enabled := False;
  end;
  Value:=FloatToStrT(tmp, ffFixed, 18, 2);
end;

procedure TqrStockMovementReport.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if dmDatabase.qryStockMovementWSalesmanID.Value=0 then Value:='';
end;

procedure TqrStockMovementReport.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  dmDatabase.tblPeriods.Open;
//  SPeriodID := dmDatabase.tblReportingOptionsDStockMovementFromDate.Value;
//  EPeriodID := dmDatabase.tblReportingOptionsDStockMovementToDate.Value;
//  dmDatabase.tblPeriods.Locate('WPeriodID',SPeriodID , []);
//  SDate:= dmDatabase.tblPeriodsDStartDate.Value;
//  dmDatabase.tblPeriods.Locate('WPeriodID',EPeriodID, []);
//  EDate:= dmDatabase.tblPeriodsDEndDate.Value;
  SDate:= dmDatabase.tblReportingOptions.FieldByName('DStockMovementFromDate').AsDateTime;
  EDate:= dmDatabase.tblReportingOptions.FieldByName('DStockMovementToDate').AsDateTime;
  Dates.Caption:=DateRange(SDate,EDate);
//  dmDatabase.tblPeriods.Close;
end;

procedure TqrStockMovementReport.QRLabel12Print(sender: TObject;
  var Value: String);
begin
    Value := 'Quantity at : '+ DateToStr(SDate);
end;

procedure TqrStockMovementReport.QRLabel11Print(sender: TObject;
  var Value: String);
begin
  Value := 'Total Qty at : '+ DateToStr(EDate);
end;

procedure TqrStockMovementReport.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   vQty:=GetOpeningQty(dmDatabase.qryStockMovementDDate.Value,dmDatabase.qryStockMovementWStockID.Value);
   qrOpenBal.Caption:= FloatToStrT(vQty, ffFixed, 18, 2);
end;

procedure TqrStockMovementReport.QRDBText8Print(sender: TObject;
  var Value: String);
begin

  Value:=FloatToStrT(Str2Float(Value), ffFixed, 18, 2);
  if BUseCurSign then
     Value := CurrencyString + ' ' + Value ;
end;

procedure TqrStockMovementReport.qrTotalStockPrint(sender: TObject;
  var Value: String);
begin
  Value:=FloatToStrT(vQty, ffFixed, 18, 2);
end;

procedure TqrStockMovementReport.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 BUseCurSign := ReadReportOp('BUseCurSign',false).AsBoolean ;
   dmDatabase.qGen.Close;
    dmDatabase.qGen.sql.Clear;
    dmDatabase.qGen.sql.add(' Select WStockID,sum(FQty) as Sum1 '+
                 ' From StockTrn '+
                 'where (StockTrn.DDate <:FromDate) AND (WDocTypeID<>16)'
                 + 'Group by WStockID');
   dmDatabase.qGen.Params[0].AsDate:=dmDatabase.qryStockMovement.ParamByName('FromDate').AsDate;
   dmDatabase.qGen.Open;
end;

procedure TqrStockMovementReport.QuickRepAfterPrint(Sender: TObject);
begin
    dmDatabase.qGen.Close;
end;

end.
