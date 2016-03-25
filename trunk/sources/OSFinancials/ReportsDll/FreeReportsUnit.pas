(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit FreeReportsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_DSet, FR_DBSet, FR_Class, FR_Shape, FR_E_TXT, FR_E_HTM,
  FR_E_CSV, FR_E_RTF, FR_Desgn,FR_Pars, DB, FR_E_TNPDF, FR_Chart,TcVariables,FR_Intrp,
  FR_Rich,ZConnection;

type
  TfrmFreeReports = class(TForm)
    frReport1: TfrReport;
    DocHeaderDb: TfrDBDataSet;
    DocLinesDB: TfrDBDataSet;
    frShapeObject1: TfrShapeObject;
    frRTFExport1: TfrRTFExport;
    frCSVExport1: TfrCSVExport;
    frHTMExport1: TfrHTMExport;
    frTextExport1: TfrTextExport;
    frDesigner1: TfrDesigner;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    frChartObject1: TfrChartObject;
    frdbChart: TfrDBDataSet;
    frRichObject1: TfrRichObject;
    frTNPDFExport1: TfrTNPDFExport;
    frDBDSDebits: TfrDBDataSet;
    frDBDSCredits: TfrDBDataSet;
    procedure frReport1BeginDoc;
    procedure frReport1UserFunction(const Name: String; p1, p2,
      p3: Variant; var Val: String);
  private
    ExtraVariables : String ;
    { Private declarations }
    Procedure ApplyDocSettings(Force:Boolean=False);
    Function LoadFileReport(Idx,DocumentType:Integer;LayoutFile:String=''):Boolean;
    Procedure GetAllRefs(WAccountID:Integer ; AList : TfrVariables);
  public
    { Public declarations }
  end;

  TT3FunctionLibrary = class(TfrFunctionLibrary)
  public
    constructor Create; override;
    procedure DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: String); override;
  end;
  TT3DBFunctionLibrary = class(TfrFunctionLibrary)
  public
    constructor Create; override;
    procedure DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: String); override;
  end;
// done : Pieter Create when needed
function frmFreeReports: TfrmFreeReports;

{var
  frTT3FunctionLibrary : TT3FunctionLibrary; }

Procedure ShowFrReport(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;LayoutFile:String='';Params:String='');
Function CheckReportMan(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;params,LayoutFile:String): Boolean ;
Procedure ShowFrDesigner;
Function  GetRepName(docType :Integer) : String ;

Function  AddReportForSend(OutPutDevice:integer;CustReportID,Documentype:Integer;LayoutFile:String=''):Boolean;
var
  afrmFreeReports: TfrmFreeReports;
implementation

uses Database,DatabaseAccess, GlobalFunctions, Main,
  LanguageChoice, XRoutines, SendEmailReport,FR_prntr;

{$R *.dfm}

Function CheckReportMan(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;Params,LayoutFile:String): Boolean ;
type
  TRunDocument = function (ADatabase : TUniconnection; Areportname ,Language, Variables,AFilename : PChar;AApplication : HWnd;AApplicationPointer : TComponent;ShowReportType,NumCopies : Integer) : TModalresult ; stdcall ;
  // inpocess could hold in params and outprocess can hold out params.
  // This way the main program can do actions after the plugin closes.
var
   aRunDocument : TRunDocument ;

Function HasFunction(ALname : String ) : Boolean ;
 var
 Ins: HINST;
 DllName,aFilename,Docname : String ;
 ReportFileIndex : Integer ;
