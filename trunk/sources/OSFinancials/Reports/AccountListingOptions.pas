(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AccountListingOptions;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls, wwdbedit, Wwdotdot,
  Wwdbcomb;

type
  TfmAccountListingOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcomboxSequence: TwwDBComboBox;
    dbedtFromAccount: TEdit;
    dbedtToAccount: TEdit;
    cbFromGroup: TwwDBComboBox;
    cbToGroup: TwwDBComboBox;
    dbcboxSubAccounts: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure dbcomboxSequenceChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wbGroups1,wbGroups2 : TStringList;
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    Procedure SelectTableSeq;
    Procedure ShowSelGroup(wbShow:Boolean);

  public
    { Public declarations }
  end;

var
  fmAccountListingOptions: TfmAccountListingOptions;
//  FromID,ToID : Integer;
implementation

uses Main, Lookup, Database, AccountListingReport, HtmlHelpAPI,
     GlobalFunctions, TcVariables, DatabaseAccess,LedgerRoutines,XRoutines,
  UDMTCCoreLink;

{$R *.DFM}

procedure TfmAccountListingOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  wbGroups1.Clear;
  wbGroups2.Clear;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
//  dbcomboxSequence.Items.Add('Account Number');
//  dbcomboxSequence.Items.Add('Account Description');
//  dbcomboxSequence.Items.Add('Account Type');
  dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
  dbcomboxSequence.Items.Add(GetTextLang(1109){'Account Type'});
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSACCOUNTReportName2.Value);
  dmDatabase.tblSysVars.Close;
//  dmDatabase.tblReportingOptions.Open;
//  dmDatabase.tblReportingOptions.Edit;
  // Load Groups items
  dmDatabase.tblGroups.DisableControls;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID=20 or WGroupTypeID=21';
  dmDatabase.tblGroups.Filtered:=True;
  dmDatabase.tblGroups.Open;


  wbGroups2.Add('') ;
  wbGroups1.Add('');


  While Not dmDatabase.tblGroups.Eof do
  Begin
    if dmDatabase.tblGroupsWGroupTypeID.Value=21 then
      wbGroups2.Add(dmDatabase.tblGroupsSDescription.Value)
    else
    if dmDatabase.tblGroupsWGroupTypeID.Value=20 then
      wbGroups1.Add(dmDatabase.tblGroupsSDescription.Value);
    dmDatabase.tblGroups.Next;
  end;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.EnableControls;
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmAccountListingOptions.btnOkClick(Sender: TObject);
var
  Filter,
  Main1, Sub1,
  Main2, Sub2 : String;
