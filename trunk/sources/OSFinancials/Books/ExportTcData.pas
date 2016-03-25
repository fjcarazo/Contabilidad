unit ExportTcData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ComCtrls,
   FileCtrl,    Buttons,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxPC, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfmExportData = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    PageControl1: TPageControl;
    DocTab: TTabSheet;
    AllAccounts: TTabSheet;
    gbRanges: TGroupBox;
    LFrom: TLabel;
    LTo: TLabel;
    edtFrom: TEdit;
    edtTo: TEdit;
    lblDatePeriod: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    OtherDir: TEdit;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    cbFileType: TComboBox;
    gbFiles: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    edtExportfile: TEdit;
    edtExportLog: TEdit;
    BGRange: TGroupBox;
    LFrom2: TLabel;
    LTo2: TLabel;
    Label9: TLabel;
    cbExportdocs: TCheckBox;
    cbIncExport: TCheckBox;
    Timer1: TTimer;
    edtDatePeriod: TcxDateEdit;
    tsindex: TcxPageControl;
    cxdocs: TcxTabSheet;
    cxStock: TcxTabSheet;
    cxdeb: TcxTabSheet;
    cxaccounts: TcxTabSheet;
    cxcreditors: TcxTabSheet;
    cxpostedbatch: TcxTabSheet;
    dtDocExport: TcxDateEdit;
    dtDocExportTo: TcxDateEdit;
     procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtFromEnter(Sender: TObject);
    procedure edtToEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure tsindexChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmExportData: TfmExportData;

implementation

uses ExchangeTCData, GlobalFunctions, Main, Database, TcVariables,
  DatabaseAccess, LedgerRoutines, UDMTCCoreLink, DB;

{$R *.dfm}
 

procedure TfmExportData.BtnOkClick(Sender: TObject);
Var
  sHead,Slines,sLog:String;
  wPeriodID,i : integer;
