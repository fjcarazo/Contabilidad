(*
  Id: UGeneralEditAccount.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UGeneralEditAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls,TcashClasses, DB, 
   DBAccess , Uni, StdCtrls,UDmCoreAccountData, Grids, DBGrids,
   ActnList, XPStyleActnCtrls, ActnMan, Menus,VirtualTable,
  ToolWin, ActnCtrls, Buttons, DBCtrls,uOsfresources,UpluginsSharedUnit,
  Mask, dbcgrids, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxImageComboBox, cxContainer, cxTreeView, cxTextEdit, cxCurrencyEdit,
  cxDBLookupComboBox;

type
 twf_TGeneralEditAccount  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;

  TGeneralEditAccount = class(TForm)
    PMainInfo: TPanel;
    PCGLType: TPageControl;
    TSLedger: TTabSheet;
    TSGroup: TTabSheet;
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
    ZQTotalsAccountsTOTAAL: TFloatField;
    Panel2: TPanel;
    CBGroup: TComboBox;
    EGroupname: TEdit;
    LGroupName: TLabel;
    ZQHasTransactions: TuniQuery;
    ZQSetOFBookIsEmpty: TuniQuery;
    CBFinCategory: TComboBox;
    LFinCat: TLabel;
    Splitter1: TSplitter;
    PCAccountDetails: TPageControl;
    pmTreeView: TPopupMenu;
    ActionManager1: TActionManager;
    AAddGroup: TAction;
    Addgroup1: TMenuItem;
    EFilerAccount: TEdit;
    LSearchAccount: TLabel;
    LSort: TLabel;
    ZQTotalsAccountsWLINKACCOUNT: TIntegerField;
    AAddAccount: TAction;
    Addaccount1: TMenuItem;
    AMoveGroupUp: TAction;
    AMoveGroupDown: TAction;
    AMoveGroupUp1: TMenuItem;
    AMoveGroupDown1: TMenuItem;
    AMoveGroupLevelToLower: TAction;
    Movetoleft1: TMenuItem;
    cbExpand: TCheckBox;
    ADeleteAccount: TAction;
    ADeleteAccount1: TMenuItem;
    ADeleteGroup: TAction;
    Deletegroup1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ActionToolBar1: TActionToolBar;
    APostAccount: TAction;
    APostGroup: TAction;
    Post: TMenuItem;
    Save1: TMenuItem;
    BitBtn1: TBitBtn;
    dsSubAccounts: TDataSource;
    ARefresh: TAction;
    AExpand: TAction;
    AColaps: TAction;
    N3: TMenuItem;
    Refresh1: TMenuItem;
    Colapsall1: TMenuItem;
    Expandall1: TMenuItem;
    tsTax: TTabSheet;
    tsBank: TTabSheet;
    PLinkTaxes: TPanel;
    LLinkTax: TLabel;
    LContraTax: TLabel;
    cbbLinkTaxId: TComboBox;
    CBContraTax: TCheckBox;
    LUSeTaxLink: TLabel;
    LPercentage: TLabel;
    edtPercent: TEdit;
    CBUseTaxLink: TCheckBox;
    AAddSubAccount: TAction;
    AddSub1: TMenuItem;
    LcbPayments: TLabel;
    LcbReceipts: TLabel;
    cbPayments: TComboBox;
    cbReceipts: TComboBox;
    ZQGen: TuniQuery;
    EDescription: TEdit;
    LFliterAccountDesc: TLabel;
    ZQTotalsAccountsWTAXACCOUNT: TIntegerField;
    tslinks: TTabSheet;
    DBNavigator1: TDBNavigator;
    ZQLinks: TuniQuery;
    ZUSQLLinks: TUniUpdateSql;
    ZQLinksWACCOUNTREFID: TIntegerField;
    ZQLinksSREFERENCE: TStringField;
    ZQLinksWACCOUNTID: TIntegerField;
    dslinks: TDataSource;
    cbTaxShowType: TComboBox;
    Showtype: TLabel;
    tsBudget: TTabSheet;
    ZQNewBudget: TuniQuery;
    DSNewBudget: TDataSource;
    ZQNewBudgetWTRANSACTIONID: TIntegerField;
    ZQNewBudgetDDATE: TDateTimeField;
    ZQNewBudgetSREFERENCE: TStringField;
    ZQNewBudgetSDESCRIPTION: TStringField;
    ZQNewBudgetFAMOUNT: TFloatField;
    ZQNewBudgetWUSERID: TIntegerField;
    ZQNewBudgetDSYSDATE: TDateTimeField;
    ZQNewBudgetWJOBCODEID: TIntegerField;
    ZQNewBudgetBEXCLUSIVE: TSmallintField;
    ZQNewBudgetWREPORTINGGROUP1ID: TIntegerField;
    ZQNewBudgetWREPORTINGGROUP2ID: TIntegerField;
    ZQNewBudgetWACCOUNTID: TIntegerField;
    ZUSQLNEwbudget: TUniUpdateSql;
    Splitter2: TSplitter;
    Panel1: TPanel;
    LAccountCode: TLabel;
    LEAccountName: TLabel;
    LAccountType: TLabel;
    LGroup1: TLabel;
    LGroup2: TLabel;
    EAccountMain: TEdit;
    EAccountName: TEdit;
    PAccounting: TPanel;
    LAccType: TLabel;
    LStatus: TLabel;
    LOpenItem: TLabel;
    LPosted: TLabel;
    LcbLinkTaxAccount: TLabel;
    cbIncomeExpence: TComboBox;
    ETransactions: TEdit;
    CBInActive: TComboBox;
    cbOpenItem: TComboBox;
    CBSubaccounts: TCheckBox;
    cbLinkTaxAccount: TComboBox;
    BSaveAccount: TBitBtn;
    cbAccountType: TComboBox;
    EAccountSub: TEdit;
    cbGroup1: TComboBox;
    cbGroup2: TComboBox;
    dsCostgroup2: TDataSource;
    dsTranslations: TDataSource;
    ZQAccTranslation: TuniQuery;
    ZQAccTranslationWACCOUNTID: TIntegerField;
    ZQAccTranslationWLANGUAGEID: TIntegerField;
    ZQAccTranslationSDESCRIPTION: TStringField;
    tsTranslations: TTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WLANGUAGEID: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1WTRANSACTIONID: TcxGridDBColumn;
    cxGrid2DBTableView1DDATE: TcxGridDBColumn;
    cxGrid2DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid2DBTableView1FAMOUNT: TcxGridDBColumn;
    cxGrid2DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid2DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn;
    cxGrid2DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    Panel3: TPanel;
    DBNavigator2: TDBNavigator;
    BSetPeriodBuget: TBitBtn;
    EBudYear: TEdit;
    EPeriods: TEdit;
    EBudget: TEdit;
    LAmount: TLabel;
    LPEriods: TLabel;
    LYear: TLabel;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1WACCOUNTREFID: TcxGridDBColumn;
    cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid2DBTableView1WJOBCODEID: TcxGridDBColumn;
    Dsproject: TDataSource;
    TVMain: TcxTreeView;
    qprojects: TUniQuery;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TVMainChange(Sender: TObject; Node: TTreeNode);
    procedure EGroupnameChange(Sender: TObject);
    procedure TVMainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TVMainDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CBFinCategoryChange(Sender: TObject);
    procedure ZQBugetsWPERIODIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    
    procedure AAddGroupExecute(Sender: TObject);
    procedure AAddAccountExecute(Sender: TObject);
    procedure EAccountMainChange(Sender: TObject);
    procedure TVMainChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure BExpandClick(Sender: TObject);
    procedure AMoveGroupUpExecute(Sender: TObject);
    procedure AMoveGroupDownExecute(Sender: TObject);
    procedure BSetPeriodBugetClick(Sender: TObject);
    procedure AMoveGroupLevelToLowerExecute(Sender: TObject);
    procedure ADeleteAccountExecute(Sender: TObject);
    procedure ADeleteGroupExecute(Sender: TObject);
    procedure APostAccountExecute(Sender: TObject);
    procedure APostGroupExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure AExpandExecute(Sender: TObject);
    procedure AColapsExecute(Sender: TObject);
    procedure ZQTotalsAccountsBeforeOpen(DataSet: TDataSet);
    procedure AAddSubAccountExecute(Sender: TObject);
    procedure TVMainEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure CBUseTaxLinkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBGroupChange(Sender: TObject);
    procedure EFilerAccountKeyPress(Sender: TObject; var Key: Char);
    procedure ZQLinksAfterInsert(DataSet: TDataSet);
    procedure ZQLinksAfterDelete(DataSet: TDataSet);
    procedure ZQLinksAfterEdit(DataSet: TDataSet);
    procedure ZQNewBudgetBeforePost(DataSet: TDataSet);
    procedure ZQNewBudgetWREPORTINGGROUP1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ZQNewBudgetAfterScroll(DataSet: TDataSet);
    procedure ZQNewBudgetAfterOpen(DataSet: TDataSet);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Panel2DblClick(Sender: TObject);
    procedure ZQNewBudgetAfterInsert(DataSet: TDataSet);
    procedure cxGrid2DBTableView1EditKeyPress(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Char);
  private
    LedgerCalculationClass : TOSFLedgerCalculationClass ;
    procedure BuildTree(ANode: TTreeNode; AItem: TOSFLedgerItem);
    procedure RecurceTree(AItem: TOSFLedgerItem; GroupType: Integer);
    procedure BuildFinCatTree(AFinCat : Integer ;ANode: TTreeNode; AItem: TOSFLedgerItem);
    function FindFinCatNode(AFinCat : Integer ) : TTreeNode ;
    function GetFinCatIndex(ANode : TTReeNode ) : Integer ;
    procedure UpdateGridControls;
    { Private declarations }
  public
    BSetOfBooksIsEmpty : Boolean ;
    DMCoreAccountData: TDMCoreAccountData;
    useTrn : Boolean ;
    ASubAccountDataset : TVirtualTable ;
    aLanguageList : TStringlist ;
    ATranslationsDataset : TVirtualTable ;

    DebtorAccount,CreditorAccount,Proffitlosslastyear : Integer ;
    procedure HandelAccountNode(Node : TTreeNode ) ;
    procedure SaveAccountNode(Node : TTreeNode ) ;
    procedure HandelImageIndexOnTreeNode(ATreeNode : TTReeNode );


    procedure  MyUpdateActions ;

    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines,strutils,CommCtrl, UMsgBox,uosfvisuals,
  UDmQuantumGridDefs;



{$R *.dfm}

function CustomSortProc(Node1, Node2: TTreeNode; Data: Integer): Integer; stdcall;
begin
  if (Node1.Data <> nil) and (Node2.Data <> nil) then
  begin
  if TOSFLedgerItem(Node1.Data).IsGroupNode and TOSFLedgerItem(Node2.Data).IsGroupNode then
     begin
        result := TOSFLedgerItem(Node1.Data).SortNo - TOSFLedgerItem(Node2.Data).SortNo ;
     end else
  if not TOSFLedgerItem(Node1.Data).IsGroupNode and not TOSFLedgerItem(Node2.Data).IsGroupNode then
      begin
        Result := AnsiStrIComp(PChar(TOSFLedgerItem(Node1.Data).Accountcode), PChar(TOSFLedgerItem(Node2.Data).Accountcode));

      end else
      if TOSFLedgerItem(Node1.Data).IsGroupNode then
       begin
        result := -1
       end else
        result := 1 ;
  end else
  result := 0;
end;

procedure TGeneralEditAccount.BuildFinCatTree(AFinCat : Integer ;ANode: TTreeNode; AItem : TOSFLedgerItem);
Var
 i : Integer ;
 NewNode : TTreeNode ;
 CreateNode : Boolean ;
begin

 for i := 0 to AItem.NesteldNodes.Count -1 do
    begin
    CreateNode := true ;
    if AFinCat <> 0 then
         Createnode :=   AItem.NesteldNodes[i].Group1 <>  0 ;
    if AItem.NesteldNodes[i].IsGroupNode then
      Createnode := (AItem.NesteldNodes[i].FinancialCategory =  AFinCat) ;
        if Createnode then
           begin
             NewNode := TVMain.Items.AddChild(ANode,AItem.NesteldNodes[i].GetAccountText );
             NewNode.Data := AItem.NesteldNodes[i] ;
             HandelImageIndexOnTreeNode(NewNode);
             BuildFinCatTree(AFinCat,NewNode,AItem.NesteldNodes[i]);
            end else
            begin
             // BuildFinCatTree(AFinCat,ANode,AItem.NesteldNodes[i]);
            end;
     end;
end;

procedure TGeneralEditAccount.BuildTree(ANode: TTreeNode; AItem : TOSFLedgerItem);
Var
 i : Integer ;
 NewNode : TTreeNode ;
 CreateNode : Boolean ;
begin

 for i := 0 to AItem.NesteldNodes.Count -1 do
    begin
    CreateNode := true ;
      if Createnode then
        begin
           if AItem.NesteldNodes[i].IsGroupNode then
              NewNode := TVMain.Items.AddChild(ANode,DMTCCoreLink.GroupsObject.GetGroupName(AItem.NesteldNodes[i].Group1 ))
           else
           NewNode := TVMain.Items.AddChild(ANode,DMTCCoreLink.AccObject.getAccountFullDescription(AItem.NesteldNodes[i].AccountID)  );

           NewNode.Data := AItem.NesteldNodes[i] ;
           HandelImageIndexOnTreeNode(NewNode) ;
           BuildTree(NewNode,AItem.NesteldNodes[i]);
        end;
     end;
end;

Procedure  TGeneralEditAccount.RecurceTree(AItem : TOSFLedgerItem ;GroupType : Integer ) ;
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
    AQuery.sql.Text := format('Select * From Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo  ',[IntToStr(GroupType),IntToStr(AItem.Group1),ExtraSql]);
    AQuery.open ;
    while not AQuery.Eof do
      begin
       //  done : Pieter Just remeber the ID in the data property by casting it to Tobject
       ALedgerItem := TOSFLedgerItem(AItem.NesteldNodes.Add(AItem));

       ALedgerItem.Name := AQuery.FieldByName('SDescription').AsString;
       ALedgerItem.IsGroupNode := true ;
       ALedgerItem.Group1 := AQuery.FieldByName('WGroupID').AsInteger;
       ALedgerItem.SortNo := AQuery.FieldByName('WSORTNO').AsInteger;
       ALedgerItem.FinancialCategory := AQuery.FieldByName('WParentGroup1ID').AsInteger;
       ALedgerItem.GroupType := GroupType ;
       // recursion
       RecurceTree(ALedgerItem,GroupType);
       AQuery.next ;
      end;
   finally
     AQuery.free ;
   end;
end;



procedure TGeneralEditAccount.UpdateGridControls;
 
begin

end;

procedure TGeneralEditAccount.FormShow(Sender: TObject);


begin

TSLedger.TabVisible := false ;
TSGroup.TabVisible := false ;
tsTranslations.TabVisible := false ;
useTrn := DMTCCoreLink.IsRegistered('{79313418-498D-4D5D-9758-ACEEEF467B25}') ;

EBudYear.Text := FormatDateTime('yyyy',now);
TDatabaseRegistyRoutines.ReadFormPos(self,'');
PCGLType.Top := - 21 ;
DebtorAccount :=  DMTCCoreLink.OpenSqlReturnFirstColumn('Select  WDEBTORSCONTROLID from sysvars');
CreditorAccount := DMTCCoreLink.OpenSqlReturnFirstColumn('Select  WCREDITORSCONTROLID from sysvars');
Proffitlosslastyear := DMTCCoreLink.OpenSqlReturnFirstColumn('Select  WRETAINEDINCOMEID from sysvars');
TDataBaseRoutines.GetBatchesList(cbPayments.Items,'Bcashbook =1');
TDataBaseRoutines.GetBatchesList(cbReceipts.Items,'Bcashbook =1');
TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup1.Items,20);
TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,21);

