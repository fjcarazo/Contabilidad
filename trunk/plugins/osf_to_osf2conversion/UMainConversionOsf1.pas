unit UMainConversionOsf1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, rpmdesignervcl, ZConnection,
  rpcompobase, rpvclreport,TcashClasses, ComCtrls, ExtCtrls, CheckLst,

   ZSqlProcessor, USQLHolder,  DAScript, UniScript,
  DBAccess, Uni, MemDS;

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
    ZSQLProcessor1: TUniScript;
    ZSQLPrUpdateTables: TUniScript;
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
    SQLNewDBSript: TUniScript;
    QryParams: TUniScript;
    TabSheet4: TTabSheet;
    BStartStop: TButton;
    MDoneTables: TMemo;
    CBCopyReports: TCheckBox;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    BConvert: TButton;
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
    ProcessList: TSQLHOLDER;
    ESubFolder: TEdit;
    Label6: TLabel;
    Lcount1: TLabel;
    LCountmain: TLabel;
    procedure BNextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BConvertToFirebird(Sender: TObject);
    procedure ZSQLPrUpdateTablesError(Processor: TZSQLProcessor;
      StatementIndex: Integer; E: Exception;
      var ErrorHandleAction: TZErrorHandleAction);
    procedure Button1Click(Sender: TObject);
    procedure BStartStopClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ParceSqlFireBird(ASql, TableName, PreFix: String;
      AddOnly: Integer);
    function GetSqlByName(ASqlName: String): String;

    { Private declarations }
  public
    BStop : boolean ;
    procedure Mycopyfile(AFrom,ATo : String ) ;
    procedure DoParamsOnSQLScript ;
    procedure CopyFromToWithMask(CopyFromDir,Mask ,CopyToDir : String ) ;
    procedure CreateBatchesAndPumpData ;
    procedure HandelLogo ;
    procedure LoadParams ;
    procedure SaveParams ;
    { Public declarations }
  end;

var
  FormMainConversion: TFormMainConversion;
  TheGlobalDataObject : TGlobalDataObject ;
  TheTC4GlobalDataObject : TGlobalDataObject ;
implementation

uses Math,ZScriptParser, UDMTCCoreLink, ConvTOX, OSFGeneralRoutines;

{$R *.dfm}



procedure TFormMainConversion.DoParamsOnSQLScript ;
var
 i,PosParam : Integer ;
 result : String ;
begin
  result :=  SQLNewDBSript.sql.Text ;
        for i:= 0 to QryParams.sql.Count -1 do
           begin
            // Showmessage(QryParams.Script.Names[i] +':'+ QryParams.Script.ValueFromIndex[i]);
              while pos('<@'+ QryParams.sql.Names[i]+'@>',result) <> 0 do
                 begin
                    PosParam := pos('<@'+ QryParams.sql.Names[i]+'@>',result) ;
                    Delete(Result,PosParam,Length('<@'+ QryParams.sql.Names[i]+'@>'));
                    Insert( QryParams.sql.ValueFromIndex[i],Result,PosParam);
                 end;
           end;
  ZSQLPrUpdateTables.sql.Text := result ;
end;


procedure TFormMainConversion.ParceSqlFireBird(ASql, TableName, PreFix: String;AddOnly : Integer );
const maxFields = 255 ;
      AnsiSep = '' ;

