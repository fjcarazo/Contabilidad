(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ConvTOX;
interface

Uses Sysutils,extctrls,classes,  DBAccess , Uni,OSFGeneralRoutines,variants,TCashClasses,dialogs,forms;

Function  ConvertToX(NewVersion : Integer ;Var OutErrorText : String;AMessageRoutine : TOnDialogEvent ) : Boolean;

Function  GetBooksVersion : Integer;


procedure UpdateToNewBatch ;
const
  OSFDatabaseversion = 591 ;
var
 OnUpdate : TOnDialogEvent ;

implementation

uses UDMTCCoreLink, UDMCoreData,NewProgress;


procedure UpdateToNewBatch ;
var
 AQuery : TuniQuery ;
 AList : TStringlist ;
 i :  Integer ;
begin
AList := TStringlist.create ;
try
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := DMTCCoreLink.TheZConnection ;
   DMTCCoreLink.TheZConnection.GetTableNames(AList) ;
   for i := 0 to AList.Count -1 do
     begin
       AQuery.SQL.Text := 'Select * from ' +AList[i] + ' where 1 = 0' ;
       AQuery.open ;
       if (AQuery.FindField('WLINEID') <> nil ) and
          (AQuery.FindField('SREFERENCE') <> nil ) and
          (AQuery.FindField('SACCOUNT') <> nil ) and
          (AQuery.FindField('SDESCRIPTION') <> nil ) and
          (AQuery.FindField('FDEBIT') <> nil ) and
          (AQuery.FindField('FCREDIT') <> nil ) and
          (AQuery.FindField('FAMOUNT') <> nil ) and
          (AQuery.FindField('DALLOCATEDDATE') <> nil ) and
          (AQuery.FindField('WLINKEDID') <> nil ) then
          begin
            // its a batch
            if (AQuery.FindField('DPaymentDate') = nil) then
              begin
                if (AList[i] <> 'TRANSACTASBATCH') and
                   (AList[i] <> 'V_TRANSACTASBATCHWITHTRANSID') and
                   (AList[i] <> 'V_TRANSACTTAXENTRIES')then
                begin
                  DMTCCoreLink.ExecSql('Alter table ' + AList[i] +' add DPaymentDate timestamp, add WDOCID Integer');
                end;
              end;
            end

     end;
 finally
  AQuery.free ;
 end;
finally
 AList.free ;
end;
end;
Function AlterTable(TableName,FieldAddSQL:String):Boolean;
begin
result := OSFGeneralRoutines.TDataBaseRoutines.ExecSql('Alter Table '
         + TableName +' '+ FieldAddSQL) <> -1 ;
end;


Function GetBooksVersion : Integer;
var
 Text : String ;
begin
  Text :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select Wversion from SYSVARS')) ;
  if Text = '' then
   begin
   Text :=  VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select count(*) from SYSVARS')) ;
     // add row in sysvars
    if Text = '0' then
     DMTCCoreLink.ExecSql('INSERT INTO SYSVARS (SCOMPANYNAME, WVERSION, WSYSVARSID  ) VALUES ('+QuotedStr('YOUR COMPANY NAME')+', 0, 1)' );
     Text :='0' ;
   end ;
  Result:= StrToIntDef(Text,0);
end;



Function ConvertToX(NewVersion : Integer;Var OutErrorText : String;AMessageRoutine : TOnDialogEvent ):Boolean;
Var
 Bookversion   : Integer ;
 TempStr,TempStr2 : String ;
 aDMCoreData : TDMCoreData ;
 AProgress : TfmNewProgress ;
{ Procedure RunScript ;
 var
  localparcer : TUniScript;
 begin
  localparcer := TUniScript.Create(self);
  try
   localparcer.SQL.Text :=  aDMCoreData.ZSQLProc.SQL.Text ;
   localparcer.Delimiter
  finally
    localparcer.free ;
  end;
 end; }

 procedure StdCheckAndPatch(AVer:Integer;APatch:String);
 begin
  if Bookversion < AVer then
     begin
       AProgress.SetProgress('running Patch ' + APatch,AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running ' + APatch) ;
       try
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName(APatch);
       aDMCoreData.ZSQLProc.SQL.Text := TDatabaseTableRoutines.ReplaceParams(aDMCoreData.ZSQLProc.SQL.Text,'MAINACCOUNTCODE='+ IntToStr(DMTCCoreLink.MainAccountLength)+#13+#10 +'ACCOUNTCODE='+ IntToStr(DMTCCoreLink.MainAccountLength +3));

       if aDMCoreData.ZSQLProc.SQL.Text = '' then
          raise Exception.Create(APatch +' Error file not found!');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
        except
          AProgress.SetProgress('Error running Patch ' + APatch,AProgress.Gauge1.Progress+1);
          if Assigned(OnUpdate) then
             OnUpdate('Error running ' + APatch) ;
        end;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 end;


begin
 Result:=True;
Bookversion := GetBooksVersion ;
aDMCoreData := TDMCoreData.create(nil) ;
try

DMTCCoreLink.InitFieldLengths ;


If Bookversion < NewVersion then
  begin
  AProgress := TfmNewProgress.Create(application) ;
 try
 AProgress.initProgress('Update database version '+IntToStr(Bookversion) + ' to ' + IntToStr(NewVersion),NewVersion-Bookversion);

   try
     if Bookversion < 501 then
     begin

     AProgress.SetProgress('running 501',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch1') ;
     aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
     aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch1');
     aDMCoreData.ScriptErrorList := '' ;
     aDMCoreData.ZSQLGenProccessor.Execute ;
     if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

     DMTCCoreLink.TheZConnection.Disconnect ;
     DMTCCoreLink.TheZConnection.Connect ;
     end;
     if Bookversion < 502 then
     begin
     AProgress.SetProgress('running Patch 502',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch2') ;
     aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
     aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch2');
     aDMCoreData.ScriptErrorList := '' ;
     aDMCoreData.ZSQLGenProccessor.Execute ;
     if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);


      aDMCoreData.ZqGen.SQL.Text := 'select max(RECORDID)+1 from CONTACTS';
      aDMCoreData.ZqGen.open ;
      TempStr := IntToStr(aDMCoreData.ZqGen.Fields[0].AsInteger) ;
      aDMCoreData.ZqGen.Close ;
      aDMCoreData.ZqGen.SQL.Text := 'SET GENERATOR GEN_CONTACTS_ID TO ' + TempStr;
      aDMCoreData.ZqGen.ExecSQL ;
     DMTCCoreLink.TheZConnection.Disconnect ;
     DMTCCoreLink.TheZConnection.Connect ;
     end;
     if Bookversion < 503 then
     begin
     AProgress.SetProgress('running Patch 503',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch 503') ;
     aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
     aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch3');
     aDMCoreData.ScriptErrorList := '' ;
     aDMCoreData.ZSQLGenProccessor.Execute ;
     if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

     DMTCCoreLink.TheZConnection.Disconnect ;
     DMTCCoreLink.TheZConnection.Connect ;
     end;
     if Bookversion < 504 then
     begin
     AProgress.SetProgress('running Patch 504',AProgress.Gauge1.Progress+1);
     // generators create
     if Assigned(OnUpdate) then
        OnUpdate('running Patch 504') ;
     aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
     aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch4');
     aDMCoreData.ScriptErrorList := '' ;
     aDMCoreData.ZSQLGenProccessor.Execute ;
     if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

     DMTCCoreLink.TheZConnection.Disconnect ;
     DMTCCoreLink.TheZConnection.Connect ;
     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WAccountId)+1 from Account')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_ACCOUNTID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WBACKORDERID)+1 from BACKORD')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_BACKORDERID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WBATCHTYPEID)+1 from BATTYPES')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_BATCHTYPEID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WBATCHID)+1 from BATCON')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_BATCHID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WGROUPID)+1 from GROUPS')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_GROUPID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WCURRENCYID)+1 from CURRENCY')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_CURRENCYID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WDOCID)+1 from DOCHEAD')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_DOCID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WLABSPECSID)+1 from LABSPECS')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_LABSPECSID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WREPORTID)+1 from REPHEAD')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_REPORTID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WTRANSACTIONID)+1 from TRANSACT')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_TRANSACTIONID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

      TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WSTOCKID)+1 from STOCK')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_STOCKID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WUNITID)+1 from UNIT')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_UNITID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

      TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WUSERID)+1 from USERS')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_USERID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

      TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WMESSAGEID)+1 from MESSAGES')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_MESSAGEID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

      TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WSTOCKTRANSACTIONID)+1 from STOCKTRN')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_STOCKTRANSID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

      TempStr := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WOILINKSID)+1 from OILINKS')) ;
     TDataBaseRoutines.ExecSql('SET GENERATOR GEN_OILINKS_ID TO ' + IntToStr(StrToIntDef(TempStr,1))) ;

     {   GEN_ACCOUNTID
         GEN_CONTACT_ID
         GEN_BACKORDERID
         GEN_BATCHTYPEID
         GEN_BATCHID
         GEN_GROUPID
         GEN_CURRENCYID
         GEN_DOCID
         GEN_LABSPECSID
         GEN_REPORTID
         GEN_TRANSACTIONID
         GEN_STOCKID
         GEN_UNITID
         GEN_USERID
         GEN_MESSAGEID
         GEN_STOCKTRANSID ;}
         TDataBaseRoutines.ExecSql('CREATE TABLE ACCOUNTREF ( WACCOUNTREFID  INTEGER,'+
         '  SREFERENCE  varChar(35),  WACCOUNTID INTEGER )') ;
         TDataBaseRoutines.ExecSql('CREATE GENERATOR GEN_ACCOUNTREF_ID') ;

     DMTCCoreLink.TheZConnection.Disconnect ;
     DMTCCoreLink.TheZConnection.Connect ;
     end;
     if Bookversion < 505 then
     begin
         AProgress.SetProgress('running Patch 505',AProgress.Gauge1.Progress+1);

         TDataBaseRoutines.ExecSql('update Sysvars set WVersion=505') ;
         TDataBaseRoutines.ExecSql('update RESOURCES set DESCRIPTION = ' + QuotedStr('osFinancials'));
     end;
     if Bookversion < 506 then
     begin

         TDataBaseRoutines.ExecSql('update Sysvars set WVersion=506') ;
         TDataBaseRoutines.ExecSql('ALTER TABLE DNLBANKS ADD SEXTRADESCRIPTION varChar(255);');
     end;
     if Bookversion < 507 then
     begin
        AProgress.SetProgress('running Patch 507',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch5') ;
        aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
       aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch5');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLGenProccessor.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=507') ;
     end;
     if Bookversion < 508 then
     begin
        AProgress.SetProgress('running Patch 508',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch6') ;
       aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
       aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch6');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLGenProccessor.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=508') ;
     end;
     if Bookversion < 511 then
     begin
        AProgress.SetProgress('running Patch 511',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch7') ;
       aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
       aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch7');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLGenProccessor.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       if Assigned(OnUpdate) then
        OnUpdate('running Patch8') ;
       aDMCoreData.ZSQLGenProccessor.Delimiter := ';'  ;
       aDMCoreData.ZSQLGenProccessor.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch8');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLGenProccessor.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=511') ;
     end;
     if Bookversion < 512 then
     begin
       AProgress.SetProgress('running Patch 512',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch9') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch9');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
         if assigned(AMessageRoutine) then
           AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=512') ;
     end;
     if Bookversion < 513 then
     begin
        AProgress.SetProgress('running Patch 513',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch10') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch10');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=513') ;
     end;
     if Bookversion < 514 then
     begin
        AProgress.SetProgress('running Patch 514',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch11') ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch11');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch11B');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=514') ;
     end;
 if Bookversion < 515 then
     begin
       AProgress.SetProgress('running Patch 515',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch12') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch12');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=515') ;
     end;
 if Bookversion < 516 then
     begin
      AProgress.SetProgress('running Patch 516',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('running Patch13') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch13');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       UpdateToNewBatch ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=516') ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
