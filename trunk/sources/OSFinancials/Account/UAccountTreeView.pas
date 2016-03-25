(*
  Id: UAccountTreeView.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UAccountTreeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB,
    DBAccess , Uni, Grids, DBGrids,osfLookup,TcashClasses,
  Menus, USQLHolder,ULookupPeriods,TcVariables,uOsfresources,UpluginsSharedUnit,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTreeView, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid;

type
twf_TAccountTreeView  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;

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
  TAccountTreeView = class(TForm)
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
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    LProffitloss: TLabel;
    LLProffitloss: TLabel;
    LlTotbal: TLabel;
    LTotalBalans: TLabel;
    TVMain: TcxTreeView;
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
    BCreate: TBitBtn;
    dbcboxIncOpeningBalance: TCheckBox;
    BExport: TBitBtn;
    CBBuget: TCheckBox;
    CBType: TComboBox;
    CBHideNilBal: TCheckBox;
    CBGroup: TComboBox;
    cbIncDebtorsCreditors: TCheckBox;
    dbcboxOnlyOpeningBalance: TCheckBox;
    Label5: TLabel;
    cbCostGroup1: TComboBox;
    ZQGen: TuniQuery;
    ZQTrnBalance: TuniQuery;
    sqlWithopeningbal: TSQLHOLDER;
    sqlBetween: TSQLHOLDER;
    sqlDebCredWithopen: TSQLHOLDER;
    sqldebcredPeriod: TSQLHOLDER;
    ZQTrnDebCred: TuniQuery;
    SQLHOLDER2: TSQLHOLDER;
    BPrint: TBitBtn;
    pbExp: TProgressBar;
    BStop: TBitBtn;
    LText: TLabel;
    cbcostgroup2: TComboBox;
    Label1: TLabel;
    procedure BCreateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TVMainCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TMymainclick(Sender: TObject);
    procedure ColumnBalansClick(Sender: TObject);
    procedure RealColumnBalansClick(Sender: TObject);
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
 
    procedure BPrintClick(Sender: TObject);
    procedure onosFProgressEvent (Var Stop :Boolean ; AText : String ; AMax , APostition : Integer;aTransId : Integer );
    procedure BStopClick(Sender: TObject);
    procedure CBFromPeriodeChange(Sender: TObject);
    procedure TVMainDblClick(Sender: TObject);
  private
    LedgerCalculationClass : TOSFLedgerCalculationClass ;
    aLedgerCalculationClass : TLedgerCalculationClass ;
    procedure RecurceTree(AItem : TOSFLedgerItem ;GroupType : Integer);

    procedure BuildTree(ANode : TTreeNode ;AItem : TOSFLedgerItem );

    procedure LoadReportOp;
    procedure SaveReportOp;
    procedure CreateColumnBalans ;
    procedure CreateStdColumnBalans;
    procedure CreateStdBudgetVsActual;
    procedure ReadLedgerObjectFromBatches;
    procedure CheckTree;
    { Private declarations }
  public
    FrameLookupPeriods : TFrameLookupPeriods ;
    BShowUnpostedOnly , BShowUnposted : Boolean ;
    BDoStop : Boolean ;
      FromDate , ToDate : TDateTime ;
    Lookup : TosfLookup ;
    sgColumnBalans : TBalansViewerControl ;
    HasChanges : Boolean ;
    MyFormat : String ;
    InWorkflow : Boolean ;
    procedure HandelImageIndexOnTreeNode(ATreeNode : TTReeNode );
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines, StrUtils,
  TAccountView,shellapi, Math, DateUtils, NewProgress, Types,
  VirtualTable, UReportManager;

{$R *.dfm}


Procedure  TAccountTreeView.RecurceTree(AItem : TOSFLedgerItem ;GroupType : Integer ) ;
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
    AQuery.sql.Text := format('Select * From v_Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo ',[IntToStr(GroupType),IntToStr(AItem.Group1),ExtraSql]);
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


procedure TAccountTreeView.CreateStdColumnBalans;
var
 Colindex,RowIndex,i : Integer ;
 WhereClause : String ;
 TotalD,Totalc,EndBalansd,EndBalansC,EndResultD,EndResultC,Amount,FDeb,FCred,FDebOpen,FCredOpen : Double ;
 AProgress : TfmNewProgress ;
 bAmountFound : Boolean ;
 CostGroup1,CostGroup2 : Integer ;
begin
   EndResultd := 0 ;
   EndBalansd := 0 ;
   Totald := 0 ;
   EndResultc := 0 ;
   EndBalansc := 0 ;
   Totalc := 0 ;

   FDebOpen  := 0 ;
   FCredOpen := 0 ;
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
   sgColumnBalans.ColCount := 8 ;



   sgColumnBalans.FixedRows := 1 ;
   sgColumnBalans.FixedCols := 1 ;

   sgColumnBalans.OnDblClick := RealColumnBalansClick ; //ColumnBalansClick;


       sgColumnBalans.Cols[0][0] := DMTCCoreLink.GetTextLang(2123) ;
       sgColumnBalans.Cols[1][0] := DMTCCoreLink.GetTextLang(2047) ;
       sgColumnBalans.Cols[2][0] := DMTCCoreLink.GetTextLang(1021)  ;
       sgColumnBalans.Cols[3][0] := '' ;
       sgColumnBalans.Cols[4][0] := DMTCCoreLink.GetTextLang(206) ;
       sgColumnBalans.Cols[5][0] := '' ;
       sgColumnBalans.Cols[6][0] := DMTCCoreLink.GetTextLang(1000)  ;
       sgColumnBalans.Cols[7][0] := '' ;



   ZQTotalsAccounts.close ;

      WhereClause := 'where   WperiodId = 0  and (Account.Waccountid <> 0) ';

   case CBType.ItemIndex of
   3,6,9 : ZQTotalsAccounts.SQL.Text := 'select Account.SAccountCode, Account.SDescription,Account.WAccountid,Account.WAccountTypeId,Account.WREPORTINGGROUP1ID,Account.WREPORTINGGROUP2ID,Account.BSUBACCOUNTS,'+
   ' Account.BINCOMEEXPENSE, Account.BOPENITEM, Account.BINACTIVE, Account.DSYSDATE, Account.WLINKACCOUNT, Account.WTAXACCOUNT, 0 Totaal '+
   '  from v_account account where  (Account.Waccountid <> 0) and  Account.WAccountTypeID not in (1,2) order by Account.SAccountCode ' ;
   4,7 : ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (1)','^') + ' order by Account.SAccountcode ' ;
   5,8 : ZQTotalsAccounts.SQL.Text := TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID in (2)','^') + ' order by Account.SAccountcode ' ;
   end;

   ZQTotalsAccounts.Open ;
   AProgress.initProgress('Init..',0);
   ZQTotalsAccounts.last ;
   ZQTotalsAccounts.first ;

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
      if ZQTotalsAccountsBSUBACCOUNTS.AsInteger = 1 then
        begin
        if not (ZQTotalsAccountsWACCOUNTID.AsInteger in [DMTCCoreLink.DebtorsControlAccountid,DMTCCoreLink.CreditorsControlAccountid,DMTCCoreLink.RetaindIncomeControlAccountid])
          then
         begin
        ZQTotalsAccounts.Next ;
        Continue ;
        end;
        end;

       bAmountFound := false ;
       AProgress.SetProgress('',ZQTotalsAccounts.RecNo);
       if AProgress.bStop then
          Raise Exception.Create('User stop!');
       Application.ProcessMessages ;

       sgColumnBalans.Cells[0,RowIndex] :=  TDataBaseRoutines.AccTypeToChar(ZQTotalsAccountsWACCOUNTTYPEID.AsInteger) + ZQTotalsAccountsSACCOUNTCODE.AsString;
       sgColumnBalans.Cells[1,RowIndex] :=  ZQTotalsAccountsSDESCRIPTION.AsString ;
       sgColumnBalans.Rows[RowIndex].Objects[0] := TObject(ZQTotalsAccountsWACCOUNTID.AsInteger);
        CostGroup1 := 0 ;
        CostGroup2 := 0 ;
         if cbCostGroup1.ItemIndex > 0 then
          CostGroup1  := Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex]);
         if cbCostGroup2.ItemIndex > 0 then
          CostGroup2  := Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]);

           if dbcboxOnlyOpeningBalance.Checked then
               begin
                if CBBuget.Checked then
                 begin
                 FDebOpen  := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                 FCredOpen := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));


                 end else
                 begin
                 FDebOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                 FCredOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));
                 end;

                 if (FDebOpen - FCredOpen) > 0 then
                 begin
                   FDeb := (FDebOpen - FCredOpen) ;
                   FCred := 0 ;
                 end else
                 begin
                   FCred :=  abs(FDebOpen - FCredOpen) ;
                   FDeb := 0 ;
                 end;
               end else
               begin
                 if CBBuget.Checked then
                 begin
                  FCred := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,ToDate,false,CostGroup1,CostGroup2));
                  FDeb :=  TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,ToDate,false,CostGroup1,CostGroup2) ;
                 end else
                 begin
                  FCred := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,ToDate,false,CostGroup1,CostGroup2));
                  FDeb :=  TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,ToDate,false,CostGroup1,CostGroup2) ;
                 end;
                if dbcboxIncOpeningBalance.Checked then
                    begin
                  if CBBuget.Checked then
                       begin
                        FDebOpen  := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                        FCredOpen := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));
                       end else
                       begin
                        FDebOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                        FCredOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));
                       end;
                     if (FDebOpen - FCredOpen) > 0 then
                       begin
                         FDeb := FDeb + (FDebOpen - FCredOpen) ;
                       end else
                       begin
                         FCred := FCred + abs(FDebOpen - FCredOpen) ;
                       end;
                     end;
              end;
        Amount :=  FDeb - FCred ;

        if  ZQTotalsAccountsWACCOUNTID.AsInteger <> DMTCCoreLink.RetaindIncomeControlAccountid then
            bAmountFound := true;
        if (FDeb <> 0) or (FCred <> 0)  then
            bAmountFound := true;

       Totald   := Totald  + FDeb ;
       Totalc   := Totalc  + FCred ;


       sgColumnBalans.Cells[2,RowIndex] :=  FormatFloat(MyFormat,FDeb) ;
       sgColumnBalans.Cells[3,RowIndex] :=  FormatFloat(MyFormat,FCred) ;


            sgColumnBalans.Cells[4,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[5,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[6,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[7,RowIndex] :=  FormatFloat(MyFormat,0) ;


       if ZQTotalsAccountsBINCOMEEXPENSE.AsInteger = 1 then
          begin
             EndResultd := EndResultd  + FDeb ;
             EndResultc := EndResultc  + FCred ;
             if (FDeb - FCred) > 0 then
             sgColumnBalans.Cells[4,RowIndex] :=  FormatFloat(MyFormat,FDeb - FCred) else
             sgColumnBalans.Cells[5,RowIndex] :=  FormatFloat(MyFormat,-(FDeb - FCred)) ;

          end else
          begin
            EndBalansd := EndBalansd  + FDeb ;
            EndBalansc := EndBalansc  + FCred ;
            if (FDeb - FCred) > 0 then
            sgColumnBalans.Cells[6,RowIndex] :=  FormatFloat(MyFormat,FDeb - FCred) else
            sgColumnBalans.Cells[7,RowIndex] :=  FormatFloat(MyFormat,-(FDeb - FCred)) ;
          end ;


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
      end else
      begin
        // todo : make end totals
        sgColumnBalans.RowCount := sgColumnBalans.RowCount + 2 ;
          Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;
           Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;


         sgColumnBalans.Cols[1][RowIndex-1] := DMTCCoreLink.GetTextLang(1160) ;

         if (EndResultD-EndResultC) > 0 then
         begin
          sgColumnBalans.Cols[5][RowIndex-1] := FormatFloat(MyFormat,EndResultD-EndResultC) ;
          EndResultC :=  EndResultC +  (EndResultD-EndResultC) ;
          sgColumnBalans.Cols[4][RowIndex-1] := '0';
         end else
         begin
          sgColumnBalans.Cols[5][RowIndex-1] := '0' ;
          sgColumnBalans.Cols[4][RowIndex-1] := FormatFloat(MyFormat,-(EndResultD-EndResultC));
          EndResultD :=  EndResultD -(EndResultD-EndResultC) ;
         end;


         if (EndBalansd-EndBalansC) > 0 then
         begin
          sgColumnBalans.Cols[7][RowIndex-1] := FormatFloat(MyFormat,EndBalansd-EndBalansC) ;
          EndBalansC :=  EndBalansC +  (EndBalansd-EndBalansC) ;
          sgColumnBalans.Cols[6][RowIndex-1] := '0';
         end else
         begin
          sgColumnBalans.Cols[7][RowIndex-1] := '0' ;
          sgColumnBalans.Cols[6][RowIndex-1] := FormatFloat(MyFormat,-(EndBalansd-EndBalansC));
          EndBalansd :=  EndBalansd -(EndBalansd-EndBalansC) ;
         end;


       {  if (EndBalansd-EndBalansC) > 0 then
         sgColumnBalans.Cols[6][RowIndex-1] := FormatFloat(MyFormat,EndBalansd-EndBalansC) else
         sgColumnBalans.Cols[7][RowIndex-1] := FormatFloat(MyFormat,-(EndBalansd-EndBalansC));
         }


           Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;


         sgColumnBalans.Cols[1][RowIndex-1] := DMTCCoreLink.GetTextLang(1360) ;

         sgColumnBalans.Cols[2][RowIndex-1] := FormatFloat(MyFormat,TotalD) ;
         sgColumnBalans.Cols[3][RowIndex-1] := FormatFloat(MyFormat,TotalC) ;
         sgColumnBalans.Cols[4][RowIndex-1] := FormatFloat(MyFormat,EndResultD) ;
         sgColumnBalans.Cols[5][RowIndex-1] := FormatFloat(MyFormat,EndResultC) ;
         sgColumnBalans.Cols[6][RowIndex-1] := FormatFloat(MyFormat,EndBalansd) ;
         sgColumnBalans.Cols[7][RowIndex-1] := FormatFloat(MyFormat,EndBalansC) ;
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



procedure TAccountTreeView.ReadLedgerObjectFromBatches ;

Var
  i ,TempPeriode : Integer ;
  ABatchList : TStringList ;
  AQuery : TuniQuery ;
  DoAdd : Boolean ;
   Procedure GetBatchList (AList : TStrings);
      begin
        AQuery.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('BatCon_GetActiveList') + '  and BatCon.WUserId =' + IntToStr(DMTCCoreLink.CurrentUser);
        AQuery.Open ;
        While not AQuery.Eof do

           begin

              if TDataBaseRoutines.tableExist(AQuery.fieldByname('SFileName').asstring) then
               if AList.IndexOf(AQuery.fieldByname('SFileName').asstring)  = -1 then
                  AList.AddObject(AQuery.fieldByname('SFileName').asstring,TObject(AQuery.FieldByName('WBatchTypeId').AsInteger));
              AQuery.next ;
           end;
      end;

begin
   aLedgerCalculationClass.Clear ;
   AQuery := TuniQuery.Create(self);
   ABatchList := TStringList.create ;
    try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    GetBatchList(ABatchList);
    AQuery.SQL.Text := '' ;
    for i := 0 to ABatchList.Count -1 do
      begin
         if i <> 0  then
           AQuery.SQL.add('Union');

         AQuery.SQL.add('select '+IntToStr(Integer(ABatchList.objects[i]))+' as WBATCHID,'+ ABatchList[i] + '.* from ' + ABatchList[i]) ;

      end;
   if AQuery.SQL.Text = ''  then exit ;
   try
   AQuery.Open ;
   except
     // some errors with the union. just exit this routine
     exit ;
   end;

    while not AQuery.eof do
    begin
        with aLedgerCalculationClass.GetItemOnAccountId(AQuery.fieldByname('WAccountID').AsInteger) do
              begin

                DoAdd := True ;
                if (AQuery.fieldByname('DDate').AsDateTime > ToDate) then
                   DoAdd := False else
                  if not dbcboxIncOpeningBalance.Checked then
                  DoAdd :=  ((AQuery.fieldByname('DDate').AsDateTime >= FromDate) or (not IncomeExpence) )
                  else
                  DoAdd :=  (AQuery.fieldByname('DDate').AsDateTime >= FromDate) ;


                if doadd then
                begin
                  AddValue(TempPeriode,AQuery.fieldByname('WBatchID').AsInteger,AQuery.fieldByname('FDEBIT').AsFloat,lapDebit);
                  AddValue(TempPeriode,AQuery.fieldByname('WBatchID').AsInteger,AQuery.fieldByname('FCREDIT').AsFloat,lapCredit);
                end;
              end ;
        AQuery.next ;
    end;
  finally
     ABatchList.free ;
     AQuery.free ;
   end;

end;

procedure TAccountTreeView.BCreateClick(Sender: TObject);


var
  OrgNode : TTReeNode ;
  ALedgerItem,Root,DebNode,TempNode: TOSFLedgerItem ;
  DebtorAccount,CreditorAccount,Proffitlosslastyear,OldGroup : Integer ;
  WhereClause,params  : String ;
  GroupId : Integer ;
  ATotal,TotalProfLoss,TotalBalance : Double ;
  AProgress : TfmNewProgress ;
  Period1,Period2 :Integer ;
  LastAccountId,i : Integer ;
  LastType : Boolean ;
begin
 self.Enabled := false ;
 LastAccountId := 0 ;
 if (TVMain.Selected <> nil) and (TVMain.Selected.Data <> nil ) then
    begin
     LastType := TOSFLedgerItem(TVMain.Selected.Data).IsGroupNode ;
     LastAccountId := TOSFLedgerItem(TVMain.Selected.Data).AccountID ;
    end;
   AProgress := TfmNewProgress.Create(nil) ;
   try
   AProgress.BtnStop.Visible := true ;


   FromDate := FrameLookupPeriods.GetStartDate ;
   ToDate := FrameLookupPeriods.GetEndDate ;

   Period1 := TDataBaseRoutines.GetPeriodFromDate(FromDate);
   Period2 := TDataBaseRoutines.GetPeriodFromDate(ToDate);
   if Period1 < 0 then
     Period1 := 0 ;
   if Period2 < 0 then
      Period2 := 0 ;


  if CBType.ItemIndex = 9 then
  begin
    CreateStdColumnBalans ;
    HasChanges := false ;
    Application.ProcessMessages ;
    TSetToLastColumn.Enabled := true ;
    exit ;
  end else if (CBType.ItemIndex in [10,11]) then
  begin
    CreateStdBudgetVsActual ;
    HasChanges := false ;
    Application.ProcessMessages ;
    TSetToLastColumn.Enabled := true ;
    exit ;
  end
  else
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
  ZQTotalsAccounts.SQL.Text := 'select SAccountCode,SDescription,WAccountid,WAccountTypeId,WREPORTINGGROUP1ID,WREPORTINGGROUP2ID, BSUBACCOUNTS, '+
  ' BINCOMEEXPENSE, BOPENITEM, BINACTIVE, DSYSDATE,WLINKACCOUNT  from v_account account  where Account.WAccountTypeID in (0,3,4) and Account.Waccountid <> 0 ';
  if CBType.ItemIndex = 1 then
   ZQTotalsAccounts.SQL.add('AND account.BINCOMEEXPENSE = 1') ;
  if CBType.ItemIndex = 2 then
   ZQTotalsAccounts.SQL.add('and ( account.BINCOMEEXPENSE is null or account.BINCOMEEXPENSE = 0)') ;

     ZQTotalsAccounts.SQL.add('order by Saccountcode') ;




  ZQTotalsAccounts.Open ;
  ZQTotalsAccounts.Last ;
  ZQTotalsAccounts.First ;

  params := 'SQL='  ;
  if cbCostGroup1.ItemIndex > 0 then
  params := params + ' and transact.WReportingGroup1id = ' +  IntToStr(Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex]));

  if cbCostGroup2.ItemIndex > 0 then
  params := params + ' and transact.WReportingGroup2id = ' +  IntToStr(Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]));

  params := params + #13+#10+'PROFLOSS='+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)
   + #13+#10 + 'DEB=' +    IntToStr(DMTCCoreLink.DebtorsControlAccountid)  + #13+#10 + 'CRED=' +   IntToStr(DMTCCoreLink.CreditorsControlAccountid) ;


  begin
  if dbcboxIncOpeningBalance.Checked and dbcboxIncOpeningBalance.Visible then
  begin
   ZQTrnBalance.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqlWithopeningbal.sql.text,params);
    if  CBBuget.Checked then  ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,'transact','TRANSACT_BUDGET',[rfReplaceAll]) ;

   if  not dbcboxOnlyOpeningBalance.Checked then
      begin
        ZQTrnBalance.ParamByName('ifromdate').AsDate := FromDate ;
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
        ZQTrnBalance.ParamByName('ifromdate').AsDate := FromDate ;

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
     if  CBBuget.Checked then  ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,'transact','TRANSACT_BUDGET',[rfReplaceAll]) ;

     // arrggg  sql wit params does not work so heres my fix.
     ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,':todate1',QuotedStr(FormatDateTime('yyyy"/"mm"/"dd', ToDate)),[rfReplaceAll]) ;
     ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,':todate2',QuotedStr(FormatDateTime('yyyy"/"mm"/"dd', ToDate)),[rfReplaceAll]) ;
     ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,':todate3',QuotedStr(FormatDateTime('yyyy"/"mm"/"dd', ToDate)),[rfReplaceAll]) ;
     ZQTrnBalance.sql.Text := StringReplace(ZQTrnBalance.sql.Text,':todate4',QuotedStr(FormatDateTime('yyyy"/"mm"/"dd', ToDate)),[rfReplaceAll]) ;

     ZQTrnBalance.ParamByName('fromdate1').AsDate :=  FromDate ;
     ZQTrnBalance.ParamByName('fromdate2').AsDate :=  FromDate ;
     ZQTrnBalance.ParamByName('fromdate3').AsDate :=  FromDate ;
     ZQTrnBalance.ParamByName('fromdate4').AsDate :=  FromDate ;
  end;
 end;

 if cbIncDebtorsCreditors.Checked and not CBBuget.Checked then
 begin
  if dbcboxIncOpeningBalance.Checked and dbcboxIncOpeningBalance.Visible then
  begin
   ZQTrnDebCred.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqlDebCredWithopen.sql.text,params);
   if not dbcboxOnlyOpeningBalance.Checked then
      begin
        ZQTrnDebCred.ParamByName('todate1').AsDate := ToDate ;
        ZQTrnDebCred.ParamByName('todate2').AsDate := ToDate ;
        ZQTrnDebCred.ParamByName('itodate1').AsDate := FromDate ;
        ZQTrnDebCred.ParamByName('itodate2').AsDate := FromDate ;
      end else
      begin
        ZQTrnDebCred.ParamByName('todate1').AsDate := fromdate -1 ;
        ZQTrnDebCred.ParamByName('todate2').AsDate := fromdate -1 ;
        ZQTrnDebCred.ParamByName('itodate1').AsDate := FromDate ;
        ZQTrnDebCred.ParamByName('itodate2').AsDate := FromDate ;
      end;
  end else
  begin
     ZQTrnDebCred.sql.Text := TDatabaseTableRoutines.ReplaceParams(sqldebcredPeriod.sql.text,params);
     ZQTrnDebCred.ParamByName('todate1').AsDate := ToDate ;
     ZQTrnDebCred.ParamByName('todate2').AsDate := ToDate ;
     ZQTrnDebCred.ParamByName('fromdate1').AsDate := FromDate ;
     ZQTrnDebCred.ParamByName('fromdate2').AsDate := FromDate ;
  end;
   ZQTrnDebCred.Open ;
   end;

  AProgress.initProgress('Calculating',ZQTotalsAccounts.RecordCount);
  ZQTrnBalance.open ;
  TotalProfLoss := 0 ;
  TotalBalance  := 0 ;
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
        if ALedgerItem.SubAccounts then ALedgerItem.ForceRecurse := true ;
        ALedgerItem.SubAccountCode  :=  Copy(ZQTotalsAccountsSACCOUNTCODE.AsString,DMTCCoreLink.MainAccountLength+1,3);
        ALedgerItem.OpenItem    :=  ZQTotalsAccountsBOPENITEM.AsInteger = 1 ;
        ALedgerItem.Inactive       :=  ZQTotalsAccountsBINACTIVE.AsInteger = 1 ;
        ALedgerItem.DateLastChange  :=  ZQTotalsAccountsDSYSDATE.AsDateTime ;

          begin
          if ZQTrnBalance.Locate('WACCOUNTID',ZQTotalsAccountsWACCOUNTID.AsInteger,[]) then
                  begin
                   ALedgerItem.Total          :=  ZQTrnBalance.fields[1].AsFloat
                   end  else
                   begin
                   ALedgerItem.Total := 0 ;
                   end;
                   if  ALedgerItem.SubAccounts and  ALedgerItem.IncomeExpence then
                   ALedgerItem.ForceRecurse := True;                   
          end;
        if ALedgerItem.IncomeExpence then
          begin
           if not ALedgerItem.SubAccounts then
           begin
           ALedgerItem.ProffitLoss := ALedgerItem.Total ;
           TotalProfLoss := TotalProfLoss + ALedgerItem.Total ;
           end;
          end else
          begin
          if  not ALedgerItem.SubAccounts or (ZQTotalsAccountsWACCOUNTID.AsInteger in [DMTCCoreLink.DebtorsControlAccountid,DMTCCoreLink.CreditorsControlAccountid,DMTCCoreLink.RetaindIncomeControlAccountid]) then
           begin
            ALedgerItem.Balans := ALedgerItem.Total ;
            TotalBalance := TotalBalance + ALedgerItem.Total ;
           end; 
          end;
        if ALedgerItem.AccountID = DebtorAccount then
        begin
        ALedgerItem.ControlAccountType := 1 ;
        if not cbIncDebtorsCreditors.Checked then
           begin
           ALedgerItem.ForceRecurse := false ;
           ALedgerItem.Balans := ALedgerItem.Total ;
           end;
        end else
        if ALedgerItem.AccountID = CreditorAccount then
        begin
        if not cbIncDebtorsCreditors.Checked then
           begin
           ALedgerItem.ForceRecurse := false ;
           ALedgerItem.Balans := ALedgerItem.Total ;
           end;
        ALedgerItem.ControlAccountType := 2 ;
        end else
        if ALedgerItem.AccountID = Proffitlosslastyear then
        begin
           ALedgerItem.ControlAccountType := 3 ;
           ALedgerItem.Balans := ALedgerItem.Total ;
        end;
        ZQTotalsAccounts.next ;
     end;
  ZQTotalsAccounts.Close ;


  DebNode := root.FindOnAccountId(DebtorAccount)  ;
  if DebNode = nil then DebNode := root ;
  ZQDebtors.close ;
  ZQDebtors.SQL.Text := 'select SAccountCode,SDescription,WAccountid,WAccountTypeId,WREPORTINGGROUP1ID,WREPORTINGGROUP2ID, BSUBACCOUNTS, '+
  ' BINCOMEEXPENSE, BOPENITEM, BINACTIVE, DSYSDATE,WLINKACCOUNT  from account  where Account.WAccountTypeID = 1 order by SAccountcode ' ;
  OldGroup := DebNode.Group1 ;
  DebNode.Group1 := 0 ;
  GroupId := 22  ;
  if CBGroup.ItemIndex = 1 then
  GroupId := 23 ;
  if cbIncDebtorsCreditors.Checked and not CBBuget.Checked then
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
              ALedgerItem.Total  :=  ZQTrnDebCred.fields[1].AsFloat
               else
              ALedgerItem.Total := 0 ;
        ALedgerItem.Balans := ALedgerItem.Total ;
        ZQDebtors.next ;
     end;
  ZQDebtors.Close ;
  DebNode := root.FindOnAccountId(CreditorAccount)  ;
  if DebNode = nil then DebNode := root ;
  ZQCreditors.close ;
  ZQCreditors.SQL.Text := 'select SAccountCode,SDescription,WAccountid,WAccountTypeId,WREPORTINGGROUP1ID,WREPORTINGGROUP2ID, BSUBACCOUNTS, '+
  ' BINCOMEEXPENSE, BOPENITEM, BINACTIVE, DSYSDATE,WLINKACCOUNT  from account  where Account.WAccountTypeID = 2  order by SAccountcode ' ;
  //  TDataBaseStringRoutines.ReplaceTag(DMTCCoreLink.SQLList.GetFormatedSQLByName('TREELEDGER_SELECTACCOUNTS'),'THISSELECT',WhereClause+ ' and Account.WAccountTypeID = 2','^') ;
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
  // Unposted data
  // clear
  if BShowUnposted then
  begin
  if BShowUnpostedOnly then
    root.ClearAMounts ;

  ReadLedgerObjectFromBatches ;
  for i := 0 to aLedgerCalculationClass.Count -1 do
    begin
      if not cbIncDebtorsCreditors.Checked then
       begin
          if (aLedgerCalculationClass[i].LedgerType in [ltDebtor,ltCreditor]) then
           begin
            if (aLedgerCalculationClass[i].LedgerType = ltDebtor) then
                ALedgerItem :=  root.FindOnAccountId(DMTCCoreLink.DebtorsControlAccountid)
                  else
                ALedgerItem :=  root.FindOnAccountId(DMTCCoreLink.CreditorsControlAccountid) ;
           end else
          ALedgerItem :=  root.FindOnAccountId(aLedgerCalculationClass[i].AccountID);
       end else
        ALedgerItem :=  root.FindOnAccountId(aLedgerCalculationClass[i].AccountID);
        if ALedgerItem <> nil then
          begin
            ATotal :=  aLedgerCalculationClass[i].GetTotalsForAccount ;
            ALedgerItem.Total := ALedgerItem.Total + ATotal ;
            if ALedgerItem.IncomeExpence then
             ALedgerItem.ProffitLoss := ALedgerItem.ProffitLoss + ATotal
            else
            ALedgerItem.Balans := ALedgerItem.Balans + ATotal ;
          end;
    end;
  end;
  root.CalculateGroups ;
  root.CalculateBalans ;
  BuildTree(OrgNode,Root);
  ATotal :=  Root.CalculateProffitLoss ;
  if not BShowUnposted then
    ATotal := TotalProfLoss ;
   if ATotal < 0 then
  LProffitloss.Caption := 'C -'+FormatFloat(MyFormat,-ATotal)
  else
  LProffitloss.Caption := 'D '+FormatFloat(MyFormat,ATotal);
  ATotal := Root.CalculateBalans ;
  if not BShowUnposted then
  ATotal := TotalBalance ;
  if ATotal < 0 then
  LTotalBalans.Caption := 'C -'+FormatFloat(MyFormat,-ATotal)
  else
  LTotalBalans.Caption := 'D '+FormatFloat(MyFormat,ATotal);
  Panel2.Repaint;
  LTotalBalans.Repaint;
  LProffitloss.Repaint;
   if CBHideNilBal.Checked then
       begin
          LedgerCalculationClass.deleteZeroacc ;
       end;
  root.CalculateGroups ;       
  finally
  TVMain.items.EndUpdate;
  end;
  if CBHideNilBal.Checked then
   OrgNode.Expand(True)
  else
   OrgNode.Expand(false);
  if LastAccountId <> 0 then
     begin
       for GroupId := 0 to TVMain.Items.Count -1 do
        if TVMain.Items[GroupId].Data <> nil then
         begin
           if (LastType = TOSFLedgerItem(TVMain.Items[GroupId].Data).IsGroupNode ) and
           ( LastAccountId = TOSFLedgerItem(TVMain.Items[GroupId].Data).AccountID ) then
             begin
              TVMain.Items[GroupId].Selected := true ;
              Exit ;
             end;
         end;
     end;
   finally
      CheckTree ;
     AProgress.free ;
     self.Enabled := True ;
   end;
   HasChanges := false ;
