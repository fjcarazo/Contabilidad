unit ifps3Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ifps3utl, ifpscomp, ifps3, Menus, ifps3lib_std,
  ifps3lib_stdr, ifps3common;

type
  TfmScriptMain = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    Toosl1: TMenuItem;
    Compile1: TMenuItem;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    SaveAs1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    New1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Stop1: TMenuItem;
    procedure Compile1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Stop1Click(Sender: TObject);
  private
    fn: string;
    changed: Boolean;
    function SaveTest: Boolean;
  public
    { Public declarations }
  end;

  Procedure ExecAutoRun;

var
  fmScriptMain: TfmScriptMain;

implementation
uses
   ifpidelphi, ifpidelphiruntime, ifpidll2, ifpidll2runtime, T3GuiLibraries;
{$R *.DFM}

Procedure ExecAutoRun;
Var
  sr: TSearchRec;
begin
  fmScriptMain:=TfmScriptMain.Create(Application);
  try
    if Not DirectoryExists(GetAppPath+'Startup') then exit;
    if FindFirst(GetAppPath+'Startup\*.tcs', faAnyFile, sr) = 0 then
    begin
      repeat
        if FileExists(GetAppPath+'Startup\'+sr.Name) then
        begin
          fmScriptMain.Memo1.Lines.LoadFromFile(GetAppPath+'Startup\'+sr.Name);
          fmScriptMain.Compile1Click(fmScriptMain);
        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
  Except end;
  fmScriptMain.Free;
end;

Function AddLn(S:String):String;
begin
  Result:=s+#13#10;
end;

Function DefaultPrg:String;
begin
  Result :=AddLn('Program Script1;')+
           AddLn('Var ')+
           AddLn('  batID : Integer;')+
           AddLn('  SResult : String;')+
           AddLn('Begin ')+
           AddLn('  CloseWelcome;')+
           AddLn('  OpenSetofBooks(''handyman'');')+
           AddLn('  //if OpenBatch(''Sales Jnl'',BatID)<>'''' then')+
           AddLn('  Begin')+
           AddLn('    //writeln(IntToStr(batID));')+
           AddLn('    //loadBatchFromText(''C:\bat.csv'');')+
           AddLn('    //BalanceBatch(1);')+
           AddLn('    //PostBacth(True);')+
           AddLn('    //WriteDocsToFile(''1/09/2002'',''C:\temp\sylva.txf'');')+
           AddLn('    //Writeln(IntToStr(WriteDocsToStr(StrToDate(''1/09/02''),SResult)));')+
           AddLn('    //Writeln(SResult);')+
           AddLn('    //GetDocList('''',SResult);')+
           AddLn('    //Writeln(SResult);')+
           AddLn('    GetBankReconData(''810000'',''30/10/2002'',SResult);')+
           AddLn('    Writeln(SResult);')+
           AddLn('  End;')+
           AddLn('  CloseBatch;// Just to be sure it''s Closed')+
           AddLn('End.');

end;

function MyOnUses(Sender: TIFPSPascalCompiler; const Name: string): Boolean;
begin
  if Name = 'SYSTEM' then
  begin
    TIFPSPascalCompiler(Sender).AddFunction('procedure Writeln(s: string);');
    TIFPSPascalCompiler(Sender).AddFunction('function Readln(question: string): string;');
    Sender.AddConstantN('NaN', 'extended')^.Value.textended := (0.0 / 0.0);
    Sender.AddConstantN('Infinity', 'extended')^.Value.textended := (1.0 / 0.0);
    Sender.AddConstantN('NegInfinity', 'extended')^.Value.textended := (- 1.0 / 0.0);
    //RegisterDelphiFunctionC(Sender, 'function ImportTest(S1: string; s2: Longint; s3: Byte; s4: word; var s5: string): string;');
    RegisterT3gLibC(Sender);
    RegisterStandardLibrary_C(Sender);
    Result := True;
  end
  else
  begin
    TIFPSPascalCompiler(Sender).MakeError('', ecUnknownIdentifier, '');
    Result := False;
  end;
end;

function MyWriteln(Caller: TIFPSExec; p: PIFProcRec; Global, Stack: TIfList): Boolean;
var
  PStart: Cardinal;
begin
  PStart := Stack.Count - 1;
  fmScriptMain.Memo2.Lines.Add(LGetStr(Stack, PStart)+#13#10);
  Result := True;
end;

function MyReadln(Caller: TIFPSExec; p: PIFProcRec; Global, Stack: TIfList): Boolean;
var
  PStart: Cardinal;
begin
  PStart := Stack.Count - 2;
  LSetStr(Stack, PStart + 1, InputBox(fmScriptMain.Caption, LGetStr(stack, PStart), ''));
  Result := True;
end;



function SpecialProcImport(Sender: TIFPSExec; p: PIFProcRec): Boolean;
begin
  Result := ProcessDllImport(TIFPSExec(Sender), P);
end;

var
  I: Integer;

procedure RunLine(Sender: TIFPSExec);
begin
  i := (i + 1) mod 15;
  if i = 0 then Application.ProcessMessages;
end;

function MyExportCheck(Sender: TIFPSPascalCompiler; Proc: PIFPSProcedure; const ProcDecl: string): Boolean;
begin
  Result := TRue;
end;


procedure TfmScriptMain.Compile1Click(Sender: TObject);
var
  x1: TIFPSPascalCompiler;
  x2: TIFPSExec;
  s: string;

  procedure Outputtxt(const s: string);
  begin
    Memo2.Lines.Add(s);
  end;

  procedure OutputMsgs;
  var
    l: Longint;
    b: Boolean;
  begin
    b := False;
    for l := 0 to x1.MsgCount - 1 do
    begin
      Outputtxt(IFPSMessageToString(x1.Msg[l]));
      if (not b) and (x1.Msg[l]^.MessageType = pterror) then
      begin
        b := True;
        Memo1.SelStart := X1.Msg[l]^.Position;
      end;
    end;
  end;
begin
  if tag <> 0 then exit;
  Memo2.Clear;
  x1 := TIFPSPascalCompiler.Create;
  x1.OnExportCheck := MyExportCheck;
  x1.OnUses := MyOnUses;
  x1.OnExternalProc := DllExternalProc;
  if x1.Compile(Memo1.Text) then
  begin
    Outputtxt('Succesfully compiled');
    OutputMsgs;
    if not x1.GetOutput(s) then
    begin
      x1.Free;
      Outputtxt('[Error] : Could not get data');
      exit;
    end;
    x1.Free;
    x2 := TIFPSExec.Create;
    RegisterDLLRuntime(x2);
    tag := longint(x2);
    if sender <> nil then
      x2.OnRunLine := RunLine;
    x2.RegisterFunctionName('WRITELN', MyWriteln, nil, nil);
    x2.RegisterFunctionName('READLN', MyReadln, nil, nil);
    //RegisterDelphiFunctionR(x2, @importtest, 'IMPORTTEST', cdRegister);
    RegisterT3gLibR(x2);
    RegisterStandardLibrary_R(x2);
    if not x2.LoadData(s) then begin
      Outputtxt('[Error] : Could not load data');
      x2.Free;
      exit;
    end;
    x2.RunScript;
    if x2.ExceptionCode <> ENoError then
      Outputtxt('[Runtime Error] : ' + TIFErrorToString(x2.ExceptionCode, x2.ExceptionString) +
        ' in ' + IntToStr(x2.ExceptionProcNo) + ' at ' + IntToSTr(x2.ExceptionPos))
    else
      OutputTxt('Successfully executed');

    tag := 0;
    x2.Free;
  end
  else
  begin
    Outputtxt('Failed when compiling');
    OutputMsgs;
    x1.Free;
  end;
end;

procedure TfmScriptMain.FormCreate(Sender: TObject);
begin
  Caption := 'Pascal Script ';
  fn := '';
  changed := False;
  Memo1.Lines.Text :=DefaultPrg;
  changed := False;
end;

procedure TfmScriptMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmScriptMain.New1Click(Sender: TObject);
begin
  if not SaveTest then
    exit;
  Memo1.Lines.Text := DefaultPrg;
  Memo2.Lines.Clear;
  fn := '';
end;

function TfmScriptMain.SaveTest: Boolean;
begin
  if changed then
  begin
    case MessageDlg('File is not saved, save now?', mtWarning, mbYesNoCancel, 0) of
      mrYes:
        begin
          Save1Click(nil);
          Result := not changed;
        end;
      mrNo: Result := True;
    else
      Result := False;
    end;
  end
  else
    Result := True;
end;

procedure TfmScriptMain.Open1Click(Sender: TObject);
begin
  if not SaveTest then
    exit;
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    changed := False;
    Memo2.Lines.Clear;
    fn := OpenDialog1.FileName;
  end;
end;

procedure TfmScriptMain.Save1Click(Sender: TObject);
begin
  if fn = '' then
  begin
    Saveas1Click(nil);
  end
  else
  begin
    Memo1.Lines.SaveToFile(fn);
    changed := False;
  end;
end;

procedure TfmScriptMain.SaveAs1Click(Sender: TObject);
begin
  SaveDialog1.FileName := '';
  if SaveDialog1.Execute then
  begin
    fn := SaveDialog1.FileName;
    Memo1.Lines.SaveToFile(fn);
    changed := False;
  end;
end;

procedure TfmScriptMain.Memo1Change(Sender: TObject);
begin
  changed := True;
end;

procedure TfmScriptMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := SaveTest;
end;

procedure TfmScriptMain.Stop1Click(Sender: TObject);
begin
  if tag <> 0 then
    TIFPSExec(tag).Stop;
end;

end.
