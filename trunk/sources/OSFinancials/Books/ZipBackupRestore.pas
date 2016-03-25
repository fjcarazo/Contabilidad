(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ZipBackupRestore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs,   Gauges,
  FileCtrl, Mask,  ToolWin,
  UosfResources, DADump, UniDump, DB, DBAccess, Uni, MemDS,
  DAScript, UniScript, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxListView, AbBase, AbBrowse,
  AbZBrows, AbZipper, AbZipKit, AbSelfEx, AbComCtrls,AbArcTyp;


type
  TfmZipBackupRestore = class(TForm)
    StatusBar: TStatusBar;
    MainLeftPnl: TPanel;
    TopPanel: TPanel;
    lvSetofBooks: TcxListView;
    BottPnl: TPanel;
    Memo1: TMemo;
    Panel1: TPanel;
    T3FileListBox: TFileListBox;
    LedPnl: TPanel;
    RedLed: TImage;
    GreenLed: TImage;
    ButtonPanel: TPanel;
    btnClose: TBitBtn;
    Bevel1: TBevel;
    btnExec: TBitBtn;
    BtnStop: TBitBtn;
    ToolBar1: TToolBar;
    sbBackup: TToolButton;
    sbRestore: TToolButton;
    OpenDialog1: TOpenDialog;
    UniDump1: TUniDump;
    UniConnection1: TUniConnection;
    UniQuery1: TUniQuery;
    UniTransaction1: TUniTransaction;
    UniScript1: TUniScript;
    AbZipKit1: TAbZipKit;
    AbProgressBar1: TAbProgressBar;
    AbProgressBar2: TAbProgressBar;
    AbProgressBar3: TAbProgressBar;
    AbMakeSelfExe1: TAbMakeSelfExe;
    Panel2: TPanel;
    lblCapFrom: TLabel;
    lblCapTo: TLabel;
    Gauge1: TGauge;
    Label1: TLabel;
    LcbMail: TLabel;
    LCBSelfExtract: TLabel;
    lblFrom: TEdit;
    lblTo: TEdit;
    btnTo: TBitBtn;
    cbMail: TCheckBox;
    edtFileName: TEdit;
    BitBtn1: TBitBtn;
    CBSelfExtract: TCheckBox;
    cbBackupReports: TCheckBox;
    cbUniDump: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lvSetofBooksSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnExecClick(Sender: TObject);

    procedure initTableNames;

    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);

    procedure BtnStopClick(Sender: TObject);

    procedure btnToClick(Sender: TObject);
    procedure sbBackupClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


    procedure FormDestroy(Sender: TObject);
    procedure UniScript1Error(Sender: TObject; E: Exception; SQL: String;
      var Action: TErrorAction);
    procedure UniScript1BeforeExecute(Sender: TObject; var SQL: String;
      var Omit: Boolean);
    procedure UniDump1BackupProgress(Sender: TObject; ObjectName: string;
      ObjectNum, ObjectCount, Percent: Integer);
    procedure AbZipKit1ArchiveProgress(Sender: TObject; Progress: Byte;
      var Abort: Boolean);
    procedure AbZipKit1ArchiveItemProgress(Sender: TObject;
      Item: TAbArchiveItem; Progress: Byte; var Abort: Boolean);
 
  private
    InZipAction,isRestore : Boolean;

    { Private declarations }
    Procedure LedRed(vRed:Boolean);
    Procedure Backup;
    Procedure Restore;
    Function CancelOperation:Boolean;

  public
    ATableList,AErrorTableList : TStringlist ;
    LastOpenSet,LastErrors : String ;
    function GetSetOfBooksPath : String ;
    { Public declarations }
  end;

var
  fmZipBackupRestore: TfmZipBackupRestore;
  MemoLineID :integer;
  TmpLine : String;
  tcFileName:String='TcBackup.exe';
implementation

uses Database, GlobalFunctions, LanguageChoice, Main,
  SendEmailReport, TcVariables, DatabaseAccess, XRoutines, TcashClasses,
  OSFGeneralRoutines, UDMTCCoreLink, Variants;

{$R *.DFM}

Procedure TfmZipBackupRestore.LedRed(vRed:Boolean);
Begin
  if Vred then
  begin
    Greenled.Visible := False;
    BtnStop.Enabled := True;
    btnExec.Enabled := False;
    btnClose.Enabled := False;
  end
  else
  begin
    BtnStop.Enabled := False;
    btnExec.Enabled := True;
    Greenled.Visible:=True;
    btnClose.Enabled := True;
  end;
end;




procedure TfmZipBackupRestore.FormShow(Sender: TObject);
Var
  lvItems,lvSelectedItem:TListItem;
  i : Integer ;
