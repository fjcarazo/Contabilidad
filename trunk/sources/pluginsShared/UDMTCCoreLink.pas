(*
  Id: UDMTCCoreLink.pas,v 1 2006/09/01 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
unit UDMTCCoreLink;

interface

uses
  SysUtils,windows, Classes, DB, DBTables,forms,dialogs, TcashClasses,DBAccess , Uni,
    UConnectionClass,
  ImgList, Controls, graphics,  DASQLMonitor, UniSQLMonitor,
  MemDS;

Const
  glosfDocInv = 10 ;
  glosfDocCr = 11 ;
  glosfDocPur = 12 ;
  glosfDocRet = 13 ;
  glosfDocQuote = 14 ;
  glosfDocOrder = 15 ;
  glosfDocStkOut = 16 ;
  glosfDocStkIn  = 17 ;
  glosfDocProd  = 18 ;
  glosfDocDis  = 19 ;

  // glosfDocAddStk : set of integer = (glosfDocCr,glosfDocPur,glosfDocOrder,glosfDocStkIn,glosfDocDis);
type

  TDMTCCoreLink = class(TDataModule)
    ZDesignConnectionPleaseDonotuse: TUniconnection;
    tblOpReport: TuniQuery;
    ZUSQLOpReport: TUniUpdateSql;
    tblSysParams: TuniQuery;
    ZUSQLSysparams: TUniUpdateSql;
    ImageList1: TImageList;
    ZQLoggedin: TuniQuery;
    ZUSQLLogin: TUniUpdateSql;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblOpReportAfterInsert(DataSet: TDataSet);
    procedure tblSysParamsAfterInsert(DataSet: TDataSet);
    procedure ZDesignConnectionPleaseDonotuseAfterConnect(Sender: TObject);
  private
    FAApplication: TComponent;
    FMainAccountLength : Integer ;
    FTheGlobalDataObject: TGlobalDataObject;
    FTheZConnection: TUniconnection;
    FMessageLength: Integer;
    FTheOSAConnectionItem: TOSAConnectionItem;
    FSQLList: TSQLList;
    Fcurrentuser: integer;
    FCurrentTheme: String;
    FGlobalSqlPrefix: String;
    FDebtorsControlAccountid: Integer;
    FCreditorsControlAccountid: Integer;
    FRetaindIncomeControlAccountid: Integer;
    FExtraOptions: TStringlist;
    FGroupsObject: TGroupRecList;
    FAccObject: TAccountRecList;
    FstockObject: TStockRecList;
    FDescObject: TDescriptionRecList;
    procedure SetAApplication(const Value: TComponent);
    procedure SetMainAccountLength(const Value: Integer);
    procedure SetTheGlobalDataObject(const Value: TGlobalDataObject);
    procedure SetTheZConnection(const Value: TUniconnection);
    procedure SetMessageLength(const Value: Integer);
    procedure SetTheOSAConnectionItem(const Value: TOSAConnectionItem);
    procedure SetSQLList(const Value: TSQLList);
    procedure CreatSysParamRec(vfield:String;UserID:integer=0;WTypeID:Integer=0);
    procedure Setcurrentuser(const Value: integer);
    procedure SetCurrentTheme(const Value: String);
    procedure SetGlobalSqlPrefix(const Value: String);
    procedure SetCreditorsControlAccountid(const Value: Integer);
    procedure SetDebtorsControlAccountid(const Value: Integer);
    procedure SetRetaindIncomeControlAccountid(const Value: Integer);
    procedure SetExtraOptions(const Value: TStringlist);
    Procedure CreatNwReportOp(vfield:String);
    procedure SetGroupsObject(const Value: TGroupRecList);
    procedure SetAccObject(const Value: TAccountRecList);
    procedure SetDescObject(const Value: TDescriptionRecList);
    function GetCurrentThemePath: String;





    { Private declarations }
  public
    SimpleMode : integer ;
    Property ExtraOptions : TStringlist  read FExtraOptions write SetExtraOptions;
    function GetTextLangNoAmp(MsgID: Integer): String;

    function GetTextLangDef(var MsgID: Integer;Default : String): String;
    procedure LoadT3Glyph(aListImage:TImageList;Index :Integer ;aFileName:String;ResizeTo : Integer = 32;UseDefault : Boolean = false);

    function IsRegistered(APluginString: String): boolean;
    function IsRegisteredGetDate(APluginString: String;  var ADate: TDatetime;Var MessageText : String): boolean;
    Function GetTimeAndTrail(APluginString : String ; Var aTime : String ) : String;
    function GetOrgPluginsString(AString : String) : String ;
    function AddRegister(APluginString: String): boolean;
    property TheGlobalDataObject : TGlobalDataObject  read FTheGlobalDataObject write SetTheGlobalDataObject;
    property AApplication : TComponent  read FAApplication write SetAApplication;
    property TheZConnection : TUniconnection  read FTheZConnection write SetTheZConnection;
    property TheOSAConnectionItem : TOSAConnectionItem  read FTheOSAConnectionItem write SetTheOSAConnectionItem;
    function GetTextLang(MsgID: Integer): String;
    function GetTextNum(Atrans : String ): Integer;
    function GetAddTextNum(atrans : String ) : Integer ;
    property MainAccountLength : Integer  read FMainAccountLength write SetMainAccountLength;

    property DebtorsControlAccountid : Integer  read FDebtorsControlAccountid write SetDebtorsControlAccountid;
    property CreditorsControlAccountid : Integer  read FCreditorsControlAccountid write SetCreditorsControlAccountid;
    property RetaindIncomeControlAccountid : Integer  read FRetaindIncomeControlAccountid write SetRetaindIncomeControlAccountid;
    property MessageLength : Integer   read FMessageLength write SetMessageLength;

    function GetPersistentProp(const AName: string; aPersistent: TPersistent): Variant;
    procedure SetPersistentProp(const AName: string; aPersistent: TPersistent; Value: Variant);
    procedure AssignConnectionToChilds(AComponent : TComponent) ;
    procedure loadGlobalObject ;
    procedure ReinitCustomLang ;

    procedure UpdateTheme ;
    function GetLocalSaveDir : String ;
    class function GetLocalPluginDir : String ;
    class function GetLocalBaseDir: String;

    Function GetNewId(AIdType : TTCIdType ) : Integer ;
    function GetNewIdStr(AIdType: String): Integer;
    function GetNewidByMaxPlusOne(ATable, AField: String): Integer;
    procedure LogAction (aAction : String;AId:Integer ;AMessage : String);

    Function  ReadNwReportOp(vfield:String):Variant;Overload;
    Function  ReadNwReportOp(vfield:String;BValue:Boolean):Variant;Overload;

    Function  ReadNwReportOp(vfield:String;SValue:String):Variant;Overload;
    Function  ReadNwReportOp(vfield:String;Value:Integer):Variant;Overload;
    function  ReadLongReportOp(vfield: String): String;
    procedure WriteLongReportOp(vfield, Value: String);
    Procedure WriteNwReportOp(vfield,Value:String);
    Function  ReadNwReportOpSaveDate(vfield:String;DValue:TDateTime):Variant;
    Function  WriteNwReportOpSaveDate(vfield:String;Value:TDateTime):Variant;



    Function  ReadSysParam(Default:double ;vfield:String ;UserID:Integer ;AType:Integer=0):variant;Overload;
    Function  ReadSysParam(vfield:String;Default:Integer ;UserID:Integer ;AType:Integer=0):variant;Overload;
    Function  ReadSysParam(vfield:String;Default:String  ;UserID:Integer ;AType:Integer=0):variant;overload;
    Function  ReadSysParam(vfield:String;BValue :Boolean ;UserID:Integer ;AType:Integer=0):variant;Overload;
    Function  ReadSysParam(vfield:String;BValue :TDatetime   ;UserID:Integer ;AType:Integer=0):variant;Overload;
    function  ReadLongSysparam(vfield:String;UserID:Integer;AType:Integer=0) : String ;
    Function  InternalReadSysParam(vfield:String;UserID:Integer;AType:Integer):variant;

    Procedure WriteLongSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);
    procedure HandelCheckBatchDiv(BatchId : Integer )   ;
    Procedure WriteSysParam(vfield,Value:String;WUserID:Integer=0;WTypeID:Integer=0);Overload;
    Procedure WriteSysParam(vfield:String;Default:Integer;WUserID:Integer=0;WTypeID:Integer=0);Overload;

    function  OpenSqlReturnFirstColumn(ASql : String ) : Variant ;
    procedure ExecSql(ASql : String )  ;
    function GetSqlByName(ASqlName : String ) : String ;
    function ReadDescription(MessageID: Integer): String;
    function GetAddDescription(aDescription : String;Unique: Boolean = false) : Integer;
    procedure UpdateDescription(MessageID:Integer ; aDescription : String);

    function GetPeriodDescription (APeriodId : Integer) : String ;
    function ReadSysVar ( AVar : String) : String ;
    function GetLangTrans(ALangId : Integer ;Alang : String ) : String ;
    function GetFieldLength(ATable , AField : String) : Integer ;
    procedure InitFieldLengtsForDatasetfields(ADataSet : TDataSet ; ASql : String ) ;
    function  DeleteOrderBy (AString : String ) : String ;
    procedure InitFieldLengths;
    procedure LoadSqlList;
    property SQLList: TSQLList read FSQLList write SetSQLList;

    property currentuser : integer  read Fcurrentuser write Setcurrentuser;
    property GlobalSqlPrefix : String  read FGlobalSqlPrefix write SetGlobalSqlPrefix;
    procedure CloseUserConnection ;
    property CurrentTheme : String  read FCurrentTheme write SetCurrentTheme;
    property CurrentThemePAth : String  read GetCurrentThemePath ;
    procedure LoadImage(ABitmap : Graphics.TBitmap;AImage : String ;Prefsize : Integer = 16);
    function LoadImagename(AImage: String): String ;
    procedure Icon2Bmp(Size: Integer; IconName: String; bmp: TBitMap);
    procedure LoadIconImage(AIcon: TIcon; AImage: String);
    property GroupsObject : TGroupRecList  read FGroupsObject write SetGroupsObject;
    property AccObject : TAccountRecList   read FAccObject write SetAccObject;
    property DescObject : TDescriptionRecList  read FDescObject write SetDescObject;

    property stockObject: TStockRecList read FstockObject Write FstockObject ;
    function GetGenUniSyntax(Genname : String ) : String ;
    function GetGenUniSyntaxShort(Genname : String ) : String ;
 end;

var
  DMTCCoreLink: TDMTCCoreLink;
  glScaleByPerc : Double = 1 ;
  glTextScaleBy : Double = 1 ;
  glLastMouseWeel : Cardinal ;


implementation

uses Typinfo,variants,math,OSFGeneralRoutines, StrUtils,UniScript;

{$R *.dfm}

{ TDMBatch }



Procedure TDMTCCoreLink.LoadT3Glyph(aListImage:TImageList;Index :Integer ;aFileName:String;ResizeTo : Integer = 32;UseDefault : Boolean = false);
Var
  ABmp,BBmp : TBitmap ;
  aImage:TIcon ;
  TempFilename : String ;
  procedure CheckAdd(MyBmp : TBitmap) ;
  begin
   if MyBmp <> nil then
    while aListImage.Count <= Index do
         aListImage.Add(MyBmp,MyBmp) ;
  end;
    procedure CheckAddico(MyBmp : TIcon) ;
  begin
   if MyBmp <> nil then
    while aListImage.Count <= Index do
         aListImage.AddIcon(MyBmp) ;
  end;