begin
 DllName :=ExtractFileDir(Application.ExeName) + '\plugins\reports\'+ALname;
 Ins := LoadLibrary(PChar(DllName));
 if Ins = 0 then
   raise Exception.Create('Error loading DLL from ' + DllName);
 try
  try

   
   aRunDocument := nil ;
   @aRunDocument := GetProcAddress(Ins,'RUNDOCUMENT');
   result := @aRunDocument <> nil ;
   if result then
      begin
         if OutPutDevice = 3 then
           begin
             ReportFileIndex := NextEmailFileNo;
             aFilename  := ApplicationPath+'tmp\Report'+IntToStr(ReportFileIndex) +'.pdf' ;
             Docname := ExtractFilePath(Application.ExeName) + 'plugins\reports\' + currentLanguage +'\documents\' + LayoutFile +'.rep' ;
            result := aRunDocument(dmDatabase.ZMainconnection, pchar(Docname),pchar(currentLanguage),pchar(Params),pchar(aFilename),Application.Handle,Application,OutPutDevice,0) <> 0;
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
            Docname := ExtractFilePath(Application.ExeName) + 'plugins\reports\' + currentLanguage +'\documents\' + LayoutFile +'.rep' ;
            result := aRunDocument(dmDatabase.ZMainconnection, pchar(Docname),pchar(currentLanguage),pchar(Params),'',Application.Handle,Application,OutPutDevice,nbCopies) <> 0;
           end;

      end;
  except
   result := false ;
  end;
 finally { wrap up }
   FreeLibrary(Ins);
 end; { try/finally }

end;

Var
  ItemCaption,
  ItemPos,I    :Integer;
  F            :TSearchRec;
  Bool  : Integer ;
begin

  Result := false ;
  if dmDatabase.SetOfBooksPropertys.DataParameter.CBDONotUseReportMan then exit ;

  Bool := FindFirst(ExtractFileDir(Application.ExeName) + '\plugins\reports\*.dll',faAnyFile,F);
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
    Result := ChangeFileExt(Result,'.frf');
end;

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
   FloatValue,Value2: Double ;
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

Procedure  TfrmFreeReports.GetAllRefs(WAccountID:Integer ; AList : TfrVariables);
Var
 i : Integer ;
 Bol : Boolean ;
begin
  Bol := dmDatabase.tblAccount.Active;
  dmDatabase.tblAccount.Filtered := false ;
  dmDatabase.tblAccount.Active := True;
  if dmDatabase.tblAccount.Locate('WAccountID',WAccountID,[]) then
  begin
    if dmDatabase.tblAccountWAccounttypeID.Value=1 then
    begin
       dmDatabase.tblDebtor.Filtered := false ;
       dmDatabase.tblDebtor.Open;
       if dmDatabase.tblDebtor.Locate('WAccountID',WAccountID,[]) then

       For i := 0 to dmDatabase.tblDebtor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblDebtor.Fields[i].Name] := (dmDatabase.tblDebtor.Fields[i].AsString +' ');
         end else
       // create empty debtors
       For i := 0 to dmDatabase.tblDebtor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblDebtor.Fields[i].Name] := ' ' ;
         end ;
       For i := 0 to dmDatabase.tblCreditor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblCreditor.Fields[i].Name] := ' ' ;
         end;
       dmDatabase.tblDebtor.Close;
    end
    else
    begin
      dmDatabase.tblCreditor.Filtered := false ;
      dmDatabase.tblCreditor.Open;
      if dmDatabase.tblCreditor.Locate('WAccountID',WAccountID,[]) then
       For i := 0 to dmDatabase.tblCreditor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblCreditor.Fields[i].Name] := dmDatabase.tblCreditor.Fields[i].AsString +' ';
         end else
       For i := 0 to dmDatabase.tblCreditor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblCreditor.Fields[i].Name] := ' ' ;
         end;
       // create empty debtors
       For i := 0 to dmDatabase.tblDebtor.FieldCount -1 do
         begin
            AList.Variable['CUST_'+ dmDatabase.tblDebtor.Fields[i].Name] := ' ' ;
         end;
      dmDatabase.tblCreditor.Close;
    end;
  end;
  dmDatabase.tblAccount.Active := Bol;
end;


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
        else result := ChangeFileExt(ReadDocLayoutName,'') ;
    end;
   end ;

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

Function  AddReportForSend(OutPutDevice:integer;CustReportID,Documentype:Integer;LayoutFile:String=''):Boolean;
begin
  RepNbr := NextEmailFileNo;
  frmFreeReports.LoadFileReport(CustReportID,Documentype,LayoutFile);
  try

  Result := ExportFreeReport(7,ApplicationPath+'tmp\Report'+IntToStr(RepNbr));
  if Result then
    Inc(NbrAddDocAtt);
  finally
     FreeAndNil(afrmFreeReports);
  end;