end;


procedure TAccountTreeView.FormCreate(Sender: TObject);
var
 i :  Integer ;
begin
  {
BPrint
BExport
BCreate}
TVMain.Images := uOsfresources.dmOsfResource.ImageList1 ;
sgColumnBalans := TBalansViewerControl.Create(self) ;
// sgColumnBalans.BiDiMode := bdRightToLeft ;
sgColumnBalans.Visible := false ;
sgColumnBalans.Parent := self ;
TDataBaseRoutines.FillStringsWithReportingGroups(cbCostGroup1.Items,1002) ;
TDataBaseRoutines.FillStringsWithReportingGroups(cbCostGroup2.Items,1003) ;

aLedgerCalculationClass := TLedgerCalculationClass.Create(self,TLedgerItem) ;

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
  FrameLookupPeriods := TFrameLookupPeriods.Create(Self);
  FrameLookupPeriods.Parent := ScrollBox1 ;
  FrameLookupPeriods.top := 0 ;
  FrameLookupPeriods.Left :=  112 ;
  FrameLookupPeriods.InitCaptions ;
  FrameLookupPeriods.Init ;


end;

procedure TAccountTreeView.FormDestroy(Sender: TObject);
begin
 aLedgerCalculationClass.free ;
 LedgerCalculationClass.free ;
 lookup.free ;

