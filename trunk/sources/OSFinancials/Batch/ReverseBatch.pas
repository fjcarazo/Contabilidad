unit ReverseBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, DB, Menus,
  USQLHolder,   DBAccess , Uni, Buttons,
  ExtCtrls,  MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFormReverseBatch = class(TForm)
    PageControl1: TPageControl;
    TSBatches: TTabSheet;
    TSDocuments: TTabSheet;
    TSDetails: TTabSheet;
    DSDetails: TDataSource;
    QDetails: TuniQuery;
    QBatCon: TuniQuery;
    DSBatcon: TDataSource;
    QBatConWBatchId: TIntegerField;
    QBatConSAlias: TStringField;
    QBatCondsysdate: TDateTimeField;
    QBatConlinecount: TIntegerField;
    PopupMenu1: TPopupMenu;
    Detail1: TMenuItem;
    Report1: TMenuItem;
    QBatConwdocid: TIntegerField;
    QAccounts: TuniQuery;
    QAccountsWaccountId: TIntegerField;
    QAccountsWperiodId: TIntegerField;
    QGenMast: TuniQuery;
    QDetailsWBATCHID: TIntegerField;
    QDetailsWLINEID: TIntegerField;
    QDetailsSREFERENCE: TStringField;
    QDetailsDDATE: TDateTimeField;
    QDetailsSDESCRIPTION: TStringField;
    QDetailsWACCOUNTID: TIntegerField;
    QDetailsSACCOUNT: TStringField;
    QDetailsWCONTRAACCOUNTID: TIntegerField;
    QDetailsSCONTRAACCOUNT: TStringField;
    QDetailsWTAXID: TIntegerField;
    QDetailsSTAX: TStringField;
    QDetailsFAMOUNT: TFloatField;
    QDetailsFDEBIT: TFloatField;
    QDetailsFCREDIT: TFloatField;
    QDetailsFTAXAMOUNT: TFloatField;
    QDetailsDALLOCATEDDATE: TDateTimeField;
    QDetailsBEXCLUSIVE: TSmallintField;
    QDetailsWLINKEDID: TIntegerField;
    QDetailsWREPORTINGGROUP1ID: TIntegerField;
    QDetailsWREPORTINGGROUP2ID: TIntegerField;
    QDetailsWTRANSACTIONID: TIntegerField;
    POkbutton: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QGen: TuniQuery;
    QBatConMINDATE: TDateTimeField;
    QBatConMAXDATE: TDateTimeField;
    BUndook: TButton;
    QAccountsWACCOUNTTYPEID: TIntegerField;
    Memo1: TMemo;
    ZQHistTotals: TuniQuery;
    ZQHistPeriods: TuniQuery;
    ZQHistPeriodsWYEARID: TIntegerField;
    ZQHistPeriodsWPERIODID: TIntegerField;
    ZQHistPeriodsDSTARTDATE: TDateTimeField;
    ZQHistPeriodsDENDDATE: TDateTimeField;
    ZQHistPeriodsSDESCRIPTION: TStringField;
    ZQHistPeriodsDSYSDATE: TDateTimeField;
    ZQHistTotalsSACCOUNTCODE: TStringField;
    ZQHistTotalsWACCOUNTTYPEID: TIntegerField;
    ZQHistTotalsWACCOUNTID: TIntegerField;
    ZQHistTotalsWYEARID: TIntegerField;
    ZQHistTotalsWPERIODID: TIntegerField;
    ZQHistTotalsBACTUAL: TSmallintField;
    ZQHistTotalsFAMOUNT: TFloatField;
    ZQHistTotalsDSYSDATE: TDateTimeField;
    ZUdHistPeriods: TUniUpdateSql;
    ZUdHistTotals: TUniUpdateSql;
    tblDocHeader: TUniQuery;
    tblDocHeaderWDOCID: TIntegerField;
    tblDocHeaderSDOCNO: TStringField;
    tblDocHeaderWTYPEID: TIntegerField;
    tblDocHeaderDDATE: TDateTimeField;
    tblDocHeaderDALLOCATEDDATE: TDateTimeField;
    tblDocHeaderWACCOUNTID: TIntegerField;
    tblDocHeaderWPAYMENTTYPEID: TIntegerField;
    tblDocHeaderWPOSTAL1ID: TIntegerField;
    tblDocHeaderWPOSTAL2ID: TIntegerField;
    tblDocHeaderWPOSTAL3ID: TIntegerField;
    tblDocHeaderWPOSCOUNTRIES_ID: TIntegerField;
    tblDocHeaderWPOSTALCODEID: TIntegerField;
    tblDocHeaderWMESSAGE1ID: TIntegerField;
    tblDocHeaderWMESSAGE2ID: TIntegerField;
    tblDocHeaderWMESSAGE3ID: TIntegerField;
    tblDocHeaderFINVOICEDISCOUNT: TFloatField;
    tblDocHeaderWSALESMANID: TIntegerField;
    tblDocHeaderSREFERENCE: TStringField;
    tblDocHeaderWDELADDRESS1ID: TIntegerField;
    tblDocHeaderWDELADDRESS2ID: TIntegerField;
    tblDocHeaderWDELADDRESS3ID: TIntegerField;
    tblDocHeaderWDELCOUNTRIES_ID: TIntegerField;
    tblDocHeaderWDELCODEID: TIntegerField;
    tblDocHeaderBPRINTED: TSmallintField;
    tblDocHeaderBPOSTED: TSmallintField;
    tblDocHeaderWREPORTINGGROUP1ID: TIntegerField;
    tblDocHeaderWREPORTINGGROUP2ID: TIntegerField;
    tblDocHeaderWPAYMENTGROUPID: TIntegerField;
    tblDocHeaderBEXCLUSIVE: TSmallintField;
    tblDocHeaderWCURRENCYID: TIntegerField;
    tblDocHeaderFDOCAMOUNT: TFloatField;
    tblDocHeaderFTAXAMOUNT: TFloatField;
    tblDocHeaderBREPEATING: TSmallintField;
    tblDocHeaderDSYSDATE: TDateTimeField;
    tblDocHeaderWSOURCETYPEID: TIntegerField;
    tblDocHeaderWPROFILEID: TIntegerField;
    tblDocHeaderWTERMS: TIntegerField;
    tblDocHeaderWJOBCODEID: TIntegerField;
    tblDocHeaderDDUEDATE: TDateTimeField;
    tblDocHeaderWUSERID: TIntegerField;
    tblDocHeaderSEXTERNALID: TStringField;
    tblDocHeaderWPOSTALNAME: TIntegerField;
    tblDocHeaderWPOSTALCONTACT: TIntegerField;
    tblDocHeaderWDELNAME: TIntegerField;
    tblDocHeaderWDELCONTACT: TIntegerField;
    tblDocHeaderWTAXNUMBER: TIntegerField;
    tblDocHeaderWCONTRAACCOUNT: TIntegerField;
    tblDocHeaderWOPENITEMTRANSACTID: TIntegerField;
    tblDocHeaderFCURRENCYRATE: TFloatField;
    dsDocHeader: TDataSource;
    cxbatchesDBTableView1: TcxGridDBTableView;
    cxbatchesLevel1: TcxGridLevel;
    cxbatches: TcxGrid;
    cxbatchesDBTableView1WBatchId: TcxGridDBColumn;
    cxbatchesDBTableView1SAlias: TcxGridDBColumn;
    cxbatchesDBTableView1dsysdate: TcxGridDBColumn;
    cxbatchesDBTableView1linecount: TcxGridDBColumn;
    cxbatchesDBTableView1wdocid: TcxGridDBColumn;
    cxbatchesDBTableView1MINDATE: TcxGridDBColumn;
    cxbatchesDBTableView1MAXDATE: TcxGridDBColumn;
    Panel1: TPanel;
    ID: TLabel;
    BDeleteBatch: TButton;
    EFindId: TEdit;
    Button1: TButton;
    CBNoDocPosts: TCheckBox;
    BReDoAll: TButton;
    Button2: TButton;
    reverseYear: TButton;
    Bhardremove: TBitBtn;
    cxDetailsDBTableView1: TcxGridDBTableView;
    cxDetailsLevel1: TcxGridLevel;
    cxDetails: TcxGrid;
    Panel2: TPanel;
    bPrintdetails: TBitBtn;
    cxDetailsDBTableView1WTRANSACTIONID: TcxGridDBColumn;
    cxDetailsDBTableView1WBATCHID: TcxGridDBColumn;
    cxDetailsDBTableView1WLINEID: TcxGridDBColumn;
    cxDetailsDBTableView1SREFERENCE: TcxGridDBColumn;
    cxDetailsDBTableView1DDATE: TcxGridDBColumn;
    cxDetailsDBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxDetailsDBTableView1WACCOUNTID: TcxGridDBColumn;
    cxDetailsDBTableView1SACCOUNT: TcxGridDBColumn;
    cxDetailsDBTableView1WCONTRAACCOUNTID: TcxGridDBColumn;
    cxDetailsDBTableView1SCONTRAACCOUNT: TcxGridDBColumn;
    cxDetailsDBTableView1WTAXID: TcxGridDBColumn;
    cxDetailsDBTableView1STAX: TcxGridDBColumn;
    cxDetailsDBTableView1FAMOUNT: TcxGridDBColumn;
    cxDetailsDBTableView1FDEBIT: TcxGridDBColumn;
    cxDetailsDBTableView1FCREDIT: TcxGridDBColumn;
    cxDetailsDBTableView1FTAXAMOUNT: TcxGridDBColumn;
    cxDetailsDBTableView1DALLOCATEDDATE: TcxGridDBColumn;
    cxDetailsDBTableView1BEXCLUSIVE: TcxGridDBColumn;
    cxDetailsDBTableView1WLINKEDID: TcxGridDBColumn;
    cxDetailsDBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn;
    cxDetailsDBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    cxdocumentsDBTableView1: TcxGridDBTableView;
    cxdocumentsLevel1: TcxGridLevel;
    cxdocuments: TcxGrid;
    Panel3: TPanel;
    BDocuments: TButton;
    BSelectFromList: TButton;
    EFindDocNo: TEdit;
    Label1: TLabel;
    cxdocumentsDBTableView1SDOCNO: TcxGridDBColumn;
    cxdocumentsDBTableView1DDATE: TcxGridDBColumn;
    cxdocumentsDBTableView1SREFERENCE: TcxGridDBColumn;
    cxdocumentsDBTableView1WDOCID: TcxGridDBColumn;
    UniUpdateSQL1: TUniUpdateSQL;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDeleteBatchClick(Sender: TObject);
    procedure BRecalcTotalsClick(Sender: TObject);
    procedure BDocumentsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure EFindIdChange(Sender: TObject);
    procedure EFindIdDblClick(Sender: TObject);
    procedure EFindDocNoChange(Sender: TObject);
    procedure BSelectFromListClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure BReDoAllClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BUndookClick(Sender: TObject);
    procedure reverseYearClick(Sender: TObject);
    procedure POkbuttonDblClick(Sender: TObject);
    procedure bPrintdetailsClick(Sender: TObject);
    procedure BhardremoveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CBNoDocPostsClick(Sender: TObject);
  private
    { Private declarations }
  public
    BatchListAndClause : String ;
    gotodocid : Integer ;
    gototransactid  : Integer ;
    { Public declarations }
  end;

