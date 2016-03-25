(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesByCustomerOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  DBCtrls, DB, ExtCtrls, Mask, wwdbdatetimepicker,
  Buttons, ComCtrls;

type
  TfmSalesByCustomerOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label51: TLabel;
    Label6: TLabel;
    dbcomboxSequence: TDBComboBox;
    dbedtFromCustomer: TDBEdit;
    dbedtToCustomer: TDBEdit;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
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
    procedure CrunchTable;
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
    BUseCustomer : Boolean ;
  end;

var
  fmSalesByCustomerOptions: TfmSalesByCustomerOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, SalesByCustomerReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

procedure TfmSalesByCustomerOptions.CrunchTable;
var _main, _desc, _sub, _date, _docno, _doctype, _sell, _cost, _qty : string;
begin
 // This proc takes the temp_1 table loaded with qrySalesByCustomer, and
 // totals all document lines into one record per document.
 // ordered by mainaccount, subaccount, date, docno, doctype

 with dmDatabase.qrySalesByCustomer do begin
  First;
  if not eof then begin
   _main    := FieldByName('SMAINACCOUNTCODE').AsString;
   _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
   _desc    := FieldByName('SDescription').AsString;
   _date    := FieldByName('DDate').AsString;
   _docno   := FieldByName('SDocNo').AsString;
   _doctype := FieldByName('WDocTypeID').AsString;
// Changed 17/7/00

     _sell    := FormatFloat('0.00',FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsFloat);
     _cost    := FormatFloat('0.00',FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsFloat);

//   _sell    := FieldByName('FSellingPRice').AsString;
//   _cost    := FieldByName('FCostPrice').AsString;
   _qty     := FormatFloat('0.######',FieldByName('FQty').AsFloat);
  end;
//  if not eof then next;
//  while not eof do begin
   Repeat
    Next ;
    if ((_main     <> FieldByName('SMAINACCOUNTCODE').AsString)
    or ( _sub     <> FieldByName('SSUBACCOUNTCODE').AsString)
    or ( _date    <> FieldByName('DDate').AsString)
    or ( _docno   <> FieldByName('SDocNo').AsString)
    or ( _doctype <> FieldByName('WDocTypeID').AsString)) or Eof then begin
     dmDatabase.Temp_1.Append;
     dmDatabase.Temp_1.FieldByName('SMAINACCOUNTCODE').AsString := _main;
     dmDatabase.Temp_1.FieldByName('SSUBACCOUNTCODE').AsString := _sub;
     dmDatabase.Temp_1.FieldByName('SDescription').AsString := _desc;
     dmDatabase.Temp_1.FieldByName('DDate').AsString := _date;
     dmDatabase.Temp_1.FieldByName('SDocNo').AsString := _docno;
     dmDatabase.Temp_1.FieldByName('WDocTypeID').AsString := _doctype;
     dmDatabase.Temp_1.FieldByName('FSellingPRice').AsString := _sell;
     dmDatabase.Temp_1.FieldByName('FCostPrice').AsString := _cost;
     dmDatabase.Temp_1.FieldByName('FQty').AsString := _qty;
     dmDatabase.Temp_1.Post;
     _main    := FieldByName('SMAINACCOUNTCODE').AsString;
     _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
     _desc    := FieldByName('SDescription').AsString;
     _date    := FieldByName('DDate').AsString;
     _docno   := FieldByName('SDocNo').AsString;
     _doctype := FieldByName('WDocTypeID').AsString;
// Changed 17/7/00
     _sell    := FloatToStr(FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsFloat);
     _cost    := FloatToStr(FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsFloat);

     _qty     := FieldByName('FQty').AsString;
    end else begin
// Changed by Sylvain
// 17/07/00
     _sell    := FloatToStr(Str2Float(_sell) + FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsFloat);
     _cost    := FloatToStr(Str2Float(_cost) + FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsFloat);
     _qty     := FloatToStr(Str2Float(_qty)  + FieldByName('FQty').AsFloat);
    end;
   Until Eof;
//   Next;
//  end;



 end;
end;

procedure TfmSalesByCustomerOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  dmDatabase.tblSysVars.Open;
  if BUseCustomer then
  begin
    dbcomboxSequence.Items.Add(TDataBaseRoutines.GetTypeDescription(22));
    dbcomboxSequence.Items.Add(TDataBaseRoutines.GetTypeDescription(23));
    dbedtFromCustomer.DataField :='SSalesByCustFromCust';
    dbedtToCustomer.DataField := 'SSalesByCustToCust';
    Caption := GetTextLang(384){'Sales By Customer Options'};
  end
  else
  begin
    dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSCreditorReportName1.Value);
    dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSCreditorReportName2.Value);
    dbedtFromCustomer.DataField :='SPurchBySuppFromSupp';
    dbedtToCustomer.DataField := 'SPurchBySuppToSupp';
    Caption :=GetTextLang(1078){'Purchasses By Supplier Options'};
  end;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
    // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;



end;

