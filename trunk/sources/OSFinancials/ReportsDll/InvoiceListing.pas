(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit InvoiceListing;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrInvoiceListing = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    Main: TQRLabel;
    QRDBText2: TQRDBText;
    Status: TQRLabel;
    ExTotal: TQRLabel;
    TaxTotal: TQRLabel;
    IncTotal: TQRLabel;
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    GExclTotal: TQRLabel;
    GTaxTotal: TQRLabel;
    GInclTotal: TQRLabel;
    QRShape1: TQRShape;
    Dates: TQRLabel;
    QRRepGroup: TQRGroup;
    qrGrFooter: TQRBand;
    QRDBgrID: TQRDBText;
    qrGrTotalLbl: TQRLabel;
    QRShape2: TQRShape;
    qrAccDescription: TQRLabel;
    qrGrExcTot: TQRLabel;
    qrGrTaxTot: TQRLabel;
    qrGrInclTot: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBgrIDPrint(sender: TObject; var Value: String);
    procedure QRRepGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGrFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrInvoiceListing: TqrInvoiceListing;
  GrpGrandExclTotal,
  GrpGrandInclTotal,
  GrpGrandTaxTotal,
  GrandInclTotal,
  GrandExclTotal,
  GrandtaxTotal   : Real;

implementation

uses Database, GlobalFunctions,Main, InvoiceListingOptions, TcVariables,
  DatabaseAccess;

{$R *.DFM}

procedure TqrInvoiceListing.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if fmInvoiceListingOptions.cboxUsePeriods.Checked then
    Dates.Caption:=DateRange(fmInvoiceListingOptions.dbedtFromDate.Date ,
             fmInvoiceListingOptions.dbedtToDate.Date)
  else
    Dates.Caption:='';
  if fmInvoiceListingOptions.CheckBox2.Checked then
  begin
    QRLabel3.Caption := 'Address'
  end
  else
    QRLabel3.Caption := 'Debtor'
//  QRLabel4.Caption := dmDatabase.tblSysVarsSACCOUNTReportName1.Value;
//  QRLabel7.Caption := dmDatabase.tblSysVarsSACCOUNTReportName2.Value;
end;

procedure TqrInvoiceListing.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

var
  InclTotal, ExclTotal, fTaxTotal : Real;
begin
  Main.Caption := '';
  qrAccDescription.Caption:='';
  qrAccDescription.Visible := True;
  if fmInvoiceListingOptions.CheckBox2.Checked then
  begin
   qrAccDescription.SendToBack;
   Main.Caption := _ReadDescription(dmDatabase.tblDocHeaderWPostal1ID.AsInteger)
             + ' '+ _ReadDescription(dmDatabase.tblDocHeaderWPostal3ID.AsInteger) ;
  end
  else
  if dmDatabase.tblAccount.Locate('WAccountID', dmDatabase.tblDocHeaderWAccountID.Value, []) then
  begin
    Main.Caption := dmDatabase.tblAccountSACCOUNTCODE.Text;
    qrAccDescription.Caption:=dmDatabase.tblAccountSDescription.Value;
  end;
  Status.Caption := '';
  // todo : Translations
  if idDocType in [14,15] then begin
//    Status.Caption := 'Not Confirmed'
    if dmDatabase.tblDocHeaderBRepeating.Value =1then
      Status.Caption := 'Confirmed';
  end
  else begin
    if dmDatabase.tblDocHeaderBPosted.Value =1then Status.Caption := 'Posted';
    if dmDatabase.tblDocHeaderBPrinted.Value =1then
    begin
      if Status.Caption = '' then
        Status.Caption := 'Printed'
      else
        Status.Caption := 'Printed/Posted';
    end;
  end;



  dmDatabase.qrPrnDocLines.Filtered := False;
  dmDatabase.qrPrnDocLines.Filter := 'WDocID = ''' + dmDatabase.tblDocHeaderWDocID.AsString + '''';
  dmDatabase.qrPrnDocLines.Filtered := True;
  dmDatabase.qrPrnDocLines.First;
  InclTotal := 0;
  ExclTotal := 0;
  fTaxTotal := 0;
  while not dmDatabase.qrPrnDocLines.EOF do
  begin
    ExclTotal := ExclTotal + FixAmount(dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
    InclTotal := InclTotal + FixAmount(dmDatabase.qrPrnDocLinesFInclusiveAmt.Value);
    fTaxTotal := fTaxTotal  + FixAmount(dmDatabase.qrPrnDocLinesFTaxAmount.Value);
    dmDatabase.qrPrnDocLines.Next;
  end;
  ExTotal.Caption := FormatFloat(getviewmask(0),ExclTotal );
  IncTotal.Caption := FormatFloat(getviewmask(0),InclTotal );
  TaxTotal.Caption := FormatFloat(getviewmask(0),fTaxTotal );
  GrandExclTotal := GrandExclTotal + ExclTotal;
  GrandInclTotal := GrandInclTotal + InclTotal;
  GrandTaxTotal := GrandTaxTotal + fTaxTotal;
  dmDatabase.qrPrnDocLines.Filtered := False;
  dmDatabase.qrPrnDocLines.Filter := '';
  dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblDocHeaderWPaymentTypeID.Value, []);
  GrpGrandExclTotal := GrpGrandExclTotal + ExclTotal;
  GrpGrandInclTotal := GrpGrandInclTotal + InclTotal;
  GrpGrandTaxTotal := GrpGrandTaxTotal + fTaxTotal;

end;

procedure TqrInvoiceListing.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GExclTotal.Caption := FormatFloat(getviewmask(0),GrandExclTotal );
  GInclTotal.Caption := FormatFloat(getviewmask(0),GrandInclTotal );
  GTaxTotal.Caption := FormatFloat(getviewmask(0),GrandTaxTotal );
end;

procedure TqrInvoiceListing.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mm/yyyy "at" hh:nn:ss ',StrToDateTime(Value));
end;

procedure TqrInvoiceListing.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Case idDocType of
  10:Value:='List of Invoices';
  11:Value:='List of Credit Notes';
  12:Value:='List of Purchases';
  13:Value:='List of Goods Returned';
  14:Value:='List of Quotes';
  15:Value:='List of Orders';
  else
    Value:='List of Invoices';
  end;
end;

procedure TqrInvoiceListing.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  GrandExclTotal := 0;
  GrandInclTotal := 0;
  GrandTaxTotal := 0;
end;

procedure TqrInvoiceListing.QRDBgrIDPrint(sender: TObject;
  var Value: String);
begin
  if QRDBgrID.DataField='WReportingGroup1ID' then
  begin
    dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblDocHeaderWReportingGroup1ID.Value, []);
    if dmDatabase.tblGroupsWGroupID.Value<1 then
      Value :=''
    else
      Value := dmDatabase.tblGroupsSDescription.Value;
  end
  else if QRDBgrID.DataField='WReportingGroup2ID' then
  begin
    dmDatabase.tblGroups.Locate('WGroupID', dmDatabase.tblDocHeaderWReportingGroup2ID.Value, []);
    if dmDatabase.tblGroupsWGroupID.Value<1 then
      Value :=''
    else
      Value := dmDatabase.tblGroupsSDescription.Value;
  end
  else
    Value:='';
  qrGrTotalLbl.Caption:='Group Total';
  if Value<>'' then
    qrGrTotalLbl.Caption:='Total for '+ Value;
end;

procedure TqrInvoiceListing.QRRepGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  GrpGrandExclTotal := 0;
  GrpGrandInclTotal := 0;
  GrpGrandTaxTotal := 0;
end;

procedure TqrInvoiceListing.qrGrFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrGrExcTot.Caption:=FormatFloat(getviewmask(0),GrpGrandExclTotal );
  qrGrTaxTot.Caption:=FormatFloat(getviewmask(0),GrpGrandTaxTotal );
  qrGrInclTot.Caption:=FormatFloat(getviewmask(0),GrpGrandInclTotal );
end;

end.
