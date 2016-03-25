(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SalesBySalesPersonOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls;

type
  TfmSalesBySalesPersonOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    cbSalesman: TComboBox;
    Label5: TLabel;
    dbdtFromDate: TwwDBDateTimePicker;
    Label6: TLabel;
    dbdtToDate: TwwDBDateTimePicker;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    cbShowGroups: TCheckBox;
    cbShowDetails: TCheckBox;
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
    procedure cbShowDetailsClick(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    Procedure UpdateTmp;
    { Public declarations }
  end;

var
  fmSalesBySalesPersonOptions: TfmSalesBySalesPersonOptions;

implementation

uses Main, Database, Lookup, GlobalFunctions, SalesBySalesPersonReport, HTMLHelpAPI,
  LanguageChoice, DatabaseAccess,XRoutines;

{$R *.DFM}
procedure TfmSalesBySalesPersonOptions.UpdateTmp;
var
 i:Integer;
begin
 with DmDatabase,dmDatabase.qrySalesBySalesperson do begin
  First;
    While not eof do begin
     Temp_1.Append;
     Temp_1.FieldByName('WGroupID').AsString := FieldByName('WGroupID').AsString;
     Temp_1.FieldByName('SDescription').AsString := FieldByName('SDescription').AsString;
     Temp_1.FieldByName('DDate').AsString := FieldByName('DDate').AsString;
     Temp_1.FieldByName('SDocNo').AsString := FieldByName('SDocNo').AsString;
     Temp_1.FieldByName('FSellingPRice').AsString := FieldByName('FSellingPRice').AsString ;
     Temp_1.FieldByName('FCostPrice').AsString := FieldByName('FCostPrice').AsString ;
     Temp_1.FieldByName('FQty').AsString := FieldByName('FQty').AsString ;
     Temp_1.FieldByName('SSTOCKCODE').AsString := FieldByName('SSTOCKCODE').AsString ;
     Temp_1.Post;
     next;
   end;
  end;
end;

procedure TfmSalesBySalesPersonOptions.CrunchTable;
var _grp, _main, _desc, _sub, _date,
    _docno, _doctype, _sell, _cost,
    _StockCode,_qty : string;
begin
 // This proc takes the temp_1 table loaded with qrySalesBySalesPerson, and
 // totals all document lines into one record per document.
 // ordered by mainaccount, subaccount, date, docno, doctype

 with dmDatabase.qrySalesBySalesperson do begin
  First;
  if not eof then begin
//   _main    := FieldByName('SMAINACCOUNTCODE').AsString;
//   _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
   _grp     := FieldByName('WGroupID').AsString;
   _desc    := FieldByName('SDescription').AsString;
   _date    := FieldByName('DDate').AsString;
   _docno   := FieldByName('SDocNo').AsString;
//   _doctype := FieldByName('WDocTypeID').AsString;
   _sell    := FieldByName('FSellingPrice').AsString;
   _cost    := FieldByName('FCostPrice').AsString;
   _qty     := FieldByName('FQty').AsString;
   _StockCode:=FieldByName('SSTOCKCODE').AsString;
  end;
  if not eof then next;
  while not eof do begin
//   if ((_main     <> FieldByName('SMAINACCOUNTCODE').AsString)
//    or (_sub      <> FieldByName('SSUBACCOUNTCODE').AsString)
    if ((_date     <> FieldByName('DDate').AsString)
     or (_docno    <> FieldByName('SDocNo').AsString)
     or (_desc     <> FieldByName('SDescription').AsString)) then begin
//    or (_doctype  <> FieldByName('WDocTypeID').AsString)) then begin
     dmDatabase.Temp_1.Append;
//     dmDatabase.Temp_1.FieldByName('SMAINACCOUNTCODE').AsString := _main;
//     dmDatabase.Temp_1.FieldByName('SSUBACCOUNTCODE').AsString := _sub;
     dmDatabase.Temp_1.FieldByName('WGroupID').AsString := _grp;
     dmDatabase.Temp_1.FieldByName('SDescription').AsString := _desc;
     dmDatabase.Temp_1.FieldByName('DDate').AsString := _date;
     dmDatabase.Temp_1.FieldByName('SDocNo').AsString := _docno;
//     dmDatabase.Temp_1.FieldByName('WDocTypeID').AsString := _doctype;
     dmDatabase.Temp_1.FieldByName('FSellingPRice').AsString := _sell;
     dmDatabase.Temp_1.FieldByName('FCostPrice').AsString := _cost;
     dmDatabase.Temp_1.FieldByName('FQty').AsString := _qty;
     // Sylvain
     dmDatabase.Temp_1.FieldByName('SSTOCKCODE').AsString := _StockCode;
     dmDatabase.Temp_1.Post;
//     _main    := FieldByName('SMAINACCOUNTCODE').AsString;
//     _sub     := FieldByName('SSUBACCOUNTCODE').AsString;
     _grp     := FieldByName('WGroupID').AsString;
     _desc    := FieldByName('SDescription').AsString;
     _date    := FieldByName('DDate').AsString;
     _docno   := FieldByName('SDocNo').AsString;
//     _doctype := FieldByName('WDocTypeID').AsString;
     _sell    := FieldByName('FSellingPRice').AsString;
     _cost    := FieldByName('FCostPrice').AsString;
     _qty     := FieldByName('FQty').AsString;
     _StockCode:= FieldByName('SSTOCKCODE').AsString;
    end else begin
     _sell    := FloatToStr(StrToFloat(_sell) + FieldByName('FSellingPRice').AsFloat);
     _cost    := FloatToStr(StrToFloat(_cost) + FieldByName('FCostPrice').AsFloat);
     _qty     := FloatToStr(StrToFloat(_qty)  + FieldByName('FQty').AsInteger);
    end;
   Next;
  end;
 end;
end;


procedure TfmSalesBySalesPersonOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbSalesman.Clear;
  cbSalesman.Items.Add(GetTextLang(1098){'All'});
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = ''31''';
  dmDatabase.tblGroups.Filtered := True;
  dmDatabase.tblGroups.First;
  while not dmDatabase.tblGroups.EOF do
  begin
    cbSalesman.Items.Add(dmDatabase.tblGroupsSDescription.Value);
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblGroups.Close;
  dmDatabase.tblReportingOptions.Open;
  if dmDatabase.tblReportingOptions.FieldByName('SSalesBySPSalesperson').AsString<>'' then
    cbSalesman.ItemIndex :=cbSalesman.Items.IndexOf(dmDatabase.tblReportingOptions.FieldByName('SSalesBySPSalesperson').Asstring)
  else
    cbSalesman.ItemIndex:=0;
  dmDatabase.tblReportingOptions.Edit;
  //Load Report Option
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmSalesBySalesPersonOptions.FormKeyPress(Sender: TObject;
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

procedure TfmSalesBySalesPersonOptions.btnOkClick(Sender: TObject);
begin
//  dmDatabase.tblReportingOptions.edit;
  dmDatabase.tblReportingOptions.FieldByName('SSalesBySPSalesperson').Value := cbSalesman.Text;
  dmDatabase.tblReportingOptions.Post;
    //Save Report Options
  SaveReoprtOp;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.qrySalesBySalesperson.ParamByName('FromDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DSalesBySPFromDate').AsDateTime;
  dmDatabase.qrySalesBySalesperson.ParamByName('ToDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DSalesBySPToDate').AsDateTime;
  dmDatabase.qrySalesBySalesPerson.Open;
  qrSalesBySalesPerson := TqrSalesBySalesPerson.Create(Self);
  try
  if cbSalesman.ItemIndex<>0 then
  begin
    dmDatabase.qrySalesBySalesPerson.Filtered := False;
    dmDatabase.qrySalesBySalesPerson.Filter := 'SDescription = ''' + dmDatabase.tblReportingOptions.FieldByName('SSalesBySPSalesperson').Asstring + '''';
    dmDatabase.qrySalesBySalesPerson.Filtered := True;
  end
  else
    qrSalesBySalesPerson.qrAllSelected.Enabled := True;

// Rem by Sylvain
//  dmDatabase.Temp_1.Open;
//  while dmDatabase.Temp_1.Recordcount > 0 do dmDatabase.Temp_1.Delete;
//  CrunchTable;

  qrSalesBySalesPerson.ReportTitle:='Sales Analysis:Sales by Sales Person';
  if Not cbShowDetails.Checked then
  begin {Hide All Details and Details-Titles}
    qrSalesBySalesPerson.QRBand2.Height:=0;
    qrSalesBySalesPerson.qrRepGroupFoot.Height:=0;
    qrSalesBySalesPerson.QRLabel4.Enabled := False;
    qrSalesBySalesPerson.QRLabel13.Enabled := False;
    qrSalesBySalesPerson.QRLabel5.Enabled := False;
    qrSalesBySalesPerson.QRLabel11.Enabled := False;
    qrSalesBySalesPerson.QRLabel10.Enabled := False;
    {}
    qrSalesBySalesPerson.qrRepGroupHead.Enabled:=False;
    qrSalesBySalesPerson.qrRepGroupFoot.Enabled:=False;
  end
  else
    if cbShowGroups.Checked then
    begin
      qrSalesBySalesPerson.qrRepGroupHead.Expression := 'qrySalesBySalesperson.WReportingGroup1ID + qrySalesBySalesperson.WReportingGroup2ID + qrySalesBySalesperson.SDocNo';
      qrSalesBySalesPerson.QRBand2.Height:=0;
    end
    else
    begin
      qrSalesBySalesPerson.qrRepGroupHead.Enabled:=False;
      qrSalesBySalesPerson.qrRepGroupFoot.Enabled:=False;
    end;
  
    //  qrSalesBySalesPerson.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrSalesBySalesPerson,edtCount.Text);
  finally
   FreeAndNil(qrSalesBySalesPerson);
  end;

  dmDatabase.qrySalesBySalesPerson.Filtered := False;
  dmDatabase.qrySalesBySalesPerson.Filter := '';
  dmDatabase.qrySalesBySalesPerson.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmSalesBySalesPersonOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := '';
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmSalesBySalesPersonOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
  HtmlShowTopic(200);

   key := 0;
  end;
end;

procedure TfmSalesBySalesPersonOptions.cbDestinationChange(
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

procedure TfmSalesBySalesPersonOptions.cbDestinationKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmSalesBySalesPersonOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmSalesBySalesPersonOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmSalesBySalesPersonOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmSalesBySalesPersonOptions.LoadReoprtOp;
begin
  cbShowGroups.Checked := ReadReportOp('BSalesBySalesPrsShowGrp').AsBoolean;
  cbShowDetails.Checked := ReadReportOp('BSalesBySalesPrsShowDetls').AsBoolean;
  cbShowDetailsClick(Self);  
end;

Procedure TfmSalesBySalesPersonOptions.SaveReoprtOp;
begin
  WriteReportOp('BSalesBySalesPrsShowGrp',Bool2Str(cbShowGroups.Checked));
  WriteReportOp('BSalesBySalesPrsShowDetls',Bool2Str(cbShowDetails.Checked));
end;

procedure TfmSalesBySalesPersonOptions.cbShowDetailsClick(Sender: TObject);
begin
  cbShowGroups.Enabled := cbShowDetails.Checked;
end;

end.