LcbLinkTaxAccount.Caption :=  DMTCCoreLink.GetTextLang(3178);

LPosted.Caption := DMTCCoreLink.GetTextLang(961);

LFliterAccountDesc.Caption := DMTCCoreLink.GetTextLang(1708);
tslinks.Caption := DMTCCoreLink.GetTextLang(3179);
LAccType.Caption := DMTCCoreLink.GetTextLang(1109);

cxGrid3DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(607);

  Showtype.Caption := DMTCCoreLink.GetTextLang(3294);
  cbTaxShowType.Items[0] := DMTCCoreLink.GetTextLang(3298);
  cbTaxShowType.Items[1] := DMTCCoreLink.GetTextLang(3295);
  cbTaxShowType.Items[2] := DMTCCoreLink.GetTextLang(3296);
  cbTaxShowType.Items[3] := DMTCCoreLink.GetTextLang(3297);


self.Caption := DMTCCoreLink.GetTextLangNoAmp(22);
//Description 178
LEAccountName.Caption := DMTCCoreLink.GetTextLang(178);
//Rep Group 1
LGroup1.Caption := TDataBaseRoutines.GetTypeDescription(20);
//Rep Group 2
LGroup2.Caption := TDataBaseRoutines.GetTypeDescription(21);
//Payments
LcbPayments.Caption := DMTCCoreLink.GetTextLang(181);
//Receipts
LcbReceipts.Caption := DMTCCoreLink.GetTextLang(182);

LSearchAccount.Caption := DMTCCoreLink.GetTextLang(3051);

//General ledger
cbAccountType.Items[0] :=  DMTCCoreLink.GetTextLang(1372);
//Bank / cash
cbAccountType.Items[1] :=  DMTCCoreLink.GetTextLangNoAmp(29);
//Tax
cbAccountType.Items[2] :=  DMTCCoreLink.GetTextLangNoAmp(63);

//Balans
cbIncomeExpence.Items[0] :=  DMTCCoreLink.GetTextLangNoAmp(1000) ;
//Income expence
cbIncomeExpence.Items[1] :=  DMTCCoreLink.GetTextLangNoAmp(206);

//Active
CBInActive.Items[0] := DMTCCoreLink.GetTextLangNoAmp(1322);
//Inactive
CBInActive.Items[1] := DMTCCoreLink.GetTextLangNoAmp(304);

//No
cbOpenItem.Items[0] := DMTCCoreLink.GetTextLangNoAmp(1);
//Yes
cbOpenItem.Items[1] := DMTCCoreLink.GetTextLangNoAmp(2);


cbExpand.Caption   := DMTCCoreLink.GetTextLangNoAmp(3052);
LGroupName.Caption := DMTCCoreLink.GetTextLangNoAmp(185);
LFinCat.Caption := DMTCCoreLink.GetTextLangNoAmp(3063) ;
tsBudget.Caption := DMTCCoreLink.GetTextLangNoAmp(1027);
tsTax.Caption := DMTCCoreLink.GetTextLangNoAmp(1863);
tsBank.Caption := DMTCCoreLink.GetTextLangNoAmp(1924);

LPercentage.Caption := DMTCCoreLink.GetTextLangNoAmp(209);
LUSeTaxLink.Caption := DMTCCoreLink.GetTextLangNoAmp(3053);
LLinkTax.Caption := DMTCCoreLink.GetTextLangNoAmp(3054);
LContraTax.Caption := DMTCCoreLink.GetTextLangNoAmp(3055);
LOpenItem.Caption := DMTCCoreLink.GetTextLangNoAmp(3038);

AAddAccount.Caption  := DMTCCoreLink.GetTextLangNoAmp(292);
AAddAccount.Hint := AAddAccount.Caption + ':' + DMTCCoreLink.GetTextLangNoAmp(608) ;

APostAccount.Caption  := DMTCCoreLink.GetTextLangNoAmp(726);
APostAccount.hint := APostAccount.Caption ;

ADeleteAccount.Caption  := DMTCCoreLink.GetTextLangNoAmp(2248);
ADeleteAccount.hint :=  ADeleteAccount.Caption  ;
AAddSubAccount.Caption  := DMTCCoreLink.GetTextLangNoAmp(292);
AAddSubAccount.hint := AAddSubAccount.Caption ;
ARefresh.Caption  := DMTCCoreLink.GetTextLangNoAmp(3056);
ARefresh.hint := ARefresh.Caption  ;
AExpand.Caption := DMTCCoreLink.GetTextLangNoAmp(3057);
AExpand.hint := AExpand.Caption ;
AColaps.Caption := DMTCCoreLink.GetTextLangNoAmp(3058);
AColaps.hint :=   AColaps.Caption ;
AMoveGroupUp.Caption := DMTCCoreLink.GetTextLangNoAmp(1843);
AMoveGroupUp.hint :=  AMoveGroupUp.Caption ;
AMoveGroupDown.Caption := DMTCCoreLink.GetTextLangNoAmp(1844);
AMoveGroupDown.hint :=   AMoveGroupDown.Caption;
AMoveGroupLevelToLower.Caption := DMTCCoreLink.GetTextLangNoAmp(3059);
AMoveGroupLevelToLower.hint :=  AMoveGroupLevelToLower.Caption  ;
ADeleteGroup.Caption := DMTCCoreLink.GetTextLangNoAmp(2248);
ADeleteGroup.hint :=  ADeleteGroup.Caption  ;
AAddGroup.Caption   := DMTCCoreLink.GetTextLangNoAmp(292);
AAddGroup.Hint :=  AAddGroup.Caption +':' + DMTCCoreLink.GetTextLangNoAmp(345) ;
APostGroup.Caption := DMTCCoreLink.GetTextLangNoAmp(726);
APostGroup.hint :=  APostGroup.Caption ;

LAccountType.Caption := DMTCCoreLink.GetTextLangNoAmp(1935);
LAccountCode.Caption := DMTCCoreLink.GetTextLangNoAmp(176);

CBSubaccounts.Caption := DMTCCoreLink.GetTextLangNoAmp(3060);
LStatus.Caption := DMTCCoreLink.GetTextLangNoAmp(1293);
LAmount.Caption := DMTCCoreLink.GetTextLangNoAmp(2228);
LPEriods.Caption := DMTCCoreLink.GetTextLangNoAmp(1046);
LYear.Caption := DMTCCoreLink.GetTextLangNoAmp(901022);

BSetPeriodBuget.Caption := DMTCCoreLink.GetTextLangNoAmp(3062);

LSort.Caption  := DMTCCoreLink.GetTextLangNoAmp(2242);
//Group1
CBGroup.Items[0] := DMTCCoreLink.GetTextLangNoAmp(179);
//Group2
CBGroup.Items[1] := DMTCCoreLink.GetTextLangNoAmp(180);
//FinCat
CBGroup.Items[2] := DMTCCoreLink.GetTextLangNoAmp(3063);
//No group
CBGroup.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1057);




  if not DMTCCoreLink.ReadNwReportOp('CBViewAllBankState',false) then
    begin
       LcbPayments.Caption := DMTCCoreLink.GetTextLang(181) + ' / ' + DMTCCoreLink.GetTextLang(182) ;
       LcbReceipts.Visible := false ;
       cbReceipts.Visible := false ;
    end;
   cxGrid2DBTableView1WJOBCODEID.Caption := DMTCCoreLink.GetTextLang(3556) ;


CBGroup.ItemIndex := DMTCCoreLink.ReadNwReportOp('EDITAC_SORT',3);
cbExpand.Checked := DMTCCoreLink.ReadNwReportOp('EDITAC_EXPAFTER',false);
EFilerAccount.text := DMTCCoreLink.ReadNwReportOp('EDITAC_FILTER','');
qprojects.Close ;
qprojects.Open ;
 cxGrid2DBTableView1WJOBCODEID.Visible := not qprojects.IsEmpty ;
ARefresh.Execute;

 BSaveAccount.Action := APostAccount ;
end;

procedure TGeneralEditAccount.FormCreate(Sender: TObject);
begin

aLanguageList := TStringlist.create ;
cxGrid2DBTableView1WREPORTINGGROUP1ID.Visible :=  TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(cxGrid2DBTableView1WREPORTINGGROUP1ID.Properties),1002) ;
cxGrid2DBTableView1WREPORTINGGROUP2ID.Visible :=  TDatabaseTableRoutines.FillStringsWithReportingGroups(TcxImageComboBoxProperties(cxGrid2DBTableView1WREPORTINGGROUP2ID.Properties),1003);
DMTCCoreLink.GroupsObject.FillListWithReportingGroup(1004,aLanguageList);

