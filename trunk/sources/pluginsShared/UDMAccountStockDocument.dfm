object DMAccountStockDocument: TDMAccountStockDocument
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 682
  Top = 38
  Height = 521
  Width = 696
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
    Left = 44
    Top = 200
  end
  object TCQDESCRIPTION: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from messages where SDescription = :SDescription'
      'and SExtraDescription = :SExtraDescription')
    UpdateObject = USQLDescription
    Left = 44
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'SDescription'
      end
      item
        DataType = ftString
        Name = 'SExtraDescription'
      end>
  end
  object TDebtor: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from debtor')
    UpdateObject = ZUSQLDebtor
    Left = 128
    Top = 224
  end
  object TAccounts: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from account')
    UpdateObject = ZUSQLAccounts
    AfterInsert = TAccountsAfterInsert
    Left = 44
    Top = 268
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 128
    Top = 160
  end
  object ZqReportingGroup: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from groups where WGroupTypeId = 28')
    Left = 128
    Top = 104
  end
  object QAccountsLookups: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from account where 1 = 0')
    Left = 128
    Top = 56
  end
  object TCTax: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from tax')
    Left = 128
    Top = 8
  end
  object TCQDOCHEAD: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from dochead where SDocNo = :DocNo')
    UpdateObject = USQLDocHead
    AfterInsert = TCQDOCHEADAfterInsert
    Left = 228
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'DocNo'
      end>
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
    Left = 224
    Top = 56
  end
  object TCQDOCLINE: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from docline where WDocId = :WDocId')
    UpdateObject = USQLDocLine
    Left = 224
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'WDocId'
      end>
  end
  object USQLDocLine: TUniUpdateSQL
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
      '  docline.WDOCLINEID = :OLD_WDOCLINEID')
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
      '  docline.WDOCLINEID = :OLD_WDOCLINEID')
    Left = 232
    Top = 168
  end
  object QStockItems: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from stock where SStockCode = :StockCode')
    UpdateObject = USQLStock
    AfterInsert = QStockItemsAfterInsert
    Left = 224
    Top = 216
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
    Left = 248
    Top = 276
  end
  object ZQImportLink: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from IMP_LINK where 1 = 0')
    UpdateObject = ZUSQLImportLink
    Left = 360
    Top = 280
    object ZQImportLinkIMP_LINKID: TIntegerField
      FieldName = 'IMP_LINKID'
      Required = True
    end
    object ZQImportLinkIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZQImportLinkIMP_EXTID: TStringField
      FieldName = 'IMP_EXTID'
      Required = True
      Size = 60
    end
    object ZQImportLinkWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQImportLinkWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQImportLinkWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQImportLinkWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object ZQImportLinkWEVENTID: TIntegerField
      FieldName = 'WEVENTID'
    end
  end
  object ZUSQLImportLink: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO IMP_LINK'
      
        '  (IMP_LINK.IMP_LINKID, IMP_LINK.IMP_SOURCEID, IMP_LINK.IMP_EXTI' +
        'D, IMP_LINK.WACCOUNTID, '
      
        '   IMP_LINK.WDOCID, IMP_LINK.WSTOCKID, IMP_LINK.WCONTACTID, IMP_' +
        'LINK.WEVENTID, '
      '   IMP_LINK.WTAXID, IMP_LINK.WGROUPID)'
      'VALUES'
      
        '  (:IMP_LINKID, :IMP_SOURCEID, :IMP_EXTID, :WACCOUNTID, :WDOCID,' +
        ' :WSTOCKID, '
      '   :WCONTACTID, :WEVENTID, :WTAXID, :WGROUPID)')
    DeleteSQL.Strings = (
      'DELETE FROM IMP_LINK'
      'WHERE'
      '  IMP_LINK.IMP_LINKID = :OLD_IMP_LINKID')
    ModifySQL.Strings = (
      'UPDATE IMP_LINK SET'
      '  IMP_LINK.IMP_LINKID = :IMP_LINKID,'
      '  IMP_LINK.IMP_SOURCEID = :IMP_SOURCEID,'
      '  IMP_LINK.IMP_EXTID = :IMP_EXTID,'
      '  IMP_LINK.WACCOUNTID = :WACCOUNTID,'
      '  IMP_LINK.WDOCID = :WDOCID,'
      '  IMP_LINK.WSTOCKID = :WSTOCKID,'
      '  IMP_LINK.WCONTACTID = :WCONTACTID,'
      '  IMP_LINK.WEVENTID = :WEVENTID,'
      '  IMP_LINK.WTAXID = :WTAXID,'
      '  IMP_LINK.WGROUPID = :WGROUPID'
      'WHERE'
      '  IMP_LINK.IMP_LINKID = :OLD_IMP_LINKID')
    Left = 360
    Top = 328
  end
  object ZUSQLAccounts: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO account'
      
        '  (account.WACCOUNTID, account.SACCOUNTCODE, account.SMAINACCOUN' +
        'TCODE, '
      
        '   account.SSUBACCOUNTCODE, account.SDESCRIPTION, account.WACCOU' +
        'NTTYPEID, '
      
        '   account.WREPORTINGGROUP1ID, account.WREPORTINGGROUP2ID, accou' +
        'nt.BSUBACCOUNTS, '
      
        '   account.BINCOMEEXPENSE, account.BOPENITEM, account.BINACTIVE,' +
        ' account.DSYSDATE, '
      
        '   account.WPROFILEID, account.WLINKACCOUNT, account.WTAXACCOUNT' +
        ')'
      'VALUES'
      
        '  (:WACCOUNTID, :SACCOUNTCODE, :SMAINACCOUNTCODE, :SSUBACCOUNTCO' +
        'DE, :SDESCRIPTION, '
      
        '   :WACCOUNTTYPEID, :WREPORTINGGROUP1ID, :WREPORTINGGROUP2ID, :B' +
        'SUBACCOUNTS, '
      
        '   :BINCOMEEXPENSE, :BOPENITEM, :BINACTIVE, :DSYSDATE, :WPROFILE' +
        'ID, :WLINKACCOUNT, '
      '   :WTAXACCOUNT)')
    DeleteSQL.Strings = (
      'DELETE FROM account'
      'WHERE'
      '  account.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE account SET'
      '  account.WACCOUNTID = :WACCOUNTID,'
      '  account.SACCOUNTCODE = :SACCOUNTCODE,'
      '  account.SMAINACCOUNTCODE = :SMAINACCOUNTCODE,'
      '  account.SSUBACCOUNTCODE = :SSUBACCOUNTCODE,'
      '  account.SDESCRIPTION = :SDESCRIPTION,'
      '  account.WACCOUNTTYPEID = :WACCOUNTTYPEID,'
      '  account.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  account.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  account.BSUBACCOUNTS = :BSUBACCOUNTS,'
      '  account.BINCOMEEXPENSE = :BINCOMEEXPENSE,'
      '  account.BOPENITEM = :BOPENITEM,'
      '  account.BINACTIVE = :BINACTIVE,'
      '  account.DSYSDATE = :DSYSDATE,'
      '  account.WPROFILEID = :WPROFILEID,'
      '  account.WLINKACCOUNT = :WLINKACCOUNT,'
      '  account.WTAXACCOUNT = :WTAXACCOUNT'
      'WHERE'
      '  account.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 44
    Top = 316
  end
  object ZUSQLDebtor: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO debtor'
      
        '  (debtor.WACCOUNTID, debtor.WCONTACTID, debtor.SPASSWORD, debto' +
        'r.SPOSTAL1, '
      
        '   debtor.SPOSTAL2, debtor.SPOSTAL3, debtor.WPOSTCOUNTRIES_ID, d' +
        'ebtor.SPOSTALCODE, '
      
        '   debtor.SDELIVERY1, debtor.SDELIVERY2, debtor.SDELIVERY3, debt' +
        'or.WDELCOUNTRIES_ID, '
      
        '   debtor.SDELIVERYCODE, debtor.STELEPHONE1, debtor.STELEPHONE2,' +
        ' debtor.SFAX, '
      
        '   debtor.SEMAIL, debtor.SBANKNAME, debtor.SBRANCHCODE, debtor.S' +
        'BANKACCOUNTNUMBER, '
      
        '   debtor.SBANKACCOUNTNAME, debtor.SCREDITCARDNUMBER, debtor.DEX' +
        'PIRYDATE, '
      
        '   debtor.SCREDITCARDTYPE, debtor.SCREDITCARDHOLDER, debtor.FCRE' +
        'DITLIMIT, '
      
        '   debtor.FCHARGEAMOUNT, debtor.FDISCOUNT, debtor.FINTEREST, deb' +
        'tor.WBANKID, '
      
        '   debtor.WSALESMANID, debtor.BOPENITEM, debtor.BPOSTBBF, debtor' +
        '.BDISABLED, '
      
        '   debtor.SMESSAGE, debtor.WDEFAULTPRICETYPEID, debtor.DLASTACTI' +
        'VITY, debtor.WCURRENCYID, '
      
        '   debtor.WFOREXACCOUNTID, debtor.SREFERENCE, debtor.DSYSDATE, d' +
        'ebtor.WDUEDAYS, '
      
        '   debtor.DREMITTANCE, debtor.WDEFAULTACCOUNT, debtor.WDEFAULTTA' +
        'X, debtor.SCOMPANYREGNO, '
      
        '   debtor.SFREEFIELD1, debtor.SFREEFIELD2, debtor.SFREEFIELD3, d' +
        'ebtor.SLANGUAGE, '
      
        '   debtor.SLAYOUTINVOICE, debtor.SLAYOUTCREDITNOTE, debtor.SLAYO' +
        'UTQUOTE, '
      '   debtor.SWEBSITE)'
      'VALUES'
      
        '  (:WACCOUNTID, :WCONTACTID, :SPASSWORD, :SPOSTAL1, :SPOSTAL2, :' +
        'SPOSTAL3, '
      
        '   :WPOSTCOUNTRIES_ID, :SPOSTALCODE, :SDELIVERY1, :SDELIVERY2, :' +
        'SDELIVERY3, '
      
        '   :WDELCOUNTRIES_ID, :SDELIVERYCODE, :STELEPHONE1, :STELEPHONE2' +
        ', :SFAX, '
      
        '   :SEMAIL, :SBANKNAME, :SBRANCHCODE, :SBANKACCOUNTNUMBER, :SBAN' +
        'KACCOUNTNAME, '
      
        '   :SCREDITCARDNUMBER, :DEXPIRYDATE, :SCREDITCARDTYPE, :SCREDITC' +
        'ARDHOLDER, '
      
        '   :FCREDITLIMIT, :FCHARGEAMOUNT, :FDISCOUNT, :FINTEREST, :WBANK' +
        'ID, :WSALESMANID, '
      
        '   :BOPENITEM, :BPOSTBBF, :BDISABLED, :SMESSAGE, :WDEFAULTPRICET' +
        'YPEID, '
      
        '   :DLASTACTIVITY, :WCURRENCYID, :WFOREXACCOUNTID, :SREFERENCE, ' +
        ':DSYSDATE, '
      
        '   :WDUEDAYS, :DREMITTANCE, :WDEFAULTACCOUNT, :WDEFAULTTAX, :SCO' +
        'MPANYREGNO, '
      
        '   :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3, :SLANGUAGE, :SLAYOU' +
        'TINVOICE, '
      '   :SLAYOUTCREDITNOTE, :SLAYOUTQUOTE, :SWEBSITE)')
    DeleteSQL.Strings = (
      'DELETE FROM debtor'
      'WHERE'
      '  debtor.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE debtor SET'
      '  debtor.WACCOUNTID = :WACCOUNTID,'
      '  debtor.WCONTACTID = :WCONTACTID,'
      '  debtor.SPASSWORD = :SPASSWORD,'
      '  debtor.SPOSTAL1 = :SPOSTAL1,'
      '  debtor.SPOSTAL2 = :SPOSTAL2,'
      '  debtor.SPOSTAL3 = :SPOSTAL3,'
      '  debtor.WPOSTCOUNTRIES_ID = :WPOSTCOUNTRIES_ID,'
      '  debtor.SPOSTALCODE = :SPOSTALCODE,'
      '  debtor.SDELIVERY1 = :SDELIVERY1,'
      '  debtor.SDELIVERY2 = :SDELIVERY2,'
      '  debtor.SDELIVERY3 = :SDELIVERY3,'
      '  debtor.WDELCOUNTRIES_ID = :WDELCOUNTRIES_ID,'
      '  debtor.SDELIVERYCODE = :SDELIVERYCODE,'
      '  debtor.STELEPHONE1 = :STELEPHONE1,'
      '  debtor.STELEPHONE2 = :STELEPHONE2,'
      '  debtor.SFAX = :SFAX,'
      '  debtor.SEMAIL = :SEMAIL,'
      '  debtor.SBANKNAME = :SBANKNAME,'
      '  debtor.SBRANCHCODE = :SBRANCHCODE,'
      '  debtor.SBANKACCOUNTNUMBER = :SBANKACCOUNTNUMBER,'
      '  debtor.SBANKACCOUNTNAME = :SBANKACCOUNTNAME,'
      '  debtor.SCREDITCARDNUMBER = :SCREDITCARDNUMBER,'
      '  debtor.DEXPIRYDATE = :DEXPIRYDATE,'
      '  debtor.SCREDITCARDTYPE = :SCREDITCARDTYPE,'
      '  debtor.SCREDITCARDHOLDER = :SCREDITCARDHOLDER,'
      '  debtor.FCREDITLIMIT = :FCREDITLIMIT,'
      '  debtor.FCHARGEAMOUNT = :FCHARGEAMOUNT,'
      '  debtor.FDISCOUNT = :FDISCOUNT,'
      '  debtor.FINTEREST = :FINTEREST,'
      '  debtor.WBANKID = :WBANKID,'
      '  debtor.WSALESMANID = :WSALESMANID,'
      '  debtor.BOPENITEM = :BOPENITEM,'
      '  debtor.BPOSTBBF = :BPOSTBBF,'
      '  debtor.BDISABLED = :BDISABLED,'
      '  debtor.SMESSAGE = :SMESSAGE,'
      '  debtor.WDEFAULTPRICETYPEID = :WDEFAULTPRICETYPEID,'
      '  debtor.DLASTACTIVITY = :DLASTACTIVITY,'
      '  debtor.WCURRENCYID = :WCURRENCYID,'
      '  debtor.WFOREXACCOUNTID = :WFOREXACCOUNTID,'
      '  debtor.SREFERENCE = :SREFERENCE,'
      '  debtor.DSYSDATE = :DSYSDATE,'
      '  debtor.WDUEDAYS = :WDUEDAYS,'
      '  debtor.DREMITTANCE = :DREMITTANCE,'
      '  debtor.WDEFAULTACCOUNT = :WDEFAULTACCOUNT,'
      '  debtor.WDEFAULTTAX = :WDEFAULTTAX,'
      '  debtor.SCOMPANYREGNO = :SCOMPANYREGNO,'
      '  debtor.SFREEFIELD1 = :SFREEFIELD1,'
      '  debtor.SFREEFIELD2 = :SFREEFIELD2,'
      '  debtor.SFREEFIELD3 = :SFREEFIELD3,'
      '  debtor.SLANGUAGE = :SLANGUAGE,'
      '  debtor.SLAYOUTINVOICE = :SLAYOUTINVOICE,'
      '  debtor.SLAYOUTCREDITNOTE = :SLAYOUTCREDITNOTE,'
      '  debtor.SLAYOUTQUOTE = :SLAYOUTQUOTE,'
      '  debtor.SWEBSITE = :SWEBSITE'
      'WHERE'
      '  debtor.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 128
    Top = 272
  end
  object USQLContacts: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO contacts'
      
        '  (contacts.RECORDID, contacts.RESOURCEID, contacts.FIRSTNAME, c' +
        'ontacts.LASTNAME, '
      
        '   contacts.BIRTHDATE, contacts.ANNIVERSARY, contacts.TITLE, con' +
        'tacts.COMPANY, '
      
        '   contacts.GENDER, contacts.JOB_POSITION, contacts.ADDRESS, con' +
        'tacts.CITY, '
      
        '   contacts.STATE, contacts.ZIP, contacts.COUNTRY, contacts.NOTE' +
        ', contacts.PHONE1, '
      
        '   contacts.PHONE2, contacts.PHONE3, contacts.PHONE4, contacts.P' +
        'HONE5, '
      
        '   contacts.PHONETYPE1, contacts.PHONETYPE2, contacts.PHONETYPE3' +
        ', contacts.PHONETYPE4, '
      
        '   contacts.PHONETYPE5, contacts.CATEGORY, contacts.EMAIL, conta' +
        'cts.CUSTOM1, '
      
        '   contacts.CUSTOM2, contacts.CUSTOM3, contacts.CUSTOM4, contact' +
        's.USERFIELD0, '
      
        '   contacts.USERFIELD1, contacts.USERFIELD2, contacts.USERFIELD3' +
        ', contacts.USERFIELD4, '
      
        '   contacts.USERFIELD5, contacts.USERFIELD6, contacts.USERFIELD7' +
        ', contacts.USERFIELD8, '
      '   contacts.USERFIELD9, contacts.DSYSDATE)'
      'VALUES'
      
        '  (:RECORDID, :RESOURCEID, :FIRSTNAME, :LASTNAME, :BIRTHDATE, :A' +
        'NNIVERSARY, '
      
        '   :TITLE, :COMPANY, :GENDER, :JOB_POSITION, :ADDRESS, :CITY, :S' +
        'TATE, :ZIP, '
      
        '   :COUNTRY, :NOTE, :PHONE1, :PHONE2, :PHONE3, :PHONE4, :PHONE5,' +
        ' :PHONETYPE1, '
      
        '   :PHONETYPE2, :PHONETYPE3, :PHONETYPE4, :PHONETYPE5, :CATEGORY' +
        ', :EMAIL, '
      
        '   :CUSTOM1, :CUSTOM2, :CUSTOM3, :CUSTOM4, :USERFIELD0, :USERFIE' +
        'LD1, :USERFIELD2, '
      
        '   :USERFIELD3, :USERFIELD4, :USERFIELD5, :USERFIELD6, :USERFIEL' +
        'D7, :USERFIELD8, '
      '   :USERFIELD9, :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM contacts'
      'WHERE'
      '  contacts.RECORDID = :OLD_RECORDID')
    ModifySQL.Strings = (
      'UPDATE contacts SET'
      '  contacts.RECORDID = :RECORDID,'
      '  contacts.RESOURCEID = :RESOURCEID,'
      '  contacts.FIRSTNAME = :FIRSTNAME,'
      '  contacts.LASTNAME = :LASTNAME,'
      '  contacts.BIRTHDATE = :BIRTHDATE,'
      '  contacts.ANNIVERSARY = :ANNIVERSARY,'
      '  contacts.TITLE = :TITLE,'
      '  contacts.COMPANY = :COMPANY,'
      '  contacts.GENDER = :GENDER,'
      '  contacts.JOB_POSITION = :JOB_POSITION,'
      '  contacts.ADDRESS = :ADDRESS,'
      '  contacts.CITY = :CITY,'
      '  contacts.STATE = :STATE,'
      '  contacts.ZIP = :ZIP,'
      '  contacts.COUNTRY = :COUNTRY,'
      '  contacts.NOTE = :NOTE,'
      '  contacts.PHONE1 = :PHONE1,'
      '  contacts.PHONE2 = :PHONE2,'
      '  contacts.PHONE3 = :PHONE3,'
      '  contacts.PHONE4 = :PHONE4,'
      '  contacts.PHONE5 = :PHONE5,'
      '  contacts.PHONETYPE1 = :PHONETYPE1,'
      '  contacts.PHONETYPE2 = :PHONETYPE2,'
      '  contacts.PHONETYPE3 = :PHONETYPE3,'
      '  contacts.PHONETYPE4 = :PHONETYPE4,'
      '  contacts.PHONETYPE5 = :PHONETYPE5,'
      '  contacts.CATEGORY = :CATEGORY,'
      '  contacts.EMAIL = :EMAIL,'
      '  contacts.CUSTOM1 = :CUSTOM1,'
      '  contacts.CUSTOM2 = :CUSTOM2,'
      '  contacts.CUSTOM3 = :CUSTOM3,'
      '  contacts.CUSTOM4 = :CUSTOM4,'
      '  contacts.USERFIELD0 = :USERFIELD0,'
      '  contacts.USERFIELD1 = :USERFIELD1,'
      '  contacts.USERFIELD2 = :USERFIELD2,'
      '  contacts.USERFIELD3 = :USERFIELD3,'
      '  contacts.USERFIELD4 = :USERFIELD4,'
      '  contacts.USERFIELD5 = :USERFIELD5,'
      '  contacts.USERFIELD6 = :USERFIELD6,'
      '  contacts.USERFIELD7 = :USERFIELD7,'
      '  contacts.USERFIELD8 = :USERFIELD8,'
      '  contacts.USERFIELD9 = :USERFIELD9,'
      '  contacts.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  contacts.RECORDID = :OLD_RECORDID')
    Left = 464
    Top = 129
  end
  object QContacts: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from contacts where RecordID =:ID')
    UpdateObject = USQLContacts
    AfterInsert = QContactsAfterInsert
    Left = 330
    Top = 137
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end>
  end
  object QadressPerAccount: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select * from AddressPerAccount where AddressPerAccount.Waccount' +
        'Id = :ID')
    UpdateObject = USQLadressPerAccount
    Left = 328
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end>
    object QadressPerAccountWADDRESSPERACCOUNTID: TIntegerField
      FieldName = 'WADDRESSPERACCOUNTID'
      Required = True
    end
    object QadressPerAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object QadressPerAccountWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
      Required = True
    end
    object QadressPerAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object USQLadressPerAccount: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO AddressPerAccount'
      
        '  (AddressPerAccount.WADDRESSPERACCOUNTID, AddressPerAccount.WAC' +
        'COUNTID, '
      '   AddressPerAccount.WCONTACTID, AddressPerAccount.DSYSDATE)'
      'VALUES'
      '  (:WADDRESSPERACCOUNTID, :WACCOUNTID, :WCONTACTID, :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM AddressPerAccount'
      'WHERE'
      
        '  AddressPerAccount.WADDRESSPERACCOUNTID = :OLD_WADDRESSPERACCOU' +
        'NTID')
    ModifySQL.Strings = (
      'UPDATE AddressPerAccount SET'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':WADDRESSPERACCOUNTID,'
      '  AddressPerAccount.WACCOUNTID = :WACCOUNTID,'
      '  AddressPerAccount.WCONTACTID = :WCONTACTID,'
      '  AddressPerAccount.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':OLD_WADDRESSPERACCOUNTID')
    Left = 464
    Top = 73
  end
  object ZQIMP_STOCKACCOUNTS: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from IMP_STOCKACCOUNTS '
      'where  IMP_SOURCEID = :IMP_SOURCEID'
      'and IMP_EXTID = :IMP_EXTID')
    Left = 72
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMP_SOURCEID'
      end
      item
        DataType = ftUnknown
        Name = 'IMP_EXTID'
      end>
    object ZQIMP_STOCKACCOUNTSIMP_STOCKACCOUNTSID: TIntegerField
      FieldName = 'IMP_STOCKACCOUNTSID'
      Required = True
    end
    object ZQIMP_STOCKACCOUNTSIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZQIMP_STOCKACCOUNTSIMP_EXTID: TStringField
      FieldName = 'IMP_EXTID'
      Required = True
      Size = 60
    end
    object ZQIMP_STOCKACCOUNTSWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object ZQIMP_STOCKACCOUNTSWCOSTOFSALESACCOUNTID: TIntegerField
      FieldName = 'WCOSTOFSALESACCOUNTID'
    end
    object ZQIMP_STOCKACCOUNTSWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object ZQIMP_STOCKACCOUNTSWINPUTTAXACCOUNTID: TIntegerField
      FieldName = 'WINPUTTAXACCOUNTID'
    end
    object ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID: TIntegerField
      FieldName = 'WOUTPUTTAXACCOUNTID'
    end
  end
  object ZQImportSource: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from IMP_SOURCE where IMP_SOURCEID  =:IMP_SOURCEID')
    Left = 224
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMP_SOURCEID'
      end>
    object ZQImportSourceIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZQImportSourceIMP_NAME: TStringField
      FieldName = 'IMP_NAME'
      Required = True
      Size = 35
    end
    object ZQImportSourceIMP_OSFINANCIALS_PHP_URL: TStringField
      FieldName = 'IMP_OSFINANCIALS_PHP_URL'
      Size = 250
    end
    object ZQImportSourceIMP_DEBTORURL: TStringField
      FieldName = 'IMP_DEBTORURL'
      Size = 250
    end
    object ZQImportSourceIMP_CREDITORURL: TStringField
      FieldName = 'IMP_CREDITORURL'
      Size = 250
    end
    object ZQImportSourceIMP_STOCKURL: TStringField
      FieldName = 'IMP_STOCKURL'
      Size = 250
    end
    object ZQImportSourceIMP_DOCUMENTURL: TStringField
      FieldName = 'IMP_DOCUMENTURL'
      Size = 250
    end
    object ZQImportSourceIMP_EVENTURL: TStringField
      FieldName = 'IMP_EVENTURL'
      Size = 250
    end
    object ZQImportSourceIMP_CONTACTURL: TStringField
      FieldName = 'IMP_CONTACTURL'
      Size = 250
    end
    object ZQImportSourceIMP_SOURCE_LOGICTYPE: TIntegerField
      FieldName = 'IMP_SOURCE_LOGICTYPE'
    end
    object ZQImportSourceIMP_USERNAME: TStringField
      FieldName = 'IMP_USERNAME'
      Size = 50
    end
    object ZQImportSourceIMP_PASSWORD: TStringField
      FieldName = 'IMP_PASSWORD'
      Size = 50
    end
    object ZQImportSourceIMP_PREFIX: TStringField
      FieldName = 'IMP_PREFIX'
      Size = 10
    end
    object ZQImportSourceIMP_INIFILE: TBlobField
      FieldName = 'IMP_INIFILE'
    end
  end
  object ZQIMP_TOTALS: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from IMP_TOTALS'
      'where  IMP_SOURCEID = :IMP_SOURCEID'
      'and IMP_EXTID = :IMP_EXTID')
    Left = 232
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IMP_SOURCEID'
      end
      item
        DataType = ftUnknown
        Name = 'IMP_EXTID'
      end>
  end
  object TCreditor: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from creditor')
    UpdateObject = ZUSQLCreditor
    Left = 472
    Top = 252
  end
  object ZUSQLCreditor: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO creditor'
      '  (creditor.WACCOUNTID, creditor.SCODE, creditor.WCONTACTID, '
      'creditor.SPASSWORD, '
      '   creditor.SPOSTAL1, creditor.SPOSTAL2, creditor.SPOSTAL3, '
      'creditor.SPOSTALCODE, '
      '   creditor.WPOSTCOUNTRIES_ID, creditor.SDELIVERY1, '
      'creditor.SDELIVERY2, '
      '   creditor.SDELIVERY3, creditor.WDELCOUNTRIES_ID, '
      'creditor.STELEPHONE1, '
      '   creditor.STELEPHONE2, creditor.SFAX, creditor.SEMAIL, '
      'creditor.WBANKNAME, '
      '   creditor.SBRANCHCODE, creditor.SBANKACCOUNTNUMBER, '
      'creditor.SBANKACCOUNTNAME, '
      '   creditor.FCREDITLIMIT, creditor.FCHARGEAMOUNT, '
      'creditor.BOPENITEM, creditor.BPOSTBBF, '
      '   creditor.DLASTACTIVITY, creditor.WCURRENCYID, '
      'creditor.WFOREXACCOUNTID, '
      '   creditor.SMESSAGE, creditor.SREFERENCE, creditor.FDISCOUNT, '
      'creditor.WDEFAULTPRICETYPEID, '
      '   creditor.DSYSDATE, creditor.WDUEDAYS, '
      'creditor.WDEFAULTACCOUNT, creditor.WDEFAULTTAX, '
      '   creditor.SCOMPANYREGNO, creditor.SFREEFIELD1, '
      'creditor.SFREEFIELD2, '
      '   creditor.SFREEFIELD3, creditor.SLANGUAGE, '
      'creditor.SDELIVERYCODE, creditor.SLAYOUTINVOICE, '
      '   creditor.SLAYOUTCREDITNOTE, creditor.SLAYOUTQUOTE, '
      'creditor.SWEBSITE)'
      'VALUES'
      '  (:WACCOUNTID, :SCODE, :WCONTACTID, :SPASSWORD, '
      ':SPOSTAL1, :SPOSTAL2, '
      '   :SPOSTAL3, :SPOSTALCODE, :WPOSTCOUNTRIES_ID, '
      ':SDELIVERY1, :SDELIVERY2, '
      '   :SDELIVERY3, :WDELCOUNTRIES_ID, :STELEPHONE1, '
      ':STELEPHONE2, :SFAX, :SEMAIL, '
      '   :WBANKNAME, :SBRANCHCODE, :SBANKACCOUNTNUMBER, '
      ':SBANKACCOUNTNAME, :FCREDITLIMIT, '
      '   :FCHARGEAMOUNT, :BOPENITEM, :BPOSTBBF, :DLASTACTIVITY, '
      ':WCURRENCYID, '
      '   :WFOREXACCOUNTID, :SMESSAGE, :SREFERENCE, :FDISCOUNT, '
      ':WDEFAULTPRICETYPEID, '
      '   :DSYSDATE, :WDUEDAYS, :WDEFAULTACCOUNT, '
      ':WDEFAULTTAX, :SCOMPANYREGNO, '
      '   :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3, :SLANGUAGE, '
      ':SDELIVERYCODE, '
      '   :SLAYOUTINVOICE, :SLAYOUTCREDITNOTE, :SLAYOUTQUOTE, '
      ':SWEBSITE)')
    DeleteSQL.Strings = (
      'DELETE FROM creditor'
      'WHERE'
      '  creditor.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE creditor SET'
      '  creditor.WACCOUNTID = :WACCOUNTID,'
      '  creditor.SCODE = :SCODE,'
      '  creditor.WCONTACTID = :WCONTACTID,'
      '  creditor.SPASSWORD = :SPASSWORD,'
      '  creditor.SPOSTAL1 = :SPOSTAL1,'
      '  creditor.SPOSTAL2 = :SPOSTAL2,'
      '  creditor.SPOSTAL3 = :SPOSTAL3,'
      '  creditor.SPOSTALCODE = :SPOSTALCODE,'
      '  creditor.WPOSTCOUNTRIES_ID = :WPOSTCOUNTRIES_ID,'
      '  creditor.SDELIVERY1 = :SDELIVERY1,'
      '  creditor.SDELIVERY2 = :SDELIVERY2,'
      '  creditor.SDELIVERY3 = :SDELIVERY3,'
      '  creditor.WDELCOUNTRIES_ID = :WDELCOUNTRIES_ID,'
      '  creditor.STELEPHONE1 = :STELEPHONE1,'
      '  creditor.STELEPHONE2 = :STELEPHONE2,'
      '  creditor.SFAX = :SFAX,'
      '  creditor.SEMAIL = :SEMAIL,'
      '  creditor.WBANKNAME = :WBANKNAME,'
      '  creditor.SBRANCHCODE = :SBRANCHCODE,'
      '  creditor.SBANKACCOUNTNUMBER = :SBANKACCOUNTNUMBER,'
      '  creditor.SBANKACCOUNTNAME = :SBANKACCOUNTNAME,'
      '  creditor.FCREDITLIMIT = :FCREDITLIMIT,'
      '  creditor.FCHARGEAMOUNT = :FCHARGEAMOUNT,'
      '  creditor.BOPENITEM = :BOPENITEM,'
      '  creditor.BPOSTBBF = :BPOSTBBF,'
      '  creditor.DLASTACTIVITY = :DLASTACTIVITY,'
      '  creditor.WCURRENCYID = :WCURRENCYID,'
      '  creditor.WFOREXACCOUNTID = :WFOREXACCOUNTID,'
      '  creditor.SMESSAGE = :SMESSAGE,'
      '  creditor.SREFERENCE = :SREFERENCE,'
      '  creditor.FDISCOUNT = :FDISCOUNT,'
      '  creditor.WDEFAULTPRICETYPEID = :WDEFAULTPRICETYPEID,'
      '  creditor.DSYSDATE = :DSYSDATE,'
      '  creditor.WDUEDAYS = :WDUEDAYS,'
      '  creditor.WDEFAULTACCOUNT = :WDEFAULTACCOUNT,'
      '  creditor.WDEFAULTTAX = :WDEFAULTTAX,'
      '  creditor.SCOMPANYREGNO = :SCOMPANYREGNO,'
      '  creditor.SFREEFIELD1 = :SFREEFIELD1,'
      '  creditor.SFREEFIELD2 = :SFREEFIELD2,'
      '  creditor.SFREEFIELD3 = :SFREEFIELD3,'
      '  creditor.SLANGUAGE = :SLANGUAGE,'
      '  creditor.SDELIVERYCODE = :SDELIVERYCODE,'
      '  creditor.SLAYOUTINVOICE = :SLAYOUTINVOICE,'
      '  creditor.SLAYOUTCREDITNOTE = :SLAYOUTCREDITNOTE,'
      '  creditor.SLAYOUTQUOTE = :SLAYOUTQUOTE,'
      '  creditor.SWEBSITE = :SWEBSITE'
      'WHERE'
      '  creditor.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 472
    Top = 300
  end
  object ZQStockBom: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from bom where wstockid = :wstockid')
    UpdateObject = ZUSQLStockBom
    AfterInsert = ZQStockBomAfterInsert
    Left = 324
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wstockid'
      end>
    object ZQStockBomWBOMID: TIntegerField
      FieldName = 'WBOMID'
      Required = True
    end
    object ZQStockBomWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockBomWLINKEDSTOCKID: TIntegerField
      FieldName = 'WLINKEDSTOCKID'
      Required = True
    end
    object ZQStockBomFQTY: TFloatField
      FieldName = 'FQTY'
      Required = True
    end
    object ZQStockBomFPERCENTAGEOFSALE: TFloatField
      FieldName = 'FPERCENTAGEOFSALE'
    end
  end
  object ZUSQLStockBom: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO bom'
      
        '  (bom.WBOMID, bom.WSTOCKID, bom.WLINKEDSTOCKID, bom.FQTY, bom.F' +
        'PERCENTAGEOFSALE)'
      'VALUES'
      
        '  (:WBOMID, :WSTOCKID, :WLINKEDSTOCKID, :FQTY, :FPERCENTAGEOFSAL' +
        'E)')
    DeleteSQL.Strings = (
      'DELETE FROM bom'
      'WHERE'
      '  bom.WBOMID = :OLD_WBOMID')
    ModifySQL.Strings = (
      'UPDATE bom SET'
      '  bom.WBOMID = :WBOMID,'
      '  bom.WSTOCKID = :WSTOCKID,'
      '  bom.WLINKEDSTOCKID = :WLINKEDSTOCKID,'
      '  bom.FQTY = :FQTY,'
      '  bom.FPERCENTAGEOFSALE = :FPERCENTAGEOFSALE'
      'WHERE'
      '  bom.WBOMID = :OLD_WBOMID')
    Left = 416
    Top = 224
  end
  object ZQLangs: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from groups where WGROUPTYPEID = 1004')
    Left = 360
    Top = 388
    object ZQLangsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQLangsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZQLangsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZQLangsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZQLangsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZQLangsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQLangsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQLangsBDISABLE: TSmallintField
      FieldName = 'BDISABLE'
    end
    object ZQLangsWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQLangsWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
  end
  object ZQStockDesc: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from STOCK_DESCRIPTIONS where WStockid = :WStockId and '
      'WLANGUAGEID = :Wlangid')
    UpdateObject = ZUSQLStockDesc
    Left = 456
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockId'
      end
      item
        DataType = ftUnknown
        Name = 'Wlangid'
      end>
    object ZQStockDescWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockDescWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
    end
    object ZQStockDescSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Required = True
      Size = 60
    end
    object ZQStockDescSEXTRADESCRIPTION: TBlobField
      FieldName = 'SEXTRADESCRIPTION'
    end
  end
  object ZUSQLStockDesc: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCK_DESCRIPTIONS'
      
        '  (STOCK_DESCRIPTIONS.WSTOCKID, STOCK_DESCRIPTIONS.WLANGUAGEID, ' +
        'STOCK_DESCRIPTIONS.SDESCRIPTION, '
      '   STOCK_DESCRIPTIONS.SEXTRADESCRIPTION)'
      'VALUES'
      '  (:WSTOCKID, :WLANGUAGEID, :SDESCRIPTION, :SEXTRADESCRIPTION)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCK_DESCRIPTIONS'
      'WHERE'
      '  STOCK_DESCRIPTIONS.WSTOCKID = :OLD_WSTOCKID AND'
      '  STOCK_DESCRIPTIONS.WLANGUAGEID = :OLD_WLANGUAGEID')
    ModifySQL.Strings = (
      'UPDATE STOCK_DESCRIPTIONS SET'
      '  STOCK_DESCRIPTIONS.WSTOCKID = :WSTOCKID,'
      '  STOCK_DESCRIPTIONS.WLANGUAGEID = :WLANGUAGEID,'
      '  STOCK_DESCRIPTIONS.SDESCRIPTION = :SDESCRIPTION,'
      '  STOCK_DESCRIPTIONS.SEXTRADESCRIPTION = '
      ':SEXTRADESCRIPTION'
      'WHERE'
      '  STOCK_DESCRIPTIONS.WSTOCKID = :OLD_WSTOCKID AND'
      '  STOCK_DESCRIPTIONS.WLANGUAGEID = :OLD_WLANGUAGEID')
    Left = 436
    Top = 416
  end
  object ZQStockGroups: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from stock_multigroup')
    UpdateObject = ZUSQLStockGroups
    Left = 548
    Top = 184
    object ZQStockGroupsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockGroupsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQStockGroupsIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
  end
  object ZUSQLStockGroups: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stock_multigroup'
      '  (stock_multigroup.WSTOCKID, stock_multigroup.WGROUPID, '
      'stock_multigroup.IMP_SOURCEID)'
      'VALUES'
      '  (:WSTOCKID, :WGROUPID, :IMP_SOURCEID)')
    DeleteSQL.Strings = (
      'DELETE FROM stock_multigroup'
      'WHERE'
      '  stock_multigroup.WSTOCKID = :OLD_WSTOCKID AND'
      '  stock_multigroup.WGROUPID = :OLD_WGROUPID AND'
      '  stock_multigroup.IMP_SOURCEID = :OLD_IMP_SOURCEID')
    ModifySQL.Strings = (
      'UPDATE stock_multigroup SET'
      '  stock_multigroup.WSTOCKID = :WSTOCKID,'
      '  stock_multigroup.WGROUPID = :WGROUPID,'
      '  stock_multigroup.IMP_SOURCEID = :IMP_SOURCEID'
      'WHERE'
      '  stock_multigroup.WSTOCKID = :OLD_WSTOCKID AND'
      '  stock_multigroup.WGROUPID = :OLD_WGROUPID AND'
      '  stock_multigroup.IMP_SOURCEID = :OLD_IMP_SOURCEID')
    Left = 552
    Top = 240
  end
  object ZQAgenda: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from events where recordid=:id')
    UpdateObject = ZUSQLAgenda
    AfterInsert = ZQAgendaAfterInsert
    Left = 528
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end>
  end
  object ZQResource: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from resources')
    UpdateObject = ZUSQLResource
    AfterInsert = ZQResourceAfterInsert
    Left = 616
    Top = 344
  end
  object ZUSQLAgenda: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO events'
      
        '  (events.RECORDID, events.STARTTIME, events.ENDTIME, events.RES' +
        'OURCEID, '
      
        '   events.WCONTACTID, events.DESCRIPTION, events.NOTES, events.C' +
        'ATEGORY, '
      
        '   events.ALLDAYEVENT, events.DINGPATH, events.ALARMSET, events.' +
        'ALARMADVANCE, '
      
        '   events.ALARMADVANCETYPE, events.SNOOZETIME, events.REPEATCODE' +
        ', events.REPEATRANGEEND, '
      
        '   events.CUSTOMINTERVAL, events.USERFIELD0, events.USERFIELD1, ' +
        'events.USERFIELD2, '
      
        '   events.USERFIELD3, events.USERFIELD4, events.USERFIELD5, even' +
        'ts.USERFIELD6, '
      
        '   events.USERFIELD7, events.USERFIELD8, events.USERFIELD9, even' +
        'ts.WACCOUNTID)'
      'VALUES'
      
        '  (:RECORDID, :STARTTIME, :ENDTIME, :RESOURCEID, :WCONTACTID, :D' +
        'ESCRIPTION, '
      
        '   :NOTES, :CATEGORY, :ALLDAYEVENT, :DINGPATH, :ALARMSET, :ALARM' +
        'ADVANCE, '
      
        '   :ALARMADVANCETYPE, :SNOOZETIME, :REPEATCODE, :REPEATRANGEEND,' +
        ' :CUSTOMINTERVAL, '
      
        '   :USERFIELD0, :USERFIELD1, :USERFIELD2, :USERFIELD3, :USERFIEL' +
        'D4, :USERFIELD5, '
      
        '   :USERFIELD6, :USERFIELD7, :USERFIELD8, :USERFIELD9, :WACCOUNT' +
        'ID)')
    DeleteSQL.Strings = (
      'DELETE FROM events'
      'WHERE'
      '  events.RECORDID = :OLD_RECORDID')
    ModifySQL.Strings = (
      'UPDATE events SET'
      '  events.RECORDID = :RECORDID,'
      '  events.STARTTIME = :STARTTIME,'
      '  events.ENDTIME = :ENDTIME,'
      '  events.RESOURCEID = :RESOURCEID,'
      '  events.WCONTACTID = :WCONTACTID,'
      '  events.DESCRIPTION = :DESCRIPTION,'
      '  events.NOTES = :NOTES,'
      '  events.CATEGORY = :CATEGORY,'
      '  events.ALLDAYEVENT = :ALLDAYEVENT,'
      '  events.DINGPATH = :DINGPATH,'
      '  events.ALARMSET = :ALARMSET,'
      '  events.ALARMADVANCE = :ALARMADVANCE,'
      '  events.ALARMADVANCETYPE = :ALARMADVANCETYPE,'
      '  events.SNOOZETIME = :SNOOZETIME,'
      '  events.REPEATCODE = :REPEATCODE,'
      '  events.REPEATRANGEEND = :REPEATRANGEEND,'
      '  events.CUSTOMINTERVAL = :CUSTOMINTERVAL,'
      '  events.USERFIELD0 = :USERFIELD0,'
      '  events.USERFIELD1 = :USERFIELD1,'
      '  events.USERFIELD2 = :USERFIELD2,'
      '  events.USERFIELD3 = :USERFIELD3,'
      '  events.USERFIELD4 = :USERFIELD4,'
      '  events.USERFIELD5 = :USERFIELD5,'
      '  events.USERFIELD6 = :USERFIELD6,'
      '  events.USERFIELD7 = :USERFIELD7,'
      '  events.USERFIELD8 = :USERFIELD8,'
      '  events.USERFIELD9 = :USERFIELD9,'
      '  events.WACCOUNTID = :WACCOUNTID'
      'WHERE'
      '  events.RECORDID = :OLD_RECORDID')
    Left = 540
    Top = 420
  end
  object ZUSQLResource: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO resources'
      
        '  (resources.RESOURCEID, resources.DESCRIPTION, resources.NOTES,' +
        ' resources.IMAGEINDEX, '
      
        '   resources.RESOURCEACTIVE, resources.USERFIELD0, resources.USE' +
        'RFIELD1, '
      
        '   resources.USERFIELD2, resources.USERFIELD3, resources.USERFIE' +
        'LD4, resources.USERFIELD5, '
      
        '   resources.USERFIELD6, resources.USERFIELD7, resources.USERFIE' +
        'LD8, resources.USERFIELD9)'
      'VALUES'
      
        '  (:RESOURCEID, :DESCRIPTION, :NOTES, :IMAGEINDEX, :RESOURCEACTI' +
        'VE, :USERFIELD0, '
      
        '   :USERFIELD1, :USERFIELD2, :USERFIELD3, :USERFIELD4, :USERFIEL' +
        'D5, :USERFIELD6, '
      '   :USERFIELD7, :USERFIELD8, :USERFIELD9)')
    DeleteSQL.Strings = (
      'DELETE FROM resources'
      'WHERE'
      '  resources.RESOURCEID = :OLD_RESOURCEID')
    ModifySQL.Strings = (
      'UPDATE resources SET'
      '  resources.RESOURCEID = :RESOURCEID,'
      '  resources.DESCRIPTION = :DESCRIPTION,'
      '  resources.NOTES = :NOTES,'
      '  resources.IMAGEINDEX = :IMAGEINDEX,'
      '  resources.RESOURCEACTIVE = :RESOURCEACTIVE,'
      '  resources.USERFIELD0 = :USERFIELD0,'
      '  resources.USERFIELD1 = :USERFIELD1,'
      '  resources.USERFIELD2 = :USERFIELD2,'
      '  resources.USERFIELD3 = :USERFIELD3,'
      '  resources.USERFIELD4 = :USERFIELD4,'
      '  resources.USERFIELD5 = :USERFIELD5,'
      '  resources.USERFIELD6 = :USERFIELD6,'
      '  resources.USERFIELD7 = :USERFIELD7,'
      '  resources.USERFIELD8 = :USERFIELD8,'
      '  resources.USERFIELD9 = :USERFIELD9'
      'WHERE'
      '  resources.RESOURCEID = :OLD_RESOURCEID')
    Left = 624
    Top = 412
  end
end
