unit LotusWKx;
interface
// Pieter 12-01-2006
// Theres to mutch leaks in here theres calls to alocmem but no to freemem to counter.
// I have done my best to get it down but im still left with lots of small byte losses.
// it must be the pointer to the data structure of a cel. My solition just halved the amount not freeed
// anny other atemts to free this memory left me with no luck.
// I gess it needs a rewrite, so if someone can find the time.
// Im just giving up now.
Uses classes,Sysutils;
Const
  LstString=15;
  LstInteger=13;
  LstFloat=14;


Type
  TWkxRec=Record
    Code : Word;
    Length : Word;
  end;

  TCellCoord = Packed Record
    Format : Byte;
    Col  : Word;
    Row  : Word;
  end;

  PCellData=^TCellData;
  TCellData=Packed Record
    DataType : Word;
    Len  : Word;
    Col  : Word;
    Stat : Byte;
    Data : Pointer;
  end;

  TWkxRowData=Class(TList)
  Private
    //FCurrentRow : Integer;
    FChanged : Boolean ;
    FEmpty   : Boolean ;
    Procedure SetCell(CellData:TCellData);
    Procedure CheckCols(Col:Integer);
  Public
    Constructor Create;
    Property  Changed : Boolean Read FChanged Write FChanged;
    Property  isEmpty : Boolean Read FEmpty Write FEmpty;
    procedure FreememInList ;
    destructor Destroy; override;
  end;

  TLotusCell=Class
  Private
    FCurrentIndex:Integer;
    FCurrentRow : Integer;
    FSheetData: Array of TWkxRowData;
    FRowData : TWkxRowData;
    Function GetAsString:AnsiString;
    Function GetAsIsNull:Boolean;
    Function GetTCellData:TCellData;
    Procedure SetTCellData(Value:TCellData);
    Function GetAsInteger:Integer;
    Function GetAsReal:Real;
    Function GetCellIndex:Pointer;
    Function InternalToStr:AnsiString;
    Function  GetRowData(Index:Integer):TWkxRowData;
    Procedure  SetRowData(Index:integer;Value:TWkxRowData);
    Procedure  CheckRows(Index:integer);
  Public
    Constructor Create;
    Destructor Destroy;Override;
    Property AsString:AnsiString Read GetAsString;
    Property AsInteger:Integer Read GetAsInteger;
    Property AsReal:Real Read GetAsReal;
    Property IsNull:Boolean Read GetAsIsNull;
    Procedure Value(CellType:Integer; Value:Variant);
    Property PtrCellData:Pointer Read GetCellIndex ;
    Property CellData:TCellData Read GetTCellData Write SetTCellData;
    Property Row[Index:Integer]:TWkxRowData Read GetRowData Write SetRowData;
    Function Rows:Integer;
  end;

  TWkxFile=Class
  Private
    FFileName : String;
    FIsOpen : Boolean;
    FData   : TLotusCell;
    FStream : TFileStream;
    FBuffer : Array [0..2048] of Byte;
    FBufferlen : Integer;
    TempCell : TCellCoord;
    FAutoUpDate : Boolean;
    FColCount : Integer;
    //FRowCount : Integer;
    Procedure SetFileName(Value:String);
    Function GetCurrentRow:Integer;
    Function GetCellValue(Row,Col:integer):TLotusCell;
    Procedure CreateWkFile;
    Function FormatCell(Col:integer):Boolean;
    Procedure WriteRecHead(RecType, Size : integer);
    Function ReadRecHead(Var Rec:TWkxRec):Boolean;
    Procedure ReadRowData;
    Function GetRowCount:Integer;

  Public
    Constructor Create;
    Destructor Destroy;Override;
    Function CreateFile:Integer;
    Procedure OpenWkFile(readony : Boolean = false);
    Procedure CloseWkFile;
    Function SeekWkxRec(RecCode:Integer):Boolean;
    Property Stream:TFileStream Read FStream Write FStream;
    Property FileName:String Read FFileName Write SetFileName;
    Property CurrentRow:Integer Read GetCurrentRow;
    Property Cell[Row,Col:integer]:TLotusCell Read GetCellValue;
    Property AutoUpDate : Boolean Read FAutoUpDate Write FAutoUpDate;
    Procedure GotoNext ;
    Procedure SaveToFile;
    Procedure LoadFromFile(readony : Boolean = false);
    Property ColCount:integer Read FColCount;
    Property RowCount:integer Read GetRowCount;
    procedure ClearRows ;
  end;

