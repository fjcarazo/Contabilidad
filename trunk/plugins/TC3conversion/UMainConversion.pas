unit UMainConversion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, rpmdesignervcl, ZConnection,
  rpcompobase, rpvclreport,TcashClasses, ComCtrls, ExtCtrls, CheckLst,
     DAScript, UniScript, DBAccess, Uni, MemDS;

type
  TFormMainConversion = class(TForm)
    Query1: TQuery;
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
    UpdateSQL1: TUpdateSQL;
    Query2: TQuery;
    ZQuery1: TUniQuery;
    Database1: TDatabase;
    Table1: TTable;
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
    QFromLogo: TQuery;
    QFromLogoSCompanyName: TStringField;
    QFromLogoSCompanyRegNo: TStringField;
    QFromLogoWEmailServerAddress: TStringField;
    QFromLogoWFaxServerID: TIntegerField;
    QFromLogoBlobLogo: TGraphicField;
    QFromLogoSAddress1: TStringField;
    QFromLogoSAddress2: TStringField;
    QFromLogoSAddress3: TStringField;
    QFromLogoSPostCode: TStringField;
    QFromLogoSPhoneNumber: TStringField;
    QFromLogoSFaxNumber: TStringField;
    QFromLogoWRetainedIncomeID: TIntegerField;
    QFromLogoWDebtorsControlID: TIntegerField;
    QFromLogoWCreditorsControlID: TIntegerField;
    QFromLogoSBackupPath: TStringField;
    QFromLogoWCostOfSalesTypeID: TIntegerField;
    QFromLogoWCreditNoteBatchTypeID: TIntegerField;
    QFromLogoSCreditNoteMessage1: TStringField;
    QFromLogoSCreditNoteMessage2: TStringField;
    QFromLogoSCreditNoteMessage3: TStringField;
    QFromLogoWPurchasesBatchID: TIntegerField;
    QFromLogoSPurchasesMessage1: TStringField;
    QFromLogoSPurchasesMessage2: TStringField;
    QFromLogoSPurchasesMessage3: TStringField;
    QFromLogoWGoodsReturnedBatchID: TIntegerField;
    QFromLogoSGoodsReturnedMessage1: TStringField;
    QFromLogoSGoodsReturnedMessage2: TStringField;
    QFromLogoSGoodsReturnedMessage3: TStringField;
    QFromLogoWInvoicesBatchID: TIntegerField;
    QFromLogoSInvoicesMessage1: TStringField;
    QFromLogoSInvoicesMessage2: TStringField;
    QFromLogoSInvoicesMessage3: TStringField;
    QFromLogoWDisplayAmount: TIntegerField;
    QFromLogoBAccountsOpen: TBooleanField;
    QFromLogoBBatchTypes: TBooleanField;
    QFromLogoBGroups: TBooleanField;
    QFromLogoBNotClosed: TBooleanField;
    QFromLogoBPeriodChange: TBooleanField;
    QFromLogoBSalesmanExist: TBooleanField;
    QFromLogoBUnitsExist: TBooleanField;
    QFromLogoFLastYearPL: TFloatField;
    QFromLogoWNoOfPeriods: TIntegerField;
    QFromLogoWInvoicePaperID: TIntegerField;
    QFromLogoWCreditNotePaperID: TIntegerField;
    QFromLogoWPurchasePaperID: TIntegerField;
    QFromLogoWGoodsReturnedPaperID: TIntegerField;
    QFromLogoWQuotePaperID: TIntegerField;
    QFromLogoWOrderPaperID: TIntegerField;
    QFromLogoWStatementPaperID: TIntegerField;
    QFromLogoWRemittancePaperID: TIntegerField;
    QFromLogoFReconciledBankBalance: TFloatField;
    QFromLogoWReconciledBankID: TIntegerField;
    QFromLogoDReconciledLastDate: TDateField;
    QFromLogoSStatementMessage1: TStringField;
    QFromLogoSStatementMessage2: TStringField;
    QFromLogoSStatementMessage3: TStringField;
    QFromLogoBCreateBalanceLink: TBooleanField;
    QFromLogoWTaxDueAccountID: TIntegerField;
    QFromLogoBTaxInvoiceBased: TBooleanField;
    QFromLogoBCreateCostOfSales: TBooleanField;
    QFromLogoWCurrentUserID: TIntegerField;
    QFromLogoSInvoiceHeading: TStringField;
    QFromLogoSCreditNoteHeading: TStringField;
    QFromLogoSPurchaseHeading: TStringField;
    QFromLogoSGoodsReturnedHeading: TStringField;
    QFromLogoSQuoteHeading: TStringField;
    QFromLogoSQuoteMessage1: TStringField;
    QFromLogoSQuoteMessage2: TStringField;
    QFromLogoSQuoteMessage3: TStringField;
    QFromLogoSOrderHeading: TStringField;
    QFromLogoSOrderMessage1: TStringField;
    QFromLogoSOrderMessage2: TStringField;
    QFromLogoSOrderMessage3: TStringField;
    QFromLogoBPostToLastYear: TBooleanField;
    QFromLogoWBaseCurrencyID: TIntegerField;
    QFromLogoBMultiCurrency: TBooleanField;
    QFromLogoSTaxRegNo: TStringField;
    QFromLogoBPaymentsBased: TBooleanField;
    QFromLogoWDueAccountID: TIntegerField;
    QFromLogoWLanguageID: TIntegerField;
    QFromLogoBOnline: TBooleanField;
    QFromLogoBRemote: TBooleanField;
    QFromLogoWColourID: TIntegerField;
    QFromLogoSAccountReportName1: TStringField;
    QFromLogoSAccountReportName2: TStringField;
    QFromLogoSDebtorReportName1: TStringField;
    QFromLogoSDebtorReportName2: TStringField;
    QFromLogoSCreditorReportName1: TStringField;
    QFromLogoSCreditorReportName2: TStringField;
    QFromLogoSStockReportName1: TStringField;
    QFromLogoSStockReportName2: TStringField;
    QFromLogoSDocumentReportName1: TStringField;
    QFromLogoSDocumentReportName2: TStringField;
    QFromLogoSSellingPriceName1: TStringField;
    QFromLogoSSellingPriceName2: TStringField;
    QFromLogoSSellingPriceName3: TStringField;
    QFromLogoWVersion: TIntegerField;
    QFromLogoSReportFontsName: TStringField;
    QFromLogoBUseAvgCost: TBooleanField;
    QFromLogoBPrnStatementLogo: TBooleanField;
    QFromLogoDTLastUseTime: TDateTimeField;
    QFromLogoBShowTips: TBooleanField;
    QFromLogoWAutoSaveTime: TIntegerField;
    QFromLogoBShowReminder: TBooleanField;
    QFromLogoBServicePreprinted: TBooleanField;
    QFromLogoWDefaultOutPutID: TIntegerField;
    QFromLogoWDefaultZoom: TIntegerField;
    QFromLogoBUseOutLookExp: TBooleanField;
    QFromLogoSEmailAddress: TStringField;
    cbDoTranslations: TCheckBox;
    QGen: TQuery;
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
    procedure HandelLogo;
    procedure DoParamsOnQuery1;

    { Private declarations }
  public
    procedure Mycopyfile(AFrom,ATo : String ) ;
    procedure DoParamsOnSQLScript ;
    procedure CopyFromToWithMask(CopyFromDir,Mask ,CopyToDir : String ) ;
    { Public declarations }
  end;