DMCoreAccountData:= TDMCoreAccountData.create(self);
LedgerCalculationClass := TOSFLedgerCalculationClass.Create(self,TOSFLedgerItem) ;
DMTCCoreLink.AssignConnectionToChilds(self);
ZQSetOFBookIsEmpty.open ;
BSetOfBooksIsEmpty := ZQSetOFBookIsEmpty.IsEmpty ;
ASubAccountDataset := TVirtualTable.Create(self) ;
ATranslationsDataset := TVirtualTable.Create(self) ;
dsTranslations.DataSet := ATranslationsDataset ;
ATranslationsDataset.BeforePost := ZQLinksAfterDelete ;
dsSubAccounts.DataSet := ASubAccountDataset ;
ZQSetOFBookIsEmpty.close ;
ATranslationsDataset.FieldDefs.Add('WLANGID',ftInteger);
ATranslationsDataset.FieldDefs.Add('SLANG',ftString,255);
ATranslationsDataset.FieldDefs.Add('SDESCRIPTION',ftString,255);

EAccountName.MaxLength :=DMTCCoreLink.GetFieldLength('ACCOUNT','SDESCRIPTION')  ;
CBFinCategory.Items[0] := DMTCCoreLink.GetTextLangNoAmp(3260);
CBFinCategory.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1151);
CBFinCategory.Items[2] := DMTCCoreLink.GetTextLangNoAmp(1914);
CBFinCategory.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1915);
CBFinCategory.Items[4] := DMTCCoreLink.GetTextLangNoAmp(1916);
CBFinCategory.Items[5] := DMTCCoreLink.GetTextLangNoAmp(1917);
cbPayments.MaxLength :=  DMTCCoreLink.GetFieldLength('BATTYPES','SDESCRIPTION') ;
cbReceipts.MaxLength := cbPayments.MaxLength  ;
uosfvisuals.ChangeDBNavigatorIcons(DBNavigator2);
uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);

cxGrid2DBTableView1DDATE.Caption := DMTCCoreLink.GetTextLangNoAmp(238);
cxGrid2DBTableView1FAMOUNT.Caption := DMTCCoreLink.GetTextLangNoAmp(946);
cxGrid2DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLangNoAmp(1719);
cxGrid2DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLangNoAmp(178);
cxGrid2DBTableView1WREPORTINGGROUP1ID.Caption := TDataBaseRoutines.GetTypeDescription(1002);
cxGrid2DBTableView1WREPORTINGGROUP2ID.Caption := TDataBaseRoutines.GetTypeDescription(1003);
cxGrid2DBTableView1DSYSDATE.Caption := DMTCCoreLink.GetTextLangNoAmp(3434);



end;

procedure TGeneralEditAccount.FormDestroy(Sender: TObject);
begin
aLanguageList.free ;
ASubAccountDataset.Free ;
ATranslationsDataset.free ;
LedgerCalculationClass.free ;
DMCoreAccountData.free ;
DMTCCoreLink.WriteNwReportOp('EDITAC_SORT',IntToStr(CBGroup.ItemIndex));
DMTCCoreLink.WriteNwReportOp('EDITAC_EXPAFTER',BoolToStr(cbExpand.Checked,true));
DMTCCoreLink.WriteNwReportOp('EDITAC_FILTER',EFilerAccount.text);
end;

procedure TGeneralEditAccount.TVMainChange(Sender: TObject;
  Node: TTreeNode);

begin
try
  if Node = nil then
    begin
     TSLedger.TabVisible := false ;
     TSGroup.TabVisible := false ;
     tsTranslations.TabVisible := false ;
     PCGLType.ActivePage := nil ;
     exit ;
    end;

if node.Parent = nil then
  begin
    TSLedger.TabVisible := false ;
    TSGroup.TabVisible := false ;
    PCGLType.ActivePage := nil ;
    tsTranslations.TabVisible := false ;
    exit ;
  end;

 if not TOSFLedgerItem(node.Data).IsGroupNode then
   begin
    PCGLType.ActivePage := TSLedger ;
    HandelAccountNode(node) ;
   end else
   begin
    PCGLType.ActivePage := TSGroup ;
     case TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory  of
     69 : CBFinCategory.ItemIndex := 1 ;
     67 : CBFinCategory.ItemIndex := 2 ;
     66 : CBFinCategory.ItemIndex := 3 ;
     68 : CBFinCategory.ItemIndex := 4 ;
     65 : CBFinCategory.ItemIndex := 5 ;
     else
      CBFinCategory.ItemIndex := 0 ;
     end;
      EGroupname.Text :=  TOSFLedgerItem(node.Data).Name ;
      APostGroup.Visible := false ;
   end;
  finally
    MyUpdateActions ;
  end;
end;

procedure TGeneralEditAccount.EGroupnameChange(Sender: TObject);
begin
 APostGroup.Visible := true ;
end;

procedure TGeneralEditAccount.TVMainDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  TargetNode, SourceNode: TTreeNode;
  ParentID, i:integer;

begin
  TargetNode := TVMain.GetNodeAt (X, Y);
  if TargetNode = nil then exit;
  if TargetNode.Data <> nil then
  begin
  if TOSFLedgerItem(TargetNode.Data).IsGroupNode then
  begin
    SourceNode := TVMain.Selected;
    if  TOSFLedgerItem(SourceNode.Data).IsGroupNode then
     begin
      SourceNode.MoveTo (TargetNode, naAddChildFirst);
      TargetNode.Expand (False);
      TVMain.Selected := TargetNode;
      {Update table Parents Links}
      if (TargetNode = TVMain.Selected ) then
      begin
        TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(SourceNode.Data).Name,TOSFLedgerItem(SourceNode.Data).Group1,TOSFLedgerItem(TargetNode.Data).Group1,TOSFLedgerItem(SourceNode.Data).SortNo,TOSFLedgerItem(SourceNode.Data).FinancialCategory);
        TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup1.Items,20);
        TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,21);
      end;
     end else // end source is group.
     begin
        SourceNode.MoveTo (TargetNode, naAddChildFirst);
        TargetNode.Expand (False);
        TOSFLedgerItem(SourceNode.Data).GroupType :=  TOSFLedgerItem( TargetNode.Data).GroupType ;
        TOSFLedgerItem(SourceNode.Data).Group1 :=  TOSFLedgerItem( TargetNode.Data).Group1 ;
        DMCoreAccountData.SaveAccount(TOSFLedgerItem(SourceNode.Data),false);
        for i := 0 to TOSFLedgerItem(SourceNode.Data).NesteldNodes.Count -1 do
          begin
              TOSFLedgerItem(SourceNode.Data).NesteldNodes[i].Group1 :=  TOSFLedgerItem(SourceNode.Data).Group1 ;
              TOSFLedgerItem(SourceNode.Data).NesteldNodes[i].GroupType :=  TOSFLedgerItem(SourceNode.Data).GroupType ;
              DMCoreAccountData.SaveAccount(TOSFLedgerItem(SourceNode.Data).NesteldNodes[i],false);
          end;
        HandelAccountNode(SourceNode);
     end;
  end else  // end target is group node.
  begin
    if TargetNode.Parent = nil then exit ;
    SourceNode := TVMain.Selected;
    if TOSFLedgerItem(SourceNode.Data).IsGroupNode then
     begin
       SourceNode.MoveTo (TargetNode.Parent, naAddChildFirst);
       TargetNode.Expand (False);
       TVMain.Selected := TargetNode;
       {Update table Parents Links}
       TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(SourceNode.Data).Name,TOSFLedgerItem(SourceNode.Data).Group1,TOSFLedgerItem(TargetNode.Parent.Data).Group1,TOSFLedgerItem(SourceNode.Data).SortNo,TOSFLedgerItem(SourceNode.Data).FinancialCategory);
       TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup1.Items,20);
       TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,21);
     end else // end source is group.
     begin
        SourceNode.MoveTo (TargetNode.Parent, naAddChildFirst);
        TargetNode.Expand (False);
        TOSFLedgerItem(SourceNode.Data).GroupType := TOSFLedgerItem( TargetNode.Parent.Data).GroupType ;
        TOSFLedgerItem(SourceNode.Data).Group1 :=  TOSFLedgerItem( TargetNode.Parent.Data).Group1 ;
        DMCoreAccountData.SaveAccount(TOSFLedgerItem(SourceNode.Data),false);
        for i := 0 to TOSFLedgerItem(SourceNode.Data).NesteldNodes.Count -1 do
          begin
              TOSFLedgerItem(SourceNode.Data).NesteldNodes[i].GroupType :=  TOSFLedgerItem(SourceNode.Data).GroupType ;
              TOSFLedgerItem(SourceNode.Data).NesteldNodes[i].Group1 :=  TOSFLedgerItem(SourceNode.Data).Group1 ;
              DMCoreAccountData.SaveAccount(TOSFLedgerItem(SourceNode.Data).NesteldNodes[i],false);
          end;
        HandelAccountNode(SourceNode);   
     end;
  end;
  end else
  begin
    SourceNode := TVMain.Selected;
  // This is financial categories.
    if  TOSFLedgerItem(SourceNode.Data).IsGroupNode then
     begin
      SourceNode.MoveTo (TargetNode, naAddChildFirst);
      TargetNode.Expand (False);
      TVMain.Selected := TargetNode;
      {Update table Parents Links}

      if (TargetNode = TVMain.Selected ) then
      begin
        TOSFLedgerItem(SourceNode.Data).FinancialCategory := GetFinCatIndex(TargetNode) ;
        TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(SourceNode.Data).Name,TOSFLedgerItem(SourceNode.Data).Group1,0,TOSFLedgerItem(SourceNode.Data).SortNo,TOSFLedgerItem(SourceNode.Data).FinancialCategory);
        TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup1.Items,20);
        TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,21);
      end;
     end ;
  end;
end;

procedure TGeneralEditAccount.TVMainDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  TargetNode, SourceNode: TTreeNode;
begin
  TargetNode := TVMain.GetNodeAt (X, Y);
  // accept dragging from itself
  if (Source = Sender) and (TargetNode <> nil) then
  begin
    Accept := True;
    // determines source and target
    SourceNode := TVMain.Selected;
    // look up the target parent chain
    while ((TargetNode.Parent <> nil) and (TargetNode.Parent.data <> nil)) and
        (TargetNode <> SourceNode) do
      TargetNode := TargetNode.Parent;
    // if source is found
    if TargetNode = SourceNode then
      // do not allow dragging over a child
      Accept := False;
    if TargetNode = nil then
       Accept := False
       else
    if (TargetNode.Data = nil) or (SourceNode.Data = nil) then
       begin
       Accept := False;
       if CBGroup.ItemIndex = 2 then
         begin
           Accept := SourceNode.data <> nil ;
           exit ;
         end;
       end;

      if Accept then
       begin
        if not TOSFLedgerItem(TargetNode.Data).IsGroupNode then
             Accept := False;
        if TOSFLedgerItem(TargetNode.Data).isSubAccount then
             Accept := False;
        if TOSFLedgerItem(SourceNode.Data).isSubAccount then
             Accept := False;
       end;
  end
  else
    Accept := False;
end;

procedure TGeneralEditAccount.CBFinCategoryChange(Sender: TObject);
begin
 APostGroup.Visible := true ; 
end;

procedure TGeneralEditAccount.HandelAccountNode(Node : TTreeNode );
var
 i : Integer ;