procedure ImportPostedBatch (AbatchTypeId : Integer );

implementation

uses Database,GlobalFunctions,ExchangeTCData, LanguageChoice, DatabaseAccess,
  ledgerRoutines,TcVariables, UDMCoreData,OSFGeneralRoutines,tcashclasses,
  NewProgress, UDMTCCoreLink, Periods, UReportManager, FreeReportsUnit,
  UDmQuantumGridDefs;

{$R *.dfm}

procedure ImportPostedBatch (AbatchTypeId : Integer );
var
 aFormReverseBatch : TFormReverseBatch ;
 ABatchTableName,MaxLineId,BatchId : String ;
 BatchCtrlID : Integer ;
begin
 aFormReverseBatch := TFormReverseBatch.Create(nil) ;
   try
     aFormReverseBatch.BitBtn1.Visible := true ;
     aFormReverseBatch.TSDocuments.TabVisible := false ;
     aFormReverseBatch.ID.Visible := false ;
     aFormReverseBatch.Button1.Visible := false ;
     aFormReverseBatch.BReDoAll.Visible := false ;
     aFormReverseBatch.CBNoDocPosts.Visible := false ;
     aFormReverseBatch.EFindId.Visible := false ;
     aFormReverseBatch.BDeleteBatch.Visible := false ;

     aFormReverseBatch.cxDetailsDBTableView1SREFERENCE.Visible := false ;
     aFormReverseBatch.cxDetailsDBTableView1SREFERENCE.VisibleForCustomization := False ;

     aFormReverseBatch.cxDetailsDBTableView1SACCOUNT.Visible := false ;
     aFormReverseBatch.cxDetailsDBTableView1SACCOUNT.VisibleForCustomization := False ;


     // aFormReverseBatch.DBGrid1.Columns[4].Visible := false ;
   //  aFormReverseBatch.DBGrid1.Options := aFormReverseBatch.DBGrid1.Options - [dgMultiSelect];
     aFormReverseBatch.BatchListAndClause := '  and BatCon.WBatchTypeId = '  +  IntToStr(AbatchTypeId);
     if aFormReverseBatch.ShowModal = mrok then
         begin

            BatchId := aFormReverseBatch.QBatConWBatchId.AsString ;
            ABatchTableName := OpenBatch(GetBatchTypeName(AbatchTypeId),BatchCtrlID,false);
            // Look if theres a maxline
            dmDatabase.qGen.sql.text := 'select max(wlineId) + 1 from ' + dmDatabase.tblBatch.TableName ;
            dmDatabase.qGen.open ;
            MaxLineId := dmDatabase.qGen.Fields[0].AsString ;
            if MaxLineId = '' then MaxLineId := '0'  ;
            // Put the data back in to the batch
            dmDatabase.qGen.close ;
            dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatch'),[ABatchTableName,MaxLineId,MaxLineId,BatchId]);
            dmDatabase.qGen.ExecSQL ;

         end;
   finally
      aFormReverseBatch.Free ;
   end;

end;

procedure TFormReverseBatch.FormDestroy(Sender: TObject);
begin
 QBatCon.Close ;
 
 SetProgress(-1);
end;

procedure TFormReverseBatch.FormCreate(Sender: TObject);
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
  QDetailsSACCOUNT.Size := MainAccountLength + 4 ;
  QDetailsSCONTRAACCOUNT.Size := MainAccountLength + 4 ;
  QDetailsSTAX.Size := MainAccountLength + 4 ;
  PageControl1.ActivePageIndex := 0 ;
end;

procedure TFormReverseBatch.BDeleteBatchClick(Sender: TObject);
 var
   Head,Log,BatchId,ABatchTableName,TempTableName,MaxLineId : String ;
   Selected : Array of string ;
   x,i,NewBatID,OldBatch,BatchControlInToId,batchcount ,LineOffset,Dummy: Integer ;
   AModalResult : TModalResult ;
  ADmCoreDataBatch : TDMCoreData ;
  AProgress : TfmNewProgress ;
  AQuery,LinkesQuery : TuniQuery ;
  DoNoAskAgain ,BIsLastYear,BIsBAnkBAtch: Boolean ;
