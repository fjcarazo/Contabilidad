unit UMainExpImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   DBAccess , Uni, DB,
  ExtCtrls, DBCtrls, Grids, DBGrids,
  StdCtrls, Mask, ComCtrls,UCDSLinkRoutines,osfLookup,UDMHandelRawdata,IdComponent,
  MemDS;

type
  TFormMainExpImp = class(TForm)
    ZTIMPSOURCE: TuniTable;
    ZTIMPSOURCEIMP_SOURCEID: TIntegerField;
    ZTIMPSOURCEIMP_NAME: TStringField;
    ZTIMPSOURCEIMP_DEBTORURL: TStringField;
    ZTIMPSOURCEIMP_CREDITORURL: TStringField;
    ZTIMPSOURCEIMP_STOCKURL: TStringField;
    ZTIMPSOURCEIMP_DOCUMENTURL: TStringField;
    ZTIMPSOURCEIMP_EVENTURL: TStringField;
    ZTIMPSOURCEIMP_CONTACTURL: TStringField;
    dsSource: TDataSource;
    ZTIMPSOURCEIMP_SOURCE_LOGICTYPE: TIntegerField;
    DSImportGrid: TDataSource;
    ZTIMPSOURCEIMP_OSFINANCIALS_PHP_URL: TStringField;
    ZTIMPSOURCEIMP_USERNAME: TStringField;
    ZTIMPSOURCEIMP_PASSWORD: TStringField;
    ZTIMPSOURCEIMP_PREFIX: TStringField;
    ZTIMPSTOCKACCOUNTS: TuniTable;
    ZTIMPSTOCKACCOUNTSIMP_STOCKACCOUNTSID: TIntegerField;
    ZTIMPSTOCKACCOUNTSIMP_SOURCEID: TIntegerField;
    ZTIMPSTOCKACCOUNTSIMP_EXTID: TStringField;
    ZTIMPSTOCKACCOUNTSWSALESACCOUNTID: TIntegerField;
    ZTIMPSTOCKACCOUNTSWCOSTOFSALESACCOUNTID: TIntegerField;
    ZTIMPSTOCKACCOUNTSWSTOCKACCOUNTID: TIntegerField;
    ZTIMPSTOCKACCOUNTSWINPUTTAXACCOUNTID: TIntegerField;
    ZTIMPSTOCKACCOUNTSWOUTPUTTAXACCOUNTID: TIntegerField;
    DataSource2: TDataSource;
    PCMain: TPageControl;
    TabSheet1: TTabSheet;
    pcStreamTypes: TPageControl;
    tsContacts: TTabSheet;
    DBNavigator2: TDBNavigator;
    BImportContacts: TButton;
    BImportDebtors: TButton;
    BImportStock: TButton;
    TSSetup: TTabSheet;
    ZTIMPSOURCEIMP_INIFILE: TBlobField;
    TabSheet2: TTabSheet;
    dsDetail: TDataSource;
    dsMaster: TDataSource;
    BImportdocuments: TButton;
    pcSettings: TPageControl;
    TabSheet3: TTabSheet;
    Label22: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    TabSheet4: TTabSheet;
    dsFreeSelect: TDataSource;
    DBGrid6: TDBGrid;
    MFreeSql: TMemo;
    Button6: TButton;
    TabSheet5: TTabSheet;
    LWSTOCKACCOUNTSID: TLabel;
    Label15: TLabel;
    LWSALESACCOUNTID: TLabel;
    LWCOSTOFSALESACCOUNTID: TLabel;
    LWINPUTTAXACCOUNTID: TLabel;
    LWOUTPUTTAXACCOUNTID: TLabel;
    Label21: TLabel;
    DBGrid5: TDBGrid;
    DBNavigator5: TDBNavigator;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    ZTIMPTOTALS: TuniTable;
    ZTIMPTOTALSIMP_TOTALID: TIntegerField;
    ZTIMPTOTALSIMP_SOURCEID: TIntegerField;
    ZTIMPTOTALSIMP_EXTID: TStringField;
    ZTIMPTOTALSWSTOCKID: TIntegerField;
    DBGrid7: TDBGrid;
    DBNavigator3: TDBNavigator;
    Label13: TLabel;
    dsImpTotals: TDataSource;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    Button10: TButton;
    Button11: TButton;
    Panel1: TPanel;
    DBGrid4: TDBGrid;
    DBGrid3: TDBGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Splitter2: TSplitter;
    DBGrid2: TDBGrid;
    DBGrid8: TDBGrid;
    Memo1: TMemo;
    BUploadDebtors: TButton;
    BUploadContacts: TButton;
    MUploadLog: TMemo;
    Label17: TLabel;
    ZExternalCon: TUniconnection;
    procedure FormShow(Sender: TObject);
    procedure ZTIMPSOURCEAfterInsert(DataSet: TDataSet);
    procedure BImportContactsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure pcStreamTypesChange(Sender: TObject);
    procedure BImportDebtorsClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BImportStockClick(Sender: TObject);
    procedure ZTIMPSOURCEAfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure ZTIMPSTOCKACCOUNTSAfterInsert(DataSet: TDataSet);
    procedure ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BImportdocumentsClick(Sender: TObject);
    procedure DBMemo1DblClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ZTIMPTOTALSAfterInsert(DataSet: TDataSet);
    procedure Button10Click(Sender: TObject);
    procedure ZTIMPTOTALSWSTOCKIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure BUploadDebtorsClick(Sender: TObject);
  private

    aFmLookup : TosfLookup ;
   { Private declarations }
  public
    aDMHandelRawdata : TDMHandelRawdata ;

    procedure ReadSettings(atype:integer);
    procedure WriteSettings(atype:integer);
   { Public declarations }
  end;