end;


procedure TAccountTreeView.TVMainCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);

begin
 if  TOSFLedgerItem(Node.Data).IsGroupNode then
      begin

           if TOSFLedgerItem(Node.Data).GroupColor <> 0 then
             begin
               TVMain.TreeViewCanvas.Font.Color := TOSFLedgerItem(Node.Data).GroupColor ;
               TVMain.TreeViewCanvas.Brush.Color := TOSFLedgerItem(Node.Data).GroupbgColor ;
                if (cdsSelected in State) then
                  begin
                 // TVMain.Canvas.Brush.Color := clHighlight ;
                       TVMain.TreeViewCanvas.Font.Color := clWhite ;
                       TVMain.TreeViewCanvas.Brush.Color := clblack ;
                //  DefaultDraw := false ;
                  end;
               TVMain.TreeViewCanvas.Brush.Style := bsSolid ;
               TVMain.TreeViewCanvas.FillRect(Node.DisplayRect(true));

               //TVMain.TreeViewCanvas.Brush.Style := bsClear ;
            

             end;



      end;


end;



procedure TAccountTreeView.FormShow(Sender: TObject);
begin
  Caption := DMTCCoreLink.GetTextLang(978);



  CBHideNilBal.Caption := DMTCCoreLink.GetTextLang(266);

  LGroup.Caption := DMTCCoreLink.GetTextLang(345 );

  CBGroup.Items[0] := DMTCCoreLink.GetTextLang(1323);
  CBGroup.Items[1] := DMTCCoreLink.GetTextLang(1325);
  CBGroup.Items[2] := DMTCCoreLink.GetTextLang(2321);

  Showdetails1.Caption := DMTCCoreLink.GetTextLang(392 );
  BPrint.Caption := DMTCCoreLink.GetTextLang(52 );


  LReportType.Caption := DMTCCoreLink.GetTextLang(1329 );
  CBBuget.Caption := DMTCCoreLink.GetTextLang(1027);
  dbcboxIncOpeningBalance.Caption := DMTCCoreLink.GetTextLang(637);
  dbcboxOnlyOpeningBalance.Caption := DMTCCoreLink.GetTextLang(2979);
  BCreate.Caption := DMTCCoreLink.GetTextLang(1754);
  BExport.Caption := DMTCCoreLink.GetTextLang(2013);
  LLProffitloss.Caption := DMTCCoreLink.GetTextLang(1160);
  LlTotbal.Caption := DMTCCoreLink.GetTextLang(1361);




  Label5.Caption := TDataBaseRoutines.GetTypeDescription(1002)  ;
  Label1.Caption := TDataBaseRoutines.GetTypeDescription(1003)  ;

  cbIncDebtorsCreditors.Caption :=  DMTCCoreLink.GetTextLangNoAmp(112) +'  ' +  DMTCCoreLink.GetTextLangNoAmp(31) + ' / ' + DMTCCoreLink.GetTextLangNoAmp(30);
  CBType.Items[0] := DMTCCoreLink.GetTextLang(1021);
  CBType.Items[1] := DMTCCoreLink.GetTextLang(206);
  CBType.Items[2] := DMTCCoreLink.GetTextLang(1000);
  CBType.Items[3] := DMTCCoreLink.GetTextLang(3106);
  CBType.Items[4] := DMTCCoreLink.GetTextLang(3107);
  CBType.Items[5] := DMTCCoreLink.GetTextLang(3108);

  CBType.Items[6] := DMTCCoreLink.GetTextLang(3166);
  CBType.Items[7] := DMTCCoreLink.GetTextLang(3167);
  CBType.Items[8] := DMTCCoreLink.GetTextLang(3168);
  CBType.Items[9] := DMTCCoreLink.GetTextLang(3368);
  CBType.Items[10] := DMTCCoreLink.GetTextLang(3372);
  CBType.Items[11] := DMTCCoreLink.GetTextLang(3373);


  if not BShowUnposted then
     LoadReportOp else
     begin
        Caption := DMTCCoreLink.GetTextLangNoAmp(532);
        FrameLookupPeriods.PageControl1.ActivePageIndex := 0 ;
        FrameLookupPeriods.rgPEriode.ItemIndex := 5 ;
        FrameLookupPeriods.rgPEriodeClick(self);
       // if FrameLookupPeriods.CBFromPeriode.Items.Count <> 0 then
      //  FrameLookupPeriods.CBFromPeriode.ItemIndex := 0 ;

        dbcboxIncOpeningBalance.Checked := True;
        dbcboxIncOpeningBalanceClick(self);
        dbcboxOnlyOpeningBalance.Checked := False;

        CBHideNilBal.Checked := True;
        CBGroup.ItemIndex := 0;

        While CBType.Items.Count > 3 do
            CBType.Items.Delete(CBType.Items.Count-1);
        CBType.ItemIndex := 0 ;
        CBTypeChange(self);
        CBBuget.Checked := False;
        cbIncDebtorsCreditors.Checked := True;
        cbCostGroup2.Visible := False ;
        cbCostGroup1.Visible := False ;
        Label1.Visible := False ;
        Label5.Visible := False ;
        CBBuget.Visible := False ;

        BPrint.Visible := False ;
        CBType.ItemIndex := 0 ;
        TVMain.OnDblClick := nil ;


     end;

  if not InWorkflow then
  BCreateClick(self);
  //Self.Align  := alClient ;