begin


 // temp table name
 TempTableName := 'POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser) ;
 dmDatabase.CreateBatch(TempTableName) ;

 ADmCoreDataBatch := TDMCoreData.create(nil) ;
 try
 if  QBatConwdocid.AsInteger <> 0 then
  If ( OSFMessageDlg('You are going to reverse a document posting Do you want to continue?', mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;

  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;
AProgress := TfmNewProgress.create(nil) ;
try

  AProgress.initProgress('Start reverse...',1);
  AQuery := TuniQuery.Create(self) ;
  LinkesQuery := TuniQuery.Create(self) ;
try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  LinkesQuery.Connection := DMTCCoreLink.TheZConnection ;
  dmDatabase.ZMainconnection.StartTransaction ;

  BDeleteBatch.Enabled := false ;
  BDocuments.Enabled := false ;

 // save batch

     setlength(Selected,cxbatchesDBTableView1.Controller.SelectedRecordCount);
     for i := 0 to cxbatchesDBTableView1.Controller.SelectedRecordCount -1 do
       begin
          cxbatchesDBTableView1.Controller.SelectedRecords[i].Focused ;
          Selected[i] := QBatConWBatchID.AsString ;
       end;

  cxbatchesDBTableView1.DataController.DataSource := nil ;
   try
  AProgress.initProgress('',high(Selected));
  for i := low (Selected) to high(Selected) do
  begin
  Randomize ;
  AProgress.SetProgress('',i);
  BatchId := Selected[i] ;
  TDataBaseRoutines.GetBatchInfo(TDataBaseRoutines.GetBatchIdFromPRocessId(StrToIntDef( BatchId,0)),BIsBAnkBAtch,Dummy);

 { Head := ApplicationPath + 'tempBatchExp.txf' ;
  Log :=  ApplicationPath + 'tempBatchExp.log' ;
  ExportXmlTransact(StrToIntDef(BatchId,0),StrToIntDef(BatchId,0),-1,Head,Log,4);  }
   AQuery.Close ;
   AQuery.sql.text := 'select * from TRANSACT where WBatchId =  :Param1' ;
   AQuery.Params[0].AsInteger := StrToInt(BatchId) ;
   AQuery.Open ;
    LinkesQuery.Close ;
   LinkesQuery.sql.text := 'select oilinks.*,TRANSACT.WLINEID from OILINKS join TRANSACT on transact.Wtransactionid = OILINKS.WLINKTRANSACTIONID where transact.WBatchId =  :Param1' ;
   LinkesQuery.Params[0].AsInteger := StrToInt(BatchId) ;
   LinkesQuery.Open ;

   batchcount :=  AQuery.RecordCount ;
   AProgress.InitSubProgress('Removing links',AQuery.RecordCount);
   LineOffset := 0 ;
        if not AQuery.IsEmpty then
         begin

            while not AQuery.eof do
             begin
              TDataBaseLedgerRoutines.ClearLink([AQuery.fieldByNAme('WTransactionID').AsInteger]);
               AProgress.SetSubProgress(AQuery.RecNo);
              AQuery.Next ;
             end;

    AQuery.sql.text := 'select count(Wlineid) , Wlineid,max(Wtransactionid) Wtransactionid  from transact where wbatchid= :id group by wlineid having count(wlineid) > 1' ;
   AQuery.Params[0].AsInteger := StrToInt(BatchId) ;
   AQuery.Open ;

   BIsLastYear := VarToSTR(OpenSqlAndGetFirtsColumnValue('Select BLASTYEAR from transact where WTRANSACTIONID=' + IntToStr(AQuery.fieldbyName('WTRANSACTIONID').AsInteger))) = '1' ;
   AProgress.InitSubProgress('Updating lineid',AQuery.RecordCount);
        if not AQuery.IsEmpty then
         begin
           LineOffset := batchcount+1 ;
            while not AQuery.eof do
             begin
             LedgerRoutines.UnlinkLine(AQuery.fieldByNAme('WTransactionID').AsInteger,BatchCtrlID);
               DMTCCoreLink.ExecSql('update transact set wlineid = wlineid + '+IntTOStr(batchcount+1)+',WLINKEDID = WLINKEDID + '+IntTOStr(batchcount+1)+' where WTransactionid = '+   AQuery.fieldByNAme('WTransactionID').AsString);
               AProgress.SetSubProgress(AQuery.RecNo);
               AQuery.Next ;
             end;
        end;
       AProgress.SSubbar.Visible := false;
 
             dmDatabase.BatchType :=  BatchTypeIdFromBatchConId(StrToInt(BatchId)) ;
            // find out batch name :
            ABatchTableName := OpenBatch(GetBatchTypeName(dmDatabase.BatchType),BatchCtrlID,false);
             AQuery.sql.text := 'select Wlineid from ' + ABatchTableName ;
               AQuery.Open ;
             if not AQuery.IsEmpty then
              begin
              if not DoNoAskAgain then
              AModalResult  := OSFMessageDlg('Batch '+TDataBaseRoutines.GetBatchNameById(dmDatabase.BatchType)  +' has records delete them and continue ? ',mtConfirmation,[mbyes,mbno,mbAll],0) ;

              case AModalResult of
                mrno : exit ;
                mrAll : DoNoAskAgain := True ;
               end;
               while not AQuery.eof do
             begin
               AProgress.SetSubProgress(AQuery.RecNo);
              AQuery.Next ;
             end;
             end;
            DMTCCoreLink.ExecSql('Delete from ' + TempTableName);
            BatchControlInToId := BatchCtrlID ;
            // Look if theres a maxline
            dmDatabase.qGen.sql.text := 'select max(wlineId) + 1 from ' + dmDatabase.tblBatch.TableName ;
            dmDatabase.qGen.open ;
            MaxLineId := dmDatabase.qGen.Fields[0].AsString ;
            if MaxLineId = '' then MaxLineId := '1'  ;
            // start transaction from here
            // Put the data back in to the batch
            dmDatabase.qGen.close ;
            dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatch'),[ABatchTableName,MaxLineId,MaxLineId,BatchId]);
             dmDatabase.qGen.ExecSQL ;
           // If cashbook then update the taxlines
           if BIsBAnkBAtch then
             begin
               dmDatabase.qGen.SQL.text := format('update  %s set ftaxamount =  (famount / 100 ) * (select FRate + IIF(Abs(famount) <100 ,0.01,0)  from tax where tax.WAccountid = wtaxid)  ' +
                                                  ' where   Wlineid = wlinkedid and BExclusive = 0 and WTaxid <> 0 and ftaxamount = 0',[ABatchTableName]);
               dmDatabase.qGen.ExecSQL ;
               dmDatabase.qGen.SQL.text := format('update  %s set famount =   cast( (( (coalesce(FDebit,0) - coalesce(FCredit,0))  +  ftaxamount) ) as numeric(12,2) ) '+
               ' where   Wlineid = wlinkedid and BExclusive = 0 and WTaxid <> 0 ',[ABatchTableName]);
               dmDatabase.qGen.ExecSQL ;
             end;
            // reverse post code seperation for transact assigning tempname from here
            ABatchTableName := TempTableName ;
             dmDatabase.CreateBatch(ABatchTableName) ;
              if TDataBaseRoutines.TableExist(ABatchTableName) then
              begin
                 dmDatabase.qGen.sql.text := 'select max(wlineId) + 1 from ' + ABatchTableName ;
                 dmDatabase.qGen.open ;
                 MaxLineId := dmDatabase.qGen.Fields[0].AsString ;
                 if MaxLineId = '' then MaxLineId := '1'  ;
                 try
                dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatchContraPost'),[ABatchTableName,MaxLineId,MaxLineId,BatchId]);
                dmDatabase.qGen.ExecSQL ;
                   except
              dmDatabase.qGen.SQL.text := 'SELECT  WLINEID, SREFERENCE, DDATE,SDESCRIPTION, WACCOUNTID, SACCOUNT,WCONTRAACCOUNTID, SCONTRAACCOUNT, WTAXID,STAX, -FAMOUNT, -FDEBIT, -FCREDIT,-FTAXAMOUNT, DALLOCATEDDATE, BEXCLUSIVE, '+
              ' WLINKEDID , WREPORTINGGROUP1ID, WREPORTINGGROUP2ID FROM V_TRANSACTASBATCHWITHTRANSID where WBatchId = ' + dmDatabase.qGenII.FieldByName('WBatchID').AsString ;
              dmDatabase.qGen.open ;
              dmDatabase.tblBatch.TableName := ABatchTableName ;
              dmDatabase.tblBatch.Open ;
              while not dmDatabase.qGen.Eof do
                 begin
                  dmDatabase.tblBatch.insert ;
                  dmDatabase.tblBatchSREFERENCE.Value := dmDatabase.qGen.Fields[1].AsString ;
                  dmDatabase.tblBatchDDATE.Value := dmDatabase.qGen.Fields[2].AsDateTime ;
                  dmDatabase.tblBatchSDESCRIPTION.Value := dmDatabase.qGen.Fields[3].AsString ;
                  dmDatabase.tblBatchWACCOUNTID.Value := dmDatabase.qGen.Fields[4].AsInteger ;
                  dmDatabase.tblBatchSACCOUNT.Value := dmDatabase.qGen.Fields[5].AsString ;
                  dmDatabase.tblBatchWCONTRAACCOUNTID.Value := dmDatabase.qGen.Fields[6].AsInteger ;
                  dmDatabase.tblBatchSCONTRAACCOUNT.Value := dmDatabase.qGen.Fields[7].AsString ;
                  dmDatabase.tblBatchWTAXID.Value := dmDatabase.qGen.Fields[8].AsInteger ;
                  dmDatabase.tblBatchSTAX.Value := dmDatabase.qGen.Fields[9].AsString ;
                  dmDatabase.tblBatchFAMOUNT.Value := dmDatabase.qGen.Fields[10].AsFloat ;
                  dmDatabase.tblBatchFDebit.Value := dmDatabase.qGen.Fields[11].AsFloat ;
                  dmDatabase.tblBatchFCREDIT.Value := dmDatabase.qGen.Fields[12].AsFloat ;
                  dmDatabase.tblBatchFTAXAMOUNT.Value := dmDatabase.qGen.Fields[13].AsFloat ;
                  dmDatabase.tblBatchDALLOCATEDDATE.Value := dmDatabase.qGen.Fields[14].AsDateTime ;
                  dmDatabase.tblBatchBEXCLUSIVE.Value := dmDatabase.qGen.Fields[15].AsInteger ;
                  dmDatabase.tblBatchWREPORTINGGROUP1ID.Value := dmDatabase.qGen.Fields[17].AsInteger ;
                  dmDatabase.tblBatchWREPORTINGGROUP2ID.Value := dmDatabase.qGen.Fields[18].AsInteger ;
                  dmDatabase.tblBatch.Post ;
                  dmDatabase.qGen.next ;
                 end;
                end;
                dmDatabase.tblBatch.TableName := ABatchTableName ;
                dmDatabase.tblBatch.open ;
                ADmCoreDataBatch.ZQBatchControl.sql.text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl');
                ADmCoreDataBatch.ZQBatchControl.Open;
                BatchCtrlID := ADmCoreDataBatch.AppendBatchControlId(CurrentUser,CurrentUser,dmDatabase.BatchType,0,0);
                ADmCoreDataBatch.ZQBatchControl.Close;
                PostBatch(true,true,true,  BIsLastYear);
                dmDatabase.tblBatch.close ;
                // delete batch data
                dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' + InTToStr(BatchCtrlID) ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + InTToStr(BatchCtrlID) ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' + BatchId ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + InTToStr(BatchControlInToId) ;
                dmDatabase.qGen.ExecSQL ;
              end;
         end;
    dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + BatchId ;
    dmDatabase.qGen.ExecSQL ;
    ABatchTableName := OpenBatch(GetBatchTypeName(dmDatabase.BatchType),BatchCtrlID,false);
                // reverse linkes
                LinkesQuery.first ;
                      dmDatabase.ZQOILinks.SQL.Text := 'Select OILinks.*,Messages.* from OILinks  join transact ' +
                       ' on OILinks.WAmountTransactionID = transact.WtransactionID left join messages on ' +
                    '  (transact.WDescriptionId = Messages.WMessageId) where  ' +
                      '(OILinks.WBatchID=' + IntToStr(0)+')' ;
                 dmDatabase.ZQOILinks.open;
                 inc(LineOffset) ;
                while not LinkesQuery.eof do
                   begin
                      dmDatabase.ZQOILinks.insert ;
                       for x := 1 to LinkesQuery.FieldCount-1 do
                         if dmDatabase.ZQOILinks.FindField(LinkesQuery.Fields[x].FieldName) <> nil then
                            begin
                              dmDatabase.ZQOILinks.FindField(LinkesQuery.Fields[x].FieldName).Value := LinkesQuery.Fields[x].Value ;
                            end;
                        dmDatabase.ZQOILinksUnUsed1.Value :=-2;
                        dmDatabase.ZQOILinksWUserID.Value := CurrentUser;
                        dmDatabase.ZQOILinksWBatchID.value := BatchCtrlID;
                        dmDatabase.ZQOILinksWLinkTransactionID.Value := LineOffset + LinkesQuery.fieldByName('WLINEID').AsInteger  ;
                        dmDatabase.ZQOILinks.post ;
                        try
                        DMTCCoreLink.ExecSql('INSERT INTO oilinkspre (WBATCHID, WLINEID, WBATCHTYPEID, WTRANSACTIONID, FAMOUNT) '+

                        '  VALUES ('+IntToStr(BatchCtrlID)+', '+IntToStr(LineOffset + LinkesQuery.fieldByName('WLINEID').AsInteger)+', '+IntToStr(dmDatabase.BatchType)+
                        ', '+IntToStr(dmDatabase.ZQOILinksWAMOUNTTRANSACTIONID.AsInteger)+', '+TDatabaseTableRoutines.GetFirebirdsSqlForFloat(dmDatabase.ZQOILinksWLINKEDAMOUNT.AsFloat) +')') ;
                       DMTCCoreLink.ExecSql('update ' + ABatchTableName + ' set BLINKED = 1 where wlineid = ' + IntToStr(LineOffset + LinkesQuery.fieldByName('WLINEID').AsInteger)) ;
                       except
                       end;
                       LinkesQuery.next ;
                   end;


         DMTCCoreLink.LogAction('REVBATC',BatchCtrlID,'Reverse batch!');
 

  end;
 // update next id.
 dmDatabase.qGen.SQL.Text := 'select max(WBatchID) + 1 from batcon ' ;
 dmDatabase.qGen.Open ;
 i := dmDatabase.qGen.Fields[0].AsInteger ;
 if i < 0 then i := 1 ;

 dmDatabase.qGen.Close ;
 dmDatabase.qGen.SQL.Text := 'SET GENERATOR GEN_BATCHID TO  ' + inttostr(i) ;
 dmDatabase.qGen.ExecSQL ;

  dmDatabase.ZMainconnection.Commit ;
 finally
     AQuery.free ;
     LinkesQuery.free ;
   if dmDatabase.ZMainconnection.InTransaction then
      dmDatabase.ZMainconnection.Rollback ;
   BDeleteBatch.Enabled := true ;
   BDocuments.Enabled := true ;

   QBatCon.Close ;
   QBatCon.Open ;
  cxbatchesDBTableView1.DataController.DataSource := DSBatcon ;
 end;
 except
    on E : Exception do
      ShowMessage(E.Message);
 end;
 finally
  AProgress.CloseProgress ;
  AProgress.Free ;
 end;
 finally
   ADmCoreDataBatch.free ;
 end;

end;

procedure TFormReverseBatch.BRecalcTotalsClick(Sender: TObject);
var
 TotalCount, i,Periods : Integer ;
  LastAccount : Integer ;
  aProgress : TfmNewProgress ;
  ASingleAccount,PErCount : Integer ;
begin
 aProgress := TfmNewProgress.create(nil) ;

 try
 aProgress.initProgress(gettextlang(1997),0);
 // make sure all periods exsist in Totals table
 QAccounts.SQL.text := 'Select WAccountid,WPeriodID,0 WAccountTypeid from Transact group by WAccountid,WPeriodID ' ;
 QAccounts.Open ;
 aProgress.initProgress(gettextlang(1997),QAccounts.RecordCount);
 while not QAccounts.Eof do
   begin
      aProgress.SetProgress('',QAccounts.RecNo);
      TDataBaseRoutines.CheckCreateTotalsEntry(QAccountsWaccountId.AsInteger,QAccountsWperiodId.AsInteger);
      QAccounts.next ;
   end;

 for i := -1 to 26 do
 begin
  TDataBaseRoutines.CheckCreateTotalsEntry(dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings,i);
  TDataBaseRoutines.CheckCreateTotalsEntry(dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount,i);
  TDataBaseRoutines.CheckCreateTotalsEntry(dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount,i);
 end;

 // create periods for all main accounts
 QAccounts.SQL.text := 'Select WAccountid,0 WPeriodid,WAccountTypeid from Account where BSubAccounts = 1 ' ;
 QAccounts.Open ;
 aProgress.initProgress(gettextlang(1997),QAccounts.RecordCount);
 while not QAccounts.Eof do
   begin
     aProgress.SetProgress('',QAccounts.RecNo);

       for i := -1 to 26 do
         begin
          TDataBaseRoutines.CheckCreateTotalsEntry(QAccountsWaccountId.AsInteger,i);
         end;
      QAccounts.next ;
   end;
 QAccounts.close ;


 // create period -1 and 0 all accounts
 QAccounts.SQL.text := 'Select WAccountid,0 WPeriodid , WAccountTypeid  from Account '  ;
 QAccounts.Open ;
 aProgress.initProgress(gettextlang(1997),QAccounts.RecordCount);
 while not QAccounts.Eof do
   begin
     aProgress.SetProgress('',QAccounts.RecNo);
      for i := -1 to 0 do
         begin
          TDataBaseRoutines.CheckCreateTotalsEntry(QAccountsWaccountId.AsInteger,i);
         end;
       if (QAccountsWAccountTypeid.AsInteger in [0,3,4]) then
          TDataBaseRoutines.CheckCreateBugetsEntry(QAccountsWaccountId.AsInteger,0);
      QAccounts.next ;
   end;
 QAccounts.close ;


 aProgress.initProgress(gettextlang(1997),0);
 dmDatabase.tblTotals.Open ;
 dmDatabase.tblAccount.Open ;
 dmDatabase.tblAccount.filtered := false ;
 dmDatabase.tblSysVars.Open ;
 QAccounts.SQL.Text:= 'Select WAccountID,0 WPeriodId ,WAccountTypeid from account';
 ASingleAccount := TDataBaseRoutines.GetAccountIDFromCode(EFindId.Text) ;
 if  ASingleAccount > 0 then
   QAccounts.SQL.Add(' and WAccountid = ' +IntToStr(ASingleAccount)) ;

 QAccounts.open ;

 dmDatabase.tblTotals.Filter := 'BActual = 1' ;
 dmDatabase.tblTotals.Filtered := true ;
 aProgress.InitProgress('',QAccounts.RecordCount);
 TotalCount := -1 ;
 LastAccount := - 1 ;
 dmDatabase.qGen.SQL.Text := 'update Totals set FAmount = 0 where bactual = 1';
 if ASingleAccount > 0 then
    dmDatabase.qGen.sql.Add(' and WAccountid = ' +IntToStr(ASingleAccount)) ;

 dmDatabase.qGen.ExecSQL ;



dmDatabase.qGen.SQL.Text := 'SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account  JOIN transact ' +
' ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  not in(1,2) AND  cast(transact.ddate as date) <= :Date1 '+ #13+#10 +
' and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0  ) and (account.Bsubaccounts = 0 or account.Bsubaccounts is null) and (account.WAccountId <> '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) +' ) GROUP BY account.WAccountId union SELECT '+ IntToStr(DMTCCoreLink.DebtorsControlAccountid) +', SUM( transact.FAmount ) total  '+ #13+#10 +
' FROM account  JOIN transact    ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 1 AND  cast(transact.ddate as date) <= :Date2 '+ #13+#10 +
' union SELECT '+ IntToStr(DMTCCoreLink.CreditorsControlAccountid) +', SUM( transact.FAmount ) total FROM account  JOIN transact    ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 2 AND  '+ #13+#10 +
' cast(transact.ddate as date) <=   :Date3 union SELECT '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) +', SUM( -transact.FAmount ) total FROM account  JOIN transact ON (account.WAccountId = transact.WAccountId ) '+ #13+#10 +
' WHERE  cast(transact.ddate as date) <=   :Date4 and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 ) and account.WAccountId <> '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) + #13+#10 +
' union SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account join account linked on (account.WAccountID = linked.wLINKACCOUNT ) JOIN transact ' + #13+#10 +
'  ON  (linked.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  not in(1,2) AND  cast(transact.ddate as date) <= :Date5  '+ #13+#10 +
' and (account.BINCOMEEXPENSE is null or account.BINCOMEEXPENSE = 0  ) and account.Bsubaccounts = 1 GROUP BY account.WAccountId union '+
' SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account  JOIN transact ' +
' ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  in(1,2) AND  cast(transact.ddate as date) <= :Date6  GROUP BY account.WAccountId ' ;

 dmDatabase.qGen.ParamByName('Date1').AsDate := TDataBaseRoutines.GetPeriodStartDate(1) -1 ;
 dmDatabase.qGen.ParamByName('Date2').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date3').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date4').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date5').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date6').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;

 // openings balans of lastyear
 dmDatabase.qGen.open ;
 dmDatabase.qGenII.SQL.Text := 'update totals set totals.FAmount = :amt where totals.Wperiodid = -1 and totals.Bactual = 1 and totals.Waccountid = :Acc' ;

 while not dmDatabase.qGen.eof do
   begin
     dmDatabase.qGenII.params[0].AsFloat :=    dmDatabase.qGen.fields[1].AsFloat ;
     dmDatabase.qGenII.params[1].AsInteger :=    dmDatabase.qGen.fields[0].AsInteger ;
     dmDatabase.qGenII.ExecSQL ;
     dmDatabase.qGen.next ;
   end;
 dmDatabase.qGen.close ;
 dmDatabase.qGen.ParamByName('Date1').AsDate := TDataBaseRoutines.GetPeriodStartDate(14) -1 ;
 dmDatabase.qGen.ParamByName('Date2').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date3').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date4').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date5').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date6').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 // openings balans of this year
 dmDatabase.qGen.open ;
 dmDatabase.qGenII.SQL.Text := 'update totals set totals.FAmount = :amt where totals.Wperiodid = 0 and totals.Bactual = 1 and totals.Waccountid = :Acc' ;

 while not dmDatabase.qGen.eof do
   begin
     dmDatabase.qGenII.params[0].AsFloat :=    dmDatabase.qGen.fields[1].AsFloat ;
     dmDatabase.qGenII.params[1].AsInteger :=    dmDatabase.qGen.fields[0].AsInteger ;
     dmDatabase.qGenII.ExecSQL ;
     dmDatabase.qGen.next ;
   end;

 PerCount :=  TDataBaseRoutines.GetPeriodCount ;

 while not QAccounts.eof do
    begin
      if LastAccount <> QAccountsWAccountID.AsInteger then
       begin
          dmDatabase.tblAccount.filter := '' ;
          if not dmDatabase.tblAccount.Locate('WAccountID',QAccountsWAccountID.AsInteger,[]) then
           begin
            // account should always exist maby a assert here ?
            Assert(true,'Account not found');
           end;
          LastAccount := dmDatabase.tblAccountWAccountID.AsInteger ;
       end;
       if ASingleAccount > 0 then
           if  LastAccount <> ASingleAccount then
           if (dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount <> LastAccount) and
              (dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount <> LastAccount) and
              (dmDatabase.SetOfBooksPropertys.CompanyInfo.RetaintEarnings <> LastAccount) then
             Continue ;


       for Periods := 1 to 26 do
       begin
       // total
       if  Periods < 14 then
         begin
          if  Periods > PerCount then
              continue ;
         end else
         begin
           if (Periods -13) > PerCount then
              continue ;
         end;
       dmDatabase.zqTotals.SQl.Text := 'Select * from totals where WAccountId = :WAccountId and '
                                      +'WPeriodId = :WPeriodId and BActual =:BActual and WYearId in (1,2)' ;
       dmDatabase.zqTotals.ParamByName('WAccountId').AsInteger := LastAccount ;
       dmDatabase.zqTotals.ParamByName('BActual').AsInteger :=    1 ;
       dmDatabase.zqTotals.ParamByName('WPeriodId').AsInteger :=  Periods ;



       dmDatabase.zqTotals.Open ;

       if not dmDatabase.zqTotals.IsEmpty then
          begin
          dmDatabase.zqTotals.Edit ;
          end
          else
          begin
             dmDatabase.zqTotals.Insert ;
             dmDatabase.zqTotalsWAccountID.AsInteger := LastAccount ;
             dmDatabase.zqTotalsWPeriodID.AsInteger := Periods ;
             dmDatabase.ZQTotalsWYEARID.AsInteger := 1 ;
             if Periods > 13 then
             dmDatabase.ZQTotalsWYEARID.AsInteger := 2 ;
             dmDatabase.zqTotalsBActual.AsInteger := 1 ;
          end;

       // if this is a main account or has subaccounts then
      if  (dmDatabase.tblAccountBSubAccounts.AsInteger = 1) or

             (dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount = LastAccount) or
             (dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount = LastAccount)
              then
                begin
                  if //(dmDatabase.tblSysVarsWRetainedIncomeID.AsInteger = LastAccount) or
                     (dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount = LastAccount) or
                     (dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount = LastAccount) then
                   begin

                     dmDatabase.zqTotalsFAmount.AsFloat :=TDataBaseRoutines.GetBalansBetween(LastAccount,TDataBaseRoutines.GetPeriodStartDate(Periods),TDataBaseRoutines.GetPeriodEndDate(Periods))  ;

                   end else
                   begin
                    // subaccounts
                    dmDatabase.qGen.close ;
                    dmDatabase.qGen.SQL.Text := 'select Waccountid from account where account.WLINKACCOUNT =' + QAccountsWaccountId.AsString ;
                    dmDatabase.qGen.Open ;
                    dmDatabase.zqTotalsFAmount.AsFloat := 0 ;
                    while not dmDatabase.qGen.eof do
                      begin
                        dmDatabase.zqTotalsFAmount.AsFloat := dmDatabase.zqTotalsFAmount.AsFloat + TDataBaseRoutines.GetBalansBetween(dmDatabase.qGen.fields[0].AsInteger ,TDataBaseRoutines.GetPeriodStartDate(Periods),TDataBaseRoutines.GetPeriodEndDate(Periods))  ;
                        dmDatabase.qGen.next ;
                      end;
                    dmDatabase.qGen.close ;
                   end;
                end else
                begin
                   dmDatabase.zqTotalsFAmount.AsFloat :=TDataBaseRoutines.GetBalansBetween(LastAccount,TDataBaseRoutines.GetPeriodStartDate(Periods),TDataBaseRoutines.GetPeriodEndDate(Periods))  ;
                end;
      dmDatabase.zqTotals.Post ;
      end;
      dmDatabase.zqTotals.Close ;
      QAccounts.next ;
      aProgress.SetProgress('',totalcount);
      Application.ProcessMessages ;
      inc(TotalCount);
    end;   // end QAccounts.eof


 
   dmDatabase.qGen.SQL.Text := 'delete from totals where totals.FAmount = 0 and BActual = 1 and totals.wPeriodid not in (-1,0) ' ;
   dmDatabase.qGen.ExecSQL ;

  finally
     aProgress.CloseProgress ;
     aProgress.Free ;
  end;