var
  FormMainExpImp: TFormMainExpImp;

function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
procedure OSFGetPluginInfo(Var TrnDescription,TrnGroup : Integer ; Var GUID1024 : PChar) ; stdcall ;


implementation

{$R *.dfm}
 uses strutils , UDMTCCoreLink, TcashClasses, OSFGeneralRoutines,
  UDMAccountStockDocument ;


procedure OSFGetPluginInfo(Var TrnDescription,TrnGroup : Integer ; Var GUID1024 : PChar) ; stdcall ;
var
 i : Integer ;
 Text : String ;
begin
 try
     TrnDescription := 3404 ;
     TrnGroup :=  3374 ;
     Text := '{4BE73D94-6C3D-4844-B0D4-29399D18A463}' ;
        I := 0;
        while (I < length(Text)) do
        begin
          GUID1024[I] := Text[I+1];
          Inc(I);
        end;
        GUID1024[I] := #0;
  except
     // no handel
  end;
end;


function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
begin
  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  AApplication ;
     DMAccountStockDocument := TDMAccountStockDocument.Create(nil);
       try
         DMTCCoreLink.AssignConnectionToChilds(DMAccountStockDocument);
         FormMainExpImp:= TFormMainExpImp.Create(Application);
         try
          DMTCCoreLink.AssignConnectionToChilds(FormMainExpImp);
          result := FormMainExpImp.ShowModal ;
         finally
           FreeAndNil(FormMainExpImp) ;
         end;
       finally
        DMAccountStockDocument.free ;
       end;
   finally
        FreeAndNil(DMTCCoreLink);
   end;
end;

procedure TFormMainExpImp.FormShow(Sender: TObject);
begin
 ZTIMPSOURCE.open ;
 ZTIMPSOURCE.Locate('IMP_SOURCEID',VartoStr(DMTCCoreLink.ReadNwReportOp('IMP_LASTIMPTYPE','0')),[]);
 PCMain.ActivePageIndex := 0 ;
 pcSettings.ActivePageIndex := 0 ;
 pcStreamTypes.ActivePageIndex := 0 ;
end;

procedure TFormMainExpImp.ZTIMPSOURCEAfterInsert(DataSet: TDataSet);
begin
  ZTIMPSOURCEIMP_SOURCEID.AsInteger := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select Max(IMP_SOURCEID) from IMP_SOURCE')),0) + 1;
  ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger := 0 ;
end;

procedure TFormMainExpImp.BImportContactsClick(Sender: TObject);
begin
 ReadSettings(1) ;
 aDMHandelRawdata.LoadContacts(ZTIMPSOURCEIMP_SOURCEID.AsInteger,ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger);
 WriteSettings(1);
end;

