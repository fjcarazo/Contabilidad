{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit SylTagParser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Variants;

type
  TSylXmlBookMark=Record
    Position : LongInt;
    FTagName : String;
    FTagAttributes : String;
    FContents : String;
  end;


  TOnStartTag = Procedure(Sender:TObject;Const ActiveTagName,ActiveContents,ActiveAttribute:String;Var Scan:Boolean) of Object;
  TOnProcInst = Procedure(Sender:TObject;Const ActiveTagName,ActiveContents,ActiveAttribute:String;Var Scan:Boolean) of Object;
  TOnScriptTag = Procedure(Sender:TObject;Const ActiveTagName,ActiveContents,ActiveAttribute:String) of Object;
  TOnStrToDate = Procedure(Sender:TObject; Var aDate) of Object;

  TSylTagValues=Class(TComponent)
  private
    FUseSdtDate:Boolean;
    FValue : Variant;
    FOnStrToDate : TOnStrToDate;
    Function ToString : String;
    Function ToDate : TDate;
    Function ToDateTime:TDateTime;
    Function ToFloat : Extended;
    Function ToInt : Integer;
  Public
    Property Value : Variant Read FValue;
    Property AsString:String Read ToString;
    Property AsDate:TDate Read ToDate;
    Property AsDateTime:TDateTime Read ToDateTime;
    Property ASFloat :Extended Read ToFloat;
    Property AsInteger : Integer Read ToInt;
  End;

  TSylSax = class(TComponent)
  private
    { Private declarations }
    FFileName:String;
    FOpen : Boolean;
    FStream:TStream;
    FBuffer:Char;
    FTagName:String; {Current Tag Name}
    FContents:String; {Current Tag Value}
    FClearLfCr:Boolean;
    FEOTags :Boolean;
    FTagAttributes  : String;
    FOnTagProc : TOnStartTag;
    FOnProcInstr: TOnProcInst;
    FOnScriptTag : TOnScriptTag;
    FTmp:TSylTagValues;
    FElements : String;
    FXmlContent:String;
    FMachCase : Boolean;
    FStdDateFomat : Boolean;
    FScriptTag : String;
    Procedure SetFileName(aFileName:String);
    Procedure SetStartDocument(Value:Boolean);
    Procedure SetClose;
    Procedure LoadNextTag;
    Function Navigate:String;
    Function Navigate2:String;
    Procedure ClearLfCrNow;
    Procedure SetClearLfCr(Value:Boolean);
    Procedure CleanNow(Var S:String);
    Procedure SetOnTagProc(Const Value:TOnStartTag);
    Function  GetValue(Const Name:String):TSylTagValues;
    FUnction  GetNames(Const Index:Integer):String;
    Function  ScanForchar(const aChar:char;Const aSource:String):integer;
    Function  CountAttributes:Integer;
    Function  GotoNextTag:Boolean;
    procedure DoRead;
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent);Override;
    Destructor  Destroy;Override;
    Function SeekLoad(Const ArrayTagNames:Array of String; Var ArrayContents:Array of String):Boolean;
    Property Values[Const Name:String]:TSylTagValues Read GetValue;Default;
    Property Names[Const Index:integer]:String Read GetNames;
    Property EOTags :Boolean Read FEOTags;
    Property TagName:String Read FTagName;
    Property Contents: String Read FContents;
    Property Count :Integer Read CountAttributes;
    Function NameExists(Const Name:String):Boolean;
    Procedure GotBookMark(aBookMark:TSylXmlBookMark);
    Function SetBookMark:TSylXmlBookMark;
    Procedure ScanNow;
    Function ExtractXML(ATag:String):String;
    Procedure SetStrToDate(Const Value:TOnStrToDate);
    Function GetStrToDate: TOnStrToDate;
    Procedure ReadFromStream(aStream:TStream);
    Procedure CopyFrom(AString:String);
    Function  ContentText:string;
    Function SeekTag(atagName:string):Boolean;
    Function FindAndLoadTag(aTagName:String):String;
  published
    { Published declarations }
    Property Active:Boolean Read FOpen Write SetStartDocument;
    Property ScriptTag:String Read FScriptTag WRite FScriptTag;
    Property FileName:String Read FFileName Write SetFileName;
    Property ClearLfCr:boolean Read FClearLfCr Write SetClearLfCr;
    Property TagAttributes:String Read FTagAttributes;
    Property OnStartTag:TOnStartTag Read FOnTagProc Write SetOnTagProc;
    Property OnStrToDate:TOnStrToDate Read GetStrToDate Write SetStrToDate;
    Property OnScript:TOnScriptTag Read FOnScriptTag Write FOnScriptTag;
    ProPerty OnProcInstr:TOnProcInst Read FOnProcInstr Write FOnProcInstr;
    Property MachCase:Boolean Read FMachCase Write FMachCase;
    Property StdDateFomat:Boolean Read FStdDateFomat Write FStdDateFomat;
    Property Elements :String Read FElements;
    Procedure StartDocument;
    Procedure ExcuteScripts;
    Procedure Close;
    Procedure First;
    Procedure Next;
    Procedure Prior;
    property TheStream : TStream Read FStream ; 
  end;


