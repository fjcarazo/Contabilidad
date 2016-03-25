unit Read123;
{This Unit is used for Stock Import process}

interface

uses LotusWKx,Classes,SysUtils,StrUtils;

Function  Open123File(FileName:String):Boolean;
Procedure Close132File;
Function  LtsFieldIndex(aField:String):Integer;
Function  ReadField(aField:String):String;
Function  LtsFieldName(Index:integer):String;
Procedure GoNext123;
Function  Row_Count:Integer;
Function  LtsFieldExists(aFileName:String):Boolean;


Var
  LstFieldExsts:Boolean;
  LotusFile   : TWkxFile;


implementation
Var

  aFieldsList : TStringList;
  RowCount, ColCount:Integer;

Function  LtsFieldIndex(aField:String):Integer;
begin
  if (aFieldsList=nil)  then
    exit;
  Result := aFieldsList.IndexOf(aField);
end;

Function FieldPos(aField:String):Integer;
begin
  Result := LtsFieldIndex(aField);
  LstFieldExsts := Result>=0;
  if Result<0 then
    Result :=0;
end;

Function LtsFieldExists(aFileName:String):Boolean;
begin
  FieldPos(aFileName);
  Result := LstFieldExsts;
end;

Function Open123File(FileName:String):Boolean;
Var
  i:Integer;
  s:String;
begin
  Try
    if not assigned(LotusFile) then
    LotusFile := TWkxFile.Create;
    LotusFile.FileName:=FileName;
//    LotusFile.OpenWkFile;
    LotusFile.LoadFromFile(true);
    aFieldsList:=TStringLIst.create;
    aFieldsList.CaseSensitive:=False;

    // done : Pieter Dunno appernetly its 0 indexed couse a tax fell off
    for i:=0 to LotusFile.ColCount do
    begin
      aFieldsList.Add(LotusFile.Cell[0,i].AsString);
    end;
    Result:=True
  except
    Result:=False;
    FreeAndNil(LotusFile);
    FreeAndNil(aFieldsList);
    Result := False;
  end;
end;


Procedure Close132File;
begin
 // LotusFile.CloseWkFile;
 FreeAndNil(LotusFile);
 FreeAndNil(aFieldsList);
end;

Function ReadField(aField:String):String;
Var
  aFieldPos:integer;
begin
  Try
    Result :='';
    aFieldPos := FieldPos(aField);
    if LstFieldExsts then
      Result := LotusFile.Cell[LotusFile.CurrentRow,aFieldPos].AsString;
  except
    Result :='';
  end;
end;

Procedure GoNext123;
begin
  LotusFile.GotoNext;
end;

Function  LtsFieldName(Index:integer):String;
begin
  Result:='';
  if aFieldsList.Count>index then
    Result:=aFieldsList[Index];
end;

Function  Row_Count:Integer;
begin
  try
    Result := LotusFile.RowCount;
  except Result:=-1 End;
end;

initialization

finalization
begin
if assigned(LotusFile) then
   FreeAndNil(LotusFile);
end;


end.
