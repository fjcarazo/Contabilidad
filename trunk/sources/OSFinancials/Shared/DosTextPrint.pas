unit DosTextPrint;

interface

uses
  Windows, SysUtils,WinSpool;


Function  GetSylPrnName(const APrinterName: string):String;
procedure PrintTextNow(const aText,Prn,JobTitle: String;CutPaper : Boolean);

//Var
//  SylDosPrnJobTitle: string;

implementation

uses Printers;
Var
//  SylDosPrnName: string;
  SylDosPrnHandle: THandle;



Function GetSylPrnName(const APrinterName: string):String;
var
  P: integer;
begin
  Result := APrinterName;
  P:= Pos(' ON ', Uppercase(Result));
  if P > 0  then
    Result:= Copy(Result, 1, P - 1);
end;

procedure OpenSylPrn(SylDosPrnName,SylDosPrnJobTitle:String);
var
  DocInfo1: TDocInfo1;
begin
  if not OpenPrinter(PChar(SylDosPrnName), SylDosPrnHandle, nil) then
  case GetLastError of
    87: Exception.create('Printer name does not exist');
    else
        Exception.create('Error ' + IntToStr(GetLastError));
  end
  else
  begin
    with DocInfo1 do
    begin
      pDocName:= PChar(SylDosPrnJobTitle);
      pOutputFile:=nil;
      pDataType:= 'RAW';
    end;
    StartDocPrinter(SylDosPrnHandle, 1, @DocInfo1);
    StartPagePrinter(SylDosPrnHandle);
  end;
end;

procedure CloseSylPrn;
begin
  EndPagePrinter(SylDosPrnHandle);
  EndDocPrinter(SylDosPrnHandle);
  ClosePrinter(SylDosPrnHandle);
end;


procedure PrintTextNow(const aText,Prn,JobTitle: String;CutPaper : Boolean );
var
  N: DWord;
begin
//  SylDosPrnName:= GetSylPrnName(Prn);

OpenSylPrn(GetSylPrnName(Prn),JobTitle);
  try
  //  OpenSylPrn;
   WritePrinter(SylDosPrnHandle, PChar(aText), Length(aText), N);
   if DWord(Length(aText)) <> N  then
     Exception.create('Error writing to printer');
  finally
    CloseSylPrn;
  end;
 if CutPaper then
 begin
 printers.Printer.PrinterIndex := printers.Printer.Printers.IndexOf(Prn);
 printers.Printer.BeginDoc ;
 printers.Printer.EndDoc ;
 end;
end;


end.