procedure Register;

implementation

uses janStrings;

{$R tcashComp.dcr}

procedure Register;
begin
  RegisterComponents('Zion Extra', [TSylSax]);
end;

Function CheckLastChar(Const Value:String;aChar:Char):boolean;
begin
  Result := False;
  if Value='' then exit;
  Result := Value[Length(Value)]=aChar;
end;

{Values Converter Class }


Function TSylTagValues.ToString;
begin
  if VarisNull(Fvalue) then
    result :=''
  else
    Result :=  HtmlDecode(VarToStr(Fvalue));
End;


Function TSylTagValues.ToDate;
Var
  S:String;
begin
  Result :=0;
  S:=VarToStr(Value);
  if (s='') OR VarIsNull(s) Or (Length(s)<8) then exit;
  if Assigned(FOnStrToDate) then
  begin
    FOnStrToDate(Self,s);
    Try
      Result := StrToDate(s);
    except End;
  end
  else
  Try
    if FUseSdtDate then
    begin
      Try
        Result := StrToDate(s)
      except
        Result := Now;
      end;
    end
    else

      {This is the Way I want to read the Date from Xml String value So I Made it
       My Default if the OnStrDate Event is Nil }
      if (s[6] in ['/','-',' ']) then
        Result := EncodeDate(StrToInt(Copy(s,7,4)),StrToInt(Copy(s,4,2)),StrToInt(Copy(s,1,2)))
      else
        Result := EncodeDate(StrToInt(Copy(s,1,4)),StrToInt(Copy(s,5,2)),StrToInt(Copy(s,7,2)));
  Except end;
End;

Function TSylTagValues.ToFloat:Extended;
begin
  Result:=0;
  if (Fvalue='') OR VarIsNull(FValue) then exit;
  Result:= StrToFloatDef(FValue,0);
end;

Function TSylTagValues.ToInt:Integer;
begin
  Result:=0;
  if (Fvalue='') OR VarIsNull(FValue) then exit;
  Result:= StrToIntDef(Fvalue,0);
end;


Function TSylTagValues.ToDateTime:TDateTime;
begin
  Result := encodeDate(2000,1,1)+EncodeTime(0,0,0,0);
  Try
    if VarIsNull(FValue) then
    begin
      exit;
    end;
    if FUseSdtDate then
    begin
      Try
        Result := StrToDate(FValue)
      except
        Result := Now;
      end;
    end
    else
      {This is the Way I want to read the DateTime from Txf String value So I Made it
       My Default if the OnStrDatetime Event is Nil }
       Try
          if Length(FValue)>=8 then
          Result := EncodeDate(StrToInt(Copy(FValue,1,4)),StrToInt(Copy(FValue,5,2)),StrToInt(Copy(FValue,7,2)));
        if Length(FValue)>=15 then
        Result := Result + EncodeTime(StrToInt(Copy(FValue,10,2)),StrToInt(Copy(FValue,12,2)),StrToInt(Copy(FValue,14,2)),0);
      except
      end;
  Except end;