begin
    if useTrn then
       begin
          ATranslationsDataset.open ;
          while not ATranslationsDataset.IsEmpty do
            ATranslationsDataset.Delete;
          ZQAccTranslation.Close ;
          ZQAccTranslation.params[0].AsInteger :=  TOSFLedgerItem(node.Data).AccountID ;
          ZQAccTranslation.Open ;
          for i := 0 to aLanguageList.Count -1 do
             begin
               ATranslationsDataset.Insert ;
               ATranslationsDataset.FieldByName('WLANGID').AsInteger := Integer(aLanguageList.objects[i]) ;
               ATranslationsDataset.FieldByName('SLANG').AsString :=  aLanguageList[i] ;
               if ZQAccTranslation.Locate('WLANGUAGEID',ATranslationsDataset.FieldByName('WLANGID').AsInteger,[]) then
                  ATranslationsDataset.FieldByName('SDESCRIPTION').AsString :=   ZQAccTranslationSDESCRIPTION.AsString
                 else
                 ATranslationsDataset.FieldByName('SDESCRIPTION').AsString :=  Trim(TOSFLedgerItem(node.Data).Name) ;
                 ATranslationsDataset.post ;
             end;
          tsTranslations.TabVisible := not ATranslationsDataset.IsEmpty ;
       end;
    //ATranslationsDataset.


     EAccountMain.Text := copY(TOSFLedgerItem(node.Data).Accountcode,1,DMTCCoreLink.MainAccountLength);
     EAccountSub.Text := TOSFLedgerItem(node.Data).SubAccountCode ;
     case TOSFLedgerItem(node.Data).LedgerType of
     0 : cbAccountType.ItemIndex := 0 ;
     3 : cbAccountType.ItemIndex := 1 ;
     4 : cbAccountType.ItemIndex := 2 ;
     end;


     cbGroup1.ItemIndex := cbGroup1.Items.IndexOfObject(TObject(TOSFLedgerItem(node.Data).Group1ID));
     cbGroup2.ItemIndex := cbGroup2.Items.IndexOfObject(TObject(TOSFLedgerItem(node.Data).Group2ID));

     EAccountName.Text := trim(TOSFLedgerItem(node.Data).Name) ;
     cbIncomeExpence.ItemIndex :=  ord(TOSFLedgerItem(node.Data).IncomeExpence);

     ZQLinks.close ;
     ZQLinks.Params[0].AsInteger := TOSFLedgerItem(node.Data).AccountID ;
     ZQLinks.Open ;


     ZQHasTransactions.close ;
     ZQHasTransactions.Params[0].AsInteger := TOSFLedgerItem(node.Data).AccountID ;

     ZQHasTransactions.open ;
     ETransactions.Text := ZQHasTransactions.Fields[0].AsString ;
     // disable type and account
     EAccountMain.Enabled := (ZQHasTransactions.Fields[0].AsString = '0') and (not TOSFLedgerItem(node.Data).isSubAccount) and (TOSFLedgerItem(node.Data).NesteldNodes.Count = 0) ;
     EAccountSub.Enabled :=  (ZQHasTransactions.Fields[0].AsString = '0') and (TOSFLedgerItem(node.Data).isSubAccount) ;

     CBSubaccounts.Enabled := (ZQHasTransactions.Fields[0].AsString = '0') and (TOSFLedgerItem(node.Data).NesteldNodes.Count = 0) and (not TOSFLedgerItem(node.Data).isSubAccount);

     // only new items
     cbAccountType.Enabled := TOSFLedgerItem(node.Data).AccountID = -1 ;
     cbIncomeExpence.Enabled := EAccountMain.Enabled ;
     CBInActive.ItemIndex := ord(TOSFLedgerItem(node.Data).Inactive);
     cbOpenItem.ItemIndex := ord(TOSFLedgerItem(node.Data).OpenItem);
     CBSubaccounts.Checked :=  TOSFLedgerItem(node.Data).SubAccounts ;

     tsBudget.Enabled := not CBSubaccounts.Checked  ;

     cbPayments.Enabled := ZQHasTransactions.Fields[0].AsString = '0' ;
     cbReceipts.Enabled := ZQHasTransactions.Fields[0].AsString = '0' ;

     PAccounting.Visible := True ;
     if  TOSFLedgerItem(node.Data).ControlAccountType <> 0 then
       begin
          EAccountSub.Enabled := false ;
          PAccounting.Visible := false ;
          if not BSetOfBooksIsEmpty then
            begin
               EAccountMain.Enabled := false ;

            end;
       end;
       // buget
    // PCAccountDetails.ActivePageIndex := 0 ;

     ZQNewBudget.close ;
     ZQNewBudget.Params[0].AsInteger := TOSFLedgerItem(node.Data).AccountID ;
     ZQNewBudget.Open ;
     edtPercent.Text := FloatToStr(TOSFLedgerItem(node.Data).TaxRate);
     // load taxes
  TDataBaseStringRoutines.FillStringListWithSelect(cbbLinkTaxId.Items,'select WAccountID,SAccountCode||'+ QuotedStr(' ')+' ||SDescription from ACCOUNT where WAccountTypeId = 4 and WAccountId not in(0,'
  + IntToStr(TOSFLedgerItem(node.Data).AccountID) + ')' ) ;

  TDataBaseStringRoutines.FillStringListWithSelect(cbLinkTaxAccount.Items,'select WAccountID,SAccountCode||'+ QuotedStr(' ')+' ||SDescription from ACCOUNT where WAccountTypeId = 4 ' ) ;

  cbbLinkTaxId.ItemIndex := TDataBaseStringRoutines.GetItemIndexFromId(cbbLinkTaxId.Items,TOSFLedgerItem(node.Data).LinkTax);

  cbLinkTaxAccount.ItemIndex := TDataBaseStringRoutines.GetItemIndexFromId(cbLinkTaxAccount.Items,TOSFLedgerItem(node.Data).TaxAccountid);
  cbLinkTaxAccount.Visible := TOSFLedgerItem(node.Data).LedgerType = 0 ;
  lcbLinkTaxAccount.Visible := TOSFLedgerItem(node.Data).LedgerType = 0 ;

  cbTaxShowType.ItemIndex := TOSFLedgerItem(node.Data).TaxType  ;
  CBUseTaxLink.Checked := TOSFLedgerItem(node.Data).LinkTax <> 0 ;
  CBContraTax.Checked := TOSFLedgerItem(node.Data).UseContraTax ;
  cbPayments.Text := TOSFLedgerItem(node.Data).PaymentBatchName ;
  cbReceipts.Text := TOSFLedgerItem(node.Data).ReceiptsBatchName ;
  APostAccount.Visible := false ;
end;

procedure TGeneralEditAccount.ZQBugetsWPERIODIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
  text := TDataBaseRoutines.GetPeriodDescription(Sender.DataSet.fieldByName('WPERIODID').AsInteger,Sender.DataSet.fieldByName('WYEARID').AsInteger);
  if Sender.DataSet.fieldByName('WPERIODID').AsInteger = 0 then
    text := DMTCCoreLink.getTextLang(1066);
end;


procedure TGeneralEditAccount.AAddGroupExecute(Sender: TObject);
var
   aOSFLedgerItem : TOSFLedgerItem ;
   ANewNode,ARootNode : TTreeNode ;