end;

Procedure TAccountTreeView.LoadReportOp;
var
 aIndex : Integer ;
begin
  FrameLookupPeriods.PageControl1.ActivePageIndex := 0 ;
  //dbcboxIncOpeningBalance.Checked ;
 FrameLookupPeriods.rgPEriode.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_NWPERIOD',0);
 FrameLookupPeriods.rgPEriodeClick(self);
 aIndex :=  FrameLookupPeriods.CBFromPeriode.Items.IndexOf(DMTCCoreLink.ReadNwReportOp('TREEBAL_NWDATE','')) ;
 if aIndex <> -1 then
    FrameLookupPeriods.CBFromPeriode.ItemIndex := aIndex ;

  dbcboxIncOpeningBalance.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_INCOPENBAL',true);
  dbcboxIncOpeningBalanceClick(self);
  dbcboxOnlyOpeningBalance.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_ONLYOPENBAL',false);

  CBHideNilBal.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_HIDENILBAL',false);
  CBGroup.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_GROUP',0) ;
  CBType.ItemIndex := DMTCCoreLink.ReadNwReportOp('TREEBAL_TYPE',0) ;
  CBTypeChange(self);
  CBBuget.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_BUGET',false);
   if CBBuget.Checked then
   TVMain.Style.Color  := clLtGray ;
  cbIncDebtorsCreditors.Checked := DMTCCoreLink.ReadNwReportOp('TREEBAL_ICLDEBDCRED',true);
end;


Procedure TAccountTreeView.SaveReportOp;
begin




  DMTCCoreLink.WriteNwReportOp('TREEBAL_NWDATE',FrameLookupPeriods.CBFromPeriode.Text);

  DMTCCoreLink.WriteNwReportOp('TREEBAL_NWPERIOD',IntToStr(FrameLookupPeriods.rgPEriode.ItemIndex));


  DMTCCoreLink.WriteNwReportOp('TREEBAL_INCOPENBAL',BoolToStr(dbcboxIncOpeningBalance.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_ONLYOPENBAL',BoolToStr(dbcboxOnlyOpeningBalance.Checked,true));

  DMTCCoreLink.WriteNwReportOp('TREEBAL_HIDENILBAL',BoolToStr(CBHideNilBal.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_BUGET',BoolToStr(CBBuget.Checked,true));
  DMTCCoreLink.WriteNwReportOp('TREEBAL_ICLDEBDCRED',BoolToStr(cbIncDebtorsCreditors.Checked,true));


  DMTCCoreLink.WriteNwReportOp('TREEBAL_GROUP',IntToStr(CBGroup.ItemIndex) ) ;
  DMTCCoreLink.WriteNwReportOp('TREEBAL_TYPE',IntToStr(CBType.ItemIndex) ) ;
end;

procedure TAccountTreeView.TMymainclick(Sender: TObject);
var
  Selection : String ;
 procedure  SelectionFilterOnGroup(AOSFLedgerItem : TOSFLedgerItem ) ;
 var
  x : Integer ;
 begin
   if AOSFLedgerItem.ParentNode = nil then
      begin
       Selection := ' select x.Waccountid from account x where x.Waccountid  = a.Waccountid' ;
       exit ;
      end;
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
     FromDate := FrameLookupPeriods.GetStartDate ;
     ToDate := FrameLookupPeriods.GetEndDate ;
     
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

  if cbCostGroup1.ItemIndex > 0 then
 AAccountView.RepGroup1Id := Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex]) ;

  if cbCostGroup2.ItemIndex > 0 then
  AAccountView.RepGroup2id := Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]) ;

  AAccountView.budget := CBBuget.Checked ;


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
  if cbCostGroup1.ItemIndex > 0 then
     AAccountView.RepGroup1Id := Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex]) ;

  if cbCostGroup2.ItemIndex > 0 then
     AAccountView.RepGroup2id := Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]) ;
   AAccountView.budget := CBBuget.Checked ; 

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


procedure TAccountTreeView.CheckTree;
 Var
   ARect,NodeRect : TRect ;
   AValue : Double ;
   ChildDeep : Integer ;
   ANode : TTreeNode ;
   i,MaxLevel,MaxLength : integer ;
begin
  MaxLength := 0 ;
   MaxLevel := 0 ;
  for i := 0 to TVMain.Items.Count -1 do
  begin
     if TVMain.Items.Item[i].Level > MaxLevel then
     MaxLevel := TVMain.Items.Item[i].Level ;
     TVMain.Items.Item[i].Text := Trim(TVMain.Items.Item[i].Text) ;
     if Length(TVMain.Items.Item[i].Text) > MaxLength then
     MaxLength := Length(TVMain.Items.Item[i].Text);
  end;
  for i := 0 to TVMain.Items.Count -1 do
  begin
      if TVMain.Items.Item[i].Data = nil then Continue ;
     while Length(TVMain.Items.Item[i].Text) < MaxLength do
        TVMain.Items.Item[i].Text :=  copy(TVMain.Items.Item[i].Text +  '                                                                                             ' ,1,MaxLength) ;


     AValue :=  TOSFLedgerItem(TVMain.Items.Item[i].Data).Total ;

  if AValue >= 0 then
     TVMain.Items.Item[i].Text := TVMain.Items.Item[i].Text + RightStr('              ' + FormatFloat(MyFormat,AValue),14)
     + ' ' + RightStr('                 ',14);


  if AValue < 0 then
     TVMain.Items.Item[i].Text := TVMain.Items.Item[i].Text +  RightStr('                 ',14) +' ' +  RightStr('              ' + FormatFloat(MyFormat,-AValue),14) ;

   end;
end;


procedure TAccountTreeView.BuildTree(ANode: TTreeNode; AItem : TOSFLedgerItem);
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
            CreateNode := ((AItem.NesteldNodes[i].ProffitLoss <> 0 ) or (AItem.NesteldNodes[i].NesteldNodes.Count <> 0)) ;
          end else
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
   end;
end;