Begin
try
   TempFilename := aFileName ;
  aFileName := CurrentThemePAth + aFileName;
  if self.TheZConnection.Connected then
    begin
    if FileExists(GetLocalSaveDir + TempFilename) then
       aFileName := GetLocalSaveDir + TempFilename else
    if FileExists(GetLocalSaveDir + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := GetLocalSaveDir + ChangeFileExt(TempFilename,'.bmp') ;
   if not FileExists(aFileName) then
    if FileExists(CurrentThemePAth + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := CurrentThemePAth + ChangeFileExt(TempFilename,'.bmp') ;
   end else
   begin
   if not FileExists(aFileName) then
    if FileExists(CurrentThemePAth + ChangeFileExt(TempFilename,'.bmp')) then
       aFileName := CurrentThemePAth + ChangeFileExt(TempFilename,'.bmp') ;

   end;
    if not FileExists(aFileName) then
       aFileName := CurrentThemePAth + ChangeFileExt(aFileName,'.ico') ;
    if not FileExists(aFileName) then
       aFileName := ExtractFilePath(Application.ExeName)+'Bin\themes\Classic\'+ TempFilename;
    if not FileExists(aFileName) then
       aFileName := ChangeFileExt(aFileName,'.bmp') ;
    if not FileExists(aFileName) then

       aFileName := ChangeFileExt(aFileName,'.bmp') ;

    if UseDefault then
       if not FileExists(aFileName) then
         aFileName := ExtractFilePath(Application.ExeName)+'Bin\themes\Classic\B40.bmp'  ;


    if not FileExists(aFileName) then
       exit ;

    if uppercase(ExtractFileExt(aFileName)) ='.ICO'then
     begin

      aImage := TIcon.Create ;
        try
         aImage.transparent := True ;
         aImage.Width := ResizeTo ;
         aImage.Height := ResizeTo ;
         aImage.LoadFromFile(aFileName);
         aImage.transparent := True ;
       try
         CheckAddico(aImage) ;
       if Index <> -1 then
           aListImage.ReplaceIcon(Index,aImage)
           else
           aListImage.AddIcon(aImage);
        except
              ABmp := TBitmap.Create ;
       Try
         ABmp.Width := ResizeTo ;
         ABmp.Height := ResizeTo ;

         Icon2Bmp(ResizeTo,aFileName,ABmp);
         CheckAdd(ABmp) ;
          if Index <> -1 then
           aListImage.ReplaceMasked(Index,ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1] )
           else
           aListImage.AddMasked(ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1] ) ;

         CheckAdd(ABmp) ;
        Finally
        ABmp.Free ;

       end;
        end;

       Finally
        aImage.Free ;

       end;
     end else
     begin
       ABmp := TBitmap.Create ;
        try
         ABmp.LoadFromFile(aFileName);
         if ABmp.Width  <> ResizeTo then
          begin
           BBmp := TBitmap.Create ;
              try
              BBmp.Width := ResizeTo ;
              BBmp.Height := ResizeTo ;
              BBmp.PixelFormat :=pf32bit ;
              BBmp.Canvas.StretchDraw(rect(0, 0,ResizeTo,ResizeTo),ABmp);
              CheckAdd(BBmp) ;

              aListImage.Replace(Index,BBmp,nil) ;

                finally
                   BBmp.Free ;
                end;
          end else
          begin
           CheckAdd(ABmp) ;
           ABmp.TransparentColor := ABmp.Canvas.Pixels[0,ABmp.height-1] ;
           ABmp.Transparent := true ;

            aListImage.ReplaceMasked(Index,ABmp,ABmp.Canvas.Pixels[0,ABmp.height-1]) ;
          end;
        finally
           ABmp.Free ;
        end;
     end ;
  except
  end;

end;

procedure TDMTCCoreLink.LoadSqlList;
Var
 ASearchRec : TSearchRec ;
 aItem : TSqlCollectionItem ;
begin
  
    if FindFirst(ExtractFilePath(Application.ExeName) +'Bin\SQL\FIREBIRD\*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      try
      repeat

        aItem := FSQLList.SQLCollection.add ;
        aItem.SQL.LoadFromFile(ExtractFilePath(Application.ExeName) +'Bin\SQL\FIREBIRD\'+ASearchRec.name);
        aItem.Name := ChangeFileExt(ASearchRec.name,'');

      until FindNext(ASearchRec) <> 0;
      finally
      sysutils.FindClose(ASearchRec);
      end;
    end;
    // add / replace others
    if ExtractFilePath(Application.ExeName)  <> GetLocalBaseDir then

    if FindFirst(GetLocalBaseDir +'Bin\SQL\FIREBIRD\*.txt', faAnyFile, ASearchRec) = 0 then
    begin
      try
      repeat
       if FSQLList.SQLCollection.GetItemByName(ChangeFileExt(ASearchRec.name,'')) <> nil then
        begin
       //  if FSQLList.GetFormatedSQLByName(ChangeFileExt(ASearchRec.name,'')) <> '' then
           FSQLList.SQLCollection.GetItemByName(ChangeFileExt(ASearchRec.name,'')).SQL.LoadFromFile(GetLocalBaseDir +'Bin\SQL\FIREBIRD\'+ASearchRec.name);
        end else
        begin
            aItem := FSQLList.SQLCollection.add ;
            aItem.SQL.LoadFromFile(GetLocalBaseDir +'Bin\SQL\FIREBIRD\'+ASearchRec.name);
            aItem.Name := ChangeFileExt(ASearchRec.name,'');
        end;
      until FindNext(ASearchRec) <> 0;
      finally
       sysutils.FindClose(ASearchRec);
      end;
    end;
end;


Function TDMTCCoreLink.ReadDescription(MessageID:Integer):String;
begin
    result := DescObject.ReadDescription(MessageID);
end;

function TDMTCCoreLink.IsRegistered(APluginString:String) : boolean ;
var
 List : TStringList  ;
 TimeTrail, aTime,aCode,aName : String ;
 i : Integer ;
begin
 try
  TimeTrail := '' ;
  aName := '';
  Result := false ;
  if not TheGlobalDataObject.Registration.Registered then exit ;
 if length(APluginString) < 8 then exit ;
 APluginString[2] := char(ord(APluginString[2]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,1,1),0)) ;
 APluginString[3] := char(ord(APluginString[3]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,2,1),0)) ;
 APluginString[4] := char(ord(APluginString[4]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,3,1),0)) ;
 APluginString[5] := char(ord(APluginString[5]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,4,1),0)) ;
 APluginString[6] := char(ord(APluginString[6]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,5,1),0)) ;
 APluginString[7] := char(ord(APluginString[7]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,6,1),0)) ;
 APluginString[8] := char(ord(APluginString[8]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,7,1),0)) ;
  List := TStringList.Create  ;
  try

  if FileExists( ExtractFilePath(GetModuleName(HInstance)) +'unlock.ddu') then
    List.LoadFromFile(ExtractFilePath(GetModuleName(HInstance)) +'unlock.ddu');

  if FileExists( GetLocalPluginDir +'unlock.ddu') then
    List.LoadFromFile(GetLocalPluginDir +'unlock.ddu');

    for i := 0 to List.count -1 do
       begin
          if pos(APluginString,List[i]) = 1 then
            begin
             if i <> 0 then
              aName := List[i-1]  ;
             List[i] := Trim(List[i]) ;
               Result := true ;
               // look for time trail
               If pos('}',List[i]) < length(List[i]) then
                  begin
                     //TimeTrail found
                     Result := false ;
                     TimeTrail := copy( List[i],pos('}',List[i]) +1,length(List[i]));
                     if pos('_',TimeTrail) = 0 then
                          begin
                           Result := true ;
                           exit ;
                          end;
                     //decode time trial
                      aTime := copy(TimeTrail,1,pos('_',TimeTrail)-1);
                      aCode := copy(TimeTrail,pos('_',TimeTrail)+1,Length(TimeTrail));
                      if ((((StrToIntDef(aTime,50) div 2) + 50) div 10) div 7) = StrToIntDef(aCode,-1) then
                         begin
                             if  StrToIntDef(aTime,50) >= Date then
                                begin
                                result := true ;
                                // warning
                                if StrToIntDef(aTime,50) = Date +1 then
                                  begin
                                     if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                    ShowMessage(aName +' ' + APluginString +GetTextLang(3120) {':Time licence expires in 1 day please contact http://www.osfshop.com'}) ;
                                   end
                                 else
                                if StrToIntDef(aTime,50) <= Date +7 then
                                  begin
                                   if TDatabaseRegistyRoutines.ReadRegValue('TIMETRAIL',List[i] + DateToStr(Date)) = '' then
                                     begin
                                       if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                      ShowMessage(aName +' ' + APluginString+Format(GetTextLang(3121),[IntToStr(StrToIntDef(aTime,50) - round(Date))])); {':Time licence expires in ' +IntToStr(StrToIntDef(aTime,50) - round(Date))  +' days please contact http://www.osfshop.com') ;}
                                      TDatabaseRegistyRoutines.WriteRegValue('TIMETRAIL',List[i] + DateToStr(Date),'1') ;
                                     end;
                                  end
                                   else
                                if StrToIntDef(aTime,50) <= Date +21 then
                                  if TDatabaseRegistyRoutines.ReadRegValue('TIMETRAIL',List[i] + IntToStr(Round(Date) div 7)) = '' then
                                    begin
                                       if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                      ShowMessage(APluginString+Format(aName +' ' + GetTextLang(3121),[IntToStr(StrToIntDef(aTime,50) - round(Date))]));
                                      // ShowMessage(APluginString+':Time licence will expires in ' +IntToStr(StrToIntDef(aTime,50) - round(Date))  +' days please contact http://www.osfshop.com') ;
                                    end;
                                end else
                                 ShowMessage(aName +' ('+APluginString+') '+GetTextLang(3122));
                         end;
                  end;
            end;

       end;
     // Result := List.IndexOf(APluginString) <> -1 ;
    finally
      List.Free ;
  end;
  except
   Result := false ;
    if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
   ShowMessage('Error getting reg file ' + ExtractFilePath(GetModuleName(HInstance)) + ' '  +GetLocalPluginDir ) else
    raise Exception.Create('Error getting reg file ' + ExtractFilePath(GetModuleName(HInstance)) + ' '  +GetLocalPluginDir);
  end;
end;

function TDMTCCoreLink.IsRegisteredGetDate(APluginString:String;Var ADate : TDatetime;Var MessageText : String) : boolean ;
var
 List : TStringList  ;
 TimeTrail, aTime,aCode,NamePlugin : String ;
 i : Integer ;
