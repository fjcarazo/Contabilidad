unit NewLogicParcer;

interface

uses
  Classes, Sysutils, prExpr, contnrs,variants; // Graphics, Controls, Forms, Dialogs,
  // StdCtrls;

type


  TExtendFunctions = Procedure (const Identifier: string; ParameterList: TParameterList ;var value : IValue)  of object ;
  TNewLogicParcer = class
  private
    FEvalObject: TPersistent;
    FLastCollectionItem: TPersistent;
    FOnExtendFunction: TExtendFunctions;
    procedure SetEvalObject(const Value: TPersistent);
    function TotalizeCollection(const AName, aPropName, Creteria: string;
      APersistent: TPersistent): Variant;
    function SetCollection(const AName, aPropName,value, Creteria: string;
      APersistent: TPersistent): Variant;
    Procedure SetCollectionProp(const AName, aPropName, Creteria,Value: string;
      APersistent: TPersistent);
    function EG3IDFunc(const Identifier: string;
      ParameterList: TParameterList): IValue;
    function CalcCollectionValue(AValue: string): Variant;
    procedure SetOnExtendFunction(const Value: TExtendFunctions);
  //  function EvalToDate(aString: string): string;
    { Private declarations }
  public
    // Gebruik deze functie om een waarden van een object
    // uit te lezen in het formaat 'objectproperty.naam'
    // ondersteund nog geen Collection objecten
    function GetPersistentProp(const AName: string; aPersistent: TPersistent): Variant;
    // Gebruik deze functie om een waarden van een object
    // te veranderen te lezen in het formaat 'objectproperty.naam',Value
    // ondersteund nog geen Collection objecten
    procedure SetPersistentProp(const AName: string; aPersistent: TPersistent; Value: Variant);
    // berekend een waarde van een string b.v '2 + 5' = 7
    // of '2 + 5 = 7' = true
    // ondersteund Min,Max,ToDate
    // is uppercase sensitive
    // en operatoren = - * ^ /
    // en de logische operatoren  ! = < >
    // en object verwijzingen naar het eval object
    // deze moeten met de vogende syntax worden aangesproken
    // [propname] = [objectprop.propname]
    // propertynamen zijn niet casesensitive
    function CalcValue(AValue: string): Variant;
    // Het object dat beruikt worn om de evaluatie op te doen in geval van object propertys
    // dit is puur een holder i.e. een pointer naar een object
    // minimun is Tpersistent omdat deze standaard RTTI informatie mee geeft
    property EvalObject: TPersistent read FEvalObject write SetEvalObject;
    function EG2IDFunc(const Identifier: string;
      ParameterList: TParameterList): IValue;
    Property OnExtendFunction : TExtendFunctions  read FOnExtendFunction write SetOnExtendFunction;
    { Public declarations }
  end;



implementation

uses math, TypInfo;

function TNewLogicParcer.EG3IDFunc(const Identifier: string;
  ParameterList: TParameterList): IValue;
{this identifier function is used for example 2. It supports the
identifiers SC, FC, IC, BC, 'Form' and any value of TEnumerated}
var
  tempStr: string;
  aVar: Variant;