var
  FormMainConversion: TFormMainConversion;
  TheGlobalDataObject : TGlobalDataObject ;
implementation

uses Math,ZScriptParser, UDMTCCoreLink;

{$R *.dfm}



procedure TFormMainConversion.DoParamsOnQuery1 ;
var
 i,PosParam : Integer ;
 result : String ;
begin
  result :=   ZQuery1.SQL.Text  ;
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
  ZQuery1.SQL.Text := result ;
end;

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
 i,RecordsDone : Integer ;
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
Query1.Close ;
Query1.SQL.Text := 'select * from ' +  AnsiQuotedStr(TableName ,'"')   ;
Query1.open ;

Memo2.Lines.Clear;
Memo2.Lines.add('CREATE TABLE '+AnsiQuotedStr(PReFIx + TableName,AnsiSep) + '(') ;
for i :=0 to min(Query1.FieldCount -1,maxFields) do
  begin
    case  Query1.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' char(' + IntToStr(Query1.Fields[i].size) + ')');
    ftLargeint,ftSmallint, ftInteger, ftWord :  Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' integer');
    ftBoolean :  Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' SmallInt');
    ftFloat, ftCurrency :  Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' float');
    ftDate, ftTime, ftDateTime,ftTimeStamp : Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' timestamp');
    ftAutoInc : Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' integer');
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  : memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' blob');
  //  ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  : Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) + ' binary');

    else
        Memo2.Lines.add(Query1.Fields[i].FieldName + ' unknown');
    end;
    if Memo2.Lines.Count > 2 then
       Memo2.Lines[Memo2.Lines.Count-1] := ',' + Memo2.Lines[Memo2.Lines.Count-1]  ;
  end;
Memo2.Lines.add(')');


