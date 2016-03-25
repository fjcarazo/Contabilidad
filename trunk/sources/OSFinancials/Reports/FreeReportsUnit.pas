(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit FreeReportsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TcVariables , Uni;

type
  TfrmFreeReports = class(TForm)
  //  procedure frReport1BeginDoc;
  //  procedure frReport1UserFunction(const Name: String; p1, p2,
  //    p3: Variant; var Val: String);
  private
    ExtraVariables : String ;
    { Private declarations }
   // Procedure ApplyDocSettings(Force:Boolean=False);
   // Function LoadFileReport(Idx,DocumentType:Integer;LayoutFile:String=''):Boolean;

  public
    { Public declarations }
  end;

{  TT3FunctionLibrary = class(TfrFunctionLibrary)
  public
    constructor Create; override;
    procedure DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: String); override;
  end;
  TT3DBFunctionLibrary = class(TfrFunctionLibrary)
  public
    constructor Create; override;
    procedure DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: String); override;
  end;  }
// done : Pieter Create when needed
function frmFreeReports: TfrmFreeReports;

{var
  frTT3FunctionLibrary : TT3FunctionLibrary; }

Procedure ShowFrReport(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;LayoutFile:String='';Params:String='';ShowEmail:Boolean =true;Printer : Integer = 0);

Function CheckReportMan(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;params,LayoutFile:String;Language : String ;Location : String = 'plug_ins\reports'): Boolean ;

Function  GetRepName(docType :Integer) : String ;

Function  AddReportForSend(OutPutDevice:integer;CustReportID,Documentype:Integer;LayoutFile:String=''):Boolean;
var
  afrmFreeReports: TfrmFreeReports;
implementation

uses Database,DatabaseAccess, GlobalFunctions, Main,
  LanguageChoice, XRoutines, SendEmailReport, TcashClasses,
  OSFGeneralRoutines, UDMTCCoreLink, UPluginsSharedUnit, OpenLink;

{$R *.dfm}

Function CheckReportMan(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;Params,LayoutFile:String;Language : String ;Location : String = 'plug_ins\reports'): Boolean ;
type
  TRunDocument = function (ADatabase : TUniconnection; Areportname ,Language, Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies : Integer) : TModalresult ; stdcall ;
  // inpocess could hold in params and outprocess can hold out params.
  // This way the main program can do actions after the plugin closes.
var
   aRunDocument : TRunDocument ;
   Asetting : TFormatSettings ;


Function HasFunction(ALname : String ) : Boolean ;
 var
 Ins: HINST;
 DllName,aFilename,Docname : String ;
 ReportFileIndex : Integer ;


begin

 result := false ;
 DllName :=  ExtractFileDir(Application.ExeName) + '\plug_ins\reports\'+ALname;
 if not FileExists(DllName) then
    exit ;

if LoadedPluginList.IndexOf(DllName) = -1 then
   begin
    Ins := LoadLibrary(PChar(DllName));
    LoadedPluginList.AddObject(DllName,TObject(Ins)) ;
   end else
   begin
    Ins := Integer(LoadedPluginList.Objects[LoadedPluginList.IndexOf(DllName)]);
   end;


 if Ins = 0 then
   raise Exception.Create('Error loading DLL from ' + DllName);
  try
   aRunDocument := nil ;
   @aRunDocument := GetProcAddress(Ins,'RUNDOCUMENT');
   result := @aRunDocument <> nil ;
   if result then
      begin
         if OutPutDevice = 3 then
           begin
             ReportFileIndex := NextEmailFileNo;
             aFilename  := DMTCCoreLink.GetLocalBaseDir+'tmp\Report'+IntToStr(ReportFileIndex) +'.pdf' ;
             Docname :=  IncludeTrailingPathDelimiter( DMTCCoreLink.GetLocalBaseDir + Location) +  Language +'\documents\' + LayoutFile +'.rep' ;
             if not FileExists(Docname) then
                Docname :=   ExtractFilePath(Application.ExeName ) +   Location + '\' + Language +'\documents\' + LayoutFile +'.rep' ;
            // showmessage(Docname);

            result := aRunDocument(dmDatabase.ZMainconnection, pchar(Docname),pchar(Language),pchar(Params),pchar(aFilename),Application.Handle,Application,OutPutDevice,0) <> 0;
            if result then
              begin
              fmSendEmailReport := TfmSendEmailReport.Create(Application);
                   Try
                     SetUpForm(fmSendEmailReport);
                     fmSendEmailReport.UseFaxMail:=False;
                     fmSendEmailReport.CallEmail;
                   Finally
                     fmSendEmailReport.Free;
                   end;
              end;
           end else
           begin
            Docname := DMTCCoreLink.GetLocalBaseDir +  Location + '\' +Language +'\documents\' + LayoutFile +'.rep' ;
             if not FileExists(Docname) then
                Docname :=   ExtractFilePath(Application.ExeName ) +    Location + '\' + Language +'\documents\' + LayoutFile +'.rep' ;
            // showmessage(Docname);
            result := aRunDocument(dmDatabase.ZMainconnection, pchar(Docname),pchar(Language),pchar(Params),'',Application.Handle,Application,OutPutDevice,nbCopies) <> 0;
           end;
      end;
  except
   result := false ;
  end;


