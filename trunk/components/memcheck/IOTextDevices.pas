unit IOTextDevices;

(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is IOTextDevices
 *
 * The Initial Developer of the Original Code is Vadim V.Lopushansky
 * Ukraine, Kiyv. pult@ukr.net
 *
 * Portions created by the Initial Developer are Copyright (C) 2009
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 * ...
 *
 *  ###########################
 *  ### Version: 2009.05.28 ###
 *  ###########################
 *
 * ***** END LICENSE BLOCK ***** *)

//
// Adjusting the conclusion for procedure Write into TextFile
//

//
// Contacts:
// http://code.google.com/p/delphi-memcheck/
//   http://code.google.com/p/delphi-memcheck/downloads/list
//
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$B-,I+,R-,A+,H+,J+}
{$IFDEF DEBUG}
  {$O-,D+,L+}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$UNDEF D3_UP}  // Delphi 3
{$UNDEF D4_UP}  // Delphi 4
{$UNDEF D5_UP}  // Delphi 5
{$UNDEF D6_UP}  // Delphi 6
{$UNDEF D7_UP}  // Delphi 7
{$UNDEF D8_UP}  // Delphi 8
{$UNDEF D9_UP}  // BDS 2005
{$UNDEF D10_UP} // BDS 2006
{$UNDEF D11_UP} // RAD Studio 2007
{$UNDEF D12_UP} // RAD Studio 2009
{$UNDEF D13_UP} // RAD Studio 2010
{$UNDEF D14_UP} // RAD Studio 2011
{$UNDEF _INLINE_}
{$UNDEF _UNICODE_}
// ---
{$IFNDEF LINUX}
  {$IFNDEF CLR}
    {$DEFINE MSWINDOWS}
  {$ENDIF}
{$ENDIF}
// ---
{$IFNDEF VER80}
  {$IFNDEF VER90}
    {$IFNDEF VER93}
      {$DEFINE D3_UP} { Delphi 3.0 or higher }
      {$IFNDEF VER110}
        {$DEFINE D4_UP} { Delphi 4.0 or higher }
        {$IFNDEF VER120}
          {$DEFINE D5_UP}
          {$IFNDEF VER130}
            {$DEFINE D6_UP}   { Delphi 6.0 or higher }
            {$IFNDEF VER140}
              {$DEFINE D7_UP}   { Delphi 7.0 or higher }
              {$IFNDEF VER150}
                {$DEFINE D9_UP}   { BDS 2005 (9) or higher }
                {$IFNDEF VER170}
                  {$DEFINE D10_UP}   { BDS 2006 (10) or higher }
                  {$IFDEF VER185}
                    {$DEFINE D11_UP}   { RAD Studio 2007 (11) or higher }
                  {$ELSE}
                    {$IFNDEF VER180}
                       {$DEFINE D12_UP}   { RAD Studio 2009 (12) or higher }
                       {$IFNDEF VER200}
                          {$DEFINE D13_UP}   { RAD Studio 2010 (13) or higher }
                          {$IFNDEF VER210}
                            {$DEFINE D14_UP}   { RAD Studio 2011 (14) or higher }
                          {$ENDIF}
                       {$ENDIF}
                    {$ENDIF}
                  {$ENDIF}
                {$ENDIF}
              {$ENDIF}
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFNDEF D5_UP}
  //ERROR: UNSUPPORTED COMPILER VERSION
{$ENDIF}
{$IFDEF D14_UP}
  //{$MESSAGE FATAL 'UNSUPPORTED COMPILER VERSION!'}
  //ERROR: UNSUPPORTED COMPILER VERSION
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
// ---
{$IFDEF D9_UP}
  {$DEFINE _INLINE_} { Optional }
{$ENDIF}
// ---
{$IFDEF D12_UP}
  {$IFDEF UNICODE}
    {$DEFINE _UNICODE_}
  {$ENDIF}
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$IFDEF D6_UP}
  {$WARN SYMBOL_PLATFORM OFF}    // Suppress .Net warnings
  {$WARN SYMBOL_DEPRECATED OFF}
  {$WARN UNIT_PLATFORM OFF}      // NOT certified for Kylix
  {$WARN UNIT_DEPRECATED OFF}    // NOT certified for Kylix
  {$WRITEABLECONST ON}
{$ENDIF}
// ---
{$IFDEF D7_UP}
  {$WARN UNSAFE_CAST OFF} // Suppress .Net warnings
  {$WARN UNSAFE_TYPE OFF} // Suppress .Net warnings
  {$WARN UNSAFE_CODE OFF} // Suppress .Net warnings
{$ENDIF}
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$UNDEF IO_TEXT_UNICODE}
(*
  { detect unicode of "System.pas:TTextBuf" }
{$IFDEF D13_UP}
  {$IFDEF UNICODE}
    {$DEFINE IO_TEXT_UNICODE}
  {$ENDIF}
{$ENDIF}
//*)
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

interface

uses
  Classes, SysUtils;

type
  IOTextDevice = Text;
  PIOTextDevice = ^IOTextDevice;
  EIOTextDevice = class(EInOutError)
  public
    constructor Create(AError: Integer); overload;
  end;

  {$IFDEF IO_TEXT_UNICODE}
  TTextBufChar = WideChar;
  TTextBufString = WideString;
  {$ELSE}
  TTextBufChar = AnsiChar;
  TTextBufString = AnsiString;
  {$ENDIF}
  PTextBufChar = ^TTextBufChar;
  PTextBufString = ^TTextBufString;

  PTextRec = ^TTextRec;

  {$IFNDEF D6_UP}
  PPointer = ^Pointer;
  {$ENDIF}

  TIOTextDeviceCustom = class;
  TIOTextDeviceClass = class of TIOTextDeviceCustom;

  TUserDataClass = packed record
    IODeviceClass: TIOTextDeviceClass;
    Mode: Word;
    IOResultIgnore: Boolean;
    Pos: Int64;
    UserPtr: Pointer;
    Locked: Boolean;
  end;

  TUserDataCustom = packed record
    C: TUserDataClass;
  end;
  PUserDataCustom = ^TUserDataCustom;
  PPUserDataCustom = ^PUserDataCustom;

  TIOTextDeviceCustom = class
  protected
    class function IsIODeviceClass(var t: TTextRec): Boolean; overload;
    class function IsIODeviceClass(var t: TTextRec; out Error: Integer): Boolean; overload;
    class function GetUserDataPtr(var t: TTextRec): PUserDataCustom; overload;
    class function GetUserDataPtr(var AText: Text): PUserDataCustom; overload;
    // User Data Struct
    class function UserDataAllocate: Pointer; virtual;
    class procedure UserDataRelease(P: Pointer); virtual;
    class function GetUserDataSize: Integer; virtual;
    //
    class function TextOpen(var t: TTextRec): Integer; virtual;
    class function TextClose(var t: TTextRec): Integer; virtual;
    //
    class function TextOut(var t: TTextRec): Integer; virtual;
    class function IsInternalCache(var t: TTextRec): Boolean; virtual;
    class function FlushInternal(var t: TTextRec): Integer; virtual;
    class function TextFlush(var t: TTextRec): Integer; virtual;
    class function TextIn(var t: TTextRec): Integer; virtual;
    //
    class procedure DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer); virtual;
    //
    class procedure Lock(var AText: Text);
    class procedure UnLock(var AText: Text);
    //
    class function GetIOResultIgnore(var t: TTextRec; IOResultIgnore: Boolean = False): Boolean; overload;
    class function GetIOResultIgnore(var AText: Text; IOResultIgnore: Boolean = False): Boolean; overload;
    //
    class function IsUnFlushedData(var t: TTextRec): Boolean; overload;
    class function DoFlushImmediate(var t: TTextRec; IOResultIgnore: Boolean = False): Integer; virtual;
  public
    class procedure Assign(var AText: Text);
    //
    class procedure SetIOResultIgnore(var AText: Text; IOResultIgnore: Boolean);
    //
    class function IsUnFlushedData(var AText: Text): Boolean; overload;
    class function FlushImmediate(var AText: Text; IOResultIgnore: Boolean = False): Integer;
  end;

  TIOTextDeviceNull = class(TIOTextDeviceCustom)
  protected
    class function TextOut(var t: TTextRec): Integer; override;
  end;

  TIOTextDeviceStream = class(TIOTextDeviceCustom)
  protected
    class function TextOpen(var t: TTextRec): Integer; override;
    class function TextIn(var t: TTextRec): Integer; override;
    //
    class procedure DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer); override;
  public
    class procedure Assign(var AText: Text; Stream: TStream);
    //
    class function GetText(const AText: Text; IOResultIgnore: Boolean = False): string;
  end;

  TUserDataString = packed record
    // inherited class
    C: TUserDataClass;
    // this class
    P: PString;
    InternalString: string;
    //
    Flushed: Boolean;
    FlushImmediate: Boolean; // When device allow access to last line. Required implement FlushInternal_Append.
    FlushedCL: Boolean; // separately flushed #10 and #13: write(#10); write(#13);
    //
  end;
  PUserDataString = ^TUserDataString;

  TIOTextDeviceString = class(TIOTextDeviceCustom)
  protected
    // User Data Struct
    class function UserDataAllocate: Pointer; override;
    class procedure UserDataRelease(P: Pointer); override;
    class function GetUserDataSize: Integer; override;
    //
    class function GetTextPtr(var t: TTextRec): PString;
    class function TextOpen(var t: TTextRec): Integer; override;
    class function TextIn(var t: TTextRec): Integer; override;
    //
    class procedure DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer); override;
  public
    class procedure Assign(var AText: Text); overload;
    class procedure Assign(var AText: Text; var S: string); overload;
    //
    class function GetText(const AText: Text): string; virtual;
  end;

  TIOTextDeviceStringInternalCustom = class(TIOTextDeviceString)
  protected
    class function IsInternalCache(var t: TTextRec): Boolean; override;
    class function FlushInternal(var t: TTextRec): Integer; override;
    class function FlushInternal_NewLine(var t: TTextRec; const S: string): Integer; virtual;
    class function FlushInternal_Append(var t: TTextRec; const S: string): Integer; virtual;
    class function DoFlushImmediate(var t: TTextRec; IOResultIgnore: Boolean = False): Integer; override;
  public
    class function GetText(const AText: Text): string; override;
  end;

  TIOTextDeviceStrings = class(TIOTextDeviceStringInternalCustom)
  protected
    class function TextOpen(var t: TTextRec): Integer; override;
    class function FlushInternal_NewLine(var t: TTextRec; const S: string): Integer; override;
    class function FlushInternal_Append(var t: TTextRec; const S: string): Integer; override;
  public
    class procedure Assign(var AText: Text; Strings: TStrings; FlushImmediate: Boolean = True);
    //
    class function GetText(const AText: Text): string; override;
  end;

  TIOTextDeviceDebug = class(TIOTextDeviceStringInternalCustom)
  protected
    class function FlushInternal_NewLine(var t: TTextRec; const S: string): Integer; override;
  public
    class procedure Assign(var AText: Text);
  end;

