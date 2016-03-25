(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DocumentsReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, DB,Forms, Quickrpt, QRCtrls, QREXTRA, qrprntr, Dialogs;

type
  TqrPrintDocuments = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrlDel4: TQRLabel;
    qrlDel3: TQRLabel;
    qrlDel2: TQRLabel;
    qrlDel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrlMessage1: TQRLabel;
    qrlMessage2: TQRLabel;
    qrlMessage3: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRExpr2: TQRExpr;
    qrlUnit: TQRLabel;
    qrlStockCode: TQRLabel;
    qrlDescription: TQRLabel;
    QRBand4: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape5: TQRShape;
    QRShape1: TQRShape;
    qrlExclAmount: TQRLabel;
    qrlTaxAmount: TQRLabel;
    qrlIncAmount: TQRLabel;
    LblComment: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qrlAccountNo: TQRLabel;
    QRDBText16: TQRDBText;
    LblPostal1: TQRLabel;
    lblPostal2: TQRLabel;
    lblPostal3: TQRLabel;
    lblPostalCode: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel38: TQRLabel;
    QRBand5: TQRBand;
    qrGroupHeads: TQRGroup;
    qrGroupsFoot: TQRBand;
    qrGrDescr: TQRLabel;
    qrGrlUnit: TQRLabel;
    QRLabel42: TQRLabel;
    qrExclAmt: TQRLabel;
    qrInclAmt: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrlGRUnit: TQRLabel;
    qrLGRTaxAmt: TQRLabel;
    TaxRef: TQRLabel;
    QrCompPicture: TQRDBImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure LblCommentPrint(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure qrlStockCodePrint(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGroupHeadsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGroupsFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel42Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    BPrintLogo:Boolean;

  public
     
  end;

var
  qrPrintDocuments: TqrPrintDocuments;
  _GrQty    ,
  _GrPrice  ,
  _GrExlAmt ,
  _GrTaxAmt ,
  _GrIncAmt ,
  IncTotal  ,
  ExclTotal     : Real;


implementation

Uses
  Database,Main, InvoiceHistory, GlobalFunctions, LanguageChoice,
  PrePrinted, TcVariables, DatabaseAccess, XRoutines, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

procedure TqrPrintDocuments.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  dmdatabase.tblSysVars.Open;
  QrCompPicture.Enabled := ReadReportOp('BUseCompPicLogo',False).AsBoolean ;
  BPrintLogo:=dmDatabase.tblSysVarsBUnitsExist.Value = 1;
  QRBand3.Enabled:=False;// to be printed only on last page;
  QRBand5.Height:=0;// No thing in this band
  if idDocType=19 then
  begin // Print Delivery Note using Plain invoice
    QRLabel6.Enabled:=False;
    QRLabel8.Enabled:=False;
    QRLabel9.Enabled:=False;
    QRLabel10.Enabled:=False;
    QRLabel11.Enabled:=False;
    QRLabel12.Enabled:=False;
    QRLabel23.Enabled:=False;
    QRLabel35.Enabled:=False;
    qrlExclAmount.Enabled:=False;
    qrlTaxAmount.Enabled:=False;
    qrlIncAmount.Enabled:=False;
    QRShape1.Enabled:=False;
    QRDBText26.Enabled:=False;
    QRExpr2.Enabled:=False;
    QRDBText25.Enabled:=False;
    QRLabel38.Enabled:=False;
    QRDBText12.Enabled:=False;
    QRDBText24.Enabled:=False;
    qrlUnit.Left := 370;
    QRLabel5.Left := 370;
    QRDBText22.Left := 432;
    QRLabel4.Left := 432 ;
  end;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Locate('WAccountID', dmDatabase.tblDocHeaderWAccountID.Value, []);
  qrlAccountNo.Caption:=dmDatabase.tblAccountSMAINACCOUNTCODE.Text;
  if dmDatabase.tblAccountSSUBACCOUNTCODE.Value<>'' then
    qrlAccountNo.Caption:=qrlAccountNo.Caption+dmDatabase.tblAccountSSUBACCOUNTCODE.Value;
  //
  TaxRef.Caption:='';
  if dmDatabase.tblAccountWaccountTypeID.Value=1 then
  begin
    dmDatabase.tbldebtor.Open;
    dmDatabase.tbldebtor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]);
    TaxRef.Caption := dmDatabase.tbldebtorSReference.Value;
    dmDatabase.tbldebtor.Close;
  end
  else
  if dmDatabase.tblAccountWaccountTypeID.Value=2 then
  begin
    dmDatabase.tblCreditor.Open;
    dmDatabase.tblCreditor.Locate('WAccountID',dmDatabase.tblAccountWAccountID.Value,[]);
    TaxRef.Caption := dmDatabase.tblCreditorSReference.Value;
    dmDatabase.tblCreditor.Close;
  end;
  //
  lblPostal1.Caption := _ReadDescription(dmDatabase.tblDocHeaderWPostal1ID.AsInteger);
  lblPostal2.Caption := _ReadDescription(dmDatabase.tblDocHeaderWPostal2ID.AsInteger);
  lblPostal3.Caption := _ReadDescription(dmDatabase.tblDocHeaderWPostal3ID.AsInteger);

  lblPostalCode.Caption := _ReadDescription(dmDatabase.tblDocHeaderWPostalCodeID.AsInteger);
  qrlDel1.Caption := _ReadDescription(dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger);
  qrlDel2.Caption := _ReadDescription(dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger);
  qrlDel3.Caption := _ReadDescription(dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger);
  qrlDel4.Caption := _ReadDescription(dmDatabase.tblDocHeaderWDelCodeID.AsInteger);
end;

procedure TqrPrintDocuments.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Close;
end;

procedure TqrPrintDocuments.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlMessage1.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage1ID.AsInteger);
  qrlMessage2.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage2ID.AsInteger);
  qrlMessage3.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage3ID.AsInteger);
  qrlExclAmount.Caption := FloatToStrT(ExclTotal, ffFixed, 18, -1);
  qrlTaxAmount.Caption := FloatToStrT(IncTotal - ExclTotal, ffFixed, 18, -1);
  qrlIncAmount.Caption := FloatToStrT(IncTotal, ffFixed, 18, -1);