var
 i,RecordsDone : Integer ;
 InsertSql : String ;
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
lCount1.Caption := IntToStr(ProgressBar1.Position) + '/' + IntToStr(ProgressBar1.Max);
ZQData.first ;
while not ZQData.eof do
    begin
     if bstop then
         Raise Exception.Create('Stop!') ;
     ProgressBar1.Position := ProgressBar1.Position  + 1 ;
     lCount1.Caption := IntToStr(ProgressBar1.Position) + '/' + IntToStr(ProgressBar1.Max);
     Application.ProcessMessages ;     
     //ZQuery3.Insert ;
   ZQuery3.sql.Text := InsertSql  ;

   for i :=0 to min(ZQData.FieldCount -1,maxFields) do
  begin
   if not ZQData.Fields[i].IsNull  then
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
        // use params
        // except bloblogo
        if ZQData.Fields[i].FieldName ='BLOBLOGO' then
           ZQuery3.sql.Add('null')
        else
           ZQuery3.sql.Add(sysutils.AnsiQuotedStr(ZQData.Fields[i].AsString,''''))
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
           MemoSQLError.Lines.add('ERROR:'+StringReplace(copy(e.Message,1,255),#13,' ',[rfReplaceall]));
           MemoSQLErrorRunSql.lines.add(ZQuery3.sql.text+';');
         end;
      end ;
      ZQData.next ;
    end;
 if ZQData.RecordCount <> RecordsDone then
   begin
   // check old and new records
   ZQuery3.Close ;
   ZQuery3.sql.Text := 'select count(*) from ' +  TableName    ;
   ZQuery3.open ;
   if ZQuery3.Fields[0].AsInteger <> ZQData.RecordCount then
      MDoneTables.Lines.Add(format('Table %s old %s : New %s ',[TableName,IntToStr(ZQData.RecordCount),IntToStr(ZQuery3.Fields[0].AsInteger)])) ;
   ZQuery3.Close ;
   end;

ZQData.Close ;


  except 
   on e : Exception Do
    begin
    ZQData.Close ;
    ZQuery3.CancelUpdates ;
    ZQuery3.close ;
    Memo1.Lines.Add(e.message);
    end;
  end;
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
        if ExtractFilePath(TheTC4GlobalDataObject.Books[i].Database) <>''  then
         CBSetOfBooksToConvert.AddItem(ExtractFilePath(TheTC4GlobalDataObject.Books[i].Database),TheTC4GlobalDataObject.Books[i])
         else
         CBSetOfBooksToConvert.AddItem(TheTC4GlobalDataObject.Books[i].Database,TheTC4GlobalDataObject.Books[i]);
      end;
  PCConversion.ActivePageIndex := 1 ;
end;

procedure TFormMainConversion.FormShow(Sender: TObject);
begin

PHideTabs.BringToFront ;
PCConversion.ActivePageIndex := 0 ;
LoadParams ;
end;

procedure TFormMainConversion.Button5Click(Sender: TObject);
begin
OpenDialog1.FileName := ETC37Folder.Text ;
if not OpenDialog1.Execute then exit ;
ETC37Folder.Text :=ExtractFilePath(OpenDialog1.FileName);
end;


procedure TFormMainConversion.Button4Click(Sender: TObject);
var
 i : integer ;
 SourceFile,DestFile : String ;
begin
 BConvert.Enabled := false ;
 MDoneTables.clear ;
 BStop := false ;
 try
 ProgressBar1.Visible := true;
 PBMainPRocess.Visible := true;
 PCConversion.ActivePageIndex := PCConversion.ActivePageIndex + 1 ;
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
           DestFile := ExtractFilePath(Application.ExeName)+ESubFolder.text +'\'  + TheTC4GlobalDataObject.books[i].Name +'\books.FDB' ;
           if (UpperCase(DestFile) = UpperCase(TheTC4GlobalDataObject.books[i].Database)) and
              (TheTC4GlobalDataObject.books[i].Server = '') then
              raise Exception.create('Error dest and source are the same!');
           ForceDirectories(ExtractFilePath(Application.ExeName) +ESubFolder.text +'\'  + TheTC4GlobalDataObject.books[i].Name) ;
           if FileExists(DestFile) then
             if MessageDlg('Destfile exist override?',mtConfirmation,[mbyes,mbno],0) = mryes then
                DeleteFile(DestFile);
           CopyFile(PChar(SourceFile),pchar(DestFile),false);
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
           DestFile := ExtractFilePath(Application.ExeName)+ ESubFolder.text +'\'  + TheTC4GlobalDataObject.books[i].Name +'\BAPISETTINGS.xml' ;
           if FileExists(SourceFile) then
             CopyFile(pchar(SourceFile),pchar(DestFile),false);
          //  ZQData.SQL.text := 'update SYSVARS set WVERSION = 0' ;
          //  ZQData.ExecSQL ;
           finally
            ZConTC4.Connected := false ;
            ZConnection1.Connected := false ;
          end;
           if  MemoSQLError.Lines.Count <> 0 then
             begin
               // save script
               MemoSQLErrorRunSql.Lines.SaveToFile(ExtractFilePath(ZConnection1.Database) + 'ConversionErrorSQL.txt');
               MemoSQLError.Lines.SaveToFile(ExtractFilePath(ZConnection1.Database) + 'ConversionErrorErrTxt.txt');
               MDoneTables.Lines.SaveToFile(ExtractFilePath(ZConnection1.Database) + 'ConversionErrorDone.txt');
             end;

         end;
    end;
    finally
     BConvert.Enabled := true ;
     ProgressBar1.Visible := False;
     PBMainPRocess.Visible := False;
    end;

end;

procedure TFormMainConversion.BConvertToFirebird(Sender: TObject);
var
 AList : TStringList ;
 i,AccountLength,SReferenceLength : Integer ;
 DummyString : String ;
begin
 MemoSQLError.Clear ;
 MemoSQLErrorRunSql.clear ;
 AList := TStringList.Create ;

 ZQData.SQL.Text := 'select SMainAccountCode from account where 1 = 0';
 ZQData.open ;
 AccountLength := ZQData.Fields[0].Size ;

 ZQData.SQL.Text := 'select SREFERENCE  from DocHead where 1 = 0';
 ZQData.open ;
 SReferenceLength  := ZQData.Fields[0].Size ;

 try
   ZQData.Close ;
   QryParams.sql.Values['MAINACCOUNTCODE'] := IntToStr(AccountLength) ;
   QryParams.sql.Values['DOCHEADREFERENCE'] := IntToStr(SReferenceLength) ;
   QryParams.sql.Values['ACCOUNTCODE'] := IntToStr(AccountLength+3) ;
   QryParams.sql.Values['ACCOUNTCODELONG'] := IntToStr(AccountLength+4) ;
   MDoneTables.Lines.Add('Creating database...')  ;
   Application.ProcessMessages ;


   ZSQLPrUpdateTables.Delimiter := ';' ;

    if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase.txt') then
      SQLNewDBSript.SQL.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase.txt');
   DoParamsOnSQLScript ;

   ZSQLPrUpdateTables.Execute ;

   ZConnection1.Disconnect ;
   ZConnection1.Connect ;
   ZSQLPrUpdateTables.Delimiter := '@@' ;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabaseEndSpecChars.txt') then
      SQLNewDBSript.SQL.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabaseEndSpecChars.txt');
   DoParamsOnSQLScript ;

   ZSQLPrUpdateTables.Execute ;

    // do data


   ZConnection1.Disconnect ;
   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;
   ZConnection1.Connect ;
   DMTCCoreLink.TheZConnection := ZConnection1 ;
   DMTCCoreLink.AApplication := Application ;
   // dataconversion
   ConvertToX(OSFDatabaseversion,DummyString,nil);
   // parceSqlFireBird('select * from ' + AList[i] ,AList[i],'',3);


   ZConnection1.Disconnect ;
   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;
   ZConnection1.Connect ;

   Memo5.Lines.Clear ;

   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;



   MDoneTables.Lines.Add('Disabling triggers!')  ;
   Application.ProcessMessages ;
   TDatabaseTableRoutines.SetTriggerStatus(false );
   MDoneTables.Lines.Add('Disabling Index!')  ;
   Application.ProcessMessages ;
   TDatabaseTableRoutines.SetIndexStatus(false );

PBMainPRocess.Position := 0;
PBMainPRocess.Max := AList.Count   ;
LCountmain.Caption := IntToStr(PBMainPRocess.Position) + '/' + IntToStr(PBMainPRocess.Max);
Application.ProcessMessages;

for i := 0 to ProcessList.SQL.Count -1 do
  begin
   parceSqlFireBird('select * from ' + ProcessList.SQL[i] ,ProcessList.SQL[i] , '',3);

   PBMainPRocess.Position := PBMainPRocess.Position + 1;
   LCountmain.Caption := IntToStr(PBMainPRocess.Position) + '/' + IntToStr(PBMainPRocess.Max);
   Application.ProcessMessages;
  end;

Application.ProcessMessages;

PBMainPRocess.Position := 80 ;
TDatabaseTableRoutines.ResetIDGenerators ;
    // do data
   ZConnection1.Disconnect ;


   ZSQLPrUpdateTables.Delimiter := ';' ;

    i := 1 ;
    PBMainPRocess.Position := 95 ;
      ZConnection1.Connect ;
      // create all batches and pump data
      CreateBatchesAndPumpData;
      // logo
      HandelLogo;
      ZQuery3.sql.Text := 'update sysparams set SParamValue =' + QuotedStr('osFinancials Email')+' where SParamValue like ' + QuotedStr('%TurboCASH3%') ;
      ZQuery3.ExecSQL ;

      ZConnection1.Disconnect ;

   MDoneTables.Lines.Add('Enabling triggers!')  ;
   Application.ProcessMessages ;
   TDatabaseTableRoutines.SetTriggerStatus(true );
   MDoneTables.Lines.Add('Enabling Index!')  ;
   Application.ProcessMessages ;
   TDatabaseTableRoutines.SetIndexStatus(true );

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

procedure TFormMainConversion.ZSQLPrUpdateTablesError(
  Processor: TZSQLProcessor; StatementIndex: Integer; E: Exception;
  var ErrorHandleAction: TZErrorHandleAction);
begin
  Memo1.Lines.add(e.message);
  ErrorHandleAction := eaSkip ;
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

procedure TFormMainConversion.BStartStopClick(Sender: TObject);
begin
  if not BConvert.Enabled then
     BStop := true  
  else
   PCConversion.ActivePageIndex := 0 ;
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
       QryParams.sql.Values['BATCHNAME'] := 'BAT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring ;
       QryParams.sql.Values['MESSAGELENGTH'] := IntToStr(DMTCCoreLink.MessageLength);


       SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
       DoParamsOnSQLScript ;
       ZSQLPrUpdateTables.Execute ;
       if AStringList.IndexOf(QryParams.sql.Values['BATCHNAME']) <> -1 then
       parceSqlFireBird('select * from '+QryParams.sql.Values['BATCHNAME'],QryParams.sql.Values['BATCHNAME'] , '',3);
        if AStringList.IndexOf('BATRBT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring) <> -1 then
          begin
           QryParams.sql.Values['BATCHNAME'] := 'BATRBT' + ZQuery2.fields[0].asstring +  'T' + ZQuery2.fields[1].asstring ;

           SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
           DoParamsOnSQLScript ;
           ZSQLPrUpdateTables.Execute ;
           parceSqlFireBird('select * from '+QryParams.sql.Values['BATCHNAME'],QryParams.sql.Values['BATCHNAME'] , '',3);
          end;
       ZQuery2.next ;

    end;
   ZQuery2.sql.Text := 'select WUserId from users' ;
   ZQuery2.open ;
   while not ZQuery2.eof do
    begin
       QryParams.sql.Values['BATCHNAME'] := 'DOCBATCH_' + ZQuery2.fields[0].asstring +  '_' + ZQuery2.fields[0].asstring ;

       SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\createBatch.txt');
       DoParamsOnSQLScript ;
       ZSQLPrUpdateTables.Execute ;

       QryParams.sql.Values['POSTBATCH'] := 'DOCBATCH_' + ZQuery2.fields[0].asstring +  '_' + ZQuery2.fields[0].asstring ;

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
  // delete dummy
  // set to high version
  DMTCCoreLink.ExecSql('update sysvars set WVERSION = ' + inTToStr(OSFDatabaseversion) );
  DMTCCoreLink.ExecSql('Delete from sysvars where WDEBTORSCONTROLID is null');

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

procedure TFormMainConversion.LoadParams;
var
 AList : TStringlist ;
begin
if not FileExists(ExtractFilePath(Application.ExeName)+'consettings.txt') then exit ;
 AList := TStringlist.Create ;
   try
     AList.LoadFromFile(ExtractFilePath(Application.ExeName)+'consettings.txt');
     if AList.Values['PATH'] <> '' then
        ESubFolder.Text := AList.Values['PATH'] ;
     if  Alist.Values['FOLDER'] <> '' then
        ETC37Folder.Text := Alist.Values['FOLDER'] ;

   finally
    AList.free ;
   end;
end;

procedure TFormMainConversion.SaveParams;
var
 AList : TStringlist ;
begin
 AList := TStringlist.Create ;
   try
   if FileExists(ExtractFilePath(Application.ExeName)+'consettings.txt') then
      AList.LoadFromFile(ExtractFilePath(Application.ExeName)+'consettings.txt');
    AList.Values['PATH'] := ESubFolder.Text ;
    Alist.Values['FOLDER'] := ETC37Folder.Text ;
    AList.SaveToFile(ExtractFilePath(Application.ExeName)+'consettings.txt');
   finally
    AList.free ;
   end;
end;

procedure TFormMainConversion.FormDestroy(Sender: TObject);
begin
SaveParams ;
end;

initialization
TheGlobalDataObject := TGlobalDataObject.Create(nil) ;
TheTC4GlobalDataObject := TGlobalDataObject.Create(nil) ;

finalization
TheGlobalDataObject.free ;
TheTC4GlobalDataObject.free ;

end.