procedure IOAssignNull(var D: IOTextDevice);
procedure IOAssignDebug(var D: IOTextDevice);
procedure IOAssignText(var D: IOTextDevice); overload;
procedure IOAssignText(var D: IOTextDevice; var S: string); overload;
procedure IOAssignStream(var D: IOTextDevice; Stream: TStream);
procedure IOAssignStrings(var D: IOTextDevice; Strings: TStrings; FlushImmediate: Boolean = True);

function IOAssigned(var D: IOTextDevice): Boolean; {$ifdef _inline_} inline; {$endif}
function IOClosed(var D: IOTextDevice): Boolean; {$ifdef _inline_} inline; {$endif}
function IOClose(var D: IOTextDevice; IOResultIgnore: Boolean = True): Integer;
procedure IOClear(var D: IOTextDevice); {$ifdef _inline_} inline; {$endif}

function IOErrorClear: Integer; {$ifdef _inline_} inline; {$endif}
function IOErrorCheck(IOResultIgnore: Boolean = False; Caller: Pointer = nil): Integer; overload; {$ifdef _inline_} inline; {$endif}
function IOErrorCheck(Error: Integer; IOResultIgnore: Boolean = False; Caller: Pointer = nil): Integer; overload;

var
  IONullDevice, OutputDebugDevice: IOTextDevice;

{$IFNDEF D6_UP}
const
  sLineBreak = {$IFDEF LINUX} #10 {$ENDIF} {$IFDEF MSWINDOWS} #13#10 {$ENDIF};
{$ENDIF}
{$IFNDEF D7_UP}
function PosEx(const SubStr, S: string; Offset: Integer = 1): Integer;
{$ENDIF}

// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
{$DEFINE ALLOW_FLUSH_ANY}
{$IFDEF D9_UP}
  {$IFNDEF D12_UP}
  // BDS 2005, 2006; RAD Studio 2007
  {$UNDEF ALLOW_FLUSH_ANY} // Flushed only after call WriteLn
  {$ENDIF}
{$ENDIF}
const
  ALLOW_FLUSH_ANY = {$IFDEF ALLOW_FLUSH_ANY}True{$ELSE}False{$ENDIF};
  IO_ERROR = 103;
// ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

procedure OutputDebugString(const S: string); {$ifdef _inline_}inline;{$endif}

implementation

uses
  {$IFDEF CONDITIONALEXPRESSIONS} // Delphi 6 Up
  StrUtils,      // PosEx
    {$IFDEF _UNICODE_}            // RAD Studio 2009 Up
      {$IFNDEF IO_TEXT_UNICODE}
  AnsiStrings,   // Ansi: PosEx
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  Windows;

{ EIOTextDevice }

constructor EIOTextDevice.Create(AError: Integer);
begin
  inherited Create('I/O error ' + IntToStr(AError));
  ErrorCode := AError;
