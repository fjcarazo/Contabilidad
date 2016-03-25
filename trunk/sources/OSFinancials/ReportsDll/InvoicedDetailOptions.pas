(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit InvoicedDetailOptions;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls;

type
  TfmInvoicedDetailOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dbcomboxWhichYear: TDBComboBox;
    edtFromDate: TEdit;
    cbTaxAccount: TComboBox;
    edtToDate: TEdit;
    dbcbShowDetails: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    cbTaxMethod: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    Procedure PymBasedTax(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DoNewTaxReport ;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInvoicedDetailOptions: TfmInvoicedDetailOptions;
//  FromID, ToID           : Integer;

implementation

uses Main, Database, Lookup, InvoicedDetail, HTMLHelpAPI, LanguageChoice,
  GlobalFunctions, InvoicePaid, TcVariables, DatabaseAccess,
  InvoiceTaxDetail;

{$R *.DFM}

Var
  MyFilter:String;

procedure TfmInvoicedDetailOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(441){Do you want to continue reporting ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmInvoicedDetailOptions.btnOkClick(Sender: TObject);
begin

 if not dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState then
   begin
    DoNewTaxReport ;
    if OptionsClose then Close
      else FormShow(Sender);
      exit ;
   end ;

 //
  CheckTransactionSTAX;
  //
  cbTaxMethod.ItemIndex := cbTaxMethod.Items.IndexOf(cbTaxMethod.Text);
  dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailFromDate').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailToDate').AsInteger := ToID;
  dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailSTAXAccount').AsString := cbTaxAccount.Text;
  dmDatabase.tblReportingOptions.Post;
  if cbTaxMethod.ItemIndex=1 then
    PymBasedTax(Sender)
  else
  begin
    dmDatabase.tblSysVars.Open;
    dmDatabase.qryInvDetail.ParamByName('FromDate').AsInteger := FromID;
    dmDatabase.qryInvDetail.ParamByName('ToDate').AsInteger := ToID;
    dmDatabase.qryInvDetail.Open;
    dmDatabase.qryInvDetail.Filtered := False;
    dmDatabase.qryInvDetail.Filter := '';
    dmDatabase.tblAccount.Open;
    dmDatabase.qryInvDetail.Filtered := False;
    if cbTaxAccount.ItemIndex=0 then

    {
      if MyFilter='' then
        dmDatabase.qryInvDetail.Filter := 'FTaxAmount <> NULL AND WTaxAccountID = ''' + dmDatabase.tblAccountWAccountID.AsString + ''''
      else
       dmDatabase.qryInvDetail.Filter := 'FTaxAmount <> NULL AND ('+MyFilter+')'
  }
    begin
      if MyFilter='' then
        dmDatabase.qryInvDetail.Filter := ''
        // dmDatabase.qryInvDetail.Filter := 'WTaxAccountID = ' + dmDatabase.tblAccountWAccountID.AsString
      else
       dmDatabase.qryInvDetail.Filter := '('+MyFilter+')'
     end
    else
    begin
      dmDatabase.tblAccount.Locate('SDescription; WAccountTypeID', VarArrayOf([cbTaxAccount.Text, 4]), []);
      dmDatabase.qryInvDetail.Filter := 'FTaxAmount <> NULL AND WTaxAccountID = ' + dmDatabase.tblAccountWAccountID.AsString ;
    end;
    dmDatabase.qryInvDetail.Filtered := True;
    qrInvoicedDetail := TqrInvoicedDetail.Create(Self);
    try
  //  qrInvoicedDetail.Preview;
    PrintReportProcess(cbDestination.ItemIndex,qrInvoicedDetail,edtCount.Text);
    finally
     FreeAndNil(qrInvoicedDetail);
    end;
    dmDatabase.tblAccount.Close;
    dmDatabase.qryInvDetail.Filtered := False;
    dmDatabase.qryInvDetail.Filter := '';
    dmDatabase.qryInvDetail.Close;
    dmDatabase.tblSysVars.Close;
  end;
  dmDatabase.tblReportingOptions.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmInvoicedDetailOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInvoicedDetailOptions.FormShow(Sender: TObject);

begin
  dbcomboxWhichYear.Items[0] := GetTextLang(603);
  dbcomboxWhichYear.Items[1] :=  GetTextLang(604);

  ButtonPanel.Color := fmMain.ControlPanel.Color;
  cbTaxMethod.Clear;
  dmDatabase.tblSysVars.Open;
  cbTaxMethod.Items.Add(GetTExtLang(1110){'Detailed'});
  if (dmDatabase.tblSysVarsBPaymentsBased.Asinteger = 1) then
    cbTaxMethod.Items.Add(GetTExtLang(1111){'Received});
  cbTaxAccount.Items.Clear;
  cbTaxAccount.Items.Add(GetTextLang(1098){'All tax Code'});
  dmDatabase.tblAccount.Open;
  MyFilter:='';
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := 'WAccountID<>''0'' and WAccountTypeID = ''4''';
  dmDatabase.tblAccount.Filtered := True;
  dmDatabase.tblAccount.First;
  while not dmDatabase.tblAccount.EOF do
  begin
    MyFilter:=MyFilter+' WTaxAccountID='+dmDatabase.tblAccountWAccountID.AsString;
 //   MyFilter:=MyFilter+' WAccountID='+dmDatabase.tblAccountWAccountID.AsString;
    cbTaxAccount.Items.Add(dmDatabase.tblAccountSDescription.Value);
    dmDatabase.tblAccount.Next;
    if not dmDatabase.tblAccount.EOF then  MyFilter:=MyFilter+' OR ';
  end;
  cbTaxAccount.ItemIndex:=0;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  //get the periods
  FromID := dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailFromDate').AsInteger;
  ToID := dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailToDate').AsInteger;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
  edtFromDate.Text := dmDatabase.tblPeriodsSDescription.AsString + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.AsDateTime);
  dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
  edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.AsDateTime);
  dmDatabase.tblPeriods.Close;
  cbTaxAccount.Text := dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailSTAXAccount').AsString;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmInvoicedDetailOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlShowTopic(210);
   key := 0;
  end;
end;

procedure TfmInvoicedDetailOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmInvoicedDetailOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmInvoicedDetailOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmInvoicedDetailOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmInvoicedDetailOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmInvoicedDetailOptions.PymBasedTax(Sender: TObject);
Var
  DueAccID : Integer ;
  Label Myexit;
begin
  dmDatabase.tblTransaction.Open;
  dmDatabase.tblSysVars.Open;
  DueAccID := Str2Int(dmDatabase.tblSysVarsWDueAccountID.AsString);
  if DueAccID<=0 then
    Goto Myexit;
  dmDatabase.tblBatchtypes.open;
  dmDatabase.tblAccount.open;
  dmDatabase.tblOilinks.open;
  dmDatabase.tblAccount.Locate('WAccountID',DueAccID,[]);
  dmDatabase.qryTransactionReport.Close;
  dmDatabase.qryTransactionReport.ParamByName('FromDate').AsDateTime := 0;
  dmDatabase.qryTransactionReport.ParamByName('ToDate').AsDateTime := 26;
  dmDatabase.qryTransactionReport.ParamByName('FromAcc').AsString := '0';
  dmDatabase.qryTransactionReport.ParamByName('ToAcc').AsString := 'ZZZZZZ';
  dmDatabase.qryTransactionReport.Open;
  dmDataBase.tblTransaction.Filtered := False;
  dmDataBase.tblTransaction.Filter := 'WTaxAccountID='+IntToStr(DueAccID)+' AND WPeriodID>='+IntToStr(FromID)+' AND WPeriodID<='+IntToStr(ToID);
  dmDataBase.tblTransaction.Filtered := True;
  // TODO : BDEINDEX
  // dmDataBase.tblTransaction.IndexName := 'Ind_BatchType';
  qrInvoicePaid := TqrInvoicePaid.Create(Self);
  try
  qrInvoicePaid.Preview;
//  PrintReportProcess(cbDestination.ItemIndex,qrInvoicedDetail,edtCount.Text);
  finally
    FreeAndNil(qrInvoicePaid);
  end;
Myexit:
  dmDatabase.tblTransaction.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblBatchtypes.Close;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblOilinks.Close;
  dmDatabase.qryTransactionReport.Close;
end;

procedure TfmInvoicedDetailOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblSysVars.Close;
end;

procedure TfmInvoicedDetailOptions.BitBtn1Click(Sender: TObject);
begin
   HighLight(edtFromDate);

  if dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailWhichYear').AsString = GetTextLang(603) then
//    fmLookup.SelectLookup(Sender, 'Periods', 'THISYEAR', 'PERIODS', FromID)
    ReturnLookup:=CallLookup(edtFromDate.Text, 8)
  else
//    fmLookup.SelectLookup(Sender, 'Periods', 'LASTYEAR', 'PERIODS', FromID);
    ReturnLookup:=CallLookup(edtFromDate.Text, 9);
  if (ReturnLookup <> 'ESC') and (dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailWhichYear').AsString <> '') then
  begin
    FromID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', FromID, []);
    edtFromDate.Text := dmDatabase.tblPeriodsSDescription.AsString +FormatDateTime(' yyyy',dmDatabase.tblPeriodsDStartDate.AsDateTime);
    {Set To Period With Next Month}
    if not dmDatabase.tblPeriods.Eof then
    begin
      dmDatabase.tblSysVars.open;
      if dmDatabase.tblPeriodsWPeriodID.VAlue=dmDatabase.tblSysVarswNoOfPeriods.vAlue then
        dmDatabase.tblPeriods.Locate('WPeriodID', 14 , [])
      else if Not dmDatabase.tblPeriodsWPeriodID.VAlue = dmDatabase.tblSysVarswNoOfPeriods.AsInteger * 2 then
         dmDatabase.tblPeriods.Next;
      ToID := dmDatabase.tblPeriodsWPeriodID.AsInteger;
      edtToDate.Text := dmDatabase.tblPeriodsSDescription.AsString + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
      dmDatabase.tblSysVars.Close;
    end;
    dmDatabase.tblPeriods.Close;
    SelectNext(ActiveControl, True, True);
  end;
  BackNormal(edtFromDate);
end;

procedure TfmInvoicedDetailOptions.BitBtn2Click(Sender: TObject);
begin
  HighLight( edtToDate);
  if dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailWhichYear').Asstring = GetTextLang(603)  then
//    fmLookup.SelectLookup(Sender, 'Periods', 'THISYEAR', 'PERIODS', ToID)
    ReturnLookup:=CallLookup(edtToDate.Text, 8)
  else
//    fmLookup.SelectLookup(Sender, 'Periods', 'LASTYEAR', 'PERIODS', ToID);
    ReturnLookup:=CallLookup(edtToDate.Text, 9);
  if (ReturnLookup <> 'ESC') and (dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailWhichYear').Value <> '') then
  begin
    ToID := StrToInt(ReturnLookup);
    dmDatabase.tblPeriods.Open;
    dmDatabase.tblPeriods.Locate('WPeriodID', ToID, []);
    edtToDate.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' yyyy',dmDatabase.tblPeriodsDEndDate.Value);
    dmDatabase.tblPeriods.Close;
    SelectNext(ActiveControl, True, True);
  end;
  BackNormal( edtToDate);
end;

procedure TfmInvoicedDetailOptions.DoNewTaxReport;
begin
  cbTaxMethod.ItemIndex := cbTaxMethod.Items.IndexOf(cbTaxMethod.Text);
  dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailFromDate').AsInteger := FromID;
  dmDatabase.tblReportingOptions.FieldByName('WInvoiceDetailToDate').AsInteger := ToID;
  dmDatabase.tblReportingOptions.FieldByName('SInvoiceDetailSTAXAccount').AsString := cbTaxAccount.Text;
  dmDatabase.tblReportingOptions.Post;
  begin
    qrInvoicedTaxDetail := TqrInvoicedTaxDetail.Create(Self);
    try
    qrInvoicedTaxDetail.QGenTax.Connection :=   dmDatabase.tblAccount.Connection ;
    dmDatabase.tblSysVars.Open;
    qrInvoicedTaxDetail.QGenTax.ParamByName('FromDate').AsInteger := FromID;
    qrInvoicedTaxDetail.QGenTax.ParamByName('ToDate').AsInteger := ToID;
    qrInvoicedTaxDetail.QGenTax.Open;
    dmDatabase.tblAccount.Open;
    qrInvoicedTaxDetail.QGenTax.Filtered := False;
    if cbTaxAccount.ItemIndex <> 0 then
    begin
      dmDatabase.tblAccount.Locate('SDescription; WAccountTypeID', VarArrayOf([cbTaxAccount.Text, 4]), []);
      qrInvoicedTaxDetail.QGenTax.Filter := 'WAccountID = ' +dmDatabase.tblAccountWAccountID.AsString ;
    end;
    qrInvoicedTaxDetail.QGenTax.Filtered := True;

  //  qrInvoicedDetail.Preview;
    PrintReportProcess(cbDestination.ItemIndex,qrInvoicedTaxDetail,edtCount.Text);
    finally
     FreeAndNil(qrInvoicedTaxDetail);
    end;
    dmDatabase.tblAccount.Close;
    dmDatabase.tblSysVars.Close;
  end;
  dmDatabase.tblReportingOptions.Close;
end;

procedure TfmInvoicedDetailOptions.FormCreate(Sender: TObject);
begin
  dbcomboxWhichYear.Items[0] := GetTextLang(603) ;
  dbcomboxWhichYear.Items[1] := GetTextLang(604) ;
end;

end.

