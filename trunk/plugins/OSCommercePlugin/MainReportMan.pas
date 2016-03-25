unit MainReportMan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, DBClient, rpalias, rpmdesignervcl,
  rpcompobase, rpvclreport, DBTables,rpreport, ImgList,rptypeval,rpmdconsts,rpbasereport,
  ZAbstractTable, DBAccess , Uni, ZAbstractRODataset, ZAbstractDataset,ZConnection;

type
  TfrMainReportMan = class(TForm)
    BAdd: TButton;
    CDMainList: TClientDataSet;
    CDMainListFilename: TStringField;
    CDMainListReportType: TIntegerField;
    CDMainListLanguage: TStringField;
    CDMainListFileDate: TDateTimeField;
    CDMainListFullPath: TStringField;
    CDMainListID: TIntegerField;
    BEdit: TButton;
    BPrint: TButton;
    VCLReport1: TVCLReport;
    RpDesignerVCL1: TRpDesignerVCL;
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
  private
    procedure SaveToStream(Stream: TStream);
    { Private declarations }
  public
    reportDir : String ;
    NewreportDir : String ;
    LastId : Integer ;
    { Public declarations }
    procedure BuildDir ;
    procedure BuildDirRecurse(AParent : TTreeNode;ADir : String );
    function EditReport : Boolean ;
    function GetDirNameFromTreeNode(Anode : TTreeNode ) : String ;
  end;

  procedure MyFunction (value:TIdenFunction;var returnvalue:TRpValue);

function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
  

var
  frMainReportMan: TfrMainReportMan;
  LabelCounter : Integer ;
implementation

  uses rpmdfmainvcl, rpdatainfo,ShellApi,IniFiles , UDMTCCoreLink;
{$R *.dfm}


function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
 var
   AStream : TMemoryStream ;
   AStrings : TStringList ;
begin
   Application.Handle :=   AApplicationHandle ;
   AStrings := TStringList.create ;
   try
   AStrings.Text :=  InProcessFile ;
   // done : Get application icon
    AStream := TMemoryStream.create ;
   try
   TApplication(AApplication).Icon.SaveToStream(AStream);
   AStream.Position := 0 ;
   Application.Icon.LoadFromStream(AStream);
   finally
     AStream.free ;
   end ;
  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  AApplication ;
     frMainReportMan:= TfrMainReportMan.Create(nil);
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
   Application.Handle := 0 ;
   end;
end;




function gettextlang(AID : Integer ) : String ;
begin
 DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.GetTextLang(AID) ;
end;

Function  ReadReportOp(vfield:String;aValue:Variant):TField;
Begin
 with frMainReportMan do
  begin
  if tblOpReport.Active=False then
    tblOpReport.Open;
  if not tblOpReport.locate('StrOption',vField,[LoCaseinsensitive]) then
  begin
    tblOpReport.Append;
    tblOpReportStrOption.AsString:=vField;
    if VarType(aValue) = varBoolean then
    tblOpReportSOptionValue.AsString:= BoolToStr(aValue,true);
    if VarType(aValue) = varDouble then
      tblOpReportSOptionValue.AsString:= formatFloat('#######.#####',aValue)
    else
      tblOpReportSOptionValue.AsString:= VarToStr(aValue);

    tblOpReportWOptionTypeID.AsString:='0';
    tblOpReport.Post;
  end;
  result:=tblOpReportSOptionValue;
  end;
end;

function StrReverse( var S: String ) : string;
var
i, j : word;
begin
   Result:=S;
   j := 1;
   for i := Length( S ) downto 1 do
      begin
      Result[j] := S[i];
      Inc( j );
      end;
   S := Result;                  { so it works like a C stdlib function }
end;


function CnvNumberToText( const sNum : String ) : string;
Type
  DIGITS = set of 0..9;
  POSITION = set of 1..13;
Const
  Tens : POSITION = [ 2,5,8,11];
  Hundreds : POSITION = [ 3,6,9,12];
  Thousands : POSITION = [ 4 ];
  Millions  : POSITION = [ 7 ];
  Billions  : POSITION = [ 10 ];
  BigNums   : POSITION = [ 4,7,10,13 ];
var
  MyNumber : string;
  i, iNum : word;
  bQualifier : boolean;
  NUMBERS   : array [1..19] of string[9];
  DECANUMS  : array [2..9] of string[9];
  MONDONUMS : array [4..13] of string[8];