end;

function IOErrorClear: Integer;
begin
  {$I-}
  Result := IOResult; //Clears the internal IO error flag
  {$I+}
end;

//var
//  SystemIOTest: Pointer;

function IOErrorCheck(Error: Integer; IOResultIgnore: Boolean = False; Caller: Pointer = nil): Integer; overload;
begin
  if not IOResultIgnore then
    Result := Error
  else
    Result := 0;
  if Result <> 0 then
  begin
    //SetInOutRes(Result);
    //asm
    //  call SystemIOTest
    //end;
    if Caller = nil then
    asm
      mov eax, [ebp+8]
      mov Caller, eax
    end;
    raise EIOTextDevice.Create(Error) at Caller;
  end;
end;

function IOErrorCheck(IOResultIgnore: Boolean = False; Caller: Pointer = nil): Integer;
begin
  Result := IOErrorCheck(IOErrorClear, IOResultIgnore, Caller);
end;

function IOAssigned(var D: IOTextDevice): Boolean;
begin
  with TTextRec(D) do
    Result := (Mode = fmClosed) or (Mode = fmInput) or (Mode = fmOutput) or (Mode = fmInOut);
end;

function IOClosed(var D: IOTextDevice): Boolean;
begin
  with TTextRec(D) do
    Result := not ((Mode = fmInput) or (Mode = fmOutput) or (Mode = fmInOut));
end;

function IOClose(var D: IOTextDevice; IOResultIgnore: Boolean): Integer;
begin
  Result := 0;
  IOErrorClear;
  with TTextRec(D) do
  begin
    if not ((Mode = fmInput) or (Mode = fmOutput) or (Mode = fmInOut)) then
      Exit;
  end;
  try
  {$I-}
  System.Close(D);
  {$I+}
  except
    Result := IOErrorClear;
    if Result = 0 then
      Result := IO_ERROR;
    SetInOutRes(Result);
  end;
  Result := IOErrorCheck(TIOTextDeviceCustom.GetIOResultIgnore(D, IOResultIgnore));
  //if Result = 0 then
  //  IOClear(D);
end;

procedure IOClear(var D: IOTextDevice);
begin
  FillChar(D, SizeOf(TTextRec), 0);
  TTextRec(D).Mode := fmClosed;
end;