procedure TAccountTreeView.BExportClick(Sender: TObject);
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
 if (CBType.ItemIndex in [3,4,5,6,7,8,9,10,11]) then
    begin
       AStrings := TStringList.Create ;
       try
 // add header

 AStrings.Add(DMTCCoreLink.GetTextLangNoAmp(2431) +#9+DateTimeToStr(Now)) ;
 AStrings.Add(FrameLookupPeriods.GetPeriodText+#9+LGroup.Caption+#9+CBGroup.Text+#9+LReportType.Caption+#9+CBType.Text) ;
 AStrings.Add(FrameLookupPeriods.GetdescText+#9+CBBuget.Caption+#9+BoolToStr(CBBuget.checked,true)) ;

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
                   begin
                   if (CBType.ItemIndex <> 9 ) and (CBType.ItemIndex <> 10 ) and (CBType.ItemIndex <> 11 ) then
                     AddLine  := AddLine + '0' +  #9  + '0';


                   end;
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
                    if (x <> 0) and (CBType.ItemIndex <> 9 ) and (CBType.ItemIndex <> 10 )and (CBType.ItemIndex <> 11 ) then
                     AddLine := AddLine + TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(Integer(sgColumnBalans.Rows[x].Objects[0])) +
                     #9 + TDataBaseRoutines.GetAccountDescription(Integer(sgColumnBalans.Rows[x].Objects[0])) + #9
                     else
                      begin
                      if ( i = 0 ) and (x = 0 )  and (CBType.ItemIndex <> 9 ) and (CBType.ItemIndex <> 10 ) and (CBType.ItemIndex <> 11 ) then
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
      if (CBType.ItemIndex = 9) then
         begin
           AddLine  := #9 + #9 ;
           AStrings.Add( AddLine);

           AddLine  := #9 + #9 ;

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
 AStrings.Add(FrameLookupPeriods.GetPeriodText+#9+LGroup.Caption+#9+CBGroup.Text+#9+LReportType.Caption+#9+CBType.Text) ;
 AStrings.Add(FrameLookupPeriods.GetDescText+#9+CBBuget.Caption+#9+BoolToStr(CBBuget.checked,true)) ;

 AStrings.Add(CBHideNilBal.Caption+#9+BoolToStr(CBHideNilBal.checked,true)+#9+dbcboxIncOpeningBalance.Caption+#9+BoolToStr(dbcboxIncOpeningBalance.checked,true)) ;
 AStrings.Add(cbIncDebtorsCreditors.Caption+#9+BoolToStr(cbIncDebtorsCreditors.checked,true)+#9+dbcboxOnlyOpeningBalance.Caption+#9+BoolToStr(dbcboxOnlyOpeningBalance.checked,true)) ;

 AStrings.Add('') ;

   for i := 0 to TVMain.Items.Count -1 do
     if TVMain.Items[i].Data <> nil  then
      begin
        if TOSFLedgerItem(TVMain.Items[i].Data).IsGroupNode then
           AddLine := TOSFLedgerItem(TVMain.Items[i].Data).Accountcode + #9 + TOSFLedgerItem(TVMain.Items[i].Data).Name + #9
        else
        AddLine := TDataBaseRoutines.AccTypeToChar(TOSFLedgerItem(TVMain.Items[i].Data).LedgerType) + TOSFLedgerItem(TVMain.Items[i].Data).Accountcode + #9 + TOSFLedgerItem(TVMain.Items[i].Data).Name + #9  ;
        // addin levels
        for x := 0 to maxlevel do
          begin
             if TVMain.Items[i].Level > x then
              AddLine := #9 + AddLine  else
              AddLine := AddLine + #9 ;
          end;
        if (TOSFLedgerItem(TVMain.Items[i].Data).NesteldNodes.Count = 0) then
        begin
         if TOSFLedgerItem(TVMain.Items[i].Data).IncomeExpence  then
           TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).ProffitLoss  else
           TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).Balans ;

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
         if TOSFLedgerItem(TVMain.Items[i].Data).IncomeExpence  then
         TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).ProffitLoss  else
         TotalAmt := TOSFLedgerItem(TVMain.Items[i].Data).Balans ;
         Delete(AddLine,length(AddLine),1) ;
         AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,TotalAmt),12)
        end;
         AStrings.Add(AddLine);
      end ;


       AddLine :=  #9 + #9  ;
       aStrings.Add(AddLine);

        // addin levels
        for x := 0 to maxlevel -1 do
          begin
             AddLine := AddLine + #9 ;
          end;
         AddLine := AddLine+ LLProffitloss.Caption +' '  + #9 ;
         TotalAmt := StrToFloatDef(copy(LProffitloss.Caption,3,255),0);
       // TotalAmt := LedgerCalculationClass.LedgerItems[0].Total  ;

        IF   TotalAmt>= 0 then
             AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);
        AddLine :=  AddLine + #9 ;
        IF  TotalAmt < 0 then
           AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,-TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);

         AStrings.Add(AddLine);
         AddLine :=  #9 + #9  ;
        // addin levels
        for x := 0 to maxlevel -1 do
          begin
             AddLine := AddLine + #9 ;
          end;
         AddLine := AddLine+ LlTotbal.Caption +' '  + #9 ;
        //TotalAmt := LedgerCalculationClass.LedgerItems[0].Total  ;
        TotalAmt := StrToFloatDef(copy(LTotalBalans.Caption,3,255),0);

        IF   TotalAmt>= 0 then
             AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);
        AddLine :=  AddLine + #9 ;
        IF  TotalAmt < 0 then
           AddLine :=  AddLine + RightStr('                            ' + FormatFloat(MyFormat,-TotalAmt),12)
           else
              AddLine :=  AddLine + RightStr('                              '+ FormatFloat(MyFormat,0),12);

         AStrings.Add(AddLine);

   AStrings.SaveToFile(SaveDialog1.FileName);
   AddLine := SaveDialog1.FileName ;
   OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
   if not FileExists(OpenWithApp) then
   OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.xls') ;


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

procedure TAccountTreeView.CBBugetClick(Sender: TObject);
begin
// dbcboxIncOpeningBalance.Visible :=  not CBBuget.Checked and ((FromID = 14) or (FromID = 1)) ;
 TVMain.Style.Color := clWindow ;
 if CBBuget.Checked then
   TVMain.Style.Color := clLtGray ;

 HasChanges := true ;
end;



procedure TAccountTreeView.ZQTotalsAccountsBeforeOpen(DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from account where WAccountid is null');
end;

procedure TAccountTreeView.HandelImageIndexOnTreeNode(
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
                           ATreeNode.ImageIndex := 19 else
                           ATreeNode.ImageIndex := 6 ;

              end  else
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
                           ATreeNode.ImageIndex := 6 ;
              end  else
               begin
               // normal accounts
               ATreeNode.ImageIndex :=  20 ;
                 if AItem.LedgerType = 3 then
                    ATreeNode.ImageIndex := 41 else
                 if AItem.LedgerType = 4 then
                    ATreeNode.ImageIndex := 34 ;
               end;
   ATreeNode.SelectedIndex := ATreeNode.ImageIndex  ;
   // ATreeNode.StateIndex
end;

procedure TAccountTreeView.spShowViewClick(Sender: TObject);
begin
 if not TForm(TComponent(Sender).Tag).Visible then
   TForm(TComponent(Sender).Tag).Show ;
 TForm(TComponent(Sender).Tag).BringToFront ;
end;

procedure TAccountTreeView.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
try
if not BShowUnposted then
     SaveReportOp ;
 except

 end;    
end;

procedure TAccountTreeView.CreateColumnBalans;
var
 Colindex,RowIndex,i,nrofperiods : Integer ;
 WhereClause : String ;
 Total,EndBalans,Amount,FDeb,FCred : Double ;
 AProgress : TfmNewProgress ;
 bAmountFound,Doadd : Boolean ;
begin
   AProgress := TfmNewProgress.Create(nil) ;
   try

   AProgress.BtnStop.Visible := true ;


   nrofperiods :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WNoOfPeriods from sysvars')),12);
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
       sgColumnBalans.Cols[31].Objects[0] := TObject(-2) ;
       sgColumnBalans.Cols[31][0] := DMTCCoreLink.GetTextLangNoAmp(600) + ' ' + DMTCCoreLink.GetTextLangNoAmp(960) ; //Total periods' ;
       sgColumnBalans.Cols[32][0] := 'End this year' ;
       sgColumnBalans.Cols[32].Objects[0] := TObject(-2) ;





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
   AProgress.initProgress('Init..',0);
      ZQTotalsAccounts.last ;
   ZQTotalsAccounts.first ;

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

       sgColumnBalans.Cells[0,RowIndex] :=  TDataBaseRoutines.AccTypeToChar(ZQTotalsAccountsWACCOUNTTYPEID.AsInteger) + ZQTotalsAccountsSACCOUNTCODE.AsString + ' ' + ZQTotalsAccountsSDESCRIPTION.AsString ;
       sgColumnBalans.Rows[RowIndex].Objects[0] := TObject(ZQTotalsAccountsWACCOUNTID.AsInteger);
       // sgColumnBalans.Cells[29,RowIndex] := FormatFloat(MyFormat,ZQTotalsAccountsTOTAAL.AsFloat) ;
       EndBalans := 0 ;
       Total := 0 ;
       for Colindex := 1 to (sgColumnBalans.ColCount -2 )do

        begin

          if Integer(sgColumnBalans.Cols[Colindex].Objects[0]) > -2 then
            begin
              // opening bal last year
              if  Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = -1 then
                begin
                  FCred := TDataBaseRoutines.GetOpeningBalans(ZQTotalsAccountsWACCOUNTID.AsInteger,TDataBaseRoutines.GetPeriodStartDate(1)-1 ) ;
                  if FCred < 0 then
                    begin
                     FDeb := 0 ;
                     FCred := - FCred ;
                    end else
                    begin
                     FDeb := FCred ;
                     FCred := 0  ;
                    end;
                end else
              // opening bal This year
              if  Integer(sgColumnBalans.Cols[Colindex].Objects[0]) = 0 then
                begin
                  FCred := TDataBaseRoutines.GetOpeningBalans(ZQTotalsAccountsWACCOUNTID.AsInteger,TDataBaseRoutines.GetPeriodStartDate(14)-1 ) ;
                  if FCred  < 0 then
                    begin
                     FDeb := 0 ;
                     FCred := - FCred ;
                    end else
                    begin
                     FDeb := FCred ;
                     FCred := 0  ;
                    end;
                end else
               begin
                 FCred := 0  ;
                 FDeb := 0  ;
                 if  Integer(sgColumnBalans.Cols[Colindex].Objects[0]) < 14 then
                     Doadd :=  Integer(sgColumnBalans.Cols[Colindex].Objects[0]) <= nrofperiods
                     else
                     Doadd :=  (Integer(sgColumnBalans.Cols[Colindex].Objects[0])-13) <= nrofperiods ;
                if  doadd then
                  begin
                     FCred := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,false,TDataBaseRoutines.GetPeriodStartDate(Integer(sgColumnBalans.Cols[Colindex].Objects[0])),
                     TDataBaseRoutines.GetPeriodEndDate(Integer(sgColumnBalans.Cols[Colindex].Objects[0])),false,0,0));
                     FDeb := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,true,TDataBaseRoutines.GetPeriodStartDate(Integer(sgColumnBalans.Cols[Colindex].Objects[0])),
                     TDataBaseRoutines.GetPeriodEndDate(Integer(sgColumnBalans.Cols[Colindex].Objects[0])),false,0,0));
                   end;
               end;

              // perioddata
             // FCred := abs(TDataBaseRoutines.GetBalansDebCredOnPeriod(ZQTotalsAccountsWACCOUNTID.AsInteger,Integer(sgColumnBalans.Cols[Colindex].Objects[0]),False));
            //  FDeb := TDataBaseRoutines.GetBalansDebCredOnPeriod(ZQTotalsAccountsWACCOUNTID.AsInteger,Integer(sgColumnBalans.Cols[Colindex].Objects[0]),true);
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

procedure TAccountTreeView.ColumnBalansClick(Sender: TObject);
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

procedure TAccountTreeView.dbcboxIncOpeningBalanceClick(Sender: TObject);
begin
 dbcboxOnlyOpeningBalance.Visible := dbcboxIncOpeningBalance.Checked ;
 HasChanges := true ;
end;

procedure TAccountTreeView.CBGroupChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView.edtFromDateChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView.edtToDateChange(Sender: TObject);
begin
 HasChanges := true ;
end;

procedure TAccountTreeView.dbcboxOnlyOpeningBalanceClick(Sender: TObject);
begin
HasChanges := true ;
end;

procedure TAccountTreeView.CBHideNilBalClick(Sender: TObject);
begin
HasChanges := true ;
end;

procedure TAccountTreeView.TSetToLastColumnTimer(Sender: TObject);
begin
  TSetToLastColumn.Enabled := false ;
  sgColumnBalans.FocusCell(sgColumnBalans.ColCount -1,1,true)  ;
end;