begin
  for i:=1 to 19 do
  // One to nineteen
    NUMBERS[i]:= gettextlang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= gettextlang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= gettextlang(155);
  MONDONUMS[7]:= gettextlang(156);
  MONDONUMS[10]:= gettextlang(795);
  MONDONUMS[13]:= gettextlang(796);
  // My begin
   MyNumber := sNum;
   Result := '';                            { set a default value }
   bQualifier := True;
   StrReverse( MyNumber );
   i := Length( MyNumber );
   while i>0 do
      begin
      if ( i in Tens) and ( MyNumber[i] <> '0' ) then
         begin
         bQualifier := True;
         if MyNumber[i] = '1' then
            begin
            iNum := StrToInt( Copy( MyNumber, i, 1 ) );
            iNum := iNum * 10;
            Dec(i);                    { we're taking two this pass so bump i}
            iNum := iNum + StrToInt( Copy( MyNumber, i, 1 ) );
            Result := Result + NUMBERS[iNum] + ' ';
            end
         else
            begin
            iNum := StrToInt( Copy( MyNumber, i, 1 ) );
            Result := Result + DECANUMS[iNum] + ' ';
            if MyNumber[i-1] = '0' then
               Dec(i);
            end;
         end                   { end of Tens }
      else if MyNumber[i] <> '0'  then
         begin
         bQualifier := True;
         iNum := StrToInt( Copy( MyNumber, i, 1 ) );
         Result := Result + NUMBERS[iNum] + ' ';
         end;
      { check if hundreds qualifier is needed }
      if ( i in Hundreds ) and (MyNumber[i] <> '0') then
         Result := Result + gettextlang(154)+' ';
      { check if additional qualifier is needed }
      if ( i in BigNums ) and ( bQualifier ) then
         begin
         bQualifier := False;
         Result := Result + MONDONUMS[i] + ' ';
         end;
     Dec(i);
   end;                                 { end of outer for loop }

end;


// done : Pietere Dutch Translation
function CnvNumberToTextDutch( const sNum : Integer ) : string;
Type
  DIGITS = set of 0..9;
  POSITION = set of 1..13;
Const
  Tens : POSITION = [ 2,5,8,11];
  Hundreds : POSITION = [ 3,6,9,12];
  Thousands : POSITION = [ 4 ];
  Millions  : POSITION = [ 7 ];
  Billions  : POSITION = [ 10 ];
  BigNums   : POSITION = [ 4,7,10,13 ];

var
  MyNumber : string;
  i, iNum : word;
  bQualifier : boolean;
  NUMBERS   : array [1..19] of string[9];
  DECANUMS  : array [2..9] of string[9];
  MONDONUMS : array [4..13] of string[8];
 LNum : Integer ;
   function getBase(ANumber : Integer) : String ;
     Var TempNr : Integer ;
    begin
       if ANumber > 100 then
         begin
               if   ANumber div 100 > 1 then
                    result :=  NUMBERS[ANumber div 100]  + MONDONUMS[5]
               else result := MONDONUMS[5] ;
            ANumber := ANumber mod 100 ;
         end;

       if ANumber < 20 then
         begin
         if ANumber > 0 then
         result := result+NUMBERS[ANumber]
         end
         else

         if ANumber < 100 then
           begin
           if ((ANumber mod 10) > 1)then
           begin
         //  result :=  result+NUMBERS[ANumber mod 10] ;
           if (NUMBERS[ANumber mod 10][Length(NUMBERS[ANumber mod 10])] = 'e') then
            result :=  result+NUMBERS[ANumber mod 10]+ 'ën' + DECANUMS[ANumber div 10]
              else
            result :=  result+NUMBERS[ANumber mod 10]+ 'en' + DECANUMS[ANumber div 10]
           end
           else               
           result := result+DECANUMS[ANumber div 10] ;
           end;
    end;
begin
  for i:=1 to 19 do
  // One to nineteen
    NUMBERS[i]:= gettextlang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= gettextlang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= gettextlang(155);
  MONDONUMS[5]:= gettextlang(154);
  MONDONUMS[7]:= gettextlang(156);
  MONDONUMS[10]:= gettextlang(795);
  MONDONUMS[13]:= gettextlang(796);
  // My begin
  Result := '';
  LNum := sNum ;             { set a default value }
  // add from end to begin
  // i stop at 100 miljons now
  if (LNum div 1000000) <> 0 then
     begin
       Result := Result + getBase(LNum div 1000000)+MONDONUMS[7] ;
       lnum := lnum - ((LNum div 1000000) * 1000000);
     end;
  if (LNum div 1000) <> 0 then
     begin
     //  Result := Result + MONDONUMS[5] + getBase(LNum MOD 10000) ;
       Result := Result + getBase(LNum div 1000)+MONDONUMS[4] ;
       lnum := lnum - ((LNum div 1000) * 1000);
     end;
  if (LNum div 100) <> 0 then
     begin
       Result := Result + getBase(LNum div 100)+MONDONUMS[5] ;
       lnum := lnum - ((LNum div 100) * 100);
     end;
       Result := Result + getBase(LNum) ;
end;




function NumberToText( const sAmount : String ) : string;
// Added and Modyfied by Sylvain
// 26-06-000
var
  sMyNumber : string;
  sCents : string[2];
  iDecimal : byte;
  i : word;
begin
   Result := '';
   sMyNumber := sAmount;
   { clean out commas }
      // done : Pieter lets use ThousandSeparator sep
   while Pos(ThousandSeparator, sMyNumber ) > 0 do
      Delete( sMyNumber, Pos(ThousandSeparator, sMyNumber ), 1 );
   { clean out currency symbol }
//   Delete( sWork, Pos( CurrencyString, sWork ), Length( CurrencyString ) );
   { Remove Extra Spaces}
   Trim(sMyNumber);
   { check that the string represents a valid number }
   for i := 1 to Length( sMyNumber ) do
      if not ( sMyNumber[i] in ['0'..'9', DecimalSeparator]) then
         Exit;
   { save the Cents }
   // done : Pieter Lets ude decimal sep.
   iDecimal := Pos(DecimalSeparator, sMyNumber );
   if iDecimal > 0 then
      begin
      sCents := Copy( sMyNumber, iDecimal + 1, 2 ); { Take two, truncate if more }
      while Length( sCents ) < 2 do
         sCents := sCents + '0';
      Delete( sMyNumber, iDecimal, 255 );           { remove the end of the string }
      end
   else
      sCents := '00';
   // Call Now Convertion
   if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
   Result := CnvNumberToTextDutch(StrToInt(sMyNumber) )
   else
   Result := CnvNumberToText( sMyNumber ) ;
   if Result > '' then
   // Add Currency Name
//      Result := gettextlang(157)+' '+Result
      Result := ' '+Result
   else if sMyNumber = '0' then
      Result := gettextlang(157)+' '+gettextlang(2146)+' ' ;
   // Get Cents
   if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
   sMyNumber := CnvNumberToTextDutch(StrToInt(sCents) )
   else
   sMyNumber:= CnvNumberToText( sCents );
   if sMyNumber <>'' then
     begin
       Result:=Result+ ' '+ gettextlang(2145) +' '+  sMyNumber+' ' +gettextlang(158)  ;
     end ;
    result := Lowercase(result);
    if length(result) > 1 then
      result[2]:= UpCase(result[2]);
      if ReadReportOp('NumToTextDutchWay',false).AsBoolean then
        if sMyNumber = '' then
           Result:=Result+' ' +gettextlang(157);
end;


procedure TfrMainReportMan.BuildDir;
var
LastSelected : Integer ;
begin
   LastSelected := -1 ;
   if TVReports.Selected <> nil then
    LastSelected := TVReports.Selected.AbsoluteIndex ;
   TVReports.Items.Clear ;
   while not CDMainList.IsEmpty do
    CDMainList.Delete ;
   LastId := 0 ;
   CDMainList.MergeChangeLog ;
   BuildDirRecurse(nil,reportDir);
   BuildDirRecurse(nil,NewreportDir);

   if LastSelected <> -1 then
   if TVReports.Items.count > LastSelected then
     begin
      TVReports.Items.Item[LastSelected].Expand(true);
      TVReports.Items.Item[LastSelected].Selected := true;
     end;

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


procedure TfrMainReportMan.BuildDirRecurse(AParent: TTreeNode; ADir: String);
var
  ASearchRec : TSearchRec ;
  ANewNode : TTreeNode ;
begin
    if FindFirst(ADir+'*.*', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        if (ASearchRec.Attr and faDirectory)= faDirectory then
         begin
            if (ASearchRec.Name <> '.') and (ASearchRec.Name <> '..') then
             begin
               ANewNode := TVReports.items.AddChildFirst(AParent,ASearchRec.Name) ;
               ANewNode.Data := pointer(0);
               ANewNode.ImageIndex := 0 ;
               ANewNode.SelectedIndex := 0 ;
               BuildDirRecurse(ANewNode,IncludeTrailingPathDelimiter(ADir+ASearchRec.Name))
             end;
          end else
        if (uppercase(ExtractFileExt(ASearchRec.Name))='.REP')then
        begin
           ANewNode := TVReports.items.AddChildFirst(AParent,ChangeFileExt(ASearchRec.Name,'')) ;
           ANewNode.ImageIndex := 1 ;
           ANewNode.SelectedIndex := 1 ;
           CDMainList.Insert ;
           inc(LastId) ;
           ANewNode.Data := pointer(LastId);
           CDMainListID.AsInteger := LastId;
           CDMainListFilename.AsString := ASearchRec.Name ;
           CDMainListFullPath.AsString := ADir ;
           CDMainListLanguage.AsString := ASearchRec.Name ;
           CDMainListFileDate.AsDateTime := FileDateToDateTime(ASearchRec.Time) ;
           CDMainListReportType.AsInteger := 0 ;
           CDMainList.post ;
        end;
      until FindNext(ASearchRec) <> 0;
      FindClose(ASearchRec);
    end;

// TVReports.Items.AddChild(AParent,ADir)
end;

procedure TfrMainReportMan.FormShow(Sender: TObject);
Var AList : TStringList ;
begin
 // TBlLanguage.TableName := ReadT3IniFile('Current Language','File','Eng.db');
  //TBlLanguage.DatabaseName := szFileName ;


  LabelCounter :=0 ;

  reportDir := uppercase(ExtractFilePath(GetModuleName(HInstance)));
  if pos('PLUG_INS',reportDir) <> 0 then
    delete(reportDir,pos('PLUG_INS',reportDir)-1,9);
  NewreportDir :=  IncludeTrailingPathDelimiter(reportDir)+'plug_ins'+PathDelim + 'reports' +PathDelim;
  reportDir := IncludeTrailingPathDelimiter(reportDir)+'reportman';
  if not DirectoryExists(reportDir) then
    CreateDir(reportDir);
  reportDir :=  IncludeTrailingPathDelimiter(reportDir);
  rptypeval.CustomRoutine := MyFunction ;
  BuildDir ;
end;

procedure TfrMainReportMan.BEditClick(Sender: TObject);
begin
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
      VCLReport1.Filename := CDMainListFullPath.AsString + CDMainListFilename.AsString ;
      EditReport ;
         BuildDir ;
     end;
end;

procedure TfrMainReportMan.BPrintClick(Sender: TObject);
begin
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
       CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       VCLReport1.Filename := CDMainListFullPath.AsString + CDMainListFilename.AsString ;
       VCLReport1.ShowParams   ;
       VCLReport1.Execute ;
       VCLReport1.Report.SaveToFile(VCLReport1.Filename);
     end;
end;

function TfrMainReportMan.EditReport : Boolean ;
var
 astream:TFileStream;
 dia:TFRpMainfVCL;
begin
 Result:=false;
 // Creates the form and on close do the save event
 dia:=TFRpMainfVCL.Create(nil);
 try
//   dia.ANew.Enabled:=false;
//  dia.AOpen.Enabled:=false;
//  dia.ASave.Enabled:=false;
//  dia.ASaveAs.Enabled:=false;
  dia.ANew.Visible:=false;
  dia.AOpen.Visible:=false;
  dia.ASave.Visible:=false;
  dia.ASaveAs.Visible:=true;

  dia.report:= VCLReport1.Report;
  dia.filename := VCLReport1.Filename ;
 // dia.LastusedFiles.LastUsed.Clear ;
 // dia.LastusedFiles.LastUsed.add(dia.filename);
 // dia.OnFileClick(self);
 // VCLReport1.AliasList.Connections.clear ;
  if VCLReport1.Report.DatabaseInfo.IndexOf('SETOFBOOKS') = -1 then
  with VCLReport1.Report.DatabaseInfo.Add('SETOFBOOKS') do
    begin
      Driver := rpdatazeos;
      ZConnection := DMTCCoreLink.TheZConnection ;

     // Connect ;
     // UpdateConAdmin ;
    end else
    begin
      with VCLReport1.Report.DatabaseInfo.ItemByName('SETOFBOOKS') do
        begin
          Driver := rpdatazeos;
          ZConnection := DMTCCoreLink.TheZConnection ;
       //   Connect ;
       //   UpdateConAdmin ;
        end;
    end;
  dia.RefreshInterface(self);
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
  dia.ShowModal ;

  astream:=TFileStream.Create(VCLReport1.Filename,fmCreate);
  try
       SaveToStream(astream);
  finally
     astream.free;
  end;
 finally
  dia.free;
 end;
end;

procedure TfrMainReportMan.SaveToStream(Stream:TStream);
var
 memstream:TMemoryStream;
begin
  memstream:=TMemoryStream.Create;
  try
   memstream.WriteComponent(VCLReport1.report);
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
       AFrom  := CDMainListFullPath.AsString + CDMainListFilename.AsString ;
       ATo    := CDMainListFullPath.AsString + 'Copy of ' + CDMainListFilename.AsString ;
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
 if Node <> nil then
    if Node.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
     AFrom  := CDMainListFullPath.AsString + CDMainListFilename.AsString ;
     ATo    := CDMainListFullPath.AsString +  S +'.rep' ;
     if CopyFile(pchar(AFrom),pchar(ATo),true) then
       begin
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
       AFrom  := CDMainListFullPath.AsString + CDMainListFilename.AsString ;
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
   else    result :=  Anode.Text   ;
end;

procedure TfrMainReportMan.Button1Click(Sender: TObject);
Var
 ADir,AFrom : String ;
begin
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       ADir := ExtractFileDir(CDMainListFullPath.AsString + CDMainListFilename.AsString) ;

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

   ShellExecute(Handle, 'open', Pchar(ADir), nil, nil, SW_SHOW);
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
 if TVReports.Selected <> nil then
    if TVReports.Selected.Data <> pointer(0) then
     begin
      CDMainList.locate('ID',integer(TVReports.Selected.Data),[]);
       ADir := ExtractFileDir(CDMainListFullPath.AsString + CDMainListFilename.AsString) ;

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
    if FileExists (AFrom) then
      begin
       CopyFile(pchar(AFrom) ,pchar(ADir),true);
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
       ADir := ExtractFileDir(CDMainListFullPath.AsString + CDMainListFilename.AsString) ;

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

procedure MyFunction(value: TIdenFunction;
  var returnvalue: TRpValue);

var
 FuncName,MyValue : String ;
 i ,From :Integer ;
 MyFLoat : Double ;
begin
 if (not ( (VarType(value.Params[0])=varString) or (VarType(value.Params[0])=varOleStr) )) then
   Raise TRpNamedException.Create(SRpAssignFunc,
         value.IdenName);
 FuncName := value.Params[0] ;

 Do not use
 IF  UpperCase(FuncName) = 'FINDHOUSNR' then
   begin
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr) )) then
       Raise TRpNamedException.Create(SRpAssignFunc,
             value.IdenName);

     returnvalue := '' ;
     MyValue := value.Params[1];
     From := 0 ;
     for i := length(MyValue) downto 1 do
             if MyValue[i] in ['0','1','2','3','4','5','6','7','8','9'] then
              From := i ;

     for i := From downto 1 do
             if MyValue[i] in ['0','1','2','3','4','5','6','7','8','9'] then
               returnvalue := MyValue[i] + returnvalue else
               break ;
   end else
 IF  UpperCase(FuncName) = 'RETURNSQL' then
   begin
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr) )) then
       Raise TRpNamedException.Create(SRpAssignFunc,
             value.IdenName);

     returnvalue := '' ;
     MyValue := value.Params[1] ;
     frMainReportMan.QExecSQL.SQL.Text := MyValue ;
     frMainReportMan.QExecSQL.open ;
     returnvalue :=  frMainReportMan.QExecSQL.Fields[0].value ;
     frMainReportMan.QExecSQL.close ;
   end  else
 IF  UpperCase(FuncName) = 'NUMBERTOWORDS' then
   begin
     if (not ( (VarType(value.Params[1])=varDouble) or (VarType(value.Params[1])=varInteger) )) then
       Raise TRpNamedException.Create(SRpAssignFunc,
             value.IdenName);
     returnvalue := '' ;
     MyFLoat := value.Params[1] ;
     returnvalue := NumberToText(FloatToStr(MyFLoat));
   end else
 IF  UpperCase(FuncName) = 'GETTEXTLANG' then
   begin
     if not  (VarType(value.Params[1])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc,
             value.IdenName);
    if FileExists(ExtractFilePath(Application.ExeName) +'Bin\Languages\' + VartoStr(value.Params[3]) + '.dfm') then
    returnvalue :=  DMTCCoreLink.GetLangTrans(value.Params[1],VartoStr(value.Params[3]))
    else
    returnvalue := DMTCCoreLink.gettextlang(value.Params[1]);
     returnvalue := StringReplace(returnvalue,'&','',[rfReplaceAll]);
   end;
end;
end.

