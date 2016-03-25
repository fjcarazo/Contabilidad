library JclDbgMapOfAddr;

{$R *.res} // version information
//
// it is required JCl 1.96; 1.99
//
// for other version need wait to solve problem: http://issuetracker.delphi-jedi.org/view.php?id=4771
//
uses
  Windows,
  JclDebug;

var
  i: integer;

{$O-,B-}

function GetMapOfAddrW(const Addr: Pointer; var WFile, WModule, WProc: WideString; var ALine: Integer): Boolean;
var
  AFile, AModule, AProc: string;
begin
  inc(i);
  ALine := 0;
  try
    Result := MapOfAddr(Addr, AFile, AModule, AProc, ALine);
  except
    Result := False
  end;
  if Result then
  begin
    WFile := AFile;
    WModule := AModule;
    WProc := AProc;
  end
  else
  begin
    WFile := '';
    WModule := '';
    WProc := '';
  end;
end;

exports
  GetMapOfAddrW;

begin
  { empty }
end.