end;

procedure TqrPrintDocuments.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  dmDatabase.tblSysVars.Close;
end;

procedure TqrPrintDocuments.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if  dmDatabase.tblStock.Locate('WStockID', dmDatabase.qrPrnDocLinesWStockID.Value, []) then
    begin
      qrlStockCode.Caption := dmDatabase.tblStockSSTOCKCODE.Value;
      dmDatabase.tblUnit.Locate('WUnitID', dmDatabase.tblStockWUnitID.Value, []);
      qrlUnit.Caption := dmDatabase.tblUnitSDescription.Value;
      qrGrlUnit.caption:= dmDatabase.tblUnitSDescription.Value;
    end
    else
    begin
      qrlUnit.Caption := '';
      qrlStockCode.Caption := DMTCCoreLink.ReadDescription(dmDatabase.qrPrnDocLinesWStockID.AsInteger);
    end;
    LblComment.Caption := _ReadDescription(dmDatabase.qrPrnDocLinesWDescriptionID.AsInteger);
    qrlDescription.Caption := Copy(LblComment.Caption,1,35); ;

    IncTotal := IncTotal + FixAmount(dmDatabase.qrPrnDocLinesFInclusiveAmt.Value);
    ExclTotal := ExclTotal + FixAmount( dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
    _GrExlAmt := _GrExlAmt + FixAmount(dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
    _GrIncAmt := _GrIncAmt + FixAmount(dmDatabase.qrPrnDocLinesFInclusiveAmt.Value);
    _GrQty    := _GrQty + dmDatabase.qrPrnDocLinesFQtyShipped.Value;
    _GrTaxAmt := _GrTaxAmt + FixAmount(dmDatabase.qrPrnDocLinesFTaxAmount.Value);
end;



procedure TqrPrintDocuments.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRBand3.Enabled:=True;// to be printed only on last page;
end;

procedure TqrPrintDocuments.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if dmDatabase.qrPrnDocLinesWLineTypeId.Value=91 then
  begin
    Value:='';
    LblComment.BringToFront;
  end
  else
  begin
    LblComment.Caption:='';
    LblComment.SendToBack;
    
  end;
  if DocModel=52 then Value:='';

end;

procedure TqrPrintDocuments.LblCommentPrint(sender: TObject;
  var Value: String);
begin
  if dmDatabase.qrPrnDocLinesWLineTypeId.Value<>91 then
  begin
    Value:='';
    LblComment.SendToBack;
  end
end;

procedure TqrPrintDocuments.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if DocModel=52 then Value:='';
end;

procedure TqrPrintDocuments.qrlStockCodePrint(sender: TObject;
  var Value: String);
begin
  if dmDatabase.qrPrnDocLinesWLineTypeId.Value=91 then
  begin
    Value:='';
    LblComment.BringToFront;
  end
  else
  begin
    LblComment.Caption:='';
    LblComment.SendToBack;
  end;
end;

procedure TqrPrintDocuments.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  Value:=GetDocHeadingMes(idDocType);

end;

procedure TqrPrintDocuments.QRLabel38Print(sender: TObject;
  var Value: String);
begin
 value:= FloatToStrT(Str2Float(dmDatabase.tblDocHeaderFInvoiceDiscount.AsString), ffFixed, 18, 2) ;
end;

procedure TqrPrintDocuments.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  Case idDocType of
  11:begin
       Value :=GetTextLang(1145)+':';//'Invoice Address:';
       QRLabel31.Caption:=GetTextLang(1146)// 'Credit Note Accepted';
     end;
  12:begin
       Value :=GetTextLang(1144)+':';//'Supplier Address:';
       QRLabel31.Caption:=GetTextLang(1147)//'GRV Accepted';
     end;
  13:begin
       Value :=GetTextLang(1144)+':';//'Supplier Address:';
       QRLabel31.Caption:=GetTextLang(1133)//'Invoice Accepted';
     end;
  14:begin
       Value :=GetTextLang(1145)+':';//'Invoice Address:';
       QRLabel31.Caption:=GetTextLang(1148)//'Quote Accepted';
     end;
  15:begin
       Value :=GetTextLang(1145)+':';// 'Invoice Address:';
       QRLabel31.Caption:=GetTextLang(1149)//'Order Accepted';
     end;
  19:begin
       Value := GetTextLang(1145)+':';// 'Delivery Address:';
       QRLabel31.Caption:=GetTextLang(1150)//'Delivery note Accepted';
     end;
  else
    Value:=GetTextLang(1145)+':';//'Invoice Address:';
     QRLabel31.Caption:=GetTextLang(1133)//'Invoice Accepted';
  end;
end;

procedure TqrPrintDocuments.QRLabel2Print(sender: TObject;
  var Value: String);
begin
  if DocModel=52 then
    Value := GetTextLang(1143)//'Category'
  else if DocModel=54 then begin
    Value := GetTextLang(1142);// 'Stock items Description ';
    QRLabel3.Enabled:=False;
  end
  else
    Value := GetTextLang(213);//'Stock Code';
end;

procedure TqrPrintDocuments.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  IncTotal := 0;
  ExclTotal := 0;
  QRDBText22.Mask := GetViewMask(1);
  if (idDocType=19) And (DocModel = 52 ) then
    DocModel:= 51; 
  Case DocModel of
  53:begin
      qrGroupsFoot.Height:=0;
      qrPrintDocuments.Page.PaperSize:=qrPrePrinted.Page.PaperSize;
      qrPrintDocuments.Page.Length:=283;
      qrPrintDocuments.Tag := 0;
     end;
  54:Begin
       qrGroupsFoot.Height:=19;
       QRBand2.Height:=0;
       qrGroupHeads.Expression:='qrPrnDocLines.WReportingGroup1ID + qrPrnDocLines.WReportingGroup1ID';
       qrPrintDocuments.Tag := 0;
     end
  else
     qrGroupsFoot.Height:=0;
     qrGroupHeads.Expression:='';
     qrPrintDocuments.Tag := 11; {Force A4}     
  end;

end;

procedure TqrPrintDocuments.qrGroupHeadsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  _GrExlAmt := 0;
  _GrIncAmt := 0;
  _GrQty := 0;
  _GrTaxAmt :=0;  
end;

procedure TqrPrintDocuments.qrGroupsFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tmp:String;
  Level : Integer ;
begin
  tmp:='';
  Level := 0 ;
  if (dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsInteger<>0) then
  tmp := TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsInteger,Level);
  Level := 0 ;
  if (dmDatabase.qrPrnDocLinesWReportingGroup2ID.AsInteger<>0) then
    if TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsInteger,Level) <> '' then
      begin
      Level := 0 ;
      if tmp='' then
        tmp := TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsInteger,Level) else
        tmp := tmp + '/' + TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsInteger,Level) ;
      end;
   qrGrDescr.caption:=tmp;
   qrExclAmt.Caption := FloatToStrT(_GrExlAmt, ffFixed, 18, 2);
   qrInclAmt.Caption := FloatToStrT(_GrIncAmt, ffFixed, 18, 2);
   qrlGRUnit.Caption := FloatToStrT(_GrQty, ffFixed, 18, 2);
   qrLGRTaxAmt.Caption := FloatToStrT(_GrTaxAmt, ffFixed, 18, 2);
end;

procedure TqrPrintDocuments.QRLabel42Print(sender: TObject;
  var Value: String);
begin
  QRLabel38Print(sender,Value);
end;

procedure TqrPrintDocuments.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if BPrintLogo=False then
    Value:='';
end;

end.
