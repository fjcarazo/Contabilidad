unit NewGlobalFunctions;

interface

uses
  DB, SysUtils, Forms, Graphics, FileCtrl, Windows, Menus,
  Math, Controls, Dialogs, Messages,Registration;

function  EncodePasswordDll (Password : String) : String;
function  DecodePasswordDll (Password : String) : String;
function  sgn(Value:real):SmallInt;StdCall;
Function  Str2Int(Value:String):Integer;
Function  DecodeToInt(Value:String):Integer;
Function  EncodeToStr(Value:Integer):String;
Function  IsGeneralPwd (Password : Pchar):Boolean;StdCall;
Function  IntDate:Real;
Function  IsRegistered:Boolean;

implementation

Uses Fonts,databaseaccess,database, TcVariables;


Function  IsRegistered:Boolean;
Begin
  Result:=TheGlobalDataObject.Registration.Registered ;
{  if not Result then
     begin
      fmRegister:=TfmRegister.Create(nil);
      try
           if OSFMessageDlg(GetTextLang(975), mtconfirmation, [mbyes, mbno], 0) = mryes then
           begin
            fmRegister.ShowModal ;
            result :=  TheGlobalDataObject.Registration.Registered ;
           end;
      Finally
        FreeAndNil(fmRegister);
      end;
    end;   }
end;




Function IsGeneralPwd (Password : Pchar):Boolean;
begin
  Result:=False;
  if (Password='061266') or (Password='060969') Or (Password='280371') then
    Result:=True;
end;

function EncodePasswordDll(Password : String) : String;
var
  i      : Integer;
  Return : String;
begin
  Return := '';
  for i := 1 to Length(Password) do
  begin
  // Modify by Sylvain from if to Case
    Case Password[i] of
    'a' : Return := Return + 'r';
    'b' : Return := Return + 's';
    'c' : Return := Return + 'a';
    'd' : Return := Return + 'b';
    'e' : Return := Return + 'h';
    'f' : Return := Return + 'u';
    'g' : Return := Return + 'q';
    'h' : Return := Return + 'w';
    'i' : Return := Return + 'k';
    'j' : Return := Return + 'l';
    'k' : Return := Return + 'v';
    'l' : Return := Return + 'x';
    'm' : Return := Return + 'o';
    'n' : Return := Return + 'd';
    'o' : Return := Return + 'e';
    'p' : Return := Return + 'y';
    'q' : Return := Return + 'i';
    'r' : Return := Return + 'g';
    's' : Return := Return + 'j';
    't' : Return := Return + 't';
    'u' : Return := Return + 'c';
    'v' : Return := Return + 'p';
    'w' : Return := Return + 'n';
    'x' : Return := Return + 'm';
    'y' : Return := Return + 'f';
    'z' : Return := Return + 'z';
    'A' : Return := Return + 'R';
    'B' : Return := Return + 'S';
    'C' : Return := Return + 'A';
    'D' : Return := Return + 'B';
    'E' : Return := Return + 'H';
    'F' : Return := Return + 'U';
    'G' : Return := Return + 'Q';
    'H' : Return := Return + 'W';
    'I' : Return := Return + 'K';
    'J' : Return := Return + 'L';
    'K' : Return := Return + 'V';
    'L' : Return := Return + 'X';
    'M' : Return := Return + 'O';
    'N' : Return := Return + 'D';
    'O' : Return := Return + 'E';
    'P' : Return := Return + 'Y';
    'Q' : Return := Return + 'I';
    'R' : Return := Return + 'G';
    'S' : Return := Return + 'J';
    'T' : Return := Return + 'T';
    'U' : Return := Return + 'C';
    'V' : Return := Return + 'P';
    'W' : Return := Return + 'N';
    'X' : Return := Return + 'M';
    'Y' : Return := Return + 'F';
    'Z' : Return := Return + 'Z';
    else
     Return := Return +Password[i];
    end;
  end;
  result := Return
end;

function  DecodePasswordDll(Password : String) : String;
var
  i      : Integer;
  Return : String;
begin
  Return := '';
  for i := 1 to Length(Password) do
  begin
    Case Password[i] of
    'r' : Return := Return + 'a';
    's' : Return := Return + 'b';
    'a' : Return := Return + 'c';
    'b' : Return := Return + 'd';
    'h' : Return := Return + 'e';
    'u' : Return := Return + 'f';
    'q' : Return := Return + 'g';
    'w' : Return := Return + 'h';
    'k' : Return := Return + 'i';
    'l' : Return := Return + 'j';
    'v' : Return := Return + 'k';
    'x' : Return := Return + 'l';
    'o' : Return := Return + 'm';
    'd' : Return := Return + 'n';
    'e' : Return := Return + 'o';
    'y' : Return := Return + 'p';
    'i' : Return := Return + 'q';
    'g' : Return := Return + 'r';
    'j' : Return := Return + 's';
    't' : Return := Return + 't';
    'c' : Return := Return + 'u';
    'p' : Return := Return + 'v';
    'n' : Return := Return + 'w';
    'm' : Return := Return + 'x';
    'f' : Return := Return + 'y';
    'z' : Return := Return + 'z';
    'R' : Return := Return + 'A';
    'S' : Return := Return + 'B';
    'A' : Return := Return + 'C';
    'B' : Return := Return + 'D';
    'H' : Return := Return + 'E';
    'U' : Return := Return + 'F';
    'Q' : Return := Return + 'G';
    'W' : Return := Return + 'H';
    'K' : Return := Return + 'I';
    'L' : Return := Return + 'J';
    'V' : Return := Return + 'K';
    'X' : Return := Return + 'L';
    'O' : Return := Return + 'M';
    'D' : Return := Return + 'N';
    'E' : Return := Return + 'O';
    'Y' : Return := Return + 'P';
    'I' : Return := Return + 'Q';
    'G' : Return := Return + 'R';
    'J' : Return := Return + 'S';
    'T' : Return := Return + 'T';
    'C' : Return := Return + 'U';
    'P' : Return := Return + 'V';
    'N' : Return := Return + 'W';
    'M' : Return := Return + 'X';
    'F' : Return := Return + 'Y';
    'Z' : Return := Return + 'Z';
    else
      Return := Return+Password[i];
    end;
  end;
  result := Return ;
end;



function  Sgn(Value:real):SmallInt;StdCall;
Begin
  if value<0 then
    result:=-1
  else
    result:=1
end;

Function  Str2Int(Value:String):Integer;
BEGIN
  try
   if @Value=Nil then
     Result:=0
   else
     Result:=StrToInt(Value);
  except
   result:=0;
  end;
END;

Function EncodeToStr(Value:Integer):String;
Var
  i:Byte;
Begin
  Try
    Result:=IntToStr(Value);
  Except
    Result := '2'
  end;
  for i:=1 to Length(Result) do
    Result[i]:= Char(Ord(Result[i])-30);
end;

Function DecodeToInt(Value:String):Integer;
Var
  i:Byte;
Begin
  if Value<>'' then
  for i:=1 to Length(Value) do
    Value[i]:= Char(Ord(Value[i])+30)
  else
    Value:='0';  
  try
    Result := StrToInt(Value)
  Except
    Result := 0;
  end;
end;

Function IntDate:Real;
begin
  Result := TrunC(Date) ;
end;


end.
