(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReconOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask, wwdbdatetimepicker,
  Buttons, ComCtrls,DatabaseAccess, DB, ZAbstractRODataset,
  ZAbstractDataset, DBAccess , Uni;

type
  TfmReconOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BtnOk: TBitBtn;
    DSBankBook: TDataSource;
    QbankLastBooking: TuniQuery;
    QbankLastBookingSReference: TStringField;
    QbankLastBookingDDate: TDateField;
    QbankLastBookingSDescription: TStringField;
    QbankLastBookingFAmount: TFloatField;
    QGetLastBookingsDate: TuniQuery;
    QGetLastBookingsDatemaxdate: TDateField;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dbedtBankBal: TDBEdit;
    dbdtUntilDate: TwwDBDateTimePicker;
    LCurBalance: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Refreshgrid ;
    procedure dbdtUntilDateChange(Sender: TObject);
  private
    { Private declarations }
  public
    AsaveList : TSaveClientDatasetCallList;
    { Public declarations }
  end;

var
  fmReconOptions: TfmReconOptions;
  PymtID,RcptID:String;
  vTotalUnposted:Real;
implementation

uses GlobalFunctions, Main, Database, ReconcileBank, HtmlHelpAPI,
  ReconReport, LanguageChoice,  TcVariables,
   BatchEntryBank,LedgerRoutines;

{$R *.DFM}

procedure TfmReconOptions.FormShow(Sender: TObject);
begin
//  dmDatabase.TblReconBank.Active:=False;
//  dmDatabase.TblReconBank.EmptyTable;


  dmDatabase.tblReportingOptions.Close;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := 'WAccountTypeID = 3';
  dmDatabase.tblAccount.Filtered := True;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  DBGrid1.Visible := false ;
  if idDocType=1 then
  begin
    fmReconOptions.Height:=249-TopPnl.Height;
    TopPnl.Visible:=False;
    DBLookupComboBox1.SetFocus;
  end
  else begin
    TopPnl.Visible:=True;
    // load Print Modes
    LoadPrintOutModes(cbDestination);
    cbDestination.SetFocus;
  end;
   Caption := gettextlang(2186);
   Bitprn1.Caption := gettextlang(864);////&Printer Setup
   BtnOk.Caption := gettextlang(163);
   BtnCancel.Caption := gettextlang(169);
   lblCopies.Caption := gettextlang(732);
   Label1.Caption := gettextlang(29);
   Label2.Caption := gettextlang(232);
   Label3.Caption := gettextlang(233);
   DestLbl.Caption := gettextlang(240);
      Label6.Caption := gettextlang(2234);
  if not ReadReportOp('CBViewAllBankState',true).AsBoolean then

    begin
       if idDocType <> 2 then
       begin
        dbdtUntilDate.Date :=  now ;
         Label2.Visible := false ;
         dbdtUntilDate.Visible := false ;
       end;  
      Height:= 250 ;
      DBGrid1.Visible := true; 
    end ;
  DBLookupComboBox1.SetFocus ;
  DBLookupComboBox1Click(self);
  if dbedtBankBal.CanFocus then
   dbedtBankBal.SetFocus ;
end;

procedure TfmReconOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDatabase.tblReconBank.Close;
  //dmDatabase.tblReconBank.Query.Text:='';
end;

procedure TfmReconOptions.btnOkClick(Sender: TObject);
Var
  BankAccountID:integer;
  OldName:String;
  GoRecon:Boolean;
  tmpInt1 : Integer;
  qrReconReport : TqrReconReport ;
begin
  writeReportOp(dmDatabase.tblAccountWAccountID.AsString+'BankBal',StringReplace(FloatToStr(dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat),DecimalSeparator,'.',[rfReplaceAll])) ;
  dmDatabase.tblReportingOptions.Post;

  BankAccountID:= dmDatabase.tblAccountWAccountID.value;
  if not ReadReportOp('CBViewAllBankState',true).AsBoolean then
  begin
  GoRecon := true ;
  dmDatabase.tblBank.Open;
  if  dmDatabase.tblBank.Locate('WAccountID', BankAccountID, []) then
  begin
    PymtID:=dmDatabase.tblBankWPaymentsID.AsString;
    RcptID:=dmDatabase.tblBankWReceiptsID.AsString;
  end;
  dmDatabase.tblBank.Close;

  end else
  begin
  dmDatabase.tblTransaction.Open;
  GoRecon := GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);
  dmDatabase.tblReconBank.Open;
  end;

  dmDatabase.tblAccount.Locate('WaccountID',BankAccountID,[]);
  if idDocType=1 then
  begin
      if Not GoRecon then
      if OSFMessageDlg(GetTextLang(491)+#13#10{'No item to reconcile'}+ GetTextLang(1054), mtconfirmation, [mbYes,mbOk], 0)=mrNo then
        GoRecon:=True;
//      begin
      if GoRecon then
      begin
        if ReadReportOp('CBViewAllBankState',true).AsBoolean then
          begin
          fmReconcileBank := TfmReconcileBank.Create(Application);
          try
            SetUpForm(fmReconcileBank);
            Visible := False;
            fmReconcileBank.ShowModal;
            finally
               Visible := True;
               FreeAndNil(fmReconcileBank);
             end;
         end else
          begin
            fmBatchEntryBank := TfmBatchEntryBank.Create(Application);
            try
            fmBatchEntryBank.paymentID := StrToInt(PymtID);

            fmBatchEntryBank.EnterdStamentAmount := dmDatabase.TblReportingOptions.FieldByName('FReconBankBalance').AsFloat ;
            fmBatchEntryBank.EnterItemsUntil   := dmDatabase.TblReportingOptions.FieldByName('DReconUntil').AsDateTime ;
            fmBatchEntryBank.ShowModal;
            finally
               FreeAndNil(fmBatchEntryBank);
             end;
         end
      end;
  end
  else
  begin
    dmDatabase.tblSysVars.Open;
    qrReconReport := TqrReconReport.Create(Self);
    try
    qrReconReport.fmReconOptions := self ;
    qrReconReport.vAccountID:=BankAccountID;
    dmDatabase.tblTransaction.Open;
    GoRecon := GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);
    // dmDatabase.tblReconBank.Open;

      if dmDatabase.RConBankTableName <> '' then
      begin
      dmdatabase.tblReconBank.Close;
      dmdatabase.tblReconBank.sql.Text:='Select * from '+dmDatabase.RConBankTableName+' Order by FDEBIT ';
      dmdatabase.tblReconBank.Open;
      end;
    qrReconReport.ViewAllBanks := ReadReportOp('CBViewAllBankState',true).AsBoolean ;
    PrintReportProcess(cbDestination.ItemIndex,qrReconReport,edtCount.Text);
     finally
      FreeAndNil(qrReconReport);
     end;
    dmDatabase.tblReportingOptions.Close;
    dmDatabase.tblSysVars.Close;
  end;
  if ReadReportOp('CBViewAllBankState',true).AsBoolean then
    fmReconOptions.Close else
    begin
    if idDocType <> 2 then
    idDocType := 1 ;
    FormShow(self);
    end;
  dmDatabase.tblBatch.Close;