implementation

{TLotusCell Class}

Constructor TLotusCell.Create;
begin
  inherited Create;
  FRowData :=TWkxRowData.Create;
end;

Destructor TLotusCell.Destroy;
begin
  FRowData.Free;
  inherited Destroy;
end;

Function TLotusCell.GetCellIndex:Pointer;
begin
//  FRowData.CheckCols(FCurrentIndex);
//  Result:=FRowData[FCurrentIndex];
  Row[FCurrentRow].CheckCols(FCurrentIndex);
  Result:=Row[FCurrentRow][FCurrentIndex];
end;

Function TLotusCell.InternalToStr:AnsiString;
Var
  Tmp:PAnsiChar;
begin
  Case CellData.DataType of
  13:Begin
       if CellData.Stat<128 then
         Result:=IntToStr(Word(CellData.Data^));
     end;
  14:Begin
       if CellData.Stat<128 then
       Result:=FloatToStr(Real(CellData.Data^));
     end;
  15:Begin
       if CellData.Stat<128 then
       begin
         Tmp:=CellData.Data;
         Result:=AnsiString(Tmp);
         Delete(Result,1,1);
       end;
     end;
  else
    Result:='';
  end;
end;

Function TLotusCell.Rows:Integer;
begin
// Lengt ?? I ges you need high +1
 Result := high(FSheetData)+1;
end;

Procedure  TLotusCell.CheckRows(Index:integer);
begin
  if Rows-1<Index then
    SetLength(FSheetData,Index+1);
  FCurrentRow:=Index;
end;

Function TLotusCell.GetRowData(Index:Integer):TWkxRowData;
Begin
  if Index <0 then exit;
  CheckRows(Index);
  if FSheetData[Index]=Nil then
    FSheetData[Index]:=TWkxRowData.Create;
  Result := FSheetData[Index];
end;

Procedure  TLotusCell.SetRowData(Index:integer;Value:TWkxRowData);
begin
  CheckRows(Index);
  FSheetData[Index]:=Value;
end;


Function TLotusCell.GetAsString:AnsiString;
begin
  Result:=InternalToStr;
end;

Function TLotusCell.GetAsInteger:Integer;
begin
  Result:=StrToInt(InternalToStr);
end;

Function TLotusCell.GetAsReal:Real;
begin
  Result:=StrToFloat(InternalToStr);
end;

Function TLotusCell.GetTCellData:TCellData;
begin
  Result:=TCellData(PtrCellData^);
end;

Procedure TLotusCell.SetTCellData(Value:TCellData);
begin
  TCellData(PtrCellData^):=value;
end;

Function TLotusCell.GetAsIsNull:Boolean;
begin
  Result:=CellData.Stat>=128 ;
end;

Procedure TLotusCell.Value(CellType:Integer; Value:Variant);
Var
  T123Value:Pointer;
  vStr:AnsiString;
  itmp:SmallInt;
  rTmp:Real;
begin
//  FRowData.Changed := True;
  Row[FCurrentRow].Changed := True;
  Case CellType of
  13:
    Begin
      iTmp:=Value;
      T123Value:=AllocMem(SizeOf(iTmp));
      if isNull then
      begin
        TCellData(PtrCellData^).Stat:=0;{Changes IsNull Result to Normal}
        TCellData(PtrCellData^).DataType:=13;
        TCellData(PtrCellData^).Len:=SizeOf(iTmp)+1;
        Move(iTmp,T123Value^,SizeOf(iTmp));
        // check to se eif its assigned ? We just called
        TCellData(PtrCellData^).Data:=T123Value;
      end
      else
      begin
        TCellData(PtrCellData^).Len:=SizeOf(iTmp);
        Move(iTmp,T123Value^,SizeOf(iTmp));
      end;
    end;
  14: {Real}
    begin
      rTmp:=Value;
      T123Value:=AllocMem(SizeOf(rTmp));
      if isNull then
      begin
        TCellData(PtrCellData^).Stat:=0;{Changes IsNull Result to Normal}
        TCellData(PtrCellData^).DataType:=14;
        TCellData(PtrCellData^).Len:=SizeOf(rTmp)+1;
        Move(rTmp,T123Value^,SizeOf(rTmp));
        TCellData(PtrCellData^).Data:=T123Value;
      end
      else
      begin
        TCellData(PtrCellData^).Len:=SizeOf(rTmp);
        Move(rTmp,T123Value^,SizeOf(rTmp));
      end;
    end;  
  15: {String}
    Begin
      vStr:=Value;
      T123Value:=AllocMem(Length(vStr)+1);
      if isNull then
      begin
        TCellData(PtrCellData^).Stat:=0;{Changes IsNull Result to Normal}
        TCellData(PtrCellData^).DataType:=15;
        TCellData(PtrCellData^).Len:=Length(vStr)+1;
        StrPCopy(T123Value,vStr);
        TCellData(PtrCellData^).Data:=T123Value;
      end
      else
      begin
        TCellData(PtrCellData^).Len:=Length(vStr)+1;
        Move(vStr[1],T123Value^,Length(vStr)+1);
        FreeMem(T123Value);
      end;
    end;
  end;

