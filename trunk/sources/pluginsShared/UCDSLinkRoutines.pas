unit UCDSLinkRoutines;

interface

uses
  SysUtils, Classes, DB,  DBAccess , Uni,  IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ZAbstractRODataset,
  ZAbstractDataset, ZSqlUpdate,TcashClasses,VirtualTable, IdIOHandlerStack,
  IdSSL;

type
  TDMCDSLinkRoutines = class(TDataModule)
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
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
   procedure FillCDSWithQuery(ACDS: TVirtualTable; ASQL: String);
   function ExecSQL(ASQL: String): Integer;
   property SQLList: TSQLList  read FSQLList write SetSQLList;
   procedure mapfields(AFromDataSet,AToDataSet,AFromDetailDataSet,AToDetailDataSet : TDataSet;Fieldslisttext,DetailFieldslisttext : String;LinkOnLeftOnFromData : Boolean) ;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink,janXMLParser2;

{$R *.dfm}
procedure TDMCDSLinkRoutines.LoadSql ;
Var
 ASearchRec : TSearchRec ;
 BSearchRec : TSearchRec ;
begin
 if FindFirst(ExtractFilePath(GetModuleName(MainInstance)) +'Bin\SQL\VTIGER\*.*', faDirectory, bSearchRec) = 0 then
   begin
    repeat
    if (bSearchRec.Name <> '.') and (bSearchRec.Name <> '..') then
    begin
    if FindFirst(ExtractFilePath(GetModuleName(MainInstance)) +'Bin\SQL\VTIGER\'+bSearchRec.Name+'\*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      repeat
        with FSQLList.SQLCollection.add  do
        begin
            SQL.LoadFromFile(ExtractFilePath(GetModuleName(MainInstance)) +'Bin\SQL\VTIGER\'+bSearchRec.Name+'\'+ASearchRec.name);
            Name := UpperCase(ChangeFileExt(ASearchRec.name ,'')+ bSearchRec.Name);
        end;
      until FindNext(ASearchRec) <> 0;
      sysutils.FindClose(ASearchRec);
    end;
  end; // Search rec is dir
  until FindNext(bSearchRec) <> 0;
  sysutils.FindClose(bSearchRec);
end;

end;

function TDMCDSLinkRoutines.URLEncode(Value : String) : String;
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

procedure TDMCDSLinkRoutines.FillCDSWithQuery(ACDS: TVirtualTable;ASQL: String);
  Var AMessage : String ;
  Filename: String ;
  AStream:TFileStream ;
  AChar : Char ;
  i : Integer ;
begin
try
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

 janXMLParser2.LoadXMLFromFile(Filename,ACDS,false);

 // DeleteFile(Filename) ;

 except
  on e : Exception do
     raise Exception.create(e.Message + #10#13 + AMessage);
 end;
end;

function TDMCDSLinkRoutines.ExecSQL(ASQL: String): Integer;
  Var AMessage : String ;
  AStream : TMemoryStream ;
  AChar : Char ;
  i : Integer ;
  APart : String ;
begin
result := 0 ;
if ASQL = '' then exit ;

IF POS('@@GO@@',ASQL) = 0 then
  ASQL := ASQL + '@@GO@@' ;



// look for exec seperator.

IdHTTP1.Disconnect ;
IdHTTP1.Request.Username := Username ;
IdHTTP1.Request.Password := Password ;
IdHTTP1.Request.BasicAuthentication := IdHTTP1.Request.Password <> '';
//IdHTTP1.Request.KeepAlive := true ;

APart := copy(ASQL,1,pos('@@GO@@',ASQL)-1);
delete(ASQL,1,pos('@@GO@@',ASQL)+6) ;
while APart <> '' do
begin

APart := Trim(StringReplace(APart,#13#10,' ',[rfReplaceAll]));
AStream := TMemoryStream.Create ;
try
IdHTTP1.Get(RemoteURL+'?sql=' +URLEncode(UTF8Encode(APart)),AStream  ) ;
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
 if pos('OK',AMessage) = 0 then
  raise Exception.create(AMessage);
 APart := copy(ASQL,1,pos('@@GO@@',ASQL)-1);
 delete(ASQL,1,pos('@@GO@@',ASQL)+6) ;
 if APart = '' then APart := ASQL ;
 APart := Trim(StringReplace(APart,#13#10,' ',[rfReplaceAll]));
end;
end;

procedure TDMCDSLinkRoutines.SetSQLList(const Value: TSQLList);
begin
  FSQLList := Value;
end;

procedure TDMCDSLinkRoutines.DataModuleCreate(Sender: TObject);
begin
FSQLList:= TSQLList.Create(self);
LoadSql ;
end;

procedure TDMCDSLinkRoutines.DataModuleDestroy(Sender: TObject);
begin
 FSQLList.free; 
end;

procedure TDMCDSLinkRoutines.mapfields(AFromDataSet, AToDataSet,AFromDetailDataSet,AToDetailDataSet: TDataSet;
  Fieldslisttext,DetailFieldslisttext: String;LinkOnLeftOnFromData : Boolean );
Var
 AStringList,ADetStringList : TStringlist ;
 i : Integer ;
begin
 AStringList := TStringlist.create ;
   try
   AStringList.Text := Fieldslisttext ;
   ADetStringList := TStringlist.create ;
   try
   ADetStringList.Text := DetailFieldslisttext ;

   AFromDataSet.First ;
   AToDataSet.open ;
   if assigned(AToDetailDataSet) then
   AToDetailDataSet.open ;
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
          // detail map
         AToDataSet.post ;
          if AFromDetailDataSet <> nil then
            begin
            AFromDetailDataSet.first ;
             while not AFromDetailDataSet.Eof do
                 begin
                  if AFromDetailDataSet.FieldByName('EXTID').AsString = AFromDataSet.FieldByName('EXTID').AsString then
                   begin
                   AToDetailDataSet.Append ;
                   if not LinkOnLeftOnFromData then
                      begin
                        for i := 0 to ADetStringList.Count-1 do
                          begin
                            if AToDetailDataSet.FindField(ADetStringList.Names[i]) <> nil then
                              if AFromDetailDataSet.FindField(ADetStringList.ValueFromIndex[i]) <> nil then
                               AToDetailDataSet.FindField(ADetStringList.Names[i]).Value := AFromDetailDataSet.FindField(ADetStringList.ValueFromIndex[i]).Value ;
                          end;
                      end else
                      begin
                        for i := 0 to ADetStringList.Count-1 do
                          begin
                            if AFromDetailDataSet.FindField(ADetStringList.Names[i]) <> nil then
                              if AToDetailDataSet.FindField(ADetStringList.ValueFromIndex[i]) <> nil then
                               AToDetailDataSet.FindField(ADetStringList.ValueFromIndex[i]).Value := AFromDetailDataSet.FindField(ADetStringList.Names[i]).Value ;
                          end;
                      end;
                   AToDetailDataSet.post ;
                   end;
                AFromDetailDataSet.Next ;
             end;  
            end;
       AFromDataSet.Next ;   
     end;
   finally
    ADetStringList.free ;
   end;
   finally
    AStringList.free ;
   end;
end;

end.