begin
  {these identifiers do not require parameters, so raise an exception if they exist.
   Note that if a parameter list is passed (due to bad syntax) and then we return a
   valid result, the parameter list will be orphaned and there will be a memory leak}
  if Identifier = 'TODATE' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 1 then
      raise EExpression.CreateFmt('Identifier %s requires onley 1 parameter', [Identifier]);
    tempStr := ParameterList.AsString[0];
    Result := TFloatLiteral.Create(StrToDate(tempStr));
    exit;
  end;
  if Identifier = 'MIN' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);

    Result := TFloatLiteral.Create(Min(ParameterList.AsFloat[0], ParameterList.AsFloat[1]));
    exit;
  end;
  if Identifier = 'MAX' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);
    Result := TFloatLiteral.Create(Max(ParameterList.AsFloat[0], ParameterList.AsFloat[1]));
    exit;
  end;
  if Identifier = 'GETOBJECT' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 1 then
      raise EExpression.CreateFmt('Identifier %s requires 1 parameter', [Identifier]);
    Result := TStringLiteral.Create(VarToStr(GetPersistentProp(ParameterList.AsString[0], FEvalObject)));
    Exit; //exit iteration
  end;

  if Identifier = 'SETOBJECT' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);

    aVar := GetPersistentProp(ParameterList.AsString[0], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      SetPersistentProp(ParameterList.AsString[0], FEvalObject, ParameterList.AsString[1]);
      aVar := GetPersistentProp(ParameterList.AsString[0], FEvalObject);
               // return new value
      Result := TStringLiteral.Create(VarToStr(aVar));
      Exit; //exit iteration
    end;
  end;

  if Identifier = 'TOTALIZECOLLECTION' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 3 then
      raise EExpression.CreateFmt('Identifier %s requires 3 parameter', [Identifier]);

    aVar := TotalizeCollection(ParameterList.AsString[0], ParameterList.AsString[1], ParameterList.AsString[2], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      Result := TStringLiteral.Create(VarToStr(aVar));
      Exit; //exit iteration
    end;
  end;
  if Identifier = 'SETCOLLECTION' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 4 then
      raise EExpression.CreateFmt('Identifier %s requires 4 parameter', [Identifier]);

    aVar := SetCollection(ParameterList.AsString[0], ParameterList.AsString[1], ParameterList.AsString[2],ParameterList.AsString[3], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      Result := TStringLiteral.Create(VarToStr(aVar));
      Exit; //exit iteration
    end;
  end;

  // paramless functions
  if Assigned(ParameterList) then
    raise EExpression.CreateFmt('Identifier %s does not require parameters', [Identifier]);
  if Identifier = 'O' then
    Result := TObjectRef.Create(FEvalObject);
  if Identifier = 'X' then
    Result := TObjectRef.Create(FLastCollectionItem);
  if Identifier = 'TODAY' then
  begin
    Result := TFloatLiteral.Create(Date);
  end;
end;


function TNewLogicParcer.EG2IDFunc(const Identifier: string;
  ParameterList: TParameterList): IValue;
{this identifier function is used for example 2. It supports the
identifiers SC, FC, IC, BC, 'Form' and any value of TEnumerated}
var
  tempStr: string;
  aVar: Variant;
begin
  {these identifiers do not require parameters, so raise an exception if they exist.
   Note that if a parameter list is passed (due to bad syntax) and then we return a
   valid result, the parameter list will be orphaned and there will be a memory leak}
  if Identifier = 'TODATE' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 1 then
      raise EExpression.CreateFmt('Identifier %s requires onley 1 parameter', [Identifier]);
    tempStr := ParameterList.AsString[0];
    Result := TFloatLiteral.Create(StrToDate(tempStr));
    exit;
  end;
  if Identifier = 'MIN' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);

    Result := TFloatLiteral.Create(Min(ParameterList.AsFloat[0], ParameterList.AsFloat[1]));
    exit;
  end;
  if Identifier = 'MAX' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);
    Result := TFloatLiteral.Create(Max(ParameterList.AsFloat[0], ParameterList.AsFloat[1]));
    exit;
  end;
  if Identifier = 'GETOBJECT' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 1 then
      raise EExpression.CreateFmt('Identifier %s requires 1 parameter', [Identifier]);
    Result := TStringLiteral.Create(VarToStr(GetPersistentProp(ParameterList.AsString[0], FEvalObject)));
    Exit; //exit iteration
  end;


  if Identifier = 'SETOBJECT' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 2 then
      raise EExpression.CreateFmt('Identifier %s requires 2 parameter', [Identifier]);
    aVar := GetPersistentProp(ParameterList.AsString[0], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      SetPersistentProp(ParameterList.AsString[0], FEvalObject, ParameterList.AsString[1]);
      aVar := GetPersistentProp(ParameterList.AsString[0], FEvalObject);
               // return new value
      Result := TStringLiteral.Create(VarToStr(aVar));
      Exit; //exit iteration
    end;
  end;

  if Identifier = 'IFSETOBJECT' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 3 then
      raise EExpression.CreateFmt('Identifier %s requires 3 parameter', [Identifier]);
    if  ParameterList.AsBoolean[0] then
    aVar := GetPersistentProp(ParameterList.AsString[1], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      SetPersistentProp(ParameterList.AsString[1], FEvalObject, ParameterList.AsString[2]);
      aVar := GetPersistentProp(ParameterList.AsString[1], FEvalObject);
               // return new value
    end;
      Result := TBooleanLiteral.Create(ParameterList.AsBoolean[0]);
      Exit; //exit iteration
  end;


  if Identifier = 'SETCOLLECTION' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 4 then
      raise EExpression.CreateFmt('Identifier %s requires 4 parameter', [Identifier]);

    aVar := SetCollection(ParameterList.AsString[0], ParameterList.AsString[1], ParameterList.AsString[2],ParameterList.AsString[3], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      Result := TStringLiteral.Create(VarToStr(aVar));
      Exit; //exit iteration
    end;
  end;

  if Identifier = 'TOTALIZECOLLECTION' then
  begin
    if not assigned(ParameterList) then
      raise EExpression.CreateFmt('Identifier %s requires parameters', [Identifier]);
    if ParameterList.Count <> 3 then
      raise EExpression.CreateFmt('Identifier %s requires 3 parameter', [Identifier]);

    aVar := TotalizeCollection(ParameterList.AsString[0], ParameterList.AsString[1], ParameterList.AsString[2], FEvalObject);
    if Vartype(aVar) <> varEmpty then
    begin
      begin
        case Vartype(aVar) of
          varSmallint,
            varInteger: Result := TIntegerLiteral.Create(aVar);
          varSingle,
            varDouble,
            varCurrency: Result := TFloatLiteral.Create(aVar);

        else
          Result := TStringLiteral.Create(VarToStr(aVar));
        end;
      end;

      Exit; //exit iteration
    end;
  end;
  if Result = nil then
     if assigned(FOnExtendFunction) then
          FOnExtendFunction(Identifier,ParameterList,Result);

   if result <> nil then exit ;       
  // paramless functions
  if Assigned(ParameterList) then
    raise EExpression.CreateFmt('Identifier %s does not require parameters', [Identifier]);
  if Identifier = 'O' then
    Result := TObjectRef.Create(FEvalObject);

  if Identifier = 'TODAY' then
  begin
    Result := TFloatLiteral.Create(Date);
  end;


end;

function TNewLogicParcer.CalcValue(AValue: string): Variant;
var
  E: IValue;
begin
  E := CreateExpression(AValue, EG2IDFunc);
  if Assigned(E) then
  begin
    case E.ExprType of
      ttString: result := E.AsString;
      ttFloat: result := E.AsFloat;
      ttInteger: result := E.AsInteger;
      ttEnumerated: result := E.AsInteger;
      ttBoolean: result := E.AsBoolean;
    end;
  end;
end;

function TNewLogicParcer.CalcCollectionValue(AValue: string): Variant;
var
  E: IValue;
begin
  E := CreateExpression(AValue, EG3IDFunc);
  if Assigned(E) then
  begin
    case E.ExprType of
      ttString: result := E.AsString;
      ttFloat: result := E.AsFloat;
      ttInteger: result := E.AsInteger;
      ttEnumerated: result := E.AsInteger;
      ttBoolean: result := E.AsBoolean;
    end;
  end;
end;

  {
function TNewLogicParcer.GetObjectValue(AObject: string): Variant;
var
  i: Integer;
  Day, Jear, Month: Word;
  TempStr, TempMonth: string;
begin
// nul datum 30#12#1899
  if (AObject = '') or (AObject[1] <> '[') or (AObject[Length(AObject)] <> ']') then
    exit;
  if POS('#', AObject) <> 0 then
  begin
    AObject[Length(AObject)] := ' ';
    AObject[1] := ' ';
    for i := 1 to Length(AObject) do
    begin
      if AObject[i] = '#' then AObject[i] := '-';
    end;
    AObject := Trim(AObject);

    if StrToInt(AObject[1] + AObject[2]) = 0 then
    begin
      i := Length(AObject);
             // jaren
      while (AObject[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
      begin
        TempStr := AObject[i] + TempStr;
        dec(i);
      end;
      dec(i);
             // maanden
      while (AObject[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
      begin
        TempMonth := AObject[i] + TempMonth;
        dec(i);
      end;
      Jear := 1899;
      Month := 12;
      Day := 30;
      Jear := Jear + StrToInt(TempStr);
      Result := EncodeDate(jear, month, day);
    end
    else
      Result := StrToDate(AObject);
  end
  else if AObject = '[TODAY]' then
    result := Date
  else
  begin
    AObject[Length(AObject)] := ' ';
    AObject[1] := ' ';
    AObject := Trim(AObject);
    Result := GetPersistentProp(AObject, FEvalObject);
  end;
  if TVarData(result).VType = varEmpty then
    Result := AObject;


end;   }



procedure TNewLogicParcer.SetPersistentProp(const AName: string; APersistent: TPersistent; Value: Variant);
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName, FloatValue: string;
  AFloat: Double;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) and (PropList[i]^.SetProc <> nil) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString,
            tkWString, tkWChar,
            tkChar:
            begin
              SetStrProp(APersistent, PropList[i], VarToStr(Value));
            end;

          tkInteger,
            tkEnumeration:
            begin
              if VarToStr(Value) <> '' then
                SetOrdProp(APersistent, PropList[i], StrToInt(VarToStr(Value)));
            end;
          tkFloat:
            begin
              if (PropList[i]^.PropType^.Name = 'TDateTime') then
                SetFloatProp(APersistent, PropList[i], VarToDateTime(Value))
              else
              begin
                FloatValue := VarToStr(Value);
                if (FloatValue <> '') then
                begin

                  if Pos('IND', FloatValue) <> 0 then
                    AFloat := 0
                  else if Pos('INF', FloatValue) <> 0 then
                    AFloat := 0
                  else
                   AFloat := StrToFloat(FloatValue)  ;
                  SetFloatProp(APersistent, PropList[i], AFloat);
                end;
              end
            end;
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
              // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                  Propname := copy(NextName, 1, pos('.', NextName) - 1);
                  NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                  // if its a add function then add
                  if Uppercase(NextName) = 'ADD' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Add;
                    exit; // found ADD key word
                  end;
                  if Uppercase(NextName) = 'CLEAR' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Clear;
                    exit; // found ADD key word
                  end;
                  // Do the same for delete
                  if Uppercase(Propname) = 'DELETE' then
                  begin
                  // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (NextName[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(NextName, i, 1);
                    end;
                    if NextName <> '' then
                    begin
                      TCollection(GetObjectProp(APersistent, PropList[i])).Delete(StrToInt(NextName));
                      exit; // found delete key word
                    end;
                  end;
                  // probeer een set van de default propertys
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
                 // strip annyting not numeric
                  for x := Length(Propname) downto 1 do
                  begin
                    if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                      delete(Propname, i, 1);
                  end;
                // check empty
                  if Propname <> '' then
                    SetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)], Value);
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
              end;
            end;

        end; // case
           // end found so if found exit ;
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;



function TNewLogicParcer.GetPersistentProp(const AName: string; APersistent: TPersistent): Variant;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      try
        if (PropList[i]^.Name = Propname) then
        begin
          case PropList[i]^.PropType^.Kind of
            tkString, tkLString,
              tkWString, tkWChar,
              tkChar:
              begin
                Result := GetStrProp(APersistent, PropList[i]);
              end;

            tkInteger,
              tkEnumeration:
              begin
                Result := GetOrdProp(APersistent, PropList[i]);
              end;
            tkFloat:
              begin
                if (PropList[i]^.PropType^.Name = 'TDateTime') then
                  Result := VarFromDateTime(GetFloatProp(APersistent, PropList[i]))
                else
                  Result := GetFloatProp(APersistent, PropList[i]);
              end;
            tkClass:
              begin
                if GetObjectProp(APersistent, PropList[i]) is TPersistent then
                begin
         // TCollection alows indexed acces
                  if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                  begin
                    Propname := copy(NextName, 1, pos('.', NextName) - 1);
                    NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                    if Uppercase(NextName) = 'COUNT' then
                    begin
                      Result := TCollection(GetObjectProp(APersistent, PropList[i])).Count;
                      exit; // found Count key word
                    end;
                // is it a property of collection ?
                    Result := null;
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                // if found then exit ;
                    if VarIsNull(Result) then
                    begin
                      Result := 0;
                    end
                    else
                      exit;
                // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(Propname, x, 1);
                    end;
               // check empty
                    if Propname <> '' then
                      Result := GetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)]);

                  end
                  else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                end;
              end;

          end; // case
           // end found so if found exit ;
          Exit;
        end;
      except
        Result := -1;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;


function TNewLogicParcer.TotalizeCollection(const AName, aPropName, Creteria: string; APersistent: TPersistent): Variant;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
         // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                  result := null;
                // is it a property of collection ?
                  for x := 0 to TCollection(GetObjectProp(APersistent, PropList[i])).count - 1 do
                  begin
                    FLastCollectionItem := TCollection(GetObjectProp(APersistent, PropList[i])).Items[x];
                    if CalcCollectionValue(Creteria) then
                    begin
                      if result = null then
                        Result := GetPersistentProp(aPropname, TCollection(GetObjectProp(APersistent, PropList[i])).Items[x])
                      else
                        Result := Result + GetPersistentProp(aPropname, TCollection(GetObjectProp(APersistent, PropList[i])).Items[x]);
                    end;
                  end;
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                  Result := TotalizeCollection(NextName, aPropname, Creteria, TPersistent(GetObjectProp(APersistent, PropList[i])));
              end;
            end;

        end; // case
           // end found so if found exit ;
        if result = null then
          result := 'null';
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;
{
function TNewLogicParcer.EvalToDate(aString: string): string;
var
  i: Integer;
begin

  Result := VarToStr(CalcValue(aString));
  for i := 1 to length(Result) do
    if result[i] = '-' then result[i] := '#';
  Result := '[' + result + ']';
end;  }





procedure TNewLogicParcer.SetEvalObject(const Value: TPersistent);
begin
  FEvalObject := Value;
end;

procedure TNewLogicParcer.SetCollectionProp(const AName, aPropName,
  Creteria, Value: string; APersistent: TPersistent);
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
         // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                // is it a property of collection ?
                  for x := 0 to TCollection(GetObjectProp(APersistent, PropList[i])).count - 1 do
                  begin
                    FLastCollectionItem := TCollection(GetObjectProp(APersistent, PropList[i])).Items[x];
                    if CalcCollectionValue(Creteria) then
                    begin
                      SetPersistentProp(aPropname, TCollection(GetObjectProp(APersistent, PropList[i])).Items[x],Value) ;
                    end;
                  end;
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                   SetCollectionProp(NextName, aPropname, Creteria,value, TPersistent(GetObjectProp(APersistent, PropList[i])));
              end;
            end;

        end; // case
           // end found so if found exit ;
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;

procedure TNewLogicParcer.SetOnExtendFunction(
  const Value: TExtendFunctions);
begin
  FOnExtendFunction := Value;
end;

function TNewLogicParcer.SetCollection(const AName, aPropName,Value ,
  Creteria: string; APersistent: TPersistent): Variant;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
         // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                  result := null;
                // is it a property of collection ?
                  for x := 0 to TCollection(GetObjectProp(APersistent, PropList[i])).count - 1 do
                  begin
                    FLastCollectionItem := TCollection(GetObjectProp(APersistent, PropList[i])).Items[x];
                    if CalcCollectionValue(Creteria) then
                    begin
                        SetPersistentProp(aPropname, TCollection(GetObjectProp(APersistent, PropList[i])).Items[x],value) ;
                        Result := 'done' ;
                    end;
                  end;
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                  Result := SetCollection(NextName, aPropname,value, Creteria, TPersistent(GetObjectProp(APersistent, PropList[i])));
              end;
            end;

        end; // case
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;

end.

