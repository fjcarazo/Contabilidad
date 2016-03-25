(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit PrePrinted;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, QREXTRA, qrprntr, Dialogs;

type
  TqrPrePrinted = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    qrlDel4: TQRLabel;
    qrlDel3: TQRLabel;
    qrlDel2: TQRLabel;
    qrlDel1: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRExpr2: TQRExpr;
    qrlUnit: TQRLabel;
    qrlStockCode: TQRLabel;
    qrlDescription: TQRLabel;
    QRBand4: TQRBand;
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
    LblComment: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText16: TQRDBText;
    LblPostal1: TQRLabel;
    lblPostal2: TQRLabel;
    lblPostal3: TQRLabel;
    lblPostalCode: TQRLabel;
    QRLabel2: TQRLabel;
    qrlAccountNo: TQRLabel;
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
    qrlExclAmount: TQRLabel;
    qrlTaxAmount: TQRLabel;
    qrlIncAmount: TQRLabel;
    QRLabelT: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel38: TQRLabel;
    QRShape1: TQRShape;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
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
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure QRLabel38Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrGroupsFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrGroupHeadsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel42Print(sender: TObject; var Value: String);
    procedure qrGroupsFootAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    BPrintLogo:Boolean;
  public
  end;

var
  qrPrePrinted: TqrPrePrinted;
  _GrQty    ,
  _GrPrice  ,
  _GrExlAmt ,
  _GrTaxAmt ,
  _GrIncAmt ,
  IncTotal,
  ExclTotal     : Real;

implementation

Uses
  Database,Main, InvoiceHistory, GlobalFunctions, LanguageChoice,
  TcVariables, DatabaseAccess, XRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TqrPrePrinted.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  dmDatabase.tblSysVars.Open;
  QrCompPicture.Enabled := ReadReportOp('BUseCompPicLogo',False).AsBoolean ;
  BPrintLogo:=dmDatabase.tblSysVarsBUnitsExist.Value=1;
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
//    QRLabel35.Enabled:=False;
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
  end;
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
  lblPostal1.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWPostal1ID.AsInteger);
  lblPostal2.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWPostal2ID.AsInteger);
  lblPostal3.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWPostal3ID.AsInteger);
  lblPostalCode.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWPostalCodeID.AsInteger);
  qrlDel1.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWDelAddress1ID.AsInteger);
  qrlDel2.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger);

  qrlDel3.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWDelAddress3ID.AsInteger);
  qrlDel4.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWDelCodeID.AsInteger);
  qrlDel2.Caption :=  _ReadDescription(dmDatabase.tblDocHeaderWDelAddress2ID.AsInteger);
end;

procedure TqrPrePrinted.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Close;
end;

procedure TqrPrePrinted.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlMessage1.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage1ID.AsInteger);
   qrlMessage2.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage2ID.AsInteger);
   qrlMessage3.Caption := _ReadDescription(dmDatabase.tblDocHeaderWMessage3ID.AsInteger);
  qrlExclAmount.Caption := FloatToStrT(ExclTotal, ffFixed, 18, -1);
  qrlTaxAmount.Caption := FloatToStrT(IncTotal - ExclTotal, ffFixed, 18, -1);
  qrlIncAmount.Caption := FloatToStrT(IncTotal, ffFixed, 18, -1);
end;

procedure TqrPrePrinted.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  dmDatabase.tblSysVars.Close;
end;

