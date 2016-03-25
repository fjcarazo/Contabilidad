object DMOSCommerceImport: TDMOSCommerceImport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 363
  Top = 137
  Height = 452
  Width = 639
  object QAccountsLookups: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from account where 1 = 0')
    Left = 128
    Top = 56
  end
  object TCTotals: TUniTable
    TableName = 'Totals'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 40
    Top = 80
    object TCTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object TCTotalsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object TCTotalsBACTUAL: TSmallintField
      FieldName = 'BACTUAL'
      Required = True
    end
    object TCTotalsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object TCTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object TCTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object TAccounts: TUniTable
    TableName = 'Account'
    DataTypeMap = <>
    Left = 40
    Top = 128
  end
  object TDebtor: TUniTable
    TableName = 'Debtor'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 40
    Top = 176
  end
  object TCQDOCLINE: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from docline where WDocId = :WDocId')
    CachedUpdates = True
    UpdateObject = USQLDocLine
    Left = 224
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'WDocId'
      end>
    object TCQDOCLINEWDocLineID: TIntegerField
      FieldName = 'WDocLineID'
    end
    object TCQDOCLINEWDocID: TIntegerField
      FieldName = 'WDocID'
    end
    object TCQDOCLINEWStockID: TIntegerField
      FieldName = 'WStockID'
    end
    object TCQDOCLINEWLineTypeID: TIntegerField
      FieldName = 'WLineTypeID'
    end
    object TCQDOCLINEWDescriptionID: TIntegerField
      FieldName = 'WDescriptionID'
    end
    object TCQDOCLINEFQtyOrdered: TFloatField
      FieldName = 'FQtyOrdered'
    end
    object TCQDOCLINEFQtyShipped: TFloatField
      FieldName = 'FQtyShipped'
    end
    object TCQDOCLINEFSellingPrice: TFloatField
      FieldName = 'FSellingPrice'
    end
    object TCQDOCLINEFItemDiscount: TFloatField
      FieldName = 'FItemDiscount'
    end
    object TCQDOCLINEWTaxID: TIntegerField
      FieldName = 'WTaxID'
    end
    object TCQDOCLINEFExclusiveAmt: TFloatField
      FieldName = 'FExclusiveAmt'
    end
    object TCQDOCLINEFInclusiveAmt: TFloatField
      FieldName = 'FInclusiveAmt'
    end
    object TCQDOCLINEFTaxAmount: TFloatField
      FieldName = 'FTaxAmount'
    end
    object TCQDOCLINEDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object TCQDOCLINESUnit: TStringField
      FieldName = 'SUnit'
      Size = 8
    end
    object TCQDOCLINESSTockCode: TStringField
      FieldName = 'SSTockCode'
      Size = 15
    end
    object TCQDOCLINEWProfileID: TIntegerField
      FieldName = 'WProfileID'
    end
    object TCQDOCLINEWSerialNoID: TIntegerField
      FieldName = 'WSerialNoID'
    end
  end
  object TCQDOCHEAD: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from dochead where SDocNo = :DocNo')
    CachedUpdates = True
    UpdateObject = USQLDocHead
    Left = 224
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'DocNo'
      end>
  end
  object QAccountCodeLength: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select smainaccountcode from account where 1=0')
    Left = 128
    Top = 336
  end
  object TCTax: TUniTable
    TableName = 'Tax'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 128
    Top = 8
    object TCTaxWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object TCTaxSDescription: TStringField
      FieldName = 'SDescription'
      Size = 30
    end
    object TCTaxDStartDate: TDateField
      FieldName = 'DStartDate'
    end
    object TCTaxDEndDate: TDateField
      FieldName = 'DEndDate'
    end
    object TCTaxFRate: TFloatField
      FieldName = 'FRate'
    end
    object TCTaxDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.CharSet = 'ISO-8859-1'
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; OsfOsc bridge)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    OnAuthorization = IdHTTP1Authorization
    Left = 216
    Top = 216
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 128
    Top = 200
  end
  object QStockItems: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from stock where SStockCode = :StockCode')
    CachedUpdates = True
    UpdateObject = USQLStock
    BeforeOpen = QStockItemsBeforeOpen
    AfterInsert = QStockItemsAfterInsert
    AfterPost = AllQuerysAfterPost
    Left = 224
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'StockCode'
      end>
  end
  object USQLStock: TUniUpdateSQL
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
        '.SEXTERNALID)'
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
      '   :SEXTRADESC, :SEXTERNALID)')
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
      '  stock.SEXTERNALID = :SEXTERNALID'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    Left = 224
    Top = 312
  end
  object USQLDocHead: TUniUpdateSQL
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
      '   dochead.WUSERID)'
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
      '   :DDUEDATE, :WUSERID)')
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
      '  dochead.WUSERID = :WUSERID'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    Left = 232
    Top = 64
  end
  object USQLDocLine: TUniUpdateSQL
    InsertSQL.Strings = (
      'insert into docline'
      
        '  (WDocLineID, WDocID, WStockID, WLineTypeID, WDescriptionID, FQ' +
        'tyOrdered, '
      
        '   FQtyShipped, FSellingPrice, FItemDiscount, WTaxID, FExclusive' +
        'Amt, FInclusiveAmt, '
      
        '   FTaxAmount, DSysDate, SUnit, SSTockCode, WProfileID, WSerialN' +
        'oID)'
      'values'
      
        '  (:WDocLineID, :WDocID, :WStockID, :WLineTypeID, :WDescriptionI' +
        'D, :FQtyOrdered, '
      
        '   :FQtyShipped, :FSellingPrice, :FItemDiscount, :WTaxID, :FExcl' +
        'usiveAmt, '
      
        '   :FInclusiveAmt, :FTaxAmount, :DSysDate, :SUnit, :SSTockCode, ' +
        ':WProfileID, '
      '   :WSerialNoID)')
    DeleteSQL.Strings = (
      'delete from docline'
      'where'
      '  WDocLineID = :OLD_WDocLineID')
    ModifySQL.Strings = (
      'update docline'
      'set'
      '  WDocLineID = :WDocLineID,'
      '  WDocID = :WDocID,'
      '  WStockID = :WStockID,'
      '  WLineTypeID = :WLineTypeID,'
      '  WDescriptionID = :WDescriptionID,'
      '  FQtyOrdered = :FQtyOrdered,'
      '  FQtyShipped = :FQtyShipped,'
      '  FSellingPrice = :FSellingPrice,'
      '  FItemDiscount = :FItemDiscount,'
      '  WTaxID = :WTaxID,'
      '  FExclusiveAmt = :FExclusiveAmt,'
      '  FInclusiveAmt = :FInclusiveAmt,'
      '  FTaxAmount = :FTaxAmount,'
      '  DSysDate = :DSysDate,'
      '  SUnit = :SUnit,'
      '  SSTockCode = :SSTockCode,'
      '  WProfileID = :WProfileID,'
      '  WSerialNoID = :WSerialNoID'
      'where'
      '  WDocLineID = :OLD_WDocLineID')
    Left = 224
    Top = 168
  end
  object ZqReportingGroup: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from groups where WGroupTypeId = 28')
    UpdateObject = ZUSQLReportingGroup
    Left = 128
    Top = 104
    object ZqReportingGroupWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZqReportingGroupWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZqReportingGroupSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZqReportingGroupWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZqReportingGroupWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZqReportingGroupDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZqReportingGroupWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object ZUSQLReportingGroup: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO groups'
      
        '  (groups.WGROUPID, groups.WGROUPTYPEID, groups.SDESCRIPTION, gr' +
        'oups.WPARENTGROUP2ID, '
      '   groups.WPARENTGROUP1ID, groups.DSYSDATE, groups.WSORTNO)'
      'VALUES'
      
        '  (:WGROUPID, :WGROUPTYPEID, :SDESCRIPTION, :WPARENTGROUP2ID, :W' +
        'PARENTGROUP1ID, '
      '   :DSYSDATE, :WSORTNO)')
    DeleteSQL.Strings = (
      'DELETE FROM groups'
      'WHERE'
      '  groups.WGROUPID = :OLD_WGROUPID')
    ModifySQL.Strings = (
      'UPDATE groups SET'
      '  groups.WGROUPID = :WGROUPID,'
      '  groups.WGROUPTYPEID = :WGROUPTYPEID,'
      '  groups.SDESCRIPTION = :SDESCRIPTION,'
      '  groups.WPARENTGROUP2ID = :WPARENTGROUP2ID,'
      '  groups.WPARENTGROUP1ID = :WPARENTGROUP1ID,'
      '  groups.DSYSDATE = :DSYSDATE,'
      '  groups.WSORTNO = :WSORTNO'
      'WHERE'
      '  groups.WGROUPID = :OLD_WGROUPID')
    Left = 128
    Top = 152
  end
  object ZCountries: TUniTable
    TableName = 'COUNTRIES'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 120
    Top = 256
    object ZCountriesCOUNTRIES_ID: TIntegerField
      FieldName = 'COUNTRIES_ID'
      Required = True
    end
    object ZCountriesCOUNTRIES_NAME: TStringField
      FieldName = 'COUNTRIES_NAME'
      Required = True
      Size = 64
    end
    object ZCountriesCOUNTRIES_ISO_CODE_2: TStringField
      FieldName = 'COUNTRIES_ISO_CODE_2'
      Required = True
      Size = 2
    end
    object ZCountriesCOUNTRIES_ISO_CODE_3: TStringField
      FieldName = 'COUNTRIES_ISO_CODE_3'
      Required = True
      Size = 3
    end
    object ZCountriesADDRESS_FORMAT_ID: TIntegerField
      FieldName = 'ADDRESS_FORMAT_ID'
      Required = True
    end
  end
  object TCQDESCRIPTION: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from messages where SDescription = :SDescription'
      'and SExtraDescription = :SExtraDescription')
    CachedUpdates = True
    UpdateObject = USQLDescription
    AfterPost = AllQuerysAfterPost
    Left = 40
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'SDescription'
      end
      item
        DataType = ftString
        Name = 'SExtraDescription'
      end>
    object TCQDESCRIPTIONWMessageID: TIntegerField
      FieldName = 'WMessageID'
    end
    object TCQDESCRIPTIONSDescription: TStringField
      FieldName = 'SDescription'
      Size = 35
    end
    object TCQDESCRIPTIONSExtraDescription: TStringField
      FieldName = 'SExtraDescription'
      Size = 255
    end
  end
  object USQLDescription: TUniUpdateSQL
    InsertSQL.Strings = (
      'insert into messages'
      '  (WMessageID, SDescription, SExtraDescription)'
      'values'
      '  (:WMessageID, :SDescription, :SExtraDescription)')
    DeleteSQL.Strings = (
      'delete from messages'
      'where'
      '  WMessageID = :OLD_WMessageID')
    ModifySQL.Strings = (
      'update messages'
      'set'
      '  WMessageID = :WMessageID,'
      '  SDescription = :SDescription,'
      '  SExtraDescription = :SExtraDescription'
      'where'
      '  WMessageID = :OLD_WMessageID')
    Left = 40
    Top = 272
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 360
    Top = 64
  end
end
