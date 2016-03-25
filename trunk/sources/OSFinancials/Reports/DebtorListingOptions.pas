(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DebtorListingOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls,DB;

type
  TfmDebtorListingOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbcomboxSequence: TDBComboBox;
    dbedtFromAccount: TDBEdit;
    dbedtToAccount: TDBEdit;
    dbcboxShowDetail: TDBCheckBox;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
  public
    { Public declarations }
  end;

var
  fmDebtorListingOptions: TfmDebtorListingOptions;

implementation

uses Main, Database, AccountListingReport, HtmlHelpAPI, GlobalFunctions, DetailedDebtorListingReport,
  CreditorListingReport, TcVariables, DatabaseAccess, OSFGeneralRoutines;

{$R *.DFM}

procedure TfmDebtorListingOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
//  dbcomboxSequence.Items.Add('Account Number');
//  dbcomboxSequence.Items.Add('Account Description');
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});

  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(TDataBaseRoutines.GetTypeDescription(22));
  dbcomboxSequence.Items.Add(TDataBaseRoutines.GetTypeDescription(23));
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmDebtorListingOptions.btnOkClick(Sender: TObject);
var
  Main1, Main2 : String;
begin
  Main1 := ZipAccountCode(dbedtFromAccount.Text);
  Main2 := ZipAccountCode(dbedtToAccount.Text);
  // This append, Why ? dbcomboxSequence.ItemIndex is out
  dmdatabase.tblDebtor.MasterSource:=dmdatabase.dSACCOUNT;
  dmDatabase.tblAccount.Open;


  case dbcomboxSequence.ItemIndex of
  0 : dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
  1 : dmDataBase.tblAccount.IndexFieldNames := 'SDescription';
  2 : dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID' ;
  3 : dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID' ;
  end;

  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := 'SACCOUNTCODE >= ''' + Main1
                           + ''' and SACCOUNTCODE <= ''' + Main2
                           + ''' and WAccountTypeID = ''1''';
  dmDatabase.tblAccount.Filtered := True;
  if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblDebtor.Open;
 // dmDatabase.tblContact.Open;
  if dbcboxShowDetail.Checked then
  begin
    qrDetailedDebtorListing := TqrDetailedDebtorListing.Create(Self);
     try
      qrDetailedDebtorListing.UseCreditor:=False;
      PrintReportProcess(cbDestination.ItemIndex,qrDetailedDebtorListing,edtCount.Text);
     finally
      qrDetailedDebtorListing.Free;
     end;
  end
  else
  begin
//    qrDebtorListing := TqrDebtorListing.Create(Self);
    // Re-use Creditor listing report
    qrCreditorListing := TqrCreditorListing.Create(Self);
    try
    if dbcomboxSequence.ItemIndex in [2,3] then
    begin
      case dbcomboxSequence.ItemIndex of
       3: begin
            qrCreditorListing.QRRepGroup.Expression:='tblAccount.WReportingGroup2ID';
            qrCreditorListing.QRRepGroup.Enabled:=True;
//            qrInvoiceListing.qrGrFooter.Enabled:=True;
            qrCreditorListing.QRDBgrID.DataField:='WReportingGroup2ID';
          end;
      else
        qrCreditorListing.QRRepGroup.Expression:='tblAccount.WReportingGroup1ID';
        qrCreditorListing.QRRepGroup.Enabled:=True;
        qrCreditorListing.QRDBgrID.DataField:='WReportingGroup1ID';
      end;
    end
    else
    begin
      qrCreditorListing.QRRepGroup.Expression:='';
      qrCreditorListing.QRRepGroup.Enabled:=False;
    end;
    qrCreditorListing.BUseDebtors:=True;
    // Change Ds
    qrCreditorListing.QRDBText5.Dataset:=dmDatabase.tblDebtor;
    qrCreditorListing.QRDBText6.Dataset:=dmDatabase.tblDebtor;
    qrCreditorListing.QRDBText7.Dataset:=dmDatabase.tblDebtor;
    qrCreditorListing.QRDBText15.Dataset:=dmDatabase.tblDebtor;
    //
    PrintReportProcess(cbDestination.ItemIndex,qrCreditorListing,edtCount.Text);
    finally
     FreeAndNil(qrCreditorListing);
    end;
  end;

  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblDebtor.Close;
 // dmDatabase.tblContact.Open;
  dmdatabase.tblDebtor.MasterSource:=Nil;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmDebtorListingOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmDebtorListingOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmDebtorListingOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(181);
              key := 0;

        end;
end;

procedure TfmDebtorListingOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmDebtorListingOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmDebtorListingOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmDebtorListingOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmDebtorListingOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmDebtorListingOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 3);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmDebtorListingOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 3);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