end;

procedure TFormReverseBatch.BDocumentsClick(Sender: TObject);
 var
   Head,Log,BatchId,ABatchTableName : String ;
   i : Integer ;
   Selected : Array of string ;
   TotalCost : Double ;
  ADmCoreDataBatch : TDMCoreData ;
  AProgress : TfmNewProgress ;

begin
 // get the temp reverse batch name
 ABatchTableName := 'POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser) ;
 dmDatabase.CreateBatch(ABatchTableName) ;
 DMTCCoreLink.ExecSql('Delete from ' + ABatchTableName);
 
 ADmCoreDataBatch := TDMCoreData.create(nil) ;
 try
 if sender <> nil then
  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;
 AProgress := TfmNewProgress.create(nil) ;
 try
 dmDatabase.ZMainconnection.StartTransaction ;

 dmDatabase.tblStock.open;

     setlength(Selected,cxdocumentsDBTableView1.Controller.SelectedRecordCount);
     for i := 0 to cxdocumentsDBTableView1.Controller.SelectedRecordCount -1 do
       begin
          cxdocumentsDBTableView1.Controller.SelectedRecords[i].Focused := True ;
          Selected[i] := tblDocHeaderWDocID.AsString ;
       end;

  AProgress.initProgress('',high(Selected));

  BDeleteBatch.Enabled := false ;
  BDocuments.Enabled := false ;
  try
  for i:= low(Selected) to high(Selected) do
  begin

 
       DMTCCoreLink.LogAction('REVDOC',BatchCtrlID,'Reverse doc!');
 

  AProgress.SetProgress('',i);
  tblDocHeader.Locate('WDocID',Selected[i],[]) ;
 // save batch
  BatchId := tblDocHeaderWDocID.AsString ;
  dmDatabase.qGenII.close ;
  dmDatabase.qGenII.SQL.Text := 'select * from batcon where wdocid =' + BatchId;
  dmDatabase.qGenII.open ;
  while not  dmDatabase.qGenII.Eof do
  begin
 //reverse stock trans
    qGenMast.SQL.Text := 'select * from StockTrn where WDocId=' +BatchId ;
          QGenMast.open ;

          while not QGenMast.Eof do
            begin
            //   dmDatabase.tblStock.Filtered := False ;
            dmDatabase.tblStock.close ;
               dmDatabase.tblStock.FilterSQL := 'WStockID=' + IntToStr(QGenMast.FieldByName('WStockID').AsInteger);
               dmDatabase.tblStock.open ;
           //    dmDatabase.tblStock.Filtered := true ;
               If not dmDatabase.tblStock.IsEmpty then
                 begin
                    dmDatabase.tblStock.edit ;
                    TotalCost := dmDatabase.tblStockFQtyOnHand.AsFloat * dmDatabase.tblStockFUnitAveCost.AsFloat ;
                    if (tblDocHeaderWTypeID.AsInteger in [10,13]) then
                     begin
                     if not(dmDatabase.tblStockWSTOCKTYPEID.AsInteger in[1,8]) then
                      begin
                         dmDatabase.tblStockFQtyOnHand.AsFloat := dmDatabase.tblStockFQtyOnHand.AsFloat - QGenMast.FieldByName('FQty').AsFloat ;
                     // if dmDatabase.tblStockFQtyOnHand.AsFloat <> 0 then
                     //    dmDatabase.tblStockFUnitAveCost.AsFloat := (TotalCost - (QGenMast.FieldByName('FQty').AsFloat*QGenMast.FieldByName('FCostPrice').AsFloat)) / dmDatabase.tblStockFQtyOnHand.AsFloat ;
                      end;
                    end else
                     begin
                      begin
                       if not(dmDatabase.tblStockWSTOCKTYPEID.AsInteger in[1,8]) then
                          dmDatabase.tblStockFQtyOnHand.AsFloat := dmDatabase.tblStockFQtyOnHand.AsFloat - QGenMast.FieldByName('FQty').AsFloat ;
                      // if dmDatabase.tblStockFQtyOnHand.AsFloat <> 0 then
                      //    dmDatabase.tblStockFUnitAveCost.AsFloat := (TotalCost - (QGenMast.FieldByName('FQty').AsFloat*QGenMast.FieldByName('FSellingPrice').AsFloat)) / dmDatabase.tblStockFQtyOnHand.AsFloat ;
                      end;
                     end;

                  //  if dmDatabase.tblStockFQtyOnHand.AsFloat = 0 then
                     //  dmDatabase.tblStockFUnitAveCost.AsFloat := 0 ;
                    dmDatabase.tblStock.Post ;
                 end;
               QGenMast.Next ;
            end;
          QGenMast.close ;
          QGenMast.SQL.Text := 'Delete from StockTrn where WDocId=' +BatchId ;
          QGenMast.ExecSQL ;


    // unlink lines
    dmDatabase.qGen.SQL.Text := 'Select * from transact where WBatchID=' +dmDatabase.qGenII.FieldByName('WBatchID').AsString ;

    dmDatabase.qGen.Open ;
     while not dmDatabase.qGen.Eof do
       begin
          UnlinkTransaction(dmDatabase.qGen.fieldByname('WTransactionID').AsInteger);
          dmDatabase.qGen.next ;
       end ;


    dmDatabase.qGenII.next ;
  end;


  dmDatabase.qGenII.close ;
  dmDatabase.qGenII.SQL.Text := 'select * from batcon where wdocid =' + BatchId;
  dmDatabase.qGenII.open ;
  while not  dmDatabase.qGenII.Eof do
  begin
 //delete batches
 // reverse
 // reverse post

    dmDatabase.BatchType :=  dmDatabase.qGenII.fieldByName('WBATCHTYPEID').AsInteger ;
    try
    dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatchContraPost'),[ABatchTableName,'999','999',dmDatabase.qGenII.FieldByName('WBatchID').AsString]);
    dmDatabase.qGen.ExecSQL ;
    except
    dmDatabase.qGen.SQL.text := 'SELECT  WLINEID, SREFERENCE, DDATE,SDESCRIPTION, WACCOUNTID, SACCOUNT,WCONTRAACCOUNTID, SCONTRAACCOUNT, WTAXID,STAX, -FAMOUNT, -FDEBIT, -FCREDIT,-FTAXAMOUNT, DALLOCATEDDATE, BEXCLUSIVE, '+
    ' WLINKEDID , WREPORTINGGROUP1ID, WREPORTINGGROUP2ID FROM V_TRANSACTASBATCHWITHTRANSID where WBatchId = ' + dmDatabase.qGenII.FieldByName('WBatchID').AsString ;
    dmDatabase.qGen.open ;
    dmDatabase.tblBatch.TableName := ABatchTableName ;
    dmDatabase.tblBatch.Open ;
    while not dmDatabase.qGen.Eof do
       begin
        dmDatabase.tblBatch.insert ;
        dmDatabase.tblBatchSREFERENCE.Value := dmDatabase.qGen.Fields[1].AsString ;
        dmDatabase.tblBatchDDATE.Value := dmDatabase.qGen.Fields[2].AsDateTime ;
        dmDatabase.tblBatchSDESCRIPTION.Value := dmDatabase.qGen.Fields[3].AsString ;
        dmDatabase.tblBatchWACCOUNTID.Value := dmDatabase.qGen.Fields[4].AsInteger ;
        dmDatabase.tblBatchSACCOUNT.Value := dmDatabase.qGen.Fields[5].AsString ;
        dmDatabase.tblBatchWCONTRAACCOUNTID.Value := dmDatabase.qGen.Fields[6].AsInteger ;
        dmDatabase.tblBatchSCONTRAACCOUNT.Value := dmDatabase.qGen.Fields[7].AsString ;
        dmDatabase.tblBatchWTAXID.Value := dmDatabase.qGen.Fields[8].AsInteger ;
        dmDatabase.tblBatchSTAX.Value := dmDatabase.qGen.Fields[9].AsString ;
        dmDatabase.tblBatchFAMOUNT.Value := dmDatabase.qGen.Fields[10].AsFloat ;
        dmDatabase.tblBatchFDebit.Value := dmDatabase.qGen.Fields[11].AsFloat ;
        dmDatabase.tblBatchFCREDIT.Value := dmDatabase.qGen.Fields[12].AsFloat ;
        dmDatabase.tblBatchFTAXAMOUNT.Value := dmDatabase.qGen.Fields[13].AsFloat ;
        dmDatabase.tblBatchDALLOCATEDDATE.Value := dmDatabase.qGen.Fields[14].AsDateTime ;
        dmDatabase.tblBatchBEXCLUSIVE.Value := dmDatabase.qGen.Fields[15].AsInteger ;
       // dmDatabase.tblBatchWLINKEDID.Value := dmDatabase.qGen.Fields[16].Value ;
        dmDatabase.tblBatchWREPORTINGGROUP1ID.Value := dmDatabase.qGen.Fields[17].AsInteger ;
        dmDatabase.tblBatchWREPORTINGGROUP2ID.Value := dmDatabase.qGen.Fields[18].AsInteger ;
        dmDatabase.tblBatch.Post ;
        dmDatabase.qGen.next ;


       end;


      // Unique key failuer
    end;
    dmDatabase.tblBatch.TableName := ABatchTableName ;
    dmDatabase.tblBatch.open ;
    ADmCoreDataBatch.ZQBatchControl.sql.text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl');
    ADmCoreDataBatch.ZQBatchControl.Open;
    BatchCtrlID := ADmCoreDataBatch.AppendBatchControlId(CurrentUser,CurrentUser,dmDatabase.BatchType,0,0);
    ADmCoreDataBatch.ZQBatchControl.Close;
    PostBatch(true,true);
    dmDatabase.tblBatch.close ;
    dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' +dmDatabase.qGenII.FieldByName('WBatchID').AsString ;
    dmDatabase.qGen.ExecSQL ;
    dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' +IntToSTr(BatchCtrlID) ;
    dmDatabase.qGen.ExecSQL ;
    dmDatabase.qGenII.next ;
  end;
  tblDocHeader.Edit ;
  tblDocHeaderBPosted.AsInteger := 0 ;
  tblDocHeaderWOPENITEMTRANSACTID.Clear ;
  tblDocHeader.post ;
    if  (tblDocHeaderWTYPEID.AsInteger in [18, 19] ) then
      begin
         TDataBaseRoutines.ExecSql('Delete from docline where Wdocid ='  + IntToStr(tblDocHeaderWDOCID.AsInteger) ) ;
         TDataBaseRoutines.ExecSql('Delete from dochead where Wdocid ='  + IntToStr(tblDocHeaderWDOCID.AsInteger) ) ;
      end;
  end;





  dmDatabase.ZMainconnection.Commit ;
 finally
   if dmDatabase.ZMainconnection.InTransaction then
    dmDatabase.ZMainconnection.Rollback ;
    
   BDeleteBatch.Enabled := true ;
   BDocuments.Enabled := true ;
   dmDatabase.tblStock.FilterSQL := '' ;
   dmDatabase.tblStock.close;

 end;
 finally
  AProgress.CloseProgress ;
  AProgress.Free ;
 end;
 finally
   ADmCoreDataBatch.free ;
 end;
 if sender <> nil then
 begin
 tblDocHeader.close;
 PageControl1Change(self);
 Application.ProcessMessages;
 end;
