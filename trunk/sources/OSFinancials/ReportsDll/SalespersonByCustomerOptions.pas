(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalespersonByCustomerOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TfmSalesPersonByCustomerOptions = class(TForm)
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
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
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
  end;

var
  fmSalesPersonByCustomerOptions: TfmSalesPersonByCustomerOptions;

implementation

uses Database, SalesPersonByCustomerReport, GlobalFunctions, Main, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines;

{$R *.DFM}

procedure TfmSalesPersonByCustomerOptions.CrunchTable;
var _main, _desc, _sub, _date, _docno, _doctype, _sell, _cost, _qty, _salID : string;
   iCount ,RecCount : LongInt ;
begin
 // This proc takes the temp_1 table loaded with qrySalesPersonByCustomer, and
 // totals all document lines into one record per document.
 // ordered by mainaccount, subaccount, date, docno, doctype
 RecCount:= dmDatabase.qrySalesPersonByCustomer.recordCount ;
 with dmDatabase.qrySalesPersonByCustomer do begin
  First;

  if not eof then begin
   _main    := FieldByName('SMAINACCOUNTCODE').AsString;
   _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
   _desc    := FieldByName('SDescription').AsString;
   _date    := FieldByName('DDate').AsString;
   _docno   := FieldByName('SDocNo').AsString;
   _doctype := FieldByName('WDocTypeID').AsString;
    // Added By Sylvain
   _sell    := FloatToStr(FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsInteger);
   _cost    := FloatToStr(FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsInteger);
   _qty     := FieldByName('FQty').AsString;

   iCount := 1;
   _salID   := FieldByName('WSalesmanID').AsString;

  end;
  while not eof do begin
   Next ;
   Inc(iCount);
   if ((_main     <> FieldByName('SMAINACCOUNTCODE').AsString)
    or ( _sub     <> FieldByName('SSUBACCOUNTCODE').AsString)
    or ( _date    <> FieldByName('DDate').AsString)
    or ( _docno   <> FieldByName('SDocNo').AsString)
    or ( _doctype <> FieldByName('WDocTypeID').AsString)
    // Added By Sylvain
    Or ( iCount > RecCount ) )then begin

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
     dmDatabase.Temp_1.FieldByName('WSalespersonID').AsString := _salID;
     dmDatabase.Temp_1.Post;
     if not eof then
     begin
       _main    := FieldByName('SMAINACCOUNTCODE').AsString;
       _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
       _desc    := FieldByName('SDescription').AsString;
       _date    := FieldByName('DDate').AsString;
       _docno   := FieldByName('SDocNo').AsString;
       _doctype := FieldByName('WDocTypeID').AsString;

       //_sell    := FieldByName('FSellingPRice').AsString;
       //_cost    := FieldByName('FCostPrice').AsString;
       { Changed 11/05/2001 }
       _sell    := FloatToStr(FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsInteger);
       _cost    := FloatToStr(FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsInteger);

       _qty     := FieldByName('FQty').AsString;
       _salID   := FieldByName('WSalesmanID').AsString;
     end;
    end else begin
     //_sell    := FloatToStr(StrToFloat(_sell) + FieldByName('FSellingPRice').AsFloat);
     //_cost    := FloatToStr(StrToFloat(_cost) + FieldByName('FCostPrice').AsFloat);
     { Changed by Sylvain }
     { 11/05/2001 }
     _sell    := FloatToStr(Str2Float(_sell) + FieldByName('FSellingPRice').AsFloat * -FieldByName('FQty').AsInteger);
     _cost    := FloatToStr(Str2Float(_cost) + FieldByName('FCostPrice').AsFloat* -FieldByName('FQty').AsInteger);

     _qty     := FloatToStr(StrToFloat(_qty)  + FieldByName('FQty').AsInteger);
    end;
  end;
 end;
end;


procedure TfmSalesPersonByCustomerOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesPersonByCustomerOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Post;
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.qrySalesPersonByCustomer.ParamByName('FromCode').Asstring := GetMainAccountCode(dmDatabase.tblReportingOptions.FieldByName('SSalesPersByCustFromCust').AsString);
  dmDatabase.qrySalesPersonByCustomer.ParamByName('ToCode').Asstring := GetMainAccountCode(dmDatabase.tblReportingOptions.FieldByName('SSalesPersByCustToCust').Asstring);
  dmDatabase.qrySalesPersonByCustomer.Open;
  dmDatabase.qrySalesPersonByCustomer.Filtered := False;
  dmDatabase.qrySalesPersonByCustomer.Filter := 'DDate >= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesPersByCustFromDate').AsDateTime) + ''' AND DDate <= ''' + formatDateTime('yyyy-mm-dd',dmDatabase.tblReportingOptions.FieldByName('DSalesPersByCustToDate').AsDateTime) + '''';
  dmDatabase.qrySalesPersonByCustomer.Filtered := True;

  dmDatabase.Temp_1.Open;
  while dmDatabase.Temp_1.Recordcount > 0 do dmDatabase.Temp_1.Delete;
  CrunchTable;

  dmDatabase.qrySalesPersonByCustomer.Close;
  dmDatabase.tblGroups.Open;
  qrSalesPersonByCustomer := TqrSalesPersonByCustomer.Create(Self);
  try
  if Not cbShowDetails.Checked then
    qrSalesPersonByCustomer.QRBand2.Height := 0;
  PrintReportProcess(cbDestination.ItemIndex,qrSalesPersonByCustomer,edtCount.Text);
  dmDatabase.Temp_1.Close;
  finally
   FreeAndNil(qrSalesPersonByCustomer);
  end;
  dmDatabase.qrySalesPersonByCustomer.Filtered := False;
  dmDatabase.qrySalesPersonByCustomer.Filter := '';
  dmDatabase.qrySalesPersonByCustomer.Filtered := False;
  dmDatabase.qrySalesPersonByCustomer.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmSalesPersonByCustomerOptions.FormKeyPress(Sender: TObject;
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

procedure TfmSalesPersonByCustomerOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add('Account Number');
  dbcomboxSequence.Items.Add('Account Description');
//  dbcomboxSequence.Items.Add('Account Type');
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSDebtorReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSDebtorReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
      // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
//  dbcomboxSequence.SetFocus;
end;

procedure TfmSalesPersonByCustomerOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(201);

   key := 0;
  end;
end;

procedure TfmSalesPersonByCustomerOptions.cbDestinationChange(
  Sender: TObject);
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

procedure TfmSalesPersonByCustomerOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesPersonByCustomerOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmSalesPersonByCustomerOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesPersonByCustomerOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmSalesPersonByCustomerOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

Procedure TfmSalesPersonByCustomerOptions.LoadReoprtOp;
begin
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
end;

procedure TfmSalesPersonByCustomerOptions.BitBtn1Click(Sender: TObject);
begin
 dbedtFromCustomer.Color := clHighlight;
  dbedtFromCustomer.Text  := CallLookup(dbedtFromCustomer.Text, 3);
  dbedtFromCustomer.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmSalesPersonByCustomerOptions.BitBtn2Click(Sender: TObject);
begin
 dbedtToCustomer.Color := clHighlight;
  dbedtToCustomer.Text  := CallLookup(dbedtToCustomer.Text, 3);
  dbedtToCustomer.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
