unit uMemCheck;
{$D+,L+,O-,B-}
interface

uses
  Windows, Messages, SysUtils,
  {$IFDEF CONDITIONALEXPRESSIONS}
  Variants,
  {$ENDIF}
  Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MemCheck, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    mLeaks: TMemo;
    tLeaks: TStaticText;
    tVersion: TStaticText;
    Panel4: TPanel;
    Panel5: TPanel;
    tFilter: TStaticText;
    cbTraceObjects: TCheckBox;
    cbTraceGetMem: TCheckBox;
    cbTraceReallocMem: TCheckBox;
    Panel6: TPanel;
    btnMemCheckTransactionNew: TButton;
    btnLeakObject: TButton;
    btnLeakMem: TButton;
    btnLeakMemRealloc: TButton;
    btnMemCheckTransactionShowLeaks: TButton;
    cbRaiseLeakFirstAddress: TCheckBox;
    cbRaiseLeakAllAddresses: TCheckBox;
    cbCheckWipedBlocks: TCheckBox;
    btnMemCheckTransactionHideLeaks: TButton;
    Panel7: TPanel;
    StaticText1: TStaticText;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    procedure btnLeakObject_Click(Sender: TObject);
    procedure btnLeakMem_Click(Sender: TObject);
    procedure btnLeakMemRealloc_Click(Sender: TObject);
    procedure btnMemCheckTransactionNew_Click(Sender: TObject);
    procedure btnMemCheckTransactionShowLeaks_Click(Sender: TObject);
    procedure btnMemCheckTransactionHideLeaks_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTraceFilerChanged_Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    MemCheck_Transaction: Integer;
    procedure MemCheckShowTransactionLeaks(bShowLeaks, bHideLeaks: Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  IOTextDevices;

procedure TForm1.FormCreate(Sender: TObject);
begin
  mLeaks.WordWrap := False;
  tVersion.Caption := tVersion.Caption + ' ' + MemCheck.MemCheckVersion;
  cbTraceFilerChanged_Click(nil);
  {
  if not MemCheck.IsDebugged then
  begin
    cbRaiseLeakFirstAddress.Checked := False;
    cbRaiseLeakAllAddresses.Checked := False;
    cbRaiseLeakFirstAddress.Enabled := False;
    cbRaiseLeakAllAddresses.Enabled := False;
  end;
  {}
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // Disable IDE raise exception on Quit:
  if IsDebugged then
    UnMemChk;
end;

var
  ptrMem: Pointer;

procedure TForm1.btnLeakMemRealloc_Click(Sender: TObject);
begin
  if ptrMem = nil then
    Exit;

  if MemCheck_Transaction = 0 then
    MemCheck_Transaction := MemCheckNewTransaction;

  ReallocMem(ptrMem, 8192); // Works in context of the LeakTransaction
  // of the block ptrMem (look ReallocMemRestoreLeakTransaction in "MemCheck.pas")
  mLeaks.Lines.Add('leak  r-mem :' + Format('$%xx', [Integer(ptrMem)]));
end;

procedure TForm1.btnLeakMem_Click(Sender: TObject);
begin
  if MemCheck_Transaction = 0 then
    MemCheck_Transaction := MemCheckNewTransaction;

  ptrMem := nil;
  GetMem(ptrMem, 4096);
  mLeaks.Lines.Add('leak  a-mem :' + Format('$%xx', [Integer(ptrMem)]));
end;

procedure TForm1.btnLeakObject_Click(Sender: TObject);
var
  O: TObject;
begin
  if MemCheck_Transaction = 0 then
    MemCheck_Transaction := MemCheckNewTransaction;

//  O := TStringList.Create;
//  exit;

  Randomize;
  O := nil;
  case random(5) of
    0: O := TObject.Create;
    1: O := TList.Create;
    2: O := TStringList.Create;
    3: O := TFont.Create;
    4: O := TPanel.Create(nil);
  end;
  if Assigned(O) then
    mLeaks.Lines.Add('leak object :' + O.ClassName);
end;

function min(v1, v2: Integer): Integer;
begin
  if v1 < v2 then
    Result := v1
  else
    Result := v2;
end;

procedure TForm1.btnMemCheckTransactionNew_Click(Sender: TObject);
begin
  mLeaks.Lines.Clear;
  MemCheck_Transaction := MemCheckNewTransaction;
end;

procedure TForm1.MemCheckShowTransactionLeaks(bShowLeaks, bHideLeaks: Boolean);
var
  OutputDevice: IOTextDevice; // = System.Text
  //OutputString: string;
  bIsLeaks: Boolean;
  bRaiseLeakFirstAddress, bRaiseLeakAllAddresses, bCheckWipedBlocks: Boolean;
begin
  if MemCheck_Transaction = 0 then
    Exit;

  bRaiseLeakFirstAddress := cbRaiseLeakFirstAddress.Checked;
  bRaiseLeakAllAddresses := cbRaiseLeakAllAddresses.Checked;
  bCheckWipedBlocks := cbCheckWipedBlocks.Checked;

  if (not bShowLeaks) and bHideLeaks then
  begin
    bRaiseLeakFirstAddress := False;
    bRaiseLeakAllAddresses := False;
  end;

  UnMemChk;
  mLeaks.Lines.BeginUpdate;
  try
    if not bHideLeaks then
      IOAssignStrings(OutputDevice, mLeaks.Lines {Default: FlushImmediate = True})
      //IOAssignStrings(OutputDevice, mLeaks.Lines, {FlushImmediate:}False) // FlushImmediate=False, since not it is necessary to show changes immediately
      //IOAssignText(OutputDevice, OutputString) // write into variable OutputString
    else
      IOAssignNull(OutputDevice);
    try
      System.Rewrite(OutputDevice);
      bIsLeaks := MemCheck.MemCheckGetTransactionLeaks(MemCheck_Transaction, OutputDevice,
        bRaiseLeakFirstAddress, bRaiseLeakAllAddresses, bCheckWipedBlocks, bHideLeaks);
    finally
      System.Close(OutputDevice); // Flush
    end;
    //if (not bHideLeaks) and bIsLeaks and bShowLeaks then
    //  mLeaks.Lines.Text := OutputString;
    if not bIsLeaks then
      mLeaks.Lines.Clear;
  finally
    mLeaks.Lines.EndUpdate;
    MemChk;
  end;
end;

procedure TForm1.btnMemCheckTransactionShowLeaks_Click(Sender: TObject);
begin
  mLeaks.Lines.Clear;
  if MemCheck_Transaction > 0 then
    MemCheckShowTransactionLeaks({ShowLeaks}True, {HideLeaks}False);
end;

procedure TForm1.btnMemCheckTransactionHideLeaks_Click(Sender: TObject);
begin
  mLeaks.Lines.Clear;
  if MemCheck_Transaction > 0 then
    MemCheckShowTransactionLeaks({ShowLeaks}False, {HideLeaks}True);
end;

procedure TForm1.cbTraceFilerChanged_Click(Sender: TObject);
begin
  MemCheckInitByFilter(
    {MClass:}cbTraceObjects.Checked,
    {MUser:}cbTraceGetMem.Checked,
    {MReallocedUser:}cbTraceReallocMem.Checked);
end;

initialization
  //MemCheckIgnoredClassAdd(TStringList);
  //MemCheckIgnoredClassAdd(TList);
end.