procedure TAccountTreeView.CBTypeChange(Sender: TObject);
begin
 HasChanges := true ;
CBHideNilBal.Visible := true ;
dbcboxIncOpeningBalance.Visible := true ;
cbIncDebtorsCreditors.Visible := true ;
CBGroup.Visible := true ;
LGroup.Visible := true ;
CBBuget.Visible := true ;
BPrint.Visible := true ;
 Label5.Visible := true ;
FrameLookupPeriods.Visible := true ;


Label5.Visible := true ;
cbCostGroup1.Visible := true ;
Label1.Visible := true ;
cbCostGroup2.Visible := true ;

 if CBType.ItemIndex = 1 then
    begin
       dbcboxOnlyOpeningBalance.Checked := false ;
       dbcboxOnlyOpeningBalance.Visible := false ;
       dbcboxIncOpeningBalance.Checked := false ;
       dbcboxIncOpeningBalance.Visible := false ;
       cbIncDebtorsCreditors.Visible := False ;
    end else
    begin
      if (CBType.ItemIndex in [0,2,9,10,11]) then
       begin
         dbcboxOnlyOpeningBalance.Visible := True ;
         if (CBType.ItemIndex in [9]) then
         begin
        //  dbcboxOnlyOpeningBalance.Checked := false ;
        //  dbcboxOnlyOpeningBalance.Visible := false ;
         // dbcboxIncOpeningBalance.Checked := false ;
        //  dbcboxIncOpeningBalance.Visible := false ;
         // CBBuget.Visible := False ;
          CBGroup.Visible := False ;
          LGroup.Visible := False ;
          cbIncDebtorsCreditors.Visible := False ;
         end;
         if (CBType.ItemIndex in [10,11]) then
         begin
          CBGroup.Visible := False ;
          LGroup.Visible := False ;
          cbIncDebtorsCreditors.Visible := False ;
          CBBuget.Checked := False ;
          CBBuget.Visible := False ;
         end;


       end else
       begin
       BPrint.Visible := False ;
       dbcboxOnlyOpeningBalance.Checked := false ;
       dbcboxOnlyOpeningBalance.Visible := false ;
       dbcboxIncOpeningBalance.Visible := false ;
       CBBuget.Visible := false ;
       cbIncDebtorsCreditors.Visible := False ;
       CBGroup.Visible := False ;
       LGroup.Visible := False ;
       FrameLookupPeriods.Visible := False ;
       
      Label5.Visible := False ;
      cbCostGroup1.Visible := False ;

       Label1.Visible := False ;
       cbCostGroup2.Visible := False ;
     end;
    end;

end;



procedure TAccountTreeView.BPrintClick(Sender: TObject);
Var
 AStrings : TVirtualTable ;
 i ,x,MaxLevel : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
 TotalAmt : Double ;
begin
 BDoStop := false ;
 pbExp.Visible := True ;
 BStop.Visible := True ;
 LText.Visible := True ;

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
 if (CBType.ItemIndex in [3,4,5,6,7,8]) then
    begin
       exit ;
    end;

 if (CBType.ItemIndex in [9,10,11]) then
    begin
       AddLine := 'FROMDATE='+ FloatToStr(FromDate)+#13+#10 +'TODATE='+ FloatToStr(ToDate) + #13+#10 +'GROUP1='  ;
        if cbCostGroup1.ItemIndex > 0 then
          AddLine := AddLine + IntToStr( Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex])) else
          AddLine := AddLine + '0' ;

         AddLine := AddLine +   #13+#10 +'BUDGET=' + IntToStr(ord(CBBuget.Checked)) ;

         AddLine := AddLine +   #13+#10 +'GROUP2=' ;
         if cbCostGroup2.ItemIndex > 0 then
          AddLine := AddLine + IntToStr(Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]))else
          AddLine := AddLine + '0' ;
          AddLine := AddLine +  #13+#10 +'GROUP1TXT=' + cbCostGroup1.Text +' '  ;
          AddLine := AddLine +  #13+#10 +'GROUP2TXT=' + cbCostGroup2.Text +' ' ;
         AddLine := AddLine + #13+#10 + 'DEB=' +    IntToStr(DMTCCoreLink.DebtorsControlAccountid)  + #13+#10 + 'CRED=' +   IntToStr(DMTCCoreLink.CreditorsControlAccountid)  + #13+#10 + 'RET=' +   IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid);



AStrings := TVirtualTable.Create(self) ;
 try
   astrings.FieldDefs.Add('CODE',ftString,255);
   astrings.FieldDefs.Add('NAME',ftString,255);
   astrings.FieldDefs.Add('DEB',ftString,255);
   astrings.FieldDefs.Add('CRED',ftString,255);
   astrings.FieldDefs.Add('PDEB',ftString,255);
   astrings.FieldDefs.Add('PCRED',ftString,255);
   astrings.FieldDefs.Add('BDEB',ftString,255);
   astrings.FieldDefs.Add('BCRED',ftString,255);
   astrings.FieldDefs.Add('Index',ftString,255);
   astrings.FieldDefs.Add('linetype',ftString,255);
   astrings.open  ;

   // TDatabaseTableRoutines.DumpToReportmanTransport(AMemDataSet);



   for i := 0 to sgColumnBalans.RowCount -1 do
       begin
        astrings.Append ;
        astrings.Fields[0].AsString :=    sgColumnBalans.Cells[0,i]  ;
        astrings.Fields[1].AsString :=    sgColumnBalans.Cells[1,i]  ;
        astrings.Fields[2].AsString :=    sgColumnBalans.Cells[2,i]  ;
        astrings.Fields[3].AsString :=    sgColumnBalans.Cells[3,i]  ;
        astrings.Fields[4].AsString :=    sgColumnBalans.Cells[4,i]  ;
        astrings.Fields[5].AsString :=    sgColumnBalans.Cells[5,i]  ;
        astrings.Fields[6].AsString :=    sgColumnBalans.Cells[6,i]  ;
        astrings.Fields[7].AsString :=    sgColumnBalans.Cells[7,i]  ;



        astrings.Fields[8].AsInteger := i ;
        if i = 0 then astrings.Fields[9].AsString := '0'
        else if i = sgColumnBalans.RowCount -2 then
        astrings.Fields[9].AsString := '3'
        else if i = sgColumnBalans.RowCount -1 then
        astrings.Fields[9].AsString := '4'
        else if sgColumnBalans.Cells[0,i] = '' then
        astrings.Fields[9].AsString := '2'
        else  astrings.Fields[9].AsString := '1' ;
       AStrings.Post ; 
      end ;
    TDatabaseTableRoutines.DumpToReportmanTransport(AStrings,true,0,onosFProgressEvent);
    astrings.close ;
    astrings.FieldDefs.clear ;
    astrings.FieldDefs.Add('PERIOD',ftString,255);
    astrings.FieldDefs.Add('PERIODMARK',ftString,255);
    astrings.FieldDefs.Add('OPENINGBAL',ftinteger);
    astrings.FieldDefs.Add('OPENINGBALONLY',ftFloat);
    astrings.FieldDefs.Add('FROMDATE',ftDate);
    astrings.FieldDefs.Add('TYPENAME',ftString,40);
    astrings.FieldDefs.Add('TYPEINDEX',ftInteger);
    astrings.FieldDefs.Add('COSTNAME',ftString,255);
    astrings.FieldDefs.Add('COSTID',ftInteger);
    astrings.FieldDefs.Add('COSTNAME2',ftString,255);
    astrings.FieldDefs.Add('COSTID2',ftInteger);


    // astrings.FieldDefs.Add('OPENINGBALONLY',ftFloat);

    astrings.open  ;
    astrings.Append ;
    AStrings.Fields[0].AsString :=  FrameLookupPeriods.GetPurePeriodText ;
    AStrings.Fields[1].AsString :=  FrameLookupPeriods.GetDescText ;
    AStrings.Fields[2].AsInteger := ord(dbcboxIncOpeningBalance.Checked);
    AStrings.Fields[3].AsInteger := ord(dbcboxOnlyOpeningBalance.Checked);
    AStrings.Fields[4].AsDateTime := FromDate;

    if CBBuget.Checked then

    AStrings.Fields[5].AsString :=  CBBuget.Caption  + ' ' + CBType.Text
    else
    AStrings.Fields[5].AsString :=  CBType.Text ;
    AStrings.Fields[6].AsInteger := CBType.ItemIndex ;


    AStrings.Fields[7].AsString :=  cbCostGroup1.Text ;
    if cbCostGroup1.ItemIndex <> -1 then
    AStrings.Fields[8].AsInteger := Integer(cbCostGroup1.items.objects[cbCostGroup1.ItemIndex])
    else AStrings.Fields[8].AsInteger := 0 ;

    AStrings.Fields[9].AsString :=  cbCostGroup2.Text ;
    if cbCostGroup2.ItemIndex <> -1 then
    AStrings.Fields[10].AsInteger := Integer(cbCostGroup2.items.objects[cbCostGroup2.ItemIndex])
    else AStrings.Fields[8].AsInteger := 0 ;
    astrings.post ;
    TDatabaseTableRoutines.DumpToReportmanTransport(AStrings,False,2,onosFProgressEvent);
     if (CBType.ItemIndex in [9]) then
    ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\colbalsimple.rep','')
    else
    ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\budvsactsimple.rep','');

 finally
   AStrings.Free ;
 end;

     {  if dbcboxIncOpeningBalance.Checked then
       begin
         if dbcboxOnlyOpeningBalance.Checked then
            ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\colbalopenonly.rep',AddLine)
         else
            ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\colbalopen.rep',AddLine);
       end else
       ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\colbal.rep',AddLine);
       }
       exit ;
    end;
 AStrings := TVirtualTable.Create(self) ;
 try
   astrings.FieldDefs.Add('NAME',ftString,255);
   astrings.FieldDefs.Add('DEB',ftFloat);
   astrings.FieldDefs.Add('CRED',ftFloat);
   astrings.FieldDefs.Add('SDEB',ftFloat);
   astrings.FieldDefs.Add('SCRED',ftFloat);
   astrings.FieldDefs.Add('ACCTYPE',ftInteger);
   astrings.FieldDefs.Add('PROFFLOSS',ftInteger);
   astrings.FieldDefs.Add('MAINTYPE',ftInteger);
   astrings.FieldDefs.Add('ISGROUP',ftInteger);
   astrings.FieldDefs.Add('LVL',ftInteger);
   astrings.FieldDefs.Add('Index',ftInteger);



   astrings.open  ;

   // TDatabaseTableRoutines.DumpToReportmanTransport(AMemDataSet);



   for i := 0 to TVMain.Items.Count -1 do
     if TVMain.Items[i].Data <> nil  then
      begin
        AddLine := Trim(TOSFLedgerItem(TVMain.Items[i].Data).Accountcode + ' ' + TOSFLedgerItem(TVMain.Items[i].Data).Name)  ;
        // addin levels

        astrings.Append ;
        astrings.Fields[5].AsInteger :=   TOSFLedgerItem(TVMain.Items[i].Data).LedgerType ;
        astrings.Fields[6].AsInteger :=   ord(TOSFLedgerItem(TVMain.Items[i].Data).IncomeExpence) ;
        astrings.Fields[7].AsInteger :=   TOSFLedgerItem(TVMain.Items[i].Data).ControlAccountType ;
        astrings.Fields[8].AsInteger :=   ord(TOSFLedgerItem(TVMain.Items[i].Data).IsGroupNode) ;
        astrings.Fields[9].AsInteger :=   TVMain.Items[i].Level ;

        astrings.Fields[10].AsInteger :=   TVMain.Items[i].AbsoluteIndex ;

        if CBType.ItemIndex =1 then
        TotalAmt := TDataBaseLedgerRoutines.RoundTo(TOSFLedgerItem(TVMain.Items[i].Data).ProffitLoss,2)
        else
        if CBType.ItemIndex =2 then
        TotalAmt := TDataBaseLedgerRoutines.RoundTo(TOSFLedgerItem(TVMain.Items[i].Data).Balans,2)
        else
        TotalAmt := TDataBaseLedgerRoutines.RoundTo(TOSFLedgerItem(TVMain.Items[i].Data).Total,2) ;


        if (TOSFLedgerItem(TVMain.Items[i].Data).NesteldNodes.Count = 0) then
        begin
          astrings.Fields[0].AsString := AddLine ;


          astrings.Fields[1].asfloat := 0;
          astrings.Fields[2].asfloat := 0 ;

        IF   TotalAmt>= 0 then
               astrings.Fields[1].asfloat := abs(TotalAmt)
           else
              astrings.Fields[2].asfloat := abs(TotalAmt) ;

        end else
        begin
         astrings.Fields[0].AsString := AddLine ;
          astrings.Fields[3].asfloat := 0;
          astrings.Fields[4].asfloat := 0 ;

        IF   TotalAmt>= 0 then
               astrings.Fields[3].asfloat := abs(TotalAmt) 
           else
              astrings.Fields[4].asfloat := abs(TotalAmt) ;
        end;
       AStrings.Post ; 
      end ;
    TDatabaseTableRoutines.DumpToReportmanTransport(AStrings,true,0,onosFProgressEvent);
    astrings.close ;
    astrings.FieldDefs.clear ;
    astrings.FieldDefs.Add('PERIOD',ftString,255);
    astrings.FieldDefs.Add('PERIODMARK',ftString,255);
    astrings.FieldDefs.Add('OPENINGBAL',ftinteger);
    astrings.FieldDefs.Add('OPENINGBALONLY',ftFloat);
    astrings.FieldDefs.Add('FROMDATE',ftDate);
    astrings.FieldDefs.Add('TYPENAME',ftString,40);
    astrings.FieldDefs.Add('TYPEINDEX',ftInteger);
    astrings.FieldDefs.Add('COSTNAME',ftString,255);
    astrings.FieldDefs.Add('COSTID',ftInteger);
    astrings.FieldDefs.Add('COSTNAME2',ftString,255);
    astrings.FieldDefs.Add('COSTID2',ftInteger);
    astrings.FieldDefs.Add('BUDGET',ftInteger);


    // astrings.FieldDefs.Add('OPENINGBALONLY',ftFloat);

    astrings.open  ;
    astrings.Append ;
    AStrings.Fields[0].AsString :=  FrameLookupPeriods.GetPurePeriodText ;
    AStrings.Fields[1].AsString :=  FrameLookupPeriods.GetDescText ;
    AStrings.Fields[2].AsInteger := ord(dbcboxIncOpeningBalance.Checked);
    AStrings.Fields[3].AsInteger := ord(dbcboxOnlyOpeningBalance.Checked);
    AStrings.Fields[4].AsDateTime := FromDate;
     if CBBuget.Checked then

      AStrings.Fields[5].AsString :=  CBBuget.Caption  + ' ' +   CBType.Text
    else
    AStrings.Fields[5].AsString :=  CBType.Text ;
    AStrings.Fields[6].AsInteger := CBType.ItemIndex ;


    AStrings.Fields[7].AsString :=  cbCostGroup1.Text ;
    if cbCostGroup1.ItemIndex <> -1 then
    AStrings.Fields[8].AsInteger := Integer(cbCostGroup1.items.objects[cbCostGroup1.ItemIndex])
    else AStrings.Fields[8].AsInteger := 0 ;

    AStrings.Fields[9].AsString :=  cbCostGroup2.Text ;
    if cbCostGroup2.ItemIndex <> -1 then
    AStrings.Fields[10].AsInteger := Integer(cbCostGroup2.items.objects[cbCostGroup2.ItemIndex])
    else AStrings.Fields[8].AsInteger := 0 ;
    AStrings.Fields[11].AsInteger := ord(CBBuget.Checked);

    astrings.post ;
    TDatabaseTableRoutines.DumpToReportmanTransport(AStrings,False,2,onosFProgressEvent);



    ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\detail.rep','');

 finally
   AStrings.Free ;
 end;
 finally
     pbExp.Visible := False ;
     BStop.Visible := False ;
     LText.Visible := False ;
    Self.Enabled := true ;
 end;