// DMTCCoreLink.ExecSql('drop table ' +ABatchTableName) ;
end;

procedure TFormReverseBatch.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Cancel');

Caption := GetTextLang(2084);
TSBatches.Caption := GetTextLang(298);
TSDocuments.Caption := GetTextLang(38);
TSDetails.Caption := GetTextLang(930);
Detail1.Caption := GetTextLang(930);
cxbatchesDBTableView1SAlias.Caption  := GetTextLang(2085);
cxbatchesDBTableView1dsysdate.Caption  := GetTextLang(238);
cxbatchesDBTableView1linecount.Caption  := GetTextLang(2088);

cxbatchesDBTableView1wdocid.Caption  := GetTextLang(3430 );
cxbatchesDBTableView1MINDATE.Caption  := GetTextLang(238 ) + ' -';
cxbatchesDBTableView1MAXDATE.Caption  := GetTextLang(238 ) + ' +';

cxdocumentsDBTableView1SDOCNO.Caption  := GetTextLang(2089);
cxdocumentsDBTableView1DDATE.Caption  := GetTextLang(238);
cxdocumentsDBTableView1SREFERENCE.Caption  := GetTextLang(607);

BDeleteBatch.Caption  := GetTextLang(2086);
BDocuments.Caption  := GetTextLang(2087);
CBNoDocPostsClick(self);
//DBGrid1TitleClick(DBGrid1.Columns[0]);