begin
  if TVMain.Selected = nil then exit ;
  if TVMain.Selected.Data <> nil then
  begin
  if TOSFLedgerItem(TVMain.Selected.Data).IsGroupNode then
    begin
     ARootNode :=  TVMain.Selected ;
     aOSFLedgerItem := TOSFLedgerItem(ARootNode.Data).NesteldNodes.add(TOSFLedgerItem(ARootNode.Data)) ;
     aOSFLedgerItem.Name := DMTCCoreLink.GetTextLangNoAmp(1855);
     aOSFLedgerItem.IsGroupNode := true ;
     aOSFLedgerItem.FinancialCategory := TOSFLedgerItem(ARootNode.Data).FinancialCategory ;
     aOSFLedgerItem.GroupType := TOSFLedgerItem(ARootNode.Data).GroupType ;
     aOSFLedgerItem.Group1 := TDataBaseRoutines.AddGroup(aOSFLedgerItem.Name, aOSFLedgerItem.GroupType,TOSFLedgerItem(ARootNode.Data).Group1,TOSFLedgerItem(ARootNode.Data).FinancialCategory);
     aOSFLedgerItem.SortNo :=  aOSFLedgerItem.Group1 ;
     if TVMain.Selected.Parent <> nil then
     begin
     if TVMain.Selected.getNextSibling <> nil then
     ANewNode := TVMain.Items.Insert(TVMain.Selected.getNextSibling,aOSFLedgerItem.GetAccountText)
     else
     ANewNode := TVMain.Items.Add(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;
     end else
     begin
       if (CBGroup.ItemIndex = 2) then
       begin
       ANewNode := TVMain.Items.AddChild(FindFinCatNode(TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory),aOSFLedgerItem.GetAccountText)
       end else
        ANewNode := TVMain.Items.AddChild(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;

     end;

     ANewNode.Data :=  aOSFLedgerItem ;
     HandelImageIndexOnTreeNode(ANewNode);
     ANewNode.Selected := true ;
    end else
    begin
       if TVMain.Selected.Parent <> nil then
        if TVMain.Selected.Parent.Data <> nil then
         if TOSFLedgerItem(TVMain.Selected.Parent.Data).IsGroupNode then
         begin
           ARootNode :=  TVMain.Selected.Parent ;
           aOSFLedgerItem := TOSFLedgerItem(ARootNode.Data).NesteldNodes.add(TOSFLedgerItem(ARootNode.Data)) ;
           aOSFLedgerItem.Name := DMTCCoreLink.GetTextLangNoAmp(1855);
           aOSFLedgerItem.IsGroupNode := true ;
           
           aOSFLedgerItem.FinancialCategory := TOSFLedgerItem(ARootNode.Data).GroupType ;
           aOSFLedgerItem.GroupType := TOSFLedgerItem(ARootNode.Data).FinancialCategory ;
           aOSFLedgerItem.Group1 := TDataBaseRoutines.AddGroup(aOSFLedgerItem.Name, aOSFLedgerItem.GroupType,TOSFLedgerItem(ARootNode.Data).Group1,TOSFLedgerItem(ARootNode.Data).FinancialCategory);
           aOSFLedgerItem.SortNo := aOSFLedgerItem.Group1 ;
           if TVMain.Selected.getNextSibling <> nil then
           ANewNode := TVMain.Items.Insert(TVMain.Selected.getNextSibling,aOSFLedgerItem.GetAccountText)
           else
           ANewNode := TVMain.Items.Add(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;

           ANewNode.Data :=  aOSFLedgerItem ;
           HandelImageIndexOnTreeNode(ANewNode);
           ANewNode.Selected := true ;
         end;
    end;
   end else
   begin
     ARootNode :=  TVMain.Selected ;
     aOSFLedgerItem := LedgerCalculationClass.LedgerItems[0].NesteldNodes.add(LedgerCalculationClass.LedgerItems[0]) ;
     aOSFLedgerItem.Name := DMTCCoreLink.GetTextLangNoAmp(1855);
     aOSFLedgerItem.IsGroupNode := true ;
     aOSFLedgerItem.FinancialCategory := GetFinCatIndex(ARootNode);
     aOSFLedgerItem.GroupType := LedgerCalculationClass.LedgerItems[0].GroupType ;
     aOSFLedgerItem.Group1 := TDataBaseRoutines.AddGroup(aOSFLedgerItem.Name, aOSFLedgerItem.GroupType,aOSFLedgerItem.Group1,aOSFLedgerItem.FinancialCategory);
     aOSFLedgerItem.SortNo :=  aOSFLedgerItem.Group1 ;
     ANewNode := TVMain.Items.AddChild(FindFinCatNode(aOSFLedgerItem.FinancialCategory),aOSFLedgerItem.GetAccountText) ;
     ANewNode.Data :=  aOSFLedgerItem ;
     HandelImageIndexOnTreeNode(ANewNode);
     ANewNode.Selected := true ;
   end;
end;

procedure TGeneralEditAccount.HandelImageIndexOnTreeNode(
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
               begin
                 if AItem.ControlAccountType = 1 then
                 ATreeNode.ImageIndex :=  19 else
                 ATreeNode.ImageIndex := 6
              end
              else
            if AItem.ControlAccountType = 3 then
              ATreeNode.ImageIndex := 5
              else
            if AItem.IncomeExpence then
              // income Expence
               ATreeNode.ImageIndex := 23
               else
               if (AItem.LedgerType in [1,2]) then
                begin
                 if AItem.LedgerType = 1 then
                 ATreeNode.ImageIndex := 19 else
                 ATreeNode.ImageIndex := 6
              end
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




procedure TGeneralEditAccount.SaveAccountNode(Node: TTreeNode);
var
 UpdateSubs : Boolean ;
 GroupUpdate : boolean ;
  aStartd,aEndd:TDateTime ;

 i : Integer ;
begin
  aStartd := TDataBaseRoutines.GetPeriodStartDate(14);
  aEndd  := IncMonth(aStartd,12) - 1 ;

  GroupUpdate := false ;
  UpdateSubs := false ;
     TOSFLedgerItem(node.Data).Accountcode := EAccountMain.Text + EAccountSub.Text ;
     TOSFLedgerItem(node.Data).SubAccountCode := EAccountSub.Text ;
     case cbAccountType.ItemIndex of
     0 : TOSFLedgerItem(node.Data).LedgerType := 0 ;
     1 : TOSFLedgerItem(node.Data).LedgerType := 3 ;
     2 : TOSFLedgerItem(node.Data).LedgerType := 4 ;
     end;

     TOSFLedgerItem(node.Data).SubAccounts := CBSubaccounts.Checked;

     if cbGroup1.ItemIndex <> - 1 then
       begin
        if TOSFLedgerItem(node.Data).Group1ID <> integer(cbGroup1.Items.objects[cbGroup1.ItemIndex]) then
           begin
            if CBGroup.ItemIndex = 0 then
              GroupUpdate := true ;
            if TOSFLedgerItem(node.Data).SubAccounts then
            UpdateSubs := OSFMessageDlg('Update subaccounts with this group?',mtConfirmation,[mbyes,mbno],0) = mryes ;
            TOSFLedgerItem(node.Data).Group1ID := integer(cbGroup1.Items.objects[cbGroup1.ItemIndex]);
           end;
       end;
     if cbGroup2.ItemIndex <> - 1 then
       begin
        if TOSFLedgerItem(node.Data).Group2ID <> integer(cbGroup2.Items.objects[cbGroup2.ItemIndex]) then
           begin
           if CBGroup.ItemIndex = 1 then
              GroupUpdate := true ;
           if TOSFLedgerItem(node.Data).SubAccounts then
           UpdateSubs := OSFMessageDlg('Update subaccounts with this group?',mtConfirmation,[mbyes,mbno],0) = mryes ;
           TOSFLedgerItem(node.Data).Group2ID := integer(cbGroup2.Items.objects[cbGroup2.ItemIndex]);
           end;
       end;

     TOSFLedgerItem(node.Data).Name := EAccountName.Text ;
     TOSFLedgerItem(node.Data).IncomeExpence := cbIncomeExpence.ItemIndex = 1;
     TOSFLedgerItem(node.Data).Inactive   := CBInActive.ItemIndex = 1;
     TOSFLedgerItem(node.Data).OpenItem   := cbOpenItem.ItemIndex = 1;

     TOSFLedgerItem(node.Data).TaxRate := StrToFloat(edtPercent.Text);
     if CBUseTaxLink.Checked then
     TOSFLedgerItem(node.Data).LinkTax := TDataBaseStringRoutines.GetIndexValue(cbbLinkTaxId.Items,cbbLinkTaxId.ItemIndex)
     else
     TOSFLedgerItem(node.Data).LinkTax := 0 ;
     TOSFLedgerItem(node.Data).TaxType := cbTaxShowType.ItemIndex ;
     TOSFLedgerItem(node.Data).UseContraTax := CBContraTax.Checked ;

     TOSFLedgerItem(node.Data).PaymentBatchName := cbPayments.Text  ;
     TOSFLedgerItem(node.Data).ReceiptsBatchName := cbReceipts.Text ;

     TOSFLedgerItem(node.Data).TaxAccountid := TDataBaseStringRoutines.GetIndexValue(cbLinkTaxAccount.Items,cbLinkTaxAccount.ItemIndex);

      if TOSFLedgerItem(node.Data).LedgerType = 3 then
        begin
           if TOSFLedgerItem(node.Data).PaymentBatchName = '' then
             begin
             TOSFLedgerItem(node.Data).PaymentBatchName := TOSFLedgerItem(node.Data).Accountcode+TOSFLedgerItem(node.Data).Name ;
              if cbReceipts.Visible then
               TOSFLedgerItem(node.Data).PaymentBatchName := 'Pay ' + TOSFLedgerItem(node.Data).PaymentBatchName ;
             end ;
           if TOSFLedgerItem(node.Data).ReceiptsBatchName = '' then
           begin
             TOSFLedgerItem(node.Data).ReceiptsBatchName := TOSFLedgerItem(node.Data).Accountcode+TOSFLedgerItem(node.Data).Name ;
             if cbReceipts.Visible then
               TOSFLedgerItem(node.Data).ReceiptsBatchName := 'Rec ' + TOSFLedgerItem(node.Data).ReceiptsBatchName ;
           end;
           TOSFLedgerItem(node.Data).PaymentBatchName := copy(TOSFLedgerItem(node.Data).PaymentBatchName,1,DMTCCoreLink.GetFieldLength('BATTYPES','SDESCRIPTION'))  ;
           TOSFLedgerItem(node.Data).ReceiptsBatchName := copy(TOSFLedgerItem(node.Data).ReceiptsBatchName,1,DMTCCoreLink.GetFieldLength('BATTYPES','SDESCRIPTION'))  ;
        end;
     DMCoreAccountData.SaveAccount(TOSFLedgerItem(node.Data),UpdateSubs);
     DMTCCoreLink.AccObject.Clear ;



     HandelImageIndexOnTreeNode(node);




     if ZQNewBudget.State <> dsBrowse then
        ZQNewBudget.post ;
     ZQNewBudget.DisableControls ;
     try
     ZQNewBudget.First ;
     while not ZQNewBudget.Eof do
        begin
             if ZQNewBudgetWACCOUNTID.AsInteger = 0 then
                begin
                 ZQNewBudget.edit ;
                 ZQNewBudgetWACCOUNTID.AsInteger :=  TOSFLedgerItem(node.Data).AccountID ;
                 ZQNewBudget.post ;
                end;
          ZQNewBudget.next ;
        end;
     finally
      ZQNewBudget.EnableControls ;
     end;
     ZQNewBudget.ApplyUpdates ;

       TOSFLedgerItem(node.Data).Total   :=  TDataBaseRoutines.GetBudgetDebCredOnDate(TOSFLedgerItem(node.Data).AccountID,True, aStartd,aEndd,True,0,0) ;
       TOSFLedgerItem(node.Data).Total   := TOSFLedgerItem(node.Data).Total +  TDataBaseRoutines.GetBudgetDebCredOnDate(TOSFLedgerItem(node.Data).AccountID,False, aStartd,aEndd,True,0,0) ;

        if TOSFLedgerItem(node.Data).IncomeExpence then
          TOSFLedgerItem(node.Data).ProffitLoss := TOSFLedgerItem(node.Data).Total  else
          TOSFLedgerItem(node.Data).Balans := TOSFLedgerItem(node.Data).Total ;

       if TOSFLedgerItem(node.Data).ParentNode <> nil then
        if TOSFLedgerItem(node.Data).ParentNode.SubAccounts then
          begin
             TOSFLedgerItem(node.Data).ParentNode.Total := TOSFLedgerItem(node.Data).ParentNode.CalculateGroups ;

          end;



     if (ZQLinks.State in [dsedit,dsInsert]) then
         ZQLinks.Post ;

     ZQLinks.first ;
     while not ZQLinks.Eof do
        begin
          if ZQLinksWACCOUNTREFID.AsInteger = 0 then
             begin
               ZQLinks.Edit ;
               ZQLinksWACCOUNTID.AsInteger := TOSFLedgerItem(node.Data).AccountID ;
               ZQLinksWACCOUNTREFID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_ACCOUNTREF_ID') ;
               ZQLinks.Post ;
             end;
          ZQLinks.next ;
        end;
     if ZQLinks.UpdatesPending then
       ZQLinks.ApplyUpdates ;

   if TOSFLedgerItem(node.Data).LedgerType = 3 then
     begin
      TDataBaseRoutines.GetBatchesList(cbPayments.Items,'Bcashbook =1');
      TDataBaseRoutines.GetBatchesList(cbReceipts.Items,'Bcashbook =1');
      cbPayments.Text := TOSFLedgerItem(node.Data).PaymentBatchName   ;
      cbReceipts.Text := TOSFLedgerItem(node.Data).ReceiptsBatchName  ;
     end;


    if useTrn then
       begin
          ZQAccTranslation.Close ;
          ZQAccTranslation.params[0].AsInteger :=  TOSFLedgerItem(node.Data).AccountID ;
          ZQAccTranslation.Open ;
          ATranslationsDataset.first ;
          while not ATranslationsDataset.eof do
             begin
               if ZQAccTranslation.Locate('WLANGUAGEID',ATranslationsDataset.FieldByName('WLANGID').AsInteger,[]) then
                begin
                  ZQAccTranslation.edit ;
                end else
                begin
                  ZQAccTranslation.Insert ;
                  ZQAccTranslationWACCOUNTID.AsInteger :=  TOSFLedgerItem(node.Data).AccountID ;
                  ZQAccTranslationWLANGUAGEID.AsInteger := ATranslationsDataset.FieldByName('WLANGID').AsInteger
                end ;

               ZQAccTranslationSDESCRIPTION.AsString := ATranslationsDataset.FieldByName('SDESCRIPTION').AsString ;
               ZQAccTranslation.post ;
              ATranslationsDataset.next ;
             end;
       end;  
     node.Text := DMTCCoreLink.AccObject.getAccountFullDescription(TOSFLedgerItem(node.Data).AccountID) ;
    TVMain.Repaint ;
    if GroupUpdate then
       ARefreshExecute(self)
    else
    TVMain.CustomSort(@CustomSortProc  ,0);

    MyUpdateActions;
end;


procedure TGeneralEditAccount.AAddAccountExecute(Sender: TObject);
var
   aOSFLedgerItem : TOSFLedgerItem ;
   ANewNode,ARootNode : TTreeNode ;
begin
  if TVMain.Selected = nil then exit ;
   if TVMain.Selected.Data = nil then exit ;
    if TOSFLedgerItem(TVMain.Selected.Data).IsGroupNode then
     begin
     ARootNode :=  TVMain.Selected ;
     aOSFLedgerItem := TOSFLedgerItem(ARootNode.Data).NesteldNodes.add(TOSFLedgerItem(ARootNode.Data)) ;
     aOSFLedgerItem.Name := DMTCCoreLink.GetTextLang(34) + '  ' + LowerCase(DMTCCoreLink.GetTextLang(185)) ;
     aOSFLedgerItem.IsGroupNode := false ;
     aOSFLedgerItem.FinancialCategory := TOSFLedgerItem(ARootNode.Data).GroupType ;
     aOSFLedgerItem.GroupType := TOSFLedgerItem(ARootNode.Data).GroupType ;
     aOSFLedgerItem.Group1 := TOSFLedgerItem(ARootNode.Data).Group1;
     aOSFLedgerItem.SubAccountCode := '000' ;
     aOSFLedgerItem.AccountID := -1 ;
     aOSFLedgerItem.LinkedAccountId := -1 ;
     if TVMain.Selected.Parent = nil then
      ANewNode := TVMain.Items.AddChild(TVMain.Selected,aOSFLedgerItem.GetAccountText) 
     else
     if TVMain.Selected.getNextSibling <> nil then
      ANewNode := TVMain.Items.Insert(TVMain.Selected.getNextSibling,aOSFLedgerItem.GetAccountText)
      else
     ANewNode := TVMain.Items.Add(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;
     ANewNode.Data :=  aOSFLedgerItem ;
     HandelImageIndexOnTreeNode(ANewNode);
     ANewNode.Selected := true ;
     aOSFLedgerItem.AccountID := 0 ;
    end else
    begin
       if TVMain.Selected.Parent <> nil then
        if TVMain.Selected.Parent.Data <> nil then
         if TOSFLedgerItem(TVMain.Selected.Parent.Data).IsGroupNode then
         begin
           ARootNode :=  TVMain.Selected.Parent ;
           // add sib for subgroep
           IF  TOSFLedgerItem(TVMain.Selected.Data).SubAccounts then
               ARootNode :=  TVMain.Selected ;

           aOSFLedgerItem := TOSFLedgerItem(ARootNode.Data).NesteldNodes.add(TOSFLedgerItem(ARootNode.Data)) ;
           aOSFLedgerItem.Name := DMTCCoreLink.GetTextLang(34) + '  ' + LowerCase(DMTCCoreLink.GetTextLang(185)) ;
           aOSFLedgerItem.SubAccountCode := '000' ;
           if TOSFLedgerItem(ARootNode.Data).SubAccounts then
           aOSFLedgerItem.Accountcode := TOSFLedgerItem(ARootNode.Data).Accountcode
           else
           aOSFLedgerItem.Accountcode := TDataBaseStringRoutines.IncrementString(copy(TOSFLedgerItem(TVMain.Selected.Data).Accountcode,1,DMTCCoreLink.MainAccountLength)) + '000' ;
           aOSFLedgerItem.IsGroupNode := false ;
           aOSFLedgerItem.LedgerType := TOSFLedgerItem(TVMain.Selected.Data).LedgerType ;
           aOSFLedgerItem.IncomeExpence := TOSFLedgerItem(TVMain.Selected.Data).IncomeExpence ;
           aOSFLedgerItem.OpenItem := TOSFLedgerItem(TVMain.Selected.Data).OpenItem ;

           aOSFLedgerItem.FinancialCategory := TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory ;
           aOSFLedgerItem.GroupType := TOSFLedgerItem(TVMain.Selected.Data).GroupType ;
           aOSFLedgerItem.Group1 := TOSFLedgerItem(TVMain.Selected.Data).Group1;
           aOSFLedgerItem.AccountID := -1 ;
           if TOSFLedgerItem(ARootNode.Data).SubAccounts then
           begin
            aOSFLedgerItem.LinkedAccountId := TOSFLedgerItem(ARootNode.Data).AccountID  ;
            ANewNode := TVMain.Items.AddChild(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;
           end
           else
           begin
            aOSFLedgerItem.LinkedAccountId := -1 ;
           if TVMain.Selected.getNextSibling <> nil then
           ANewNode := TVMain.Items.Insert(TVMain.Selected.getNextSibling,aOSFLedgerItem.GetAccountText)
           else
           ANewNode := TVMain.Items.Add(TVMain.Selected,aOSFLedgerItem.GetAccountText) ;
           end ;
           ANewNode.Data :=  aOSFLedgerItem ;
           HandelImageIndexOnTreeNode(ANewNode);
           ANewNode.Selected := true ;
           aOSFLedgerItem.AccountID := 0 ;
         end;
    end;
end;

procedure TGeneralEditAccount.EAccountMainChange(Sender: TObject);
begin
 APostAccount.Visible := true;
 tsTax.TabVisible :=  (cbAccountType.ItemIndex = 2) and (not CBSubaccounts.Checked);
 tsBank.TabVisible := (cbAccountType.ItemIndex = 1) and (not CBSubaccounts.Checked);

     if not Panel1.Visible  then
       begin
         // Budget mode
         tsTax.TabVisible := false ;
         tsBank.TabVisible := false ;
         tslinks.TabVisible := false ;
       end;

end;

procedure TGeneralEditAccount.TVMainChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
  Var
  LedgerNode : TOSFLedgerItem ;

begin

  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;

  if BSaveAccount.Visible then
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(1971),mtConfirmation,[mbyes,mbno],0) = mrYes then
       APostAccountExecute(self);

  if ZQNewBudget.UpdatesPending then
     ZQNewBudget.CancelUpdates  ;
  LedgerNode := TOSFLedgerItem(TVMain.Selected.Data);
  if LedgerNode.IsGroupNode then exit ;

  if LedgerNode.AccountID = 0 then
    begin
      LedgerNode.ParentNode.NesteldNodes.Delete(LedgerNode.Index);
      TVMain.Items.Delete(TVMain.Selected);
    end;
end;

procedure TGeneralEditAccount.BExpandClick(Sender: TObject);
begin
 if TVMain.Items.Count <> 0 then
  TVMain.Items[0].Expand(true);

end;

procedure TGeneralEditAccount.AMoveGroupUpExecute(Sender: TObject);
  Var
  LedgerNode : TOSFLedgerItem ;
  i , Switch: integer ;
begin
  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;
  LedgerNode := TOSFLedgerItem(TVMain.Selected.data);
  if not LedgerNode.IsGroupNode then exit ;

  for i := TVMain.Selected.Index-1 downto 0 do
   if  TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).IsGroupNode then
    begin
      Switch := TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).SortNo ;
      TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).SortNo := TOSFLedgerItem(TVMain.Selected.data).SortNo ;

      TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).Name,
                                                   TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).Group1,
                                                   TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).ParentNode.Group1,
                                                   TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).SortNo,
                                                   TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).FinancialCategory);

      TOSFLedgerItem(TVMain.Selected.data).SortNo := Switch ;

      TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(TVMain.Selected.data).Name,
                                                   TOSFLedgerItem(TVMain.Selected.data).Group1,
                                                   TOSFLedgerItem(TVMain.Selected.data).ParentNode.Group1,
                                                   TOSFLedgerItem(TVMain.Selected.data).SortNo,
                                                   TOSFLedgerItem(TVMain.Selected.data).FinancialCategory);


    LedgerNode :=  TOSFLedgerItem(TVMain.Selected.data) ;
    TVMain.Selected.data :=  TVMain.Selected.Parent.Item[i].data ;
    TVMain.Selected.Parent.Item[i].data := LedgerNode ;
    TVMain.Selected.Parent.Item[i].Text:=  TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data).GetAccountText ;
    TVMain.Selected.Text :=  TOSFLedgerItem(TVMain.Selected.data).GetAccountText ;
    HandelImageIndexOnTreeNode(TVMain.Selected);
    HandelImageIndexOnTreeNode(TVMain.Selected.Parent.Item[i]);

     TVMain.Selected.DeleteChildren ;
     TVMain.Selected.Parent.Item[i].DeleteChildren ; 
     BuildTree(TVMain.Selected,TOSFLedgerItem(TVMain.Selected.data));
     BuildTree(TVMain.Selected.Parent.Item[i],TOSFLedgerItem(TVMain.Selected.Parent.Item[i].data));
     TVMain.Selected.Parent.Item[i].Selected := true ;
     break ;
    end;
