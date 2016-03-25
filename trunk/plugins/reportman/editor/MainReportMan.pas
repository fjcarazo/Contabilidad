unit MainReportMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB,  rpalias, rpmdesignervcl,
  rpcompobase, rpvclreport, DBTables,rpreport, ImgList,rptypeval,rpmdconsts,rpbasereport,
   DBAccess , Uni, virtualtable,
  Buttons,jpeg,UOSFVisuals, MemDS;

type
  TfrMainReportMan = class(TForm)
    BAdd: TButton;
    BEdit: TButton;
    VCLReport1: TVCLReport;
    BDelete: TButton;
    QTestSql: TuniQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    TVReports: TTreeView;
    BNewReport: TButton;
    Button4: TButton;
    ImageList1: TImageList;
    QExecSQL: TuniQuery;
    tblOpReport: TuniTable;
    tblOpReportWOptionID: TAutoIncField;
    tblOpReportStrOption: TStringField;
    tblOpReportSOptionValue: TStringField;
    tblOpReportWOptionTypeID: TIntegerField;
    Lselectedrep: TLabel;
    RpDesignerVCL1: TRpDesignerVCL;
    BitBtn1: TBitBtn;
    EDefDocid: TEdit;
    BParams: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cbdonotUpdatelist: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BPrintClick(Sender: TObject);
    procedure TVReportsDblClick(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure TVReportsEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure BDeleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BNewReportClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVReportsChange(Sender: TObject; Node: TTreeNode);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BParamsClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure SaveToStream(Stream: TStream;VCLReport1: TRpReport);
    { Private declarations }
  public
    reportDir : String ;
    NewreportDir : String ;
    LastId : Integer ;
    CDMainList : TVirtualTable ;
    CurrentFilename : String ;
    { Public declarations }
    procedure BuildDir ;
    procedure BuildDirRecurse(AParent : TTreeNode;ADir : String );
    function EditReport(ISNew:boolean = False;Print : Boolean = False ;AsearchColl:TSearchPanel = nil) : Boolean ;
    procedure setupdatabase(VCLReport1: TRpReport) ;
    function GetDirNameFromTreeNode(Anode : TTreeNode ) : String ;
  end;



function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
procedure OSFGetPluginInfo(Var TrnDescription,TrnGroup : Integer ; Var GUID1024 : PChar) ; stdcall ;

var
  frMainReportMan: TfrMainReportMan;
  LabelCounter : Integer ;
implementation

  uses rpmdfmainvcl, rpdatainfo,ShellApi,IniFiles , UDMTCCoreLink,
  OSFGeneralRoutines, UMsgBox, osfLookup, UDMReportsGlobals, UDesignSearch,
  UReportManager;
{$R *.dfm}

procedure OSFGetPluginInfo(Var TrnDescription,TrnGroup : Integer ; Var GUID1024 : PChar) ; stdcall ;
var
 i : Integer ;
 Text : String ;
begin
 try
     TrnDescription := 3401 ;
     TrnGroup :=  3374 ;
     Text := '{A92B6187-7BB0-46AC-8C71-114492DDCAD2}' ;
        I := 0;
        while (I < length(Text)) do
        begin
          GUID1024[I] := Text[I+1];
          Inc(I);
        end;
        GUID1024[I] := #0;
  except
     // no handel
  end;
end;


function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
 var
   AStrings : TStringList ;
begin
 //Application.Handle := AApplicationHandle ;
   AStrings := TStringList.create ;
   try
   AStrings.Text :=  InProcessFile ;

  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  AApplication ;
     frMainReportMan:= TfrMainReportMan.Create(Application);
     try
      DMTCCoreLink.AssignConnectionToChilds(frMainReportMan);
      result := frMainReportMan.ShowModal ;
     finally
       FreeAndNil(frMainReportMan) ;
     end;
   finally
        FreeAndNil(DMTCCoreLink);
   end;
   finally
     // dont let the DLL appication destroy the running tc.
     AStrings.free ;
   end;
 // Application.Handle := 0 ;
end;





procedure TfrMainReportMan.BuildDir;
var
LastSelected,i : Integer ;
begin
  while ImageList1.Count > 3 do
    ImageList1.Delete(3);


   LastSelected := -1 ;
   if TVReports.Selected <> nil then
    LastSelected := TVReports.Selected.AbsoluteIndex ;
   TVReports.SortType := stNone ;
   TVReports.Items.Clear ;
   while not CDMainList.IsEmpty do
    CDMainList.Delete ;
   LastId := 0 ;

  // BuildDirRecurse(nil,reportDir);
   BuildDirRecurse(nil,NewreportDir);
   if LastSelected =-1 then
      begin
        // default to documents/documents.

        for i := TVReports.items.Count -1 downto 0 do
           begin
            if TVReports.items[i].Parent <> nil then
             if TVReports.items[i].Parent.Parent = nil then
             if (TVReports.items[i].Text ='DOCUMENTS') and (TVReports.items[i].Parent.Text = 'DOCUMENTS') then
                 begin

                    LastSelected := i ;
                    Break ;
                 end;
           end;
      end;


   if LastSelected <> -1 then
   if TVReports.Items.count > LastSelected then
     begin
      TVReports.Items.Item[LastSelected].Expand(true);
      TVReports.Items.Item[LastSelected].Selected := true;
     end;
  TVReports.SortType := stData ;
end;

Function ReadT3IniFile(SSection,SKey,sDefault:String):String;
// iType =0 for boolean , 1 for String
Var
  TurboiniFile:TIniFile;
begin
  TurboiniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'..\TCash.ini');
  Result := TurboiniFile.ReadString(SSection,Skey,sDefault);
  TurboiniFile.Free;