begin
  DMTCCoreLink.LoadImage(btnClose.Glyph,'Close');

  lvSelectedItem := nil ;
  lvSetofBooks.Items.Clear;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(GetTextLang(926));
  // If No Set of books ?
  edtFileName.Text := '' ;
  TheGlobalDataObject.Books.ScannBooksDir(IncludeTrailingPathDelimiter(TDMTCCoreLink.GetLocalBaseDir+'books'));

  for i := 0 to  TheGlobalDataObject.Books.Count -1 do
  // if FileExists(TheGlobalDataObject.Books[i].Database) then
  begin
    lvItems:=lvSetofBooks.Items.Add;
    lvItems.Caption := TheGlobalDataObject.Books[i].Name;
    lvItems.SubItems.Add(TheGlobalDataObject.Books[i].Database);
    lvItems.data := TheGlobalDataObject.Books[i] ;
    lvItems.Selected := TheGlobalDataObject.Books[i].Selected ;
    
    if lvItems.Selected then
      begin
        lvSelectedItem := lvItems ;
        edtFileName.Text := lvSelectedItem.Caption + FormatDateTime('yyyymmddhhnn',now);
      end;
  end;
  if lvSelectedItem <> nil then lvSelectedItem.Selected := true;
  if lvSelectedItem <> nil then lvSelectedItem.MakeVisible(false);
  if dmdatabase.ZMainconnection.Connected then
  begin
    lblTo.Text:= GetBackupPath;
    lblFrom.Text:=dmdatabase.ZMainconnection.database;
  end
  else
  begin
   // lblTo.Text:= '';
   // lblFrom.Text:='';
  end;


  Caption:= GetTextLang(891);{ 'Backup Set of books'};
  lcbMail.Caption:= GetTextLang(2112);
  
  lCBSelfExtract.Caption:= GetTextLang(2111);
  isRestore := not isRestore ;
  sbBackupClick(Sender);
  Label1.Caption:= GetTextLang(2007);
  if edtFileName.Text = '' then
  edtFileName.Text := 'osfBackup' + FormatDateTime('yyyymmddhhnn',now);
  CBSelfExtract.Checked := (uppercase(ReadT3IniFile('BACKUP','SELFEXTRACT','TRUE')) = 'TRUE');
   btnClose.Caption := GetTextLang(169) ;
  cbBackupReports.Caption := GetTextLang(2956);// Backup reports

end;

