unit UDMReportsGlobals;

interface

uses
  SysUtils, Classes,osfLookup,forms , UConnectionClass, rpmdesignervcl,rprfvparams,rptypeval,rpmdconsts, rpcompobase,
  rpvclreport,rpdatainfo,dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TDMReportsGlobals = class(TForm)
    VCLReport1: TVCLReport;
    RpDesignerVCL1: TRpDesignerVCL;
    VCLPageSettings: TVCLReport;
    IdHTTP1: TIdHTTP;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    function EditReport : Boolean;
    procedure SaveReport ;
    procedure setupdatabase;
    procedure SaveToStream(Stream: TStream);
    { Private declarations }
  public
    Alookup : TOsfLookup ;
    IsNonGuiApp : Boolean ;
    aOSAConnectionItem : TOSAConnectionItem ;
    dia:TFRpRTParams;
    procedure ShowReport(AReport,ACaption,Params  : String;ShowType : Integer = 0;FileName : String = '';ForcePrintVars:Boolean = false) ;

    { Public declarations }
  end;


procedure  HandelReport (value:TIdenFunction;var returnvalue:TRpValue);

var
  DMReportsGlobals: TDMReportsGlobals;

implementation

uses UDMTCCoreLink,  variants ,rpmdfmainvcl,shellapi, OSFGeneralRoutines ,rpTypes, rpparams,PDF417,Graphics;

{$R *.dfm}


procedure PDF417FillStream(Astream : Tstream;BarCode,RecieptAddress,SenderAdd,Timestamp : String);
var
segment:integer;
pdf417:TPDF417 ;
bmp:TBitmap;

begin
 pdf417:=TPDF417.create(nil);
 try
 pdf417.code:= Barcode ;

 pdf417.PDFECLevel:=0;
 pdf417.PDFMode:=PDF_TEXT;
 pdf417.PDFtruncated:=false;


 pdf417.PDFRows:=30;


 pdf417.PDFColumns:=6  ;

 pdf417.MacroPDFLastSegment := True ;
 pdf417.PDFECLevel := 7 ;
 pdf417.PDFMacroSegment:=-1 ;


 pdf417.BarWidthPixels:=1 ;


 pdf417.BarHeightPixels:=2  ;


 pdf417.HorizontalPixelShaving:=0  ;

 

 pdf417.VerticalPixelShaving:=0  ;