end;

function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := CompareStr(Uppercase(List[Index1]),
                                UpperCase(List[Index2]));
end;


procedure TfrMainReportMan.BuildDirRecurse(AParent: TTreeNode; ADir: String);
var
  ASearchRec : TSearchRec ;
  ANewNode : TTreeNode ;
  AList : TStringlist ;
  i,NewImageIndex : Integer ;
  Aname : String ;
  Aicon : TIcon ;
begin
if AParent <> nil then
 if AParent.ImageIndex < 1 then
                if FileExists(ADir   +'\custom.ico' ) then
                    begin
                    try
                       Aicon := TIcon.Create ;
                       try
                       Aicon.Width := ImageList1.Width ;
                       Aicon.Height := ImageList1.Height ;
                       Aicon.LoadFromFile(ADir    +'\custom.ico' );
                       ImageList1.AddIcon(Aicon);
                       finally
                       Aicon.Free ;
                       end;
                       NewImageIndex :=  ImageList1.Count -1 ;
                       AParent.ImageIndex := NewImageIndex ;
                       AParent.SelectedIndex := NewImageIndex ;
                     except
                     end;
                    end;


  AList := TStringlist.create ;

  try

    if FindFirst(ADir+'*.*', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
      if (ASearchRec.Name <> '.') and (ASearchRec.Name <> '..') then
        begin
          if  (DirectoryExists(ADir+ASearchRec.Name))then
            AList.add(ASearchRec.Name) else
             if  uppercase(ExtractFileExt(ASearchRec.Name)) = '.REP'  then
               AList.add(ASearchRec.Name);

        end;
      until FindNext(ASearchRec) <> 0;
      FindClose(ASearchRec);
    end;
    AList.CustomSort(StringListCompareStrings);
    for i := 0 to AList.Count -1 do
      begin
        if (uppercase(ExtractFileExt(AList[i]))<>'.REP')then
         begin
             NewImageIndex := 0 ;
               Aname := AList[i] ;
               if Pos('TRN_',Aname) = 1 then
                 begin
                if FileExists(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'bin\themes\classic\' + Aname +'.ico' ) then
                    begin
                       Aicon := TIcon.Create ;
                       try
                       Aicon.Width := ImageList1.Width ;
                       Aicon.Height := ImageList1.Height ;
                       Aicon.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'bin\themes\classic\' + Aname +'.ico');
                       ImageList1.AddIcon(Aicon);
                       finally
                       Aicon.Free ;
                       end;
                       NewImageIndex :=  ImageList1.Count -1 ;
                    end;
                  Aname := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(Copy(Aname,5,255),0)) ;
                 end;


               ANewNode := TVReports.items.AddChild(AParent,Aname ) ;
               ANewNode.Data := pointer(0);
               try
               ANewNode.ImageIndex := NewImageIndex ;
               ANewNode.SelectedIndex :=  NewImageIndex ;
               except

               end;
               BuildDirRecurse(ANewNode,IncludeTrailingPathDelimiter(ADir+AList[i]))
        end else
        begin
           Aname := ChangeFileExt(AList[i],'') ;
               if Pos('TRN_',Aname) = 1 then
                  Aname := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(Copy(Aname,5,255),0))
                  else
               if Pos('LANG_',Aname) = 1 then
                  Aname := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(Copy(Aname,6,255),0)) ;

           ANewNode := TVReports.items.AddChild(AParent,Aname) ;
           ANewNode.ImageIndex := 1 ;
           ANewNode.SelectedIndex := 1 ;
           if FileExists(ChangeFileExt( ADir + AList[i],'.dfm')) then
             begin
               ANewNode.ImageIndex := 2 ;
               ANewNode.SelectedIndex := 2 ;
             end;




           CDMainList.Insert ;
           inc(LastId) ;
           ANewNode.Data := pointer(LastId);
           CDMainList.FieldByName('ID').AsInteger := LastId;
           CDMainList.FieldByName('Filename').AsString := AList[i] ;
           CDMainList.FieldByName('FullPath').AsString := ADir ;
           CDMainList.FieldByName('Language').AsString := AList[i] ;
           CDMainList.FieldByName('FileDate').AsDateTime := 0 ;
           CDMainList.FieldByName('ReportType').AsInteger := 0 ;
           CDMainList.post ;
        end;
     end; // for i

   finally
     AList.free ;

   end;
