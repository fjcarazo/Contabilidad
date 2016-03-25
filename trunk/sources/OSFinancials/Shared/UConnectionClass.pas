(*
  Id: UConnectionClass.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UConnectionClass;

interface
uses SysUtils,Classes,DBAccess , Uni,TcashClasses;
  type
  TOSAConnectionItem = class(TcollectionItem)
  private
    FAlias: String;
    FConnection: TUniconnection;
    FQuery: TuniQuery;
    FFullname: String;
    FMainAccountLength: Integer;
    FOwnConnection: boolean;
    procedure SetAlias(const Value: String);
    procedure SetConnection(const Value: TUniconnection);
    procedure SetQuery(const Value: TuniQuery);
    procedure SetFullname(const Value: String);
    procedure SetMainAccountLength(const Value: Integer);
    procedure SetOwnConnection(const Value: boolean);


     public
      property OwnConnection : boolean  read FOwnConnection write SetOwnConnection;
      constructor Create(Collection: TCollection); override;
      destructor Destroy; override;
       Function  ReadNwReportOp(vfield:String):Variant;Overload;
       Function  ReadNwReportOp(vfield:String;BValue:Boolean):Variant;Overload;
       Function  ReadNwReportOp(vfield:String;DValue:TDateTime):Variant;Overload;
       Function  ReadNwReportOp(vfield:String;SValue:String):Variant;Overload;
       Function  ReadNwReportOp(vfield:String;Value:Integer):Variant;Overload;
       function  ReadLongReportOp(vfield: String): String;
       procedure WriteLongReportOp(vfield, Value: String);
       Procedure WriteNwReportOp(vfield,Value:String);
       Procedure CreatNwReportOp(vfield:String;Value:String);
       function GetAddGroupNesteled(AName: String; GroupType : Integer ;ChildID : Integer = 0): Integer;
       function GetNesteldNameFromGroupID(AGroupID: Integer;var level: Integer): String;
     published
       property Query : TuniQuery  read FQuery write SetQuery;
       property Connection : TUniconnection  read FConnection write SetConnection;
       property Alias : String  read FAlias write SetAlias;
       property Fullname : String  read FFullname write SetFullname;
       property MainAccountLength : Integer  read FMainAccountLength write SetMainAccountLength;
       // Assign connections to child components
       procedure AssignConnectionToChilds(AComponent : TComponent) ;
       // get the local dir for saving ini file data localy (even when there is a server running)
       function GetLocalSaveDir : String ;
       // Create a new ID for a table in Turbocash
       Function GetNewId(AIdType : TTCIdType ) : Integer ;
       // read a sysvars table variable.
       function GetSysVar(AColName : String ) : String ;
       // run SQL and return last column.
       function  OpenSqlReturnFirstColumn(ASql : String ) : Variant ;
       // exec anny sql on this connection
       procedure ExecSql(ASql : String )  ;

       procedure OnConnect (sender : Tobject) ;
       // property PluginList : TPluginList ;
  end;
  TOSAConnection = Class(TCollection)
  private
    function GetConnections(index: Integer): TOSAConnectionItem;
    procedure SetConnections(index: Integer;
      const Value: TOSAConnectionItem);
     public
       property Connections [index : Integer] : TOSAConnectionItem  read GetConnections write SetConnections;
       function GetConnectionOnAlias(aAlias : String ) : TOSAConnectionItem ;
       // function GetTotals
  end;

implementation

{ TOSAConnection }
uses variants , UDMTCCoreLink, OSFGeneralRoutines;



function TOSAConnection.GetConnectionOnAlias(
  aAlias: String): TOSAConnectionItem;
var
 i : integer;
begin
  result := nil ;
  for i := 0 to Self.Count -1 do
    begin
       if GetConnections(i).FAlias = UpperCase(aAlias) then
        begin
         result := GetConnections(i) ;
         exit ;
        end;
    end;
end;

function TOSAConnection.GetConnections(index: Integer): TOSAConnectionItem;
begin
  result := TOSAConnectionItem(Items[index]);
end;

procedure TOSAConnection.SetConnections(index: Integer;
  const Value: TOSAConnectionItem);
begin
  Items[index].Assign(Value);
end;

{ TOSAConnectionItem }
function TOSAConnectionItem.GetAddGroupNesteled(AName: String; GroupType : Integer ;ChildID : Integer = 0): Integer;
var
  LocalName : String ;
  AQuery : TuniQuery ;
  AUpdateComp : TUniUpdateSql ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AUpdateComp := TUniUpdateSql.create(nil);
  try
     // check for nesteled name
     if pos('@',AName) <> 0 then
        begin
          LocalName := copy(AName,1,pos('@',AName)-1) ;
          Delete(AName,1,pos('@',AName));
        end else
        begin
        LocalName := AName ;
        AName := '' ;
        end;

      AQuery.Connection := FConnection ;
      AQuery.UpdateObject := AUpdateComp ;
      AQuery.sql.Text := ' Select * FROM Groups where WGroupTypeId = :GroupType and SDescription =:Description' ;
      AUpdateComp.InsertSQL.Text :='INSERT INTO GROUPS (WGROUPID, WGROUPTYPEID, SDESCRIPTION, WPARENTGROUP2ID,' +
                                   'WPARENTGROUP1ID, DSYSDATE, WSORTNO) VALUES (:WGROUPID, :WGROUPTYPEID,:SDESCRIPTION,'+
                                   ':WPARENTGROUP2ID,:WPARENTGROUP1ID, :DSYSDATE, :WSORTNO)' ;

      if AName = '' then
         AQuery.sql.add('And ((WParentGroup2ID is null) or (WParentGroup2ID = 0))')
         else
         AQuery.sql.add('And WParentGroup2ID = ' + IntToStr(ChildID)) ;

      AQuery.Params[0].AsInteger := GroupType ;
      AQuery.Params[1].AsString := LocalName ;
      AQuery.open ;
      if AQuery.IsEmpty then
         begin
           AQuery.Insert ;
           AQuery.FieldByName('WGROUPID').AsInteger := GetNewId(tcidNEWGROUPID);
           AQuery.FieldByName('WGROUPTYPEID').AsInteger := GroupType ;
           AQuery.FieldByName('SDESCRIPTION').AsString := LocalName ;
           AQuery.FieldByName('WPARENTGROUP2ID').AsInteger := ChildID ;
           AQuery.FieldByName('WPARENTGROUP1ID').AsInteger := 0 ;
           AQuery.FieldByName('WSORTNO').AsInteger := AQuery.FieldByName('WGROUPID').AsInteger ;
           AQuery.Post ;
         end ;
     result := AQuery.FieldByName('WGROUPID').AsInteger ;
     AQuery.close ;
    finally
       AUpdateComp.free ;
    end;
   finally
      AQuery.free ;
   end;
   if AName <> '' then
      result := GetAddGroupNesteled(AName,GroupType,result);
end;

function TOSAConnectionItem.GetNesteldNameFromGroupID(AGroupID : Integer;var level : Integer ) : String ;
var
  LocalName : String ;
  ParentID : Integer ;
  AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
    AQuery.Connection :=  FConnection ;
    // prevent recursion loop
    If level = 10 then exit ;
    inc(level);
    result := '' ;
    AQuery.sql.Text := ' Select * FROM Groups where WGROUPID = :WGroupId' ;
    AQuery.Params[0].AsInteger := AGroupID ;
    AQuery.open ;
    ParentID := AQuery.FieldByName('WPARENTGROUP2ID').AsInteger ;
    LocalName := AQuery.FieldByName('SDESCRIPTION').AsString ;
   finally
    AQuery.free ;
  end;
    if  ParentID <> 0 then
    result := GetNesteldNameFromGroupID(ParentID,level) ;
    if result = '' then
       result :=  LocalName else
       result := result + '@' + LocalName ;
    dec(level);
end;

function  TOSAConnectionItem.ReadLongReportOp(vfield:String) : String ;
var
 i : Integer ;
 Temp : String ;
begin
  Result:= '' ;
  i := 0 ;
  Temp :=  ReadNwReportOp(vfield+IntToStr(i)) ;
  while  Temp <> '' do
   begin
      Result := Result + Temp ;
      inc(i);
      Temp := ReadNwReportOp(vfield+IntToStr(i)) ;
   end;
end;

Procedure TOSAConnectionItem.WriteLongReportOp(vfield,Value:String);
var
 i : Integer ;
 Temp : String ;
begin
  i := 0 ;
  Temp := ReadNwReportOp(vfield+IntToStr(i)) ;
  while  Temp <> '' do
   begin
      WriteNwReportOp(vfield+IntToStr(i),'');
      inc(i);
      Temp := ReadNwReportOp(vfield+IntToStr(i)) ;
   end;

 i := 0 ;
 Temp := copy(Value,1,35);
 Delete(Value,1,35);
  while  Temp <> '' do
   begin
      WriteNwReportOp(vfield+IntToStr(i),Temp);
      Temp := copy(Value,1,35);
      Delete(Value,1,35);
      inc(i);
   end;
end;


Function TOSAConnectionItem.ReadNwReportOp(vfield:String):Variant;
var
 AQuery : TuniQuery ;
begin
 try
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  AQuery.open ;
  if AQuery.IsEmpty then
    result := '' else
    result := AQuery.FieldByName('SoptionValue').asstring ;
  finally
    AQuery.free ;
  end;
 except
    on e : Exception do
      result := e.message ;
 end;
end;

Function  TOSAConnectionItem.ReadNwReportOp(vfield:String;BValue:Boolean):Variant;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := FConnection ;
  AQuery.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  AQuery.open ;
  if AQuery.IsEmpty then
  begin
     result := BValue ;
  end else
  result:= AQuery.fieldByName('SOptionValue').AsBoolean;
  finally
    AQuery.free ;
  end;
end;

Function  TOSAConnectionItem.ReadNwReportOp(vfield:String;DValue:TDateTime):Variant;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := FConnection ;
  AQuery.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  AQuery.open ;
   if AQuery.IsEmpty then
    begin
      result := DValue
    end else
    begin
    result := StrToDateDef(AQuery.FieldByname('SOptionValue').AsString,DValue) ;
    end;
  finally
    AQuery.free ;
  end;
end;


Function  TOSAConnectionItem.ReadNwReportOp(vfield:String;Value:Integer):Variant;
begin
  Result:= ReadNwReportOp(vfield);
  if VarToStr(result) ='' then
    begin
      Result:= Value;
    end;
end;

Procedure TOSAConnectionItem.WriteNwReportOp(vfield,Value:String);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := FConnection ;
  AQuery.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  AQuery.open ;
  if AQuery.IsEmpty then
     begin
      if value = '' then exit ;
       CreatNwReportOp(vfield,value);
     end else
     begin
      AQuery.Edit;
      AQuery.FieldByName('SOptionValue').AsString := Value;
      AQuery.Post;
     end;
  finally
    AQuery.free ;
  end;
end;

Procedure TOSAConnectionItem.CreatNwReportOp(vfield:String;Value:String);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := FConnection ;
  AQuery.sql.text := 'select * from OPREPORT where 1 = 0' ;
  AQuery.open ;
  AQuery.Append;
  AQuery.FieldByName('WOPTIONID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_OPREP_ID');
  AQuery.FieldByName('StrOption').AsString:=UpperCase(vField);
  AQuery.FieldByName('SOptionValue').AsString:='';
  AQuery.FieldByName('WOptionTypeID').AsString:='0';
  AQuery.Post;
  finally
    AQuery.free ;
  end;
End;



Function  TOSAConnectionItem.ReadNwReportOp(vfield:String;SValue:String):Variant;
begin
  Result:= ReadNwReportOp(vfield);
  if vartoStr(Result) = '' then
     result := SValue ;
end;

procedure TOSAConnectionItem.SetMainAccountLength(const Value: Integer);
begin
  FMainAccountLength := Value;
end;

procedure TOSAConnectionItem.AssignConnectionToChilds(AComponent: TComponent);
var
 i : Integer ;
begin
 for i := 0 to AComponent.ComponentCount -1 do
    begin
       if AComponent.Components[i] is TuniTable then
          (AComponent.Components[i] as TuniTable).Connection := FConnection ;
       if AComponent.Components[i] is TuniQuery then
          (AComponent.Components[i] as TuniQuery).Connection := FConnection ;
       if AComponent.Components[i] is TuniQuery then
          (AComponent.Components[i] as TuniQuery).Connection := FConnection ;
       {if AComponent.Components[i] is TZSequence then
          (AComponent.Components[i] as TZSequence).Connection := FConnection ; }
    end;
end;

function TOSAConnectionItem.GetLocalSaveDir: String;
var
 AIni : TStringList ;
 OwnBaseDir,aFile : String ;
begin
 AIni := TStringList.create ;
 try
   aFile :=  ExtractFilePath(GetModuleName(HInstance))+TDatabaseRegistyRoutines.GetAppValue('ININAME') ;

   if  FileExists(aFile)  then
   begin


   AIni.LoadFromFile(aFile);

   OwnBaseDir := AIni.Values['OWNBASEDIR'] ;
   end;
 finally
   AIni.free ;
 end;

 if FConnection = nil then raise Exception.Create(DMTCCoreLink.GetTextLang(3077){'No connection assigned'});

 if FConnection.Server <> '' then
    begin
      result := ExtractFileDir(FConnection.Database);
      ExcludeTrailingPathDelimiter(Result);
      result := ExtractFilePath(GetModuleName(HInstance))+'localfiles\'+ ExtractFileName(Result) ;
      if OwnBaseDir <> '' then
         result := IncludeTrailingPathDelimiter(OwnBaseDir)+  ExtractFileDir(FConnection.Database) ;
    end
    else result := ExtractFilePath(FConnection.Database);
 Result := IncludeTrailingPathDelimiter(result) ;
 if not DirectoryExists(Result) then
    ForceDirectories(result);
end;

function TOSAConnectionItem.GetNewId(AIdType: TTCIdType): Integer;
var
 fieldName : String ;
 AQuery : TuniQuery ;
begin
 fieldName := TTCIdTypeStr[AIdType] ;
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection := FConnection ;
     AQuery.sql.Text := 'select '  + fieldName + ' from global' ;
     AQuery.Active := true ;
     result := AQuery.Fields[0].AsInteger ;
     AQuery.sql.Text := 'update global set '  + fieldName + ' =' + IntToStr(result+1);
     AQuery.ExecSQL ;
   finally
     AQuery.free ;
   end;

end;

function TOSAConnectionItem.OpenSqlReturnFirstColumn(ASql: String): Variant;
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := FConnection ;
   AQuery.sql.Text := ASql ;
   AQuery.Open ;
   result := AQuery.fields[0].Value ;
 finally
   AQuery.free ;
 end;
end;

procedure TOSAConnectionItem.ExecSql(ASql: String);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := FConnection ;
   AQuery.sql.Text := ASql ;
   AQuery.ExecSQL ;
 finally
   AQuery.free ;
 end;
end;


constructor TOSAConnectionItem.Create(Collection: TCollection);
begin
  inherited;
  FOwnConnection := true ;
  FConnection := TUniconnection.Create(nil);
  FQuery := TuniQuery.Create(nil);
  FQuery.Connection := FConnection ;
  FConnection.AfterConnect := OnConnect ;
end;

destructor TOSAConnectionItem.Destroy;
begin
  if FOwnConnection then
  FConnection.free;
  FQuery.free ;
  inherited;
end;

procedure TOSAConnectionItem.SetAlias(const Value: String);
begin
  FAlias := UpperCase(Value);
end;

procedure TOSAConnectionItem.SetConnection(const Value: TUniconnection);
begin
  FConnection := Value;
end;

procedure TOSAConnectionItem.SetFullname(const Value: String);
begin
  FFullname := Value;
end;

procedure TOSAConnectionItem.SetQuery(const Value: TuniQuery);
begin
  FQuery := Value;
end;

function TOSAConnectionItem.GetSysVar(AColName: String): String;
begin
 result := VarToStr(OpenSqlReturnFirstColumn('select '+ AColName +' from sysvars '));
end;

procedure TOSAConnectionItem.OnConnect(sender: Tobject);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
  AQuery.Connection := FConnection ;
  AQuery.SQL.Text := 'Select SMainAccountcode from account where 1 = 0' ;
  FMainAccountLength := 4 ;
  try
  AQuery.open ;
  FMainAccountLength := AQuery.Fields[0].Size ;
  if FMainAccountLength < 1 then
    begin
    FMainAccountLength := 1 ;
    end ;
   except
      // no handel exception.
      // this must be a other database witch is no problem.
   end;
 finally
  AQuery.free ;
 end ;
end;

procedure TOSAConnectionItem.SetOwnConnection(const Value: boolean);
begin
  FOwnConnection := Value;
end;

end.
