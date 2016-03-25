unit UMainConversiontc4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, rpmdesignervcl, ZConnection,
  rpcompobase, rpvclreport,TcashClasses, ComCtrls, ExtCtrls, CheckLst,
    DAScript, UniScript, DBAccess, Uni, MemDS;

type
  TFormMainConversion = class(TForm)
    PCConversion: TPageControl;
    TsStart: TTabSheet;
    ETC37Folder: TEdit;
    BNext: TButton;
    PHideTabs: TPanel;
    MemohelpFindFile: TMemo;
    TCConvBooks: TTabSheet;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    ZTable1: TUniTable;
    ZConnection1: TUniConnection;
    ZQuery3: TUniQuery;
    ZUpdateSQL1: TUniUpdateSQL;
    ZQuery2: TUniQuery;
    DataSource1: TDataSource;
    ZTable2: TUniTable;
    ZTable2WSTOCKID: TIntegerField;
    ZTable2SSTOCKCODE: TStringField;
    ZTable2SBARCODENUMBER: TStringField;
    ZTable2SDESCRIPTION: TStringField;
    ZTable2WREPORTINGGROUP1ID: TIntegerField;
    ZTable2WREPORTINGGROUP2ID: TIntegerField;
    ZTable2WCOSTACCOUNTID: TIntegerField;
    ZTable2WINPUTTAXID: TIntegerField;
    ZTable2WOUTPUTTAXID: TIntegerField;
    ZTable2FOPENINGAVECOST: TFloatField;
    ZTable2FQTYONHAND: TFloatField;
    ZTable2FOPENINGQTY: TFloatField;
    ZTable2FINVQTYONHAND: TFloatField;
    ZTable2FREORDERQTY: TFloatField;
    ZTable2WSALESACCOUNTID: TIntegerField;
    ZTable2BAPPLYINVOICEDISCOUNT: TSmallintField;
    ZTable2WSTOCKACCOUNTID: TIntegerField;
    ZTable2FSELLINGPRICE1: TFloatField;
    ZTable2FSELLINGPRICE2: TFloatField;
    ZTable2FSELLINGPRICE3: TFloatField;
    ZTable2FUNITAVECOST: TFloatField;
    ZTable2FUNITCOST: TFloatField;
    ZTable2WUNITID: TIntegerField;
    ZTable2DSYSDATE: TDateTimeField;
    ZTable2BAPPLYTAX: TSmallintField;
    ZTable2WINPUTTAX2ID: TIntegerField;
    ZTable2BTAXABLE: TSmallintField;
    ZTable2WSUPPLIER1ID: TIntegerField;
    ZTable2WSUPPLIER2ID: TIntegerField;
    ZTable2WSTOCKTYPEID: TIntegerField;
    ZTable2WOUTPUTTAX2ID: TIntegerField;
    ZTable2WPROFILEID: TIntegerField;
    ZTable2BDISABLED: TSmallintField;
    ZTable2WPERENTID: TIntegerField;
    ZTable2WLOCATIONID: TIntegerField;
    ZTable2WFILENAMEID: TIntegerField;
    ZQuery1: TUniQuery;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    MemoSQLError: TMemo;
    TabSheet3: TTabSheet;
    Memo5: TMemo;
    Memo1: TMemo;
    Memo2: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    MemoSQLErrorRunSql: TMemo;
    TabSheet4: TTabSheet;
    Button3: TButton;
    MDoneTables: TMemo;
    Button6: TButton;
    CBCopyReports: TCheckBox;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    Button7: TButton;
    Label4: TLabel;
    Button8: TButton;
    CBSetOfBooksToConvert: TCheckListBox;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    PBMainPRocess: TProgressBar;
    Label1: TLabel;
    Label5: TLabel;
    ZConTC4: TUniConnection;
    ZQData: TUniQuery;
    Ztc4Table: TUniTable;
    ZUSQLToLogo: TUniUpdateSQL;
    ZQToLogo: TUniQuery;
    ZQToLogoSCOMPANYNAME: TStringField;
    ZQToLogoSCOMPANYREGNO: TStringField;
    ZQToLogoWEMAILSERVERADDRESS: TStringField;
    ZQToLogoWFAXSERVERID: TIntegerField;
    ZQToLogoBLOBLOGO: TBlobField;
    ZQToLogoSADDRESS1: TStringField;
    ZQToLogoSADDRESS2: TStringField;
    ZQToLogoSADDRESS3: TStringField;
    ZQToLogoSPOSTCODE: TStringField;
    ZQToLogoSPHONENUMBER: TStringField;
    ZQToLogoSFAXNUMBER: TStringField;
    ZQToLogoWRETAINEDINCOMEID: TIntegerField;
    ZQToLogoWDEBTORSCONTROLID: TIntegerField;
    ZQToLogoWCREDITORSCONTROLID: TIntegerField;
    ZQToLogoSBACKUPPATH: TStringField;
    ZQToLogoWCOSTOFSALESTYPEID: TIntegerField;
    ZQToLogoWCREDITNOTEBATCHTYPEID: TIntegerField;
    ZQToLogoSCREDITNOTEMESSAGE1: TStringField;
    ZQToLogoSCREDITNOTEMESSAGE2: TStringField;
    ZQToLogoSCREDITNOTEMESSAGE3: TStringField;
    ZQToLogoWPURCHASESBATCHID: TIntegerField;
    ZQToLogoSPURCHASESMESSAGE1: TStringField;
    ZQToLogoSPURCHASESMESSAGE2: TStringField;
    ZQToLogoSPURCHASESMESSAGE3: TStringField;
    ZQToLogoWGOODSRETURNEDBATCHID: TIntegerField;
    ZQToLogoSGOODSRETURNEDMESSAGE1: TStringField;
    ZQToLogoSGOODSRETURNEDMESSAGE2: TStringField;
    ZQToLogoSGOODSRETURNEDMESSAGE3: TStringField;
    ZQToLogoWINVOICESBATCHID: TIntegerField;
    ZQToLogoSINVOICESMESSAGE1: TStringField;
    ZQToLogoSINVOICESMESSAGE2: TStringField;
    ZQToLogoSINVOICESMESSAGE3: TStringField;
    ZQToLogoWDISPLAYAMOUNT: TIntegerField;
    ZQToLogoBACCOUNTSOPEN: TSmallintField;
    ZQToLogoBBATCHTYPES: TSmallintField;
    ZQToLogoBGROUPS: TSmallintField;
    ZQToLogoBNOTCLOSED: TSmallintField;
    ZQToLogoBPERIODCHANGE: TSmallintField;
    ZQToLogoBSALESMANEXIST: TSmallintField;
    ZQToLogoBUNITSEXIST: TSmallintField;
    ZQToLogoFLASTYEARPL: TFloatField;
    ZQToLogoWNOOFPERIODS: TIntegerField;
    ZQToLogoWINVOICEPAPERID: TIntegerField;
    ZQToLogoWCREDITNOTEPAPERID: TIntegerField;
    ZQToLogoWPURCHASEPAPERID: TIntegerField;
    ZQToLogoWGOODSRETURNEDPAPERID: TIntegerField;
    ZQToLogoWQUOTEPAPERID: TIntegerField;
    ZQToLogoWORDERPAPERID: TIntegerField;
    ZQToLogoWSTATEMENTPAPERID: TIntegerField;
    ZQToLogoWREMITTANCEPAPERID: TIntegerField;
    ZQToLogoFRECONCILEDBANKBALANCE: TFloatField;
    ZQToLogoWRECONCILEDBANKID: TIntegerField;
    ZQToLogoDRECONCILEDLASTDATE: TDateTimeField;
    ZQToLogoSSTATEMENTMESSAGE1: TStringField;
    ZQToLogoSSTATEMENTMESSAGE2: TStringField;
    ZQToLogoSSTATEMENTMESSAGE3: TStringField;
    ZQToLogoBCREATEBALANCELINK: TSmallintField;
    ZQToLogoWTAXDUEACCOUNTID: TIntegerField;
    ZQToLogoBTAXINVOICEBASED: TSmallintField;
    ZQToLogoBCREATECOSTOFSALES: TSmallintField;
    ZQToLogoWCURRENTUSERID: TIntegerField;
    ZQToLogoSINVOICEHEADING: TStringField;
    ZQToLogoSCREDITNOTEHEADING: TStringField;
    ZQToLogoSPURCHASEHEADING: TStringField;
    ZQToLogoSGOODSRETURNEDHEADING: TStringField;
    ZQToLogoSQUOTEHEADING: TStringField;
    ZQToLogoSQUOTEMESSAGE1: TStringField;
    ZQToLogoSQUOTEMESSAGE2: TStringField;
    ZQToLogoSQUOTEMESSAGE3: TStringField;
    ZQToLogoSORDERHEADING: TStringField;
    ZQToLogoSORDERMESSAGE1: TStringField;
    ZQToLogoSORDERMESSAGE2: TStringField;
    ZQToLogoSORDERMESSAGE3: TStringField;
    ZQToLogoBPOSTTOLASTYEAR: TSmallintField;
    ZQToLogoWBASECURRENCYID: TIntegerField;
    ZQToLogoBMULTICURRENCY: TSmallintField;
    ZQToLogoSTAXREGNO: TStringField;
    ZQToLogoBPAYMENTSBASED: TSmallintField;
    ZQToLogoWDUEACCOUNTID: TIntegerField;
    ZQToLogoWLANGUAGEID: TIntegerField;
    ZQToLogoBONLINE: TSmallintField;
    ZQToLogoBREMOTE: TSmallintField;
    ZQToLogoWCOLOURID: TIntegerField;
    ZQToLogoSACCOUNTREPORTNAME1: TStringField;
    ZQToLogoSACCOUNTREPORTNAME2: TStringField;
    ZQToLogoSDEBTORREPORTNAME1: TStringField;
    ZQToLogoSDEBTORREPORTNAME2: TStringField;
    ZQToLogoSCREDITORREPORTNAME1: TStringField;
    ZQToLogoSCREDITORREPORTNAME2: TStringField;
    ZQToLogoSSTOCKREPORTNAME1: TStringField;
    ZQToLogoSSTOCKREPORTNAME2: TStringField;
    ZQToLogoSDOCUMENTREPORTNAME1: TStringField;
    ZQToLogoSDOCUMENTREPORTNAME2: TStringField;
    ZQToLogoSSELLINGPRICENAME1: TStringField;
    ZQToLogoSSELLINGPRICENAME2: TStringField;
    ZQToLogoSSELLINGPRICENAME3: TStringField;
    ZQToLogoWVERSION: TIntegerField;
    ZQToLogoSREPORTFONTSNAME: TStringField;
    ZQToLogoBUSEAVGCOST: TSmallintField;
    ZQToLogoBPRNSTATEMENTLOGO: TSmallintField;
    ZQToLogoDTLASTUSETIME: TDateTimeField;
    ZQToLogoBSHOWTIPS: TSmallintField;
    ZQToLogoWAUTOSAVETIME: TIntegerField;
    ZQToLogoBSHOWREMINDER: TSmallintField;
    ZQToLogoBSERVICEPREPRINTED: TSmallintField;
    ZQToLogoWDEFAULTOUTPUTID: TIntegerField;
    ZQToLogoWDEFAULTZOOM: TIntegerField;
    ZQToLogoBUSEOUTLOOKEXP: TSmallintField;
    ZQToLogoSEMAILADDRESS: TStringField;
    ZQFromLogo: TUniQuery;
    ZQFromLogoSCOMPANYNAME: TStringField;
    ZQFromLogoSCOMPANYREGNO: TStringField;
    ZQFromLogoWEMAILSERVERADDRESS: TStringField;
    ZQFromLogoWFAXSERVERID: TIntegerField;
    ZQFromLogoBLOBLOGO: TBlobField;
    ZQFromLogoSADDRESS1: TStringField;
    ZQFromLogoSADDRESS2: TStringField;
    ZQFromLogoSADDRESS3: TStringField;
    ZQFromLogoSPOSTCODE: TStringField;
    ZQFromLogoSPHONENUMBER: TStringField;
    ZQFromLogoSFAXNUMBER: TStringField;
    ZQFromLogoWRETAINEDINCOMEID: TIntegerField;
    ZQFromLogoWDEBTORSCONTROLID: TIntegerField;
    ZQFromLogoWCREDITORSCONTROLID: TIntegerField;
    ZQFromLogoSBACKUPPATH: TStringField;
    ZQFromLogoWCOSTOFSALESTYPEID: TIntegerField;
    ZQFromLogoWCREDITNOTEBATCHTYPEID: TIntegerField;
    ZQFromLogoSCREDITNOTEMESSAGE1: TStringField;
    ZQFromLogoSCREDITNOTEMESSAGE2: TStringField;
    ZQFromLogoSCREDITNOTEMESSAGE3: TStringField;
    ZQFromLogoWPURCHASESBATCHID: TIntegerField;
    ZQFromLogoSPURCHASESMESSAGE1: TStringField;
    ZQFromLogoSPURCHASESMESSAGE2: TStringField;
    ZQFromLogoSPURCHASESMESSAGE3: TStringField;
    ZQFromLogoWGOODSRETURNEDBATCHID: TIntegerField;
    ZQFromLogoSGOODSRETURNEDMESSAGE1: TStringField;
    ZQFromLogoSGOODSRETURNEDMESSAGE2: TStringField;
    ZQFromLogoSGOODSRETURNEDMESSAGE3: TStringField;
    ZQFromLogoWINVOICESBATCHID: TIntegerField;
    ZQFromLogoSINVOICESMESSAGE1: TStringField;
    ZQFromLogoSINVOICESMESSAGE2: TStringField;
    ZQFromLogoSINVOICESMESSAGE3: TStringField;
    ZQFromLogoWDISPLAYAMOUNT: TIntegerField;
    ZQFromLogoBACCOUNTSOPEN: TSmallintField;
    ZQFromLogoBBATCHTYPES: TSmallintField;
    ZQFromLogoBGROUPS: TSmallintField;
    ZQFromLogoBNOTCLOSED: TSmallintField;
    ZQFromLogoBPERIODCHANGE: TSmallintField;
    ZQFromLogoBSALESMANEXIST: TSmallintField;
    ZQFromLogoBUNITSEXIST: TSmallintField;
    ZQFromLogoFLASTYEARPL: TFloatField;
    ZQFromLogoWNOOFPERIODS: TIntegerField;
    ZQFromLogoWINVOICEPAPERID: TIntegerField;
    ZQFromLogoWCREDITNOTEPAPERID: TIntegerField;
    ZQFromLogoWPURCHASEPAPERID: TIntegerField;
    ZQFromLogoWGOODSRETURNEDPAPERID: TIntegerField;
    ZQFromLogoWQUOTEPAPERID: TIntegerField;
    ZQFromLogoWORDERPAPERID: TIntegerField;
    ZQFromLogoWSTATEMENTPAPERID: TIntegerField;
    ZQFromLogoWREMITTANCEPAPERID: TIntegerField;
    ZQFromLogoFRECONCILEDBANKBALANCE: TFloatField;
    ZQFromLogoWRECONCILEDBANKID: TIntegerField;
    ZQFromLogoDRECONCILEDLASTDATE: TDateTimeField;
    ZQFromLogoSSTATEMENTMESSAGE1: TStringField;
    ZQFromLogoSSTATEMENTMESSAGE2: TStringField;
    ZQFromLogoSSTATEMENTMESSAGE3: TStringField;
    ZQFromLogoBCREATEBALANCELINK: TSmallintField;
    ZQFromLogoWTAXDUEACCOUNTID: TIntegerField;
    ZQFromLogoBTAXINVOICEBASED: TSmallintField;
    ZQFromLogoBCREATECOSTOFSALES: TSmallintField;
    ZQFromLogoWCURRENTUSERID: TIntegerField;
    ZQFromLogoSINVOICEHEADING: TStringField;
    ZQFromLogoSCREDITNOTEHEADING: TStringField;
    ZQFromLogoSPURCHASEHEADING: TStringField;
    ZQFromLogoSGOODSRETURNEDHEADING: TStringField;
    ZQFromLogoSQUOTEHEADING: TStringField;
    ZQFromLogoSQUOTEMESSAGE1: TStringField;
    ZQFromLogoSQUOTEMESSAGE2: TStringField;
    ZQFromLogoSQUOTEMESSAGE3: TStringField;
    ZQFromLogoSORDERHEADING: TStringField;
    ZQFromLogoSORDERMESSAGE1: TStringField;
    ZQFromLogoSORDERMESSAGE2: TStringField;
    ZQFromLogoSORDERMESSAGE3: TStringField;
    ZQFromLogoBPOSTTOLASTYEAR: TSmallintField;
    ZQFromLogoWBASECURRENCYID: TIntegerField;
    ZQFromLogoBMULTICURRENCY: TSmallintField;
    ZQFromLogoSTAXREGNO: TStringField;
    ZQFromLogoBPAYMENTSBASED: TSmallintField;
    ZQFromLogoWDUEACCOUNTID: TIntegerField;
    ZQFromLogoWLANGUAGEID: TIntegerField;
    ZQFromLogoBONLINE: TSmallintField;
    ZQFromLogoBREMOTE: TSmallintField;
    ZQFromLogoWCOLOURID: TIntegerField;
    ZQFromLogoSACCOUNTREPORTNAME1: TStringField;
    ZQFromLogoSACCOUNTREPORTNAME2: TStringField;
    ZQFromLogoSDEBTORREPORTNAME1: TStringField;
    ZQFromLogoSDEBTORREPORTNAME2: TStringField;
    ZQFromLogoSCREDITORREPORTNAME1: TStringField;
    ZQFromLogoSCREDITORREPORTNAME2: TStringField;
    ZQFromLogoSSTOCKREPORTNAME1: TStringField;
    ZQFromLogoSSTOCKREPORTNAME2: TStringField;
    ZQFromLogoSDOCUMENTREPORTNAME1: TStringField;
    ZQFromLogoSDOCUMENTREPORTNAME2: TStringField;
    ZQFromLogoSSELLINGPRICENAME1: TStringField;
    ZQFromLogoSSELLINGPRICENAME2: TStringField;
    ZQFromLogoSSELLINGPRICENAME3: TStringField;
    ZQFromLogoWVERSION: TIntegerField;
    ZQFromLogoSREPORTFONTSNAME: TStringField;
    ZQFromLogoBUSEAVGCOST: TSmallintField;
    ZQFromLogoBPRNSTATEMENTLOGO: TSmallintField;
    ZQFromLogoDTLASTUSETIME: TDateTimeField;
    ZQFromLogoBSHOWTIPS: TSmallintField;
    ZQFromLogoWAUTOSAVETIME: TIntegerField;
    ZQFromLogoBSHOWREMINDER: TSmallintField;
    ZQFromLogoBSERVICEPREPRINTED: TSmallintField;
    ZQFromLogoWDEFAULTOUTPUTID: TIntegerField;
    ZQFromLogoWDEFAULTZOOM: TIntegerField;
    ZQFromLogoBUSEOUTLOOKEXP: TSmallintField;
    ZQFromLogoSEMAILADDRESS: TStringField;
    ZSQLProcessor1: TUniScript;
    QryParams: TUniScript;
    ZSQLPrUpdateTables: TUniScript;
    SQLNewDBSript: TUniScript;
    procedure BNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BConvertToFirebird(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ZSQLPrUpdateTablesError(Sender: TObject; E: Exception;
      SQL: string; var Action: TErrorAction);
  private
    procedure ParceSqlFireBird(ASql, TableName, PreFix: String;
      AddOnly: Integer);
    function GetSqlByName(ASqlName: String): String;

    { Private declarations }
  public
    procedure Mycopyfile(AFrom,ATo : String ) ;
    procedure DoParamsOnSQLScript ;
    procedure CopyFromToWithMask(CopyFromDir,Mask ,CopyToDir : String ) ;
    procedure CreateBatchesAndPumpData ;
    procedure HandelLogo ;
    { Public declarations }
  end;

var
  FormMainConversion: TFormMainConversion;
  TheGlobalDataObject : TGlobalDataObject ;
  TheTC4GlobalDataObject : TGlobalDataObject ;
implementation

uses Math,ZScriptParser;

{$R *.dfm}



procedure TFormMainConversion.DoParamsOnSQLScript ;
var
 i,PosParam : Integer ;
 result : String ;
begin
  result :=  SQLNewDBSript.SQL.Text ;
        for i:= 0 to QryParams.SQL.Count -1 do
           begin
            // Showmessage(QryParams.SQL.Names[i] +':'+ QryParams.SQL.ValueFromIndex[i]);
              while pos('<@'+ QryParams.SQL.Names[i]+'@>',result) <> 0 do
                 begin
                    PosParam := pos('<@'+ QryParams.SQL.Names[i]+'@>',result) ;
                    Delete(Result,PosParam,Length('<@'+ QryParams.SQL.Names[i]+'@>'));
                    Insert( QryParams.SQL.ValueFromIndex[i],Result,PosParam);
                 end;
           end;
  ZSQLPrUpdateTables.SQL.Text := result ;
end;


procedure TFormMainConversion.ParceSqlFireBird(ASql, TableName, PreFix: String;AddOnly : Integer );
const maxFields = 255 ;
      AnsiSep = '' ;

var
 i,x,RecordsDone : Integer ;
 InsertSql,IndexSql : String ;
        function AnsiQuotedStr(AName : String ; seperator : String ) : string;
      begin
         if seperator = '' then
         result := AName else
         result :=SysUtils.AnsiQuotedStr(AName,seperator[1]) ;
      end;
begin
try
if (AddOnly in [0,3] )then
begin
Label2.Caption := 'Table ' +  TableName ;
Label2.Repaint ;
PBMainPRocess.Position := PBMainPRocess.Position + 1 ;
ZQData.Close ;
ZQData.SQL.Text := 'select * from ' +  TableName    ;
ZQData.open ;


InsertSql := 'Insert into ' + AnsiQuotedStr(PReFIx + TableName,AnsiSep) + '(' ;
for i :=0 to min(ZQData.FieldCount -1,maxFields) do
  begin
    case  ZQData.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep) ;
    ftLargeint,ftSmallint, ftInteger, ftWord :  InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep);
    ftBoolean :  InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep) ;
    ftFloat, ftCurrency :  InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep);
    ftDate, ftTime, ftDateTime,ftTimeStamp : InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep);
    ftAutoInc : Memo2.Lines.add(AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep) );
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  : InsertSql := InsertSql + AnsiQuotedStr(ZQData.Fields[i].FieldName,AnsiSep) ;
    else
        Memo2.Lines.add(ZQData.Fields[i].FieldName + ' unknown');
    end;
    if i < min(ZQData.FieldCount -1,maxFields) then
       InsertSql := InsertSql +','   ;
  end;
  if  lowerCase(TableName) = 'sysvars' then
     begin
        InsertSql:= InsertSql +',WSYSVARSID' ;
     end;  
  InsertSql := InsertSql +  ') Values( ';
 end;// End addonly = 0



  // pump data
