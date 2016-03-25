unit UReportManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBTables, rpmdesignervcl, rpcompobase, rpvclreport,
  StdCtrls, ExtCtrls,rptypeval,rpmdconsts,rpbasereport,
   DBAccess , Uni,  rprfvparams,UPluginsSharedUnit,UOSFVisuals,
  Buttons, MemDS;

type
 twf_TReportManager  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm ); override;
 end;

  TReportManager = class(TForm)
    Panel1: TPanel;
    CBReport: TComboBox;
    Panel2: TPanel;
    Panel3: TPanel;
    SaveDialog1: TSaveDialog;
    Panel4: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    QExecSQL: TuniQuery;
    tblOpReport: TuniTable;
    tblOpReportWOptionID: TAutoIncField;
    tblOpReportStrOption: TStringField;
    tblOpReportSOptionValue: TStringField;
    tblOpReportWOptionTypeID: TIntegerField;
    cbOpenInPdf: TCheckBox;
    TCLose: TTimer;
    Image1: TImage;


    procedure Button1Click(Sender: TObject);
    procedure CBReportChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TCLoseTimer(Sender: TObject);
  private
    FReportDir: String;
    procedure SaveToStream(aStream: TStream);
    procedure SetReportDir(const Value: String);
    { Private declarations }

  public
    VCLReport1: TVCLReport;
    VCLPageSettings: TVCLReport;
    RpDesignerVCL1: TRpDesignerVCL;
    dia:TFRpRTParams;
    AParamList : TStringList ;
    ShowReportType : Integer ;
    AsearchPanel : TSearchPanel ;
    bDoPrint : Boolean ;
    procedure SetPageProps ;
    property ReportDir : String  read FReportDir write SetReportDir;
    function ShowReport(ReportName: String): Boolean;
    procedure InitDatabase(ADataBase : TUniconnection) ;
    procedure RefreshReportsList ;
    procedure ExecuteReport(Areport  : String;params:String;ShowType : Integer ) ;
    procedure EndReport(SavePath  : String ) ;

    { Public declarations }
  end;

var
  ReportManager: TReportManager;

procedure  ExecReport(AReport : String ;Aparams : String ='') ;
procedure  PrintReport(AReport : String ;Aparams : String ='') ;
function HASREPORT (Areportname,Language : PChar) : Integer ; stdcall ;
function RUNREPORT (ADatabase : TUniconnection; Areportname ,Language : PChar;AApplication : HWnd;AApplicationPointer : TComponent) : TModalresult ; stdcall ;
function RUNDOCUMENT (ADatabase : TUniconnection;Areportname ,Language,Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies : Integer) : TModalresult ; stdcall ;
  // ShowReportType 0 = Screen 1 = Printer 2 = File 3 = E-mail

implementation

uses rpmdfmainvcl, rpdatainfo,ShellApi,IniFiles , UDMTCCoreLink,
  OSFGeneralRoutines, TypInfo,rptypes,UDMReportsGlobals;

function gettextlang(AID : Integer ) : String ;
begin
  DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.GetTextLang(AID);
end;




function RUNDOCUMENT (ADatabase : TUniconnection;Areportname ,Language , Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies  : Integer) : TModalresult ; stdcall ;
var
   AStream : TMemoryStream ;

  Filename,repname : String ;
  i : Integer ;
  HasParams : Boolean ;