end;

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


Procedure ShowFrReport(OutPutDevice:integer;CustReportID:Integer;nbCopies:Integer;DocumentType:Integer;LayoutFile:String='';Params:String='');
Var
  Ok:Boolean;
  ExpFileName,s:String;
  i:Integer;
  Procedure ExportFrReport;
  begin
    ExpFileName := fmMain.ExportDialog.FileName;
    if pos('.',ExpFileName)>1 then
     ExpFileName:=Trim(Copy(ExpFileName,1,Pos('.',ExpFileName)-1));
//    try

      //frmFreeReports.frReport1.ExportTo(frFilters[fmMain.ExportDialog.FilterIndex - 2].ClassRef,
       //  ChangeFileExt(ExpFileName, Copy(frFilters[fmMain.ExportDialog.FilterIndex - 2].FilterExt, 2, 255)));

      if Not ExportFreeReport(fmMain.ExportDialog.FilterIndex,ExpFileName)then
         OSFMessageDlg(GetTextLang(739){'Exporting Report Error'},mtError,[mbOk],0);

//    Except
      //Error in Export
//       OSFMessageDlg(GetTextLang(739){'Exporting Report Error'},mtError,[mbOk],0);
//    end;
  end;
begin
    SetNbrFormat;
    if Params <> '' then
    Params := #13 + Params ;
    if LayoutFile = '' then
     begin
       if CheckReportMan(OutPutDevice,CustReportID,nbCopies,DocumentType,'TCVAR_DocID=' + dmDatabase.tblDocHeaderWDocID.AsString+Params,GetRepName(DocumentType)) then exit
     end
    else
       if CheckReportMan(OutPutDevice,CustReportID,nbCopies,DocumentType,'TCVAR_DocID=' + dmDatabase.tblDocHeaderWDocID.AsString+Params,LayoutFile) then exit ;

    frmFreeReports.ExtraVariables := Params ;
    OK := frmFreeReports.LoadFileReport(CustReportID,DocumentType,LayoutFile);
    try
    if Ok then
    begin

      Case OutPutDevice of
      1:begin
          frmFreeReports.ApplyDocSettings;
          frmFreeReports.frReport1.ChangePrinter(prn.PrinterIndex,PrnVars.PrinterIndex);
          frmFreeReports.frReport1.PrepareReport;
          frmFreeReports.frReport1.PrintPreparedReport('1',nbCopies);
         end;
       2:begin
           s := 'FreeReport ' + ' (*.frp)|*.frp';
           for i := 0 to frFiltersCount-1 do
             s := s + '|' + frFilters[i].FilterDesc + '|' + frFilters[i].FilterExt;
           //fmMain.ExportDialog.Filter := s;
           fmMain.ExportDialog.FilterIndex := 1;
           if fmMain.ExportDialog.Execute then
            ExportFrReport;
         end ;
        3:begin {Email Reports}
           frmFreeReports.ApplyDocSettings(True);
           frmFreeReports.frReport1.PrepareReport;
           OK := AddReportForSend(OutPutDevice,CustReportID,DocumentType);