cxDetailsDBTableView1WLINEID.Caption  := GetTextLang(592{line});
cxDetailsDBTableView1SREFERENCE.Caption  := GetTextLang(1719{Reference});
cxDetailsDBTableView1DDATE.Caption  := GetTextLang(1973{date});
cxDetailsDBTableView1SDESCRIPTION.Caption  := GetTextLang(1708{Description});
cxDetailsDBTableView1SACCOUNT.Caption  := GetTextLang(1876{account});
cxDetailsDBTableView1SCONTRAACCOUNT.Caption  := GetTextLang(2929{ContraAccount});
cxDetailsDBTableView1STAX.Caption  := GetTextLang(1863{TAX});
cxDetailsDBTableView1FDEBIT.Caption  := GetTextLang(211{debit});
cxDetailsDBTableView1FCREDIT.Caption  := GetTextLang(212{credit});
cxDetailsDBTableView1FAMOUNT.Caption  := GetTextLang(627{amount enterd});
cxDetailsDBTableView1FTAXAMOUNT.Caption  := GetTextLang(1138{tax amount});
cxDetailsDBTableView1BEXCLUSIVE.Caption  := GetTextLang(1136{Amount Exclusive});


Label1.Caption  := GetTextLang(2089);
BSelectFromList.Caption  := GetTextLang(2972);
CBNoDocPosts.Caption  := GetTextLang(2992);
if gotodocid <>0 then
  begin
     TSDocuments.TabVisible := False ;
     TSBatches.TabVisible := False ;
     TSDetails.TabVisible := False ;
     PageControl1.ActivePage := TSDetails ;
   QDetails.Close ;
   QDetails.sql.text := 'select V_TRANSACTASBATCHWITHTRANSID.* from V_TRANSACTASBATCHWITHTRANSID join batcon on (V_TRANSACTASBATCHWITHTRANSID.WBatchId = batcon.WBatchId) where V_TRANSACTASBATCHWITHTRANSID.wdocid =  :Param1 and batcon.WDocId =  :Param1' ;
   QDetails.Params[0].AsInteger :=  gotodocid ;
   QDetails.Open ;
  end else
if   gototransactid <>0 then
  begin
     TSDocuments.TabVisible := False ;
     TSBatches.TabVisible := False ;
     TSDetails.TabVisible := False ;
     PageControl1.ActivePage := TSDetails ;
     QDetails.Close ;
     QDetails.sql.text := 'select * from V_TRANSACTASBATCHWITHTRANSID where WBatchId =  :Param1' ;
     QDetails.Params[0].AsInteger := TDataBaseLedgerRoutines.GetBatchidFromTransactId(gototransactid);
     QDetails.Open ;
     QDetails.Locate('WTRANSACTIONID',gototransactid,[]) ;
  end ;




Report1.Caption := DMTCCoreLink.GetTextLangNoAmp( 1754);
Detail1.Caption := DMTCCoreLink.GetTextLangNoAmp(  930);
end;

procedure TFormReverseBatch.PageControl1Change(Sender: TObject);
begin
  QDetails.Close ;
  TSDetails.TabVisible := false ;
  if PageControl1.ActivePage = TSDocuments  then
    begin
      if not tblDocHeader.Active then
      begin
        tblDocHeader.sql.Text := 'select * from dochead where BPosted = 1 and WTypeid not in (14,15)' ;
        tblDocHeader.Open ;
      end;
    end;
end;

procedure TFormReverseBatch.DBGrid1DblClick(Sender: TObject);
begin

   TSDetails.TabVisible := true ;
   PageControl1.ActivePage := TSDetails ;
   QDetails.tag := 0 ;
   QDetails.Close ;
   QDetails.sql.text := 'select * from V_TRANSACTASBATCHWITHTRANSID where WBatchId =  :Param1' ;
   QDetails.Params[0].AsInteger := QBatConWBatchID.AsInteger ;
   QDetails.Open ;

end;

procedure TFormReverseBatch.Report1Click(Sender: TObject);

begin
  CheckReportMan(0,0,1,0,'BATCHID=' + QBatConWBatchId.AsString,'postedbatch','GENERAL') ;

end;

procedure TFormReverseBatch.EFindIdChange(Sender: TObject);
begin
 QBatCon.Locate('WBatchId',EFindId.Text,[])
end;

procedure TFormReverseBatch.EFindIdDblClick(Sender: TObject);
begin
Button1.Visible := true ;
Button2.Visible := true ;
BReDoAll.Visible := true ;
end;

procedure TFormReverseBatch.EFindDocNoChange(Sender: TObject);
begin
 tblDocHeader.Locate('SDocNo',EFindDocNo.Text,[loCaseInsensitive, loPartialKey]) ;
end;

procedure TFormReverseBatch.BSelectFromListClick(Sender: TObject);

begin
 Memo1.Visible := true ;
 Memo1.BringToFront ;
 BUndook.Visible := true ;
 BUndook.BringToFront ;
end;

procedure TFormReverseBatch.DBGrid2DblClick(Sender: TObject);
begin
   TSDetails.TabVisible := true ;
   PageControl1.ActivePage := TSDetails ;
   QDetails.tag := 1 ;
   QDetails.Close ;
   QDetails.sql.text := 'select V_TRANSACTASBATCHWITHTRANSID.* from V_TRANSACTASBATCHWITHTRANSID join batcon on (V_TRANSACTASBATCHWITHTRANSID.WBatchId = batcon.WBatchId) where V_TRANSACTASBATCHWITHTRANSID.wdocid =  :Param1 and batcon.WDocId =  :Param1' ;
   QDetails.Params[0].AsInteger :=  tblDocHeaderWDOCID.AsInteger ;
   QDetails.Open ;

end;

procedure TFormReverseBatch.DBGrid2TitleClick(Column: TColumn);
begin
 

if tblDocHeader.Active then
  if tblDocHeader.IndexFieldNames <> Column.FieldName then
    begin
     tblDocHeader.IndexFieldNames := Column.FieldName ;
    end else
    begin
      tblDocHeader.IndexFieldNames := Column.FieldName +' desc'; 
    end;


end;

procedure TFormReverseBatch.BReDoAllClick(Sender: TObject);
 var
   Head,Log,BatchId,ABatchTableName,TempTableName,MaxLineId,LastDoc : String ;
   Selected : Array of string ;
   SelectedDocs : Array of string ;
   ClearResetStock : Boolean ;
   i,TransId,NewBatID,OldBatch,BatchControlInToId,ContraId,ResultBatch  : Integer ;
   ADmCoreDataBatch : TDMCoreData ;
   AProgress : TfmNewProgress ;