InsertSql := 'Insert into ' + AnsiQuotedStr(PReFIx + TableName,AnsiSep) + '(' ;
for i :=0 to min(Query1.FieldCount -1,maxFields) do
  begin
    case  Query1.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) ;
    ftLargeint,ftSmallint, ftInteger, ftWord :  InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep);
    ftBoolean :  InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) ;
    ftFloat, ftCurrency :  InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep);
    ftDate, ftTime, ftDateTime,ftTimeStamp : InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep);
    ftAutoInc : Memo2.Lines.add(AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) );
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  : InsertSql := InsertSql + AnsiQuotedStr(Query1.Fields[i].FieldName,AnsiSep) ;
    else
        Memo2.Lines.add(Query1.Fields[i].FieldName + ' unknown');
    end;
    if i < min(Query1.FieldCount -1,maxFields) then
       InsertSql := InsertSql +','   ;
  end;
  if  lowerCase(TableName) = 'sysvars' then
     begin
        InsertSql:= InsertSql +',WSYSVARSID' ;
     end;
  InsertSql := InsertSql +  ') Values( ';
 end;// End addonly = 0


  Table1.TableName := TableName ;
  Table1.open ;
  IndexSql := '' ;
  For i := 0 to Table1.IndexDefs.Count -1 do
    begin
       if Table1.IndexDefs[i].DisplayName ='<Primary>' then
         begin
        // IndexSql := IndexSql +'COMMIT;';
         if AddOnly = 1 then
         IndexSql := IndexSql +'UPDATE '+ TableName+' SET '+Table1.IndexDefs[i].Fields+' = ' +QuotedStr('0')+' WHERE '+Table1.IndexDefs[i].Fields+' IS NULL;' ;
         if AddOnly = 1 then
         IndexSql := IndexSql +'UPDATE RDB$RELATION_FIELDS SET RDB$NULL_FLAG = 1 WHERE RDB$FIELD_NAME = ' + UpperCase(QuotedStr(Table1.IndexDefs[i].Fields)) +' AND RDB$RELATION_NAME = '+ UpperCase(QuotedStr(TableName))+';' ;
         //IndexSql := IndexSql +'COMMIT;';
         if AddOnly = 2 then
         indexSql := IndexSql +  'alter table ' +TableName+ ' add constraint PK_'+TableName+'_ID primary key ('+Table1.IndexDefs[i].Fields+');'+#13 ;
         end
       else
       begin
       if AddOnly = 2 then
          IndexSql := IndexSql +  'CREATE INDEX '+TableName+'_' +Table1.IndexDefs[i].DisplayName+' ON '+TableName+' ('+Table1.IndexDefs[i].Fields+');' ;

       //IndexSql := IndexSql +'COMMIT;';
       end;
    end;

  Table1.Close ;

 //if AddOnly then
 //begin
 {   x := 5 ;
    try
    ZQuery1.SQL.Text := ' select * from '+AnsiQuotedStr(PReFIx+TableName,AnsiSep) +'  where 1 = 0'  ;
    ZQuery1.Open ;
    except

    end;
    x := 0 ;
  // tabel does not exist
  if ZQuery1.Active then exit ;
 end else
 begin
    try
    ZQuery1.SQL.Text := ' drop table '+AnsiQuotedStr(PReFIx+TableName,AnsiSep)  ;
    ZQuery1.ExecSQL ;
    except

    end;
// end;  }
//IndexSql := Memo2.Lines.text + ';'  + IndexSql;
if AddOnly = 0 then
begin
ZQuery1.SQL.Text := Memo2.Lines.text ;
ZQuery1.ExecSQL ;
end;

 if AddOnly in [1,2] then
 begin
If IndexSql <> '' then
  begin
   try
      Memo2.Lines.add(IndexSql);
     ZSQLProcessor1.SQL.text :=  IndexSql ;
     ZSQLProcessor1.Execute ;
   except;
      //
   end;
  end;
end;
  // pump data
if AddOnly <> 3 then exit ;

ZQuery3.Close ;
RecordsDone := 0 ;
ZUpdateSQL1.InsertSQL.Text := InsertSql ;

Query1.SQL.Text := 'Select * from ' + AnsiQuotedStr(TableName,AnsiSep)   ;
Query1.open ;
ProgressBar1.Position := 0 ;
ProgressBar1.max :=  Query1.RecordCount  ;
Query1.first ;
while not Query1.eof do
    begin

     ProgressBar1.Position := ProgressBar1.Position  + 1 ;
     //ZQuery3.Insert ;
   ZQuery3.sql.Text := InsertSql  ;

   for i :=0 to min(Query1.FieldCount -1,maxFields) do
  begin
   if Query1.Fields[i].AsString <> '' then
    case  Query1.Fields[i].DataType of
    ftString,ftFixedChar, ftWideString : ZQuery3.sql.Add(sysutils.AnsiQuotedStr(Query1.Fields[i].AsString,''''));
    ftLargeint,ftSmallint, ftInteger, ftWord : ZQuery3.sql.Add(Query1.Fields[i].AsString);
    ftBoolean :  begin
                 if Query1.Fields[i].AsBoolean then
                    ZQuery3.sql.Add('1') else
                    ZQuery3.sql.Add('0');
                 end;
    ftFloat, ftCurrency :  ZQuery3.sql.Add( StringReplace(Query1.Fields[i].AsString,DecimalSeparator,'.',[rfReplaceAll]));
    ftDate, ftTime, ftDateTime,ftTimeStamp : ZQuery3.sql.Add(sysutils.AnsiQuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',Query1.Fields[i].AsDateTime),''''));
    ftAutoInc : ZQuery3.sql.Add(AnsiQuotedStr(Query1.Fields[i].AsString,''));
    ftBlob, ftMemo, ftGraphic, ftFmtMemo,  ftParadoxOle, ftDBaseOle, ftTypedBinary  :
       begin
       if LowerCase(TableName) <> 'sysvars' then
        ZQuery3.sql.Add(sysutils.AnsiQuotedStr(Query1.Fields[i].AsString,''''))
           else
        ZQuery3.sql.Add(sysutils.AnsiQuotedStr('','''')) ;

       end;
    else
        ZQuery3.sql.Add(sysutils.AnsiQuotedStr(Query1.Fields[i].AsString,''''));
    end // end case
      else
      begin
      if Query1.Fields[i].DataType <>  ftBoolean then
      ZQuery3.sql.Add('null') else ZQuery3.sql.Add('0');

      end;
    if i < min(Query1.FieldCount -1,maxFields) then
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
      Query1.next ;
    end;
 if Query1.RecordCount <> RecordsDone then
   MDoneTables.Lines.Add(format('Table %s old %s : New %s ',[TableName,IntToStr(Query1.RecordCount),IntToStr(RecordsDone)])) ;

Query1.Close ;


  except 
   on e : Exception Do
    begin
    Query1.Close ;
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
 AQuery : TQuery ;

 ABooks : TBooksCollectionItem ;
 ALanguage : TLanguageCollectionItem ;
 i : Integer ;
 AFrom , Ato : String ;
begin
 ProgressBar1.Max := 100 ;
 ProgressBar1.Position := 0 ;
 ProgressBar1.Visible := true ;
 try
 // clear object
 TheGlobalDataObject.Clear ;
 if FileExists(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm') then
  begin
  TheGlobalDataObject.LoadFromFile(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm')
  end else
  TheGlobalDataObject.LoadedFile := ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm' ;
// TheGlobalDataObject.Languages.clear ;

 AQuery := TQuery.create(nil) ;
 try
  AQuery.DatabaseName := IncludeTrailingPathDelimiter(ETC37Folder.text);
  // Registration
  AQuery.SQL.Text := 'Select * from reg';
  AQuery.Open ;
  if not AQuery.IsEmpty and not TheGlobalDataObject.Registration.Registered then
    begin
      TheGlobalDataObject.Registration.CompanyName := AQuery.FieldByName('SCompanyName').AsString ;
      TheGlobalDataObject.Registration.SerialNumber := AQuery.FieldByName('SSerialNumber').AsString ;
      TheGlobalDataObject.Registration.Registered := AQuery.FieldByName('BRegistered').AsBoolean ;
      TheGlobalDataObject.Save ;
    end;

   if CBCopyReports.Checked then
   begin
     CopyFromToWithMask(IncludeTrailingPathDelimiter(ETC37Folder.text) + 'bin\reports\','*.frf',ExtractFilePath(Application.ExeName)+'bin\reports\');
   end;

   if cbDoTranslations.Checked then
   begin
  // languages
  AQuery.SQL.Text := 'Select * from language';
  AQuery.Open ;
  ProgressBar1.Position := 30 ;
  TheGlobalDataObject.Languages.clear ;
  While not AQuery.Eof do
    begin
      if TheGlobalDataObject.Languages.findLanguageByName(AQuery.FieldByName('SLanguageName').AsString) = nil then
       begin
        ALanguage := TLanguageCollectionItem(TheGlobalDataObject.Languages.Add);
        ALanguage.Name := AQuery.FieldByName('SLanguageName').AsString ;
        ALanguage.filename := AQuery.FieldByName('SLanguageFile').AsString ;
        if TheGlobalDataObject.Languages.Count =1 then
        ALanguage.Active := true ;
       end;
      AQuery.Next ;
      ProgressBar1.Position := ProgressBar1.Position + 5 ;
    end;
   ProgressBar1.Position := 50 ;


   // current language
    // Redo all language files

   for i  := TheGlobalDataObject.Languages.Count -1 downto 0 do
     begin
      try
        ProgressBar1.Position := ProgressBar1.Position + 5 ;
        AQuery.SQL.Text := 'Select * from ' + QuotedStr(TheGlobalDataObject.Languages[i].filename);
        AQuery.Open ;
        TheGlobalDataObject.CurrentLanguage.Clear ;
        while not AQuery.Eof do
          begin
             with TheGlobalDataObject.CurrentLanguage.Add as TTranslationCollectionItem do
               begin
                 IndexID := AQuery.Fields[0].AsInteger ;
                 Text := AQuery.Fields[1].AsString ;
               end;
            AQuery.next ;
          end;
       TheGlobalDataObject.TranslationSaveObject.SaveToFile(ExtractFilePath(Application.ExeName)+'Bin\Languages\'+  theGlobalDataObject.Languages[i].Name +'.dfm');
       except
       //  TheGlobalDataObject.Languages.Delete(i);
       end;
     end;
  TheGlobalDataObject.SaveToFile(ExtractFilePath(Application.ExeName)+'Bin\Settings.dfm');
  end;                
  TheGlobalDataObject.Clear ;
  AQuery.SQL.Text := 'Select * from books';
  AQuery.Open ;
  ProgressBar1.Position := 10 ;
  While not AQuery.Eof do
    begin
      if TheGlobalDataObject.Books.FindBooksByName(AQuery.FieldByName('SBookName').AsString) = nil  then
        begin
        ABooks :=  TBooksCollectionItem(TheGlobalDataObject.Books.Add);
        ABooks.Name := AQuery.FieldByName('SBookName').AsString ;
        ABooks.ConnectionType := 'BDE' ;
        ABooks.Database := AQuery.FieldByName('SBookPath').AsString ;
        end;
      AQuery.Next ;
      ProgressBar1.Position := ProgressBar1.Position + 1 ;
    end;

  finally
    AQuery.free ;
 end;
  ProgressBar1.Position := 100 ;
  if FileExists(IncludeTrailingPathDelimiter(ETC37Folder.text)+'plugins\unlock.ddu') then
      begin
        AFrom := IncludeTrailingPathDelimiter(ETC37Folder.text)+'plugins\unlock.ddu' ;
        Ato := ExtractFilePath(Application.ExeName) + 'plug_ins\unlock.ddu' ;
        Copyfile(pchar(AFrom),pchar(Ato),true);
       end;
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
  for i := 0 to TheGlobalDataObject.Books.Count -1 do
      begin
         CBSetOfBooksToConvert.AddItem(TheGlobalDataObject.Books[i].Database,TheGlobalDataObject.Books[i]);
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
 Procedure DeleteAllFiles(sDirectory:String);
// This will delete all file in the Directory
// And make it empty
// If the Directory dosen't exist it will create it
Var
  F:TSearchRec;
begin
  if DirectoryExists(sDirectory) then
  begin
    if FindFirst(sDirectory+'\*.*',faAnyFile ,F)=0 then
    begin
          DeleteFile(PChar(sDirectory+'\'+f.NAme));
    while FindNext(F)=0 do begin
        DeleteFile(PChar(sDirectory+'\'+f.NAme));
    end;
         // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
    end;
  end
  else
    MkDir(sDirectory);
end;
 procedure CopyFiles ;
 var
 SourceFile,DestFile : String ;
 F : TSearchRec ;
 begin
   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := 120 ;

  if FindFirst(CBSetOfBooksToConvert.Items[i]+'\*.*',faAnyFile ,F)=0 then
     begin
      SourceFile := CBSetOfBooksToConvert.Items[i] + '\'+f.Name;
      DestFile := ExtractFilePath(Application.ExeName) +'conversion\'  +f.Name ;
     if not ((f.Attr and FaDirectory) = FaDirectory) then
       CopyFile(pchar(SourceFile),pchar(DestFile),false);
     while FindNext(F)=0 do begin
       if not ((f.Attr and FaDirectory) = FaDirectory) then
         begin
           SourceFile := CBSetOfBooksToConvert.Items[i] + '\'+f.Name;
           DestFile := ExtractFilePath(Application.ExeName) +'conversion\'  +f.Name ;
           CopyFile(pchar(SourceFile),pchar(DestFile),false);
         end;
        ProgressBar1.Position := ProgressBar1.Position + 1;
     end;
     // done : pieter Findclose to perserve resource
     sysutils.FindClose(f);
  end;
 end;
 var
 SourceFile,DestFile : String ;
 AScript : TStringlist ;
  ConvPath : String ;
begin
 ProgressBar1.Visible := true;
 PBMainPRocess.Visible := true;
 ConvPath :=  ExtractFilePath(Application.ExeName) +'conversion\' ;
  for i := 0 to CBSetOfBooksToConvert.Items.Count -1 do
    begin
      if CBSetOfBooksToConvert.Checked[i] then
         begin
          try
            Label1.Caption := ' Set of books : '  +  CBSetOfBooksToConvert.Items[i] ;
            PBMainPRocess.Max := 100 ;
            PBMainPRocess.Position := 0 ;

            DeleteAllFiles(ConvPath);
            CopyFiles ;
            DeleteValFiles(ConvPath) ;
             //Rename all reserved files
            CopyFile(PChar(Copy(ConvPath+'User.DB',1,500)),PChar(Copy(ConvPath+'Users.DB',1,500)),false);
            DeleteFile(ConvPath+'User.DB');
            CopyFile(PChar(Copy(ConvPath+'User.PX',1,500)),PChar(Copy(ConvPath+'Users.PX',1,500)),false);
            DeleteFile(ConvPath+'User.PX');

            CopyFile(PChar(Copy(ConvPath+'Type.YG0',1,500)),PChar(Copy(ConvPath+'Types.YG0',1,500)),false);
            DeleteFile(ConvPath+'Type.YG0');
            CopyFile(PChar(Copy(ConvPath+'Type.XG0',1,500)),PChar(Copy(ConvPath+'Types.XG0',1,500)),false);
            DeleteFile(ConvPath+'Type.XG0');
            CopyFile(PChar(Copy(ConvPath+'Type.PX',1,500)),PChar(Copy(ConvPath+'Types.PX',1,500)),false);
            DeleteFile(ConvPath+'Type.PX');
            CopyFile(PChar(Copy(ConvPath+'Type.DB',1,500)),PChar(Copy(ConvPath+'Types.DB',1,500)),false);
            DeleteFile(ConvPath+'Type.DB');

            CopyFile(PChar(Copy(ConvPath+'message.YG0',1,500)),PChar(Copy(ConvPath+'messages.YG0',1,500)),false);
            DeleteFile(ConvPath+'message.YG0');
            CopyFile(PChar(Copy(ConvPath+'message.XG0',1,500)),PChar(Copy(ConvPath+'messages.XG0',1,500)),false);
            DeleteFile(ConvPath+'message.XG0');
            CopyFile(PChar(Copy(ConvPath+'message.PX',1,500)),PChar(Copy(ConvPath+'messages.PX',1,500)),false);
            DeleteFile(ConvPath+'message.PX');
            CopyFile(PChar(Copy(ConvPath+'message.DB',1,500)),PChar(Copy(ConvPath+'messages.DB',1,500)),false);
            DeleteFile(ConvPath+'message.DB');
           // Create empty database.
           if not DirectoryExists(ExtractFilePath(Application.ExeName) +'books') then
            CreateDir(ExtractFilePath(Application.ExeName) +'books' );

           SourceFile := ExtractFilePath(Application.ExeName) +'bin\templates\EMPTY.FDB'  ;
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheGlobalDataObject.books[i].Name +'\books.FDB' ;
           CreateDir(ExtractFilePath(Application.ExeName) +'books\'  + TheGlobalDataObject.books[i].Name) ;
           copyfile(PChar(SourceFile),pchar(DestFile),false);
           ZConnection1.Database := DestFile ;
           Database1.DatabaseName := ConvPath ;
           Query1.DatabaseName := ConvPath ;
           Query2.DatabaseName := ConvPath ;
           Table1.DatabaseName := ConvPath ;
           QGen.DatabaseName := ConvPath ;

           QFromLogo.DatabaseName := ConvPath ;
           ZConnection1.Connect ;
            Database1.Open ;
           PBMainPRocess.Position := 10 ;
           if FileExists(ExtractFilePath(Application.ExeName) + 'tc3confscript.txt') then
             begin
               AScript := TStringlist.create ;
               try

               AScript.LoadFromFile(ExtractFilePath(Application.ExeName) + 'tc3confscript.txt');
               SourceFile := AScript.Text ;
               While pos('^',SourceFile) > 0 do
                 begin
                  DestFile := copy(SourceFile,1,pos('^',SourceFile)-1);
                  delete(SourceFile,1,pos('^',SourceFile));

                  QGen.SQL.Text := DestFile ;
                  QGen.ExecSQL ;

                 end;

               finally
                 AScript.free ;
               end;
           end;
           BConvertToFirebird(self);

           if FileExists(ExtractFilePath(Application.ExeName) + 'tc3confendscript.txt') then
             begin
               AScript := TStringlist.create ;
               try

               AScript.LoadFromFile(ExtractFilePath(Application.ExeName) + 'tc3confendscript.txt');
               SourceFile := AScript.Text ;
               While pos('^',SourceFile) > 0 do
                 begin
                  DestFile := copy(SourceFile,1,pos('^',SourceFile)-1);
                  delete(SourceFile,1,pos('^',SourceFile));

                  ZQuery1.SQL.Text := DestFile ;
                  ZQuery1.ExecSQL ;

                 end;

               finally
                 AScript.free ;
               end;
           end;
           // OSCommerce files
           CopyFromToWithMask(CBSetOfBooksToConvert.Items[i],'*.dfm',ExtractFilePath(Application.ExeName) +'books\' + TheGlobalDataObject.books[i].Name);
           // Ini files
           CopyFromToWithMask(CBSetOfBooksToConvert.Items[i],'*.ini',ExtractFilePath(Application.ExeName) +'books\' + TheGlobalDataObject.books[i].Name);

           // BAPI


           SourceFile := CBSetOfBooksToConvert.Items[i] +'BAPISETTINGS.xml'  ;
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheGlobalDataObject.books[i].Name +'\BAPISETTINGS.xml' ;
           if FileExists(SourceFile) then
             CopyFile(pchar(SourceFile),pchar(DestFile),false);

           finally

            Database1.Connected := false ;
            Query1.Close  ;
            Query2.Close ;
            Table1.Close  ;
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
 i,x,AccountLength,SReferenceLength : Integer ;
 AAccount : String ;
begin
 ZConnection1.Connect ;
 MemoSQLError.Clear ;
 MemoSQLErrorRunSql.clear ;

 AList := TStringList.Create ;

 try
   // Known issues
   Query1.SQL.text := 'delete from TransAct where fAmount = 0' ;
   Query1.ExecSQL ;

   Query1.SQL.text := 'delete from TransAct where fAmount is null'  ;
   Query1.ExecSQL ;
   Query1.SQL.text := 'delete from TransAct where WBatchid is null'  ;
   Query1.ExecSQL ;

   Query1.SQL.Text := 'Update Account Set WReportingGroup1ID = 0 where WReportingGroup1ID is null';
   Query1.ExecSQL ;
   Query1.SQL.Text := 'Update Account Set WReportingGroup2ID = 0 where WReportingGroup2ID is null';
   Query1.ExecSQL ;

   Query1.SQL.Text :='update DocHead set WAccountId = 0 where WaccountID is null' ;
   Query1.ExecSQL ;

   Query1.SQL.Text := 'select SMainAccountCode from account where 1 = 0';
   Query1.open ;
   AccountLength := Query1.Fields[0].Size ;

   Query1.SQL.Text := 'select SREFERENCE  from DocHead where 1 = 0';
   Query1.open ;
   SReferenceLength  := Query1.Fields[0].Size ;

   Query1.Close ;
   QryParams.SQL.Values['MAINACCOUNTCODE'] := IntToStr(AccountLength) ;
   QryParams.SQL.Values['DOCHEADREFERENCE'] := IntToStr(SReferenceLength) ;
   QryParams.SQL.Values['ACCOUNTCODE'] := IntToStr(AccountLength+3) ;
   QryParams.SQL.Values['ACCOUNTCODELONG'] := IntToStr(AccountLength+4) ;



   QryParams.SQL.Values['MESSAGELENGTH'] := IntToStr(35) ;


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
   Database1.GetTableNames(AList,false);
   ProgressBar1.Position := 0 ;
   ProgressBar1.Max := AList.Count ;

 //     for i := 0 to AList.Count -1 do
 //   begin
       // parceSqlFireBird('select * from ' + AList[i] ,AList[i],'',3);
     //  ProgressBar1.Position := ProgressBar1.Position + 1;
     //  parceSqlFireBird('select * from Abreviat','Abreviat' , '',3);
//       Memo5.Lines.add('parceSqlFireBird(' + QuotedStr('select * from ' + AList[i]) +',' + QuotedStr(AList[i]) +' , ' + QuotedStr('')+',3);'+#13+#10);
//    end;
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

Application.ProcessMessages;
ZConnection1.Commit ;


    for i := 0 to AList.Count -1 do
   begin
      if POS('BATRBT',uppercase(AList[i])) = 1 then
        begin
           try
           ZQuery1.Close ;
           ZQuery1.SQL.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName))+ 'Bin\SQL\FIREBIRD\createBatch.txt');
           ZQuery1.SQL.Text := StringReplace(ZQuery1.SQL.Text,'<@BATCHNAME@>',AList[i],[rfReplaceAll]) ;
           ZQuery1.SQL.Text := StringReplace(ZQuery1.SQL.Text,'<@MESSAGELENGTH@>','35',[rfReplaceAll]) ;
           ZQuery1.SQL.Text := StringReplace(ZQuery1.SQL.Text,'<@ACCOUNTCODELONG@>',IntToStr(AccountLength+4),[rfReplaceAll]) ;


          // DoParamsOnQuery1 ;
           ZQuery1.ExecSQL ;

           ZQuery1.SQL.Text :=  'INSERT INTO '+ AList[i] +' (WLINEID, SREFERENCE, SACCOUNT, SDESCRIPTION, FDEBIT, FCREDIT, FAMOUNT, STAX, WTAXID, DDATE, SCONTRAACCOUNT, WCONTRAACCOUNTID,'+
           ' FTAXAMOUNT, BEXCLUSIVE, WACCOUNTID, WLINKEDID) ' +
           ' VALUES (:WLINEID, :SREFERENCE, :SACCOUNT, :SDESCRIPTION, :FDEBIT, :FCREDIT, :FAMOUNT, :STAX, :WTAXID, :DDATE, :SCONTRAACCOUNT, :WCONTRAACCOUNTID,'+
           ' :FTAXAMOUNT, :BEXCLUSIVE, :WACCOUNTID, :WLINKEDID) ' ;
           x := 0;
           Table1.TableName := AList[i] ;
           Table1.open ;
           while not Table1.eof do
             begin
              inc(x) ;
               ZQuery1.ParamByName('WLINEID').Value :=  x  ;
               ZQuery1.ParamByName('WLINKEDID').Value :=  x  ;
               ZQuery1.ParamByName('SREFERENCE').Value :=  Table1.fieldByName('SREFERENCE').Value  ;
               ZQuery1.ParamByName('SACCOUNT').Value :=  Table1.fieldByName('SACCOUNT').Value  ;

               AAccount := Table1.fieldByName('SACCOUNT').AsString ;
               AAccount := StringReplace(AAccount,'-','',[rfReplaceAll]);
               ZQuery3.SQL.Text := 'Select WAccountid from account where Saccountcode = '  + QuotedStr(AAccount) ;
               ZQuery3.Open ;
               ZQuery1.ParamByName('WACCOUNTID').AsInteger := ZQuery3.Fields[0].AsInteger ;

               ZQuery1.ParamByName('SDESCRIPTION').Value :=  Table1.fieldByName('SDESCRIPTION').Value  ;
               ZQuery1.ParamByName('FDEBIT').Value :=  Table1.fieldByName('FDEBIT').Value  ;
               ZQuery1.ParamByName('FCREDIT').Value :=  Table1.fieldByName('FCREDIT').Value  ;
               ZQuery1.ParamByName('FAMOUNT').Value :=  Table1.fieldByName('FAMOUNT').Value  ;
               ZQuery1.ParamByName('STAX').Value :=   Table1.fieldByName('STAX').Value  ;
               AAccount := Table1.fieldByName('STAX').AsString ;
               AAccount := StringReplace(AAccount,'-','',[rfReplaceAll]);
               ZQuery3.SQL.Text := 'Select WAccountid from account where Saccountcode = '  + QuotedStr(AAccount) ;
               ZQuery3.Open ;



               ZQuery1.ParamByName('WTAXID').Value :=  ZQuery3.Fields[0].AsInteger ;
               ZQuery1.ParamByName('DDATE').Value :=  Table1.fieldByName('DDATE').Value  ;
               ZQuery1.ParamByName('SCONTRAACCOUNT').Value :=  Table1.fieldByName('SCONTRAACCOUNT').Value  ;

               AAccount := Table1.fieldByName('SCONTRAACCOUNT').AsString ;
               AAccount := StringReplace(AAccount,'-','',[rfReplaceAll]);
               ZQuery3.SQL.Text := 'Select WAccountid from account where Saccountcode = '  + QuotedStr(AAccount) ;
               ZQuery3.Open ;


               ZQuery1.ParamByName('WCONTRAACCOUNTID').Value :=  ZQuery3.Fields[0].AsInteger ;
               ZQuery1.ParamByName('FTAXAMOUNT').Value :=  Table1.fieldByName('FTAXAMOUNT').Value  ;

               ZQuery1.ParamByName('BEXCLUSIVE').Value :=  ord(Table1.fieldByName('BEXCLUSIVE').AsBoolean)  ;
             //   ZQuery1.ParamByName('WACCOUNTID').Value :=  0;
               ZQuery1.ExecSQL ;

               Table1.next ;
             end;
             except

             end;
        end;       // parceSqlFireBird('select * from ' + AList[i] ,AList[i],'',3);
    //  ProgressBar1.Position := ProgressBar1.Position + 1;
     //  parceSqlFireBird('select * from Abreviat','Abreviat' , '',3);
//       Memo5.Lines.add('parceSqlFireBird(' + QuotedStr('select * from ' + AList[i]) +',' + QuotedStr(AList[i]) +' , ' + QuotedStr('')+',3);'+#13+#10);
   end;


PBMainPRocess.Position := 80 ;

   Query1.SQL.Text := 'select max(RECORDID)+1 from CONTACTS';
   Query1.open ;
   QryParams.SQL.Values['GEN_CONTACTS_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;

   Query1.SQL.Text := 'select max(RECORDID)+1 from Events';
   Query1.open ;
   QryParams.SQL.Values['GEN_Events_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;

   Query1.SQL.Text := 'select max(RECORDID)+1 from Tasks';
   Query1.open ;
   QryParams.SQL.Values['GEN_Tasks_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;

   Query1.SQL.Text := 'select max(RESOURCEID)+1 from Resources';
   Query1.open ;
   QryParams.SQL.Values['GEN_ResourceID_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;


   Query1.SQL.Text := 'select max(TaskActionID)+1 from TaskAction';
   Query1.open ;
   QryParams.SQL.Values['GEN_TaskAction_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;

   Query1.SQL.Text := 'select max(WPARAMID)+1 from SYSPARAMS';
   Query1.open ;
   QryParams.SQL.Values['GEN_SYSPARAMS_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;


   Query1.SQL.Text := 'select max(WADDRESSPERACCOUNTID)+1 from ADDRESSPERACCOUNT';
   Query1.open ;
   QryParams.SQL.Values['GEN_ADDRESSPERACCOUNT_ID'] := IntToStr(Query1.Fields[0].AsInteger) ;
   Query1.Close ;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase_SetGen.txt') then
      SQLNewDBSript.sql.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Bin\SQL\FIREBIRD\CreateDatabase_SetGen.txt');
   DoParamsOnSQLScript ;
   PBMainPRocess.Position := 90 ;
   ZConnection1.StartTransaction ;
   ZSQLPrUpdateTables.Execute ;

   ZQuery1.SQL.Text := 'select max(RECORDID)+1 from CONTACTS';
   ZQuery1.open ;
   QryParams.SQL.Values['GEN_CONTACTS_ID'] := IntToStr(ZQuery1.Fields[0].AsInteger) ;
   ZQuery1.Close ;
   ZQuery1.SQL.Text := 'SET GENERATOR GEN_CONTACTS_ID TO ' + QryParams.SQL.Values['GEN_CONTACTS_ID'];
   ZQuery1.ExecSQL ;


   ZConnection1.Commit ;

   DMTCCoreLink.TheZConnection := nil ;
   DMTCCoreLink.AApplication := nil ;

    // do data
   ZConnection1.Disconnect ;

   // handel by program.
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
      ZConnection1.Connect ;
      HandelLogo;
      ZQuery3.sql.Text := 'Update Sysvars set WVERSION = 0 ';
      ZQuery3.ExecSQL ;
      ZQuery3.sql.Text := 'update sysparams set SParamValue =' + QuotedStr('osFinancials Email')+' where SParamValue like ' + QuotedStr('%TurboCASH3%') ;
      ZQuery3.ExecSQL ;
      ZQuery3.sql.Text := 'update transact set WLINKEDID= Wlineid' ;
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
           DestFile := ExtractFilePath(Application.ExeName) +'books\'  + TheGlobalDataObject.books[i].Name +'\books.FDB' ;
           ZConnection1.Database := DestFile ;
           Database1.DatabaseName := ConvPath ;
           Query1.DatabaseName := ConvPath ;
           Query2.DatabaseName := ConvPath ;
           Table1.DatabaseName := ConvPath ;
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

procedure TFormMainConversion.HandelLogo;
var
 Astream : TMemoryStream ;
begin
  Astream := TMemoryStream.create ;
  try
   QFromLogo.open ;
   if not QFromLogoBLOBLOGO.IsNull then
   begin
   QFromLogoBLOBLOGO.SaveToStream(Astream);
   ZQToLogo.Open ;
   ZQToLogo.Edit ;
   Astream.Position := 0 ;
   ZQToLogoBLOBLOGO.LoadFromStream(Astream);
   ZQToLogo.post;
   QFromLogo.close ;
   ZQToLogo.close ;
   end;
  finally
    aStream.free ;
  end;
end;


initialization
TheGlobalDataObject := TGlobalDataObject.Create(nil) ;

finalization
TheGlobalDataObject.free ;


end.
