(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit InvoiceListingOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls,DB;

type
  TfmInvoiceListingOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    dbcomboxSequence: TDBComboBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    CbDocType: TComboBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dbedtFrom: TDBLookupComboBox;
    dbedtTo: TDBLookupComboBox;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    cboxUsePeriods: TCheckBox;
    Label5: TLabel;
    dbedtFromDate: TwwDBDateTimePicker;
    Label6: TLabel;
    dbedtToDate: TwwDBDateTimePicker;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbcomboxOutputKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure CbDocTypeChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cboxUsePeriodsClick(Sender: TObject);
  private
    { Private declarations }
    Procedure SetVisib;
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    { Public declarations }
  end;

var
  fmInvoiceListingOptions: TfmInvoiceListingOptions;

implementation

Uses Database, Main, InvoiceListing, HtmlHelpAPI, LanguageChoice,
  GlobalFunctions, DocumentsReport, PrePrinted, TcVariables, DatabaseAccess,XRoutines,
  UDMTCCoreLink;

{$R *.DFM}

procedure TfmInvoiceListingOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  if (cbDocType.Items.Count=0) then begin
   cbDocType.Items.add(GetTextLang(300));{'Invoices'}
   cbDocType.Items.add(GetTextLang(706));{'Credit Notes'}
   cbDocType.Items.add(GetTextLang(302));{'Purchases'}
   cbDocType.Items.add(GetTextLang(419));{'Goods ret'}
   cbDocType.Items.add(GetTextLang(418));{'Quotes'}
   cbDocType.Items.add(GetTextLang(798));{'Orders'}
   cbDocType.itemIndex:=0;
  end;
  GroupBox1.Caption := GetTextLang(1080)+' '+GetTextLang(2106);
  GroupBox2.Caption := GetTextLang(1080)+' '+GetTextLang(1046);
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblDocHeader.sql.Text := 'Select * from dochead where WTypeId=' +IntToStr(idDocType) ;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocHeader.IndexFieldNames := 'SDOCNO' ;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTExtLang(1120){'Document Number'});
  dbcomboxSequence.Items.Add(GetTExtLang(1121){'Document Date'});
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSDocumentReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSDocumentReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  if (dbedtFrom.Text='') or ((Sender as TControl).Name='CbDocType') then begin
    dmDatabase.tblDocHeader.First;
    dmDatabase.tblReportingOptions.FieldByName('SDocListFromNumber').AsString :=dmDatabase.tblDocHeaderSDocNo.AsString;
    dmDatabase.tblDocHeader.Last;
    dmDatabase.tblReportingOptions.FieldByName('SDocListToNumber').AsString :=dmDatabase.tblDocHeaderSDocNo.AsString;
  end;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  LoadReoprtOp;
  cbDestination.SetFocus;
  if IsDeleteMode then begin // Set Sceen to Delivery note Screen
    Caption:=GetTextLang(1087){'Delivery Note Options'};
    CbDocType.Visible:=False;
    Label1.Visible:=False;
    CheckBox2.Visible:=False;
  end;
  SetVisib;
  CheckBox2.Caption := GetTextLang(2107);
end;

procedure TfmInvoiceListingOptions.btnOkClick(Sender: TObject);
begin
 hide ;
 try
   SaveReoprtOp;
  // This append, Why ? dbcomboxSequence.ItemIndex is out
//  if dbcomboxSequence.Items.IndexOf(dbcomboxSequence.Text)<>dbcomboxSequence.ItemIndex then
    dbcomboxSequence.ItemIndex:=dbcomboxSequence.Items.IndexOf(dbcomboxSequence.Text);
  //Open the table for reporting