(*
procedure StubIOTest;
begin
  {$I+}
  Close(PIOTextDevice(nil)^);
end;

function IsValidBlockAddr(Addr: Pointer; Size: Longint): Boolean;
begin
  Result := (FindHInstance(Pointer(Addr)) <> 0) and
    (not Windows.IsBadReadPtr(Pointer(Addr), Size));
end;

function GetStubAddress(AStub: Pointer; OffsetE8: Integer = 0): Pointer;
begin
  Result := nil;
  if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
    Exit;
  if OffsetE8 > 0 then
  begin
    Inc(Integer(AStub), OffsetE8);
    if not IsValidBlockAddr(AStub, SizeOf(Pointer)) then
      Exit;
  end;
  if PByte(AStub)^ = $E8 then
  begin
    Inc(Integer(AStub));
    Result := Pointer(Integer(AStub) + SizeOf(Pointer) + PInteger(AStub)^);
  end;
end;
//*)

{$IFNDEF D7_UP}
(* ***** BEGIN LICENSE BLOCK *****
 *
 * The function PosEx is licensed under the CodeGear license terms.
 *
 * The initial developer of the original code is Fastcode
 *
 * Portions created by the initial developer are Copyright (C) 2002-2004
 * the initial developer. All Rights Reserved.
 *
 * Contributor(s): Aleksandr Sharahov
 *
 * ***** END LICENSE BLOCK ***** *)
function PosEx(const SubStr, S: string; Offset: Integer = 1): Integer;
asm
       test  eax, eax
       jz    @Nil
       test  edx, edx
       jz    @Nil
       dec   ecx
       jl    @Nil

       push  esi
       push  ebx

       mov   esi, [edx-4]  //Length(Str)
       mov   ebx, [eax-4]  //Length(Substr)
       sub   esi, ecx      //effective length of Str
       add   edx, ecx      //addr of the first char at starting position
       cmp   esi, ebx
       jl    @Past         //jump if EffectiveLength(Str)<Length(Substr)
       test  ebx, ebx
       jle   @Past         //jump if Length(Substr)<=0

       add   esp, -12
       add   ebx, -1       //Length(Substr)-1
       add   esi, edx      //addr of the terminator
       add   edx, ebx      //addr of the last char at starting position
       mov   [esp+8], esi  //save addr of the terminator
       add   eax, ebx      //addr of the last char of Substr
       sub   ecx, edx      //-@Str[Length(Substr)]
       neg   ebx           //-(Length(Substr)-1)
       mov   [esp+4], ecx  //save -@Str[Length(Substr)]
       mov   [esp], ebx    //save -(Length(Substr)-1)
       movzx ecx, byte ptr [eax] //the last char of Substr

@Loop:
       cmp   cl, [edx]
       jz    @Test0
@AfterTest0:
       cmp   cl, [edx+1]
       jz    @TestT
@AfterTestT:
       add   edx, 4
       cmp   edx, [esp+8]
       jb   @Continue
@EndLoop:
       add   edx, -2
       cmp   edx, [esp+8]
       jb    @Loop
@Exit:
       add   esp, 12
@Past:
       pop   ebx
       pop   esi
@Nil:
       xor   eax, eax
       ret
@Continue:
       cmp   cl, [edx-2]
       jz    @Test2
       cmp   cl, [edx-1]
       jnz   @Loop
@Test1:
       add   edx,  1
@Test2:
       add   edx, -2
@Test0:
       add   edx, -1
@TestT:
       mov   esi, [esp]
       test  esi, esi
       jz    @Found
@String:
       movzx ebx, word ptr [esi+eax]
       cmp   bx, word ptr [esi+edx+1]
       jnz   @AfterTestT
       cmp   esi, -2
       jge   @Found
       movzx ebx, word ptr [esi+eax+2]
       cmp   bx, word ptr [esi+edx+3]
       jnz   @AfterTestT
       add   esi, 4
       jl    @String
@Found:
       mov   eax, [esp+4]
       add   edx, 2

       cmp   edx, [esp+8]
       ja    @Exit

       add   esp, 12
       add   eax, edx
       pop   ebx
       pop   esi
end;
{$ENDIF}

procedure OutputDebugString(const S: string);
{$IFDEF LINUX}
var
  sTI: string;
  tID: WORD;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  Windows.OutputDebugString(PChar(S));
  {$ENDIF}
  {$IFDEF LINUX}
  tID := GetCurrentThreadID;
  if tID = MainThreadID then
    sTI := ':(    0) '
  else
    sTI := ':(' + Format('%5d',[tID])+') ';
  __write(stderr, sTI, Length(sTI));
  __write(stderr, S,   Length(S)  );
  __write(stderr, EOL, Length(EOL));
  {$ENDIF}
end;

{ TIOTextDeviceCustom }

function TIOTextDeviceCustom_TextOpen(var t: TTextRec): Integer;
var
  P: PUserDataCustom;
begin
  Result := IO_ERROR;
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if TIOTextDeviceCustom.IsIODeviceClass(t, Result) then
  begin
    P := TIOTextDeviceCustom.GetUserDataPtr(t); // Debug: P^,R
    if (P <> nil) then
    begin
      if (not P.C.Locked) then
        Result := P.C.IODeviceClass.TextOpen(t)
      else
        Result := 0;
    end
    else
      Result := IO_ERROR;
  end;
end;

function TIOTextDeviceCustom_TextClose(var t: TTextRec): Integer;
var
  P: PUserDataCustom;
  Mode: Word;
  R: Integer;
begin
  Result := IO_ERROR;
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if TIOTextDeviceCustom.IsIODeviceClass(t, Result) then
  begin
    P := TIOTextDeviceCustom.GetUserDataPtr(t); // Debug: P^,R
    if P <> nil then
    begin
      Mode := P.C.Mode;
      try
        // System.Flush:
        if t.BufPos > 0 then
          R := TIOTextDeviceCustom.GetUserDataPtr(t).C.IODeviceClass.TextFlush(t)
        else
          R := 0;
        if (R = 0) and (not P.C.Locked) then
        begin
          // Flush Internal Buffer:
          P.C.Mode := fmClosed;
          if ALLOW_FLUSH_ANY and P.C.IODeviceClass.IsInternalCache(t) then
            R := P.C.IODeviceClass.FlushInternal(t);
          // Close:
          if R = 0 then
            R := P.C.IODeviceClass.TextClose(t);
        end;
        Result := R;
      finally
        if (Result <> 0) and TIOTextDeviceCustom.IsIODeviceClass(t, R) then
          P.C.Mode := Mode;
      end;
    end;
  end;
end;

function TIOTextDeviceCustom_TextOut(var t: TTextRec): Integer;
begin
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if TIOTextDeviceCustom.IsIODeviceClass(t, Result) then
    Result := TIOTextDeviceCustom.GetUserDataPtr(t).C.IODeviceClass.TextOut(t)
  else
    Result := IO_ERROR;
end;

function TIOTextDeviceCustom_TextFlush(var t: TTextRec): Integer;
begin
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if TIOTextDeviceCustom.IsIODeviceClass(t, Result) then
  begin
    if t.BufPos > 0 then
      Result := TIOTextDeviceCustom.GetUserDataPtr(t).C.IODeviceClass.TextFlush(t)
    else
      Result := 0;
  end
  else
    Result := IO_ERROR;
end;

function TIOTextDeviceCustom_TextIn(var t: TTextRec): Integer;
begin
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if TIOTextDeviceCustom.IsIODeviceClass(t, Result) then
    Result := TIOTextDeviceCustom.GetUserDataPtr(t).C.IODeviceClass.TextIn(t)
  else
    Result := IO_ERROR;
end;

function FileNOPProc(var t): Integer;
begin
  Result := 0;
end;

class function TIOTextDeviceCustom.IsIODeviceClass(var t: TTextRec; out Error: Integer): Boolean;
begin
  // Debug: PPUserDataCustom(@t.UserData)^^,R
  if Assigned(PPUserDataCustom(@t.UserData)^) then
  begin
    if Assigned(PPUserDataCustom(@t.UserData)^^.C.IODeviceClass) then
      Error := 0
    else
      Error := 2;
  end
  else
    Error := 1;
  Result := Error = 0;
end;

class function TIOTextDeviceCustom.IsIODeviceClass(var t: TTextRec): Boolean;
var
  Error: Integer;
begin
  Result := TIOTextDeviceCustom.IsIODeviceClass(t, Error);
end;

class function TIOTextDeviceCustom.IsUnFlushedData(var t: TTextRec): Boolean;
begin
  Result := t.BufPos > 0;
  if (not Result) and TIOTextDeviceCustom.IsIODeviceClass(t) then
    Result := TIOTextDeviceCustom.GetUserDataPtr(t).C.IODeviceClass.IsInternalCache(t);
end;

class function TIOTextDeviceCustom.IsUnFlushedData(var AText: Text): Boolean;
begin
  Result := IsUnFlushedData(TTextRec(AText));
end;

class function TIOTextDeviceCustom.GetIOResultIgnore(var t: TTextRec; IOResultIgnore: Boolean): Boolean;
var
  P: PUserDataCustom;
begin
  Result := IOResultIgnore;
  if not Result then
  begin
    P := GetUserDataPtr(t);
    if P <> nil then
      Result := P.C.IOResultIgnore;
  end;
end;

class function TIOTextDeviceCustom.GetIOResultIgnore(var AText: Text; IOResultIgnore: Boolean): Boolean;
begin
  Result := GetIOResultIgnore(TTextRec(AText), IOResultIgnore);
end;

class procedure TIOTextDeviceCustom.SetIOResultIgnore(var AText: Text; IOResultIgnore: Boolean);
begin
  if IsIODeviceClass(TTextRec(AText)) then
    GetUserDataPtr(AText).C.IOResultIgnore := IOResultIgnore;
end;

class function TIOTextDeviceCustom.DoFlushImmediate(var t: TTextRec; IOResultIgnore: Boolean): Integer;
begin
  IOErrorClear;
  if ((t.Mode = fmOutput) or (t.Mode = fmInOut)) and IsUnFlushedData(t) then
  begin
    {$I-}
    WriteLn(IOTextDevice(t), '');
    {$I+}
    Result := IOErrorCheck(GetIOResultIgnore(t, IOResultIgnore));
  end
  else
    Result := 0;
end;

class function TIOTextDeviceCustom.FlushImmediate(var AText: Text; IOResultIgnore: Boolean): Integer;
begin
  if IsIODeviceClass(TTextRec(AText)) then
    Result := GetUserDataPtr(AText).C.IODeviceClass.DoFlushImmediate(TTextRec(AText), IOResultIgnore)
  else
    Result := 0;
end;

class procedure TIOTextDeviceCustom.Lock(var AText: Text);
begin
  if IsIODeviceClass(TTextRec(AText)) then
    TIOTextDeviceCustom.GetUserDataPtr(TTextRec(AText)).C.Locked := True;
end;

class procedure TIOTextDeviceCustom.UnLock(var AText: Text);
begin
  if IsIODeviceClass(TTextRec(AText)) then
    TIOTextDeviceCustom.GetUserDataPtr(TTextRec(AText)).C.Locked := False;
end;

class procedure TIOTextDeviceCustom.Assign(var AText: Text);
var
  P: PUserDataCustom;
begin
  FillChar(AText, SizeOf(TFileRec), 0);
  with TTextRec(AText) do
  begin
    // allocate user data
    P := UserDataAllocate();
    PPointer(@UserData)^ := P;
    // initialise user data
    FillChar(P^, GetUserDataSize, 0);
    P.C.IODeviceClass := Self;
    //
    BufPtr := @Buffer;
    Mode := fmClosed;
    {$IFDEF D6_UP}
    Flags := tfCRLF * Byte(DefaultTextLineBreakStyle);
    {$ENDIF}
    BufSize := SizeOf(Buffer);
    OpenFunc := @TIOTextDeviceCustom_TextOpen;
  end;
  IOErrorClear;
end;

class function TIOTextDeviceCustom.UserDataAllocate: Pointer;
begin
  GetMem(Result, GetUserDataSize);
end;

class procedure TIOTextDeviceCustom.UserDataRelease(P: Pointer);
begin
  FreeMem(P); // Debug: PUserDataString(P)^
end;

class function TIOTextDeviceCustom.GetUserDataSize: Integer;
begin
  Result := SizeOf(TUserDataCustom);
end;

class function TIOTextDeviceCustom.GetUserDataPtr(var t: TTextRec): PUserDataCustom;
begin
  Result := PPUserDataCustom(@t.UserData)^;
end;

class function TIOTextDeviceCustom.GetUserDataPtr(var AText: Text): PUserDataCustom;
begin
  Result := PPUserDataCustom(@(TTextRec(AText).UserData))^;
end;

class function TIOTextDeviceCustom.TextOpen(var t: TTextRec): Integer;
var
  P: PUserDataCustom;
begin
  Result := 0;
  t.Handle := Integer(@t);
  t.BufPos := 0;
  t.BufEnd := 0;
  t.InOutFunc := @TIOTextDeviceCustom_TextOut;
  t.FlushFunc := @FileNOPProc;
  t.CloseFunc := @TIOTextDeviceCustom_TextClose;
  P := GetUserDataPtr(t);
  if P <> nil then
  begin
    P.C.Mode := t.Mode;
    case t.Mode of
      fmOutput:  // Rewrite
        begin
          t.FlushFunc := @TIOTextDeviceCustom_TextFlush;
        end;
      fmInOut:   // Append
        begin
          t.Mode := fmOutput;
          t.FlushFunc := @TIOTextDeviceCustom_TextFlush;
        end;
      fmInput:   // Read
        begin
          t.InOutFunc := @TIOTextDeviceCustom_TextIn;
        end;
    end;
  end
  else
    Result := IO_ERROR;
end;

class function TIOTextDeviceCustom.TextClose(var t: TTextRec): Integer;
var
  P: PPointer;
begin
  t.Mode := fmClosed;
  t.Handle := 0;
  // free user data
  P := PPointer(@t.UserData); // Debug: PUserDataString(PPointer(@t.UserData)^)^
  UserDataRelease(P^);        // Debug: PUserDataString(P^)^
  P^ := nil;                  // Debug: PPointer(@t.UserData)^
  //
  Result := 0;
end;

class function TIOTextDeviceCustom.TextOut(var t: TTextRec): Integer;
var
  S: TTextBufString; // Debug: PUserDataString(@t.UserData)^,r
begin
  if t.BufPos = 0 then
  begin
    if IsInternalCache(t) then
      Result := FlushInternal(t)
    else
      Result := 0;
  end
  else
  begin
    SetLength(S, t.BufPos);
    Move(Pointer(t.BufPtr)^, Pointer(S)^, t.BufPos * SizeOf(S[1]));
    //
    DoTextOut(t, S, Result);
    //
    if Result = 0 then
      t.BufPos := 0; // clear buffer
  end;
end;

class function TIOTextDeviceCustom.TextFlush(var t: TTextRec): Integer;
begin
  Result := TextOut(t);
  if Result = 0 then
    Result := FlushInternal(t);
end;

class function TIOTextDeviceCustom.IsInternalCache(var t: TTextRec): Boolean;
begin
  Result := False;
end;

class function TIOTextDeviceCustom.FlushInternal(var t: TTextRec): Integer;
begin
  Result := 0;
end;

class function TIOTextDeviceCustom.TextIn(var t: TTextRec): Integer;
begin
  t.BufEnd := 0;
  t.BufPos := 0;
  Result := 0;
end;

class procedure TIOTextDeviceCustom.DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer);
begin
  Result := 0;