end;

procedure TAccountTreeView.onosFProgressEvent(var Stop: Boolean;
  AText: String; AMax, APostition, aTransId: Integer);
begin
 pbExp.Position := 0 ;
 pbExp.Max := AMax ;
 pbExp.Position := APostition ;
 LText.Caption := DMTCCoreLink.GetTextLang(aTransId) + ' '+  IntToStr(AMax) + ' / ' + IntToStr(APostition) ;
 Application.ProcessMessages ;
 Stop := BDoStop ;
end;

procedure TAccountTreeView.BStopClick(Sender: TObject);
begin
BDoStop := true ;
end;

procedure TAccountTreeView.CBFromPeriodeChange(Sender: TObject);
begin
  HasChanges := true ;
end;

procedure TAccountTreeView.RealColumnBalansClick(Sender: TObject);
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
      AAccountView.aFromDate := FromDate ;
      AAccountView.aTodate := ToDate ;
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

procedure TAccountTreeView.CreateStdBudgetVsActual;
var
 Colindex,RowIndex,i : Integer ;
 WhereClause : String ;
 BalEndResult,ActEndResult, TotalD,Totalc,EndBalansd,EndBalansC,EndResultD,EndResultC,Amount,FDeb,FCred,FDebOpen,FCredOpen,FDebBud,FCredBud,FDebBudOpen,FCredBudOpen,Ftemp  : Double ;
 AProgress : TfmNewProgress ;
 bAmountFound : Boolean ;
 CostGroup1,CostGroup2 : Integer ;
