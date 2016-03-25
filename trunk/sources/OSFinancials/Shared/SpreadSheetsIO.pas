unit SpreadSheetsIO;

interface

Uses Classes,Sysutils,DB,AbBase, AbBrowse,
  AbZBrows, AbZipper, AbZipKit, AbSelfEx;

Type
  TSpreadSheet=(spdsOpenOffice,spdsSylk,spdsExcel,spdsLotus,spdscsv);

  TOnNextLine = Procedure(Sender :TObject;ARow:Integer; Var More:Boolean) of Object;
  TOnReadData = Procedure(Sender :TObject;ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean) of Object;


  TStreamIO=CLass(TPersistent)
  Private
    FRow : Integer;
    FCol : Integer;
    FOnNextLine:TOnNextLine;
    FOnReadData:TOnReadData;
    FDataset:TDataset;
    Procedure DsDoNextLine(Sender :TObject;ARow:Integer; Var More:Boolean);
    Procedure DsDoReadData(Sender :TObject;ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
    Procedure DoNextLine(ARow:Integer; Var More:Boolean);Virtual;
    Procedure DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);Virtual;
  Published
    Property OnReadData:TOnReadData Read FOnReadData Write FOnReadData ;
    Property OnNextLine:TOnNextLine Read FOnNextLine Write FOnNextLine ;
  Public
    Function SaveToStream(AStream:TStream):integer;Virtual;Abstract;
    Function SaveToStreamFromDS(AStream:TStream;ADataset:TDataset):Integer;
  end;

  TOpenOfficeObj=Class(TStreamIO)
  Private
    FStream : TStream;
    Function WriteContentHead:String;
    Function GetAutoStyles:String;
    Procedure DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);Override;
  Public
    Function SaveToStream(AStream:TStream):integer;Override;
  end;

  TSylkObj=Class(TStreamIO)
  Private
    FStream : TStream;
    Procedure DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);Override;
  Public
    Function SaveToStream(AStream:TStream):integer;Override;
  end;

  TCsvObj=Class(TStreamIO)
  Private
    Procedure DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);Override;
  Public
    Function SaveToStream(AStream:TStream):integer;Override;
  end;

  TExcelObj=Class(TStreamIO)
  Private
    FStream : TStream;
    Procedure  WriteHeadContent(Cols,Rows:Integer);
    Procedure  WriteRecordHeader(RecType, Size : integer);
  Protected
    procedure   WriteData(CellType : TFieldType; ARow, ACol: Integer; Cell : string); virtual;
  Public
    Function SaveToStream(AStream:TStream):integer;Override;
  end;

  TLotusObj=Class(TStreamIO)
  Private
    FStream : TStream;
    Procedure  WriteHeadContent(Cols,Rows:Integer);
    Procedure  WriteRecordHeader(RecType, Size : integer);
  Protected
    procedure   WriteData(CellType : TFieldType; ARow, ACol: Integer; Cell : string); virtual;
  Public
    Function SaveToStream(AStream:TStream):integer;Override;
  end;

Function ExportDsToSpreadSheet(ADataSet:TDataset;AStream:TStream;aFileType:TSpreadSheet):Integer;
Function ExportDsTofile(ADataSet:TDataset;AFileName:String):Integer;

implementation

Const
  Crlf=#13#10;
  BIFF_EOF = $000a;

Function ExportDsToSpreadSheet(ADataSet:TDataset;AStream:TStream;aFileType:TSpreadSheet):Integer;
Var
  tmp:TStreamIO;
begin
  Case aFileType of
  spdsOpenOffice: tmp:=TOpenOfficeObj.Create;
  spdsSylk:  tmp:= TSylkObj.Create;
  spdsCsv:   tmp:= TCsvObj.Create;
  spdsExcel: tmp:= TExcelObj.Create;
  spdsLotus: tmp:= TLotusObj.Create;
  else
   tmp := TSylkObj.Create;
  end;
  Try
    Result := tmp.SaveToStreamFromDS(AStream,ADataSet);
  Finally
    tmp.Free;
  end;