//  dmDatabase.tblDocHeader.Open;
  //Set the index

  if dbcomboxSequence.ItemIndex  = 0 then
    dmDataBase.tblDocHeader.IndexFieldNames := 'SDocNo';
  if dbcomboxSequence.ItemIndex = 1 then
    dmDataBase.tblDocHeader.IndexFieldNames := 'DDate';

  if dbcomboxSequence.ItemIndex=2 then
    dmDatabase.tblDocHeader.IndexFieldNames := 'WREPORTINGGROUP1ID';
  if dbcomboxSequence.ItemIndex=3 then
    dmDatabase.tblDocHeader.IndexFieldNames := 'WREPORTINGGROUP2ID';
  

  //Set the filter
  dmDatabase.tblDocHeader.sql.Text := 'select * from dochead where WTypeID = '+IntTostr(idDocType);
  dmDatabase.tblDocHeader.Filter:= 'WTypeID = '+IntTostr(idDocType) ;
  dmDatabase.tblDocHeader.open ;

  if cboxUsePeriods.Checked then
    dmDatabase.tblDocHeader.Filter:=dmDatabase.tblDocHeader.Filter
       + ' and DDate >=  ''' + DateTime2DbStr(dbedtFromDate.Date)
       + ''' and DDate <=  ''' + DateTime2DbStr(dbedtToDate.Date) + ''''
  else
    dmDatabase.tblDocHeader.Filter:=dmDatabase.tblDocHeader.Filter
       + ' And   SDocNo >= ''' + dbedtFrom.Text
       + ''' and SDocNo <= ''' + dbedtTo.Text +'''';
  dmDatabase.tblDocHeader.Filtered := True;
  if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblSysVars.Open;

  if IsDeleteMode then begin
  // IsDeleteMode: Re-used to
  // Print Delirery note
    dmDatabase.tblStock.Open;
    dmDatabase.tblUnit.Open;
    qrPrePrinted := TqrPrePrinted.Create(Self);
    qrPrintDocuments := TqrPrintDocuments.Create(Self);
    try
    SetUpQrFm(qrPrintDocuments);
    while not dmDatabase.tblDocHeader.Eof do
    begin
     //
      SetSQlLine(' AND WDocID=''' +dmDatabase.tblDocHeaderWDocID.AsString+'''');
      dmDatabase.qrPrnDocLines.Open;

      if dmDatabase.tblSysVars.Active=False then
        dmDatabase.tblSysVars.Open;

      idDocType:=19;
      if dmDatabase.tblSysVarsWInvoicePaperID.Value=50 then
      begin
        DocModel:=GetDefaultDocPaperID(10);
        PrintReportProcess(cbDestination.ItemIndex,qrPrePrinted,edtCount.Text);
      end
      else
      begin
        DocModel:=GetDefaultDocPaperID(10);
        PrintReportProcess(cbDestination.ItemIndex,qrPrintDocuments,edtCount.Text);
      end;
      dmDatabase.tblDocHeader.Next;
    end;
    dmDatabase.tblStock.Close;
    dmDatabase.tblUnit.Close;
    finally
     FreeAndNil(qrPrePrinted);
     FreeAndNil(qrPrintDocuments);
    end;
  end
  else
  begin
    // Print Documents listing
    SetSQlLine('');
    dmDatabase.qrPrnDocLines.Open;
    qrInvoiceListing := TqrInvoiceListing.Create(Self);
    try
    if dbcomboxSequence.ItemIndex in [2,3] then
    begin
      case dbcomboxSequence.ItemIndex of
       3: begin
            qrInvoiceListing.QRRepGroup.Expression:='tblDocHeader.WReportingGroup2ID';
            qrInvoiceListing.QRRepGroup.Enabled:=True;
            qrInvoiceListing.qrGrFooter.Enabled:=True;
            qrInvoiceListing.QRDBgrID.DataField:='WReportingGroup2ID';
          end;
      else
        qrInvoiceListing.QRRepGroup.Expression:='tblDocHeader.WReportingGroup1ID';
        qrInvoiceListing.QRRepGroup.Enabled:=True;
        qrInvoiceListing.qrGrFooter.Enabled:=True;
        qrInvoiceListing.QRDBgrID.DataField:='WReportingGroup1ID';
      end;
    end
    else
    begin
      qrInvoiceListing.QRRepGroup.Expression:='';
      qrInvoiceListing.QRRepGroup.Enabled:=False;
      qrInvoiceListing.qrGrFooter.Enabled:=False;
    end;
    PrintReportProcess(cbDestination.ItemIndex,qrInvoiceListing,edtCount.Text);
    finally
      FreeAndNil(qrInvoiceListing);
    end;
  end;
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblDocHeader.Filtered := False;
  dmDatabase.tblDocHeader.Filter := '';
  dmDatabase.tblDocHeader.Close;
  dmDatabase.qrPrnDocLines.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  finally
    show ;
  end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmInvoiceListingOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmInvoiceListingOptions.dbcomboxOutputKeyPress(Sender: TObject;
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

procedure TfmInvoiceListingOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin

             if IsDeleteMode then
               HtmlShowTopic(153)
             else
               HtmlShowTopic(184);
             key := 0;

        end;
  if ssCtrl in Shift then
  begin
    if Key=32 then
    begin
      Key:=0;
      cboxUsePeriods.Checked :=  Not cboxUsePeriods.Checked;
    end;
  end;
        
end;

procedure TfmInvoiceListingOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmInvoiceListingOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmInvoiceListingOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmInvoiceListingOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmInvoiceListingOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmInvoiceListingOptions.CbDocTypeChange(Sender: TObject);
begin
  idDocType:=10+cbDocType.ItemIndex;
  FormShow(Sender);
  dbcomboxSequence.Setfocus;
end;

Procedure TfmInvoiceListingOptions.SetVisib;
begin
  dbedtFrom.Enabled := CheckBox1.Checked;
  dbedtTo.Enabled := CheckBox1.Checked;
  Label3.Enabled := CheckBox1.Checked;
  Label4.Enabled := CheckBox1.Checked;
  dbedtFromDate.Enabled := cboxUsePeriods.Checked;
  dbedtToDate.Enabled := cboxUsePeriods.Checked;
  Label5.Enabled := cboxUsePeriods.Checked;
  Label6.Enabled := cboxUsePeriods.Checked;
end;

procedure TfmInvoiceListingOptions.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked=cboxUsePeriods.Checked then
    cboxUsePeriods.Checked:=Not cboxUsePeriods.Checked;
  SetVisib;
end;

procedure TfmInvoiceListingOptions.cboxUsePeriodsClick(Sender: TObject);
begin
  if CheckBox1.Checked=cboxUsePeriods.Checked then
    CheckBox1.Checked:=Not CheckBox1.Checked;
  SetVisib;    
end;


Procedure TfmInvoiceListingOptions.LoadReoprtOp;
begin
  CheckBox2.Checked := ReadReportOp('BDocList',False).AsBoolean;
end;

Procedure TfmInvoiceListingOptions.SaveReoprtOp;
begin
  WriteReportOp('BDocList',Bool2Str(CheckBox2.Checked));
end;


end.
