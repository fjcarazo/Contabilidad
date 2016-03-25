object DMCoreData: TDMCoreData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 200
  Top = 257
  Height = 388
  Width = 581
  object ZQAccount: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from account where WAccountId =:WAccountID')
    UpdateObject = ZUSQLAccount
    BeforeOpen = InitOnAccountid
    Left = 104
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
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
    object ZQAccountWTAXACCOUNT: TIntegerField
      FieldName = 'WTAXACCOUNT'
    end
  end
  object ZQTotals: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from totals where WaccountId =:WAccountId')
    UpdateObject = ZUSQLTotals
    BeforeOpen = InitOnAccountid
    BeforePost = ZQTotalsBeforePost
    Left = 184
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountId'
      end>
    object ZQTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTotalsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQTotalsBACTUAL: TSmallintField
      FieldName = 'BACTUAL'
      Required = True
    end
    object ZQTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object ZQTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTotalsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
  end
  object ZQTransaction: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from transact where WTRANSACTIONID = -1')
    UpdateObject = ZUSQLTransact
    BeforeOpen = InitOnTransId
    AfterInsert = ZQTransactionAfterInsert
    BeforePost = ZQTransactionBeforePost
    Left = 96
    Top = 176
    object ZQTransactionWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQTransactionWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQTransactionWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQTransactionWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQTransactionBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object ZQTransactionBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object ZQTransactionBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object ZQTransactionBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object ZQTransactionWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTransactionDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQTransactionWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQTransactionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQTransactionFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object ZQTransactionWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQTransactionFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQTransactionFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQTransactionFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object ZQTransactionBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object ZQTransactionWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object ZQTransactionWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQTransactionWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQTransactionFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object ZQTransactionWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQTransactionUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object ZQTransactionDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTransactionBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object ZQTransactionWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQTransactionFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object ZQTransactionFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object ZQTransactionFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQTransactionWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQTransactionWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTransactionBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQTransactionWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQTransactionWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQTransactionWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQTransactionWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQTransactionWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQTransactionDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object ZQTransactionWREMITTANCECOUNT: TIntegerField
      FieldName = 'WREMITTANCECOUNT'
    end
  end
  object ZUSQLTransact: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO transact'
      
        '  (transact.WTRANSACTIONID, transact.WBATCHID, transact.WBATCHTY' +
        'PEID, transact.WLINEID, '
      
        '   transact.BCARRIEDFORWARD, transact.BLASTYEAR, transact.BLINKS' +
        'USED, transact.BMULTIPLEITEMS, '
      
        '   transact.WACCOUNTID, transact.DDATE, transact.WPERIODID, tran' +
        'sact.WYEARID, '
      
        '   transact.SREFERENCE, transact.FTAXRATE, transact.WTAXACCOUNTI' +
        'D, transact.FAMOUNT, '
      
        '   transact.FTAXAMOUNT, transact.FOUTSTANDINGAMOUNT, transact.BR' +
        'ECONCILED, '
      
        '   transact.WBALANCINGACCOUNTID, transact.WDESCRIPTIONID, transa' +
        'ct.WCURRENCYID, '
      
        '   transact.FFOREXAMOUNT, transact.WUSERID, transact.UNUSED, tra' +
        'nsact.DSYSDATE, '
      
        '   transact.BUNUSED, transact.WTAX2ID, transact.FCURRENCYRATE2, ' +
        'transact.FTAXRATE2, '
      
        '   transact.FTAX2AMOUNT, transact.WJOBCODEID, transact.WPROFILEI' +
        'D, transact.BEXCLUSIVE, '
      
        '   transact.WLINKEDID, transact.WREPORTINGGROUP1ID, transact.WRE' +
        'PORTINGGROUP2ID, '
      
        '   transact.WDOCID, transact.DPAYMENTDATE, transact.WREMITTANCEC' +
        'OUNT)'
      'VALUES'
      
        '  (:WTRANSACTIONID, :WBATCHID, :WBATCHTYPEID, :WLINEID, :BCARRIE' +
        'DFORWARD, '
      
        '   :BLASTYEAR, :BLINKSUSED, :BMULTIPLEITEMS, :WACCOUNTID, :DDATE' +
        ', :WPERIODID, '
      
        '   :WYEARID, :SREFERENCE, :FTAXRATE, :WTAXACCOUNTID, :FAMOUNT, :' +
        'FTAXAMOUNT, '
      
        '   :FOUTSTANDINGAMOUNT, :BRECONCILED, :WBALANCINGACCOUNTID, :WDE' +
        'SCRIPTIONID, '
      
        '   :WCURRENCYID, :FFOREXAMOUNT, :WUSERID, :UNUSED, :DSYSDATE, :B' +
        'UNUSED, '
      
        '   :WTAX2ID, :FCURRENCYRATE2, :FTAXRATE2, :FTAX2AMOUNT, :WJOBCOD' +
        'EID, :WPROFILEID, '
      
        '   :BEXCLUSIVE, :WLINKEDID, :WREPORTINGGROUP1ID, :WREPORTINGGROU' +
        'P2ID, :WDOCID, '
      '   :DPAYMENTDATE, :WREMITTANCECOUNT)')
    DeleteSQL.Strings = (
      'DELETE FROM transact'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE transact SET'
      '  transact.WTRANSACTIONID = :WTRANSACTIONID,'
      '  transact.WBATCHID = :WBATCHID,'
      '  transact.WBATCHTYPEID = :WBATCHTYPEID,'
      '  transact.WLINEID = :WLINEID,'
      '  transact.BCARRIEDFORWARD = :BCARRIEDFORWARD,'
      '  transact.BLASTYEAR = :BLASTYEAR,'
      '  transact.BLINKSUSED = :BLINKSUSED,'
      '  transact.BMULTIPLEITEMS = :BMULTIPLEITEMS,'
      '  transact.WACCOUNTID = :WACCOUNTID,'
      '  transact.DDATE = :DDATE,'
      '  transact.WPERIODID = :WPERIODID,'
      '  transact.WYEARID = :WYEARID,'
      '  transact.SREFERENCE = :SREFERENCE,'
      '  transact.FTAXRATE = :FTAXRATE,'
      '  transact.WTAXACCOUNTID = :WTAXACCOUNTID,'
      '  transact.FAMOUNT = :FAMOUNT,'
      '  transact.FTAXAMOUNT = :FTAXAMOUNT,'
      '  transact.FOUTSTANDINGAMOUNT = :FOUTSTANDINGAMOUNT,'
      '  transact.BRECONCILED = :BRECONCILED,'
      '  transact.WBALANCINGACCOUNTID = :WBALANCINGACCOUNTID,'
      '  transact.WDESCRIPTIONID = :WDESCRIPTIONID,'
      '  transact.WCURRENCYID = :WCURRENCYID,'
      '  transact.FFOREXAMOUNT = :FFOREXAMOUNT,'
      '  transact.WUSERID = :WUSERID,'
      '  transact.UNUSED = :UNUSED,'
      '  transact.DSYSDATE = :DSYSDATE,'
      '  transact.BUNUSED = :BUNUSED,'
      '  transact.WTAX2ID = :WTAX2ID,'
      '  transact.FCURRENCYRATE2 = :FCURRENCYRATE2,'
      '  transact.FTAXRATE2 = :FTAXRATE2,'
      '  transact.FTAX2AMOUNT = :FTAX2AMOUNT,'
      '  transact.WJOBCODEID = :WJOBCODEID,'
      '  transact.WPROFILEID = :WPROFILEID,'
      '  transact.BEXCLUSIVE = :BEXCLUSIVE,'
      '  transact.WLINKEDID = :WLINKEDID,'
      '  transact.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  transact.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  transact.WDOCID = :WDOCID,'
      '  transact.DPAYMENTDATE = :DPAYMENTDATE,'
      '  transact.WREMITTANCECOUNT = :WREMITTANCECOUNT'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    Left = 96
    Top = 224
  end
  object ZUSQLTotals: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO totals'
      
        '  (totals.WACCOUNTID, totals.WPERIODID, totals.WYEARID, totals.B' +
        'ACTUAL, '
      '   totals.FAMOUNT, totals.DSYSDATE)'
      'VALUES'
      
        '  (:WACCOUNTID, :WPERIODID, :WYEARID, :BACTUAL, :FAMOUNT, :DSYSD' +
        'ATE)')
    DeleteSQL.Strings = (
      'DELETE FROM totals'
      'WHERE'
      '  totals.WACCOUNTID = :OLD_WACCOUNTID AND'
      '  totals.WPERIODID = :OLD_WPERIODID AND'
      '  totals.WYEARID = :OLD_WYEARID AND'
      '  totals.BACTUAL = :OLD_BACTUAL')
    ModifySQL.Strings = (
      'UPDATE totals SET'
      '  totals.WACCOUNTID = :WACCOUNTID,'
      '  totals.WPERIODID = :WPERIODID,'
      '  totals.WYEARID = :WYEARID,'
      '  totals.BACTUAL = :BACTUAL,'
      '  totals.FAMOUNT = :FAMOUNT,'
      '  totals.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  totals.WACCOUNTID = :OLD_WACCOUNTID AND'
      '  totals.WPERIODID = :OLD_WPERIODID AND'
      '  totals.WYEARID = :OLD_WYEARID AND'
      '  totals.BACTUAL = :OLD_BACTUAL')
    Left = 176
    Top = 224
  end
  object ZUSQLAccount: TUniUpdateSQL
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
      '   account.WPROFILEID, account.WLINKACCOUNT)'
      'VALUES'
      
        '  (:WACCOUNTID, :SACCOUNTCODE, :SMAINACCOUNTCODE, :SSUBACCOUNTCO' +
        'DE, :SDESCRIPTION, '
      
        '   :WACCOUNTTYPEID, :WREPORTINGGROUP1ID, :WREPORTINGGROUP2ID, :B' +
        'SUBACCOUNTS, '
      
        '   :BINCOMEEXPENSE, :BOPENITEM, :BINACTIVE, :DSYSDATE, :WPROFILE' +
        'ID, :WLINKACCOUNT)')
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
      '  account.WLINKACCOUNT = :WLINKACCOUNT'
      'WHERE'
      '  account.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 96
    Top = 104
  end
  object ZQDebtor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from debtor where WAccountid =:WAccountid')
    BeforeOpen = InitOnAccountid
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
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
    object ZQDebtorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
    end
    object ZQDebtorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object ZQDebtorDREMITTANCE: TDateTimeField
      FieldName = 'DREMITTANCE'
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
  end
  object ZQCreditor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from creditor where WAccountid =:WAccountid')
    BeforeOpen = InitOnAccountid
    Left = 168
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
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
  end
  object ZQMainAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from account where waccountid = :Waccountid')
    BeforeOpen = InitOnAccountid
    Left = 32
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Waccountid'
      end>
    object ZQMainAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQMainAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQMainAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQMainAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQMainAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQMainAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQMainAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQMainAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQMainAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQMainAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQMainAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQMainAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQMainAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQMainAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQMainAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object ZQTaxAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select * from Account,tax where Account.waccountId = tax.WAccoun' +
        'tId and SAccountCode =:SAccountCode and WAccountTypeId =4')
    BeforeOpen = InitOnTaxtid
    Left = 32
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SAccountCode'
      end>
    object ZQTaxAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTaxAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQTaxAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQTaxAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQTaxAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQTaxAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQTaxAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQTaxAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQTaxAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQTaxAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQTaxAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTaxAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTaxAccountWACCOUNTID_1: TIntegerField
      FieldName = 'WACCOUNTID_1'
      Required = True
    end
    object ZQTaxAccountSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 30
    end
    object ZQTaxAccountDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object ZQTaxAccountDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object ZQTaxAccountFRATE: TFloatField
      FieldName = 'FRATE'
    end
    object ZQTaxAccountDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object ZQTaxAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQTaxAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQTaxAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object ZQContraAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from account where SAccountCode = :SAccountCode')
    BeforeOpen = InitOnAccountid
    Left = 32
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SAccountCode'
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
    object ZQContraAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQContraAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQContraAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object ZQBatchControl: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from batcon where wbatchid = -1')
    UpdateObject = ZUSQLBatcon
    BeforeOpen = InitBatControl
    AfterInsert = ZQBatchControlAfterInsert
    Left = 264
    Top = 168
    object ZQBatchControlWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQBatchControlWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQBatchControlWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQBatchControlSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object ZQBatchControlBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQBatchControlBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object ZQBatchControlBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object ZQBatchControlWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object ZQBatchControlSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object ZQBatchControlWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQBatchControlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQBatchControlWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object ZQBatchControlSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object ZQBatchControlSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
  end
  object ZUSQLBatcon: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO batcon'
      
        '  (batcon.WBATCHID, batcon.WUSERID, batcon.WBATCHTYPEID, batcon.' +
        'SBATCHNUMBER, '
      
        '   batcon.BPOSTED, batcon.BIMPORTED, batcon.BDOCSOURCE, batcon.W' +
        'LINECOUNT, '
      
        '   batcon.SFILENAME, batcon.WDOCID, batcon.DSYSDATE, batcon.WINI' +
        'TBATID, '
      '   batcon.SALIAS, batcon.SUNIQUEID)'
      'VALUES'
      
        '  (:WBATCHID, :WUSERID, :WBATCHTYPEID, :SBATCHNUMBER, :BPOSTED, ' +
        ':BIMPORTED, '
      
        '   :BDOCSOURCE, :WLINECOUNT, :SFILENAME, :WDOCID, :DSYSDATE, :WI' +
        'NITBATID, '
      '   :SALIAS, :SUNIQUEID)')
    DeleteSQL.Strings = (
      'DELETE FROM batcon'
      'WHERE'
      '  batcon.WBATCHID = :OLD_WBATCHID')
    ModifySQL.Strings = (
      'UPDATE batcon SET'
      '  batcon.WBATCHID = :WBATCHID,'
      '  batcon.WUSERID = :WUSERID,'
      '  batcon.WBATCHTYPEID = :WBATCHTYPEID,'
      '  batcon.SBATCHNUMBER = :SBATCHNUMBER,'
      '  batcon.BPOSTED = :BPOSTED,'
      '  batcon.BIMPORTED = :BIMPORTED,'
      '  batcon.BDOCSOURCE = :BDOCSOURCE,'
      '  batcon.WLINECOUNT = :WLINECOUNT,'
      '  batcon.SFILENAME = :SFILENAME,'
      '  batcon.WDOCID = :WDOCID,'
      '  batcon.DSYSDATE = :DSYSDATE,'
      '  batcon.WINITBATID = :WINITBATID,'
      '  batcon.SALIAS = :SALIAS,'
      '  batcon.SUNIQUEID = :SUNIQUEID'
      'WHERE'
      '  batcon.WBATCHID = :OLD_WBATCHID')
    Left = 264
    Top = 224
  end
  object ZUSQLOILinks: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO OILinks'
      '  (OILinks.WOILINKSID, OILinks.DDOCDATE, OILinks.SREFERENCE, '
      'OILinks.SLINKEDREFERENCE, '
      '   OILinks.WFULLAMOUNT, OILinks.WOUTSTANDINGAMOUNT, '
      'OILinks.WLINKEDAMOUNT, '
      '   OILinks.DDATE, OILinks.UNUSED1, '
      'OILinks.WAMOUNTTRANSACTIONID, '
      'OILinks.WLINKTRANSACTIONID, '
      '   OILinks.WUSERID, OILinks.UNUSED2, OILinks.WBATCHID, '
      'OILinks.WACCOUNTID, '
      '   OILinks.WTAXID, OILinks.DSYSDATE)'
      'VALUES'
      '  (:WOILINKSID, :DDOCDATE, :SREFERENCE, :SLINKEDREFERENCE, '
      ':WFULLAMOUNT, '
      '   :WOUTSTANDINGAMOUNT, :WLINKEDAMOUNT, :DDATE, '
      ':UNUSED1, :WAMOUNTTRANSACTIONID, '
      '   :WLINKTRANSACTIONID, :WUSERID, :UNUSED2, :WBATCHID, '
      ':WACCOUNTID, :WTAXID, '
      '   :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM OILinks'
      'WHERE'
      '  OILinks.WOILINKSID = :OLD_WOILINKSID')
    ModifySQL.Strings = (
      'UPDATE OILinks SET'
      '  OILinks.WOILINKSID = :WOILINKSID,'
      '  OILinks.DDOCDATE = :DDOCDATE,'
      '  OILinks.SREFERENCE = :SREFERENCE,'
      '  OILinks.SLINKEDREFERENCE = :SLINKEDREFERENCE,'
      '  OILinks.WFULLAMOUNT = :WFULLAMOUNT,'
      '  OILinks.WOUTSTANDINGAMOUNT = :WOUTSTANDINGAMOUNT,'
      '  OILinks.WLINKEDAMOUNT = :WLINKEDAMOUNT,'
      '  OILinks.DDATE = :DDATE,'
      '  OILinks.UNUSED1 = :UNUSED1,'
      '  OILinks.WAMOUNTTRANSACTIONID = :WAMOUNTTRANSACTIONID,'
      '  OILinks.WLINKTRANSACTIONID = :WLINKTRANSACTIONID,'
      '  OILinks.WUSERID = :WUSERID,'
      '  OILinks.UNUSED2 = :UNUSED2,'
      '  OILinks.WBATCHID = :WBATCHID,'
      '  OILinks.WACCOUNTID = :WACCOUNTID,'
      '  OILinks.WTAXID = :WTAXID,'
      '  OILinks.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  OILinks.WOILINKSID = :OLD_WOILINKSID')
    Left = 360
    Top = 64
  end
  object ZQOILinks: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'SELECT * FROM OILinks')
    UpdateObject = ZUSQLOILinks
    BeforeOpen = InitIoLinks
    AfterInsert = ZQOILinksAfterInsert
    Left = 360
    Top = 8
    object ZQOILinksWOILINKSID: TIntegerField
      FieldName = 'WOILINKSID'
    end
    object ZQOILinksDDOCDATE: TDateTimeField
      FieldName = 'DDOCDATE'
    end
    object ZQOILinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQOILinksSLINKEDREFERENCE: TStringField
      FieldName = 'SLINKEDREFERENCE'
      Size = 15
    end
    object ZQOILinksWFULLAMOUNT: TFloatField
      FieldName = 'WFULLAMOUNT'
    end
    object ZQOILinksWOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'WOUTSTANDINGAMOUNT'
    end
    object ZQOILinksWLINKEDAMOUNT: TFloatField
      FieldName = 'WLINKEDAMOUNT'
    end
    object ZQOILinksDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQOILinksUNUSED1: TIntegerField
      FieldName = 'UNUSED1'
    end
    object ZQOILinksWAMOUNTTRANSACTIONID: TIntegerField
      FieldName = 'WAMOUNTTRANSACTIONID'
    end
    object ZQOILinksWLINKTRANSACTIONID: TIntegerField
      FieldName = 'WLINKTRANSACTIONID'
    end
    object ZQOILinksWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQOILinksUNUSED2: TIntegerField
      FieldName = 'UNUSED2'
    end
    object ZQOILinksWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object ZQOILinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQOILinksWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQOILinksDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZQTaxOnId: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select * from Account,tax where Account.waccountId = tax.WAccoun' +
        'tId and tax.waccountId =:waccountId and WAccountTypeId =4')
    BeforeOpen = InitOn1Is0
    Left = 32
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'waccountId'
      end>
    object ZQTaxOnIdWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTaxOnIdSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQTaxOnIdSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQTaxOnIdSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQTaxOnIdSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQTaxOnIdWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQTaxOnIdWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQTaxOnIdWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQTaxOnIdBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQTaxOnIdBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQTaxOnIdDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTaxOnIdWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTaxOnIdWACCOUNTID_1: TIntegerField
      FieldName = 'WACCOUNTID_1'
      Required = True
    end
    object ZQTaxOnIdSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 30
    end
    object ZQTaxOnIdDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object ZQTaxOnIdDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object ZQTaxOnIdFRATE: TFloatField
      FieldName = 'FRATE'
    end
    object ZQTaxOnIdDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object ZQTaxOnIdBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQTaxOnIdBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQTaxOnIdWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object ZQRTaxRates: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select a.WAccountId,a.Frate,a.BLinkContra from tax a where a.WAc' +
        'countid = :a'
      'union'
      
        'select b.WAccountId,b.FRate,a.BLinkContra from TAX a join tax b ' +
        'on'
      '(a.WLinkTaxID = b.WaccountId) where a.WaccountId = :b')
    Left = 360
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'a'
      end
      item
        DataType = ftUnknown
        Name = 'b'
      end>
    object ZQRTaxRatesWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQRTaxRatesFRATE: TFloatField
      FieldName = 'FRATE'
    end
    object ZQRTaxRatesBLINKCONTRA: TSmallintField
      FieldName = 'BLINKCONTRA'
    end
  end
  object ZQBatchTypes: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from battypes')
    UpdateObject = ZUSQLBatchTypes
    BeforeOpen = ZQGenQueryBeforeOpen
    Left = 348
    Top = 116
    object ZQBatchTypesWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQBatchTypesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object ZQBatchTypesBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object ZQBatchTypesWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object ZQBatchTypesBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object ZQBatchTypesBINCREMENTREFNO: TSmallintField
      FieldName = 'BINCREMENTREFNO'
    end
    object ZQBatchTypesBREPEATDETAILS: TSmallintField
      FieldName = 'BREPEATDETAILS'
    end
    object ZQBatchTypesBCONSOLIDATEBALANCING: TSmallintField
      FieldName = 'BCONSOLIDATEBALANCING'
    end
    object ZQBatchTypesWDEBITCREDIT: TIntegerField
      FieldName = 'WDEBITCREDIT'
    end
    object ZQBatchTypesWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object ZQBatchTypesWDEFAULTTAXID: TIntegerField
      FieldName = 'WDEFAULTTAXID'
    end
    object ZQBatchTypesBVIEWEXCLUSIVE: TSmallintField
      FieldName = 'BVIEWEXCLUSIVE'
    end
    object ZQBatchTypesBLINKOI: TSmallintField
      FieldName = 'BLINKOI'
    end
    object ZQBatchTypesBINCLUSIVEMODE: TSmallintField
      FieldName = 'BINCLUSIVEMODE'
    end
    object ZQBatchTypesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZUSQLBatchTypes: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO battypes'
      
        '  (battypes.WBATCHTYPEID, battypes.SDESCRIPTION, battypes.BCASHB' +
        'OOK, battypes.WCONTRAACCOUNTID, '
      
        '   battypes.BCONTRAPERLINE, battypes.BINCREMENTREFNO, battypes.B' +
        'REPEATDETAILS, '
      
        '   battypes.BCONSOLIDATEBALANCING, battypes.WDEBITCREDIT, battyp' +
        'es.WPAYMENTGROUPID, '
      
        '   battypes.WDEFAULTTAXID, battypes.BVIEWEXCLUSIVE, battypes.BLI' +
        'NKOI, battypes.BINCLUSIVEMODE, '
      '   battypes.DSYSDATE)'
      'VALUES'
      
        '  (:WBATCHTYPEID, :SDESCRIPTION, :BCASHBOOK, :WCONTRAACCOUNTID, ' +
        ':BCONTRAPERLINE, '
      
        '   :BINCREMENTREFNO, :BREPEATDETAILS, :BCONSOLIDATEBALANCING, :W' +
        'DEBITCREDIT, '
      
        '   :WPAYMENTGROUPID, :WDEFAULTTAXID, :BVIEWEXCLUSIVE, :BLINKOI, ' +
        ':BINCLUSIVEMODE, '
      '   :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM battypes'
      'WHERE'
      '  battypes.WBATCHTYPEID = :OLD_WBATCHTYPEID')
    ModifySQL.Strings = (
      'UPDATE battypes SET'
      '  battypes.WBATCHTYPEID = :WBATCHTYPEID,'
      '  battypes.SDESCRIPTION = :SDESCRIPTION,'
      '  battypes.BCASHBOOK = :BCASHBOOK,'
      '  battypes.WCONTRAACCOUNTID = :WCONTRAACCOUNTID,'
      '  battypes.BCONTRAPERLINE = :BCONTRAPERLINE,'
      '  battypes.BINCREMENTREFNO = :BINCREMENTREFNO,'
      '  battypes.BREPEATDETAILS = :BREPEATDETAILS,'
      '  battypes.BCONSOLIDATEBALANCING = '
      ':BCONSOLIDATEBALANCING,'
      '  battypes.WDEBITCREDIT = :WDEBITCREDIT,'
      '  battypes.WPAYMENTGROUPID = :WPAYMENTGROUPID,'
      '  battypes.WDEFAULTTAXID = :WDEFAULTTAXID,'
      '  battypes.BVIEWEXCLUSIVE = :BVIEWEXCLUSIVE,'
      '  battypes.BLINKOI = :BLINKOI,'
      '  battypes.BINCLUSIVEMODE = :BINCLUSIVEMODE,'
      '  battypes.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  battypes.WBATCHTYPEID = :OLD_WBATCHTYPEID')
    Left = 360
    Top = 176
  end
  object ZQBatch: TUniQuery
    DataTypeMap = <>
    BeforeOpen = ZQGenQueryBeforeOpen
    Left = 256
    Top = 8
  end
  object ZUSQLBatch: TUniUpdateSQL
    Left = 256
    Top = 56
  end
  object ZSQLProc: TUniScript
    Delimiter = '^'
    OnError = ZSQLProcError
    AutoCommit = True
    Left = 444
    Top = 104
  end
  object ZSQLGenProccessor: TUniScript
    OnError = ZSQLGenProccessorError
    AutoCommit = True
    Left = 452
    Top = 40
  end
  object tblUser: TUniTable
    TableName = 'users'
    DataTypeMap = <>
    Left = 264
    Top = 280
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Left = 376
    Top = 288
  end
  object ZQOILINKSPRE: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select * from oilinkspre where WbatchId = :Wbatchid and Wlineid ' +
        '=:WLINEID')
    UpdateObject = ZUSQLLinksPre
    Left = 476
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Wbatchid'
      end
      item
        DataType = ftUnknown
        Name = 'WLINEID'
      end>
    object ZQOILINKSPREWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQOILINKSPREWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQOILINKSPREWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQOILINKSPREWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQOILINKSPREFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
  end
  object ZUSQLLinksPre: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO OILINKSPRE'
      '  (WBATCHID, WLINEID, WBATCHTYPEID, WTRANSACTIONID, FAMOUNT)'
      'VALUES'
      
        '  (:WBATCHID, :WLINEID, :WBATCHTYPEID, :WTRANSACTIONID, :FAMOUNT' +
        ')')
    DeleteSQL.Strings = (
      'DELETE FROM OILINKSPRE'
      'WHERE'
      
        '  WBATCHID = :Old_WBATCHID AND WLINEID = :Old_WLINEID AND WTRANS' +
        'ACTIONID = :Old_WTRANSACTIONID AND WBATCHTYPEID = :Old_WBATCHTYP' +
        'EID')
    ModifySQL.Strings = (
      'UPDATE OILINKSPRE'
      'SET'
      
        '  WBATCHID = :WBATCHID, WLINEID = :WLINEID, WBATCHTYPEID = :WBAT' +
        'CHTYPEID, WTRANSACTIONID = :WTRANSACTIONID, FAMOUNT = :FAMOUNT'
      'WHERE'
      
        '  WBATCHID = :Old_WBATCHID AND WLINEID = :Old_WLINEID AND WTRANS' +
        'ACTIONID = :Old_WTRANSACTIONID AND WBATCHTYPEID = :Old_WBATCHTYP' +
        'EID')
    RefreshSQL.Strings = (
      
        'SELECT WBATCHID, WLINEID, WBATCHTYPEID, WTRANSACTIONID, FAMOUNT ' +
        'FROM OILINKSPRE'
      'WHERE'
      
        '  WBATCHID = :WBATCHID AND WLINEID = :WLINEID AND WTRANSACTIONID' +
        ' = :WTRANSACTIONID AND WBATCHTYPEID = :WBATCHTYPEID')
    Left = 472
    Top = 228
  end
end