if AddOnly <> 3 then exit ;

ZQuery3.Close ;
RecordsDone := 0 ;
ZUpdateSQL1.InsertSQL.Text := InsertSql ;

ZQData.SQL.Text := 'Select * from ' + AnsiQuotedStr(TableName,AnsiSep)   ;
ZQData.open ;
ProgressBar1.Position := 0 ;
ProgressBar1.max :=  ZQData.RecordCount  ;
ZQData.first ;
while not ZQData.eof do
    begin

     ProgressBar1.Position := ProgressBar1.Position  + 1 ;
     //ZQuery3.Insert ;
   ZQuery3.sql.Text := InsertSql  ;

   for i :=0 to min(ZQData.FieldCount -1,maxFields) do
  begin
   if ZQData.Fields[i].AsString <> '' then
    case  ZQData.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : ZQuery3.sql.Add(sysutils.AnsiQuotedStr(ZQData.Fields[i].AsString,''''));
    ftLargeint,ftSmallint, ftInteger, ftWord : ZQuery3.sql.Add(ZQData.Fields[i].AsString);
    ftBoolean :  begin
                 if ZQData.Fields[i].AsBoolean then
                    ZQuery3.sql.Add('1') else
                    ZQuery3.sql.Add('0');
                 end;
    ftFloat, ftCurrency :  ZQuery3.sql.Add( StringReplace(ZQData.Fields[i].AsString,DecimalSeparator,'.',[rfReplaceAll]));
    ftDate, ftTime, ftDateTime,ftTimeStamp : ZQuery3.sql.Add(sysutils.AnsiQuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',ZQData.Fields[i].AsDateTime),''''));
    ftAutoInc : ZQuery3.sql.Add(AnsiQuotedStr(ZQData.Fields[i].AsString,''));
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  :
       begin
       if LowerCase(TableName) <> 'sysvars' then
       ZQuery3.sql.Add(sysutils.AnsiQuotedStr(ZQData.Fields[i].AsString,''''))
        else
        ZQuery3.sql.Add(sysutils.AnsiQuotedStr('','''')) ;

       end;
    else
        ZQuery3.sql.Add(sysutils.AnsiQuotedStr(ZQData.Fields[i].AsString,''''));
    end // end case
      else
      begin
      if ZQData.Fields[i].DataType <>  ftBoolean then
      ZQuery3.sql.Add('null') else ZQuery3.sql.Add('0');

      end;
    if i < min(ZQData.FieldCount -1,maxFields) then
       ZQuery3.sql.Add(',')   ;
  end;
   if  lowerCase(TableName) = 'sysvars' then
     begin
         ZQuery3.sql.Add(',1') ;
     end;
  ZQuery3.sql.Add( ') ');
      try
      ZQuery3.ExecSQL ;
      inc(RecordsDone);
      except
       on e : Exception do
         begin
           MemoSQLError.Lines.add(StringReplace(copy(e.Message,1,255),#13,' ',[rfReplaceall]));
           MemoSQLErrorRunSql.lines.add(ZQuery3.sql.text+';');
         end;
      end ;
      ZQData.next ;
    end;
 if ZQData.RecordCount <> RecordsDone then
   MDoneTables.Lines.Add(format('Table %s old %s : New %s ',[TableName,IntToStr(ZQData.RecordCount),IntToStr(RecordsDone)])) ;

ZQData.Close ;


  except 
   on e : Exception Do
    begin
    ZQData.Close ;
    if ZQuery3.UpdatesPending then
       ZQuery3.CancelUpdates ;
    ZQuery3.close ;
    Memo1.Lines.Add(e.message);
    end;
  end;
end;

procedure TFormMainConversion.ZSQLPrUpdateTablesError(Sender: TObject;
  E: Exception; SQL: string; var Action: TErrorAction);
begin
   Memo1.Lines.add(e.message);
  Action := eaContinue ;

end;

procedure TFormMainConversion.BNextClick(Sender: TObject);
Var

 ATranslationItem :TTranslationCollectionItem ;
 ABooks : TBooksCollectionItem ;
 ALanguage : TLanguageCollectionItem ;
 i : Integer ;
 AFrom , Ato : String ;
begin
 if not FileExists(IncludeTrailingPathDelimiter(ETC37Folder.Text) +'Bin\Settings.dfm') then
   raise Exception.Create('Theres no settings.dfm in this tc4 folder please select the root folder of tc4!');
 ProgressBar1.Max := 100 ;
 ProgressBar1.Position := 0 ;
 ProgressBar1.Visible := true ;
 try
 // clear object
 TheGlobalDataObject.Clear ;
 if FileExists(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm') then
  begin
  TheGlobalDataObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm')
  end ;
// TheGlobalDataObject.Languages.clear ;
 TheTC4GlobalDataObject.LoadFromFile(IncludeTrailingPathDelimiter(ETC37Folder.Text) +'Bin\Settings.dfm');
 //TheGlobalDataObject.Books := TheTC4GlobalDataObject.Books ;

   if CBCopyReports.Checked then
   begin
     CopyFromToWithMask(IncludeTrailingPathDelimiter(ETC37Folder.text) + 'bin\reports\','*.frf',ExtractFilePath(Application.ExeName)+'bin\reports\');
   end;

  ProgressBar1.Position := 100 ;
{  if FileExists(IncludeTrailingPathDelimiter(ETC37Folder.text)+'plugins\unlock.ddu') then
      begin
        AFrom := IncludeTrailingPathDelimiter(ETC37Folder.text)+'plugins\unlock.ddu' ;
        Ato := ExtractFilePath(Application.ExeName) + 'plugins\unlock.ddu' ;
        Copyfile(pchar(AFrom),pchar(Ato),true);
       end;  }
//  TheGlobalDataObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm');
  if TheGlobalDataObject.Languages.ActiveLanguage = nil then
    TheGlobalDataObject.Languages.SetDefault ;

   if TheGlobalDataObject.Languages.ActiveLanguage <> nil then
     begin
       TheGlobalDataObject.TranslationSaveObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  TheGlobalDataObject.Languages.ActiveLanguage.Name +'.dfm');
     end;
  finally
     ProgressBar1.Visible := false ;
  end;
  CBSetOfBooksToConvert.Clear ;
  for i := 0 to TheTC4GlobalDataObject.Books.Count -1 do
      begin
         CBSetOfBooksToConvert.AddItem(ExtractFilePath(TheTC4GlobalDataObject.Books[i].Database),TheTC4GlobalDataObject.Books[i]);
      end;
  PCConversion.ActivePageIndex := 1 ;
end;

procedure TFormMainConversion.FormShow(Sender: TObject);
begin
PHideTabs.BringToFront ;
PCConversion.ActivePageIndex := 0 ;



end;

procedure TFormMainConversion.Button5Click(Sender: TObject);
begin
OpenDialog1.FileName := ETC37Folder.Text ;
if not OpenDialog1.Execute then exit ;
ETC37Folder.Text :=ExtractFilePath(OpenDialog1.FileName);
end;

procedure DeleteValFiles(ADir : String );
var
 f  :TSearchRec ;
begin
  if FindFirst(ExcludeTrailingPathDelimiter(ADir)+'\*.val',faAnyFile ,F)=0 then
  begin
     DeleteFile(IncludeTrailingPathDelimiter(ADir)+F.Name);
     while FindNext(F)=0 do      DeleteFile(IncludeTrailingPathDelimiter(ADir)+F.Name) ;
     // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
  end;
end;

procedure TFormMainConversion.Button4Click(Sender: TObject);
var
 i : integer ;
 SourceFile,DestFile : String ;
begin
 ProgressBar1.Visible := true;
 PBMainPRocess.Visible := true;

  for i := 0 to CBSetOfBooksToConvert.Items.Count -1 do
    begin
      if CBSetOfBooksToConvert.Checked[i] then
         begin
          try
            Label1.Caption := ' Set of books : '  +  CBSetOfBooksToConvert.Items[i] ;
            PBMainPRocess.Max := 100 ;
            PBMainPRocess.Position := 0 ;

            // Create empty database.
           if not DirectoryExists(ExtractFilePath(Application.ExeName) +'books') then
            CreateDir(ExtractFilePath(Application.ExeName) +'books' );


           SourceFile := ExtractFilePath(Application.ExeName) +'bin\templates\EMPTY.FDB'  ;
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheTC4GlobalDataObject.books[i].Name +'\books.FDB' ;
           CreateDir(ExtractFilePath(Application.ExeName) +'books\'  + TheTC4GlobalDataObject.books[i].Name) ;
           copyfile(PChar(SourceFile),pchar(DestFile),false);
           ZConnection1.Database := DestFile ;
           ZConnection1.Connect ;
           ZConTC4.Database := TheTC4GlobalDataObject.books[i].Database ;
           ZConTC4.Username := TheTC4GlobalDataObject.books[i].UserName ;
           ZConTC4.Password := TheTC4GlobalDataObject.books[i].Password ;
           ZConTC4.Server := TheTC4GlobalDataObject.books[i].Server ;
           ZConTC4.Connect ;

           PBMainPRocess.Position := 10 ;

           BConvertToFirebird(self);

           // OSCommerce files
           CopyFromToWithMask(CBSetOfBooksToConvert.Items[i],'*.dfm',ExtractFilePath(Application.ExeName) +'books\' + TheTC4GlobalDataObject.books[i].Name);
           // Ini files
           CopyFromToWithMask(CBSetOfBooksToConvert.Items[i],'*.ini',ExtractFilePath(Application.ExeName) +'books\' + TheTC4GlobalDataObject.books[i].Name);

           // BAPI
           SourceFile := CBSetOfBooksToConvert.Items[i] +'BAPISETTINGS.xml'  ;
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheTC4GlobalDataObject.books[i].Name +'\BAPISETTINGS.xml' ;
           if FileExists(SourceFile) then
             CopyFile(pchar(SourceFile),pchar(DestFile),false);
            ZQData.SQL.text := 'update SYSVARS set WVERSION = 0' ;
            ZQData.ExecSQL ;
           finally
            ZConTC4.Connected := false ;
            ZConnection1.Connected := false ;
          end;
           if  MemoSQLError.Lines.Count <> 0 then
             begin
               // save SQL
               MemoSQLErrorRunSql.Lines.SaveToFile(ExtractFilePath(ZConnection1.Database) + 'ConversionErrorSQL.txt');
             end;

         end;
    end;
 ProgressBar1.Visible := False;
 PBMainPRocess.Visible := False;
 PCConversion.ActivePageIndex := PCConversion.ActivePageIndex + 1 ;
end;

procedure TFormMainConversion.BConvertToFirebird(Sender: TObject);
var
 AList : TStringList ;
 i,AccountLength,SReferenceLength : Integer ;
begin
 MemoSQLError.Clear ;
 MemoSQLErrorRunSql.clear ;
 AList := TStringList.Create ;
 try
   // Known issues
   ZQData.SQL.Text := 'Update Account Set WReportingGroup1ID = 0 where WReportingGroup1ID is null';
   ZQData.ExecSQL ;
   ZQData.SQL.Text := 'Update Account Set WReportingGroup2ID = 0 where WReportingGroup2ID is null';
   ZQData.ExecSQL ;

   ZQData.SQL.Text :='update DocHead set WAccountId = 0 where WaccountID is null' ;
   ZQData.ExecSQL ;

   ZQData.SQL.Text := 'select SMainAccountCode from account where 1 = 0';
   ZQData.open ;
   AccountLength := ZQData.Fields[0].Size ;

   ZQData.SQL.Text := 'select SREFERENCE  from DocHead where 1 = 0';
   ZQData.open ;
   SReferenceLength  := ZQData.Fields[0].Size ;

   ZQData.Close ;
   QryParams.SQL.Values['MAINACCOUNTCODE'] := IntToStr(AccountLength) ;
   QryParams.SQL.Values['DOCHEADREFERENCE'] := IntToStr(SReferenceLength) ;
   QryParams.SQL.Values['ACCOUNTCODE'] := IntToStr(AccountLength+3) ;
   QryParams.SQL.Values['ACCOUNTCODELONG'] := IntToStr(AccountLength+4) ;


   ZSQLPrUpdateTables.Delimiter := ';' ;

    if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase.txt') then
      SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase.txt');
   DoParamsOnSQLScript ;
   ZConnection1.StartTransaction ;
   ZSQLPrUpdateTables.Execute ;
   ZConnection1.Commit ;
   ZConnection1.Disconnect ;
   ZConnection1.Connect ;





   ZSQLPrUpdateTables.Delimiter := '@@' ;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabaseEndSpecChars.txt') then
      SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabaseEndSpecChars.txt');
   DoParamsOnSQLScript ;
   ZConnection1.StartTransaction ;
   ZSQLPrUpdateTables.Execute ;
   ZConnection1.Commit ;
    // do data
   ZConnection1.Disconnect ;
   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;
   ZConnection1.Connect ;
   // dataconversion
   // parceSqlFireBird('select * from ' + AList[i] ,AList[i],'',3);
   Memo5.Lines.Clear ;

   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;

ZConnection1.StartTransaction ;
PBMainPRocess.Position := 20 ;
Application.ProcessMessages;
MDoneTables.Lines.clear ;
parceSqlFireBird('select * from Resources','Resources' , '',3);
parceSqlFireBird('select * from Tasks','Tasks' , '',3);
parceSqlFireBird('select * from TaskAction','TaskAction' , '',3);
parceSqlFireBird('select * from Events','Events' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from Periods','Periods' , '',3);
parceSqlFireBird('select * from Groups','Groups' , '',3);
parceSqlFireBird('select * from Types','Types' , '',3);
parceSqlFireBird('select * from Unit','Unit' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from messages','messages' , '',3);
parceSqlFireBird('select * from Currency','Currency' , '',3);
parceSqlFireBird('select * from Contacts','Contacts' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from Users','Users' , '',3);
parceSqlFireBird('select * from Account','Account' , '',3);
parceSqlFireBird('select * from Stock','Stock' , '',3);
parceSqlFireBird('select * from StockPub','StockPub' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from StockTrn','StockTrn' , '',3);
parceSqlFireBird('select * from Debtor','Debtor' , '',3);
parceSqlFireBird('select * from Bank','Bank' , '',3);
parceSqlFireBird('select * from Tax','Tax' , '',3);
parceSqlFireBird('select * from creditor','creditor' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from addressPerAccount','addressPerAccount' , '',3);
parceSqlFireBird('select * from AssetMas','AssetMas' , '',3);
parceSqlFireBird('select * from BatTypes','BatTypes' , '',3);
parceSqlFireBird('select * from BatCon','BatCon' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from BOM','BOM' , '',3);
parceSqlFireBird('select * from BackOrd','BackOrd' , '',3);
parceSqlFireBird('select * from DnlBanks','DnlBanks' , '',3);
parceSqlFireBird('select * from DocHead','DocHead' , '',3);
parceSqlFireBird('select * from DocLine','DocLine' , '',3);
parceSqlFireBird('select * from EmpMas','EmpMas' , '',3);
parceSqlFireBird('select * from EmpSource','EmpSource' , '',3);
parceSqlFireBird('select * from FlowTmp','FlowTmp' , '',3);
parceSqlFireBird('select * from Global','Global' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from JobProject','JobProject' , '',3);
parceSqlFireBird('select * from KeysCont','KeysCont' , '',3);
parceSqlFireBird('select * from LabSpecs','LabSpecs' , '',3);
parceSqlFireBird('select * from Locations','Locations' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from ManufacH','ManufacH' , '',3);
parceSqlFireBird('select * from ManufacD','ManufacD' , '',3);
parceSqlFireBird('select * from OILinks','OILinks' , '',3);
parceSqlFireBird('select * from OpReport','OpReport' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from PayCon','PayCon' , '',3);
parceSqlFireBird('select * from PayTrans','PayTrans' , '',3);
parceSqlFireBird('select * from Printers','Printers' , '',3);
parceSqlFireBird('select * from Profiles','Profiles' , '',3);
parceSqlFireBird('select * from ReconBank','ReconBank' , '',3);
parceSqlFireBird('select * from RepCells','RepCells' , '',3);
parceSqlFireBird('select * from RepCols','RepCols' , '',3);
parceSqlFireBird('select * from RepHead','RepHead' , '',3);
parceSqlFireBird('select * from RepLine','RepLine' , '',3);
Application.ProcessMessages;
parceSqlFireBird('select * from ReportOp','ReportOp' , '',3);
parceSqlFireBird('select * from ReptBat','ReptBat' , '',3);
parceSqlFireBird('select * from ReptDocs','ReptDocs' , '',3);
parceSqlFireBird('select * from Totals','Totals' , '',3);
parceSqlFireBird('select * from TransAct','TransAct' , '',3);
parceSqlFireBird('select * from SysParams','SysParams' , '',3);
parceSqlFireBird('select * from Sysvars','Sysvars' , '',3);
parceSqlFireBird('select * from dnlbanks','dnlbanks' , '',3);

Application.ProcessMessages;
ZConnection1.Commit ;
PBMainPRocess.Position := 80 ;

   ZQData.SQL.Text := 'select max(RECORDID)+1 from CONTACTS';
   ZQData.open ;
   QryParams.SQL.Values['GEN_CONTACTS_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;

   ZQData.SQL.Text := 'select max(RECORDID)+1 from Events';
   ZQData.open ;
   QryParams.SQL.Values['GEN_Events_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;

   ZQData.SQL.Text := 'select max(RECORDID)+1 from Tasks';
   ZQData.open ;
   QryParams.SQL.Values['GEN_Tasks_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;

   ZQData.SQL.Text := 'select max(RESOURCEID)+1 from Resources';
   ZQData.open ;
   QryParams.SQL.Values['GEN_ResourceID_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;


   ZQData.SQL.Text := 'select max(TaskActionID)+1 from TaskAction';
   ZQData.open ;
   QryParams.SQL.Values['GEN_TaskAction_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;

   ZQData.SQL.Text := 'select max(WPARAMID)+1 from SYSPARAMS';
   ZQData.open ;
   QryParams.SQL.Values['GEN_SYSPARAMS_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;


   ZQData.SQL.Text := 'select max(WADDRESSPERACCOUNTID)+1 from ADDRESSPERACCOUNT';
   ZQData.open ;
   QryParams.SQL.Values['GEN_ADDRESSPERACCOUNT_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;

if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase_SetGen.txt') then
      SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase_SetGen.txt');
   DoParamsOnSQLScript ;
   PBMainPRocess.Position := 90 ;
   ZConnection1.StartTransaction ;
   ZSQLPrUpdateTables.Execute ;

   ZQData.SQL.Text := 'select max(RECORDID)+1 from CONTACTS';
   ZQData.open ;
   QryParams.SQL.Values['GEN_CONTACTS_ID'] := IntToStr(ZQData.Fields[0].AsInteger) ;
   ZQData.Close ;
   ZQData.SQL.Text := 'SET GENERATOR GEN_CONTACTS_ID TO ' + QryParams.SQL.Values['GEN_CONTACTS_ID'];
   ZQData.ExecSQL ;


   ZConnection1.Commit ;

    // do data
   ZConnection1.Disconnect ;


   ZSQLPrUpdateTables.Delimiter := ';' ;

    i := 1 ;
    while fileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\patch'+IntToStr(i)+'.txt') do
      begin
      ZConnection1.Connect ;
      SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\patch'+IntToStr(i)+'.txt');
      DoParamsOnSQLScript ;
      ZConnection1.StartTransaction ;
      ZSQLPrUpdateTables.Execute ;
      ZConnection1.Commit ;
      ZConnection1.Disconnect ;

      inc(i);
      end;      
   PBMainPRocess.Position := 95 ;
      ZConnection1.Connect ;
      // create all batches and pump data
      CreateBatchesAndPumpData;
      // logo
      HandelLogo;
      ZQuery3.sql.Text := 'Update Sysvars set WVERSION = 0 ';
      ZQuery3.ExecSQL ;
      ZQuery3.sql.Text := 'update sysparams set SParamValue =' + QuotedStr('osFinancials Email')+' where SParamValue like ' + QuotedStr('%TurboCASH3%') ;
      ZQuery3.ExecSQL ;

      ZConnection1.Disconnect ;
   PBMainPRocess.Position := 100 ;
   MDoneTables.Lines.Add('Finished!')
 finally
  AList.free ;
 end;
end;

procedure TFormMainConversion.Mycopyfile(AFrom, ATo: String);
var
 AFromStream,AToStream : TFileStream ;
begin
 AFromStream := TFileStream.Create(AFrom,fmOpenRead	) ;
 AToStream := TFileStream.Create(AFrom,fmCreate) ;
   try
    AToStream.Size := 0 ;
    AToStream.CopyFrom(AFromStream,0)
   finally
    AFromStream.free ;
    AToStream.free;
   end;
end;

procedure TFormMainConversion.Button1Click(Sender: TObject);
var
  i : Integer ;
  ConvPath,DestFile : String ;
begin
 ConvPath :=  ExtractFilePath(Application.ExeName) +'conversion\' ;
  for i := 0 to CBSetOfBooksToConvert.Items.Count -1 do
    begin
      if CBSetOfBooksToConvert.Checked[i] then
         begin
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheTC4GlobalDataObject.books[i].Name +'\books.FDB' ;
           ZConTC4.Database := TheTC4GlobalDataObject.books[i].Database ;
           ZConTC4.Username := TheTC4GlobalDataObject.books[i].UserName ;
           ZConTC4.Password := TheTC4GlobalDataObject.books[i].Password ;
           ZConTC4.Server := TheTC4GlobalDataObject.books[i].Server ;
           ZConTC4.Connect ;
           ZConnection1.Database := DestFile ;
           ZConnection1.Connect ;
           parceSqlFireBird('select * from Debtor','Debtor' , '',3);
         end;
     end;
end;

procedure TFormMainConversion.CopyFromToWithMask(CopyFromDir,Mask,
  CopyToDir: String);
 var
 SourceFile,DestFile : String ;
 F : TSearchRec ;
 begin
  if FindFirst(IncludeTrailingPathDelimiter(CopyFromDir)+Mask,faAnyFile ,F)=0 then
     begin
     repeat
      SourceFile := IncludeTrailingPathDelimiter(CopyFromDir) +f.Name;
      DestFile := IncludeTrailingPathDelimiter(CopyToDir) +f.Name ;
     if not ((f.Attr and FaDirectory) = FaDirectory) then
       CopyFile(pchar(SourceFile),pchar(DestFile),false);
     until FindNext(F)<>0 ;
     sysutils.FindClose(f);
    end;
end;

procedure TFormMainConversion.Button3Click(Sender: TObject);
begin
   PCConversion.ActivePageIndex := PCConversion.ActivePageIndex +1 ;
end;

procedure TFormMainConversion.Button8Click(Sender: TObject);
begin
 PCConversion.ActivePageIndex := 0 ; 
end;


function TFormMainConversion.GetSqlByName(ASqlName: String): String;
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

procedure TFormMainConversion.CreateBatchesAndPumpData;
var
 ASql : String ;
 AStringList : TStringList ;
begin
  AStringList := TStringList.create ;
  try
   ZConTC4.GetTableNames(AStringList);
   ZQuery2.sql.Text := 'select WUserId,WBatchTypeID from battypes,users' ;
   ZQuery2.open ;
   while not ZQuery2.eof do
    begin
       QryParams.SQL.Values['BATCHNAME'] := 'BAT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring ;

       SQLNewDBSript.SQL.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
       DoParamsOnSQLScript ;
       ZSQLPrUpdateTables.Execute ;
       if AStringList.IndexOf(QryParams.SQL.Values['BATCHNAME']) <> -1 then
       parceSqlFireBird('select * from '+QryParams.SQL.Values['BATCHNAME'],QryParams.SQL.Values['BATCHNAME'] , '',3);
        if AStringList.IndexOf('BATRBT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring) <> -1 then
          begin
           QryParams.SQL.Values['BATCHNAME'] := 'BATRBT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring ;

           SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
           DoParamsOnSQLScript ;
           ZSQLPrUpdateTables.Execute ;
           parceSqlFireBird('select * from '+QryParams.SQL.Values['BATCHNAME'],QryParams.SQL.Values['BATCHNAME'] , '',3);
          end;
       ZQuery2.next ;

    end;
   ZQuery2.sql.Text := 'select WUserId from users' ;
   ZQuery2.open ;
   while not ZQuery2.eof do
    begin
       QryParams.SQL.Values['BATCHNAME'] := 'DOCBATCH_' + ZQuery2.fields[0].asstring +  '_' + ZQuery2.fields[0].asstring ;

       SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
       DoParamsOnSQLScript ;
       ZSQLPrUpdateTables.Execute ;

       QryParams.SQL.Values['POSTBATCH'] := 'DOCBATCH_' + ZQuery2.fields[0].asstring +  '_' + ZQuery2.fields[0].asstring ;

       SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
       DoParamsOnSQLScript ;
       ZSQLPrUpdateTables.Execute ;

      ZQuery2.next ;
    end;
   finally
     AStringList.free ;
   end;
end;

procedure TFormMainConversion.HandelLogo;
var
 Astream : TMemoryStream ;
begin
  Astream := TMemoryStream.create ;
  try
   ZQFromLogo.open ;
   if not ZQFromLogoBLOBLOGO.IsNull then
   begin
   ZQFromLogoBLOBLOGO.SaveToStream(Astream);
   ZQToLogo.Open ;
   ZQToLogo.Edit ;
   Astream.Position := 0 ;
   ZQToLogoBLOBLOGO.LoadFromStream(Astream);
   ZQToLogo.post;
   ZQFromLogo.close ;
   ZQToLogo.close ;
   end;
  finally
    aStream.free ;
  end;
end;

initialization
TheGlobalDataObject := TGlobalDataObject.Create(nil) ;
TheTC4GlobalDataObject := TGlobalDataObject.Create(nil) ;

finalization
TheGlobalDataObject.free ;
TheTC4GlobalDataObject.free ;

end.
