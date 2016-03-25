(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Labels;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, barcode;


type
  TqrLabelsReport = class(TQuickRep)
    LabelBand: TQRBand;
    qrHGap: TQRStringsBand;
    qrTLabel: TQRMemo;
    qrStkCode: TQRLabel;
    qrDescription: TQRLabel;
    qrPrice: TQRLabel;
    QRBarcode: TQRImage;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure LabelBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure WinControlFormCreate(Sender: TObject);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InitDocLine ;
  private
    FirstLine : Boolean ;
    FCount: Integer;
    FCurrect: Integer;
    procedure SetCount(const Value: Integer);
    procedure SetCurrect(const Value: Integer);

  public
      ABarcode : TBarcode ;
      SellingPrice : Integer ;
      DutchWayOfThings : Boolean ;
      property Count : Integer  read FCount write SetCount;
      property Currect : Integer  read FCurrect write SetCurrect;
  end;

var
  qrLabelsReport: TqrLabelsReport;

implementation

uses Database, GlobalFunctions, Main, TcVariables,QRPrntr,Printers,ComCtrls,
  LabelsReportOptions, XRoutines, DB;

{$R *.DFM}

procedure TqrLabelsReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
FirstLine := true ;
 // check if theres a file if not use default
  DutchWayOfThings := not ReadReportOp('CBViewAllBankState',true).AsBoolean ;
  With dmDatabase do
  begin
   if not dmDatabase.tblLabSpecs.IsEmpty then
   begin
   page.PaperSize :=  Custom ;
   page.Width:=tblLabSpecsFPageWidth.Value;
   page.Length:=tblLabSpecsFPageHeight.Value;
   Page.Columns:=tblLabSpecsWAccross.Value;
   Page.ColumnSpace:=tblLabSpecsFVGap.Value;
   qrHGap.Size.Height:=Str2Int(tblLabSpecsFHGap.AsString);
   Page.LeftMargin:=tblLabSpecsFLeftMargin.Value;
   Page.TopMargin:=tblLabSpecsFTopMargin.Value;
   LabelBand.Size.Height:=Str2Int(tblLabSpecsFHeight.AsString);

   LabelBand.Size.Width:=Str2Int(tblLabSpecsFWidth.AsString);
   qrTLabel.Font.Size := tblLabSpecsWFontSize.AsInteger ;
   end;
   // todo : Pieter Why not ?
   // done : I need the label to be rotated.
   if Not (tblLabSpecsBPortrait.Value =1)then
    Page.Orientation:=poLandscape
   else
    Page.Orientation:=poPortrait;

    if  IDDocType=3 then
    begin
      QRBarcode.Enabled := True;
      qrStkCode.Enabled := True;
      qrDescription.Enabled := True;
      qrPrice.Enabled := True;
      qrDescription.Top := LabelBand.Height - qrDescription.Height - 4;
      QRBarcode.Top := qrStkCode.Top +  qrStkCode.Height + 4;
      QRBarcode.Size.Width := LabelBand.Size.Width-2;
      qrPrice.size.Left := LabelBand.Size.Width  / 2;
      //qrPrice.size.Left := (qrTLabel.Left + qrTLabel.Width) - qrPrice.size.Width ;
    end
    else
    begin
      QRBarcode.Enabled := False;
      qrStkCode.Enabled := False;
      qrDescription.Enabled := False;
      qrPrice.Enabled := False;


    end;
  end;

  dmDatabase.tblSysVars.Open ;
  if dmDatabase.tblSysVarsSReportFontsName.AsString <> '' then
  begin
     qrTLabel.Font.Name := dmDatabase.tblSysVarsSReportFontsName.AsString ;
  end ;

  dmDatabase.tblSysVars.Close ;
if fmLabelsReportOptions.UseDocLines then
   InitDocLine ;
end;

procedure TqrLabelsReport.LabelBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

Procedure AddLine(S:String);
begin
 qrTLabel.Lines.Add(s);
end;

begin
  PrintBand := true ;

  qrTLabel.Lines.Text := '';
  qrStkCode.Caption := '';
  qrDescription.Caption := '';
  if  IDDocType=3 then
  begin
    qrStkCode.Caption := dmDatabase.qGen.FieldByName('SSTOCKCODE').AsString;
    qrDescription.Caption := dmDatabase.qGen.FieldByName('SDescription').AsString;
    qrPrice.Caption :='Price:'+ FloatToStrT(Str2Float(dmDatabase.qGen.FieldByName('FSellingPrice1').AsString), ffFixed, 18, 2) ;
    if Trim(dmDatabase.qGen.FieldByName('SBarCodeNumber').AsString)='' then
      QRBarcode.Enabled := False
    else
    begin
     QRBarcode.Enabled := True;
     if not assigned(ABarcode) then WinControlFormCreate(nil);
     ABarcode.Text := dmDatabase.qGen.FieldByName('SBarCodeNumber').AsString;
     QRBarcode.Picture.Bitmap.Width := ABarcode.Width   ;
     QRBarcode.Picture.Bitmap.Height  := 90  ;
     ABarcode.DrawBarcode(QRBarcode.Picture.Bitmap.canvas);
   {  for i := 0 to 40 do
     begin
     ABarcode.Top := i ;
     ABarcode.DrawBarcode(QRBarcode.Picture.Bitmap.canvas);
     end;
     ABarcode.top := 50 ;
     ABarcode.DrawText(QRBarcode.Picture.Bitmap.canvas);
    }
    end;
  end
  else
  begin
   if DutchWayOfThings then
   begin
      AddLine(dmDatabase.qgen.FieldByName('SDescription').AsString);
      AddLine(dmDatabase.qgen.FieldByName('SPostal1').AsString);
      AddLine(dmDatabase.qgen.FieldByName('SPostalCode').AsString + ' ' + dmDatabase.qgen.FieldByName('SPostal2').AsString);
      AddLine(dmDatabase.qgen.FieldByName('SPostal3').AsString);
      PrintBand := true ;
   end
   else
   begin
     AddLine(dmDatabase.qgen.FieldByName('SDescription').AsString);
     AddLine(dmDatabase.qgen.FieldByName('SPostal1').AsString);
     AddLine(dmDatabase.qgen.FieldByName('SPostal2').AsString);
     AddLine(dmDatabase.qgen.FieldByName('SPostal3').AsString);
     AddLine(dmDatabase.qgen.FieldByName('SPostalCode').AsString);
     PrintBand := true ;
   end;

 end;

end;

procedure TqrLabelsReport.WinControlFormCreate(Sender: TObject);
begin
  ABarcode := TBarcode.Create(self) ;
  ABarcode.CheckSum := false;
  ABarcode.ShowText := true;
  ABarcode.Typ  := bcCode39;
  ABarcode.Modul    := 1;
  ABarcode.Ratio    := 2;
  ABarcode.Angle    := 0;
  ABarcode.Top := 0 ;
  ABarcode.Left := 0 ;
  ABarcode.Height := 50 ;
  FCount := 1 ;
  FCurrect := 0 ;
end;

procedure TqrLabelsReport.SetCount(const Value: Integer);
begin
  FCount := Value;
end;

procedure TqrLabelsReport.SetCurrect(const Value: Integer);
begin
  FCurrect := Value;
end;

procedure TqrLabelsReport.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
 if FirstLine then
  begin
     MoreData := true ;
     FirstLine := false ;
     exit ;
  end;
if fmLabelsReportOptions.UseDocLines then
 begin
 if (dmDatabase.tblDocLine.RecordCount <= 1) and
    (dmDatabase.tblDocLineFQTYSHIPPED.AsInteger <= 1) then
    begin
     MoreData := False ;
     exit ;
    end;

 if  IDDocType = 3 then
 begin
 while (not dmDatabase.tblDocLine.Eof) and (dmDatabase.tblDocLineWLineTypeID.AsInteger = 91) do
       dmDatabase.tblDocLine.Next ;
 MoreData := not dmDatabase.tblDocLine.eof ;
    if FCurrect = Count -1 then
        begin
        FCurrect := 0 ;
        dmDatabase.tblDocLine.Next ;
        MoreData := not dmDatabase.tblDocLine.eof ;
        InitDocLine ;
        end else
        begin
        inc(FCurrect);
        end;

 end else // end doctype 3
 begin
   if FCurrect <> 0 then
     begin
        MoreData := false ;
     end
     else
     begin
        MoreData := true ;
        InitDocLine ;
        inc(FCurrect)
     end;
 end;
 end else
 begin
  MoreData := not dmDatabase.qGen.eof ;
  IF Count > 1 then
  begin
    if FCurrect = Count -1 then
        begin
        FCurrect := 0 ;
        dmDatabase.qGen.Next ;
        MoreData := not dmDatabase.qGen.eof ;
        end else
        begin
         inc(FCurrect);
        end;
   end else
   begin
   dmDatabase.qGen.Next ;
   end;
   MoreData := not dmDatabase.qGen.eof ;
  end;
end;

procedure TqrLabelsReport.InitDocLine;
var
  SqlString : String ;
begin
 while (not dmDatabase.tblDocLine.Eof) and (dmDatabase.tblDocLineWLineTypeID.AsInteger = 91) do
       dmDatabase.tblDocLine.Next ;
 Count := dmDatabase.tblDocLineFQtyShipped.AsInteger ;
    if IDDocType=3 then
    begin
      dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Clear;
      SqlString := ' and WStockID = ' + dmDatabase.tblDocLineWStockID.AsString ;

      dmDatabase.qGen.SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Labels_SelectStock'),[IntToStr(fmLabelsReportOptions.CBSellingPrice.ItemIndex+1),SqlString,IntToStr(fmLabelsReportOptions.CBSellingPrice.ItemIndex+1),SqlString]);

     { dmDatabase.qGen.SQL.Add('select SSTOCKCODE, SBarCodeNumber,SDescription,(FSellingPrice'+IntToStr(SellingPrice+1)+' * 1 + (Frate / 100)) as FSellingPrice1' +
                 ' From Stock left join Tax on WOutputTaxId = WAccountId ' +
                 ' Where WStockID = ' + dmDatabase.tblDocLineWStockID.AsString );  }
      dmDatabase.qGen.Open;
    end
    else
    begin
       dmDatabase.qGen.Close;
      dmDatabase.qGen.SQL.Clear;
      If IDDocType=1 then
        dmDatabase.qGen.SQL.Add('Select Account.SDescription , Debtor.SPostal1 , Debtor.SPostal2, '+
                 ' Debtor.Spostal3 , Debtor.SpostalCode ,'+
                 ' Account.SDescription, Account.WAccountID '+
                 ' From Account,Debtor '+
                 ' where  Debtor.WAccountID = Account.WAccountID and Account.WAccountID=' +dmDatabase.tblDocHeaderWAccountID.AsString)
      else
        dmDatabase.qGen.SQL.Add('Select Account.SDescription , Creditor.SPostal1 , Creditor.SPostal2, '+
                 ' Creditor.Spostal3 , Creditor.SpostalCode ,'+
                 ' Account.SDescription, Account.WAccountID '+
                 ' From Account,Creditor '+
                 ' where  Creditor.WAccountID = Account.WAccountID and Account.WAccountID=' +dmDatabase.tblDocHeaderWAccountID.AsString);

      dmDatabase.qGen.Open;
    end;

end;

end.
