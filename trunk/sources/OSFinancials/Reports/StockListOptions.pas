(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockListOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ComCtrls, wwdbedit, Wwdotdot,
  Wwdbcomb;

type
  TfmStockListOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcboxSellingPrice: TLabel;
    edtFromCode: TEdit;
    edtToCode: TEdit;
    cboxQtyOnHand: TCheckBox;
    dbcboxCostPrice: TCheckBox;
    cbcxSellingPrice: TComboBox;
    dbcboxStockCount: TCheckBox;
    dbcboxStockListAveCost: TCheckBox;
    dbcboxStockValue: TCheckBox;
    DBcbNilBal: TCheckBox;
    dbcomboxSequence: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBInclusiveprice: TCheckBox;
    CBShowZerostockCount: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure cboxQtyOnHandKeyPress(Sender: TObject; var Key: Char);
    procedure cbcxSellingPriceChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStockListOptions: TfmStockListOptions;

implementation

uses Main, Database, Lookup, StockListReport, HTMLHelpAPI, GlobalFunctions,
  TcVariables, DatabaseAccess, XRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TfmStockListOptions.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
  DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(213){Stock Code});
  dbcomboxSequence.Items.Add(GetTextLang(1058){'Stock Description'});
  cbcxSellingPrice.Items.Clear;
  cbcxSellingPrice.Items.Add(GetTextLang(1057){None});
  cbcxSellingPrice.Items.Add(GetTextLang(1056){All Selling Prices});
//  cbcxSellingPrice.
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  cbcxSellingPrice.Items.Add(dmDatabase.tblSysVarsSSellingPriceName1.Value);
  cbcxSellingPrice.Items.Add(dmDatabase.tblSysVarsSSellingPriceName2.Value);
  cbcxSellingPrice.Items.Add(dmDatabase.tblSysVarsSSellingPriceName3.Value);
  dmDatabase.tblSysVars.Close;
  //Load Report Option
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  cbcxSellingPriceChange(Sender);
  CBInclusiveprice.Caption := GetTextLang(2984);
  CBShowZerostockCount.Caption := GetTextLang(3019);
end;

procedure TfmStockListOptions.btnCancelClick(Sender: TObject);
begin
  dmdatabase.tblOpReport.Close;
  Close;
end;

procedure TfmStockListOptions.btnOkClick(Sender: TObject);
begin
  // done : Pieter  Sysvars was not open.
  // So report groups did not sort.

  dmDatabase.tblStock.Filtered := False;
  dmDatabase.tblStock.Filter := '' ;
  if  edtFromCode.Text <> '' then
  dmDatabase.tblStock.Filter := 'SSTOCKCODE >= ' + QuotedStr(edtFromCode.Text) ;
  if  edtToCode.Text <> '' then
    begin
      if dmDatabase.tblStock.Filter = '' then
      dmDatabase.tblStock.Filter :=   'SSTOCKCODE <= ' + QuotedStr(edtToCode.Text) else
      dmDatabase.tblStock.Filter :=  dmDatabase.tblStock.Filter + ' and SSTOCKCODE <= ' + QuotedStr(edtToCode.Text);
    end;
      
  dmDatabase.tblSysVars.Open ;
//  dbcomboxSequence.ItemIndex:=dbcomboxSequence.Items.IndexOf(dbcomboxSequence.Text);
  dmDatabase.tblStock.Open;

    if dbcomboxSequence.ItemIndex = 0 then // stock code
    dmDataBase.tblStock.IndexFieldNames := 'SStockcode';
  if dbcomboxSequence.ItemIndex = 1 then  // 'Stock Description' then
    dmDataBase.tblStock.IndexFieldNames := 'SDescription';
  if  dbcomboxSequence.ItemIndex = 2 then
    dmDatabase.tblStock.IndexFieldNames := 'WREPORTINGGROUP1ID';
  if dbcomboxSequence.ItemIndex = 3 then
    dmDatabase.tblStock.IndexFieldNames := 'WREPORTINGGROUP2ID';



  dmDatabase.tblStock.Filtered := True;


  //Save Report Options
  SaveReoprtOp;

//  cbcxSellingPrice.ItemIndex:= cbcxSellingPrice.Items.IndexOf(cbcxSellingPrice.Text);
  PriceID := cbcxSellingPrice.ItemIndex;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblUnit.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblaccount.Open;
  MakeTXTReport := cbDestination.ItemIndex = 2 ;
  {}
  EmailType:=50;
  qrStockListing := TqrStockListing.Create(Self);
  try
  if dbcomboxSequence.ItemIndex = 2 then
  begin
    qrStockListing.qrGroupReport.Expression:='tblStock.WReportingGroup1ID';
    qrStockListing.qrGroupReport.Enabled:=True;
  end
  else
  if dbcomboxSequence.ItemIndex = 3 then
  begin
    qrStockListing.qrGroupReport.Expression:='tblStock.WReportingGroup2ID';
    qrStockListing.qrGroupReport.Enabled:=True;
  end;
  FillStringsWithReportingGroups(GblReportGroup1List,26);
  FillStringsWithReportingGroups(GblReportGroup2List,27);
  FillStringsWithUnitDesc(GblUnitList);
  qrStockListing.InclusivePrice := CBInclusiveprice.Checked ;
