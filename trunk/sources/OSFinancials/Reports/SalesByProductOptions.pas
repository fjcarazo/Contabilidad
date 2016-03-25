(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByProductOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls;

type
  TfmSalesByProductOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedtFromProduct: TDBEdit;
    dbedtToProduct: TDBEdit;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
    dbcomboxSequence: TDBComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbShowDetails: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
    BUseCustomer :Boolean ;
  end;

var
  fmSalesByProductOptions: TfmSalesByProductOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, SalesByProductReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

procedure TfmSalesByProductOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');


  ButtonPanel.Color := fmMain.ControlPanel.Color;
  if Not BUseCustomer then
   Caption := GetTextLang(1077){'Purchases By Product Options'}
  else
   Caption := GetTextLang(385){'Sales By Product Options'};
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(213){'Stock Code'});
  dbcomboxSequence.Items.Add(GetTextLang(1058){'Stock Description'});
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  LoadPrintOutModes(cbDestination);
  LoadReoprtOp;
  cbDestination.SetFocus;
//  dbcomboxSequence.SetFocus;
end;

procedure TfmSalesByProductOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(441){'Do you want to continue reporting ?'}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmSalesByProductOptions.btnOkClick(Sender: TObject);
begin
 ButtonPanel.Enabled := false ;
 try
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;

  qrSalesByProduct := TqrSalesByProduct.Create(Self);
  try


  dmDatabase.qrySalesByProduct.SQL.Clear ;
  dmDatabase.qrySalesByProduct.SQL.Add('SELECT distinct SSTOCKCODE, StockTrn.DDate, StockTrn.WStockTransactionID,Stock.SDescription, SDocNo, StockTrn.FSellingPrice, StockTrn.FCostPrice, ' +
  ' stock.WstockTypeId,Stock.WReportingGroup1ID,Stock.WReportingGroup2ID, StockTrn.FQty , DocHead.WTypeID' +
  ' FROM Stock, StockTrn, DocHead WHERE (SSTOCKCODE >= :FromCode) AND (SSTOCKCODE <= :ToCode) AND (Stock.WStockID = StockTrn.WStockID) ' +
  ' AND (DocHead.WDocID = StockTrn.WDocID)');
  dmDatabase.qrySalesByProduct.SQL.Add(' and cast(dochead.DDate as date) >= '  +  TDatabaseTableRoutines.GetFirebirdsSqlForDate(dmDatabase.tblReportingOptions.FieldByName('DSalesByProdFromDate').AsDateTime)
   + ' AND cast(dochead.DDate as date) <= '  + TDatabaseTableRoutines.GetFirebirdsSqlForDate(dmDatabase.tblReportingOptions.FieldByName('DSalesByProdToDate').AsDateTime)) ;


     if BUseCustomer then
  begin
    dmDatabase.qrySalesByProduct.SQL.Add('and  dochead.WTypeID in (10,11)');
  end
  else
  begin
    dmDatabase.qrySalesByProduct.SQL.Add('and  dochead.WTypeID in (12,13)');
  end;





  // dmDatabase.qrySalesByProduct.SQL.Add('ORDER BY SSTOCKCODE, StockTrn.DDate, SDocNo');
   case dbcomboxSequence.ItemIndex of
  -1,0,1 : begin
             qrSalesByProduct.QRGroup1.Expression := 'qrySalesByProduct.SSTOCKCODE' ;
             dmDatabase.qrySalesByProduct.SQL.Add('ORDER BY SSTOCKCODE, StockTrn.DDate, SDocNo');
             qrSalesByProduct.QRDBText7.Enabled := False ;
           end;
  2 : begin
       qrSalesByProduct.QRGroup1.Expression := 'qrySalesByProduct.WREPORTINGGROUP1ID' ;
       dmDatabase.qrySalesByProduct.SQL.Add('ORDER BY WReportingGroup1ID,SSTOCKCODE, StockTrn.DDate, SDocNo');
       qrSalesByProduct.QRDBText7.Enabled := true ;
      end;
  3 : begin
        qrSalesByProduct.QRGroup1.Expression := 'qrySalesByProduct.WREPORTINGGROUP2ID' ;
        dmDatabase.qrySalesByProduct.SQL.Add('ORDER BY WReportingGroup2ID,SSTOCKCODE, StockTrn.DDate, SDocNo');
        qrSalesByProduct.QRDBText7.Enabled := true ;
      end;
  end;


  dmDatabase.tblSysVars.Open;
  dmDatabase.qrySalesByProduct.ParamByName('FromCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SSalesByProdFromProd').AsString;
  dmDatabase.qrySalesByProduct.ParamByName('ToCode').AsString := dmDatabase.tblReportingOptions.FieldByName('SSalesByProdToProd').AsString;
  dmDatabase.qrySalesByProduct.Open;
 // dmDatabase.qrySalesByProduct.Filtered := False;
//  dmDatabase.qrySalesByProduct.Filter := 'DDate >= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesByProdFromDate').AsDateTime) + ''' AND DDate <= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesByProdToDate').AsDateTime) + '''';


  if Not cbShowDetails.Checked then
  begin {Hide All Details and Details-Titles}
    qrSalesByProduct.QRBand2.Height := 0;
  end;
  qrSalesByProduct.BUseCustomer := BUseCustomer;

  PrintReportProcess(cbDestination.ItemIndex,qrSalesByProduct,edtCount.Text);
  finally
   FreeAndNil(qrSalesByProduct);
  end;
  dmDatabase.qrySalesByProduct.Filtered := False;
  dmDatabase.qrySalesByProduct.Filter := '';
  dmDatabase.qrySalesByProduct.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
finally
    ButtonPanel.Enabled := true ;
end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmSalesByProductOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesByProductOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
  if BUseCustomer then
   HtmlShowTopic(199)
  else
   HtmlShowTopic(194);
   key := 0;
  end;
end;

procedure TfmSalesByProductOptions.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    EdtCount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    EdtCount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

procedure TfmSalesByProductOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesByProductOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmSalesByProductOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesByProductOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmSalesByProductOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmSalesByProductOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

procedure TfmSalesByProductOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromProduct.Color := clHighlight;
  dbedtFromProduct.Text  := CallLookup(dbedtFromProduct.Text, 7);
  dbedtFromProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmSalesByProductOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToProduct.Color := clHighlight;
  dbedtToProduct.Text  := CallLookup(dbedtToProduct.Text, 7);
  dbedtToProduct.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