begin
 try
  TimeTrail := '' ;
  Result := false ;
  if length(APluginString) < 8 then exit ;
  if not TheGlobalDataObject.Registration.Registered then exit ;
 APluginString[2] := char(ord(APluginString[2]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,1,1),0)) ;
 APluginString[3] := char(ord(APluginString[3]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,2,1),0)) ;
 APluginString[4] := char(ord(APluginString[4]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,3,1),0)) ;
 APluginString[5] := char(ord(APluginString[5]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,4,1),0)) ;
 APluginString[6] := char(ord(APluginString[6]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,5,1),0)) ;
 APluginString[7] := char(ord(APluginString[7]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,6,1),0)) ;
 APluginString[8] := char(ord(APluginString[8]) + StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,7,1),0)) ;
  List := TStringList.Create  ;
  try

  if FileExists( ExtractFilePath(GetModuleName(HInstance)) +'unlock.ddu') then
    List.LoadFromFile(ExtractFilePath(GetModuleName(HInstance)) +'unlock.ddu');

  if FileExists( GetLocalPluginDir +'unlock.ddu') then
    List.LoadFromFile(GetLocalPluginDir +'unlock.ddu');

    for i := 0 to List.count -1 do
       begin
           NamePlugin := '' ;
           if i > 0 then NamePlugin := list[i-1] ;
          if pos(APluginString,List[i]) = 1 then
            begin
               Result := true ;
               // look for time trail
               If pos('}',List[i]) < length(List[i]) then
                  begin
                     //TimeTrail found
                     Result := false ;
                     TimeTrail := copy( List[i],pos('}',List[i]) +1,length(List[i]));
                     //decode time trial
                      aTime := copy(TimeTrail,1,pos('_',TimeTrail)-1);
                      ADate := StrToIntDef(aTime,0);
                      aCode := copy(TimeTrail,pos('_',TimeTrail)+1,Length(TimeTrail));
                      if ((((StrToIntDef(aTime,50) div 2) + 50) div 10) div 7) = StrToIntDef(aCode,-1) then
                         begin
                             if  StrToIntDef(aTime,50) >= Date then
                                begin
                                result := true ;
                                // warning
                                if StrToIntDef(aTime,50) = Date +1 then
                                  begin
                                     if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                   MessageText := NamePlugin + ' ' + APluginString +GetTextLang(3120) {':Time licence expires in 1 day please contact http://www.osfshop.com'} ;
                                   end
                                 else
                                if StrToIntDef(aTime,50) <= Date +7 then
                                  begin
                                   if TDatabaseRegistyRoutines.ReadRegValue('TIMETRAIL',List[i] + DateToStr(Date)) = '' then
                                     begin
                                       if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                      MessageText := NamePlugin + ' ' + APluginString+Format(GetTextLang(3121),[IntToStr(StrToIntDef(aTime,50) - round(Date))]); {':Time licence expires in ' +IntToStr(StrToIntDef(aTime,50) - round(Date))  +' days please contact http://www.osfshop.com') ;}
                                      TDatabaseRegistyRoutines.WriteRegValue('TIMETRAIL',List[i] + DateToStr(Date),'1') ;
                                     end;
                                  end
                                   else
                                if StrToIntDef(aTime,50) <= Date +21 then
                                  if TDatabaseRegistyRoutines.ReadRegValue('TIMETRAIL',List[i] + IntToStr(Round(Date) div 7)) = '' then
                                    begin
                                       if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
                                     MessageText :=NamePlugin + ' ' + APluginString+Format(GetTextLang(3121),[IntToStr(StrToIntDef(aTime,50) - round(Date))]);
                                      // ShowMessage(APluginString+':Time licence will expires in ' +IntToStr(StrToIntDef(aTime,50) - round(Date))  +' days please contact http://www.osfshop.com') ;
                                    end;
                                end else
                                 MessageText :=NamePlugin + ' ' + APluginString+GetTextLang(3122);
                         end;
                  end;
            end;

       end;
     // Result := List.IndexOf(APluginString) <> -1 ;
    finally
      List.Free ;
  end;
  except
   Result := false ;
    if ExtraOptions.Values['ISAUTOMATED'] <> 'TRUE' then
   ShowMessage('Error getting reg file ' + ExtractFilePath(GetModuleName(HInstance)) + ' '  +GetLocalPluginDir ) else
    raise Exception.Create('Error getting reg file ' + ExtractFilePath(GetModuleName(HInstance)) + ' '  +GetLocalPluginDir);
  end;
end;


function  TDMTCCoreLink.ReadLongReportOp(vfield:String) : String ;
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

Procedure TDMTCCoreLink.WriteLongReportOp(vfield,Value:String);
var
 i , x: Integer ;
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


 Temp := copy(Value,1,35);
 x := length(Temp) ;
 if x >0then
 while Temp[x] in [' ',#10,#13] do
    begin
    Delete(Temp,x,1);
    dec(x);
    if x = 0 then exit ;
    end;

 i := 0 ;
 Delete(Value,1,length(Temp));
  while  Temp <> '' do
   begin
      WriteNwReportOp(vfield+IntToStr(i),Temp);
      Temp := copy(Value,1,35);
       x := length(Temp) ;
       if x > 0 then
       while Temp[x] in [' ',#10,#13] do
          begin
          Delete(Temp,x,1);
          dec(x);
          if x = 0 then exit ;
          end;
       Delete(Value,1,length(Temp));

      inc(i);
   end;
end;


Function TDMTCCoreLink.ReadNwReportOp(vfield:String):Variant;
begin
 if TheZConnection.Connected then
  begin
  tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  tblOpReport.open ;
  if tblOpReport.IsEmpty then
    result := '' else
    result := tblOpReport.FieldByName('SoptionValue').asstring ;
  tblOpReport.Close ;
  end;
end;

Function  TDMTCCoreLink.ReadNwReportOp(vfield:String;BValue:Boolean):Variant;
Begin
  result := BValue ;
 if TheZConnection.Connected then
  begin
  tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  tblOpReport.open ;
  if not tblOpReport.IsEmpty then
  result:=tblOpReport.FieldByName('SOptionValue').AsBoolean;
  tblOpReport.Close;
  end;
end;

Function  TDMTCCoreLink.ReadNwReportOp(vfield:String;Value:Integer):Variant;
begin
 if TheZConnection.Connected then
  begin
  Result:= ReadNwReportOp(vfield);
  if VarToStr(result) ='' then
    begin
    WriteNwReportOp(vfield,IntToStr(Value));
    Result:= ReadNwReportOp(vfield);
    end ;
  end else
  begin
     Result := Value ;
  end;
end;

Procedure TDMTCCoreLink.WriteNwReportOp(vfield,Value:String);
begin
  tblOpReport.sql.text := 'select * from OPREPORT where upper(STROPTION) = '  + QuotedStr(Uppercase(vfield)) ;
  tblOpReport.open ;
  if tblOpReport.IsEmpty then
     if value = '' then exit else
       CreatNwReportOp(vfield);
  tblOpReport.Edit;
  tblOpReport.FieldByName('SOptionValue').AsString := Value;
  try
  tblOpReport.Post;
  Except
  on e : Exception do
         if pos('violation of PRIMARY or UNIQUE KEY constraint',e.Message) > 0 then
       begin
         ExecSql('SET GENERATOR GEN_OPREP_ID TO ' + IntToStr(1 +StrTOIntDef(varToStr(OpenSqlReturnFirstColumn('select max(WOPTIONID) from opreport')) ,1)));
         tblOpReport.FieldByName('WOPTIONID').AsInteger := GetNewIdStr('GEN_OPREP_ID');
         tblOpReport.post ;
       end;
  end;
  tblOpReport.close ;
end;

Procedure TDMTCCoreLink.CreatNwReportOp(vfield:String);
begin
  tblOpReport.Append;
  tblOpReport.FieldByName('StrOption').AsString:=UpperCase(vField);
  tblOpReport.FieldByName('SOptionValue').AsString:='';
  tblOpReport.FieldByName('WOptionTypeID').AsString:='0';
 // tblOpReport.Post;
End;



Function  TDMTCCoreLink.ReadNwReportOp(vfield:String;SValue:String):Variant;
begin
  Result:= ReadNwReportOp(vfield);
  if vartoStr(Result) = '' then
     result := SValue ;
end;



function TDMTCCoreLink.GetTextLang(MsgID : Integer) : String;
(* Generic Message Routine. *)
begin
 if self <> nil then
 result := TheGlobalDataObject.CurrentLanguage.GetTextLang(MsgID);
 if Result = '' then
 result := TheGlobalDataObject.DefaultLanguage.GetTextLang(MsgID);
end;

function TDMTCCoreLink.GetTextLangNoAmp(MsgID : Integer) : String;
(* Generic Message Routine. *)
begin
 result := TheGlobalDataObject.CurrentLanguage.GetTextLang(MsgID);
 if Result = '' then
 result := TheGlobalDataObject.DefaultLanguage.GetTextLang(MsgID);
 result := StringReplace(result,'&&','@#$^',[rfReplaceAll]);
 result := StringReplace(result,'&','',[rfReplaceAll]);
 result := StringReplace(result,'@#$^','&',[rfReplaceAll]);
end;

procedure TDMTCCoreLink.SetPersistentProp(const AName: string; APersistent: TPersistent; Value: Variant);
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName, FloatValue: string;
  AFloat: Double;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      if (PropList[i]^.Name = Propname) and (PropList[i]^.SetProc <> nil) then
      begin
        case PropList[i]^.PropType^.Kind of
          tkString, tkLString,tkUString,
            tkWString, tkWChar,
            tkChar:
            begin
              SetStrProp(APersistent, PropList[i], VarToStr(Value));
            end;

          tkInteger,
            tkEnumeration:
            begin
              if VarToStr(Value) <> '' then
                SetOrdProp(APersistent, PropList[i], StrToInt(VarToStr(Value)));
            end;
          tkFloat:
            begin
              if (PropList[i]^.PropType^.Name = 'TDateTime') then
                SetFloatProp(APersistent, PropList[i], VarToDateTime(Value))
              else
              begin
                FloatValue := VarToStr(Value);
                if (FloatValue <> '') then
                begin

                  if Pos('IND', FloatValue) <> 0 then
                    AFloat := 0
                  else if Pos('INF', FloatValue) <> 0 then
                    AFloat := 0
                  else
                   AFloat := StrToFloat(FloatValue)  ;
                  SetFloatProp(APersistent, PropList[i], AFloat);
                end;
              end
            end;
          tkClass:
            begin
              if GetObjectProp(APersistent, PropList[i]) is TPersistent then
              begin
              // TCollection alows indexed acces
                if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                begin
                  Propname := copy(NextName, 1, pos('.', NextName) - 1);
                  NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                  // if its a add function then add
                  if Uppercase(NextName) = 'ADD' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Add;
                    exit; // found ADD key word
                  end;
                  if Uppercase(NextName) = 'CLEAR' then
                  begin
                    TCollection(GetObjectProp(APersistent, PropList[i])).Clear;
                    exit; // found ADD key word
                  end;
                  // Do the same for delete
                  if Uppercase(Propname) = 'DELETE' then
                  begin
                  // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (NextName[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(NextName, i, 1);
                    end;
                    if NextName <> '' then
                    begin
                      TCollection(GetObjectProp(APersistent, PropList[i])).Delete(StrToInt(NextName));
                      exit; // found delete key word
                    end;
                  end;
                  // probeer een set van de default propertys
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
                 // strip annyting not numeric
                  for x := Length(Propname) downto 1 do
                  begin
                    if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                      delete(Propname, i, 1);
                  end;
                // check empty
                  if Propname <> '' then
                    SetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)], Value);
                end
                else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                  SetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])), value);
              end;
            end;

        end; // case
           // end found so if found exit ;
        Exit;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;



function TDMTCCoreLink.GetPersistentProp(const AName: string; APersistent: TPersistent): Variant;
var
  PropList: PPropList;
  PropCount: Integer;
  ClassTypeInfo: PTypeInfo;
  ClassTypeData: PTypeData;
  i, x: integer;
  Propname, NextName: string;
