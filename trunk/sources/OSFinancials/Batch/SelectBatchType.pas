(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SelectBatchType;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB,ExtCtrls,   Buttons,
  TcVariables, Menus , UPluginsSharedUnit,
   DBAccess , Uni, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
 twf_TfmSelectBatchType  = class (TWorkFlowImplementBase)
  public
      LastDoctype : Integer  ;
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;
  TfmSelectBatchType = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOpen: TBitBtn;
    DataSource1: TDataSource;
    BatchPopup: TPopupMenu;
    Balance1: TMenuItem;
    Delete1: TMenuItem;
    Alias1: TMenuItem;
    Import1: TMenuItem;
    Export1: TMenuItem;
    Switch1: TMenuItem;
    PostedBatchesimport1: TMenuItem;
    Post1: TMenuItem;
    Edit1: TMenuItem;
    Deletebalance1: TMenuItem;
    N1: TMenuItem;
    Trailbalance1: TMenuItem;
    LAlias: TLabel;
    Orderondate1: TMenuItem;
    Print1: TMenuItem;
    qryBatchTypesList: TuniQuery;
    qryBatchTypesListWBATCHTYPEID: TIntegerField;
    qryBatchTypesListBCASHBOOK: TSmallintField;
    qryBatchTypesListSDESCRIPTION: TStringField;
    qryBatchTypesListWCONTRAACCOUNTID: TIntegerField;
    qryBatchTypesListBCONTRAPERLINE: TSmallintField;
    qryBatchTypesListDSYSDATE: TDateTimeField;
    qryBatchTypesListSCONTRANAME: TStringField;
    qryBatchTypesListWACCOUNTID: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WBATCHTYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1BCASHBOOK: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1WCONTRAACCOUNTID: TcxGridDBColumn;
    cxGrid1DBTableView1BCONTRAPERLINE: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1SCONTRANAME: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GeneralPopupmenuClick(Sender: TObject);
    procedure Trailbalance1Click(Sender: TObject);
    procedure FormDoClose(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    FLedgerCalculationClass: TLedgerCalculationClass;
    procedure SetLedgerCalculationClass(
      const Value: TLedgerCalculationClass);

    { Private declarations }
  public
       aLook,ALoadFile : String;
     FirstTimeShow : Boolean ;
     InWorkFlow : Boolean ;
     ReturnForm : TForm ;
     property  LedgerCalculationClass : TLedgerCalculationClass  read FLedgerCalculationClass write SetLedgerCalculationClass;

    { Public declarations }
  end;

var
  fmSelectBatchType: TfmSelectBatchType;

implementation

uses Main,  BatchEntry, HtmlHelpAPI, GlobalFunctions,
  LanguageChoice, DatabaseAccess, LedgerRoutines,  BatchEntryBank,
  ReconOptions, OSFGeneralRoutines, UDMTCCoreLink, UAccountTreeView,
  Database, UDmQuantumGridDefs;

{$R *.DFM}
{ twf_TfmBatchEntryBank }

constructor twf_TfmSelectBatchType.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'batch-entry';
  Description := 'Batch entry screen select the batch you want to open for the parameter batch id.' ;
  with Inparams.Add as TParam do
     begin
        Name := 'BATCHID' ;
        DataType := ftinteger ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;

end;

procedure twf_TfmSelectBatchType.WorkflowEnd(AForm: TForm);
begin
  inherited;
  FreeAndNil(fmSelectBatchType);
  idDocType := LastDoctype;
end;

function twf_TfmSelectBatchType.WorkFlowStart: TForm;

begin
  result := nil ;
  LastDoctype :=idDocType ;
  dmDatabase.CalledFromBatch:=True;
  IsRepeatingBat:=False;
  fmSelectBatchType := TfmSelectBatchType.Create(Application);
  try
  SetUpForm(fmSelectBatchType);
   fmSelectBatchType.Parent := Parent ;
   fmSelectBatchType.InWorkFlow := True ;
   fmSelectBatchType.Show;
   if  fmSelectBatchType.qryBatchTypesList.Locate('WBATCHTYPEID',Inparams.paramByNAme('BATCHID').AsInteger,[]) then
      fmSelectBatchType.BtnOpenClick(self);
    if Assigned(fmSelectBatchType.ReturnForm) then
    begin
     result := fmSelectBatchType.ReturnForm ;

              result.BorderStyle := bsnone ;
               result.Parent := self.Parent ;
               result.Show ;
              result.Top := 0 ;
              result.Left := 0 ;
              if self.Parent <> nil then
              begin
               result.Width := self.Parent.Width - 1  ;
               result.Height := self.Parent.Height -1 ;
              end;
    end;
  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;
    
  except
  FreeAndNil(fmSelectBatchType);
  end;

end;

procedure TfmSelectBatchType.FormShow(Sender: TObject);
begin
  // PRefent reload on hide show
  if FirstTimeShow then exit ;
  FirstTimeShow := true ;

 DMTCCoreLink.LoadImage(BtnOpen.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  TDatabaseRegistyRoutines.ReadFormPos(Self,'');
   cxGrid1DBTableView1.RestoreFromRegistry('Software\osfinancials\selectbatch\cols1',false);


  aLook:='';

  dmDatabase.tblBatchTypes.Open;

  QryBatchTypesList.sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('SelectBatTypes_BatchList');
  {  'Select WBatchTypeID,BCashBook,BatTypes.SDescription, '+
  ' WContraAccountID, BContraPerLine,DSysDate,(Account.SACCOUNTCODE+'' ''+Account.SDescription) AS SContraName, '+
  ' WAccountID From BatTypes left Join Account ON WContraAccountID=WAccountID ';}

{ if not ReadReportOp('CBViewAllBankState',true).AsBoolean then
    begin
      dmDatabase.QryBatchTypesList.sql.Text := 'Select WBatchTypeID,BCashBook,BatTypes.SDescription, '+
      ' WContraAccountID, BContraPerLine,DSysDate,(Account.SACCOUNTCODE+'' ''+Account.SDescription) AS SContraName, '+
      ' WAccountID From BatTypes left Join Account ON WContraAccountID=WAccountID where (Account.WAccountTypeID <> 3 or Account.WAccountTypeID is null)';
    end;  }

  QryBatchTypesList.Open;



//  wwDBGrid1.SizeFirstColumn;
  cxGrid1.SetFocus;
  // done :Pieter tranlations
  cxGrid1DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(1867) ;
  cxGrid1DBTableView1SCONTRANAME.Caption := DMTCCoreLink.GetTextLang(1868) ;
  cxGrid1DBTableView1WCONTRAACCOUNTID.Caption := DMTCCoreLink.GetTextLang(211) +' / ' + DMTCCoreLink.GetTextLang(212) +' ' + DMTCCoreLink.GetTextLang(962);;



     cxGrid1DBTableView1WCONTRAACCOUNTID.Visible := not IsRepeatingBat ;
  if not dmDatabase.SetOfBooksPropertys.DataParameter.CBNoCalcBatch then
  ReadLedgerObjectFromBatches(FLedgerCalculationClass ,True);

    Post1.Caption :=  GetTextLang(616) ;
    Balance1.Caption :=  GetTextLang(611) ;
    Delete1.Caption :=  GetTextLang(613) ;
    Alias1.Caption :=  GetTextLang(1756) ;
    Import1.Caption :=  GetTextLang(612) ;
    Export1.Caption :=  GetTextLang(619) ;
    Switch1.Caption :=  GetTextLang(1757) ;
    PostedBatchesimport1.Caption := GetTextLang(1758) ;
    Edit1.Caption := GetTextLang(121) ;
    Deletebalance1.Caption :=  GetTextLang(173) + ' ' + GetTextLang(1361) ;
    Trailbalance1.Caption :=  GetTextLang(1021)  ;
    Print1.Caption :=  GetTextLang(52)  ;
   // Batchreport1.Caption := GetTextLang(961) + ' ' + GetTextLang(55)  ;
    Orderondate1.Caption := GetTextLang(2024) ;
end;

procedure TfmSelectBatchType.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelectBatchType.BtnOpenClick(Sender: TObject);
Var
  lastResult,LastId,LastBatchTypeId,LastDocType  : Integer ;
begin
 LastDocType := idDocType ;
 try
  if  (qryBatchTypesListBCASHBOOK.AsInteger = 1) and (not ReadReportOp('CBViewAllBankState',false).AsBoolean) then
  begin
    idDocType:=1;
    self.visible := false  ;
    fmReconOptions := TfmReconOptions.Create(self);
    try
      fmReconOptions.goToAccount :=  qryBatchTypesListWCONTRAACCOUNTID.AsInteger ;

      //fmReconOptions.Parent := self ;
      //fmReconOptions.Align := alclient ;
      if InWorkFlow then
      begin
       fmReconOptions.inWorkFlow := InWorkFlow ;
       fmReconOptions.WorkflowParent := self.Parent ;
       fmReconOptions.ButtonPanel.Align := altop ;
       fmReconOptions.TopPnl.Visible := fALSE ;
       fmReconOptions.BRecon.Left := 10 ;
       fmReconOptions.BtnOk.Left := 10 + fmReconOptions.BRecon.Left + fmReconOptions.BRecon.Width;
       fmReconOptions.BtnCancel.Left := 10 + fmReconOptions.BtnOk.Left + fmReconOptions.BtnOk.Width;


       ReturnForm := fmReconOptions ;
       Exit ;
       end else
      fmReconOptions.ShowModal;
    finally
    if not InWorkFlow then
    FreeAndNil(fmReconOptions);
    self.visible := true  ;
    end;
  end
  else
  begin
  lastresult := 5 ;
  dmDatabase.tblBatchTypes.open ;
  LastBatchTypeId := qryBatchTypesListWbatchtypeID.Value   ;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID',LastBatchTypeId,[]);
  if (dmDatabase.tblBatchTypesWBatchTypeID.AsString='') or
     (dmDatabase.tblBatchTypesSDescription.AsString='') then
     exit;

  if CanUserBatch(CurrentUser,qryBatchTypesList.FieldByName('WBatchTypeID').AsInteger) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
    Exit;
  end;
  dmDatabase.tblBatch.close;
  // done : pieter Batc conrol out of sinc ??
  // Theres reports from digian about the abriviation

  BatchCtrlID := GetBatchCtrlID(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger) ;
  LastId := BatchCtrlID ;
  // So you dont need to hide this form bacth it gave strange problems.
  self.Visible := false;
  try
  while LAstResult = 5 do
  begin
  BatchCtrlID := lastid ;

  IF (not ReadReportOp('CBViewAllBankState',false).AsBoolean) and (dmDatabase.tblBatchTypesBCashBook.AsInteger =1) then
  begin
  fmBatchEntryBank   := TfmBatchEntryBank.Create(self);
  try

    if IsRepeatingBat then
    begin
      fmBatchEntryBank.Caption :='*** '+ dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName:= OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,True);
    end
    else
    begin
      fmBatchEntryBank.Caption := dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
    end;
  BatchNameFName := dmDatabase.tblBatch.TableName;
  dmDatabase.tblBatch.Close;
   if InWorkFlow then
      begin
       ReturnForm := fmBatchEntryBank ;
       Exit ;
       end else
    lastresult := fmBatchEntryBank.ShowModal;
  finally
   if not InWorkFlow then
  FreeAndNil(fmBatchEntryBank);
  dmDatabase.tblBatch.EnableControls ;
  end;
  qryBatchTypesList.DisableControls;
  qryBatchTypesList.Close;
  qryBatchTypesList.Open;
  qryBatchTypesList.EnableControls;
  dmDatabase.tblBatchTypes.open ;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID', LastBatchTypeId, []);
  qryBatchTypesList.Locate('WBatchTypeID', LastBatchTypeId, []);
  end else
  begin
  fmBatchEntry:=TfmBatchEntry.Create(self);
  try
  SetUpForm(fmBatchEntry);

    if IsRepeatingBat then
    begin
      fmBatchEntry.Caption :='*** '+ dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName:= OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,True);
    end
    else
    begin
      fmBatchEntry.Caption := dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
    end;
  BatchNameFName := dmDatabase.tblBatch.TableName;
  dmDatabase.tblBatch.Close;
  if InWorkFlow then
      begin
       ReturnForm := fmBatchEntry ;
       Exit ;
       end else
  lastresult := fmBatchEntry.ShowModal;
  finally
    if not InWorkFlow then
  FreeAndNil(fmBatchEntry);
  dmDatabase.tblBatch.EnableControls ;
  end;
   qryBatchTypesList.DisableControls;
   qryBatchTypesList.Close;
   qryBatchTypesList.Open;
   qryBatchTypesList.EnableControls;
   dmDatabase.tblBatchTypes.Open ;
   dmDatabase.tblBatchTypes.Locate('WBatchTypeID', LastBatchTypeId, []);
   qryBatchTypesList.Locate('WBatchTypeID', LastBatchTypeId, []);
  end; //end else other bank
  end;  //end while
  finally
    self.Visible := true ;
  end;
  FLedgerCalculationClass.Clear ;
  if not dmDatabase.SetOfBooksPropertys.DataParameter.CBNoCalcBatch then
  begin
  ReadLedgerObjectFromBatches(FLedgerCalculationClass );
  cxGrid1.Repaint ;
  end;
 end;
 finally
    idDocType := LastDocType ;
 end;
end;

procedure TfmSelectBatchType.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnopenClick(Sender);
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;


  if UpCase(Key) in ['A'..'Z']  then
  begin
    if qryBatchTypesList.Locate('SDescription',aLook+Key,[LoCaseInsensitive,loPartialKey]) then
      aLook := aLook +Key
    else
    begin
      aLook:='';
      if qryBatchTypesList.Locate('SDescription',Key,[LoCaseInsensitive,loPartialKey]) then
        aLook := Key;
    end;
    Key:=#0;
  end
end;

procedure TfmSelectBatchType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblBatchTypes.Close;
   QryBatchTypesList.Close;
  TDatabaseRegistyRoutines.WriteFormPos(Self,'');
   cxGrid1DBTableView1.StoreToRegistry('Software\osfinancials\selectbatch\cols1');
end;

procedure TfmSelectBatchType.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 112 then
   begin
      if IsRepeatingBat then
        HtmlShowTopic(162)
      else
        HtmlShowTopic(102);
      key := 0;
   end;
end;

procedure TfmSelectBatchType.SetLedgerCalculationClass(
  const Value: TLedgerCalculationClass);
begin
  FLedgerCalculationClass := Value;
end;


procedure TfmSelectBatchType.FormDestroy(Sender: TObject);
begin
 FLedgerCalculationClass.free ;
end;

procedure TfmSelectBatchType.FormCreate(Sender: TObject);
begin
  FLedgerCalculationClass := TLedgerCalculationClass.Create(self,TLedgerItem);
  DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TfmSelectBatchType.GeneralPopupmenuClick(Sender: TObject);
Var
  AliasInput :String;
  lastResult,LastId ,LastBatchTypeId : Integer ;
begin
  lastresult := 5 ;
  LastBatchTypeId := qryBatchTypesListWbatchtypeID.Value ;
  dmDatabase.tblBatchTypes.open ;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID',LastBatchTypeId,[]);
  if (dmDatabase.tblBatchTypesWBatchTypeID.AsString='') or
     (dmDatabase.tblBatchTypesSDescription.AsString='') then
     exit;

  if CanUserBatch(CurrentUser,qryBatchTypesList.FieldByName('WBatchTypeID').AsInteger) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
    Exit;
  end;
  dmDatabase.tblBatch.close;
  // done : pieter Batc conrol out of sinc ??
  // Theres reports from digian about the abriviation

  BatchCtrlID := GetBatchCtrlID(dmDatabase.tblBatchTypesWBatchTypeID.AsInteger) ;
  LastId := BatchCtrlID ;
  while LAstResult = 5 do
  begin
  BatchCtrlID := lastid ;
  fmBatchEntry:=TfmBatchEntry.Create(Application);
  try
  SetUpForm(fmBatchEntry);

    if IsRepeatingBat then
    begin
      fmBatchEntry.Caption :='*** '+ dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName:= OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,True);
    end
    else
    begin
      fmBatchEntry.Caption := dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
    end;
  BatchNameFName := dmDatabase.tblBatch.TableName;
  dmDatabase.tblBatch.Close;
  lastresult := mrOk ;
  fmBatchEntry.show;
  fmBatchEntry.hide ;


  if sender = Post1 then
  fmBatchEntry.F9Process('Post')
  else
  if sender = Balance1 then
  begin
  dmDatabase.tblBatch.First ;
  fmBatchEntry.RemoveEmptys ;
  fmBatchEntry.F9Process('Balance') ;
  end
  else
  if sender = Delete1 then
  fmBatchEntry.F9Process('RpbtErase')
  else
  if sender = Alias1 then
    begin
    fmBatchEntry.hide ;
     AliasInput := GetBatAlias(BatchCtrlID) ;
    if InputQuery(GetTextLang(1756),GetTextLang(1756),AliasInput) then
      ChangeBatAlias(BatchCtrlID,AliasInput);
    end
  else
  if sender = Import1 then
  begin
  if fmBatchEntry.ImportDialog.execute then
  fmBatchEntry.F9Process('Import') ;
  dmDatabase.tblBatch.First ;
  fmBatchEntry.RemoveEmptys ;
  end
  else
  if sender = nil then
  begin
  fmBatchEntry.ImportDialog.filename := ALoadFile ;
  fmBatchEntry.F9Process('Import') ;
  dmDatabase.tblBatch.First ;
  fmBatchEntry.RemoveEmptys ;
  end
  else
  if sender = Export1 then
  begin
  if fmBatchEntry.ExportDialog.execute then
  fmBatchEntry.F9Process('Export')
  end
  else
  if sender = Switch1 then
  fmBatchEntry.F9Process('ReverseBat')
  else
  if sender = Deletebalance1 then
  begin
  dmDatabase.tblBatch.First ;
  fmBatchEntry.RemoveBalanceEntrys ;
  dmDatabase.tblBatch.First ;
  fmBatchEntry.RemoveEmptys ;
  end
  else
  if sender = Print1 then
  begin
  fmBatchEntry.F9Process('Print')
  end
  else
  if sender = Orderondate1 then
  begin
   dmDatabase.qGen.SQL.Text := 'select * from ' + dmDatabase.tblBatch.TableName +'  order by ddate ';
   AliasInput := ExtractFilePath(dmDatabase.tblBatch.Connection.Database) + 'tempexp.csv';
  WriteTextBatchFromDataset(dmDatabase.qGen,AliasInput) ;
  fmBatchEntry.F9Process('Erase') ;
    if IsRepeatingBat then
    begin
      fmBatchEntry.Caption :='*** '+ dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName:= OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,True);
    end
    else
    begin
      fmBatchEntry.Caption := dmDatabase.tblBatchTypesSDescription.Value;
      BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
    end;

  fmBatchEntry.ImportDialog.FileName := AliasInput ;
  fmBatchEntry.F9Process('Import') ;
  fmBatchEntry.RemoveEmptys ;

  DeleteFile(AliasInput) ;
  end


  else if  sender = PostedBatchesimport1 then
  begin
  if fmBatchEntry.ImportDialog.Execute then
  fmBatchEntry.F9Process('LoadTrans') ;
  end;


  finally
  FreeAndNil(fmBatchEntry);
  end;
  qryBatchTypesList.DisableControls;
  qryBatchTypesList.Close;
  qryBatchTypesList.Open;
  qryBatchTypesList.EnableControls;
  dmDatabase.TblBatchTypes.Locate('WBatchTypeID', LastBatchTypeId, []);
  qryBatchTypesList.Locate('WBatchTypeID', LastBatchTypeId, []);
  end;
  FLedgerCalculationClass.Clear ;
  ReadLedgerObjectFromBatches(FLedgerCalculationClass );
  cxGrid1.Repaint ;