end;

{RowData Class}

Constructor TWkxRowData.Create;
begin
  Inherited;
  FEmpty:=True;
end;

Procedure TWkxRowData.CheckCols(Col:Integer);
Var
  PtrCellData : PCellData ;
begin
  While Count<Col+1 do
  begin
    New(PtrCellData);
    PtrCellData.Stat:=255;{Null}
    PtrCellData.DataType:=0;
    PtrCellData.Col:=Col;
    Add(PtrCellData);
  end;
end;

Procedure TWkxRowData.SetCell(CellData:TCellData);
begin
  CheckCols(CellData.Col);
  TCellData(items[CellData.Col]^):=CellData;
end;

{TWkxFile Class}
Constructor TWkxFile.Create;
begin
  Inherited Create;
  FData   := TLotusCell.Create;
  FFileName:='';
  FIsOpen:=False;
//  FData.FRowData.FCurrentRow:=-1;
//  FData.Row[FCurrentRow].FCurrentRow:=-1;
  FData.FCurrentRow:=-1;
  AutoUpDate := True;
end;

Destructor TWkxFile.Destroy;
begin
  ClearRows ;
//  if (CurrentRow>-1) AND AutoUpDate And FData.FRowData.Changed then
//      UpDateFile;
  if FIsOpen Then
    CloseWkFile;
  FData.Free;
  Inherited Destroy;
end;


Function TWkxFile.CreateFile:Integer;
Var
  WkFileID:Word;
begin
  Result := 0;
  {Create File And Open}
  CreateWkFile;
  {Write Wk1 Head rec}
  WriteRecHead(0,2);
  WkFileID:=1030;
  Move(WkFileID,FBuffer,2);
  Stream.Write(FBuffer[0],2);
//  {Write Wk1 Eof}
//  WriteRecHead(1,0);
end;

Procedure TWkxFile.CreateWkFile;
Begin
  if (FileName<>'') And (Not FIsOpen) then
  begin
    FStream := TFileStream.Create(FileName,fmCreate);
    FreeAndNil(FStream);
    FColCount:=-1;
//    FRowCount:=-1;
    OpenWkFile;
  end;
end;

Procedure TWkxFile.OpenWkFile(readony : Boolean = false);
begin
  // cleaning up
  if assigned(FStream) then FreeAndNil(FStream);

  if (FileName<>'') And (Not FIsOpen) then
  begin
    // done : Pieter lets not care for locking if read only
    if  readony then
    FStream := TFileStream.Create(FileName,fmShareDenyNone)
    else
    FStream := TFileStream.Create(FileName,fmOpenReadWrite);
    FIsOpen := True;
  end;
end;

Procedure TWkxFile.SetFileName(Value:String);
begin
  if (Value<>FFileName) And (Not FIsOpen) then
  begin
    FFileName:= Trim(Value);
  end;
end;

Procedure TWkxFile.CloseWkFile;
begin

  FStream.Free;
  FIsOpen:=False;

end;

Procedure TWkxFile.GotoNext ;
begin
  Cell[CurrentRow+1,0];
end;

Function TWkxFile.SeekWkxRec(RecCode:Integer):Boolean;
Var
  Rec : TWkxRec;