// TVReports.Items.AddChild(AParent,ADir)
end;

procedure TfrMainReportMan.FormShow(Sender: TObject);
   var
    i : Integer ;
begin
 // TBlLanguage.TableName := ReadT3IniFile('Current Language','File','Eng.db');

  //TBlLanguage.DatabaseName := szFileName ;
 i := StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select max(wdocid) from dochead where WTypeid in (10,11,12,13)')),0) ;
 i := StrToIntDef(VarToStr(DMTCCoreLink.ReadSysParam('REPMANDEFDOC',i,0)),0);
 EDefDocid.Text := IntToStr(i);
 GENZConnection := DMTCCoreLink.TheZConnection ;
  LabelCounter :=0 ;

  reportDir := DMTCCoreLink.GetLocalPluginDir;
{  if pos('PLUG_INS',reportDir) <> 0 then
    delete(reportDir,pos('PLUG_INS',reportDir)-1,9);}
  NewreportDir :=  IncludeTrailingPathDelimiter(reportDir)+'reports' +PathDelim;
  reportDir := IncludeTrailingPathDelimiter(reportDir)+'reportman';
  if not DirectoryExists(reportDir) then
    CreateDir(reportDir);
  reportDir :=  IncludeTrailingPathDelimiter(reportDir);
  rptypeval.CustomRoutine := HandelReport ;
  BuildDir ;

end;

procedure TfrMainReportMan.BEditClick(Sender: TObject);
begin
 CustomRoutine :=   HandelReport ;
 if TVReports.Selected <> nil then
  begin

    if TVReports.Selected.Data <> pointer(0) then
     begin
        CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);

        CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
        EditReport ;
        if not cbdonotUpdatelist.Checked then
        BuildDir ;
     end ;
   end;