begin

  result := 0 ;
  Filename := Areportname  ;
  if not FileExists(Filename) then exit ;
  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  AApplicationPointer ;
     ReportManager:= TReportManager.create(nil);
   try
    DMTCCoreLink.AssignConnectionToChilds(ReportManager);
       ReportManager.AParamList.text := Variables ;

       CustomRoutine :=  HandelReport ;
       ReportManager.InitDatabase(nil);
       ReportManager.VCLReport1.Filename := Filename ;
       if pos('TRN', ExtractFileName(Filename)) = 1 then
         begin
            repname :=  ExtractFileName(Filename) ;
            repname := ChangeFileExt(repname,'') ;
            repname := copy(repname,5,length(repname));
            repname := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(repname,0));
            if repname = '' then
              repname := Filename ;
           ReportManager.VCLReport1.Title  := repname ;
         end else

       ReportManager.VCLReport1.Title  := Filename ;
       ReportManager.VCLReport1.CheckLoaded;
        if ReportManager.VCLReport1.Report.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
        with ReportManager.VCLReport1.Report.DatabaseInfo.Add('SETOFBOOKS') do
          begin
            Driver := rpdatazeos;
            ZConnection := DMTCCoreLink.TheZConnection ;
          end else
          begin
            with ReportManager.VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
              begin
                Driver := rpdatazeos;
                ZConnection := DMTCCoreLink.TheZConnection ;
              end;
          end;
       HasParams := False ;
       for i := 0 to ReportManager.VCLReport1.Report.Params.Count -1 do
         begin
             if (ReportManager.VCLReport1.Report.Params[i].Visible and (not ReportManager.VCLReport1.Report.Params[i].NeverVisible)) then
                 HasParams := True ;
         end;

       for i := 0 to ReportManager.AParamList.count -1 do
        begin
         if ReportManager.VCLReport1.Report.Params.FindParam(ReportManager.AParamList.Names[i]) <> nil then
           ReportManager.VCLReport1.Report.Params.FindParam(ReportManager.AParamList.Names[i]).Value := ReportManager.AParamList.ValueFromIndex[i];
         end;

       if HasParams then
       if ShowReportType =  0 then
         begin
          ReportManager.ReportDir :=  Filename ;
          ReportManager.RefreshReportsList ;
          ReportManager.ShowModal ;
          exit ;
         end;

         
      ReportManager.VCLReport1.ShowParams ;
      ReportManager.VCLReport1.Report.PrintOnlyIfDataAvailable := false ;

       case  ShowReportType of
         0 : begin

                  ReportManager.VCLReport1.Preview := true ;
                  ReportManager.VCLReport1.Execute ;
             end;
         1 : begin
              ReportManager.VCLReport1.ShowPrintDialog := false ;
              ReportManager.VCLReport1.ShowProgress := false ;


              for i := 0 to NumCopies -1 do
                  begin
                  ReportManager.VCLReport1.Preview := false ;
                  ReportManager.VCLReport1.Execute ;
                  end;
               end;
         2 : begin
               if ReportManager.SaveDialog1.Execute then
                 begin
                   case  ReportManager.SaveDialog1.FilterIndex of
                    1 : ReportManager.VCLReport1.SaveToPDF(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.pdf'));
                    2 : ReportManager.VCLReport1.SaveToExcel(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.xls'));
                    3 : ReportManager.VCLReport1.SaveToMetafile(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.emf'));
                    4 : ReportManager.VCLReport1.SaveToText(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.txt'));
                    5 : ReportManager.VCLReport1.SaveToHTML(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.htm'));
                    6 : ReportManager.VCLReport1.SaveToSVG(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.svg'));
                    7 : ReportManager.VCLReport1.SaveToCSV(ChangeFileExt(ReportManager.SaveDialog1.FileName,'.csv'));
                   end ;
                   ShellExecute(ReportManager.Handle, 'open', pchar(ReportManager.SaveDialog1.FileName), nil, nil, SW_SHOW)
                 end;
             end;
         3 : begin
                ReportManager.VCLReport1.SaveToPDF(aFileName);
             end;
         end;
       with ReportManager.VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
              begin
                Driver := rpdatazeos;
                ZConnection := nil  ;
              end;
       result := 1 ;
   finally
        FreeAndNil(ReportManager);
   end;
   finally
     FreeAndNil(DMTCCoreLink);
   end;

end;


function HASREPORT (Areportname,Language : PChar) : Integer ; stdcall ;
var
  szFileName: array[0..MAX_PATH] of Char;
  Filename : String ;
  Bool : Integer ;
  F            :TSearchRec;
 function GetMainName : String ;
 begin
    GetModuleFileName(MainInstance,szFileName,MAX_PATH);
    GetMainName := IncludeTrailingPathDelimiter(ExtractFilePath(szFileName)) ;

 end;
begin
  result := 0 ;
 // exit ;
  GetModuleFileName(hInstance, szFileName, MAX_PATH);
  Filename := szFileName;

  Filename := IncludeTrailingPathDelimiter(ExtractFilePath(Filename)) + '' + Areportname  ;
  if DirectoryExists(Filename) then
    begin
       result := FindFirst(Filename+PathDelim+'*.rep',faAnyFile,F);
       if result = 0 then
        begin
        result := 1 ;
        end else
        result := 0 ;

        FindClose(f);
    end;
 if result = 0 then
  begin
    result := 0 ;
    Filename := TDMTCCoreLink.GetLocalPluginDir + 'reports\Newreports' + Areportname  ;
    if not DirectoryExists(Filename) then
    Filename := GetMainName  + 'plug_ins\reports\Newreports'  + Areportname  ;
    if DirectoryExists(Filename) then
      begin
         result := FindFirst(Filename+PathDelim+'*.rep',faAnyFile,F);
        if result = 0 then
        begin
        result := 1 ;
        end else
        result := 0 ;

       //  Bool := FindFirst(Filename+PathDelim+'*.dfm',faAnyFile,F);
       //  if Bool = 0 then  result := 0 ;
         FindClose(f);
      end;
  end;
 if result = 0 then
  begin
    result := 0 ;
    Filename := TDMTCCoreLink.GetLocalPluginDir + 'reports\userreports' + Areportname  ;
    if not DirectoryExists(Filename) then
    Filename := GetMainName  + 'plug_ins\reports\userreports'  + Areportname  ;
    if DirectoryExists(Filename) then
      begin
         result := FindFirst(Filename+PathDelim+'*.rep',faAnyFile,F);
        if result = 0 then
        begin
        result := 1 ;
        end else
        result := 0 ;

       //  Bool := FindFirst(Filename+PathDelim+'*.dfm',faAnyFile,F);
       //  if Bool = 0 then  result := 0 ;
         FindClose(f);
      end;
  end;
 { if result = 0 then
  begin
    result := 0 ;
    GetModuleFileName(hInstance, szFileName, MAX_PATH);
    Filename := szFileName;

    Filename := IncludeTrailingPathDelimiter(ExtractFilePath(Filename)) + 'userreports' + Areportname  ;
    if DirectoryExists(Filename) then
      begin
         result := FindFirst(Filename+PathDelim+'*.rep',faAnyFile,F);
        if result = 0 then
        begin
        result := 1 ;
        end else
        result := 0 ;

       //  Bool := FindFirst(Filename+PathDelim+'*.dfm',faAnyFile,F);
       //  if Bool = 0 then  result := 0 ;
         FindClose(f);
      end;
  end;  }
end;


Function ReadT3IniFile(SSection,SKey,sDefault:String):String;
// iType =0 for boolean , 1 for String

begin
  Result := TDatabaseRegistyRoutines.ReadOsfIni(SSection,Skey,sDefault) ;

end;

procedure  ExecReport(AReport : String;Aparams : String ='' ) ;
begin
   if FileExists(AReport) then
      begin
        ReportManager:= TReportManager.create(Application);
             try
                 DMTCCoreLink.AssignConnectionToChilds(ReportManager);

                 ReportManager.InitDatabase(nil);
                 ReportManager.ReportDir := AReport ;
                 ReportManager.RefreshReportsList ;

                 ReportManager.AParamList.Text := Aparams ;

                 ReportManager.Caption := StringReplace(AReport,PathSep,' ',[rfreplaceAll]);

                 ReportManager.ShowModal ;
                 
             finally
                  FreeAndNil(ReportManager);
             end;

      end;
end;

procedure  PrintReport(AReport : String;Aparams : String ='' ) ;
begin
   if FileExists(AReport) then
      begin
        ReportManager:= TReportManager.create(Application);
             try
                 DMTCCoreLink.AssignConnectionToChilds(ReportManager);

                 ReportManager.InitDatabase(nil);
                 ReportManager.ReportDir := AReport ;
                 ReportManager.RefreshReportsList ;

                 ReportManager.AParamList.Text := Aparams ;

                 ReportManager.Caption := StringReplace(AReport,PathSep,' ',[rfreplaceAll]);
                  ReportManager.bDoPrint := True ;
                 ReportManager.Show ;
                 ReportManager.BtnOkClick(nil);

                 
             finally
                  FreeAndNil(ReportManager);
             end;

      end;
end;


function RUNREPORT (ADatabase : TUniconnection;Areportname,Language : PChar;AApplication : HWnd;AApplicationPointer : TComponent) : TModalresult ; stdcall ;
var
   AStream : TMemoryStream ;

 szFileName: array[0..MAX_PATH] of Char;
  Filename : String ;
   function GetMainName : String ;
 begin
    GetModuleFileName(MainInstance,szFileName,MAX_PATH);
    GetMainName := IncludeTrailingPathDelimiter(ExtractFilePath(szFileName)) ;

 end;
begin
 // exit ;
 // GetModuleFileName(hInstance, szFileName, MAX_PATH);
//  Filename := TDMTCCoreLink.GetLocalPluginDir +'reports' ; // szFileName;

//  Filename :=  IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter( Filename) + Language + Areportname)   ;
//   if not DirectoryExists(Filename) then
       Filename :=includeTrailingPathDelimiter( TDMTCCoreLink.GetLocalPluginDir+'reports\Newreports'  + Areportname) ;
   if not DirectoryExists(Filename) then
       Filename :=  IncludeTrailingPathDelimiter(GetMainName +'plug_ins\reports\Newreports'  + Areportname) ;
   if not DirectoryExists(Filename) then
       Filename :=includeTrailingPathDelimiter( TDMTCCoreLink.GetLocalPluginDir+'reports\userreports'  + Areportname) ;
   if not DirectoryExists(Filename) then
       Filename :=  IncludeTrailingPathDelimiter(GetMainName +'plug_ins\reports\userreports'  + Areportname) ;
//   Application.Handle :=   AApplication ;
   // done : Get application icon
   if DirectoryExists(Filename) then
   begin
 {  AStream := TMemoryStream.create ;
   try
   TApplication(AApplicationPointer).Icon.SaveToStream(AStream);
   AStream.Position := 0 ;
   Application.Icon.LoadFromStream(AStream);
   finally
     AStream.free ;
   end ;   }


  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  AApplicationPointer ;
        ReportManager:= TReportManager.create(Application);
       try
           DMTCCoreLink.AssignConnectionToChilds(ReportManager);

           CustomRoutine :=  HandelReport ;
           ReportManager.InitDatabase(nil);
           ReportManager.ReportDir := Filename ;
           ReportManager.RefreshReportsList ;
           ReportManager.Caption := StringReplace(Areportname,PathSep,' ',[rfreplaceAll]); ;
           ReportManager.ShowModal ;

       finally
            FreeAndNil(ReportManager);
       end;
       finally
          FreeAndNil(DMTCCoreLink);
       end;
   end else
   begin
      Filename := TDMTCCoreLink.GetLocalPluginDir+'reports' ;
      // GetModuleFileName(hInstance, szFileName, MAX_PATH);
      // Filename := szFileName;

      Filename := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(Filename) + 'userreports'   + Areportname)  ;

     //  Application.Handle :=   AApplication ;
       // done : Get application icon
       if DirectoryExists(Filename) then
       begin
       {AStream := TMemoryStream.create ;
       try
       TApplication(AApplicationPointer).Icon.SaveToStream(AStream);
       AStream.Position := 0 ;
       Application.Icon.LoadFromStream(AStream);
       finally
         AStream.free ;
       end ;   }
      DMTCCoreLink := TDMTCCoreLink.create(nil);
       try
         DMTCCoreLink.AApplication :=  AApplicationPointer ;
            ReportManager:= TReportManager.create(Application);
           try
               ReportManager.InitDatabase(nil);

               CustomRoutine :=  HandelReport ;
               ReportManager.ReportDir := Filename ;
               ReportManager.RefreshReportsList ;
               ReportManager.Caption := Areportname ;
               ReportManager.ShowModal ;
           finally
                FreeAndNil(ReportManager);
           end;
           finally
              FreeAndNil(DMTCCoreLink);
           end;
       end;
   end;
   // dont let the DLL appication destroy the running tc.
 //  Application.Handle := 0 ;

end;

procedure TReportManager.InitDatabase(ADataBase : TUniconnection);

Var AList : TStringList ;
  szFileName: array[0..MAX_PATH] of Char;
  Filename : String ;
begin
  GetModuleFileName(hInstance, szFileName, MAX_PATH);
  Filename := szFileName;
  Filename := IncludeTrailingPathDelimiter(Filename) +'reports/'  ;
  if not DirectoryExists(Filename) then
    CreateDir(Filename);
end;

procedure TReportManager.RefreshReportsList;
var
  Bool,RepIndex : Integer ;
  F  :TSearchRec;
  SDesc : String ;
begin
  CBReport.Clear ;
  if DirectoryExists(FReportDir) then
    begin
       Bool := FindFirst(IncludeTrailingPathDelimiter(FReportDir)+'*.rep',faAnyFile,F);
       while Bool = 0 do
        begin
        if pos('TRN_',f.Name) = 1 then
        begin
         SDesc := copy(ChangeFileExt(f.Name,''),5,255);
         CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(SDesc,0)),Tobject(StrToIntDef(SDesc,0)));
        end  else if pos('LANG_',f.Name) = 1 then
        begin
         SDesc := copy(ChangeFileExt(f.Name,''),6,255);
         CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(SDesc,0)),Tobject(StrToIntDef(SDesc,0)));
        end  else
        CBReport.Items.Add(ChangeFileExt(f.Name,''));
        Bool := FindNext(F);
        end ;
        FindClose(f);
        if CBReport.Items.Count > 0 then
         CBReport.ItemIndex := 0;
    end else
  if FileExists(FReportDir) then
    begin
       RepIndex := 0 ;
        Bool := FindFirst(IncludeTrailingPathDelimiter(ExtractFilePath(FReportDir))+'*.rep',faAnyFile,F);
       while Bool = 0 do
        begin
        if pos('TRN_',f.Name) = 1 then
        begin
         SDesc := copy(ChangeFileExt(f.Name,''),5,255);
         CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(SDesc,0)),Tobject(StrToIntDef(SDesc,0)));
        end  else if pos('LANG_',f.Name) = 1 then
        begin
         SDesc := copy(ChangeFileExt(f.Name,''),6,255);
         CBReport.Items.AddObject(DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(SDesc,0)),Tobject(StrToIntDef(SDesc,0)));
        end  else
        CBReport.Items.Add(ChangeFileExt(f.Name,''));
        if (f.Name = ExtractFileName(FReportDir)) then
         RepIndex :=  CBReport.Items.Count -1 ;
        Bool := FindNext(F);
        end ;
        FindClose(f);

         if CBReport.Items.Count > RepIndex then
          CBReport.ItemIndex := RepIndex;
    end;