begin
  if APersistent = nil then exit;
  ClassTypeInfo := APersistent.ClassInfo;
  ClassTypeData := GetTypeData(ClassTypeInfo);
  PropCount := ClassTypeData.PropCount - 1;
  if pos('.', AName) <> 0 then
  begin
    Propname := copy(AName, 1, pos('.', AName) - 1);
    NextName := copy(AName, pos('.', AName) + 1, Length(AName) - pos('.', AName) + 1);
  end
  else
    Propname := AName;
      //  reserveer geheugen
  GetMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
      // Error trap
  try
      // Vul de prop list
    GetPropInfos(APersistent.ClassInfo, PropList);
    for i := 0 to PropCount do
    begin
      try
        if (PropList[i]^.Name = Propname) then
        begin
          case PropList[i]^.PropType^.Kind of
            tkString, tkLString,tkUString,
              tkWString, tkWChar,
              tkChar:
              begin
                Result := GetStrProp(APersistent, PropList[i]);
              end;

            tkInteger,
              tkEnumeration:
              begin
                Result := GetOrdProp(APersistent, PropList[i]);
              end;
            tkFloat:
              begin
                if (PropList[i]^.PropType^.Name = 'TDateTime') then
                  Result := VarFromDateTime(GetFloatProp(APersistent, PropList[i]))
                else
                  Result := GetFloatProp(APersistent, PropList[i]);
              end;
            tkClass:
              begin
                if GetObjectProp(APersistent, PropList[i]) is TPersistent then
                begin
         // TCollection alows indexed acces
                  if (GetObjectProp(APersistent, PropList[i]) is TCollection) then
                  begin
                    Propname := copy(NextName, 1, pos('.', NextName) - 1);
                    NextName := copy(NextName, pos('.', NextName) + 1, Length(NextName) - pos('.', NextName) + 1);
                    if Uppercase(NextName) = 'COUNT' then
                    begin
                      Result := TCollection(GetObjectProp(APersistent, PropList[i])).Count;
                      exit; // found Count key word
                    end;
                // is it a property of collection ?
                    Result := null;
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                // if found then exit ;
                    if VarIsNull(Result) then
                    begin
                      Result := 0;
                    end
                    else
                      exit;
                // strip annyting not numeric
                    for x := Length(Propname) downto 1 do
                    begin
                      if not (Propname[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
                        delete(Propname, x, 1);
                    end;
               // check empty
                    if Propname <> '' then
                      Result := GetPersistentProp(NextName, TCollection(GetObjectProp(APersistent, PropList[i])).Items[StrToInt(Propname)]);

                  end
                  else if (PropList[i]^.Name = Propname) and (NextName <> '') then
                    Result := GetPersistentProp(NextName, TPersistent(GetObjectProp(APersistent, PropList[i])));
                end;
              end;

          end; // case
           // end found so if found exit ;
          Exit;
        end;
      except
        Result := -1;
      end;
    end; // end i
  finally
    FreeMem(PropList, SizeOf(PPropInfo) * ClassTypeData.PropCount);
  end;
end;


procedure TDMTCCoreLink.SetAApplication(const Value: TComponent);
var
 i : Integer ;
begin
 if Trim(ExtraOptions.Values['DEFLANG']) <> '' then
            if TheGlobalDataObject.Languages.ActiveLanguage.Name <> Trim(ExtraOptions.Values['DEFLANG']) then
               begin
                    for i := 0 to TheGlobalDataObject.Languages.Count -1 do
                       if TheGlobalDataObject.Languages[i].Name = Trim(ExtraOptions.Values['DEFLANG']) then
                        begin
                          TheGlobalDataObject.Languages.SetActiveLanguage(i);
                          break;
                        end;
               end;

  FExtraOptions.Clear ;
  FAApplication := Value;
  SimpleMode := StrToIntDef(TDatabaseRegistyRoutines.ReadOsfIni('INFO','simple','0'),0) ;

  if FAApplication <> nil then
    begin
     FGroupsObject.Clear ;
     FAccObject.Clear ;
     FstockObject.clear ;
     FDescObject.Clear ; 
     if AApplication.FindComponent('dmDatabase') <> nil then
     FTheZConnection := TUniconnection(AApplication.FindComponent('dmDatabase').FindComponent('ZMainConnection'));
     tblOpReport.Connection := FTheZConnection ;
     tblSysParams.Connection := FTheZConnection ;
   
     ZQLoggedin.Connection := FTheZConnection ;
     fTheOSAConnectionItem.Connection := TheZConnection ;
     if FTheZConnection.Connected then
     begin
       FExtraOptions.add('ORACLE=' + LowerCase(TDatabaseRegistyRoutines.ReadOsfIni('DBTYPE','ORACLE','False')) ) ;
       InitFieldLengths ;
       FExtraOptions.add('LOGLEVEL=' + VarToStr(ReadNwReportOp('cbLogLevel',0))) ;

       FExtraOptions.Values['SYSDIVLEDGER'] := VarToStr(ReadSysParam('SYSDIVLEDGER',0,0,0)) ;
       if StrToIntDef(FExtraOptions.Values['SYSDIVLEDGER'],0) <> 0 then
          begin
            if TDataBaseRoutines.GetAccountCode(StrToIntDef(FExtraOptions.Values['SYSDIVLEDGER'],0)) = '' then
              FExtraOptions.Values['SYSDIVLEDGER'] := '0' ;
          end;



       FExtraOptions.add('UPDLASTPRFROMGROSSPR=' + VarToStr(ReadNwReportOp('UPDLASTPRFROMGROSSPR',0))) ;

       FExtraOptions.add('DOCLINKLINES=' + BoolToStr(ReadNwReportOp('DOCLINKLINES',False),True)) ;

       // Try To Set theUserid
       Fcurrentuser := StrToIntDef(VarToStr(OpenSqlReturnFirstColumn('Select WUSERID,1 test,DCONEND from LOGGEDIN where DCONEND is null and LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION'+
                     ' UNION Select WUSERID,2 test,DCONEND from LOGGEDIN where DCONEND is not null and LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION order by 2,3 desc')),0);

        if OpenSqlReturnFirstColumn('select count(*) from sysparams where WTypeID=7002 AND Wuserid = ' + intToStr(Fcurrentuser)) > 0 then
                  FExtraOptions.add('BHASBLOCK=' + 'TRUE')  ;
        if ReadSysParam('STOCKDOCTYPES',False,0) then
           FExtraOptions.add('STOCKDOCTYPES=' + 'TRUE')  else
           FExtraOptions.add('STOCKDOCTYPES=' + 'FALSE') ;

        if ReadSysParam('STOCKDOCPURTYPES',False,0) then
           FExtraOptions.add('STOCKDOCPURTYPES=' + 'TRUE')  else
           FExtraOptions.add('STOCKDOCPURTYPES=' + 'FALSE') ;
        if ReadSysParam('STOCKDOCDECREORD',False,0) then
           FExtraOptions.add('STOCKDOCDECREORD=' + 'TRUE')  else
           FExtraOptions.add('STOCKDOCDECREORD=' + 'FALSE') ;


        if  ReadNwReportOp('BUSETABSINSTOCK',True) then
           FExtraOptions.add('BUSETABSINSTOCK=' + 'TRUE')  else
           FExtraOptions.add('BUSETABSINSTOCK=' + 'FALSE') ;

        if  ReadNwReportOp('BUSEDATEFFROMMLTP',False) then
           FExtraOptions.add('BUSEDATEFFROMMLTP=' + 'TRUE')  else
           FExtraOptions.add('BUSEDATEFFROMMLTP=' + 'FALSE') ;
        if  ReadSysParam('USETYPE10',false,0) then
             FExtraOptions.add('USETYPE10=' + 'TRUE')  else
           FExtraOptions.add('USETYPE10=' + 'FALSE') ;
        FExtraOptions.add('SYSLANG=' +  VarToStr(ReadSysParam('cbusersystemlang',TheGlobalDataObject.Languages.ActiveLanguage.Name , Fcurrentuser)));
        FExtraOptions.add('DEFLANG=' +   TheGlobalDataObject.Languages.ActiveLanguage.Name );
        FExtraOptions.add('LANG=' +  VarToStr(ReadSysParam('cbuserlang',0,Fcurrentuser)));



      end;
    end;
   loadGlobalObject;
end;



procedure TDMTCCoreLink.SetMainAccountLength(const Value: Integer);
begin
  FMainAccountLength := Value;
end;



procedure TDMTCCoreLink.DataModuleCreate(Sender: TObject);
begin
 FGroupsObject :=  TGroupRecList.create ;
 FAccObject := TAccountRecList.create;
 FstockObject := TStockRecList.create;
 FDescObject:= TDescriptionRecList.create;
 FExtraOptions:= TStringlist.create;
 if ZDesignConnectionPleaseDonotuse.Connected then
  begin
   ShowMessage('Error designtime connection is open. Please recompile');
  // raise Exception.Create('Error designtime connection is open. Please recompile');
  end;
 ZDesignConnectionPleaseDonotuse.Database := '' ;
   FTheGlobalDataObject := TGlobalDataObject.Create(self);
   if FileExists(GetLocalBaseDir+'Bin\Settings.dfm') then
     TheGlobalDataObject.LoadFromFile(GetLocalBaseDir+'Bin\Settings.dfm');
 FTheOSAConnectionItem := TOSAConnectionItem.Create(nil) ;
 FTheOSAConnectionItem.Connection.free ;
 FTheOSAConnectionItem.OwnConnection := false ;
 FSQLList := TSQLList.Create(nil);
 LoadSqlList ;
end;

procedure TDMTCCoreLink.SetTheGlobalDataObject(
  const Value: TGlobalDataObject);
begin
  FTheGlobalDataObject := Value;
end;

procedure TDMTCCoreLink.DataModuleDestroy(Sender: TObject);
begin
FAccObject.free ;
FstockObject.free ;
FDescObject.free ;
FGroupsObject.free ;
tblOpReport.close ;
tblSysParams.close ;
FSQLList.free ;
TheGlobalDataObject.free ;
FTheOSAConnectionItem.free ;
FExtraOptions.free ;
end;

procedure TDMTCCoreLink.SetTheZConnection(const Value: TUniconnection);
begin
  FTheZConnection := Value;
  
end;

procedure TDMTCCoreLink.loadGlobalObject;
var
Found,ResetActive : Boolean ;
i : Integer ;
begin
 ResetActive := TheGlobalDataObject.Books.ActiveBooks <> nil ;
 if ResetActive then
    begin
       if (Trim(ExtraOptions.Values['SYSLANG']) <> '') or(TheGlobalDataObject.CurrentLanguage.count < 4) then
            if (TheGlobalDataObject.Languages.ActiveLanguage.Name <> Trim(ExtraOptions.Values['SYSLANG'])) or (TheGlobalDataObject.CurrentLanguage.Count < 4) then
               begin
                   if Trim(ExtraOptions.Values['SYSLANG'] )='' then
                     ExtraOptions.Values['SYSLANG'] := TheGlobalDataObject.Languages.ActiveLanguage.Name ;
                    for i := 0 to TheGlobalDataObject.Languages.Count -1 do
                       if TheGlobalDataObject.Languages[i].Name = Trim(ExtraOptions.Values['SYSLANG']) then
                        begin
                          TheGlobalDataObject.Languages.SetActiveLanguage(i);
                         // TheGlobalDataObject.CurrentLanguage ;
                         // TheGlobalDataObject.TranslationSaveObject.aTranslationCollection := TheGlobalDataObject.CurrentLanguage ;


                          // FCurrentLanguage:= TTranslationCollection.Create(self,TTranslationCollectionItem);


                          if FileExists(DMTCCoreLink.GetLocalBaseDir +'bin\languages\'  +
                          TheGlobalDataObject.Languages.ActiveLanguage.filename+'.dfm') then
                          TheGlobalDataObject.TranslationSaveObject.LoadFromFile( DMTCCoreLink.GetLocalBaseDir +'bin\languages\'  +
                          TheGlobalDataObject.Languages.ActiveLanguage.filename+'.dfm')                          else

                          TheGlobalDataObject.TranslationSaveObject.LoadFromFile( ExtractFilePath(Application.ExeName) +'bin\languages\'  +
                          TheGlobalDataObject.Languages.ActiveLanguage.filename+'.dfm');
                          break;
                        end;
               end;
   if Assigned(FTheZConnection) then
      if FTheZConnection.Connected then
        begin
         if (TheGlobalDataObject.CurrentLanguage <> nil) and (TheGlobalDataObject.DefaultLanguage <> nil) then
          begin
           ReinitCustomLang ;
          end;
        end;


       exit ;

    end;

  found := false ;
  if FileExists(GetLocalBaseDir+'Bin\Settings.dfm') then
  TheGlobalDataObject.LoadFromFile(GetLocalBaseDir+'Bin\Settings.dfm') ;



       if Trim(ExtraOptions.Values['SYSLANG']) <> '' then
            if TheGlobalDataObject.Languages.ActiveLanguage.Name <> Trim(ExtraOptions.Values['SYSLANG']) then
               begin
                    for i := 0 to TheGlobalDataObject.Languages.Count -1 do
                       if TheGlobalDataObject.Languages[i].Name = Trim(ExtraOptions.Values['SYSLANG']) then
                        begin
                          TheGlobalDataObject.Languages.SetActiveLanguage(i);
                          break;
                        end;
               end;

   for i  := 0 to TheGlobalDataObject.Languages.Count -1 do
     begin
         if TheGlobalDataObject.Languages[i].Active and not Found then
           begin
             TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
             Found := true ;
           end ;
     end;


   TheGlobalDataObject.DefaultLangSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\English.dfm');

   if not found and (TheGlobalDataObject.Languages.Count <> 0) then
     TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\English.dfm');



if Assigned(FTheZConnection) then
if FTheZConnection.Connected then
  begin
   if (TheGlobalDataObject.CurrentLanguage <> nil) and (TheGlobalDataObject.DefaultLanguage <> nil) then
  begin
   ReinitCustomLang ;
  end;
  end;
end;

procedure TDMTCCoreLink.AssignConnectionToChilds(AComponent: TComponent);
var
 i : Integer ;
begin
 for i := 0 to AComponent.ComponentCount -1 do
    begin

       if AComponent.Components[i] is TuniTable then
        begin
       (AComponent.Components[i] as TuniTable).FetchRows := 200 ;
          (AComponent.Components[i] as TuniTable).Connection := TheZConnection ;
       end else
       if AComponent.Components[i] is TuniQuery then
         begin
          (AComponent.Components[i] as TuniQuery).Connection := TheZConnection ;
          (AComponent.Components[i] as TuniQuery).FetchRows := 200 ;
      end else
      if AComponent.Components[i] is TUniSQL then
          (AComponent.Components[i] as TUniSQL).Connection := TheZConnection else
      if AComponent.Components[i] is TUniScript then
         begin
          (AComponent.Components[i] as TUniScript).AutoCommit := True ;
          (AComponent.Components[i] as TUniScript).Connection := TheZConnection  ;
         end;

    end;
end;

function TDMTCCoreLink.GetLocalSaveDir: String;
var
 AIni : TStringList ;
  OwnBaseDir,aFile : String ;
begin
 AIni := TStringList.create ;
 try
   aFile :=  ExtractFilePath(GetModuleName(MainInstance))+TDatabaseRegistyRoutines.GetAppValue('ININAME') ;

   if  FileExists(aFile)  then
   begin
   AIni.LoadFromFile(aFile);
   OwnBaseDir := AIni.Values['OWNBASEDIR'] ;       
   // from registry
   aFile := TDatabaseRegistyRoutines.ReadAppRegValue('','OWNBASEDIR');
   if aFile <> '' then
     OwnBaseDir := aFile ;
   end;
 finally
   AIni.free ;
 end;

 if TheZConnection = nil then raise Exception.Create(GetTextLang(3077){'No connection assigned'});

 if TheZConnection.Server <> '' then
    begin
      result := ExtractFileDir(TheZConnection.Database);
      ExcludeTrailingPathDelimiter(Result);

      result :=  TDMTCCoreLink.GetLocalBaseDir  + 'localfiles\'+ ExtractFileName(Result) ;
      if trim(OwnBaseDir) <> '' then
        begin
         result := IncludeTrailingPathDelimiter(OwnBaseDir)+  ExtractFileDir(TheZConnection.Database) ;
       if not DirectoryExists(result) then
          begin
             result := IncludeTrailingPathDelimiter(OwnBaseDir)+   ExtractFileName(ExcludeTrailingPathDelimiter(ExtractFileDir(TheZConnection.Database))) ;
          end;
        end;  
    end
    else result := ExtractFilePath(TheZConnection.Database);
 Result := IncludeTrailingPathDelimiter(result) ;
 if not DirectoryExists(Result) then
    ForceDirectories(result);
end;

function TDMTCCoreLink.GetNewId(AIdType: TTCIdType): Integer;
var
 fieldName : String ;
 AQuery : TuniQuery ;
begin
 result := 0 ;

 if (AIdType in [tcidNEWACCOUNTID..tcidNewLogEntryID]) then
 begin
 fieldName := TTCIdTypeStr[AIdType] ;
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection :=  TheZConnection ;
     AQuery.sql.Text := GetGenUniSyntax(fieldName);
     
     AQuery.Active := true ;
     result := AQuery.Fields[0].AsInteger ;
   //  AQuery.sql.Text := 'update global set '  + fieldName + ' =' + IntToStr(result+1);
   //  AQuery.ExecSQL ;
   finally
     AQuery.free ;
   end;
 end;
end;

function TDMTCCoreLink.GetNewidByMaxPlusOne(ATable,AField: String): Integer;
var
 
 AQuery : TuniQuery ;
begin

 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection :=  TheZConnection ;
     AQuery.sql.Text := 'select max('  + AField + ') from ' + ATable ;
     AQuery.Active := true ;
     result := AQuery.Fields[0].AsInteger + 1 ;
   //  AQuery.sql.Text := 'update global set '  + fieldName + ' =' + IntToStr(result+1);
   //  AQuery.ExecSQL ;
   finally
     AQuery.free ;
   end;
end;

function TDMTCCoreLink.GetNewIdStr(AIdType: String): Integer;
var
 fieldName : String ;
 AQuery : TuniQuery ;
begin
 fieldName := AIdType ;
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection :=  TheZConnection ;
     AQuery.sql.Text := GetGenUniSyntax(fieldName) ;
     AQuery.Active := true ;
     result := AQuery.Fields[0].AsInteger ;
   finally
     AQuery.free ;
   end;
end;


procedure TDMTCCoreLink.tblOpReportAfterInsert(DataSet: TDataSet);
begin
try
   tblOpReport.FieldByName('WOPTIONID').AsInteger := GetNewIdStr('GEN_OPREP_ID');
 except
  on  e : Exception do
    begin
      if pos('GEN_OPREP_ID',e.Message) > 0 then
       begin
         ExecSql('CREATE GENERATOR GEN_OPREP_ID');

         ExecSql('SET GENERATOR GEN_OPREP_ID TO ' + IntToStr(1 +StrTOIntDef(varToStr(OpenSqlReturnFirstColumn('select max(WOPTIONID) from opreport')) ,1)));


         tblOpReport.FieldByName('WOPTIONID').AsInteger := GetNewIdStr('GEN_OPREP_ID');

       end ;

    end;
 end;

   //  := StrToIntDef(VarToStr(OpenSqlReturnFirstColumn('Select max(WOptionID) from OpReport') +1),1) ;
end;

function TDMTCCoreLink.OpenSqlReturnFirstColumn(ASql: String): Variant;
var
 AQuery : TuniQuery ;
begin
 try
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := TheZConnection ;
   AQuery.sql.Text := ASql ;
   AQuery.Open ;
   result := AQuery.fields[0].Value ;
 finally
   AQuery.free ;
 end;
 except
   on e: Exception do
    begin
      if pos(copy(ASql,1,15),e.Message) < 1 then
        raise Exception.Create(e.Message + #13+#10 + asql)
        else
        raise Exception.Create(e.Message);

    end;
 end;
end;

procedure TDMTCCoreLink.ExecSql(ASql: String);
var
 AQuery : TuniQuery ;
begin
 AQuery := TuniQuery.Create(nil) ;
 try
   AQuery.Connection := TheZConnection ;
   AQuery.sql.Text := ASql ;
   AQuery.ExecSQL ;
 finally
   AQuery.free ;
 end;
end;

function TDMTCCoreLink.AddRegister(APluginString: String): boolean;
var
 List : TStringList  ;
begin
  result := true ;
  List := TStringList.Create  ;
  try
    if FileExists(GetLocalPluginDir +'unlock.ddu') then
    List.LoadFromFile(GetLocalPluginDir +'unlock.ddu');
    List.Add(APluginString);
    List.SaveToFile(GetLocalPluginDir +'unlock.ddu');
    finally
      List.Free ;
  end;
end;
function TDMTCCoreLink.GetOrgPluginsString(AString: String): String;
begin
 AString[2] := char(ord(AString[2]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,1,1),0)) ;
 AString[3] := char(ord(AString[3]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,2,1),0)) ;
 AString[4] := char(ord(AString[4]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,3,1),0)) ;
 AString[5] := char(ord(AString[5]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,4,1),0)) ;
 AString[6] := char(ord(AString[6]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,5,1),0)) ;
 AString[7] := char(ord(AString[7]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,6,1),0)) ;
 AString[8] := char(ord(AString[8]) - StrToIntDef(copy(TheGlobalDataObject.Registration.SerialNumber,7,1),0)) ;
 result := AString ; 