end;

Var

  F :TSearchRec;
  Bool  : Integer ;
begin
 Asetting :=  TFormatSettings.Create ;
 try

  Result := false ;
 // if dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan then exit ;

  Bool := FindFirst(ExtractFileDir(Application.ExeName) + '\plug_ins\reports\*.dll',faAnyFile,F);
  try
  While Bool = 0 do
  begin
    if  HasFunction(F.Name) then
    begin
       result := true ;
       break ;
    end ;
    Bool := FindNext(F);
  end;
     // done : pieter Findclose to perserve resource
  finally
    FindClose(f);
  end ;
  finally
    FormatSettings := Asetting ;
  end;
end;

function frmFreeReports: TfrmFreeReports;
begin
   if not assigned(afrmFreeReports) then
   afrmFreeReports:= TfrmFreeReports.Create(Application);
   result := afrmFreeReports ;
end;


Function ReadDocLayoutName:String;
begin

  Result := ReadReportOp('SDocLayoutName','DefaultA4').AsString;
  if Result<>'' then
    Result := ChangeFileExt(Result,'.rep');
end;
          {
constructor TT3FunctionLibrary.Create;
begin
  inherited Create;
  with List do
  begin
    Add('FORMAT'); //0
    Add('GETDESCRIPTION'); //1
    Add('GETDESCRIPTIONEX'); //2
    Add('GETDOCHEAD'); //3
    Add('GETDOCMODEL'); //4
    Add('GETDOCTYPE'); //5
    Add('GETTEXT'); //6
    Add('GETUNITDESC'); //7
    Add('PRINTLOGO'); //8
    Add('PRINTPIC'); //9
    Add('TAXREF'); //10
    Add('TRANSLATED'); //11
   // add('FORMATNOSIGN');
   // adding more functions will make this thing act strange.
   // Sylvain: This list is sorted and index in DoFunction
  end;
end;

procedure TT3FunctionLibrary.DoFunction(FNo: Integer; p1, p2, p3: Variant;
  var val: String);
  Var
   FloatValue: Double ;
begin
  val := '';
  try
  case FNo of
    // done : Pieter lets use the report op.
    0: begin
       FloatValue :=  Var2Float(VarToStr(frParser.Calc(p1))) ;
       if varToStr(p2) <> '' then
         begin
           if FloatValue <> 0 then
              val :=  '''' + FloatToStrT(FloatValue,ffFixed, 18, -1) + '''';
         end
         else
       if ReadNwReportOp('BUseCurSign',false).AsBoolean then
         begin
           if FloatValue <> 0 then
              val :=  '''' + FormatFloat(GetViewMask(0),FloatValue) + ''''
         end
          else
         begin
           if FloatValue <> 0 then
              val :=  '''' + FloatToStrT(FloatValue,ffFixed, 18, -1) + '''';
         end;
       end;
    1: begin
       FloatValue :=  Var2Float(VarToStr(frParser.Calc(p2))) ;
       Val := AnsiQuotedStr(GetDbDescription(frParser.Calc(p1),round(FloatValue)),'''');
       end;
    2: begin
       Val := AnsiQuotedStr(GetDbDescriptionEx(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3)),'''');
       end;
    3: begin
       FloatValue :=  Var2Float(VarToStr(frParser.Calc(p1))) ;
       Val := AnsiQuotedStr(GetDocHeadingMes(round(FloatValue)),'''');
       end;
    4: Val := IntToStr(DocModel);
    5: begin
       Val := IntToStr(idDocType);
       end;
    6: begin
        FloatValue :=  Var2Float(VarToStr(frParser.Calc(p1))) ;
        Val := AnsiQuotedStr(_ReadDescription(Round(FloatValue)),'''');
        if  (varToStr(p2) <> '') and (varToStr(p3) <> '') then
          Val := StringReplace(Val,varToStr(p2),varToStr(p3),[rfReplaceAll]);
       end;
    7:  begin
           Val := '' ;
            if  VarToStr(frParser.Calc(p1)) <> '' then
              Val :=  AnsiQuotedStr(GetUnitDesc(frParser.Calc(p1)),'''');
              end;
    8: begin
         Val:='0';
         if ReadReportOp('BUseCompPicLogo',False).AsBoolean then
           Val:='0'
         else
         if dmDatabase.tblSysVarsBUnitsExist.Value = 1 then
           Val:='1';
       end;
    9: begin
         Val := '0';
         if ReadReportOp('BUseCompPicLogo',False).AsBoolean then
           Val := '1';
       end;
    10:  begin
        FloatValue :=  Var2Float(VarToStr(frParser.Calc(p1))) ;
        Val := AnsiQuotedStr(GetTaxRef(round(FloatValue)),'''');
        end;
    11: begin
        FloatValue :=  Var2Float(VarToStr(frParser.Calc(p1))) ;
        Val := AnsiQuotedStr(GetTextLang(round(FloatValue)),'''');
        end;
  end;
  except
  end;
end;
           }
      (*
Function ExportFreeReport(AtypeIdx:Integer;ExpFileName:String):Boolean;
begin
 try
   Result := True;
   frmFreeReports.frReport1.PrepareReport ;
   With frmFreeReports do
   Case AtypeIdx of
   1:frmFreeReports.frReport1.ExportTo(TfrHTMExportFilter,ExpFileName+'.html');
   2:frmFreeReports.frReport1.ExportTo(TfrTextExportFilter,ExpFileName+'.txt');
   3:frmFreeReports.frReport1.ExportTo(TfrCSVExportFilter,ExpFileName+'.csv');
   4:frmFreeReports.frReport1.ExportTo(TfrRTFExportFilter ,ExpFileName+'.doc');
   5:frmFreeReports.frReport1.ExportTo(TfrCSVExportFilter,ExpFileName+'.csv');
   6:;//wmf
   7:frmFreeReports.frReport1.ExportTo(TfrTNPDFExportFilter,ExpFileName+'.pdf');
   else
     Result := False;
     OSFMessageDlg(GetTextLang(739){'Exporting Report Error'},mtError,[mbOk],0);
   end;
  Except
    //Error in Export
    Result := False;
     OSFMessageDlg(GetTextLang(739){'Exporting Report Error'},mtError,[mbOk],0);
  end;

end;
          *)



Function GetRepName(docType :Integer) : String ;
   begin
  case docType of
        9 :   result := ReadReportOp('SDocLayoutName','DefaultA4').AsString ;
        10 :  result := ReadReportOp('SDocLayoutNameInv',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString  ;
        11 :  result := ReadReportOp('SDocLayoutNameCreditNote',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString  ;
        12 :  result := ReadReportOp('SDocLayoutNamePurchases',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString  ;
        13 :  result := ReadReportOp('SDocLayoutNameGret',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString  ;
        15 :  result := ReadReportOp('SDocLayoutNameOrder',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString  ;
        14 :  result := ReadReportOp('SDocLayoutNameQuote',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString   ;
        16 :  result := ReadReportOp('SDocLayoutStockin',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString   ;
        17 :  result := ReadReportOp('SDocLayoutStockOut',ReadReportOp('SDocLayoutName','DefaultA4').AsString).AsString   ;
        else result := ReadReportOp('SDocLayoutName','DefaultA4').AsString  ;
    end;
   end ;
      (*
Function TfrmFreeReports.LoadFileReport(Idx,DocumentType:Integer;LayoutFile:String=''):Boolean;

begin
 Try
   Result:=True;
   {Sylvain: Save this to be used in the document}
   idDocType := DocumentType;
   if LayoutFile = '' then
   frmFreeReports.frReport1.LoadFromFile(ApplicationPath+'bin\reports\' + GetRepName(DocumentType)+'.frf')
   else
   frmFreeReports.frReport1.LoadFromFile(ApplicationPath+'bin\reports\' + LayoutFile +'.frf');

 except
   Result := False;
 end;
end;
        *)


Function  AddReportForSend(OutPutDevice:integer;CustReportID,Documentype:Integer;LayoutFile:String=''):Boolean;
begin
  RepNbr := NextEmailFileNo;
  ShowFrReport(3,CustReportID,0, Documentype, LayoutFile) ;
end;
        (*
Procedure ChangePgeSize(arprtType:integer);
Var
  aMust:Boolean;
  aLeft,aRight,aBott,aTop,aWidth,aLen : Real;
begin
  {arprtType
    3== Docments
    1== Statement Sizes
    2== Other Reports}
  if arprtType>=10 then exit; {This should print as is}
  if Not (arprtType in [1,3]) then
    arprtType:=2;
  dmDatabase.tblOpReport.Open;
  GetRprtSizes(arprtType,aLeft,aRight,aBott,aTop,aWidth,aLen,aMust);
  dmDatabase.tblOpReport.Close;
  BDefaultPrint:=Not aMust;
  if aMust then
  begin
    frmFreeReports.frReport1.PageSettings.Apply := True;
    frmFreeReports.frReport1.PageSettings.Height := Trunc(aLen*10);
    frmFreeReports.frReport1.PageSettings.Width := Trunc(aWidth*10);
    {
    CustReport.Page.PaperSize:=QRPrntr.Custom;
    CustReport.Page.Length := aLen;
    CustReport.Page.Width := aWidth;
    CustReport.Page.BottomMargin := aBott;
    CustReport.Page.TopMargin :=  aTop;
    CustReport.Page.LeftMargin := aLeft;
    CustReport.Page.RightMargin := aRight;
    }
  end;
end;
            *)

Procedure ShowFrReport(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;LayoutFile:String='';Params:String='';ShowEmail:Boolean =true;Printer : Integer = 0);
Var

  Ok:Boolean;
  ExpFileName,s,CheckRepname :String;
  i:Integer;
  Procedure ExportFrReport;
  begin
    (*ExpFileName := fmMain.ExportDialog.FileName;
    if pos('.',ExpFileName)>1 then
     ExpFileName:=Trim(Copy(ExpFileName,1,Pos('.',ExpFileName)-1));
      if Not ExportFreeReport(fmMain.ExportDialog.FilterIndex,ExpFileName)then
         OSFMessageDlg(GetTextLang(739){'Exporting Report Error'},mtError,[mbOk],0);  *)
  end;
begin
    SetNbrFormat;
    if Params <> '' then
    Params := #13 + Params ;
    if LayoutFile = '' then
     begin
       CheckRepname := GetRepName(DocumentType) ;

       if not FileExists(DMTCCoreLink.GetLocalPluginDir +'reports\documents\documents\' + CheckRepname + '.rep') then
          if FileExists(DMTCCoreLink.GetLocalPluginDir +'reports\documents\documents\' + 'TRN_' + IntToStr(DMTCCoreLink.GetTextNum(CheckRepname) ) + '.rep') then
           CheckRepname :=  'TRN_' +IntToStr(DMTCCoreLink.GetTextNum(CheckRepname)) ;


       if CheckReportMan(OutPutDevice,CustReportID,nbCopies,DocumentType,'OSFPRINTER='+IntToStr(Printer)+#10+#13+'TCVAR_DocID=' + dmDatabase.tblDocHeaderWDocID.AsString+Params,CheckRepname,'DOCUMENTS') then
       begin

       exit
       end else
       Showmessage(CheckRepname +' file not found! See setup documents for defaultlayout');
     end
    else
       if CheckReportMan(OutPutDevice,CustReportID,nbCopies,DocumentType,'OSFPRINTER='+IntToStr(Printer)+#10+#13+'TCVAR_DocID=' + dmDatabase.tblDocHeaderWDocID.AsString+Params,LayoutFile,'DOCUMENTS') then
         begin
          exit ;
         end else
         Showmessage(LayoutFile +' file not found!');

end;




end.
