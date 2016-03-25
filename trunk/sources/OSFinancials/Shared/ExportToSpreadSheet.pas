(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ExportToSpreadSheet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,LotusWKx,  DBClient ,
  Gauges, DBAccess , Uni;

const
  BOF       = $0009;
  BIT_BIFF5 = $0800;
  BOF_BIFF5 = BOF or BIT_BIFF5;
  BIFF_EOF = $000a;
  DIMENSIONS = $0200;
  DOCTYPE_XLS = $0010;
  LEN_RECORDHEADER = 4;
Type


   TCsvStream=Class
   Private
     FStream            : TStream;
     FSourceTable       : TDataSet;
     Filename           : String;
     InternDataBase     : String;
    FDelimeter: char;
    procedure SetDelimeter(const Value: char);
   Protected
    procedure   CreateStream;
    procedure   CloseStream;
    property    Stream : TStream read FStream write FStream;
   Public
    Gauge              : TGauge ;
    property    CsvFilename    : string read Filename  write Filename ;
    property    Delimeter     : char  read FDelimeter write SetDelimeter;
    property    Dataset      : TDataSet Read  FSourceTable  write FSourceTable ;
    property    Connection   : String read InternDataBase  write InternDataBase ;
    Procedure   CsvExport;
   end;


   TCellType = (CellBlank, CellInteger, CellDouble, CellLabel, CellBoolean);
   TExcelStream=Class
   Private
     FStream            : TStream;
     LineCount,ColCount : Integer;
     FSourceTable       : TDataset;
     Filename           : string;
     InternDataBase     : String;
   Protected
    procedure   CreateStream;
    procedure   CloseStream;
    procedure   WriteRecordHeader(RecType, Size : integer);
    procedure   WriteData(CellType : TCellType; ARow, ACol: Integer; Cell : string); virtual;
    property    Stream : TStream read FStream write FStream;
    Procedure   ConnectXlsFile;
    Procedure   DisConnectXlsFile;
    procedure   WriteXlsData(CellType : TCellType; ARow, ACol: Integer; Value : string);
   Public
    Gauge             : TGauge ;
    property    XlsFilename : string read Filename  write Filename ;
    property    Dataset   : TDataset read FSourceTable  write FSourceTable ;
    property    Connection    : String read InternDataBase  write InternDataBase ;
    Procedure   XlsExport;
   end;

   TXmlStream=Class
   Private
     FStream            : TClientDataSet;
     FSourceTable       : TuniQuery;
     Filename           : string;
     InternSQl          : sTring;
     InternDataBase     : TUniconnection;
   Protected
    procedure   CreateStream;
    procedure   CloseStream;
    property    Stream : TClientDataSet read FStream write FStream;
   Public
    Gauge             : TGauge ;
    property    XmlFilename    : string read Filename  write Filename ;
    property    SQLSource      : string read InternSQl  write InternSQl ;
    property    Connection   : TUniconnection read InternDataBase  write InternDataBase ;
    Procedure   XmlExport;
   end;

   TLotusStream=Class
   Private
     FStream            : TWkxFile;
     FSourceTable       : TDataset;
     Filename           : string;
     InternDataBase     : String;
   Protected
    procedure   CreateStream;
    procedure   CloseStream;
    property    Stream : TWkxFile read FStream write FStream;
   Public
    Gauge             : TGauge ;
    property    LtsFilename    : string read Filename  write Filename ;
    property    Dataset      : TDataset read FSourceTable  write FSourceTable ;
    property    Connection   : String read InternDataBase  write InternDataBase ;
    Procedure   Wk1Export;
   end;

implementation


{Excel Stream}

procedure TExcelStream.WriteRecordHeader(RecType, Size : integer);
var
  Buffer : array[0..1] of word;
begin
  Buffer[0] := RecType;
  Buffer[1] := Size;
  Stream.Write(Buffer, SizeOf(Buffer));
end;

procedure TExcelStream.CreateStream;
var
  Buffer : array[0..4] of word;
begin
  Filename := ChangeFileExt(Filename,'.Xls') ;
  FStream := TFileStream.Create(Filename, fmCreate);
  Buffer[0] := 0;
  Buffer[1] := DOCTYPE_XLS;
  Buffer[2] := 0;
  WriteRecordHeader(BOF_BIFF5, 6);
  Stream.Write(Buffer, 6);
  Buffer[0] := 0;
  Buffer[1] := LineCount;
  Buffer[2] := 0;
  Buffer[3] := ColCount;
  Buffer[4] := 0;
  WriteRecordHeader(Dimensions, 10);
  Stream.Write(Buffer, 10);
end;

procedure TExcelStream.CloseStream;
begin
  WriteRecordHeader(BIFF_EOF, 0);
//  inherited CloseStream;
  FStream.Free
end;


procedure TExcelStream.WriteData(CellType : TCellType; ARow, ACol: Integer; Cell : string);
const
  Attribute: Array[0..2] Of Byte = (0, 0, 0); { 24 bit bitfield }
var
  Buffer : array[0..1] of word;
  RecType : word;
  Size : word;
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
    CellInteger   :
      begin
        RecType := 2; Size := 11;
        WriteRecordHeader(RecType, Size);
        Size := 4; aInt := StrtoIntDef(Cell,0);
        Data := @aInt;
      end;
    CellDouble   :
      begin
        RecType := 3; Size := 15;
        WriteRecordHeader(RecType, Size);
        Size := 8;  aDbl := StrToFloatDef(Cell,0);
        Data := @aDbl;
      end;
    CellLabel   :
      begin
        RecType := 4; Size := length(Cell) + 8;
        WriteRecordHeader(RecType, Size);
      end;
  else
    exit;
  end;
  Stream.Write(Buffer, SizeOf(Buffer));
  Stream.Write(Attribute, SizeOf(Attribute));
  if CellType = CellLabel then
    Stream.Write(AString, Length(AString) + 1)
  else
    Stream.Write(Data^, Size);
end;

Procedure  TExcelStream.ConnectXlsFile;
begin
  CreateStream;
end;

Procedure  TExcelStream.DisConnectXlsFile;
begin
  CloseStream;
end;
procedure   TExcelStream.WriteXlsData(CellType : TCellType; ARow, ACol: Integer; Value : string);
begin
  WriteData(CellType , ARow, ACol, Value);
end;

Procedure   TExcelStream.XlsExport;
Var
  Col,Row:integer;
begin
  FSourceTable.Open;
  LineCount:=FSourceTable.RecordCount+1;
  ColCount:=FSourceTable.FieldCount;
  ConnectXlsFile;
  Row:=0;
  if Gauge<>Nil then
  begin
    Gauge.MaxValue := FSourceTable.RecordCount;
    Gauge.Progress := 0;
  end;
  FSourceTable.First;
  // Save Fields Names
  for Col:=0 to FSourceTable.FieldCount-1 do
      WriteXlsData(CellLabel, Row, Col, FSourceTable.Fields[Col].FieldName);
  //
  Row:=1;
  while not  FSourceTable.Eof do Begin
    Gauge.Progress := FSourceTable.RecNo;
    Application.ProcessMessages;
    for Col:=0 to FSourceTable.FieldCount-1 do begin
      if FSourceTable.Fields[Col].DataType=ftInteger then
        WriteXlsData(CellInteger,Row,Col,FSourceTable.Fields[Col].AsString)
      else
      if FSourceTable.Fields[Col].DataType=ftFloat then
        WriteXlsData(CellDouble,Row,Col,FSourceTable.Fields[Col].AsString)
      else
        WriteXlsData(CellLabel,Row,Col,FSourceTable.Fields[Col].AsString);
    end;
    inc(Row);
    FSourceTable.Next;
  end;
  DisConnectXlsFile;
//  FSourceTable.free;
end;
// Csv Export

procedure TCsvStream.CreateStream;
begin
  FStream := TFileStream.Create(Filename, fmCreate);
end;

procedure TCsvStream.CloseStream;
begin
//  inherited CloseStream;
  FStream.Free
end;

Procedure   TCsvStream.CsvExport;
Var
  Row,Col     : Integer;
  AString : UTF8String;
begin
  if Delimeter = #0 then
   Delimeter := ',' ;
  FSourceTable.Open;
  Row:=FSourceTable.RecordCount;
  CreateStream;
  if Gauge<>Nil then
  begin
    Gauge.MaxValue := FSourceTable.RecordCount;
    Gauge.Progress := 0;
  end;
  FSourceTable.First;
  // Save Fields Names
  for Col:=0 to FSourceTable.FieldCount-1 do
  begin
    if Gauge<>Nil then
      Gauge.Progress := FSourceTable.RecNo;
    Application.ProcessMessages;
    AString:= UTF8Encode( FSourceTable.Fields[Col].FieldName);
     if Col=FSourceTable.FieldCount-1 then
        AString:=AString+#13#10
      else
        AString:=AString+Delimeter;
      Stream.Write(AString[1], Length(AString));
  end;
  // Save Values
  while not FSourceTable.Eof do Begin
    for Col:=0 to FSourceTable.FieldCount-1 do begin
      AString:=UTF8Encode(FSourceTable.Fields[Col].AsString);
      {Put String in '' for csv importation}
      if FSourceTable.Fields[Col].DataType = ftString then
       begin
        aString :=  stringReplace(aString,#13#10,' ',[rfreplaceAll]) ;
        aString :=  stringReplace(aString,#13,' ',[rfreplaceAll]) ;
        aString :=  stringReplace(aString,#10,'',[rfreplaceAll]) ;
        aString := AnsiQuotedStr(aString,'"');
       end;

      if (FSourceTable.Fields[Col].DataType in [ftFloat, ftCurrency]) then
        aString := stringReplace(aString,',','.',[rfreplaceAll]) ;

      if Col=FSourceTable.FieldCount-1 then
        AString:=AString+#13#10
      else
        AString:=AString+Delimeter;
      Stream.Write(AString[1], Length(AString));
    end;
    FSourceTable.Next;
  end;
  CloseStream;
end;

// Lotus Tables Export

procedure TLotusStream.CreateStream;
begin
  if pos('.',Filename)>1 then
       Filename:=Trim(Copy(Filename,1,Pos('.',Filename)-1));
  Filename:=Filename+'.Wk1';
  FStream := TWkxFile.Create;
  FStream.FileName:=Filename;
  FStream.CreateFile;
end;

procedure TLotusStream.CloseStream;
begin
  FreeAndNil(FStream);
end;

Procedure   TLotusStream.Wk1Export;
Var
  Row,Col     : Integer;
  aString : utf8String;
  CellType: SmallInt;
begin
  FSourceTable.close;
  FSourceTable.Open;
  CreateStream;
  if Gauge<>Nil then
  begin
    Gauge.MaxValue := FSourceTable.RecordCount;
    Gauge.Progress := 0;
  end;
  FSourceTable.First;
  Row:=0;
  // Save Fields Names
  for Col:=0 to FSourceTable.FieldCount-1 do
      Stream.Cell[Row,Col].Value(15,FSourceTable.Fields[Col].FieldName);
  // Save Values
  Row:=1;
  while not  FSourceTable.Eof do Begin
    if Gauge<>Nil then
      Gauge.Progress := FSourceTable.RecNo;
    Application.ProcessMessages;
    for Col:=0 to FSourceTable.FieldCount-1 do
    begin
      CellType:=LstString;
      aString := UTF8Encode(FSourceTable.Fields[Col].AsString);
      if FSourceTable.Fields[Col].DataType=ftInteger then
      begin
        CellType:=LstInteger;
        Stream.Cell[Row,Col].Value(CellType,StrToIntDef(aString,0));
      end
      else
      if FSourceTable.Fields[Col].DataType=ftFloat then
      begin
        CellType:=LstFloat;
        Stream.Cell[Row,Col].Value(CellType,StrTOFloatDef(aString,0));
      end
      else
        Stream.Cell[Row,Col].Value(CellType,aString);
    end;
    inc(Row);
    FSourceTable.Next;
  end;
  Stream.SaveToFile;
  CloseStream;
//  FSourceTable.free;
end;


// Xml Export

procedure TXmlStream.CreateStream;
begin
  if pos('.',Filename)>1 then
       Filename:=Trim(Copy(Filename,1,Pos('.',Filename)-1));
  Filename:=Filename+'.Xml';
  FStream := TClientDataSet.Create(Application);
  // Save Fields Names ANd Types
  FStream.FieldDefs.Clear;
  FStream.FieldDefs := FSourceTable.FieldDefs;
  FStream.CreateDataSet;
  FStream.SaveToFile(Filename,dfXml);
  FStream.FileName := Filename;
  FStream.Active := True;
//  for Col:=0 to FSourceTable.FieldCount-1 do begin

//  end;

end;

procedure TXmlStream.CloseStream;
begin
//  inherited CloseStream;
  FStream.Free
end;

Procedure   TXmlStream.XmlExport;
Var
  Col     : Integer;
begin
  FSourceTable:=TuniQuery.Create(nil);
  FSourceTable.close;
  FSourceTable.Connection:=InternDataBase;
  FSourceTable.SQL.Text:=InternSQl;
  FSourceTable.Open;
  Gauge.MaxValue := FSourceTable.RecordCount;
  Gauge.Progress := 0;
  CreateStream;
  FSourceTable.First;
  // Save Values
  while not FSourceTable.Eof do
  Begin
    Gauge.Progress := FSourceTable.RecNo;
    Application.ProcessMessages;
    fStream.Append;
    for Col:=0 to fStream.FieldCount-1 do
      fStream.FieldByName(FSourceTable.Fields[Col].FieldName).Value := FSourceTable.Fields[Col].Value;
    fStream.Post;
    FSourceTable.Next;
  end;
  fStream.Close;
  CloseStream;
  FSourceTable.free;
end;


procedure TCsvStream.SetDelimeter(const Value: char);
begin
  FDelimeter := Value;
end;

end.