end;

{ TIOTextDeviceNull }

class function TIOTextDeviceNull.TextOut(var t: TTextRec): Integer;
begin
  t.BufPos := 0;
  Result := 0;
end;

{ TIOTextDeviceStream }

class procedure TIOTextDeviceStream.Assign(var AText: Text; Stream: TStream);

  function ReturnAddr: Pointer;
  asm
    mov eax, [ebp+8]
  end;

var
  P: PUserDataCustom;
begin
  inherited Assign(AText);
  if Stream = nil then
    raise EIOTextDevice.Create('Not defined Stream') at ReturnAddr;
  P := GetUserDataPtr(AText);
  P.C.UserPtr := Stream;
end;

class function TIOTextDeviceStream.TextOpen(var t: TTextRec): Integer;
var
  P: PUserDataCustom;
begin
  P := GetUserDataPtr(t);
  if (P = nil) or (P.C.UserPtr = nil) then
  begin // Strings == nil
    Result := IO_ERROR;
    Exit;
  end;
  Result := inherited TextOpen(t);
  if Result <> 0 then
    Exit;
  case P.C.Mode of
    fmOutput: // Rewrite
      begin
        with TStream(P.C.UserPtr) do
        begin
          Position := 0;
          Size := 0;
          P.C.Pos := Position;
        end;
      end;
    fmInOut:  // Append
      begin
        with TStream(P.C.UserPtr) do
        begin
          Position := Size;
          P.C.Pos := Position;
        end;
      end;
    fmInput:  // Read
      begin
        with TStream(P.C.UserPtr) do
        begin
          P.C.Pos := Position;
        end;
      end;
  end;
end;

class procedure TIOTextDeviceStream.DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer);
var
  P: PUserDataCustom;
  iCount, iWrite: Longint;
  iPos: Int64;
begin
  Result := 0;
  if S = '' then
    Exit;
  P := GetUserDataPtr(t);
  if (P = nil) or (P.C.UserPtr = nil) then
    Exit;
  iCount := Length(S) * SizeOf(S[1]);
  with TStream(P.C.UserPtr) do
  begin
    iPos := Position;
    try
      iWrite := Write(Pointer(S)^, iCount);
    except
      Position := iPos;
      raise;
    end;
    if iWrite <> iCount then
    begin
      // restore position
      Position := Position - iWrite;
      Result := IO_ERROR;
    end;
  end;
end;

class function TIOTextDeviceStream.TextIn(var t: TTextRec): Integer;
var
  P: PUserDataCustom;
  iLen, iCount, iRead, iPos: Int64;