end;

procedure TGeneralEditAccount.AMoveGroupDownExecute(Sender: TObject);
 Var
  LedgerNode : TOSFLedgerItem ;
   Switch: integer ;
  AItem : TTreeNode ;
begin
  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;
  LedgerNode := TOSFLedgerItem(TVMain.Selected.data);
  if not LedgerNode.IsGroupNode then exit ;
  AItem := TVMain.Selected ;
  while AItem.GetNext <> nil do
    begin
       AItem := AItem.GetNext ;
   if  TOSFLedgerItem(AItem.data).IsGroupNode then
    begin
      Switch := TOSFLedgerItem(AItem.data).SortNo ;
      TOSFLedgerItem(AItem.data).SortNo := TOSFLedgerItem(TVMain.Selected.data).SortNo ;

      TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(AItem.data).Name,
                                                   TOSFLedgerItem(AItem.data).Group1,
                                                   TOSFLedgerItem(AItem.data).ParentNode.Group1,
                                                   TOSFLedgerItem(AItem.data).SortNo,
                                                   TOSFLedgerItem(AItem.data).FinancialCategory);

      TOSFLedgerItem(TVMain.Selected.data).SortNo := Switch ;

      TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(TVMain.Selected.data).Name,
                                                   TOSFLedgerItem(TVMain.Selected.data).Group1,
                                                   TOSFLedgerItem(TVMain.Selected.data).ParentNode.Group1,
                                                   TOSFLedgerItem(TVMain.Selected.data).SortNo,
                                                   TOSFLedgerItem(TVMain.Selected.data).FinancialCategory);


    LedgerNode :=  TOSFLedgerItem(TVMain.Selected.data) ;
    TVMain.Selected.data :=  AItem.data ;
    AItem.data := LedgerNode ;
    AItem.Text:=  TOSFLedgerItem(AItem.data).GetAccountText ;
    TVMain.Selected.Text :=  TOSFLedgerItem(TVMain.Selected.data).GetAccountText ;
    HandelImageIndexOnTreeNode(TVMain.Selected);
    HandelImageIndexOnTreeNode(AItem);

     TVMain.Selected.DeleteChildren ;
     AItem.DeleteChildren ;
     BuildTree(TVMain.Selected,TOSFLedgerItem(TVMain.Selected.data));
     BuildTree(AItem,TOSFLedgerItem(AItem.data));
     AItem.Selected := true ;
     break ;
    end;

    end;
end;




procedure TGeneralEditAccount.BSetPeriodBugetClick(Sender: TObject);
var
 NumOfPeriods ,i: Integer ;
 TotalBuget,PeriodBuget : Double ;
 startdate: TDateTime ;
 Year,Month,Day : Word ;
 Divdays : Integer ;
 MyModalResult : Integer ;
begin
  MyModalResult := mrNo ;
  if  not ZQNewBudget.IsEmpty then
  MyModalResult := OSFMessageDlg('Delete old budget for year ' + EBudYear.Text+'?',mtConfirmation,[mbyes,mbno,mbCancel],0);
  if MyModalResult = mrCancel then exit ;


  NumOfPeriods := StrToIntDef(EPeriods.Text,12);

  TotalBuget := StrToFloatDef(EBudget.Text,0);
  PeriodBuget := TotalBuget / NumOfPeriods ;
  PeriodBuget := (trunc(PeriodBuget * 100) / 100);
 //  TotalBuget := 0 ;
  startdate :=  TDataBaseRoutines.GetPeriodStartDate(14) ;
  DecodeDate(startdate,Year,Month,Day );
  Year := StrToIntDef(EBudYear.text,year) ;
  startdate := EncodeDate(Year,Month,Day);
  Divdays := Round(IncMonth(startdate, 12) - startdate ) - 1  ;
  ZQNewBudget.first ;
  if MyModalResult = mrYes then
   while not ZQNewBudget.Eof do
    begin

      if (ZQNewBudgetDDATE.AsDateTime >= startdate ) and (ZQNewBudgetDDATE.AsDateTime <= (startdate+Divdays ) )  then
       ZQNewBudget.delete
      else
      ZQNewBudget.Next ;
    end;
  if PeriodBuget = 0 then
    exit ;

  for i := 0 to NumOfPeriods -1 do

     begin
       ZQNewBudget.Insert ;
       if numofperiods > 12 then
       ZQNewBudgetDDATE.AsDateTime := trunc(startdate + (i * (Divdays / NumOfPeriods)))
       else
       ZQNewBudgetDDATE.AsDateTime := incMonth(startdate,Trunc(12 /NumOfPeriods)*i);

       if (i = (NumOfPeriods -1)) then
         begin
            PeriodBuget :=  TotalBuget - ((PeriodBuget * NumOfPeriods ) - PeriodBuget );
         end;
       ZQNewBudgetFAMOUNT.AsFloat :=  PeriodBuget ;
       ZQNewBudgetSREFERENCE.AsString := 'Gen' ;
       ZQNewBudget.Post ;
     end;
end;

procedure TGeneralEditAccount.AMoveGroupLevelToLowerExecute(
  Sender: TObject);
Var
  LedgerNode : TOSFLedgerItem ;
  i : integer ;
begin
  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;
  if TVMain.Selected.Parent.Parent = nil then exit ;
  LedgerNode := TOSFLedgerItem(TVMain.Selected.data);
  if not LedgerNode.IsGroupNode then exit ;
  TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(TVMain.Selected.data).Name,
                                               TOSFLedgerItem(TVMain.Selected.data).Group1,
                                               TOSFLedgerItem(TVMain.Selected.Parent.Parent.data).Group1,
                                               TOSFLedgerItem(TVMain.Selected.data).SortNo,
                                               TOSFLedgerItem(TVMain.Selected.data).FinancialCategory);

  TVMain.Selected.MoveTo(TVMain.Selected.Parent.Parent,naAddChildFirst);

end;

procedure TGeneralEditAccount.ADeleteAccountExecute(Sender: TObject);
begin
   if not (OSFMessageDlg(DMTCCoreLink.GetTextLang(725){'Do want to Delete'}, mtinformation, [mbYes,mbNo], 0)=mrYes) then exit ;
  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;
  if TOSFLedgerItem(TVMain.Selected.data).IsGroupNode then exit ;
  if ZQHasTransactions.Fields[0].AsString <> '0' then exit ;
  if TOSFLedgerItem(TVMain.Selected.data).NesteldNodes.Count <> 0 then exit ;
  DMCoreAccountData.DeleteAccount(TOSFLedgerItem(TVMain.Selected.data));
  TOSFLedgerItem(TVMain.Selected.data).ParentNode.NesteldNodes.Delete(TOSFLedgerItem(TVMain.Selected.data).Index);
  TVMain.Selected.Delete ;
end;

procedure TGeneralEditAccount.ADeleteGroupExecute(Sender: TObject);
begin
  if not (OSFMessageDlg(DMTCCoreLink.GetTextLang(725){'Do want to Delete'}, mtinformation, [mbYes,mbNo], 0)=mrYes) then exit ;
  if (TVMain.Selected = nil) then exit ;
  if (TVMain.Selected.Data = nil) then exit ;
  if TVMain.Selected.Parent = nil then exit ;
  if not TOSFLedgerItem(TVMain.Selected.data).IsGroupNode then exit ;
  if TOSFLedgerItem(TVMain.Selected.data).NesteldNodes.Count <> 0 then exit ;
  if TDataBaseRoutines.GetAccountClassType(TOSFLedgerItem(TVMain.Selected.data).AccountID) > 1 then exit ;
  TDataBaseRoutines.DeleteGroup(TOSFLedgerItem(TVMain.Selected.data).Group1);
  TOSFLedgerItem(TVMain.Selected.data).ParentNode.NesteldNodes.Delete(TOSFLedgerItem(TVMain.Selected.data).Index);
  TVMain.Selected.Delete ;