procedure TFormMainExpImp.FormDestroy(Sender: TObject);
begin
DMTCCoreLink.WriteNwReportOp('IMP_LASTIMPTYPE',ZTIMPSOURCE.fieldByname('IMP_SOURCEID').AsString) ;
aFmLookup.free ;
aDMHandelRawdata.free ;
end;

procedure TFormMainExpImp.FormCreate(Sender: TObject);
begin
 aDMHandelRawdata := TDMHandelRawdata.Create(self);
 DSImportGrid.DataSet :=  aDMHandelRawdata.aMemoryData ;
 aFmLookup := TosfLookup.Create(nil) ;
 aFmLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
 aFmLookup.aOSAConnectionItem := DMTCCoreLink.TheOSAConnectionItem ;
end;

procedure TFormMainExpImp.Button3Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPSTOCKACCOUNTSWCOSTOFSALESACCOUNTID.AsInteger ;
      aFmLookup.SelectLookup(self,LWCOSTOFSALESACCOUNTID.Caption,tcstGLTHREE,tcltAccount,ToId);
      ZTIMPSTOCKACCOUNTS.Edit;
      ZTIMPSTOCKACCOUNTSWCOSTOFSALESACCOUNTID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.pcStreamTypesChange(Sender: TObject);
begin
{ ReadSettings ;
 aDMHandelRawdata.aImportLink.FillCDSWithQuery(aExternalMemoryData,aDMHandelRawdata.aImportLink.SQLList.GetFormatedSQLByName('SelectAllCustomers'+ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsString));
 DMAccountStockDocument.CreateCustomersDataset(aMemoryData);
 aDMHandelRawdata.aImportLink.mapfields(aExternalMemoryData,aMemoryData,aDMHandelRawdata.aImportLink.SQLList.GetFormatedSQLByName('CustFieldmap'+ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsString),false);
 DMAccountStockDocument.AddEditCustomers(aMemoryData,ZTIMPSOURCEIMP_SOURCEID.AsInteger);
 }
//  if pcStreamTypes.ActivePage = tsContacts then
 //   DMAccountStockDocument.GetContacts(aMemoryData,'select FIRST 10 skip 0 * from contacts')
 // else
 // if pcStreamTypes.ActivePage = tsContacts then

  //else
  //if pcStreamTypes.ActivePage = tsContacts then


end;

procedure TFormMainExpImp.BImportDebtorsClick(Sender: TObject);
begin
 ReadSettings(0) ;
 aDMHandelRawdata.LoadDebtors(ZTIMPSOURCEIMP_SOURCEID.AsInteger,ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger);
 WriteSettings(0) ;
end;

procedure TFormMainExpImp.DBMemo1DblClick(Sender: TObject);
begin
 if DBMemo1.DataSource.DataSet.IsEmpty then exit ;
 DBMemo1.DataSource.DataSet.Edit ;
     // defaults for default types
    if ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger = 1 then
      begin
        if DBMemo1.Lines.Values['LOGICTYPE'] = '' then
           DBMemo1.Lines.add('LOGICTYPE=1') ;
        if DBMemo1.Lines.Values['FROMDATEDOC'] = '' then
           DBMemo1.Lines.add('FROMDATEDOC=0') ;
        if DBMemo1.Lines.Values['DATETIMEFORMAT'] = '' then
           DBMemo1.Lines.add('DATETIMEFORMAT=yyyymmdd hh:nn:ss') ;
      end;
    if ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger = 0 then
      begin
        if DBMemo1.Lines.Values['LOGICTYPE'] = '' then
           DBMemo1.Lines.add('LOGICTYPE=2') ;
        if DBMemo1.Lines.Values['LASTAUDITID'] = '' then
           DBMemo1.Lines.add('LASTAUDITID=0') ;
        if DBMemo1.Lines.Values['LASTAUDITID0'] = '' then
           DBMemo1.Lines.add('LASTAUDITID0=0') ;
        if DBMemo1.Lines.Values['LASTAUDITID1'] = '' then
           DBMemo1.Lines.add('LASTAUDITID1=0') ;
        if DBMemo1.Lines.Values['LASTAUDITID2'] = '' then
           DBMemo1.Lines.add('LASTAUDITID2=0') ;
        if DBMemo1.Lines.Values['LASTAUDITID3'] = '' then
           DBMemo1.Lines.add('LASTAUDITID3=0') ;
        if DBMemo1.Lines.Values['LASTAUDITID4'] = '' then
           DBMemo1.Lines.add('LASTAUDITID4=0') ;
        if DBMemo1.Lines.Values['SYNCDATA'] = '' then
           DBMemo1.Lines.add('SYNCDATA=0') ;
        if DBMemo1.Lines.Values['OSFDATETIMEFORMAT'] = '' then
           DBMemo1.Lines.add('OSFDATETIMEFORMAT=yyyy/mm/dd hh:nn:ss') ;
        if DBMemo1.Lines.Values['VTDATETIMEFORMAT'] = '' then
           DBMemo1.Lines.add('VTDATETIMEFORMAT=yyyymmdd hh:nn:ss') ;
        if DBMemo1.Lines.Values['UPLFROMDATEDEBT'] = '' then
           DBMemo1.Lines.add('UPLFROMDATEDEBT=0') ;
      end;
 DBMemo1.DataSource.DataSet.Post ;