end;



procedure TReportManager.SetReportDir(const Value: String);
begin
  FReportDir := Value;
end;

function TReportManager.ShowReport(ReportName : String) : Boolean ;
var
 astream:TFileStream;
 dia:TFRpMainfVCL;
begin
 VCLReport1.Filename := ReportName ;
 Result:=false;
 // Creates the form and on close do the save event
 dia:=TFRpMainfVCL.Create(nil);
 try
//  dia.ANew.Enabled:=false;
//  dia.AOpen.Enabled:=false;
//  dia.ASave.Enabled:=false;
//  dia.ASaveAs.Enabled:=false;
  dia.ANew.Visible:=false;
  dia.AOpen.Visible:=false;
  dia.ASave.Visible:=false;
  dia.ASaveAs.Visible:=false;

  dia.report:= VCLReport1.Report;
  dia.filename := VCLReport1.Filename ;
  dia.RefreshInterface(self);
  dia.RpAlias1.Connections.clear ;
  GENZConnection := DMTCCoreLink.TheZConnection ;

  if dia.RpAlias1.Connections.IndexOf('SETOFBOOKS') = -1 then
  with dia.RpAlias1.Connections.Add('SETOFBOOKS') do
    begin
      Driver := rpdatabde;
      Connect(nil) ;
      UpdateConAdmin ;
    end;
  dia.ShowModal;
 finally
  dia.free;
 end;