Function TfmZipBackupRestore.CancelOperation:Boolean;
begin
 Result:=True ;
 if not InZipAction then exit ;

  Result:=False;
  if sbRestore.Down then
    Result:= OSFMessageDlg(GetTextLang(501){'Do you wish to continue with the backup?'}+#13#10+'', mtinformation, [mbYes,mbNo], 0)=mrNo
  else
    Result:= OSFMessageDlg(GetTextLang(501){'Do you wish to continue with the backup?'}+#13#10+'', mtinformation, [mbYes,mbNo], 0)=mrNo;
  if Result then
  begin
     CancelFtp := True;

  end;

end;

procedure TfmZipBackupRestore.btnCloseClick(Sender: TObject);
begin

  if CancelOperation then
  CLose;
end;

procedure TfmZipBackupRestore.lvSetofBooksSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin

  if Selected then
  begin
    lvSetofBooks.Style.Color := clWindow ;
    try
    T3FileListBox.Directory:=ExtractFilePath(Item.SubItems[0]);
    except

    end;
    lblTo.Text :=  GetBackupPath;
   if Item.Data <> nil then
      begin
         lblTo.Text := ReadT3IniFile('BACKUP','LASTPATH'+TBooksCollectionItem(Item.Data).Name,TDMTCCoreLink.GetLocalBaseDir);
      end else
         lblTo.Text := ReadT3IniFile('BACKUP','LASTPATH',TDMTCCoreLink.GetLocalBaseDir);

    edtFileName.Text := Item.Caption + FormatDateTime('yyyymmddhhnn',now);
    lblFrom.Text:=ExtractFilePath(Item.SubItems[0]);
    btnExec.Enabled := True;
    BtnStop.Enabled := False;
  {  cbUniDump.Visible :=  TBooksCollectionItem(Item.Data).Server <> '' ;
    if not cbUniDump.Visible then
          cbUniDump.Checked := false ;  }
  end;
end;

procedure TfmZipBackupRestore.btnExecClick(Sender: TObject);
Var
    MailAdd,MailID,MailSvr,aPWD:String;
    procedure cleartables ;
       var
       i ,loopnr : Integer ;
       HasData : Boolean ;
     begin
      initTableNames ;
       for loopnr := 0 to 10 do
           begin
             HasData := False ;
              for i := 0 to ATableList.Count-1 do
                 begin
                   UniQuery1.SQL.Text := 'select count(*) from ' +  AnsiQuotedStr(ATableList[i],'"') ;
                   UniQuery1.open ;
                    if not UniQuery1.IsEmpty then
                       begin
                         try
                         HasData := True ;
                         UniQuery1.SQL.Text := 'delete from ' +  AnsiQuotedStr(ATableList[i],'"');
                         UniQuery1.ExecSQL ;
                         except
                         end;
                       end;
                 end;
               if not hasdata then exit ;
           end ;
     end;
     var
      i : Integer ;
       TableName : String ;
begin
CancelFtp := False ;
  tcFileName := edtFileName.Text;
  if Pos('.',tcFileName)<=0 then
    tcFileName:=tcFileName+'.exe';
  // done : Pieter This wil prevent .zip from loading
  if sbBackup.Down then
    if CBSelfExtract.Checked then
      tcFileName := ChangeFileExt(tcFileName,'.exe') else
      // done : Pieter Just a zip file
      tcFileName := ChangeFileExt(tcFileName,'.zip') ;
    /// reflect new filename
    edtFileName.Text := tcFileName ;
  LedRed(True);
    InZipAction := true ;
  try
  if Not (sbRestore.Down or sbBackup.Down) then
  begin
    OSFMessageDlg(GetTextLang(818){'Select Beckup or Restore Mode'}, mtError, [mbOk], 0);
    LedRed(False);
    Exit;
  end;
  If sbRestore.Down then
   begin
      if OSFMessageDlg(GetTextLang(519){'This will seriously effect your set of books , are you sure you want to clear this set of books ?'}, mtconfirmation , [mbyes, mbno,mbHelp], 237) <> mryes Then
        exit ;
     if UpperCase(ExtractFileExt(edtFileName.Text)) = '.SQL' then
       cbUniDump.Checked :=True ;
      if cbUniDump.Checked then
       begin
          try
      if OSFMessageDlg('Unidump SQL restore can only work if you use the same database as used for the backup.'+#13+#10+'Are you sure you want to continue?', mtconfirmation , [mbyes, mbno,mbHelp], 237) <> mryes Then
           exit ;
          LastErrors:= '' ;
          DmDatabase.ConnectToBooks(TBooksCollectionItem(lvSetofBooks.Selected.Data));
          UniConnection1.Database := DMTCCoreLink.TheZConnection.Database ;
          UniConnection1.Username := DMTCCoreLink.TheZConnection.Username ;
          UniConnection1.Password := DMTCCoreLink.TheZConnection.Password ;
          UniConnection1.Server   := DMTCCoreLink.TheZConnection.Server ;
          UniConnection1.ProviderName   := DMTCCoreLink.TheZConnection.ProviderName ;
          DoCloseSetOfBooks;
           UniConnection1.Connect ;
          edtFileName.Text := ChangeFileExt(edtFileName.Text,'.sql') ;
          // clear all tables
          initTableNames ;
          clearTables ;
          UniConnection1.Disconnect ;
          UniConnection1.Connect ;
           UniConnection1.StartTransaction ;
          AErrorTableList.Clear ;
          UniScript1.SQL.LoadFromFile(IncludeTrailingPathDelimiter( lblTo.Text) +  edtFileName.Text);
          UniScript1.Execute ;
          for i := UniScript1.Statements.Count -1 downto 0 do
             begin
                TableName := copy(UpperCase(UniScript1.Statements[i].SQL),pos('INSERT INTO',UpperCase(UniScript1.Statements[i].SQL))+ 12,255) ;
                TableName := copy(TableName,1,pos('VALUES',UpperCase(TableName))-1) ;
                TableName := Trim(TableName) ;
                if copy(TableName,1,1) = '"' then
                  delete(TableName,1,1) ;
                if copy(TableName,LENGTH(TableName),1) = '"' then
                  delete(TableName,LENGTH(TableName),1) ;
                 if AErrorTableList.IndexOf(TableName) = -1 then
                 UniScript1.Statements.Delete(i);
             end;
          // OSFMessageDlg(AErrorTableList.Text,mtInformation,[mbok],0);
            AErrorTableList.Clear ;
            UniScript1.Execute ;
            for i := UniScript1.Statements.Count -1 downto 0 do
             begin
                TableName := copy(UpperCase(UniScript1.Statements[i].SQL),pos('INSERT INTO',UpperCase(UniScript1.Statements[i].SQL))+ 12,255) ;
                TableName := copy(TableName,1,pos('VALUES',UpperCase(TableName))-1) ;
                TableName := Trim(TableName) ;
                if copy(TableName,1,1) = '"' then
                  delete(TableName,1,1) ;
                if copy(TableName,LENGTH(TableName),1) = '"' then
                  delete(TableName,LENGTH(TableName),1) ;
                 if AErrorTableList.IndexOf(TableName) = -1 then
                 UniScript1.Statements.Delete(i);
             end;
          //OSFMessageDlg(AErrorTableList.Text,mtInformation,[mbok],0);
          AErrorTableList.Clear ;
           UniScript1.Execute ;
          if AErrorTableList.Text <> '' then
          Memo1.Lines.Add(AErrorTableList.Text);
          Memo1.Lines.add('');
          Memo1.Lines.add(GetTextLang(908)+'...'{'Restore completed ...'});
          LedRed(False);
          OSFMessageDlg(GetTextLang(908){'The Restore process is completed'}+#13#10+'', mtinformation, [mbOk], 0);
          Memo1.Lines.add('');
          UniConnection1.Commit ;
          finally
           if UniConnection1.InTransaction then
             UniConnection1.Rollback ;
            UniConnection1.Disconnect ;
          end;
            InZipAction := false ;
          Gauge1.Progress:=0;
          Gauge1.Visible:=False;
          LedRed(False);
          cursor:=crDefault;
          exit ;
       end else
       begin
       if not FileExists(TBooksCollectionItem(lvSetofBooks.Selected.Data).Database) then
          begin
            Memo1.Lines.add('Warning original books not found! ');
            // exit ;
          end;
        Restore
       end;
  end  else // Backup
  begin
    if lvSetofBooks.SelCount<=0 then
    begin
      OSFMessageDlg(GetTextLang(699){'No set of Books Selected '}, mtError, [mbOk], 0);
      LedRed(False);
      exit;
    end;
        if cbUniDump.Checked then
       begin
          try
          LastErrors:= '' ;
          DmDatabase.ConnectToBooks(TBooksCollectionItem(lvSetofBooks.Selected.Data));
          UniConnection1.Database := DMTCCoreLink.TheZConnection.Database ;
          UniConnection1.Username := DMTCCoreLink.TheZConnection.Username ;
          UniConnection1.Password := DMTCCoreLink.TheZConnection.Password ;
          UniConnection1.Server   := DMTCCoreLink.TheZConnection.Server ;
          UniConnection1.ProviderName   := DMTCCoreLink.TheZConnection.ProviderName ;
          DoCloseSetOfBooks;
          UniConnection1.Connect ;
          UniDump1.Connection := UniConnection1 ;
          initTableNames;
          UniDump1.TableNames := StringReplace(ATableList.Text,#13+#10,',',[rfReplaceAll]) ;
          edtFileName.Text := ChangeFileExt(edtFileName.Text,'.sql') ;
          try
            UniDump1.SQL.SaveToFile(IncludeTrailingPathDelimiter( lblTo.Text) +  edtFileName.Text);
            DeleteFile(IncludeTrailingPathDelimiter( lblTo.Text) +  edtFileName.Text) ;
          except
           raise Exception.Create('File cannot be created! ' + IncludeTrailingPathDelimiter( lblTo.Text) +  edtFileName.Text);
          end;
          UniDump1.BackupToFile(IncludeTrailingPathDelimiter( lblTo.Text) +  edtFileName.Text);
          if LastErrors <> '' then
            osfmessagedlg('Errors ' + LastErrors,mterror,[mbok],0)
            else
           if not CancelFtp then
             if Not cbMail.Checked then
              OSFMessageDlg(GetTextLang(901){'The backup process is completed'}+#13#10+'', mtinformation, [mbOk], 0);
          finally
             UniConnection1.Disconnect ;
          end;
          exit ;
       end else
       begin
        Backup;
        if not FileExists(TBooksCollectionItem(lvSetofBooks.Selected.Data).Database) then
          begin
            Memo1.Lines.add('Error file not found use sql backup!');
            exit ;
          end;
       end;
    Try
       DmDatabase.ConnectToBooks(TBooksCollectionItem(lvSetofBooks.Selected.Data));
       // ChangeSetofBooks(T3FileListBox.Directory);
        LastBackupFileName(edtFileName.Text,lblTo.Text);
        WriteT3IniFile('BACKUP','LASTPATH'+TBooksCollectionItem(lvSetofBooks.Selected.Data).Name,lblTo.Text);
    Finally
      DoCloseSetOfBooks;
    end;
  end;
  finally
    InZipAction := false ;
  Gauge1.Progress:=0;
  Gauge1.Visible:=False;
  LedRed(False);
  cursor:=crDefault;
  CancelFtp := False ;
  end;
end;

procedure TfmZipBackupRestore.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  aRect: TRect;
begin
 if Panel = StatusBar.Panels[2] then begin
    aRect := Rect;
    InflateRect(aRect,-1 ,-1);
    Gauge1.BoundsRect := aRect;
  end;
  if Panel = StatusBar.Panels[1] then begin
    aRect := Rect;
    InflateRect(aRect,-1 ,0);
    LedPnl.BoundsRect := aRect;
  end;
end;

procedure TfmZipBackupRestore.FormCreate(Sender: TObject);
begin
  Gauge1.Parent:=StatusBar;
  LedPnl.parent:=StatusBar;
   ATableList := TStringlist.Create ;
   AErrorTableList := TStringlist.Create ;
end;

procedure TfmZipBackupRestore.Memo1Enter(Sender: TObject);
begin
  lvSetofBooks.SetFocus;
end;

procedure TfmZipBackupRestore.BtnStopClick(Sender: TObject);
begin
 CancelOperation;
end;




procedure TfmZipBackupRestore.btnToClick(Sender: TObject);
Var
  Temp:string;
begin
   Temp:=lblto.Text;
   if Trim(Temp)='' then
    Temp := ApplicationPath;
   Temp:=ExcludeTrailingPathDelimiter(Temp);
   if SelectDIrectory(GetTextLang(905){'Select Backup target'},'',Temp) then
     lblTo.Text:=Temp;
   

end;

Function SendBackup(aPath:String):Boolean;
var
 EmailText,EmailToname , EMailDesc,EmailTopic: String ;
begin
  fmZipBackupRestore.Memo1.Lines.Add('Creating Email ...');
  EmailText := ReadT3IniFile('INFO','EMAIL','info@osfinancials.org');
  EMailDesc := ReadT3IniFile('INFO','EMAILDESC','Your Message');
  EmailToname  := ReadT3IniFile('INFO','EMAILNAME','osFinancials');
  EmailTopic  := ReadT3IniFile('INFO','EMAILTOPIC','osFinancials Backup');
  SendaMapiMail(EmailTopic,EMailDesc,IncludeTrailingPathDelimiter(aPath)+fmZipBackupRestore.edtFileName.text,'your name','youremail',EmailToname,EmailText);
  OSFMessageDlg(GetTextLang(901){'The backup process is completed'}+#13#10+'', mtinformation, [mbOk], 0);
end;

procedure TfmZipBackupRestore.AbZipKit1ArchiveItemProgress(Sender: TObject;
  Item: TAbArchiveItem; Progress: Byte; var Abort: Boolean);
begin
if not isRestore then

Memo1.Lines[MemoLineID]:='* ' + Item.FileName
else
Memo1.Lines[MemoLineID]:='  '+GetTextLang(909){Restored}+'   ' + Item.FileName ;


    if CancelFtp then
      raise Exception.Create(BtnStop.Caption);

end;

procedure TfmZipBackupRestore.AbZipKit1ArchiveProgress(Sender: TObject;
  Progress: Byte; var Abort: Boolean);
begin
  if MemoLineID>0 then
    Memo1.Lines[MemoLineID]:= TmpLine + '  ' + IntToStr(Progress)+'%';
    if CancelFtp then
      raise Exception.Create(BtnStop.Caption);
end;

Procedure TfmZipBackupRestore.Backup;
Var
  DrvStr : String;
  Tmp,
  FromDir ,
  ToDir,S1,S2   : string;
  DrvType : Integer;
  BExit  : Boolean;
  NumZipped ,i:Integer;
  AFileStream : TFileStream ;
  Line : String[60] ;
  CompName :  String ;
  CompnameSize : Cardinal ;
  paramstr1,paramstr2,paramstr3 : Ansistring ;
begin
DMTCCoreLink.TheZConnection.Disconnect ;
  Memo1.Lines.Clear;
  NumZipped :=0;
  TmpLine:='';
  Memo1.Lines.Add(GetTextLang(912){'Starting Backup... '});
  MemoLineID:=1;
  lblFrom.Text:=ExtractFilePath(lblFrom.Text);
  Tmp:= lblFrom.Text+ 'Books.FDB';
  if Not FileExists(Tmp) then
    begin
       OSFMessageDlg(GetTextLang(913){'No valid set of books found in :}+#13#10+'"'+lblFrom.Text +'"',mtError,[mbok],0);
       LedRed(False);
       Exit;
  end;
   // try to see if its already locked
  dmDatabase.ZMainconnection.Disconnect ;
  Sleep(1000);
  AFileStream := TFileStream.Create(Tmp,fmShareExclusive);
  // if theres no exception then theres noone in this database
  AFileStream.free ;

    ToDir:=lblTo.Text;
    if Pos(':',ToDir)=0 then
     if Length(ToDir) = 1 then
    begin
      ToDir:=ToDir+':';
      lblTo.Text:=ToDir;
    end;
    DrvType := GetDrvType(ToDir);
    Case DrvType of
    255 : begin
          // OSFMessageDlg(GetTextLang(914){'Can Not use this drive. Map it and try angain...'},mtError,[mbok],0);
          // Memo1.Lines.Add(GetTextLang(915){'Can not run Backup ...'});
          // LedRed(False);
          // exit;
         end;
    DRIVE_REMOVABLE :
       Begin
       {$I-}

         ChDir(ExtractFileDrive(Trim(ToDir)) +'\');
         DrvType := IOResult;
         BExit := False;
         if DrvType<>0 then
           while (DrvType<>0) AND (Not BExit) do
           begin
             if OSFMessageDlg(GetTextLang(723){'Insert Disk in '}+'  '+ToDir{GetTextLang(634){}, mtconfirmation, [mbOk,mbCancel], 0) = mrCancel then
               BExit:=True;
             ChDir(ExtractFileDrive(Trim(ToDir)) +'\');
             DrvType := IOResult;
           end;
       {$I+}
         if BExit then
         begin
          Memo1.Lines.Add(GetTextLang(916){'Backup incompleted ...'});
          Memo1.Lines.Add(GetTextLang(917){'Set of books Backup Process Canceled by User'});
          LedRed(False);
          exit;
         end;
       end;
    3,4: //DRIVE_FIXED // DRIVE_REMOTE
       Begin end;
    Else
      OSFMessageDlg(lblTo.Text+#13#10+GetTextLang(753){'Invalide Media Type for Backup'},mtError,[mbok],0);
      LedRed(False);
      Exit;
    end;
    // Add end Dash
    ToDir:=IncludeTrailingBackslash(ToDir);
    ForceDirectories(ToDir);

    RecycleFile(ToDir+tcFileName);
    Gauge1.Progress:=0;
    Gauge1.Visible:=True;
    AbZipKit1.FileName:=ChangeFileExt(ToDir+tcFileName,'.zip') ;
    AbZipKit1.BaseDirectory:= ExtractFilePath(lblFrom.Text);
    AbZipKit1.ZipfileComment := 'zipfolder=' + ExtractFilePath(lblFrom.Text) + #13 + #10 +
    'name='  +lvSetofBooks.Selected.Caption + #13 + #10 + 'date=' + FormatDateTime('YYYYMMDD',now)
    + #13 + #10 + 'time=' + FormatDateTime('HHNNSS',now);


    if cbBackupReports.Checked then
    begin
    //  if ReadT3IniFile('INFO','freereports','0') = '1' then
    //  TosfZip.FilesList.Add(ApplicationPath + 'bin\reports\*.*' ) ;

      AbZipKit1.AddFiles(DMTCCoreLink.GetLocalPluginDir + 'reports\*.*',faAnyFile ) ;
    end;
    // delete dlls
    for I := AbZipKit1.Count-1 downto 0 do
       if UpperCase(ExtractFileExt(AbZipKit1.Items[i].FileName)) = '.DLL' then
          AbZipKit1.DeleteAt(i);


    NumZipped:=T3FileListBox.Items.Count;
    // Add File to be Zipped
   AbZipKit1.AddFiles(AbZipKit1.BaseDirectory +'*.*',faAnyFile ) ;
    if lvSetofBooks.Selected.Data <> nil then
      begin
        s1 := TBooksCollectionItem(lvSetofBooks.Selected.Data).GetFileSaveDir ;
        if  s1 <> AbZipKit1.BaseDirectory then
            AbZipKit1.AddFiles(s1 +'*.*',faAnyFile ) ;
      end;
    // AbZipKit1.ArchiveType := AbZipKit ;
    AbZipKit1.BaseDirectory:= TDMTCCoreLink.GetLocalBaseDir;
    try


       // done : Pieter Just a zip file
       AbZipKit1.FileName:=  ChangeFileExt(ToDir+tcFileName,'.zip') ;
       AbZipKit1.ZipArchive.Save ;

       NumZipped := AbZipKit1.ZipArchive.Count ;
   if CBSelfExtract.Checked then
       begin

       paramstr1 := ApplicationPath+ 'zipstub.exe' ;
       paramstr2 :=   ChangeFileExt(ToDir+tcFileName,'.exe');
      // AbZipKit1.FileName  := ChangeFileExt(paramstr2,'.zip');
      // AbZipKit1.ZipArchive.Save ;
        AbMakeSelfExe1.StubExe := paramstr1 ;
        AbMakeSelfExe1.ZipFile :=AbZipKit1.FileName ;
        AbMakeSelfExe1.SelfExe := ChangeFileExt(ToDir+tcFileName,'.exe');
        AbMakeSelfExe1.Execute ;
         AbZipKit1.CloseArchive ;
        DeleteFile(ChangeFileExt(ToDir+tcFileName,'.zip'));
      // NumZipped := AbZipKit1.ZipArchive.Count  ;
       end ;
       Memo1.Lines.Add(IntToStr(NumZipped)+' '+GetTextLang(918){Files compressed'});
       {Send To Mail}
       if cbMail.Checked then
          SendBackup(lblTo.Text);

    except
        begin
         OSFMessageDlg(GetTextLang(919){'Backup Canceled by User'},mtError,[mbok],0);
         Screen.Cursor := crDefault;
         Memo1.Lines.Add(GetTextLang(919){'Backup aborted'});
         CancelFtp := True ;
        end
    end;
  Memo1.Lines.add('');
  Memo1.Lines.add(GetTextLang(900));//'Backup completed ...');
  LedRed(False);
  if not CancelFtp then
    if Not cbMail.Checked then
    OSFMessageDlg(GetTextLang(901){'The backup process is completed'}+#13#10+'', mtinformation, [mbOk], 0);
  Memo1.Lines.add('');
    Screen.Cursor := crDefault;
end;


Procedure TfmZipBackupRestore.Restore;
Var
  DrvStr : String;
  Tmp,
  FromDir ,
  ToDir,FtpFile   : string;
  DrvType : Integer;
  BExit  : Boolean;
  NumZipped, i :Integer;
begin

  Memo1.Lines.Clear;
  NumZipped :=0;
  TmpLine:='';
  Memo1.Lines.Add(GetTextLang(920){'Starting Restore... '});
  MemoLineID:=1;
  LblTo.Text:=IncludeTrailingBackslash(LblTo.Text);
  FromDir := LblTo.Text+tcFileName;
  ToDir :=lblFrom.Text;
  
  if Not Fileexists(FromDir) then
  begin
     OSFMessageDlg(GetTextLang(817){'Backup file not found in'}+#13#10+FromDir, mtError, [mbOk], 0);
     LedRed(False);
     Exit;
  end;
  AbZipKit1.FileName := FromDir;
  repeat
     BExit := False;
     try
        AbZipKit1.ZipArchive.Load ;

        if AbZipKit1.Count>0 then
        begin
           for i := 0 to AbZipKit1.Count -1 do
             if UpperCase(ExtractFileName(StringReplace(AbZipKit1.Items[i].FileName,'/','\',[rfreplaceAll]))) = 'BOOKS.FDB' then
               begin
                Tmp:= TDMTCCoreLink.GetLocalBaseDir +'..\'+ ExtractFilePath(StringReplace(AbZipKit1.Items[i].FileName,'/','\',[rfreplaceAll])) ;
                break ;
               end;
          if (tmp<>'') AND (tmp<>'\') then
          begin
            AbZipKit1.BaseDirectory:= Tmp ;
          end
          else
          begin
            AbZipKit1.BaseDirectory := TDMTCCoreLink.GetLocalBaseDir  ;
          end;
          ToDir:= Tmp ;
          tmp :=TDMTCCoreLink.GetLocalBaseDir +'books\' +GetLatFolder(tmp);
          if OSFMessageDlg(GetTextLang(921){'Your Set of books will be restored in :'}+#13#10#13#10+ tmp + #13#10#13#10+GetTextLang(642){'Do you want to continue ?'},mtinformation,[mbYes,mbNo],0)<>mrYes then
          begin
            LedRed(False);
            Memo1.Lines.Add(GetTextLang(919){'Operation Canceled by the User'});
            Exit;
          end;
        end;
     except

        begin
          if OSFMessageDlg(GetTextLang(910){'Insert Last Disk of Disk Set.}+#13#10+GetTextLang(911){Press Yes to continue or No to abort'},
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              BExit := True;
              //TosfZip.ZipName := tmpName;
            end
           else
              BExit := False;
        end;
     end;
   until (Not BExit);
   if AbZipKit1.FileName = '' then
   begin
     LedRed(False);
     Exit;
   end;
  try
   AbZipKit1.BaseDirectory := TDMTCCoreLink.GetLocalBaseDir +'..\' ;
   AbZipKit1.ExtractOptions := [eoCreateDirs] ;
   AbZipKit1.ZipArchive.ExtractFiles('*.*');
   NumZipped:= AbZipKit1.ZipArchive.Count  ;
   Memo1.Lines.Add(IntToStr(NumZipped)+' '+GetTExtLang(922){Files Restored'});
  except
    begin
     OSFMessageDlg(GetTextlang(919) {'Restore Canceled by User'},mtError,[mbok],0);
     Screen.Cursor := crDefault;
     Memo1.Lines.Add(GetTextlang(919){'Restore aborted'});
    end
  end;
  Memo1.Lines.add('');
  Memo1.Lines.add(GetTextLang(908)+'...'{'Restore completed ...'});
  LedRed(False);
  OSFMessageDlg(GetTextLang(908){'The Restore process is completed'}+#13#10+'', mtinformation, [mbOk], 0);
  Memo1.Lines.add('');
  Screen.Cursor := crDefault;
end;



procedure TfmZipBackupRestore.sbBackupClick(Sender: TObject);
begin
  if not isRestore then
  begin
    lblCapFrom.Caption:=GetTextLang(894);//'Restore From :';
    lblCapTo.Caption:=GetTextLang(893);{'Resotore To :'};
    Caption:=GetTextLang(898);{'Restore Set of books'};
    btnExec.Caption := GetTextLang(892);{ 'Restore'};
    Panel1.Color := $008A8AFF ;
    sbRestore.Down := true ;
    sbBackup.Down := false ;
    isRestore := true ;
  end
  else
  begin
    lblCapTo.Caption:= GetTextLang(896); {'Backup To :'};
    lblCapFrom.Caption:=GetTextLang(895);{'Backup From :'};
    Caption:=GetTextLang(899);{'Backup Set of books'};
    btnExec.Caption := GetTextLang(891); {'Backup'};
    Panel1.Color := $008CFF8C ;
    sbRestore.Down := false ;
    sbBackup.Down := true ;
    isRestore := false ;
  end;
  cbMail.Enabled := not isRestore;
  

end;

procedure TfmZipBackupRestore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then begin
   If sbRestore.Down then
     HtmlShowTopic(212)
   else
     HtmlShowTopic(101);
  key := 0;
 end;
 if Key =27 then
 begin
  btnCloseClick(Sender);
  Key:=0;
 end;
end;

procedure TfmZipBackupRestore.BitBtn1Click(Sender: TObject);
begin
  OpenDialog1.Title:=gettextlang(2114);
  OpenDialog1.InitialDir:=lblTo.Text;
  if OpenDialog1.Execute then
  begin
    lblTo.Text := ExtractFilePath(OpenDialog1.FileName);
    edtFileName.Text:= ExtractFileName(OpenDialog1.FileName);

  end;
end;

procedure TfmZipBackupRestore.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   WriteT3IniFile('BACKUP','SELFEXTRACT',BoolToStr(CBSelfExtract.Checked,true));
end;

function TfmZipBackupRestore.GetSetOfBooksPath: String;
begin

end;

 

procedure TfmZipBackupRestore.FormDestroy(Sender: TObject);
begin
  ATableList.free ;
  AErrorTableList.free ;
end;

procedure TfmZipBackupRestore.initTableNames;
var
 OldName : String ;
 OldIndex : Integer ;
begin
        UniConnection1.GetTableNames(ATableList,False );
        if ATableList.IndexOf('TRANSACTASBATCH') <> -1 then
           ATableList.Delete(ATableList.IndexOf('TRANSACTASBATCH'));
        if ATableList.IndexOf('V_ACCOUNT') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_ACCOUNT'));
        if ATableList.IndexOf('V_BATTYPES') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_BATTYPES'));
        if ATableList.IndexOf('V_GROUPS') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_GROUPS'));


        if ATableList.IndexOf('V_OPENDOCAMOUNT') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_OPENDOCAMOUNT'));
        if ATableList.IndexOf('V_TRANSACTASBATCHWITHTRANSID') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_TRANSACTASBATCHWITHTRANSID'));
        if ATableList.IndexOf('V_TRANSACTTAXENTRIES') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_TRANSACTTAXENTRIES'));
        if ATableList.IndexOf('V_TYPES') <> -1 then
           ATableList.Delete(ATableList.IndexOf('V_TYPES'));
    OldIndex := ATableList.indexof('GROUPS') ;
    if OldIndex <> 0 then
      begin
        OldName := ATableList[0] ;
        ATableList[0] := 'GROUPS' ;
        ATableList[OldIndex] := OldName ;
      end;

end;

procedure TfmZipBackupRestore.UniScript1Error(Sender: TObject;
  E: Exception; SQL: String; var Action: TErrorAction);
var
   TableName : String ;

begin
 if LastErrors <> '' then
  LastErrors := LastErrors+ #13+#10;
  LastErrors := LastErrors + sql+#13+#10+ E.Message ;
  TableName := copy(UpperCase(SQL),pos('INSERT INTO',UpperCase(SQL))+ 12,255) ;
  TableName := copy(TableName,1,pos('VALUES',UpperCase(TableName))-1) ;
  TableName := Trim(TableName) ;
  if copy(TableName,1,1) = '"' then
    delete(TableName,1,1) ;
  if copy(TableName,LENGTH(TableName),1) = '"' then
    delete(TableName,LENGTH(TableName),1) ;
  if (TableName ='') and (SQL <> '') then
   AErrorTableList.Add(SQL);
  if AErrorTableList.IndexOf(TableName) = -1 then
   AErrorTableList.Add(TableName);
  if AErrorTableList.IndexOf(E.Message) = -1 then
   AErrorTableList.Add(E.Message);
   Action := eaContinue  ;
end;

procedure TfmZipBackupRestore.UniDump1BackupProgress(Sender: TObject;
  ObjectName: string; ObjectNum, ObjectCount, Percent: Integer);
begin

 if Memo1.Lines.Count = 0 then
 Memo1.Lines.Add(IntToStr(Percent)+'..100')
 else
 Memo1.Lines[Memo1.Lines.Count-1] := ObjectName +' object nr:' + IntToStr(ObjectNum) +' process ' +  IntToStr(Percent)+'..100' ;
end;

procedure TfmZipBackupRestore.UniScript1BeforeExecute(Sender: TObject;
  var SQL: String; var Omit: Boolean);
begin

 if Memo1.Lines.Count = 0 then
 Memo1.Lines.Add(IntToStr(UniScript1.EndLine)+'..'+IntToStr(UniScript1.SQL.Count))
 else
 Memo1.Lines[Memo1.Lines.Count-1] := IntToStr(UniScript1.EndLine)+'..'+IntToStr(UniScript1.SQL.Count) ;
end;

end.