end;

function TDMTCCoreLink.GetSqlByName(ASqlName: String): String;
var
 Alist : TStringList ;
begin
 result := '';
 if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\' + ASqlName +'.txt' ) then
   begin
    Alist := TStringList.Create ;
     try
      Alist.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\' + ASqlName +'.txt');
      result := Alist.text ;
     finally
       Alist.free ;
     end;
   end;
end;

function TDMTCCoreLink.GetPeriodDescription(APeriodId: Integer): String;
begin
 result := VarToStr(OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as varChar(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(APeriodId)));
end;

function TDMTCCoreLink.ReadSysVar(AVar: String): String;
begin
 result := VarToStr(OpenSqlReturnFirstColumn('Select ' + AVar+  ' From sysvars'));
end;

function TDMTCCoreLink.GetLangTrans(ALangId: Integer;
  Alang: String): String;
  var
   aTranslationSaveObject : TTranslationSaveObject ;
    aTranslationCollection : TTranslationCollection  ;
begin
 if FileExists(ExtractFilePath(Application.ExeName) +'Bin\Languages\' + Alang + '.dfm') then
   begin
     aTranslationSaveObject := TTranslationSaveObject.create(nil) ;
     try
     aTranslationCollection := TTranslationCollection.Create(nil,TTranslationCollectionItem);
       try
         aTranslationSaveObject.aTranslationCollection := aTranslationCollection ;
         aTranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName) +'Bin\Languages\' + Alang + '.dfm');
         result := aTranslationSaveObject.aTranslationCollection.GetTextLang(ALangId) ;
       finally
         aTranslationCollection.free ;
       end;
     finally
      aTranslationSaveObject.free ;
     end;
   end else
   result := GetTextLang(ALangId) ;
end;

procedure TDMTCCoreLink.InitFieldLengtsForDatasetfields(ADataSet: TDataSet;
  ASql: String);
  var
   AQuery : TuniQuery ;
   i : Integer ;
   AField,AnewField,AOldField : TField ;
   aName : String ;