begin
  t.BufEnd := 0;
  t.BufPos := 0;
  P := GetUserDataPtr(t);
  if (P = nil) or (P.C.UserPtr = nil) then
  begin // Strings == nil
    Result := IO_ERROR;
    Exit;
  end;
  Result := 0;
  with TStream(P.C.UserPtr) do
  begin
    iLen := Size;
    iPos := Position;
    if (iPos < iLen) then
    begin
      { t.BufEnd := NumberOfBytesRead := Min(t.BufSize, iLen-P.Pos) }
      t.BufEnd := iLen - iPos;
      if t.BufEnd > t.BufSize then
        t.BufEnd := t.BufSize;
      // read
      iCount := t.BufEnd * SizeOf(TTextBufChar);
      iRead := Read(Pointer(t.BufPtr)^, iCount);
      if iRead <> iCount then
        Result := IO_ERROR;
    end;
  end;
end;

class function TIOTextDeviceStream.GetText(const AText: Text; IOResultIgnore: Boolean): string;
//
// Returned text from current position and to end of the stream.
//
  function ReturnAddr: Pointer;
  asm
    mov eax, [ebp+8]
  end;

var
  t: PTextRec;
  P: PUserDataCustom;
  iStmSize, iPosSave, iStmPosBegin: Int64;
  iLen, iRead: Longint;
  stm: TStream;
  SBuff: TTextBufString;
  PBuff: Pointer;