end;


{$R *.dfm}

procedure TReportManager.Button1Click(Sender: TObject);
begin


 //ShowReport(IncludeTrailingBackslash(ReportDir)+CBReport.Text +'.rep');
end;

procedure TReportManager.CBReportChange(Sender: TObject);
         var

 oneparam:boolean;
 i:integer;
 Result : Boolean ;
 AFile,locRepname : String ;
var
    AStream : TFileStream ;
begin
  FreeAndNil(AsearchPanel);
  AsearchPanel := TSearchPanel.Create(self);

  AsearchPanel.Align := alclient ;
  AsearchPanel.Rightpanel.Visible := false ;

  locRepname := CBReport.Text ;
  if CBReport.ItemIndex <> -1 then
    if CBReport.Items.Objects[CBReport.ItemIndex] <> nil then
       begin
        locRepname := 'TRN_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));
        if not FileExists(IncludeTrailingBackslash(ReportDir)+locRepname +'.rep') then
           locRepname := 'LANG_' + IntToStr(Integer(CBReport.Items.Objects[CBReport.ItemIndex]));
       end;

 if not (FileExists(IncludeTrailingBackslash(ReportDir)+locRepname +'.rep') or (FileExists(ReportDir))) then exit ;

 if FileExists(IncludeTrailingBackslash(ReportDir)+locRepname +'.rep') then
   AFile := IncludeTrailingBackslash(ReportDir)+locRepname +'.rep' else
    AFile := ReportDir ;

 if  Assigned(dia) then FreeAndNil(dia) ;
 if FileExists(ChangeFileExt(AFile,'.dfm')) then
     begin
      AsearchPanel.Parent := Panel2 ;
       AStream := TFileStream.Create(ChangeFileExt(AFile,'.dfm'),fmShareDenyNone) ;
       try
          AStream.ReadComponent(AsearchPanel);
          AsearchPanel.FLookup := CBReport.Text ;
          for i := 0 to AsearchPanel.aSearchCollection.Count -1 do
            begin
             AsearchPanel.aSearchCollection[i].Wosf_search_fields_id := i ;

            end;
          AsearchPanel.BuildGui;
       finally
          AStream.free ;
       end;

        AsearchPanel.Parent := Panel2 ;

       Caption := CBReport.Text ;
        // AsearchPanel.Invalidate ;
     {   if StrToIntDef(AsearchPanel.DefSql,0) = 0 then
           Caption := AsearchPanel.DefSql
        else
        Caption := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(AsearchPanel.DefSql,0));
       }

  VCLReport1.Filename :=  AFile ;
 if VCLReport1.Report.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
  with VCLReport1.Report.DatabaseInfo.Add('SETOFBOOKS') do
    begin
      Driver := rpdatazeos;
      ZConnection := DMTCCoreLink.TheZConnection ;
    end else
    begin
      with VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
        begin
          Driver := rpdatazeos;
          ZConnection := DMTCCoreLink.TheZConnection ;
        end;
    end;

     end else
     begin




  VCLReport1.Filename := AFile ;
 if VCLReport1.Report.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
  with VCLReport1.Report.DatabaseInfo.Add('SETOFBOOKS') do
    begin
      Driver := rpdatazeos;
      ZConnection := DMTCCoreLink.TheZConnection ;
    end else
    begin
      with VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
        begin
          Driver := rpdatazeos;
          ZConnection := DMTCCoreLink.TheZConnection ;
        end;
    end;

 VCLReport1.CheckLoaded   ;

 Result:=false;
 oneparam:= VCLReport1.Report.params.count > 1;

 for i:=0 to VCLReport1.Report.params.count-1 do
 begin
  if (VCLReport1.Report.params.items[i].Visible and (not VCLReport1.Report.params.items[i].NeverVisible)) then
  begin
   oneparam:=true;
   break;
  end;
 end;
 if not oneparam then
 begin
  Result:=true;
  // go for the ok button
  if FileExists(FReportDir) then
     begin
        BtnOkClick(nil);
        TCLose.Enabled := true ;
     end;
  exit;
 end;
{$IFNDEF FORWEBAX}
 VCLReport1.Report.params.UpdateLookup;
{$ENDIF}

 dia:=TFRpRTParams.Create(Application);
 dia.Tag := 99 ;
 dia.params:=VCLReport1.Report.Params;
 dia.parent := Panel2 ;
 dia.show;
 dia.Top := 0 ;
 dia.left := 0 ;


 Self.ClientWidth := dia.Width ;
 Self.ClientHeight := dia.Height + Panel1.Height ;
 dia.Align := alclient ;
 dia.BorderStyle := bsnone ;
 dia.PModalButtons.Visible := false ;

  end;