begin
  dmDatabase.tblSysVars.Open;
  Main1 := dbedtFromAccount.Text;
  Main2 := dbedtToAccount.Text;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='';
  //
  Filter:=' WAccountTypeID <>  1  and WAccountTypeID <>  2 ';
  dmDatabase.tblAccount.Open;
  // Create Report
  qrAccountListing := TqrAccountListing.Create(Self);
  try
  qrAccountListing.QRGroupBd.Height:=0;
  qrAccountListing.QRGroupBd.Expression:='';
  qrAccountListing.GroupID:=0;
  //
  if dbcomboxSequence.ItemIndex=0 then
  begin
    SwapStr(Main1,Main2);
    Main1 := GetMainAccountCode(dbedtFromAccount.Text );
    Sub1 := GetSubAccountCode(dbedtFromAccount.Text );
    Main2 := GetMainAccountCode(dbedtToAccount.Text );
    Sub2 := GetSubAccountCode(dbedtToAccount.Text );

    dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
    if (Main1=Main2) AND (dbcboxSubAccounts.Checked = True) then
      Filter := Filter + ' AND SACCOUNTCODE >= ''' + Main1+Sub1
                             + ''' and SACCOUNTCODE <= ''' + Main1+Sub2+''''

      else
      Filter := Filter + ' AND SMAINACCOUNTCODE >= ''' + Main1
                             + ''' and SMAINACCOUNTCODE <= ''' + Main2 +''''

  end;
  if dbcomboxSequence.ItemIndex=1 then
  begin
   SwapStr(Main1,Main2);
    Main1 := GetMainAccountCode(dbedtFromAccount.Text );
    Sub1 := GetSubAccountCode(dbedtFromAccount.Text );
    Main2 := GetMainAccountCode(dbedtToAccount.Text );
    Sub2 := GetSubAccountCode(dbedtToAccount.Text );

    dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
    if (Main1=Main2) AND (dbcboxSubAccounts.Checked = True) then
      Filter := Filter + ' AND SACCOUNTCODE >= ''' + Main1+Sub1
                             + ''' and SACCOUNTCODE <= ''' + Main1+Sub2+''''

      else
      Filter := Filter + ' AND SMAINACCOUNTCODE >= ''' + Main1
                             + ''' and SMAINACCOUNTCODE <= ''' + Main2 +''''
  end;

    if dbcomboxSequence.ItemIndex=3 then
  begin

    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID';
    qrAccountListing.QRGroupBd.Height:=20;
    qrAccountListing.QRGroupBd.Expression:='tblAccount.WReportingGroup1ID';
    qrAccountListing.GroupID:=1;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblGroups.First;
    if (Trim(cbFromGroup.Text) <> '') and (Trim(cbToGroup.Text) <> '') then
    begin
    if not dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([20,cbFromGroup.Text]),[]) then
      raise Exception.Create('Group not found!');
    FromID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([20,cbToGroup.Text]),[]);
    ToID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Close;
    SwapInt(FromID,ToID);
    Filter:=Filter+' And WreportingGroup1ID>='+intToStr(FromID)+' And WreportingGroup1ID<='+intToStr(ToID)
    end ;
  end;
  if dbcomboxSequence.ItemIndex=4 then
  begin
    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID';
    qrAccountListing.QRGroupBd.Height:=20;
    qrAccountListing.QRGroupBd.Expression:='tblAccount.WReportingGroup2ID';
    qrAccountListing.GroupID:=2;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblGroups.First;
    if (Trim(cbFromGroup.Text) <> '') and (Trim(cbToGroup.Text) <> '') then
    begin
    if not dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([21,cbFromGroup.Text]),[]) then
      raise Exception.Create('Group not found!');
    FromID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([21,cbToGroup.Text]),[]);
    ToID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Close;
    SwapInt(FromID,ToID);
    Filter:=Filter+' And WReportingGroup2ID>='+intToStr(FromID)+' And WReportingGroup2ID<='+intToStr(ToID)
    end;
  end;
  if dbcomboxSequence.ItemIndex=2 then
  begin
    dmDatabase.tblAccount.IndexFieldNames := 'WAccountTypeId';
    qrAccountListing.QRGroupBd.Height:=20;
    qrAccountListing.QRGroupBd.Expression:='tblAccount.WAccountTypeID';
    qrAccountListing.GroupID:=3;
  end;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblAccount.Filtered := False;

//  else
//    dmDatabase.tblAccount.Filter := 'SSUBACCOUNTCODE = ''000'' and SMAINACCOUNTCODE >= ''' + Main1
//                           + ''' and SMAINACCOUNTCODE <= ''' + Main2
//                           + ''' and WAccountTypeID <> ''1'' and WAccountTypeID <> ''2''';
  //
  if Not dbcboxSubAccounts.Checked then
   Filter:=Filter + ' And SSUBACCOUNTCODE = ''000''';
  dmDataBase.tblAccount.Filter:=Filter;
  dmDatabase.tblAccount.Filtered := True;
  SaveReoprtOp;
//  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblSysVars.Open;
//  qrAccountListing.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrAccountListing,edtCount.Text);
  finally
   FreeAndNil(qrAccountListing);
  end;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE';
  dmDatabase.tblGroups.Close;
  dmDatabase.tblSysVars.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmAccountListingOptions.btnCancelClick(Sender: TObject);
begin
//  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmAccountListingOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(103);
             key := 0;

        end;
end;