begin
 LastDoc := '' ;
 ADmCoreDataBatch := TDMCoreData.create(nil) ;
 try
 {if  QBatConwdocid.AsInteger <> 0 then
  If ( OSFMessageDlg('You are going to reverse a document posting Do you want to continue?', mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ; }

  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;

  If ( OSFMessageDlg(DMTCCoreLink.GetTextLang(3081){'Reset stock?'}, mtinformation, [mbYes,mbNo], 0)=mrYes) then
     ClearResetStock := true else ClearResetStock := false ;

 if EFindId.Text <> '' then
  If ( OSFMessageDlg('Process from id '+EFindId.Text+' for logica batcon.WBatchId >= '  + EFindId.Text +'? (or abort and change the id field)', mtinformation, [mbYes,mbNo], 0)<>mrYes) then
    exit ;

 qGen.SQL.Text := 'update transact  set  WLineid = WTRANSACTIONID '+
 '  where WBatchID in (select max(b.WBatchId)  from transact b ' +
 ' group by b.WBatchID,b.WLineID having count(b.WLineId) > 1) ' ;

 If not dmDatabase.SetOfBooksPropertys.DataParameter.cbContraISRef then
 begin
 qGen.ExecSQL ;
 qGen.SQL.Text := 'update transact  set  WLinkedId =  Wlineid where (WLinkedId <> Wlineid or WLinkedId is null) and Sreference <> ' + QuotedStr('********') ;
 qGen.ExecSQL ;
 qGen.SQL.Text := 'update transact  set  WLinkedId =  -1 where (WLinkedId is null) and Sreference = ' + QuotedStr('********') ;
 qGen.ExecSQL ;
 end;
 qGen.SQL.Text := 'update transact set FTaxAmount = -FTaxAmount where (FTaxAmount > 0 and FAmount < 0 ) or  (FTaxAmount < 0 and FAmount > 0 )' ;
 qGen.ExecSQL ;
 tblDocHeader.sql.Text := 'select * from dochead where BPosted = 1' ;
 tblDocHeader.Open ;

 if  EFindId.Text <> '' then
 QBatCon.SQL.Text := Format(DMTCCoreLink.SQLList.GetFormatedSQLByName('ReverseBatch_SelectBatcon'),[' and batcon.WBatchId >=' +EFindId.Text +' ','1'])
 else
 QBatCon.SQL.Text := Format(DMTCCoreLink.SQLList.GetFormatedSQLByName('ReverseBatch_SelectBatcon'),['','1']);
 QBatCon.open ;
AProgress := TfmNewProgress.create(nil) ;
try
try
  BDeleteBatch.Enabled := false ;
  BDocuments.Enabled := false ;
  QBatCon.First ;
  setlength(Selected,QBatCon.RecordCount);
  setlength(SelectedDocs,QBatCon.RecordCount);
 // save batch
 AProgress.initProgress('Preparing docs',QBatCon.RecordCount);
 if QBatCon.RecordCount <>0 then
   begin
     i := 0 ;
     while not QBatCon.Eof do
       begin
          Selected[i] := QBatConWBatchID.AsString ;
          if QBatConwdocid.AsInteger <> 0 then
            begin
               SelectedDocs[i] := QBatConwdocid.AsString ;
            end;
          inc(i);
          AProgress.SetProgress('Preparing docs',i);
          QBatCon.Next ;
       end;
   end ;
  cxbatchesDBTableView1.DataController.DataSource := nil ;
   try
  AProgress.initProgress('Reversing docs',high(Selected));
  AProgress.Left := 100 ;
  AProgress.Top := 100 ;
  // reverse all docs
    for i := High (Selected) downto low(Selected) do
   begin
      if (LastDoc <> SelectedDocs[i]) and (SelectedDocs[i] <> '') then
       begin
          LastDoc := SelectedDocs[i] ;
           if tblDocHeader.Locate('WDOCID',SelectedDocs[i],[]) then
             begin
                BDocumentsClick(nil);
             end;
       end;
      AProgress.SetProgress('Reversing docs',i);
   end;
  AProgress.initProgress('',high(Selected));
  // Clear reset stock
  if ClearResetStock then
    begin
        qGen.SQL.Text := 'Delete from stocktrn'  ;
        qGen.ExecSQL ;
        qGen.SQL.Text := 'Delete from dochead where WTypeID = 16' ;
        qGen.ExecSQL ;
        qGen.SQL.Text := 'update Stock set FQtyOnHand = 0' ;
        qGen.ExecSQL ;
    end;
 // update next id where doing them all so low -1 we will start with
 dmDatabase.qGen.SQL.Text := 'select max(WBatchID)  from batcon ' ;
 dmDatabase.qGen.Open ;
 i := dmDatabase.qGen.Fields[0].AsInteger  + 1;
 if i < 10000 then i := 10000 ;

 dmDatabase.qGen.Close ;
 dmDatabase.qGen.SQL.Text := 'SET GENERATOR GEN_BATCHID TO ' + inttostr(i) ;
 dmDatabase.qGen.ExecSQL ;

  // temp table name
  TempTableName := 'DELME_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)+'_'+ FormatFloat('00000000',Random(99999999)) ;
    while TDataBaseRoutines.TableExist(TempTableName) do
         TempTableName:= 'DELME_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)+'_'+ FormatFloat('00000000',Random(99999999)) ;


  LastDoc := '' ;
  for i := low (Selected) to high(Selected) do
  begin
  AProgress.SetProgress('',i);
  BatchId := Selected[i] ;
    try
  if SelectedDocs[i] = '' then
  begin
   QDetails.Close ;
   QDetails.sql.text := 'select * from V_TRANSACTASBATCHWITHTRANSID where WBatchId =  :Param1' ;
   QDetails.Params[0].AsInteger := StrToInt(BatchId) ;
   QDetails.Open ;
        if not QDetails.IsEmpty then
         begin
            while not QDetails.eof do
             begin
              UnlinkTransaction(QDetailsWTransactionID.AsInteger);
              QDetails.Next ;
             end;
            dmDatabase.BatchType :=  BatchTypeIdFromBatchConId(StrToInt(BatchId)) ;
            // find out batch name :
            ABatchTableName := OpenBatch(GetBatchTypeName(dmDatabase.BatchType),BatchCtrlID,false);

            BatchControlInToId := BatchCtrlID ;
            // Look if theres a maxline
            dmDatabase.qGen.sql.text := 'select max(wlineId) + 1 from ' + dmDatabase.tblBatch.TableName ;
            dmDatabase.qGen.open ;
            MaxLineId := dmDatabase.qGen.Fields[0].AsString ;
            if MaxLineId = '' then
                MaxLineId := '0' ;
            // Put the data back in to the batch
            dmDatabase.qGen.close ;
            dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatch'),[ABatchTableName,MaxLineId,MaxLineId,BatchId]);
            dmDatabase.qGen.ExecSQL ;
            // reverse post code seperation for transact assigning tempname from here
            ABatchTableName := TempTableName ;
            dmDatabase.CreateBatch(ABatchTableName) ;
            dmDatabase.qGen.SQL.text := format(DMTCCoreLink.SQLList.GetFormatedSQLByName('transact_reversToBatchContraPost'),[ABatchTableName,'999','999',BatchId]);
            dmDatabase.qGen.ExecSQL ;
            dmDatabase.tblBatch.TableName := ABatchTableName ;
            dmDatabase.tblBatch.open ;
            ADmCoreDataBatch.ZQBatchControl.sql.text := DMTCCoreLink.SQLList.GetFormatedSQLByName('DMCoreData_SelectEmptyBatchControl');
            ADmCoreDataBatch.ZQBatchControl.Open;
            BatchCtrlID := ADmCoreDataBatch.AppendBatchControlId(CurrentUser,CurrentUser,dmDatabase.BatchType,0,0);
            ADmCoreDataBatch.ZQBatchControl.Close;
            ResultBatch := PostBatch(true,true) ;
             if ResultBatch = 0 then
                begin
                dmDatabase.tblBatch.close ;
                // delete batch data
                dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' + InTToStr(BatchCtrlID) ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + InTToStr(BatchCtrlID) ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' + BatchId ;
                dmDatabase.qGen.ExecSQL ;
                dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + InTToStr(BatchControlInToId) ;
                dmDatabase.qGen.ExecSQL ;
                end else showmessage('Error processing ' + Selected[i] + #13+#10+ GetErrMsg(ResultBatch) ) ;
            //
         end;
    dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + BatchId ;
    dmDatabase.qGen.ExecSQL ;
    ABatchTableName := OpenBatch(GetBatchTypeName(dmDatabase.BatchType),BatchCtrlID,false);
    dmDatabase.qGen.SQL.text := 'select WCONTRAACCOUNTID from battypes where WBATCHTYPEID =' + IntToStr(dmDatabase.BatchType) ;
    dmDatabase.qGen.open;
    ContraId := dmDatabase.qGen.fields[0].AsInteger ;
    dmDatabase.qGen.close ;
    // if its cash or bank remove tax and contras

   if OpenSqlAndGetFirtsColumnValue('Select BCashbook from Battypes where WbatchTypeid=' + inttostr(dmDatabase.BatchType)) then
     begin
        ExecSql('Delete from ' + ABatchTableName +' where WaccountId in (select WAccountId from account where WACCOUNTTYPEID in (3,4))') ;
     end;

    LrBalanceBatch(dmdatabase.TblBatch.Tablename,ADmCoreDataBatch,dmDatabase.BatchType,ContraId);
    ShowErrMsg(PostBatch(true,true)) ;
    end else // Doc batch
    begin
      if LastDoc <> SelectedDocs[i] then
        begin
          LastDoc := SelectedDocs[i] ;
           if tblDocHeader.Locate('WDOCID',SelectedDocs[i],[]) then
             begin
               ConvertDocumentToBatch(TransId,StrToInt(SelectedDocs[i]),true)
             end;
        end;
    end;
    except
     on e : Exception do
      begin
       showmessage('Error processing batchid=' + Selected[i] + ' docid=' + SelectedDocs[i] +#13+#10+e.Message);
       exit ;
      end; 
    end;
  end;
 // DMTCCoreLink.ExecSql('drop table ' +ABatchTableName) ;
 finally
   BDeleteBatch.Enabled := true ;
   BDocuments.Enabled := true ;

   QBatCon.Close ;
   QBatCon.Open ;
   cxbatchesDBTableView1.DataController.DataSource := DSBatcon ;
 end;
 except
    on E : Exception do
      ShowMessage(E.Message);
 end;
 finally
  AProgress.CloseProgress ;
  AProgress.Free ;
 end;
 finally
   ADmCoreDataBatch.free ;
 end;

end;
procedure TFormReverseBatch.Button2Click(Sender: TObject);
var
 TotalCount : Integer ;
  LastAccount : Integer ;
  aProgress : TfmNewProgress ;
begin
 aProgress := TfmNewProgress.create(nil) ;

 try
 aProgress.initProgress(gettextlang(1997),0);

  dmDatabase.qGen.SQL.Text := 'update Totals set FAmount = 0 where bactual = 1 and Wperiodid in (-1,0)';
  dmDatabase.qGen.ExecSQL ;
 dmDatabase.qGen.SQL.Text := 'SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account  JOIN transact ' +
' ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  not in(1,2) AND  cast(transact.ddate as date) <= :Date1 '+ #13+#10 +
' and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0  ) and (account.Bsubaccounts = 0 or account.Bsubaccounts is null) and (account.WAccountId <> '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) +' ) GROUP BY account.WAccountId union SELECT '+ IntToStr(DMTCCoreLink.DebtorsControlAccountid) +', SUM( transact.FAmount ) total  '+ #13+#10 +
' FROM account  JOIN transact    ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 1 AND  cast(transact.ddate as date) <= :Date2 '+ #13+#10 +
' union SELECT '+ IntToStr(DMTCCoreLink.CreditorsControlAccountid) +', SUM( transact.FAmount ) total FROM account  JOIN transact    ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  = 2 AND  '+ #13+#10 +
' cast(transact.ddate as date) <=   :Date3 union SELECT '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) +', SUM( -transact.FAmount ) total FROM account  JOIN transact ON (account.WAccountId = transact.WAccountId ) '+ #13+#10 +
' WHERE  cast(transact.ddate as date) <=   :Date4 and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 ) and account.WAccountId <> '+ IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid) + #13+#10 +
' union SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account join account linked on (account.WAccountID = linked.wLINKACCOUNT ) JOIN transact ' + #13+#10 +
'  ON  (linked.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  not in(1,2) AND  cast(transact.ddate as date) <= :Date5  '+ #13+#10 +
' and (account.BINCOMEEXPENSE is null or account.BINCOMEEXPENSE = 0  ) and account.Bsubaccounts = 1 GROUP BY account.WAccountId union '+
' SELECT account.WAccountId, SUM( transact.FAmount ) total FROM account  JOIN transact ' +
' ON  (account.WAccountId = transact.WAccountId ) WHERE  account.WAccountTypeID  in(1,2) AND  cast(transact.ddate as date) <= :Date6  GROUP BY account.WAccountId ' ;

 dmDatabase.qGen.ParamByName('Date1').AsDate := TDataBaseRoutines.GetPeriodStartDate(1) -1 ;
 dmDatabase.qGen.ParamByName('Date2').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date3').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date4').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date5').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date6').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;

 // openings balans of lastyear
 dmDatabase.qGen.open ;
 dmDatabase.qGenII.SQL.Text := 'update totals set totals.FAmount = :amt where totals.Wperiodid = -1 and totals.Bactual = 1 and totals.Waccountid = :Acc' ;
 aProgress.initProgress(gettextlang(1997) ,dmDatabase.qGen.recordcount );
 while not dmDatabase.qGen.eof do
   begin
     aProgress.SetProgress('',dmDatabase.qGen.RecNo);
     dmDatabase.qGenII.params[0].AsFloat :=    dmDatabase.qGen.fields[1].AsFloat ;
     dmDatabase.qGenII.params[1].AsInteger :=    dmDatabase.qGen.fields[0].AsInteger ;
     dmDatabase.qGenII.ExecSQL ;
     dmDatabase.qGen.next ;
   end;
 dmDatabase.qGen.close ;
 dmDatabase.qGen.ParamByName('Date1').AsDate := TDataBaseRoutines.GetPeriodStartDate(14) -1 ;
 dmDatabase.qGen.ParamByName('Date2').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date3').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date4').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date5').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;
 dmDatabase.qGen.ParamByName('Date6').AsDate := dmDatabase.qGen.ParamByName('Date1').AsDate ;

 // openings balans of this year
 dmDatabase.qGen.open ;
 dmDatabase.qGenII.SQL.Text := 'update totals set totals.FAmount = :amt where totals.Wperiodid = 0 and totals.Bactual = 1 and totals.Waccountid = :Acc' ;
 aProgress.initProgress(gettextlang(1997) ,dmDatabase.qGen.recordcount );
 while not dmDatabase.qGen.eof do
   begin
     aProgress.SetProgress('',dmDatabase.qGen.RecNo);
     dmDatabase.qGenII.params[0].AsFloat :=    dmDatabase.qGen.fields[1].AsFloat ;
     dmDatabase.qGenII.params[1].AsInteger :=    dmDatabase.qGen.fields[0].AsInteger ;
     dmDatabase.qGenII.ExecSQL ;
     dmDatabase.qGen.next ;
   end;

  finally
     aProgress.CloseProgress ;
     aProgress.Free ;
  end;