end;

procedure TfrMainReportMan.BPrintClick(Sender: TObject);
begin
 CustomRoutine :=   HandelReport ;
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);

      CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
      EditReport(false,True) ;
         BuildDir ;
     end;
end;

function TfrMainReportMan.EditReport(ISNew:boolean = False;Print : Boolean = False;AsearchColl:TSearchPanel= nil )  : Boolean ;
var
 astream:TFileStream;
 dia:TFRpMainfVCL;
 Alist : TStringlist ;
 i : Integer ;

begin

 Result:=false;
 try
 // Creates the form and on close do the save event
{RpDesignerVCL1.LoadFromFile(VCLReport1.Filename);
RpDesignerVCL1.Modal := TRUE ;
RpDesignerVCL1.Execute ;
EXIT ;  }


 dia:=TFRpMainfVCL.Create(Application);
 try
  if not ISNew then
 begin
   dia.DoOpen(CurrentFilename,false);
  // VCLReport1.Filename := CurrentFilename ;

  //   dia.report:= VCLReport1.Report ;
   end else
   dia.ANewExecute(self);


  dia.ANew.Visible:=false;
// end;

//   dia.ANew.Enabled:=false;
//  dia.AOpen.Enabled:=false;
//  dia.ASave.Enabled:=false;
//  dia.ASaveAs.Enabled:=false;

  dia.AOpen.Visible:=false;
  dia.ASave.Visible:=false;
  dia.ASaveAs.Visible:=true;
//  DiaRep := dia.report ;
 // dia.report:= VCLReport1.Report;

 // dia.report.LoadFromFile(CurrentFilename);

 // dia.LastusedFiles.LastUsed.Clear ;
 // dia.LastusedFiles.LastUsed.add(dia.filename);
 // dia.OnFileClick(self);
 // VCLReport1.AliasList.Connections.clear ;

  SetupDatabase(dia.report) ;
  dia.filename := CurrentFilename ;
  dia.RefreshInterface(self);
  if dia.report.Params.FindParam('TCVAR_DOCID') <> nil then
     begin
       dia.report.Params.FindParam('TCVAR_DOCID').Value := StrTOIntDef(EDefDocid.text,0);
     end;
   if assigned(AsearchColl) then
      begin
       Alist := TStringlist.create ;
       try
       Alist.Text := AsearchColl.Values ;
        for i := 0 to Alist.Count -1 do
            begin
              if dia.report.Params.FindParam(Alist.Names[i]) = nil then
                 dia.report.Params.Add(AnsiUpperCase(Alist.Names[i]));
            end;
        finally
          Alist.free ;
        end;
      end;

  //VCLReport1.AliasList := dia.RpAlias1 ;
 { dia.Show;
  //dia.RpAlias1.Connections.clear ;
  if dia.RpAlias1.Connections.IndexOf('ZEOSSETOFBOOKS') = -1 then
  with dia.RpAlias1.Connections.Add('ZEOSSETOFBOOKS') do
    begin
      Driver := rpdatazeos;
      ZConnection := DMTCCoreLink.TheZConnection ;
      Connect ;
      UpdateConAdmin ;
    end else
    begin
      with dia.RpAlias1.Connections.ItemByName('ZEOSSETOFBOOKS') do
        begin
          Driver := rpdatazeos;
          ZConnection := DMTCCoreLink.TheZConnection ;
          Connect ;
          UpdateConAdmin ;
        end;
    end;
  dia.Hide;   }
  if Print then
  begin
  dia.Hide ;
  dia.APreviewExecute(self);
  end else
  dia.ShowModal ;