//           RepNbr := NextEmailFileNo;
//           ExpFileName := ApplicationPath+'tmp\Report'+IntToStr(RepNbr);
//           ExportFreeReport(4,ExpFileName);
           fmSendEmailReport := TfmSendEmailReport.Create(Application);
           Try
             SetUpForm(fmSendEmailReport);
             fmSendEmailReport.UseFaxMail:=False;
             fmSendEmailReport.CallEmail;
           Finally
             fmSendEmailReport.Free;
           end;
        end;
      else
        frmFreeReports.ApplyDocSettings;
        frmFreeReports.frReport1.PrepareReport;
        frmFreeReports.frReport1.ShowPreparedReport;
      end;
    end
    else
        OSFMessageDlg(gettextlang(2099)+#13#10 + ReadDocLayoutName ,mtinformation,[mbOK],0);
  Finally
    // done : Pieter I see the error of the freereport unit poping up sometimes.
    // Lets destoy it when were done

    freeandnil(afrmFreeReports);
  //  frmFreeReports.Free;
  end;

end;

Procedure ShowFrDesigner;
begin
//  frmFreeReports:=TfrmFreeReports.Create(Application);
  try
    frmFreeReports.frDesigner1.TemplateDir :=ApplicationPath+'bin\reports\';

    // open a doc to serv as example
    dmDatabase.qryDocHead.Open ;
    // last made document will do fine
    dmDatabase.qryDocHead.last ;
    dmDatabase.qrPrnDocLines.Close ;
    SetGrSQlLine(' and DocLine.WDocID = ' + IntToStr(dmDatabase.qryDocHeadWDocID.AsInteger));
    dmDatabase.qrPrnDocLines.Open ;

    // dmDatabase.qrPrnDocLines.SQL.Text :=
    dmDatabase.tblSysVars.Open ;

    frmFreeReports.frReport1.DesignReport;
//    try
//      frmFreeReports.frReport1.Pages.Clear;
//      frmFreeReports.frReport1.Pages.Add;
//    except end;
    dmDatabase.qrPrnDocLines.close ;
    dmDatabase.qryDocHead.Close ;
    dmDatabase.tblSysVars.Close ;

    frmFreeReports.Close;
  finally
    // done : Pieter I see the error of the freereport unit poping up sometimes.
    // Lets destoy it when were done
    freeandnil(afrmFreeReports);
// frmFreeReports.Free;
  end;

end;


Procedure TfrmFreeReports.ApplyDocSettings(Force:Boolean=False);
Var
  BFrames:Boolean;
  i,j:integer;
begin
  BFrames := Force OR ReadReportOp('BDocPrntFrames',True).AsBoolean;
  for i := 0 to frmFreeReports.frReport1.Pages.Count - 1 do
    for j := 0 to frmFreeReports.frReport1.Pages[i].Objects.Count - 1 do
       if ( TObject(frmFreeReports.frReport1.Pages[i].Objects.Items[i]) is TFrView ) then
          (TObject(frmFreeReports.frReport1.Pages[i].Objects.Items[i]) as TFrView).Visible :=BFrames ;
end;

procedure TfrmFreeReports.frReport1BeginDoc;
Var
  S1,S2,S3,s4:String;
  i : Integer ;
  AList : TStringList ;
begin
  AList := TStringList.create ;
  try
    AList.Text := ExtraVariables ;
    if AList.Values['payment1'] = '' then
       AList.Values['payment1'] := '0' ;

    if AList.Values['payment2'] = '' then
       AList.Values['payment2'] := '0' ;
    if AList.Values['payment3'] = '' then
       AList.Values['payment3'] := '0' ;
    if AList.Values['payment4'] = '' then
       AList.Values['payment4'] := '0' ;
    if AList.Values['payment5'] = '' then
       AList.Values['payment5'] := '0' ;
    if AList.Values['AmountPayed'] = '' then
       AList.Values['AmountPayed'] := '0' ;
    if AList.Values['AmountChange'] = '' then
       AList.Values['AmountChange'] := '0' ;

    for i := 0 to AList.Count -1 do
     if AList.ValueFromIndex[i] <> '' then
      begin
         frVariables[AList.Names[i]] := AList.ValueFromIndex[i] ;
      end;
  finally
     AList.free ;
  end;
  s1:=GetCustContact(dmDatabase.tblDocHeaderWAccountID.Value,s2,s3,s4);
  frVariables['Cust_Contact'] := s1;
  frVariables['Cust_Tel'] := s2;
  frVariables['Cust_Fax'] := s3;
  frVariables['Cust_TaxRef'] := s4;
  dmDatabase.qGenII.SQL.Text := format('SELECT Contacts.* FROM Contacts LEFT OUTER JOIN creditor ON  (Contacts.RecordID = Creditor.WContactID) LEFT OUTER JOIN Debtor    ON  (Contacts.RecordID = Debtor.WContactID) where (Debtor.WAccountID = %s or creditor.WAccountID =%s)',[IntToStr(dmDatabase.tblDocHeaderWAccountID.Asinteger),IntToStr(dmDatabase.tblDocHeaderWAccountID.AsInteger)]);
  dmDatabase.qGenII.open ;
  For i:= 0 to dmDatabase.qGenII.FieldCount -1 do
     frVariables['CONT_' + dmDatabase.qGenII.Fields[i].FieldName] := dmDatabase.qGenII.Fields[i].AsString;
  dmDatabase.qGenII.close ;
  GetAllRefs(dmDatabase.tblDocHeaderWAccountID.Value,frVariables) ;

end;

procedure TfrmFreeReports.frReport1UserFunction(const Name: String; p1, p2,
  p3: Variant; var Val: String);
  var
    MyValue,MyValue1,MyValue2 : String ;
    i, From : Integer ;
    MyFLoat : Double ;
begin
 IF  UpperCase(Name) = 'FINDHOUSNR' then
   begin
     Val := '' ;
     MyValue := trim(VarToStr(frParser.Calc(p1)));
     for i := length(MyValue) downto 1 do
             if MyValue[i] in ['0','1','2','3','4','5','6','7','8','9'] then
              From := i ;

     for i := From downto 1 do
             if MyValue[i] in ['0','1','2','3','4','5','6','7','8','9'] then
               val := MyValue[i] + val else
               break ;
      Val := QuotedStr(Val);
   end else
 IF  UpperCase(Name) = 'STRINGREPLACE' then
   begin
     Val := '' ;
     MyValue :=  VarToStr(frParser.Calc(p1)) ;
     MyValue1 := VarToStr(frParser.Calc(p2)) ;
     MyValue2 := VarToStr(frParser.Calc(p3)) ;
     val := StringReplace(MyValue,MyValue1,MyValue2,[rfReplaceAll]) ;
     Val := QuotedStr(Val) ;
   end  else
 IF  UpperCase(Name) = 'RETURNSQL' then
   begin
     Val := '' ;
     MyValue :=  VarToStr(frParser.Calc(p1)) ;
     dmDatabase.qGenII.SQL.Text := MyValue ;
     dmDatabase.qGenII.open ;
     Val :=  dmDatabase.qGenII.Fields[0].AsString ;
     dmDatabase.qGenII.close ;
     //MyValue1 := VarToStr(frParser.Calc(p2)) ;
     //MyValue2 := VarToStr(frParser.Calc(p3)) ;
     //val := StringReplace(MyValue,MyValue1,MyValue2,[rfReplaceAll]) ;
     Val := QuotedStr(Val) ;
   end  else
 IF  UpperCase(Name) = 'ASSTRING' then
   begin
     Val := '' ;
     MyValue :=  VarToStr(frParser.Calc(p2)) ;
     Val :=  VarToStr(frParser.Calc(p1)) ;
     if val = '' then val :=  MyValue ;
     Val := QuotedStr(Val) ;
   end;
 IF  UpperCase(Name) = 'NUMBERTOWORDS' then
   begin
     Val := '' ;
     MyFLoat := abs(Str2Float(VarToStr(frParser.Calc(p1)))) ;
     val :=  NumberToText(FloatToStr(MyFLoat));
     Val := QuotedStr(Val) ;
   end;
  IF  UpperCase(Name) = 'LINEFEED' then
   begin
     Val := QuotedStr(#13+#10) ;
   end;
end;

{ TT3DBFunctionLibrary }

constructor TT3DBFunctionLibrary.Create;
begin
  inherited Create;
  with List do
  begin
     Add('DETAILISEOF'); //0
  end;
end;

procedure TT3DBFunctionLibrary.DoFunction(FNo: Integer; p1, p2,
  p3: Variant; var val: String);
begin
  val := '';
  try
  case FNo of
    // done : Pieter lets use the report op.
    0: begin
          if dmDatabase.qrPrnDocLines.Eof then
          Val := '1'
          else
          Val := '0';
         end;
  end;
  except
  end;
end;

Initialization
  frRegisterFunctionLibrary(TT3FunctionLibrary);
  frRegisterFunctionLibrary(TT3DBFunctionLibrary);

end.
