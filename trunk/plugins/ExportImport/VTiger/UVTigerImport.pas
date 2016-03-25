unit UVTigerImport;

interface

uses
  SysUtils, Classes, DB, ZAbstractTable, DBAccess , Uni, DBClient, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ZAbstractRODataset,
  ZAbstractDataset, ZSqlUpdate,TcashClasses,JvMemoryDataset;

type
  TdmVTigerImport = class(TDataModule)
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FSQLList: TSQLList;
    function URLEncode(Value : String) : String;
    procedure SetSQLList(const Value: TSQLList);
   procedure LoadSql;
    { Private declarations }
  public

   Username,
   Password,
   RemoteURL : String ;
   procedure FillCDSWithQuery(ACDS: TJvMemoryData; ASQL: String);
   function ExecSQL(ASQL: String): Integer;
   property SQLList: TSQLList  read FSQLList write SetSQLList;
   procedure mapfields(AFromDataSet,AToDataSet : TDataSet;Fieldslisttext : String;LinkOnLeftOnFromData : Boolean) ;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink,janXMLParser2;

{$R *.dfm}
procedure TdmVTigerImport.LoadSql ;
Var
 ASearchRec : TSearchRec ;
begin

    if FindFirst(ExtractFilePath(GetModuleName(MainInstance)) +'Bin\SQL\VTIGER\*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        with FSQLList.SQLCollection.add  do
        begin
            SQL.LoadFromFile(ExtractFilePath(GetModuleName(MainInstance)) +'Bin\SQL\VTIGER\'+ASearchRec.name);
            Name := ChangeFileExt(ASearchRec.name,'');
        end;
      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;
end;

function TdmVTigerImport.URLEncode(Value : String) : String;
Var I : Integer;
const
 ValidURLChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$-_@.&+-!*"(),;/#?:';
Begin
   Result := '';
   For I := 1 To Length(Value) Do
      Begin
         If Pos(UpperCase(Value[I]), ValidURLChars) > 0 Then
            Result := Result + Value[I]
         Else
            Begin
               If Value[I] = ' ' Then
                  Result := Result + '%20'
               Else
                  Begin
                     Result := Result + '%';
                     Result := Result + IntToHex(Byte(Value[I]), 2);
                  End;
            End;
      End;
End;

procedure TdmVTigerImport.FillCDSWithQuery(ACDS: TJvMemoryData;ASQL: String);
  Var AMessage : String ;
  Filename: String ;
  AStream:TFileStream ;
  AChar : Char ;
  i : Integer ;
begin

IdHTTP1.Disconnect ;
IdHTTP1.Request.Username := Username ;
IdHTTP1.Request.Password := Password ;
IdHTTP1.Request.BasicAuthentication := IdHTTP1.Request.Password <> '';
//IdHTTP1.Request.KeepAlive := true ;
ASQL := StringReplace(ASQL,#13#10,' ',[rfReplaceAll]);
Filename :=   ExtractFilePath(GetModuleName(HInstance))+'DL'{+FormatDatetime('hhnnss',now)} +ACDS.Name+'.xml' ;
AStream := TFileStream.Create(Filename,fmCreate	) ;
try
IdHTTP1.Get(RemoteURL+'?sql=' +URLEncode(ASQL),AStream  ) ;
AStream.Position := 0 ;
AMessage := '' ;
for i :=  0 to 20 do
  begin
    AStream.Read(AChar,1);
    AMessage := AMessage +  AChar ;
  end;
if pos('<RESULT>',AMessage) <> 0 then
  begin
      AStream.Position := 0 ;
      AMessage :=  '' ;
      while AStream.Position < AStream.Size do
        begin
          AStream.Read(AChar,1);
          AMessage := AMessage +  AChar ;
        end;
  end;

finally
  AStream.free ;
end;

if pos('<RESULT>',AMessage) <> 0 then
  raise Exception.create(AMessage);
 try
  janXMLParser2.LoadXMLFromFile(Filename,ACDS);
 // DeleteFile(Filename) ;
 except
  on e : Exception do
     raise Exception.create(e.Message + #10#13 + AMessage);
 end;

end;

function TdmVTigerImport.ExecSQL(ASQL: String): Integer;
  Var AMessage : String ;
  AStream : TMemoryStream ;
  AChar : Char ;
  i : Integer ;
begin
result := 0 ;
IdHTTP1.Disconnect ;
IdHTTP1.Request.Username := Username ;
IdHTTP1.Request.Password := Password ;
IdHTTP1.Request.BasicAuthentication := IdHTTP1.Request.Password <> '';
//IdHTTP1.Request.KeepAlive := true ;
ASQL := StringReplace(ASQL,#13#10,' ',[rfReplaceAll]);
AStream := TMemoryStream.Create ;
try
IdHTTP1.Get(RemoteURL+'?sql=' +URLEncode(ASQL),AStream  ) ;
AStream.Position := 0 ;
AMessage := '' ;
for i :=  0 to 20 do
  begin
    AStream.Read(AChar,1);
    AMessage := AMessage +  AChar ;
  end;
if pos('<RESULT>',AMessage) <> 0 then
  begin
      AStream.Position := 0 ;
      AMessage :=  '' ;
      while AStream.Position < AStream.Size do
        begin
          AStream.Read(AChar,1);
          AMessage := AMessage +  AChar ;
        end;
  end;
finally
  AStream.free ;
end;
// todo : Return affected 
if pos('<RESULT>',AMessage) <> 0 then
  raise Exception.create(AMessage);
end;

procedure TdmVTigerImport.SetSQLList(const Value: TSQLList);
begin
  FSQLList := Value;
end;

procedure TdmVTigerImport.DataModuleCreate(Sender: TObject);
begin
FSQLList:= TSQLList.Create(self);
LoadSql ;
end;

procedure TdmVTigerImport.DataModuleDestroy(Sender: TObject);
begin
 FSQLList.free; 
end;

procedure TdmVTigerImport.mapfields(AFromDataSet, AToDataSet: TDataSet;
  Fieldslisttext: String;LinkOnLeftOnFromData : Boolean );
Var
 AStringList : TStringlist ;
 i : Integer ;
begin
 AStringList := TStringlist.create ;
   try
   AStringList.Text := Fieldslisttext ;
   AFromDataSet.First ;
   AToDataSet.open ;
   while not AFromDataSet.Eof do
     begin

       AToDataSet.Insert ;
       if not LinkOnLeftOnFromData then
          begin
            for i := 0 to AStringList.Count-1 do
              begin
                if AToDataSet.FindField(AStringList.Names[i]) <> nil then
                  if AFromDataSet.FindField(AStringList.ValueFromIndex[i]) <> nil then
                   AToDataSet.FindField(AStringList.Names[i]).Value := AFromDataSet.FindField(AStringList.ValueFromIndex[i]).Value ;
              end;
          end else
          begin
            for i := 0 to AStringList.Count-1 do
              begin
                if AFromDataSet.FindField(AStringList.Names[i]) <> nil then
                  if AToDataSet.FindField(AStringList.ValueFromIndex[i]) <> nil then
                   AToDataSet.FindField(AStringList.ValueFromIndex[i]).Value := AFromDataSet.FindField(AStringList.Names[i]).Value ;
              end;

          end;
       AFromDataSet.Next ;   
     end;
   finally
    AStringList.free ;
   end;
end;

end.