//  dia.report := DiaRep ;
  if not Print then
  begin
    if OSFMessageDlg('Save report?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
       astream:=TFileStream.Create(dia.filename,fmCreate);
      try
           SaveToStream(astream,dia.report);
      finally
         astream.free;
      end;
  end;

 finally
  dia.free;
 
 end;
 Application.ProcessMessages ;
// VCLReport1.Filename := '' ;
//   VCLReport1.Filename := DMTCCoreLink.GetLocalPluginDir + 'reports\Empty.rep'  ;

 except
   on e:Exception do
     begin
       if e.Message <> 'Invalid pointer operation' then
         OSFMessageDlg(e.Message,mtError,[mbok],0);
     end;
   // pointer exception ? where the hack from ?

 end;
end;

procedure TfrMainReportMan.SaveToStream(Stream:TStream;VCLReport1: TRpReport);
var
 memstream:TMemoryStream;
begin
  memstream:=TMemoryStream.Create;
  try
   memstream.WriteComponent(VCLReport1);
   memstream.Seek(0,soFromBeginning);
   ObjectBinaryToText(memstream,Stream);
  finally
   memstream.free;
  end;
end;

procedure TfrMainReportMan.TVReportsDblClick(Sender: TObject);
begin
BEditClick(self);
end;

procedure TfrMainReportMan.BAddClick(Sender: TObject);
Var
 AFrom,ATo : String ;
begin
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
       CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       AFrom  := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
       ATo    := CDMainList.FieldByName('FullPath').AsString + 'Copy of ' + CDMainList.FieldByName('Filename').AsString ;
       CopyFile(pchar(AFrom),pchar(ATo),true) ;

       AFrom := ChangeFileExt(AFrom,'.dfm');
       ATo := ChangeFileExt(ATo,'.dfm');
       CopyFile(pchar(AFrom),pchar(ATo),true) ; 
       BuildDir ;
     end;

end;

procedure RenameDir(DirFrom, DirTo: string);
var
  shellinfo: TSHFileOpStruct;
begin
  with shellinfo do
  begin
    Wnd    := 0;
    wFunc  := FO_RENAME;
    pFrom  := PChar(DirFrom);
    pTo    := PChar(DirTo);
    fFlags := FOF_FILESONLY or FOF_ALLOWUNDO or
              FOF_SILENT or FOF_NOCONFIRMATION;
  end;
  SHFileOperation(shellinfo);
end;

procedure TfrMainReportMan.TVReportsEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
Var
 AFrom,ATo,ADir : String ;
begin
 s := Trim(s) ;
 if Node = nil then exit ;


    if Node.Data <> pointer(0) then
     begin
     CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
     AFrom  := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
     ATo    := CDMainList.FieldByName('FullPath').AsString +  S +'.rep' ;
     if CopyFile(pchar(AFrom),pchar(ATo),true) then
       begin
         DeleteFile(AFrom) ;
         AFrom := ChangeFileExt(AFrom,'.dfm');
         ATo := ChangeFileExt(ATo,'.dfm');
         if CopyFile(pchar(AFrom),pchar(ATo),true) then
            DeleteFile(AFrom) ;
         BuildDir ;
       end;
     end  else
     begin
        AFrom  := GetDirNameFromTreeNode(TVReports.Selected) ;
        if DirectoryExists(IncludeTrailingPathDelimiter(reportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(reportDir) + AFrom
           else
        if DirectoryExists(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(NewreportDir) + AFrom ;
        RenameDir(ADir,ExtractFilePath(ADir) + S) ;
     end;
end;

procedure TfrMainReportMan.BDeleteClick(Sender: TObject);
Var
 AFrom : String ;
begin
 if MessageDlg('Are you sure?',mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
       CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       AFrom  := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
       DeleteFile(AFrom) ;
       AFrom := ChangeFileExt(AFrom,'.dfm');
       DeleteFile(AFrom) ;

       TVReports.Selected :=  TVReports.Selected.GetPrev ;
       BuildDir ;
     end else
     begin
        AFrom  := GetDirNameFromTreeNode(TVReports.Selected) ;
        if DirectoryExists(IncludeTrailingPathDelimiter(reportDir) + AFrom) then
           RemoveDir(IncludeTrailingPathDelimiter(reportDir) + AFrom)
           else
        if DirectoryExists(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) then
           RemoveDir(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) ;

        TVReports.Selected :=  TVReports.Selected.GetPrev ;   
        BuildDir ;
     end;

end;

function TfrMainReportMan.GetDirNameFromTreeNode(Anode: TTreeNode): String;
begin
   if Anode.Parent <> nil then
     result := GetDirNameFromTreeNode(Anode.Parent) + PathDelim +  Anode.Text
   else
   begin
     result :=  Anode.Text   ;
   end;
end;

procedure TfrMainReportMan.Button1Click(Sender: TObject);
Var
 ADir,AFrom,aParams : String ;
begin
 aParams := 'explorer.exe' ;
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       ADir :=  CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;

     end else
     begin
        AFrom  := GetDirNameFromTreeNode(TVReports.Selected) ;
        if DirectoryExists(IncludeTrailingPathDelimiter(reportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(reportDir) + AFrom
           else
        if DirectoryExists(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(NewreportDir) + AFrom
          else
        ADir := reportDir ;
     end;
   ADir := '/select, "' + ADir + '"' ;
   ShellExecute(Handle, 'open', Pchar(aParams), pchar(ADir), nil, SW_NORMAL);
end;

procedure TfrMainReportMan.Button2Click(Sender: TObject);
begin
   BuildDir ;
end;

procedure TfrMainReportMan.Button3Click(Sender: TObject);
Var
 ADir : String ;
begin
   ADir := ExtractFilePath(Application.ExeName) +'reportman\doc\index.html' ;
   ShellExecute(Handle, 'open', Pchar(ADir), nil, nil, SW_SHOW);
end;

procedure TfrMainReportMan.BNewReportClick(Sender: TObject);
Var
 ADir,AFrom : String ;
begin
// CustomRoutine :=   MyFunction ;
// EditReport(false);
// exit ;

 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       ADir := ExtractFileDir(CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString) ;

     end else
     begin
        AFrom  := GetDirNameFromTreeNode(TVReports.Selected) ;
        if DirectoryExists(IncludeTrailingPathDelimiter(reportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(reportDir) + AFrom
           else
        if DirectoryExists(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(NewreportDir) + AFrom ;


     end;

  if DirectoryExists(ADir) then
    begin
     AFrom := IncludeTrailingPathDelimiter(NewreportDir) + 'Empty.rep' ;
     ADir :=  IncludeTrailingPathDelimiter(ADir) +'New.rep' ;
     CurrentFilename := ADir ;



     if FileExists (AFrom) then
       begin
         CopyFile(pchar(AFrom) ,pchar(ADir),true);
         EditReport(True);
         BuildDir ;
       end;
    end;
end;

procedure TfrMainReportMan.Button4Click(Sender: TObject);
Var
 ADir,AFrom : String ;
begin
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       ADir := ExtractFileDir(CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString) ;

     end else
     begin
        AFrom  := GetDirNameFromTreeNode(TVReports.Selected) ;
        if DirectoryExists(IncludeTrailingPathDelimiter(reportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(reportDir) + AFrom
           else
        if DirectoryExists(IncludeTrailingPathDelimiter(NewreportDir) + AFrom) then
           ADir := IncludeTrailingPathDelimiter(NewreportDir) + AFrom ;


     end;
  if DirectoryExists(ADir) then
    begin
    CreateDir(IncludeTrailingPathDelimiter(ADir) +'New');
    BuildDir ;
    end;

end;


procedure TfrMainReportMan.setupdatabase(VCLReport1: TRpReport);
begin

 GENZConnection := DMTCCoreLink.TheZConnection ;
 if VCLReport1.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
  with VCLReport1.DatabaseInfo.Add('SETOFBOOKS') do
    begin
      Driver := rpdatazeos;
      ZConnection := DMTCCoreLink.TheZConnection ;

    end else
    begin
      with VCLReport1.DatabaseInfo.ItemByName('SETOFBOOKS') do
        begin
          Driver := rpdatazeos;
          ZConnection := DMTCCoreLink.TheZConnection ;

        end;
    end;
end;

procedure TfrMainReportMan.FormCreate(Sender: TObject);
begin
  CDMainList := TVirtualTable.create(self) ;
  CDMainList.FieldDefs.Add('ID',ftInteger);
  CDMainList.FieldDefs.Add('Filename',ftString,1000);
  CDMainList.FieldDefs.Add('ReportType',ftInteger);



  CDMainList.FieldDefs.Add('Language',ftString,50);
  CDMainList.FieldDefs.Add('FileDate',ftDateTime);
  CDMainList.FieldDefs.Add('FullPath',ftString,1000);
  CDMainList.open ;
  SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
end;

procedure TfrMainReportMan.TVReportsChange(Sender: TObject;
  Node: TTreeNode);
begin
  if Node = nil then exit ;


    if Node.Data <> pointer(0) then
     begin
        CDMainList.locate('ID',integer(Node.Data),[]);
        Lselectedrep.Caption := CDMainList.fieldByName('Filename').AsString ;
     end;


end;

procedure TfrMainReportMan.BitBtn1Click(Sender: TObject);
var
 id : Integer ;
 Lookup : String ;
begin
  OSFGetLookupValue(Lookup,id,'Select doc','RPM',tcstALL,tcltDocument,StrToIntDef(EDefDocid.Text,0),0,'');
  if id > 0 then
     EDefDocid.Text := IntToStr(Id);
end;

procedure TfrMainReportMan.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DMTCCoreLink.WriteSysParam('REPMANDEFDOC',EDefDocid.Text);
end;

procedure TfrMainReportMan.BParamsClick(Sender: TObject);
var
 aDesigner : TDesignSearch ;
begin
 if TVReports.Selected <> nil then
  begin

    if TVReports.Selected.Data <> pointer(0) then
     begin
        CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);

        CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
        CurrentFilename := ChangeFileExt(CurrentFilename,'.dfm') ;
       // if FileExists(CurrentFilename ) then
           begin
            aDesigner := TDesignSearch.create(self) ;
             try
               aDesigner.SloadThisFile := CurrentFilename ;
               aDesigner.Caption := ExtractFileName(CurrentFilename);
               aDesigner.showmodal ;

             finally
               aDesigner.free ;
             end;
           end;
     end ;
   end;
end;

procedure TfrMainReportMan.BitBtn2Click(Sender: TObject);
var
 aDesigner : TDesignSearch ;

begin
 if TVReports.Selected <> nil then
  begin

    if TVReports.Selected.Data <> pointer(0) then
     begin
        CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);

        CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
        CurrentFilename := ChangeFileExt(CurrentFilename,'.dfm') ;
        if FileExists(CurrentFilename ) then
           begin
            aDesigner := TDesignSearch.create(self) ;
             try
               aDesigner.SloadThisFile := CurrentFilename ;
               aDesigner.Parent := Self ;
               aDesigner.top := self.Height ;
               aDesigner.show ;
               CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
               EditReport(False,False,aDesigner.aSearchPanel) ;
                BuildDir ;



             finally
               aDesigner.free ;
             end;
           end else showmessage('No params found. create one first ' +CurrentFilename );
     end ;
   end;
end;

procedure TfrMainReportMan.BitBtn3Click(Sender: TObject);
var aReportManager: TReportManager;

begin
 if TVReports.Selected <> nil then
  begin

    if TVReports.Selected.Data <> pointer(0) then
     begin
        CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);

        CurrentFilename := CDMainList.FieldByName('FullPath').AsString + CDMainList.FieldByName('Filename').AsString ;
         aReportManager:= TReportManager.Create(self);
           try
            aReportManager.ExecuteReport(CurrentFilename,'TCVAR_DOCID='+IntToStr(StrTOIntDef(EDefDocid.text,0)),0);
            aReportManager.ShowModal ;

          finally
            aReportManager.free ;
           end;
     end;
   end;

end;

end.