begin
  ADataSet.close ;
  if ADataSet.Tag = 100 then exit ;
  //if  FMessageLength = 35 then exit ;
   AQuery := TuniQuery.create(nil) ;
    try
     AQuery.Connection := TheZConnection ;
     if ASql <> '' then
     AQuery.SQL.Text := ASql else
      begin
       if (ADataSet is TuniQuery) then
       AQuery.SQL.Text := (ADataSet as TuniQuery).SQL.Text ;
      end;
     if (ADataSet is TuniQuery) then
        AQuery.Params.Assign((ADataSet as TuniQuery).Params);
     AQuery.open ;
     for i := ADataSet.FieldCount -1 downto 0 do
     begin
      AField := AQuery.FindField(ADataSet.Fields[i].FieldName) ;
       if  AField <> nil then
        begin
            if ADataSet.Fields[i].Size <> AField.Size then
                ADataSet.Fields[i].Size := AField.Size ;
       {   if DMTCCoreLink.ExtraOptions.Values['ORACLE']= 'true' then
          if AField.DataType <>  ADataSet.Fields[i].DataType then
             begin
               //showmessage('Datatype mismatch');
               AOldField := ADataSet.Fields[i] ;
               aName := AOldField.Name ;
               ADataSet.Fields.Remove(AOldField);


               AnewField := DefaultFieldClasses[AField.DataType].Create(self) ;
               AnewField.FieldName := AOldField.FieldName;
               AnewField.Index :=  AOldField.Index ;
               AnewField.DataSet := AOldField.DataSet;

               AOldField.Free ;
               AnewField.name := aName ;

             end;  }
        end;

     end;
    finally
      AQuery.free ;
    end;
   ADataSet.Tag := 100 ; 
end;

procedure TDMTCCoreLink.SetMessageLength(const Value: Integer);
begin
  FMessageLength := Value;
end;

procedure TDMTCCoreLink.InitFieldLengths;
begin
  MainAccountLength := GetFieldLength('Account','SMainAccountCode') ;
  MessageLength := GetFieldLength('messages','SDescription') ;
  FSQLList.ParamsList.Values['ACCOUNTCODELONG'] :=  IntToStr(MainAccountLength + 3) ;
  FSQLList.ParamsList.Values['MAINACCOUNTCODELONG'] :=  IntToStr(MainAccountLength ) ;
  FSQLList.ParamsList.Values['SUBACCOUNTCODE'] :=  IntToStr( 3);
  FSQLList.ParamsList.Values['ACCOUNTCODELONG'] :=  IntToStr(MainAccountLength + 4) ;
  FSQLList.ParamsList.Values['MESSAGELENGTH'] :=  IntToStr(MessageLength) ;
  FSQLList.ParamsList.Values['SYSPARMSLENGTH'] :=  IntToStr(GetFieldLength('SysParams','SParamName')) ;
  FGlobalSqlPrefix := ReadSysParam('GLOBALSQLPREFIX','',0,0) ;
  DebtorsControlAccountid := StrToIntDef( VarToStr( OpenSqlReturnFirstColumn('Select WDEBTORSCONTROLID from sysvars' )),0) ;
  CreditorsControlAccountid := StrToIntDef( VarToStr( OpenSqlReturnFirstColumn('Select WCREDITORSCONTROLID from sysvars' )),0) ;
  RetaindIncomeControlAccountid := StrToIntDef( VarToStr( OpenSqlReturnFirstColumn('Select WRETAINEDINCOMEID from sysvars' )),0) ;
  FExtraOptions.add('BHANDELBOM=' + BoolToStr(ReadNwReportOp('BHANDELBOMCOUNT',false)))  ;
  FExtraOptions.add('STKCHECKType=' + BoolToStr(ReadNwReportOp('STKCHECKType',false)))  ;

end;

procedure TDMTCCoreLink.SetTheOSAConnectionItem(
  const Value: TOSAConnectionItem);
begin
  FTheOSAConnectionItem := Value;
end;

procedure TDMTCCoreLink.SetSQLList(const Value: TSQLList);
begin
  FSQLList := Value;
end;

function TDMTCCoreLink.GetFieldLength(ATable, AField: String): Integer;
 var
  AName : String ;
begin
   if (ExtraOptions.Values['ORACLE'] ='true') then
        begin
           AName := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select char_length  a from   all_tab_columns where table_name = ' + QuotedStr(uppercase(TRIM(ATable))) + ' and COLUMN_NAME =' + QuotedStr(uppercase(trim(AField))),true)) ;

           result := StrToIntDef(AName,-1) ;

        end else
        begin
         result := -1 ;
         AName := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select RDB$FIELD_SOURCE from RDB$RELATION_FIELDS where RDB$RELATION_name = '+ QuotedStr(uppercase(ATable)) +
              '  and RDB$FIELD_NAME = ' + QuotedStr(uppercase(AField)))) ;
          if AName <> '' then
            begin
             AName := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select RDB$FIELD_LENGTH from RDB$FIELDS where rdb$field_name = '+ QuotedStr(uppercase(AName)) ));
             Result := StrToIntDef(AName,0);
            end;
      end;
end;

function TDMTCCoreLink.GetAddDescription(aDescription: String;Unique: Boolean = false): Integer;
begin
   result := DescObject.GetAddDescription(aDescription,Unique);
end;

function TDMTCCoreLink.InternalReadSysParam(vfield: String; UserID,
  AType: Integer): Variant;
begin
   if TheZConnection.Connected then
   begin
    tblSysParams.sql.text := SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
    if trim(tblSysParams.sql.text) = '' then exit ;

    tblSysParams.ParamByName('SParamName').AsString := RightStr(Uppercase(vfield),StrToIntDef(FSQLList.ParamsList.Values['SYSPARMSLENGTH'],35)) ;
    tblSysParams.ParamByName('wUserID').AsInteger := UserID ;
    tblSysParams.ParamByName('WTypeID').AsInteger := AType ;
    tblSysParams.open ;
    result:= tblSysParams.FieldByName('SParamValue').Asstring;
   end;
end;

function TDMTCCoreLink.ReadLongSysparam(vfield: String; UserID,
  AType: Integer): String;
var
 i : Integer ;
 Temp : String ;
begin
  Result:= '' ;
  i := 0 ;
  Temp :=  VarToStr(InternalReadSysParam(vfield+IntToStr(i),UserID,AType)) ;
  while  Temp <> '' do
   begin
      Result := Result + Temp ;
      inc(i);
      Temp := VarToStr(InternalReadSysParam(vfield+IntToStr(i),UserID,AType));
   end;
end;


function TDMTCCoreLink.ReadSysParam(vfield: String; Default, UserID,
  AType: Integer): Variant;
begin
  Result:=InternalReadSysParam(vfield,UserID,AType);
  if VarToStr(result)='' then
   result := Default ;
end;

function TDMTCCoreLink.ReadSysParam(Default:double ;vfield:String; UserID,
  AType: Integer): Variant;
begin
  Result:=InternalReadSysParam(vfield,UserID,AType);
   if VarToStr(result)='' then
   result := Default
   else
   begin
     result := StrToFloatDef(StringReplace(VarToStr(result),'.',DecimalSeparator,[rfReplaceAll]),Default)
   end;
end;

function TDMTCCoreLink.ReadSysParam(vfield, Default: String; UserID,
  AType: Integer): Variant;
begin

  Result:= InternalReadSysParam(vfield,UserID,AType);
  if VarToStr(result)='' then
   result := Default ;
end;

function TDMTCCoreLink.ReadSysParam(vfield: String; BValue: Boolean;
  UserID, AType: Integer): Variant ;
begin
  Result:= InternalReadSysParam(vfield,UserID,AType);
  if VarToStr(result)='' then
   result := BValue else
   begin
      if (VarToStr(result) <> '0') and (VarToStr(result) <> '1') and (VarToStr(result) <> '-1') then
        result := UpperCase(VarToStr(result)) = 'TRUE' ;
   end;
end;

procedure TDMTCCoreLink.WriteLongSysParam(vfield, Value: String; WUserID,
  WTypeID: Integer);
var
 i : Integer ;
 Temp : String ;
begin
  i := 0 ;
  // Clear old values
  Temp := vartoStr(InternalReadSysParam(vfield+IntToStr(i),WUserID,WTypeID));
  while  Temp <> '' do
   begin
      WriteSysParam(vfield+IntToStr(i),'',WUserID,WTypeID);
      inc(i);
      Temp := vartoStr(InternalReadSysParam(vfield+IntToStr(i),WUserID,WTypeID));
   end;

 i := 0 ;
 Temp := copy(Value,1,50);
 Delete(Value,1,50);
  while  Temp <> '' do
   begin
      WriteSysParam(vfield+IntToStr(i),Temp,WUserID,WTypeID);
      Temp := copy(Value,1,50);
      Delete(Value,1,50);
      inc(i);
   end;
end;

Procedure TDMTCCoreLink.CreatSysParamRec(vfield:String;UserID:integer=0;WTypeID:Integer=0);
var
 MaxID : Integer ;
begin
if tblSysParams.Connection <> TheZConnection then
    tblSysParams.Connection := TheZConnection ;
 if not tblSysParams.Active then tblSysParams.Active := true ; 
 try
  tblSysParams.Append;
  tblSysParams.FieldByName('SParamName').Value := RightStr(Uppercase(vfield),StrToIntDef(FSQLList.ParamsList.Values['SYSPARMSLENGTH'],35)) ;
  tblSysParams.FieldByName('WUserID').Value:=UserID;
  tblSysParams.FieldByName('WTypeID').Value:=WTypeID;
  tblSysParams.FieldByName('BActive').Value := 1;
  tblSysParams.FieldByName('WSourceID').AsInteger:=0;
  tblSysParams.FieldByName('WSourceTypeID').AsInteger:=0;
  tblSysParams.Post;
 except
   tblSysParams.Cancel ;
   MaxID := 1 + OpenSqlReturnFirstColumn('Select max(WParamId) from Sysparams') ;

   while DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID')  < MaxID do
      DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
  tblSysParams.Append;
  tblSysParams.FieldByName('SParamName').Value :=  RightStr(Uppercase(vfield),StrToIntDef(FSQLList.ParamsList.Values['SYSPARMSLENGTH'],35)) ;
  tblSysParams.FieldByName('WUserID').Value:=UserID;
  tblSysParams.FieldByName('WTypeID').Value:=WTypeID;
  tblSysParams.FieldByName('BActive').Value := 1;
  tblSysParams.FieldByName('WSourceID').AsInteger:=0;
  tblSysParams.FieldByName('WSourceTypeID').AsInteger:=0;
  tblSysParams.Post;
 end;
end;

procedure TDMTCCoreLink.WriteSysParam(vfield, Value: String; WUserID,
  WTypeID: Integer);
begin
  if tblSysParams.Connection <> TheZConnection then
    tblSysParams.Connection := TheZConnection ;

  tblSysParams.sql.text := SQLList.GetFormatedSQLByName('database_SysparamsOnUserTypeAndName');
  tblSysParams.ParamByName('SParamName').AsString := RightStr(Uppercase(vfield),StrToIntDef(FSQLList.ParamsList.Values['SYSPARMSLENGTH'],35)) ;
  tblSysParams.ParamByName('wUserID').Asinteger := WUserID ;
  tblSysParams.ParamByName('WTypeID').Asinteger := WTypeID ;
  tblSysParams.open ;
  if tblSysParams.IsEmpty then
    CreatSysParamRec(vfield,WUserID,WTypeID);
  if tblSysParams.FieldByName('SParamValue').AsString <> Value then
    begin
      tblSysParams.Edit;
      tblSysParams.FieldByName('SParamValue').AsString := Value;
      tblSysParams.Post;
    end;
end;

procedure TDMTCCoreLink.WriteSysParam(vfield: String; Default, WUserID,
  WTypeID: Integer);
begin
  WriteSysParam(vField,IntToStr(Default),WUserID,WTypeID);
end;

procedure TDMTCCoreLink.tblSysParamsAfterInsert(DataSet: TDataSet);
begin
 tblSysParams.FieldByName('WPARAMID').AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
end;