if Bookversion < 517 then
     begin
      AProgress.SetProgress('running Patch 517',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('running Patch14') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch14');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
if Bookversion < 518 then
     begin
        AProgress.SetProgress('running Patch 518',AProgress.Gauge1.Progress+1);
        if Assigned(OnUpdate) then
        OnUpdate('running Patch15') ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch15');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
if Bookversion < 519 then
     begin
       AProgress.SetProgress('running Patch 519',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch16') ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch16');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
if Bookversion < 520 then
     begin
       AProgress.SetProgress('running Patch 520',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch17') ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch17');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 521 then
     begin
       AProgress.SetProgress('running Patch 521',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch18') ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch18');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 522 then
     begin
       AProgress.SetProgress('running Patch 522',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch19') ;
      aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch19');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 523 then
     begin
       AProgress.SetProgress('running Patch 523',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch20') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch20');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 524 then
     begin
      AProgress.SetProgress('running Patch 524',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('running Patch21') ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch21');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 525 then
     begin
       AProgress.SetProgress('running Patch 525',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch22') ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch22');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 526 then
     begin
       AProgress.SetProgress('running Patch 526',AProgress.Gauge1.Progress+1);
       if Assigned(OnUpdate) then
        OnUpdate('running Patch23') ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch23');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
 if Bookversion < 527 then
     begin
      AProgress.SetProgress('running Patch 527',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('running Patch24') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch24');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
  if Bookversion < 528 then
     begin
      AProgress.SetProgress('running Patch 528',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch25') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch25');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
  if Bookversion < 529 then
     begin
      AProgress.SetProgress('running Patch 529',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch26') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch26');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;
  if Bookversion < 530 then
     begin
     AProgress.SetProgress('running Patch 530',AProgress.Gauge1.Progress+1);
     if Assigned(OnUpdate) then
        OnUpdate('running Patch27') ;
        aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('patch27');
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;


  StdCheckAndPatch(531,'patch28');
  if Bookversion < 532 then
     begin
        AProgress.SetProgress('running Patch 532',AProgress.Gauge1.Progress+1);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       if not TDataBaseRoutines.TableExist('ACCOUNTREF') then
         TDataBaseRoutines.ExecSql('CREATE TABLE ACCOUNTREF( WACCOUNTREFID Integer,  SREFERENCE varChar(35),  WACCOUNTID Integer);') ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=532') ;
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;

  if Bookversion < 533 then
     begin
         AProgress.SetProgress('running Patch 533',AProgress.Gauge1.Progress+1);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       aDMCoreData.ZSQLProc.SQL.Text := 'delete from tax where Waccountid not in (select account.WAccountid  from account);';
       aDMCoreData.ScriptErrorList := '' ;
       aDMCoreData.ZSQLProc.Execute ;
       if aDMCoreData.ScriptErrorList <> '' then
       if assigned(AMessageRoutine) then
         AMessageRoutine(aDMCoreData.ScriptErrorList);
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       StdCheckAndPatch(533,'patch29');
     end;



  StdCheckAndPatch(534,'patch30');
  StdCheckAndPatch(535,'patch31');
  StdCheckAndPatch(536,'patch32');
  StdCheckAndPatch(537,'patch33');
  StdCheckAndPatch(538,'patch34');
  StdCheckAndPatch(539,'patch35');
  StdCheckAndPatch(540,'patch36');
  StdCheckAndPatch(541,'patch37');
  StdCheckAndPatch(542,'patch38');
  StdCheckAndPatch(543,'patch39');
  StdCheckAndPatch(544,'patch40');
  StdCheckAndPatch(545,'patch41');
  StdCheckAndPatch(546,'patch42');
  StdCheckAndPatch(547,'patch43');
  StdCheckAndPatch(548,'patch44');
  StdCheckAndPatch(549,'patch45');
  StdCheckAndPatch(550,'patch46');
  StdCheckAndPatch(551,'patch47');
  StdCheckAndPatch(552,'patch48');
  StdCheckAndPatch(553,'patch49');
  StdCheckAndPatch(554,'patch50');
 if Bookversion < 555 then
     begin
      AProgress.SetProgress('running Patch 555',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('running databasever 555') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       TDataBaseRoutines.ExecSql('Create generator GEN_BOMID');
       TDataBaseRoutines.ExecSql('ALTER SEQUENCE GEN_BOMID RESTART WITH '+ VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select coalesce(max(WBOMID),0) +1 from Bom')));
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=555');


       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;

  StdCheckAndPatch(556,'patch51');
  StdCheckAndPatch(557,'patch52');
  StdCheckAndPatch(558,'patch53');

   if Bookversion < 559 then
     begin
       AProgress.SetProgress('running Patch 559',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('Update to 559') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       DMTCCoreLink.ExecSql('SET GENERATOR GEN_OPREP_ID TO ' + IntToStr(StrToIntDef( VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select max(Woptionid) +1 from opreport')),1)));


       TempStr := IntToStr(StrToIntDef(VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select max(WOILINKSID) from OILINKS')),0) +1 ) ;
       TDataBaseRoutines.ExecSql('SET GENERATOR GEN_OILINKS_ID TO ' +  TempStr ) ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=559') ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
     end;

    StdCheckAndPatch(560,'patch54');
    StdCheckAndPatch(561,'patch55');
   if Bookversion < 562 then
     begin
       AProgress.SetProgress('running Patch 562',AProgress.Gauge1.Progress+1);
      if Assigned(OnUpdate) then
        OnUpdate('Update to 562') ;

       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       //aDMCoreData.ZSQLProc.ParamCheck := false ;
       aDMCoreData.ZSQLProc.SQL.Text := 'set term ^;CREATE PROCEDURE P_TAXFORDDOC ( DOCID Integer ) ' +
       ' RETURNS (  WLINEID Integer,    WACCOUNTID Integer,    SACCOUNTCODE Varchar(15),    SDESCRIPTION Varchar(60), '+
       '  FRATE Numeric(12,2),    EXCLAMT Numeric(12,2),    INCAMT Numeric(12,2),    TAXAMT Numeric(12,2) ) AS '+
       ' DECLARE VARIABLE lineid integer; BEGIN lineid = 0 ; FOR  Select Account.Waccountid, Account.SAccountCode, '+
       ' Account.SDescription, tax.FRate, sum(FEXCLUSIVEAMT) exclAmt,sum(FINCLUSIVEAMT) IncAmt,Sum(FTAXAMOUNT) TaxAmt '+
       ' from docline left join account on (docline.WTaxID = account.WAccountID) left join tax on (docline.WTaxID = tax.WAccountID) '+
       ' where docline.WDocId=:docid and docline.WLINETYPEID <> 91 Group by Account.Waccountid,Account.SAccountCode, Account.SDescription, '+
       ' tax.FRate order by Account.Waccountid ' +
       ' into :Waccountid,:SAccountCode,:SDescription,:FRate,:exclAmt,:IncAmt,:TaxAmt do BEGIN  '+
       ' lineid = lineid +1 ;  wlineid = lineid ; SUSPEND; END END^' ;
       aDMCoreData.ZSQLProc.Execute ;
       TDataBaseRoutines.ExecSql('update UNIT set FUNITQTY = 1') ;
       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=562') ;
       // aDMCoreData.ZSQLProc.ParamCheck := false ;
     end;
     StdCheckAndPatch(563,'patch56');
     StdCheckAndPatch(564,'patch57');
     StdCheckAndPatch(565,'patch58');
     StdCheckAndPatch(566,'patch59');
     StdCheckAndPatch(567,'patch60');
     StdCheckAndPatch(568,'patch61');
     StdCheckAndPatch(569,'patch62');
     StdCheckAndPatch(570,'patch63');
     StdCheckAndPatch(571,'patch64');
     StdCheckAndPatch(572,'patch65');
     StdCheckAndPatch(573,'patch66');
     StdCheckAndPatch(574,'patch67');
     StdCheckAndPatch(575,'patch68');
     if Bookversion < 578 then
      begin
       aDMCoreData.ZSQLProc.Delimiter := ';'  ;
       // aDMCoreData.ZSQLProc.ParamCheck := false ;
       aDMCoreData.ZSQLProc.SQL.Text := 'DROP VIEW V_ACCOUNT;DROP VIEW V_BATTYPES;';
       aDMCoreData.ZSQLProc.Execute ;
       aDMCoreData.ZSQLProc.SQL.Text := 'DROP VIEW V_TYPES;DROP VIEW V_BATCHTYPES;';
       aDMCoreData.ZSQLProc.Execute ;
       aDMCoreData.ZSQLProc.SQL.Text := 'DROP VIEW V_GROUPS;DROP PROCEDURE GETUSERLANG;';
       aDMCoreData.ZSQLProc.Execute ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       aDMCoreData.ZSQLProc.SQL.Text := 'set term ^;CREATE PROCEDURE GETUSERLANG  RETURNS ( WLANGUAGEID Integer ) '+
       ' AS DECLARE VARIABLE WUserID integer ; BEGIN Select first 1 WUSERID  from LOGGEDIN '+
       ' where  LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION into :WUserID   ; if (Wuserid is null) then ' +
       '   Select first 1 WUSERID  from users into :WUserID   ; SELECT first 1  a.SPARAMVALUE FROM SYSPARAMS a where a.SPARAMNAME = ' +
       QuotedStr('CBUSERLANG') + ' and Wuserid = :WUserID into   :WLANGUAGEID ; IF (WLANGUAGEID is null) then '+
       ' WLANGUAGEID = 0 ;  SUSPEND; END^' ;

       aDMCoreData.ZSQLProc.Execute ;
       DMTCCoreLink.TheZConnection.Disconnect ;
       DMTCCoreLink.TheZConnection.Connect ;
       StdCheckAndPatch(578,'patch69');

      end;
     StdCheckAndPatch(579,'patch70');
     StdCheckAndPatch(580,'patch71');
     StdCheckAndPatch(581,'patch72');
     StdCheckAndPatch(583,'patch73');
     if Bookversion < 584 then
     begin
   //  TempStr2 := DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT first 1  a.RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS a where a.RDB$RELATION_NAME ='+QuotedStr('ABREVIAT')+' order by 1   '   ) ;
   //  if TempStr2 <> '' then
   //  DMTCCoreLink.ExecSql('ALTER TABLE ABREVIAT DROP CONSTRAINT ' +TempStr2);
     TempStr2 := varToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT first 1 skip 1  a.RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS a where a.RDB$RELATION_NAME ='+QuotedStr('ABREVIAT')+' order by 1   '   ) );
     if TempStr2 <> '' then
     DMTCCoreLink.ExecSql('ALTER TABLE ABREVIAT DROP CONSTRAINT ' +TempStr2);
            DMTCCoreLink.ExecSql('ALTER TABLE ABREVIAT ALTER CKEY TYPE Char(10)');
            DMTCCoreLink.ExecSql('update ABREVIAT set CKEY = Trim(ckey)');
            DMTCCoreLink.ExecSql('UPDATE RDB$RELATION_FIELDS SET RDB$NULL_FLAG = 1 WHERE RDB$FIELD_NAME = '+QuotedStr('CKEY')+' AND RDB$RELATION_NAME = '+QuotedStr('ABREVIAT'));

            DMTCCoreLink.ExecSql('alter table ABREVIAT add constraint PK_ABREVIAT primary key (CKEY)');
            TDataBaseRoutines.ExecSql('update Sysvars set WVersion=584') ;
     end;
     StdCheckAndPatch(585,'patch74');
     StdCheckAndPatch(586,'patch75');
     StdCheckAndPatch(587,'patch76');
     if Bookversion < 588 then
     begin
   //  TempStr2 := DMTCCoreLink.OpenSqlReturnFirstColumn('SELECT first 1  a.RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS a where a.RDB$RELATION_NAME ='+QuotedStr('ABREVIAT')+' order by 1   '   ) ;
   //  if TempStr2 <> '' then
   //  DMTCCoreLink.ExecSql('ALTER TABLE ABREVIAT DROP CONSTRAINT ' +TempStr2);
      if not TDatabaseTableRoutines.FieldExists('DOCLINE','FUNITQTY') then
         DMTCCoreLink.ExecSql('ALTER TABLE DOCLINE add  FUNITQTY Numeric(12,8)' );

       TDataBaseRoutines.ExecSql('update Sysvars set WVersion=588') ;
     end;
     StdCheckAndPatch(589,'patch77');
     StdCheckAndPatch(590,'patch78');
     StdCheckAndPatch(591,'patch79');
   except
     Result:=False;
   end;


  finally
     AProgress.free ;
  end;
  end;
  Finally
     aDMCoreData.free ;
  end;

end;


end.