//  qrStockListing.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrStockListing,edtCount.Text);
  finally
   FreeAndNil(qrStockListing);
  end;
  dmDataBase.tblStock.IndexFieldNames := 'SStockcode';
  dmDatabase.tblStock.Filtered := False;
  dmDatabase.tblStock.Filter := '';
  dmDatabase.tblStock.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblUnit.Close;
  dmDatabase.tblaccount.Close;
  dmdatabase.tblOpReport.Close;
  dmDatabase.tblStock.Filter := '' ;

  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmStockListOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(205);
             key := 0;

        end;
end;

procedure TfmStockListOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmStockListOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmStockListOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmStockListOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmStockListOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmStockListOptions.LoadReoprtOp;
begin
  edtFromCode.Text :=  ReadReportOp('SStockListFromCode').AsString;
  edtToCode.Text :=  ReadReportOp('SStockListToCode').AsString;
  dbcboxStockCount.Checked := ReadReportOp('BStockListStockCount',false).AsBoolean;
  dbcboxStockListAveCost.Checked := ReadReportOp('BStockListAveCost',false).AsBoolean;
  dbcboxStockValue.Checked := ReadReportOp('BStockListStockValue',false).AsBoolean;
  DBcbNilBal.Checked := ReadReportOp('BStockListIncludeNilBal',false).AsBoolean;
  dbcboxCostPrice.Checked := ReadReportOp('BStockListCostPrice',false).AsBoolean;
  cboxQtyOnHand.Checked := ReadReportOp('BStockListQtyOnHand',false).AsBoolean;
  cbcxSellingPrice.ItemIndex := cbcxSellingPrice.Items.IndexOf(ReadReportOp('SStockListSellingPrice').AsSTring);
  dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(ReadReportOp('SStockListSequence').AsSTring);
  CBInclusiveprice.checked :=   ReadReportOp('CBInclusiveprice',false).AsBoolean;
  CBShowZerostockCount.checked :=   ReadReportOp('CBShowZerostockCount',true).AsBoolean;

end;


Procedure TfmStockListOptions.SaveReoprtOp;
begin
  WriteReportOp('SStockListFromCode',edtFromCode.Text );
  WriteReportOp('SStockListToCode',edtToCode.Text  ) ;
  WriteReportOp('BStockListStockCount',Bool2Str(dbcboxStockCount.Checked));
  WriteReportOp('BStockListAveCost',Bool2Str(dbcboxStockListAveCost.Checked));
  WriteReportOp('BStockListStockValue',Bool2Str(dbcboxStockValue.Checked));
  WriteReportOp('BStockListIncludeNilBal',Bool2Str(DBcbNilBal.Checked));
  WriteReportOp('BStockListCostPrice',Bool2Str(dbcboxCostPrice.Checked));
  WriteReportOp('BStockListQtyOnHand',Bool2Str(cboxQtyOnHand.Checked));
  WriteReportOp('SStockListSellingPrice',cbcxSellingPrice.Text);
  WriteReportOp('SStockListSequence',dbcomboxSequence.Text);
  WriteReportOp('CBInclusiveprice',Bool2Str(CBInclusiveprice.Checked));
    WriteReportOp('CBShowZerostockCount',Bool2Str(CBShowZerostockCount.Checked));
end;

procedure TfmStockListOptions.cboxQtyOnHandKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmStockListOptions.cbcxSellingPriceChange(Sender: TObject);
begin
  if cbcxSellingPrice.itemIndex=1 then
  begin
    dbcboxStockCount.Enabled := False;
    dbcboxStockListAveCost.Enabled := False;
    dbcboxCostPrice.Enabled := False;
    dbcboxStockValue.Enabled := False;
  end
  else
  begin
    dbcboxStockCount.Enabled := True;
    dbcboxStockListAveCost.Enabled := True;
    dbcboxCostPrice.Enabled := True;
    dbcboxStockValue.Enabled := True;
  end;
end;

procedure TfmStockListOptions.BitBtn1Click(Sender: TObject);
begin
 dmDatabase.tblStock.Filter := '' ;
  edtFromCode.Color := clHighlight;
//  fmLookup.SelectLookup(Sender, 'Stock', 'STOCK', 'STOCK', 1);
  CallLookup(edtFromCode.Text, 7);
  if ReturnLookup <> 'ESC' then
    begin
    if  ReturnLookup <> 'NEW' then
    edtFromCode.Text := ReturnLookup ;
    end else
    edtFromCode.Text := '' ;
  edtFromCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmStockListOptions.BitBtn2Click(Sender: TObject);
begin
dmDatabase.tblStock.Filter := '' ;
  edtToCode.Color := clHighlight;
  //fmLookup.SelectLookup(Sender, 'Stock', 'STOCK', 'STOCK', 1);
  CallLookup(edtToCode.Text, 7);
  if ReturnLookup <> 'ESC' then
    begin
    if  ReturnLookup <> 'NEW' then
    edtToCode.Text := ReturnLookup ;
    end
    else
     edtToCode.Text := '' ;
  edtToCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