begin
  Result := '';
  t := PTextRec(@AText);
  if not ((t.Mode = fmInput) or (t.Mode = fmOutput) or (t.Mode = fmInOut)) then
    Exit;
  P := GetUserDataPtr(t^);
  if (P = nil) or (P.C.UserPtr = nil) or (not P.C.IODeviceClass.InheritsFrom(TIOTextDeviceStream)) then
    Exit;
  stm := TStream(P.C.UserPtr);
  iStmSize := stm.Size;
  if iStmSize = 0 then
    Exit;
  iPosSave := stm.Position;
  iStmPosBegin := P.C.Pos; // From Assigned Position

  if iPosSave < iStmPosBegin then
    Exit;
  iLen := iStmSize - iStmPosBegin;
  if iLen > 0 then
  begin
    SetLength(SBuff, iLen);
    if SizeOf(TTextBufChar) > SizeOf(AnsiChar) then
      SBuff[iLen] := TTextBufChar(#0);
    stm.Position := iStmPosBegin;
    try
      iRead := stm.Read(Pointer(SBuff)^, iLen);
    finally
      stm.Position := iPosSave; // restore position
    end;
    if iRead <> iLen then
    begin
      //IOErrorCheck(IO_ERROR, GetIOResultIgnore(t^, IOResultIgnore, ReturnAddr);
      if not GetIOResultIgnore(t^, IOResultIgnore) then
        raise EIOTextDevice.Create(IO_ERROR) at ReturnAddr;
    end;
  end
  else
    SBuff := '';
  if t.BufPos > 0 then
  begin
    iLen := Length(SBuff);
    SetLength(SBuff, iLen + Integer(t.BufPos));
    if iLen > 0 then
      PBuff := @SBuff[iLen]
    else
      PBuff := Pointer(SBuff);
    Move(Pointer(t.BufPtr)^, PBuff^, t.BufPos * SizeOf(TTextBufChar));
  end;
  Result := string(SBuff);
end;

{ TIOTextDeviceString }

class function TIOTextDeviceString.UserDataAllocate: Pointer;
begin
  Result := New(PUserDataString);
end;

class procedure TIOTextDeviceString.UserDataRelease(P: Pointer);
begin
  Dispose(PUserDataString(P)); // Finallize record string
end;

class function TIOTextDeviceString.GetUserDataSize: Integer;
begin
  Result := SizeOf(TUserDataString);
end;

class procedure TIOTextDeviceString.Assign(var AText: Text);
var
  P: PUserDataString;
begin
  inherited Assign(AText);
  P := PUserDataString(GetUserDataPtr(AText)); // Debug: PUserDataString(@TTextRec(ATExt).UserData)^
  P.P := @P.InternalString;
end;

class procedure TIOTextDeviceString.Assign(var AText: Text; var S: string);
var
  P: PUserDataString;
begin
  inherited Assign(AText);
  P := PUserDataString(GetUserDataPtr(AText)); // Debug: PUserDataString(@TTextRec(ATExt).UserData)^
  P.P := @S;
end;

class function TIOTextDeviceString.GetTextPtr(var t: TTextRec): PString;
var
  P: PUserDataCustom;
begin
  P := GetUserDataPtr(t);
  if P <> nil then
    Result := PUserDataString(P).P
  else
    Result := nil;
end;

class function TIOTextDeviceString.GetText(const AText: Text): string;
var
  t: PTextRec;
  S: TTextBufString;
  P: PUserDataString;
begin
  Result := '';
  t := @TTextRec(AText);
  if IsIODeviceClass(t^) then
  begin
    P := PUserDataString(GetUserDataPtr(t^));
    if (P <> nil) and (P.P <> nil) and P.C.IODeviceClass.InheritsFrom(TIOTextDeviceString) then
      Result := P.P^;
    // append buffered data
    if t.BufPos > 0 then
    begin
      SetLength(S, t.BufPos);
      Move(Pointer(t.BufPtr)^, Pointer(S)^, t.BufPos * SizeOf(S[1]));
      Result := Result + string(S);
    end;
  end;
end;

class function TIOTextDeviceString.TextOpen(var t: TTextRec): Integer;
var
  P: PUserDataString;
begin
  Result := inherited TextOpen(t);
  if Result <> 0 then
    Exit;
  P := PUserDataString(GetUserDataPtr(t));
  if (P <> nil) then
  begin
    case P.C.Mode of
      fmOutput: // Rewrite
        if P.P <> nil then
          P.P^ := ''
        else
          Result := IO_ERROR;
      fmInOut:  // Append
        t.Mode := fmOutput;
      fmInput:  // Read
        P.C.Pos := 0;
    end;
    P.FlushedCL := False;
  end
  else
    Result := IO_ERROR;
end;

class function TIOTextDeviceString.TextIn(var t: TTextRec): Integer;
var
  P: PUserDataString;
  iLen: Cardinal;
  B: TTextBufString;
  PSrc: Pointer;
begin
  t.BufEnd := 0;
  t.BufPos := 0;
  P := PUserDataString(GetUserDataPtr(t));
  if (P = nil) or (P.P = nil) then
  begin
    Result := IO_ERROR;
    Exit;
  end;
  iLen := Length(P.P^);
  if (P.C.Pos < iLen) then
  begin
    { t.BufEnd := NumberOfBytesRead := Min(t.BufSize, iLen-P.Pos) }
    t.BufEnd := iLen-P.C.Pos;
    if t.BufEnd > t.BufSize then
      t.BufEnd := t.BufSize;
    // calculate source pointer
    if SizeOf(TTextBufChar) = SizeOf(Char) then
      PSrc := @P.P^[P.C.Pos+1]
    else
    begin
      B := TTextBufString(Copy(P.P^, P.C.Pos+1, t.BufEnd));
      PSrc := Pointer(B);
    end;
    // read from source
    Move(PSrc^, Pointer(t.BufPtr)^, t.BufEnd * SizeOf(TTextBufChar));
    // calculate new position
    Inc(P.C.Pos, t.BufEnd);
    Result := 0;
  end
  else
    Result := 0;
  Exit;
  if SizeOf(TTextBufChar) = SizeOf(Char) then
  asm // Remove compiler warning
    mov B, 0
  end;
end;

class procedure TIOTextDeviceString.DoTextOut(var t: TTextRec; const S: TTextBufString; out Result: Integer);
var
  P: PUserDataString;
begin
  P := PUserDataString(GetUserDataPtr(t));
  if (P <> nil) and (P.P <> nil) then
  begin
    Result := 0;
    if Length(S) > 0 then
    begin
      P.P^ := P.P^ + string(S);
      t.BufPos := 0; // clear buffer
      P.Flushed := False;
      if P.FlushImmediate then
        Result := FlushInternal(t);
    end;
  end
  else
    Result := IO_ERROR;
end;

{ TIOTextDeviceStringInternalCustom }

class function TIOTextDeviceStringInternalCustom.IsInternalCache(var t: TTextRec): Boolean;
var
  P: PUserDataString;
begin
  P := PUserDataString(GetUserDataPtr(t));
  Result := (P <> nil) and (P.P <> nil) and (P.P^ <> '');
end;

class function TIOTextDeviceStringInternalCustom.FlushInternal(var t: TTextRec): Integer;
var
  P: PUserDataString;
  iLen, i1, i2, i2a: Integer; // i1  - pos start; i2/i2a - pos of break;
  i3, iForce: Integer;        // i3 - skip chars count; iForce - added chars count
  iLNum: LongInt;             // line mumber
  S, SD: string;
  bIsError: Boolean;

  function LGetNextLine: Boolean;
  begin
    inc(iLNum);
    i3 := 0;
    i2 := PosEx(string(#13#10), S, i1);
    if i2 > 0 then
      i3 := 2;
    i2a := PosEx(#10, S, i1);
    if (i2a > 0) and ((i2a < i2) or (i2 <= 0)) then
    begin
      i2 := i2a;
      i3 := 1;
    end;
    Result := i2 > 0;
  end;

begin { parse of line breaks and write of separate lines }
  Result := 0;
  // get internal cache
  P := PUserDataString(GetUserDataPtr(t));
  if (P = nil) or (P.P = nil) then
    Exit;

  if P.Flushed then
    Exit;
  if not P.FlushImmediate then
  begin
    // ***
    // *** CACHE WRITE:
    // ***

    // prepare internal cache
    iLen := Length(P.P^);
    if (iLen > 0) and (Char(P.P^[iLen]) = Char(sLineBreak[Length(sLineBreak)])) then
    begin
      S := P.P^;
      iForce := 0;
    end
    else
    begin
      if ALLOW_FLUSH_ANY and (P.C.Mode <> fmClosed) then
        Exit;
      S := P.P^ + #10; // force break
      iForce := 1;
    end;
    P.P^ := ''; // clean cache
    // out internal cache
    bIsError := True;
    i1 := 1;
    try
      while LGetNextLine do
      begin
        SD := Copy(S, i1, i2-i1);
        Result := FlushInternal_NewLine(t, SD);
        if Result <> 0 then
          Break;
        i1 := i2 + i3; // Debug: PChar(@S[i1])
      end;
      if Result = 0 then
        bIsError := False;
    finally
      if not bIsError then
        P.Flushed := True
      else
        P.P^ := Copy(S, i1, Length(S) - i1 + 1 - iForce); // restore unwrited cache
    end;
  end
  else // when P.FlushImmediate:
  begin
    // ***
    // *** CACHE WRITE IMMEDIATELY: Need access/rewrite last line
    // ***

    // prepare internal cache
    iLen := Length(P.P^);
    if (iLen > 0) and {FlushedCL:} (Char(P.P^[iLen]) = Char(sLineBreak[Length(sLineBreak)])) then
    begin
      S := P.P^; // restore last
      if (S = #10) or (S = #13#10) then { call empty WriteLn() }
      begin
        Result := FlushInternal_NewLine(t, '');
        P.P^ := ''; // clean cache
        P.FlushedCL := False;
        P.Flushed := True;
        Exit;
      end;
      iForce := 0;
      if P.FlushedCL and (S[1] = #13) then
        System.Delete(S, 1, 1);
      P.FlushedCL := True;
    end
    else
    begin
      if iLen = 0 then
      begin
        Result := FlushInternal_NewLine(t, '');
        P.P^ := ''; // clean cache
        P.FlushedCL := False;
        P.Flushed := True;
        Exit;
      end;
      S := P.P^ + #10; // force break
      iForce := 1;
      if P.FlushedCL and (S[1] = #13) then
        System.Delete(S, 1, 1);
      P.FlushedCL := False;
    end;
    P.P^ := ''; // clean cache
    // out internal cache
    bIsError := True;
    i1 := 1;
    try
      iLNum := 0;
      while LGetNextLine do
      begin
        SD := Copy(S, i1, i2-i1);
        if (iLNum = 1) then
        begin
          Result := FlushInternal_Append(t, SD);
        end
        else
          Result := FlushInternal_NewLine(t, SD);
        if Result <> 0 then
          Break;
        i1 := i2 + i3; // Debug: PChar(@S[i1])
      end;
      if (Result = 0) and P.FlushedCL then
        Result := FlushInternal_NewLine(t, '');
      if Result = 0 then
        bIsError := False;
    finally
      if not bIsError then
        P.Flushed := True
      else
        P.P^ := Copy(S, i1, Length(S) - i1 + 1 - iForce); // restore unwrited cache
    end;
  end;
end;

class function TIOTextDeviceStringInternalCustom.FlushInternal_NewLine(var t: TTextRec; const S: string): Integer;
begin
  Result := IO_ERROR;
end;

class function TIOTextDeviceStringInternalCustom.GetText(const AText: Text): string;
begin
  Result := '';
end;

class function TIOTextDeviceStringInternalCustom.FlushInternal_Append(var t: TTextRec; const S: string): Integer;
begin
  Result := IO_ERROR;
end;

class function TIOTextDeviceStringInternalCustom.DoFlushImmediate(var t: TTextRec; IOResultIgnore: Boolean): Integer;
var
  P: PUserDataString;
begin
  P := PUserDataString(GetUserDataPtr(t));
  if (P <> nil) and (P.P <> nil) then
    Result := FlushInternal(t)
  else
    Result := 0;
end;

{ TIOTextDeviceStrings }

class procedure TIOTextDeviceStrings.Assign(var AText: Text; Strings: TStrings; FlushImmediate: Boolean);

  function ReturnAddr: Pointer;
  asm
    mov eax, [ebp+8]
  end;

var
  P: PUserDataCustom;
begin
  inherited Assign(AText);
  if Strings = nil then
    raise EIOTextDevice.Create('Not defined Strings') at ReturnAddr;
  P := GetUserDataPtr(AText);
  P.C.UserPtr := Strings;
  PUserDataString(P).FlushImmediate := FlushImmediate;
end;

class function TIOTextDeviceStrings.TextOpen(var t: TTextRec): Integer;
var
  P: PUserDataString;
begin
  P := PUserDataString(GetUserDataPtr(t));
  if (P = nil) or (P.C.UserPtr = nil) then
  begin // Strings == nil
    Result := IO_ERROR;
    Exit;
  end;
  Result := inherited TextOpen(t);
  if Result <> 0 then
    Exit;
  case P.C.Mode of
    fmOutput: // Rewrite
      begin
        with TStrings(P.C.UserPtr) do
        begin
          Clear;
        end;
      end;
    fmInOut:  // Append
      begin
        { empty }
      end;
    fmInput:  // Read
      begin
        with TStrings(P.C.UserPtr) do
        begin
          P.P^ := Text;
        end;
      end;
  end;
end;

class function TIOTextDeviceStrings.GetText(const AText: Text): string;
var
  t: PTextRec;
  P: PUserDataString;
  S: TTextBufString;
begin
  Result := '';
  t := PTextRec(@AText);
  if IsIODeviceClass(t^) then
  begin
    P := PUserDataString(GetUserDataPtr(t^));
    if (P = nil) or (P.C.UserPtr = nil) or (not P.C.IODeviceClass.InheritsFrom(TIOTextDeviceStrings))then
      Exit;
    if t.Mode <> fmInput then
    begin
      Result := TStrings(P.C.UserPtr).Text;
      if (not P.FlushImmediate)  then
        Result := Result + P.P^;
      // append buffered data
      if t.BufPos <> 0 then
      begin
        SetLength(S, t.BufPos);
        Move(Pointer(t.BufPtr)^, Pointer(S)^, t.BufPos * SizeOf(S[1]));
        Result := Result + string(S);
      end;
    end
    else
      Result := P.P^;
  end;
end;

class function TIOTextDeviceStrings.FlushInternal_NewLine(var t: TTextRec; const S: string): Integer;
var
  P: PUserDataCustom;
begin
  P := GetUserDataPtr(t);
  if Assigned(P) and Assigned(P.C.UserPtr) then
  begin
    with TStrings(P.C.UserPtr) do
    begin
      if (Length(S) = 0) and (Count = 0) then
        Add('');
      Add(S);
    end;
    Result := 0;
  end
  else
    Result := IO_ERROR;
end;

class function TIOTextDeviceStrings.FlushInternal_Append(var t: TTextRec; const S: string): Integer;
var
  P: PUserDataCustom;
begin
  P := GetUserDataPtr(t);
  with TStrings(P.C.UserPtr) do
  begin
    if Count <> 0 then
      Strings[Count-1] := Strings[Count-1] + S
    else
      Add(S);
  end;
  Result := 0;
end;

{ TIOTextDeviceDebug }

class procedure TIOTextDeviceDebug.Assign(var AText: Text);
begin
  inherited Assign(AText);
end;

class function TIOTextDeviceDebug.FlushInternal_NewLine(var t: TTextRec; const S: string): Integer;
var
  SD: string;
begin
  Result := 0;
  SD := StringReplace(S, #9, #32#32#32#32, [rfReplaceAll]); // IDE Event Log not supported <TAB> symbol
  if SD = '' then
    SD := ' '; // Event log skiped empty lines
  OutputDebugString(SD);
end;

procedure IOAssignNull(var D: IOTextDevice);
begin
  TIOTextDeviceNull.Assign(D);
end;

procedure IOAssignDebug(var D: IOTextDevice);
begin
  TIOTextDeviceDebug.Assign(D);
end;

procedure IOAssignText(var D: IOTextDevice);
begin
  TIOTextDeviceString.Assign(D);
end;

procedure IOAssignText(var D: IOTextDevice; var S: string);
begin
  TIOTextDeviceString.Assign(D, S);
end;

procedure IOAssignStream(var D: IOTextDevice; Stream: TStream);

  function ReturnAddr: Pointer;
  asm
    mov eax, [ebp+8]
  end;

begin
  if Stream = nil then
    raise EIOTextDevice.Create('Not defined Stream') at ReturnAddr;
  TIOTextDeviceStream.Assign(D, Stream);
end;

procedure IOAssignStrings(var D: IOTextDevice; Strings: TStrings; FlushImmediate: Boolean);

  function ReturnAddr: Pointer;
  asm
    mov eax, [ebp+8]
  end;

begin
  if Strings = nil then
    raise EIOTextDevice.Create('Not defined Strings') at ReturnAddr;
  TIOTextDeviceStrings.Assign(D, Strings, FlushImmediate);
end;

procedure HookConsoleIO(Hook: Boolean);
var
  t: PTextRec;
begin
  if IsConsole then
    Exit;
  t := PTextRec(@System.Output);
  if Hook then
  begin
    if (t.Mode <> fmClosed) then
      IOClose(System.Output {, Default: SafeClose=True});
    t^ := TTextRec(OutputDebugDevice);
    {$IFDEF DEBUG}
    WriteLn('IOTextDevices: HookConsoleOutput=', True);
    {$ENDIF}
  end
  else if TIOTextDeviceDebug.IsIODeviceClass(t^) then
  begin
    if (t.Mode = fmOutput) then
    begin
      {$I-}
      Flush(PIOTextDevice(t)^);
      {$I+}
      IOErrorClear;
      TIOTextDeviceCustom.FlushImmediate(System.Output, {IOResultIgnore}True);
    end;
    IOClear(System.Output);
  end;
end;

{$IFDEF D13_UP}
procedure CHECK_IO_TEXT_UNICODE;
type
  TTextBufX = array[0..High(TTextBuf)] of TTextBufChar;
var
  TextBufS: TTextBuf;
  TextBufX: TTextBufX;
begin
  // When compiler generate error on it line then need enable IO_TEXT_UNICODE
  // for it compiler version (look: $DEFINE IO_TEXT_UNICODE).
  TextBufX := TTextBufX(TextBufS);
end;
{$ENDIF}

initialization

  //SystemIOTest := GetStubAddress(@StubIOTest, 7);

  // Output: Null Device
  TIOTextDeviceNull.Assign(IONullDevice);
  Rewrite(IONullDevice);
  TIOTextDeviceNull.Lock(IONullDevice);
  // Output: Debug Device
  TIOTextDeviceDebug.Assign(OutputDebugDevice);
  Rewrite(OutputDebugDevice);
  TIOTextDeviceDebug.Lock(OutputDebugDevice);
  HookConsoleIO(True);
finalization
  HookConsoleIO(False);
  // Output: Debug Device
  TIOTextDeviceDebug.UnLock(OutputDebugDevice);
  IOClose(OutputDebugDevice {, Default: SafeClose=True});
  // Output: Null Device
  TIOTextDeviceNull.UnLock(IONullDevice);
  IOClose(IONullDevice {, Default: SafeClose=True});
end.