begin
  repeat
   Result := ReadRecHead(Rec);
  until (Rec.Code=RecCode) Or (Result=False)
end;

procedure TWkxFile.WriteRecHead(RecType, Size : integer);
var
  Buffer : array[0..1] of word;
begin
  Buffer[0] := RecType;
  Buffer[1] := Size;
  Stream.Write(Buffer, SizeOf(Buffer));
end;

Function TWkxFile.GetCurrentRow:Integer;
begin
//  Result := FData.FRowData.FCurrentRow;
  Result := FData.FCurrentRow;

end;

Function TWkxFile.ReadRecHead(Var Rec : TWkxRec):Boolean;
begin
  FBufferlen:= 0;
  Result := Stream.Read(FBuffer,4)<>0;
  if Result then
  begin
    Move(FBuffer,Rec,4);
    if Rec.Length>0 then
    begin
      FBufferlen:= Rec.Length;
      Result := Stream.Read(FBuffer,FBufferlen)<>0;
    end;
  end;
end;

Procedure TWkxFile.ReadRowData;
Var
  HoldPos:LongInt;
  Rec : TWkxRec;
  CellData : TCellData ;
  BCont : Boolean;
  Procedure SetRowColCount(ColIndex,RowIndex:Integer);
  begin
    if FColCount<ColIndex then FColCount:=ColIndex+1;
//    if FRowCount<RowIndex then RowIndex:=RowIndex+1;
  end;
begin

    // No free ?
    // SetLength(FData.FSheetData,0);
    ClearRows ;
    Stream.Position:=0;
    Rec.Code:=0;
    repeat
      BCont := ReadRecHead(Rec);
      Case Rec.Code of
       13:
         Begin
         Move(FBuffer[0],TempCell,SizeOf(TempCell));
//         if (TempCell.Row = RowCoord.Row)  then
//         begin
           CellData.Len:= Rec.Length -5 ;
           CellData.DataType := 13;
           CellData.Col := TempCell.Col;
           // Alloc needs a call to free meme
           CellData.Data:= AllocMem(Rec.Length-5);
           CellData.Stat:=0;{Normal or Containing Value}
           SetRowColCount(CellData.Col,TempCell.Row);
           Move(FBuffer[5],CellData.Data^,Rec.Length-5);
           //FData.FRowData.SetCell(CellData);
           FData.Row[TempCell.Row].SetCell(CellData);

//         end;
         end;
       14:
         Begin
         Move(FBuffer[0],TempCell,SizeOf(TempCell));
//         if (TempCell.Row = RowCoord.Row)  then
//         begin
           CellData.Len:= Rec.Length -5 ;
           CellData.DataType := 14;
           CellData.Col := TempCell.Col;
           CellData.Data:= AllocMem(Rec.Length-5);
           CellData.Stat:=0;{Normal or Containing Value}
           SetRowColCount(CellData.Col,TempCell.Row);
           Move(FBuffer[5],CellData.Data^,Rec.Length-5);
           //FData.FRowData.SetCell(CellData);
           FData.Row[TempCell.Row].SetCell(CellData);
//         end;
         end;
       15:
       Begin
         Move(FBuffer[0],TempCell,SizeOf(TempCell));
//         if (TempCell.Row = RowCoord.Row)  then
//         begin
           CellData.Len:= Rec.Length -5 ;
           CellData.DataType := 15;
           CellData.Col := TempCell.Col;
           CellData.Data:= AllocMem(Rec.Length-5);
           CellData.Stat:=0;{Normal or Containing Value}
           SetRowColCount(CellData.Col,TempCell.Row);
           Move(FBuffer[5],CellData.Data^,Rec.Length-5);
           //FData.FRowData.SetCell(CellData);
           FData.Row[TempCell.Row].SetCell(CellData);
//         end;
       end;
     end;
    Until (BCont=False) Or (Rec.Code=1);
    Stream.Position := HoldPos ;
//  end;
end;

Function TWkxFile.GetCellValue(Row,Col:integer):TLotusCell;
Var
  CellCoord:TCellCoord;
begin
  CellCoord.Col := Col;
  CellCoord.Row := Row;
//  if Row<> CurrentRow then
//    ReadRowData(CellCoord);

