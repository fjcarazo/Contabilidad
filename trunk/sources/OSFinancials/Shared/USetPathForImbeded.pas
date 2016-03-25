unit USetPathForImbeded;

interface
uses forms,inifiles,sysutils,windows;
implementation
Var
  OSFIniFile:TIniFile;
  aPath,bPath : String ;
  aSize : Cardinal ;
initialization

begin
  if not  FileExists(ExtractFilePath(Application.ExeName)+'OSF.ini') then exit ;
  OSFIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'OSF.ini');
  try
   if OSFIniFile.ReadString('Current Language','imbedded','0') = '1' then
       begin
          setlength(aPath,255);
          aSize := 255 ;
          GetEnvironmentVariable('PATH',pchar(aPath),aSize);
          BPath := ExtractFilePath(Application.ExeName) + 'Imbedded' + ';' + aPath ;
          SetEnvironmentVariable('PATH',pchar(BPath));
       end;
  finally
  OSFIniFile.Free;
  end;


end;

end.