end;

procedure TFormMainExpImp.ReadSettings(atype:integer);
var
 MaxDate : TDatetime ;
begin
 aDMHandelRawdata.aImportLink.Username := ZTIMPSOURCEIMP_USERNAME.AsString ;
 aDMHandelRawdata.aImportLink.Password := ZTIMPSOURCEIMP_PASSWORD.AsString ;
 aDMHandelRawdata.aImportLink.RemoteURL := ZTIMPSOURCEIMP_OSFINANCIALS_PHP_URL.AsString ;
 aDMHandelRawdata.aImportLink.SQLList.ParamsList.Assign(DBMemo1.Lines);
 // translate params
 if DBMemo1.Lines.Values['LOGICTYPE'] = '1' then
   begin
     MaxDate := StrToFloatDef(StringReplace(DBMemo1.Lines.Values['FROMDATEDOC'],'.',DecimalSeparator,[]),0) ;
     aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['FROMDATEDOCDATE'] := FormatDateTime(aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['DATETIMEFORMAT'],MaxDate)

   end;
 if DBMemo1.Lines.Values['LOGICTYPE'] = '0' then
   begin
    if DBMemo1.Lines.Values['SYNCDATA'] = '1' then
       begin
         aDMHandelRawdata.aImportLink.FillCDSWithQuery(aDMHandelRawdata.aMemoryData,aDMHandelRawdata.aImportLink.SQLList.GetFormatedSQLByName('SyncSQLLastNumber' + ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsString));
         aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['NEXTMAX'+IntToStr(atype)] := IntToStr(aDMHandelRawdata.aMemoryData.Fields[0].AsInteger);
       end;
   end;
end;

procedure TFormMainExpImp.WriteSettings(atype:integer);
var
 MaxDate : TDatetime ;
begin
 if DBMemo1.DataSource.DataSet.IsEmpty then exit ;
 if DBMemo1.Lines.Values['LOGICTYPE'] = '1' then
   begin
      if atype = 3 then
         begin
          MaxDate := StrToFloatDef(StringReplace(DBMemo1.Lines.Values['FROMDATEDOC'],'.',DecimalSeparator,[]),0) ;
          aDMHandelRawdata.aExternalMemoryData.First ;
          While not aDMHandelRawdata.aExternalMemoryData.Eof do
            begin
               if aDMHandelRawdata.aExternalMemoryData.FieldByName('DSYSDATE').AsDateTime > MaxDate then
                 MaxDate := aDMHandelRawdata.aExternalMemoryData.FieldByName('DSYSDATE').AsDateTime ;
                 aDMHandelRawdata.aExternalMemoryData.Next ;
            end;
          DBMemo1.DataSource.DataSet.Edit ;
          DBMemo1.Lines.Values['FROMDATEDOC'] := StringReplace(FormatFloat('0.0000000000',MaxDate),DecimalSeparator,'.',[rfReplaceAll]);
          DBMemo1.DataSource.DataSet.Post ;
        end;
    end;
 if DBMemo1.Lines.Values['LOGICTYPE'] = '0' then
   begin
      if DBMemo1.Lines.Values['SYNCDATA'] = '1' then
        begin
          DBMemo1.DataSource.DataSet.Edit ;
          DBMemo1.Lines.Values['LASTAUDITID' + IntToStr(atype) ] := aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['NEXTMAX'+ IntToStr(atype)] ;
          DBMemo1.DataSource.DataSet.Post ;
        end;
    end;