procedure TfmSalesByCustomerOptions.FormKeyPress(Sender: TObject;
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

procedure TfmSalesByCustomerOptions.btnOkClick(Sender: TObject);
Var
  S1,S2 : String;
begin
 ButtonPanel.Enabled := false ;
 try
 if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;
  S1 := dbedtFromCustomer.Text;
  S2 := dbedtToCustomer.Text ;
  SwapStr(S1,S2);
  dbedtFromCustomer.Text := S1 ;
  dbedtToCustomer.Text := S2 ;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qrySalesByCustomer.close;
  dmDatabase.qrySalesByCustomer.ParamByName('FromCode').Value := ZipAccountCode(dbedtFromCustomer.Text);
  dmDatabase.qrySalesByCustomer.ParamByName('ToCode').Value := ZipAccountCode(dbedtToCustomer.Text);
  dmDatabase.qrySalesByCustomer.ParamByName('Fromdate').AsDate := dmDatabase.tblReportingOptions.FieldByName('DSalesByCustFromDate').AsDateTime ;
  dmDatabase.qrySalesByCustomer.ParamByName('Todate').AsDate := dmDatabase.tblReportingOptionsDSALESBYCUSTTODATE.AsDateTime ;

  if BUseCustomer then
  begin
  dmDatabase.qrySalesByCustomer.ParamByName('AccountType').AsInteger := 1
  end else
  begin
  dmDatabase.qrySalesByCustomer.ParamByName('AccountType').AsInteger := 2 ;

  end;
  dmDatabase.qrySalesByCustomer.Open;
    dmDatabase.Temp_1.Open;
  while dmDatabase.Temp_1.Recordcount > 0 do dmDatabase.Temp_1.Delete;
  CrunchTable;

  dmDatabase.qrySalesByCustomer.Close;

  qrSalesByCustomer := TqrSalesByCustomer.Create(Self);
  try
  if Not cbShowDetails.Checked then
    qrSalesByCustomer.QRBand2.Height := 0;
  qrSalesByCustomer.BUseCustomer := BUseCustomer;

   if not BUseCustomer then
   begin
    qrSalesByCustomer.QRLabel10.Enabled := false  ;
    qrSalesByCustomer.QRLabel9.Enabled := false  ;
    qrSalesByCustomer.qrlGP.Enabled := false  ;
    qrSalesByCustomer.qrlGPP.Enabled := false  ;
    qrSalesByCustomer.qrlGPTotalInv.Enabled := false  ;
    qrSalesByCustomer.qrlGPTotalCrNote.Enabled := false  ;
    qrSalesByCustomer.qrlTotalGP.Enabled := false  ;
    qrSalesByCustomer.qrlGPTotal.Enabled := false  ;
    qrSalesByCustomer.QRLabel7.Enabled := false  ;
    qrSalesByCustomer.qrlNettCost.Enabled := false  ;
    qrSalesByCustomer.qrlNettCostTotalInv.Enabled := false  ;
    qrSalesByCustomer.qrlNettCostTotalCrNote.Enabled := false  ;
    qrSalesByCustomer.qrlNettCostTotal.Enabled := false  ;
    qrSalesByCustomer.qrlTotalCost.Enabled := false  ;
    qrSalesByCustomer.QRLabel6.caption := 'Nett Purchase amount' ;


  end;

  PrintReportProcess(cbDestination.ItemIndex,qrSalesByCustomer,edtCount.Text);
  dmDatabase.Temp_1.Close;
  finally
    FreeAndNil(qrSalesByCustomer);
  end;
  dmDatabase.qrySalesByCustomer.Filtered := False;
  dmDatabase.qrySalesByCustomer.Filter := '';
  dmDatabase.qrySalesByCustomer.Filtered := False;
  dmDatabase.qrySalesByCustomer.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
finally
    ButtonPanel.Enabled := true ;
end;
  if OptionsClose then Close
  else FormShow(Sender);

end;

procedure TfmSalesByCustomerOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesByCustomerOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   if BUseCustomer then
     HtmlShowTopic(197)
   else
     HtmlShowTopic(195);
   key := 0;
  end;
end;

procedure TfmSalesByCustomerOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmSalesByCustomerOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesByCustomerOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmSalesByCustomerOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesByCustomerOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;


Procedure TfmSalesByCustomerOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmSalesByCustomerOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

procedure TfmSalesByCustomerOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromCustomer.Color := clHighlight;
  if BUseCustomer then
    dbedtFromCustomer.Text  := CallLookup(dbedtFromCustomer.Text, 3)
  else
    dbedtFromCustomer.Text  := CallLookup(dbedtFromCustomer.Text, 4);
  dbedtFromCustomer.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmSalesByCustomerOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToCustomer.Color := clHighlight;
  if BUseCustomer then
    dbedtToCustomer.Text  := CallLookup(dbedtToCustomer.Text, 3)
  else
    dbedtToCustomer.Text  := CallLookup(dbedtToCustomer.Text, 4) ;
  dbedtToCustomer.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.