end;




Constructor TSylSax.Create(AOwner: TComponent);
begin
  Inherited;
  FOpen:=False;
  FClearLfCr:=True;
  FEOTags:=False;
  FTagAttributes:='';
  FTmp:=TSylTagValues.Create(Self);
  FMachCase:=True;
  FStdDateFomat := False;
end;

Destructor  TSylSax.Destroy;
begin
  if Active then SetClose;
  inherited;
end;

Procedure TSylSax.SetClose;
begin
  try
    FOpen:=False;  
    FStream.Free;
  Finally end;
end;

Procedure TSylSax.StartDocument;
begin
  SetStartDocument(True);
  FXmlContent:='';
end;

Procedure TSylSax.Close;
begin
  SetClose;
end;

Procedure TSylSax.First;
begin
  FStream.Position:=0;
  FEOTags := False;
end;

Function TSylSax.SetBookMark:TSylXmlBookMark;
begin
  {I am providing the way to go away and came back at the same place}
  Result.Position:=FStream.Position;
  Result.FTagName:=FTagName;
  Result.FTagAttributes:=FTagAttributes;
  Result.FContents:=FContents;
end;

Procedure TSylSax.GotBookMark(aBookMark:TSylXmlBookMark);
begin
  FStream.Position := aBookMark.Position;
  FTagName := aBookMark.FTagName;
  FTagAttributes := aBookMark.FTagAttributes;
  FContents := aBookMark.FContents;
end;

Procedure TSylSax.CleanNow(Var S:String);
  Function FirstChar:Char;
  begin
    Result:=' ';
      if S='' then exit;
    Result:=S[1];
  end;
  Function LastChar:Char;
  begin
    Result:=' ';
      if S='' then exit;
    Result:=S[Length(s)];
  end;