procedure TfmAccountListingOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmAccountListingOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
Begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmAccountListingOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmAccountListingOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmAccountListingOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmAccountListingOptions.LoadReoprtOp;
begin
  dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(ReadReportOp('SACCOUNTListingSequence').AsSTring);
  if dbcomboxSequence.ItemIndex<0 then
    dbcomboxSequence.ItemIndex:=0;
  SelectTableSeq;
  FromID :=  Str2Int(ReadReportOp('SACCOUNTListingFromID').AsString);
  ToID :=  Str2Int(ReadReportOp('SACCOUNTListingToID').AsString);
  if  dbcomboxSequence.ItemIndex in [2,3,4] then
    ShowSelGroup(True)
  else
    ShowSelGroup(False);

  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Locate('WAccountID',FromID,[]);
  dbedtFromAccount.Text := AddDashInAccCodeNoPRefix(dmDatabase.tblAccountSACCOUNTCODE.Value);
  dmDatabase.tblAccount.Locate('WAccountID',ToID,[]);
  dbedtToAccount.Text := AddDashInAccCodeNoPRefix(dmDatabase.tblAccountSACCOUNTCODE.Value);
  dmDatabase.tblAccount.Close;
  dbcboxSubAccounts.Checked := ReadReportOp('BAccountListingSubAcc').AsBoolean;
  cbFromGroup.Text:=ReadReportOp('BAccountFormGroups').AsString;
  cbToGroup.Text:=ReadReportOp('BAccountToGroups').AsString;
end;

Procedure TfmAccountListingOptions.SaveReoprtOp;
begin
  WriteReportOp('SACCOUNTListingSequence',dbcomboxSequence.Text);
  WriteReportOp('SACCOUNTListingFromID',IntToStr(FromID) );
  WriteReportOp('SACCOUNTListingToID',IntToStr(ToID) ) ;
  WriteReportOp('BAccountListingSubAcc',Bool2Str(dbcboxSubAccounts.Checked));
  WriteReportOp('BAccountFormGroups',cbFromGroup.Text);
  WriteReportOp('BAccountToGroups',cbToGroup.Text);
end;

Procedure TfmAccountListingOptions.SelectTableSeq;
begin

  Case dbcomboxSequence.ItemIndex of
  1: dmDataBase.tblAccount.IndexFieldNames := 'SDescription';
  2: dmDatabase.tblAccount.IndexFieldNames := 'WAccountTypeId';
  3: dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID';
  4: dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID'
  else
    dmDataBase.tblAccount.IndexFieldNames := 'SACCOUNTCODE'
  end;
end;

procedure TfmAccountListingOptions.dbcomboxSequenceChange(Sender: TObject);
begin
  SelectTableSeq;
  if dbcomboxSequence.ItemIndex>=2 then
    ShowSelGroup(True)
  else
    ShowSelGroup(False);
end;

Procedure TfmAccountListingOptions.ShowSelGroup(wbShow:Boolean);
begin
  cbFromGroup.Visible := wbShow;
  cbToGroup.Visible := wbShow;
  dbedtFromAccount.Visible := Not wbShow;
  dbedtToAccount.Visible:=Not wbShow;
  Case dbcomboxSequence.ItemIndex of
  2:
    Begin
      cbFromGroup.Items.Text := 'Bank '#13#10'General Ledger'#13#10'Tax';
      cbToGroup.Items.Text := cbFromGroup.Items.Text;
    end;
  4:
    Begin
      cbFromGroup.Items := wbGroups2;
      cbToGroup.Items := wbGroups2;
    end;
  else
    cbFromGroup.Items := wbGroups1;
    cbToGroup.Items := wbGroups1;
  end;
end;

procedure TfmAccountListingOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  wbGroups1.Free;
  wbGroups2.Free;
end;

procedure TfmAccountListingOptions.FormCreate(Sender: TObject);
begin
  wbGroups1 := TstringList.Create;
  wbGroups2 := TstringList.Create;
end;

procedure TfmAccountListingOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmAccountListingOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  dbedtFromAccount.Text  := CallLookup(dbedtFromAccount.Text, 1);
  dbedtFromAccount.Color := clWindow;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',VarArrayof([ZipAccountCode(dbedtFromAccount.Text),0]),[]);
  FromID:=dmDatabase.tblAccountWAccountID.Value;
  dmDatabase.tblAccount.close;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmAccountListingOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  dbedtToAccount.Text  := CallLookup(dbedtToAccount.Text, 1);
  dbedtToAccount.Color := clWindow;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Locate('SACCOUNTCODE;WAccountTypeID',VarArrayof([ZipAccountCode(dbedtToAccount.Text),0]),[]);
  ToID:=dmDatabase.tblAccountWAccountID.Value;
  dmDatabase.tblAccount.close;
  SelectNext(ActiveControl, True, True);
end;

end.