end;

procedure TReportManager.BtnOkClick(Sender: TObject);
var
 astream:TFileStream ;
 ATempFile : AnsiString ;
 i :  Integer ;
 AStringlist : TStringlist ;
begin
  for i := 0 to AParamList.Count -1 do
        begin
          if  VCLReport1.Report.params.FindParam(AParamList.Names[i]) <> nil then
            begin
             case VCLReport1.Report.params.FindParam(AParamList.Names[i]).ParamType of
             rpParamInteger,rpParamDate : VCLReport1.Report.params.FindParam(AParamList.Names[i]).Value := StrToIntDef(AParamList.ValueFromIndex[i],0) ;
             else VCLReport1.Report.params.FindParam(AParamList.Names[i]).Value := AParamList.ValueFromIndex[i] ;
             end ;
            end;
        end;


if AsearchPanel.Parent <> nil then
   begin
    AsearchPanel.SaveCollection ;
    AStringlist := TStringlist.create ;
    try
      AStringlist.Text :=  AsearchPanel.Values ;
       for i := 0 to AsearchPanel.aSearchCollection.Count -1 do
        begin
          if VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen) <> nil then
            VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen).Description := DMTCCoreLink.GetTextLangNoAmp(AsearchPanel.aSearchCollection[i].WColumnTranslation) ;
          if VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen +'fl') <> nil then
            VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen+'fl').Description := DMTCCoreLink.GetTextLangNoAmp(AsearchPanel.aSearchCollection[i].WColumnTranslation) ;
          if VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen +'fromfl') <> nil then
            VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen+'fromfl').Description := DMTCCoreLink.GetTextLangNoAmp(AsearchPanel.aSearchCollection[i].WColumnTranslation) ;
          if VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen +'tofl') <> nil  then
            VCLReport1.Report.params.FindParam(AsearchPanel.aSearchCollection[i].SColumnOrigen+'tofl').Description := DMTCCoreLink.GetTextLangNoAmp(AsearchPanel.aSearchCollection[i].WColumnTranslation) ;

        end;
      for i := 0 to AStringlist.Count -1 do
        begin

          if  VCLReport1.Report.params.FindParam(AStringlist.Names[i]) <> nil then
            begin

             case VCLReport1.Report.params.FindParam(AStringlist.Names[i]).ParamType of
             rpParamInteger,rpParamDate : VCLReport1.Report.params.FindParam(AStringlist.Names[i]).Value := StrToIntDef(AStringlist.ValueFromIndex[i],0) ;
             else VCLReport1.Report.params.FindParam(AStringlist.Names[i]).Value := AStringlist.ValueFromIndex[i] ;
             end ;
            end;
        end;
     finally
       AStringlist.free ;
     end;
   end;
  CustomRoutine :=  HandelReport ;

 if  Assigned(dia) then
   begin
     dia.BOKClick(self);
     VCLReport1.Report.params.Assign(dia.Params);
   end;
   for i := 0 to AParamList.Count -1 do
        begin
          if  VCLReport1.Report.params.FindParam(AParamList.Names[i]) <> nil then
            begin
             case VCLReport1.Report.params.FindParam(AParamList.Names[i]).ParamType of
             rpParamInteger,rpParamDate : VCLReport1.Report.params.FindParam(AParamList.Names[i]).Value := StrToIntDef(AParamList.ValueFromIndex[i],0) ;
             else VCLReport1.Report.params.FindParam(AParamList.Names[i]).Value := AParamList.ValueFromIndex[i] ;
             end ;
            end;
        end;
          
 
   VCLReport1.Title := CBReport.Text ;
   if cbOpenInPdf.Checked then
     begin
       SetLength(ATempFile,256);
       GetTempPathA(255,Pansichar(ATempFile));

       ATempFile := copy(ATempFile,1,pos(#0,ATempFile)-1)  + FormatDateTime('YYYYMMDDHHNNSS',now) +   '.pdf' ;
       VCLReport1.SaveToPDF(ATempFile);
        ShellExecutea(Handle, 'open', pansichar(ATempFile), nil, nil, SW_SHOW);
     end else
     begin
      if bDoPrint then
        begin
         VCLReport1.Preview := false ;
         VCLReport1.ShowPrintDialog := False ;

       end  else
       begin
        VCLReport1.Preview := true ;
        VCLReport1.ShowPrintDialog := true ;
       end;
      VCLReport1.Execute ;
     end;
  try
  astream:=TFileStream.Create(VCLReport1.Filename,fmCreate);
  try
       SaveToStream(astream);
  finally
     astream.free;
  end;

  except
     // file permissions and other erros just ignore
  end;
   if sender <> nil then
    if AsearchPanel.Parent = nil then
   CBReportChange(self);

end;

procedure TReportManager.SaveToStream( AStream : TStream ) ;
var
 memstream:TMemoryStream;
begin
  memstream:=TMemoryStream.Create;
  try
   memstream.WriteComponent(VCLReport1.Report);
   memstream.Seek(0,soFromBeginning);
   ObjectBinaryToText(memstream,aStream);
  finally
   memstream.free;
  end;
end;

procedure TReportManager.FormShow(Sender: TObject);
var
 aName : String ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);
 BtnOk.Caption := DMTCCoreLink.GetTextLang(167);
 if FileExists(ExtractFilePath(ReportDir) + 'custom.ico') then
    Image1.Picture.LoadFromFile(ExtractFilePath(ReportDir) + 'custom.ico') else
    begin
      aName := ExtractFileName( ExcludeTrailingPathDelimiter(ExtractFilePath(ReportDir) )) ;
      if Pos('TRN_',aName) = 1 then
        begin
          if FileExists( IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'bin\themes\classic\' + aName +'.ico') then
              Image1.Picture.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'bin\themes\classic\' + aName +'.ico');
        end;
    end;

 CBReportChange(self);
end;

procedure TReportManager.BtnCancelClick(Sender: TObject);
begin
 close ;
end;



procedure TReportManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMTCCoreLink.WriteNwReportOp('OPENINPDF',BooltoStr(cbOpenInPdf.Checked));
  if  Assigned(dia) then FreeAndNil(dia) ;
end;

procedure TReportManager.SetPageProps;
begin
 VCLReport1.Report.LinesPerInch                    :=  VCLPageSettings.Report.LinesPerInch              ;
 VCLReport1.Report.Copies                          :=  VCLPageSettings.Report.Copies                    ;
 VCLReport1.Report.CollateCopies                   :=  VCLPageSettings.Report.CollateCopies             ;
 VCLReport1.Report.TwoPass                         :=  VCLPageSettings.Report.TwoPass                   ;
 VCLReport1.Report.PreviewAbout                    :=  VCLPageSettings.Report.PreviewAbout              ;
 VCLReport1.Report.PrintOnlyIfDataAvailable        :=  VCLPageSettings.Report.PrintOnlyIfDataAvailable  ;
 VCLReport1.Report.ReportAction                    :=  VCLPageSettings.Report.ReportAction              ;
 VCLReport1.Report.Pagesize                        :=  VCLPageSettings.Report.Pagesize                  ;
 VCLReport1.Report.PagesizeQt                      :=  VCLPageSettings.Report.PagesizeQt                ;
 VCLReport1.Report.PageHeight                      :=  VCLPageSettings.Report.PageHeight                ;
 VCLReport1.Report.PageWidth                       :=  VCLPageSettings.Report.PageWidth                 ;
 VCLReport1.Report.CustomPageWidth                 :=  VCLPageSettings.Report.CustomPageWidth           ;
 VCLReport1.Report.CustomPageHeight                :=  VCLPageSettings.Report.CustomPageHeight          ;
 VCLReport1.Report.LeftMargin                      :=  VCLPageSettings.Report.LeftMargin                ;
 VCLReport1.Report.RightMargin                     :=  VCLPageSettings.Report.RightMargin               ;
 VCLReport1.Report.TopMargin                       :=  VCLPageSettings.Report.TopMargin                 ;
 VCLReport1.Report.BottomMargin                    :=  VCLPageSettings.Report.BottomMargin              ;
 VCLReport1.Report.PageOrientation                 :=  VCLPageSettings.Report.PageOrientation           ;
 VCLReport1.Report.PrinterSelect                   :=  VCLPageSettings.Report.PrinterSelect             ;
 VCLReport1.Report.PageOrientation                 :=  VCLPageSettings.Report.PageOrientation           ;
 VCLReport1.Report.PageBackColor                   :=  VCLPageSettings.Report.PageBackColor             ;
 VCLReport1.Report.Language                        :=  VCLPageSettings.Report.Language                  ;
 VCLReport1.Report.PrinterFonts                    :=  VCLPageSettings.Report.PrinterFonts              ;
 VCLReport1.Report.PreviewStyle                    :=  VCLPageSettings.Report.PreviewStyle              ;
 VCLReport1.Report.PreviewMargins                  :=  VCLPageSettings.Report.PreviewMargins            ;
 VCLReport1.Report.PreviewWindow                   :=  VCLPageSettings.Report.PreviewWindow             ;
 VCLReport1.Report.StreamFormat                    :=  VCLPageSettings.Report.StreamFormat              ;
 VCLReport1.Report.PaperSOurce                     :=  VCLPageSettings.Report.PaperSOurce               ;
 VCLReport1.Report.Duplex                          :=  VCLPageSettings.Report.Duplex                    ;
 VCLReport1.Report.ForcePaperName                  :=  VCLPageSettings.Report.ForcePaperName            ;

end;

procedure TReportManager.FormCreate(Sender: TObject);
begin
 AParamList := TStringList.create ;

 AsearchPanel := TSearchPanel.Create(self) ;
 AsearchPanel.Parent := Panel2 ;
 AsearchPanel.Align := alclient ;
 AsearchPanel.Rightpanel.Visible := false ;


 SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
 cbOpenInPdf.Checked := DMTCCoreLink.ReadNwReportOp('OPENINPDF',false);


 VCLReport1:= TVCLReport.Create(Self);
 VCLPageSettings := TVCLReport.Create(Self);
 RpDesignerVCL1:= TRpDesignerVCL.Create(self);

end;

procedure TReportManager.FormDestroy(Sender: TObject);
begin
 AParamList.free ;
 VCLReport1.free ;
 RpDesignerVCL1.free ;
 VCLPageSettings.free ;

end;


procedure TReportManager.TCLoseTimer(Sender: TObject);
begin
self.close ;
end;

{ twf_TReportManager }

constructor twf_TReportManager.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'report-manager';
  Description := 'Report manager add reports in the workflow.' + #13+#10+
  'REPORT path to the report from plugins' + #13+#10+
  'VIEWTYPE 0 = onscreen 1 = print' + #13+#10+
  'SAVETO   = save endresult to' + #13+#10+
  'RAPARAMS1..4   = free params to use in the report' ;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'REPORT' ;
        DataType := ftString;
        Size := 255 ;
        Value := 'reports\DOCUMENTS\DOCUMENTS\RMfactuur.rep' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'VIEWTYPE' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'SAVETO' ;
        DataType := ftString;
        Size := 255 ;
        Value := '%TEMP%' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'RAPARAMS1' ;
        DataType := ftString;
        Size := 255 ;
        Value := '%' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'RAPARAMS2' ;
        DataType := ftString;
        Size := 255 ;
        Value := '%' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'RAPARAMS3' ;
        DataType := ftString;
        Size := 255 ;
        Value := '%' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'RAPARAMS4' ;
        DataType := ftString;
        Size := 255 ;
        Value := '%' ;
     end;
end;

procedure twf_TReportManager.WorkflowEnd(AForm: TForm);
begin
  inherited;
  TReportManager(AForm).EndReport(Inparams.paramByName('LASTID').AsString) ;
  AForm.Free ;
end;

function twf_TReportManager.WorkFlowStart: TForm;
begin
 result := TReportManager.Create(self);
 result.Parent := self.Parent ;
 result.BorderStyle := bsNone ;
 result.show ;
 result.Align := alClient ;
 TReportManager(Result).Panel3.Visible := False ;
 TReportManager(Result).ExecuteReport(DMTCCoreLink.GetLocalPluginDir + Inparams.paramByName('REPORT').AsString,'TCVAR_DOCID=' +Inparams.paramByName('LASTID').AsString
 +#13+#10 + Inparams.paramByName('RAPARAMS1').AsString
 +#13+#10 + Inparams.paramByName('RAPARAMS2').AsString
 +#13+#10 + Inparams.paramByName('RAPARAMS3').AsString
 +#13+#10 + Inparams.paramByName('RAPARAMS4').AsString  +#13+#10 +
 TDatabaseTableRoutines.GetDatasetAsParamString(locWorkFlowDataset,false)
 ,Inparams.paramByName('VIEWTYPE').AsInteger );
 TReportManager(Result).CBReport.Enabled := False ;

end;

procedure TReportManager.ExecuteReport(Areport, params: String;
  ShowType: Integer);
var



  i : Integer ;
  Adesc : String ;
begin
   ShowReportType := ShowType ;
   FReportDir := ExtractFilePath(Areport) ;
   Adesc := ChangeFileExt(ExtractFileName(Areport),'');
 if pos('TRN_',Adesc) = 1 then
        begin
         ADesc := copy(Adesc,5,255);
         Adesc := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ADesc,0));
        end else
  if pos('LANG_',Adesc) = 1 then
        begin
         ADesc := copy(Adesc,6,255);
         Adesc := DMTCCoreLink.GetTextLangNoAmp(StrToIntDef(ADesc,0));
        end ;
   RefreshReportsList ;
   AParamList.text := params ;
    CBReport.ItemIndex := CBReport.Items.IndexOf(Adesc) ;
    CBReportChange(self);
    DMTCCoreLink.AssignConnectionToChilds(self);


       CustomRoutine :=  HandelReport ;
       InitDatabase(nil);
       VCLReport1.Filename := Areport ;
       VCLReport1.Title  := Areport ;
       VCLReport1.CheckLoaded;
        if VCLReport1.Report.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
        with VCLReport1.Report.DatabaseInfo.Add('SETOFBOOKS') do
          begin
            Driver := rpdatazeos;
            ZConnection := DMTCCoreLink.TheZConnection ;
          end else
          begin
            with VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
              begin
                Driver := rpdatazeos;
                ZConnection := DMTCCoreLink.TheZConnection ;
              end;
          end;

       for i := 0 to AParamList.count -1 do
         if VCLReport1.Report.Params.FindParam(AParamList.Names[i]) <> nil then
           VCLReport1.Report.Params.FindParam(AParamList.Names[i]).Value := AParamList.ValueFromIndex[i];

    //  VCLReport1.ShowParams ;
    //  VCLReport1.Report.PrintOnlyIfDataAvailable := false ;