end;

procedure TfmSelectBatchType.Trailbalance1Click(Sender: TObject);
Var
 AAccTreeView : TAccountTreeView ;
begin


 AAccTreeView := TAccountTreeView.Create(self) ;
 try
  AAccTreeView.BShowUnpostedOnly := OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(2189) +'?',mtWarning,[mbyes,mbno],0) = mryes  ;
  AAccTreeView.BShowUnposted := True ;
  AAccTreeView.BorderStyle := bsSizeable ;

  AAccTreeView.ShowModal ;


 Finally
  AAccTreeView.Free ;
 end;
end;

procedure TfmSelectBatchType.FormDoClose(Sender: TObject);
begin
 ModalResult := mrok ;

end;

procedure TfmSelectBatchType.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

  var
   Debit,Credit : Double ;
   BatchCtrlID : Integer ;
begin
   if ( StrToIntDef(vartoStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1WCONTRAACCOUNTID.Index]),0) <=0) AND  (AViewInfo.Item.Name = cxGrid1DBTableView1SCONTRANAME.Name ) then
    aCanvas.Font.Color:=aCanvas.Brush.Color;
  if (Not AViewInfo.Selected) And (Not CanUserBatch(CurrentUser,StrToIntDef(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1WBATCHTYPEID.Index]),0))) then
  begin
    aCanvas.Font.Color:=clGray;
  end
  else  if (Not AViewInfo.Selected) And (VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1BCASHBOOK.Index]) = '1') then
  begin
    aCanvas.Font.Color:=clBlue;
  end ;

 if AViewInfo.Item.name = cxGrid1DBTableView1WCONTRAACCOUNTID.Name then
   begin
       BatchCtrlID :=  AViewInfo.GridRecord.Values[cxGrid1DBTableView1WBATCHTYPEID.Index] ;
       aCanvas.FillRect(AViewInfo.Bounds);
       FLedgerCalculationClass.GetTotalsFromBatch(BatchCtrlID,Debit,Credit);
       aCanvas.DrawTexT(formatfloat('###,###,##0.00',Debit)+' / '+formatfloat('###,###,##0.00',Credit),AViewInfo.EditBounds,0);
       ADone := True ;
   end;



end;

procedure TfmSelectBatchType.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 BatchCtrlID : Integer ;
begin
       BatchCtrlID := GetOPenBatchCtrlID(qryBatchTypesList.FindField('WBatchTypeID').AsInteger) ;
       LAlias.Caption := GetBatAlias(BatchCtrlID) ;
end;


initialization
twf_TfmSelectBatchType.Create(nil);
end.
