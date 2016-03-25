(*
  Id: UAccountTreeView.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UAccountTreeView2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni, Grids, DBGrids,osfLookup,TcashClasses,
  Menus, USQLHolder;

type


 TBalansViewerControl = class(TStringGrid)
  private
    { Private declarations }
  protected
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
              AState: TGridDrawState); override;
  public

  published
    { Published declarations }
  end;
  TAccountTreeView2 = class(TForm)
    ZQTotalsAccounts: TuniQuery;
    ZQTotalsAccountsSACCOUNTCODE: TStringField;
    ZQTotalsAccountsSDESCRIPTION: TStringField;
    ZQTotalsAccountsWACCOUNTID: TIntegerField;
    ZQTotalsAccountsWACCOUNTTYPEID: TIntegerField;
    ZQTotalsAccountsWREPORTINGGROUP1ID: TIntegerField;
    ZQTotalsAccountsWREPORTINGGROUP2ID: TIntegerField;
    ZQTotalsAccountsBSUBACCOUNTS: TSmallintField;
    ZQTotalsAccountsBINCOMEEXPENSE: TSmallintField;
    ZQTotalsAccountsBOPENITEM: TSmallintField;
    ZQTotalsAccountsBINACTIVE: TSmallintField;
    ZQTotalsAccountsDSYSDATE: TDateTimeField;
    DataSource1: TDataSource;
    ZQDebtors: TuniQuery;
    ZQCreditors: TuniQuery;
    ZQDebtorsSACCOUNTCODE: TStringField;
    ZQDebtorsSDESCRIPTION: TStringField;
    ZQDebtorsWACCOUNTID: TIntegerField;
    ZQDebtorsWACCOUNTTYPEID: TIntegerField;
    ZQDebtorsWREPORTINGGROUP1ID: TIntegerField;
    ZQDebtorsWREPORTINGGROUP2ID: TIntegerField;
    ZQDebtorsBSUBACCOUNTS: TSmallintField;
    ZQDebtorsBINCOMEEXPENSE: TSmallintField;
    ZQDebtorsBOPENITEM: TSmallintField;
    ZQDebtorsBINACTIVE: TSmallintField;
    ZQDebtorsDSYSDATE: TDateTimeField;
    ZQDebtorsTOTAAL: TFloatField;
    ZQCreditorsSACCOUNTCODE: TStringField;
    ZQCreditorsSDESCRIPTION: TStringField;
    ZQCreditorsWACCOUNTID: TIntegerField;
    ZQCreditorsWACCOUNTTYPEID: TIntegerField;
    ZQCreditorsWREPORTINGGROUP1ID: TIntegerField;
    ZQCreditorsWREPORTINGGROUP2ID: TIntegerField;
    ZQCreditorsBSUBACCOUNTS: TSmallintField;
    ZQCreditorsBINCOMEEXPENSE: TSmallintField;
    ZQCreditorsBOPENITEM: TSmallintField;
    ZQCreditorsBINACTIVE: TSmallintField;
    ZQCreditorsDSYSDATE: TDateTimeField;
    ZQCreditorsTOTAAL: TFloatField;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    LProffitloss: TLabel;
    LLProffitloss: TLabel;
    LlTotbal: TLabel;
    LTotalBalans: TLabel;
    TVMain: TTreeView;
    PopupMenu1: TPopupMenu;
    Showdetails1: TMenuItem;
    ZQTotalsAccountsWLINKACCOUNT: TIntegerField;
    ControlBar1: TControlBar;
    ZQGetPeriods: TuniQuery;
    ZQGetPeriodsDSTARTDATE: TDateTimeField;
    ZQGetPeriodsDENDDATE: TDateTimeField;
    ZQGetPeriodsSDESCRIPTION: TStringField;
    ZQGetPeriodsWPERIODID: TIntegerField;
    ZQTotalsList: TuniQuery;
    TSetToLastColumn: TTimer;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    LGroup: TLabel;
    LReportType: TLabel;
    BCreate: TButton;
    dbcboxIncOpeningBalance: TCheckBox;
    BExport: TButton;
    CBBuget: TCheckBox;
    CBType: TComboBox;
    CBHideNilBal: TCheckBox;
    CBGroup: TComboBox;
    cbIncDebtorsCreditors: TCheckBox;
    dbcboxOnlyOpeningBalance: TCheckBox;
    Label3: TLabel;
    CBFromPeriode: TComboBox;
    rgPEriode: TRadioGroup;
    Label5: TLabel;
    cbCostGroup1: TComboBox;
    ZQGen: TuniQuery;
    ZQTrnBalance: TuniQuery;
    sqlWithopeningbal: TSQLHOLDER;
    sqlBetween: TSQLHOLDER;
    sqlDebCredWithopen: TSQLHOLDER;
    sqldebcredPeriod: TSQLHOLDER;
    ZQTrnDebCred: TuniQuery;
    procedure BCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TVMainCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TVMainDblClick(Sender: TObject);
    procedure ColumnBalansClick(Sender: TObject);
    procedure BExportClick(Sender: TObject);
    procedure CBBugetClick(Sender: TObject);
    procedure ZQTotalsAccountsBeforeOpen(DataSet: TDataSet);
    procedure spShowViewClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbcboxIncOpeningBalanceClick(Sender: TObject);
    procedure CBGroupChange(Sender: TObject);
    procedure edtFromDateChange(Sender: TObject);
    procedure edtToDateChange(Sender: TObject);
    procedure dbcboxOnlyOpeningBalanceClick(Sender: TObject);
    procedure CBHideNilBalClick(Sender: TObject);
    procedure TSetToLastColumnTimer(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure rgPEriodeClick(Sender: TObject);
  private
    LedgerCalculationClass : TOSFLedgerCalculationClass ;
    procedure RecurceTree(AItem : TOSFLedgerItem ;GroupType : Integer);
    procedure BuildTree(ANode : TTreeNode ;AItem : TOSFLedgerItem );
    procedure ShowToAndFromInGui;
    procedure LoadReportOp;
    procedure SaveReportOp;
    procedure CreateColumnBalans ;
    { Private declarations }
  public
      FromDate , ToDate : TDateTime ;
    Lookup : TosfLookup ;
    sgColumnBalans : TBalansViewerControl ;
    HasChanges : Boolean ;
    MyFormat : String ;
    procedure HandelImageIndexOnTreeNode(ATreeNode : TTReeNode );
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines, StrUtils,
  TAccountView,shellapi, Math, DateUtils, NewProgress, Types;

{$R *.dfm}


Procedure  TAccountTreeView2.RecurceTree(AItem : TOSFLedgerItem ;GroupType : Integer ) ;
Var
  AQuery : TuniQuery ;
  ALedgerItem : TOSFLedgerItem ;
  ExtraSql : String ;
begin
  AQuery := TuniQuery.create(nil) ;
   try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    // if its root its 0 but we need to include the parent id is null
    ExtraSql := '' ;
    if AItem.Group1 = 0 then ExtraSql := ' or WParentGroup2ID is null ';
    // back cast to integer( if its root it wil be 0);
    AQuery.sql.Text := format('Select * From Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo ',[IntToStr(GroupType),IntToStr(AItem.Group1),ExtraSql]);
    AQuery.open ;
    while not AQuery.Eof do
      begin
       //  done : Pieter Just remeber the ID in the data property by casting it to Tobject
       ALedgerItem := TOSFLedgerItem(AItem.NesteldNodes.Add(AItem));

       ALedgerItem.Name := AQuery.FieldByName('SDescription').AsString;
       ALedgerItem.IsGroupNode := true ;
       ALedgerItem.Group1 := AQuery.FieldByName('WGroupID').AsInteger;
       ALedgerItem.GroupType := GroupType ;
       ALedgerItem.GroupColor := AQuery.FieldByName('WTEXTCOLOR').AsInteger ;
       ALedgerItem.GroupBgColor := AQuery.FieldByName('WCOLOR').AsInteger ;
       ALedgerItem.SortNo := AQuery.FieldByName('WSORTNO').AsInteger;
       ALedgerItem.FinancialCategory := AQuery.FieldByName('WParentGroup1ID').AsInteger;

       // recursion
 
       RecurceTree(ALedgerItem,GroupType);
       AQuery.next ;
      end;
   finally
     AQuery.free ;
   end;
end;


procedure TAccountTreeView2.BCreateClick(Sender: TObject);
  var
   
     Year : Integer ;
procedure HandelDropdown ;
 var

  i , Maanden : integer ;
begin
   Maanden := -12 ;
  if rgPEriode.ItemIndex =1 then
   Maanden := -1 ;
  if rgPEriode.ItemIndex =2 then
   Maanden := -3 ;

   if (Maanden = -1)  then
     FromDate := TDataBaseRoutines.GetPeriodStartDate(26)
  else
   if (Maanden = -3) then
     FromDate := TDataBaseRoutines.GetPeriodStartDate(23)
  else
  FromDate := TDataBaseRoutines.GetPeriodStartDate(14);

  Year := 0 ;


   for i := 1 to CBFromPeriode.ItemIndex do
     begin
       FromDate := IncMonth(FromDate,Maanden) ;
       if Maanden = -1 then
         if i > 12 then
           year := 1 else
       if Maanden = -3 then
         if i > 4 then
           year := 1 else
       if Maanden = -12 then
          year := 1 ;
     end;

   ToDate :=  IncMonth(FromDate,-Maanden)-1 ;
  end;

var
  OrgNode : TTReeNode ;
  ALedgerItem,Root,DebNode,TempNode: TOSFLedgerItem ;
  DebtorAccount,CreditorAccount,Proffitlosslastyear,OldGroup : Integer ;
  WhereClause,params  : String ;
  GroupId : Integer ;
  ATotal : Double ;
  AProgress : TfmNewProgress ;


begin
 self.Enabled := false ;
   AProgress := TfmNewProgress.Create(nil) ;
   try
   AProgress.BtnStop.Visible := true ;
   HandelDropdown ;
  if CBType.ItemIndex > 2 then
  begin
    CreateColumnBalans ;
    HasChanges := false ;
    Application.ProcessMessages ;
    TSetToLastColumn.Enabled := true ;
    exit ;
  end else
  begin
   sgColumnBalans.Visible := false ;
   TVMain.Visible := True ;
   LLProffitloss.Visible := True ;
   LlTotbal.Visible := True ;
   LProffitloss.Visible := True ;
   LTotalBalans.Visible := True ;
  end;

  DebtorAccount :=  DMTCCoreLink.DebtorsControlAccountid;
  CreditorAccount := DMTCCoreLink.CreditorsControlAccountid;
  Proffitlosslastyear := DMTCCoreLink.RetaindIncomeControlAccountid ;

  TVMain.items.BeginUpdate;
  try
  TVMain.Items.Clear;
  LedgerCalculationClass.clear ;

  OrgNode := TVMain.Items.Add(Nil,DMTCCoreLink.GetTextLang(1847) +'                                                  '+
   '                                                                                                 ' +
   '                                                                                                 ' +
   '                                                                                                 ');
 
  root := TOSFLedgerItem(LedgerCalculationClass.Add(nil));
  root.Name := DMTCCoreLink.GetTextLang(1847) ;
  root.IsGroupNode := true ;
  root.Group1 := 0 ;
  GroupId := 20 ;
  if CBGroup.ItemIndex = 1 then
  GroupId := 21 ;
  if CBGroup.ItemIndex <> 2 then
  RecurceTree(root,GroupId);
 // root.Node := OrgNode ;
  OrgNode.Data := Pointer(root) ;
  if CBBuget.Checked then
    begin
         WhereClause := 'where (WPeriodId >= ' + IntToStr(TDataBaseRoutines.GetPeriodFromDate(FromDate)) + ' or WperiodId = 0 or WperiodId is null)  and (WPeriodId <= ' + IntToStr(TDataBaseRoutines.GetPeriodFromDate(ToDate)) + ' or WperiodId is null) and (BActual = 0 or BActual is null) and (Account.Waccountid <> 0) ';
    end else
    begin
     {   if dbcboxIncOpeningBalance.Checked and dbcboxIncOpeningBalance.Visible then
         begin
          if year = 1 then
             WhereClause := 'where (WPeriodId >= ' + IntToStr(FromID) + ' or WperiodId = -1 or WperiodId is null)  and (WPeriodId <= ' + IntToStr(ToID) + ' or WperiodId is null) and (BActual = 1 or BActual is null) and (Account.Waccountid <> 0)'
             else
             WhereClause := 'where (WPeriodId >= ' + IntToStr(FromID) + ' or WperiodId = 0 or WperiodId is null)  and (WPeriodId <= ' + IntToStr(ToID) + ' or WperiodId is null) and (BActual = 1 or BActual is null) and (Account.Waccountid <> 0)';
          // only openbal
          if dbcboxOnlyOpeningBalance.Checked then
             begin
          if year = 1 then
                 WhereClause := 'where (WPeriodId  = -1 or WperiodId is null) and (BActual = 1 or BActual is null) and (Account.Waccountid <> 0)'
                 else
                 WhereClause := 'where (WPeriodId  = 0 or WperiodId is null)  and (BActual = 1 or BActual is null) and (Account.Waccountid <> 0)';

             end;
         end
        else
        begin
        WhereClause := 'where (WPeriodId >= ' + IntToStr(FromID) + ' and WPeriodId <= ' + IntToStr(ToID) + ' or WPeriodID is null) and (BActual = 1 or BActual is null) and (Account.Waccountid <> 0)' ;
        end;  }

        WhereClause := 'where Account.Waccountid <> 0  ';

   end;


  ZQTotalsAccounts.close ;
  ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (0,3,4)','^') + ' order by Saccountcode' ;
  ZQTotalsAccounts.Open ;

  params := 'SQL='+ #13+#10+'PROFLOSS='+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)
   + #13+#10 + 'DEB=' +    IntToStr(DMTCCoreLink.DebtorsControlAccountid)  + #13+#10 + 'CRED=' +   IntToStr(DMTCCoreLink.CreditorsControlAccountid) ;


  if dbcboxIncOpeningBalance.Checked and dbcboxIncOpeningBalance.Visible then
  begin
   ZQTrnBalance.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqlWithopeningbal.sql.text,params);
   if  not dbcboxOnlyOpeningBalance.Checked then
      begin
        ZQTrnBalance.ParamByName('todate1').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('todate2').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('todate3').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('todate4').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('todate5').AsDate := FromDate -1 ;

        ZQTrnBalance.ParamByName('itodate1').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('itodate2').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('itodate3').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('itodate4').AsDate := ToDate ;
        ZQTrnBalance.ParamByName('itodate5').AsDate := FromDate  ;

        ZQTrnBalance.ParamByName('fromdate1').AsDate := FromDate ;
      end else
      begin
        ZQTrnBalance.ParamByName('todate1').AsDate := FromDate -1;
        ZQTrnBalance.ParamByName('todate2').AsDate := FromDate -1 ;
        ZQTrnBalance.ParamByName('todate3').AsDate := FromDate -1 ;
        ZQTrnBalance.ParamByName('todate4').AsDate := FromDate -1 ;
        ZQTrnBalance.ParamByName('todate5').AsDate := FromDate -1;
        ZQTrnBalance.ParamByName('fromdate1').AsDate := FromDate ;

        ZQTrnBalance.ParamByName('itodate1').AsDate := FromDate ;
        ZQTrnBalance.ParamByName('itodate2').AsDate := FromDate ;
        ZQTrnBalance.ParamByName('itodate3').AsDate := FromDate ;
        ZQTrnBalance.ParamByName('itodate4').AsDate := FromDate ;
        ZQTrnBalance.ParamByName('itodate5').AsDate := FromDate  ;

      end;
  end else
  begin
     ZQTrnBalance.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqlBetween.sql.text,params);
     ZQTrnBalance.ParamByName('todate1').AsDate := ToDate ;
     ZQTrnBalance.ParamByName('todate2').AsDate := ToDate ;
     ZQTrnBalance.ParamByName('todate3').AsDate := ToDate ;
     ZQTrnBalance.ParamByName('todate4').AsDate := ToDate ;
     ZQTrnBalance.ParamByName('todate5').AsDate := ToDate ;
     ZQTrnBalance.ParamByName('fromdate1').AsDate := FromDate ;
     ZQTrnBalance.ParamByName('fromdate2').AsDate := FromDate ;
     ZQTrnBalance.ParamByName('fromdate3').AsDate := FromDate ;
     ZQTrnBalance.ParamByName('fromdate4').AsDate := FromDate ;
     ZQTrnBalance.ParamByName('fromdate5').AsDate := FromDate ;
  end;


    if dbcboxIncOpeningBalance.Checked and dbcboxIncOpeningBalance.Visible then
  begin
   ZQTrnDebCred.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqlDebCredWithopen.sql.text,'SQL=');
   if not dbcboxOnlyOpeningBalance.Checked then
      begin
        ZQTrnDebCred.ParamByName('todate1').AsDate := ToDate ;
        ZQTrnDebCred.ParamByName('todate2').AsDate := ToDate ;
      end else
      begin
        ZQTrnDebCred.ParamByName('todate1').AsDate := fromdate -1 ;
        ZQTrnDebCred.ParamByName('todate2').AsDate := fromdate -1 ;
      end;
  end else
  begin
     ZQTrnDebCred.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqldebcredPeriod.sql.text,'SQL=');
     ZQTrnDebCred.ParamByName('todate1').AsDate := ToDate ;
     ZQTrnDebCred.ParamByName('todate2').AsDate := ToDate ;
     ZQTrnDebCred.ParamByName('fromdate1').AsDate := FromDate ;
     ZQTrnDebCred.ParamByName('fromdate2').AsDate := FromDate ;
  end;


  AProgress.initProgress('Calculating',ZQTotalsAccounts.RecordCount);
  ZQTrnBalance.open ;
  ZQTrnDebCred.Open ;
  Application.ProcessMessages ;
  while not ZQTotalsAccounts.Eof do
     begin
       AProgress.SetProgress('',ZQTotalsAccounts.RecNo);
       if AProgress.bStop then
          Raise Exception.Create('User stop!');
       Application.ProcessMessages ;

       ALedgerItem := nil ;
        // find root
        if CBGroup.ItemIndex = 1 then
         begin
         ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP2ID.AsInteger)  ;
         end ;
        if CBGroup.ItemIndex = 0 then
         begin
          ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger)  ;
         end;

         //subaccounts
         if  ZQTotalsAccountsWACCOUNTID.AsInteger <> ZQTotalsAccountsWLINKACCOUNT.AsInteger then
           begin
              // sub account
              ALedgerItem :=  root.FindOnAccountId(ZQTotalsAccountsWLINKACCOUNT.AsInteger);
            // check to see if order is on group
            if ALedgerItem <> nil then
                if CBGroup.ItemIndex =0 then
                   if ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger <> ALedgerItem.Group1ID then
                     begin
                     // find on group
                       ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger)  ;
                    end ;
            // check to see if order is on group
            if ALedgerItem <> nil then
                if CBGroup.ItemIndex =1 then
                   if ZQTotalsAccountsWREPORTINGGROUP2ID.AsInteger <> ALedgerItem.Group2ID then
                     begin
                     // find on group
                       ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP2ID.AsInteger)  ;
                    end ;

           end;

        if ALedgerItem = nil then ALedgerItem := root ;
        TempNode := ALedgerItem ;
        ALedgerItem := TOSFLedgerItem(ALedgerItem.NesteldNodes.add(ALedgerItem)) ;
        ALedgerItem.GroupType := TempNode.GroupType ;
        ALedgerItem.Group1         :=  TempNode.Group1 ;
        ALedgerItem.Name := ZQTotalsAccountsSDESCRIPTION.AsString ;
        ALedgerItem.Accountcode := ZQTotalsAccountsSACCOUNTCODE.AsString ;
        ALedgerItem.AccountID := ZQTotalsAccountsWACCOUNTID.AsInteger ;
        ALedgerItem.LedgerType :=  ZQTotalsAccountsWACCOUNTTYPEID.AsInteger ;
        ALedgerItem.IncomeExpence :=  ZQTotalsAccountsBINCOMEEXPENSE.AsInteger = 1 ;
        ALedgerItem.SubAccounts  :=  ZQTotalsAccountsBSUBACCOUNTS.AsInteger = 1 ;
        ALedgerItem.SubAccountCode  :=  Copy(ZQTotalsAccountsSACCOUNTCODE.AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZQTotalsAccountsBOPENITEM.AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZQTotalsAccountsBINACTIVE.AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZQTotalsAccountsDSYSDATE.AsDateTime ;
        if ZQTrnBalance.Locate('WACCOUNTID',ZQTotalsAccountsWACCOUNTID.AsInteger,[]) then
                 ALedgerItem.Total          :=  ZQTrnBalance.fields[1].AsFloat else
                 begin
                 ALedgerItem.Total := 0 ;
                 if  ALedgerItem.SubAccounts then
                 ALedgerItem.ForceRecurse := True; 
                 end;

        if ALedgerItem.IncomeExpence then
          ALedgerItem.ProffitLoss := ALedgerItem.Total  else
          ALedgerItem.Balans := ALedgerItem.Total ;
        if ALedgerItem.AccountID = DebtorAccount then
        ALedgerItem.ControlAccountType := 1 ;
        if ALedgerItem.AccountID = CreditorAccount then
        ALedgerItem.ControlAccountType := 2 ;
        if ALedgerItem.AccountID = Proffitlosslastyear then
        ALedgerItem.ControlAccountType := 3 ;
        ZQTotalsAccounts.next ;
     end;
  ZQTotalsAccounts.Close ;


  DebNode := root.FindOnAccountId(DebtorAccount)  ;
  if DebNode = nil then DebNode := root ;
  ZQDebtors.close ;
  ZQDebtors.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID = 1','^') ;
  OldGroup := DebNode.Group1 ;
  DebNode.Group1 := 0 ;
  GroupId := 22  ;
  if CBGroup.ItemIndex = 1 then
  GroupId := 23 ;
  if cbIncDebtorsCreditors.Checked then
  begin
  ZQDebtors.Open ;
  RecurceTree(DebNode,GroupId);
  DebNode.Group1 := OldGroup ;

  while not ZQDebtors.Eof do
     begin
       ALedgerItem := nil ;
        // find root
        if CBGroup.ItemIndex = 1 then
         begin
         ALedgerItem :=  DebNode.FindOnGroupId(ZQDebtorsWREPORTINGGROUP2ID.AsInteger)  ;
         end else
         if CBGroup.ItemIndex = 0 then
         begin
          ALedgerItem := DebNode.FindOnGroupId(ZQDebtorsWREPORTINGGROUP1ID.AsInteger)  ;
         end;

        if ALedgerItem = nil then ALedgerItem := DebNode ;
        TempNode :=  ALedgerItem ;
        ALedgerItem := TOSFLedgerItem(ALedgerItem.NesteldNodes.add(ALedgerItem)) ;
        ALedgerItem.GroupType := TempNode.GroupType ;
        ALedgerItem.Group1         :=  TempNode.Group1 ;
        ALedgerItem.Name := ZQDebtorsSDESCRIPTION.AsString ;
        ALedgerItem.Accountcode := ZQDebtorsSACCOUNTCODE.AsString ;
        ALedgerItem.AccountID := ZQDebtorsWACCOUNTID.AsInteger ;
        ALedgerItem.LedgerType :=  ZQDebtorsWACCOUNTTYPEID.AsInteger ;
        ALedgerItem.IncomeExpence := false ;   
        ALedgerItem.SubAccounts  :=  false ;
        ALedgerItem.SubAccountCode  :=  Copy(ZQDebtorsSACCOUNTCODE.AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZQDebtorsBOPENITEM.AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZQDebtorsBINACTIVE.AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZQDebtorsDSYSDATE.AsDateTime ;
        if ZQTrnDebCred.Locate('WACCOUNTID',ZQDebtorsWACCOUNTID.AsInteger,[]) then
              ALedgerItem.Total          :=  ZQTrnDebCred.fields[1].AsFloat
              else
              ALedgerItem.Total := 0 ;


        ALedgerItem.Balans := ALedgerItem.Total ;

        ZQDebtors.next ;
     end;
  ZQDebtors.Close ;


  DebNode := root.FindOnAccountId(CreditorAccount)  ;

  if DebNode = nil then DebNode := root ;
  ZQCreditors.close ;
  ZQCreditors.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID = 2','^') ;
  ZQCreditors.Open ;
  OldGroup := DebNode.Group1 ;
  DebNode.Group1 := 0 ;
  GroupId := 24 ;
  if CBGroup.ItemIndex = 1 then
  GroupId := 25 ;
  RecurceTree(DebNode,GroupId);
  DebNode.Group1 := OldGroup ;
  while not ZQCreditors.Eof do
     begin
         // find root

       if CBGroup.ItemIndex = 1 then
        begin
          ALedgerItem := DebNode.FindOnGroupId(ZQCreditorsWREPORTINGGROUP2ID.AsInteger)  ;
        end else
        begin
           ALedgerItem := DebNode.FindOnGroupId(ZQCreditorsWREPORTINGGROUP1ID.AsInteger)  ;
        end;

        if ALedgerItem = nil then ALedgerItem := DebNode ;

        TempNode :=  ALedgerItem ;
        ALedgerItem := TOSFLedgerItem(ALedgerItem.NesteldNodes.add(ALedgerItem)) ;
        ALedgerItem.GroupType := TempNode.GroupType ;
        ALedgerItem.Group1         :=  TempNode.Group1 ;
        ALedgerItem.Name := ZQCreditorsSDESCRIPTION.AsString ;
        ALedgerItem.Accountcode := ZQCreditorsSACCOUNTCODE.AsString ;
        ALedgerItem.AccountID := ZQCreditorsWACCOUNTID.AsInteger ;
        ALedgerItem.LedgerType :=  ZQCreditorsWACCOUNTTYPEID.AsInteger ;
        ALedgerItem.IncomeExpence := false ;
        ALedgerItem.SubAccounts  :=  false ;
        ALedgerItem.SubAccountCode  :=  Copy(ZQCreditorsSACCOUNTCODE.AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZQCreditorsBOPENITEM.AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZQCreditorsBINACTIVE.AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZQCreditorsDSYSDATE.AsDateTime ;
        if ZQTrnDebCred.Locate('WACCOUNTID',ZQCreditorsWACCOUNTID.AsInteger,[]) then
              ALedgerItem.Total          :=  ZQTrnDebCred.fields[1].AsFloat
              else
              ALedgerItem.Total := 0 ;

        ALedgerItem.Balans :=      ALedgerItem.Total ;

        ZQCreditors.next ;
     end;
  ZQCreditors.Close ;

  end;
  root.CalculateGroups ;
  root.CalculateBalans ;
  BuildTree(OrgNode,Root);
  ATotal := Root.CalculateProffitLoss ;
  if ATotal < 0 then
  LProffitloss.Caption := 'C'+FormatFloat(MyFormat,-ATotal)
  else
  LProffitloss.Caption := 'D'+FormatFloat(MyFormat,ATotal);

  ATotal := Root.CalculateBalans ;
  if ATotal < 0 then
  LTotalBalans.Caption := 'C'+FormatFloat(MyFormat,-ATotal)
  else
  LTotalBalans.Caption := 'D'+FormatFloat(MyFormat,ATotal);

  finally
  TVMain.items.EndUpdate;
  end;

  if CBHideNilBal.Checked then
   OrgNode.Expand(True)
  else
   OrgNode.Expand(false);

   finally
     AProgress.free ;
     self.Enabled := True ;
   end;
   HasChanges := false ;
end;


procedure TAccountTreeView2.FormCreate(Sender: TObject);
var
 i :  Integer ;
begin
sgColumnBalans := TBalansViewerControl.Create(self) ;
sgColumnBalans.BiDiMode := bdRightToLeft ;
sgColumnBalans.Visible := false ;
sgColumnBalans.Parent := self ;
TDataBaseRoutines.FillStringsWithReportingGroups(cbCostGroup1.Items,1002) ;

LedgerCalculationClass := TOSFLedgerCalculationClass.Create(self,TOSFLedgerItem) ;
DMTCCoreLink.AssignConnectionToChilds(self);
lookup := TOsfLookup.Create(self) ;
lookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
lookup.aOSAConnectionItem := DMTCCoreLink.TheOSAConnectionItem ;
MyFormat := '0.' ;
For i :=  1 to StrToIntDef(VarToStr(DMTCCoreLink.ReadNwReportOp('WDataEntryNbrQty','2')),0) do
  begin
    MyFormat := MyFormat + '0'; 
  end;
end;

procedure TAccountTreeView2.FormDestroy(Sender: TObject);
begin

 LedgerCalculationClass.free ;
 lookup.free ;

end;


procedure TAccountTreeView2.TVMainCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  Var
   ARect,NodeRect : TRect ;
   AValue : Double ;
   ChildDeep : Integer ;
   ANode : TTreeNode ;
begin
{   if cdsSelected in State then
    begin
      Font.Color := clWhite;
      Brush.Color := clBlue;
    end;  }





  ARect := node.DisplayRect(true);
 // TVMain.Canvas.TextOut(ARect.Left+ 40,aRect.Top,TOSFLedgerItem(Node.Data).GetAccountText);
  if CBType.ItemIndex =1 then
     AValue :=  TOSFLedgerItem(Node.Data).ProffitLoss
     else
  if CBType.ItemIndex =2 then
     AValue :=  TOSFLedgerItem(Node.Data).Total
     else
     AValue :=  TOSFLedgerItem(Node.Data).Total ;

  ChildDeep := 0 ;
  ANode := Node.Parent ;
  while ANode <> nil do
    begin
      inc(ChildDeep);
      ANode := ANode.Parent ;
    end;
  ChildDeep := (ChildDeep * 20);

  if ChildDeep = 0 then ChildDeep := 1 ;

  if  TOSFLedgerItem(Node.Data).IsGroupNode then
      begin
        ChildDeep := ChildDeep + 12  ;
      end;


  if  TOSFLedgerItem(Node.Data).IsGroupNode then
      begin

       if TOSFLedgerItem(Node.Data).GroupColor <> 0 then
         begin
           TVMain.Canvas.Font.Color := TOSFLedgerItem(Node.Data).GroupColor ;
           TVMain.Canvas.Brush.Color := TOSFLedgerItem(Node.Data).GroupbgColor ;
         end;
      end;

  if (cdsSelected in State) then
      TVMain.Canvas.Brush.Color := clHighlight ;
  ARect := node.DisplayRect(true);
  ARect.Right := TVMain.Width ;
  ARect.left := ARect.left + 200 ;
  TVMain.Canvas.FillRect(ARect);
  
  ARect := node.DisplayRect(true);
  aRect.Left :=  470 + aRect.Left - (ChildDeep ) ;



  if AValue >= 0 then
     TVMain.Canvas.TextOut(aRect.Left,aRect.Top,RightStr('              ' + FormatFloat(MyFormat,AValue),12));

  ARect := node.DisplayRect(true);
  aRect.Left :=  570 + aRect.Left  - (ChildDeep );


  if AValue < 0 then
     TVMain.Canvas.TextOut(aRect.Left,aRect.Top,RightStr('              '  + FormatFloat(MyFormat,-AValue),12));

 
  TVMain.Canvas.Font.Color := clWindowText ;
  TVMain.Canvas.Brush.Color := clWindow ;

end;



procedure TAccountTreeView2.FormShow(Sender: TObject);
begin
  Caption := DMTCCoreLink.GetTextLang(978);



  CBHideNilBal.Caption := DMTCCoreLink.GetTextLang(266);

  LGroup.Caption := DMTCCoreLink.GetTextLang(345 );

  CBGroup.Items[0] := DMTCCoreLink.GetTextLang(1323);
  CBGroup.Items[1] := DMTCCoreLink.GetTextLang(1325);
  CBGroup.Items[2] := DMTCCoreLink.GetTextLang(2321);

  LReportType.Caption := DMTCCoreLink.GetTextLang(1329 );
  CBBuget.Caption := DMTCCoreLink.GetTextLang(1027);
  dbcboxIncOpeningBalance.Caption := DMTCCoreLink.GetTextLang(637);
  dbcboxOnlyOpeningBalance.Caption := DMTCCoreLink.GetTextLang(2979);
  BCreate.Caption := DMTCCoreLink.GetTextLang(1754);
  BExport.Caption := DMTCCoreLink.GetTextLang(2013);
  LLProffitloss.Caption := DMTCCoreLink.GetTextLang(1160);
  LlTotbal.Caption := DMTCCoreLink.GetTextLang(1361);

  cbIncDebtorsCreditors.Caption :=  DMTCCoreLink.GetTextLangNoAmp(112) +'  ' +  DMTCCoreLink.GetTextLangNoAmp(31) + ' / ' + DMTCCoreLink.GetTextLangNoAmp(30);
  CBType.Items[0] := DMTCCoreLink.GetTextLang(1021);
  CBType.Items[1] := DMTCCoreLink.GetTextLang(206);
  CBType.Items[2] := DMTCCoreLink.GetTextLang(1361);
  CBType.Items[3] := DMTCCoreLink.GetTextLang(3106);
  CBType.Items[4] := DMTCCoreLink.GetTextLang(3107);
  CBType.Items[5] := DMTCCoreLink.GetTextLang(3108);

  CBType.Items[6] := DMTCCoreLink.GetTextLang(3166);
  CBType.Items[7] := DMTCCoreLink.GetTextLang(3167);
  CBType.Items[8] := DMTCCoreLink.GetTextLang(3168);

  LoadReportOp;
  ShowToAndFromInGui ;

  BCreateClick(self);
  //Self.Align  := alClient ;
end;

procedure TAccountTreeView2.ShowToAndFromInGui;
begin
 // dbcboxIncOpeningBalance.Visible := (FromID = 14) or (FromID = 1) ;
 // dbcboxOnlyOpeningBalance.Visible := dbcboxIncOpeningBalance.Visible and dbcboxIncOpeningBalance.Checked;
end;

Procedure TAccountTreeView2.LoadReportOp;
begin
  //dbcboxIncOpeningBalance.Checked ;
  rgPEriode.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_NWPERIOD',0);
  rgPEriodeClick(self);
  CBFromPeriode.ItemIndex := CBFromPeriode.Items.IndexOf(DMTCCoreLink.ReadNwReportOp('TREEBAL_NWDATE','')) ;
  if CBFromPeriode.ItemIndex = -1 then
     CBFromPeriode.ItemIndex := 0 ;

  dbcboxIncOpeningBalance.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_INCOPENBAL',true);
  dbcboxOnlyOpeningBalance.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_ONLYOPENBAL',false);

  CBHideNilBal.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_HIDENILBAL',false);
  CBGroup.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_GROUP',0) ;
  CBType.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_TYPE',0) ;
  CBTypeChange(self);
  CBBuget.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_BUGET',false);
  cbIncDebtorsCreditors.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_ICLDEBDCRED',true);
end;


Procedure TAccountTreeView2.SaveReportOp;
begin




  DMTCCoreLink.WriteNwReportOp('TREEBAL_NWDATE',CBFromPeriode.Text);

  DMTCCoreLink.WriteNwReportOp('TREEBAL_NWPERIOD',IntToStr(rgPEriode.ItemIndex));


  DMTCCoreLink.WriteNwReportOp('TREEBAL_INCOPENBAL',BoolToStr(dbcboxIncOpeningBalance.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_ONLYOPENBAL',BoolToStr(dbcboxOnlyOpeningBalance.Checked,true));

  DMTCCoreLink.WriteNwReportOp('TREEBAL_HIDENILBAL',BoolToStr(CBHideNilBal.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_BUGET',BoolToStr(CBBuget.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_ICLDEBDCRED',BoolToStr(cbIncDebtorsCreditors.Checked,true));


  DMTCCoreLink.WriteNwReportOp('TREEBAL_GROUP',IntToStr(CBGroup.ItemIndex) ) ;
  DMTCCoreLink.WriteNwReportOp('TREEBAL_TYPE',IntToStr(CBType.ItemIndex) ) ;
end;

procedure TAccountTreeView2.TVMainDblClick(Sender: TObject);
var
  Selection : String ;
 procedure  SelectionFilterOnGroup(AOSFLedgerItem : TOSFLedgerItem ) ;
 var
  x : Integer ;
 begin
    for x := 0 to AOSFLedgerItem.NesteldNodes.Count -1 do
      begin
         if  not AOSFLedgerItem.NesteldNodes[x].IsGroupNode then
          begin
            if Selection <> '' then  Selection := Selection + ',' ;
            Selection := Selection + IntToStr(AOSFLedgerItem.NesteldNodes[x].AccountID) ;
         end else
         SelectionFilterOnGroup(AOSFLedgerItem.NesteldNodes[x]);
      end;
 end;
var
 AAccountView : TfmTAccountView ;
 i : Integer ;

begin
 if TVMain.SelectionCount > 1 then
 begin
    Selection := '' ;
   for i := 0 to TVMain.SelectionCount -1 do
   begin
   if Integer(TVMain.Selections[i].Data) <> 0 then
    if  not TOSFLedgerItem(TVMain.Selections[i].Data).IsGroupNode then
    begin
      if Selection <> '' then  Selection := Selection + ',' ;
       Selection := Selection + IntToStr(TOSFLedgerItem(TVMain.Selections[i].Data).AccountID) ;
    end else
    begin
       SelectionFilterOnGroup(TOSFLedgerItem(TVMain.Selections[i].Data));
    end;
   end; // end for i
   if  Selection <> ' 'then
    begin
     AAccountView := TfmTAccountView.Create(self) ;
     With TSpeedButton.Create(ControlBar1) do
      begin
         tag := integer(AAccountView);
         OnClick := spShowViewClick;
         Caption := IntToStr(ControlBar1.ComponentCount);
         Parent := ControlBar1 ;
      end;
     AAccountView.Parent := self ;
     AAccountView.GoToSql := Selection ;
     AAccountView.aFromDate := FromDate ;
     AAccountView.aTodate :=  ToDate;
     AAccountView.Show ;
     {if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
           if Active then
            AddNestForm(self as TForm,AAccountView);
           end;
       end;
            }
    end;

 end else
 if TVMain.Selected <> nil then
   if Integer(TVMain.Selected.Data) <> 0 then
    begin
     AAccountView := TfmTAccountView.Create(self) ;
     With TSpeedButton.Create(ControlBar1) do
      begin
         tag := integer(AAccountView);
         OnClick := spShowViewClick;
         Parent := ControlBar1 ;
         Caption := IntToStr(ControlBar1.ComponentCount);
      end;     
    // AAccountView.Parent := self ;
     if ( not TOSFLedgerItem(TVMain.Selected.Data).IsGroupNode) then
        AAccountView.GoToId := TOSFLedgerItem(TVMain.Selected.Data).AccountID
        else
       begin
        SelectionFilterOnGroup(TOSFLedgerItem(TVMain.Selected.Data));
        AAccountView.GoToSql := Selection ;
       end; 

     AAccountView.aFromDate := FromDate ;
     AAccountView.aTodate := ToDate;
     AAccountView.Show ;
    { if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
           if Active then
            AddNestForm(self,AAccountView);
           end;
       end;  }
    end;

end;

procedure TAccountTreeView2.BuildTree(ANode: TTreeNode; AItem : TOSFLedgerItem);
Var
 i : Integer ;
 NewNode : TTreeNode ;
 CreateNode : Boolean ;
begin                  
//CreateNode := false ;
 for i := 0 to AItem.NesteldNodes.Count -1 do
    begin

    if CBType.ItemIndex = 1 then
    CreateNode :=  AItem.NesteldNodes[i].IncomeExpence
    else
     if CBType.ItemIndex = 2 then
     CreateNode :=  not AItem.NesteldNodes[i].IncomeExpence
     else
     CreateNode := True ;
     // always the groeps

     if not CreateNode then
       createnode := AItem.NesteldNodes[i].IsGroupNode;

                
     if CBHideNilBal.Checked then
      begin
         if CBType.ItemIndex = 1 then
          begin
            if AItem.NesteldNodes[i].IsGroupNode then
             CreateNode := AItem.NesteldNodes[i].HasProffitLoss
            else
            CreateNode := CreateNode and (AItem.NesteldNodes[i].ProffitLoss <> 0 )
          end

         else
         if CBType.ItemIndex = 2 then
          begin
            if AItem.NesteldNodes[i].IsGroupNode then
             CreateNode := AItem.NesteldNodes[i].HasBalans
            else
            CreateNode := CreateNode and (AItem.NesteldNodes[i].Balans <> 0 )
          end
         else
         CreateNode := CreateNode and (AItem.NesteldNodes[i].HasTotal );
       end ;
  if (AItem.NesteldNodes[i].ControlAccountType IN [1,2]) then
   Createnode :=  CBType.ItemIndex <> 1 ;
  if Createnode then
    begin
       NewNode := TVMain.Items.AddChild(ANode,AItem.NesteldNodes[i].GetAccountText  );
       NewNode.Data := AItem.NesteldNodes[i] ;
       HandelImageIndexOnTreeNode(NewNode);

           BuildTree(NewNode,AItem.NesteldNodes[i]);
        end;
      // NewNode.Text := AItem.NesteldNodes[i].GetNodeText ;

    end;
end;

procedure TAccountTreeView2.BExportClick(Sender: TObject);
Var
 AStrings : TStringList ;
 i ,x,MaxLevel : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
 TotalAmt : Double ;
begin
  self.Enabled := false ;
  try
 if HasChanges then
    BCreateClick(self);
 MaxLevel := 0 ;
 for i := 0 to TVMain.Items.Count -1 do
   begin
      if TVMain.Items[i].Level > MaxLevel then
        MaxLevel :=  TVMain.Items[i].Level ;
   end;
 if not SaveDialog1.Execute then exit ;
 if (CBType.ItemIndex in [3,4,5,6,7,8]) then
    begin
       AStrings := TStringList.Create ;
       try
 // add header

 AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2431) +#9+DateTimeToStr(Now)) ;
 AStrings.Add(label3.Caption+#9+CBFromPeriode.Text+#9+LGroup.Caption+#9+CBGroup.Text+#9+LReportType.Caption+#9+CBType.Text) ;
 AStrings.Add(rgPEriode.Caption+#9+rgPEriode.Items[rgPEriode.ItemIndex]+#9+CBBuget.Caption+#9+BoolToStr(CBBuget.checked,true)) ;

 AStrings.Add(CBHideNilBal.Caption+#9+BoolToStr(CBHideNilBal.checked,true)+#9+dbcboxIncOpeningBalance.Caption+#9+BoolToStr(dbcboxIncOpeningBalance.checked,true)) ;
 AStrings.Add(cbIncDebtorsCreditors.Caption+#9+BoolToStr(cbIncDebtorsCreditors.checked,true)+#9+dbcboxOnlyOpeningBalance.Caption+#9+BoolToStr(dbcboxOnlyOpeningBalance.checked,true)) ;

 AStrings.Add('') ;

        for x := 0 to sgColumnBalans.RowCount -1 do
        begin
        AddLine := '' ;
         for i := 0 to sgColumnBalans.ColCount -1 do
           begin
               if (CBType.ItemIndex in [6,7,8]) and (i in [2..14,18,30])then
                begin
                 if sgColumnBalans.Cells[i,x] <> '' then
                    AddLine  := AddLine + StringReplace(sgColumnBalans.Cells[i,x],' / ' ,#9,[rfreplaceall])
                   else

                   AddLine  := AddLine + '0' +  #9  + '0';

                end
                else
                begin
                  if (i > 0) and (x > 0) then
                  begin
                    if sgColumnBalans.Cells[i,x] = '' then
                     AddLine  := AddLine +'0'
                     else
                   AddLine  := AddLine + sgColumnBalans.Cells[i,x] ;
                    
                  end
                  else
                  begin
                    if x <> 0 then
                     AddLine := AddLine + TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(Integer(sgColumnBalans.Rows[x].Objects[0])) +
                     #9 + TDataBaseRoutines.GetAccountDescription(Integer(sgColumnBalans.Rows[x].Objects[0])) + #9
                     else
                      begin
                      if ( i = 0 ) and (x = 0 ) then
                        AddLine  := AddLine + sgColumnBalans.Cells[i,x] + #9 + #9
                      else
                      AddLine  := AddLine + sgColumnBalans.Cells[i,x] ;
                     end;  

                  end;
                end;
              if i < sgColumnBalans.ColCount -1 then
                 AddLine  := AddLine + #9 ;
           end ;
          AStrings.Add( AddLine); 
        end;

      AStrings.SaveToFile(SaveDialog1.FileName);
      AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
      ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);
        finally
         AStrings.Free ;
        end;
      exit ;
    end;

 AStrings := TStringList.Create ;
 try
 // add header
 AStrings.Add(label3.Caption+#9+CBFromPeriode.Text+#9+LGroup.Caption+#9+CBGroup.Text+#9+LReportType.Caption+#9+CBType.Text) ;
 AStrings.Add(rgPEriode.Caption+#9+rgPEriode.Items[rgPEriode.ItemIndex]+#9+CBBuget.Caption+#9+BoolToStr(CBBuget.checked,true)) ;

 AStrings.Add(CBHideNilBal.Caption+#9+BoolToStr(CBHideNilBal.checked,true)+#9+dbcboxIncOpeningBalance.Caption+#9+BoolToStr(dbcboxIncOpeningBalance.checked,true)) ;
 AStrings.Add(cbIncDebtorsCreditors.Caption+#9+BoolToStr(cbIncDebtorsCreditors.checked,true)+#9+dbcboxOnlyOpeningBalance.Caption+#9+BoolToStr(dbcboxOnlyOpeningBalance.checked,true)) ;

 AStrings.Add('') ;

   for i := 0 to TVMain.Items.Count -1 do
     if TVMain.Items[i].Data <> nil  then
      begin
        AddLine := TOSFLedgerItem(TVMain.Items[i].Data).Accountcode + #9 + TOSFLedgerItem(TVMain.Items[i].Data).Name + #9  ;
        // addin levels
        for x := 0 to maxlevel do
          begin
             if TVMain.Items[i].Level > x then
              AddLine := #9 + AddLine  else
              AddLine := AddLine + #9 ;
          end;
        if (TOSFLedgerItem(TVMain.Items[i].Data).NesteldNodes.Count = 0) then
        begin
        TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).Total ;

        IF   TotalAmt>= 0 then
             AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);
        AddLine :=  AddLine + #9 ;
        IF  TotalAmt < 0 then
           AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,-TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);
        end else
        begin
         TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).Total ;
         Delete(AddLine,length(AddLine),1) ;
         AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,TotalAmt),12)
        end;
         AStrings.Add(AddLine);
      end ;
   AStrings.SaveToFile(SaveDialog1.FileName);
   AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
   ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);

      
 finally
   AStrings.Free ;
 end;
 finally
    Self.Enabled := true ;
 end;
end;

procedure TAccountTreeView2.CBBugetClick(Sender: TObject);
begin
// dbcboxIncOpeningBalance.Visible :=  not CBBuget.Checked and ((FromID = 14) or (FromID = 1)) ;
 
 HasChanges := true ;
end;



procedure TAccountTreeView2.ZQTotalsAccountsBeforeOpen(DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from account where WAccountid is null');
end;

procedure TAccountTreeView2.HandelImageIndexOnTreeNode(
  ATreeNode: TTReeNode);
 var
  AItem: TOSFLedgerItem ;
begin
  AItem := TOSFLedgerItem(ATreeNode.Data);
           if AItem.IsGroupNode then
             begin
             case AItem.FinancialCategory of
                   69 :ATreeNode.ImageIndex  := 25 ;
                   67 :ATreeNode.ImageIndex  := 26 ;
                   66 :ATreeNode.ImageIndex  := 28 ;
                   68 :ATreeNode.ImageIndex  := 24 ;
                   65 :ATreeNode.ImageIndex  := 29 ;
                   else
                       ATreeNode.ImageIndex := 27
                   end ;// end case
             end
             else
           if (AItem.ControlAccountType in [1,2]) then
              ATreeNode.ImageIndex := 19
              else
            if AItem.ControlAccountType = 3 then
              ATreeNode.ImageIndex := 5
              else
            if AItem.IncomeExpence then
              // income Expence
               ATreeNode.ImageIndex := 23
               else
               if (AItem.LedgerType in [1,2]) then
               ATreeNode.ImageIndex := 19
               else
               begin
               // normal accounts
               ATreeNode.ImageIndex :=  20 ;
                 if AItem.LedgerType = 3 then
                    ATreeNode.ImageIndex := 41 else
                 if AItem.LedgerType = 4 then
                    ATreeNode.ImageIndex := 34 ;
               end;
   ATreeNode.SelectedIndex := ATreeNode.ImageIndex ;
end;

procedure TAccountTreeView2.spShowViewClick(Sender: TObject);
begin
 if not TForm(TComponent(Sender).Tag).Visible then
   TForm(TComponent(Sender).Tag).Show ;
 TForm(TComponent(Sender).Tag).BringToFront ;
end;

procedure TAccountTreeView2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     SaveReportOp ;
end;

procedure TAccountTreeView2.CreateColumnBalans;
var
 Colindex,RowIndex,i : Integer ;
 WhereClause : String ;
 Total,EndBalans,Amount,FDeb,FCred : Double ;
 AProgress : TfmNewProgress ;
 bAmountFound : Boolean ;
begin
   AProgress := TfmNewProgress.Create(nil) ;
   try
   AProgress.BtnStop.Visible := true ;
   sgColumnBalans.Visible := False ;
   sgColumnBalans.Align := alClient ;

   // init periods.
   ZQGetPeriods.Close ;
   ZQGetPeriods.Open ;

   sgColumnBalans.FixedRows := 0 ;
   sgColumnBalans.FixedCols := 0 ;
   sgColumnBalans.RowCount := 0 ;
   //Colindex := 1 ;
   sgColumnBalans.RowCount := 2 ;
   sgColumnBalans.ColCount := 1 ;
   sgColumnBalans.ColCount := 33 ;



   sgColumnBalans.FixedRows := 1 ;
   sgColumnBalans.FixedCols := 1 ;

   sgColumnBalans.OnDblClick := ColumnBalansClick;


   for i := 0 to sgColumnBalans.ColCount -2 do
     begin
        sgColumnBalans.Cols[i+1].Objects[0] := TObject(-2) ;
     end;

   sgColumnBalans.Cols[1].Objects[0] := TObject(-1) ;




   for i := 1 to 13 do
     begin
        sgColumnBalans.Cols[i+1].Objects[0] := TObject(i) ;
     end;

       sgColumnBalans.Cols[1][0] := 'Opening last year' ;
       sgColumnBalans.Cols[17].Objects[0] := TObject(0) ;
       sgColumnBalans.Cols[15][0] := DMTCCoreLink.GetTextLangNoAmp(600) + ' ' + DMTCCoreLink.GetTextLangNoAmp(960) ; //Total periods' ;
       sgColumnBalans.Cols[16][0] := 'End last year' ;
       sgColumnBalans.Cols[17][0] := 'Opening This year' ;
       sgColumnBalans.Cols[0][0] :=   DMTCCoreLink.GetTextLangNoAmp(2047) ; // Name
       sgColumnBalans.Cols[31][0] := DMTCCoreLink.GetTextLangNoAmp(600) + ' ' + DMTCCoreLink.GetTextLangNoAmp(960) ; //Total periods' ;
       sgColumnBalans.Cols[32][0] := 'End this year' ;





   for i := 1 to 13 do
     begin
        sgColumnBalans.Cols[i+17].Objects[0] := TObject(13 + i) ;
     end;

   while not ZQGetPeriods.Eof do
     begin
       Colindex := -1 ;
        for i := 1 to sgColumnBalans.ColCount -1 do
           if Integer(sgColumnBalans.Cols[i].Objects[0]) = ZQGetPeriodsWPERIODID.AsInteger then
           Colindex := i ;
        if Colindex > -1 then
         begin
          if CBType.ItemIndex > 5 then
          sgColumnBalans.Cols[ColIndex][0] := ZQGetPeriodsSDESCRIPTION.AsString + ' D / C'

          else
          sgColumnBalans.Cols[ColIndex][0] := ZQGetPeriodsSDESCRIPTION.AsString  ;
          sgColumnBalans.ColWidths[Colindex] := 1 ;
         end;
       ZQGetPeriods.next ;
     end;



 {  for i := 0 to 31 do
     begin
       sgColumnBalans.Cols[i+1][0]  := sgColumnBalans.Cols[i+1][0] + IntToStr(Integer(sgColumnBalans.Cols[i+1].Objects[0] )) ;
     end;  }

   ZQTotalsAccounts.close ;
  if CBBuget.Checked and (CBType.ItemIndex=3)then
    WhereClause := 'where (WPeriodId  >= -1 )  and (BActual = 0 ) and (Account.Waccountid <> 0)' 
    else
    WhereClause := 'where (WPeriodId  >= -1 )  and (BActual = 1 ) and (Account.Waccountid <> 0)' ;
   case CBType.ItemIndex of
   3,6 : ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (0,3,4)','^') + ' order by Account.SAccountcode ' ;
   4,7 : ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (1)','^') + ' order by Account.SAccountcode ' ;
   5,8 : ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (2)','^') + ' order by Account.SAccountcode ' ;
   end;

   ZQTotalsAccounts.Open ;
   if  ZQTotalsAccounts.IsEmpty then
   sgColumnBalans.RowCount := 2 
   else
   sgColumnBalans.RowCount := ZQTotalsAccounts.RecordCount + 1;
   RowIndex := 1 ;
 //  sgColumnBalans.ColWidths[0] := 250 ;
   AProgress.initProgress('Calculating',ZQTotalsAccounts.RecordCount);
   Application.ProcessMessages ;
   ZQTotalsList.Close ;
   ZQTotalsList.open ;
   ZQTotalsList.Last ;
   
   while not ZQTotalsAccounts.Eof do
     begin
       bAmountFound := false ;
       AProgress.SetProgress('',ZQTotalsAccounts.RecNo);
       if AProgress.bStop then
          Raise Exception.Create('User stop!');
       Application.ProcessMessages ;
       
       sgColumnBalans.Cells[0,RowIndex] := ZQTotalsAccountsSACCOUNTCODE.AsString + ' ' + ZQTotalsAccountsSDESCRIPTION.AsString ;
       sgColumnBalans.Rows[RowIndex].Objects[0] := TObject(ZQTotalsAccountsWACCOUNTID.AsInteger);
       // sgColumnBalans.Cells[29,RowIndex] := FormatFloat(MyFormat,ZQTotalsAccountsTOTAAL.AsFloat) ;
       EndBalans := 0 ;
       Total := 0 ;
       for Colindex := 1 to sgColumnBalans.ColCount do

        begin

          if Integer(sgColumnBalans.Cols[Colindex].Objects[0]) > -2 then
            begin

              FCred := abs(TDataBaseRoutines.GetBalansDebCredOnPeriod(ZQTotalsAccountsWACCOUNTID.AsInteger,Integer(sgColumnBalans.Cols[Colindex].Objects[0]),False));
              FDeb := TDataBaseRoutines.GetBalansDebCredOnPeriod(ZQTotalsAccountsWACCOUNTID.AsInteger,Integer(sgColumnBalans.Cols[Colindex].Objects[0]),true);
              if (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = -1) or (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = 0) then
               if ZQTotalsAccountsBINCOMEEXPENSE.AsInteger = 1 then
                 begin
                   FCred := 0 ;
                   FDeb := 0 ;
                   Total := 0 ;
                 end;
                 Amount :=  FDeb - FCred ;
              if (FDeb <> 0) or (FCred <> 0)  then
                 bAmountFound := true;

              if (CBType.ItemIndex < 6) or (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = -1) or (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = 0) then
               begin
                 sgColumnBalans.Cells[Colindex,RowIndex] := FormatFloat(MyFormat,Amount);
                 if sgColumnBalans.Cells[Colindex,RowIndex] = FormatFloat(MyFormat,0) then
                    sgColumnBalans.Cells[Colindex,RowIndex] := '' ;
               end else
               begin
                sgColumnBalans.Cells[Colindex,RowIndex] := FormatFloat(MyFormat,FDeb) + ' / ' + FormatFloat(MyFormat,FCred) ;
                  if sgColumnBalans.Cells[Colindex,RowIndex] = FormatFloat(MyFormat,0) + ' / ' + FormatFloat(MyFormat,0) then
                   sgColumnBalans.Cells[Colindex,RowIndex] := '' ;
               end;
               if  Integer(sgColumnBalans.Cols[Colindex].Objects[0]) <> 0 then
                   Total  := Total  + Amount else
                   Total := Amount ;

               if  (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) <> 0) and
                    (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) <> -1 ) then
                   begin
                   EndBalans := EndBalans  + Amount ;

                   end;




              if  (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = 13) then // last period
                   begin
                       sgColumnBalans.Cols[15][RowIndex] := FormatFloat(MyFormat,EndBalans) ;
                       sgColumnBalans.Cols[16][RowIndex] := FormatFloat(MyFormat,Total) ;
                       EndBalans := 0 ;
                   end;
              if  (Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = 26) then // last period
                   begin
                       sgColumnBalans.Cols[31][RowIndex] := FormatFloat(MyFormat,EndBalans) ;
                       sgColumnBalans.Cols[32][RowIndex] := FormatFloat(MyFormat,Total) ;
                       EndBalans := 0 ;
                   end;


           end;
        end;
       sgColumnBalans.RowHeights[RowIndex] := 16 ;
       ZQTotalsAccounts.Next ;
       if ((bAmountFound) or (not CBHideNilBal.Checked)) then
          inc(RowIndex) ;
     end;
   if RowIndex < 2 then

      begin
        RowIndex := 2 ;
        for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][1] := '' ;
      end;
   sgColumnBalans.RowCount := RowIndex  ;
   ZQTotalsList.Close ;
   sgColumnBalans.Visible := True ;
   LLProffitloss.Visible := False ;
   LlTotbal.Visible := False ;
   LProffitloss.Visible := False ;
   LTotalBalans.Visible := False ;
   TVMain.Visible := False ;
   finally
     AProgress.free ;
   end;

   

end;


procedure TBalansViewerControl.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
   sCellText, sLine: string;
   iAantalRegels, i: integer;
begin
     sCellText := Cells[Acol, ARow];
     if gdFixed in AState then
     begin
          Canvas.Brush.Color := FixedColor;
          Canvas.Font.Color := Font.Color;
     end
     else if (gdSelected in AState) and not (gdFocused in AState) then
     begin
          Canvas.Brush.Color := clNavy;
          Canvas.Font.Color := clWhite;
     end
     else if (aCol in [1,17])  then
     begin
          Canvas.Brush.Color := clDkGray;
          Canvas.Font.Color := Font.Color;
          Canvas.FillRect(ARect);
     end
     else if (aCol in [16,32])  then
     begin
          Canvas.Brush.Color := clSilver;
          Canvas.Font.Color := clBlack;
          Canvas.FillRect(ARect);
     end
     else if (aCol in [15,31])  then
     begin
          Canvas.Brush.Color := clYellow;
          Canvas.Font.Color := clBlack;
          Canvas.FillRect(ARect);
     end
     else
     begin
          Canvas.Brush.Color := Color;
          Canvas.Font.Color := Font.Color;
     end;

     i := 1;
     iAantalRegels:= 0;

     while i <= Length(sCellText) do
     begin
          //Maak indien nodig de tekst in meedere regels
          while (i <= Length(sCellText)) and (sCellText[i] <> #13) and (sCellText[i] <> #10) do
          begin
               sLine := sLine + sCellText[i];
               inc(i);
          end;
          inc(iAantalRegels);

          //Kijk of de length aangepas moet worden
          if Canvas.TextExtent(sLine).cx + 4 > ColWidths[ACol] then
          begin
               ColWidths[ACol] := Canvas.TextExtent(sLine).cx + 4;
          end;

          //Schijf de regel in de cell eerste regel altijd links outlined
          // en de  clom ook
          if (BiDiMode = bdRightToLeft) and (aRow <> 0) and (acol <> 0 ) then
          begin
               Canvas.TextOut(ColWidths[ACol] + ARect.Left - Canvas.TextExtent(sLine).cx - 2, ARect.Top + ((Canvas.TextExtent(sLine).cy+2)*(iAantalRegels-1)), sLine);
          end
          else
          begin
              Canvas.TextOut(ARect.Left +1, ARect.Top + ((Canvas.TextExtent(sLine).cy+1)*(iAantalRegels-1)), sLine);
          end;

          sLine := '';
          if (i <= Length(sCellText)) and (sCellText[i] = #13) then
             inc(i);
          if (i <= Length(sCellText)) and (sCellText[i] = #10) then
             inc(i);
     end;

     //Als er al text staat in de cell, pas de hoogte aan

     if (iAantalRegels > 1) and (RowHeights[ARow] <  iAantalRegels * DefaultRowHeight) then
     begin
            RowHeights[ARow] := iAantalRegels * DefaultRowHeight //DefaultRowHeight + ((Canvas.TextExtent(sLine).cy+1)*(iAantalRegels-1));
     end;

end;

procedure TAccountTreeView2.ColumnBalansClick(Sender: TObject);
var
 AAccountView : TfmTAccountView ;
 i : Integer ;

begin
 if  (sgColumnBalans.Selection.Top > 0) and
     (sgColumnBalans.Selection.Left > 1) then
    begin
     AAccountView := TfmTAccountView.Create(self) ;
     With TSpeedButton.Create(ControlBar1) do
      begin
         tag := integer(AAccountView);
         OnClick := spShowViewClick;
         Parent := ControlBar1 ;
         Caption := IntToStr(ControlBar1.ComponentCount);
      end;
      AAccountView.GoToId := Integer(sgColumnBalans.Rows[sgColumnBalans.Selection.Top].Objects[0]) ;
      AAccountView.aFromDate := TDataBaseRoutines.GetPeriodStartDate(Integer(sgColumnBalans.Cols[sgColumnBalans.Selection.Left].Objects[0]));
      AAccountView.aTodate := TDataBaseRoutines.GetPeriodEndDate(Integer(sgColumnBalans.Cols[sgColumnBalans.Selection.Left].Objects[0]));
      AAccountView.Show ;
    { if  Application.FindComponent('skindata') <> nil then
       begin
         with TSkinData(Application.FindComponent('skindata')) do
           begin
           if Active then
            AddNestForm(self,AAccountView);
           end;
       end; }
      Application.ProcessMessages ;
      AAccountView.BringToFront ; 
    end;
end;

procedure TAccountTreeView2.dbcboxIncOpeningBalanceClick(Sender: TObject);
begin
 dbcboxOnlyOpeningBalance.Visible := dbcboxIncOpeningBalance.Checked ;
 HasChanges := true ;
end;

procedure TAccountTreeView2.CBGroupChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView2.edtFromDateChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView2.edtToDateChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView2.dbcboxOnlyOpeningBalanceClick(Sender: TObject);
begin
HasChanges := true ;
end;

procedure TAccountTreeView2.CBHideNilBalClick(Sender: TObject);
begin
HasChanges := true ;
end;

procedure TAccountTreeView2.TSetToLastColumnTimer(Sender: TObject);
begin
  TSetToLastColumn.Enabled := false ;
  sgColumnBalans.FocusCell(sgColumnBalans.ColCount -1,1,true)  ;
end;

procedure TAccountTreeView2.CBTypeChange(Sender: TObject);
begin
CBHideNilBal.Visible := true ;
dbcboxIncOpeningBalance.Visible := true ;
cbIncDebtorsCreditors.Visible := true ;
CBGroup.Visible := true ;
LGroup.Visible := true ;
CBBuget.Visible := true ;


 if CBType.ItemIndex = 1 then
    begin
       dbcboxOnlyOpeningBalance.Checked := false ;
       dbcboxOnlyOpeningBalance.Visible := false ;
       dbcboxIncOpeningBalance.Visible := false ;
       cbIncDebtorsCreditors.Visible := False ;
    end else
    begin
      if (CBType.ItemIndex in [0,2]) then
       begin
         dbcboxOnlyOpeningBalance.Visible := True
       end else
       begin
       dbcboxOnlyOpeningBalance.Checked := false ;
       dbcboxOnlyOpeningBalance.Visible := false ;
       dbcboxIncOpeningBalance.Visible := false ;
       CBBuget.Visible := false ;
       cbIncDebtorsCreditors.Visible := False ;
       CBGroup.Visible := False ;
       LGroup.Visible := False ;
     end;
    end;
end;

procedure TAccountTreeView2.rgPEriodeClick(Sender: TObject);
procedure initDropdown ;
    var
 FromDate , ToDate , LowDate: TDateTime ;
    Maanden : integer ;
begin
  Maanden := -12 ;
  if rgPEriode.ItemIndex =1 then
   Maanden := -1 ;
  if rgPEriode.ItemIndex =2 then
   Maanden := -3 ;

   if (Maanden = -1)  then
     FromDate := TDataBaseRoutines.GetPeriodStartDate(26)
  else
   if (Maanden = -3) then
     FromDate := TDataBaseRoutines.GetPeriodStartDate(23)
  else
  FromDate := TDataBaseRoutines.GetPeriodStartDate(14);


      ZqGen.sql.text :='Select min(ddate) from transact' ;


     CBFromPeriode.Clear ;

     ZqGen.open ;
     LowDate := FromDate ;
     if not zqGen.IsEmpty and (zqGen.fields[0].AsDateTime <> 0 ) then
        LowDate := zqGen.fields[0].AsDateTime ;
     CBFromPeriode.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(IncMonth(FromDate,-Maanden)-1) );
     while LowDate <= FromDate do
       begin

         FromDate := IncMonth(FromDate,Maanden) ;
         CBFromPeriode.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(IncMonth(FromDate,-Maanden)-1) );
       end;
      CBFromPeriode.ItemIndex := 0 ;
      // CBFromPeriodeChange(self);
    end;
begin
 CBFromPeriode.Items.BeginUpdate ;
 try
 initDropdown ;
 finally
   CBFromPeriode.Items.EndUpdate ;
 end;



end;

end.