end;
procedure TReportManager.EndReport;
var
  Filename : String ;


begin
  Filename  := IncludeTrailingPathDelimiter(SavePath) + 'PDF' + formatDateTime('YYYYMMDDHHNN',now) + '.pdf'  ;
    case  ShowReportType of
         0 : begin

                  VCLReport1.Preview := true ;
                  VCLReport1.Execute ;
             end;
         1 : begin
              VCLReport1.ShowPrintDialog := false ;
              VCLReport1.ShowProgress := false ;


            //  for i := 0 to NumCopies -1 do
               //   begin
                  VCLReport1.Preview := false ;
                  VCLReport1.Execute ;
                 // end;
               end;
         2 : begin
               if SaveDialog1.Execute then
                 begin
                   case  SaveDialog1.FilterIndex of
                    1 : VCLReport1.SaveToPDF(ChangeFileExt(SaveDialog1.FileName,'.pdf'));
                    2 : VCLReport1.SaveToExcel(ChangeFileExt(SaveDialog1.FileName,'.xls'));
                    3 : VCLReport1.SaveToMetafile(ChangeFileExt(SaveDialog1.FileName,'.emf'));
                    4 : VCLReport1.SaveToText(ChangeFileExt(SaveDialog1.FileName,'.txt'));
                    5 : VCLReport1.SaveToHTML(ChangeFileExt(SaveDialog1.FileName,'.htm'));
                    6 : VCLReport1.SaveToSVG(ChangeFileExt(SaveDialog1.FileName,'.svg'));
                    7 : VCLReport1.SaveToCSV(ChangeFileExt(SaveDialog1.FileName,'.csv'));
                   end ;
                   ShellExecute(Handle, 'open', pchar(SaveDialog1.FileName), nil, nil, SW_SHOW)
                 end;
             end;
         3 : begin
                VCLReport1.SaveToPDF(FileName);
             end;
         end;
       with VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
              begin
                Driver := rpdatazeos;
                ZConnection := nil  ;
              end;
      

end;
initialization
 if not ModuleIsLib then
twf_TReportManager.Create(nil);
end.
