(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AccountListingOptions;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls,UReportBasis;

type
  TfmAccountListingOptions = class(TFormReportOptionsBase)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbcomboxSequence: TComboBox;
    dbedtFromAccount: TEdit;
    dbedtToAccount: TEdit;
    cbFromGroup: TComboBox;
    cbToGroup: TComboBox;
    dbcboxSubAccounts: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure dbcomboxSequenceChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FromID, ToID : Integer ;    
    wbGroups1,wbGroups2 : TStringList;
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    Procedure ShowSelGroup(wbShow:Boolean);

  public
    { Public declarations }
  end;

var
  fmAccountListingOptions: TfmAccountListingOptions;
//  FromID,ToID : Integer;
implementation

uses HtmlHelpAPI, UDMTCCoreLink, OSFGeneralRoutines, osfLookup,
  UDMReportsGlobals;

{$R *.DFM}

procedure TfmAccountListingOptions.FormShow(Sender: TObject);
begin

  LoadReoprtOp;
end;

procedure TfmAccountListingOptions.btnOkClick(Sender: TObject);
{var
  Filter,
  Main1, Sub1,
  Main2, Sub2 : String;}
begin
  {Main1 := dbedtFromAccount.Text;
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
    Main1 := ZipAccountCode(dbedtFromAccount.Text);
    Main2 := ZipAccountCode(dbedtToAccount.Text);

    dmDataBase.tblAccount.IndexFieldNames := 'SDescription';
    if not dmDataBase.tblAccount.Locate('SACCOUNTCODE',Main1,[]) then
      dmDataBase.tblAccount.first;
    Main1:=dmDataBase.tblAccountSDescription.Value;
    if not dmDataBase.tblAccount.Locate('SACCOUNTCODE',Main2,[])  then
      dmDataBase.tblAccount.Last;
    Main2:=dmDataBase.tblAccountSDescription.Value;
    SwapStr(Main1,Main2);
    Filter:=Filter +' And SDescription>='''+Main1+''' And SDescription<='''+Main2+'''';
  end;
  dmDatabase.tblSysVars.Open;
  if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName1.Value then
  begin

    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup1ID';
    qrAccountListing.QRGroupBd.Height:=20;
    qrAccountListing.QRGroupBd.Expression:='tblAccount.WReportingGroup1ID';
    qrAccountListing.GroupID:=1;
    dmDatabase.tblGroups.Open;
    dmDatabase.tblGroups.First;
    if not dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([20,cbFromGroup.Text]),[]) then
      raise Exception.Create('Group not found!');
    FromID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Locate('WGroupTypeID;SDescription',VarArrayof([20,cbToGroup.Text]),[]);
    ToID := dmDatabase.tblGroupsWGroupID.Value;
    dmDatabase.tblGroups.Close;
    SwapInt(FromID,ToID);
    Filter:=Filter+' And WreportingGroup1ID>='+intToStr(FromID)+' And WreportingGroup1ID<='+intToStr(ToID)
  end;
  if dbcomboxSequence.Text = dmDatabase.tblSysVarsSACCOUNTReportName2.Value then
  begin
    dmDatabase.tblAccount.IndexFieldNames := 'WReportingGroup2ID';
    qrAccountListing.QRGroupBd.Height:=20;
    qrAccountListing.QRGroupBd.Expression:='tblAccount.WReportingGroup2ID';
    qrAccountListing.GroupID:=2;
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
  else FormShow(Sender);   }
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
             HtmlHelpShowContentID(103);
             key := 0;
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

Procedure TfmAccountListingOptions.LoadReoprtOp;
begin
  dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(DMTCCoreLink.ReadNwReportOp('SACCOUNTListingSequence',''));
  if dbcomboxSequence.ItemIndex<0 then
    dbcomboxSequence.ItemIndex:=0;

  FromID :=  DMTCCoreLink.ReadNwReportOp('SACCOUNTListingFromID',0);
  ToID :=  DMTCCoreLink.ReadNwReportOp('SACCOUNTListingToID',0);
  if  dbcomboxSequence.ItemIndex in [2,3,4] then
    ShowSelGroup(True)
  else
    ShowSelGroup(False);

  dbedtFromAccount.Text := TDataBaseRoutines.AddDashInAccCodeNoPRefix(TDataBaseRoutines.GetAccountCode(FromID));
  dbedtToAccount.Text := TDataBaseRoutines.AddDashInAccCodeNoPRefix(TDataBaseRoutines.GetAccountCode(ToID));

  dbcboxSubAccounts.Checked := DMTCCoreLink.ReadNwReportOp('BAccountListingSubAcc',false) ;
  cbFromGroup.itemindex := cbFromGroup.items.indexOf(DMTCCoreLink.ReadnwReportOp('BAccountFormGroups','0') );
  cbToGroup.itemindex := cbToGroup.items.indexOf(DMTCCoreLink.ReadnwReportOp('BAccountToGroups','0') );
end;

Procedure TfmAccountListingOptions.SaveReoprtOp;
begin
  DMTCCoreLink.WriteNwReportOp('SACCOUNTListingSequence',dbcomboxSequence.Text);
  DMTCCoreLink.WriteNwReportOp('SACCOUNTListingFromID',IntToStr(FromID) );
  DMTCCoreLink.WriteNwReportOp('SACCOUNTListingToID',IntToStr(ToID) ) ;
  DMTCCoreLink.WriteNwReportOp('BAccountListingSubAcc',BoolToStr(dbcboxSubAccounts.Checked,true));
  DMTCCoreLink.WriteNwReportOp('BAccountFormGroups',cbFromGroup.Text);
  DMTCCoreLink.WriteNwReportOp('BAccountToGroups',cbToGroup.Text);
end;


procedure TfmAccountListingOptions.dbcomboxSequenceChange(Sender: TObject);
begin
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
  BitBtn2.Visible := dbedtToAccount.Visible ;
  BitBtn1.Visible := dbedtToAccount.Visible ;

  Case dbcomboxSequence.ItemIndex of
  2:Begin
      cbFromGroup.Items := wbGroups2;
      cbToGroup.Items := wbGroups2;
    end;
  3 :begin
       cbFromGroup.Items := wbGroups1;
       cbToGroup.Items := wbGroups1;
     end;
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
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(DMTCCoreLink.GetTextLang(176){'Account Number'});
  dbcomboxSequence.Items.Add(DMTCCoreLink.GetTextLang(1108){'Account Description'});
  dbcomboxSequence.Items.Add(DMTCCoreLink.ReadSysVar('SACCOUNTReportName1'));
  dbcomboxSequence.Items.Add(DMTCCoreLink.ReadSysVar('SACCOUNTReportName2'));
  TDataBaseRoutines.FillStringsWithReportingGroups(wbGroups2,21);
  TDataBaseRoutines.FillStringsWithReportingGroups(wbGroups1,20);
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
  dbedtFromAccount.Color:=clHighlight;

  case dbcomboxSequence.ItemIndex of
    0 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltAccount,FromID,1);
    1 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltAccount,FromID,2);
    2 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstAccountRepGroup1,tcltAccountGroup,FromID);
    3 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstAccountRepGroup2,tcltAccountGroup,FromID);
  end;

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    FromID := DMReportsGlobals.Alookup.ReturnID ;
    dbedtFromAccount.Text := DMReportsGlobals.Alookup.ReturnLookupDesc ;
    dbedtFromAccount.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmAccountListingOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtToAccount.Color:=clHighlight;

  case dbcomboxSequence.ItemIndex of
    0 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltAccount,ToID,1);
    1 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstGLTHREE,tcltAccount,ToID,2);
    2 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstAccountRepGroup1,tcltAccountGroup,ToID,1);
    3 :  DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(608),tcstAccountRepGroup2,tcltAccountGroup,ToID,1);
  end;

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    ToID := DMReportsGlobals.Alookup.ReturnID ;
    dbedtToAccount.Text := DMReportsGlobals.Alookup.ReturnLookupDesc ;
    dbedtToAccount.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

end.

