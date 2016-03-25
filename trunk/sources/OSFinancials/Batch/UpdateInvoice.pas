(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit UpdateInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  db,StdCtrls, ExtCtrls, Buttons, ComCtrls,
  Menus, DBGrids, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmUpdateInvoice = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    StBar: TStatusBar;
    Panel2: TPanel;
    CbDocTypeNew: TComboBox;
    Label3: TLabel;
    Panel3: TPanel;
    RbRange: TRadioButton;
    RbSelect: TRadioButton;
    Label4: TLabel;
    Label1: TLabel;
    cboxFromInvoice: TComboBox;
    Label2: TLabel;
    cboxToInvoice: TComboBox;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    cbPosted: TCheckBox;
    lbSearchBy: TLabel;
    btSearch: TButton;
    ed: TEdit;
    PopupMenu1: TPopupMenu;
    SetFromoption1: TMenuItem;
    SetasToOption1: TMenuItem;
    Update1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BatPopMenu: TPopupMenu;
    Update2: TMenuItem;
    EditBatch1: TMenuItem;
    DeleteBatch1: TMenuItem;
    PMultyUserDebug: TPanel;
    CBSupressOpenitem: TCheckBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SDOCNO: TcxGridDBColumn;
    cxGrid1DBTableView1DDATE: TcxGridDBColumn;
    cxGrid1DBTableView1BREPEATING: TcxGridDBColumn;
    cxGrid1DBTableView1SMAINACCOUNTCODE: TcxGridDBColumn;
    cxGrid1DBTableView1SSUBACCOUNTCODE: TcxGridDBColumn;
    cxGrid1DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1WMESSAGE1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WMESSAGE2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WMESSAGE3ID: TcxGridDBColumn;
    cxGrid1DBTableView1FINVOICEDISCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1WDELADDRESS1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WDELADDRESS2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WDELADDRESS3ID: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTAL1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTAL2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTAL3ID: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTALCODEID: TcxGridDBColumn;
    cxGrid1DBTableView1WDELCODEID: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    cxGrid1DBTableView1WSALESMANID: TcxGridDBColumn;
    cxGrid1DBTableView1WCURRENCYID: TcxGridDBColumn;
    cxGrid1DBTableView1WPAYMENTTYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1BPOSTED: TcxGridDBColumn;
    cxGrid1DBTableView1BPRINTED: TcxGridDBColumn;
    cxGrid1DBTableView1WUSERID: TcxGridDBColumn;
    cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid1DBTableView1DDUEDATE: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn;
    cxGrid1DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WTERMS: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTALNAME: TcxGridDBColumn;
    cxGrid1DBTableView1WPOSTALCONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1WDELNAME: TcxGridDBColumn;
    cxGrid1DBTableView1WDELCONTACT: TcxGridDBColumn;
    cxGrid1DBTableView1WTAXNUMBER: TcxGridDBColumn;
    Timer1: TTimer;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1WBATCHID: TcxGridDBColumn;
    cxGrid2DBTableView1WUSERID: TcxGridDBColumn;
    cxGrid2DBTableView1BPOSTED: TcxGridDBColumn;
    cxGrid2DBTableView1WBATCHTYPEID: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid2DBTableView1SUSERNAME: TcxGridDBColumn;
    cxGrid2DBTableView1BONLINE: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RbRangeClick(Sender: TObject);
    procedure RbSelectClick(Sender: TObject);
    procedure CbDocTypeNewChange(Sender: TObject);
    procedure dbgInvoiceListEnter(Sender: TObject);
    procedure cbPostedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
    procedure dbgInvoiceListTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure edChange(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure SetFromoption1Click(Sender: TObject);
    procedure SetasToOption1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure EditBatch1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure Timer1Timer(Sender: TObject);
    procedure DeleteBatch1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    ExchDate:TDate;
    procedure RunSql;
    procedure TranslateForm ;
    Procedure UseBatches(Sender: TObject);
    procedure UpDate1Batch(Sender: TObject);
    Function  PrepareBatch:Boolean;
    procedure PostBatches(Sender: TObject);
    procedure DeletesingleBatch ;
    { Private declarations }
  public
    GoToDocument : String ;
    BDoExtPos  : Boolean ;
    WProfileid : Integer ;
    { Public declarations }
  end;

var
  fmUpdateInvoice: TfmUpdateInvoice;

implementation

uses Database, Main, GlobalFunctions, LanguageChoice, BatchEntry,
  ExchangeTCData, DatabaseAccess, TcVariables, LedgerRoutines, XRoutines,
   OSFGeneralRoutines, NewProgress, UDMCoreData,
  UDMCoreDocData, BatchEntryBank, UDMTCCoreLink, UDmQuantumGridDefs;

{$R *.DFM}

procedure TfmUpdateInvoice.RunSql;
begin
  dmDatabase.tblDocHeader.Close;
  ChargeDocSql;
  if not IsDeleteMode then
  dmDatabase.qryDocHead.SQL.Add('   and not (DocHead.WTypeid in (14,15))') ;
 // else
 // dmDatabase.qryDocHead.SQL.Add('   and not (DocHead.WTypeid in (16))') ;

  if BDoExtPos then
    begin
     cbPosted.visible := false ;
     CbDocTypeNew.Visible := false ;
     dmDatabase.qryDocHead.SQL.Add('   and DocHead.BPosted = 0 and DocHead.WTypeID = 10 and DocHead.WSourceTypeID in (2,4,5,6) and (dochead.SEXTERNALID is null or dochead.SEXTERNALID = '+ QuotedStr(IntToStr(WProfileid)) +')');
     dmDatabase.qryDocHead.SQL.Add('order by DocHead.SDocNo');
     dmDatabase.qryDocHead.Open;
     exit ;
    end;

  if Integer(CbDocTypeNew.Items.Objects[CbDocTypeNew.ItemIndex]) = 0 then
     begin
       if cbPosted.visible then
         dmDatabase.qryDocHead.SQL.Add('   and DocHead.BPosted =' + IntToStr(ord(cbPosted.Checked)))
         else
         dmDatabase.qryDocHead.SQL.Add('   and DocHead.BPosted <>1') ;
       if not isDeletemode then
       dmDatabase.qryDocHead.SQL.Add('   AND ((not DocHead.WSourceTypeID in (2,3,4,5,6)) or DocHead.WSourceTypeID is null) and not(DocHead.SDocNo is null or DocHead.SDocNo=' +QuotedStr('')+')');
     end // end alli tems
     else
     begin
       if (cbPosted.visible) then
       begin
         if cbPosted.Checked then
         begin
            dmDatabase.qryDocHead.SQL.Add('   and DocHead.BPosted = 1 ');
          end else
          begin
            dmDatabase.qryDocHead.SQL.Add('   and DocHead.BPosted <> 1 ');
          end;
       end else
       begin
       if not isDeletemode then
          begin
            dmDatabase.qryDocHead.SQL.Add('   and (DocHead.BPosted <> 1 )');
          end
       end;
       dmDatabase.qryDocHead.SQL.Add('   and DocHead.WTypeID ='+ IntToStr(idDocType)+ ' and ((not DocHead.WSourceTypeID in (2,3,4,5,6)) or DocHead.WSourceTypeID is null)');
    end; // end not all items
  dmDatabase.qryDocHead.SQL.Add('order by DocHead.SDocNo');
  dmDatabase.qryDocHead.Open;
end;


procedure TfmUpdateInvoice.FormShow(Sender: TObject);
Var
 AList : TSTringlist ;
 i :  integer ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
  try
    cxGrid1DBTableView1.Controller.ClearSelection ;
  except

  end;
  dmDatabase.qryDocHead.DisableControls;
  try
  if not IsDeleteMode then
   cbPosted.Checked := false ;
  PageControl1.Pages[1].TabVisible :=Not isDeleteMode;
  BtnOk.Enabled := CheckUserCtrl('Post',False);
  dmDatabase.qryUpdateBatch.Close;


  cxGrid2DBTableView1WBATCHID.Caption:= GetTextLang(1071);
  cxGrid2DBTableView1SDESCRIPTION.Caption:= GetTextLang(241);
  cxGrid2DBTableView1SUSERNAME.Caption:= GetTextLang(1072);
  cxGrid2DBTableView1BONLINE.Caption:= GetTextLang(1073);


  CBSupressOpenitem.Caption := GetTextLang(2962);

  if UpBatches then
  begin
    dmDatabase.qryUpdateBatch.open;
//    UseBatches(Sender);
    Exit;
  end;
  if not IsDeleteMode then
  cbPosted.visible := False;

  RunSql;

  //To Invoice 208
  Label2.Caption := GetTextLang(208);

  CBSupressOpenitem.Checked := ReadReportOp('CBSupressOpenitem',false).AsBoolean ;
  
  cboxFromInvoice.Items.clear;
  cboxToInvoice.Items.clear;
  while not dmDatabase.qryDocHead.EOF do
  begin
  if  dmDatabase.qryDocHeadSDocNo.Value <> '' then
    begin
    cboxFromInvoice.Items.Add(dmDatabase.qryDocHeadSDocNo.Value);
    cboxToInvoice.Items.Add(dmDatabase.qryDocHeadSDocNo.Value);
    end else
    begin
      // With multy user you dont want to delete these.
        If IsDeleteMode then
         begin
          ExecSql('delete from dochead where WDocID='+intToStr(dmDatabase.qryDocHeadWDOCID.AsInteger));
         end;
     end;
   dmDatabase.qryDocHead.Next;
  end;
  if cboxToInvoice.Items.Count>0 then
  begin
    cboxFromInvoice.ItemIndex:=0;
    cboxToInvoice.ItemIndex:=cboxToInvoice.Items.Count-1
  end
  else
  begin
    cboxFromInvoice.Text:='';
    cboxToInvoice.text:='';
  end;

  if cboxFromInvoice.Enabled=True then
     cboxFromInvoice.SetFocus
  else
     cxGrid1.SetFocus;
  if IsDeleteMode then
  begin
    BtnOk.Caption:='&'+GetTextLang(173);
  end
  else
  begin
    BtnOk.Caption:='&'+GetTextLang(358);
  end;
  dmDatabase.qryDocHead.First ;

  finally
    dmDatabase.qryDocHead.EnableControls;
    SetProgress(-1);
  end;
  TransLateForm ;
  lbSearchBy.Caption:=GetTextLang(944){'Search By '}+ ' '+ cxGrid1DBTableView1SDOCNO.Caption;
if GoToDocument <> '' then
     begin
       RbSelect.Checked := true ;
       AList := TSTringlist.create ;
       try
       AList.Text := GoToDocument ;
       for i := 0 to AList.Count -1 do
         begin
           if dmDatabase.qryDocHead.Locate('SDOCNO',AList[i],[]) then
             begin
               cxGrid1DBTableView1.Controller.FocusedRow.Selected := True ;
             end;
         end;
       finally
         AList.free ;
       end;
     end;
      if BDoExtPos then
    begin
      cxGrid1DBTableView1.Controller.SelectAll ; 
      btnOKClick(self) ;
      Timer1.Enabled := true; 
    end;


end;



procedure TfmUpdateInvoice.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmUpdateInvoice.btnOKClick(Sender: TObject);
Var
  PostErr,tmp,i,LastDocType:Integer;
  Count,
  TotCount:LongInt;
  BCanPostDoc:Byte;
  AProgress : TfmNewProgress ;
  ADmCoreDataBatch : TDMCoreData ;
  ADmCoreData : TDMCoreDocData ;
  NextShiftNo : String ;
begin
ADmCoreDataBatch := TDMCoreData.Create(nil);

  try
  ADmCoreData := TDMCoreDocData.Create(nil) ;

  try

  LastDocType := IdDocType ;
  GetDatesLimits;
  if CheckUserCtrl('Post',True)=false then
      exit;
  if UpBatches then
  begin
    PostBatches(Sender);
    exit;
  end;

 try
  dmDatabase.CalledFromBatch:=False;

  Count:=0;
  if rbRange.Checked then
  begin
  // Use From ... To Range
   dmDatabase.qryDocHead.Filtered := False;

    if IsDeleteMode And cbPosted.Checked then
      dmDatabase.qryDocHead.Filter := 'SDocNo >= ''' + cboxFromInvoice.Text + ''' AND SDocNo <= ''' + cboxToInvoice.Text + ''''
    else
      dmDatabase.qryDocHead.Filter := 'SDocNo >= ''' + cboxFromInvoice.Text + ''' AND SDocNo <= ''' + cboxToInvoice.Text + '''';
    dmDatabase.qryDocHead.Filtered := True;
    cxGrid1DBTableView1.Controller.SelectAll;
    TotCount:=dmDatabase.qryDocHead.RecordCount;
  end
  else
  // Use Selection Range
    TotCount:= cxGrid1DBTableView1.Controller.SelectedRecordCount;
  if TotCount=0 then exit;

  if IsDeleteMode then
    if not (OSFMessageDlg(GetTextLang(725){'Do want to Delete'}, mtinformation, [mbYes,mbNo], 0)=mrYes) then
      exit ;

  AProgress := TfmNewProgress.Create(nil) ;
  try
  AProgress.initProgress('',TotCount);
  if BDoExtPos then
     NextShiftNo := TDataBaseDocumentRoutines.GetAnnyNextNum('SHPOSNEXTSHIFT') ;

  for i:= 0 to cxGrid1DBTableView1.Controller.SelectedRecordCount -1 do
  begin
      Inc(Count);
      ADmCoreDataBatch.CloseAll ;
      ADmCoreData.CloseAll ;
     cxGrid1DBTableView1.Controller.SelectedRecords[i].Focused := True ;


      StBar.Panels[0].Text:=dmDatabase.qryDocHeadSDocNo.AsString;
      AProgress.SetProgress(IntToStr(Count)+ ' '+gettextlang(3005){of}+' '+IntToStr(TotCount),Count);
      if isDeleteMode then
      begin
       // Deleting Documents
        if ( Not dmDatabase.qryDocHeadBPOSTED.Value=1) then
        begin
          dmDatabase.ZQDocLine.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('database_selectdoclineondocid') ;
          dmDatabase.ZQDocLine.ParamByName('WdocId').AsInteger :=  dmDatabase.qryDocHeadWDocID.AsInteger ;
          dmDatabase.ZQDocLine.open ;
          dmDatabase.ZQDocLine.First;
          // dmDatabase.ZQStock.Open;
          // todo : something with stock ??
          while not dmDatabase.ZQDocLine.EOF do
          begin
            dmDatabase.tblDocLine.Delete;
          end;

        end;
        ExecSql('Delete from Dochead where WDocId='+IntTOStr( dmDatabase.qryDocHeadWDOCID.AsInteger));
        AProgress.SetProgress(GetTextLang(1123){'Deleted'}+' ... ',0);
      end
      else
      begin
           dmDatabase.CreateBatch('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) ;
           dmDatabase.ZMainconnection.StartTransaction ;
           try
            if BDoExtPos then
              begin
                // DMTCCoreLink.ExecSql('Update dochead set SREFERENCE =' + QuotedStr(NextShiftNo) + ' where WDocid = ' + IntToStr(dmDatabase.qryDocHeadWDOCID.AsInteger)) ;
              end;
            if  not CBSupressOpenitem.Checked then
              PostErr:=ConvertDocumentToBatch(tmp,dmDatabase.qryDocHeadWDOCID.AsInteger,false,ADmCoreData,ADmCoreDataBatch,true)
            else
               PostErr:=ConvertDocumentToBatch(tmp,dmDatabase.qryDocHeadWDOCID.AsInteger,true,ADmCoreData,ADmCoreDataBatch,true) ;


           finally
             if dmDatabase.ZMainconnection.InTransaction then
               dmDatabase.ZMainconnection.Rollback ;
           end;


            if PostErr <>0 then
            begin
              ShowErrMsg(PostErr);
              abort;
            end
            else
              if dmDatabase.qryDocHeadDDate.Value<ExchDate then
                ExchDate := dmDatabase.qryDocHeadDDate.Value;
      end;
  end;
  finally
     AProgress.CloseProgress;
     AProgress.Free;
  end;
  // if dbgInvoiceList.s
  // dbgInvoiceList.UnselectAll ;
finally


      RunUpdateClient;

      IdDocType := LastDocType ;
      try
       cxGrid1DBTableView1.Controller.ClearSelection ;
      if not BDoExtPos then
      FormShow(sender);
      except

      end;
end;
  finally
  ADmCoreDataBatch.free;
  end
  finally
  ADmCoreData.free ;
  end;

end;

procedure TfmUpdateInvoice.btnCancelClick(Sender: TObject);
begin
  Close;

end;


procedure TfmUpdateInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cboxFromInvoice.Items.Clear;
  cboxToInvoice.Items.Clear;
  dmDatabase.qryDocHead.Close;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblDocHeader.Filtered := False;
  dmDatabase.tblDocHeader.Filter :='';
  UpBatches:=False;
  WriteReportOp('CBSupressOpenitem',BoolToStr(CBSupressOpenitem.Checked,true));


end;

procedure TfmUpdateInvoice.RbRangeClick(Sender: TObject);
begin
  rbSelect.Checked:=False;
  Label1.Enabled:=True;
  Label2.Enabled:=True;
  cboxFromInvoice.Enabled:=True;
  cboxToInvoice.Enabled:=True;
end;

procedure TfmUpdateInvoice.RbSelectClick(Sender: TObject);
begin
  RbRange.Checked:=False;
  Label1.Enabled:=False;
  Label2.Enabled:=False;
  cboxFromInvoice.Enabled:=False;
  cboxToInvoice.Enabled:=False;
end;

procedure TfmUpdateInvoice.CbDocTypeNewChange(Sender: TObject);
begin
  idDocType:=  Integer(CbDocTypeNew.Items.Objects[CbDocTypeNew.ItemIndex]) ;
  FormShow(Sender)
end;

procedure TfmUpdateInvoice.dbgInvoiceListEnter(Sender: TObject);
begin
   RbSelect.Checked:=True;
   RbSelectClick(Sender);
end;

procedure TfmUpdateInvoice.cbPostedClick(Sender: TObject);
begin
 FormShow(Sender);
end;

procedure TfmUpdateInvoice.FormCreate(Sender: TObject);
begin
 PMultyUserDebug.Visible := lowercase(ParamStr(2)) = 'true';
  if isDeletemode then
    TDataBaseDocumentRoutines.LoadDocTypes(CbDocTypeNew.Items,true,true)
  else
    TDataBaseDocumentRoutines.LoadDocTypes(CbDocTypeNew.Items,true,false);
  CbDocTypeNew.ItemIndex:=3;
  PageControl1.ActivePageIndex:=0;
  ExchDate:=Date;      
end;

 

procedure TfmUpdateInvoice.dbgInvoiceListTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin

   dmDatabase.qryDocHead.IndexFieldNames := AFieldName;
end;

procedure TfmUpdateInvoice.edChange(Sender: TObject);
begin
  btSearchClick(Sender);
end;

procedure TfmUpdateInvoice.btSearchClick(Sender: TObject);
begin
     dmDatabase.qryDocHead.locate('SdocNo',ed.Text,[loPartialKey,loCaseInsensitive])
end;

procedure TfmUpdateInvoice.SetFromoption1Click(Sender: TObject);
begin
  cboxFromInvoice.itemIndex := cboxFromInvoice.Items.IndexOf(dmDatabase.qryDocHeadSdocNo.AsString);
end;

procedure TfmUpdateInvoice.SetasToOption1Click(Sender: TObject);
begin
  cboxToInvoice.itemIndex := cboxFromInvoice.Items.IndexOf(dmDatabase.qryDocHeadSdocNo.AsString);
end;

procedure TfmUpdateInvoice.Update1Click(Sender: TObject);
begin
  btnOKClick(Sender);
end;

procedure TfmUpdateInvoice.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex=0 then
  begin
    lbSearchBy.Caption:=GetTextLang(944){'Search By '}+ ' '+ cxGrid1DBTableView1SDOCNO.Caption;
     CbDocTypeNew.Enabled:=True;
    if isDeleteMode then
      cbPosted.Visible := True;
    UpBatches:=False;
  end
  else
  begin
    Caption:=GetTextLang(1074){'Update Batches'};
    lbSearchBy.Caption := GetTextLang(944){'Search By Batch Number}+' '+GetTextLang(164)+' ' +GetTextLang(2106);
    CbDocTypeNew.Enabled:=False;
    cbPosted.Enabled:=False;
    UpBatches:=True;
    cboxFromInvoice.Items.clear;
    cboxToInvoice.Items.clear;
    dmDatabase.qryUpdateBatch.DisableControls;
    dmDatabase.qryUpdateBatch.Open;
    dmDatabase.qryUpdateBatch.First;
    while not dmDatabase.qryUpdateBatch.EOF do
    begin
      cboxFromInvoice.Items.Add(dmDatabase.qryUpdateBatchWBatchID.AsString);
      cboxToInvoice.Items.Add(dmDatabase.qryUpdateBatchWBatchID.AsString);
      dmDatabase.qryUpdateBatch.Next;
    end;
    dmDatabase.qryUpdateBatch.EnableControls;
    if cboxToInvoice.Items.Count>0 then
    begin
      cboxFromInvoice.ItemIndex:=0;
      cboxToInvoice.ItemIndex:=cboxToInvoice.Items.Count-1
    end
    else
    begin
      cboxFromInvoice.Text:='';
      cboxToInvoice.text:='';
    end;
    Label1.Caption := GetTextLang(827);
  end;
  FormShow(Sender);
end;

procedure TfmUpdateInvoice.UseBatches(Sender: TObject);
begin

end;


procedure TfmUpdateInvoice.UpDate1Batch(Sender: TObject);
Var
  ProcRes : Integer;
  LyPost : Boolean;
begin
  RealUser := CurrentUser ;
  if CheckUserCtrl('Batch',True)=false then
      exit;

  Try
    SetCurrentUser(dmDatabase.qryUpdateBatchWUserID.Value);
    if PrepareBatch then
    begin
      LyPost:=True;
      If IsPostLastYear then begin
        LyPost:= OSFMessageDlg(GetTextLang(595)+#13#10+GetTextLang(594){Are you sure you wish to Post to Last Year?}, mtconfirmation, [mbyes, mbno], 0) = mrNo;
        if not LyPost then
        begin

          Exit;
        end;
      end;
    dmDatabase.ZMainconnection.StartTransaction ;
       try
        ProcRes := PostBatchNow(LyPost,false);
       dmDatabase.ZMainconnection.Commit ;
      finally
      if  dmDatabase.ZMainconnection.InTransaction then
        dmDatabase.ZMainconnection.Rollback ;
      if assigned(fmBatchEntry) then
      fmBatchEntry.Cursor := crDefault;
     end;



      ShowErrMsg(ProcRes);
      if ProcRes <> 0 then
        // todo : Pieter Make this a translation
       if OSFMessageDlg(GetErrMsg(ProcRes)+' Do you wish to edit this?',mtConfirmation,[mbyes,mbno],0) = mryes then
       begin
          BatchCtrlID := GetBatchCtrlID(dmDatabase.qryUpdateBatchWBatchTypeID.AsInteger) ;
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
           fmBatchEntry.ShowModal;
          finally
          FreeAndNil(fmBatchEntry);
          end;
       end;
      dmDatabase.tblBatch.Close;
      dmDatabase.qryUpdateBatch.Close;
      dmDatabase.qryUpdateBatch.Open;
    end;
  Finally
    SetCurrentUser(CurrentUser);
  end;
 
End;

Function  TfmUpdateInvoice.PrepareBatch:Boolean;
begin
  result := true ;
  dmDatabase.tblBatchTypes.Open;
  dmDatabase.tblBatchTypes.Locate('WBatchTypeID' ,dmDatabase.qryUpdateBatchWBatchTypeID.Value,[]);
  BatchNameFName := OpenBatch (dmDatabase.tblBatchTypesSDescription.Value,BatchCtrlID,False);
  if CanUserBatch(RealUser,dmDatabase.qryUpdateBatchWBatchTypeID.Value) <> true then
  begin
    OSFMessageDlg(GetTextLang(1413)+#13#10+GetTextLang(1414), mtwarning, [mbok], 0);
    Result:=False;
  end;
end;

procedure TfmUpdateInvoice.EditBatch1Click(Sender: TObject);
begin
  if CheckUserCtrl('Batch',True)=false then
      exit;

  dmDatabase.tblBatchTypes.Open ;
  dmDatabase.tblBatchTypes.Filtered := false ;

  dmDatabase.tblBatchTypes.Locate('WBATCHTYPEID',dmDatabase.qryUpdateBatchWBATCHTYPEID.AsInteger,[]);

  if (dmDatabase.tblBatchTypesBCASHBOOK.AsInteger = 1) and (not ReadReportOp('CBViewAllBankState',false).AsBoolean) then
  begin
    Try
     RealUser := CurrentUser;
     SetCurrentUser(dmDatabase.qryUpdateBatchWUserID.Value);

    fmBatchEntryBank:=TfmBatchEntryBank.Create(Application);
    try
      if PrepareBatch then
        begin
  
        fmBatchEntryBank.ShowModal;
        end;
    Finally

     fmBatchEntryBank.Free;
    end;
   finally
      SetCurrentUser(RealUser);
   end;
  end else
  begin
     RealUser := CurrentUser;
    SetCurrentUser(dmDatabase.qryUpdateBatchWUserID.Value);
    try

    fmBatchEntry:=TfmBatchEntry.Create(Application);
    Try


      if PrepareBatch then
        fmBatchEntry.ShowModal;
    Finally

     fmBatchEntry.Free;
    end;
   finally
      SetCurrentUser(RealUser);
   end;    
  end;
  SetProgress(-1);
  dmDatabase.qryUpdateBatch.Close;
  dmDatabase.qryUpdateBatch.Open;
end;

procedure TfmUpdateInvoice.PostBatches(Sender: TObject);
Var
  Count,
  TotCount:LongInt;
  MySelecList : TStringList;
  AProgress : TfmNewProgress ;
begin
  MySelecList:=TStringList.Create;
  AProgress := TfmNewProgress.create(nil) ;
  try
    dmDatabase.qryUpdateBatch.DisableControls;
    if rbRange.Checked then
    begin
    // Use From ... To Range
      dmDatabase.qryUpdateBatch.Filtered := False;
      dmDatabase.qryUpdateBatch.Filter := 'WBatchID >= ''' + cboxFromInvoice.Text + ''' AND WBatchID <= ''' + cboxToInvoice.Text + '''';
      dmDatabase.qryUpdateBatch.Filtered := True;
      TotCount:=dmDatabase.qryUpdateBatch.RecordCount;
    end
    else
    begin
    // Use Selection Range
      TotCount:=  cxGrid2DBTableView1.Controller.SelectedRecordCount ;
      For Count:=0 to TotCount-1 do
      begin
        cxGrid2DBTableView1.Controller.SelectedRecords[Count].Focused := True ;
        MySelecList.Add(dmDatabase.qryUpdateBatchWBatchID.AsString);
      end;
    end;
    dmDatabase.qryUpdateBatch.First;
    if  TotCount>0 then
    begin
      AProgress.initProgress('',TotCount);

      For Count:=0 to TotCount-1 do
        begin
          AProgress.SetProgress('',Count);

          if rbSelect.Checked then
            dmDatabase.qryUpdateBatch.Locate('WBatchID',MySelecList[Count],[]);
          StBar.Panels[2].Text:=dmDatabase.qryUpdateBatchSDescription.AsString;
          //call Batch Update;
          UpDate1Batch(Sender);
          if rbRange.Checked then dmDatabase.qryUpdateBatch.Next;
        end;
      end;
    finally
      AProgress.CloseProgress ;
      AProgress.free ;
      MySelecList.Free;
      StBar.Panels[2].Text:='';
      dmDatabase.qryUpdateBatch.Filtered := False;
      dmDatabase.qryUpdateBatch.EnableControls;
      cxGrid2DBTableView1.Controller.ClearSelection ;
      FormShow(sender);
  end;
end;

procedure TfmUpdateInvoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
           if isDeletemode then
             HtmlShowTopic(124)
           else
           if UpBatches then
             HtmlShowTopic(242)
           else
             HtmlShowTopic(241);
             key := 0;

        end;
end;


procedure TfmUpdateInvoice.Timer1Timer(Sender: TObject);
begin
Timer1.Enabled := false ;
if BDoExtPos then
  begin
   close ;
   exit ;
  end;

end;

procedure TfmUpdateInvoice.DeleteBatch1Click(Sender: TObject);
Var
  Count,
  TotCount:LongInt;
  MySelecList : TStringList;
  Label 1;
begin
  try
    MySelecList:=TStringList.Create;
    dmDatabase.qryUpdateBatch.DisableControls;
    if rbRange.Checked then
    begin
    // Use From ... To Range
      dmDatabase.qryUpdateBatch.Filtered := False;
      dmDatabase.qryUpdateBatch.Filter := 'WBatchID >= ''' + cboxFromInvoice.Text + ''' AND WBatchID <= ''' + cboxToInvoice.Text + '''';
      dmDatabase.qryUpdateBatch.Filtered := True;
      TotCount:=dmDatabase.qryUpdateBatch.RecordCount;
    end
    else
    begin
    // Use Selection Range
      TotCount:=cxGrid2DBTableView1.Controller.SelectedRecordCount;
      For Count:=0 to TotCount-1 do
      begin
        cxGrid2DBTableView1.Controller.SelectedRecords[Count].Focused := True ;
        MySelecList.Add(dmDatabase.qryUpdateBatchWBatchID.AsString);
      end;
    end;
    dmDatabase.qryUpdateBatch.First;
    if  TotCount>0 then
    begin
      SetProgress(TotCount);
      For Count:=0 to TotCount-1 do
        begin

          SetProgress('',Count);

          if rbSelect.Checked then
            dmDatabase.qryUpdateBatch.Locate('WBatchID',MySelecList[Count],[]);
          StBar.Panels[2].Text:=dmDatabase.qryUpdateBatchSDescription.AsString;
          //call Batch Update;
          DeletesingleBatch ;
          if rbRange.Checked then dmDatabase.qryUpdateBatch.Next;
        end;
      end;
    finally
      MySelecList.Free;
      StBar.Panels[2].Text:='';
      dmDatabase.qryUpdateBatch.Filtered := False;
      dmDatabase.qryUpdateBatch.EnableControls;
      cxGrid2DBTableView1.Controller.ClearSelection;

      SetProgress(-1);
      FormShow(sender);
  end;
end;
procedure TfmUpdateInvoice.DeletesingleBatch;
Var
  ProcRes : Integer;
  LyPost : Boolean;
begin
  RealUser := CurrentUser ;
  if CheckUserCtrl('Batch',True)=false then
      exit;

  Try
    SetCurrentUser(dmDatabase.qryUpdateBatchWUserID.AsInteger);

    if PrepareBatch then
    begin
    dmDatabase.tblBatch.close ;
    // No drops this is better
    ClearTable(dmDatabase.tblBatch.TableName);
    //Update the Batch control info
    dmDatabase.tblBatchControl.Open;
    dmDatabase.tblBatchControl.Filtered := False;
    dmDatabase.tblBatchControl.Filter := 'WUserID = ''' + IntToStr(CurrentUser)
                  + ''' and WBatchTypeID = ''' + IntToStr(dmDatabase.qryUpdateBatchWBatchTypeID.asinteger)
                  + ''' and BPosted <> 1';
    dmDatabase.tblBatchControl.Filtered := True;
    dmDatabase.tblBatchControl.First;
    While not dmDatabase.tblBatchControl.Eof do
    begin
      {Just in Case. It's Always 1 Record to Update}
  //        dmDatabase.tblBatchControl.Last;
      dmDatabase.tblBatchControl.Edit;
      dmDatabase.tblBatchControlBPosted.Value := 1;
      dmDatabase.tblBatchControl.Post;
      // done : Pieter if its just 1 record why do this and if your going to do this atleast place a next if we ever have 2 records where nevereg etting out of here.
      dmDatabase.tblBatchControl.next ;
    end;
    dmDatabase.tblBatchControl.Close;
    dmDatabase.tblBatchControl.Filtered := False;
    dmDatabase.tblBatchControl.Filter:='';

    end;
  Finally
    SetCurrentUser(CurrentUser);
  end;
  SetProgress(-1);
End;

procedure TfmUpdateInvoice.TranslateForm;
begin

  cxGrid1DBTableView1DDATE.Caption:= GetTextLang(238);
  cxGrid1DBTableView1SACCOUNTCODE.Caption:= GetTextLang(34);

  cxGrid1DBTableView1SREFERENCE.Caption := GetTextLang(1719);


  if isDeletemode then
  begin
   CBSupressOpenitem.visible:=False;
   cbPosted.visible:=True;
   BtnOk.Enabled:=True;


    Case IdDocType of
    0 : begin
        (* All documents  *)
         //Header
         Caption := GetTextLang(1098);
          //From Invoice 230
         Label1.Caption := GetTextLang(230);
         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(234);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(0)) ;
       end;
    10:begin
        (* Delete Invoices  *)
         //Header
         Caption := GetTextLang(39);
          //From Invoice 230
         Label1.Caption := GetTextLang(230);
         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(234);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(10)) ;
       end;
    12:Begin
        (* Delete  Purchases *)
         //Header
         Caption := GetTextLang(40);
          //From Purchase 230
         Label1.Caption := GetTextLang(694);
          cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(703);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);
         
         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(12)) ;
       end;
    13:begin
        (* Delete Stock Returns *)
         //Header
         Caption := GetTextLang(41);
          //From Return 230
         Label1.Caption := GetTextLang(702);
          cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(704);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);
         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(13)) ;
       end;
    14:begin
        (* Delete Order *)
         //Header
         Caption := GetTextLang(1018);
          //From Return 230
         Label1.Caption := GetTextLang(30);
         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(751);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);
         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(14)) ;
       end;
    16:begin
        (* Delete Quote *)
         //Header
         Caption := GetTextLang(1019);
          //From Return 230
         Label1.Caption := GetTextLang(773);
          cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(762);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);
         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(16)) ;
       end;
    17:begin
        (* Delete Quote *)
         //Header
         Caption := GetTextLang(41);
          //From Return 230
         Label1.Caption := GetTextLang(773);
          cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(762);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(17)) ;
       end;

    15:begin
        (* Delete Quote *)
         //Header
         Caption := GetTextLang(1019);
          //From Return 230
         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(762);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);

         Label1.Caption := GetTextLang(773);

         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(15)) ;
       end;
    else
       (* Delete  Credit Notes  *)
        //Header
        Caption := GetTextLang(695);
         //From Note 230
        Label1.Caption := GetTextLang(675);

        CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(11)) ;
     end;   // end case
  end
  else
  begin
    Case IdDocType of
  0 : begin
        (* All documents  *)
         //Header
         Caption := GetTextLang(1098);
          //From Invoice 230
         Label1.Caption := GetTextLang(230);
          cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(234);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(0)) ;
       end;
           
    10:begin
        (* Input Documents Invoice Update Ledger *)
         //Header
         Caption := GetTextLang(405);
          //From Invoice 230
         Label1.Caption := GetTextLang(230);
         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(234);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);
         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(10)) ;
       end;
    12:Begin
        (* Input Documents Purchase Update Ledger *)
         //Header
         Caption := GetTextLang(700);
          //From Purchase 230
         Label1.Caption := GetTextLang(694);

         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(703);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);

         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(12)) ;
       end;
    16:begin
        (* Delete Quote *)
         //Header
         Caption := GetTextLang(1019);
          //From Return 230
         Label1.Caption := GetTextLang(405);

         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(762);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(16)) ;
       end;
    17:begin
        (* Delete Quote *)
         //Header
         Caption := GetTextLang(41);
          //From Return 230
         Label1.Caption := GetTextLang(694);

         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(762);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);


         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(17)) ;
       end;       
    13:begin
        (* Input Documents Stock Returns Update Ledger *)
         //Header
         Caption := GetTextLang(701);
          //From Return 230
         Label1.Caption := GetTextLang(702);

         cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(704);
         cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(30);

         CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(13)) ;
       end;
    else
       (* Input Documents Credit Notes Update Ledger *)
        //Header
        Caption := GetTextLang(674);
         //From Note 230
        Label1.Caption := GetTextLang(675);
        cxGrid1DBTableView1SDOCNO.Caption:= GetTextLang(299);
        cxGrid1DBTableView1SDESCRIPTION.Caption:= GetTextLang(31);
        CbDocTypeNew.ItemIndex := CbDocTypeNew.Items.IndexOfObject(Tobject(11)) ;
    end;
  end;
end;

procedure TfmUpdateInvoice.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if not AViewInfo.Selected then
    if  VarTostr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1BPRINTED.Index]) <> '0' then
       ACanvas.Brush.Color:=clcream;
end;

end.