end;

Function GetSpreadSheetType(AFileName:String):TSpreadSheet;
Var
  AExt:String;
begin
  AExt := ExtractFileExt(AFileName);
  if SameText(AExt,'.sxc') then
    Result := spdsOpenOffice
  else if SameText(AExt,'.xls') then
    Result := spdsExcel
  else if SameText(AExt,'.wk1') or SameText(AExt,'.123') then
    Result := spdsLotus
  else if SameText(AExt,'.csv') then
    Result := spdscsv
  else
    Result := spdsSylk

end;

Function ExportDsTofile(ADataSet:TDataset;AFileName:String):Integer;
var
  Stream: TStream;
  aFileType:TSpreadSheet;
  Function DirectToFile:Integer;
  begin
    Stream := TFileStream.Create(AFileName, fmCreate);
    try
      Result := ExportDsToSpreadSheet(ADataSet,Stream,aFileType);
    finally
      Stream.Free;
    end;
  end;
  Function ZipTheFile:Integer;
  var
    tmpZip1:TAbZipKit;
  begin
    Stream := TMemoryStream.Create;
    tmpZip1 := TAbZipKit.Create(Nil);
    try
      Result := ExportDsToSpreadSheet(ADataSet,Stream,aFileType);
      tmpZip1.FileName := AFileName;
      tmpZip1.ZipArchive.AddFromStream('content.xml',Stream);
    finally
      Stream.Free;
      tmpZip1.Free;
    end;
  end;
begin
  aFileType := GetSpreadSheetType(AFileName);
  if aFileType=spdsOpenOffice then
    Result := ZipTheFile
  else
    Result := DirectToFile;
end;


Procedure TStreamIO.DoNextLine(ARow:Integer; Var More:Boolean);
begin
  if  Assigned(FOnNextLine) then
    FOnNextLine(Self,ARow,More);

end;

Procedure TStreamIO.DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
begin
  if  Assigned(FOnReadData) then
    FOnReadData(Self,ARow,ACol,Value,ValueType,More);
end;

Procedure TStreamIO.DsDoNextLine(Sender :TObject;ARow:Integer; Var More:Boolean);
begin
  if Assigned(Fdataset) then begin
   // done : Pieter Digian bug report 1 instead of 0 cause of the header
    if ARow>=1 then Fdataset.Next;
    More:= Not Fdataset.Eof;
  end;
end;

