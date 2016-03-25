(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CreditorListingOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls;

type
  TfmCreditorListingOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbcomboxSequence: TDBComboBox;
    dbedtFromAccount: TDBEdit;
    dbedtToAccount: TDBEdit;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcboxShowDetail: TDBCheckBox;
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
     Procedure LoadReoprtOp;
     Procedure SaveReoprtOp;     
  public
    { Public declarations }
  end;

var
  fmCreditorListingOptions: TfmCreditorListingOptions;

implementation

uses Main, Database, AccountListingReport, CreditorListingReport,
  HtmlHelpAPI, GlobalFunctions, DetailedDebtorListingReport, TcVariables,
  DatabaseAccess,XRoutines;

{$R *.DFM}

procedure TfmCreditorListingOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
//  dbcomboxSequence.Items.Add('Account Number');
//  dbcomboxSequence.Items.Add('Account Description');
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSCreditorReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSCreditorReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmCreditorListingOptions.btnOkClick(Sender: TObject);
var
  Main1, Main2 : String;
begin
  Main1 := ZipAccountCode(dbedtFromAccount.Text);
  Main2 := ZipAccountCode(dbedtToAccount.Text);
  dmdatabase.tblCreditor.MasterSource:=dmdatabase.dSACCOUNT;

  case dbcomboxSequence.ItemIndex of
  0 : dmDataBase.tblAccount.IndexFieldNames := 'SAccountCode';
  1 : dmDataBase.tblAccount.IndexFieldNames := 'SDescription';
  2 : dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID' ;
  3 : dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID' ;
  end;

  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := 'SACCOUNTCODE >= ''' + Main1
                           + ''' and SACCOUNTCODE <= ''' + Main2
                           + ''' and WAccountTypeID = ''2''';
  dmDatabase.tblAccount.Filtered := True;
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblCreditor.Open;
   dmDatabase.tblAccount.open ;
  if dbcboxShowDetail.Checked then
  begin
    qrDetailedDebtorListing := TqrDetailedDebtorListing.Create(Self);
     try
      qrDetailedDebtorListing.UseCreditor:=True;
      PrintReportProcess(cbDestination.ItemIndex,qrDetailedDebtorListing,edtCount.Text);
      finally
       FreeAndNil(qrDetailedDebtorListing);
      end;
  end
  else
  begin
    qrCreditorListing := TqrCreditorListing.Create(Self);
    try
    if dbcomboxSequence.ItemIndex in [2,3] then
      begin
        case dbcomboxSequence.ItemIndex of
         3: begin
              qrCreditorListing.QRRepGroup.Expression:='tblAccount.WReportingGroup2ID';
              qrCreditorListing.QRRepGroup.Enabled:=True;
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
  //  qrCreditorListing.Preview;
    PrintReportProcess(cbDestination.ItemIndex,qrCreditorListing,edtCount.Text);
    finally
     FreeAndNil(qrCreditorListing);
    end;
  end;

  dmDataBase.tblAccount.IndexFieldNames := 'SAccountCode';
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblCreditor.Close;
  dmdatabase.tblCreditor.MasterSource:=Nil;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmCreditorListingOptions.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmCreditorListingOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmCreditorListingOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             HtmlShowTopic(171);
             key := 0;
        end;
end;

procedure TfmCreditorListingOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmCreditorListingOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmCreditorListingOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmCreditorListingOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmCreditorListingOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmCreditorListingOptions.SaveReoprtOp;
begin
  WriteReportOp('BCrtlistingShowDetails',Bool2Str(dbcboxShowDetail.Checked));
end;

Procedure TfmCreditorListingOptions.LoadReoprtOp;
begin
  dbcboxShowDetail.Checked := ReadReportOp('BCrtlistingShowDetails').AsBoolean;
end;

procedure TfmCreditorListingOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtFromAccount.Text, 4);
  if ReturnLookup <> 'ESC' then
    dbedtFromAccount.Text := ReturnLookup;
  dbedtFromAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCreditorListingOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(dbedtToAccount.Text, 4);
  if ReturnLookup <> 'ESC' then
    dbedtToAccount.Text := ReturnLookup;
  dbedtToAccount.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