begin
    // done : Pieter away write ?


       WriteReportOp('SExportIndex',  IntToStr(tsindex.ActivePageIndex) );

    WriteReportOp('SExportFromBatch', sFromID);
    WriteReportOp('ExportSToBatch', sToID);

    WriteReportOp('SExportIncExport', BoolToStr(cbIncExport.Checked,true) );
    WriteReportOp('SExportExportdocs', BoolToStr(cbExportdocs.Checked,true) );

    WriteReportOp('SExportDocDate', dateToStr(dtDocExport.Date) );
    WriteReportOp('SExportDocDateTo', dateToStr(dtDocExportTo.Date) );
    WriteLongSysParam('SExportDocPath', OtherDir.Text,CurrentUser );
    WriteReportOp('SExportDocLine', edtExportfile.Text);
    WriteLongSysParam('SExportDocHead', edtExportfile.Text,CurrentUser);
    WriteReportOp('SExportDocLog', edtExportLog.Text);
    WriteReportOp('SExportDocType', cbFileType.Text);






  if tsindex.ActivePage=cxdocs then
  begin
   edtExportfile.Text := ChangeFileExt(edtExportfile.Text,'') ;
    if cbFileType.ItemIndex<>4 then
    begin
      sHead  := edtExportfile.Text+'Headers';
      Slines := edtExportfile.Text+'Lines';
    end
    else
    begin
      sHead  := edtExportfile.Text;
      Slines := edtExportfile.Text;
    end;
    sLog   := edtExportLog.Text;

    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text) + sHead+'.xml';
    Slines:=IncludeTrailingPathDelimiter(OtherDir.Text) + Slines+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text) + sLog+'.log';
    if PageControl1.ActivePage = AllAccounts then
    ExportXmlDoc(EncodeDate(1901,1,1),Date + 1,sHead,Slines,sLog,False,cbFileType.ItemIndex)
    else
    ExportXmlDoc(dtDocExport.Date,dtDocExportTo.Date,sHead,Slines,sLog,False,cbFileType.ItemIndex);
  end
  else
  if tsindex.ActivePage=cxaccounts then
  begin
    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text)+edtExportfile.Text+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text)+EdtExportLog.Text+'.log';
    ExportXmlAccts(sFromID,sToID,sHead,sLog,cbFileType.ItemIndex,0);
    if cbFileType.ItemIndex=7 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
  end
  else
  if tsindex.ActivePage=cxStock then
  begin
    if  (cbFileType.ItemIndex in [4,5,6]) then
      begin
       cbFileType.ItemIndex := 0 ;
       OSFMessageDlg(DMTCCoreLink.GetTextLang(3082){'not implemented'},mtInformation,[mbok],0);
       exit ;
      end;
    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text)+edtExportfile.Text+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text)+EdtExportLog.Text+'.log';

    ExportXmlStocks(sFromID,sToID,sHead,sLog,false,nil);
    if cbFileType.ItemIndex=2 then
      SaveFileToWkx(sHead,sLog);
    if cbFileType.ItemIndex=1 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.csv'),sLog,',');
    if cbFileType.ItemIndex=3 then
      SaveFileToXls(sHead,sLog);
    if cbFileType.ItemIndex=7 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
     if not (cbFileType.ItemIndex in [0]) then
      DeleteFile(sHead);
  end
  else if tsindex.ActivePage=cxdeb then
  begin
    if  (cbFileType.ItemIndex in [4]) then
      begin
       cbFileType.ItemIndex := 0 ;
       OSFMessageDlg(DMTCCoreLink.GetTextLang(3082){'not implemented'},mtInformation,[mbok],0);
       exit ;
      end;

    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text)+edtExportfile.Text+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text)+EdtExportLog.Text+'.log';
    ExportXmlAccts(sFromID,sToID,sHead,sLog,cbFileType.ItemIndex,1);
    if cbFileType.ItemIndex=7 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
  end
  else if tsindex.ActivePage=cxpostedbatch then
  begin
    if CheckBox1.Checked then
       WperiodID := LrGetPeriod(edtDateperiod.date)
    else
       WperiodID:=-1;
    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text)+edtExportfile.Text+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text)+EdtExportLog.Text+'.log';
    AutoPost:=True;
    ExportXmlTransact(StrToIntDef(sFromID,0),StrToIntDef(sToID,0),WperiodID,sHead,sLog,cbFileType.ItemIndex);
    AutoPost:=False;
   if cbFileType.ItemIndex=2 then
      SaveFileToWkx(sHead,sLog);
    if cbFileType.ItemIndex=1 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.csv'),sLog,',');
    if cbFileType.ItemIndex=3 then
      SaveFileToXls(sHead,sLog);
    if cbFileType.ItemIndex=7 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
      if  cbExportdocs.Checked then
      begin
        if cbFileType.ItemIndex<>4 then
        begin
          sHead  := edtExportfile.Text+'Headers';
          Slines := edtExportfile.Text+'Lines';
        end
        else
        begin
          sHead  := edtExportfile.Text;
          Slines := edtExportfile.Text;
        end;
        sLog   := edtExportLog.Text;

        sHead:=IncludeTrailingPathDelimiter(OtherDir.Text) + sHead+'doc'+'.xml';
        Slines:=IncludeTrailingPathDelimiter(OtherDir.Text) + Slines+'doc'+'.xml';
        sLog := IncludeTrailingPathDelimiter(OtherDir.Text) + sLog+'doc'+'.log';


        ExportXmlDoc(EncodeDate(1901,1,1),Date + 1,sHead,Slines,sLog,False,cbFileType.ItemIndex,false,'Select a.* from dochead a where a.WDocid in ' +
        '(select b.WDocid from batcon b where b.WDocid = a.WDocid and b.WBatchid >= '+IntToStr(StrToIntDef(sFromID,0)) +'  and b.WBatchid <= '+IntToStr(StrToIntDef(sToID,0))+')');//Select a.* from dochead where WDocid in (select WDocid from batcon where WBatchid ');
      end  ;

  end else  if tsindex.ActivePage=cxcreditors then
  begin
    if  (cbFileType.ItemIndex in [4]) then
      begin
       cbFileType.ItemIndex := 0 ;
       OSFMessageDlg(DMTCCoreLink.GetTextLang(3082){'not implemented'},mtInformation,[mbok],0);
       exit ;
      end;  
    sHead:=IncludeTrailingPathDelimiter(OtherDir.Text)+edtExportfile.Text+'.xml';
    sLog := IncludeTrailingPathDelimiter(OtherDir.Text)+EdtExportLog.Text+'.log';