end;

procedure TFormReverseBatch.BUndookClick(Sender: TObject);
var
 AList : TStringList ;
 i ,x: Integer ;
begin
 Memo1.Visible := False;
 BUndook.Visible := False ;

 if Memo1.Lines.Text <> '' then
   begin
     AList := TStringList.create ;
     try
      // cxbatchesDBTableView1.OptionsSelection.UnselectFocusedRecordOnExit := False ;
       AList.Text := Memo1.Lines.Text;
           FOR I:= 0 TO AList.Count -1 DO
             BEGIN
                AList[i] := Trim(AList[i]);
             END;
          for x := 0 to cxdocumentsDBTableView1.ViewData.RecordCount -1 do
            begin
               if AList.IndexOf(cxdocumentsDBTableView1.ViewData.Records[x].Values[cxdocumentsDBTableView1SDOCNO.Index]) <> -1 then
                 begin
                    cxdocumentsDBTableView1.ViewData.Records[x].Selected := True ;

                 end;
            end;

     finally
       AList.free ;

     end;
   end;
end;

procedure TFormReverseBatch.reverseYearClick(Sender: TObject);
var

 ADate : TDateTime ;
 NumOfYears : Integer ;
begin

  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;

  NumOfYears := StrToIntDef(InputBox('Num of year?','Number of years to delete','1'),0);
  if NumOfYears < 1 then exit ;

 fmPeriods := TfmPeriods.create(nil) ;
  try
     fmPeriods.ShowModal ;
     Application.ProcessMessages ;
     fmPeriods.LoadPeriods ;
     fmPeriods.dtStartDate.Enabled := True;
     ADate := fmPeriods.dtStartDate.DateTime ;
     if NumOfYears > 1 then
        ADate := IncMonth(ADate,- (12*(NumOfYears-1)));
     DMTCCoreLink.ExecSql('delete from transact where DDate >= cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd',ADate)) +' as date)');
     DMTCCoreLink.ExecSql('update dochead set bposted = 0 where ddate >= cast('+ QuotedStr(FormatDateTime('yyyy/mm/dd',ADate)) +' as date)');
     ADate := fmPeriods.dtStartDate.DateTime ;
     fmPeriods.dtStartDate.DateTime := IncMonth(ADate,- (12*NumOfYears));

     try
     fmPeriods.dtStartDateExit(self);
     fmPeriods.btnOkClick(self);
     except
       on e:Exception do
         ShowMessage(e.Message);
     end;
     DMTCCoreLink.ExecSql('delete from PERIODS where Wyearid not in (1,2)');
     ADate := IncMonth(ADate,- ((12*NumOfYears)+ 12));
     dmDatabase.qGen.SQL.Text := 'INSERT INTO PERIODS (WYEARID, WPERIODID, DSTARTDATE, DENDDATE, ' +
     'SDESCRIPTION, BSHUTDOWN, BCONTAINSTRANSACTIONS)  '+
     ' VALUES ( 0, -1, cast('  + QuotedStr('1900/01/01') +' as date) , cast('  + QuotedStr(FormatDateTime('yyyy/mm/dd',ADate-1)) +' as date), ' + QuotedStr('Lastyears') + ', 0, 0 )' ;

     dmDatabase.qGen.ExecSQL ;
     DMTCCoreLink.ExecSql('update transact set WPeriodid = (select WPeriodId from Periods where (transact.DDate <= periods.DEndDate and  transact.DDate >= periods.DStartDate))' +
                   ' where 1 = (select count(WPeriodId) from Periods where (transact.DDate <= periods.DEndDate and  transact.DDate >= periods.DStartDate))') ;

     DMTCCoreLink.ExecSql('update transact set WYearid = (select WYearID from Periods where (transact.DDate <= periods.DEndDate and  transact.DDate >= periods.DStartDate))' +
                   ' where 1 = (select count(WYearID) from Periods where (transact.DDate <= periods.DEndDate and  transact.DDate >= periods.DStartDate))') ;


     BRecalcTotalsClick(self);


  finally
    FreeAndNil( fmPeriods);
  end;
end;

procedure TFormReverseBatch.POkbuttonDblClick(Sender: TObject);
begin
 if Button1.Visible then
   begin
    reverseYear.Visible := true ;
    Bhardremove.Visible := True ;
   end;
end;

procedure TFormReverseBatch.bPrintdetailsClick(Sender: TObject);
begin
 if gotodocid <> 0 then
 begin
     CheckReportMan(0,0,1,0,'BATCHID=' + IntToStr(TDataBaseLedgerRoutines.GetBatchidFromDocId(gotodocid)),'postedbatch','GENERAL') ;
 end else
 if gototransactid <> 0 then
 begin
     CheckReportMan(0,0,1,0,'BATCHID=' + IntToStr(TDataBaseLedgerRoutines.GetBatchidFromTransactId(gototransactid)),'postedbatch','GENERAL') ;
 end else
 if QDetails.Tag = 1 then
 begin
    CheckReportMan(0,0,1,0,'BATCHID=' + IntToStr(TDataBaseLedgerRoutines.GetBatchidFromDocId(tblDocHeaderWDOCID.AsInteger)),'postedbatch','GENERAL') ;
 end else
   CheckReportMan(0,0,1,0,'BATCHID=' + QBatConWBatchId.AsString,'postedbatch','GENERAL') ;
end;

procedure TFormReverseBatch.BhardremoveClick(Sender: TObject);
 var
   Head,Log,BatchId : String ;
   Selected : Array of string ;
   i : Integer ;
  ADmCoreDataBatch : TDMCoreData ;
  AProgress : TfmNewProgress ;
  AQuery : TuniQuery ;
  begin



 ADmCoreDataBatch := TDMCoreData.create(nil) ;
 try
 if  QBatConwdocid.AsInteger <> 0 then
  If ( OSFMessageDlg('You are going to reverse a document posting Do you want to continue?', mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;

  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;
AProgress := TfmNewProgress.create(nil) ;
try
  AProgress.initProgress('Start reverse...',1);
try
  dmDatabase.ZMainconnection.StartTransaction ;

  BDeleteBatch.Enabled := false ;
  BDocuments.Enabled := false ;

 // save batch

     setlength(Selected,cxbatchesDBTableView1.Controller.SelectedRecordCount);
     for i := 0 to cxbatchesDBTableView1.Controller.SelectedRecordCount -1 do
       begin
          cxbatchesDBTableView1.Controller.SelectedRecords[i].Focused := True ;
          Selected[i] := QBatConWBatchID.AsString ;
       end;

  cxbatchesDBTableView1.DataController.DataSource := nil ;
  AQuery := TuniQuery.Create(self) ;
   try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AProgress.initProgress('',high(Selected));
  for i := low (Selected) to high(Selected) do
  begin
  Randomize ;
  AProgress.SetProgress('',i);
  BatchId := Selected[i] ;
 { Head := ApplicationPath + 'tempBatchExp.txf' ;
  Log :=  ApplicationPath + 'tempBatchExp.log' ;
  ExportXmlTransact(StrToIntDef(BatchId,0),StrToIntDef(BatchId,0),-1,Head,Log,4);  }
   AQuery.Close ;
   AQuery.sql.text := 'select * from TRANSACT where WBatchId =  :Param1' ;
   AQuery.Params[0].AsInteger := StrToInt(BatchId) ;
   AQuery.Open ;
        if not AQuery.IsEmpty then
         begin
            while not AQuery.eof do
             begin
              UnlinkTransaction(AQuery.fieldByNAme('WTransactionID').AsInteger);
              AQuery.Next ;
             end;
     // delete batch data
       dmDatabase.qGen.SQL.Text := 'Delete from transact where WBatchID=' + BatchId ;
       dmDatabase.qGen.ExecSQL ;
       dmDatabase.qGen.SQL.Text := 'Delete from batcon where WBatchID=' + BatchId ;
       dmDatabase.qGen.ExecSQL ;
       DMTCCoreLink.LogAction('REVBATC',StrTOInt(BatchId),'Reverse batch!');
  end;
 end;
 // update next id.
 dmDatabase.qGen.SQL.Text := 'select max(WBatchID) + 1 from batcon ' ;
 dmDatabase.qGen.Open ;
 i := dmDatabase.qGen.Fields[0].AsInteger ;
 if i < 0 then i := 1 ;

 dmDatabase.qGen.Close ;
 dmDatabase.qGen.SQL.Text := 'SET GENERATOR GEN_BATCHID TO  ' + inttostr(i) ;
 dmDatabase.qGen.ExecSQL ;

  dmDatabase.ZMainconnection.Commit ;
 finally
   AQuery.free ;
   if dmDatabase.ZMainconnection.InTransaction then
      dmDatabase.ZMainconnection.Rollback ;
   BDeleteBatch.Enabled := true ;
   BDocuments.Enabled := true ;

   QBatCon.Close ;
   QBatCon.Open ;
   cxbatchesDBTableView1.DataController.DataSource := DSBatcon ;
 end;
 except
    on E : Exception do
      ShowMessage(E.Message);
 end;
 finally
  AProgress.CloseProgress ;
  AProgress.Free ;
 end;
 finally
   ADmCoreDataBatch.free ;
 end;

end;

procedure TFormReverseBatch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if (gotodocid = 0) and(gototransactid =0) then
   if PageControl1.ActivePage = TSDetails then
   begin
      CanClose := False ;
      PageControl1.ActivePageIndex := QDetails.Tag ;


   end;

end;

procedure TFormReverseBatch.CBNoDocPostsClick(Sender: TObject);
begin
   if CBNoDocPosts.Checked then
   QBatCon.SQL.Text := Format(DMTCCoreLink.SQLList.GetFormatedSQLByName('ReverseBatch_SelectBatcon'),[' and (batcon.wdocid = 0 or batcon.wdocid is null) ' + BatchListAndClause,  ' WBatchId desc'])
   else
  QBatCon.SQL.Text := Format(DMTCCoreLink.SQLList.GetFormatedSQLByName('ReverseBatch_SelectBatcon'),[BatchListAndClause, ' WBatchId desc']);
  QBatCon.open ;
end;

end.