Procedure TStreamIO.DsDoReadData(Sender :TObject;ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
begin
  if Assigned(Fdataset) then begin
    More := ACol<= Fdataset.Fields.Count-1;
    if Not Fdataset.Eof  And More then begin
      if ARow=0 then begin
        Value := Fdataset.Fields[aCol].FieldName;
        ValueType := ftString;
      end
      else begin
        Value := Fdataset.Fields[aCol].AsString;
        ValueType := Fdataset.Fields[aCol].DataType;
      end;
    end;
  end;
end;


Function TStreamIO.SaveToStreamFromDS(AStream:TStream;ADataset:TDataset):Integer;
Var
  OldNextLine:TOnNextLine;
  OldReadData:TOnReadData;
 S : {$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
begin
  OldNextLine:=FOnNextLine;
  OldReadData:=FOnReadData;
  if Not Assigned(FOnNextLine) then
    FOnNextLine := DsDoNextLine;
  if Not Assigned(OnReadData) then
    FOnReadData := DsDoReadData;
  Fdataset:=ADataset;
  Try
    Result := 222;
    if Assigned(Fdataset) then begin
      Fdataset.DisableControls;
      s := Fdataset.Bookmark;
      Try
        Fdataset.Open;
        Fdataset.First;
        Result:= SaveToStream(AStream);
      Finally
        // not the way its made Bookmark is a property
        // Fdataset.GotoBookmark(Pointer(s));
        Fdataset.Bookmark := s ;
        Fdataset.freebookmark(s) ;

        Fdataset.EnableControls;
      end;
    end;
  Finally
    OnNextLine:=OldNextLine;
    OnReadData:=OldReadData;
  end;
end;

{TOpenOfficeObj}
Function TOpenOfficeObj.WriteContentHead:String;
begin
  Result  := '<?xml version="1.0" encoding="UTF-8"?>'+Crlf;
  Result  := Result + '<!DOCTYPE office:document-content PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "office.dtd">'+Crlf;
  Result := Result + '<office:document-content' ;
  Result := Result + ' xmlns:office="http://openoffice.org/2000/office"';
  Result := Result + ' xmlns:style="http://openoffice.org/2000/style"';
  Result := Result + ' xmlns:text="http://openoffice.org/2000/text" xmlns:table="http://openoffice.org/2000/table"';
  Result := Result + ' xmlns:draw="http://openoffice.org/2000/drawing" xmlns:fo="http://www.w3.org/1999/XSL/Format"';
  Result := Result + ' xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:number="http://openoffice.org/2000/datastyle"';
  Result := Result + ' xmlns:svg="http://www.w3.org/2000/svg" xmlns:chart="http://openoffice.org/2000/chart"';
  Result := Result + ' xmlns:dr3d="http://openoffice.org/2000/dr3d" xmlns:math="http://www.w3.org/1998/Math/MathML"';
  Result := Result + ' xmlns:form="http://openoffice.org/2000/form" xmlns:script="http://openoffice.org/2000/script"';
  Result := Result + ' office:class="spreadsheet" office:version="1.0">'+Crlf;
  {Add Default Font}
  Result := Result + '<office:font-decls>'+Crlf;
  Result := Result + '<style:font-decl style:name="Tahoma" fo:font-family="Tahoma" style:font-pitch="variable"/>'+Crlf;
  Result := Result + '<style:font-decl style:name="Arial" fo:font-family="Arial" style:font-family-generic="swiss" style:font-pitch="variable"/>'+Crlf;
  Result := Result + '</office:font-decls>'+Crlf;
  Result := Result + GetAutoStyles;
end;

Function TOpenOfficeObj.GetAutoStyles:String;
begin
  Result := '<office:automatic-styles>'+Crlf;
  Result := Result + '<style:style style:name="co1" style:family="table-column">'+Crlf;
  Result := Result + '<style:properties fo:break-before="auto" style:column-width="2.267cm"/>'+Crlf;
  Result := Result + '</style:style>'+Crlf;
  Result := Result + '<style:style style:name="ro1" style:family="table-row">'+Crlf;
  Result := Result + '<style:properties style:row-height="0.453cm" fo:break-before="auto" style:use-optimal-row-height="true"/>'+Crlf;
  Result := Result + '</style:style>'+Crlf;
  Result := Result + '<style:style style:name="ta1" style:family="table" style:master-page-name="Default">'+Crlf;
  Result := Result + '<style:properties table:display="true"/></style:style>'+Crlf;
  Result := Result + '</office:automatic-styles>'+Crlf;
end;

Procedure TOpenOfficeObj.DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
begin
  Inherited;
  if Pos('&',Value)<>0 then
    Delete(Value,Pos('&',Value),1);
end;

Function TOpenOfficeObj.SaveToStream(AStream:TStream):integer;
Var
  MoreCols,MoreLines:Boolean;
  FRowsStr:String;
  FColsStr:String;
  FieldValue:String;
  Head:String;
  ValueType:TFieldType;
begin
  FStream := TMemoryStream.Create;
  Try
  FColsStr := '';
    FRow:=0;
    Try
      Head := WriteContentHead + '<office:body><table:table table:name="Philipo1" table:style-name="ta1">'+Crlf;
      FStream.Write(Head[1],Length(Head));
      Repeat
        MoreLines:=True;
        FCol := 0;
        FRowsStr := '';
        Repeat
          FieldValue:='';
          MoreCols := True;
          DoReadData(FROw,FCol,FieldValue,ValueType,MoreCols);
          FRowsStr := FRowsStr + '<table:table-cell>'+Crlf;
          FRowsStr := FRowsStr + '<text:p>'+FieldValue+'</text:p>'+Crlf;
          FRowsStr := FRowsStr + '</table:table-cell>'+Crlf;
          Inc(FCol);
        Until Not MoreCols;
        DoNextLine(FRow,MoreLines);
        Inc(FRow);
        if FColsStr='' then begin
          FColsStr := '<table:table-column table:style-name="co1" table:number-columns-repeated="'
                     + IntToStr(FCol)+ '" table:default-cell-style-name="Default"/>'+Crlf;
          FStream.Write(FColsStr[1],Length(FColsStr));
        End;
        FRowsStr := '<table:table-row table:style-name="ro1">'+Crlf + FRowsStr;
        FRowsStr := FRowsStr + '</table:table-row>'+Crlf;
        FStream.Write(FRowsStr[1],Length(FRowsStr));
      Until Not MoreLines;
      {Zip the Stream And Copy it To the Result Stream}
      Head:='</table:table></office:body></office:document-content>'+Crlf;
      FStream.Write(Head[1],Length(Head));
      AStream.CopyFrom(FStream,0);
      Result:=0;
    Except
      Result := 50000;
    end;
  Finally
    FStream.Free;
  end;
end;

//============================================================================//
{TSylkObj}

Procedure TSylkObj.DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
begin
  if  Assigned(FOnReadData) then
    FOnReadData(Self,ARow,ACol,Value,ValueType,More);
end;


Function  TSylkObj.SaveToStream(AStream:TStream):integer;
Var
  MoreCols,MoreLines:Boolean;
  FRowsStr:String;
  FColsStr:String;
  FieldValue:String;
  Head:String;
  ValueType:TFieldType;
begin
  FStream := TMemoryStream.Create;
  Try
  FColsStr := '';
    FRow:=0;
    Try
      Head := 'ID;PSylvain Component'+ Crlf;
      FStream.Write(Head[1],Length(Head));
      Repeat
        MoreLines:=True;
        FCol := 0;
        FRowsStr := '';
        Repeat
          FieldValue:='';
          MoreCols := True;
          ValueType := ftString	;
          DoReadData(FROw,FCol,FieldValue,ValueType,MoreCols);
          FRowsStr := FRowsStr + 'C;X' + IntToStr(FCOL+1);
          FRowsStr := FRowsStr +  ';Y' + IntToStr(FRow+1);
          if (ValueType = ftString) OR (FRow=0) then
            FRowsStr := FRowsStr +  ';K"'+ FieldValue+'"'   + Crlf
          else
            FRowsStr := FRowsStr +  ';K'+ FieldValue+Crlf;
          Inc(FCol);
        Until Not MoreCols;
        DoNextLine(FRow,MoreLines);
        Inc(FRow);
        FStream.Write(FRowsStr[1],Length(FRowsStr));
      Until Not MoreLines;
      Head:='E';
      FStream.Write(Head[1],Length(Head));
      AStream.CopyFrom(FStream,0);
      Result:=0;
    Except
      Result := 50000;
    end;
  Finally
    FStream.Free;
  end;

end;

//============================================================================//
{TCsvObj}
Procedure TCsvObj.DoReadData(ARow,ACol:Integer;Var Value:String;Var ValueType:TFieldType;Var More:Boolean);
begin
  if  Assigned(FOnReadData) then
    FOnReadData(Self,ARow,ACol,Value,ValueType,More);
  if (ValueType = ftString) OR (FRow=0) then
    Value := '"'+ Value+'"'
end;


Function  TCsvObj.SaveToStream(AStream:TStream):integer;
Var
  MoreCols,MoreLines:Boolean;
  FRowsStr:AnsiString;
  FColsStr:String;
  FieldValue:String;
  ValueType:TFieldType;
begin
  FColsStr := '';
  FRow:=0;
  Try
    Repeat
      MoreLines:=True;
      FCol := 0;
      FRowsStr := '';
      Repeat
        FieldValue:='';
        MoreCols := True;
        ValueType := ftString	;
        DoReadData(FROw,FCol,FieldValue,ValueType,MoreCols);
        if FRowsStr='' then
          FRowsStr := UTF8Encode(FieldValue)
        else
          FRowsStr := FRowsStr + ',' + UTF8Encode(FieldValue);
        Inc(FCol);
      Until Not MoreCols;
      DoNextLine(FRow,MoreLines);
      Inc(FRow);
      FRowsStr := FRowsStr + Crlf;
      AStream.Write(FRowsStr[1],Length(FRowsStr));
    Until Not MoreLines;
    Result:=0;
  Except
    Result := 50000;
  end;
end;

//============================================================================//
{TExcelObj}
Procedure  TExcelObj.WriteRecordHeader(RecType, Size : integer);
var
  Buffer : array[0..1] of word;
begin
  Buffer[0] := RecType;
  Buffer[1] := Size;
  FStream.Write(Buffer, SizeOf(Buffer));
end;

procedure TExcelObj.WriteHeadContent;
Const
  BOF       = $0009;
//  BIT_BIFF5 = $0800;
  BIT_BIFF5 = $0400;

  BOF_BIFF5 = BOF or BIT_BIFF5;
  WORKBOOK_XLS = $0005;
  DIMENSIONS = $0200;
  DOCTYPE_XLS = $0010;
  WINDOW1_XLS = $003D;
  FONT_XLS = $0031;
  XF_XLS = $0443;
  STYLE_XLS = $0293;
  BOUNDSHEET_XLS = $0085;
var
  Buffer : array[0..11] of word;
  iCount:Integer;
begin
  FStream.Seek(0,soFromBeginning);
  (*
  { Create WorkBooks records}
  Buffer[0] := 0;
  Buffer[1] := WORKBOOK_XLS;
  Buffer[2] := 0;
  WriteRecordHeader(BOF_BIFF5, 6);
  FStream.Write(Buffer, 6);
  {Add Window1 Rec}
  Buffer[0]:= 0;
  Buffer[1]:= 0;
  Buffer[2]:= 100;
  Buffer[3]:= 100;
  Buffer[4]:= 0;
  WriteRecordHeader(WINDOW1_XLS, 10);
  FStream.Write(Buffer, 10);
  {Add Fonts Records}
  Buffer[0]:= 10;
  Buffer[1]:= 0;
  Buffer[2]:= 0; {Color Index}
  Buffer[3]:= $0190;
  Buffer[4]:= 0;
  Buffer[5]:= 0;
  Buffer[6]:= 0;
  Buffer[7]:= $5241; {font Name}
  Buffer[8]:= $4149; {font Name}
  Buffer[9]:= $204C; {font Name}
  Buffer[10]:= 0; {font Name}
  For iCount:=0 to 5 do begin
    WriteRecordHeader(FONT_XLS, 22);
    FStream.Write(Buffer, 22);
  end;
  {Add XF}
  Buffer[2] := $0000;
  Buffer[3] := $4131;
  WriteRecordHeader(XF_XLS, 0);
  FStream.Write(Buffer, 0);
  {Add STYLE}
  Buffer[2] := $0000;
  Buffer[3] := $4131;
  WriteRecordHeader(STYLE_XLS, 4);
  FStream.Write(Buffer, 4);
  {Add BOUNDSHEET}
  Buffer[0] := $0000;
  Buffer[1] := FStream.Position + 8 + 4 ;
  Buffer[2] := $0000;
  Buffer[3] := $4131;
  WriteRecordHeader(BOUNDSHEET_XLS, 8);
  FStream.Write(Buffer, 8);
  WriteRecordHeader(BIFF_EOF,0);
  *)

  {Start SpreadSheet}
  Buffer[0] := 0;
  Buffer[1] := DOCTYPE_XLS;
  Buffer[2] := 0;
  WriteRecordHeader(BOF_BIFF5, 6);
  FStream.Write(Buffer, 6);
  {Insert XF Records}
  Buffer[0] := $0001;
  Buffer[1] := $0005;
  Buffer[2] := $F420;
  Buffer[3] := $CE00;
  Buffer[4] := $C0C0;
  Buffer[5] := $00C0;
  For iCount:=0 to 15 do begin
    WriteRecordHeader(XF_XLS, 12);
    FStream.Write(Buffer, 12);
  end;
  {Insert Style Records}
  Buffer[0] := $8000;
  Buffer[1] := $FF00;
  WriteRecordHeader(STYLE_XLS, 4);
  FStream.Write(Buffer, 4);
  {Insert Dimensions Record}
  Buffer[0] := 0;
  Buffer[1] := Rows;
  Buffer[2] := 0;
  Buffer[3] := Cols;
  Buffer[4] := 0;
  WriteRecordHeader(Dimensions, 10);
  FStream.Write(Buffer, 10);
end;

procedure TExcelObj.WriteData(CellType : TFieldType; ARow, ACol: Integer; Cell : string);
const
  Xf_Index: Word = $0000 ; { 16 bit bitfield }
var
  Buffer : array[0..1] of word;
  RecType : word;
  Size,StrSize : word;
  AString : String;
  aInt: integer;
  aDbl: double;
  Data: Pointer;
begin
  Buffer[0] := ARow;
  Buffer[1] := ACol;
  AString := Cell;
  Data := @aInt;
  case CellType of
    ftSmallint ,ftInteger,ftWord,ftLargeint:
      begin
        RecType := $0203; Size := 14;
        WriteRecordHeader(RecType, Size);
        Size := 8; aDbl := StrtoIntDef(Cell,0);
        Data := @aDbl;
      end;
    ftFloat,ftCurrency :
      begin
        RecType := $0203; Size := 14;
        WriteRecordHeader(RecType, Size);
        Size := 8;  aDbl := StrToFloatDef(Cell,0);
        Data := @aDbl;
      end;
  else {ftString }
    CellType := ftString;
    RecType := $0204;
    StrSize := length(Cell);
    Size :=  StrSize + 8;
    WriteRecordHeader(RecType, Size);
  end;
  FStream.Write(Buffer, SizeOf(Buffer));
  FStream.Write(Xf_Index, SizeOf(Xf_Index));
  if CellType = ftString then begin
    FStream.Write(StrSize, SizeOf(StrSize));
    FStream.Write(AString[1], Length(AString))
  end
  else
    FStream.Write(Data^, Size);
end;


Function TExcelObj.SaveToStream(AStream:TStream):integer;
Var
  MoreCols,MoreLines:Boolean;
  FRowsStr:String;
  FColsStr:String;
  FieldValue:String;
  ValueType:TFieldType;
  ARows : Integer;
  ACols : Integer;
begin
  FColsStr := '';
  ARows := 0;
  ACols := 0;
  FStream := AStream;
  WriteHeadContent(0,0);
  FRow:=0;
  Try
    Repeat
      MoreLines:=True;
      FCol := 0;
      FRowsStr := '';
      Repeat
        FieldValue:='';
        MoreCols := True;
        DoReadData(FROw,FCol,FieldValue,ValueType,MoreCols);
        WriteData(ValueType,FROw,FCol,FieldValue);
        Inc(FCol);
      Until (Not MoreCols) ;
      DoNextLine(FRow,MoreLines);
      Inc(FRow);
      if ARows<FRow then ARows := FRow;
      if ACols<FCol then ACols := FCol;
    Until Not MoreLines;
    WriteRecordHeader(BIFF_EOF, 0);
    {Rewrite Correctly the head}
    //WriteHeadContent(ACols,ARows);
    Result:=0;
  Except
    Result := 50000;
  end;

end;


//============================================================================//
{TLotusObj}
Procedure  TLotusObj.WriteRecordHeader(RecType, Size : integer);
var
  Buffer : array[0..1] of word;
begin
  Buffer[0] := RecType;
  Buffer[1] := Size;
  FStream.Write(Buffer, SizeOf(Buffer));
end;

procedure TLotusObj.WriteHeadContent;
Var
  WkFileID:Word;
begin
  FStream.Seek(0,soFromBeginning);
  {Write Wk1 Head rec}
  WkFileID:=1030;
  WriteRecordHeader(0,2);
  FStream.Write(WkFileID, SizeOf(WkFileID));
end;

procedure TLotusObj.WriteData(CellType : TFieldType; ARow, ACol: Integer; Cell : string);
var
  Buffer : array[0..1] of word;
  RecType : word;
  Size,StrSize : word;
  AString : String;
  aInt: integer;
  aDbl: double;
  Data: Pointer;
  CellFormat:Byte;
begin
  Buffer[0] := ACol;
  Buffer[1] := ARow;
  AString := Cell;
  Data := @aInt;
  case CellType of
    ftSmallint ,ftInteger,ftWord,ftLargeint:
      begin
        RecType    := $000D;
        Size       := 9;
        CellFormat := 255;
        WriteRecordHeader(RecType, Size);
        Size := 4 ; aInt := StrtoIntDef(Cell,0);
        Data := @aInt;
      end;
    ftFloat,ftCurrency :
      begin
        RecType := $000E;
        Size := 13;
        CellFormat := 2 or 128;
        WriteRecordHeader(RecType, Size);
        Size := SizeOf(aDbl);  aDbl := StrToFloatDef(Cell,0);
        Data := @aDbl;
      end;
  else {ftString }
    CellType := ftString;
    RecType := $000F;
    CellFormat := 255;
    AString := '''' + Cell;
    StrSize := length(AString) + 1;
    Size :=  StrSize + 5;
    WriteRecordHeader(RecType, Size);
  end;
  FStream.Write(CellFormat, SizeOf(CellFormat));
  FStream.Write(Buffer, SizeOf(Buffer));
  if CellType = ftString then begin
      FStream.Write(AString[1], StrSize)
  end
  else
    FStream.Write(Data^, Size);
end;


Function TLotusObj.SaveToStream(AStream:TStream):integer;
Var
  MoreCols,MoreLines:Boolean;
  FRowsStr:String;
  FColsStr:String;
  FieldValue:String;
  ValueType:TFieldType;
  ARows : Integer;
  ACols : Integer;
begin
  FColsStr := '';
  ARows := 0;
  ACols := 0;
  FStream := AStream;
  WriteHeadContent(0,0);
  FRow:=0;
  Try
    Repeat
      MoreLines:=True;
      FCol := 0;
      FRowsStr := '';
      Repeat
        FieldValue:='';
        MoreCols := True;
        DoReadData(FROw,FCol,FieldValue,ValueType,MoreCols);
        WriteData(ValueType,FROw,FCol,FieldValue);
        Inc(FCol);
      Until (Not MoreCols) ;
      DoNextLine(FRow,MoreLines);
      Inc(FRow);
      if ARows<FRow then ARows := FRow;
      if ACols<FCol then ACols := FCol;
    Until Not MoreLines;
    WriteRecordHeader(1, 0);
    {Rewrite Correctly the head}
    //WriteHeadContent(ACols,ARows);
    Result:=0;
  Except
    Result := 50000;
  end;

end;


end.