end;

procedure TGeneralEditAccount.MyUpdateActions;
begin
  if (TVMain.Selected = nil) or (TVMain.Selected.Parent = nil) then
    begin
      APostAccount.Visible := false ;
      APostGroup.Visible := false ;
      AAddAccount.Visible := True ;
      ADeleteAccount.Visible := False ;
      AMoveGroupUp.Visible := false ;
      AMoveGroupDown.Visible := false ;
      AMoveGroupLevelToLower.Visible := false ;
      ADeleteGroup.Visible := false ;
      AAddSubAccount.Visible :=  false;
      AAddGroup.Visible := True ;
      AAddGroup.Visible := True ;
      exit ;
    end ;

  if not TOSFLedgerItem(TVMain.Selected.data).IsGroupNode then
   begin
      APostAccount.Visible := false ;
      APostGroup.Visible := false ;
   //   AAddAccount.Visible := true ;
      ADeleteAccount.Visible := True ;
      if ZQHasTransactions.Active then
      begin
      ADeleteAccount.Visible := ZQHasTransactions.Fields[0].AsString = '0' ;
      end;
      AMoveGroupUp.Visible := false ;
      AMoveGroupDown.Visible := false ;
      AMoveGroupLevelToLower.Visible := false ;
      ADeleteGroup.Visible := false ;
      AAddGroup.Visible := false ;
    //  AAddSubAccount.Visible := TOSFLedgerItem(TVMain.Selected.Data).SubAccounts or (TOSFLedgerItem(TVMain.Selected.Data).isSubAccount) ;

   end else
   begin
      APostAccount.Visible := false ;
      APostGroup.Visible := false ;   
       AAddAccount.Visible := true ;
      ADeleteAccount.Visible := false ;
      AMoveGroupUp.Visible := true ;
      AMoveGroupDown.Visible := true ;
      AMoveGroupLevelToLower.Visible := true ;
      ADeleteGroup.Visible := TOSFLedgerItem(TVMain.Selected.data).NesteldNodes.Count = 0 ;
       AAddGroup.Visible := true ;
      AAddSubAccount.Visible := false ;
   end;
end;

procedure TGeneralEditAccount.APostAccountExecute(Sender: TObject);
begin
 if  TVMain.Selected <> nil then
    SaveAccountNode(TVMain.Selected);
end;

procedure TGeneralEditAccount.APostGroupExecute(Sender: TObject);
begin
  if TOSFLedgerItem(TVMain.Selected.Data).ParentNode <> nil then
  begin
     TOSFLedgerItem(TVMain.Selected.Data).Name := EGroupname.Text ;
     case CBFinCategory.ItemIndex of
     1 :TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 69 ;
     2 :TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 67 ;
     3 :TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 66 ;
     4 :TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 68 ;
     5 :TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 65 ;
     else
     TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory := 0 ;
     end;// end case

     TDataBaseRoutines.UpdateGroup(TOSFLedgerItem(TVMain.Selected.Data).Name,TOSFLedgerItem(TVMain.Selected.Data).Group1,TOSFLedgerItem(TVMain.Selected.Data).ParentNode.Group1,TOSFLedgerItem(TVMain.Selected.Data).SortNo,TOSFLedgerItem(TVMain.Selected.Data).FinancialCategory);
     TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup1.Items,20);
     TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,21);
     DMTCCoreLink.GroupsObject.Clear ;
     TVMain.Selected.Text := DMTCCoreLink.GroupsObject.GetGroupName(  TOSFLedgerItem(TVMain.Selected.Data).Group1 )  ;
     APostGroup.Visible := false ;

  end;
end;

procedure TGeneralEditAccount.ARefreshExecute(Sender: TObject);
var
  OrgNode,NewNode : TTReeNode ;
  ALedgerItem,Root,TempNode: TOSFLedgerItem ;
  WhereClause  : String ;
  GroupId , i: Integer ;
  AddNode : Boolean ;
  OldNode : TOSFLedgerItem ;
  aStartd,aEndd:TDateTime ;
begin
  aStartd := TDataBaseRoutines.GetPeriodStartDate(14);
  aEndd  := IncMonth(aStartd,12) - 1 ;

  OldNode := TOSFLedgerItem.Create(nil) ;
  try
  if TVMain.Selected <> nil then
    begin
       if TVMain.Selected.Data <> nil then
        begin
          OldNode.Name := TOSFLedgerItem(TVMain.Selected.Data).Name ;
        end;
    end;

  TVMain.items.BeginUpdate;
  try
  TVMain.Items.Clear;
  LedgerCalculationClass.clear ;

  OrgNode := TVMain.Items.Add(Nil,DMTCCoreLink.GetTextLang(1847));
 
  root := TOSFLedgerItem(LedgerCalculationClass.Add(nil));
  root.Name := DMTCCoreLink.GetTextLang(1847) ;
  root.IsGroupNode := true ;
  root.Group1 := 0 ;

  root.GroupType  := 20 ;
  if CBGroup.ItemIndex = 1 then root.GroupType := 21 ;
  GroupId :=  root.GroupType   ;
  if (CBGroup.ItemIndex in [0,1,2])  then
    RecurceTree(root,GroupId);

  OrgNode.Data := Pointer(root) ;
  WhereClause := 'where (WPeriodId >=  14 or WperiodId = 0 or WPeriodid is null)  and (WPeriodId <=  26 or WPeriodid is null) and (BActual = 0 or BActual is null)';

  ZQTotalsAccounts.close ;
  ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag('select Account.SAccountCode, Account.SDescription, Account.WAccountid, Account.WAccountTypeId, '+
  ' Account.WREPORTINGGROUP1ID,  Account.WREPORTINGGROUP2ID, Account.BSUBACCOUNTS,Account.BINCOMEEXPENSE,Account.BOPENITEM,Account.BINACTIVE,Account.DSYSDATE, ' +
  ' Account.WLINKACCOUNT, Account.WTAXACCOUNT, Sum(Totals.FAmount) Totaal   from  account left join Totals on (account.Waccountid = totals.Waccountid ' +
  ' and Totals.BActual = 0) <^THISSELECT^> group by Account.SAccountCode, Account.SDescription, Account.WAccountid, Account.WAccountTypeId, Account.WREPORTINGGROUP1ID, '+
  ' Account.WREPORTINGGROUP2ID, Account.BSUBACCOUNTS,Account.BINCOMEEXPENSE,Account.BOPENITEM,Account.BINACTIVE,Account.DSYSDATE,Account.WLINKACCOUNT,Account.WTAXACCOUNT '
  ,'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (0,3,4)','^') ;
  ZQTotalsAccounts.Open ;

  while not ZQTotalsAccounts.Eof do
     begin
       if ZQTotalsAccountsWACCOUNTID.AsInteger = 0 then
         begin
            ZQTotalsAccounts.Next ;
            Continue ;
         end;
       ALedgerItem := nil ;
        AddNode := true ;
        if EFilerAccount.Text <> '' then
          begin
            AddNode :=  pos(EFilerAccount.Text,ZQTotalsAccountsSACCOUNTCODE.AsString) = 1 ;
          end;
        if EDescription.Text <> '' then
          begin
            AddNode := AddNode and (pos(EDescription.Text,UpperCase(ZQTotalsAccountsSDESCRIPTION.AsString)) > 0 );
          end;

        if AddNode then
        begin
        // find root
        if CBGroup.ItemIndex = 1 then
         begin
         ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP2ID.AsInteger)  ;
         end ;
         if  (CBGroup.ItemIndex in [0,2]) then
         begin
          ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger)  ;
         end;
         //subaccounts
         if  ZQTotalsAccountsWACCOUNTID.AsInteger <> ZQTotalsAccountsWLINKACCOUNT.AsInteger then
           begin
              // sub account
              ALedgerItem :=  root.FindOnAccountId(ZQTotalsAccountsWLINKACCOUNT.AsInteger);
            // check to see if order is on group
             if  ALedgerItem <> nil then
                if CBGroup.ItemIndex =0 then
                   if ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger <> ALedgerItem.Group1ID then
                     begin
                     // find on group
                       ALedgerItem := root.FindOnGroupId(ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger)  ;
                    end ;
            // check to see if order is on group
            if  ALedgerItem <> nil then
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

        ALedgerItem.Group2id :=  ZQTotalsAccountsWREPORTINGGROUP2ID.AsInteger ;

        ALedgerItem.Group1id  :=  ZQTotalsAccountsWREPORTINGGROUP1ID.AsInteger ;


        ALedgerItem.Name := ZQTotalsAccountsSDESCRIPTION.AsString ;
        ALedgerItem.Accountcode := ZQTotalsAccountsSACCOUNTCODE.AsString ;
        ALedgerItem.AccountID := ZQTotalsAccountsWACCOUNTID.AsInteger ;
        ALedgerItem.LedgerType :=  ZQTotalsAccountsWACCOUNTTYPEID.AsInteger ;
        ALedgerItem.IncomeExpence :=  ZQTotalsAccountsBINCOMEEXPENSE.AsInteger = 1 ;
        ALedgerItem.LinkedAccountId :=  ZQTotalsAccountsWLINKACCOUNT.AsInteger ;
        ALedgerItem.SubAccounts  :=  ZQTotalsAccountsBSUBACCOUNTS.AsInteger = 1 ;
        ALedgerItem.SubAccountCode  :=  Copy(ZQTotalsAccountsSACCOUNTCODE.AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZQTotalsAccountsBOPENITEM.AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZQTotalsAccountsBINACTIVE.AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZQTotalsAccountsDSYSDATE.AsDateTime ;
        ALedgerItem.Total          :=  TDataBaseRoutines.GetBudgetDebCredOnDate(ALedgerItem.AccountID,True, aStartd,aEndd,True,0,0) ;
        ALedgerItem.Total    := ALedgerItem.Total +  TDataBaseRoutines.GetBudgetDebCredOnDate(ALedgerItem.AccountID,False, aStartd,aEndd,True,0,0) ;
        ALedgerItem.TaxAccountid   :=   ZQTotalsAccountsWTAXACCOUNT.AsInteger ;
        if ALedgerItem.IncomeExpence then
          ALedgerItem.ProffitLoss := ALedgerItem.Total  else
          ALedgerItem.Balans := ALedgerItem.Total ;
        if ALedgerItem.AccountID = DebtorAccount then
        ALedgerItem.ControlAccountType := 1 ;
        if ALedgerItem.AccountID = CreditorAccount then
        ALedgerItem.ControlAccountType := 2 ;
        if ALedgerItem.AccountID = Proffitlosslastyear then
        ALedgerItem.ControlAccountType := 3 ;
        //handel bank and tax
        // bank
        if ALedgerItem.LedgerType = 3 then
          begin
             ZQGen.SQL.Text := ' select bank.WReceiptsid,a.SDescription SReceiptDesc,bank.WPaymentsid,b.SDescription SPaymentDesc from ' +
                               ' BANK left join battypes a on (bank.WReceiptsid = a.WBatchTypeid) left join battypes b on (bank.WPaymentsid = b.WBatchTypeid) ' ;
             ZQGen.SQL.add('where bank.WAccountid =' + ZQTotalsAccountsWACCOUNTID.AsString );
             ZQGen.open ;
             ALedgerItem.ReceiptsBatchName :=  ZQGen.fieldByName('SReceiptDesc').AsString ;
             ALedgerItem.ReceiptsBatchID :=  ZQGen.fieldByName('WReceiptsid').AsInteger ;
             ALedgerItem.PaymentBatchName :=  ZQGen.fieldByName('SPaymentDesc').AsString ;
             ALedgerItem.PaymentBatchID :=  ZQGen.fieldByName('WPaymentsid').AsInteger ;
             ZQGen.Close ;
          end;
         // tax
        if ALedgerItem.LedgerType = 4 then
          begin
             ZQGen.SQL.Text := ' select SHOWTYPE,Frate,WLinkTaxid,BlinkContra from tax ' ;
             ZQGen.SQL.add('where tax.WAccountid =' + ZQTotalsAccountsWACCOUNTID.AsString );
             ZQGen.open ;
             ALedgerItem.TaxRate :=  ZQGen.fieldByName('Frate').AsFloat ;
             ALedgerItem.LinkTax :=  ZQGen.fieldByName('WLinkTaxid').AsInteger ;
             ALedgerItem.UseContraTax :=  ZQGen.fieldByName('BlinkContra').AsInteger = 1 ;
             ALedgerItem.TaxType :=  ZQGen.fieldByName('SHOWTYPE').AsInteger  ;

             ZQGen.Close ;
          end;
       end;
      ZQTotalsAccounts.next ;
     end;
  ZQTotalsAccounts.Close ;
  //root.CalculateGroups ;
  root.CalculateBalans ;
  if CBGroup.ItemIndex = 2 then
   begin
     {  69 ;
       67 ;
       66 ;
       68 ;
       65 ;  }
    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[1]) ;
    NewNode.ImageIndex  := 25  ;
    NewNode.SelectedIndex  := 25  ;
   BuildFinCatTree(69,NewNode,Root);

    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[2]) ;
    NewNode.ImageIndex  := 26  ;
    NewNode.SelectedIndex  := 26  ;
    BuildFinCatTree(67,NewNode,Root);

    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[3]) ;
    NewNode.ImageIndex  := 28 ;
    NewNode.SelectedIndex  := 28  ;
    BuildFinCatTree(66,NewNode,Root);

    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[4]) ;
    NewNode.ImageIndex  := 24 ;
    NewNode.SelectedIndex  := 24  ;
    BuildFinCatTree(68,NewNode,Root);

    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[5]) ;
    NewNode.ImageIndex  := 29 ;
    NewNode.SelectedIndex  := 29  ;
    BuildFinCatTree(65,NewNode,Root);

    NewNode := TVMain.Items.Add(OrgNode,CBFinCategory.Items[0]) ;
    NewNode.ImageIndex := 27 ;
    NewNode.SelectedIndex  := 27  ;
    BuildFinCatTree(0,NewNode,Root);


   end
  else
  BuildTree(OrgNode,Root);
  TVMain.CustomSort(@CustomSortProc  ,0);
  finally
  TVMain.items.EndUpdate;
  end;
  if cbExpand.Checked then
   OrgNode.Expand(True) else
   OrgNode.Expand(False);
   if OldNode.Name <> '' then
   begin
     TempNode := Root.FindOnName(OldNode.Name) ;
     if TempNode <> nil then
       begin

          for i := 0 to TVMain.items.count -1 do
            if TVMain.items[i].Data = TempNode then
              begin
                 TVMain.items[i].Selected := true ;
                 break ;
              end;
       end;
   end else
  OrgNode.Selected := true ;
  MyUpdateActions ;
  finally
    OldNode.Free ;
  end;