{val(txtSegmentCount.text,value,dummy);
 pdf417.PDFMacroSegmentCount:=value}


 pdf417.PDFMacroAddresse:=RecieptAddress;
 pdf417.PDFMacroSender:=SenderAdd;
 pdf417.PDFMacroTimestamp:=Timestamp;

 pdf417.PDFMacroFileSize:=0;
 pdf417.PDFMacroFilename:='';
 pdf417.PDFMacroFileId:='';



 pdf417.width:=800;
 pdf417.height:=400;


 pdf417.resetMacroPDF();
 if (pdf417.PDFMacroSegment>-1) then   begin
     segment:=pdf417.PDFMacroSegment;
     {calculate number of segment needed}
     pdf417.prepareMacroPDF();

     pdf417.PDFMacroSegment:=segment ;

 end;

 bmp:=TBitmap.create;
 try
 bmp.width := 800 ;
 bmp.Height := 400 ;
 pdf417.paintBarcode(bmp.Canvas);
  if not DMTCCoreLink.IsRegistered('{CD908CC1-E04D-4305-A173-C7A0B6AA2586}') then
    bmp.Canvas.TextOut(10,10,'OSfinancials Demo PDF417');

 bmp.SaveToStream(Astream);
 finally
  bmp.free ;
 end;
 finally
 pdf417.free;
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
    NUMBERS[i]:= DMTCCoreLink.gettextlang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= DMTCCoreLink.gettextlang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= DMTCCoreLink.gettextlang(155);
  MONDONUMS[7]:= DMTCCoreLink.gettextlang(156);
  MONDONUMS[10]:= DMTCCoreLink.gettextlang(795);
  MONDONUMS[13]:= DMTCCoreLink.gettextlang(796);
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
         Result := Result + DMTCCoreLink.gettextlang(154)+' ';
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
  i  : word;

  NUMBERS   : array [0..19] of string[9];
  DECANUMS  : array [2..9] of string[9];
  MONDONUMS : array [4..13] of string[8];
 LNum : Integer ;
   function getBase(ANumber : Integer) : String ;

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
         if ANumber > -1 then
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
  NUMBERS[i]:= 'nul ' ;
  for i:=1 to 19 do
  // One to nineteen
    NUMBERS[i]:= DMTCCoreLink.gettextlang(i+126);
  for i:=2 to 9 do
  // Twenty to ninety
    DECANUMS[i]:= DMTCCoreLink.gettextlang(i+144);
  for i:=4 to 13 do
  // Thousand,Million,Billion,Trillion;
    MONDONUMS[i]:= '';
  MONDONUMS[4]:= DMTCCoreLink.gettextlang(155);
  MONDONUMS[5]:= DMTCCoreLink.gettextlang(154);
  MONDONUMS[7]:= DMTCCoreLink.gettextlang(156);
  MONDONUMS[10]:= DMTCCoreLink.gettextlang(795);
  MONDONUMS[13]:= DMTCCoreLink.gettextlang(796);
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
   if DMTCCoreLink.ReadNwReportOp('NumToTextDutchWay',false)  then
   Result := CnvNumberToTextDutch(StrToInt(sMyNumber) )
   else
   Result := CnvNumberToText( sMyNumber ) ;
   if Result <> '' then
      Result := ' '+Result
   else if sMyNumber = '0' then
      Result := DMTCCoreLink.gettextlang(157)+' '+DMTCCoreLink.gettextlang(2146)+' ' ;
   // Get Cents
   if DMTCCoreLink.ReadNwReportOp('NumToTextDutchWay',false)  then
   sMyNumber := CnvNumberToTextDutch(StrToInt(sCents) )
   else
   sMyNumber:= CnvNumberToText( sCents );
   if sMyNumber <>'' then
     begin
       Result:=Result+ ' ' +DMTCCoreLink.gettextlang(157) + ' ' + DMTCCoreLink.gettextlang(2145) +' '+  sMyNumber+' ' +DMTCCoreLink.gettextlang(158)  ;
     end ;
    result := Lowercase(result);
    if length(result) > 1 then
      result[2]:= UpCase(result[2]);
      if DMTCCoreLink.ReadNwReportOp('NumToTextDutchWay',false) then
        if sMyNumber = '' then
           Result:=Result+' ' +DMTCCoreLink.gettextlang(157);
end;

procedure  HandelReport (value:TIdenFunction;var returnvalue:TRpValue);
var
 FuncName,MyValue : String ;
 i ,From :Integer ;
 MyFLoat : Double ;
 Astream : TMemoryStream ;
 AByte : Byte ;
 AList :TStringlist ;
 aIdhttp : TIdHTTP ;