end;

procedure TfmReconOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReconOptions.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.   if key = '.' then
    if sender = dbedtBankBal then
     if key = '.' then
    key :=  DecimalSeparator ;
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmReconOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             if idDocType=1 then
               HtmlShowTopic(149)
             else
               HtmlShowTopic(164);
             key := 0;

        end;

end;

procedure TfmReconOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmReconOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmReconOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmReconOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmReconOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmReconOptions.DBLookupComboBox1Click(Sender: TObject);
begin
 RefreshGrid ;
 dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat :=
 StrToFloat(StringReplace(ReadReportOp(dmDatabase.tblAccountWAccountID.AsString+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) ;
 LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,GetAccountTotal(dmDatabase.tblAccountWAccountID.AsInteger,27,3)) ;

end;

procedure TfmReconOptions.FormCreate(Sender: TObject);
begin
QbankLastBooking.Connection := dmDatabase.tblAccount.Connection ;
QGetLastBookingsDate.Connection := dmDatabase.tblAccount.Connection ;
AsaveList := TSaveClientDatasetCallList.Create;
with dmDatabase do
 begin
 AsaveList.AddclientObject(tblOpReport,false);
 AsaveList.AddclientObject(tblTransaction,false);
 AsaveList.AddclientObject(tblBank,false);
 AsaveList.AddclientObject(tblType,false);
 AsaveList.AddclientObject(tblGroups,false);
 AsaveList.AddclientObject(tblTax,false);
 end;

 DBGrid1.Columns[0].Title.Caption := GetTextLang(607);
 DBGrid1.Columns[1].Title.Caption := GetTextLang(238);
 DBGrid1.Columns[2].Title.Caption := GetTextLang(178);
 DBGrid1.Columns[3].Title.Caption := GetTextLang(1976);
end;

procedure TfmReconOptions.FormDestroy(Sender: TObject);
begin
 AsaveList.free ;
end;

procedure TfmReconOptions.Refreshgrid;
begin
QbankLastBooking.close ;
QGetLastBookingsDate.Params[0].AsInteger := dmDatabase.tblAccountWAccountID.AsInteger ;
QGetLastBookingsDate.open ;
QbankLastBooking.Params[0].AsInteger := QGetLastBookingsDate.Params[0].AsInteger ;
QbankLastBooking.Params[1].AsDate :=   QGetLastBookingsDate.Fields[0].AsDateTime ;
QbankLastBooking.open ;
QGetLastBookingsDate.close ;


end;

procedure TfmReconOptions.dbdtUntilDateChange(Sender: TObject);
begin
 if idDocType=2 then
 LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,GetAccountTotal(dmDatabase.tblAccountWAccountID.AsInteger,GetPeriod(dbdtUntilDate.Date),3)) ;
end;

end.