procedure TDMTCCoreLink.Setcurrentuser(const Value: integer);
begin

 if Fcurrentuser <> Value then
  begin
  if Fcurrentuser > 0 then
     CloseUserConnection ;
  Fcurrentuser := Value;
  if Value <= 0 then exit;
  if not TheZConnection.Connected then exit ;
  if TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select count(*) from LOGGEDIN where  DCONEND is null and WUSERID = ' + IntToStr(Fcurrentuser)) > 0 then
    begin
    if not (ExtraOptions.Values['ISAUTOMATED'] = 'TRUE') then
     begin
      if  MessageDlg('User could be logged on ' + VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select '+ QuotedStr(' PC: ') +
          ' || SPCNAME ||' + QuotedStr(' user: ') + '||SUSERNAME  from LOGGEDIN where  DCONEND is null and WUSERID = ' + IntToStr(Fcurrentuser))) + #13+#10 + 'Continue and clear log?'
          ,mtConfirmation,[mbYes,mbNo],0) = mrno then
        raise Exception.Create('Exit!' );
     end;
       TDataBaseRoutines.ExecSql('update LOGGEDIN set DCONEND = current_timestamp where DCONEND is null and WUSERID = ' + IntToStr(Fcurrentuser))
    end;

  ZQLoggedin.Close ;
  ZQLoggedin.open ;

        if ZQLoggedin.isempty then
            ZQLoggedin.Insert else
                begin


                 if ZQLoggedin.FieldByName('WUSERID').AsInteger = Fcurrentuser then
                   begin
                     ZQLoggedin.close ;
                     // dont handel
                     exit ;
                   end;
                 ZQLoggedin.Edit ;
                 ZQLoggedin.FieldByName('DConEnd').AsDateTime := OpenSqlReturnFirstColumn('select CURRENT_TIMESTAMP from RDB$DATABASE') ;
                 ZQLoggedin.post ;
                 ZQLoggedin.insert ;
                end;
            ZQLoggedin.FieldByName('WLOGID').AsInteger := GetNewId(tcidNewLogID);
            ZQLoggedin.FieldByName('WCONNECTIONID').AsInteger := OpenSqlReturnFirstColumn('select CURRENT_CONNECTION from RDB$DATABASE') ;
            if Fcurrentuser = -1 then
            ZQLoggedin.FieldByName('WUSERID').AsInteger := 0
            else
            ZQLoggedin.FieldByName('WUSERID').AsInteger := Fcurrentuser ;
            ZQLoggedin.FieldByName('SPCNAME').AsString  := TDatabaseUserRoutines.GetPcName ;
            ZQLoggedin.FieldByName('SUSername').AsString  := TDatabaseUserRoutines.GetWinUsername ;
            ZQLoggedin.FieldByName('DConStart').AsDateTime := OpenSqlReturnFirstColumn('select CURRENT_TIMESTAMP from RDB$DATABASE') ;
            ZQLoggedin.post ;
            ZQLoggedin.close ;
  end;
end;

function TDMTCCoreLink.ReadSysParam(vfield: String; BValue: TDateTime; UserID,
  AType: Integer): variant;
  var
   year,Month,Day : Integer ;
begin
  Result:= InternalReadSysParam(vfield,UserID,AType);
  if VarToStr(result)='' then
   result := BValue else
   begin
     year := StrToIntDef(copy(VarToStr(result),1,4),-1);
     Month := StrToIntDef(copy(VarToStr(result),5,2),-1);
     Day := StrToIntDef(copy(VarToStr(result),7,2),-1);
     if (year = -1 ) or (Month = -1) or ( Day <> -1) then
       result := BValue else
       result := EncodeDate(year,Month,Day) ;
   end;
end;

function TDMTCCoreLink.ReadNwReportOpSaveDate(vfield: String;
  DValue: TDateTime): Variant;
  Var
   DateString : String ;
   aYear,aMonth,aDay : Word ;
begin
  DateString := ReadNwReportOp(vfield);
  result := DValue ;
  If DateString <> '' then
     begin
      aYear := StrToIntDef(copy(DateString,1,4),2000);
      aMonth := StrToIntDef(copy(DateString,5,2),1);
      aDay := StrToIntDef(copy(DateString,7,2),1);
      result := EncodeDate(aYear,aMonth,aDay);
     end;
end;

function TDMTCCoreLink.WriteNwReportOpSaveDate(vfield: String;
  Value: TDateTime): Variant;
begin
  WriteNwReportOp(vfield,FormatDateTime('yyyymmdd',Value));
end;

function TDMTCCoreLink.DeleteOrderBy(AString: String): String;
var
 i : Integer ;
begin
 i := pos('ORDER',uppercase(AString)) ;
 if i > 1 then
   delete(AString,i,length(AString));
 result := AString ;
end;

procedure TDMTCCoreLink.UpdateDescription(MessageID: Integer;
  aDescription: String);

begin
   DescObject.UpdateDescription(MessageID,aDescription); 
end;

procedure TDMTCCoreLink.ZDesignConnectionPleaseDonotuseAfterConnect(
  Sender: TObject);
begin
 Showmessage('DMTCCorelink Do not use this connection in a plugin runtime! Assign DmTCCorelink.TheZConnection ');
end;

procedure TDMTCCoreLink.LogAction(aAction: String; AId: Integer;
  AMessage: String);
var
 AQuery : TuniQuery ;
 ALogId : Integer ;
begin
 AQuery := TuniQuery.Create(nil) ;
   try
     AQuery.Connection :=  TheZConnection ;
     AQuery.sql.Text := 'select WLogid from LOGGEDIN where wconnectionid = CURRENT_CONNECTION and dconend is null';
     AQuery.open ;
     ALogId := AQuery.fields[0].AsInteger ;
     if ALogId <> 0 then
     begin
       AQuery.sql.Text := 'INSERT INTO LOGENTRY (WLOGENTRYID, WLOGID, SLOGTYPE, SLOGMESSAGE, WLOGLINKID, DSYSDATE) '+
       ' VALUES ( '+GetGenUniSyntaxShort('GEN_LOGENTRYID')+', :logid,:Action,:MEssage,:Id,CURRENT_TIMESTAMP)' ;
       AQuery.Params[0].AsInteger := ALogId ;
       AQuery.Params[1].AsString := aAction ;
       AQuery.Params[2].AsString := AMessage ;
       AQuery.Params[3].AsInteger := AId ;
       AQuery.ExecSQL  ;
     end;
   finally
     AQuery.free ;
   end;

end;

procedure TDMTCCoreLink.CloseUserConnection;
begin
  if not TheZConnection.Connected then exit ;
  try
      ZQLoggedin.close ;
      ZQLoggedin.open ;
        if not ZQLoggedin.isempty then
                begin
                 ZQLoggedin.Edit ;
                 ZQLoggedin.FieldByName('DConEnd').AsDateTime := OpenSqlReturnFirstColumn('select CURRENT_TIMESTAMP from RDB$DATABASE') ;
                 ZQLoggedin.post ;
                end;
     ZQLoggedin.Close  ;
   except
     // no handel

   end;
end;

function TDMTCCoreLink.GetTimeAndTrail(APluginString: String;
  var aTime: String): String;
var
 TimeTrail : String ;

begin
  TimeTrail := '' ;
  aTime := '' ;
  if not TheGlobalDataObject.Registration.Registered then exit ;
   //TimeTrail found
  TimeTrail := copy(APluginString,pos('}',APluginString) +1,length(APluginString));
  //decode time trial
  aTime := copy(TimeTrail,1,pos('_',TimeTrail)-1);
end;
procedure TDMTCCoreLink.SetCurrentTheme(const Value: String);
begin
  FCurrentTheme := Value;
end;

procedure TDMTCCoreLink.UpdateTheme;
begin
CurrentTheme := TDatabaseRegistyRoutines.ReadOsfIni('Current Language','themename','classic') ;
end;

Procedure TDMTCCoreLink.Icon2Bmp(Size:Integer;IconName:String;bmp:TBitMap);
Var
  AIcon : TIcon;
  ARect:TRect;
begin
  AIcon := TIcon.Create ;
  ARect := rect(0, 0,Size,Size);
  try
   AIcon.Width  := Size ;
   AIcon.Height := Size ;
   AIcon.LoadFromFile(IconName);
   begin
       bmp.PixelFormat := pf32bit;
       bmp.Canvas.Draw(0,0,AIcon);
    end;
  finally
     AIcon.Free ;
  end;
end;

function TDMTCCoreLink.LoadImagename(AImage: String): String ;
Var
  TempFilename : String ;

Begin

  TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\' + CurrentTheme +'\'+ AImage +'.ico' ;

 if not FileExists(TempFilename) then
    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\' + CurrentTheme +'\'+ AImage +'.bmp' ;

 if not FileExists(TempFilename) then

    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\classic\'+ AImage +'.ico' ;
 if not FileExists(TempFilename) then
    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\classic\'+ AImage +'.bmp' ;
 if FileExists(TempFilename) then
 begin
     result := TempFilename ;

  end;
end;


procedure TDMTCCoreLink.LoadImage(ABitmap: Graphics.TBitmap; AImage: String;Prefsize : Integer = 16);
Var
  TempFilename : String ;

Begin

  TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\' + CurrentTheme +'\'+ AImage +'.ico' ;

 if not FileExists(TempFilename) then
    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\' + CurrentTheme +'\'+ AImage +'.bmp' ;

 if not FileExists(TempFilename) then

    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\classic\'+ AImage +'.ico' ;
 if not FileExists(TempFilename) then
    TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\classic\'+ AImage +'.bmp' ;
 if FileExists(TempFilename) then
 begin
 if UpperCase(ExtractFileExt(TempFilename)) ='.ICO' then
    begin

         ABitmap.Width := Prefsize ;
         ABitmap.Height := Prefsize ;
         ABitmap.Canvas.Brush.Color := ABitmap.TransparentColor ;
         ABitmap.Canvas.FillRect(rect(0,0,ABitmap.Width,ABitmap.Height));
         ABitmap.PixelFormat := pf32bit ;
         Icon2Bmp(Prefsize,TempFilename,ABitmap);

    end else
    ABitmap.LoadFromFile(TempFilename);
  end;  
end;

procedure TDMTCCoreLink.LoadIconImage(AIcon: Graphics.TIcon; AImage: String);
Var
  TempFilename : String ;

Begin
  TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\' + CurrentTheme +'\'+ AImage +'.ico' ;
 if not FileExists(TempFilename) then
   TempFilename :=  ExtractFilePath(Application.ExeName)+ 'bin\themes\classic\'+ AImage +'.ico' ;

 if FileExists(TempFilename) then
 begin
 if UpperCase(ExtractFileExt(TempFilename)) ='.ICO' then
    begin
      AIcon.LoadFromFile(TempFilename);
    end ;
  end;  
end;

procedure TDMTCCoreLink.SetGlobalSqlPrefix(const Value: String);
begin
  FGlobalSqlPrefix := Value;
end;


class function TDMTCCoreLink.GetLocalBaseDir: String;
var
 AIni : TStringList ;
  OwnBaseDir,aFile : String ;
begin
 AIni := TStringList.create ;
 try
   aFile :=  ExtractFilePath(GetModuleName(MainInstance))+TDatabaseRegistyRoutines.GetAppValue('ININAME') ;
   OwnBaseDir := '' ;
   if  FileExists(aFile)  then
   begin
   AIni.LoadFromFile(aFile);
   OwnBaseDir := AIni.Values['OWNOSFDIR'] ;                              
   // from registry
   aFile := TDatabaseRegistyRoutines.ReadAppRegValue('','OWNOSFDIR');
   if aFile <> '' then
     OwnBaseDir := aFile ;
   end;
 finally
   AIni.free ;
 end;

   result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) ;
   if trim(OwnBaseDir) <> '' then
      result := IncludeTrailingPathDelimiter(OwnBaseDir) ;