end;


procedure TFormMainExpImp.DBGrid3DblClick(Sender: TObject);

var
 i : Integer ;
begin
 for i := 0 to TDbgrid(Sender).DataSource.DataSet.FieldCount -1 do
  begin
    memo1.Lines.Add(TDbgrid(Sender).DataSource.DataSet.Fields[i].FieldName) ;

  end;
end;


procedure TFormMainExpImp.BImportStockClick(Sender: TObject);
begin
 ReadSettings(2) ;
 aDMHandelRawdata.LoadStock(ZTIMPSOURCEIMP_SOURCEID.AsInteger,ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger);
 WriteSettings(2) ;
end;

procedure TFormMainExpImp.ZTIMPSOURCEAfterScroll(DataSet: TDataSet);
begin
ZTIMPSTOCKACCOUNTS.DisableControls ;
ZTIMPTOTALS.DisableControls ;
try
ZTIMPSTOCKACCOUNTS.Close ;
ZTIMPSTOCKACCOUNTS.Filtered := False ;
if not ZTIMPSOURCE.IsEmpty then
ZTIMPSTOCKACCOUNTS.Filter := 'IMP_SOURCEID=' + ZTIMPSOURCEIMP_SOURCEID.asstring;
ZTIMPSTOCKACCOUNTS.Filtered := true ;
ZTIMPSTOCKACCOUNTS.Open ;

ZTIMPTOTALS.Close ;
ZTIMPTOTALS.Filtered := False ;
if not ZTIMPSOURCE.IsEmpty then
ZTIMPTOTALS.Filter := 'IMP_SOURCEID=' + ZTIMPSOURCEIMP_SOURCEID.asstring;
ZTIMPTOTALS.Filtered := true ;
ZTIMPTOTALS.Open ;

finally
ZTIMPSTOCKACCOUNTS.EnableControls ;
ZTIMPTOTALS.EnableControls ;
end;
end;

procedure TFormMainExpImp.Button2Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPSTOCKACCOUNTSWSTOCKACCOUNTID.AsInteger ;
      aFmLookup.SelectLookup(self,LWSTOCKACCOUNTSID.Caption,tcstGLTHREE,tcltAccount,ToId);
      ZTIMPSTOCKACCOUNTS.Edit;
      ZTIMPSTOCKACCOUNTSWSTOCKACCOUNTID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.ZTIMPSTOCKACCOUNTSAfterInsert(DataSet: TDataSet);
begin
  ZTIMPSTOCKACCOUNTSIMP_SOURCEID.AsInteger := ZTIMPSOURCEIMP_SOURCEID.AsInteger ;
  ZTIMPSTOCKACCOUNTSIMP_STOCKACCOUNTSID.AsInteger := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select Max(IMP_STOCKACCOUNTSID) from IMP_STOCKACCOUNTS')),0) + 1;
end;

procedure TFormMainExpImp.ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 Text := TDataBaseRoutines.GetAccountCode(Sender.AsInteger) ;
end;

procedure TFormMainExpImp.Button5Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPSTOCKACCOUNTSWSALESACCOUNTID.AsInteger ;
      aFmLookup.SelectLookup(self,LWSALESACCOUNTID.Caption,tcstGLTHREE,tcltAccount,ToId);
      ZTIMPSTOCKACCOUNTS.Edit;
      ZTIMPSTOCKACCOUNTSWSALESACCOUNTID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.Button8Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPSTOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger ;
      aFmLookup.SelectLookup(self,LWOUTPUTTAXACCOUNTID.Caption,tcstTAX,tcltAccount,ToId);
      ZTIMPSTOCKACCOUNTS.Edit;
      ZTIMPSTOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.Button7Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPSTOCKACCOUNTSWINPUTTAXACCOUNTID.AsInteger ;
      aFmLookup.SelectLookup(self,LWSALESACCOUNTID.Caption,tcstTAX,tcltAccount,ToId);
      ZTIMPSTOCKACCOUNTS.Edit;
      ZTIMPSTOCKACCOUNTSWINPUTTAXACCOUNTID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.BImportdocumentsClick(Sender: TObject);
begin
 ReadSettings(3) ;
 aDMHandelRawdata.LoadDocuments(ZTIMPSOURCEIMP_SOURCEID.AsInteger,ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger);
 dsDetail.DataSet := aDMHandelRawdata.aNesteldData ;
 // Update INI fields
 WriteSettings(3) ;