begin
 From := 0 ;
 if (not ( (VarType(value.Params[0])=varString) or (VarType(value.Params[0])=varOleStr) or (VarType(value.Params[0]) = varUString) )) then
   Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
         value.IdenName);
 FuncName := value.Params[0] ;
  IF  UpperCase(FuncName) = 'HTTPGET' then
   begin
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr)or (VarType(value.Params[1]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if (not ( (VarType(value.Params[2])=varString) or (VarType(value.Params[2])=varOleStr) or (VarType(value.Params[2]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
            aIdhttp := TIdHTTP.Create(nil) ;
            Astream := TMemoryStream.create ;
            try
              aIdhttp.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)' ;
              aIdhttp.Get(value.Params[1],Astream)  ;
              Astream.position := 0 ;
              if value.Params[2] <> '' then
              begin
                Astream.SaveToFile(value.Params[2]);
              end else
              begin
              returnvalue  := VarArrayCreate([0,Astream.Size-1],17) ;
              i := 0 ;
              while Astream.Size <> Astream.Position do
                begin
                  Astream.Read(AByte,1);
                  returnvalue[i] := AByte ;
                  inc(i);
                end;
              end;
            finally
             Astream.Free ;
             aIdhttp.free ;
            end;
    end;

  IF  UpperCase(FuncName) = 'BARCODE' then
   begin
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr) or (VarType(value.Params[1]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     if (not ( (VarType(value.Params[2])=varString) or (VarType(value.Params[2])=varOleStr) or (VarType(value.Params[2]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     if (not ( (VarType(value.Params[3])=varString) or (VarType(value.Params[3])=varOleStr) or (VarType(value.Params[3]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     if (not ( (VarType(value.Params[4])=varString) or (VarType(value.Params[4])=varOleStr) or (VarType(value.Params[4]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if (not ( (VarType(value.Params[5])=varString) or (VarType(value.Params[5])=varOleStr)  or (VarType(value.Params[5]) = varUString))) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     if value.Params[1] = 'PDF417' then
          begin
            Astream := TMemoryStream.create ;
            try
              PDF417FillStream(Astream,value.Params[2],value.Params[3],value.Params[4],value.Params[5])  ;
              Astream.position := 0 ;
              returnvalue  := VarArrayCreate([0,Astream.Size-1],17) ;
              i := 0 ;
              while Astream.Size <> Astream.Position do
                begin
                  Astream.Read(AByte,1);
                  returnvalue[i] := AByte ;
                  inc(i);
                end;
            finally
             Astream.Free ;
            end;
          end;
   end  else
        if value.Params[1] = 'GETBASEDIR' then
          begin
             if VarToStr(value.Params[2]) = '0' then
               returnvalue := DMTCCoreLink.GetLocalSaveDir
               else
               if VarToStr(value.Params[2]) = '1' then
               returnvalue := DMTCCoreLink.GetLocalBaseDir
               else
               returnvalue := DMTCCoreLink.GetLocalPluginDir ;
          end else
        if value.Params[1] = 'GETTYPEIMAGE' then
          begin
            Astream := TMemoryStream.create ;
            try
              if VarToStr(value.Params[2]) = '0' then
                 returnvalue := TDataBaseStockRoutines.getImage(StrTOIntDef(VarToStr(value.Params[3]),0))
               else
               if VarToStr(value.Params[2]) = '1' then
                  returnvalue := DMTCCoreLink.GroupsObject.GetGroupImgName(StrTOIntDef(VarToStr(value.Params[3]),0))
               else
               returnvalue := VarToStr(value.Params[3]) ;
              if FileExists(returnvalue) and (UpperCase( ExtractFileName(returnvalue))<>'STOCK.ICO') then
                begin
                Astream.LoadFromFile(returnvalue);
                Astream.position := 0 ;
                returnvalue  := VarArrayCreate([0,Astream.Size-1],17) ;
                i := 0 ;
               while Astream.Size <> Astream.Position do
                begin
                  Astream.Read(AByte,1);
                  returnvalue[i] := AByte ;
                  inc(i);
                end;
               end else
               returnvalue := '' ;
            finally
             Astream.Free ;
            end;
   end  else
 IF  UpperCase(FuncName) = 'FINDHOUSNR' then
   begin
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr) or (VarType(value.Params[1]) = varUString) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue := '' ;
     MyValue := value.Params[1];
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
     if (not ( (VarType(value.Params[1])=varString) or (VarType(value.Params[1])=varOleStr)  or (VarType(value.Params[1]) = varUString) ) ) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue := '' ;
     MyValue := value.Params[1] ;
     returnvalue :=  DMTCCoreLink.OpenSqlReturnFirstColumn(MyValue)
   end  else
 IF  UpperCase(FuncName) = 'NUMBERTOWORDS' then
   begin
     if (not ( (VarType(value.Params[1])=varDouble) or (VarType(value.Params[1])=varInteger) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue := '' ;
     MyFLoat := value.Params[1] ;
     returnvalue := NumberToText(FloatToStr(MyFLoat));
   end else
 IF  UpperCase(FuncName) = 'GETPRICE' then
   begin
     if (not ( (VarType(value.Params[1])=varDouble) or (VarType(value.Params[1])=varInteger) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if (not ( (VarType(value.Params[2])=varDouble) or (VarType(value.Params[2])=varInteger) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if (not ( (VarType(value.Params[3])=varDouble) or (VarType(value.Params[3])=varInteger) )) then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if DMTCCoreLink.ReadNwReportOp('USEPRICEPLUGIN',false) then
     returnvalue :=  TDataBaseStockRoutines.getStockPrice(value.Params[1],value.Params[2],value.Params[3]) else
     returnvalue :=  TDataBaseStockRoutines.getDefaultStockPrice(value.Params[1],value.Params[2]) ;
   end else
 IF  UpperCase(FuncName) = 'GETTEXTLANG' then
   begin
     if not  (VarType(value.Params[1])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
    if FileExists(ExtractFilePath(Application.ExeName) +'Bin\Languages\' + VartoStr(value.Params[3]) + '.dfm') then
    returnvalue :=  DMTCCoreLink.GetLangTrans(value.Params[1],VartoStr(value.Params[3]))
    else
    returnvalue := DMTCCoreLink.gettextlang(value.Params[1]);

    if returnvalue = '' then returnvalue :=  value.Params[2] ;
     returnvalue := StringReplace(returnvalue,'&','',[rfReplaceAll]);
   end else
  IF  UpperCase(FuncName) = 'GETELEMENT' then
   begin
     if not  ((VarType(value.Params[1])= varString) or (VarType(value.Params[1]) = varOleStr) or (VarType(value.Params[1]) = varUString))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if not  ((VarType(value.Params[2])= varString) or (VarType(value.Params[2]) = varOleStr) or (VarType(value.Params[2]) = varUString))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if not  (VarType(value.Params[3])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue :=  '' ;
     AList := TStringList.Create;
     try
        AList.Text := StringReplace(value.Params[1],value.Params[2],#13+#10,[rfReplaceAll]) ;
        if value.Params[3] < AList.Count then
           returnvalue :=  AList[value.Params[3]];
     finally
       AList.free ;
     end;

   end else
   IF  UpperCase(FuncName) = 'GETADDGROUP' then
   begin

     if not  (VarType(value.Params[2])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue :=  IntToStr(TDataBaseRoutines.GetAddGroupNesteled(VarToStr(value.Params[1]),value.Params[2],0)) ;

   end else IF  UpperCase(FuncName) = 'HTMLENCODE' then
   begin
     if not  ((VarType(value.Params[1])= varString) or (VarType(value.Params[1]) = varOleStr))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     returnvalue :=  TDataBaseStringRoutines.htmlencode128up(VarToStr(value.Params[1])) ;

  end else IF  UpperCase(FuncName) = 'STRIPHTML' then
   begin
    if not  ((VarType(value.Params[1])= varString) or (VarType(value.Params[1]) = varOleStr))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     returnvalue :=  TDataBaseStringRoutines.StripHtml(VarToStr(value.Params[1])) ;


  end else IF  UpperCase(FuncName) = 'GETINFO_BOOKS' then
   begin
     returnvalue := DMTCCoreLink.TheZConnection.Database ;

  end else IF  UpperCase(FuncName) = 'GETINFO_WINUSER' then
   begin
     returnvalue := TDatabaseUserRoutines.GetWinUsername ;


  end else IF  UpperCase(FuncName) = 'GETINFO_USER' then
   begin
     returnvalue :=  TDatabaseUserRoutines.GetUsername(DMTCCoreLink.currentuser) ;
  end
   else IF  UpperCase(FuncName) = 'UTF8DECODE' then
   begin
     if not  ((VarType(value.Params[1])= varString) or (VarType(value.Params[1]) = varOleStr))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     returnvalue :=  string( UTF8Decode(VarToStr(value.Params[1]))) ;
      if trim(returnvalue) = '' then
        returnvalue := VarToStr(value.Params[1]) ;
  end  else IF  UpperCase(FuncName) = 'GETACCOUNT' then
   begin
     if not  ((VarType(value.Params[1])= varString) or (VarType(value.Params[1]) = varOleStr))  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     returnvalue :=  IntToStr(TDataBaseRoutines.GetAccountIDFromCode(value.Params[1])) ;

end else IF  UpperCase(FuncName) = 'GETQTYUNPOSTED' then
   begin
     if not  (VarType(value.Params[1])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     if not  (VarType(value.Params[2])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);
     returnvalue :=  TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(value.Params[1],value.Params[1],0) ;


     end else IF  UpperCase(FuncName) = 'DOTAXCLASS' then
   begin
     if not  (VarType(value.Params[1])=varInteger)  then
       Raise TRpNamedException.Create(SRpAssignFunc + ' ' +VarToStr(value.Params[0]) + ' ' + VarToStr(value.Params[1])  ,
             value.IdenName);

     returnvalue :=  TDataBaseStockRoutines.ApplyTaxclassToStock(value.Params[1]) ;

   end  else
 IF  UpperCase(FuncName) = 'LOCALSAVEDIR' then
   begin
      returnvalue := DMTCCoreLink.GetLocalSaveDir ;
   end;

end;

function TDMReportsGlobals.EditReport  : Boolean ;
var
 dia:TFRpMainfVCL;
begin
 Result:=false;

 dia:=TFRpMainfVCL.Create(application);
 try

  dia.ANew.Visible:=false;
  dia.AOpen.Visible:=false;
  dia.ASave.Visible:=false;
  dia.ASaveAs.Visible:=true;

  dia.report:= VCLReport1.Report;
  dia.filename := VCLReport1.Filename ;
  SetupDatabase ;
  dia.RefreshInterface(self);
  dia.ShowModal ;
  saveReport ;
 finally
  dia.free;
 end;
end;


procedure TDMReportsGlobals.DataModuleCreate(Sender: TObject);
begin
 aOSAConnectionItem := TOSAConnectionItem.Create(nil) ;
 aOSAConnectionItem.Connection.free ;
 aOSAConnectionItem.OwnConnection := false ;
 aOSAConnectionItem.Connection := DMTCCoreLink.TheZConnection;
 Alookup := TOsfLookup.Create(self) ;
 Alookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
 Alookup.aOSAConnectionItem := aOSAConnectionItem ;
end;

procedure TDMReportsGlobals.DataModuleDestroy(Sender: TObject);
begin
Alookup.free ;
aOSAConnectionItem.free ;
 if  Assigned(dia) then FreeAndNil(dia) ;
end;

procedure TDMReportsGlobals.SaveToStream(Stream:TStream);
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

procedure TDMReportsGlobals.setupdatabase;
begin
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
end;


procedure TDMReportsGlobals.ShowReport(AReport,ACaption,Params : String;ShowType : Integer = 0;FileName : String = '';ForcePrintVars:Boolean = false );
 procedure SetParam (Aparam : TRpParam ; AValue : String ) ;
 begin
   if Aparam.ParamType = rpParamDate then
     begin
       Aparam.Value := StrToDate(AValue) ;
     end else
     begin
       Aparam.Value := AValue ;
     end;
 end;
 var

 oneparam:boolean;
 i:integer;
 Result : Boolean ;
 ReportDir : string ;
 AStringList : TStringList ;
begin
 // TODO : Pieter
   CustomRoutine :=   HandelReport ;

 result := false ;
 try
  if not FileExists(AReport) then
  begin
 ReportDir := DMTCCoreLink.GetLocalPluginDir + 'REPORTS\' ;
 if not FileExists(IncludeTrailingPathDelimiter(ReportDir)+AReport +'.rep') then
    begin
     ReportDir := ExtractFilePath(Application.ExeName) + 'PLUGINS\REPORTS\' ;
     if not FileExists(IncludeTrailingPathDelimiter(ReportDir)+AReport +'.rep') then exit ;
    end;
   end else
   begin
     ReportDir :=ExtractFilePath(AReport);
     AReport := ChangeFileExt(ExtractFileName(AReport),'');
   end;
 if  Assigned(dia) then FreeAndNil(dia) ;
 // allow custom report
 if FileExists(IncludeTrailingPathDelimiter(ReportDir)+AReport +'CUST.rep') then
 VCLReport1.Filename := IncludeTrailingPathDelimiter(ReportDir)+AReport +'CUST.rep'
 else
 VCLReport1.Filename := IncludeTrailingPathDelimiter(ReportDir)+AReport +'.rep' ;

 GENZConnection := DMTCCoreLink.TheZConnection ;

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
 oneparam:=false;
 // map params
 if Params <> '' then
 begin
   AStringList := TStringList.create ;
    try
      AStringList.Text := Params ;
      if ForcePrintVars then
         begin
           for i := 0 to AStringList.count -1 do
              begin
                 if VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i])) <> -1 then
                   begin
                     if (VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))].ParamType
                      in [ rpParamDate,rpParamTime]) and (StrToFloatDef(AStringList.ValueFromIndex[i],0) <> 0 ) then
                         begin
                           SetParam(VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))],DateToStr(StrToFloatDef(AStringList.ValueFromIndex[i],0))) ;
                         end else
                     if (VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))].ParamType
                      in [ rpParamDateTime]) and (StrToFloatDef(AStringList.ValueFromIndex[i],0) <> 0 ) then
                         begin
                           SetParam(VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))],DateTimeToStr(StrToFloatDef(AStringList.ValueFromIndex[i],0))) ;
                         end
                      else
                         SetParam(VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))],AStringList.ValueFromIndex[i]) ;

                   end 
                  else
                  begin
                     VCLReport1.Report.Params.Add(UpperCase(AStringList.Names[i]));
                    if VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i])) <> -1 then
                     begin

                       SetParam(VCLReport1.Report.params[VCLReport1.Report.params.IndexOf(UpperCase(AStringList.Names[i]))],AStringList.ValueFromIndex[i])
                     end
                     else
                     raise Exception.Create(UpperCase(AStringList.Names[i]));

                  end;
              end;
         end else
         begin
           for i:= 0 to VCLReport1.Report.params.count-1  do
           begin
               if AStringList.IndexOfName(VCLReport1.Report.params[i].Name) > -1 then 
                begin
                if True then

                 SetParam(VCLReport1.Report.params[i],AStringList.Values[VCLReport1.Report.params[i].Name]) ;
                end;
           end;
         end;
    finally
      AStringList.free ;
    end;
 end;
 // end map params


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
  exit;
 end;
{$IFNDEF FORWEBAX}
 VCLReport1.Report.params.UpdateLookup;
{$ENDIF}
Result:=true;
 if not IsNonGuiApp  then
   begin
    dia:=TFRpRTParams.Create(Application);
    dia.params:=VCLReport1.Report.Params;
    result := dia.ShowModal = 2 ;
   end;
 finally
     if result then
     begin
 

       if  Assigned(dia) then
         begin
           dia.BOKClick(self);
           VCLReport1.Report.params.Assign(dia.Params);
         end;
         VCLReport1.Title := ACaption ;
         Case showType of
         0 : begin
               // VCLReport1.
              VCLReport1.Preview := True ;
              VCLReport1.ShowPrintDialog := True ;
              VCLReport1.ShowProgress := True ;
              VCLReport1.Execute ;
             end;
         1 : begin
               try
                  VCLReport1.Preview := False ;
                  VCLReport1.ShowPrintDialog := False ;
                  VCLReport1.ShowProgress := False ;
                  VCLReport1.Execute ;

                { try
                    VCLReport1.PrintRange(0,99999,1,false) ;
                except
                    VCLReport1.PrintRange(1,99999,1,true) ;
                end;  }
               except
                  on e: Exception do
                    begin

                        MessageDlg(e.Message +' ' + VCLReport1.Filename,mtError,[mbok],0 ) ;
                    end;
               end;
             end;
         2 : begin
               EditReport ;
             end;
         3,4 : begin
                  VCLReport1.Preview := False ;
                  VCLReport1.ShowPrintDialog := False ;
                  VCLReport1.ShowProgress := False ;


               VCLReport1.SaveToPDF(FileName);
               if showType = 3 then
               ShellExecute(Application.Handle,'open',pchar(FileName),'','',1);
             end;
         10 : begin
               VCLReport1.PrinterSetup;
               SaveReport ;
             end;
         11 : begin
               VCLReport1.PageSetup;
               SaveReport ;
             end;
         end;
     end;
 end;

end;

procedure TDMReportsGlobals.SaveReport;
var
  astream:TFileStream;
begin
  astream:=TFileStream.Create(VCLReport1.Filename,fmCreate);
  try
       SaveToStream(astream);
  finally
     astream.free;
  end;
end;

end.
