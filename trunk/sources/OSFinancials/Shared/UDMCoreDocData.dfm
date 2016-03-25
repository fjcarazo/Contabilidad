object DMCoreDocData: TDMCoreDocData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 886
  Top = 298
  Height = 440
  Width = 480
  object ZQDocHead: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from dochead where WDocId=:wdocid')
    UpdateObject = ZUSQLDocHead
    BeforeOpen = ZQDocHeadBeforeOpen
    AfterInsert = ZQDocHeadAfterInsert
    Left = 52
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wdocid'
      end>
    object ZQDocHeadWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQDocHeadSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object ZQDocHeadWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object ZQDocHeadDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQDocHeadDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object ZQDocHeadWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQDocHeadWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object ZQDocHeadWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object ZQDocHeadWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object ZQDocHeadWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object ZQDocHeadWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object ZQDocHeadWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object ZQDocHeadWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object ZQDocHeadWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object ZQDocHeadFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object ZQDocHeadWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object ZQDocHeadSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQDocHeadWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object ZQDocHeadWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object ZQDocHeadWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object ZQDocHeadWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object ZQDocHeadBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object ZQDocHeadBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQDocHeadWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQDocHeadWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQDocHeadWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object ZQDocHeadBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQDocHeadWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQDocHeadFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
    end
    object ZQDocHeadFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQDocHeadBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object ZQDocHeadDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQDocHeadWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object ZQDocHeadWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQDocHeadWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
    object ZQDocHeadWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQDocHeadDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object ZQDocHeadWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQDocHeadWPOSCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSCOUNTRIES_ID'
    end
    object ZQDocHeadWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object ZQDocHeadSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 50
    end
    object ZQDocHeadWPOSTALNAME: TIntegerField
      FieldName = 'WPOSTALNAME'
    end
    object ZQDocHeadWPOSTALCONTACT: TIntegerField
      FieldName = 'WPOSTALCONTACT'
    end
    object ZQDocHeadWDELNAME: TIntegerField
      FieldName = 'WDELNAME'
    end
    object ZQDocHeadWDELCONTACT: TIntegerField
      FieldName = 'WDELCONTACT'
    end
    object ZQDocHeadWTAXNUMBER: TIntegerField
      FieldName = 'WTAXNUMBER'
    end
    object ZQDocHeadWCONTRAACCOUNT: TIntegerField
      FieldName = 'WCONTRAACCOUNT'
    end
    object ZQDocHeadWOPENITEMTRANSACTID: TIntegerField
      FieldName = 'WOPENITEMTRANSACTID'
    end
  end
  object ZUSQLDocHead: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO dochead'
      
        '  (dochead.WDOCID, dochead.SDOCNO, dochead.WTYPEID, dochead.DDAT' +
        'E, dochead.DALLOCATEDDATE, '
      
        '   dochead.WACCOUNTID, dochead.WPAYMENTTYPEID, dochead.WPOSTAL1I' +
        'D, dochead.WPOSTAL2ID, '
      
        '   dochead.WPOSTAL3ID, dochead.WPOSCOUNTRIES_ID, dochead.WPOSTAL' +
        'CODEID, '
      
        '   dochead.WMESSAGE1ID, dochead.WMESSAGE2ID, dochead.WMESSAGE3ID' +
        ', dochead.FINVOICEDISCOUNT, '
      
        '   dochead.WSALESMANID, dochead.SREFERENCE, dochead.WDELADDRESS1' +
        'ID, dochead.WDELADDRESS2ID, '
      
        '   dochead.WDELADDRESS3ID, dochead.WDELCOUNTRIES_ID, dochead.WDE' +
        'LCODEID, '
      
        '   dochead.BPRINTED, dochead.BPOSTED, dochead.WREPORTINGGROUP1ID' +
        ', dochead.WREPORTINGGROUP2ID, '
      
        '   dochead.WPAYMENTGROUPID, dochead.BEXCLUSIVE, dochead.WCURRENC' +
        'YID, dochead.FDOCAMOUNT, '
      
        '   dochead.FTAXAMOUNT, dochead.BREPEATING, dochead.DSYSDATE, doc' +
        'head.WSOURCETYPEID, '
      
        '   dochead.WPROFILEID, dochead.WTERMS, dochead.WJOBCODEID, doche' +
        'ad.DDUEDATE, '
      
        '   dochead.WUSERID, dochead.SEXTERNALID, dochead.WPOSTALNAME, do' +
        'chead.WPOSTALCONTACT, '
      
        '   dochead.WDELNAME, dochead.WDELCONTACT, dochead.WTAXNUMBER, do' +
        'chead.WCONTRAACCOUNT, '
      '   dochead.WOPENITEMTRANSACTID)'
      'VALUES'
      
        '  (:WDOCID, :SDOCNO, :WTYPEID, :DDATE, :DALLOCATEDDATE, :WACCOUN' +
        'TID, :WPAYMENTTYPEID, '
      
        '   :WPOSTAL1ID, :WPOSTAL2ID, :WPOSTAL3ID, :WPOSCOUNTRIES_ID, :WP' +
        'OSTALCODEID, '
      
        '   :WMESSAGE1ID, :WMESSAGE2ID, :WMESSAGE3ID, :FINVOICEDISCOUNT, ' +
        ':WSALESMANID, '
      
        '   :SREFERENCE, :WDELADDRESS1ID, :WDELADDRESS2ID, :WDELADDRESS3I' +
        'D, :WDELCOUNTRIES_ID, '
      
        '   :WDELCODEID, :BPRINTED, :BPOSTED, :WREPORTINGGROUP1ID, :WREPO' +
        'RTINGGROUP2ID, '
      
        '   :WPAYMENTGROUPID, :BEXCLUSIVE, :WCURRENCYID, :FDOCAMOUNT, :FT' +
        'AXAMOUNT, '
      
        '   :BREPEATING, :DSYSDATE, :WSOURCETYPEID, :WPROFILEID, :WTERMS,' +
        ' :WJOBCODEID, '
      
        '   :DDUEDATE, :WUSERID, :SEXTERNALID, :WPOSTALNAME, :WPOSTALCONT' +
        'ACT, :WDELNAME, '
      
        '   :WDELCONTACT, :WTAXNUMBER, :WCONTRAACCOUNT, :WOPENITEMTRANSAC' +
        'TID)')
    DeleteSQL.Strings = (
      'DELETE FROM dochead'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    ModifySQL.Strings = (
      'UPDATE dochead SET'
      '  dochead.WDOCID = :WDOCID,'
      '  dochead.SDOCNO = :SDOCNO,'
      '  dochead.WTYPEID = :WTYPEID,'
      '  dochead.DDATE = :DDATE,'
      '  dochead.DALLOCATEDDATE = :DALLOCATEDDATE,'
      '  dochead.WACCOUNTID = :WACCOUNTID,'
      '  dochead.WPAYMENTTYPEID = :WPAYMENTTYPEID,'
      '  dochead.WPOSTAL1ID = :WPOSTAL1ID,'
      '  dochead.WPOSTAL2ID = :WPOSTAL2ID,'
      '  dochead.WPOSTAL3ID = :WPOSTAL3ID,'
      '  dochead.WPOSCOUNTRIES_ID = :WPOSCOUNTRIES_ID,'
      '  dochead.WPOSTALCODEID = :WPOSTALCODEID,'
      '  dochead.WMESSAGE1ID = :WMESSAGE1ID,'
      '  dochead.WMESSAGE2ID = :WMESSAGE2ID,'
      '  dochead.WMESSAGE3ID = :WMESSAGE3ID,'
      '  dochead.FINVOICEDISCOUNT = :FINVOICEDISCOUNT,'
      '  dochead.WSALESMANID = :WSALESMANID,'
      '  dochead.SREFERENCE = :SREFERENCE,'
      '  dochead.WDELADDRESS1ID = :WDELADDRESS1ID,'
      '  dochead.WDELADDRESS2ID = :WDELADDRESS2ID,'
      '  dochead.WDELADDRESS3ID = :WDELADDRESS3ID,'
      '  dochead.WDELCOUNTRIES_ID = :WDELCOUNTRIES_ID,'
      '  dochead.WDELCODEID = :WDELCODEID,'
      '  dochead.BPRINTED = :BPRINTED,'
      '  dochead.BPOSTED = :BPOSTED,'
      '  dochead.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  dochead.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  dochead.WPAYMENTGROUPID = :WPAYMENTGROUPID,'
      '  dochead.BEXCLUSIVE = :BEXCLUSIVE,'
      '  dochead.WCURRENCYID = :WCURRENCYID,'
      '  dochead.FDOCAMOUNT = :FDOCAMOUNT,'
      '  dochead.FTAXAMOUNT = :FTAXAMOUNT,'
      '  dochead.BREPEATING = :BREPEATING,'
      '  dochead.DSYSDATE = :DSYSDATE,'
      '  dochead.WSOURCETYPEID = :WSOURCETYPEID,'
      '  dochead.WPROFILEID = :WPROFILEID,'
      '  dochead.WTERMS = :WTERMS,'
      '  dochead.WJOBCODEID = :WJOBCODEID,'
      '  dochead.DDUEDATE = :DDUEDATE,'
      '  dochead.WUSERID = :WUSERID,'
      '  dochead.SEXTERNALID = :SEXTERNALID,'
      '  dochead.WPOSTALNAME = :WPOSTALNAME,'
      '  dochead.WPOSTALCONTACT = :WPOSTALCONTACT,'
      '  dochead.WDELNAME = :WDELNAME,'
      '  dochead.WDELCONTACT = :WDELCONTACT,'
      '  dochead.WTAXNUMBER = :WTAXNUMBER,'
      '  dochead.WCONTRAACCOUNT = :WCONTRAACCOUNT,'
      '  dochead.WOPENITEMTRANSACTID = :WOPENITEMTRANSACTID'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    Left = 48
    Top = 88
  end
  object ZQDocLine: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from docline where WDocId =:WDocid')
    UpdateObject = ZSQLDocLine
    BeforeOpen = ZQDocLineBeforeOpen
    Left = 128
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDocid'
      end>
    object ZQDocLineWDOCLINEID: TIntegerField
      FieldName = 'WDOCLINEID'
      Required = True
    end
    object ZQDocLineWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQDocLineWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQDocLineWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object ZQDocLineWDESCRIPTIONID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQDocLineFQTYORDERED: TFloatField
      FieldName = 'FQTYORDERED'
    end
    object ZQDocLineFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object ZQDocLineFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object ZQDocLineFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object ZQDocLineWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQDocLineFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
    end
    object ZQDocLineFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
    end
    object ZQDocLineFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQDocLineDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQDocLineSUNIT: TStringField
      FieldName = 'SUNIT'
      Size = 8
    end
    object ZQDocLineSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZQDocLineWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQDocLineWSERIALNOID: TIntegerField
      FieldName = 'WSERIALNOID'
    end
    object ZQDocLineWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQDocLineWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQDocLineWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQDocLineWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object ZSQLDocLine: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO docline'
      
        '  (docline.WDOCLINEID, docline.WDOCID, docline.WSTOCKID, docline' +
        '.WLINETYPEID, '
      
        '   docline.WDESCRIPTIONID, docline.FQTYORDERED, docline.FQTYSHIP' +
        'PED, docline.FSELLINGPRICE, '
      
        '   docline.FITEMDISCOUNT, docline.WTAXID, docline.FEXCLUSIVEAMT,' +
        ' docline.FINCLUSIVEAMT, '
      
        '   docline.FTAXAMOUNT, docline.DSYSDATE, docline.SUNIT, docline.' +
        'SSTOCKCODE, '
      
        '   docline.WPROFILEID, docline.WSERIALNOID, docline.WSORTNO, doc' +
        'line.WREPORTINGGROUP1ID, '
      '   docline.WREPORTINGGROUP2ID, docline.WACCOUNTID)'
      'VALUES'
      
        '  (:WDOCLINEID, :WDOCID, :WSTOCKID, :WLINETYPEID, :WDESCRIPTIONI' +
        'D, :FQTYORDERED, '
      
        '   :FQTYSHIPPED, :FSELLINGPRICE, :FITEMDISCOUNT, :WTAXID, :FEXCL' +
        'USIVEAMT, '
      
        '   :FINCLUSIVEAMT, :FTAXAMOUNT, :DSYSDATE, :SUNIT, :SSTOCKCODE, ' +
        ':WPROFILEID, '
      
        '   :WSERIALNOID, :WSORTNO, :WREPORTINGGROUP1ID, :WREPORTINGGROUP' +
        '2ID, :WACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM docline'
      'WHERE'
      '  docline.WDOCLINEID = :OLD_WDOCLINEID AND'
      '  docline.WDOCID = :OLD_WDOCID')
    ModifySQL.Strings = (
      'UPDATE docline SET'
      '  docline.WDOCLINEID = :WDOCLINEID,'
      '  docline.WDOCID = :WDOCID,'
      '  docline.WSTOCKID = :WSTOCKID,'
      '  docline.WLINETYPEID = :WLINETYPEID,'
      '  docline.WDESCRIPTIONID = :WDESCRIPTIONID,'
      '  docline.FQTYORDERED = :FQTYORDERED,'
      '  docline.FQTYSHIPPED = :FQTYSHIPPED,'
      '  docline.FSELLINGPRICE = :FSELLINGPRICE,'
      '  docline.FITEMDISCOUNT = :FITEMDISCOUNT,'
      '  docline.WTAXID = :WTAXID,'
      '  docline.FEXCLUSIVEAMT = :FEXCLUSIVEAMT,'
      '  docline.FINCLUSIVEAMT = :FINCLUSIVEAMT,'
      '  docline.FTAXAMOUNT = :FTAXAMOUNT,'
      '  docline.DSYSDATE = :DSYSDATE,'
      '  docline.SUNIT = :SUNIT,'
      '  docline.SSTOCKCODE = :SSTOCKCODE,'
      '  docline.WPROFILEID = :WPROFILEID,'
      '  docline.WSERIALNOID = :WSERIALNOID,'
      '  docline.WSORTNO = :WSORTNO,'
      '  docline.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  docline.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  docline.WACCOUNTID = :WACCOUNTID'
      'WHERE'
      '  docline.WDOCLINEID = :OLD_WDOCLINEID AND'
      '  docline.WDOCID = :OLD_WDOCID')
    Left = 144
    Top = 104
  end
  object ZQStock: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from stock where WstockId =:WStockID')
    UpdateObject = ZSQLStock
    BeforeOpen = ZQStockBeforeOpen
    Left = 24
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockID'
      end>
    object ZQStockWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZQStockSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object ZQStockSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQStockWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQStockWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQStockWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object ZQStockWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object ZQStockWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object ZQStockFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object ZQStockFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object ZQStockFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object ZQStockFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object ZQStockBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object ZQStockWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object ZQStockFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object ZQStockFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object ZQStockFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object ZQStockFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object ZQStockDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQStockBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object ZQStockWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object ZQStockBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object ZQStockWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object ZQStockWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object ZQStockWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object ZQStockWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object ZQStockWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQStockBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object ZQStockWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object ZQStockWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object ZQStockWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object ZQStockSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
    object ZQStockSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 200
    end
    object ZQStockFNETTOWEIGHT: TFloatField
      FieldName = 'FNETTOWEIGHT'
    end
    object ZQStockFGROSSWEIGHT: TFloatField
      FieldName = 'FGROSSWEIGHT'
    end
    object ZQStockFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
    object ZQStockSMANUFACTURER: TStringField
      FieldName = 'SMANUFACTURER'
      Size = 35
    end
    object ZQStockFMINIMUMQTY: TFloatField
      FieldName = 'FMINIMUMQTY'
    end
    object ZQStockSSTOCKCODESUP1: TStringField
      FieldName = 'SSTOCKCODESUP1'
      Size = 30
    end
    object ZQStockSSTOCKCODESUP2: TStringField
      FieldName = 'SSTOCKCODESUP2'
      Size = 30
    end
  end
  object ZSQLStock: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stock'
      
        '  (stock.WSTOCKID, stock.SSTOCKCODE, stock.SBARCODENUMBER, stock' +
        '.SDESCRIPTION, '
      
        '   stock.WREPORTINGGROUP1ID, stock.WREPORTINGGROUP2ID, stock.WCO' +
        'STACCOUNTID, '
      
        '   stock.WINPUTTAXID, stock.WOUTPUTTAXID, stock.FOPENINGAVECOST,' +
        ' stock.FQTYONHAND, '
      
        '   stock.FOPENINGQTY, stock.FINVQTYONHAND, stock.FREORDERQTY, st' +
        'ock.WSALESACCOUNTID, '
      
        '   stock.BAPPLYINVOICEDISCOUNT, stock.WSTOCKACCOUNTID, stock.FSE' +
        'LLINGPRICE1, '
      
        '   stock.FSELLINGPRICE2, stock.FSELLINGPRICE3, stock.FUNITAVECOS' +
        'T, stock.FUNITCOST, '
      
        '   stock.WUNITID, stock.DSYSDATE, stock.BAPPLYTAX, stock.WINPUTT' +
        'AX2ID, '
      
        '   stock.BTAXABLE, stock.WSUPPLIER1ID, stock.WSUPPLIER2ID, stock' +
        '.WSTOCKTYPEID, '
      
        '   stock.WOUTPUTTAX2ID, stock.WPROFILEID, stock.BDISABLED, stock' +
        '.WPERENTID, '
      
        '   stock.WLOCATIONID, stock.WFILENAMEID, stock.SEXTRADESC, stock' +
        '.SEXTERNALID, '
      
        '   stock.FNETTOWEIGHT, stock.FGROSSWEIGHT, stock.FREORDERQTYTRIG' +
        ', stock.SMANUFACTURER, '
      
        '   stock.FMINIMUMQTY, stock.SSTOCKCODESUP1, stock.SSTOCKCODESUP2' +
        ')'
      'VALUES'
      
        '  (:WSTOCKID, :SSTOCKCODE, :SBARCODENUMBER, :SDESCRIPTION, :WREP' +
        'ORTINGGROUP1ID, '
      
        '   :WREPORTINGGROUP2ID, :WCOSTACCOUNTID, :WINPUTTAXID, :WOUTPUTT' +
        'AXID, :FOPENINGAVECOST, '
      
        '   :FQTYONHAND, :FOPENINGQTY, :FINVQTYONHAND, :FREORDERQTY, :WSA' +
        'LESACCOUNTID, '
      
        '   :BAPPLYINVOICEDISCOUNT, :WSTOCKACCOUNTID, :FSELLINGPRICE1, :F' +
        'SELLINGPRICE2, '
      
        '   :FSELLINGPRICE3, :FUNITAVECOST, :FUNITCOST, :WUNITID, :DSYSDA' +
        'TE, :BAPPLYTAX, '
      
        '   :WINPUTTAX2ID, :BTAXABLE, :WSUPPLIER1ID, :WSUPPLIER2ID, :WSTO' +
        'CKTYPEID, '
      
        '   :WOUTPUTTAX2ID, :WPROFILEID, :BDISABLED, :WPERENTID, :WLOCATI' +
        'ONID, :WFILENAMEID, '
      
        '   :SEXTRADESC, :SEXTERNALID, :FNETTOWEIGHT, :FGROSSWEIGHT, :FRE' +
        'ORDERQTYTRIG, '
      
        '   :SMANUFACTURER, :FMINIMUMQTY, :SSTOCKCODESUP1, :SSTOCKCODESUP' +
        '2)')
    DeleteSQL.Strings = (
      'DELETE FROM stock'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    ModifySQL.Strings = (
      'UPDATE stock SET'
      '  stock.WSTOCKID = :WSTOCKID,'
      '  stock.SSTOCKCODE = :SSTOCKCODE,'
      '  stock.SBARCODENUMBER = :SBARCODENUMBER,'
      '  stock.SDESCRIPTION = :SDESCRIPTION,'
      '  stock.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  stock.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  stock.WCOSTACCOUNTID = :WCOSTACCOUNTID,'
      '  stock.WINPUTTAXID = :WINPUTTAXID,'
      '  stock.WOUTPUTTAXID = :WOUTPUTTAXID,'
      '  stock.FOPENINGAVECOST = :FOPENINGAVECOST,'
      '  stock.FQTYONHAND = :FQTYONHAND,'
      '  stock.FOPENINGQTY = :FOPENINGQTY,'
      '  stock.FINVQTYONHAND = :FINVQTYONHAND,'
      '  stock.FREORDERQTY = :FREORDERQTY,'
      '  stock.WSALESACCOUNTID = :WSALESACCOUNTID,'
      '  stock.BAPPLYINVOICEDISCOUNT = :BAPPLYINVOICEDISCOUNT,'
      '  stock.WSTOCKACCOUNTID = :WSTOCKACCOUNTID,'
      '  stock.FSELLINGPRICE1 = :FSELLINGPRICE1,'
      '  stock.FSELLINGPRICE2 = :FSELLINGPRICE2,'
      '  stock.FSELLINGPRICE3 = :FSELLINGPRICE3,'
      '  stock.FUNITAVECOST = :FUNITAVECOST,'
      '  stock.FUNITCOST = :FUNITCOST,'
      '  stock.WUNITID = :WUNITID,'
      '  stock.DSYSDATE = :DSYSDATE,'
      '  stock.BAPPLYTAX = :BAPPLYTAX,'
      '  stock.WINPUTTAX2ID = :WINPUTTAX2ID,'
      '  stock.BTAXABLE = :BTAXABLE,'
      '  stock.WSUPPLIER1ID = :WSUPPLIER1ID,'
      '  stock.WSUPPLIER2ID = :WSUPPLIER2ID,'
      '  stock.WSTOCKTYPEID = :WSTOCKTYPEID,'
      '  stock.WOUTPUTTAX2ID = :WOUTPUTTAX2ID,'
      '  stock.WPROFILEID = :WPROFILEID,'
      '  stock.BDISABLED = :BDISABLED,'
      '  stock.WPERENTID = :WPERENTID,'
      '  stock.WLOCATIONID = :WLOCATIONID,'
      '  stock.WFILENAMEID = :WFILENAMEID,'
      '  stock.SEXTRADESC = :SEXTRADESC,'
      '  stock.SEXTERNALID = :SEXTERNALID,'
      '  stock.FNETTOWEIGHT = :FNETTOWEIGHT,'
      '  stock.FGROSSWEIGHT = :FGROSSWEIGHT,'
      '  stock.FREORDERQTYTRIG = :FREORDERQTYTRIG,'
      '  stock.SMANUFACTURER = :SMANUFACTURER,'
      '  stock.FMINIMUMQTY = :FMINIMUMQTY,'
      '  stock.SSTOCKCODESUP1 = :SSTOCKCODESUP1,'
      '  stock.SSTOCKCODESUP2 = :SSTOCKCODESUP2'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    Left = 48
    Top = 240
  end
  object ZQStockTrans: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from STOCKTRN where Wstocktransactionid = -1')
    UpdateObject = ZUSQLStockTrans
    AfterInsert = ZQStockTransAfterInsert
    Left = 168
    Top = 168
    object ZQStockTransWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
      Required = True
    end
    object ZQStockTransWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockTransDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQStockTransWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object ZQStockTransWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQStockTransWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object ZQStockTransFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQStockTransFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object ZQStockTransFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object ZQStockTransWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQStockTransDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQStockTransWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
  end
  object ZUSQLStockTrans: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stocktrn'
      
        '  (stocktrn.WSTOCKTRANSACTIONID, stocktrn.WSTOCKID, stocktrn.DDA' +
        'TE, stocktrn.WSALESMANID, '
      
        '   stocktrn.WDOCID, stocktrn.WDOCTYPEID, stocktrn.FQTY, stocktrn' +
        '.FCOSTPRICE, '
      
        '   stocktrn.FSELLINGPRICE, stocktrn.WACCOUNTID, stocktrn.DSYSDAT' +
        'E, stocktrn.WLINEID)'
      'VALUES'
      
        '  (:WSTOCKTRANSACTIONID, :WSTOCKID, :DDATE, :WSALESMANID, :WDOCI' +
        'D, :WDOCTYPEID, '
      
        '   :FQTY, :FCOSTPRICE, :FSELLINGPRICE, :WACCOUNTID, :DSYSDATE, :' +
        'WLINEID)')
    DeleteSQL.Strings = (
      'DELETE FROM stocktrn'
      'WHERE'
      '  stocktrn.WSTOCKTRANSACTIONID = :OLD_WSTOCKTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE stocktrn SET'
      '  stocktrn.WSTOCKTRANSACTIONID = :WSTOCKTRANSACTIONID,'
      '  stocktrn.WSTOCKID = :WSTOCKID,'
      '  stocktrn.DDATE = :DDATE,'
      '  stocktrn.WSALESMANID = :WSALESMANID,'
      '  stocktrn.WDOCID = :WDOCID,'
      '  stocktrn.WDOCTYPEID = :WDOCTYPEID,'
      '  stocktrn.FQTY = :FQTY,'
      '  stocktrn.FCOSTPRICE = :FCOSTPRICE,'
      '  stocktrn.FSELLINGPRICE = :FSELLINGPRICE,'
      '  stocktrn.WACCOUNTID = :WACCOUNTID,'
      '  stocktrn.DSYSDATE = :DSYSDATE,'
      '  stocktrn.WLINEID = :WLINEID'
      'WHERE'
      '  stocktrn.WSTOCKTRANSACTIONID = '
      ':OLD_WSTOCKTRANSACTIONID')
    Left = 144
    Top = 240
  end
  object ZQBom: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from bom')
    Left = 288
    Top = 32
    object ZQBomWBOMID: TIntegerField
      FieldName = 'WBOMID'
      Required = True
    end
    object ZQBomWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQBomWLINKEDSTOCKID: TIntegerField
      FieldName = 'WLINKEDSTOCKID'
      Required = True
    end
    object ZQBomFQTY: TFloatField
      FieldName = 'FQTY'
      Required = True
    end
    object ZQBomFPERCENTAGEOFSALE: TFloatField
      FieldName = 'FPERCENTAGEOFSALE'
    end
  end
  object ZQAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from account where WaccountId=:WaccountID')
    BeforeOpen = InitFieldsWithWAccountId
    Left = 352
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WaccountID'
      end>
    object ZQAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object ZQDebtor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from debtor where WaccountId=:WaccountID')
    BeforeOpen = InitFieldsWithWAccountId
    Left = 416
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WaccountID'
      end>
    object ZQDebtorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQDebtorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object ZQDebtorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object ZQDebtorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object ZQDebtorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object ZQDebtorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object ZQDebtorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object ZQDebtorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object ZQDebtorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object ZQDebtorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object ZQDebtorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object ZQDebtorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object ZQDebtorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object ZQDebtorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object ZQDebtorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object ZQDebtorSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object ZQDebtorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object ZQDebtorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object ZQDebtorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object ZQDebtorSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
    end
    object ZQDebtorDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object ZQDebtorSCREDITCARDTYPE: TStringField
      FieldName = 'SCREDITCARDTYPE'
    end
    object ZQDebtorSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object ZQDebtorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object ZQDebtorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object ZQDebtorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object ZQDebtorFINTEREST: TFloatField
      FieldName = 'FINTEREST'
    end
    object ZQDebtorWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object ZQDebtorWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object ZQDebtorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQDebtorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object ZQDebtorBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object ZQDebtorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object ZQDebtorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object ZQDebtorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object ZQDebtorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQDebtorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object ZQDebtorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQDebtorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQDebtorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object ZQDebtorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object ZQDebtorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
    object ZQDebtorDREMITTANCE: TDateTimeField
      FieldName = 'DREMITTANCE'
    end
    object ZQDebtorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
    end
    object ZQDebtorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object ZQDebtorSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 35
    end
    object ZQDebtorSFREEFIELD1: TStringField
      FieldName = 'SFREEFIELD1'
      Size = 35
    end
    object ZQDebtorSFREEFIELD2: TStringField
      FieldName = 'SFREEFIELD2'
      Size = 35
    end
    object ZQDebtorSFREEFIELD3: TStringField
      FieldName = 'SFREEFIELD3'
      Size = 35
    end
    object ZQDebtorSLANGUAGE: TStringField
      FieldName = 'SLANGUAGE'
      Size = 35
    end
    object ZQDebtorSLAYOUTINVOICE: TStringField
      FieldName = 'SLAYOUTINVOICE'
      Size = 35
    end
    object ZQDebtorSLAYOUTCREDITNOTE: TStringField
      FieldName = 'SLAYOUTCREDITNOTE'
      Size = 35
    end
    object ZQDebtorSLAYOUTQUOTE: TStringField
      FieldName = 'SLAYOUTQUOTE'
      Size = 35
    end
  end
  object ZQCreditor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from creditor where WaccountId=:WaccountID')
    BeforeOpen = InitFieldsWithWAccountId
    Left = 416
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WaccountID'
      end>
    object ZQCreditorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQCreditorSCODE: TStringField
      FieldName = 'SCODE'
      Size = 6
    end
    object ZQCreditorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
      Required = True
    end
    object ZQCreditorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object ZQCreditorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object ZQCreditorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object ZQCreditorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object ZQCreditorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object ZQCreditorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object ZQCreditorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object ZQCreditorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object ZQCreditorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object ZQCreditorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object ZQCreditorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object ZQCreditorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object ZQCreditorWBANKNAME: TStringField
      FieldName = 'WBANKNAME'
    end
    object ZQCreditorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object ZQCreditorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object ZQCreditorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object ZQCreditorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object ZQCreditorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object ZQCreditorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQCreditorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object ZQCreditorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object ZQCreditorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQCreditorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object ZQCreditorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object ZQCreditorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQCreditorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object ZQCreditorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object ZQCreditorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQCreditorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object ZQCreditorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object ZQCreditorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
    object ZQCreditorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
    end
    object ZQCreditorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object ZQCreditorSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 35
    end
    object ZQCreditorSFREEFIELD1: TStringField
      FieldName = 'SFREEFIELD1'
      Size = 35
    end
    object ZQCreditorSFREEFIELD2: TStringField
      FieldName = 'SFREEFIELD2'
      Size = 35
    end
    object ZQCreditorSFREEFIELD3: TStringField
      FieldName = 'SFREEFIELD3'
      Size = 35
    end
    object ZQCreditorSLANGUAGE: TStringField
      FieldName = 'SLANGUAGE'
      Size = 35
    end
    object ZQCreditorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object ZQCreditorSLAYOUTINVOICE: TStringField
      FieldName = 'SLAYOUTINVOICE'
      Size = 35
    end
    object ZQCreditorSLAYOUTCREDITNOTE: TStringField
      FieldName = 'SLAYOUTCREDITNOTE'
      Size = 35
    end
    object ZQCreditorSLAYOUTQUOTE: TStringField
      FieldName = 'SLAYOUTQUOTE'
      Size = 35
    end
  end
  object ZQBatch: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from bat0t2'
      '')
    UpdateObject = ZUSQLBatch
    BeforeOpen = InitFieldsWithWhereClause
    AfterInsert = ZQBatchAfterInsert
    Left = 240
    Top = 192
    object ZQBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 8
    end
    object ZQBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQBatchFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object ZQBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object ZQBatchSTAX: TStringField
      FieldName = 'STAX'
      Size = 8
    end
    object ZQBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQBatchFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object ZQBatchSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 8
    end
    object ZQBatchFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQBatchDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object ZQBatchBRECONCILED: TIntegerField
      FieldName = 'BRECONCILED'
    end
    object ZQBatchBEXCLUSIVE: TIntegerField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQBatchFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQBatchWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQBatchWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQBatchNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object ZQBatchSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object ZQBatchSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object ZQBatchSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object ZQBatchDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQBatchFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQBatchWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object ZQBatchBLINKED: TIntegerField
      FieldName = 'BLINKED'
    end
    object ZQBatchWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQBatchWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQBatchWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQBatchDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object ZQBatchWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object ZUSQLBatch: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO bat0t2'
      
        '  (bat0t2.WLINEID, bat0t2.SREFERENCE, bat0t2.SACCOUNT, bat0t2.SD' +
        'ESCRIPTION, '
      
        '   bat0t2.FDEBIT, bat0t2.FCREDIT, bat0t2.FAMOUNT, bat0t2.STAX, b' +
        'at0t2.WTAXID, '
      
        '   bat0t2.DDATE, bat0t2.SCONTRAACCOUNT, bat0t2.WCONTRAACCOUNTID,' +
        ' bat0t2.FTAXAMOUNT, '
      
        '   bat0t2.DALLOCATEDDATE, bat0t2.BRECONCILED, bat0t2.BEXCLUSIVE,' +
        ' bat0t2.WACCOUNTID, '
      
        '   bat0t2.FQTY, bat0t2.WPROFILEID, bat0t2.WTAX2ID, bat0t2.NOTUSE' +
        'D, bat0t2.SPROFILE, '
      
        '   bat0t2.SJOBCODE, bat0t2.STAX2, bat0t2.BLINKED, bat0t2.DSYSDAT' +
        'E, bat0t2.FTAX2AMOUNT, '
      
        '   bat0t2.WLINKEDID, bat0t2.WREPORTINGGROUP1ID, bat0t2.WREPORTIN' +
        'GGROUP2ID, '
      '   bat0t2.DPAYMENTDATE, bat0t2.WDOCID)'
      'VALUES'
      
        '  (:WLINEID, :SREFERENCE, :SACCOUNT, :SDESCRIPTION, :FDEBIT, :FC' +
        'REDIT, '
      
        '   :FAMOUNT, :STAX, :WTAXID, :DDATE, :SCONTRAACCOUNT, :WCONTRAAC' +
        'COUNTID, '
      
        '   :FTAXAMOUNT, :DALLOCATEDDATE, :BRECONCILED, :BEXCLUSIVE, :WAC' +
        'COUNTID, '
      
        '   :FQTY, :WPROFILEID, :WTAX2ID, :NOTUSED, :SPROFILE, :SJOBCODE,' +
        ' :STAX2, '
      
        '   :BLINKED, :DSYSDATE, :FTAX2AMOUNT, :WLINKEDID, :WREPORTINGGRO' +
        'UP1ID, '
      '   :WREPORTINGGROUP2ID, :DPAYMENTDATE, :WDOCID)')
    DeleteSQL.Strings = (
      'DELETE FROM bat0t2'
      'WHERE'
      '  bat0t2.WLINEID = :OLD_WLINEID')
    ModifySQL.Strings = (
      'UPDATE bat0t2 SET'
      '  bat0t2.WLINEID = :WLINEID,'
      '  bat0t2.SREFERENCE = :SREFERENCE,'
      '  bat0t2.SACCOUNT = :SACCOUNT,'
      '  bat0t2.SDESCRIPTION = :SDESCRIPTION,'
      '  bat0t2.FDEBIT = :FDEBIT,'
      '  bat0t2.FCREDIT = :FCREDIT,'
      '  bat0t2.FAMOUNT = :FAMOUNT,'
      '  bat0t2.STAX = :STAX,'
      '  bat0t2.WTAXID = :WTAXID,'
      '  bat0t2.DDATE = :DDATE,'
      '  bat0t2.SCONTRAACCOUNT = :SCONTRAACCOUNT,'
      '  bat0t2.WCONTRAACCOUNTID = :WCONTRAACCOUNTID,'
      '  bat0t2.FTAXAMOUNT = :FTAXAMOUNT,'
      '  bat0t2.DALLOCATEDDATE = :DALLOCATEDDATE,'
      '  bat0t2.BRECONCILED = :BRECONCILED,'
      '  bat0t2.BEXCLUSIVE = :BEXCLUSIVE,'
      '  bat0t2.WACCOUNTID = :WACCOUNTID,'
      '  bat0t2.FQTY = :FQTY,'
      '  bat0t2.WPROFILEID = :WPROFILEID,'
      '  bat0t2.WTAX2ID = :WTAX2ID,'
      '  bat0t2.NOTUSED = :NOTUSED,'
      '  bat0t2.SPROFILE = :SPROFILE,'
      '  bat0t2.SJOBCODE = :SJOBCODE,'
      '  bat0t2.STAX2 = :STAX2,'
      '  bat0t2.BLINKED = :BLINKED,'
      '  bat0t2.DSYSDATE = :DSYSDATE,'
      '  bat0t2.FTAX2AMOUNT = :FTAX2AMOUNT,'
      '  bat0t2.WLINKEDID = :WLINKEDID,'
      '  bat0t2.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  bat0t2.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  bat0t2.DPAYMENTDATE = :DPAYMENTDATE,'
      '  bat0t2.WDOCID = :WDOCID'
      'WHERE'
      '  bat0t2.WLINEID = :OLD_WLINEID')
    Left = 240
    Top = 240
  end
  object ZQBatchAggregate: TUniQuery
    DataTypeMap = <>
    BeforeOpen = ZQBatchAggregateBeforeOpen
    Left = 360
    Top = 140
  end
  object ZQTax: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select * from Account,Tax where Account.WAccountID= Tax.Waccount' +
        'Id'
      'and Account.WaccountID =:WAccountID')
    BeforeOpen = InitFieldsFromTax
    Left = 360
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object ZQTaxWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTaxSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQTaxSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQTaxSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQTaxSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQTaxWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQTaxWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQTaxWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQTaxBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQTaxBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQTaxDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTaxWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTaxWACCOUNTID_1: TIntegerField
      FieldName = 'WACCOUNTID_1'
      Required = True
    end
    object ZQTaxSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 30
    end
    object ZQTaxDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object ZQTaxDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object ZQTaxFRATE: TFloatField
      FieldName = 'FRATE'
    end
    object ZQTaxDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
  end
  object ZQContraAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from account Where WAccountid = :WAccountID')
    Left = 360
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object ZQContraAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQContraAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQContraAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQContraAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQContraAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQContraAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQContraAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQContraAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQContraAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQContraAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQContraAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQContraAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
  end
  object ZUSQLBackOrder: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO BACKORD'
      
        '  (WBACKORDERID, WACCOUNTID, WSTOCKID, FQTY, FSELLINGPRICE, BSEL' +
        'ECTED, DSYSDATE, SSOURCE, FDISCOUNT, FPRICE, WUNITID)'
      'VALUES'
      
        '  (:WBACKORDERID, :WACCOUNTID, :WSTOCKID, :FQTY, :FSELLINGPRICE,' +
        ' :BSELECTED, :DSYSDATE, :SSOURCE, :FDISCOUNT, :FPRICE, :WUNITID)')
    DeleteSQL.Strings = (
      'DELETE FROM BACKORD'
      'WHERE'
      '  WBACKORDERID = :Old_WBACKORDERID')
    ModifySQL.Strings = (
      'UPDATE BACKORD'
      'SET'
      
        '  WBACKORDERID = :WBACKORDERID, WACCOUNTID = :WACCOUNTID, WSTOCK' +
        'ID = :WSTOCKID, FQTY = :FQTY, FSELLINGPRICE = :FSELLINGPRICE, BS' +
        'ELECTED = :BSELECTED, DSYSDATE = :DSYSDATE, SSOURCE = :SSOURCE, ' +
        'FDISCOUNT = :FDISCOUNT, FPRICE = :FPRICE, WUNITID = :WUNITID'
      'WHERE'
      '  WBACKORDERID = :Old_WBACKORDERID')
    RefreshSQL.Strings = (
      
        'SELECT WBACKORDERID, WACCOUNTID, WSTOCKID, FQTY, FSELLINGPRICE, ' +
        'BSELECTED, DSYSDATE, SSOURCE, FDISCOUNT, FPRICE, WUNITID FROM BA' +
        'CKORD'
      'WHERE'
      '  WBACKORDERID = :WBACKORDERID')
    Left = 240
    Top = 128
  end
  object ZQBackOrder: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from BackOrd where WAccountID = :WAccountId and'
      'WStockID = :WStockid')
    UpdateObject = ZUSQLBackOrder
    AfterInsert = ZQBackOrderAfterInsert
    Left = 300
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountId'
      end
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQBackOrderWBACKORDERID: TIntegerField
      FieldName = 'WBACKORDERID'
      Required = True
    end
    object ZQBackOrderWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQBackOrderWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQBackOrderFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQBackOrderFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object ZQBackOrderBSELECTED: TSmallintField
      FieldName = 'BSELECTED'
    end
    object ZQBackOrderDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQBackOrderSSOURCE: TStringField
      FieldName = 'SSOURCE'
      Size = 40
    end
    object ZQBackOrderFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object ZQBackOrderFPRICE: TFloatField
      FieldName = 'FPRICE'
    end
    object ZQBackOrderWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
  end
  object ZQDoclineOptions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from DOCLINEOPTIONS where WDocId =:WDocid')
    UpdateObject = ZUSQLDoclineOptions
    BeforeOpen = ZQDoclineOptionsBeforeOpen
    AfterInsert = ZQDoclineOptionsAfterInsert
    Left = 200
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDocid'
      end>
    object ZQDoclineOptionsWDOCLINEOPTIONSID: TIntegerField
      FieldName = 'WDOCLINEOPTIONSID'
      Required = True
    end
    object ZQDoclineOptionsWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQDoclineOptionsWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object ZQDoclineOptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
    end
    object ZQDoclineOptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQDoclineOptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQDoclineOptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQDoclineOptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQDoclineOptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQDoclineOptionsFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQDoclineOptionsWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
  end
  object ZUSQLDoclineOptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOCLINEOPTIONS'
      
        '  (DOCLINEOPTIONS.WDOCLINEOPTIONSID, DOCLINEOPTIONS.WDOCID, DOCL' +
        'INEOPTIONS.WLINEID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE1ID, DOCLINEOPTIONS.WITEMOPTIO' +
        'NVALUE2ID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE3ID, DOCLINEOPTIONS.WITEMOPTIO' +
        'NVALUE4ID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE5ID, DOCLINEOPTIONS.FEXTRAPRIC' +
        'E, DOCLINEOPTIONS.FQTY, '
      '   DOCLINEOPTIONS.WDESCRIPTIONID)'
      'VALUES'
      
        '  (:WDOCLINEOPTIONSID, :WDOCID, :WLINEID, :WITEMOPTIONVALUE1ID, ' +
        ':WITEMOPTIONVALUE2ID, '
      
        '   :WITEMOPTIONVALUE3ID, :WITEMOPTIONVALUE4ID, :WITEMOPTIONVALUE' +
        '5ID, :FEXTRAPRICE, '
      '   :FQTY, :WDESCRIPTIONID)')
    DeleteSQL.Strings = (
      'DELETE FROM DOCLINEOPTIONS'
      'WHERE'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = :OLD_WDOCLINEOPTIONSID')
    ModifySQL.Strings = (
      'UPDATE DOCLINEOPTIONS SET'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = '
      ':WDOCLINEOPTIONSID,'
      '  DOCLINEOPTIONS.WDOCID = :WDOCID,'
      '  DOCLINEOPTIONS.WLINEID = :WLINEID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE1ID = '
      ':WITEMOPTIONVALUE1ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE2ID = '
      ':WITEMOPTIONVALUE2ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE3ID = '
      ':WITEMOPTIONVALUE3ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE4ID = '
      ':WITEMOPTIONVALUE4ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE5ID = '
      ':WITEMOPTIONVALUE5ID,'
      '  DOCLINEOPTIONS.FEXTRAPRICE = :FEXTRAPRICE,'
      '  DOCLINEOPTIONS.FQTY = :FQTY,'
      '  DOCLINEOPTIONS.WDESCRIPTIONID = :WDESCRIPTIONID'
      'WHERE'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = '
      ':OLD_WDOCLINEOPTIONSID')
    Left = 200
    Top = 64
  end
  object ZQStockOptions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select * from STOCKOPTIONS where WstockId =:WStockID and WITEMOP' +
        'TIONVALUE1ID =:WITEMOPTIONVALUE1ID')
    UpdateObject = ZUSQLStockOptions
    BeforeOpen = ZQStockOptionsBeforeOpen
    AfterInsert = ZQStockOptionsAfterInsert
    Left = 60
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockID'
      end
      item
        DataType = ftUnknown
        Name = 'WITEMOPTIONVALUE1ID'
      end>
    object ZQStockOptionsWSTOCKOPTIONSID: TIntegerField
      FieldName = 'WSTOCKOPTIONSID'
      Required = True
    end
    object ZQStockOptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQStockOptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQStockOptionsFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockOptionsSBARCODE: TStringField
      FieldName = 'SBARCODE'
      Size = 25
    end
    object ZQStockOptionsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
    end
    object ZQStockOptionsFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockOptionsFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockOptionsFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockOptionsFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
  end
  object ZUSQLStockOptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCKOPTIONS'
      
        '  (STOCKOPTIONS.WSTOCKOPTIONSID, STOCKOPTIONS.WSTOCKID, STOCKOPT' +
        'IONS.WITEMOPTIONVALUE1ID, '
      
        '   STOCKOPTIONS.WITEMOPTIONVALUE2ID, STOCKOPTIONS.WITEMOPTIONVAL' +
        'UE3ID, '
      
        '   STOCKOPTIONS.WITEMOPTIONVALUE4ID, STOCKOPTIONS.WITEMOPTIONVAL' +
        'UE5ID, '
      
        '   STOCKOPTIONS.FEXTRAPRICE, STOCKOPTIONS.FQTYONHAND, STOCKOPTIO' +
        'NS.SBARCODE, '
      
        '   STOCKOPTIONS.SREFERENCE, STOCKOPTIONS.FUNITCOST, STOCKOPTIONS' +
        '.FUNITAVECOST, '
      '   STOCKOPTIONS.FREORDERQTY, STOCKOPTIONS.FREORDERQTYTRIG)'
      'VALUES'
      
        '  (:WSTOCKOPTIONSID, :WSTOCKID, :WITEMOPTIONVALUE1ID, :WITEMOPTI' +
        'ONVALUE2ID, '
      
        '   :WITEMOPTIONVALUE3ID, :WITEMOPTIONVALUE4ID, :WITEMOPTIONVALUE' +
        '5ID, :FEXTRAPRICE, '
      
        '   :FQTYONHAND, :SBARCODE, :SREFERENCE, :FUNITCOST, :FUNITAVECOS' +
        'T, :FREORDERQTY, '
      '   :FREORDERQTYTRIG)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCKOPTIONS'
      'WHERE'
      '  STOCKOPTIONS.WSTOCKOPTIONSID = :OLD_WSTOCKOPTIONSID')
    ModifySQL.Strings = (
      'UPDATE STOCKOPTIONS SET'
      '  STOCKOPTIONS.WSTOCKOPTIONSID = :WSTOCKOPTIONSID,'
      '  STOCKOPTIONS.WSTOCKID = :WSTOCKID,'
      '  STOCKOPTIONS.WITEMOPTIONVALUE1ID = '
      ':WITEMOPTIONVALUE1ID,'
      '  STOCKOPTIONS.WITEMOPTIONVALUE2ID = '
      ':WITEMOPTIONVALUE2ID,'
      '  STOCKOPTIONS.WITEMOPTIONVALUE3ID = '
      ':WITEMOPTIONVALUE3ID,'
      '  STOCKOPTIONS.WITEMOPTIONVALUE4ID = '
      ':WITEMOPTIONVALUE4ID,'
      '  STOCKOPTIONS.WITEMOPTIONVALUE5ID = '
      ':WITEMOPTIONVALUE5ID,'
      '  STOCKOPTIONS.FEXTRAPRICE = :FEXTRAPRICE,'
      '  STOCKOPTIONS.FQTYONHAND = :FQTYONHAND,'
      '  STOCKOPTIONS.SBARCODE = :SBARCODE,'
      '  STOCKOPTIONS.SREFERENCE = :SREFERENCE,'
      '  STOCKOPTIONS.FUNITCOST = :FUNITCOST,'
      '  STOCKOPTIONS.FUNITAVECOST = :FUNITAVECOST,'
      '  STOCKOPTIONS.FREORDERQTY = :FREORDERQTY,'
      '  STOCKOPTIONS.FREORDERQTYTRIG = :FREORDERQTYTRIG'
      'WHERE'
      '  STOCKOPTIONS.WSTOCKOPTIONSID = :OLD_WSTOCKOPTIONSID')
    Left = 168
    Top = 304
  end
  object ZQDefoptions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select * from STOCKSETOPTIONS where WStockid = :WStockid')
    UpdateObject = ZUSQLDefoptions
    Left = 270
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQDefoptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQDefoptionsWITEMOPTION1ID: TIntegerField
      FieldName = 'WITEMOPTION1ID'
    end
    object ZQDefoptionsWITEMOPTION2ID: TIntegerField
      FieldName = 'WITEMOPTION2ID'
    end
    object ZQDefoptionsWITEMOPTION3ID: TIntegerField
      FieldName = 'WITEMOPTION3ID'
    end
    object ZQDefoptionsWITEMOPTION4ID: TIntegerField
      FieldName = 'WITEMOPTION4ID'
    end
    object ZQDefoptionsWITEMOPTION5ID: TIntegerField
      FieldName = 'WITEMOPTION5ID'
    end
    object ZQDefoptionsWLEVEL: TIntegerField
      FieldName = 'WLEVEL'
    end
    object ZQDefoptionsWLOOKUPTYPE: TIntegerField
      FieldName = 'WLOOKUPTYPE'
    end
  end
  object ZUSQLDefoptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCKSETOPTIONS'
      
        '  (STOCKSETOPTIONS.WSTOCKID, STOCKSETOPTIONS.WITEMOPTION1ID, STO' +
        'CKSETOPTIONS.WITEMOPTION2ID, '
      
        '   STOCKSETOPTIONS.WITEMOPTION3ID, STOCKSETOPTIONS.WITEMOPTION4I' +
        'D, STOCKSETOPTIONS.WITEMOPTION5ID, '
      '   STOCKSETOPTIONS.WLEVEL, STOCKSETOPTIONS.WLOOKUPTYPE)'
      'VALUES'
      
        '  (:WSTOCKID, :WITEMOPTION1ID, :WITEMOPTION2ID, :WITEMOPTION3ID,' +
        ' :WITEMOPTION4ID, '
      '   :WITEMOPTION5ID, :WLEVEL, :WLOOKUPTYPE)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCKSETOPTIONS'
      'WHERE'
      '  STOCKSETOPTIONS.WSTOCKID = :OLD_WSTOCKID')
    ModifySQL.Strings = (
      'UPDATE STOCKSETOPTIONS SET'
      '  STOCKSETOPTIONS.WSTOCKID = :WSTOCKID,'
      '  STOCKSETOPTIONS.WITEMOPTION1ID = :WITEMOPTION1ID,'
      '  STOCKSETOPTIONS.WITEMOPTION2ID = :WITEMOPTION2ID,'
      '  STOCKSETOPTIONS.WITEMOPTION3ID = :WITEMOPTION3ID,'
      '  STOCKSETOPTIONS.WITEMOPTION4ID = :WITEMOPTION4ID,'
      '  STOCKSETOPTIONS.WITEMOPTION5ID = :WITEMOPTION5ID,'
      '  STOCKSETOPTIONS.WLEVEL = :WLEVEL,'
      '  STOCKSETOPTIONS.WLOOKUPTYPE = :WLOOKUPTYPE'
      'WHERE'
      '  STOCKSETOPTIONS.WSTOCKID = :OLD_WSTOCKID')
    Left = 346
    Top = 292
  end
end