end;

procedure TGeneralEditAccount.AExpandExecute(Sender: TObject);
var
 i : Integer ;
begin
 if TVMain.Items.Count <> 0 then
   for i := 0 to TVMain.Items.Count -1 do
    if TVMain.Items[i].Parent = nil then
        TVMain.Items[i].Expand(true);
end;

procedure TGeneralEditAccount.AColapsExecute(Sender: TObject);
var
 ANode : TTReeNode ;
 i : Integer ;
begin
 ANode := TVMain.Selected ;

 if TVMain.Items.Count <> 0 then
   for i := 0 to TVMain.Items.Count -1 do
    if TVMain.Items[i].Parent = nil then
        TVMain.Items[i].Collapse(True);


 if ANode <> nil then
  begin
    ANode.Expand(false);
    ANode.Selected := true ;
   end;
end;



procedure TGeneralEditAccount.ZQTotalsAccountsBeforeOpen(
  DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from account where  WAccountid is null');
end;

procedure TGeneralEditAccount.AAddSubAccountExecute(Sender: TObject);
var
   aOSFLedgerItem : TOSFLedgerItem ;
   ANewNode,ARootNode : TTreeNode ;
begin
  ARootNode := nil ;
  if TVMain.Selected = nil then exit ;
  if TVMain.Selected.Data = nil then exit ;
  if not TOSFLedgerItem(TVMain.Selected.Data).IsGroupNode then
    begin
     if TOSFLedgerItem(TVMain.Selected.Data).SubAccounts then
           ARootNode :=  TVMain.Selected  
       else
       if TOSFLedgerItem(TVMain.Selected.Data).isSubAccount then
           ARootNode :=  TVMain.Selected.Parent ;

       if ARootNode = nil then exit ;

           aOSFLedgerItem := TOSFLedgerItem(ARootNode.Data).NesteldNodes.add(TOSFLedgerItem(ARootNode.Data)) ;
           aOSFLedgerItem.Name := DMTCCoreLink.GetTextLang(34) + '  ' + LowerCase(DMTCCoreLink.GetTextLang(185)) ;
           aOSFLedgerItem.Accountcode := TOSFLedgerItem(ARootNode.Data).Accountcode ;
           aOSFLedgerItem.SubAccountCode := FormatFloat('000',TOSFLedgerItem(ARootNode.Data).NesteldNodes.count) ;
           aOSFLedgerItem.IsGroupNode := false ;
           aOSFLedgerItem.LedgerType := TOSFLedgerItem(ARootNode.Data).LedgerType ;
           aOSFLedgerItem.IncomeExpence := TOSFLedgerItem(ARootNode.Data).IncomeExpence ;
           aOSFLedgerItem.OpenItem := TOSFLedgerItem(ARootNode.Data).OpenItem ;
           aOSFLedgerItem.FinancialCategory := TOSFLedgerItem(ARootNode.Data).FinancialCategory ;
           aOSFLedgerItem.GroupType := TOSFLedgerItem(ARootNode.Data).GroupType ;
           aOSFLedgerItem.Group1 := TOSFLedgerItem(ARootNode.Data).Group1;
           aOSFLedgerItem.AccountID := -1 ;
           aOSFLedgerItem.LinkedAccountId := TOSFLedgerItem(ARootNode.Data).AccountID ;
           ANewNode := TVMain.Items.AddChild(ARootNode,aOSFLedgerItem.GetAccountText) ;
           ANewNode.Data :=  aOSFLedgerItem ;
           HandelImageIndexOnTreeNode(ANewNode);
           ANewNode.Selected := true ;
           aOSFLedgerItem.AccountID := 0 ;
           APostAccount.Visible := true ;
         end;
end;

procedure TGeneralEditAccount.TVMainEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);

begin
  AllowEdit := false ;
end;

procedure TGeneralEditAccount.CBUseTaxLinkClick(Sender: TObject);
begin
PLinkTaxes.Visible := CBUseTaxLink.Checked ;
EAccountMainChange(sender);
end;

procedure TGeneralEditAccount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
TDatabaseRegistyRoutines.WriteFormPos(self,'');
DMTCCoreLink.AccObject.Clear ;
end;

procedure TGeneralEditAccount.CBGroupChange(Sender: TObject);
begin
  ARefresh.Execute ;
end;

procedure TGeneralEditAccount.EFilerAccountKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then ARefresh.Execute ;
end;

function TGeneralEditAccount.FindFinCatNode(AFinCat: Integer): TTreeNode;
var
 i : Integer ;
begin
 case AFinCat of
     69 : AFinCat := 1  ;
     67 : AFinCat := 2  ;
     66 : AFinCat :=  3 ;
     68 : AFinCat := 4  ;
     65 : AFinCat := 5 ;
     else
      AFinCat := 0 ;
    end;
 result := nil ;
 for  i := 0 to TVMain.Items.Count -1 do
   if TVMain.Items[i].Data = nil then
     if TVMain.Items[i].Text =CBFinCategory.Items[AFinCat] then
      begin
       result :=  TVMain.Items[i];
       exit ;
      end;
end;

function TGeneralEditAccount.GetFinCatIndex(ANode: TTReeNode): Integer;
var
 i : Integer ;
begin
 result := 0 ;
 if ANode = nil then exit ;
 for  i := 0 to CBFinCategory.Items.Count -1 do
   if CBFinCategory.Items[i] = ANode.Text then
      begin
       result :=  i;
       break ;
      end;
 case Result of
     1 : Result := 69  ;
     2 : Result := 67  ;
     3 : Result := 66  ;
     4 : Result := 68  ;
     5 : Result := 65  ;
     else
      Result := 0 ;
    end;
end;

procedure TGeneralEditAccount.ZQLinksAfterInsert(DataSet: TDataSet);
begin
 if  DataSet = ZQLinks then
  begin
  ZQLinksWACCOUNTID.AsInteger := 0 ;
  ZQLinksWACCOUNTREFID.AsInteger := 0 ;
  end;
  APostAccount.Visible := true ;
end;

procedure TGeneralEditAccount.ZQLinksAfterDelete(DataSet: TDataSet);
begin
APostAccount.Visible := true ;
end;

procedure TGeneralEditAccount.ZQLinksAfterEdit(DataSet: TDataSet);
begin
APostAccount.Visible := true ;
end;

procedure TGeneralEditAccount.ZQNewBudgetBeforePost(DataSet: TDataSet);
begin
 if TVMain.Selected = nil then exit ;
 if TVMain.Selected.data = nil then exit ;

 if ZQNewBudgetWTRANSACTIONID.AsInteger = 0 then
   ZQNewBudgetWTRANSACTIONID.AsInteger := DMTCCoreLink.GetNewIdStr('gen_TRANS_BUDGET') ;
  if ZQNewBudgetWACCOUNTID.AsInteger = 0 then
     ZQNewBudgetWACCOUNTID.AsInteger :=  TOSFLedgerItem(TVMain.Selected.Data).AccountID ;
  if not ZQNewBudget.ControlsDisabled then
   APostAccount.Visible := true;

  ZQNewBudgetWUSERID.AsInteger := DMTCCoreLink.currentuser ;

end;

procedure TGeneralEditAccount.ZQNewBudgetWREPORTINGGROUP1IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 Text := DMTCCoreLink.GroupsObject.GetGroupName(sender.AsInteger);
end;

procedure TGeneralEditAccount.ZQNewBudgetAfterScroll(DataSet: TDataSet);
begin
 UpdateGridControls ;
end;

procedure TGeneralEditAccount.ZQNewBudgetAfterOpen(DataSet: TDataSet);
begin
UpdateGridControls ;
end;

procedure TGeneralEditAccount.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

end;

{ twf_TGeneralEditAccount }

constructor twf_TGeneralEditAccount.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'ledgeraccounts';
  Description := 'General account edit DOBUDGETS puts it in budget only mode.';

  with Inparams.Add as TParam do
     begin
        Name := 'DOBUDGETS' ;
        DataType := ftBoolean ;
        Value := false ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;

end;

procedure twf_TGeneralEditAccount.WorkflowEnd(AForm: TForm);
begin
  inherited;
  AForm.free ;
end;

function twf_TGeneralEditAccount.WorkFlowStart: TForm;
begin
  Result := TGeneralEditAccount.Create(self);
 try
  with Result as TGeneralEditAccount do
    begin
 
        parent := self.parent ;
        Align := alClient ;
        BorderStyle := bsNone ;
        Show ;
        if  Inparams.ParamByName('DOBUDGETS').AsBoolean then
           begin
              BSaveAccount.Parent := tsBudget ;
              BSaveAccount.top := 16 ;
              BSaveAccount.Left  := 250 ;
              Panel1.Visible := False ;
              ActionToolBar1.Visible := False ;
              TVMain.PopupMenu := Nil ;
           end;
    end;
    if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;
  except
    
  end;
end;
procedure TGeneralEditAccount.Panel2DblClick(Sender: TObject);
begin
 useTrn := True ;
end;

procedure TGeneralEditAccount.ZQNewBudgetAfterInsert(DataSet: TDataSet);
begin
ZQNewBudgetDDATE.AsDateTime := date ;
ZQNewBudgetFAMOUNT.AsFloat := 0 ;
ZQNewBudgetDSYSDATE.AsDateTime := now ;
end;

procedure TGeneralEditAccount.cxGrid2DBTableView1EditKeyPress(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Char);
begin
 if (AItem.Properties is TcxCurrencyEditProperties)  then
   if key ='.' then Key := DecimalSeparator ;
end;

initialization
twf_TGeneralEditAccount.Create(nil);
end.