end;


class function TDMTCCoreLink.GetLocalPluginDir: String;
var
 AIni : TStringList ;
  OwnBaseDir,aFile : String ;
begin
 AIni := TStringList.create ;
 try
   aFile :=  ExtractFilePath(GetModuleName(MainInstance))+TDatabaseRegistyRoutines.GetAppValue('ININAME');

   if  FileExists(aFile)  then
   begin
   AIni.LoadFromFile(aFile);
   OwnBaseDir := AIni.Values['OWNPLUGINDIR'] ;
   // from registry
   aFile := TDatabaseRegistyRoutines.ReadAppRegValue('','OWNPLUGINDIR');
   if aFile <> '' then
     OwnBaseDir := aFile ;
   end;
 finally
   AIni.free ;
 end;

   result := ExtractFilePath(Application.ExeName)+'plug_ins\' ;
   if OwnBaseDir <> '' then
      result := IncludeTrailingPathDelimiter(OwnBaseDir) ;
end;

procedure TDMTCCoreLink.SetCreditorsControlAccountid(const Value: Integer);
begin
  FCreditorsControlAccountid := Value;
end;

procedure TDMTCCoreLink.SetDebtorsControlAccountid(const Value: Integer);
begin
  FDebtorsControlAccountid := Value;
end;

procedure TDMTCCoreLink.SetRetaindIncomeControlAccountid(
  const Value: Integer);
begin
  FRetaindIncomeControlAccountid := Value;
end;

function TDMTCCoreLink.GetTextLangDef(var MsgID: Integer;
  Default: String): String;
var
 AQuery : TuniQuery ;

 aTranslationCollectionItem : TTranslationCollectionItem ;
 AStringstream : TStringstream ;
begin
 result := GetTextLang(MsgID);
 if (Result = '') and (MsgID <= 0) then
    begin
     Result := Default ;

     AQuery := TuniQuery.Create(self) ;
      try
        AQuery.Connection := TheZConnection ;
        AQuery.SQL.Text := 'Select wtrnid, Cast(SDescription as varchar(3000)) as SDescription  from FREETRANSLATE where WTRNID = ' + IntToStr(- MsgID);
        AQuery.open ;
        if AQuery.IsEmpty then
        begin
        AQuery.SQL.Text := 'Insert into FREETRANSLATE  (WTRNID, SDESCRIPTION) VALUES (:WTRNID,:SDESCRIPTION)';
        if  MsgID = 0 then
            begin
               MsgID := - (StrToIntDef(varToStr(OpenSqlReturnFirstColumn('select max(WTRNID) from FREETRANSLATE')),1)+1);
            end ;

        AQuery.params[0].asinteger := - MsgID ;
        AStringstream := TStringstream.Create(Default) ;
        try
        AQuery.params[1].LoadFromStream(AStringstream,ftMemo) ;
        finally
        AStringstream.free ;
        end;
        AQuery.ExecSQL ;
       end;
        with TheGlobalDataObject.DefaultLanguage.Add as TTranslationCollectionItem do
           begin
              IndexID := MsgID  ;
              Text := Default ;
           end;

        aTranslationCollectionItem := TheGlobalDataObject.CurrentLanguage.Add as TTranslationCollectionItem ;
        aTranslationCollectionItem.IndexID :=  MsgID  ;
        aTranslationCollectionItem.Text := Default ;



      finally
       AQuery.free ;
      end;
  end;
end;

procedure TDMTCCoreLink.ReinitCustomLang;
var
 AQuery : TuniQuery ;
 i : Integer ;
begin
  // delete oldbooks trans and add new
  for i := TheGlobalDataObject.CurrentLanguage.Count -1 downto 0 do
    begin
      if TheGlobalDataObject.CurrentLanguage[i].IndexID < 0 then
        TheGlobalDataObject.CurrentLanguage.Delete(i);
    end;
  for i := TheGlobalDataObject.DefaultLanguage.Count -1 downto 0 do
    begin
      if TheGlobalDataObject.DefaultLanguage[i].IndexID < 0 then
        TheGlobalDataObject.DefaultLanguage.Delete(i);
    end;

  // add freetranslations
  AQuery := TuniQuery.Create(self) ;
  try
    AQuery.Connection := TheZConnection ;
    AQuery.SQL.Text := 'Select wtrnid, Cast(SDescription as varchar(3000)) as SDescription from FREETRANSLATE' ;
    AQuery.open ;
    if AQuery.IsEmpty then
       begin
         AQuery.SQL.Text := 'insert into FREETRANSLATE values(1,null)';
         AQuery.ExecSQL ;
       end else
       begin
        while not AQuery.eof do
           begin
             with (TheGlobalDataObject.CurrentLanguage.Add as TTranslationCollectionItem) do
               begin
                  IndexID := - AQuery.fields[0].asinteger ;
                  Text := AQuery.fields[1].AsString ;
               end;
             with (TheGlobalDataObject.DefaultLanguage.Add as TTranslationCollectionItem) do
              begin
                 IndexID := - AQuery.fields[0].asinteger ;
                 Text := AQuery.fields[1].AsString ;
              end;
             AQuery.next ;
           end;
      end;
  finally
   AQuery.free ;
  end;
end;

procedure TDMTCCoreLink.SetExtraOptions(const Value: TStringlist);
begin
  FExtraOptions := Value;
end;

procedure TDMTCCoreLink.SetGroupsObject(const Value: TGroupRecList);
begin
  FGroupsObject := Value;
end;

procedure TDMTCCoreLink.SetAccObject(const Value: TAccountRecList);
begin
  FAccObject := Value;
end;

function TDMTCCoreLink.GetTextNum(Atrans: String): Integer;
begin
 if self <> nil then
 result := TheGlobalDataObject.CurrentLanguage.GetTextNum(Atrans);
 if Result = 0 then
 result := TheGlobalDataObject.DefaultLanguage.GetTextNum(Atrans);
 if Result = 0 then
   GetTextLangDef(result,Atrans);

end;

function TDMTCCoreLink.GetAddTextNum(atrans: String): Integer;
var
 AQuery : TuniQuery ;
 Maxid : Integer ;
 aTranslationCollectionItem : TTranslationCollectionItem ;
  AStringstream : TStringStream ;
begin
 result := GetTextNum(atrans) ;
 if result <> 0 then exit ;
 AQuery := TuniQuery.Create(self) ;
  try
    AQuery.Connection := TheZConnection ;
    // >= 1.000.000 reserved for plugins
    AQuery.SQL.Text := 'Select max(WTRNID) from FREETRANSLATE where WTRNID < 1000000' ;
    AQuery.open ;
    maxid := AQuery.fields[0].asinteger + 1 ;
    AQuery.SQL.Text := 'Insert into FREETRANSLATE  (WTRNID, SDESCRIPTION) VALUES (:WTRNID,:SDESCRIPTION)';
    AQuery.params[0].asinteger := maxid ;
       AStringstream := TStringstream.Create(atrans) ;
        try
        AQuery.params[1].LoadFromStream(AStringstream,ftMemo) ;
        finally
        AStringstream.free ;
        end;

    AQuery.ExecSQL ;
    with TheGlobalDataObject.DefaultLanguage.Add as TTranslationCollectionItem do
       begin
          IndexID :=- maxid  ;
          Text := atrans ;
       end;
    aTranslationCollectionItem := TheGlobalDataObject.CurrentLanguage.Add as TTranslationCollectionItem ;
    aTranslationCollectionItem.IndexID :=- maxid  ;
    aTranslationCollectionItem.Text := atrans ;
  finally
   AQuery.free ;
  end;
end;

function TDMTCCoreLink.GetCurrentThemePath: String;
begin
 Result := ExtractFilePath(Application.ExeName) +'bin\themes\'+ CurrentTheme ;


end;

procedure TDMTCCoreLink.HandelCheckBatchDiv(BatchId: Integer);
var
 QGen : TuniQuery ;
 ReturnID : Integer ;
begin
 if StrToIntDef(FExtraOptions.Values['SYSDIVLEDGER'],0) <> 0 then
   begin
     ReturnID :=   StrToIntDef(FExtraOptions.Values['SYSDIVLEDGER'],0) ;
      QGen := TuniQuery.create(self) ;
      try
      QGen.Connection := TheZConnection ;
      QGen.SQL.Text := 'select sum(famount) ftotal,Wbatchid, WBATCHTYPEID,max(WLINEID) WLINEID,  max( DDATE) DDATE ' +
      ' from transact where wbatchid = '+ IntToStr(BatchId) + ' group by Wbatchid,WBATCHTYPEID having sum(famount) <> 0' ;
      QGen.open ;
      while not qgen.eof do
         begin
           ExecSql('INSERT INTO TRANSACT (WTRANSACTIONID, WBATCHID, WBATCHTYPEID, WLINEID, BCARRIEDFORWARD, BLASTYEAR, BLINKSUSED, BMULTIPLEITEMS,'+
           '   WACCOUNTID, DDATE, WPERIODID, WYEARID, SREFERENCE, FTAXRATE, WTAXACCOUNTID, FAMOUNT, FTAXAMOUNT, FOUTSTANDINGAMOUNT, BRECONCILED, WBALANCINGACCOUNTID, '+
           ' WDESCRIPTIONID, WCURRENCYID, FFOREXAMOUNT, WUSERID, UNUSED, DSYSDATE, BUNUSED, WTAX2ID, FCURRENCYRATE2, FTAXRATE2, FTAX2AMOUNT, WJOBCODEID, WPROFILEID,'+
           ' BEXCLUSIVE, WLINKEDID, WREPORTINGGROUP1ID, WREPORTINGGROUP2ID, WDOCID, DPAYMENTDATE, WREMITTANCECOUNT, WPAYMENTTYPE) '+
           ' VALUES ('+GetGenUniSyntaxShort('GEN_TRANSACTIONID') +' , '+  QGen.fieldByName('Wbatchid').AsString +', '+  QGen.fieldByName('WBATCHTYPEID').AsString +', '+  IntToStr(QGen.fieldByName('WLINEID').AsInteger+1)

           +', 0, NULL, 0, 1, '+IntToStr(ReturnID)+', ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(QGen.fieldByName('DDATE').AsDateTime) +  ', 0, 0, ' + QuotedStr('COR') + ' , 0, NULL, ' +
           TDatabaseTableRoutines.GetFirebirdsSqlForFloat(-QGen.fieldByName('ftotal').AsFloat) + ', 0, ' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(-QGen.fieldByName('ftotal').AsFloat) + ', 0, NULL, '
           +' 0, 0, 1, 1, NULL, current_timestamp, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '+  IntToStr(QGen.fieldByName('WLINEID').AsInteger+1)+', 0, 0, 0, ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(QGen.fieldByName('DDATE').AsDateTime) +  ', NULL, NULL)');

           qgen.Next ;
         end;

    finally
       QGen.free ;
    end;
   end;
end;

function TDMTCCoreLink.GetGenUniSyntax(Genname: String): String;
begin
 if ExtraOptions.Values['ORACLE']= 'true' then
  begin
    result := 'select  '  + Genname + '.nextval  from dual' ;
  end else
  begin
    result := 'select GEN_ID('  + Genname + ',1) from RDB$DATABASE' ;
  end;
end;

function TDMTCCoreLink.GetGenUniSyntaxShort(Genname: String): String;
begin
 if ExtraOptions.Values['ORACLE']= 'true' then
  begin
    result := Genname + '.nextval' ;
  end else
  begin
    result := 'GEN_ID('  + Genname + ',1)' ;
  end;

end;

procedure TDMTCCoreLink.SetDescObject(const Value: TDescriptionRecList);
begin
  FDescObject := Value;
end;

end.