//  FData.Row[Row].FCurrentRow := Row;
  FData.Row[Row].CheckCols(Col);
  FData.FCurrentIndex := Col;
  Result := FData;
end;

Function TWkxFile.FormatCell(Col:integer):Boolean;
(*This Function Will put DataCell in FBuffer and
  Returns True if Fbuffer contains Data to be written
*)
Type
  NewBuffer=Packed Record
    Rec:TWkxRec;
    Cell:TCellCoord;
  end;
Var
  Wk1Record:NewBuffer;
  Aling:Char;
  Value  : array[0..99] of AnsiChar;
begin
  Result:=False;
  FBufferLen:=0;
  if TCellData(FData.Row[GetCurrentRow].Items[Col]^).Stat<128 then
  begin
    Case TCellData(FData.Row[GetCurrentRow].Items[Col]^).Datatype Of
    13:
      Begin
        Wk1Record.Rec.Code:=13;
        Wk1Record.Rec.Length:= 7;
        Wk1Record.Cell.Format := 255;
        Wk1Record.Cell.Col := Col;
        Wk1Record.Cell.Row := FData.FCurrentRow;
        Move(Wk1Record,FBuffer[0],SizeOF(Wk1Record));
        Move(TCellData(FData.Row[GetCurrentRow].Items[Col]^).Data^,FBuffer[09],2);
        FBufferLen:=Wk1Record.Rec.Length+4;
        Result:=True;
      end;
    14:
      begin
        Wk1Record.Rec.Code:=14;
        Wk1Record.Rec.Length := 13;
        Wk1Record.Cell.Format :=2 or 128;
        Wk1Record.Cell.Col := Col;
        Wk1Record.Cell.Row := FData.FCurrentRow;
        Move(Wk1Record,FBuffer[0],SizeOF(Wk1Record));
        Move(TCellData(FData.Row[GetCurrentRow].Items[Col]^).Data^,FBuffer[09],SizeOf(real));
        FBufferLen:=Wk1Record.Rec.Length+4;
        Result:=True;
      end;  
    15:
      begin
        Aling:='''';
        Wk1Record.Rec.Code:=15;
        Wk1Record.Rec.Length:= TCellData(FData.Row[GetCurrentRow].Items[Col]^).Len + 6;
        Wk1Record.Cell.Format := 255;
        Wk1Record.Cell.Col := Col;
        Wk1Record.Cell.Row := FData.FCurrentRow;
        Move(Wk1Record,FBuffer[0],SizeOF(Wk1Record));
        FBuffer[9]:= Ord(Aling);
        StrPCopy(Value,PAnsiChar(TCellData(FData.Row[GetCurrentRow].Items[Col]^).Data));
        Move(Value[0],FBuffer[10],Wk1Record.Rec.Length-6);
        FBufferLen:=Wk1Record.Rec.Length+4;
        Result:=True;
      end;
    end;
  end;
end;


Procedure TWkxFile.SaveToFile;
Var
  iCount,jCount:integer;
begin
  if Fisopen then
    CloseWkFile;
  CreateFile;
  iCount:=0;
  For iCount:=0 to FData.Rows-1 do
  begin
      {Insert UpDated Row}
      For jCount:=0 to FData.Row[iCount].Count-1 do
      begin
        if FormatCell(jCount) then
          Stream.Write(FBuffer,FBufferLen);
      end;
  End;
//  {Write Wk1 Eof}
  WriteRecHead(1,0);
  CloseWkFile;
end;

Function TWkxFile.GetRowCount:Integer;
begin
  Result := FData.Rows;
end;

Procedure TWkxFile.LoadFromFile(readony : Boolean = false);
begin
  OpenWkFile(readony);
  ReadRowData;
  CloseWkFile;
end;



procedure TWkxFile.ClearRows;
var
 i : integer ;
begin
for i := low(FData.FSheetData) to high(FData.FSheetData) do
  if assigned(FData.FSheetData[i]) then
    FData.FSheetData[i].Free ;
SetLength(FData.FSheetData,0);

end;

destructor TWkxRowData.Destroy;
begin
  FreememInList ;
  inherited;
end;

procedure TWkxRowData.FreememInList;
var
 i : integer ;
begin
  for i := 0 to self.Count -1 do
   FreeMemory(items[i]);
end;

end.