begin
  While FirstChar in [#10,#13] do Delete(S,1,1);
  While LastChar in [#10,#13] do Delete(S,Length(s),1);
end;

Procedure TSylSax.ClearLfCrNow;
begin
  if Not FClearLfCr then exit;
    CleanNow(FContents);
end;

Procedure TSylSax.SetClearLfCr;
begin
  if FClearLfCr=Value then Exit;
  FClearLfCr:=Value;
  ClearLfCrNow;
end;


Procedure TSylSax.Next;
begin
 if Not FOpen Then exit;
 LoadNextTag;
end;

Procedure TSylSax.SetStartDocument;
begin
  if Value=FOpen then exit;
  if Value then
  begin
//    if FOpen or (FFileName='') Then exit;
      if FOpen then Exit;
      if FFileName='' then
        FStream:=TStringStream.Create('')
      else
        FStream:=TFileStream.Create(FFileName,fmShareDenyNone);
      FOpen:=True;
    Navigate;
    LoadNextTag;
  end
  else
    SetClose;
end;

Function TSylSax.Navigate;
Var
  Count:LongInt;
begin
  Result:='';
  if Not FOpen Then exit;
  Repeat
    Count:=FStream.Read(FBuffer,1);
    if (Count=1) AND (FBuffer<>'<') then
      Result:=Result+FBuffer;
    FEOTags:=Count=0;
  Until (FBuffer='<') or EOTags;
  if FBuffer='<' then
    FStream.Seek(-1,soFromCurrent);
end;

Function TSylSax.ScanForchar(const aChar:char;Const aSource:String):integer;
Var
  iCount:Integer;
  {Internal Function}
begin
  {I dont want to think a lot on How to speed this
  because I m using it on Attributes following the tag
  this can not go beyond 300 Char. I'll see }
  Result:=0;
  if Not FOpen Then exit;  
  for iCount:=1 To Length(aSource)  do
    If aSource[iCount]=aChar then Inc(result);
end;

Function TSylSax.CountAttributes:Integer;
begin
  Result := ScanForchar('=',FTagAttributes);
end;


Function TSylSax.NameExists(Const Name:String):Boolean;
Var
  iPos:integer;
  Nm:String;
begin
  Nm:=Name;
  if Nm='' then Nm:=FTagName;
  if Not FMachCase then
    Nm := LowerCase(Nm);
  iPos:=Pos(' '+Nm+'="',' '+FElements);
  Result := iPos>0;
end;

Function  TSylSax.GetValue(Const Name:String):TSylTagValues;
Var
  iPos:integer;
  Nm,
  tmp:String;

begin
  Result := FTmp;
  Nm:=Name;
  Result.FValue:=null;
  if Nm='' then Nm:=FTagName;
  if Not FMachCase then
  begin
    Nm := LowerCase(Nm);
    iPos:=Pos(' '+Nm+'="',' '+LowerCase(FElements));
  end
  else
    iPos:=Pos(' '+Nm+'="',' '+FElements);
  if iPos>0 then
  begin
    tmp:=FElements;
    Delete(tmp,1,ipos+Length(Nm+'="')-1);
    iPos:=Pos('"',tmp);
    if iPos>0 then
      tmp:=Copy(tmp,1,iPos-1);
    Result.FValue:=tmp;
  end;
  Result.FUseSdtDate:=Self.FStdDateFomat;
end;

Function TSylSax.GetNames(Const Index:Integer):String;
begin
  Result :='';
  if Pos('=',FTagAttributes)=0 then exit;
  if Not FMachCase then
    Result := LowerCase(Result);
end;

procedure TSylSax.DoRead;
Var
  Count:Integer;
begin
  Count:=FStream.Read(FBuffer,1);
  FEOTags:=Count=0;
end;

Function TSylSax.ExtractXML(ATag:String):String;
Var
  Inok:Boolean;
  tmpTag:String;
begin
  Result := '';
  Inok := False;
  Repeat
    DoRead;
    if FBuffer='<' then
      tmpTag := FBuffer
    else
      tmptag := tmptag + FBuffer;
    if InOk then
      Result := Result + FBuffer
    else if (Pos('<'+ Lowercase(ATag) + ' ', Lowercase(tmpTag))=1)  or  SameText(tmpTag,'<'+ATag+'>') then
    begin
      Inok:=true;
      Result := tmptag;
    end;
  Until FEOTags or SameText(tmpTag,'</'+ATag+'>');
end;

Function TSylSax.Navigate2;
Var
  Count:LongInt;
begin
  Result:='';
  FTagAttributes:='';
  Repeat
    Count:=FStream.Read(FBuffer,1);
    if (Count=1) AND (FBuffer<>'>') then
      Result:=Result+FBuffer;
    FEOTags:=Count=0;
  Until (FBuffer='>') or FEOTags;
  if Result<>'' then
    if Result[Length(Result)]='?' then
      Delete(Result,Length(Result),1);
  if Not FEOTags And (Pos('=',Result)<>0) then
  begin
      FTagAttributes:=Result;
      Count:=Pos(' ',FTagAttributes);
      Result:=Copy(Result,1,Count-1);
      Delete(FTagAttributes,1,Count);
  end;
  if Not FMachCase then
    Result := LowerCase(Result);
end;

Function TSylSax.SeekLoad(Const ArrayTagNames:Array of String; Var ArrayContents:Array Of String):Boolean;
begin
  REsult :=True;




end;

Procedure TSylSax.ScanNow;
Var
  aTag:String;
  xTagAttributes : String;
begin
  if Not FOpen Then exit;
  aTag:= '/'+FTagName;
  FElements:='';
  {I dont need to check the ActiveTage Value, This will stop any way}
  LoadNextTag;
  While not FEOTags AND (FTagName<>aTag) do begin
    if (FContents='') AND (Trim(FTagAttributes)<>'') then
      xTagAttributes:=xTagAttributes+' '+Trim(FTagAttributes);
    if FContents<>'' then
      xTagAttributes:=xTagAttributes+' '+FTagName+'="'+Trim(FContents)+'"';
    LoadNextTag;
  end;
  FElements :=xTagAttributes
end;

Procedure TSylSax.Prior;
begin
  {Provision for This Method}

end;

Function TSylSax.GotoNextTag:Boolean;
{The return Value is True in It's the ending Tag}
begin
  Result:=False;
  {This should stop before next '<' Char so the next read will start from there}
  FTagName:='';
  FContents:='';
  FElements:='';
  FStream.Read(FBuffer,1);
  if FBuffer<>'<' then
  begin
    Navigate;{Seek '<' in the STream}
    FStream.Read(FBuffer,1);
  end;
  if FBuffer='<' then
  begin
    FTagName:= Navigate2;{Seek '>' in the Stream}
    {Check Empty Tag}
    Result:=False;
    if FTagName<>'' then
    begin
      if CheckLastChar(FTagAttributes,'/') then
      begin
         Result:=True;
         Delete(FTagAttributes,Length(FTagAttributes),1);
      end
      else if CheckLastChar(FTagName,'/') then
      begin
         Result:=True;
         Delete(FTagName,Length(FTagName),1);
      end;
    end;
  End;
  FTagName := Trim(FTagName);
end;

Procedure TSylSax.LoadNextTag;
Var
  Scan,
  BStart:Boolean;
  BPis:Boolean;
begin
  BPis:=False;
  BStart:=GotoNextTag;
  Scan:=False;
  if Pos('?',FTagName)=1 then
  begin
    BPis:=True;
    System.Delete(FTagName,1,1);
    if Pos(ScriptTag,FTagName)=1 then
    begin
      System.Delete(FTagName,1,Length(ScriptTag));
      FContents := FTagName;
      FTagName :=Trim(ScriptTag);
      if Assigned(FOnScriptTag) then
        FOnScriptTag(Self,FTagName,FContents,FTagAttributes)
    end
    else
    {Call On Pi Event}
    if Assigned(FOnProcInstr) then
      FOnProcInstr(Self,FTagName,FContents,FTagAttributes,Scan);
  end
  else if BStart then

  else
    {Fire EndElement Now};

  FContents:=Navigate;{Seek '<' in the Stream}
  ClearLfCrNow;
  if (FElements='') AND (FTagAttributes<>'') then
    FContents :=' '+FTagAttributes;
  FElements:=FTagName+'="'+FContents+'"';
  Scan:=False;
  if Not BPis And Assigned(FOnTagProc) then
    FOnTagProc(Self,FTagName,FContents,FTagAttributes,Scan);
  if Scan then ScanNow;
end;

Procedure TSylSax.SetStrToDate(Const Value:TOnStrToDate);
begin
   Ftmp.FOnStrToDate:=Value;
end;

Function TSylSax.GetStrToDate:TOnStrToDate;
begin
   Result := Ftmp.FOnStrToDate;
end;

Procedure TSylSax.SetOnTagProc(Const Value:TOnStartTag);
begin
//  if FOnTagProc<> Value then
   FOnTagProc:=Value;
end;

Procedure TSylSax.SetFileName(aFileName:String);
begin
  if Not Active then
  begin
    FFileName:=aFileName;
  end;
end;

Procedure TSylSax.CopyFrom(AString:String);
begin
  If Not FOpen then StartDocument;
//  if FStream is TStringStream then
  FStream.Position:=0;
  TStringStream(FStream).WriteString(aString);
  First;
  Navigate;
  LoadNextTag;

end;

Function  TSylSax.ContentText:string;
begin
//  if FStream is TStringStream then
    Result:=TStringStream(FStream).DataString
end;

Function TSylSax.SeekTag(atagName:string):Boolean;
begin
  First;
  Navigate;
  Repeat
    GotoNextTag;
    Result := aTagName=TagName;
  Until Result Or FEOTags;
end;

Function TSylSax.FindAndLoadTag(aTagName:String):String;
begin
  Result :='';
  if SeekTag(aTagName) then
  begin
    ScanNow;
    Result := FElements;
  end;

end;

Procedure TSylSax.ReadFromStream(aStream:TStream);
begin
  FStream.CopyFrom(aStream,0);
  FStream.Position:=0;
  FOpen:=True;
  Navigate;
  LoadNextTag;
end;

Procedure TSylSax.ExcuteScripts;
begin
  First;
  while Not EOTags do
  begin

    Next;
  end;
end;

end.