//    ExportCreditors(sFromID,sToID,sHead,sLog,cbFileType.ItemIndex);
    ExportXmlAccts(sFromID,sToID,sHead,sLog,cbFileType.ItemIndex,2);
{   if cbFileType.ItemIndex=2 then
      SaveFileToWkx(sHead,sLog);
    if cbFileType.ItemIndex=1 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.csv'),sLog,',');
    if cbFileType.ItemIndex=3 then
      SaveFileToXls(sHead,sLog); }
    if cbFileType.ItemIndex=7 then
      SaveFileToCsv(sHead,ChangeFileExt(sHead,'.txt'),sLog,#9);
   //  if cbFileType.ItemIndex <> 0 then
    //  DeleteFile(sHead);
  end;
  OSFMessageDlg(DMTCCoreLink.GetTextLang(3084){'Finished'},mtInformation,[mbok],0);


end;

procedure TfmExportData.FormShow(Sender: TObject);
  var
   LastIndex : Integer ;
   MaxBatch : String ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
 
  GetDatesLimits;
  PageControl1.ActivePage := DocTab ;
  tsindex.ActivePage:=cxdocs;
  cbIncExport.Checked := ReadReportOp('SExportIncExport',False).AsBoolean;
  cbExportdocs.Checked := ReadReportOp('SExportExportdocs',True).AsBoolean;
  sFromID := ReadReportOp('SExportFromBatch','0').AsString;
  sToID := ReadReportOp('ExportSToBatch','0').AsString;
  if cbIncExport.Checked then
    begin
      MaxBatch := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select min(WBatchid) from BatCon where Bposted = 1 and WBatchid > ' + IntToStr(StrTOIntDef(sToID,0))));
      sFromID := MaxBatch ;
      if sFromID <> '' then
        begin
        MaxBatch := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select Max(WBatchid) from BatCon where Bposted = 1 and WBatchid >= ' + IntToStr(StrTOIntDef(sFromID,0))));
        sToID := MaxBatch ;
        edtFrom.Text := sFromID ;
        edtTo.Text := sToID ;
        end else
        begin
        sToID := '' ;
        edtFrom.Text :='Noting to export';
        edtTo.Text :='Noting to export';
        end;

    end  else
   begin
    edtFrom.Text := sFromID ;
    edtTo.Text := sToID ;
   end;
  LastIndex := ReadReportOp('SExportIndex',0).AsInteger ;
  if LastIndex < tsindex.PageCount then
     begin

     tsindex.ActivePageIndex := LastIndex ;
     tsindexChange(nil);
     end;

  {Re-load Doc Setings}
  dtDocExport.Date := ReadReportOp('SExportDocDate',Date).AsDateTime;
  dtDocExportTo.Date := ReadReportOp('SExportDocDateto',Date).AsDateTime;
  cbFileType.ItemIndex := cbFileType.Items.IndexOf(ReadReportOp('SExportDocType','( *.Xml )   Xml Database').AsSTring);
  OtherDir.Text := ExcludeTrailingPathDelimiter(ReadLongSysparam('SExportDocPath',CurrentUser));
//  edtLines.Text := ReadReportOp('SExportDocLine','TcDocLines').AsString;
  edtExportfile.Text := ReadLongSysparam('SExportDocHead',CurrentUser);
  edtExportLog.Text := ReadReportOp('SExportDocLog','TcDocOutLog').AsString;
  edtDatePeriod.Properties.MinDate := TmpDatesLimits[0];
  edtDatePeriod.Properties.MaxDate := TmpDatesLimits[1];
  cxdocs.Caption :=  gettextlang(1998);
  cxStock.Caption       :=  gettextlang(1999);
  cxdeb.Caption      :=  gettextlang(2000);
  cxaccounts.Caption     :=  gettextlang(2001);
  cxcreditors.Caption    :=  gettextlang(2002);
  cxpostedbatch.Caption       :=  gettextlang(2003);
 { CheckAndAdd(2004 ,'Export To');
  CheckAndAdd(2005 ,'File Type');
  CheckAndAdd(2006 ,'Export Files Name');
  CheckAndAdd(2007 ,'File Name');
  CheckAndAdd(2008 ,'Log File');
  CheckAndAdd(2009 ,'Range');
  CheckAndAdd(2010 ,'From');
  CheckAndAdd(2011 ,'To');
  CheckAndAdd(2012 ,'Date Period');
  CheckAndAdd(2013 ,'&Export');    }

  Label5.Caption       :=  gettextlang(2004);
  Label10.Caption       :=  gettextlang(2005);
  gbFiles.Caption       :=  gettextlang(2006);
  Label11.Caption       :=  gettextlang(2007);
  Label13.Caption       :=  gettextlang(2008);
  gbRanges.Caption       :=  gettextlang(2009);
  lblDatePeriod.Caption       :=  gettextlang(2012);
  BtnOk.Caption       :=  gettextlang(2013);
  BtnCancel.Caption := gettextlang(828); // close
  BGRange.Caption       :=  gettextlang(2009);
  LFrom.Caption       :=  gettextlang(2010);
  LFrom2.Caption       :=  gettextlang(2010);
  LTo.Caption       :=  gettextlang(2011);
  LTo2.Caption       :=  gettextlang(2011);

  if fmMain.PluginIteractClass.ProcessBatch ='GOEXPORT' then
     begin
        tsindex.ActivePage := cxpostedbatch ;
        PageControl1.ActivePageIndex:=1;
        OtherDir.Text := ExtractFilePath(DMTCCoreLink.TheZConnection.Database) ;
        edtExportfile.Text := 'Trn' + formatdateTime('yyyymmddhhnn',now) ;
        cbFileType.ItemIndex := 4 ;
        BtnOkClick(self);
        Timer1.Enabled := True ;
        CheckBox1.Checked := False ;
     end;
end;

procedure TfmExportData.BitBtn3Click(Sender: TObject);
Var
  Temp:string;
begin
  Temp:=OtherDir.Text;
  if Trim(Temp)='' then
    Temp := TDMTCCoreLink.GetLocalBaseDir;
  if SelectDIrectory(GetTextLang(905){'Select Backup target'},'',Temp) then
     OtherDir.Text:=Temp;
end;

procedure TfmExportData.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmExportData.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;

end;

procedure TfmExportData.edtFromEnter(Sender: TObject);
begin
  edtFrom.Color := clHighlight;
  if tsindex.ActivePage=cxStock then
    ReturnLookup := CallLookup(FromID, 7)
  else if tsindex.ActivePage=cxaccounts then
    ReturnLookup := CallLookup(FromID, 1)
  else if tsindex.ActivePage=cxdeb then
    ReturnLookup := CallLookup(FromID, 3)
  else if tsindex.ActivePage=cxcreditors then
    ReturnLookup := CallLookup(FromID, 4)
  else if tsindex.ActivePage=cxpostedbatch then
  begin
     CallNewLookup(30,True);
     ReturnLookup:=IntToStr(ReturnBatch.WBatchID);
  end;
  if ReturnLookup <> 'ESC' then
    edtFrom.Text := ReturnLookup;
  edtFrom.Color := clWindow;
  SelectNext(ActiveControl, True, True);
  if tsindex.ActivePage=cxpostedbatch then
  sFromID:= edtFrom.Text
  else
  sFromID:=ZipAccountCode(edtFrom.Text);
end;

procedure TfmExportData.edtToEnter(Sender: TObject);
begin
  edtTo.Color := clHighlight;
  if tsindex.ActivePage=cxStock then
    ReturnLookup := CallLookup(FromID, 7)
  else if tsindex.ActivePage=cxaccounts then
    ReturnLookup := CallLookup(FromID, 1)
  else if tsindex.ActivePage=cxdeb then
    ReturnLookup := CallLookup(FromID, 3)
  else if tsindex.ActivePage=cxcreditors then
    ReturnLookup := CallLookup(FromID, 4)
  else if tsindex.ActivePage=cxpostedbatch then
  begin
     CallNewLookup(30,True);
     ReturnLookup:=IntToStr(ReturnBatch.WBatchID);
  end;
  if ReturnLookup <> 'ESC' then
    edtTo.Text := ReturnLookup;
  edtTo.Color := clWindow;
  SelectNext(ActiveControl, True, True);
  if tsindex.ActivePage=cxpostedbatch then
  sToID:= edtTo.Text
  else
  sToID:= ZipAccountCode(edtTo.Text);
end;

procedure TfmExportData.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
       if Key =112 then
        begin
             HtmlShowTopic(238);
             key := 0;

        end;
end;

procedure TfmExportData.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false ;
 Close ;
end;

procedure TfmExportData.tsindexChange(Sender: TObject);
begin
  if tsindex.ActivePageIndex= 0 then
    PageControl1.ActivePageIndex:=0
  else
    PageControl1.ActivePageIndex:=1;
  lblDatePeriod.Visible := False;
  edtDatePeriod.Visible := False;
  cbExportdocs.Visible := False;
  if tsindex.ActivePage=cxpostedbatch then
  begin
    lblDatePeriod.Visible := True;
    edtDatePeriod.Visible := True;
    cbExportdocs.Visible := True;
  end;
  CheckBox1.Visible := edtDatePeriod.Visible;
end;

end.