end;       


procedure TFormMainExpImp.Button6Click(Sender: TObject);
begin
 ReadSettings(0) ;
 aDMHandelRawdata.aImportLink.FillCDSWithQuery(aDMHandelRawdata.aExternalMemoryData,MFreeSql.Text);
 dsFreeSelect.DataSet := aDMHandelRawdata.aExternalMemoryData ;
end;

procedure TFormMainExpImp.ZTIMPTOTALSAfterInsert(DataSet: TDataSet);
begin
  ZTIMPTOTALSIMP_SOURCEID.AsInteger := ZTIMPSOURCEIMP_SOURCEID.AsInteger ;
  ZTIMPTOTALSIMP_TOTALID.AsInteger := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select max(IMP_TOTALID)  from IMP_TOTALS')),0) + 1;
end;

procedure TFormMainExpImp.Button10Click(Sender: TObject);
var
 ToId : Integer ;
begin
      ToId := ZTIMPTOTALSWSTOCKID.AsInteger ;
      aFmLookup.SelectLookup(self,LWCOSTOFSALESACCOUNTID.Caption,tcstGLTHREE,tcltStock,ToId);
      ZTIMPTOTALS.Edit;
      ZTIMPTOTALSWSTOCKID.AsInteger := aFmLookup.ReturnID ;
end;

procedure TFormMainExpImp.ZTIMPTOTALSWSTOCKIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
     Text := TDataBaseStockRoutines.GetStockFullDescription(ZTIMPTOTALSWSTOCKID.AsInteger);
end;

procedure TFormMainExpImp.DBGrid6DblClick(Sender: TObject);
var
  i : Integer ;
begin
  for i := 0 to DBGrid6.DataSource.DataSet.FieldCount -1 do
    begin
       MFreeSql.Lines.Add(DBGrid6.DataSource.DataSet.Fields[i].FieldName +',') ;
    end;
end;

procedure TFormMainExpImp.Button11Click(Sender: TObject);
begin
 BImportDebtorsClick(self);
 BImportContactsClick(self);
 BImportStockClick(self);
 BImportdocumentsClick(self);
end;

procedure TFormMainExpImp.BUploadDebtorsClick(Sender: TObject);
var
 MaxDate : TDateTime ;
begin
  aDMHandelRawdata.ALog.Clear ;
  aDMHandelRawdata.aImportLink.Username := ZTIMPSOURCEIMP_USERNAME.AsString ;
  aDMHandelRawdata.aImportLink.Password := ZTIMPSOURCEIMP_PASSWORD.AsString ;
  aDMHandelRawdata.aImportLink.RemoteURL := ZTIMPSOURCEIMP_OSFINANCIALS_PHP_URL.AsString ;
  aDMHandelRawdata.aImportLink.SQLList.ParamsList.Assign(DBMemo1.Lines);
  MaxDate := StrToFloatDef(StringReplace(DBMemo1.Lines.Values['UPLFROMDATEDEBT'],'.',DecimalSeparator,[]),0) ;
  aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['UPLFROMDATEDEBT'] := FormatDateTime(aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['OSFDATETIMEFORMAT'],MaxDate) ;
  aDMHandelRawdata.SaveDebtors(ZTIMPSOURCEIMP_SOURCEID.AsInteger,ZTIMPSOURCEIMP_SOURCE_LOGICTYPE.AsInteger);
  DSImportGrid.DataSet := aDMHandelRawdata.aQuery;
  MaxDate := DMTCCoreLink.OpenSqlReturnFirstColumn('Select coalesce(max(dsysdate),cast(' + QuotedStr( FormatDateTime(aDMHandelRawdata.aImportLink.SQLList.ParamsList.Values['OSFDATETIMEFORMAT'],0)) + ' as timestamp)) from account where WAccountTypeId = 1');
  DBMemo1.DataSource.DataSet.Edit ;
  DBMemo1.Lines.Values['UPLFROMDATEDEBT'] := StringReplace(FormatFloat('0.0000000000',MaxDate),DecimalSeparator,'.',[rfReplaceAll]);
  DBMemo1.DataSource.DataSet.Post ;
  MUploadLog.Text := aDMHandelRawdata.ALog.Text ;
 
end;

end.