procedure TqrPrePrinted.QRBand2BeforePrint(Sender: TQRCustomBand;
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
    ExclTotal := ExclTotal + FixAmount(dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
    _GrExlAmt := _GrExlAmt + FixAmount(dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
    _GrIncAmt := _GrIncAmt + FixAmount(dmDatabase.qrPrnDocLinesFInclusiveAmt.Value);
    _GrQty    := _GrQty + dmDatabase.qrPrnDocLinesFQtyShipped.Value;
    _GrTaxAmt := _GrTaxAmt + FixAmount(dmDatabase.qrPrnDocLinesFTaxAmount.Value);
  if (dmDatabase.qrPrnDocLinesWLineTypeId.Value=91) AND (DocModel=54) then
  begin
      QRBand2.Height := 17 ;
      qrGroupsFoot.Height := 0;
  end;

end;



procedure TqrPrePrinted.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRBand3.Enabled:=True;// to be printed only on last page;
end;

procedure TqrPrePrinted.QRDBText22Print(sender: TObject;
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

procedure TqrPrePrinted.LblCommentPrint(sender: TObject;
  var Value: String);
begin
  if dmDatabase.qrPrnDocLinesWLineTypeId.Value<>91 then
  begin
    Value:='';
    LblComment.SendToBack;
  end


end;

procedure TqrPrePrinted.QRLabel4Print(sender: TObject;
  var Value: String);
begin
  if DocModel=52 then Value:='';
end;

procedure TqrPrePrinted.qrlStockCodePrint(sender: TObject;
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

procedure TqrPrePrinted.QRLabel2Print(sender: TObject;
  var Value: String);
begin
//  if DocModel=52 then Value:='';
  if DocModel=52 then
    Value := 'Category'
  else if DocModel=54 then begin
    Value := 'Stock items Description ';
    QRLabel3.Enabled:=False;
  end
  else
    Value := 'Stock Code';
end;

procedure TqrPrePrinted.QRLabel13Print(sender: TObject;
  var Value: String);
begin
  if idDocType<>10 then
    Value:=GetDocHeadingMes(idDocType)
  else
    Value:='';
//  Case idDocType of
//  11:Value:=fmLangChoice.getMessage(758);
//  12:Value:=fmLangChoice.getMessage(761);
//  13:Value:=fmLangChoice.getMessage(752);
//  14:Value:=fmLangChoice.getMessage(751);
//  15:Value:=fmLangChoice.getMessage(762);
//  else
//    Value:=fmLangChoice.getMessage(750);
//  end;  
end;

procedure TqrPrePrinted.QRLabel38Print(sender: TObject; var Value: String);
begin
 value:= FloatToStrT(Str2Float(dmDatabase.tblDocHeaderFInvoiceDiscount.AsString), ffFixed, 18, 2) ;
end;

procedure TqrPrePrinted.QRDBText1Print(sender: TObject; var Value: String);
begin
  if BPrintLogo=False then
    Value:='';
end;

procedure TqrPrePrinted.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  IncTotal := 0;
  ExclTotal := 0;
  QRDBText22.Mask := GetViewMask(1);
  Case DocModel of
  54:Begin
       qrGroupsFoot.Height:=19;
       QRBand2.Height:=0;
       qrGroupHeads.Expression:='qrPrnDocLines.WReportingGroup1ID + qrPrnDocLines.WReportingGroup1ID';
     end
  else
     qrGroupsFoot.Height:=0;
     qrGroupHeads.Expression:='';
  end;
//  Page.TopMargin := StrToFloatDef(ReadReportOp('WDocPageMrgTop').AsString,2);
//  Page.LeftMargin :=StrToFloatDef(ReadReportOp('WDocPageMrgLeft').AsString,0);
//  Page.BottomMargin := StrToFloatDef(ReadReportOp('WDocPageMrgBottom').AsString,7);
//  Page.Length := StrToFloatDef(ReadReportOp('WDocPageMrgLength').AsString,216);
end;

procedure TqrPrePrinted.qrGroupsFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tmp:String;
begin
  tmp:='';
  if (dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsString<>'')
   AND dmdatabase.tblGroups.locate('WGroupID',dmDatabase.qrPrnDocLinesWReportingGroup1ID.AsString,[]) then
   if dmdatabase.tblGroupsWGroupID.Value<>0 then
     tmp:=dmdatabase.tblGroupsSDescription.Value;
  if (dmDatabase.qrPrnDocLinesWReportingGroup2ID.AsString<>'')
   AND dmdatabase.tblGroups.locate('WGroupID',dmDatabase.qrPrnDocLinesWReportingGroup2ID.AsString,[]) then
   if tmp='' then
     tmp:=dmdatabase.tblGroupsSDescription.Value
   else
   if dmdatabase.tblGroupsWGroupID.Value<> 0 then
     tmp:=tmp+'/'+dmdatabase.tblGroupsSDescription.Value;
   qrGrDescr.caption:=tmp;
   qrExclAmt.Caption := FloatToStrT(_GrExlAmt, ffFixed, 18, 2);
   qrInclAmt.Caption := FloatToStrT(_GrIncAmt, ffFixed, 18, 2);
   qrlGRUnit.Caption := FloatToStrT(_GrQty, ffFixed, 18, 2);
   qrLGRTaxAmt.Caption := FloatToStrT(_GrTaxAmt, ffFixed, 18, 2);
end;

procedure TqrPrePrinted.qrGroupHeadsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  _GrExlAmt := 0;
  _GrIncAmt := 0;
  _GrQty := 0;
  _GrTaxAmt :=0;

end;

procedure TqrPrePrinted.QRLabel42Print(sender: TObject; var Value: String);
begin
  QRLabel38Print(sender,Value);
end;

procedure TqrPrePrinted.qrGroupsFootAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (DocModel=54) AND (QRBand2.Height<>0) AND (qrGroupsFoot.Height=0) then
  begin
      QRBand2.Height := 0;
      qrGroupsFoot.Height:=19;
  end;
end;

end.