begin
   EndResultd := 0 ;
   EndBalansd := 0 ;
   Totald := 0 ;
   EndResultc := 0 ;
   EndBalansc := 0 ;
   Totalc := 0 ;

   FDebOpen  := 0 ;
   FCredOpen := 0 ;

   FDebBudOpen  := 0 ;
   FCredBudOpen := 0 ;

   ActEndResult := 0 ;
   BalEndResult := 0 ;


   AProgress := TfmNewProgress.Create(self);

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
   sgColumnBalans.ColCount := 8 ;



   sgColumnBalans.FixedRows := 1 ;
   sgColumnBalans.FixedCols := 2 ;

   sgColumnBalans.OnDblClick := RealColumnBalansClick ; //ColumnBalansClick;


       sgColumnBalans.Cols[0][0] := DMTCCoreLink.GetTextLang(2123) ;
       sgColumnBalans.Cols[1][0] := DMTCCoreLink.GetTextLang(2047) ;
       sgColumnBalans.Cols[2][0] := DMTCCoreLink.GetTextLang(1021)  ;
       sgColumnBalans.Cols[3][0] := '' ;
       sgColumnBalans.Cols[4][0] := DMTCCoreLink.GetTextLang(1027) ;
       sgColumnBalans.Cols[5][0] := '' ;
       sgColumnBalans.Cols[6][0] := DMTCCoreLink.GetTextLang(955)  ;
       sgColumnBalans.Cols[7][0] := '%'  ;
    if  CBType.ItemIndex = 11 then
      begin
         sgColumnBalans.Cols[2][0] := 'D ' + FormatDateTime(ShortDateFormat, FromDate) ;
         sgColumnBalans.Cols[3][0] := 'C ' +FormatDateTime(ShortDateFormat, ToDate) ;
         sgColumnBalans.Cols[4][0] := 'D ' +FormatDateTime(ShortDateFormat, IncYear(FromDate,-1)) ;
         sgColumnBalans.Cols[5][0] := 'C ' +FormatDateTime(ShortDateFormat, IncYear(ToDate+1,-1)-1) ;
      end;


   ZQTotalsAccounts.close ;



      ZQTotalsAccounts.SQL.Text :=  'select Account.SAccountCode, Account.SDescription,Account.WAccountid,Account.WAccountTypeId,Account.WREPORTINGGROUP1ID,Account.WREPORTINGGROUP2ID,Account.BSUBACCOUNTS,'+
   ' Account.BINCOMEEXPENSE, Account.BOPENITEM, Account.BINACTIVE, Account.DSYSDATE, Account.WLINKACCOUNT, Account.WTAXACCOUNT, 0 Totaal '+
   '  from v_account account where  (Account.Waccountid <> 0) and  Account.WAccountTypeID not in (1,2) order by Account.SAccountCode' ;

      ZQTotalsAccounts.Open ;
      AProgress.initProgress('Init..',0);
      ZQTotalsAccounts.last ;
      ZQTotalsAccounts.first ;
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
       if ZQTotalsAccountsBSUBACCOUNTS.AsInteger = 1 then
        begin
        if not (ZQTotalsAccountsWACCOUNTID.AsInteger in [DMTCCoreLink.DebtorsControlAccountid,DMTCCoreLink.CreditorsControlAccountid,DMTCCoreLink.RetaindIncomeControlAccountid]) 
          then
         begin
        ZQTotalsAccounts.Next ;
        Continue ;
        end;
        end;

       bAmountFound := false ;
       AProgress.SetProgress('',ZQTotalsAccounts.RecNo);
       if AProgress.bStop then
          Raise Exception.Create('User stop!');
       Application.ProcessMessages ;
       FDeb := 0 ;
       FCred := 0 ;
       FDebBud := 0 ;
       FCredBud := 0 ;
       sgColumnBalans.Cells[0,RowIndex] :=  trim(TDataBaseRoutines.AccTypeToChar(ZQTotalsAccountsWACCOUNTTYPEID.AsInteger) + ZQTotalsAccountsSACCOUNTCODE.AsString);
       sgColumnBalans.Cells[1,RowIndex] :=  trim(ZQTotalsAccountsSDESCRIPTION.AsString) ;
       sgColumnBalans.Rows[RowIndex].Objects[0] := TObject(ZQTotalsAccountsWACCOUNTID.AsInteger);
        CostGroup1 := 0 ;
        CostGroup2 := 0 ;
         if cbCostGroup1.ItemIndex > 0 then
          CostGroup1  := Integer(cbCostGroup1.Items.Objects[cbCostGroup1.ItemIndex]);
         if cbCostGroup2.ItemIndex > 0 then
          CostGroup2  := Integer(cbCostGroup2.Items.Objects[cbCostGroup2.ItemIndex]);

           if dbcboxOnlyOpeningBalance.Checked then
               begin

                 if CBType.ItemIndex = 10 then
                 begin
                  FDebBudOpen  := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                  FCredBudOpen := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));
                 end else
                 begin
                  FDebBudOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,IncYear(FromDate,-1),0,True,CostGroup1,CostGroup2));
                  FCredBudOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,IncYear(FromDate,-1),0,True,CostGroup1,CostGroup2));
                 end;


                 FDebOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                 FCredOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));

                     if (FDebOpen - FCredOpen) > 0 then
                       begin
                         FDeb :=   (FDebOpen - FCredOpen) ;
                       end else
                       begin
                         FCred :=   abs(FDebOpen - FCredOpen) ;
                       end;
                     if (FDebBudOpen - FCredBudOpen) > 0 then
                       begin
                         FDebBud :=  (FDebBudOpen - FCredBudOpen) ;
                       end else
                       begin
                         FCredBud :=   abs(FDebBudOpen - FCredBudOpen) ;
                       end;


               end else
               begin
                 if CBType.ItemIndex = 10 then
                 begin
                  FCredBud := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,ToDate,false,CostGroup1,CostGroup2));
                  FDebBud :=  TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,ToDate,false,CostGroup1,CostGroup2) ;
                 end else
                 begin
                  FCredBud := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,IncYear(FromDate,-1),IncYear(ToDate+1,-1)-1,false,CostGroup1,CostGroup2));
                  FDebBud :=  TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,IncYear(FromDate,-1),IncYear(ToDate+1,-1)-1,false,CostGroup1,CostGroup2) ;
                  end;
                  FCred := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,ToDate,false,CostGroup1,CostGroup2));
                  FDeb :=  TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,ToDate,false,CostGroup1,CostGroup2) ;

                if dbcboxIncOpeningBalance.Checked then
                    begin

                     if CBType.ItemIndex = 10 then
                      begin

                        FDebBudOpen  := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                        FCredBudOpen := abs(TDataBaseRoutines.GetBudgetDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));
                      end else
                      begin
                        FDebBudOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,IncYear(FromDate,-1),0,True,CostGroup1,CostGroup2));
                        FCredBudOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,IncYear(FromDate,-1),0,True,CostGroup1,CostGroup2));

                      end;
                        FDebOpen  := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,True,FromDate,0,True,CostGroup1,CostGroup2));
                        FCredOpen := abs(TDataBaseRoutines.GetBalansDebCredOnDate(ZQTotalsAccountsWACCOUNTID.AsInteger,False,FromDate,0,True,CostGroup1,CostGroup2));

                     if (FDebOpen - FCredOpen) > 0 then
                       begin
                         FDeb := FDeb + (FDebOpen - FCredOpen) ;
                       end else
                       begin
                         FCred := FCred + abs(FDebOpen - FCredOpen) ;
                       end;
                     if (FDebBudOpen - FCredBudOpen) > 0 then
                       begin
                         FDebBud := FDebBud + (FDebBudOpen - FCredBudOpen) ;
                       end else
                       begin
                         FCredBud := FCredBud + abs(FDebBudOpen - FCredBudOpen) ;
                       end;


                    end;
              end;

        Amount :=  FDeb - FCred ;
        if (ZQTotalsAccountsBINCOMEEXPENSE.AsInteger = 1 ) and (ZQTotalsAccountsBSUBACCOUNTS.AsInteger = 0) then
             begin
             ActEndResult := ActEndResult  + Amount ;
             BalEndResult := BalEndResult + (FDebBud -  FCredBud) ;
             end;




        if (FDeb <> 0) or (FCred <> 0) or (FDebBud <> 0) or (FCredBud <> 0)  then
            bAmountFound := true;

       Totald   := Totald  + FDeb ;
       Totalc   := Totalc  + FCred ;

       sgColumnBalans.Cells[2,RowIndex] :=  FormatFloat(MyFormat,0) ;
       sgColumnBalans.Cells[3,RowIndex] :=  FormatFloat(MyFormat,0) ;

       if (FDeb - FCred) > 0 then
       sgColumnBalans.Cells[2,RowIndex] :=  FormatFloat(MyFormat,FDeb - FCred) else
       sgColumnBalans.Cells[3,RowIndex] :=  FormatFloat(MyFormat,-(FDeb - FCred)) ;


            sgColumnBalans.Cells[4,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[5,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[6,RowIndex] :=  FormatFloat(MyFormat,0) ;
            sgColumnBalans.Cells[7,RowIndex] :=  FormatFloat(MyFormat,0) ;


             EndResultd := EndResultd  + FDebBud ;
             EndResultc := EndResultc  + FCredBud ;
             if (FDebBud - FCredBud) > 0 then
             sgColumnBalans.Cells[4,RowIndex] :=  FormatFloat(MyFormat,FDebBud - FCredBud) else
             sgColumnBalans.Cells[5,RowIndex] :=  FormatFloat(MyFormat,-(FDebBud - FCredBud)) ;

            Ftemp :=  (FDebBud - FCredBud) - (FDeb - FCred) ;
            FDebBudOpen := 0 ;
            FCredBudOpen := 0 ;
            if (FDebBud - FCredBud) > 0 then
              FDebBudOpen := Ftemp else
              FCredBudOpen := - Ftemp ;

            EndBalansd := EndBalansd  + FDebBudOpen ;
            EndBalansc := EndBalansc  + FCredBudOpen ;

            sgColumnBalans.Cells[6,RowIndex] :=  FormatFloat(MyFormat,Ftemp);

            if ( (FDebBud - FCredBud) <> 0 ) and ((FDeb - FCred) <> 0)then
            begin
            Ftemp := ((FDeb - FCred) / ((FDebBud - FCredBud)) ) * 100   ;
            end  else
            Ftemp := 100 ;
            sgColumnBalans.Cells[7,RowIndex] :=  FormatFloat(MyFormat,Ftemp) ;


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
      end else
      begin
        // todo : make end totals
        sgColumnBalans.RowCount := sgColumnBalans.RowCount + 2 ;
          Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;
           Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;




       {  if (EndBalansd-EndBalansC) > 0 then
         sgColumnBalans.Cols[6][RowIndex-1] := FormatFloat(MyFormat,EndBalansd-EndBalansC) else
         sgColumnBalans.Cols[7][RowIndex-1] := FormatFloat(MyFormat,-(EndBalansd-EndBalansC));
         }

         sgColumnBalans.Cols[1][RowIndex-1] := DMTCCoreLink.GetTextLang(1160) ;

         if (ActEndResult) > 0 then
         begin
          sgColumnBalans.Cols[2][RowIndex-1] := FormatFloat(MyFormat,ActEndResult) ;

          sgColumnBalans.Cols[3][RowIndex-1] := '0';
         end else
         begin
          sgColumnBalans.Cols[2][RowIndex-1] := '0' ;
          sgColumnBalans.Cols[3][RowIndex-1] := FormatFloat(MyFormat,-(ActEndResult));

         end;

          if (BalEndResult) > 0 then
          sgColumnBalans.Cells[4,RowIndex-1] :=  FormatFloat(MyFormat,BalEndResult) else
          sgColumnBalans.Cells[5,RowIndex-1] :=  FormatFloat(MyFormat,-(BalEndResult)) ;

          sgColumnBalans.Cells[6,RowIndex-1] :=  FormatFloat(MyFormat,BalEndResult-ActEndResult) ;

           Inc(RowIndex,1) ;
         for i := 0 to sgColumnBalans.ColCount -1 do
            sgColumnBalans.Cols[i][RowIndex-1] := '' ;


         sgColumnBalans.Cols[1][RowIndex-1] := DMTCCoreLink.GetTextLang(1360) ;

         sgColumnBalans.Cols[2][RowIndex-1] := '' ;
         sgColumnBalans.Cols[3][RowIndex-1] := '' ;
         sgColumnBalans.Cols[4][RowIndex-1] := '' ;
         sgColumnBalans.Cols[5][RowIndex-1] := '' ;
         sgColumnBalans.Cols[6][RowIndex-1] := '' ;
         sgColumnBalans.Cols[7][RowIndex-1] := '' ;

         if  (TotalD -  TotalC) > 0 then
         sgColumnBalans.Cols[2][RowIndex-1] := FormatFloat(MyFormat,TotalD-  TotalC)
         else
         sgColumnBalans.Cols[3][RowIndex-1] := FormatFloat(MyFormat,-(TotalD-  TotalC)) ;
         if (EndResultD -  EndResultC) > 0 then
           sgColumnBalans.Cols[4][RowIndex-1] := FormatFloat(MyFormat,EndResultD -  EndResultC)
              else
           sgColumnBalans.Cols[5][RowIndex-1] := FormatFloat(MyFormat,-(EndResultD -  EndResultC)) ;

         sgColumnBalans.Cols[6][RowIndex-1] := FormatFloat(MyFormat,EndBalansd - EndBalansC) ;
         sgColumnBalans.Cols[7][RowIndex-1] := '' ;
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
procedure TAccountTreeView.TVMainDblClick(Sender: TObject);
begin

 PopupMenu1.Popup(Mouse.CursorPos.X,mouse.CursorPos.y);
end;

{ twf_TAccountTreeView }

constructor twf_TAccountTreeView.Create(AOwner: TComponent);
begin
  inherited;
  Description := 'Total viewer REPORTTYPE aas index for the reportype BUDGET, OPENINGSBAL OPENINGSBALONLY as boolean'+ #13+#10 +
  ' values GROUPON the type of grouping PERIODTYPE and PERIODID as index of the periods COSTGROUP1 and COSTGROUP2 for costgrouping ACTION = 0 show or 1 print';
  Displayname := 'totalviewer';
  with Inparams.Add as TParam do
     begin
        Name := 'REPORTTYPE' ;
        DataType := ftinteger ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'BUDGET' ;
        DataType := ftboolean;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'OPENINGSBAL' ;
        DataType := ftboolean;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'OPENINGSBALONLY' ;
        DataType := ftboolean;
        Value := False ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'GROUPON' ;
        DataType := ftinteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'COSTGROUP1' ;
        DataType := ftinteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'COSTGROUP2' ;
        DataType := ftinteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PERIODTYPE' ;
        DataType := ftinteger;
        Value := 5 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PERIODID' ;
        DataType := ftinteger;
        Value := 4 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'ACTION' ;
        DataType := ftinteger;
        Value := 0 ;
     end;
end;

procedure twf_TAccountTreeView.WorkflowEnd(AForm: TForm);
begin
  inherited;
  AForm.Free ;
end;

function twf_TAccountTreeView.WorkFlowStart: TForm;
begin
 Result := TAccountTreeView.Create(self);
 try
  with Result as TAccountTreeView do
    begin
        InWorkflow := True ;
        parent := self.parent ;
        Align := alClient ;
        BorderStyle := bsNone ;
        Show ;

        dbcboxIncOpeningBalance.Checked:= Inparams.ParamByName('OPENINGSBAL').AsBoolean ;
        dbcboxOnlyOpeningBalance.Checked:= Inparams.ParamByName('OPENINGSBALONLY').AsBoolean ;
        CBBuget.Checked:= Inparams.ParamByName('BUDGET').AsBoolean ;
        dbcboxIncOpeningBalance.Checked:= Inparams.ParamByName('OPENINGSBAL').AsBoolean ;
        CBGroup.ItemIndex:= Inparams.ParamByName('GROUPON').AsInteger ;
        CBType.ItemIndex:= Inparams.ParamByName('REPORTTYPE').AsInteger ;
        cbCostGroup1.ItemIndex:= cbCostGroup1.Items.IndexOfObject( TObject(Inparams.ParamByName('COSTGROUP1').AsInteger)) ;
        cbCostGroup2.ItemIndex:= cbCostGroup2.Items.IndexOfObject( TObject(Inparams.ParamByName('COSTGROUP2').AsInteger)) ;
        FrameLookupPeriods.rgPEriode.ItemIndex := Inparams.ParamByName('PERIODTYPE').AsInteger ;
        FrameLookupPeriods.rgPEriodeClick(nil);
        FrameLookupPeriods.CBFromPeriode.ItemIndex := Inparams.ParamByName('PERIODID').AsInteger ;
        BCreateClick(nil);
        if Inparams.ParamByName('ACTION').AsInteger = 1 then
          BPrintClick(nil);

    end;
      if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;    
 except

 end;
end;
initialization
 twf_TAccountTreeView.create(nil);
end.
